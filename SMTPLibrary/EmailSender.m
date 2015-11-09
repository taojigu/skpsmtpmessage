//
//  EmailSender.m
//  DoctorClient
//
//  Created by gus on 15/9/14.
//  Copyright (c) 2015年 gus. All rights reserved.
//

#import "EmailSender.h"
#import "SKPSMTPMessage.h"


@implementation EmailSender


+(instancetype)sharedSender
{
    static EmailSender* sender = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        if (nil == sender)
        {
            sender = [[EmailSender alloc]init];
        }
    });
    return sender;
}

-(void)sendEmailConcurrent:(NSString*)email text:(NSString*)text
{
    if (text.length == 0)
    {
        text = @"nil text";
    }
    SKPSMTPMessage*message=[self emailMessage:email text:text];
    [self sendMessageConcurrent:message];
    return;
}
-(void)sendEmail:(NSString*)email text:(NSString*)text
{
    if (text.length == 0)
    {
        text = @"nil text";
    }
     SKPSMTPMessage*message=[self emailMessage:email text:text];
    [message send];
}

-(SKPSMTPMessage*)emailMessage:(NSString*)toEmail text:(NSString*)text
{
    NSParameterAssert(toEmail);
    SKPSMTPMessage* message = [[SKPSMTPMessage alloc]init];
    message.login = self.senderEmail;
    message.pass = self.senderPassword;
    message.fromEmail = self.senderEmail;
    message.relayHost = self.relayHost;
    message.toEmail = toEmail;
    message.wantsSecure = YES;
    message.requiresAuth = YES;
    message.subject = [self defatuSubject];
    
    NSDictionary *plainPart = [NSDictionary dictionaryWithObjectsAndKeys:@"text/plain; charset=UTF-8",kSKPSMTPPartContentTypeKey,
                               text,kSKPSMTPPartMessageKey,@"8bit",kSKPSMTPPartContentTransferEncodingKey,nil];
    
    message.parts = [NSArray arrayWithObjects:plainPart,nil];
    return message;
}
-(void)sendMessageConcurrent:(SKPSMTPMessage*)message
{
    dispatch_queue_t aQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(aQueue, ^{
        [message send];
        return ;
    });
}
-(NSString*)defatuSubject
{
    NSDateFormatter*formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    NSString*dateString=[formatter stringFromDate:[NSDate date]];
    NSString* subject = [NSString stringWithFormat:@"EmailFromClient:%@",dateString];
    return subject;
}

@end
