package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import model.Order;
import util.DBConnection;

public class OrderDao {

    public static boolean saveOrder(Order order){

        boolean status = false;

        try{

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO orders(name,email,phone,address,payment_method,card_number) VALUES(?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, order.getName());
            ps.setString(2, order.getEmail());
            ps.setString(3, order.getPhone());
            ps.setString(4, order.getAddress());
            ps.setString(5, order.getPayment());
            ps.setString(6, order.getCardNumber());

            ps.executeUpdate();

            status = true;

        }catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }
}
