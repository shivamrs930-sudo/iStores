package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;
import util.DBConnection;

public class UserDao {

    Connection con;

    public UserDao() {

        try {
            con = DBConnection.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    // LOGIN USER
    public boolean loginUser(String email, String password) {

        boolean status = false;

        try {

            String query = "SELECT * FROM users WHERE email=? AND password=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // REGISTER USER
    public boolean registerUser(User user) {

        boolean status = false;

        try {

            String query = "INSERT INTO users(name,email,password) VALUES(?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());

            int row = ps.executeUpdate();

            if (row > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

}