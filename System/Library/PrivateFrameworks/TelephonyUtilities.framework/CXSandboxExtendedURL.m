@interface CXSandboxExtendedURL
- (BOOL)csd_isSymbolicLink;
@end

@implementation CXSandboxExtendedURL

- (BOOL)csd_isSymbolicLink
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CXSandboxExtendedURL URL](self, "URL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);

  if ([v3 length])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v11 = 0LL;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 attributesOfItemAtPath:v3 error:&v11]);
    id v6 = v11;

    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:NSFileType]);
      unsigned __int8 v8 = [v7 isEqual:NSFileTypeSymbolicLink];
    }

    else
    {
      id v9 = sub_1001704C4();
      v5 = (void *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
        sub_1002B92EC((uint64_t)v6, (os_log_s *)v5);
      }
      unsigned __int8 v8 = 0;
    }
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

@end