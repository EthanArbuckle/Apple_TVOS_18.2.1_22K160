@interface PBClearApplicationDataContainerCacheOperation
- (NSString)applicationIdentifier;
- (PBClearApplicationDataContainerCacheOperation)initWithApplicationIdentifier:(id)a3;
- (id)clearApplicationDataContainerCacheCompletionHandler;
- (void)main;
- (void)setClearApplicationDataContainerCacheCompletionHandler:(id)a3;
@end

@implementation PBClearApplicationDataContainerCacheOperation

- (PBClearApplicationDataContainerCacheOperation)initWithApplicationIdentifier:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___PBClearApplicationDataContainerCacheOperation;
    v7 = -[PBClearApplicationDataContainerCacheOperation init](&v12, "init");
    if (v7)
    {
      id v8 = [v6 copy];
      id v9 = v7->super._private;
      v7->super._private = v8;
    }

    return v7;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"applicationIdentifier != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100276210(a2, (uint64_t)self, (uint64_t)v11);
    }
    result = (PBClearApplicationDataContainerCacheOperation *)_bs_set_crash_log_message([v11 UTF8String]);
    __break(0);
  }

  return result;
}

- (void)main
{
  id v3 = sub_100084518();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = self->super._private;
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Clearing application data container cache. {applicationIdentifier=%@}",  buf,  0xCu);
  }

  p_private = (uint64_t *)&self->super._private;
  *(_OWORD *)buf = (unint64_t)[self->super._private UTF8String];
  int v7 = sandbox_set_user_state_item(501LL, 1LL, buf, 0LL);
  id v8 = self;
  objc_sync_enter(v8);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10006B1DC;
  v14[3] = &unk_1003D28B0;
  v14[4] = v8;
  id v9 = objc_retainBlock(v14);
  if (v7)
  {
    id v10 = sub_100084518();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10027630C(p_private, v7, v11);
    }
  }

  else
  {
    id v12 = sub_100084518();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *p_private;
      *(_DWORD *)v15 = 138412290;
      uint64_t v16 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Finished clearing application data container cache. {applicationIdentifier=%@}",  v15,  0xCu);
    }
  }

  ((void (*)(void *, uint64_t, void))v9[2])(v9, 1LL, 0LL);
  objc_sync_exit(v8);
}

- (void)setClearApplicationDataContainerCacheCompletionHandler:(id)a3
{
  v4 = self;
  id v5 = a3;
  objc_sync_enter(v4);
  id v6 = objc_retainBlock(v5);

  int v7 = *(void **)&v4->super._private1;
  *(void *)&v4->super._private1 = v6;

  objc_sync_exit(v4);
}

- (NSString)applicationIdentifier
{
  return (NSString *)self->super._private;
}

- (id)clearApplicationDataContainerCacheCompletionHandler
{
  return *(id *)&self->super._private1;
}

- (void).cxx_destruct
{
}

@end