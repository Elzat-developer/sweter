<#macro login path isRegisterForm>
  <form action="${path}" method="post">
    <div class="mb-3">
      <label class="form-label"> User Name :
        <input type="text" name="username" class="form-control"/>
      </label>
    </div>

    <div class="mb-3">
      <label class="form-label"> Password:
        <input type="password" name="password" class="form-control"/>
      </label>
    </div>
    <#if isRegisterForm>
    <div class="mb-3">
      <label class="form-label"> Email:
        <input type="email" name="email" class="form-control"/>
      </label>
    </div>
    </#if>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>

    <div>
      <button type="submit" class="btn btn-primary"><#if isRegisterForm>Create<#else>Sign In</#if></button>
    </div>

    <div class="pt-2">
      <#if !isRegisterForm><a href="/registration">Add new User</a></#if>
    </div>

  </form>
</#macro>

<#macro logout>
  <form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button class="btn btn-primary position-absolute top-0 end-0 m-3" type="submit">Sign Out</button>
  </form>
</#macro>