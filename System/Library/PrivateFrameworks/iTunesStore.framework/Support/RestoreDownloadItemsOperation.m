@interface RestoreDownloadItemsOperation
- (BOOL)_runWithOptions:(id)a3 error:(id *)a4;
- (BOOL)shouldShowTermsAndConditionsDialog;
- (NSArray)downloadItems;
- (NSArray)responses;
- (RestoreDownloadItemsOperation)initWithDownloadItems:(id)a3 account:(id)a4;
- (SSAccount)account;
- (id)_newResponseWithItems:(id)a3 error:(id)a4;
- (id)_plistDataWithItems:(id)a3 options:(id)a4 error:(id *)a5;
- (id)_runWithBodyData:(id)a3 contentEncoding:(id)a4 options:(id)a5 error:(id *)a6;
- (id)_runWithItems:(id)a3 options:(id)a4;
- (void)_addResponse:(id)a3;
- (void)_run;
- (void)_showDialogsForResponse:(id)a3;
- (void)run;
- (void)setShouldShowTermsAndConditionsDialog:(BOOL)a3;
@end

@implementation RestoreDownloadItemsOperation

- (RestoreDownloadItemsOperation)initWithDownloadItems:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___RestoreDownloadItemsOperation;
  v8 = -[RestoreDownloadItemsOperation init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_account, a4);
    v10 = (NSArray *)[v6 copy];
    downloadItems = v9->_downloadItems;
    v9->_downloadItems = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    responses = v9->_responses;
    v9->_responses = v12;
  }

  return v9;
}

- (SSAccount)account
{
  return self->_account;
}

- (NSArray)downloadItems
{
  return self->_downloadItems;
}

- (NSArray)responses
{
  id v3 = -[NSMutableArray copy](self->_responses, "copy");
  -[RestoreDownloadItemsOperation unlock](self, "unlock");
  return (NSArray *)v3;
}

- (void)setShouldShowTermsAndConditionsDialog:(BOOL)a3
{
  self->_shouldShowTermsAndConditionsDialog = a3;
  -[RestoreDownloadItemsOperation unlock](self, "unlock");
}

- (BOOL)shouldShowTermsAndConditionsDialog
{
  BOOL shouldShowTermsAndConditionsDialog = self->_shouldShowTermsAndConditionsDialog;
  -[RestoreDownloadItemsOperation unlock](self, "unlock");
  return shouldShowTermsAndConditionsDialog;
}

- (void)run
{
}

- (void)_addResponse:(id)a3
{
  id v8 = a3;
  -[RestoreDownloadItemsOperation lock](self, "lock");
  v4 = (id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__delegate];
  id WeakRetained = objc_loadWeakRetained(v4);
  char v6 = objc_opt_respondsToSelector(WeakRetained, "restoreDownloadItemsOperation:didReceiveResponse:");

  if ((v6 & 1) != 0) {
    id v7 = objc_loadWeakRetained(v4);
  }
  else {
    id v7 = 0LL;
  }
  -[NSMutableArray addObject:](self->_responses, "addObject:", v8);
  -[RestoreDownloadItemsOperation unlock](self, "unlock");
  if (v7) {
    [v7 restoreDownloadItemsOperation:self didReceiveResponse:v8];
  }
}

- (id)_newResponseWithItems:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___RestoreDownloadItemsResponse);
  v9 = objc_alloc(&OBJC_CLASS___StoreDownloadQueueResponse);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSAccount uniqueIdentifier](self->_account, "uniqueIdentifier"));
  v11 = -[StoreDownloadQueueResponse initWithError:userIdentifier:](v9, "initWithError:userIdentifier:", v6, v10);

  -[RestoreDownloadItemsResponse setRequestItems:](v8, "setRequestItems:", v7);
  -[RestoreDownloadItemsResponse setServerResponse:](v8, "setServerResponse:", v11);

  return v8;
}

- (id)_plistDataWithItems:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceName]);
  if (v10) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v10, @"device-name");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 guid]);

  if (v11) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v11, @"guid");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 serialNumber]);

  if (v12) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v12, @"serial-number");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSAccount uniqueIdentifier](self->_account, "uniqueIdentifier"));
  CFDataRef v14 = sub_100022204((uint64_t)[v13 unsignedLongLongValue], 1);

  if (-[__CFData length](v14, "length")) {
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v14, @"kbsync");
  }
  if (v7)
  {
    v24 = a5;
    objc_super v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v25 = v7;
    id v16 = v7;
    id v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        v20 = 0LL;
        do
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * (void)v20), "copyRestoreDictionary", v24);
          if (v21) {
            -[NSMutableArray addObject:](v15, "addObject:", v21);
          }

          v20 = (char *)v20 + 1;
        }

        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v18);
    }

    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v15, @"items");
    a5 = v24;
    id v7 = v25;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v8,  100LL,  0LL,  a5,  v24));

  return v22;
}

- (void)_run
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    unsigned int v5 = v4;
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v5 & 2;
  }
  if ((_DWORD)v7)
  {
    id v8 = (void *)objc_opt_class(self);
    downloadItems = self->_downloadItems;
    id v10 = v8;
    v11 = (SSAccount *)objc_claimAutoreleasedReturnValue(-[NSArray componentsJoinedByString:](downloadItems, "componentsJoinedByString:", @", "));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSAccount uniqueIdentifier](self->_account, "uniqueIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSAccount storeFrontIdentifier](self->_account, "storeFrontIdentifier"));
    int v52 = 138413058;
    v53 = v8;
    __int16 v54 = 2114;
    v55 = v11;
    __int16 v56 = 2112;
    v57 = v12;
    __int16 v58 = 2112;
    v59 = v13;
    CFDataRef v14 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "%@: Restoring items: [%{public}@]for account: (%@ / %@)",  &v52,  42);

    if (!v14) {
      goto LABEL_13;
    }
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
    free(v14);
    SSFileLog(v3, @"%@");
  }

LABEL_13:
  uint64_t v15 = objc_opt_class(self);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray componentsJoinedByString:](self->_downloadItems, "componentsJoinedByString:", @", "));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[SSAccount uniqueIdentifier](self->_account, "uniqueIdentifier"));
  SSDebugLog(1LL, @"[%@]: Restoring items: [%@] for account: %@");

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SSAccount accountName](self->_account, "accountName", v15, v16, v49));
  id v18 = [v17 length];

  if (v18)
  {
    uint64_t v19 = +[SSURLBagContext contextWithBagType:]( &OBJC_CLASS___SSURLBagContext,  "contextWithBagType:",  SSURLBagTypeForAccountScope(-[SSAccount accountScope](self->_account, "accountScope")));
    id v20 = (id)objc_claimAutoreleasedReturnValue(v19);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SSAccount uniqueIdentifier](self->_account, "uniqueIdentifier"));
    [v20 setUserIdentifier:v21];

    id v51 = 0LL;
    unsigned __int8 v22 = -[RestoreDownloadItemsOperation loadURLBagWithContext:returningError:]( self,  "loadURLBagWithContext:returningError:",  v20,  &v51);
    id v23 = v51;
    if ((v22 & 1) == 0)
    {
      id v25 = -[RestoreDownloadItemsOperation _newResponseWithItems:error:]( self,  "_newResponseWithItems:error:",  self->_downloadItems,  v23);
      -[RestoreDownloadItemsOperation _addResponse:](self, "_addResponse:", v25);
      BOOL v29 = 0LL;
LABEL_46:

      goto LABEL_47;
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[ISURLBagCache sharedCache](&OBJC_CLASS___ISURLBagCache, "sharedCache"));
    id v25 = (id)objc_claimAutoreleasedReturnValue([v24 URLBagForContext:v20]);

    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 valueForKey:@"p2-content-restore"]);
    uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
    {
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:@"url"]);

      if (v28)
      {
        id v50 = v23;
        BOOL v29 = -[RestoreDownloadItemsOperation _runWithOptions:error:](self, "_runWithOptions:error:", v26, &v50);
        id v30 = v50;
LABEL_45:

        id v23 = v30;
        goto LABEL_46;
      }
    }

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v40) {
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v41 = [v40 shouldLog];
    else {
      LODWORD(v42) = v41;
    }
    v43 = (os_log_s *)objc_claimAutoreleasedReturnValue([v40 OSLogObject]);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      uint64_t v42 = v42;
    }
    else {
      v42 &= 2u;
    }
    if ((_DWORD)v42)
    {
      v44 = (void *)objc_opt_class(self);
      int v52 = 138412290;
      v53 = v44;
      id v45 = v44;
      LODWORD(v48) = 12;
      v46 = (void *)_os_log_send_and_compose_impl( v42,  0LL,  0LL,  0LL,  &_mh_execute_header,  v43,  16LL,  "%@: Cannot restore: no URL",  &v52,  v48);

      if (!v46)
      {
LABEL_44:

        uint64_t v47 = SSError(SSErrorDomain, 3LL, 0LL, 0LL);
        id v30 = (id)objc_claimAutoreleasedReturnValue(v47);

        id v23 = -[RestoreDownloadItemsOperation _newResponseWithItems:error:]( self,  "_newResponseWithItems:error:",  self->_downloadItems,  v30);
        -[RestoreDownloadItemsOperation _addResponse:](self, "_addResponse:", v23);
        BOOL v29 = 1LL;
        goto LABEL_45;
      }

      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v46,  4LL));
      free(v46);
      SSFileLog(v40, @"%@");
    }

    goto LABEL_44;
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v31) {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v32 = [v31 shouldLog];
  else {
    LODWORD(v33) = v32;
  }
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 OSLogObject]);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v33 = v33;
  }
  else {
    v33 &= 2u;
  }
  if (!(_DWORD)v33) {
    goto LABEL_29;
  }
  v35 = (void *)objc_opt_class(self);
  account = self->_account;
  int v52 = 138412546;
  v53 = v35;
  __int16 v54 = 2112;
  v55 = account;
  id v37 = v35;
  LODWORD(v48) = 22;
  v38 = (void *)_os_log_send_and_compose_impl( v33,  0LL,  0LL,  0LL,  &_mh_execute_header,  v34,  0LL,  "%@: Can't restore using account: %@ with no account name",  &v52,  v48);

  if (v38)
  {
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v38,  4LL));
    free(v38);
    SSFileLog(v31, @"%@");
LABEL_29:
  }

  uint64_t v39 = SSError(SSErrorDomain, 114LL, 0LL, 0LL);
  id v23 = (id)objc_claimAutoreleasedReturnValue(v39);
  id v20 = -[RestoreDownloadItemsOperation _newResponseWithItems:error:]( self,  "_newResponseWithItems:error:",  self->_downloadItems,  v23);
  -[RestoreDownloadItemsOperation _addResponse:](self, "_addResponse:", v20);
  BOOL v29 = 0LL;
LABEL_47:

  -[RestoreDownloadItemsOperation setError:](self, "setError:", v23);
  -[RestoreDownloadItemsOperation setSuccess:](self, "setSuccess:", v29);
}

- (id)_runWithBodyData:(id)a3 contentEncoding:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue([a5 objectForKey:@"url"]);
  if (!v12 || (v13 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v12)) == 0LL)
  {
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v33) {
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v34 = [v33 shouldLog];
    else {
      LODWORD(v35) = v34;
    }
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 OSLogObject]);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v35 = v35;
    }
    else {
      v35 &= 2u;
    }
    if ((_DWORD)v35)
    {
      int v53 = 138412546;
      id v54 = (id)objc_opt_class(self);
      __int16 v55 = 2112;
      __int16 v56 = v12;
      id v37 = v54;
      v38 = (void *)_os_log_send_and_compose_impl( v35,  0LL,  0LL,  0LL,  &_mh_execute_header,  v36,  0LL,  "%@: Invalid URL: %@",  &v53,  22);

      if (!v38) {
        goto LABEL_29;
      }
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v38,  4LL));
      free(v38);
      SSFileLog(v33, @"%@");
    }

LABEL_29:
    uint64_t v39 = SSError(SSErrorDomain, 3LL, 0LL, 0LL);
    id v24 = (id)objc_claimAutoreleasedReturnValue(v39);
    CFDataRef v14 = 0LL;
    __int128 v28 = 0LL;
    if (!a6) {
      goto LABEL_31;
    }
LABEL_30:
    *a6 = v24;
    goto LABEL_31;
  }

  CFDataRef v14 = v13;
  v44 = self;
  id v50 = a6;
  id v15 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  [v15 setShouldSendXTokenHeader:1];
  [v15 setUseUserSpecificURLBag:1];
  id v16 = objc_alloc_init(&OBJC_CLASS___DaemonProtocolDataProvider);
  -[DaemonProtocolDataProvider setShouldProcessDialogs:](v16, "setShouldProcessDialogs:", 0LL);
  uint64_t v48 = v16;
  [v15 setDataProvider:v16];
  id v17 = -[SSMutableURLRequestProperties initWithURL:]( objc_alloc(&OBJC_CLASS___SSMutableURLRequestProperties),  "initWithURL:",  v14);
  id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
  uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 serialNumber]);

  if (v20) {
    -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v20, @"serial-number");
  }
  -[SSMutableURLRequestProperties setRequestParameters:](v17, "setRequestParameters:", v18);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice"));
  uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 thinnedApplicationVariantIdentifier]);

  if (v22) {
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v17,  "setValue:forHTTPHeaderField:",  v22,  SSHTTPHeaderXAppleTADevice);
  }
  id v45 = (void *)v22;
  v46 = (void *)v20;
  uint64_t v47 = v18;
  -[SSMutableURLRequestProperties setCachePolicy:](v17, "setCachePolicy:", 1LL);
  id v51 = v10;
  -[SSMutableURLRequestProperties setHTTPBody:](v17, "setHTTPBody:", v10);
  -[SSMutableURLRequestProperties setHTTPMethod:](v17, "setHTTPMethod:", @"POST");
  if (v11) {
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v17,  "setValue:forHTTPHeaderField:",  v11,  @"Content-Encoding");
  }
  id v49 = v11;
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v17,  "setValue:forHTTPHeaderField:",  @"application/x-apple-plist",  @"Content-Type");
  [v15 setRequestProperties:v17];
  id v23 = -[SSMutableAuthenticationContext initWithAccount:]( objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext),  "initWithAccount:",  v44->_account);
  -[SSMutableAuthenticationContext setAccountNameEditable:](v23, "setAccountNameEditable:", 1LL);
  -[SSMutableAuthenticationContext setCanCreateNewAccount:](v23, "setCanCreateNewAccount:", 0LL);
  -[SSMutableAuthenticationContext setPromptStyle:](v23, "setPromptStyle:", 1001LL);
  [v15 setAuthenticationContext:v23];
  id v52 = 0LL;
  unsigned __int8 v43 = -[RestoreDownloadItemsOperation runSubOperation:returningError:]( v44,  "runSubOperation:returningError:",  v15,  &v52);
  id v24 = v52;
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v15 dataProvider]);
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 output]);

  uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  __int128 v28 = 0LL;
  if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
  {
    BOOL v29 = objc_alloc(&OBJC_CLASS___StoreDownloadQueueResponse);
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[SSAccount uniqueIdentifier](v44->_account, "uniqueIdentifier"));
    __int128 v28 = -[StoreDownloadQueueResponse initWithDictionary:userIdentifier:]( v29,  "initWithDictionary:userIdentifier:",  v26,  v30);

    -[RestoreDownloadItemsOperation _showDialogsForResponse:](v44, "_showDialogsForResponse:", v26);
    if (v28) {
      char v31 = v43;
    }
    else {
      char v31 = 1;
    }
    if ((v31 & 1) == 0)
    {
      unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownloadQueueResponse error](v28, "error"));

      if (!v32)
      {
        if (v24)
        {
          -[StoreDownloadQueueResponse setError:](v28, "setError:", v24);
          -[StoreDownloadQueueResponse setShouldCancelPurchaseBatch:]( v28,  "setShouldCancelPurchaseBatch:",  ISErrorIsEqual(v24, SSErrorDomain, 16LL));
        }

        else
        {
          uint64_t v41 = SSError(SSErrorDomain, 100LL, 0LL, 0LL);
          uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
          -[StoreDownloadQueueResponse setError:](v28, "setError:", v42);
        }
      }
    }
  }

  a6 = v50;
  id v10 = v51;
  id v11 = v49;
  if (v50) {
    goto LABEL_30;
  }
LABEL_31:

  return v28;
}

- (id)_runWithItems:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v59 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[RestoreDownloadItemsOperation _plistDataWithItems:options:error:]( self,  "_plistDataWithItems:options:error:",  v6,  v7,  &v59));
  id v9 = v59;
  if (!v8)
  {
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v28) {
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v29 = [v28 shouldLog];
    else {
      unsigned int v30 = v29;
    }
    char v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 OSLogObject]);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      uint64_t v32 = v30;
    }
    else {
      uint64_t v32 = v30 & 2;
    }
    if ((_DWORD)v32)
    {
      uint64_t v33 = (void *)objc_opt_class(self);
      int v60 = 138412802;
      v61 = v33;
      __int16 v62 = 2114;
      id v63 = v6;
      __int16 v64 = 2114;
      id v65 = v9;
      id v34 = v33;
      uint64_t v35 = (void *)_os_log_send_and_compose_impl( v32,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  16LL,  "%@: No body data for items: [%{public}@] error: %{public}@",  &v60,  32);

      if (!v35)
      {
LABEL_36:

        id v12 = 0LL;
        goto LABEL_38;
      }

      char v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v35,  4LL));
      free(v35);
      SSFileLog(v28, @"%@");
    }

    goto LABEL_36;
  }

  id v10 = @"gzip";
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"gzip"]);
  if ((objc_opt_respondsToSelector(v11, "BOOLValue") & 1) == 0
    || ![v11 BOOLValue]
    || ((id v12 = (id)ISCopyGzippedDataForData(v8)) != 0LL ? (v13 = @"gzip") : (v13 = 0LL),
        CFDataRef v14 = v13,
        !v12))
  {
    id v12 = v8;
    id v10 = 0LL;
  }

  id v58 = v9;
  id v15 = (StoreDownloadQueueResponse *)objc_claimAutoreleasedReturnValue( -[RestoreDownloadItemsOperation _runWithBodyData:contentEncoding:options:error:]( self,  "_runWithBodyData:contentEncoding:options:error:",  v12,  v10,  v7,  &v58));
  id v16 = v58;

  if (v15)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownloadQueueResponse error](v15, "error"));

    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    uint64_t v19 = (void *)v18;
    __int16 v56 = v8;
    v57 = v6;
    if (v17)
    {
      if (!v18) {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      id v54 = v12;
      unsigned int v20 = [v19 shouldLog];
      else {
        unsigned int v21 = v20;
      }
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 OSLogObject]);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        uint64_t v23 = v21;
      }
      else {
        uint64_t v23 = v21 & 2;
      }
      if ((_DWORD)v23)
      {
        id v24 = (void *)objc_opt_class(self);
        id v52 = v24;
        id v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", @", "));
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownloadQueueResponse error](v15, "error"));
        int v60 = 138412802;
        v61 = v24;
        __int16 v62 = 2114;
        id v63 = v25;
        __int16 v64 = 2114;
        id v65 = v26;
        uint64_t v27 = (void *)_os_log_send_and_compose_impl( v23,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  16LL,  "%@: Received failure for items: [%{public}@] response error: %{public}@",  &v60,  32);

        id v6 = v57;
        if (!v27)
        {
LABEL_23:

          objc_opt_class(self);
          id v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", @", "));
          id v51 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownloadQueueResponse error](v15, "error"));
          SSDebugLog(1LL, @"[%@]: Received failure for items: [%@] response error: %@");

          id v8 = v56;
          id v6 = v57;
          id v12 = v54;
          goto LABEL_41;
        }

        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v27,  4LL));
        free(v27);
        SSFileLog(v19, @"%@");
      }

      goto LABEL_23;
    }

    if (!v18) {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v41 = [v19 shouldLog];
    uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 OSLogObject]);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v43 = v41;
    }
    else {
      uint64_t v43 = v41 & 2;
    }
    if ((_DWORD)v43)
    {
      v44 = (void *)objc_opt_class(self);
      id v55 = v44;
      int v53 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownloadQueueResponse downloads](v15, "downloads"));
      id v45 = v12;
      id v46 = [v53 count];
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "componentsJoinedByString:", @", "));
      int v60 = 138412802;
      v61 = v44;
      __int16 v62 = 2048;
      id v63 = v46;
      id v12 = v45;
      __int16 v64 = 2114;
      id v65 = v47;
      uint64_t v48 = (void *)_os_log_send_and_compose_impl( v43,  0LL,  0LL,  0LL,  &_mh_execute_header,  v42,  0LL,  "%@: Received content restore metadata for %lu items for restore items: [%{public}@]",  &v60,  32);

      if (!v48)
      {
LABEL_53:

        id v49 = (void *)objc_claimAutoreleasedReturnValue(-[StoreDownloadQueueResponse keybag](v15, "keybag"));
        if ([v49 length]) {
          sub_100023280(v49);
        }

        id v8 = v56;
        id v6 = v57;
        goto LABEL_41;
      }

      uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v48,  4LL));
      free(v48);
      SSFileLog(v19, @"%@");
    }

    goto LABEL_53;
  }

  id v9 = v16;
LABEL_38:
  uint64_t v36 = SSErrorDomain;
  if (!v9)
  {
    uint64_t v37 = SSError(SSErrorDomain, 100LL, 0LL, 0LL);
    id v9 = (id)objc_claimAutoreleasedReturnValue(v37);
  }

  v38 = objc_alloc(&OBJC_CLASS___StoreDownloadQueueResponse);
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[SSAccount uniqueIdentifier](self->_account, "uniqueIdentifier"));
  id v15 = -[StoreDownloadQueueResponse initWithError:userIdentifier:](v38, "initWithError:userIdentifier:", v9, v39);

  -[StoreDownloadQueueResponse setShouldCancelPurchaseBatch:]( v15,  "setShouldCancelPurchaseBatch:",  ISErrorIsEqual(v9, v36, 16LL));
  id v16 = v9;
LABEL_41:

  return v15;
}

- (BOOL)_runWithOptions:(id)a3 error:(id *)a4
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"allowed-kinds"]);

  if (v5)
  {
    id v6 = objc_alloc(&OBJC_CLASS___NSMutableSet);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"allowed-kinds"]);
    v109 = -[NSMutableSet initWithArray:](v6, "initWithArray:", v7);
  }

  else
  {
    v109 = 0LL;
  }

  CFPropertyListRef v8 = CFPreferencesCopyAppValue(@"ExtraRestoreKinds", kSSUserDefaultsIdentifier);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
  v108 = (void *)v8;
  id v121 = v4;
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v10) {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v11 = [v10 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if ((_DWORD)v12)
    {
      int v139 = 138412546;
      id v140 = (id)objc_opt_class(self);
      __int16 v141 = 2112;
      uint64_t v142 = (uint64_t)v108;
      id v14 = v140;
      id v15 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  1LL,  "%@: Adding extra allowed kinds: %@",  &v139,  22);

      if (!v15)
      {
LABEL_17:

        -[NSMutableSet addObjectsFromArray:](v109, "addObjectsFromArray:", v108);
        id v4 = v121;
        goto LABEL_18;
      }

      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
      free(v15);
      v103 = v13;
      SSFileLog(v10, @"%@");
    }

    goto LABEL_17;
  }

- (void)_showDialogsForResponse:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kISFailureTypeKey]);
  if ((objc_opt_respondsToSelector(v5, "intValue") & 1) == 0)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 objectForKey:@"status"]);

    unsigned int v5 = (void *)v6;
  }

  if ((objc_opt_respondsToSelector(v5, "intValue") & 1) != 0
    && [v5 intValue] == 3038
    && !-[RestoreDownloadItemsOperation shouldShowTermsAndConditionsDialog](self, "shouldShowTermsAndConditionsDialog"))
  {
    CFPropertyListRef v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v8) {
      CFPropertyListRef v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v9 = [v8 shouldLog];
    else {
      LODWORD(v10) = v9;
    }
    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = v10;
    }
    else {
      v10 &= 2u;
    }
    if ((_DWORD)v10)
    {
      int v14 = 138412290;
      id v15 = (id)objc_opt_class(self);
      id v12 = v15;
      v13 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "%@: Skipping terms and conditions failure",  &v14,  12);

      if (!v13)
      {
LABEL_20:

        goto LABEL_7;
      }

      unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
      free(v13);
      SSFileLog(v8, @"%@");
    }

    goto LABEL_20;
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___DaemonProtocolDataProvider);
  -[DaemonProtocolDataProvider setShouldProcessAuthenticationDialogs:]( v7,  "setShouldProcessAuthenticationDialogs:",  0LL);
  -[DaemonProtocolDataProvider processDialogFromDictionary:error:](v7, "processDialogFromDictionary:error:", v4, 0LL);

LABEL_7:
}

- (void).cxx_destruct
{
}

@end