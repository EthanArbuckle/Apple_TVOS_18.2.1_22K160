@interface RDAssetManager2
+ (id)sharedInstance;
- (BOOL)_isActiveDownloadForLanguage:(id)a3 downloadId:(int)a4;
- (BOOL)_isDownloadingForLanguage:(id)a3;
- (BOOL)_isDownloadingStalledForLanguage:(id)a3;
- (BOOL)_sendCallback;
- (BOOL)_startedUrgentDownloadingEmbeddedSpeechAssetForLanguage:(id)a3 error:(id *)a4;
- (NSMutableArray)peersRequestingDownloadProgress;
- (NSMutableDictionary)cachedInstallationStatus;
- (NSMutableDictionary)downloadsEnded;
- (NSMutableDictionary)downloadsStalled;
- (NSMutableDictionary)downloadsStarted;
- (OS_dispatch_queue)mainWorkQueue;
- (OS_dispatch_queue)secondWorkQueue;
- (RDAssetManager2)init;
- (id)_assetPathForLanguage:(id)a3 error:(id *)a4;
- (id)_downloadStatusDescription;
- (id)_installedAssetForLanguage:(id)a3 error:(id *)a4;
- (id)_installedLocalAssetForLanguage:(id)a3 error:(id *)a4;
- (id)_languagesWithDownloadAttempts;
- (id)_queryAndCopyInstallationStatusForLanguagesWithError:(id *)a3;
- (id)copyInstallationStatusForLangaugesWithError:(id *)a3;
- (id)copyInstalledAssetPathForLangaugeWithError:(id)a3 error:(id *)a4;
- (id)copyInstalledAssetPropertiesForLangaugeWithError:(id)a3 error:(id *)a4;
- (id)copyInstalledAssetSupportedTasksForLangaugeWithError:(id)a3 error:(id *)a4;
- (id)copyInstalledQuasarModelPathForLanguage:(id)a3 error:(id *)a4;
- (id)purgeInstalledAssetsWithError:(id *)a3;
- (int)_startDownloadForLanguage:(id)a3;
- (void)_cancelDownloadForLanguageWithError:(id)a3 withError:(id *)a4;
- (void)_endAllDownloadsForLanguage:(id)a3;
- (void)_resumeStalledDownloadForLanguage:(id)a3;
- (void)_sendDownloadCallbackDictionaryWithLanguage:(id)a3 downloadPhase:(__CFString *)a4 timeRemaining:(float)a5 bytesWritten:(float)a6 bytesTotal:(float)a7 error:(id)a8;
- (void)_sendMessageToClient:(__CFDictionary *)a3;
- (void)_stalledDownloadForLanguage:(id)a3;
- (void)addPeerForCallback:(id)a3;
- (void)cancelDownloadForLanguage:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)removePeerFromCallback:(id)a3;
- (void)setCachedInstallationStatus:(id)a3;
- (void)setDownloadsEnded:(id)a3;
- (void)setDownloadsStalled:(id)a3;
- (void)setDownloadsStarted:(id)a3;
- (void)setMainWorkQueue:(id)a3;
- (void)setPeersRequestingDownloadProgress:(id)a3;
- (void)setPurgeabilityForLanguages:(id)a3 withPurgeability:(BOOL)a4 error:(id *)a5;
- (void)setSecondWorkQueue:(id)a3;
@end

@implementation RDAssetManager2

+ (id)sharedInstance
{
  if (qword_10001CE68 != -1) {
    dispatch_once(&qword_10001CE68, &stru_100018CA8);
  }
  return (id)qword_10001CE60;
}

- (RDAssetManager2)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RDAssetManager2;
  v2 = -[RDAssetManager2 init](&v4, "init");
  if (v2)
  {
    v2->_mainWorkQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.embeddedspeech.RDAssetManager2", 0LL);
    v2->_secondWorkQueue = (OS_dispatch_queue *)dispatch_queue_create( "com.apple.embeddedspeech.RDAssetManager2.second",  0LL);
    v2->_downloadsStarted = (NSMutableDictionary *) +[NSMutableDictionary dictionary]( &OBJC_CLASS___NSMutableDictionary,  "dictionary");
    v2->_downloadsStalled = (NSMutableDictionary *) +[NSMutableDictionary dictionary]( &OBJC_CLASS___NSMutableDictionary,  "dictionary");
    v2->_downloadsEnded = (NSMutableDictionary *) +[NSMutableDictionary dictionary]( &OBJC_CLASS___NSMutableDictionary,  "dictionary");
    v2->_peersRequestingDownloadProgress = (NSMutableArray *) +[NSMutableArray array]( &OBJC_CLASS___NSMutableArray,  "array");
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RDAssetManager2;
  -[RDAssetManager2 dealloc](&v3, "dealloc");
}

- (id)_downloadStatusDescription
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"downloadsStarted=%@, downloadsStalled=%@, downloadsEnded=%@ _cachedInstallationStatus=%d",  self->_downloadsStarted,  self->_downloadsStalled,  self->_downloadsEnded,  self->_cachedInstallationStatus != 0LL);
}

- (int)_startDownloadForLanguage:(id)a3
{
  if (a3)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_mainWorkQueue);
    uint64_t v5 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_downloadsStarted,  "objectForKeyedSubscript:",  a3),  "intValue")
       + 1;
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_downloadsStarted,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5),  a3);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_downloadsStalled,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL),  a3);

    self->_cachedInstallationStatus = 0LL;
  }

  else
  {
    v6 = (os_log_s *)RXOSLog();
    LODWORD(v5) = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "nil language", v8, 2u);
      LODWORD(v5) = 0;
    }
  }

  return v5;
}

- (void)_stalledDownloadForLanguage:(id)a3
{
  if (a3)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_mainWorkQueue);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_downloadsStalled,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_downloadsStarted,  "objectForKeyedSubscript:",  a3),  "intValue")
      - objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_downloadsEnded,  "objectForKeyedSubscript:",  a3),  "intValue")),  a3);

    self->_cachedInstallationStatus = 0LL;
  }

  else
  {
    uint64_t v5 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "nil language", v6, 2u);
    }
  }

- (void)_resumeStalledDownloadForLanguage:(id)a3
{
  if (a3)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_mainWorkQueue);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_downloadsStalled,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL),  a3);

    self->_cachedInstallationStatus = 0LL;
  }

  else
  {
    uint64_t v5 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "nil language", v6, 2u);
    }
  }

- (void)_endAllDownloadsForLanguage:(id)a3
{
  if (a3)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_mainWorkQueue);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_downloadsEnded,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](self->_downloadsStarted, "objectForKeyedSubscript:", a3),  "intValue")),  a3);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_downloadsStalled,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL),  a3);

    self->_cachedInstallationStatus = 0LL;
  }

  else
  {
    uint64_t v5 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "nil language", v6, 2u);
    }
  }

- (BOOL)_isDownloadingForLanguage:(id)a3
{
  if (a3)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_mainWorkQueue);
    int v5 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_downloadsStarted,  "objectForKeyedSubscript:",  a3),  "intValue");
    return v5 > (int)objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_downloadsEnded,  "objectForKeyedSubscript:",  a3),  "intValue");
  }

  else
  {
    v7 = (os_log_s *)RXOSLog();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v8)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "nil language", v9, 2u);
      return 0;
    }
  }

  return result;
}

- (BOOL)_isDownloadingStalledForLanguage:(id)a3
{
  if (a3)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_mainWorkQueue);
    return (int)objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_downloadsStalled,  "objectForKeyedSubscript:",  a3),  "intValue") > 0;
  }

  else
  {
    v6 = (os_log_s *)RXOSLog();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v7)
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "nil language", v8, 2u);
      return 0;
    }
  }

  return result;
}

- (BOOL)_isActiveDownloadForLanguage:(id)a3 downloadId:(int)a4
{
  if (a3)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_mainWorkQueue);
    BOOL v7 = -[RDAssetManager2 _isDownloadingForLanguage:](self, "_isDownloadingForLanguage:", a3);
    if (v7) {
      LOBYTE(v7) = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_downloadsStarted,  "objectForKeyedSubscript:",  a3),  "intValue") == a4;
    }
  }

  else
  {
    BOOL v8 = (os_log_s *)RXOSLog();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    LOBYTE(v7) = 0;
    if (v9)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "nil language", v11, 2u);
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (id)_languagesWithDownloadAttempts
{
  return -[NSMutableDictionary allKeys](self->_downloadsStarted, "allKeys");
}

- (id)copyInstallationStatusForLangaugesWithError:(id *)a3
{
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3052000000LL;
  v17 = sub_10000AA28;
  v18 = sub_10000AA38;
  uint64_t v19 = 0LL;
  uint64_t v8 = 0LL;
  BOOL v9 = &v8;
  uint64_t v10 = 0x3052000000LL;
  v11 = sub_10000AA28;
  v12 = sub_10000AA38;
  uint64_t v13 = 0LL;
  mainWorkQueue = (dispatch_queue_s *)self->_mainWorkQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000AA44;
  block[3] = &unk_1000188A8;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(mainWorkQueue, block);
  if (a3) {
    *a3 = (id)v9[5];
  }
  int v5 = (void *)v15[5];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);
  return v5;
}

- (id)_queryAndCopyInstallationStatusForLanguagesWithError:(id *)a3
{
  double v6 = v5 - self->_lastInstallationStatusFetch;
  if (self->_cachedInstallationStatus) {
    BOOL v7 = v6 > 1.0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    *(void *)v63 = 0LL;
    *(void *)&v63[8] = v63;
    *(void *)&v63[16] = 0x3052000000LL;
    v64 = sub_10000AA28;
    v65 = sub_10000AA38;
    uint64_t v66 = 0LL;
    dispatch_time_t v8 = dispatch_time(0LL, 10000000000LL);
    BOOL v9 = dispatch_semaphore_create(0LL);
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472LL;
    v56[2] = sub_10000B110;
    v56[3] = &unk_100018CD0;
    v56[4] = v9;
    v56[5] = v63;
    +[SFSpeechAssetManager installedLanguagesWithCompletion:]( &OBJC_CLASS___SFSpeechAssetManager,  "installedLanguagesWithCompletion:",  v56);
    if (dispatch_semaphore_wait(v9, v8))
    {
      uint64_t v10 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Timed out waiting to get InstalledAssetLanguages. Returning cached copy.",  buf,  2u);
      }

      id v11 = -[NSMutableDictionary copy](self->_cachedInstallationStatus, "copy");
    }

    else
    {
      id v11 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      uint64_t v14 = *(void **)(*(void *)&v63[8] + 40LL);
      id v15 = [v14 countByEnumeratingWithState:&v52 objects:v62 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v53;
        do
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v53 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(void *)(*((void *)&v52 + 1) + 8LL * (void)i);
            id v19 = -[RDAssetManager2 _assetPathForLanguage:error:](self, "_assetPathForLanguage:error:", v18, a3);
            *(void *)buf = 0LL;
            if ([v19 length] && sub_10000D1E0(v19, buf, (uint64_t)@"DictationCC")) {
              [v11 setObject:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"Version: %@", *(void *)buf), v18 forKey];
            }
            else {
              [v11 setObject:@"Not Supported" forKey:v18];
            }
          }

          id v15 = [v14 countByEnumeratingWithState:&v52 objects:v62 count:16];
        }

        while (v15);
      }

      v20 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = -[RDAssetManager2 _downloadStatusDescription](self, "_downloadStatusDescription");
        uint64_t v22 = *(void *)(*(void *)&v63[8] + 40LL);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v21;
        __int16 v60 = 2112;
        uint64_t v61 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "querying, %@, installedAssetLanguages=%@",  buf,  0x16u);
      }

      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      id v23 = -[RDAssetManager2 _languagesWithDownloadAttempts](self, "_languagesWithDownloadAttempts");
      id v24 = [v23 countByEnumeratingWithState:&v48 objects:v58 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v49;
        do
        {
          for (j = 0LL; j != v24; j = (char *)j + 1)
          {
            if (*(void *)v49 != v25) {
              objc_enumerationMutation(v23);
            }
            uint64_t v27 = *(void *)(*((void *)&v48 + 1) + 8LL * (void)j);
            if ((objc_msgSend(objc_msgSend(v11, "objectForKey:", v27), "hasPrefix:", @"Version:") & 1) == 0)
            {
              unsigned __int8 v28 = -[RDAssetManager2 _isDownloadingStalledForLanguage:](self, "_isDownloadingStalledForLanguage:", v27);
              v29 = @"Stalled";
              if ((v28 & 1) != 0
                || (unsigned int v30 = -[RDAssetManager2 _isDownloadingForLanguage:](self, "_isDownloadingForLanguage:", v27),
                    v29 = @"Installing",
                    v30))
              {
                [v11 setObject:v29 forKey:v27];
              }
            }
          }

          id v24 = [v23 countByEnumeratingWithState:&v48 objects:v58 count:16];
        }

        while (v24);
      }

      self->_cachedInstallationStatus = (NSMutableDictionary *)[v11 copy];
      -[NSDate timeIntervalSinceReferenceDate]( +[NSDate date](&OBJC_CLASS___NSDate, "date"),  "timeIntervalSinceReferenceDate");
      self->_lastInstallationStatusFetch = v31;
    }

    _Block_object_dispose(v63, 8);
  }

  else
  {
    v12 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v63 = 134217984;
      *(double *)&v63[4] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Too early since last installation status fetch (%f sec ago). Returning cached copy.",  v63,  0xCu);
    }

    id v11 = -[NSMutableDictionary copy](self->_cachedInstallationStatus, "copy");
  }

  v32 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  v33 = -[NSUserDefaults stringArrayForKey:](v32, "stringArrayForKey:", @"InstalledLanguages");
  if (v33) {
    v34 = v33;
  }
  else {
    v34 = (NSArray *)&__NSArray0__struct;
  }
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v35 = -[NSArray countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v44,  v57,  16LL);
  if (v35)
  {
    id v36 = 0LL;
    uint64_t v37 = *(void *)v45;
    do
    {
      for (k = 0LL; k != v35; k = (char *)k + 1)
      {
        if (*(void *)v45 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)k);
        if (![v11 objectForKey:v39])
        {
          if (!v36) {
            id v36 = -[NSArray mutableCopy](v34, "mutableCopy");
          }
          [v36 removeObject:v39];
        }
      }

      id v35 = -[NSArray countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v44,  v57,  16LL);
    }

    while (v35);
    if (v36)
    {
      v40 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = -[NSArray componentsJoinedByString:](v34, "componentsJoinedByString:", @", ");
        id v42 = objc_msgSend(v36, "componentsJoinedByString:", @", ");
        *(_DWORD *)v63 = 138412546;
        *(void *)&v63[4] = v41;
        *(_WORD *)&v63[12] = 2112;
        *(void *)&v63[14] = v42;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Previously installed offline language(s) removed; installed list: [%@] -> [%@]",
          v63,
          0x16u);
      }

      -[NSUserDefaults setObject:forKey:](v32, "setObject:forKey:", v36, @"InstalledLanguages");
      -[NSUserDefaults synchronize](v32, "synchronize");
    }
  }

  return v11;
}

- (id)copyInstalledAssetPropertiesForLangaugeWithError:(id)a3 error:(id *)a4
{
  if (!a3)
  {
    uint64_t v10 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "nil language", v12, 2u);
    }

    return 0LL;
  }

  if (!objc_msgSend( +[SFSpeechAssetManager installedLanguages]( SFSpeechAssetManager,  "installedLanguages"),  "containsObject:",  a3)) {
    return 0LL;
  }
  id v7 = -[RDAssetManager2 _assetPathForLanguage:error:](self, "_assetPathForLanguage:error:", a3, a4);
  if (![v7 length]) {
    return 0LL;
  }
  dispatch_time_t v8 = 0LL;
  if (sub_10000D1E0(v7, 0LL, (uint64_t)@"DictationCC"))
  {
    dispatch_time_t v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v7, @"Asset Path");
    id v9 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    [v9 addObject:@"DictationCC"];
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v9, @"Asset Supported Tasks");
  }

  return v8;
}

- (id)copyInstalledAssetPathForLangaugeWithError:(id)a3 error:(id *)a4
{
  if (a3)
  {
    id v4 = -[RDAssetManager2 copyInstalledAssetPropertiesForLangaugeWithError:error:]( self,  "copyInstalledAssetPropertiesForLangaugeWithError:error:",  a3,  a4);
    if (v4)
    {
      double v5 = v4;
      id v6 = v4;
      return objc_msgSend(objc_msgSend(v5, "objectForKey:", @"Asset Path"), "copy");
    }
  }

  else
  {
    dispatch_time_t v8 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "nil language", v9, 2u);
    }
  }

  return 0LL;
}

- (id)copyInstalledAssetSupportedTasksForLangaugeWithError:(id)a3 error:(id *)a4
{
  if (a3)
  {
    id v4 = -[RDAssetManager2 copyInstalledAssetPropertiesForLangaugeWithError:error:]( self,  "copyInstalledAssetPropertiesForLangaugeWithError:error:",  a3,  a4);
    if (v4)
    {
      double v5 = v4;
      id v6 = v4;
      return objc_msgSend(objc_msgSend(v5, "objectForKey:", @"Asset Supported Tasks"), "copy");
    }
  }

  else
  {
    dispatch_time_t v8 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "nil language", v9, 2u);
    }
  }

  return 0LL;
}

- (void)cancelDownloadForLanguage:(id)a3 error:(id *)a4
{
  if (a3)
  {
    id v6 = [a3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    *(void *)buf = 0LL;
    id v11 = buf;
    uint64_t v12 = 0x3052000000LL;
    uint64_t v13 = sub_10000AA28;
    uint64_t v14 = sub_10000AA38;
    uint64_t v15 = 0LL;
    mainWorkQueue = (dispatch_queue_s *)self->_mainWorkQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000B4C8;
    block[3] = &unk_1000188D0;
    block[4] = self;
    block[5] = v6;
    block[6] = buf;
    dispatch_sync(mainWorkQueue, block);
    if (a4) {
      *a4 = (id)*((void *)v11 + 5);
    }
    _Block_object_dispose(buf, 8);
  }

  else
  {
    dispatch_time_t v8 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "nil language", buf, 2u);
    }
  }

- (void)_cancelDownloadForLanguageWithError:(id)a3 withError:(id *)a4
{
  id v6 = (os_log_s *)RXOSLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412546;
      id v18 = a3;
      __int16 v19 = 2112;
      id v20 = -[RDAssetManager2 _downloadStatusDescription](self, "_downloadStatusDescription");
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Cancelling asset, language=%@, %@",  buf,  0x16u);
    }

    if (-[RDAssetManager2 _isDownloadingForLanguage:](self, "_isDownloadingForLanguage:", a3))
    {
      if ((objc_msgSend( +[SFSpeechAssetManager installedLanguages]( SFSpeechAssetManager,  "installedLanguages"),  "containsObject:",  a3) & 1) == 0)
      {
        uint64_t v16 = 0LL;
        +[SFSpeechAssetManager purgeAssetsForLanguage:error:]( &OBJC_CLASS___SFSpeechAssetManager,  "purgeAssetsForLanguage:error:",  a3,  &v16);
        -[RDAssetManager2 _endAllDownloadsForLanguage:](self, "_endAllDownloadsForLanguage:", a3);
        dispatch_time_t v8 = (os_log_s *)RXOSLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = v16;
          id v10 = -[RDAssetManager2 _downloadStatusDescription](self, "_downloadStatusDescription");
          *(_DWORD *)buf = 138412802;
          id v18 = a3;
          __int16 v19 = 2112;
          id v20 = v9;
          __int16 v21 = 2112;
          id v22 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Cancelled asset, language=%@ error=%@ %@",  buf,  0x20u);
        }
      }

      id v11 = @"Cancelled";
      uint64_t v12 = @"download cancelled successfully";
    }

    else
    {
      id v11 = @"CancelFailed";
      uint64_t v12 = @"was not downloading";
    }

    if (-[RDAssetManager2 _sendCallback](self, "_sendCallback"))
    {
      LODWORD(v13) = -1.0;
      LODWORD(v14) = -1.0;
      LODWORD(v15) = -1.0;
      -[RDAssetManager2 _sendDownloadCallbackDictionaryWithLanguage:downloadPhase:timeRemaining:bytesWritten:bytesTotal:error:]( self,  "_sendDownloadCallbackDictionaryWithLanguage:downloadPhase:timeRemaining:bytesWritten:bytesTotal:error:",  a3,  v11,  v12,  v13,  v14,  v15);
    }

    CFRelease(v11);
  }

  else if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "nil language", buf, 2u);
  }

- (void)setPurgeabilityForLanguages:(id)a3 withPurgeability:(BOOL)a4 error:(id *)a5
{
  if (a3)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v10 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        double v13 = 0LL;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(a3);
          }
          -[NSMutableSet addObject:]( v9,  "addObject:",  [*(id *)(*((void *)&v24 + 1) + 8 * (void)v13) stringByReplacingOccurrencesOfString:@"_" withString:@"-"]);
          double v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v11);
    }

    *(void *)buf = 0LL;
    __int16 v19 = buf;
    uint64_t v20 = 0x3052000000LL;
    __int16 v21 = sub_10000AA28;
    id v22 = sub_10000AA38;
    uint64_t v23 = 0LL;
    secondWorkQueue = (dispatch_queue_s *)self->_secondWorkQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000B904;
    v16[3] = &unk_100018CF8;
    BOOL v17 = a4;
    v16[4] = v9;
    v16[5] = a3;
    v16[6] = buf;
    dispatch_async(secondWorkQueue, v16);
    if (a5) {
      *a5 = (id)*((void *)v19 + 5);
    }
    _Block_object_dispose(buf, 8);
  }

  else
  {
    double v15 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "nil language", buf, 2u);
    }
  }

- (id)copyInstalledQuasarModelPathForLanguage:(id)a3 error:(id *)a4
{
  if (a3)
  {
    id v6 = [a3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    *(void *)buf = 0LL;
    uint64_t v20 = buf;
    uint64_t v21 = 0x3052000000LL;
    id v22 = sub_10000AA28;
    uint64_t v23 = sub_10000AA38;
    uint64_t v24 = 0LL;
    uint64_t v13 = 0LL;
    double v14 = &v13;
    uint64_t v15 = 0x3052000000LL;
    uint64_t v16 = sub_10000AA28;
    BOOL v17 = sub_10000AA38;
    uint64_t v18 = 0LL;
    mainWorkQueue = (dispatch_queue_s *)self->_mainWorkQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10000BC00;
    v12[3] = &unk_100018D20;
    v12[4] = self;
    v12[5] = v6;
    v12[6] = buf;
    v12[7] = &v13;
    dispatch_sync(mainWorkQueue, v12);
    dispatch_time_t v8 = v20;
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
      __int128 v26 = @"No models installed yet";
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
    id v10 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Returning no model path for nil language",  buf,  2u);
    }

    return 0LL;
  }

  return v9;
}

- (id)_installedAssetForLanguage:(id)a3 error:(id *)a4
{
  if (a3)
  {
    BOOL v7 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
    dispatch_time_t v8 = -[NSUserDefaults stringArrayForKey:](v7, "stringArrayForKey:", @"InstalledLanguages");
    if (v8) {
      id v9 = v8;
    }
    else {
      id v9 = (NSArray *)&__NSArray0__struct;
    }
    id v10 = -[RDAssetManager2 _installedLocalAssetForLanguage:error:]( self,  "_installedLocalAssetForLanguage:error:",  a3,  a4);
    id v11 = [v10 length];
    unsigned int v12 = -[NSArray containsObject:](v9, "containsObject:", a3);
    if (v11)
    {
      if ((v12 & 1) == 0)
      {
        uint64_t v13 = -[NSArray arrayByAddingObject:](v9, "arrayByAddingObject:", a3);
        double v14 = (os_log_s *)RXOSLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 138412546;
          id v21 = a3;
          __int16 v22 = 2112;
          uint64_t v23 = -[NSArray componentsJoinedByString:](v13, "componentsJoinedByString:", @", ");
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Recording newly installed offline language (%@) installed list is now: [%@]",  (uint8_t *)&v20,  0x16u);
        }

        -[NSUserDefaults setObject:forKey:](v7, "setObject:forKey:", v13, @"InstalledLanguages");
        -[NSUserDefaults synchronize](v7, "synchronize");
      }
    }

    else
    {
      if (v12)
      {
        id v16 = -[NSArray mutableCopy](v9, "mutableCopy");
        [v16 removeObject:a3];
        BOOL v17 = (os_log_s *)RXOSLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 138412546;
          id v21 = a3;
          __int16 v22 = 2112;
          uint64_t v23 = (NSString *)objc_msgSend(v16, "componentsJoinedByString:", @", ");
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Previously installed offline language (%@) removed; installed list is now: [%@]",
            (uint8_t *)&v20,
            0x16u);
        }

        -[NSUserDefaults setObject:forKey:](v7, "setObject:forKey:", v16, @"InstalledLanguages");

        -[NSUserDefaults synchronize](v7, "synchronize");
      }

      unsigned int v18 = -[RDAssetManager2 _startedUrgentDownloadingEmbeddedSpeechAssetForLanguage:error:]( self,  "_startedUrgentDownloadingEmbeddedSpeechAssetForLanguage:error:",  a3,  a4);
      id v10 = 0LL;
      if (a4 && v18)
      {
        id v10 = 0LL;
        *a4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kRXAssetDownloadErrorDomain",  100LL,  0LL);
      }
    }
  }

  else
  {
    uint64_t v15 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Returning no installed asset for nil language",  (uint8_t *)&v20,  2u);
    }

    return 0LL;
  }

  return v10;
}

- (id)_assetPathForLanguage:(id)a3 error:(id *)a4
{
  dispatch_time_t v6 = dispatch_time(0LL, 10000000000LL);
  BOOL v7 = dispatch_semaphore_create(0LL);
  uint64_t v17 = 0LL;
  unsigned int v18 = &v17;
  uint64_t v19 = 0x3052000000LL;
  int v20 = sub_10000AA28;
  id v21 = sub_10000AA38;
  uint64_t v22 = 0LL;
  uint64_t v11 = 0LL;
  unsigned int v12 = &v11;
  uint64_t v13 = 0x3052000000LL;
  double v14 = sub_10000AA28;
  uint64_t v15 = sub_10000AA38;
  uint64_t v16 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000C050;
  v10[3] = &unk_100018D88;
  v10[5] = &v11;
  v10[6] = &v17;
  v10[4] = v7;
  +[SFSpeechAssetManager fetchAssetsForLanguage:urgent:progress:completion:]( &OBJC_CLASS___SFSpeechAssetManager,  "fetchAssetsForLanguage:urgent:progress:completion:",  a3,  0LL,  &stru_100018D60,  v10);
  dispatch_semaphore_wait(v7, v6);
  if (a4) {
    *a4 = (id)v12[5];
  }
  id v8 = (id)v18[5];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v8;
}

- (id)_installedLocalAssetForLanguage:(id)a3 error:(id *)a4
{
  if (a3)
  {
    if (objc_msgSend( +[SFSpeechAssetManager installedLanguages]( SFSpeechAssetManager,  "installedLanguages"),  "containsObject:",  a3)) {
      id v7 = -[RDAssetManager2 _assetPathForLanguage:error:](self, "_assetPathForLanguage:error:", a3, a4);
    }
    else {
      id v7 = 0LL;
    }
    id v9 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = a3;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Found asset for %@: (%@)",  (uint8_t *)&v13,  0x16u);
    }

    if (![v7 length]
      || (sub_10000D1E0(v7, 0LL, (uint64_t)@"DictationCC") & 1) == 0)
    {
      id v7 = 0LL;
    }

    if (![v7 length])
    {
      id v10 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Starting a download because no compatible asset is installed",  (uint8_t *)&v13,  2u);
      }

      unsigned int v11 = -[RDAssetManager2 _startedUrgentDownloadingEmbeddedSpeechAssetForLanguage:error:]( self,  "_startedUrgentDownloadingEmbeddedSpeechAssetForLanguage:error:",  a3,  a4);
      if (a4 && v11) {
        *a4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kRXAssetDownloadErrorDomain",  100LL,  0LL);
      }
    }
  }

  else
  {
    id v8 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "nil language", (uint8_t *)&v13, 2u);
    }

    return 0LL;
  }

  return v7;
}

- (BOOL)_startedUrgentDownloadingEmbeddedSpeechAssetForLanguage:(id)a3 error:(id *)a4
{
  if (a3)
  {
    if (-[RDAssetManager2 _isDownloadingForLanguage:](self, "_isDownloadingForLanguage:", a3))
    {
      dispatch_time_t v6 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v7 = "Asset download is already in progress";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      }
    }

    else
    {
      id v8 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
      unsigned int v9 = -[RDAssetManager2 _startDownloadForLanguage:](self, "_startDownloadForLanguage:", a3);
      id v10 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v19 = a3;
        __int16 v20 = 1024;
        unsigned int v21 = v9;
        __int16 v22 = 2112;
        id v23 = -[RDAssetManager2 _downloadStatusDescription](self, "_downloadStatusDescription");
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Downloading asset, language=%@ downloadId=%d %@",  buf,  0x1Cu);
      }

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_10000C480;
      v15[3] = &unk_100018DD8;
      v15[4] = self;
      v15[5] = a3;
      v15[6] = v8;
      unsigned int v16 = v9;
      int v17 = 1307470632;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_10000C7CC;
      v12[3] = &unk_100018E28;
      v12[4] = self;
      v12[5] = a3;
      unsigned int v13 = v9;
      int v14 = 1307470632;
      +[SFSpeechAssetManager fetchAssetsForLanguage:urgent:forceUpgrade:detailedProgress:completion:]( &OBJC_CLASS___SFSpeechAssetManager,  "fetchAssetsForLanguage:urgent:forceUpgrade:detailedProgress:completion:",  a3,  1LL,  1LL,  v15,  v12);
    }
  }

  else
  {
    dispatch_time_t v6 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v7 = "nil language";
      goto LABEL_7;
    }
  }

  return a3 != 0LL;
}

- (id)purgeInstalledAssetsWithError:(id *)a3
{
  return 0LL;
}

- (void)addPeerForCallback:(id)a3
{
  peersRequestingDownloadProgress = self->_peersRequestingDownloadProgress;
  objc_sync_enter(peersRequestingDownloadProgress);
  -[NSMutableArray addObject:]( -[RDAssetManager2 peersRequestingDownloadProgress](self, "peersRequestingDownloadProgress"),  "addObject:",  a3);
  objc_sync_exit(peersRequestingDownloadProgress);
}

- (void)removePeerFromCallback:(id)a3
{
  peersRequestingDownloadProgress = self->_peersRequestingDownloadProgress;
  objc_sync_enter(peersRequestingDownloadProgress);
  -[NSMutableArray removeObject:]( -[RDAssetManager2 peersRequestingDownloadProgress](self, "peersRequestingDownloadProgress"),  "removeObject:",  a3);
  objc_sync_exit(peersRequestingDownloadProgress);
}

- (BOOL)_sendCallback
{
  v2 = self;
  peersRequestingDownloadProgress = self->_peersRequestingDownloadProgress;
  objc_sync_enter(peersRequestingDownloadProgress);
  LOBYTE(v2) = -[NSMutableArray count]( -[RDAssetManager2 peersRequestingDownloadProgress](v2, "peersRequestingDownloadProgress"),  "count") != 0LL;
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
    unsigned int v13 = Mutable;
    if (a3)
    {
      CFArrayAppendValue(Mutable, a3);
      int v14 = (const __CFDictionary *)RXGetAssetFallbackLocales();
      CFIndex Count = CFDictionaryGetCount(v14);
      if (Count >= 1)
      {
        CFIndex v16 = Count;
        int v17 = (const void **)malloc(8 * Count);
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
              unsigned int v21 = (__CFString *)MutableCopy;
              __int16 v22 = v14;
              id v23 = a8;
              uint64_t v24 = self;
              NSErrorUserInfoKey v25 = a4;
              v43.length = CFStringGetLength(MutableCopy);
              v43.location = 0LL;
              CFStringFindAndReplace(v21, @"_", @"-", v43, 0LL);
              id v26 = a3;
              if (CFStringCompare(v21, (CFStringRef)a3, 0LL) == kCFCompareEqualTo)
              {
                __int128 v27 = CFStringCreateMutableCopy(0LL, 0LL, (CFStringRef)v17[v18]);
                if (v27)
                {
                  unsigned __int8 v28 = (__CFString *)v27;
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
              int v14 = v22;
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
        v33 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
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

        -[RDAssetManager2 _sendMessageToClient:](self, "_sendMessageToClient:", v33);
        CFRelease(v33);
      }
    }

    CFRelease(v13);
  }

- (void)_sendMessageToClient:(__CFDictionary *)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  dispatch_time_t v6 = (void *)_CFXPCCreateXPCObjectFromCFObject(a3);
  xpc_dictionary_set_int64(v5, "msg", 601LL);
  xpc_dictionary_set_value(v5, "downloadStatus", v6);
  xpc_release(v6);
  peersRequestingDownloadProgress = self->_peersRequestingDownloadProgress;
  objc_sync_enter(peersRequestingDownloadProgress);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v8 = -[RDAssetManager2 peersRequestingDownloadProgress](self, "peersRequestingDownloadProgress", 0LL);
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

- (OS_dispatch_queue)mainWorkQueue
{
  return self->_mainWorkQueue;
}

- (void)setMainWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)secondWorkQueue
{
  return self->_secondWorkQueue;
}

- (void)setSecondWorkQueue:(id)a3
{
}

- (NSMutableDictionary)downloadsStarted
{
  return self->_downloadsStarted;
}

- (void)setDownloadsStarted:(id)a3
{
}

- (NSMutableDictionary)downloadsStalled
{
  return self->_downloadsStalled;
}

- (void)setDownloadsStalled:(id)a3
{
}

- (NSMutableDictionary)downloadsEnded
{
  return self->_downloadsEnded;
}

- (void)setDownloadsEnded:(id)a3
{
}

- (NSMutableDictionary)cachedInstallationStatus
{
  return self->_cachedInstallationStatus;
}

- (void)setCachedInstallationStatus:(id)a3
{
}

- (NSMutableArray)peersRequestingDownloadProgress
{
  return self->_peersRequestingDownloadProgress;
}

- (void)setPeersRequestingDownloadProgress:(id)a3
{
}

@end