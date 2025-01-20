@interface HTProcessInfo
+ (BOOL)isAnyThirdPartyDeveloperProcessForeground;
+ (BOOL)shouldSaveFenceHangLogs;
+ (id)displayStateArray;
+ (id)processForPid:(int)a3;
+ (id)recentAppsDict;
+ (id)startWatchingPid:(int)a3 sharedMem:(void *)a4 length:(unint64_t)a5 bundleID:(const char *)a6;
+ (unint64_t)getEarliestPendingHangStartTime:(unint64_t)a3;
+ (void)addDisplayStateChangeEvent:(DisplayStateChangeEvent)a3;
+ (void)checkForHUDTimeouts:(unint64_t)a3;
+ (void)checkForHangTimeouts:(unint64_t)a3;
+ (void)initialize;
+ (void)recordFenceHang:(id)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5 reportedTime:(unint64_t)a6 blownFenceId:(unint64_t)a7 saveTailspin:(BOOL)a8 subtype:(int64_t)a9 isThirdPartyDevSupportModeHang:(BOOL)a10 captureMicroHang:(BOOL)a11;
+ (void)stopWatchingAllPids;
+ (void)stopWatchingPid:(int)a3;
- (BOOL)checkShouldSaveHangLogs;
- (BOOL)isDeveloperApp;
- (BOOL)isInForeground;
- (BOOL)isThirdPartyDevSupportModeHang;
- (BOOL)shouldDisplayNonFenceHangToHUD;
- (BOOL)startTimeWithinMS:(unint64_t)a3 ofCurrentTime:(unint64_t)a4;
- (HTProcessInfo)initWithPid:(int)a3 sharedMem:(void *)a4 length:(unint64_t)a5 bundleID:(const char *)a6;
- (id)checkEventsForTimeouts:(unint64_t)a3 withType:(int64_t)a4;
- (id)description;
- (id)getApplicationByBundleId:(id)a3;
- (unint64_t)getHangStartTime:(unint64_t)a3;
- (void)checkEventsForHUDUpdate:(unint64_t)a3;
- (void)dealloc;
- (void)recordHang:(id)a3 threadID:(unint64_t)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 saveTailspin:(BOOL)a7 subtype:(int64_t)a8 userActionData:(id)a9 isThirdPartyDevSupportModeHang:(BOOL)a10 captureMicroHang:(BOOL)a11;
@end

@implementation HTProcessInfo

+ (void)initialize
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v3 = (void *)qword_10005BAA0;
  qword_10005BAA0 = (uint64_t)v2;
}

+ (void)addDisplayStateChangeEvent:(DisplayStateChangeEvent)a3
{
  int v3 = dword_10005BB48;
  *((DisplayStateChangeEvent *)&unk_10005BAA8 + dword_10005BB48) = a3;
  dword_10005BB48 = (v3 + 1) % 0xAu;
}

+ (void)checkForHangTimeouts:(unint64_t)a3
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (id)qword_10005BAA0;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v14 + 1) + 8 * (void)v8),  "checkEventsForTimeouts:withType:",  a3,  2,  (void)v14));
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  v10 = 0LL;
LABEL_11:

  os_unfair_lock_unlock(&stru_10005BB4C);
  if (v10)
  {
    id v11 = sub_1000233A4();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v10 serviceName]);
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Hang for service name %@ timed out, recording",  buf,  0xCu);
    }

    [v10 recordHang];
  }
}

- (unint64_t)getHangStartTime:(unint64_t)a3
{
  shmem_region = self->shmem_region;
  if (!shmem_region->var1) {
    return -1LL;
  }
  unint64_t v6 = 0LL;
  unint64_t v7 = -1LL;
  uint64_t v8 = 380LL;
  do
  {
    if (!atomic_load((unsigned int *)((char *)shmem_region + v8 - 348)) && !*((_BYTE *)&shmem_region->var0 + v8))
    {
      unint64_t v10 = *(void *)((char *)shmem_region + v8 - 372);
      if (a3 > v10 && sub_100025798(a3 - v10) > 250.0)
      {
        int v11 = sub_1000187D4(self->pid);
        if (v10 >= v7) {
          int v12 = 1;
        }
        else {
          int v12 = v11;
        }
        if (!v12) {
          unint64_t v7 = v10;
        }
      }
    }

    ++v6;
    shmem_region = self->shmem_region;
    v8 += 376LL;
  }

  while (v6 < shmem_region->var1);
  return v7;
}

+ (unint64_t)getEarliestPendingHangStartTime:(unint64_t)a3
{
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v4 = (id)qword_10005BAA0;
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0LL;
    uint64_t v8 = *(void *)v22;
    unint64_t v9 = -1LL;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        int v11 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v12 = [v11 getHangStartTime:a3];
        if ((unint64_t)v12 < v9)
        {
          unint64_t v13 = (unint64_t)v12;
          uint64_t v14 = v11[3];
          double v15 = sub_100025798(a3 - (void)v12);
          uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"detected pending hang in %@, duration %.2f ms",  v14,  *(void *)&v15,  (void)v21));

          unint64_t v7 = (void *)v16;
          unint64_t v9 = v13;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v6);
  }

  else
  {
    unint64_t v7 = 0LL;
    unint64_t v9 = -1LL;
  }

  os_unfair_lock_unlock(&stru_10005BB4C);
  if (v7)
  {
    id v17 = sub_1000233A4();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "getEarliestPendingHangStartTime: %@", buf, 0xCu);
    }
  }

  if (v9 == -1LL) {
    unint64_t v19 = 0LL;
  }
  else {
    unint64_t v19 = v9;
  }

  return v19;
}

+ (void)checkForHUDTimeouts:(unint64_t)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v4 = (id)qword_10005BAA0;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "checkEventsForHUDUpdate:", a3, (void)v9);
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }

  os_unfair_lock_unlock(&stru_10005BB4C);
}

+ (void)stopWatchingPid:(int)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v4 = (id)qword_10005BAA0;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if (*(_DWORD *)(*(void *)(*((void *)&v9 + 1) + 8LL * (void)i) + 56LL) == a3)
        {
          [(id)qword_10005BAA0 removeObject:(void)v9];
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

+ (void)stopWatchingAllPids
{
}

+ (id)processForPid:(int)a3
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = (id)qword_10005BAA0;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        __int128 v9 = *(_DWORD **)(*((void *)&v12 + 1) + 8LL * (void)v8);
        if (v9[14] == a3)
        {
          __int128 v10 = v9;
          goto LABEL_11;
        }

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  __int128 v10 = 0LL;
LABEL_11:

  os_unfair_lock_unlock(&stru_10005BB4C);
  return v10;
}

+ (id)startWatchingPid:(int)a3 sharedMem:(void *)a4 length:(unint64_t)a5 bundleID:(const char *)a6
{
  uint64_t v9 = *(void *)&a3;
  uint64_t v10 = objc_claimAutoreleasedReturnValue(+[HTProcessInfo processForPid:](&OBJC_CLASS___HTProcessInfo, "processForPid:"));
  if (v10)
  {
    __int128 v11 = (HTProcessInfo *)v10;
    id v12 = sub_1000233A4();
    __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      v18 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "WARNING: %{public}@ was already being watched.",  (uint8_t *)&v17,  0xCu);
    }

    __int128 v14 = 0LL;
  }

  else
  {
    __int128 v15 = -[HTProcessInfo initWithPid:sharedMem:length:bundleID:]( objc_alloc(&OBJC_CLASS___HTProcessInfo),  "initWithPid:sharedMem:length:bundleID:",  v9,  a4,  a5,  a6);
    if (v15)
    {
      os_unfair_lock_lock(&stru_10005BB4C);
      [(id)qword_10005BAA0 addObject:v15];
      os_unfair_lock_unlock(&stru_10005BB4C);
    }

    __int128 v11 = v15;
    __int128 v14 = v11;
  }

  return v14;
}

+ (BOOL)shouldSaveFenceHangLogs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned __int8 v3 = [v2 isInternal];

  if ((v3 & 1) != 0)
  {
    LOBYTE(v4) = 1;
  }

  else
  {
    os_unfair_lock_lock(&stru_10005BB4C);
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v5 = (id)qword_10005BAA0;
    id v4 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (i = 0LL; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v5);
          }
          uint64_t v8 = *(_BYTE **)(*((void *)&v10 + 1) + 8LL * (void)i);
          if (objc_msgSend(v8, "isInForeground", (void)v10) && v8[72])
          {
            LOBYTE(v4) = 1;
            goto LABEL_14;
          }
        }

        id v4 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

+ (BOOL)isAnyThirdPartyDeveloperProcessForeground
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v2 = (id)qword_10005BAA0;
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        if (objc_msgSend(v6, "isInForeground", (void)v8)
          && ([v6 isDeveloperApp] & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (BOOL)isInForeground
{
  id v3 = -[NSString UTF8String](self->processBundleID, "UTF8String");
  if (v3)
  {
    uint64_t v4 = v3;
    NSUInteger v5 = -[NSString lengthOfBytesUsingEncoding:](self->processBundleID, "lengthOfBytesUsingEncoding:", 4LL);
    shmem_region = self->shmem_region;
    uint64_t var1 = shmem_region->var1;
    if ((_DWORD)var1)
    {
      size_t v8 = v5;
      var12 = shmem_region->var2[0].var12;
      while (strncmp(v4, var12, v8))
      {
        var12 += 376;
        if (!--var1) {
          goto LABEL_6;
        }
      }

      unsigned int v10 = atomic_load((unsigned int *)var12 - 23);
      LOBYTE(v3) = v10 == 0;
    }

    else
    {
LABEL_6:
      LOBYTE(v3) = 0;
    }
  }

  return (char)v3;
}

- (HTProcessInfo)initWithPid:(int)a3 sharedMem:(void *)a4 length:(unint64_t)a5 bundleID:(const char *)a6
{
  id v11 = sub_100017AD4(a3);
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (!v12)
  {
    id v18 = sub_1000233A4();
    unint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v49) = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Unable to identify process name of pid %d",  buf,  8u);
    }

    goto LABEL_26;
  }

  if (a5 <= 0xFE7)
  {
    id v13 = sub_1000233A4();
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v49 = a5;
      __int16 v50 = 2048;
      uint64_t v51 = 4072LL;
      __int128 v15 = "Shared memory region smaller than expected: %zu < %zu";
      uint64_t v16 = v14;
      uint32_t v17 = 22;
LABEL_24:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      goto LABEL_25;
    }

    goto LABEL_25;
  }

  if (*(_DWORD *)a4 != 7)
  {
    id v31 = sub_1000233A4();
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = *(_DWORD *)a4;
      *(_DWORD *)buf = 67109120;
      LODWORD(v49) = v32;
      __int128 v15 = "Client is not vending the current protocol version: %u";
      uint64_t v16 = v14;
      uint32_t v17 = 8;
      goto LABEL_24;
    }

- (BOOL)isThirdPartyDevSupportModeHang
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)checkEventsForTimeouts:(unint64_t)a3 withType:(int64_t)a4
{
  shmem_region = self->shmem_region;
  if (!shmem_region->var1) {
    goto LABEL_11;
  }
  unint64_t v9 = 0LL;
  double v10 = (double)a3;
  uint64_t v11 = 380LL;
  while (1)
  {
    if (!atomic_load((unsigned int *)((char *)shmem_region + v11 - 348)))
    {
      unint64_t v13 = *(void *)((char *)shmem_region + v11 - 372);
      double v14 = sub_100025798((unint64_t)(v10 - (double)v13));
      double v15 = v14;
      if (a4 == 2)
      {
        BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
        double v16 = (double)(unint64_t)[v4 runloopHangTimeoutDurationMSec];

        if (v15 <= v16) {
          goto LABEL_10;
        }
      }

      else if (a4 != 8 || v14 <= 250.0)
      {
        goto LABEL_10;
      }
    }

- (void)checkEventsForHUDUpdate:(unint64_t)a3
{
  if (-[HTProcessInfo shouldDisplayNonFenceHangToHUD](self, "shouldDisplayNonFenceHangToHUD"))
  {
    shmem_region = self->shmem_region;
    if (shmem_region->var1)
    {
      uint64_t v6 = 0LL;
      unint64_t v7 = 0LL;
      do
      {
        size_t v8 = (char *)shmem_region + v6 * 376;
        unint64_t v9 = (uint64_t *)&shmem_region->var2[v6];
        ++v7;
        shmem_region = self->shmem_region;
        ++v6;
      }

      while (v7 < shmem_region->var1);
    }
  }

+ (id)displayStateArray
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unint64_t v3 = dword_10005BB48;
  int v4 = 10;
  do
  {
    NSUInteger v5 = (char *)&unk_10005BAA8 + 16 * v3;
    uint64_t v6 = *(void *)v5;
    if (*(void *)v5)
    {
      uint64_t v7 = *((unsigned int *)v5 + 2);
      id v8 = sub_1000233A4();
      unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v14 = v6;
        __int16 v15 = 1024;
        int v16 = v7;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "timestamp: %llu, status: %d",  buf,  0x12u);
      }

      double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v6));
      [v2 addObject:v10];

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
      [v2 addObject:v11];
    }

    unint64_t v3 = (v3 + 1) % 0xA;
    --v4;
  }

  while (v4);
  return v2;
}

+ (id)recentAppsDict
{
  id v2 = sub_1000233A4();
  unint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002CD44(v3);
  }

  int v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = mach_absolute_time();
  os_unfair_lock_lock(&stru_10005BB4C);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = (id)qword_10005BAA0;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        if ([(id)v11 startTimeWithinMS:10000 ofCurrentTime:v5])
        {
          uint64_t v12 = *(void *)(v11 + 32);
          unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%i",  *(unsigned int *)(v11 + 56)));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, v13);

          id v14 = sub_1000233A4();
          __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            int v16 = *(_DWORD *)(v11 + 56);
            uint64_t v17 = *(void *)(v11 + 32);
            *(_DWORD *)buf = 67109378;
            int v24 = v16;
            __int16 v25 = 2112;
            uint64_t v26 = v17;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Found Recent App: pid=%i path=%@",  buf,  0x12u);
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }

    while (v8);
  }

  os_unfair_lock_unlock(&stru_10005BB4C);
  return v4;
}

- (BOOL)startTimeWithinMS:(unint64_t)a3 ofCurrentTime:(unint64_t)a4
{
  shmem_region = self->shmem_region;
  if (!shmem_region->var1) {
    return 0;
  }
  unint64_t v7 = 0LL;
  BOOL v8 = 0;
  double v9 = (double)a3;
  uint64_t v10 = 380LL;
  do
  {
    if (!*((_BYTE *)&shmem_region->var0 + v10)
      && sub_100025798(a4 - *(void *)((char *)shmem_region + v10 - 372)) < v9)
    {
      BOOL v8 = 1;
    }

    ++v7;
    shmem_region = self->shmem_region;
    v10 += 376LL;
  }

  while (v7 < shmem_region->var1);
  return v8;
}

- (void)recordHang:(id)a3 threadID:(unint64_t)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 saveTailspin:(BOOL)a7 subtype:(int64_t)a8 userActionData:(id)a9 isThirdPartyDevSupportModeHang:(BOOL)a10 captureMicroHang:(BOOL)a11
{
  BOOL v13 = a7;
  id v80 = a3;
  id v79 = a9;
  double v17 = sub_100025798(a6 - a5);
  BOOL isFirstPartyApp = self->isFirstPartyApp;
  if (self->isFirstPartyApp)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    if (v17 > (double)(unint64_t)[v11 runloopHangDurationThresholdMSec])
    {
      BOOL v19 = 1;
LABEL_8:

      goto LABEL_9;
    }

    if (self->isFirstPartyApp)
    {
      BOOL v19 = 0;
      goto LABEL_8;
    }
  }

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  BOOL v19 = v17 > (double)(unint64_t)[v20 runloopHangThirdPartyDurationThresholdMSec];

  if (isFirstPartyApp) {
    goto LABEL_8;
  }
LABEL_9:
  if (a8 != 9 && (v19 || a11))
  {
    id v21 = sub_1000233A4();
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      processName = self->processName;
      int v24 = sub_100018A78(a8);
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      *(_DWORD *)buf = 138544386;
      unint64_t v83 = (unint64_t)processName;
      __int16 v84 = 2048;
      double v85 = v17 / 1000.0;
      __int16 v86 = 2114;
      id v87 = v80;
      __int16 v88 = 2114;
      v89 = v25;
      __int16 v90 = 2048;
      double v91 = (double)(unint64_t)[v26 runloopHangDurationThresholdMSec] / 1000.0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Hang detected %.2fs (%{public}@, %{public}@) duration > capture threshold %.2fs after accounting for assertion overlaps",  buf,  0x34u);
    }

    if (a8 == 10)
    {
      id v27 = sub_1000233A4();
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v29 = sub_100018A78(0xAuLL);
        char v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        *(_DWORD *)buf = 134218242;
        unint64_t v83 = a6;
        __int16 v84 = 2114;
        double v85 = *(double *)&v30;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "hang endTime  %llu for hangsubType %{public}@",  buf,  0x16u);
      }
    }

    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472LL;
    v81[2] = sub_10001B6A0;
    v81[3] = &unk_1000499C8;
    v81[4] = self;
    v81[5] = a8;
    *(double *)&v81[6] = v17;
    AnalyticsSendEventLazy(off_10005B0E8, v81);
    if (a8 != 8)
    {
      j__ADClientPushValueForDistributionKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.hangtracer.%@.%@",  v80,  self->processBundleID),  v17);
      id v31 = sub_100018A78(a8);
      int v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      processBundleID = self->processBundleID;
      id v34 = sub_100018594();
      char v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      sub_100018674(v32, processBundleID, a5, a6, v35);
    }

    unsigned __int8 v36 = -[HTProcessInfo shouldDisplayNonFenceHangToHUD](self, "shouldDisplayNonFenceHangToHUD");
    if (v13)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      unsigned int v38 = [v37 htTailspinEnabled];

      if (!v38)
      {
        id v57 = sub_1000233A4();
        double v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          id v59 = self->processName;
          *(_DWORD *)buf = 138543362;
          unint64_t v83 = (unint64_t)v59;
          _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "%{public}@: HangTracer tailspin support is disabled, not saving a report!",  buf,  0xCu);
        }

        char v44 = 0;
        uint64_t v45 = 5LL;
        goto LABEL_47;
      }

      if (!self->shouldSaveHangLogs)
      {
        id v60 = sub_1000233A4();
        v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          v62 = self->processName;
          *(_DWORD *)buf = 138543362;
          unint64_t v83 = (unint64_t)v62;
          _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Tried to save tailspin, but shouldSaveHangLogs said NO",  buf,  0xCu);
        }

        char v44 = 0;
        uint64_t v45 = 4LL;
        goto LABEL_47;
      }

      if (!sub_100026990())
      {
        id v63 = sub_1000233A4();
        v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          id v65 = self->processName;
          *(_DWORD *)buf = 138543362;
          unint64_t v83 = (unint64_t)v65;
          _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Tried to save tailspin, but tailspin support is not present on this device!",  buf,  0xCu);
        }

        char v44 = 0;
        uint64_t v45 = 3LL;
        goto LABEL_47;
      }

      if (+[HTTailspin hasAppExceededGeneratedLogsCountForDuration:procName:isFirstPartyApp:]( &OBJC_CLASS___HTTailspin,  "hasAppExceededGeneratedLogsCountForDuration:procName:isFirstPartyApp:",  self->processName,  self->isFirstPartyApp,  v17))
      {
        id v39 = sub_1000233A4();
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          id v41 = self->processName;
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
          unsigned int v43 = [v42 runLoopHangPerPeriodLogLimit];
          *(_DWORD *)buf = 138543618;
          unint64_t v83 = (unint64_t)v41;
          __int16 v84 = 1024;
          LODWORD(v85) = v43;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "%{public}@ hit its Generated Log limit of %u for this reporting period. Not saving a report!",  buf,  0x12u);
        }

        j__ADClientAddValueForScalarKey(@"com.apple.hangtracer.HTLogsMissedDueToProcessLimit.Total", 1LL);
        j__ADClientAddValueForScalarKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.hangtracer.HTLogsMissedDueToProcessLimit.%@",  self->processName),  1LL);
        char v44 = 0;
        uint64_t v45 = 2LL;
        goto LABEL_47;
      }

      if (+[HTTailspin hasExceededDailyLimit:isFirstPartyApp:]( &OBJC_CLASS___HTTailspin,  "hasExceededDailyLimit:isFirstPartyApp:",  self->isFirstPartyApp,  v17))
      {
        uint64_t v45 = 1LL;
        j__ADClientAddValueForScalarKey(@"com.apple.hangtracer.HTLogsMissedDueToGlobalLimit.Total", 1LL);
        j__ADClientAddValueForScalarKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.hangtracer.HTLogsMissedDueToGlobalLimit.%@",  self->processName),  1LL);
        char v44 = 0;
        goto LABEL_47;
      }

      char v44 = 1;
    }

    else
    {
      char v44 = 0;
    }

    uint64_t v45 = 11LL;
LABEL_47:
    char v66 = v36 ^ 1;
    if (a8 == 10) {
      char v66 = 1;
    }
    if ((v66 & 1) == 0)
    {
      v67 = -[NSString UTF8String](self->processBundleID, "UTF8String");
      uint64_t v68 = mach_absolute_time();
      sub_1000222FC((uint64_t)v67, v68, a5, a6, v44, a8 == 2, v17);
    }

    if ((v44 & 1) != 0)
    {
      v48 = v80;
      uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@: timeout %.0fms",  v80,  self->processName,  *(void *)&v17));
      BOOL v70 = objc_alloc(&OBJC_CLASS___HTHangInfo);
      uint64_t pid = self->pid;
      BOOL v72 = self->isFirstPartyApp;
      uint64_t v73 = self->processName;
      unint64_t processPath = self->processPath;
      int v56 = v79;
      BYTE2(v77) = v36;
      BYTE1(v77) = a10;
      LOBYTE(v77) = v72;
      v75 = -[HTHangInfo initWithPid:threadID:startTime:endTime:reportedTime:blownFenceID:hangSubtype:isFirstPartyApp:isThirdPartyDevSupportModeHang:displayedInHUD:serviceName:reason:processName:processPath:userActionData:]( v70,  "initWithPid:threadID:startTime:endTime:reportedTime:blownFenceID:hangSubtype:isFirstPartyApp:isThirdPartyD evSupportModeHang:displayedInHUD:serviceName:reason:processName:processPath:userActionData:",  pid,  a4,  a5,  a6,  a6,  0LL,  a8,  v77,  v80,  v69,  v73,  processPath,  v79);
      +[HTHangInfo addHang:](&OBJC_CLASS___HTHangInfo, "addHang:", v75);
      +[HTHangInfo getHangWaitTimeout](&OBJC_CLASS___HTHangInfo, "getHangWaitTimeout");
      if (v76 <= 0.0) {
        +[HTTailspin collectTailspinAndUpdateTelemtry](&OBJC_CLASS___HTTailspin, "collectTailspinAndUpdateTelemtry");
      }
      else {
        sub_10000C034(v76);
      }
    }

    else
    {
      +[HTTailspin notifyHTTailSpinResult:failReason:hangSubType:htBugType:]( &OBJC_CLASS___HTTailspin,  "notifyHTTailSpinResult:failReason:hangSubType:htBugType:",  0LL,  v45,  a8,  sub_100018ADC(self->isFirstPartyApp, a10, v17));
      int v56 = v79;
      v48 = v80;
    }

    goto LABEL_57;
  }

  int v46 = (void *)objc_claimAutoreleasedReturnValue(+[HTHangInfo allHangs](&OBJC_CLASS___HTHangInfo, "allHangs"));
  id v47 = [v46 count];

  v48 = v80;
  if (v47)
  {
    +[HTHangInfo getHangWaitTimeout](&OBJC_CLASS___HTHangInfo, "getHangWaitTimeout");
    if (v49 <= 0.0) {
      +[HTTailspin collectTailspinAndUpdateTelemtry](&OBJC_CLASS___HTTailspin, "collectTailspinAndUpdateTelemtry");
    }
    else {
      sub_10000C034(v49);
    }
  }

  id v50 = sub_1000233A4();
  uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v52 = self->processName;
    BOOL v53 = sub_100018A78(a8);
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    *(_DWORD *)buf = 138544386;
    unint64_t v83 = (unint64_t)v52;
    __int16 v84 = 2048;
    double v85 = v17 / 1000.0;
    __int16 v86 = 2114;
    id v87 = v80;
    __int16 v88 = 2114;
    v89 = v54;
    __int16 v90 = 2048;
    double v91 = (double)(unint64_t)[v55 runloopHangDurationThresholdMSec] / 1000.0;
    _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Hang detected %.2fs (%{public}@, %{public}@) duration < capture threshold %.2fs after accounting for a ssertion overlaps, not capturing tailspin for it",  buf,  0x34u);
  }

  int v56 = v79;
LABEL_57:
}

+ (void)recordFenceHang:(id)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5 reportedTime:(unint64_t)a6 blownFenceId:(unint64_t)a7 saveTailspin:(BOOL)a8 subtype:(int64_t)a9 isThirdPartyDevSupportModeHang:(BOOL)a10 captureMicroHang:(BOOL)a11
{
  id v15 = a3;
  double v16 = sub_100025798(a5 - a4);
  double v17 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  id v18 = [v17 runloopHangDurationThresholdMSec];

  if (a9 != 9 && (v16 > (double)(unint64_t)v18 || a11))
  {
    id v22 = sub_1000233A4();
    __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      double v38 = v16 / 1000.0;
      __int16 v39 = 2114;
      id v40 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Fence-hang: Hang detected %.2fs (%{public}@) > capture threshold",  buf,  0x16u);
    }

    j__ADClientAddValueForScalarKey(@"com.apple.hangtracer.HTLogsFenceHang.PreTailspin", 1LL);
    int v24 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    unsigned int v25 = [v24 shouldDisplayFenceHangToHUD];

    if (v25)
    {
      double v26 = sub_100025798(a5 - a4 - 24000000);
      uint64_t v27 = mach_absolute_time();
      sub_1000222FC((uint64_t)"Fence Hang", v27, a4 + 12000000, a5 - 12000000, 1, a9 == 2, v26);
    }

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    unsigned int v29 = [v28 htTailspinEnabled];

    if (v29)
    {
      if (+[HTProcessInfo shouldSaveFenceHangLogs](&OBJC_CLASS___HTProcessInfo, "shouldSaveFenceHangLogs"))
      {
        if (sub_100026990())
        {
          if (!+[HTTailspin hasExceededDailyFenceLogLimit](&OBJC_CLASS___HTTailspin, "hasExceededDailyFenceLogLimit"))
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@: timeout %.0fms",  v15,  @"AppTBD",  *(void *)&v16));
            BYTE2(v36) = v25;
            BYTE1(v36) = a10;
            LOBYTE(v36) = 0;
            id v34 = -[HTHangInfo initWithPid:threadID:startTime:endTime:reportedTime:blownFenceID:hangSubtype:isFirstPartyApp:isThirdPartyDevSupportModeHang:displayedInHUD:serviceName:reason:processName:processPath:userActionData:]( objc_alloc(&OBJC_CLASS___HTHangInfo),  "initWithPid:threadID:startTime:endTime:reportedTime:blownFenceID:hangSubtype:isFirstPartyApp:isThird PartyDevSupportModeHang:displayedInHUD:serviceName:reason:processName:processPath:userActionData:",  0LL,  0LL,  a4,  a5,  a6,  a7,  a9,  v36,  v15,  v33,  @"AppTBD",  &stru_10004A8D0,  0LL);
            +[HTHangInfo addHang:](&OBJC_CLASS___HTHangInfo, "addHang:", v34);
            +[HTHangInfo getHangWaitTimeout](&OBJC_CLASS___HTHangInfo, "getHangWaitTimeout");
            if (v35 <= 0.0) {
              +[HTTailspin collectTailspinAndUpdateTelemtry]( &OBJC_CLASS___HTTailspin,  "collectTailspinAndUpdateTelemtry");
            }
            else {
              sub_10000C034(v35);
            }

            goto LABEL_24;
          }

          uint64_t v30 = 1LL;
        }

        else
        {
          uint64_t v30 = 3LL;
        }
      }

      else
      {
        uint64_t v30 = 14LL;
      }
    }

    else
    {
      uint64_t v30 = 5LL;
    }

    +[HTTailspin notifyHTTailSpinResult:failReason:hangSubType:htBugType:]( &OBJC_CLASS___HTTailspin,  "notifyHTTailSpinResult:failReason:hangSubType:htBugType:",  0LL,  v30,  a9,  0LL);
    goto LABEL_24;
  }

  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(+[HTHangInfo allHangs](&OBJC_CLASS___HTHangInfo, "allHangs"));
  id v20 = [v19 count];

  if (v20)
  {
    +[HTHangInfo getHangWaitTimeout](&OBJC_CLASS___HTHangInfo, "getHangWaitTimeout");
    if (v21 <= 0.0) {
      +[HTTailspin collectTailspinAndUpdateTelemtry](&OBJC_CLASS___HTTailspin, "collectTailspinAndUpdateTelemtry");
    }
    else {
      sub_10000C034(v21);
    }
  }

  id v31 = sub_1000233A4();
  int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    double v38 = v16 / 1000.0;
    __int16 v39 = 2114;
    id v40 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Fence-hang: Hang detected %.2fs (%{public}@), duration < capture threshold after accounting for assertion overlaps , not capturing tailspin for it",  buf,  0x16u);
  }

LABEL_24:
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@(%d)",  self->processName,  self->pid);
}

- (void)dealloc
{
  id v3 = sub_1000233A4();
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002CD84((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);
  }

  shmem_region = self->shmem_region;
  if (shmem_region)
  {
    munmap(shmem_region, self->shmem_length);
    self->shmem_region = 0LL;
  }

  appExitSource = self->appExitSource;
  if (appExitSource) {
    dispatch_source_cancel((dispatch_source_t)appExitSource);
  }
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___HTProcessInfo;
  -[HTProcessInfo dealloc](&v13, "dealloc");
}

- (id)getApplicationByBundleId:(id)a3
{
  appInfo = self->appInfo;
  if (!appInfo)
  {
    id v5 = sub_1000233A4();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10002CDF0((uint64_t)self, v6, v7, v8, v9, v10, v11, v12);
    }

    id v13 = objc_alloc((Class)&OBJC_CLASS___LSApplicationRecord);
    processBundleID = self->processBundleID;
    id v23 = 0LL;
    id v15 = (LSApplicationRecord *)[v13 initWithBundleIdentifier:processBundleID allowPlaceholder:0 error:&v23];
    id v16 = v23;
    double v17 = self->appInfo;
    self->appInfo = v15;

    if (v16)
    {
      id v18 = sub_1000233A4();
      BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = self->processBundleID;
        *(_DWORD *)buf = 138543618;
        unsigned int v25 = v20;
        __int16 v26 = 2112;
        id v27 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "There was an error querying the LS database for bundle id %{public}@: %@",  buf,  0x16u);
      }

      double v21 = self->appInfo;
      self->appInfo = 0LL;
    }

    appInfo = self->appInfo;
  }

  return appInfo;
}

- (BOOL)isDeveloperApp
{
  if (self->isFirstPartyApp) {
    return 0;
  }
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned __int8 v5 = [v4 thirdPartyIncludeNonDevelopmentApps];

  if ((v5 & 1) != 0) {
    return 1;
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[HTProcessInfo getApplicationByBundleId:](self, "getApplicationByBundleId:", self->processBundleID));
  unsigned __int8 v7 = [v6 isProfileValidated];

  return v7;
}

- (BOOL)checkShouldSaveHangLogs
{
  if (self->shouldDisableProcess)
  {
    LOBYTE(v2) = 0;
  }

  else
  {
    int v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    unsigned __int8 v5 = [v4 isInternal];

    if ((v5 & 1) != 0)
    {
      LOBYTE(v2) = 1;
    }

    else
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
      id v13 = 0LL;
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 getHighestPrioritySettingValue:@"HangTracerEnabled" matchingSelector:"BOOLValue" contextPrefixOut:&v13]);
      id v8 = v13;

      if (v7)
      {
        if ([v8 isEqualToString:@"HTThirdPartyDevSupport"]
          && !-[HTProcessInfo isDeveloperApp](self, "isDeveloperApp"))
        {
          LOBYTE(v2) = 0;
        }

        else
        {
          LOBYTE(v2) = [v7 BOOLValue];
        }
      }

      else
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
        unsigned int v2 = [v9 hangtracerDaemonEnabled];

        id v10 = sub_1000233A4();
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v15 = v2;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "No overriden settings found to be enabling or disabling hangtracing. Using default of %{BOOL}d.",  buf,  8u);
        }
      }
    }
  }

  return v2;
}

- (BOOL)shouldDisplayNonFenceHangToHUD
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  if ([v3 isInternal])
  {
    int v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    unsigned int v5 = [v4 hudEnabled];

    if (v5) {
      return !self->shouldDisableProcess;
    }
  }

  else
  {
  }

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  unsigned int v8 = [v7 thirdPartyDevHangHUDEnabled];

  return v8 && -[HTProcessInfo isDeveloperApp](self, "isDeveloperApp");
}

- (void).cxx_destruct
{
}

@end