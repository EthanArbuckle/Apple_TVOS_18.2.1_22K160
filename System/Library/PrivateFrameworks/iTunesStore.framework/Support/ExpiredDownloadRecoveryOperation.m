@interface ExpiredDownloadRecoveryOperation
+ (BOOL)canAttemptRecoveryWithError:(id)a3;
- (ExpiredDownloadRecoveryOperation)initWithDownloadIdentifier:(int64_t)a3 databaseSession:(id)a4;
- (id)outputBlock;
- (void)run;
- (void)setOutputBlock:(id)a3;
@end

@implementation ExpiredDownloadRecoveryOperation

- (ExpiredDownloadRecoveryOperation)initWithDownloadIdentifier:(int64_t)a3 databaseSession:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ExpiredDownloadRecoveryOperation;
  v7 = -[ExpiredDownloadRecoveryOperation init](&v18, "init");
  if (v7)
  {
    v8 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  @"is_automatic",  @"is_store_queued",  @"kind",  @"download_state.store_queue_refresh_count",  @"store_saga_id",  0LL);
    v9 = objc_alloc(&OBJC_CLASS___DownloadEntity);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 database]);
    v11 = -[DownloadEntity initWithPersistentID:inDatabase:](v9, "initWithPersistentID:inDatabase:", a3, v10);

    v12 = -[SSMemoryEntity initWithDatabaseEntity:properties:]( objc_alloc(&OBJC_CLASS___SSMemoryEntity),  "initWithDatabaseEntity:properties:",  v11,  v8);
    download = v7->_download;
    v7->_download = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue( -[SSMemoryEntity valueForProperty:]( v7->_download,  "valueForProperty:",  @"download_state.store_queue_refresh_count"));
    v15 = (char *)[v14 integerValue];

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v15 + 1));
    -[DownloadEntity setValue:forProperty:]( v11,  "setValue:forProperty:",  v16,  @"download_state.store_queue_refresh_count");
  }

  return v7;
}

+ (BOOL)canAttemptRecoveryWithError:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:SSErrorHTTPStatusCodeKey]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  else {
    char IsEqual = ISErrorIsEqual(v3, NSURLErrorDomain, -1102LL);
  }

  return IsEqual;
}

- (id)outputBlock
{
  id v3 = [self->_outputBlock copy];
  -[ExpiredDownloadRecoveryOperation unlock](self, "unlock");
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setOutputBlock:(id)a3
{
  id v6 = a3;
  -[ExpiredDownloadRecoveryOperation lock](self, "lock");
  if (self->_outputBlock != v6)
  {
    id v4 = [v6 copy];
    id outputBlock = self->_outputBlock;
    self->_id outputBlock = v4;
  }

  -[ExpiredDownloadRecoveryOperation unlock](self, "unlock");
}

- (void)run
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ExpiredDownloadRecoveryResponse);
  -[ExpiredDownloadRecoveryResponse setResult:](v3, "setResult:", 0LL);
  id v4 = -[SSMemoryEntity databaseID](self->_download, "databaseID");
  -[ExpiredDownloadRecoveryResponse setDownloadIdentifier:](v3, "setDownloadIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"is_automatic"));
  id v6 = [v5 integerValue];

  if (v6 == (id)2) {
    -[ExpiredDownloadRecoveryResponse setResult:](v3, "setResult:", 1LL);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"kind"));
  unsigned __int8 v8 = [v7 isEqualToString:SSDownloadKindInAppContent];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"is_store_queued"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSMemoryEntity valueForProperty:](self->_download, "valueForProperty:", @"store_saga_id"));
  uint64_t v11 = SSGetItemIdentifierFromValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue( -[SSMemoryEntity valueForProperty:]( self->_download,  "valueForProperty:",  @"download_state.store_queue_refresh_count"));
  uint64_t v13 = (uint64_t)[v12 integerValue];

  if ((v8 & 1) != 0)
  {
    if (v13 <= 1)
    {
      v14 = off_100348D18;
      goto LABEL_36;
    }

    goto LABEL_23;
  }

  if (![v9 BOOLValue] && !v11 && v6 != (id)2)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v15) {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v16 = [v15 shouldLog];
    else {
      LODWORD(v17) = v16;
    }
    objc_super v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v17 = v17;
    }
    else {
      v17 &= 2u;
    }
    if ((_DWORD)v17)
    {
      int v53 = 138412546;
      id v54 = (id)objc_opt_class(self);
      __int16 v55 = 2048;
      id v56 = v4;
      id v19 = v54;
      v20 = (void *)_os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "%@: Canceling unrecoverable download after 403 response: %lld",  &v53,  22);

      if (!v20)
      {
LABEL_21:

        -[ExpiredDownloadRecoveryResponse setResult:](v3, "setResult:", 1LL);
        goto LABEL_77;
      }

      objc_super v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v20,  4LL));
      free(v20);
      v50 = v18;
      SSFileLog(v15, @"%@");
    }

    goto LABEL_21;
  }

  if (v13 < 2)
  {
    v14 = off_100348D10;
    if (!v11) {
      v14 = &off_100348D20;
    }
LABEL_36:
    v21 = (os_log_s *)[objc_alloc(*v14) initWithDownloadIdentifier:v4];
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v27) {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v28 = [v27 shouldLog];
    else {
      LODWORD(v29) = v28;
    }
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
      uint64_t v29 = v29;
    }
    else {
      v29 &= 2u;
    }
    if ((_DWORD)v29)
    {
      int v53 = 138412802;
      id v54 = (id)objc_opt_class(self);
      __int16 v55 = 2048;
      id v56 = v4;
      __int16 v57 = 2112;
      v58 = v21;
      id v31 = v54;
      v32 = (void *)_os_log_send_and_compose_impl( v29,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  1LL,  "%@: Refreshing download: %lld using operation: %@",  &v53,  32);

      if (!v32) {
        goto LABEL_48;
      }
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v32,  4LL));
      free(v32);
      v50 = v30;
      SSFileLog(v27, @"%@");
    }

LABEL_48:
    id v52 = 0LL;
    unsigned int v33 = -[ExpiredDownloadRecoveryOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v21,  &v52);
    v24 = (os_log_s *)v52;
    uint64_t v34 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    v35 = (void *)v34;
    if (v33)
    {
      if (!v34) {
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v36 = objc_msgSend(v35, "shouldLog", v50);
      else {
        LODWORD(v37) = v36;
      }
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 OSLogObject]);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO)) {
        uint64_t v37 = v37;
      }
      else {
        v37 &= 2u;
      }
      if ((_DWORD)v37)
      {
        v39 = (void *)objc_opt_class(self);
        int v53 = 138412546;
        id v54 = v39;
        __int16 v55 = 2048;
        id v56 = v4;
        id v40 = v39;
        LODWORD(v51) = 22;
        v41 = (void *)_os_log_send_and_compose_impl( v37,  0LL,  0LL,  0LL,  &_mh_execute_header,  v38,  1LL,  "%@: Reset download after 403 recovery: %lld",  &v53,  v51);

        if (!v41)
        {
LABEL_61:

          -[ExpiredDownloadRecoveryResponse setResult:](v3, "setResult:", 2LL);
          goto LABEL_75;
        }

        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v41,  4LL));
        free(v41);
        v50 = v38;
        SSFileLog(v35, @"%@");
      }

      goto LABEL_61;
    }

    if (!v34) {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v42 = objc_msgSend(v35, "shouldLog", v50);
    else {
      LODWORD(v43) = v42;
    }
    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 OSLogObject]);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v43 = v43;
    }
    else {
      v43 &= 2u;
    }
    if ((_DWORD)v43)
    {
      v45 = (void *)objc_opt_class(self);
      int v53 = 138412802;
      id v54 = v45;
      __int16 v55 = 2048;
      id v56 = v4;
      __int16 v57 = 2112;
      v58 = v24;
      id v46 = v45;
      LODWORD(v51) = 32;
      v47 = (void *)_os_log_send_and_compose_impl( v43,  0LL,  0LL,  0LL,  &_mh_execute_header,  v44,  0LL,  "%@: Recovery failed for download: %lld with error: %@",  &v53,  v51);

      if (!v47)
      {
LABEL_74:

        -[ExpiredDownloadRecoveryResponse setError:](v3, "setError:", v24);
        goto LABEL_75;
      }

      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v47,  4LL));
      free(v47);
      v50 = v44;
      SSFileLog(v35, @"%@");
    }

    goto LABEL_74;
  }

- (void).cxx_destruct
{
}

@end