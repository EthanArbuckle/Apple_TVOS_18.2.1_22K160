@interface WAMessageAWDStore
+ (BOOL)supportsSecureCoding;
- (BOOL)_removeMessageWithUUID:(id)a3;
- (NSMutableArray)sortedByLastAccess;
- (NSMutableDictionary)uuidToMessageMap;
- (OS_dispatch_queue)storeQueue;
- (WAMessageAWDStore)init;
- (WAMessageAWDStore)initWithCoder:(id)a3;
- (id)messageForUUID:(id)a3;
- (unint64_t)storeSize;
- (void)_insertInOrder:(id)a3;
- (void)_purgeIfNecessary;
- (void)clearMessageStore;
- (void)encodeWithCoder:(id)a3;
- (void)messsageWasSubmittedWithUUID:(id)a3;
- (void)setSortedByLastAccess:(id)a3;
- (void)setStoreQueue:(id)a3;
- (void)setStoreSize:(unint64_t)a3;
- (void)setUuidToMessageMap:(id)a3;
- (void)updateMessage:(id)a3;
@end

@implementation WAMessageAWDStore

- (WAMessageAWDStore)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___WAMessageAWDStore;
  v2 = -[WAMessageAWDStore init](&v13, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uuidToMessageMap = v2->_uuidToMessageMap;
    v2->_uuidToMessageMap = (NSMutableDictionary *)v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.wifi.analytic.messagestoreQ", v6);
    storeQueue = v2->_storeQueue;
    v2->_storeQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    sortedByLastAccess = (os_log_s *)v2->_sortedByLastAccess;
    v2->_sortedByLastAccess = (NSMutableArray *)v9;
  }

  else
  {
    id v12 = WALogCategoryDefaultHandle();
    sortedByLastAccess = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(sortedByLastAccess, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v15 = "-[WAMessageAWDStore init]";
      __int16 v16 = 1024;
      int v17 = 49;
      _os_log_impl( (void *)&_mh_execute_header,  sortedByLastAccess,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:FAILED to initialize!",  buf,  0x12u);
    }
  }

  return v2;
}

- (void)updateMessage:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_queue_attr_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStore storeQueue](self, "storeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004C08;
  block[3] = &unk_1000CCBD8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)messageForUUID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_100005214;
  v23 = sub_100005224;
  id v24 = 0LL;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStore storeQueue](self, "storeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000522C;
  block[3] = &unk_1000CCC00;
  objc_copyWeak(&v18, &location);
  id v7 = v4;
  id v15 = v7;
  int v17 = &v19;
  id v8 = v5;
  __int16 v16 = v8;
  dispatch_async(v6, block);

  objc_destroyWeak(&v18);
  dispatch_time_t v9 = dispatch_time(0LL, 15000000000LL);
  if (dispatch_semaphore_wait(v8, v9))
  {
    id v10 = WALogCategoryDefaultHandle();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v27 = "-[WAMessageAWDStore messageForUUID:]";
      __int16 v28 = 1024;
      int v29 = 91;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:PARSER: gave up waiting to retrieve message. Bailing to avoid a hang",  buf,  0x12u);
    }
  }

  id v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  objc_destroyWeak(&location);

  return v12;
}

- (void)_insertInOrder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStore sortedByLastAccess](self, "sortedByLastAccess"));
  [v5 removeObject:v4];
  objc_msgSend( v5,  "insertObject:atIndex:",  v4,  objc_msgSend( v5,  "indexOfObject:inSortedRange:options:usingComparator:",  v4,  0,  objc_msgSend(v5, "count"),  1024,  &stru_1000CCC40));
}

- (void)_purgeIfNecessary
{
  if (-[WAMessageAWDStore storeSize](self, "storeSize") < 0x7A121)
  {
    id v20 = WALogCategoryDefaultHandle();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446978;
      v23 = "-[WAMessageAWDStore _purgeIfNecessary]";
      __int16 v24 = 1024;
      int v25 = 117;
      __int16 v26 = 2048;
      unint64_t v27 = -[WAMessageAWDStore storeSize](self, "storeSize");
      __int16 v28 = 1024;
      LODWORD(v29) = 500000;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Won't purge message store, store total size (%lu) <= limit: %d",  buf,  0x22u);
    }

- (void)clearMessageStore
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStore storeQueue](self, "storeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000058DC;
  block[3] = &unk_1000CCBD8;
  objc_copyWeak(&v11, &location);
  id v5 = v3;
  id v10 = v5;
  dispatch_async(v4, block);

  objc_destroyWeak(&v11);
  dispatch_time_t v6 = dispatch_time(0LL, 15000000000LL);
  if (dispatch_semaphore_wait(v5, v6))
  {
    id v7 = WALogCategoryDefaultHandle();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v14 = "-[WAMessageAWDStore clearMessageStore]";
      __int16 v15 = 1024;
      int v16 = 146;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:PARSER: gave up waiting to clear message store. Bailing to avoid a hang",  buf,  0x12u);
    }
  }

  objc_destroyWeak(&location);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uuidToMessageMap = self->_uuidToMessageMap;
  id v5 = a3;
  [v5 encodeObject:uuidToMessageMap forKey:@"_uuidToMessageMap"];
  [v5 encodeInteger:self->_storeSize forKey:@"_storeSize"];
  [v5 encodeObject:self->_sortedByLastAccess forKey:@"_sortedByLastAccess"];
}

- (WAMessageAWDStore)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___WAMessageAWDStore;
  id v5 = -[WAMessageAWDStore init](&v20, "init");
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___WAMessageAWDStoreEntry);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
    dispatch_time_t v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  v7,  v8,  objc_opt_class(&OBJC_CLASS___NSMutableDictionary),  0LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v10 forKey:@"_uuidToMessageMap"]);
    uuidToMessageMap = v5->_uuidToMessageMap;
    v5->_uuidToMessageMap = (NSMutableDictionary *)v11;

    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.wifi.analytic.messagestoreQ", v14);
    storeQueue = v5->_storeQueue;
    v5->_storeQueue = (OS_dispatch_queue *)v15;

    v5->_storeSize = (unint64_t)[v4 decodeIntegerForKey:@"_storeSize"];
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v4 decodeObjectForKey:@"_sortedByLastAccess"]);
    sortedByLastAccess = v5->_sortedByLastAccess;
    v5->_sortedByLastAccess = (NSMutableArray *)v17;
  }

  return v5;
}

- (BOOL)_removeMessageWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStore uuidToMessageMap](self, "uuidToMessageMap"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStore uuidToMessageMap](self, "uuidToMessageMap"));
    [v7 removeObjectForKey:v4];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStore sortedByLastAccess](self, "sortedByLastAccess"));
    [v8 removeObject:v6];

    -[WAMessageAWDStore setStoreSize:]( self,  "setStoreSize:",  (_BYTE *)-[WAMessageAWDStore storeSize](self, "storeSize") - (_BYTE *)[v6 size]);
  }

  return v6 != 0LL;
}

- (void)messsageWasSubmittedWithUUID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStore storeQueue](self, "storeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005CC4;
  block[3] = &unk_1000CCBD8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSMutableDictionary)uuidToMessageMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setUuidToMessageMap:(id)a3
{
}

- (NSMutableArray)sortedByLastAccess
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSortedByLastAccess:(id)a3
{
}

- (OS_dispatch_queue)storeQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setStoreQueue:(id)a3
{
}

- (unint64_t)storeSize
{
  return self->_storeSize;
}

- (void)setStoreSize:(unint64_t)a3
{
  self->_storeSize = a3;
}

- (void).cxx_destruct
{
}

@end