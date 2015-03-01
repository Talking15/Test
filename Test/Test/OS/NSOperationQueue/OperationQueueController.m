//
//  OperationQueueController.m
//  Test
//
//  Created by Murderer on 15/3/1.
//  Copyright (c) 2015年 AC. All rights reserved.
//

#import "OperationQueueController.h"
#import "DownOperation.h"
@interface OperationQueueController ()

@end

@implementation OperationQueueController




-(void)downloadImage:(NSString *)url{
    NSLog(@"url:%@", url);
    NSURL *nsUrl = [NSURL URLWithString:url];
    NSData *data = [[NSData alloc]initWithContentsOfURL:nsUrl];
    UIImage * image = [[UIImage alloc]initWithData:data];
    [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:YES];
}

-(void)updateUI:(UIImage*) image{
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(20, 80, self.view.frame.size.width-40, self.view.frame.size.height-160)];
    iv.image = image;
    [self.view addSubview:iv];
}

- (void)invocationOperation{
    
    //创建操作对象，封装要执行的任务
    //NSInvocationOperation   封装操作
    NSInvocationOperation *operation = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(downloadImage:) object:@"http://img2.niushe.com/upload/201304/19/14-22-45-63-26144.jpg"];
    //执行操作
    [operation start];
    
    NSLog(@"222");
    /*
     注意：操作对象默认在主线程中执行，只有添加到队列中才会开启新的线程。即默认情况下，如果操作没有放到队列中queue中，都是同步执行。只有将NSOperation放到一个NSOperationQueue中,才会异步执行操作
     */
}

- (void)blockOperation {
        //创建NSBlockOperation操作对象
    
        NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"BlockOperation------%@",[NSThread currentThread]);
    
        }];
    
        //添加操作
        [operation addExecutionBlock:^{
            NSLog(@"添加操作");
        }];
    
        //开启执行操作
        [operation start];
    
    
    
    {
        //创建NSBlockOperation操作对象
        NSBlockOperation *operation=[NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"NSBlockOperation------%@",[NSThread currentThread]);
        }];
        
        //添加操作
        [operation addExecutionBlock:^{
            NSLog(@"NSBlockOperation1------%@",[NSThread currentThread]);
        }];
        
        [operation addExecutionBlock:^{
            NSLog(@"NSBlockOperation2------%@",[NSThread currentThread]);
        }];
        
        //开启执行操作
        [operation start];
        //注意:只要NSBlockOperation封装的操作数 > 1,就会异步执行操作
    }
    
}

- (void)OperationQueue {
    /*
     NSOperationQueue的作⽤：NSOperation可以调⽤start⽅法来执⾏任务,但默认是同步执行的
     如果将NSOperation添加到NSOperationQueue(操作队列)中,系统会自动异步执行NSOperation中的操作
     添加操作到NSOperationQueue中，自动执行操作，自动开启线程
     */
    
    //创建NSOperationQueue
    NSOperationQueue * queue=[[NSOperationQueue alloc]init];
    //把操作添加到队列中
    //第一种方式
    NSInvocationOperation *operation1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(test1) object:nil];
    NSInvocationOperation *operation2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(test2) object:nil];
    //创建对象，封装操作
    NSBlockOperation *operation3=[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"NSBlockOperation3--1----%@",[NSThread currentThread]);
    }];
    [operation3 addExecutionBlock:^{
        NSLog(@"NSBlockOperation3--2----%@",[NSThread currentThread]);
    }];
    
    [queue addOperation:operation1];
    [queue addOperation:operation2];
    [queue addOperation:operation3];
    //第二种方式
    [queue addOperationWithBlock:^{
        NSLog(@"NSBlockOperation3--4----%@",[NSThread currentThread]);
    }];
    
    
}

-(void)test1
{
    NSLog(@"NSInvocationOperation--test1--%@",[NSThread currentThread]);
}
-(void)test2
{
    NSLog(@"NSInvocationOperation--test2--%@",[NSThread currentThread]);
}

/*
 注意：系统自动将NSOperationqueue中的NSOperation对象取出，将其封装的操作放到一条新的线程中执行。上面的代码示例中，一共有四个任务，operation1和operation2分别有一个任务，operation3有两个任务。一共四个任务，开启了四条线程。通过任务执行的时间全部都是273可以看出，这些任务是并行执行的。
 提示：队列的取出是有顺序的，与打印结果并不矛盾。这就好比，选手A,BC虽然起跑的顺序是先A,后B，然后C，但是到达终点的顺序却不一定是A,B在前，C在后。
 */



- (void)subClassOperation{
    
    NSOperationQueue  *queue=[[NSOperationQueue alloc] init];
    [queue setMaxConcurrentOperationCount:1];
    
    DownOperation *o1=[[DownOperation alloc] init];
    o1.name=@"o1";
    [queue addOperation:o1];
    
    DownOperation *o2=[[DownOperation alloc] init];
    o2.name=@"o2";
    [queue addOperation:o2];
    
    [NSThread sleepForTimeInterval:1];
    
    DownOperation *o3=[[DownOperation alloc] init];
    o3.name=@"o3";
    [o3 setQueuePriority:NSOperationQueuePriorityHigh];
    [queue addOperation:o3];
    //可见，操作3成功的插到第一个等待操作（操作2）之前执行了。
}
/*
 在使用NSOperationQueue简化多线程开发中介绍了iOS的操作队列使用方法。这里补充一下队列的优先级功能。
 假设现在队列中有多个操作（NSOperation），现在再向队列中加入新的操作，并且希望新增加的操作排在未执行操作的最前面。这时就需要设置操作的优先级了。
 */


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [self invocationOperation];
    //    [self blockOperation];
    //    [self OperationQueue];
//    [self subClassOperation];
    
}

@end
