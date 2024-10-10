package com.app.dao;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;

import com.app.mybatis.config.MyBatisConfig;
import com.app.vo.PostVO;

public class PostDAO {
	public SqlSession sqlSession;

	public PostDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
	
//	게시글 추가
	public void insert(PostVO postVO) {
		sqlSession.insert("post.insert", postVO);
	}
	
//	게시글 전체 조회
	public List<PostVO> selectAll() {
		return sqlSession.selectList("post.selectAll");
	}
	
//	게시글 상세보기 조회
	public Optional<PostVO> select(Long id){
		return Optional.ofNullable(sqlSession.selectOne("post.select", id));
	}
	
//	게시글 삭제
	public void delete(Long id) {
		sqlSession.delete("post.delete", id);
	}
	
//	게시글 수정
	public void update(PostVO postVO) {
		sqlSession.update("post.update", postVO);
	}
}
