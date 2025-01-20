@interface TTKTestCaseReader
+ (id)loadFromDir:(id)a3;
+ (id)loadFromFile:(id)a3;
+ (id)loadFromFile:(id)a3 inputMode:(id)a4 layouts:(id)a5;
+ (id)loadFromPath:(id)a3;
+ (id)loadFromPath:(id)a3 fileManager:(id)a4;
@end

@implementation TTKTestCaseReader

+ (id)loadFromFile:(id)a3 inputMode:(id)a4 layouts:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_53C8();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_55888(v7);
  }

  v12 = objc_autoreleasePoolPush();
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSInputStream inputStreamWithFileAtPath:]( &OBJC_CLASS___NSInputStream,  "inputStreamWithFileAtPath:",  v7));
  [v13 open];
  if ([v13 streamStatus] == (char *)&dword_4 + 3)
  {
    id v14 = sub_53C8();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_55814((uint64_t)v7, v15);
    }

    [v13 close];
    id v16 = 0LL;
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithStream:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithStream:options:error:",  v13,  0LL,  0LL));
    id v16 = -[TTKFileSource init:inputMode:layouts:]( objc_alloc(&OBJC_CLASS___TTKFileSource),  "init:inputMode:layouts:",  v17,  v8,  v9);
    [v13 close];
  }

  objc_autoreleasePoolPop(v12);
  return v16;
}

+ (id)loadFromFile:(id)a3
{
  return [a1 loadFromFile:a3 inputMode:0 layouts:0];
}

+ (id)loadFromDir:(id)a3
{
  id v3 = a3;
  id v4 = -[TTKDirSource init:](objc_alloc(&OBJC_CLASS___TTKDirSource), "init:", v3);

  return v4;
}

+ (id)loadFromPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 loadFromPath:v4 fileManager:v5]);

  return v6;
}

+ (id)loadFromPath:(id)a3 fileManager:(id)a4
{
  id v6 = a3;
  char v11 = 0;
  unsigned int v7 = [a4 fileExistsAtPath:v6 isDirectory:&v11];
  if (v7 && v11)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([a1 loadFromDir:v6]);
  }

  else
  {
    if (!v7)
    {
      id v9 = 0LL;
      goto LABEL_8;
    }

    uint64_t v8 = objc_claimAutoreleasedReturnValue([a1 loadFromFile:v6]);
  }

  id v9 = (void *)v8;
LABEL_8:

  return v9;
}

@end