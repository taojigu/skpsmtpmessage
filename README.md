# skpsmtpmessage

Email sending component on iOS, without any UI.A quick SMTP client for iOS.
Fork of http://code.google.com/p/skpsmtpmessage/ , by Ian Baird. 
I convert it into ARC supported. It works on iOS 8.

To send the mail , some parameter should be set, just like the message below , in class SMTPSenderAppDelegate, in the Demo
+ (void)initialize
+ {
+ NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
+ NSMutableDictionary *defaultsDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"monica@friends.com", @"fromEmail",
+ @"rachel@friends.com", @"toEmail",
+ @"smtp.qiye.163.com", @"relayHost",
+ @"monica@friends.com", @"login",
+ @"123456", @"pass",
+ [NSNumber numberWithBool:YES], @"requiresAuth",
+ [NSNumber numberWithBool:YES], @"wantsSecure", nil];
+ [userDefaults registerDefaults:defaultsDictionary];
+ }
