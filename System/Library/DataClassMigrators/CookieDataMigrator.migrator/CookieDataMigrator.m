}

uint64_t sub_30F8(void *a1)
{
  id v30 = 0LL;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  v2 = -[NSFileManager contentsOfDirectoryAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "contentsOfDirectoryAtPath:error:",  a1,  0LL);
  id v3 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v26,  v41,  16LL);
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v27;
    char v25 = 1;
    *(void *)&__int128 v4 = 138412546LL;
    __int128 v24 = v4;
    while (1)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        if (objc_msgSend( objc_msgSend(v8, "pathExtension", v24),  "isEqualToString:",  @"binarycookies"))
        {
          id v9 = [a1 stringByAppendingPathComponent:v8];
          NSFileAttributeKey v39 = NSFileProtectionKey;
          NSFileProtectionType v40 = NSFileProtectionCompleteUntilFirstUserAuthentication;
          -[NSFileManager setAttributes:ofItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "setAttributes:ofItemAtPath:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1),  [a1 stringByAppendingPathComponent:v8],  &v30);
          if (!v30) {
            continue;
          }
          if ([v30 domain] == NSCocoaErrorDomain)
          {
            v14 = (int *)[v30 code];
            if ([v30 domain] == NSCocoaErrorDomain)
            {
              v10 = (char *)[v30 code];
              if (v14 == &dword_4)
              {
LABEL_20:
                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  continue;
                }
                id v15 = [v30 localizedDescription];
                *(_DWORD *)buf = v24;
                id v32 = v9;
                __int16 v33 = 2112;
                id v34 = v15;
                v13 = "File %@ deleted before protection class was changed. [Error]: %@";
LABEL_22:
                uint32_t v16 = 22;
LABEL_26:
                _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v13, buf, v16);
                continue;
              }

LABEL_23:
              if (v10 == (_BYTE *)&stru_B8.reserved2 + 1)
              {
                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  continue;
                }
                id v17 = [v30 domain];
                id v18 = [v30 code];
                id v19 = [v30 localizedDescription];
                *(_DWORD *)buf = 138413058;
                id v32 = v9;
                __int16 v33 = 2112;
                id v34 = v17;
                __int16 v35 = 2048;
                id v36 = v18;
                __int16 v37 = 2112;
                id v38 = v19;
                v13 = "File %@ could not be opened since you do not have permissions to view it [Error %@:%ld]: %@";
                uint32_t v16 = 42;
                goto LABEL_26;
              }
            }

            else if (v14 == &dword_4)
            {
              goto LABEL_20;
            }
          }

          else if ([v30 domain] == NSCocoaErrorDomain)
          {
            v10 = (char *)[v30 code];
            goto LABEL_23;
          }

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            id v20 = [v30 domain];
            id v21 = [v30 code];
            id v22 = [v30 localizedDescription];
            *(_DWORD *)buf = 138413058;
            id v32 = v9;
            __int16 v33 = 2112;
            id v34 = v20;
            __int16 v35 = 2048;
            id v36 = v21;
            __int16 v37 = 2112;
            id v38 = v22;
            _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to change the data class protection of cookie file %@. [Error %@:%ld]: %@",  buf,  0x2Au);
          }

          char v25 = 0;
          continue;
        }

        if ([v8 containsString:@"_tmp_"])
        {
          if (objc_msgSend(objc_msgSend(v8, "pathExtension"), "isEqualToString:", @"dat"))
          {
            id v11 = [a1 stringByAppendingPathComponent:v8];
            -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v11,  &v30);
            id v12 = v30;
            if (v30)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v24;
                id v32 = v11;
                __int16 v33 = 2112;
                id v34 = v12;
                v13 = "Unabled to delete tmp file at location %@. Error = %@";
                goto LABEL_22;
              }
            }
          }
        }
      }

      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v26,  v41,  16LL);
      if (!v5) {
        return v25 & 1;
      }
    }
  }

  char v25 = 1;
  return v25 & 1;
}

uint64_t sub_3574(void *a1)
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v13 = [a1 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v13)
  {
    uint64_t v12 = *(void *)v21;
    int v1 = 1;
    do
    {
      uint64_t v2 = 0LL;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(a1);
        }
        uint64_t v14 = v2;
        id v3 = *(void **)(*((void *)&v20 + 1) + 8 * v2);
        __int128 v4 = -[NSFileManager contentsOfDirectoryAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "contentsOfDirectoryAtPath:error:",  [v3 path],  0);
        __int128 v15 = 0u;
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v15,  v24,  16LL);
        if (v5)
        {
          id v6 = v5;
          uint64_t v7 = *(void *)v16;
          do
          {
            for (i = 0LL; i != v6; i = (char *)i + 1)
            {
              if (*(void *)v16 != v7) {
                objc_enumerationMutation(v4);
              }
              id v9 = objc_msgSend( objc_msgSend(v3, "path"),  "stringByAppendingPathComponent:",  objc_msgSend( *(id *)(*((void *)&v15 + 1) + 8 * (void)i),  "stringByAppendingString:",  @"/Library/Cookies"));
              if (-[NSFileManager fileExistsAtPath:isDirectory:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:isDirectory:",  v9,  &v19))
              {
                v1 &= sub_30F8(v9);
              }
            }

            id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v15,  v24,  16LL);
          }

          while (v6);
        }

        uint64_t v2 = v14 + 1;
      }

      while ((id)(v14 + 1) != v13);
      id v13 = [a1 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v13);
  }

  else
  {
    LOBYTE(v1) = 1;
  }

  return v1 & 1;
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}