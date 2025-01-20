@interface NSFileManager
- (BOOL)removeItemsUnderPath:(id)a3 error:(id *)a4;
@end

@implementation NSFileManager

- (BOOL)removeItemsUnderPath:(id)a3 error:(id *)a4
{
  id v22 = 0LL;
  v7 = -[NSFileManager enumeratorAtPath:](self, "enumeratorAtPath:");
  if (!v7) {
    return 1;
  }
  v8 = v7;
  v21 = a4;
  id v9 = -[NSDirectoryEnumerator nextObject](v7, "nextObject");
  if (v9)
  {
    id v10 = v9;
    id v11 = 0LL;
    char v12 = 0;
    do
    {
      v13 = objc_autoreleasePoolPush();
      -[NSDirectoryEnumerator skipDescendants](v8, "skipDescendants");
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v10, v14) & 1) != 0)
      {
        id v15 = [a3 stringByAppendingPathComponent:v10];
        unsigned int v16 = -[NSFileManager removeItemAtPath:error:](self, "removeItemAtPath:error:", v15, &v22);
        v17 = (os_log_s *)msuSharedLogger();
        v18 = v17;
        if (v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v24 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Successfully removed old CacheDelete subpath %@",  buf,  0xCu);
          }
        }

        else
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v24 = v15;
            __int16 v25 = 2112;
            id v26 = v22;
            _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Failed to remove old CacheDelete subpath %@: %@",  buf,  0x16u);
          }

          id v11 = v22;
          char v12 = 1;
        }
      }

      objc_autoreleasePoolPop(v13);
      id v10 = -[NSDirectoryEnumerator nextObject](v8, "nextObject");
    }

    while (v10);
  }

  else
  {
    char v12 = 0;
    id v11 = 0LL;
  }

  id v20 = v11;
  if (v21) {
    id *v21 = v11;
  }
  return (v12 & 1) == 0;
}

@end