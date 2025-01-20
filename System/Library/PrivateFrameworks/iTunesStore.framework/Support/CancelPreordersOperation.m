@interface CancelPreordersOperation
- (BOOL)_cancelPreorderWithOperation:(id)a3 error:(id *)a4;
- (id)_newURLOperationWithItemID:(id)a3 accountID:(id)a4;
- (id)uniqueKey;
- (void)run;
@end

@implementation CancelPreordersOperation

- (void)run
{
  id v3 = +[DownloadsDatabase downloadsDatabase](&OBJC_CLASS___DownloadsDatabase, "downloadsDatabase");
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000D75A8;
  v22[3] = &unk_10034B990;
  v22[4] = self;
  v22[5] = v4;
  v15 = v3;
  [v3 readUsingTransactionBlock:v22];
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v18,  v23,  16LL);
  if (v5)
  {
    id v6 = v5;
    id v7 = 0LL;
    uint64_t v8 = *(void *)v19;
    char v9 = 1;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        v12 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
        id v13 = -[NSMutableDictionary objectForKey:](v4, "objectForKey:", v11);
        id v17 = 0LL;
        if (-[CancelPreordersOperation _cancelPreorderWithOperation:error:]( self,  "_cancelPreorderWithOperation:error:",  v13,  &v17))
        {
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472LL;
          v16[2] = sub_1000D7710;
          v16[3] = &unk_10034D7F0;
          v16[4] = v11;
          [v15 modifyUsingTransactionBlock:v16];
        }

        else
        {
          if (!v7) {
            id v7 = v17;
          }
          char v9 = 0;
        }

        -[NSAutoreleasePool drain](v12, "drain");
      }

      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v18,  v23,  16LL);
    }

    while (v6);
  }

  else
  {
    id v7 = 0LL;
    char v9 = 1;
  }

  id v14 = v7;
  -[CancelPreordersOperation setError:](self, "setError:", v7);
  -[CancelPreordersOperation setSuccess:](self, "setSuccess:", v9 & 1);
}

- (id)uniqueKey
{
  return @"com.apple.itunesstored.CancelPreordersOperation";
}

- (BOOL)_cancelPreorderWithOperation:(id)a3 error:(id *)a4
{
  v31 = 0LL;
  LODWORD(v7) = -[CancelPreordersOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  a3,  &v31);
  if ((_DWORD)v7)
  {
    id v8 = objc_msgSend(objc_msgSend(a3, "dataProvider"), "output");
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      id v10 = [v8 objectForKey:kISFailureTypeKey];
      if (v10)
      {
        uint64_t v11 = v10;
        id v12 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v12) {
          id v12 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v13 = [v12 shouldLog];
        else {
          LODWORD(v14) = v13;
        }
        v15 = (os_log_s *)[v12 OSLogObject];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v14 = v14;
        }
        else {
          v14 &= 2u;
        }
        if ((_DWORD)v14)
        {
          uint64_t v16 = objc_opt_class(self);
          int v32 = 138412546;
          uint64_t v33 = v16;
          __int16 v34 = 2112;
          uint64_t v35 = (uint64_t)v11;
          uint64_t v17 = _os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "%@: Cancel failed with failureType: %@",  &v32,  22);
          if (v17)
          {
            __int128 v18 = (void *)v17;
            +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v17, 4LL);
            free(v18);
            SSFileLog(v12, @"%@");
          }
        }

        if ((objc_opt_respondsToSelector(v11, "intValue") & 1) != 0)
        {
          uint64_t v19 = SSServerErrorDomain;
          uint64_t v20 = (int)[v11 intValue];
          uint64_t v21 = v19;
        }

        else
        {
          uint64_t v21 = SSErrorDomain;
          uint64_t v20 = 100LL;
        }

        uint64_t v29 = SSError(v21, v20, 0LL, 0LL);
        LOBYTE(v7) = 0;
        v31 = (void *)v29;
      }

      else
      {
        LOBYTE(v7) = 1;
      }
    }

    else
    {
      id v22 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v22) {
        id v22 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v23 = [v22 shouldLog];
      else {
        LODWORD(v24) = v23;
      }
      v25 = (os_log_s *)[v22 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v24 = v24;
      }
      else {
        v24 &= 2u;
      }
      if ((_DWORD)v24)
      {
        uint64_t v26 = objc_opt_class(self);
        uint64_t v27 = objc_opt_class(v8);
        int v32 = 138412546;
        uint64_t v33 = v26;
        __int16 v34 = 2112;
        uint64_t v35 = v27;
        uint64_t v7 = _os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "%@: Invalid response type: %@",  &v32,  22);
        if (!v7) {
          goto LABEL_32;
        }
        v28 = (void *)v7;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v7, 4LL);
        free(v28);
        SSFileLog(v22, @"%@");
      }

      LOBYTE(v7) = 0;
    }
  }

- (id)_newURLOperationWithItemID:(id)a3 accountID:(id)a4
{
  id v6 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  objc_msgSend( v6,  "setDataProvider:",  +[DaemonProtocolDataProvider provider](DaemonProtocolDataProvider, "provider"));
  [v6 setNeedsAuthentication:1];
  uint64_t v7 = -[SSAuthenticationContext initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___SSAuthenticationContext),  "initWithAccountIdentifier:",  a4);
  [v6 setAuthenticationContext:v7];

  id v8 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setURLBagKey:](v8, "setURLBagKey:", @"p2-cancel-pre-order");
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", [a3 stringValue], @"id");
  -[SSMutableURLRequestProperties setRequestParameters:](v8, "setRequestParameters:", v9);

  [v6 setRequestProperties:v8];
  return v6;
}

@end