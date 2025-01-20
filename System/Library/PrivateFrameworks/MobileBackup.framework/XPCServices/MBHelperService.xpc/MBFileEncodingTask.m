@interface MBFileEncodingTask
+ (BOOL)supportsSecureCoding;
+ (id)decodingTaskWithEncodingMethod:(char)a3;
+ (id)encodingTaskWithEncodingMethod:(char)a3;
- (BOOL)_handleCompressionOperation:(int)a3 algorithm:(int)a4 destinationSize:(unint64_t *)a5 error:(id *)a6;
- (BOOL)sourceIsLive;
- (BOOL)validate;
- (MBFileEncodingTask)initWithCoder:(id)a3;
- (MBFileEncodingTask)initWithType:(char)a3 encodingMethod:(char)a4;
- (NSData)destinationDigest;
- (NSData)sourceDigest;
- (NSError)error;
- (NSNumber)spaceSavingsThreshold;
- (NSString)destinationPath;
- (NSString)sourcePath;
- (OS_dispatch_group)group;
- (char)compressionMethod;
- (char)encodingMethod;
- (char)type;
- (id)_archive;
- (id)_compress;
- (id)_decompress;
- (id)_unarchive;
- (unint64_t)destinationSize;
- (unsigned)protectionClass;
- (void)_finishWithError:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCompressionMethod:(char)a3;
- (void)setDestinationDigest:(id)a3;
- (void)setDestinationPath:(id)a3;
- (void)setDestinationSize:(unint64_t)a3;
- (void)setEncodingMethod:(char)a3;
- (void)setError:(id)a3;
- (void)setGroup:(id)a3;
- (void)setProtectionClass:(unsigned __int8)a3;
- (void)setSourceDigest:(id)a3;
- (void)setSourceIsLive:(BOOL)a3;
- (void)setSourcePath:(id)a3;
- (void)setSpaceSavingsThreshold:(id)a3;
- (void)setType:(char)a3;
- (void)setValidate:(BOOL)a3;
- (void)start;
@end

@implementation MBFileEncodingTask

+ (id)encodingTaskWithEncodingMethod:(char)a3
{
  return  -[MBFileEncodingTask initWithType:encodingMethod:]( objc_alloc(&OBJC_CLASS___MBFileEncodingTask),  "initWithType:encodingMethod:",  1LL,  a3);
}

+ (id)decodingTaskWithEncodingMethod:(char)a3
{
  return  -[MBFileEncodingTask initWithType:encodingMethod:]( objc_alloc(&OBJC_CLASS___MBFileEncodingTask),  "initWithType:encodingMethod:",  2LL,  a3);
}

- (MBFileEncodingTask)initWithType:(char)a3 encodingMethod:(char)a4
{
  if (!a3) {
    sub_100011F44();
  }
  uint64_t v4 = a4;
  if (!a4) {
    sub_100011F6C();
  }
  uint64_t v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MBFileEncodingTask;
  v6 = -[MBFileEncodingTask init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[MBFileEncodingTask setType:](v6, "setType:", v5);
    -[MBFileEncodingTask setEncodingMethod:](v7, "setEncodingMethod:", v4);
    -[MBFileEncodingTask setCompressionMethod:](v7, "setCompressionMethod:", 0xFFFFFFFFLL);
    -[MBFileEncodingTask setProtectionClass:](v7, "setProtectionClass:", 255LL);
    -[MBFileEncodingTask setValidate:](v7, "setValidate:", 0LL);
  }

  return v7;
}

- (void)start
{
  unsigned int v3 = -[MBFileEncodingTask type](self, "type");
  unsigned int v4 = v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask group](self, "group"));
  if (!v5) {
    sub_100011FBC();
  }

  if (-[MBFileEncodingTask validate](self, "validate") && (MBIsInternalInstall() & 1) == 0) {
    sub_100011FE4();
  }
  v6 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask group](self, "group"));
  dispatch_group_enter(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourcePath](self, "sourcePath"));
  if (!v7 || !-[MBFileEncodingTask compressionMethod](self, "compressionMethod"))
  {

    goto LABEL_15;
  }

  unsigned int v8 = -[MBFileEncodingTask protectionClass](self, "protectionClass");

  if (v8 == 255)
  {
LABEL_15:
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[MBError errorWithCode:format:]( &OBJC_CLASS___MBError,  "errorWithCode:format:",  1LL,  @"Invalid arguments: no source path, or unspecified compression or protection class"));
    -[MBFileEncodingTask _finishWithError:](self, "_finishWithError:", v13);

    return;
  }

  if (v4 == 1)
  {
    if (qword_100022370 != -1) {
      dispatch_once(&qword_100022370, &stru_10001CAF0);
    }
    objc_super v9 = (dispatch_semaphore_s *)(id)qword_100022368;
    if (qword_100022380 != -1) {
      dispatch_once(&qword_100022380, &stru_10001CB10);
    }
    v10 = &qword_100022378;
  }

  else
  {
    if (qword_100022390 != -1) {
      dispatch_once(&qword_100022390, &stru_10001CB30);
    }
    objc_super v9 = (dispatch_semaphore_s *)(id)qword_100022388;
    if (qword_1000223A0 != -1) {
      dispatch_once(&qword_1000223A0, &stru_10001CB50);
    }
    v10 = &qword_100022398;
  }

  v11 = (dispatch_queue_s *)(id)*v10;
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E16C;
  block[3] = &unk_10001CAB0;
  char v16 = v4;
  block[4] = self;
  v15 = v9;
  v12 = v9;
  dispatch_async(v11, block);
}

- (void)_finishWithError:(id)a3
{
  if (a3)
  {
    -[MBFileEncodingTask setError:](self, "setError:");
    -[MBFileEncodingTask setDestinationSize:](self, "setDestinationSize:", 0LL);
    -[MBFileEncodingTask setCompressionMethod:](self, "setCompressionMethod:", 0LL);
  }

  unsigned int v4 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask group](self, "group"));
  dispatch_group_leave(v4);

  -[MBFileEncodingTask setGroup:](self, "setGroup:", 0LL);
}

- (id)_compress
{
  unsigned int v54 = 0;
  id v53 = 0LL;
  BOOL v3 = sub_10000E7C8(-[MBFileEncodingTask compressionMethod](self, "compressionMethod"), (int *)&v54, &v53);
  id v4 = v53;
  id v5 = v4;
  if (v3)
  {
    id v51 = v4;
    uint64_t v52 = 0LL;
    unsigned int v6 = -[MBFileEncodingTask _handleCompressionOperation:algorithm:destinationSize:error:]( self,  "_handleCompressionOperation:algorithm:destinationSize:error:",  0LL,  v54,  &v52,  &v51);
    id v7 = v51;

    if (v6)
    {
      unsigned __int8 v50 = 0;
      id v49 = v7;
      char v8 = sub_10000E894(v54, (char *)&v50, &v49);
      id v5 = v49;

      if ((v8 & 1) == 0) {
        sub_10001214C();
      }
      if (!v50) {
        sub_1000120FC();
      }
      if (v50 == 255) {
        sub_100012124();
      }
      if (!-[MBFileEncodingTask encodingMethod](self, "encodingMethod")) {
        sub_10001200C();
      }
      if (-[MBFileEncodingTask encodingMethod](self, "encodingMethod") == -1) {
        sub_100012034();
      }
      -[MBFileEncodingTask setCompressionMethod:](self, "setCompressionMethod:", (char)v50);
      -[MBFileEncodingTask setDestinationSize:](self, "setDestinationSize:", v52);
      if (!-[MBFileEncodingTask validate](self, "validate")) {
        goto LABEL_21;
      }
      if (-[MBFileEncodingTask sourceIsLive](self, "sourceIsLive")) {
        goto LABEL_21;
      }
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourceDigest](self, "sourceDigest"));

      if (!v9) {
        goto LABEL_21;
      }
      char v48 = 0;
      if ((sub_10000E894(v54, &v48, 0LL) & 1) == 0) {
        sub_1000120D4();
      }
      uint64_t v10 = objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask destinationPath](self, "destinationPath"));
      if (!v10) {
        sub_10001205C();
      }
      v11 = (void *)v10;
      v12 = dispatch_group_create();
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MBFileEncodingTask decodingTaskWithEncodingMethod:]( &OBJC_CLASS___MBFileEncodingTask,  "decodingTaskWithEncodingMethod:",  -[MBFileEncodingTask encodingMethod](self, "encodingMethod")));
      [v13 setSourcePath:v11];
      [v13 setDestinationPath:0];
      [v13 setCompressionMethod:v48];
      objc_msgSend(v13, "setProtectionClass:", -[MBFileEncodingTask protectionClass](self, "protectionClass"));
      [v13 setValidate:1];
      [v13 setGroup:v12];
      [v13 start];
      dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 error]);

      if (v14)
      {
        id v15 = MBGetDefaultLog();
        char v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourcePath](self, "sourcePath"));
          v18 = (void *)-[MBFileEncodingTask encodingMethod](self, "encodingMethod");
          uint64_t v19 = v48;
          v20 = (void *)objc_claimAutoreleasedReturnValue([v13 error]);
          *(_DWORD *)buf = 138413314;
          v56 = v11;
          __int16 v57 = 2112;
          v58 = v17;
          __int16 v59 = 2048;
          v60 = v18;
          __int16 v61 = 2048;
          uint64_t v62 = v19;
          __int16 v63 = 2112;
          v64 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_FAULT,  "Failed to validate the compressed file at %@(%@), e:%ld/0x%lx, error:%@",  buf,  0x34u);

          v21 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourcePath](self, "sourcePath"));
          -[MBFileEncodingTask encodingMethod](self, "encodingMethod");
          v47 = (void *)objc_claimAutoreleasedReturnValue([v13 error]);
          _MBLog( @"FAULT",  (uint64_t)"Failed to validate the compressed file at %@(%@), e:%ld/0x%lx, error:%@",  v22,  v23,  v24,  v25,  v26,  v27,  (uint64_t)v11);
        }

        unsigned int v28 = 0;
        v29 = v5;
        id v5 = (id)objc_claimAutoreleasedReturnValue([v13 error]);
      }

      else
      {
        uint64_t v33 = objc_claimAutoreleasedReturnValue([v13 destinationDigest]);
        if (!v33) {
          sub_100012084();
        }
        v29 = (void *)v33;
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourceDigest](self, "sourceDigest"));
        unsigned int v28 = [v34 isEqualToData:v29];

        if ((v28 & 1) == 0)
        {
          id v35 = MBGetDefaultLog();
          v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourceDigest](self, "sourceDigest"));
            *(_DWORD *)buf = 138412802;
            v56 = v11;
            __int16 v57 = 2112;
            v58 = v37;
            __int16 v59 = 2112;
            v60 = v29;
            _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_FAULT,  "Mismatched SHA256 for the file at %@, %@ != %@",  buf,  0x20u);

            v46 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourceDigest](self, "sourceDigest"));
            _MBLog( @"FAULT",  (uint64_t)"Mismatched SHA256 for the file at %@, %@ != %@",  v38,  v39,  v40,  v41,  v42,  v43,  (uint64_t)v11);
          }

          v44 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourceDigest](self, "sourceDigest"));
          uint64_t v45 = objc_claimAutoreleasedReturnValue( +[MBError errorWithCode:path:format:]( &OBJC_CLASS___MBError,  "errorWithCode:path:format:",  1LL,  v11,  @"Mismatched digests, %@ != %@",  v44,  v29));

          id v5 = (id)v45;
        }
      }

      if ((v28 & 1) != 0) {
        goto LABEL_20;
      }
    }

    else
    {
      unsigned int v28 = 0;
      id v5 = v7;
    }
  }

  else
  {
    unsigned int v28 = 0;
  }

  if (!v5) {
    sub_1000120AC();
  }
LABEL_20:
  v30 = v5;
  if (v28) {
LABEL_21:
  }
    v30 = 0LL;
  id v31 = v30;

  return v31;
}

- (id)_decompress
{
  unsigned int v17 = 0;
  id v16 = 0LL;
  BOOL v3 = sub_10000E7C8(-[MBFileEncodingTask compressionMethod](self, "compressionMethod"), (int *)&v17, &v16);
  id v4 = v16;
  id v5 = v4;
  if (v3)
  {
    id v14 = v4;
    uint64_t v15 = 0LL;
    unsigned int v6 = -[MBFileEncodingTask _handleCompressionOperation:algorithm:destinationSize:error:]( self,  "_handleCompressionOperation:algorithm:destinationSize:error:",  1LL,  v17,  &v15,  &v14);
    id v7 = v14;

    if (v6)
    {
      char v13 = 0;
      id v12 = v7;
      char v8 = sub_10000E894(v17, &v13, &v12);
      id v5 = v12;

      if ((v8 & 1) == 0) {
        sub_1000121EC();
      }
      -[MBFileEncodingTask setCompressionMethod:](self, "setCompressionMethod:", v13);
      -[MBFileEncodingTask setDestinationSize:](self, "setDestinationSize:", v15);
      objc_super v9 = 0LL;
      goto LABEL_7;
    }

    id v5 = v7;
  }

  objc_super v9 = v5;
  if (!v5) {
    sub_100012214();
  }
LABEL_7:
  id v10 = v9;

  return v10;
}

- (BOOL)_handleCompressionOperation:(int)a3 algorithm:(int)a4 destinationSize:(unint64_t *)a5 error:(id *)a6
{
  if (!a5) {
    sub_100012264();
  }
  if (!a6) {
    sub_10001228C();
  }
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourcePath](self, "sourcePath"));
  if (!v11) {
    sub_1000122B4();
  }
  id v12 = (void *)v11;
  char v13 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask destinationPath](self, "destinationPath"));
  uint64_t v14 = -[MBFileEncodingTask protectionClass](self, "protectionClass");
  if ((_DWORD)v14 == 255) {
    sub_1000122DC();
  }
  uint64_t v15 = v14;
  double v147 = 0.0;
  double v148 = 0.0;
  int v16 = open((const char *)[v12 fileSystemRepresentation], 256);
  int v17 = v16;
  if (v16 == -1)
  {
    v18 = @"Failed to open src file";
    goto LABEL_10;
  }

  if (fstat(v16, &v146))
  {
    v18 = @"Failed to fstat src file";
LABEL_10:
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithPath:format:](&OBJC_CLASS___MBError, "posixErrorWithPath:format:", v12, v18));
LABEL_11:
    id v20 = v19;
    BOOL v21 = 0;
    *a6 = v20;
    goto LABEL_12;
  }

  off_t st_size = v146.st_size;
  if (!v146.st_size)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[MBError errorWithCode:format:]( &OBJC_CLASS___MBError,  "errorWithCode:format:",  1LL,  @"Invalid file size (0)"));
    id v27 = MBGetDefaultLog();
    unsigned int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "Invalid file size (0)", buf, 2u);
      _MBLog(@"FAULT", (uint64_t)"Invalid file size (0)", v29, v30, v31, v32, v33, v34, v111);
    }

    goto LABEL_11;
  }

  v139 = a6;
  compression_algorithm algorithm = a4;
  __darwin_time_t tv_sec = v146.st_mtimespec.tv_sec;
  if (v13)
  {
    uint64_t v23 = open((const char *)[v13 fileSystemRepresentation], 1794, 384);
    if ((_DWORD)v23 == -1)
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[MBError posixErrorWithPath:format:]( &OBJC_CLASS___MBError,  "posixErrorWithPath:format:",  v13,  @"Failed to create dst file"));
      goto LABEL_11;
    }

    int v24 = v23;
    id v145 = 0LL;
    uint64_t v25 = v15;
    unsigned __int8 v26 = +[MBProtectionClassUtils setWithFD:value:error:]( &OBJC_CLASS___MBProtectionClassUtils,  "setWithFD:value:error:",  v23,  v15,  &v145);
    id v138 = v145;
    if ((v26 & 1) == 0)
    {
      id v57 = MBGetDefaultLog();
      v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v138;
        _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_ERROR,  "Failed to set protection class on the file at %@, error:%@",  buf,  0x16u);
        _MBLog( @"ERROR",  (uint64_t)"Failed to set protection class on the file at %@, error:%@",  v59,  v60,  v61,  v62,  v63,  v64,  (uint64_t)v13);
      }

      id v20 = v138;
      *a6 = v20;
      goto LABEL_121;
    }

    uint64_t v15 = v25;
  }

  else
  {
    id v138 = 0LL;
    int v24 = -1;
  }

  double Current = CFAbsoluteTimeGetCurrent();
  unsigned __int8 v36 = -[MBFileEncodingTask validate](self, "validate");
  v127 = a5;
  if (a3)
  {
    if ((v36 & 1) != 0)
    {
      v37 = malloc(0x10000uLL);
      v144 = (void *)objc_claimAutoreleasedReturnValue(+[MBDigest sha256](&OBJC_CLASS___MBDigest, "sha256"));
      v136 = 0LL;
      uint64_t v38 = 0LL;
      char v134 = 1;
      char v135 = 0;
      uint64_t v39 = (id *)&v147;
      goto LABEL_31;
    }
  }

  else if ((v36 & 1) != 0)
  {
    v37 = malloc(0x10000uLL);
    v136 = (void *)objc_claimAutoreleasedReturnValue(+[MBDigest sha256](&OBJC_CLASS___MBDigest, "sha256"));
    uint64_t v39 = 0LL;
    v144 = 0LL;
    uint64_t v38 = (id *)&v148;
    char v134 = 0;
    char v135 = 1;
    goto LABEL_31;
  }

  v37 = malloc(0x10000uLL);
  v136 = 0LL;
  uint64_t v39 = 0LL;
  uint64_t v38 = 0LL;
  v144 = 0LL;
  char v134 = 1;
  char v135 = 1;
LABEL_31:
  if (!v37) {
    sub_100012304();
  }
  location = v38;
  v130 = v39;
  *(void *)v150 = 0LL;
  memset(buf, 0, sizeof(buf));
  int __fd = v24;
  uint64_t v126 = v15;
  if (compression_stream_init((compression_stream *)buf, (compression_stream_operation)a3, algorithm))
  {
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[MBError errorWithCode:format:]( &OBJC_CLASS___MBError,  "errorWithCode:format:",  1LL,  @"compression_stream_init failed"));
LABEL_34:
    free(v37);
    double v131 = 0.0;
    id v41 = 0LL;
    uint64_t v42 = 0LL;
  }

  else
  {
    double v43 = 0.0;
    off_t v44 = 0LL;
    *(void *)&buf[16] = -1LL;
    *(void *)&buf[24] = 0LL;
    *(void *)buf = v37;
    *(void *)&buf[8] = 0x10000LL;
    char v45 = 1;
    v141 = v13;
    while (1)
    {
      uint64_t v46 = -1LL;
      char v124 = v45;
LABEL_37:
      if ((v45 & 1) == 0) {
        break;
      }
      if (v46 != -1) {
        munmap((void *)v46, 0x20000uLL);
      }
      else {
        uint64_t v47 = st_size - v44;
      }
      if (st_size >= v44 && v47)
      {
        char v48 = mmap(0LL, 0x20000uLL, 1, 2, v17, v44);
        if (v48 != (void *)-1LL)
        {
          id v49 = v48;
          off_t v132 = v44 + 0x20000;
          [v136 updateWithBytes:v48 length:v47];
          int v50 = 0;
          v128 = v49;
          *(void *)&buf[16] = v49;
          *(void *)&buf[24] = v47;
          goto LABEL_50;
        }

        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[MBError posixErrorWithFormat:]( &OBJC_CLASS___MBError,  "posixErrorWithFormat:",  @"Failed to mmap the src file"));
        compression_stream_destroy((compression_stream *)buf);
        goto LABEL_34;
      }

      *(void *)&buf[16] = -1LL;
      *(void *)&buf[24] = 0LL;
      char v45 = 0;
    }

    off_t v132 = v44;
    v128 = (void *)v46;
    int v50 = 1;
    do
    {
      while (1)
      {
LABEL_50:
        compression_status v51 = compression_stream_process((compression_stream *)buf, v50);
        compression_status v52 = v51;
        if (v51 >= 2)
        {
          id v65 = MBGetDefaultLog();
          v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
          char v13 = v141;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v167 = 134218240;
            uint64_t v168 = a3;
            __int16 v169 = 2048;
            uint64_t v170 = v52;
            _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEFAULT,  "compression_stream_process(%ld) failed with status:%ld",  v167,  0x16u);
            _MBLog( @"DEFAULT",  (uint64_t)"compression_stream_process(%ld) failed with status:%ld",  v67,  v68,  v69,  v70,  v71,  v72,  a3);
          }

          if (a3) {
            uint64_t v73 = 11LL;
          }
          else {
            uint64_t v73 = 10LL;
          }
          uint64_t v74 = objc_claimAutoreleasedReturnValue( +[MBError errorWithCode:format:]( &OBJC_CLASS___MBError,  "errorWithCode:format:",  v73,  @"compression_stream_process failed"));
          goto LABEL_78;
        }

        BOOL v53 = !*(void *)&buf[8] && v51 != COMPRESSION_STATUS_END;
        if (v51 == COMPRESSION_STATUS_END || !*(void *)&buf[8]) {
          break;
        }
        if (!v53) {
          goto LABEL_66;
        }
      }

      if (*(void *)buf - (void)v37 > 0x10000uLL) {
        sub_100012354();
      }
      if (*(void *)&buf[8] > 0x10000uLL) {
        sub_10001237C();
      }
      if (*(void *)&buf[8] != 0x10000LL)
      {
        double v54 = v43;
        size_t v55 = 0x10000LL - *(void *)&buf[8];
        if (v141)
        {
          ssize_t v56 = write(__fd, v37, v55);
          if (v56 == -1 || v56 != v55)
          {
            if (v56 == -1) {
              uint64_t v107 = *__error();
            }
            else {
              uint64_t v107 = 28LL;
            }
            char v13 = v141;
            v109 = "decompressed";
            if (!a3) {
              v109 = "compressed";
            }
            uint64_t v74 = objc_claimAutoreleasedReturnValue( +[MBError errorWithErrno:format:]( &OBJC_CLASS___MBError,  "errorWithErrno:format:",  v107,  @"Failed to write to the %s file",  v109));
LABEL_78:
            uint64_t v40 = (void *)v74;
            double v43 = 0.0;
            id v41 = 0LL;
            id v125 = 0LL;
            char v75 = 0;
            goto LABEL_79;
          }
        }

        [v144 updateWithBytes:v37 length:v55];
        *(void *)&double v43 = v55 + *(void *)&v54;
      }

      *(void *)buf = v37;
      *(void *)&buf[8] = 0x10000LL;
    }

    while (v53);
LABEL_66:
    char v13 = v141;
    uint64_t v46 = (uint64_t)v128;
    off_t v44 = v132;
    char v45 = v124;
    if (v52 != COMPRESSION_STATUS_END) {
      goto LABEL_37;
    }
    if ((v134 & 1) != 0) {
      id v41 = 0LL;
    }
    else {
      id v41 = (id)objc_claimAutoreleasedReturnValue([v136 final]);
    }
    if ((v135 & 1) != 0) {
      id v125 = 0LL;
    }
    else {
      id v125 = (id)objc_claimAutoreleasedReturnValue([v144 final]);
    }
    uint64_t v40 = 0LL;
    char v75 = 1;
LABEL_79:
    compression_stream_destroy((compression_stream *)buf);
    double v131 = v43;
    free(v37);
    if ((v75 & 1) != 0)
    {
      int v76 = 1;
      id v77 = v138;
      uint64_t v42 = v125;
      goto LABEL_85;
    }

    uint64_t v42 = v125;
  }

  id v77 = v40;
  int v76 = 0;
  uint64_t v40 = v77;
LABEL_85:

  if ((v134 & 1) == 0) {
    objc_storeStrong(location, v41);
  }
  int v24 = __fd;
  if ((v135 & 1) == 0) {
    objc_storeStrong(v130, v42);
  }
  id v20 = v77;

  if (!v76) {
    goto LABEL_120;
  }
  double v78 = CFAbsoluteTimeGetCurrent();
  double v79 = v131;
  if (!v13) {
    goto LABEL_94;
  }
  if (!fstat(__fd, &v146))
  {
    if (v146.st_size != *(void *)&v131)
    {
      v106 = +[MBError errorWithCode:path:format:]( &OBJC_CLASS___MBError,  "errorWithCode:path:format:",  1LL,  v13,  @"Mismatched size (%llu != %llu)",  v146.st_size,  *(void *)&v131,  v114,  v115,  v116,  v117,  v118,  *(void *)&v119,  *(void *)&v120,  *(void *)&v121,  *(void *)&v122,  *(void *)&v123);
      goto LABEL_118;
    }

- (id)_archive
{
  unsigned int v123 = 0;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask destinationPath](self, "destinationPath"));

  if (!v3)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[MBError errorWithCode:format:]( &OBJC_CLASS___MBError,  "errorWithCode:format:",  1LL,  @"Invalid argument: no destination path"));
    goto LABEL_7;
  }

  id v122 = 0LL;
  BOOL v4 = sub_10000E7C8(-[MBFileEncodingTask compressionMethod](self, "compressionMethod"), (int *)&v123, &v122);
  id v5 = v122;
  if (!v4)
  {
LABEL_7:
    LODWORD(v11) = 0;
    goto LABEL_17;
  }

  id v6 = objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourcePath](self, "sourcePath"));
  id v7 = (const char *)[v6 fileSystemRepresentation];

  if (stat(v7, &v121))
  {
    char v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourcePath](self, "sourcePath"));
    objc_super v9 = @"Failed to stat src file";
LABEL_5:
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithPath:format:](&OBJC_CLASS___MBError, "posixErrorWithPath:format:", v8, v9));

    LODWORD(v11) = 0;
    goto LABEL_16;
  }

  off_t st_size = v121.st_size;
  __darwin_time_t tv_sec = v121.st_mtimespec.tv_sec;
  id v14 = objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask destinationPath](self, "destinationPath"));
  uint64_t v15 = (const char *)[v14 fileSystemRepresentation];

  uint64_t v16 = +[MBProtectionClassUtils sqliteOpenFlagForProtectionClass:]( &OBJC_CLASS___MBProtectionClassUtils,  "sqliteOpenFlagForProtectionClass:",  -[MBFileEncodingTask protectionClass](self, "protectionClass"));
  unsigned int v17 = -[MBFileEncodingTask encodingMethod](self, "encodingMethod");
  if (v17 == 3)
  {
    uint64_t v18 = 2LL;
  }

  else
  {
    if (v17 != 2) {
      sub_1000123CC();
    }
    uint64_t v18 = 1LL;
  }

  double v119 = 0LL;
  double v120 = 0LL;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v20 = _sqlite3_apple_archive( v7,  v15,  v16,  v18,  v123,  -[MBFileEncodingTask sourceIsLive](self, "sourceIsLive"),  &v119,  &v120);
  double v21 = CFAbsoluteTimeGetCurrent();
  if ((_DWORD)v20)
  {
    id v22 = MBGetDefaultLog();
    off_t v11 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      uint64_t v23 = v120;
      uint64_t v24 = -[MBFileEncodingTask encodingMethod](self, "encodingMethod");
      uint64_t v25 = -[MBFileEncodingTask compressionMethod](self, "compressionMethod");
      unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourcePath](self, "sourcePath"));
      id v27 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask destinationPath](self, "destinationPath"));
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)v128 = v20;
      *(_WORD *)&v128[4] = 2080;
      *(void *)&v128[6] = v23;
      *(_WORD *)&v128[14] = 2048;
      *(void *)&v128[16] = v24;
      *(_WORD *)&v128[24] = 2048;
      *(void *)&v128[26] = v25;
      *(_WORD *)&v128[34] = 2112;
      *(void *)&v128[36] = v26;
      *(_WORD *)&v128[44] = 2112;
      *(void *)&v128[46] = v27;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_FAULT,  "_sqlite3_apple_archive failed, rc:%d, msg:%s, e:%ld/%ld, srcPath:%@, dstPath:%@",  buf,  0x3Au);

      -[MBFileEncodingTask encodingMethod](self, "encodingMethod");
      -[MBFileEncodingTask compressionMethod](self, "compressionMethod");
      double v104 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourcePath](self, "sourcePath"));
      v106 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask destinationPath](self, "destinationPath"));
      _MBLog( @"FAULT",  (uint64_t)"_sqlite3_apple_archive failed, rc:%d, msg:%s, e:%ld/%ld, srcPath:%@, dstPath:%@",  v28,  v29,  v30,  v31,  v32,  v33,  v20);
    }

    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourcePath](self, "sourcePath"));
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[MBError errorWithCode:path:format:]( &OBJC_CLASS___MBError,  "errorWithCode:path:format:",  10LL,  v34,  @"_sqlite3_apple_archive failed, rc:%d, \"%s\"",  v20,  v120));

    sqlite3_free(v120);
    LODWORD(v11) = 0;
    double v120 = 0LL;
    goto LABEL_16;
  }

  double v38 = v21;
  if (v119)
  {
    if (!*(void *)v119) {
      goto LABEL_85;
    }
    uint64_t v39 = 0LL;
    do
      uint64_t v40 = v39 + 1;
    while (*((void *)v119 + ++v39));
    if (v40 != 1) {
LABEL_85:
    }
      sub_1000124E4();
  }

  sqlite3_free(v119);
  if (stat(v15, &v121))
  {
    char v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask destinationPath](self, "destinationPath"));
    objc_super v9 = @"Failed to stat dst file";
    goto LABEL_5;
  }

  off_t v11 = v121.st_size;
  if (v121.st_size)
  {
    unsigned __int8 v118 = 0;
    id v117 = v5;
    char v42 = sub_10000E894(v123, (char *)&v118, &v117);
    id v10 = v117;

    if ((v42 & 1) == 0) {
      sub_1000124BC();
    }
    if (!v118) {
      sub_10001246C();
    }
    if (v118 == 255) {
      sub_100012494();
    }
    if (-[MBFileEncodingTask encodingMethod](self, "encodingMethod") != 2
      && -[MBFileEncodingTask encodingMethod](self, "encodingMethod") != 3)
    {
      sub_100012444();
    }

    id v43 = MBGetDefaultLog();
    off_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      id v109 = v10;
      char v45 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourcePath](self, "sourcePath"));
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask destinationPath](self, "destinationPath"));
      uint64_t v47 = -[MBFileEncodingTask encodingMethod](self, "encodingMethod");
      uint64_t v48 = v123;
      unsigned int v49 = -[MBFileEncodingTask protectionClass](self, "protectionClass");
      *(_DWORD *)buf = 138414594;
      *(void *)v128 = v45;
      *(_WORD *)&v128[8] = 2112;
      *(void *)&v128[10] = v46;
      *(_WORD *)&v128[18] = 2048;
      *(void *)&v128[20] = v47;
      *(_WORD *)&v128[28] = 2048;
      *(void *)&v128[30] = v48;
      double v50 = 1.0 - (double)v11 / (double)st_size;
      if (v11 > st_size) {
        double v50 = 0.0;
      }
      if (!st_size) {
        double v50 = 0.0;
      }
      *(_WORD *)&v128[38] = 1024;
      *(_DWORD *)&v128[40] = v49;
      *(_WORD *)&v128[44] = 2048;
      *(void *)&v128[46] = tv_sec;
      __int16 v129 = 2048;
      off_t v130 = st_size;
      __int16 v131 = 2048;
      off_t v132 = v11;
      __int16 v133 = 2048;
      double v134 = v50;
      __int16 v135 = 2048;
      double v136 = v38 - Current;
      _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_INFO,  "Finished archiving, srcPath:%@, dstPath:%@, e:%ld/0x%lx, pc:%d, srcMTime:%ld, srcSize:%llu, dstSize:%llu, saving s:%.3f, time:%.3fs",  buf,  0x62u);

      compression_status v51 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourcePath](self, "sourcePath"));
      compression_status v52 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask destinationPath](self, "destinationPath"));
      -[MBFileEncodingTask encodingMethod](self, "encodingMethod");
      -[MBFileEncodingTask protectionClass](self, "protectionClass");
      _MBLog( @"INFO",  (uint64_t)"Finished archiving, srcPath:%@, dstPath:%@, e:%ld/0x%lx, pc:%d, srcMTime:%ld, srcSize:%llu, dstSize:%ll u, savings:%.3f, time:%.3fs",  v53,  v54,  v55,  v56,  v57,  v58,  (uint64_t)v51);

      id v10 = v109;
    }

    -[MBFileEncodingTask setCompressionMethod:](self, "setCompressionMethod:", (char)v118);
    -[MBFileEncodingTask setDestinationSize:](self, "setDestinationSize:", v11);
    if (!-[MBFileEncodingTask validate](self, "validate"))
    {
      id v5 = v10;
      goto LABEL_19;
    }

    if ((MBIsInternalInstall() & 1) == 0) {
      sub_10001241C();
    }
    char v116 = 0;
    if ((sub_10000E894(v123, &v116, 0LL) & 1) == 0) {
      sub_1000123F4();
    }
    if (!getuid())
    {
      int v60 = -1;
      id v65 = MBTemporaryPath();
      uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(v65);
LABEL_60:
      if (v63)
      {
        int v76 = dispatch_group_create();
        id v77 = (void *)objc_claimAutoreleasedReturnValue( +[MBFileEncodingTask decodingTaskWithEncodingMethod:]( &OBJC_CLASS___MBFileEncodingTask,  "decodingTaskWithEncodingMethod:",  -[MBFileEncodingTask encodingMethod](self, "encodingMethod")));
        double v78 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask destinationPath](self, "destinationPath"));
        [v77 setSourcePath:v78];

        [v77 setDestinationPath:v63];
        [v77 setCompressionMethod:v116];
        objc_msgSend(v77, "setProtectionClass:", -[MBFileEncodingTask protectionClass](self, "protectionClass"));
        [v77 setGroup:v76];
        [v77 start];
        dispatch_group_wait(v76, 0xFFFFFFFFFFFFFFFFLL);
        double v79 = (void *)objc_claimAutoreleasedReturnValue([v77 error]);

        int v108 = v60;
        uint64_t v107 = v76;
        if (v79)
        {
          id v80 = MBGetDefaultLog();
          id v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
          if (os_log_type_enabled(v81, OS_LOG_TYPE_FAULT))
          {
            v82 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask destinationPath](self, "destinationPath"));
            signed int v83 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourcePath](self, "sourcePath"));
            id v110 = v10;
            uint64_t v84 = -[MBFileEncodingTask encodingMethod](self, "encodingMethod");
            uint64_t v85 = v116;
            uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue([v77 error]);
            *(_DWORD *)buf = 138413314;
            *(void *)v128 = v82;
            *(_WORD *)&v128[8] = 2112;
            *(void *)&v128[10] = v83;
            *(_WORD *)&v128[18] = 2048;
            *(void *)&v128[20] = v84;
            *(_WORD *)&v128[28] = 2048;
            *(void *)&v128[30] = v85;
            *(_WORD *)&v128[38] = 2112;
            *(void *)&v128[40] = v86;
            _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_FAULT,  "Failed to validate the archived SQLite file at %@(%@), e:%ld/0x%lx: %@",  buf,  0x34u);

            uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask destinationPath](self, "destinationPath"));
            uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourcePath](self, "sourcePath"));
            -[MBFileEncodingTask encodingMethod](self, "encodingMethod");
            double v105 = (void *)objc_claimAutoreleasedReturnValue([v77 error]);
            id v10 = v110;
            _MBLog( @"FAULT",  (uint64_t)"Failed to validate the archived SQLite file at %@(%@), e:%ld/0x%lx: %@",  v89,  v90,  v91,  v92,  v93,  v94,  (uint64_t)v87);
          }

          uint64_t v95 = objc_claimAutoreleasedReturnValue([v77 error]);
          LODWORD(v11) = 0;
          id v111 = (id)v95;
        }

        else
        {
          id v111 = v10;
          LODWORD(v11) = 1;
        }

        double v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        [v96 removeItemAtPath:v63 error:0];

        __int128 v114 = 0u;
        __int128 v115 = 0u;
        __int128 v112 = 0u;
        __int128 v113 = 0u;
        id v97 = [&off_10001E078 countByEnumeratingWithState:&v112 objects:v124 count:16];
        if (v97)
        {
          id v98 = v97;
          uint64_t v99 = *(void *)v113;
          do
          {
            for (i = 0LL; i != v98; i = (char *)i + 1)
            {
              if (*(void *)v113 != v99) {
                objc_enumerationMutation(&off_10001E078);
              }
              uint64_t v101 = (void *)objc_claimAutoreleasedReturnValue( [v63 stringByAppendingString:*(void *)(*((void *)&v112 + 1) + 8 * (void)i)]);
              uint64_t v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
              [v102 removeItemAtPath:v101 error:0];
            }

            id v98 = [&off_10001E078 countByEnumeratingWithState:&v112 objects:v124 count:16];
          }

          while (v98);
        }

        if (v108 != -1) {
          close(v108);
        }

        id v10 = v111;
      }

      else
      {
        LODWORD(v11) = 1;
      }

LABEL_16:
      id v5 = v10;
      if ((v11 & 1) != 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }

    if (qword_100022360 != -1) {
      dispatch_once(&qword_100022360, &stru_10001CAD0);
    }
    if ([(id)qword_100022358 getFileSystemRepresentation:buf maxLength:1025])
    {
      int v59 = mkstemp((char *)buf);
      if (v59 != -1)
      {
        int v60 = v59;
        uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        id v62 = [v61 stringWithFileSystemRepresentation:buf length:strlen((const char *)buf)];
        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
LABEL_59:

        goto LABEL_60;
      }

      id v74 = MBGetDefaultLog();
      uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(v74);
      if (os_log_type_enabled((os_log_t)v61, OS_LOG_TYPE_ERROR))
      {
        int v75 = *__error();
        *(_DWORD *)id v125 = 67109120;
        int v126 = v75;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v61,  OS_LOG_TYPE_ERROR,  "mkstemp failed: %{errno}d",  v125,  8u);
        uint64_t v103 = *__error();
        uint64_t v73 = "mkstemp failed: %{errno}d";
        goto LABEL_57;
      }
    }

    else
    {
      id v66 = MBGetDefaultLog();
      uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled((os_log_t)v61, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v125 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v61,  OS_LOG_TYPE_ERROR,  "getFileSystemRepresentation failed",  v125,  2u);
        uint64_t v73 = "getFileSystemRepresentation failed";
LABEL_57:
        _MBLog(@"ERROR", (uint64_t)v73, v67, v68, v69, v70, v71, v72, v103);
      }
    }

    uint64_t v63 = 0LL;
    int v60 = -1;
    goto LABEL_59;
  }

  uint64_t v64 = objc_claimAutoreleasedReturnValue( +[MBError errorWithCode:format:]( &OBJC_CLASS___MBError,  "errorWithCode:format:",  1LL,  @"Invalid size(0) for SQLite archive"));

  id v5 = (id)v64;
LABEL_17:
  if (!v5) {
    sub_1000123A4();
  }
LABEL_18:
  id v35 = v5;
  if ((_DWORD)v11) {
LABEL_19:
  }
    id v35 = 0LL;
  id v36 = v35;

  return v36;
}

- (id)_unarchive
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask destinationPath](self, "destinationPath"));

  if (!v3)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[MBError errorWithCode:format:]( &OBJC_CLASS___MBError,  "errorWithCode:format:",  1LL,  @"Invalid argument: no destination path"));
    goto LABEL_12;
  }

  unsigned int v62 = 0;
  id v61 = 0LL;
  BOOL v4 = sub_10000E7C8(-[MBFileEncodingTask compressionMethod](self, "compressionMethod"), (int *)&v62, &v61);
  id v5 = v61;
  if (!v4) {
    goto LABEL_12;
  }
  id v6 = objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourcePath](self, "sourcePath"));
  id v7 = (const char *)[v6 fileSystemRepresentation];

  if (stat(v7, &v60))
  {
    char v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourcePath](self, "sourcePath"));
    objc_super v9 = @"Failed to stat src file";
LABEL_5:
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[MBError posixErrorWithPath:format:](&OBJC_CLASS___MBError, "posixErrorWithPath:format:", v8, v9));

LABEL_11:
    id v5 = (id)v10;
LABEL_12:
    uint64_t v30 = v5;
    if (!v5) {
      sub_10001250C();
    }
    goto LABEL_13;
  }

  off_t st_size = v60.st_size;
  id v12 = objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask destinationPath](self, "destinationPath"));
  char v13 = (const char *)[v12 fileSystemRepresentation];

  uint64_t v14 = +[MBProtectionClassUtils sqliteOpenFlagForProtectionClass:]( &OBJC_CLASS___MBProtectionClassUtils,  "sqliteOpenFlagForProtectionClass:",  -[MBFileEncodingTask protectionClass](self, "protectionClass"));
  uint64_t v58 = 0LL;
  int v59 = 0LL;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v16 = _sqlite3_apple_unarchive(v7, v13, v14, 0LL, &v58, &v59);
  double v17 = CFAbsoluteTimeGetCurrent();
  if ((_DWORD)v16)
  {
    id v18 = MBGetDefaultLog();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      uint64_t v20 = v59;
      double v21 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourcePath](self, "sourcePath"));
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask destinationPath](self, "destinationPath"));
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)uint64_t v64 = v16;
      *(_WORD *)&v64[4] = 2080;
      *(void *)&v64[6] = v20;
      *(_WORD *)&v64[14] = 2112;
      *(void *)&v64[16] = v21;
      *(_WORD *)&v64[24] = 2112;
      *(void *)&v64[26] = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_FAULT,  "_sqlite3_apple_unarchive failed, rc:%d, msg:%s, srcPath:%@, dstPath:%@",  buf,  0x26u);

      uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourcePath](self, "sourcePath"));
      uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask destinationPath](self, "destinationPath"));
      _MBLog( @"FAULT",  (uint64_t)"_sqlite3_apple_unarchive failed, rc:%d, msg:%s, srcPath:%@, dstPath:%@",  v23,  v24,  v25,  v26,  v27,  v28,  v16);
    }

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourcePath](self, "sourcePath"));
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[MBError errorWithCode:path:format:]( &OBJC_CLASS___MBError,  "errorWithCode:path:format:",  11LL,  v29,  @"_sqlite3_apple_unarchive failed, rc:%d, \"%s\"",  v16,  v59));

    sqlite3_free(v59);
    int v59 = 0LL;
    goto LABEL_11;
  }

  double v33 = v17;
  if (v58)
  {
    if (!*(void *)v58) {
      goto LABEL_26;
    }
    uint64_t v34 = 0LL;
    while (*((void *)v58 + ++v34))
      ;
    if (!v34) {
LABEL_26:
    }
      sub_10001255C();
  }

  sqlite3_free(v58);
  if (stat(v13, &v60))
  {
    char v8 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask destinationPath](self, "destinationPath"));
    objc_super v9 = @"Failed to stat dst file";
    goto LABEL_5;
  }

  off_t v36 = v60.st_size;
  char v57 = 0;
  id v56 = v5;
  char v37 = sub_10000E894(v62, &v57, &v56);
  id v38 = v56;

  if ((v37 & 1) == 0) {
    sub_100012534();
  }
  id v39 = MBGetDefaultLog();
  uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    id v41 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourcePath](self, "sourcePath"));
    char v42 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask destinationPath](self, "destinationPath"));
    uint64_t v43 = -[MBFileEncodingTask encodingMethod](self, "encodingMethod");
    uint64_t v44 = v62;
    unsigned int v45 = -[MBFileEncodingTask protectionClass](self, "protectionClass");
    *(_DWORD *)buf = 138414082;
    *(void *)uint64_t v64 = v41;
    *(_WORD *)&v64[8] = 2112;
    *(void *)&v64[10] = v42;
    *(_WORD *)&v64[18] = 2048;
    *(void *)&v64[20] = v43;
    *(_WORD *)&v64[28] = 2048;
    *(void *)&v64[30] = v44;
    __int16 v65 = 1024;
    unsigned int v66 = v45;
    __int16 v67 = 2048;
    off_t v68 = st_size;
    __int16 v69 = 2048;
    off_t v70 = v36;
    __int16 v71 = 2048;
    double v72 = v33 - Current;
    _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "Finished unarchiving, srcPath:%@, dstPath:%@, e:%ld/0x%lx, pc:%d, srcSize:%llu, dstSize:%llu, time:%.3fs",  buf,  0x4Eu);

    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourcePath](self, "sourcePath"));
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask destinationPath](self, "destinationPath"));
    -[MBFileEncodingTask encodingMethod](self, "encodingMethod");
    -[MBFileEncodingTask protectionClass](self, "protectionClass");
    _MBLog( @"INFO",  (uint64_t)"Finished unarchiving, srcPath:%@, dstPath:%@, e:%ld/0x%lx, pc:%d, srcSize:%llu, dstSize:%llu, time:%.3fs",  v48,  v49,  v50,  v51,  v52,  v53,  (uint64_t)v46);
  }

  -[MBFileEncodingTask setCompressionMethod:](self, "setCompressionMethod:", v57);
  -[MBFileEncodingTask setDestinationSize:](self, "setDestinationSize:", v36);
  uint64_t v30 = 0LL;
  id v5 = v38;
LABEL_13:
  id v31 = v30;

  return v31;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBFileEncodingTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MBFileEncodingTask;
  id v5 = -[MBFileEncodingTask init](&v14, "init");
  if (v5)
  {
    id v6 = objc_autoreleasePoolPush();
    -[MBFileEncodingTask setType:]( v5,  "setType:",  (char)[v4 decodeIntegerForKey:@"type"]);
    -[MBFileEncodingTask setEncodingMethod:]( v5,  "setEncodingMethod:",  (char)[v4 decodeIntegerForKey:@"encodingMethod"]);
    id v7 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"sourcePath"];
    char v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[MBFileEncodingTask setSourcePath:](v5, "setSourcePath:", v8);

    -[MBFileEncodingTask setSourceIsLive:]( v5,  "setSourceIsLive:",  [v4 decodeBoolForKey:@"sourceIsLive"]);
    -[MBFileEncodingTask setCompressionMethod:]( v5,  "setCompressionMethod:",  (char)[v4 decodeIntegerForKey:@"compressionMethod"]);
    -[MBFileEncodingTask setProtectionClass:]( v5,  "setProtectionClass:",  [v4 decodeIntForKey:@"protectionClass"]);
    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"spaceSavingsThreshold"];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[MBFileEncodingTask setSpaceSavingsThreshold:](v5, "setSpaceSavingsThreshold:", v10);

    id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"destinationPath"];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[MBFileEncodingTask setDestinationPath:](v5, "setDestinationPath:", v12);

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = objc_autoreleasePoolPush();
  objc_msgSend(v8, "encodeInteger:forKey:", -[MBFileEncodingTask type](self, "type"), @"type");
  objc_msgSend( v8,  "encodeInteger:forKey:",  -[MBFileEncodingTask encodingMethod](self, "encodingMethod"),  @"encodingMethod");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask sourcePath](self, "sourcePath"));
  [v8 encodeObject:v5 forKey:@"sourcePath"];

  objc_msgSend( v8,  "encodeBool:forKey:",  -[MBFileEncodingTask sourceIsLive](self, "sourceIsLive"),  @"sourceIsLive");
  objc_msgSend( v8,  "encodeInteger:forKey:",  -[MBFileEncodingTask compressionMethod](self, "compressionMethod"),  @"compressionMethod");
  objc_msgSend( v8,  "encodeInt:forKey:",  -[MBFileEncodingTask protectionClass](self, "protectionClass"),  @"protectionClass");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask spaceSavingsThreshold](self, "spaceSavingsThreshold"));
  [v8 encodeObject:v6 forKey:@"spaceSavingsThreshold"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MBFileEncodingTask destinationPath](self, "destinationPath"));
  [v8 encodeObject:v7 forKey:@"destinationPath"];

  objc_autoreleasePoolPop(v4);
}

- (char)type
{
  return self->_type;
}

- (void)setType:(char)a3
{
  self->_type = a3;
}

- (char)encodingMethod
{
  return self->_encodingMethod;
}

- (void)setEncodingMethod:(char)a3
{
  self->_encodingMethod = a3;
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (NSString)sourcePath
{
  return self->_sourcePath;
}

- (void)setSourcePath:(id)a3
{
}

- (BOOL)sourceIsLive
{
  return self->_sourceIsLive;
}

- (void)setSourceIsLive:(BOOL)a3
{
  self->_sourceIsLive = a3;
}

- (unsigned)protectionClass
{
  return self->_protectionClass;
}

- (void)setProtectionClass:(unsigned __int8)a3
{
  self->_protectionClass = a3;
}

- (char)compressionMethod
{
  return self->_compressionMethod;
}

- (void)setCompressionMethod:(char)a3
{
  self->_compressionMethod = a3;
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (void)setDestinationPath:(id)a3
{
}

- (unint64_t)destinationSize
{
  return self->_destinationSize;
}

- (void)setDestinationSize:(unint64_t)a3
{
  self->_destinationSize = a3;
}

- (NSNumber)spaceSavingsThreshold
{
  return self->_spaceSavingsThreshold;
}

- (void)setSpaceSavingsThreshold:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)validate
{
  return self->_validate;
}

- (void)setValidate:(BOOL)a3
{
  self->_validate = a3;
}

- (NSData)sourceDigest
{
  return self->_sourceDigest;
}

- (void)setSourceDigest:(id)a3
{
}

- (NSData)destinationDigest
{
  return self->_destinationDigest;
}

- (void)setDestinationDigest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end