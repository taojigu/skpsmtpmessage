# skpsmtpmessage

Email sending component on iOS, without any UI.A quick SMTP client for iOS.
Fork of http://code.google.com/p/skpsmtpmessage/ , by Ian Baird. 
I convert it into ARC supported. It works on iOS 8.


I add a wrapper of the email operations,EmailSender:

[EmailSender sharedSender].senderEmail = @"taojigu@163.com";
[EmailSender sharedSender].relayHost = @"smtp.163.com";
[EmailSender sharedSender].senderPassword = @"******";

[[EmailSender sharedSender] sendEmail:@"taojigu@163.com" text:@"This is a sender test"];

More details, you can also check the following message of class SMTPSenderAppDelegate
+(void)initParameter2UserDefaults;
-(void)sendEmailWithUserDefaultParameter;

