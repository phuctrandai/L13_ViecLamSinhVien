package controller;

import java.io.IOException;
import java.util.ArrayList;

import bean.NganhDaoTaoBean;
import bo.NganhDaoTaoBo;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NganhDaoTaoController
 */
@WebServlet(name = "NganhDaoTaoController", urlPatterns = { "/nganhDaoTao" })
//@WebServlet("nganhDaoTao")
public class NganhDaoTaoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NganhDaoTaoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String matruong="BKA";
			HienThiNganh(request, response, matruong);
			RequestDispatcher rd = request.getRequestDispatcher("nganhDaoTao.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			response.getWriter().println(e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	void HienThiNganh(HttpServletRequest request, HttpServletResponse response,String matruong) throws Exception{
		NganhDaoTaoBo nganh= new NganhDaoTaoBo();
		ArrayList<NganhDaoTaoBean> listn= nganh.getNganhDT(matruong);
		request.setAttribute("listn", listn);
	}

}
