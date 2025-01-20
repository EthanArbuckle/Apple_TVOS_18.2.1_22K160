@interface NSData
+ (id)MZStringByMD5HashingString:(id)a3;
+ (id)MZStringFromDigestData:(id)a3;
- (id)MZDataByDeflatingWithGZip;
- (id)MZDataByDeflatingWithNoZipHeader;
- (id)MZDataByInflatingWithGZip;
- (id)MZDataByInflatingWithNoZipHeader;
- (id)_MZDataByDeflatingWithCompression:(unint64_t)a3;
- (id)_MZDataByInflating;
@end

@implementation NSData

- (id)_MZDataByInflating
{
  v2 = self;
  if (-[NSData length](v2, "length") >> 32)
  {
    NSLog( @"ERROR: unable to zip large data of size ~%.3f GB",  (double)-[NSData length](v2, "length") / 1000000000.0);
  }

  else
  {
    memset(&strm.avail_in, 0, 104);
    strm.avail_in = -[NSData length](v2, "length");
    strm.next_in = (Bytef *)-[NSData bytes](v2, "bytes");
    v3 = 0LL;
    if (inflateInit2_(&strm, -15, "1.2.12", 112)) {
      goto LABEL_11;
    }
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
        goto LABEL_11;
      }
    }

    inflateEnd(&strm);
  }

  v3 = 0LL;
LABEL_11:

  return v3;
}

- (id)_MZDataByDeflatingWithCompression:(unint64_t)a3
{
  unsigned int v4 = self;
  if (-[NSData length](v4, "length") < 0xFFFFFFFF)
  {
    v6 = v4;
    v7 = -[NSData bytes](v6, "bytes");
    uInt v8 = -[NSData length](v6, "length");
    v9 = -[NSMutableData initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithCapacity:", (v8 >> 1) + 1);
    unsigned int v5 = 0LL;
    if (!v7 || !v8) {
      goto LABEL_22;
    }
    memset(&strm, 0, sizeof(strm));
    if (a3 == 1) {
      int v10 = 1;
    }
    else {
      int v10 = -1;
    }
    strm.avail_out = 0x4000;
    if (a3 == 2) {
      int v11 = 9;
    }
    else {
      int v11 = v10;
    }
    strm.next_out = v19;
    if (deflateInit2_(&strm, v11, 8, -15, 9, 0, "1.2.12", 112))
    {
      NSLog(@"deflateInit2() failed: %s", strm.msg);
    }

    else
    {
      strm.avail_in = v8;
      strm.next_in = v7;
      do
      {
        if (!strm.avail_out)
        {
          -[NSMutableData appendBytes:length:](v9, "appendBytes:length:", v19, 0x4000LL);
          strm.avail_out = 0x4000;
          strm.next_out = v19;
        }

        int v12 = deflate(&strm, 0);
      }

      while (!v12 && strm.avail_in);
      if (!v12)
      {
        if (strm.next_out)
        {
          do
          {
            int v14 = deflate(&strm, 4);
            next_out = strm.next_out;
            -[NSMutableData appendBytes:length:](v9, "appendBytes:length:", v19, strm.next_out - v19);
            BOOL v16 = next_out > v19 && v14 == -5;
            strm.avail_out = 0x4000;
            strm.next_out = v19;
          }

          while (v16 || v14 == 0);
          strm.avail_out = 0;
          strm.next_out = 0LL;
          deflateEnd(&strm);
          if (v14 != -5 && v14 != 1)
          {
            NSLog(@"deflate() failed: %s", strm.msg);
            goto LABEL_21;
          }
        }

        else
        {
          deflateEnd(&strm);
        }

        unsigned int v5 = v9;
        goto LABEL_22;
      }

      NSLog(@"deflate() failed: %s", strm.msg);
    }

    deflateEnd(&strm);
LABEL_21:
    unsigned int v5 = 0LL;
LABEL_22:

    goto LABEL_23;
  }

  NSLog( @"ERROR: unable to zip large data of size ~%.3f GB",  (double)-[NSData length](v4, "length") / 1000000000.0);
  unsigned int v5 = 0LL;
LABEL_23:

  return v5;
}

+ (id)MZStringFromDigestData:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (unint64_t)[v3 length];
  id v5 = v3;
  v6 = (unsigned __int8 *)[v5 bytes];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 2 * v4));
  if (v4)
  {
    uint64_t v8 = 0LL;
    unsigned int v9 = 1;
    do
    {
      objc_msgSend(v7, "appendFormat:", @"%02x", v6[v8]);
      uint64_t v8 = v9;
    }

    while (v4 > v9++);
  }

  return v7;
}

+ (id)MZStringByMD5HashingString:(id)a3
{
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 dataUsingEncoding:4]);
  if ([v4 length] && CC_MD5_Init(&c))
  {
    id v5 = v4;
    v6 = (char *)[v5 bytes];
    unint64_t v7 = 0LL;
    while (1)
    {
      uint64_t v8 = (char *)[v5 length];
      uint64_t v9 = (unint64_t)&v8[-v7] >= 0xFFFF ? 0xFFFFLL : (uint64_t)&v8[-v7];
      if (!CC_MD5_Update(&c, &v6[v7], v9)) {
        break;
      }
      v7 += v9;
      if (v7 >= (unint64_t)[v5 length])
      {
        if (!CC_MD5_Final(md, &c)) {
          break;
        }
        int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", md, 16LL));
        int v11 = (void *)objc_claimAutoreleasedReturnValue([a1 MZStringFromDigestData:v10]);

        goto LABEL_12;
      }
    }
  }

  int v11 = 0LL;
LABEL_12:

  return v11;
}

- (id)MZDataByInflatingWithNoZipHeader
{
  return -[NSData _MZDataByInflating](self, "_MZDataByInflating");
}

- (id)MZDataByDeflatingWithNoZipHeader
{
  return -[NSData _MZDataByDeflatingWithCompression:](self, "_MZDataByDeflatingWithCompression:", 2LL);
}

- (id)MZDataByInflatingWithGZip
{
  return -[NSData _MZDataByInflating](self, "_MZDataByInflating");
}

- (id)MZDataByDeflatingWithGZip
{
  return -[NSData _MZDataByDeflatingWithCompression:](self, "_MZDataByDeflatingWithCompression:", 2LL);
}

@end