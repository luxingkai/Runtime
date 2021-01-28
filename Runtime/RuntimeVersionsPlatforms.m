//
//  RuntimeVersionsPlatforms.m
//  Runtime
//
//  Created by tigerfly on 2020/11/14.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "RuntimeVersionsPlatforms.h"

@interface RuntimeVersionsPlatforms ()

@end

@implementation RuntimeVersionsPlatforms

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /*
     There are different versions of the Objective-C runtime on
     different platforms.
     
     There are two versions of the Objective-C runtime - "modern" and
     "legacy". The modern version was introduced with Objective-C 2.0
     and includes a number of new features. The programming interface
     for the legacy version of the runtime is describled in objective-C
     runtime Reference.
     
     The most notable new feature is that instance variables in the
     modern runtime are “non-fragile”:

     •  In the legacy runtime, if you change the layout of instance
        variables in a class, you must recompile classes that inherit from it.
     •  In the modern runtime, if you change the layout of instance variables
        in a class, you do not have to recompile classes that inherit from it.
     
     In addition, the modern runtime supports instance variable synthesis for
     declared properties.
     
     
     Platforms
     iPhone applications and 64-bit programs on OS X v10.5 and later use the
     modern version of the runtime.
     
     Other programs (32-bit programs on OS X desktop) use the legacy version
     of the runtime.
     */
    
    [self perform:@"dsf",@"sdf",@"aa",@"dd"];
    
}

- (void)perform:(NSString *)str, ... {
    
    /*
     stdarg.h 头文件定义了一个变量类型 va_list 和三个宏，这三个宏可用于在参数个
     数未知（即参数个数可变）时获取函数中的参数。
     可变参数的函数通在参数列表的末尾是使用省略号(,...)定义的。
     */
    
    /*
     va_list
     这是一个适用于 va_start()、va_arg() 和 va_end() 这三个宏存储信息的类型。
     */
    
    /*
     void va_start(va_list ap, last_arg)
     这个宏初始化 ap 变量，它与 va_arg 和 va_end 宏是一起使用的。last_arg
     是最后一个传递给函数的已知的固定参数，即省略号之前的参数。
     */
    
    /*
     type va_arg(va_list ap, type)
     这个宏检索函数参数列表中类型为 type 的下一个参数。
     */
    
    /*
     void va_end(va_list ap)
     这个宏允许使用了 va_start 宏的带有可变参数的函数返回。如果在从函数返回之前
     没有调用 va_end，则结果为未定义。
     */
    
    va_list list;
    va_start(list, str);
    char *str_ = va_arg(list, char *);
    printf("%s",str_);
    va_end(list);

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
