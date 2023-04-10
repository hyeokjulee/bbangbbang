package com.bbang.store;

import java.util.List;
import java.util.Map;


public interface StoreRepository {
	// 등록하기
	void setNewStore(Store store) ;
	// 상세보기
	Store getStoreById(String sid);
	// 리스트보기
	List<Store> getAllStoreList();
	// 삭제하기
	void deleteStoreById(String sid) ;
	
	void updateStore(Map<String, Object> map);
}
