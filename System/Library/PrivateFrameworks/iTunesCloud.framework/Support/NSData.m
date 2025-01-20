@interface NSData
+ (id)mappedDataWithContentsOfTemporaryFileURL:(id)a3 error:(id *)a4;
+ (id)stringByMD5HashingString:(id)a3;
+ (id)stringFromDigestData:(id)a3;
- (id)_dataByDeflatingWithNoZipHeaderWithCompression:(unint64_t)a3;
- (id)_dataByInflatingWithNoZipHeader;
- (id)dataByDeflatingWithNoZipHeader;
- (id)dataByInflatingWithNoZipHeader;
@end

@implementation NSData

- (id)dataByInflatingWithNoZipHeader
{
  return -[NSData _dataByInflatingWithNoZipHeader](self, "_dataByInflatingWithNoZipHeader");
}

- (id)dataByDeflatingWithNoZipHeader
{
  return -[NSData _dataByDeflatingWithNoZipHeaderWithCompression:]( self,  "_dataByDeflatingWithNoZipHeaderWithCompression:",  2LL);
}

- (id)_dataByInflatingWithNoZipHeader
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

- (id)_dataByDeflatingWithNoZipHeaderWithCompression:(unint64_t)a3
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

+ (id)mappedDataWithContentsOfTemporaryFileURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v5,  1LL,  a4));
  v7 = -[ICDDeleteOnDeallocTemporaryFile initWithTemporaryFileURL:]( objc_alloc(&OBJC_CLASS___ICDDeleteOnDeallocTemporaryFile),  "initWithTemporaryFileURL:",  v5);

  if (v7) {
    objc_setAssociatedObject(v6, @"_NSDataCloudAdditionsTemporaryFileKey", v7, (void *)1);
  }

  return v6;
}

+ (id)stringFromDigestData:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (char *)[v3 bytes];
  uint64_t v5 = (uint64_t)[v3 length];
  uint64_t v6 = 2 * v5;
  v7 = (char *)calloc(2 * v5, 1uLL);
  if (v5 >= 1)
  {
    uInt v8 = v7 + 1;
    do
    {
      *(v8 - 1) = a0123456789abcd[(unint64_t)*v4 >> 4];
      char v9 = *v4++;
      *uInt v8 = a0123456789abcd[v9 & 0xF];
      v8 += 2;
      --v5;
    }

    while (v5);
  }

  int v10 = -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytesNoCopy:length:encoding:freeWhenDone:",  v7,  v6,  4LL,  1LL);

  return v10;
}

+ (id)stringByMD5HashingString:(id)a3
{
  id v3 = a3;
  memset(v56, 0, sizeof(v56));
  CC_MD5_Init((CC_MD5_CTX *)v56);
  id v4 = v3;
  CC_MD5_Update((CC_MD5_CTX *)v56, [v4 UTF8String], (CC_LONG)objc_msgSend(v4, "length"));

  memset(&v57[8], 0, 64);
  *(void *)v57 = 4000LL;
  CC_MD5_Final(&v57[8], (CC_MD5_CTX *)v56);
  v58[0] = *(_OWORD *)v57;
  v58[1] = *(_OWORD *)&v57[16];
  v58[2] = *(_OWORD *)&v57[32];
  v58[3] = *(_OWORD *)&v57[48];
  uint64_t v59 = *(void *)&v57[64];
  if (*(uint64_t *)v57 > 3999)
  {
    if (*(uint64_t *)v57 > 4255)
    {
      if (*(void *)v57 == 4256LL)
      {
        v46 = (unsigned __int8 *)v58 + 8;
        v47 = (char *)calloc(0x40uLL, 1uLL);
        v48 = v47;
        for (uint64_t i = 0LL; i != 64; i += 2LL)
        {
          unsigned int v50 = *v46++;
          v51 = &v47[i];
          char *v51 = a0123456789abcd[(unint64_t)v50 >> 4];
          v51[1] = a0123456789abcd[v50 & 0xF];
        }

        v17 = objc_alloc(&OBJC_CLASS___NSString);
        v18 = v48;
        uint64_t v19 = 64LL;
      }

      else
      {
        if (*(void *)v57 != 4512LL) {
          goto LABEL_48;
        }
        v24 = (unsigned __int8 *)v58 + 8;
        v25 = (char *)calloc(0x80uLL, 1uLL);
        v26 = v25;
        for (uint64_t j = 0LL; j != 128; j += 2LL)
        {
          unsigned int v28 = *v24++;
          v29 = &v25[j];
          char *v29 = a0123456789abcd[(unint64_t)v28 >> 4];
          v29[1] = a0123456789abcd[v28 & 0xF];
        }

        v17 = objc_alloc(&OBJC_CLASS___NSString);
        v18 = v26;
        uint64_t v19 = 128LL;
      }
    }

    else if (*(void *)v57 == 4000LL)
    {
      v36 = (unsigned __int8 *)v58 + 8;
      v37 = (char *)calloc(0x20uLL, 1uLL);
      v38 = v37;
      for (uint64_t k = 0LL; k != 32; k += 2LL)
      {
        unsigned int v40 = *v36++;
        v41 = &v37[k];
        char *v41 = a0123456789abcd[(unint64_t)v40 >> 4];
        v41[1] = a0123456789abcd[v40 & 0xF];
      }

      v17 = objc_alloc(&OBJC_CLASS___NSString);
      v18 = v38;
      uint64_t v19 = 32LL;
    }

    else
    {
      if (*(void *)v57 != 4001LL) {
        goto LABEL_48;
      }
      int v11 = (unsigned __int8 *)v58 + 8;
      int v12 = (char *)calloc(0x28uLL, 1uLL);
      v13 = v12;
      for (uint64_t m = 0LL; m != 40; m += 2LL)
      {
        unsigned int v15 = *v11++;
        BOOL v16 = &v12[m];
        *BOOL v16 = a0123456789abcd[(unint64_t)v15 >> 4];
        v16[1] = a0123456789abcd[v15 & 0xF];
      }

      v17 = objc_alloc(&OBJC_CLASS___NSString);
      v18 = v13;
      uint64_t v19 = 40LL;
    }

@end