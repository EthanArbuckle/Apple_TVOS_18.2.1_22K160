@interface _CSVisualizationArchiver
+ (void)beginProvidingVisualizationArchivesWithMachServiceName:(id)a3 queue:(id)a4 creatingVisualizersWithBlock:(id)a5;
+ (void)processCommandFromConnection:(void *)a3 fileHandle:(__sFILE *)a4 providerBlock:(id)a5;
+ (void)provideVisualizerToConnection:(void *)a3 fileHandle:(__sFILE *)a4 providerBlock:(id)a5;
- (BOOL)fwrite:(const void *)a3 size:(unint64_t)a4 numberOfItems:(unint64_t)a5 error:(id *)a6;
- (BOOL)writeDictionary:(id)a3 error:(id *)a4;
- (BOOL)writeMetadata:(id)a3 forStore:(__CSStore *)a4 error:(id *)a5;
- (NSPredicate)unitDescriptionPredicate;
- (_CSVisualizationArchiver)initWithVisualizer:(id)a3 fileHandle:(__sFILE *)a4 closeWhenDone:(BOOL)a5 allowCompression:(BOOL)a6 error:(id *)a7;
- (_CSVisualizationArchiver)initWithVisualizer:(id)a3 fileHandle:(__sFILE *)a4 closeWhenDone:(BOOL)a5 error:(id *)a6;
- (_CSVisualizer)visualizer;
- (void)dealloc;
- (void)finishWriting;
- (void)getWriteUnitState:(_CSWriteUnitState *)a3 forTable:(unsigned int)a4;
- (void)setUnitDescriptionPredicate:(id)a3;
- (void)writeAllUnitsInTable:(unsigned int)a3 block:(id)a4;
- (void)writeAllUnitsWithBlock:(id)a3;
- (void)writeUnit:(unsigned int)a3 inTable:(unsigned int)a4;
- (void)writeUnit:(unsigned int)a3 inTable:(unsigned int)a4 state:(const _CSWriteUnitState *)a5;
@end

@implementation _CSVisualizationArchiver

- (_CSVisualizationArchiver)initWithVisualizer:(id)a3 fileHandle:(__sFILE *)a4 closeWhenDone:(BOOL)a5 allowCompression:(BOOL)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v85 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  v74.receiver = self;
  v74.super_class = (Class)&OBJC_CLASS____CSVisualizationArchiver;
  v15 = -[_CSVisualizationArchiver init](&v74, sel_init);
  if (!v14)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    [v68 handleFailureInMethod:a2, v15, @"CSVisualizationArchiver.mm", 151, @"Invalid parameter not satisfying: %@", @"visualizer != nil" object file lineNumber description];
  }

  if (!a4)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    [v69 handleFailureInMethod:a2, v15, @"CSVisualizationArchiver.mm", 152, @"Invalid parameter not satisfying: %@", @"fileHandle != NULL" object file lineNumber description];
  }

  if (!v15)
  {
    v19 = (void *)MEMORY[0x189607870];
    v75[0] = *MEMORY[0x189607490];
    v75[1] = @"Line";
    v76[0] = @"ENOMEM";
    v76[1] = &unk_189D69550;
    [MEMORY[0x189603F68] dictionaryWithObjects:v76 forKeys:v75 count:2];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 errorWithDomain:*MEMORY[0x189607688] code:12 userInfo:v20];
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }

  objc_storeStrong((id *)&v15->_visualizer, a3);
  *(void *)__str = 0LL;
  uint64_t v84 = 0LL;
  v16 = getenv("CS_VISUALIZATION_COMPRESSION_LEVEL");
  if (v16)
  {
    unint64_t v17 = strtoul(v16, 0LL, 0);
    uint64_t v18 = 9LL;
    if (v17 < 9) {
      uint64_t v18 = v17;
    }
  }

  else
  {
    uint64_t v18 = 6LL;
  }

  snprintf(__str, 0x10uLL, "%cb%lu", 119LL, v18);
  v22 = (CSStore2 *)fileno(a4);
  if ((v22 & 0x80000000) != 0)
  {
    CSStore2::GetLog(v22);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = a4;
      _os_log_impl( &dword_183DFE000,  v30,  OS_LOG_TYPE_INFO,  "File handle %p passed to _CSVisualization[Un]Archiver is not backed by a file descriptor. Will not compress/decompress.",  buf,  0xCu);
    }

    v27 = 0LL;
    if (a4) {
      goto LABEL_48;
    }
LABEL_23:
    id v31 = v27;
    a4 = 0LL;
    v27 = v31;
    goto LABEL_49;
  }

  int v23 = (int)v22;
  if (a6)
  {
    int v23 = dup((int)v22);
    if (v23 < 0)
    {
      v24 = (void *)MEMORY[0x189607870];
      uint64_t v25 = *__error();
      *(void *)&__int128 v80 = *MEMORY[0x189607490];
      *((void *)&v80 + 1) = @"Line";
      v81 = @"errno";
      v82 = (const __CFString *)&unk_189D69598;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v81 forKeys:&v80 count:2];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 errorWithDomain:*MEMORY[0x189607688] code:v25 userInfo:v26];
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      CSStore2::GetLog(v28);
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        int v62 = *__error();
        v63 = __error();
        v64 = strerror(*v63);
        *(_DWORD *)buf = 136446722;
        *(void *)&buf[4] = "writing";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v62;
        __int16 v78 = 2080;
        v79 = v64;
        _os_log_error_impl( &dword_183DFE000,  v29,  OS_LOG_TYPE_ERROR,  "Error duplicating file descriptor for %{public}s: %i (%s)",  buf,  0x1Cu);
      }

      goto LABEL_39;
    }
  }

  else
  {
    CSStore2::GetLog(v22);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = a4;
      _os_log_impl( &dword_183DFE000,  v32,  OS_LOG_TYPE_INFO,  "Disabling compression for file handle %p passed to _CSVisualization[Un]Archiver. Will not compress/decompress.",  buf,  0xCu);
    }

    if (a4)
    {
      id v31 = 0LL;
      v27 = 0LL;
      goto LABEL_49;
    }
  }

  *__error() = 0;
  gzFile v33 = gzdopen(v23, __str);
  v34 = v33;
  if (!v33)
  {
    int v36 = *__error();
    v70 = (void *)MEMORY[0x189607870];
    uint64_t v37 = *MEMORY[0x189607688];
    if (v36)
    {
      *(void *)&__int128 v80 = *MEMORY[0x189607490];
      *((void *)&v80 + 1) = @"Line";
      v81 = @"errnum";
      v82 = (const __CFString *)&unk_189D695C8;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v81 forKeys:&v80 count:2];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      [v70 errorWithDomain:v37 code:v36 userInfo:v38];
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      CSStore2::GetLog(v39);
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = strerror(v36);
        *(_DWORD *)buf = 136446722;
        *(void *)&buf[4] = "writing";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v36;
        __int16 v78 = 2080;
        v79 = v41;
        v42 = "Error opening file handle for %{public}s with gzdopen(): %i (%s)";
        v43 = buf;
        v44 = v40;
        uint32_t v45 = 28;
LABEL_67:
        _os_log_error_impl(&dword_183DFE000, v44, OS_LOG_TYPE_ERROR, v42, v43, v45);
      }
    }

    else
    {
      v81 = (const __CFString *)*MEMORY[0x189607490];
      v82 = @"Line";
      *(void *)buf = @"ENOMEM";
      *(void *)&buf[8] = &unk_189D695E0;
      [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:&v81 count:2];
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      [v70 errorWithDomain:v37 code:12 userInfo:v50];
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      CSStore2::GetLog(v51);
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v80) = 136446210;
        *(void *)((char *)&v80 + 4) = "writing";
        v42 = "Unknown error opening file handle for %{public}s with gzdopen()";
        v43 = (uint8_t *)&v80;
        v44 = v40;
        uint32_t v45 = 12;
        goto LABEL_67;
      }
    }

    close(v23);
    goto LABEL_39;
  }

  v35 = funopen( v33,  (int (__cdecl *)(void *, char *, int))CSStore2::readFromGzipFile,  (int (__cdecl *)(void *, const char *, int))CSStore2::writeToGzipFile,  0LL,  (int (__cdecl *)(void *))CSStore2::closeGzipFile);
  if (v35)
  {
    v27 = 0LL;
    goto LABEL_40;
  }

  v46 = (void *)MEMORY[0x189607870];
  *(void *)&__int128 v80 = *MEMORY[0x189607490];
  *((void *)&v80 + 1) = @"Line";
  v81 = @"ENOMEM";
  v82 = (const __CFString *)&unk_189D695B0;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v81 forKeys:&v80 count:2];
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  [v46 errorWithDomain:*MEMORY[0x189607688] code:12 userInfo:v47];
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  CSStore2::GetLog(v48);
  v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
  {
    int v65 = *__error();
    v66 = __error();
    v67 = strerror(*v66);
    *(_DWORD *)buf = 136446722;
    *(void *)&buf[4] = "writing";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v65;
    __int16 v78 = 2080;
    v79 = v67;
    _os_log_error_impl( &dword_183DFE000,  v49,  OS_LOG_TYPE_ERROR,  "Error funopening file handle for %{public}s: %i (%s)",  buf,  0x1Cu);
  }

  gzclose(v34);
LABEL_39:
  v35 = 0LL;
LABEL_40:
  char v52 = v35 != a4 || v9;
  if (v35 == a4 || !v9)
  {
    LOBYTE(v9) = v52;
  }

  else
  {
    fclose(a4);
    LOBYTE(v9) = 1;
  }

  a4 = v35;
  if (!v35) {
    goto LABEL_23;
  }
LABEL_48:
  id v31 = 0LL;
LABEL_49:

  id v21 = v31;
  v15->_fileHandle = a4;
  v15->_closeWhenDone = v9;
  if (a4)
  {
    v53 = getenv("CS_VISUALIZATION_OUTPUT_XML");
    if (v53) {
      BOOL v54 = strtol(v53, 0LL, 0) != 0;
    }
    else {
      BOOL v54 = 0;
    }
    v15->_outputAsXML = v54;
    v15->_dictWriteLock._os_unfair_lock_opaque = 0;
    id v73 = v21;
    BOOL v55 = -[_CSVisualizationArchiver fwrite:size:numberOfItems:error:]( v15,  "fwrite:size:numberOfItems:error:",  "csviz0jg",  8LL,  1LL,  &v73);
    id v56 = v73;

    if (!v55)
    {

      goto LABEL_61;
    }

    uint64_t v57 = -[_CSVisualizer store](v15->_visualizer, "store");
    uint64_t v58 = 4294929780LL;
    if (!v57) {
      uint64_t v58 = 0LL;
    }
    *(void *)buf = v58;
    id v72 = v56;
    BOOL v59 = -[_CSVisualizationArchiver fwrite:size:numberOfItems:error:]( v15,  "fwrite:size:numberOfItems:error:",  buf,  8LL,  1LL,  &v72);
    id v21 = v72;

    if (v59)
    {
      fflush(v15->_fileHandle);
      id v71 = v21;
      BOOL v60 = -[_CSVisualizationArchiver writeMetadata:forStore:error:]( v15,  "writeMetadata:forStore:error:",  0,  [v14 store],  &v71);
      id v56 = v71;

      if (v60)
      {
        id v21 = v56;
        goto LABEL_63;
      }

LABEL_61:
      id v21 = v56;
      if (!a7) {
        goto LABEL_62;
      }
      goto LABEL_12;
    }
  }

  else
  {
  }

- (_CSVisualizationArchiver)initWithVisualizer:(id)a3 fileHandle:(__sFILE *)a4 closeWhenDone:(BOOL)a5 error:(id *)a6
{
  return -[_CSVisualizationArchiver initWithVisualizer:fileHandle:closeWhenDone:allowCompression:error:]( self,  "initWithVisualizer:fileHandle:closeWhenDone:allowCompression:error:",  a3,  a4,  a5,  1LL,  a6);
}

- (void)dealloc
{
  fileHandle = self->_fileHandle;
  if (fileHandle && self->_closeWhenDone) {
    fclose(fileHandle);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____CSVisualizationArchiver;
  -[_CSVisualizationArchiver dealloc](&v4, sel_dealloc);
}

- (BOOL)writeMetadata:(id)a3 forStore:(__CSStore *)a4 error:(id *)a5
{
  id v8 = a3;
  BOOL v9 = (void *)MEMORY[0x186E27B50]();
  id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v10 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"metadata"];
  if (v8)
  {
    [v10 addEntriesFromDictionary:v8];
  }

  else
  {
    BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.CSStore");
    if (BundleWithIdentifier) {
      objc_msgSend( v10,  "setObject:forKeyedSubscript:",  CFBundleGetValueForInfoDictionaryKey(BundleWithIdentifier, (CFStringRef)*MEMORY[0x189604E18]),  @"framework-version");
    }
    v12 = (void *)_CFCopySystemVersionDictionary();
    v13 = v12;
    if (v12)
    {
      [v12 objectForKeyedSubscript:*MEMORY[0x189604B68]];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 setObject:v14 forKeyedSubscript:@"os"];

      [v13 objectForKeyedSubscript:*MEMORY[0x189604B78]];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 setObject:v15 forKeyedSubscript:@"os-version"];

      [v13 objectForKeyedSubscript:*MEMORY[0x189604B60]];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 setObject:v16 forKeyedSubscript:@"os-build"];
    }

    if (a4) {
      unsigned int v17 = -37516;
    }
    else {
      unsigned int v17 = 0;
    }
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", CSStoreGetUnitCount((uint64_t)a4, v17));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setObject:v18 forKeyedSubscript:@"tableCount"];
    v19 = -[_CSVisualizationArchiver visualizer](self, "visualizer");
    [v19 breakDownUsage];
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20) {
      [v10 setObject:v20 forKeyedSubscript:@"breakdown"];
    }
  }

  id v25 = 0LL;
  BOOL v21 = -[_CSVisualizationArchiver writeDictionary:error:](self, "writeDictionary:error:", v10, &v25);
  id v22 = v25;

  objc_autoreleasePoolPop(v9);
  if (a5) {
    char v23 = v21;
  }
  else {
    char v23 = 1;
  }
  if ((v23 & 1) == 0) {
    *a5 = v22;
  }

  return v21;
}

- (BOOL)writeDictionary:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v7 = (void *)[v6 copy];

  id v8 = (void *)MEMORY[0x186E27B50]();
  BOOL v9 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
  id v10 = v9;
  if (self->_outputAsXML) {
    [v9 setOutputFormat:100];
  }
  [v10 encodeObject:v7 forKey:*MEMORY[0x1896075C8]];
  [v10 finishEncoding];
  [v10 encodedData];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  if (!v11)
  {
    id v16 = 0LL;
    BOOL v19 = 0;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }

  v12 = (CSStore2 *)[v11 length];
  char v23 = v12;
  CSStore2::GetLog(v12);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v25 = 8LL;
    __int16 v26 = 2048;
    v27 = v12;
    _os_log_debug_impl(&dword_183DFE000, v13, OS_LOG_TYPE_DEBUG, "Writing %llu+%llu bytes to gzip stream", buf, 0x16u);
  }

  p_dictWriteLock = &self->_dictWriteLock;
  os_unfair_lock_lock(&self->_dictWriteLock);
  id v22 = 0LL;
  BOOL v15 = -[_CSVisualizationArchiver fwrite:size:numberOfItems:error:]( self,  "fwrite:size:numberOfItems:error:",  &v23,  8LL,  1LL,  &v22);
  id v16 = v22;
  if (v15)
  {
    id v17 = v11;
    id v21 = v16;
    LODWORD(v17) = -[_CSVisualizationArchiver fwrite:size:numberOfItems:error:]( self,  "fwrite:size:numberOfItems:error:",  [v17 bytes],  objc_msgSend(v17, "length"),  1,  &v21);
    id v18 = v21;

    if ((_DWORD)v17)
    {
      fflush(self->_fileHandle);
      BOOL v19 = 1;
    }

    else
    {
      BOOL v19 = 0;
    }

    id v16 = v18;
  }

  else
  {
    BOOL v19 = 0;
  }

  os_unfair_lock_unlock(p_dictWriteLock);
  if (a4)
  {
LABEL_15:
    if (!v19) {
      *a4 = v16;
    }
  }

- (BOOL)fwrite:(const void *)a3 size:(unint64_t)a4 numberOfItems:(unint64_t)a5 error:(id *)a6
{
  v7 = (__CFString *)a5;
  uint64_t v31 = *MEMORY[0x1895F89C0];
  size_t v9 = fwrite(a3, a4, a5, self->_fileHandle);
  fileHandle = self->_fileHandle;
  if ((__CFString *)v9 == v7 && !ferror(self->_fileHandle)) {
    return 1;
  }
  v11 = (void *)MEMORY[0x189607688];
  if ((int (__cdecl *)(gzFile))fileHandle->_close == CSStore2::closeGzipFile)
  {
    int errnum = 0;
    id v16 = gzerror((gzFile)fileHandle->_cookie, &errnum);
    uint64_t v17 = errnum;
    if (errnum == -1)
    {
      id v22 = (void *)MEMORY[0x189607870];
      uint64_t v23 = *__error();
      uint64_t v27 = *MEMORY[0x189607490];
      uint64_t v28 = @"Line";
      v29 = @"errno";
      v30 = &unk_189D69568;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v29 forKeys:&v27 count:2];
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      [v22 errorWithDomain:*v11 code:v23 userInfo:v7];
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      if (errnum < 2)
      {
        BOOL v15 = 0LL;
        goto LABEL_16;
      }

      id v18 = v16;
      BOOL v19 = (void *)MEMORY[0x189607870];
      if (v16)
      {
        uint64_t v27 = *MEMORY[0x1896075E0];
        [NSString stringWithUTF8String:v16];
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v29 = v7;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v29 forKeys:&v27 count:1];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v20 = 0LL;
      }

      [v19 errorWithDomain:@"Z" code:v17 userInfo:v20];
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18) {
        goto LABEL_16;
      }
    }

    goto LABEL_16;
  }

  v12 = (void *)MEMORY[0x189607870];
  int v13 = *__error();
  uint64_t v27 = *MEMORY[0x189607490];
  uint64_t v28 = @"Line";
  v29 = @"errno";
  v30 = &unk_189D69580;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v29 forKeys:&v27 count:2];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 errorWithDomain:*v11 code:v13 userInfo:v14];
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  if (a6) {
    *a6 = v15;
  }
  if ([v15 code] == 32)
  {
    [v15 domain];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    int v25 = [v24 isEqual:*v11];

    if (v25) {
      atomic_store(1u, (unsigned __int8 *)&self->_hadEPIPE);
    }
  }

  return 0;
}

- (void)getWriteUnitState:(_CSWriteUnitState *)a3 forTable:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v7 = -[_CSVisualizationArchiver visualizer](self, "visualizer");
  objc_storeStrong(&a3->var0, v7);
  -[_CSVisualizationArchiver unitDescriptionPredicate](self, "unitDescriptionPredicate");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id var3 = a3->var3;
  a3->id var3 = v8;

  [v7 functionsForTable:v4];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 getSummary];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = MEMORY[0x1895F87A8];
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __55___CSVisualizationArchiver_getWriteUnitState_forTable___block_invoke;
  v21[3] = &unk_189D66878;
  id v13 = v11;
  id v22 = v13;
  id v14 = (void *)MEMORY[0x186E27CB8](v21);
  id var1 = a3->var1;
  a3->id var1 = v14;

  [v10 getDescription];
  v19[0] = v12;
  v19[1] = 3221225472LL;
  v19[2] = __55___CSVisualizationArchiver_getWriteUnitState_forTable___block_invoke_2;
  v19[3] = &unk_189D668A0;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v20;
  uint64_t v17 = (void *)MEMORY[0x186E27CB8](v19);
  id var2 = a3->var2;
  a3->id var2 = v17;
}

- (void)writeUnit:(unsigned int)a3 inTable:(unsigned int)a4 state:(const _CSWriteUnitState *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x1895F89C0];
  size_t v9 = (void *)MEMORY[0x186E27B50](self, a2);
  (*((void (**)(void))a5->var2 + 2))();
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (id var3 = a5->var3) == 0 || [var3 evaluateWithObject:v10])
  {
    [MEMORY[0x189603FC8] dictionary];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithUnsignedInt:v7];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setObject:v13 forKeyedSubscript:@"u"];

    [MEMORY[0x189607968] numberWithUnsignedInt:v6];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setObject:v14 forKeyedSubscript:@"t"];

    (*((void (**)(void))a5->var1 + 2))();
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15) {
      [v12 setObject:v15 forKeyedSubscript:@"s"];
    }

    if (v10) {
      [v12 setObject:v10 forKeyedSubscript:@"d"];
    }
    id v20 = 0LL;
    BOOL v16 = -[_CSVisualizationArchiver writeDictionary:error:](self, "writeDictionary:error:", v12, &v20);
    uint64_t v17 = (CSStore2 *)v20;
    id v18 = v17;
    if (!v16)
    {
      CSStore2::GetLog(v17);
      BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v22 = v7;
        __int16 v23 = 2048;
        uint64_t v24 = v6;
        __int16 v25 = 2114;
        __int16 v26 = v18;
        _os_log_error_impl( &dword_183DFE000,  v19,  OS_LOG_TYPE_ERROR,  "Failed to convert description of unit %llu in table %llu to data: %{public}@",  buf,  0x20u);
      }
    }
  }

  objc_autoreleasePoolPop(v9);
}

- (void)writeUnit:(unsigned int)a3 inTable:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  -[_CSVisualizationArchiver getWriteUnitState:forTable:](self, "getWriteUnitState:forTable:", &v7);
  -[_CSVisualizationArchiver writeUnit:inTable:state:](self, "writeUnit:inTable:state:", v5, v4, &v7);
}

- (void)writeAllUnitsInTable:(unsigned int)a3 block:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v29 = self;
  unsigned int v28 = a3;
  id v27 = a4;
  -[_CSVisualizationArchiver visualizer](self, "visualizer");
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 store];

  if (v8)
  {
    uint64_t v9 = 4294929780LL;
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 handleFailureInMethod:a2 object:self file:@"CSVisualizationArchiver.mm" lineNumber:444 description:@"Missing CSStore"];

    uint64_t v9 = 0LL;
  }

  -[_CSVisualizationArchiver writeUnit:inTable:](self, "writeUnit:inTable:", v4, v9);
  uint64_t v24 = 0LL;
  __int16 v25 = 0LL;
  uint64_t v26 = 0LL;
  uint64_t v10 = MEMORY[0x1895F87A8];
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3321888768LL;
  v23[2] = __55___CSVisualizationArchiver_writeAllUnitsInTable_block___block_invoke;
  v23[3] = &__block_descriptor_40_ea8_32c68_ZTSKZ55___CSVisualizationArchiver_writeAllUnitsInTable_block__E3__0_e19_v32__0I8r_v12I20_24l;
  v23[4] = &v24;
  _CSStoreEnumerateUnits(v8, v4, v23);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  -[_CSVisualizationArchiver getWriteUnitState:forTable:](self, "getWriteUnitState:forTable:", &v21, v4);
  id v11 = objc_alloc(NSString);
  uint64_t v12 = (__CFString *)_CSStoreCopyTableName(v8, v4);
  id v13 = (void *)[v11 initWithFormat:@"_CSVisualizationArchiver queue for table %@", v12];

  id v14 = v13;
  BOOL v15 = (const char *)[v14 UTF8String];
  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1895F8AF8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  BOOL v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = dispatch_queue_create(v15, v16);

  char v20 = 0;
  block[0] = v10;
  block[1] = 3321888768LL;
  block[2] = __55___CSVisualizationArchiver_writeAllUnitsInTable_block___block_invoke_60;
  block[3] = &__block_descriptor_80_ea8_32c68_ZTSKZ55___CSVisualizationArchiver_writeAllUnitsInTable_block__E3__1_e8_v16__0Q8l;
  block[4] = &v20;
  block[5] = &v24;
  block[6] = &v29;
  block[7] = &v28;
  block[8] = &v21;
  block[9] = &v27;
  dispatch_apply((v25 - v24) >> 2, v17, block);

  if (v24)
  {
    __int16 v25 = v24;
    operator delete(v24);
  }
}

- (void)writeAllUnitsWithBlock:(id)a3
{
  id v5 = a3;
  -[_CSVisualizationArchiver visualizer](self, "visualizer");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 store];

  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2 object:self file:@"CSVisualizationArchiver.mm" lineNumber:489 description:@"Missing CSStore"];
  }

  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __51___CSVisualizationArchiver_writeAllUnitsWithBlock___block_invoke;
  v10[3] = &unk_189D65810;
  v10[4] = self;
  id v9 = v5;
  id v11 = v9;
  _CSStoreEnumerateTables(v7, v10);
}

- (void)finishWriting
{
  fileHandle = self->_fileHandle;
  if (fileHandle)
  {
    fflush(fileHandle);
    if (self->_closeWhenDone) {
      fclose(self->_fileHandle);
    }
    self->_fileHandle = 0LL;
  }

- (void)setUnitDescriptionPredicate:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  objc_storeStrong((id *)&self->_unitDescriptionPredicate, a3);
  if (v5)
  {
    id v9 = @"predicate";
    [v5 predicateFormat];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CSVisualizationArchiver visualizer](self, "visualizer");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CSVisualizationArchiver writeMetadata:forStore:error:]( self,  "writeMetadata:forStore:error:",  v7,  [v8 store],  0);
  }
}

- (_CSVisualizer)visualizer
{
  return (_CSVisualizer *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSPredicate)unitDescriptionPredicate
{
  return self->_unitDescriptionPredicate;
}

- (void).cxx_destruct
{
}

+ (void)processCommandFromConnection:(void *)a3 fileHandle:(__sFILE *)a4 providerBlock:(id)a5
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  uint64_t __ptr = -1LL;
  if (fread(&__ptr, 8uLL, 1uLL, a4) == 1)
  {
    uint64_t v9 = __ptr;
    uint64_t v10 = (CSStore2 *)MEMORY[0x186E27B50]();
    CSStore2::GetLog(v10);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = v9;
        _os_log_error_impl( &dword_183DFE000,  v12,  OS_LOG_TYPE_ERROR,  "Unrecognized reserved value %llu received from the Mac, ignoring and closing.",  buf,  0xCu);
      }
    }

    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_183DFE000, v12, OS_LOG_TYPE_DEFAULT, "Mac commanded we send a store archive", buf, 2u);
      }

      [a1 provideVisualizerToConnection:a3 fileHandle:a4 providerBlock:v8];
    }

    objc_autoreleasePoolPop(v10);
  }
}

+ (void)provideVisualizerToConnection:(void *)a3 fileHandle:(__sFILE *)a4 providerBlock:(id)a5
{
  id v7 = a5;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __106___CSVisualizationArchiver_CSRemoteVisualization__provideVisualizerToConnection_fileHandle_providerBlock___block_invoke;
  block[3] = &unk_189D65838;
  id v11 = v7;
  uint64_t v12 = a3;
  id v13 = a4;
  id v8 = v7;
  uint64_t v9 = (void (**)(void))dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS,  QOS_CLASS_USER_INTERACTIVE,  0,  block);
  v9[2]();
}

+ (void)beginProvidingVisualizationArchivesWithMachServiceName:(id)a3 queue:(id)a4 creatingVisualizersWithBlock:(id)a5
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 handleFailureInMethod:a2, a1, @"CSVisualizationArchiver.mm", 1091, @"Invalid parameter not satisfying: %@", @"serviceName != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 handleFailureInMethod:a2, a1, @"CSVisualizationArchiver.mm", 1092, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];

LABEL_3:
  if (lockdownLibrary(void)::sLib)
  {
    id v13 = (CSStore2 *)dlsym((void *)lockdownLibrary(void)::sLib, "soft_lockdown_checkin_xpc");
    if (v13)
    {
      CSStore2::GetLog(v13);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = v9;
        _os_log_debug_impl( &dword_183DFE000,  v14,  OS_LOG_TYPE_DEBUG,  "Beginning remote visualization service '%{public}@'",  buf,  0xCu);
      }

      id v15 = v9;
      uint64_t v16 = [v15 UTF8String];
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __141___CSVisualizationArchiver_CSRemoteVisualization__beginProvidingVisualizationArchivesWithMachServiceName_queue_creatingVisualizersWithBlock___block_invoke;
      v19[3] = &unk_189D65860;
      id v20 = v15;
      id v22 = a1;
      id v21 = v12;
      softLinklockdown_checkin_xpc(v16, 0LL, v10, v19);
    }
  }
}

@end