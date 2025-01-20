@interface NSURL
+ (id)fileURLWithString:(id)a3;
- (id)directoryHash;
- (id)fileHash;
@end

@implementation NSURL

+ (id)fileURLWithString:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"file://"])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", objc_msgSend(@"file://", "length")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v4));
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));
  }

  return v5;
}

- (id)fileHash
{
  if (-[NSURL isFileURL](self, "isFileURL"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self, "path"));
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForReadingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForReadingAtPath:",  v3));
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self, "absoluteString"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByRemovingPercentEncoding]);
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForReadingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForReadingAtPath:",  v5));
  }

  if (v4)
  {
    fcntl((int)[v4 fileDescriptor], 48, 1);
    CC_SHA1_Init(&c);
    while (1)
    {
      v6 = objc_autoreleasePoolPush();
      id v17 = 0LL;
      v7 = (void *)objc_claimAutoreleasedReturnValue([v4 readDataUpToLength:0x40000 error:&v17]);
      id v8 = v17;
      if (v8) {
        break;
      }
      if (![v7 length])
      {

        objc_autoreleasePoolPop(v6);
        CC_SHA1_Final(md, &c);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", md, 20LL));
        v10 = 0LL;
        goto LABEL_12;
      }

      id v9 = v7;
      CC_SHA1_Update(&c, [v9 bytes], (CC_LONG)objc_msgSend(v9, "length"));

      objc_autoreleasePoolPop(v6);
    }

    v10 = v8;

    objc_autoreleasePoolPop(v6);
    id v11 = sub_10003A95C();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100097808(self, (uint64_t)v10, v12);
    }

    v13 = 0LL;
LABEL_12:
    [v4 closeFile];
  }

  else
  {
    id v15 = sub_10003A95C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100097768(self, v16);
    }

    v13 = 0LL;
    v10 = 0LL;
  }

  return v13;
}

- (id)directoryHash
{
  return 0LL;
}

@end