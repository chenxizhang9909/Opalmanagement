/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.iotbay.dao;

import java.sql.Connection;
/**
 *
 * @author bababab
 */
public abstract class DB {
    protected String URL = "jdbc:derby://localhost:1527/";//replace this string with your jdbc:derby local host url   
    protected String db = "Yuanwei";//name of the database   
    protected String dbuser = "yuanwei";//db root user   
    protected String dbpass = "Ssun1998"; //db root password   
    protected String driver = "org.apache.derby.jdbc.ClientDriver"; //jdbc client driver - built in with NetBeans   
    protected Connection conn; //connection null-instance to be initialized in sub-classes
}
