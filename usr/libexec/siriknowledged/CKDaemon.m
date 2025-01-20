@interface CKDaemon
+ (id)sharedDaemon;
- (CKDaemon)init;
- (NSMutableDictionary)cachedHandlers;
- (void)decreaseWeightForLinkWithLabel:(id)a3 betweenSubject:(id)a4 andObject:(id)a5 inStoreWithIdentifier:(id)a6 completionHandler:(id)a7;
- (void)disableSyncAndDeleteCloudDataWithCompletionHandler:(id)a3;
- (void)dropLinkWithLabel:(id)a3 betweenSubject:(id)a4 andObject:(id)a5 inStoreWithIdentifier:(id)a6 completionHandler:(id)a7;
- (void)dropLinksBetweenSubject:(id)a3 andObject:(id)a4 inStoreWithIdentifier:(id)a5 completionHandler:(id)a6;
- (void)dropLinksWithLabel:(id)a3 fromSubject:(id)a4 inStoreWithIdentifier:(id)a5 completionHandler:(id)a6;
- (void)increaseWeightForLinkWithLabel:(id)a3 betweenSubject:(id)a4 andObject:(id)a5 inStoreWithIdentifier:(id)a6 completionHandler:(id)a7;
- (void)keysAndValuesForKeysMatchingCondition:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)keysAndValuesInStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)keysInStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)keysMatchingCondition:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)recordEventWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 metadata:(id)a6 toStoreWithIdentifier:(id)a7 completionHandler:(id)a8;
- (void)removeAllValuesFromStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeAllValuesFromSynchedStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeValueForKey:(id)a3 fromStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removeValueForKey:(id)a3 fromSynchedStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removeValuesForKeys:(id)a3 fromStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removeValuesForKeys:(id)a3 fromSynchedStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removeValuesMatchingCondition:(id)a3 fromStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removeValuesMatchingCondition:(id)a3 fromSynchedStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)saveKeysAndValues:(id)a3 toStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)saveKeysAndValues:(id)a3 toSynchedStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setCachedHandlers:(id)a3;
- (void)setWeightForLinkWithLabel:(id)a3 betweenSubject:(id)a4 andObject:(id)a5 toValue:(int64_t)a6 inStoreWithIdentifier:(id)a7 completionHandler:(id)a8;
- (void)triplesComponentsMatching:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)valueForKey:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)valuesForKeys:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)valuesForKeysMatchingCondition:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)valuesInStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation CKDaemon

- (CKDaemon)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CKDaemon;
  v2 = -[CKDaemon init](&v16, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("CKDaemon._serialQueue", v4);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency( &_dispatch_queue_attr_concurrent,  DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INTERACTIVE, 0);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);

    dispatch_queue_t v11 = dispatch_queue_create("CKDaemon._concurrentQueue", v10);
    concurrentQueue = v2->_concurrentQueue;
    v2->_concurrentQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
    cachedHandlers = v2->_cachedHandlers;
    v2->_cachedHandlers = (NSMutableDictionary *)v13;
  }

  return v2;
}

- (void)keysInStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  concurrentQueue = self->_concurrentQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F93C;
  block[3] = &unk_100018AE0;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)concurrentQueue, block);
}

- (void)keysMatchingCondition:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  concurrentQueue = self->_concurrentQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000F750;
  v15[3] = &unk_100018B08;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)concurrentQueue, v15);
}

- (void)valueForKey:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  concurrentQueue = self->_concurrentQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000F534;
  v15[3] = &unk_100018B08;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)concurrentQueue, v15);
}

- (void)valuesInStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  concurrentQueue = self->_concurrentQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F38C;
  block[3] = &unk_100018AE0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)concurrentQueue, block);
}

- (void)valuesForKeys:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x3032000000LL;
  v24[3] = sub_10000F1A4;
  v24[4] = sub_10000F1B4;
  id v25 = &__NSArray0__struct;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x3032000000LL;
  v22[3] = sub_10000F1A4;
  v22[4] = sub_10000F1B4;
  id v23 = 0LL;
  concurrentQueue = self->_concurrentQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000F1BC;
  v15[3] = &unk_100018B30;
  id v16 = v8;
  v17 = self;
  v20 = v22;
  v21 = v24;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)concurrentQueue, v15);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
}

- (void)valuesForKeysMatchingCondition:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  concurrentQueue = self->_concurrentQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000EFB8;
  v15[3] = &unk_100018B08;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)concurrentQueue, v15);
}

- (void)keysAndValuesInStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  concurrentQueue = self->_concurrentQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000EE10;
  block[3] = &unk_100018AE0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)concurrentQueue, block);
}

- (void)keysAndValuesForKeysMatchingCondition:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  concurrentQueue = self->_concurrentQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000EC24;
  v15[3] = &unk_100018B08;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)concurrentQueue, v15);
}

- (void)triplesComponentsMatching:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  concurrentQueue = self->_concurrentQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000EA38;
  v15[3] = &unk_100018B08;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)concurrentQueue, v15);
}

- (void)saveKeysAndValues:(id)a3 toStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000E800;
  v15[3] = &unk_100018B08;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)serialQueue, v15);
}

- (void)saveKeysAndValues:(id)a3 toSynchedStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t v11 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v15 = v11;
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
    *(_DWORD *)buf = 136315650;
    v22 = "-[CKDaemon saveKeysAndValues:toSynchedStoreWithIdentifier:completionHandler:]";
    __int16 v23 = 2112;
    v24 = v16;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%s Setting all values for keys=[%@] in synched store %@",  buf,  0x20u);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000E6F8;
  v17[3] = &unk_100018B58;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  -[CKDaemon saveKeysAndValues:toStoreWithIdentifier:completionHandler:]( self,  "saveKeysAndValues:toStoreWithIdentifier:completionHandler:",  v14,  v13,  v17);
}

- (void)recordEventWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 metadata:(id)a6 toStoreWithIdentifier:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = (void (**)(id, void *))a8;
  if ([v15 compare:v16] == (id)1)
  {
    id v20 = (os_log_s *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v34 = "-[CKDaemon recordEventWithIdentifier:startDate:endDate:metadata:toStoreWithIdentifier:completionHandler:]";
      __int16 v35 = 2112;
      id v36 = v15;
      __int16 v37 = 2112;
      id v38 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s event startDate should NOT be greater than endDate. (startDate = %@, endDate = %@).",  buf,  0x20u);
    }

    v31[0] = @"localizedDescription";
    v31[1] = @"storeIdentifier";
    v32[0] = @"Event startDate is greater than endDate";
    v32[1] = v14;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  2LL));
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.siriknowledged",  101LL,  v21));

    v19[2](v19, v22);
  }

  else
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10000E4D4;
    v23[3] = &unk_100018B80;
    id v24 = v14;
    v30 = v19;
    id v25 = v18;
    id v26 = v15;
    id v27 = v16;
    id v28 = v17;
    v29 = self;
    -[CKDaemon valueForKey:inStoreWithIdentifier:completionHandler:]( self,  "valueForKey:inStoreWithIdentifier:completionHandler:",  v24,  v25,  v23);

    v22 = v24;
  }
}

- (void)removeValueForKey:(id)a3 fromStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000E318;
  v15[3] = &unk_100018B08;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)serialQueue, v15);
}

- (void)removeValueForKey:(id)a3 fromSynchedStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t v11 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v20 = "-[CKDaemon removeValueForKey:fromSynchedStoreWithIdentifier:completionHandler:]";
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s Removing value for key %@ in synched store %@",  buf,  0x20u);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000E1DC;
  v15[3] = &unk_100018B58;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  -[CKDaemon removeValueForKey:fromStoreWithIdentifier:completionHandler:]( self,  "removeValueForKey:fromStoreWithIdentifier:completionHandler:",  v14,  v13,  v15);
}

- (void)removeValuesForKeys:(id)a3 fromStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000E044;
  v15[3] = &unk_100018B08;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)serialQueue, v15);
}

- (void)removeValuesForKeys:(id)a3 fromSynchedStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t v11 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v20 = "-[CKDaemon removeValuesForKeys:fromSynchedStoreWithIdentifier:completionHandler:]";
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s Removing values for keys %@ in synched store %@",  buf,  0x20u);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000DF34;
  v15[3] = &unk_100018B58;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  -[CKDaemon removeValuesForKeys:fromStoreWithIdentifier:completionHandler:]( self,  "removeValuesForKeys:fromStoreWithIdentifier:completionHandler:",  v14,  v13,  v15);
}

- (void)removeValuesMatchingCondition:(id)a3 fromStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000DD50;
  v15[3] = &unk_100018B08;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)serialQueue, v15);
}

- (void)removeValuesMatchingCondition:(id)a3 fromSynchedStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t v11 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v15 = v11;
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
    *(_DWORD *)buf = 136315650;
    id v22 = "-[CKDaemon removeValuesMatchingCondition:fromSynchedStoreWithIdentifier:completionHandler:]";
    __int16 v23 = 2112;
    id v24 = v16;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%s Removing values matching condition %@ in synched store %@",  buf,  0x20u);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000D8E4;
  v17[3] = &unk_100018BD0;
  void v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  -[CKDaemon keysInStoreWithIdentifier:completionHandler:]( self,  "keysInStoreWithIdentifier:completionHandler:",  v12,  v17);
}

- (void)removeAllValuesFromStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D74C;
  block[3] = &unk_100018AE0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)removeAllValuesFromSynchedStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[CKDaemon removeAllValuesFromSynchedStoreWithIdentifier:completionHandler:]";
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s Removing ALL values in synched store %@",  buf,  0x16u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000D5B0;
  v11[3] = &unk_100018C48;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  -[CKDaemon keysInStoreWithIdentifier:completionHandler:]( self,  "keysInStoreWithIdentifier:completionHandler:",  v9,  v11);
}

- (void)setWeightForLinkWithLabel:(id)a3 betweenSubject:(id)a4 andObject:(id)a5 toValue:(int64_t)a6 inStoreWithIdentifier:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D518;
  block[3] = &unk_100018C70;
  void block[4] = self;
  id v26 = v17;
  id v27 = v14;
  id v28 = v15;
  id v30 = v18;
  int64_t v31 = a6;
  id v29 = v16;
  id v20 = v18;
  id v21 = v16;
  id v22 = v15;
  id v23 = v14;
  id v24 = v17;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)increaseWeightForLinkWithLabel:(id)a3 betweenSubject:(id)a4 andObject:(id)a5 inStoreWithIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  serialQueue = self->_serialQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10000D3B4;
  v23[3] = &unk_100018C98;
  void v23[4] = self;
  id v24 = v15;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v28 = v16;
  id v18 = v16;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = v15;
  dispatch_async((dispatch_queue_t)serialQueue, v23);
}

- (void)decreaseWeightForLinkWithLabel:(id)a3 betweenSubject:(id)a4 andObject:(id)a5 inStoreWithIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  serialQueue = self->_serialQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10000D250;
  v23[3] = &unk_100018C98;
  void v23[4] = self;
  id v24 = v15;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v28 = v16;
  id v18 = v16;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = v15;
  dispatch_async((dispatch_queue_t)serialQueue, v23);
}

- (void)dropLinkWithLabel:(id)a3 betweenSubject:(id)a4 andObject:(id)a5 inStoreWithIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  serialQueue = self->_serialQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10000D1BC;
  v23[3] = &unk_100018C98;
  void v23[4] = self;
  id v24 = v15;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v28 = v16;
  id v18 = v16;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = v15;
  dispatch_async((dispatch_queue_t)serialQueue, v23);
}

- (void)dropLinksWithLabel:(id)a3 fromSubject:(id)a4 inStoreWithIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D12C;
  block[3] = &unk_100018CC0;
  void block[4] = self;
  id v20 = v12;
  id v21 = v10;
  id v22 = v11;
  id v23 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v10;
  id v18 = v12;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)dropLinksBetweenSubject:(id)a3 andObject:(id)a4 inStoreWithIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000CDA0;
  block[3] = &unk_100018CC0;
  void block[4] = self;
  id v20 = v12;
  id v21 = v10;
  id v22 = v11;
  id v23 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v10;
  id v18 = v12;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)disableSyncAndDeleteCloudDataWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[CKNCloudKitManager sharedManager](&OBJC_CLASS___CKNCloudKitManager, "sharedManager"));
  [v4 disableSyncAndDeleteCloudDataWithCompletionHandler:v3];
}

- (NSMutableDictionary)cachedHandlers
{
  return self->_cachedHandlers;
}

- (void)setCachedHandlers:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedDaemon
{
  if (qword_10001DE78 != -1) {
    dispatch_once(&qword_10001DE78, &stru_100018AB8);
  }
  return (id)qword_10001DE80;
}

@end