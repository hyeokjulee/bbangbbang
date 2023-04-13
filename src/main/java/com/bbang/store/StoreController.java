package com.bbang.store;

import java.io.File;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bbang.review.Review;
import com.bbang.review.ReviewService;

@Controller
@RequestMapping("/store")
public class StoreController {

	@Autowired // DI
	private StoreService storeService;
	
	@Autowired
	ReviewService reviewService;

	@Autowired // DI
	SqlSessionTemplate sqlsessionTemplate;
	
	@GetMapping("/main")
	public String main() {
		
		return "/main";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String storeList(Model model) {

		List<Store> list = storeService.getAllStoreList();
		model.addAttribute("storeList", list);
		return "store/list"; 
	}

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public String storeListReload(@RequestParam int page, Model model) {

		//1.페이지 변수를 찍어보자. 
		System.out.println(page);
	   
	    int offset = (page - 1) * 20;

	    List<Store> storeList = sqlsessionTemplate.selectList("store.select_add_list", 
	        Collections.singletonMap("offset", offset));

	    model.addAttribute("storeList", storeList);

	    return "store/list";
	}

	@GetMapping("/detail")
	public String storeDetail(@RequestParam("sid") String sid, Model model) {

		System.out.println(sid);
		Store storeById = storeService.getStoreById(sid);
		model.addAttribute("store", storeById);
		
	//	List<Review> reviewById = ReviewService.getReviewById(sid);
		List<Review> reviewById = sqlsessionTemplate.selectList("review.review_list_by_sid", sid);
		model.addAttribute("reviewList", reviewById);
		

		return "store/detail";

	}
	
	@GetMapping("/info")
	public String storeInfo(@RequestParam("sid") String sid, Model model) {

		Store storeById = storeService.getStoreById(sid);
		model.addAttribute("store", storeById);
		
		List<Review> reviewById = sqlsessionTemplate.selectList("review.review_list_by_sid", sid);
		model.addAttribute("reviewList", reviewById);
	
		return "/store/storeInfo" ;
	}
	

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String storeAddForm(@ModelAttribute("NewStore") Store store) {

		return "store/add";
	}
	

	// 파일 업로드 처리를 위한 변수 선언
	// servlet-context.xml 파일에 설정한 bean의 id 속성값과 동일한 이름으로 변수를 선언
	// @Resource 어노테이션을 이용해서 변수에 bean 객체를 주입
	@Resource(name = "uploadPath")
	private String uploadPath;

	@PostMapping("/add")
	public String storeAddProc(@ModelAttribute("NewStore") Store store) {

		MultipartFile storeImg = store.getSphotoFile();

		
		String saveName = storeImg.getOriginalFilename();
		System.out.println(saveName);
		store.setSphoto(saveName);

		File saveFile = new File(uploadPath + "\\save_images", saveName);

		if (storeImg != null && !storeImg.isEmpty()) {
			try {
				storeImg.transferTo(saveFile);
				store.setSphoto2(saveName);
			} catch (Exception e) {
				throw new RuntimeException(" 이미지 업로드가 실패했습니다.");
			}
		}
		
		storeService.setNewStore(store);

		return "redirect:/store/list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String storeUpdateForm(@RequestParam("sid") String sid, Model model) {

		System.out.println(sid);
		
		Store storeById = storeService.getStoreById(sid);
		model.addAttribute("store", storeById);
		
		//System.out.println(storeById.getSid());
		//System.out.println(storeById.getSaddr());
		//System.out.println(storeById.getSname());

		return "/store/update";
	}

	@PostMapping("/update")
	public String storeUpdateProc(@RequestParam Map<String, Object> map) {

		System.out.println(map.get("sid"));
		System.out.println(map.get("smenu"));
		System.out.println(map.get("sprice"));
		
		storeService.updateStore(map);

		return "redirect:/store/list" ;
	}

	@PostMapping("/delete")
	public String storeDeleteProc(@RequestParam("sid") String sid) {

		System.out.println(sid);
		storeService.deleteStoreById(sid);
		
		return "redirect:/store/list" ;

	}

	@GetMapping("/test")
	public String test() {

		return "/store/test";
	}

	
	//경외------------------------------------------------------
	@GetMapping("/searchInfo")
	public String searchInfo(@RequestParam("search") String search, Model model) {

		List<Store> list = sqlsessionTemplate.selectList("search_list", search);
		model.addAttribute("storeList", list);
		
		
	
		return "/store/searchList" ;
	}
	//경외------------------------------------------------------
	
	//경외------------------------------------------------------
	@GetMapping("/areaList")
    public String getAreaList(@RequestParam Map<String, Object> map, Model model) {
        // MyBatis의 Mapper를 사용하여 데이터베이스에서 데이터를 조회

		System.out.println(map.get("area1"));
		System.out.println(map.get("area2"));
		System.out.println(map.get("area3"));

		List<Store> areaList = storeService.getAreaList(map);
		
        // 조회한 데이터를 Model에 담아 View로 전달
        model.addAttribute("areaList", areaList);

        // View의 이름 반환
        return "/store/areaList";
    }
	
	

	//경외------------------------------------------------------
}
