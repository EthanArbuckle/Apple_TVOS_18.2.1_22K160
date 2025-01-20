@interface RestoreDownloadDataOperation
- (BOOL)_isFatalRestoreError:(id)a3;
- (BOOL)_restoreDataForBundleID:(id)a3 restoreState:(int64_t)a4 error:(id *)a5;
- (void)operation:(id)a3 updatedProgress:(id)a4;
- (void)run;
@end

@implementation RestoreDownloadDataOperation

- (void)run
{
  v3 = objc_alloc_init(&OBJC_CLASS___FinishDownloadResponse);
  -[FinishDownloadResponse setResult:](v3, "setResult:", 4LL);
  v55 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  -[FinishDownloadResponse setDownloadIdentifier:](v3, "setDownloadIdentifier:", [v4 databaseID]);
  v52 = -[DownloadHandle initWithTransactionIdentifier:downloadIdentifier:]( [DownloadHandle alloc],  "initWithTransactionIdentifier:downloadIdentifier:",  [v4 transactionID],  objc_msgSend(v4, "databaseID"));
  -[FinishDownloadResponse setDownloadHandle:](v3, "setDownloadHandle:");
  v51 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaAsset]);
  -[FinishDownloadResponse setMediaAssetIdentifier:](v3, "setMediaAssetIdentifier:", [v51 databaseID]);
  id v5 = [v4 restoreState];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  unsigned int v7 = +[ApplicationWorkspace keepSafeHarborDataForBundleID:]( &OBJC_CLASS___ApplicationWorkspace,  "keepSafeHarborDataForBundleID:",  v6);

  v8 = &ACSLocateCachingServer_ptr;
  if (v7)
  {
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
    if ((_DWORD)v13)
    {
      v14 = (void *)objc_opt_class(v55);
      id v53 = v14;
      id v15 = [v4 databaseID];
      v16 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
      int v57 = 138412802;
      v58 = v14;
      __int16 v59 = 2048;
      int64_t v60 = (int64_t)v15;
      __int16 v61 = 2112;
      id v62 = v16;
      v17 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  1LL,  "%@: Restoring mid based download: %lld bundleIdentifier: %@",  &v57,  32);

      v8 = &ACSLocateCachingServer_ptr;
      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
        free(v17);
        v45 = v18;
        SSFileLog(v9, @"%@");
      }
    }

    else
    {
    }
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier", v45));
  id v56 = 0LL;
  v20 = v55;
  unsigned __int8 v21 = -[RestoreDownloadDataOperation _restoreDataForBundleID:restoreState:error:]( v55,  "_restoreDataForBundleID:restoreState:error:",  v19,  v5,  &v56);
  id v22 = v56;

  v54 = v3;
  if ((v21 & 1) == 0)
  {
    -[FinishDownloadResponse setError:](v3, "setError:", v22);
    uint64_t v33 = 0LL;
    goto LABEL_32;
  }

  if (v5 != (id)1) {
    goto LABEL_33;
  }
  if (!v7)
  {
    uint64_t v33 = 3LL;
    goto LABEL_32;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v8[459] sharedDaemonConfig]);
  if (!v23) {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v8[459] sharedConfig]);
  }
  unsigned int v24 = [v23 shouldLog];
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 OSLogObject]);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v26 = v24;
  }
  else {
    uint64_t v26 = v24 & 2;
  }
  if (!(_DWORD)v26) {
    goto LABEL_28;
  }
  v27 = (void *)objc_opt_class(v55);
  id v49 = v27;
  int64_t v48 = -[FinishDownloadResponse result](v3, "result");
  v28 = v8;
  id v29 = [v4 databaseID];
  id v30 = v22;
  v31 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  int v57 = 138413058;
  v58 = v27;
  __int16 v59 = 2048;
  int64_t v60 = v48;
  __int16 v61 = 2048;
  id v62 = v29;
  v8 = v28;
  __int16 v63 = 2112;
  v64 = v31;
  LODWORD(v47) = 42;
  v32 = (void *)_os_log_send_and_compose_impl( v26,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "%@: Restoring MID hard failed with state: %ld download: %lld bundleIdentifier: %@",  &v57,  v47);

  id v22 = v30;
  v3 = v54;

  if (v32)
  {
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v32,  4LL));
    free(v32);
    v46 = v25;
    SSFileLog(v23, @"%@");
LABEL_28:
  }

  uint64_t v33 = 7LL;
LABEL_32:
  -[FinishDownloadResponse setResult:](v3, "setResult:", v33, v46);
LABEL_33:
  v34 = (void *)objc_claimAutoreleasedReturnValue([v8[459] sharedDaemonConfig]);
  if (!v34) {
    v34 = (void *)objc_claimAutoreleasedReturnValue([v8[459] sharedConfig]);
  }
  unsigned int v35 = [v34 shouldLog];
  v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34 OSLogObject]);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO)) {
    uint64_t v37 = v35;
  }
  else {
    uint64_t v37 = v35 & 2;
  }
  if (!(_DWORD)v37)
  {
    v40 = v54;
    goto LABEL_44;
  }

  v38 = (void *)objc_opt_class(v55);
  id v50 = v22;
  id v39 = v38;
  v40 = v54;
  int64_t v41 = -[FinishDownloadResponse result](v54, "result");
  id v42 = [v4 databaseID];
  v43 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  int v57 = 138413058;
  v58 = v38;
  __int16 v59 = 2048;
  int64_t v60 = v41;
  __int16 v61 = 2048;
  id v62 = v42;
  __int16 v63 = 2112;
  v64 = v43;
  LODWORD(v47) = 42;
  v44 = (void *)_os_log_send_and_compose_impl( v37,  0LL,  0LL,  0LL,  &_mh_execute_header,  v36,  1LL,  "%@: Restoring data done with state: %ld download: %lld bundleIdentifier: %@",  &v57,  v47);

  v20 = v55;
  id v22 = v50;

  if (v44)
  {
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v44,  4LL));
    free(v44);
    SSFileLog(v34, @"%@");
LABEL_44:
  }

  -[FinishDownloadStepOperation finishWithDownloadResponse:](v20, "finishWithDownloadResponse:", v40);
}

- (void)operation:(id)a3 updatedProgress:(id)a4
{
  uint64_t v4 = OBJC_IVAR___ISOperation__progress;
  if (*(void *)&self->super.ISOperation_opaque[OBJC_IVAR___ISOperation__progress])
  {
    id v6 = objc_msgSend(a4, "copy", a3);
    unsigned int v7 = *(void **)&self->super.ISOperation_opaque[v4];
    *(void *)&self->super.ISOperation_opaque[v4] = v6;

    id v8 = (id)objc_claimAutoreleasedReturnValue(-[RestoreDownloadDataOperation delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v8, "operation:updatedProgress:") & 1) != 0) {
      [v8 operation:self updatedProgress:*(void *)&self->super.ISOperation_opaque[v4]];
    }
  }

- (BOOL)_isFatalRestoreError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  unsigned int v5 = [v4 isEqualToString:@"MBErrorDomain"];

  if (v5
    && (id v6 = [v3 code],
        (unsigned int v7 = (uint64_t (*)(id))ISWeakLinkedSymbolForString("MBIsFatalErrorCode", 18LL)) != 0LL))
  {
    char v8 = v7(v6);
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)_restoreDataForBundleID:(id)a3 restoreState:(int64_t)a4 error:(id *)a5
{
  id v71 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  id v70 = [v6 databaseID];

  unsigned int v7 = 0LL;
  uint64_t v8 = 1LL;
  v9 = (void **)&ACSLocateCachingServer_ptr;
  while (1)
  {
    context = objc_autoreleasePoolPush();
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9[459] sharedDaemonConfig]);
    if (!v10) {
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9[459] sharedConfig]);
    }
    unsigned int v11 = objc_msgSend(v10, "shouldLog", v64);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = v11 & 2;
    }
    if ((_DWORD)v13)
    {
      v14 = (void *)objc_opt_class(self);
      int v74 = 138413058;
      v75 = v14;
      __int16 v76 = 2048;
      *(void *)v77 = v8;
      *(_WORD *)&v77[8] = 2048;
      *(void *)&v77[10] = v70;
      *(_WORD *)&v77[18] = 2112;
      *(void *)&v77[20] = v71;
      id v15 = v14;
      LODWORD(v67) = 42;
      v16 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  1LL,  "%@: Restoring data (attempt %ld) for software download: %lld / %@",  &v74,  v67);

      if (!v16) {
        goto LABEL_13;
      }
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v16,  4LL));
      free(v16);
      v65 = v12;
      SSFileLog(v10, @"%@");
    }

LABEL_13:
    v17 = (void *)objc_claimAutoreleasedReturnValue([v9[459] sharedDaemonConfig]);
    if (!v17) {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v9[459] sharedConfig]);
    }
    v18 = v9;
    unsigned int v19 = objc_msgSend(v17, "shouldLog", v65);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
      uint64_t v21 = v19;
    }
    else {
      uint64_t v21 = v19 & 2;
    }
    if ((_DWORD)v21)
    {
      id v22 = (void *)objc_opt_class(self);
      id v23 = v22;
      unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
      id v25 = [v24 priority];
      int v74 = 138412546;
      v75 = v22;
      __int16 v76 = 2048;
      *(void *)v77 = v25;
      LODWORD(v67) = 22;
      uint64_t v26 = (void *)_os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  1LL,  "%@: Restoring data with priority = %ld",  &v74,  v67);

      if (!v26) {
        goto LABEL_24;
      }
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  4LL));
      free(v26);
      v66 = v20;
      SSFileLog(v17, @"%@");
    }

LABEL_24:
    v27 = objc_alloc(&OBJC_CLASS___RestoreBackupOperation);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
    id v29 = -[RestoreBackupOperation initWithBundleIdentifier:withPriority:isFailed:]( v27,  "initWithBundleIdentifier:withPriority:isFailed:",  v71,  [v28 priority],  a4 == 1);

    -[RestoreBackupOperation setDelegate:](v29, "setDelegate:", self);
    id v73 = v7;
    unsigned __int8 v30 = -[RestoreDownloadDataOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v29,  &v73);
    id v31 = v73;

    -[RestoreBackupOperation setDelegate:](v29, "setDelegate:", 0LL);
    if ((v30 & 1) != 0) {
      goto LABEL_53;
    }
    if (-[RestoreDownloadDataOperation _isFatalRestoreError:](self, "_isFatalRestoreError:", v31))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue([v18[459] sharedDaemonConfig]);
      if (!v40) {
        v40 = (void *)objc_claimAutoreleasedReturnValue([v18[459] sharedConfig]);
      }
      unsigned int v41 = objc_msgSend(v40, "shouldLog", v66);
      id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue([v40 OSLogObject]);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v43 = v41;
      }
      else {
        uint64_t v43 = v41 & 2;
      }
      if ((_DWORD)v43)
      {
        v44 = (void *)objc_opt_class(self);
        int v74 = 138412802;
        v75 = v44;
        __int16 v76 = 2048;
        *(void *)v77 = v70;
        *(_WORD *)&v77[8] = 2112;
        *(void *)&v77[10] = v31;
        id v45 = v44;
        LODWORD(v67) = 32;
        v46 = (void *)_os_log_send_and_compose_impl( v43,  0LL,  0LL,  0LL,  &_mh_execute_header,  v42,  0LL,  "%@: Skipping data restore after fatal error: %lld / %@",  &v74,  v67);

        if (v46)
        {
          id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v46,  4LL));
          free(v46);
          SSFileLog(v40, @"%@");
          goto LABEL_51;
        }
      }

      else
      {
LABEL_51:
      }

LABEL_53:
      objc_autoreleasePoolPop(context);
      BOOL v47 = 1;
      goto LABEL_87;
    }

    v9 = v18;
    if (sub_10005945C(v31))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue([v18[459] sharedDaemonConfig]);
      if (!v34) {
        v34 = (void *)objc_claimAutoreleasedReturnValue([v18[459] sharedConfig]);
      }
      unsigned int v48 = objc_msgSend(v34, "shouldLog", v66);
      id v49 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34 OSLogObject]);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v50 = v48;
      }
      else {
        uint64_t v50 = v48 & 2;
      }
      if ((_DWORD)v50)
      {
        v51 = (void *)objc_opt_class(self);
        int v74 = 138412802;
        v75 = v51;
        __int16 v76 = 2048;
        *(void *)v77 = v70;
        *(_WORD *)&v77[8] = 2112;
        *(void *)&v77[10] = v31;
        id v52 = v51;
        LODWORD(v67) = 32;
        uint64_t v53 = _os_log_send_and_compose_impl( v50,  0LL,  0LL,  0LL,  &_mh_execute_header,  v49,  0LL,  "%@: Giving up after transient error: %lld / %@",  &v74,  v67);
        goto LABEL_81;
      }

@end