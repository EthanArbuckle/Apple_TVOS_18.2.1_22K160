@interface NSMutableDictionary(OSALogTrackerExtension)
- (uint64_t)osa_logTracker_getForSubtype:()OSALogTrackerExtension forOwner:;
- (uint64_t)osa_logTracker_isLog:()OSALogTrackerExtension byKey:count:withinLimit:withOptions:errorDescription:;
- (uint64_t)osa_logTracker_recordNixedDuplicate:()OSALogTrackerExtension;
- (uint64_t)osa_logTracker_shouldRotateLog:()OSALogTrackerExtension;
- (void)osa_logTracker_incrementForSubtype:()OSALogTrackerExtension signature:filepath:;
- (void)osa_logTracker_incrementForSubtype_internal:()OSALogTrackerExtension signature:filepath:scan:;
- (void)osa_logTracker_trackLogTypes_internal:()OSALogTrackerExtension forOwner:rescan:;
@end

@implementation NSMutableDictionary(OSALogTrackerExtension)

- (void)osa_logTracker_incrementForSubtype_internal:()OSALogTrackerExtension signature:filepath:scan:
{
  v38[2] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  [a1 objectForKey:v10];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, "setCount:", objc_msgSend(v12, "count") + 1);
  }

  else
  {
    v13 = +[OSALogTrackerObject tracker](&OBJC_CLASS___OSALogTrackerObject, "tracker");
    [a1 setObject:v13 forKey:v10];
  }

  [NSString stringWithUTF8String:a5];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F50] date];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
    [MEMORY[0x1896078A8] defaultManager];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v36 = 0LL;
    [v16 attributesOfItemAtPath:v14 error:&v36];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    id v18 = v36;

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      -[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_incrementForSubtype_internal:signature:filepath:scan:].cold.4((uint64_t)v14);
    }
    uint64_t v19 = [v17 objectForKey:*MEMORY[0x1896074C0]];

    v15 = (void *)v19;
  }

  if (v13)
  {
    [v13 oldestDate];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20) {
      goto LABEL_12;
    }
    v21 = v20;
    if (!v15)
    {

      goto LABEL_14;
    }

    [v13 oldestDate];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [v22 compare:v15];

    if (v23 == 1)
    {
LABEL_12:
      [v13 setOldestDate:v15];
      [v13 setOldestLogPath:v14];
    }
  }

- (void)osa_logTracker_incrementForSubtype:()OSALogTrackerExtension signature:filepath:
{
  id v11 = a3;
  id v8 = a4;
  v9 = (dispatch_semaphore_s *)sAccountingSemaphore;
  dispatch_time_t v10 = dispatch_time(0LL, 1000000000LL);
  if (!dispatch_semaphore_wait(v9, v10))
  {
    objc_msgSend(a1, "osa_logTracker_incrementForSubtype_internal:signature:filepath:scan:", v11, v8, a5, 0);
    dispatch_semaphore_signal((dispatch_semaphore_t)sAccountingSemaphore);
  }
}

- (void)osa_logTracker_trackLogTypes_internal:()OSALogTrackerExtension forOwner:rescan:
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  dispatch_time_t v10 = (dispatch_semaphore_s *)sAccountingSemaphore;
  dispatch_time_t v11 = dispatch_time(0LL, 1000000000LL);
  if (!dispatch_semaphore_wait(v10, v11))
  {
    if (osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel)
    {
      if (stat( (const char *)[(id)osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel UTF8String],  &v34) == -1)
      {
        if (*__error() != 2 && (a5 & 1) == 0) {
          goto LABEL_15;
        }
      }

      else if (!a5)
      {
LABEL_15:
        dispatch_semaphore_signal((dispatch_semaphore_t)sAccountingSemaphore);
        goto LABEL_16;
      }
    }

    v12 = (void *)osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel;
    osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel = 0LL;

    v13 = (void *)MEMORY[0x186E340A4]([a1 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_47]);
    uint64_t v30 = 0LL;
    v31 = &v30;
    uint64_t v32 = 0x2020000000LL;
    uint64_t v33 = 0LL;
    uint64_t v26 = 0LL;
    v27 = &v26;
    uint64_t v28 = 0x2020000000LL;
    uint64_t v29 = 0LL;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
      -[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_trackLogTypes_internal:forOwner:rescan:].cold.1();
    }
    v43 = @"exclude-retired";
    uint64_t v44 = MEMORY[0x189604A88];
    [MEMORY[0x189603F68] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)[v14 mutableCopy];

    if (v9) {
      [v15 setObject:v9 forKeyedSubscript:@"file-owner"];
    }
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __101__NSMutableDictionary_OSALogTrackerExtension__osa_logTracker_trackLogTypes_internal_forOwner_rescan___block_invoke_49;
    v21[3] = &unk_189E214F0;
    v25 = &v45;
    uint64_t v23 = &v30;
    v21[4] = a1;
    id v22 = v8;
    uint64_t v24 = &v26;
    +[OSALog iterateLogsWithOptions:usingBlock:](&OBJC_CLASS___OSALog, "iterateLogsWithOptions:usingBlock:", v15, v21);
    v16 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v17 = MEMORY[0x1895F8DA0];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = v31[3];
      uint64_t v19 = [a1 count];
      uint64_t v20 = v27[3];
      *(_DWORD *)buf = 134218754;
      uint64_t v36 = v18;
      __int16 v37 = 2048;
      uint64_t v38 = v19;
      __int16 v39 = 2048;
      uint64_t v40 = v20;
      __int16 v41 = 2112;
      uint64_t v42 = osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "scanned %zu logs with %lu types and %zu unknowns (sentinel is %@)",  buf,  0x2Au);
    }

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
    objc_autoreleasePoolPop(v13);
    goto LABEL_15;
  }

- (uint64_t)osa_logTracker_getForSubtype:()OSALogTrackerExtension forOwner:
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __85__NSMutableDictionary_OSALogTrackerExtension__osa_logTracker_getForSubtype_forOwner___block_invoke;
  block[3] = &unk_189E21518;
  block[4] = a1;
  id v8 = v6;
  id v15 = v8;
  id v9 = v7;
  id v16 = v9;
  if (osa_logTracker_getForSubtype_forOwner__onceToken != -1) {
    dispatch_once(&osa_logTracker_getForSubtype_forOwner__onceToken, block);
  }
  [a1 objectForKey:v8];
  dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_time_t v11 = v10;
  if (v10) {
    uint64_t v12 = [v10 count];
  }
  else {
    uint64_t v12 = 0LL;
  }

  return v12;
}

- (uint64_t)osa_logTracker_recordNixedDuplicate:()OSALogTrackerExtension
{
  __int16 value = 0;
  getxattr(path, "Multiple", &value, 2uLL, 0, 0);
  ++value;
  setxattr(path, "Multiple", &value, 2uLL, 0, 0);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    -[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_recordNixedDuplicate:].cold.1();
  }
  return utimes(path, 0LL);
}

- (uint64_t)osa_logTracker_shouldRotateLog:()OSALogTrackerExtension
{
  return [a3 hasPrefix:@"211"];
}

- (uint64_t)osa_logTracker_isLog:()OSALogTrackerExtension byKey:count:withinLimit:withOptions:errorDescription:
{
  uint64_t v95 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  [v15 objectForKeyedSubscript:@"file-owner"];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = a1;
  unint64_t v83 = objc_msgSend(a1, "osa_logTracker_getForSubtype:forOwner:", v14, v16);
  id v17 = v13;
  id v18 = v15;
  [v18 objectForKeyedSubscript:@"set-log-limit"];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x189604038]) initWithSuiteName:@"com.apple.osanalytics"];
  [NSString stringWithFormat:@"%@_CountLimit", v17];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 objectForKey:v21];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = v18;
  if (([v17 isEqualToString:@"210"] & 1) == 0)
  {
    v77 = v16;
    uint64_t v24 = a5;
    id v25 = v14;
    uint64_t v26 = a6;
    v27 = v17;
    [v18 objectForKeyedSubscript:@"override-limit"];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    char v29 = [v28 BOOLValue];

    if ((v29 & 1) != 0)
    {
      unint64_t v23 = -1LL;
    }

    else
    {
      if (!v22)
      {
        id v17 = v27;
        if (!v19)
        {
          char v42 = [v27 isEqualToString:@"288"];
          a6 = v26;
          if ((v42 & 1) == 0)
          {
            id v14 = v25;
            if (([v17 isEqualToString:@"187"] & 1) == 0)
            {
              a5 = v24;
              if ([v17 hasPrefix:@"211"])
              {
                unint64_t v23 = 30LL;
              }

              else if ([v17 hasPrefix:@"328"])
              {
                unint64_t v23 = 250LL;
              }

              else
              {
                unint64_t v23 = 25LL;
              }

              goto LABEL_11;
            }

            unint64_t v23 = 100LL;
LABEL_10:
            a5 = v24;
LABEL_11:
            id v16 = v77;
            goto LABEL_12;
          }

          unint64_t v23 = 100LL;
LABEL_9:
          id v14 = v25;
          goto LABEL_10;
        }

        unint64_t v23 = [v19 unsignedIntegerValue];
LABEL_8:
        a6 = v26;
        goto LABEL_9;
      }

      unint64_t v23 = [v22 integerValue];
    }

    id v17 = v27;
    goto LABEL_8;
  }

  unint64_t v23 = -1LL;
LABEL_12:

  unint64_t v30 = v83;
  unint64_t v31 = v23;
  if (v83 < v23
    || (unint64_t v80 = v23,
        objc_msgSend( v81,  "osa_logTracker_trackLogTypes_internal:forOwner:rescan:",  v14,  v16,  osa_logTracker_isLog_byKey_count_withinLimit_withOptions_errorDescription__rescanOldFiles),  unint64_t v30 = objc_msgSend(v81, "osa_logTracker_getForSubtype:forOwner:", v14, v16),  v31 = v23,  v30 < v23))
  {
    uint64_t v32 = 1LL;
    if (!a5) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  unint64_t v84 = v30;
  [v18 objectForKeyedSubscript:@"Signature"];
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (v76)
  {
    stat v34 = (dispatch_semaphore_s *)sAccountingSemaphore;
    dispatch_time_t v35 = dispatch_time(0LL, 1000000000LL);
    if (!dispatch_semaphore_wait(v34, v35))
    {
      [v81 objectForKey:v14];
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36) {
        -[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_isLog:byKey:count:withinLimit:withOptions:errorDescription:].cold.1();
      }
      __int16 v37 = v36;
      [v36 signatures];
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
      [v38 objectForKeyedSubscript:v76];
      __int16 v39 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v40 = v39;
      if (v39)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1861AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "known duplicate signature", buf, 2u);
        }

        id v41 = [v39 objectForKeyedSubscript:@"original"];
        objc_msgSend(v81, "osa_logTracker_recordNixedDuplicate:", objc_msgSend(v41, "fileSystemRepresentation"));

        uint64_t v40 = v39;
        goto LABEL_55;
      }

      id v72 = v17;
      v73 = a5;
      v78 = v16;
      id v74 = v14;
      v75 = a6;
      __int128 v90 = 0u;
      __int128 v91 = 0u;
      __int128 v88 = 0u;
      __int128 v89 = 0u;
      [v37 signatures];
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v87 = [v43 countByEnumeratingWithState:&v88 objects:v94 count:16];
      if (v87)
      {
        uint64_t v44 = 0LL;
        id obj = v43;
        uint64_t v86 = *(void *)v89;
        do
        {
          for (uint64_t i = 0LL; i != v87; ++i)
          {
            if (*(void *)v89 != v86) {
              objc_enumerationMutation(obj);
            }
            uint64_t v46 = *(void *)(*((void *)&v88 + 1) + 8 * i);
            [v37 signatures];
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            [v47 objectForKeyedSubscript:v46];
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            [v48 objectForKeyedSubscript:@"dupes"];
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = v37;
            unint64_t v51 = [v49 count];
            [v44 objectForKeyedSubscript:@"dupes"];
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v44;
            unint64_t v54 = [v52 count];

            if (v51 <= v54)
            {
              __int16 v37 = v50;
              uint64_t v44 = v53;
            }

            else
            {
              [v50 signatures];
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              [v55 objectForKeyedSubscript:v46];
              uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();

              __int16 v37 = v50;
            }
          }

          uint64_t v87 = [obj countByEnumeratingWithState:&v88 objects:v94 count:16];
        }

        while (v87);

        uint64_t v40 = 0LL;
        if (v44)
        {
          id v14 = v74;
          a6 = v75;
          a5 = v73;
          id v16 = v78;
          do
          {
            [v44 objectForKeyedSubscript:@"dupes"];
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            unint64_t v57 = [v56 count];

            if (v57 < 2) {
              break;
            }
            [v44 objectForKeyedSubscript:@"dupes"];
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            [v58 objectAtIndex:0];
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v93 = v59;
              _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "new signature found -- prioritizing over duplicate (removing %@)",  buf,  0xCu);
            }

            [v44 objectForKeyedSubscript:@"dupes"];
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            [v60 removeObjectAtIndex:0];

            id v61 = [v44 objectForKeyedSubscript:@"original"];
            objc_msgSend(v81, "osa_logTracker_recordNixedDuplicate:", objc_msgSend(v61, "fileSystemRepresentation"));

            id v62 = v59;
            remove((const char *)[v62 fileSystemRepresentation]);
            objc_msgSend(v37, "setCount:", objc_msgSend(v37, "count") - 1);

            --v84;
            uint64_t v40 = 0LL;
          }

          while (v84 >= v80);

LABEL_54:
          id v17 = v72;
LABEL_55:
          dispatch_semaphore_signal((dispatch_semaphore_t)sAccountingSemaphore);

          goto LABEL_56;
        }
      }

      else
      {
      }

      id v14 = v74;
      a6 = v75;
      a5 = v73;
      id v16 = v78;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "new signature found -- but no room available",  buf,  2u);
      }

      goto LABEL_54;
    }
  }

- (void)osa_logTracker_incrementForSubtype_internal:()OSALogTrackerExtension signature:filepath:scan:.cold.1()
{
}

- (void)osa_logTracker_incrementForSubtype_internal:()OSALogTrackerExtension signature:filepath:scan:.cold.2()
{
}

- (void)osa_logTracker_incrementForSubtype_internal:()OSALogTrackerExtension signature:filepath:scan:.cold.3()
{
}

- (void)osa_logTracker_incrementForSubtype_internal:()OSALogTrackerExtension signature:filepath:scan:.cold.4( uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  int v2 = *__error();
  v3 = __error();
  v4 = strerror(*v3);
  int v5 = 138412802;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v2;
  __int16 v9 = 2080;
  dispatch_time_t v10 = v4;
  _os_log_error_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Unable to retrieve file attributes at path %@. Error: %d %s",  (uint8_t *)&v5,  0x1Cu);
}

- (void)osa_logTracker_trackLogTypes_internal:()OSALogTrackerExtension forOwner:rescan:.cold.1()
{
}

- (void)osa_logTracker_recordNixedDuplicate:()OSALogTrackerExtension .cold.1()
{
}

- (void)osa_logTracker_isLog:()OSALogTrackerExtension byKey:count:withinLimit:withOptions:errorDescription:.cold.1()
{
}

@end