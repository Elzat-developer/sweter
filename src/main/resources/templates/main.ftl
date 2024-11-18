<#import "parts/common.ftl" as c>

<@c.page>
    <div class="row g-3">
        <div class="col-12">
            <form method="get" action="/main" >
                <input  type="text" name="filter" value="${filter?if_exists}">
                <button type="submit" class="btn btn-primary">find</button>
            </form>
        </div>
    </div>

    <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new message
    </a>

    <div class="collapse <#if message??>show</#if>" id="collapseExample">
        <div class="mb-3 mt-3">
            <form method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                               value="<#if message??> ${message.text}</#if>" name="text" placeholder="Enter your message(English)">
                        <#if textError??>
                        <div class="invalid-feedback">
                            ${textError}
                        </div>
                        </#if>
                    </div>
                    <div class="mb-3">
                        <input type="text" class="form-control"
                               value="<#if message??> ${message.tag}</#if>" name="tag" placeholder="Tag">
                        <#if tagError??>
                            <div class="invalid-feedback">
                                ${tagError}
                            </div>
                        </#if>
                    </div>
                    <div>
                        <input type="file" class="form-control" name="file" id="formFile">
                        <label for="formFile" class="form-label"></label>
                    </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                     <div class="mb-3">
                        <button type="submit" class="btn btn-primary">Action</button>
                    </div>
            </form>
        </div>
    </div>

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
                        <span>${message.text}</span>
                        <i>${message.tag}</i>
                    </div>
                    <div class="card-footer">
                        <#if message.author??>
                            ${message.author}
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
                        <span>${message.text}</span>
                        <i>${message.tag}</i>
                    </div>
                    <div class="card-footer">
                        <#if message.author??>
                            ${message.author}
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
                        <span>${message.text}</span>
                        <i>${message.tag}</i>
                    </div>
                    <div class="card-footer">
                        <#if message.author??>
                            ${message.author}
                        <#else>
                            Автор неизвестен
                        </#if>
                    </div>
                </div>
            </#list>
        </div>
    </div>

</@c.page>