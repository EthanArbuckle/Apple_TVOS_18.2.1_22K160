@interface NSError
+ (id)FPSAPS_errorDescriptionForCode:(int64_t)a3;
+ (id)FPSAPS_errorWithCode:(int64_t)a3;
+ (id)FPSAPS_errorWithCode:(int64_t)a3 andDescription:(id)a4;
+ (id)MFAA_errorWithDomain:(id)a3 code:(int64_t)a4;
+ (id)MFAA_errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5;
+ (id)MFAA_errorWithDomain:(id)a3 code:(int64_t)a4 failureReason:(id)a5;
@end

@implementation NSError

+ (id)MFAA_errorWithDomain:(id)a3 code:(int64_t)a4
{
  id v5 = a3;
  v6 = errorDescription(v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MFAA_errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "MFAA_errorWithDomain:code:description:",  v5,  a4,  v7));

  return v8;
}

+ (id)MFAA_errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = v8;
  if (v8)
  {
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    id v14 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
  }

  else
  {
    v10 = 0LL;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v7,  a4,  v10));

  return v11;
}

+ (id)MFAA_errorWithDomain:(id)a3 code:(int64_t)a4 failureReason:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (v8)
  {
    v14[0] = NSLocalizedDescriptionKey;
    v9 = errorDescription(v7, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v14[1] = NSLocalizedFailureReasonErrorKey;
    v15[0] = v10;
    v15[1] = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
  }

  else
  {
    v11 = 0LL;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v7,  a4,  v11));

  return v12;
}

+ (id)FPSAPS_errorDescriptionForCode:(int64_t)a3
{
  else {
    return *(&off_100074B08 + a3 + 7);
  }
}

+ (id)FPSAPS_errorWithCode:(int64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError FPSAPS_errorDescriptionForCode:](&OBJC_CLASS___NSError, "FPSAPS_errorDescriptionForCode:"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError FPSAPS_errorWithCode:andDescription:]( &OBJC_CLASS___NSError,  "FPSAPS_errorWithCode:andDescription:",  a3,  v4));

  return v5;
}

+ (id)FPSAPS_errorWithCode:(int64_t)a3 andDescription:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    id v11 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  }

  else
  {
    id v7 = 0LL;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"FairPlaySAPSessionErrorDomain",  a3,  v7));

  return v8;
}

@end