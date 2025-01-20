@interface RefreshStoreQueueDownloadOperation
- (BOOL)_refreshDownload:(id)a3 error:(id *)a4;
- (RefreshStoreQueueDownloadOperation)initWithDownloadIdentifier:(int64_t)a3;
- (id)_URLBagKeyForDownload:(id)a3;
- (int64_t)downloadIdentifier;
- (void)run;
@end

@implementation RefreshStoreQueueDownloadOperation

- (RefreshStoreQueueDownloadOperation)initWithDownloadIdentifier:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RefreshStoreQueueDownloadOperation;
  result = -[RefreshStoreQueueDownloadOperation init](&v5, "init");
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
  v9 = sub_10015C2D8;
  v10 = sub_10015C2E8;
  uint64_t v11 = 0LL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10015C2F4;
  v5[3] = &unk_10034FD38;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"),  "readUsingTransactionBlock:",  v5);
  uint64_t v4 = 0LL;
  BOOL v3 = -[RefreshStoreQueueDownloadOperation _refreshDownload:error:](self, "_refreshDownload:error:", v7[5], &v4);
  -[RefreshStoreQueueDownloadOperation setError:](self, "setError:", v4);
  -[RefreshStoreQueueDownloadOperation setSuccess:](self, "setSuccess:", v3);

  _Block_object_dispose(&v6, 8);
}

- (BOOL)_refreshDownload:(id)a3 error:(id *)a4
{
  uint64_t v61 = 0LL;
  v62 = &v61;
  uint64_t v63 = 0x2020000000LL;
  char v64 = 0;
  v60 = 0LL;
  id v7 = [a3 valueForProperty:@"store_account_id"];
  id v8 = -[RefreshStoreQueueDownloadOperation _URLBagKeyForDownload:](self, "_URLBagKeyForDownload:", a3);
  id v9 = [a3 valueForProperty:@"store_transaction_id"];
  id v10 = v9;
  if (v7) {
    BOOL v11 = v8 == 0LL;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11 && v9 != 0LL)
  {
    v13 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
    -[SSMutableURLRequestProperties setURLBagKey:](v13, "setURLBagKey:", v8);
    -[SSMutableURLRequestProperties setValue:forRequestParameter:]( v13,  "setValue:forRequestParameter:",  v10,  @"endId");
    -[SSMutableURLRequestProperties setValue:forRequestParameter:]( v13,  "setValue:forRequestParameter:",  v10,  @"startId");
    v14 = -[LoadDownloadQueueOperation initWithRequestProperties:]( objc_alloc(&OBJC_CLASS___LoadDownloadQueueOperation),  "initWithRequestProperties:",  v13);
    -[LoadDownloadQueueOperation setAccountIdentifier:](v14, "setAccountIdentifier:", v7);
    -[LoadDownloadQueueOperation setNeedsAuthentication:](v14, "setNeedsAuthentication:", 0LL);
    id v15 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v15) {
      id v15 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    LODWORD(v16) = [v15 shouldLog];
    unsigned int v17 = [v15 shouldLogToDisk];
    v18 = (os_log_s *)[v15 OSLogObject];
    v19 = v18;
    if (v17) {
      LODWORD(v16) = v16 | 2;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
      uint64_t v16 = v16;
    }
    else {
      v16 &= 2u;
    }
    if ((_DWORD)v16)
    {
      uint64_t v21 = objc_opt_class(self);
      int64_t downloadID = self->_downloadID;
      int v65 = 138412802;
      uint64_t v66 = v21;
      __int16 v67 = 2048;
      int64_t v68 = downloadID;
      __int16 v69 = 2112;
      int64_t v70 = (int64_t)v10;
      uint64_t v23 = _os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  1LL,  "%@: Refreshing download: %lld / %@",  &v65,  32);
      if (v23)
      {
        v24 = (void *)v23;
        v25 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v23, 4LL);
        free(v24);
        v54 = v25;
        *(void *)&double v20 = SSFileLog(v15, @"%@").n128_u64[0];
      }
    }

    unsigned int v26 = -[RefreshStoreQueueDownloadOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v14,  &v60,  v20,  v54);
    *((_BYTE *)v62 + 24) = v26;
    if (v26)
    {
      v27 = -[LoadDownloadQueueOperation downloads](v14, "downloads");
      if ((id)-[NSOrderedSet count](v27, "count") == (id)1)
      {
        v28 = -[Download initWithStoreDownload:]( objc_alloc(&OBJC_CLASS___Download),  "initWithStoreDownload:",  -[NSOrderedSet objectAtIndex:](v27, "objectAtIndex:", 0LL));
        if (v28)
        {
          id v29 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
          if (!v29) {
            id v29 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
          }
          LODWORD(v30) = [v29 shouldLog];
          unsigned int v31 = [v29 shouldLogToDisk];
          v32 = (os_log_s *)[v29 OSLogObject];
          v33 = v32;
          if (v31) {
            LODWORD(v30) = v30 | 2;
          }
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
            uint64_t v30 = v30;
          }
          else {
            v30 &= 2u;
          }
          if ((_DWORD)v30)
          {
            uint64_t v58 = objc_opt_class(self);
            int64_t v57 = self->_downloadID;
            id v35 = [a3 valueForProperty:@"store_download_key"];
            id v36 = -[Download valueForProperty:](v28, "valueForProperty:", @"store_download_key");
            int v65 = 138413058;
            uint64_t v66 = v58;
            __int16 v67 = 2048;
            int64_t v68 = v57;
            __int16 v69 = 2112;
            int64_t v70 = (int64_t)v35;
            __int16 v71 = 2112;
            id v72 = v36;
            LODWORD(v56) = 42;
            uint64_t v37 = _os_log_send_and_compose_impl( v30,  0LL,  0LL,  0LL,  &_mh_execute_header,  v33,  1LL,  "%@: Refreshed download: %lld, changed download key from: \"%@\" to: \"%@\"",  &v65,  v56);
            if (v37)
            {
              v38 = (void *)v37;
              v39 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v37,  4LL);
              free(v38);
              v55 = v39;
              *(void *)&double v34 = SSFileLog(v29, @"%@").n128_u64[0];
            }
          }

          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472LL;
          v59[2] = sub_10015CA38;
          v59[3] = &unk_10034FD60;
          v59[5] = v28;
          v59[6] = &v61;
          v59[4] = self;
          objc_msgSend( +[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase", v34, v55),  "modifyUsingTransactionBlock:",  v59);
        }
      }

      else
      {
        id v40 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v40) {
          id v40 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        LODWORD(v41) = [v40 shouldLog];
        unsigned int v42 = [v40 shouldLogToDisk];
        v43 = (os_log_s *)[v40 OSLogObject];
        v44 = v43;
        if (v42) {
          LODWORD(v41) = v41 | 2;
        }
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v41 = v41;
        }
        else {
          v41 &= 2u;
        }
        if ((_DWORD)v41)
        {
          uint64_t v45 = objc_opt_class(self);
          NSUInteger v46 = -[NSOrderedSet count](v27, "count");
          int64_t v47 = self->_downloadID;
          int v65 = 138412802;
          uint64_t v66 = v45;
          __int16 v67 = 2048;
          int64_t v68 = v46;
          __int16 v69 = 2048;
          int64_t v70 = v47;
          LODWORD(v56) = 32;
          uint64_t v48 = _os_log_send_and_compose_impl( v41,  0LL,  0LL,  0LL,  &_mh_execute_header,  v44,  0LL,  "%@: Unexpected download count: %lu when refreshing download: %lld",  &v65,  v56);
          if (v48)
          {
            v49 = (void *)v48;
            +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v48, 4LL);
            free(v49);
            SSFileLog(v40, @"%@");
          }
        }

        *((_BYTE *)v62 + 24) = 0;
      }
    }
  }

  v50 = v62;
  int v51 = *((unsigned __int8 *)v62 + 24);
  if (a4 && !*((_BYTE *)v62 + 24))
  {
    *a4 = v60;
    int v51 = *((unsigned __int8 *)v50 + 24);
  }

  BOOL v52 = v51 != 0;
  _Block_object_dispose(&v61, 8);
  return v52;
}

- (id)_URLBagKeyForDownload:(id)a3
{
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___StoreDownloadQueueRequest);
  -[StoreDownloadQueueRequest setQueueIdentifier:]( v4,  "setQueueIdentifier:",  sub_100092878((uint64_t)[a3 valueForProperty:@"kind"]));
  objc_super v5 = -[StoreDownloadQueueRequest queueContentsURLBagKey](v4, "queueContentsURLBagKey");

  return v5;
}

@end