@interface RefreshITunesMatchDownloadOperation
- (BOOL)_applyResultsOfOperation:(id)a3 toDownload:(id)a4 error:(id *)a5;
- (BOOL)_refreshDownload:(id)a3 error:(id *)a4;
- (RefreshITunesMatchDownloadOperation)initWithDownloadIdentifier:(int64_t)a3;
- (id)_newPurchaseForDownload:(id)a3;
- (int64_t)downloadIdentifier;
- (void)run;
@end

@implementation RefreshITunesMatchDownloadOperation

- (RefreshITunesMatchDownloadOperation)initWithDownloadIdentifier:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RefreshITunesMatchDownloadOperation;
  result = -[RefreshITunesMatchDownloadOperation init](&v5, "init");
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
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_10015E360;
  v10 = sub_10015E370;
  uint64_t v11 = 0LL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10015E37C;
  v5[3] = &unk_10034FD38;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"),  "readUsingTransactionBlock:",  v5);
  uint64_t v4 = 0LL;
  BOOL v3 = -[RefreshITunesMatchDownloadOperation _refreshDownload:error:](self, "_refreshDownload:error:", v7[5], &v4);
  -[RefreshITunesMatchDownloadOperation setError:](self, "setError:", v4);
  -[RefreshITunesMatchDownloadOperation setSuccess:](self, "setSuccess:", v3);

  _Block_object_dispose(&v6, 8);
}

- (BOOL)_applyResultsOfOperation:(id)a3 toDownload:(id)a4 error:(id *)a5
{
  uint64_t v38 = 0LL;
  v39 = &v38;
  uint64_t v40 = 0x2020000000LL;
  char v41 = 0;
  v7 = -[StoreDownloadQueueResponse initWithDictionary:userIdentifier:preferredAssetFlavor:]( [StoreDownloadQueueResponse alloc],  "initWithDictionary:userIdentifier:preferredAssetFlavor:",  [a3 rawOutput],  objc_msgSend(a4, "valueForProperty:", @"store_account_id"),  objc_msgSend(a4, "valueForProperty:", @"preferred_asset_flavor"));
  uint64_t v8 = -[StoreDownloadQueueResponse downloads](v7, "downloads");
  if ((id)-[NSOrderedSet count](v8, "count") == (id)1)
  {
    v9 = -[Download initWithStoreDownload:]( objc_alloc(&OBJC_CLASS___Download),  "initWithStoreDownload:",  -[NSOrderedSet objectAtIndex:](v8, "objectAtIndex:", 0LL));
    if (v9)
    {
      id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v10) {
        id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      LODWORD(v11) = [v10 shouldLog];
      unsigned int v12 = [v10 shouldLogToDisk];
      v13 = (os_log_s *)[v10 OSLogObject];
      v14 = v13;
      if (v12) {
        LODWORD(v11) = v11 | 2;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v11 = v11;
      }
      else {
        v11 &= 2u;
      }
      if ((_DWORD)v11)
      {
        uint64_t v16 = objc_opt_class(self);
        int64_t downloadID = self->_downloadID;
        id v18 = -[Download valueForProperty:](v9, "valueForProperty:", @"store_download_key");
        int v42 = 138412802;
        uint64_t v43 = v16;
        __int16 v44 = 2048;
        int64_t v45 = downloadID;
        __int16 v46 = 2112;
        id v47 = v18;
        uint64_t v19 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "%@: Reloaded download: %lld, with download key: %@",  &v42,  32);
        if (v19)
        {
          v20 = (void *)v19;
          v21 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v19, 4LL);
          free(v20);
          v36 = v21;
          *(void *)&double v15 = SSFileLog(v10, @"%@").n128_u64[0];
        }
      }

      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_10015E8C8;
      v37[3] = &unk_10034FD60;
      v37[5] = v9;
      v37[6] = &v38;
      v37[4] = self;
      objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase", v15, v36),  "modifyUsingTransactionBlock:",  v37);
    }
  }

  else
  {
    id v22 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v22) {
      id v22 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    LODWORD(v23) = [v22 shouldLog];
    unsigned int v24 = [v22 shouldLogToDisk];
    v25 = (os_log_s *)[v22 OSLogObject];
    v26 = v25;
    if (v24) {
      LODWORD(v23) = v23 | 2;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v23 = v23;
    }
    else {
      v23 &= 2u;
    }
    if ((_DWORD)v23)
    {
      uint64_t v27 = objc_opt_class(self);
      int64_t v28 = self->_downloadID;
      id v29 = -[NSOrderedSet count](v8, "count");
      int v42 = 138412802;
      uint64_t v43 = v27;
      __int16 v44 = 2048;
      int64_t v45 = v28;
      __int16 v46 = 2048;
      id v47 = v29;
      uint64_t v30 = _os_log_send_and_compose_impl( v23,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "%@: Could not refresh download: %lld, incorrect count: %lu",  &v42,  32);
      if (v30)
      {
        v31 = (void *)v30;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v30, 4LL);
        free(v31);
        SSFileLog(v22, @"%@");
      }
    }
  }

  v32 = v39;
  int v33 = *((unsigned __int8 *)v39 + 24);
  if (a5 && !*((_BYTE *)v39 + 24))
  {
    *a5 = 0LL;
    int v33 = *((unsigned __int8 *)v32 + 24);
  }

  BOOL v34 = v33 != 0;
  _Block_object_dispose(&v38, 8);
  return v34;
}

- (id)_newPurchaseForDownload:(id)a3
{
  id v4 = [a3 valueForProperty:@"store_account_id"];
  id v5 = [a3 valueForProperty:@"store_redownload_parameters"];
  if (v4) {
    BOOL v6 = v5 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 0LL;
  }
  id v7 = v5;
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___SSPurchase);
  -[SSPurchase setAccountIdentifier:](v8, "setAccountIdentifier:", v4);
  -[SSPurchase setBuyParameters:](v8, "setBuyParameters:", v7);
  -[SSPurchase setIgnoresForcedPasswordRestriction:](v8, "setIgnoresForcedPasswordRestriction:", 1LL);
  v9 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setURLBagKey:](v9, "setURLBagKey:", @"paidRedownloadProduct");
  -[SSPurchase setRequestProperties:](v8, "setRequestProperties:", v9);

  return v8;
}

- (BOOL)_refreshDownload:(id)a3 error:(id *)a4
{
  uint64_t v23 = 0LL;
  id v7 = -[RefreshITunesMatchDownloadOperation _newPurchaseForDownload:](self, "_newPurchaseForDownload:");
  if (!v7)
  {
    BOOL v20 = 0;
    if (!a4) {
      return v20;
    }
    goto LABEL_19;
  }

  uint64_t v8 = v7;
  v9 = -[PurchaseOperation initWithPurchase:](objc_alloc(&OBJC_CLASS___PurchaseOperation), "initWithPurchase:", v7);
  -[PurchaseOperation setShouldSendKeyBagSyncData:](v9, "setShouldSendKeyBagSyncData:", 1LL);
  id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v10) {
    id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v11 = [v10 shouldLog];
  else {
    LODWORD(v12) = v11;
  }
  v13 = (os_log_s *)[v10 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
    uint64_t v12 = v12;
  }
  else {
    v12 &= 2u;
  }
  if ((_DWORD)v12)
  {
    uint64_t v15 = objc_opt_class(self);
    int64_t downloadID = self->_downloadID;
    int v24 = 138412802;
    uint64_t v25 = v15;
    __int16 v26 = 2048;
    int64_t v27 = downloadID;
    __int16 v28 = 2112;
    id v29 = [v8 buyParameters];
    uint64_t v17 = _os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  1LL,  "%@: Reloading iTunes Match download: %lld / %@",  &v24,  32);
    if (v17)
    {
      id v18 = (void *)v17;
      uint64_t v19 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v17, 4LL);
      free(v18);
      id v22 = v19;
      *(void *)&double v14 = SSFileLog(v10, @"%@").n128_u64[0];
    }
  }

  if (-[RefreshITunesMatchDownloadOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v9,  &v23,  v14,  v22)) {
    BOOL v20 = -[RefreshITunesMatchDownloadOperation _applyResultsOfOperation:toDownload:error:]( self,  "_applyResultsOfOperation:toDownload:error:",  v9,  a3,  &v23);
  }
  else {
    BOOL v20 = 0;
  }

  if (a4)
  {
LABEL_19:
    if (!v20) {
      *a4 = v23;
    }
  }

  return v20;
}

@end