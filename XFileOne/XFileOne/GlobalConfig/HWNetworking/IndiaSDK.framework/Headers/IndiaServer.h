#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface IndiaServer : NSObject



+ (IndiaServer *)getStartServer;

//注册和登陆的合并接口 参数为0是注册模式 参数为1是登陆模式 返回结果：当请求正常返回userid,不正常为nil
-(void)RegAndLoginWithThePhone:(NSString *)phone code:(NSString *)code password:(NSString *)password model:(BOOL)islogin withBlock:(void(^)(NSString * userid,NSString * errorInfo))block;


//fb登陆
-(void)openTheFbloginwithBlock:(void(^)(NSString * userid,NSString * errorInfo))block;


//调取用户信息
-(void)checkTheUserDetail:(NSString *)userid withBlock:(void(^)(NSDictionary * result,NSString * errorInfo))block;

//修改用户信息
/*
 @"address":@"广东省广州市海珠区新港东路17栋4楼"(非必传),
 @"ccode":@""(非必传),
 @"img":@""(非必传),
 @"opassword":必须要传值当前用户的密码
 @"password":@""(非必传),
 @"phone":@"18824180016(非必传)",
 @"userid":@"13"
 */
-(void)writeTheUserDetail:(NSString *)address ccode:(NSString *)code img:(NSString *)img opassword:(NSString *)opa password:(NSString *)newpas phone:(NSString *)phone userid:(NSString *)userid block:(void (^)(NSDictionary *, NSString *))block;

//盒子信息 传递盒子id
/*
 返回盒子id boxid
 盒子售价 amount
 折扣 discount
 盒子类型 boxtype
 盒子创建时间 ctime
 盒子名称 title
 盒子说明 introduce
 限时盲盒 1限时 0 ⽆限制 limittime
 限时开始时间 limitstartime
 限时结束时间 limitendtime
 盒子图片 img
 */
-(void)showTheBoxDetail:(NSString *)boxid withBlock:(void(^)(NSDictionary * result,NSString * errorInfo))block;

//开盒接口
-(void)openTheBox:(NSString *)boxid Userid:(NSString *)uid paychanel:(NSString *)number withBlock:(void(^)(NSDictionary * result,NSString * errorInfo))block;


//获取客服链接接口
-(NSString *)getTheUserServersRoomLink;

//销毁当前账号 参数：当前是fb账号1 如果是fb账号 password和phone传@"" 区号
-(void)cancelAccountWithFacebook:(BOOL)isfb code:(NSString *)code password:(NSString *)password phone:(NSString *)phone;


//请求仓库列表
/*
 用户id
 页数
 数据条数
 类型：0全部 1已兑换 2已提货 3已赠送
 
 返回类型数组 数组结构如下
 
 "id": 8, //id
 "sku": "xxx.prize.com", //sku
 "userid": 12, //用户id
 "orderid": "SP202302240951530010028888", //订单id
 "boxid": "aaaaa", //盒子id
 "crtime": 1677203514, //中奖时间
 "coin": 2000, //可兑换盲盒币
 "title": "稀有电动车7", //名称
 "type": 3, //类型 0全部 1已兑换 2提货 3赠送
 "exchange": 1, //是否可以兑换   0否   1是
 "img": "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.alicdn.com%2Fbao%2Fupl" //图片
 */
-(void)getTheShopListWithUserid:(NSString *)userid Page:(NSString *)page Limit:(NSString *)limi Type:(NSString *)type withBlock:(void(^)(NSArray * result,NSString * errorInfo))block;


//下单接口，根据要求传入参数，经过处理，会返回第三方的支付链接，使用webview来打开此链接即可完成支付
/*
 面板价格
 实际支付
 优惠券id
 用户id
 支付渠道
 盒子id
 支付数量
 */
-(void)pushTheAmount:(NSString *)amount  payAmount:(NSString *)payamount Couponid:(NSString *)coupon  userid:(NSString *)uid channelId:(NSString *)channel  boxid:(NSString *)box count:(NSString *)count Block:(void(^)(NSString * payUrl,NSString * payOrder,NSString * error))block;


//开盒记录
/*
 用户id
 页数
 数据条数
 
 返回类型数组 数组结构如下
 
 "id": 221, //id
 "boxid": "aaaaa", //盒子id
 "otime": 1677203514, //开盒时间
 "userid": 12, //用户id
 "amount": "500.00", //实际支付金额
 "exchange": 1, //是否已兑换 0否 1是
 "exsku": null, //已兑换的商品sku
 "sku": "[\"mmm.prize.com\",\"rrr.prize.com\",\"xxx.prize.com\"]", //中奖的商品sku
 "conopen": 3, //开盒次数
 "orderid": "SP202302240951530010028888", //订单id
 "title": "超级大盲盒", //盲盒名称
 "introduce": "每5发保底笔触稀有/史诗/传说", //盲盒描述
 "img": "http://open.saintic.com/api/bingPic/?picSize=2" //盲盒图片
 
 */
-(void)getTheOpenBoxListWithUserid:(NSString *)userid Page:(NSString *)page Limit:(NSString *)limi withBlock:(void(^)(NSArray * result,NSString * errorInfo))block;


//兑换金币
/*
 用户ID
 物品id
 
 返回兑换状态
 */
-(void)exchangeGoldCoinWithUserid:(NSString *)userid thingID:(NSString *)thingid withBlock:(void(^)(BOOL isSuccess,NSString * errorInfo))block;

@end
