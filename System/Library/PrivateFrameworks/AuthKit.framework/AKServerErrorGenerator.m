@interface AKServerErrorGenerator
+ (id)errorFromServerResponseParameters:(id)a3 authenticationError:(int64_t)a4;
@end

@implementation AKServerErrorGenerator

+ (id)errorFromServerResponseParameters:(id)a3 authenticationError:(int64_t)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"em"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"tt"]);

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v8);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0
    && (uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10), (objc_opt_isKindOfClass(v7, v11) & 1) != 0))
  {
    v19[0] = NSLocalizedFailureErrorKey;
    v19[1] = NSLocalizedFailureReasonErrorKey;
    v20[0] = v7;
    v20[1] = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:userInfo:](&OBJC_CLASS___NSError, "ak_errorWithCode:userInfo:", a4, v12));
  }

  else
  {
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString, v10);
    if ((objc_opt_isKindOfClass(v6, v14) & 1) != 0)
    {
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      v18 = v6;
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:userInfo:",  a4,  v15));
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", a4));
    }
  }

  return v13;
}

@end