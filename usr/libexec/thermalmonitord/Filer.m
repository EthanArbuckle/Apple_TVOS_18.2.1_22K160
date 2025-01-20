@interface Filer
+ (BOOL)writeDictionary:(id)a3 toFile:(id)a4;
+ (id)copyDictionaryFromFile:(id)a3;
- (BOOL)synchronizeToFile;
- (Filer)initWithFileName:(char *)a3 inDirectory:(char *)a4;
- (id)copyDictionaryFromFile;
- (id)copyValuesForKeys:(id)a3;
- (id)getValueForKey:(id)a3;
- (void)dealloc;
- (void)setMultiple:(id)a3 remove:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation Filer

+ (BOOL)writeDictionary:(id)a3 toFile:(id)a4
{
  v6 = objc_autoreleasePoolPush();
  v7 = +[NSOutputStream outputStreamToFileAtPath:append:]( &OBJC_CLASS___NSOutputStream,  "outputStreamToFileAtPath:append:",  a4,  0LL);
  -[NSOutputStream open](v7, "open");
  NSInteger v8 = +[NSPropertyListSerialization writePropertyList:toStream:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "writePropertyList:toStream:format:options:error:",  a3,  v7,  200LL,  0LL,  v11);
  -[NSOutputStream close](v7, "close");
  if (v8)
  {
    if (byte_10007CB30)
    {
      v9 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        NSInteger v13 = v8;
        __int16 v14 = 2112;
        id v15 = a4;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "<Notice> Wrote %ld bytes to file %@",  buf,  0x16u);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003D4E4();
  }

  objc_autoreleasePoolPop(v6);
  return v8 != 0;
}

+ (id)copyDictionaryFromFile:(id)a3
{
  v4 = objc_autoreleasePoolPush();
  v5 = +[NSInputStream inputStreamWithFileAtPath:](&OBJC_CLASS___NSInputStream, "inputStreamWithFileAtPath:", a3);
  -[NSInputStream open](v5, "open");
  id v6 = +[NSPropertyListSerialization propertyListWithStream:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithStream:options:format:error:",  v5,  2LL,  0LL,  v12);
  -[NSInputStream close](v5, "close");
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003D548();
    }
    goto LABEL_11;
  }

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003D5AC();
    }
LABEL_11:
    id v9 = 0LL;
    goto LABEL_6;
  }

  id v9 = v6;
  if (byte_10007CB30)
  {
    v10 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "<Notice> Successfully Read from file %@.",  buf,  0xCu);
    }
  }

- (id)copyDictionaryFromFile
{
  return  +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  self->_fileDict);
}

- (id)getValueForKey:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_fileDict, "objectForKey:", a3);
}

- (id)copyValuesForKeys:(id)a3
{
  v5 = -[NSMutableDictionary alloc](+[NSMutableDictionary init](&OBJC_CLASS___NSMutableDictionary, "init"), "alloc");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v11 = -[Filer getValueForKey:](self, "getValueForKey:", v10);
        if (v11) {
          -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v11, v10);
        }
      }

      id v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  return v5;
}

- (void)setMultiple:(id)a3 remove:(id)a4
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(a3);
        }
        -[Filer setValue:forKey:]( self,  "setValue:forKey:",  [a3 objectForKey:*(void *)(*((void *)&v19 + 1) + 8 * (void)v10)],  *(void *)(*((void *)&v19 + 1) + 8 * (void)v10));
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [a3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v8);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v11 = [a4 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      __int128 v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(a4);
        }
        -[Filer setValue:forKey:](self, "setValue:forKey:", 0LL, *(void *)(*((void *)&v15 + 1) + 8LL * (void)v14));
        __int128 v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [a4 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }

    while (v12);
  }

- (void)setValue:(id)a3 forKey:(id)a4
{
  fileDict = self->_fileDict;
  if (a3) {
    -[NSMutableDictionary setObject:forKey:](fileDict, "setObject:forKey:", a3, a4);
  }
  else {
    -[NSMutableDictionary removeObjectForKey:](fileDict, "removeObjectForKey:", a4);
  }
}

- (BOOL)synchronizeToFile
{
  return +[Filer writeDictionary:toFile:](&OBJC_CLASS___Filer, "writeDictionary:toFile:", self->_fileDict, self->_path);
}

- (Filer)initWithFileName:(char *)a3 inDirectory:(char *)a4
{
  v4 = 0LL;
  timespec v31 = (timespec)xmmword_1000484D0;
  if (a3 && a4)
  {
    id v8 = objc_autoreleasePoolPush();
    v30.receiver = self;
    v30.super_class = (Class)&OBJC_CLASS___Filer;
    v4 = -[Filer init](&v30, "init");
    if (!v4)
    {
LABEL_8:
      objc_autoreleasePoolPop(v8);
      return v4;
    }

    uint64_t v9 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a3);
    uint64_t v10 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a4);
    id v11 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
    if (gethostuuid(v38, &v31))
    {
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003D73C();
      }
LABEL_7:

      v4 = 0LL;
      goto LABEL_8;
    }

    v4->_path =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@.%02X%02X%02X%02X-%02X%02X-%02X%02X-%02X%02X-%02X%02X%02X%02X%02X%02X.plist",  v10,  v9,  v38[0],  v38[1],  v38[2],  v38[3],  v38[4],  v38[5],  v38[6],  v38[7],  v38[8],  v38[9],  v38[10],  v38[11],  v38[12],  v38[13],  v38[14],  v38[15]);
    p_path = &v4->_path;
    if (-[NSFileManager fileExistsAtPath:isDirectory:](v11, "fileExistsAtPath:isDirectory:", v10, &v33))
    {
      if (!v33)
      {
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_10003D60C();
        }
        goto LABEL_7;
      }
    }

    else if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v11,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v10,  0LL,  0LL,  v32))
    {
      __int128 v22 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003D6D4((uint64_t)v32, v22, v23, v24, v25, v26, v27, v28);
      }
      goto LABEL_7;
    }

    if (-[NSFileManager fileExistsAtPath:isDirectory:](v11, "fileExistsAtPath:isDirectory:", *p_path, &v33))
    {
      if (v33)
      {
        __int128 v14 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_10003D66C((uint64_t)&v4->_path, v14, v15, v16, v17, v18, v19, v20);
        }
        goto LABEL_7;
      }

      NSFileAttributeKey v34 = NSFilePosixPermissions;
      v35 = &off_100067C50;
      -[NSFileManager setAttributes:ofItemAtPath:error:]( v11,  "setAttributes:ofItemAtPath:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL),  *p_path,  v32);
    }

    else
    {
      __int128 v21 = *p_path;
      NSFileAttributeKey v36 = NSFilePosixPermissions;
      v37 = &off_100067C50;
      -[NSFileManager createFileAtPath:contents:attributes:]( v11,  "createFileAtPath:contents:attributes:",  v21,  0LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
    }

    v29 = +[Filer copyDictionaryFromFile:](&OBJC_CLASS___Filer, "copyDictionaryFromFile:", v4->_path);
    v4->_fileDict = v29;
    if (!v29) {
      v4->_fileDict = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    goto LABEL_8;
  }

  return v4;
}

- (void)dealloc
{
  self->_path = 0LL;
  self->_fileDict = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___Filer;
  -[Filer dealloc](&v3, "dealloc");
}

@end