package dao;
import java.sql.*;
public class CoSo {
   public Connection cn;
   public void KetNoi() throws Exception{
	   //Xac dinh hqtcsdl
	   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	   System.out.println("Da xac dinh hqtcsdl");
	   cn  = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=RUP_ViecLamSinhVien;user=sa; password=0946901161");
		System.out.println("Da ket noi");
   }
}
