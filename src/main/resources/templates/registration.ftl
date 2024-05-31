<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
    Add new User
<#-- Проверяем, существует ли переменная message и не является ли она null -->
    <#if message??>
        ${message}
    </#if>
<@l.login "/registration" />
</@c.page>



