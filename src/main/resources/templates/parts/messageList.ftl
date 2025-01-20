<#include "security.ftl">
<div class="row row-cols-1 row-cols-md-3 g-4">
    <#assign column1 = []>
    <#assign column2 = []>
    <#assign column3 = []>

    <#list messages as message>
        <#if message_index % 3 == 0>
            <#assign column1 = column1 + [message]>
        <#elseif message_index % 3 == 1>
            <#assign column2 = column2 + [message]>
        <#else>
            <#assign column3 = column3 + [message]>
        </#if>
    </#list>

    <div class="col">
        <#list column1 as message>
            <div class="card my-3" style="width: 18rem;">
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top">
                </#if>
                <div class="m-2">
                    <span>${message.text}</span><br>
                    <i>#${message.tag}</i>
                </div>
                <div class="card-footer">
                    <#if message.author??>
                        <a href="/user-messages/${message.author.id}">${message.author}</a>
                        <#if message.author.id == currentUserId>
                            <a class="btn btn-primary" href="/user-messages/${message.author.id}?message=${message.id}">
                                Edit
                            </a>
                        </#if>
                    <#else>
                        Автор неизвестен
                    </#if>
                </div>
            </div>
        </#list>
    </div>

    <div class="col">
        <#list column2 as message>
            <div class="card my-3" style="width: 18rem;">
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top">
                </#if>
                <div class="m-2">
                    <span>${message.text}</span><br>
                    <i>#${message.tag}</i>
                </div>
                <div class="card-footer">
                    <#if message.author??>
                        <a href="/user-messages/${message.author.id}">${message.author}</a>
                        <#if message.author.id == currentUserId>
                            <a class="btn btn-primary" href="/user-messages/${message.author.id}?message=${message.id}">
                                Edit
                            </a>
                        </#if>
                    <#else>
                        Автор неизвестен
                    </#if>
                </div>
            </div>
        </#list>
    </div>

    <div class="col">
        <#list column3 as message>
            <div class="card my-3" style="width: 18rem;">
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top">
                </#if>
                <div class="m-2">
                    <span>${message.text}</span><br>
                    <i>#${message.tag}</i>
                </div>
                <div class="card-footer">
                    <#if message.author??>
                        <a href="/user-messages/${message.author.id}">${message.author}</a>
                        <#if message.author.id == currentUserId>
                            <a class="btn btn-primary" href="/user-messages/${message.author.id}?message=${message.id}">
                                Edit
                            </a>
                        </#if>
                    <#else>
                        Автор неизвестен
                    </#if>
                </div>
            </div>
        </#list>
    </div>
</div>