package com.ict.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.vo.VO;


@Repository("MyDAOImpl")
public class MyDAOImpl implements MyDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate; 
	
	@Override
	public List<VO> selectAll() throws Exception {
		return sqlSessionTemplate.selectList("guestbook.list");
	}

	@Override
	public VO selectOneList(String idx) throws Exception {
		return sqlSessionTemplate.selectOne("guestbook.onelist", idx);
	}
	
	@Override
	public int insert(VO vo) throws Exception {
		return sqlSessionTemplate.insert("guestbook.insert", vo);
	}

	@Override
	public int delete(String idx) throws Exception {
		return sqlSessionTemplate.delete("guestbook.delete", idx);
	}

	@Override
	public int update(VO vo) throws Exception {
		return sqlSessionTemplate.update("guestbook.update", vo);
	}

	
}
