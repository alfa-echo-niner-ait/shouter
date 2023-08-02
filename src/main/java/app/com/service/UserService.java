package app.com.service;

import app.com.mapper.UserMapper;
import app.com.pojo.Users;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class UserService {
    SqlSession sqlSession;
    UserMapper userMapper;

    public UserService() throws IOException {
        InputStream inputStream = Resources.getResourceAsStream("MyBatis.xml");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        sqlSession = sqlSessionFactory.openSession(true);
        userMapper = sqlSession.getMapper(UserMapper.class);
    }

    public List<Users> selectAllUsers() {
        return userMapper.selectAllUsers();
    }

    public void addUser(String username, String password) {
        userMapper.addUser(username, password);
        System.out.println(username + " added!");
    }

    public Users getUser(String username) {
        return userMapper.getUser(username);
    }

    public Integer getUserID(String username) {
        return userMapper.getUserID(username);
    }

    public String getPassword(String username) {
        return userMapper.getPassword(username);
    }

    public void deleteUser(String username) {
        userMapper.deleteUser(username);
    }

    public void closeSession() {
        sqlSession.close();
    }
}