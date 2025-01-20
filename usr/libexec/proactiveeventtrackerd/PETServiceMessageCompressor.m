@interface PETServiceMessageCompressor
+ (id)decompress:(id)a3;
- (NSMutableData)compressedMessages;
- (PETServiceMessageCompressor)init;
- (void)_errorClose;
- (void)_flushBuffer;
- (void)addMessage:(id)a3;
- (void)close;
- (void)setCompressedMessages:(id)a3;
@end

@implementation PETServiceMessageCompressor

- (PETServiceMessageCompressor)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PETServiceMessageCompressor;
  v2 = -[PETServiceMessageCompressor init](&v11, "init");
  if (!v2) {
    goto LABEL_4;
  }
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableData);
  v4 = (void *)*((void *)v2 + 1);
  *((void *)v2 + 1) = v3;

  v5 = -[NSMutableData initWithLength:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", 0x10000LL);
  v6 = (void *)*((void *)v2 + 2);
  *((void *)v2 + 2) = v5;

  if (compression_stream_init((compression_stream *)(v2 + 24), COMPRESSION_STREAM_ENCODE, COMPRESSION_ZLIB) != COMPRESSION_STATUS_ERROR)
  {
    *((void *)v2 + 3) = [*((id *)v2 + 2) mutableBytes];
    *((void *)v2 + 4) = 0x10000LL;
    v7 = objc_opt_new(&OBJC_CLASS___NSMutableData);
    [v2 setCompressedMessages:v7];

    v2[64] = 0;
LABEL_4:
    v8 = v2;
    goto LABEL_8;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v10 = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to initialize the compressor",  v10,  2u);
  }

  v8 = 0LL;
LABEL_8:

  return v8;
}

- (void)addMessage:(id)a3
{
  if (!self->_closed)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue([a3 data]);
    v4 = malloc(0xAuLL);
    -[NSMutableData appendBytes:length:]( self->_srcBuf,  "appendBytes:length:",  v4,  PBDataWriterWriteBareVarint(v4, [v5 length]));
    -[NSMutableData appendData:](self->_srcBuf, "appendData:", v5);
    if (-[NSMutableData length](self->_srcBuf, "length") >= 0x10000) {
      -[PETServiceMessageCompressor _flushBuffer](self, "_flushBuffer");
    }
    free(v4);
  }

- (void)_flushBuffer
{
  v3 = self->_srcBuf;
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableData);
  srcBuf = self->_srcBuf;
  self->_srcBuf = v4;

  v6 = v3;
  self->_stream.src_ptr = (char *)-[NSMutableData bytes](v6, "bytes");
  NSUInteger v7 = -[NSMutableData length](v6, "length");
  self->_stream.src_size = v7;
  if (v7)
  {
    while (compression_stream_process((compression_stream *)&self->_stream, 0) != COMPRESSION_STATUS_ERROR)
    {
      unint64_t v8 = 0x10000 - self->_stream.dst_size;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](self, "compressedMessages"));
      objc_msgSend(v9, "appendBytes:length:", -[NSMutableData bytes](self->_dstBuf, "bytes"), v8);

      self->_stream.dst_ptr = (char *)-[NSMutableData mutableBytes](self->_dstBuf, "mutableBytes");
      self->_stream.dst_size = 0x10000LL;
      if (!self->_stream.src_size) {
        goto LABEL_8;
      }
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Error while compressing the source buffer",  (uint8_t *)v10,  2u);
    }

    -[PETServiceMessageCompressor _errorClose](self, "_errorClose");
  }

- (void)_errorClose
{
  self->_closed = 1;
  -[PETServiceMessageCompressor setCompressedMessages:](self, "setCompressedMessages:", 0LL);
  compression_stream_destroy((compression_stream *)&self->_stream);
}

- (void)close
{
  if (!self->_closed)
  {
    -[PETServiceMessageCompressor _flushBuffer](self, "_flushBuffer");
    while (1)
    {
      compression_status v3 = compression_stream_process((compression_stream *)&self->_stream, 1);
      if (v3 == COMPRESSION_STATUS_ERROR) {
        break;
      }
      compression_status v4 = v3;
      unint64_t v5 = 0x10000 - self->_stream.dst_size;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](self, "compressedMessages"));
      objc_msgSend(v6, "appendBytes:length:", -[NSMutableData bytes](self->_dstBuf, "bytes"), v5);

      if (v4 == COMPRESSION_STATUS_END)
      {
        self->_closed = 1;
        compression_stream_destroy((compression_stream *)&self->_stream);
        return;
      }
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)NSUInteger v7 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Error while finializing the compression stream",  v7,  2u);
    }

    -[PETServiceMessageCompressor _errorClose](self, "_errorClose");
  }

- (NSMutableData)compressedMessages
{
  return (NSMutableData *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setCompressedMessages:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)decompress:(id)a3
{
  id v3 = a3;
  compression_stream_init(&stream, COMPRESSION_STREAM_DECODE, COMPRESSION_ZLIB);
  compression_status v4 = (uint8_t *)malloc(0x10000uLL);
  unint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableData);
  id v6 = v3;
  stream.src_ptr = (const uint8_t *)[v6 bytes];
  stream.src_size = (size_t)[v6 length];
  stream.dst_ptr = v4;
  stream.dst_size = 0x10000LL;
  while (1)
  {
    compression_status v7 = compression_stream_process(&stream, 1);
    if (v7 == COMPRESSION_STATUS_ERROR) {
      break;
    }
    compression_status v8 = v7;
    -[NSMutableData appendBytes:length:](v5, "appendBytes:length:", v4, 0x10000 - stream.dst_size);
    stream.dst_ptr = v4;
    stream.dst_size = 0x10000LL;
    if (v8 == COMPRESSION_STATUS_END)
    {
      free(v4);
      compression_stream_destroy(&stream);
      v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      if (-[NSMutableData length](v5, "length"))
      {
        unint64_t v10 = 0LL;
        do
        {
          objc_super v11 = v5;
          PBReaderReadVarIntBuf( (char *)-[NSMutableData bytes](v11, "bytes") + v10,  (char *)-[NSMutableData length](v11, "length") - v10,  buf,  &v17);
          uint64_t v12 = v17 + v10;
          v13 = v11;
          v14 = (char *)-[NSMutableData bytes](v13, "bytes");
          v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &v14[v12],  *(void *)buf));
          unint64_t v10 = *(void *)buf + v12;
          -[NSMutableArray addObject:](v9, "addObject:", v15);
        }

        while (v10 < -[NSMutableData length](v13, "length"));
      }

      goto LABEL_11;
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Error decompressing",  buf,  2u);
  }

  v9 = 0LL;
LABEL_11:

  return v9;
}

@end