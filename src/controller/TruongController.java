package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
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
			
			 RequestDispatcher rd= request.getRequestDispatcher("khaiBaoTruong.jsp");
			   rd.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
