@interface DownloadDRMOperation
- (BOOL)_checkoutRentalKeys:(id *)a3;
- (BOOL)_decryptAsset:(id *)a3;
- (BOOL)_unprotectMediaAsset:(id *)a3;
- (id)_sinfs;
- (void)operation:(id)a3 updatedProgress:(id)a4;
- (void)run;
@end

@implementation DownloadDRMOperation

- (void)run
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaAsset]);
  v5 = objc_alloc_init(&OBJC_CLASS___FinishDownloadResponse);
  -[FinishDownloadResponse setDownloadIdentifier:](v5, "setDownloadIdentifier:", [v3 databaseID]);
  -[FinishDownloadResponse setMediaAssetIdentifier:](v5, "setMediaAssetIdentifier:", [v4 databaseID]);
  -[FinishDownloadResponse setResult:](v5, "setResult:", 4LL);
  v6 = -[DownloadHandle initWithTransactionIdentifier:downloadIdentifier:]( [DownloadHandle alloc],  "initWithTransactionIdentifier:downloadIdentifier:",  [v3 transactionID],  objc_msgSend(v3, "databaseID"));
  -[FinishDownloadResponse setDownloadHandle:](v5, "setDownloadHandle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 downloadKind]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 DPInfoData]);
  if (v8
    || (SSDownloadKindIsEBookKind(v7) & 1) != 0
    || [v7 isEqualToString:SSDownloadKindInAppContent])
  {
    id v17 = 0LL;
    unsigned __int8 v9 = -[DownloadDRMOperation _decryptAsset:](self, "_decryptAsset:", &v17);
    id v10 = v17;
    if ((v9 & 1) != 0)
    {
LABEL_6:

      goto LABEL_7;
    }

- (void)operation:(id)a3 updatedProgress:(id)a4
{
  uint64_t v4 = OBJC_IVAR___ISOperation__progress;
  if (*(void *)&self->super.ISOperation_opaque[OBJC_IVAR___ISOperation__progress])
  {
    id v6 = objc_msgSend(a4, "copy", a3);
    v7 = *(void **)&self->super.ISOperation_opaque[v4];
    *(void *)&self->super.ISOperation_opaque[v4] = v6;

    id v8 = (id)objc_claimAutoreleasedReturnValue(-[DownloadDRMOperation delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v8, "operation:updatedProgress:") & 1) != 0) {
      [v8 operation:self updatedProgress:*(void *)&self->super.ISOperation_opaque[v4]];
    }
  }

- (BOOL)_checkoutRentalKeys:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 storeMetadata]);
  unsigned int v7 = [v6 isRental];

  if (!v7) {
    goto LABEL_34;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadDRMOperation _sinfs](self, "_sinfs"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v5 storeMetadata]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 rentalID]);

  if (!v8)
  {
    if (v10)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 activeAccount]);
      v18 = (CheckoutRentalKeysOperation *)objc_claimAutoreleasedReturnValue([v22 uniqueIdentifier]);

      if (!v18)
      {
        id v20 = 0LL;
        unsigned __int8 v19 = 1;
        goto LABEL_16;
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v23) {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v24 = [v23 shouldLog];
      else {
        LODWORD(v25) = v24;
      }
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 OSLogObject]);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
        uint64_t v25 = v25;
      }
      else {
        v25 &= 2u;
      }
      if ((_DWORD)v25)
      {
        v27 = (void *)objc_opt_class(self);
        id v31 = v27;
        int v34 = 138412546;
        v35 = v27;
        __int16 v36 = 2048;
        id v37 = [v5 databaseID];
        v28 = (void *)_os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  1LL,  "%@: Checking out rental keys for download: %lld",  &v34,  22);

        if (!v28)
        {
LABEL_33:

          v29 = -[CheckoutRentalKeysOperation initWithAccountIdentifier:rentalKeyIdentifier:]( objc_alloc(&OBJC_CLASS___CheckoutRentalKeysOperation),  "initWithAccountIdentifier:rentalKeyIdentifier:",  v18,  v10);
          -[CheckoutRentalKeysOperation setCheckoutType:](v29, "setCheckoutType:", 1LL);
          id v32 = 0LL;
          unsigned __int8 v19 = -[DownloadDRMOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v29,  &v32);
          id v20 = v32;

          goto LABEL_16;
        }

        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v28,  4LL));
        free(v28);
        SSFileLog(v23, @"%@");
      }

      goto LABEL_33;
    }

- (BOOL)_decryptAsset:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaAsset]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 DPInfoData]);
  if (![v7 length])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadDRMOperation _sinfs](self, "_sinfs"));
    if (v8)
    {
      unsigned __int8 v9 = -[DownloadDRM initWithSinfArray:](objc_alloc(&OBJC_CLASS___DownloadDRM), "initWithSinfArray:", v8);
      uint64_t v10 = objc_claimAutoreleasedReturnValue(-[DownloadDRM firstDataForSinfDataKey:](v9, "firstDataForSinfDataKey:", off_1003A2498));

      unsigned int v7 = (void *)v10;
    }
  }

  if ([v7 length])
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 localPath]);
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v12) {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    v26 = v5;
    unsigned int v13 = [v12 shouldLog];
    else {
      unsigned int v14 = v13;
    }
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      uint64_t v16 = v14;
    }
    else {
      uint64_t v16 = v14 & 2;
    }
    if ((_DWORD)v16)
    {
      id v17 = a3;
      v18 = (void *)objc_opt_class(self);
      id v19 = v18;
      int v28 = 138412802;
      v29 = v18;
      a3 = v17;
      __int16 v30 = 2048;
      id v31 = [v26 databaseID];
      __int16 v32 = 2112;
      id v33 = v11;
      id v20 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  1LL,  "%@: Decrypting asset for download: %lld at path: %@",  &v28,  32);

      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v20,  4LL));
        free(v20);
        SSFileLog(v12, @"%@");
      }
    }

    else
    {
    }

    unsigned int v24 = -[FairPlayDecryptFileOperation initWithPath:dpInfo:]( objc_alloc(&OBJC_CLASS___FairPlayDecryptFileOperation),  "initWithPath:dpInfo:",  v11,  v7);
    -[FairPlayDecryptFileOperation setDelegate:](v24, "setDelegate:", self);
    -[FairPlayDecryptFileOperation setShouldRunWithBackgroundPriority:](v24, "setShouldRunWithBackgroundPriority:", 1LL);
    id v27 = 0LL;
    unsigned __int8 v23 = -[DownloadDRMOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v24,  &v27);
    id v22 = v27;
    -[FairPlayDecryptFileOperation setDelegate:](v24, "setDelegate:", 0LL);

    if (a3)
    {
      v5 = v26;
      if ((v23 & 1) == 0)
      {
        id v22 = v22;
        unsigned __int8 v23 = 0;
        *a3 = v22;
      }
    }

    else
    {
      v5 = v26;
    }
  }

  else
  {
    id v22 = 0LL;
    unsigned __int8 v23 = 1;
  }

  return v23;
}

- (id)_sinfs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mediaAsset]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 SINFData]);

  if (v4) {
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v4,  0LL,  0LL,  0LL));
  }
  else {
    v5 = 0LL;
  }
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v2 storeMetadata]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 sinfs]);

    v5 = (NSMutableArray *)v8;
  }

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v2 storeSagaIdentifier]);

  if (v9)
  {
    id v22 = v4;
    unsigned __int8 v23 = v2;
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    unsigned int v11 = v5;
    id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        id v15 = 0LL;
        do
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)v15);
          uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
          {
            id v18 = [v16 mutableCopy];
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"pinf"]);
            uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSData);
            if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0 && ![v19 length]) {
              [v18 removeObjectForKey:@"pinf"];
            }
            -[NSMutableArray addObject:](v10, "addObject:", v18, v22, v23, (void)v24);
          }

          else
          {
            -[NSMutableArray addObject:](v10, "addObject:", v16);
          }

          id v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
      }

      while (v13);
    }

    uint64_t v4 = v22;
    v2 = v23;
  }

  else
  {
    uint64_t v10 = v5;
  }

  return v10;
}

- (BOOL)_unprotectMediaAsset:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadDRMOperation _sinfs](self, "_sinfs"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  unsigned __int8 v7 = [v6 isHLS];
  id v8 = 0LL;
  unsigned __int8 v9 = 1;
  if (!v5 || (v7 & 1) != 0) {
    goto LABEL_34;
  }
  int v34 = a3;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v35 mediaAsset]);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localPath]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v12) {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v13 = [v12 shouldLog];
  else {
    unsigned int v14 = v13;
  }
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = v14 & 2;
  }
  if ((_DWORD)v16)
  {
    uint64_t v17 = (void *)objc_opt_class(self);
    id v18 = v17;
    int v37 = 138412802;
    v38 = v17;
    __int16 v39 = 2048;
    id v40 = [v35 databaseID];
    __int16 v41 = 2112;
    v42 = v11;
    id v19 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  1LL,  "%@: Unprotect asset for download: %lld at path: %@",  &v37,  32);

    if (!v19) {
      goto LABEL_15;
    }
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
    free(v19);
    __int16 v30 = v15;
    SSFileLog(v12, @"%@");
  }

LABEL_15:
  uint64_t v20 = -[MediaDRMOperation initWithMediaPath:sinfs:]( objc_alloc(&OBJC_CLASS___MediaDRMOperation),  "initWithMediaPath:sinfs:",  v11,  v5);
  -[MediaDRMOperation setDelegate:](v20, "setDelegate:", self);
  -[MediaDRMOperation setShouldRunWithBackgroundPriority:](v20, "setShouldRunWithBackgroundPriority:", 1LL);
  id v36 = 0LL;
  unsigned __int8 v9 = -[DownloadDRMOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v20,  &v36);
  id v8 = v36;
  -[MediaDRMOperation setDelegate:](v20, "setDelegate:", 0LL);
  if ((v9 & 1) == 0)
  {
    id v33 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
    -[NSFileManager removeItemAtPath:error:](v33, "removeItemAtPath:error:", v11, 0LL);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v21) {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v22) = objc_msgSend(v21, "shouldLog", v30);
    unsigned __int8 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v22 = v22;
    }
    else {
      v22 &= 2u;
    }
    if ((_DWORD)v22)
    {
      __int128 v24 = (void *)objc_opt_class(self);
      id v32 = v24;
      id v25 = [v35 databaseID];
      int v37 = 138412802;
      v38 = v24;
      __int16 v39 = 2048;
      id v40 = v25;
      __int16 v41 = 2112;
      v42 = v11;
      LODWORD(v31) = 32;
      __int128 v26 = (void *)_os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "%@: Download unprotect failed: %lld, deleted file: %@",  &v37,  v31);

      __int128 v27 = v33;
      if (!v26)
      {
LABEL_28:

        goto LABEL_29;
      }

      unsigned __int8 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  4LL));
      free(v26);
      SSFileLog(v21, @"%@");
    }

    else
    {
      __int128 v27 = v33;
    }

    goto LABEL_28;
  }

@end