package bean;

public class DaoTaoNangCaoBean {
	private int maSinhVien;
	private String maTruong;
	private String maNganh;
	private String trinhDoDaoTao;
	private String hinhThucDaoTao;
	private String nienKhoa;

	public String getNienKhoa() {
		return nienKhoa;
	}

	public void setNienKhoa(String nienKhoa) {
		this.nienKhoa = nienKhoa;
	}

	public int getMaSinhVien() {
		return maSinhVien;
	}

	public void setMaSinhVien(int maSinhVien) {
		this.maSinhVien = maSinhVien;
	}

	public String getMaTruong() {
		return maTruong;
	}

	public void setMaTruong(String maTruong) {
		this.maTruong = maTruong;
	}

	public String getMaNganh() {
		return maNganh;
	}

	public void setMaNganh(String maNganh) {
		this.maNganh = maNganh;
	}

	public String getTrinhDoDaoTao() {
		return trinhDoDaoTao;
	}

	public void setTrinhDoDaoTao(String trinhDoDaoTao) {
		this.trinhDoDaoTao = trinhDoDaoTao;
	}

	public String getHinhThucDaoTao() {
		return hinhThucDaoTao;
	}

	public void setHinhThucDaoTao(String hinhThucDaoTao) {
		this.hinhThucDaoTao = hinhThucDaoTao;
	}

	public DaoTaoNangCaoBean() {
		// TODO Auto-generated constructor stub
	}

	public DaoTaoNangCaoBean(int maSinhVien, String maTruong, String maNganh, String trinhDoDaoTao,
			String hinhThucDaoTao) {
		super();
		this.maSinhVien = maSinhVien;
		this.maTruong = maTruong;
		this.maNganh = maNganh;
		this.trinhDoDaoTao = trinhDoDaoTao;
		this.hinhThucDaoTao = hinhThucDaoTao;
	}
}
