@interface BMSyncScheduler
- (BMSyncScheduler)initWithRapportSyncEngine:(id)a3 cloudKitSyncEngine:(id)a4 peerStatusTracker:(id)a5 database:(id)a6 queue:(id)a7;
- (BOOL)canPerformCloudKitSyncWithReason:(unint64_t)a3;
- (BOOL)canPerformRapportSyncWithReason:(unint64_t)a3;
- (void)syncAllTransportsNowIfPolicyAllowsWithReason:(unint64_t)a3 activity:(id)a4;
- (void)syncCloudKitNowIfPolicyAllowsWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5;
- (void)syncNowIfPolicyAllowsWithReason:(unint64_t)a3 transportType:(unint64_t)a4 activity:(id)a5;
- (void)syncRapportNowIfPolicyAllowsWithDevices:(id)a3 reason:(unint64_t)a4 activity:(id)a5 completionHandler:(id)a6;
- (void)syncRapportNowIfPolicyAllowsWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5;
@end

@implementation BMSyncScheduler

- (BMSyncScheduler)initWithRapportSyncEngine:(id)a3 cloudKitSyncEngine:(id)a4 peerStatusTracker:(id)a5 database:(id)a6 queue:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___BMSyncScheduler;
  v17 = -[BMSyncScheduler init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_rapportSyncEngine, a3);
    objc_storeStrong((id *)&v18->_cloudKitSyncEngine, a4);
    objc_storeStrong((id *)&v18->_peerStatusTracker, a5);
    objc_storeStrong((id *)&v18->_database, a6);
    objc_storeStrong((id *)&v18->_queue, a7);
  }

  return v18;
}

- (void)syncNowIfPolicyAllowsWithReason:(unint64_t)a3 transportType:(unint64_t)a4 activity:(id)a5
{
  id v8 = a5;
  if (a4 == 3)
  {
    -[BMSyncScheduler syncCloudKitNowIfPolicyAllowsWithReason:activity:completionHandler:]( self,  "syncCloudKitNowIfPolicyAllowsWithReason:activity:completionHandler:",  a3,  v8,  0LL);
  }

  else if (a4 == 2)
  {
    -[BMSyncScheduler syncRapportNowIfPolicyAllowsWithReason:activity:completionHandler:]( self,  "syncRapportNowIfPolicyAllowsWithReason:activity:completionHandler:",  a3,  v8,  0LL);
  }

  else
  {
    uint64_t v9 = __biome_log_for_category(11LL);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      unint64_t v12 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "unrecognized transport type (%lu)",  (uint8_t *)&v11,  0xCu);
    }
  }
}

- (void)syncAllTransportsNowIfPolicyAllowsWithReason:(unint64_t)a3 activity:(id)a4
{
  id v6 = a4;
  v7 = dispatch_group_create();
  uint64_t v8 = __biome_log_for_category(11LL);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "syncNowIfPolicyAllowsWithReason: begin rapport sync",  buf,  2u);
  }

  dispatch_group_enter(v7);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100032970;
  block[3] = &unk_1000698D8;
  block[4] = self;
  unint64_t v25 = a3;
  id v11 = v6;
  id v23 = v11;
  unint64_t v12 = v7;
  v24 = v12;
  dispatch_sync((dispatch_queue_t)queue, block);
  uint64_t v13 = __biome_log_for_category(11LL);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "syncNowIfPolicyAllowsWithReason: begin cloudkit sync",  buf,  2u);
  }

  dispatch_group_enter(v12);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000329F8;
  v20[3] = &unk_100068CB0;
  objc_super v21 = v12;
  id v15 = v12;
  -[BMSyncScheduler syncCloudKitNowIfPolicyAllowsWithReason:activity:completionHandler:]( self,  "syncCloudKitNowIfPolicyAllowsWithReason:activity:completionHandler:",  a3,  v11,  v20);
  id v16 = self->_queue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100032A00;
  v18[3] = &unk_100068B70;
  id v19 = v11;
  id v17 = v11;
  dispatch_group_notify(v15, (dispatch_queue_t)v16, v18);
}

- (BOOL)canPerformRapportSyncWithReason:(unint64_t)a3
{
  if (a3 == 5) {
    return 1;
  }
  +[BMSyncPolicy minimumTimeBetweenSyncsForTransport:]( &OBJC_CLASS___BMSyncPolicy,  "minimumTimeBetweenSyncsForTransport:",  2LL);
  double v6 = v5;
  +[BMSyncPolicy minimumTimeBetweenSyncsAttemptsForTransport:]( &OBJC_CLASS___BMSyncPolicy,  "minimumTimeBetweenSyncsAttemptsForTransport:",  2LL);
  double v8 = v7;
  uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue( -[BMSyncDevicePeerStatusTracker lastSyncDateFromAnyDevice]( self->_peerStatusTracker,  "lastSyncDateFromAnyDevice"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase lastRapportSyncAttemptDate](self->_database, "lastRapportSyncAttemptDate"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  unint64_t v12 = v11;
  if (!v10)
  {
    double v14 = INFINITY;
    if (v9) {
      goto LABEL_5;
    }
LABEL_7:
    double v16 = INFINITY;
    goto LABEL_8;
  }

  [v11 timeIntervalSinceDate:v10];
  double v14 = v13;
  if (!v9) {
    goto LABEL_7;
  }
LABEL_5:
  [v12 timeIntervalSinceDate:v9];
  double v16 = v15;
LABEL_8:
  uint64_t v17 = __biome_log_for_category(11LL);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = @"never";
    int v22 = 138544130;
    if (v9) {
      id v20 = v9;
    }
    else {
      id v20 = @"never";
    }
    id v23 = v20;
    __int16 v24 = 2048;
    if (v10) {
      id v19 = v10;
    }
    double v25 = v16;
    __int16 v26 = 2114;
    v27 = v19;
    __int16 v28 = 2048;
    double v29 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "last sync: %{public}@ (%f ago), last attempt: %{public}@ (%f ago)",  (uint8_t *)&v22,  0x2Au);
  }

  if (v9 && v16 < v6 * 0.9 || (BOOL v3 = 1, v10) && v14 < v8 * 0.9) {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)syncRapportNowIfPolicyAllowsWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5
{
  double v8 = (_xpc_activity_s *)a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v10 = objc_autoreleasePoolPush();
  if (-[BMSyncDatabase open](self->_database, "open"))
  {
    id v11 = (id)os_transaction_create("com.apple.biome.syncNow");
    if (-[BMSyncScheduler canPerformRapportSyncWithReason:](self, "canPerformRapportSyncWithReason:", a3))
    {
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      -[BMSyncDatabase setLastRapportSyncAttemptDate:](self->_database, "setLastRapportSyncAttemptDate:", v12);

      if (v8) {
        xpc_activity_set_state(v8, 4LL);
      }
      -[BMRapportSyncEngine startClient](self->_rapportSyncEngine, "startClient");
      rapportSyncEngine = self->_rapportSyncEngine;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_100032F90;
      v26[3] = &unk_100069900;
      v26[4] = self;
      id v11 = v11;
      id v27 = v11;
      id v28 = v9;
      -[BMRapportSyncEngine syncNowWithReason:activity:completionHandler:]( rapportSyncEngine,  "syncNowWithReason:activity:completionHandler:",  a3,  v8,  v26);
    }

    else
    {
      uint64_t v19 = __biome_log_for_category(11LL);
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "skipping rapport sync", buf, 2u);
      }

      objc_super v21 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine metricsCollector](self->_rapportSyncEngine, "metricsCollector"));
      int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 sessionContext]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 sessionID]);
      [v21 recordSessionStart:v23 transport:2 reason:2 isReciprocal:0];

      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v22 sessionID]);
      double v25 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase lastRapportSyncDate](self->_database, "lastRapportSyncDate"));
      [v21 recordSessionEnd:v24 lastSyncDate:v25];

      -[BMSyncDatabase clearCachedStatements](self->_database, "clearCachedStatements");
      if (v9) {
        (*((void (**)(id, void *, void))v9 + 2))(v9, &__NSArray0__struct, 0LL);
      }
    }

    goto LABEL_18;
  }

  uint64_t v14 = __biome_log_for_category(11LL);
  double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Unable to perform Rapport sync now, because database is not currently accessible",  buf,  2u);
  }

  unint64_t v16 = -[BMSyncDatabase state](self->_database, "state");
  if (v9)
  {
    if (v16 == 2) {
      uint64_t v17 = 2LL;
    }
    else {
      uint64_t v17 = 3LL;
    }
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  BMSyncErrorDomain,  v17,  0LL));
    id v30 = v11;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v18);

LABEL_18:
  }

  objc_autoreleasePoolPop(v10);
}

- (void)syncRapportNowIfPolicyAllowsWithDevices:(id)a3 reason:(unint64_t)a4 activity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = (_xpc_activity_s *)a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  double v13 = objc_autoreleasePoolPush();
  if (-[BMSyncDatabase open](self->_database, "open"))
  {
    id v14 = (id)os_transaction_create("com.apple.biome.syncNowWithDevices");
    if (-[BMSyncScheduler canPerformRapportSyncWithReason:](self, "canPerformRapportSyncWithReason:", a4))
    {
      double v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      -[BMSyncDatabase setLastRapportSyncAttemptDate:](self->_database, "setLastRapportSyncAttemptDate:", v15);

      if (v11) {
        xpc_activity_set_state(v11, 4LL);
      }
      -[BMRapportSyncEngine startClient](self->_rapportSyncEngine, "startClient");
      rapportSyncEngine = self->_rapportSyncEngine;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_1000333EC;
      v29[3] = &unk_100069900;
      v29[4] = self;
      id v14 = v14;
      id v30 = v14;
      id v31 = v12;
      -[BMRapportSyncEngine syncNowWithDevices:reason:activity:completionHandler:]( rapportSyncEngine,  "syncNowWithDevices:reason:activity:completionHandler:",  v10,  a4,  v11,  v29);
    }

    else
    {
      uint64_t v22 = __biome_log_for_category(11LL);
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "skipping filtered rapport sync", buf, 2u);
      }

      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine metricsCollector](self->_rapportSyncEngine, "metricsCollector"));
      double v25 = (void *)objc_claimAutoreleasedReturnValue([v24 sessionContext]);
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 sessionID]);
      [v24 recordSessionStart:v26 transport:2 reason:2 isReciprocal:0];

      id v27 = (void *)objc_claimAutoreleasedReturnValue([v25 sessionID]);
      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase lastRapportSyncDate](self->_database, "lastRapportSyncDate"));
      [v24 recordSessionEnd:v27 lastSyncDate:v28];

      -[BMSyncDatabase clearCachedStatements](self->_database, "clearCachedStatements");
      if (v12) {
        (*((void (**)(id, void *, void))v12 + 2))(v12, &__NSArray0__struct, 0LL);
      }
    }

    goto LABEL_18;
  }

  uint64_t v17 = __biome_log_for_category(11LL);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Unable to perform filtered Rapport sync now, because database is not currently accessible",  buf,  2u);
  }

  unint64_t v19 = -[BMSyncDatabase state](self->_database, "state");
  if (v12)
  {
    if (v19 == 2) {
      uint64_t v20 = 2LL;
    }
    else {
      uint64_t v20 = 3LL;
    }
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  BMSyncErrorDomain,  v20,  0LL));
    id v33 = v14;
    objc_super v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0LL, v21);

LABEL_18:
  }

  objc_autoreleasePoolPop(v13);
}

- (BOOL)canPerformCloudKitSyncWithReason:(unint64_t)a3
{
  if (a3 == 5) {
    return 1;
  }
  +[BMSyncPolicy minimumTimeBetweenSyncsForTransport:]( &OBJC_CLASS___BMSyncPolicy,  "minimumTimeBetweenSyncsForTransport:",  3LL);
  double v6 = v5;
  uint64_t v14 = 0LL;
  double v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = sub_10003364C;
  v18 = sub_10003365C;
  id v19 = 0LL;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100033664;
  v13[3] = &unk_100069778;
  v13[4] = self;
  v13[5] = &v14;
  dispatch_sync((dispatch_queue_t)queue, v13);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v9 = v8;
  if (v15[5])
  {
    objc_msgSend(v8, "timeIntervalSinceDate:");
    BOOL v11 = v15[5] == 0;
  }

  else
  {
    BOOL v11 = 1;
    double v10 = INFINITY;
  }

  BOOL v3 = v10 >= v6 * 0.9 || v11;

  _Block_object_dispose(&v14, 8);
  return v3;
}

- (void)syncCloudKitNowIfPolicyAllowsWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5
{
  double v8 = (_xpc_activity_s *)a4;
  id v9 = a5;
  double v10 = objc_autoreleasePoolPush();
  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x2020000000LL;
  char v33 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100033924;
  block[3] = &unk_100069928;
  block[4] = self;
  id v12 = v9;
  id v28 = v12;
  double v29 = &v30;
  dispatch_sync((dispatch_queue_t)queue, block);
  if (!*((_BYTE *)v31 + 24))
  {
    double v13 = (void *)os_transaction_create("com.apple.biome.syncNow");
    if (-[BMSyncScheduler canPerformCloudKitSyncWithReason:](self, "canPerformCloudKitSyncWithReason:", a3))
    {
      uint64_t v14 = self->_queue;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_100033A7C;
      v26[3] = &unk_100068B70;
      v26[4] = self;
      dispatch_sync((dispatch_queue_t)v14, v26);
      if (v8) {
        xpc_activity_set_state(v8, 4LL);
      }
      cloudKitSyncEngine = self->_cloudKitSyncEngine;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100033AD4;
      v21[3] = &unk_100069950;
      v21[4] = self;
      unint64_t v25 = a3;
      uint64_t v22 = v8;
      id v23 = v13;
      id v24 = v12;
      -[BMCloudKitSyncEngine startWithCompletionBlock:](cloudKitSyncEngine, "startWithCompletionBlock:", v21);
    }

    else
    {
      uint64_t v16 = __biome_log_for_category(11LL);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "skipping cloudkit sync", buf, 2u);
      }

      v18 = self->_queue;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_100033DD0;
      v19[3] = &unk_100068B70;
      v19[4] = self;
      dispatch_sync((dispatch_queue_t)v18, v19);
      if (v12) {
        (*((void (**)(id, void *, void))v12 + 2))(v12, &__NSArray0__struct, 0LL);
      }
    }
  }

  _Block_object_dispose(&v30, 8);
  objc_autoreleasePoolPop(v10);
}

- (void).cxx_destruct
{
}

@end