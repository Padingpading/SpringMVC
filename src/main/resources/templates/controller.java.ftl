package ${package.Controller};

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import ${superControllerClassPackage};
import ${package.Service}.${table.serviceName};
import ${package.Entity}.${entity};
/**
 * ${table.comment!}
 *
 * @author Pad
 */
@RestController
@RequestMapping("<#if package.ModuleName??>${'/' + package.ModuleName}</#if>/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${table.entityPath}</#if>")
public class ${table.controllerName} {

    @Autowired
    private ${table.serviceName} ${table.serviceName?uncap_first};

    /**
     * 创建
     */
    @PostMapping("/create")
    public Result<${entity}> create(@RequestBody ${entity} req) {
        return Result.success(${table.serviceName?uncap_first}.create(req));
    }

    /**
     * 更新
     */
    @PostMapping("/update")
    public Result<${entity}> update(@RequestParam(name = "page", defaultValue = "1") Integer page,
                                  @RequestParam(name = "pageSize", defaultValue = "10") Integer pageSize,
                                  @RequestBody ${entity} req) {
        return Result.success(${table.serviceName?uncap_first}.update(req));
    }

    /**
     * 分页
     */
    @PostMapping("/page")
    public Result<${entity}> page(@RequestParam(name = "page", defaultValue = "1") Integer page,
                                         @RequestParam(name = "pageSize", defaultValue = "10") Integer pageSize,
                                         @RequestBody ${entity} req) {
        return Result.success(iChannelService.page(page, pageSize, req));
    }
}
