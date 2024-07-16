package com.booles.gestionvoiture;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.booles.gestionvoiture.DataBase;
import com.booles.gestionvoiture.Utilisateur;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String emailInput = request.getParameter("email");
        String passwordInput = request.getParameter("password");
        Utilisateur user = null;
        Connection connexion = null;
        try {
            user=authenticate(emailInput,passwordInput);
            if (user!=null){
                connexion=DataBase.getConnection();
                HttpSession session = request.getSession();
                session.setAttribute("user",user);
                if (user.getRole().equals("chef")){
                    request.getRequestDispatcher("chef.jsp").forward(request, response);
                }else if (user.getRole().equals("gestionnaire")){
                    request.getRequestDispatcher("gestionnaire.jsp").forward(request, response);
                }
            }else {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
   private Utilisateur authenticate(String email, String password) throws SQLException{
        Utilisateur user = null;
        Connection connexion = DataBase.getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "SELECT * FROM Utilisateur WHERE email = ? AND password = ?";
        statement = connexion.prepareStatement(query);
        statement.setString(1, email);
        statement.setString(2, password);
        rs = statement.executeQuery();
        if (rs.next()){
            user = new Utilisateur();
            user.setNom(rs.getString("nom"));
            user.setPassword(rs.getString("password"));
            user.setRole(rs.getString("role"));
            user.setEmail(rs.getString("email"));
        }
        return user;
    }



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
