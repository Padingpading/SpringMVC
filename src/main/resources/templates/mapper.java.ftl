package ${package.Mapper};

import ${package.Entity}.${entity};
import ${superMapperClassPackage};
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 * ${table.comment!}
 *
 * @author Pad
 */
public interface ${table.mapperName} {

    /**
    * 插入
    */
    Integer create(${entity} req);

    /**
    * 选择性插入
    */
    Integer createSelective(${entity} req);

    /**
    * 批量插入
    */
    Integer createBatch(List<${entity}> req);

    /**
    * 更新
    */
    Integer update(${entity} req);

    /**
    * 选择性更新
    */
    Integer updateSelective(${entity} req);

    /**
    * id查询
    */
    ${entity} findById(Integer id);

    /**
    * 分页获取记录数
    */
    Integer count(${entity} req);

    /**
    * 分页获取记录
    */
    List<${entity}> page(@Param("pageFirst") Integer pageFirst, @Param("pageSize") Integer pageSize, ${entity} req);

    /**
    * 批量查询
    */
    List<${entity}> queryByIds(@Param("list") List<Integer> ids);
}
