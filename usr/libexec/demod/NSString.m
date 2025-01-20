@interface NSString
+ (id)restoreSystemContainerUUIDPathsInDict:(id)a3;
- (BOOL)higherVersionThan:(id)a3;
- (BOOL)isSystemContainerPath;
- (BOOL)isSystemContainerShared;
- (BOOL)lowerVersionThan:(id)a3;
- (NSString)getSystemContainerKeyword;
- (id)_dataUsingHexEncoding;
- (id)_stringForHMAC;
- (id)getSystemContainerRootPath;
- (id)lookupSystemContainerPathUUID;
@end

@implementation NSString

- (id)_stringForHMAC
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](self, "dataUsingEncoding:", 1LL));
  v3 = v2;
  if (v2) {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v2 base64EncodedStringWithOptions:0]);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (id)_dataUsingHexEncoding
{
  NSUInteger v3 = -[NSString length](self, "length");
  if (!v3) {
    return (id)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  }
  unint64_t v4 = v3;
  if ((v3 & 1) != 0)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue([@"0" stringByAppendingString:self]);
    id v10 = (id)objc_claimAutoreleasedReturnValue([v8 _dataUsingHexEncoding]);
    goto LABEL_9;
  }

  CFStringRef theString = (CFStringRef)self;
  uint64_t v39 = 0LL;
  int64_t v40 = v3;
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)self);
  CStringPtr = 0LL;
  v37 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)self, 0x600u);
  }
  unint64_t v7 = v4 >> 1;
  uint64_t v41 = 0LL;
  uint64_t v42 = 0LL;
  v38 = CStringPtr;
  id v8 = objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithLength:]( &OBJC_CLASS___NSMutableData, "dataWithLength:", v4 >> 1));
  v9 = [v8 mutableBytes];
  if (v4 < 2)
  {
LABEL_6:
    id v10 = [v8 copy];
LABEL_9:
    v12 = v10;
    goto LABEL_10;
  }

  v13 = v9;
  uint64_t v14 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v16 = 64LL;
  while (1)
  {
    uint64_t v17 = (unint64_t)v15 >= 4 ? 4LL : v15;
    int64_t v18 = v40;
    if (v40 <= v15) {
      break;
    }
    if (v37)
    {
      UniChar v19 = v37[v15 + v39];
    }

    else if (v38)
    {
      UniChar v19 = v38[v39 + v15];
    }

    else
    {
      uint64_t v20 = v41;
      if (v42 <= v15 || v41 > v15)
      {
        uint64_t v22 = -v17;
        uint64_t v23 = v17 + v14;
        uint64_t v24 = v16 - v17;
        uint64_t v25 = v15 + v22;
        int64_t v26 = v25 + 64;
        if (v25 + 64 >= v40) {
          int64_t v26 = v40;
        }
        uint64_t v41 = v25;
        uint64_t v42 = v26;
        if (v40 >= v24) {
          int64_t v18 = v24;
        }
        v43.length = v18 + v23;
        v43.location = v25 + v39;
        CFStringGetCharacters(theString, v43, v35);
        uint64_t v20 = v41;
      }

      UniChar v19 = v35[v15 - v20];
    }

    if ((unsigned __int16)(v19 - 48) >= 0xAu)
    {
      if ((unsigned __int16)(v19 - 65) >= 6u)
      {
        char v27 = -87;
      }

      else
      {
        char v27 = -55;
      }
    }

    else
    {
      char v27 = -48;
    }

    int64_t v28 = v15 + 1;
    int64_t v29 = v40;
    if (v40 <= v15 + 1) {
      break;
    }
    if (v37)
    {
      v30 = (UniChar *)&v37[v15 + v39];
LABEL_39:
      UniChar v31 = v30[1];
      goto LABEL_42;
    }

    if (!v38)
    {
      if (v42 <= v28 || (uint64_t v33 = v41, v41 > v28))
      {
        else {
          uint64_t v34 = 0LL;
        }
        if (v34 + 64 < v40) {
          int64_t v29 = v34 + 64;
        }
        uint64_t v41 = v34;
        uint64_t v42 = v29;
        v44.location = v39 + v34;
        v44.length = v29 - v34;
        CFStringGetCharacters(theString, v44, v35);
        uint64_t v33 = v41;
      }

      v30 = &v35[v15 - v33];
      goto LABEL_39;
    }

    UniChar v31 = v38[v39 + 1 + v15];
LABEL_42:
    char v32 = v31 - 48;
    if ((unsigned __int16)(v31 - 48) >= 0xAu)
    {
      if ((unsigned __int16)(v31 - 65) > 5u)
      {
        char v32 = v31 - 87;
      }

      else
      {
        char v32 = v31 - 55;
      }
    }

    *v13++ = v32 | (16 * (v19 + v27));
    v14 -= 2LL;
    v16 += 2LL;
    v15 += 2LL;
    if (!--v7) {
      goto LABEL_6;
    }
  }

  v12 = 0LL;
LABEL_10:

  return v12;
}

+ (id)restoreSystemContainerUUIDPathsInDict:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
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
          id v14 = sub_10003A95C();
          uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
          if (v13)
          {
            if (v16)
            {
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v11 getSystemContainerKeyword]);
              *(_DWORD *)buf = v28;
              v36 = v17;
              __int16 v37 = 2114;
              v38 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "System container path mapping created: %{public}@ -> %{public}@",  buf,  0x16u);
            }

            int64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v11 getSystemContainerKeyword]);
            [v4 setObject:v13 forKey:v18];

LABEL_12:
            UniChar v19 = (void *)objc_claimAutoreleasedReturnValue([v11 getSystemContainerKeyword]);
            id v20 = [v11 rangeOfString:v19];
            uint64_t v22 = v21;

            if (v20 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              id v23 = sub_10003A95C();
              uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
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
              int64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:v11]);
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

- (BOOL)lowerVersionThan:(id)a3
{
  return -[NSString compare:options:](self, "compare:options:", a3, 64LL) == NSOrderedAscending;
}

- (BOOL)higherVersionThan:(id)a3
{
  return (id)-[NSString compare:options:](self, "compare:options:", a3, 64LL) == (id)1;
}

@end