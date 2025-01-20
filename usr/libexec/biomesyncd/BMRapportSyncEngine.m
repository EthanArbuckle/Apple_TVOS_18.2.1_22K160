@interface BMRapportSyncEngine
- (BMDistributedSyncMultiStreamManager)primarySyncManager;
- (BMRapportSyncEngine)initWithQueue:(id)a3 primarySyncManager:(id)a4 primaryDatabase:(id)a5;
- (BMRapportSyncEngine)initWithQueue:(id)a3 primarySyncManager:(id)a4 rapportManager:(id)a5 atomBatchChunkerPolicy:(id)a6 primaryDatabase:(id)a7;
- (BMSyncDatabase)primaryDatabase;
- (BMSyncDevicePeerStatusTracker)peerStatusTracker;
- (BMSyncSessionMetricsCollector)metricsCollector;
- (BOOL)rapportManager:(id)a3 isDeviceSupported:(id)a4;
- (OS_dispatch_queue)queue;
- (id)accountFromRapportOptions:(id)a3;
- (id)buildAtomBatchRequestWithIsReciprocal:(BOOL)a3 syncReason:(unint64_t)a4 sequenceNumber:(unint64_t)a5 transportType:(unint64_t)a6 device:(id)a7;
- (id)createDistributedSyncManagerForAccount:(id)a3;
- (id)fetchAtomBatchesRequestHandler;
- (id)reciprocalCompletionBlock;
- (id)siteSuffix;
- (unsigned)protocolVersion;
- (void)_startServerWithCompletion:(id)a3;
- (void)completeRequest:(id)a3 deliveredToDevices:(id)a4 withErrors:(id)a5;
- (void)completeRequestIfDeliveredToAllNearbyDevices:(id)a3;
- (void)fetchAtomBatchesFromDevices:(id)a3 isReciprocal:(BOOL)a4 reason:(unint64_t)a5 activity:(id)a6 completionHandler:(id)a7;
- (void)fetchAtomBatchesIsReciprocal:(BOOL)a3 reason:(unint64_t)a4 activity:(id)a5 completionHandler:(id)a6;
- (void)finishRequest:(id)a3 toDevice:(id)a4 withError:(id)a5 peerInfo:(id)a6 peerStatusTracker:(id)a7;
- (void)handleFetchAtomBatchesResponse:(id)a3 options:(id)a4 error:(id)a5 fromDevice:(id)a6 forRequest:(id)a7 isReciprocal:(BOOL)a8;
- (void)rapportManager:(id)a3 didDiscoverBMRapportDevice:(id)a4;
- (void)rapportManagerDiscoveryTimedOut:(id)a3;
- (void)registerRequests;
- (void)runRequest:(id)a3 onDevice:(id)a4;
- (void)sendFetchAtomBatchesRequest:(id)a3 toDevice:(id)a4 forRequest:(id)a5;
- (void)setMetricsCollector:(id)a3;
- (void)setReciprocalCompletionBlock:(id)a3;
- (void)startClient;
- (void)startServer;
- (void)startServerWithCompletion:(id)a3;
- (void)syncNowWithDevices:(id)a3 reason:(unint64_t)a4 activity:(id)a5 completionHandler:(id)a6;
- (void)syncNowWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5;
@end

@implementation BMRapportSyncEngine

- (BMRapportSyncEngine)initWithQueue:(id)a3 primarySyncManager:(id)a4 primaryDatabase:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___BMRapportSyncEngine;
  v12 = -[BMRapportSyncEngine init](&v27, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_primarySyncManager, a4);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v10 peerStatusTracker]);
    peerStatusTracker = v13->_peerStatusTracker;
    v13->_peerStatusTracker = (BMSyncDevicePeerStatusTracker *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v10 metricsCollector]);
    metricsCollector = v13->_metricsCollector;
    v13->_metricsCollector = (BMSyncSessionMetricsCollector *)v16;

    objc_storeStrong((id *)&v13->_queue, a3);
    v18 = -[BMRapportManager initWithQueue:](objc_alloc(&OBJC_CLASS___BMRapportManager), "initWithQueue:", v9);
    rapportManager = v13->_rapportManager;
    v13->_rapportManager = v18;

    -[BMRapportManager setDelegate:](v13->_rapportManager, "setDelegate:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v10 peerStatusTracker]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 localDeviceIdentifierCreatingIfNecessary]);
    v22 = (NSString *)[v21 copy];
    localDeviceIdentifier = v13->_localDeviceIdentifier;
    v13->_localDeviceIdentifier = v22;

    v24 = -[BMAtomBatchMaxBytes initWithMaxBytes:]( objc_alloc(&OBJC_CLASS___BMAtomBatchMaxBytes),  "initWithMaxBytes:",  0x200000LL);
    atomBatchChunkerPolicy = v13->_atomBatchChunkerPolicy;
    v13->_atomBatchChunkerPolicy = (BMAtomBatchChunkerPolicy *)v24;

    objc_storeStrong((id *)&v13->_primaryDatabase, a5);
  }

  return v13;
}

- (BMRapportSyncEngine)initWithQueue:(id)a3 primarySyncManager:(id)a4 rapportManager:(id)a5 atomBatchChunkerPolicy:(id)a6 primaryDatabase:(id)a7
{
  id v28 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___BMRapportSyncEngine;
  v17 = -[BMRapportSyncEngine init](&v29, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_primarySyncManager, a4);
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v13 peerStatusTracker]);
    peerStatusTracker = v18->_peerStatusTracker;
    v18->_peerStatusTracker = (BMSyncDevicePeerStatusTracker *)v19;

    uint64_t v21 = objc_claimAutoreleasedReturnValue([v13 metricsCollector]);
    metricsCollector = v18->_metricsCollector;
    v18->_metricsCollector = (BMSyncSessionMetricsCollector *)v21;

    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeStrong((id *)&v18->_rapportManager, a5);
    -[BMRapportManager setDelegate:](v18->_rapportManager, "setDelegate:", v18);
    objc_storeStrong((id *)&v18->_atomBatchChunkerPolicy, a6);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v13 peerStatusTracker]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 localDeviceIdentifierCreatingIfNecessary]);
    v25 = (NSString *)[v24 copy];
    localDeviceIdentifier = v18->_localDeviceIdentifier;
    v18->_localDeviceIdentifier = v25;

    objc_storeStrong((id *)&v18->_primaryDatabase, a7);
  }

  return v18;
}

- (void)startClient
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008688;
  block[3] = &unk_100068B70;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)startServer
{
}

- (void)startServerWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100008714;
  v7[3] = &unk_100068B98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)_startServerWithCompletion:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BMRapportSyncEngine registerRequests](self, "registerRequests");
  -[BMRapportManager start](self->_rapportManager, "start");
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    id v4 = v5;
  }
}

- (void)syncNowWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100008828;
  v13[3] = &unk_100068BC0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)queue, v13);
}

- (void)syncNowWithDevices:(id)a3 reason:(unint64_t)a4 activity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008914;
  block[3] = &unk_100068BE8;
  block[4] = self;
  id v18 = v10;
  id v20 = v12;
  unint64_t v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)completeRequestIfDeliveredToAllNearbyDevices:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v38 = self;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportManager discoveredDevices](self->_rapportManager, "discoveredDevices"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

  v7 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v46 objects:v57 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v47;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v47 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 deliveredToDevices]);
        unsigned int v15 = [v14 containsObject:v13];

        if (v15) {
          -[NSMutableSet addObject:](v7, "addObject:", v13);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v46 objects:v57 count:16];
    }

    while (v10);
  }

  if ([v8 isSubsetOfSet:v7])
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 deliveredToDevices]);
    -[NSMutableSet unionSet:](v7, "unionSet:", v16);

    v17 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v18 = v7;
    id v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v42,  v56,  16LL);
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v43;
      do
      {
        for (j = 0LL; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v43 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)j);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 bmDeviceIdentifier]);

          if (v24)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue([v23 bmDeviceIdentifier]);
            -[NSMutableSet addObject:](v17, "addObject:", v25);
          }
        }

        id v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v42,  v56,  16LL);
      }

      while (v20);
    }

    uint64_t v26 = __biome_log_for_category(11LL);
    objc_super v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](v38, "siteSuffix"));
      objc_super v29 = (void *)objc_claimAutoreleasedReturnValue([v4 inFlightToDevices]);
      *(_DWORD *)buf = 138412546;
      v51 = v28;
      __int16 v52 = 2112;
      v53 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "BMRapportSyncEngine%@: completing request, still inflight: %@",  buf,  0x16u);
    }

    v30 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v31 = (void *)objc_claimAutoreleasedReturnValue([v4 errorFromDevice]);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_100008D90;
    v39[3] = &unk_100068C10;
    id v32 = v4;
    id v40 = v32;
    v41 = v30;
    v33 = v30;
    [v31 enumerateKeysAndObjectsUsingBlock:v39];

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v17, "allObjects"));
    -[BMRapportSyncEngine completeRequest:deliveredToDevices:withErrors:]( v38,  "completeRequest:deliveredToDevices:withErrors:",  v32,  v34,  v33);
  }

  else
  {
    v17 = (NSMutableSet *)[v8 mutableCopy];
    -[NSMutableSet minusSet:](v17, "minusSet:", v7);
    uint64_t v35 = __biome_log_for_category(11LL);
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](v38, "siteSuffix"));
      v37 = (void *)objc_claimAutoreleasedReturnValue([v4 inFlightToDevices]);
      *(_DWORD *)buf = 138412802;
      v51 = v36;
      __int16 v52 = 2112;
      v53 = v37;
      __int16 v54 = 2112;
      v55 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "BMRapportSyncEngine%@: request(s) still inflight: %@, nearbyAndNotDelivered: %@",  buf,  0x20u);
    }
  }
}

- (void)completeRequest:(id)a3 deliveredToDevices:(id)a4 withErrors:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v8 state] == (id)2)
  {
    uint64_t v11 = __biome_log_for_category(11LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
      int v25 = 138412546;
      uint64_t v26 = v13;
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "BMRapportSyncEngine%@: request %@ already finished running",  (uint8_t *)&v25,  0x16u);
    }

- (void)runRequest:(id)a3 onDevice:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v9 deliveredToDevices]);
  if ([v6 containsObject:v5])
  {
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v9 inFlightToDevices]);
    unsigned __int8 v8 = [v7 containsObject:v5];

    if ((v8 & 1) == 0) {
      [v9 runRequestOnDevice:v5];
    }
  }
}

- (void)fetchAtomBatchesIsReciprocal:(BOOL)a3 reason:(unint64_t)a4 activity:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a3;
  id v10 = a5;
  uint64_t v11 = (void (**)(id, void *, void *))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_currentRequest)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"BMRapportErrorDomain",  14LL,  0LL));
    id v40 = v12;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));
    v11[2](v11, &__NSArray0__struct, v13);
  }

  else
  {
    objc_initWeak(&location, self);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_1000096EC;
    v35[3] = &unk_100068C38;
    objc_copyWeak(v36, &location);
    BOOL v37 = v8;
    v35[4] = self;
    v36[1] = (id)a4;
    int v25 = objc_retainBlock(v35);
    id v14 = -[BMRapportRequest initWithUUID:activity:requestBlock:queue:completionHandler:]( objc_alloc(&OBJC_CLASS___BMRapportRequest),  "initWithUUID:activity:requestBlock:queue:completionHandler:",  v26,  v10,  v25,  self->_queue,  v11);
    objc_initWeak(&from, v14);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100009884;
    v31[3] = &unk_100068C60;
    objc_copyWeak(&v32, &location);
    objc_copyWeak(&v33, &from);
    v31[4] = self;
    -[BMRapportRequest setRequestTimeoutHandler:](v14, "setRequestTimeoutHandler:", v31);
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncSessionMetricsCollector sessionContext](self->_metricsCollector, "sessionContext"));
    -[BMRapportRequest setSessionContext:](v14, "setSessionContext:", v15);

    metricsCollector = self->_metricsCollector;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportRequest sessionContext](v14, "sessionContext"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 sessionID]);
    -[BMSyncSessionMetricsCollector recordSessionStart:transport:reason:isReciprocal:]( metricsCollector,  "recordSessionStart:transport:reason:isReciprocal:",  v18,  2LL,  a4,  v8);

    objc_storeStrong((id *)&self->_currentRequest, v14);
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportManager discoveredDevices](self->_rapportManager, "discoveredDevices"));
    id v20 = [v19 countByEnumeratingWithState:&v27 objects:v39 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
          v24 = objc_autoreleasePoolPush();
          -[BMRapportSyncEngine runRequest:onDevice:](self, "runRequest:onDevice:", v14, v23);
          objc_autoreleasePoolPop(v24);
        }

        id v20 = [v19 countByEnumeratingWithState:&v27 objects:v39 count:16];
      }

      while (v20);
    }

    -[BMRapportManager start](self->_rapportManager, "start");
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&from);

    objc_destroyWeak(v36);
    objc_destroyWeak(&location);
  }
}

- (void)fetchAtomBatchesFromDevices:(id)a3 isReciprocal:(BOOL)a4 reason:(unint64_t)a5 activity:(id)a6 completionHandler:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v34 = a6;
  uint64_t v35 = (void (**)(id, void *, void *))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_currentRequest)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"BMRapportErrorDomain",  14LL,  0LL));
    v55 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v55, 1LL));
    v35[2](v35, &__NSArray0__struct, v14);
  }

  else
  {
    BOOL v37 = self;
    objc_initWeak(&location, self);
    id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_100009E88;
    v46[3] = &unk_100068C38;
    objc_copyWeak(v47, &location);
    BOOL v48 = v10;
    v46[4] = self;
    v47[1] = (id)a5;
    id v32 = objc_retainBlock(v46);
    v36 = -[BMRapportRequest initWithUUID:activity:requestBlock:queue:completionHandler:]( objc_alloc(&OBJC_CLASS___BMRapportRequest),  "initWithUUID:activity:requestBlock:queue:completionHandler:",  v33,  v34,  v32,  self->_queue,  v35);
    objc_initWeak(&from, v36);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_10000A014;
    v42[3] = &unk_100068C60;
    objc_copyWeak(&v43, &location);
    objc_copyWeak(&v44, &from);
    v42[4] = self;
    -[BMRapportRequest setRequestTimeoutHandler:](v36, "setRequestTimeoutHandler:", v42);
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncSessionMetricsCollector sessionContext](self->_metricsCollector, "sessionContext"));
    -[BMRapportRequest setSessionContext:](v36, "setSessionContext:", v15);

    metricsCollector = self->_metricsCollector;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportRequest sessionContext](v36, "sessionContext"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 sessionID]);
    -[BMSyncSessionMetricsCollector recordSessionStart:transport:reason:isReciprocal:]( metricsCollector,  "recordSessionStart:transport:reason:isReciprocal:",  v18,  2LL,  a5,  v10);

    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportManager discoveredDevices](self->_rapportManager, "discoveredDevices"));
    id v20 = [v19 countByEnumeratingWithState:&v38 objects:v54 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v39;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v39 != v21) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
          v24 = objc_autoreleasePoolPush();
          int v25 = (void *)objc_claimAutoreleasedReturnValue([v23 rapportIdentifier]);
          unsigned int v26 = [v12 containsObject:v25];

          if (v26)
          {
            uint64_t v27 = __biome_log_for_category(11LL);
            __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              id v29 = v12;
              __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](v37, "siteSuffix"));
              v31 = (void *)objc_claimAutoreleasedReturnValue([v23 rapportIdentifier]);
              *(_DWORD *)buf = 138412546;
              v51 = v30;
              __int16 v52 = 2112;
              v53 = v31;
              _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "BMRapportSyncEngine%@: Specified Rapport device %@ found, sending sync request",  buf,  0x16u);

              id v12 = v29;
            }

            -[BMRapportSyncEngine runRequest:onDevice:](v37, "runRequest:onDevice:", v36, v23);
          }

          objc_autoreleasePoolPop(v24);
        }

        id v20 = [v19 countByEnumeratingWithState:&v38 objects:v54 count:16];
      }

      while (v20);
    }

    -[BMRapportManager start](v37->_rapportManager, "start");
    objc_destroyWeak(&v44);
    objc_destroyWeak(&v43);
    objc_destroyWeak(&from);

    objc_destroyWeak(v47);
    objc_destroyWeak(&location);
  }
}

- (void)sendFetchAtomBatchesRequest:(id)a3 toDevice:(id)a4 forRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 dictionaryRepresentation]);
  rapportManager = self->_rapportManager;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000A254;
  v16[3] = &unk_100068C88;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v8;
  id v13 = v8;
  id v14 = v10;
  id v15 = v9;
  -[BMRapportManager sendRequest:request:toDevice:responseHandler:]( rapportManager,  "sendRequest:request:toDevice:responseHandler:",  @"com.apple.biomesyncd.fetchAtomBatches",  v11,  v15,  v16);
}

- (id)buildAtomBatchRequestWithIsReciprocal:(BOOL)a3 syncReason:(unint64_t)a4 sequenceNumber:(unint64_t)a5 transportType:(unint64_t)a6 device:(id)a7
{
  BOOL v10 = a3;
  id v12 = a7;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 account]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[BMRapportSyncEngine createDistributedSyncManagerForAccount:]( self,  "createDistributedSyncManagerForAccount:",  v13));

  if (v14)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v14 clockVectorForStreamsSupportingTransportType:a6 direction:1 device:v12]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[BMMultiStreamVectorClockConverter multiStreamTimestampClockVectorToVectorClock:]( &OBJC_CLASS___BMMultiStreamVectorClockConverter,  "multiStreamTimestampClockVectorToVectorClock:",  v24));
    id v16 = (void *)objc_claimAutoreleasedReturnValue( [v14 rangeClockVectorForStreamsSupportingTransportType:a6 direction:1 device:v12]);
    id v17 = objc_opt_new(&OBJC_CLASS___BMFetchAtomBatchesRequest);
    -[BMPeerToPeerMessage setProtocolVersion:]( v17,  "setProtocolVersion:",  -[BMRapportSyncEngine protocolVersion](self, "protocolVersion"));
    BOOL v18 = v10;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 peerStatusTracker]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v19,  "localDeviceUpdatingIfNeccesaryWithProtocolVersion:",  -[BMRapportSyncEngine protocolVersion](self, "protocolVersion")));
    -[BMPeerToPeerMessage setPeer:](v17, "setPeer:", v20);

    -[BMPeerToPeerMessage setWalltime:](v17, "setWalltime:", CFAbsoluteTimeGetCurrent());
    -[BMPeerToPeerMessage setSyncReason:](v17, "setSyncReason:", a4);
    -[BMFetchAtomBatchesRequest setBatchSize:](v17, "setBatchSize:", 0x200000LL);
    -[BMFetchAtomBatchesRequest setBatchSequenceNumber:](v17, "setBatchSequenceNumber:", a5);
    -[BMFetchAtomBatchesRequest setVectorClock:](v17, "setVectorClock:", v15);
    -[BMFetchAtomBatchesRequest setRangeClockVectors:](v17, "setRangeClockVectors:", v16);
    -[BMFetchAtomBatchesRequest setIsReciprocalRequest:](v17, "setIsReciprocalRequest:", v18);
    -[BMFetchAtomBatchesRequest setAtomBatchVersion:](v17, "setAtomBatchVersion:", 2LL);
  }

  else
  {
    uint64_t v21 = __biome_log_for_category(11LL);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100040420();
    }

    id v17 = 0LL;
  }

  return v17;
}

- (void)registerRequests
{
  uint64_t v6 = RPOptionStatusFlags;
  v7 = &off_10006EE70;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  rapportManager = self->_rapportManager;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine fetchAtomBatchesRequestHandler](self, "fetchAtomBatchesRequestHandler"));
  -[BMRapportManager registerRequestID:options:requestHandler:]( rapportManager,  "registerRequestID:options:requestHandler:",  @"com.apple.biomesyncd.fetchAtomBatches",  v3,  v5);
}

- (BOOL)rapportManager:(id)a3 isDeviceSupported:(id)a4
{
  id v5 = a4;
  id v6 = +[BMDeviceMetadataUtils platform](&OBJC_CLASS___BMDeviceMetadataUtils, "platform");
  id v7 = [v5 platform];
  if (v6 != (id)6)
  {
    if (v7 != (id)6) {
      goto LABEL_12;
    }
    if (v6 == (id)2)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 device]);
      unsigned __int8 v15 = [v14 statusFlags];

      if ((v15 & 1) != 0) {
        goto LABEL_12;
      }
    }

- (void)rapportManager:(id)a3 didDiscoverBMRapportDevice:(id)a4
{
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  -[BMRapportSyncEngine runRequest:onDevice:](self, "runRequest:onDevice:", self->_currentRequest, v6);
}

- (void)rapportManagerDiscoveryTimedOut:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"BMRapportErrorDomain",  6LL,  0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportRequest completionHandler](self->_currentRequest, "completionHandler"));

  if (v5)
  {
    id v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[BMRapportRequest completionHandler]( self->_currentRequest,  "completionHandler"));
    id v8 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
    ((void (**)(void, void *, void *))v6)[2](v6, &__NSArray0__struct, v7);
  }

  -[BMRapportManager stop](self->_rapportManager, "stop");
}

- (id)fetchAtomBatchesRequestHandler
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000A9D8;
  v5[3] = &unk_100068CD8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v3 = objc_retainBlock(v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (void)handleFetchAtomBatchesResponse:(id)a3 options:(id)a4 error:(id)a5 fromDevice:(id)a6 forRequest:(id)a7 isReciprocal:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v84 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[BMSyncCore resetEagerExitTimer](&OBJC_CLASS___BMSyncCore, "resetEagerExitTimer");
  id v18 = -[BMFetchAtomBatchesResponse initFromDictionary:]( objc_alloc(&OBJC_CLASS___BMFetchAtomBatchesResponse),  "initFromDictionary:",  v14);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 peer]);
  int v20 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:RPOptionSenderIDSDeviceID]);
  [v19 setIdsDeviceIdentifier:v20];

  v83 = v15;
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine accountFromRapportOptions:](self, "accountFromRapportOptions:", v15));
  uint64_t v21 = objc_claimAutoreleasedReturnValue( -[BMRapportSyncEngine createDistributedSyncManagerForAccount:]( self,  "createDistributedSyncManagerForAccount:"));
  __int16 v22 = (void *)v21;
  if (v21)
  {
    if (v16)
    {
      id v23 = (void *)v21;
      uint64_t v24 = __biome_log_for_category(11LL);
      int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v81 = v17;
        id v71 = v16;
        id v72 = v14;
        v73 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
        *(_DWORD *)buf = 138413058;
        v86 = v73;
        __int16 v87 = 2112;
        uint64_t v88 = (uint64_t)v72;
        __int16 v89 = 2112;
        id v90 = v71;
        __int16 v91 = 2112;
        id v92 = v81;
        _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "BMRapportSyncEngine%@: handleFetchAtomBatchesResponse %@ error %@ fromDevice: %@",  buf,  0x2Au);

        id v14 = v72;
        id v16 = v71;
        id v17 = v81;
      }

      __int16 v22 = v23;
      id v26 = (id)objc_claimAutoreleasedReturnValue([v23 peerStatusTracker]);
      -[BMRapportSyncEngine finishRequest:toDevice:withError:peerInfo:peerStatusTracker:]( self,  "finishRequest:toDevice:withError:peerInfo:peerStatusTracker:",  v84,  v17,  v16,  v19,  v26);
      goto LABEL_32;
    }

    BOOL v75 = v8;
    id v79 = v14;
    id v26 = [v14 mutableCopy];
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"deletedLocations"]);
    if (v29) {
      __int128 v30 = @"... redacted due to size ...";
    }
    else {
      __int128 v30 = 0LL;
    }
    [v26 setObject:v30 forKeyedSubscript:@"deletedLocations"];

    uint64_t v31 = __biome_log_for_category(11LL);
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    id v80 = v17;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v17 shortenedRapportIdentifier]);
      *(_DWORD *)buf = 138413058;
      v86 = v33;
      __int16 v87 = 2112;
      uint64_t v88 = (uint64_t)v34;
      __int16 v89 = 2112;
      id v90 = v26;
      __int16 v91 = 2112;
      id v92 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "BMRapportSyncEngine%@: received response from BMRapportDevice[%@] %@ %@",  buf,  0x2Au);

      id v17 = v80;
    }

    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v19 deviceIdentifier]);
    if (v35)
    {
      [v17 setBmDeviceIdentifier:v35];
      metricsCollector = self->_metricsCollector;
      id v37 = [v18 atomBatchBytes];
      v77 = self;
      __int128 v38 = v19;
      id v39 = v26;
      id v40 = v18;
      id v41 = v17;
      id v42 = v37;
      id v43 = (void *)objc_claimAutoreleasedReturnValue([v84 sessionContext]);
      id v44 = v42;
      id v17 = v41;
      id v18 = v40;
      id v26 = v39;
      id v19 = v38;
      self = v77;
      -[BMSyncSessionMetricsCollector recordMessageToDeviceIdentifier:reachable:bytes:isReciprocal:sessionContext:]( metricsCollector,  "recordMessageToDeviceIdentifier:reachable:bytes:isReciprocal:sessionContext:",  v35,  1LL,  v44,  v75,  v43);

      __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v84 sessionContext]);
      [v45 setOriginatingSiteIdentifier:v35];
    }

    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v18 atomBatches]);
    uint64_t v47 = objc_claimAutoreleasedReturnValue([v18 deletedLocations]);
    BOOL v48 = (void *)objc_claimAutoreleasedReturnValue([v84 sessionContext]);
    v78 = (void *)v47;
    [v22 mergeAtomBatches:v46 deletedLocations:v47 sessionContext:v48];

    if ([v18 moreComing])
    {
      uint64_t v49 = objc_claimAutoreleasedReturnValue([v84 activity]);
      if (v49
        && (v50 = (void *)v49,
            v51 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue([v84 activity]),
            BOOL should_defer = xpc_activity_should_defer(v51),
            v51,
            v50,
            should_defer))
      {
        uint64_t v53 = __biome_log_for_category(11LL);
        __int16 v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        id v17 = v80;
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
          *(_DWORD *)buf = 138412546;
          v86 = v55;
          __int16 v87 = 2112;
          uint64_t v88 = (uint64_t)v80;
          _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "BMRapportSyncEngine%@: asked to defer activity, won't issue more requests to device %@ even though more data is available",  buf,  0x16u);
        }

        uint64_t v56 = 13LL;
      }

      else
      {
        v61 = (char *)[v18 batchSequenceNumber] + 1;
        id v16 = 0LL;
        if ((unint64_t)v61 < 6)
        {
          id v66 = [v18 syncReason];
          v74 = v61;
          v67 = v61;
          id v17 = v80;
          v60 = (void *)objc_claimAutoreleasedReturnValue( -[BMRapportSyncEngine buildAtomBatchRequestWithIsReciprocal:syncReason:sequenceNumber:transportType:device:]( self,  "buildAtomBatchRequestWithIsReciprocal:syncReason:sequenceNumber:transportType:device:",  v75,  v66,  v67,  2LL,  v80));
          uint64_t v68 = __biome_log_for_category(11LL);
          v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
          v76 = v69;
          if (v60)
          {
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
            {
              v70 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
              *(_DWORD *)buf = 138412802;
              v86 = v70;
              __int16 v87 = 2112;
              uint64_t v88 = (uint64_t)v80;
              __int16 v89 = 2048;
              id v90 = v74;
              _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "BMRapportSyncEngine%@: sending request to device %@ with sequence number %lu",  buf,  0x20u);

              id v16 = 0LL;
            }

            -[BMRapportSyncEngine sendFetchAtomBatchesRequest:toDevice:forRequest:]( self,  "sendFetchAtomBatchesRequest:toDevice:forRequest:",  v60,  v80,  v84);
          }

          else
          {
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
              sub_1000407AC();
            }
          }

          goto LABEL_31;
        }

        uint64_t v62 = __biome_log_for_category(11LL);
        v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
        id v17 = v80;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          v64 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
          *(_DWORD *)buf = 138412802;
          v86 = v64;
          __int16 v87 = 2048;
          uint64_t v88 = 5LL;
          __int16 v89 = 2112;
          id v90 = v80;
          _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "BMRapportSyncEngine%@: max request depth %lu hit, finishing request to device %@",  buf,  0x20u);
        }

        uint64_t v56 = 12LL;
      }

      v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"BMRapportErrorDomain",  v56,  0LL));
      v65 = (void *)objc_claimAutoreleasedReturnValue([v22 peerStatusTracker]);
      -[BMRapportSyncEngine finishRequest:toDevice:withError:peerInfo:peerStatusTracker:]( self,  "finishRequest:toDevice:withError:peerInfo:peerStatusTracker:",  v84,  v17,  v60,  v19,  v65);
    }

    else
    {
      uint64_t v57 = __biome_log_for_category(11LL);
      v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
        *(_DWORD *)buf = 138412546;
        v86 = v59;
        __int16 v87 = 2112;
        uint64_t v88 = (uint64_t)v17;
        _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "BMRapportSyncEngine%@: no more data coming from device %@ finishing request",  buf,  0x16u);
      }

      v60 = (void *)objc_claimAutoreleasedReturnValue([v22 peerStatusTracker]);
      -[BMRapportSyncEngine finishRequest:toDevice:withError:peerInfo:peerStatusTracker:]( self,  "finishRequest:toDevice:withError:peerInfo:peerStatusTracker:",  v84,  v17,  0LL,  v19,  v60);
    }

    id v16 = 0LL;
LABEL_31:

    id v14 = v79;
    goto LABEL_32;
  }

  uint64_t v27 = __biome_log_for_category(11LL);
  __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    sub_100040730();
  }

  id v26 = (id)objc_claimAutoreleasedReturnValue([0 peerStatusTracker]);
  -[BMRapportSyncEngine finishRequest:toDevice:withError:peerInfo:peerStatusTracker:]( self,  "finishRequest:toDevice:withError:peerInfo:peerStatusTracker:",  v84,  v17,  v16,  v19,  v26);
  __int16 v22 = 0LL;
LABEL_32:
}

- (void)finishRequest:(id)a3 toDevice:(id)a4 withError:(id)a5 peerInfo:(id)a6 peerStatusTracker:(id)a7
{
  id v17 = a6;
  id v12 = a7;
  id v13 = a3;
  [v13 markAsDeliveredToDevice:a4 withError:a5];
  -[BMRapportSyncEngine completeRequestIfDeliveredToAllNearbyDevices:]( self,  "completeRequestIfDeliveredToAllNearbyDevices:",  v13);

  if (v17)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v17 deviceIdentifier]);

    if (v14)
    {
      [v12 upsertSyncDevicePeer:v17];
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v17 deviceIdentifier]);
      [v12 setLastSyncDate:v15 forDeviceWithIdentifier:v16];
    }
  }
}

- (id)accountFromRapportOptions:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"senderAccountAltDSID"]);
  if ([v5 length])
  {
    id v6 = -[BMAccount initWithAccountIdentifier:](objc_alloc(&OBJC_CLASS___BMAccount), "initWithAccountIdentifier:", v5);
    if (v6)
    {
LABEL_3:
      id v7 = v6;
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v8 = __biome_log_for_category(11LL);
    unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine siteSuffix](self, "siteSuffix"));
      int v17 = 138412546;
      id v18 = v10;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "BMRapportSyncEngine%@: Attempting to use discovered devices cache to identify account for %@",  (uint8_t *)&v17,  0x16u);
    }

    rapportManager = self->_rapportManager;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:RPOptionSenderIDSDeviceID]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportManager deviceWithIdentifier:](rapportManager, "deviceWithIdentifier:", v12));

    id v6 = (BMAccount *)objc_claimAutoreleasedReturnValue([v13 account]);
    if (v6) {
      goto LABEL_3;
    }
  }

  uint64_t v14 = __biome_log_for_category(11LL);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_100040828();
  }

LABEL_10:
  return v6;
}

- (id)createDistributedSyncManagerForAccount:(id)a3
{
  if (a3) {
    v3 = (BMDistributedSyncMultiStreamManager *)objc_claimAutoreleasedReturnValue( +[BMDistributedSyncMultiStreamManager multiStreamManagerWithPrimaryDatabase:account:queue:]( &OBJC_CLASS___BMDistributedSyncMultiStreamManager,  "multiStreamManagerWithPrimaryDatabase:account:queue:",  self->_primaryDatabase,  a3,  self->_queue));
  }
  else {
    v3 = self->_primarySyncManager;
  }
  return v3;
}

- (unsigned)protocolVersion
{
  return 5;
}

- (id)siteSuffix
{
  return &stru_100069BD0;
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

- (id)reciprocalCompletionBlock
{
  return self->_reciprocalCompletionBlock;
}

- (void)setReciprocalCompletionBlock:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BMSyncDatabase)primaryDatabase
{
  return self->_primaryDatabase;
}

- (BMDistributedSyncMultiStreamManager)primarySyncManager
{
  return self->_primarySyncManager;
}

- (void).cxx_destruct
{
}

@end