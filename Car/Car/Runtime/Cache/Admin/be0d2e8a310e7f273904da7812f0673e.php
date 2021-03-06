<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title><?php echo ($meta_title); ?>|车蝙蝠管理平台</title>
    <link href="/Car/Public/login_logo.png" type="image/x-icon" rel="shortcut icon">
    <link rel="stylesheet" type="text/css" href="/Car/Public/Admin/css/base.css" media="all">
    <link rel="stylesheet" type="text/css" href="/Car/Public/Admin/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="/Car/Public/Admin/css/module.css">
    <link rel="stylesheet" type="text/css" href="/Car/Public/Admin/css/style.css" media="all">
	<link rel="stylesheet" type="text/css" href="/Car/Public/Admin/css/<?php echo (C("COLOR_STYLE")); ?>.css" media="all">
     <!--[if lt IE 9]>
    <script type="text/javascript" src="/Car/Public/static/jquery-1.10.2.min.js"></script>
    <![endif]--><!--[if gte IE 9]><!-->
    <script type="text/javascript" src="/Car/Public/static/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="/Car/Public/Admin/js/jquery.mousewheel.js"></script>
    <!--<![endif]-->
    
</head>
<body>
    <!-- 头部 -->
    <div class="header">
        <!-- Logo -->
      <a href="<?php echo U('Index/index');?>"><span class="logo"></span></a>
        <!-- /Logo -->

        <!-- 主导航 -->
        <ul class="main-nav">
            <?php if(is_array($__MENU__["main"])): $i = 0; $__LIST__ = $__MENU__["main"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li class="<?php echo ((isset($menu["class"]) && ($menu["class"] !== ""))?($menu["class"]):''); ?>"><a href="<?php echo (U($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
        <!-- /主导航 -->

        <!-- 用户栏 -->
        <div class="user-bar">
            <a href="javascript:;" class="user-entrance"><i class="icon-user"></i></a>
            <ul class="nav-list user-menu hidden">
                <li class="manager">你好，<em title="<?php echo session('user_auth.username');?>"><?php echo session('user_auth.username');?></em></li>
                <li><a href="<?php echo U('User/updatePassword');?>">修改密码</a></li>
                <li><a href="<?php echo U('User/updateNickname');?>">修改昵称</a></li>
                <li><a href="<?php echo U('Public/logout');?>">退出</a></li>
            </ul>
        </div>
    </div>
    <!-- /头部 -->

    <!-- 边栏 -->
    <div class="sidebar">
        <!-- 子导航 -->
        
            <div id="subnav" class="subnav">
                <?php if(!empty($_extra_menu)): ?>
                    <?php echo extra_menu($_extra_menu,$__MENU__); endif; ?>
                <?php if(is_array($__MENU__["child"])): $i = 0; $__LIST__ = $__MENU__["child"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub_menu): $mod = ($i % 2 );++$i;?><!-- 子导航 -->
                    <?php if(!empty($sub_menu)): if(!empty($key)): ?><h3><i class="icon icon-unfold"></i><?php echo ($key); ?></h3><?php endif; ?>
                        <ul class="side-sub-menu">
                            <?php if(is_array($sub_menu)): $i = 0; $__LIST__ = $sub_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li>
                                    <a class="item" href="<?php echo (U($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a>
                                </li><?php endforeach; endif; else: echo "" ;endif; ?>
                        </ul><?php endif; ?>
                    <!-- /子导航 --><?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
        
        <!-- /子导航 -->
    </div>
    <!-- /边栏 -->

    <!-- 内容区 -->
    <div id="main-content">
        <div id="top-alert" class="fixed alert alert-error" style="display: none;">
            <button class="close fixed" style="margin-top: 4px;">&times;</button>
            <div class="alert-content">这是内容</div>
        </div>
        <div id="main" class="main">
            
            <!-- nav -->
            <?php if(!empty($_show_nav)): ?><div class="breadcrumb">
                <span>您的位置:</span>
                <?php $i = '1'; ?>
                <?php if(is_array($_nav)): foreach($_nav as $k=>$v): if($i == count($_nav)): ?><span><?php echo ($v); ?></span>
                    <?php else: ?>
                    <span><a href="<?php echo ($k); ?>"><?php echo ($v); ?></a>&gt;</span><?php endif; ?>
                    <?php $i = $i+1; endforeach; endif; ?>
            </div><?php endif; ?>
            <!-- nav -->
            

            
	<script type="text/javascript" src="/Car/Public/static/uploadify/jquery.uploadify.min.js"></script>
	<div class="main-title">
		<h2><?php echo isset($info['id'])?'编辑':'新增';?>用户信息</h2>
	</div>
	<div class="tab-wrap">
		<ul class="tab-nav nav">
			<li data-tab="tab1" class="current"><a href="javascript:void(0);">基 础</a></li>
		</ul>
		<div class="tab-content">
			<form action="<?php echo U(User/edit);?>" method="post" class="form-horizontal">
				<!-- 基础 -->
				<div id="tab1" class="tab-pane in tab1">

          <div class="controls">
  						<label class="item-label">头像</label>
  						<input type="file" id="upload_picture">
  						<input type="hidden" name="headicon" id="headicon" value="<?php echo ((isset($info['headicon']) && ($info['headicon'] !== ""))?($info['headicon']):''); ?>"/>
  						<div class="upload-img-box">
  						<?php if(!empty($info['headicon'])): ?><div class="upload-pre-item"><img src="<?php echo (get_cover($info["headicon"],'path')); ?>"/></div><?php endif; ?>
  						</div>
  					</div>


					<div class="form-item">
						<label class="item-label">昵称</label>
						<div class="controls">
							<input type="text" name="username" class="text input-large" value="<?php echo ((isset($info["username"]) && ($info["username"] !== ""))?($info["username"]):''); ?>">
						</div>
					</div>

          <div class="form-item">
						<label class="item-label">余额（元）</label>
						<div class="controls">
							<input type="text" name="remain" class="text input-large" value="<?php echo ((isset($info["remain"]) && ($info["remain"] !== ""))?($info["remain"]):''); ?>">
						</div>
					</div>

          <div class="form-item">
						<label class="item-label">已查询次数</label>
						<div class="controls">
							<input type="text" name="count" class="text input-large" value="<?php echo ((isset($info["count"]) && ($info["count"] !== ""))?($info["count"]):''); ?>">
						</div>
					</div>

          <script type="text/javascript">
					//上传图片
				    /* 初始化上传插件 */
					$("#upload_picture").uploadify({
				        "height"          : 30,
				        "swf"             : "/Car/Public/static/uploadify/uploadify.swf",
				        "fileObjName"     : "download",
				        "buttonText"      : "上传图片",
				        "uploader"        : "<?php echo U('File/uploadPicture',array('session_id'=>session_id()));?>",
				        "width"           : 120,
				        'removeTimeout'	  : 1,
				        'fileTypeExts'	  : '*.jpg; *.png; *.gif;',
				        "onUploadSuccess" : uploadPicture,
				        'onFallback' : function() {
				            alert('未检测到兼容版本的Flash.');
				        }
				    });
					function uploadPicture(file, data){
				    	var data = $.parseJSON(data);
				    	var src = '';
				        if(data.status){
				        	$("#headicon").val(data.id);
				        	src = data.url || '/Car' + data.path;
				        	$("#headicon").parent().find('.upload-img-box').html(
				        		'<div class="upload-pre-item"><img src="' + src + '"/></div>'
				        	);
				        } else {
				        	updateAlert(data.info);
				        	setTimeout(function(){
				                $('#top-alert').find('button').click();
				                $(that).removeClass('disabled').prop('disabled',false);
				            },1500);
				        }
				    }
					</script>
					<!-- <div class="form-item">
						<label class="item-label">状态<span class="check-tips">（1-可用，2-禁用）</span></label>
						<div class="controls">
							<label class="textarea input-large">
								<input type="text" name="status" class="text input-large" value="<?php echo ((isset($info["status"]) && ($info["status"] !== ""))?($info["status"]):'1'); ?>">
							</label>
						</div>
					</div>
				</div> -->

				<div class="form-item">
					<input type="hidden" name="id" value="<?php echo ((isset($info["id"]) && ($info["id"] !== ""))?($info["id"]):''); ?>">
					<input type="hidden" name="pid" value="<?php echo isset($category['id'])?$category['id']:$info['pid'];?>">
					<button type="submit" id="submit" class="btn submit-btn ajax-post" target-form="form-horizontal">确 定</button>
					<button class="btn btn-return" onclick="javascript:history.back(-1);return false;">返 回</button>
				</div>

			</form>
		</div>
	</div>

        </div>
        <!-- <div class="cont-ft">
            <div class="copyright">
                <div class="fl">感谢使用<a href="http://www.onethink.cn" target="_blank">OneThink</a>管理平台</div>
                <div class="fr">V<?php echo (ONETHINK_VERSION); ?></div>
            </div>
        </div> -->
    </div>
    <!-- /内容区 -->
    <script type="text/javascript">
    (function(){
        var ThinkPHP = window.Think = {
            "ROOT"   : "/Car", //当前网站地址
            "APP"    : "/Car/admin.php?s=", //当前项目地址
            "PUBLIC" : "/Car/Public", //项目公共目录地址
            "DEEP"   : "<?php echo C('URL_PATHINFO_DEPR');?>", //PATHINFO分割符
            "MODEL"  : ["<?php echo C('URL_MODEL');?>", "<?php echo C('URL_CASE_INSENSITIVE');?>", "<?php echo C('URL_HTML_SUFFIX');?>"],
            "VAR"    : ["<?php echo C('VAR_MODULE');?>", "<?php echo C('VAR_CONTROLLER');?>", "<?php echo C('VAR_ACTION');?>"]
        }
    })();
    </script>
    <script type="text/javascript" src="/Car/Public/static/think.js"></script>
    <script type="text/javascript" src="/Car/Public/Admin/js/common.js"></script>
    <script type="text/javascript">
        +function(){
            var $window = $(window), $subnav = $("#subnav"), url;
            $window.resize(function(){
                $("#main").css("min-height", $window.height() - 130);
            }).resize();

            /* 左边菜单高亮 */
            url = window.location.pathname + window.location.search;
            url = url.replace(/(\/(p)\/\d+)|(&p=\d+)|(\/(id)\/\d+)|(&id=\d+)|(\/(group)\/\d+)|(&group=\d+)/, "");
            $subnav.find("a[href='" + url + "']").parent().addClass("current");

            /* 左边菜单显示收起 */
            $("#subnav").on("click", "h3", function(){
                var $this = $(this);
                $this.find(".icon").toggleClass("icon-fold");
                $this.next().slideToggle("fast").siblings(".side-sub-menu:visible").
                      prev("h3").find("i").addClass("icon-fold").end().end().hide();
            });

            $("#subnav h3 a").click(function(e){e.stopPropagation()});

            /* 头部管理员菜单 */
            $(".user-bar").mouseenter(function(){
                var userMenu = $(this).children(".user-menu ");
                userMenu.removeClass("hidden");
                clearTimeout(userMenu.data("timeout"));
            }).mouseleave(function(){
                var userMenu = $(this).children(".user-menu");
                userMenu.data("timeout") && clearTimeout(userMenu.data("timeout"));
                userMenu.data("timeout", setTimeout(function(){userMenu.addClass("hidden")}, 100));
            });

	        /* 表单获取焦点变色 */
	        $("form").on("focus", "input", function(){
		        $(this).addClass('focus');
	        }).on("blur","input",function(){
				        $(this).removeClass('focus');
			        });
		    $("form").on("focus", "textarea", function(){
			    $(this).closest('label').addClass('focus');
		    }).on("blur","textarea",function(){
			    $(this).closest('label').removeClass('focus');
		    });

            // 导航栏超出窗口高度后的模拟滚动条
            var sHeight = $(".sidebar").height();
            var subHeight  = $(".subnav").height();
            var diff = subHeight - sHeight; //250
            var sub = $(".subnav");
            if(diff > 0){
                $(window).mousewheel(function(event, delta){
                    if(delta>0){
                        if(parseInt(sub.css('marginTop'))>-10){
                            sub.css('marginTop','0px');
                        }else{
                            sub.css('marginTop','+='+10);
                        }
                    }else{
                        if(parseInt(sub.css('marginTop'))<'-'+(diff-10)){
                            sub.css('marginTop','-'+(diff-10));
                        }else{
                            sub.css('marginTop','-='+10);
                        }
                    }
                });
            }
        }();
    </script>
    
	<link href="/Car/Public/static/datetimepicker/css/datetimepicker.css" rel="stylesheet" type="text/css">
	<?php if(C('COLOR_STYLE')=='blue_color') echo '<link href="/Car/Public/static/datetimepicker/css/datetimepicker_blue.css" rel="stylesheet" type="text/css">'; ?>
	<link href="/Car/Public/static/datetimepicker/css/dropdown.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="/Car/Public/static/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="/Car/Public/static/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<script type="text/javascript">
		<?php if(isset($info["id"])): ?>Think.setValue("allow_publish", <?php echo ((isset($info["allow_publish"]) && ($info["allow_publish"] !== ""))?($info["allow_publish"]):1); ?>);
		Think.setValue("check", <?php echo ((isset($info["check"]) && ($info["check"] !== ""))?($info["check"]):0); ?>);
		Think.setValue("model[]", <?php echo (json_encode($info["model"])); ?> || [1]);
		Think.setValue("model_sub[]", <?php echo (json_encode($info["model_sub"])); ?> || [1]);
		Think.setValue("type[]", <?php echo (json_encode($info["type"])); ?> || [2]);
		Think.setValue("display", <?php echo ((isset($info["display"]) && ($info["display"] !== ""))?($info["display"]):1); ?>);
		Think.setValue("reply", <?php echo ((isset($info["reply"]) && ($info["reply"] !== ""))?($info["reply"]):0); ?>);
		Think.setValue("reply_model[]", <?php echo (json_encode($info["reply_model"])); ?> || [1]);<?php endif; ?>
		$(function(){
			$('.time').datetimepicker({
					format: 'yyyy-mm-dd hh:ii',
					language:"zh-CN",
					minView:2,
					autoclose:true
			});
			showTab();
			$("input[name=reply]").change(function(){
				var $reply = $(".form-item.reply");
				parseInt(this.value) ? $reply.show() : $reply.hide();
			}).filter(":checked").change();
		});
		//导航高亮
		//highlight_subnav('<?php echo U('Fcoupon/edit');?>');
	</script>

</body>
</html>