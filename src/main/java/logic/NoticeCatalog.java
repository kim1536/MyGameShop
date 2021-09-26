package logic;

import java.util.List;

import model.Condition;
import model.Notice;

public interface NoticeCatalog {
	List<Notice> getNoticeList(Condition cond);
	Integer getNoticeCount();
	Notice getNoticeDetail(Integer seqno);
	Integer getMaxSeqno();
	void putNotice(Notice notice);
	void deleteNotice(Notice notice);
	void updateNotice(Notice notice);
}
