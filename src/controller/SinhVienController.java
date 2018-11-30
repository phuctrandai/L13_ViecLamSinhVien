package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.SinhVienBean;
import bean.TaiKhoanBean;
import bean.ThongTinViecLamBean;
import bo.SinhVienBo;
import bo.TruongBo;

/**
 * Servlet implementation class SinhVien
 */
//@WebServlet(name = "SinhVienController", urlPatterns = { "/sinhVien" })
//@WebServlet("sinhVien")
public class SinhVienController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SinhVienController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		Object taiKhoan = request.getSession().getAttribute("taiKhoan");
		String command = request.getParameter("command");
		
		if(taiKhoan != null) {
			if(command == null) {
				XemThongTinSinhVien(request, response);
				return;
			}
			else {
				switch(command) {
				case "capNhat": {
					CapNhatThongTin(request, response);
					return;
				}
				case "chinhSua": {
					ChinhSuaThongTinSinhVien(request, response);
					return;
				}
				default: break;
				}
			}
		}
		else {
			response.sendRedirect("taiKhoan");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void XemThongTinSinhVien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maTaiKhoan = ((TaiKhoanBean) request.getSession().getAttribute("taiKhoan")).getMaTaiKhoan();
		
		SinhVienBean sv = GetSinhVienTheoTaiKhoan(maTaiKhoan);
		request.setAttribute("sinhVien", sv);
		request.getRequestDispatcher("thongTinSinhVien.jsp").forward(request, response);
	}
	
	private void ChinhSuaThongTinSinhVien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maTaiKhoan = ((TaiKhoanBean) request.getSession().getAttribute("taiKhoan")).getMaTaiKhoan();
		
		SinhVienBean sv = GetSinhVienTheoTaiKhoan(maTaiKhoan);
		TruongBo tb = new TruongBo();
		
		try {
			request.setAttribute("danhSachTruong", tb.GetDanhSach());
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("sinhVien", sv);
		request.getRequestDispatcher("khaiBaoSinhVien.jsp").forward(request, response);
	}
	
	private SinhVienBean GetSinhVienTheoTaiKhoan(int maTaiKhoan) {
		SinhVienBo svb = new SinhVienBo();
		SinhVienBean sv = null;
		try {
			sv = svb.GetSinhVienTheoTaiKhoan(maTaiKhoan);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return sv;
	}
	
	private void CapNhatThongTin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tinhTrangViecLam = request.getParameter("tinhTrangViecLam");
		int maSinhVien = Integer.parseInt(request.getParameter("maSinhVien"));
		
		SinhVienBo svb = new SinhVienBo();
		
		if(tinhTrangViecLam.equals("dangDiLam")) {
			String 	tenCongViec = request.getParameter("tenCongViec"),
					viTriCongTac = request.getParameter("viTriCongTac"),
					tenCoQuan = request.getParameter("tenCoQuan"),
					diaChiCoQuan = request.getParameter("diaChiCoQuan"),
					mucDoPhuHopChuyenMon = request.getParameter("mucDoPhuHopChuyenMon"),
					mucDoDapUngKTCM = request.getParameter("mucDoDapUngKTCM"),
					loaiHinhCoQuan = request.getParameter("loaiHinhCoQuan");
			
			LocalDate 	thoiGianBatDauLamViec = LocalDate.parse(
													request.getParameter("thoiGianBatDauLamViec"), 
													DateTimeFormatter.ofPattern("yyyy-MM-dd")
												);
			long mucThuNhapTBThang = Long.parseLong(request.getParameter("mucThuNhapTBThang"));
			ThongTinViecLamBean thongTin = new ThongTinViecLamBean(
					tenCongViec, 
					viTriCongTac, 
					tenCoQuan, 
					diaChiCoQuan, 
					loaiHinhCoQuan, 
					thoiGianBatDauLamViec, 
					mucDoPhuHopChuyenMon, 
					mucDoDapUngKTCM,
					mucThuNhapTBThang
			);
			try {
				svb.UpdateThongTinViecLam(maSinhVien, thongTin);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		else if(tinhTrangViecLam.equals("dangHocNangCao")) {
			
		}
		else {
			try {
				svb.UpdateThongTinViecLam(maSinhVien, true);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
}
