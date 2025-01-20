@interface CheckHashesOperation
- (CheckHashesOperation)initWithFilePath:(id)a3 hashes:(id)a4 bytesToHash:(int64_t)a5;
- (NSArray)hashes;
- (NSString)filePath;
- (int64_t)numberOfBytesToHash;
- (void)dealloc;
- (void)run;
@end

@implementation CheckHashesOperation

- (CheckHashesOperation)initWithFilePath:(id)a3 hashes:(id)a4 bytesToHash:(int64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CheckHashesOperation;
  v8 = -[CheckHashesOperation init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_bytesToHash = a5;
    v8->_filePath = (NSString *)[a3 copy];
    v9->_hashes = (NSArray *)[a4 copy];
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CheckHashesOperation;
  -[CheckHashesOperation dealloc](&v3, "dealloc");
}

- (NSString)filePath
{
  return self->_filePath;
}

- (NSArray)hashes
{
  return self->_hashes;
}

- (int64_t)numberOfBytesToHash
{
  return self->_bytesToHash;
}

- (void)run
{
  id v2 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v2) {
    id v2 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v3 = [v2 shouldLog];
  v4 = (os_log_s *)[v2 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 & 2;
  }
  if ((_DWORD)v5)
  {
    uint64_t v6 = objc_opt_class(self);
    __darwin_ino64_t v7 = -[NSArray count](self->_hashes, "count");
    int64_t bytesToHash = self->_bytesToHash;
    filePath = self->_filePath;
    v88.st_dev = 138413058;
    *(void *)&v88.st_mode = v6;
    WORD2(v88.st_ino) = 2048;
    *(__darwin_ino64_t *)((char *)&v88.st_ino + 6) = v7;
    HIWORD(v88.st_gid) = 2048;
    *(void *)&v88.st_rdev = bytesToHash;
    LOWORD(v88.st_atimespec.tv_sec) = 2112;
    *(__darwin_time_t *)((char *)&v88.st_atimespec.tv_sec + 2) = (__darwin_time_t)filePath;
    uint64_t v10 = _os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  1LL,  "%@: Checking %lu hashes with chunk size: %lld for file: %@",  &v88,  42);
    if (v10)
    {
      objc_super v11 = (void *)v10;
      v12 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v10, 4LL);
      free(v11);
      v62 = v12;
      SSFileLog(v2, @"%@");
    }
  }

  v13 = self;
  int v14 = open(-[NSString fileSystemRepresentation](self->_filePath, "fileSystemRepresentation", v62), 0);
  if (v14 == -1)
  {
    v44 = __error();
    id v22 = (id)SSError(NSPOSIXErrorDomain, *v44, 0LL, 0LL);
    id v45 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v45) {
      id v45 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v46 = [v45 shouldLog];
    v47 = (os_log_s *)[v45 OSLogObject];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v49 = v46;
    }
    else {
      uint64_t v49 = v46 & 2;
    }
    if ((_DWORD)v49)
    {
      uint64_t v50 = objc_opt_class(self);
      v88.st_dev = 138412546;
      *(void *)&v88.st_mode = v50;
      WORD2(v88.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&v88.st_ino + 6) = (__darwin_ino64_t)v22;
      LODWORD(v64) = 22;
      uint64_t v51 = _os_log_send_and_compose_impl( v49,  0LL,  0LL,  0LL,  &_mh_execute_header,  v47,  0LL,  "%@: Could not open asset to check hashes: %@",  &v88,  v64);
      if (v51)
      {
        v52 = (void *)v51;
        v53 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v51, 4LL);
        free(v52);
        v63 = v53;
        *(void *)&double v48 = SSFileLog(v45, @"%@").n128_u64[0];
      }
    }

    uint64_t v54 = 0LL;
  }

  else
  {
    int64_t st_size = self->_bytesToHash;
    int v74 = v14;
    if (!fstat(v14, &v88)) {
      int64_t st_size = v88.st_size;
    }
    int64_t v16 = self->_bytesToHash;
    if ((id)-[NSArray count](self->_hashes, "count") == (id)1) {
      int64_t v17 = st_size;
    }
    else {
      int64_t v17 = v16;
    }
    uint64_t v18 = OBJC_IVAR___ISOperation__progress;
    [*(id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress] setMaxValue:st_size];
    uint64_t v66 = v18;
    [*(id *)&self->ISOperation_opaque[v18] setUnits:1];
    v19 = malloc(0x20000uLL);
    if (v19)
    {
      v20 = v19;
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      obj = self->_hashes;
      id v69 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v75,  v86,  16LL);
      if (v69)
      {
        uint64_t v21 = 0LL;
        id v22 = 0LL;
        uint64_t v68 = *(void *)v76;
        uint64_t v65 = SSErrorDomain;
        LOBYTE(v23) = 1;
        int v24 = v74;
LABEL_20:
        id v25 = 0LL;
        while (1)
        {
          if (*(void *)v76 != v68) {
            objc_enumerationMutation(obj);
          }
          v72 = (char *)v25;
          uint64_t v70 = *(void *)(*((void *)&v75 + 1) + 8LL * (void)v25);
          v71 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
          CC_MD5_Init(&c);
          int64_t v26 = 0LL;
          do
          {
            if (v17 <= v26) {
              break;
            }
            int64_t v27 = (unint64_t)(v17 - v26) >= 0x20000 ? 0x20000LL : v17 - v26;
            ssize_t v28 = read(v24, v20, v27);
            if (v28 < 0)
            {

              v29 = __error();
              id v22 = (id)SSError(NSPOSIXErrorDomain, *v29, 0LL, 0LL);
              id v30 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
              if (!v30) {
                id v30 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
              }
              LODWORD(v23) = objc_msgSend(v30, "shouldLog", v63);
              v31 = (os_log_s *)[v30 OSLogObject];
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
                uint64_t v23 = v23;
              }
              else {
                v23 &= 2u;
              }
              if ((_DWORD)v23)
              {
                uint64_t v32 = objc_opt_class(self);
                int v79 = 138412546;
                uint64_t v80 = v32;
                __int16 v81 = 2112;
                id v82 = v22;
                LODWORD(v64) = 22;
                uint64_t v23 = _os_log_send_and_compose_impl( v23,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  0LL,  "%@: Read failed during hash check: %@",  &v79,  v64);
                if (v23)
                {
                  v33 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL);
                  free((void *)v23);
                  v63 = v33;
                  SSFileLog(v30, @"%@");
                  LOBYTE(v23) = 0;
                }
              }

              int v24 = v74;
            }

            else
            {
              CC_MD5_Update(&c, v20, v28);
              v26 += v28;
              v21 += v28;
            }
          }

          while (v28 >= v27);
          if ((v23 & 1) != 0)
          {
            CC_MD5_Final(md, &c);
            v35 = (void *)ISStringFromDigest(md, 16LL);
            if ([v35 isEqualToString:v70])
            {
              [*(id *)&self->ISOperation_opaque[v66] setCurrentValue:v21];
              [*(id *)&self->ISOperation_opaque[v66] snapshot];
              -[CheckHashesOperation sendProgressToDelegate](self, "sendProgressToDelegate");
              v34 = v72;
            }

            else
            {
              id v36 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
              if (!v36) {
                id v36 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
              }
              unsigned int v37 = objc_msgSend(v36, "shouldLog", v63);
              v38 = (os_log_s *)[v36 OSLogObject];
              uint64_t v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT) ? v37 : v37 & 2u;
              v34 = v72;
              if ((_DWORD)v39)
              {
                uint64_t v40 = objc_opt_class(self);
                int v79 = 138412802;
                uint64_t v80 = v40;
                __int16 v81 = 2112;
                id v82 = v35;
                __int16 v83 = 2112;
                uint64_t v84 = v70;
                LODWORD(v64) = 32;
                uint64_t v41 = _os_log_send_and_compose_impl( v39,  0LL,  0LL,  0LL,  &_mh_execute_header,  v38,  0LL,  "%@: Got md5: %@ when expecting md5: %@",  &v79,  v64);
                if (v41)
                {
                  v42 = (void *)v41;
                  v43 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v41,  4LL);
                  free(v42);
                  v63 = v43;
                  SSFileLog(v36, @"%@");
                }
              }

              id v22 = (id)SSError(v65, 8LL, 0LL, 0LL);
              LOBYTE(v23) = 0;
              int v24 = v74;
            }
          }

          else
          {
            v34 = v72;
          }

          -[NSAutoreleasePool drain](v71, "drain", v63);
          if ((v23 & 1) == 0) {
            break;
          }
          id v25 = v34 + 1;
          if (v25 == v69)
          {
            id v69 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v75,  v86,  16LL);
            if (v69) {
              goto LABEL_20;
            }
            break;
          }
        }
      }

      else
      {
        id v22 = 0LL;
        LOBYTE(v23) = 1;
        int v24 = v74;
      }

      free(v20);
      uint64_t v54 = v23 & 1;
      v13 = self;
    }

    else
    {
      id v55 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v55) {
        id v55 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v56 = [v55 shouldLog];
      v57 = (os_log_s *)[v55 OSLogObject];
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v58 = v56;
      }
      else {
        uint64_t v58 = v56 & 2;
      }
      v13 = self;
      if ((_DWORD)v58)
      {
        c.A = 138412290;
        *(void *)&c.B = objc_opt_class(self);
        LODWORD(v64) = 12;
        uint64_t v59 = _os_log_send_and_compose_impl( v58,  0LL,  0LL,  0LL,  &_mh_execute_header,  v57,  0LL,  "%@: Could not malloc data buffer to check hashes",  &c,  v64);
        if (v59)
        {
          v60 = (void *)v59;
          v61 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v59, 4LL);
          free(v60);
          v63 = v61;
          SSFileLog(v55, @"%@");
        }
      }

      uint64_t v54 = 0LL;
      id v22 = 0LL;
      int v24 = v74;
    }

    close(v24);
  }

  -[CheckHashesOperation setError:](v13, "setError:", v22, v48, v63);
  -[CheckHashesOperation setSuccess:](v13, "setSuccess:", v54);
}

@end