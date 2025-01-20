@interface CommunicationsFilterBlockListStore
+ (id)sharedInstance;
- (BOOL)addItemForAllServices:(id)a3;
- (BOOL)isItemInList:(id)a3;
- (BOOL)removeItemForAllServices:(id)a3;
- (CMFSyncAgentDataStore)dataStore;
- (CommunicationsFilterBlockListStore)init;
- (NSMutableArray)cachedBlockList;
- (id)_copyItems:(BOOL)a3;
- (id)_isItemInList:(id)a3 blockList:(id)a4;
- (id)copyAllItems;
- (id)copyAllItemsAsDictionaries;
- (void)_stopSharingFocusStatusWithFilterItem:(id)a3;
- (void)_storeDidChangeExternally;
- (void)_updateStore:(id)a3 revision:(unint64_t)a4 updateKVS:(BOOL)a5 updateLocal:(BOOL)a6 itemsNeedConversion:(BOOL)a7;
- (void)clearBlockList;
- (void)dealloc;
- (void)handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:(id)a3;
- (void)migrateLegacyDataStoreIfNeeded;
- (void)setCachedBlockList:(id)a3;
- (void)synchronizeDataStore;
- (void)updateDataStore;
@end

@implementation CommunicationsFilterBlockListStore

+ (id)sharedInstance
{
  if (qword_10000C370 != -1) {
    dispatch_once(&qword_10000C370, &stru_1000083F8);
  }
  return (id)qword_10000C378;
}

- (CommunicationsFilterBlockListStore)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CommunicationsFilterBlockListStore;
  v2 = -[CommunicationsFilterBlockListStore init](&v4, "init");
  if (v2)
  {
    v2->_dataStore = (CMFSyncAgentDataStore *)-[NSUbiquitousKeyValueStore _initWithStoreIdentifier:usingEndToEndEncryption:]( objc_alloc(&OBJC_CLASS___NSUbiquitousKeyValueStore),  "_initWithStoreIdentifier:usingEndToEndEncryption:",  @"com.apple.cmfsyncagent",  1LL);
    -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  v2,  "handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:",  NSUbiquitousKeyValueStoreDidChangeExternallyNotification,  v2->_dataStore);
    IMSyncronizeAppPreferences(-[CommunicationsFilterBlockListStore synchronizeDataStore](v2, "synchronizeDataStore"));
    -[CommunicationsFilterBlockListStore migrateLegacyDataStoreIfNeeded](v2, "migrateLegacyDataStoreIfNeeded");
  }

  return v2;
}

- (void)dealloc
{
  -[CommunicationsFilterBlockListStore clearBlockList](self, "clearBlockList");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CommunicationsFilterBlockListStore;
  -[CommunicationsFilterBlockListStore dealloc](&v3, "dealloc");
}

- (void)clearBlockList
{
  cachedBlockList = self->_cachedBlockList;
  if (cachedBlockList)
  {

    self->_cachedBlockList = 0LL;
  }

- (void)migrateLegacyDataStoreIfNeeded
{
  if (-[CMFSyncAgentDataStore objectForKey:]( -[CommunicationsFilterBlockListStore dataStore](self, "dataStore"),  "objectForKey:",  @"__kCMFBlockListStoreTopLevelKey"))
  {
    objc_super v3 = (os_log_s *)sub_1000043A0();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v9 = 138412290;
    v10 = @"__kCMFBlockListStoreTopLevelKey";
    objc_super v4 = "Cancelling legacy data store migration; data store contains a value for key %@";
    v5 = v3;
    goto LABEL_4;
  }

  id v6 = -[NSUbiquitousKeyValueStore objectForKey:]( +[NSUbiquitousKeyValueStore defaultStore](&OBJC_CLASS___NSUbiquitousKeyValueStore, "defaultStore"),  "objectForKey:",  @"__kCMFBlockListStoreTopLevelKey");
  v7 = (os_log_s *)sub_1000043A0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v9 = 138412290;
      v10 = @"__kCMFBlockListStoreTopLevelKey";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Performing legacy data store migration for key %@",  (uint8_t *)&v9,  0xCu);
    }

    -[CMFSyncAgentDataStore setObject:forKey:]( -[CommunicationsFilterBlockListStore dataStore](self, "dataStore"),  "setObject:forKey:",  v6,  @"__kCMFBlockListStoreTopLevelKey");
  }

  else if (v8)
  {
    int v9 = 138412290;
    v10 = @"__kCMFBlockListStoreTopLevelKey";
    objc_super v4 = "Cancelling legacy data store migration; legacy data store does not contain a value for key %@";
    v5 = v7;
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v9, 0xCu);
  }

- (void)synchronizeDataStore
{
  if ((objc_opt_respondsToSelector(self->_dataStore, "synchronize") & 1) != 0)
  {
    unsigned int v3 = -[CMFSyncAgentDataStore synchronize](self->_dataStore, "synchronize");
    objc_super v4 = (os_log_s *)sub_1000043A0();
    v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Data store synchronization completed successfully.",  v6,  2u);
      }
    }

    else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      sub_100005C08(v5);
    }
  }

- (void)updateDataStore
{
  unsigned int v3 = (dispatch_queue_s *)sub_100003B98();
  dispatch_assert_queue_V2(v3);
  objc_super v4 = -[CommunicationsFilterBlockListStore dataStore](self, "dataStore");
  uint64_t v8 = 0LL;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int16 v7 = 0;
  sub_100004B7C(v4, v5, 0, &v8, (_BYTE *)&v7 + 1, &v7);
  LODWORD(v4) = -[NSMutableArray count](v5, "count") == 0LL;

  sub_100004840(v4);
  id v6 = (dispatch_queue_s *)sub_100003B98();
  dispatch_async(v6, &stru_100008418);
}

- (void)_storeDidChangeExternally
{
  unsigned int v3 = (os_log_s *)sub_1000043A0();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "manually synchronizing and triggering update",  v5,  2u);
  }

  IMSyncronizeAppPreferences(v4);
  -[CommunicationsFilterBlockListStore updateDataStore](self, "updateDataStore");
}

- (BOOL)addItemForAllServices:(id)a3
{
  if (a3)
  {
    uint64_t v21 = 0LL;
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int16 v20 = 0;
    -[CommunicationsFilterBlockListStore clearBlockList](self, "clearBlockList");
    sub_100004B7C( -[CommunicationsFilterBlockListStore dataStore](self, "dataStore"),  v5,  0,  &v21,  (_BYTE *)&v20 + 1,  &v20);
    if ((unint64_t)-[NSMutableArray count](v5, "count") >= 0x4E21)
    {
      id v6 = (os_log_s *)sub_1000043A0();
      BOOL v7 = 0;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v23 = 20000;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[WARN] Block list is too large, greater than %d, not adding",  buf,  8u);
        BOOL v7 = 0;
      }

      goto LABEL_14;
    }

    id v16 = -[CommunicationsFilterBlockListStore _isItemInList:blockList:](self, "_isItemInList:blockList:", a3, v5);
    BOOL v7 = v16 == 0LL;
    if (v16)
    {
      int v17 = HIBYTE(v20);
      int v18 = v20;
    }

    else
    {
      -[NSMutableArray addObject:](v5, "addObject:", a3);
      ++v21;
      int v17 = 1;
      __int16 v20 = 257;
      int v18 = 1;
    }

    -[CommunicationsFilterBlockListStore _updateStore:revision:updateKVS:updateLocal:itemsNeedConversion:]( self,  "_updateStore:revision:updateKVS:updateLocal:itemsNeedConversion:",  v5,  v21,  v18 != 0,  v17 != 0,  1LL);
    -[CommunicationsFilterBlockListStore _stopSharingFocusStatusWithFilterItem:]( self,  "_stopSharingFocusStatusWithFilterItem:",  a3);
LABEL_13:
    sub_100004840(-[NSMutableArray count](v5, "count") == 0LL);
LABEL_14:

    return v7;
  }

  uint64_t v8 = (os_log_s *)sub_1000043A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
    sub_100005C44(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  return 0;
}

- (BOOL)removeItemForAllServices:(id)a3
{
  if (a3)
  {
    uint64_t v20 = 0LL;
    __int16 v19 = 0;
    -[CommunicationsFilterBlockListStore clearBlockList](self, "clearBlockList");
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    sub_100004B7C( -[CommunicationsFilterBlockListStore dataStore](self, "dataStore"),  v5,  0,  &v20,  (_BYTE *)&v19 + 1,  &v19);
    id v6 = -[CommunicationsFilterBlockListStore _isItemInList:blockList:](self, "_isItemInList:blockList:", a3, v5);
    BOOL v7 = v6 != 0LL;
    if (v6)
    {
      -[NSMutableArray removeObject:](v5, "removeObject:", v6);
      ++v20;
      int v8 = 1;
      __int16 v19 = 257;
      int v9 = 1;
    }

    else
    {
      int v8 = HIBYTE(v19);
      int v9 = v19;
      if (!(HIBYTE(v19) | v19))
      {
LABEL_9:
        sub_100004840(-[NSMutableArray count](v5, "count", v6) == 0LL);

        return v7;
      }
    }

    -[CommunicationsFilterBlockListStore _updateStore:revision:updateKVS:updateLocal:itemsNeedConversion:]( self,  "_updateStore:revision:updateKVS:updateLocal:itemsNeedConversion:",  v5,  v20,  v9 != 0,  v8 != 0,  1LL);
    goto LABEL_9;
  }

  uint64_t v10 = (os_log_s *)sub_1000043A0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    sub_100005C74(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  return 0;
}

- (id)copyAllItemsAsDictionaries
{
  return -[CommunicationsFilterBlockListStore _copyItems:](self, "_copyItems:", 1LL);
}

- (id)copyAllItems
{
  return -[CommunicationsFilterBlockListStore _copyItems:](self, "_copyItems:", 0LL);
}

- (id)_copyItems:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = 0LL;
  __int16 v7 = 0;
  -[CommunicationsFilterBlockListStore clearBlockList](self, "clearBlockList");
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  sub_100004B7C(-[CommunicationsFilterBlockListStore dataStore](self, "dataStore"), v5, v3, &v8, (_BYTE *)&v7 + 1, &v7);
  if (HIBYTE(v7) | v7) {
    -[CommunicationsFilterBlockListStore _updateStore:revision:updateKVS:updateLocal:itemsNeedConversion:]( self,  "_updateStore:revision:updateKVS:updateLocal:itemsNeedConversion:",  v5,  v8,  v7 != 0,  HIBYTE(v7) != 0,  !v3);
  }
  return v5;
}

- (id)_isItemInList:(id)a3 blockList:(id)a4
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0LL;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0LL;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(a4);
    }
    uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if (v7 == (id)++v9)
    {
      id v7 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (BOOL)isItemInList:(id)a3
{
  uint64_t v10 = 0LL;
  __int16 v9 = 0;
  if (!-[CommunicationsFilterBlockListStore cachedBlockList](self, "cachedBlockList"))
  {
    id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    sub_100004B7C( -[CommunicationsFilterBlockListStore dataStore](self, "dataStore"),  v5,  0,  &v10,  (_BYTE *)&v9 + 1,  &v9);
    -[CommunicationsFilterBlockListStore setCachedBlockList:](self, "setCachedBlockList:", v5);
  }

  id v6 = -[CommunicationsFilterBlockListStore _isItemInList:blockList:]( self,  "_isItemInList:blockList:",  a3,  -[CommunicationsFilterBlockListStore cachedBlockList](self, "cachedBlockList"));
  if (HIBYTE(v9) | v9)
  {
    id v7 = -[CommunicationsFilterBlockListStore cachedBlockList](self, "cachedBlockList");
    -[CommunicationsFilterBlockListStore _updateStore:revision:updateKVS:updateLocal:itemsNeedConversion:]( self,  "_updateStore:revision:updateKVS:updateLocal:itemsNeedConversion:",  v7,  v10,  v9,  HIBYTE(v9),  1LL);
  }

  return v6 != 0LL;
}

- (void)_updateStore:(id)a3 revision:(unint64_t)a4 updateKVS:(BOOL)a5 updateLocal:(BOOL)a6 itemsNeedConversion:(BOOL)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  id v10 = a3;
  if (a5 || a6)
  {
    if (a5 && a6)
    {
      if (a7)
      {
        __int128 v12 = +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [a3 count]);
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        id v13 = [v10 countByEnumeratingWithState:&v24 objects:buf count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v25;
          do
          {
            for (i = 0LL; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v25 != v15) {
                objc_enumerationMutation(v10);
              }
              -[NSMutableArray addObject:]( v12,  "addObject:",  [*(id *)(*((void *)&v24 + 1) + 8 * (void)i) dictionaryRepresentation]);
            }

            id v14 = [v10 countByEnumeratingWithState:&v24 objects:buf count:16];
          }

          while (v14);
        }

        id v10 = v12;
      }

      uint64_t v17 = +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL),  @"__kCMFBlockListStoreVersionKey",  v10,  @"__kCMFBlockListStoreArrayKey",  +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4),  @"__kCMFBlockListStoreRevisionKey",  +[NSDate date](&OBJC_CLASS___NSDate, "date"),  @"__kCMFBlockListStoreRevisionTimestampKey",  @"__kCMFBlockListStoreTypeValue",  @"__kCMFBlockListStoreTypeKey",  0LL);
    }

    else
    {
      uint64_t v17 = a5
          ? (NSDictionary *)IMGetAppValueForKey(@"__kCMFBlockListStoreTopLevelKey")
          : (NSDictionary *)-[CMFSyncAgentDataStore objectForKey:]( -[CommunicationsFilterBlockListStore dataStore](self, "dataStore", a3, a4, a5, a6, a7),  "objectForKey:",  @"__kCMFBlockListStoreTopLevelKey");
    }

    int v18 = v17;
    if (v17)
    {
      __int16 v19 = (os_log_s *)sub_1000043A0();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = sub_10000570C(v18);
        *(_DWORD *)buf = 138412802;
        v29 = v23;
        __int16 v30 = 1024;
        BOOL v31 = v8;
        __int16 v32 = 1024;
        BOOL v33 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "updating store to %@, updateKVS: %d, updateLocal: %d",  buf,  0x18u);
        if (!v8)
        {
LABEL_21:
          if (!v7) {
            goto LABEL_23;
          }
          goto LABEL_22;
        }
      }

      else if (!v8)
      {
        goto LABEL_21;
      }

      -[CMFSyncAgentDataStore setObject:forKey:]( -[CommunicationsFilterBlockListStore dataStore](self, "dataStore"),  "setObject:forKey:",  v18,  @"__kCMFBlockListStoreTopLevelKey");
      if (!v7)
      {
LABEL_23:
        uint64_t v21 = (os_log_s *)sub_1000043A0();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = sub_10000570C( -[CMFSyncAgentDataStore objectForKey:]( -[CommunicationsFilterBlockListStore dataStore](self, "dataStore"),  "objectForKey:",  @"__kCMFBlockListStoreTopLevelKey"));
          *(_DWORD *)buf = 138412802;
          v29 = v22;
          __int16 v30 = 1024;
          BOOL v31 = v8;
          __int16 v32 = 1024;
          BOOL v33 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "store after updating %@, updateKVS:%d, updateLocal:%d",  buf,  0x18u);
        }

        return;
      }

- (void)_stopSharingFocusStatusWithFilterItem:(id)a3
{
  id v3 = [a3 unformattedID];
  if ([v3 length])
  {
    BOOL v4 = (os_log_s *)sub_1000043A0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Asking StatusKit to remove sharing of focus status with handle %@",  (uint8_t *)&v7,  0xCu);
    }

    id v5 = (objc_class *)IMWeakLinkClass(@"SKHandle", @"StatusKit");
    id v6 = (objc_class *)IMWeakLinkClass(@"SKStatusPublishingService", @"StatusKit");
    objc_msgSend( objc_msgSend( [v6 alloc],  "initWithStatusTypeIdentifier:",  *(void *)IMWeakLinkSymbol("AKAvailabilityStatusTypeIdentifier", @"AvailabilityKit")),  "removeInvitedHandle:completion:",  objc_msgSend([v5 alloc], "initWithString:", v3),  &stru_100008458);
  }

- (void)handleNSUbiquitousKeyValueStoreDidChangeExternallyNotification:(id)a3
{
  id v5 = [a3 userInfo];
  if (!v5) {
    goto LABEL_7;
  }
  id v6 = [v5 objectForKeyedSubscript:NSUbiquitousKeyValueStoreChangeReasonKey];
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    id v8 = (os_log_s *)sub_1000043A0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100005D0C((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }
    goto LABEL_7;
  }

  if ([v6 integerValue] != (id)2)
  {
LABEL_7:
    uint64_t v15 = (dispatch_queue_s *)sub_100003B98();
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100005A38;
    v16[3] = &unk_100008480;
    v16[4] = self;
    v16[5] = a3;
    dispatch_async(v15, v16);
  }

- (CMFSyncAgentDataStore)dataStore
{
  return self->_dataStore;
}

- (NSMutableArray)cachedBlockList
{
  return self->_cachedBlockList;
}

- (void)setCachedBlockList:(id)a3
{
}

@end