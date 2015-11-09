//
//  EmailSender.h
//  DoctorClient
//
//  Created by gus on 15/9/14.
//  Copyright (c) 2015年 gus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmailSender : NSObject
{
    
}

@property(nonatomic,strong)NSString* senderEmail;
@property(nonatomic,strong)NSString* senderPassword;
@property(nonatomic,strong)NSString* relayHost;
@property(nonatomic,strong)NSArray* portArray;



+(instancetype)sharedSender;

-(void)sendEmailConcurrent:(NSString*)email text:(NSString*)text;
-(void)sendEmail:(NSString*)email text:(NSString*)text;



@end
