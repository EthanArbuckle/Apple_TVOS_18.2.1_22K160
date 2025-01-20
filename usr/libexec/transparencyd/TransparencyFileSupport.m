@interface TransparencyFileSupport
+ (BOOL)deleteFile:(id)a3 error:(id *)a4;
+ (BOOL)deleteFile:(id)a3 inDirectory:(id)a4 error:(id *)a5;
+ (BOOL)setProtectionToClassDForURL:(id)a3 error:(id *)a4;
+ (BOOL)writeDictionaryToFile:(id)a3 fileName:(id)a4 error:(id *)a5;
+ (BOOL)writeDictionaryToFile:(id)a3 fileName:(id)a4 inDirectory:(id)a5 error:(id *)a6;
+ (id)applicationSupportPath:(id *)a3;
+ (id)readDataFromFile:(id)a3 error:(id *)a4;
+ (id)readDictionaryFromFile:(id)a3 error:(id *)a4;
+ (id)readDictionaryFromFile:(id)a3 inDirectory:(id)a4 error:(id *)a5;
+ (id)transparencyFilesPath:(id *)a3;
+ (int64_t)directorySizeInKB:(id *)a3;
@end

@implementation TransparencyFileSupport

+ (BOOL)setProtectionToClassDForURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int v6 = open((const char *)[v5 fileSystemRepresentation], 0);
  int v7 = v6;
  if (v6)
  {
    if (fcntl(v6, 64, 4LL) < 0)
    {
      if (a4)
      {
        uint64_t v8 = *__error();
        v9 = __error();
        v10 = strerror(*v9);
        v11 = +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  NSPOSIXErrorDomain,  v8,  @"set protection class error for file %@: %s(%d)",  v5,  v10,  *__error());
        *a4 = (id)objc_claimAutoreleasedReturnValue(v11);
      }

      if (qword_1002EEF40 != -1) {
        dispatch_once(&qword_1002EEF40, &stru_10028A0C8);
      }
      v12 = (void *)qword_1002EEF48;
      if (os_log_type_enabled((os_log_t)qword_1002EEF48, OS_LOG_TYPE_ERROR))
      {
        v13 = v12;
        v14 = __error();
        v15 = strerror(*v14);
        int v16 = *__error();
        *(_DWORD *)buf = 138412802;
        id v28 = v5;
        __int16 v29 = 2080;
        v30 = v15;
        __int16 v31 = 1024;
        int v32 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "set protection class error for file %@: %s(%d)",  buf,  0x1Cu);
      }
    }

    close(v7);
  }

  else
  {
    if (a4)
    {
      uint64_t v17 = *__error();
      v18 = __error();
      v19 = strerror(*v18);
      v20 = +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  NSPOSIXErrorDomain,  v17,  @"open error for file %@: %s(%d)",  v5,  v19,  *__error());
      *a4 = (id)objc_claimAutoreleasedReturnValue(v20);
    }

    if (qword_1002EEF40 != -1) {
      dispatch_once(&qword_1002EEF40, &stru_10028A0E8);
    }
    v21 = (void *)qword_1002EEF48;
    if (os_log_type_enabled((os_log_t)qword_1002EEF48, OS_LOG_TYPE_ERROR))
    {
      v22 = v21;
      v23 = __error();
      v24 = strerror(*v23);
      int v25 = *__error();
      *(_DWORD *)buf = 138412802;
      id v28 = v5;
      __int16 v29 = 2080;
      v30 = v24;
      __int16 v31 = 1024;
      int v32 = v25;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "open error for file %@: %s(%d)", buf, 0x1Cu);
    }
  }

  return v7 != 0;
}

+ (id)applicationSupportPath:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLsForDirectory:14 inDomains:1]);

  if ([v5 count])
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:@"com.apple.transparencyd" isDirectory:1]);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    NSFileAttributeKey v15 = NSFileProtectionKey;
    NSFileProtectionType v16 = NSFileProtectionNone;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    unsigned int v10 = [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:v9 error:a3];

    id v11 = 0LL;
    if (v10) {
      id v11 = v7;
    }
  }

  else
  {
    if (a3) {
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorFile,  -37LL,  @"failed to get Application Support dir"));
    }
    if (qword_1002EEF40 != -1) {
      dispatch_once(&qword_1002EEF40, &stru_10028A108);
    }
    v12 = (os_log_s *)qword_1002EEF48;
    if (os_log_type_enabled((os_log_t)qword_1002EEF48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "failed to get Application Support dir",  v14,  2u);
    }

    id v11 = 0LL;
  }

  return v11;
}

+ (id)transparencyFilesPath:(id *)a3
{
  return _[a1 applicationSupportPath:a3];
}

+ (int64_t)directorySizeInKB:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyFileSupport transparencyFilesPath:]( &OBJC_CLASS___TransparencyFileSupport,  "transparencyFilesPath:",  a3));
  if (v5)
  {
    NSURLResourceKey v26 = NSURLFileSizeKey;
    int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
    int v7 = (void *)objc_claimAutoreleasedReturnValue( [v4 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:v6 options:0 error:a3]);

    if (v7)
    {
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v8 = v7;
      id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9)
      {
        id v10 = v9;
        v19 = v4;
        uint64_t v11 = 0LL;
        uint64_t v12 = *(void *)v22;
        while (2)
        {
          for (i = 0LL; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v8);
            }
            v14 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
            id v20 = 0LL;
            objc_msgSend(v14, "getResourceValue:forKey:error:", &v20, NSURLFileSizeKey, a3, v19);
            id v15 = v20;
            if (!v15)
            {
              int64_t v17 = -1LL;
              goto LABEL_14;
            }

            NSFileProtectionType v16 = v15;
            v11 += (uint64_t)[v15 unsignedIntegerValue];
          }

          id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v10) {
            continue;
          }
          break;
        }

        int64_t v17 = v11 / 1000;
LABEL_14:
        v4 = v19;
      }

      else
      {
        int64_t v17 = 0LL;
      }
    }

    else
    {
      int64_t v17 = -1LL;
    }
  }

  else
  {
    int64_t v17 = -1LL;
  }

  return v17;
}

+ (id)readDictionaryFromFile:(id)a3 inDirectory:(id)a4 error:(id *)a5
{
  int v6 = (void *)objc_claimAutoreleasedReturnValue([a4 URLByAppendingPathComponent:a3]);
  if (v6) {
    int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v6,  a5));
  }
  else {
    int v7 = 0LL;
  }

  return v7;
}

+ (id)readDictionaryFromFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = (void *)objc_claimAutoreleasedReturnValue([a1 transparencyFilesPath:a4]);
  if (v7) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 readDictionaryFromFile:v6 inDirectory:v7 error:a4]);
  }
  else {
    id v8 = 0LL;
  }

  return v8;
}

+ (id)readDataFromFile:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyFileSupport transparencyFilesPath:]( &OBJC_CLASS___TransparencyFileSupport,  "transparencyFilesPath:",  a4));
  int v7 = v6;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:v5]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v8,  0LL,  a4));
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

+ (BOOL)writeDictionaryToFile:(id)a3 fileName:(id)a4 inDirectory:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a5 URLByAppendingPathComponent:a4]);
  LODWORD(a4) = [v9 writeToURL:v10 error:a6];

  BOOL v11 = (_DWORD)a4
     && +[TransparencyFileSupport setProtectionToClassDForURL:error:]( &OBJC_CLASS___TransparencyFileSupport,  "setProtectionToClassDForURL:error:",  v10,  a6);

  return v11;
}

+ (BOOL)writeDictionaryToFile:(id)a3 fileName:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyFileSupport transparencyFilesPath:]( &OBJC_CLASS___TransparencyFileSupport,  "transparencyFilesPath:",  a5));
  if (v10) {
    unsigned __int8 v11 = [a1 writeDictionaryToFile:v8 fileName:v9 inDirectory:v10 error:a5];
  }
  else {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

+ (BOOL)deleteFile:(id)a3 inDirectory:(id)a4 error:(id *)a5
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a4 URLByAppendingPathComponent:a3]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  LOBYTE(a5) = [v7 removeItemAtURL:v6 error:a5];

  return (char)a5;
}

+ (BOOL)deleteFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyFileSupport transparencyFilesPath:]( &OBJC_CLASS___TransparencyFileSupport,  "transparencyFilesPath:",  a4));
  if (v7) {
    unsigned __int8 v8 = [a1 deleteFile:v6 inDirectory:v7 error:a4];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

@end