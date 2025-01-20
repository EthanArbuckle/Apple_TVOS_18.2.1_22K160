@interface NSError
- (NSError)initWithOctaneSimulatedError:(int64_t)a3;
- (NSNumber)lib_coordinatorOwnerID;
- (NSString)lib_sanitizedDescription;
- (NSString)lib_serverDialogID;
- (NSString)lib_shortDescription;
- (id)lib_addRecoveryOptions:(id)a3;
- (id)lib_addUserInfoValue:(id)a3 forKey:(id)a4;
- (id)toASDErrorWithMetadata:(id)a3;
- (void)lib_walkUnderlyingErrorsUsingBlock:(id)a3;
@end

@implementation NSError

- (NSNumber)lib_coordinatorOwnerID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"coordinatorOwnerID"]);

  return (NSNumber *)v3;
}

- (NSString)lib_sanitizedDescription
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100077F20;
  v6[3] = &unk_1002EA0A8;
  v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v3 = v7;
  -[NSError lib_walkUnderlyingErrorsUsingBlock:](self, "lib_walkUnderlyingErrorsUsingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", @":"));

  return (NSString *)v4;
}

- (NSString)lib_shortDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%ld",  v3,  -[NSError code](self, "code")));

  return (NSString *)v4;
}

- (NSString)lib_serverDialogID
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"dialogID"]);

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tcr_stringForKeyPath:", @"AMSServerPayload.metrics.dialogId"));
  }

  return (NSString *)v4;
}

- (id)lib_addRecoveryOptions:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedRecoveryOptions](self, "localizedRecoveryOptions"));
  id v6 = [v5 count];

  if (v6)
  {
    v7 = self;
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v8));

    [v9 setObject:v4 forKey:NSLocalizedRecoveryOptionsErrorKey];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
    NSInteger v11 = -[NSError code](self, "code");
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v9));
    v7 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  v11,  v12));
  }

  return v7;
}

- (id)lib_addUserInfoValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v9 = (NSMutableDictionary *)[v8 mutableCopy];

  if (!v9) {
    v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  NSInteger v11 = -[NSError code](self, "code");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v9));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  v11,  v12));

  return v13;
}

- (void)lib_walkUnderlyingErrorsUsingBlock:(id)a3
{
  id v4 = self;
  while (1)
  {
    v8 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](v8, "userInfo"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    id v4 = (NSError *)v6;
    if (!v6)
    {
      id v7 = 0LL;
      goto LABEL_6;
    }
  }

  id v7 = v8;
LABEL_6:
}

- (NSError)initWithOctaneSimulatedError:(int64_t)a3
{
  return (NSError *)sub_1000B2414(a3);
}

- (id)toASDErrorWithMetadata:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = sub_1000D6D80((char *)a3);

  v8 = (void *)_convertErrorToNSError(_:)(v7);
  swift_errorRelease(v7);
  return v8;
}

@end