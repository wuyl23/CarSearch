<?php


namespace Admin\Controller;
use User\Api\UserApi;

/**
 * 后台用户控制器
 * @author
 */
class MemberController extends AdminController {

    /**
     * 用户管理首页
     * @author
     */
    public function index(){
        $nickname       =   I('nickname');
        $map['status']  =   array('egt',0);
        if(is_numeric($nickname)){
            $map['uid|nickname']=   array(intval($nickname),array('like','%'.$nickname.'%'),'_multi'=>true);
        }else{
            $map['nickname']    =   array('like', '%'.(string)$nickname.'%');
        }

        $list   = $this->lists('Member', $map);
        int_to_string($list);
        $this->assign('_list', $list);
        $this->meta_title = '用户信息';
        $this->display();
    }


    public function updateNickname(){
        $nickname = M('Member')->getFieldByUid(UID, 'nickname');
        $this->assign('nickname', $nickname);
        $this->meta_title = '修改昵称';
        $this->display('updatenickname');
    }

    /**
     * 修改昵称提交
     * @author
     */
    public function submitNickname(){
        //获取参数
        $nickname = I('post.nickname');
        $password = I('post.password');
        empty($nickname) && $this->error('请输入昵称');
        empty($password) && $this->error('请输入密码');

        //密码验证
        $User   =   new UserApi();
        $uid    =   $User->login(UID, $password, 4);
        ($uid == -2) && $this->error('密码不正确');

        $Member =   D('Member');
        $data   =   $Member->create(array('nickname'=>$nickname));
        if(!$data){
            $this->error($Member->getError());
        }

        $res = $Member->where(array('uid'=>$uid))->save($data);

        if($res){
            $user               =   session('user_auth');
            $user['username']   =   $data['nickname'];
            session('user_auth', $user);
            session('user_auth_sign', data_auth_sign($user));
            $this->success('修改昵称成功！');
        }else{
            $this->error('修改昵称失败！');
        }
    }

    /**
     * 修改密码初始化
     * @author
     */
    public function updatePassword(){
        $this->meta_title = '修改密码';
        $this->display('updatepassword');
    }

    /**
     * 修改密码提交
     * @author
     */
    public function submitPassword(){
        //获取参数
        $password   =   I('post.old');
        empty($password) && $this->error('请输入原密码');
        $data['password'] = I('post.password');
        empty($data['password']) && $this->error('请输入新密码');
        $repassword = I('post.repassword');
        empty($repassword) && $this->error('请输入确认密码');

        if($data['password'] !== $repassword){
            $this->error('您输入的新密码与确认密码不一致');
        }

        $Api    =   new UserApi();
        $res    =   $Api->updateInfo(UID, $password, $data);
        if($res['status']){
            $this->success('修改密码成功！');
        }else{
            $this->error($res['info']);
        }
    }


        /***充值记录****/
      public function pay_List(){
        $nickname = I('username');
        if(isset($_GET['way'])){
            $map['way'] = I('way');
            $status = $map['way'];
        }else{
            $status = null;
            $map['way'] = array('in', '0,1');
        }
        if(is_numeric($nickname)){
          $map['id|username']= array(intval($username),array('like','%'.$username.'%'),'_multi'=>true);
        }else{
          $map['username'] = array('like','%'.(string)$username.'%');
        }
        $list = $this->lists('Recharge',$map);
        int_to_string($list);
        $this->assign('_list',$list);
        $this->meta_title = '充值记录';
        $this->display();


        // $username = M('Recharge')->getFieldByUid(ID,'username');
        // $username = M('Member');
        // $info = $username->select();
        // $this->assign('info',$info);
        // $this->meta_title = '充值记录';
        // $this->display();
      }
 /***充值记录****/
    public function spend_List(){
     $nickname = I('username');
     $map['status'] = array('egt',0);
     if(is_numeric($nickname)){
       $map['id|username']= array(intval($username),array('like','%'.$username.'%'),'_multi'=>true);
     }else{
       $map['username'] = array('like','%'.(string)$username.'%');
     }
     $list = $this->lists('Expense',$map);
     int_to_string($list);
     $this->assign('_list',$list);
     $this->meta_title = '消费记录';
     $this->display();
    }

   //充值记录删除
    public function remove(){
        $id = $_GET[id];
        $recharge = M('Recharge');
        if($recharge->where("id=$id")->delete()){
          $this->success('删除成功',U('User/pay_list'));
        } else {
          $this->error('删除失败');
        }
    }
   //消费记录删除
    public function del() {
      $id = $_GET[id];
      $expense = M('Expense');
      if($expense->where("id = $id")->delete()){
        $this->success('删除成功',U('User/spend_list'));
      } else {
        $this->error('删除失败');
      }
    }

   //用户删除
    public function delete() {
      $id = $_GET[id];
      $member = M('Member');
      if($member->where("uid = $id")->delete()) {
        $this->success('删除成功',U('User/index'));
      } else {
        $this->error('删除失败');
      }
    }
    /**
     * 用户行为列表
     * @author
     */
    public function action(){
        //获取列表数据
        $Action =   M('Action')->where(array('status'=>array('gt',-1)));
        $list   =   $this->lists($Action);
        int_to_string($list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $this->assign('_list', $list);
        $this->meta_title = '用户行为';
        $this->display();
    }

    /**
     * 新增行为
     * @author
     */
    public function addAction(){
        $this->meta_title = '新增行为';
        $this->assign('data',null);
        $this->display('editaction');
    }

    /**
     * 编辑行为
     * @author
     */
    public function editAction(){
        $id = I('get.id');
        empty($id) && $this->error('参数不能为空！');
        $data = M('Action')->field(true)->find($id);

        $this->assign('data',$data);
        $this->meta_title = '编辑行为';
        $this->display('editaction');
    }

    /**
     * 更新行为
     * @author
     */
    public function saveAction(){
        $res = D('Action')->update();
        if(!$res){
            $this->error(D('Action')->getError());
        }else{
            $this->success($res['id']?'更新成功！':'新增成功！', Cookie('__forward__'));
        }
    }

    /**
     * 会员状态修改
     * @author
     */
    public function changeStatus($method=null){
        $id = array_unique((array)I('id',0));
        if( in_array(C('USER_ADMINISTRATOR'), $id)){
            $this->error("不允许对超级管理员执行该操作!");
        }
        $id = is_array($id) ? implode(',',$id) : $id;
        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }
        $map['uid'] =   array('in',$id);
        switch ( strtolower($method) ){
            case 'forbiduser':
                $this->forbid('Member', $map );
                break;
            case 'resumeuser':
                $this->resume('Member', $map );
                break;
            case 'deleteuser':
                $this->delete('Member', $map );
                break;
            default:
                $this->error('参数非法');
        }
    }

    // public function Status($method=null) {
    //   $id = is_array($id) ? implode(',',$id) : $id;
    //   if(empty($id)) {
    //     $this->error('请选择要操作的数据');
    //   }
    //   map['id'] = array('in',$id);
    //   switch (strtolower($method)) {
    //     case 'success':
    //     $this->success('Recharge',$map);
    //     break;
    //     case 'fail':
    //     $this->fail('Recharge',$map);
    //     break;
    //     default:
    //     $this->error('参数非法');
    //   }
    // }
     //添加用户
    public function add($username = '', $password = '', $repassword = '', $email = ''){
        if(IS_POST){
            /* 检测密码 */
            if($password != $repassword){
                $this->error('密码和重复密码不一致！');
            }

            /* 调用注册接口注册用户 */
            $User   =   new UserApi;
            $uid    =   $User->register($username, $password, $email);
            if(0 < $uid){ //注册成功
                $user = array('uid' => $uid, 'nickname' => $username,'password' => $password,'status' => 1);
                if(!M('Member')->add($user)){
                    $this->error('用户添加失败！');
                } else {
                    $this->success('用户添加成功！',U('index'));
                }
            } else { //注册失败，显示错误信息
                $this->error($this->showRegError($uid));
            }
        } else {
            $this->meta_title = '新增用户';
            $this->display();
        }
    }

    /**
     * 获取用户注册错误信息
     * @param  integer $code 错误编码
     * @return string        错误信息
     */
    private function showRegError($code = 0){
        switch ($code) {
            case -1:  $error = '用户名长度必须在16个字符以内！'; break;
            case -2:  $error = '用户名被禁止注册！'; break;
            case -3:  $error = '用户名被占用！'; break;
            case -4:  $error = '密码长度必须在6-30个字符之间！'; break;
            case -5:  $error = '邮箱格式不正确！'; break;
            case -6:  $error = '邮箱长度必须在1-32个字符之间！'; break;
            case -7:  $error = '邮箱被禁止注册！'; break;
            case -8:  $error = '邮箱被占用！'; break;
            case -9:  $error = '手机格式不正确！'; break;
            case -10: $error = '手机被禁止注册！'; break;
            case -11: $error = '手机号被占用！'; break;
            default:  $error = '未知错误';
        }
        return $error;
    }

}