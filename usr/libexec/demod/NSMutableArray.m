@interface NSMutableArray
- (BOOL)_addHMACComponent:(id)a3 error:(id *)a4;
@end

@implementation NSMutableArray

- (BOOL)_addHMACComponent:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0LL;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([a3 _stringForHMAC]);
  if (v6)
  {
    -[NSMutableArray addObject:](self, "addObject:", v6);
  }

  else if (a4)
  {
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    v10 = @"Cannot encode HMAC component";
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"AluminiumAuthenticatorErrorDomain",  1LL,  v7));
  }

  return v6 != 0LL;
}

@end