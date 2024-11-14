<#include "security.ftl">
<#import "login.ftl" as l>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">Sweter</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse p-2" id="navbarSupportedContent">

            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/main">Messages</a>
                </li>
<#--                <#if isAdmin??>-->
                    <li class="nav-item">
                        <a class="nav-link" href="/user">User List</a>
                    </li>
<#--                </#if>-->

                    <li class="nav-item">
                        <a class="nav-link" href="/user/profile">Profile</a>
                    </li>


                <!-- Выравниваем текст и кнопку выхода -->
                <div class="d-flex align-items-center">
                    <span class="navbar-text p-2 mr-3">${username!"unknown"}</span>
                    <@l.logout/>
                </div>
            </ul>

        </div>
    </div>
</nav>
