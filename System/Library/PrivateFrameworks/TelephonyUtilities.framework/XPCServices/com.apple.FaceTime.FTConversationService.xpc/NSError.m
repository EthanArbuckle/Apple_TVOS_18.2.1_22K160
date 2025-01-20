@interface NSError
- (NSError)conversationServiceDataSourceError;
@end

@implementation NSError

- (NSError)conversationServiceDataSourceError
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v3,  -[NSError code](self, "code"),  0LL));

  NSErrorUserInfoKey v8 = NSUnderlyingErrorKey;
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FaceTime.FTConversationService",  2LL,  v5));

  return (NSError *)v6;
}

@end