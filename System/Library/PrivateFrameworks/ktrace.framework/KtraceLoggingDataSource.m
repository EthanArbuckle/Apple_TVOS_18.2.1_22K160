@interface KtraceLoggingDataSource
- (BOOL)_skipFirst;
- (KtraceLoggingDataSource)initWithKtraceFile:(ktrace_file *)a3;
- (NSData)_metadata;
- (id)metadataChunk;
- (id)nextEventDataChunk;
- (ktrace_chunk)_nextChunk;
- (ktrace_file)_ktfile;
- (void)dealloc;
- (void)set_ktfile:(ktrace_file *)a3;
- (void)set_metadata:(id)a3;
- (void)set_nextChunk:(ktrace_chunk *)a3;
- (void)set_skipFirst:(BOOL)a3;
@end

@implementation KtraceLoggingDataSource

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___KtraceLoggingDataSource;
  -[KtraceLoggingDataSource dealloc](&v3, sel_dealloc);
}

- (KtraceLoggingDataSource)initWithKtraceFile:(ktrace_file *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___KtraceLoggingDataSource;
  v4 = -[KtraceLoggingDataSource init](&v14, sel_init);
  v10 = v4;
  if (v4)
  {
    uint64_t v11 = MEMORY[0x1895F87A8];
    v4->_ktfile = a3;
    v13[0] = v11;
    v13[1] = 3221225472LL;
    v13[2] = __46__KtraceLoggingDataSource_initWithKtraceFile___block_invoke;
    v13[3] = &unk_189F55018;
    v13[4] = v4;
    if (ktrace_file_iterate((uint64_t)a3, 0LL, (uint64_t)v13, v5, v6, v7, v8, v9) || !v10->_metadata)
    {
      -[KtraceLoggingDataSource set_metadata:](v10, "set_metadata:", 0LL);
      return 0LL;
    }
  }

  return v10;
}

BOOL __46__KtraceLoggingDataSource_initWithKtraceFile___block_invoke(uint64_t a1, uint64_t *a2)
{
  int v4 = ktrace_chunk_tag((uint64_t)a2);
  if (v4 == 32786)
  {
    size_t v5 = ktrace_chunk_size_t(a2);
    uint64_t v6 = malloc(v5);
    if (!v6) {
      ktrace_remotetime_update_params_cold_1();
    }
    uint64_t v7 = v6;
    else {
      objc_msgSend( *(id *)(a1 + 32),  "set_metadata:",  objc_msgSend(MEMORY[0x189603F48], "dataWithBytesNoCopy:length:", v7, v5));
    }
  }

  return v4 != 32786;
}

- (id)nextEventDataChunk
{
  uint64_t v13 = 0LL;
  objc_super v14 = &v13;
  uint64_t v15 = 0x3052000000LL;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  uint64_t v18 = 0LL;
  ktfile = self->_ktfile;
  nextChunk = self->_nextChunk;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __45__KtraceLoggingDataSource_nextEventDataChunk__block_invoke;
  v12[3] = &unk_189F55040;
  v12[4] = self;
  v12[5] = &v13;
  int v9 = ktrace_file_iterate((uint64_t)ktfile, nextChunk, (uint64_t)v12, v2, v3, v4, v5, v6);
  v10 = (void *)v14[5];
  if (v9)
  {

    v10 = 0LL;
    v14[5] = 0LL;
  }

  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __45__KtraceLoggingDataSource_nextEventDataChunk__block_invoke(uint64_t a1, uint64_t *a2)
{
  *(void *)(*(void *)(a1 + 32) + 24LL) = a2;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8))
  {
    *(_BYTE *)(v2 + 8) = 0;
    return 1LL;
  }

  size_t v5 = ktrace_chunk_size_t(a2);
  uint64_t v6 = malloc(v5);
  if (!v6) {
    ktrace_remotetime_update_params_cold_1();
  }
  uint64_t v7 = v6;
  if (ktrace_chunk_copy_data(a2, 0LL, v6, v5))
  {
    free(v7);
    return 0LL;
  }

  else
  {
    uint64_t v9 = [MEMORY[0x189603F48] dataWithBytesNoCopy:v7 length:v5];
    uint64_t result = 0LL;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = v9;
    *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 1;
  }

  return result;
}

- (id)metadataChunk
{
  return self->_metadata;
}

- (ktrace_file)_ktfile
{
  return self->_ktfile;
}

- (void)set_ktfile:(ktrace_file *)a3
{
  self->_ktfile = a3;
}

- (ktrace_chunk)_nextChunk
{
  return self->_nextChunk;
}

- (void)set_nextChunk:(ktrace_chunk *)a3
{
  self->_nextChunk = a3;
}

- (NSData)_metadata
{
  return self->_metadata;
}

- (void)set_metadata:(id)a3
{
}

- (BOOL)_skipFirst
{
  return self->_skipFirst;
}

- (void)set_skipFirst:(BOOL)a3
{
  self->_skipFirst = a3;
}

@end