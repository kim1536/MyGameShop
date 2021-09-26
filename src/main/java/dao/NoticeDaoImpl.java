package dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Condition;
import model.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	
	@Autowired
	private SqlSession session;
	
	public List<Notice> findAll(Condition cond) {
		List<Notice> noticeList = session.selectList("mapper.noticeMapper.getNoticeList", cond);
		return noticeList;
	}

	public Integer getNoticeCount() {
		return session.selectOne("mapper.noticeMapper.getNoticeCount");
	}

	public Notice getNoticeDetail(Integer no) {
		return session.selectOne("mapper.noticeMapper.getNoticeRead", no);
	}
	
	
	
	public Integer getMaxSeqno() {
		return session.selectOne("mapper.noticeMapper.getMaxSeqno");
	}
	public void putNotice(Notice notice) {
		session.insert("mapper.noticeMapper.putNotice", notice);
	}

	public void updateNotice(Notice notice) {
		session.update("mapper.noticeMapper.updateNotice", notice);
		
	}
	public void deleteNotice(Notice notice) {
		session.delete("mapper.noticeMapper.deleteNotice", notice.getSeqno());	
	}

}
