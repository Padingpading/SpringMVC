package ${package.Service};

import ${package.Entity}.${entity};
import ${superServiceClassPackage};
import org.apache.ibatis.annotations.Param;
import java.util.List;
/**
 * ${table.comment!}
 *
 * @author Pad
 */
public interface ${table.serviceName} {

    /**
    * 插入
    */
    Integer create(${entity} req);

    /**
    * 更新
    */
    Integer update(${entity} req);

    /**
    * id查询
    */
    ${entity} findById(Integer id);

    /**
    * 分页获取记录
    */
    PageInfo<${entity}> page(@Param("pageFirst") Integer pageFirst, @Param("pageSize") Integer pageSize, ${entity} req);

    /**
    * 批量查询
    */
    List<${entity}> queryByIds(@Param("list") List<Integer> ids);
}
