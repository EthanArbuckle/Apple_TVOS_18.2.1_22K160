@interface ADMediaRemoteService
- (ADMediaRemoteService)initWithQueue:(id)a3 volumeTracker:(id)a4 whaService:(id)a5;
- (ADVolumeTracking)volumeTracker;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (id)_commandsForDomain:(id)a3;
- (id)commandsForDomain:(id)a3;
- (id)domains;
- (id)targetQueue;
- (void)_buildCacheOfWhaServiceSupportedCommands;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
@end

@implementation ADMediaRemoteService

- (void)_buildCacheOfWhaServiceSupportedCommands
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[ADMediaRemoteService domains](self, "domains"));
  id v4 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADService commandsForDomain:](self->_whaService, "commandsForDomain:", v8));
        if ([v9 count] == (id)1)
        {
          v10 = v3;
          v11 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
          unsigned int v12 = [v11 isEqualToString:v8];

          if (v12)
          {
            uint64_t v13 = objc_claimAutoreleasedReturnValue(-[ADMediaRemoteService commandsForDomain:](self, "commandsForDomain:", v8));

            v9 = (void *)v13;
          }

          v3 = v10;
        }

        if (v9) {
          -[NSMutableSet addObjectsFromArray:](v3, "addObjectsFromArray:", v9);
        }
      }

      id v5 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
    }

    while (v5);
  }

  id v14 = -[NSMutableSet count](v3, "count");
  if (v14) {
    id v15 = -[NSMutableSet copy](v3, "copy");
  }
  else {
    id v15 = 0LL;
  }
  p_whaServiceSupportedCommands = &self->_whaServiceSupportedCommands;
  objc_storeStrong((id *)p_whaServiceSupportedCommands, v15);
  if (v14) {

  }
  v17 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v18 = *p_whaServiceSupportedCommands;
    v19 = v17;
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSSet count](v18, "count")));
    v21 = *p_whaServiceSupportedCommands;
    *(_DWORD *)buf = 136315650;
    v28 = "-[ADMediaRemoteService _buildCacheOfWhaServiceSupportedCommands]";
    __int16 v29 = 2112;
    v30 = v20;
    __int16 v31 = 2112;
    v32 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s %@ overlapping commands %@", buf, 0x20u);
  }
}

- (ADMediaRemoteService)initWithQueue:(id)a3 volumeTracker:(id)a4 whaService:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___ADMediaRemoteService;
  unsigned int v12 = -[ADMediaRemoteService init](&v19, "init");
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    objc_storeStrong((id *)&v13->_volumeTracker, a4);
    objc_storeStrong((id *)&v13->_whaService, a5);
    id v14 = (objc_class *)objc_opt_class(v13);
    id v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[ADService setIdentifier:](v13, "setIdentifier:", v16);

    commandsToIgnore = v13->_commandsToIgnore;
    v13->_commandsToIgnore = (NSArray *)&__NSArray0__struct;

    if (v13->_whaService) {
      -[ADMediaRemoteService _buildCacheOfWhaServiceSupportedCommands](v13, "_buildCacheOfWhaServiceSupportedCommands");
    }
  }

  return v13;
}

- (id)domains
{
  v3[0] = SANPGroupIdentifier;
  v3[1] = SAMPGroupIdentifier;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  2LL));
}

- (id)_commandsForDomain:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:SANPGroupIdentifier])
  {
    v8[0] = SANPPausePlaybackClassIdentifier;
    v8[1] = SANPSeekToPlaybackPositionClassIdentifier;
    v8[2] = SANPSetRepeatModeClassIdentifier;
    v8[3] = SANPSetShuffleModeClassIdentifier;
    v8[4] = SANPSkipTimeIntervalClassIdentifier;
    v8[5] = SANPSkipToNextItemClassIdentifier;
    v8[6] = SANPSkipToPreviousItemClassIdentifier;
    v8[7] = SANPStartPlaybackClassIdentifier;
    v8[8] = SANPStopPlaybackClassIdentifier;
    v8[9] = SANPSetPlaybackSpeedClassIdentifier;
    v8[10] = SANPGetVolumeLevelClassIdentifier;
    v8[11] = SANPSetVolumeLevelClassIdentifier;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 12LL));
  }

  else
  {
    id v4 = 0LL;
  }

  if ([v3 isEqualToString:SAMPGroupIdentifier])
  {
    v7[0] = SAMPSetPlaybackPositionClassIdentifier;
    v7[1] = SAMPSetQueueClassIdentifier;
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL));

    id v4 = (void *)v5;
  }

  return v4;
}

- (id)commandsForDomain:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADMediaRemoteService _commandsForDomain:](self, "_commandsForDomain:", a3));
  if (v4 && -[NSArray count](self->_commandsToIgnore, "count"))
  {
    id v5 = [v4 mutableCopy];
    [v5 removeObjectsInArray:self->_commandsToIgnore];
    id v6 = [v5 copy];

    id v4 = v6;
  }

  return v4;
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  return 1;
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v9 = a3;
  v74 = (ADService *)a4;
  id v73 = a5;
  id v76 = a6;
  v75 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 encodedClassName]);
  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v91 = "-[ADMediaRemoteService handleCommand:forDomain:executionContext:reply:]";
    __int16 v92 = 2112;
    v93 = v74;
    __int16 v94 = 2112;
    v95 = v75;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }

  if (self->_whaService
    || (__int128 v26 = (os_log_s *)AFSiriLogContextDaemon, os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    && (*(_DWORD *)buf = 136315138,
        v91 = "-[ADMediaRemoteService handleCommand:forDomain:executionContext:reply:]",
        _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s WARNING: No other media service found, handling everything in assistantd.",  buf,  0xCu),  self->_whaService))
  {
    if ((objc_opt_respondsToSelector(v9, "hashedRouteUIDs") & 1) != 0)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 hashedRouteUIDs]);
      BOOL v12 = [v11 count] == 0;

      if (!v12)
      {
        uint64_t v13 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          whaService = self->_whaService;
          *(_DWORD *)buf = 136315650;
          v91 = "-[ADMediaRemoteService handleCommand:forDomain:executionContext:reply:]";
          __int16 v92 = 2112;
          v93 = (ADService *)v75;
          __int16 v94 = 2112;
          v95 = (const __CFString *)whaService;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s %@ command has explicit routes, passing to %@",  buf,  0x20u);
        }

        if (-[NSSet containsObject:](self->_whaServiceSupportedCommands, "containsObject:", v75))
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 encodedClassName]);
          unsigned int v16 = [v15 isEqualToString:SAMPSetQueueClassIdentifier];

          if (v16)
          {
            id v71 = v9;
            v17 = (void *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              v18 = v17;
              objc_super v19 = (ADService *)objc_claimAutoreleasedReturnValue([v71 aceId]);
              *(_DWORD *)buf = 136315394;
              v91 = "_ADAddWHAIdentifiersToSAMPSetQueue";
              __int16 v92 = 2112;
              v93 = v19;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s Adding metrics info to SetQueue %@",  buf,  0x16u);
            }

            v72 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  1LL);
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
            v69 = (void *)objc_claimAutoreleasedReturnValue([v20 UUIDString]);

            v96[0] = @"clientID";
            v96[1] = @"beginTime";
            v97[0] = v69;
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
            [v21 timeIntervalSinceReferenceDate];
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
            v97[1] = v22;
            __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v97,  v96,  2LL));
            -[NSMutableDictionary setObject:forKey:](v72, "setObject:forKey:", v23, @"WHAMetrics");

            __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v71 metricsContext]);
            v68 = v24;
            if (v24)
            {
              __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 dataUsingEncoding:4]);
              id v83 = 0LL;
              v70 = (ADService *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v25,  0LL,  &v83));
              id v66 = v83;
            }

            else
            {
              v70 = 0LL;
              id v66 = 0LL;
            }

            uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSDictionary);
            if ((objc_opt_isKindOfClass(v70, v40) & 1) != 0)
            {
              v41 = (os_log_s *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                v91 = "_ADAddWHAIdentifiersToSAMPSetQueue";
                _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_INFO,  "%s merging existing metricsContext dictionary",  buf,  0xCu);
              }

              v42 = v70;
              __int128 v79 = 0u;
              __int128 v80 = 0u;
              __int128 v81 = 0u;
              __int128 v82 = 0u;
              v43 = v72;
              id v44 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v43,  "countByEnumeratingWithState:objects:count:",  &v79,  buf,  16LL);
              if (v44)
              {
                uint64_t v45 = *(void *)v80;
                do
                {
                  for (i = 0LL; i != v44; i = (char *)i + 1)
                  {
                    if (*(void *)v80 != v45) {
                      objc_enumerationMutation(v43);
                    }
                    v47 = *(void **)(*((void *)&v79 + 1) + 8LL * (void)i);
                    v48 = (void *)objc_claimAutoreleasedReturnValue(-[ADService valueForKey:](v42, "valueForKey:", v47, v66, v68));

                    if (v48)
                    {
                      v49 = (os_log_s *)AFSiriLogContextDaemon;
                      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v84 = 136315394;
                        v85 = "_ADAddWHAIdentifiersToSAMPSetQueue";
                        __int16 v86 = 2112;
                        id v87 = v47;
                        _os_log_error_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "%s Value already exists for key %@, keeping it",  v84,  0x16u);
                      }
                    }
                  }

                  id v44 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v43,  "countByEnumeratingWithState:objects:count:",  &v79,  buf,  16LL);
                }

                while (v44);
              }

              -[NSMutableDictionary addEntriesFromDictionary:](v43, "addEntriesFromDictionary:", v42);
            }

            else if (v70)
            {
              v50 = (os_log_s *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v91 = "_ADAddWHAIdentifiersToSAMPSetQueue";
                __int16 v92 = 2112;
                v93 = v70;
                __int16 v94 = 2112;
                v95 = @"metricsContextValue";
                _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_INFO,  "%s merging existing non-dictionary metricsContext value of %@ under key %@",  buf,  0x20u);
              }

              -[NSMutableDictionary setObject:forKey:]( v72,  "setObject:forKey:",  v70,  @"metricsContextValue",  v66,  v68);
            }

            id v78 = v66;
            v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v72,  0LL,  &v78,  v66));
            id v52 = v78;

            v53 = -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  v51,  4LL);
            if (v53)
            {
              [v71 setMetricsContext:v53];
              v54 = (void *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
              {
                v55 = v54;
                v56 = (void *)objc_claimAutoreleasedReturnValue([v71 aceId]);
                *(_DWORD *)v84 = 136315394;
                v85 = "_ADAddWHAIdentifiersToSAMPSetQueue";
                __int16 v86 = 2112;
                id v87 = v56;
                _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_INFO,  "%s Successfully updated metricsContext on %@",  v84,  0x16u);
              }
            }

            else
            {
              v57 = (os_log_s *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v84 = 136315650;
                v85 = "_ADAddWHAIdentifiersToSAMPSetQueue";
                __int16 v86 = 2112;
                id v87 = v52;
                __int16 v88 = 2112;
                v89 = v72;
                _os_log_error_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_ERROR,  "%s Failed to update metricsContext error=%@ newContextDictionary=%@",  v84,  0x20u);
              }
            }

            uint64_t v60 = AFAnalyticsContextCreateWithCommand(v71, v58, v59);
            v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
            id v62 = [v61 mutableCopy];

            v63 = (void *)objc_claimAutoreleasedReturnValue([v62 objectForKey:@"com.apple.ace.media.SetQueue"]);
            id v64 = [v63 mutableCopy];

            [v64 setObject:v72 forKey:@"metricsContext"];
            [v62 setObject:v64 forKey:@"com.apple.ace.media.SetQueue"];
            v65 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
            [v65 logEventWithType:2907 context:v62];
          }

          -[ADService handleCommand:forDomain:executionContext:reply:]( self->_whaService,  "handleCommand:forDomain:executionContext:reply:",  v9,  v74,  v73,  v76);
          goto LABEL_34;
        }

        v27 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          v39 = self->_whaService;
          *(_DWORD *)buf = 136315650;
          v91 = "-[ADMediaRemoteService handleCommand:forDomain:executionContext:reply:]";
          __int16 v92 = 2112;
          v93 = (ADService *)v75;
          __int16 v94 = 2112;
          v95 = (const __CFString *)v39;
          _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s %@ is NOT supported by %@, attempting to handle in assistantd after all",  buf,  0x20u);
        }
      }
    }
  }

  if ((objc_opt_respondsToSelector(v9, "_ad_performWithMediaRemoteService:replyHandler:") & 1) != 0) {
    v28 = v9;
  }
  else {
    v28 = 0LL;
  }
  id v29 = v28;
  v30 = v29;
  if (v29)
  {
    objc_msgSend(v29, "_ad_performWithMediaRemoteService:replyHandler:", self, v76);
  }

  else if (self->_whaService {
         && (__int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v9 encodedClassName]),
  }
             unsigned int v32 = [v31 isEqualToString:SAMPSetQueueClassIdentifier],
             v31,
             v32))
  {
    v33 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v34 = self->_whaService;
      *(_DWORD *)buf = 136315394;
      v91 = "-[ADMediaRemoteService handleCommand:forDomain:executionContext:reply:]";
      __int16 v92 = 2112;
      v93 = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%s Handing SetQueue to %@", buf, 0x16u);
    }

    -[ADService handleCommand:forDomain:executionContext:reply:]( self->_whaService,  "handleCommand:forDomain:executionContext:reply:",  v9,  v74,  v73,  v76);
  }

  else
  {
    v35 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v36 = v35;
      v37 = (ADService *)objc_claimAutoreleasedReturnValue([v9 encodedClassName]);
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 aceId]);
      *(_DWORD *)buf = 136315650;
      v91 = "-[ADMediaRemoteService handleCommand:forDomain:executionContext:reply:]";
      __int16 v92 = 2112;
      v93 = v37;
      __int16 v94 = 2112;
      v95 = v38;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%s %@ %@ was not handled", buf, 0x20u);
    }

    if (v76) {
      (*((void (**)(id, void, void))v76 + 2))(v76, 0LL, 0LL);
    }
  }

LABEL_34:
}

- (id)targetQueue
{
  return self->_queue;
}

- (ADVolumeTracking)volumeTracker
{
  return self->_volumeTracker;
}

- (void).cxx_destruct
{
}

@end