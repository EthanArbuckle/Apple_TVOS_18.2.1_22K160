@interface _OSLogChunkFile
- (_OSLogChunkFile)initWithFileDescriptor:(int)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation _OSLogChunkFile

- (_OSLogChunkFile)initWithFileDescriptor:(int)a3 error:(id *)a4
{
  v24[128] = *MEMORY[0x1895F89C0];
  v24[0] = 0LL;
  uint64_t v7 = _os_trace_mmap();
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = v24[0];
    if (fcntl(a3, 50, v24, 1024LL) == -1)
    {
      if (a4)
      {
        [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*__error() userInfo:0];
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      v14 = 0LL;
    }

    else
    {
      [NSString stringWithUTF8String:v24];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 pathComponents];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v12 = [v11 count];
      unint64_t v13 = v12 - 1;
      if (v12 > 1)
      {
        [v11 objectAtIndexedSubscript:v12 - 2];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 objectAtIndexedSubscript:v13];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)NSString;
        v23[0] = v16;
        v23[1] = v17;
        [MEMORY[0x189603F18] arrayWithObjects:v23 count:2];
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 pathWithComponents:v19];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else if (a4)
      {
        [MEMORY[0x189607870] errorWithDomain:@"filePathAssemblerError" code:-1 userInfo:0];
        v14 = 0LL;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v14 = 0LL;
      }

      if (v14)
      {
        v22.receiver = self;
        v22.super_class = (Class)&OBJC_CLASS____OSLogChunkFile;
        v20 = -[_OSLogChunkStore initWithBytes:size:](&v22, sel_initWithBytes_size_, v8, v9);
        self = v20;
        if (v20)
        {
          -[_OSLogChunkStore setFileName:](v20, "setFileName:", v14);
          self = self;
          v15 = self;
LABEL_18:

          goto LABEL_19;
        }
      }
    }

    v15 = 0LL;
    goto LABEL_18;
  }

  if (a4)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*__error() userInfo:0];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  v15 = 0LL;
LABEL_19:

  return v15;
}

- (void)dealloc
{
  ptr = (void *)self->super._ptr;
  if (ptr && munmap(ptr, self->super._sz) == -1)
  {
    __error();
    _os_assumes_log();
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____OSLogChunkFile;
  -[_OSLogChunkFile dealloc](&v4, sel_dealloc);
}

@end