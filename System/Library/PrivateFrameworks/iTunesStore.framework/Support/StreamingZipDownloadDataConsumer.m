@interface StreamingZipDownloadDataConsumer
- (BOOL)consumeData:(id)a3 error:(id *)a4;
- (BOOL)finish:(id *)a3;
- (BOOL)hasConsumedData;
- (StreamingZipDownloadDataConsumer)initWithPath:(id)a3 options:(id)a4;
- (double)percentComplete;
- (id)_stringWithFileSystemRepresentation:(const char *)a3;
- (id)_stringWithFileSystemRepresentation:(const char *)a3 length:(unint64_t)a4;
- (unint64_t)_diskUsageForPath:(id)a3;
- (unint64_t)diskUsage;
- (unint64_t)resumptionOffset;
- (void)_initializeExtractorWithPath:(id)a3 options:(id)a4;
- (void)reset;
- (void)setExtractionProgress:(double)a3;
- (void)suspend;
- (void)truncate;
@end

@implementation StreamingZipDownloadDataConsumer

- (StreamingZipDownloadDataConsumer)initWithPath:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___StreamingZipDownloadDataConsumer;
  v8 = -[StreamingZipDownloadDataConsumer init](&v16, "init");
  v9 = v8;
  if (v8)
  {
    -[StreamingZipDownloadDataConsumer _initializeExtractorWithPath:options:]( v8,  "_initializeExtractorWithPath:options:",  v6,  v7);
    v10 = *(void **)(&v9->super._overrideProgress + 1);
    if (v10)
    {
      [v10 setExtractorDelegate:v9];
      id v11 = [v7 copy];
      v12 = *(void **)(&v9->_hasConsumedData + 1);
      *(void *)(&v9->_hasConsumedData + 1) = v11;

      v13 = (NSDictionary *)[v6 copy];
      v14 = *(StreamingZipDownloadDataConsumer **)((char *)&v9->_options + 1);
      *(NSDictionary **)((char *)&v9->_options + 1) = v13;
    }

    else
    {
      v14 = v9;
      v9 = 0LL;
    }
  }

  return v9;
}

- (BOOL)consumeData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 1;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_100070128;
  v23 = sub_100070138;
  id v24 = 0LL;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  v8 = *(void **)(&self->super._overrideProgress + 1);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100070140;
  v15[3] = &unk_10034C798;
  v17 = &v19;
  v18 = &v25;
  v9 = v7;
  objc_super v16 = v9;
  [v8 supplyBytes:v6 withCompletionBlock:v15];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = v26;
  if (BYTE1(self->_extractor)) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = *((_BYTE *)v26 + 24) != 0;
  }
  BYTE1(self->_extractor) = v11;
  int v12 = *((unsigned __int8 *)v10 + 24);
  if (a4 && !*((_BYTE *)v10 + 24))
  {
    *a4 = (id) v20[5];
    int v12 = *((unsigned __int8 *)v26 + 24);
  }

  BOOL v13 = v12 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

- (unint64_t)diskUsage
{
  unint64_t result = -[StreamingZipDownloadDataConsumer resumptionOffset](self, "resumptionOffset");
  if (result) {
    return -[StreamingZipDownloadDataConsumer _diskUsageForPath:]( self,  "_diskUsageForPath:",  *(NSDictionary **)((char *)&self->_options + 1));
  }
  return result;
}

- (BOOL)finish:(id *)a3
{
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 1;
  uint64_t v15 = 0LL;
  objc_super v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_100070128;
  uint64_t v19 = sub_100070138;
  id v20 = 0LL;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  id v6 = *(void **)(&self->super._overrideProgress + 1);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10007034C;
  v11[3] = &unk_10034C7C0;
  BOOL v13 = &v15;
  v14 = &v21;
  dispatch_semaphore_t v7 = v5;
  int v12 = v7;
  [v6 finishStreamWithCompletionBlock:v11];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  int v8 = *((unsigned __int8 *)v22 + 24);
  if (a3 && !*((_BYTE *)v22 + 24))
  {
    *a3 = (id) v16[5];
    int v8 = *((unsigned __int8 *)v22 + 24);
  }

  BOOL v9 = v8 != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v9;
}

- (void)reset
{
  BYTE1(self->_extractor) = *(void *)((char *)&self->_percentComplete + 1) != 0LL;
}

- (void)suspend
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  v4 = *(void **)(&self->super._overrideProgress + 1);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000704DC;
  v6[3] = &unk_10034C7E8;
  dispatch_semaphore_t v7 = v3;
  dispatch_semaphore_t v5 = v3;
  [v4 suspendStreamWithCompletionBlock:v6];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)truncate
{
  dispatch_semaphore_t v3 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  -[NSFileManager removeItemAtPath:error:]( v3,  "removeItemAtPath:error:",  *(NSDictionary **)((char *)&self->_options + 1),  0LL);
  -[StreamingZipDownloadDataConsumer _initializeExtractorWithPath:options:]( self,  "_initializeExtractorWithPath:options:",  *(NSDictionary **)((char *)&self->_options + 1),  *(void *)(&self->_hasConsumedData + 1));
  BYTE1(self->_extractor) = *(void *)((char *)&self->_percentComplete + 1) != 0LL;
}

- (void)setExtractionProgress:(double)a3
{
  *(double *)((char *)&self->_path + 1) = a3;
}

- (void)_initializeExtractorWithPath:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"SZExtractor", 24)),  "initWithPath:options:",  v7,  v6);

  BOOL v9 = *(void **)(&self->super._overrideProgress + 1);
  *(void *)(&self->super._overrideProgress + 1) = v8;

  id v10 = objc_alloc_init(&OBJC_CLASS___SSPromise);
  BOOL v11 = *(void **)(&self->super._overrideProgress + 1);
  BOOL v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  uint64_t v15 = sub_100070664;
  objc_super v16 = &unk_10034C810;
  uint64_t v17 = self;
  id v18 = v10;
  id v12 = v10;
  [v11 prepareForExtraction:&v13];
  objc_msgSend(v12, "waitUntilFinished", v13, v14, v15, v16, v17);
}

- (unint64_t)_diskUsageForPath:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 0LL));
  dispatch_semaphore_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL));
  int v97 = 0;
  int v99 = 0;
  unint64_t v96 = 0xA200000900000005LL;
  uint64_t v98 = 0x500000002LL;
  id v6 = (unsigned int *)malloc(0x8000uLL);
  id v7 = &ACSLocateCachingServer_ptr;
  v88 = v3;
  if (v3)
  {
    [v5 addObject:v3];
    goto LABEL_16;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v9 = [v8 shouldLog];
  else {
    unsigned int v10 = v9;
  }
  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v10 & 2;
  }
  if (!(_DWORD)v12) {
    goto LABEL_14;
  }
  int v100 = 138412290;
  id v101 = (id)objc_opt_class(self);
  id v13 = v101;
  uint64_t v14 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "%@: Can't calculate usage if no path given",  &v100,  12,  0LL);

  id v7 = &ACSLocateCachingServer_ptr;
  if (v14)
  {
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
    free(v14);
    v85 = v11;
    SSFileLog(v8, @"%@");
LABEL_14:
  }

LABEL_16:
  if (objc_msgSend(v5, "count", v85))
  {
    unint64_t v93 = 0LL;
    v92 = v4;
    v91 = v5;
    v89 = v6;
    while (1)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 0, v86));
      [v5 removeObjectAtIndex:0];
      id v95 = v15;
      int v16 = open((const char *)[v95 fileSystemRepresentation], 1048832);
      if ((v16 & 0x80000000) == 0)
      {
        int v90 = v16;
        uint64_t v17 = 0LL;
LABEL_20:
        id v6 = v89;
        while (1)
        {
          int v18 = getattrlistbulk(v90, &v96, v89, 0x8000uLL, 0LL);
          if (v18 == -1) {
            break;
          }
          int v19 = v18;
          if (!v18) {
            goto LABEL_138;
          }
          if (v18 >= 1)
          {
            id v20 = v89;
            while (1)
            {
              uint64_t v22 = *v20;
              unsigned int v21 = v20[1];
              unsigned int v23 = v20[4];
              if ((v21 & 0x20000000) != 0)
              {
                if (v20[6])
                {
                  v31 = (void *)objc_claimAutoreleasedReturnValue([v7[459] sharedDaemonConfig]);
                  if (!v31) {
                    v31 = (void *)objc_claimAutoreleasedReturnValue([v7[459] sharedConfig]);
                  }
                  unsigned int v32 = objc_msgSend(v31, "shouldLog", v86);
                  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 OSLogObject]);
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
                    uint64_t v34 = v32;
                  }
                  else {
                    uint64_t v34 = v32 & 2;
                  }
                  if ((_DWORD)v34)
                  {
                    v35 = (void *)objc_opt_class(self);
                    id v36 = v35;
                    v37 = __error();
                    v38 = strerror(*v37);
                    int v100 = 138413058;
                    id v101 = v35;
                    __int16 v102 = 2080;
                    v103 = v38;
                    __int16 v104 = 2048;
                    v105 = v17;
                    __int16 v106 = 2112;
                    v107 = (char *)v95;
                    LODWORD(v87) = 42;
                    v39 = (void *)_os_log_send_and_compose_impl( v34,  0LL,  0LL,  0LL,  &_mh_execute_header,  v33,  0LL,  "%@: Got error %s while processing entry %llu in %@",  &v100,  v87);

                    id v7 = &ACSLocateCachingServer_ptr;
                    if (v39)
                    {
                      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v39,  4LL));
                      free(v39);
                      v86 = v33;
                      SSFileLog(v31, @"%@");
                      goto LABEL_69;
                    }
                  }

                  else
                  {
                    id v7 = &ACSLocateCachingServer_ptr;
LABEL_69:
                  }

                  goto LABEL_109;
                }

                char v24 = (int *)(v20 + 7);
                if ((v21 & 1) == 0)
                {
LABEL_27:
                  uint64_t v25 = 0LL;
                  int v26 = 0;
                  if ((v21 & 8) != 0) {
                    goto LABEL_28;
                  }
                  goto LABEL_43;
                }
              }

              else
              {
                char v24 = (int *)(v20 + 6);
                if ((v21 & 1) == 0) {
                  goto LABEL_27;
                }
              }

              int v26 = v24[1];
              uint64_t v25 = (char *)v24 + *v24;
              v24 += 2;
              if ((v21 & 8) != 0)
              {
LABEL_28:
                int v28 = *v24++;
                int v27 = v28;
                if ((v21 & 0x2000000) != 0) {
                  goto LABEL_29;
                }
                goto LABEL_44;
              }

- (id)_stringWithFileSystemRepresentation:(const char *)a3
{
  return -[StreamingZipDownloadDataConsumer _stringWithFileSystemRepresentation:length:]( self,  "_stringWithFileSystemRepresentation:length:",  a3,  strlen(a3));
}

- (id)_stringWithFileSystemRepresentation:(const char *)a3 length:(unint64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringWithFileSystemRepresentation:a3 length:a4]);

  return v7;
}

- (BOOL)hasConsumedData
{
  return BYTE1(self->_extractor);
}

- (double)percentComplete
{
  return *(double *)((char *)&self->_path + 1);
}

- (unint64_t)resumptionOffset
{
  return *(void *)((char *)&self->_percentComplete + 1);
}

- (void).cxx_destruct
{
}

@end