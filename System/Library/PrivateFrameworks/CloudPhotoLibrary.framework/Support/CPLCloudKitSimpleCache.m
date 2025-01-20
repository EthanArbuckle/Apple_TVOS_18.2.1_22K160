@interface CPLCloudKitSimpleCache
- (CPLCloudKitSimpleCache)initWithLeewayInterval:(double)a3 maximumCapacity:(unint64_t)a4;
- (NSString)status;
- (double)leewayInterval;
- (id)objectForKey:(id)a3 date:(id)a4 expirationDate:(id *)a5;
- (unint64_t)_expiredCountLockedWithDate:(id)a3;
- (unint64_t)count;
- (unint64_t)expiredCountWithDate:(id)a3;
- (unint64_t)hitCount;
- (unint64_t)maximumCapacity;
- (unint64_t)missCount;
- (void)_removeExpiredEntriesLockedForNow:(id)a3;
- (void)_removeFirstEntriesCount:(unint64_t)a3;
- (void)clear;
- (void)setObject:(id)a3 forKey:(id)a4 expirationDate:(id)a5 date:(id)a6;
@end

@implementation CPLCloudKitSimpleCache

- (CPLCloudKitSimpleCache)initWithLeewayInterval:(double)a3 maximumCapacity:(unint64_t)a4
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CPLCloudKitSimpleCache;
  v6 = -[CPLCloudKitSimpleCache init](&v18, "init");
  v7 = v6;
  if (v6)
  {
    v6->_leewayInterval = a3;
    v6->_maximumCapacity = a4;
    uint64_t v8 = CPLCopyDefaultSerialQueueAttributes(v6);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.cpl.cloudkit.simplecache", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( 0LL,  v7->_maximumCapacity,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(Mutable);
    storage = v7->_storage;
    v7->_storage = (NSMutableDictionary *)v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    orderedEntries = v7->_orderedEntries;
    v7->_orderedEntries = v15;
  }

  return v7;
}

- (unint64_t)count
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000A9650;
  v5[3] = &unk_10023DD58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)_expiredCountLockedWithDate:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0LL;
  storage = self->_storage;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000A9754;
  v9[3] = &unk_100242568;
  id v6 = v4;
  id v10 = v6;
  v11 = self;
  v12 = &v13;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](storage, "enumerateKeysAndObjectsUsingBlock:", v9);
  unint64_t v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (unint64_t)expiredCountWithDate:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A9848;
  block[3] = &unk_10023EFF0;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (unint64_t)hitCount
{
  uint64_t v6 = 0LL;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000A9908;
  v5[3] = &unk_10023DD58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)missCount
{
  uint64_t v6 = 0LL;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000A99A8;
  v5[3] = &unk_10023DD58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_removeExpiredEntriesLockedForNow:(id)a3
{
  id v4 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_storage, "allKeys", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", v11));
        if ([v12 isExpiredForNow:v4 withLeeway:self->_leewayInterval])
        {
          -[NSMutableDictionary removeObjectForKey:](self->_storage, "removeObjectForKey:", v11);
          char v8 = 1;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);

    if ((v8 & 1) != 0)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_storage, "allValues"));
      uint64_t v14 = (NSMutableArray *)[v13 mutableCopy];
      orderedEntries = self->_orderedEntries;
      self->_orderedEntries = v14;

      -[NSMutableArray sortUsingSelector:](self->_orderedEntries, "sortUsingSelector:", "compare:");
    }
  }

  else
  {
  }
}

- (void)_removeFirstEntriesCount:(unint64_t)a3
{
  orderedEntries = self->_orderedEntries;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000A9BB4;
  v6[3] = &unk_100242590;
  v6[4] = self;
  v6[5] = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](orderedEntries, "enumerateObjectsUsingBlock:", v6);
  -[NSMutableArray removeObjectsInRange:](self->_orderedEntries, "removeObjectsInRange:", 0LL, a3);
}

- (id)objectForKey:(id)a3 date:(id)a4 expirationDate:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_1000A9D64;
  v30 = sub_1000A9D74;
  id v31 = 0LL;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = sub_1000A9D64;
  v24 = sub_1000A9D74;
  id v25 = 0LL;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A9D7C;
  block[3] = &unk_1002425B8;
  block[4] = self;
  id v16 = v8;
  id v17 = v9;
  __int128 v18 = &v26;
  __int128 v19 = &v20;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync((dispatch_queue_t)queue, block);
  *a5 = (id) v21[5];
  id v13 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (void)setObject:(id)a3 forKey:(id)a4 expirationDate:(id)a5 date:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (self->_maximumCapacity)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A9F40;
    block[3] = &unk_10023ED78;
    id v16 = v10;
    id v17 = v14;
    id v18 = v11;
    id v19 = v12;
    uint64_t v20 = self;
    dispatch_sync((dispatch_queue_t)queue, block);
  }
}

- (void)clear
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AA130;
  block[3] = &unk_10023DC70;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (NSString)status
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000A9D64;
  id v10 = sub_1000A9D74;
  id v11 = 0LL;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000AA214;
  v5[3] = &unk_10023DD58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (double)leewayInterval
{
  return self->_leewayInterval;
}

- (unint64_t)maximumCapacity
{
  return self->_maximumCapacity;
}

- (void).cxx_destruct
{
}

@end