package bo;

import java.util.ArrayList;

import bean.NganhDaoTaoBean;
import dao.NganhDaoTaoDao;

public class NganhDaoTaoBo {
	
	public NganhDaoTaoBo() {
		 nganhDao = new NganhDaoTaoDao();
	}
	
	public ArrayList<NganhDaoTaoBean> listNganh;
	NganhDaoTaoDao nganhDao;
	
	public ArrayList<NganhDaoTaoBean> getNganhDT(String matruong) throws Exception{
		listNganh= nganhDao.getNganhDT(matruong);
		return listNganh;
	}
	
	public ArrayList<NganhDaoTaoBean> getNganhDT() throws Exception{
		listNganh= nganhDao.getNganhDT();
		return listNganh;
	}
}
