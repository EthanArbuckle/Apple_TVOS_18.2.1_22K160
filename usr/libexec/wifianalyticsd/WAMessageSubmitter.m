@interface WAMessageSubmitter
- (WAMessageSubmitter)initWithMessageGroupType:(int64_t)a3;
- (id)submitMessage:(id)a3;
- (int64_t)groupTypeForThisSubmitter;
- (void)setGroupTypeForThisSubmitter:(int64_t)a3;
@end

@implementation WAMessageSubmitter

- (WAMessageSubmitter)initWithMessageGroupType:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___WAMessageSubmitter;
  v4 = -[WAMessageSubmitter init](&v10, "init");
  if (!v4)
  {
    id v6 = WALogCategoryDefaultHandle();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v12 = "-[WAMessageSubmitter initWithMessageGroupType:]";
      __int16 v13 = 1024;
      int v14 = 26;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:failed in super-init",  buf,  0x12u);
    }

    id v8 = WALogCategoryDefaultHandle();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v12 = "-[WAMessageSubmitter initWithMessageGroupType:]";
      __int16 v13 = 1024;
      int v14 = 32;
      __int16 v15 = 2048;
      int64_t v16 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error configuring groupType: %ld",  buf,  0x1Cu);
    }
  }

  return v4;
}

- (id)submitMessage:(id)a3
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Never use %@ for WAMessage.",  v4);

  return 0LL;
}

- (int64_t)groupTypeForThisSubmitter
{
  return self->_groupTypeForThisSubmitter;
}

- (void)setGroupTypeForThisSubmitter:(int64_t)a3
{
  self->_groupTypeForThisSubmitter = a3;
}

@end