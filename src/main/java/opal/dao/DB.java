/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package opal.dao;

import java.sql.Connection;
/**
 *
 * @author bababab
 */
public abstract class DB {
   
   protected String URL ="jdbc:mysql://myopalcardserver.mysql.database.azure.com:3306/opal?useSSL=false&requireSSL=false";
    protected String dbuser = "opalcardadmin@myopalcardserver";//db root user
    protected String dbpass = "0000opalcard!"; //db root password
   protected String driver = "com.mysql.jdbc.Driver"; //jdbc client driver - built in with NetBeans
     //protected String driver ="myopalcardserver.mysql.database.azure.com";   
   
//   protected String URL ="jdbc:mysql://localhost:3306/";
//    protected String db = "Opal";//name of the database
//    protected String dbuser = "root";//db root user
//    protected String dbpass = "0000"; //db root password
//   protected String driver = "com.mysql.jdbc.Driver"; 
}
