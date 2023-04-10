package com.bbang.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	
	@Autowired
	ReviewRepository reviewRepository ;

	@Override
	public List<Review> getReviewById(String sid) {
		return reviewRepository.getReviewById(sid);
	}

	@Override
	public void updateReview(Map<String, Object> map) {
		reviewRepository.updateReview(map);
		
	}

	@Override
	public void deleteReview(String rid) {
		reviewRepository.deleteReview(rid);		
	}

	@Override
	public void insertReview(Map<String, Object> map) {
		reviewRepository.insertReview(map);		
	}

}
