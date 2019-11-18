package dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.NoticeVO;
import vo.SearchNoticeInfoVO;

@Repository
public class NoticeDAO {
	@Autowired
	SqlSession session = null;

	public List<NoticeVO> search(SearchNoticeInfoVO noticeinfo) {
		String statement = "resource.NoticeMapper.searchNotice";
		List<NoticeVO> list = session.selectList(statement, noticeinfo);
		return list;
	}

	public int selectSearchCount(SearchNoticeInfoVO noticeinfo) {
		String statement = "resource.NoticeMapper.searchNoticeCount";
		return session.selectOne(statement, noticeinfo);
	}

	public NoticeVO selectNotice(int nid, String string) {
		String statement;
		
		if(string.equals("mem")) {
			statement = "resource.NoticeMapper.updateNoticeCnt";
			session.update(statement, nid);
		}
		statement = "resource.NoticeMapper.selectNoticeContent";
		return session.selectOne(statement,nid);
	}

	public List<NoticeVO> selectlist(SearchNoticeInfoVO noticeinfo) {
		String statement = "resource.NoticeMapper.selectAllNotice";
		List<NoticeVO> list = session.selectList(statement, noticeinfo);
		return list;
	}

	public int updateNotice(NoticeVO info) {
		String statement = "resource.NoticeMapper.updateNotice";
		return session.update(statement,info);
	}

	public int deleteNotice(int nid) {
		String statement = "resource.NoticeMapper.deleteNotice";
		return session.update(statement,nid);
	}

	public int insertNotice(NoticeVO info) {
		String statement = "resource.NoticeMapper.insertNotice";
		return session.update(statement,info);
	}
}
