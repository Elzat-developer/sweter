<#import "login.ftl" as l>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">Sweter</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

       <div class="collapse navbar-collapse " id="navbarText"><#-- p-2-->

            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/main">Messages</a>
                </li>
                <#if isAdmin?? && isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/user">User List</a>
                </li>
                </#if>

            </ul>

           <!-- Элементы справа: Имя пользователя и кнопка "Sign Out" -->
           <div class="d-flex align-items-center">
               <!-- Имя пользователя -->
               <div class="navbar-text me-3">
                   <#if name??>${name}</#if>
               </div>

               <!-- Кнопка "Sign Out" -->
               <@l.logout/>
           </div>
        </div>

    </div>
</nav>