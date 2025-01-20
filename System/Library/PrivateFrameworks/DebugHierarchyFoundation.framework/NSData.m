@interface NSData
- (BOOL)dbg_isGzipped;
- (id)dbg_gzipDeflate;
- (id)dbg_gzipDeflateRaw;
- (id)dbg_gzipDeflateWithLevel:(int)a3 windowBits:(int)a4 memLevel:(int)a5;
- (id)dbg_gzipInflate;
- (id)dbg_gzipInflateIfCompressed;
- (id)dbg_gzipInflateRaw;
- (id)dbg_gzipInflateWithWindowBits:(int)a3;
@end

@implementation NSData

- (BOOL)dbg_isGzipped
{
  v2 = self;
  v3 = -[NSData bytes](v2, "bytes");
  return -[NSData length](v2, "length") >= 2 && *v3 == 31 && v3[1] == 139;
}

- (id)dbg_gzipInflateIfCompressed
{
  if (-[NSData dbg_isGzipped](self, "dbg_isGzipped")) {
    v3 = (NSData *)objc_claimAutoreleasedReturnValue(-[NSData dbg_gzipInflate](self, "dbg_gzipInflate"));
  }
  else {
    v3 = self;
  }
  return v3;
}

- (id)dbg_gzipInflate
{
  id v3 = DebugHierarchyGzipOSLog();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);
  v6 = v4;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    int v9 = 134217984;
    NSUInteger v10 = -[NSData length](self, "length");
    _os_signpost_emit_with_name_impl( &dword_0,  v7,  OS_SIGNPOST_INTERVAL_BEGIN,  v5,  "Inflate",  "Begin with size: %{xcode:size-in-bytes}lu",  (uint8_t *)&v9,  0xCu);
  }

  return (id)objc_claimAutoreleasedReturnValue( -[NSData dbg_gzipInflateWithWindowBits:]( self,  "dbg_gzipInflateWithWindowBits:",  47LL));
}

- (id)dbg_gzipInflateRaw
{
  return -[NSData dbg_gzipInflateWithWindowBits:](self, "dbg_gzipInflateWithWindowBits:", 4294967281LL);
}

- (id)dbg_gzipInflateWithWindowBits:(int)a3
{
  if (!-[NSData length](self, "length")) {
    return self;
  }
  NSUInteger v5 = -[NSData length](self, "length");
  NSUInteger v6 = -[NSData length](self, "length");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", v5 + (v6 >> 1)));
  v8 = self;
  v33.avail_in = -[NSData length](v8, "length", -[NSData bytes](v8, "bytes"));
  v33.zalloc = 0LL;
  v33.zfree = 0LL;
  v33.uLong total_out = 0LL;
  if (!inflateInit2_(&v33, a3, "1.2.12", 112))
  {
    NSUInteger v15 = v6 >> 1;
    do
    {
      uLong total_out = v33.total_out;
      id v17 = v7;
      v18 = (char *)[v17 mutableBytes];
      v33.next_out = (Bytef *)&v18[v33.total_out];
      unsigned int v19 = [v17 length];
      v33.avail_out = v19 - LODWORD(v33.total_out);
      int v20 = inflate(&v33, 2);
    }

    while (!v20);
    if (v20 == 1)
    {
      if (!inflateEnd(&v33))
      {
        [v17 setLength:v33.total_out];
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](&OBJC_CLASS___NSData, "dataWithData:", v17));
        id v22 = DebugHierarchyGzipOSLog();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        os_signpost_id_t v24 = os_signpost_id_make_with_pointer(v23, v8);
        v25 = v23;
        v13 = v25;
        if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
        {
          id v26 = [v21 length];
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v26;
          _os_signpost_emit_with_name_impl( &dword_0,  v13,  OS_SIGNPOST_INTERVAL_END,  v24,  "Inflate",  "Completed with size: %{xcode:size-in-bytes}lu",  buf,  0xCu);
        }

        goto LABEL_25;
      }
    }

    else if (!inflateEnd(&v33))
    {
      id v30 = DebugHierarchyGzipOSLog();
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v31, v8);
      v32 = v31;
      v13 = v32;
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v32)) {
        goto LABEL_24;
      }
      *(void *)buf = 67109120LL;
      goto LABEL_23;
    }

    id v27 = DebugHierarchyGzipOSLog();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v28, v8);
    v29 = v28;
    v13 = v29;
    if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v29)) {
      goto LABEL_24;
    }
    *(void *)buf = 67109120LL;
    goto LABEL_23;
  }

  id v9 = DebugHierarchyGzipOSLog();
  NSUInteger v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, v8);
  v12 = v10;
  v13 = v12;
  if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12)) {
    goto LABEL_24;
  }
  *(void *)buf = 67109120LL;
LABEL_23:
  _os_signpost_emit_with_name_impl( &dword_0,  v13,  OS_SIGNPOST_INTERVAL_END,  v11,  "Inflate",  "Completed with size: %{xcode:size-in-bytes}d",  buf,  8u);
LABEL_24:
  v21 = 0LL;
LABEL_25:

  return v21;
}

- (id)dbg_gzipDeflate
{
  id v3 = DebugHierarchyGzipOSLog();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);
  NSUInteger v6 = v4;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    int v9 = 134217984;
    NSUInteger v10 = -[NSData length](self, "length");
    _os_signpost_emit_with_name_impl( &dword_0,  v7,  OS_SIGNPOST_INTERVAL_BEGIN,  v5,  "Deflate",  "Begin with size: %{xcode:size-in-bytes}lu",  (uint8_t *)&v9,  0xCu);
  }

  return (id)objc_claimAutoreleasedReturnValue( -[NSData dbg_gzipDeflateWithLevel:windowBits:memLevel:]( self,  "dbg_gzipDeflateWithLevel:windowBits:memLevel:",  2LL,  31LL,  9LL));
}

- (id)dbg_gzipDeflateRaw
{
  return -[NSData dbg_gzipDeflateWithLevel:windowBits:memLevel:]( self,  "dbg_gzipDeflateWithLevel:windowBits:memLevel:",  2LL,  4294967281LL,  9LL);
}

- (id)dbg_gzipDeflateWithLevel:(int)a3 windowBits:(int)a4 memLevel:(int)a5
{
  if (-[NSData length](self, "length"))
  {
    strm.uLong total_out = 0LL;
    memset(&strm.zalloc, 0, 24);
    int v9 = self;
    strm.next_in = (Bytef *)-[NSData bytes](v9, "bytes");
    strm.avail_in = -[NSData length](v9, "length");
    if (deflateInit2_(&strm, a3, 8, a4, a5, 0, "1.2.12", 112))
    {
      id v10 = DebugHierarchyGzipOSLog();
      os_signpost_id_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, v9);
      v13 = v11;
      v14 = v13;
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        int v31 = 67109120;
        LODWORD(v32) = 0;
        _os_signpost_emit_with_name_impl( &dword_0,  v14,  OS_SIGNPOST_INTERVAL_END,  v12,  "Deflate",  "Completed with size: %{xcode:size-in-bytes}d",  (uint8_t *)&v31,  8u);
      }

      NSUInteger v15 = 0LL;
      v16 = v14;
    }

    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", 0x4000LL));
      do
      {
        uLong total_out = strm.total_out;
        v16 = v23;
        v25 = (char *)-[os_log_s mutableBytes](v16, "mutableBytes");
        strm.next_out = (Bytef *)&v25[strm.total_out];
        unsigned int v26 = -[os_log_s length](v16, "length");
        strm.avail_out = v26 - LODWORD(strm.total_out);
        deflate(&strm, 4);
      }

      while (!strm.avail_out);
      deflateEnd(&strm);
      -[os_log_s setLength:](v16, "setLength:", strm.total_out);
      NSUInteger v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](&OBJC_CLASS___NSData, "dataWithData:", v16));
      id v27 = DebugHierarchyGzipOSLog();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      os_signpost_id_t v29 = os_signpost_id_make_with_pointer(v28, v9);
      id v30 = v28;
      v14 = v30;
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        int v31 = 134217984;
        id v32 = [v15 length];
        _os_signpost_emit_with_name_impl( &dword_0,  v14,  OS_SIGNPOST_INTERVAL_END,  v29,  "Deflate",  "Completed with size: %{xcode:size-in-bytes}lu",  (uint8_t *)&v31,  0xCu);
      }
    }

    return v15;
  }

  else
  {
    id v17 = DebugHierarchyGzipOSLog();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v18, self);
    int v20 = v18;
    v21 = v20;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      strm.next_in = (Bytef *)67109120;
      _os_signpost_emit_with_name_impl( &dword_0,  v21,  OS_SIGNPOST_INTERVAL_END,  v19,  "Deflate",  "Completed with size: %{xcode:size-in-bytes}d",  (uint8_t *)&strm,  8u);
    }

    return self;
  }

@end