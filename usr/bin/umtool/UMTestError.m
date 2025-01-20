@interface UMTestError
+ (id)errorWithMessage:(id)a3;
@end

@implementation UMTestError

+ (id)errorWithMessage:(id)a3
{
  if (a3)
  {
    NSErrorUserInfoKey v7 = NSLocalizedDescriptionKey;
    id v8 = a3;
    id v3 = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"UMTestDomain",  -1LL,  v4));
  }

  else
  {
    id v4 = 0LL;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"UMTestDomain",  -1LL,  0LL));
  }

  return v5;
}

@end