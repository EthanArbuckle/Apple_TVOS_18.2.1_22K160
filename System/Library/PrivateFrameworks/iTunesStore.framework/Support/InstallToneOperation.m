@interface InstallToneOperation
- (id)_newRingtoneDictionary;
- (id)_ringtoneGUID;
- (int64_t)_performImport;
- (void)run;
@end

@implementation InstallToneOperation

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
  id v12 = 0LL;
  unsigned int v7 = -[FinishDownloadStepOperation installAsset:error:](self, "installAsset:error:", v6, &v12);
  id v8 = v12;
  if (!v7) {
    goto LABEL_6;
  }
  int64_t v9 = -[InstallToneOperation _performImport](self, "_performImport");
  if (v9 == 2)
  {
    uint64_t v10 = SSError(SSErrorDomain, 100LL, 0LL, 0LL);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);

    id v8 = (id)v11;
LABEL_6:
    -[FinishDownloadResponse setError:](v3, "setError:", v8);
    -[FinishDownloadResponse setResult:](v3, "setResult:", 0LL);
    -[FinishDownloadStepOperation rollbackAsset:error:](self, "rollbackAsset:error:", v6, 0LL);
    goto LABEL_7;
  }

  if (v9 == 1) {
    -[FinishDownloadStepOperation removeInstalledAsset:error:](self, "removeInstalledAsset:error:", v6, 0LL);
  }
LABEL_7:
  -[FinishDownloadStepOperation finishWithDownloadResponse:](self, "finishWithDownloadResponse:", v3);
}

- (id)_newRingtoneDictionary
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = ISWeakLinkedStringConstantForString("kTonePurchasedKey", 7LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", &__kCFBooleanTrue, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  uint64_t v7 = ISWeakLinkedStringConstantForString("kToneSyncIdentifierKey", 7LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v6 databaseID]));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v9, v8);

  uint64_t v10 = ISWeakLinkedStringConstantForString("kToneGloballyUniqueIdentifierKey", 7LL);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[InstallToneOperation _ringtoneGUID](self, "_ringtoneGUID"));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v12, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 storeItemIdentifier]);
  if (v13)
  {
    uint64_t v14 = ISWeakLinkedStringConstantForString("kToneStoreItemIdentifierKey", 7LL);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);

    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v13, v15);
    uint64_t v11 = (void *)v15;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v6 storeFrontIdentifier]);

  if (v16)
  {
    uint64_t v17 = ISWeakLinkedStringConstantForString("kToneStoreFrontIdentifierKey", 7LL);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);

    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v16, v18);
    uint64_t v11 = (void *)v18;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v6 collectionName]);

  if (v19)
  {
    uint64_t v20 = ISWeakLinkedStringConstantForString("kToneAlbumKey", 7LL);
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);

    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v19, v21);
    uint64_t v11 = (void *)v21;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([v6 artistName]);

  if (v22)
  {
    uint64_t v23 = ISWeakLinkedStringConstantForString("kToneArtistKey", 7LL);
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);

    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v22, v24);
    uint64_t v11 = (void *)v24;
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v6 genreName]);

  if (v25)
  {
    uint64_t v26 = ISWeakLinkedStringConstantForString("kToneGenreKey", 7LL);
    uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);

    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v25, v27);
    uint64_t v11 = (void *)v27;
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);

  if (v28)
  {
    uint64_t v29 = ISWeakLinkedStringConstantForString("kToneTitleKey", 7LL);
    uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);

    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v28, v30);
    uint64_t v11 = (void *)v30;
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue([v6 durationInMilliseconds]);

  if (v31)
  {
    uint64_t v32 = ISWeakLinkedStringConstantForString("kToneDurationKey", 7LL);
    uint64_t v33 = objc_claimAutoreleasedReturnValue(v32);

    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v31, v33);
    uint64_t v11 = (void *)v33;
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadKind]);

  else {
    v35 = "kToneMediaKindRingtone";
  }
  uint64_t v36 = ISWeakLinkedStringConstantForString(v35, 7LL);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);

  if (v37)
  {
    uint64_t v38 = ISWeakLinkedStringConstantForString("kToneMediaKindKey", 7LL);
    uint64_t v39 = objc_claimAutoreleasedReturnValue(v38);

    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v37, v39);
    uint64_t v11 = (void *)v39;
  }

  return v3;
}

- (id)_ringtoneGUID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%llx",  [v2 databaseID]));

  return v3;
}

- (int64_t)_performImport
{
  id v3 = -[InstallToneOperation _newRingtoneDictionary](self, "_newRingtoneDictionary");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 storeItemIdentifier]);
  uint64_t v6 = SSGetItemIdentifierFromValue(v5);

  v61 = (void *)objc_claimAutoreleasedReturnValue([v4 storeTransactionIdentifier]);
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___RingtonePurchaseStore);
  id v8 = objc_alloc_init((Class)ISWeakLinkedClassForString(@"TLToneManager", 7LL));
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaAsset]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 destinationFileName]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 _importPurchasedToneWithMetadata:v3 fileName:v10]);

  id v12 = [v11 statusCode];
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 toneIdentifier]);
  uint64_t v14 = (void *)v13;
  if (v12 == (id)2)
  {
    id v57 = v8;
    v59 = (void *)v13;
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v30) {
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v31 = [v30 shouldLog];
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 OSLogObject]);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      uint64_t v33 = v31;
    }
    else {
      uint64_t v33 = v31 & 2;
    }
    if ((_DWORD)v33)
    {
      v34 = (void *)objc_opt_class(self);
      id v54 = v34;
      id v35 = v3;
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
      int v62 = 138543618;
      v63 = v34;
      __int16 v64 = 2114;
      v65 = v36;
      v37 = (void *)_os_log_send_and_compose_impl( v33,  0LL,  0LL,  0LL,  &_mh_execute_header,  v32,  16LL,  "%{public}@: Tone import failed unexpectedly. This seems to be a transient failure, so rolling back asset: %{public}@.",  &v62,  22);

      id v3 = v35;
      if (v37)
      {
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v37,  4LL));
        free(v37);
        SSFileLog(v30, @"%@");
      }
    }

    else
    {
    }

    int64_t v48 = 2LL;
    id v8 = v57;
    uint64_t v14 = v59;
  }

  else
  {
    if (v12 == (id)1)
    {
      uint64_t v55 = v6;
      id v56 = v8;
      v60 = (void *)v13;
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v39) {
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v40 = [v39 shouldLog];
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue([v39 OSLogObject]);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v42 = v40;
      }
      else {
        uint64_t v42 = v40 & 2;
      }
      if ((_DWORD)v42)
      {
        v43 = (void *)objc_opt_class(self);
        id v52 = v43;
        id v44 = v3;
        v45 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
        int v62 = 138543874;
        v63 = v43;
        __int16 v64 = 2114;
        v65 = v45;
        __int16 v66 = 2114;
        v67 = v60;
        v46 = (void *)_os_log_send_and_compose_impl( v42,  0LL,  0LL,  0LL,  &_mh_execute_header,  v41,  0LL,  "%{public}@: Tone import was skipped because it was a duplicate entry: %{public}@. Finalizing with tone identifier: %{public}@.",  &v62,  32);

        id v3 = v44;
        if (v46)
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v46,  4LL));
          free(v46);
          SSFileLog(v39, @"%@");
        }
      }

      else
      {
      }

      uint64_t v14 = v60;
      -[RingtonePurchaseStore finalizeRingtoneForAdamID:transactionID:toneIdentifier:]( v7,  "finalizeRingtoneForAdamID:transactionID:toneIdentifier:",  v55,  v61,  v60);
      int64_t v48 = 1LL;
      goto LABEL_46;
    }

    if (!v12)
    {
      v58 = (void *)v13;
      id v15 = [v4 newITunesMetadataDictionary];
      v51 = v15;
      if (v15)
      {
        uint64_t v16 = SSDownloadMetadataKeyAdditionalInfo;
        uint64_t v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v15 objectForKey:SSDownloadMetadataKeyAdditionalInfo]);
        if (!v17)
        {
          uint64_t v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          [v51 setObject:v17 forKey:v16];
        }

        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v4 databaseID]));
        -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v18, SSDownloadMetadataKeyTrackPersistentID);

        v19 = (void *)objc_claimAutoreleasedReturnValue([v4 ITunesMetadataDestinationPath]);
        -[FinishDownloadStepOperation writeBinaryPropertyList:toPath:error:]( self,  "writeBinaryPropertyList:toPath:error:",  v51,  v19,  0LL);
      }

      uint64_t v53 = v6;
      id v56 = v8;
      -[FinishDownloadStepOperation addPurchaseManifestItem](self, "addPurchaseManifestItem");
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v20) {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v21 = [v20 shouldLog];
      else {
        unsigned int v22 = v21;
      }
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
        uint64_t v24 = v22;
      }
      else {
        uint64_t v24 = v22 & 2;
      }
      if ((_DWORD)v24)
      {
        v25 = (void *)objc_opt_class(self);
        id v50 = v25;
        id v26 = v3;
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
        int v62 = 138543874;
        v63 = v25;
        __int16 v64 = 2114;
        v65 = v27;
        __int16 v66 = 2114;
        v67 = v58;
        v28 = (void *)_os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  1LL,  "%{public}@: Successfully imported tone into Tone Library: %{public}@. Finalizing with tone i dentifier: %{public}@.",  &v62,  32);

        id v3 = v26;
        if (v28)
        {
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v28,  4LL));
          free(v28);
          SSFileLog(v20, @"%@");
        }
      }

      else
      {
      }

      uint64_t v14 = v58;
      -[RingtonePurchaseStore finalizeRingtoneForAdamID:transactionID:toneIdentifier:]( v7,  "finalizeRingtoneForAdamID:transactionID:toneIdentifier:",  v53,  v61,  v58);

      int64_t v48 = 0LL;
LABEL_46:
      id v8 = v56;
      goto LABEL_47;
    }

    int64_t v48 = 0LL;
  }

@end