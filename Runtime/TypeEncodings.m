//
//  TypeEncodings.m
//  Runtime
//
//  Created by tigerfly on 2020/11/16.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "TypeEncodings.h"

@interface TypeEncodings ()

@end

@implementation TypeEncodings

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    char *invocation = @encode(NSInvocation);
    printf("%s\n",invocation);
    char *arry = @encode(NSArray);
    printf("%s",arry);
    
    /*
     To assist the runtime system, the compiler encodes the
     argument types and return for each method in a character
     string and associates the string with the method selector.
     The coding scheme it uses is also useful in other contexts
     and so is made publicly available with the @encode()
     compiler directive. When given a type specification, @encode()
     returns a string encoding that type. The type can be a basic
     type such as an int, a pointer, a tagged structure or union,
     or a class name—any type, in fact, that can be used as an
     argument to the C sizeof() operator.
     =================================================
     char *buf1 = @encode(int **);
     char *buf2 = @encode(struct key);
     char *buf3 = @encode(Rectangle);
     =================================================
     The table below lists the type codes. Note that many of them
     overlap with the codes you use when encoding an object
     for purposes of archiving or distribution. However,
     there are codes listed here that you can’t use when writing
     a coder, and there are codes that you may want to use
     when writing a coder that aren’t generated by @encode().
     (See the NSCoder class specification in the Foundation
     Framework reference for more information on encoding
     objects for archiving or distribution.
     
     file:///Users/tigerfly/Desktop/Runtime/Runtime/encoding.png
     
     ⚠️ Objective-C does not support the long double type.
     @encode(long double) returns d, which is the same encoding
     as for double.
     
     The type code for an array is enclosed within square brackets;
     the number of elements in the array is specified immediately
     after the open bracket, before the array type. For example,
     an array of 12 pointers to floats would be encoded as:
     [12^f]
     
     Structures are specified within braces, and unions within
     parentheses. The structure tag is listed first, followed
     by an equal sign and the codes for the fields of the structure
     listed in sequence. For example, the structure
     ====================================================
     typedef struct example {
         id   anObject;
         char *aString;
         int  anInt;
     } Example;
     ====================================================
     would be encoded like this:
     
     {example=@*i}
     The same encoding results whether the defined type name (Example)
     or the structure tag (example) is passed to @encode(). The
     encoding for a structure pointer carries the same amount of
     information about the structure’s fields:

     ^{example=@*i}
     However, another level of indirection removes the internal type
     specification:
     
     ^^{example}
     Objects are treated like structures. For example, passing the
     NSObject class name to @encode() yields this encoding:

     {NSObject=#}
     The NSObject class declares just one instance variable, isa,
     of type Class.

     Note that although the @encode() directive doesn’t return them,
     the runtime system uses the additional encodings listed in
     Table 6-2 for type qualifiers when they’re used to declare
     methods in a protocol.
     file:///Users/tigerfly/Desktop/Runtime/Runtime/methodEncoding.png
     */
    
    
//    char *buf1 = @encode(long long);
//    printf("%s",buf1);

    
    
    
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
