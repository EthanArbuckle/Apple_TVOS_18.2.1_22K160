@interface MSDSignedManifestFactory
+ (id)createSignedManifestFromManifestFile:(id)a3;
+ (id)readManifestFromFile:(id)a3;
@end

@implementation MSDSignedManifestFactory

+ (id)createSignedManifestFromManifestFile:(id)a3
{
  id v3 = a3;
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[MSDSignedManifestFactory readManifestFromFile:]( &OBJC_CLASS___MSDSignedManifestFactory,  "readManifestFromFile:",  v3));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Version"]);
    unsigned int v8 = [v7 intValue];
    v9 = &off_1000F85B0;
    if (v8 != 7) {
      v9 = off_1000F85A8;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class signedManifestFromManifestData:](*v9, "signedManifestFromManifestData:", v6));
  }

  else
  {
    v10 = 0LL;
  }

  objc_autoreleasePoolPop(v4);

  return v10;
}

+ (id)readManifestFromFile:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) == 0)
  {
    id v20 = sub_10003A95C();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100095B04();
    }
    goto LABEL_28;
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithFileAtPath:](&OBJC_CLASS___NSInputStream, "inputStreamWithFileAtPath:", v3));
  if (!v6)
  {
    id v21 = sub_10003A95C();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100095898();
    }
    goto LABEL_28;
  }

  v7 = (void *)v6;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v7 scheduleInRunLoop:v8 forMode:NSDefaultRunLoopMode];

  [v7 open];
  id v26 = 0LL;
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithStream:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithStream:options:format:error:",  v7,  2LL,  0LL,  &v26));
  v10 = (os_log_s *)v26;
  [v7 close];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v7 removeFromRunLoop:v11 forMode:NSDefaultRunLoopMode];

  if (!v9)
  {
    id v22 = sub_10003A95C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100095904(v10, v9);
    }
    goto LABEL_27;
  }

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary, v12);
  if ((objc_opt_isKindOfClass(v9, v13) & 1) == 0)
  {
    id v23 = sub_10003A95C();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100095A98();
    }
    goto LABEL_26;
  }

  uint64_t v14 = objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v9, "objectForKey:", @"Version"));
  if (!v14)
  {
    id v25 = sub_10003A95C();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100095998();
    }
LABEL_26:

LABEL_27:
LABEL_28:
    v9 = 0LL;
    goto LABEL_12;
  }

  v15 = (void *)v14;
  if (+[MSDPlatform iOSHub](&OBJC_CLASS___MSDPlatform, "iOSHub")) {
    int v16 = 6;
  }
  else {
    int v16 = 7;
  }
  if ((int)[v15 intValue] < v16 || (int)objc_msgSend(v15, "intValue") >= 8)
  {
    id v18 = sub_10003A95C();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100095A04(v15, v19);
    }

    goto LABEL_28;
  }

LABEL_12:
  return v9;
}

@end