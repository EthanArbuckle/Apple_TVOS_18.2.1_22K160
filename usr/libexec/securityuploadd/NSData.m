@interface NSData
- (id)supd_gzipDeflate;
@end

@implementation NSData

- (id)supd_gzipDeflate
{
  if (!-[NSData length](self, "length")) {
    return self;
  }
  memset(&v11.total_out, 0, 72);
  v3 = self;
  v11.avail_in = -[NSData length]( v3,  "length",  -[NSData bytes](v3, "bytes"),  (unsigned __int128)0,  (unsigned __int128)0);
  v4 = 0LL;
  if (!deflateInit2_(&v11, 9, 8, 31, 9, 0, "1.2.12", 112))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", 0x4000LL));
    do
    {
      uLong total_out = v11.total_out;
      id v7 = v5;
      v8 = (char *)[v7 mutableBytes];
      v11.next_out = (Bytef *)&v8[v11.total_out];
      unsigned int v9 = [v7 length];
      v11.avail_out = v9 - LODWORD(v11.total_out);
      deflate(&v11, 4);
    }

    while (!v11.avail_out);
    deflateEnd(&v11);
    [v7 setLength:v11.total_out];
    if (v11.avail_in) {
      v4 = 0LL;
    }
    else {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](&OBJC_CLASS___NSData, "dataWithData:", v7));
    }
  }

  return v4;
}

@end