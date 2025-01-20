@interface GKCacheTransactionGroup
+ (id)dispatchGroupWithName:(id)a3;
+ (id)transactionGroupWithName:(id)a3 context:(id)a4 client:(id)a5;
- (GKCacheTransactionGroup)initWithName:(id)a3;
- (GKCacheTransactionGroup)initWithName:(id)a3 context:(id)a4 client:(id)a5;
- (GKCacheTransactionGroup)transactionGroupWithName:(id)a3;
- (GKClientProxy)client;
- (NSManagedObjectContext)context;
- (void)dealloc;
- (void)notifyOnMainQueueWithBlock:(id)a3;
- (void)notifyOnQueue:(id)a3 block:(id)a4;
- (void)performOnManagedObjectContext:(id)a3;
- (void)performOnQueue:(id)a3 block:(id)a4;
- (void)setClient:(id)a3;
- (void)setContext:(id)a3;
- (void)stripGKPlayerInternalPIIs;
@end

@implementation GKCacheTransactionGroup

+ (id)dispatchGroupWithName:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot use dispatchGroupWithName with GKCacheTransactionGroup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheTransactionGroup.m"));
  id v5 = objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (NO)\n[%s (%s:%d)]",  v3,  "+[GKCacheTransactionGroup dispatchGroupWithName:]",  [v5 UTF8String],  58));

  +[NSException raise:format:](&OBJC_CLASS___NSException, "raise:format:", @"GameKit Exception", @"%@", v6);
  return 0LL;
}

+ (id)transactionGroupWithName:(id)a3 context:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers(v10);
  }
  v13 = (os_log_s *)os_log_GKCache;
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D9598(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  id v21 = [objc_alloc((Class)a1) initWithName:v8 context:v9 client:v11];

  return v21;
}

- (GKCacheTransactionGroup)transactionGroupWithName:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc((Class)objc_opt_class(self, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheTransactionGroup context](self, "context"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheTransactionGroup client](self, "client"));
  id v9 = [v6 initWithName:v4 context:v7 client:v8];

  return (GKCacheTransactionGroup *)v9;
}

- (GKCacheTransactionGroup)initWithName:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot use initWithName: with GKCacheTransactionGroup"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheTransactionGroup.m"));
  id v6 = objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (NO)\n[%s (%s:%d)]",  v4,  "-[GKCacheTransactionGroup initWithName:]",  [v6 UTF8String],  81));

  +[NSException raise:format:](&OBJC_CLASS___NSException, "raise:format:", @"GameKit Exception", @"%@", v7);
  return 0LL;
}

- (GKCacheTransactionGroup)initWithName:(id)a3 context:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers(v10);
  }
  v13 = (os_log_s *)os_log_GKCache;
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D95C8(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___GKCacheTransactionGroup;
  id v21 = -[GKCacheTransactionGroup initWithName:](&v27, "initWithName:", v8);
  if (v21)
  {
    if (!v9)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Assertion failed"));
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheTr ansactionGroup.m"));
      id v24 = objc_claimAutoreleasedReturnValue([v23 lastPathComponent]);
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (context != ((void *)0))\n[%s (%s:%d)]",  v22,  "-[GKCacheTransactionGroup initWithName:context:client:]",  [v24 UTF8String],  93));

      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v25);
    }

    -[GKCacheTransactionGroup setContext:](v21, "setContext:", v9);
    -[GKCacheTransactionGroup setClient:](v21, "setClient:", v11);
    GKIncrementContextTransactionCount(v21->_context, 1, 0LL);
  }

  return v21;
}

- (void)dealloc
{
  v3 = self->_context;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000D8B9C;
  v6[3] = &unk_100271750;
  v7 = v3;
  id v4 = v3;
  GKIncrementContextTransactionCount(v4, -1, v6);

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GKCacheTransactionGroup;
  -[GKCacheTransactionGroup dealloc](&v5, "dealloc");
}

- (void)performOnManagedObjectContext:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  v7 = (os_log_s *)os_log_GKCache;
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000D9670(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v17[1] = 3221225472LL;
  v17[2] = sub_1000D8DF4;
  v17[3] = &unk_1002717A0;
  v17[4] = self;
  id v18 = v5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___GKCacheTransactionGroup;
  v17[0] = _NSConcreteStackBlock;
  id v15 = v5;
  -[GKCacheTransactionGroup perform:](&v16, "perform:", v17);
}

- (void)performOnQueue:(id)a3 block:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000D8FE4;
  v8[3] = &unk_1002717A0;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  -[GKCacheTransactionGroup perform:](self, "perform:", v8);
}

- (void)stripGKPlayerInternalPIIs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheTransactionGroup client](self, "client"));
  unsigned __int8 v4 = [v3 clientHasAnyPrivateEntitlement];

  if ((v4 & 1) == 0)
  {
    uint64_t v6 = OBJC_IVAR___GKDispatchGroup__result;
    uint64_t v7 = *(void *)&self->GKDispatchGroup_opaque[OBJC_IVAR___GKDispatchGroup__result];
    if (v7)
    {
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray, v5);
      uint64_t isKindOfClass = objc_opt_isKindOfClass(v7, v8);
      uint64_t v11 = *(void *)&self->GKDispatchGroup_opaque[v6];
      if ((isKindOfClass & 1) != 0)
      {
        sub_1000D91A0(isKindOfClass, *(void **)&self->GKDispatchGroup_opaque[v6]);
      }

      else
      {
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary, v10);
        char v13 = objc_opt_isKindOfClass(v11, v12);
        uint64_t v15 = *(void *)&self->GKDispatchGroup_opaque[v6];
        if ((v13 & 1) != 0)
        {
          id v17 = (id)objc_claimAutoreleasedReturnValue([*(id *)&self->GKDispatchGroup_opaque[v6] allValues]);
          sub_1000D91A0((uint64_t)v17, v17);
        }

        else
        {
          uint64_t v16 = objc_opt_class(&OBJC_CLASS___GKPlayerInternal, v14);
          if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0) {
            [*(id *)&self->GKDispatchGroup_opaque[v6] sanitize];
          }
        }
      }
    }
  }

- (void)notifyOnQueue:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000D93A4;
  v10[3] = &unk_1002717F0;
  objc_copyWeak(&v12, &location);
  id v8 = v7;
  id v11 = v8;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GKCacheTransactionGroup;
  -[GKCacheTransactionGroup notifyOnQueue:block:](&v9, "notifyOnQueue:block:", v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)notifyOnMainQueueWithBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000D94CC;
  v7[3] = &unk_1002717F0;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v8 = v5;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GKCacheTransactionGroup;
  -[GKCacheTransactionGroup notifyOnMainQueueWithBlock:](&v6, "notifyOnMainQueueWithBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (GKClientProxy)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end