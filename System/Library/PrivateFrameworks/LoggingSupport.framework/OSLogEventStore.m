@interface OSLogEventStore
+ (id)localStore;
+ (id)localStoreWithRelativePaths:(id)a3;
+ (id)storeWithArchiveURL:(id)a3;
+ (id)storeWithArchiveURL:(id)a3 relativePaths:(id)a4;
+ (id)storeWithFileURL:(id)a3;
- (NSArray)_relativeFilePaths;
- (NSURL)_archiveURL;
- (OSLogEventStore)initWithArchiveURL:(id)a3;
- (OSLogEventStore)initWithArchiveURL:(id)a3 relativePaths:(id)a4;
- (id)_progressHandler;
- (id)_upgradeHandler;
- (void)addFilesToSource:(id)a3 forCollection:(id)a4 withProgress:(id)a5;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)set_archiveURL:(id)a3;
- (void)set_progressHandler:(id)a3;
- (void)set_relativeFilePaths:(id)a3;
- (void)set_upgradeHandler:(id)a3;
@end

@implementation OSLogEventStore

- (OSLogEventStore)initWithArchiveURL:(id)a3
{
  id v5 = a3;
  v6 = -[OSLogEventStore init](self, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_archiveURL, a3);
  }

  return v7;
}

- (OSLogEventStore)initWithArchiveURL:(id)a3 relativePaths:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = -[OSLogEventStore init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_archiveURL, a3);
    objc_storeStrong((id *)&v10->_relativeFilePaths, a4);
  }

  return v10;
}

- (void)addFilesToSource:(id)a3 forCollection:(id)a4 withProgress:(id)a5
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v8;
  id v28 = v10;
  v29 = self;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  v12 = self->_relativeFilePaths;
  uint64_t v30 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v32,  v36,  16LL);
  if (v30)
  {
    uint64_t v13 = *(void *)v33;
    unint64_t v14 = 0x18C4AC000uLL;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v12);
        }
        v16 = (void *)objc_msgSend( objc_alloc((Class)(v14 + 4088)), "initWithCollection:subpath:", v9, objc_msgSend( *(id *)(*((void *)&v32 + 1) + 8 * v15), "fileSystemRepresentation"));
        v17 = objc_alloc(&OBJC_CLASS____OSLogIndexFile);
        id v31 = 0LL;
        v18 = -[_OSLogIndexFile initWithTraceFile:error:](v17, "initWithTraceFile:error:", v16, &v31);
        id v19 = v31;
        if (v18)
        {
          [v11 _insertIndexFile:v18];
        }

        else
        {
          progressHandler = (void (**)(id, void *, double))v29->_progressHandler;
          if (progressHandler)
          {
            [v28 fractionCompleted];
            double v22 = v21;
            _OSLogInternalError(17LL, v19);
            uint64_t v23 = v13;
            id v24 = v9;
            v25 = v12;
            v26 = v11;
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            progressHandler[2](progressHandler, v27, v22);

            v11 = v26;
            v12 = v25;
            id v9 = v24;
            uint64_t v13 = v23;
            unint64_t v14 = 0x18C4AC000LL;
          }
        }

        ++v15;
      }

      while (v30 != v15);
      uint64_t v30 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v32,  v36,  16LL);
    }

    while (v30);
  }
}

- (void)prepareWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void, uint64_t))a3;
  [MEMORY[0x1896079E0] progressWithTotalUnitCount:6];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  archiveURL = self->_archiveURL;
  if (!archiveURL)
  {
    uint64_t v16 = _OSLogError(1LL);
LABEL_10:
    v18 = (void *)v16;
    v4[2](v4, 0LL, v16);

LABEL_62:
    return;
  }

  uint64_t v7 = open(-[NSURL fileSystemRepresentation](archiveURL, "fileSystemRepresentation"), 0);
  if ((_DWORD)v7 == -1)
  {
    v17 = __error();
    uint64_t v16 = _OSLogPOSIXError(3LL, *v17);
    goto LABEL_10;
  }

  uint64_t v8 = v7;
  id v9 = -[_OSLogDirectoryReference initWithDescriptor:]( objc_alloc(&OBJC_CLASS____OSLogDirectoryReference),  "initWithDescriptor:",  v7);
  id v10 = -[_OSLogDirectoryReference initWithDescriptor:]( objc_alloc(&OBJC_CLASS____OSLogDirectoryReference),  "initWithDescriptor:",  v8);
  if (close(v8) == -1)
  {
    int v61 = *__error();
    uint64_t v15 = *__error();
    if (v61 == 9)
    {
      qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_18C695DD0 = v15;
      __break(1u);
      goto LABEL_65;
    }

    _os_assumes_log();
  }

  id v79 = -[NSURL URLByAppendingPathComponent:](self->_archiveURL, "URLByAppendingPathComponent:", @"timesync");
  uint64_t v11 = open((const char *)[v79 fileSystemRepresentation], 0);
  if ((_DWORD)v11 == -1)
  {
    uint64_t v13 = 0LL;
LABEL_12:
    id v19 = v5;
    v20 = self;
    objc_msgSend(v19, "setCompletedUnitCount:", objc_msgSend(v19, "completedUnitCount") + 1);
    progressHandler = (void (**)(id, void))v20->_progressHandler;

    if (progressHandler)
    {
      [v19 fractionCompleted];
      progressHandler[2](progressHandler, 0LL);
    }

    double v22 = -[_OSLogCollectionReference initWithDiagnosticsDirectory:timesyncDirectory:UUIDTextDirectory:]( objc_alloc(&OBJC_CLASS____OSLogCollectionReference),  "initWithDiagnosticsDirectory:timesyncDirectory:UUIDTextDirectory:",  v9,  v13,  v10);
    id v82 = 0LL;
    uint64_t v23 = -[_OSLogVersioning initWithCollection:error:]( objc_alloc(&OBJC_CLASS____OSLogVersioning),  "initWithCollection:error:",  v22,  &v82);
    id v24 = v82;
    v25 = v24;
    if (v23)
    {
      v76 = v5;
      v77 = v10;
      v26 = v13;
      v78 = v22;
      v27 = v9;
      id v28 = v19;
      v29 = v20;
      objc_msgSend(v28, "setCompletedUnitCount:", objc_msgSend(v28, "completedUnitCount") + 1);
      uint64_t v30 = (void (**)(id, void))v20->_progressHandler;

      if (v30)
      {
        [v28 fractionCompleted];
        v30[2](v30, 0LL);
      }

LABEL_18:
      id v9 = v27;
      uint64_t v13 = v26;
      while (-[_OSLogVersioning state](v23, "state") != 1)
      {
        uint64_t v31 = -[_OSLogVersioning state](v23, "state");
        switch(v31)
        {
          case 3LL:
            upgradeHandler = (uint64_t (**)(void))v29->_upgradeHandler;
            if (!upgradeHandler || (upgradeHandler[2]() & 1) == 0)
            {
              uint64_t v56 = 8LL;
              goto LABEL_46;
            }

            id v81 = v25;
            BOOL v33 = -[_OSLogVersioning performDestructiveUpdates:](v23, "performDestructiveUpdates:", &v81);
            id v34 = v81;

            v25 = v34;
            if (v33) {
              goto LABEL_18;
            }
            _OSLogPOSIXError(9, [v34 code]);
            __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
            v4[2](v4, 0LL, (uint64_t)v35);

            double v22 = v78;
            -[_OSLogCollectionReference close](v78, "close");

            v25 = v34;
            id v9 = v27;
LABEL_48:
            id v5 = v76;
            id v10 = v77;
            goto LABEL_61;
          case 2LL:
            uint64_t v56 = 11LL;
LABEL_46:
            uint64_t v57 = _OSLogError(v56);
LABEL_47:
            v58 = (void *)v57;
            v4[2](v4, 0LL, v57);

            double v22 = v78;
            -[_OSLogCollectionReference close](v78, "close");

            goto LABEL_48;
          case 0LL:
            uint64_t v57 = _OSLogPOSIXError(10LL, -[_OSLogVersioning version](v23, "version"));
            goto LABEL_47;
        }
      }

      id v37 = v28;
      v38 = v29;
      objc_msgSend(v37, "setCompletedUnitCount:", objc_msgSend(v37, "completedUnitCount") + 1);
      v39 = (void (**)(id, void))v20->_progressHandler;
      v75 = v38;

      if (v39)
      {
        [v37 fractionCompleted];
        v39[2](v39, 0LL);
      }

      id v5 = v76;
      id v10 = v77;
      if (!v13)
      {
        uint64_t v40 = open((const char *)[v79 fileSystemRepresentation], 0);
        if ((_DWORD)v40 == -1)
        {
          v64 = __error();
          _OSLogPOSIXError(3LL, *v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, 0LL, (uint64_t)v65);

          -[_OSLogDirectoryReference close](v9, "close");
          -[_OSLogDirectoryReference close](v77, "close");
          double v22 = v78;
LABEL_61:

          goto LABEL_62;
        }

        uint64_t v13 = -[_OSLogDirectoryReference initWithDescriptor:]( objc_alloc(&OBJC_CLASS____OSLogDirectoryReference),  "initWithDescriptor:",  v40);
        v41 = -[_OSLogCollectionReference initWithDiagnosticsDirectory:timesyncDirectory:UUIDTextDirectory:]( objc_alloc(&OBJC_CLASS____OSLogCollectionReference),  "initWithDiagnosticsDirectory:timesyncDirectory:UUIDTextDirectory:",  v9,  v13,  v77);

        v78 = v41;
      }

      -[_OSLogDirectoryReference fileDescriptor](v9, "fileDescriptor");
      uint64_t v42 = _os_trace_mmap_at();
      if (v42)
      {
        v71 = v37;
        uint64_t v74 = [objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:v42 length:v80 deallocator:&__block_literal_global_3150];
        uint64_t v43 = objc_msgSend(MEMORY[0x1896079E8], "propertyListWithData:options:format:error:");
        id v44 = 0LL;

        if (!v43)
        {
          id v55 = v44;
          _OSLogInternalError(5LL, v44);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, 0LL, (uint64_t)v62);

          v63 = 0LL;
          double v22 = v78;
          -[_OSLogCollectionReference close](v78, "close");
          v54 = (void *)v74;
LABEL_59:

          v25 = v55;
          goto LABEL_60;
        }

        id v69 = v44;
        v73 = v13;
        v70 = (void *)v43;
        v72 = -[_OSLogEventStoreMetadata initWithDictionary:]( objc_alloc(&OBJC_CLASS____OSLogEventStoreMetadata),  "initWithDictionary:",  v43);
        if (!v72)
        {
          v45 = (void (**)(id, void *, double))v20->_progressHandler;
          if (v45)
          {
            [v71 fractionCompleted];
            double v47 = v46;
            _OSLogError(16LL);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v45[2](v45, v48, v47);
          }
        }

        id v49 = v71;
        v50 = v75;
        objc_msgSend(v49, "setCompletedUnitCount:", objc_msgSend(v49, "completedUnitCount") + 1);
        v51 = (void (**)(id, void))v20->_progressHandler;

        if (v51)
        {
          [v49 fractionCompleted];
          v51[2](v51, 0LL);
        }

        uint64_t v52 = _timesync_db_openat(-[_OSLogDirectoryReference fileDescriptor](v73, "fileDescriptor"), ".");
        if (!v52)
        {
          v66 = __error();
          _OSLogPOSIXError(12LL, *v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, 0LL, (uint64_t)v67);

          double v22 = v78;
          -[_OSLogCollectionReference close](v78, "close");
          v54 = (void *)v74;
          id v55 = v69;
LABEL_58:

          uint64_t v13 = v73;
          v63 = v70;
          goto LABEL_59;
        }

        v53 = -[OSLogEventSource initWithCollection:metadata:timesync:]( objc_alloc(&OBJC_CLASS___OSLogEventSource),  "initWithCollection:metadata:timesync:",  v78,  v72,  v52);
        _progress(v50, v49, 1LL);
        [v49 becomeCurrentWithPendingUnitCount:1];
        if (v50->_relativeFilePaths)
        {
          -[OSLogEventStore addFilesToSource:forCollection:withProgress:]( v50,  "addFilesToSource:forCollection:withProgress:",  v53,  v78,  v49);
          v54 = (void *)v74;
          id v55 = v69;
        }

        else
        {
          int v68 = _enumerateArchiveIntoSource(v53, v78, v20->_progressHandler, v4);
          v54 = (void *)v74;
          id v55 = v69;
          if (!v68)
          {
LABEL_57:

            double v22 = v78;
            goto LABEL_58;
          }
        }

        [v49 resignCurrent];
        _progress(v50, v49, 0LL);
        ((void (**)(id, OSLogEventSource *, uint64_t))v4)[2](v4, v53, 0LL);
        goto LABEL_57;
      }

      v59 = __error();
      _OSLogPOSIXError(5LL, *v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0LL, (uint64_t)v60);

      double v22 = v78;
    }

    else
    {
      _OSLogPOSIXError(4, [v24 code]);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0LL, (uint64_t)v36);
    }

    -[_OSLogCollectionReference close](v22, "close");
LABEL_60:

    goto LABEL_61;
  }

  int v12 = v11;
  uint64_t v13 = -[_OSLogDirectoryReference initWithDescriptor:]( objc_alloc(&OBJC_CLASS____OSLogDirectoryReference),  "initWithDescriptor:",  v11);
  if (close(v12) != -1) {
    goto LABEL_12;
  }
  int v14 = *__error();
  uint64_t v15 = *__error();
  if (v14 != 9)
  {
    _os_assumes_log();
    goto LABEL_12;
  }

- (NSURL)_archiveURL
{
  return self->_archiveURL;
}

- (void)set_archiveURL:(id)a3
{
}

- (NSArray)_relativeFilePaths
{
  return self->_relativeFilePaths;
}

- (void)set_relativeFilePaths:(id)a3
{
}

- (id)_progressHandler
{
  return self->_progressHandler;
}

- (void)set_progressHandler:(id)a3
{
}

- (id)_upgradeHandler
{
  return self->_upgradeHandler;
}

- (void)set_upgradeHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __48__OSLogEventStore_prepareWithCompletionHandler___block_invoke(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

+ (id)localStore
{
  return objc_alloc_init(&OBJC_CLASS___OSLogEventLocalStore);
}

+ (id)localStoreWithRelativePaths:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___OSLogEventLocalStore);
  -[OSLogEventStore set_relativeFilePaths:](v4, "set_relativeFilePaths:", v3);

  return v4;
}

+ (id)storeWithArchiveURL:(id)a3
{
  id v3 = a3;
  v4 = -[OSLogEventStore initWithArchiveURL:](objc_alloc(&OBJC_CLASS___OSLogEventStore), "initWithArchiveURL:", v3);

  return v4;
}

+ (id)storeWithFileURL:(id)a3
{
  v15[1] = *MEMORY[0x1895F89C0];
  [a3 pathComponents];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)[v4 mutableCopy];

  [MEMORY[0x189603FA8] array];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  while ([v5 count])
  {
    [v5 lastObject];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = [v7 hasSuffix:@".logarchive"];

    if ((v8 & 1) != 0) {
      break;
    }
    [v5 lastObject];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 insertObject:v9 atIndex:0];

    [v5 removeLastObject];
  }

  if ([v5 count])
  {
    [MEMORY[0x189604030] fileURLWithPathComponents:v5];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v10 = 0LL;
  }

  if ([v6 count])
  {
    [v6 componentsJoinedByString:@"/"];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    [MEMORY[0x189603F18] arrayWithObjects:v15 count:1];
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int v12 = 0LL;
  }

  uint64_t v13 = (void *)[objc_alloc((Class)a1) initWithArchiveURL:v10 relativePaths:v12];

  return v13;
}

+ (id)storeWithArchiveURL:(id)a3 relativePaths:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = (void *)[objc_alloc((Class)a1) initWithArchiveURL:v7 relativePaths:v6];

  return v8;
}

@end