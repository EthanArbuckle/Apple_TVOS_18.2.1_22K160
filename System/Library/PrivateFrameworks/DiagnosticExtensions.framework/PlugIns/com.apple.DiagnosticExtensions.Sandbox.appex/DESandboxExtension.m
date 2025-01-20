@interface DESandboxExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation DESandboxExtension

- (id)attachmentList
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @".*Sandbox.*\\.(plist|ips).*",  1LL,  0LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/CrashReporter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[DESandboxExtension filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v4,  v3,  0LL));

  return v5;
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"DEExtensionAttachmentsParamDisplayNameKey"]);

  if (v5
    && (uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DEExtensionAttachmentsParamDisplayNameKey"])) != 0)
  {
    v7 = (void *)v6;
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @".*Sandbox.*%@.*\\.(plist|ips).*",  v6));
  }

  else
  {
    v8 = @".*Sandbox.*\\.(plist|ips).*";
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  v8,  1LL,  0LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/CrashReporter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[DESandboxExtension filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v10,  v9,  0LL));

  return v11;
}

@end