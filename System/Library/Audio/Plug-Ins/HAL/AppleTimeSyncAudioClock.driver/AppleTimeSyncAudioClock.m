id AppleTimeSyncAudioClockFactory(uint64_t a1, const void *a2)
{
  CFUUIDRef v3;
  void *v4;
  id v5;
  uint8_t buf[16];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AppleTimeSyncAudioClockFactory factory for AudioServerPlugin\n",  buf,  2u);
  }

  v3 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x44u,  0x3Au,  0xBAu,  0xB8u,  0xE7u,  0xB3u,  0x49u,  0x1Au,  0xB9u,  0x85u,  0xBEu,  0xB9u,  0x18u,  0x70u,  0x30u,  0xDBu);
  if (!CFEqual(a2, v3)) {
    return 0LL;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ATSACCAPlugin sharedPlugin](&OBJC_CLASS___ATSACCAPlugin, "sharedPlugin"));
  v5 = [v4 driverRef];

  return v5;
}

void sub_3808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_388C(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  v2 = (void *)_sharedPlugin;
  _sharedPlugin = (uint64_t)v1;
}

void sub_3A14(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  [*(id *)(a1 + 32) setupIOKitMatching];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSClockManager sharedClockManager](&OBJC_CLASS___TSClockManager, "sharedClockManager"));
  [v3 addClient:*(void *)(a1 + 32)];

  objc_autoreleasePoolPop(v2);
}

void sub_3CD8(_Unwind_Exception *a1)
{
}

void sub_3D10(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 56LL);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_3DC0;
  v6[3] = &unk_C3B8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void sub_3DC0(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v8 = 136316418;
    v9 = "strongSelf != nil";
    __int16 v10 = 2048;
    uint64_t v11 = 0LL;
    __int16 v12 = 2048;
    uint64_t v13 = 0LL;
    __int16 v14 = 2080;
    v15 = &unk_A2DD;
    __int16 v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/AppleTimeSyncAudioClock/ATSACCAPlugin.m";
    __int16 v18 = 1024;
    int v19 = 100;
LABEL_12:
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  (uint8_t *)&v8,  0x3Au);
    goto LABEL_5;
  }

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___IOKRegistryEntry);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v8 = 136316418;
    v9 = "[object isKindOfClass:[IOKRegistryEntry class]]";
    __int16 v10 = 2048;
    uint64_t v11 = 0LL;
    __int16 v12 = 2048;
    uint64_t v13 = 0LL;
    __int16 v14 = 2080;
    v15 = &unk_A2DD;
    __int16 v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/AppleTimeSyncAudioClock/ATSACCAPlugin.m";
    __int16 v18 = 1024;
    int v19 = 101;
    goto LABEL_12;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) propertyForKey:@"ClockIdentifier"]);
  if (!v6)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v8 = 136316418;
    v9 = "clockIdenfierObj != nil";
    __int16 v10 = 2048;
    uint64_t v11 = 0LL;
    __int16 v12 = 2048;
    uint64_t v13 = 0LL;
    __int16 v14 = 2080;
    v15 = &unk_A2DD;
    __int16 v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/AppleTimeSyncAudioClock/ATSACCAPlugin.m";
    __int16 v18 = 1024;
    int v19 = 104;
    goto LABEL_12;
  }

  id v7 = v6;
  objc_msgSend(WeakRetained, "addClockWithIdentifier:", objc_msgSend(v6, "unsignedLongLongValue"));

LABEL_5:
  objc_autoreleasePoolPop(v2);
}

void sub_404C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 56LL);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_40FC;
  v6[3] = &unk_C3B8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void sub_40FC(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v8 = 136316418;
    v9 = "strongSelf != nil";
    __int16 v10 = 2048;
    uint64_t v11 = 0LL;
    __int16 v12 = 2048;
    uint64_t v13 = 0LL;
    __int16 v14 = 2080;
    v15 = &unk_A2DD;
    __int16 v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/AppleTimeSyncAudioClock/ATSACCAPlugin.m";
    __int16 v18 = 1024;
    int v19 = 123;
LABEL_12:
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  (uint8_t *)&v8,  0x3Au);
    goto LABEL_5;
  }

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___IOKRegistryEntry);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v8 = 136316418;
    v9 = "[object isKindOfClass:[IOKRegistryEntry class]]";
    __int16 v10 = 2048;
    uint64_t v11 = 0LL;
    __int16 v12 = 2048;
    uint64_t v13 = 0LL;
    __int16 v14 = 2080;
    v15 = &unk_A2DD;
    __int16 v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/AppleTimeSyncAudioClock/ATSACCAPlugin.m";
    __int16 v18 = 1024;
    int v19 = 124;
    goto LABEL_12;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) propertyForKey:@"ClockIdentifier"]);
  if (!v6)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v8 = 136316418;
    v9 = "clockIdenfierObj != nil";
    __int16 v10 = 2048;
    uint64_t v11 = 0LL;
    __int16 v12 = 2048;
    uint64_t v13 = 0LL;
    __int16 v14 = 2080;
    v15 = &unk_A2DD;
    __int16 v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/AppleTimeSyncAudioClock/ATSACCAPlugin.m";
    __int16 v18 = 1024;
    int v19 = 127;
    goto LABEL_12;
  }

  id v7 = v6;
  objc_msgSend(WeakRetained, "removeClockWithIdentifier:force:", objc_msgSend(v6, "unsignedLongLongValue"), 1);

LABEL_5:
  objc_autoreleasePoolPop(v2);
}

void sub_438C(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  [*(id *)(*(void *)(a1 + 32) + 32) primeNotification];
  [*(id *)(*(void *)(a1 + 32) + 40) primeNotification];
  objc_autoreleasePoolPop(v2);
}

void sub_4450(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ATSAC interruption cleanup", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(dispatch_queue_s **)(v3 + 56);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_45B8;
  block[3] = &unk_C390;
  block[4] = v3;
  dispatch_sync(v4, block);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64LL));
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = 0LL;

  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0LL;

  uint64_t v9 = *(void *)(a1 + 32);
  __int16 v10 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = 0LL;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64LL));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_4804;
  v11[3] = &unk_C390;
  v11[4] = *(void *)(a1 + 32);
  +[TSClockManager notifyWhenClockManagerIsAvailable:]( &OBJC_CLASS___TSClockManager,  "notifyWhenClockManagerIsAvailable:",  v11);
  objc_autoreleasePoolPop(v2);
}

void sub_45B8(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = sub_4784;
  __int16 v18 = sub_4794;
  id v19 = 0LL;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(dispatch_queue_s **)(v3 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_479C;
  block[3] = &unk_C408;
  block[4] = v3;
  void block[5] = &v14;
  dispatch_sync(v4, block);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v5 = (id)v15[5];
  id v6 = [v5 countByEnumeratingWithState:&v9 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      int v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend( *(id *)(a1 + 32),  "removeClockWithIdentifier:force:",  objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "unsignedLongLongValue", (void)v9),  1);
        int v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v9 objects:v20 count:16];
    }

    while (v6);
  }

  _Block_object_dispose(&v14, 8);
  objc_autoreleasePoolPop(v2);
}

void sub_475C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
}

uint64_t sub_4784(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_4794(uint64_t a1)
{
}

void sub_479C(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) allKeys]);
  id v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  objc_autoreleasePoolPop(v2);
}

void sub_4804(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  [*(id *)(a1 + 32) setupIOKitMatching];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSClockManager sharedClockManager](&OBJC_CLASS___TSClockManager, "sharedClockManager"));
  [v3 addClient:*(void *)(a1 + 32)];

  objc_autoreleasePoolPop(v2);
}

void sub_48BC(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", *(void *)(a1 + 40)));
  id v4 = (ATSACCAClockDevice *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v3]);
  if (!v4)
  {
    id v4 = -[ATSACCAClockDevice initWithClockIdentifier:withPlugin:]( objc_alloc(&OBJC_CLASS___ATSACCAClockDevice),  "initWithClockIdentifier:withPlugin:",  *(void *)(a1 + 40),  *(void *)(a1 + 32));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v5 = -[ATSACCAClockDevice objectID](v4, "objectID");
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 138412802;
      __int128 v9 = v4;
      __int16 v10 = 1024;
      unsigned int v11 = v5;
      __int16 v12 = 2048;
      uint64_t v13 = v6;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Creating device %@ (%u) for clock identifier 0x%016llx",  (uint8_t *)&v8,  0x1Cu);
    }

    if (v4)
    {
      [*(id *)(*(void *)(a1 + 32) + 16) setObject:v4 forKeyedSubscript:v3];
      [*(id *)(a1 + 32) addClockDevice:v4];
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(ATSACCAClockDevice **)(a1 + 40);
        int v8 = 134217984;
        __int128 v9 = v7;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Could not create clock device for clock identifier 0x%016llx\n",  (uint8_t *)&v8,  0xCu);
      }

      id v4 = 0LL;
    }
  }

  -[ATSACCAClockDevice setReferenceCount:]( v4,  "setReferenceCount:",  (char *)-[ATSACCAClockDevice referenceCount](v4, "referenceCount") + 1);

  objc_autoreleasePoolPop(v2);
}

void sub_4AEC(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", *(void *)(a1 + 40)));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v3]);
  unsigned int v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setReferenceCount:", (char *)objc_msgSend(v4, "referenceCount") - 1);
    if (![v5 referenceCount] || *(_BYTE *)(a1 + 48))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v6 = [v5 objectID];
        uint64_t v7 = *(void *)(a1 + 40);
        int v8 = 138412802;
        id v9 = v5;
        __int16 v10 = 1024;
        unsigned int v11 = v6;
        __int16 v12 = 2048;
        uint64_t v13 = v7;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Destroying device %@ (%u) for clock identifier 0x%016llx",  (uint8_t *)&v8,  0x1Cu);
      }

      [*(id *)(a1 + 32) removeClockDevice:v5];
      [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:v3];
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    id v9 = [v3 unsignedLongLongValue];
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Clock Device does not exist for clock identifier 0x%016llx\n",  (uint8_t *)&v8,  0xCu);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_4DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_53B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t sub_5498(uint64_t a1, double *a2, unint64_t *a3, unint64_t *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = atomic_load((unint64_t *)(v4 + 32));
  unsigned int v6 = (unint64_t *)(*(void *)(v4 + 8) + 24 * v5);
  unint64_t v7 = v6[1];
  unint64_t v8 = v6[2];
  *a2 = (double)*v6;
  *a3 = v7;
  *a4 = v8;
  return 0LL;
}

void sub_5994( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, void *a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, void *a27)
{
  _Unwind_Resume(a1);
}

void sub_59FC(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  uint64_t v3 = mach_absolute_time();
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 24);
  if (v3 - v5 <= *(void *)(a1 + 48))
  {
    uint64_t v10 = *(void *)(v4 + 32);
    v59 = v2;
    uint64_t v60 = *(void *)(v4 + 56);
    int v11 = *(unsigned __int8 *)(v4 + 88);
    *(void *)(v4 + 32) = *(void *)(a1 + 56) + v10;
    __int16 v12 = *(void **)(a1 + 32);
    uint64_t v13 = &OBJC_IVAR___ATSACCAClockDevice__clockIdentifier;
    if (v11)
    {
      uint64_t v14 = v10;
      v12[3] += v12[10];
      v15 = *(void **)(a1 + 32);
      id v58 = (id)(v15[10] + v15[3] + *(void *)(a1 + 64));
      kdebug_trace(86262820, [v15 clockIdentifier], v15[4], v15[3], 0);
LABEL_29:
      v38 = *(void **)(a1 + 32);
      uint64_t v39 = v38[5];
      v38[5] = v39 + objc_msgSend(v38, "timestampPeriod", v16, v17);
      *(void *)(*(void *)(a1 + 32) + 56) = [*(id *)(*(void *)(a1 + 32) + 136) addTimestamp:*(void *)(*(void *)(a1 + 32) + 24)];
      *(void *)(*(void *)(a1 + 32) + 72LL) = *(void *)(*(void *)(a1 + 32) + 56LL) - v60;
      v40 = *(void **)(a1 + 32);
      uint64_t v41 = v40[5];
      uint64_t v42 = v40[7];
      uint64_t v43 = v40[6];
      v40 += 19;
      v44 = v40 + 4;
      unint64_t v45 = atomic_load(v40 + 4);
      unint64_t v46 = (v45 + 1) % *v40;
      v47 = (void *)(v40[1] + 24 * v46);
      void *v47 = v41;
      v47[1] = v42;
      v47[2] = v43;
      atomic_store(v46, v44);
      uint64_t v48 = *(void *)(a1 + 32);
      uint64_t v49 = v13[14];
      uint64_t v50 = *(void *)(v48 + v49);
      LOWORD(v41) = *(_WORD *)(v48 + 16);
      uint64_t v51 = *(void *)(v48 + 24);
      uint64_t v52 = *(void *)(v48 + 32);
      uint64_t v53 = *(void *)(v48 + 40);
      uint64_t v54 = *(void *)(v48 + 56);
      char v55 = *(_BYTE *)(v48 + 88);
      v56 = *(dispatch_queue_s **)(v48 + 104);
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472LL;
      v61[2] = sub_6760;
      v61[3] = &unk_C540;
      v61[4] = v48;
      v61[5] = v53;
      v61[6] = v54;
      v61[7] = v50;
      __int16 v62 = v41;
      v61[8] = v52;
      v61[9] = v51;
      v61[10] = v14;
      v61[11] = v5;
      char v63 = v55;
      dispatch_async(v56, v61);
      kdebug_trace( 86262816,  [*(id *)(a1 + 32) clockIdentifier],  *(void *)(*(void *)(a1 + 32) + 40),  *(void *)(*(void *)(a1 + 32) + 56),  *(void *)(*(void *)(a1 + 32) + v49));
      *(void *)(*(void *)(a1 + 32) + 144LL) = v58;
      dispatch_source_set_timer( *(dispatch_source_t *)(a1 + 40),  *(void *)(*(void *)(a1 + 32) + 144LL),  0xFFFFFFFFFFFFFFFFLL,  0LL);
      v2 = v59;
      goto LABEL_30;
    }

    uint64_t v57 = v5;
    uint64_t v18 = v12[15];
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___TSgPTPClock);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0)
    {
      uint64_t v14 = v10;
      *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(*(void *)(a1 + 32) + 120) convertFromDomainToMachAbsoluteTime:*(void *)(*(void *)(a1 + 32) + 32)];
      id v58 = [*(id *)(*(void *)(a1 + 32) + 120) convertFromDomainToMachAbsoluteTime:*(void *)(*(void *)(a1 + 32) + 32) + *(void *)(a1 + 56) + 30000000];
      kdebug_trace( 86262828,  [*(id *)(a1 + 32) clockIdentifier],  *(void *)(*(void *)(a1 + 32) + 32),  *(void *)(*(void *)(a1 + 32) + 24),  0);
      uint64_t v13 = &OBJC_IVAR___ATSACCAClockDevice__clockIdentifier;
LABEL_28:
      uint64_t v5 = v57;
      *(void *)(*(void *)(a1 + 32) + 80LL) = *(void *)(*(void *)(a1 + 32) + 24LL) - v57;
      uint64_t v37 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(v37 + 24);
      uint64_t v17 = *(void *)(v37 + 80);
      goto LABEL_29;
    }

    uint64_t v20 = TSNullgPTPClockIdentity;
    uint64_t v80 = TSNullgPTPClockIdentity;
    uint64_t v81 = TSNullgPTPClockIdentity;
    unsigned __int16 v79 = -1;
    __int16 v78 = -1;
    *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(*(void *)(a1 + 32) + 120) convertFromDomainToMachAbsoluteTime:*(void *)(*(void *)(a1 + 32) + 32) grandmasterUsed:&v81 portNumber:&v79];
    id v21 = [*(id *)(*(void *)(a1 + 32) + 120) convertFromDomainToMachAbsoluteTime:*(void *)(*(void *)(a1 + 32) + 32) + *(void *)(a1 + 56) + 30000000 grandmasterUsed:&v80 portNumber:&v78];
    uint64_t v22 = v81;
    if (v81 == v80 && v79 == (unsigned __int16)v78)
    {
      id v23 = v21;
    }

    else
    {
      v24 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 104LL);
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472LL;
      v75[2] = sub_6390;
      v75[3] = &unk_C4B8;
      unsigned __int16 v76 = v79;
      v75[4] = v81;
      v75[5] = v80;
      __int16 v77 = v78;
      dispatch_async(v24, v75);
      *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(*(void *)(a1 + 32) + 120) convertFromDomainToMachAbsoluteTime:*(void *)(*(void *)(a1 + 32) + 32) grandmasterUsed:&v81 portNumber:&v79];
      id v23 = [*(id *)(*(void *)(a1 + 32) + 120) convertFromDomainToMachAbsoluteTime:*(void *)(*(void *)(a1 + 32) + 32) + *(void *)(a1 + 56) + 30000000 grandmasterUsed:&v80 portNumber:&v78];
      uint64_t v22 = v81;
      if (v81 != v80 || v79 != (unsigned __int16)v78)
      {
        v25 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 104LL);
        v72[0] = _NSConcreteStackBlock;
        v72[1] = 3221225472LL;
        v72[2] = sub_6458;
        v72[3] = &unk_C4B8;
        unsigned __int16 v73 = v79;
        v72[4] = v81;
        v72[5] = v80;
        __int16 v74 = v78;
        dispatch_async(v25, v72);
        uint64_t v22 = v81;
      }
    }

    if (v20 == v22)
    {
      *(void *)(*(void *)(a1 + 32) + 32LL) = *(void *)(a1 + 56) + v10;
      *(void *)(*(void *)(a1 + 32) + 24LL) = *(void *)(*(void *)(a1 + 32) + 80LL) + v57;
      v26 = *(void **)(a1 + 32);
      id v23 = (id)(v26[10] + v26[3] + *(void *)(a1 + 64));
      v27 = (dispatch_queue_s *)v26[13];
      v28 = &stru_C4F8;
    }

    else
    {
      uint64_t v29 = *(void *)(a1 + 32);
      uint64_t v71 = v20;
      __int16 v70 = -1;
      v30 = (char *)[*(id *)(v29 + 120) convertFromMachAbsoluteToDomainTime:v57 grandmasterUsed:&v71 portNumber:&v70];
      if (v20 != v71)
      {
        *(void *)(*(void *)(a1 + 32) + 32LL) = &v30[*(void *)(a1 + 56)];
        *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(*(void *)(a1 + 32) + 120) convertFromDomainToMachAbsoluteTime:*(void *)(*(void *)(a1 + 32) + 32) grandmasterUsed:&v81 portNumber:&v79];
        id v32 = [*(id *)(*(void *)(a1 + 32) + 120) convertFromDomainToMachAbsoluteTime:*(void *)(*(void *)(a1 + 32) + 32) + *(void *)(a1 + 56) + 30000000 grandmasterUsed:&v80 portNumber:&v78];
        uint64_t v33 = v81;
        unsigned __int16 v34 = v79;
        if (v81 == v80 && v79 == (unsigned __int16)v78)
        {
          id v23 = v32;
        }

        else
        {
          v35 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 104LL);
          v67[0] = _NSConcreteStackBlock;
          v67[1] = 3221225472LL;
          v67[2] = sub_65D0;
          v67[3] = &unk_C4B8;
          unsigned __int16 v68 = v79;
          v67[4] = v81;
          v67[5] = v80;
          __int16 v69 = v78;
          dispatch_async(v35, v67);
          *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(*(void *)(a1 + 32) + 120) convertFromDomainToMachAbsoluteTime:*(void *)(*(void *)(a1 + 32) + 32) grandmasterUsed:&v81 portNumber:&v79];
          id v23 = [*(id *)(*(void *)(a1 + 32) + 120) convertFromDomainToMachAbsoluteTime:*(void *)(*(void *)(a1 + 32) + 32) + *(void *)(a1 + 56) + 30000000 grandmasterUsed:&v80 portNumber:&v78];
          uint64_t v33 = v81;
          unsigned __int16 v34 = v79;
          if (v81 != v80 || v79 != (unsigned __int16)v78)
          {
            v36 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 104LL);
            v64[0] = _NSConcreteStackBlock;
            v64[1] = 3221225472LL;
            v64[2] = sub_6698;
            v64[3] = &unk_C4B8;
            unsigned __int16 v65 = v79;
            v64[4] = v81;
            v64[5] = v80;
            __int16 v66 = v78;
            dispatch_async(v36, v64);
            uint64_t v33 = v81;
            unsigned __int16 v34 = v79;
          }
        }

        *(void *)(*(void *)(a1 + 32) + 8LL) = v33;
        *(_WORD *)(*(void *)(a1 + 32) + 16LL) = v34;
        goto LABEL_27;
      }

      *(void *)(*(void *)(a1 + 32) + 32LL) = *(void *)(a1 + 56) + v10;
      *(void *)(*(void *)(a1 + 32) + 24LL) = *(void *)(*(void *)(a1 + 32) + 80LL) + v57;
      v31 = *(void **)(a1 + 32);
      id v23 = (id)(v31[10] + v31[3] + *(void *)(a1 + 64));
      v27 = (dispatch_queue_s *)v31[13];
      v28 = &stru_C518;
    }

    dispatch_async(v27, v28);
LABEL_27:
    id v58 = v23;
    uint64_t v14 = v10;
    uint64_t v13 = &OBJC_IVAR___ATSACCAClockDevice__clockIdentifier;
    kdebug_trace( 86262824,  [*(id *)(a1 + 32) clockIdentifier],  *(void *)(*(void *)(a1 + 32) + 32),  *(void *)(*(void *)(a1 + 32) + 24),  *(void *)(*(void *)(a1 + 32) + 8));
    goto LABEL_28;
  }

  uint64_t v6 = v3;
  ++*(void *)(v4 + 48);
  [*(id *)(*(void *)(a1 + 32) + 120) updateCoreAudioReanchors:1];
  *(_BYTE *)(*(void *)(a1 + 32) + 64LL) = 0;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(v7 + 24);
  id v9 = *(dispatch_queue_s **)(v7 + 104);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_62D4;
  block[3] = &unk_C498;
  block[4] = v6;
  void block[5] = v8;
  dispatch_async(v9, block);
  [*(id *)(a1 + 32) initializeFirstTimestamp:*(void *)(a1 + 40)];
LABEL_30:
  objc_autoreleasePoolPop(v2);
}

void sub_62D4(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 134218496;
    uint64_t v5 = v2;
    __int16 v6 = 2048;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = 2600000000LL;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Excedded reset limit %llu - %llu > %llu\n",  (uint8_t *)&v4,  0x20u);
  }
}

void sub_6390(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int16 *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int16 *)(a1 + 50);
    int v6 = 134218752;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v2;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "mach and dispatch GM ID mismatch 0x%016llx.%hu != 0x%016llx.%hu\n",  (uint8_t *)&v6,  0x22u);
  }

void sub_6458(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int16 *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int16 *)(a1 + 50);
    int v6 = 134218752;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v2;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "mach and dispatch GM ID mismatch 0x%016llx.%hu != 0x%016llx.%hu after retry\n",  (uint8_t *)&v6,  0x22u);
  }

void sub_6520(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "gPTP timestamp conversion failed\n",  v1,  2u);
  }

void sub_6578(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "gPTP timestamp conversion failed\n",  v1,  2u);
  }

void sub_65D0(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int16 *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int16 *)(a1 + 50);
    int v6 = 134218752;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v2;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "mach and dispatch GM ID mismatch 0x%016llx.%hu != 0x%016llx.%hu\n",  (uint8_t *)&v6,  0x22u);
  }

void sub_6698(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int16 *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int16 *)(a1 + 50);
    int v6 = 134218752;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v2;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "mach and dispatch GM ID mismatch 0x%016llx.%hu != 0x%016llx.%hu after retry\n",  (uint8_t *)&v6,  0x22u);
  }

void sub_6760(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [*(id *)(a1 + 32) clockIdentifier];
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    int v5 = *(unsigned __int16 *)(a1 + 96);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t v9 = v7 - *(void *)(a1 + 80);
    uint64_t v10 = v8 - *(void *)(a1 + 88);
    uint64_t v11 = "YES";
    if (!*(_BYTE *)(a1 + 98)) {
      uint64_t v11 = "NO";
    }
    int v12 = 134220290;
    id v13 = v2;
    __int16 v14 = 2048;
    uint64_t v15 = v3;
    __int16 v16 = 2048;
    uint64_t v17 = v4;
    __int16 v18 = 2048;
    uint64_t v19 = v6;
    __int16 v20 = 1024;
    int v21 = v5;
    __int16 v22 = 2048;
    uint64_t v23 = v7;
    __int16 v24 = 2048;
    uint64_t v25 = v8;
    __int16 v26 = 2048;
    uint64_t v27 = v9;
    __int16 v28 = 2048;
    uint64_t v29 = v10;
    __int16 v30 = 2080;
    v31 = v11;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: added audio timestamps (%llu, %llu) from 0x%016llx.%hu using time pair (%llu, %llu). {%lld, %lld} holdover %s\n",  (uint8_t *)&v12,  0x62u);
  }

void sub_6890(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  *(_DWORD *)(*(void *)(a1 + 32) + 92) = [*(id *)(*(void *)(a1 + 32) + 120) lockState];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v3 + 92) == 2)
  {
    *(_BYTE *)(v3 + 8_Block_object_dispose(va, 8) = 0;
    [*(id *)(a1 + 32) initializeFirstTimestamp:*(void *)(a1 + 40)];
  }

  objc_autoreleasePoolPop(v2);
}

double sub_6900(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 64LL) = 0;
  return sub_696C((unint64_t *)(*(void *)(a1 + 32) + 152LL));
}

double sub_696C(unint64_t *a1)
{
  unint64_t v2 = *a1;
  __int128 v5 = 0uLL;
  uint64_t v6 = 0LL;
  sub_85F0(&v7, v2, &v5);
  uint64_t v3 = (void *)a1[1];
  if (v3)
  {
    a1[2] = (unint64_t)v3;
    operator delete(v3);
  }

  double result = *(double *)&v7;
  *(_OWORD *)(a1 + 1) = v7;
  a1[3] = v8;
  atomic_store(0LL, a1 + 4);
  return result;
}

double sub_6BA8(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 64LL) = 0;
  return sub_696C((unint64_t *)(*(void *)(a1 + 32) + 152LL));
}

id sub_6C40(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTimestampPeriod:(*(double *)(a1 + 40) * 260.0 / 1000.0)];
}

void sub_6D20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6D30(uint64_t a1)
{
  id v1 = *(void **)(a1 + 40);
  unint64_t v2 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 104LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_6DA8;
  block[3] = &unk_C5B8;
  id v4 = v1;
  dispatch_async(v2, block);
}

void sub_6DA8(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) description]);
    int v3 = 136315138;
    id v4 = [v2 UTF8String];
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "didChangeClockMasterForClock:%s\n",  (uint8_t *)&v3,  0xCu);
  }

void sub_6E60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6F18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6F28(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  int v3 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 104LL);
  uint64_t v6 = _NSConcreteStackBlock;
  unint64_t v8 = sub_7010;
  uint64_t v9 = &unk_C628;
  int v11 = *(_DWORD *)(a1 + 48);
  uint64_t v7 = 3221225472LL;
  id v10 = v2;
  dispatch_async(v3, &v6);
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(_DWORD *)(a1 + 48) == 2)
  {
    *(_BYTE *)(v4 + 8_Block_object_dispose(va, 8) = 0;
    uint64_t v5 = *(void *)(a1 + 32);
    if (!*(_BYTE *)(v5 + 64) && *(void *)(v5 + 128)) {
      objc_msgSend((id)v5, "initializeFirstTimestamp:", v6, v7, v8, v9);
    }
  }

  else
  {
    *(_BYTE *)(v4 + 8_Block_object_dispose(va, 8) = 1;
  }
}

void sub_6FFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
}

void sub_7010(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(_DWORD *)(a1 + 40);
    id v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) description]);
    v4[0] = 67109378;
    v4[1] = v2;
    __int16 v5 = 2080;
    id v6 = [v3 UTF8String];
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "didChangeLockStateTo:%u forClock:%s\n",  (uint8_t *)v4,  0x12u);
  }

void sub_70D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7194(uint64_t a1)
{
  id v1 = *(void **)(a1 + 40);
  int v2 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 104LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_720C;
  block[3] = &unk_C5B8;
  id v4 = v1;
  dispatch_async(v2, block);
}

void sub_720C(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) description]);
    int v3 = 136315138;
    id v4 = [v2 UTF8String];
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "didBeginClockGrandmasterChangeForClock:%s\n",  (uint8_t *)&v3,  0xCu);
  }

void sub_72C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7380(uint64_t a1)
{
  id v1 = *(void **)(a1 + 40);
  id v2 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 104LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_73F8;
  block[3] = &unk_C5B8;
  id v4 = v1;
  dispatch_async(v2, block);
}

void sub_73F8(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) description]);
    int v3 = 136315138;
    id v4 = [v2 UTF8String];
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "didEndClockGrandmasterChangeForClock:%s\n",  (uint8_t *)&v3,  0xCu);
  }

void sub_74B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7B18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7B44(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int16 *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int16 *)(a1 + 50);
    int v6 = 134218752;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v2;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "mach and dispatch GM ID mismatch 0x%016llx.%hu != 0x%016llx.%hu\n",  (uint8_t *)&v6,  0x22u);
  }

void sub_7C0C(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int16 *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int16 *)(a1 + 50);
    int v6 = 134218752;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v2;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "mach and dispatch GM ID mismatch 0x%016llx.%hu != 0x%016llx.%hu after retry\n",  (uint8_t *)&v6,  0x22u);
  }

void sub_7CD4(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int16 *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int16 *)(a1 + 50);
    int v6 = 134218752;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v2;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "mach and dispatch GM ID mismatch 0x%016llx.%hu != 0x%016llx.%hu\n",  (uint8_t *)&v6,  0x22u);
  }

void sub_7D9C(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int16 *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int16 *)(a1 + 50);
    int v6 = 134218752;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v2;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "mach and dispatch GM ID mismatch 0x%016llx.%hu != 0x%016llx.%hu after retry\n",  (uint8_t *)&v6,  0x22u);
  }

void sub_7E64(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [*(id *)(a1 + 32) clockIdentifier];
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    int v5 = *(unsigned __int16 *)(a1 + 80);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 72);
    int v9 = 134220290;
    id v10 = v2;
    __int16 v11 = 2048;
    uint64_t v12 = v3;
    __int16 v13 = 2048;
    uint64_t v14 = v4;
    __int16 v15 = 2048;
    uint64_t v16 = v6;
    __int16 v17 = 1024;
    int v18 = v5;
    __int16 v19 = 2048;
    uint64_t v20 = v7;
    __int16 v21 = 2048;
    uint64_t v22 = v8;
    __int16 v23 = 2048;
    uint64_t v24 = 0LL;
    __int16 v25 = 2048;
    uint64_t v26 = 0LL;
    __int16 v27 = 2080;
    __int16 v28 = "NO";
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: added audio timestamps (%llu, %llu) from 0x%016llx.%hu using time pair (%llu, %llu). {%llu, %llu} holdover %s\n",  (uint8_t *)&v9,  0x62u);
  }

void sub_7F74(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) clockIdentifier];
    *(_DWORD *)buf = 134217984;
    id v37 = v3;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: Failed to get the initial timestamp, returned TSInvalidTime.\n",  buf,  0xCu);
  }

  unsigned int v4 = [*(id *)(a1 + 40) lockState];
  if (v4 > 2) {
    int v5 = @"Unknown";
  }
  else {
    int v5 = *(&off_C698 + (int)v4);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) clockIdentifier];
    id v7 = -[__CFString UTF8String](v5, "UTF8String");
    *(_DWORD *)buf = 134218242;
    id v37 = v6;
    __int16 v38 = 2080;
    *(void *)uint64_t v39 = v7;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: Clock lock state is %s\n",  buf,  0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___TSgPTPClock);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    id v10 = *(void **)(a1 + 40);
    id v29 = 0LL;
    unsigned int v11 = [v10 getMachAbsoluteRateRatioNumerator:&v35 denominator:&v34 machAnchor:&v33 andDomainAnchor:&v32 forGrandmasterIdentit y:&v31 portNumber:&v30 withError:&v29];
    id v12 = v29;
    BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        id v14 = [*(id *)(a1 + 32) clockIdentifier];
        *(_DWORD *)buf = 134219520;
        id v37 = v14;
        __int16 v38 = 2048;
        *(void *)uint64_t v39 = v33;
        *(_WORD *)&v39[8] = 2048;
        *(void *)&v39[10] = v32;
        __int16 v40 = 2048;
        uint64_t v41 = v35;
        __int16 v42 = 2048;
        uint64_t v43 = v34;
        __int16 v44 = 2048;
        uint64_t v45 = v31;
        __int16 v46 = 1024;
        int v47 = v30;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: Mach anchor %llu domain anchor %llu numerator %llu denominator %llu grandmaster 0x%016llx.%hu\n",  buf,  0x44u);
      }
    }

    else if (v13)
    {
      id v20 = [*(id *)(a1 + 32) clockIdentifier];
      unsigned int v21 = [v12 code];
      id v22 = objc_claimAutoreleasedReturnValue([v12 description]);
      id v23 = [v22 UTF8String];
      *(_DWORD *)buf = 134218498;
      id v37 = v20;
      __int16 v38 = 1024;
      *(_DWORD *)uint64_t v39 = v21;
      *(_WORD *)&v39[4] = 2080;
      *(void *)&v39[6] = v23;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: Failed to get rate ratio and anchor with error 0x%08x %s\n",  buf,  0x1Cu);
    }
  }

  else
  {
    __int16 v15 = *(void **)(a1 + 40);
    id v28 = 0LL;
    unsigned int v16 = [v15 getMachAbsoluteRateRatioNumerator:&v35 denominator:&v34 machAnchor:&v33 andDomainAnchor:&v32 withError:&v28];
    id v17 = v28;
    BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        id v19 = [*(id *)(a1 + 32) clockIdentifier];
        *(_DWORD *)buf = 134219008;
        id v37 = v19;
        __int16 v38 = 2048;
        *(void *)uint64_t v39 = v33;
        *(_WORD *)&v39[8] = 2048;
        *(void *)&v39[10] = v32;
        __int16 v40 = 2048;
        uint64_t v41 = v35;
        __int16 v42 = 2048;
        uint64_t v43 = v34;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: Mach anchor %llu domain anchor %llu numerator %llu denominator %llu\n",  buf,  0x34u);
      }
    }

    else if (v18)
    {
      id v24 = [*(id *)(a1 + 32) clockIdentifier];
      unsigned int v25 = [v17 code];
      id v26 = objc_claimAutoreleasedReturnValue([v17 description]);
      id v27 = [v26 UTF8String];
      *(_DWORD *)buf = 134218498;
      id v37 = v24;
      __int16 v38 = 1024;
      *(_DWORD *)uint64_t v39 = v25;
      *(_WORD *)&v39[4] = 2080;
      *(void *)&v39[6] = v27;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: Failed to get rate ratio and anchor with error 0x%08x %s\n",  buf,  0x1Cu);
    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_83A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8470( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v10 = v9;

  a9.super_class = (Class)&OBJC_CLASS___ATSACCAClockDevice;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_84AC(void *a1)
{
}

void *sub_85F0(void *a1, unint64_t a2, __int128 *a3)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    sub_867C(a1, a2);
    uint64_t v6 = a1[1];
    uint64_t v7 = v6 + 24 * a2;
    uint64_t v8 = 24 * a2;
    do
    {
      __int128 v9 = *a3;
      *(void *)(v6 + 16) = *((void *)a3 + 2);
      *(_OWORD *)uint64_t v6 = v9;
      v6 += 24LL;
      v8 -= 24LL;
    }

    while (v8);
    a1[1] = v7;
  }

  return a1;
}

void sub_8660(_Unwind_Exception *exception_object)
{
  id v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(va, 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_867C(void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_86CC();
  }
  double result = (char *)sub_86E0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void sub_86CC()
{
}

void *sub_86E0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_8798();
  }
  return operator new(24 * a2);
}

void sub_8724(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_8774(exception, a1);
}

void sub_8760(_Unwind_Exception *a1)
{
}

std::logic_error *sub_8774(std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_8798()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_addNotificationOfType_forMatching_usingNotificationPort_error_withEnumerationBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:");
}

id objc_msgSend_getMachAbsoluteRateRatioNumerator_denominator_machAnchor_andDomainAnchor_forGrandmasterIdentity_portNumber_withError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:");
}

id objc_msgSend_getMachAbsoluteRateRatioNumerator_denominator_machAnchor_andDomainAnchor_withError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:withError:");
}

id objc_msgSend_updateCoreAudioReanchors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCoreAudioReanchors:");
}