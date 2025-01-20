@interface LoadDownloadQueueOperation
+ (id)newLoadAutomaticDownloadQueueOperation;
- (BOOL)_loadDownloadsFromStart:(id)a3 toEnd:(id)a4;
- (BOOL)_runMachineDataOperationWithRequest:(id)a3 syncState:(id *)a4;
- (BOOL)_shouldSendKeyBagSync;
- (BOOL)needsAuthentication;
- (LoadDownloadQueueOperation)init;
- (LoadDownloadQueueOperation)initWithRequestProperties:(id)a3;
- (NSNumber)accountIdentifier;
- (NSOrderedSet)downloads;
- (NSString)requestIdentifier;
- (SSURLRequestProperties)requestProperties;
- (id)_account;
- (id)_newURLOperationWithStartIdentifier:(id)a3 endIdentifier:(id)a4;
- (int64_t)reason;
- (void)_handleResponse:(id)a3;
- (void)operation:(id)a3 finishedWithOutput:(id)a4;
- (void)run;
- (void)setAccountIdentifier:(id)a3;
- (void)setNeedsAuthentication:(BOOL)a3;
- (void)setReason:(int64_t)a3;
- (void)setRequestIdentifier:(id)a3;
@end

@implementation LoadDownloadQueueOperation

- (LoadDownloadQueueOperation)init
{
  return -[LoadDownloadQueueOperation initWithRequestProperties:](self, "initWithRequestProperties:", 0LL);
}

- (LoadDownloadQueueOperation)initWithRequestProperties:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___LoadDownloadQueueOperation;
  v5 = -[LoadDownloadQueueOperation init](&v10, "init");
  if (v5)
  {
    if (v4) {
      v6 = (SSURLRequestProperties *)[v4 copy];
    }
    else {
      v6 = objc_alloc_init(&OBJC_CLASS___SSURLRequestProperties);
    }
    v7 = v6;
    objc_storeStrong((id *)&v5->_requestProperties, v6);

    -[LoadDownloadQueueOperation setPowerAssertionIdentifier:]( v5,  "setPowerAssertionIdentifier:",  @"com.apple.itunesstored.download-queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSURLRequestProperties URLBagKey](v5->_requestProperties, "URLBagKey"));
    -[LoadDownloadQueueOperation setRequestIdentifier:](v5, "setRequestIdentifier:", v8);
  }

  return v5;
}

+ (id)newLoadAutomaticDownloadQueueOperation
{
  v3 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setHTTPMethod:](v3, "setHTTPMethod:", @"POST");
  -[SSMutableURLRequestProperties setURLBagURLBlock:](v3, "setURLBagURLBlock:", &stru_10034B0C0);
  id v4 = [objc_alloc((Class)objc_opt_class(a1)) initWithRequestProperties:v3];
  [v4 setNeedsAuthentication:0];
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"automatic-downloads2",  @"downloads-url"));
  [v4 setRequestIdentifier:v5];

  return v4;
}

- (NSNumber)accountIdentifier
{
  v3 = self->_accountIdentifier;
  -[LoadDownloadQueueOperation unlock](self, "unlock");
  return v3;
}

- (NSOrderedSet)downloads
{
  v3 = self->_downloads;
  -[LoadDownloadQueueOperation unlock](self, "unlock");
  return (NSOrderedSet *)v3;
}

- (BOOL)needsAuthentication
{
  BOOL needsAuthentication = self->_needsAuthentication;
  -[LoadDownloadQueueOperation unlock](self, "unlock");
  return needsAuthentication;
}

- (int64_t)reason
{
  int64_t reason = self->_reason;
  -[LoadDownloadQueueOperation unlock](self, "unlock");
  return reason;
}

- (NSString)requestIdentifier
{
  v3 = self->_requestIdentifier;
  -[LoadDownloadQueueOperation unlock](self, "unlock");
  return v3;
}

- (SSURLRequestProperties)requestProperties
{
  return self->_requestProperties;
}

- (void)setAccountIdentifier:(id)a3
{
  v5 = (NSNumber *)a3;
  -[LoadDownloadQueueOperation lock](self, "lock");
  if (self->_accountIdentifier != v5) {
    objc_storeStrong((id *)&self->_accountIdentifier, a3);
  }
  -[LoadDownloadQueueOperation unlock](self, "unlock");
}

- (void)setNeedsAuthentication:(BOOL)a3
{
  self->_BOOL needsAuthentication = a3;
  -[LoadDownloadQueueOperation unlock](self, "unlock");
}

- (void)setReason:(int64_t)a3
{
  self->_int64_t reason = a3;
  -[LoadDownloadQueueOperation unlock](self, "unlock");
}

- (void)setRequestIdentifier:(id)a3
{
  v6 = (NSString *)a3;
  -[LoadDownloadQueueOperation lock](self, "lock");
  if (self->_requestIdentifier != v6)
  {
    id v4 = (NSString *)-[NSString copy](v6, "copy");
    requestIdentifier = self->_requestIdentifier;
    self->_requestIdentifier = v4;
  }

  -[LoadDownloadQueueOperation unlock](self, "unlock");
}

- (void)run
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL));
  id v35 = 0LL;
  unsigned __int8 v4 = -[LoadDownloadQueueOperation loadURLBagWithContext:returningError:]( self,  "loadURLBagWithContext:returningError:",  v3,  &v35);
  v5 = (NSNumber *)v35;
  v6 = v5;
  if ((v4 & 1) == 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v24) {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v25 = [v24 shouldLog];
    else {
      unsigned int v26 = v25;
    }
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 OSLogObject]);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v28 = v26;
    }
    else {
      uint64_t v28 = v26 & 2;
    }
    if ((_DWORD)v28)
    {
      v29 = (void *)objc_opt_class(self);
      int v36 = 138412546;
      v37 = v29;
      __int16 v38 = 2112;
      v39 = v6;
      id v30 = v29;
      v31 = (void *)_os_log_send_and_compose_impl( v28,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "%@: Could not load URL bag: %@",  &v36,  22);

      if (!v31)
      {
LABEL_33:

        -[LoadDownloadQueueOperation setError:](self, "setError:", v6);
        goto LABEL_34;
      }

      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v31,  4LL));
      free(v31);
      SSFileLog(v24, @"%@");
    }

    goto LABEL_33;
  }

  v34 = v5;
  v7 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", 0LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", 0LL));
  objc_super v10 = -[NSMutableArray initWithObjects:](v7, "initWithObjects:", v8, v9, 0LL);
  rangesToLoad = self->_rangesToLoad;
  self->_rangesToLoad = v10;

  if ((unint64_t)-[NSMutableArray count](self->_rangesToLoad, "count") >= 2)
  {
    while (1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_rangesToLoad, "objectAtIndex:", 0LL));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_rangesToLoad, "objectAtIndex:", 1LL));
      if (!-[LoadDownloadQueueOperation _loadDownloadsFromStart:toEnd:]( self,  "_loadDownloadsFromStart:toEnd:",  v12,  v13))
      {
        -[NSMutableArray removeAllObjects](self->_rangesToLoad, "removeAllObjects");
        goto LABEL_19;
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v14) {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v15 = [v14 shouldLog];
      else {
        unsigned int v16 = v15;
      }
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
        uint64_t v18 = v16;
      }
      else {
        uint64_t v18 = v16 & 2;
      }
      if (!(_DWORD)v18) {
        goto LABEL_16;
      }
      v19 = (void *)objc_opt_class(self);
      accountIdentifier = self->_accountIdentifier;
      int v36 = 138413058;
      v37 = v19;
      __int16 v38 = 2112;
      v39 = accountIdentifier;
      __int16 v40 = 2112;
      v41 = v12;
      __int16 v42 = 2112;
      v43 = v13;
      id v21 = v19;
      LODWORD(v33) = 42;
      v22 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  1LL,  "%@: Finished loading download queue (%@, %@, %@)",  &v36,  v33);

      if (v22) {
        break;
      }
LABEL_17:

      -[NSMutableArray removeObjectsInRange:](self->_rangesToLoad, "removeObjectsInRange:", 0LL, 2LL);
      -[LoadDownloadQueueOperation setSuccess:]( self,  "setSuccess:",  -[NSMutableArray count](self->_rangesToLoad, "count") == 0LL,  v32);
LABEL_19:
    }

    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v22,  4LL));
    free(v22);
    v32 = v17;
    SSFileLog(v14, @"%@");
LABEL_16:

    goto LABEL_17;
  }

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc(&OBJC_CLASS___StoreDownloadQueueResponse);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 authenticatedAccountDSID]);

  objc_super v10 = -[StoreDownloadQueueResponse initWithDictionary:userIdentifier:]( v8,  "initWithDictionary:userIdentifier:",  v6,  v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownloadQueueResponse keybag](v10, "keybag"));
  if ([v11 length])
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v12) {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v13 = [v12 shouldLog];
    else {
      LODWORD(v14) = v13;
    }
    unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      uint64_t v14 = v14;
    }
    else {
      v14 &= 2u;
    }
    if ((_DWORD)v14)
    {
      unsigned int v16 = (void *)objc_opt_class(self);
      id v17 = v16;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[LoadDownloadQueueOperation requestIdentifier](self, "requestIdentifier"));
      int v20 = 138412546;
      id v21 = v16;
      __int16 v22 = 2112;
      v23 = v18;
      v19 = (void *)_os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  1LL,  "%@: Importing keybag from response: %@",  &v20,  22);

      if (!v19)
      {
LABEL_14:

        sub_100023280(v11);
        goto LABEL_15;
      }

      unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
      free(v19);
      SSFileLog(v12, @"%@");
    }

    goto LABEL_14;
  }

- (id)_account
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LoadDownloadQueueOperation accountIdentifier](self, "accountIdentifier"));
  if (!v2
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore")),
        unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accountWithUniqueIdentifier:v2]),
        v3,
        !v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v5 activeAccount]);
  }

  return v4;
}

- (void)_handleResponse:(id)a3
{
  id v9 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v9 rangesToLoad]);
  if ([v4 count]) {
    -[NSMutableArray addObjectsFromArray:](self->_rangesToLoad, "addObjectsFromArray:", v4);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue([v9 downloads]);

  if (v5)
  {
    -[LoadDownloadQueueOperation lock](self, "lock");
    downloads = self->_downloads;
    if (!downloads)
    {
      id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
      v8 = self->_downloads;
      self->_downloads = v7;

      downloads = self->_downloads;
    }

    -[NSMutableOrderedSet unionOrderedSet:](downloads, "unionOrderedSet:", v5);
    -[LoadDownloadQueueOperation unlock](self, "unlock");
  }
}

- (BOOL)_loadDownloadsFromStart:(id)a3 toEnd:(id)a4
{
  id v6 = a3;
  id v52 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v7) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v8 = [v7 shouldLog];
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v8 & 2;
  }
  if ((_DWORD)v10)
  {
    v11 = (void *)objc_opt_class(self);
    id v12 = v11;
    unsigned int v13 = (__CFString *)objc_claimAutoreleasedReturnValue(-[LoadDownloadQueueOperation requestIdentifier](self, "requestIdentifier"));
    int v55 = 138413314;
    v56 = v11;
    __int16 v57 = 2112;
    v58 = v13;
    __int16 v59 = 2112;
    id v60 = v6;
    __int16 v61 = 2112;
    id v62 = v52;
    __int16 v63 = 2048;
    int64_t v64 = -[LoadDownloadQueueOperation reason](self, "reason");
    uint64_t v14 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  1LL,  "%@: Loading download queue (%@, %@, %@) with reason: %ld",  &v55,  52);

    if (v14)
    {
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
      free(v14);
      v46 = v15;
      SSFileLog(v7, @"%@");
    }
  }

  else
  {
  }

  unsigned int v16 = 0LL;
  id v17 = 0LL;
  char v18 = 1;
  id v49 = v6;
  do
  {
    v19 = v17;
    id v20 = -[LoadDownloadQueueOperation _newURLOperationWithStartIdentifier:endIdentifier:]( self,  "_newURLOperationWithStartIdentifier:endIdentifier:",  v6,  v52,  v46);
    id v54 = v17;
    unsigned int v21 = -[LoadDownloadQueueOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v20,  &v54);
    id v17 = v54;

    if (!v21)
    {
      unsigned __int8 v40 = 0;
      goto LABEL_37;
    }

    v50 = v16;
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v20 dataProvider]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 output]);

    uint64_t v24 = objc_claimAutoreleasedReturnValue(-[LoadDownloadQueueOperation requestIdentifier](self, "requestIdentifier"));
    unsigned int v25 = (void *)v24;
    unsigned int v26 = @"unknown";
    if (v24) {
      unsigned int v26 = (__CFString *)v24;
    }
    v51 = v26;

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedWriteToDiskConfig](&OBJC_CLASS___SSLogConfig, "sharedWriteToDiskConfig"));
    if (!v27) {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v28 = [v27 shouldLog];
    else {
      LODWORD(v29) = v28;
    }
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v29 = v29;
    }
    else {
      v29 &= 2u;
    }
    if (!(_DWORD)v29) {
      goto LABEL_27;
    }
    v31 = (void *)objc_opt_class(self);
    int v55 = 138413314;
    v56 = v31;
    __int16 v57 = 2112;
    v58 = v51;
    __int16 v59 = 2112;
    id v60 = v6;
    __int16 v61 = 2112;
    id v62 = v52;
    __int16 v63 = 2112;
    int64_t v64 = (int64_t)v23;
    id v32 = v31;
    LODWORD(v48) = 52;
    uint64_t v33 = (void *)_os_log_send_and_compose_impl( v29,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  0LL,  "%@: Download queue response (key: %@ startID: %@ endID: %@) %@.",  &v55,  v48);

    if (v33)
    {
      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v33,  4LL));
      free(v33);
      v47 = v30;
      SSFileLog(v27, @"%@");
LABEL_27:
    }

    v34 = objc_alloc(&OBJC_CLASS___StoreDownloadQueueResponse);
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v20 authenticatedAccountDSID]);
    unsigned int v16 = -[StoreDownloadQueueResponse initWithDictionary:userIdentifier:]( v34,  "initWithDictionary:userIdentifier:",  v23,  v35);

    int v36 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownloadQueueResponse error](v16, "error"));
    if (v36)
    {
      id v37 = objc_alloc(&OBJC_CLASS___SSMachineDataRequest);
      __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([v20 response]);
      id v39 = [v37 initWithURLResponse:v38];

      if (v39)
      {
        id v53 = 0LL;
        unsigned __int8 v40 = -[LoadDownloadQueueOperation _runMachineDataOperationWithRequest:syncState:]( self,  "_runMachineDataOperationWithRequest:syncState:",  v39,  &v53);
        id v41 = v53;
        -[LoadDownloadQueueOperation lock](self, "lock");
        __int16 v42 = (NSString *)[v41 copy];
        mdSyncState = self->_mdSyncState;
        self->_mdSyncState = v42;

        -[LoadDownloadQueueOperation unlock](self, "unlock");
        if (v41) {
          unsigned __int8 v40 = 1;
        }
      }

      else
      {
        unsigned __int8 v40 = 0;
      }

      id v6 = v49;
    }

    else
    {
      unsigned __int8 v40 = 0;
      id v6 = v49;
    }

LABEL_37:
    objc_msgSend(v20, "setDelegate:", 0, v47);

    char v44 = v40 & v18;
    char v18 = 0;
  }

  while ((v44 & 1) != 0);
  if ((v21 & 1) != 0) {
    -[LoadDownloadQueueOperation _handleResponse:](self, "_handleResponse:", v16);
  }
  else {
    -[LoadDownloadQueueOperation setError:](self, "setError:", v17);
  }

  return v21;
}

- (BOOL)_runMachineDataOperationWithRequest:(id)a3 syncState:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[LoadDownloadQueueOperation _account](self, "_account"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
  [v6 setAccountIdentifier:v8];

  [v6 setWaitsForPurchaseOperations:1];
  id v9 = [[ISMachineDataActionOperation alloc] initWithMachineDataRequest:v6];

  unsigned __int8 v10 = -[LoadDownloadQueueOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v9,  0LL);
  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue([v9 syncState]);
  }

  return v10;
}

- (id)_newURLOperationWithStartIdentifier:(id)a3 endIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  [v8 setDelegate:self];
  [v8 setMachineDataStyle:0];
  objc_msgSend( v8,  "setNeedsAuthentication:",  -[LoadDownloadQueueOperation needsAuthentication](self, "needsAuthentication"));
  [v8 setUseUserSpecificURLBag:1];
  id v9 = objc_alloc_init(&OBJC_CLASS___DaemonProtocolDataProvider);
  [v8 setDataProvider:v9];
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[LoadDownloadQueueOperation _account](self, "_account"));
  v11 = -[SSAuthenticationContext initWithAccount:]( objc_alloc(&OBJC_CLASS___SSAuthenticationContext),  "initWithAccount:",  v10);
  [v8 setAuthenticationContext:v11];
  id v12 = -[SSURLRequestProperties mutableCopy](self->_requestProperties, "mutableCopy");
  [v12 setAllowedRetryCount:0];
  [v12 setCachePolicy:1];
  objc_msgSend(v12, "setURLBagType:", SSURLBagTypeForAccountScope(objc_msgSend(v10, "accountScope")));
  v50 = v12;
  if ((id)-[LoadDownloadQueueOperation reason](self, "reason") != (id)1)
  {
    [v12 setHTTPMethod:@"POST"];
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
    id v14 = v6;
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v13 guid]);
    [v50 setValue:v15 forRequestParameter:@"guid"];

    id v6 = v14;
    id v12 = v50;
  }

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 thinnedApplicationVariantIdentifier]);

  if (v17) {
    [v12 setValue:v17 forHTTPHeaderField:SSHTTPHeaderXAppleTADevice];
  }
  -[LoadDownloadQueueOperation lock](self, "lock");
  mdSyncState = self->_mdSyncState;
  if (mdSyncState) {
    [v12 setValue:mdSyncState forHTTPHeaderField:SSHTTPHeaderXAppleMDS];
  }
  -[LoadDownloadQueueOperation unlock](self, "unlock");
  v19 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifier]);

  if (v19)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifier]);
    MachineDataAddHeadersToRequestProperties(v12, v20);
  }

  unsigned int v21 = v6;
  __int16 v22 = (char *)[v6 itemIdentifierValue];
  v23 = (char *)[v7 itemIdentifierValue];

  if (v22 - 1 < v23)
  {
    id v24 = v8;
    unsigned int v25 = v17;
    unsigned int v26 = v10;
    v27 = v11;
    unsigned int v28 = v9;
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", v22));
    [v50 setValue:v29 forRequestParameter:kISLoadMoreStartIDParameter];

    id v9 = v28;
    v11 = v27;
    unsigned __int8 v10 = v26;
    id v17 = v25;
    id v8 = v24;
    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", v23));
    [v50 setValue:v30 forRequestParameter:kISLoadMoreEndIDParameter];
  }

  if (-[LoadDownloadQueueOperation _shouldSendKeyBagSync](self, "_shouldSendKeyBagSync"))
  {
    uint64_t v48 = v17;
    id v49 = v21;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[LoadDownloadQueueOperation _account](self, "_account"));
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 uniqueIdentifier]);
    CFDataRef v33 = sub_100022204((uint64_t)[v32 unsignedLongLongValue], 1);

    if (!-[__CFData length](v33, "length"))
    {
LABEL_27:

      id v17 = v48;
      unsigned int v21 = v49;
      goto LABEL_28;
    }

    v34 = v33;
    id v35 = (void *)ISCopyEncodedBase64(-[__CFData bytes](v34, "bytes"), -[__CFData length](v34, "length"));
    if (!v35)
    {
LABEL_26:

      goto LABEL_27;
    }

    v47 = v9;
    int v36 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v36) {
      int v36 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v37) = [v36 shouldLog];
    __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([v36 OSLogObject]);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO)) {
      uint64_t v37 = v37;
    }
    else {
      v37 &= 2u;
    }
    if ((_DWORD)v37)
    {
      v46 = v35;
      id v39 = v31;
      unsigned __int8 v40 = (void *)objc_opt_class(self);
      id v45 = v40;
      id v41 = (void *)objc_claimAutoreleasedReturnValue(-[LoadDownloadQueueOperation requestIdentifier](self, "requestIdentifier"));
      int v51 = 138412546;
      id v52 = v40;
      v31 = v39;
      id v35 = v46;
      __int16 v53 = 2112;
      id v54 = v41;
      __int16 v42 = (void *)_os_log_send_and_compose_impl( v37,  0LL,  0LL,  0LL,  &_mh_execute_header,  v38,  1LL,  "%@: Adding kbsync data to request: %@",  &v51,  22);

      if (!v42)
      {
LABEL_25:

        [v50 setValue:v35 forRequestParameter:@"kbsync"];
        id v9 = v47;
        goto LABEL_26;
      }

      __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v42,  4LL));
      free(v42);
      char v44 = v38;
      SSFileLog(v36, @"%@");
    }

    goto LABEL_25;
  }

- (BOOL)_shouldSendKeyBagSync
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LoadDownloadQueueOperation accountIdentifier](self, "accountIdentifier"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL));
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[ISURLBagCache sharedCache](&OBJC_CLASS___ISURLBagCache, "sharedCache"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLBagForContext:v3]);

    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 valueForKey:kISURLBagAuthCanPostKey]);
    id v7 = (void *)v6;
    if (v6)
    {
      if ((objc_opt_respondsToSelector(v6, "BOOLValue") & 1) != 0) {
        unsigned __int8 v8 = [v7 BOOLValue];
      }
      else {
        unsigned __int8 v8 = 0;
      }
    }

    else
    {
      unsigned __int8 v8 = 1;
    }
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end