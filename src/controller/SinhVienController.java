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

import bean.DaoTaoNangCaoBean;
import bean.SinhVienBean;
import bean.TaiKhoanBean;
import bean.ThongTinTaiKhoanBean;
import bean.ThongTinViecLamBean;
import bo.NganhDaoTaoBo;
import bo.SinhVienBo;
import bo.TaiKhoanBo;
import bo.TruongBo;

/**
 * Servlet implementation class SinhVien
 */
@WebServlet("/sinhVien")
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
			}
			else {
				switch(command) {
				case "capNhat": {
					// co su dung ajax
					CapNhatThongTin(request, response);
					return;
				}
				case "chinhSua": {
					try {
						ChinhSuaThongTinSinhVien(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
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
	
	/*
	 * Chuyen den trang xem thong tin sinh vien
	 */
	private void XemThongTinSinhVien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maTaiKhoan = ((TaiKhoanBean) request.getSession().getAttribute("taiKhoan")).getMaTaiKhoan();
		SinhVienBo svb = new SinhVienBo();
		
		SinhVienBean sv = GetSinhVienTheoTaiKhoan(maTaiKhoan);
		try {
			int maLoai = sv.getThongTinViecLam() == null ? 0 : sv.getThongTinViecLam().getLoaiHinhCoQuan();
			request.setAttribute("loaiHinhCoQuan", svb.GetTenLoaiHinhCoQuan(maLoai));
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("sinhVien", sv);
		request.getRequestDispatcher("thongTinSinhVien.jsp").forward(request, response);
	}
	
	/*
	 * Chuyen den trang chinh sua thong tin sinh vien
	 */
	private void ChinhSuaThongTinSinhVien(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int maTaiKhoan = ((TaiKhoanBean) request.getSession().getAttribute("taiKhoan")).getMaTaiKhoan();
		
		SinhVienBean sv = GetSinhVienTheoTaiKhoan(maTaiKhoan);
		TruongBo tb = new TruongBo();
		NganhDaoTaoBo nb = new NganhDaoTaoBo();
		SinhVienBo svb = new SinhVienBo();
		
		try {
			if(sv != null) {
				String tinhTrangViecLam = svb.GetTinhTrangViecLam(sv.getMaSinhVien());
				if(tinhTrangViecLam.equals("dangDiLam"))
					request.setAttribute("thongTinViecLam", svb.GetThongTinViecLam(sv.getMaSinhVien()));
				else if(tinhTrangViecLam.equals("dangHocNangCao"))
					request.setAttribute("thongTinDaoTaoNangCao", svb.GetThongTinDaoTaoNangCao(sv.getMaSinhVien()));
				
				request.setAttribute("tinhTrangViecLam", tinhTrangViecLam);
			}
			request.setAttribute("listLoaiHinhCoQuan", svb.GetListLoaiHinh());
			request.setAttribute("danhSachTruong", tb.GetDanhSach());
			request.setAttribute("danhSachNganh", nb.getNganhDT());
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("sinhVien", sv);
		request.getRequestDispatcher("khaiBaoSinhVien.jsp").forward(request, response);
	}
	
	/*
	 * Lay thong tin sinh vien dua vao ma tai khoan
	 */
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
	
	/*
	 * Cap nhat thong tin sinh vien
	 */
	private void CapNhatThongTin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tinhTrangViecLam = request.getParameter("tinhTrangViecLam");	
		int maSinhVien = Integer.parseInt(request.getParameter("maSinhVien"));
		SinhVienBo svb = new SinhVienBo();
				
		try {
			CapNhatThongTinTaiKhoan(request, response);
			CapNhatThongTinDaoTao(request, response);
			
			if(tinhTrangViecLam.equals("dangDiLam")) {
				CapNhatThongTinViecLam(request, response);
			}
			else if(tinhTrangViecLam.equals("dangHocNangCao")) {
				CapNhatThongTinDaoTaoNangCao(request, response);
			}
			else {
				svb.UpdateThongTinViecLam(maSinhVien, true);
			}
			// respone 
			response.getWriter().print(true);
			
		} catch (ClassNotFoundException ex) {
			response.getWriter().print("Lỗi: " + ex.getMessage());
		} catch(SQLException sqlEx) {
			sqlEx.printStackTrace();
			response.getWriter().print("Lỗi kết nối cơ sở dữ liệu!");
		}
	}
	
	/*
	 * Cap nhat thong tin tai khoan
	 */
	private void CapNhatThongTinTaiKhoan(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		TaiKhoanBo tkb = new TaiKhoanBo();
		int maSinhVien = Integer.parseInt(request.getParameter("maSinhVien"));
		String  hoVaTen = request.getParameter("hoVaTen"),
				danToc = request.getParameter("danToc"),
				quocTich = request.getParameter("quocTich"),
				soCMND = request.getParameter("soCMND"),
				noiCapCMND = request.getParameter("noiCapCMND"),
				diaChiThuongTru = request.getParameter("diaChi"),
				soDienThoai = request.getParameter("soDienThoai"),
				email = request.getParameter("email");
		boolean gioiTinh = request.getParameter("gioiTinh").equals("1") ? true : false;
		LocalDate ngaySinh = LocalDate.parse(request.getParameter("ngaySinh"), DateTimeFormatter.ofPattern("yyyy-MM-dd")),
				ngayCapCMND = LocalDate.parse(request.getParameter("ngaySinh"), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		
		tkb.UpdateThongTinTaiKhoan(maSinhVien,
				new ThongTinTaiKhoanBean(
						hoVaTen, 
						ngaySinh, 
						gioiTinh, 
						soCMND, 
						ngayCapCMND, 
						noiCapCMND, 
						danToc, 
						quocTich, 
						diaChiThuongTru, 
						soDienThoai, 
						email, 
						"NA"));
	}
	
	/*
	 * Cap nhat thong tin dao tao
	 */
	private void CapNhatThongTinDaoTao(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		int maSinhVien = Integer.parseInt(request.getParameter("maSinhVien"));
		String maTruong = request.getParameter("maTruong"),
				maNganh = request.getParameter("maNganh"),
				nienKhoa = request.getParameter("nienKhoa"),
				soQuyetDinh = request.getParameter("soQuyetDinh");
		LocalDate thoiGianTotNghiep = LocalDate.parse(request.getParameter("thoiGianTotNghiep"),DateTimeFormatter.ofPattern("yyyy-MM-dd")),
				ngayKyQuyetDinh = LocalDate.parse(request.getParameter("ngayKyQuyetDinh"), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		SinhVienBo svb = new SinhVienBo();
		int rowEffect = svb.UpdateThongTinDaoTao(maSinhVien, maTruong, maNganh, nienKhoa, thoiGianTotNghiep, soQuyetDinh, ngayKyQuyetDinh);
		System.out.println("SinhVienController - Cap nhat thong tin dao tao - RE = " + rowEffect);
	}
	
	/*
	 * Cap nhat thong tin viec lam
	 */
	private void CapNhatThongTinViecLam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		int maSinhVien = Integer.parseInt(request.getParameter("maSinhVien"));
		String 	tenCongViec = request.getParameter("tenCongViec"),
				viTriCongTac = request.getParameter("viTriCongTac"),
				tenCoQuan = request.getParameter("tenCoQuan"),
				diaChiCoQuan = request.getParameter("diaChiCoQuan"),
				mucDoPhuHopChuyenMon = request.getParameter("mucDoPhuHopChuyenMon"),
				mucDoDapUngKTCM = request.getParameter("mucDoDapUngKTCM");
		
		int		loaiHinhCoQuan = Integer.parseInt(request.getParameter("loaiHinhCoQuan"));
		
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
		SinhVienBo svb = new SinhVienBo();
		svb.UpdateThongTinViecLam(maSinhVien, thongTin);
	}
	
	/*
	 * Cap nhat thong tin dao tao nang cao
	 */
	private void CapNhatThongTinDaoTaoNangCao(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		int maSinhVien = Integer.parseInt(request.getParameter("maSinhVien"));
		DaoTaoNangCaoBean daoTao = new DaoTaoNangCaoBean();
		daoTao.setMaSinhVien(maSinhVien);
		daoTao.setMaTruong(request.getParameter("maTruong"));
		daoTao.setMaNganh(request.getParameter("maNganh"));
		daoTao.setNienKhoa(request.getParameter("nienKhoa"));
		daoTao.setTrinhDoDaoTao(request.getParameter("trinhDoDaoTaoNangCao"));
		daoTao.setHinhThucDaoTao(request.getParameter("hinhThucDaoTaoNangCao"));
		System.out.println(request.getParameter("tenTruongNangCao") + " - Controller get param");
		SinhVienBo svb = new SinhVienBo();
		svb.UpdateThongTinDaoTaoNangCao(maSinhVien, daoTao);
	}
}
