<%--
  Created by IntelliJ IDEA.
  User: Windows User
  Date: 2020-11-23
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="description" content="基于 Java 开发的在线 OJ"/>
    <title>在线 OJ</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0,text/html; charset=UTF-8" http-equiv="Content-Type">
    <!--Bootstrap 4-->
    <link  href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 开发环境版本，包含了有帮助的命令行警告 -->
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <!--<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>-->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/app.js"></script>
</head>

<body background="${pageContext.request.contextPath }/img/charcoal.jpg" style=" background-repeat:no-repeat ; background-size:100% 100%;background-attachment: fixed;">
<nav class="navbar navbar-expand-md navbar-dark fixed-top sticky-navigation">
    <a class="navbar-brand font-weight-bold" href="#">在线 OJ</a>
    <div
            class="collapse navbar-collapse" id="topMenu">
    </div>
</nav>

<!--hero section-->
<section class="bg-hero">
    <div class="container">
        <div class="row vh-100">
            <div class="col-sm-12 my-auto text-center">
                <h1>在线 OJ</h1>
                <p class="lead text-capitalize my-4">
                    基于 java 搭建的在线 OJ 平台
                </p>
            </div>
        </div>
    </div>
</section>

<!--components-->
<section class="my-5 pt-5">
    <div class="container" id="app">

        <!-- Tables  -->
        <div class="row mb-5"  v-show="status=='list'">
            <div class="col-sm-12">
                <div class="mt-3 mb-5">
                    <h3>题目列表</h3>
                    <table class="table table-striped">
                        <thead>
                        <!--                    <table class="table">-->
                        <!--                        <thead class="thead-dark">-->
                        <tr>
                            <th>ID</th>
                            <th>题目</th>
                            <th>难度</th>
                        </tr>
                        </thead>

                        <tbody>
                        <tr v-for="problem in problems">
                            <td>{{problem.id}}</td>
                            <td><a v-on:click="getDetail(problem.id)">{{problem.title}}</a></td>
                            <td>{{problem.level}}</td>
                        </tr>
                        <!--                        {{#question}}-->
                        <!--                        <tr>-->
                        <!--                            <td>{{id}}</td>-->
                        <!--                            <td><a href="/question/{{id}}">{{title}}</a></td>-->
                        <!--                            <td>{{star}}</td>-->
                        <!--                        </tr>-->
                        <!--                        {{/question}}-->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="row mb-5"  v-show="status=='detail'">
            <div class="col-sm-12">
                <div class="jumbotron">
                    <h3>{{problem.id}}.{{problem.title}} {{problem.level}}</h3>
                    <pre>{{problem.description}}</pre>
                </div>
                <textarea class="form-control" v-model="problem.templateCode" rows="20">
                </textarea>
                <button  class="btn btn-primary" v-on:click="compile()">提交</button>
            </div>
        </div>
    </div>
</section>

<!--footer-->
<section class="py-5 bg-dark">
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 col-xs-12 text-center">
                <p class="pt-2 text-muted">
                </p>
            </div>
        </div>
    </div>
</section>
<script>
    // 在这个标签中写的就是 JavaScript 代码.
    // 创建一个 Vue 的对象
    var app = new Vue({
        el: '#app',  // 把当前这个 Vue 对象关联到页面中一个 id 为 app 的 html 元素上
        data: {
            status: "list",
            problems: [
            ],
            // 这表示当前这个题目的详细信息
            // 需要让这个详细信息通过 服务器的 API 来获取.
            problem: {
                id: 1,
                title: '我是标题',
                level: '简单',
                description: '我是题目描述',
                templateCode: '我是模板代码',
            }
        },
        methods: {
            getProblems() {
                // 通过这个方法, 从服务器上获取题目列表
                // 借助 ajax 给服务器发请求
                // $ 是 JQuery 中定义好的一个特殊对象.
                $.ajax({
                    url: 'problem',
                    type: 'get',
                    context: this, // this 指向的 是 Vue app 对象, 此处是把 app 对象传到 ajax 方法内部
                    success: function(data, status) {
                        // 得到正确的响应之后, 就会自动调用该函数.
                        // 参数 data 是得到的 HTTP 响应的 body 部分, 预期是一个 json 数组
                        this.problems = data;
                    }
                })
            },
            getDetail(id) {
                $.ajax({
                    url: 'problem?id='+id,
                    type: 'get',
                    context: this,
                    success: function(data, status) {
                        this.problem = data;
                        this.status = 'detail';
                    }
                })
            },
            compile() {
                var question = {
                    id: this.problem.id,
                    // 前面使用 v-model 进行了双向绑定. 当用户修改编辑框代码时,
                    // templateCode 变量也会同步变化
                    code: this.problem.templateCode,
                }
                $.ajax({
                    url: 'compile',
                    type: 'post',
                    context: this,
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(question),
                    success: function(data, status) {
                        var msg = data.ok + "\n"
                        if (data.reason) {
                            msg += data.reason;
                        } else {
                            msg += data.stdout;
                        }
                        alert(msg);
                    }
                })
            }
        },
    });
    app.getProblems();
</script>
</body>
</html>
