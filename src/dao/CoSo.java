package dao;
import java.sql.*;
public class CoSo {
   public Connection cn;
   public void KetNoi() throws Exception{
	   //Xac dinh hqtcsdl
	   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	   System.out.println("Da xac dinh hqtcsdl");
	   cn  = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-CC9PRQL\\\\SQLEXPRESS:1433;databaseName=RUP_ViecLamSinhVien;user=sa; password=321654987123456");
		System.out.println("Da ket noi");
   }
}
