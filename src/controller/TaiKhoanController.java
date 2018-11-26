package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.TaiKhoanBean;
import bo.TaiKhoanBo;

/**
 * Servlet implementation class TaiKhoanController
 */
@WebServlet("/taiKhoan")
public class TaiKhoanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private TaiKhoanBo taiKhoanBo;
    
    public TaiKhoanController() {
        super();
        taiKhoanBo = new TaiKhoanBo();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String command = request.getParameter("command");
		if(command != null) {
			if(command.equals("login")) {
				login(request, response);
				return;
			}
			else if(request.getSession().getAttribute("taiKhoan") != null) {
				switch(command) {
				case "logout": {
					request.getSession().removeAttribute("taiKhoan");
					request.getRequestDispatcher("login.jsp").forward(request, response);
					break;
				}
				case "info": {
					request.getRequestDispatcher("thongTinTaiKhoan.jsp").forward(request, response);
					break;
				}
				default: break;
				}
			}
		}
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tenTaiKhoan = request.getParameter("tenTaiKhoan");
		String matKhau = request.getParameter("matKhau");
		String loaiTaiKhoan = request.getParameter("loaiTaiKhoan");
		
		try {
			TaiKhoanBean taiKhoanBean = taiKhoanBo.getTaiKhoan(tenTaiKhoan, matKhau, loaiTaiKhoan);
			if(taiKhoanBean != null) {
				request.getSession().setAttribute("taiKhoan", taiKhoanBean);
				switch(loaiTaiKhoan) {
				case "Nhân viên": {
					response.sendRedirect("truong");
					return;
				}
				case "Sinh viên": {
					response.sendRedirect("sinhVien");
					return;
				}
				case "Quản trị": {
					
					break;
				}
				default: break;
				}
			}
			else {
				request.setAttribute("loginFail", true);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
