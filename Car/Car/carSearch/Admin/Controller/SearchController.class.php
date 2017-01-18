<?php


namespace Admin\Controller;

class SearchController extends AdminController {

    public function index(){
      //   /* 查询条件初始化 */
      //   if ( isset($_GET['time-start']) ) {
      //       $map['starttime'][] = array('egt',strtotime(I('time-start')));
      //   }
      //   if ( isset($_GET['time-end']) ) {
      //       $map['endtime'][] = array('elt',24*60*60 + strtotime(I('time-end')));
      //   }
      //  $map  = array('status' => 1);
      //  $list = $this->lists('search', $map,'id');
      //    $this->assign('list', $list);
        $list = M('Search')->select();
        $this->assign('list',$list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $this->meta_title = '查询管理';
        $this->display();
    }

    //显示用户的修改项
  function edit(){
    $search=M('Search');
    if(IS_POST){
    $search->create();
    if($search->save()) {
      $this->success('更新成功',U('index'));
    } else {
      $this->error('更新失败');
    }
   }
    $id=(int)$_GET['id'];
    $list=$search->where("id=$id")->find();
    $this->assign('info',$list);
    $this->assign('title','显示用户编辑信息');
    $this->display();
  }

    /* 新增分类 */
    public function add(){
         if(empty($_POST)) {
           $search = D("Search");
           $attr = $search->select();
           $this->assign("info",$attr);
           $this->display('edit');
         } else {
           $search = D("Search");
           $search->create();
           $r = $search->add();
           if($r) {
             $this->success("添加成功",U('index'));
           }else {
             $this->error("添加失败");
           }
         }
        }


 public function del(){
       if(IS_POST){
             $ids = I('post.id');
            $order = M("Search");

            if(is_array($ids)){
                             foreach($ids as $id){

                             $order->where("id='$id'")->delete();

                }
            }
           $this->success("删除成功！");
        }else{
            $id = I('get.id');
            $db = M("search");
            $status = $db->where("id='$id'")->delete();
            if ($status){
                $this->success("删除成功！");
            }else{
                $this->error("删除失败！");
            }
        }
    }

}
