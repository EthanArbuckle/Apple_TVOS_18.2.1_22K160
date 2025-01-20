@interface MSDiOSApp
+ (id)appWithPath:(id)a3;
- (BOOL)isAlmondApp;
- (MSDiOSApp)initWithPath:(id)a3;
- (NSDictionary)info;
- (NSString)path;
- (id)codeSignaturePathForAlmondApp;
- (id)getCodeResourcesURL;
- (id)getExcutableURL;
- (id)serachForFileWithSuffix:(id)a3 inFolder:(id)a4;
- (id)uniqueIdentifier;
- (id)versionInfo;
- (void)dealloc;
- (void)setInfo:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation MSDiOSApp

+ (id)appWithPath:(id)a3
{
  id v3 = a3;
  v4 = -[MSDiOSApp initWithPath:](objc_alloc(&OBJC_CLASS___MSDiOSApp), "initWithPath:", v3);

  return v4;
}

- (MSDiOSApp)initWithPath:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MSDiOSApp;
  v5 = -[MSDiOSApp init](&v16, "init");
  if (!v5)
  {
    v10 = 0LL;
    goto LABEL_8;
  }

  if ([v4 rangeOfString:@".app"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = sub_10003A95C();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10009519C();
    }
    goto LABEL_16;
  }

  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v4));
  if (!v6)
  {
    id v13 = sub_10003A95C();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100095200();
    }
    goto LABEL_16;
  }

  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s infoDictionary](v6, "infoDictionary"));

  if (!v8)
  {
    id v14 = sub_10003A95C();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100095264();
    }

LABEL_16:
    v10 = 0LL;
    goto LABEL_6;
  }

  -[MSDiOSApp setPath:](v5, "setPath:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s infoDictionary](v7, "infoDictionary"));
  -[MSDiOSApp setInfo:](v5, "setInfo:", v9);

  v10 = v5;
LABEL_6:

LABEL_8:
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSDiOSApp;
  -[MSDiOSApp dealloc](&v3, "dealloc");
}

- (id)uniqueIdentifier
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp getExcutableURL](self, "getExcutableURL"));
  id v4 = sub_10003A95C();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (!v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000952C8(self, v6);
    }

    goto LABEL_23;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
    buf.h0 = 136315394;
    *(void *)&buf.h1 = "-[MSDiOSApp uniqueIdentifier]";
    LOWORD(buf.h3) = 2114;
    *(void *)((char *)&buf.h3 + 2) = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s - executableFileURL:  %{public}@",  (uint8_t *)&buf,  0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp getCodeResourcesURL](self, "getCodeResourcesURL"));
  id v9 = sub_10003A95C();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (!v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100095354(self, v11);
    }

LABEL_23:
    v8 = 0LL;
LABEL_27:
    objc_super v16 = 0LL;
    v19 = 0LL;
    v22 = 0LL;
    goto LABEL_16;
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
    buf.h0 = 136315394;
    *(void *)&buf.h1 = "-[MSDiOSApp uniqueIdentifier]";
    LOWORD(buf.h3) = 2114;
    *(void *)((char *)&buf.h3 + 2) = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s - codeResourcesURL:  %{public}@",  (uint8_t *)&buf,  0x16u);
  }

  CC_SHA1_Init(&buf);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSInputStream inputStreamWithFileAtPath:]( &OBJC_CLASS___NSInputStream,  "inputStreamWithFileAtPath:",  v13));

  if (!v14)
  {
    id v24 = sub_10003A95C();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1000953E0(v3, v25);
    }

    goto LABEL_27;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v14 scheduleInRunLoop:v15 forMode:NSDefaultRunLoopMode];

  [v14 open];
  objc_super v16 = calloc(0x40000uLL, 1uLL);
  uint64_t v17 = (uint64_t)[v14 read:v16 maxLength:0x40000];
  if (v17 >= 1)
  {
    do
    {
      CC_SHA1_Update(&buf, v16, v17);
      uint64_t v17 = (uint64_t)[v14 read:v16 maxLength:0x40000];
    }

    while (v17 > 0);
  }

  if (v17)
  {
    id v26 = sub_10003A95C();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100095460(v3, v27);
    }
  }

  else
  {
    [v14 close];
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSInputStream inputStreamWithFileAtPath:]( &OBJC_CLASS___NSInputStream,  "inputStreamWithFileAtPath:",  v18));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
      [v19 scheduleInRunLoop:v20 forMode:NSDefaultRunLoopMode];

      [v19 open];
      uint64_t v21 = (uint64_t)[v19 read:v16 maxLength:0x40000];
      if (v21 >= 1)
      {
        do
        {
          CC_SHA1_Update(&buf, v16, v21);
          uint64_t v21 = (uint64_t)[v19 read:v16 maxLength:0x40000];
        }

        while (v21 > 0);
      }

      if (!v21)
      {
        [v19 close];
        free(v16);
        CC_SHA1_Final(md, &buf);
        objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", md, 20LL));
        v22 = (void *)objc_claimAutoreleasedReturnValue([v16 hexStringRepresentation]);
        goto LABEL_16;
      }

      id v29 = sub_10003A95C();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_100095460(v8, v27);
      }
      id v14 = v19;
    }

    else
    {
      id v28 = sub_10003A95C();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1000953E0(v8, v27);
      }
      id v14 = 0LL;
    }
  }

  if (v16)
  {
    free(v16);
    objc_super v16 = 0LL;
  }

  v22 = 0LL;
  v19 = v14;
LABEL_16:

  return v22;
}

- (id)versionInfo
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp info](self, "info"));
  id v4 = @"CFBundleShortVersionString";
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"CFBundleShortVersionString"]);

  if (v5)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString, v6);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) == 0)
    {
      id v8 = sub_10003A95C();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100095544(v9, v10, v11);
      }

      id v12 = 0LL;
      id v4 = @"CFBundleShortVersionString";
      goto LABEL_9;
    }

- (id)getExcutableURL
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp path](self, "path"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v3));

  if (!v4)
  {
    id v7 = sub_10003A95C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000955B8(self, v8);
    }
    goto LABEL_8;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 executableURL]);
  if (!v5)
  {
    id v9 = sub_10003A95C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100095638(self, v8);
    }
LABEL_8:

    v5 = 0LL;
  }

  return v5;
}

- (id)getCodeResourcesURL
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp path](self, "path"));
  unsigned int v4 = +[MSDMacAppPkg isMacApp:](&OBJC_CLASS___MSDMacAppPkg, "isMacApp:", v3);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp path](self, "path"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[MSDMacAppPkg codeSignaturePath:](&OBJC_CLASS___MSDMacAppPkg, "codeSignaturePath:", v5));
  }

  else
  {
    if (-[MSDiOSApp isAlmondApp](self, "isAlmondApp"))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp codeSignaturePathForAlmondApp](self, "codeSignaturePathForAlmondApp"));
      goto LABEL_7;
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp path](self, "path"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"_CodeSignature"]);
  }

  id v7 = (void *)v6;

LABEL_7:
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:@"CodeResources"]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp path](self, "path"));
    NSLog(@"Error - Failed to get CodeSignature path for app:  %@", v8);
    id v9 = 0LL;
  }

  return v9;
}

- (BOOL)isAlmondApp
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp path](self, "path"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"Wrapper"]);

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3 isDirectory:&v8];

  if (v8) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)codeSignaturePathForAlmondApp
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDiOSApp path](self, "path"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"Wrapper"]);

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( -[MSDiOSApp serachForFileWithSuffix:inFolder:]( self,  "serachForFileWithSuffix:inFolder:",  @".app",  v4));
  if (v5)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@/%@",  v4,  v5,  @"_CodeSignature"));
  }

  else
  {
    id v8 = sub_10003A95C();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000956B8();
    }

    BOOL v6 = 0LL;
  }

  return v6;
}

- (id)serachForFileWithSuffix:(id)a3 inFolder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v22 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 contentsOfDirectoryAtPath:v6 error:&v22]);
  id v9 = v22;

  if (v8)
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      id v12 = 0LL;
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        uint64_t v14 = 0LL;
        uint64_t v15 = v12;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          id v12 = *(id *)(*((void *)&v18 + 1) + 8LL * (void)v14);

          if (objc_msgSend(v12, "hasSuffix:", v5, (void)v18))
          {
            id v11 = v12;

            id v10 = v11;
            goto LABEL_12;
          }

          uint64_t v14 = (char *)v14 + 1;
          uint64_t v15 = v12;
        }

        while (v11 != v14);
        id v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }

  else
  {
    id v17 = sub_10003A95C();
    id v10 = (id)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      sub_100095728((uint64_t)v6, v9, (os_log_s *)v10);
    }
    id v11 = 0LL;
  }

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPath:(id)a3
{
}

- (NSDictionary)info
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end