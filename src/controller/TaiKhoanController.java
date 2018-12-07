package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.LoaiTaiKhoanBean;
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
		
		try {
			ArrayList<LoaiTaiKhoanBean> listLoai = taiKhoanBo.getListLoai();
			request.setAttribute("listLoai", listLoai);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
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
					return;
				}
				case "info": {
					request.getRequestDispatcher("thongTinTaiKhoan.jsp").forward(request, response);
					return;
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
		int maLoai = Integer.parseInt(request.getParameter("maLoai"));
				
		try {
			TaiKhoanBean taiKhoanBean = taiKhoanBo.getTaiKhoan(tenTaiKhoan, matKhau, maLoai);
			if(taiKhoanBean != null) {
				request.getSession().setAttribute("taiKhoan", taiKhoanBean);
				switch(maLoai) {
				case 1: {
					response.sendRedirect("truong");
					return;
				}
				case 2: {
					response.sendRedirect("sinhVien");
					return;
				}
				case 3: {
					
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
