package com.liu.test.dao;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;

public class TTDao {

	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	/**
	 * 根据Id查询对象
	 * @param clazz
	 * @param id 对象Id号
	 * @return 返回查询的对象
	 */
	public <T> T getObjectById(Class<T> clazz,Serializable id){
		T t = sqlSession.selectOne(clazz.getName()+".getObjById", id);
		return t;
	}

	/**
	 * 查询一组对象列表
	 * @param clazz
	 * @return
	 */
	public <T> List<T> getObjectList(Class<T> clazz){
		List<T> list = sqlSession.selectList(clazz.getName()+".getObjList");
		return list;
	}
	
	/**
	 * 添加对象
	 * @param t 要插入的对象
	 * @return 添加的条数
	 */
	public <T> int  saveObject(T t){
		int count = sqlSession.insert(t.getClass().getName()+".insertObj", t);
		return count;
	}
	
	/**
	 * 更新对象
	 * @param t
	 * @return
	 */
	public <T> int updateObject(T t){
		int count = sqlSession.update(t.getClass().getName()+".updateObj", t);
		return count;
	}
	
	/**
	 * 根据Id删除对象
	 * @param clazz
	 * @param id
	 * @return
	 */
	public <T> int deleteObjectById(Class<T> clazz,Serializable id){
		int count = sqlSession.delete(clazz.getName()+"delObjById", id);
		return count;
	}
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
}
