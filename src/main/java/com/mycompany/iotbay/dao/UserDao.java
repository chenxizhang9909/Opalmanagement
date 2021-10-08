/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.iotbay.dao;

import com.mycompany.iotbay.models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author bababab
 */
public class UserDao {

    private Connection conn;

    public UserDao() throws SQLException {
        DBConnector c;
        try {
            c = new DBConnector();
            conn = c.getConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Find user by email and password in the database   
    public User findUser(String email, String password) throws SQLException {
        PreparedStatement p = conn.prepareStatement("select * from users where email=? and password=?");
        p.setString(1, email);
        p.setString(2, password);
        ResultSet result = p.executeQuery();
        if (result.next()) {
            User user = new User();
            user.setId(result.getInt("id"));
            user.setFirstName(result.getString("firstName"));
            user.setLastName(result.getString("lastName"));
            user.setEmail(result.getString("email"));
            user.setPassword(result.getString("password"));
            user.setType(result.getString("type"));
            user.setBalance(result.getDouble("balance"));
            return user;
        }
        return null;
    }

//Add a user-data into the database   
    public void addUser(User user) throws SQLException {
        PreparedStatement p = conn.prepareStatement("insert into USERS(FIRSTNAME, LASTNAME, EMAIL, PASSWORD, TYPE, BALANCE) values(?, ?, ?, ?, ?, ?)");
        p.setString(1, user.getFirstName());
        p.setString(2, user.getLastName());
        p.setString(3, user.getEmail());
        p.setString(4, user.getPassword());
        p.setString(5, user.getType());
        p.setDouble(6, user.getBalance());
        p.executeUpdate();
    }

//update a user details in the database   
    public void updateUser(User user) throws SQLException {
        PreparedStatement p = conn.prepareStatement("update USERS set FIRSTNAME = ?, LASTNAME=?, EMAIL=?, PASSWORD=?, TYPE=?, BALANCE=?, where id = ?");
        p.setString(1, user.getFirstName());
        p.setString(2, user.getLastName());
        p.setString(3, user.getEmail());
        p.setString(4, user.getPassword());
        p.setString(5, user.getType());
        p.setDouble(6, user.getBalance());
        p.setInt(7, user.getId());
        p.executeUpdate();
    }

    //delete a user from the database   
    public void deleteUser(User user) throws SQLException {
        PreparedStatement p = conn.prepareStatement("delete from USERS where id = ?");
        p.setInt(1, user.getId());
        p.executeUpdate();
    }
}
