<#macro login path isRegisterForm>
  <form action="${path}" method="post">
    <div class="mb-3">
      <label class="form-label"> Қолданушы аты :
        <input type="text" name="username" value="<#if user??>${user.username}</#if>"
               class="form-control ${(usernameError??)?string('is-invalid', '')}"/>
        <#if usernameError??>
          <div class="invalid-feedback">
            ${usernameError}
          </div>
        </#if>
      </label>
    </div>

    <div class="mb-3">
      <label class="form-label"> Құпия сөз:
        <input type="password" name="password"
               class="form-control ${(passwordError??)?string('is-invalid', '')}"/>
        <#if passwordError??>
          <div class="invalid-feedback">
            ${passwordError}
          </div>
        </#if>
      </label>
    </div>
    <#if isRegisterForm>
      <div class="mb-3">
        <label class="form-label"> Құпия сөзді қайталаңыз:
          <input type="password" name="password2"
                 class="form-control ${(password2Error??)?string('is-invalid', '')}"/>
          <#if password2Error??>
            <div class="invalid-feedback">
              ${password2Error}
            </div>
          </#if>
        </label>
      </div>
    <div class="mb-3">
      <label class="form-label"> Email:
        <input type="email" name="email" value="<#if user??>${user.email}</#if>"
               class="form-control ${(emailError??)?string('is-invalid', '')}"/>
        <#if emailError??>
          <div class="invalid-feedback">
            ${emailError}
          </div>
        </#if>
      </label>
    </div>
      <div class="mb-3">
        <div class="g-recaptcha" data-sitekey="6LdjP4IqAAAAAOAwvrIzacgUuisETvRYdcuVvyEH"></div>
          <#if captchaError??>
            <div class="alert alert-danger" role="alert">
              ${captchaError}
            </div>
          </#if>
      </div>
    </#if>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>

    <div>
      <button type="submit" class="btn btn-primary"><#if isRegisterForm>Жасау<#else>Кіру</#if></button>
    </div>

    <div class="pt-2">
      <#if !isRegisterForm><a href="/registration">Жаңа қолданушыны ашу</a></#if>
    </div>

  </form>
</#macro>

<#macro logout>
  <form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button class="btn btn-primary position-absolute top-0 end-0 m-3" type="submit">Шығу</button>
  </form>
</#macro>