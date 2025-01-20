@interface ApproverStore
+ (ApproverStore)inMemoryStore;
+ (ApproverStore)sharedStore;
- (ApproverStore)init;
- (ApproverStore)initWithInMemoryStore:(BOOL)a3;
- (BOOL)containsApprovalRequestWithIdentifier:(id)a3;
- (NSMutableDictionary)approverStoreItems;
- (OS_dispatch_queue)accessQueue;
- (RequestStore)requestStore;
- (id)_approvalRequestWithStoreItem:(id)a3;
- (id)_migrationItems;
- (id)approvalRequestIdentifierWithItemIdentifier:(id)a3;
- (id)approvalRequestWithRequestIdentifier:(id)a3;
- (id)approvalRequestWithUniqueIdentifier:(id)a3;
- (id)approvalRequestsMatchingUniqueIdentifier:(id)a3;
- (id)getCachedApprovalRequests;
- (void)_loadItemsIntoMemory;
- (void)_saveChanges;
- (void)clearRequests;
- (void)removeApprovalRequestWithIdentifier:(id)a3;
- (void)setApproverStoreItems:(id)a3;
- (void)storeApprovalRequest:(id)a3;
@end

@implementation ApproverStore

- (ApproverStore)init
{
  return -[ApproverStore initWithInMemoryStore:](self, "initWithInMemoryStore:", 0LL);
}

- (ApproverStore)initWithInMemoryStore:(BOOL)a3
{
  BOOL v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ApproverStore;
  v4 = -[ApproverStore init](&v14, "init");
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.AskPermission.ApproverStore", 0LL);
    accessQueue = v4->_accessQueue;
    v4->_accessQueue = (OS_dispatch_queue *)v5;

    if (v3)
    {
      v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[ApproverStore setApproverStoreItems:](v4, "setApproverStoreItems:", v7);
    }

    else
    {
      v8 = -[RequestStore initWithFileName:]( objc_alloc(&OBJC_CLASS___RequestStore),  "initWithFileName:",  @"UniqueApproverStore.plist");
      requestStore = v4->_requestStore;
      v4->_requestStore = v8;

      v10 = (dispatch_queue_s *)v4->_accessQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100003D5C;
      block[3] = &unk_100030588;
      v13 = v4;
      dispatch_sync(v10, block);
      v7 = v13;
    }
  }

  return v4;
}

- (NSMutableDictionary)approverStoreItems
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ApproverStore accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  v11 = sub_100003E5C;
  v12 = sub_100003E6C;
  id v13 = 0LL;
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ApproverStore accessQueue](self, "accessQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100003E74;
  v7[3] = &unk_1000305B0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSMutableDictionary *)v5;
}

- (void)setApproverStoreItems:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ApproverStore accessQueue](self, "accessQueue"));
  dispatch_assert_queue_not_V2(v5);

  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ApproverStore accessQueue](self, "accessQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100003F38;
  v8[3] = &unk_1000305D8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

+ (ApproverStore)inMemoryStore
{
  if (qword_10003A958 != -1) {
    dispatch_once(&qword_10003A958, &stru_100030618);
  }
  return (ApproverStore *)(id)qword_10003A960;
}

+ (ApproverStore)sharedStore
{
  if (qword_10003A968 != -1) {
    dispatch_once(&qword_10003A968, &stru_100030638);
  }
  return (ApproverStore *)(id)qword_10003A970;
}

- (void)clearRequests
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = (id)objc_opt_class(self);
    id v5 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Clearing requests", buf, 0xCu);
  }

  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ApproverStore accessQueue](self, "accessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004154;
  block[3] = &unk_100030588;
  void block[4] = self;
  dispatch_async(v6, block);
}

- (BOOL)containsApprovalRequestWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[ApproverStore approverStoreItems](self, "approverStoreItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([(id)v5 objectForKeyedSubscript:v4]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 createdDate]);
  LOBYTE(v5) = +[NSDate isDateExpired:](&OBJC_CLASS___NSDate, "isDateExpired:", v7);

  return v5 ^ 1;
}

- (void)removeApprovalRequestWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = (id)objc_opt_class(self);
    __int16 v14 = 2114;
    id v15 = v4;
    id v7 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Removing request. Request identifier: %{public}@",  buf,  0x16u);
  }

  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ApproverStore accessQueue](self, "accessQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100004394;
  v10[3] = &unk_1000305D8;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);
}

- (id)approvalRequestIdentifierWithItemIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStore approverStoreItems](self, "approverStoreItems", 0LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 itemIdentifier]);
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 createdDate]);
          unsigned __int8 v14 = +[NSDate isDateExpired:](&OBJC_CLASS___NSDate, "isDateExpired:", v13);

          if ((v14 & 1) != 0) {
            id v7 = 0LL;
          }
          else {
            id v7 = (id)objc_claimAutoreleasedReturnValue([v10 requestIdentifier]);
          }
          goto LABEL_13;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)approvalRequestWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStore approverStoreItems](self, "approverStoreItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 createdDate]);
    unsigned int v8 = +[NSDate isDateExpired:](&OBJC_CLASS___NSDate, "isDateExpired:", v7);

    if (!v8)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStore _approvalRequestWithStoreItem:](self, "_approvalRequestWithStoreItem:", v6));
      goto LABEL_13;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v9) {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_opt_class(self);
      id v12 = v11;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 createdDate]);
      int v17 = 138543618;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Request Item Expired - %@",  (uint8_t *)&v17,  0x16u);
    }
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v9) {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543618;
      id v18 = (id)objc_opt_class(self);
      __int16 v19 = 2112;
      id v20 = v4;
      id v14 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Error finding request - %@",  (uint8_t *)&v17,  0x16u);
    }
  }

  id v15 = 0LL;
LABEL_13:

  return v15;
}

- (id)approvalRequestsMatchingUniqueIdentifier:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStore approvalRequestWithUniqueIdentifier:](self, "approvalRequestWithUniqueIdentifier:", a3));
  v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v22 = self;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStore approverStoreItems](self, "approverStoreItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);

  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 requestIdentifier]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 requestIdentifier]);
        unsigned int v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 createdDate]);
          unsigned __int8 v16 = +[NSDate isDateExpired:](&OBJC_CLASS___NSDate, "isDateExpired:", v15);

          if ((v16 & 1) == 0)
          {
            int v17 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStore _approvalRequestWithStoreItem:](v22, "_approvalRequestWithStoreItem:", v11));
            id v18 = v17;
            if (v17 && [v17 status] == (id)-1) {
              -[NSMutableArray addObject:](v21, "addObject:", v18);
            }
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v8);
  }

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v21));
  return v19;
}

- (id)approvalRequestWithRequestIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsSeparatedByString:@"_"]);
    if ([v5 count] == (id)2)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
      v31 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
    }

    else
    {
      v31 = 0LL;
      v6 = 0LL;
    }

    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStore approverStoreItems](self, "approverStoreItems"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allValues]);

    id v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v10)
    {
      id v11 = v10;
      v28 = v5;
      v30 = 0LL;
      uint64_t v12 = *(void *)v33;
      while (2)
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v9);
          }
          unsigned int v14 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
          id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "createdDate", v28));
          unsigned __int8 v16 = +[NSDate isDateExpired:](&OBJC_CLASS___NSDate, "isDateExpired:", v15);

          if ((v16 & 1) == 0)
          {
            int v17 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueIdentifier]);
            unsigned __int8 v18 = [v17 isEqualToString:v4];

            if ((v18 & 1) != 0)
            {
              id v7 = (void *)objc_claimAutoreleasedReturnValue( -[ApproverStore _approvalRequestWithStoreItem:]( self,  "_approvalRequestWithStoreItem:",  v14));

              uint64_t v9 = v30;
              uint64_t v5 = v28;
              goto LABEL_24;
            }

            __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v14 requestIdentifier]);
            unsigned int v20 = [v19 isEqualToString:v31];

            if (v20) {
              BOOL v21 = v6 == 0LL;
            }
            else {
              BOOL v21 = 1;
            }
            if (!v21)
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue([v14 createdDate]);
              [v22 timeIntervalSinceReferenceDate];
              double v24 = v23;

              [v6 doubleValue];
              if ((uint64_t)vabdd_f64(v24, v25) <= 5)
              {
                uint64_t v26 = objc_claimAutoreleasedReturnValue(-[ApproverStore _approvalRequestWithStoreItem:](self, "_approvalRequestWithStoreItem:", v14));

                v30 = (void *)v26;
              }
            }
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v11) {
          continue;
        }
        break;
      }

      uint64_t v5 = v28;
      id v7 = v30;
    }

    else
    {
      id v7 = 0LL;
    }

- (id)getCachedApprovalRequests
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStore approverStoreItems](self, "approverStoreItems"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100004CC4;
  v7[3] = &unk_100030660;
  v7[4] = self;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_mapWithTransformIgnoresNil:", v7));

  return v5;
}

- (void)storeApprovalRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ApproverStore accessQueue](self, "accessQueue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100004E30;
    v9[3] = &unk_1000305D8;
    v9[4] = self;
    id v10 = v4;
    dispatch_async(v5, v9);
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = (id)objc_opt_class(self);
      id v8 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}@: Error storing request. The request is missing!",  buf,  0xCu);
    }
  }
}

- (id)_approvalRequestWithStoreItem:(id)a3
{
  id v3 = a3;
  id v4 = -[ApprovalRequest initWithApproverStorageItem:]( objc_alloc(&OBJC_CLASS___ApprovalRequest),  "initWithApproverStorageItem:",  v3);

  return v4;
}

- (void)_saveChanges
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ApproverStore accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_approverStoreItems, "allValues", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) compile]);
        if (v10) {
          -[NSMutableArray addObject:](v4, "addObject:", v10);
        }

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStore requestStore](self, "requestStore"));
  [v11 storeItems:v4];
}

- (void)_loadItemsIntoMemory
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ApproverStore accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  v29 = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStore requestStore](self, "requestStore"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 items]);

  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v7);
        }
        __int128 v12 = -[ApproverStoreItem initWithDictionary:]( objc_alloc(&OBJC_CLASS___ApproverStoreItem),  "initWithDictionary:",  *(void *)(*((void *)&v34 + 1) + 8LL * (void)i));
        __int128 v13 = v12;
        if (v12)
        {
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem createdDate](v12, "createdDate"));
          unsigned __int8 v15 = +[NSDate isDateExpired:](&OBJC_CLASS___NSDate, "isDateExpired:", v14);

          if ((v15 & 1) == 0)
          {
            unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem modifiedDate](v13, "modifiedDate"));
            unsigned int v17 = +[NSDate isDateInFuture:](&OBJC_CLASS___NSDate, "isDateInFuture:", v16);

            if (v17)
            {
              unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
              -[ApproverStoreItem setModifiedDate:](v13, "setModifiedDate:", v18);
            }

            __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem uniqueIdentifier](v13, "uniqueIdentifier"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v13, v19);
          }
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }

    while (v9);
  }

  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStore _migrationItems](v29, "_migrationItems"));
  if ([v20 count])
  {
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v20 allKeys]);
    id v22 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v31;
      do
      {
        for (j = 0LL; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)j);
          v27 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v26]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v27, v26);
        }

        id v23 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }

      while (v23);
    }
  }

  approverStoreItems = v29->_approverStoreItems;
  v29->_approverStoreItems = v6;
}

- (id)_migrationItems
{
  uint64_t v24 = -[RequestStore initWithFileName:]( objc_alloc(&OBJC_CLASS___RequestStore),  "initWithFileName:",  @"ApproverStore.plist");
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStore items](v24, "items"));
  double v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v3 = v2;
  id v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = -[ApproverStoreItem initWithDictionary:]( objc_alloc(&OBJC_CLASS___ApproverStoreItem),  "initWithDictionary:",  *(void *)(*((void *)&v26 + 1) + 8LL * (void)i));
        id v9 = v8;
        if (v8)
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem createdDate](v8, "createdDate"));
          unsigned __int8 v11 = +[NSDate isDateExpired:](&OBJC_CLASS___NSDate, "isDateExpired:", v10);

          if ((v11 & 1) == 0)
          {
            __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem modifiedDate](v9, "modifiedDate"));
            unsigned int v13 = +[NSDate isDateInFuture:](&OBJC_CLASS___NSDate, "isDateInFuture:", v12);

            if (v13)
            {
              __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
              -[ApproverStoreItem setModifiedDate:](v9, "setModifiedDate:", v14);
            }

            uint64_t v15 = objc_claimAutoreleasedReturnValue(-[ApproverStoreItem uniqueIdentifier](v9, "uniqueIdentifier"));
            if (!v15
              || (unsigned __int8 v16 = (void *)v15,
                  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem uniqueIdentifier](v9, "uniqueIdentifier")),
                  id v18 = [v17 length],
                  v17,
                  v16,
                  !v18))
            {
              __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem requestIdentifier](v9, "requestIdentifier"));
              unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem createdDate](v9, "createdDate"));
              BOOL v21 = (void *)objc_claimAutoreleasedReturnValue( +[ApprovalRequest createUniqueIDFromRequestID:andCreatedDate:]( &OBJC_CLASS___ApprovalRequest,  "createUniqueIDFromRequestID:andCreatedDate:",  v19,  v20));
              -[ApproverStoreItem setUniqueIdentifier:](v9, "setUniqueIdentifier:", v21);
            }

            id v22 = (void *)objc_claimAutoreleasedReturnValue(-[ApproverStoreItem uniqueIdentifier](v9, "uniqueIdentifier"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v9, v22);
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v5);
  }

  if (-[NSMutableDictionary count](v25, "count")) {
    -[RequestStore clearCache](v24, "clearCache");
  }

  return v25;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (RequestStore)requestStore
{
  return self->_requestStore;
}

- (void).cxx_destruct
{
}

@end