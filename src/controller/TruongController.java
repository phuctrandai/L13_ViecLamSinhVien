package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.TruongBean;
import bo.TruongBo;

/**
 * Servlet implementation class KhaiBaoTruong
 */
@WebServlet("/truong")
public class TruongController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TruongController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
						
		String command = request.getParameter("command");
		if(command != null) {
			switch(command) {
			case "add": {
				request.getRequestDispatcher("khaiBaoTruong.jsp").forward(request, response);
				break;
			}
			case "save": {
				add(request, response);
				request.getRequestDispatcher("quanLyTruong.jsp").forward(request, response);
				break;
			}
			case "xoaTruong": {
				xoaTruong(request, response);
				request.getRequestDispatcher("truong").forward(request, response);
				break;
			}
			default: break;
			}
		}
		else {
			TruongBo tb = new TruongBo();
			try {
				ArrayList<TruongBean> danhSachTruong = tb.GetDanhSach();
				request.setAttribute("danhSachTruong", danhSachTruong);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("quanLyTruong.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TruongBo truong = new TruongBo();
		try {
			String matruong = request.getParameter("txtmatruong");
			String tentruong = request.getParameter("txttentruong");
			String diachi = request.getParameter("txtdiachi");
			String loaitruong = request.getParameter("txtloaitruong");
			String email = request.getParameter("txtemail");
			String loaihinh = request.getParameter("txtloaihinh");
			String sdt = request.getParameter("txtsdt");
			String sofax = request.getParameter("txtsofax");
			String tinhthanhtructhuoc = request.getParameter("txttinhthanhtructhuoc");
			String website = request.getParameter("txtwebsite");
			
			if(request.getParameter("save") !=null)
			{
				System.out.println("Them thanh cong ");
				truong.KhaiBaoTruong(matruong, tentruong, loaihinh, loaitruong, tinhthanhtructhuoc, diachi, sdt, sofax, email, website);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void xoaTruong(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TruongBo tb = new TruongBo();
		String maTruong = request.getParameter("maTruong");
		try {
			tb.XoaTruong(maTruong);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
