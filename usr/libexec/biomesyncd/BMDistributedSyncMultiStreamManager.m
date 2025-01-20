@interface BMDistributedSyncMultiStreamManager
+ (BMDistributedSyncMultiStreamManager)multiStreamManagerWithPrimaryDatabase:(id)a3 account:(id)a4 queue:(id)a5;
- (BMDistributedSyncMultiStreamManager)initWithDistributedSyncManagers:(id)a3 peerStatusTracker:(id)a4 accountDatabase:(id)a5;
- (BMSyncDevicePeerStatusTracker)peerStatusTracker;
- (BMSyncSessionMetricsCollector)metricsCollector;
- (BOOL)supportsSyncingWithPlatform:(int64_t)a3 overTransport:(unint64_t)a4 inDirection:(unint64_t)a5;
- (NSDictionary)distributedSyncManagers;
- (id)atomBatchesForChangesSinceClockVector:(id)a3 targetPlatform:(int64_t)a4 transportType:(unint64_t)a5 direction:(unint64_t)a6 ckFormatVersion:(unsigned __int8)a7 chunker:(id)a8;
- (id)clockVectorForStreamsSupportingTransportType:(unint64_t)a3 direction:(unint64_t)a4 device:(id)a5;
- (id)deletedLocationsForTransportType:(unint64_t)a3;
- (id)rangeClockVectorForStreamsSupportingTransportType:(unint64_t)a3 direction:(unint64_t)a4 device:(id)a5;
- (void)dealloc;
- (void)mergeAtomBatches:(id)a3 deletedLocations:(id)a4 sessionContext:(id)a5;
- (void)setMetricsCollector:(id)a3;
@end

@implementation BMDistributedSyncMultiStreamManager

+ (BMDistributedSyncMultiStreamManager)multiStreamManagerWithPrimaryDatabase:(id)a3 account:(id)a4 queue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v7;
  v11 = v10;
  if (v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[BMSyncDatabase createDatabaseForAccount:queue:]( &OBJC_CLASS___BMSyncDatabase,  "createDatabaseForAccount:queue:",  v8,  v9));
    if (([v12 open] & 1) == 0)
    {
      uint64_t v17 = __biome_log_for_category(11LL);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000430F4(v8, v18);
      }
      v19 = 0LL;
      v20 = v11;
      goto LABEL_26;
    }

    id v13 = v12;

    id v14 = v13;
  }

  else
  {
    id v13 = 0LL;
    id v14 = v10;
  }

  v15 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v38 = -[BMSyncDevicePeerStatusTracker initWithDatabase:]( objc_alloc(&OBJC_CLASS___BMSyncDevicePeerStatusTracker),  "initWithDatabase:",  v14);
  v44 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDevicePeerStatusTracker localDeviceIdentifierCreatingIfNecessary]( v38,  "localDeviceIdentifierCreatingIfNecessary"));
  v43 = -[BMSyncSessionMetricsCollector initWithDatabase:]( objc_alloc(&OBJC_CLASS___BMSyncSessionMetricsCollector),  "initWithDatabase:",  v14);
  id v39 = v13;
  id v40 = v9;
  v45 = v15;
  v47 = v14;
  if (v8) {
    v16 = -[BMXPCSyncChangeReporter initWithAccount:]( objc_alloc(&OBJC_CLASS___BMXPCSyncChangeReporter),  "initWithAccount:",  v8);
  }
  else {
    v16 = objc_opt_new(&OBJC_CLASS___BMXPCSyncChangeReporter);
  }
  v42 = v16;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue( +[BMStreamSyncPolicy syncableStreamConfigurations]( &OBJC_CLASS___BMStreamSyncPolicy,  "syncableStreamConfigurations"));
  id v21 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v46 = *(void *)v49;
    do
    {
      for (i = 0LL; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v49 != v46) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
        id v25 = v8;
        id v26 = v8;
        id v27 = v47;
        v28 = (void *)objc_claimAutoreleasedReturnValue([v24 streamIdentifier]);
        unsigned int v29 = [&off_10006EBA0 containsObject:v28];

        if (v29)
        {
          id v30 = v11;

          id v26 = 0LL;
          id v27 = v30;
        }

        if (v27)
        {
          v31 = objc_alloc(&OBJC_CLASS___BMStreamCKCRDT);
          v32 = objc_opt_new(&OBJC_CLASS___BMStreamCRDTLocationDayAssigner);
          v33 = -[BMStreamCKCRDT initWithStreamConfiguration:locationAssignerPolicy:localSiteIdentifier:database:changeReporter:account:]( v31,  "initWithStreamConfiguration:locationAssignerPolicy:localSiteIdentifier:database:changeReporter:account:",  v24,  v32,  v44,  v27,  v42,  v26);

          -[BMStreamCKCRDT setMetricsCollector:](v33, "setMetricsCollector:", v43);
          v34 = -[BMDistributedSyncManager initWithStreamConfiguration:streamCRDT:database:localSiteIdentifier:changeReporter:]( objc_alloc(&OBJC_CLASS___BMDistributedSyncManager),  "initWithStreamConfiguration:streamCRDT:database:localSiteIdentifier:changeReporter:",  v24,  v33,  v27,  v44,  v42);
          v35 = (void *)objc_claimAutoreleasedReturnValue([v24 syncIdentifier]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v45, "setObject:forKeyedSubscript:", v34, v35);
        }

        else
        {
          uint64_t v36 = __biome_log_for_category(11LL);
          v33 = (BMStreamCKCRDT *)objc_claimAutoreleasedReturnValue(v36);
          if (!os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_INFO)) {
            goto LABEL_23;
          }
          v34 = (BMDistributedSyncManager *)objc_claimAutoreleasedReturnValue([v24 streamIdentifier]);
          *(_DWORD *)buf = 138543362;
          v53 = v34;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v33,  OS_LOG_TYPE_INFO,  "Effective database for stream %{public}@ not available for current request",  buf,  0xCu);
        }

LABEL_23:
        id v8 = v25;
      }

      id v22 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    }

    while (v22);
  }

  v18 = (os_log_s *)v45;
  v12 = v39;
  v19 = -[BMDistributedSyncMultiStreamManager initWithDistributedSyncManagers:peerStatusTracker:accountDatabase:]( objc_alloc(&OBJC_CLASS___BMDistributedSyncMultiStreamManager),  "initWithDistributedSyncManagers:peerStatusTracker:accountDatabase:",  v45,  v38,  v39);
  -[BMDistributedSyncMultiStreamManager setMetricsCollector:](v19, "setMetricsCollector:", v43);

  id v9 = v40;
  v20 = v47;
LABEL_26:

  return v19;
}

- (BMDistributedSyncMultiStreamManager)initWithDistributedSyncManagers:(id)a3 peerStatusTracker:(id)a4 accountDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___BMDistributedSyncMultiStreamManager;
  v11 = -[BMDistributedSyncMultiStreamManager init](&v15, "init");
  if (v11)
  {
    v12 = (NSDictionary *)[v8 copy];
    distributedSyncManagers = v11->_distributedSyncManagers;
    v11->_distributedSyncManagers = v12;

    objc_storeStrong((id *)&v11->_peerStatusTracker, a4);
    objc_storeStrong((id *)&v11->_accountDatabase, a5);
  }

  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BMDistributedSyncMultiStreamManager;
  -[BMDistributedSyncMultiStreamManager dealloc](&v3, "dealloc");
}

- (id)clockVectorForStreamsSupportingTransportType:(unint64_t)a3 direction:(unint64_t)a4 device:(id)a5
{
  id v25 = a5;
  id v27 = self;
  v28 = objc_opt_new(&OBJC_CLASS___BMMultiStreamTimestampClockVector);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_distributedSyncManagers, "allValues"));
  id v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    unint64_t v26 = a3;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 streamConfiguration]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 syncPolicy]);
        unsigned __int8 v15 = [v14 supportsTransport:a3 direction:a4];

        if ((v15 & 1) != 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue([v12 clockVector]);
          if (![v16 timestampCount])
          {
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDevicePeerStatusTracker localDeviceIdentifierCreatingIfNecessary]( v27->_peerStatusTracker,  "localDeviceIdentifierCreatingIfNecessary"));
            v18 = (void *)objc_claimAutoreleasedReturnValue([v17 dataUsingEncoding:4]);
            unint64_t v19 = a4;
            id v20 = [[CKDistributedSiteIdentifier alloc] initWithIdentifier:v18];
            id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndex:", 0LL));
            [v16 addClockValuesInIndexSet:v21 forSiteIdentifier:v20];

            a4 = v19;
            a3 = v26;
          }

          id v22 = (void *)objc_claimAutoreleasedReturnValue([v12 streamConfiguration]);
          v23 = (void *)objc_claimAutoreleasedReturnValue([v22 syncIdentifierForTransport:a3]);

          -[BMMultiStreamTimestampClockVector setVectorClockTo:forStreamIdentifier:]( v28,  "setVectorClockTo:forStreamIdentifier:",  v16,  v23);
        }

        else
        {
          objc_autoreleasePoolPop(objc_autoreleasePoolPush());
        }
      }

      id v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v9);
  }

  return v28;
}

- (id)rangeClockVectorForStreamsSupportingTransportType:(unint64_t)a3 direction:(unint64_t)a4 device:(id)a5
{
  id v25 = a5;
  id v27 = self;
  v28 = objc_opt_new(&OBJC_CLASS___BMMultiStreamTimestampClockVector);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_distributedSyncManagers, "allValues"));
  id v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    unint64_t v26 = a3;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 streamConfiguration]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 syncPolicy]);
        unsigned __int8 v15 = [v14 supportsTransport:a3 direction:a4];

        if ((v15 & 1) != 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue([v12 rangeClockVector]);
          if (![v16 timestampCount])
          {
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDevicePeerStatusTracker localDeviceIdentifierCreatingIfNecessary]( v27->_peerStatusTracker,  "localDeviceIdentifierCreatingIfNecessary"));
            v18 = (void *)objc_claimAutoreleasedReturnValue([v17 dataUsingEncoding:4]);
            unint64_t v19 = a4;
            id v20 = [[CKDistributedSiteIdentifier alloc] initWithIdentifier:v18];
            id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndex:", 0LL));
            [v16 addClockValuesInIndexSet:v21 forSiteIdentifier:v20];

            a4 = v19;
            a3 = v26;
          }

          id v22 = (void *)objc_claimAutoreleasedReturnValue([v12 streamConfiguration]);
          v23 = (void *)objc_claimAutoreleasedReturnValue([v22 syncIdentifierForTransport:a3]);

          -[BMMultiStreamTimestampClockVector setVectorClockTo:forStreamIdentifier:]( v28,  "setVectorClockTo:forStreamIdentifier:",  v16,  v23);
        }

        else
        {
          objc_autoreleasePoolPop(objc_autoreleasePoolPush());
        }
      }

      id v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v9);
  }

  return v28;
}

- (id)atomBatchesForChangesSinceClockVector:(id)a3 targetPlatform:(int64_t)a4 transportType:(unint64_t)a5 direction:(unint64_t)a6 ckFormatVersion:(unsigned __int8)a7 chunker:(id)a8
{
  unsigned int v35 = a7;
  id v38 = a3;
  id v37 = a8;
  unint64_t v13 = a6;
  if (a6 != 2)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v34 handleFailureInMethod:a2, self, @"BMDistributedSyncMultiStreamManager.m", 177, @"Invalid parameter not satisfying: %@", @"direction == BMResourceSyncDirectionOutbound" object file lineNumber description];
  }

  uint64_t v14 = __biome_log_for_category(11LL);
  unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t Description = BMDevicePlatformGetDescription(a4);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(Description);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v35));
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v38 description]);
    *(_DWORD *)buf = 138412802;
    v47 = v17;
    __int16 v48 = 2112;
    __int128 v49 = v18;
    __int16 v50 = 2112;
    __int128 v51 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "atomBatchesForChangesSinceClockVector platform: %@, version: %@, clock: %@",  buf,  0x20u);
  }

  uint64_t v36 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_distributedSyncManagers, "allValues"));
  id v20 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v42 != v22) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
        id v25 = objc_autoreleasePoolPush();
        unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v24 streamConfiguration]);
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 syncPolicy]);
        unsigned int v28 = [v27 supportsSyncingWithPlatform:a4 overTransport:a5 inDirection:v13];

        if (v28)
        {
          unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v24 streamConfiguration]);
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 syncIdentifierForTransport:a5]);

          __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v38 timestampClockVectorForStreamIdentifier:v30]);
          __int128 v32 = (void *)objc_claimAutoreleasedReturnValue( [v24 atomBatchesForChangesSinceClockVector:v31 ckFormatVersion:v35 chunker:v37 transportType:a5]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v32, v30);
        }

        objc_autoreleasePoolPop(v25);
      }

      id v21 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }

    while (v21);
  }

  return v36;
}

- (void)mergeAtomBatches:(id)a3 deletedLocations:(id)a4 sessionContext:(id)a5
{
  id v7 = a3;
  id v28 = a4;
  id v27 = a5;
  unsigned int v29 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  uint64_t v9 = __biome_log_for_category(11LL);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v43 = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Merging %llu atom batches", buf, 0xCu);
  }

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id obj = v8;
  id v30 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v30)
  {
    uint64_t v25 = *(void *)v37;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)v11);
        context = objc_autoreleasePoolPush();
        distributedSyncManagers = self->_distributedSyncManagers;
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
        unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( distributedSyncManagers,  "objectForKeyedSubscript:",  v14));

        v16 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:v12]);
        uint64_t v17 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:v12]);
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        id v19 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v33;
          do
          {
            uint64_t v22 = 0LL;
            do
            {
              if (*(void *)v33 != v21) {
                objc_enumerationMutation(v18);
              }
              id v23 = -[BMStreamCRDTLocation initFromDictionary:]( objc_alloc(&OBJC_CLASS___BMStreamCRDTLocation),  "initFromDictionary:",  *(void *)(*((void *)&v32 + 1) + 8LL * (void)v22));
              -[NSMutableArray addObject:](v17, "addObject:", v23);

              uint64_t v22 = (char *)v22 + 1;
            }

            while (v20 != v22);
            id v20 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }

          while (v20);
        }

        [v15 mergeAtomBatch:v16 deletedLocations:v17 sessionContext:v27];

        objc_autoreleasePoolPop(context);
        v11 = (char *)v11 + 1;
      }

      while (v11 != v30);
      id v30 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }

    while (v30);
  }
}

- (id)deletedLocationsForTransportType:(unint64_t)a3
{
  id v23 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_distributedSyncManagers, "allValues"));
  id v4 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v21 = *(void *)v29;
    do
    {
      v6 = 0LL;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)v6);
        id v8 = objc_autoreleasePoolPush();
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 streamConfiguration]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 syncIdentifierForTransport:a3]);

        v11 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        v12 = (void *)objc_claimAutoreleasedReturnValue([v7 deletedLocations]);
        id v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v25;
          do
          {
            v16 = 0LL;
            do
            {
              if (*(void *)v25 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v24 + 1) + 8 * (void)v16) dictionaryRepresentation]);
              -[NSMutableArray addObject:](v11, "addObject:", v17);

              v16 = (char *)v16 + 1;
            }

            while (v14 != v16);
            id v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }

          while (v14);
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v11));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v18, v10);

        objc_autoreleasePoolPop(v8);
        v6 = (char *)v6 + 1;
      }

      while (v6 != v5);
      id v5 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v5);
  }

  return v23;
}

- (BOOL)supportsSyncingWithPlatform:(int64_t)a3 overTransport:(unint64_t)a4 inDirection:(unint64_t)a5
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = self->_distributedSyncManagers;
  id v8 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_distributedSyncManagers,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)i)));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 streamConfiguration]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 syncPolicy]);
        unsigned __int8 v15 = [v14 supportsSyncingWithPlatform:a3 overTransport:a4 inDirection:a5];

        if ((v15 & 1) != 0)
        {
          BOOL v16 = 1;
          goto LABEL_11;
        }
      }

      id v9 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v16 = 0;
LABEL_11:

  return v16;
}

- (NSDictionary)distributedSyncManagers
{
  return self->_distributedSyncManagers;
}

- (BMSyncDevicePeerStatusTracker)peerStatusTracker
{
  return self->_peerStatusTracker;
}

- (BMSyncSessionMetricsCollector)metricsCollector
{
  return self->_metricsCollector;
}

- (void)setMetricsCollector:(id)a3
{
}

- (void).cxx_destruct
{
}

@end