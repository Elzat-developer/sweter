<a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Message edit
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
            <input type="hidden" name="id" value="<#if message??> ${message.id}</#if>"/>
            <div class="mb-3">
                <button type="submit" class="btn btn-primary">Save message</button>
            </div>
        </form>
    </div>
</div>