LABEL_12:
  objc_autoreleasePoolPop(v4);
  return v5 ^ 1;
}

void sub_1000038F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_autoreleasePoolPush();
  uint64_t v4 = CDGetLogHandle("client");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ENTRY, daily CacheDelete service", buf, 2u);
  }

  v7 = @"CACHE_DELETE_REQUIRED_ENTITLEMENTS";
  v8 = &off_1000098B8;
  uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  register_activity();
  CacheDeleteRegisterCallback(@"com.apple.mobile.cache_delete_daily", v6, &__block_literal_global_0);
  dispatch_main();
}

void register_activity()
{
}

__CFDictionary *__cdecl __main_block_invoke(id a1, __CFDictionary *a2)
{
  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v2,  "objectForKeyedSubscript:",  @"CACHE_DELETE_OPERATIONS"));
  v30 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = CDGetLogHandle("client");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "com.apple.mobile.cache_delete_daily Callback ENTRY, info: %@",  buf,  0xCu);
  }

  v29 = v2;

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = v3;
  id v6 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        unsigned int v11 = [v10 isEqualToString:@"CACHE_DELETE_ANALYTICS_REPORT"];
        uint64_t v12 = CDGetLogHandle("client");
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v11)
        {
          if (v14)
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received Analytics Report Request!",  buf,  2u);
          }

          id v15 = storageDailyStatsFilename();
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v16));
            if (v17)
            {
              *(void *)buf = 0LL;
              v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v17,  0LL,  0LL,  buf));
              id v18 = *(id *)buf;
              if (!v13)
              {
                uint64_t v19 = CDGetLogHandle("client");
                v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)v36 = 0;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Unable to de-serialize stats",  v36,  2u);
                }

                goto LABEL_22;
              }
            }

            else
            {
              uint64_t v21 = CDGetLogHandle("client");
              v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                v24 = __error();
                v25 = strerror(*v24);
                *(_DWORD *)buf = 136315138;
                *(void *)&buf[4] = v25;
                _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Unable to read stats: %s",  buf,  0xCu);
              }

              id v18 = 0LL;
LABEL_22:

              v13 = 0LL;
            }

            unlink((const char *)[v16 UTF8String]);
          }

          else
          {
            v13 = 0LL;
          }

          if (-[os_log_s count](v13, "count"))
          {
            v22 = v30;
            v23 = v13;
          }

          else
          {
            v22 = v30;
            v23 = (os_log_s *)&__NSDictionary0__struct;
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v23, v10);
          goto LABEL_28;
        }

        if (v14)
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v10;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Storage Daily ignoring %@", buf, 0xCu);
        }

LABEL_28:
      }

      id v7 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }

    while (v7);
  }

  uint64_t v26 = CDGetLogHandle("client");
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v30;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Storage Daily returning: %@", buf, 0xCu);
  }

  return (__CFDictionary *)v30;
}

void __register_activity_block_invoke(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  v72 = (void *)os_transaction_create("com.apple.storage.daily");
  xpc_activity_t activity = v2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  xpc_object_t v73 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v73, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  uint64_t v4 = CDGetLogHandle("client");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = state;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "CacheDeleteDaily recieved XPC_ACTIVITY_STATE: %ld",  buf,  0xCu);
  }

  if (state == 2)
  {
    uint64_t v8 = CDGetLogHandle("client");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Processing CacheDeleteDaily XPC_ACTIVITY_STATE_RUN",  buf,  2u);
    }

    atomic_store(0, (unsigned __int8 *)&_MergedGlobals);
    atomic_store(xpc_activity_should_defer(v2), byte_10000C35A);
    uint64_t v10 = CDGetLogHandle("client");
    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v12 = atomic_load(byte_10000C35A);
      if ((v12 & 1) != 0) {
        v13 = "YES";
      }
      else {
        v13 = "NO";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "XPC_ACTIVITY_STATE_RUN, should_defer: %s",  buf,  0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __register_activity_block_invoke_23;
    block[3] = &unk_100008480;
    v80 = v2;
    if (qword_10000C370 != -1) {
      dispatch_once(&qword_10000C370, block);
    }
    do
      unsigned __int8 v14 = __ldaxr((unsigned __int8 *)&unk_10000C359);
    while (__stlxr(1u, (unsigned __int8 *)&unk_10000C359));
    if ((v14 & 1) == 0)
    {
      uint64_t v15 = CDGetLogHandle("client");
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = 245;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "********** %d resuming timer", buf, 8u);
      }

      dispatch_resume((dispatch_object_t)qword_10000C360);
    }

    id v17 = (id)qword_10000C368;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[CacheDeleteVolume volumeWithPath:]( &OBJC_CLASS___CacheDeleteVolume,  "volumeWithPath:",  @"/private/var/"));
    id v19 = [v18 freespace];
    id v20 = v18;
    id v21 = [v20 size];
    v22 = (void *)objc_claimAutoreleasedReturnValue([v20 thresholds]);

    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"DESIRED_DISK_THRESHOLD"]);
    uint64_t v24 = evaluateNumberProperty();
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

    if (v25)
    {
      unint64_t v26 = 3 * (void)[v25 unsignedLongLongValue];
    }

    else
    {
      unint64_t v35 = (unint64_t)((double)(unint64_t)v21 * 0.01);
      if (v35 >= 0x500000000LL) {
        unint64_t v35 = 0x500000000LL;
      }
      if (v35 <= 0xC0000000) {
        unint64_t v26 = 3221225472LL;
      }
      else {
        unint64_t v26 = v35;
      }
    }

    uint64_t v36 = CDGetLogHandle("client");
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "com.apple.storage.daily";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&_BYTE buf[24] = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%s performDailyTasks calculation: %llu (freespace) vs %llu (prune_threshold)",  buf,  0x20u);
    }

    BOOL v38 = (unint64_t)v19 < v26;
    uint64_t v39 = CDGetLogHandle("client");
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
    if (v38)
    {
      if (v41)
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "com.apple.storage.daily";
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "%s performDailyTasks performing maintenance",  buf,  0xCu);
      }

      [v17 pruneSystemTmp];
      [v17 pruneUserTmp];
      [v17 pruneContainerTmps];
    }

    else
    {
      if (v41)
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "com.apple.storage.daily";
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "%s performDailyTasks skipping maintenance",  buf,  0xCu);
      }
    }

    v42 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v43 = mach_absolute_time();
    uint64_t v44 = CDGetLogHandle("client");
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Calling populateUsage", buf, 2u);
    }

    v71 = v42;
    if (updateUsage(&off_1000098D0, &off_1000098E8, @"media", v71)
      && updateUsage(&off_100009900, &off_100009918, @"photos", v71))
    {
      v46 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      -[NSMutableArray addObjectsFromArray:](v46, "addObjectsFromArray:", &off_100009930);
      -[NSMutableArray addObjectsFromArray:](v46, "addObjectsFromArray:", &__NSArray0__struct);
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000LL;
      *(void *)&_BYTE buf[24] = __Block_byref_object_copy_;
      *(void *)&buf[32] = __Block_byref_object_dispose_;
      v84 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      [*(id *)(*(void *)&buf[8] + 40) addObjectsFromArray:&off_100009948];
      v81[0] = _NSConcreteStackBlock;
      v81[1] = (id)3221225472LL;
      v81[2] = __populateUsage_block_invoke;
      v81[3] = &unk_1000084A8;
      v81[4] = buf;
      [&__NSArray0__struct enumerateObjectsUsingBlock:v81];
      if (updateUsage(v46, *(void **)(*(void *)&buf[8] + 40LL), @"apps", v71)
        && updateUsage(&off_100009960, 0LL, @"books", v71)
        && updateUsage(&off_100009978, &off_100009990, @"userdata", v71)
        && updateUsage(&off_1000099A8, &off_1000099C0, @"logs", v71))
      {
        BOOL updated = updateUsage(&off_1000099D8, &off_1000099F0, @"system", v71);
        _Block_object_dispose(buf, 8);

        if (updated)
        {
          uint64_t v48 = CDGetLogHandle("client");
          v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v50 = mach_absolute_time();
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&buf[4] = 259;
            *(_WORD *)&buf[8] = 2048;
            *(double *)&buf[10] = gTimebaseConversion * ((double)v50 - (double)v43) / 1000000000.0;
            _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "%d populateUsage COMPLETE, ET: %f seconds",  buf,  0x12u);
          }

          uint64_t v51 = CDGetLogHandle("client");
          v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = "com.apple.storage.daily";
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%s writing stats:", buf, 0xCu);
          }

          __int128 v77 = 0u;
          __int128 v78 = 0u;
          __int128 v75 = 0u;
          __int128 v76 = 0u;
          v53 = v71;
          id v54 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v53,  "countByEnumeratingWithState:objects:count:",  &v75,  v82,  16LL);
          if (v54)
          {
            uint64_t v55 = *(void *)v76;
            do
            {
              for (i = 0LL; i != v54; i = (char *)i + 1)
              {
                if (*(void *)v76 != v55) {
                  objc_enumerationMutation(v53);
                }
                uint64_t v57 = *(void *)(*((void *)&v75 + 1) + 8LL * (void)i);
                uint64_t v58 = CDGetLogHandle("client");
                v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                {
                  v60 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v53, "objectForKeyedSubscript:", v57));
                  *(_DWORD *)buf = 138412546;
                  *(void *)&buf[4] = v57;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v60;
                  _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "\t%@ : %@", buf, 0x16u);
                }
              }

              id v54 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v53,  "countByEnumeratingWithState:objects:count:",  &v75,  v82,  16LL);
            }

            while (v54);
          }

          v61 = v53;
          id v62 = storageDailyStatsFilename();
          v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
          if (v63)
          {
            v81[0] = 0LL;
            v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v61,  200LL,  0LL,  v81));
            id v65 = v81[0];
            if (v64)
            {
              [v64 writeToFile:v63 atomically:0];
            }

            else
            {
              uint64_t v69 = CDGetLogHandle("client");
              v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
              if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)&buf[4] = v65;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v61;
                _os_log_error_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_ERROR,  "Unable to flatten dict, err: %@ for %@",  buf,  0x16u);
              }
            }
          }

LABEL_75:
          atomic_store(1u, (unsigned __int8 *)&_MergedGlobals);

          goto LABEL_76;
        }
      }

      else
      {
        _Block_object_dispose(buf, 8);
      }
    }

    else
    {
    }

    uint64_t v66 = CDGetLogHandle("client");
    v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v68 = mach_absolute_time();
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = 266;
      *(_WORD *)&buf[8] = 2048;
      *(double *)&buf[10] = gTimebaseConversion * ((double)v68 - (double)v43) / 1000000000.0;
      _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "%d populateUsage DEFERRED, ET: %f seconds",  buf,  0x12u);
    }

    goto LABEL_75;
  }

  if (state)
  {
    uint64_t v27 = CDGetLogHandle("client");
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "CacheDeleteDaily uncaught XPC state",  buf,  2u);
    }

    uint64_t v29 = CDGetLogHandle("client");
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = objc_claimAutoreleasedReturnValue([&off_100009A08 objectAtIndexedSubscript:state]);
      __int128 v32 = (void *)v31;
      unsigned __int8 v33 = atomic_load(byte_10000C35A);
      __int128 v34 = "YES";
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&buf[4] = 272;
      *(_WORD *)&buf[8] = 2080;
      if ((v33 & 1) == 0) {
        __int128 v34 = "NO";
      }
      *(void *)&buf[10] = "com.apple.storage.daily";
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = state;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v31;
      *(_WORD *)&buf[38] = 2080;
      v84 = (NSMutableArray *)v34;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%d %s handler, state: %ld (%@), should_defer: %s",  buf,  0x30u);
    }
  }

  else
  {
    uint64_t v6 = CDGetLogHandle("client");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Processing CacheDeleteDaily XPC_ACTIVITY_STATE_CHECK_IN",  buf,  2u);
    }

    xpc_activity_set_criteria(v2, v73);
  }

LABEL_76:
}

void sub_10000503C(_Unwind_Exception *a1)
{
}

void __register_activity_block_invoke_23(uint64_t a1)
{
  v2 = -[CacheDeletePruner initWithFileAge:dirAge:]( objc_alloc(&OBJC_CLASS___CacheDeletePruner),  "initWithFileAge:dirAge:",  259200.0,  86400.0);
  v3 = (void *)qword_10000C368;
  qword_10000C368 = (uint64_t)v2;

  dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, 0);
  v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.storage.daily.should_defer", v5);
  id v7 = (void *)qword_10000C378;
  qword_10000C378 = (uint64_t)v6;

  dispatch_source_t v8 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_10000C378);
  v9 = (void *)qword_10000C360;
  qword_10000C360 = (uint64_t)v8;

  dispatch_source_set_timer((dispatch_source_t)qword_10000C360, 0LL, 0x12A05F200uLL, 0x3B9ACA00uLL);
  uint64_t v10 = (dispatch_source_s *)qword_10000C360;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = __register_activity_block_invoke_2;
  handler[3] = &unk_100008480;
  id v12 = *(id *)(a1 + 32);
  dispatch_source_set_event_handler(v10, handler);
}

void __register_activity_block_invoke_2(uint64_t a1)
{
  unsigned __int8 v2 = atomic_load(byte_10000C35A);
  if ((v2 & 1) != 0)
  {
    uint64_t v6 = CDGetLogHandle("client");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 67109120;
      int v11 = 229;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "********** %d suspending timer, should_defer = YES",  (uint8_t *)&v10,  8u);
    }

    dispatch_suspend((dispatch_object_t)qword_10000C360);
    atomic_store(0, (unsigned __int8 *)&unk_10000C359);
    [(id)qword_10000C368 stop];
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3LL))
    {
      uint64_t v8 = CDGetLogHandle("client");
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v10) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "xpc_activity_set_state(XPC_ACTIVITY_STATE_DEFER) failed",  (uint8_t *)&v10,  2u);
      }
    }
  }

  else
  {
    unsigned __int8 v3 = atomic_load((unsigned __int8 *)&_MergedGlobals);
    if ((v3 & 1) != 0)
    {
      uint64_t v4 = CDGetLogHandle("client");
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 67109120;
        int v11 = 237;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "********** %d suspending timer, activity_finished = YES",  (uint8_t *)&v10,  8u);
      }

      dispatch_suspend((dispatch_object_t)qword_10000C360);
      atomic_store(0, (unsigned __int8 *)&unk_10000C359);
    }
  }
}

BOOL updateUsage(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v37 = a2;
  id v8 = a3;
  id v9 = a4;
  int v10 = v9;
  unsigned __int8 v11 = atomic_load(byte_10000C35A);
  if ((v11 & 1) != 0)
  {
    BOOL v28 = 0LL;
  }

  else
  {
    uint64_t v31 = v9;
    id v32 = v8;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v30 = diskUsage(v7, &__block_literal_global_271);
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v33 = v7;
    id obj = v7;
    id v36 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v43;
LABEL_4:
      uint64_t v13 = 0LL;
      while (1)
      {
        if (*(void *)v43 != v35) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v14 = *(void **)(*((void *)&v42 + 1) + 8 * v13);
        v47 = v14;
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v47,  1LL,  v30));
        uint64_t v16 = diskUsage(v15, &__block_literal_global_273);

        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        id v17 = v37;
        id v18 = [v17 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v39;
          double v21 = (double)(unint64_t)v16;
          do
          {
            for (i = 0LL; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v39 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v23 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)i);
              if ([v14 hasSuffix:v23])
              {
                uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v21));
                [v12 setObject:v24 forKeyedSubscript:v23];
              }
            }

            id v19 = [v17 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }

          while (v19);
        }

        unsigned __int8 v25 = atomic_load(byte_10000C35A);
        if ((v25 & 1) != 0) {
          break;
        }
        if ((id)++v13 == v36)
        {
          id v36 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
          if (v36) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (double)(unint64_t)v30));
    [v12 setObject:v26 forKeyedSubscript:@"total"];

    int v10 = v31;
    id v8 = v32;
    [v31 setObject:v12 forKeyedSubscript:v32];
    unsigned __int8 v27 = atomic_load(byte_10000C35A);
    BOOL v28 = (v27 & 1) == 0;

    id v7 = v33;
  }

  return v28;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __populateUsage_block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 isAbsolutePath])
  {
    unsigned __int8 v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);
    [v3 addObject:v4];
  }
}

uint64_t diskUsage(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableIndexSet);
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 1;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = v3;
  uint64_t v7 = 0LL;
  id v8 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v18 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
      if (v4)
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = __diskUsage_block_invoke;
        v14[3] = &unk_100008530;
        uint64_t v16 = &v21;
        id v15 = v4;
        uint64_t v12 = traverse_dir_with_state(v11, v5, 0LL, v14);
      }

      else
      {
        uint64_t v12 = traverse_dir_with_state(*(void *)(*((void *)&v17 + 1) + 8 * v10), v5, 0LL, 0LL);
      }

      v7 += v12;
      if (!*((_BYTE *)v22 + 24)) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v21, 8);
  return v7;
}

void sub_1000058B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

BOOL __updateUsage_block_invoke(id a1, const char *a2, $73E2D91FB0D0F26A7F30E74A8C023B7C *a3)
{
  unsigned __int8 v3 = atomic_load(byte_10000C35A);
  return (v3 & 1) == 0;
}

BOOL __updateUsage_block_invoke_2(id a1, const char *a2, $CD35C059B817048ED8B3F5853796EFAE *a3)
{
  unsigned __int8 v3 = atomic_load(byte_10000C35A);
  return (v3 & 1) == 0;
}

uint64_t __diskUsage_block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
}

id storageDailyStatsFilename()
{
  v0 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  if (![v1 count])
  {
    uint64_t v7 = CDGetLogHandle("client");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Unable to get path to Caches Directory",  (uint8_t *)&v15,  2u);
    }

    id v4 = 0LL;
    id v5 = 0LL;
    unsigned __int8 v2 = 0LL;
    goto LABEL_11;
  }

  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue([v1 objectAtIndexedSubscript:0]);
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"com.apple.storage.daily"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"com.apple.storage.daily.stats"]);
  id v5 = v3;
  if (mkdir((const char *)[v5 fileSystemRepresentation], 0x1C0u) && *__error() != 17)
  {
    uint64_t v9 = CDGetLogHandle("client");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = __error();
      unsigned __int8 v14 = strerror(*v13);
      int v15 = 138412546;
      uint64_t v16 = 0LL;
      __int16 v17 = 2080;
      __int128 v18 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "unable to create directory at %@ : %s",  (uint8_t *)&v15,  0x16u);
    }

LABEL_11:
    id v6 = 0LL;
    goto LABEL_12;
  }

  id v6 = v4;
  id v4 = v6;
LABEL_12:
  id v11 = v6;

  return v11;
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}