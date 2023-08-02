package app.com.service;

import app.com.mapper.ShoutMapper;
import app.com.pojo.Shouts;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class ShoutService {
    SqlSession sqlSession;
    ShoutMapper shoutMapper;

    public ShoutService() throws IOException {
        InputStream inputStream = Resources.getResourceAsStream("MyBatis.xml");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        sqlSession = sqlSessionFactory.openSession(true);
        shoutMapper = sqlSession.getMapper(ShoutMapper.class);
    }

    public List<Shouts> selectAllShouts() {
        return  shoutMapper.selectAllShouts();
    }

    public List<Shouts> selectShoutsByUser(String username) {
        return shoutMapper.selectShoutsByUser(username);
    }

    public Shouts getShout(Integer shoutID) {
        return shoutMapper.getShout(shoutID);
    }

    public void addShout(Integer userID, String username, String text) {
        shoutMapper.addShout(userID, username, text);
    }

    public void update(String text, Integer shoutID) {
        shoutMapper.update(text, shoutID);
    }

    public void delete(Integer shoutID) {
        shoutMapper.delete(shoutID);
    }

    public void closeSession() {
        sqlSession.close();
    }
}
