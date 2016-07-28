package controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import validators.UserValidator;
import dao.BookDao;
import dao.UserDao;
import entity.Books;
import entity.Users;
import entity.UsersBooks;

@Controller
public class LibraryController {
    @Autowired
    private BookDao b;
    @Autowired
    private UserDao u;

@ModelAttribute("roles")
public List<String> populate(){
    List<String> roles=new ArrayList<String>();
    roles.add("Student");
    roles.add("LibraryStaff");
    return roles;
    
}
    @RequestMapping(value = "/viewBooks.do")
    public String viewBooks(@RequestParam("book") int book,Model model) {
        List<Books> books = b.getAllBooks();
        if(book==0){
            Collections.sort(books);++book;
            model.addAttribute("book", book);
        }
        else if(book==1){
            Collections.sort(books, new Comparator<Books>(){

                @Override
                public int compare(Books b1, Books b2) {
                    // TODO Auto-generated method stub
                    return b2.getBname().compareTo(b1.getBname());
                }});
            --book;
            model.addAttribute("book", book);
        }
        model.addAttribute("books", books);
        return "viewBooks";
    }

    @RequestMapping(value = "/addBooks.do")
    public String addBooks(Model model) {
        Books book = new Books();
        book.setAuthor("enter author name");
        model.addAttribute("book", book);
        return "addbooks";

    }

    @RequestMapping(value = "/addBookToDb.do")
    public String persistBook(@ModelAttribute("book") Books book,Model model) {
        b.addBooks(book);
        List<Books> books = b.getAllBooks();
        model.addAttribute("books", books);
        return "viewBooks";

    }

    @RequestMapping(value = "/initLogin.do")
    public String initlogin(Model model) {
        Users user = new Users();
        user.setUname("enter the username");
        user.setPwd(".......");
        model.addAttribute("user", user);
        return "login";
    }

    @RequestMapping(value = "/login.do")
    public String goToLogin(@RequestParam("bid") int bid, HttpSession s,
            Model model) {
        s.setAttribute("bid", bid);

        if (s.getAttribute("user") == null) {
            Users user = new Users();
            user.setUname("enter the username");
            user.setPwd(".......");
            model.addAttribute("user", user);
            return "login";
        } else {
            s.setAttribute("book", b.getBookById(bid));
            return "home";
        }
    }

    @RequestMapping(value = "/register.do")
    public String goToRegistration(Model model) {
        Users user = new Users();
        user.setUname("enter the username");
        user.setPwd(".......");
        user.setPhoneNo("+91-");
        model.addAttribute("user", user);
        return "registration";

    }

    @RequestMapping(value = "/adduser.do")
    public String register(@ModelAttribute("user") Users user,
            BindingResult errors, Model model) {
        UserValidator uv = new UserValidator();
        uv.validate(user, errors);
        if (errors.hasErrors()) {
            return "registration";
        } else {
            try {
                u.addUser(user);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                model.addAttribute("msg", "User already exists");
                return "login";

            }
            model.addAttribute("msg", "registration is successfully done");
            return "login";
        }
    }

    @RequestMapping(value = "/check.do")
    public String validateUser(@RequestParam("bid") String bid,
            @ModelAttribute("user") Users user, BindingResult errors,
            HttpServletRequest req, Model model) {
        Users us=u.getUser(user.getUname());
        UserValidator uv = new UserValidator();
        uv.validate(user, errors);
        if (errors.hasErrors()) {
            return "login";
        }
        if (u.checkUser(user)) {
            HttpSession session = req.getSession(true);
            session.setAttribute("user", us);
            if (bid != "") {
                session.setAttribute("book",
                        b.getBookById(Integer.parseInt(bid)));
            }
            return "home";
        }else{
            model.addAttribute("msg", "Invalid username and password");
            return "login";
        }
        

    }
    @RequestMapping(value = "/addToMyList.do")
    public String addToMyList(HttpSession session, Model model) {
        Users ur = (Users) session.getAttribute("user");
        Books book = (Books) session.getAttribute("book");
        List<Books> books=u.getMyBooks(ur.getUname());
        if(books != null &&  !(books.contains(book))){
            u.requestBook(ur,book);
            model.addAttribute("emsg1", "Request for Book issue is sent");
            return "home";
        }else{
            model.addAttribute("emsg1", "Already book exist in your list");
            return "home";
        }
        
    }


    @RequestMapping(value = "/getmyBookList.do")
    public String getMyBooks(HttpSession session) {
        Users ur = (Users) session.getAttribute("user");
        List<UsersBooks> bList = u.getMyBooklist(ur.getUname());
    
        session.setAttribute("booklist", bList);
        return "myBookList";
    }

    @RequestMapping(value = "/logout.do")
    public String logout(HttpSession s) {
        s.invalidate();
        return "index";
    }

    @RequestMapping(value = "/return.do")
    public String returnBook(HttpSession s, HttpServletRequest req) {
        Users ur = (Users) s.getAttribute("user");
        int bid = Integer.parseInt(req.getParameter("bid"));
        Books book = b.getBookById(bid);        
        u.removeBook(bid, ur.getUname());
        book.setQuantity(book.getQuantity() + 1);
        b.addBooks(book);
        return "redirect:getmyBookList.do";
    }
    
    @RequestMapping(value="/issued.do")
    public String issuedBooks(Model model){
        model.addAttribute("issuedBooks",u.getissuedList());
        return "issuedBooks";
        
    }
    @RequestMapping(value="/getRequestBookList.do")
    public String getRequestBookList(HttpSession s){
        s.setAttribute("requestList", u.getRequestList());
        return "requestList";
        
    }
    @RequestMapping(value="/search.do")
        public String gotosearch(){
            return "searchbooks";
        }
//  @RequestMapping(value="/sort.do")
//  public String sortBooksByNames(HttpServletRequest req,Model model){
//      String[] books=req.getParameterValues("books");
//      List<Books> b=new ArrayList<Books>();
//      for (String book : books) {
//          b.add(book);
//      }
//      Collections.sort(books);
//      model.addAttribute("books", books);
//      return "viewBooks";
//  }
    
    @RequestMapping(value="/approve.do")
    public String approveRequest(@RequestParam("uname") String uname,@RequestParam("book") int bid){
        UsersBooks ub=new UsersBooks();
        Books book=b.getBookById(bid);
        ub.setBook(book);
        ub.setUser(u.getUser(uname));
        ub.setIssuedDate(new Date());
        ub.setReturnDate(new Date(ub.getIssuedDate().getYear(),ub.getIssuedDate().getMonth(),ub.getIssuedDate().getDate()+5));
        u.addApprovals(ub);
        book.setQuantity(book.getQuantity()-1);
        b.addBooks(book);
        u.removeRequest(uname,bid);
        return "redirect:issued.do";
        
    }
    @RequestMapping(value="/searchBooks.do")
    public String searchBooks(@RequestParam("bname") String bname,@RequestParam("author") String author, Model model){
        
        if(bname=="" && author==""){
            List<Books> books=b.getAllBooks();
            model.addAttribute("books", books);
        }
        else if(bname!="" && author==""){
            List<Books> books=b.searchBooks(bname);
            model.addAttribute("books", books);
        }else if(author!="" && bname==""){
            List<Books> books=b.searchBooksBy(author);
            model.addAttribute("books", books);
        }
        else{
            List<Books> books=b.searchBooks(bname, author);
            model.addAttribute("books", books);
        }
        
        return "viewBooks";
        
    }
@RequestMapping(value="/details.do")
public String printDetails(@RequestParam("uname")String uname,HttpSession s,Model model){
    Users user=u.getUser(uname);
    s.setAttribute("u", user);
    List<UsersBooks> issuedBooks= u.getMyBooklist(uname);
    if(!issuedBooks.isEmpty()){
    model.addAttribute("issuedBooks", issuedBooks);
    }
    else{
        model.addAttribute("msg", "Books are not issued");
    }
    return "myDetails";
    
}
}
