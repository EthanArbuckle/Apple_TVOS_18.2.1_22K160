@interface CacheDeletePurgeOperation
- (BOOL)cancel;
- (BOOL)reportedAmountMatchesFreedSpace:(id)a3;
- (CDPurgeOperationResult)purgeResult;
- (CacheDeletePurgeOperation)initWithInfo:(id)a3 services:(id)a4 volumes:(id)a5;
- (id)filterServices:(id)a3;
- (id)purgeSentinel:(BOOL)a3 outInode:(unint64_t *)a4;
- (unint64_t)purge_amount_needed;
- (unint64_t)purge_amount_reported;
- (unint64_t)volumeContribution:(id)a3 urgency:(int)a4 isTargetVolume:(BOOL)a5;
- (void)_startOperation:(id)a3;
- (void)batchServicesForVolume:(id)a3 atUrgency:(int)a4 services:(id)a5 batchSize:(int)a6 block:(id)a7;
- (void)cancelOperation;
- (void)oneShot:(id)a3 volume:(id)a4 urgency:(int)a5 donation:(unint64_t)a6 currentRoundResults:(id)a7 timeout:(unint64_t)a8 info:(id)a9 optionalTestInfo:(id)a10;
- (void)serviceRequest:(id)a3 volume:(id)a4 urgency:(int)a5 donation:(unint64_t)a6 info:(id)a7 optionalTestInfo:(id)a8 completion:(id)a9;
- (void)setCancel:(BOOL)a3;
- (void)setPurgeResult:(id)a3;
- (void)setPurge_amount_reported:(unint64_t)a3;
- (void)tryFSPurge:(unint64_t)a3 atUrgency:(int)a4 onVolume:(id)a5 orderedServices:(id)a6 completion:(id)a7;
@end

@implementation CacheDeletePurgeOperation

- (CacheDeletePurgeOperation)initWithInfo:(id)a3 services:(id)a4 volumes:(id)a5
{
  id v8 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___CacheDeletePurgeOperation;
  v9 = -[CacheDeleteOperation initWithInfo:services:volumes:](&v30, "initWithInfo:services:volumes:", v8, a4, a5);
  if (!v9) {
    goto LABEL_13;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation services](v9, "services", 0LL));
  id v12 = [v11 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation services](v9, "services"));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v16]);

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v26 objects:v33 count:16];
    }

    while (v13);
  }

  -[CacheDeleteOperation setServices:](v9, "setServices:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation result](v9, "result"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);

  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
  {
    v9->_purge_amount_needed = (unint64_t)[v20 unsignedLongLongValue];
    v9->_purge_amount_reported = 0LL;

LABEL_13:
    v22 = v9;
    goto LABEL_17;
  }

  uint64_t v23 = CDGetLogHandle("daemon");
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v32 = v8;
    _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "CACHE_DELETE_AMOUNT is missing in info: %{public}@",  buf,  0xCu);
  }

  v22 = 0LL;
LABEL_17:

  return v22;
}

- (void)cancelOperation
{
  uint64_t v3 = CDGetLogHandle("daemon");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CancelPurge Start ", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation services](self, "services"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __44__CacheDeletePurgeOperation_cancelOperation__block_invoke;
  v6[3] = &unk_1000598E8;
  v6[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v6];
}

void __44__CacheDeletePurgeOperation_cancelOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 inFlight])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) services]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v5]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = __44__CacheDeletePurgeOperation_cancelOperation__block_invoke_2;
    v8[3] = &unk_100058BB0;
    id v9 = v5;
    [v7 serviceCancelPurge:v8];
  }
}

void __44__CacheDeletePurgeOperation_cancelOperation__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = CDGetLogHandle("daemon");
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "CancelPurge complete (service=%{public}@)",  (uint8_t *)&v5,  0xCu);
  }
}

- (void)tryFSPurge:(unint64_t)a3 atUrgency:(int)a4 onVolume:(id)a5 orderedServices:(id)a6 completion:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v12 = a7;
  v23[0] = @"CACHE_DELETE_VOLUME";
  id v13 = a6;
  id v14 = a5;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 mountPoint]);
  v24[0] = v15;
  v23[1] = @"CACHE_DELETE_AMOUNT";
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  v23[2] = @"CACHE_DELETE_SERVICES";
  v24[1] = v16;
  v24[2] = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  3LL));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation services](self, "services"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"com.apple.deleted_helper"]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = __86__CacheDeletePurgeOperation_tryFSPurge_atUrgency_onVolume_orderedServices_completion___block_invoke;
  v21[3] = &unk_100059910;
  id v22 = v12;
  id v20 = v12;
  -[CacheDeletePurgeOperation serviceRequest:volume:urgency:donation:info:optionalTestInfo:completion:]( self,  "serviceRequest:volume:urgency:donation:info:optionalTestInfo:completion:",  v19,  v14,  v9,  a3,  v17,  0LL,  v21);
}

void __86__CacheDeletePurgeOperation_tryFSPurge_atUrgency_onVolume_orderedServices_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  uint64_t v4 = CDGetLogHandle("daemon");
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "fsPurge: result: %@", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (BOOL)reportedAmountMatchesFreedSpace:(id)a3
{
  uint64_t v4 = [a3 amountPurged];
  if ((_BYTE *)-[CacheDeletePurgeOperation purge_amount_reported](self, "purge_amount_reported") <= v4) {
    int v5 = &off_10005D4A8;
  }
  else {
    int v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  (_BYTE *)-[CacheDeletePurgeOperation purge_amount_reported](self, "purge_amount_reported")
  }
                        - v4));
  [v5 doubleValue];
  double v7 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[CacheDeletePurgeOperation purge_amount_needed](self, "purge_amount_needed")));
  [v8 doubleValue];
  BOOL v10 = v7 <= v9 * 0.03;

  return v10;
}

- (id)purgeSentinel:(BOOL)a3 outInode:(unint64_t *)a4
{
  BOOL v5 = a3;
  uint64_t v6 = sentinelDir(self, a2);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (!v7)
  {
    BOOL v10 = 0LL;
    goto LABEL_28;
  }

  memset(&v38, 0, sizeof(v38));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:@"CacheDeleteFSPurgeInProgress"]);
  BOOL v10 = v9;
  if (!v5)
  {
    id v24 = v9;
    int v25 = unlink((const char *)[v24 UTF8String]);
    uint64_t v26 = CDGetLogHandle("daemon");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [v24 UTF8String];
      if (v25)
      {
        __int128 v28 = __error();
        __int128 v29 = strerror(*v28);
      }

      else
      {
        __int128 v29 = "No Error";
      }

      *(_DWORD *)buf = 136315394;
      __darwin_ino64_t st_ino = (__darwin_ino64_t)v27;
      __int16 v41 = 2080;
      v42 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "purgeDoneSentinel unlink'd %s : %s",  buf,  0x16u);
    }

    goto LABEL_27;
  }

  id v11 = v8;
  if (mkdir((const char *)[v11 UTF8String], 0x1EDu) && *__error() != 17)
  {
    uint64_t v12 = CDGetLogHandle("daemon");
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v35 = [v11 UTF8String];
      v36 = __error();
      v37 = strerror(*v36);
      *(_DWORD *)buf = 136315394;
      __darwin_ino64_t st_ino = (__darwin_ino64_t)v35;
      __int16 v41 = 2080;
      v42 = v37;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "purgeDoneSentinel mkdir failed for %s : %s",  buf,  0x16u);
    }
  }

  id v14 = v10;
  int v15 = open((const char *)[v14 UTF8String], 514, 448);
  uint64_t v16 = CDGetLogHandle("daemon");
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (v15 == -1)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v30 = [v14 UTF8String];
      v31 = __error();
      id v32 = strerror(*v31);
      *(_DWORD *)buf = 136315394;
      __darwin_ino64_t st_ino = (__darwin_ino64_t)v30;
      __int16 v41 = 2080;
      v42 = v32;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "purgeDoneSentinel unable to open %s : %s",  buf,  0x16u);
    }

- (void)batchServicesForVolume:(id)a3 atUrgency:(int)a4 services:(id)a5 batchSize:(int)a6 block:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  v76 = (uint64_t (**)(id, void *))a7;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[CDDaemonPurgeableResultCache sharedPurgeableResultsCache]( &OBJC_CLASS___CDDaemonPurgeableResultCache,  "sharedPurgeableResultsCache"));
  v79 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v75 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 recentInfoForVolume:v10 atUrgency:v9]);
  id v14 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v83 = v13;
  if ([v11 count])
  {
    int v77 = v9;
    __int128 v97 = 0u;
    __int128 v98 = 0u;
    __int128 v95 = 0u;
    __int128 v96 = 0u;
    id v73 = v11;
    id obj = v11;
    id v15 = [obj countByEnumeratingWithState:&v95 objects:v105 count:16];
    if (!v15) {
      goto LABEL_20;
    }
    id v16 = v15;
    uint64_t v17 = *(void *)v96;
    while (1)
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v96 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v95 + 1) + 8LL * (void)i);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mountPoint", v73));
        uint64_t RootVolume = getRootVolume(v20);
        id v22 = (void *)objc_claimAutoreleasedReturnValue(RootVolume);
        if ([v20 isEqualToString:v22])
        {

LABEL_10:
          int v25 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v19]);

          if (v25)
          {
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v19]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v26, v19);
          }

          else
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  &off_10005D4A8,  v19);
          }

          continue;
        }

        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation volumes](self, "volumes"));
        id v24 = [v23 count];

        id v13 = v83;
        if (v24 == (id)1) {
          goto LABEL_10;
        }
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v83 objectForKeyedSubscript:v19]);

        if (v27)
        {
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v83 objectForKeyedSubscript:v19]);
          uint64_t v29 = evaluateNumberProperty();
          id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

          if (v30 && [v30 intValue])
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue([v83 objectForKeyedSubscript:v19]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v31, v19);
          }
        }
      }

      id v16 = [obj countByEnumeratingWithState:&v95 objects:v105 count:16];
      if (!v16)
      {
LABEL_20:

        LODWORD(v9) = v77;
        id v11 = v73;
        break;
      }
    }
  }

  uint64_t v32 = CDGetLogHandle("daemon");
  uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "batchServicesForVolume end", buf, 2u);
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v14, "allKeys"));
  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472LL;
  v92[2] = __87__CacheDeletePurgeOperation_batchServicesForVolume_atUrgency_services_batchSize_block___block_invoke;
  v92[3] = &unk_100059938;
  v74 = v14;
  v93 = v74;
  id v81 = v11;
  id v94 = v81;
  id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 sortedArrayUsingComparator:v92]);
  id v36 = [v35 mutableCopy];

  uint64_t v37 = CDGetLogHandle("daemon");
  stat v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mountPoint", v74));
    *(_DWORD *)buf = 67109634;
    int v101 = 227;
    __int16 v102 = 1024;
    *(_DWORD *)v103 = v9;
    *(_WORD *)&v103[4] = 2114;
    *(void *)&v103[6] = v39;
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "%d sortedPurgeable [urgency: %d, volume: %{public}@]:",  buf,  0x18u);
  }

  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  id v40 = v36;
  id v41 = [v40 countByEnumeratingWithState:&v88 objects:v104 count:16];
  if (v41)
  {
    id v42 = v41;
    uint64_t v43 = *(void *)v89;
    do
    {
      for (j = 0LL; j != v42; j = (char *)j + 1)
      {
        if (*(void *)v89 != v43) {
          objc_enumerationMutation(v40);
        }
        uint64_t v45 = *(void *)(*((void *)&v88 + 1) + 8LL * (void)j);
        uint64_t v46 = CDGetLogHandle("daemon");
        v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue([v83 objectForKeyedSubscript:v45]);
          *(_DWORD *)buf = 67109634;
          int v101 = 229;
          __int16 v102 = 2112;
          *(void *)v103 = v45;
          *(_WORD *)&v103[8] = 2112;
          *(void *)&v103[10] = v48;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%d\t%@ : %@", buf, 0x1Cu);
        }
      }

      id v42 = [v40 countByEnumeratingWithState:&v88 objects:v104 count:16];
    }

    while (v42);
  }

  if (![v40 count])
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue([v81 allKeys]);
    id v50 = [v49 mutableCopy];

    id v40 = v50;
  }

  v51 = v79;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  id v52 = v40;
  id v53 = [v52 countByEnumeratingWithState:&v84 objects:v99 count:16];
  v54 = &off_100046000;
  if (v53)
  {
    id v55 = v53;
    uint64_t v56 = *(void *)v85;
    while (2)
    {
      for (k = 0LL; k != v55; k = (char *)k + 1)
      {
        if (*(void *)v85 != v56) {
          objc_enumerationMutation(v52);
        }
        v58 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v81,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v84 + 1) + 8 * (void)k),  v74));
        if (v58)
        {
          -[NSMutableArray addObject:](v51, "addObject:", v58);
          if ((unint64_t)-[NSMutableArray count](v51, "count") >= a6)
          {
            uint64_t v59 = CDGetLogHandle("daemon");
            v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              id v61 = -[NSMutableArray count](v51, "count");
              *(_DWORD *)buf = 67109376;
              int v101 = 243;
              __int16 v102 = 2048;
              *(void *)v103 = v61;
              _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "%d Calling block with %lu batch items",  buf,  0x12u);
            }

            int v62 = v76[2](v76, v51);
            -[NSMutableArray removeAllObjects](v51, "removeAllObjects");
            uint64_t v63 = CDGetLogHandle("daemon");
            v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109378;
              v65 = "FALSE";
              if (v62) {
                v65 = "TRUE";
              }
              int v101 = 246;
              __int16 v102 = 2080;
              *(void *)v103 = v65;
              _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "%d batch block returned: %s",  buf,  0x12u);
            }

            v51 = v79;
            if ((v62 & 1) == 0)
            {

              int v66 = 0;
              goto LABEL_54;
            }
          }
        }
      }

      id v55 = [v52 countByEnumeratingWithState:&v84 objects:v99 count:16];
      if (v55) {
        continue;
      }
      break;
    }

    int v66 = 1;
LABEL_54:
    v54 = &off_100046000;
  }

  else
  {
    int v66 = 1;
  }

  uint64_t v67 = CDGetLogHandle("daemon");
  v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    v69 = "FALSE";
    if (v66) {
      v69 = "TRUE";
    }
    *(_DWORD *)buf = *((void *)v54 + 399);
    int v101 = 253;
    __int16 v102 = 2080;
    *(void *)v103 = v69;
    _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "%d batch for loop done, proceed: %s",  buf,  0x12u);
  }

  if (v66 && -[NSMutableArray count](v51, "count"))
  {
    uint64_t v70 = CDGetLogHandle("daemon");
    v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      id v72 = -[NSMutableArray count](v51, "count");
      *(_DWORD *)buf = 67109376;
      int v101 = 255;
      __int16 v102 = 2048;
      *(void *)v103 = v72;
      _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "%d Calling block with %lu batch items",  buf,  0x12u);
    }

    v76[2](v76, v51);
  }
}

uint64_t __87__CacheDeletePurgeOperation_batchServicesForVolume_atUrgency_services_batchSize_block___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  uint64_t v6 = evaluateStringProperty(a2);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = evaluateStringProperty(v5);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v7]);
  uint64_t v11 = evaluateNumberProperty();
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v9]);
  uint64_t v14 = evaluateNumberProperty();
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v7]);
  if (!v16)
  {

    uint64_t v12 = 0LL;
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v9]);

  if (v17)
  {
    BOOL v18 = v15 != 0LL;
    if (v12 && v15)
    {
      uint64_t v19 = (uint64_t)[v15 compare:v12];
      goto LABEL_11;
    }
  }

  else
  {

    BOOL v18 = 0;
    id v15 = 0LL;
  }

  if (v12 == 0LL && v18) {
    uint64_t v19 = 1LL;
  }
  else {
    uint64_t v19 = -1LL;
  }
LABEL_11:

  return v19;
}

- (unint64_t)volumeContribution:(id)a3 urgency:(int)a4 isTargetVolume:(BOOL)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[CDDaemonPurgeableResultCache sharedPurgeableResultsCache]( &OBJC_CLASS___CDDaemonPurgeableResultCache,  "sharedPurgeableResultsCache"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 recentInfoForVolume:v7 atUrgency:v6]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CACHE_DELETE_TOTAL_AVAILABLE"]);
  uint64_t v11 = evaluateNumberProperty();
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (a5
    || (id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CACHE_DELETE_SHARED_PURGEABLE"]),
        uint64_t v14 = evaluateNumberProperty(),
        id v15 = (void *)objc_claimAutoreleasedReturnValue(v14),
        v13,
        !v15))
  {
    id v16 = [v12 unsignedLongLongValue];
  }

  else
  {
    id v16 = [v15 unsignedLongLongValue];
  }

  return (unint64_t)v16;
}

- (id)filterServices:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", @"CACHE_DELETE_SERVICES", 0));
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v9);
        uint64_t v11 = fsPurgeableTypeToServiceMap();
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allValues]);
        unsigned int v14 = [v13 containsObject:v10];

        if (v14) {
          -[NSMutableArray addObject:](v4, "addObject:", v10);
        }
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v7);
  }

  id v15 = -[NSMutableArray copy](v4, "copy");
  return v15;
}

- (void)_startOperation:(id)a3
{
  v178 = (void (**)(id, id))a3;
  -[CacheDeleteOperation setStart_time:](self, "setStart_time:", (double)mach_absolute_time());
  v185 = self;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation info](self, "info"));
  id v180 = [v4 mutableCopy];

  uint64_t v224 = 0LL;
  v225 = (id *)&v224;
  uint64_t v226 = 0x3032000000LL;
  v227 = __Block_byref_object_copy__5;
  v228 = __Block_byref_object_dispose__5;
  id v229 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation info](v185, "info"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
  uint64_t v7 = evaluateStringProperty(v6);
  v179 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v179)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[CacheDeleteDaemonVolume volumeWithPath:](&OBJC_CLASS___CacheDeleteDaemonVolume, "volumeWithPath:"));
    if (!v8)
    {
      uint64_t v9 = CDGetLogHandle("daemon");
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        buf.f_bsize = 138412290;
        *(void *)&buf.f_iosize = v179;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Unable to validate volume: %@",  (uint8_t *)&buf,  0xCu);
      }
    }

    v182 = v8;
    id v11 = [v8 initialFreespace];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation info](v185, "info"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"CACHE_DELETE_CALLING_PROCESS"]);
    uint64_t v14 = evaluateStringProperty(v13);
    v175 = (__CFString *)objc_claimAutoreleasedReturnValue(v14);

    id v15 = objc_alloc(&OBJC_CLASS___CDPurgeOperationResult);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation volumeNames](v185, "volumeNames"));
    id v17 = -[CacheDeletePurgeOperation purge_amount_needed](v185, "purge_amount_needed");
    if (v175) {
      __int128 v18 = v175;
    }
    else {
      __int128 v18 = @"unknown";
    }
    __int128 v19 = -[CDPurgeOperationResult initWithVolumes:requestedBytes:mainVolume:clientProcName:]( v15,  "initWithVolumes:requestedBytes:mainVolume:clientProcName:",  v16,  v17,  v182,  v18);
    -[CacheDeletePurgeOperation setPurgeResult:](v185, "setPurgeResult:", v19);

    id v20 = (id)-[CacheDeleteOperation urgency](v185, "urgency");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeletePurgeOperation purgeResult](v185, "purgeResult"));
    [v21 setLevel:v20];

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation info](v185, "info"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"CACHE_DELETE_EVENT_KEY"]);
    id v24 = [v23 isEqualToString:@"CD_LOWDISK_EVENT"];
    int v25 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeletePurgeOperation purgeResult](v185, "purgeResult"));
    [v25 setLowDisk:v24];

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation info](v185, "info"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"CACHE_DELETE_EVENT_KEY"]);
    id v28 = [v27 isEqualToString:@"CD_VERYLOWDISK_EVENT"];
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeletePurgeOperation purgeResult](v185, "purgeResult"));
    [v29 setVeryLowDisk:v28];

    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation info](v185, "info"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:@"CACHE_DELETE_EVENT_KEY"]);
    id v32 = [v31 isEqualToString:@"CD_NEAR_LOW_DISK_EVENT"];
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeletePurgeOperation purgeResult](v185, "purgeResult"));
    [v33 setNearLowDisk:v32];

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v11));
    [v180 setObject:v34 forKeyedSubscript:@"CACHE_DELETE_FREESPACE_BEGIN"];

    [v180 setObject:&off_10005D4A8 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
    uint64_t v35 = CDGetLogHandle("daemon");
    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      int32_t v37 = -[CacheDeleteOperation urgencyLimit](v185, "urgencyLimit");
      stat v38 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation result](v185, "result"));
      buf.f_bsize = 67109378;
      buf.f_iosize = v37;
      LOWORD(buf.f_blocks) = 2114;
      *(uint64_t *)((char *)&buf.f_blocks + 2) = (uint64_t)v38;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "urgencyLimit: %d, info at start: %{public}@",  (uint8_t *)&buf,  0x12u);
    }

    -[CacheDeletePurgeOperation setPurge_amount_reported:](v185, "setPurge_amount_reported:", 0LL);
    uint64_t v218 = 0LL;
    v219 = &v218;
    uint64_t v220 = 0x3032000000LL;
    v221 = __Block_byref_object_copy__5;
    v222 = __Block_byref_object_dispose__5;
    id v223 = 0LL;
    uint64_t v39 = CDGetLogHandle("daemon");
    id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      id v41 = (void *)objc_claimAutoreleasedReturnValue([v182 mountPoint]);
      id v42 = (void *)objc_claimAutoreleasedReturnValue([v182 fsType]);
      buf.f_bsize = 138543618;
      *(void *)&buf.f_iosize = v41;
      WORD2(buf.f_blocks) = 2114;
      *(uint64_t *)((char *)&buf.f_blocks + 6) = (uint64_t)v42;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "mainVolume: %{public}@, fstype: %{public}@",  (uint8_t *)&buf,  0x16u);
    }

    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v182 fsType]);
    if ([v43 isEqualToString:@"apfs"])
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation services](v185, "services"));
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:@"com.apple.deleted_helper"]);
      BOOL v46 = v45 == 0LL;

      if (!v46)
      {
        FSEventStreamEventId CurrentEventId = FSEventsGetCurrentEventId();
        uint64_t v48 = CDGetLogHandle("daemon");
        v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          buf.f_bsize = 134217984;
          *(void *)&buf.f_iosize = CurrentEventId;
          _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "beforePurgeEventID: %llu",  (uint8_t *)&buf,  0xCu);
        }

        __int128 v216 = 0u;
        *(_OWORD *)dsema = 0u;
        memset(&context, 0, sizeof(context));
        uint64_t v214 = 0LL;
        id v50 = (void *)objc_claimAutoreleasedReturnValue( -[CacheDeletePurgeOperation purgeSentinel:outInode:]( v185,  "purgeSentinel:outInode:",  1LL,  &v214));
        if (v214)
        {
          bzero(&buf, 0x878uLL);
          id v51 = v50;
          if (statfs((const char *)[v51 UTF8String], &buf))
          {
            uint64_t v52 = CDGetLogHandle("daemon");
            id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              v170 = (char *)[v51 UTF8String];
              v171 = __error();
              v172 = strerror(*v171);
              *(_DWORD *)v239 = 136446466;
              v240 = v170;
              __int16 v241 = 2080;
              v242 = v172;
              _os_log_error_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "statfs failed for %{public}s : %s",  v239,  0x16u);
            }

            id obj = 0LL;
            v176 = 0LL;
            id v177 = 0LL;

LABEL_101:
            _Block_object_dispose(&v218, 8);

            id v55 = (os_log_s *)v182;
            goto LABEL_102;
          }

          *(void *)&__int128 v216 = v214;
          *((void *)&v216 + 1) = buf.f_fsid;
          v141 = dispatch_semaphore_create(0LL);
          dispatch_semaphore_t v142 = dsema[1];
          dsema[1] = v141;

          context.info = &v216;
          uint64_t v145 = sentinelDir(v143, v144);
          v146 = (void *)objc_claimAutoreleasedReturnValue(v145);
          v238 = v146;
          v140 = FSEventStreamCreate( 0LL,  (FSEventStreamCallback)fsEventStreamMonitor,  &context,  (CFArrayRef)+[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v238,  1LL),  0xFFFFFFFFFFFFFFFFLL,  0.0,  0x51u);
          if (v140)
          {
            uint64_t v147 = CDGetLogHandle("daemon");
            v148 = (os_log_s *)objc_claimAutoreleasedReturnValue(v147);
            if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v239 = 138412290;
              v240 = (char *)v146;
              _os_log_impl( (void *)&_mh_execute_header,  v148,  OS_LOG_TYPE_DEFAULT,  "Created FSEventStream with: %@",  v239,  0xCu);
            }

            dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
            v150 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
            FSEventStreamSetDispatchQueue(v140, v150);

            FSEventStreamStart(v140);
          }

          else
          {
            uint64_t v151 = CDGetLogHandle("daemon");
            v152 = (os_log_s *)objc_claimAutoreleasedReturnValue(v151);
            if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
            {
              v173 = __error();
              v174 = strerror(*v173);
              *(_DWORD *)v239 = 136315138;
              v240 = v174;
              _os_log_error_impl( (void *)&_mh_execute_header,  v152,  OS_LOG_TYPE_ERROR,  "unable to create fsEventStream: %s",  v239,  0xCu);
            }
          }
        }

        else
        {
          uint64_t v138 = CDGetLogHandle("daemon");
          v139 = (os_log_s *)objc_claimAutoreleasedReturnValue(v138);
          if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf.f_bsize) = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  v139,  OS_LOG_TYPE_ERROR,  "unable to create sentinel file",  (uint8_t *)&buf,  2u);
          }

          v140 = 0LL;
        }

        *(void *)&buf.f_bsize = 0LL;
        buf.f_blocks = (uint64_t)&buf;
        buf.f_bfree = 0x2020000000LL;
        buf.f_bavail = 0LL;
        uint64_t v153 = CDGetLogHandle("daemon");
        v154 = (os_log_s *)objc_claimAutoreleasedReturnValue(v153);
        if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
        {
          v155 = (char *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation volumes](v185, "volumes"));
          *(_DWORD *)v239 = 138412290;
          v240 = v155;
          _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_DEFAULT, "VOLUMES: %@", v239, 0xCu);
        }

        v209[0] = _NSConcreteStackBlock;
        v209[1] = 3221225472LL;
        v209[2] = __45__CacheDeletePurgeOperation__startOperation___block_invoke;
        v209[3] = &unk_100059988;
        v209[4] = v185;
        id v156 = v182;
        id v210 = v156;
        id v157 = v180;
        id v211 = v157;
        p_statfs buf = &buf;
        v213 = &v218;
        -[CacheDeleteOperation performBlockWithUrgency:](v185, "performBlockWithUrgency:", v209);
        BOOL v158 = 0LL;
        if (v140 && v214)
        {
          id v159 = -[CacheDeletePurgeOperation purgeSentinel:outInode:](v185, "purgeSentinel:outInode:", 0LL, 0LL);
          dispatch_semaphore_wait(dsema[1], 0xFFFFFFFFFFFFFFFFLL);
          BOOL v158 = LOBYTE(dsema[0]) != 0;
          dispatch_semaphore_t v160 = dsema[1];
          dsema[1] = 0LL;

          FSEventStreamStop(v140);
          FSEventStreamInvalidate(v140);
          FSEventStreamRelease(v140);
        }

        if (-[CacheDeletePurgeOperation purge_amount_reported](v185, "purge_amount_reported")
          || [v156 amountPurged])
        {
          if (v219[5])
          {
            v236[0] = @"CACHE_DELETE_FSPURGED_VOLUMES";
            v161 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  CurrentEventId));
            v234 = v161;
            uint64_t v235 = v219[5];
            v162 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v235,  &v234,  1LL));
            v237[0] = v162;
            v236[1] = @"rescan";
            v163 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v158));
            v237[1] = v163;
            v176 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v237,  v236,  2LL));
          }

          else
          {
            v176 = 0LL;
          }

          id v164 = [v156 amountPurged];
          if (v164 >= (id)-[CacheDeletePurgeOperation purge_amount_needed](v185, "purge_amount_needed"))
          {
            uint64_t v165 = CDGetLogHandle("daemon");
            v166 = (os_log_s *)objc_claimAutoreleasedReturnValue(v165);
            if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
            {
              v167 = (char *)objc_claimAutoreleasedReturnValue([v156 mountPoint]);
              *(_DWORD *)v239 = 138543362;
              v240 = v167;
              _os_log_impl( (void *)&_mh_execute_header,  v166,  OS_LOG_TYPE_DEFAULT,  "[Purge goal satisfied by fsPurge for %{public}@, skipping cleanup and services loop",  v239,  0xCu);
            }

            [v157 setObject:&__kCFBooleanFalse forKeyedSubscript:@"CACHE_DELETE_QUERY_AFTER_PURGE"];
            int v168 = 24;
LABEL_130:

            _Block_object_dispose(&buf, 8);
            if (v168)
            {
              id obj = 0LL;
              v184 = 0LL;
              id v177 = 0LL;
LABEL_74:
              uint64_t v102 = mach_absolute_time();
              -[CacheDeleteOperation start_time](v185, "start_time");
              double v104 = v103;
              double v105 = gTimebaseConversion;
              v106 = (void *)objc_claimAutoreleasedReturnValue([v180 objectForKeyedSubscript:@"CACHE_DELETE_QUERY_AFTER_PURGE"]);
              BOOL v107 = v106 == 0LL;

              if (v107)
              {
                v108 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[CacheDeletePurgeOperation reportedAmountMatchesFreedSpace:]( v185,  "reportedAmountMatchesFreedSpace:",  v182) ^ 1));
                [v180 setObject:v108 forKeyedSubscript:@"CACHE_DELETE_QUERY_AFTER_PURGE"];
              }

              if (v176) {
                [v180 setObject:v176 forKeyedSubscript:@"CACHE_DELETE_FS_PURGE_NOTIFY"];
              }
              v109 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[CacheDeletePurgeOperation purge_amount_reported](v185, "purge_amount_reported")));
              [v180 setObject:v109 forKeyedSubscript:@"CACHE_DELETE_AMOUNT_REPORTED"];

              v110 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  ((double)v102 - v104) * v105 / 1000000000.0));
              [v180 setObject:v110 forKeyedSubscript:@"CACHE_DELETE_ELAPSED_TIME"];

              if (-[CacheDeletePurgeOperation cancel](v185, "cancel")) {
                [v180 setObject:@"Purge operation was cancelled" forKeyedSubscript:@"CACHE_DELETE_ERROR"];
              }
              v111 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v182 amountPurged]));
              [v180 setObject:v111 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

              v112 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[CacheDeletePurgeOperation purge_amount_reported](v185, "purge_amount_reported")));
              [v180 setObject:v112 forKeyedSubscript:@"CACHE_DELETE_AMOUNT_REPORTED"];

              id v113 = [v182 freespace];
              v114 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v113));
              [v180 setObject:v114 forKeyedSubscript:@"CACHE_DELETE_FREESPACE_END"];

              v115 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeletePurgeOperation purgeResult](v185, "purgeResult"));
              [v115 setEndFreeSpace:v113];

              v116 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeletePurgeOperation purgeResult](v185, "purgeResult"));
              [v116 finish];

              v117 = (void *)objc_claimAutoreleasedReturnValue([v180 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);
              id v118 = [v117 unsignedLongLongValue];

              if (-[CacheDeletePurgeOperation cancel](v185, "cancel"))
              {
                [v180 setObject:@"Operation Cancelled" forKeyedSubscript:@"CACHE_DELETE_ERROR"];
                [v180 setObject:&__kCFBooleanTrue forKeyedSubscript:@"CACHE_DELETE_OPERATION_CANCELLED"];
              }

              else if (v118 < (id)-[CacheDeletePurgeOperation purge_amount_needed](v185, "purge_amount_needed"))
              {
                uint64_t v119 = CDGetLogHandle("daemon");
                v120 = (os_log_s *)objc_claimAutoreleasedReturnValue(v119);
                if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
                {
                  v169 = (void *)objc_claimAutoreleasedReturnValue([v182 mountPoint]);
                  buf.f_bsize = 138543362;
                  *(void *)&buf.f_iosize = v169;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v120,  OS_LOG_TYPE_ERROR,  "CacheDelete was unable to satisfy the purge request for volume: %{public}@",  (uint8_t *)&buf,  0xCu);
                }

                v121 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeletePurgeOperation purgeResult](v185, "purgeResult"));
                [v121 setSuccess:0];
              }

              v122 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation analyticsReporter](v185, "analyticsReporter"));
              v123 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeletePurgeOperation purgeResult](v185, "purgeResult"));
              [v122 reportPurge:v123];

              v124 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation testFailures](v185, "testFailures"));
              if (v124)
              {
                v125 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation testFailures](v185, "testFailures"));
                BOOL v126 = [v125 count] == 0;

                if (!v126)
                {
                  v127 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation testFailures](v185, "testFailures"));
                  [v180 setObject:v127 forKeyedSubscript:@"CACHE_DELETE_TEST_FAILURES"];
                }
              }

              uint64_t v128 = CDGetLogHandle("daemon");
              v129 = (os_log_s *)objc_claimAutoreleasedReturnValue(v128);
              if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
              {
                buf.f_bsize = 134349314;
                *(void *)&buf.f_iosize = v118;
                WORD2(buf.f_blocks) = 2114;
                *(uint64_t *)((char *)&buf.f_blocks + 6) = (uint64_t)v182;
                _os_log_impl( (void *)&_mh_execute_header,  v129,  OS_LOG_TYPE_DEFAULT,  "Purge Result: %{public}llu bytes on: %{public}@",  (uint8_t *)&buf,  0x16u);
              }

              __int128 v188 = 0u;
              __int128 v189 = 0u;
              __int128 v186 = 0u;
              __int128 v187 = 0u;
              id v130 = v180;
              id v131 = [v130 countByEnumeratingWithState:&v186 objects:v230 count:16];
              if (v131)
              {
                uint64_t v132 = *(void *)v187;
                do
                {
                  for (i = 0LL; i != v131; i = (char *)i + 1)
                  {
                    if (*(void *)v187 != v132) {
                      objc_enumerationMutation(v130);
                    }
                    uint64_t v134 = *(void *)(*((void *)&v186 + 1) + 8LL * (void)i);
                    uint64_t v135 = CDGetLogHandle("daemon");
                    v136 = (os_log_s *)objc_claimAutoreleasedReturnValue(v135);
                    if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
                    {
                      v137 = (void *)objc_claimAutoreleasedReturnValue([v130 objectForKeyedSubscript:v134]);
                      buf.f_bsize = 138543618;
                      *(void *)&buf.f_iosize = v134;
                      WORD2(buf.f_blocks) = 2114;
                      *(uint64_t *)((char *)&buf.f_blocks + 6) = (uint64_t)v137;
                      _os_log_impl( (void *)&_mh_execute_header,  v136,  OS_LOG_TYPE_DEFAULT,  "%{public}@ : %{public}@",  (uint8_t *)&buf,  0x16u);
                    }
                  }

                  id v131 = [v130 countByEnumeratingWithState:&v186 objects:v230 count:16];
                }

                while (v131);
              }

              v178[2](v178, v130);
              goto LABEL_101;
            }

uint64_t __45__CacheDeletePurgeOperation__startOperation___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v41 = [*(id *)(a1 + 32) timeoutNotReached];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
  uint64_t v60 = 0LL;
  uint64_t v61 = &v60;
  uint64_t v62 = 0x2020000000LL;
  uint64_t v63 = 0LL;
  v59[0] = 0LL;
  v59[1] = v59;
  v59[2] = 0x2020000000LL;
  v59[3] = nan("");
  id v5 = *(void **)(a1 + 32);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 info]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 filterServices:v6]);

  uint64_t v43 = mach_absolute_time();
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) volumes]);
  id v9 = [v8 countByEnumeratingWithState:&v55 objects:v74 count:16];
  if (!v9) {
    goto LABEL_23;
  }
  uint64_t v44 = *(void *)v56;
  *(void *)&__int128 v10 = 134219010LL;
  __int128 v39 = v10;
  unsigned int v40 = a2;
  while (2)
  {
    id v42 = v9;
    for (i = 0LL; i != v42; i = (char *)i + 1)
    {
      if (*(void *)v56 != v44) {
        objc_enumerationMutation(v8);
      }
      uint64_t v12 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
      id v13 = objc_msgSend(*(id *)(a1 + 32), "purge_amount_needed", v39);
      if (v13 <= [*(id *)(a1 + 40) amountPurged])
      {
        int64_t v15 = 0LL;
      }

      else
      {
        uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "purge_amount_needed");
        int64_t v15 = v14 - (_BYTE *)[*(id *)(a1 + 40) amountPurged];
      }

      id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 mountPoint]);
      id v17 = (id)dropBreadcrumb();

      id v18 = objc_msgSend(*(id *)(a1 + 32), "purge_amount_needed");
      if (v18 <= [*(id *)(a1 + 40) amountPurged])
      {
        uint64_t v35 = CDGetLogHandle("daemon");
        id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          int32_t v37 = (void *)objc_claimAutoreleasedReturnValue([v12 mountPoint]);
          *(_DWORD *)statfs buf = 138412290;
          v65 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Purge satisfied, skipping %@", buf, 0xCu);
        }

        goto LABEL_22;
      }

      if ([*(id *)(a1 + 32) cancel])
      {
        [*(id *)(a1 + 48) setObject:&__kCFBooleanTrue forKeyedSubscript:@"CACHE_DELETE_OPERATION_CANCELLED"];
LABEL_22:
        unsigned __int8 v41 = 0;
        goto LABEL_23;
      }

      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = __45__CacheDeletePurgeOperation__startOperation___block_invoke_50;
      v45[3] = &unk_100059960;
      uint64_t v53 = v43;
      uint64_t v50 = *(void *)(a1 + 56);
      id v51 = &v60;
      id v20 = *(void **)(a1 + 32);
      __int128 v19 = *(void **)(a1 + 40);
      v49 = v59;
      v45[4] = v20;
      id v21 = v19;
      int v54 = a2;
      id v46 = v21;
      v47 = v12;
      uint64_t v52 = *(void *)(a1 + 64);
      id v22 = v4;
      uint64_t v48 = v22;
      [v20 tryFSPurge:v15 atUrgency:a2 onVolume:v12 orderedServices:v7 completion:v45];
      dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
      id v23 = [*(id *)(a1 + 40) amountPurged];
      if (v23 >= objc_msgSend(*(id *)(a1 + 32), "purge_amount_needed"))
      {
        uint64_t v24 = CDGetLogHandle("daemon");
        int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = v8;
          id v27 = v7;
          id v28 = v4;
          uint64_t v29 = (void *)v61[3];
          id v30 = [*(id *)(a1 + 40) amountPurged];
          id v31 = objc_msgSend(*(id *)(a1 + 32), "purge_amount_needed");
          id v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mountPoint]);
          uint64_t v33 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
          *(_DWORD *)statfs buf = v39;
          v65 = v29;
          __int16 v66 = 2048;
          id v67 = v30;
          __int16 v68 = 2048;
          id v69 = v31;
          __int16 v70 = 2112;
          v71 = v32;
          __int16 v72 = 2048;
          uint64_t v73 = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "fsPurge satisfied request: %llu purged (%llu measured) of %llu needed on volume: %@, ET: %f",  buf,  0x34u);

          dispatch_semaphore_t v4 = v28;
          uint64_t v7 = v27;
          uint64_t v8 = v26;
          a2 = v40;
        }

        v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) purgeResult]);
        [v34 setFsPurgeSuccess:1];

        unsigned __int8 v41 = 0;
      }
    }

    id v9 = [v8 countByEnumeratingWithState:&v55 objects:v74 count:16];
    if (v9) {
      continue;
    }
    break;
  }

void __45__CacheDeletePurgeOperation__startOperation___block_invoke_50(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(double *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = gTimebaseConversion
                                                              * ((double)mach_absolute_time()
  *(double *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = *(double *)(*(void *)(*(void *)(a1 + 64) + 8LL)
                                                                          + 24LL)
  if (v3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) += [v3 reportedBytes];
    dispatch_semaphore_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) purgeResult]);
    [v4 addResult:v3];

    objc_msgSend( *(id *)(a1 + 32),  "setPurge_amount_reported:",  (char *)objc_msgSend(v3, "reportedBytes") + (void)objc_msgSend(*(id *)(a1 + 32), "purge_amount_reported"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) analyticsReporter]);
    [v5 reportPurgeTimingInfo:v3];
  }

  uint64_t v6 = CDGetLogHandle("daemon");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v3 reportedBytes];
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL);
    id v10 = [*(id *)(a1 + 40) amountPurged];
    id v11 = objc_msgSend(*(id *)(a1 + 32), "purge_amount_needed");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mountPoint]);
    int v13 = *(_DWORD *)(a1 + 104);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) mountPoint]);
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
    int v28 = 134219778;
    id v29 = v8;
    __int16 v30 = 2048;
    id v31 = v9;
    __int16 v32 = 2048;
    id v33 = v10;
    __int16 v34 = 2048;
    id v35 = v11;
    __int16 v36 = 2114;
    int32_t v37 = v12;
    __int16 v38 = 1024;
    int v39 = v13;
    __int16 v40 = 2112;
    unsigned __int8 v41 = v14;
    __int16 v42 = 2048;
    uint64_t v43 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "fsPurge reports %llu purged (%llu total reported, %llu measured) of %llu needed on volume: %{public}@ at urgency: %d by purging volume: %@, ET: %f",  (uint8_t *)&v28,  0x4Eu);
  }

  if ([v3 reportedBytes])
  {
    id v16 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL);
    if (!v16)
    {
      id v17 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      uint64_t v18 = *(void *)(*(void *)(a1 + 88) + 8LL);
      __int128 v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;

      id v16 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL);
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) uuid]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 UUIDString]);
    [v16 addObject:v21];

    uint64_t v22 = CDGetLogHandle("daemon");
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) mountPoint]);
      int v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) uuid]);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 UUIDString]);
      int v28 = 138412546;
      id v29 = v24;
      __int16 v30 = 2112;
      id v31 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "fsPurge noting purge on %@ : %@",  (uint8_t *)&v28,  0x16u);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  if (![v3 reportedBytes])
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) mountPoint]);
    removeBreadcrumb(v27);
  }
}

BOOL __45__CacheDeletePurgeOperation__startOperation___block_invoke_61(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8LL);
  if (*(_BYTE *)(v3 + 24))
  {
    unsigned __int8 v4 = [*(id *)(a1 + 32) timeoutNotReached];
    uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8LL);
  }

  else
  {
    unsigned __int8 v4 = 0;
  }

  *(_BYTE *)(v3 + 24) = v4;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL))
  {
    uint64_t v5 = CDGetLogHandle("daemon");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mountPoint]);
      *(_DWORD *)statfs buf = 67109378;
      *(_DWORD *)v71 = 576;
      *(_WORD *)&v71[4] = 2112;
      *(void *)&v71[6] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%d : Timeout reached for (%@) - stopping purge urgency loop.",  buf,  0x12u);
    }

    return 0LL;
  }

  if ([*(id *)(a1 + 32) cancel])
  {
    [*(id *)(a1 + 48) setObject:&__kCFBooleanTrue forKeyedSubscript:@"CACHE_DELETE_OPERATION_CANCELLED"];
    return 0LL;
  }

  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) volumes]);
  id v49 = [obj countByEnumeratingWithState:&v66 objects:v75 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v67;
    *(void *)&__int128 v9 = 138544130LL;
    __int128 v46 = v9;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v67 != v48)
        {
          uint64_t v11 = v10;
          objc_enumerationMutation(obj);
          uint64_t v10 = v11;
        }

        uint64_t v50 = v10;
        uint64_t v12 = *(void **)(*((void *)&v66 + 1) + 8 * v10);
        uint64_t v62 = 0LL;
        uint64_t v63 = &v62;
        uint64_t v64 = 0x2020000000LL;
        int v13 = *(void **)(a1 + 32);
        uint64_t v52 = v12;
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mountPoint", v46));
        id v15 = objc_msgSend( v13,  "volumeContribution:urgency:isTargetVolume:",  v52,  a2,  objc_msgSend(v14, "isEqualToString:", *(void *)(a1 + 56)));

        id v65 = v15;
        id v16 = objc_msgSend(*(id *)(a1 + 32), "purge_amount_needed");
        if (v16 <= [*(id *)(a1 + 40) amountPurged])
        {
          unint64_t v18 = 0LL;
        }

        else
        {
          id v17 = objc_msgSend(*(id *)(a1 + 32), "purge_amount_needed");
          unint64_t v18 = v17 - (_BYTE *)[*(id *)(a1 + 40) amountPurged];
        }

        unint64_t v19 = v63[3];
        if (v19 >= v18) {
          unint64_t v20 = v18;
        }
        else {
          unint64_t v20 = v63[3];
        }
        if (v19) {
          unint64_t v18 = v20;
        }
        v63[3] = v18;
        uint64_t v21 = CDGetLogHandle("daemon");
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)statfs buf = 138543618;
          *(void *)v71 = v52;
          *(_WORD *)&v71[8] = 1024;
          *(_DWORD *)&v71[10] = a2;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Purging %{public}@ at urgency = %d",  buf,  0x12u);
        }

        uint64_t v23 = CDGetLogHandle("daemon");
        uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = (void *)objc_claimAutoreleasedReturnValue([v52 mountPoint]);
          *(_DWORD *)statfs buf = 67109634;
          *(_DWORD *)v71 = 613;
          *(_WORD *)&v71[4] = 2112;
          *(void *)&v71[6] = v25;
          *(_WORD *)&v71[14] = 1024;
          *(_DWORD *)&v71[16] = a2;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%d calling batchServicesForVolume: %@, atUrgency: %d, with services:",  buf,  0x18u);
        }

        __int128 v60 = 0u;
        __int128 v61 = 0u;
        __int128 v58 = 0u;
        __int128 v59 = 0u;
        id v26 = *(id *)(a1 + 64);
        id v27 = [v26 countByEnumeratingWithState:&v58 objects:v74 count:16];
        if (v27)
        {
          uint64_t v28 = *(void *)v59;
          do
          {
            for (i = 0LL; i != v27; i = (char *)i + 1)
            {
              if (*(void *)v59 != v28) {
                objc_enumerationMutation(v26);
              }
              uint64_t v30 = *(void *)(*((void *)&v58 + 1) + 8LL * (void)i);
              uint64_t v31 = CDGetLogHandle("daemon");
              __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)statfs buf = 67109378;
                *(_DWORD *)v71 = 615;
                *(_WORD *)&v71[4] = 2112;
                *(void *)&v71[6] = v30;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%d\t%@", buf, 0x12u);
              }
            }

            id v27 = [v26 countByEnumeratingWithState:&v58 objects:v74 count:16];
          }

          while (v27);
        }

        uint64_t v54 = 0LL;
        __int128 v55 = &v54;
        uint64_t v56 = 0x2020000000LL;
        int v57 = 0;
        id v33 = *(void **)(a1 + 32);
        id v53 = *(id *)(a1 + 40);
        objc_msgSend(v33, "batchServicesForVolume:atUrgency:services:batchSize:block:");
        __int16 v34 = objc_msgSend(*(id *)(a1 + 32), "purge_amount_needed");
        id v35 = [*(id *)(a1 + 40) amountPurged];
        uint64_t v36 = CDGetLogHandle("daemon");
        int32_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([v52 mountPoint]);
          int v39 = *((_DWORD *)v55 + 6);
          *(_DWORD *)statfs buf = v46;
          *(void *)v71 = v38;
          *(_WORD *)&v71[8] = 1024;
          *(_DWORD *)&v71[10] = a2;
          *(_WORD *)&v71[14] = 1024;
          *(_DWORD *)&v71[16] = v39;
          __int16 v72 = 2048;
          uint64_t v73 = (v34 - v35) & ~((v34 - v35) >> 63);
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "[Purge End](Volume %{public}@, Urgency %d) finished after %d Rounds (%llu bytes left)",  buf,  0x22u);
        }

        uint64_t v40 = CDGetLogHandle("daemon");
        unsigned __int8 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v42 = "proceed";
          if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL)) {
            __int16 v42 = "do not proceed";
          }
          *(_DWORD *)statfs buf = 67109378;
          *(_DWORD *)v71 = 852;
          *(_WORD *)&v71[4] = 2080;
          *(void *)&v71[6] = v42;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%d Volume loop: %s", buf, 0x12u);
        }

        _Block_object_dispose(&v54, 8);
        _Block_object_dispose(&v62, 8);
        uint64_t v10 = v50 + 1;
      }

      while ((id)(v50 + 1) != v49);
      id v49 = [obj countByEnumeratingWithState:&v66 objects:v75 count:16];
    }

    while (v49);
  }

  uint64_t v43 = CDGetLogHandle("daemon");
  uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL)) {
      uint64_t v45 = "proceed";
    }
    else {
      uint64_t v45 = "do not proceed";
    }
    *(_DWORD *)statfs buf = 67109634;
    *(_DWORD *)v71 = 856;
    *(_WORD *)&v71[4] = 1024;
    *(_DWORD *)&v71[6] = a2;
    *(_WORD *)&v71[10] = 2080;
    *(void *)&v71[12] = v45;
    _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "%d Urgency Loop [%d] returning: %s",  buf,  0x18u);
  }

  return *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) != 0;
}

BOOL __45__CacheDeletePurgeOperation__startOperation___block_invoke_62(uint64_t a1, void *a2)
{
  id v2 = a2;
  v167 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
  id v3 = [*(id *)(a1 + 32) amountPurged];
  id v4 = objc_msgSend(*(id *)(a1 + 40), "purge_amount_needed");
  LOBYTE(v5) = 0;
  if (v3 < v4)
  {
    id v5 = [v2 count];
    if (v5)
    {
      else {
        LOBYTE(v5) = [*(id *)(a1 + 40) timeoutNotReached];
      }
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = (_BYTE)v5;
  uint64_t v6 = CDGetLogHandle("daemon");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = "TRUE";
    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL)) {
      id v8 = "FALSE";
    }
    *(_DWORD *)statfs buf = 67109378;
    *(_DWORD *)uint64_t v214 = 629;
    *(_WORD *)&v214[4] = 2080;
    *(void *)&v214[6] = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%d proceed: %s, batch:", buf, 0x12u);
  }

  __int128 v207 = 0u;
  __int128 v208 = 0u;
  __int128 v205 = 0u;
  __int128 v206 = 0u;
  id obj = (NSMutableArray *)v2;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v205,  v217,  16LL);
  if (v9)
  {
    uint64_t v10 = *(void *)v206;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v206 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v205 + 1) + 8LL * (void)i);
        uint64_t v13 = CDGetLogHandle("daemon");
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 ID]);
          *(_DWORD *)statfs buf = 67109378;
          *(_DWORD *)uint64_t v214 = 631;
          *(_WORD *)&v214[4] = 2112;
          *(void *)&v214[6] = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%d\t%@", buf, 0x12u);
        }
      }

      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v205,  v217,  16LL);
    }

    while (v9);
  }

  uint64_t v16 = a1;
  id v17 = obj;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL)) {
    goto LABEL_128;
  }
  id v17 = obj;
  while (1)
  {
    unint64_t v18 = (unint64_t)-[NSMutableArray count](v17, "count");
    uint64_t v19 = CDGetLogHandle("daemon");
    unint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = "TRUE";
      if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL)) {
        uint64_t v21 = "FALSE";
      }
      *(_DWORD *)statfs buf = 67109634;
      *(_DWORD *)uint64_t v214 = 643;
      *(_WORD *)&v214[4] = 2080;
      *(void *)&v214[6] = v21;
      *(_WORD *)&v214[14] = 2048;
      *(void *)&v214[16] = v18;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%d proceed: %s, numPlayers: %lu", buf, 0x1Cu);
    }

    id v22 = objc_msgSend(*(id *)(a1 + 40), "purge_amount_needed");
    if (v22 <= [*(id *)(a1 + 32) amountPurged]
      || (uint64_t v23 = objc_msgSend(*(id *)(a1 + 40), "purge_amount_needed"),
          uint64_t v24 = [*(id *)(a1 + 32) amountPurged],
          v23 == v24))
    {
      uint64_t v147 = CDGetLogHandle("daemon");
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v147);
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_127;
      }
      id v148 = objc_msgSend(*(id *)(a1 + 40), "purge_amount_needed");
      id v149 = [*(id *)(a1 + 32) amountPurged];
      *(_DWORD *)statfs buf = 134218496;
      *(void *)uint64_t v214 = 0LL;
      *(_WORD *)&v214[8] = 2048;
      *(void *)&v214[10] = v148;
      *(_WORD *)&v214[18] = 2048;
      *(void *)&v214[20] = v149;
      v150 = "[Purge Start] aborting, (roundGoal <= 0): %llu, purge_amount_needed: %llu, amountPurged: %llu";
      uint64_t v151 = v27;
      uint32_t v152 = 32;
      goto LABEL_126;
    }

    unint64_t v164 = v23 - v24;
    BOOL v25 = v18 > v23 - v24;
    uint64_t v26 = CDGetLogHandle("daemon");
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v25) {
      break;
    }
    if (v28)
    {
      int v29 = *(_DWORD *)(a1 + 88);
      int v30 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) mountPoint]);
      __int16 v32 = *(NSMutableArray **)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
      *(_DWORD *)statfs buf = 67110146;
      *(_DWORD *)uint64_t v214 = v29;
      *(_WORD *)&v214[4] = 1024;
      *(_DWORD *)&v214[6] = v30;
      *(_WORD *)&v214[10] = 2114;
      *(void *)&v214[12] = v31;
      *(_WORD *)&v214[20] = 2048;
      *(void *)&v214[22] = v164;
      __int16 v215 = 2048;
      __int128 v216 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[Purge Start](Urgency %d : Round %d) Volume = %{public}@, Goal = %llu, Donation = %llu, Remaining Services:",  buf,  0x2Cu);
    }

    __int128 v203 = 0u;
    __int128 v204 = 0u;
    __int128 v201 = 0u;
    __int128 v202 = 0u;
    id v33 = v17;
    id v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v33,  "countByEnumeratingWithState:objects:count:",  &v201,  v212,  16LL);
    if (v34)
    {
      uint64_t v35 = *(void *)v202;
      do
      {
        for (j = 0LL; j != v34; j = (char *)j + 1)
        {
          if (*(void *)v202 != v35) {
            objc_enumerationMutation(v33);
          }
          int32_t v37 = *(void **)(*((void *)&v201 + 1) + 8LL * (void)j);
          uint64_t v38 = CDGetLogHandle("daemon");
          int v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v37 ID]);
            *(_DWORD *)statfs buf = 67109378;
            *(_DWORD *)uint64_t v214 = 656;
            *(_WORD *)&v214[4] = 2112;
            *(void *)&v214[6] = v40;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%d\t%@", buf, 0x12u);
          }
        }

        id v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v33,  "countByEnumeratingWithState:objects:count:",  &v201,  v212,  16LL);
      }

      while (v34);
    }

    unint64_t v41 = v164 / v18;
    uint64_t v42 = *(void *)(*(void *)(a1 + 72) + 8LL);
    if (v164 / v18 >= *(void *)(v42 + 24)) {
      unint64_t v41 = *(void *)(v42 + 24);
    }
    *(void *)(v42 + 24) = v41;
    group = dispatch_group_create();
    uint64_t v43 = objc_alloc(&OBJC_CLASS___CacheDeleteAsyncTimeoutFlag);
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "response_queue"));
    v170 = -[CacheDeleteAsyncTimeoutFlag initWithQueue:](v43, "initWithQueue:", v44);

    int v168 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](v33, "count"));
    uint64_t v45 = CDGetLogHandle("daemon");
    __int128 v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) mountPoint]);
      int v48 = *(_DWORD *)(a1 + 88);
      int v49 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
      *(_DWORD *)statfs buf = 138543874;
      *(void *)uint64_t v214 = v47;
      *(_WORD *)&v214[8] = 1024;
      *(_DWORD *)&v214[10] = v48;
      *(_WORD *)&v214[14] = 1024;
      *(_DWORD *)&v214[16] = v49;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "[Purge Main](Volume: %{public}@, Urgency %d : Round %d) Begin",  buf,  0x18u);
    }

    __int128 v199 = 0u;
    __int128 v200 = 0u;
    __int128 v197 = 0u;
    __int128 v198 = 0u;
    uint64_t v165 = v33;
    id v169 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v165,  "countByEnumeratingWithState:objects:count:",  &v197,  v211,  16LL);
    uint64_t v50 = a1;
    if (v169)
    {
      uint64_t v166 = *(void *)v198;
LABEL_45:
      id v51 = 0LL;
      while (1)
      {
        if (*(void *)v198 != v166)
        {
          objc_enumerationMutation(v165);
          uint64_t v50 = a1;
        }

        v172 = *(void **)(*((void *)&v197 + 1) + 8LL * (void)v51);
        uint64_t v52 = *(void *)(*(void *)(v50 + 64) + 8LL);
        if (*(_BYTE *)(v52 + 24))
        {
          unsigned __int8 v53 = [*(id *)(v50 + 40) timeoutNotReached];
          uint64_t v50 = a1;
          uint64_t v52 = *(void *)(*(void *)(a1 + 64) + 8LL);
        }

        else
        {
          unsigned __int8 v53 = 0;
        }

        *(_BYTE *)(v52 + 24) = v53;
        if (([*(id *)(v50 + 40) cancel] & 1) != 0
          || !*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL))
        {
          break;
        }

        objc_initWeak(&location, *(id *)(a1 + 40));
        uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "response_queue"));
        uint64_t v55 = CDGetLogHandle("daemon");
        uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          int v57 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) mountPoint]);
          int v58 = *(_DWORD *)(a1 + 88);
          int v59 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
          __int128 v60 = (void *)objc_claimAutoreleasedReturnValue([v172 ID]);
          __int128 v61 = *(NSMutableArray **)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
          *(_DWORD *)statfs buf = 138544386;
          *(void *)uint64_t v214 = v57;
          *(_WORD *)&v214[8] = 1024;
          *(_DWORD *)&v214[10] = v58;
          *(_WORD *)&v214[14] = 1024;
          *(_DWORD *)&v214[16] = v59;
          *(_WORD *)&v214[20] = 2114;
          *(void *)&v214[22] = v60;
          __int16 v215 = 2048;
          __int128 v216 = v61;
          _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "[Purge Main](Volume: %{public}@, Urgency %d : Round %d) %{public}@ request %llu bytes",  buf,  0x2Cu);
        }

        dispatch_group_enter(group);
        uint64_t v63 = *(void **)(a1 + 40);
        uint64_t v62 = *(void *)(a1 + 48);
        uint64_t v64 = *(unsigned int *)(a1 + 88);
        uint64_t v65 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
        __int128 v66 = (void *)objc_claimAutoreleasedReturnValue([v63 info]);
        __int128 v67 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) result]);
        __int128 v68 = (void *)objc_claimAutoreleasedReturnValue([v67 objectForKeyedSubscript:@"CACHE_DELETE_TEST_PARAMETERS"]);
        v185[0] = _NSConcreteStackBlock;
        v185[1] = 3221225472LL;
        v185[2] = __45__CacheDeletePurgeOperation__startOperation___block_invoke_64;
        v185[3] = &unk_1000599B0;
        objc_copyWeak(&v194, &location);
        id v69 = v54;
        id v186 = v69;
        __int128 v187 = v170;
        id v70 = v167;
        uint64_t v71 = *(void *)(a1 + 48);
        uint64_t v72 = *(void *)(a1 + 56);
        id v188 = v70;
        uint64_t v189 = v71;
        int v195 = *(_DWORD *)(a1 + 88);
        uint64_t v193 = v72;
        v190 = v172;
        id v191 = v168;
        id v192 = group;
        [v63 serviceRequest:v172 volume:v62 urgency:v64 donation:v65 info:v66 optionalTestInfo:v68 completion:v185];

        objc_destroyWeak(&v194);
        objc_destroyWeak(&location);
        id v51 = (char *)v51 + 1;
        uint64_t v50 = a1;
        if (v169 == v51)
        {
          id v169 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v165,  "countByEnumeratingWithState:objects:count:",  &v197,  v211,  16LL);
          uint64_t v50 = a1;
          if (v169) {
            goto LABEL_45;
          }
          break;
        }
      }
    }

    objc_msgSend(*(id *)(a1 + 40), "non_negative_time_remaining");
    else {
      unint64_t v74 = (unint64_t)v73;
    }
    dispatch_time_t v75 = dispatch_time(0LL, 1000000000 * v74);
    uint64_t v76 = CDGetLogHandle("daemon");
    int v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      v78 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) mountPoint]);
      int v79 = *(_DWORD *)(a1 + 88);
      int v80 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
      *(_DWORD *)statfs buf = 138544130;
      *(void *)uint64_t v214 = v78;
      *(_WORD *)&v214[8] = 1024;
      *(_DWORD *)&v214[10] = v79;
      *(_WORD *)&v214[14] = 1024;
      *(_DWORD *)&v214[16] = v80;
      *(_WORD *)&v214[20] = 2048;
      *(void *)&v214[22] = v74;
      _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_DEFAULT,  "[Purge Main](Volume: %{public}@, Urgency %d : Round %d) Waiting for end of round: %llu seconds",  buf,  0x22u);
    }

    if (dispatch_group_wait(group, v75))
    {
      -[CacheDeleteAsyncTimeoutFlag setTimedOut:](v170, "setTimedOut:", 1LL);
      double v81 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) purgeResult]);
      [v81 setTimedOut:1];

      v82 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) purgeResult]);
      objc_msgSend(v82, "setNoOfTimeouts:", (char *)objc_msgSend(v82, "noOfTimeouts") + 1);

      id v83 = objc_alloc(&OBJC_CLASS___NSMutableArray);
      uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) services]);
      __int128 v85 = -[NSMutableArray initWithCapacity:](v83, "initWithCapacity:", [v84 count]);

      uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) services]);
      v183[0] = _NSConcreteStackBlock;
      v183[1] = 3221225472LL;
      v183[2] = __45__CacheDeletePurgeOperation__startOperation___block_invoke_65;
      v183[3] = &unk_1000598E8;
      __int128 v87 = v85;
      v184 = v87;
      [v86 enumerateKeysAndObjectsUsingBlock:v183];

      BOOL v88 = -[NSMutableArray count](v87, "count") == 0LL;
      uint64_t v89 = CDGetLogHandle("daemon");
      __int128 v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
      uint64_t v91 = v90;
      if (v88)
      {
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
        {
          v146 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) mountPoint]);
          *(_DWORD *)statfs buf = 138543362;
          *(void *)uint64_t v214 = v146;
          _os_log_error_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_ERROR,  "Timed out with no inFlight list for volume: %{public}@",  buf,  0xCu);
        }
      }

      else
      {
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          v92 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) mountPoint]);
          int v93 = *(_DWORD *)(a1 + 88);
          int v94 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
          *(_DWORD *)statfs buf = 138544386;
          *(void *)uint64_t v214 = v92;
          *(_WORD *)&v214[8] = 1024;
          *(_DWORD *)&v214[10] = v93;
          *(_WORD *)&v214[14] = 1024;
          *(_DWORD *)&v214[16] = v94;
          *(_WORD *)&v214[20] = 2048;
          *(void *)&v214[22] = v74;
          __int16 v215 = 2114;
          __int128 v216 = v87;
          _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_DEFAULT,  "[Purge Main](Volume: %{public}@, Urgency %d : Round %d) Timed out waiting for %llu seconds: %{public}@",  buf,  0x2Cu);
        }

        unint64_t v95 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) purgeResult]);
        [v95 setTimeoutTime:v74];

        __int128 v181 = 0u;
        __int128 v182 = 0u;
        __int128 v179 = 0u;
        __int128 v180 = 0u;
        uint64_t v91 = v87;
        id v96 = -[os_log_s countByEnumeratingWithState:objects:count:]( v91,  "countByEnumeratingWithState:objects:count:",  &v179,  v210,  16LL);
        if (v96)
        {
          uint64_t v97 = *(void *)v180;
          do
          {
            for (k = 0LL; k != v96; k = (char *)k + 1)
            {
              if (*(void *)v180 != v97) {
                objc_enumerationMutation(v91);
              }
              uint64_t v99 = *(void *)(*((void *)&v179 + 1) + 8LL * (void)k);
              v100 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) purgeResult]);
              int v101 = (void *)objc_claimAutoreleasedReturnValue([v100 timedOutServices]);
              unsigned __int8 v102 = [v101 containsObject:v99];

              if ((v102 & 1) == 0)
              {
                double v103 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) purgeResult]);
                double v104 = (void *)objc_claimAutoreleasedReturnValue([v103 timedOutServices]);
                [v104 addObject:v99];
              }
            }

            id v96 = -[os_log_s countByEnumeratingWithState:objects:count:]( v91,  "countByEnumeratingWithState:objects:count:",  &v179,  v210,  16LL);
          }

          while (v96);
        }
      }
    }

    __int128 v177 = 0u;
    __int128 v178 = 0u;
    __int128 v175 = 0u;
    __int128 v176 = 0u;
    id v105 = v167;
    unint64_t v106 = 0LL;
    id v107 = [v105 countByEnumeratingWithState:&v175 objects:v209 count:16];
    if (v107)
    {
      uint64_t v108 = *(void *)v176;
      do
      {
        for (m = 0LL; m != v107; m = (char *)m + 1)
        {
          if (*(void *)v176 != v108) {
            objc_enumerationMutation(v105);
          }
          v110 = *(void **)(*((void *)&v175 + 1) + 8LL * (void)m);
          id v111 = [v110 reportedBytes];
          [v110 requestedBytes];
          v106 += (unint64_t)v111;
        }

        id v107 = [v105 countByEnumeratingWithState:&v175 objects:v209 count:16];
      }

      while (v107);
    }

    id v112 = [*(id *)(a1 + 32) amountPurged];
    if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL))
    {
      unint64_t v113 = (unint64_t)v112;
      uint64_t v114 = CDGetLogHandle("daemon");
      v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
      if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
      {
        v116 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) mountPoint]);
        int v117 = *(_DWORD *)(a1 + 88);
        int v118 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
        *(_DWORD *)statfs buf = 138543874;
        *(void *)uint64_t v214 = v116;
        *(_WORD *)&v214[8] = 1024;
        *(_DWORD *)&v214[10] = v117;
        *(_WORD *)&v214[14] = 1024;
        *(_DWORD *)&v214[16] = v118;
        _os_log_impl( (void *)&_mh_execute_header,  v115,  OS_LOG_TYPE_DEFAULT,  "[Purge Cleanup](Volume: %{public}@, Urgency %d : Round %d) Begin",  buf,  0x18u);
      }

      id v119 = objc_msgSend(*(id *)(a1 + 40), "purge_amount_needed");
      if (v119 > [*(id *)(a1 + 32) amountPurged])
      {
        objc_msgSend(*(id *)(a1 + 40), "non_negative_time_remaining");
        double v121 = v120;
        if (*(int *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) <= 1 && -[NSMutableArray count](v168, "count"))
        {
          unint64_t v122 = (unint64_t)-[NSMutableArray count](v168, "count");
          unint64_t v123 = v106 - v113;
          if (v106 < v113) {
            unint64_t v123 = 0LL;
          }
          unint64_t v124 = v164 / v122 + v123;
          if (v164 > v113 && v164 - v113 < v124) {
            unint64_t v124 = v164 - v113;
          }
LABEL_99:
          if (v124)
          {
            v125 = *(void **)(a1 + 40);
            uint64_t v126 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL);
            uint64_t v127 = *(void *)(a1 + 48);
            uint64_t v128 = *(unsigned int *)(a1 + 88);
            else {
              unint64_t v129 = 900LL;
            }
            id v130 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) result]);
            id v131 = (void *)objc_claimAutoreleasedReturnValue([v130 objectForKeyedSubscript:@"CACHE_DELETE_TEST_PARAMETERS"]);
            [v125 oneShot:v126 volume:v127 urgency:v128 donation:v124 currentRoundResults:v105 timeout:v129 info:0 optionalTestInfo:v131];
          }
        }

        else
        {
          unint64_t v124 = v164 - v113;
          if (v164 > v113) {
            goto LABEL_99;
          }
        }
      }

      uint64_t v132 = CDGetLogHandle("daemon");
      v133 = (os_log_s *)objc_claimAutoreleasedReturnValue(v132);
      if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v134 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) mountPoint]);
        int v135 = *(_DWORD *)(a1 + 88);
        int v136 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
        *(_DWORD *)statfs buf = 138543874;
        *(void *)uint64_t v214 = v134;
        *(_WORD *)&v214[8] = 1024;
        *(_DWORD *)&v214[10] = v135;
        *(_WORD *)&v214[14] = 1024;
        *(_DWORD *)&v214[16] = v136;
        _os_log_impl( (void *)&_mh_execute_header,  v133,  OS_LOG_TYPE_DEFAULT,  "[Purge Cleanup](Volume: %{public}@, Urgency %d : Round %d) End",  buf,  0x18u);
      }
    }

    id v17 = v168;

    uint64_t v137 = a1;
    uint64_t v138 = *(void *)(*(void *)(a1 + 56) + 8LL);
    int v139 = *(_DWORD *)(v138 + 24);
    *(_DWORD *)(v138 + 24) = v139 + 1;
    if (v139 > 3)
    {
      LOBYTE(v141) = 0;
      goto LABEL_114;
    }

    id v140 = [*(id *)(a1 + 32) amountPurged];
    if (v140 >= objc_msgSend(*(id *)(a1 + 40), "purge_amount_needed")) {
      goto LABEL_111;
    }
    id v141 = -[NSMutableArray count](v17, "count");
    if (v141)
    {
      if (([*(id *)(a1 + 40) cancel] & 1) == 0)
      {
        LOBYTE(v141) = [*(id *)(a1 + 40) timeoutNotReached];
        goto LABEL_112;
      }

void __45__CacheDeletePurgeOperation__startOperation___block_invoke_64(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  id v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (([*(id *)(a1 + 40) timedOut] & 1) == 0)
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v5 purgeResult]);
      [v19 addResult:v3];

      [*(id *)(a1 + 48) addObject:v3];
      objc_msgSend( v5,  "setPurge_amount_reported:",  (char *)objc_msgSend(v3, "reportedBytes") + (void)objc_msgSend(v5, "purge_amount_reported"));
      uint64_t v20 = CDGetLogHandle("daemon");
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) mountPoint]);
        int v23 = *(_DWORD *)(a1 + 104);
        int v24 = *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL);
        BOOL v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) ID]);
        id v26 = [v3 reportedBytes];
        id v27 = [v3 requestedBytes];
        [v3 duration];
        int v34 = 138544898;
        uint64_t v35 = v22;
        __int16 v36 = 1024;
        int v37 = v23;
        __int16 v38 = 1024;
        *(_DWORD *)int v39 = v24;
        *(_WORD *)&v39[4] = 2114;
        *(void *)&v39[6] = v25;
        __int16 v40 = 2048;
        id v41 = v26;
        __int16 v42 = 2048;
        id v43 = v27;
        __int16 v44 = 2048;
        uint64_t v45 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[Purge Result](Volume: %{public}@, Urgency %d : Round %d) %{public}@ purged (%llu / %llu) bytes : elapsed time %lfs",  (uint8_t *)&v34,  0x40u);
      }

      id v29 = [v3 reportedBytes];
      if (v29 >= [v3 requestedBytes])
      {
        [*(id *)(a1 + 72) addObject:*(void *)(a1 + 64)];
        uint64_t v32 = CDGetLogHandle("daemon");
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) ID]);
        int v33 = *(_DWORD *)(a1 + 104);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) mountPoint]);
        int v34 = 138543874;
        uint64_t v35 = v8;
        __int16 v36 = 1024;
        int v37 = v33;
        __int16 v38 = 2114;
        *(void *)int v39 = v11;
        id v15 = "** %{public}@ will continue purging at urgency %d on volume: %{public}@";
      }

      else
      {
        uint64_t v30 = CDGetLogHandle("daemon");
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) ID]);
        int v31 = *(_DWORD *)(a1 + 104);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) mountPoint]);
        int v34 = 138543874;
        uint64_t v35 = v8;
        __int16 v36 = 1024;
        int v37 = v31;
        __int16 v38 = 2114;
        *(void *)int v39 = v11;
        id v15 = "** %{public}@ is disqualified from purging at urgency %d on volume: %{public}@";
      }

      uint64_t v16 = v7;
      uint32_t v17 = 28;
      goto LABEL_16;
    }

    uint64_t v6 = CDGetLogHandle("daemon");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) mountPoint]);
      int v9 = *(_DWORD *)(a1 + 104);
      int v10 = *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) ID]);
      id v12 = [v3 reportedBytes];
      id v13 = [v3 requestedBytes];
      [v3 duration];
      int v34 = 138544898;
      uint64_t v35 = v8;
      __int16 v36 = 1024;
      int v37 = v9;
      __int16 v38 = 1024;
      *(_DWORD *)int v39 = v10;
      *(_WORD *)&v39[4] = 2114;
      *(void *)&v39[6] = v11;
      __int16 v40 = 2048;
      id v41 = v12;
      __int16 v42 = 2048;
      id v43 = v13;
      __int16 v44 = 2048;
      uint64_t v45 = v14;
      id v15 = "[Purge Result(tardy!)](Volume: %{public}@, Urgency %d : Round %d) %{public}@ purged (%llu / %llu) bytes : elapsed time %lfs";
      uint64_t v16 = v7;
      uint32_t v17 = 64;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v34, v17);

      goto LABEL_17;
    }
  }

  else
  {
    uint64_t v18 = CDGetLogHandle("daemon");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) mountPoint]);
      int v34 = 138543362;
      uint64_t v35 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Purge failed (volume %{public}@ possibly invalid)",  (uint8_t *)&v34,  0xCu);
LABEL_17:
    }
  }

void __45__CacheDeletePurgeOperation__startOperation___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
}

- (void)oneShot:(id)a3 volume:(id)a4 urgency:(int)a5 donation:(unint64_t)a6 currentRoundResults:(id)a7 timeout:(unint64_t)a8 info:(id)a9 optionalTestInfo:(id)a10
{
  id v41 = a3;
  id v14 = a4;
  id v42 = a7;
  id v43 = a9;
  id v44 = a10;
  uint64_t v15 = CDGetLogHandle("daemon");
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 mountPoint]);
    *(_DWORD *)statfs buf = 138543618;
    int v59 = v17;
    __int16 v60 = 1024;
    int v61 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[Purge OneShot](Volume: %{public}@, Urgency %d) Begin",  buf,  0x12u);
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation volumes](self, "volumes"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 firstObject]);

  unint64_t v20 = -[CacheDeletePurgeOperation purge_amount_needed](self, "purge_amount_needed");
  if (v20 > (unint64_t)[v19 amountPurged])
  {
    uint64_t v21 = objc_alloc(&OBJC_CLASS___CacheDeleteAsyncTimeoutFlag);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation response_queue](self, "response_queue"));
    int v23 = -[CacheDeleteAsyncTimeoutFlag initWithQueue:](v21, "initWithQueue:", v22);

    objc_initWeak(&location, self);
    int v24 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation response_queue](self, "response_queue"));
    dispatch_semaphore_t v25 = dispatch_semaphore_create(0LL);
    id v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation response_queue](self, "response_queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __111__CacheDeletePurgeOperation_oneShot_volume_urgency_donation_currentRoundResults_timeout_info_optionalTestInfo___block_invoke;
    block[3] = &unk_100059A50;
    block[4] = self;
    id v27 = v41;
    id v47 = v27;
    id v28 = v14;
    int v56 = a5;
    id v48 = v28;
    v55[1] = (id)a6;
    id v49 = v43;
    id v50 = v44;
    objc_copyWeak(v55, &location);
    id v29 = v24;
    id v51 = v29;
    uint64_t v30 = v23;
    uint64_t v52 = v30;
    id v53 = v42;
    int v31 = v25;
    uint64_t v54 = v31;
    dispatch_async(v26, block);

    dispatch_time_t v32 = dispatch_time(0LL, 1000000000 * a8);
    if (dispatch_semaphore_wait(v31, v32))
    {
      -[CacheDeleteAsyncTimeoutFlag setTimedOut:](v30, "setTimedOut:", 1LL);
      uint64_t v33 = CDGetLogHandle("daemon");
      int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v28 mountPoint]);
        __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v27 ID]);
        *(_DWORD *)statfs buf = 138543874;
        int v59 = v35;
        __int16 v60 = 1024;
        int v61 = a5;
        __int16 v62 = 2114;
        uint64_t v63 = v36;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "[Purge OneShot] (Volume: %{public}@, Urgency %d) Timed out waiting for: %{public}@",  buf,  0x1Cu);
      }
    }

    objc_destroyWeak(v55);
    objc_destroyWeak(&location);
  }

  uint64_t v37 = CDGetLogHandle("daemon");
  __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    int v39 = (void *)objc_claimAutoreleasedReturnValue([v14 mountPoint]);
    *(_DWORD *)statfs buf = 138543618;
    int v59 = v39;
    __int16 v60 = 1024;
    int v61 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "[Purge OneShot](Volume: %{public}@, Urgency %d) End",  buf,  0x12u);
  }
}

void __111__CacheDeletePurgeOperation_oneShot_volume_urgency_donation_currentRoundResults_timeout_info_optionalTestInfo___block_invoke( uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned int *)(a1 + 120);
  uint64_t v5 = *(void *)(a1 + 112);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  v9[0] = _NSConcreteStackBlock;
  v9[2] = __111__CacheDeletePurgeOperation_oneShot_volume_urgency_donation_currentRoundResults_timeout_info_optionalTestInfo___block_invoke_2;
  v9[3] = &unk_100059A28;
  v9[1] = 3221225472LL;
  objc_copyWeak(&v16, (id *)(a1 + 104));
  id v10 = *(id *)(a1 + 72);
  id v11 = *(id *)(a1 + 80);
  id v12 = *(id *)(a1 + 88);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 96);
  [v2 serviceRequest:v3 volume:v7 urgency:v4 donation:v5 info:v6 optionalTestInfo:v8 completion:v9];

  objc_destroyWeak(&v16);
}

void __111__CacheDeletePurgeOperation_oneShot_volume_urgency_donation_currentRoundResults_timeout_info_optionalTestInfo___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if ([*(id *)(a1 + 40) timedOut])
    {
      uint64_t v6 = CDGetLogHandle("daemon");
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) ID]);
        id v9 = [v3 reportedBytes];
        id v10 = [v3 requestedBytes];
        id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) mountPoint]);
        [v3 duration];
        int v19 = 138544386;
        unint64_t v20 = v8;
        __int16 v21 = 2048;
        id v22 = v9;
        __int16 v23 = 2048;
        id v24 = v10;
        __int16 v25 = 2114;
        id v26 = v11;
        __int16 v27 = 2048;
        uint64_t v28 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "[Purge Result (oneShot, tardy!)] %{public}@ purged (%llu / %llu) bytes on volume: %{public}@ in %lf seconds",  (uint8_t *)&v19,  0x34u);
LABEL_10:

        goto LABEL_11;
      }
    }

    else
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 purgeResult]);
      [v14 addResult:v3];

      [*(id *)(a1 + 48) addObject:v3];
      objc_msgSend( v5,  "setPurge_amount_reported:",  (char *)objc_msgSend(v3, "reportedBytes") + (void)objc_msgSend(v5, "purge_amount_reported"));
      uint64_t v15 = CDGetLogHandle("daemon");
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) ID]);
        id v16 = [v3 reportedBytes];
        id v17 = [v3 requestedBytes];
        id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) mountPoint]);
        [v3 duration];
        int v19 = 138544386;
        unint64_t v20 = v8;
        __int16 v21 = 2048;
        id v22 = v16;
        __int16 v23 = 2048;
        id v24 = v17;
        __int16 v25 = 2114;
        id v26 = v11;
        __int16 v27 = 2048;
        uint64_t v28 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[Purge Result (oneShot)] %{public}@ purged (%llu / %llu) bytes on volume: %{public}@ in %lf seconds",  (uint8_t *)&v19,  0x34u);
        goto LABEL_10;
      }
    }
  }

  else
  {
    uint64_t v13 = CDGetLogHandle("daemon");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) mountPoint]);
      int v19 = 138543362;
      unint64_t v20 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Purge oneShot failed (volume %{public}@ was likely invalid)",  (uint8_t *)&v19,  0xCu);
LABEL_11:
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
}

- (void)serviceRequest:(id)a3 volume:(id)a4 urgency:(int)a5 donation:(unint64_t)a6 info:(id)a7 optionalTestInfo:(id)a8 completion:(id)a9
{
  uint64_t v12 = *(void *)&a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v36 = a8;
  id v18 = a9;
  uint64_t v19 = objc_claimAutoreleasedReturnValue([v16 mountPoint]);
  unsigned int v20 = [v16 validate];
  uint64_t v35 = (void *)v19;
  if (v15 && v20 && v19)
  {
    v48[0] = @"CACHE_DELETE_ID";
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v15 ID]);
    v49[0] = v21;
    v48[1] = @"CACHE_DELETE_AMOUNT";
    int v34 = v17;
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a6));
    v49[1] = v22;
    v48[2] = @"CACHE_DELETE_URGENCY";
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v12));
    v48[3] = @"CACHE_DELETE_VOLUME";
    v49[2] = v23;
    v49[3] = v19;
    id v24 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v49,  v48,  4LL));

    if (v34)
    {
      id v25 = [v34 mutableCopy];
      [v25 addEntriesFromDictionary:v24];
    }

    else
    {
      id v25 = [v24 mutableCopy];
    }

    if (v36) {
      [v25 setObject:v36 forKeyedSubscript:@"CACHE_DELETE_TEST_PARAMETERS"];
    }
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation response_queue](self, "response_queue"));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = __101__CacheDeletePurgeOperation_serviceRequest_volume_urgency_donation_info_optionalTestInfo_completion___block_invoke_2;
    v37[3] = &unk_100059AA0;
    unint64_t v44 = a6;
    int v45 = v12;
    id v38 = v15;
    int v39 = self;
    id v40 = v25;
    id v42 = v30;
    id v43 = v18;
    id v41 = v16;
    id v31 = v18;
    dispatch_time_t v32 = v30;
    id v29 = v25;
    dispatch_async(v32, v37);

    id v17 = v34;
  }

  else
  {
    uint64_t v26 = CDGetLogHandle("daemon");
    __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v16 mountPoint]);
      *(_DWORD *)statfs buf = 138543618;
      id v51 = v15;
      __int16 v52 = 2114;
      id v53 = v33;
      _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Parameter error: service: %{public}@, volume %{public}@",  buf,  0x16u);
    }

    uint64_t v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CacheDeleteOperation response_queue](self, "response_queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __101__CacheDeletePurgeOperation_serviceRequest_volume_urgency_donation_info_optionalTestInfo_completion___block_invoke;
    block[3] = &unk_100058960;
    id v47 = v18;
    id v24 = v18;
    dispatch_async(v28, block);

    id v29 = v47;
  }
}

uint64_t __101__CacheDeletePurgeOperation_serviceRequest_volume_urgency_donation_info_optionalTestInfo_completion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __101__CacheDeletePurgeOperation_serviceRequest_volume_urgency_donation_info_optionalTestInfo_completion___block_invoke_2( uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___CDPurgeServiceRequestResult);
  -[CDPurgeServiceRequestResult setRequestedBytes:](v2, "setRequestedBytes:", *(void *)(a1 + 80));
  -[CDServiceRequestResult setUrgency:](v2, "setUrgency:", *(unsigned int *)(a1 + 88));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ID]);
  -[CDServiceRequestResult setServiceName:](v2, "setServiceName:", v3);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) servicesToTranslate]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ID]);
  unsigned int v6 = [v4 containsObject:v5];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
  uint64_t v8 = mapVolume(v7, v6 ^ 1);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [*(id *)(a1 + 48) setObject:v9 forKeyedSubscript:@"CACHE_DELETE_VOLUME"];

  v27[0] = 0LL;
  v27[1] = v27;
  v27[2] = 0x2020000000LL;
  char v28 = 0;
  objc_initWeak(&location, *(id *)(a1 + 40));
  id v10 = (void *)mach_absolute_time();
  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(unsigned int *)(a1 + 88);
  id v13 = [*(id *)(a1 + 48) copy];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = __101__CacheDeletePurgeOperation_serviceRequest_volume_urgency_donation_info_optionalTestInfo_completion___block_invoke_3;
  v16[3] = &unk_100059A78;
  v24[1] = v10;
  objc_copyWeak(v24, &location);
  __int16 v23 = v27;
  id v17 = *(id *)(a1 + 32);
  id v18 = *(id *)(a1 + 56);
  id v22 = *(id *)(a1 + 72);
  id v19 = *(id *)(a1 + 64);
  id v14 = v2;
  int v25 = *(_DWORD *)(a1 + 88);
  uint64_t v15 = *(void *)(a1 + 40);
  unsigned int v20 = v14;
  uint64_t v21 = v15;
  [v11 servicePurge:v12 info:v13 replyBlock:v16];

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Block_object_dispose(v27, 8);
}

void __101__CacheDeletePurgeOperation_serviceRequest_volume_urgency_donation_info_optionalTestInfo_completion___block_invoke_3( uint64_t a1,  void *a2)
{
  id v3 = a2;
  uint64_t v4 = mach_absolute_time();
  unint64_t v5 = *(void *)(a1 + 96);
  double v6 = gTimebaseConversion;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8LL);
  if (*(_BYTE *)(v8 + 24))
  {
    uint64_t v9 = CDGetLogHandle("daemon");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ID]);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mountPoint]);
      *(_DWORD *)statfs buf = 138543618;
      id v36 = v25;
      __int16 v37 = 2114;
      double v38 = *(double *)&v26;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_FAULT,  "Purge callback firing more than once for service %{public}@ on volume: %{public}@",  buf,  0x16u);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ID]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mountPoint]);
    _CacheDeleteAbortWithMessage( "Purge callback firing more than once for service %{public}@ on volume: %{public}@",  v11,  v12);
  }

  else
  {
    *(_BYTE *)(v8 + 24) = 1;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);
    uint64_t v14 = evaluateNumberProperty();
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v14);

    uint64_t v15 = CDGetLogHandle("daemon");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      double v17 = v6 * ((double)v4 - (double)v5);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ID]);
      id v19 = [v11 unsignedLongLongValue];
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mountPoint]);
      *(_DWORD *)statfs buf = 138544130;
      id v36 = v18;
      __int16 v37 = 2048;
      double v38 = v17 / 1000000000.0;
      __int16 v39 = 2048;
      id v40 = v19;
      __int16 v41 = 2114;
      id v42 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@ took %f seconds, purged %llu bytes on volume: %{public}@",  buf,  0x2Au);
    }

    if (WeakRetained)
    {
      uint64_t v21 = *(dispatch_queue_s **)(a1 + 48);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __101__CacheDeletePurgeOperation_serviceRequest_volume_urgency_donation_info_optionalTestInfo_completion___block_invoke_91;
      block[3] = &unk_100058D08;
      id v28 = v3;
      id v29 = *(id *)(a1 + 56);
      id v30 = *(id *)(a1 + 32);
      id v22 = *(id *)(a1 + 40);
      int v34 = *(_DWORD *)(a1 + 104);
      uint64_t v23 = *(void *)(a1 + 64);
      id v24 = *(void **)(a1 + 72);
      id v31 = v22;
      uint64_t v32 = v23;
      id v33 = v24;
      dispatch_async(v21, block);
    }

    else
    {
      (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
    }
  }
}

void __101__CacheDeletePurgeOperation_serviceRequest_volume_urgency_donation_info_optionalTestInfo_completion___block_invoke_91( uint64_t a1)
{
  id v10 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v10, v2) & 1) != 0) {
    id v3 = [v10 unsignedLongLongValue];
  }
  else {
    id v3 = 0LL;
  }
  [*(id *)(a1 + 40) setReportedBytes:v3];
  [*(id *)(a1 + 40) finish];
  if ([*(id *)(a1 + 40) reportedBytes])
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[CDDaemonPurgeableResultCache sharedPurgeableResultsCache]( &OBJC_CLASS___CDDaemonPurgeableResultCache,  "sharedPurgeableResultsCache"));
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*(id *)(a1 + 40) reportedBytes]));
    double v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) ID]);
    [v4 deductPurgeableAmount:v5 serviceID:v6 volume:*(void *)(a1 + 56) urgency:*(unsigned int *)(a1 + 80)];
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) analyticsReporter]);
  [v7 reportPurgeTimingInfo:*(void *)(a1 + 40)];

  uint64_t v8 = *(void **)(a1 + 64);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"CACHE_DELETE_TEST_FAILURES"]);
  [v8 processTestFailures:v9];

  (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
}

- (BOOL)cancel
{
  return self->_cancel;
}

- (void)setCancel:(BOOL)a3
{
  self->_cancel = a3;
}

- (unint64_t)purge_amount_needed
{
  return self->_purge_amount_needed;
}

- (unint64_t)purge_amount_reported
{
  return self->_purge_amount_reported;
}

- (void)setPurge_amount_reported:(unint64_t)a3
{
  self->_purge_amount_reported = a3;
}

- (CDPurgeOperationResult)purgeResult
{
  return self->_purgeResult;
}

- (void)setPurgeResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end