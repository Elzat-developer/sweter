<#import "parts/common.ftl" as c>
<@c.page>
    <h5>${username}</h5>
    <form method="post">
            <div class="mb-3">
                <label class="form-label"> Password:
                    <input type="password" name="password" class="form-control"/>
                </label>
            </div>
                <div class="mb-3">
                    <label class="form-label"> Email:
                        <input type="email" name="email" class="form-control" value="${email!''}"/>
                    </label>
                </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <div>
                <button type="submit" class="btn btn-primary">Save</button>
            </div>

    </form>
</@c.page>