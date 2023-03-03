//
//  HandleTheString.h
//  AESCipher
//
//  Created by Douglas on 2023/2/15.
//  Copyright © 2023 WelkinXie. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HandleTheString : NSObject

+ (NSString *)handleThePassword:(NSString *)password;

+ (NSString *)handleTheSign:(NSDictionary *)dict;

@end


