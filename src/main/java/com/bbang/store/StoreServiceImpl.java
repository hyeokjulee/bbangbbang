package com.bbang.store;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class StoreServiceImpl implements StoreService{
	
	@Autowired
	StoreRepository storeRepository ;

	@Override
	public List<Store> getAllStoreList() {
		// TODO Auto-generated method stub
		return storeRepository.getAllStoreList();
	}

	@Override
	public Store getStoreById(String sid) {
		// TODO Auto-generated method stub
		return storeRepository.getStoreById(sid);
	}

	@Override
	public void setNewStore(Store store) {
		storeRepository.setNewStore(store);		
	}
	
	//경외
	@Override
    public List<Store> getAreaList(Map<String, Object> map) {
		return storeRepository.getAreaList(map);
		
    }

	@Override
	public List<Store> getAllStoreListForMap() {
		return storeRepository.getStoreListForMap();
	}

}
