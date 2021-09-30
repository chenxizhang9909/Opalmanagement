/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package opal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import opal.entity.OpalCard;

/**
 *
 * @author chengming
 */
public class CardManagementDao {
    
    private Connection conn;
    public CardManagementDao() throws ClassNotFoundException, SQLException {
        conn = (new DBConnector()).openConnection();
    }
    public void AddCard(OpalCard opalCard) {
        try {
            PreparedStatement ps = conn.prepareStatement("insert into payment(userId, orderId, amount, cardnumber,nameoncard,exdate,code) values(?, ?, ?, ?, ?, ?, ?)");
            ps.setInt(1, opalCard.getCardNo());
            ps.setInt(2, opalCard.getsecurityCode());
            ps.setString(3, opalCard.getnickname());
            ps.setString(4, opalCard.getcardType());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
