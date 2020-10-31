package com.min.myapp;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.stereotype.Repository;

@Repository
public class DummyDAO {
	
	private SqlSession sqlSession;
	public DummyDAO() throws IOException {		
		InputStream inputStream = Resources.getResourceAsStream("/mybatis-config.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		sqlSession = sqlSessionFactory.openSession(true);//true=auto commit; 롤백// 보통은 true를 안한다
	}    
 
    // 실제 파일 : mappers/example.xml
    // namespace: mappers.example.쿼리아이디
    private final String NAMESPACE = "com.min.";
    
    
    public int selectTest() throws Exception {        
        return sqlSession.selectOne(NAMESPACE+"selectTest");
    }
    public DummyDTO selectTest2(int idx) throws Exception {  
    	return sqlSession.selectOne(NAMESPACE+"selectTest2",idx);
    }
    public DummyDTO selectTest3(int idx, String content) throws Exception {   
    	//두개이상을 보낼때 맵으로 보내는거와 클래스를 하나를 만든거
    	
    	
		
		/*
		  	MyParameter param = new MyParameter(2, "111"); 
		  	return sqlSession.selectOne(NAMESPACE+"selectTest2",param);
		 */
		 
		
			
			
			 Map<String,Object> param = new HashMap<String, Object>();
			 param.put("idx",idx); param.put("content", content);
			 
			  
			  return sqlSession.selectOne(NAMESPACE+"selectTest3",param);//맵을 매개변수로 보낸다
			         
    }
    public List<DummyDTO> selectTest4() throws Exception {        
        return sqlSession.selectList(NAMESPACE+"selectTest4");
    }
    
    public int delete(String idx) {
    	return sqlSession.delete(NAMESPACE+"deleteTest",idx);    	
    }
    public int insert(String content) {
    	return sqlSession.insert(NAMESPACE+"insertTest",content);
    }
    
    public int update(String content, String idx) {
    	
    	  Map<String,Object> param = new HashMap<String, Object>(); 
		  param.put("idx",idx); 
		  param.put("content", content);
		  
		  System.out.println(idx+"idx");
		  System.out.println(content+"content");
		return sqlSession.update(NAMESPACE+"updateTest",param);
    	
    }
}











