@interface CoreFileHandler
+ (id)coreFileWithCoreFilePath:(char *)a3 :(BOOL)a4 :(id)a5 :(id)a6;
- (BOOL)getCorefileLogInfo:(unint64_t *)a3 :(unint64_t *)a4 :(unsigned int *)a5;
- (BOOL)privateKeyChecking;
- (BOOL)saveCoreDumpAtOffset:(unint64_t)a3 withLength:(unint64_t)a4 named:(id)a5 encryptedWithPublicKey:(id)a6 toFileName:(id)a7 flags:(unsigned int)a8;
- (BOOL)saveCoreDumpWithIndex:(unint64_t)a3 named:(id)a4 toFileName:(id *)a5;
- (CoreFileHandler)initWithCoreFilePath:(char *)a3 :(BOOL)a4 :(id)a5 :(unint64_t)a6 :(void *)a7 :(unint64_t)a8;
- (const)getCoreDumpNameWithIndex:(unint64_t)a3;
- (id)getCoreDumpContentsWithOffset:(unint64_t)a3 AndLength:(unint64_t)a4;
- (id)getCoreDumpEncryptionKey:(unint64_t)a3;
- (id)getCorefileLogEncryptionKey;
- (id)getCorefileZeroRanges;
- (id)getPanicRegion;
- (id)saveKernelCoreToDisk:(const char *)a3 :(unsigned int)a4 :(double)a5 :(BOOL)a6 :(id)a7;
- (unint64_t)getNumCoreDumps;
- (void)dealloc;
- (void)getCoreDumpInfoWithIndex:(unint64_t)a3 :(unint64_t *)a4 :(unint64_t *)a5 :(unsigned int *)a6;
@end

@implementation CoreFileHandler

- (CoreFileHandler)initWithCoreFilePath:(char *)a3 :(BOOL)a4 :(id)a5 :(unint64_t)a6 :(void *)a7 :(unint64_t)a8
{
  id v14 = a5;
  v51.receiver = self;
  v51.super_class = (Class)&OBJC_CLASS___CoreFileHandler;
  v15 = -[CoreFileHandler init](&v51, "init");
  v16 = v15;
  if (!v15) {
    goto LABEL_29;
  }
  v15->_scratchBufSize = 0x100000LL;
  v17 = aligned_alloc(vm_page_size, 0x100000uLL);
  v16->_scratchBuf = v17;
  if (!v17)
  {
    uint64_t v49 = _os_assert_log(0LL, v18);
    v26 = (void *)_os_crash(v49);
    __break(1u);
LABEL_34:
    uint64_t v50 = _os_assert_log(v26, v27);
    _os_crash(v50);
    __break(1u);
  }

  if (v14)
  {
    v19 = (ReadOnlyKeyStore *)v14;
  }

  else
  {
    v20 = objc_alloc(&OBJC_CLASS___LockedReadOnlyKeyStore);
    v19 = -[ReadOnlyKeyStore init:](v20, "init:", qword_100036538);
  }

  keystore = v16->_keystore;
  v16->_keystore = v19;

  v16->_zero_on_close = a4;
  uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a3));
  corefilePath = v16->_corefilePath;
  v16->_corefilePath = (NSString *)v22;

  int v24 = open_dprotected_np(-[NSString UTF8String](v16->_corefilePath, "UTF8String"), 0, 0, 2);
  v16->_corefile_fd = v24;
  if (v24 == -1)
  {
    v33 = (void *)qword_100036538;
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
    {
      v34 = v16->_corefilePath;
      v35 = v33;
      int v36 = *__error();
      v56.st_dev = 138412546;
      *(void *)&v56.st_mode = v34;
      WORD2(v56.st_ino) = 1024;
      *(_DWORD *)((char *)&v56.st_ino + 6) = v36;
      v37 = "open_dprotected_np(%@, O_RDONLY): -1 (%{errno}d)";
      v38 = (uint8_t *)&v56;
LABEL_18:
      _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v37, v38, 0x12u);
    }

- (void)dealloc
{
  v2 = self;
  close(self->_corefile_fd);
  free(v2->_scratchBuf);
  if (v2->_zero_on_close)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CoreFileHandler getCorefileZeroRanges](v2, "getCorefileZeroRanges"));
    v4 = calloc(1uLL, 0x100000uLL);
    if (!v4)
    {
      uint64_t v34 = _os_assert_log(0LL, v5);
      _os_crash(v34);
      __break(1u);
    }

    v6 = v4;
    int v7 = open_dprotected_np(-[NSString UTF8String](v2->_corefilePath, "UTF8String"), 2, 0, 0);
    if (v7 == -1)
    {
      v28 = (void *)qword_100036538;
      if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
      {
        corefilePath = v2->_corefilePath;
        v32 = v28;
        int v33 = *__error();
        *(_DWORD *)buf = 138412546;
        size_t v43 = (size_t)corefilePath;
        __int16 v44 = 1024;
        LODWORD(v45) = v33;
        _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "open_dprotected_np(%@, O_RDWR): -1 (%{errno}d)",  buf,  0x12u);
      }

      free(v6);
    }

    else
    {
      int v8 = v7;
      int v36 = v2;
      fcntl(v7, 48, 1LL);
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      v35 = v3;
      id v9 = v3;
      id v10 = [v9 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v39;
        while (2)
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v39 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
            v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:0]);
            id v16 = [v15 unsignedLongLongValue];

            v17 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:1]);
            unint64_t v18 = (unint64_t)[v17 unsignedLongLongValue];

            if (lseek(v8, (off_t)v16, 0) == -1)
            {
              v26 = (void *)qword_100036538;
              if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
              {
                ssize_t v29 = v26;
                int v30 = *__error();
                *(_DWORD *)buf = 134218240;
                size_t v43 = (size_t)v16;
                __int16 v44 = 1024;
                LODWORD(v45) = v30;
                _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "lseek() to file offset 0x%llx returned -1 (%{errno}d)",  buf,  0x12u);
              }

              goto LABEL_27;
            }

            if (v18)
            {
              while (1)
              {
                size_t v19 = v18 >= 0x100000 ? 0x100000LL : v18;
                ssize_t v20 = write(v8, v6, v19);
                if (v20 != v19) {
                  break;
                }
                v18 -= v19;
                if (!v18) {
                  goto LABEL_22;
                }
              }

              ssize_t v21 = v20;
              uint64_t v22 = (void *)qword_100036538;
              BOOL v23 = os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR);
              if (v21 == -1)
              {
                if (v23)
                {
                  int v24 = v22;
                  int v25 = *__error();
                  *(_DWORD *)buf = 134218240;
                  size_t v43 = v19;
                  __int16 v44 = 1024;
                  LODWORD(v45) = v25;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "error zeroing corefile: write(%zu): (%{errno}d)",  buf,  0x12u);
                }
              }

              else if (v23)
              {
                *(_DWORD *)buf = 134218240;
                size_t v43 = v19;
                __int16 v44 = 2048;
                ssize_t v45 = v21;
                _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v22,  OS_LOG_TYPE_ERROR,  "error zeroing corefile, attempted to write %zu bytes, wrote %zu bytes",  buf,  0x16u);
              }
            }

- (id)getCoreDumpContentsWithOffset:(unint64_t)a3 AndLength:(unint64_t)a4
{
  v4 = (os_log_s *)qword_100036538;
  if (!a4)
  {
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "getCoreDumpContentsWithOffset called with zero length",  buf,  2u);
    }

    goto LABEL_26;
  }

  if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v26 = a4;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "copying %llu bytes", buf, 0xCu);
  }

  if (lseek(self->_corefile_fd, a3, 0) != -1)
  {
    int v8 = -[NSMutableData initWithLength:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", a4);
    id v9 = -[NSMutableData mutableBytes](v8, "mutableBytes");
    unint64_t v10 = 0LL;
    while (1)
    {
      size_t v11 = self->_scratchBufSize >= ((a4 - v10 + vm_page_size - 1) & -(uint64_t)vm_page_size)
          ? (a4 - v10 + vm_page_size - 1) & -(uint64_t)vm_page_size
          : self->_scratchBufSize;
      ssize_t v12 = read(self->_corefile_fd, self->_scratchBuf, v11);
      if (v12 != v11) {
        break;
      }
      if (v11 >= a4 - v10) {
        size_t v11 = a4 - v10;
      }
      memmove(v9, self->_scratchBuf, v11);
      v10 += v11;
      v9 += v11;
      if (v10 >= a4)
      {
        v13 = (os_log_s *)qword_100036538;
        if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v26 = a3;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Finished extracting core file data from file offset %llu\n",  buf,  0xCu);
        }

        return v8;
      }
    }

    ssize_t v19 = v12;
    ssize_t v20 = (void *)qword_100036538;
    BOOL v21 = os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR);
    if (v19 == -1)
    {
      if (v21)
      {
        BOOL v23 = v20;
        int v24 = *__error();
        *(_DWORD *)buf = 134219008;
        unint64_t v26 = v11;
        __int16 v27 = 2048;
        unint64_t v28 = v10;
        __int16 v29 = 2048;
        unint64_t v30 = a3;
        __int16 v31 = 2048;
        unint64_t v32 = a4;
        __int16 v33 = 1024;
        LODWORD(v34) = v24;
        _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Read of %lu bytes from dataOffset %llu (file offset from %llu)(total length %llu) failed with error %{errno}d",  buf,  0x30u);
      }

      goto LABEL_25;
    }

    if (!v21) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 134219008;
    unint64_t v26 = v11;
    __int16 v27 = 2048;
    unint64_t v28 = v10;
    __int16 v29 = 2048;
    unint64_t v30 = a3;
    __int16 v31 = 2048;
    unint64_t v32 = a4;
    __int16 v33 = 2048;
    ssize_t v34 = v19;
    id v16 = "Read of %lu bytes from dataOffset %llu (file offset from %llu)(total length %llu) only read %lu bytes";
    v17 = (os_log_s *)v20;
    uint32_t v18 = 52;
LABEL_22:
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
LABEL_25:

    goto LABEL_26;
  }

  id v14 = (void *)qword_100036538;
  if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
  {
    int v8 = v14;
    int v15 = *__error();
    *(_DWORD *)buf = 134218240;
    unint64_t v26 = a3;
    __int16 v27 = 1024;
    LODWORD(v28) = v15;
    id v16 = "lseek() to file offset 0x%llx returned -1 (%{errno}d)";
    v17 = (os_log_s *)v8;
    uint32_t v18 = 18;
    goto LABEL_22;
  }

- (BOOL)saveCoreDumpAtOffset:(unint64_t)a3 withLength:(unint64_t)a4 named:(id)a5 encryptedWithPublicKey:(id)a6 toFileName:(id)a7 flags:(unsigned int)a8
{
  id v14 = (os_log_s *)a5;
  id v15 = a6;
  id v16 = a7;
  v17 = (os_log_s *)qword_100036538;
  if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    unint64_t v115 = (unint64_t)v14;
    __int16 v116 = 2048;
    unint64_t v117 = a3;
    __int16 v118 = 2048;
    unint64_t v119 = a4;
    __int16 v120 = 1024;
    unsigned int v121 = a8;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Found %@: offset: 0x%llx, length: 0x%llx, flags: 0x%x. Writing to disk",  buf,  0x26u);
  }

  char v18 = a8;
  if ((a8 & 1) != 0)
  {
    size_t v43 = (os_log_s *)qword_100036538;
    if (!os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    __int16 v44 = "On-disk zlib-compressed cores are not supported.";
LABEL_50:
    _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, v44, buf, 2u);
    goto LABEL_32;
  }

  v110 = 0LL;
  v111 = 0LL;
  if (!&_AACustomByteStreamOpen)
  {
    ssize_t v45 = (os_log_s *)qword_100036538;
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v46 = "AppleArchive is not supported.";
LABEL_23:
      _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, v46, buf, 2u);
    }

- (BOOL)saveCoreDumpWithIndex:(unint64_t)a3 named:(id)a4 toFileName:(id *)a5
{
  id v22 = a4;
  -[CoreFileHandler getCoreDumpInfoWithIndex::::](self, "getCoreDumpInfoWithIndex::::", a3, &v25, &v24, &v23);
  BOOL v21 = self;
  if ((v23 & 4) != 0) {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CoreFileHandler getCoreDumpEncryptionKey:](self, "getCoreDumpEncryptionKey:", a3));
  }
  else {
    id v20 = 0LL;
  }
  if ([*a5 containsString:@"cp.core.gz"]) {
    *a5 = (id)objc_claimAutoreleasedReturnValue( [*a5 stringByReplacingOccurrencesOfString:@"cp.core.gz" withString:@"coproc.core.gz"]);
  }
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v9 = [v8 fileExistsAtPath:*a5];

  if (v9)
  {
    uint64_t v10 = 1LL;
    while (1)
    {
      size_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"core.%llu.gz",  v10));
      ssize_t v12 = [*a5 rangeOfString:@"core"];
      if (v12 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (!v12) {
        goto LABEL_14;
      }
      *a5 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( *a5,  "stringByReplacingCharactersInRange:withString:",  v12,  (_BYTE *)objc_msgSend(*a5, "length") - v12,  v11));
      ++v10;

      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      unsigned __int8 v15 = [v14 fileExistsAtPath:*a5];

      if ((v15 & 1) == 0) {
        goto LABEL_12;
      }
    }

    uint64_t v18 = _os_assert_log(0LL, v13);
    _os_crash(v18);
    __break(1u);
LABEL_14:
    uint64_t v19 = _os_assert_log(0LL, v13);
    BOOL result = _os_crash(v19);
    __break(1u);
  }

  else
  {
LABEL_12:
    unsigned __int8 v16 = -[CoreFileHandler saveCoreDumpAtOffset:withLength:named:encryptedWithPublicKey:toFileName:flags:]( v21,  "saveCoreDumpAtOffset:withLength:named:encryptedWithPublicKey:toFileName:flags:",  v25,  v24,  v22,  v20,  *a5,  v23);

    return v16;
  }

  return result;
}

- (id)getPanicRegion
{
  unint64_t v3 = -[CoreFileHandler getNumCoreDumps](self, "getNumCoreDumps");
  if (v3)
  {
    uint64_t v4 = 0LL;
    while (strncmp( -[CoreFileHandler getCoreDumpNameWithIndex:](self, "getCoreDumpNameWithIndex:", v4),  "panic_region",  0xCuLL))
    {
      if (v3 == ++v4) {
        goto LABEL_5;
      }
    }

    -[CoreFileHandler getCoreDumpInfoWithIndex::::](self, "getCoreDumpInfoWithIndex::::", v4, v21, v20, v19);
    strcpy((char *)buf, "/private/var/tmp/panicregion.XXX");
    int v7 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", mktemp((char *)buf));
    int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v18 = v8;
    unsigned int v9 = -[CoreFileHandler saveCoreDumpWithIndex:named:toFileName:]( self,  "saveCoreDumpWithIndex:named:toFileName:",  v4,  @"panic region",  &v18);
    id v10 = v18;

    if (v9)
    {
      id v17 = 0LL;
      size_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v10,  0LL,  &v17));
      id v12 = v17;
      if (!v11)
      {
        uint64_t v13 = (void *)qword_100036538;
        if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
        {
          unsigned __int8 v15 = v13;
          unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
          *(_DWORD *)id v22 = 138412290;
          unsigned int v23 = v16;
          _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to read the file contents for panic region file. Error: %@",  v22,  0xCu);
        }
      }

      unlink((const char *)[v10 UTF8String]);
      id v14 = v11;
    }

    else
    {
      id v14 = 0LL;
    }

    return v14;
  }

  else
  {
LABEL_5:
    uint64_t v5 = (os_log_s *)qword_100036538;
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "failed to find panic region in corefile with %llu files",  buf,  0xCu);
    }

    return 0LL;
  }

- (id)saveKernelCoreToDisk:(const char *)a3 :(unsigned int)a4 :(double)a5 :(BOOL)a6 :(id)a7
{
  unsigned int v9 = a3;
  size_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", a3, *(void *)&a4, a6, a7));
  id v12 = sub_100019BE8(a5);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v69 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9));
  id v15 = sub_100019C98(v14, a4);

  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9));
  id v68 = 0LL;
  char v17 = sub_100012470(v16, &v68, 493);
  id v18 = v68;

  if ((v17 & 1) != 0)
  {
    asprintf(&v69, "%s/staged", v9);
    if (v69)
    {
      uint64_t v19 = v9;
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
      id v67 = v18;
      char v21 = sub_100012470(v20, &v67, 493);
      id v22 = v67;

      if ((v21 & 1) == 0)
      {
        uint64_t v25 = (void *)qword_100036538;
        if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
        {
          id v52 = v22;
          id v53 = v25;
          id v54 = [v52 UTF8String];
          *(_DWORD *)buf = 136315138;
          id v71 = v54;
          _os_log_error_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "failed to setup corefile stage directory due to error: %s",  buf,  0xCu);
        }

        free(v69);
        v69 = 0LL;
        unsigned int v9 = v19;
        goto LABEL_14;
      }

      id v18 = v22;
      unsigned int v9 = v19;
    }

    else
    {
      uint64_t v24 = (os_log_s *)qword_100036538;
      if (!os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
      {
LABEL_10:
        id v22 = v18;
LABEL_14:
        AAByteStream v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s/%@.",  v9,  v13));
        id v18 = v22;
        goto LABEL_15;
      }

      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "failed to allocate staging directory string",  buf,  2u);
    }

    if (v69)
    {
      AAByteStream v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s/%@.",  v69,  v13));
LABEL_15:
      unsigned int v58 = a4;
      unint64_t v26 = (os_log_s *)qword_100036538;
      if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Attempting to extract kernel core if it exists...",  buf,  2u);
      }

      unint64_t v27 = -[CoreFileHandler getNumCoreDumps](self, "getNumCoreDumps");
      unint64_t v28 = v27;
      if (&_AnalyticsSendEventLazy && v27)
      {
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472LL;
        v66[2] = sub_10001A734;
        v66[3] = &unk_100030C28;
        v66[4] = self;
        v66[5] = v27;
        AnalyticsSendEventLazy(@"com.apple.DumpPanic.corefileSummary", v66);
      }

      if (-[CoreFileHandler privateKeyChecking](self, "privateKeyChecking"))
      {
        unint64_t v55 = v9;
        id v56 = v18;
        v57 = v13;
        if (v28)
        {
          for (uint64_t i = 0LL; i != v28; ++i)
          {
            unint64_t v30 = -[CoreFileHandler getCoreDumpNameWithIndex:](self, "getCoreDumpNameWithIndex:", i);
            -[CoreFileHandler getCoreDumpInfoWithIndex::::](self, "getCoreDumpInfoWithIndex::::", i, &v65, &v64, &v63);
            if (&_AnalyticsSendEventLazy)
            {
              v61[0] = _NSConcreteStackBlock;
              v61[1] = 3221225472LL;
              v61[2] = sub_10001A880;
              v61[3] = &unk_100030C48;
              v61[4] = v30;
              int v62 = v64 >> 20;
              AnalyticsSendEventLazy(@"com.apple.DumpPanic.corefileSize", v61);
            }

            if (strncmp(v30, "panic_region", 0xCuLL))
            {
              __int16 v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%s%s.core.gz",  v59,  "",  v30));
              unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"corefile with name %s",  v30));
              id v60 = v31;
              unsigned int v33 = -[CoreFileHandler saveCoreDumpWithIndex:named:toFileName:]( self,  "saveCoreDumpWithIndex:named:toFileName:",  i,  v32,  &v60);
              id v34 = v60;

              if (v33)
              {
                v35 = (os_log_s *)qword_100036538;
                if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v71 = v34;
                  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "saved core file %@", buf, 0xCu);
                }

                [v11 addObject:v34];
              }
            }
          }
        }

        uint64_t v13 = v57;
        if (-[CoreFileHandler getCorefileLogInfo:::](self, "getCorefileLogInfo:::", &v65, &v64, &v63))
        {
          if ((v63 & 4) != 0) {
            int v36 = (void *)objc_claimAutoreleasedReturnValue(-[CoreFileHandler getCorefileLogEncryptionKey](self, "getCorefileLogEncryptionKey"));
          }
          else {
            int v36 = 0LL;
          }
          objc_super v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%skernel.core.log",  v59,  ""));
          if (-[CoreFileHandler saveCoreDumpAtOffset:withLength:named:encryptedWithPublicKey:toFileName:flags:]( self,  "saveCoreDumpAtOffset:withLength:named:encryptedWithPublicKey:toFileName:flags:",  v65,  v64,  @"kernel core log",  v36,  v37,  v63))
          {
            gzFile v38 = (os_log_s *)qword_100036538;
            if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v71 = v37;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "saved core file %@", buf, 0xCu);
            }

            [v11 addObject:v37];
          }
        }

        id v18 = v56;
        if ([v11 count])
        {
          __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v55));
          id v40 = sub_100019C98(v39, v58);

          if (v69)
          {
            free(v69);
            v69 = 0LL;
            if ([v11 count])
            {
              unint64_t v41 = 0LL;
              ssize_t v42 = 0LL;
              size_t v43 = 0LL;
              do
              {
                __int16 v44 = v43;
                ssize_t v45 = v42;
                size_t v43 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:v41]);

                ssize_t v42 = (void *)objc_claimAutoreleasedReturnValue( [v43 stringByReplacingOccurrencesOfString:@"/staged" withString:&stru_100031290]);
                v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                LOBYTE(v44) = [v46 fileExistsAtPath:v42];

                if ((v44 & 1) != 0)
                {
                  [v11 replaceObjectAtIndex:v41 withObject:v42];
                }

                else
                {
                  v47 = (os_log_s *)qword_100036538;
                  if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v71 = v42;
                    _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Cannot find %@", buf, 0xCu);
                  }

                  int v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                  unsigned __int8 v49 = [v48 fileExistsAtPath:v43];

                  if ((v49 & 1) == 0)
                  {
                    uint64_t v50 = (os_log_s *)qword_100036538;
                    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v71 = v43;
                      _os_log_error_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "Neither can find %@",  buf,  0xCu);
                    }

                    [v11 removeObjectAtIndex:v41];
                  }
                }

                ++v41;
              }

              while (v41 < (unint64_t)[v11 count]);

              id v18 = v56;
              uint64_t v13 = v57;
            }
          }
        }
      }

      goto LABEL_56;
    }

    goto LABEL_10;
  }

  unsigned int v23 = (os_log_s *)qword_100036538;
  if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v71 = v18;
    _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "failed to setup corefile output directory with error: %@",  buf,  0xCu);
  }

- (BOOL)privateKeyChecking
{
  if (!-[CoreFileHandler getNumCoreDumps](self, "getNumCoreDumps")) {
    return 1;
  }
  -[CoreFileHandler getCoreDumpInfoWithIndex::::](self, "getCoreDumpInfoWithIndex::::", 0LL, v11, v10, v9);
  if ((v9[0] & 4) == 0)
  {
    unint64_t v3 = (os_log_s *)qword_100036538;
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "The kernel core is not encrypted", v8, 2u);
    }

    return 1;
  }

  if (-[ReadOnlyKeyStore unlock](self->_keystore, "unlock"))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CoreFileHandler getCoreDumpEncryptionKey:](self, "getCoreDumpEncryptionKey:", 0LL));
    if (-[ReadOnlyKeyStore hasMatchingPrivateKey::](self->_keystore, "hasMatchingPrivateKey::", 1LL, v4))
    {

      return 1;
    }

    int v7 = (os_log_s *)qword_100036538;
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v8 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Cannot find matching private encryption key for encrypted core",  v8,  2u);
    }

    self->_zero_on_close = 0;

    return 0;
  }

  else
  {
    v6 = (os_log_s *)qword_100036538;
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v8 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Keystore unlock has failed", v8, 2u);
    }

    BOOL result = 0;
    self->_zero_on_close = 0;
  }

  return result;
}

- (id)getCorefileZeroRanges
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s must be overridden in a subclass/category",  "-[CoreFileHandler getCorefileZeroRanges]"));
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v2,  0LL));

  objc_exception_throw(v3);
  return (id)-[CoreFileHandler getNumCoreDumps](v4, v5);
}

- (unint64_t)getNumCoreDumps
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s must be overridden in a subclass/category",  "-[CoreFileHandler getNumCoreDumps]"));
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v2,  0LL));

  objc_exception_throw(v3);
  return (unint64_t)-[CoreFileHandler getCoreDumpNameWithIndex:](v4, v5, v6);
}

- (const)getCoreDumpNameWithIndex:(unint64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s must be overridden in a subclass/category",  "-[CoreFileHandler getCoreDumpNameWithIndex:]"));
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v3,  0LL));

  objc_exception_throw(v4);
  -[CoreFileHandler getCoreDumpInfoWithIndex::::](v5, v6, v7, v8, v9, v10);
  return result;
}

- (void)getCoreDumpInfoWithIndex:(unint64_t)a3 :(unint64_t *)a4 :(unint64_t *)a5 :(unsigned int *)a6
{
  SEL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s must be overridden in a subclass/category",  a4,  a5,  a6,  "-[CoreFileHandler getCoreDumpInfoWithIndex::::]"));
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v6,  0LL));

  objc_exception_throw(v7);
  -[CoreFileHandler getCorefileLogInfo:::](v8, v9, v10, v11, v12);
}

- (BOOL)getCorefileLogInfo:(unint64_t *)a3 :(unint64_t *)a4 :(unsigned int *)a5
{
  SEL v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s must be overridden in a subclass/category",  a4,  a5,  "-[CoreFileHandler getCorefileLogInfo:::]"));
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v5,  0LL));

  objc_exception_throw(v6);
  return -[CoreFileHandler getCoreDumpEncryptionKey:](v7, v8, v9);
}

- (id)getCoreDumpEncryptionKey:(unint64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s must be overridden in a subclass/category",  "-[CoreFileHandler getCoreDumpEncryptionKey:]"));
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v3,  0LL));

  objc_exception_throw(v4);
  return -[CoreFileHandler getCorefileLogEncryptionKey](v5, v6);
}

- (id)getCorefileLogEncryptionKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s must be overridden in a subclass/category",  "-[CoreFileHandler getCorefileLogEncryptionKey]"));
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v2,  0LL));

  objc_exception_throw(v3);
  -[CoreFileHandler .cxx_destruct](v4, v5);
  return result;
}

- (void).cxx_destruct
{
}

+ (id)coreFileWithCoreFilePath:(char *)a3 :(BOOL)a4 :(id)a5 :(id)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a6;
  if (!v10)
  {
    uint64_t v38 = _os_assert_log(0LL, v11);
    unsigned __int8 v16 = (char **)_os_crash(v38);
    __break(1u);
    goto LABEL_35;
  }

  id v12 = v10;
  objc_storeStrong((id *)&qword_100036538, a6);
  int v13 = open_dprotected_np(a3, 0, 0, 2);
  if (v13 == -1)
  {
    id v22 = (void *)qword_100036538;
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
    {
      unsigned int v23 = v22;
      int v24 = *__error();
      int v40 = 136315394;
      unint64_t v41 = a3;
      __int16 v42 = 1024;
      LODWORD(v43) = v24;
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "open_dprotected_np(%s, O_RDONLY): -1 (%{errno}d)",  (uint8_t *)&v40,  0x12u);
    }

    goto LABEL_19;
  }

  int v14 = v13;
  vm_size_t v15 = (vm_page_size + 7) & -(uint64_t)vm_page_size;
  unsigned __int8 v16 = (char **)aligned_alloc(vm_page_size, v15);
  if (!v16)
  {
LABEL_35:
    uint64_t v39 = _os_assert_log(v16, v17);
    _os_crash(v39);
    __break(1u);
  }

  id v18 = v16;
  ssize_t v19 = read(v14, v16, v15);
  if (v19 != v15)
  {
    ssize_t v25 = v19;
    unint64_t v26 = (void *)qword_100036538;
    BOOL v27 = os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR);
    if (v25 == -1)
    {
      if (v27)
      {
        int v36 = v26;
        int v37 = *__error();
        int v40 = 134218240;
        unint64_t v41 = (char *)v15;
        __int16 v42 = 1024;
        LODWORD(v43) = v37;
        _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "failed to read header from corefile (%zd bytes) with error: %{errno}d",  (uint8_t *)&v40,  0x12u);
      }
    }

    else if (v27)
    {
      int v40 = 134218240;
      unint64_t v41 = (char *)v15;
      __int16 v42 = 2048;
      uint64_t v43 = v25;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v26,  OS_LOG_TYPE_ERROR,  "Read of %lu bytes from fileoffset 0 only read %lu bytes",  (uint8_t *)&v40,  0x16u);
    }

    close(v14);
    goto LABEL_18;
  }

  id v20 = *v18;
  close(v14);
  if (!v20)
  {
    unint64_t v30 = (os_log_s *)qword_100036538;
    if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "no core file data found",  (uint8_t *)&v40,  2u);
    }

    goto LABEL_18;
  }

  if (v20 == (char *)0x63614D2073736F42LL)
  {
    if (v18[7])
    {
      char v21 = &OBJC_CLASS___CoreFileHandlerV2;
      goto LABEL_25;
    }

    uint64_t v35 = qword_100036538;
    if (!os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    LOWORD(v40) = 0;
    unint64_t v32 = "Skip handling kernel corefile which suggests 0 files present";
LABEL_32:
    unsigned int v33 = (os_log_s *)v35;
    uint32_t v34 = 2;
    goto LABEL_33;
  }

  if (v20 == (char *)0x63614D20646152LL)
  {
    if (v18[3])
    {
      char v21 = &OBJC_CLASS___CoreFileHandlerV1;
LABEL_25:
      id v28 = [[v21 alloc] initWithCoreFilePath:a3 :v7 :v9];
      goto LABEL_20;
    }

    uint64_t v35 = qword_100036538;
    if (!os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    LOWORD(v40) = 0;
    unint64_t v32 = "Skip handling kernel corefile which suggests 0 files present";
    goto LABEL_32;
  }

  uint64_t v31 = qword_100036538;
  if (os_log_type_enabled((os_log_t)qword_100036538, OS_LOG_TYPE_ERROR))
  {
    int v40 = 134218496;
    unint64_t v41 = v20;
    __int16 v42 = 2048;
    uint64_t v43 = 0x63614D20646152LL;
    __int16 v44 = 2048;
    uint64_t v45 = 0x63614D2073736F42LL;
    unint64_t v32 = "invalid core file signature: %#llx (expected :%#llx or %#llx)";
    unsigned int v33 = (os_log_s *)v31;
    uint32_t v34 = 32;
LABEL_33:
    _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, v32, (uint8_t *)&v40, v34);
  }

@end