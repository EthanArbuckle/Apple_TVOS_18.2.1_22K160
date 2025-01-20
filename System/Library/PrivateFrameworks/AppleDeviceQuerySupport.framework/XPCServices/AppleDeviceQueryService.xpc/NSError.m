@interface NSError
+ (NSError)errorWithZhuGeErrorCode:(unint64_t)a3 underlyingError:(id)a4;
+ (id)descriptionFromZhuGeErrorCode:(unint64_t)a3;
- (id)ZhuGeDescription;
- (id)_ZhuGeDescriptionWithLayer:(unint64_t)a3;
@end

@implementation NSError

+ (NSError)errorWithZhuGeErrorCode:(unint64_t)a3 underlyingError:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.zhuge",  0LL,  0LL));
  if (a3 != 1)
  {
    if (a3 >= 0x51)
    {
      v7 = off_100019650[0];
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ZhuGeErrorCode %@ exceed maximum",  v11));
LABEL_9:

      v10 = @"Please file a radar against \"ZhuGe|all\"";
      a3 = 1LL;
      goto LABEL_10;
    }

    v12 = (void *)((char *)&ZhuGeErrorTable + 32 * a3);
    if (*v12 != a3)
    {
      v7 = off_100019650[0];
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *v12));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Index %@ of ZhuGeErrorCode table got a wrong code %@",  v11,  v15));

      goto LABEL_9;
    }

    v13 = v5;
    if (isObjectNilOrZhuGeNull(v5))
    {
      id v14 = v6;
    }

    else
    {
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSError);
      if ((objc_opt_isKindOfClass(v5, v20) & 1) != 0)
      {
LABEL_16:
        v23 = (id *)((char *)&ZhuGeErrorTable + 32 * a3);
        v7 = (__CFString *)v23[1];
        v9 = (__CFString *)v23[2];
        v10 = (__CFString *)v23[3];
        id v5 = v13;
        goto LABEL_11;
      }

      uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v5, v21) & 1) == 0)
      {
        v7 = off_100019650[0];
        v10 = @"Please check latest code that using ZhuGe error API";
        a3 = 1LL;
        v13 = v6;
        v9 = @"UnderlyingError can only be NSError, NSString, ZHUGE_NULL or nil";
        goto LABEL_11;
      }

      v26[0] = NSLocalizedDescriptionKey;
      v26[1] = NSLocalizedFailureReasonErrorKey;
      v27[0] = v5;
      v27[1] = off_100019678[0];
      v26[2] = NSLocalizedRecoverySuggestionErrorKey;
      v26[3] = NSUnderlyingErrorKey;
      v27[2] = off_100019680;
      v27[3] = v6;
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  4LL));
      id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.zhuge",  2LL,  v22));
    }

    v13 = v14;
    goto LABEL_16;
  }

  v7 = off_100019650[0];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 1LL));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Reserved ZhuGeErrorCode %@ shall not be the argument",  v8));

  v10 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Please check newly added code that calling ZhuGeError API"));
LABEL_10:
  v13 = v6;
LABEL_11:
  id v16 = v13;
  v24[0] = NSLocalizedDescriptionKey;
  v24[1] = NSLocalizedFailureReasonErrorKey;
  v25[0] = v7;
  v25[1] = v9;
  v24[2] = NSLocalizedRecoverySuggestionErrorKey;
  v24[3] = NSUnderlyingErrorKey;
  v25[2] = v10;
  v25[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  4LL));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.zhuge",  a3,  v17));

  return (NSError *)v18;
}

+ (id)descriptionFromZhuGeErrorCode:(unint64_t)a3
{
  if (a3 <= 0x50)
  {
    if (*((void *)&ZhuGeErrorTable + 4 * a3) == a3) {
      v3 = (__CFString *)*((id *)&ZhuGeErrorTable + 4 * a3 + 1);
    }
    else {
      v3 = @"Invalid ZhuGe Error Code!";
    }
  }

  else
  {
    v3 = @"Illegal ZhuGe Error Code!";
  }

  return v3;
}

- (id)_ZhuGeDescriptionWithLayer:(unint64_t)a3
{
  unint64_t v5 = 4 * a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue( [&stru_100014878 stringByPaddingToLength:4 * a3 withString:@" " startingAtIndex:0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( [&stru_100014878 stringByPaddingToLength:(4 * a3) | 2 withString:@" " startingAtIndex:0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( [&stru_100014878 stringByPaddingToLength:v5 + 4 withString:@" " startingAtIndex:0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  unsigned __int8 v10 = [v9 isEqualToString:@"com.apple.zhuge"];

  if ((v10 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:NSLocalizedDescriptionKey]);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:NSLocalizedFailureReasonErrorKey]);

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:NSLocalizedRecoverySuggestionErrorKey]);

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:NSUnderlyingErrorKey]);

    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSError);
    if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v17 _ZhuGeDescriptionWithLayer:a3 + 1]);

      v17 = (void *)v19;
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[NSError code](self, "code")));
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n%@{\n%@Domain   = %@\n%@Code     = %@\n%@UserInfo = {\n%@Description        = %@\n%@FailureReason      = %@\n%@RecoverySuggestion = %@\n%@UnderlyingError    = %@\n%@}",  v6,  v7,  v20,  v7,  v21,  v7,  v8,  v12,  v8,  v24,  v8,  v15,  v8,  v17,  v6));
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSError description](self, "description"));
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{\n%@%@\n%@}",  v8,  v12,  v7));
  }

  return v22;
}

- (id)ZhuGeDescription
{
  return -[NSError _ZhuGeDescriptionWithLayer:](self, "_ZhuGeDescriptionWithLayer:", 0LL);
}

@end