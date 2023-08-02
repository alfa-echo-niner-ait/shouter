package app.com.mapper;

import app.com.pojo.Shouts;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface ShoutMapper {
    @Select("SELECT * FROM shouts ORDER BY shoutID DESC")
    List<Shouts> selectAllShouts();

    @Select("SELECT * FROM shouts WHERE username=#{username} ORDER BY shoutID DESC")
    List<Shouts> selectShoutsByUser(String username);

    @Select("SELECT * FROM shouts WHERE shoutID=#{shoutID}")
    public Shouts getShout(Integer shoutID);

    @Insert("INSERT INTO shouts (userID, username, text) VALUES (#{userID}, #{username}, #{text})")
    void addShout(@Param("userID") Integer userID, @Param("username") String username, @Param("text") String text);

    @Update("UPDATE shouts SET text=#{text} WHERE shoutID=#{shoutID}")
    public void update(@Param("text") String text, @Param("shoutID") Integer shoutID);

    @Delete("DELETE FROM shouts WHERE shoutID=#{shoutID}")
    public void delete(Integer shoutID);

}
