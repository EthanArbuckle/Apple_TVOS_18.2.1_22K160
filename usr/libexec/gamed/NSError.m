@interface NSError
+ (id)_gkErrorForDatabase:(sqlite3 *)a3;
- (NSError)serializableError;
- (id)withExpungedClientData;
@end

@implementation NSError

+ (id)_gkErrorForDatabase:(sqlite3 *)a3
{
  v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"sqlite3 error: %s",  sqlite3_errmsg(a3),  NSLocalizedDescriptionKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v10 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));

  v7 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"GKDatabaseErrorDomain",  sqlite3_errcode(a3),  v6);
  return v7;
}

- (NSError)serializableError
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));

  if (!v3) {
    goto LABEL_6;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  if ([v5 isEqualToString:GKServerErrorDomain])
  {

LABEL_5:
    goto LABEL_6;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  unsigned __int8 v9 = [v8 isEqualToString:GKInternalErrorDomain];

  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
    unsigned int v11 = [v10 isEqualToString:NSURLErrorDomain];

    if (v11
      || (v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo")),
          unsigned int v13 = +[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v12),
          v12,
          !v13))
    {
      v6 = (NSError *)objc_claimAutoreleasedReturnValue(-[NSError withExpungedClientData](self, "withExpungedClientData"));
      return v6;
    }
  }

- (id)withExpungedClientData
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  v4 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Making error serializable: %@", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  NSInteger v6 = -[NSError code](self, "code");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v12[0] = NSHelpAnchorErrorKey;
  v12[1] = NSLocalizedDescriptionKey;
  v12[2] = NSLocalizedFailureReasonErrorKey;
  v12[3] = NSLocalizedRecoveryOptionsErrorKey;
  v12[4] = NSLocalizedRecoverySuggestionErrorKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 5LL));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 _gkSubDictionaryWithKeys:v8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v5,  v6,  v9));

  return v10;
}

@end