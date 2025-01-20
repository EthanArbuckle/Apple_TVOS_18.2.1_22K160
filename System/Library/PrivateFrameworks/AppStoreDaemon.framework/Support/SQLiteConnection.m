@interface SQLiteConnection
- (void)dealloc;
@end

@implementation SQLiteConnection

- (void)dealloc
{
  if (self->_database)
  {
    uint64_t v3 = ASDLogHandleForCategory(35LL, a2);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      options = self->_options;
      if (options) {
        options = objc_getProperty(options, v5, 24LL, 1);
      }
      id v7 = options;
      *(_DWORD *)buf = 138543362;
      id v10 = v7;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_FAULT,  "Connection taken down HARD, please call close before deallocating: %{public}@",  buf,  0xCu);
    }

    sqlite3_close_v2(self->_database);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SQLiteConnection;
  -[SQLiteConnection dealloc](&v8, "dealloc");
}

- (void).cxx_destruct
{
}

@end