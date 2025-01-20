@interface NSPPersistentContainer
+ (id)defaultDirectoryURL;
@end

@implementation NSPPersistentContainer

+ (id)defaultDirectoryURL
{
  v3 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v7 = v4;
  if (v4)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 firstObject]);
    v11 = (void *)v8;
    if (v8)
    {
      uint64_t v12 = nplog_obj(v8, v9, v10);
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Application Support Directory: %@",  buf,  0xCu);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/networkserviceproxy",  v11));
      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v14,  1LL));
        uint64_t v18 = nplog_obj(v15, v16, v17);
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Custom directory for coreData storage: %@",  buf,  0xCu);
        }

        if (v15)
        {

          goto LABEL_15;
        }
      }
    }
  }

  uint64_t v20 = nplog_obj(v4, v5, v6);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to set custom directory for coreData storage, using default Directory",  buf,  2u);
  }

  v24.receiver = a1;
  v24.super_class = (Class)&OBJC_METACLASS___NSPPersistentContainer;
  id v22 = objc_msgSendSuper2(&v24, "defaultDirectoryURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v22);
LABEL_15:

  return v15;
}

@end