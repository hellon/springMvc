package com.liu.test.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.liu.test.domain.Sysfunction;

@Repository("functionDao")
public class FunctionDao extends TTDao {
}
