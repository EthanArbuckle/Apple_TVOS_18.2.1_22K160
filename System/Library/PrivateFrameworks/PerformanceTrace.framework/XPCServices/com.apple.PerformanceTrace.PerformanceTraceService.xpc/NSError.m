@interface NSError
+ (id)error:(int64_t)a3 description:(id)a4;
+ (id)error:(int64_t)a3 description:(id)a4 underlyingError:(id)a5;
@end

@implementation NSError

+ (id)error:(int64_t)a3 description:(id)a4
{
  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  a4,  NSLocalizedDescriptionKey));
    int64_t v6 = a3;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"Unknown Error (description cannot be nil)",  NSLocalizedDescriptionKey));
    int64_t v6 = 0LL;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PerformanceTraceError",  v6,  v5));

  return v7;
}

+ (id)error:(int64_t)a3 description:(id)a4 underlyingError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = v8;
  if (!v7)
  {
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    v13 = @"Unknown Error (description cannot be nil)";
LABEL_6:
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v13,  v12));
    int64_t v11 = 0LL;
    goto LABEL_7;
  }

  if (!v8)
  {
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    v13 = @"Unknown Error (underlyingError cannot be nil)";
    goto LABEL_6;
  }

  v16[0] = NSLocalizedDescriptionKey;
  v16[1] = NSUnderlyingErrorKey;
  v17[0] = v7;
  v17[1] = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));
  int64_t v11 = a3;
LABEL_7:
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PerformanceTraceError",  v11,  v10));

  return v14;
}

@end