@interface HHDBubbleManager
+ (id)bubbleManager;
- (BOOL)activateBubbleWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deleteBubbleWithIdentifier:(id)a3 error:(id *)a4;
- (HHDBubbleManager)init;
- (NSArray)bubbleList;
- (id)bubbleForIdentifier:(id)a3 error:(id *)a4;
- (id)createBubbleAndReturnError:(id *)a3;
- (id)reactivateBubbles;
- (void)bootstrapWithServiceRegistry:(id)a3;
- (void)deactivateBubbleWithIdentifier:(id)a3 callback:(id)a4;
- (void)deleteBubblesNotInList:(id)a3;
@end

@implementation HHDBubbleManager

- (HHDBubbleManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HHDBubbleManager;
  return -[HHDBubbleManager init](&v3, "init");
}

+ (id)bubbleManager
{
  return objc_alloc_init(&OBJC_CLASS___HHDBubbleManager);
}

- (void)bootstrapWithServiceRegistry:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!self->_bubbles)
  {
    v6 = (HHDPersistence *)objc_claimAutoreleasedReturnValue([v4 persistence]);
    persistence = self->_persistence;
    self->_persistence = v6;

    v8 = (HHDJobManagementService *)objc_claimAutoreleasedReturnValue([v5 jobManager]);
    jobManager = self->_jobManager;
    self->_jobManager = v8;

    v10 = self->_persistence;
    if (!v10)
    {
      id v11 = sub_10000B5F4();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v21 = 138412290;
        v22 = &stru_100024E50;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%@Error: Unable to load persistence layer.",  (uint8_t *)&v21,  0xCu);
      }

      v10 = self->_persistence;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HHDPersistence allBubbles](v10, "allBubbles"));
    v14 = v13;
    if (v13)
    {
      v15 = (NSMutableArray *)[v13 mutableCopy];
    }

    else
    {
      id v16 = sub_10000B5F4();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v21 = 138412290;
        v22 = &stru_100024E50;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%@Error: Persistence returned nil bubbles.",  (uint8_t *)&v21,  0xCu);
      }

      v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    }

    bubbles = self->_bubbles;
    self->_bubbles = v15;

    v19 = (HHDNotificationProxy *)objc_claimAutoreleasedReturnValue([v5 notificationProxy]);
    notificationProxy = self->_notificationProxy;
    self->_notificationProxy = v19;
  }
}

- (NSArray)bubbleList
{
  bubbles = self->_bubbles;
  if (bubbles) {
    return (NSArray *)-[NSMutableArray copy](bubbles, "copy");
  }
  else {
    return (NSArray *)&__NSArray0__struct;
  }
}

- (id)createBubbleAndReturnError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v6 = sub_10000B5F4();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    v12 = &stru_100024E50;
    __int16 v13 = 2114;
    v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@Creating bubble with identifier %{public}@.",  (uint8_t *)&v11,  0x16u);
  }

  v8 = -[HHDBubble initWithIdentifier:](objc_alloc(&OBJC_CLASS___HHDBubble), "initWithIdentifier:", v5);
  if (-[HHDPersistence saveBubble:error:](self->_persistence, "saveBubble:error:", v8, a3))
  {
    -[NSMutableArray addObject:](self->_bubbles, "addObject:", v8);
    v9 = v8;
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (BOOL)deleteBubbleWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HHDBubbleManager bubbleForIdentifier:error:](self, "bubbleForIdentifier:error:", v6, a4));
  if (v7)
  {
    if ((-[HHDPersistence removeBubble:](self->_persistence, "removeBubble:", v7) & 1) == 0)
    {
      id v8 = sub_10000B5F4();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412546;
        v14 = &stru_100024E50;
        __int16 v15 = 2114;
        id v16 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%@Warning: persistence failed to remove bubble with identifier %{public}@",  (uint8_t *)&v13,  0x16u);
      }
    }

    -[NSMutableArray removeObject:](self->_bubbles, "removeObject:", v7);
    id v10 = sub_10000B5F4();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      v14 = &stru_100024E50;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%@Deleting bubble with identifier %{public}@",  (uint8_t *)&v13,  0x16u);
    }
  }

  return v7 != 0LL;
}

- (BOOL)activateBubbleWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HHDBubbleManager bubbleForIdentifier:error:](self, "bubbleForIdentifier:error:", v6, a4));
  if (!v7)
  {
LABEL_9:
    BOOL v10 = 0;
    goto LABEL_10;
  }

  id v8 = sub_10000B5F4();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    __int16 v15 = &stru_100024E50;
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%@Activating bubble with identifier %{public}@",  (uint8_t *)&v14,  0x16u);
  }

  if ((-[HHDJobManagementService activateBubble:error:]( self->_jobManager,  "activateBubble:error:",  v7,  a4) & 1) == 0)
  {
    id v11 = sub_10000B5F4();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412546;
      __int16 v15 = &stru_100024E50;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%@Failed to activate bubble with identifier %{public}@",  (uint8_t *)&v14,  0x16u);
    }

    goto LABEL_9;
  }

  [v7 setState:2];
  BOOL v10 = 1;
LABEL_10:

  return v10;
}

- (void)deactivateBubbleWithIdentifier:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v18 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[HHDBubbleManager bubbleForIdentifier:error:](self, "bubbleForIdentifier:error:", v6, &v18));
  id v9 = v18;
  id v10 = sub_10000B5F4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v20 = &stru_100024E50;
      __int16 v21 = 2114;
      id v22 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%@Deactivating bubble with identifier %{public}@",  buf,  0x16u);
    }

    jobManager = self->_jobManager;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10000BC78;
    v14[3] = &unk_100024990;
    id v15 = v6;
    id v16 = v8;
    id v17 = v7;
    -[HHDJobManagementService deactivateBubble:callback:](jobManager, "deactivateBubble:callback:", v16, v14);
  }

  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = &stru_100024E50;
      __int16 v21 = 2114;
      id v22 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@Deactivation failed for bubble with identifier %{public}@ (bubble not found)",  buf,  0x16u);
    }

    (*((void (**)(id, id))v7 + 2))(v7, v9);
  }
}

- (id)bubbleForIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v7 = self->_bubbles;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v19,  v27,  16LL);
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier", (void)v19));
        unsigned int v13 = [v12 isEqual:v6];

        if (v13)
        {
          id v8 = v11;
          id v14 = sub_10000B5F4();
          id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v24 = &stru_100024E50;
            __int16 v25 = 2114;
            id v26 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%@Found bubble with identifier %{public}@",  buf,  0x16u);
          }

          goto LABEL_13;
        }
      }

      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v19,  v27,  16LL);
      if (v8) {
        continue;
      }
      break;
    }
  }

- (id)reactivateBubbles
{
  bubbles = self->_bubbles;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &stru_1000249D0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray filteredArrayUsingPredicate:](bubbles, "filteredArrayUsingPredicate:", v4));

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[HHDJobManagementService resumeBubbles:](self->_jobManager, "resumeBubbles:", v5));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) setState:1];
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }

  return v6;
}

- (void)deleteBubblesNotInList:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableArray copy](self->_bubbles, "copy");
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v26;
    *(void *)&__int128 v8 = 138412546LL;
    __int128 v23 = v8;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v6);
        }
        __int128 v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier", v23));
        unsigned __int8 v14 = [v4 containsObject:v13];

        if ((v14 & 1) == 0)
        {
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
          id v24 = 0LL;
          unsigned int v16 = -[HHDBubbleManager deleteBubbleWithIdentifier:error:]( self,  "deleteBubbleWithIdentifier:error:",  v15,  &v24);
          id v17 = v24;
          id v18 = sub_10000B5F4();
          __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
          if (v16)
          {
            if (v20)
            {
              *(_DWORD *)buf = v23;
              v30 = &stru_100024E50;
              __int16 v31 = 2114;
              v32 = v15;
              __int128 v21 = v19;
              __int128 v22 = "%@Deleted orphaned bubble with id %{public}@";
              goto LABEL_12;
            }
          }

          else if (v20)
          {
            *(_DWORD *)buf = v23;
            v30 = &stru_100024E50;
            __int16 v31 = 2114;
            v32 = v15;
            __int128 v21 = v19;
            __int128 v22 = "%@Failed to delete orphaned bubble with id %{public}@";
LABEL_12:
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v22, buf, 0x16u);
          }

          continue;
        }
      }

      id v9 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }

    while (v9);
  }
}

- (void).cxx_destruct
{
}

@end