@interface RDAssetManager
+ (id)_assetQueryForLanguage:(id)a3;
+ (id)sharedInstance;
- (BOOL)_startedDownloadingEmbeddedSpeechAsset:(id)a3 withUrgency:(BOOL)a4 error:(id *)a5;
- (BOOL)catalogDownloadInProgress;
- (BOOL)sendCallback;
- (NSMutableArray)peersRequestingDownloadProgress;
- (NSMutableArray)requestedLanguagesForDownload;
- (OS_dispatch_queue)queue;
- (RDAssetManager)init;
- (id)_errorStringForCancelDownloadResult:(int64_t)a3;
- (id)_errorStringForDownloadResult:(int64_t)a3;
- (id)_errorStringForMAOperationResult:(int64_t)a3;
- (id)_errorStringForPurgeResult:(int64_t)a3;
- (id)_errorStringForQueryResult:(int64_t)a3;
- (id)_installedAssetForLanguage:(id)a3 error:(id *)a4;
- (id)_installedAssetFromFoundAssets:(id)a3 language:(id)a4 error:(id *)a5;
- (id)_installedLocalAssetForLanguage:(id)a3 error:(id *)a4;
- (id)_stateStringForAsset:(id)a3;
- (id)copyInstallationStatusForLangaugesWithError:(id *)a3;
- (id)copyInstalledAssetPathForLangaugeWithError:(id)a3 error:(id *)a4;
- (id)copyInstalledQuasarModelPathForLanguage:(id)a3 error:(id *)a4;
- (id)installedAssetSizeWithError:(id *)a3;
- (id)purgeInstalledAssetsWithError:(id *)a3;
- (id)queryAndCopyInstallationStatusForLangaugesWithError:(id *)a3;
- (void)_cancelDownloadForLangaugeWithError:(id)a3 withError:(id *)a4;
- (void)_fetchRemoteAssetForLanguage:(id)a3;
- (void)_sendDownloadCallbackDictionaryWithLanguage:(id)a3 downloadPhase:(__CFString *)a4 timeRemaining:(float)a5 bytesWritten:(float)a6 bytesTotal:(float)a7 error:(id)a8;
- (void)addPeerForCallback:(id)a3;
- (void)cancelDownloadForLanguage:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)kickCatalogDownloadWithUrgency:(BOOL)a3;
- (void)removePeerFromCallback:(id)a3;
- (void)sendMessageToClient:(__CFDictionary *)a3;
- (void)setCatalogDownloadInProgress:(BOOL)a3;
- (void)setPeersRequestingDownloadProgress:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequestedLanguagesForDownload:(id)a3;
@end

@implementation RDAssetManager

+ (id)sharedInstance
{
  if (qword_10001CE58 != -1) {
    dispatch_once(&qword_10001CE58, &stru_100018808);
  }
  return (id)qword_10001CE50;
}

- (RDAssetManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RDAssetManager;
  v2 = -[RDAssetManager init](&v5, "init");
  if (v2)
  {
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.embeddedspeech.RDAssetManager", 0LL);
    -[RDAssetManager setCatalogDownloadInProgress:](v2, "setCatalogDownloadInProgress:", 0LL);
    -[RDAssetManager setRequestedLanguagesForDownload:]( v2,  "setRequestedLanguagesForDownload:",  +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[RDAssetManager setPeersRequestingDownloadProgress:]( v2,  "setPeersRequestingDownloadProgress:",  +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[NSDate timeIntervalSinceReferenceDate]( +[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"),  "timeIntervalSinceReferenceDate");
    v2->_lastCatalogDownload = v3;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RDAssetManager;
  -[RDAssetManager dealloc](&v3, "dealloc");
}

- (void)kickCatalogDownloadWithUrgency:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100006768;
  v4[3] = &unk_100018880;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (id)copyInstallationStatusForLangaugesWithError:(id *)a3
{
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3052000000LL;
  v17 = sub_100006CB0;
  v18 = sub_100006CC0;
  uint64_t v19 = 0LL;
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x3052000000LL;
  v11 = sub_100006CB0;
  v12 = sub_100006CC0;
  uint64_t v13 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006CCC;
  block[3] = &unk_1000188A8;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(queue, block);
  if (a3) {
    *a3 = (id)v9[5];
  }
  BOOL v5 = (void *)v15[5];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);
  return v5;
}

- (id)queryAndCopyInstallationStatusForLangaugesWithError:(id *)a3
{
  id v5 = +[RDAssetManager _assetQueryForLanguage:](&OBJC_CLASS___RDAssetManager, "_assetQueryForLanguage:", 0LL);
  if (!v5)
  {
    uint64_t v10 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Could not create asset query!", buf, 2u);
    }

    return 0LL;
  }

  v6 = v5;
  [v5 returnTypes:1];
  [v6 setDoNotBlockBeforeFirstUnlock:1];
  [v6 setDoNotBlockOnNetworkStatus:1];
  id v7 = [v6 queryMetaDataSync];
  if (v7)
  {
    id v8 = v7;
    if (v7 == (id)2)
    {
      v9 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Could not find catalog! Attempting to kick off download...",  buf,  2u);
      }

      -[RDAssetManager kickCatalogDownloadWithUrgency:](self, "kickCatalogDownloadWithUrgency:", 1LL);
    }

    else
    {
      v38 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v50 = -[RDAssetManager _errorStringForQueryResult:](self, "_errorStringForQueryResult:", v8);
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "MobileAsset query failed : error = %@",  buf,  0xCu);
      }

      if (a3)
      {
        v55 = @"MAQueryResult";
        id v56 = -[RDAssetManager _errorStringForQueryResult:](self, "_errorStringForQueryResult:", v8);
        *a3 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kRXAssetDownloadErrorDomain",  101LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
      }
    }

    return 0LL;
  }

  v11 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found Catalog!", buf, 2u);
  }

  -[RDAssetManager kickCatalogDownloadWithUrgency:](self, "kickCatalogDownloadWithUrgency:", 0LL);
  id v12 = [v6 results];
  id v13 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  if (v12)
  {
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id v14 = [v12 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v46;
      do
      {
        v17 = 0LL;
        do
        {
          if (*(void *)v46 != v16) {
            objc_enumerationMutation(v12);
          }
          v18 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)v17);
          id v19 = objc_msgSend(v18, "_es_language");
          if ((objc_msgSend(objc_msgSend(v13, "objectForKey:", v19), "hasPrefix:", @"Version:") & 1) == 0)
          {
            id v20 = [v13 objectForKey:v19];
            if (([v20 isEqualToString:@"Installing"] & 1) == 0
              && ([v20 isEqualToString:@"Waiting to Install"] & 1) == 0)
            {
              id v21 = objc_msgSend(v18, "_es_status");
              v22 = @"Installing";
              switch((unint64_t)v21)
              {
                case 0uLL:
                  v22 = @"Not Supported";
                  goto LABEL_25;
                case 1uLL:
                  v22 = @"Not Installing";
                  goto LABEL_25;
                case 2uLL:
                  v22 = @"Waiting to Install";
                  goto LABEL_25;
                case 3uLL:
                  goto LABEL_25;
                case 4uLL:
                  id v40 = objc_msgSend(v18, "_es_quasarDir", @"Installing");
                  id v24 = objc_msgSend(v18, "_es_quasarModelPath");
                  if (objc_msgSend(v18, "_es_isCompatibleWithThisDevice")
                    && sub_1000072E8(v24))
                  {
                    v22 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Version: %@",  v40);
LABEL_25:
                    v23 = v13;
                  }

                  else
                  {
                    v23 = v13;
                    v22 = @"Not Supported";
                  }

                  [v23 setObject:v22 forKey:v19];
                  break;
                default:
                  v22 = @"Unknown";
                  goto LABEL_25;
              }
            }
          }

          v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v25 = [v12 countByEnumeratingWithState:&v45 objects:v54 count:16];
        id v15 = v25;
      }

      while (v25);
    }
  }

  v26 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  v27 = -[NSUserDefaults stringArrayForKey:](v26, "stringArrayForKey:", @"InstalledLanguages");
  if (v27) {
    v28 = v27;
  }
  else {
    v28 = (NSArray *)&__NSArray0__struct;
  }
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v29 = -[NSArray countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v41,  v53,  16LL);
  if (v29)
  {
    id v30 = v29;
    id v31 = 0LL;
    uint64_t v32 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v42 != v32) {
          objc_enumerationMutation(v28);
        }
        uint64_t v34 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)i);
        if (![v13 objectForKey:v34])
        {
          if (!v31) {
            id v31 = -[NSArray mutableCopy](v28, "mutableCopy");
          }
          [v31 removeObject:v34];
        }
      }

      id v30 = -[NSArray countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v41,  v53,  16LL);
    }

    while (v30);
    if (v31)
    {
      v35 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = -[NSArray componentsJoinedByString:](v28, "componentsJoinedByString:", @", ");
        id v37 = objc_msgSend(v31, "componentsJoinedByString:", @", ");
        *(_DWORD *)buf = 138412546;
        v50 = v36;
        __int16 v51 = 2112;
        id v52 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Previously installed offline language(s) removed; installed list: [%@] -> [%@]",
          buf,
          0x16u);
      }

      -[NSUserDefaults setObject:forKey:](v26, "setObject:forKey:", v31, @"InstalledLanguages");
      -[NSUserDefaults synchronize](v26, "synchronize");
    }
  }

  return v13;
}

- (id)copyInstalledAssetPathForLangaugeWithError:(id)a3 error:(id *)a4
{
  id v7 = +[RDAssetManager _assetQueryForLanguage:](&OBJC_CLASS___RDAssetManager, "_assetQueryForLanguage:", 0LL);
  [v7 returnTypes:1];
  id v8 = [v7 queryMetaDataSync];
  if (v8)
  {
    id v9 = v8;
    if (v8 != (id)2)
    {
      uint64_t v10 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = -[RDAssetManager _errorStringForQueryResult:](self, "_errorStringForQueryResult:", v9);
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "MobileAsset query failed for copyInstalledAssetPathForLangaugeWithError : error = %@",  buf,  0xCu);
      }

      if (a4)
      {
        v28 = @"MAQueryResult";
        id v29 = -[RDAssetManager _errorStringForQueryResult:](self, "_errorStringForQueryResult:", v9);
        *a4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kRXAssetDownloadErrorDomain",  101LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
      }
    }

    return 0LL;
  }

  else
  {
    id v12 = [v7 results];
    if (v12
      && (id v13 = v12,
          __int128 v25 = 0u,
          __int128 v26 = 0u,
          __int128 v23 = 0u,
          __int128 v24 = 0u,
          (id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16]) != 0))
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v24;
LABEL_11:
      uint64_t v17 = 0LL;
      while (1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v23 + 1) + 8 * v17);
        id v19 = objc_msgSend(v18, "_es_language");
        id v20 = objc_msgSend(v18, "_es_status");
        if ([v19 isEqualToString:a3] && v20 == (id)4)
        {
          id v11 = objc_msgSend(v18, "_es_quasarModelPath");
          if (objc_msgSend(v18, "_es_isCompatibleWithThisDevice"))
          {
          }
        }

        if (v15 == (id)++v17)
        {
          id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v15) {
            goto LABEL_11;
          }
          goto LABEL_23;
        }
      }
    }

    else
    {
LABEL_23:
      id v11 = 0LL;
    }
  }

  return v11;
}

- (void)cancelDownloadForLanguage:(id)a3 error:(id *)a4
{
  if (a3)
  {
    id v6 = [a3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    *(void *)id v12 = 0LL;
    id v13 = v12;
    uint64_t v14 = 0x3052000000LL;
    id v15 = sub_100006CB0;
    uint64_t v16 = sub_100006CC0;
    uint64_t v17 = 0LL;
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100007918;
    block[3] = &unk_1000188D0;
    block[4] = self;
    block[5] = v6;
    block[6] = v12;
    dispatch_sync(queue, block);
    if (a4)
    {
      *a4 = (id)*((void *)v13 + 5);
      id v8 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = *a4;
        *(_DWORD *)buf = 138412290;
        id v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error in cancelling download: %@", buf, 0xCu);
      }
    }

    _Block_object_dispose(v12, 8);
  }

  else
  {
    uint64_t v10 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Returning nil for nil language", v12, 2u);
    }
  }

- (void)_cancelDownloadForLangaugeWithError:(id)a3 withError:(id *)a4
{
  id v7 = +[RDAssetManager _assetQueryForLanguage:](&OBJC_CLASS___RDAssetManager, "_assetQueryForLanguage:");
  [v7 returnTypes:4];
  id v8 = [v7 queryMetaDataSync];
  id v29 = v7;
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = -[RDAssetManager _errorStringForQueryResult:](self, "_errorStringForQueryResult:", v9);
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "MobileAsset query failed : error = %@",  buf,  0xCu);
    }

    if (a4)
    {
      if (-[RDAssetManager sendCallback](self, "sendCallback"))
      {
        id v11 = -[RDAssetManager _errorStringForQueryResult:](self, "_errorStringForQueryResult:", v9);
        LODWORD(v12) = -1.0;
        LODWORD(v13) = -1.0;
        LODWORD(v14) = -1.0;
        -[RDAssetManager _sendDownloadCallbackDictionaryWithLanguage:downloadPhase:timeRemaining:bytesWritten:bytesTotal:error:]( self,  "_sendDownloadCallbackDictionaryWithLanguage:downloadPhase:timeRemaining:bytesWritten:bytesTotal:error:",  a3,  @"CancelFailed",  v11,  v12,  v13,  v14);
      }

      v35 = @"MAQueryResult";
      id v36 = -[RDAssetManager _errorStringForQueryResult:](self, "_errorStringForQueryResult:", v9);
      *a4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kRXAssetDownloadErrorDomain",  103LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
    }
  }

  else
  {
    id v15 = [v7 results];
    if (v15)
    {
      uint64_t v16 = v15;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      id v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v31;
        do
        {
          for (i = 0LL; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v31 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
            if (objc_msgSend(v21, "_es_isCompatibleWithThisDevice"))
            {
              [v21 refreshState];
              id v22 = [v21 cancelDownloadSync];
              if (v22) {
                __int128 v23 = @"CancelFailed";
              }
              else {
                __int128 v23 = @"Cancelled";
              }
              if (-[RDAssetManager sendCallback](self, "sendCallback"))
              {
                id v24 = objc_msgSend(v21, "_es_language");
                id v25 = -[RDAssetManager _errorStringForCancelDownloadResult:]( self,  "_errorStringForCancelDownloadResult:",  v22);
                LODWORD(v26) = -1.0;
                LODWORD(v27) = -1.0;
                LODWORD(v28) = -1.0;
                -[RDAssetManager _sendDownloadCallbackDictionaryWithLanguage:downloadPhase:timeRemaining:bytesWritten:bytesTotal:error:]( self,  "_sendDownloadCallbackDictionaryWithLanguage:downloadPhase:timeRemaining:bytesWritten:bytesTotal:error:",  v24,  v23,  v25,  v26,  v27,  v28);
              }

              CFRelease(v23);
            }
          }

          id v18 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }

        while (v18);
      }
    }
  }
}

- (id)copyInstalledQuasarModelPathForLanguage:(id)a3 error:(id *)a4
{
  if (a3)
  {
    id v6 = [a3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    *(void *)buf = 0LL;
    id v20 = buf;
    uint64_t v21 = 0x3052000000LL;
    id v22 = sub_100006CB0;
    __int128 v23 = sub_100006CC0;
    uint64_t v24 = 0LL;
    uint64_t v13 = 0LL;
    double v14 = &v13;
    uint64_t v15 = 0x3052000000LL;
    uint64_t v16 = sub_100006CB0;
    id v17 = sub_100006CC0;
    uint64_t v18 = 0LL;
    queue = (dispatch_queue_s *)self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100007E20;
    v12[3] = &unk_1000188F8;
    v12[4] = self;
    v12[5] = v6;
    v12[6] = buf;
    v12[7] = &v13;
    dispatch_sync(queue, v12);
    id v8 = v20;
    id v9 = (void *)*((void *)v20 + 5);
    if (a4 && !v9)
    {
      *a4 = (id)v14[5];
      id v9 = (void *)*((void *)v8 + 5);
    }

    if (v9)
    {
      if (a4)
      {
        *a4 = 0LL;
        id v9 = (void *)*((void *)v8 + 5);
      }
    }

    else if (a4)
    {
      NSErrorUserInfoKey v25 = NSLocalizedFailureReasonErrorKey;
      double v26 = @"No models installed yet";
      id v9 = 0LL;
      *a4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kRXAssetDownloadErrorDomain",  100LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    }

    else
    {
      id v9 = 0LL;
    }

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    uint64_t v10 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Returning no model path for nil language",  buf,  2u);
    }

    return 0LL;
  }

  return v9;
}

- (void)_fetchRemoteAssetForLanguage:(id)a3
{
  id v5 = +[RDAssetManager _assetQueryForLanguage:](&OBJC_CLASS___RDAssetManager, "_assetQueryForLanguage:", a3);
  [v5 returnTypes:2];
  id v6 = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100008034;
  v7[3] = &unk_100018948;
  v7[4] = self;
  v7[5] = v5;
  v7[6] = a3;
  [v5 queryMetaData:v7];
}

- (id)_installedAssetForLanguage:(id)a3 error:(id *)a4
{
  if (!a3)
  {
    uint64_t v15 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Returning no installed asset for nil language",  (uint8_t *)&v20,  2u);
    }

    return 0LL;
  }

  id v7 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  id v8 = -[NSUserDefaults stringArrayForKey:](v7, "stringArrayForKey:", @"InstalledLanguages");
  if (v8) {
    id v9 = v8;
  }
  else {
    id v9 = (NSArray *)&__NSArray0__struct;
  }
  id v10 = -[RDAssetManager _installedLocalAssetForLanguage:error:](self, "_installedLocalAssetForLanguage:error:", a3, a4);
  unsigned int v11 = objc_msgSend(v10, "_es_isInstalled");
  unsigned int v12 = -[NSArray containsObject:](v9, "containsObject:", a3);
  if (!v11)
  {
    if (v12)
    {
      id v16 = -[NSArray mutableCopy](v9, "mutableCopy");
      [v16 removeObject:a3];
      id v17 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412546;
        id v21 = a3;
        __int16 v22 = 2112;
        __int128 v23 = (NSString *)objc_msgSend(v16, "componentsJoinedByString:", @", ");
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Previously installed offline language (%@) removed; installed list is now: [%@]",
          (uint8_t *)&v20,
          0x16u);
      }

      -[NSUserDefaults setObject:forKey:](v7, "setObject:forKey:", v16, @"InstalledLanguages");

      -[NSUserDefaults synchronize](v7, "synchronize");
    }

    if (objc_msgSend(v10, "_es_isDownloading"))
    {
      if (!a4) {
        return 0LL;
      }
    }

    else
    {
      unsigned __int8 v18 = -[RDAssetManager _startedDownloadingEmbeddedSpeechAsset:withUrgency:error:]( self,  "_startedDownloadingEmbeddedSpeechAsset:withUrgency:error:",  v10,  1LL,  a4);
      id v10 = 0LL;
      if (!a4 || (v18 & 1) == 0) {
        return v10;
      }
    }

    id v10 = 0LL;
    *a4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kRXAssetDownloadErrorDomain",  100LL,  0LL);
    return v10;
  }

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = -[NSArray arrayByAddingObject:](v9, "arrayByAddingObject:", a3);
    double v14 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412546;
      id v21 = a3;
      __int16 v22 = 2112;
      __int128 v23 = -[NSArray componentsJoinedByString:](v13, "componentsJoinedByString:", @", ");
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Recording newly installed offline language (%@) installed list is now: [%@]",  (uint8_t *)&v20,  0x16u);
    }

    -[NSUserDefaults setObject:forKey:](v7, "setObject:forKey:", v13, @"InstalledLanguages");
    -[NSUserDefaults synchronize](v7, "synchronize");
  }

  return v10;
}

- (id)_installedAssetFromFoundAssets:(id)a3 language:(id)a4 error:(id *)a5
{
  id v40 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0LL;
    id v9 = 0LL;
    uint64_t v10 = *(void *)v49;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(a3);
        }
        unsigned int v12 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
        if (objc_msgSend(v12, "_es_isCompatibleWithThisDevice", v40))
        {
          uint64_t v13 = v12;
          if (v9)
          {
            if (objc_msgSend(v9, "_es_compareByVersion:", v12) == (id)-1) {
              uint64_t v13 = v12;
            }
            else {
              uint64_t v13 = v9;
            }
          }

          if (objc_msgSend(v12, "_es_isInstalled"))
          {
            if (v8)
            {
              if (objc_msgSend(v8, "_es_compareByVersion:", v12) == (id)-1) {
                id v8 = v12;
              }
            }

            else
            {
              id v8 = v12;
            }
          }

          id v9 = v13;
        }
      }

      id v7 = [a3 countByEnumeratingWithState:&v48 objects:v61 count:16];
    }

    while (v7);
  }

  else
  {
    id v8 = 0LL;
    id v9 = 0LL;
  }

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v44, v60, 16, v40);
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v45;
    do
    {
      for (j = 0LL; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v45 != v16) {
          objc_enumerationMutation(a3);
        }
        unsigned __int8 v18 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)j);
        BOOL v19 = v18 == v9 || v18 == v8;
        if (!v19
          && objc_msgSend( *(id *)(*((void *)&v44 + 1) + 8 * (void)j),  "_es_isCompatibleWithThisDevice"))
        {
          if (objc_msgSend(v18, "_es_isDownloading"))
          {
            id v20 = [v18 cancelDownloadSync];
            if (v20)
            {
              id v21 = v20;
              __int16 v22 = (os_log_s *)RXOSLog();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                id v23 = objc_msgSend(v18, "_es_description");
                id v24 = -[RDAssetManager _errorStringForCancelDownloadResult:]( self,  "_errorStringForCancelDownloadResult:",  v21);
                *(_DWORD *)buf = 138412546;
                id v55 = v23;
                __int16 v56 = 2112;
                id v57 = v24;
                NSErrorUserInfoKey v25 = v22;
                double v26 = "Error canceling download of (%@) before fetching newer version: %@";
LABEL_40:
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x16u);
                continue;
              }
            }
          }

          else if (objc_msgSend(v18, "_es_isInstalled"))
          {
            id v27 = [v18 purgeSync];
            if (v27)
            {
              id v28 = v27;
              id v29 = (os_log_s *)RXOSLog();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                id v30 = objc_msgSend(v18, "_es_description");
                id v31 = -[RDAssetManager _errorStringForPurgeResult:](self, "_errorStringForPurgeResult:", v28);
                *(_DWORD *)buf = 138412546;
                id v55 = v30;
                __int16 v56 = 2112;
                id v57 = v31;
                NSErrorUserInfoKey v25 = v29;
                double v26 = "Error purging (%@) before fetching newer version: %@";
                goto LABEL_40;
              }
            }
          }
        }
      }

      id v15 = [a3 countByEnumeratingWithState:&v44 objects:v60 count:16];
    }

    while (v15);
  }

  __int128 v32 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    id v33 = [a3 count];
    id v34 = objc_msgSend(v9, "_es_description");
    *(_DWORD *)buf = 134218498;
    id v55 = v33;
    __int16 v56 = 2112;
    id v57 = v41;
    __int16 v58 = 2112;
    id v59 = v34;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Found %lu asset(s) for %@, with latest being (%@)",  buf,  0x20u);
  }

  if (v9 && v9 != v8)
  {
    v35 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v55 = v9;
      __int16 v56 = 2048;
      id v57 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Starting a download because %p != %p",  buf,  0x16u);
    }

    if (-[RDAssetManager _startedDownloadingEmbeddedSpeechAsset:withUrgency:error:]( self,  "_startedDownloadingEmbeddedSpeechAsset:withUrgency:error:",  v9,  v8 == 0LL,  a5))
    {
      if (a5)
      {
        uint64_t v36 = 100LL;
        id v37 = 0LL;
LABEL_57:
        *a5 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kRXAssetDownloadErrorDomain",  v36,  v37);
      }
    }

    else if (a5)
    {
      id v38 = *a5;
      if (*a5)
      {
        NSErrorUserInfoKey v52 = NSUnderlyingErrorKey;
        id v53 = v38;
        id v37 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL);
      }

      else
      {
        id v37 = 0LL;
      }

      uint64_t v36 = 101LL;
      goto LABEL_57;
    }
  }

  return v8;
}

- (id)_installedLocalAssetForLanguage:(id)a3 error:(id *)a4
{
  id v7 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int16 v22 = 138412290;
    *(void *)&v22[4] = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@", v22, 0xCu);
  }

  id v8 = +[RDAssetManager _assetQueryForLanguage:](&OBJC_CLASS___RDAssetManager, "_assetQueryForLanguage:", a3);
  [v8 returnTypes:2];
  [v8 setDoNotBlockOnNetworkStatus:1];
  [v8 setDoNotBlockBeforeFirstUnlock:1];
  id v9 = [v8 queryMetaDataSync];
  if (v9)
  {
    id v10 = v9;
    unsigned int v11 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = -[RDAssetManager _errorStringForQueryResult:](self, "_errorStringForQueryResult:", v10);
      *(_DWORD *)__int16 v22 = 138412290;
      *(void *)&v22[4] = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "MobileAsset is having trouble with queryMetaDataSync: %@",  v22,  0xCu);
    }

    if (a4)
    {
      NSErrorUserInfoKey v25 = @"MAQueryResult";
      id v26 = -[RDAssetManager _errorStringForQueryResult:](self, "_errorStringForQueryResult:", v10);
      uint64_t v13 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kRXAssetDownloadErrorDomain",  101LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
      id result = 0LL;
LABEL_8:
      *a4 = v13;
      return result;
    }

    return 0LL;
  }

  id v15 = [v8 results];
  if (!v15)
  {
    id v17 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v22 = 138543618;
      *(void *)&v22[4] = a3;
      __int16 v23 = 2114;
      id v24 = v8;
      unsigned __int8 v18 = "MobileAsset said it succeeded but it didn't for %{public}@: query=%{public}@";
      BOOL v19 = v17;
      uint32_t v20 = 22;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v18, v22, v20);
    }

    return 0LL;
  }

  id v16 = v15;
  if (![v15 count])
  {
    id v21 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v22 = 138412290;
      *(void *)&v22[4] = v8;
      unsigned __int8 v18 = "No assets were found for query: %@";
      BOOL v19 = v21;
      uint32_t v20 = 12;
      goto LABEL_18;
    }

    return 0LL;
  }

  *(void *)__int16 v22 = 0LL;
  id result = -[RDAssetManager _installedAssetFromFoundAssets:language:error:]( self,  "_installedAssetFromFoundAssets:language:error:",  v16,  a3,  v22);
  if (a4 && !result)
  {
    uint64_t v13 = *(NSError **)v22;
    goto LABEL_8;
  }

  return result;
}

+ (id)_assetQueryForLanguage:(id)a3
{
  v4 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }

  id v5 =  [[MAAssetQuery alloc] initWithType:@"com.apple.MobileAsset.EmbeddedSpeech"];
  id v6 = v5;
  if (a3) {
    [v5 addKeyValuePair:@"Language" with:a3];
  }
  return v6;
}

- (BOOL)_startedDownloadingEmbeddedSpeechAsset:(id)a3 withUrgency:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v9 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = objc_msgSend(a3, "_es_description");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Downloading %@", buf, 0xCu);
  }

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000090E8;
  v31[3] = &unk_100018970;
  v31[4] = self;
  v31[5] = a3;
  if (objc_msgSend(a3, "_es_isInstalled"))
  {
    id v10 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Asset is already installed, no need to start download",  buf,  2u);
    }

    LOBYTE(v11) = 1;
  }

  else
  {
    id v12 = [a3 state];
    uint64_t v13 = 0LL;
    unsigned int v11 = 0;
    switch((unint64_t)v12)
    {
      case 1uLL:
        id v30 = 0LL;
        unsigned int v11 = [a3 spaceCheck:&v30];
        id v14 = (os_log_s *)RXOSLog();
        id v15 = v14;
        if (v11)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            id v33 = v30;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Asset requires %lld bytes, starting download",  buf,  0xCu);
          }

          [a3 attachProgressCallBack:v31];
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472LL;
          v29[2] = sub_1000092D8;
          v29[3] = &unk_100018998;
          v29[4] = self;
          v29[5] = a3;
          [a3 startDownload:sub_100006944(v6) then:v29];
          uint64_t v13 = 0LL;
        }

        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134349056;
            id v33 = v30;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Not enough space to download asset, size=%{public}lld",  buf,  0xCu);
          }

          uint64_t v13 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kRXAssetDownloadErrorDomain",  101LL,  &off_10001A070);
          if (-[RDAssetManager sendCallback](self, "sendCallback"))
          {
            id v24 = objc_msgSend(a3, "_es_language");
            LODWORD(v25) = -1.0;
            LODWORD(v26) = -1.0;
            LODWORD(v27) = -1.0;
            -[RDAssetManager _sendDownloadCallbackDictionaryWithLanguage:downloadPhase:timeRemaining:bytesWritten:bytesTotal:error:]( self,  "_sendDownloadCallbackDictionaryWithLanguage:downloadPhase:timeRemaining:bytesWritten:bytesTotal:error:",  v24,  @"DownloadFailed",  @"Not enough space",  v25,  v26,  v27);
          }
        }

        break;
      case 2uLL:
        break;
      case 3uLL:
        unsigned __int8 v18 = (os_log_s *)RXOSLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Asset is no longer in the catalog, purging",  buf,  2u);
        }

        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        v28[2] = sub_10000944C;
        v28[3] = &unk_100018998;
        v28[4] = [a3 description];
        v28[5] = self;
        [a3 purge:v28];
        goto LABEL_17;
      case 4uLL:
        BOOL v19 = (os_log_s *)RXOSLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Asset download is already queued and in progress",  buf,  2u);
        }

        uint64_t v13 = 0LL;
        unsigned int v11 = 1;
        break;
      default:
        id v16 = v12;
        id v17 = (os_log_s *)RXOSLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          id v33 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Unexpected asset state %ld", buf, 0xCu);
        }

- (id)installedAssetSizeWithError:(id *)a3
{
  return sub_100009560(a3, (uint64_t)&stru_1000189D8);
}

- (id)purgeInstalledAssetsWithError:(id *)a3
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3052000000LL;
  unsigned int v11 = sub_100006CB0;
  id v12 = sub_100006CC0;
  uint64_t v13 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100009878;
  v7[3] = &unk_100018A00;
  v7[4] = &v8;
  v4 = sub_100009560(a3, (uint64_t)v7);
  if (a3)
  {
    id v5 = (void *)v9[5];
    if (v5) {
      *a3 = v5;
    }
  }

  _Block_object_dispose(&v8, 8);
  return v4;
}

- (void)addPeerForCallback:(id)a3
{
  peersRequestingDownloadProgress = self->_peersRequestingDownloadProgress;
  objc_sync_enter(peersRequestingDownloadProgress);
  -[NSMutableArray addObject:]( -[RDAssetManager peersRequestingDownloadProgress](self, "peersRequestingDownloadProgress"),  "addObject:",  a3);
  objc_sync_exit(peersRequestingDownloadProgress);
}

- (void)removePeerFromCallback:(id)a3
{
  peersRequestingDownloadProgress = self->_peersRequestingDownloadProgress;
  objc_sync_enter(peersRequestingDownloadProgress);
  -[NSMutableArray removeObject:]( -[RDAssetManager peersRequestingDownloadProgress](self, "peersRequestingDownloadProgress"),  "removeObject:",  a3);
  objc_sync_exit(peersRequestingDownloadProgress);
}

- (BOOL)sendCallback
{
  v2 = self;
  peersRequestingDownloadProgress = self->_peersRequestingDownloadProgress;
  objc_sync_enter(peersRequestingDownloadProgress);
  LOBYTE(v2) = -[NSMutableArray count]( -[RDAssetManager peersRequestingDownloadProgress](v2, "peersRequestingDownloadProgress"),  "count") != 0LL;
  objc_sync_exit(peersRequestingDownloadProgress);
  return (char)v2;
}

- (void)_sendDownloadCallbackDictionaryWithLanguage:(id)a3 downloadPhase:(__CFString *)a4 timeRemaining:(float)a5 bytesWritten:(float)a6 bytesTotal:(float)a7 error:(id)a8
{
  float v41 = a6;
  float valuePtr = a5;
  float v40 = a7;
  Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  if (Mutable)
  {
    uint64_t v13 = Mutable;
    if (a3)
    {
      CFArrayAppendValue(Mutable, a3);
      id v14 = (const __CFDictionary *)RXGetAssetFallbackLocales();
      CFIndex Count = CFDictionaryGetCount(v14);
      if (Count >= 1)
      {
        CFIndex v16 = Count;
        id v17 = (const void **)malloc(8 * Count);
        CFDictionaryGetKeysAndValues(v14, v17, 0LL);
        uint64_t v18 = 0LL;
        CFIndex v39 = v16;
        do
        {
          Value = (const __CFString *)CFDictionaryGetValue(v14, v17[v18]);
          if (Value)
          {
            MutableCFStringRef Copy = CFStringCreateMutableCopy(0LL, 0LL, Value);
            if (MutableCopy)
            {
              id v21 = (__CFString *)MutableCopy;
              __int16 v22 = v14;
              id v23 = a8;
              id v24 = self;
              double v25 = a4;
              v43.length = CFStringGetLength(MutableCopy);
              v43.location = 0LL;
              CFStringFindAndReplace(v21, @"_", @"-", v43, 0LL);
              id v26 = a3;
              if (CFStringCompare(v21, (CFStringRef)a3, 0LL) == kCFCompareEqualTo)
              {
                double v27 = CFStringCreateMutableCopy(0LL, 0LL, (CFStringRef)v17[v18]);
                if (v27)
                {
                  id v28 = (__CFString *)v27;
                  v44.length = CFStringGetLength(v27);
                  v44.location = 0LL;
                  CFStringFindAndReplace(v28, @"_", @"-", v44, 0LL);
                  CFArrayAppendValue(v13, v28);
                  CFRelease(v28);
                }
              }

              CFRelease(v21);
              a3 = v26;
              a4 = v25;
              self = v24;
              a8 = v23;
              id v14 = v22;
              CFIndex v16 = v39;
            }
          }

          ++v18;
        }

        while (v16 != v18);
        free(v17);
      }
    }

    else
    {
      CFArrayAppendValue(Mutable, &stru_100019148);
    }

    CFIndex v29 = CFArrayGetCount(v13);
    if (v29 >= 1)
    {
      CFIndex v30 = v29;
      for (CFIndex i = 0LL; i != v30; ++i)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v13, i);
        id v33 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (CFStringCompare(ValueAtIndex, &stru_100019148, 0LL))
        {
          CFStringRef Copy = CFStringCreateCopy(0LL, ValueAtIndex);
          CFDictionaryAddValue(v33, @"Language", Copy);
          CFRelease(Copy);
        }

        else
        {
          CFDictionaryAddValue(v33, @"Language", kCFNull);
        }

        CFDictionaryAddValue(v33, @"Phase", a4);
        CFNumberRef v35 = CFNumberCreate(0LL, kCFNumberFloatType, &valuePtr);
        CFDictionaryAddValue(v33, @"TimeRemaining", v35);
        CFRelease(v35);
        CFNumberRef v36 = CFNumberCreate(0LL, kCFNumberFloatType, &v41);
        CFDictionaryAddValue(v33, @"BytesWritten", v36);
        CFRelease(v36);
        CFNumberRef v37 = CFNumberCreate(0LL, kCFNumberFloatType, &v40);
        CFDictionaryAddValue(v33, @"BytesTotal", v37);
        CFRelease(v37);
        if (a8)
        {
          CFStringRef v38 = CFStringCreateCopy(0LL, (CFStringRef)a8);
          CFDictionaryAddValue(v33, @"Error", v38);
          CFRelease(v38);
        }

        else
        {
          CFDictionaryAddValue(v33, @"Error", kCFNull);
        }

        -[RDAssetManager sendMessageToClient:](self, "sendMessageToClient:", v33);
        CFRelease(v33);
      }
    }

    CFRelease(v13);
  }

- (void)sendMessageToClient:(__CFDictionary *)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  BOOL v6 = (void *)_CFXPCCreateXPCObjectFromCFObject(a3);
  xpc_dictionary_set_int64(v5, "msg", 601LL);
  xpc_dictionary_set_value(v5, "downloadStatus", v6);
  xpc_release(v6);
  peersRequestingDownloadProgress = self->_peersRequestingDownloadProgress;
  objc_sync_enter(peersRequestingDownloadProgress);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v8 = -[RDAssetManager peersRequestingDownloadProgress](self, "peersRequestingDownloadProgress", 0LL);
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      for (CFIndex i = 0LL; i != v9; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        xpc_connection_send_message(*(xpc_connection_t *)(*((void *)&v12 + 1) + 8LL * (void)i), v5);
      }

      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
  }

  objc_sync_exit(peersRequestingDownloadProgress);
  xpc_release(v5);
}

- (id)_errorStringForCancelDownloadResult:(int64_t)a3
{
  else {
    return *(&off_100018A20 + a3);
  }
}

- (id)_errorStringForDownloadResult:(int64_t)a3
{
  else {
    return *(&off_100018A60 + a3);
  }
}

- (id)_errorStringForQueryResult:(int64_t)a3
{
  else {
    return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Unknown result: %d", a3);
  }
}

- (id)_errorStringForPurgeResult:(int64_t)a3
{
  else {
    return *(&off_100018BE8 + a3);
  }
}

- (id)_stateStringForAsset:(id)a3
{
  id v4 = [a3 state];
  else {
    return *(&off_100018C48 + (void)v4);
  }
}

- (id)_errorStringForMAOperationResult:(int64_t)a3
{
  else {
    return *(&off_100018C80 + a3 - 1);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)requestedLanguagesForDownload
{
  return self->_requestedLanguagesForDownload;
}

- (void)setRequestedLanguagesForDownload:(id)a3
{
}

- (BOOL)catalogDownloadInProgress
{
  return self->_catalogDownloadInProgress;
}

- (void)setCatalogDownloadInProgress:(BOOL)a3
{
  self->_catalogDownloadInProgress = a3;
}

- (NSMutableArray)peersRequestingDownloadProgress
{
  return self->_peersRequestingDownloadProgress;
}

- (void)setPeersRequestingDownloadProgress:(id)a3
{
}

@end