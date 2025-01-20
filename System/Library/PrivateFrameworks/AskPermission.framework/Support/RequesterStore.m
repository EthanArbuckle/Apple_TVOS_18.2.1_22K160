@interface RequesterStore
+ (RequesterStore)sharedStore;
- (BOOL)containsRequestWithIdentifier:(id)a3;
- (NSMutableDictionary)itemIdentifierStore;
- (NSMutableDictionary)requestIdentifierStore;
- (NSMutableDictionary)requestItems;
- (OS_dispatch_queue)accessQueue;
- (RequestStore)requestStore;
- (RequesterStore)init;
- (id)_migrationItems;
- (id)_requesterRequestWithStoreItem:(id)a3;
- (id)requestIdentifierWithItemIdentifier:(id)a3;
- (id)requestWithIdentifier:(id)a3;
- (id)requestsMatchingUniqueIdentifier:(id)a3;
- (void)_loadItemsIntoMemory;
- (void)_saveChanges;
- (void)clearExpiredRequests;
- (void)clearRequests;
- (void)storeRequest:(id)a3;
@end

@implementation RequesterStore

- (RequesterStore)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___RequesterStore;
  v2 = -[RequesterStore init](&v15, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.AskPermission.RequesterStore", 0LL);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    itemIdentifierStore = v2->_itemIdentifierStore;
    v2->_itemIdentifierStore = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    requestIdentifierStore = v2->_requestIdentifierStore;
    v2->_requestIdentifierStore = v7;

    v9 = -[RequestStore initWithFileName:]( objc_alloc(&OBJC_CLASS___RequestStore),  "initWithFileName:",  @"UniqueRequestStore.plist");
    requestStore = v2->_requestStore;
    v2->_requestStore = v9;

    v11 = (dispatch_queue_s *)v2->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100013394;
    block[3] = &unk_100030588;
    v14 = v2;
    dispatch_sync(v11, block);
  }

  return v2;
}

+ (RequesterStore)sharedStore
{
  if (qword_10003A9C8 != -1) {
    dispatch_once(&qword_10003A9C8, &stru_100030AB8);
  }
  return (RequesterStore *)(id)qword_10003A9D0;
}

- (void)clearExpiredRequests
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = (id)objc_opt_class(self);
    id v5 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Clearing expired requests",  buf,  0xCu);
  }

  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RequesterStore accessQueue](self, "accessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001353C;
  block[3] = &unk_100030588;
  void block[4] = self;
  dispatch_sync(v6, block);
}

- (void)clearRequests
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = (id)objc_opt_class(self);
    id v5 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Clearing requests", buf, 0xCu);
  }

  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RequesterStore accessQueue](self, "accessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100013894;
  block[3] = &unk_100030588;
  void block[4] = self;
  dispatch_sync(v6, block);
}

- (BOOL)containsRequestWithIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterStore requestItems](self, "requestItems", 0LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);

  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = 0LL;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 requestIdentifier]);
        unsigned int v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          if (v8)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue([v11 createdDate]);
            objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v8 createdDate]);
            id v16 = [v14 compare:v15];

            if (v16 == (id)1)
            {
              id v17 = v11;

              id v8 = v17;
            }
          }

          else
          {
            id v8 = v11;
          }
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v7);

    if (!v8)
    {
      LOBYTE(v7) = 0;
      goto LABEL_17;
    }

    id v7 = (id)objc_claimAutoreleasedReturnValue([v8 createdDate]);
    unsigned __int8 v18 = +[NSDate isDateExpired:](&OBJC_CLASS___NSDate, "isDateExpired:", v7);

    LOBYTE(v7) = v18 ^ 1;
    v6 = v8;
  }

LABEL_17:
  return (char)v7;
}

- (id)requestIdentifierWithItemIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterStore requestItems](self, "requestItems", 0LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);

  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v7)
  {

    id v9 = 0LL;
LABEL_17:
    __int128 v21 = 0LL;
    goto LABEL_18;
  }

  id v8 = v7;
  id v9 = 0LL;
  uint64_t v10 = *(void *)v24;
  do
  {
    for (i = 0LL; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v24 != v10) {
        objc_enumerationMutation(v6);
      }
      v12 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 itemIdentifier]);
      unsigned int v14 = [v13 isEqualToString:v4];

      if (v14)
      {
        if (v9)
        {
          objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v12 createdDate]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 createdDate]);
          id v17 = [v15 compare:v16];

          if (v17 == (id)1)
          {
            id v18 = v12;

            id v9 = v18;
          }
        }

        else
        {
          id v9 = v12;
        }
      }
    }

    id v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }

  while (v8);

  if (!v9) {
    goto LABEL_17;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue([v9 createdDate]);
  unsigned __int8 v20 = +[NSDate isDateExpired:](&OBJC_CLASS___NSDate, "isDateExpired:", v19);

  if ((v20 & 1) != 0) {
    goto LABEL_17;
  }
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v9 requestIdentifier]);
LABEL_18:

  return v21;
}

- (id)requestWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterStore requestItems](self, "requestItems"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  if (v6) {
    goto LABEL_2;
  }
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterStore requestItems](self, "requestItems"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allValues]);

  id v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v12)
  {

    id v6 = 0LL;
    goto LABEL_21;
  }

  id v13 = v12;
  __int128 v25 = self;
  id v6 = 0LL;
  uint64_t v14 = *(void *)v27;
  do
  {
    for (i = 0LL; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v27 != v14) {
        objc_enumerationMutation(v11);
      }
      id v16 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 requestIdentifier]);
      if ([v17 isEqualToString:v4])
      {
      }

      else
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueIdentifier]);
        unsigned int v19 = [v18 isEqualToString:v4];

        if (!v19) {
          continue;
        }
      }

      if (v6)
      {
        unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v16 createdDate]);
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v6 createdDate]);
        id v22 = [v20 compare:v21];

        if (v22 == (id)1)
        {
          id v23 = v16;

          id v6 = v23;
        }
      }

      else
      {
        id v6 = v16;
      }
    }

    id v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  }

  while (v13);

  self = v25;
  if (!v6)
  {
LABEL_21:
    id v9 = 0LL;
    goto LABEL_22;
  }

- (id)requestsMatchingUniqueIdentifier:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterStore requestWithIdentifier:](self, "requestWithIdentifier:", a3));
  __int128 v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v22 = self;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterStore requestItems](self, "requestItems"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);

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
        v11 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 requestIdentifier]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 requestIdentifier]);
        unsigned int v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v11 createdDate]);
          unsigned __int8 v16 = +[NSDate isDateExpired:](&OBJC_CLASS___NSDate, "isDateExpired:", v15);

          if ((v16 & 1) == 0)
          {
            id v17 = (void *)objc_claimAutoreleasedReturnValue( -[RequesterStore _requesterRequestWithStoreItem:]( v22,  "_requesterRequestWithStoreItem:",  v11));
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

  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v21));
  return v19;
}

- (void)storeRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = (id)objc_opt_class(self);
    __int16 v15 = 2114;
    id v16 = v4;
    id v7 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Storing request: %{public}@",  buf,  0x16u);
  }

  id v8 = -[RequestStoreItem initWithRequest:](objc_alloc(&OBJC_CLASS___RequestStoreItem), "initWithRequest:", v4);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem uniqueIdentifier](v8, "uniqueIdentifier"));

  if (v9)
  {
    accessQueue = (dispatch_queue_s *)self->_accessQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000142B8;
    v11[3] = &unk_1000305D8;
    v11[4] = self;
    id v12 = v8;
    dispatch_sync(accessQueue, v11);
  }
}

- (id)_requesterRequestWithStoreItem:(id)a3
{
  id v3 = a3;
  id v4 = -[ApprovalRequest initWithRequestStorageItem:]( objc_alloc(&OBJC_CLASS___ApprovalRequest),  "initWithRequestStorageItem:",  v3);

  return v4;
}

- (void)_saveChanges
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RequesterStore accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterStore requestItems](self, "requestItems", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterStore requestItems](self, "requestItems"));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v11]);

        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 compile]);
        if (v14) {
          -[NSMutableArray addObject:](v4, "addObject:", v14);
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterStore requestStore](self, "requestStore"));
  [v15 storeItems:v4];
}

- (void)_loadItemsIntoMemory
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RequesterStore accessQueue](self, "accessQueue"));
  dispatch_assert_queue_V2(v3);

  __int128 v29 = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterStore requestStore](self, "requestStore"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 items]);

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
        id v12 = -[RequestStoreItem initWithDictionary:]( objc_alloc(&OBJC_CLASS___RequestStoreItem),  "initWithDictionary:",  *(void *)(*((void *)&v34 + 1) + 8LL * (void)i));
        id v13 = v12;
        if (v12)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem createdDate](v12, "createdDate"));
          unsigned __int8 v15 = +[NSDate isDateExpired:](&OBJC_CLASS___NSDate, "isDateExpired:", v14);

          if ((v15 & 1) == 0)
          {
            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem modifiedDate](v13, "modifiedDate"));
            unsigned int v17 = +[NSDate isDateInFuture:](&OBJC_CLASS___NSDate, "isDateInFuture:", v16);

            if (v17)
            {
              __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
              -[RequestStoreItem setModifiedDate:](v13, "setModifiedDate:", v18);
            }

            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem uniqueIdentifier](v13, "uniqueIdentifier"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v13, v19);
          }
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }

    while (v9);
  }

  unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterStore _migrationItems](v29, "_migrationItems"));
  if ([v20 count])
  {
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 allKeys]);
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
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v26]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v27, v26);
        }

        id v23 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }

      while (v23);
    }
  }

  requestItems = v29->_requestItems;
  v29->_requestItems = v6;
}

- (id)_migrationItems
{
  uint64_t v24 = -[RequestStore initWithFileName:]( objc_alloc(&OBJC_CLASS___RequestStore),  "initWithFileName:",  @"RequestStore.plist");
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStore items](v24, "items"));
  __int128 v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
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
        id v8 = -[RequestStoreItem initWithDictionary:]( objc_alloc(&OBJC_CLASS___RequestStoreItem),  "initWithDictionary:",  *(void *)(*((void *)&v26 + 1) + 8LL * (void)i));
        id v9 = v8;
        if (v8)
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem createdDate](v8, "createdDate"));
          unsigned __int8 v11 = +[NSDate isDateExpired:](&OBJC_CLASS___NSDate, "isDateExpired:", v10);

          if ((v11 & 1) == 0)
          {
            id v12 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem modifiedDate](v9, "modifiedDate"));
            unsigned int v13 = +[NSDate isDateInFuture:](&OBJC_CLASS___NSDate, "isDateInFuture:", v12);

            if (v13)
            {
              id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
              -[RequestStoreItem setModifiedDate:](v9, "setModifiedDate:", v14);
            }

            uint64_t v15 = objc_claimAutoreleasedReturnValue(-[RequestStoreItem uniqueIdentifier](v9, "uniqueIdentifier"));
            if (!v15
              || (__int128 v16 = (void *)v15,
                  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem uniqueIdentifier](v9, "uniqueIdentifier")),
                  id v18 = [v17 length],
                  v17,
                  v16,
                  !v18))
            {
              __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem requestIdentifier](v9, "requestIdentifier"));
              unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem createdDate](v9, "createdDate"));
              __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[ApprovalRequest createUniqueIDFromRequestID:andCreatedDate:]( &OBJC_CLASS___ApprovalRequest,  "createUniqueIDFromRequestID:andCreatedDate:",  v19,  v20));
              -[RequestStoreItem setUniqueIdentifier:](v9, "setUniqueIdentifier:", v21);
            }

            id v22 = (void *)objc_claimAutoreleasedReturnValue(-[RequestStoreItem uniqueIdentifier](v9, "uniqueIdentifier"));
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

- (NSMutableDictionary)itemIdentifierStore
{
  return self->_itemIdentifierStore;
}

- (NSMutableDictionary)requestIdentifierStore
{
  return self->_requestIdentifierStore;
}

- (NSMutableDictionary)requestItems
{
  return self->_requestItems;
}

- (RequestStore)requestStore
{
  return self->_requestStore;
}

- (void).cxx_destruct
{
}

@end