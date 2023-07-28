package simple.spring.sim;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bbang.store.Store;
import com.bbang.store.StoreService;
import com.google.common.net.MediaType;

@Controller
public class MapController {
	@Autowired // DI
	private StoreService storeService;

	@GetMapping("/")
	public ModelAndView main() {
		List<Store> list = storeService.getAllStoreListForMap();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		mv.addObject("storeList",list);
		
		return mv;
	}
	
 	@GetMapping(value = "/", produces = org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<List<Store>> getStoreList() {
        List<Store> list = storeService.getAllStoreListForMap();
        if (list != null && !list.isEmpty()) {
            return new ResponseEntity<>(list, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
    }

}
