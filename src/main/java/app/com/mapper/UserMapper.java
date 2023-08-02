package app.com.mapper;

import app.com.pojo.Users;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserMapper {
    @Select("SELECT * FROM users")
    List<Users> selectAllUsers();

    @Select("SELECT * FROM users WHERE username=#{username}")
    Users getUser(String username);

    @Select("SELECT userID FROM users WHERE username=#{username}")
    Integer getUserID(String username);

    @Select("SELECT password FROM users WHERE username=#{username}")
    String getPassword(String username);

    @Insert("INSERT INTO users (username, password) VALUES (#{username}, #{password})")
    void addUser(@Param("username") String username, @Param("password") String password);

    @Delete("DELETE FROM users WHERE username=#{username}")
    void deleteUser(String username);
}
