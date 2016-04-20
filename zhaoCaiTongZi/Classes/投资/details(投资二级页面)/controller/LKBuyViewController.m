//
//  LKBuyViewController.m
//  zhaoCaiTongZi
//
//  Created by longmen1 on 16/4/13.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "LKBuyViewController.h"

#import <AlipaySDK/AlipaySDK.h>//支付宝
#import "Order.h"
#import "DataSigner.h"

@interface LKBuyViewController ()

/** 充值textfield */
@property (strong, nonatomic) IBOutlet UITextField *topUpTextField;
/** 收益label */
@property (strong, nonatomic) IBOutlet UILabel *earningsLabel;

@end

@implementation LKBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景颜色
    self.view.backgroundColor = LKGlobalBg;
    
    //注册通知 来计算收益
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChanged) name:UITextFieldTextDidChangeNotification object:self.topUpTextField];
}



/**
 *  购买事件
 */
- (IBAction)buyClick:(UIButton *)sender {
    
    /*
     *点击获取prodcut实例并初始化订单信息
     */
    //Product *product = [self.productList objectAtIndex:indexPath.row];
    //Product *product = [self.productList firstObject];
    
    /*
     *商户的唯一的parnter和seller。
     *签约后，支付宝会为每个商户分配一个唯一的 parnter 和 seller。
     */
    
    /*============================================================================*/
    /*=======================需要填写商户app申请的===================================*/
    /*============================================================================*/
    NSString *partner = @"2088121517617065";//商户ID
    NSString *seller = @"LMZB@dragonup.net";//支付宝账号
    NSString *privateKey = @"";
    //NSString *privateKey = @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBALbGWDqFUV8/nqURfBTBat1vkOXR018X4AQiLEaoODzjaADOsUlQyWunjCj688VSZ8lcq6MyGZesRPXJozQGIBjllzKoTRXWwRRZK2qpnQ9BWHhYIgCdMTzPcjjuRdUJ9hpqJQmn7N5NDhZ+lodc/fixpMYGaAfvwb6Y+vKgaU6VAgMBAAECgYBgEB1dHKbpBdoO7gKmMgZFvhaNA9wxVa4S3hchR9bPAcKu8fOyEfjbUSNUgplO84HDDqbTTkivNAbGnCTf+fwx1iRjIyGGCOfX0XyyaRn5r0Nsg2Ck8n0jb3CIoZb7uSBCjVxO6xM+yc9Z5O5V7KbJdqmu/PREgaz1ZlplDgxcQQJBAODeEOOUhSH9SDTuuEKubWNjIkgP9wa/AONmenLjPvAv1O1pLS4SN4dAt3w3F+sLZ+BX6c7ezRfQg9lN8dveYgUCQQDQFGWAR+pEgr74JzvPFziFqeqgESSnj9JtDZvoIKkzUaJD9A22B+oIeZNyxlWYokpSBhYpG75c8cOYKR/Fdg9RAkA3QxvPci6NvdtC9u/do1RKupAwOYwx4jrrp8Gr/mD3Uin39oMd8WgoGyV8p2V/ZBwxLCnPpz2r/piIjPlFWY+pAkEAloRak/vxg5OMbtd6lSg388Bg/17HRApubgJtJ/IQUxYXKc6t6GI7Mdw4A8tieaHT3xeWCjCOeI9OLJB68gyfsQJAU7ruuLPi0F6ezBOxjH1Mpoq16WEsz2viENRtGnF9ZJ0pm6afzwHNaH2utcujYwosLrwQRKKtu3OejoGSMvenFQ==";//秘钥 用于数据安全，数据加密
    //这三个数据支付宝会提供
    /*============================================================================*/
    /*============================================================================*/
    /*============================================================================*/
    
    //partner和seller获取失败,提示
    if ([partner length] == 0 ||
        [seller length] == 0 ||
        [privateKey length] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"缺少partner或者seller或者私钥。"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    //把商品转换成订单信息
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
    Order *order = [[Order alloc] init];
    order.partner = partner;//设置商户ID
    order.seller = seller;//设置支付宝账号
    order.tradeNO = [self generateTradeNO]; //订单ID必须在系统中是唯一的
    order.productName = @"珑门资本管理"; //商品标题
    order.productDescription = @"珑门"; //商品描述
    //order.amount = self.topUpTextField.text; //商品价格
    order.amount = [NSString stringWithFormat:@"%@0000",self.topUpTextField.text]; //商品价格
    order.notifyURL =  @"www.dragonup.net/index.php/Api/Pay/resuccess"; //回调URL
    
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";//支付类型 如 1:支付 2:退款 等
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    order.showUrl = @"m.alipay.com";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    //此处为支付宝回跳scheme
    //NSString *appScheme = @"alisdkdemo";
    NSString *appScheme = @"wxac0f9ec0c1210f41";
    
    //将订单信息拼接成字符串
    NSString *orderSpec = [order description];
    //LKLog(@"orderSpec = %@",orderSpec);
    //请求参数252765927
    /*
     partner=""&seller_id=""&out_trade_no="93I93TSJVM9Q32E"&subject="3"&body="我是测试数据"&total_fee="1.01"&notify_url="http://www.xxx.com"&service="mobile.securitypay.pay"&payment_type="1"&_input_charset="utf-8"&it_b_pay="30m"&show_url="m.alipay.com"
     */
    
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    //RSA 加密技术-加密数据
    //签名对象
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    //签名数据
    /**
     *  签名 类似于每个人的指纹
     *  abc 签名 -> 得到一指纹(字符串)
     *  abd 签名 -> 得到一指纹(字符串)
     
     *  支付
     *  total_fee="0.02"&notify_url="http://www.xxx.com &sign=ABC -> 签名 -> 指纹(ABC)
     *  total_fee="2000"&notify_url="http://www.xxx.com &sign=ABC -> 签名 -> 指纹(ABD)
     */
    NSString *signedString = [signer signString:orderSpec];
    
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        //一个完整的数据提交的支付宝的服务器，一定要有一个签名(sign)
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            LKLog(@"reslut = %@",resultDic);//回调
        }];
    }
    
}


#pragma mark -
#pragma mark   ==============产生随机订单号==============


- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}


#pragma mark -
#pragma mark   ==============textfield代理==============
- (void)textFieldChanged
{//计算收益
    float earnings = [NSString stringWithFormat:@"%@0000",self.topUpTextField.text].integerValue;
    earnings = earnings * 0.11;
    if (earnings >= 236223200.00) {
        self.earningsLabel.text = [NSString stringWithFormat:@"超出可投资金额"];
    } else {
        self.earningsLabel.text = [NSString stringWithFormat:@"%.2f",earnings];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,nil]];
    
    //隐藏导航栏
    self.navigationController.navigationBar.hidden = NO;
    [super viewWillAppear:animated];
}

@end
