@interface DEVisualVoiceMailExtension
- (id)attachmentsForParameters:(id)a3;
@end

@implementation DEVisualVoiceMailExtension

- (id)attachmentsForParameters:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"VisualVoicemail.*",  1LL,  0LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/CrashReporter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[DEVisualVoiceMailExtension filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v5,  v4,  0LL));
  id v7 = [v6 mutableCopy];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Logs/VisualVoicemail/VisualVoicemail.log"));
  [v7 addObject:v8];

  return v7;
}

@end