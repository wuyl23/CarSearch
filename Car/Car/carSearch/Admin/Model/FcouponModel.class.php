<?php
namespace Admin\Model;
use Think\Model;




/**
 * 优惠券模型
 */
class FcouponModel extends Model{

    protected $_validate = array(


        array('title', 'require', '名称不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),



    );

    /* 自动完成规则 */
    protected $_auto = array(
        array('starttime', 'getCreateTime', self::MODEL_BOTH,'callback'),
        array('endtime', 'getEndTime', self::MODEL_BOTH,'callback'),
    );


    protected function _after_find(&$result,$options) {

      $result['starttime'] = date('Y-m-d', $result['starttime']);
      $result['endtime'] = date('Y-m-d', $result['endtime']);
    }

    /* 时间处理规则 */
    protected function getCreateTime(){
      $starttime    =   I('post.starttime');
      return $starttime?strtotime($starttime):NOW_TIME;
    }

    /* 时间处理规则 */
    protected function getEndTime(){
      $endtime    =   I('post.endtime');
      return $endtime?strtotime($endtime):NOW_TIME;
    }


    /**
     * 获取优惠券详细信息
     * @param  milit   $id 优惠券ID或标识
     * @param  boolean $field 查询字段
     * @return array     优惠券信息
     */
    public function info($id, $field = true){
        /* 获取优惠券信息 */
        $map = array();
        if(is_numeric($id)){ //通过ID查询
            $map['id'] = $id;
        } else { //通过标识查询
            $map['name'] = $id;
        }
        return $this->field($field)->where($map)->find();
    }

    /**
     * 获取优惠券树，指定优惠券则返回指定优惠券极其子优惠券，不指定则返回所有优惠券树
     * @param  integer $id    优惠券ID
     * @param  boolean $field 查询字段
     * @return array          优惠券树
     */


    /**
     * 更新优惠券信息
     * @return boolean 更新状态
     */
    public function update(){
        $data = $this->create();
        if(!$data){ //数据对象创建错误
            return false;
        }

        /* 添加或更新数据 */
        if(empty($data['id'])){
            $res = $this->add();
        }else{
            $res = $this->save();
        }
        // $res = array(
        //     'id'                =>$fcoupon['id'],
        //     'startttime'        =>$_server['server_time'],
        //     'endtime'        =>$Think.now,
        // );
        // $this->save($res);
        //更新优惠券缓存
        S('sys_fcoupon_list', null);

        //记录行为
        action_log('update_fcoupon', 'fcoupon', $data['id'] ? $data['id'] : $res, UID);

        return $res;
    }


}
