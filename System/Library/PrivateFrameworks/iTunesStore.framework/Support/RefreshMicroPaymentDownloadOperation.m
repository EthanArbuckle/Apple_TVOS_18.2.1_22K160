@interface RefreshMicroPaymentDownloadOperation
- (BOOL)_refreshDownload:(id)a3 error:(id *)a4;
- (BOOL)_updateDownload:(id)a3 withDictionary:(id)a4;
- (RefreshMicroPaymentDownloadOperation)initWithDownloadIdentifier:(int64_t)a3;
- (id)_newIdentityForPayment:(id)a3;
- (id)_newRequestWithIdentity:(id)a3 transactionID:(id)a4;
- (int64_t)downloadIdentifier;
- (void)run;
@end

@implementation RefreshMicroPaymentDownloadOperation

- (RefreshMicroPaymentDownloadOperation)initWithDownloadIdentifier:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RefreshMicroPaymentDownloadOperation;
  result = -[RefreshMicroPaymentDownloadOperation init](&v5, "init");
  if (result) {
    result->_downloadID = a3;
  }
  return result;
}

- (int64_t)downloadIdentifier
{
  return self->_downloadID;
}

- (void)run
{
  uint64_t v24 = 0LL;
  id v3 = +[NSThread beginManagedContextSession](&OBJC_CLASS___NSThread, "beginManagedContextSession");
  v4 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
  -[NSFetchRequest setEntity:]( v4,  "setEntity:",  +[MicroPaymentDownload downloadEntityFromContext:]( &OBJC_CLASS___MicroPaymentDownload,  "downloadEntityFromContext:",  v3));
  -[NSFetchRequest setPredicate:]( v4,  "setPredicate:",  +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"downloadID=%lld",  self->_downloadID));
  id v5 = [v3 executeFetchRequest:v4 error:&v24];
  if (!v5 || (v6 = v5, [v5 count] != (id)1))
  {
    id v16 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v16) {
      id v16 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v17 = [v16 shouldLog];
    else {
      LODWORD(v18) = v17;
    }
    v19 = (os_log_s *)[v16 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v18 = v18;
    }
    else {
      v18 &= 2u;
    }
    if ((_DWORD)v18)
    {
      uint64_t v20 = objc_opt_class(self);
      int64_t downloadID = self->_downloadID;
      int v25 = 138412802;
      uint64_t v26 = v20;
      __int16 v27 = 2048;
      int64_t v28 = downloadID;
      __int16 v29 = 2112;
      uint64_t v30 = v24;
      uint64_t v22 = _os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "%@: Could not get download: %lld, error: %@",  &v25,  32);
      if (v22)
      {
        v23 = (void *)v22;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v22, 4LL);
        free(v23);
        SSFileLog(v16, @"%@");
      }
    }

    goto LABEL_27;
  }

  if (!-[RefreshMicroPaymentDownloadOperation _refreshDownload:error:]( self,  "_refreshDownload:error:",  [v6 objectAtIndex:0],  &v24))
  {
LABEL_27:
    uint64_t v15 = 0LL;
    goto LABEL_28;
  }

  id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v7) {
    id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v8 = [v7 shouldLog];
  else {
    LODWORD(v9) = v8;
  }
  v10 = (os_log_s *)[v7 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    uint64_t v9 = v9;
  }
  else {
    v9 &= 2u;
  }
  if ((_DWORD)v9)
  {
    uint64_t v11 = objc_opt_class(self);
    int64_t v12 = self->_downloadID;
    int v25 = 138412546;
    uint64_t v26 = v11;
    __int16 v27 = 2048;
    int64_t v28 = v12;
    uint64_t v13 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%@: Refreshed download: %lld",  &v25,  22);
    if (v13)
    {
      v14 = (void *)v13;
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
      free(v14);
      SSFileLog(v7, @"%@");
    }
  }

  sub_10003E244(v3);
  uint64_t v15 = 1LL;
LABEL_28:

  +[NSThread endManagedContextSession](&OBJC_CLASS___NSThread, "endManagedContextSession");
  -[RefreshMicroPaymentDownloadOperation setError:](self, "setError:", v24);
  -[RefreshMicroPaymentDownloadOperation setSuccess:](self, "setSuccess:", v15);
}

- (id)_newIdentityForPayment:(id)a3
{
  id v4 = [a3 client];
  if (!v4) {
    return 0LL;
  }
  id v5 = v4;
  if (objc_msgSend(objc_msgSend(v4, "usesIdentityAttributes"), "BOOLValue"))
  {
    v6 = objc_alloc_init(&OBJC_CLASS___StoreKitClientIdentity);
    -[StoreKitClientIdentity setAccountIdentifier:](v6, "setAccountIdentifier:", [a3 userDSID]);
    -[StoreKitClientIdentity setBundleIdentifier:](v6, "setBundleIdentifier:", [v5 identifier]);
    -[StoreKitClientIdentity setBundleVersion:](v6, "setBundleVersion:", [v5 bundleVersion]);
    id v7 = [v5 storeIdentifier];
    id v8 = [v5 storeVersion];
    -[StoreKitClientIdentity setStoreIdentifier:](v6, "setStoreIdentifier:", v7);
    -[StoreKitClientIdentity setStoreVersion:](v6, "setStoreVersion:", v8);
    if (v7) {
      BOOL v9 = v8 == 0LL;
    }
    else {
      BOOL v9 = 1;
    }
    uint64_t v10 = v9;
    -[StoreKitClientIdentity setSandboxed:](v6, "setSandboxed:", v10);
  }

  else
  {
    uint64_t v11 = objc_autoreleasePoolPush();
    id v12 = +[LSApplicationProxy applicationProxyForIdentifier:]( LSApplicationProxy,  "applicationProxyForIdentifier:",  [v5 identifier]);
    if (v12)
    {
      id v13 = v12;
      v6 = objc_alloc_init(&OBJC_CLASS___StoreKitClientIdentity);
      -[StoreKitClientIdentity setValuesWithSoftwareApplicationProxy:]( v6,  "setValuesWithSoftwareApplicationProxy:",  v13);
      -[StoreKitClientIdentity setSandboxed:]( v6,  "setSandboxed:",  objc_msgSend(objc_msgSend(v5, "sandboxed"), "BOOLValue"));
    }

    else
    {
      v6 = 0LL;
    }

    objc_autoreleasePoolPop(v11);
  }

  return v6;
}

- (id)_newRequestWithIdentity:(id)a3 transactionID:(id)a4
{
  v6 = objc_alloc_init(&OBJC_CLASS___MicroPaymentQueueRequest);
  -[MicroPaymentQueueRequest setClientIdentity:](v6, "setClientIdentity:", a3);
  -[MicroPaymentQueueRequest setUserIdentifier:](v6, "setUserIdentifier:", [a3 accountIdentifier]);
  id v7 = -[NSNumber initWithLongLong:]( [NSNumber alloc],  "initWithLongLong:",  [a4 longLongValue]);
  -[MicroPaymentQueueRequest setRangeEndIdentifier:](v6, "setRangeEndIdentifier:", v7);
  -[MicroPaymentQueueRequest setRangeStartIdentifier:](v6, "setRangeStartIdentifier:", v7);

  return v6;
}

- (BOOL)_refreshDownload:(id)a3 error:(id *)a4
{
  v52 = 0LL;
  id v7 = [a3 payment];
  id v8 = [v7 transactionIdentifier];
  if (v8)
  {
    id v9 = v8;
    id v10 = -[RefreshMicroPaymentDownloadOperation _newIdentityForPayment:](self, "_newIdentityForPayment:", v7);
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = -[RefreshMicroPaymentDownloadOperation _newRequestWithIdentity:transactionID:]( self,  "_newRequestWithIdentity:transactionID:",  v10,  v9);
      id v13 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v13) {
        id v13 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v14 = [v13 shouldLog];
      else {
        LODWORD(v15) = v14;
      }
      id v16 = (os_log_s *)[v13 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
        uint64_t v15 = v15;
      }
      else {
        v15 &= 2u;
      }
      if ((_DWORD)v15)
      {
        uint64_t v17 = objc_opt_class(self);
        int64_t downloadID = self->_downloadID;
        int v53 = 138412802;
        uint64_t v54 = v17;
        __int16 v55 = 2048;
        int64_t v56 = downloadID;
        __int16 v57 = 2112;
        int64_t v58 = (int64_t)v9;
        uint64_t v19 = _os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  1LL,  "%@: Refreshing download: %lld / %@",  &v53,  32);
        if (v19)
        {
          uint64_t v20 = (void *)v19;
          v21 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v19, 4LL);
          free(v20);
          v50 = v21;
          SSFileLog(v13, @"%@");
        }
      }

      uint64_t v22 = objc_alloc_init(&OBJC_CLASS___LoadMicroPaymentQueuePaymentsOperation);
      -[LoadMicroPaymentQueuePaymentsOperation setRequest:](v22, "setRequest:", v12);
      -[LoadMicroPaymentQueuePaymentsOperation setURLBagKey:]( v22,  "setURLBagKey:",  @"p2-in-app-pending-transactions");
      if ((-[RefreshMicroPaymentDownloadOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v22,  &v52) & 1) != 0)
      {
        v23 = -[MicroPaymentQueueResponse payments]( -[LoadMicroPaymentQueuePaymentsOperation response](v22, "response"),  "payments");
        if ((id)-[NSArray count](v23, "count") == (id)1)
        {
          LOBYTE(self) = -[RefreshMicroPaymentDownloadOperation _updateDownload:withDictionary:]( self,  "_updateDownload:withDictionary:",  a3,  -[NSArray objectAtIndex:](v23, "objectAtIndex:", 0LL));
          goto LABEL_65;
        }

        id v36 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v36) {
          id v36 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v43 = objc_msgSend(v36, "shouldLog", v50);
        else {
          LODWORD(v44) = v43;
        }
        v45 = (os_log_s *)[v36 OSLogObject];
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v44 = v44;
        }
        else {
          v44 &= 2u;
        }
        if (!(_DWORD)v44) {
          goto LABEL_64;
        }
        uint64_t v46 = objc_opt_class(self);
        NSUInteger v47 = -[NSArray count](v23, "count");
        int64_t v48 = self->_downloadID;
        int v53 = 138412802;
        uint64_t v54 = v46;
        __int16 v55 = 2048;
        int64_t v56 = v47;
        __int16 v57 = 2048;
        int64_t v58 = v48;
        LODWORD(v51) = 32;
        v42 = (RefreshMicroPaymentDownloadOperation *)_os_log_send_and_compose_impl( v44,  0LL,  0LL,  0LL,  &_mh_execute_header,  v45,  0LL,  "%@: Unexpected count: %lu when refreshing download: %lld",  &v53,  v51);
      }

      else
      {
        id v36 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v36) {
          id v36 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v37 = objc_msgSend(v36, "shouldLog", v50);
        else {
          LODWORD(v38) = v37;
        }
        v39 = (os_log_s *)[v36 OSLogObject];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v38 = v38;
        }
        else {
          v38 &= 2u;
        }
        if (!(_DWORD)v38) {
          goto LABEL_64;
        }
        uint64_t v40 = objc_opt_class(self);
        int64_t v41 = self->_downloadID;
        int v53 = 138412802;
        uint64_t v54 = v40;
        __int16 v55 = 2048;
        int64_t v56 = v41;
        __int16 v57 = 2112;
        int64_t v58 = (int64_t)v52;
        LODWORD(v51) = 32;
        v42 = (RefreshMicroPaymentDownloadOperation *)_os_log_send_and_compose_impl( v38,  0LL,  0LL,  0LL,  &_mh_execute_header,  v39,  0LL,  "%@: Could not refresh download: %lld, error: %@",  &v53,  v51);
      }

      self = v42;
      if (!v42) {
        goto LABEL_65;
      }
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v42, 4LL);
      free(self);
      SSFileLog(v36, @"%@");
LABEL_64:
      LOBYTE(self) = 0;
LABEL_65:

      if (!a4) {
        return (char)self;
      }
      goto LABEL_66;
    }

    id v24 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v24) {
      id v24 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v31 = [v24 shouldLog];
    else {
      LODWORD(v32) = v31;
    }
    v33 = (os_log_s *)[v24 OSLogObject];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v32 = v32;
    }
    else {
      v32 &= 2u;
    }
    if (!(_DWORD)v32) {
      goto LABEL_39;
    }
    uint64_t v34 = objc_opt_class(self);
    int64_t v35 = self->_downloadID;
    int v53 = 138412546;
    uint64_t v54 = v34;
    __int16 v55 = 2048;
    int64_t v56 = v35;
    uint64_t v30 = (RefreshMicroPaymentDownloadOperation *)_os_log_send_and_compose_impl( v32,  0LL,  0LL,  0LL,  &_mh_execute_header,  v33,  0LL,  "%@: No identity for download: %lld",  &v53,  22);
  }

  else
  {
    id v24 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v24) {
      id v24 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v25 = [v24 shouldLog];
    else {
      LODWORD(v26) = v25;
    }
    __int16 v27 = (os_log_s *)[v24 OSLogObject];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v26 = v26;
    }
    else {
      v26 &= 2u;
    }
    if (!(_DWORD)v26) {
      goto LABEL_39;
    }
    uint64_t v28 = objc_opt_class(self);
    int64_t v29 = self->_downloadID;
    int v53 = 138412546;
    uint64_t v54 = v28;
    __int16 v55 = 2048;
    int64_t v56 = v29;
    uint64_t v30 = (RefreshMicroPaymentDownloadOperation *)_os_log_send_and_compose_impl( v26,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "%@: No transaction ID for download: %lld",  &v53,  22);
  }

  self = v30;
  if (!v30) {
    goto LABEL_40;
  }
  +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v30, 4LL);
  free(self);
  SSFileLog(v24, @"%@");
LABEL_39:
  LOBYTE(self) = 0;
LABEL_40:
  if (!a4) {
    return (char)self;
  }
LABEL_66:
  return (char)self;
}

- (BOOL)_updateDownload:(id)a3 withDictionary:(id)a4
{
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  id v7 = [a3 payment];
  [v7 mergeValuesFromResponse:a4];
  id v8 = -[Download initWithMicroPaymentDownload:clientID:]( [Download alloc],  "initWithMicroPaymentDownload:clientID:",  a3,  objc_msgSend(objc_msgSend(v7, "client"), "identifier"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10015E1B8;
  v10[3] = &unk_10034FD60;
  v10[5] = v8;
  v10[6] = &v11;
  v10[4] = self;
  objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"),  "modifyUsingTransactionBlock:",  v10);

  LOBYTE(self) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)self;
}

@end