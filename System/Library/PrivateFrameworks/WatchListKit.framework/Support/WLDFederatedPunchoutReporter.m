@interface WLDFederatedPunchoutReporter
+ (id)sharedFederatedPunchoutReporter;
- (NSMutableDictionary)ledger;
- (NSOperationQueue)queue;
- (OS_dispatch_source)timer;
- (WLDFederatedPunchoutReporter)init;
- (id)_metadataForEventWithPunchout:(id)a3 playbackSummary:(id)a4;
- (void)_configureTimerWithDate:(id)a3;
- (void)_reportPunchoutEvent:(id)a3 withPlaybackSummary:(id)a4;
- (void)recordPlaybackSummary:(id)a3;
- (void)recordPunchout:(id)a3;
- (void)setLedger:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation WLDFederatedPunchoutReporter

+ (id)sharedFederatedPunchoutReporter
{
  if (sharedFederatedPunchoutReporter_token != -1) {
    dispatch_once(&sharedFederatedPunchoutReporter_token, &__block_literal_global_1);
  }
  return (id)sharedFederatedPunchoutReporter_sharedFederatedPunchoutReporter;
}

void __63__WLDFederatedPunchoutReporter_sharedFederatedPunchoutReporter__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___WLDFederatedPunchoutReporter);
  v2 = (void *)sharedFederatedPunchoutReporter_sharedFederatedPunchoutReporter;
  sharedFederatedPunchoutReporter_sharedFederatedPunchoutReporter = (uint64_t)v1;
}

- (WLDFederatedPunchoutReporter)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___WLDFederatedPunchoutReporter;
  v2 = -[WLDFederatedPunchoutReporter init](&v12, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    ledger = v2->_ledger;
    v2->_ledger = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v5, "setMaxConcurrentOperationCount:", 1LL);
    v7 = (objc_class *)objc_opt_class(v2, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[NSOperationQueue setName:](v5, "setName:", v9);

    queue = v2->_queue;
    v2->_queue = v5;
  }

  return v2;
}

- (void)recordPunchout:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WLDFederatedPunchoutReporter queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __47__WLDFederatedPunchoutReporter_recordPunchout___block_invoke;
  v7[3] = &unk_10003CDC0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

void __47__WLDFederatedPunchoutReporter_recordPunchout___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) channelID]);
  uint64_t v4 = objc_claimAutoreleasedReturnValue([*v2 canonicalID]);
  v5 = (void *)v4;
  if (v3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) ledger]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v3]);

    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 canonicalID]);
      unsigned int v9 = [v8 isEqual:v5];

      if (v9) {
        uint64_t v10 = 3LL;
      }
      else {
        uint64_t v10 = 2LL;
      }
      uint64_t v11 = WLKPushNotificationsLogObject([v7 setFailureReason:v10]);
      objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 134217984;
        uint64_t v24 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "WLDFederatedPunchoutReporter - Recorded punchout that matches existing one in ledger. reporting back with failure reason %lu",  (uint8_t *)&v23,  0xCu);
      }

      [*(id *)(a1 + 40) _reportPunchoutEvent:v7 withPlaybackSummary:0];
      v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) ledger]);
      [v13 removeObjectForKey:v3];
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVAppBag app](&OBJC_CLASS___TVAppBag, "app"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 integerForKey:@"tvFederatedPunchoutTTL"]);

    if (!v15) {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 60LL));
    }
    uint64_t v16 = WLKPushNotificationsLogObject(objc_msgSend(*v2, "setTtl:", objc_msgSend(v15, "unsignedIntegerValue")));
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = *v2;
      int v23 = 138412290;
      uint64_t v24 = (uint64_t)v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "WLDFederatedPunchoutReporter - Adding punchout to ledger: %@",  (uint8_t *)&v23,  0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) ledger]);
    [v19 setObject:*(void *)(a1 + 32) forKey:v3];

    v20 = *(void **)(a1 + 40);
    v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) expiry]);
    [v20 _configureTimerWithDate:v21];
  }

  else
  {
    uint64_t v22 = WLKPushNotificationsLogObject(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      __47__WLDFederatedPunchoutReporter_recordPunchout___block_invoke_cold_1((uint64_t *)v2, (os_log_s *)v7);
    }
  }
}

- (void)recordPlaybackSummary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WLDFederatedPunchoutReporter queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __54__WLDFederatedPunchoutReporter_recordPlaybackSummary___block_invoke;
  v7[3] = &unk_10003CDC0;
  id v8 = v4;
  unsigned int v9 = self;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

void __54__WLDFederatedPunchoutReporter_recordPlaybackSummary___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[WLKChannelUtilities sharedInstanceFiltered]( &OBJC_CLASS___WLKChannelUtilities,  "sharedInstanceFiltered"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleID]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 channelForBundleID:v3]);

  if (v4 && (id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 channelID]), v6, v6))
  {
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 channelID]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) ledger]);
    unsigned int v9 = (_BYTE *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v7]);

    if (v9)
    {
      uint64_t v11 = WLKPushNotificationsLogObject(v10);
      objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v44 = 138412290;
        v45 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "WLDFederatedPunchoutReporter - found matching punchout for reported playback summary: %@",  (uint8_t *)&v44,  0xCu);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue([v9 externalContentID]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) contentID]);
      unsigned __int8 v15 = [v13 isEqual:v14];

      uint64_t v17 = WLKPushNotificationsLogObject(v16);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if ((v15 & 1) != 0)
      {
        if (v19)
        {
          LOWORD(v44) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "WLDFederatedPunchoutReporter - Playback summary matches pending punchout.",  (uint8_t *)&v44,  2u);
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue(+[TVAppBag app](&OBJC_CLASS___TVAppBag, "app"));
        v21 = (void *)objc_claimAutoreleasedReturnValue([v20 integerForKey:@"tvFederatedPunchoutResumeTimeEpsilon"]);

        if (!v21) {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 10LL));
        }
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) elapsedTime]);
        int v23 = [v22 integerValue];

        uint64_t v24 = [v9 resumeTimeSeconds];
        v25 = v24;
        if (v23 - v24 >= 0) {
          int64_t v26 = v23 - v24;
        }
        else {
          int64_t v26 = v24 - v23;
        }
        id v27 = [v21 integerValue];
        uint64_t v28 = WLKPushNotificationsLogObject(v27);
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
        if (v26 <= (uint64_t)v27)
        {
          if (v30)
          {
            id v42 = [v21 integerValue];
            int v44 = 134218496;
            v45 = v23;
            __int16 v46 = 2048;
            id v47 = v42;
            __int16 v48 = 2048;
            v49 = v25;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "WLDFederatedPunchoutReporter - Playback summary elapsed time of %ld is within %ld second epsilon from resume time %ld",  (uint8_t *)&v44,  0x20u);
          }

          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
          [v9 setMatchTime:v43];

          [v9 setFailureReason:0];
          [*(id *)(a1 + 40) _reportPunchoutEvent:v9 withPlaybackSummary:*(void *)(a1 + 32)];
          v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) ledger]);
          [v34 removeObjectForKey:v7];
        }

        else
        {
          if (v30)
          {
            id v31 = [v21 integerValue];
            int v44 = 134218496;
            v45 = v23;
            __int16 v46 = 2048;
            id v47 = v31;
            __int16 v48 = 2048;
            v49 = v25;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "WLDFederatedPunchoutReporter - Playback summary elapsed time of %ld is greater than %ld second epsilon fro m resume time %ld",  (uint8_t *)&v44,  0x20u);
          }

          [v9 setFailureReason:4];
          v32 = (char *)[v9 ttl];
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[TVAppBag app](&OBJC_CLASS___TVAppBag, "app"));
          v34 = (void *)objc_claimAutoreleasedReturnValue([v33 integerForKey:@"tvFederatedPunchoutExtensionTTL"]);

          if (!v34) {
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 10LL));
          }
          objc_msgSend(v9, "setTtl:", &v32[(void)objc_msgSend(v34, "unsignedIntegerValue")]);
          v35 = *(void **)(a1 + 40);
          v36 = (void *)objc_claimAutoreleasedReturnValue([v9 expiry]);
          [v35 _configureTimerWithDate:v36];
        }
      }

      else
      {
        if (v19)
        {
          LOWORD(v44) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "WLDFederatedPunchoutReporter - playback summary is from expected channel but not the expected playable.",  (uint8_t *)&v44,  2u);
        }

        [v9 setFailureReason:5];
        v39 = (char *)[v9 ttl];
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[TVAppBag app](&OBJC_CLASS___TVAppBag, "app"));
        v21 = (void *)objc_claimAutoreleasedReturnValue([v40 integerForKey:@"tvFederatedPunchoutExtensionTTL"]);

        if (!v21) {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 10LL));
        }
        objc_msgSend(v9, "setTtl:", &v39[(void)objc_msgSend(v21, "unsignedIntegerValue")]);
        v41 = *(void **)(a1 + 40);
        v34 = (void *)objc_claimAutoreleasedReturnValue([v9 expiry]);
        [v41 _configureTimerWithDate:v34];
      }
    }
  }

  else
  {
    uint64_t v37 = WLKPushNotificationsLogObject(v5);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v38 = (_BYTE *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleID]);
      int v44 = 138412290;
      v45 = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "WLDFederatedPunchoutReporter - No matching channel for bundle ID %@",  (uint8_t *)&v44,  0xCu);
    }
  }
}

- (void)_reportPunchoutEvent:(id)a3 withPlaybackSummary:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[WLDFederatedPunchoutReporter _metadataForEventWithPunchout:playbackSummary:]( self,  "_metadataForEventWithPunchout:playbackSummary:",  v6,  a4));
  id v8 = [v6 failureReason];
  if (v8)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"WLKFederatedPunchoutErrorDomain",  [v6 failureReason],  0));
    unsigned int v9 = v8;
  }

  else
  {
    unsigned int v9 = 0LL;
  }

  uint64_t v10 = WLKPushNotificationsLogObject(v8);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "WLDFederatedPunchoutReporter - Recording punchout with error %@",  (uint8_t *)&v12,  0xCu);
  }

  +[VSMetricsManagerObjC recordFederatedPunchoutEventWithError:metadata:]( &OBJC_CLASS___VSMetricsManagerObjC,  "recordFederatedPunchoutEventWithError:metadata:",  v9,  v7);
}

- (id)_metadataForEventWithPunchout:(id)a3 playbackSummary:(id)a4
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 punchoutTime]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 matchTime]);
  id v8 = v7;
  double v9 = 0.0;
  if (v6 && v7)
  {
    [v7 timeIntervalSinceDate:v6];
    double v9 = round(v10 * 10.0) / 10.0;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 channelID]);
  -[NSMutableDictionary wlk_setObjectUnlessNil:forKey:](v5, "wlk_setObjectUnlessNil:forKey:", v11, @"channelID");

  int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleID]);
  -[NSMutableDictionary wlk_setObjectUnlessNil:forKey:]( v5,  "wlk_setObjectUnlessNil:forKey:",  v12,  VSMetricFlexibleFieldBundleID);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v9));
  -[NSMutableDictionary wlk_setObjectUnlessNil:forKey:]( v5,  "wlk_setObjectUnlessNil:forKey:",  v13,  @"matchTimeSeconds");

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 ttl]));
  -[NSMutableDictionary wlk_setObjectUnlessNil:forKey:](v5, "wlk_setObjectUnlessNil:forKey:", v14, @"ttl");

  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v4 appAdamID]);
  -[NSMutableDictionary wlk_setObjectUnlessNil:forKey:](v5, "wlk_setObjectUnlessNil:forKey:", v15, @"adamID");

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 isConsented]));
  -[NSMutableDictionary wlk_setObjectUnlessNil:forKey:](v5, "wlk_setObjectUnlessNil:forKey:", v16, @"consented");

  if ([v4 failureReason])
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 canonicalID]);
    -[NSMutableDictionary wlk_setObjectUnlessNil:forKey:]( v5,  "wlk_setObjectUnlessNil:forKey:",  v17,  @"canonicalID");

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 externalContentID]);
    -[NSMutableDictionary wlk_setObjectUnlessNil:forKey:]( v5,  "wlk_setObjectUnlessNil:forKey:",  v18,  @"externalID");
  }

  return v5;
}

- (void)_configureTimerWithDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[WLDFederatedPunchoutReporter timer](self, "timer"));
  id v6 = (dispatch_source_s *)v5;
  if (v5)
  {
    uint64_t v7 = WLKPushNotificationsLogObject(v5);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "WLDFederatedPunchoutReporter - New punchout recorded with pre-existing timer.",  (uint8_t *)buf,  2u);
    }

    dispatch_source_cancel(v6);
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[WLDFederatedPunchoutReporter queue](self, "queue"));
  double v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 underlyingQueue]);
  uint64_t v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v10);

  [v4 timeIntervalSinceNow];
  dispatch_time_t v13 = dispatch_time(0LL, (uint64_t)(v12 * 1000000000.0));
  dispatch_source_set_timer(v11, v13, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  objc_initWeak(buf, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = __56__WLDFederatedPunchoutReporter__configureTimerWithDate___block_invoke;
  handler[3] = &unk_10003CA78;
  objc_copyWeak(&v15, buf);
  dispatch_source_set_event_handler(v11, handler);
  -[WLDFederatedPunchoutReporter setTimer:](self, "setTimer:", v11);
  dispatch_activate(v11);
  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

void __56__WLDFederatedPunchoutReporter__configureTimerWithDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained ledger]);
    uint64_t v5 = WLKPushNotificationsLogObject(v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v14 = [v4 count];
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "WLDFederatedPunchoutReporter - punchout expiry timer fired, processing %lu punchouts.",  buf,  0xCu);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = __56__WLDFederatedPunchoutReporter__configureTimerWithDate___block_invoke_42;
    v9[3] = &unk_10003CDE8;
    id v10 = v2;
    id v11 = WeakRetained;
    double v12 = v3;
    uint64_t v7 = v3;
    id v8 = v2;
    [v4 enumerateKeysAndObjectsUsingBlock:v9];
    [v4 removeObjectsForKeys:v7];
    [WeakRetained setTimer:0];
  }
}

void __56__WLDFederatedPunchoutReporter__configureTimerWithDate___block_invoke_42( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 expiry]);
  id v9 = [v7 compare:v8];

  if (v9 == (id)1)
  {
    uint64_t v11 = WLKPushNotificationsLogObject(v10);
    double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "WLDFederatedPunchoutReporter - Punchout expired: %@",  (uint8_t *)&v13,  0xCu);
    }

    if (![v6 failureReason]) {
      [v6 setFailureReason:1];
    }
    [*(id *)(a1 + 40) _reportPunchoutEvent:v6 withPlaybackSummary:0];
    [*(id *)(a1 + 48) addObject:v5];
  }
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (NSMutableDictionary)ledger
{
  return self->_ledger;
}

- (void)setLedger:(id)a3
{
}

- (void).cxx_destruct
{
}

void __47__WLDFederatedPunchoutReporter_recordPunchout___block_invoke_cold_1(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "WLDFederatedPunchoutReporter - Attempted to record a punchout with invalid channel ID: %@",  (uint8_t *)&v3,  0xCu);
}

@end