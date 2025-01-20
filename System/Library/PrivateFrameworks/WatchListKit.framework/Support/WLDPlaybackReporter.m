@interface WLDPlaybackReporter
+ (id)_cachedMetadataByIdentifier;
+ (id)_cachedNotFoundIdentifiers;
+ (void)_decorateVODSummary:(id)a3 completion:(id)a4;
- (WLDPlaybackReporter)initWithSessionID:(id)a3;
- (void)_cleanupWithSuccess:(BOOL)a3 error:(id)a4 completion:(id)a5;
- (void)_clearBDTimer;
- (void)_reportPlayEvent:(id)a3 summary:(id)a4 completion:(id)a5;
- (void)_scheduleTimedReportForSummary:(id)a3 afterMillis:(id)a4;
- (void)dealloc;
- (void)getCachedCanonicalIDForSummary:(id)a3 completionHandler:(id)a4;
- (void)reportPlayback:(id)a3 completion:(id)a4;
@end

@implementation WLDPlaybackReporter

- (WLDPlaybackReporter)initWithSessionID:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___WLDPlaybackReporter;
  v6 = -[WLDPlaybackReporter init](&v11, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sessionID, a3);
  }
  uint64_t v8 = WLKPlaybackTrackingLogObject();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "WLDPlaybackReporter - %@ init:", buf, 0xCu);
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v3 = WLKPlaybackTrackingLogObject(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    sessionID = self->_sessionID;
    *(_DWORD *)buf = 138412546;
    uint64_t v8 = self;
    __int16 v9 = 2112;
    v10 = sessionID;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - %@ dealloc: sessionID: %@",  buf,  0x16u);
  }

  -[WLDPlaybackReporter _clearBDTimer](self, "_clearBDTimer");
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___WLDPlaybackReporter;
  -[WLDPlaybackReporter dealloc](&v6, "dealloc");
}

- (void)reportPlayback:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = self;
  objc_sync_enter(v9);
  v10 = -[WLKTransactionScope initWithIdentifier:]( objc_alloc(&OBJC_CLASS___WLKTransactionScope),  "initWithIdentifier:",  @"WLDPlaybackReporter.reportPlayback");
  transaction = v9->_transaction;
  v9->_transaction = v10;

  objc_storeStrong((id *)&v9->_lastSummary, a3);
  uint64_t v13 = WLKPlaybackTrackingLogObject(v12);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[WLKPlaybackSummary debugStringForPlaybackState:]( &OBJC_CLASS___WLKPlaybackSummary,  "debugStringForPlaybackState:",  -[WLKPlaybackSummary playbackState](v9->_lastSummary, "playbackState")));
    *(_DWORD *)buf = 138412546;
    v22 = v9;
    __int16 v23 = 2112;
    v24 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - %@ Begin Transaction: setLastSummary playbackState %@",  buf,  0x16u);
  }

  objc_sync_exit(v9);
  -[WLDPlaybackReporter _clearBDTimer](v9, "_clearBDTimer");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = __49__WLDPlaybackReporter_reportPlayback_completion___block_invoke;
  v18[3] = &unk_10003D1E0;
  id v19 = v7;
  id v20 = v8;
  v18[4] = v9;
  id v16 = v7;
  id v17 = v8;
  [v16 resolveChannelID:v18];
}

void __49__WLDPlaybackReporter_reportPlayback_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([a1[5] contentID]);
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([a1[5] duration]);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[WLKPlayActivityDecorateVODOperation identifierForPlayActivityID:channelID:duration:]( &OBJC_CLASS___WLKPlayActivityDecorateVODOperation,  "identifierForPlayActivityID:channelID:duration:",  v8,  v5,  v9));

    if ([v10 length])
    {
      uint64_t v12 = (void *)objc_opt_class(a1[4], v11);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = __49__WLDPlaybackReporter_reportPlayback_completion___block_invoke_8;
      v21[3] = &unk_10003D1B8;
      id v13 = a1[5];
      v21[4] = a1[4];
      id v23 = a1[6];
      id v22 = a1[5];
      [v12 _decorateVODSummary:v13 completion:v21];
    }

    else
    {
      uint64_t v16 = WLKPlaybackTrackingLogObject(0LL);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - Error: could not resolve lookupID for %@",  buf,  0xCu);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"could not resolve lookupID for %@",  v5));
      uint64_t v19 = WLKError(0LL, 0LL, v18);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

      [a1[4] _cleanupWithSuccess:0 error:v20 completion:a1[6]];
    }
  }

  else
  {
    uint64_t v14 = WLKPlaybackTrackingLogObject(v6);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - Error: Failed to resolve channelID %@",  buf,  0xCu);
    }

    [a1[4] _cleanupWithSuccess:0 error:v7 completion:a1[6]];
  }
}

void __49__WLDPlaybackReporter_reportPlayback_completion___block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___UWLPlayEvent);
    uint64_t v7 = WLKPlaybackTrackingLogObject(v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      int v38 = 138412802;
      uint64_t v39 = v9;
      __int16 v40 = 2048;
      v41 = v6;
      __int16 v42 = 2048;
      uint64_t v43 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - %@ Report playback activity:%p summary:%p",  (uint8_t *)&v38,  0x20u);
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleID]);
    -[UWLPlayEvent setBundleId:](v6, "setBundleId:", v11);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) externalProfileID]);
    -[UWLPlayEvent setProfileId:](v6, "setProfileId:", v12);

    -[UWLPlayEvent setExternalPlayableId:](v6, "setExternalPlayableId:", &stru_10003F7E0);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) elapsedTime]);
    [v13 doubleValue];
    -[UWLPlayEvent setPlayHeadInMilliseconds:](v6, "setPlayHeadInMilliseconds:", llround(v14 * 1000.0));

    v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) duration]);
    [v15 doubleValue];
    -[UWLPlayEvent setMediaLengthInMilliseconds:](v6, "setMediaLengthInMilliseconds:", llround(v16 * 1000.0));

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) timestamp]);
    [v17 timeIntervalSinceDate:v18];
    -[UWLPlayEvent setMillisecondsSinceEvent:](v6, "setMillisecondsSinceEvent:", llround(v19 * 1000.0));

    else {
      uint64_t v20 = 1LL;
    }
    -[UWLPlayEvent setContractOrTimed:](v6, "setContractOrTimed:", v20);
    v21 = objc_alloc_init(&OBJC_CLASS___UWLSectionInfo);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) featureDuration]);

    id v23 = *(void **)(a1 + 40);
    if (v22)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 featureDuration]);
    }

    else
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v23 duration]);

      if (!v25) {
        goto LABEL_13;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) duration]);
    }

    v26 = v24;
    [v24 doubleValue];
    -[UWLSectionInfo setLengthInMilliseconds:](v21, "setLengthInMilliseconds:", llround(v27 * 1000.0));

LABEL_13:
    v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) featureElapsedTime]);

    v29 = *(void **)(a1 + 40);
    if (v28)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([v29 featureElapsedTime]);
    }

    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue([v29 elapsedTime]);

      if (!v31) {
        goto LABEL_18;
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) elapsedTime]);
    }

    v32 = v30;
    [v30 doubleValue];
    -[UWLSectionInfo setPlayheadInMilliseconds:](v21, "setPlayheadInMilliseconds:", llround(v33 * 1000.0));

LABEL_18:
    id v34 = [*(id *)(a1 + 40) completionState];
    if (v34 == (id)1)
    {
      uint64_t v35 = 0LL;
    }

    else
    {
      if (v34 != (id)2)
      {
LABEL_23:
        v36 = (void *)objc_claimAutoreleasedReturnValue([v5 nowPlayingPassThrough]);
        -[UWLSectionInfo setPassThrough:](v21, "setPassThrough:", v36);

        -[UWLPlayEvent setMainContentInfo:](v6, "setMainContentInfo:", v21);
        [*(id *)(a1 + 32) _reportPlayEvent:v6 summary:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
        objc_msgSend( (id)objc_opt_class(*(void *)(a1 + 32), v37),  "_donateIntentWithPlaybackSummary:andMetadata:",  *(void *)(a1 + 40),  v5);

        goto LABEL_24;
      }

      uint64_t v35 = 1LL;
    }

    -[UWLSectionInfo setIsDone:](v21, "setIsDone:", v35);
    goto LABEL_23;
  }

  [*(id *)(a1 + 32) _cleanupWithSuccess:0 error:a3 completion:*(void *)(a1 + 48)];
LABEL_24:
}

- (void)getCachedCanonicalIDForSummary:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __72__WLDPlaybackReporter_getCachedCanonicalIDForSummary_completionHandler___block_invoke;
  v9[3] = &unk_10003CE88;
  uint64_t v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  [v7 resolveChannelID:v9];
}

void __72__WLDPlaybackReporter_getCachedCanonicalIDForSummary_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 length])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) duration]);
    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) contentID]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v7 integerValue]));
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[WLKPlayActivityDecorateVODOperation identifierForPlayActivityID:channelID:duration:]( &OBJC_CLASS___WLKPlayActivityDecorateVODOperation,  "identifierForPlayActivityID:channelID:duration:",  v8,  v5,  v9));

      if ([v10 length])
      {
        id v12 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 40), v11), "_cachedMetadataByIdentifier");
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v10]);

        uint64_t v16 = WLKPlaybackTrackingLogObject(v15);
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v18)
          {
            double v19 = *(void **)(a1 + 40);
            int v37 = 138412546;
            id v38 = v19;
            __int16 v39 = 2112;
            __int16 v40 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - %@ Returning cached metadata for %@.",  (uint8_t *)&v37,  0x16u);
          }

          uint64_t v20 = *(void *)(a1 + 48);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v14 canonicalID]);
          (*(void (**)(uint64_t, void *, void))(v20 + 16))(v20, v21, 0LL);
        }

        else
        {
          if (v18)
          {
            id v34 = *(void **)(a1 + 40);
            int v37 = 138412546;
            id v38 = v34;
            __int16 v39 = 2112;
            __int16 v40 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - %@ Cached metadata not found for %@.",  (uint8_t *)&v37,  0x16u);
          }

          uint64_t v35 = *(void *)(a1 + 48);
          uint64_t v36 = WLKError(0LL, 0LL, @"Could not find cached metadata.");
          v21 = (void *)objc_claimAutoreleasedReturnValue(v36);
          (*(void (**)(uint64_t, void, void *))(v35 + 16))(v35, 0LL, v21);
        }
      }

      else
      {
        uint64_t v29 = WLKPlaybackTrackingLogObject(0LL);
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleID]);
          int v37 = 138412290;
          id v38 = v31;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - Error: could not resolve lookupID for %@",  (uint8_t *)&v37,  0xCu);
        }

        uint64_t v32 = *(void *)(a1 + 48);
        uint64_t v33 = WLKError(1LL, 0LL, @"Could not resolve lookupID.");
        double v14 = (void *)objc_claimAutoreleasedReturnValue(v33);
        (*(void (**)(uint64_t, void, void *))(v32 + 16))(v32, 0LL, v14);
      }
    }

    else
    {
      uint64_t v24 = WLKPlaybackTrackingLogObject(0LL);
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleID]);
        int v37 = 138412290;
        id v38 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - Error: Nil duration found in playback summary for %@",  (uint8_t *)&v37,  0xCu);
      }

      uint64_t v27 = *(void *)(a1 + 48);
      uint64_t v28 = WLKError(1LL, 0LL, @"Nil duration found in playback summary");
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v28);
      (*(void (**)(uint64_t, void, void *))(v27 + 16))(v27, 0LL, v10);
    }
  }

  else
  {
    uint64_t v22 = WLKPlaybackTrackingLogObject(0LL);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 138412290;
      id v38 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - Error: Failed to resolve channelID %@",  (uint8_t *)&v37,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

+ (id)_cachedMetadataByIdentifier
{
  if (_cachedMetadataByIdentifier___once != -1) {
    dispatch_once(&_cachedMetadataByIdentifier___once, &__block_literal_global_4);
  }
  return (id)_cachedMetadataByIdentifier___cachedMetadataByIdentifier;
}

void __50__WLDPlaybackReporter__cachedMetadataByIdentifier__block_invoke(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___WLKCache);
  v2 = (void *)_cachedMetadataByIdentifier___cachedMetadataByIdentifier;
  _cachedMetadataByIdentifier___cachedMetadataByIdentifier = (uint64_t)v1;

  [(id)_cachedMetadataByIdentifier___cachedMetadataByIdentifier setCountLimit:5];
}

+ (id)_cachedNotFoundIdentifiers
{
  if (_cachedNotFoundIdentifiers___once != -1) {
    dispatch_once(&_cachedNotFoundIdentifiers___once, &__block_literal_global_25_1);
  }
  return (id)_cachedNotFoundIdentifiers___cachedNotFoundIdentifiers;
}

void __49__WLDPlaybackReporter__cachedNotFoundIdentifiers__block_invoke(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v2 = (void *)_cachedNotFoundIdentifiers___cachedNotFoundIdentifiers;
  _cachedNotFoundIdentifiers___cachedNotFoundIdentifiers = (uint64_t)v1;
}

+ (void)_decorateVODSummary:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __54__WLDPlaybackReporter__decorateVODSummary_completion___block_invoke;
  v8[3] = &unk_10003D248;
  id v9 = a3;
  id v10 = a4;
  id v11 = a1;
  id v6 = v9;
  id v7 = v10;
  [v6 resolveChannelID:v8];
}

void __54__WLDPlaybackReporter__decorateVODSummary_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 length])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) duration]);
    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) contentID]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v7 integerValue]));
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[WLKPlayActivityDecorateVODOperation identifierForPlayActivityID:channelID:duration:]( &OBJC_CLASS___WLKPlayActivityDecorateVODOperation,  "identifierForPlayActivityID:channelID:duration:",  v8,  v5,  v9));

      if ([v10 length])
      {
        id v12 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 48), v11), "_cachedMetadataByIdentifier");
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v10]);

        if (v14)
        {
          uint64_t v17 = WLKPlaybackTrackingLogObject(v15);
          BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            double v19 = *(void **)(a1 + 48);
            *(_DWORD *)buf = 138412546;
            id v55 = v19;
            __int16 v56 = 2112;
            v57 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - %@ Returning cached metadata for %@.",  buf,  0x16u);
          }

          (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
        }

        else
        {
          id v32 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 48), v16), "_cachedNotFoundIdentifiers");
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
          unsigned int v34 = [v33 containsObject:v10];

          if (v34)
          {
            uint64_t v36 = WLKPlaybackTrackingLogObject(v35);
            int v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v55 = v10;
              _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - Item with identifier %@ is known to be unavailable.",  buf,  0xCu);
            }

            uint64_t v38 = *(void *)(a1 + 40);
            uint64_t v39 = WLKError(0LL, 0LL, @"Item is not available.");
            __int16 v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
            (*(void (**)(uint64_t, void, void *))(v38 + 16))(v38, 0LL, v40);
          }

          else
          {
            id v41 = objc_alloc(&OBJC_CLASS___WLKPlayActivityDecorateVODOperation);
            __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) contentID]);
            uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v7 integerValue]));
            id v44 = [v41 initWithExternalId:v42 brandId:v5 hlsAssetDuration:v43];

            objc_initWeak((id *)buf, v44);
            v47 = _NSConcreteStackBlock;
            uint64_t v48 = 3221225472LL;
            v49 = __54__WLDPlaybackReporter__decorateVODSummary_completion___block_invoke_29;
            v50 = &unk_10003CED8;
            objc_copyWeak(v53, (id *)buf);
            v53[1] = *(id *)(a1 + 48);
            id v51 = v10;
            id v52 = *(id *)(a1 + 40);
            [v44 setCompletionBlock:&v47];
            id v45 = WLDOperationQueue();
            v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
            objc_msgSend(v46, "addOperation:", v44, v47, v48, v49, v50);

            objc_destroyWeak(v53);
            objc_destroyWeak((id *)buf);
          }
        }
      }

      else
      {
        uint64_t v27 = WLKPlaybackTrackingLogObject(0LL);
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleID]);
          *(_DWORD *)buf = 138412290;
          id v55 = v29;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - Error: could not resolve lookupID for %@",  buf,  0xCu);
        }

        uint64_t v30 = *(void *)(a1 + 40);
        uint64_t v31 = WLKError(1LL, 0LL, @"Could not resolve lookupID.");
        double v14 = (void *)objc_claimAutoreleasedReturnValue(v31);
        (*(void (**)(uint64_t, void, void *))(v30 + 16))(v30, 0LL, v14);
      }
    }

    else
    {
      uint64_t v22 = WLKPlaybackTrackingLogObject(0LL);
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleID]);
        *(_DWORD *)buf = 138412290;
        id v55 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - Error: Nil duration found in playback summary for %@",  buf,  0xCu);
      }

      uint64_t v25 = *(void *)(a1 + 40);
      uint64_t v26 = WLKError(1LL, 0LL, @"Nil duration found in playback summary");
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v26);
      (*(void (**)(uint64_t, void, void *))(v25 + 16))(v25, 0LL, v10);
    }
  }

  else
  {
    uint64_t v20 = WLKPlaybackTrackingLogObject(0LL);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v55 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - Error: Failed to resolve channelID %@",  buf,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void __54__WLDPlaybackReporter__decorateVODSummary_completion___block_invoke_29(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained error]);

  if (v3)
  {
    uint64_t v5 = WLKPlaybackTrackingLogObject(v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (char *)objc_claimAutoreleasedReturnValue([WeakRetained error]);
      int v33 = 138412290;
      unsigned int v34 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - Activity lookup failed: %@",  (uint8_t *)&v33,  0xCu);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained httpResponse]);
    id v9 = (char *)[v8 statusCode];

    if ((unint64_t)(v9 - 400) <= 0x63)
    {
      uint64_t v11 = WLKPlaybackTrackingLogObject(v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 134217984;
        unsigned int v34 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - Activity lookup got a %ld. We will not retry.",  (uint8_t *)&v33,  0xCu);
      }

      id v14 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 56), v13), "_cachedNotFoundIdentifiers");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      [v15 addObject:*(void *)(a1 + 32)];
    }

    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained error]);
    (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0LL, v17);
  }

  else
  {
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained metadataByIdentifier]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:*(void *)(a1 + 32)]);

    uint64_t v20 = WLKPlaybackTrackingLogObject(v19);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v22)
      {
        id v23 = *(char **)(a1 + 56);
        uint64_t v24 = *(void *)(a1 + 32);
        int v33 = 138412546;
        unsigned int v34 = v23;
        __int16 v35 = 2112;
        uint64_t v36 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - %@ Got metadata for %@.",  (uint8_t *)&v33,  0x16u);
      }

      id v26 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 56), v25), "_cachedMetadataByIdentifier");
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      [v27 setObject:v17 forKey:*(void *)(a1 + 32)];

      uint64_t v28 = *(void *)(a1 + 40);
      uint64_t v29 = *(void (**)(uint64_t, void *, void))(v28 + 16);
      uint64_t v30 = v17;
    }

    else
    {
      if (v22)
      {
        uint64_t v31 = *(char **)(a1 + 56);
        uint64_t v32 = *(void *)(a1 + 32);
        int v33 = 138412546;
        unsigned int v34 = v31;
        __int16 v35 = 2112;
        uint64_t v36 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - %@ Metadata not found even after successfully receiving response from backend for %@.",  (uint8_t *)&v33,  0x16u);
      }

      uint64_t v28 = *(void *)(a1 + 40);
      uint64_t v29 = *(void (**)(uint64_t, void *, void))(v28 + 16);
      uint64_t v30 = 0LL;
    }

    v29(v28, v30, 0LL);
  }
}

- (void)_reportPlayEvent:(id)a3 summary:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_alloc(&OBJC_CLASS___WLDPlayActivityReportOperation);
  id v44 = v8;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v44, 1LL));
  uint64_t v13 = -[WLDPlayActivityReportOperation initWithPlayEvents:](v11, "initWithPlayEvents:", v12);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ams_activeiTunesAccount"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ams_DSID"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 stringValue]);

  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v9 accountID]);
  id v19 = v17;
  id v20 = v18;
  v21 = v20;
  if (v19 == v20)
  {

    uint64_t v24 = v19;
LABEL_11:

    goto LABEL_12;
  }

  if (!v19 || !v20)
  {

    goto LABEL_8;
  }

  unsigned __int8 v22 = [v19 isEqual:v20];

  if ((v22 & 1) == 0)
  {
LABEL_8:
    uint64_t v25 = WLKPlaybackTrackingLogObject(v23);
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v39 = self;
      __int16 v40 = 2112;
      id v41 = v19;
      __int16 v42 = 2112;
      uint64_t v43 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - %@: Note: DSID mismatch. Active:%@ Summary:%@",  buf,  0x20u);
    }

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v21 longLongValue]));
    -[WLDPlayActivityReportOperation setDSID:](v13, "setDSID:", v24);
    goto LABEL_11;
  }

void __59__WLDPlaybackReporter__reportPlayEvent_summary_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained error]);

  if (!v2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained nextExpectedReportMillis]);
    [v3 _scheduleTimedReportForSummary:v4 afterMillis:v5];
  }

  id v6 = *(void **)(a1 + 32);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained error]);
  [v6 _cleanupWithSuccess:v2 == 0 error:v7 completion:*(void *)(a1 + 48)];
}

- (void)_cleanupWithSuccess:(BOOL)a3 error:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9) {
    (*((void (**)(id, BOOL, id))v9 + 2))(v9, v6, v8);
  }
  uint64_t v11 = self;
  objc_sync_enter(v11);
  transaction = v11->_transaction;
  v11->_transaction = 0LL;

  uint64_t v13 = WLKPlaybackTrackingLogObject();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    uint64_t v16 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - %@ Ended Transaction",  (uint8_t *)&v15,  0xCu);
  }

  objc_sync_exit(v11);
}

- (void)_clearBDTimer
{
  v2 = self;
  uint64_t v3 = objc_sync_enter(v2);
  BDTimer = v2->_BDTimer;
  if (BDTimer)
  {
    uint64_t v5 = WLKPlaybackTrackingLogObject(v3);
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - %@ TR: Cancelling existing timer",  (uint8_t *)&v7,  0xCu);
    }

    dispatch_source_cancel((dispatch_source_t)v2->_BDTimer);
    BDTimer = v2->_BDTimer;
  }

  v2->_BDTimer = 0LL;

  objc_sync_exit(v2);
}

- (void)_scheduleTimedReportForSummary:(id)a3 afterMillis:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [v6 playbackState];
    BOOL v9 = v8 == (id)1;
    uint64_t v10 = WLKPlaybackTrackingLogObject(v8);
    uint64_t v11 = (dispatch_source_t *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v12 = os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = self;
        __int16 v25 = 2112;
        id v26 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - %@ TR: Will schedule timed report in %@ millis",  buf,  0x16u);
      }

      uint64_t v11 = self;
      objc_sync_enter(v11);
      id v13 = WLDDispatchQueue();
      id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
      dispatch_source_t v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v14);
      dispatch_source_t v16 = v11[2];
      v11[2] = v15;

      [v7 doubleValue];
      dispatch_time_t v18 = dispatch_time(0LL, (uint64_t)(v17 * 1000000.0));
      dispatch_source_set_timer(v11[2], v18, 0xFFFFFFFFFFFFFFFFLL, 0LL);
      objc_initWeak((id *)buf, v11);
      id v19 = v11[2];
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = __66__WLDPlaybackReporter__scheduleTimedReportForSummary_afterMillis___block_invoke;
      handler[3] = &unk_10003D2C0;
      objc_copyWeak(&v22, (id *)buf);
      handler[4] = v11;
      id v21 = v6;
      dispatch_source_set_event_handler(v19, handler);
      dispatch_activate(v11[2]);

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
      objc_sync_exit(v11);
    }

    else if (v12)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - %@ TR: Will not generate timed report because playback state is not playing",  buf,  0xCu);
    }
  }
}

void __66__WLDPlaybackReporter__scheduleTimedReportForSummary_afterMillis___block_invoke(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v3 = a1[4];
    objc_sync_enter(v3);
    id v4 = WeakRetained[4];
    objc_sync_exit(v3);

    id v5 = [v4 playbackState];
    if (v5 == (id)1 && (id v5 = [v4 isSameContent:a1[5]], (_DWORD)v5))
    {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([a1[5] elapsedTimeSummaryWithPlaybackState:1 timerDerived:1]);
      uint64_t v7 = WLKPlaybackTrackingLogObject(v6);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = a1[4];
        *(_DWORD *)buf = 138412546;
        id v14 = v9;
        __int16 v15 = 2112;
        dispatch_source_t v16 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - %@ TR: Will enqueue: %@",  buf,  0x16u);
      }

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = __66__WLDPlaybackReporter__scheduleTimedReportForSummary_afterMillis___block_invoke_33;
      v12[3] = &unk_10003D298;
      v12[4] = WeakRetained;
      [WeakRetained reportPlayback:v6 completion:v12];
    }

    else
    {
      uint64_t v10 = WLKPlaybackTrackingLogObject(v5);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = a1[4];
        *(_DWORD *)buf = 138412290;
        id v14 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - %@ TR: Will not generate report because current playback state does not satisfy conditions",  buf,  0xCu);
      }
    }
  }
}

void __66__WLDPlaybackReporter__scheduleTimedReportForSummary_afterMillis___block_invoke_33( uint64_t a1,  int a2,  void *a3)
{
  id v5 = a3;
  uint64_t v6 = WLKPlaybackTrackingLogObject(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v14 = 138412290;
      uint64_t v15 = v9;
      uint64_t v10 = "WLDPlaybackReporter - %@ TR: Successful playback report";
      id v11 = v7;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
    }
  }

  else if (v8)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 138412546;
    uint64_t v15 = v13;
    __int16 v16 = 2112;
    id v17 = v5;
    uint64_t v10 = "WLDPlaybackReporter - %@: TR: Failed playback report %@";
    id v11 = v7;
    uint32_t v12 = 22;
    goto LABEL_6;
  }
}

- (void).cxx_destruct
{
}

@end