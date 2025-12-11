package com.ruoyi.attraction.mapper;

import java.util.List;
import com.ruoyi.attraction.domain.TourRoute;

/**
 * 游览路线Mapper接口
 *
 * @author ruoyi
 * @date 2025-12-11
 */
public interface TourRouteMapper
{
    /**
     * 查询游览路线
     *
     * @param id 游览路线主键
     * @return 游览路线
     */
    public TourRoute selectTourRouteById(Long id);

    /**
     * 查询游览路线列表
     *
     * @param tourRoute 游览路线
     * @return 游览路线集合
     */
    public List<TourRoute> selectTourRouteList(TourRoute tourRoute);

    /**
     * 查询路线及其POI列表
     *
     * @param id 游览路线主键
     * @return 游览路线（包含POI列表）
     */
    public TourRoute selectRouteWithPois(Long id);

    /**
     * 新增游览路线
     *
     * @param tourRoute 游览路线
     * @return 结果
     */
    public int insertTourRoute(TourRoute tourRoute);

    /**
     * 修改游览路线
     *
     * @param tourRoute 游览路线
     * @return 结果
     */
    public int updateTourRoute(TourRoute tourRoute);

    /**
     * 删除游览路线
     *
     * @param id 游览路线主键
     * @return 结果
     */
    public int deleteTourRouteById(Long id);

    /**
     * 批量删除游览路线
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTourRouteByIds(Long[] ids);
}
