package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ReportVO;

@Repository
public class AdminDAO {
	@Autowired
	SqlSession session;
	
	public List<ReportVO> selectReportlist() {
		List<ReportVO> list;
		String statement = "resource.AdminMapper.selectReport";
		list = session.selectList(statement);
		return list;
	}
	public int deleteReview(int report_id, int review_id) {
		String statement = "resource.AdminMapper.deleteReport";
		session.delete(statement, report_id);
		statement = "resource.AdminMapper.deleteReview";
		return session.delete(statement, review_id);
	}
	public int deleteReport(int report_id) {
		String statement = "resource.AdminMapper.deleteReport";
		return session.delete(statement, report_id);	
	}
	
}
