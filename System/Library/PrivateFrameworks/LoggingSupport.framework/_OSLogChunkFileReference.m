@interface _OSLogChunkFileReference
- (BOOL)readXattrForTimespan:(id *)a3;
- (_OSLogChunkFileReference)initWithCollection:(id)a3 subpath:(const char *)a4;
- (char)path;
- (id)copyMappedChunkFile:(id *)a3;
- (unint64_t)xattrEndTime;
- (unint64_t)xattrOldestTime;
- (void)dealloc;
@end

@implementation _OSLogChunkFileReference

- (_OSLogChunkFileReference)initWithCollection:(id)a3 subpath:(const char *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____OSLogChunkFileReference;
  v8 = -[_OSLogChunkFileReference init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_oslcr, a3);
    v9->_path = strdup(a4);
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____OSLogChunkFileReference;
  -[_OSLogChunkFileReference dealloc](&v3, sel_dealloc);
}

- (BOOL)readXattrForTimespan:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  _index_log();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    path = self->_path;
    *(_DWORD *)buf = 136315138;
    v20 = path;
    _os_signpost_emit_with_name_impl( &dword_186981000,  v5,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Read Extended Attributes",  "for %s",  buf,  0xCu);
  }

  -[_OSLogCollectionReference diagnosticsDirectoryReference](self->_oslcr, "diagnosticsDirectoryReference");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 fileDescriptor];
  uint64_t v8 = _os_trace_getxattr_at();

  if (v8 == 40)
  {
    *(_OWORD *)&self->_xot = v21;
    _index_log();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      int v15 = 67109120;
      int v16 = 1;
      v10 = "success: %{BOOL}d";
      objc_super v11 = v9;
      uint32_t v12 = 8;
LABEL_10:
      _os_signpost_emit_with_name_impl( &dword_186981000,  v11,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Read Extended Attributes",  v10,  (uint8_t *)&v15,  v12);
    }
  }

  else
  {
    if (a3)
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*__error() userInfo:0];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    _index_log();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      int v13 = *__error();
      int v15 = 67109376;
      int v16 = 0;
      __int16 v17 = 1024;
      int v18 = v13;
      v10 = "success: %{BOOL}d %{darwin.errno}d";
      objc_super v11 = v9;
      uint32_t v12 = 14;
      goto LABEL_10;
    }
  }

  return v8 == 40;
}

- (id)copyMappedChunkFile:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = openat([v5 fileDescriptor], self->_path, 0);

  if ((_DWORD)v6 == -1)
  {
    if (!a3) {
      return 0LL;
    }
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*__error() userInfo:0];
    id v7 = 0LL;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return v7;
  }

  id v7 = -[_OSLogChunkFile initWithFileDescriptor:error:]( objc_alloc(&OBJC_CLASS____OSLogChunkFile),  "initWithFileDescriptor:error:",  v6,  a3);
  if (close(v6) != -1) {
    return v7;
  }
  int v8 = *__error();
  id result = (id)*__error();
  if (v8 != 9)
  {
    _os_assumes_log();
    return v7;
  }

  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = (uint64_t)result;
  __break(1u);
  return result;
}

- (char)path
{
  return self->_path;
}

- (unint64_t)xattrOldestTime
{
  return self->_xot;
}

- (unint64_t)xattrEndTime
{
  return self->_xet;
}

- (void).cxx_destruct
{
}

@end