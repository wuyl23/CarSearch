<?php


namespace Admin\Controller;

class FcouponController extends AdminController {

    public function index(){
        /* 查询条件初始化 */
        if ( isset($_GET['time-start']) ) {
            $map['starttime'][] = array('egt',strtotime(I('time-start')));
        }
        if ( isset($_GET['time-end']) ) {
            $map['endtime'][] = array('elt',24*60*60 + strtotime(I('time-end')));
        }
       $map  = array('status' => 1);
       $list = $this->lists('fcoupon', $map,'id');

        $this->assign('list', $list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $this->meta_title = '优惠管理';
        $this->display();
    }

  /* 编辑分类 */
    public function edit($id = null, $pid = 0){
        $fcoupon = D('Fcoupon');

        if(IS_POST){ //提交表单
            if(false !== $fcoupon->update()){
                $this->success('编辑成功！', U('index'));
            } else {
                $error = $fcoupon->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
            $cate = '';
            if($pid){
                /* 获取上级分类信息 */
                $cate = $fcoupon->info($pid, 'id,name,title,status');
                if(!($cate && 1 == $cate['status'])){
                    $this->error('指定的上级分类不存在或被禁用！');
                }
            }

            /* 获取分类信息 */
            $info = $id ? $fcoupon->info($id) : '';

            $this->assign('info',       $info);
            $this->assign('category',   $cate);
            $this->meta_title = '编辑优惠';
            $this->display();
        }
    }

    /* 新增分类 */
    public function add(){
        $fcoupon = D('fcoupon');

        if(IS_POST){ //提交表单
            if(false !== $fcoupon->update()){
                $this->success('新增成功！', U('index'));
            } else {
                $error = $fcoupon->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
            $cate = array();
            if($pid){
                /* 获取上级优惠券信息 */
                $cate = $fcoupon->info($pid, 'id,title,status');
                if(!($cate && 1 == $cate['status'])){
                    $this->error('指定的上级分类不存在或被禁用！');
                }
            }

            /* 获取优惠券信息 */
            $this->assign('info', null);
            $this->assign('category', $cate);
            $this->meta_title = '新增优惠';
            $this->display('edit');
        }
    }
    
    public function operate($type = 'move'){
        //检查操作参数
        if(strcmp($type, 'move') == 0){
            $operate = '移动';
        }elseif(strcmp($type, 'merge') == 0){
            $operate = '合并';
        }else{
            $this->error('参数错误！');
        }
        $from = intval(I('get.from'));
        empty($from) && $this->error('参数错误！');

        //获取分类
        $map = array('status'=>1, 'id'=>array('neq', $from));
        $list = M('Fcoupon')->where($map)->field('id,pid,title')->select();


        //移动分类时增加移至根分类
        if(strcmp($type, 'move') == 0){
        	//不允许移动至其子孙分类
        	$list = tree_to_list(list_to_tree($list));

        	$pid = M('fcoupon')->getFieldById($from, 'pid');
        	$pid && array_unshift($list, array('id'=>0,'title'=>'根分类'));
        }

        $this->assign('type', $type);
        $this->assign('operate', $operate);
        $this->assign('from', $from);
        $this->assign('list', $list);
        $this->meta_title = $operate.'分类';
        $this->display();
    }


function makecode(){
        $endtime=1356019200;//2012-12-21时间戳
        $curtime=time();//当前时间戳
        $newtime=$curtime-$endtime;//新时间戳
        $rand=rand(10,9999);//两位随机
        $all=$rand.$newtime;
        $onlyid=base_convert($all,10,36);//把10进制转为36进制的唯一ID
      if($onlyid){
	  $data['status'] = "1";
	  $data['code'] = $onlyid;
       $data['info'] = '获取成功';
	  $this->ajaxReturn($data);

	  }
	  else{
		  $data['status'] = "1";
       $data['info'] = '获取失败';


	  }

}
 public function del(){
       if(IS_POST){
             $ids = I('post.id');
            $order = M("fcoupon");

            if(is_array($ids)){
                             foreach($ids as $id){

                             $order->where("id='$id'")->delete();

                }
            }
           $this->success("删除成功！");
        }else{
            $id = I('get.id');
            $db = M("fcoupon");
            $status = $db->where("id='$id'")->delete();
            if ($status){
                $this->success("删除成功！");
            }else{
                $this->error("删除失败！");
            }
        }
    }

}
