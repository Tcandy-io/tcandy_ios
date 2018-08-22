//
//  TGUrlsConfigure.h
//  Tcandy
//
//  Created by mac on 2018/8/20.
//  Copyright © 2018年 tcandy. All rights reserved.
//

#ifndef TGUrlsConfigure_h
#define TGUrlsConfigure_h
#define DIS @"http://www.weirr.cn/"
#define ROOT  [NSString stringWithFormat:@"%@%@",DIS, @"?act=api&ctrl="]
#define ImageROOT  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=wap&act="]
// 查看订单访问的url
#define web_view_url  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=base&act=ordermessage&ctrl=getOrderMsg"]
// shake_url
#define shake_url [NSString stringWithFormat:@"%@%@",ImageROOT,@"other&ctrl=invfriends1&name="]
// app启动访问的url
#define app_url  [NSString stringWithFormat:@"%@%@",DIS, @"?act=api&ctrl=is_app"]
// 商品搜索
#define search_goods  [NSString stringWithFormat:@"%@%@",DIS, @"?act=atbapi&ctrl=getgoods"]
// 我的邀请
#define my_invaite [NSString stringWithFormat:@"%@%@",ROOT, @"getFirendOrder"]
// 邀请累积的奖励,成功邀请的人数
#define invited_count [NSString stringWithFormat:@"%@%@",ROOT, @"InvitationAward"]
// 首页轮播banner
#define banner [NSString stringWithFormat:@"%@%@",ROOT, @"getSlides"]
// 商品
#define classify  [NSString stringWithFormat:@"%@%@",DIS, @"?act=api&ctrl=getCates"]

//新增快速入口分类
#define add_classify  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=goods_cate&ctrl=getCates"]
//新增快速入口商品列表
#define add_goods  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=getgoods&ctrl=getgoods"]
//咚咚抢时间接口
#define dd_time  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=goods_cate&ctrl=dd_time"]

//商品二级分类
#define classify_two  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_new_jk&ctrl=two_cate"]
// 首页快速入口
#define home_grid [NSString stringWithFormat:@"%@%@",ROOT, @"getIcon"]
// 获取品牌店铺
#define brand [NSString stringWithFormat:@"%@%@",ROOT, @"getDp"]
// 获取短信验证码
#define get_code [NSString stringWithFormat:@"%@%@",ROOT, @"getcode"]
// 检验短信的验证码
#define check_code [NSString stringWithFormat:@"%@%@",ROOT, @"checkcode"]
// 登录
#define login [NSString stringWithFormat:@"%@%@",ROOT, @"login"]
// 注册
#define register [NSString stringWithFormat:@"%@%@",ROOT, @"register"]
// 获取用户信息
#define info [NSString stringWithFormat:@"%@%@",ROOT, @"getUserInfo"]
// 获取积分
#define integration [NSString stringWithFormat:@"%@%@",ROOT, @"getIntegral"]
// 修改个人资料
#define updateuser [NSString stringWithFormat:@"%@%@",ROOT, @"updateUser"]
// 商城返利标题
#define mallclassify [NSString stringWithFormat:@"%@%@",ROOT, @"getmallalliancecates"]
// 商城返利店铺
#define mall [NSString stringWithFormat:@"%@%@",ROOT, @"getmallalliance"]
// 热门搜索
#define hot_search [NSString stringWithFormat:@"%@%@",ROOT, @"getkeyword"]
// 详细教程url
#define webfanli [NSString stringWithFormat:@"%@%@",ImageROOT,@"help&ctrl=course"]
// 第三方登录接口
#define three_login [NSString stringWithFormat:@"%@%@",ROOT, @"threelogin"]
// 用户反馈
#define feedback [NSString stringWithFormat:@"%@%@",ROOT, @"setideasBox"]
// 获取帮助
#define helper [NSString stringWithFormat:@"%@%@",ROOT, @"gethelper"]
// 我的喜欢
#define my_favorite [NSString stringWithFormat:@"%@%@",ROOT, @"getmylike"]
// 邀请有奖图片
#define invitate [NSString stringWithFormat:@"%@%@",ROOT, @"getpic"]
// 获取商品
#define goods [NSString stringWithFormat:@"%@%@",ROOT, @"getgoods"]
// 逛逛第二排
#define second_classsify [NSString stringWithFormat:@"%@%@",ROOT, @"getCatesChild"]
// 浏览足迹
#define his_baby [NSString stringWithFormat:@"%@%@",ROOT, @"getfootmark"]
// 邀请榜单TOP3
#define top3 [NSString stringWithFormat:@"%@%@",ROOT, @"getExtendtopthree"]
// 对商品添加喜欢
#define add_like [NSString stringWithFormat:@"%@%@",ROOT, @"addmylike"]
// 对商品添加浏览足迹
#define add_foot [NSString stringWithFormat:@"%@%@",ROOT, @"addfootmark"]
// 对商品删除喜欢
#define delete_like [NSString stringWithFormat:@"%@%@",ROOT, @"deletemylike"]
// 重置密码
#define reset_pass [NSString stringWithFormat:@"%@%@",ROOT, @"forgetPwd"]
// 淘宝返利跳转爱淘宝接口
#define taobao_return [NSString stringWithFormat:@"%@%@",ROOT, @"gettaobaoUrl"]
// 会员等级
#define vip_level [NSString stringWithFormat:@"%@%@",ROOT, @"getUserLevel"]
// 消息中心
#define url_message [NSString stringWithFormat:@"%@%@",ROOT, @"getMsg"]
// 消息详情
#define message_detail [NSString stringWithFormat:@"%@%@",ROOT, @"getMsgDetail"]
// 发送订单号给后台
#define send_order [NSString stringWithFormat:@"%@%@",ROOT, @"updateOrder"]
// 获取订单
#define get_order [NSString stringWithFormat:@"%@%@",ROOT, @"getOrder"]
// 摇一摇商品
#define shake [NSString stringWithFormat:@"%@%@",ROOT, @"shake"]
// 摇一摇积分信息
#define shakemessage [NSString stringWithFormat:@"%@%@",ROOT, @"shakemessage"]
// 摇一摇记录
#define shakehis [NSString stringWithFormat:@"%@%@",ROOT, @"shakerecord"]
// 摇一摇分享url
#define share_url [NSString stringWithFormat:@"%@%@",ImageROOT,@"other&ctrl=invfriends1&name="]
// 启动广告图
#define advertise [NSString stringWithFormat:@"%@%@",ROOT, @"getstartpic"]
// 获取省份
#define province [NSString stringWithFormat:@"%@%@",ROOT, v"getProvince"]
// 获取城市
#define city [NSString stringWithFormat:@"%@%@",ROOT, @"getCity"]
// 获取区域
#define area [NSString stringWithFormat:@"%@%@",ROOT, @"getDistrict"]
// 检查版本
#define version [NSString stringWithFormat:@"%@%@",ROOT, @"checkversion"]
// 第三方分享标题，url,图片
#define share_title [NSString stringWithFormat:@"%@%@",ROOT, @"getShareInfo"]
// 绑定订单号
#define bind_order [NSString stringWithFormat:@"%@%@",ROOT, @"bindfourOrder"]
// 基本设置
#define basesetting  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appset&ctrl=getset"]
// 优惠卷商品列表
#define GOODSLIST  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=yhq_goods&ctrl=yhq_goodslist"]
// 商品详情
#define GOODSDETAIL  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=yhq_goods&ctrl=goodsdetail"]

// 新版商品详情
#define NEWGOODSDETAIL  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=newgoods_detail&ctrl=index"]
// 新版商品详情
#define JDGOODSDETAIL  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appJdGoodsDetail&ctrl=jdIndex"]
// 新版商品详情
#define PDDGOODSDETAIL  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appPddGoodsDetail&ctrl=pddIndex"]

//获取店铺详情
#define SHOPDETAIL  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=newgoods_detail&ctrl=dp_index"]

//获取店铺下面所有商品
#define SHOPALLGOODS  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=newgoods_detail&ctrl=dp_goods"]

// 限时抢购标题
#define LIMITTITLE  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dgmiaosha&ctrl=index"]
// 限时抢购商品
#define LIMITGOODS  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dgmiaosha&ctrl=getgoods"]
//订单发送
#define SENDORDER  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=tborder&ctrl=recordA"]

#define dis_center  [NSString stringWithFormat:@"%@%@",DIS, @"?act=fxapi&ctrl=fxzx"]
#define dis_centerIcon  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_fxico"]
#define dis_money  [NSString stringWithFormat:@"%@%@",DIS, @"?act=fxapi&ctrl=wdyj"]
//分销中心-收益统计
#define dis_income  [NSString stringWithFormat:@"%@%@",DIS, @"?act=fxapi&ctrl=sytj"]
#define dis_qr  [NSString stringWithFormat:@"%@%@",DIS, @"?act=fxapi&ctrl=qrcode"]
#define dis_team  [NSString stringWithFormat:@"%@%@",DIS, @"?act=fxapi&ctrl=qdcy"]
#define dis_order  [NSString stringWithFormat:@"%@%@",DIS, @"?act=fxapi&ctrl=order"]
#define dis_commission  [NSString stringWithFormat:@"%@%@",DIS, @"?act=fxapi&ctrl=yjly"]
#define RULE  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=wap&act=help&ctrl=fenxiao"]

//发送跟单接口订单的url
#define PCORODER  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=jsorder&ctrl=html"]
//访问跟单网页订单的url
#define PCNETURL @"https://buyertrade.taobao.com/trade/itemlist/list_bought_items.htm?spm=875.7931836/B.a2226mz.8.TwK3Pc&t=20110530"]

/*
 * 嗨如意升级版接口
 * */
//首页广告图图片
#define HOMEPIC  [NSString stringWithFormat:@"%@%@",DIS, @"?act=api&ctrl=getpic"]
//首页中间图文
#define HOMEGETTUWEN  [NSString stringWithFormat:@"%@%@",DIS, @"?act=api&ctrl=gettuwen"]
//账单
#define BILLS  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=gh&act=ghdy&ctrl=szDetail"]
//红包提醒设置
#define TSREDSET  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=mlt&act=qhb&ctrl=hbtx"]
//商品详情下面的返利内容
#define GOODSDETIALSSS  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=mlt&act=xrfl&ctrl=tburl"]
//邀请好友
#define INVITEFRENDS  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=mlt&act=xrfl&ctrl=yqFriend"]
//邀请好友左上角时时文字
#define INVITENAMETIME  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=mlt&act=xrfl&ctrl=yqdt"]
//商城返利教程
#define SCFLSTUDY  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=wap&act=shouTu&ctrl=scjc"]
//淘宝返利教程
#define TBFLSTUDY  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=wap&act=help&ctrl=course"]
//品牌特卖分类
#define BRANDCLASSIFY  [NSString stringWithFormat:@"%@%@",DIS, @"?act=api&ctrl=getShopCates"]
//常见问题
#define USEHELP  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=wap&act=help&ctrl=usehelp"]
//用户协议
#define SETAGREEMENT  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=wap&act=shouTu&name=%E7%94%A8%E6%88%B7%E6%B3%A8%E5%86%8C%E5%8D%8F%E8%AE%AE"]
//首页预先设置好弹出的窗口商品
#define POPHOMEGOODS  [NSString stringWithFormat:@"%@%@",DIS, @"?act=api&ctrl=getkuang"]
//会员中心图标
#define USERICO  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_userico"]
//购买会员
#define VIP  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_vip&ctrl=upgrade"]
#define BUYVIP  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_payment&ctrl=vipRecharge"]
//代理申请界面
#define APPLICATIONAGENT  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=new_share&act=agency&ctrl=index"]
//缴费申请接口
#define BUYAGENT  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_payment&ctrl=payment_dl"]
//代理中心
#define AGENTCENTER  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=new_share&act=agency&ctrl=dl_list"]
//代理订单
#define AGENTORDER  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=new_share&act=agency&ctrl=dl_order"]
//获取海报
#define HAIBAO  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=new_share&act=agency&ctrl=ssAnnual"]
//百川sdk打开商品详情打开类型设置成跳转淘宝打开用的js交互链接
#define TBJS  [NSString stringWithFormat:@"%@%@",DIS, @"?act=gototaobao&ctrl=js&fnuo_id="]
//调转外链打开的商品详情是访问的记录链接
#define WAILIANURL  [NSString stringWithFormat:@"%@%@",DIS, @"?act=gototaobao&gid="]
//订单找回
#define FINDORDER  [NSString stringWithFormat:@"%@%@",DIS, @"?act=api&ctrl=reorder"]
//新家族成员
#define FamilyMeber  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appFamily&ctrl=myHhr"]
//商品详情页的精品推荐
#define JINGPINTUIJIAN  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=tj_goods"]
//商品详情页的创建分享
#define CREATESHARE  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=goods_fenxiang"]
//购物返利商品分类
#define SHOPRETURNCLASSIFY  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_new_jk&ctrl=cate"]
//超高返、超级券的图文
#define HIGHTQUANIMG  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_new_jk&ctrl=tuwen"]
//超高返、超级券的广告
#define HightQuanGuangGao  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_new_jk&ctrl=ggw"]
//合伙人商品库
#define PARTNERGOODS  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appHhr&ctrl=getGoods"]
//合伙人商品库分类
#define PARTNERCLASSIFY  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appHhr&ctrl=getCate"]
//合伙人推广商品图片合成
#define HECHENGTGIMG  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appHhr&ctrl=ercode"]
//分享界面内容
#define SHARECONTNE  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=fenxiang"]
//APP首页底部导航菜单图标
#define MainBottomImage  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_new_jk&ctrl=foot"]
//合伙人首页
#define PARTNERCENTER  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appHhr&ctrl=hhrIndex"]
//合伙人图标
#define PATERICON  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_fxico&ctrl=hhrzx"]
//合伙人收益报表
#define STATEMENTINCOME  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appHhr&ctrl=dl_list"]
//合伙人我的推广团队
#define METEAM  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appHhr&ctrl=myHhr"]
//合伙人我的粉丝
#define MEFANS  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appHhr&ctrl=myFan"]
//合伙人英雄榜
#define HERO  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appHhr&ctrl=yqFriend"]
//合伙人我的推广订单
#define METGORDER  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appHhr&ctrl=myOrder"]
//合伙人团队推广订单
#define TEAMTGORDER  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appHhr&ctrl=myteamOrder"]
//合伙人申请界面获取内容
#define GETPARTNERAPPLICATION  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appHhr&ctrl=index"]
//合伙人申请界面提交内容
#define SENDPARTNERAPPLICATION  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appHhr&ctrl=sqhhr"]
//商品详情的隐藏访问
#define HiDELOADURL  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=goods_fenxiang&ctrl=tdj&fnuo_id="]
//详情领券动态
#define LINGQUANSTATUS  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=newgoods_detail&ctrl=lqss"]
//添加详情领券动态
#define ADDLINGQUANSTATUS  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=newgoods_detail&ctrl=click_yhq"]
//登录界面详情
#define LOGIN_DETAIL  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_login&ctrl=pic"]
//登录界面-获取验证码
#define GET_VERIFY_CODE  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_login&ctrl=getcode"]
//登录界面-手机号登录
#define PHONE_LOGIN  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_login&ctrl=login"]
//支付宝-收款账号管理
#define INCOME_ACCOUNT_MANAGE  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_fls&ctrl=skzh"]
//个人中心-邀请好友
#define INVITE_FRIENDS  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=yqhy&ctrl=yqFriend"]
//个人中心
#define VIP_CENTER  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_fls&ctrl=mem_index"]
//个人中心-邀请好友排行榜
#define INVITE_FRIENDS_RANK  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=yqhy&ctrl=phb"]
//个人中心-签到
#define SIGN_DATA  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_fls&ctrl=qiandao"]
//个人中心-签到详情
#define SIGN_DETAIL  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_fls&ctrl=qd_jl"]
//个人中心-签到操作
#define SIGN_OPERATE  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_fls&ctrl=qd_doing"]
//个人心-福利社
#define BENEFITS  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_fls&ctrl=index"]
//提现申请-数据
#define WITHDRAW_DATA  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_new_tx&ctrl=index"]
//提现申请-操作
#define WITHDRAW_OPERATE  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_new_tx&ctrl=txDoing"]
/*
 * 唯咖界面接口，这只是用于辅助提交APP审核的界面用
 * */
#define WK_DIS  DIS
//店铺列表
#define STORELIST [NSString stringWithFormat:@"%@%@",WK_DIS ,@"?mod=wk&act=dg_shop&ctrl=shopList"]
//合伙人英雄榜人数排名
#define HeroUpgradePerson  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appFamily&ctrl=teamUserCount"]
//合伙人英雄榜佣金排名
#define HeroUpgradeCommission  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appFamily&ctrl=teamUser"]
//帐号关联信息
#define AccountAssociation  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_zhgl&ctrl=index"]
//检测手机号绑定
#define CheckPhoneAssociation  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_zhgl&ctrl=checkPhone"]
//帐号合并操作
#define AssociationOperate  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_zhgl&ctrl=hb_doing"]
//帐号解绑操作
#define AssociationUnbindOperate  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_zhgl&ctrl=jcgl"]
//会员中心帐号绑定
#define VipAssociationBind  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_zhgl&ctrl=ksgl"]
//代理升级页面
#define AGENT_UPGRADE  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appHhr02&ctrl=index"]
//代理登记
#define AGENT_LEVEL  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appHhr02&ctrl=level"]

//用于获取热搜头部栏目
#define GETGOODSTYPE  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appJdPdd&ctrl=getType"]
//商品 0426
#define SerachMessage  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appJdPdd&ctrl=course"]
//商品搜索界面
#define NEWGOODS  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appGoods02&ctrl=getgoods"]
//拼多多订单
#define PINDUODUOORDER  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appOrder02&ctrl=getpddOrder"]
//拼多多订单
#define SHOPRETURNMESSAGE  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appJdPdd&ctrl=buyIndex"]
//搜索栏排序文字
#define SEARCHTEXT  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appGoodsCate02&ctrl=getSort"]
//拼多多纯图
#define PINDUODUOSHAREIMAGE  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appPddGoodsDetail&ctrl=share"]
//拼多多纯图
#define PINDUODUOSHAREIMAGEANDTEXT  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appPddGoodsDetail&ctrl=more_share"]
//拼多多纯图
#define JINGDONGSHAREIMAGE  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appJdGoodsDetail&ctrl=share"]
//拼多多纯图
#define JINGDONGMORESHAREIMAGE  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appJdGoodsDetail&ctrl=more_share"]
//新首页分类
#define NEW_HOME_CLASSIFY  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appGoodsCate02&ctrl=getCate"]
//拼多多分销中心
#define PDDDISTRUBEORDER  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appPddShareOrder&ctrl=fxOrder"]
//拼多多分销中心
#define JDDISTRUBEORDER  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appJdShareOrder&ctrl=fxOrder"]

//拼多多我的推广订单
#define PDDMETGORDER  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appPddShareOrder&ctrl=hhrMyOrder"]
//京东我的推广订单
#define JDMETGORDER  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appJdShareOrder&ctrl=hhrMyOrder"]


//用于获取合伙人家族成员头部
#define PARTNER_HEADER  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appFamily&ctrl=lv_list"]
//拼多多团队推广订单
#define PDDTEAMTGORDER  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appPddShareOrder&ctrl=hhrTeamOrder"]
//京东团队推广订单
#define JDTEAMTGORDER  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appJdShareOrder&ctrl=hhrTeamOrder"]
//拼多多跳转购买链接获取
#define PDD_URL  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appPddGoodsDetail&ctrl=pddUrl"]
//京东订单
#define JINGDONGORDER  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appOrder03&ctrl=getJdFloOrder"]
//合伙人商品库升级
#define PARTENER_GOODS  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appHhrGoods&ctrl=getGoods"]
//筛选店铺类型
#define SCREEN_SHOP  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=appGoodsCate02&ctrl=getSource"]
//拉新
#define NEWINVITATION  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=tbkNewApi&ctrl=getInviteData"]
//拉新详情月份
#define NEWINVITATIONMONTH  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=tbkNewApi&ctrl=listHead"]
//拉新详情月份账单
#define NEWINVITATIONMONTHDETAIL  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=tbkNewApi&ctrl=getOrderDetail"]
//拉新程艳
#define NEWINVITATIONTEAM  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=tbkNewApi&ctrl=getNewUserNum"]
//用来解析淘口令
#define TAOKOULING  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=tbkNewApi&ctrl=parseTbWord"]
//绑定支付宝
#define BIND_ALIPAY  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_app_updatestr&ctrl=alipay"]
//个人资料文字修改
#define PERSONAL_ALIPAY_TEXT  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_app_updatestr&ctrl=set"]
//消息中心文字修改
#define MSG_CENTER  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_app_updatestr&ctrl=message"]
//设置支付宝页面
#define SETTING_APLIPAY  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_app_updatestr&ctrl=setAlipay"]
//支付方式
#define PAYMENT_TYPE  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_app_updatestr&ctrl=zf_type"]
//绑定手机号页面文字
#define BIND_PHONE_TEXT  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_app_updatestr&ctrl=bindPhone"]
//获取图片地址
#define SHARE_GOODS  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=shareMoreImg&ctrl=ercode"]
//店铺详情
#define STORE_DETAIL_GOODS  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=getshopdetail&ctrl=index"]
//用于获取店铺评分
#define STORE_SCORE  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=getshopdetail&ctrl=getscore"]
//用于店铺详情信息
#define STORE_DETAIL  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=getshopdetail&ctrl=showIndex"]
//商城分类
#define STORE_CLASSIFY  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=circleOfFriends&ctrl=shopType"]
//发布朋友圈
#define PUBLISH_CIRCLE  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=circleOfFriends&ctrl=issueFriendCircle"]
//圈子首页头部分类
#define CIRCLE_TITLE_CLASSIFY  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=circleOfFriends&ctrl=firendCate"]
//用于获取商品推荐
#define CIRCLE_GOODS_RECOMMEND  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=circleOfFriends&ctrl=goodsCircle"]
//用于获取我的圈子、朋友圈
#define CIRCLE_GOODS  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=circleOfFriends&ctrl=myCircle"]
//用于判断账户是否存在
#define JUDGE_IS_REGISTER  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=dg_login&ctrl=checkIsExist"]
//朋友圈详情
#define FRIENDS_CIRCLE_DETAIL  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=circleOfFriends&ctrl=friendCircleDetail"]
//朋友圈的详情点赞人显示
#define FRIENDS_CIRCLE_DETAIL_THUMBS  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=circleOfFriends&ctrl=thumbs_man"]
//TA的页面头部分类
#define TA_CLASSIFY  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=circleOfFriends&ctrl=TaCate"]
//朋友圈评价
#define CIRCLE_COMMENT  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=circleOfFriends&ctrl=show_evaluate"]
//TA的页面
#define TA_GOODS  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=circleOfFriends&ctrl=friend_issue"]
//发布评价
#define PUBLISH_COMMENT  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=circleOfFriends&ctrl=add_evaluate"]
//朋友圈点赞
#define CIRCLE_THUMBS  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=circleOfFriends&ctrl=add_thumbs"]
//朋友圈取消点赞
#define CIRCLE_CANCEL_THUMBS  [NSString stringWithFormat:@"%@%@",DIS, @"?mod=appapi&act=circleOfFriends&ctrl=cancel_thumbs"]



#endif /* TGUrlsConfigure_h */

