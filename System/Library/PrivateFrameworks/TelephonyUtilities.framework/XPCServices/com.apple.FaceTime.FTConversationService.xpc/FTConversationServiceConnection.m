@interface FTConversationServiceConnection
- (FTConversationServiceConnection)initWithConnection:(id)a3 queue:(id)a4;
- (FTConversationServiceConnectionDelegate)delegate;
- (NSSet)entitlements;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (os_unfair_lock_s)accessorLock;
- (void)addConversationLinkDescriptors:(id)a3 reply:(id)a4;
- (void)addOrUpdateConversationLinkDescriptors:(id)a3 reply:(id)a4;
- (void)conversationLinkDescriptorCountWithPredicate:(id)a3 reply:(id)a4;
- (void)conversationLinkDescriptorDidChangeForPersistentDataSource:(id)a3;
- (void)conversationLinkDescriptorsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 reply:(id)a6;
- (void)dealloc;
- (void)integerForKey:(id)a3 reply:(id)a4;
- (void)invalidate;
- (void)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 reply:(id)a5;
- (void)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 reply:(id)a4;
- (void)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6;
- (void)setInteger:(int64_t)a3 forKey:(id)a4 reply:(id)a5;
- (void)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6;
- (void)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6;
- (void)setString:(id)a3 forKey:(id)a4 reply:(id)a5;
- (void)stringForKey:(id)a3 reply:(id)a4;
@end

@implementation FTConversationServiceConnection

- (FTConversationServiceConnection)initWithConnection:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___FTConversationServiceConnection;
  v9 = -[FTConversationServiceConnection init](&v19, "init");
  v10 = v9;
  if (v9)
  {
    v9->_accessorLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_connection, a3);
    -[NSXPCConnection setExportedObject:](v10->_connection, "setExportedObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[TUConversationLinkDescriptorXPCClientDataSource serverXPCInterface]( &OBJC_CLASS___TUConversationLinkDescriptorXPCClientDataSource,  "serverXPCInterface"));
    -[NSXPCConnection setExportedInterface:](v10->_connection, "setExportedInterface:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue( +[TUConversationLinkDescriptorXPCClientDataSource clientXPCInterface]( &OBJC_CLASS___TUConversationLinkDescriptorXPCClientDataSource,  "clientXPCInterface"));
    -[NSXPCConnection setRemoteObjectInterface:](v10->_connection, "setRemoteObjectInterface:", v12);

    objc_initWeak(&location, v10);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000095FC;
    v16[3] = &unk_100014718;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInterruptionHandler:](v10->_connection, "setInterruptionHandler:", v16);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000096B4;
    v14[3] = &unk_100014718;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInvalidationHandler:](v10->_connection, "setInvalidationHandler:", v14);
    -[NSXPCConnection _setQueue:](v10->_connection, "_setQueue:", v8);
    -[NSXPCConnection resume](v10->_connection, "resume");
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___FTConversationServiceConnection;
  -[FTConversationServiceConnection dealloc](&v3, "dealloc");
}

- (FTConversationServiceConnectionDelegate)delegate
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_accessorLock);
  return (FTConversationServiceConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained != obj) {
    objc_storeWeak((id *)p_delegate, obj);
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (NSSet)entitlements
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection connection](self, "connection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 conversationServiceEntitlements]);

  os_unfair_lock_unlock(p_accessorLock);
  return (NSSet *)v5;
}

- (void)invalidate
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection connection](self, "connection"));
  [v4 invalidate];

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)conversationLinkDescriptorDidChangeForPersistentDataSource:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection connection](self, "connection", a3));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteObjectProxy]);
  [v3 conversationLinkDescriptorsDidChange];
}

- (void)addConversationLinkDescriptors:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection entitlements](self, "entitlements"));
  unsigned int v10 = [v9 containsObject:@"modify-conversation-links"];

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection delegate](self, "delegate"));
    [v11 addConversationLinkDescriptors:v7 reply:v8];
  }

  else
  {
    uint64_t v12 = FTCServiceLog();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000D0B4(a2);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FaceTime.FTConversationService",  1LL,  0LL));
    v8[2](v8, 0LL, v11);
  }
}

- (void)addOrUpdateConversationLinkDescriptors:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection entitlements](self, "entitlements"));
  unsigned int v10 = [v9 containsObject:@"modify-conversation-links"];

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection delegate](self, "delegate"));
    [v11 addOrUpdateConversationLinkDescriptors:v7 reply:v8];
  }

  else
  {
    uint64_t v12 = FTCServiceLog();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000D0B4(a2);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FaceTime.FTConversationService",  1LL,  0LL));
    v8[2](v8, 0LL, v11);
  }
}

- (void)conversationLinkDescriptorCountWithPredicate:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t, void *))a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection entitlements](self, "entitlements"));
  unsigned int v10 = [v9 containsObject:@"access-conversation-links"];

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection delegate](self, "delegate"));
    [v11 conversationLinkDescriptorCountWithPredicate:v7 reply:v8];
  }

  else
  {
    uint64_t v12 = FTCServiceLog();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000D0B4(a2);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FaceTime.FTConversationService",  1LL,  0LL));
    v8[2](v8, 0x7FFFFFFFFFFFFFFFLL, v11);
  }
}

- (void)conversationLinkDescriptorsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 reply:(id)a6
{
  id v11 = a3;
  uint64_t v12 = (void (**)(id, void, void *))a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection entitlements](self, "entitlements"));
  unsigned int v14 = [v13 containsObject:@"access-conversation-links"];

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection delegate](self, "delegate"));
    [v15 conversationLinkDescriptorsWithPredicate:v11 limit:a4 offset:a5 reply:v12];
  }

  else
  {
    uint64_t v16 = FTCServiceLog();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10000D0B4(a2);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FaceTime.FTConversationService",  1LL,  0LL));
    v12[2](v12, 0LL, v15);
  }
}

- (void)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 reply:(id)a5
{
  int v6 = a4;
  id v9 = a3;
  unsigned int v10 = (void (**)(id, uint64_t, void *))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection entitlements](self, "entitlements"));
  unsigned int v12 = [v11 containsObject:@"modify-conversation-links"];

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection delegate](self, "delegate"));
    [v13 removeConversationLinkDescriptorsWithPredicate:v9 deleteReason:v6 reply:v10];
  }

  else
  {
    uint64_t v14 = FTCServiceLog();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000D0B4(a2);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FaceTime.FTConversationService",  1LL,  0LL));
    v10[2](v10, 0x7FFFFFFFFFFFFFFFLL, v13);
  }
}

- (void)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t, void *))a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection entitlements](self, "entitlements"));
  unsigned int v10 = [v9 containsObject:@"modify-conversation-links"];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection delegate](self, "delegate"));
    [v11 removeLinkDescriptorsFromDataSourceWithPredicate:v7 reply:v8];
  }

  else
  {
    uint64_t v12 = FTCServiceLog();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000D0B4(a2);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FaceTime.FTConversationService",  1LL,  0LL));
    v8[2](v8, 0x7FFFFFFFFFFFFFFFLL, v11);
  }
}

- (void)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6
{
  BOOL v8 = a3;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, uint64_t, void *))a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection entitlements](self, "entitlements"));
  unsigned int v14 = [v13 containsObject:@"modify-conversation-links"];

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection delegate](self, "delegate"));
    [v15 setActivated:v8 withRevision:a4 forConversationLinkDescriptorsWithPredicate:v11 reply:v12];
  }

  else
  {
    uint64_t v16 = FTCServiceLog();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10000D0B4(a2);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FaceTime.FTConversationService",  1LL,  0LL));
    v12[2](v12, 0x7FFFFFFFFFFFFFFFLL, v15);
  }
}

- (void)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  v13 = (void (**)(id, uint64_t, void *))a6;
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection entitlements](self, "entitlements"));
  unsigned int v15 = [v14 containsObject:@"modify-conversation-links"];

  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection delegate](self, "delegate"));
    [v16 setExpirationDate:v11 withRevision:a4 forConversationLinkDescriptorsWithPredicate:v12 reply:v13];
  }

  else
  {
    uint64_t v17 = FTCServiceLog();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10000D0B4(a2);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FaceTime.FTConversationService",  1LL,  0LL));
    v13[2](v13, 0x7FFFFFFFFFFFFFFFLL, v16);
  }
}

- (void)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  v13 = (void (**)(id, uint64_t, void *))a6;
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection entitlements](self, "entitlements"));
  unsigned int v15 = [v14 containsObject:@"modify-conversation-links"];

  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection delegate](self, "delegate"));
    [v16 setInvitedHandles:v11 withRevision:a4 forConversationLinkDescriptorsWithPredicate:v12 reply:v13];
  }

  else
  {
    uint64_t v17 = FTCServiceLog();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10000D0B4(a2);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FaceTime.FTConversationService",  1LL,  0LL));
    v13[2](v13, 0x7FFFFFFFFFFFFFFFLL, v16);
  }
}

- (void)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 reply:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  v13 = (void (**)(id, uint64_t, void *))a6;
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection entitlements](self, "entitlements"));
  unsigned int v15 = [v14 containsObject:@"modify-conversation-links"];

  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection delegate](self, "delegate"));
    [v16 setName:v11 withRevision:a4 forConversationLinkDescriptorsWithPredicate:v12 reply:v13];
  }

  else
  {
    uint64_t v17 = FTCServiceLog();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10000D0B4(a2);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FaceTime.FTConversationService",  1LL,  0LL));
    v13[2](v13, 0x7FFFFFFFFFFFFFFFLL, v16);
  }
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4 reply:(id)a5
{
  id v9 = a4;
  unsigned int v10 = (void (**)(id, uint64_t, void *))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection entitlements](self, "entitlements"));
  unsigned int v12 = [v11 containsObject:@"modify-conversation-links"];

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection delegate](self, "delegate"));
    [v13 setInteger:a3 forKey:v9 reply:v10];
  }

  else
  {
    uint64_t v14 = FTCServiceLog();
    unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000D0B4(a2);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FaceTime.FTConversationService",  1LL,  0LL));
    v10[2](v10, 1LL, v13);
  }
}

- (void)integerForKey:(id)a3 reply:(id)a4
{
  id v7 = a3;
  BOOL v8 = (void (**)(id, uint64_t, void *))a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection entitlements](self, "entitlements"));
  unsigned int v10 = [v9 containsObject:@"access-conversation-links"];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection delegate](self, "delegate"));
    [v11 integerForKey:v7 reply:v8];
  }

  else
  {
    uint64_t v12 = FTCServiceLog();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000D0B4(a2);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FaceTime.FTConversationService",  1LL,  0LL));
    v8[2](v8, 0x7FFFFFFFFFFFFFFFLL, v11);
  }
}

- (void)setString:(id)a3 forKey:(id)a4 reply:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, uint64_t, void *))a5;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection entitlements](self, "entitlements"));
  unsigned int v13 = [v12 containsObject:@"modify-conversation-links"];

  if (v13)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection delegate](self, "delegate"));
    [v14 setString:v9 forKey:v10 reply:v11];
  }

  else
  {
    uint64_t v15 = FTCServiceLog();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10000D0B4(a2);
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FaceTime.FTConversationService",  1LL,  0LL));
    v11[2](v11, 1LL, v14);
  }
}

- (void)stringForKey:(id)a3 reply:(id)a4
{
  id v7 = a3;
  BOOL v8 = (void (**)(id, void, void *))a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection entitlements](self, "entitlements"));
  unsigned int v10 = [v9 containsObject:@"access-conversation-links"];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[FTConversationServiceConnection delegate](self, "delegate"));
    [v11 stringForKey:v7 reply:v8];
  }

  else
  {
    uint64_t v12 = FTCServiceLog();
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000D0B4(a2);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FaceTime.FTConversationService",  1LL,  0LL));
    v8[2](v8, 0LL, v11);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
}

@end