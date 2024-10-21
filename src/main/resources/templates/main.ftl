<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
<div>
    <@l.logout/>
</div>
    <div>
        <form method="post">
            <input type="text" name="text" placeholder="Enter your message(English)">
            <input type="text" name="tag" placeholder="Tag">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit">Action</button>
        </form>
    </div>
    <div>List message</div>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter}">
        <button type="submit">find</button>
    </form>
        <#list messages as message>
            <div>
                <b>${message.id}</b>
                <span>${message.text}</span>
                <i>${message.tag}</i>
                <strong>${message.authorName}</strong>
            </div>
            <#else>
            No Messages!
        </#list>
</@c.page>