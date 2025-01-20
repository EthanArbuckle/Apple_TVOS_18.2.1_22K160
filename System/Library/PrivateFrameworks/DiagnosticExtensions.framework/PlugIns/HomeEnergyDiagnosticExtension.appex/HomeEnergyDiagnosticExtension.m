void sub_100003960( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100003970( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000039DC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}
t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v32;
  id v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:relativeToURL:",  @"/var/mobile/Library/homeenergyd/com.apple.homeenergyd/",  1LL,  0LL));
  log = self->_log;
  if (v4)
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v4;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Looking for contents in %@.", buf, 0xCu);
    }

    v39 = 0LL;
    v6 = (void *)objc_claimAutoreleasedReturnValue( [v3 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:&__NSArray0__struct options:0 error:&v39]);
    v7 = v39;
    if (v6)
    {
      if ([v6 count])
      {
        v33 = v7;
        v34 = v3;
        v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v32 = v6;
        v9 = v6;
        v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v10)
        {
          v11 = v10;
          v12 = *(void *)v36;
          do
          {
            for (i = 0LL; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v36 != v12) {
                objc_enumerationMutation(v9);
              }
              if (([v14 containsString:@"LocalCache.store"] & 1) != 0
                || [v14 containsString:@"HomeEnergyDiagnosticsDump.plist"])
              {
                v15 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  v14));
                [v8 addObject:v15];
              }
            }

            v11 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
          }

          while (v11);
        }

        v16 = [v8 copy];
        v3 = v34;
        v6 = v32;
        v7 = v33;
        goto LABEL_23;
      }
    }

    else
    {
      v24 = self->_log;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1000039DC((uint64_t)v7, v24, v25, v26, v27, v28, v29, v30);
      }
    }

    v16 = &__NSArray0__struct;
LABEL_23:

    goto LABEL_24;
  }

  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    sub_100003970(log, v17, v18, v19, v20, v21, v22, v23);
  }
  v7 = 0LL;
  v16 = &__NSArray0__struct;
LABEL_24:

  return v16;
}

- (void).cxx_destruct
{
}

@end