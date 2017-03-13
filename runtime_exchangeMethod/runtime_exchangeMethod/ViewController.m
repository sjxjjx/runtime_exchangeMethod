//
//  ViewController.m
//  runtime_exchangeMethod
//
//  Created by sjx on 2017/3/13.
//  Copyright © 2017年 sjx. All rights reserved.
//

#define Screen_Width    [UIScreen mainScreen].bounds.size.width
#define Screen_Height   [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"

@interface ViewController ()

/** 输入框 */
@property(nonatomic, weak) UITextField *testTextField;
/** 按钮 */
@property(nonatomic, weak) UIButton *startButton;
/** 文字 */
@property(nonatomic, weak) UILabel *noticeLabel;
/** 拼接结果 */
@property(nonatomic, weak) UILabel *resultLabel;
/** 获取字符串 */
@property(nonatomic, copy) NSString *testString;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"测试界面";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.testTextField.frame = CGRectMake(30, 200, Screen_Width - 60, 44);
    self.startButton.frame = CGRectMake(100, 300, Screen_Width - 200, 44);
    self.noticeLabel.frame = CGRectMake(30, 350, Screen_Width - 60, 44);
    self.resultLabel.frame = CGRectMake(30, 400, Screen_Width - 60, Screen_Height - 420);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <按钮点击事件>
- (void)startClick
{
    NSString *string = @"结果为：";
    /*
     在这里调用 stringByAppendingString: 方法，其实已经替换为自定义的方法 sjx_stringByAppendingString: 了。
     */
    self.resultLabel.text = [string stringByAppendingString:self.testString];
}

#pragma mark - <输入框监听>
- (void)textChangedWithInput:(UITextField *)textField
{
    self.testString = textField.text;
}

#pragma mark - <懒加载>
- (UITextField *)testTextField
{
    if (!_testTextField) {
        UITextField *tf = [[UITextField alloc] init];
        
        tf.backgroundColor = [UIColor whiteColor];
        tf.placeholder = @"请输入拼接的字符串";
        [tf addTarget:self action:@selector(textChangedWithInput:) forControlEvents:UIControlEventEditingChanged];
        
        [self.view addSubview:tf];
        _testTextField = tf;
    }
    return _testTextField;
}
- (UIButton *)startButton
{
    if (!_startButton) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setTitle:@"点击拼接" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15.0];
        btn.backgroundColor = [UIColor orangeColor];
        [btn addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
        // 圆角设置
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        
        [self.view addSubview:btn];
        _startButton = btn;
    }
    return _startButton;
}
- (UILabel *)resultLabel
{
    if (!_resultLabel) {
        UILabel *lb = [[UILabel alloc] init];
        
        lb.backgroundColor = [UIColor whiteColor];
        lb.font = [UIFont systemFontOfSize:15.0];
        lb.textColor = [UIColor blackColor];
        lb.numberOfLines = 0;
        
        [self.view addSubview:lb];
        _resultLabel = lb;
    }
    return _resultLabel;
}
- (UILabel *)noticeLabel
{
    if (!_noticeLabel) {
        UILabel *lb = [[UILabel alloc] init];
        
        lb.text = @"拼接后的文字为：";
        lb.font = [UIFont systemFontOfSize:15.0];
        lb.textColor = [UIColor blackColor];
        
        [self.view addSubview:lb];
        _noticeLabel = lb;
    }
    return _noticeLabel;
}
@end
