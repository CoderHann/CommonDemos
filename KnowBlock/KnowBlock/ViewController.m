//
//  ViewController.m
//  KnowBlock
//
//  Created by roki on 2017/8/15.
//  Copyright © 2017年 CoderHann. All rights reserved.
//

#import "ViewController.h"

typedef int (^MyBlock)(int a,int b);

@interface ViewController ()

@property (nonatomic,copy)MyBlock blockOne;
@property (nonatomic,copy)int (^blockTwo)(int a,int b);

@property (nonatomic,copy)void (^sumBlock)(int a,int b);
@property (nonatomic,assign)int aNumber;

@end

@implementation ViewController

static int b = 1;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self blockForTypedef];
//    [self test];
    
    
}

- (void)blockForCycleReferenceProblem {
    
    _sumBlock = ^(int a,int b) {
      
        self.aNumber = a+b;
        NSLog(@"self.aNumber:%zd",self.aNumber);
        
    };
    
    _sumBlock(1,1);
    
}


- (void)blockForCycleReferenceSolution {
    
    __weak typeof(self) weakSelf = self;
    _sumBlock = ^(int a,int b) {
        
        weakSelf.aNumber = a+b;
        NSLog(@"self.aNumber:%zd",weakSelf.aNumber);
        
    };
    
    _sumBlock(1,1);
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self blockForCycleReferenceSolution];
}

- (void)captureHeapVar {
    
//    NSString *str = [NSString stringWithFormat:@"1234"];
    
    NSThread *obj = [[NSThread alloc] init];
    
    void (^aBlock)() = ^{
      
        NSLog(@"obj = %@",obj);
        obj.name = @"";
    };
    
    aBlock();
}




- (void)captureStackVar2 {
    
    __block int j = 10;
    
    NSLog(@"j = %p",&j);
    
    
    void (^aBlock)() = ^{
        NSLog(@"aBlock j=%zd",j);
        NSLog(@"j = %p",&j);
    };
    
    j++;
    NSLog(@"j = %p",&j);
    
    aBlock();
    
    
    void (^bBlock)() = ^{
        j++;
        NSLog(@"bBlock j=%zd",j);
        NSLog(@"j = %p",&j);
    };
    bBlock();
    
    
}

- (void)captureStackVar {
    
    __block int j = 10;
    
    void (^aBlock)() = ^{
        NSLog(@"aBlock j=%zd",j);
    };
    
    j++;
    
    aBlock();
    
    
    void (^bBlock)() = ^{
        j++;
        NSLog(@"bBlock j=%zd",j);
    };
    bBlock();
    
    
}

- (void)capturePropertyVar {
    
    _aNumber = 10;
    
    void (^aBlock)() = ^{
        NSLog(@"aBlock _aNumber=%zd",_aNumber);
    };
    
    _aNumber++;
    
    aBlock();
    
    
    void (^bBlock)() = ^{
        _aNumber++;
        NSLog(@"bBlock _aNumber=%zd",_aNumber);
    };
    bBlock();
    
    
}

int i = 10;

- (void)captureGlobalVar {
    
    void (^aBlock)() = ^{
        NSLog(@"aBlock i=%zd",i);
    };
    
    i++;
    
    aBlock();
    
    
    void (^bBlock)() = ^{
        i++;
        NSLog(@"bBlock i=%zd",i);
    };
    bBlock();
    
    
}


- (void)captureStaticVar {
    
    static int i = 10;
    
    void (^aBlock)() = ^{
        NSLog(@"aBlock i=%zd",i);
    };
    
    i++;
    
    aBlock();
    
    
    void (^bBlock)() = ^{
        i++;
        NSLog(@"bBlock i=%zd",i);
    };
    bBlock();
    
    
}

- (void)blockCategoryForARCHeap {
    
    int a = 11;
    
    void (^heapBlock)() = ^{
        NSLog(@"heapBlock executed!a=%zd",a);
    };
    NSLog(@"heapBlock:%@",heapBlock);
    
    void (^heapBlock2)() = ^{
        NSLog(@"heapBlock2 executed!_aNumber=%zd",_aNumber);
    };
    NSLog(@"heapBlock2:%@",heapBlock2);
    
    void (^heapBlock3)() = [heapBlock copy];
    NSLog(@"heapBlock3:%@",heapBlock3);
    
    
}

- (void)blockCategoryForMRCHeap {
    
    int a = 11;
    
    void (^stackBlock)() = ^{
        NSLog(@"stackBlock executed!a=%zd",a);
    };
    NSLog(@"stackBlock:%@",stackBlock);
    
    void (^heapBlock)() = [stackBlock copy];
    NSLog(@"heapBlock:%@",heapBlock);
}

- (void)blockCategoryForStack {
    
    int a = 11;
    
    void (^stackBlock)() = ^{
        NSLog(@"stackBlock executed!a=%zd",a);
    };
    NSLog(@"stackBlock:%@",stackBlock);
    
    void (^stackBlock2)() = ^{
        NSLog(@"stackBlock2 executed!_aNumber=%zd",_aNumber);
    };
    NSLog(@"stackBlock2:%@",stackBlock2);
}

- (void)blockCategoryForGlobal {
    
    void (^globalBlock)() = ^{
        NSLog(@"global block executed!");
    };
    NSLog(@"globalBlock:%@",globalBlock);
    
    
    static int a = 11;
    
    void (^globalBlock2)() = ^{
        NSLog(@"globalBlock2 executed!a=%zd",a);
    };
    NSLog(@"globalBlock2:%@",globalBlock2);
    
    void (^globalBlock3)() = ^{
        NSLog(@"globalBlock3 executed!_aNumber=%zd",_aNumber);
    };
    NSLog(@"globalBlock3:%@",globalBlock3);
}


- (void)test2 {
    
    int a = 10;
    
    void (^printBlock)() = ^{
        NSLog(@"stack block executed! a=%zd",a);
    };
    NSLog(@"printBlock:%@",printBlock);
    [self downloadFileWithBlock:printBlock];
    
    
}

- (void)test3 {
    
    void (^globalBlock)() = ^{
        NSLog(@"global block executed!");
    };
    NSLog(@"globalBlock:%@",globalBlock);
    
    
    static int a = 11;
    
    void (^globalBlock2)() = ^{
        NSLog(@"globalBlock2 executed!a=%zd",a);
    };
    NSLog(@"globalBlock2:%@",globalBlock2);
}

- (void)test {
    
    static int a = 11;
    int c = 2;
    
    void (^printBlock)() = ^{
        NSLog(@"global block executed!a=%zd",a);
        NSLog(@"global block executed!b=%zd",b);
        NSLog(@"global block executed!c=%zd",c);
    };
    NSLog(@"printBlock:%@",printBlock);
    //    [self downloadFileWithBlock:printBlock];
    
}

- (void)downloadFileWithBlock:(void(^)())block {
    NSLog(@"start donwload!");
    NSLog(@"block:%@",block);
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//       
//        [NSThread sleepForTimeInterval:2];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"block executed:%@",block);
            block();
//        });
//    });
}

- (void)blockForProperty {
    
    _blockOne = ^int(int a,int b) {
        return a+b;
    };
    
    _blockTwo = ^int(int a,int b) {
        return a+b;
    };
    
    _blockOne(1,1);
    _blockTwo(2,2);
}

- (void)blockForTypedef {
    MyBlock aBlock = ^int(int a,int b) {
        return a + b;
    };
    int sum = aBlock(3,3);
    NSLog(@"MyBlock sum:%zd",sum);
    
    MyBlock anotherBlock = ^int(int n,int m) {
        return n + m;
    };
    int sum2 = anotherBlock(1,1);
    NSLog(@"MyBlock sum2:%zd",sum2);
    
    
    
}

- (void)blockForParams {
    
    // 匿名block演示
    [self printBlock:^{
        NSLog(@"匿名block调用啦！");
    }];
    
    
    // 显式声明的block变量用于参数传递
    void (^printBlock)() = ^{
      
        NSLog(@"实名printBlock调用啦！");
    };
    [self printBlock:printBlock];
}

// 声明
- (void)blockDeclare {
    
    void (^printBlock)() = ^{
        NSLog(@"printBlock");
    };
    printBlock();
    
    
    int(^sumBlock)(int a,int b) = ^(int a,int b) {
        return a+b;
    };
    
    int sum = sumBlock(1,2);
    NSLog(@"sum is:%zd",sum);
}

- (void)printBlock:(void (^)())sumBlock {

    if (sumBlock) {
        // 如果block不为空就执行block
        sumBlock();
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
