package controller;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import logic.QnaCatalog;
import model.Condition;
import model.Notice;
import model.Qna;

@Controller
public class QnaController {
	
	@Autowired
	private QnaCatalog qnaCatalog;
	
	@RequestMapping(value="/qna/updateDo.html")
	public ModelAndView updateDo(Qna qna, HttpSession session) {
		Qna before = this.qnaCatalog.getQna(qna.getSeqno());
		ModelAndView mav = new ModelAndView("redirect:/qna/qnaList.html");
		MultipartFile multiFile = qna.getImage();
		String fileName = multiFile.getOriginalFilename();
		String zero = "";
		if(fileName == null || fileName.equals("")) {
			if(before.getImage_url() != null) {
				qna.setImage_url(before.getImage_url());
			}else {
				qna.setImage_url(zero);
			}
			this.qnaCatalog.updateQna(qna);
		}else {
			String path=null; OutputStream os=null; 
			ServletContext ctx = session.getServletContext();
			path = ctx.getRealPath("/upload/"+fileName);
			try {
				os = new FileOutputStream(path);
				BufferedInputStream bis = new BufferedInputStream(
					multiFile.getInputStream());
				byte[] buffer = new byte[8192]; int read = 0;
				while( (read = bis.read(buffer)) > 0) {
					os.write(buffer, 0, read);
				}
				}catch(Exception e) {}
				qna.setImage_url(fileName);
		}
		String user_id = (String)session.getAttribute("USERID");
		String admin_id = (String)session.getAttribute("ADMINID");
		try {
			if((user_id != null||admin_id != null)&&
				(user_id.equals(qna.getUser_id())||admin_id.equals(qna.getAdmin_id()))) {
				this.qnaCatalog.updateQna(qna);
				return mav;
			}
		}catch(Exception e) {
			if((user_id != null||admin_id != null)&&
				(user_id==qna.getUser_id())||admin_id==qna.getAdmin_id()) {
				this.qnaCatalog.updateQna(qna);
				 return mav;
			}
		}
		return mav;
	}
	@RequestMapping(value="/qna/qna_update.html")
	public ModelAndView qnaUpdate(Qna qna) {
		ModelAndView mav = new ModelAndView("qna/qna_update");
		qna = this.qnaCatalog.getQna(qna.getSeqno());
		mav.addObject(qna);
		return mav;
	}
	
	@RequestMapping(value="/qna/deleteDo.html")
	public ModelAndView deleteDo(Qna qna, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/qna/qnaList.html");
		qna = this.qnaCatalog.getQna(qna.getSeqno());
		String user_id = (String)session.getAttribute("USERID");
		String admin_id = (String)session.getAttribute("ADMINID");
		try {
			if((user_id != null||admin_id != null)&&
				(user_id.equals(qna.getUser_id())||admin_id.equals(qna.getAdmin_id()))) {
				this.qnaCatalog.deleteQna(qna);
				return mav;
			}
		}catch(Exception e) {
			if((user_id != null||admin_id != null)&&
				(user_id==qna.getUser_id())||admin_id==qna.getAdmin_id()) {
				this.qnaCatalog.deleteQna(qna);
				 return mav;
			}
		}
		return mav;
	}
	@RequestMapping(value="/qna/qna_delete.html")
	public ModelAndView qnaDelete(Qna qna) {
		ModelAndView mav = new ModelAndView("qna/qna_delete");
		qna = this.qnaCatalog.getQna(qna.getSeqno());
		mav.addObject(qna);
		return mav;
	}
	
	
	@RequestMapping(value="/qna/qna_reply.html")
	public ModelAndView qnaReply(Integer seqno, Integer parent_seqno, Integer group_id, HttpSession session) {
		ModelAndView mav = new ModelAndView("qna/qna_write");
		Qna original = this.qnaCatalog.getQna(seqno);
		original.setContent(null);
		original.setEmail(null);
		original.setGroup_id(group_id);
		original.setParent_seqno(parent_seqno);
		mav.addObject(original);
		System.out.println(original.getSeqno());
		System.out.println(original.getGroup_id());
		System.out.println(original.getParent_seqno());
		mav.addObject("title","RE]"+original.getTitle());
		return mav;
	}
	@RequestMapping(value="/qna/qna_read.html")
	public ModelAndView QnaRead(Integer pid) {
		ModelAndView mav = new ModelAndView("qna/qna_read");
		Qna qna = this.qnaCatalog.getQna(pid);//글번호로 글 검색
		mav.addObject("QNA",qna);
		return mav;
	}
	
	@RequestMapping(value="/qna/qna_reg.html")
	public ModelAndView QnaWriteDo(@Valid Qna qna, BindingResult br,
			HttpSession session, Integer order_no, Integer group_id, Integer parent_seqno) {
		if(br.hasErrors()) {
			ModelAndView mav = new ModelAndView("qna/qna_write");
			mav.getModel().putAll(br.getModel());
			return mav;
		}

				
		MultipartFile multiFile = qna.getImage();
		String fileName=null; String path=null; OutputStream os=null;
		if(multiFile != null) {
			fileName = multiFile.getOriginalFilename();
			ServletContext ctx = session.getServletContext();
			path = ctx.getRealPath("/upload/"+fileName);
			System.out.println("업로드 경로:"+path);
			try {
				os = new FileOutputStream(path);
				BufferedInputStream bis = new BufferedInputStream(
						multiFile.getInputStream());
				byte[] buffer = new byte[8156];
				int read = 0;
				while( (read = bis.read(buffer)) > 0) {
					os.write(buffer,0,read);
				}
			}catch(Exception e) {
				
			}
			qna.setImage_url(fileName);
		}
		
		Integer maxSeqno = qnaCatalog.getMaxSeqno();
		if(qna.getParent_seqno() == null) {
			qna.setParent_seqno(0); qna.setOrder_no(0);
			Integer gId = qnaCatalog.selectMaxGroupId();
			if(gId == null) gId = 0;
			qna.setGroup_id(gId + 1);
		}else {
			qna.setParent_seqno(parent_seqno);
			qna.setGroup_id(group_id);
			qna.setOrder_no(order_no);
			qnaCatalog.updateOrderNo(qna);
		}
			System.out.println(parent_seqno);
		if(session.getAttribute("USERID")!=null) {
			String user_id = (String)session.getAttribute("USERID");
			qna.setUser_id(user_id);
			qna.setAdmin_id("");
		}else if(session.getAttribute("ADMINID")!=null) {
			String admin_id = (String)session.getAttribute("ADMINID");
			qna.setUser_id("");
			qna.setAdmin_id(admin_id);
		}
		
		if(maxSeqno == null) maxSeqno = 0;
		qna.setSeqno(maxSeqno+1);
		
		Calendar today = Calendar.getInstance();
		String registerDate = "";
		int year = today.get(Calendar.YEAR);
		registerDate = registerDate + year + "/";
		int month = today.get(Calendar.MONTH) + 1;
		if(month < 10) registerDate = registerDate + "0" + month + "/";
		else registerDate = registerDate + month + "/";
		int date = today.get(Calendar.DATE);
		if(date < 10) registerDate = registerDate + "0" + date;
		else registerDate = registerDate + date;
		qna.setReg_date(registerDate);
		this.qnaCatalog.insertQna(qna);
		ModelAndView mav = new ModelAndView("redirect:/qna/qnaList.html");
		return mav;
	}
	
	@RequestMapping(value="/qna/qna_write.html")
	public ModelAndView QnaWrite() {
		ModelAndView mav = new ModelAndView("qna/qna_write");
		mav.addObject(new Qna());
		return mav;
	}
	
	@RequestMapping(value="/qna/qnaList.html")
		public ModelAndView qnaList(Integer SEQNO, Integer PAGE_NUM) {
			if(PAGE_NUM == null) PAGE_NUM = 1;
			ModelAndView mav = new ModelAndView("qna/qnaList");
			if(SEQNO != null) {
				int rownum = this.qnaCatalog.selectRownum(SEQNO);//글번호로 일련번호를 획득
				int page = rownum / 5;
				if(rownum % 5 != 0) page++;
				PAGE_NUM = page;//페이지 번호 설정
			}
			int currentPage = PAGE_NUM;		int totalPageCount = 0;
			int startRow = 0; int endRow = 0;
			int count = this.qnaCatalog.getQnaCount();//이미지게시글의 갯수 검색
			if(count > 0) {
				totalPageCount = count / 5;
				if(count % 5 > 0) totalPageCount++;
				startRow = (currentPage - 1) * 5 + 1;
				endRow = currentPage * 5;
				if(endRow > count) endRow = count;
			}
			Condition cond = new Condition();
			cond.setStartRow(startRow); cond.setEndRow(endRow);
			List<Qna> qnaList = this.qnaCatalog.findAll(cond);//이미지 글 검색
			mav.addObject("QNA",qnaList); mav.addObject("count",count);
			mav.addObject("startRow",startRow); mav.addObject("endRow",endRow);
			mav.addObject("currentPage",currentPage); 
			mav.addObject("pageCount",totalPageCount);
			return mav;
			}
}
	


