/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Koneksi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class koneksi {
    public Connection conn;
    public Statement st;
    public ResultSet rs;

        public Connection connect(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            //System.out.println("berhasil konek");
        }catch(ClassNotFoundException e){
            System.out.println("gagal konek "+e);
        }
        String url = "jdbc:mysql://localhost/sparepart_mobil";
        try{
            conn = DriverManager.getConnection(url, "root","");
            //System.out.println("berhasil koneksi ke database");
        }catch(SQLException ex){
            System.out.println("gagal koneksi ke database "+ex);
        }
        return conn;
    }
}
