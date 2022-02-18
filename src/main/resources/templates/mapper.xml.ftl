<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${package.Mapper}.${table.mapperName}">
<#if enableCache>
    <!-- 开启二级缓存 -->
    <cache type="org.mybatis.caches.ehcache.LoggingEhcache"/>
</#if>

<#if baseResultMap>
    <!-- 通用查询映射结果 -->
    <resultMap id="BaseResultMap" type="${package.Entity}.${entity}">
<#list table.fields as field>
<#if field.keyFlag><#--生成主键排在第一位-->
        <id column="${field.name}" property="${field.propertyName}" />
</#if>
</#list>
<#list table.commonFields as field><#--生成公共字段 -->
    <result column="${field.name}" property="${field.propertyName}" />
</#list>
<#list table.fields as field>
<#if !field.keyFlag><#--生成普通字段 -->
        <result column="${field.name}" property="${field.propertyName}" />
</#if>
</#list>
    </resultMap>

</#if>
<#if baseColumnList>
    <!-- 通用查询结果列 -->
    <sql id="Base_Column_List">
<#list table.commonFields as field>
        ${field.name},
</#list>
        ${table.fieldNames}
    </sql>
    <#list table.commonFields as field>
        ${field.name},
    </#list>
</#if>

    <sql id="Search_Info">
    <#list table.fields as field>
        ${"<if test=\""}${field.propertyName}${"!= `null\" >"}
            AND ${field.name} = ${"#"}{${field.propertyName}}
        ${"</if>"}
    </#list>
        AND status = 0
    </sql>


    <insert id="create" keyColumn="id" keyProperty="id" useGeneratedKeys="true">
        INSERT INTO ${table.name}(
            <#list table.fields as field><#if !field.keyFlag && field.name != "status" && field.name != "create_time" && field.name != "update_time" ><#if field_index != 1>,</#if>${field.name}</#if></#list>
        )VALUES(
            <#list table.fields as field><#if !field.keyFlag && field.name != "status" && field.name != "create_time" && field.name != "update_time" ><#if field_index != 1>,</#if>${"#"}{${field.propertyName}}</#if></#list>
        )
    </insert>

    <!--批量插入-->
    <insert id="insertBatch" keyColumn="id" keyProperty="id" useGeneratedKeys="true">
        INSERT INTO ${table.name}(
            <#list table.fields as field><#if !field.keyFlag && field.name != "status" && field.name != "create_by" && field.name != "create_time" && field.name != "update_time" ><#if field_index != 1>,</#if>${field.name}</#if></#list>
        ) VALUES
        <foreach collection="list" index="index" item="item" open="(" separator="," close=")">
            <#list table.fields as field><#if !field.keyFlag && field.name != "status" && field.name != "create_by" && field.name != "create_time" && field.name != "update_time" ><#if field_index != 1>,</#if>${"#"}{item.${field.propertyName}}</#if></#list>
        </foreach>
     </insert>

    <insert id="insertSelective" keyColumn="id" keyProperty="id" useGeneratedKeys="true">
        INSERT INTO ${table.name}(
        <#list table.fields as field>
        <#if !field.keyFlag && field.name != "status" && field.name != "create_time" && field.name != "update_time" >
        ${"<if test=\""}${field.propertyName}${"!= null\" >"}
            <#if field_index != 1>, </#if>${field.name}
         ${"</if>"}
        </#if>
        </#list>
        )VALUES(
        <#list table.fields as field>
        <#if !field.keyFlag && field.name != "status" && field.name != "create_time" && field.name != "update_time" >
        ${"<if test=\""}${field.propertyName}${"!= `null\" >"}
            <#if field_index != 1>,</#if>${"#"}{${field.propertyName}}
        ${"</if>"}
        </#if>
        </#list>
        )
    </insert>


    <update id="update">
        UPDATE ${table.name}
        SET
        <#list table.fields as field>
        <#if !field.keyFlag && field.name != "status" && field.name != "create_by" && field.name != "create_time" && field.name != "update_time" >
            <#if field_index != 1>,</#if>${field.name} = ${"#"}{${field.propertyName}}
        </#if>
        </#list>
        WHERE id = ${"#"}{id}
    </update>

    <update id="updateSelective">
        UPDATE ${table.name}
        SET
        <#list table.fields as field>
           <#if !field.keyFlag && field.name != "status" && field.name != "create_by" && field.name != "create_time" && field.name != "update_time" >
       ${"<if test=\""}${field.propertyName}${"!= null\" >"}
            <#if field_index != 1>,</#if>${field.name} = ${"#"}{${field.propertyName}}
       ${"</if>"}
           </#if>
        </#list>
        WHERE id = ${"#"}{id}
    </update>

    <select id="findById" resultMap="BaseResultMap">
        SELECT
            <include refid="Base_Column_List"/>
        FROM ${table.name}
        WHERE id = ${"#"}{id}
        AND status = 0
    </select>

    <!--分页获取记录数-->
    <select id="count" resultType="java.lang.Integer">
        SELECT
              count(*)
        FROM ${table.name}
        <where>
            <include refid="Search_Info"/>
        </where>
    </select>

    <!--分页获取记录-->
    <select id="page" resultMap="BaseResultMap">
        SELECT
            <include refid="Base_Column_List"/>
        FROM ${table.name}
        <where>
            <include refid="Search_Info"/>
        </where>
        ORDER BY create_time DESC
        <if test="pageFirst != null and pageSize != null">
            LIMIT ${"#"}{pageFirst}, ${"#"}{pageSize}}
        </if>
        <if test="pageFirst == null or pageSize == null">
            LIMIT 0, 1000
        </if>
    </select>

    <!--批量查询-->
    <select id="queryByIds" resultMap="BaseResultMap">
        SELECT
        <include refid="Base_Column_List"/>
        FROM ${table.name}
        WHERE id in
        <foreach collection="list" item="item" open="(" close=")" separator=",">
            ${"#"}{item}
        </foreach>
        and status = 0
    </select>
</mapper>
