<#assign known = Session?? && Session["SPRING_SECURITY_CONTEXT"]??>
<#if known>
    <#assign
    context = Session["SPRING_SECURITY_CONTEXT"]
    authentication = context["authentication"]
    principal = authentication["principal"]
    name = principal["username"]
    authorities = principal["authorities"]
    isAdmin = false
    >
    <#list authorities as authority>
        <#if authority["authority"] == "ROLE_ADMIN">
            <#assign isAdmin = true>
        </#if>
    </#list>
<#else>
    <#assign
    name = "unknown"
    isAdmin = false
    >
</#if>