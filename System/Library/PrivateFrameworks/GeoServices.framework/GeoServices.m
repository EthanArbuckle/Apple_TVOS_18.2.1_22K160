void sub_100004788(void *a1)
{
  void *v2;
  id v3;
  id v4;
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 16) objectForKey:a1[5]]);
  if (!v2)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
    [*(id *)(a1[4] + 16) setObject:v3 forKey:a1[5]];
    v2 = v3;
  }

  v4 = v2;
  [v2 addObject:a1[6]];
}

void sub_1000048B8(void *a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 16) objectForKey:a1[5]]);
  if (v2)
  {
    id v3 = v2;
    [v2 removeObject:a1[6]];
    v2 = v3;
  }
}

void sub_100004AB4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
}

uint64_t sub_100004AE0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100004AF0(uint64_t a1)
{
}

id sub_100004AF8(void *a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 16) objectForKey:a1[5]]);
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return [*(id *)(a1[4] + 16) removeObjectForKey:a1[5]];
}

void sub_100004D4C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) requestUUID]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) peer]);
  [v7 _removeRequestUUID:v8 forPeer:v9];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100004E44;
  v12[3] = &unk_100059048;
  id v13 = *(id *)(a1 + 48);
  id v14 = v5;
  id v15 = v6;
  id v10 = v6;
  id v11 = v5;
  geo_dispatch_async_qos(21LL, v12);
}

id sub_100004E44(uint64_t a1)
{
  return [*(id *)(a1 + 32) send];
}

void sub_1000051C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) requestUUID]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) peer]);
  [v7 _removeRequestUUID:v8 forPeer:v9];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000052B8;
  v12[3] = &unk_100059048;
  id v13 = *(id *)(a1 + 48);
  id v14 = v5;
  id v15 = v6;
  id v10 = v6;
  id v11 = v5;
  geo_dispatch_async_qos(21LL, v12);
}

id sub_1000052B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) send];
}

id sub_10000539C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setAllCacheEntries:a2];
  [*(id *)(a1 + 32) setError:v6];

  return [*(id *)(a1 + 32) send];
}

void sub_100005820(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) requestUUID]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) peer]);
  [v7 _removeRequestUUID:v8 forPeer:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) requestUUID]);
  if (v10)
  {
    id v11 = *(void **)(a1 + 32);
    v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) requestUUID]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) peer]);
    [v11 _removeRequestUUID:v12 forPeer:v13];
  }

  [*(id *)(a1 + 48) setError:v6];
  [*(id *)(a1 + 48) setResponse:v5];
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataServer");
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 134218242;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Responding with place data response: %p / error: %@",  (uint8_t *)&v16,  0x16u);
  }

  [*(id *)(a1 + 48) send];
}

id sub_100005B14(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) send];
}

id sub_100005C7C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) send];
}

void sub_1000063F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary _geo_replyDictionaryForError:key:]( &OBJC_CLASS___NSDictionary,  "_geo_replyDictionaryForError:key:",  a3,  @"err"));
    objc_msgSend(v4, "sendReply:");
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a2,  1LL,  0LL));
    v8 = @"response";
    v9 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    [*(id *)(a1 + 32) sendReply:v6];
  }
}

void sub_100006734(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary _geo_replyDictionaryForError:key:]( &OBJC_CLASS___NSDictionary,  "_geo_replyDictionaryForError:key:",  a3,  @"err"));
    objc_msgSend(v4, "sendReply:");
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a2,  1LL,  0LL));
    v8 = @"response";
    v9 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    [*(id *)(a1 + 32) sendReply:v6];
  }

void sub_100006A28(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    __int16 v18 = @"err";
    id v19 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
  }

  else
  {
    id v13 = 0LL;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a2,  1LL,  &v13));
    id v9 = v13;
    id v10 = v9;
    if (v8)
    {
      int v16 = @"data";
      id v17 = v8;
      id v11 = &v17;
      v12 = &v16;
    }

    else
    {
      id v14 = @"err";
      id v15 = v9;
      id v11 = &v15;
      v12 = &v14;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v12,  1LL));
  }

  [*(id *)(a1 + 32) sendReply:v7];
}

void sub_100006E70(uint64_t a1, uint64_t a2)
{
  id v9 = 0LL;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a2,  1LL,  &v9));
  id v4 = v9;
  id v5 = v4;
  if (v3)
  {
    v12 = @"response";
    id v13 = v3;
    id v6 = &v13;
    id v7 = &v12;
  }

  else
  {
    id v10 = @"err";
    id v11 = v4;
    id v6 = &v11;
    id v7 = &v10;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v7,  1LL));
  [*(id *)(a1 + 32) sendReply:v8];
}

void sub_100007120(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[GEOExternalRequestCounterCountReply alloc] initWithRequest:*(void *)(a1 + 32)];
  [v4 setObjects:v3];

  [v4 send];
}

void sub_100007410(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count]
    && (id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]),
        uint64_t v10 = objc_opt_class(&OBJC_CLASS___GEORequestCounterCacheResults, v8, v9),
        char isKindOfClass = objc_opt_isKindOfClass(v7, v10),
        v7,
        (isKindOfClass & 1) == 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10003AC08();
    }
  }

  else
  {
    [*(id *)(a1 + 32) setResults:v5];
    [*(id *)(a1 + 32) setError:v6];
    [*(id *)(a1 + 32) send];
  }
}

void sub_100007884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void sub_100007CA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "Experiments");
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedDescription]);
      int v8 = 138477827;
      uint64_t v9 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Error updating resource manifest on datasetId change: %{private}@",  (uint8_t *)&v8,  0xCu);
    }
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16LL));
    [WeakRetained serverProxy:*(void *)(a1 + 32) didChangeExperimentsInfo:*(void *)(*(void *)(a1 + 32) + 24)];
    notify_post("com.apple.GeoServices.experimentsChanged");
  }
}

id sub_100007E38()
{
  double Double = GEOConfigGetDouble( GeoServicesConfig_ExperimentsBucketGUIDTimestamp[0],  GeoServicesConfig_ExperimentsBucketGUIDTimestamp[1]);
  uint64_t String = GEOConfigGetString(GeoServicesConfig_ExperimentsBucketGUID[0], GeoServicesConfig_ExperimentsBucketGUID[1]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(String);
  if (!v2
    || (CFAbsoluteTime v3 = CFAbsoluteTimeGetCurrent() - Double,
        v3 > GEOConfigGetDouble( GeoServicesConfig_ExperimentBucketGUIDExpireInterval[0],  GeoServicesConfig_ExperimentBucketGUIDExpireInterval[1]))
    || Double > CFAbsoluteTimeGetCurrent())
  {
    uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "Experiments");
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Nonexist or stale experiment GUID. Generating new one.",  v10,  2u);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 UUIDString]);

    GEOConfigSetString(GeoServicesConfig_ExperimentsBucketGUID[0], GeoServicesConfig_ExperimentsBucketGUID[1], v7);
    double Current = CFAbsoluteTimeGetCurrent();
    GEOConfigSetDouble( GeoServicesConfig_ExperimentsBucketGUIDTimestamp[0],  GeoServicesConfig_ExperimentsBucketGUIDTimestamp[1],  Current);
    uint64_t v2 = (void *)v7;
  }

  return v2;
}

LABEL_46:
LABEL_47:
LABEL_48:
        _geo_isolate_unlock(&v56);

        return;
      }
    }

    else
    {
      v31 = DefaultLoggingSubsystem;
    }

    v43 = GEOFindOrCreateLog(v31, "Experiments");
    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v58 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEBUG,  "Setting experiment refresh interval to %f",  buf,  0xCu);
    }

    v45 = (BGRepeatingSystemTaskRequest *)[objc_alloc((Class)sub_100017F7C()) initWithIdentifier:GEOExperimentServerLocalProxyBackgroundTaskIdentifier];
    v46 = self->_repeatingTask;
    self->_repeatingTask = v45;

    -[BGRepeatingSystemTaskRequest setPriority:](self->_repeatingTask, "setPriority:", 2LL);
    -[BGRepeatingSystemTaskRequest setInterval:](self->_repeatingTask, "setInterval:", v13);
    -[BGRepeatingSystemTaskRequest setRequiresNetworkConnectivity:]( self->_repeatingTask,  "setRequiresNetworkConnectivity:",  1LL);
    -[BGRepeatingSystemTaskRequest setPreventsDeviceSleep:](self->_repeatingTask, "setPreventsDeviceSleep:", 1LL);
    v47 = [sub_100017D6C() sharedScheduler];
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    v49 = self->_repeatingTask;
    v54 = 0LL;
    v50 = [v48 submitTaskRequest:v49 error:&v54];
    v39 = (__CFString *)v54;

    if ((v50 & 1) != 0) {
      goto LABEL_47;
    }
    v51 = GEOFindOrCreateLog(v31, "Experiments");
    v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(double *)&v53 = COERCE_DOUBLE(@"Unknown");
      if (v39) {
        v53 = v39;
      }
      *(_DWORD *)buf = 138412290;
      v58 = *(double *)&v53;
      _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_ERROR,  "Failed to submit task with error: %@",  buf,  0xCu);
    }

    v41 = self->_repeatingTask;
    self->_repeatingTask = 0LL;
    goto LABEL_46;
  }

void sub_1000084FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

id sub_100008BC0(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 clientConfig]);
  CFAbsoluteTime v3 = (void *)objc_claimAutoreleasedReturnValue([v2 configKeyValues]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v3 count]));

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v19 = v1;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v1 clientConfig]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 configKeyValues]);

  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        switch([v11 abConfigValueType])
        {
          case 1u:
            v12 = (void *)objc_claimAutoreleasedReturnValue([v11 abConfigValue]);
            uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v12 intValue]));
            goto LABEL_11;
          case 2u:
            v12 = (void *)objc_claimAutoreleasedReturnValue([v11 abConfigValue]);
            [v12 doubleValue];
            uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
            goto LABEL_11;
          case 3u:
            v12 = (void *)objc_claimAutoreleasedReturnValue([v11 abConfigValue]);
            uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 stringValue]);
            goto LABEL_11;
          case 4u:
            v12 = (void *)objc_claimAutoreleasedReturnValue([v11 abConfigValue]);
            uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v12 BOOLValue]));
LABEL_11:
            id v14 = (void *)v13;

            if (v14)
            {
              id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 abConfigKey]);
              [v4 setObject:v14 forKeyedSubscript:v15];
            }

            break;
          default:
            continue;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v8);
  }

  if ([v4 count]) {
    int v16 = v4;
  }
  else {
    int v16 = 0LL;
  }
  id v17 = v16;

  return v17;
}

LABEL_10:
    }

LABEL_13:
  return v16;
}

LABEL_11:
  }
}

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 entityComponent]);
  if ([v19 hasTelephone])
  {
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 telephone]);
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"phNo-",  v20));
    [v7 addObject:v21];
  }

LABEL_14:
  return v7;
}

      sqlite3_reset(v2);
    }
  }

  objc_sync_exit(v5);
  return v7;
}

void sub_100009348( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_10000937C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8LL) + 32LL;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000093EC;
  v3[3] = &unk_100059190;
  id v4 = v1;
  GEOOnce(v2, v3);
}

id sub_1000093EC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTaskCompleted];
}

void sub_1000093F4(uint64_t a1)
{
  global_queue = (dispatch_queue_s *)geo_get_global_queue(21LL);
  dispatch_async(global_queue, *(dispatch_block_t *)(a1 + 32));
}

void sub_100009430(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = DefaultLoggingSubsystem;
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "Experiments");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  id v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v37 = 138543362;
      id v38 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Error loading experiment configuration from service: %{public}@",  (uint8_t *)&v37,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend( WeakRetained,  "_submitNonRepeatingRetryTask:",  GEOConfigGetDouble( GeoServicesConfig_ExperimentServiceFailureRetryInterval[0],  GeoServicesConfig_ExperimentServiceFailureRetryInterval[1]));
  }

  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v37 = 138477827;
      id v38 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Loaded new experiment configuration: %{private}@",  (uint8_t *)&v37,  0xCu);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[GEOResourceManifestManager modernManager]( &OBJC_CLASS___GEOResourceManifestManager,  "modernManager"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 activeTileGroup]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dataSet]);
    id v16 = [v15 identifier];

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 mapsAbClientMetadata]);
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 clientDatasetMetadata]);
    [v18 setDatasetId:v16];

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 parsecClientMetadata]);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 clientDatasetMetadata]);
    [v20 setDatasetId:v16];

    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v6 siriClientMetadata]);
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 clientDatasetMetadata]);
    [v22 setDatasetId:v16];

    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v6 rapClientMetadata]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 clientDatasetMetadata]);
    [v24 setDatasetId:v16];

    [v6 timestamp];
    double v26 = v25;
    [*(id *)(*(void *)(a1 + 32) + 24) timestamp];
    objc_msgSend(v6, "setTimestamp:");
    LODWORD(v16) = [*(id *)(*(void *)(a1 + 32) + 24) isEqual:v6];
    id v27 = [v6 setTimestamp:v26];
    if ((_DWORD)v16)
    {
      uint64_t v28 = GEOFindOrCreateLog(v8, "Experiments");
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v37) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "New experiment configuration is the same as the previous experiment configuration",  (uint8_t *)&v37,  2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      [*(id *)(a1 + 32) _writeExperimentInfoToDisk:v6];
      [*(id *)(*(void *)(a1 + 32) + 24) setTimestamp:v26];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      [WeakRetained _setupRefreshTask];
    }

    else
    {
      uint64_t v30 = GEOExperimentConfigurationPath(v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      id WeakRetained = (id)objc_claimAutoreleasedReturnValue([v31 stringByDeletingLastPathComponent]);

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      LOBYTE(v37) = 0;
      if (![v32 fileExistsAtPath:WeakRetained isDirectory:&v37] || !(_BYTE)v37) {
        [v32 createDirectoryAtPath:WeakRetained withIntermediateDirectories:1 attributes:0 error:0];
      }
      os_unfair_lock_lock_with_options(*(void *)(a1 + 32) + 32LL, 0x10000LL);
      id v33 = *(id *)(*(void *)(a1 + 32) + 24LL);
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 24LL), a2);
      id v34 = *(id *)(*(void *)(a1 + 32) + 24LL);
      [*(id *)(a1 + 32) _writeExperimentInfoToDisk:v6];
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32LL));
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      id v35 = objc_loadWeakRetained((id *)(a1 + 48));
      [v35 _setupRefreshTask];

      id v36 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16LL));
      [v36 serverProxy:*(void *)(a1 + 32) didChangeExperimentsInfo:v6];

      notify_post("com.apple.GeoServices.experimentsChanged");
      if (v33 != v34) {
        [*(id *)(a1 + 32) _notifyExperimentsInfoChanged:v33 current:v34];
      }
    }
  }
}

void sub_10000992C(_Unwind_Exception *a1)
{
}

void sub_100009948(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](&OBJC_CLASS___GEOResourceManifestManager, "modernManager"));
  uint64_t v3 = *(void *)(a1 + 32);
  global_queue = (void *)geo_get_global_queue(21LL);
  [v2 addTileGroupObserver:v3 queue:global_queue];

  a1 += 40LL;
  id WeakRetained = objc_loadWeakRetained((id *)a1);
  [WeakRetained _removeOldExperimentsInfoIfNecessary:0];

  id v6 = objc_loadWeakRetained((id *)a1);
  [v6 _setupRefreshTask];

  id v7 = objc_loadWeakRetained((id *)a1);
  [v7 _updateIfNecessary];
}

void sub_100009BC8(void *a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  os_unfair_lock_lock_with_options(a1[4] + 48LL, 0x10000LL);
  uint64_t v6 = a1[4];
  id v7 = (void *)a1[5];
  if (v7 == *(void **)(v6 + 40))
  {
    *(void *)(v6 + 40) = 0LL;

    uint64_t v6 = a1[4];
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 48));
  [v12 setTimestamp:CFAbsoluteTimeGetCurrent()];
  uint64_t v9 = GEOURLString(26LL, v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v12 setSourceURL:v10];

  uint64_t v11 = a1[6];
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v12, v5);
  }
}

uint64_t sub_100009DCC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

LABEL_7:
  objc_autoreleasePoolPop(v10);
}
}

void sub_10000A1E8(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS____GEOExperimentServiceRequestConfig);
  uint64_t v2 = (void *)qword_10006AF28;
  qword_10006AF28 = (uint64_t)v1;
}

void sub_10000A26C(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS____GEOExperimentServiceRequester);
  uint64_t v2 = (void *)qword_10006AF38;
  qword_10006AF38 = (uint64_t)v1;
}

uint64_t sub_10000A3CC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_10000A5F0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) send];
}

id sub_10000A61C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setError:a2];
  [*(id *)(a1 + 32) setDirectionsError:v6];

  return [*(id *)(a1 + 32) send];
}

uint64_t sub_10000A744(uint64_t a1)
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v1 = qword_10006AF40;
  uint64_t v7 = qword_10006AF40;
  if (!qword_10006AF40)
  {
    v8[0] = *(_OWORD *)off_100059378;
    v8[1] = *(_OWORD *)&off_100059388;
    uint64_t v2 = _sl_dlopen(v8, a1);
    v5[3] = v2;
    qword_10006AF40 = v2;
    uint64_t v1 = v2;
  }

  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10000A7F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_10000A808()
{
  uint64_t v3 = 0LL;
  uint64_t v0 = sub_10000A744((uint64_t)&v3);
  uint64_t v1 = v3;
  if (!v0)
  {
    uint64_t v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_5;
  }

  if (v3) {
LABEL_5:
  }
    free(v1);
  return v0;
}

id sub_10000A860()
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  uint64_t v0 = (void *)qword_10006AF48;
  uint64_t v7 = qword_10006AF48;
  if (!qword_10006AF48)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10000A914;
    v3[3] = &unk_1000593A0;
    void v3[4] = &v4;
    sub_10000A914((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10000A8FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class sub_10000A914(uint64_t a1)
{
  Class result = objc_getClass("CLLocationManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    sub_10003AC4C();
    start();
  }

  qword_10006AF48 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void start()
{
  uint64_t v0 = GEOGetLaunchLog(objc_autoreleasePoolPush());
  id v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  os_signpost_id_t v2 = os_signpost_id_generate(v1);

  uint64_t v4 = GEOGetLaunchLog(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_BEGIN,  v2,  "geod_main",  (const char *)&unk_10004E833,  buf,  2u);
  }

  uint64_t v8 = GEOGetLaunchLog(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  id v11 = +[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale");
  +[NSError _setFileNameLocalizationEnabled:](&OBJC_CLASS___NSError, "_setFileNameLocalizationEnabled:", 0LL);
  GEODefaultsSetUseServer(0LL);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___GEOConfigLocalProxy, v12, v13);
  _GEOConfigSetProxy(v14);
  +[GEOPlatform setIsRunningInGeod:](&OBJC_CLASS___GEOPlatform, "setIsRunningInGeod:", 1LL);
  context = objc_autoreleasePoolPush();
  uint64_t v15 = GEOGetLaunchLog(context);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = v16;
  unint64_t v18 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v17,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "geod_main_subtask",  "privacy manager",  buf,  2u);
  }

  uint64_t v19 = GEOGetLaunchLog(+[GEOPrivacyManager sharedManager](&OBJC_CLASS___GEOPrivacyManager, "sharedManager"));
  __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  __int128 v21 = v20;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_END,  v10,  "geod_main_subtask",  "privacy manager",  buf,  2u);
  }

  uint64_t v23 = GEOGetLaunchLog(v22);
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  double v25 = v24;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v25,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "geod_main_subtask",  "defaults migrator",  buf,  2u);
  }

  uint64_t v26 = GEOMigrateDefaults();
  uint64_t v27 = GEOGetLaunchLog(v26);
  uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  v29 = v28;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v29,  OS_SIGNPOST_INTERVAL_END,  v10,  "geod_main_subtask",  "defaults migrator",  buf,  2u);
  }

  __int128 v148 = 0u;
  __int128 v149 = 0u;
  __int128 v146 = 0u;
  __int128 v147 = 0u;
  id v30 = [&off_10005E430 countByEnumeratingWithState:&v146 objects:v145 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v147;
    do
    {
      id v33 = 0LL;
      do
      {
        if (*(void *)v147 != v32) {
          objc_enumerationMutation(&off_10005E430);
        }
        uint64_t v34 = *(void *)(*((void *)&v146 + 1) + 8LL * (void)v33);
        id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        unsigned int v36 = [v35 fileExistsAtPath:v34];

        if (v36)
        {
          int v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          [v37 removeItemAtPath:v34 error:0];
        }

        id v33 = (char *)v33 + 1;
      }

      while (v31 != v33);
      id v30 = [&off_10005E430 countByEnumeratingWithState:&v146 objects:v145 count:16];
      id v31 = v30;
    }

    while (v30);
  }

  uint64_t v38 = GEOGetLaunchLog(v30);
  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  v40 = v39;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v40,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "geod_main_subtask",  "tiledb migrator",  buf,  2u);
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFilePaths pathFor:](&OBJC_CLASS___GEOFilePaths, "pathFor:", 32778LL));
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFilePaths pathFor:](&OBJC_CLASS___GEOFilePaths, "pathFor:", 16394LL));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v43 fileExistsAtPath:v41])
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v45 = [v44 fileExistsAtPath:v42];

    if ((v45 & 1) == 0) {
      +[GEOTileDB migrateDBFrom:to:](&OBJC_CLASS___GEOTileDB, "migrateDBFrom:to:", v41, v42);
    }
  }

  else
  {
  }

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFilePaths pathFor:](&OBJC_CLASS___GEOFilePaths, "pathFor:", 16394LL));
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFilePaths pathFor:](&OBJC_CLASS___GEOFilePaths, "pathFor:", 32778LL));
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v48 fileExistsAtPath:v46])
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v50 = [v49 fileExistsAtPath:v47];

    if ((v50 & 1) == 0) {
      +[GEOTileDB migrateFilesFrom:to:](&OBJC_CLASS___GEOTileDB, "migrateFilesFrom:to:", v46, v47);
    }
  }

  else
  {
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFilePaths pathFor:](&OBJC_CLASS___GEOFilePaths, "pathFor:", 23LL));
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v53 = [v52 fileExistsAtPath:v51];

  if (v53) {
    +[GEOSQLiteDB deleteAllDBFilesFor:](&OBJC_CLASS___GEOSQLiteDB, "deleteAllDBFilesFor:", v51);
  }

  uint64_t v55 = GEOGetLaunchLog(v54);
  v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
  v57 = v56;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v57,  OS_SIGNPOST_INTERVAL_END,  v10,  "geod_main_subtask",  "tiledb migrator",  buf,  2u);
  }

  uint64_t v59 = GEOGetLaunchLog(v58);
  v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
  v61 = v60;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v61,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "geod_main_subtask",  "configure proxies",  buf,  2u);
  }

  +[GEODirectionsRequester useLocalProxy](&OBJC_CLASS___GEODirectionsRequester, "useLocalProxy");
  +[GEOCountryConfiguration setUseLocalProxy:](&OBJC_CLASS___GEOCountryConfiguration, "setUseLocalProxy:", 1LL);
  +[GEONetworkDefaults setUseLocalProxy:](&OBJC_CLASS___GEONetworkDefaults, "setUseLocalProxy:", 1LL);
  +[GEORequestCounter useLocalProxy](&OBJC_CLASS___GEORequestCounter, "useLocalProxy");
  +[GEOLocationShifter setProxyClass:]( &OBJC_CLASS___GEOLocationShifter,  "setProxyClass:",  objc_opt_class(&OBJC_CLASS____GEOLocationShifterLocalProxy, v62, v63));
  +[GEOResourceManifestManager useLocalProxy](&OBJC_CLASS___GEOResourceManifestManager, "useLocalProxy");
  +[GEOTileServerLocalProxy enableCDSObserversIfNecessary]( &OBJC_CLASS___GEOTileServerLocalProxy,  "enableCDSObserversIfNecessary");
  +[GEOWiFiQualityServiceManager useProxyClass:]( &OBJC_CLASS___GEOWiFiQualityServiceManager,  "useProxyClass:",  objc_opt_class(&OBJC_CLASS___GEOWiFiQualityServiceLocalProxy, v64, v65));
  +[GEOResourceRequester setProxyClass:]( &OBJC_CLASS___GEOResourceRequester,  "setProxyClass:",  objc_opt_class(&OBJC_CLASS___GEOResourceRequesterLocalProxy, v66, v67));
  +[GEOAnalyticsDataService useLocalProxy](&OBJC_CLASS___GEOAnalyticsDataService, "useLocalProxy");
  +[GEOTileLoader setMemoryCacheCountLimit:](&OBJC_CLASS___GEOTileLoader, "setMemoryCacheCountLimit:", 0LL);
  +[GEOTileLoader setMemoryCacheTotalCostLimit:](&OBJC_CLASS___GEOTileLoader, "setMemoryCacheTotalCostLimit:", 0LL);
  +[GEOExperimentConfiguration useProxy:]( &OBJC_CLASS___GEOExperimentConfiguration,  "useProxy:",  objc_opt_class(&OBJC_CLASS___GEOExperimentServerLocalProxy, v68, v69));
  +[GEOTileLoader useLocalLoader](&OBJC_CLASS___GEOTileLoader, "useLocalLoader");
  +[GEOMapDataSubscriptionManager _setSharedManagerUseLocalPersistence:]( &OBJC_CLASS___GEOMapDataSubscriptionManager,  "_setSharedManagerUseLocalPersistence:",  1LL);
  uint64_t v70 = GEOGetLaunchLog( +[GEOSearchAttributionManifestManager useLocalProxy]( &OBJC_CLASS___GEOSearchAttributionManifestManager,  "useLocalProxy"));
  v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
  v72 = v71;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v72,  OS_SIGNPOST_INTERVAL_END,  v10,  "geod_main_subtask",  "configure proxies",  buf,  2u);
  }

  uint64_t v74 = GEOGetLaunchLog(v73);
  v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
  v76 = v75;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v76,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "geod_main_subtask",  "add servers",  buf,  2u);
  }

  id v77 = -[GEODaemon initPrimaryDaemon](objc_alloc(&OBJC_CLASS___GEODaemon), "initPrimaryDaemon");
  objc_msgSend(v77, "addServerClass:", objc_opt_class(GEODefaultsServer, v78, v79));
  objc_msgSend(v77, "addServerClass:", objc_opt_class(GEOResourceManifestServer, v80, v81));
  objc_msgSend(v77, "addServerClass:", objc_opt_class(GEOResourceManifestUpdateAssertionServer, v82, v83));
  objc_msgSend(v77, "addServerClass:", objc_opt_class(GEOTileServer, v84, v85));
  objc_msgSend(v77, "addServerClass:", objc_opt_class(GEOSearchAttributionServer, v86, v87));
  objc_msgSend(v77, "addServerClass:", objc_opt_class(GEOPlaceDataServer, v88, v89));
  objc_msgSend(v77, "addServerClass:", objc_opt_class(GEOCountryConfigurationServer, v90, v91));
  objc_msgSend(v77, "addServerClass:", objc_opt_class(GEOExperimentServer, v92, v93));
  objc_msgSend(v77, "addServerClass:", objc_opt_class(GEOLocationShiftServer, v94, v95));
  objc_msgSend(v77, "addServerClass:", objc_opt_class(GEORequestCounterServer, v96, v97));
  objc_msgSend(v77, "addServerClass:", objc_opt_class(GEODirectionsServer, v98, v99));
  objc_msgSend(v77, "addServerClass:", objc_opt_class(GEOETAServer, v100, v101));
  objc_msgSend(v77, "addServerClass:", objc_opt_class(GEOImageServiceServer, v102, v103));
  objc_msgSend(v77, "addServerClass:", objc_opt_class(GEOTransitUpdateServer, v104, v105));
  objc_msgSend(v77, "addServerClass:", objc_opt_class(GEOResourceServer, v106, v107));
  objc_msgSend(v77, "addServerClass:", objc_opt_class(GEOToolServer, v108, v109));
  objc_msgSend(v77, "addServerClass:", objc_opt_class(GEOUtilityServer, v110, v111));
  objc_msgSend(v77, "addServerClass:", objc_opt_class(GEOWiFiQualityServiceServer, v112, v113));
  objc_msgSend(v77, "addServerClass:", objc_opt_class(GEOThrottlerServer, v114, v115));
  objc_msgSend(v77, "addServerClass:", objc_opt_class(GEOMobileAssetResourceServer, v116, v117));
  id v120 = objc_msgSend(v77, "addServerClass:", objc_opt_class(GEOAnalyticDataServer, v118, v119));
  uint64_t v121 = GEOGetLaunchLog(v120);
  v122 = (os_log_s *)objc_claimAutoreleasedReturnValue(v121);
  v123 = v122;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v122))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v123,  OS_SIGNPOST_INTERVAL_END,  v10,  "geod_main_subtask",  "add servers",  buf,  2u);
  }

  objc_autoreleasePoolPop(context);
  [v77 start];
  sub_1000327D8();
  [v77 initializeAndStartPairedDeviceConnectionIfNecessary];
  uint64_t v124 = sub_100017C50(0LL);
  if (v124)
  {
    v125 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v77 submitBGSTQueue]);
    dispatch_async(v125, &stru_1000593C0);
  }

  uint64_t v126 = GEOGetLaunchLog(v124);
  v127 = (os_log_s *)objc_claimAutoreleasedReturnValue(v126);
  v128 = v127;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v127))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v128,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "geod_main_subtask",  "configure cache delete",  buf,  2u);
  }

  v129 = objc_autoreleasePoolPush();
  v130 = (void *)objc_claimAutoreleasedReturnValue(+[GEODiskSpaceManager sharedManager](&OBJC_CLASS___GEODiskSpaceManager, "sharedManager"));
  v131 = objc_alloc_init(&OBJC_CLASS___GEOImageServiceDiskSpaceProvider);
  -[GEOImageServiceDiskSpaceProvider setDaemon:](v131, "setDaemon:", v77);
  [v130 addDiskSpaceProvider:v131];
  v132 = objc_alloc_init(&OBJC_CLASS___GEOMobileAssetResourceDiskSpaceProvider);
  -[GEOMobileAssetResourceDiskSpaceProvider setDaemon:](v132, "setDaemon:", v77);
  [v130 addDiskSpaceProvider:v132];
  v133 = objc_alloc_init(&OBJC_CLASS___GEOTileCacheDiskSpaceProvider);
  [v130 addDiskSpaceProvider:v133];

  v134 = objc_alloc_init(&OBJC_CLASS___GEOPlaceCardDiskSpaceProvider);
  [v130 addDiskSpaceProvider:v134];

  objc_autoreleasePoolPop(v129);
  uint64_t v136 = GEOGetLaunchLog(v135);
  v137 = (os_log_s *)objc_claimAutoreleasedReturnValue(v136);
  v138 = v137;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v137))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v138,  OS_SIGNPOST_INTERVAL_END,  v10,  "geod_main_subtask",  "configure cache delete",  buf,  2u);
  }

  notify_post(GEODaemonDidStartDarwinNotification);
  global_workloop = (dispatch_queue_s *)geo_get_global_workloop(17LL);
  dispatch_async(global_workloop, &stru_1000593E0);

  uint64_t v141 = GEOGetLaunchLog(v140);
  v142 = (os_log_s *)objc_claimAutoreleasedReturnValue(v141);
  v143 = v142;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v142))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v143,  OS_SIGNPOST_INTERVAL_END,  v2,  "geod_main",  (const char *)&unk_10004E833,  buf,  2u);
  }

  dispatch_main();
}

void sub_10000B5AC(id a1)
{
}

void sub_10000B5B8(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[GEOMapsAuthServiceHelper sharedAuthHelper](&OBJC_CLASS___GEOMapsAuthServiceHelper, "sharedAuthHelper"));
  [v1 refresh:0];
}

void sub_10000B5F4()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFilePaths pathFor:](&OBJC_CLASS___GEOFilePaths, "pathFor:", 1LL));
  v63[0] = v0;
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFilePaths pathFor:](&OBJC_CLASS___GEOFilePaths, "pathFor:", 2LL));
  v63[1] = v1;
  os_signpost_id_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v63, 2LL));

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v52 = 0u;
  __int128 v51 = 0u;
  id obj = v2;
  id v36 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (v36)
  {
    v40 = 0LL;
    uint64_t v35 = *(void *)v52;
    uint64_t v3 = (void **)&APP_SANDBOX_READ_ptr;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v52 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = v4;
        id v5 = *(void **)(*((void *)&v51 + 1) + 8 * v4);
        context = objc_autoreleasePoolPush();
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3[307] defaultManager]);
        v42 = v5;
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 enumeratorAtPath:v5]);

        __int128 v49 = 0u;
        __int128 v50 = 0u;
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        id v39 = v7;
        id v8 = [v39 countByEnumeratingWithState:&v47 objects:v61 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v41 = *(void *)v48;
          do
          {
            os_signpost_id_t v10 = 0LL;
            do
            {
              if (*(void *)v48 != v41) {
                objc_enumerationMutation(v39);
              }
              uint64_t v11 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)v10);
              uint64_t v12 = objc_autoreleasePoolPush();
              uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v42 stringByAppendingPathComponent:v11]);
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3[307] defaultManager]);
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 attributesOfItemAtPath:v13 error:0]);

              if (v15)
              {
                char v46 = 0;
                id v16 = v3;
                uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v3[307] defaultManager]);
                [v17 fileExistsAtPath:v13 isDirectory:&v46];

                unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 lastPathComponent]);
                uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFilePaths pathFor:](&OBJC_CLASS___GEOFilePaths, "pathFor:", 34LL));
                __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 lastPathComponent]);
                unsigned __int8 v21 = [v18 isEqual:v20];

                if ((v21 & 1) != 0)
                {
                  uint64_t v3 = v16;
                }

                else
                {
                  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:NSFileProtectionKey]);
                  unsigned __int8 v23 = [v22 isEqualToString:NSFileProtectionNone];

                  if ((v23 & 1) == 0)
                  {
                    v24 = v40;
                    if (!v40) {
                      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                    }
                    v40 = v24;
                    [v24 addObject:v13];
                  }

                  double v25 = &off_10005E138;
                  if (!v46) {
                    double v25 = &off_10005E150;
                  }
                  uint64_t v26 = v25;
                  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:NSFilePosixPermissions]);
                  unsigned __int8 v28 = [v27 isEqualToNumber:v26];

                  uint64_t v3 = v16;
                  if ((v28 & 1) == 0)
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138543362;
                      v56 = v13;
                      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Fixing file permissions of %{public}@",  buf,  0xCu);
                    }

                    v29 = (void *)objc_claimAutoreleasedReturnValue([v16[307] defaultManager]);
                    NSFileAttributeKey v59 = NSFilePosixPermissions;
                    v60 = v26;
                    id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1LL));
                    id v45 = 0LL;
                    [v29 setAttributes:v30 ofItemAtPath:v13 error:&v45];
                    id v31 = v45;

                    if (v31 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138478083;
                      v56 = v13;
                      __int16 v57 = 2113;
                      id v58 = v31;
                      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Couldn't set permissions for file %{private}@: %{private}@",  buf,  0x16u);
                    }

                    uint64_t v3 = v16;
                  }
                }
              }

              objc_autoreleasePoolPop(v12);
              os_signpost_id_t v10 = (char *)v10 + 1;
            }

            while (v9 != v10);
            id v32 = [v39 countByEnumeratingWithState:&v47 objects:v61 count:16];
            id v9 = v32;
          }

          while (v32);
        }

        objc_autoreleasePoolPop(context);
        uint64_t v4 = v38 + 1;
      }

      while ((id)(v38 + 1) != v36);
      id v36 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
    }

    while (v36);
  }

  else
  {
    v40 = 0LL;
  }

  if ([v40 count])
  {
    id v33 = (void *)objc_claimAutoreleasedReturnValue(+[GEOKeyBagNotification sharedObject](&OBJC_CLASS___GEOKeyBagNotification, "sharedObject"));
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_10000BB98;
    v43[3] = &unk_100059190;
    id v44 = v40;
    [v33 runAfterFirstUnlock:0 block:v43];
  }
}

void sub_10000BB98(uint64_t a1)
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id obj = *(id *)(a1 + 32);
  id v1 = [obj countByEnumeratingWithState:&v13 objects:v23 count:16];
  if (v1)
  {
    id v3 = v1;
    uint64_t v4 = *(void *)v14;
    *(void *)&__int128 v2 = 138478083LL;
    __int128 v10 = v2;
    do
    {
      id v5 = 0LL;
      do
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)v5);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v18 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Fixing file protection level of %{public}@",  buf,  0xCu);
        }

        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", v10));
        NSFileAttributeKey v21 = NSFileProtectionKey;
        NSFileProtectionType v22 = NSFileProtectionNone;
        id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
        id v12 = 0LL;
        [v7 setAttributes:v8 ofItemAtPath:v6 error:&v12];
        id v9 = v12;

        if (v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v10;
          uint64_t v18 = v6;
          __int16 v19 = 2113;
          id v20 = v9;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Couldn't set protection level for file %{private}@: %{private}@",  buf,  0x16u);
        }

        id v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v13 objects:v23 count:16];
    }

    while (v3);
  }
}

id sub_10000BF88(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "user_version") == (id)2)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 log]);
    unsigned int v5 = sub_10000C0C0(v3, 0);
  }

  else if (([*(id *)(a1 + 32) _deleteAndResetDB:0] & 1) == 0)
  {
LABEL_12:
    id v8 = 0LL;
    goto LABEL_11;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 log]);
  unsigned int v7 = sub_10000C0C0(v3, 0);

  if (!v7
    || !objc_msgSend( *(id *)(*(void *)(a1 + 32) + 8),  "prepareStatement:forKey:",  "INSERT OR REPLACE INTO pdplaces VALUES (@pdplacehash,@expiretime,@pdplace);",
                        @"placeInsKey")
    || !objc_msgSend( *(id *)(*(void *)(a1 + 32) + 8),  "prepareStatement:forKey:",  "INSERT OR REPLACE INTO pdplacelookup VALUES (@requestkey,@pdplacehash,@lastaccesstime);",
                        @"placeLookupInsKey")
    || !objc_msgSend( *(id *)(*(void *)(a1 + 32) + 8),  "prepareStatement:forKey:",  "SELECT a.requestkey, a.pdplacehash, b.pdplace, b.expiretime FROM pdplacelookup a, pdplaces b WHE RE a.pdplacehash = b.pdplacehash;",
                        @"lookupAllPlacesKey"))
  {
    goto LABEL_12;
  }

  id v8 = objc_msgSend( *(id *)(*(void *)(a1 + 32) + 8),  "prepareStatement:forKey:",  "SELECT * FROM pdplacelookup;",
         @"lookupAllKeysKey");
LABEL_11:

  return v8;
}

id sub_10000C0C0(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (a2) {
    unsigned int v5 = "DROP TABLE locale";
  }
  else {
    unsigned int v5 = 0LL;
  }
  if (objc_msgSend( v3,  "createTable:withDrop:",  "CREATE TABLE IF NOT EXISTS locale(   rowid INTEGER PRIMARY KEY NOT NULL,    locale TEXT NOT NULL   );",
                       v5)
    && objc_msgSend( v4,  "prepareStatement:forKey:",  "INSERT INTO locale    (rowid, locale)    VALUES (0, @locale);",
                       @"SetLocale"))
  {
    id v6 = [v4 prepareStatement:"SELECT locale    FROM locale;" forKey:@"GetValue"];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

void sub_10000C270( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10000C288(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000C298(uint64_t a1)
{
}

void sub_10000C2A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0LL;
}

void sub_10000C564( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_10000C5A0()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  id v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "_geo_languageAndLocale"));

  return v1;
}

uint64_t sub_10000C5E0(uint64_t a1, void *a2)
{
  return 1LL;
}

void sub_10000C7A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_26:
    goto LABEL_27;
  }

  NSFileAttributeKey v21 = GEOFindOrCreateLog(v11, "GEOPDPlaceCache");
  __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "place does not meet manifest version policy",  buf,  2u);
  }

LABEL_27:
}

LABEL_28:
  if (([*(id *)(a1 + 48) isEqual:v10] & 1) == 0)
  {
    __int16 v19 = sub_100018084();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Enqueued download of newer copy.", buf, 2u);
    }

    [*(id *)(a1 + 48) downloadWithOptions:v3];
  }

  if ([v10 isAvailableForUse])
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

  else if ([v10 isOnDisk])
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100026BFC;
    v24[3] = &unk_1000599B8;
    NSFileAttributeKey v21 = *(void *)(a1 + 56);
    uint64_t v26 = *(id *)(a1 + 64);
    double v25 = v10;
    [v25 downloadWithOptions:0 queue:v21 completion:v24];
  }

  else
  {
    NSFileProtectionType v22 = *(void *)(a1 + 64);
    unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -20LL,  @"Waiting on at least one version to be downloaded"));
    (*(void (**)(uint64_t, void, void *))(v22 + 16))(v22, 0LL, v23);
  }
}

      [v44 addObject:v43];
      v42 = (char *)v42 + 1;
    }

    while (v40 != v42);
    __int128 v50 = [v29 countByEnumeratingWithState:&v69 objects:v75 count:16];
    v40 = v50;
  }

  while (v50);
LABEL_36:

  __int128 v16 = v60;
  __int128 v15 = v61;
  if (![v67 count]) {
    goto LABEL_40;
  }
  __int128 v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -10LL,  @"Unknown resource"));
  -[GEOResourceRequesterLocalProxy failedToResolveResources:withError:]( self,  "failedToResolveResources:withError:",  v67,  v51);
  if ([v38 count] || objc_msgSend(v68, "count"))
  {

LABEL_40:
    if ([v38 count])
    {
      __int128 v52 = GEORegionalResourcesDirectory(v60);
      __int128 v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
      if ([v60 isDefaultConfiguration])
      {
        __int128 v54 = 0LL;
      }

      else
      {
        uint64_t v55 = GEORegionalResourcesDirectory(0LL);
        __int128 v54 = (void *)objc_claimAutoreleasedReturnValue(v55);
      }

      -[GEOResourceRequesterLocalProxy _fetchResources:force:manifestConfiguration:destination:additionalDestination:auditToken:signpostID:]( self,  "_fetchResources:force:manifestConfiguration:destination:additionalDestination:auditToken:signpostID:",  v38,  v63,  v60,  v53,  v54,  v65,  v62);
    }

    if ([v68 count])
    {
      v56 = GEOResourcesPath(v60);
      __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(v56);
      if ([v60 isDefaultConfiguration])
      {
        __int16 v57 = 0LL;
      }

      else
      {
        id v58 = GEOResourcesPath(0LL);
        __int16 v57 = (void *)objc_claimAutoreleasedReturnValue(v58);
      }

      -[GEOResourceRequesterLocalProxy _fetchResources:force:manifestConfiguration:destination:additionalDestination:auditToken:signpostID:]( self,  "_fetchResources:force:manifestConfiguration:destination:additionalDestination:auditToken:signpostID:",  v68,  v63,  v60,  v51,  v57,  v65,  v62);

      goto LABEL_50;
    }
  }

  else
  {
LABEL_50:
  }

  uint64_t v17 = v65;
  uint64_t v18 = v59;
LABEL_52:
  __int16 v19 = v64;
LABEL_53:
}
}

uint64_t sub_10000CDC0(uint64_t a1)
{
  uint64_t v47 = 0LL;
  __int128 v48 = &v47;
  uint64_t v49 = 0x2020000000LL;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void **)(v2 + 8);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_10000D1F0;
  v42[3] = &unk_100059480;
  id v45 = &v47;
  v42[4] = v2;
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 64);
  id v43 = v5;
  uint64_t v46 = v6;
  id v44 = *(id *)(a1 + 48);
  unsigned __int8 v7 = [v4 executeStatement:@"placeInsKey" statementBlock:v42];
  *((_BYTE *)v48 + 24) = v7;
  uint64_t v8 = DefaultLoggingSubsystem;
  if ((v7 & 1) != 0)
  {
    uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
    __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138478083;
      uint64_t v52 = v11;
      __int16 v53 = 2048;
      uint64_t v54 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "wrote place with hash : %{private}@ / expire time : %lld",  buf,  0x16u);
    }

    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v13 = *(id *)(a1 + 56);
    id v14 = [v13 countByEnumeratingWithState:&v38 objects:v50 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v39;
      while (1)
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)i);
          uint64_t v18 = *(void *)(a1 + 32);
          __int16 v19 = *(void **)(a1 + 40);
          id v20 = *(void **)(v18 + 8);
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472LL;
          v34[2] = sub_10000D2CC;
          v34[3] = &unk_100059480;
          id v36 = &v47;
          v34[4] = v18;
          v34[5] = v17;
          id v35 = v19;
          uint64_t v37 = *(void *)(a1 + 72);
          unsigned int v21 = [v20 executeStatement:@"placeLookupInsKey" statementBlock:v34];
          *((_BYTE *)v48 + 24) = v21;
          if ((v21 & 1) != 0)
          {
            uint64_t v22 = GEOFindOrCreateLog(v8, "GEOPDPlaceCache");
            unsigned __int8 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_15;
            }
            uint64_t v24 = (uint64_t)*(double *)(a1 + 72);
            *(_DWORD *)buf = 138478083;
            uint64_t v52 = v17;
            __int16 v53 = 2048;
            uint64_t v54 = v24;
            double v25 = v23;
            os_log_type_t v26 = OS_LOG_TYPE_DEBUG;
            uint64_t v27 = "wrote place lookup key : %{private}@ / access time : %lld";
            uint32_t v28 = 22;
          }

          else
          {
            uint64_t v29 = GEOFindOrCreateLog(v8, "GEOPDPlaceCache");
            unsigned __int8 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              goto LABEL_15;
            }
            *(_DWORD *)buf = 138477827;
            uint64_t v52 = v17;
            double v25 = v23;
            os_log_type_t v26 = OS_LOG_TYPE_ERROR;
            uint64_t v27 = "unable to write place lookup key : %{private}@";
            uint32_t v28 = 12;
          }

          _os_log_impl((void *)&_mh_execute_header, v25, v26, v27, buf, v28);
LABEL_15:

          if (!v21) {
            goto LABEL_21;
          }
        }

        id v14 = [v13 countByEnumeratingWithState:&v38 objects:v50 count:16];
        uint64_t v30 = 1LL;
        if (!v14) {
          goto LABEL_22;
        }
      }
    }

    uint64_t v30 = 1LL;
  }

  else
  {
    uint64_t v31 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPDPlaceCache");
    id v13 = (id)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138477827;
      uint64_t v52 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_ERROR,  "unable to write place with hash : %{private}@",  buf,  0xCu);
    }

LABEL_21:
    uint64_t v30 = 0LL;
  }
        }

        break;
      case 1419:
        uint64_t v29 = objc_opt_class(&OBJC_CLASS___GEOMAResourceReportCorrupt, v14, v15);
        uint64_t v30 = sub_100012270(@"MAResources", v10, v11, v29, v12);
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        uint64_t v22 = v31;
        __int128 v16 = v31 != 0LL;
        if (v31)
        {
          [v31 setSignpostId:a6];
          -[GEOMobileAssetResourceServer reportCorruptWithRequest:](self, "reportCorruptWithRequest:", v22);
          goto LABEL_20;
        }

        goto LABEL_21;
      case 1732:
        __int128 v16 = 1;
        if (sub_100012B28(v12, v11, @"MAResources", v10, &off_10005E850, 1LL))
        {
          __int16 v19 = objc_opt_class(&OBJC_CLASS___GEOMAResourceCalculateFreeableSizeRequest, v17, v18);
          id v20 = sub_100012270(@"MAResources", v10, v11, v19, v12);
          unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          uint64_t v22 = v21;
          __int128 v16 = v21 != 0LL;
          if (v21)
          {
            [v21 setSignpostId:a6];
            -[GEOMobileAssetResourceServer calculateFreeableWithRequest:](self, "calculateFreeableWithRequest:", v22);
LABEL_20:
            __int128 v16 = 1;
            goto LABEL_21;
          }

          goto LABEL_21;
        }

        break;
    }
  }
}

    goto LABEL_22;
  }

  unsigned __int8 v7 = sub_100018084();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = v5 - self->_lastCorruptMessage;
    *(_DWORD *)buf = 134217984;
    __int128 v41 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Will not remove MAResource, last call to reportCorrupt was only %f seconds ago",  buf,  0xCu);
  }

    goto LABEL_27;
  }

  if ([v16 count])
  {
    id v20 = (char *)[v16 count];
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  v20));
    for (i = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v20));
          v20;
          --v20)
    {
      unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPDPlace failedPlaceData](&OBJC_CLASS___GEOPDPlace, "failedPlaceData", v47, v48, v49));
      [i addObject:v23];
    }

    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472LL;
    v59[2] = sub_100037304;
    v59[3] = &unk_10005AAD0;
    v59[4] = self;
    uint64_t v24 = v21;
    v60 = v24;
    [v16 enumerateObjectsUsingBlock:v59];
    if ([v24 count])
    {
      double v25 = (void *)objc_claimAutoreleasedReturnValue([v24 allKeys]);
      os_log_type_t v26 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        uint32_t v28 = @"NO";
        if (v12) {
          uint32_t v28 = @"YES";
        }
        *(_DWORD *)buf = 138477827;
        *(void *)&uint8_t buf[4] = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "Allowed to use cellular data for lookup: %{private}@",  buf,  0xCu);
      }

      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000LL;
      uint64_t v62 = sub_100037444;
      uint64_t v63 = sub_10003746C;
      uint64_t v64 = 0LL;
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472LL;
      v50[2] = sub_100037474;
      v50[3] = &unk_10005AB20;
      v50[4] = self;
      __int128 v51 = v47;
      uint64_t v52 = v17;
      __int16 v53 = v48;
      uint64_t v54 = v49;
      __int16 v57 = buf;
      uint64_t v55 = v24;
      v56 = i;
      id v58 = v12;
      uint64_t v29 = objc_retainBlock(v50);
      uint64_t v30 = *(void **)(*(void *)&buf[8] + 40LL);
      *(void *)(*(void *)&buf[8] + 40LL) = v29;

      (*(void (**)(void))(*(void *)(*(void *)&buf[8] + 40LL) + 16LL))();
      _Block_object_dispose(buf, 8);
    }

    else
    {
      id v45 = sub_100033044(i);
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      ((void (**)(void, void *, void))v19)[2](v19, v46, 0LL);
    }
  }

  else
  {
    __int128 v41 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      id v43 = NSStringFromSelector(a2);
      id v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v44;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "No use running %{public}@ without any phone numbers.",  buf,  0xCu);
    }

    v19[2](v19, 0LL, 0LL);
  }

    goto LABEL_22;
  }

  unsigned __int8 v7 = 0LL;
LABEL_22:

  return v7;
}

LABEL_22:
  _Block_object_dispose(&v47, 8);
  return v30;
}

  return v16;
}

void sub_10000D1B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, char a41)
{
}

BOOL sub_10000D1F0(void *a1, uint64_t a2)
{
  *(_BYTE *)(*(void *)(a1[7] + 8) + 24) = [*(id *)(a1[4] + 8) bindTextParameter:"@pdplacehash" toValue:a1[5] inStatement:a2 error:0];
  if (!*(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL)) {
    return 0LL;
  }
  *(_BYTE *)(*(void *)(a1[7] + 8) + 24) = [*(id *)(a1[4] + 8) bindInt64Parameter:"@expiretime" toValue:a1[8] inStatement:a2 error:0];
  if (!*(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL)) {
    return 0LL;
  }
  *(_BYTE *)(*(void *)(a1[7] + 8) + 24) = [*(id *)(a1[4] + 8) bindBlobNoCopyParameter:"@pdplace" toValue:a1[6] inStatement:a2 error:0];
  return *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) != 0;
}

BOOL sub_10000D2CC(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) bindTextParameter:"@requestkey" toValue:*(void *)(a1 + 40) inStatement:a2 error:0];
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)) {
    return 0LL;
  }
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) bindTextParameter:"@pdplacehash" toValue:*(void *)(a1 + 48) inStatement:a2 error:0];
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)) {
    return 0LL;
  }
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) bindInt64Parameter:"@lastaccesstime" toValue:(uint64_t)*(double *)(a1 + 64) inStatement:a2 error:0];
  return *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) != 0;
}

LABEL_16:
}
    }
  }

  else
  {
    if (v13 == 944)
    {
      uint64_t v18 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
      __int128 v16 = v18;
      id v14 = v18 != 0LL;
      if (v18)
      {
        [v18 setSignpostId:a6];
        -[GEOUtilityServer heartbeatWithMessage:](self, "heartbeatWithMessage:", v16);
        goto LABEL_15;
      }

      goto LABEL_16;
    }

    if (v13 == 1662)
    {
      uint64_t v15 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
      __int128 v16 = v15;
      id v14 = v15 != 0LL;
      if (v15)
      {
        [v15 setSignpostId:a6];
        -[GEOUtilityServer getHomeDirectoryWithMessage:](self, "getHomeDirectoryWithMessage:", v16);
LABEL_15:
        id v14 = 1;
        goto LABEL_16;
      }

      goto LABEL_16;
    }
  }

    uint64_t v8 = -7LL;
    goto LABEL_17;
  }

  if (v7 == 60)
  {
    uint64_t v8 = -28LL;
    goto LABEL_17;
  }

  if (v7 == 30)
  {
    if ([v3 placeSearchResponsesCount] == (id)2)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 placeSearchResponseAtIndex:0]);
      __int128 v10 = [v9 status];

      if (v10)
      {
        uint64_t v8 = -401LL;
        goto LABEL_17;
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 placeSearchResponseAtIndex:1]);
      id v14 = [v13 status];

      if (v14)
      {
        uint64_t v8 = -402LL;
        goto LABEL_17;
      }
    }

    goto LABEL_16;
  }

  if (v7 != 5) {
    goto LABEL_16;
  }
  uint64_t v8 = -10LL;
LABEL_17:
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:userInfo:](&OBJC_CLASS___NSError, "GEOErrorWithCode:userInfo:", v8, v6));
LABEL_18:

  return v11;
}

void sub_10000D9A8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pdPlaceCacheKeyForRequest:0]);
  id v5 = [*(id *)(a1 + 48) copy];
  [v2 _storePlace:v3 withHash:v4 forRequestKeys:v5];

  uint64_t v6 = *(void **)(a1 + 64);
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7)
    {
      global_queue = *(dispatch_queue_s **)(a1 + 56);
    }

    else
    {
      global_queue = (dispatch_queue_s *)geo_get_global_queue(17LL);
      uint64_t v6 = *(void **)(a1 + 64);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000DA94;
    block[3] = &unk_1000591E0;
    id v10 = v6;
    dispatch_async(global_queue, block);
    if (!v7) {
  }
    }

uint64_t sub_10000DA94(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10000DAA0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000DEE0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 56) copy];
  [v2 _storePlace:v3 withHash:v4 forRequestKeys:v5];

  uint64_t v6 = *(void **)(a1 + 72);
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 64);
    if (v7)
    {
      global_queue = *(dispatch_queue_s **)(a1 + 64);
    }

    else
    {
      global_queue = (dispatch_queue_s *)geo_get_global_queue(17LL);
      uint64_t v6 = *(void **)(a1 + 72);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000DFB4;
    block[3] = &unk_1000591E0;
    id v10 = v6;
    dispatch_async(global_queue, block);
    if (!v7) {
  }
    }

uint64_t sub_10000DFB4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10000DFC0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10000E470(uint64_t a1)
{
  return [*(id *)(a1 + 32) _evictPlaceWithHash:*(void *)(a1 + 40)];
}

void sub_10000E758( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

id sub_10000E794(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 72);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000E7FC;
  v5[3] = &unk_100059548;
  __int128 v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  return [v2 _lookupPlaceByRequestKey:v1 allowExpiredPlace:v3 resultBlock:v5];
}

void sub_10000E7FC(void *a1, void *a2, char a3, uint64_t a4)
{
  id v8 = a2;
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = a3;
  *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = a4;
}

void sub_10000EAF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 160), 8);
  _Unwind_Resume(a1);
}

id sub_10000EB34(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 72);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000EB9C;
  v5[3] = &unk_100059548;
  __int128 v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  return [v2 _lookupPlaceByRequestKey:v1 allowExpiredPlace:v3 resultBlock:v5];
}

void sub_10000EB9C(void *a1, void *a2, char a3, uint64_t a4)
{
  id v8 = a2;
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = a3;
  *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = a4;
}

void sub_10000F02C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 160), 8);
  _Unwind_Resume(a1);
}

id sub_10000F068(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 72);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000F0D0;
  v5[3] = &unk_100059548;
  __int128 v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  return [v2 _lookupPlaceByRequestKey:v1 allowExpiredPlace:v3 resultBlock:v5];
}

void sub_10000F0D0(void *a1, void *a2, char a3, uint64_t a4)
{
  id v8 = a2;
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = a3;
  *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = a4;
}

void sub_10000F3B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

id sub_10000F3F4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 72);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000F45C;
  v5[3] = &unk_100059548;
  __int128 v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  return [v2 _lookupPlaceByRequestKey:v1 allowExpiredPlace:v3 resultBlock:v5];
}

void sub_10000F45C(void *a1, void *a2, char a3, uint64_t a4)
{
  id v8 = a2;
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = a3;
  *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = a4;
}

void sub_10000F758( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10000F788(void *a1)
{
  if (objc_msgSend( *(id *)(a1[4] + 8),  "prepareStatement:forKey:",  "SELECT pdplacehash FROM pdplacelookup WHERE requestkey = @requestkey;",
                       @"lookupMUIDByPhoneKey"))
  {
    uint64_t v2 = (sqlite3_stmt *)[*(id *)(a1[4] + 8) statementForKey:@"lookupMUIDByPhoneKey"];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"phNo-",  a1[5]));
    uint64_t v4 = *(void **)(a1[4] + 8LL);
    id v11 = 0LL;
    unsigned int v5 = [v4 bindTextParameter:"@requestkey" toValue:v3 inStatement:v2 error:&v11];
    id v6 = v11;
    if (v5)
    {
      if (sqlite3_step(v2) == 100)
      {
        while (1)
        {
          uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 8) stringForColumn:0 inStatment:v2]);
          if ([v7 hasPrefix:@"muid-"])
          {
            id v8 = objc_claimAutoreleasedReturnValue( objc_msgSend( v7, "substringFromIndex:", objc_msgSend(@"muid-", "length")));
            unint64_t v9 = strtouq((const char *)[v8 UTF8String], 0, 10);
            uint64_t v10 = a1[6];
            goto LABEL_10;
          }

          if (sqlite3_step(v2) != 100) {
            goto LABEL_11;
          }
        }

        id v8 = objc_claimAutoreleasedReturnValue( objc_msgSend( v7, "substringFromIndex:", objc_msgSend(@"bmid-", "length")));
        unint64_t v9 = strtouq((const char *)[v8 UTF8String], 0, 10);
        uint64_t v10 = a1[7];
LABEL_10:
        *(void *)(*(void *)(v10 + 8) + 24LL) = v9;
      }

void sub_10000FA48(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _calculateFreeableSpace];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000FAC4;
  v3[3] = &unk_1000595C0;
  id v4 = *(id *)(a1 + 40);
  id v5 = v2;
  geo_dispatch_async_qos(17LL, v3);
}

uint64_t sub_10000FAC4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

void sub_10000FBBC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_10000FBD4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _calculateFreeableSpace];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_10000FD00(const char **a1, int a2, const char **a3)
{
  if (a2)
  {
    id v4 = *a3;
    if (*a3) {
      id v4 = (const char *)strtoll(v4, 0LL, 10);
    }
  }

  else
  {
    id v4 = 0LL;
  }

  *a1 = v4;
  return 0LL;
}

void sub_10000FE54( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000FE6C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _shrinkBySize:*(void *)(a1 + 56)];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000FEF8;
  v4[3] = &unk_100059610;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = v2;
  uint64_t v6 = v3;
  geo_dispatch_async_qos(17LL, v4);
}

uint64_t sub_10000FEF8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
}

void sub_100010008( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id sub_100010020(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _shrinkBySize:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

id sub_10001014C(uint64_t a1)
{
  id result = objc_msgSend( *(id *)(*(void *)(a1 + 32) + 8),  "prepareStatement:forKey:",  "DELETE FROM pdplaces ORDER BY expiretime ASC LIMIT @limit;",
             @"pdPlaceDelWithLimit");
  if ((_DWORD)result)
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 8) statementForKey:@"pdPlaceDelWithLimit"];
    id result = [*(id *)(*(void *)(a1 + 32) + 8) bindIntParameter:"@limit" toValue:*(unsigned int *)(a1 + 40) inStatement:v3 error:0];
    if ((_DWORD)result)
    {
      id result = [*(id *)(*(void *)(a1 + 32) + 8) executeStatement:v3 error:0];
      if ((_DWORD)result) {
        return (id)(sqlite3_exec( (sqlite3 *)[*(id *)(*(void *)(a1 + 32) + 8) sqliteDB],  "DELETE FROM pdplacelookup WHERE requestkey NOT LIKE phNo-% AND pdplacehash NOT IN         (SEL ECT pdplacehash FROM pdplaces);",
      }
                      0LL,
                      0LL,
                      0LL) == 0);
    }
  }

  return result;
}

id sub_1000102C0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100010318;
  v4[3] = &unk_1000596B0;
  void v4[4] = v1;
  return [v2 executeInTransaction:v4];
}

BOOL sub_100010318(uint64_t a1)
{
  return !sqlite3_exec( (sqlite3 *)[*(id *)(*(void *)(a1 + 32) + 8) sqliteDB],  "DELETE FROM pdplacelookup WHERE requestkey LIKE phNo-%;",
            0LL,
            0LL,
            0LL)
      && sqlite3_exec( (sqlite3 *)[*(id *)(*(void *)(a1 + 32) + 8) sqliteDB],  "DELETE FROM pdplaces WHERE pdplacehash NOT IN (SELECT pdplacehash FROM pdplacelookup);",
           0LL,
           0LL,
           0LL) == 0;
}

id sub_100010448(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000104B8;
  v5[3] = &unk_1000596B0;
  void v5[4] = v2;
  return [v3 executeInTransaction:v5];
}

BOOL sub_1000104B8(uint64_t a1)
{
  return !sqlite3_exec( (sqlite3 *)[*(id *)(*(void *)(a1 + 32) + 8) sqliteDB],  "DELETE FROM pdplaces;",
            0LL,
            0LL,
            0LL)
      && sqlite3_exec( (sqlite3 *)[*(id *)(*(void *)(a1 + 32) + 8) sqliteDB],  "DELETE FROM pdplacelookup WHERE requestkey NOT LIKE phNo-% AND pdplacehash NOT IN         (SELECT pdplace hash FROM pdplaces);",
           0LL,
           0LL,
           0LL) == 0;
}

id sub_10001073C(uint64_t a1)
{
  return [*(id *)(a1 + 32) periodicCleanupAndAccessTimeUpdate];
}

id sub_100010CFC(uint64_t a1)
{
  if (objc_msgSend( *(id *)(*(void *)(a1 + 32) + 8),  "prepareStatement:forKey:",  "DELETE FROM pdplaces WHERE pdplacehash = @pdplacehash;",
                       @"placeRemovePlaceKey")
    && (id v2 = [*(id *)(*(void *)(a1 + 32) + 8) statementForKey:@"placeRemovePlaceKey"],
        [*(id *)(*(void *)(a1 + 32) + 8) bindTextParameter:"@pdplacehash" toValue:*(void *)(a1 + 40) inStatement:v2 error:0])
    && [*(id *)(*(void *)(a1 + 32) + 8) executeStatement:v2 error:0]
    && objc_msgSend( *(id *)(*(void *)(a1 + 32) + 8),  "prepareStatement:forKey:",  "DELETE FROM pdplacelookup WHERE pdplacehash = @pdplacehash;",
                       @"placeLookupRemovePlaceKey")
    && (id v3 = [*(id *)(*(void *)(a1 + 32) + 8) statementForKey:@"placeLookupRemovePlaceKey"],
        [*(id *)(*(void *)(a1 + 32) + 8) bindTextParameter:"@pdplacehash" toValue:*(void *)(a1 + 40) inStatement:v3 error:0]))
  {
    return [*(id *)(*(void *)(a1 + 32) + 8) executeStatement:v3 error:0];
  }

  else
  {
    return 0LL;
  }

id sub_100010E58(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) tearDown];
}

void sub_100010F2C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(v2 + 8);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100010FCC;
  v5[3] = &unk_100059700;
  void v5[4] = v2;
  id v6 = v3;
  id v7 = *(id *)(a1 + 48);
  [v4 statementForKey:@"lookupAllPlacesKey" statementBlock:v5];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

uint64_t sub_100010FCC(void *a1, sqlite3_stmt *a2)
{
  while (sqlite3_step(a2) == 100)
  {
    id v4 = objc_autoreleasePoolPush();
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 8) stringForColumn:0 inStatment:a2]);
    id v6 = (void *)a1[5];
    if (v6 && ([v6 evaluateWithObject:v5] & 1) == 0)
    {

      objc_autoreleasePoolPop(v4);
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 8) stringForColumn:1 inStatment:a2]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 8) noCopyBlobForColumn:2 inStatment:a2]);
      unint64_t v9 = -[GEOPDPlace initWithData:](objc_alloc(&OBJC_CLASS___GEOPDPlace), "initWithData:", v8);
      [*(id *)(a1[4] + 8) int64ForColumn:3 inStatment:a2];
      int v10 = (*(uint64_t (**)(void))(a1[6] + 16LL))();

      objc_autoreleasePoolPop(v4);
      if (!v10) {
        return 1LL;
      }
    }
  }

  return 1LL;
}

void sub_100011420(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(v2 + 8);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000114C0;
  v5[3] = &unk_100059700;
  void v5[4] = v2;
  id v6 = v3;
  id v7 = *(id *)(a1 + 48);
  [v4 statementForKey:@"lookupAllKeysKey" statementBlock:v5];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

uint64_t sub_1000114C0(void *a1, sqlite3_stmt *a2)
{
  for (i = a2; sqlite3_step(i) == 100; i = a2)
  {
    id v5 = objc_autoreleasePoolPush();
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 8) stringForColumn:0 inStatment:a2]);
    id v7 = (void *)a1[5];
    if (v7 && ([v7 evaluateWithObject:v6] & 1) == 0)
    {

      objc_autoreleasePoolPop(v5);
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 8) stringForColumn:1 inStatment:a2]);
      [*(id *)(a1[4] + 8) int64ForColumn:2 inStatment:a2];
      int v9 = (*(uint64_t (**)(void))(a1[6] + 16LL))();

      objc_autoreleasePoolPop(v5);
      if (!v9) {
        return 1LL;
      }
    }
  }

  return 1LL;
}

void sub_100011978(uint64_t a1)
{
  uint64_t v2 = *(dispatch_source_s **)(*(void *)(a1 + 32) + 32LL);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0LL;
  }

uint64_t sub_100011B2C(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = sqlite3_step(a2);
  while ((_DWORD)v4 == 100)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringForColumn:0 inStatment:a2]);
    if (((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))() & 1) == 0)
    {

      return 1LL;
    }

    uint64_t v4 = sqlite3_step(a2);
  }

  if ((_DWORD)v4 != 101)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id obj = *(id *)(v7 + 40);
    [v6 reportSQLiteErrorCode:v4 method:@"step" error:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);
    return 0LL;
  }

  return 1LL;
}

id sub_100011BFC(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v4 = *(void *)(a1[6] + 8LL);
  id obj = *(id *)(v4 + 40);
  id v5 = [v3 bindTextParameter:"@locale" toValue:v2 inStatement:a2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  return v5;
}

unint64_t sub_100011D18(void *a1)
{
  unint64_t result = (unint64_t)[a1 UTF8String];
  LOBYTE(v2) = *(_BYTE *)result;
  if (!*(_BYTE *)result) {
    return 0LL;
  }
  unint64_t v3 = result;
  unint64_t v4 = 0LL;
  LODWORD(result) = 0;
  unint64_t v5 = v3 + 1;
  do
  {
    unint64_t result = (result + (char)v2);
    if (v4 > 0x30) {
      break;
    }
    int v2 = *(unsigned __int8 *)(v5 + v4++);
  }

  while (v2);
  return result;
}

LABEL_41:
          break;
      }
    }
  }

  else if (v13 > 1850)
  {
    switch(v13)
    {
      case 1851:
        __int128 v38 = objc_opt_class(&OBJC_CLASS___GEOConfigGetExpiringKeysRequest, v14, v15);
        __int128 v39 = sub_100012270(@"defaults", v10, v11, v38, v12);
        __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        uint64_t v18 = v40;
        __int128 v16 = v40 != 0LL;
        if (v40)
        {
          [v40 setSignpostId:a6];
          -[GEODefaultsServer getAllExpiringKeysWithRequest:](self, "getAllExpiringKeysWithRequest:", v18);
          goto LABEL_40;
        }

        goto LABEL_41;
      case 1854:
        __int128 v41 = objc_opt_class(&OBJC_CLASS___GEOConfigMigrateEntitledKeyRequest, v14, v15);
        v42 = sub_100012270(@"defaults", v10, v11, v41, v12);
        id v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
        uint64_t v18 = v43;
        __int128 v16 = v43 != 0LL;
        if (v43)
        {
          [v43 setSignpostId:a6];
          -[GEODefaultsServer migrageEntitledKeyWithRequest:](self, "migrageEntitledKeyWithRequest:", v18);
          goto LABEL_40;
        }

        goto LABEL_41;
      case 1933:
        uint64_t v22 = objc_opt_class(&OBJC_CLASS___GEOConfigGetAllValueInStoreRequest, v14, v15);
        unsigned __int8 v23 = sub_100012270(@"defaults", v10, v11, v22, v12);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        uint64_t v18 = v24;
        __int128 v16 = v24 != 0LL;
        if (v24)
        {
          [v24 setSignpostId:a6];
          -[GEODefaultsServer getAllValuesInStoreWithRequest:](self, "getAllValuesInStoreWithRequest:", v18);
          goto LABEL_40;
        }

        goto LABEL_41;
    }
  }

  else
  {
    switch(v13)
    {
      case 1467:
        os_log_type_t v26 = objc_opt_class(&OBJC_CLASS___GEOConfigSetExpiringKeyRequest, v14, v15);
        uint64_t v27 = sub_100012270(@"defaults", v10, v11, v26, v12);
        uint32_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        uint64_t v18 = v28;
        __int128 v16 = v28 != 0LL;
        if (v28)
        {
          [v28 setSignpostId:a6];
          -[GEODefaultsServer setExpiringKeyWithRequest:](self, "setExpiringKeyWithRequest:", v18);
          goto LABEL_40;
        }

        goto LABEL_41;
      case 1537:
        uint64_t v29 = objc_opt_class(&OBJC_CLASS___GEOConfigClearExpiredKeyRequest, v14, v15);
        uint64_t v30 = sub_100012270(@"defaults", v10, v11, v29, v12);
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        uint64_t v18 = v31;
        __int128 v16 = v31 != 0LL;
        if (v31)
        {
          [v31 setSignpostId:a6];
          -[GEODefaultsServer clearExpiredKeyWithRequest:](self, "clearExpiredKeyWithRequest:", v18);
          goto LABEL_40;
        }

        goto LABEL_41;
      case 1652:
        uint64_t v17 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
        uint64_t v18 = v17;
        __int128 v16 = v17 != 0LL;
        if (v17)
        {
          [v17 setSignpostId:a6];
          -[GEODefaultsServer resetAllDefaultsWithMessage:](self, "resetAllDefaultsWithMessage:", v18);
LABEL_40:
          __int128 v16 = 1;
          goto LABEL_41;
        }

        goto LABEL_41;
    }
  }

  return v16;
}

  return v16;
}

id sub_100012270(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a5;
  id v23 = 0LL;
  uint64_t v13 = GEODecodeModernXPCMessage(v11, a4, &v23);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v23;
  __int128 v16 = v15;
  if (!v14 || v15)
  {
    uint64_t v21 = GEOGetGEODaemonLog();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Unable to decode request: %@", buf, 0xCu);
    }

    id v20 = 0LL;
  }

  else
  {
    [v14 setService:v9];
    [v14 setMethod:v10];
    [v14 setPeer:v12];
    xpc_object_t value = xpc_dictionary_get_value(v11, "progress_observer_endpoint");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(value);
    if (v18)
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress _geo_mirroredProgressFromReportingXPCEndpoint:totalUnitCount:]( &OBJC_CLASS___NSProgress,  "_geo_mirroredProgressFromReportingXPCEndpoint:totalUnitCount:",  v18,  1LL));
      [v14 setProgress:v19];
    }

    id v20 = v14;
  }

  return v20;
}

LABEL_15:
    }
  }

  else
  {
    if (v13 == 1521)
    {
      uint64_t v24 = objc_opt_class(&OBJC_CLASS___GEOETARequestUpdateable, v14, v15);
      double v25 = sub_100012270(@"ETA", v10, v11, v24, v12);
      os_log_type_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      id v20 = v26;
      __int128 v16 = v26 != 0LL;
      if (v26)
      {
        [v26 setSignpostId:a6];
        -[GEOETAServer startETARequestWithRequest:](self, "startETARequestWithRequest:", v20);
        goto LABEL_14;
      }

      goto LABEL_15;
    }

    if (v13 == 1577)
    {
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___GEOETARequestUpdateable, v14, v15);
      uint64_t v18 = sub_100012270(@"ETA", v10, v11, v17, v12);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      id v20 = v19;
      __int128 v16 = v19 != 0LL;
      if (v19)
      {
        [v19 setSignpostId:a6];
        -[GEOETAServer cancelETARequestWithRequest:](self, "cancelETARequestWithRequest:", v20);
LABEL_14:
        __int128 v16 = 1;
        goto LABEL_15;
      }

      goto LABEL_15;
    }
  }

  return v16;
}

  return v7;
}
}

        id v12 = -7LL;
        goto LABEL_17;
      }
    }

    else if (v11)
    {
      if (v11 == 1)
      {
        id v12 = -8LL;
        goto LABEL_17;
      }

      if (v11 == 5)
      {
        id v12 = -10LL;
LABEL_17:
        uint64_t v19 = [[GEOETATrafficUpdateErrorInfo alloc] initWithResponse:v10];
        if (v19)
        {
          id v20 = (void *)objc_claimAutoreleasedReturnValue(+[GEOETATrafficUpdateErrorInfo key](&OBJC_CLASS___GEOETATrafficUpdateErrorInfo, "key"));
          id v23 = v20;
          uint64_t v24 = v19;
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
        }

        else
        {
          uint64_t v21 = 0LL;
        }

        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:userInfo:",  v12,  v21));

        goto LABEL_21;
      }

      goto LABEL_15;
    }

LABEL_34:
            goto LABEL_35;
          }

          goto LABEL_28;
        }

        goto LABEL_35;
      }

      if (sub_100012B28(v12, v11, @"experiments", v10, &off_10005E490, 0LL))
      {
        uint64_t v21 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
        __int128 v16 = v21;
        id v14 = v21 != 0LL;
        if (v21)
        {
          [v21 setSignpostId:a6];
          -[GEOExperimentServer setActiveBranchWithMessage:](self, "setActiveBranchWithMessage:", v16);
          goto LABEL_33;
        }

        goto LABEL_34;
      }
    }

LABEL_28:
    id v14 = 1;
    goto LABEL_35;
  }

  if (v13 > 1445)
  {
    if (v13 == 1446)
    {
      uint64_t v22 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
      __int128 v16 = v22;
      id v14 = v22 != 0LL;
      if (v22)
      {
        [v22 setSignpostId:a6];
        -[GEOExperimentServer fetchAssignUUIDWithMessage:](self, "fetchAssignUUIDWithMessage:", v16);
        goto LABEL_33;
      }

      goto LABEL_34;
    }

    if (v13 == 1461)
    {
      uint64_t v18 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
      __int128 v16 = v18;
      id v14 = v18 != 0LL;
      if (v18)
      {
        [v18 setSignpostId:a6];
        -[GEOExperimentServer refreshDatasetWithMessage:](self, "refreshDatasetWithMessage:", v16);
        goto LABEL_33;
      }

      goto LABEL_34;
    }
  }

  else
  {
    if (v13 == 643)
    {
      id v20 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
      __int128 v16 = v20;
      id v14 = v20 != 0LL;
      if (v20)
      {
        [v20 setSignpostId:a6];
        -[GEOExperimentServer updateWithMessage:](self, "updateWithMessage:", v16);
        goto LABEL_33;
      }

      goto LABEL_34;
    }

    if (v13 == 1111)
    {
      if (sub_100012B28(v12, v11, @"experiments", v10, &off_10005E4A8, 0LL))
      {
        id v15 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
        __int128 v16 = v15;
        id v14 = v15 != 0LL;
        if (v15)
        {
          [v15 setSignpostId:a6];
          -[GEOExperimentServer setBucketIdWithMessage:](self, "setBucketIdWithMessage:", v16);
LABEL_33:
          id v14 = 1;
          goto LABEL_34;
        }

        goto LABEL_34;
      }

      goto LABEL_28;
    }
  }

LABEL_35:
  return v14;
}

uint64_t sub_100012B28(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v15 = a5;
  id v16 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v30;
    while (2)
    {
      uint64_t v19 = 0LL;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        if ([v11 hasEntitlement:*(void *)(*((void *)&v29 + 1) + 8 * (void)v19)])
        {
          uint64_t v27 = 1LL;
          xpc_object_t reply = v15;
          goto LABEL_13;
        }

        uint64_t v19 = (char *)v19 + 1;
      }

      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  xpc_object_t reply = xpc_dictionary_create_reply(v12);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is missing required entitlement to call %@.%@",  v21,  v13,  v14));

  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:reason:](&OBJC_CLASS___NSError, "GEOErrorWithCode:reason:", -5LL, v22));
  uint64_t v24 = GEOGetGEODaemonLog();
  double v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v34 = v22;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
  }

  id v26 = [[GEOXPCReplyError alloc] initWithReplyObject:reply error:v23 mode:a6];
  [v26 send];

  uint64_t v27 = 0LL;
LABEL_13:

  return v27;
}

LABEL_40:
            break;
        }
      }
    }

    else if (v13 > 2916)
    {
      switch(v13)
      {
        case 2917:
          uint64_t v24 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
          id v16 = v24;
          id v14 = v24 != 0LL;
          if (v24)
          {
            [v24 setSignpostId:a6];
            -[GEOToolServer notifyNetworkDefaultsChangedWithMessage:]( self,  "notifyNetworkDefaultsChangedWithMessage:",  v16);
            goto LABEL_39;
          }

          goto LABEL_40;
        case 3214:
          double v25 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
          id v16 = v25;
          id v14 = v25 != 0LL;
          if (v25)
          {
            [v25 setSignpostId:a6];
            -[GEOToolServer forceProactiveTileDownloaderRunWithMessage:]( self,  "forceProactiveTileDownloaderRunWithMessage:",  v16);
            goto LABEL_39;
          }

          goto LABEL_40;
        case 3980:
          uint64_t v18 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
          id v16 = v18;
          id v14 = v18 != 0LL;
          if (v18)
          {
            [v18 setSignpostId:a6];
            -[GEOToolServer checkProactiveTileDownloadPolicyEnabledWithMessage:]( self,  "checkProactiveTileDownloadPolicyEnabledWithMessage:",  v16);
            goto LABEL_39;
          }

          goto LABEL_40;
      }
    }

    else
    {
      switch(v13)
      {
        case 1728:
          id v20 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
          id v16 = v20;
          id v14 = v20 != 0LL;
          if (v20)
          {
            [v20 setSignpostId:a6];
            -[GEOToolServer freePurgableSpaceWithMessage:](self, "freePurgableSpaceWithMessage:", v16);
            goto LABEL_39;
          }

          goto LABEL_40;
        case 1923:
          uint64_t v21 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
          id v16 = v21;
          id v14 = v21 != 0LL;
          if (v21)
          {
            [v21 setSignpostId:a6];
            -[GEOToolServer invalidateTileCacheWithMessage:](self, "invalidateTileCacheWithMessage:", v16);
            goto LABEL_39;
          }

          goto LABEL_40;
        case 2252:
          id v15 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
          id v16 = v15;
          id v14 = v15 != 0LL;
          if (v15)
          {
            [v15 setSignpostId:a6];
            -[GEOToolServer calculatePurgableSpaceWithMessage:](self, "calculatePurgableSpaceWithMessage:", v16);
LABEL_39:
            id v14 = 1;
            goto LABEL_40;
          }

          goto LABEL_40;
      }
    }
  }

  else
  {
    id v14 = 1;
  }

  return v14;
}

          goto LABEL_41;
        }

        break;
      default:
        goto LABEL_41;
    }

LABEL_17:
    }
  }

  else if (v13 == 1410)
  {
    id v16 = 1;
    if (sub_100012B28(v12, v11, @"ImageService", v10, &off_10005E508, 1LL))
    {
      uint32_t v28 = objc_opt_class(&OBJC_CLASS___GEOImageServicePurgeCacheToSizeRequest, v26, v27);
      __int128 v29 = sub_100012270(@"ImageService", v10, v11, v28, v12);
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      uint64_t v22 = v30;
      id v16 = v30 != 0LL;
      if (v30)
      {
        [v30 setSignpostId:a6];
        -[GEOImageServiceServer purgeDiskCacheWithRequest:](self, "purgeDiskCacheWithRequest:", v22);
        goto LABEL_16;
      }

      goto LABEL_17;
    }
  }

  else if (v13 == 1732)
  {
    id v16 = 1;
    if (sub_100012B28(v12, v11, @"ImageService", v10, &off_10005E4F0, 1LL))
    {
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___GEOImageServiceCalculateFreeableSizeRequest, v17, v18);
      id v20 = sub_100012270(@"ImageService", v10, v11, v19, v12);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      uint64_t v22 = v21;
      id v16 = v21 != 0LL;
      if (v21)
      {
        [v21 setSignpostId:a6];
        -[GEOImageServiceServer calculateFreeableWithRequest:](self, "calculateFreeableWithRequest:", v22);
LABEL_16:
        id v16 = 1;
        goto LABEL_17;
      }

      goto LABEL_17;
    }
  }

  return v16;
}

  return v14;
}

LABEL_36:
        }
      }
    }
  }

  else if (v13 <= 1927)
  {
    if (v13 == 1574)
    {
      id v45 = objc_opt_class(&OBJC_CLASS___GEOLocationShiftingFunctionRequest, v14, v15);
      uint64_t v46 = sub_100012270(@"locationshift", v10, v11, v45, v12);
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
      id v20 = v47;
      id v16 = v47 != 0LL;
      if (v47)
      {
        [v47 setSignpostId:a6];
        -[GEOLocationShiftServer shiftCoordinateWithRequest:](self, "shiftCoordinateWithRequest:", v20);
        goto LABEL_35;
      }

      goto LABEL_36;
    }

    if (v13 == 1612)
    {
      id v26 = objc_opt_class(&OBJC_CLASS___GEOLocationShiftingVersionRequest, v14, v15);
      uint64_t v27 = sub_100012270(@"locationshift", v10, v11, v26, v12);
      uint32_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      id v20 = v28;
      id v16 = v28 != 0LL;
      if (v28)
      {
        [v28 setSignpostId:a6];
        -[GEOLocationShiftServer functionVersionWithRequest:](self, "functionVersionWithRequest:", v20);
        goto LABEL_35;
      }

      goto LABEL_36;
    }
  }

  else
  {
    switch(v13)
    {
      case 1928:
        id v16 = 1;
        if (sub_100012B28(v12, v11, @"locationshift", v10, &off_10005E568, 1LL))
        {
          id v36 = objc_opt_class(&OBJC_CLASS___GEOLocationShiftingCachedResponseFetchRequest, v34, v35);
          uint64_t v37 = sub_100012270(@"locationshift", v10, v11, v36, v12);
          __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
          id v20 = v38;
          id v16 = v38 != 0LL;
          if (v38)
          {
            [v38 setSignpostId:a6];
            -[GEOLocationShiftServer fetchCachedFunctionWithRequest:](self, "fetchCachedFunctionWithRequest:", v20);
            goto LABEL_35;
          }

          goto LABEL_36;
        }

        break;
      case 1960:
        __int128 v39 = objc_opt_class(&OBJC_CLASS___GEOLocationShiftingIsRequiredRequest, v14, v15);
        __int128 v40 = sub_100012270(@"locationshift", v10, v11, v39, v12);
        __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        id v20 = v41;
        id v16 = v41 != 0LL;
        if (v41)
        {
          [v41 setSignpostId:a6];
          -[GEOLocationShiftServer isRequiredForRegionWithRequest:](self, "isRequiredForRegionWithRequest:", v20);
          goto LABEL_35;
        }

        goto LABEL_36;
      case 2380:
        id v17 = objc_opt_class(&OBJC_CLASS___GEOLocationShiftingIsRequiredRequest, v14, v15);
        uint64_t v18 = sub_100012270(@"locationshift", v10, v11, v17, v12);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        id v20 = v19;
        id v16 = v19 != 0LL;
        if (v19)
        {
          [v19 setSignpostId:a6];
          -[GEOLocationShiftServer isRequiredForCoordinateWithRequest:]( self,  "isRequiredForCoordinateWithRequest:",  v20);
LABEL_35:
          id v16 = 1;
          goto LABEL_36;
        }

        goto LABEL_36;
    }
  }

  return v16;
}

LABEL_44:
          break;
      }
    }
  }

  else if (v13 > 2223)
  {
    switch(v13)
    {
      case 2224:
        id v16 = 1;
        if (sub_100012B28(v12, v11, @"placedata", v10, &off_10005E598, 1LL))
        {
          uint64_t v52 = objc_opt_class(&OBJC_CLASS___GEOPlaceCalculateFreeableSpaceRequest, v50, v51);
          __int16 v53 = sub_100012270(@"placedata", v10, v11, v52, v12);
          uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
          id v20 = v54;
          id v16 = v54 != 0LL;
          if (v54)
          {
            [v54 setSignpostId:a6];
            -[GEOPlaceDataServer calculateFreeableSpaceWithRequest:](self, "calculateFreeableSpaceWithRequest:", v20);
            goto LABEL_43;
          }

          goto LABEL_44;
        }

        break;
      case 2371:
        uint64_t v55 = objc_opt_class(&OBJC_CLASS___GEOPlaceRequestMessage, v14, v15);
        v56 = sub_100012270(@"placedata", v10, v11, v55, v12);
        __int16 v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
        id v20 = v57;
        id v16 = v57 != 0LL;
        if (v57)
        {
          [v57 setSignpostId:a6];
          -[GEOPlaceDataServer performPlaceDataRequestWithRequest:](self, "performPlaceDataRequestWithRequest:", v20);
          goto LABEL_43;
        }

        goto LABEL_44;
      case 2637:
        id v16 = 1;
        if (sub_100012B28(v12, v11, @"placedata", v10, &off_10005E5B0, 1LL))
        {
          id v26 = objc_opt_class(&OBJC_CLASS___GEOPlaceCalculateFreeableSpaceRequest, v24, v25);
          uint64_t v27 = sub_100012270(@"placedata", v10, v11, v26, v12);
          uint32_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          id v20 = v28;
          id v16 = v28 != 0LL;
          if (v28)
          {
            [v28 setSignpostId:a6];
            -[GEOPlaceDataServer calculateFreeableSpaceSyncWithRequest:]( self,  "calculateFreeableSpaceSyncWithRequest:",  v20);
            goto LABEL_43;
          }

          goto LABEL_44;
        }

        break;
    }
  }

  else
  {
    switch(v13)
    {
      case 2001:
        id v16 = 1;
        if (sub_100012B28(v12, v11, @"placedata", v10, &off_10005E580, 1LL))
        {
          uint64_t v34 = objc_opt_class(&OBJC_CLASS___GEOPlaceFetchCacheRequest, v32, v33);
          id v35 = sub_100012270(@"placedata", v10, v11, v34, v12);
          id v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
          id v20 = v36;
          id v16 = v36 != 0LL;
          if (v36)
          {
            [v36 setSignpostId:a6];
            -[GEOPlaceDataServer fetchAllCacheEntriesWithRequest:](self, "fetchAllCacheEntriesWithRequest:", v20);
            goto LABEL_43;
          }

          goto LABEL_44;
        }

        break;
      case 2015:
        uint64_t v37 = objc_opt_class(&OBJC_CLASS___GEOPlaceByPhoneNumberRequest, v14, v15);
        __int128 v38 = sub_100012270(@"placedata", v10, v11, v37, v12);
        __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        id v20 = v39;
        id v16 = v39 != 0LL;
        if (v39)
        {
          [v39 setSignpostId:a6];
          -[GEOPlaceDataServer requestPhoneNumbersWithRequest:](self, "requestPhoneNumbersWithRequest:", v20);
          goto LABEL_43;
        }

        goto LABEL_44;
      case 2222:
        id v17 = objc_opt_class(&OBJC_CLASS___GEOPlaceCancelRequest, v14, v15);
        uint64_t v18 = sub_100012270(@"placedata", v10, v11, v17, v12);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        id v20 = v19;
        id v16 = v19 != 0LL;
        if (v19)
        {
          [v19 setSignpostId:a6];
          -[GEOPlaceDataServer cancelPlaceDataRequestWithRequest:](self, "cancelPlaceDataRequestWithRequest:", v20);
LABEL_43:
          id v16 = 1;
          goto LABEL_44;
        }

        goto LABEL_44;
    }
  }

  return v16;
}

LABEL_49:
            break;
          }

LABEL_50:
          id v16 = 1;
          break;
      }
    }
  }

  else if (v13 > 1387)
  {
    switch(v13)
    {
      case 1388:
        __int128 v32 = objc_opt_class(&OBJC_CLASS___GEOExternalRequestCounterCountRequest, v14, v15);
        id v33 = sub_100012270(@"requestCounter", v10, v11, v32, v12);
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        uint64_t v18 = v34;
        id v16 = v34 != 0LL;
        if (v34)
        {
          [v34 setSignpostId:a6];
          -[GEORequestCounterServer externalCountWithRequest:](self, "externalCountWithRequest:", v18);
          goto LABEL_48;
        }

        goto LABEL_49;
      case 1404:
        id v35 = objc_opt_class(&OBJC_CLASS___GEORequestCounterCacheAddEntry, v14, v15);
        id v36 = sub_100012270(@"requestCounter", v10, v11, v35, v12);
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        uint64_t v18 = v37;
        id v16 = v37 != 0LL;
        if (v37)
        {
          [v37 setSignpostId:a6];
          -[GEORequestCounterServer addCacheResultWithRequest:](self, "addCacheResultWithRequest:", v18);
          goto LABEL_48;
        }

        goto LABEL_49;
      case 1542:
        id v16 = 1;
        if (sub_100012B28(v12, v11, @"requestCounter", v10, &off_10005E6D0, 1LL))
        {
          uint64_t v22 = objc_opt_class(&OBJC_CLASS___GEORequestCounterCacheGetResults, v20, v21);
          id v23 = sub_100012270(@"requestCounter", v10, v11, v22, v12);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          uint64_t v18 = v24;
          id v16 = v24 != 0LL;
          if (v24)
          {
            [v24 setSignpostId:a6];
            -[GEORequestCounterServer getCacheResultsWithRequest:](self, "getCacheResultsWithRequest:", v18);
            goto LABEL_48;
          }

          goto LABEL_49;
        }

        break;
    }
  }

  else
  {
    switch(v13)
    {
      case 519:
        if (sub_100012B28(v12, v11, @"requestCounter", v10, &off_10005E670, 0LL))
        {
          id v26 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
          uint64_t v18 = v26;
          id v16 = v26 != 0LL;
          if (v26)
          {
            [v26 setSignpostId:a6];
            -[GEORequestCounterServer clearWithMessage:](self, "clearWithMessage:", v18);
            goto LABEL_48;
          }

          goto LABEL_49;
        }

        goto LABEL_50;
      case 965:
        uint64_t v27 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
        uint64_t v18 = v27;
        id v16 = v27 != 0LL;
        if (v27)
        {
          [v27 setSignpostId:a6];
          -[GEORequestCounterServer incrementWithMessage:](self, "incrementWithMessage:", v18);
          goto LABEL_48;
        }

        goto LABEL_49;
      case 1272:
        if (sub_100012B28(v12, v11, @"requestCounter", v10, &off_10005E640, 0LL))
        {
          id v17 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
          uint64_t v18 = v17;
          id v16 = v17 != 0LL;
          if (v17)
          {
            [v17 setSignpostId:a6];
            -[GEORequestCounterServer readRequestsWithMessage:](self, "readRequestsWithMessage:", v18);
LABEL_48:
            id v16 = 1;
            goto LABEL_49;
          }

          goto LABEL_49;
        }

        goto LABEL_50;
    }
  }

  return v16;
}
}

LABEL_32:
    id v16 = 1;
    goto LABEL_41;
  }

  if (v13 <= 1589)
  {
    if (v13 == 1138)
    {
      __int128 v32 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
      uint64_t v18 = v32;
      id v16 = v32 != 0LL;
      if (v32)
      {
        [v32 setSignpostId:a6];
        -[GEOResourceManifestServer forceUpdateWithMessage:](self, "forceUpdateWithMessage:", v18);
        goto LABEL_39;
      }

      goto LABEL_40;
    }

    if (v13 == 1463)
    {
      id v20 = objc_opt_class(&OBJC_CLASS___GEOResourceManifestActivateFilterRequest, v14, v15);
      uint64_t v21 = sub_100012270(@"resourcemanifest", v10, v11, v20, v12);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      uint64_t v18 = v22;
      id v16 = v22 != 0LL;
      if (v22)
      {
        [v22 setSignpostId:a6];
        -[GEOResourceManifestServer activateFilterWithRequest:](self, "activateFilterWithRequest:", v18);
        goto LABEL_39;
      }

      goto LABEL_40;
    }

    goto LABEL_41;
  }

  switch(v13)
  {
    case 1590:
      if (sub_100012B28(v12, v11, @"resourcemanifest", v10, &off_10005E718, 0LL))
      {
        uint64_t v24 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
        uint64_t v18 = v24;
        id v16 = v24 != 0LL;
        if (v24)
        {
          [v24 setSignpostId:a6];
          -[GEOResourceManifestServer setRequestTokenWithMessage:](self, "setRequestTokenWithMessage:", v18);
          goto LABEL_39;
        }

        goto LABEL_40;
      }

      goto LABEL_32;
    case 1664:
      id v16 = 1;
      if (sub_100012B28(v12, v11, @"resourcemanifest", v10, &off_10005E730, 1LL))
      {
        uint64_t v27 = objc_opt_class(&OBJC_CLASS___GEOResourceManifestDeactivateFilterRequest, v25, v26);
        uint32_t v28 = sub_100012270(@"resourcemanifest", v10, v11, v27, v12);
        __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        uint64_t v18 = v29;
        id v16 = v29 != 0LL;
        if (v29)
        {
          [v29 setSignpostId:a6];
          -[GEOResourceManifestServer deactivateFilterWithRequest:](self, "deactivateFilterWithRequest:", v18);
          goto LABEL_39;
        }

        goto LABEL_40;
      }

      break;
    case 1700:
      id v17 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
      uint64_t v18 = v17;
      id v16 = v17 != 0LL;
      if (v17)
      {
        [v17 setSignpostId:a6];
        -[GEOResourceManifestServer setConfigurationWithMessage:](self, "setConfigurationWithMessage:", v18);
LABEL_39:
        id v16 = 1;
        goto LABEL_40;
      }

      goto LABEL_40;
  }

LABEL_66:
    id v14 = 1;
    goto LABEL_67;
  }

  switch(v13)
  {
    case 783:
      uint32_t v28 = -[GEOTileServer corrupt:fromPeer:](self, "corrupt:fromPeer:", v11, v12);
      if (a6 != -1LL)
      {
        __int128 v29 = GEOGetGEODaemonLog(v28);
        __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        uint64_t v18 = v30;
        if (!a6 || !os_signpost_enabled(v30)) {
          goto LABEL_65;
        }
        goto LABEL_64;
      }

      goto LABEL_66;
    case 961:
      __int128 v31 = -[GEOTileServer canShrinkBySize:fromPeer:](self, "canShrinkBySize:fromPeer:", v11, v12);
      if (a6 == -1LL) {
        goto LABEL_66;
      }
      __int128 v32 = GEOGetGEODaemonLog(v31);
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      uint64_t v18 = v33;
      if (!a6 || !os_signpost_enabled(v33)) {
        goto LABEL_65;
      }
      goto LABEL_64;
    case 966:
      id v15 = -[GEOTileServer enumerateTiles:fromPeer:](self, "enumerateTiles:fromPeer:", v11, v12);
      if (a6 == -1LL) {
        goto LABEL_66;
      }
      id v16 = GEOGetGEODaemonLog(v15);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      uint64_t v18 = v17;
      if (!a6 || !os_signpost_enabled(v17)) {
        goto LABEL_65;
      }
LABEL_64:
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
      uint64_t v52 = objc_msgSend((id)objc_opt_class(self, v50, v51), "identifier");
      __int16 v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
      uint64_t v55 = 138412802;
      v56 = v49;
      __int16 v57 = 2112;
      id v58 = v53;
      NSFileAttributeKey v59 = 2112;
      v60 = v10;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_INTERVAL_END,  a6,  "HandleRequest",  "type=raw_message,peer=%@,message=%@.%@",  (uint8_t *)&v55,  0x20u);

LABEL_65:
      goto LABEL_66;
  }

LABEL_67:
  return v14;
}

LABEL_12:
    id v16 = 1;
    goto LABEL_13;
  }

  id v17 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
  id v15 = v17;
  id v16 = v17 != 0LL;
  if (v17)
  {
    [v17 setSignpostId:a6];
    -[GEOAnalyticDataServer readReqRespMetadataWithMessage:](self, "readReqRespMetadataWithMessage:", v15);
    goto LABEL_9;
  }

void sub_100015E48(id a1)
{
  id v1 = -[GEOMobileAssetResourceUpdater initInternal]( objc_alloc(&OBJC_CLASS___GEOMobileAssetResourceUpdater),  "initInternal");
  int v2 = (void *)qword_10006AF50;
  qword_10006AF50 = (uint64_t)v1;
}

id sub_100016218(uint64_t a1)
{
  id result = *(id *)(a1 + 40);
  if (result) {
    return [result setTaskCompleted];
  }
  return result;
}

void sub_100016398(uint64_t a1, uint64_t a2)
{
  id v4 = sub_100018084();
  unint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v10 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "MA catalog result: %d", buf, 8u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(dispatch_queue_s **)(v6 + 8);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _OWORD v8[2] = sub_100016484;
  v8[3] = &unk_1000597E8;
  v8[4] = v6;
  v8[5] = a2;
  dispatch_async(v7, v8);
}

id sub_100016484(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  id v1 = *(void **)(a1 + 32);
  if (*(void *)(v2 + 8)) {
    return [v1 _updateComplete];
  }
  else {
    return [v1 _fetchAssets];
  }
}

void sub_1000166B8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_100018084();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    v13[0] = 67109890;
    v13[1] = a2;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "MA query result: %d error: %@ info; %@ resources: %@",
      (uint8_t *)v13,
      0x26u);
  }

  id v12 = [v7 count];
  if (a2 || !v12) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else {
    [*(id *)(a1 + 48) _processResources:v7 group:*(void *)(a1 + 40)];
  }
}

id sub_1000167D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateComplete];
}

void sub_100016970(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(a1 + 40) _pruneOldResourcesIn:*(void *)(a1 + 32)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_1000169A4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_100018084();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "MA update result for %@: %ld error: %@",  (uint8_t *)&v9,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100016EB4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v4 count]));
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v12]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dictionaryRepresentation]);
        [v6 setObject:v14 forKey:v12];
      }

      id v9 = [v7 countByEnumeratingWithState:&v32 objects:v39 count:16];
    }

    while (v9);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v5 count]));
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v16 = v5;
  id v17 = [v16 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v29;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)j);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v21]);
        uint64_t v23 = _geo_NSErrorDictionaryRepresentationCopy();
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        [v15 setObject:v24 forKey:v21];
      }

      id v18 = [v16 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }

    while (v18);
  }

  double v25 = *(void **)(a1 + 32);
  v36[0] = @"attributionInfos";
  v36[1] = @"errors";
  v37[0] = v6;
  v37[1] = v15;
  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  2LL));
  [v25 sendReply:v26];
}

void sub_1000175C0(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 data]);
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v7, @"response");

    id v8 = *(void **)(a1 + 32);
LABEL_5:
    [v8 sendReply:v6];

    goto LABEL_6;
  }

  if (v5)
  {
    id v9 = *(void **)(a1 + 32);
    id v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary _geo_replyDictionaryForError:key:]( &OBJC_CLASS___NSDictionary,  "_geo_replyDictionaryForError:key:",  v5,  @"err"));
    id v8 = v9;
    goto LABEL_5;
  }

LABEL_6:
}

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
}

  __int16 v13 = 0;
LABEL_8:

  return v13;
}
}

void sub_100017718(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v7 && v8)
  {
    v14[0] = @"uuid";
    v14[1] = @"uuidDate";
    v15[0] = v7;
    v15[1] = v8;
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
    uint64_t v12 = *(void **)(a1 + 32);
  }

  else
  {
    if (!v9) {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -8LL,  @"unexpected"));
    }
    __int16 v13 = *(void **)(a1 + 32);
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary _geo_replyDictionaryForError:key:]( &OBJC_CLASS___NSDictionary,  "_geo_replyDictionaryForError:key:",  v10,  @"err"));
    uint64_t v12 = v13;
  }

  [v12 sendReply:v11];
}

void sub_1000178D4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v7 && v8)
  {
    v14[0] = @"uuid";
    v14[1] = @"uuidDate";
    v15[0] = v7;
    v15[1] = v8;
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
    uint64_t v12 = *(void **)(a1 + 32);
  }

  else
  {
    if (!v9) {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -8LL,  @"unexpected"));
    }
    __int16 v13 = *(void **)(a1 + 32);
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary _geo_replyDictionaryForError:key:]( &OBJC_CLASS___NSDictionary,  "_geo_replyDictionaryForError:key:",  v10,  @"err"));
    uint64_t v12 = v13;
  }

  [v12 sendReply:v11];
}

void sub_100017BFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary _geo_replyDictionaryForError:key:]( &OBJC_CLASS___NSDictionary,  "_geo_replyDictionaryForError:key:",  a2,  @"err"));
  [v2 sendReply:v3];
}

uint64_t sub_100017C50(uint64_t a1)
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v1 = qword_10006AF60;
  uint64_t v7 = qword_10006AF60;
  if (!qword_10006AF60)
  {
    v8[0] = *(_OWORD *)off_1000598F8;
    v8[1] = *(_OWORD *)&off_100059908;
    uint64_t v2 = _sl_dlopen(v8, a1);
    v5[3] = v2;
    qword_10006AF60 = v2;
    uint64_t v1 = v2;
  }

  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100017CFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_100017D14()
{
  id v3 = 0LL;
  uint64_t v0 = sub_100017C50((uint64_t)&v3);
  uint64_t v1 = v3;
  if (!v0)
  {
    uint64_t v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_5;
  }

  if (v3) {
LABEL_5:
  }
    free(v1);
  return v0;
}

id sub_100017D6C()
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  uint64_t v0 = (void *)qword_10006AF68;
  uint64_t v7 = qword_10006AF68;
  if (!qword_10006AF68)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100017E20;
    v3[3] = &unk_1000593A0;
    void v3[4] = &v4;
    sub_100017E20((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100017E08( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class sub_100017E20(uint64_t a1)
{
  Class result = objc_getClass("BGSystemTaskScheduler");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10006AF68 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = sub_10003AC70();
    return (Class)sub_100017E74(v3);
  }

  return result;
}

id sub_100017E74()
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  uint64_t v0 = (void *)qword_10006AF70;
  uint64_t v7 = qword_10006AF70;
  if (!qword_10006AF70)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100017F28;
    v3[3] = &unk_1000593A0;
    void v3[4] = &v4;
    sub_100017F28((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100017F10( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class sub_100017F28(uint64_t a1)
{
  Class result = objc_getClass("BGNonRepeatingSystemTaskRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10006AF70 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    sub_10003AC94();
    return (Class)sub_100017F7C();
  }

  return result;
}

id sub_100017F7C()
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  uint64_t v0 = (void *)qword_10006AF78;
  uint64_t v7 = qword_10006AF78;
  if (!qword_10006AF78)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100018030;
    v3[3] = &unk_1000593A0;
    void v3[4] = &v4;
    sub_100018030((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100018018( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class sub_100018030(uint64_t a1)
{
  Class result = objc_getClass("BGRepeatingSystemTaskRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10006AF78 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    sub_10003ACB8();
    return (Class)sub_100018084();
  }

  return result;
}

id sub_100018084()
{
  if (qword_10006AF88 != -1) {
    dispatch_once(&qword_10006AF88, &stru_100059918);
  }
  return (id)qword_10006AF80;
}

void sub_1000180C4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GeoServices", "MAResource");
  uint64_t v2 = (void *)qword_10006AF80;
  qword_10006AF80 = (uint64_t)v1;
}

uint64_t sub_100018AF4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_100018B08()
{
  if (qword_10006AF98 != -1) {
    dispatch_once(&qword_10006AF98, &stru_100059A28);
  }
  return (id)qword_10006AF90;
}

id sub_100018B48(uint64_t a1)
{
  return [*(id *)(a1 + 32) _relocateOnQueue:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void sub_100018B58(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    id v9 = sub_100018B08();
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100018C70;
    block[3] = &unk_100059940;
    __int16 v11 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v17 = v11;
    id v18 = *(id *)(a1 + 48);
    dispatch_async(v10, block);

    id v8 = v17;
    goto LABEL_5;
  }

  uint64_t v6 = *(void **)(a1 + 48);
  if (v6)
  {
    uint64_t v7 = *(dispatch_queue_s **)(a1 + 40);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100018C80;
    v12[3] = &unk_100059968;
    id v14 = v6;
    uint64_t v15 = a2;
    id v13 = v5;
    dispatch_async(v7, v12);

    id v8 = v14;
LABEL_5:
  }
}

id sub_100018C70(uint64_t a1)
{
  return [*(id *)(a1 + 32) _relocateOnQueue:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t sub_100018C80(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16LL))(a1[5], a1[6], a1[4]);
}

LABEL_31:
}

void sub_1000192DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = *(dispatch_queue_s **)(a1 + 32);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100019354;
    v5[3] = &unk_1000595C0;
    id v6 = v2;
    uint64_t v7 = a2;
    dispatch_async(v4, v5);
  }

uint64_t sub_100019354(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(a1 + 40),  0LL);
}

uint64_t sub_100019368(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(a1 + 40),  0LL);
}

uint64_t sub_100019518(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100019528(uint64_t a1)
{
}

void sub_100019530(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (void *)a1[7];
  uint64_t v4 = *(void *)(a1[6] + 8LL);
  id obj = *(id *)(v4 + 40);
  unsigned __int8 v5 = [v3 _removeResourceAt:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = v5;
}

void sub_100019AFC(id a1)
{
  uint64_t v1 = geo_dispatch_queue_create("com.apple.geo.MAResource.FileAccess");
  uint64_t v2 = (void *)qword_10006AF90;
  qword_10006AF90 = v1;
}

id sub_100019C90(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned __int8 v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 setError:a3];
  [*(id *)(a1 + 32) setFunction:v6];

  return [*(id *)(a1 + 32) send];
}

id sub_100019DC0(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned __int8 v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 setError:a3];
  [*(id *)(a1 + 32) setFunction:v6];

  return [*(id *)(a1 + 32) send];
}

void sub_10001A200(uint64_t a1, void *a2, double a3, double a4, double a5)
{
  id v9 = a2;
  id v10 = objc_alloc_init(&OBJC_CLASS___GEOLocationShiftingCacheItem);
  [v10 setAddDate:v9];

  objc_msgSend(v10, "setCoordinate:", a3, a4);
  [v10 setRadiusMeters:a5];
  [*(id *)(a1 + 32) addObject:v10];
}

id sub_10001A29C(uint64_t a1)
{
  return [*(id *)(a1 + 32) send];
}

uint64_t sub_10001A2D8(uint64_t a1)
{
  uint64_t v4 = 0LL;
  unsigned __int8 v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v1 = qword_10006AFA0;
  uint64_t v7 = qword_10006AFA0;
  if (!qword_10006AFA0)
  {
    v8[0] = *(_OWORD *)off_100059AC8;
    v8[1] = *(_OWORD *)&off_100059AD8;
    uint64_t v2 = _sl_dlopen(v8, a1);
    v5[3] = v2;
    qword_10006AFA0 = v2;
    uint64_t v1 = v2;
  }

  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10001A384( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_10001A39C()
{
  uint64_t v3 = 0LL;
  uint64_t v0 = sub_10001A2D8((uint64_t)&v3);
  uint64_t v1 = v3;
  if (!v0)
  {
    uint64_t v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_5;
  }

  if (v3) {
LABEL_5:
  }
    free(v1);
  return v0;
}

id sub_10001A3F4()
{
  uint64_t v4 = 0LL;
  unsigned __int8 v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  uint64_t v0 = (void *)qword_10006AFA8;
  uint64_t v7 = qword_10006AFA8;
  if (!qword_10006AFA8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10001A4A8;
    v3[3] = &unk_1000593A0;
    void v3[4] = &v4;
    sub_10001A4A8((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10001A490( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class sub_10001A4A8(uint64_t a1)
{
  Class result = objc_getClass("MAAsset");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10006AFA8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = sub_10003ACDC();
    return (Class)sub_10001A4FC(v3);
  }

  return result;
}

id sub_10001A4FC()
{
  uint64_t v4 = 0LL;
  unsigned __int8 v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  uint64_t v0 = (void *)qword_10006AFB0;
  uint64_t v7 = qword_10006AFB0;
  if (!qword_10006AFB0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10001A5B0;
    v3[3] = &unk_1000593A0;
    void v3[4] = &v4;
    sub_10001A5B0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10001A598( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class sub_10001A5B0(uint64_t a1)
{
  Class result = objc_getClass("MAAssetQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10006AFB0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    sub_10003AD00();
    return (Class)sub_10001A604();
  }

  return result;
}

id sub_10001A604()
{
  uint64_t v4 = 0LL;
  unsigned __int8 v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  uint64_t v0 = (void *)qword_10006AFB8;
  uint64_t v7 = qword_10006AFB8;
  if (!qword_10006AFB8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10001A6B8;
    v3[3] = &unk_1000593A0;
    void v3[4] = &v4;
    sub_10001A6B8((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10001A6A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class sub_10001A6B8(uint64_t a1)
{
  Class result = objc_getClass("MADownloadOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10006AFB8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = sub_10003AD24();
    return (Class)sub_10001A70C(v3);
  }

  return result;
}

void *sub_10001A70C()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v0 = (void *)qword_10006AFC0;
  uint64_t v6 = qword_10006AFC0;
  if (!qword_10006AFC0)
  {
    id v1 = (void *)sub_10001A39C();
    uint64_t v0 = dlsym(v1, "MAPurgeAll");
    v4[3] = (uint64_t)v0;
    qword_10006AFC0 = (uint64_t)v0;
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10001A780( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_10001A798(void *a1, void *a2)
{
  id v6 = a1;
  id v3 = a2;
  uint64_t v4 = (void (*)(id, id))sub_10001A70C();
  if (v4)
  {
    v4(v6, v3);
  }

  else
  {
    uint64_t v5 = sub_10003AD48();
    sub_10001A7F0(v5);
  }

void *sub_10001A7F0()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v0 = (void *)qword_10006AFC8;
  uint64_t v6 = qword_10006AFC8;
  if (!qword_10006AFC8)
  {
    id v1 = (void *)sub_10001A39C();
    uint64_t v0 = dlsym(v1, "MAPurgeCatalogs");
    v4[3] = (uint64_t)v0;
    qword_10006AFC8 = (uint64_t)v0;
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10001A864( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_10001A87C(void *a1, void *a2)
{
  id v7 = a1;
  id v3 = a2;
  uint64_t v4 = (void (*)(id, id))sub_10001A7F0();
  if (v4)
  {
    v4(v7, v3);
  }

  else
  {
    uint64_t v5 = (_GEOLocationShifterLocalProxy *)sub_10003AD48();
    -[_GEOLocationShifterLocalProxy init](v5, v6);
  }

void sub_10001A9F8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10001AA14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained persistentCache]);
    [v2 removeAllShiftEntries];

    id WeakRetained = v3;
  }
}

LABEL_13:
    }

    else
    {
      LOBYTE(v9) = 1;
    }
  }

  else
  {
    LOBYTE(v9) = 0;
  }

  return (char)v9;
}
    }

    else
    {
      LOBYTE(v9) = 1;
    }
  }

  else
  {
    LOBYTE(v9) = 0;
  }

  return (char)v9;
}

  if (v9)
  {
LABEL_17:
    uint64_t v19 = 1LL;
    goto LABEL_18;
  }

  uint64_t v19 = 0LL;
LABEL_18:

  return v19;
}

void sub_10001AF70(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length]
    && GEOConfigGetBOOL( GeoServicesConfig_LocationShiftPersistenceEnabled[0],  GeoServicesConfig_LocationShiftPersistenceEnabled[1]))
  {
    uint64_t Array = GEOConfigGetArray( GeoServicesConfig_LocationShiftSkipCLAuthCheckAllowlist[0],  GeoServicesConfig_LocationShiftSkipCLAuthCheckAllowlist[1]);
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v3 = (id)objc_claimAutoreleasedReturnValue(Array);
    id v4 = [v3 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v30;
      while (2)
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v30 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
          if ([v8 hasSuffix:@"*"])
          {
            id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringToIndex:", (char *)objc_msgSend(v8, "length") - 1));
            unsigned __int8 v10 = [*(id *)(a1 + 32) hasPrefix:v9];

            if ((v10 & 1) != 0) {
              goto LABEL_19;
            }
          }

          else if ([*(id *)(a1 + 32) isEqualToString:v8])
          {
LABEL_19:
            unsigned int v13 = 1;
            id v14 = v3;
            goto LABEL_20;
          }
        }

        id v5 = [v3 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    id v11 = sub_10000A860();
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleId]);
    id v28 = 0LL;
    unsigned int v13 = [v11 _checkAndExerciseAuthorizationForBundleID:v12 error:&v28];
    id v14 = v28;

    if (v14)
    {
      uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOLocationShifter");
      id v3 = (id)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v3,  OS_LOG_TYPE_ERROR,  "Unexpected error checking CL auth: %@",  buf,  0xCu);
      }

      unsigned int v13 = 0;
LABEL_20:
    }
  }

  else
  {
    unsigned int v13 = 0;
  }

  uint64_t v16 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOLocationShifter");
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    id v18 = "NO";
    uint64_t v19 = *(void **)(a1 + 32);
    if (v13) {
      id v18 = "YES";
    }
    *(_DWORD *)buf = 138412546;
    id v34 = v19;
    __int16 v35 = 2080;
    id v36 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Can use persistent cache for %@? %s", buf, 0x16u);
  }

  uint64_t v20 = *(void *)(a1 + 48);
  uint64_t v21 = *(void **)(a1 + 56);
  uint64_t v22 = *(dispatch_queue_s **)(v20 + 24);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10001B2C8;
  v23[3] = &unk_100059B18;
  v23[4] = v20;
  id v24 = v21;
  id v25 = *(id *)(a1 + 40);
  char v27 = v13;
  id v26 = *(id *)(a1 + 64);
  dispatch_async(v22, v23);
}

id sub_10001B2C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shiftLatLng:*(void *)(a1 + 40) auditToken:*(void *)(a1 + 48) usePersistentCache:*(unsigned __int8 *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
}

id sub_10001B484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = *(void **)(a1 + 32);
  if (a2) {
    return [v5 _callCompletionHandler:*(void *)(a1 + 64) withRequestedCoordinate:*(void *)(a1 + 40) reduceRadius:a2 forResponse:a4 error:*(double *)(a1 + 72)];
  }
  else {
    return [v5 _doNetworkRequestForLatLng:*(void *)(a1 + 40) reduceRadius:*(void *)(a1 + 48) traits:*(void *)(a1 + 56) auditToken:*(unsigned __int8 *)(a1 + 80) shouldCache:*(void *)(a1 + 64) completionHandler:*(double *)(a1 + 72)];
  }
}

void sub_10001B61C(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (v12
    && (id v6 = objc_alloc(&OBJC_CLASS___GEOLocationShiftFunctionResponse),
        [*(id *)(a1 + 32) coordinate],
        (id v9 = objc_msgSend( v6,  "initWithPolyLocationShiftResponse:originalCoordinate:version:",  v12,  +[GEOLocationShifter locationShiftFunctionVersion]( GEOLocationShifter,  "locationShiftFunctionVersion"),  v7,  v8)) != 0))
  {
    unsigned __int8 v10 = v9;
    if (*(_BYTE *)(a1 + 64))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) persistentCache]);
      [v11 storeShiftResponse:v10];
    }
  }

  else
  {
    if (!v5) {
      id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:](&OBJC_CLASS___NSError, "GEOErrorWithCode:", -13LL));
    }
    unsigned __int8 v10 = 0LL;
  }

  [*(id *)(a1 + 40) _callCompletionHandler:*(void *)(a1 + 48) withRequestedCoordinate:*(void *)(a1 + 32) reduceRadius:v10 forResponse:v5 error:*(double *)(a1 + 56)];
}

uint64_t sub_10001B830(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

void sub_10001BA2C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  double v8 = *(void **)(a1 + 40);
  id v9 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 24LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001BAE8;
  block[3] = &unk_100059BB8;
  id v14 = v7;
  id v15 = v8;
  id v13 = v6;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

uint64_t sub_10001BAE8(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

void sub_10001BB78(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS____GEOLocationShiftRequestConfig);
  uint64_t v2 = (void *)qword_10006AFD8;
  qword_10006AFD8 = (uint64_t)v1;
}

uint64_t sub_10001BD0C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_10001BFD0(void *a1)
{
  return [*(id *)(a1[4] + 8) setObject:a1[6] forKeyedSubscript:a1[5]];
}

void sub_10001BFE0(void *a1, void *a2, void *a3)
{
  v13[0] = _NSConcreteStackBlock;
  _DWORD v13[2] = sub_10001C094;
  v13[3] = &unk_100059520;
  uint64_t v6 = a1[4];
  id v7 = (void *)a1[5];
  uint64_t v8 = *(void *)(v6 + 16);
  v13[1] = 3221225472LL;
  v13[4] = v6;
  id v14 = v7;
  id v9 = a3;
  id v10 = a2;
  geo_isolate_sync(v8, v13);
  (*(void (**)(void, id, id, uint64_t, uint64_t))(a1[6] + 16LL))(a1[6], v10, v9, v11, v12);
}

id sub_10001C094(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
}

id sub_10001C238(void *a1)
{
  return [*(id *)(a1[4] + 8) setObject:a1[6] forKeyedSubscript:a1[5]];
}

void sub_10001C248(void *a1, void *a2, void *a3, void *a4)
{
  v14[0] = _NSConcreteStackBlock;
  void v14[2] = sub_10001C318;
  v14[3] = &unk_100059520;
  uint64_t v8 = a1[4];
  id v9 = (void *)a1[5];
  uint64_t v10 = *(void *)(v8 + 16);
  v14[1] = 3221225472LL;
  v14[4] = v8;
  id v15 = v9;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  geo_isolate_sync(v10, v14);
  (*(void (**)(void, void, id, id, id))(a1[7] + 16LL))(a1[7], a1[6], v12, v13, v11);
}

id sub_10001C318(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_10001C3F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10001C40C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001C41C(uint64_t a1)
{
}

id sub_10001C424(void *a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]]);
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return [*(id *)(a1[4] + 8) removeObjectForKey:a1[5]];
}

uint64_t sub_10001C568(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10001C620(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10001C8D8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GeoServices", "ImageService");
  uint64_t v2 = (void *)qword_10006AFE0;
  qword_10006AFE0 = (uint64_t)v1;
}

void sub_10001C908( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t sub_10001C918(uint64_t a1)
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v1 = qword_10006AFF0;
  uint64_t v7 = qword_10006AFF0;
  if (!qword_10006AFF0)
  {
    v8[0] = *(_OWORD *)off_100059CC0;
    v8[1] = *(_OWORD *)&off_100059CD0;
    uint64_t v2 = _sl_dlopen(v8, a1);
    v5[3] = v2;
    qword_10006AFF0 = v2;
    uint64_t v1 = v2;
  }

  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10001C9C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_10001C9DC()
{
  uint64_t v3 = 0LL;
  uint64_t v0 = sub_10001C918((uint64_t)&v3);
  uint64_t v1 = v3;
  if (!v0)
  {
    uint64_t v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_5;
  }

  if (v3) {
LABEL_5:
  }
    free(v1);
  return v0;
}

void *sub_10001CA34()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v0 = (void *)qword_10006AFF8;
  uint64_t v6 = qword_10006AFF8;
  if (!qword_10006AFF8)
  {
    uint64_t v1 = (void *)sub_10001C9DC();
    uint64_t v0 = dlsym(v1, "AnalyticsSendEventLazy");
    v4[3] = (uint64_t)v0;
    qword_10006AFF8 = (uint64_t)v0;
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10001CAA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

GEOTransitUpdateServer *sub_10001CAC0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (uint64_t (*)(id, id))sub_10001CA34();
  if (v5)
  {
    uint64_t v6 = v5(v3, v4);

    return (GEOTransitUpdateServer *)v6;
  }

  else
  {
    uint64_t v8 = (GEOTransitUpdateServer *)sub_10003AD48();
    return -[GEOTransitUpdateServer initWithDaemon:](v8, v9, v10);
  }

void sub_10001CD5C(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16LL);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) request]);
  [v1 addObject:v2];
}

void sub_10001CDA8(uint64_t a1, void *a2, void *a3)
{
  id v11 = _NSConcreteStackBlock;
  id v13 = sub_10001CE70;
  id v14 = &unk_100059520;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(v6 + 8);
  uint64_t v12 = 3221225472LL;
  uint64_t v15 = v6;
  id v16 = v7;
  id v9 = a3;
  id v10 = a2;
  geo_isolate_sync_data(v8, &v11);
  objc_msgSend(*(id *)(a1 + 48), "setResponse:", v10, v11, v12, v13, v14, v15);

  [*(id *)(a1 + 48) setError:v9];
  [*(id *)(a1 + 48) send];
}

void sub_10001CE70(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16LL);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) request]);
  [v1 removeObject:v2];
}

void sub_10001D028( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10001D040(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001D050(uint64_t a1)
{
}

void sub_10001D058(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) request]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 member:v6]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10001D750(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userInfo]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"urgency"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEODiskSpaceManager sharedManager](&OBJC_CLASS___GEODiskSpaceManager, "sharedManager"));
    id v7 = objc_msgSend(v6, "purgableDiskSpaceForUrgency:", objc_msgSend(v3, "intValue"));

    uint64_t v12 = @"bytes";
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v7));
    id v13 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));

    [*(id *)(a1 + 32) sendReply:v9];
  }

  else
  {
    id v10 = *(void **)(a1 + 32);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -12LL,  @"urgency must be a number"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary _geo_replyDictionaryForError:key:]( &OBJC_CLASS___NSDictionary,  "_geo_replyDictionaryForError:key:",  v9,  @"err"));
    [v10 sendReply:v11];
  }
}

void sub_10001D96C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userInfo]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"urgency"]);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userInfo]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"bytes"]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber, v6);
  if ((objc_opt_isKindOfClass(v3, v7) & 1) != 0
    && (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v8), (objc_opt_isKindOfClass(v5, v9) & 1) != 0))
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    _DWORD v13[2] = sub_10001DAF8;
    v13[3] = &unk_100059048;
    id v14 = v5;
    id v15 = v3;
    id v16 = *(id *)(a1 + 32);
    geo_dispatch_async_qos(21LL, v13);
  }

  else
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -12LL,  @"urgency & space must be a number"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary _geo_replyDictionaryForError:key:]( &OBJC_CLASS___NSDictionary,  "_geo_replyDictionaryForError:key:",  v11,  @"err"));
    [v10 sendReply:v12];
  }
}

void sub_10001DAF8(id *a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEODiskSpaceManager sharedManager](&OBJC_CLASS___GEODiskSpaceManager, "sharedManager"));
  id v3 = objc_msgSend( v2,  "freePurgableDiskSpace:urgency:",  objc_msgSend(a1[4], "unsignedLongLongValue"),  objc_msgSend(a1[5], "intValue"));

  uint64_t v6 = @"bytes";
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v3));
  uint64_t v7 = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));

  [a1[6] sendReply:v5];
}

id sub_10001E328(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  [v7 setNames:a2];
  [*(id *)(a1 + 32) setPaths:v9];

  [*(id *)(a1 + 32) setError:v8];
  return [*(id *)(a1 + 32) send];
}

uint64_t sub_10001E3A0(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = a1;
  int v5 = v23;
  id v6 = v4;
  uint64_t v7 = v6;
  if (v5 != 65)
  {
    unint64_t v21 = -2LL;
    id v10 = &qword_100045C08;
    while (v21 != 7)
    {
      int v22 = *((_DWORD *)v10 + 2);
      ++v21;
      v10 += 2;
      if (v22 == v5)
      {
        BOOL v9 = v21 + 1 > 8;
        if (v21 < 3) {
          goto LABEL_16;
        }
        unint64_t v8 = v21 + 2;
        goto LABEL_4;
      }
    }

    goto LABEL_16;
  }

  unint64_t v8 = 0LL;
  BOOL v9 = 0;
  id v10 = &qword_100045C08;
LABEL_4:
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForEntitlement:@"com.apple.geoservices.restricted-tiles"]);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSArray, v12);
  if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
  {
    else {
      uint64_t v14 = *v10;
    }
    id v15 = (char *)&unk_100045C00 + 16 * v8 + 5;
    while (1)
    {
      char v16 = *v15++;
      char v17 = v16 - 1;
      id v18 = @"<unknown>";
      if (!--v14) {
        goto LABEL_13;
      }
    }

LABEL_16:
    goto LABEL_17;
  }

void sub_10001EA48(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 24LL);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
  [v1 addObject:v2];
}

void sub_10001EA94(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = objc_alloc_init(&OBJC_CLASS___GEOImageServiceImage);
    [v4 setImageId:*(void *)(a1 + 32)];
    [v4 setImage:v3];

    int v5 = *(void **)(a1 + 48);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 16LL);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10001EB80;
    v10[3] = &unk_100059D78;
    id v7 = v5;
    uint64_t v8 = *(void *)(a1 + 32);
    id v11 = v7;
    uint64_t v12 = v8;
    id v13 = *(id *)(a1 + 56);
    id v14 = v4;
    id v9 = v4;
    geo_isolate_sync_data(v6, v10);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

id sub_10001EB80(uint64_t a1)
{
  return [*(id *)(a1 + 48) addObject:*(void *)(a1 + 56)];
}

void sub_10001EBAC(uint64_t a1)
{
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  unint64_t v21 = sub_10001ED38;
  int v22 = sub_10001ED48;
  id v23 = 0LL;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_10001ED38;
  char v16 = sub_10001ED48;
  id v17 = 0LL;
  v5[0] = _NSConcreteStackBlock;
  v5[2] = sub_10001ED50;
  v5[3] = &unk_100059E18;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(v2 + 16);
  v5[1] = 3221225472LL;
  void v5[4] = v2;
  id v6 = v3;
  id v10 = &v12;
  id v7 = *(id *)(a1 + 48);
  id v11 = &v18;
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  geo_isolate_sync(v4, v5);
  if (v19[5])
  {
    objc_msgSend(*(id *)(a1 + 64), "setResponse:");
LABEL_5:
    [*(id *)(a1 + 64) send];
    goto LABEL_6;
  }

  if (v13[5])
  {
    objc_msgSend(*(id *)(a1 + 64), "setError:");
    goto LABEL_5;
  }

void sub_10001ED14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_10001ED38(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001ED48(uint64_t a1)
{
}

void sub_10001ED50(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
  unsigned __int8 v4 = [v2 containsObject:v3];

  int v5 = *(void **)(*(void *)(a1 + 32) + 24LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
  [v5 removeObject:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) request]);
  if ((v4 & 1) == 0)
  {
    id v19 = sub_10001F1E0();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "Request was canceled while consulting the disk cache",  buf,  2u);
    }

    uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:reason:](&OBJC_CLASS___NSError, "GEOErrorWithCode:reason:", -2LL, 0LL));
    uint64_t v22 = *(void *)(*(void *)(a1 + 72) + 8LL);
    id v7 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;
    goto LABEL_18;
  }

  if (![*(id *)(a1 + 48) count])
  {
    id v23 = sub_10001F1E0();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "All assets for request were found in the disk cache",  buf,  2u);
    }

    id v25 = objc_alloc_init(&OBJC_CLASS___GEOImageServiceResponse);
    uint64_t v26 = *(void *)(*(void *)(a1 + 80) + 8LL);
    char v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;

    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setStatus:0];
    id v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) request]);
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "setWidth:", objc_msgSend(v28, "width"));

    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) request]);
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "setHeight:", objc_msgSend(v29, "height"));

    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setImages:*(void *)(a1 + 56)];
    goto LABEL_18;
  }

  id v8 = [*(id *)(a1 + 56) count];
  id v9 = sub_10001F1E0();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v11)
    {
      id v12 = [*(id *)(a1 + 56) count];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) request]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 imageIds]);
      id v15 = [v14 count];
      id v16 = [*(id *)(a1 + 48) count];
      *(_DWORD *)buf = 134218496;
      id v44 = v12;
      __int16 v45 = 2050;
      id v46 = v15;
      __int16 v47 = 2050;
      id v48 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%lu of %{public}llu assets for request were found in the disk cache. Will issue network request for the remaining %{public}llu.",  buf,  0x20u);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) request]);
    id v18 = [v17 copy];

    [v18 setImageIds:*(void *)(a1 + 48)];
    id v7 = v18;
    if (!v18) {
      return;
    }
    goto LABEL_17;
  }

  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Zero assets for request were found in the disk cache. Will issue original request to network",  buf,  2u);
  }

  if (v7)
  {
LABEL_17:
    __int128 v30 = *(void **)(*(void *)(a1 + 32) + 32LL);
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
    [v30 setObject:v7 forKey:v31];

    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue( +[GEOImageServiceServerRequester sharedRequester]( &OBJC_CLASS___GEOImageServiceServerRequester,  "sharedRequester"));
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) preferredAuditToken]);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_10001F220;
    v39[3] = &unk_100059DC8;
    id v34 = *(void **)(a1 + 40);
    v39[4] = *(void *)(a1 + 32);
    id v40 = v34;
    id v41 = *(id *)(a1 + 56);
    id v42 = *(id *)(a1 + 64);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    void v36[2] = sub_10001F4AC;
    v36[3] = &unk_100059DF0;
    __int16 v35 = *(void **)(a1 + 40);
    v36[4] = *(void *)(a1 + 32);
    id v37 = v35;
    id v38 = *(id *)(a1 + 64);
    [v32 startSimpleImageServiceRequest:v7 auditToken:v33 finished:v39 networkActivity:0 error:v36];

LABEL_18:
  }

id sub_10001F1E0()
{
  if (qword_10006B008 != -1) {
    dispatch_once(&qword_10006B008, &stru_100059E60);
  }
  return (id)qword_10006B000;
}

void sub_10001F220(uint64_t a1, void *a2)
{
  id v3 = a2;
  v26[0] = _NSConcreteStackBlock;
  v26[2] = sub_10001F460;
  v26[3] = &unk_100059520;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(v4 + 16);
  v26[1] = 3221225472LL;
  v26[4] = v4;
  id v27 = v5;
  geo_isolate_sync_data(v6, v26);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v20 = v3;
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 images]);
  id v7 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        BOOL v11 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v12 = *(void **)(*(void *)(a1 + 32) + 8LL);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 image]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 imageId]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) request]);
        id v16 = [v15 width];
        id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) request]);
        objc_msgSend(v12, "addData:forIdentifier:width:height:", v13, v14, v16, objc_msgSend(v17, "height"));
      }

      id v8 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }

    while (v8);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v20 images]);
  id v19 = [v18 mutableCopy];

  [v19 addObjectsFromArray:*(void *)(a1 + 48)];
  [v20 setImages:v19];
  [*(id *)(a1 + 56) setResponse:v20];
  [*(id *)(a1 + 56) send];
}

void sub_10001F460(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 32LL);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
  [v1 removeObjectForKey:v2];
}

void sub_10001F4AC(uint64_t a1, void *a2)
{
  id v8 = _NSConcreteStackBlock;
  id v10 = sub_10001F558;
  BOOL v11 = &unk_100059520;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v9 = 3221225472LL;
  uint64_t v12 = v4;
  id v13 = v5;
  id v7 = a2;
  geo_isolate_sync_data(v6, &v8);
  objc_msgSend(*(id *)(a1 + 48), "setError:", v7, v8, v9, v10, v11, v12);

  [*(id *)(a1 + 48) send];
}

void sub_10001F558(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 32LL);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
  [v1 removeObjectForKey:v2];
}

void sub_10001F710( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10001F728(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 32LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v2 objectForKey:v3]);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = *(void **)(a1 + 40);
  id v8 = *(void **)(*(void *)(a1 + 32) + 24LL);
  id v9 = (id)objc_claimAutoreleasedReturnValue([v7 identifier]);
  [v8 removeObject:v9];
}

void sub_10001F938(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GeoServices", "ImageService");
  id v2 = (void *)qword_10006B000;
  qword_10006B000 = (uint64_t)v1;
}

void sub_10001F9A8(id a1)
{
  os_log_t v1 = -[NSSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSSet),  "initWithObjects:",  @"ShortSessionDataByAppID",  0LL);
  id v2 = (void *)qword_10006B010;
  qword_10006B010 = (uint64_t)v1;
}

void sub_100020154(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary _geo_replyDictionaryForError:key:]( &OBJC_CLASS___NSDictionary,  "_geo_replyDictionaryForError:key:",  a2,  @"err"));
  [v2 sendReply:v3];
}

void sub_100020540( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
}

uint64_t sub_10002056C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10002057C(uint64_t a1)
{
}

void sub_100020584(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) objectEnumerator]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 allObjects]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000205E4(void *a1, void *a2, int a3)
{
  id v5 = a2;
  if (a1)
  {
    if ((*(void *)&a3 & 0xFFF000LL) != 0)
    {
      [a1 _notifyPeerOfChangedKeys:v5 options:*(void *)&a3 & 0xFFF000 | 0x10000000];
    }

    else
    {
      BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
      if (v6) {
        sub_10003ADA0(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
}

void sub_10002091C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
}

void sub_100020948(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) objectEnumerator]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 allObjects]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000209A8(void *a1, void *a2, int a3)
{
  id v5 = a2;
  if (a1)
  {
    if ((*(void *)&a3 & 0xFFF000LL) != 0)
    {
      [a1 _notifyPeerOfChangedKeys:v5 options:*(void *)&a3 & 0xFFF000];
    }

    else
    {
      BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
      if (v6) {
        sub_10003ADA0(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
}

void sub_100020FC0(_Unwind_Exception *a1)
{
}

void sub_100020FD8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8LL) + 32LL;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100021048;
  v3[3] = &unk_100059190;
  id v4 = v1;
  GEOOnce(v2, v3);
}

id sub_100021048(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTaskCompleted];
}

void sub_100021050(uint64_t a1)
{
  global_queue = (dispatch_queue_s *)geo_get_global_queue(21LL);
  dispatch_async(global_queue, *(dispatch_block_t *)(a1 + 32));
}

uint64_t sub_10002108C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10002111C(uint64_t a1)
{
  uint64_t v2 = sub_100021174(objc_alloc(&OBJC_CLASS____GEODefaultsNotificationHelper), *(void **)(a1 + 32));
  [*(id *)(*(void *)(a1 + 40) + 24) setObject:v2 forKey:*(void *)(a1 + 32)];
}

void *sub_100021174(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_CLASS____GEODefaultsNotificationHelper;
    id v4 = objc_msgSendSuper2(&v14, "init");
    a1 = v4;
    if (v4)
    {
      objc_storeWeak((id *)v4 + 1, v3);
      uint64_t v5 = geo_isolater_create_with_format("geo.dnh.%p", v3);
      BOOL v6 = (void *)a1[2];
      a1[2] = v5;

      uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  6LL));
      uint64_t v8 = (void *)a1[4];
      a1[4] = v7;

      uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 2LL));
      uint64_t v10 = (void *)a1[5];
      a1[5] = v9;

      uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
      uint64_t v12 = (void *)a1[3];
      a1[3] = v11;
    }
  }

  return a1;
}

id sub_1000212D4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_10002136C(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) peer]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:v3]);

  if (v4)
  {
    uint64_t v5 = GEOGetUserDefaultsLog();
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) peer]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) keysAndSources]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
      int v12 = 138412546;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Peer %@ adding listeners for: %@",  (uint8_t *)&v12,  0x16u);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) keysAndSources]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
    sub_1000214CC((uint64_t)v4, v11);
  }
}

void sub_1000214CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 16);
    v6[1] = 3221225472LL;
    v6[2] = sub_100021D6C;
    v6[3] = &unk_100059520;
    id v5 = v3;
    v6[0] = _NSConcreteStackBlock;
    id v7 = v3;
    uint64_t v8 = a1;
    geo_isolate_sync_data(v4, v6);

    id v3 = v5;
  }
}

void sub_1000215CC(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) peer]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:v3]);

  if (v4)
  {
    uint64_t v5 = GEOGetUserDefaultsLog();
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) peer]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) keys]);
      int v10 = 138412546;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Peer %@ removing listeners for: %@",  (uint8_t *)&v10,  0x16u);
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) keys]);
    sub_10002170C((uint64_t)v4, v9);
  }
}

void sub_10002170C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 16);
    v6[1] = 3221225472LL;
    v6[2] = sub_100021E60;
    v6[3] = &unk_100059520;
    id v5 = v3;
    v6[0] = _NSConcreteStackBlock;
    id v7 = v3;
    uint64_t v8 = a1;
    geo_isolate_sync_data(v4, v6);

    id v3 = v5;
  }
}

LABEL_19:
    [v5 setError:v10];
    [v5 send];
    goto LABEL_20;
  }

  uint64_t v20 = [v4 keyOptions];
  uint64_t v21 = _GEOConfigProxy();
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 configStoreForOptions:v20]);

  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 getConfigValueForKey:v6 countryCode:0 options:v20 source:0]);
  EntitledKeyPathForKey = objc_claimAutoreleasedReturnValue([v4 keyValue]);
  uint64_t v26 = (void *)EntitledKeyPathForKey;
  if (v24) {
    id v27 = 0;
  }
  else {
    id v27 = v7;
  }
  if (v27 == 1 && EntitledKeyPathForKey) {
    EntitledKeyPathForKey = GEOConfig_createEntitledKeyPathForKey(v6, v20, v23);
  }
  id v28 = GEOGetUserDefaultsLog(EntitledKeyPathForKey);
  __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v34 = v6;
    __int16 v35 = 1024;
    LODWORD(v36[0]) = (_DWORD)v20;
    WORD2(v36[0]) = 2112;
    *(void *)((char *)v36 + 6) = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "Setting value for key: %@ (%#x) = %@",  buf,  0x1Cu);
  }

  [v23 setConfigValue:v26 forKey:v6 options:v20 synchronous:1];
  [v5 send];

LABEL_20:
}

void sub_100021D6C(uint64_t a1)
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      BOOL v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend( *(id *)(*(void *)(a1 + 40) + 24),  "addObject:",  *(void *)(*((void *)&v7 + 1) + 8 * (void)v6),  (void)v7);
        BOOL v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

void sub_100021E60(uint64_t a1)
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      BOOL v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend( *(id *)(*(void *)(a1 + 40) + 24),  "removeObject:",  *(void *)(*((void *)&v7 + 1) + 8 * (void)v6),  (void)v7);
        BOOL v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

void sub_100022008(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", *(void *)(a1 + 32)));
  if ((_GEOConfigOptionsUseClientCache(*(void *)(a1 + 56)) & 1) != 0)
  {
    id v7 = v2;
  }

  else
  {
    id v7 = [v2 mutableCopy];
    [v7 intersectSet:*(void *)(*(void *)(a1 + 40) + 24)];
    if (![v7 count])
    {
      id v3 = v7;
      id v7 = v2;
      goto LABEL_11;
    }
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 56)));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 32) objectForKeyedSubscript:v3]);
  if (!v4)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 10LL));
    [*(id *)(*(void *)(a1 + 40) + 32) setObject:v4 forKeyedSubscript:v3];
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
  [v4 addObjectsFromArray:v5];

  if ((*(_BYTE *)(a1 + 57) & 0x10) != 0) {
    [*(id *)(*(void *)(a1 + 40) + 40) addObject:v3];
  }
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) connection]);
  [v6 initiateBarrierIfNecessary:0 delegate:*(void *)(a1 + 40)];

LABEL_11:
}

void sub_1000223FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100022440(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) allKeys]);
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);

    if (v3)
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 unsignedIntegerValue];
      uint64_t v4 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v3]);
      uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8LL);
      BOOL v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      [*(id *)(*(void *)(a1 + 32) + 32) setObject:0 forKeyedSubscript:v3];
      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 40) containsObject:v3];
      [*(id *)(*(void *)(a1 + 32) + 40) removeObject:v3];
    }
  }

  if ([*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) connection]);
    [v7 initiateBarrierIfNecessary:0 delegate:*(void *)(a1 + 32)];
  }

void sub_100022600(id a1)
{
  uint64_t v1 = -[GEODiskSpaceManager initWithCacheDeleteID:]( objc_alloc(&OBJC_CLASS___GEODiskSpaceManager),  "initWithCacheDeleteID:",  @"com.apple.geod.cachedelete");
  id v2 = (void *)qword_10006B020;
  qword_10006B020 = (uint64_t)v1;
}

void sub_100022A54(_Unwind_Exception *a1)
{
}

id sub_100022A80(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _validVolume:v5]);

  if (v7)
  {
    id v8 = objc_loadWeakRetained(v4);
    id v9 = [v8 purgableDiskSpaceForUrgency:a2];

    uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEODiskSpaceManager");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134283521;
      id v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Returning purgeable space: %{private}llu",  buf,  0xCu);
    }

    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v9,  @"CACHE_DELETE_AMOUNT"));
    v16[1] = @"CACHE_DELETE_VOLUME";
    v17[0] = v12;
    v17[1] = v7;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));

    id v14 = v13;
  }

  else
  {
    id v14 = &__NSDictionary0__struct;
  }

  return v14;
}

id sub_100022C0C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);
  id v7 = [v6 unsignedLongLongValue];

  id v8 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _validVolume:v5]);

  if (v10)
  {
    id v11 = objc_loadWeakRetained(v8);
    id v12 = [v11 freePurgableDiskSpace:v7 urgency:a2];

    uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEODiskSpaceManager");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134283777;
      id v22 = v12;
      __int16 v23 = 2049;
      id v24 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Freed %{private}llu bytes of %{private}llu requested",  buf,  0x16u);
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v12,  @"CACHE_DELETE_AMOUNT"));
    v19[1] = @"CACHE_DELETE_VOLUME";
    v20[0] = v15;
    v20[1] = v10;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));

    id v17 = v16;
  }

  else
  {
    id v17 = &__NSDictionary0__struct;
  }

  return v17;
}

void sub_100022E4C(_Unwind_Exception *a1)
{
}

void sub_100022FB0(_Unwind_Exception *a1)
{
}

void sub_100023198( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1000232E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000232FC(uint64_t a1, void *a2)
{
  id v3 = [a2 purgableDiskSpaceForUrgency:*(unsigned int *)(a1 + 48)];
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += v3;
  objc_sync_exit(obj);
}

void sub_100023460( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100023478(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v4 = *(void *)(a1 + 48);
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (v4 <= v5)
  {
    *a4 = 1;
  }

  else
  {
    id v7 = [a2 freePurgableDiskSpace:v4 - v5 urgency:*(unsigned int *)(a1 + 56)];
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += v7;
    objc_sync_exit(obj);
  }

id *sub_100023548(id *a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_CLASS___GEOWiFiQualityTileRequester;
    id v11 = (id *)objc_msgSendSuper2(&v13, "init");
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
    }
  }

  return a1;
}

void sub_100023604(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = a2;
  id v7 = a3;
  if (a1)
  {
    uint64_t v8 = GEOURLString(49LL, v6);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ([v9 length])
    {
      id v31 = v7;
      __int128 v32 = v5;
      id v10 = [v7 copy];
      id v11 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v10;

      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2LL));
      [v12 setObject:*(void *)(a1 + 8) forKey:@"X-tilekey"];
      if (GEOConfigGetBOOL( GeoServicesConfig_WiFiQualityTileSendVersioning[0],  GeoServicesConfig_WiFiQualityTileSendVersioning[1]))
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](&OBJC_CLASS___GEOPlatform, "sharedPlatform"));
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 osAndBuildVersion]);

        [v12 setObject:v15 forKey:@"X-os-version"];
      }

      id v16 = objc_msgSend((id)objc_opt_class(a1, v13), "requestKind");
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[GEORequestCounter sharedCounter](&OBJC_CLASS___GEORequestCounter, "sharedCounter"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 requestCounterTicketForType:v16 auditToken:*(void *)(a1 + 24) traits:0]);

      if (GEOConfigGetBOOL( GeoServicesConfig_WiFiQualityTileAllowCellular[0],  GeoServicesConfig_WiFiQualityTileAllowCellular[1])) {
        uint64_t v19 = 0LL;
      }
      else {
        uint64_t v19 = 16LL;
      }
      if (GEOConfigGetBOOL( GeoServicesConfig_WiFiQualityTileRequirePower[0],  GeoServicesConfig_WiFiQualityTileRequirePower[1])) {
        v19 |= 0x20uLL;
      }
      if (GEOConfigGetBOOL( GeoServicesConfig_TLSSessionTicketsEnabled[0],  GeoServicesConfig_TLSSessionTicketsEnabled[1])) {
        uint64_t v20 = v19 | 2;
      }
      else {
        uint64_t v20 = v19;
      }
      id v21 = objc_alloc(&OBJC_CLASS___GEODataRequest);
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9));
      uint64_t v23 = *(void *)(a1 + 24);
      double Double = GEOConfigGetDouble( GeoServicesConfig_WiFiQualityTileTimeout[0],  GeoServicesConfig_WiFiQualityTileTimeout[1]);
      id v25 = [v12 copy];
      id v26 = [v21 initWithKind:v16 URL:v22 auditToken:v23 timeoutInterval:v25 additionalHTTPHeaders:0 bodyData:0 userAgent:Double entityTag:*(void *)(a1 + 16) cachedData:0  requestCounterTicket:v18 multipathServiceType:0 multipathAlternatePort:0 backgroundSessionIdentifier:0 throttleToken:0 options:v20];

      id v27 = (void *)objc_claimAutoreleasedReturnValue(+[GEODataURLSession sharedDataURLSession](&OBJC_CLASS___GEODataURLSession, "sharedDataURLSession"));
      unint64_t v5 = v32;
      uint64_t v28 = objc_claimAutoreleasedReturnValue([v27 taskWithRequest:v26 delegate:a1 delegateQueue:v32]);
      __int128 v29 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v28;

      [*(id *)(a1 + 32) start];
      id v7 = v31;
    }

    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10002391C;
      block[3] = &unk_100059750;
      id v34 = (id)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -4LL,  @"No URL in manifest for WiFi tile service"));
      id v35 = v7;
      id v30 = v34;
      dispatch_async(v5, block);
    }
  }
}

uint64_t sub_10002391C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  *(void *)(a1 + 32));
}

id sub_100023B80()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint64_t v1 = 0LL;
  char v2 = 1;
  do
  {
    char v3 = v2;
    unint64_t v4 = sub_100023C7C(v1, 0LL);
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if (v5) {
      [v0 addObject:v5];
    }
    id v6 = sub_100023C28(v1);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if ([v7 count]) {
      [v0 addObjectsFromArray:v7];
    }

    char v2 = 0;
    uint64_t v1 = 1LL;
  }

  while ((v3 & 1) != 0);
  return v0;
}

GEOMAResourceInfo_TerritoryRegulatoryInfo *sub_100023C20(uint64_t a1)
{
  return sub_100023C7C(a1, 0LL);
}

id sub_100023C28(uint64_t a1)
{
  if (a1 == 2) {
    return &__NSArray0__struct;
  }
  if (a1 == 1)
  {
    uint64_t v1 = &OBJC_CLASS___GEOMAResourceInfo_TerritoryRegulatoryInfo;
  }

  else
  {
    if (a1)
    {
      char v3 = 0LL;
      return v3;
    }

    uint64_t v1 = &OBJC_CLASS___GEOMAResourceInfo_MetroRegion;
  }

  char v3 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class allExisitngInfos](v1, "allExisitngInfos"));
  return v3;
}

GEOMAResourceInfo_TerritoryRegulatoryInfo *sub_100023C7C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 == 1)
  {
    unint64_t v4 = objc_alloc_init(&OBJC_CLASS___GEOMAResourceInfo_TerritoryRegulatoryInfo);
  }

  else
  {
    if (a1)
    {
      unint64_t v5 = 0LL;
      goto LABEL_7;
    }

    unint64_t v4 = -[GEOMAResourceInfo_MetroRegion initWithOverrides:]( objc_alloc(&OBJC_CLASS___GEOMAResourceInfo_MetroRegion),  "initWithOverrides:",  v3);
  }

  unint64_t v5 = v4;
LABEL_7:

  return v5;
}

CFStringRef sub_100023CE8(uint64_t a1)
{
  uint64_t v1 = @"territories";
  if (a1 != 1) {
    uint64_t v1 = 0LL;
  }
  if (a1) {
    return v1;
  }
  else {
    return @"metroRegions";
  }
}

void sub_100023E0C(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v5 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

  if (v6 == v8) {
    id v7 = 0LL;
  }
  else {
    id v7 = v8;
  }
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
}

void sub_100023EC8(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[GEOFilePaths urlFor:](&OBJC_CLASS___GEOFilePaths, "urlFor:", 15LL));
  char v2 = (void *)qword_10006B030;
  qword_10006B030 = v1;
}

void sub_1000242E4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    [*(id *)(a1 + 32) addKeyValuePair:v5 with:v6];
  }

  else
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray, v9);
    if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
    {
      id v11 = *(void **)(a1 + 32);
      id v12 = [v6 mutableCopy];
      [v11 addKeyValueArray:v5 with:v12];
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      sub_10003AE3C((uint64_t)v6, v13, v14);
    }
  }
}

void sub_1000244AC(uint64_t a1)
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) baseURL]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v28 = 0LL;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 contentsOfDirectoryAtURL:v2 includingPropertiesForKeys:&__NSArray0__struct options:0 error:&v28]);
  id v5 = v28;

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
    if ([v6 isEqualToString:NSCocoaErrorDomain])
    {
      id v7 = [v5 code];

      if (v7 == (id)260) {
        goto LABEL_4;
      }
    }

    else
    {
    }

    id v23 = sub_100018084();
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if (!os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    {
LABEL_20:

      goto LABEL_21;
    }

    *(_DWORD *)buf = 138478083;
    id v31 = v2;
    __int16 v32 = 2112;
    id v33 = v5;
    uint64_t v19 = "Unable to list contents of asset folder %{private}@: %@";
    uint64_t v20 = (os_log_s *)v17;
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    uint32_t v22 = 22;
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, buf, v22);
    goto LABEL_20;
  }

LABEL_4:
  if ([v4 count])
  {
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
          uint64_t v14 = objc_alloc(&OBJC_CLASS___GEOMAResource);
          uint64_t v15 = -[GEOMAResource initWithResourceFolder:info:]( v14,  "initWithResourceFolder:info:",  v13,  *(void *)(a1 + 40),  (void)v24);
          if (v15) {
            [*(id *)(a1 + 48) addObject:v15];
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }

      while (v10);
    }

    id v16 = sub_100018084();
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_INFO)) {
      goto LABEL_20;
    }
    id v18 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138477827;
    id v31 = v18;
    uint64_t v19 = "Found installed resources: %{private}@";
    uint64_t v20 = (os_log_s *)v17;
    os_log_type_t v21 = OS_LOG_TYPE_INFO;
    uint32_t v22 = 12;
    goto LABEL_19;
  }

id sub_100024818(uint64_t a1)
{
  return [*(id *)(a1 + 32) _listResources:*(unsigned __int8 *)(a1 + 56) queue:*(void *)(a1 + 40) results:*(void *)(a1 + 48)];
}

void sub_100024A04(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_100018084();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) results]);
    *(_DWORD *)buf = 67109891;
    int v20 = a2;
    __int16 v21 = 2112;
    id v22 = v5;
    __int16 v23 = 2113;
    uint64_t v24 = v8;
    __int16 v25 = 2113;
    __int128 v26 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "MA query result: %d error: %@ info; %{private}@ resources: %{private}@",
      buf,
      0x26u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100024B94;
  v12[3] = &unk_10005A090;
  id v10 = *(dispatch_queue_s **)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 72);
  uint64_t v18 = a2;
  id v15 = v5;
  id v16 = *(id *)(a1 + 64);
  id v11 = v5;
  dispatch_async(v10, v12);
}

void sub_100024B94(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count]
    || (char v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) results]),
        id v3 = [v2 count],
        v2,
        v3))
  {
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) results]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100024D30;
    v9[3] = &unk_10005A068;
    id v10 = *(id *)(a1 + 56);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_geo_map:", v9));

    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  (char *)[*(id *)(a1 + 32) count] + (void)objc_msgSend(v5, "count")));
    if ([*(id *)(a1 + 32) count]) {
      [v6 addObjectsFromArray:*(void *)(a1 + 32)];
    }
    if ([v5 count]) {
      [v6 addObjectsFromArray:v5];
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sortedArrayUsingSelector:"compare:"]);

    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

GEOMAResource *sub_100024D30(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = -[GEOMAResource initWithMobileAsset:info:]( objc_alloc(&OBJC_CLASS___GEOMAResource),  "initWithMobileAsset:info:",  v3,  *(void *)(a1 + 32));

  return v4;
}

void sub_100024E6C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 appendString:@" "];
  [*(id *)(a1 + 32) appendString:v6];

  [*(id *)(a1 + 32) appendString:@": "];
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString, v7);
  if ((objc_opt_isKindOfClass(v19, v8) & 1) != 0)
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = v19;
  }

  else
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray, v9);
    char isKindOfClass = objc_opt_isKindOfClass(v19, v12);
    id v14 = *(void **)(a1 + 32);
    if ((isKindOfClass & 1) != 0)
    {
      [v14 appendString:@"["];
      id v15 = *(void **)(a1 + 32);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString componentsJoinedByString:](v19, "componentsJoinedByString:", @", "));
      [v15 appendString:v16];

      id v10 = *(void **)(a1 + 32);
      id v11 = @"]";
    }

    else
    {
      [v14 appendString:@"{invalid: "];
      id v17 = *(void **)(a1 + 32);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString description](v19, "description"));
      [v17 appendString:v18];

      id v10 = *(void **)(a1 + 32);
      id v11 = @"}";
    }
  }

  [v10 appendString:v11];
}

void sub_100025138( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100025150(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100025160(uint64_t a1)
{
}

void sub_100025168(uint64_t a1)
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) baseURLForType:1]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);

  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v6 = objc_alloc_init(*(Class *)(a1 + 40));
    id v10 = v6;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

void sub_100025544(uint64_t a1)
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) baseURLForType:0]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v27 = 0LL;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 contentsOfDirectoryAtURL:v2 includingPropertiesForKeys:&__NSArray0__struct options:0 error:&v27]);
  id v5 = v27;

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
    if ([v6 isEqualToString:NSCocoaErrorDomain])
    {
      id v7 = [v5 code];

      if (v7 == (id)260) {
        goto LABEL_9;
      }
    }

    else
    {
    }

    id v8 = sub_100018084();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Unable to list contents of metro asset folder: %@",  buf,  0xCu);
    }
  }

LABEL_9:
  if ([v4 count])
  {
    id v20 = v5;
    __int16 v21 = v4;
    id v22 = v2;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v10 = v4;
    id v11 = [v10 countByEnumeratingWithState:&v23 objects:v30 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v24;
      uint64_t v14 = GEOMetroRegionCountryCodeKey;
      do
      {
        id v15 = 0LL;
        do
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v23 + 1) + 8 * (void)v15) lastPathComponent]);
          if ((unint64_t)[v16 length] >= 2 && (unint64_t)objc_msgSend(v16, "length") < 4
            || [v16 isEqualToString:@"_UNK_"])
          {
            id v17 = objc_alloc(*(Class *)(a1 + 40));
            uint64_t v28 = v14;
            __int128 v29 = v16;
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
            id v19 = [v17 initWithOverrides:v18];

            if (v19) {
              [*(id *)(a1 + 32) addObject:v19];
            }
          }

          id v15 = (char *)v15 + 1;
        }

        while (v12 != v15);
        id v12 = [v10 countByEnumeratingWithState:&v23 objects:v30 count:16];
      }

      while (v12);
    }

    unint64_t v4 = v21;
    char v2 = v22;
    id v5 = v20;
  }
}

void sub_100025BE4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (v5)
    {
      id v10 = @"wifiresp";
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 data]);
      id v11 = v7;
      uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
      goto LABEL_5;
    }

    id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -8LL,  @"SPI contract violated"));
  }

  id v7 = v6;
  uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSDictionary _geo_replyDictionaryForError:key:]( &OBJC_CLASS___NSDictionary,  "_geo_replyDictionaryForError:key:",  v6,  @"err"));
LABEL_5:
  uint64_t v9 = (void *)v8;

  [*(id *)(a1 + 32) sendReply:v9];
}

void sub_100025E58(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v16 = a2;
  unint64_t v9 = a3;
  unint64_t v10 = a4;
  id v11 = a5;
  if (v11) {
    goto LABEL_9;
  }
  if (!(v9 | v10))
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -8LL,  @"SPI contract violated"));
LABEL_9:
    uint64_t v13 = v11;
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary _geo_replyDictionaryForError:key:]( &OBJC_CLASS___NSDictionary,  "_geo_replyDictionaryForError:key:",  v11,  @"err"));
    goto LABEL_10;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2LL));
  uint64_t v13 = v12;
  if (v10) {
    [v12 setObject:v10 forKeyedSubscript:@"wifitd"];
  }
  if (v9) {
    [v13 setObject:v9 forKeyedSubscript:@"wifiet"];
  }
  id v14 = [v13 copy];
LABEL_10:
  id v15 = v14;

  [*(id *)(a1 + 32) sendReply:v15];
}

void sub_1000261FC(id *a1, unint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_100018084();
  unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109635;
    int v56 = a2;
    __int16 v57 = 2112;
    id v58 = v8;
    __int16 v59 = 2113;
    id v60 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Found resources: %d error: %@ resources: %{private}@",  buf,  0x1Cu);
  }

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_1000266B4;
  v51[3] = &unk_10005A158;
  id v52 = a1[4];
  id v53 = a1[5];
  id v11 = objc_retainBlock(v51);
  if ([v7 count])
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 lastObject]);
    if ([v12 isAvailableForUse])
    {
      ((void (*)(void *, void *, void))v11[2])(v11, v12, 0LL);
    }

    else
    {
      unsigned int v14 = [v12 isOnDisk];
      unsigned __int8 v15 = [a1[6] options];
      unsigned __int8 v16 = [a1[6] options];
      unsigned int v17 = [a1[6] options];
      if ((v15 & 1) != 0 && (v16 & 2) != 0 && (v14 & 1) == 0)
      {
        ((void (*)(void *, void, void))v11[2])(v11, 0LL, 0LL);
      }

      else
      {
        if ((v15 & 1) != 0)
        {
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          id obj = (id)objc_claimAutoreleasedReturnValue([v7 reverseObjectEnumerator]);
          id v24 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
          if (v24)
          {
            id v25 = v24;
            uint64_t v26 = *(void *)v48;
            while (2)
            {
              for (i = 0LL; i != v25; i = (char *)i + 1)
              {
                if (*(void *)v48 != v26) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v28 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)i);
                if ([v28 isAvailableForUse])
                {
                  ((void (*)(void *, void *, void))v11[2])(v11, v28, 0LL);
                  goto LABEL_33;
                }

                if ([v28 isOnDisk])
                {
                  id v31 = a1[7];
                  v44[0] = _NSConcreteStackBlock;
                  v44[1] = 3221225472LL;
                  v44[2] = sub_100026838;
                  v44[3] = &unk_1000599B8;
                  id v46 = v11;
                  id v45 = v12;
                  [v45 downloadWithOptions:0 queue:v31 completion:v44];

                  goto LABEL_33;
                }
              }

              id v25 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
              if (v25) {
                continue;
              }
              break;
            }
          }

LABEL_33:
          id v30 = obj;
        }

        else
        {
          int v18 = (v17 >> 8) & 1;
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472LL;
          void v37[2] = sub_100026848;
          v37[3] = &unk_10005A180;
          id v38 = a1[5];
          char v43 = v18;
          id v39 = v7;
          id v19 = v12;
          id v40 = v19;
          id v20 = v11;
          id v42 = v20;
          id v41 = a1[7];
          __int16 v21 = objc_retainBlock(v37);
          id v22 = v21;
          if (v14)
          {
            id v23 = a1[7];
            v33[0] = _NSConcreteStackBlock;
            v33[1] = 3221225472LL;
            v33[2] = sub_100026CD0;
            v33[3] = &unk_10005A1A8;
            id v35 = v20;
            id v34 = v19;
            id v36 = v22;
            [v34 downloadWithOptions:0 queue:v23 completion:v33];
          }

          else
          {
            ((void (*)(void *))v21[2])(v21);
          }

          id v30 = v38;
        }
      }
    }
  }

  else
  {
    if (!v8)
    {
      if (a2 >= 0xF) {
        uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown(%d)",  a2));
      }
      else {
        uint64_t v13 = off_10005A1F0[a2];
      }
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Received no results or error from MA Query, only code: %d: %@",  a2,  v13));
      id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:reason:](&OBJC_CLASS___NSError, "GEOErrorWithCode:reason:", -8LL, v29));
    }

    ((void (*)(void *, void, id))v11[2])(v11, 0LL, v8);
  }
}

void sub_1000266B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isAvailableForUse])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 getLocalFileUrl]);
    uint64_t v8 = APP_SANDBOX_READ;
    id v9 = v7;
    id v10 = [v9 fileSystemRepresentation];
    id v11 = (const char *)sandbox_extension_issue_file(v8, v10, SANDBOX_EXTENSION_DEFAULT);
    if (v11)
    {
      id v12 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v11,  strlen(v11) + 1,  1LL);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      [*(id *)(a1 + 32) setSandBoxToken:v13];
    }

    else
    {
      id v14 = sub_100018084();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        int v15 = 138412290;
        id v16 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_FAULT,  "Failed to issue sandbox extension for file: %@",  (uint8_t *)&v15,  0xCu);
      }
    }

    [*(id *)(a1 + 40) updateLastAccessedTime];
    [*(id *)(a1 + 32) setUrl:v9];
  }

  else
  {
    [*(id *)(a1 + 32) setError:v6];
  }

  [*(id *)(a1 + 32) send];
}

uint64_t sub_100026838(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_100026848(uint64_t a1)
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) downloadOptions]);
  id v3 = v2;
  if (*(_BYTE *)(a1 + 72))
  {
    [v2 setAllowsCellularAccess:1];
    [v3 setAllowsExpensiveAccess:1];
    [v3 setRequiresPowerPluggedIn:0];
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) reverseObjectEnumerator]);
  id v5 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v33;
LABEL_5:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v33 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v32 + 1) + 8 * v8);
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v6) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }

    id v10 = v9;
    id v11 = sub_100018084();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Found older copy already in place.", buf, 2u);
    }

    if (v10) {
      goto LABEL_28;
    }
  }

  else
  {
LABEL_11:
  }

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) reverseObjectEnumerator]);
  id v10 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v10)
  {
    uint64_t v14 = *(void *)v28;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v13);
        }
        id v16 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        if ([v16 isOnDisk])
        {
          id v10 = v16;
          id v17 = sub_100018084();
          int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Found older copy in MobileAssets storage.",  buf,  2u);
          }

          goto LABEL_27;
        }
      }

      id v10 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

void sub_100026BFC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_100018084();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Relocated older copy with result %d: %@.",  (uint8_t *)v8,  0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_100026CD0(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
  id v3 = sub_100018084();
  unint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Latest resource wasn't available, will queue it up",  v6,  2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

LABEL_23:
}

LABEL_42:
      int v15 = (char *)v15 + 1;
    }

    while (v15 != v11);
    id v11 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
  }

  while (v11);
LABEL_46:
  __int128 v34 = sub_100018084();
  __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v54 = v12;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Found %llu purgable bytes", buf, 0xCu);
  }

  return v12;
}

id *sub_100027844(id *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_CLASS___GEOWiFiQualityServiceRequester;
    uint64_t v8 = (id *)objc_msgSendSuper2(&v10, "init");
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

void sub_1000278EC(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___GEOWiFiQualityServiceDataRequestConfig);
    uint64_t v8 = a1[1];
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](&OBJC_CLASS___GEOMapService, "sharedService"));
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 defaultTraits]);
    uint64_t v11 = a1[2];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100027A10;
    v12[3] = &unk_10005A270;
    id v13 = v5;
    id v14 = v6;
    [a1 _startWithRequest:v8 traits:v10 auditToken:v11 config:v7 throttleToken:0 options:0 completionHandler:v12];
  }
}

void sub_100027A10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100027AC8;
  block[3] = &unk_100059BB8;
  id v7 = *(dispatch_queue_s **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t sub_100027AC8(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

void sub_100027DC4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_100027DE8()
{
  if (qword_10006B048 != -1) {
    dispatch_once(&qword_10006B048, &stru_10005A3F8);
  }
  return (id)qword_10006B040;
}

id sub_100027E28(uint64_t a1, void *a2)
{
  char v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _setup:v3];

  return v5;
}

void sub_100028088(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0LL;
}

BOOL sub_10002811C(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_step(a2);
  if (v4 == 100)
  {
    *(void *)(*(void *)(a1 + 32) + 32) = [*(id *)(*(void *)(a1 + 32) + 16) int64ForColumn:0 inStatment:a2];
    *(void *)(*(void *)(a1 + 32) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) int64ForColumn:1 inStatment:a2];
  }

  return v4 == 100;
}

void sub_10002837C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t sub_1000283AC(void *a1, sqlite3_stmt *a2)
{
  if (![*(id *)(a1[4] + 16) bindInt64Parameter:"@timestamp" toValue:a1[7] inStatement:a2 error:0]
    || sqlite3_step(a2) != 100)
  {
    return 0LL;
  }

  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = [*(id *)(a1[4] + 16) intForColumn:0 inStatment:a2];
  uint64_t v4 = 1LL;
  *(void *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 16) int64ForColumn:1 inStatment:a2];
  return v4;
}

id sub_100028458(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) bindIntParameter:"@limit" toValue:*(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) inStatement:a2 error:0];
}

void sub_1000286B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

uint64_t sub_1000286E0(void *a1, sqlite3_stmt *a2)
{
  do
  {
    if (sqlite3_step(a2) != 100) {
      break;
    }
    id v4 = [*(id *)(a1[4] + 16) int64ForColumn:0 inStatment:a2];
    ++*(_DWORD *)(*(void *)(a1[5] + 8LL) + 24LL);
    *(void *)(*(void *)(a1[6] + 8LL) + 24LL) += v4;
  }

  while (a1[7] + *(void *)(*(void *)(a1[6] + 8LL) + 24LL) <= a1[8]);
  return 1LL;
}

id sub_10002876C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) bindIntParameter:"@limit" toValue:*(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) inStatement:a2 error:0];
}

void sub_100028820( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100028838(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(void *)(*(void *)(result + 32) + 40LL);
  return result;
}

void sub_1000288E0(_Unwind_Exception *a1)
{
}

id sub_1000288F8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _shrinkToSize:*(void *)(a1 + 48)];
  return [*(id *)(*(void *)(a1 + 32) + 16) vacuum];
}

void sub_1000289C8(_Unwind_Exception *a1)
{
}

id sub_1000289E0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _shrinkBySize:*(void *)(a1 + 48)];
  return [*(id *)(*(void *)(a1 + 32) + 16) vacuum];
}

void sub_100028ADC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(v2 + 16);
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472LL;
  id v7 = sub_100028B78;
  id v8 = &unk_10005A360;
  uint64_t v9 = v2;
  id v10 = v3;
  uint64_t v12 = *(void *)(a1 + 56);
  id v11 = *(id *)(a1 + 48);
  [v4 executeInTransaction:&v5];
  objc_msgSend(*(id *)(a1 + 32), "_evictIfNecessary", v5, v6, v7, v8, v9);
}

uint64_t sub_100028B78(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  id v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 16LL);
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = [*(id *)(a1 + 48) length];
  id v7 = *(void **)(a1 + 48);
  id v8 = v4;
  id v9 = v3;
  id v10 = v7;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x3032000000LL;
  v26[3] = sub_1000291D8;
  v26[4] = sub_1000291E8;
  id v27 = 0LL;
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  int v18 = sub_100029318;
  id v19 = &unk_10005A420;
  id v11 = v8;
  id v20 = v11;
  id v12 = v9;
  id v21 = v12;
  id v23 = v26;
  id v24 = v6;
  uint64_t v25 = v5;
  id v13 = v10;
  id v22 = v13;
  LODWORD(v10) = [v11 executeStatement:@"AddAsset" statementBlock:&v16];

  _Block_object_dispose(v26, 8);
  if (!(_DWORD)v10) {
    return 0LL;
  }
  sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid((sqlite3 *)objc_msgSend( *(id *)(*(void *)(a1 + 32) + 16),  "sqliteDB",  v16,  v17,  v18,  v19));
  uint64_t result = (uint64_t)sub_100028D40( *(void **)(*(void *)(a1 + 32) + 16LL),  insert_rowid,  (unint64_t)(Current + kCFAbsoluteTimeIntervalSince1970));
  if ((_DWORD)result)
  {
    *(void *)(*(void *)(a1 + 32) + 40) += [*(id *)(a1 + 48) length];
    return 1LL;
  }

  return result;
}

void sub_100028D28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

id sub_100028D40(void *a1, uint64_t a2, uint64_t a3)
{
  v13[0] = 0LL;
  v13[1] = v13;
  _DWORD v13[2] = 0x3032000000LL;
  v13[3] = sub_1000291D8;
  void v13[4] = sub_1000291E8;
  id v14 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _DWORD v8[2] = sub_100029488;
  v8[3] = &unk_10005A448;
  id v5 = a1;
  id v9 = v5;
  id v10 = v13;
  uint64_t v11 = a2;
  uint64_t v12 = a3;
  id v6 = [v5 executeStatement:@"SetAccessTime" statementBlock:v8];

  _Block_object_dispose(v13, 8);
  return v6;
}

void sub_100028E14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100028F6C(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  uint64_t v26 = -1LL;
  uint64_t v17 = 0LL;
  int v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  id v20 = sub_1000291D8;
  id v21 = sub_1000291E8;
  id v22 = 0LL;
  id v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 16LL);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  void v16[2] = sub_1000291F0;
  v16[3] = &unk_10005A388;
  v16[4] = &v23;
  v16[5] = &v17;
  uint64_t v5 = *(void *)(a1 + 64);
  id v6 = v4;
  id v7 = v3;
  id v8 = v16;
  v33[0] = 0LL;
  v33[1] = v33;
  v33[2] = 0x3032000000LL;
  v33[3] = sub_1000291D8;
  void v33[4] = sub_1000291E8;
  id v34 = 0LL;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10002953C;
  v27[3] = &unk_10005A470;
  id v9 = v6;
  id v28 = v9;
  id v10 = v7;
  id v29 = v10;
  id v31 = v33;
  uint64_t v32 = v5;
  uint64_t v11 = v8;
  id v30 = v11;
  [v9 statementForKey:@"FindAsset" statementBlock:v27];

  _Block_object_dispose(v33, 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100029224;
  block[3] = &unk_100059610;
  uint64_t v12 = *(dispatch_queue_s **)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  uint64_t v15 = &v17;
  dispatch_async(v12, block);
  if (v18[5]) {
    sub_100028D40( *(void **)(*(void *)(a1 + 32) + 16LL),  v24[3],  (unint64_t)(Current + kCFAbsoluteTimeIntervalSince1970));
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
}

void sub_1000291A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28)
{
}

uint64_t sub_1000291D8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000291E8(uint64_t a1)
{
}

uint64_t sub_1000291F0(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), obj);
  return 0LL;
}

uint64_t sub_100029224(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

void sub_10002923C(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000292A8;
  block[3] = &unk_1000591E0;
  uint64_t v1 = *(dispatch_queue_s **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t sub_1000292A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000292E8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GeoServices", "ImageServicePersistence");
  uint64_t v2 = (void *)qword_10006B040;
  qword_10006B040 = (uint64_t)v1;
}

id sub_100029318(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id obj = *(id *)(v6 + 40);
  unsigned int v7 = [v4 bindBlobParameter:"@identifier" toValue:v5 inStatement:a2 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7) {
    return 0LL;
  }
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(unsigned int *)(a1 + 72);
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v28 = *(id *)(v10 + 40);
  unsigned int v11 = [v8 bindIntParameter:"@width" toValue:v9 inStatement:a2 error:&v28];
  objc_storeStrong((id *)(v10 + 40), v28);
  if (!v11) {
    return 0LL;
  }
  uint64_t v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(unsigned int *)(a1 + 76);
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v27 = *(id *)(v14 + 40);
  unsigned int v15 = [v12 bindIntParameter:"@height" toValue:v13 inStatement:a2 error:&v27];
  objc_storeStrong((id *)(v14 + 40), v27);
  if (!v15) {
    return 0LL;
  }
  id v16 = *(void **)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 64);
  uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v26 = *(id *)(v18 + 40);
  unsigned int v19 = [v16 bindInt64Parameter:"@data_size" toValue:v17 inStatement:a2 error:&v26];
  objc_storeStrong((id *)(v18 + 40), v26);
  if (!v19) {
    return 0LL;
  }
  id v20 = *(void **)(a1 + 32);
  uint64_t v21 = *(void *)(a1 + 48);
  uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v25 = *(id *)(v22 + 40);
  id v23 = [v20 bindBlobParameter:"@data" toValue:v21 inStatement:a2 error:&v25];
  objc_storeStrong((id *)(v22 + 40), v25);
  return v23;
}

id sub_100029488(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[6];
  uint64_t v5 = (void *)a1[4];
  uint64_t v6 = *(void *)(a1[5] + 8LL);
  id obj = *(id *)(v6 + 40);
  unsigned int v7 = [v5 bindInt64Parameter:"@asset_rowid" toValue:v4 inStatement:a2 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7) {
    return 0LL;
  }
  uint64_t v8 = a1[7];
  uint64_t v9 = (void *)a1[4];
  uint64_t v10 = *(void *)(a1[5] + 8LL);
  id v13 = *(id *)(v10 + 40);
  id v11 = [v9 bindInt64Parameter:"@timestamp" toValue:v8 inStatement:a2 error:&v13];
  objc_storeStrong((id *)(v10 + 40), v13);
  return v11;
}

uint64_t sub_10002953C(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id obj = *(id *)(v6 + 40);
  unsigned int v7 = [v4 bindBlobParameter:"@identifier" toValue:v5 inStatement:a2 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7) {
    return 0LL;
  }
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(unsigned int *)(a1 + 64);
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v25 = *(id *)(v10 + 40);
  unsigned int v11 = [v8 bindIntParameter:"@width" toValue:v9 inStatement:a2 error:&v25];
  objc_storeStrong((id *)(v10 + 40), v25);
  if (!v11) {
    return 0LL;
  }
  uint64_t v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(unsigned int *)(a1 + 68);
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v24 = *(id *)(v14 + 40);
  unsigned int v15 = [v12 bindIntParameter:"@height" toValue:v13 inStatement:a2 error:&v24];
  objc_storeStrong((id *)(v14 + 40), v24);
  if (!v15) {
    return 0LL;
  }
  uint64_t v16 = sqlite3_step(a2);
  while ((_DWORD)v16 == 100)
  {
    [*(id *)(a1 + 32) int64ForColumn:0 inStatment:a2];
    uint64_t v17 = 1LL;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) blobForColumn:1 inStatment:a2]);
    uint64_t v16 = sqlite3_step(a2);
  }

  if ((_DWORD)v16 == 101) {
    return 1LL;
  }
  unsigned int v19 = *(void **)(a1 + 32);
  uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v23 = *(id *)(v20 + 40);
  [v19 reportSQLiteErrorCode:v16 method:@"step" error:&v23];
  id v21 = v23;
  uint64_t v17 = 0LL;
  uint64_t v18 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v21;
LABEL_11:

  return v17;
}

char *sub_10002990C(void *a1)
{
  string = (char *)xpc_dictionary_get_string(a1, "lcl");
  if (string)
  {
    uint64_t v2 = objc_alloc(&OBJC_CLASS___NSLocale);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    string = -[NSLocale initWithLocaleIdentifier:](v2, "initWithLocaleIdentifier:", v3);
  }

  return string;
}

LABEL_47:
      uint64_t v32 = connection;
      id v30 = message;
      xpc_connection_send_message(connection, message);
      id v26 = v212;
      id v28 = v215;
LABEL_48:

      uint64_t v6 = v213;
      uint64_t v12 = v214;
      goto LABEL_49;
    }

    id v45 = xpc_data_get_length(v34);
    if (v45 != 4 * (void)[v12 count])
    {
      uint64_t v68 = v12;
      id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -10LL,  @"Bad XPC request encoding (length)"));
      v269 = 0u;
      v270 = 0u;
      v271 = 0u;
      v272 = 0u;
      id v38 = v68;
      uint64_t v69 = [v38 countByEnumeratingWithState:&v269 objects:v297 count:16];
      if (v69)
      {
        uint64_t v70 = v69;
        v71 = *(void *)v270;
        do
        {
          for (k = 0LL; k != v70; k = (char *)k + 1)
          {
            if (*(void *)v270 != v71) {
              objc_enumerationMutation(v38);
            }
            uint64_t v73 = *(void *)(*((void *)&v269 + 1) + 8LL * (void)k);
            uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue([v7 peerID]);
            -[GEOTileServer _receivedTile:error:info:forKey:forPeer:]( self,  "_receivedTile:error:info:forKey:forPeer:",  0LL,  v37,  0LL,  v73,  v74);
          }

          uint64_t v70 = [v38 countByEnumeratingWithState:&v269 objects:v297 count:16];
        }

        while (v70);
      }

      goto LABEL_47;
    }

    bytes_ptr = xpc_data_get_bytes_ptr(v34);
    __int128 v47 = xpc_dictionary_get_value(v6, "has_additional_infos");
    id v37 = (void *)objc_claimAutoreleasedReturnValue(v47);
    v197 = v21;
    if (xpc_get_type(v37) != (xpc_type_t)&_xpc_type_data)
    {
      __int128 v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -10LL,  @"Bad XPC request encoding (type)"));
      v265 = 0u;
      v266 = 0u;
      v267 = 0u;
      v268 = 0u;
      __int128 v49 = v214;
      __int128 v50 = [v49 countByEnumeratingWithState:&v265 objects:v296 count:16];
      if (v50)
      {
        __int128 v51 = v50;
        id v52 = *(void *)v266;
        do
        {
          for (m = 0LL; m != v51; m = (char *)m + 1)
          {
            if (*(void *)v266 != v52) {
              objc_enumerationMutation(v49);
            }
            uint64_t v54 = *(void *)(*((void *)&v265 + 1) + 8LL * (void)m);
            uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v7 peerID]);
            -[GEOTileServer _receivedTile:error:info:forKey:forPeer:]( self,  "_receivedTile:error:info:forKey:forPeer:",  0LL,  v48,  0LL,  v54,  v55);
          }

          __int128 v51 = [v49 countByEnumeratingWithState:&v265 objects:v296 count:16];
        }

        while (v51);
      }

LABEL_68:
      uint64_t v32 = connection;
      id v30 = message;
      xpc_connection_send_message(connection, message);
      id v26 = v212;
      id v28 = v215;
LABEL_69:

      id v21 = v197;
      goto LABEL_48;
    }

    v185 = bytes_ptr;
    v75 = (id)xpc_data_get_length(v37);
    if (v75 != [v214 count])
    {
      __int128 v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -10LL,  @"Bad XPC request encoding (length)"));
      v261 = 0u;
      v262 = 0u;
      v263 = 0u;
      v264 = 0u;
      __int128 v49 = v214;
      uint64_t v87 = [v49 countByEnumeratingWithState:&v261 objects:v295 count:16];
      if (v87)
      {
        uint64_t v88 = v87;
        uint64_t v89 = *(void *)v262;
        do
        {
          for (n = 0LL; n != v88; n = (char *)n + 1)
          {
            if (*(void *)v262 != v89) {
              objc_enumerationMutation(v49);
            }
            uint64_t v91 = *(void *)(*((void *)&v261 + 1) + 8LL * (void)n);
            uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue([v7 peerID]);
            -[GEOTileServer _receivedTile:error:info:forKey:forPeer:]( self,  "_receivedTile:error:info:forKey:forPeer:",  0LL,  v48,  0LL,  v91,  v92);
          }

          uint64_t v88 = [v49 countByEnumeratingWithState:&v261 objects:v295 count:16];
        }

        while (v88);
      }

      goto LABEL_68;
    }

    v76 = (char *)xpc_data_get_bytes_ptr(v37);
    id v77 = xpc_dictionary_get_value(v6, "additional_infos");
    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
    v184 = v78;
    if (xpc_get_type(v78) != (xpc_type_t)&_xpc_type_data)
    {
      uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -10LL,  @"Bad XPC request encoding (type)"));
      v257 = 0u;
      v258 = 0u;
      v259 = 0u;
      v260 = 0u;
      uint64_t v80 = v214;
      uint64_t v81 = [v80 countByEnumeratingWithState:&v257 objects:v294 count:16];
      if (v81)
      {
        uint64_t v82 = v81;
        uint64_t v83 = *(void *)v258;
        do
        {
          for (ii = 0LL; ii != v82; ii = (char *)ii + 1)
          {
            if (*(void *)v258 != v83) {
              objc_enumerationMutation(v80);
            }
            uint64_t v85 = *(void *)(*((void *)&v257 + 1) + 8LL * (void)ii);
            uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue([v7 peerID]);
            -[GEOTileServer _receivedTile:error:info:forKey:forPeer:]( self,  "_receivedTile:error:info:forKey:forPeer:",  0LL,  v79,  0LL,  v85,  v86);
          }

          uint64_t v82 = [v80 countByEnumeratingWithState:&v257 objects:v294 count:16];
        }

        while (v82);
      }

LABEL_88:
      uint64_t v32 = connection;
      id v30 = message;
      xpc_connection_send_message(connection, message);
      id v26 = v212;
      id v28 = v215;
LABEL_89:

      __int128 v48 = v184;
      goto LABEL_69;
    }

    v182 = v76;
    uint64_t v93 = xpc_data_get_length(v78);
    if (v93 != 16 * (void)[v214 count])
    {
      uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -10LL,  @"Bad XPC request encoding (length)"));
      v253 = 0u;
      v254 = 0u;
      v255 = 0u;
      v256 = 0u;
      uint64_t v80 = v214;
      uint64_t v104 = [v80 countByEnumeratingWithState:&v253 objects:v293 count:16];
      if (v104)
      {
        uint64_t v105 = v104;
        uint64_t v106 = *(void *)v254;
        do
        {
          for (jj = 0LL; jj != v105; jj = (char *)jj + 1)
          {
            if (*(void *)v254 != v106) {
              objc_enumerationMutation(v80);
            }
            uint64_t v108 = *(void *)(*((void *)&v253 + 1) + 8LL * (void)jj);
            uint64_t v109 = (void *)objc_claimAutoreleasedReturnValue([v7 peerID]);
            -[GEOTileServer _receivedTile:error:info:forKey:forPeer:]( self,  "_receivedTile:error:info:forKey:forPeer:",  0LL,  v79,  0LL,  v108,  v109);
          }

          uint64_t v105 = [v80 countByEnumeratingWithState:&v253 objects:v293 count:16];
        }

        while (v105);
      }

      goto LABEL_88;
    }

    v181 = (char *)xpc_data_get_bytes_ptr(v78);
    uint64_t v94 = xpc_dictionary_get_value(v6, "signposts");
    uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue(v94);
    uint64_t v96 = v95;
    if (v95)
    {
      if (xpc_get_type(v95) != (xpc_type_t)&_xpc_type_data)
      {
        uint64_t v79 = v96;
        aSelectora = (char *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -10LL,  @"Bad XPC request encoding (type)"));
        v249 = 0u;
        v250 = 0u;
        v251 = 0u;
        v252 = 0u;
        uint64_t v97 = v214;
        uint64_t v98 = [v97 countByEnumeratingWithState:&v249 objects:v292 count:16];
        if (v98)
        {
          uint64_t v99 = v98;
          uint64_t v100 = *(void *)v250;
          do
          {
            for (kk = 0LL; kk != v99; kk = (char *)kk + 1)
            {
              if (*(void *)v250 != v100) {
                objc_enumerationMutation(v97);
              }
              uint64_t v102 = *(void *)(*((void *)&v249 + 1) + 8LL * (void)kk);
              uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue([v7 peerID]);
              -[GEOTileServer _receivedTile:error:info:forKey:forPeer:]( self,  "_receivedTile:error:info:forKey:forPeer:",  0LL,  aSelectora,  0LL,  v102,  v103);
            }

            uint64_t v99 = [v97 countByEnumeratingWithState:&v249 objects:v292 count:16];
          }

          while (v99);
        }

LABEL_111:
        uint64_t v32 = connection;
        id v30 = message;
        xpc_connection_send_message(connection, message);
        id v26 = v212;
        id v28 = v215;
LABEL_175:

        goto LABEL_89;
      }

      uint64_t v79 = v96;
      uint64_t v110 = xpc_data_get_length(v96);
      if (v110 != 8 * (void)[v214 count])
      {
        aSelectora = (char *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -10LL,  @"Bad XPC request encoding (length)"));
        v245 = 0u;
        v246 = 0u;
        v247 = 0u;
        v248 = 0u;
        uint64_t v97 = v214;
        uint64_t v121 = [v97 countByEnumeratingWithState:&v245 objects:v291 count:16];
        if (v121)
        {
          v122 = v121;
          v123 = *(void *)v246;
          do
          {
            for (mm = 0LL; mm != v122; mm = (char *)mm + 1)
            {
              if (*(void *)v246 != v123) {
                objc_enumerationMutation(v97);
              }
              v125 = *(void *)(*((void *)&v245 + 1) + 8LL * (void)mm);
              uint64_t v126 = (void *)objc_claimAutoreleasedReturnValue([v7 peerID]);
              -[GEOTileServer _receivedTile:error:info:forKey:forPeer:]( self,  "_receivedTile:error:info:forKey:forPeer:",  0LL,  aSelectora,  0LL,  v125,  v126);
            }

            v122 = [v97 countByEnumeratingWithState:&v245 objects:v291 count:16];
          }

          while (v122);
        }

        goto LABEL_111;
      }

      v206 = (char *)xpc_data_get_bytes_ptr(v79);
      uint64_t v96 = v79;
    }

    else
    {
      v206 = 0LL;
    }

    uint64_t v111 = xpc_dictionary_get_value(v6, "ctime");
    uint64_t v112 = (char *)objc_claimAutoreleasedReturnValue(v111);
    uint64_t v113 = v30;
    aSelectora = v112;
    v180 = v96;
    if (v112)
    {
      if (xpc_get_type(v112) != (xpc_type_t)&_xpc_type_data)
      {
        v208 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -10LL,  @"Bad XPC request encoding (type)"));
        v241 = 0u;
        v242 = 0u;
        v243 = 0u;
        v244 = 0u;
        uint64_t v114 = v214;
        uint64_t v115 = [v114 countByEnumeratingWithState:&v241 objects:v290 count:16];
        if (v115)
        {
          uint64_t v116 = v115;
          uint64_t v117 = *(void *)v242;
          do
          {
            for (nn = 0LL; nn != v116; nn = (char *)nn + 1)
            {
              if (*(void *)v242 != v117) {
                objc_enumerationMutation(v114);
              }
              uint64_t v119 = *(void *)(*((void *)&v241 + 1) + 8LL * (void)nn);
              id v120 = (void *)objc_claimAutoreleasedReturnValue([v7 peerID]);
              -[GEOTileServer _receivedTile:error:info:forKey:forPeer:]( self,  "_receivedTile:error:info:forKey:forPeer:",  0LL,  v208,  0LL,  v119,  v120);
            }

            uint64_t v116 = [v114 countByEnumeratingWithState:&v241 objects:v290 count:16];
          }

          while (v116);
        }

LABEL_149:
        uint64_t v32 = connection;
        id v30 = message;
        xpc_connection_send_message(connection, message);
LABEL_174:

        id v26 = v212;
        id v28 = v215;
        uint64_t v79 = v180;
        goto LABEL_175;
      }

      v127 = xpc_data_get_length(aSelectora);
      if (v127 != 8 * (void)[v214 count])
      {
        v208 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -10LL,  @"Bad XPC request encoding (length)"));
        v237 = 0u;
        v238 = 0u;
        v239 = 0u;
        v240 = 0u;
        uint64_t v114 = v214;
        v151 = [v114 countByEnumeratingWithState:&v237 objects:v289 count:16];
        if (v151)
        {
          v152 = v151;
          v153 = *(void *)v238;
          do
          {
            for (i1 = 0LL; i1 != v152; i1 = (char *)i1 + 1)
            {
              if (*(void *)v238 != v153) {
                objc_enumerationMutation(v114);
              }
              v155 = *(void *)(*((void *)&v237 + 1) + 8LL * (void)i1);
              v156 = (void *)objc_claimAutoreleasedReturnValue([v7 peerID]);
              -[GEOTileServer _receivedTile:error:info:forKey:forPeer:]( self,  "_receivedTile:error:info:forKey:forPeer:",  0LL,  v208,  0LL,  v155,  v156);
            }

            v152 = [v114 countByEnumeratingWithState:&v237 objects:v289 count:16];
          }

          while (v152);
        }

        goto LABEL_149;
      }

      v205 = (char *)xpc_data_get_bytes_ptr(aSelectora);
    }

    else
    {
      v205 = 0LL;
    }

    uint64 = xpc_dictionary_get_uint64(v6, "reason");
    group = (dispatch_group_t)xpc_dictionary_get_int64(v6, "batch");
    v196 = (void *)objc_claimAutoreleasedReturnValue([v7 peerID]);
    v128 = (void *)objc_claimAutoreleasedReturnValue([v7 auditToken]);
    length[0] = 0LL;
    data = xpc_dictionary_get_data(v6, "__audit_token", length);
    if (data)
    {
      v130 = data;
      if ([v7 hasEntitlement:GEOAuditTokenOverrideEntitlement])
      {
        v131 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v130, length[0]));
        v133 = +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___GEOApplicationAuditToken, v132));
        v134 = (void *)objc_claimAutoreleasedReturnValue(v133);
        uint64_t v135 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v134,  v131,  0LL));

        if (v128)
        {
          uint64_t v136 = v135;

          v128 = v136;
        }
      }
    }

    v233 = 0u;
    v234 = 0u;
    v235 = 0u;
    v236 = 0u;
    id obj = v214;
    v203 = [obj countByEnumeratingWithState:&v233 objects:v288 count:16];
    v208 = v128;
    if (v203)
    {
      v137 = 0LL;
      v201 = *(void *)v234;
      do
      {
        for (i2 = 0LL; i2 != v203; i2 = (char *)i2 + 1)
        {
          if (*(void *)v234 != v201) {
            objc_enumerationMutation(obj);
          }
          v139 = *(void *)(*((void *)&v233 + 1) + 8LL * (void)i2);
          if ((sub_10001E3A0(v7, (uint64_t)v128, v139) & 1) == 0)
          {
            v199 = v137;
            uint64_t v140 = GEOGetTileLoadingLog();
            uint64_t v141 = (os_log_s *)objc_claimAutoreleasedReturnValue(v140);
            if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
            {
              v142 = GEOStringFromTileKey(v139);
              v143 = (void *)objc_claimAutoreleasedReturnValue(v142);
              LODWORD(length[0]) = 138543619;
              *(size_t *)((char *)length + 4) = (size_t)v7;
              WORD2(length[1]) = 2113;
              *(size_t *)((char *)&length[1] + 6) = (size_t)v143;
              _os_log_impl( (void *)&_mh_execute_header,  v141,  OS_LOG_TYPE_ERROR,  "%{public}@ is not allowed to load tile %{private}@",  (uint8_t *)length,  0x16u);
            }

            v144 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -5LL,  @"Peer is not allowed to load this tile type"));
            v145 = (void *)objc_claimAutoreleasedReturnValue([v7 peerID]);
            -[GEOTileServer _receivedTile:error:info:forKey:forPeer:]( self,  "_receivedTile:error:info:forKey:forPeer:",  0LL,  v144,  0LL,  v139,  v145);

            v137 = v199;
            if (!v199) {
              v137 = objc_alloc_init(&OBJC_CLASS___GEOTileKeyList);
            }
            [v137 addKey:v139];
            uint64_t v113 = message;
          }
        }

        v203 = [obj countByEnumeratingWithState:&v233 objects:v288 count:16];
      }

      while (v203);

      if (!v137)
      {
        v178 = 0LL;
LABEL_153:
        v157 = v7;
        v158 = (void *)objc_claimAutoreleasedReturnValue([v157 peerID]);
        v195 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%lli",  v158,  group));

        pendingPeerToClientIdentifiers = self->_pendingPeerToClientIdentifiers;
        if (!pendingPeerToClientIdentifiers)
        {
          v160 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionary]( &OBJC_CLASS___NSMutableDictionary,  "dictionary"));
          v161 = self->_pendingPeerToClientIdentifiers;
          self->_pendingPeerToClientIdentifiers = v160;

          pendingPeerToClientIdentifiers = self->_pendingPeerToClientIdentifiers;
        }

        v162 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( pendingPeerToClientIdentifiers,  "objectForKeyedSubscript:",  v196));
        v163 = v185;
        if (!v162)
        {
          v162 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pendingPeerToClientIdentifiers,  "setObject:forKeyedSubscript:",  v162,  v196);
        }

        v179 = v162;
        [v162 addObject:v195];
        groupa = dispatch_group_create();
        v225 = 0u;
        v226 = 0u;
        v227 = 0u;
        v228 = 0u;
        v186 = obj;
        v204 = [v186 countByEnumeratingWithState:&v225 objects:v285 count:16];
        if (v204)
        {
          v164 = 0;
          v189 = *(void *)v226;
          obja = (id)(v209 | 0x20);
          do
          {
            v165 = 0LL;
            v183 = v164;
            v166 = &v181[16 * v164];
            v200 = (uint64_t)v163 + 4 * v164;
            v202 = &v182[v164];
            v187 = &v205[8 * v164];
            v188 = &v206[8 * v164];
            do
            {
              if (*(void *)v226 != v189) {
                objc_enumerationMutation(v186);
              }
              *(_OWORD *)length = *(_OWORD *)*(void *)(*((void *)&v225 + 1) + 8LL * (void)v165);
              v167 = *((unsigned __int8 *)v165 + (void)v202);
              v224 = *(_OWORD *)v166;
              v210 = *(_DWORD *)(v200 + 4LL * (void)v165);
              if (v206) {
                v168 = *(void *)&v188[8 * (void)v165];
              }
              else {
                v168 = 0LL;
              }
              if (v205) {
                v169 = *(double *)&v187[8 * (void)v165];
              }
              else {
                v169 = 0.0;
              }
              dispatch_group_enter(groupa);
              if (v167) {
                v170 = &v224;
              }
              else {
                v170 = 0LL;
              }
              v171 = qos_class_self();
              queue = self->_queue;
              v281[0] = _NSConcreteStackBlock;
              v281[1] = 3221225472LL;
              v281[2] = sub_10002B1CC;
              v281[3] = &unk_10005A498;
              v284 = *(_OWORD *)length;
              v281[4] = self;
              v282 = v196;
              v283 = groupa;
              HIDWORD(v177) = v171;
              LOBYTE(v177) = uint64;
              objc_msgSend( v215,  "loadKey:additionalInfo:priority:forClient:auditToken:options:reason:qos:signpostID:createTime:callbackQ: beginNetwork:callback:",  length,  v170,  v210,  v195,  v128,  obja,  v169,  v177,  v168,  queue,  0,  v281);

              v165 = (char *)v165 + 1;
              v166 += 16;
              uint64_t v113 = message;
            }

            while (v204 != v165);
            v173 = [v186 countByEnumeratingWithState:&v225 objects:v285 count:16];
            v164 = v183 + (_DWORD)v165;
            v163 = v185;
            v204 = v173;
          }

          while (v173);
        }

        v174 = (dispatch_queue_s *)self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10002B2E8;
        block[3] = &unk_100059E40;
        void block[4] = self;
        v220 = v196;
        v221 = v195;
        v222 = connection;
        v223 = v113;
        v175 = v195;
        v176 = v196;
        dispatch_group_notify(groupa, v174, block);

        uint64_t v32 = connection;
        id v30 = message;
        goto LABEL_174;
      }

      v231 = 0u;
      v232 = 0u;
      v229 = 0u;
      v230 = 0u;
      __int128 v146 = v137;
      __int128 v147 = [v146 countByEnumeratingWithState:&v229 objects:v286 count:16];
      if (v147)
      {
        __int128 v148 = v147;
        __int128 v149 = *(void *)v230;
        do
        {
          for (i3 = 0LL; i3 != v148; i3 = (char *)i3 + 1)
          {
            if (*(void *)v230 != v149) {
              objc_enumerationMutation(v146);
            }
            [obj removeKey:*(void *)(*((void *)&v229 + 1) + 8 * (void)i3)];
          }

          __int128 v148 = [v146 countByEnumeratingWithState:&v229 objects:v286 count:16];
        }

        while (v148);
        v178 = v146;
        uint64_t v113 = message;
      }

      else
      {
        v178 = v146;
      }
    }

    else
    {
      v178 = 0LL;
      __int128 v146 = obj;
    }

    goto LABEL_153;
  }

void sub_10002B1CC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v10 = a1 + 56;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  if ((GEOTileKeyEquals(v10, a2) & 1) == 0)
  {
    uint64_t v14 = GEOStringFromTileKey(v10);
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = GEOStringFromTileKey(a2);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    NSLog(@"Asked to load key %@ and instead got back %@. See <rdar://problem/13307083>", v15, v17);
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:GEOTileLoadResultIsPreliminaryKey]);
  unsigned __int8 v19 = [v18 BOOLValue];

  [*(id *)(a1 + 32) _receivedTile:v13 error:v12 info:v11 forKey:a2 forPeer:*(void *)(a1 + 40)];
  if ((v19 & 1) == 0) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void sub_10002B2E8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  [v2 removeObject:*(void *)(a1 + 48)];

  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), *(xpc_object_t *)(a1 + 64));
}

id sub_10002B4C0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (xpc_dictionary_get_data(v4, "mcfg", 0LL)
    && ([v3 hasEntitlement:@"com.apple.geoservices.custom-manifest-configuration"] & 1) == 0)
  {
    uint64_t v12 = GEOGetTileLoadingLog();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
      int v16 = 138543362;
      uint64_t v17 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_FAULT,  "Un-entitled process %{public}@ is trying to set a custom manifest configuration",  (uint8_t *)&v16,  0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[GEOTileLoader modernLoaderForResourceManifestConfiguration:locale:]( &OBJC_CLASS___GEOTileLoader,  "modernLoaderForResourceManifestConfiguration:locale:",  0LL,  0LL));
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___GEOResourceManifestConfiguration, v5);
    uint64_t v7 = GEODecodeXPCValue(v4, "mcfg", v6, 0LL);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = sub_10002990C(v4);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[GEOTileLoader modernLoaderForResourceManifestConfiguration:locale:]( &OBJC_CLASS___GEOTileLoader,  "modernLoaderForResourceManifestConfiguration:locale:",  v8,  v10));
  }

  return v11;
}

void sub_10002B970(uint64_t a1, uint64_t value)
{
}

void sub_10002BD48(uint64_t a1, uint64_t value)
{
}

LABEL_25:
}

    return;
  }

  if (![v7 count])
  {
    __int128 v48 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
    __int128 v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      __int128 v50 = NSStringFromSelector(*(SEL *)(a1 + 96));
      __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v51;
      _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "No use running %{public}@ without any MUIDs.",  buf,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 80) + 16LL))();
    return;
  }

  v75 = v3;
  v76 = v6;
  id v77 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 48) + 40) identifiersRequested:*(void *)(a1 + 32) forHandler:*(void *)(a1 + 80)]);
  uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableOrderedSet orderedSetWithArray:]( &OBJC_CLASS___NSMutableOrderedSet,  "orderedSetWithArray:",  *(void *)(a1 + 32)));
  uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [*(id *)(a1 + 32) count]));
  [v78 minusSet:v77];
  id v21 = &OBJC_CLASS___NSMutableOrderedSet;
  uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableOrderedSet orderedSetWithCapacity:]( NSMutableOrderedSet,  "orderedSetWithCapacity:",  [v78 count]));
  if (!BOOL)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](&OBJC_CLASS___GEOPlatform, "sharedPlatform"));
    if (![v21 isInternalInstall])
    {
      uint64_t v84 = 0LL;
LABEL_64:
      id v46 = v83;
      __int128 v47 = v76;

      [v83 unionOrderedSet:v78];
LABEL_65:
      [v46 minusSet:v77];
      if (v47 && [v83 count])
      {
        id v52 = DefaultLoggingSubsystem;
        id v53 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
        uint64_t v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138477827;
          *(void *)&uint8_t buf[4] = v83;
          _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEBUG,  "Missing Identifiers: %{private}@",  buf,  0xCu);
        }

        uint64_t v55 = GEOFindOrCreateLog(v52, "GEOPlaceDataLocalProxy");
        int v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138477827;
          *(void *)&uint8_t buf[4] = v77;
          _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEBUG,  "Requests in progress: %{private}@",  buf,  0xCu);
        }

        __int16 v57 = (void *)objc_claimAutoreleasedReturnValue([v83 array]);
        id v58 = *(unsigned int *)(a1 + 104);
        id v60 = *(void *)(a1 + 40);
        __int16 v59 = *(void **)(a1 + 48);
        uint64_t v62 = *(void *)(a1 + 56);
        v61 = *(void *)(a1 + 64);
        uint64_t v63 = *(void *)(a1 + 72);
        v87[0] = _NSConcreteStackBlock;
        v87[1] = 3221225472LL;
        v87[2] = sub_10003650C;
        v87[3] = &unk_10005AA58;
        v87[4] = v59;
        uint64_t v90 = v75;
        uint64_t v84 = v84;
        v85[0] = _NSConcreteStackBlock;
        uint64_t v88 = v84;
        uint64_t v89 = v57;
        v85[1] = 3221225472LL;
        v85[2] = sub_1000368DC;
        v85[3] = &unk_10005AA08;
        v85[4] = *(void *)(a1 + 48);
        uint64_t v86 = v83;
        uint64_t v64 = v57;
        [v59 _requestIdentifiersFromNetwork:v64 resultProviderID:v58 requestUUID:v61 traits:v60 auditToken:v62 throttleToken:v63 finished:v87 error:v85];
      }

      else
      {
        uint64_t v65 = *(void **)(*(void *)(a1 + 48) + 40LL);
        uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v83 set]);
        [v65 failedToResolveIdentifiers:v66 withError:0];

        [*(id *)(a1 + 48) _resetRequestTimeout];
      }

      goto LABEL_73;
    }
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[GEOPDPlaceRequest createRequestedComponentsForReason:traits:count:]( &OBJC_CLASS___GEOPDPlaceRequest,  "createRequestedComponentsForReason:traits:count:",  0LL,  *(void *)(a1 + 40),  1LL));
  uint64_t v84 = (id)objc_claimAutoreleasedReturnValue( +[GEOPDPlace componentTypesFromComponentInfos:]( &OBJC_CLASS___GEOPDPlace,  "componentTypesFromComponentInfos:",  v22));

  if (!BOOL) {
    goto LABEL_64;
  }
  uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v78 count]));
  uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v78 count]));
  uint64_t v105 = 0u;
  uint64_t v106 = 0u;
  uint64_t v103 = 0u;
  uint64_t v104 = 0u;
  id obj = v78;
  id v23 = [obj countByEnumeratingWithState:&v103 objects:v111 count:16];
  if (!v23) {
    goto LABEL_51;
  }
  id v24 = *(void *)v104;
  do
  {
    for (i = 0LL; i != v23; i = (char *)i + 1)
    {
      if (*(void *)v104 != v24) {
        objc_enumerationMutation(obj);
      }
      id v26 = *(void *)(*((void *)&v103 + 1) + 8LL * (void)i);
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000LL;
      uint64_t v108 = sub_100034C88;
      uint64_t v109 = sub_100034C98;
      uint64_t v110 = 0LL;
      uint64_t v100 = 0LL;
      uint64_t v101 = &v100;
      uint64_t v102 = 0x2020000000LL;
      uint64_t v97 = 0LL;
      uint64_t v98 = &v97;
      uint64_t v99 = 0x2020000000LL;
      id v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) pdPlaceCache]);
      v96[0] = _NSConcreteStackBlock;
      v96[1] = 3221225472LL;
      v96[2] = sub_100036190;
      v96[3] = &unk_100059548;
      v96[4] = buf;
      v96[5] = &v100;
      v96[6] = &v97;
      [v27 lookupPlaceByIdentifier:v26 allowExpired:v5 resultBlock:v96];

      id v28 = *(void **)(*(void *)&buf[8] + 40LL);
      if (v28)
      {
        id v29 = [v28 hasExpectedComponentTypes:v84];
        if (*((_BYTE *)v101 + 24)) {
          id v30 = 0;
        }
        else {
          id v30 = v29;
        }
        if ((v30 & 1) != 0)
        {
          id v31 = 1LL;
LABEL_47:
          [*(id *)(a1 + 48) registerCacheResult:v31 forMapItem:v26 cachedByteCount:v98[3] forRequestType:23 auditToken:*(void *)(a1 + 56)];
          [v81 addObject:v26];
          [v80 addObject:*(void *)(*(void *)&buf[8] + 40)];
          goto LABEL_49;
        }

        if ((_DWORD)v5) {
          uint64_t v32 = v29;
        }
        else {
          uint64_t v32 = 0;
        }
        if (v32 == 1)
        {
          [v79 addObject:v26];
          id v31 = 3LL;
          goto LABEL_47;
        }
      }

      [v83 addObject:v26];
      [*(id *)(a1 + 48) registerCacheResult:2 forMapItem:v26 cachedByteCount:v98[3] forRequestType:23 auditToken:*(void *)(a1 + 56)];
LABEL_49:
      _Block_object_dispose(&v97, 8);
      _Block_object_dispose(&v100, 8);
      _Block_object_dispose(buf, 8);
    }

    id v23 = [obj countByEnumeratingWithState:&v103 objects:v111 count:16];
  }

  while (v23);
LABEL_51:

  [*(id *)(*(void *)(a1 + 48) + 40) didResolveItems:v80 forIdentifiers:v81];
  if ([v79 count]) {
    __int128 v33 = v76 == 0;
  }
  else {
    __int128 v33 = 1;
  }
  if (!v33)
  {
    [*(id *)(*(void *)(a1 + 48) + 40) willUpdateExpiredIdentifiers:v79];
    id v34 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
    __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      *(void *)&uint8_t buf[4] = v79;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Expired Identifiers: %{private}@", buf, 0xCu);
    }

    id v36 = (void *)objc_claimAutoreleasedReturnValue([v79 allObjects]);
    id v37 = *(unsigned int *)(a1 + 104);
    id v39 = *(void *)(a1 + 40);
    id v38 = *(void **)(a1 + 48);
    id v40 = *(void *)(a1 + 56);
    id v41 = *(void *)(a1 + 64);
    id v42 = *(void *)(a1 + 72);
    v93[0] = _NSConcreteStackBlock;
    v93[1] = 3221225472LL;
    v93[2] = sub_1000361EC;
    v93[3] = &unk_10005A9E0;
    uint64_t v95 = v75;
    v93[4] = v38;
    uint64_t v94 = v36;
    v91[0] = _NSConcreteStackBlock;
    v91[1] = 3221225472LL;
    v91[2] = sub_1000363B0;
    v91[3] = &unk_10005AA08;
    v91[4] = v38;
    uint64_t v92 = v79;
    char v43 = v36;
    [v38 _requestIdentifiersFromNetwork:v43 resultProviderID:v37 requestUUID:v41 traits:v39 auditToken:v40 throttleToken:v42 finished:v93 error:v91];
  }

  id v44 = (char *)[v80 count];
  id v45 = [v83 count];
  if (&v44[(void)v45] == [obj count])
  {

    id v46 = v83;
    __int128 v47 = v76;
    goto LABEL_65;
  }

  uint64_t v67 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
  if (v67) {
    sub_10003AFA4(v67, v68, v69, v70, v71, v72, v73, v74);
  }

LABEL_73:
}

BOOL sub_10002C980(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, double a7)
{
  id v13 = a5;
  id v14 = a3;
  id v15 = objc_alloc_init(&OBJC_CLASS___GEOTileEnumeration);
  int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a2, 16LL));
  [v15 setKey:v16];

  if (*(_BYTE *)(a1 + 40)) {
    id v17 = v14;
  }
  else {
    id v17 = 0LL;
  }
  [v15 setData:v17];

  [v15 setCurrent:a4];
  [v15 setETag:v13];

  [v15 setOriginalLoadReason:a6];
  [v15 setAge:a7];
  xpc_object_t v18 = xpc_dictionary_create(0LL, 0LL, 0LL);
  [v15 encodeToXPCDictionary:v18];
  xpc_object_t v19 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 32), v18);
  BOOL v20 = xpc_get_type(v19) == (xpc_type_t)&_xpc_type_dictionary && xpc_dictionary_get_BOOL(v19, "cont");

  return v20;
}

void sub_10002CADC(uint64_t a1)
{
}

void sub_10002CC00(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS____GEOImageServiceRequestConfig);
  uint64_t v2 = (void *)qword_10006B058;
  qword_10006B058 = (uint64_t)v1;
}

void sub_10002CC84(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___GEOImageServiceServerRequester);
  uint64_t v2 = (void *)qword_10006B060;
  qword_10006B060 = (uint64_t)v1;
}

void sub_10002CDEC(void *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = a1[4];
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0LL);
  }
  if (v10)
  {
    uint64_t v7 = a1[5];
    if (v7)
    {
      uint64_t v8 = *(void (**)(void))(v7 + 16);
LABEL_8:
      v8();
    }
  }

  else
  {
    uint64_t v9 = a1[6];
    if (v9)
    {
      uint64_t v8 = *(void (**)(void))(v9 + 16);
      goto LABEL_8;
    }
  }
}

void sub_10002D11C(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:&stru_10005CC38];
  [*(id *)(*(void *)(a1 + 32) + 56) addObject:*(void *)(a1 + 40)];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectForKeyedSubscript:v6]);
  if (!v5)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet"));
    [*(id *)(a1 + 48) setObject:v5 forKeyedSubscript:v6];
  }

  [v5 addIndex:a3];
}

id sub_10002D344(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) filename]);
  [*(id *)(*(void *)(a1 + 32) + 48) setObject:v4 atIndexedSubscript:a2];

  return [*(id *)(*(void *)(a1 + 32) + 56) setObject:*(void *)(a1 + 48) atIndexedSubscript:a2];
}

id sub_10002D55C()
{
  if (qword_10006B078 != -1) {
    dispatch_once(&qword_10006B078, &stru_10005A720);
  }
  return (id)qword_10006B070;
}

uint64_t sub_10002D7FC(void *a1)
{
  uint64_t v2 = a1[7];
  if (a1[4])
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = 0LL;
  }

  else
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v2, v3, v4);
}

id sub_10002DA88(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchResources:*(void *)(a1 + 40) force:*(unsigned __int8 *)(a1 + 88) unpack:*(unsigned __int8 *)(a1 + 89) manifestConfiguration:*(void *)(a1 + 48) auditToken:*(void *)(a1 + 56) signpostID:*(void *)(a1 + 80) queue:*(void *)(a1 + 64) handler:*(void *)(a1 + 72)];
}

uint64_t sub_10002E0D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10002E360(_Unwind_Exception *a1)
{
}

void sub_10002E380(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) removeObject:WeakRetained];
  }

  else
  {
    BOOL v22 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v22) {
      sub_10003AF08(v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }

  if (!v6)
  {
    id v8 = [v5 count];
    if (v8 == [*(id *)(a1 + 40) count])
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", *(void *)(a1 + 48)));
      id v10 = *(void **)(a1 + 40);
      id v30 = _NSConcreteStackBlock;
      uint64_t v31 = 3221225472LL;
      uint64_t v32 = sub_10002E65C;
      __int128 v33 = &unk_10005A618;
      id v11 = v9;
      id v34 = v11;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_geo_compactMap:", &v30));
      id v13 = [v12 count];
      if (v13 == [*(id *)(a1 + 40) count])
      {
        [*(id *)(a1 + 32) didResolvePaths:v12 forResources:*(void *)(a1 + 40)];
        id v6 = 0LL;
      }

      else
      {
        id v17 = [*(id *)(a1 + 40) count];
        int64_t v18 = v17 - (_BYTE *)[v12 count];
        xpc_object_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unable to resolve name for %d resources",  v18,  v30,  v31,  v32,  v33));
        id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:reason:](&OBJC_CLASS___NSError, "GEOErrorWithCode:reason:", -11LL, v19));

        id v20 = sub_10002D55C();
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v36 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Couldn't get name for %d resources",  buf,  8u);
        }

        [*(id *)(a1 + 32) failedToResolveResources:*(void *)(a1 + 40) withError:v6];
      }

      goto LABEL_11;
    }

    id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -11LL,  @"loadedResources.count != input remaining.count"));
  }

  id v14 = sub_10002D55C();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    unsigned int v16 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 67109376;
    unsigned int v36 = v16;
    __int16 v37 = 1024;
    unsigned int v38 = [v5 count];
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Requested %d resources, got %d resources",  buf,  0xEu);
  }

  [*(id *)(a1 + 32) failedToResolveResources:*(void *)(a1 + 40) withError:v6];
LABEL_11:
}

id sub_10002E65C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 filename]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:v3 isDirectory:0]);

  return v4;
}

id sub_10002E724(uint64_t a1)
{
  uint64_t v2 = *(dispatch_source_t **)(a1 + 32);
  if (v2[3])
  {
    dispatch_source_set_timer(v2[3], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_source_set_event_handler(*(dispatch_source_t *)(*(void *)(a1 + 32) + 24LL), &stru_10005A660);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = 0LL;

    uint64_t v2 = *(dispatch_source_t **)(a1 + 32);
  }

  return -[dispatch_source_t _failAllPendingRequests](v2, "_failAllPendingRequests");
}

void sub_10002EC7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

id sub_10002ECA4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id result = [a2 wantsUnpacked:*(void *)(a1 + 32)];
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

void sub_10002ECE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 finishedResource:*(void *)(a1 + 32) withResult:*(void *)(a1 + 40) error:*(void *)(a1 + 48)]) {
    [*(id *)(a1 + 56) addObject:v3];
  }
}

void sub_10002EFF4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v9 = (id)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:a3]);
  uint64_t v7 = *(void **)(a1 + 40);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) _finished:v9 withResult:v6 error:0]);

  [v7 addObjectsFromArray:v8];
}

void sub_10002F6F0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _failAllPendingRequests];
}

void sub_10002F764(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GeoServices", "ResourceRequester");
  uint64_t v2 = (void *)qword_10006B070;
  qword_10006B070 = (uint64_t)v1;
}

id sub_10002F794()
{
  if (qword_10006B088 != -1) {
    dispatch_once(&qword_10006B088, &stru_10005A740);
  }
  return (id)qword_10006B080;
}

void sub_10002F7D4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GeoServices", "GEODirectionsRequesterServerLocalProxy");
  uint64_t v2 = (void *)qword_10006B080;
  qword_10006B080 = (uint64_t)v1;
}

void sub_10002FFE4(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[4];
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0LL);
  }
  if (v5)
  {
    id v8 = v5;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[GEOExperimentConfiguration sharedConfiguration]( &OBJC_CLASS___GEOExperimentConfiguration,  "sharedConfiguration"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 datasetAbStatus]);
    [v9 refreshDatasetABStatus:v10];

    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routes", 0));
    id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        id v15 = 0LL;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * (void)v15) unpackLatLngVertices];
          id v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v13);
    }

    uint64_t v16 = a1[5];
    if (v16) {
      (*(void (**)(uint64_t, id))(v16 + 16))(v16, v8);
    }
    goto LABEL_15;
  }

  if (a1[6])
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_geo_directionsErrorInfo"));
    (*(void (**)(void))(a1[6] + 16LL))();
LABEL_15:
  }
}

id sub_10003079C(uint64_t a1)
{
  return [*(id *)(a1 + 40) setTaskCompleted];
}

void sub_100030824(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEONetworkObserver sharedNetworkObserver](&OBJC_CLASS___GEONetworkObserver, "sharedNetworkObserver"));
  unsigned int v3 = [v2 isNetworkConstrained];

  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 32LL);
  if (v3)
  {
    if (!v4)
    {
      if (GEOConfigGetBOOL( GeoServicesConfig_ConstrainedNetworkManifestAssertionEnabled[0],  GeoServicesConfig_ConstrainedNetworkManifestAssertionEnabled[1]))
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue( +[GEOResourceManifestUpdateAssertionRegistry sharedRegistry]( &OBJC_CLASS___GEOResourceManifestUpdateAssertionRegistry,  "sharedRegistry"));
        uint64_t v5 = objc_claimAutoreleasedReturnValue([v11 addInternalAssertionForReason:@"constrained-network"]);
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v7 = *(void **)(v6 + 32);
        *(void *)(v6 + 32) = v5;
      }
    }
  }

  else if (v4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[GEOResourceManifestUpdateAssertionRegistry sharedRegistry]( &OBJC_CLASS___GEOResourceManifestUpdateAssertionRegistry,  "sharedRegistry"));
    [v8 removeAssertion:*(void *)(*(void *)(a1 + 32) + 32)];

    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 32);
    *(void *)(v9 + 32) = 0LL;
  }

void sub_1000309CC(uint64_t a1)
{
  id v4 = objc_alloc_init(&OBJC_CLASS___GEOResourceManifestConfiguration);
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:v4];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](&OBJC_CLASS___GEOResourceManifestManager, "modernManager"));
  [v2 addServerProxyObserver:*(void *)(a1 + 32)];

  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](&OBJC_CLASS___GEOResourceManifestManager, "modernManager"));
  [v3 openServerConnection];
}

id sub_100030ACC()
{
  return (id)_CFXPCCreateXPCObjectFromCFObject();
}

void sub_100030B8C(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___GEOResourceManifestConfiguration);
  uint64_t v2 = (void *)qword_10006B0A0;
  qword_10006B0A0 = (uint64_t)v1;
}

void sub_1000310B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary _geo_replyDictionaryForError:key:]( &OBJC_CLASS___NSDictionary,  "_geo_replyDictionaryForError:key:",  a2,  @"err"));
  [v2 sendReply:v3];
}

void sub_1000311C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary _geo_replyDictionaryForError:key:]( &OBJC_CLASS___NSDictionary,  "_geo_replyDictionaryForError:key:",  a2,  @"err"));
  [v2 sendReply:v3];
}

void sub_100031318(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary _geo_replyDictionaryForError:key:]( &OBJC_CLASS___NSDictionary,  "_geo_replyDictionaryForError:key:",  a2,  @"err"));
  [v2 sendReply:v3];
}

void sub_1000314C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary _geo_replyDictionaryForError:key:]( &OBJC_CLASS___NSDictionary,  "_geo_replyDictionaryForError:key:",  a2,  @"err"));
  [v2 sendReply:v3];
}

void sub_100031A3C(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v10 data]);
    -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v7, @"manifestData");

    id v8 = *(void **)(a1 + 32);
LABEL_5:
    [v8 sendReply:v6];

    goto LABEL_6;
  }

  if (v5)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary _geo_replyDictionaryForError:key:]( &OBJC_CLASS___NSDictionary,  "_geo_replyDictionaryForError:key:",  v5,  @"err"));
    id v8 = v9;
    goto LABEL_5;
  }

void sub_100031D94(id *a1)
{
  uint64_t v58 = 0LL;
  __int16 v59 = &v58;
  uint64_t v60 = 0x3032000000LL;
  v61 = sub_1000322A8;
  uint64_t v62 = sub_1000322D0;
  id v63 = 0LL;
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_1000322D8;
  v55[3] = &unk_1000595E8;
  id v56 = a1[4];
  id v57 = a1[7];
  uint64_t v2 = objc_retainBlock(v55);
  id v3 = (void *)v59[5];
  v59[5] = (uint64_t)v2;

  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v5 = a1[5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1[4] configuration]);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_100032348;
  v53[3] = &unk_10005A7B0;
  uint64_t v29 = v4;
  uint64_t v54 = v29;
  [v5 _forEachPeerMatchingConfiguration:v6 perform:v53];

  if (-[NSMutableSet count](v29, "count"))
  {
    uint64_t v7 = objc_alloc(&OBJC_CLASS___NSDictionary);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([a1[6] data]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v8,  @"activeTileGroupData"));
    uint64_t v26 = -[NSDictionary initWithObjectsAndKeys:]( v7,  "initWithObjectsAndKeys:",  @"resourcemanifest.didChangeActiveTileGroup",  @"message",  v9,  @"userInfo",  0LL);

    uint64_t v28 = (void *)_CFXPCCreateXPCObjectFromCFObject(v26);
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    id v10 = -[NSMutableSet copy](v29, "copy");
    id v11 = [v10 countByEnumeratingWithState:&v49 objects:v64 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v50;
      double v13 = GEO_DISPATCH_TIME_FOREVER;
      id obj = v10;
      do
      {
        uint64_t v14 = 0LL;
        do
        {
          if (*(void *)v50 != v12) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)v14);
          v47[0] = 0LL;
          v47[1] = v47;
          v47[2] = 0x2020000000LL;
          char v48 = 0;
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472LL;
          v42[2] = sub_100032354;
          v42[3] = &unk_10005A7D8;
          id v45 = v47;
          char v43 = v29;
          id v44 = v15;
          id v46 = &v58;
          uint64_t v16 = objc_retainBlock(v42);
          uint64_t v36 = 0LL;
          __int16 v37 = &v36;
          uint64_t v38 = 0x3032000000LL;
          id v39 = sub_1000323E0;
          id v40 = sub_1000323F0;
          id v41 = 0LL;
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([a1[5] daemon]);
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 serverQueue]);
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472LL;
          v33[2] = sub_1000323F8;
          v33[3] = &unk_100059610;
          __int128 v19 = v16;
          id v34 = v19;
          __int128 v35 = &v36;
          uint64_t v20 = geo_dispatch_timer_create_on_queue(v18, v33, 10.0, v13, 1.0);
          id v21 = (void *)v37[5];
          v37[5] = v20;

          dispatch_activate((dispatch_object_t)v37[5]);
          BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v15 connection]);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([a1[5] daemon]);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 serverQueue]);
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472LL;
          v30[2] = sub_100032460;
          v30[3] = &unk_10005A800;
          uint64_t v25 = v19;
          id v31 = v25;
          uint64_t v32 = &v36;
          [v22 sendMessage:v28 withReply:v24 handler:v30];

          _Block_object_dispose(&v36, 8);
          _Block_object_dispose(v47, 8);
          uint64_t v14 = (char *)v14 + 1;
        }

        while (v11 != v14);
        id v10 = obj;
        id v11 = [obj countByEnumeratingWithState:&v49 objects:v64 count:16];
      }

      while (v11);
    }
  }

  else
  {
    (*(void (**)(void))(v59[5] + 16))();
  }

  _Block_object_dispose(&v58, 8);
}

void sub_10003224C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

id sub_1000322A8(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_1000322D0(uint64_t a1)
{
}

uint64_t sub_1000322D8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) configuration]);
  uint64_t v3 = GEOActiveTileGroupChangedInternalDarwinNotificationName();
  id v4 = objc_claimAutoreleasedReturnValue(v3);
  notify_post((const char *)[v4 UTF8String]);

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
  return notify_post(GEOActiveTileGroupChangedNotification);
}

id sub_100032348(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_100032354(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 48) + 8LL);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
    {
      if (![*(id *)(a1 + 32) count])
      {
        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) + 16LL))();
        uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8LL);
        id v4 = *(void **)(v3 + 40);
        *(void *)(v3 + 40) = 0LL;
      }
    }
  }

uint64_t sub_1000323E0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000323F0(uint64_t a1)
{
}

void sub_1000323F8(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  objc_autoreleasePoolPop(v2);
  uint64_t v3 = *(dispatch_source_s **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0LL;
  }

void sub_100032460(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  objc_autoreleasePoolPop(v3);
  uint64_t v4 = *(dispatch_source_s **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (v4)
  {
    dispatch_source_cancel(v4);
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0LL;
  }
}

void *sub_1000327BC()
{
  return &__NSArray0__struct;
}

void sub_1000327D8()
{
  if (sub_100017C50(0LL))
  {
    id v0 = [sub_100017D6C() sharedScheduler];
    id v1 = (id)objc_claimAutoreleasedReturnValue(v0);
    [v1 registerForTaskWithIdentifier:@"com.apple.geod.telemetry.daily" usingQueue:0 launchHandler:&stru_10005A868];
  }

void sub_100032838(id a1, BGSystemTask *a2)
{
}

void sub_10003284C(uint64_t a1, uint64_t a2, void *a3)
{
  id v17 = a3;
  uint64_t v5 = objc_opt_self(a1);
  id v6 = sub_100032A94();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v29 = a2;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Generating telemetry for type: %llu", buf, 0xCu);
  }

  id v8 = dispatch_group_create();
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  objc_opt_self(v5);
  id v9 = [&__NSArray0__struct countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(&__NSArray0__struct);
        }
        double v13 = *(objc_class **)(*((void *)&v23 + 1) + 8LL * (void)v12);
        dispatch_group_enter(v8);
        id v14 = objc_alloc_init(v13);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_100032AD4;
        v21[3] = &unk_100059168;
        BOOL v22 = v8;
        [v14 reportTelemetryForType:a2 completionHandler:v21];

        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [&__NSArray0__struct countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v10);
  }

  global_queue = (dispatch_queue_s *)geo_get_global_queue(5LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100032ADC;
  block[3] = &unk_1000597E8;
  id v19 = v17;
  uint64_t v20 = a2;
  id v16 = v17;
  dispatch_group_notify(v8, global_queue, block);
}

id sub_100032A94()
{
  if (qword_10006B0B0 != -1) {
    dispatch_once(&qword_10006B0B0, &stru_10005A888);
  }
  return (id)qword_10006B0A8;
}

void sub_100032AD4(uint64_t a1)
{
}

id sub_100032ADC(uint64_t a1)
{
  id v2 = sub_100032A94();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 134217984;
    uint64_t v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Finished generating telemetry for type: %llu",  (uint8_t *)&v6,  0xCu);
  }

  return [*(id *)(a1 + 32) setTaskCompleted];
}

void sub_100032B88(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GeoServices", "PeriodicTelemetry");
  id v2 = (void *)qword_10006B0A8;
  qword_10006B0A8 = (uint64_t)v1;
}

void sub_100032DB8(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[GEOPDPlace failedPlaceDataForMuid:]( GEOPDPlace,  "failedPlaceDataForMuid:",  [v7 muid]));
  [*(id *)(*(void *)(a1 + 32) + 32) addObject:v5];
  int v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v7]);
  if (!v6)
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet"));
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
  }

  [v6 addIndex:a3];
}

id sub_100033034(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setObject:*(void *)(a1 + 40) atIndexedSubscript:a2];
}

id sub_100033044(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(&OBJC_CLASS___GEOPDPlaceResponse);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "_geo_map:", &stru_10005ABB0));

  id v4 = [v3 mutableCopy];
  [v2 setMapsResults:v4];

  return v2;
}

void sub_100033768(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 finishedIdentifier:*(void *)(a1 + 32) withResult:*(void *)(a1 + 40) error:*(void *)(a1 + 48)]) {
    [*(id *)(a1 + 56) addObject:v3];
  }
}

void sub_100033C2C(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 64))
  {
    int v6 = *(void **)(a1 + 32);
    id v7 = a3;
  }

  else
  {
    id v11 = [[GEOMapItemIdentifier alloc] initWithPlace:v13];
    id v12 = [v5 indexOfObject:v11];

    if (v12 == (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_4;
    }
    [*(id *)(a1 + 40) addIndex:v12];
    int v6 = *(void **)(a1 + 32);
    id v7 = v12;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v7]);
  id v9 = *(void **)(a1 + 48);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) _finished:v8 withResult:v13 error:0]);
  [v9 addObjectsFromArray:v10];

LABEL_4:
}

void sub_100034184(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)qword_10006B0B8;
  qword_10006B0B8 = (uint64_t)v1;
}

id sub_100034674(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) _failAllPendingRequests];
}

void sub_1000346D8(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 56LL)) {
    goto LABEL_3;
  }
  global_queue = (dispatch_queue_s *)geo_get_global_queue(17LL);
  dispatch_source_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, global_queue);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v3;

  dispatch_source_set_timer( *(dispatch_source_t *)(*(void *)(a1 + 32) + 56LL),  0xFFFFFFFFFFFFFFFFLL,  0xFFFFFFFFFFFFFFFFLL,  0LL);
  objc_initWeak(&location, *(id *)(a1 + 32));
  int v6 = *(dispatch_source_s **)(*(void *)(a1 + 32) + 56LL);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100034838;
  v10[3] = &unk_10005A700;
  objc_copyWeak(&v11, &location);
  dispatch_source_set_event_handler(v6, v10);
  dispatch_activate(*(dispatch_object_t *)(*(void *)(a1 + 32) + 56LL));
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  if (*(void *)(*(void *)(a1 + 32) + 56LL))
  {
LABEL_3:
    double v7 = GEODataRequestTimeout(0x1700000300LL);
    id v8 = *(dispatch_source_s **)(*(void *)(a1 + 32) + 56LL);
    dispatch_time_t v9 = dispatch_time(0LL, (uint64_t)(v7 * 3.0 * 0.5 * 1000000000.0));
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 1uLL);
  }

void sub_100034838(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cleanupPendingRequestMananger];
}

id sub_100034A28(void *a1)
{
  return [*(id *)(a1[4] + 24) setObject:a1[7] forKeyedSubscript:a1[5]];
}

void sub_100034A60(void *a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = a1[4];
  double v7 = (void *)a1[5];
  uint64_t v8 = *(void *)(v6 + 8);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  _DWORD v13[2] = sub_100034B28;
  v13[3] = &unk_100059520;
  void v13[4] = v6;
  id v14 = v7;
  geo_reentrant_isolate_sync_data(v8, v13);
  if (v5)
  {
    uint64_t v9 = a1[6];
    if (v9)
    {
      id v10 = *(void (**)(void))(v9 + 16);
LABEL_6:
      v10();
    }
  }

  else
  {
    uint64_t v11 = a1[7];
    if (v11)
    {
      id v10 = *(void (**)(void))(v11 + 16);
      goto LABEL_6;
    }
  }
}

id sub_100034B28(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_100034C64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100034C88(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100034C98(uint64_t a1)
{
}

id sub_100034CA0(void *a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 16) objectForKey:a1[5]]);
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 24) objectForKey:a1[5]]);
  uint64_t v6 = *(void *)(a1[7] + 8LL);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(a1[4] + 16) removeObjectForKey:a1[5]];
  return [*(id *)(a1[4] + 24) removeObjectForKey:a1[5]];
}

void sub_100034D18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](&OBJC_CLASS___GEOPlatform, "sharedPlatform"));
    if (![v7 isInternalInstall])
    {
LABEL_112:

      goto LABEL_113;
    }

    id v8 = [v6 count];

    if (v8)
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 calculateMissingComponentTypes:v6]);
      if ([v7 count])
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        uint64_t v20 = v7;
        id v10 = v7;
        id v11 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v22;
          do
          {
            for (i = 0LL; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)i) intValue];
              id v16 = @"COMPONENT_TYPE_UNKNOWN";
              switch((int)v15)
              {
                case 0:
                  break;
                case 1:
                  id v16 = @"COMPONENT_TYPE_ENTITY";
                  break;
                case 2:
                  id v16 = @"COMPONENT_TYPE_PLACE_INFO";
                  break;
                case 3:
                  id v16 = @"COMPONENT_TYPE_ROAD_ACCESS_INFO";
                  break;
                case 4:
                  id v16 = @"COMPONENT_TYPE_BOUNDS";
                  break;
                case 5:
                  id v16 = @"COMPONENT_TYPE_ADDRESS";
                  break;
                case 6:
                  id v16 = @"COMPONENT_TYPE_RATING";
                  break;
                case 7:
                  id v16 = @"COMPONENT_TYPE_REVIEW";
                  break;
                case 8:
                  id v16 = @"COMPONENT_TYPE_PHOTO";
                  break;
                case 9:
                  id v16 = @"COMPONENT_TYPE_HOURS";
                  break;
                case 10:
                  id v16 = @"COMPONENT_TYPE_TRANSIT_INFO";
                  break;
                case 11:
                  id v16 = @"COMPONENT_TYPE_TRANSIT_SCHEDULE";
                  break;
                case 12:
                  id v16 = @"COMPONENT_TYPE_ETA";
                  break;
                case 13:
                  id v16 = @"COMPONENT_TYPE_FLYOVER";
                  break;
                case 14:
                  id v16 = @"COMPONENT_TYPE_RAW_ATTRIBUTE";
                  break;
                case 15:
                  id v16 = @"COMPONENT_TYPE_AMENITIES";
                  break;
                case 16:
                  id v16 = @"COMPONENT_TYPE_STYLE_ATTRIBUTES";
                  break;
                case 20:
                  id v16 = @"COMPONENT_TYPE_TRANSIT_INCIDENT";
                  break;
                case 21:
                  id v16 = @"COMPONENT_TYPE_TRANSIT_ASSOCIATED_INFO";
                  break;
                case 22:
                  id v16 = @"COMPONENT_TYPE_TEXT_BLOCK";
                  break;
                case 23:
                  id v16 = @"COMPONENT_TYPE_FACTOID";
                  break;
                case 24:
                  id v16 = @"COMPONENT_TYPE_TRANSIT_ATTRIBUTION";
                  break;
                case 25:
                  id v16 = @"COMPONENT_TYPE_BUSINESS_CLAIM";
                  break;
                case 26:
                  id v16 = @"COMPONENT_TYPE_CAPTIONED_PHOTO";
                  break;
                case 27:
                  id v16 = @"COMPONENT_TYPE_TRANSIT_INFO_SNIPPET";
                  break;
                case 29:
                  id v16 = @"COMPONENT_TYPE_EXTERNAL_ACTION";
                  break;
                case 30:
                  id v16 = @"COMPONENT_TYPE_RESULT_SNIPPET";
                  break;
                case 31:
                  id v16 = @"COMPONENT_TYPE_ADDRESS_OBJECT";
                  break;
                case 32:
                  id v16 = @"COMPONENT_TYPE_SIMPLE_RESTAURANT_MENU_TEXT";
                  break;
                case 33:
                  id v16 = @"COMPONENT_TYPE_RESTAURANT_RESERVATION_LINK";
                  break;
                case 34:
                  id v16 = @"COMPONENT_TYPE_SPATIAL_LOOKUP_RESULT";
                  break;
                case 36:
                  id v16 = @"COMPONENT_TYPE_TIP";
                  break;
                case 37:
                  id v16 = @"COMPONENT_TYPE_PLACECARD_URL";
                  break;
                case 38:
                  id v16 = @"COMPONENT_TYPE_ASSOCIATED_APP";
                  break;
                case 39:
                  id v16 = @"COMPONENT_TYPE_MESSAGE_LINK";
                  break;
                case 40:
                  id v16 = @"COMPONENT_TYPE_QUICK_LINK";
                  break;
                case 41:
                  id v16 = @"COMPONENT_TYPE_RAP";
                  break;
                case 42:
                  id v16 = @"COMPONENT_TYPE_OFFLINE_AREA";
                  break;
                case 43:
                  id v16 = @"COMPONENT_TYPE_LOCATION_EVENT";
                  break;
                case 44:
                  id v16 = @"COMPONENT_TYPE_SUPPORTS_OFFLINE_MAPS";
                  break;
                case 45:
                  id v16 = @"COMPONENT_TYPE_OFFLINE_IDENTIFIER";
                  break;
                case 46:
                  id v16 = @"COMPONENT_TYPE_OFFLINE_QUAD_NODES";
                  break;
                case 47:
                  id v16 = @"COMPONENT_TYPE_OFFLINE_SIZE";
                  break;
                case 48:
                  id v16 = @"COMPONENT_TYPE_VENUE_INFO";
                  break;
                case 49:
                  id v16 = @"COMPONENT_TYPE_OFFLINE_UPDATE_MANIFEST";
                  break;
                case 50:
                  id v16 = @"COMPONENT_TYPE_CONTAINED_PLACE";
                  break;
                case 51:
                  id v16 = @"COMPONENT_TYPE_WIFI_FINGERPRINT";
                  break;
                case 52:
                  id v16 = @"COMPONENT_TYPE_ICON";
                  break;
                case 53:
                  id v16 = @"COMPONENT_TYPE_PRICE_DESCRIPTION";
                  break;
                case 54:
                  id v16 = @"COMPONENT_TYPE_BROWSE_CATEGORIES";
                  break;
                case 57:
                  id v16 = @"COMPONENT_TYPE_ANNOTATED_ITEM_LIST";
                  break;
                case 58:
                  id v16 = @"COMPONENT_TYPE_POI_EVENT";
                  break;
                case 60:
                  id v16 = @"COMPONENT_TYPE_PLACECARD_LAYOUT";
                  break;
                case 61:
                  id v16 = @"COMPONENT_TYPE_PROTOTYPE_CONTAINER";
                  break;
                case 62:
                  id v16 = @"COMPONENT_TYPE_TRANSIT_VEHICLE_POSITION";
                  break;
                case 63:
                  id v16 = @"COMPONENT_TYPE_LINKED_SERVICE";
                  break;
                case 64:
                  id v16 = @"COMPONENT_TYPE_BUSINESS_HOURS";
                  break;
                case 65:
                  id v16 = @"COMPONENT_TYPE_COLLECTION";
                  break;
                case 66:
                  id v16 = @"COMPONENT_TYPE_RELATED_PLACE";
                  break;
                case 67:
                  id v16 = @"COMPONENT_TYPE_TRANSIT_TRIP_STOP";
                  break;
                case 68:
                  id v16 = @"COMPONENT_TYPE_TRANSIT_TRIP_STOP_TIME";
                  break;
                case 69:
                  id v16 = @"COMPONENT_TYPE_TRANSIT_TRIP_GEOMETRY";
                  break;
                case 70:
                  id v16 = @"COMPONENT_TYPE_PLACE_BROWSE_CATEGORIES";
                  break;
                case 71:
                  id v16 = @"COMPONENT_TYPE_PUBLISHER";
                  break;
                case 72:
                  id v16 = @"COMPONENT_TYPE_MINI_PLACE_BROWSE_CATEGORIES";
                  break;
                case 73:
                  id v16 = @"COMPONENT_TYPE_PLACE_QUESTIONNAIRE";
                  break;
                case 74:
                  id v16 = @"COMPONENT_TYPE_PLACE_COLLECTION_ITEM";
                  break;
                case 76:
                  id v16 = @"COMPONENT_TYPE_COLLECTION_IDS";
                  break;
                case 77:
                  id v16 = @"COMPONENT_TYPE_ISO_3166_CODE";
                  break;
                case 78:
                  id v16 = @"COMPONENT_TYPE_VENDOR_AMENITIES";
                  break;
                case 79:
                  id v16 = @"COMPONENT_TYPE_TRANSIT_NEARBY_SCHEDULE";
                  break;
                case 82:
                  id v16 = @"COMPONENT_TYPE_GUIDE_GROUP";
                  break;
                case 83:
                  id v16 = @"COMPONENT_TYPE_CONTAINMENT_PLACE";
                  break;
                case 84:
                  id v16 = @"COMPONENT_TYPE_CATEGORIZED_PHOTOS";
                  break;
                case 85:
                  id v16 = @"COMPONENT_TYPE_EXPLORE_GUIDES";
                  break;
                case 86:
                  id v16 = @"COMPONENT_TYPE_ABOUT";
                  break;
                case 87:
                  id v16 = @"COMPONENT_TYPE_LABEL_GEOMETRY";
                  break;
                case 88:
                  id v16 = @"COMPONENT_TYPE_ENHANCED_PLACEMENT";
                  break;
                case 89:
                  id v16 = @"COMPONENT_TYPE_TEMPLATE_PLACE";
                  break;
                case 90:
                  id v16 = @"COMPONENT_TYPE_SEARCH_ENRICHMENT";
                  break;
                case 91:
                  id v16 = @"COMPONENT_TYPE_TRANSIT_PAYMENT_METHOD_INFO";
                  break;
                case 92:
                  id v16 = @"COMPONENT_TYPE_BUSINESS_ASSETS";
                  break;
                case 93:
                  id v16 = @"COMPONENT_TYPE_ENRICHMENT_INFO";
                  break;
                case 94:
                  id v16 = @"COMPONENT_TYPE_ACTION_DATA";
                  break;
                case 95:
                  id v16 = @"COMPONENT_TYPE_ENRICHMENT_DATA";
                  break;
                case 96:
                  id v16 = @"COMPONENT_TYPE_POI_CLAIM";
                  break;
                case 97:
                  id v16 = @"COMPONENT_TYPE_EV_CHARGER";
                  break;
                case 98:
                  id v16 = @"COMPONENT_TYPE_TRAIL_HEAD";
                  break;
                case 99:
                  id v16 = @"COMPONENT_TYPE_TOOL_TIP";
                  break;
                case 100:
                  id v16 = @"COMPONENT_TYPE_REFRESH_ID";
                  break;
                case 101:
                  id v16 = @"COMPONENT_TYPE_ADDRESS_COMPONENTS";
                  break;
                case 102:
                  id v16 = @"COMPONENT_TYPE_SEARCH_RESULT_PLACE_PHOTO";
                  break;
                case 103:
                  id v16 = @"COMPONENT_TYPE_FORWARD_INFO";
                  break;
                case 104:
                  id v16 = @"COMPONENT_TYPE_HIKE_ASSOCIATED_INFO";
                  break;
                case 105:
                  id v16 = @"COMPONENT_TYPE_HIKE_SUMMARY";
                  break;
                case 106:
                  id v16 = @"COMPONENT_TYPE_HIKE_GEOMETRY";
                  break;
                default:
                  id v16 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v15));
                  break;
              }

              [v9 addObject:v16];
            }

            id v12 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
          }

          while (v12);
        }

        [v9 sortUsingSelector:"compare:"];
        uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
        __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsJoinedByString:", @", "));
          *(_DWORD *)buf = 138412290;
          __int128 v26 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Result was missing components: %@",  buf,  0xCu);
        }

        double v7 = v20;
      }

      goto LABEL_112;
    }
  }

LABEL_113:
}

void sub_10003556C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  BOOL v3 = (v2 & 8) == 0;
  if (_GEOConfigHasValue( GeoServicesConfig_DefaultsPlaceDataRequestsCanUseCache[0],  GeoServicesConfig_DefaultsPlaceDataRequestsCanUseCache[1])) {
    unsigned int BOOL = GEOConfigGetBOOL( GeoServicesConfig_DefaultsPlaceDataRequestsCanUseCache[0],  GeoServicesConfig_DefaultsPlaceDataRequestsCanUseCache[1]);
  }
  else {
    unsigned int BOOL = (v2 >> 1) & 1;
  }
  if (_GEOConfigHasValue( GeoServicesConfig_DefaultsPlaceDataRequestsCanUseExpired[0],  GeoServicesConfig_DefaultsPlaceDataRequestsCanUseExpired[1])) {
    uint64_t v5 = GEOConfigGetBOOL( GeoServicesConfig_DefaultsPlaceDataRequestsCanUseExpired[0],  GeoServicesConfig_DefaultsPlaceDataRequestsCanUseExpired[1]);
  }
  else {
    uint64_t v5 = (v2 >> 2) & 1;
  }
  if (_GEOConfigHasValue( GeoServicesConfig_DefaultsPlaceDataRequestsCanUseNetwork[0],  GeoServicesConfig_DefaultsPlaceDataRequestsCanUseNetwork[1])) {
    int v6 = GEOConfigGetBOOL( GeoServicesConfig_DefaultsPlaceDataRequestsCanUseNetwork[0],  GeoServicesConfig_DefaultsPlaceDataRequestsCanUseNetwork[1]);
  }
  else {
    int v6 = v2 & 1;
  }
  double v7 = *(void **)(a1 + 32);
  if (!v7)
  {
    uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = NSStringFromSelector(*(SEL *)(a1 + 96));
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = "nil == identifiers";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);
    }

    goto LABEL_25;
  }

  if (!*(void *)(a1 + 80))
  {
    uint64_t v15 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v16 = NSStringFromSelector(*(SEL *)(a1 + 96));
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = "nil == requesterHandler";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);
    }

    goto LABEL_25;
  }

  if (!*(void *)(a1 + 40))
  {
    uint64_t v18 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v19 = NSStringFromSelector(*(SEL *)(a1 + 96));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = "nil == traits";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);
    }

    goto LABEL_25;
  }

  if (!(BOOL | v6))
  {
    uint64_t v8 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = "!canUseCache && !canUseNetwork";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);
    }

void sub_100036154( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

void sub_100036190(void *a1, void *a2, char a3, uint64_t a4)
{
  id v8 = a2;
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = a3;
  *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = a4;
}

void sub_1000361EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  _DWORD v8[2] = sub_100036290;
  v8[3] = &unk_10005A9B8;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(v4 + 8);
  v8[1] = 3221225472LL;
  char v12 = *(_BYTE *)(a1 + 48);
  id v9 = v3;
  uint64_t v10 = v4;
  id v11 = v5;
  id v7 = v3;
  geo_reentrant_isolate_sync(v6, v8);
}

id sub_100036290(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56))
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    id v2 = *(id *)(a1 + 32);
    id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        for (i = 0LL; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        }

        id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }

      while (v4);
    }
  }

  return objc_msgSend( *(id *)(*(void *)(a1 + 40) + 40),  "didResolveItems:forIdentifiers:",  *(void *)(a1 + 32),  *(void *)(a1 + 48),  (void)v9);
}

void sub_1000363B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(v4 + 8);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _DWORD v8[2] = sub_100036444;
  v8[3] = &unk_100059048;
  void v8[4] = v4;
  id v9 = v5;
  id v10 = v3;
  id v7 = v3;
  geo_reentrant_isolate_sync_data(v6, v8);
}

void sub_100036444(void *a1)
{
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = a1[6];
    int v5 = 138477827;
    uint64_t v6 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "[For MUID] Error refreshing expired muids: %{private}@",  (uint8_t *)&v5,  0xCu);
  }
}

void sub_10003650C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  _DWORD v8[2] = sub_1000365C4;
  v8[3] = &unk_10005AA30;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(v4 + 8);
  v8[1] = 3221225472LL;
  id v9 = v3;
  uint64_t v10 = v4;
  id v11 = v5;
  char v13 = *(_BYTE *)(a1 + 56);
  id v12 = *(id *)(a1 + 48);
  id v7 = v3;
  geo_reentrant_isolate_sync(v6, v8);
}

id sub_1000365C4(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = *(id *)(a1 + 32);
  id v3 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v23;
    uint64_t v6 = DefaultLoggingSubsystem;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(id *)(*((void *)&v22 + 1) + 8LL * (void)i);
        uint64_t Log = GEOFindOrCreateLog(v6, "GEOPlaceDataLocalProxy");
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 compactDebugDescription]);
          *(_DWORD *)buf = 138477827;
          id v27 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Received place data: %{private}@",  buf,  0xCu);
        }

        [v8 setFirstSeenTimestamp:Current];
        sub_100034D18(*(void *)(a1 + 40), v8, *(void **)(a1 + 48));
        id v12 = [[GEOMapItemIdentifier alloc] initWithPlace:v8];
        uint64_t v13 = GEOFindOrCreateLog(v6, "GEOPlaceDataLocalProxy");
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138477827;
          id v27 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Checking placedata with identifier=%{private}@",  buf,  0xCu);
        }

        unsigned int v15 = [v8 status];
        uint64_t v16 = GEOFindOrCreateLog(v6, "GEOPlaceDataLocalProxy");
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
        if (v15)
        {
          if (v18)
          {
            *(_DWORD *)buf = 138478083;
            id v27 = v12;
            __int16 v28 = 2113;
            id v29 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "Received unsuccessful place with identifier=%{private}@, data: %{private}@",  buf,  0x16u);
          }
        }

        else
        {
          if (v18)
          {
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 bestName]);
            *(_DWORD *)buf = 138477827;
            id v27 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "Received place data for: %{private}@",  buf,  0xCu);
          }

          if (*(_BYTE *)(a1 + 64)) {
            [*(id *)(a1 + 40) trackPlaceData:v8];
          }
        }
      }

      id v4 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
    }

    while (v4);
  }

  return [*(id *)(*(void *)(a1 + 40) + 40) didResolveItems:*(void *)(a1 + 32) forIdentifiers:*(void *)(a1 + 56)];
}

void sub_1000368DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(v4 + 8);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _DWORD v8[2] = sub_100036970;
  v8[3] = &unk_100059048;
  id v9 = v3;
  uint64_t v10 = v4;
  id v11 = v5;
  id v7 = v3;
  geo_reentrant_isolate_sync(v6, v8);
}

void sub_100036970(uint64_t a1)
{
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "[For MUID] Error fetching missing muids: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 40LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) set]);
  [v5 failedToResolveIdentifiers:v6 withError:*(void *)(a1 + 32)];
}

void sub_100036C60(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (*(void *)(a1 + 32))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 resultsWithResultType:1]);
    id v3 = v6;
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
LABEL_6:
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);

      id v3 = v6;
      goto LABEL_7;
    }
  }

  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -11LL,  @"Identifier lookup failed to return any results"));
    uint64_t v5 = *(void *)(a1 + 40);
    goto LABEL_6;
  }

void sub_1000372E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void sub_100037304(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

  if (v6 != v5)
  {
    uint64_t v7 = GEOStringForPhoneNumber(v5);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = v8;
    if (v8 && [v8 length])
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pdPlaceCache]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lookupIdentifierByPhoneNumber:v9]);

      if (v11)
      {
        id v12 = *(void **)(a1 + 40);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
        [v12 setObject:v13 forKey:v11];
      }
    }

    else
    {
      uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
      unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Couldn't construct a string version for phone number.",  v16,  2u);
      }
    }
  }
}

id sub_100037444(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_10003746C(uint64_t a1)
{
}

void sub_100037474(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  void v17[2] = sub_100037590;
  v17[3] = &unk_10005AAF8;
  uint64_t v13 = *(void *)(a1 + 88);
  id v21 = v8;
  uint64_t v22 = v13;
  id v18 = v7;
  uint64_t v14 = *(void *)(a1 + 64);
  id v19 = *(id *)(a1 + 72);
  id v20 = *(id *)(a1 + 80);
  char v23 = *(_BYTE *)(a1 + 96);
  id v15 = v7;
  id v16 = v8;
  [v9 requestIdentifiers:v15 resultProviderID:0 requestUUID:v10 traits:v11 options:a2 auditToken:v12 throttleToken:v14 requesterHandler:v17];
}

void sub_100037590(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 56) || *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", *(void *)(a1 + 32)));
    if (v6)
    {
      uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67240450;
        int v38 = 0;
        __int16 v39 = 2114;
        id v40 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Error consulting providerId=%{public}d: %{public}@",  buf,  0x12u);
      }
    }

    else
    {
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 resultsWithResultType:1]);
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      id v10 = -[os_log_s countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v33,  v41,  16LL);
      if (v10)
      {
        id v11 = v10;
        uint64_t v31 = 0LL;
        id v32 = v5;
        uint64_t v12 = *(void *)v34;
        do
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v34 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
            if (objc_msgSend(v14, "status", v31, v32) != 20)
            {
              id v15 = [[GEOMapItemIdentifier alloc] initWithPlace:v14];
              id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v15]);
              id v17 = v16;
              if (v16)
              {
                id v18 = v7;
                id v19 = *(void **)(a1 + 48);
                id v20 = [v16 unsignedIntegerValue];
                id v21 = v19;
                id v7 = v18;
                [v21 setObject:v14 atIndexedSubscript:v20];
              }

              [v7 removeObject:v15];
            }
          }

          id v11 = -[os_log_s countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v33,  v41,  16LL);
        }

        while (v11);
        id v6 = v31;
        id v5 = v32;
      }
    }

    uint64_t v22 = *(void *)(a1 + 56);
    if (v22)
    {
      id v23 = sub_100033044(*(void **)(a1 + 48));
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      (*(void (**)(uint64_t, void *, id))(v22 + 16))(v22, v24, v6);
    }

    uint64_t v25 = *(void *)(a1 + 64);
    if (*(void *)(*(void *)(v25 + 8) + 40LL))
    {
      if (*(_BYTE *)(a1 + 72))
      {
        id v26 = [v7 count];
        uint64_t v25 = *(void *)(a1 + 64);
        if (v26)
        {
          uint64_t v27 = *(void *)(*(void *)(v25 + 8) + 40LL);
          __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
          (*(void (**)(uint64_t, uint64_t, void *, void))(v27 + 16))(v27, 1LL, v28, 0LL);

          uint64_t v25 = *(void *)(a1 + 64);
        }
      }
    }

    uint64_t v29 = *(void *)(v25 + 8);
    char v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = 0LL;
  }
}

uint64_t sub_100037984(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 data]);
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];

  return 1LL;
}

void sub_1000379E0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0LL);
}

LABEL_43:
  uint64_t v53 = GEOFindOrCreateLog(v20, "GEOPlaceDataLocalProxy");
  uint64_t v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "Performing request.", buf, 2u);
  }

  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472LL;
  v62[2] = sub_100038494;
  v62[3] = &unk_10005AB70;
  BOOL v67 = a6;
  uint64_t v63 = v17;
  id v64 = self;
  uint64_t v65 = v28;
  uint64_t v66 = v19;
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  v60[2] = sub_10003874C;
  v60[3] = &unk_100059EE8;
  id v19 = v66;
  uint64_t v61 = v19;
  -[GEOPlaceDataLocalProxy startRequest:requestUUID:traits:timeout:auditToken:throttleToken:finished:error:]( self,  "startRequest:requestUUID:traits:timeout:auditToken:throttleToken:finished:error:",  v63,  v57,  v58,  v18,  v59,  v62,  a7,  v60);

LABEL_46:
}

void sub_100038380( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, char a43)
{
}

void sub_1000383DC(void *a1, void *a2, char a3, uint64_t a4)
{
  id v8 = a2;
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = a3;
  *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = a4;
}

void sub_100038438(void *a1, void *a2, char a3, uint64_t a4)
{
  id v8 = a2;
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = a3;
  *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = a4;
}

void sub_100038494(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(void *)(a1 + 64) != 4LL)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 resultsWithResultType:1]);
    if ([v4 status] || objc_msgSend(v5, "count"))
    {
      if ([v5 count] != (id)1)
      {
LABEL_13:

        goto LABEL_14;
      }

      id v6 = (GEOPDPlace *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
      if (GEOMapItemHandleShouldStoreRequestData([*(id *)(a1 + 32) requestType]))
      {
        id v7 = objc_alloc_init(&OBJC_CLASS___GEOMapItemInitialRequestData);
        -[GEOPDPlace setRequestData:](v6, "setRequestData:", v7);

        id v8 = [*(id *)(a1 + 32) requestType];
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPDPlace requestData](v6, "requestData"));
        [v9 setRequestType:v8];

        id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) placeRequestParameters]);
        id v11 = [v10 copy];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPDPlace requestData](v6, "requestData"));
        [v12 setPlaceRequestParameters:v11];
      }

      if (!-[GEOPDPlace status](v6, "status"))
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) pdPlaceCache]);
        [v13 storePlace:v6 forRequest:*(void *)(a1 + 32)];

        sub_100034D18(*(void *)(a1 + 40), v6, *(void **)(a1 + 48));
      }
    }

    else
    {
      uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        id v16 = *(void **)(a1 + 32);
        int v21 = 138412290;
        uint64_t v22 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Caching negative response for request %@",  (uint8_t *)&v21,  0xCu);
      }

      id v6 = objc_alloc_init(&OBJC_CLASS___GEOPDPlace);
      -[GEOPDPlace setNilPlace:](v6, "setNilPlace:", 1LL);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) pdPlaceCache]);
      [v17 storePlace:v6 forRequest:*(void *)(a1 + 32)];
    }

    goto LABEL_13;
  }

LABEL_14:
  uint64_t v18 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GEOPlaceDataLocalProxy");
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 134217984;
    uint64_t v22 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "Response from the server: %p",  (uint8_t *)&v21,  0xCu);
  }

  uint64_t v20 = *(void *)(a1 + 56);
  if (v20) {
    (*(void (**)(uint64_t, void *, void))(v20 + 16))(v20, v4, 0LL);
  }
}

uint64_t sub_10003874C(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0LL, a2);
  }
  return result;
}

id sub_100038A78(id a1, GEOPDPlace *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(&OBJC_CLASS___GEOPDMapsResult);
  [v3 setResultType:1];
  [v3 setPlace:v2];

  return v3;
}

void sub_100038D60(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS____GEOTransitRouteUpdateRequestConfig);
  id v2 = (void *)qword_10006B0D0;
  qword_10006B0D0 = (uint64_t)v1;
}

void sub_100038DF0(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___GEOTransitUpdateServerRequester);
  id v2 = (void *)qword_10006B0D8;
  qword_10006B0D8 = (uint64_t)v1;
}

void sub_100038F2C(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0LL);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

uint64_t sub_100039060(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_1000393D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100039790(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___GEOETAServiceRequester);
  id v2 = (void *)qword_10006B0E8;
  qword_10006B0E8 = (uint64_t)v1;
}

void sub_100039A2C(void *a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = a1[4];
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0LL);
  }
  if (v12)
  {
    id v7 = v12;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[GEOExperimentConfiguration sharedConfiguration]( &OBJC_CLASS___GEOExperimentConfiguration,  "sharedConfiguration"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 datasetAbStatus]);
    [v8 refreshDatasetABStatus:v9];

    uint64_t v10 = a1[5];
    if (v10) {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v7);
    }
  }

  else
  {
    uint64_t v11 = a1[6];
    if (v11) {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v5);
    }
  }
}

void sub_100039DC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(void *)(a1 + 32))
  {
    int BOOL = GEOConfigGetBOOL( GeoServicesConfig_ValidateSensitiveFieldsAtSend_ETA[0],  GeoServicesConfig_ValidateSensitiveFieldsAtSend_ETA[1]);
    uint64_t v6 = *(void *)(a1 + 32);
    if (BOOL)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_100039E80;
      v7[3] = &unk_10005AC60;
      id v8 = v4;
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }

    else
    {
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v4);
    }
  }

  else
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0LL);
  }
}

void sub_100039E80(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100039ED8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[GEOExperimentConfiguration sharedConfiguration]( &OBJC_CLASS___GEOExperimentConfiguration,  "sharedConfiguration"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 datasetAbStatus]);
  [v4 refreshDatasetABStatus:v5];

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routes", 0));
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ([v11 reroutedRoutesCount])
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 reroutedRouteAtIndex:0]);
          [v12 unpackLatLngVertices];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 unpackedLatLngVertices]);

          if (!v13) {
            [v11 setReroutedRoutes:0];
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v3);
  }
}

void sub_10003A078(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[GEOProtobufSession sharedDelegateQueue]( &OBJC_CLASS___GEOProtobufSession,  "sharedDelegateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003A174;
  block[3] = &unk_10005ACD8;
  id v13 = a1[4];
  id v11 = v6;
  id v14 = a1[5];
  id v15 = a1[6];
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

uint64_t sub_10003A174(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0LL);
  }
  uint64_t v3 = a1[4];
  if (!v3)
  {
    uint64_t result = a1[8];
    uint64_t v3 = a1[5];
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }

  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

id sub_10003A6BC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) send];
}

id sub_10003A6E8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) send];
}

void sub_10003A97C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[GEOETAUpdateableWillSendRequest alloc] initWithMessage:@"ETA.willSendETARequest" traits:0 auditToken:0 throttleToken:0];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) peer]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 connection]);
  global_workloop = (void *)geo_get_global_workloop(21LL);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10003AA70;
  v9[3] = &unk_10005AD28;
  id v10 = v3;
  id v8 = v3;
  [v4 send:v6 withReply:global_workloop handler:v9];
}

void sub_10003AA70(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 updatedRequest]);
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

id sub_10003AAB8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) send];
}

id sub_10003AAE4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setError:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_geo_etaTrafficUpdateErrorInfo"));

  [*(id *)(a1 + 32) setErrorInfo:v5];
  return [*(id *)(a1 + 32) send];
}

void sub_10003ABC4()
{
  *(_WORD *)id v0 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Assertion failed: proxy != ((void *)0)",  v0,  2u);
}

void sub_10003AC08()
{
  *(_WORD *)id v0 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Assertion failed: counts.count == 0 || [counts.firstObject isKindOfClass:GEORequestCounterCacheResults.class]",  v0,  2u);
}

uint64_t sub_10003AC4C()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "CLLocationManager");
  return sub_10003AC70(v0);
}

uint64_t sub_10003AC70()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "BGSystemTaskScheduler");
  return sub_10003AC94(v0);
}

uint64_t sub_10003AC94()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "BGNonRepeatingSystemTaskRequest");
  return sub_10003ACB8(v0);
}

uint64_t sub_10003ACB8()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "BGRepeatingSystemTaskRequest");
  return sub_10003ACDC(v0);
}

uint64_t sub_10003ACDC()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "MAAsset");
  return sub_10003AD00(v0);
}

uint64_t sub_10003AD00()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "MAAssetQuery");
  return sub_10003AD24(v0);
}

uint64_t sub_10003AD24()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "MADownloadOptions");
  return sub_10003AD48(v0);
}

uint64_t sub_10003AD48()
{
  uint64_t v0 = dlerror();
  uint64_t v1 = abort_report_np("%s", v0);
  return sub_10003AD68(v1);
}

void sub_10003AD68( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001C908( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "Assertion failed: _persistence != ((void *)0)",  a5,  a6,  a7,  a8,  0);
}

void sub_10003ADA0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001C908( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "Assertion failed: options != GEOConfigOption_None",  a5,  a6,  a7,  a8,  0);
  sub_1000225B8();
}

void sub_10003ADD4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003AE08( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003AE3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = (objc_class *)objc_opt_class(a1, a2, a3);
  id v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  int v6 = 138543362;
  id v7 = v5;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Unreachable reached: query parameter value is unexpected type: %{public}@",  (uint8_t *)&v6,  0xCu);
}

void sub_10003AED4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001C908( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "Assertion failed: indexes != ((void *)0)",  a5,  a6,  a7,  a8,  0);
  sub_1000225B8();
}

void sub_10003AF08( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001C908( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "Assertion failed: strongLoader != nil",  a5,  a6,  a7,  a8,  0);
  sub_1000225B8();
}

void sub_10003AF3C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003AF70( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001C908( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "Assertion failed: [resolvedIdentifierIndexes count] == [placeResults count]",  a5,  a6,  a7,  a8,  0);
  sub_1000225B8();
}

void sub_10003AFA4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001C908( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "Assertion failed: hittingPlaces.count + missingIdentifiers.count == todoIdentifiers.count",  a5,  a6,  a7,  a8,  0);
  sub_1000225B8();
}

id objc_msgSend__callCompletionHandler_withRequestedCoordinate_reduceRadius_forResponse_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_callCompletionHandler:withRequestedCoordinate:reduceRadius:forResponse:error:");
}

id objc_msgSend__doNetworkRequestForLatLng_reduceRadius_traits_auditToken_shouldCache_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_doNetworkRequestForLatLng:reduceRadius:traits:auditToken:shouldCache:completionHandler:");
}

id objc_msgSend__fetchCachedShiftFunctionResponseForLocation_callbackQueue_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchCachedShiftFunctionResponseForLocation:callbackQueue:completionHandler:");
}

id objc_msgSend__fetchResources_force_manifestConfiguration_destination_additionalDestination_auditToken_signpostID_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_fetchResources:force:manifestConfiguration:destination:additionalDestination:auditToken:signpostID:");
}

id objc_msgSend__fetchResources_force_unpack_manifestConfiguration_auditToken_signpostID_queue_handler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchResources:force:unpack:manifestConfiguration:auditToken:signpostID:queue:handler:");
}

id objc_msgSend__iterateAllPlacesFilteringCacheKeyWithPredicate_entryBlock_finishedBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_iterateAllPlacesFilteringCacheKeyWithPredicate:entryBlock:finishedBlock:");
}

id objc_msgSend__requestIdentifiersFromNetwork_resultProviderID_requestUUID_traits_auditToken_throttleToken_finished_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_requestIdentifiersFromNetwork:resultProviderID:requestUUID:traits:auditToken:throttleToken:finished:error:");
}

id objc_msgSend__startWithRequest_traits_auditToken_config_throttleToken_options_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:");
}

id objc_msgSend__startWithRequest_traits_auditToken_config_throttleToken_options_willSendRequestHandler_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_startWithRequest:traits:auditToken:config:throttleToken:options:willSendRequestHandler:completionHandler:");
}

id objc_msgSend_fetchResources_force_unpack_manifestConfiguration_auditToken_queue_handler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchResources:force:unpack:manifestConfiguration:auditToken:queue:handler:");
}

id objc_msgSend_incrementExternalForApp_startTime_endTime_xmitBytes_recvBytes_usedInterfaces_requestType_requestSubtype_source_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "incrementExternalForApp:startTime:endTime:xmitBytes:recvBytes:usedInterfaces:requestType:requestSubtype:source:");
}

id objc_msgSend_incrementForApp_startTime_endTime_requestType_result_xmitBytes_recvBytes_usedInterfaces_withCompletion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "incrementForApp:startTime:endTime:requestType:result:xmitBytes:recvBytes:usedInterfaces:withCompletion:");
}

id objc_msgSend_initWithKind_URL_auditToken_timeoutInterval_additionalHTTPHeaders_bodyData_userAgent_entityTag_cachedData_requestCounterTicket_multipathServiceType_multipathAlternatePort_backgroundSessionIdentifier_throttleToken_options_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithKind:URL:auditToken:timeoutInterval:additionalHTTPHeaders:bodyData:userAgent:entityTag:cachedData:req uestCounterTicket:multipathServiceType:multipathAlternatePort:backgroundSessionIdentifier:throttleToken:options:");
}

id objc_msgSend_initWithTargetDirectory_auditToken_baseURL_alternateURLs_proxyURL_resources_forceUpdateCheck_maximumConcurrentLoads_additionalDirectoryToConsider_log_signpostID_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithTargetDirectory:auditToken:baseURL:alternateURLs:proxyURL:resources:forceUpdateCheck:maximumConcurren tLoads:additionalDirectoryToConsider:log:signpostID:");
}

id objc_msgSend_loadKey_additionalInfo_priority_forClient_auditToken_options_reason_qos_signpostID_createTime_callbackQ_beginNetwork_callback_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "loadKey:additionalInfo:priority:forClient:auditToken:options:reason:qos:signpostID:createTime:callbackQ:begin Network:callback:");
}

id objc_msgSend_performPlaceDataRequest_requestUUID_traits_cachePolicy_timeout_auditToken_throttleToken_requesterHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "performPlaceDataRequest:requestUUID:traits:cachePolicy:timeout:auditToken:throttleToken:requesterHandler:");
}

id objc_msgSend_recordNetworkEventDataForDataRequestKind_usedBackgroundURL_requestAppIdentifier_appMajorVersion_appMinorVersion_error_clientMetrics_additionalStates_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "recordNetworkEventDataForDataRequestKind:usedBackgroundURL:requestAppIdentifier:appMajorVersion:appMinorVersi on:error:clientMetrics:additionalStates:");
}

id objc_msgSend_recordRoutePreloadSessionAt_transportType_tilesPreloaded_tilesUsed_tilesMissed_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordRoutePreloadSessionAt:transportType:tilesPreloaded:tilesUsed:tilesMissed:");
}

id objc_msgSend_registerCacheResult_forMapItem_cachedByteCount_forRequestType_auditToken_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerCacheResult:forMapItem:cachedByteCount:forRequestType:auditToken:");
}

id objc_msgSend_requestIdentifiers_resultProviderID_requestUUID_traits_options_auditToken_throttleToken_requesterHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "requestIdentifiers:resultProviderID:requestUUID:traits:options:auditToken:throttleToken:requesterHandler:");
}

id objc_msgSend_requestPhoneNumbers_requestUUID_allowCellularDataForLookup_traits_auditToken_throttleToken_requesterHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "requestPhoneNumbers:requestUUID:allowCellularDataForLookup:traits:auditToken:throttleToken:requesterHandler:");
}

id objc_msgSend_startRequest_connectionProperties_traits_auditToken_willSendRequest_finished_networkActivity_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "startRequest:connectionProperties:traits:auditToken:willSendRequest:finished:networkActivity:error:");
}

id objc_msgSend_startRequest_requestUUID_traits_timeout_auditToken_throttleToken_finished_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startRequest:requestUUID:traits:timeout:auditToken:throttleToken:finished:error:");
}

id objc_msgSend_startRequest_traits_auditToken_skipFinalize_useBackgroundURL_requestPriority_callbackQueue_finished_networkActivity_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "startRequest:traits:auditToken:skipFinalize:useBackgroundURL:requestPriority:callbackQueue:finished:networkActivity:error:");
}

id objc_msgSend_startSimpleImageServiceRequest_auditToken_finished_networkActivity_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSimpleImageServiceRequest:auditToken:finished:networkActivity:error:");
}

id objc_msgSend_startSimpleTransitRouteUpdateRequest_auditToken_networkActivity_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSimpleTransitRouteUpdateRequest:auditToken:networkActivity:completion:");
}

id objc_msgSend_startWithRequest_traits_timeout_auditToken_throttleToken_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithRequest:traits:timeout:auditToken:throttleToken:completionHandler:");
}

id objc_msgSend_submitWiFiQualityServiceRequest_requestId_auditToken_completionQueue_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submitWiFiQualityServiceRequest:requestId:auditToken:completionQueue:completion:");
}

id objc_msgSend_submitWiFiQualityTileLoadForKey_eTag_requestId_auditToken_completionQueue_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submitWiFiQualityTileLoadForKey:eTag:requestId:auditToken:completionQueue:completion:");
}

id objc_msgSend_xpcUuid(void *a1, const char *a2, ...)
{
  return [a1 xpcUuid];
}