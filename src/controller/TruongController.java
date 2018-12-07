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
		
		Object taiKhoan = request.getSession().getAttribute("taiKhoan");
		String command = request.getParameter("command");
		
		if(taiKhoan == null) {
			response.sendRedirect("taiKhoan");
		}
		else {
			if(command != null) {
				switch(command) {
				case "checkMaTruong": {
					// dung ajax
					try {
						checkMaTruong(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
					return;
				}
				case "add": {
					request.getRequestDispatcher("khaiBaoTruong.jsp").forward(request, response);
					return;
				}
				case "save": {
					// co su dung ajax
					save(request, response);
					return;
				}
				case "delete": {
					xoaTruong(request, response);
					break;
				}
				default: break;
				}
			}
			
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
	
	private void checkMaTruong(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String maTruong = request.getParameter("matruong");
		TruongBo tb = new TruongBo();
		TruongBean truong = tb.TimTheoMa(maTruong);
		if(truong == null) {
			response.getWriter().print("0");
		} else {
			response.getWriter().print("1");
		}
	}
	
	private void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TruongBo truong = new TruongBo();
		try {
			String matruong = request.getParameter("matruong");
			String tentruong = request.getParameter("tentruong");
			String diachi = request.getParameter("diachi");
			String loaitruong = request.getParameter("loaitruong");
			String email = request.getParameter("email");
			String loaihinh = request.getParameter("loaihinh");
			String sdt = request.getParameter("sdt");
			String sofax = request.getParameter("sofax");
			String tinhthanhtructhuoc = request.getParameter("tinhthanhtructhuoc");
			String website = request.getParameter("website");
			
			truong.KhaiBaoTruong(matruong, tentruong, loaihinh, loaitruong, tinhthanhtructhuoc, diachi, sdt, sofax, email, website);
			response.getWriter().print("1");
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
