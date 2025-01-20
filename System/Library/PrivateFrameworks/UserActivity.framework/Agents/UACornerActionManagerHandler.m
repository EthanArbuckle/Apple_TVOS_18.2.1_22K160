@interface UACornerActionManagerHandler
- (BOOL)active;
- (BOOL)resume;
- (BOOL)suspend;
- (BOOL)suspended;
- (BOOL)terminate;
- (BOOL)terminated;
- (NSString)name;
- (NSUUID)uuid;
- (UACornerActionManager)manager;
- (UACornerActionManagerHandler)initWithManager:(id)a3 name:(id)a4;
- (id)statusString;
- (int64_t)priority;
- (void)setName:(id)a3;
- (void)setSuspended:(BOOL)a3;
@end

@implementation UACornerActionManagerHandler

- (UACornerActionManagerHandler)initWithManager:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___UACornerActionManagerHandler;
  v9 = -[UACornerActionManagerHandler init](&v13, "init");
  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uuid = v9->_uuid;
    v9->_uuid = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_manager, a3);
    objc_storeStrong((id *)&v9->_name, a4);
    v9->_suspended = 1;
  }

  return v9;
}

- (BOOL)active
{
  return 1;
}

- (BOOL)suspended
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL suspended = v2->_suspended;
  objc_sync_exit(v2);

  return suspended;
}

- (void)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_suspended != v3)
  {
    os_log_t v5 = sub_100039584(0LL);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler name](v4, "name"));
      id v8 = (void *)v7;
      v9 = "resumed";
      if (v3) {
        v9 = "suspended";
      }
      int v10 = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2082;
      objc_super v13 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "HANDLER: %{public}@ is being %{public}s",  (uint8_t *)&v10,  0x16u);
    }

    if (v3) {
      -[UACornerActionManagerHandler suspend](v4, "suspend");
    }
    else {
      -[UACornerActionManagerHandler resume](v4, "resume");
    }
  }

  objc_sync_exit(v4);
}

- (BOOL)suspend
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL suspended = v2->_suspended;
  if (!v2->_suspended)
  {
    os_log_t v4 = sub_100039584(0LL);
    os_log_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler name](v2, "name"));
      int v8 = 138543362;
      v9 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "HANDLER: %{public}@ is being suspended(was not)",  (uint8_t *)&v8,  0xCu);
    }

    v2->_BOOL suspended = 1;
  }

  objc_sync_exit(v2);

  return !suspended;
}

- (BOOL)resume
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL suspended = v2->_suspended;
  if (v2->_suspended)
  {
    os_log_t v4 = sub_100039584(0LL);
    os_log_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler name](v2, "name"));
      int v8 = 138543362;
      v9 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "HANDLER: %{public}@ is being resumed(was suspended)",  (uint8_t *)&v8,  0xCu);
    }

    v2->_BOOL suspended = 0;
  }

  objc_sync_exit(v2);

  return suspended;
}

- (BOOL)terminate
{
  os_log_t v3 = sub_100039584(0LL);
  os_log_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler name](self, "name"));
    unsigned int v6 = -[UACornerActionManagerHandler terminated](self, "terminated");
    uint64_t v7 = &stru_1000BE738;
    if (v6) {
      uint64_t v7 = @"(was already terminated)";
    }
    int v10 = 138543618;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    objc_super v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "HANDLER: %{public}@ is being terminated %{public}@",  (uint8_t *)&v10,  0x16u);
  }

  unsigned __int8 v8 = -[UACornerActionManagerHandler terminated](self, "terminated");
  if ((v8 & 1) == 0)
  {
    if (!-[UACornerActionManagerHandler suspended](self, "suspended")) {
      -[UACornerActionManagerHandler suspend](self, "suspend");
    }
    self->_terminated = 1;
  }

  return v8 ^ 1;
}

- (id)statusString
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler name](self, "name"));
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler name](self, "name"));
  }

  else
  {
    os_log_t v5 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  object_getClassName(self),  4LL);
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v5);
  }

  unsigned int v6 = (void *)v4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: %@\n", v4, self));

  return v7;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 16LL, 1);
}

- (UACornerActionManager)manager
{
  return (UACornerActionManager *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setName:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (BOOL)terminated
{
  return self->_terminated;
}

- (void).cxx_destruct
{
}

@end