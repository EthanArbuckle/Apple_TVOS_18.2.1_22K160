@interface OSLogEventLocalStore
- (void)prepareWithCompletionHandler:(id)a3;
@end

@implementation OSLogEventLocalStore

- (void)prepareWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  [MEMORY[0x1896079E0] progressWithTotalUnitCount:6];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v93 = 0LL;
  v6 = +[_OSLogCollectionReference localDBRefWithError:]( &OBJC_CLASS____OSLogCollectionReference,  "localDBRefWithError:",  &v93);
  id v7 = v93;
  v8 = v7;
  if (!v6)
  {
    if (!v7)
    {
      _OSLogError(6LL);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v4[2](v4, 0LL, v8);
    goto LABEL_37;
  }

  id v9 = v5;
  v10 = self;
  objc_msgSend(v9, "setCompletedUnitCount:", objc_msgSend(v9, "completedUnitCount") + 1);
  progressHandler = (void (**)(id, void))v10->super._progressHandler;

  if (progressHandler)
  {
    [v9 fractionCompleted];
    progressHandler[2](progressHandler, 0LL);
  }

  [v6 timesyncReference];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v13 = [v12 fileDescriptor];

  uint64_t v14 = _timesync_db_openat(v13, ".");
  if (!v14)
  {
    uint64_t v43 = *__error();
    uint64_t v44 = 12LL;
LABEL_32:
    _OSLogPOSIXError(v44, v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0LL, v45);

    [v6 close];
    goto LABEL_37;
  }

  uint64_t v15 = v14;
  id v16 = v9;
  v17 = v10;
  objc_msgSend(v16, "setCompletedUnitCount:", objc_msgSend(v16, "completedUnitCount") + 1);
  v18 = (void (**)(id, void))v10->super._progressHandler;

  if (v18)
  {
    [v16 fractionCompleted];
    v18[2](v18, 0LL);
  }

  [v6 diagnosticsDirectoryReference];
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
LABEL_11:
    id v24 = v16;
    v25 = v17;
    objc_msgSend(v24, "setCompletedUnitCount:", objc_msgSend(v24, "completedUnitCount") + 1);
    v26 = (void (**)(id, void))v10->super._progressHandler;

    if (v26)
    {
      [v24 fractionCompleted];
      v26[2](v26, 0LL);
    }

    NSTemporaryDirectory();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      v90 = 0LL;
      asprintf( &v90, "%slsfw-tmp-XXXXXXX.tracev3", (const char *)[v27 UTF8String]);
      if (v90)
      {
        v88 = v19;
        int v29 = mkstemps(v90, 8);
        if (v29 == -1)
        {
          free(v90);
          v19 = v88;
        }

        else
        {
          unlink(v90);
          v30 = fdopen(v29, "w+");
          free(v90);
          v31 = v30;
          v19 = v88;
          if (v31)
          {
            v81 = v28;
            v82 = v31;
            int v32 = fileno(v31);
            v33 = -[OSLogEventStore _relativeFilePaths](v25, "_relativeFilePaths");
            if (v33) {
              uint64_t v34 = 0LL;
            }
            else {
              uint64_t v34 = 3LL;
            }
            unsigned int v86 = v32;
            if ((OSLogCaptureInflightBuffersToFile(v32, v34, 0LL) & 1) == 0)
            {
              fclose(v82);
              unsigned int v86 = -1;
            }

            id v35 = v24;
            v36 = v25;
            objc_msgSend(v35, "setCompletedUnitCount:", objc_msgSend(v35, "completedUnitCount") + 1);
            v37 = (void (**)(id, void))v10->super._progressHandler;
            v79 = v36;

            if (v37)
            {
              [v35 fractionCompleted];
              v37[2](v37, 0LL);
            }

            v38 = -[_OSLogEventStoreMetadata initWithCollection:localStorePlist:liveDataDescriptor:]( objc_alloc(&OBJC_CLASS____OSLogEventStoreMetadata),  "initWithCollection:localStorePlist:liveDataDescriptor:",  v6,  v88,  v86);
            v39 = -[OSLogEventSource initWithCollection:metadata:timesync:]( objc_alloc(&OBJC_CLASS___OSLogEventSource),  "initWithCollection:metadata:timesync:",  v6,  v38,  v15);
            [v35 becomeCurrentWithPendingUnitCount:1];
            [v6 diagnosticsDirectoryReference];
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            v28 = v81;
            v84 = v39;
            v85 = v38;
            if (v40)
            {
              v41 = v79;
              v42 = -[OSLogEventStore _relativeFilePaths](v79, "_relativeFilePaths");
              if (v42)
              {
                -[OSLogEventStore addFilesToSource:forCollection:withProgress:]( v79,  "addFilesToSource:forCollection:withProgress:",  v39,  v6,  v35);
              }

              else
              {
                v54 = -[OSLogEventStore _progressHandler](v79, "_progressHandler");
                char v55 = _enumerateArchiveIntoSource(v39, v6, v54, v4);

                if ((v55 & 1) == 0)
                {
                  fclose(v82);
                  v19 = v88;
                  v68 = v84;
                  v59 = v85;
LABEL_56:

                  goto LABEL_36;
                }
              }
            }

            else
            {
              v41 = v79;
              v49 = -[OSLogEventStore _progressHandler](v79, "_progressHandler");
              if (v49)
              {
                [MEMORY[0x1896079E0] currentProgress];
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                -[OSLogEventStore _progressHandler](v79, "_progressHandler");
                v50 = (void (**)(void, void, double))objc_claimAutoreleasedReturnValue();
                [v78 fractionCompleted];
                double v52 = v51;
                _OSLogPOSIXError(18LL, 2LL);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                ((void (**)(void, void *, double))v50)[2](v50, v53, v52);
              }
            }

            [v35 resignCurrent];
            id v56 = v35;
            v57 = v41;
            objc_msgSend(v56, "setCompletedUnitCount:", objc_msgSend(v56, "completedUnitCount"));
            v58 = (void (**)(id, void))v10->super._progressHandler;

            if (v58)
            {
              [v56 fractionCompleted];
              v58[2](v58, 0LL);
            }

            v59 = v85;
            if (v86 == -1)
            {
LABEL_53:
              id v75 = v56;
              v76 = v57;
              objc_msgSend(v75, "setCompletedUnitCount:", objc_msgSend(v75, "completedUnitCount") + 1);
              v77 = (void (**)(id, void))v10->super._progressHandler;

              if (v77)
              {
                [v75 fractionCompleted];
                v77[2](v77, 0LL);
              }

              v68 = v84;
              ((void (**)(id, OSLogEventSource *, void *))v4)[2](v4, v84, 0LL);
              v19 = v88;
              goto LABEL_56;
            }

            v80 = v57;
            uint64_t v60 = _os_trace_mmap();
            fclose(v82);
            v61 = objc_alloc(&OBJC_CLASS____OSLogChunkMemory);
            v62 = -[_OSLogChunkMemory initWithBytes:size:deallocator:]( v61,  "initWithBytes:size:deallocator:",  v60,  v92,  &__block_literal_global_161_3118);
            id v89 = 0LL;
            v63 = -[_OSLogIndexFile initWithChunkStore:error:]( objc_alloc(&OBJC_CLASS____OSLogIndexFile),  "initWithChunkStore:error:",  v62,  &v89);
            id v64 = v89;
            v87 = v64;
            if (v63)
            {
              -[OSLogEventSource _insertIndexFile:](v84, "_insertIndexFile:", v63);
LABEL_52:

              v59 = v85;
              v57 = v80;
              goto LABEL_53;
            }

            v65 = v64;
            v83 = (FILE *)v62;
            [v64 domain];
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = v66;
            if (v66 == (void *)*MEMORY[0x189607688])
            {
              uint64_t v69 = [v65 code];

              v62 = (_OSLogChunkMemory *)v83;
              if (v69 == 34) {
                goto LABEL_52;
              }
            }

            else
            {

              v62 = (_OSLogChunkMemory *)v83;
            }
            v70 = -[OSLogEventStore _progressHandler](v80, "_progressHandler");
            if (v70)
            {
              -[OSLogEventStore _progressHandler](v80, "_progressHandler");
              v71 = (void (**)(void, void, double))objc_claimAutoreleasedReturnValue();
              [v56 fractionCompleted];
              double v73 = v72;
              _OSLogInternalError(17LL, v87);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(void, void *, double))v71)[2](v71, v74, v73);

              v62 = (_OSLogChunkMemory *)v83;
            }

            goto LABEL_52;
          }
        }
      }
    }

    v47 = __error();
    _OSLogPOSIXError(7LL, *v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0LL, v48);

    [v6 close];
LABEL_36:

    goto LABEL_37;
  }

  [v6 diagnosticsDirectoryReference];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 fileDescriptor];

  uint64_t v21 = _os_trace_mmap_at();
  if (!v21)
  {
    uint64_t v43 = *__error();
    uint64_t v44 = 5LL;
    goto LABEL_32;
  }

  v22 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:v21 length:v92 deallocator:&__block_literal_global_157];
  v91 = 0LL;
  uint64_t v23 = [MEMORY[0x1896079E8] propertyListWithData:v22 options:0 format:0 error:&v91];
  if (v23)
  {
    v19 = (void *)v23;

    goto LABEL_11;
  }

  _OSLogInternalError(5LL, v91);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0LL, v46);

  [v6 close];
LABEL_37:
}

uint64_t __53__OSLogEventLocalStore_prepareWithCompletionHandler___block_invoke_2( int a1,  void *a2,  size_t a3)
{
  return munmap(a2, a3);
}

uint64_t __53__OSLogEventLocalStore_prepareWithCompletionHandler___block_invoke(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

@end