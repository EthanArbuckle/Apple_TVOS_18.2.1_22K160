@interface _OSLogIndexFile
- (BOOL)_determineTimespan;
- (BOOL)_loadCatalogMetadataForTimespan;
- (BOOL)_loadHeaderMetadata:(id)a3;
- (_OSLogIndexFile)initWithChunkStore:(id)a3 error:(id *)a4;
- (_OSLogIndexFile)initWithTraceFile:(id)a3 error:(id *)a4;
- (char)path;
- (const)bootUUID;
- (id)copyMappedChunkStore:(id *)a3;
- (unint64_t)endTime;
- (unint64_t)oldestTime;
- (void)dealloc;
@end

@implementation _OSLogIndexFile

- (_OSLogIndexFile)initWithTraceFile:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____OSLogIndexFile;
  v8 = -[_OSLogIndexFile init](&v13, sel_init);
  v9 = v8;
  if (!v8)
  {
LABEL_4:
    v10 = v9;
    goto LABEL_6;
  }

  objc_storeStrong((id *)&v8->_cfr, a3);
  v9->_ot = -1LL;
  v9->_cot_header = -1LL;
  v9->_cot = -1LL;
  v9->_timespanDetermined = 0;
  -[_OSLogChunkFileReference path](v9->_cfr, "path");
  strlen(-[_OSLogChunkFileReference path](v9->_cfr, "path"));
  v9->_path = (char *)_os_trace_memdup();
  v10 = -[_OSLogChunkFileReference copyMappedChunkFile:](v9->_cfr, "copyMappedChunkFile:", a4);
  if (v10)
  {
    BOOL v11 = -[_OSLogIndexFile _loadHeaderMetadata:](v9, "_loadHeaderMetadata:", v10);

    if (!v11)
    {
      v10 = 0LL;
      goto LABEL_6;
    }

    goto LABEL_4;
  }

- (_OSLogIndexFile)initWithChunkStore:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____OSLogIndexFile;
  id v7 = -[_OSLogIndexFile init](&v11, sel_init);
  v8 = v7;
  if (!v7
    || (objc_storeStrong((id *)&v7->_cs, a3),
        v8->_cot_header = -1LL,
        v8->_cot = -1LL,
        v8->_timespanDetermined = 0,
        v8->_ot = -1LL,
        v8->_path = 0LL,
        v9 = 0LL,
        -[_OSLogIndexFile _loadHeaderMetadata:](v8, "_loadHeaderMetadata:", v6)))
  {
    v9 = v8;
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____OSLogIndexFile;
  -[_OSLogIndexFile dealloc](&v3, sel_dealloc);
}

- (BOOL)_loadHeaderMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __39___OSLogIndexFile__loadHeaderMetadata___block_invoke;
  v6[3] = &unk_189F0E740;
  v6[4] = self;
  v6[5] = &v7;
  [v4 enumerateChunksUsingBlock:v6];
  LOBYTE(self) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

- (BOOL)_loadCatalogMetadataForTimespan
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  _index_log();
  objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    path = self->_path;
    *(_DWORD *)buf = 136315138;
    objc_super v13 = path;
    _os_signpost_emit_with_name_impl( &dword_186981000,  v3,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Read Catalogs",  "for %s",  buf,  0xCu);
  }

  v5 = self->_cs;
  if (self->_cs
    || (cfr = self->_cfr) == 0LL
    || (uint64_t v10 = -[_OSLogChunkFileReference copyMappedChunkFile:](cfr, "copyMappedChunkFile:", 0LL),
        v5,
        (v5 = (_OSLogChunkStore *)v10) != 0LL))
  {
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __50___OSLogIndexFile__loadCatalogMetadataForTimespan__block_invoke;
    v11[3] = &unk_189F0E768;
    v11[4] = self;
    -[_OSLogChunkStore enumerateChunksUsingBlock:](v5, "enumerateChunksUsingBlock:", v11);
    if (!self->_cet) {
      self->_cet = -1LL;
    }
    _index_log();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v13) = 1;
      _os_signpost_emit_with_name_impl( &dword_186981000,  v6,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Read Catalogs",  "success: %{BOOL}d",  buf,  8u);
    }

    BOOL v7 = 1;
  }

  else
  {
    _index_log();
    v5 = (_OSLogChunkStore *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled((os_log_t)v5))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v13) = 0;
      _os_signpost_emit_with_name_impl( &dword_186981000,  (os_log_t)v5,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Read Catalogs",  "success: %{BOOL}d",  buf,  8u);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_determineTimespan
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  _index_log();
  objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    path = self->_path;
    int v11 = 136315138;
    v12 = path;
    _os_signpost_emit_with_name_impl( &dword_186981000,  v3,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Determine Timespan",  "for %s",  (uint8_t *)&v11,  0xCu);
  }

  if (self->_timespanDetermined) {
    goto LABEL_12;
  }
  cfr = self->_cfr;
  if (cfr)
  {
    if (-[_OSLogChunkFileReference readXattrForTimespan:](cfr, "readXattrForTimespan:", 0LL))
    {
      id v6 = getenv("LOG_USE_XATTRTIMESPAN");
      if (!v6 || strcmp(v6, "0"))
      {
        self->_ot = -[_OSLogChunkFileReference xattrOldestTime](self->_cfr, "xattrOldestTime");
        unint64_t cet = -[_OSLogChunkFileReference xattrEndTime](self->_cfr, "xattrEndTime");
LABEL_11:
        self->_et = cet;
LABEL_12:
        BOOL v8 = 1;
        self->_timespanDetermined = 1;
        goto LABEL_13;
      }
    }
  }

  if (-[_OSLogIndexFile _loadCatalogMetadataForTimespan](self, "_loadCatalogMetadataForTimespan"))
  {
    unint64_t cet = self->_cet;
    self->_ot = self->_cot;
    goto LABEL_11;
  }

  BOOL v8 = 0;
LABEL_13:
  _index_log();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    int v11 = 67109120;
    LODWORD(v12) = v8;
    _os_signpost_emit_with_name_impl( &dword_186981000,  v9,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Determine Timespan",  "success: %{BOOL}d",  (uint8_t *)&v11,  8u);
  }

  return v8;
}

- (id)copyMappedChunkStore:(id *)a3
{
  cs = self->_cs;
  if (cs) {
    return cs;
  }
  id result = self->_cfr;
  if (result) {
    return (id)[result copyMappedChunkFile:a3];
  }
  qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: _OSLogIndexFile had no backing store or file reference";
  __break(1u);
  return result;
}

- (const)bootUUID
{
  return (const char *)self->_bootu;
}

- (unint64_t)endTime
{
  return self->_et;
}

- (unint64_t)oldestTime
{
  return self->_ot;
}

- (char)path
{
  return self->_path;
}

- (void).cxx_destruct
{
}

@end