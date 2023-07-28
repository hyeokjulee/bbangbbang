package com.bbang.review;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewRepositoryImpl implements ReviewRepository {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<Review> getReviewById(String sid) {
		return sqlSessionTemplate.selectList("review.review_list_by_sid", sid );
	}

	@Override
	public void updateReview(Map<String, Object> map) {
		sqlSessionTemplate.update("review.update_review", map) ;		
	}

	@Override
	public void deleteReview(String rid) {
		sqlSessionTemplate.delete("review.delete_review_by_rid", rid) ;	
	}

	@Override
	public void insertReview(Map<String, Object> map) {
		sqlSessionTemplate.insert("review.insert_review", map) ;		
		
	}

}
