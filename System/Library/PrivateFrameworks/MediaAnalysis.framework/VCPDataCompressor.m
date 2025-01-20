@interface VCPDataCompressor
+ (id)compressor;
- (VCPDataCompressor)init;
- (id)compressData:(id)a3;
@end

@implementation VCPDataCompressor

- (VCPDataCompressor)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___VCPDataCompressor;
  v2 = -[VCPDataCompressor init](&v9, "init");
  if (v2)
  {
    size_t v3 = compression_encode_scratch_buffer_size(COMPRESSION_ZLIB);
    if (v3)
    {
      uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", v3));
      scratchData = v2->_scratchData;
      v2->_scratchData = (NSMutableData *)v4;
    }

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", 0x200000LL));
    resultData = v2->_resultData;
    v2->_resultData = (NSMutableData *)v6;
  }

  return v2;
}

+ (id)compressor
{
  return objc_alloc_init((Class)objc_opt_class(a1));
}

- (id)compressData:(id)a3
{
  resultData = self->_resultData;
  id v5 = a3;
  uint64_t v6 = -[NSMutableData mutableBytes](resultData, "mutableBytes");
  size_t v7 = -[NSMutableData length](self->_resultData, "length");
  id v8 = v5;
  objc_super v9 = (const uint8_t *)[v8 bytes];
  id v10 = [v8 length];

  v11 = (void *)compression_encode_buffer( v6,  v7,  v9,  (size_t)v10,  -[NSMutableData mutableBytes](self->_scratchData, "mutableBytes"),  COMPRESSION_ZLIB);
  if (v11) {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  -[NSMutableData mutableBytes](self->_resultData, "mutableBytes"),  v11,  0LL));
  }
  return v11;
}

- (void).cxx_destruct
{
}

@end