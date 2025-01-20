@interface MSDPartialDownload
- (BOOL)didProgress;
- (BOOL)isDownloadComplete;
- (MSDPartialDownload)init;
- (MSDPartialDownload)initWithFilePath:(id)a3;
- (NSString)fileDownloading;
- (id)description;
- (id)getRangeHeaderForDownload;
- (int64_t)downloadedBytes;
- (int64_t)existingFileSize;
- (int64_t)lastDownloadedByte;
- (int64_t)totalFileSize;
- (void)appendDownloadedFileSize:(int64_t)a3;
- (void)processServerRangeResponse:(id)a3;
- (void)pushToTestLog:(id)a3;
- (void)recordDownloadedBytes;
- (void)setDownloadedBytes:(int64_t)a3;
- (void)setExistingFileSize:(int64_t)a3;
- (void)setFileDownloading:(id)a3;
- (void)setLastDownloadedByte:(int64_t)a3;
- (void)setTotalFileSize:(int64_t)a3;
@end

@implementation MSDPartialDownload

- (MSDPartialDownload)init
{
  return self;
}

- (MSDPartialDownload)initWithFilePath:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MSDPartialDownload;
  v5 = -[MSDPartialDownload init](&v10, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    if ([v6 fileExistsAtPath:v4])
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v6 attributesOfItemAtPath:v4 error:0]);
      -[MSDPartialDownload setExistingFileSize:](v5, "setExistingFileSize:", [v7 fileSize]);
    }

    else
    {
      -[MSDPartialDownload setExistingFileSize:](v5, "setExistingFileSize:", 0LL);
    }

    -[MSDPartialDownload setTotalFileSize:](v5, "setTotalFileSize:", -1LL);
    -[MSDPartialDownload setDownloadedBytes:](v5, "setDownloadedBytes:", 0LL);
    -[MSDPartialDownload setLastDownloadedByte:](v5, "setLastDownloadedByte:", 0LL);
    v8 = v5;
  }

  return v5;
}

- (BOOL)isDownloadComplete
{
  int64_t v3 = -[MSDPartialDownload downloadedBytes](self, "downloadedBytes");
  int64_t v4 = -[MSDPartialDownload existingFileSize](self, "existingFileSize");
  if (-[MSDPartialDownload totalFileSize](self, "totalFileSize") != -1)
  {
    v5 = (void *)(v4 + v3);
    if (-[MSDPartialDownload totalFileSize](self, "totalFileSize") < (uint64_t)v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  @"Downloaded file size went bigger than total size",  @"testEventAdditionalData",  &off_100106378,  @"testLogLevel",  0LL));
      id v7 = sub_10003A95C();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        int64_t v11 = -[MSDPartialDownload totalFileSize](self, "totalFileSize");
        __int16 v12 = 2048;
        int64_t v13 = -[MSDPartialDownload downloadedBytes](self, "downloadedBytes");
        __int16 v14 = 2048;
        int64_t v15 = -[MSDPartialDownload existingFileSize](self, "existingFileSize");
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Error happened totalFileSize = %ld downloadContentSize=%ld existingFileSize=%ld",  buf,  0x20u);
      }

      return 1;
    }
  }

  return 0;
}

- (BOOL)didProgress
{
  uint64_t v3 = -[MSDPartialDownload downloadedBytes](self, "downloadedBytes");
  return v3 > -[MSDPartialDownload lastDownloadedByte](self, "lastDownloadedByte");
}

- (void)recordDownloadedBytes
{
}

- (id)getRangeHeaderForDownload
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld",  (char *)-[MSDPartialDownload existingFileSize](self, "existingFileSize")
                 + -[MSDPartialDownload downloadedBytes](self, "downloadedBytes")));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"bytes=%@-%@",  v2,  &stru_1000FB848));

  return v3;
}

- (void)processServerRangeResponse:(id)a3
{
  id v9 = a3;
  if (-[MSDPartialDownload totalFileSize](self, "totalFileSize") == -1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v9 componentsSeparatedByString:@"/"]);
    int64_t v4 = v5;
    if (v5)
    {
      if ([v5 count] == (id)2)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:1]);
        id v7 = [v6 longLongValue];

        if (v7)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:1]);
          -[MSDPartialDownload setTotalFileSize:](self, "setTotalFileSize:", [v8 longLongValue]);
        }
      }
    }
  }

  else
  {
    int64_t v4 = 0LL;
  }
}

- (void)appendDownloadedFileSize:(int64_t)a3
{
}

- (id)description
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"TotalFileSize: %ld\t",  -[MSDPartialDownload totalFileSize](self, "totalFileSize")));
  objc_msgSend( v3,  "appendFormat:",  @"DownloadedBytes: %ld",  -[MSDPartialDownload downloadedBytes](self, "downloadedBytes"));
  return v3;
}

- (void)pushToTestLog:(id)a3
{
  id v11 = a3;
  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPartialDownload fileDownloading](self, "fileDownloading"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingString:@" -> "]);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPartialDownload description](self, "description"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingString:v6]);

    if (v11) {
      v8 = (NSMutableDictionary *)[v11 mutableCopy];
    }
    else {
      v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    id v9 = v8;
    if (v7)
    {
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestInterface sharedInstance](&OBJC_CLASS___MSDTestInterface, "sharedInstance"));
      [v10 pushTestEvent:v7 ofType:@"partialRangeStatus"];
    }
  }
}

- (int64_t)totalFileSize
{
  return self->_totalFileSize;
}

- (void)setTotalFileSize:(int64_t)a3
{
  self->_totalFileSize = a3;
}

- (int64_t)downloadedBytes
{
  return self->_downloadedBytes;
}

- (void)setDownloadedBytes:(int64_t)a3
{
  self->_downloadedBytes = a3;
}

- (int64_t)existingFileSize
{
  return self->_existingFileSize;
}

- (void)setExistingFileSize:(int64_t)a3
{
  self->_existingFileSize = a3;
}

- (int64_t)lastDownloadedByte
{
  return self->_lastDownloadedByte;
}

- (void)setLastDownloadedByte:(int64_t)a3
{
  self->_lastDownloadedByte = a3;
}

- (NSString)fileDownloading
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setFileDownloading:(id)a3
{
}

- (void).cxx_destruct
{
}

@end