@interface DEDataAccessExtension
- (id)attachmentsForParameters:(id)a3;
@end

@implementation DEDataAccessExtension

- (id)attachmentsForParameters:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @".*-latest.log",  1LL,  0LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/DataAccess"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[DEDataAccessExtension filesInDir:matchingPattern:excludingPattern:]( self,  "filesInDir:matchingPattern:excludingPattern:",  v5,  v4,  0LL));

  return v6;
}

@end