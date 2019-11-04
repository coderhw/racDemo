//
//  ViewController.m
//  RACNetwork
//
//  Created by vanke on 2019/10/17.
//  Copyright © 2019 com. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

#import "HHRedView.h"
#import <ReactiveObjC.h>
#import "RACReturnSignal.h"

@interface ViewController ()

@property (nonatomic, strong) id subScriber;
@property (weak, nonatomic) IBOutlet HHRedView *redView;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, strong) RACSignal *signal;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    
  
 #pragma mark - RACSignal
////*************************************************1*****************************************************************************1
//    //1.创建信号（冷信号）
//    RACSignal *signal1 = [RACSignal createSignal:
//                         ^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//                             //didSubscribe:只要一个信号被订阅就会调用
//                             //didSubscribe作用:发送数据
//
//                             NSLog(@"信号1被订阅");
//
//                             //3.发送数据
//                             [subscriber sendNext:@1];
//                             return nil;
//                         }];
//
//    //2.订阅信号（热信号）
//    [signal1 subscribeNext:^(id  _Nullable x) {
//
//        //nextBlock调用:只要订阅者发送数据就会调用
//        //nextBlock:处理数据，展示到UI上面
//
//        //x:信号发送的内容
//        NSLog(@"x:%@", x);
//    }];
//
//
//    //void (^myBlock)(NSString *name) = ^(NSString *name){};
//    RACDisposable *(^didSubscribe)(id<RACSubscriber> subscriber) = ^RACDisposable *(id<RACSubscriber> subscriber) {
//
//        //didSubscribe:只要一个信号被订阅就会调用
//        //didSubscribe作用:发送数据
//
//        NSLog(@"信号2被订阅");
//
//        //3.发送数据
//        [subscriber sendNext:@2];
//        return nil;
//    };
//
//    //1.创建信号（冷信号）
//    RACSignal *signal2 = [RACSignal createSignal:didSubscribe];
//
//    //2.订阅信号（热信号）
//    [signal2 subscribeNext:^(id  _Nullable x) {
//
//        //nextBlock调用:只要订阅者发送数据就会调用
//        //nextBlock:处理数据，展示到UI上面
//
//        //x:信号发送的内容
//        NSLog(@"x:%@", x);
//    }];
    
//    __weak typeof(self) ws = self;
    
//    ////*****************************************2.Disposable*********************************////
//    RACSignal *signal3 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//
//        ws.subScriber = subscriber;
//        //3.发送信号
//        [subscriber sendNext:@3];
//        return [RACDisposable disposableWithBlock:^{
//           //只要信号取消订阅，就会来这, 清空资源
//            NSLog(@"信号被取消订阅了");
//        }];
//    }];
//
//    [signal3 subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x:%@", x);
//    }];

#pragma mark - RACSubject
    ////*****************************************3.RACSubject*********************************////
//    //1.创建信号
//    RACSubject *subject = [RACSubject subject];
//
//    //2.订阅信号
//    //不同信号订阅的方式不一样
//    //RACSubject处理订阅:仅仅是保存订阅者
//    [subject subscribeNext:^(id  _Nullable x) {
//
//        NSLog(@"订阅者1接收到的数据:%@", x);
//    }];
//
//    [subject subscribeNext:^(id  _Nullable x) {
//
//        NSLog(@"订阅者2接收到的数据:%@", x);
//    }];
//
//    //3.发送数据
//    [subject sendNext:@5];

    //执行流程:
    //RACSubject被订阅，仅仅是保存订阅者
    //RACSubject发送数据，遍历所有的订阅，调用他们的nextBlock
    
#pragma mark - RACReplaySubject
    ////*****************************************4.RACReplaySubject*********************************////

//    //1.创建信号
//    RACReplaySubject *subject = [RACReplaySubject subject];
//
//    //2.订阅信号
//    [subject subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x:%@", x);
//    }];
//
//    //3.发送信号
//    [subject sendNext:@1];
//
//    //RACReplaySubject:可以先发送数据，再订阅信号
    
#pragma mark - 集合
    ////*****************************************4.集合*********************************////

    
//    NSArray *arr = @[@"123", @"234", @1];
//    RACSequence *sequence = arr.rac_sequence;
//    RACSignal *signal = sequence.signal;
//    [signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x:%@", x);
//    }];
    
//    [arr.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x:%@", x);
//    }];
//


//    NSDictionary *dict = @{@"account":@"13309090909", @"name":@"vanke09"};
//    [dict.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x:%@", x);
//    }];
//    [dict.rac_sequence.signal subscribeNext:^(RACTuple *x) {
//
////        NSString *key = x[0];
////        NSString *value = x[1];
////        NSLog(@"%@", x);
//
//        //RACTupleUnpack:用来解析元组
//        //宏里面的参数，传需要解析出来的变量名
//        // = 右边，放需要解析的元组
//        RACTupleUnpack(NSString *key, NSString *value) = x;
//        NSLog(@"key：%@ value：%@", key, value);
//    }];
    
    
    
    //高级用法 map:把集合中的所有元素都映射成一个新的对象
//    NSDictionary *dict1 = @{@"name":@"曹操", @"age":@"48"};
//    NSDictionary *dict2 = @{@"name":@"曹操", @"age":@"48"};
//    NSDictionary *dict3 = @{@"name":@"曹操", @"age":@"48"};
//
//    NSArray *dataArr = @[dict1, dict2, dict3];
//    [[dataArr.rac_sequence.signal map:^id _Nullable(id  _Nullable value) {
//        NSMutableDictionary *newDic = [[NSMutableDictionary alloc] initWithDictionary:value];
//        newDic[@"height"] = @"178cm";
//        return newDic;
//    }] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x:%@", x);
//    }];
    
    
    
#pragma mark - 其它用法
    ////*****************************************5.其它用法*********************************////
    //1.代理代理 2.代替KVO  3.监听事件 4.代替通知 5.监听文本框
    
//    //1.代理代理
//    [_redView.btnClickSignal subscribeNext:^(id  _Nullable x) {
//
//        NSLog(@"x:%@", x);
//    }];
//
//    [[_redView rac_signalForSelector:@selector(btnClick:)]
//     subscribeNext:^(RACTuple * _Nullable x) {
//         NSLog(@"按钮被点击了");
//     }];
//
//
//    //2.代理KVO
//    [[[_redView rac_valuesForKeyPath:@"frame" observer:self] skip:1]
//     subscribeNext:^(id  _Nullable x) {
//
//        NSLog(@"x:%@", x);
//    }];
//
//
//    //3.监听事件
//    [[self.button rac_signalForControlEvents:UIControlEventTouchUpOutside]
//     subscribeNext:^(__kindof UIControl * _Nullable x) {
//        NSLog(@"按钮被点击了");
//    }];
//
//    //4.代理通知
//    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"KNotificationNameKey" object:nil]
//     subscribeNext:^(NSNotification * _Nullable x) {
//
//    }];
    
    //5.监听文本框
    
    
    ////*****************************************6.其它用法*********************************////
    //数组:存放信号
//    //当数组中的所有信号都发送数据的时候，才会执行Selector
//    //方法的参数:必须跟数组的信号一一对应
//    //方法的参数:就是每一个信号发送的数据
//    [self rac_liftSelector:@selector(updateUI) withSignalsFromArray:@[]];
    
    ////*****************************************7.宏*********************************////

#pragma mark - 宏
    //RAC常见的宏
    //用来给某个对象的某个属性绑定信号，只要产新信号内容，就会把内容给属性赋值
    //RAC(_label, text) = _textfield.rac_textSignal;
    
    
    //weakify && strongify
//    @weakify(self);
//    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//
//        @strongify(self);
//        NSLog(@"%@", self);
//        return nil;
//    }];
//    _signal = signal;
    
    
    
//    RACTuple *tuple = RACTuplePack(@1, @2);
//    NSLog(@"tuple:%@", tuple);

#pragma mark - RACMuticastConnection
//    //多次订阅一次请求  RACMulticastConnection
//    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//
//        NSLog(@"发送请求");
//        [subscriber sendNext:@1];
//        return nil;
//    }];
//    RACMulticastConnection *connection = [signal publish];
//
//    [connection.signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"订阅者1：%@",x);
//    }];
//
//    [connection.signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"订阅者2：%@",x);
//    }];
//
//    [connection.signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"订阅者3：%@",x);
//    }];
//
//    [connection connect];
    
    
#pragma mark - RACCommand
    //RACCommand:RAC中专门处理事件的类，可以把事件如何处理，事件中的数据如何传递，包装到这个类中，他可以很方便的监控事件的执行过程，
    //使用场景:监听按钮点击，网络请求
    //当命令内部发送数据完成，一定要主动发送完成。
    
//    //1.创建命令
//    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
//
//        NSLog(@"input:%@", input);
//        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//            //发送数据
//            [subscriber sendNext:@"执行命令产生的数据"];
//            return nil;
//        }];
//    }];
//
//    //2.执行命令
//    //直接订阅命令返回的信号
//    RACSignal *signal =  [command execute:@1];
//
//    [signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x:%@", x);
//    }];
    
    
    
    
//    //第二种
//    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
//
//        NSLog(@"%@", input);
//
//        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//
//            //发送数据
//            [subscriber sendNext:@"执行命令产生的数据"];
//            [subscriber sendCompleted];
//            return nil;
//        }];
//
//    }];
//
//    //订阅信号
//    //注意:必须要在执行命令前，订阅
//    //executionSignals:信号源，signalOfSignals:信号，发送数据就是信号
////    [command.executionSignals subscribeNext:^(id  _Nullable x) {
////
////        [x subscribeNext:^(id  _Nullable x) {
////
////            NSLog(@"x:%@", x);
////        }];
////    }];
//
//    //switchToLatest获取最新发送的信号，只能用于信号中的信号
//    [command.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x:%@", x);
//    }];
//
//
//    //监听事件有没有完成
//    [command.executing subscribeNext:^(NSNumber * _Nullable x) {
//
//        if([x boolValue] == YES){
//            NSLog(@"当前正在执行");
//        }else{
//            NSLog(@"执行完成/没有执行");
//        }
//    }];
//
//    //2.执行命令
//    [command execute:@1];
    
   
    
#pragma mark - Bind方法
//    //1.创建信号
//    RACSubject *subject = [RACSubject subject];
//
//    //2.绑定信号
//    RACSignal *bindSignal = [subject bind:^RACSignalBindBlock _Nonnull{
//        return ^RACSignal *(id value, BOOL *stop){
//            //Block只要源信号发送数据,就会调用Block
//            NSLog(@"接收到原信号的内容:%@", value);
//            value = [NSString stringWithFormat:@"xxxx:%@", value];
//            return [RACReturnSignal return:value];
//        };
//    }];
//
//
//    //3.订阅绑定信号
//    [bindSignal subscribeNext:^(id  _Nullable x) {
//
//        NSLog(@"接收到绑定信号的内容:%@", x);
//    }];
//
//    //4.发送数据
//    [subject sendNext:@"123"];
    
    
#pragma mark - flatterMap/映射
    
//    //创建信号
//    RACSubject *subject = [RACSubject subject];
//
//    //绑定信号
//    RACSignal *bindSignal = [subject flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
//
//        //value: 就是源信号发送内容
//        //block: 就是源信号发送内容
//        NSDictionary *value2 = @{@"name":@"李清照"};
//        return [RACReturnSignal return:value2];
//    }];
//
//    //订阅信号
//    [bindSignal subscribeNext:^(id  _Nullable x) {
//
//        NSLog(@"x:%@",x);
//    }];
//
//    [subject sendNext:@"李白"];
    
    
    
    //flatterMap: 一般用于信号中的信号
//    RACSubject *signalOfSignals = [RACSubject subject];
//    RACSubject *signal = [RACSubject subject];
//    RACSignal *bindSignal = [signalOfSignals flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
//        return value;
//    }];
//
//    [bindSignal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x:%@",x);
//
//    }];
    
    
//    [[signalOfSignals flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
//        return value;
//    }] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x:%@",x);
//
//    }];
//
//    //发送信号
//    [signalOfSignals sendNext:signal];
//    [signal sendNext:@"123"];
    
    
    //map
//    RACSubject *subject = [RACSubject subject];
//    RACSignal *bindSignal = [subject map:^id _Nullable(id  _Nullable value) {
//        return @"111";
//    }];
//
//    [bindSignal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x:%@",x);
//    }];
//    [subject sendNext:@"2222"];
//    [subject sendNext:@"3333"];

 
#pragma mark - 组合
    
//    RACSignal *signal1 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//
//        //发送请求
//        [subscriber sendNext:@"123"];
//
//        //这里必须调用发送完成
//        [subscriber sendCompleted];
//        return nil;
//    }];
//
//    RACSignal *signal2 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//
//        //发送请求
//        [subscriber sendNext:@"456"];
//        [subscriber sendCompleted];
//        return nil;
//    }];
    
    
    
    //concat:按顺序去连接
    //concat:第一个信号必须调用:sendCompleted

//    RACSignal *concatSignal = [signal1 concat:signal2];
//    [concatSignal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x:%@",x);
//    }];
    
    
    //then:会忽略掉第一个信号的所有值
//    RACSignal *thenSignal = [signal1 then:^RACSignal * _Nonnull{
//        return signal2;
//    }];
//
//    [thenSignal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x:%@",x);
//    }];
    
    
    //merge:把多个信号合并为一个信号，其中任何一个信号有新值的时候就会被调用
//    RACSignal *mergeSignal = [signal1 merge:signal2];
//    [mergeSignal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x:%@",x);
//    }];
    
    
    //zipWith:
//    RACSignal *zipSignal = [signal1 zipWith:signal2];
//    [zipSignal subscribeNext:^(id  _Nullable x) {
//
//        RACTupleUnpack(NSString *key, NSString *value) = x;
//        NSLog(@"key：%@ value：%@", key, value);
//    }];
    

    
#pragma mark - 过滤
    
    
}


- (void)updateUI {
    //Update UI
}

- (IBAction)nextStep:(id)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SecondViewController *seccondVC = [sb instantiateViewControllerWithIdentifier:@"SecondViewController"];
    [self.navigationController pushViewController:seccondVC animated:YES];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    _redView.frame = CGRectMake(10, 10, 160, 160);
}

@end
