<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>角色新增</title>
<!-- 引入layui的样式表 -->
<link rel="stylesheet" href="assert/layui/css/layui.css">
</head>
<body>
	<!-- lay-filter="form_role" 相当于id="form_role" -->
	<form class="layui-form" lay-filter="form_role">
		<div class="layui-form-item">
			<label class="layui-form-label">角色编号</label>
			<div class="layui-input-block">
				<!-- lay-verify="required"的检验 -->
				<input type="text" name="roleCode" required lay-verify="required"
					placeholder="请输入角色编号 " autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">角色名称</label>
			<div class="layui-input-block">
				<!-- lay-verify="required"的检验 -->
				<input type="text" name="roleName" required
					lay-verify="required|checkrolename" placeholder="请输入角色称 "
					autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">角色类型</label>
			<div class="layui-input-block">
				<input type="radio" name="roleKind" value="1" title="超级角色">
				<input type="radio" name="roleKind" value="0" title="一般角色" checked>
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">角色信息</label>
			<div class="layui-input-block">
				<textarea name="roleInfo" placeholder="请输入角色信息"
					class="layui-textarea"></textarea>
			</div>
		</div>

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
	layui.use([ 'layer', 'form' ], function() {
		//通过一个变量将加载的模块取出
		var layer = layui.layer;
		var form = layui.form;
		//layui内置jquery
		var $ = layui.$;

		//表单的自定义校验
		form.verify({
			checkrolename : function(value, item) {
				var msg;
				$.ajax({
					type : 'get',
					async : false,//将异步提交关闭
					url : 'role/checkname',
					data : {
						'roleName' : value
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
			var data = form.val('form_role');
			console.log(data);
			$.ajax({
				type : 'post',
				url : 'role/add',
				data : data,
				success : function(result) {
					if (result) {
						layer.msg("角色新增成功了");
					}
				}
			});
			return false;
		});
	});
</script>
</html>