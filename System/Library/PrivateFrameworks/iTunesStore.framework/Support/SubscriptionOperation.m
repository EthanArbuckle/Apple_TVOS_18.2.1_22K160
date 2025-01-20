@interface SubscriptionOperation
- (BOOL)isRequestingOfflineSlot;
- (NSString)userAgent;
- (SSAuthenticationContext)authenticationContext;
- (SSVSubscriptionResponse)response;
- (id)_newMachineDataOperationWithAccount:(id)a3 response:(id)a4;
- (id)_requestPropertiesWithAccount:(id)a3 syncState:(id)a4 fairPlaySubscriptionController:(id)a5;
- (int64_t)operationType;
- (void)run;
- (void)setAuthenticationContext:(id)a3;
- (void)setOperationType:(int64_t)a3;
- (void)setRequestingOfflineSlot:(BOOL)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation SubscriptionOperation

- (SSAuthenticationContext)authenticationContext
{
  id v3 = -[SSAuthenticationContext copy](self->_authenticationContext, "copy");
  -[SubscriptionOperation unlock](self, "unlock");
  return (SSAuthenticationContext *)v3;
}

- (BOOL)isRequestingOfflineSlot
{
  BOOL requestingOfflineSlot = self->_requestingOfflineSlot;
  -[SubscriptionOperation unlock](self, "unlock");
  return requestingOfflineSlot;
}

- (int64_t)operationType
{
  int64_t operationType = self->_operationType;
  -[SubscriptionOperation unlock](self, "unlock");
  return operationType;
}

- (SSVSubscriptionResponse)response
{
  id v3 = -[SSVSubscriptionResponse copy](self->_response, "copy");
  -[SubscriptionOperation unlock](self, "unlock");
  return (SSVSubscriptionResponse *)v3;
}

- (void)setAuthenticationContext:(id)a3
{
  v6 = (SSAuthenticationContext *)a3;
  -[SubscriptionOperation lock](self, "lock");
  if (self->_authenticationContext != v6)
  {
    v4 = (SSAuthenticationContext *)-[SSAuthenticationContext copy](v6, "copy");
    authenticationContext = self->_authenticationContext;
    self->_authenticationContext = v4;
  }

  -[SubscriptionOperation unlock](self, "unlock");
}

- (void)setOperationType:(int64_t)a3
{
  self->_int64_t operationType = a3;
  -[SubscriptionOperation unlock](self, "unlock");
}

- (void)setRequestingOfflineSlot:(BOOL)a3
{
  self->_BOOL requestingOfflineSlot = a3;
  -[SubscriptionOperation unlock](self, "unlock");
}

- (void)setUserAgent:(id)a3
{
  v6 = (NSString *)a3;
  -[SubscriptionOperation lock](self, "lock");
  if (self->_userAgent != v6)
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    userAgent = self->_userAgent;
    self->_userAgent = v4;
  }

  -[SubscriptionOperation unlock](self, "unlock");
}

- (NSString)userAgent
{
  id v3 = -[NSString copy](self->_userAgent, "copy");
  -[SubscriptionOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (void)run
{
  v2 = self;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[SubscriptionOperation authenticationContext](self, "authenticationContext"));
  v74 = 0LL;
  v75 = (void *)objc_claimAutoreleasedReturnValue([v73 requiredUniqueIdentifier]);
  char v70 = 0;
  id v3 = 0LL;
  char v4 = 1;
  uint64_t v71 = SSServerErrorDomain;
  uint64_t v69 = SSErrorDomain;
  v5 = &ACSLocateCachingServer_ptr;
  do
  {
    id v76 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore", v67));
    if (![v75 longLongValue]
      || (uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 accountWithUniqueIdentifier:v75])) == 0)
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 activeAccount]);
    }

    v79 = v6;
    id v8 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
    [v8 setAuthenticationContext:v73];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonProtocolDataProvider provider](&OBJC_CLASS___DaemonProtocolDataProvider, "provider"));
    [v8 setDataProvider:v9];

    [v8 setDelegate:v2];
    [v8 setMachineDataStyle:0];
    [v8 setUseUserSpecificURLBag:1];
    v80 = objc_alloc_init(&OBJC_CLASS___SSVFairPlaySubscriptionController);
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[SubscriptionOperation _requestPropertiesWithAccount:syncState:fairPlaySubscriptionController:]( v2,  "_requestPropertiesWithAccount:syncState:fairPlaySubscriptionController:",  v7,  v74));
    [v8 setRequestProperties:v10];
    v11 = (void *)objc_claimAutoreleasedReturnValue([v5[459] sharedDaemonConfig]);
    if (!v11) {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v5[459] sharedConfig]);
    }
    v81 = (void *)v7;
    unsigned int v12 = [v11 shouldLog];
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      uint64_t v14 = v12;
    }
    else {
      uint64_t v14 = v12 & 2;
    }
    v78 = v10;
    if ((_DWORD)v14)
    {
      v15 = (void *)objc_opt_class(v2);
      v16 = v2;
      v17 = v5;
      char v18 = v4;
      id v19 = v15;
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 URLBagKey]);
      int v85 = 138412546;
      v86 = v15;
      __int16 v87 = 2112;
      id v88 = v20;
      LODWORD(v68) = 22;
      v21 = (void *)_os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  1LL,  "%@: Running operation with bag key: %@",  &v85,  v68);

      char v4 = v18;
      v5 = v17;
      v2 = v16;

      v22 = v76;
      if (!v21) {
        goto LABEL_17;
      }
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v21,  4LL));
      free(v21);
      v67 = v13;
      SSFileLog(v11, @"%@");
    }

    else
    {
      v22 = v76;
    }

LABEL_17:
    id v84 = v22;
    unsigned __int8 v23 = -[SubscriptionOperation runSubOperation:returningError:]( v2,  "runSubOperation:returningError:",  v8,  &v84);
    id v3 = v84;

    if ((v23 & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v8 dataProvider]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 output]);

      uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v25, v26) & 1) == 0) {
        goto LABEL_45;
      }
      uint64_t v27 = SSVSubscriptionBagForDictionary(v25);
      id v28 = (id)objc_claimAutoreleasedReturnValue(v27);
      if (v28)
      {
        -[SSVFairPlaySubscriptionController importSubscriptionKeyBagData:returningError:]( v80,  "importSubscriptionKeyBagData:returningError:",  v28,  0LL);
        v29 = objc_alloc_init(&OBJC_CLASS___SSVSubscriptionResponse);
        v82[0] = _NSConcreteStackBlock;
        v82[1] = 3221225472LL;
        v82[2] = sub_100094EE4;
        v82[3] = &unk_10034D0A0;
        v30 = v29;
        v83 = v30;
        -[SSVFairPlaySubscriptionController enumerateAccountSubscriptionStatusUsingBlock:]( v80,  "enumerateAccountSubscriptionStatusUsingBlock:",  v82);
        uint64_t v31 = OBJC_IVAR___ISOperation__lock;
        [*(id *)&v2->ISOperation_opaque[OBJC_IVAR___ISOperation__lock] lock];
        response = v2->_response;
        v2->_response = v30;
        v33 = v30;

        [*(id *)&v2->ISOperation_opaque[v31] unlock];
      }

      char v72 = v4;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", @"statusCode", v67));
      v77 = v34;
      if ((objc_opt_respondsToSelector(v34, "integerValue") & 1) == 0 || [v34 integerValue])
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue([v5[459] sharedDaemonConfig]);
        if (!v35) {
          v35 = (void *)objc_claimAutoreleasedReturnValue([v5[459] sharedConfig]);
        }
        LODWORD(v36) = [v35 shouldLog];
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 OSLogObject]);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v36 = v36;
        }
        else {
          v36 &= 2u;
        }
        if ((_DWORD)v36)
        {
          v38 = (void *)objc_opt_class(v2);
          int v85 = 138412546;
          v86 = v38;
          __int16 v87 = 2112;
          id v88 = v77;
          id v39 = v38;
          LODWORD(v68) = 22;
          v40 = (void *)_os_log_send_and_compose_impl( v36,  0LL,  0LL,  0LL,  &_mh_execute_header,  v37,  0LL,  "%@: Received error status=%@",  &v85,  v68);

          v41 = v81;
          if (!v40) {
            goto LABEL_48;
          }
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v40,  4LL));
          free(v40);
          v67 = v37;
          SSFileLog(v35, @"%@");
        }

        else
        {
          v41 = v81;
        }

LABEL_48:
        v49 = (void *)objc_claimAutoreleasedReturnValue([v8 response]);
        id v50 = -[SubscriptionOperation _newMachineDataOperationWithAccount:response:]( v2,  "_newMachineDataOperationWithAccount:response:",  v41,  v49);

        if (v50
          && ((unsigned __int8 v51 = -[SubscriptionOperation runSubOperation:returningError:]( v2,  "runSubOperation:returningError:",  v50,  0),  v52 = objc_claimAutoreleasedReturnValue([v50 syncState]),  v74,  (v51 & 1) != 0)
           || (v74 = 0LL, v52)))
        {

          v56 = (void *)objc_claimAutoreleasedReturnValue([v8 authenticatedAccountDSID]);
          id v28 = v56;
          if (!v56)
          {
            int v48 = 1;
            v74 = (void *)v52;
            char v4 = v72;
            goto LABEL_71;
          }

          id v28 = v56;
          int v48 = 1;
          v57 = v75;
          v74 = (void *)v52;
          v75 = v28;
          v53 = v57;
        }

        else
        {
          v53 = v77;
          if (v77)
          {
            uint64_t v54 = (uint64_t)[v77 integerValue];
            uint64_t v55 = v71;
          }

          else
          {
            uint64_t v55 = v69;
            uint64_t v54 = 100LL;
          }

          uint64_t v58 = SSError(v55, v54, 0LL, 0LL);
          uint64_t v59 = objc_claimAutoreleasedReturnValue(v58);

          int v48 = 0;
          id v3 = (id)v59;
        }

        char v4 = v72;
        goto LABEL_70;
      }

      v60 = (void *)objc_claimAutoreleasedReturnValue([v5[459] sharedDaemonConfig]);
      if (!v60) {
        v60 = (void *)objc_claimAutoreleasedReturnValue([v5[459] sharedConfig]);
      }
      LODWORD(v61) = [v60 shouldLog];
      v62 = (os_log_s *)objc_claimAutoreleasedReturnValue([v60 OSLogObject]);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO)) {
        uint64_t v61 = v61;
      }
      else {
        v61 &= 2u;
      }
      if ((_DWORD)v61)
      {
        v63 = (void *)objc_opt_class(v2);
        int v85 = 138412290;
        v86 = v63;
        id v64 = v63;
        LODWORD(v68) = 12;
        v65 = (void *)_os_log_send_and_compose_impl( v61,  0LL,  0LL,  0LL,  &_mh_execute_header,  v62,  1LL,  "%@: Received valid status=0",  &v85,  v68);

        if (!v65)
        {
LABEL_69:

          int v48 = 0;
          char v70 = 1;
          char v4 = v72;
          v53 = v77;
LABEL_70:

          goto LABEL_71;
        }

        v62 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v65,  4LL));
        free(v65);
        v67 = v62;
        SSFileLog(v60, @"%@");
      }

      goto LABEL_69;
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue([v5[459] sharedDaemonConfig]);
    if (!v25) {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v5[459] sharedConfig]);
    }
    unsigned int v42 = objc_msgSend(v25, "shouldLog", v67);
    else {
      unsigned int v43 = v42;
    }
    id v28 = (id)objc_claimAutoreleasedReturnValue([v25 OSLogObject]);
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v44 = v43;
    }
    else {
      uint64_t v44 = v43 & 2;
    }
    if ((_DWORD)v44)
    {
      v45 = (void *)objc_opt_class(v2);
      int v85 = 138412546;
      v86 = v45;
      __int16 v87 = 2112;
      id v88 = v3;
      id v46 = v45;
      LODWORD(v68) = 22;
      v47 = (void *)_os_log_send_and_compose_impl( v44,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "%@: Failed with error: %@",  &v85,  v68);

      if (!v47)
      {
LABEL_45:
        int v48 = 0;
        goto LABEL_72;
      }

      id v28 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v47,  4LL));
      free(v47);
      v67 = (os_log_s *)v28;
      SSFileLog(v25, @"%@");
    }

    int v48 = 0;
LABEL_71:

LABEL_72:
    [v8 setDelegate:0];

    char v66 = (v48 != 0) & v4;
    char v4 = 0;
  }

  while ((v66 & 1) != 0);
  -[SubscriptionOperation setError:](v2, "setError:", v3);
  -[SubscriptionOperation setSuccess:](v2, "setSuccess:", v70 & 1);
}

- (id)_newMachineDataOperationWithAccount:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[SSMachineDataRequest alloc] initWithURLResponse:v7];

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
    [v8 setAccountIdentifier:v9];

    [v8 setWaitsForPurchaseOperations:1];
    id v10 = [[ISMachineDataActionOperation alloc] initWithMachineDataRequest:v8];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SubscriptionOperation userAgent](self, "userAgent"));
    [v10 setUserAgent:v11];
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (id)_requestPropertiesWithAccount:(id)a3 syncState:(id)a4 fairPlaySubscriptionController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v47 = a5;
  id v10 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setHTTPMethod:](v10, "setHTTPMethod:", @"POST");
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v10,  "setValue:forHTTPHeaderField:",  @"application/json",  @"Content-Type");
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v10,  "setValue:forHTTPHeaderField:",  @"true",  @"x-apple-use-amd");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SubscriptionOperation userAgent](self, "userAgent"));
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v10,  "setValue:forHTTPHeaderField:",  v11,  SSHTTPHeaderUserAgent);

  unint64_t v12 = -[SubscriptionOperation operationType](self, "operationType");
  if (v12 > 2)
  {
    uint64_t v13 = 0LL;
    if (!v9) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  uint64_t v13 = dword_1002D41B0[v12];
  -[SSMutableURLRequestProperties setURLBagKey:](v10, "setURLBagKey:", off_10034D0C0[v12]);
  if (v9) {
LABEL_5:
  }
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v10,  "setValue:forHTTPHeaderField:",  v9,  SSHTTPHeaderXAppleAMDS);
LABEL_6:
  uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 guid]);

  if (v16) {
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v16, @"guid");
  }
  if (-[SubscriptionOperation isRequestingOfflineSlot](self, "isRequestingOfflineSlot")) {
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", &__kCFBooleanTrue, @"isRequestingSlot");
  }
  uint64_t v51 = 0LL;
  uint64_t v52 = 0LL;
  uint64_t v50 = 0LL;
  sub_1001A9B64(-1LL, (uint64_t)&v52, (uint64_t)&v50 + 4, (uint64_t)&v51, (uint64_t)&v50);
  if (v17)
  {
    int v18 = v17;
    id v19 = (NSData *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v19) {
      id v19 = (NSData *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v20) = -[NSData shouldLog](v19, "shouldLog");
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSData OSLogObject](v19, "OSLogObject"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      uint64_t v20 = v20;
    }
    else {
      v20 &= 2u;
    }
    if ((_DWORD)v20)
    {
      v22 = (void *)objc_opt_class(self);
      int v53 = 138412546;
      uint64_t v54 = v22;
      __int16 v55 = 2048;
      id v56 = (id)v18;
      id v23 = v22;
      v24 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  2LL,  "%@: Skipping OTP after return code: %ld",  &v53,  22);

      if (!v24) {
        goto LABEL_46;
      }
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
      free(v24);
      unsigned int v43 = v21;
      SSFileLog(v19, @"%@");
    }

    goto LABEL_45;
  }

  if (HIDWORD(v50))
  {
    v25 = objc_alloc(&OBJC_CLASS___NSData);
    uint64_t v26 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( v25,  "initWithBytesNoCopy:length:freeWhenDone:",  v52,  HIDWORD(v50),  0LL);
    id v19 = v26;
    if (v26)
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](v26, "base64EncodedStringWithOptions:", 0LL));
      -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v10,  "setValue:forHTTPHeaderField:",  v27,  SSHTTPHeaderXAppleAMDM);
    }
  }

  else
  {
    id v19 = 0LL;
  }

  if (v51)
  {
    id v28 = objc_alloc(&OBJC_CLASS___NSData);
    v29 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( v28,  "initWithBytesNoCopy:length:freeWhenDone:",  v51,  v50,  0LL);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](v29, "base64EncodedStringWithOptions:", 0LL));
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v10,  "setValue:forHTTPHeaderField:",  v30,  SSHTTPHeaderXAppleAMD);
  }

  if (v8)
  {
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
    id v32 = [v31 unsignedLongLongValue];

    id v48 = 0LL;
    id v49 = 0LL;
    [v47 generateSubscriptionBagRequestWithAccountUniqueIdentifier:v32 transactionType:v13 machineIDData:v19 returningSubscriptionBagData:&v49 error:&v48];
    v21 = (os_log_s *)v49;
    id v33 = v48;
    v34 = v33;
    if (!v33)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s base64EncodedStringWithOptions:](v21, "base64EncodedStringWithOptions:", 0LL));
      if (v35) {
        -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v35, @"sbsync");
      }
      goto LABEL_44;
    }

    id v45 = v8;
    id v46 = v33;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v35) {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v36 = [v35 shouldLog];
    else {
      LODWORD(v37) = v36;
    }
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 OSLogObject]);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v37 = v37;
    }
    else {
      v37 &= 2u;
    }
    if ((_DWORD)v37)
    {
      id v39 = (void *)objc_opt_class(self);
      int v53 = 138412546;
      uint64_t v54 = v39;
      __int16 v55 = 2112;
      id v56 = v46;
      id v44 = v39;
      v40 = (void *)_os_log_send_and_compose_impl( v37,  0LL,  0LL,  0LL,  &_mh_execute_header,  v38,  0LL,  "%@: Skipping bag data after error: %@",  &v53,  22);

      if (!v40)
      {
        id v8 = v45;
        v34 = v46;
        goto LABEL_44;
      }

      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v40,  4LL));
      free(v40);
      unsigned int v43 = v38;
      SSFileLog(v35, @"%@");
    }

    id v8 = v45;

    v34 = v46;
LABEL_44:

LABEL_45:
  }

- (void).cxx_destruct
{
}

@end