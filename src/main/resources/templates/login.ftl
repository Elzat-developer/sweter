<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
<#-- Проверяем, существует ли переменная message и не является ли она null -->
    <#if message??>
        ${message}
    </#if>
    <@l.login "/login" false/>
</@c.page>