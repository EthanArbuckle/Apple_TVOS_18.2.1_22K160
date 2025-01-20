@interface TRIFileSystemCompressor
+ (BOOL)_enumerateFilesInDirectory:(id)a3 block:(id)a4;
- ($A5A652246548B43F8BC05201A1C72A70)_compressContentsOfSourceHandle:(id)a3 toDestinationFd:(int)a4 shouldDefer:(id)a5;
- ($A5A652246548B43F8BC05201A1C72A70)compressContentsOfFileHandle:(id)a3 toDestinationFile:(id)a4 shouldDefer:(id)a5;
- ($A5A652246548B43F8BC05201A1C72A70)inPlaceCompressDirectory:(id)a3 shouldDefer:(id)a4;
- ($A5A652246548B43F8BC05201A1C72A70)inPlaceCompressFile:(id)a3 shouldDefer:(id)a4;
- (BOOL)_isCompressibleFile:(id)a3;
- (id)_temporaryCompressionFileForFile:(id)a3;
@end

@implementation TRIFileSystemCompressor

- (id)_temporaryCompressionFileForFile:(id)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a3 stringByDeletingLastPathComponent]);
  v6 = objc_opt_new(&OBJC_CLASS___NSUUID);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v6, "UUIDString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathExtension:@"trial-afsc-compressed"]);
  if (!v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2, self, @"TRIFileSystemCompressor.m", 41, @"Expression was unexpectedly nil/false: %@", @"[temporaryFile stringByAppendingPathExtension:@trial-afsc-compressed]" object file lineNumber description];
  }

  return v9;
}

- ($A5A652246548B43F8BC05201A1C72A70)inPlaceCompressFile:(id)a3 shouldDefer:(id)a4
{
  v7 = (char *)a3;
  v8 = (Block_layout *)a4;
  if (!v7)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v36 handleFailureInMethod:a2, self, @"TRIFileSystemCompressor.m", 49, @"Invalid parameter not satisfying: %@", @"filePath" object file lineNumber description];
  }

  if (-[TRIFileSystemCompressor _isCompressibleFile:](self, "_isCompressibleFile:", v7))
  {
    if (v8) {
      v9 = v8;
    }
    else {
      v9 = &stru_10000C610;
    }
    v10 = objc_retainBlock(v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v7));
    id v37 = 0LL;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForReadingFromURL:error:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForReadingFromURL:error:",  v11,  &v37));
    v13 = (char *)v37;

    if (!v12)
    {
      id v22 = TRILogCategory_Archiving();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v39 = v7;
        __int16 v40 = 2112;
        v41 = v13;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Unable to open file %@ for AFSC compression: %@",  buf,  0x16u);
      }

      unsigned __int8 v18 = 0;
      goto LABEL_25;
    }

    v14 = (os_log_s *) objc_claimAutoreleasedReturnValue( -[TRIFileSystemCompressor _temporaryCompressionFileForFile:]( self, "_temporaryCompressionFileForFile:", v7));
    uint64_t v15 = open_dprotected_np( (const char *)-[os_log_s fileSystemRepresentation](v14, "fileSystemRepresentation"),  514,  4,  0,  384LL);
    if ((v15 & 0x80000000) != 0)
    {
      id v23 = TRILogCategory_Archiving();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v30 = __error();
        v31 = strerror(*v30);
        int v32 = *__error();
        *(_DWORD *)buf = 136315394;
        v39 = v31;
        __int16 v40 = 1024;
        LODWORD(v41) = v32;
        _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Skipping AFSC compression because temp file could not be opened: %s (%d)",  buf,  0x12u);
      }
    }

    else
    {
      int v16 = v15;
      if (v10) {
        v17 = v10;
      }
      else {
        v17 = &stru_10000C630;
      }
      unsigned __int8 v18 = -[TRIFileSystemCompressor _compressContentsOfSourceHandle:toDestinationFd:shouldDefer:]( self,  "_compressContentsOfSourceHandle:toDestinationFd:shouldDefer:",  v12,  v15,  v17);
      close(v16);
      if (v18 == 2) {
        goto LABEL_25;
      }
      if (v18)
      {
        v25 = v14;
        v26 = (const char *)-[os_log_s fileSystemRepresentation](v25, "fileSystemRepresentation");
        v27 = v7;
        if (!rename(v26, (const char *)[v27 fileSystemRepresentation]))
        {
          unsigned __int8 v18 = 1;
          v14 = v25;
          goto LABEL_25;
        }

        id v28 = TRILogCategory_Archiving();
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v33 = __error();
          v34 = strerror(*v33);
          int v35 = *__error();
          *(_DWORD *)buf = 138413058;
          v39 = (char *)v25;
          __int16 v40 = 2112;
          v41 = v27;
          __int16 v42 = 2080;
          v43 = v34;
          __int16 v44 = 1024;
          int v45 = v35;
          _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Couldn't rename %@ --> %@: %s (%d)",  buf,  0x26u);
        }

        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        -[os_log_s removeItemAtPath:error:](v21, "removeItemAtPath:error:", v25, 0LL);
        unsigned __int8 v18 = 0;
LABEL_24:

LABEL_25:
        v8 = v10;
        goto LABEL_26;
      }

      id v19 = TRILogCategory_Archiving();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Skipping AFSC compression due to error while compressing.",  buf,  2u);
      }

      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      -[os_log_s removeItemAtPath:error:](v21, "removeItemAtPath:error:", v14, 0LL);
    }

    unsigned __int8 v18 = 1;
    goto LABEL_24;
  }

  unsigned __int8 v18 = 0;
LABEL_26:

  return ($A5A652246548B43F8BC05201A1C72A70)v18;
}

- (BOOL)_isCompressibleFile:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v5 = [v4 fileExistsAtPath:v3 isDirectory:&v10];

  if (v5)
  {
    if (!v10)
    {
      BOOL v8 = 1;
      goto LABEL_7;
    }

    id v6 = TRILogCategory_Archiving();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Unexpectedly requested to AFSC compress a directory %@",  buf,  0xCu);
    }
  }

  BOOL v8 = 0;
LABEL_7:

  return v8;
}

- ($A5A652246548B43F8BC05201A1C72A70)compressContentsOfFileHandle:(id)a3 toDestinationFile:(id)a4 shouldDefer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (Block_layout *)a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }

  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v25 handleFailureInMethod:a2, self, @"TRIFileSystemCompressor.m", 123, @"Invalid parameter not satisfying: %@", @"handle" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v26 handleFailureInMethod:a2, self, @"TRIFileSystemCompressor.m", 124, @"Invalid parameter not satisfying: %@", @"filePath" object file lineNumber description];

LABEL_3:
  if (v11) {
    id v12 = v11;
  }
  else {
    id v12 = &stru_10000C650;
  }
  v13 = objc_retainBlock(v12);

  id v14 = v10;
  uint64_t v15 = open_dprotected_np((const char *)[v14 fileSystemRepresentation], 514, 4, 0, 384);
  if ((v15 & 0x80000000) != 0)
  {
    id v18 = TRILogCategory_Archiving();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v22 = __error();
      id v23 = strerror(*v22);
      int v24 = *__error();
      *(_DWORD *)buf = 138412802;
      id v28 = v14;
      __int16 v29 = 2080;
      v30 = v23;
      __int16 v31 = 1024;
      int v32 = v24;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to open %@: %s (%d)", buf, 0x1Cu);
    }

    unsigned __int8 v17 = 0;
  }

  else
  {
    int v16 = v15;
    unsigned __int8 v17 = -[TRIFileSystemCompressor _compressContentsOfSourceHandle:toDestinationFd:shouldDefer:]( self,  "_compressContentsOfSourceHandle:toDestinationFd:shouldDefer:",  v9,  v15,  v13);
    close(v16);
    if (v17 == 1)
    {
      unsigned __int8 v17 = 1;
    }

    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      [v20 removeItemAtPath:v14 error:0];
    }
  }

  return ($A5A652246548B43F8BC05201A1C72A70)v17;
}

- ($A5A652246548B43F8BC05201A1C72A70)_compressContentsOfSourceHandle:(id)a3 toDestinationFd:(int)a4 shouldDefer:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = a5;
  memset(&v49, 0, sizeof(v49));
  if (fstat((int)[v7 fileDescriptor], &v49))
  {
    id v9 = TRILogCategory_Archiving();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v32 = __error();
      v33 = strerror(*v32);
      int v34 = *__error();
      *(_DWORD *)v52 = 136315394;
      *(void *)&v52[4] = v33;
      *(_WORD *)&v52[12] = 1024;
      *(_DWORD *)&v52[14] = v34;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Unable to fstat source file handle for AFSC compression: %s (%d)",  v52,  0x12u);
    }

    v11.var0 = 0;
    goto LABEL_5;
  }

  if (v49.st_size)
  {
    uint64_t v37 = ParallelCompressionAFSCStreamOpen(v6, v49.st_size, 14LL, 0LL);
    if (v37)
    {
      dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
      dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_UTILITY, 0);
      int v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);

      if (!v16)
      {
        int v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
        v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "dispatch_queue_t  _Nonnull _PASAutoreleasingSerialQueueWithQOS(const char * _Nullable, qos_class_t)"));
        objc_msgSend( v35,  "handleFailureInFunction:file:lineNumber:description:",  v36,  @"_PASDispatchInline.h",  191,  @"Unsupported QOS class: %u",  17);
      }

      id v10 = (os_log_s *)dispatch_queue_create("com.apple.trial.compression-io", v16);

      dispatch_semaphore_t v17 = dispatch_semaphore_create(2LL);
      uint64_t v45 = 0LL;
      v46 = (unsigned int *)&v45;
      uint64_t v47 = 0x2020000000LL;
      int v48 = 1;
      while (1)
      {
        unsigned int v18 = atomic_load(v46 + 6);
        if (v18 != 1)
        {
LABEL_21:
          dispatch_sync((dispatch_queue_t)v10, &stru_10000C698);
          v11.var0 = atomic_load(v46 + 6);
          int v26 = ParallelCompressionAFSCStreamClose(v37);
          int v27 = v26;
          if (v11.var0 == 1 && v26 != 0)
          {
            id v29 = TRILogCategory_Archiving();
            v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v52 = 67109120;
              *(_DWORD *)&v52[4] = v27;
              _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "AFSC stream failed to close with error (%d)",  v52,  8u);
            }

            v11.var0 = 0;
          }

          _Block_object_dispose(&v45, 8);

          goto LABEL_5;
        }

        id v19 = objc_autoreleasePoolPush();
        dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
        *(void *)v52 = 0LL;
        *(void *)&v52[8] = v52;
        *(void *)&v52[16] = 0x3032000000LL;
        v53 = sub_10000615C;
        v54 = sub_10000616C;
        id v44 = 0LL;
        v20 = (void *)objc_claimAutoreleasedReturnValue([v7 readDataUpToLength:0x20000 error:&v44]);
        id v21 = v44;
        id v55 = v20;
        id v22 = *(void **)(*(void *)&v52[8] + 40LL);
        if (!v22) {
          break;
        }
        if (![v22 length]) {
          goto LABEL_19;
        }
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100006174;
        block[3] = &unk_10000C678;
        v41 = &v45;
        __int16 v42 = v52;
        v39 = v17;
        id v40 = v8;
        uint64_t v43 = v37;
        dispatch_async((dispatch_queue_t)v10, block);

        char v23 = 1;
LABEL_20:
        _Block_object_dispose(v52, 8);

        objc_autoreleasePoolPop(v19);
        if ((v23 & 1) == 0) {
          goto LABEL_21;
        }
      }

      id v24 = TRILogCategory_Archiving();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v51 = v21;
        _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Unable to read source file during AFSC compression: %@",  buf,  0xCu);
      }

      atomic_store(0, v46 + 6);
LABEL_19:
      dispatch_semaphore_signal(v17);
      char v23 = 0;
      goto LABEL_20;
    }

    v11.var0 = 0;
  }

  else
  {
    id v31 = TRILogCategory_Archiving();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v52 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "File data is empty, ignoring compression.",  v52,  2u);
    }

    v11.var0 = 1;
LABEL_5:
  }

  return v11;
}

- ($A5A652246548B43F8BC05201A1C72A70)inPlaceCompressDirectory:(id)a3 shouldDefer:(id)a4
{
  id v7 = a3;
  id v8 = (Block_layout *)a4;
  if (!v7)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v22 handleFailureInMethod:a2, self, @"TRIFileSystemCompressor.m", 254, @"Invalid parameter not satisfying: %@", @"dirPath" object file lineNumber description];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v10 = [v9 fileExistsAtPath:v7 isDirectory:&v27];

  if (!v10) {
    goto LABEL_18;
  }
  if (!v27)
  {
    id v19 = TRILogCategory_Archiving();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Unexpectedly requested to AFSC compress a file %@",  (uint8_t *)&buf,  0xCu);
    }

LABEL_18:
    v18.var0 = 0;
    goto LABEL_19;
  }

  if (v8) {
    $A5A652246548B43F8BC05201A1C72A70 v11 = v8;
  }
  else {
    $A5A652246548B43F8BC05201A1C72A70 v11 = &stru_10000C6B8;
  }
  id v12 = objc_retainBlock(v11);

  id v13 = TRILogCategory_Archiving();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Compressing files in %@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x2810000000LL;
  v30 = &unk_1000093A9;
  char v31 = 1;
  dispatch_queue_attr_t v15 = (void *)objc_opt_class(self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100006654;
  v24[3] = &unk_10000C6E0;
  id v8 = v12;
  v25 = v8;
  p___int128 buf = &buf;
  v24[4] = self;
  if (([v15 _enumerateFilesInDirectory:v7 block:v24] & 1) == 0)
  {
    id v16 = TRILogCategory_Archiving();
    dispatch_semaphore_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)char v23 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Some files not AFSC compressed due to directory enumeration failure.",  v23,  2u);
    }
  }

  v18.var0 = *(_BYTE *)(*((void *)&buf + 1) + 32LL);

  _Block_object_dispose(&buf, 8);
LABEL_19:

  return v18;
}

+ (BOOL)_enumerateFilesInDirectory:(id)a3 block:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_opt_new(&OBJC_CLASS___TRIFileBackedMutableStringArray);
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 enumeratorAtPath:v5]);

    unsigned int v10 = objc_autoreleasePoolPush();
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 nextObject]);
    if (v11)
    {
      id v12 = (void *)v11;
      while (1)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 fileAttributes]);
        NSFileAttributeType v14 = (NSFileAttributeType)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:NSFileType]);

        if (v14 != NSFileTypeDirectory)
        {
          dispatch_queue_attr_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v12]);
          unsigned __int8 v16 = [v7 addString:v15];

          if ((v16 & 1) == 0) {
            break;
          }
        }

        objc_autoreleasePoolPop(v10);
        unsigned int v10 = objc_autoreleasePoolPush();
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 nextObject]);
        if (!v12) {
          goto LABEL_7;
        }
      }

      objc_autoreleasePoolPop(v10);
      unsigned __int8 v17 = 0;
    }

    else
    {
LABEL_7:
      objc_autoreleasePoolPop(v10);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_100006A34;
      v19[3] = &unk_10000C708;
      id v20 = v6;
      unsigned __int8 v17 = [v7 enumerateStringsWithBlock:v19];
    }
  }

  else
  {
    unsigned __int8 v17 = 0;
  }

  return v17;
}

@end