<#include "security.ftl">
<#import "login.ftl" as l>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">Sweter</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse p-2" id="navbarSupportedContent">

            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/main">Messages</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/user">User List</a>
                </li>


            </ul>

<#--            <div class="navbar-text position-absolute top-10 end-0 p-2 mr-3">${name}</div>-->
            <@l.logout/>
        </div>

    </div>
</nav>