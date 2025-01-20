@interface FTConversationServiceConnectionManager
- (FTConversationServiceConnectionManager)initWithDataSource:(id)a3;
- (FTPersistentDataSource)dataSource;
- (NSMutableSet)connections;
- (os_unfair_lock_s)accessorLock;
- (void)addConnection:(id)a3;
- (void)addConversationLinkDescriptors:(id)a3 reply:(id)a4;
- (void)addOrUpdateConversationLinkDescriptors:(id)a3 reply:(id)a4;
- (void)conversationLinkDescriptorCountWithPredicate:(id)a3 reply:(id)a4;
- (void)conversationLinkDescriptorsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 reply:(id)a6;
- (void)integerForKey:(id)a3 reply:(id)a4;
- (void)removeConnection:(id)a3;
- (void)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 reply:(id)a5;
- (void)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 reply:(id)a4;
- (void)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6;
- (void)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6;
- (void)setInteger:(int64_t)a3 forKey:(id)a4 reply:(id)a5;
- (void)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6;
- (void)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6;
- (void)setString:(id)a3 forKey:(id)a4 reply:(id)a5;
- (void)stringForKey:(id)a3 reply:(id)a4;
@end

@implementation FTConversationServiceConnectionManager

- (FTConversationServiceConnectionManager)initWithDataSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___FTConversationServiceConnectionManager;
  v6 = -[FTConversationServiceConnectionManager init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    v6->_accessorLock._os_unfair_lock_opaque = 0;
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    connections = v7->_connections;
    v7->_connections = v8;

    objc_storeStrong((id *)&v7->_dataSource, a3);
  }

  return v7;
}

- (void)addConnection:(id)a3
{
  id v8 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  [v8 setDelegate:self];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnectionManager connections](self, "connections"));
  [v5 addObject:v8];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnectionManager dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v8 queue]);
  [v6 addDelegate:v8 queue:v7];

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)removeConnection:(id)a3
{
  id v8 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v5 = (FTConversationServiceConnectionManager *)objc_claimAutoreleasedReturnValue([v8 delegate]);

  if (v5 == self) {
    [v8 setDelegate:0];
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnectionManager connections](self, "connections"));
  [v6 removeObject:v8];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnectionManager dataSource](self, "dataSource"));
  [v7 removeDelegate:v8];

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)addConversationLinkDescriptors:(id)a3 reply:(id)a4
{
  v6 = (void (**)(id, id, void *))a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnectionManager dataSource](self, "dataSource"));
  id v14 = 0LL;
  id v9 = [v8 addConversationLinkDescriptors:v7 error:&v14];

  id v10 = v14;
  if ((v9 & 1) == 0 && v10)
  {
    uint64_t v11 = FTCServiceLog();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000CACC();
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 conversationServiceDataSourceError]);
  v6[2](v6, v9, v13);
}

- (void)addOrUpdateConversationLinkDescriptors:(id)a3 reply:(id)a4
{
  v6 = (void (**)(id, id, void *))a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnectionManager dataSource](self, "dataSource"));
  id v14 = 0LL;
  id v9 = [v8 addOrUpdateConversationLinkDescriptors:v7 error:&v14];

  id v10 = v14;
  if ((v9 & 1) == 0 && v10)
  {
    uint64_t v11 = FTCServiceLog();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000CB2C();
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 conversationServiceDataSourceError]);
  v6[2](v6, v9, v13);
}

- (void)conversationLinkDescriptorCountWithPredicate:(id)a3 reply:(id)a4
{
  v6 = (void (**)(id, id, void *))a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnectionManager dataSource](self, "dataSource"));
  id v14 = 0LL;
  id v9 = [v8 conversationLinkDescriptorCountWithPredicate:v7 error:&v14];

  id v10 = v14;
  if (!v9 && v10)
  {
    uint64_t v11 = FTCServiceLog();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000CB8C();
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 conversationServiceDataSourceError]);
  v6[2](v6, v9, v13);
}

- (void)conversationLinkDescriptorsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 reply:(id)a6
{
  id v10 = (void (**)(id, void *, void *))a6;
  id v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnectionManager dataSource](self, "dataSource"));
  id v18 = 0LL;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 conversationLinkDescriptorsWithPredicate:v11 limit:a4 offset:a5 error:&v18]);

  id v14 = v18;
  if (!v13 && v14)
  {
    uint64_t v15 = FTCServiceLog();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10000CBEC();
    }
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v14 conversationServiceDataSourceError]);
  v10[2](v10, v13, v17);
}

- (void)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 reply:(id)a5
{
  id v8 = (void (**)(id, id, void *))a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnectionManager dataSource](self, "dataSource"));
  id v16 = 0LL;
  id v11 = [v10 removeConversationLinkDescriptorsWithPredicate:v9 deleteReason:a4 error:&v16];

  id v12 = v16;
  if (!v11 && v12)
  {
    uint64_t v13 = FTCServiceLog();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000CC4C();
    }
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 conversationServiceDataSourceError]);
  v8[2](v8, v11, v15);
}

- (void)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 reply:(id)a4
{
  v6 = (void (**)(id, id, void *))a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnectionManager dataSource](self, "dataSource"));
  id v14 = 0LL;
  id v9 = [v8 removeLinkDescriptorsFromDataSourceWithPredicate:v7 error:&v14];

  id v10 = v14;
  if (!v9 && v10)
  {
    uint64_t v11 = FTCServiceLog();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000CCAC();
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 conversationServiceDataSourceError]);
  v6[2](v6, v9, v13);
}

- (void)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6
{
  BOOL v8 = a3;
  id v10 = (void (**)(id, id, void *))a6;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnectionManager dataSource](self, "dataSource"));
  id v18 = 0LL;
  id v13 = [v12 setActivated:v8 withRevision:a4 forConversationLinkDescriptorsWithPredicate:v11 error:&v18];

  id v14 = v18;
  if (!v13 && v14)
  {
    uint64_t v15 = FTCServiceLog();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10000CD0C();
    }
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v14 conversationServiceDataSourceError]);
  v10[2](v10, v13, v17);
}

- (void)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6
{
  id v10 = (void (**)(id, id, void *))a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnectionManager dataSource](self, "dataSource"));
  id v19 = 0LL;
  id v14 = [v13 setExpirationDate:v12 withRevision:a4 forConversationLinkDescriptorsWithPredicate:v11 error:&v19];

  id v15 = v19;
  if (!v14 && v15)
  {
    uint64_t v16 = FTCServiceLog();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10000CD0C();
    }
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 conversationServiceDataSourceError]);
  v10[2](v10, v14, v18);
}

- (void)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6
{
  id v10 = (void (**)(id, id, void *))a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnectionManager dataSource](self, "dataSource"));
  id v19 = 0LL;
  id v14 = [v13 setInvitedHandles:v12 withRevision:a4 forConversationLinkDescriptorsWithPredicate:v11 error:&v19];

  id v15 = v19;
  if (!v14 && v15)
  {
    uint64_t v16 = FTCServiceLog();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10000CD0C();
    }
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 conversationServiceDataSourceError]);
  v10[2](v10, v14, v18);
}

- (void)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6
{
  id v10 = (void (**)(id, id, void *))a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnectionManager dataSource](self, "dataSource"));
  id v19 = 0LL;
  id v14 = [v13 setName:v12 withRevision:a4 forConversationLinkDescriptorsWithPredicate:v11 error:&v19];

  id v15 = v19;
  if (!v14 && v15)
  {
    uint64_t v16 = FTCServiceLog();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10000CD0C();
    }
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 conversationServiceDataSourceError]);
  v10[2](v10, v14, v18);
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4 reply:(id)a5
{
  BOOL v8 = (void (**)(id, id, void *))a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnectionManager dataSource](self, "dataSource"));
  id v16 = 0LL;
  id v11 = [v10 setInteger:a3 forKey:v9 error:&v16];

  id v12 = v16;
  if ((v11 & 1) == 0 && v12)
  {
    uint64_t v13 = FTCServiceLog();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000CD6C();
    }
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 conversationServiceDataSourceError]);
  v8[2](v8, v11, v15);
}

- (void)integerForKey:(id)a3 reply:(id)a4
{
  v6 = (void (**)(id, id, void *))a4;
  id v7 = a3;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnectionManager dataSource](self, "dataSource"));
  id v14 = 0LL;
  id v9 = [v8 integerForKey:v7 error:&v14];

  id v10 = v14;
  if (!v9 && v10)
  {
    uint64_t v11 = FTCServiceLog();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000CD6C();
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 conversationServiceDataSourceError]);
  v6[2](v6, v9, v13);
}

- (void)setString:(id)a3 forKey:(id)a4 reply:(id)a5
{
  BOOL v8 = (void (**)(id, id, void *))a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnectionManager dataSource](self, "dataSource"));
  id v17 = 0LL;
  id v12 = [v11 setString:v10 forKey:v9 error:&v17];

  id v13 = v17;
  if ((v12 & 1) == 0 && v13)
  {
    uint64_t v14 = FTCServiceLog();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000CDCC();
    }
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 conversationServiceDataSourceError]);
  v8[2](v8, v12, v16);
}

- (void)stringForKey:(id)a3 reply:(id)a4
{
  v6 = (void (**)(id, void *, void *))a4;
  id v7 = a3;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnectionManager dataSource](self, "dataSource"));
  id v14 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringForKey:v7 error:&v14]);

  id v10 = v14;
  if (!v9 && v10)
  {
    uint64_t v11 = FTCServiceLog();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000CD6C();
    }
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 conversationServiceDataSourceError]);
  v6[2](v6, v9, v13);
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (FTPersistentDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
}

@end