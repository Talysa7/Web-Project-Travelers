package handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.AlbumDBBean;
import db.CmtDBBean;
import db.TripDBBean;
import db.UserDBBean;
import db.UserDataBean;

@Controller
public class AdmListHandler {
	final int pageSize=10;
	final int pageBlock = 2;
	//final int pageBlock=0;
	
	@Resource
	private TripDBBean tripDao;
	@Resource
	private AlbumDBBean albumDao;
	@Resource
	private CmtDBBean cmtDao;
	@Resource
	private UserDBBean userDao;
	@RequestMapping("/adm/*")
	public ModelAndView admDefaultProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		return new ModelAndView("adm/default");
	}

	@RequestMapping("adminTrip")
	public ModelAndView adminTripHandler(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		return new ModelAndView("adm/trip");
	}
	@RequestMapping("adminComment")
	public ModelAndView adminContentHandler(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		return new ModelAndView("adm/comment");
	}
	@RequestMapping("adminUser")
	public ModelAndView adminUserHandler(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		int count=userDao.getCount();//list row num
		
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null || pageNum.equals("")){
			pageNum = "1";
		}
		int currentPage=Integer.parseInt(pageNum);
		int pageCount=count/pageSize+(count % pageSize>0 ? 1:0 );
		if( currentPage > pageCount ) currentPage = pageCount;
		int start = ( currentPage - 1 )*pageSize + 1;					// (5-1)*10 +1   =41
		int end = start + pageSize - 1;	
		
		if(end > count) end = count;
		
		int number = count - (currentPage - 1) * pageSize;				//	50-(5-1)*10 
			
		int startPage = (currentPage / pageBlock)*pageBlock+1;  		//(5/10)*10+1 = 1
		if(currentPage % pageBlock == 0) startPage-=pageBlock;
		int endPage =startPage + pageBlock - 1;							//11+10-1	=20
		if(endPage > pageCount ) endPage = pageCount;
	
		request.setAttribute( "count", count );
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "currentPage", currentPage );
		request.setAttribute( "number", number );
		request.setAttribute( "startPage", startPage );
		request.setAttribute( "endPage", endPage );
		request.setAttribute( "pageCount", pageCount );
		request.setAttribute( "pageBlock", pageBlock );
		
		if(count>0) {
				Map<String, Integer> map=new HashMap<String,Integer>();
				map.put("start", start);
				map.put("end", end);
				
				List<UserDataBean>users=userDao.getUsers(map);
				request.setAttribute("users", users);
		}

		return new ModelAndView("adm/user");
	}
	@RequestMapping("adminTag")
	public ModelAndView adminTagHandler(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		return new ModelAndView("adm/tag");
	}
	
	@RequestMapping("adminAlbum")
	public ModelAndView adminPhotoHandler(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		return new ModelAndView("adm/album");
	}
	
}