@interface NSString
+ (id)restoreSystemContainerUUIDPathsInDict:(id)a3;
- (BOOL)isSystemContainerPath;
- (BOOL)isSystemContainerShared;
- (NSString)getSystemContainerKeyword;
- (id)getSystemContainerRootPath;
- (id)lookupSystemContainerPathUUID;
@end

@implementation NSString

+ (id)restoreSystemContainerUUIDPathsInDict:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v29 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v30 = v3;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  id v6 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v32;
    *(void *)&__int128 v7 = 138543618LL;
    __int128 v28 = v7;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        if (objc_msgSend(v11, "isSystemContainerPath", v28))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue([v11 getSystemContainerKeyword]);
          v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v12]);

          if (v13) {
            goto LABEL_12;
          }
          v13 = (void *)objc_claimAutoreleasedReturnValue([v11 lookupSystemContainerPathUUID]);
          id v14 = sub_100021D84();
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
          if (v13)
          {
            if (v16)
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue([v11 getSystemContainerKeyword]);
              *(_DWORD *)buf = v28;
              v36 = v17;
              __int16 v37 = 2114;
              v38 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "System container path mapping created: %{public}@ -> %{public}@",  buf,  0x16u);
            }

            v18 = (void *)objc_claimAutoreleasedReturnValue([v11 getSystemContainerKeyword]);
            [v4 setObject:v13 forKey:v18];

LABEL_12:
            v19 = (void *)objc_claimAutoreleasedReturnValue([v11 getSystemContainerKeyword]);
            id v20 = [v11 rangeOfString:v19];
            uint64_t v22 = v21;

            if (v20 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              id v23 = sub_100021D84();
              v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v36 = v11;
                _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Cannot locate system container path identifier in path '%{public}@'. Skipping...",  buf,  0xCu);
              }
            }

            else
            {
              uint64_t v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", v20, v22, v13));
              v26 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:v11]);
              [v29 setObject:v26 forKey:v25];

              v13 = (void *)v25;
            }
          }

          else
          {
            if (v16)
            {
              *(_DWORD *)buf = 138543362;
              v36 = v11;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Cannot lookup system container path UUID from path '%{public}@'. Skipping...",  buf,  0xCu);
            }

            v13 = v15;
          }

          continue;
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }

    while (v8);
  }

  return v29;
}

- (NSString)getSystemContainerKeyword
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString pathComponents](self, "pathComponents"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectAtIndex:5]);

  return (NSString *)v3;
}

- (BOOL)isSystemContainerPath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByStandardizingPath](self, "stringByStandardizingPath"));
  BOOL v5 = 0;
  if (([v2 hasPrefix:@"/var/containers/Data/System"] & 1) != 0
    || [v2 hasPrefix:@"/var/containers/Shared/SystemGroup"])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 pathComponents]);
    id v4 = [v3 count];
  }

  return v5;
}

- (BOOL)isSystemContainerShared
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString pathComponents](self, "pathComponents"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectAtIndex:3]);

  LOBYTE(v2) = [v3 isEqualToString:@"Shared"];
  return (char)v2;
}

- (id)getSystemContainerRootPath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString pathComponents](self, "pathComponents"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "subarrayWithRange:", 0, 6));

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v3));
  return v4;
}

- (id)lookupSystemContainerPathUUID
{
  if (-[NSString isSystemContainerShared](self, "isSystemContainerShared")) {
    uint64_t v3 = 13LL;
  }
  else {
    uint64_t v3 = 12LL;
  }
  uint64_t v10 = 1LL;
  char v9 = 0;
  id v4 = objc_claimAutoreleasedReturnValue(-[NSString getSystemContainerKeyword](self, "getSystemContainerKeyword"));
  BOOL v5 = (void *)container_create_or_lookup_path_for_current_user(v3, [v4 UTF8String], 0, 0, &v9, &v10);

  id v6 = 0LL;
  if (v5 && v9)
  {
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);

    free(v5);
  }

  return v6;
}

@end