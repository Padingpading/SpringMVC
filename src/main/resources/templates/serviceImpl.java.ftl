package ${package.ServiceImpl};

import ${package.Entity}.${entity};
import ${package.Mapper}.${table.mapperName};
import ${package.Service}.${table.serviceName};
import ${superServiceImplClassPackage};
import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
/**
* ${table.comment!}
*
* @author Pad
*/
@Service
@Slf4j
public class ${table.serviceImplName} implements ${table.serviceName} {

    @Autowired
    private ${table.mapperName} ${table.mapperName?uncap_first};

    @Override
    public Integer create(${entity} req) {
        log.info("[[create]] 创建 req:{}", JSON.toJSONString(req));
        Integer result = ${table.mapperName?uncap_first}.create(req);
        return result;
    }

    @Override
    public Integer update(${entity} req) {
        log.info("[[update]] 更新 req:{}", JSON.toJSONString(req));
        Integer result = ${table.mapperName?uncap_first}.update(req);
        return result;
    }

    @Override
    public ${entity} findById(Integer id) {
        log.info("[[findById]] 通过id查询 id:{}", id);
        ${entity} ${entity?uncap_first} = ${table.mapperName?uncap_first}.findById(id);
        return ${entity?uncap_first};
    }

    @Override
    public PageInfo<${entity}> page(Integer page, Integer pageSize, ${entity} req) {
        log.info("[[page]] 分页查询 page:{} , pageSize:{} , req:{}", page, pageSize, req);
        int count = ${table.mapperName?uncap_first}.count(req);
        if (count == 0) {
            log.info("[[page]] 分页查询 数量为空 page:{} , pageSize:{} , req:{}", page, pageSize, req);
            return new PageInfo<${entity}>(page, pageSize, 0);
        }
        PageInfo<${entity}> pageInfo = new PageInfo<${entity}>(page, pageSize, count);
        List<${entity}> result = ${table.mapperName?uncap_first}.page(pageInfo.getPagefirst(), pageSize, req);
        return pageInfo.setList(result);
    }

    @Override
    public List<${entity}> queryByIds(List<Integer> ids) {
        log.info("[[queryByIds]] 通过ids 批量查询 ids:{}", ids);
        List<${entity}> result = ${table.mapperName?uncap_first}.queryByIds(ids);
        return result;
    }
}
