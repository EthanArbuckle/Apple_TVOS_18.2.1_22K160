@interface SLUtils
+ (id)createErrorWithMsg:(id)a3 code:(unint64_t)a4;
@end

@implementation SLUtils

+ (id)createErrorWithMsg:(id)a3 code:(unint64_t)a4
{
  v9 = @"reason";
  id v10 = a3;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.sl",  a4,  v6));

  return v7;
}

@end