@interface NSException
+ (id)shl_exceptionWithName:(id)a3 reason:(id)a4;
@end

@implementation NSException

+ (id)shl_exceptionWithName:(id)a3 reason:(id)a4
{
  NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
  id v11 = a4;
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  v6,  v5,  v7));

  return v8;
}

@end