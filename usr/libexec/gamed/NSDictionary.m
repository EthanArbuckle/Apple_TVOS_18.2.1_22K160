@interface NSDictionary
+ (id)_gkDictionaryWithServerData:(id)a3 error:(id *)a4;
+ (id)_gkDictionaryWithServerData:(id)a3 serverStatus:(int64_t *)a4 error:(id *)a5;
+ (id)_gkDictionaryWithServerDataJson:(id)a3 error:(id *)a4;
+ (id)_gkDictionaryWithServerDataJson:(id)a3 serverStatus:(int64_t *)a4 error:(id *)a5;
- (id)_gkPlistXMLDataForClient:(id)a3 player:(id)a4;
@end

@implementation NSDictionary

- (id)_gkPlistXMLDataForClient:(id)a3 player:(id)a4
{
  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([a3 appSessionForPlayer:a4]);
    if (v5)
    {
      id v6 = -[NSDictionary mutableCopy](self, "mutableCopy");
      [v6 setObject:v5 forKey:@"app-session"];
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v6,  100LL,  0LL,  0LL));
    }

    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  self,  100LL,  0LL,  0LL));
    }
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  self,  100LL,  0LL,  0LL));
  }

  return v7;
}

+ (id)_gkDictionaryWithServerData:(id)a3 serverStatus:(int64_t *)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = v7;
  if (!a4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Assertion failed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/NSDictionar y+GKDaemonAdditions.m"));
    id v11 = objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (serverStatus != ((void *)0))\n[%s (%s:%d)]",  v9,  "+[NSDictionary(GKDaemonAdditions) _gkDictionaryWithServerData:serverStatus:error:]",  [v11 UTF8String],  41));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v12);
  }

  *a4 = 0LL;
  if (v8)
  {
    id v36 = 0LL;
    uint64_t v37 = 100LL;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v8,  0LL,  &v37,  &v36));
    id v14 = v36;
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary, v15);
    if ((objc_opt_isKindOfClass(v13, v16) & 1) != 0)
    {
      if (v13)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:GKRequestStatusKey]);
        id v18 = [v17 integerValue];

        *a4 = (int64_t)v18;
        if (a5 && v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:GKErrorMessageKey]);
          uint64_t v20 = GKAuthenticateAlertKey;
          v21 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:GKAuthenticateAlertKey]);

          if (v21)
          {
            uint64_t v40 = v20;
            v22 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v20]);
            v41 = v22;
            v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
            *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError userErrorForServerCode:reason:userInfo:]( &OBJC_CLASS___NSError,  "userErrorForServerCode:reason:userInfo:",  v18,  v19,  v23));
          }

          else
          {
            *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError userErrorForServerCode:reason:]( &OBJC_CLASS___NSError,  "userErrorForServerCode:reason:",  v18,  v19));
          }
        }
      }

      else if (a5)
      {
        *a5 = v14;
      }
    }

    else if (a5)
    {
      NSErrorUserInfoKey v42 = NSLocalizedFailureReasonErrorKey;
      v43 = @"Received unexpected data format in server response.";
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError userErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "userErrorForCode:userInfo:",  3LL,  v34));
    }
  }

  else
  {
    if (a5)
    {
      if (!os_log_GKGeneral) {
        id v24 = (id)GKOSLoggers(v7);
      }
      v25 = (os_log_s *)os_log_GKError;
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_10009CE04(v25, v26, v27, v28, v29, v30, v31, v32);
      }
      NSErrorUserInfoKey v38 = NSLocalizedFailureReasonErrorKey;
      v39 = @"No data received from the server.";
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError userErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "userErrorForCode:userInfo:",  3LL,  v33));
    }

    id v14 = 0LL;
    v13 = 0LL;
  }

  return v13;
}

+ (id)_gkDictionaryWithServerDataJson:(id)a3 serverStatus:(int64_t *)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = v7;
  if (!a4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Assertion failed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/NSDictionar y+GKDaemonAdditions.m"));
    id v11 = objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (serverStatus != ((void *)0))\n[%s (%s:%d)]",  v9,  "+[NSDictionary(GKDaemonAdditions) _gkDictionaryWithServerDataJson:serverStatus:error:]",  [v11 UTF8String],  94));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v12);
  }

  *a4 = 0LL;
  if (!v8)
  {
    if (a5)
    {
      if (!os_log_GKGeneral) {
        id v24 = (id)GKOSLoggers(v7);
      }
      v25 = (os_log_s *)os_log_GKError;
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_10009CE04(v25, v26, v27, v28, v29, v30, v31, v32);
      }
      NSErrorUserInfoKey v37 = NSLocalizedFailureReasonErrorKey;
      NSErrorUserInfoKey v38 = @"No data received from the server.";
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError userErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "userErrorForCode:userInfo:",  3LL,  v33));
    }

    id v14 = 0LL;
    goto LABEL_17;
  }

  id v36 = 0LL;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v8,  0LL,  &v36));
  id v14 = v36;
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary, v15);
  if ((objc_opt_isKindOfClass(v13, v16) & 1) != 0)
  {
    if (v13)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:GKRequestStatusKey]);
      id v18 = [v17 integerValue];

      *a4 = (int64_t)v18;
      if (a5 && v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:GKErrorMessageKey]);
        uint64_t v20 = GKAuthenticateAlertKey;
        v21 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:GKAuthenticateAlertKey]);

        if (v21)
        {
          uint64_t v39 = v20;
          v22 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v20]);
          uint64_t v40 = v22;
          v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
          *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError userErrorForServerCode:reason:userInfo:]( &OBJC_CLASS___NSError,  "userErrorForServerCode:reason:userInfo:",  v18,  v19,  v23));
        }

        else
        {
          *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError userErrorForServerCode:reason:]( &OBJC_CLASS___NSError,  "userErrorForServerCode:reason:",  v18,  v19));
        }
      }

      goto LABEL_24;
    }

    if (a5)
    {
      id v14 = v14;
      v13 = 0LL;
      *a5 = v14;
      goto LABEL_24;
    }

+ (id)_gkDictionaryWithServerData:(id)a3 error:(id *)a4
{
  uint64_t v5 = 0LL;
  return (id)objc_claimAutoreleasedReturnValue( [a1 _gkDictionaryWithServerData:a3 serverStatus:&v5 error:a4]);
}

+ (id)_gkDictionaryWithServerDataJson:(id)a3 error:(id *)a4
{
  uint64_t v5 = 0LL;
  return (id)objc_claimAutoreleasedReturnValue( [a1 _gkDictionaryWithServerDataJson:a3 serverStatus:&v5 error:a4]);
}

@end