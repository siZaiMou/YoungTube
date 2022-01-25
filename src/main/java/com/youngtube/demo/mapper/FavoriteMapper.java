package com.youngtube.demo.mapper;

import com.youngtube.demo.entity.Favorite;
import com.youngtube.demo.entity.VideoCategory;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Mapper
@Repository
public interface FavoriteMapper
{

    void insertOneFavorite(Favorite favorite);

    List<Favorite> findFavoriteListByUserId(@Param("userId") int userId);

    List<Integer> findFavoriteVideoIdList(@Param("favoriteId")int favoriteId);

    List<Date> findFavoriteDateList(@Param("favoriteId")int favoriteId);

    Integer findOneFavorite(@Param("favoriteId")int favoriteId, @Param("videoId") int videoId);

    void deleteOneVideoFavorite(@Param("favoriteId")int favoriteId, @Param("videoId") int videoId);

    void insertOneVideoFavorite(@Param("favoriteId")int favoriteId, @Param("videoId") int videoId,@Param("favoriteDate")Date date);
}
