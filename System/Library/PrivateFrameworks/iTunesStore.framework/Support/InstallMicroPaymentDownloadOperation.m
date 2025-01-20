@interface InstallMicroPaymentDownloadOperation
- (void)run;
@end

@implementation InstallMicroPaymentDownloadOperation

- (void)run
{
  v3 = objc_alloc_init(&OBJC_CLASS___FinishDownloadResponse);
  -[FinishDownloadResponse setResult:](v3, "setResult:", 4LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  -[FinishDownloadResponse setDownloadIdentifier:](v3, "setDownloadIdentifier:", [v4 databaseID]);
  v5 = -[DownloadHandle initWithTransactionIdentifier:downloadIdentifier:]( [DownloadHandle alloc],  "initWithTransactionIdentifier:downloadIdentifier:",  [v4 transactionID],  objc_msgSend(v4, "databaseID"));
  -[FinishDownloadResponse setDownloadHandle:](v3, "setDownloadHandle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaAsset]);
  -[FinishDownloadResponse setMediaAssetIdentifier:](v3, "setMediaAssetIdentifier:", [v6 databaseID]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 clientIdentifier]);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 downloadKind]);
    v37 = (void *)objc_claimAutoreleasedReturnValue( -[FinishDownloadStepOperation documentsDirectoryPathWithClientIdentifier:downloadKind:]( self,  "documentsDirectoryPathWithClientIdentifier:downloadKind:",  v7,  v8));
  }

  else
  {
    v37 = 0LL;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 destinationFileName]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pathExtension]);

    if (v12) {
      id v13 = (id)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathExtension:v12]);
    }
    else {
      id v13 = v10;
    }
    v15 = v13;

    id v14 = 0LL;
    if (!v37 || !v15) {
      goto LABEL_29;
    }
    v36 = v15;
    id v40 = 0LL;
    id v41 = 0LL;
    unsigned int v16 = -[FinishDownloadStepOperation unzipAsset:unzippedPath:error:]( self,  "unzipAsset:unzippedPath:error:",  v6,  &v41,  &v40);
    id v17 = v41;
    id v18 = v40;
    if (v16)
    {
      v35 = v7;
      v33 = v5;
      v19 = (void *)objc_claimAutoreleasedReturnValue([v37 stringByAppendingPathComponent:v36]);
      id v38 = v18;
      id v39 = v19;
      v34 = v17;
      unsigned int v20 = -[FinishDownloadStepOperation moveFile:toPath:installBehavior:error:]( self,  "moveFile:toPath:installBehavior:error:",  v17,  &v39,  1LL,  &v38);
      v21 = (NSFileManager *)v39;

      id v14 = v38;
      if (v20)
      {
        v32 = v21;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v22) {
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        LODWORD(v23) = [v22 shouldLog];
        v31 = v22;
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 OSLogObject]);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
          uint64_t v23 = v23;
        }
        else {
          v23 &= 2u;
        }
        v15 = v36;
        if ((_DWORD)v23)
        {
          v25 = (void *)objc_opt_class(self);
          id v30 = v25;
          id v26 = [v4 databaseID];
          int v42 = 138412802;
          v43 = v25;
          __int16 v44 = 2048;
          id v45 = v26;
          __int16 v46 = 2112;
          v47 = v32;
          v27 = (void *)_os_log_send_and_compose_impl( v23,  0LL,  0LL,  0LL,  &_mh_execute_header,  v24,  1LL,  "%@: Moved download: %lld to path: %@",  &v42,  32);

          v5 = v33;
          if (!v27)
          {
LABEL_33:

            -[FinishDownloadResponse setMediaAssetInstallPath:](v3, "setMediaAssetInstallPath:", v32);
            v7 = v35;
            goto LABEL_30;
          }

          v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v27,  4LL));
          free(v27);
          v29 = v24;
          SSFileLog(v31, @"%@");
        }

        else
        {
          v5 = v33;
        }

        goto LABEL_33;
      }

      id v18 = v14;
      v5 = v33;
      v28 = v17;
    }

    else
    {
      v28 = v17;
      if (!v17)
      {
        v15 = v36;
        goto LABEL_28;
      }

      v35 = v7;
      v21 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
      -[NSFileManager removeItemAtPath:error:](v21, "removeItemAtPath:error:", v17, 0LL);
    }

    v15 = v36;

    v7 = v35;
LABEL_28:

    id v14 = v18;
    goto LABEL_29;
  }

  id v14 = 0LL;
  v15 = 0LL;
LABEL_29:
  -[FinishDownloadResponse setError:](v3, "setError:", v14);
  -[FinishDownloadResponse setResult:](v3, "setResult:", 0LL);
  -[FinishDownloadStepOperation rollbackAsset:error:](self, "rollbackAsset:error:", v6, 0LL);
LABEL_30:
  -[FinishDownloadStepOperation finishWithDownloadResponse:](self, "finishWithDownloadResponse:", v3, v29);
}

@end