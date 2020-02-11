<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户新增</title>
<!-- 引入layui的样式表 -->
<link rel="stylesheet" href="assert/layui/css/layui.css">
</head>
<body>
	<!-- lay-filter="form_user" 相当于id="form_user" -->
	<form class="layui-form" lay-filter="form_user">
		<div class="layui-form-item">
			<label class="layui-form-label">学生名称</label>
			<div class="layui-input-block">
				<!-- lay-verify="required"的检验 -->
				<input type="text" name="stuName" required
					lay-verify="required|checkstuname" placeholder="请输入学生名称 "
					autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">学生年龄</label>
			<div class="layui-input-block">
				<!-- lay-verify="required"的检验 -->
				<input type="text" name="stuAge" required lay-verify="required"
					placeholder="请输入学生年龄" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">学生生日</label>
			<div class="layui-input-block">
				<!-- lay-verify="required"的检验 -->
				<input type="text" name="stuBirthday" id="stuBirthday" required
					lay-verify="required" placeholder="请输入学生名称 " autocomplete="off"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">学生性别</label>
			<div class="layui-input-block">
				<input type="radio" name="stuSex" value="1" title="男"> <input
					type="radio" name="stuSex" value="0" title="女" checked>
			</div>
		</div>

		<!-- <div class="layui-form-item">
    <label class="layui-form-label">复选框</label>
    <div class="layui-input-block">
      <input type="checkbox" name="like[write]" title="写作">
      <input type="checkbox" name="like[read]" title="阅读" checked>
      <input type="checkbox" name="like[dai]" title="发呆">
    </div>
  </div>
   -->
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>

</body>

<!-- Layui是按模块开发  
layui.all.js 加载全部模板
layui.js 按需加载模板 -->

<script type="text/javascript" src="assert/layui/layui.js"></script>
<!-- 书写自己的脚本 -->
<script type="text/javascript">
	//Demo
	layui.use([ 'layer', 'form', 'laydate' ], function() {
		//通过一个变量将加载的模块取出
		var layer = layui.layer;
		var form = layui.form;
		var laydate = layui.laydate;
		//layui内置jquery
		var $ = layui.$;
		//渲染日历
		laydate.render({
			elem : '#stuBirthday'//指定元素
		});

		//表单的自定义校验
		form.verify({
			checkstuname : function(value, item) {
				var msg;
				$.ajax({
					type : 'get',
					async : false,//将异步提交关闭
					url : 'student/checkname',
					data : {
						'stuName' : value
					},
					success : function(result) {
						//判断此名称不可以使用，
						if (result == 0) {
							msg = "此名称已有人使用";
						}
					}
				});
				return msg;
			}

		});

		//绑定提交按钮
		form.on('submit(formDemo)', function(data) {
			var data = form.val('form_user');
			console.log(data);
			$.ajax({
				type : 'post',
				url : 'student',
				data : data,
				success : function(result) {
					if (result) {
						layer.msg("提交成功了");
					}
				}
			});
			return false;
		});

	});
</script>
</html>