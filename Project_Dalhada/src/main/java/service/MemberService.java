package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MemberDAO;
import vo.MemberinfoVO;

@Service
public class MemberService {
@Autowired
MemberDAO dao;

public boolean insert(MemberinfoVO vo) {
	if(dao.insert(vo) != 1)
		return false;
	return true;
}

public boolean checkId(String id) {
	if (dao.checkId(id) != null)
		return true;
	return false;
}	

public MemberinfoVO checklogin(String id) {
	MemberinfoVO vo = dao.checklogin(id);
	if(vo != null) return vo;
	return null;
}	
}
