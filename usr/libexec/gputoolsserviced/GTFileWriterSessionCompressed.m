@interface GTFileWriterSessionCompressed
+ (id)sessionWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)_finalizeCompressedFileData:(id *)a3;
- (BOOL)_writeCompressedFileData:(const char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (BOOL)finish:(id *)a3;
- (GTFileWriterSessionCompressed)initWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6;
- (void)writeFileData:(id)a3 completionHandler:(id)a4;
@end

@implementation GTFileWriterSessionCompressed

+ (id)sessionWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [objc_alloc((Class)a1) initWithFileEntries:v12 relativeToURL:v11 options:v10 error:a6];

  return v13;
}

- (GTFileWriterSessionCompressed)initWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___GTFileWriterSessionCompressed;
  id v13 = -[GTFileWriterSessionCompressed init](&v21, "init");
  if (!v13) {
    goto LABEL_6;
  }
  unint64_t v14 = (unint64_t)[v12 compressionAlgorithm] - 1;
  compression_algorithm v15 = v14 > 4 ? 0 : dword_100027A60[v14];
  compression_stream_init((compression_stream *)(v13 + 8), COMPRESSION_STREAM_DECODE, v15);
  *((void *)v13 + 6) = malloc((size_t)[v12 chunkSize]);
  id v16 = [v12 chunkSize];
  *((void *)v13 + 7) = v16;
  *((void *)v13 + 1) = *((void *)v13 + 6);
  *((void *)v13 + 2) = v16;
  uint64_t v17 = objc_claimAutoreleasedReturnValue( +[GTFileWriterSessionUncompressed sessionWithFileEntries:relativeToURL:options:error:]( &OBJC_CLASS___GTFileWriterSessionUncompressed,  "sessionWithFileEntries:relativeToURL:options:error:",  v10,  v11,  v12,  a6));
  v18 = (void *)*((void *)v13 + 8);
  *((void *)v13 + 8) = v17;

  if (!*((void *)v13 + 8))
  {
    compression_stream_destroy((compression_stream *)(v13 + 8));
    free(*((void **)v13 + 6));
    v19 = 0LL;
  }

  else
  {
LABEL_6:
    v19 = v13;
  }

  return v19;
}

- (void)writeFileData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  id v8 = v6;
  id v9 = [v8 bytes];
  id v10 = [v8 length];

  id v12 = 0LL;
  -[GTFileWriterSessionCompressed _writeCompressedFileData:length:error:]( self,  "_writeCompressedFileData:length:error:",  v9,  v10,  &v12);
  id v11 = v12;
  v7[2](v7, v11);
}

- (BOOL)_writeCompressedFileData:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  decompressorOutput = self->_decompressorOutput;
  size_t decompressorOutputSize = self->_decompressorOutputSize;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000AAC0;
  v10[3] = &unk_1000309E0;
  v10[4] = self;
  return sub_10000A94C( (compression_stream *)&self->_compressionStream,  (const uint8_t *)a3,  a4,  (uint8_t *)decompressorOutput,  decompressorOutputSize,  (uint64_t)a5,  v10);
}

- (BOOL)finish:(id *)a3
{
  BOOL v5 = -[GTFileWriterSessionCompressed _finalizeCompressedFileData:](self, "_finalizeCompressedFileData:");
  compression_stream_destroy((compression_stream *)&self->_compressionStream);
  free(self->_decompressorOutput);
  self->_decompressorOutput = 0LL;
  self->_size_t decompressorOutputSize = 0LL;
  uncompressedSession = self->_uncompressedSession;
  id v11 = 0LL;
  unsigned __int8 v7 = -[GTFileWriterSessionUncompressed finish:](uncompressedSession, "finish:", &v11);
  id v8 = v11;
  id v9 = v8;
  if (v5 && (v7 & 1) == 0)
  {
    LOBYTE(v5) = 0;
    if (a3) {
      *a3 = v8;
    }
  }

  return v5;
}

- (BOOL)_finalizeCompressedFileData:(id *)a3
{
  decompressorOutput = self->_decompressorOutput;
  size_t decompressorOutputSize = self->_decompressorOutputSize;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000AD4C;
  v7[3] = &unk_1000309E0;
  v7[4] = self;
  return sub_10000ABD0( (compression_stream *)&self->_compressionStream,  (uint8_t *)decompressorOutput,  decompressorOutputSize,  (uint64_t)a3,  v7);
}

- (void).cxx_destruct
{
}

@end