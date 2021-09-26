package dao;

import java.util.List;

import model.Condition;

import model.Notice;

public interface NoticeDao {
	List<Notice> findAll(Condition cond);
	Integer getNoticeCount();
	Notice getNoticeDetail(Integer no);
	Integer getMaxSeqno();
	void putNotice(Notice notice);
	void updateNotice(Notice notice);
	void deleteNotice(Notice notice);
}
