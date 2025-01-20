@interface GEOAPUploadFileWriter
- (void)_arpcDataForType:(int)a3 dataBlock:(id)a4;
- (void)dealloc;
@end

@implementation GEOAPUploadFileWriter

- (void)dealloc
{
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0) {
    close(fd);
  }
  if (self->_compress)
  {
    compression_stream_destroy((compression_stream *)&self->_cstream);
    free(self->_dstBuf);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v5 = [v4 fileExistsAtPath:self->_tempFilePath];

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v6 removeItemAtPath:self->_tempFilePath error:0];
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GEOAPUploadFileWriter;
  -[GEOAPUploadFileWriter dealloc](&v7, "dealloc");
}

- (void)_arpcDataForType:(int)a3 dataBlock:(id)a4
{
  unsigned int v5 = (void (**)(id, void *, BOOL))a4;
  id v9 = objc_alloc_init(&OBJC_CLASS___GEOLogMessageCollectionRequest);
  BOOL v6 = a3 != 13;
  uint64_t v7 = GEOProtocolBufferRequestHeader(v6, v6, [v9 requestTypeCode]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v5[2](v5, v8, v6);
}

- (void).cxx_destruct
{
}

@end