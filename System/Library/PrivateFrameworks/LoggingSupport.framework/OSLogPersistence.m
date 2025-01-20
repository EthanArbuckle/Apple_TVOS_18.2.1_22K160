@interface OSLogPersistence
- (BOOL)allowSensitive;
- (BOOL)streamChunks:(id)a3 andEntries:(id)a4 flags:(unsigned int)a5;
- (BOOL)verbose;
- (NSCompoundPredicate)predicate;
- (NSDate)endDate;
- (NSDate)sparseDataStart;
- (NSDate)startDate;
- (NSDictionary)statistics;
- (NSString)currentFile;
- (NSURL)logArchive;
- (NSURL)logFile;
- (OSLogPersistence)init;
- (OSLogPersistenceDelegate)delegate;
- (_os_timesync_db_s)timesync;
- (int64_t)archiveState;
- (int64_t)archiveVersion;
- (unint64_t)batchSize;
- (unint64_t)decodeFailures;
- (unint64_t)logMessageCount;
- (unint64_t)messagesFiltered;
- (unint64_t)options;
- (void)_openFiles;
- (void)_openLocalPersistenceDir;
- (void)_openPath:(id)a3;
- (void)dealloc;
- (void)enumerateFromLastBootWithBlock:(id)a3;
- (void)enumerateFromStartDate:(id)a3 toEndDate:(id)a4 withBlock:(id)a5;
- (void)fetchFromStartDate:(id)a3 toEndDate:(id)a4;
- (void)setBatchSize:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLogArchive:(id)a3;
- (void)setLogFile:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPredicate:(id)a3;
- (void)setVerbose:(BOOL)a3;
@end

@implementation OSLogPersistence

- (void)_openLocalPersistenceDir
{
  unint64_t options = self->_options;
  if ((~LODWORD(self->_options) & 0xCLL) != 0)
  {
    +[_OSLogCollectionReference localDBRefWithError:]( &OBJC_CLASS____OSLogCollectionReference,  "localDBRefWithError:",  0LL);
    v4 = (_OSLogCollectionReference *)objc_claimAutoreleasedReturnValue();
    oslcr = self->_oslcr;
    self->_oslcr = v4;

    v6 = -[_OSLogVersioning initWithCollection:error:]( objc_alloc(&OBJC_CLASS____OSLogVersioning),  "initWithCollection:error:",  self->_oslcr,  0LL);
    version = self->_version;
    self->_version = v6;

    v8 = tmpfile();
    if (v8)
    {
      v9 = v8;
      uint64_t v10 = 2LL;
      if ((options & 8) == 0) {
        uint64_t v10 = 3LL;
      }
      if ((options & 4) != 0) {
        uint64_t v11 = 1LL;
      }
      else {
        uint64_t v11 = v10;
      }
      int v12 = fileno(v8);
      v21 = 0LL;
      if (OSLogCaptureInflightBuffersToFile(v12, v11, 0LL))
      {
        off_t v13 = lseek(v12, 0LL, 2);
        v14 = mmap(0LL, v13, 1, 2, v12, 0LL);
        else {
          v21 = -[_OSLogChunkMemory initWithBytes:size:deallocator:]( objc_alloc(&OBJC_CLASS____OSLogChunkMemory),  "initWithBytes:size:deallocator:",  v14,  v13,  &__block_literal_global_871);
        }
      }

      fclose(v9);
      v15 = -[_OSLogIndex initWithCollection:buildLocalIndex:]( objc_alloc(&OBJC_CLASS____OSLogIndex),  "initWithCollection:buildLocalIndex:",  self->_oslcr,  (options & 4) == 0);
      index = self->_index;
      self->_index = v15;

      if (v21) {
        -[_OSLogIndex insertChunkStore:](self->_index, "insertChunkStore:", v21);
      }
      [MEMORY[0x189603F50] distantPast];
      v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
      startDate = self->_startDate;
      self->_startDate = v17;

      objc_storeStrong((id *)&self->_sparseDataStart, self->_startDate);
      [MEMORY[0x189603F50] date];
      v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
      endDate = self->_endDate;
      self->_endDate = v19;
    }
  }

- (void)_openPath:(id)a3
{
  id v27 = a3;
  [MEMORY[0x189604030] fileURLWithPath:v27];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v27 hasSuffix:@".logarchive"];
  -[_OSLogCollectionReference close](self->_oslcr, "close");
  +[_OSLogCollectionReference referenceWithURL:error:]( &OBJC_CLASS____OSLogCollectionReference,  "referenceWithURL:error:",  v4,  0LL);
  v6 = (_OSLogCollectionReference *)objc_claimAutoreleasedReturnValue();
  oslcr = self->_oslcr;
  self->_oslcr = v6;

  v8 = -[_OSLogVersioning initWithCollection:error:]( objc_alloc(&OBJC_CLASS____OSLogVersioning),  "initWithCollection:error:",  self->_oslcr,  0LL);
  version = self->_version;
  self->_version = v8;

  if (-[_OSLogVersioning state](self->_version, "state") == 3) {
    -[_OSLogVersioning performDestructiveUpdates:](self->_version, "performDestructiveUpdates:", 0LL);
  }
  if (-[_OSLogVersioning state](self->_version, "state") != 1) {
    goto LABEL_15;
  }
  -[_OSLogCollectionReference timesyncReference](self->_oslcr, "timesyncReference");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[_OSLogCollectionReference close](self->_oslcr, "close");
    +[_OSLogCollectionReference referenceWithURL:error:]( &OBJC_CLASS____OSLogCollectionReference,  "referenceWithURL:error:",  v4,  0LL);
    uint64_t v11 = (_OSLogCollectionReference *)objc_claimAutoreleasedReturnValue();
    int v12 = self->_oslcr;
    self->_oslcr = v11;
  }

  off_t v13 = -[_OSLogIndex initWithCollection:buildLocalIndex:]( objc_alloc(&OBJC_CLASS____OSLogIndex),  "initWithCollection:buildLocalIndex:",  self->_oslcr,  v5);
  index = self->_index;
  self->_index = v13;

  if ((v5 & 1) != 0)
  {
LABEL_11:
    unint64_t v17 = -[_OSLogIndex persistStartWalltime](self->_index, "persistStartWalltime");
    unint64_t v18 = -[_OSLogIndex specialStartWalltime](self->_index, "specialStartWalltime");
    if (v17 >= v18) {
      unint64_t v19 = v18;
    }
    else {
      unint64_t v19 = v17;
    }
    [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:(double)(v19 / 0x3B9ACA00)];
    v20 = (NSDate *)objc_claimAutoreleasedReturnValue();
    startDate = self->_startDate;
    self->_startDate = v20;

    objc_storeStrong((id *)&self->_sparseDataStart, self->_startDate);
    unint64_t v22 = -[_OSLogIndex endWalltime](self->_index, "endWalltime");
    [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:(double)(v22 / 0x3B9ACA00)];
    v23 = (NSDate *)objc_claimAutoreleasedReturnValue();
    endDate = self->_endDate;
    self->_endDate = v23;

LABEL_15:
    return;
  }

  uint64_t v15 = open((const char *)[v27 fileSystemRepresentation], 0);
  v16 = -[_OSLogChunkFile initWithFileDescriptor:error:]( objc_alloc(&OBJC_CLASS____OSLogChunkFile),  "initWithFileDescriptor:error:",  v15,  0LL);
  if (v16) {
    -[_OSLogIndex insertChunkStore:](self->_index, "insertChunkStore:", v16);
  }
  if (close(v15) != -1)
  {
LABEL_10:

    goto LABEL_11;
  }

  int v25 = *__error();
  uint64_t v26 = *__error();
  if (v25 != 9)
  {
    _os_assumes_log();
    goto LABEL_10;
  }

  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = v26;
  __break(1u);
}

- (void)_openFiles
{
  v3 = (void *)NSString;
  if (_os_trace_shared_paths_init_once != -1) {
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  }
  [v3 stringWithUTF8String:_os_trace_persist_path];
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  logFile = self->_logFile;
  if (!logFile && !self->_logArchive) {
    goto LABEL_8;
  }
  -[NSURL path](logFile, "path");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 isEqualToString:v12])
  {

LABEL_8:
    -[OSLogPersistence _openLocalPersistenceDir](self, "_openLocalPersistenceDir");
    goto LABEL_13;
  }
  v6 = -[NSURL path](self->_logArchive, "path");
  int v7 = [v6 isEqualToString:v12];

  if (v7) {
    goto LABEL_8;
  }
  v8 = -[NSURL path](self->_logArchive, "path");
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }

  else
  {
    -[NSURL path](self->_logFile, "path");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v11 = v10;

  -[OSLogPersistence _openPath:](self, "_openPath:", v11);
LABEL_13:
}

- (OSLogPersistence)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OSLogPersistence;
  result = -[OSLogPersistence init](&v3, sel_init);
  if (result)
  {
    result->_batchSize = 1000LL;
    result->_verbose = 0;
  }

  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OSLogPersistence;
  -[OSLogPersistence dealloc](&v3, sel_dealloc);
}

- (void)setLogFile:(id)a3
{
  id v5 = a3;
  [MEMORY[0x1896078A8] defaultManager];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v5 isFileURL] & 1) == 0)
  {
    -[OSLogPersistence _openFiles](self, "_openFiles");
    goto LABEL_7;
  }

  [v5 path];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 pathExtension];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = [v8 isEqualToString:@"tracev3"];

  if ((v9 & 1) != 0)
  {
    if ([v6 fileExistsAtPath:v7 isDirectory:&v17])
    {
      if (!v17)
      {
        objc_storeStrong((id *)&self->_logFile, a3);
        -[OSLogPersistence _openFiles](self, "_openFiles");

LABEL_7:
        return;
      }

      id v10 = (void *)MEMORY[0x189603F70];
      [NSString stringWithFormat:@"Log file named '%@' is not a regular file.", v7];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v12 = @"File is not a regular file.";
    }

    else
    {
      id v10 = (void *)MEMORY[0x189603F70];
      [NSString stringWithFormat:@"Log file named '%@' not found.", v7];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v12 = @"File not Found";
    }
  }

  else
  {
    id v10 = (void *)MEMORY[0x189603F70];
    [NSString stringWithFormat:@"File name does not end with .tracev3 (%@)", v7];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = @"Invalid file provided";
  }

  [v10 exceptionWithName:v12 reason:v11 userInfo:0];
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
  -[OSLogPersistence setLogArchive:](v14, v15, v16);
}

- (void)setLogArchive:(id)a3
{
  id v5 = a3;
  [MEMORY[0x1896078A8] defaultManager];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 path];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 pathExtension];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = [v8 isEqualToString:@"logarchive"];

  if ((v9 & 1) != 0)
  {
    if ([v6 fileExistsAtPath:v7 isDirectory:&v17])
    {
      if (v17)
      {
        objc_storeStrong((id *)&self->_logArchive, a3);
        -[OSLogPersistence _openFiles](self, "_openFiles");

LABEL_6:
        return;
      }

      id v10 = (void *)MEMORY[0x189603F70];
      [NSString stringWithFormat:@"Log archive named '%@' is not a package.", v7];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v12 = @"Log archive is not a package.";
    }

    else
    {
      id v10 = (void *)MEMORY[0x189603F70];
      [NSString stringWithFormat:@"Log archive named '%@' not found.", v7];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v12 = @"File not Found";
    }
  }

  else
  {
    id v10 = (void *)MEMORY[0x189603F70];
    [NSString stringWithFormat:@"File name does not end with .logarchive (%@)", v7];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = @"Invalid archive provided";
  }

  [v10 exceptionWithName:v12 reason:v11 userInfo:0];
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
  -[OSLogPersistence setPredicate:](v14, v15, v16);
}

- (void)setPredicate:(id)a3
{
  id v17 = a3;
  if (!v17)
  {
    predicate = (_OSLogPredicateMapper *)self->_predicate;
    self->_predicate = 0LL;
LABEL_9:

    return;
  }

  predicate = -[_OSLogPredicateMapper initWithPredicate:andValidate:]( objc_alloc(&OBJC_CLASS____OSLogPredicateMapper),  "initWithPredicate:andValidate:",  v17,  0LL);
  id v5 = objc_alloc(&OBJC_CLASS____OSLogLegacyPredicateMapper);
  v6 = -[_OSLogPredicateMapper mappedPredicate](predicate, "mappedPredicate");
  int v7 = -[_OSLogPredicateMapper initWithPredicate:](v5, "initWithPredicate:", v6);
  v8 = -[_OSLogPredicateMapper mappedPredicate](v7, "mappedPredicate");
  if (v8)
  {
    -[_OSLogPredicateMapper mappedPredicate](v7, "mappedPredicate");
    char v9 = (NSCompoundPredicate *)objc_claimAutoreleasedReturnValue();
    id v10 = self->_predicate;
    self->_predicate = v9;

    if ((-[_OSLogPredicateMapper flags](predicate, "flags") & 2) != 0) {
      self->_options |= 1uLL;
    }
    if ((-[_OSLogPredicateMapper flags](predicate, "flags") & 1) != 0) {
      self->_options |= 3uLL;
    }

    goto LABEL_9;
  }

  uint64_t v11 = (void *)MEMORY[0x189603F70];
  -[_OSLogPredicateMapper validationErrors](v7, "validationErrors");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 componentsJoinedByString:@"\n"];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 exceptionWithName:@"OSLogInvalidPredicateException" reason:v13 userInfo:0];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v14);
  -[OSLogPersistence allowSensitive](v15, v16);
}

- (BOOL)allowSensitive
{
  if ((self->_options & 0x40000000) != 0) {
    return 0;
  }
  if (geteuid() && !self->_logArchive) {
    return self->_logFile != 0LL;
  }
  return 1;
}

- (int64_t)archiveVersion
{
  version = self->_version;
  if (version) {
    return -[_OSLogVersioning version](version, "version");
  }
  else {
    return -1LL;
  }
}

- (int64_t)archiveState
{
  int64_t result = (int64_t)self->_version;
  if (result)
  {
    unint64_t v3 = [(id)result state];
    if (v3 > 3) {
      return 2LL;
    }
    else {
      return qword_1869D9010[v3];
    }
  }

  return result;
}

- (BOOL)streamChunks:(id)a3 andEntries:(id)a4 flags:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  *__error() = 3;
  _chunk_support_context_init((uint64_t)v17);
  id v18 = v9;
  id v19 = v8;
  v17[0] = a5;
  index = self->_index;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __50__OSLogPersistence_streamChunks_andEntries_flags___block_invoke;
  v12[3] = &unk_189F0EC50;
  v12[4] = &v13;
  v12[5] = v17;
  -[_OSLogIndex enumerateFilesUsingBlock:](index, "enumerateFilesUsingBlock:", v12);
  _chunk_support_context_clear((uint64_t)v17);
  LOBYTE(a5) = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return a5;
}

- (void)enumerateFromStartDate:(id)a3 toEndDate:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 timeIntervalSince1970];
  if (v11 <= 0.0)
  {
    unint64_t v13 = 0LL;
  }

  else
  {
    [v8 timeIntervalSince1970];
    unint64_t v13 = (unint64_t)(v12 * 1000000000.0);
  }

  [v9 timeIntervalSince1970];
  if (v14 <= 0.0)
  {
    unint64_t v16 = 0LL;
  }

  else
  {
    [v9 timeIntervalSince1970];
    unint64_t v16 = (unint64_t)(v15 * 1000000000.0);
  }

  if (!self->_index) {
    -[OSLogPersistence _openFiles](self, "_openFiles");
  }
  if (v16 < v13 || v16 == 0) {
    unint64_t v16 = -1LL;
  }
  BOOL v18 = -[OSLogPersistence allowSensitive](self, "allowSensitive");
  unint64_t options = self->_options;
  unsigned int v20 = !v18 & 0xFFFFFFFD | (2 * (options & 1));
  if ((options & 3) != 0) {
    uint64_t v21 = v20 | 4;
  }
  else {
    uint64_t v21 = v20;
  }
  index = self->_index;
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = __63__OSLogPersistence_enumerateFromStartDate_toEndDate_withBlock___block_invoke;
  v24[3] = &unk_189F0EC78;
  v24[4] = self;
  id v25 = v10;
  id v23 = v10;
  -[_OSLogIndex enumerateEntriesFrom:to:options:usingBlock:]( index,  "enumerateEntriesFrom:to:options:usingBlock:",  v13,  v16,  v21,  v24);
}

- (void)enumerateFromLastBootWithBlock:(id)a3
{
  id v4 = a3;
  if (!self->_index) {
    -[OSLogPersistence _openFiles](self, "_openFiles");
  }
  BOOL v5 = -[OSLogPersistence allowSensitive](self, "allowSensitive");
  unint64_t options = self->_options;
  if ((options & 3) != 0) {
    int v7 = !v5 & 0xFFFFFFFD | (2 * (options & 1)) | 4;
  }
  else {
    int v7 = !v5 & 0xFFFFFFFD | (2 * (options & 1));
  }
  uint64_t v8 = v7 & 0xFFFFFFBF | (((options >> 5) & 1) << 6);
  index = self->_index;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __51__OSLogPersistence_enumerateFromLastBootWithBlock___block_invoke;
  v11[3] = &unk_189F0EC78;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  -[_OSLogIndex enumerateEntriesFromLastBootWithOptions:usingBlock:]( index,  "enumerateEntriesFromLastBootWithOptions:usingBlock:",  v8,  v11);
}

- (void)fetchFromStartDate:(id)a3 toEndDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v13 = 0LL;
    double v14 = &v13;
    uint64_t v15 = 0x3032000000LL;
    unint64_t v16 = __Block_byref_object_copy__836;
    id v17 = __Block_byref_object_dispose__837;
    id v18 = (id)objc_opt_new();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __49__OSLogPersistence_fetchFromStartDate_toEndDate___block_invoke;
    v10[3] = &unk_189F0ECA0;
    id v12 = &v13;
    v10[4] = self;
    id v9 = WeakRetained;
    id v11 = v9;
    -[OSLogPersistence enumerateFromStartDate:toEndDate:withBlock:]( self,  "enumerateFromStartDate:toEndDate:withBlock:",  v6,  v7,  v10);
    if ([(id)v14[5] count]) {
      [v9 persistence:self results:v14[5] error:0];
    }
    [v9 persistenceDidFinishReadingForStartDate:v6 endDate:v7];

    _Block_object_dispose(&v13, 8);
  }
}

- (_os_timesync_db_s)timesync
{
  return -[_OSLogIndex timesync](self->_index, "timesync");
}

- (NSDictionary)statistics
{
  v41[8] = *MEMORY[0x1895F89C0];
  v35[0] = 0LL;
  v35[1] = v35;
  v35[2] = 0x2020000000LL;
  v34[0] = 0LL;
  v34[1] = v34;
  v34[2] = 0x2020000000LL;
  uint64_t v29 = 0LL;
  v30 = &v29;
  v32 = &unk_1869E294A;
  uint64_t v31 = 0x6010000000LL;
  rb_tree_init(&v33, (const rb_tree_ops_t *)&statistics_ops);
  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v28[2] = __30__OSLogPersistence_statistics__block_invoke;
  v28[3] = &unk_189F0ED50;
  v28[4] = v35;
  v28[5] = v34;
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __30__OSLogPersistence_statistics__block_invoke_2;
  v27[3] = &unk_189F0ED78;
  v27[4] = &v29;
  v27[5] = v34;
  v27[6] = v35;
  -[OSLogPersistence streamChunks:andEntries:flags:](self, "streamChunks:andEntries:flags:", v28, v27, 0LL);
  if (rb_tree_count((rb_tree_t *)(v30 + 4)))
  {
    [MEMORY[0x189603FA8] arrayWithCapacity:rb_tree_count((rb_tree_t *)(v30 + 4))];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FA8] arrayWithCapacity:rb_tree_count((rb_tree_t *)(v30 + 4))];
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = (char *)rb_tree_iterate((rb_tree_t *)(v30 + 4), 0LL, 1u);
          i;
          i = (char *)rb_tree_iterate((rb_tree_t *)(v30 + 4), i, 1u))
    {
      if (*((void *)i + 133))
      {
        v40[0] = @"uuid";
        id v4 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:i + 24];
        v41[0] = v4;
        v40[1] = @"path";
        [NSString stringWithUTF8String:i + 40];
        BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
        v41[1] = v5;
        v40[2] = @"activityCreationCount";
        [MEMORY[0x189607968] numberWithUnsignedLongLong:**((void **)i + 133)];
        id v6 = (void *)objc_claimAutoreleasedReturnValue();
        v41[2] = v6;
        v40[3] = @"userActionCount";
        [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(*((void *)i + 133) + 24)];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        v41[3] = v7;
        v40[4] = @"logMessageCount";
        [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(*((void *)i + 133) + 16)];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        v41[4] = v8;
        v40[5] = @"traceMessageCount";
        [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(*((void *)i + 133) + 8)];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        v41[5] = v9;
        v40[6] = @"totalProcessPublicSize";
        [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(*((void *)i + 133) + 56)];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        v41[6] = v10;
        v40[7] = @"totalProcessPrivateSize";
        [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(*((void *)i + 133) + 64)];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        v41[7] = v11;
        [MEMORY[0x189603F68] dictionaryWithObjects:v41 forKeys:v40 count:8];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 addObject:v12];
      }

      v38[0] = @"uuid";
      uint64_t v26 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:i + 24];
      v39[0] = v26;
      v38[1] = @"path";
      [NSString stringWithUTF8String:i + 40];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v13;
      v38[2] = @"activityCreationCount";
      [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)i + 134)];
      double v14 = (void *)objc_claimAutoreleasedReturnValue();
      v39[2] = v14;
      v38[3] = @"userActionCount";
      [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)i + 137)];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      v39[3] = v15;
      v38[4] = @"logMessageCount";
      [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)i + 136)];
      unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      v39[4] = v16;
      v38[5] = @"traceMessageCount";
      [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)i + 135)];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      v39[5] = v17;
      v38[6] = @"tracePublicSize";
      [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)i + 138)];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      v39[6] = v18;
      v38[7] = @"logPublicSize";
      [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)i + 139)];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      v39[7] = v19;
      v38[8] = @"logPrivateSize";
      [MEMORY[0x189607968] numberWithUnsignedLongLong:*((void *)i + 140)];
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue();
      v39[8] = v20;
      [MEMORY[0x189603F68] dictionaryWithObjects:v39 forKeys:v38 count:9];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 addObject:v21];
    }

    v36[0] = @"perProcessStatistics";
    v36[1] = @"perSenderStatistics";
    v37[0] = v24;
    v37[1] = v25;
    [MEMORY[0x189603F68] dictionaryWithObjects:v37 forKeys:v36 count:2];
    unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unint64_t v22 = 0LL;
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v35, 8);
  return (NSDictionary *)v22;
}

- (NSURL)logFile
{
  return self->_logFile;
}

- (NSURL)logArchive
{
  return self->_logArchive;
}

- (OSLogPersistenceDelegate)delegate
{
  return (OSLogPersistenceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSCompoundPredicate)predicate
{
  return self->_predicate;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_unint64_t options = a3;
}

- (NSString)currentFile
{
  return self->_currentFile;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)sparseDataStart
{
  return self->_sparseDataStart;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (unint64_t)decodeFailures
{
  return self->_decodeFailures;
}

- (unint64_t)messagesFiltered
{
  return self->_messagesFiltered;
}

- (unint64_t)logMessageCount
{
  return self->_logMessageCount;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (void).cxx_destruct
{
}

uint64_t __30__OSLogPersistence_statistics__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 64))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

  return 1LL;
}

uint64_t __30__OSLogPersistence_statistics__block_invoke_2(void *a1, uint64_t a2)
{
  node = rb_tree_find_node((rb_tree_t *)(*(void *)(a1[4] + 8LL) + 32LL), *(const void **)(a2 + 24));
  if (node)
  {
    uint64_t v5 = (uint64_t)node;
    id v6 = (void *)node[133];
  }

  else
  {
    uint64_t v5 = _os_trace_calloc();
    if (*(void *)(a2 + 32)) {
      __strlcpy_chk();
    }
    else {
      uuid_unparse_upper(*(const unsigned __int8 **)(a2 + 24), (char *)(v5 + 40));
    }
    uuid_copy((unsigned __int8 *)(v5 + 24), *(const unsigned __int8 **)(a2 + 24));
    rb_tree_insert_node((rb_tree_t *)(*(void *)(a1[4] + 8LL) + 32LL), (void *)v5);
    id v6 = (void *)_os_trace_calloc();
    *(void *)(v5 + 1064) = v6;
  }

  if (*(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL))
  {
    uint64_t v7 = v6[8];
    v6[7] += **(unsigned __int16 **)(*(void *)(*(void *)(a1[6] + 8LL) + 24LL) + 64LL);
    v6[8] = v7 + *(void *)(*(void *)(*(void *)(a1[6] + 8LL) + 24LL) + 80LL);
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
  }

  uint64_t v8 = *(const unsigned __int8 **)(a2 + 80);
  if (v8)
  {
    if (uuid_compare(v8, *(const unsigned __int8 **)(a2 + 24)))
    {
      uint64_t v5 = (uint64_t)rb_tree_find_node((rb_tree_t *)(*(void *)(a1[4] + 8LL) + 32LL), *(const void **)(a2 + 80));
      if (!v5)
      {
        uint64_t v5 = _os_trace_calloc();
        __strlcpy_chk();
        if (!*(_BYTE *)(v5 + 40)) {
          uuid_unparse_upper(*(const unsigned __int8 **)(a2 + 80), (char *)(v5 + 40));
        }
        uuid_copy((unsigned __int8 *)(v5 + 24), *(const unsigned __int8 **)(a2 + 80));
        rb_tree_insert_node((rb_tree_t *)(*(void *)(a1[4] + 8LL) + 32LL), (void *)v5);
      }
    }
  }

  int v9 = *(_DWORD *)a2;
  if (*(int *)a2 > 767)
  {
    if (v9 == 768)
    {
      ++*(void *)(v5 + 1080);
      *(void *)(v5 + 1104) += *(void *)(a2 + 160);
      ++v6[1];
      uint64_t v11 = *(void *)(a2 + 160);
      v6 += 4;
      goto LABEL_25;
    }

    if (v9 == 1024)
    {
      *(void *)(v5 + 1112) += *(void *)(a2 + 160);
      *(void *)(v5 + 1120) += *(void *)(a2 + 176);
      ++*(void *)(v5 + 1088);
      uint64_t v10 = v6[6];
      v6[5] += *(void *)(a2 + 160);
      v6[6] = v10 + *(void *)(a2 + 176);
      v6 += 2;
      goto LABEL_23;
    }
  }

  else
  {
    if (v9 == 513)
    {
      ++*(void *)(v5 + 1072);
      goto LABEL_23;
    }

    if (v9 == 515)
    {
      ++*(void *)(v5 + 1096);
      v6 += 3;
LABEL_23:
      uint64_t v11 = 1LL;
LABEL_25:
      *v6 += v11;
    }
  }

  return 1LL;
}

uint64_t __49__OSLogPersistence_fetchFromStartDate_toEndDate___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count] >= *(void *)(*(void *)(a1 + 32) + 72))
  {
    uint64_t result = objc_msgSend(*(id *)(a1 + 40), "persistence:results:error:");
    if (!(_DWORD)result) {
      return result;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeAllObjects];
  }

  return 1LL;
}

uint64_t __51__OSLogPersistence_enumerateFromLastBootWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = *(void **)(*(void *)(a1 + 32) + 64LL);
  if (v4 && ([v4 evaluateWithObject:v3] & 1) == 0)
  {
    ++*(void *)(*(void *)(a1 + 32) + 128LL);
    uint64_t v5 = 1LL;
  }

  else
  {
    uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  return v5;
}

uint64_t __63__OSLogPersistence_enumerateFromStartDate_toEndDate_withBlock___block_invoke( uint64_t a1,  uint64_t a2)
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = v3 != 0LL;
  if (*(void *)(*(void *)(a1 + 32) + 64LL)) {
    BOOL v5 = v3 == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    char v4 = [*(id *)(*(void *)(a1 + 32) + 64) evaluateWithObject:v3];
  }
  if ((v4 & 1) != 0)
  {
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    ++*(void *)(*(void *)(a1 + 32) + 128LL);
    uint64_t v6 = 1LL;
  }

  return v6;
}

uint64_t __50__OSLogPersistence_streamChunks_andEntries_flags___block_invoke( uint64_t a1,  int a2,  uint64_t a3,  unint64_t a4)
{
  unint64_t v7 = 0LL;
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x2000000000LL;
  char v21 = 1;
  *(_DWORD *)(v8 + 4) = a2;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 0x40000000LL;
  uint64_t v13 = (unsigned int (*)(void *))___os_activity_stream_mapped_file_block_invoke;
  double v14 = &unk_189F0F870;
  uint64_t v15 = &v18;
  uint64_t v16 = a3;
  uint64_t v17 = v8;
  do
  {
    if (a4 - v7 < 0x10) {
      break;
    }
    unint64_t v9 = *(void *)(a3 + v7 + 8);
    if (a4 - v7 - 16 < v9) {
      break;
    }
    if (!v13(v12)) {
      break;
    }
    unint64_t v7 = (v7 + v9 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  }

  while (v7 - 1 < a4);
  *(_DWORD *)(v8 + 4) = -1;
  char v10 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v10;
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
}

uint64_t __44__OSLogPersistence__openLocalPersistenceDir__block_invoke(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

@end