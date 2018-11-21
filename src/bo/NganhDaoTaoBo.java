package bo;

import java.util.ArrayList;

import bean.NganhDaoTaoBean;
import dao.NganhDaoTaoDao;

public class NganhDaoTaoBo {
	public ArrayList<NganhDaoTaoBean> listNganh;
	NganhDaoTaoDao nganh= new NganhDaoTaoDao();
	public ArrayList<NganhDaoTaoBean> getNganhDT(String matruong) throws Exception{
		listNganh= nganh.getNganhDT(matruong);
		return listNganh;
	}
}
