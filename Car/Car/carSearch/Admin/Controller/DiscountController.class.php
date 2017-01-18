<?php

namespace Admin\Controller;
use Think\Page;

/**
 * 后台内容控制器
 * @author
 */
class DiscountController extends AdminController {

 public function index() {

   

    $this->display();

 }
/***禁用***/
 public function enable(){
     $id     =   I('id');
     $msg    =   array('success'=>'启用成功', 'error'=>'启用失败');
     $this->resume('Discount', "id={$id}", $msg);
 }

 /***禁用***/
 public function disable(){
     $id     =   I('id');
     $msg    =   array('success'=>'禁用成功', 'error'=>'禁用失败');
     $this->forbid('Discount', "id={$id}", $msg);
 }








}
