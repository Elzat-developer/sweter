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
<#include "parts/messageEdit.ftl"/>

<#include "parts/messageList.ftl"/>
</@c.page>