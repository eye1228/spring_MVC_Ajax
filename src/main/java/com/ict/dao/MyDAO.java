package com.ict.dao;

import java.util.List;

import com.ict.vo.VO;

public interface MyDAO {
	// 리스트 확인
	List<VO> selectAll() throws Exception;
	
	// 상세 보기
	VO selectOneList(String idx) throws Exception;
	
	// 삽입
	int insert(VO vo) throws Exception;
	
	//삭제하기
	int delete(String idx) throws Exception;
	
	//수정하기
	int update(VO vo) throws Exception;
	
}
