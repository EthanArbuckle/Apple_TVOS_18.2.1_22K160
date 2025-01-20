@interface KeybagSyncOperation
- (KeybagSyncOperation)initWithKeybagSyncRequest:(id)a3;
- (id)_newBodyDataWithBodyPlist:(id)a3 error:(id *)a4;
- (id)_newRequestPropertiesWithBodyData:(id)a3;
- (void)run;
@end

@implementation KeybagSyncOperation

- (KeybagSyncOperation)initWithKeybagSyncRequest:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___KeybagSyncOperation;
  v5 = -[KeybagSyncOperation init](&v9, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSNumber *)v6;
  }

  return v5;
}

- (void)run
{
  v3 = self->_accountIdentifier;
  if (v3
    || (id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore")),
        v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeAccount]),
        v3 = (NSNumber *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]),
        v5,
        v4,
        v3))
  {
    CFDataRef v6 = sub_100022204(-[NSNumber unsignedLongLongValue](v3, "unsignedLongLongValue"), 11LL);
    if (v6)
    {
      CFDataRef v7 = v6;
      v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v7, @"kbsync");
      -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", @"familyChange", @"reason");
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 guid]);

      if ([v10 length]) {
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v10, @"guid");
      }
      id v50 = 0LL;
      id v11 = -[KeybagSyncOperation _newBodyDataWithBodyPlist:error:](self, "_newBodyDataWithBodyPlist:error:", v8, &v50);
      id v12 = v50;
      if (!v11)
      {
        id v27 = 0LL;
LABEL_41:

        goto LABEL_42;
      }

      id v13 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonProtocolDataProvider provider](&OBJC_CLASS___DaemonProtocolDataProvider, "provider"));
      [v14 setShouldProcessProtocol:0];
      v48 = v14;
      [v13 setDataProvider:v14];
      id v15 = -[KeybagSyncOperation _newRequestPropertiesWithBodyData:](self, "_newRequestPropertiesWithBodyData:", v11);
      [v15 setURLBagKey:@"view-software-updates"];
      v45 = v15;
      [v13 setRequestProperties:v15];
      id v47 = v13;
      v44 = -[SSAuthenticationContext initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___SSAuthenticationContext),  "initWithAccountIdentifier:",  v3);
      objc_msgSend(v13, "setAuthenticationContext:");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v16) {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      v46 = v3;
      LODWORD(v17) = [v16 shouldLog];
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
        uint64_t v17 = v17;
      }
      else {
        v17 &= 2u;
      }
      if ((_DWORD)v17)
      {
        v19 = (void *)objc_opt_class(self);
        int v51 = 138412290;
        id v52 = v19;
        v20 = v8;
        v21 = v7;
        id v22 = v11;
        v23 = v10;
        id v24 = v19;
        v25 = (void *)_os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  1LL,  "%@: Running operation",  &v51,  12);

        v10 = v23;
        id v11 = v22;
        CFDataRef v7 = v21;
        v8 = v20;

        if (!v25)
        {
LABEL_18:

          id v49 = v12;
          v26 = v47;
          id v27 = -[KeybagSyncOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v47,  &v49);
          id v28 = v49;

          v3 = v46;
          if ((_DWORD)v27)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue([v48 output]);
            uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSDictionary);
            if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
            {
              id v43 = v28;
              v31 = (NSData *)objc_claimAutoreleasedReturnValue([v29 objectForKey:@"keybag"]);
              uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSString);
              if ((objc_opt_isKindOfClass(v31, v32) & 1) != 0)
              {
                v33 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v31,  0LL);

                v31 = v33;
                v26 = v47;
              }

              uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSData);
              if ((objc_opt_isKindOfClass(v31, v34) & 1) != 0) {
                sub_100023280(v31);
              }

              id v28 = v43;
            }
          }

          id v12 = v28;
          goto LABEL_41;
        }

        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v25,  4LL));
        free(v25);
        v42 = v18;
        SSFileLog(v16, @"%@");
      }

      goto LABEL_18;
    }
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v35) {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v36 = [v35 shouldLog];
  else {
    LODWORD(v37) = v36;
  }
  v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 OSLogObject]);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
    uint64_t v37 = v37;
  }
  else {
    v37 &= 2u;
  }
  if (!(_DWORD)v37) {
    goto LABEL_38;
  }
  int v51 = 138412290;
  id v52 = (id)objc_opt_class(self);
  id v39 = v52;
  v40 = (void *)_os_log_send_and_compose_impl( v37,  0LL,  0LL,  0LL,  &_mh_execute_header,  v38,  2LL,  "%@: Skip operation, no kbsync data",  &v51,  12);

  if (v40)
  {
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v40,  4LL));
    free(v40);
    v42 = v38;
    SSFileLog(v35, @"%@");
LABEL_38:
  }

  uint64_t v41 = SSError(SSErrorDomain, 15LL, 0LL, 0LL);
  id v12 = (id)objc_claimAutoreleasedReturnValue(v41);
  id v27 = 0LL;
LABEL_42:
  -[KeybagSyncOperation setError:](self, "setError:", v12, v42);
  -[KeybagSyncOperation setSuccess:](self, "setSuccess:", v27);
}

- (id)_newBodyDataWithBodyPlist:(id)a3 error:(id *)a4
{
  id v9 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  a3,  100LL,  0LL,  &v9));
  id v6 = v9;
  if (v5)
  {
    CFDataRef v7 = (void *)ISCopyGzippedDataForData(v5);
    if (!a4) {
      goto LABEL_7;
    }
  }

  else
  {
    CFDataRef v7 = 0LL;
    if (!a4) {
      goto LABEL_7;
    }
  }

  if (!v7) {
    *a4 = v6;
  }
LABEL_7:

  return v7;
}

- (id)_newRequestPropertiesWithBodyData:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setAllowedRetryCount:](v4, "setAllowedRetryCount:", 0LL);
  -[SSMutableURLRequestProperties setHTTPBody:](v4, "setHTTPBody:", v3);

  -[SSMutableURLRequestProperties setHTTPMethod:](v4, "setHTTPMethod:", @"POST");
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v4,  "setValue:forHTTPHeaderField:",  @"gzip",  @"Content-Encoding");
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v4,  "setValue:forHTTPHeaderField:",  @"application/x-apple-plist",  @"Content-Type");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userAgentWithClientName:@"AppStore" version:@"2.0"]);

  if (v6) {
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v4,  "setValue:forHTTPHeaderField:",  v6,  SSHTTPHeaderUserAgent);
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end