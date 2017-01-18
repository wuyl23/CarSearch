<?php
  namespace Admin\Controller;
  use Think\Page;


  class FeedbackController extends AdminController {

    public function index() {

       $list = M('feedback')->select();
       $this->assign('list',$list);
       $this->display();

    }

    public function remove(){
        $id = $_GET['id'];
        $feedback = M('feedback');
        //$feedback->where('uid="$id"')->delete();
    if($feedback->where("uid=$id")->delete()){
      $this->success('删除成功',U('Feedback/index'));
    }
    else {
      $this->error('删除失败');
    }

  }






}
 ?>
