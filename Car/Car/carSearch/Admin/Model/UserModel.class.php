<?php
namespace Admin\Model;
use Think\Model;


class UserModel extends Model {
  protected $_validate = array(
      array('username', '1,16', '昵称长度为1-16个字符', self::EXISTS_VALIDATE, 'length'),
      array('username', '', '昵称被占用', self::EXISTS_VALIDATE, 'unique'), //用户名被占用
  );

  public function lists($status = 1, $order = 'id DESC', $field = true){
      $map = array('status' => $status);
      return $this->field($field)->where($map)->order($order)->select();
  }

  public function login($id){
      /* 检测是否在当前应用注册 */
      $user = $this->field(true)->find($id);
      if(!$user || 1 != $user['status']) {
          $this->error = '用户不存在或已被禁用！'; //应用级别禁用
          return false;
      }

      //记录行为
      action_log('user_login', 'user', $id, $id);

      /* 登录用户 */
      $this->autoLogin($user);
      return true;
  }

  /**
   * 注销当前用户
   * @return void
   */
  public function logout(){
      session('user_auth', null);
      session('user_auth_sign', null);
  }

  /**
   * 自动登录用户
   * @param  integer $user 用户信息数组
   */
  private function autoLogin($user){
      /* 更新登录信息 */
      $data = array(
          'id'             => $user['id'],
          'login'           => array('exp', '`login`+1'),
          'reg_time'        =>$_server['server_time'],
          'last_login_time' => NOW_TIME,
          'last_login_ip'   => get_client_ip(1),
      );
      $this->save($data);

      /* 记录登录SESSION和COOKIES */
      $auth = array(
          'id'             => $user['id'],
          'username'        => $user['username'],
          'password'        => $user['password'],
          'reg_time'        => $server_time['server_time'],
          'last_login_time' => $user['last_login_time'],
      );

      session('user_auth', $auth);
      session('user_auth_sign', data_auth_sign($auth));

  }

  public function getNickName($id){
      return $this->where(array('id'=>(int)$id))->getField('username');
  }





}

















 ?>
