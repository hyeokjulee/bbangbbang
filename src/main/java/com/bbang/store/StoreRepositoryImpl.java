package com.bbang.store;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreRepositoryImpl implements StoreRepository {

	@Autowired
	SqlSessionTemplate sqlsessionTemplate ;
	
	@Override
	public List<Store> getAllStoreList() {
		// TODO Auto-generated method stub
		return this.sqlsessionTemplate.selectList("store.select_list") ;
	}

	@Override
	public Store getStoreById(String sid) {
		// TODO Auto-generated method stub
		return this.sqlsessionTemplate.selectOne("store.select_detail", sid);
	}

	@Override
	public void setNewStore(Store store) {
		 this.sqlsessionTemplate.selectOne("store.insert", store);
		
	}

	@Override
	public void deleteStoreById(String sid) {
		sqlsessionTemplate.delete("store.delete", sid) ;		
	}

	@Override
	public void updateStore(Map<String, Object> map) {
		sqlsessionTemplate.update("store.update", map) ;		
		
	}

}
