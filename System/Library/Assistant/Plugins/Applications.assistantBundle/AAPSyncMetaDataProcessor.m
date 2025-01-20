@interface AAPSyncMetaDataProcessor
- (AAPSyncMetaDataProcessor)initWithSource:(id)a3;
- (void)_queue_processNextChange:(id)a3 afterAnchor:(id)a4 withInitialAnchor:(id)a5;
- (void)_queue_updateCache;
- (void)dealloc;
- (void)processNextChange:(id)a3 afterAnchor:(id)a4;
@end

@implementation AAPSyncMetaDataProcessor

- (AAPSyncMetaDataProcessor)initWithSource:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AAPSyncMetaDataProcessor;
  v4 = -[AAPSyncMetaDataProcessor init](&v8, "init");
  if (v4)
  {
    v4->_queue = (OS_dispatch_queue *)dispatch_queue_create(0LL, 0LL);
    v4->_appInfoCacheCheck = objc_alloc_init(&OBJC_CLASS___NSCondition);
    queue = (dispatch_queue_s *)v4->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_7B40;
    v7[3] = &unk_1C7E8;
    v7[4] = a3;
    v7[5] = v4;
    dispatch_async(queue, v7);
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AAPSyncMetaDataProcessor;
  -[AAPSyncMetaDataProcessor dealloc](&v3, "dealloc");
}

- (void)processNextChange:(id)a3 afterAnchor:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_7C74;
  block[3] = &unk_1C810;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)_queue_processNextChange:(id)a3 afterAnchor:(id)a4 withInitialAnchor:(id)a5
{
  v9 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  unint64_t v10 = -[NSArray count](self->_metaData, "count");
  unint64_t lastChangeOffset = self->_lastChangeOffset;
  if (lastChangeOffset >= v10)
  {
    if (lastChangeOffset != 0x7FFFFFFFFFFFFFFFLL
      && (v37 = (os_log_s *)AFSiriLogContextPlugin, os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)))
    {
      sub_11AC0(v37, v38, v39, v40, v41, v42, v43, v44);
      if (!v10) {
        goto LABEL_23;
      }
    }

    else if (!v10)
    {
      goto LABEL_23;
    }

    goto LABEL_20;
  }

  if (!objc_msgSend( objc_msgSend(-[NSArray objectAtIndex:](self->_metaData, "objectAtIndex:"), "anchor"),  "isEqualToAnchor:",  a4))
  {
    v45 = (os_log_s *)AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
      sub_11A50(v45, v46, v47, v48, v49, v50, v51, v52);
    }
LABEL_20:
    unint64_t v13 = 0LL;
    while (1)
    {
      id v14 = -[NSArray objectAtIndex:](self->_metaData, "objectAtIndex:", v13);
      if (v10 == ++v13) {
        goto LABEL_23;
      }
    }
  }

  unint64_t v12 = self->_lastChangeOffset;
  unint64_t v13 = v12 + 1;
  if (v12 + 1 >= v10) {
    goto LABEL_23;
  }
  id v14 = -[NSArray objectAtIndex:](self->_metaData, "objectAtIndex:", v12 + 1);
LABEL_5:
  if (v14)
  {
    id v15 = [v14 appId];
    -[NSCondition lock](self->_appInfoCacheCheck, "lock");
    v16 = (NSNull *)-[NSMutableDictionary objectForKey:](self->_appInfoCache, "objectForKey:", v15);
    v17 = +[NSNull null](&OBJC_CLASS___NSNull, "null");
    if (v16 == v17)
    {
      v18 = (os_log_s *)AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
        sub_119E0(v18, v19, v20, v21, v22, v23, v24, v25);
      }
      do
      {
        -[NSCondition wait](self->_appInfoCacheCheck, "wait");
        v26 = (NSNull *)-[NSMutableDictionary objectForKey:](self->_appInfoCache, "objectForKey:", v15);
      }

      while (v26 == +[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }

    id v27 = -[NSMutableDictionary objectForKey:](self->_appInfoCache, "objectForKey:", v15);
    if (v27)
    {
      id v28 = v27;
      if (v16 != v17)
      {
        v29 = (os_log_s *)AFSiriLogContextPlugin;
        if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
          sub_11970(v29, v30, v31, v32, v33, v34, v35, v36);
        }
      }
    }

    else
    {
      v61 = (os_log_s *)AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
        sub_11900(v61, v62, v63, v64, v65, v66, v67, v68);
      }
      id v28 = [v14 scrapeAppInfo];
    }

    -[NSCondition unlock](self->_appInfoCacheCheck, "unlock");
    self->_unint64_t lastChangeOffset = v13;
    -[AAPSyncMetaDataProcessor _queue_updateCache](self, "_queue_updateCache");
    unsigned int v69 = AAPSyncInfoIsValidForItem(v28, v14);
    v70 = (os_log_s *)AFSiriLogContextPlugin;
    if (v69)
    {
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
        sub_11800((uint64_t)v14, v70, v71, v72, v73, v74, v75, v76);
      }
      [a3 setObject:v28];
      objc_msgSend(a3, "setPostAnchor:", objc_msgSend(objc_msgSend(v14, "anchor"), "stringRepresentation"));
    }

    else
    {
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
        sub_11878();
      }
      -[AAPSyncMetaDataProcessor _queue_processNextChange:afterAnchor:withInitialAnchor:]( self,  "_queue_processNextChange:afterAnchor:withInitialAnchor:",  a3,  [v14 anchor],  a5);
    }

    goto LABEL_42;
  }

- (void)_queue_updateCache
{
  unint64_t v3 = -[NSArray count](self->_metaData, "count");
  v4 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 2LL);
  -[NSCondition lock](self->_appInfoCacheCheck, "lock");
  unint64_t lastChangeOffset = self->_lastChangeOffset;
  if (lastChangeOffset == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v6 = 0LL;
  }
  else {
    unint64_t v6 = lastChangeOffset + 1;
  }
  unint64_t v7 = v6 + 2;
  if (v6 + 2 >= v3) {
    unint64_t v7 = v3;
  }
  self->_appInfoCacheStart = v6;
  for (self->_appInfoCacheEnd = v7; v6 < self->_appInfoCacheEnd; ++v6)
  {
    id v8 = -[NSArray objectAtIndex:](self->_metaData, "objectAtIndex:", v6);
    id v9 = [v8 appId];
    id v10 = -[NSMutableDictionary objectForKey:](self->_appInfoCache, "objectForKey:", v9);
    if (v10)
    {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v10, v9);
    }

    else
    {
      -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  +[NSNull null](&OBJC_CLASS___NSNull, "null"),  v9);
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_819C;
      v12[3] = &unk_1C838;
      v12[4] = v8;
      v12[5] = self;
      v12[6] = v9;
      v12[7] = v6;
      dispatch_async(global_queue, v12);
    }
  }

  self->_appInfoCache = v4;
  -[NSCondition unlock](self->_appInfoCacheCheck, "unlock");
}

@end