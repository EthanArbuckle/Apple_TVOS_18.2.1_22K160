@interface InstallDownloadOperation
- (void)operation:(id)a3 updatedProgress:(id)a4;
- (void)run;
@end

@implementation InstallDownloadOperation

- (void)run
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 downloadKind]);
  if ((SSDownloadKindIsSoftwareKind(v4) & 1) != 0)
  {
    v5 = off_100348A70;
  }

  else if ((SSDownloadKindIsMediaKind(v4) & 1) != 0 || (SSDownloadKindIsPodcastKind(v4) & 1) != 0)
  {
    v5 = off_100348A60;
  }

  else
  {
    v5 = off_100348A58;
    if ((SSDownloadKindIsEBookKind(v4) & 1) == 0)
    {
      if ((SSDownloadKindIsToneKind(v4) & 1) != 0)
      {
        v5 = &off_100348A78;
      }

      else if ([v4 isEqualToString:SSDownloadKindInAppContent])
      {
        v5 = off_100348A68;
      }

      else
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue([v3 documentTargetIdentifier]);
        unsigned int v32 = [v31 isEqualToString:@"com.apple.iBooks"];

        if (!v32) {
          v5 = off_100348A50;
        }
      }
    }
  }

  id v6 = [objc_alloc(*v5) initWithDownload:v3];
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  v38 = sub_1000CD5D0;
  v39 = sub_1000CD5E0;
  id v40 = 0LL;
  if (!v6)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v15) {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v16) = [v15 shouldLog];
    unsigned int v17 = [v15 shouldLogToDisk];
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
    v19 = v18;
    if (v17) {
      LODWORD(v16) = v16 | 2;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v16 = v16;
    }
    else {
      v16 &= 2u;
    }
    if ((_DWORD)v16)
    {
      id v20 = (id)objc_opt_class(self);
      id v21 = [v3 databaseID];
      int v41 = 138412546;
      id v42 = v20;
      __int16 v43 = 2048;
      id v44 = v21;
      v22 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "%@: No installer for download: %lld",  &v41,  22);

      if (!v22)
      {
LABEL_30:

        v23 = objc_alloc_init(&OBJC_CLASS___FinishDownloadResponse);
        v24 = (void *)v36[5];
        v36[5] = (uint64_t)v23;

        objc_msgSend((id)v36[5], "setDownloadIdentifier:", objc_msgSend(v3, "databaseID"));
        v25 = (void *)v36[5];
        v26 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaAsset]);
        objc_msgSend(v25, "setMediaAssetIdentifier:", objc_msgSend(v26, "databaseID"));

        [(id)v36[5] setResult:0];
        v27 = (void *)v36[5];
        uint64_t v28 = SSError(SSErrorDomain, 10LL, 0LL, 0LL);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        [v27 setError:v29];

        v30 = -[DownloadHandle initWithTransactionIdentifier:downloadIdentifier:]( [DownloadHandle alloc],  "initWithTransactionIdentifier:downloadIdentifier:",  [v3 transactionID],  objc_msgSend(v3, "databaseID"));
        [(id)v36[5] setDownloadHandle:v30];

        goto LABEL_31;
      }

      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v22,  4LL));
      free(v22);
      v33 = v19;
      SSFileLog(v15, @"%@");
    }

    goto LABEL_30;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v7) {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  LODWORD(v8) = [v7 shouldLog];
  unsigned int v9 = [v7 shouldLogToDisk];
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  v11 = v10;
  if (v9) {
    LODWORD(v8) = v8 | 2;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    uint64_t v8 = v8;
  }
  else {
    v8 &= 2u;
  }
  if (!(_DWORD)v8) {
    goto LABEL_17;
  }
  id v12 = (id)objc_opt_class(self);
  id v13 = [v3 databaseID];
  int v41 = 138412802;
  id v42 = v12;
  __int16 v43 = 2048;
  id v44 = v13;
  __int16 v45 = 2112;
  id v46 = v6;
  v14 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  1LL,  "%@: Running install for download: %lld using operation: %@",  &v41,  32);

  if (v14)
  {
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
    free(v14);
    v33 = v11;
    SSFileLog(v7, @"%@");
LABEL_17:
  }

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000CD5E8;
  v34[3] = &unk_10034DBC0;
  v34[4] = &v35;
  [v6 setOutputBlock:v34];
  [v6 setDelegate:self];
  -[InstallDownloadOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v6, 0LL);
  [v6 setDelegate:0];
LABEL_31:
  -[FinishDownloadStepOperation finishWithDownloadResponse:](self, "finishWithDownloadResponse:", v36[5], v33);
  _Block_object_dispose(&v35, 8);
}

- (void)operation:(id)a3 updatedProgress:(id)a4
{
  uint64_t v4 = OBJC_IVAR___ISOperation__progress;
  if (*(void *)&self->super.ISOperation_opaque[OBJC_IVAR___ISOperation__progress])
  {
    id v6 = objc_msgSend(a4, "copy", a3);
    v7 = *(void **)&self->super.ISOperation_opaque[v4];
    *(void *)&self->super.ISOperation_opaque[v4] = v6;

    id v8 = (id)objc_claimAutoreleasedReturnValue(-[InstallDownloadOperation delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v8, "operation:updatedProgress:") & 1) != 0) {
      [v8 operation:self updatedProgress:*(void *)&self->super.ISOperation_opaque[v4]];
    }
  }

@end