BOOL enumerateHangIntervalsInTimeRange(void *a1, void *a2, float *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  float v14;
  id v15;
  os_log_s *v16;
  void *v17;
  id v19;
  rusage v20;
  rusage v21;
  void v22[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  v7 = a4;
  v8 = a2;
  v9 = a1;
  v10 = (void *)objc_opt_new(&OBJC_CLASS___SignpostSupportObjectExtractor);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100002DD0;
  v22[3] = &unk_100014470;
  v11 = v7;
  v23 = v11;
  [v10 setIntervalCompletionProcessingBlock:v22];
  v12 = (void *)objc_opt_new(&OBJC_CLASS___SignpostSupportSubsystemCategoryAllowlist);
  [v12 addSubsystem:@"com.apple.hangtracer" category:@"always_on_hang"];
  [v10 setSubsystemCategoryFilter:v12];
  memset(&v20, 0, sizeof(v20));
  memset(&v21, 0, sizeof(v21));
  getrusage(0, &v21);
  v19 = 0LL;
  [v10 processLogArchiveWithPath:0 startDate:v9 endDate:v8 errorOut:&v19];

  v13 = v19;
  getrusage(0, &v20);
  if (a3)
  {
    v14 = (float)((float)((float)v20.ru_stime.tv_usec / 1000000.0) + (float)v20.ru_stime.tv_sec)
        - (float)((float)((float)v21.ru_stime.tv_usec / 1000000.0) + (float)v21.ru_stime.tv_sec)
    *a3 = v14;
  }

  if (v13)
  {
    v15 = shared_ht_log_handle();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
      *(_DWORD *)buf = 136315394;
      v25 = "enumerateHangIntervalsInTimeRange";
      v26 = 2112;
      v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s completed with error: %@\n", buf, 0x16u);
    }
  }

  return v13 == 0LL;
}

uint64_t sub_100002DD0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id getHangIntervalsInTimeRange(void *a1, void *a2, float *a3)
{
  id v5 = a2;
  id v6 = a1;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100002EB8;
  v10[3] = &unk_100014498;
  v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v11 = v7;
  LODWORD(a3) = enumerateHangIntervalsInTimeRange(v6, v5, a3, v10);

  if ((_DWORD)a3) {
    id v8 = -[NSMutableArray copy](v7, "copy");
  }
  else {
    id v8 = &__NSArray0__struct;
  }

  return v8;
}

uint64_t sub_100002EB8(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

id getHangHistoryInfo(int a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -86400.0));
  float v108 = 0.0;
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id HangIntervalsInTimeRange = getHangIntervalsInTimeRange(v2, v82, &v108);
  v4 = (void *)objc_claimAutoreleasedReturnValue(HangIntervalsInTimeRange);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  &stru_100014D38));
  v83 = v2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  v2,  1LL,  2LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Progress: Reading back hang interval signposts starting from %@\n",  v6));

  [v5 appendString:v7];
  id v8 = [v4 count];
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.02fms",  (float)(v108 * 1000.0)));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Found %zu hang intervals in last 24 hours which took %@\n",  v8,  v9));

  [v5 appendString:v10];
  v11 = @"hangWallTime hangDurationMS process[pid] ";
  [v5 appendString:@"hangWallTime hangDurationMS process[pid] "];
  int v94 = a1;
  if (a1) {
    v12 = @"windowLookupTimeMS\n";
  }
  else {
    v12 = @"\n";
  }
  [v5 appendString:v12];
  v84 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v91 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v93 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v107 = 0u;
  id obj = v4;
  v92 = v5;
  id v88 = [obj countByEnumeratingWithState:&v104 objects:v111 count:16];
  if (v88)
  {
    uint64_t v87 = *(void *)v105;
    do
    {
      v13 = 0LL;
      v14 = v11;
      do
      {
        v89 = v14;
        if (*(void *)v105 != v87) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v104 + 1) + 8LL * (void)v13);
        context = objc_autoreleasePoolPush();
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 beginEvent]);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 beginDate]);
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v17,  -5.0));

        v19 = (void *)objc_claimAutoreleasedReturnValue([v15 endEvent]);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 endDate]);
        v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v20,  5.0));

        float v103 = 0.0;
        if (v94)
        {
          id v22 = getHangIntervalsInTimeRange(v18, v21, &v103);
          *(float *)&double v23 = v103;
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v23));
          -[NSMutableArray addObject:](v84, "addObject:", v24);
        }

        v25 = (void *)objc_claimAutoreleasedReturnValue([v15 beginWallTimeStringWithTimeZoneName:0]);
        [v15 durationSeconds];
        v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.02f",  (float)(v26 * 1000.0)));
        v28 = (void *)objc_claimAutoreleasedReturnValue([v15 beginEvent]);
        v29 = (void *)objc_claimAutoreleasedReturnValue([v28 processName]);
        v30 = (void *)objc_claimAutoreleasedReturnValue([v15 beginEvent]);
        id v31 = [v30 processID];
        v32 = &stru_100014D38;
        if (v94)
        {
          v86 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.02f",  (float)(v103 * 1000.0)));
          v32 = v86;
        }

        v11 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ %@[%d] %@\n",  v25,  v27,  v29,  v31,  v32));

        if (v94) {
        id v5 = v92;
        }
        [v92 appendString:v11];
        v33 = (void *)objc_claimAutoreleasedReturnValue([v15 beginEvent]);
        v34 = (void *)objc_claimAutoreleasedReturnValue([v33 processName]);

        [v15 durationSeconds];
        float v36 = v35 * 1000.0;
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v91, "objectForKey:", v34));

        if (v37)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v91, "objectForKey:", v34));
          v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v38 intValue] + 1));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v91, "setObject:forKeyedSubscript:", v39, v34);

          v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v93, "objectForKey:", v34));
          [v40 floatValue];
          *(float *)&double v42 = v36 + v41;
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v42));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v93, "setObject:forKeyedSubscript:", v43, v34);
        }

        else
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v91, "setObject:forKeyedSubscript:", &off_100016378, v34);
          *(float *)&double v44 = v36;
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v44));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v93, "setObject:forKeyedSubscript:", v38, v34);
        }

        objc_autoreleasePoolPop(context);
        v13 = (char *)v13 + 1;
        v14 = v11;
      }

      while (v88 != v13);
      id v88 = [obj countByEnumeratingWithState:&v104 objects:v111 count:16];
    }

    while (v88);
  }

  if (v94)
  {
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    __int128 v99 = 0u;
    __int128 v100 = 0u;
    v45 = v84;
    id v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v45,  "countByEnumeratingWithState:objects:count:",  &v99,  v110,  16LL);
    if (v46)
    {
      id v47 = v46;
      uint64_t v48 = *(void *)v100;
      float v49 = 0.0;
      float v50 = 3.4028e38;
      float v51 = 0.0;
      float v52 = 0.0;
      do
      {
        for (i = 0LL; i != v47; i = (char *)i + 1)
        {
          if (*(void *)v100 != v48) {
            objc_enumerationMutation(v45);
          }
          [*(id *)(*((void *)&v99 + 1) + 8 * (void)i) floatValue];
          if (v54 < v50) {
            float v50 = v54;
          }
          if (v54 > v52) {
            float v52 = v54;
          }
          float v49 = v49 + 1.0;
          float v51 = (float)((float)(v51 * (float)(v49 + -1.0)) / v49) + (float)(v54 / v49);
        }

        id v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v45,  "countByEnumeratingWithState:objects:count:",  &v99,  v110,  16LL);
      }

      while (v47);
      double v55 = (float)(v50 * 1000.0);
      double v56 = (float)(v52 * 1000.0);
      double v57 = (float)(v51 * 1000.0);
    }

    else
    {
      double v57 = 0.0;
      double v55 = INFINITY;
      double v56 = 0.0;
    }

    v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.02fms",  *(void *)&v55));
    v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.02fms",  *(void *)&v56));
    v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.02fms",  *(void *)&v57));
    uint64_t v61 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Retrieval time per window min %@ max %@ mean %@\n",  v58,  v59,  v60));

    [v5 appendString:v61];
    v11 = (__CFString *)v61;
  }

  v62 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary keysSortedByValueUsingSelector:]( v93,  "keysSortedByValueUsingSelector:",  "compare:"));
  v63 = (void *)objc_claimAutoreleasedReturnValue([v62 reverseObjectEnumerator]);
  v64 = (void *)objc_claimAutoreleasedReturnValue([v63 allObjects]);

  v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"\n%-15s %5s %15s %10s\n",  [@"Process" UTF8String],  objc_msgSend(@"Count", "UTF8String"),  objc_msgSend(@"Duration(ms)", "UTF8String"),  objc_msgSend(@"Mean(ms)", "UTF8String")));
  [v5 appendString:v65];
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  id v66 = v64;
  id v67 = [v66 countByEnumeratingWithState:&v95 objects:v109 count:16];
  if (v67)
  {
    id v68 = v67;
    LODWORD(v69) = 0;
    uint64_t v70 = *(void *)v96;
    float v71 = 0.0;
    do
    {
      v72 = 0LL;
      v73 = v65;
      do
      {
        if (*(void *)v96 != v70) {
          objc_enumerationMutation(v66);
        }
        v74 = *(void **)(*((void *)&v95 + 1) + 8LL * (void)v72);
        v75 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v91, "objectForKey:", v74));
        id v76 = [v75 intValue];

        v77 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v93, "objectForKey:", v74));
        [v77 floatValue];
        float v79 = v78;

        uint64_t v69 = ((_DWORD)v76 + v69);
        float v71 = v71 + v79;
        v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%-15s %5d %15.0f %10.0f\n", [v74 UTF8String], v76, v79, (float)(v79 / (float)(int)v76)));

        [v92 appendString:v65];
        v72 = (char *)v72 + 1;
        v73 = v65;
      }

      while (v68 != v72);
      id v68 = [v66 countByEnumeratingWithState:&v95 objects:v109 count:16];
    }

    while (v68);
  }

  else
  {
    uint64_t v69 = 0LL;
    float v71 = 0.0;
  }

  v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%-15s %5d %15.0f %10.0f\n",  [@"Total" UTF8String],  v69,  v71,  (float)(v71 / (float)(int)v69)));
  [v92 appendString:v80];

  return v92;
}

uint64_t HTTelemetryHasRunThisBoot()
{
  v0 = sem_open("hangtelemetryd.onceatboot", 0);
  if (v0 == (sem_t *)-1LL)
  {
    if (*__error() == 2) {
      return 0LL;
    }
    id v2 = shared_ht_log_handle();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *__error();
      v5[0] = 67109120;
      v5[1] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "sem_open() failed: %{errno}d",  (uint8_t *)v5,  8u);
    }
  }

  else
  {
    sem_close(v0);
  }

  return 1LL;
}

void HTTelemetryCheckForUpdates(void *a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003A70;
  block[3] = &unk_100014540;
  id v4 = a1;
  uint64_t v1 = qword_10001A190;
  id v2 = v4;
  if (v1 != -1) {
    dispatch_once(&qword_10001A190, block);
  }
}

void sub_100003A70(uint64_t a1)
{
  int HasRunThisBoot = HTTelemetryHasRunThisBoot();
  id v3 = shared_ht_log_handle();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  empty = v4;
  if (HasRunThisBoot)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10000BF6C(empty);
    }
  }

  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, empty, OS_LOG_TYPE_INFO, "Updating telemetry", (uint8_t *)&v13, 2u);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    mach_service = xpc_connection_create_mach_service("com.apple.hangtelemetryd", v7, 0LL);

    xpc_connection_set_event_handler(mach_service, &stru_1000144D8);
    xpc_connection_activate(mach_service);
    empty = (os_log_s *)xpc_dictionary_create_empty();
    xpc_dictionary_set_uint64(empty, "command", 1uLL);
    xpc_object_t v9 = xpc_connection_send_message_with_reply_sync(mach_service, empty);
    if (xpc_get_type(v9) == (xpc_type_t)&_xpc_type_error)
    {
      id v10 = shared_ht_log_handle();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        string = xpc_dictionary_get_string(v9, _xpc_error_key_description);
        int v13 = 136315138;
        v14 = string;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received error updating telemetry: %s",  (uint8_t *)&v13,  0xCu);
      }
    }

    dispatch_sync(*(dispatch_queue_t *)(a1 + 32), &stru_100014518);
  }
}

void sub_100003C40(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  [v1 refreshHTPrefs];
}

id sub_100003C74(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v36 = a2;
  v34 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id obj = v5;
  id v31 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v31)
  {
    uint64_t v30 = a3 ^ 1u;
    uint64_t v29 = *(void *)v50;
    NSURLResourceKey v6 = NSURLIsDirectoryKey;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v50 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v7;
        uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  *(void *)(*((void *)&v49 + 1) + 8 * v7)));
        xpc_object_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        v55[0] = v6;
        v55[1] = NSURLNameKey;
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 2LL));
        v32 = (void *)v8;
        v11 = (void *)objc_claimAutoreleasedReturnValue( [v9 enumeratorAtURL:v8 includingPropertiesForKeys:v10 options:v30 errorHandler:&stru_100014580]);

        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        id v38 = v11;
        id v12 = [v38 countByEnumeratingWithState:&v45 objects:v54 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v46;
          uint64_t v35 = *(void *)v46;
          do
          {
            v15 = 0LL;
            id v37 = v13;
            do
            {
              if (*(void *)v46 != v14) {
                objc_enumerationMutation(v38);
              }
              v16 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)v15);
              v17 = objc_autoreleasePoolPush();
              id v44 = 0LL;
              [v16 getResourceValue:&v44 forKey:v6 error:0];
              id v18 = v44;
              if (([v18 BOOLValue] & 1) == 0)
              {
                id v43 = 0LL;
                [v16 getResourceValue:&v43 forKey:NSURLNameKey error:0];
                id v19 = v43;
                v20 = (void *)objc_claimAutoreleasedReturnValue([v19 lastPathComponent]);
                __int128 v39 = 0u;
                __int128 v40 = 0u;
                __int128 v41 = 0u;
                __int128 v42 = 0u;
                id v21 = v36;
                id v22 = [v21 countByEnumeratingWithState:&v39 objects:v53 count:16];
                if (v22)
                {
                  id v23 = v22;
                  uint64_t v24 = *(void *)v40;
                  while (2)
                  {
                    for (i = 0LL; i != v23; i = (char *)i + 1)
                    {
                      if (*(void *)v40 != v24) {
                        objc_enumerationMutation(v21);
                      }
                      if ([v20 hasPrefix:*(void *)(*((void *)&v39 + 1) + 8 * (void)i)])
                      {

                        id v21 = (id)objc_claimAutoreleasedReturnValue([v16 path]);
                        -[NSMutableArray addObject:](v34, "addObject:", v21);
                        goto LABEL_22;
                      }
                    }

                    id v23 = [v21 countByEnumeratingWithState:&v39 objects:v53 count:16];
                    if (v23) {
                      continue;
                    }
                    break;
                  }

LABEL_22:
                  NSURLResourceKey v6 = NSURLIsDirectoryKey;
                  uint64_t v14 = v35;
                }

                id v13 = v37;
              }

              objc_autoreleasePoolPop(v17);
              v15 = (char *)v15 + 1;
            }

            while (v15 != v13);
            id v13 = [v38 countByEnumeratingWithState:&v45 objects:v54 count:16];
          }

          while (v13);
        }

        uint64_t v7 = v33 + 1;
      }

      while ((id)(v33 + 1) != v31);
      id v31 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
    }

    while (v31);
  }

  id v26 = -[NSMutableArray copy](v34, "copy");
  return v26;
}

LABEL_24:
    +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 0.5);
    v20 = v20 + 0.5;
  }

  while (v20 < 60.0);
  uint64_t v30 = shared_ht_log_handle();
  uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v70 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Error creating hang logs archive, timed out after %f seconds.",  buf,  0xCu);
  }

  id v18 = (NSMutableArray *)&__NSArray0__struct;
LABEL_44:

LABEL_45:
  return v18;
}

id getListOfHangArchiveFiles(void *a1)
{
  uint64_t v8 = a1;
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  uint64_t v7 = @"ArchivedHangs";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));

  id v4 = sub_100003C74(v2, v3, 0);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

BOOL sub_10000410C(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = shared_ht_log_handle();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Error handling url %@: %@",  (uint8_t *)&v9,  0x16u);
  }

  return 1;
}

double timebaseConversionFactor()
{
  if (qword_10001A1A0 != -1) {
    dispatch_once(&qword_10001A1A0, &stru_1000145A0);
  }
  return *(double *)&qword_10001A198;
}

void sub_10000421C(id a1)
{
  *(double *)&qword_10001A198 = (float)((float)((float)info.numer * 0.000001) / (float)info.denom);
}

double MATU_TO_MS(unint64_t a1)
{
  if (qword_10001A1A0 != -1) {
    dispatch_once(&qword_10001A1A0, &stru_1000145A0);
  }
  return *(double *)&qword_10001A198 * (double)a1;
}

uint64_t checkForAssertionOverlap(unint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7 = 0LL;
  unint64_t v54 = 0LL;
  int v8 = 0;
  unint64_t v51 = a2 - a1;
  uint64_t v53 = a3 + 32;
  do
  {
    if (*(void *)(a3 + v7))
    {
      ++v8;
      uint64_t v9 = a3 + v7;
      unint64_t v10 = *(void *)(a3 + v7 + 24);
      if (v10 >= *(void *)(a3 + v7 + 16)) {
        unint64_t v10 = *(void *)(a3 + v7 + 16);
      }
      unint64_t v11 = *(void *)(a3 + v7 + 8) <= a1 ? a1 : *(void *)(a3 + v7 + 8);
      unint64_t v12 = v10 >= a2 ? a2 : v10;
      if (v12 > v11)
      {
        id v13 = shared_ht_log_handle();
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          double v15 = *(double *)(a3 + v7);
          double v16 = *(double *)(v9 + 8);
          uint64_t v17 = *(void *)(v9 + 24);
          *(_DWORD *)buf = 134219266;
          double v60 = v15;
          __int16 v61 = 2080;
          *(void *)&double v62 = v53 + v7;
          __int16 v63 = 2048;
          double v64 = v16;
          __int16 v65 = 2048;
          uint64_t v66 = v17;
          __int16 v67 = 2048;
          unint64_t v68 = a1;
          __int16 v69 = 2048;
          unint64_t v70 = a2;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "HTAssertion: checkOverlap: hang overlaps with assertion, assertionid=%llu assertionname=(%s) start=%llu end= %llu, hangstart=%llu, hangend=%llu)",  buf,  0x3Eu);
        }

        if (*(_BYTE *)(a3 + v7 + 96))
        {
          if (*(void *)(v9 + 24) < a2)
          {
            id v18 = shared_ht_log_handle();
            id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              v20 = v19;
              id v21 = "HTAssertion: checkOverlap: not ignoring hang during screen turning on";
LABEL_21:
              uint32_t v23 = 2;
LABEL_22:
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v21, buf, v23);
              goto LABEL_23;
            }

            goto LABEL_23;
          }

          if (*(void *)(v9 + 8) > a1)
          {
            id v22 = shared_ht_log_handle();
            id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              v20 = v19;
              id v21 = "HTAssertion: checkOverlap: not ignoring hang during screen turning off";
              goto LABEL_21;
            }

LABEL_23:
            goto LABEL_30;
          }

          double v24 = MATU_TO_MS(v51);
          id v25 = shared_ht_log_handle();
          id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          id v19 = v26;
          if (v24 >= 1000.0)
          {
            if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
              goto LABEL_23;
            }
            double v27 = MATU_TO_MS(v51);
            *(_DWORD *)buf = 134217984;
            double v60 = v27;
            v20 = v19;
            id v21 = "HTAssertion: checkOverlap: not ignoring hang during screen off with duration %.0fms";
            uint32_t v23 = 12;
            goto LABEL_22;
          }

          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            sub_10000C014(v57, v51, &v58, v19);
          }
        }

        v54 += v12 - v11;
        if (a4)
        {
          v56[0] = _NSConcreteStackBlock;
          v56[1] = 3221225472LL;
          v56[2] = sub_1000047A8;
          v56[3] = &unk_1000145C0;
          v56[4] = v12;
          v56[5] = v11;
          v56[6] = v9 + 32;
          AnalyticsSendEventLazy(@"com.apple.hangtracer.assertion_overlap", v56);
        }
      }
    }

LABEL_30:
    v7 += 104LL;
  }

  while (v7 != 1040);
  if (!v8)
  {
    id v33 = shared_ht_log_handle();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      sub_10000BFAC(v34, v35, v36, v37, v38, v39, v40, v41);
    }
    goto LABEL_48;
  }

  double v28 = MATU_TO_MS(v54);
  double v29 = MATU_TO_MS(v51) - v28;
  if (v29 >= 250.0)
  {
    id v42 = shared_ht_log_handle();
    id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    v34 = v43;
    if (v54)
    {
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v60 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "HTAssertion: checkOverlap: hang partially overlaps assertions, since hangDurationWithoutOverlap=%fms does not qualify as assertion overlap",  buf,  0xCu);
      }
    }

    else if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      sub_10000BFE0(v34, v44, v45, v46, v47, v48, v49, v50);
    }

LABEL_48:
    return 0LL;
  }

  id v30 = shared_ht_log_handle();
  id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    double v60 = v28;
    __int16 v61 = 2048;
    double v62 = (double)v54 * 100.0 / (double)v51;
    __int16 v63 = 2048;
    double v64 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "HTAssertion: checkOverlap: hang overlaps assertion for %f ms (%f %%), hangDurationWithoutOverlap=%fms -> qualifies as assertion overlap",  buf,  0x20u);
  }

  if (a4)
  {
    HTAggdPushValueForDistributionKey(@"com.apple.ht_assertion_stats.hang_overlap_ms", v28);
    HTAggdPushValueForDistributionKey( @"com.apple.ht_assertion_stats.hang_overlap_percent",  (double)v54 * 100.0 / (double)v51);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    void v55[2] = sub_10000487C;
    v55[3] = &unk_1000145E0;
    *(double *)&v55[4] = v28;
    *(double *)&v55[5] = (double)v54 * 100.0 / (double)v51;
    AnalyticsSendEventLazy(@"com.apple.hangtracer.assertion_overlap", v55);
  }

  return 1LL;
}

id sub_1000047A8(void *a1)
{
  v6[0] = @"assertionOverlapMs";
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a1[4] - a1[5]));
  v6[1] = @"assertionOverlapName";
  v7[0] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1[6]));
  v7[1] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));

  return v4;
}

id sub_10000487C(uint64_t a1)
{
  v6[0] = @"hangDurationOverlapMs";
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 32)));
  v6[1] = @"hangDurationOverlapPercent";
  v7[0] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 40)));
  v7[1] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));

  return v4;
}

void sub_100004948( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100004998(id a1)
{
  v3[0] = @"HTProfile";
  v3[1] = @"HTEPL";
  v3[2] = @"HTThirdPartyDevSupport";
  v3[3] = @"PLTasking";
  v3[4] = &stru_100014D38;
  v3[5] = @"PDSEHangTracer";
  v3[6] = @"PDSEHTThirdParty";
  v3[7] = @"PDSEWorkflowResponsiveness";
  v3[8] = @"PDSEHTRateOnly";
  v3[9] = @"PDSESentry";
  v3[10] = @"PDSEAppLaunch";
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 11LL));
  id v2 = (void *)qword_10001A1B0;
  qword_10001A1B0 = v1;
}
}

  ;
}

  ;
}

  ;
}

void sub_100006780(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___HTPrefs);
  id v2 = (void *)qword_10001A1B8;
  qword_10001A1B8 = (uint64_t)v1;
}

void sub_100008694( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

void sub_1000086F8(uint64_t a1, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) == a2)
  {
    id v3 = shared_ht_log_handle();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v5 = "HTPrefs: Tasking Changed";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v5, buf, 2u);
    }
  }

  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) == a2)
  {
    id v6 = shared_ht_log_handle();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v5 = "HTPrefs: Telemetry Changed";
      goto LABEL_16;
    }
  }

  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) == a2)
  {
    id v7 = shared_ht_log_handle();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v5 = "HTPrefs: Profile List Changed";
      goto LABEL_16;
    }
  }

  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) == a2)
  {
    id v8 = shared_ht_log_handle();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v5 = "HTPrefs: EPL State Changed";
      goto LABEL_16;
    }
  }

  else
  {
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) != a2) {
      goto LABEL_18;
    }
    id v9 = shared_ht_log_handle();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v5 = "HTPrefs: HT Self-Enablement State Changed Triggered Refresh";
      goto LABEL_16;
    }
  }

LABEL_18:
  unint64_t v10 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  unsigned int v12 = [WeakRetained hangtracerDaemonEnabled];

  [*(id *)(a1 + 32) refreshHTPrefs];
  id v13 = objc_loadWeakRetained((id *)(a1 + 80));
  LODWORD(WeakRetained) = [v13 hangtracerDaemonEnabled];

  if (v12 != (_DWORD)WeakRetained)
  {
    id v14 = shared_ht_log_handle();
    double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      if (v12) {
        double v16 = @"ON";
      }
      else {
        double v16 = @"OFF";
      }
      id v17 = objc_loadWeakRetained(v10);
      else {
        id v18 = @"OFF";
      }
      *(_DWORD *)buf = 138412546;
      double v27 = v16;
      __int16 v28 = 2112;
      double v29 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "HTPrefs: HangTracer Enabled State Changed: %@ -> %@",  buf,  0x16u);
    }

    id v19 = objc_loadWeakRetained(v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(v19, "hangtracerDaemonEnabled", @"Enabled")));
    id v25 = v20;
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));

    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v23 = objc_loadWeakRetained(v10);
    [v22 postNotificationName:@"com.apple.hangtracer.daemonstate" object:v23 userInfo:v21];
  }

void sub_100008A48(uint64_t a1, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == a2)
  {
    id v2 = shared_ht_log_handle();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "HTPrefs: Test Reset Log Limits", v4, 2u);
    }
  }

void sub_100009490(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

  ;
}

id alwaysOnSignpost()
{
  if (qword_10001A1D0 != -1) {
    dispatch_once(&qword_10001A1D0, &stru_100014690);
  }
  return (id)qword_10001A1C8;
}

void sub_100009508(id a1)
{
  os_log_t v1 = os_log_create("com.apple.hangtracer", "always_on_hang");
  id v2 = (void *)qword_10001A1C8;
  qword_10001A1C8 = (uint64_t)v1;
}

void signpostHangInterval(void *a1, void *a2, os_signpost_id_t a3, uint64_t a4, void *a5)
{
  id v9 = a1;
  unint64_t v10 = a2;
  id v11 = a5;
  mach_get_times(buf, &v18, 0LL);
  uint64_t v12 = v18;
  uint64_t v13 = *(void *)buf;
  if (os_signpost_enabled((os_log_t)v11))
  {
    id v14 = (os_log_s *)v11;
    double v15 = v14;
    if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      double v16 = @"Unknown";
      *(_DWORD *)buf = 134349826;
      *(void *)&uint8_t buf[4] = v12 - v13 + a3;
      if (v10) {
        id v17 = v10;
      }
      else {
        id v17 = @"Unknown";
      }
      __int16 v20 = 2050;
      uint64_t v21 = v12 - v13 + a4;
      __int16 v22 = 2114;
      if (v9) {
        double v16 = v9;
      }
      id v23 = v17;
      __int16 v24 = 2114;
      id v25 = v16;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_EVENT,  a3,  "HangInterval",  "%{public, signpost.description:begin_time}llu, %{public, signpost.description:end_time}llu, BundleIdOverride=%{p ublic, signpost.description:attribute}@ type=%{public, signpost.telemetry:string2}@ enableTelemetry=YES ",  buf,  0x2Au);
    }
  }
}

uint64_t isAppBeingDebugged(int a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 environment]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"HT_DISABLE_DEBUGGER_CHECK"]);
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    id v6 = shared_ht_log_handle();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Check for app is being debugged is disabled",  buf,  2u);
    }

    return 0LL;
  }

  if (!proc_pidinfo(a1, 13, 1uLL, buf, 64))
  {
    id v9 = shared_ht_log_handle();
    unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Failed to check if app is being debugged",  (uint8_t *)&v15,  2u);
    }

    uint64_t v8 = 0LL;
    goto LABEL_18;
  }

  if ((v20[16] & 2) != 0)
  {
    unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v20));
    if ((-[os_log_s isEqualToString:](v10, "isEqualToString:", @"xctest") & 1) != 0
      || (-[os_log_s isEqualToString:](v10, "isEqualToString:", @"hangman") & 1) != 0
      || -[os_log_s hasSuffix:](v10, "hasSuffix:", @"-Runner"))
    {
      id v11 = shared_ht_log_handle();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543618;
        double v16 = v10;
        __int16 v17 = 1024;
        int v18 = a1;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [%d] is a test process, isAppBeingDebugged returning NO",  (uint8_t *)&v15,  0x12u);
      }

      uint64_t v8 = 0LL;
    }

    else
    {
      id v14 = shared_ht_log_handle();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "App is being debugged, do not track this hang",  (uint8_t *)&v15,  2u);
      }

      uint64_t v8 = 1LL;
    }

LABEL_18:
    return v8;
  }

  return 0LL;
}

__CFString *getStringForSubtype(unint64_t a1)
{
  if (a1 <= 0xA) {
    a1 = *off_1000146B0[a1];
  }
  return (__CFString *)(id)a1;
}

id HTGetHomeDirectoryURL()
{
  v0 = NSHomeDirectoryForUser(@"mobile");
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  if (v1) {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v1, 1LL));
  }
  else {
    id v2 = 0LL;
  }

  return v2;
}

id HTCAQueue()
{
  if (qword_10001A1E8[0] != -1) {
    dispatch_once(qword_10001A1E8, &stru_100014A60);
  }
  return (id)qword_10001A1E0;
}

void sub_10000A3D0(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_attr_t v2 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_BACKGROUND, 0);
  id v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v2);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.hangtracer.coreanalytics", v3);
  unsigned int v5 = (void *)qword_10001A1E0;
  qword_10001A1E0 = (uint64_t)v4;
}

id sub_10000A440()
{
  if (qword_10001A210 != -1) {
    dispatch_once(&qword_10001A210, &stru_100014B20);
  }
  return (id)qword_10001A208;
}

void sub_10000A608()
{
  id v0 = sub_10000A63C();
  dispatch_queue_attr_t v1 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v0);
  dispatch_async(v1, &stru_100014B60);
}

id sub_10000A63C()
{
  if (qword_10001A228 != -1) {
    dispatch_once(&qword_10001A228, &stru_100014BA0);
  }
  return (id)qword_10001A220;
}

void sub_10000A67C(uint64_t a1)
{
  if (qword_10001A1F8)
  {
    *(_OWORD *)keys = *(_OWORD *)off_100014A80;
    id v6 = "startTime";
    values[0] = xpc_int64_create(6LL);
    values[1] = xpc_uint64_create(*(void *)(*(void *)(a1 + 32) + 8LL));
    values[2] = xpc_uint64_create(*(void *)(*(void *)(a1 + 32) + 16LL));
    xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
    xpc_connection_send_message((xpc_connection_t)qword_10001A1F8, v2);

    for (uint64_t i = 2LL; i != -1; --i)
  }

void sub_10000A7E0(uint64_t a1)
{
  if (qword_10001A1F8)
  {
    *(_OWORD *)keys = *(_OWORD *)off_100014AC0;
    __int128 v6 = *(_OWORD *)off_100014AD0;
    v4[0] = xpc_int64_create(7LL);
    v4[1] = xpc_uint64_create(*(void *)(*(void *)(a1 + 32) + 8LL));
    v4[2] = xpc_uint64_create(*(void *)(*(void *)(a1 + 32) + 16LL));
    v4[3] = xpc_uint64_create(*(void *)(a1 + 40));
    xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, v4, 4uLL);
    xpc_connection_send_message((xpc_connection_t)qword_10001A1F8, v2);

    for (uint64_t i = 3LL; i != -1; --i)
  }

void sub_10000A948(uint64_t a1)
{
  if (qword_10001A1F8)
  {
    *(_OWORD *)keys = *(_OWORD *)off_100014AC0;
    __int128 v6 = *(_OWORD *)off_100014AD0;
    v4[0] = xpc_int64_create(8LL);
    v4[1] = xpc_uint64_create(*(void *)(*(void *)(a1 + 32) + 8LL));
    v4[2] = xpc_uint64_create(*(void *)(*(void *)(a1 + 32) + 16LL));
    v4[3] = xpc_uint64_create(*(void *)(a1 + 40));
    xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, v4, 4uLL);
    xpc_connection_send_message((xpc_connection_t)qword_10001A1F8, v2);

    for (uint64_t i = 3LL; i != -1; --i)
  }

void HTCollectHangLogsBundle(void *a1, char a2)
{
  id v3 = a1;
  sub_10000A608();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000AADC;
  v8[3] = &unk_100014B00;
  id v9 = v3;
  char v10 = a2;
  id v4 = v3;
  unsigned int v5 = objc_retainBlock(v8);
  id v6 = sub_10000A63C();
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  dispatch_sync(v7, v5);
}

void sub_10000AADC(uint64_t a1)
{
  if (qword_10001A1F8)
  {
    *(_OWORD *)keys = *(_OWORD *)off_100014AE0;
    id v6 = "archiveCompressionBypass";
    values[0] = xpc_int64_create(11LL);
    values[1] = xpc_string_create((const char *)[*(id *)(a1 + 32) UTF8String]);
    values[2] = xpc_BOOL_create(*(_BYTE *)(a1 + 40));
    xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
    xpc_connection_send_message((xpc_connection_t)qword_10001A1F8, v2);

    for (uint64_t i = 2LL; i != -1; --i)
  }

void HTCheckForHangForHTMonitor(uint64_t a1, uint64_t a2)
{
  id v4 = shared_ht_log_handle();
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = *(_DWORD *)(a1 + 48);
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "HTCheckForHangForHTMonitor: check hang for  pid=%u ",  (uint8_t *)v7,  8u);
  }

  sub_10000AC84(a1, 1, a2);
}

void sub_10000AC84(uint64_t a1, int a2, uint64_t a3)
{
  if (!*(_BYTE *)(a1 + 372))
  {
    uint64_t v6 = mach_absolute_time();
    os_signpost_id_t v7 = *(void *)a1;
    double v8 = MATU_TO_MS((unint64_t)((double)v6 - (double)*(unint64_t *)a1));
    if (v8 > 100.0)
    {
      if (a2)
      {
        os_signpost_id_t v9 = *(void *)(a1 + 40);
        uint64_t v10 = 606208008LL;
        os_signpost_id_t v11 = v7;
        uint64_t v12 = v6;
        uint64_t v13 = 0LL;
      }

      else
      {
        os_signpost_id_t v9 = HIDWORD(v7);
        uint64_t v13 = HIDWORD(v6);
        uint64_t v10 = 606208004LL;
        os_signpost_id_t v11 = v7;
        uint64_t v12 = v6;
      }

      kdebug_trace(v10, v11, v12, v9, v13);
    }

    if (*(_BYTE *)(a1 + 29)) {
      BOOL v14 = v8 > (double)*(unint64_t *)(a1 + 8);
    }
    else {
      BOOL v14 = 0;
    }
    if (v8 < 250.0 && !v14)
    {
      if (!a2) {
        return;
      }
      id v24 = shared_ht_log_handle();
      __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v25 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)buf = 67109120;
        LODWORD(v66) = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "checkForHang:Hang is not detected for pid @%u during user switched away from App",  buf,  8u);
      }

      goto LABEL_64;
    }

    unint64_t v16 = 1LL;
    if (a2)
    {
      *(_BYTE *)(a1 + 372) = 1;
      unint64_t v16 = 10LL;
    }

    __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1 + 116));
    if (isAppBeingDebugged(*(_DWORD *)(a1 + 48)))
    {
      id v18 = shared_ht_log_handle();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v66 = v8 / 1000.0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Hang detected: %.2fs (debugger attached, not reporting)",  buf,  0xCu);
      }

      HTAggdPushValueForDistributionKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.ht_debugger_attached.%s.%s",  a1 + 52,  a1 + 116),  v8);
      sub_10000B708(6LL, v17, v8);
      id v20 = alwaysOnSignpost();
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      signpostHangInterval(@"Debugger Attached Runloop Hang", v17, v7, v6, v21);

      if (!*(_BYTE *)(a1 + 29)) {
        goto LABEL_64;
      }
      __int16 v22 = kHangTracerCoreAnalyticsEvent[0];
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472LL;
      v61[2] = sub_10000B7AC;
      v61[3] = &unk_100014BC8;
      uint64_t v63 = 6LL;
      double v62 = v17;
      double v64 = v8;
      AnalyticsSendEventLazy(v22, v61);
      id v23 = (dispatch_queue_s *)v62;
    }

    else
    {
      if ((a2 & 1) == 0 && alm_app_measurement_ongoing())
      {
        id v26 = shared_ht_log_handle();
        double v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          double v66 = v8 / 1000.0;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Hang detected: %.2fs (overlaps extended launch)",  buf,  0xCu);
        }

        HTAggdPushValueForDistributionKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.ht_extended_launch_overlap.%s.%s",  a1 + 52,  a1 + 116),  v8);
        unint64_t v16 = 7LL;
      }

      if (a3 && checkForAssertionOverlap(v7, v6, a3, 1))
      {
        id v28 = shared_ht_log_handle();
        double v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          double v66 = v8 / 1000.0;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Hang detected: %.2fs (overlaps with non-responsive assertion)",  buf,  0xCu);
        }

        HTAggdPushValueForDistributionKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.ht_assertion_overlap.%s.%s",  a1 + 52,  a1 + 116),  v8);
        unint64_t v16 = 9LL;
        sub_10000B708(9LL, v17, v8);
      }

      else
      {
        id v30 = shared_ht_log_handle();
        id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          double v66 = v8 / 1000.0;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Hang detected: %.2fs (always-on hang reporting)",  buf,  0xCu);
        }

        HTAggdPushValueForDistributionKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.ht_always_on.%s.%s",  a1 + 52,  a1 + 116),  v8);
        sub_10000B708(v16, v17, v8);
        StringForSubtype = getStringForSubtype(v16);
        id v33 = (void *)objc_claimAutoreleasedReturnValue(StringForSubtype);
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1 + 116));
        id v35 = alwaysOnSignpost();
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        signpostHangInterval(v33, v34, v7, v6, v36);

        if (v8 < 250.0)
        {
          id v37 = shared_ht_log_handle();
          uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
            sub_10000C494(v38, v8);
          }
        }
      }

      if (!*(_BYTE *)(a1 + 29)) {
        goto LABEL_64;
      }
      BOOL v39 = v14;
      if (v8 < 250.0) {
        BOOL v39 = 1;
      }
      if (v39 || !*(_BYTE *)(a1 + 30))
      {
        BOOL v42 = 0;
      }

      else
      {
        double v40 = (double)arc4random_uniform(0xFFFFFFFF) * 100.0 / 4294967300.0;
        double v41 = *(double *)(a1 + 16);
        BOOL v42 = v40 < v41;
        id v43 = shared_ht_log_handle();
        uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          uint64_t v45 = @"(diceRoll over threshold)";
          if (v40 < v41) {
            uint64_t v45 = @"(diceRoll under threshold)";
          }
          double v55 = v45;
          double v56 = *(const __CFString **)(a1 + 16);
          uint64_t v46 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v40 < v41));
          *(_DWORD *)buf = 134218754;
          double v66 = v40;
          __int16 v67 = 2048;
          unint64_t v68 = v56;
          __int16 v69 = 2112;
          unint64_t v70 = v46;
          __int16 v71 = 2112;
          v72 = v55;
          _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_INFO,  "Micro Hang Sampling: random sampling diceRoll=%.2f samplingPercent=%.2f%% -> shouldCapture=%@ %@",  buf,  0x2Au);
        }
      }

      if (v8 < 250.0) {
        goto LABEL_64;
      }
      id v47 = shared_ht_log_handle();
      uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v49 = @"(over capture threshold)";
        if (!v14) {
          uint64_t v49 = @"(not over capture threshold)";
        }
        *(_DWORD *)buf = 134218498;
        double v66 = v8 / 1000.0;
        __int16 v67 = 2112;
        unint64_t v68 = v49;
        if (!v14 && v42) {
          uint64_t v50 = @", (capture microhang)";
        }
        else {
          uint64_t v50 = &stru_100014D38;
        }
        __int16 v69 = 2112;
        unint64_t v70 = v50;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Hang detected: %.2fs %@ %@", buf, 0x20u);
      }

      uint64_t v51 = *(void *)(a1 + 40);
      char v57 = *(_BYTE *)(a1 + 28);
      BOOL v52 = v42;
      if (a2) {
        uint64_t v53 = 13LL;
      }
      else {
        uint64_t v53 = 3LL;
      }
      id v54 = sub_10000A63C();
      id v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v54);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000B8AC;
      block[3] = &unk_100014C30;
      void block[4] = v53;
      block[5] = a1 + 52;
      block[6] = v51;
      block[7] = v7;
      char v59 = v57;
      block[8] = v6;
      block[9] = v16;
      block[10] = a1;
      BOOL v60 = v52;
      dispatch_async(v23, block);
    }

LABEL_64:
  }

void sub_10000B428(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.hangtracer.prefsqueue", 0LL);
  xpc_object_t v2 = (void *)qword_10001A208;
  qword_10001A208 = (uint64_t)v1;
}

void sub_10000B454(id a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000B4D0;
  block[3] = &unk_100014540;
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.hangtracer.fencePrefs", 0LL);
  dispatch_queue_t v1 = v3;
  dispatch_async(v1, block);
}

void sub_10000B4D0(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  [v2 setupPrefsWithQueue:*(void *)(a1 + 32)];
}

void sub_10000B514(id a1)
{
  if (!qword_10001A1F8)
  {
    id v1 = sub_10000A63C();
    id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v1);
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.hangtracerd", v2, 0LL);
    id v4 = (void *)qword_10001A1F8;
    qword_10001A1F8 = (uint64_t)mach_service;

    xpc_connection_set_event_handler((xpc_connection_t)qword_10001A1F8, &stru_100014B80);
    xpc_connection_resume((xpc_connection_t)qword_10001A1F8);
  }

void sub_10000B588(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  dispatch_queue_t v3 = xpc_copy_description(v2);
  xpc_type_t type = xpc_get_type(v2);

  if (type != (xpc_type_t)&_xpc_type_error)
  {
    id v5 = shared_ht_log_handle();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = (uint64_t)v3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received unhandled event from daemon: %s",  (uint8_t *)&v9,  0xCu);
    }

LABEL_8:
    goto LABEL_9;
  }

  if (qword_10001A1F8)
  {
    id v7 = shared_ht_log_handle();
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218242;
      uint64_t v10 = qword_10001A1F8;
      __int16 v11 = 2080;
      uint64_t v12 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "XPC Error when we still had a connection (%p): %s",  (uint8_t *)&v9,  0x16u);
    }

    uint64_t v6 = (os_log_s *)qword_10001A1F8;
    qword_10001A1F8 = 0LL;
    goto LABEL_8;
  }

LABEL_9:
  free(v3);
}

void sub_10000B6DC(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.hangtracer.connectionqueue", 0LL);
  id v2 = (void *)qword_10001A220;
  qword_10001A220 = (uint64_t)v1;
}

void sub_10000B708(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  id v6 = HTCAQueue();
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000B9E8;
  block[3] = &unk_100014C58;
  id v10 = v5;
  uint64_t v11 = a1;
  double v12 = a3;
  id v8 = v5;
  dispatch_async(v7, block);
}

id sub_10000B7AC(uint64_t a1)
{
  v9[0] = kHTCoreAnalyticsDaemonEnabled[0];
  v8[0] = kHTCoreAnalyticsMode[0];
  v8[1] = kHTCoreAnalyticsHangType[0];
  StringForSubxpc_type_t type = getStringForSubtype(*(void *)(a1 + 40));
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(StringForSubtype);
  uint64_t v4 = *(void *)(a1 + 32);
  v9[1] = v3;
  v9[2] = v4;
  v8[2] = kHTCoreAnalyticsHangBundleID[0];
  v8[3] = kHTCoreAnalyticsHangDuration[0];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 48)));
  v9[3] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  4LL));

  return v6;
}

void sub_10000B8AC(uint64_t a1)
{
  if (qword_10001A1F8)
  {
    __int128 v7 = *(_OWORD *)off_100014C08;
    __int128 v8 = *(_OWORD *)off_100014C18;
    int v9 = "saveMicroHang";
    *(_OWORD *)keys = *(_OWORD *)off_100014BE8;
    __int128 v6 = *(_OWORD *)off_100014BF8;
    values[0] = xpc_int64_create(*(void *)(a1 + 32));
    values[1] = xpc_string_create(*(const char **)(a1 + 40));
    values[2] = xpc_int64_create(*(void *)(a1 + 48));
    xpc_object_t values[3] = xpc_int64_create(*(void *)(a1 + 56));
    values[4] = xpc_int64_create(*(void *)(a1 + 64));
    values[5] = xpc_BOOL_create(*(_BYTE *)(a1 + 88) != 0);
    values[6] = xpc_int64_create(*(void *)(a1 + 72));
    values[7] = xpc_int64_create(*(int *)(*(void *)(a1 + 80) + 48LL));
    values[8] = xpc_BOOL_create(*(_BYTE *)(a1 + 89));
    xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, values, 9uLL);
    xpc_connection_send_message((xpc_connection_t)qword_10001A1F8, v2);

    for (uint64_t i = 8LL; i != -1; --i)
  }

void sub_10000B9E8(void *a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[2] = sub_10000BA70;
  v4[3] = &unk_100014BC8;
  xpc_object_t v2 = (void *)a1[4];
  uint64_t v6 = a1[5];
  dispatch_queue_t v3 = kHangTracerCoreAnalyticsEvent[0];
  v4[1] = 3221225472LL;
  id v5 = v2;
  uint64_t v7 = a1[6];
  AnalyticsSendEventLazy(v3, v4);
}

NSMutableDictionary *sub_10000BA70(uint64_t a1)
{
  id v2 = sub_10000A440();
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  HTTelemetryCheckForUpdates(v3);

  if (qword_10001A238 != -1) {
    dispatch_once(&qword_10001A238, &stru_100014C78);
  }
  if (!qword_10001A230) {
    goto LABEL_8;
  }
  if (statfs((const char *)[(id)qword_10001A230 fileSystemRepresentation], &v31))
  {
    id v4 = shared_ht_log_handle();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *__error();
      v30[0] = 67109120;
      v30[1] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Unable to get volume space info: %{errno}d",  (uint8_t *)v30,  8u);
    }

LABEL_8:
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    goto LABEL_10;
  }

  uint64_t v7 = v31.f_blocks * v31.f_bsize;
  uint64_t v8 = v31.f_bavail * v31.f_bsize;
LABEL_10:
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  id v10 = [v9 numOSCryptexFileExtents];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  id v12 = [v11 haveRootsInstalled];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  id v14 = [v13 haveNonDefaultFeatureFlags];

  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  id v16 = [v15 haveSerialLoggingEnabled];

  __int16 v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  kHTCoreAnalyticsAlwaysOn[0],  kHTCoreAnalyticsMode[0]);
  StringForSubxpc_type_t type = getStringForSubtype(*(void *)(a1 + 40));
  id v19 = (void *)objc_claimAutoreleasedReturnValue(StringForSubtype);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v19,  kHTCoreAnalyticsHangType[0]);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 32),  kHTCoreAnalyticsHangBundleID[0]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 48)));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v20,  kHTCoreAnalyticsHangDuration[0]);

  if (v7)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (double)v8 * 100.0 / (double)v7));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v21,  kHTCoreAnalyticsDiskAvailablePercent[0]);

    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v8));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v22,  kHTCoreAnalyticsDiskAvailableBytes[0]);
  }

  if ((int)v10 >= 1)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v23,  kHTCoreAnalyticsNumOSCryptexFileExtents[0]);
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v14));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v24,  kHTCoreAnalyticsHaveNonDefaultFeatureFlags[0]);

  int v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v16));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v25,  kHTCoreAnalyticsHaveSerialLoggingEnabled[0]);

  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v12));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v26,  kHTCoreAnalyticsHaveRootsInstalled);

  id v27 = shared_ht_log_handle();
  id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v31.f_bsize = 138412290;
    *(void *)&v31.f_iosize = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "Logging always-on telemetry: %@",  (uint8_t *)&v31,  0xCu);
  }

  return v17;
}

void sub_10000BE5C(id a1)
{
  id v1 = HTGetHomeDirectoryURL();
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v3 = (void *)qword_10001A230;
  qword_10001A230 = v2;

  if (!qword_10001A230)
  {
    id v4 = shared_ht_log_handle();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unable to get home dir URL", v6, 2u);
    }
  }

id shared_ht_log_handle()
{
  if (qword_10001A248 != -1) {
    dispatch_once(&qword_10001A248, &stru_100014C98);
  }
  return (id)qword_10001A240;
}

void sub_10000BF3C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.hangtracer", "");
  uint64_t v2 = (void *)qword_10001A240;
  qword_10001A240 = (uint64_t)v1;
}

void sub_10000BF6C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Telemetry is current", v1, 2u);
}

void sub_10000BFAC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000BFE0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000C014(uint8_t *a1, unint64_t a2, double *a3, os_log_s *a4)
{
  double v7 = MATU_TO_MS(a2);
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a4,  OS_LOG_TYPE_DEBUG,  "HTAssertion: checkOverlap: ignoring hang during screen off with duration %.0fms",  a1,  0xCu);
}

void sub_10000C07C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "HTPrefs: %@ was not found in the %@ domain, a profile, by EPL, by PowerLog Tasking domain, by HT Self Enablement or by HT Sentry Enablement",  (uint8_t *)&v3,  0x16u);
}

void sub_10000C100(uint64_t a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)int v3 = 138412802;
  *(void *)&v3[4] = @"enablementPrefix";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  sub_100009490( (void *)&_mh_execute_header,  (uint64_t)a2,  a3,  "HTPrefs: %@: %@ -> %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16],  *a2);
  sub_1000094B4();
}

void sub_10000C184()
{
}

void sub_10000C218()
{
}

void sub_10000C2AC()
{
}

void sub_10000C340()
{
}

void sub_10000C3D4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Preparing prefInitList", v1, 2u);
}

void sub_10000C414()
{
  __assert_rtn("-[HTPrefs setupPrefsWithQueue:]", "HTPrefs.m", 1486, "prefsQueue != NULL");
}

void sub_10000C43C()
{
}

void sub_10000C468()
{
}

void sub_10000C494(os_log_t log, double a2)
{
  int v2 = 134218240;
  double v3 = a2;
  __int16 v4 = 1024;
  int v5 = 250;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Hang detected below aggd threshold: hang duration = %.2fms, aggd treshold = %.2dms",  (uint8_t *)&v2,  0x12u);
  sub_10000BEF4();
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend___createInternalSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__createInternalSettings");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSubsystem_category_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubsystem:category:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attachmentWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachmentWithPath:");
}

id objc_msgSend_beginDate(void *a1, const char *a2, ...)
{
  return _[a1 beginDate];
}

id objc_msgSend_beginEvent(void *a1, const char *a2, ...)
{
  return _[a1 beginEvent];
}

id objc_msgSend_beginWallTimeStringWithTimeZoneName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginWallTimeStringWithTimeZoneName:");
}

id objc_msgSend_BOOLProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLProperty:contextPrefixOut:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeInterval:sinceDate:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_doubleProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleProperty:contextPrefixOut:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_durationSeconds(void *a1, const char *a2, ...)
{
  return _[a1 durationSeconds];
}

id objc_msgSend_earlyInitNecessaryPrefs(void *a1, const char *a2, ...)
{
  return _[a1 earlyInitNecessaryPrefs];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return _[a1 endDate];
}

id objc_msgSend_endEvent(void *a1, const char *a2, ...)
{
  return _[a1 endEvent];
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_fenceTrackingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 fenceTrackingEnabled];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_hangtracerDaemonEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hangtracerDaemonEnabled];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_haveNonDefaultFeatureFlags(void *a1, const char *a2, ...)
{
  return _[a1 haveNonDefaultFeatureFlags];
}

id objc_msgSend_haveRootsInstalled(void *a1, const char *a2, ...)
{
  return _[a1 haveRootsInstalled];
}

id objc_msgSend_haveSerialLoggingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 haveSerialLoggingEnabled];
}

id objc_msgSend_hudEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hudEnabled];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_intProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intProperty:contextPrefixOut:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isInternal(void *a1, const char *a2, ...)
{
  return _[a1 isInternal];
}

id objc_msgSend_keysSortedByValueUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysSortedByValueUsingSelector:");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedStringFromDate_dateStyle_timeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringFromDate:dateStyle:timeStyle:");
}

id objc_msgSend_numOSCryptexFileExtents(void *a1, const char *a2, ...)
{
  return _[a1 numOSCryptexFileExtents];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectProperty_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectProperty:matchingSelector:contextPrefixOut:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_prefContextPrefixPriorityOrder(void *a1, const char *a2, ...)
{
  return _[a1 prefContextPrefixPriorityOrder];
}

id objc_msgSend_prefInitList(void *a1, const char *a2, ...)
{
  return _[a1 prefInitList];
}

id objc_msgSend_prefNamed_domain_profile_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prefNamed:domain:profile:matchingSelector:contextPrefixOut:");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 preferredLanguages];
}

id objc_msgSend_processID(void *a1, const char *a2, ...)
{
  return _[a1 processID];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processLogArchiveWithPath_startDate_endDate_errorOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processLogArchiveWithPath:startDate:endDate:errorOut:");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _[a1 processName];
}

id objc_msgSend_refreshHTPrefs(void *a1, const char *a2, ...)
{
  return _[a1 refreshHTPrefs];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDeleteOnAttach_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeleteOnAttach:");
}

id objc_msgSend_setIntervalCompletionProcessingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntervalCompletionProcessingBlock:");
}

id objc_msgSend_setMemoryLoggingIntervalSec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMemoryLoggingIntervalSec:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setShouldCompress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldCompress:");
}

id objc_msgSend_setShouldPostHTPrefsChangedNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPostHTPrefsChangedNotification:");
}

id objc_msgSend_setSubsystemCategoryFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubsystemCategoryFilter:");
}

id objc_msgSend_setupPrefsWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPrefsWithQueue:");
}

id objc_msgSend_setupPrefsWithQueue_profilePath_taskingDomainName_hangtracerDomain_setupInternalPrefs_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPrefsWithQueue:profilePath:taskingDomainName:hangtracerDomain:setupInternalPrefs:");
}

id objc_msgSend_sharedPrefs(void *a1, const char *a2, ...)
{
  return _[a1 sharedPrefs];
}

id objc_msgSend_shouldPostHTPrefsChangedNotification(void *a1, const char *a2, ...)
{
  return _[a1 shouldPostHTPrefsChangedNotification];
}

id objc_msgSend_sleepForTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sleepForTimeInterval:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringProperty:contextPrefixOut:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_unsignedIntProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntProperty:contextPrefixOut:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongProperty:contextPrefixOut:");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongValue];
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}