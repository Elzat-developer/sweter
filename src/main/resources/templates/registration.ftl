<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
    <div class="mb-1">Add new User</div>
<#-- Проверяем, существует ли переменная message и не является ли она null -->
    <#if message??>
        ${message}
    </#if>
<@l.login "/registration" true/>
</@c.page>



