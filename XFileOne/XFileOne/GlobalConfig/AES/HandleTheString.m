//
//  HandleTheString.m
//  AESCipher
//
//  Created by Douglas on 2023/2/15.
//  Copyright © 2023 WelkinXie. All rights reserved.
//

#import "HandleTheString.h"
#import <CommonCrypto/CommonDigest.h>
#import "AESCipher.h"

#define viKey @"b5efe609521e6522eac86d4218f62eb1"

@interface HandleTheString()

@end

@implementation HandleTheString

+ (NSString *)handleThePassword:(NSString *)password{
    //密码的三次加密
    NSString * password2 = [self MD5ForLower16Bate:password];
    NSString * password3 = [self MD5ForLower16Bate:password2];
    return  [self base64EncodeString:password3];
}


+ (NSString *)MD5ForLower16Bate:(NSString *)str{
    
    NSString *md5Str = [self MD5ForLower32Bate:str];

      NSString *string;
      for (int i=0; i<24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
      }
      return string;
    
    
    
    
}

+ (NSString *)MD5ForLower32Bate:(NSString *)str{

    //要进行UTF8的转码
      const char* input = [str UTF8String];
      unsigned char result[CC_MD5_DIGEST_LENGTH];
      CC_MD5(input, (CC_LONG)strlen(input), result);

      NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
      for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
      }

      return digest;
}

+ (NSString *)base64EncodeString:(NSString *)string

{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *base64Data = [data base64EncodedDataWithOptions:0];
    
    NSString *baseString = [[NSString alloc]initWithData:base64Data encoding:NSUTF8StringEncoding];
    
    return baseString;
}


+ (NSString*)stringWithDict:(NSDictionary*)dict{

NSArray*keys = [dict allKeys];

NSArray*sortedArray = [keys sortedArrayUsingComparator:^ NSComparisonResult(id obj1,id obj2) {

return[obj1 compare:obj2 options:NSNumericSearch];

}];

NSString*str =@"";

for(NSString * categoryId in sortedArray) {

id value = [dict objectForKey:categoryId];

if([value isKindOfClass:[NSDictionary class]]) {

value = [self stringWithDict:value];

}

//NSLog(@"[dict objectForKey:categoryId] === %@",[dict objectForKey:categoryId]);

if([str length] !=0) {

//str = [str stringByAppendingString:@";"];

}
str = [str stringByAppendingFormat:@"%@",value];
}

return str;

}

+ (NSString *)handleTheSign:(NSDictionary *)dict{
    
    //sign生成
    NSString * tempSign = [self stringWithDict:dict];
    NSString * tempSign2 = [NSString stringWithFormat:@"%@%@",tempSign,viKey];
    return  aesEncryptString(tempSign2, viKey);
    
}

@end
