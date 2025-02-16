@interface NSData
- (id)_gkUnzippedData;
- (id)_gkZippedData;
- (void)_gkWriteToImageCacheWithURLString:(id)a3;
@end

@implementation NSData

- (id)_gkZippedData
{
  v2 = self;
  v3 = -[NSData bytes](v2, "bytes");
  id v4 = -[NSData length](v2, "length");
  v5 = 0LL;
  if (v3)
  {
    id v6 = v4;
    if (v4)
    {
      memset(&v13.avail_in, 0, 104);
      v13.avail_in = v4;
      v13.avail_out = v4;
      v13.next_in = v3;
      v7 = -[NSMutableData initWithLength:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", v4);
      v13.next_out = (Bytef *)-[NSMutableData mutableBytes](v7, "mutableBytes", v13.next_in, *(void *)&v13.avail_in);
      if (v7
        && !deflateInit2_(&v13, -1, 8, 31, 8, 0, "1.2.12", 112)
        && (int v8 = deflate(&v13, 4), v9 = deflateEnd(&v13), v8 == 1))
      {
        int v10 = v9;
        v11 = 0LL;
        if (!v10 && v6 == (id)v13.total_in)
        {
          -[NSMutableData setLength:](v7, "setLength:", v13.total_out);
          v11 = v7;
        }
      }

      else
      {
        v11 = 0LL;
      }

      v5 = v11;
    }
  }

  return v5;
}

- (id)_gkUnzippedData
{
  strm.avail_in = -[NSData length](self, "length");
  strm.next_in = (Bytef *)-[NSData bytes](self, "bytes");
  v3 = 0LL;
  if (!inflateInit2_(&strm, 31, "1.2.12", 112))
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    while (1)
    {
      strm.avail_out = 0x4000;
      strm.next_out = v8;
      unsigned int v4 = inflate(&strm, 0);
      if (v4 > 1) {
        break;
      }
      unsigned int v5 = v4;
      if (strm.avail_out != 0x4000) {
        -[NSMutableData appendBytes:length:](v3, "appendBytes:length:", v8, 0x4000 - strm.avail_out);
      }
      if (v5)
      {
        inflateEnd(&strm);
        return v3;
      }
    }

    inflateEnd(&strm);

    v3 = 0LL;
  }

  return v3;
}

- (void)_gkWriteToImageCacheWithURLString:(id)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", a3));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByDeletingLastPathComponent]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v8 = [v7 fileExistsAtPath:v6];

  if ((v8 & 1) == 0)
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v21 = 0LL;
    [v9 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v21];
    id v10 = v21;

    if (v10)
    {
      if (!os_log_GKGeneral) {
        id v12 = (id)GKOSLoggers(v11);
      }
      z_stream v13 = (os_log_s *)os_log_GKError;
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_100103E44((uint64_t)v10, v13);
      }
    }
  }

  id v20 = 0LL;
  -[NSData writeToFile:options:error:](self, "writeToFile:options:error:", v5, 1LL, &v20);
  id v14 = v20;
  v15 = v14;
  if (v14)
  {
    if (!os_log_GKGeneral) {
      id v16 = (id)GKOSLoggers(v14);
    }
    v17 = (os_log_s *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100103DC0((uint64_t)v5, (uint64_t)v15, v17);
    }
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v18 = (id)GKOSLoggers(0LL);
    }
    v19 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Saved new local player avatar image to image cache: %@",  buf,  0xCu);
    }

    _gkMarkFileAsPurgeable(v5);
  }
}

@end