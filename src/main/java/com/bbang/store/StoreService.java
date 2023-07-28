package com.bbang.store;

import java.util.List;
import java.util.Map;


public interface StoreService {
	
	void setNewStore(Store store) ;

	Store getStoreById(String sid);

	List<Store> getAllStoreList();
	
	//경외
	List<Store> getAreaList(Map<String, Object> map);
	List<Store> getAllStoreListForMap();

	void deleteStoreById(String sid) ;

	void updateStore(Map<String, Object> map);

}

