@interface SyncRentalOperation
- (BOOL)_handleResponse:(id)a3 error:(id *)a4;
- (NSArray)sinfs;
- (NSNumber)accountIdentifier;
- (NSNumber)rentalKeyIdentifier;
- (NSString)clientIdentifierHeader;
- (NSString)userAgent;
- (SSURLConnectionResponse)URLResponse;
- (SyncRentalOperation)initWithAccountIdentifier:(id)a3;
- (SyncRentalOperation)initWithSinfs:(id)a3;
- (id)_bodyData;
- (void)_run;
- (void)run;
- (void)setClientIdentifierHeader:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation SyncRentalOperation

- (SyncRentalOperation)initWithSinfs:(id)a3
{
  id v5 = a3;
  if (![v5 count])
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2 object:self file:@"SyncRentalOperation.m" lineNumber:34 description:@"Must have sinfs"];
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SyncRentalOperation;
  v6 = -[SyncRentalOperation init](&v14, "init");
  if (v6)
  {
    v7 = (NSArray *)[v5 copy];
    sinfs = v6->_sinfs;
    v6->_sinfs = v7;

    if (v6->_sinfs)
    {
      v9 = -[SinfsArray initWithSINFs:](objc_alloc(&OBJC_CLASS___SinfsArray), "initWithSINFs:", v6->_sinfs);
      v10 = -[SinfsArray copyValueForProperty:error:]( v9,  "copyValueForProperty:error:",  @"SinfPropertyAccountIdentifier",  0LL);
      accountIdentifier = v6->_accountIdentifier;
      v6->_accountIdentifier = v10;
    }
  }

  return v6;
}

- (SyncRentalOperation)initWithAccountIdentifier:(id)a3
{
  id v5 = a3;
  if (![v5 unsignedLongLongValue])
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v10 handleFailureInMethod:a2 object:self file:@"SyncRentalOperation.m" lineNumber:50 description:@"Must have account"];
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SyncRentalOperation;
  v6 = -[SyncRentalOperation init](&v11, "init");
  if (v6)
  {
    v7 = (NSNumber *)[v5 copy];
    accountIdentifier = v6->_accountIdentifier;
    v6->_accountIdentifier = v7;
  }

  return v6;
}

- (void)run
{
}

- (id)_bodyData
{
  if (!-[NSNumber unsignedLongLongValue](self->_accountIdentifier, "unsignedLongLongValue"))
  {
    v4 = 0LL;
    v7 = 0LL;
    v6 = 0LL;
    goto LABEL_42;
  }

  v3 = sub_10002271C();
  if (v3)
  {
    v4 = v3;
    v34 = 0LL;
    v35 = 0LL;
    char v5 = sub_100022990(&v35, &v34);
    v6 = v35;
    v7 = v34;
    if ((v5 & 1) != 0)
    {
      v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v9 = v8;
      if (v6) {
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v6, @"device-diversity");
      }
      accountIdentifier = self->_accountIdentifier;
      if (accountIdentifier) {
        -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", accountIdentifier, @"dsid");
      }
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 guid]);

      if (v12) {
        -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v12, @"guid");
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice"));
      objc_super v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 productType]);

      if (v14) {
        -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v14, @"hw.model");
      }
      if (v7) {
        -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v7, @"rbsync");
      }
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v4, @"rental-bag");
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v9,  100LL,  0LL,  0LL));
      goto LABEL_54;
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v16) {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v21 = [v16 shouldLog];
    else {
      LODWORD(v22) = v21;
    }
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v22 = v22;
    }
    else {
      v22 &= 2u;
    }
    if (!(_DWORD)v22) {
      goto LABEL_39;
    }
    v24 = (void *)objc_opt_class(self);
    int v36 = 138412290;
    id v37 = v24;
    id v25 = v24;
    v26 = (void *)_os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "%@: Could not get rental bag request",  &v36,  12);

    if (v26)
    {
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  4LL));
      free(v26);
      v32 = v23;
      SSFileLog(v16, @"%@");
LABEL_39:
    }
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v16) {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v17 = [v16 shouldLog];
    else {
      LODWORD(v18) = v17;
    }
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v18 = v18;
    }
    else {
      v18 &= 2u;
    }
    if ((_DWORD)v18)
    {
      int v36 = 138412290;
      id v37 = (id)objc_opt_class(self);
      id v20 = v37;
      v6 = (NSMutableArray *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "%@: Could not get rental bag",  &v36,  12);

      if (!v6)
      {
        v4 = 0LL;
        v7 = 0LL;
        goto LABEL_41;
      }

      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v6,  4LL));
      free(v6);
      v32 = v19;
      SSFileLog(v16, @"%@");
    }

    v4 = 0LL;
    v7 = 0LL;
    v6 = 0LL;
  }

- (BOOL)_handleResponse:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:kISFailureTypeKey]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"rental-bag-response"]);
  v8 = v7;
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v9) {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      int v51 = 138412546;
      id v52 = (id)objc_opt_class(self);
      __int16 v53 = 2112;
      id v54 = v6;
      id v13 = v52;
      objc_super v14 = (void *)_os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "%@: Received failure type: %@",  &v51,  22);

      if (!v14)
      {
LABEL_14:

        if ((objc_opt_respondsToSelector(v6, "intValue") & 1) != 0
          && [v6 intValue] == 5102)
        {
          uint64_t v15 = ISError(15LL, 0LL, 0LL);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 errorBySettingFatalError:1]);
        }

        else
        {
          uint64_t v18 = ISError(2LL, 0LL, 0LL);
          unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(v18);
        }

        goto LABEL_35;
      }

      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
      free(v14);
      v48 = v12;
      SSFileLog(v9, @"%@");
    }

    goto LABEL_14;
  }

  if (!v7)
  {
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v33) {
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v34 = [v33 shouldLog];
    else {
      LODWORD(v35) = v34;
    }
    int v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 OSLogObject]);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO)) {
      uint64_t v35 = v35;
    }
    else {
      v35 &= 2u;
    }
    if ((_DWORD)v35)
    {
      int v51 = 138412290;
      id v52 = (id)objc_opt_class(self);
      id v37 = v52;
      v38 = (void *)_os_log_send_and_compose_impl( v35,  0LL,  0LL,  0LL,  &_mh_execute_header,  v36,  1LL,  "%@: Succeeding because no rental bag data",  &v51,  12);

      if (!v38)
      {
LABEL_48:

LABEL_49:
        unsigned int v17 = 0LL;
        goto LABEL_50;
      }

      int v36 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v38,  4LL));
      free(v38);
      v48 = v36;
      SSFileLog(v33, @"%@");
    }

    goto LABEL_48;
  }

  if (!sub_10002350C(v7)) {
    goto LABEL_22;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"device-diversity"]);
  unsigned int v17 = v19;
  if (v19)
  {
    BOOL v20 = sub_100023658(v19);

    if (!v20)
    {
LABEL_22:
      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v21) {
        unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v22 = [v21 shouldLog];
      else {
        LODWORD(v23) = v22;
      }
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v23 = v23;
      }
      else {
        v23 &= 2u;
      }
      if ((_DWORD)v23)
      {
        int v51 = 138412290;
        id v52 = (id)objc_opt_class(self);
        id v25 = v52;
        v26 = (void *)_os_log_send_and_compose_impl( v23,  0LL,  0LL,  0LL,  &_mh_execute_header,  v24,  0LL,  "%@: Could not process rental bag keys",  &v51,  12);

        if (!v26)
        {
LABEL_34:

          uint64_t v27 = ISError(15LL, 0LL, 0LL);
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          uint64_t v29 = SSErrorAllowRetryKey;
          id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
          uint64_t v31 = SSErrorBySettingUserInfoValue(v28, v29, v30);
          unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(v31);

LABEL_35:
          BOOL v32 = 0;
          goto LABEL_51;
        }

        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  4LL));
        free(v26);
        v48 = v24;
        SSFileLog(v21, @"%@");
      }

      goto LABEL_34;
    }

    goto LABEL_49;
  }

- (void)_run
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SyncRentalOperation _bodyData](self, "_bodyData"));
  if (!v3)
  {
    uint64_t v24 = ISError(15LL, 0LL, 0LL);
    id v17 = (id)objc_claimAutoreleasedReturnValue(v24);
    id v16 = 0LL;
    goto LABEL_18;
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  uint64_t v27 = -[SSAuthenticationContext initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___SSAuthenticationContext),  "initWithAccountIdentifier:",  self->_accountIdentifier);
  objc_msgSend(v4, "setAuthenticationContext:");
  id v5 = objc_alloc_init(&OBJC_CLASS___DaemonProtocolDataProvider);
  [v4 setDataProvider:v5];
  -[DaemonProtocolDataProvider setShouldProcessDialogs:](v5, "setShouldProcessDialogs:", 0LL);
  v6 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setCachePolicy:](v6, "setCachePolicy:", 1LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SyncRentalOperation clientIdentifierHeader](self, "clientIdentifierHeader"));
  -[SSMutableURLRequestProperties setClientIdentifier:](v6, "setClientIdentifier:", v7);

  -[SSMutableURLRequestProperties setHTTPBody:](v6, "setHTTPBody:", v3);
  -[SSMutableURLRequestProperties setHTTPMethod:](v6, "setHTTPMethod:", @"POST");
  -[SSMutableURLRequestProperties setURLBagKey:](v6, "setURLBagKey:", @"rental-sync");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SyncRentalOperation userAgent](self, "userAgent"));
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v6,  "setValue:forHTTPHeaderField:",  v8,  SSHTTPHeaderUserAgent);

  [v4 setRequestProperties:v6];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v9) {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v10 = [v9 shouldLog];
  else {
    unsigned int v11 = v10;
  }
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v11 & 2;
  }
  if (!(_DWORD)v13) {
    goto LABEL_13;
  }
  int v30 = 138412290;
  id v31 = (id)objc_opt_class(self);
  id v14 = v31;
  uint64_t v15 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  1LL,  "%@: Syncing rental",  &v30,  12);

  if (v15)
  {
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
    free(v15);
    id v25 = v12;
    SSFileLog(v9, @"%@");
LABEL_13:
  }

  id v29 = 0LL;
  id v16 = -[SyncRentalOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v4, &v29);
  id v17 = v29;
  if ((_DWORD)v16)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[DaemonProtocolDataProvider output](v5, "output"));
    id v28 = v17;
    id v16 = (id)-[SyncRentalOperation _handleResponse:error:](self, "_handleResponse:error:", v18, &v28);
    id v26 = v28;

    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v18,  100LL,  0LL,  0LL));
    -[SyncRentalOperation lock](self, "lock");
    BOOL v20 = objc_alloc(&OBJC_CLASS___SSURLConnectionResponse);
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v4 response]);
    unsigned int v22 = -[SSURLConnectionResponse initWithURLResponse:bodyData:](v20, "initWithURLResponse:bodyData:", v21, v19);
    URLResponse = self->_URLResponse;
    self->_URLResponse = v22;

    -[SyncRentalOperation unlock](self, "unlock");
    id v17 = v26;
  }

LABEL_18:
  -[SyncRentalOperation setError:](self, "setError:", v17, v25);
  -[SyncRentalOperation setSuccess:](self, "setSuccess:", v16);
}

- (NSArray)sinfs
{
  return (NSArray *)objc_getProperty(self, a2, 96LL, 1);
}

- (NSNumber)accountIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 104LL, 1);
}

- (NSNumber)rentalKeyIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 112LL, 1);
}

- (NSString)clientIdentifierHeader
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setClientIdentifierHeader:(id)a3
{
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setUserAgent:(id)a3
{
}

- (SSURLConnectionResponse)URLResponse
{
  return (SSURLConnectionResponse *)objc_getProperty(self, a2, 136LL, 1);
}

- (void).cxx_destruct
{
}

@end