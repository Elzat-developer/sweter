<#import "parts/common.ftl" as c>
<@c.page>
    <div class="tabel-left">
        Қолданушылар тізімі
    </div>

    <table>
        <thred>
            <tr>
                <th class="tabel-left">Қолданушы аты</th>
                <th></th>
                <th class="tabel-left">Қолданушы рөлі</th>
            </tr>
        </thred>
        <tbody class="tabel-left">
        <#list users as user>
            <tr>
                <td>${user.username}</td>
                <td></td>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                <td>
                    <a class="form-control"
                       href="/user/${user.id}">өзгерту</a>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
    <style>
        body{
            background: url('static/Doktorskaya-dissertaciya-po-medicine.jpg');
        }
        .tabel-left{
            padding-top: 10px;
            padding-right: 15px;
            color: white;
            background: rgba(0, 0, 0, 0.5); /* Черный фон с прозрачностью */
            border-radius: 10px; /* Круглые углы */
        }
    </style>

</@c.page>