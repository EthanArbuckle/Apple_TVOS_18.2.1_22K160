@interface MIIPAPatcherFileManager
+ (id)defaultManager;
- (BOOL)copyFromURL:(id)a3 toURL:(id)a4 withError:(id *)a5;
- (BOOL)createDirectoryAtPath:(id)a3 relativeToURL:(id)a4 mode:(unsigned __int16)a5 withError:(id *)a6;
- (BOOL)createDirectoryAtURL:(id)a3 mode:(unsigned __int16)a4 withError:(id *)a5;
- (BOOL)enumerateDirectoryAtURL:(id)a3 includeTypes:(unint64_t)a4 withError:(id *)a5 enumerator:(id)a6;
- (BOOL)writeData:(id)a3 toFileURL:(id)a4 mode:(unsigned __int16)a5 withError:(id *)a6;
- (BOOL)writePlistRepresentation:(id)a3 toFileURL:(id)a4 mode:(unsigned __int16)a5 withError:(id *)a6;
- (id)dataFromFileURL:(id)a3 withError:(id *)a4;
- (id)dataFromPlistRepresentation:(id)a3 withError:(id *)a4;
- (id)directoriesOrderedByDepthFromFilePaths:(id)a3;
- (id)plistRepresentationFromData:(id)a3 withError:(id *)a4;
- (id)plistRepresentationFromFileURL:(id)a3 withError:(id *)a4;
@end

@implementation MIIPAPatcherFileManager

+ (id)defaultManager
{
  if (qword_100095AA8 != -1) {
    dispatch_once(&qword_100095AA8, &stru_100080D98);
  }
  return (id)qword_100095AA0;
}

- (id)dataFromFileURL:(id)a3 withError:(id *)a4
{
  return +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  a3,  1LL,  a4);
}

- (id)plistRepresentationFromFileURL:(id)a3 withError:(id *)a4
{
  return +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  a3,  a4);
}

- (BOOL)writeData:(id)a3 toFileURL:(id)a4 mode:(unsigned __int16)a5 withError:(id *)a6
{
  return [a3 writeToURL:a4 options:0 error:a6];
}

- (BOOL)writePlistRepresentation:(id)a3 toFileURL:(id)a4 mode:(unsigned __int16)a5 withError:(id *)a6
{
  uint64_t v7 = a5;
  id v10 = a4;
  id v18 = 0LL;
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[MIIPAPatcherFileManager dataFromPlistRepresentation:withError:]( self,  "dataFromPlistRepresentation:withError:",  a3,  &v18));
  id v12 = v18;
  v13 = v12;
  if (v11)
  {
    id v17 = v12;
    BOOL v14 = -[MIIPAPatcherFileManager writeData:toFileURL:mode:withError:]( self,  "writeData:toFileURL:mode:withError:",  v11,  v10,  v7,  &v17);
    id v15 = v17;

    v13 = v15;
    if (!a6) {
      goto LABEL_7;
    }
  }

  else
  {
    BOOL v14 = 0;
    if (!a6) {
      goto LABEL_7;
    }
  }

  if (!v14) {
    *a6 = v13;
  }
LABEL_7:

  return v14;
}

- (BOOL)enumerateDirectoryAtURL:(id)a3 includeTypes:(unint64_t)a4 withError:(id *)a5 enumerator:(id)a6
{
  id v8 = a3;
  v9 = (uint64_t (**)(id, void *, id *))a6;
  id v10 = v8;
  v11 = opendir((const char *)[v10 fileSystemRepresentation]);
  if (!v11)
  {
    uint64_t v20 = *__error();
    v29[0] = NSLocalizedDescriptionKey;
    v21 = objc_alloc(&OBJC_CLASS___NSString);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
    v23 = -[NSString initWithFormat:](v21, "initWithFormat:", @"Failed to open [%@] for enumeration", v22);
    v30[0] = v23;
    v30[1] = &off_10008A080;
    v29[1] = @"line";
    v29[2] = @"function";
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[MIIPAPatcherFileManager enumerateDirectoryAtURL:includeTypes:withError:enumerator:]"));
    v30[2] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  3LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v20,  v25));

    goto LABEL_30;
  }

  id v12 = 0LL;
  while (1)
  {
    v13 = readdir(v11);
    if (!v13) {
      break;
    }
    if (v13->d_name[0] != 46)
    {
      int d_type = v13->d_type;
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v13->d_name));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v10 URLByAppendingPathComponent:v15 isDirectory:0]);

      if (d_type) {
        goto LABEL_8;
      }
      memset(&v28, 0, sizeof(v28));
      if (stat((const char *)[v16 fileSystemRepresentation], &v28))
      {
LABEL_7:
        int d_type = 0;
        goto LABEL_8;
      }

      int v19 = v28.st_mode & 0xF000;
      switch(v19)
      {
        case 16384:
          int d_type = 4;
          break;
        case 32768:
          int d_type = 8;
          break;
        case 40960:
          int d_type = 10;
          break;
        default:
          goto LABEL_7;
      }

- (id)directoriesOrderedByDepthFromFilePaths:(id)a3
{
  id v3 = a3;
  v32 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  context = objc_autoreleasePoolPush();
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        else {
          v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByDeletingLastPathComponent]);
        }
        id v12 = v11;
        if ([v11 length])
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pathComponents]);
          -[NSMutableSet addObject:](v4, "addObject:", v13);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }

    while (v7);
  }

  stat v28 = v5;

  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( &OBJC_CLASS___NSMutableSet,  "setWithCapacity:",  -[NSMutableSet count](v4, "count")));
  if (-[NSMutableSet count](v4, "count"))
  {
    uint64_t v14 = 0LL;
    v30 = v4;
    do
    {
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      id v15 = v4;
      id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v33,  v41,  16LL);
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v34;
        ++v14;
        do
        {
          for (j = 0LL; j != v17; j = (char *)j + 1)
          {
            if (*(void *)v34 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)j);
            v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndexedSubscript:0]);
            unsigned int v22 = [v21 isEqual:@"/"];

            unint64_t v23 = v14 + v22;
            if ((unint64_t)[v20 count] >= v23)
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "subarrayWithRange:", 0, v14 + v22));
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v24));
            }
          }

          id v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v33,  v41,  16LL);
        }

        while (v17);
        v4 = v30;
      }

      else
      {
        ++v14;
      }

      -[NSMutableSet minusSet:](v15, "minusSet:", v31);
      [v31 removeAllObjects];
    }

    while (-[NSMutableSet count](v15, "count"));
  }

  objc_autoreleasePoolPop(context);
  id v26 = -[NSMutableArray copy](v32, "copy");

  return v26;
}

- (BOOL)createDirectoryAtURL:(id)a3 mode:(unsigned __int16)a4 withError:(id *)a5
{
  id v7 = a3;
  if (mkdir((const char *)[v7 fileSystemRepresentation], a4) && (uint64_t v8 = *__error(), (_DWORD)v8 != 17))
  {
    v11 = objc_alloc(&OBJC_CLASS___NSString);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
    v13 = -[NSString initWithFormat:]( v11,  "initWithFormat:",  @"Could not create directory at [%@]",  v12,  NSLocalizedDescriptionKey);
    v18[0] = v13;
    v18[1] = &off_10008A098;
    v17[1] = @"line";
    v17[2] = @"function";
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[MIIPAPatcherFileManager createDirectoryAtURL:mode:withError:]"));
    v18[2] = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL));
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v8,  v15));

    if (a5)
    {
      id v9 = v9;
      BOOL v10 = 0;
      *a5 = v9;
    }

    else
    {
      BOOL v10 = 0;
    }
  }

  else
  {
    id v9 = 0LL;
    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)createDirectoryAtPath:(id)a3 relativeToURL:(id)a4 mode:(unsigned __int16)a5 withError:(id *)a6
{
  uint64_t v7 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a4 URLByAppendingPathComponent:a3 isDirectory:1]);
  id v14 = 0LL;
  BOOL v10 = -[MIIPAPatcherFileManager createDirectoryAtURL:mode:withError:]( self,  "createDirectoryAtURL:mode:withError:",  v9,  v7,  &v14);
  id v11 = v14;
  id v12 = v11;
  if (a6 && !v10) {
    *a6 = v11;
  }

  return v10;
}

- (id)plistRepresentationFromData:(id)a3 withError:(id *)a4
{
  id v16 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  a3,  0LL,  0LL,  &v16));
  id v6 = v16;
  if (v5)
  {
    objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v5) & 1) != 0) {
      goto LABEL_7;
    }
    v17[0] = NSLocalizedDescriptionKey;
    uint64_t v7 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v8 = (objc_class *)objc_opt_class(v5);
    id v9 = NSStringFromClass(v8);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = -[NSString initWithFormat:](v7, "initWithFormat:", @"Plist data is not a dictionary, got [%@]", v10);
    v18[0] = v11;
    v18[1] = &off_10008A0B0;
    v17[1] = @"line";
    v17[2] = @"function";
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[MIIPAPatcherFileManager plistRepresentationFromData:withError:]"));
    v18[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL));
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  v13));

    id v6 = (id)v14;
  }

  if (a4)
  {
    id v6 = v6;
    id v5 = 0LL;
    *a4 = v6;
  }

  else
  {
    id v5 = 0LL;
  }

- (id)dataFromPlistRepresentation:(id)a3 withError:(id *)a4
{
  return +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  a3,  200LL,  0LL,  a4);
}

- (BOOL)copyFromURL:(id)a3 toURL:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  BOOL v10 = (const char *)[v9 fileSystemRepresentation];
  id v11 = v8;
  int v12 = copyfile(v10, (const char *)[v11 fileSystemRepresentation], 0, 0xC000Fu);
  if (v12)
  {
    uint64_t v21 = *__error();
    unsigned int v22 = a5;
    v23[0] = NSLocalizedDescriptionKey;
    v13 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
    id v16 = -[NSString initWithFormat:](v13, "initWithFormat:", @"Could not copy file from [%@] to [%@]", v14, v15);
    v24[0] = v16;
    v24[1] = &off_10008A0C8;
    v23[1] = @"line";
    v23[2] = @"function";
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[MIIPAPatcherFileManager copyFromURL:toURL:withError:]"));
    v24[2] = v17;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  3LL));
    id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v21,  v18));

    if (v22)
    {
      id v19 = v19;
      id *v22 = v19;
    }
  }

  else
  {
    id v19 = 0LL;
  }

  return v12 == 0;
}

@end