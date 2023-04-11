package com.bbang.review;

import java.util.List;
import java.util.Map;


public interface ReviewService {
	// 해당 가게에 작성된 리뷰 가져오기
	public List<Review> getReviewById(String sid);
	// 유저가 보낸 rid, rcontent, rscore 를 받아서 처리
	public void updateReview (Map<String, Object>map) ;
	// 유저가 보낸 rid 값을 받아서 처리
	public void deleteReview (String rid) ;
	// 유저의 리뷰 등록 매서드
	public void insertReview (Map<String, Object> map) ;

}
