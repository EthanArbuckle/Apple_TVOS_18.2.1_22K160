@interface TRIArchiveExtractor
+ ($A5A652246548B43F8BC05201A1C72A70)_compressFilesInCurrentDirectoryWithLockWitness:(TRIFlockWitness_ *)a3 shouldDefer:(id)a4;
+ ($A5A652246548B43F8BC05201A1C72A70)_copyDataFromReadArchive:(archive *)a3 toWriteDiskArchive:(archive *)a4 remainingQuota:(unint64_t *)a5 archiveIdentifier:(id)a6 shouldDefer:(id)a7;
+ ($A5A652246548B43F8BC05201A1C72A70)_withLockWitness:(TRIFlockWitness_ *)a3 performExtractionIntoCurrentDirectoryFromArchive:(archive *)a4 maxUnarchivedSize:(unint64_t)a5 archiveIdentifier:(id)a6 shouldDefer:(id)a7;
+ ($A5A652246548B43F8BC05201A1C72A70)extractArchiveFromHandle:(id)a3 toDestinationDirectoryURL:(id)a4 maxUnarchivedSize:(unint64_t)a5 archiveIdentifier:(id)a6 postExtractionCompression:(id)a7 shouldDefer:(id)a8;
+ (BOOL)_withLockAndDirectoryChangedToURL:(id)a3 runBlock:(id)a4;
+ (archive)_createReadArchive;
+ (archive)_createWriteDiskArchive;
- (NSURL)archiveFileURL;
@end

@implementation TRIArchiveExtractor

+ (archive)_createReadArchive
{
  uint64_t v2 = archive_read_new(a1, a2);
  if (!v2)
  {
    id v8 = TRILogCategory_Archiving();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      uint64_t v11 = archive_error_string(0LL);
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "archive_read_new unable to create new archive: %s.",  (uint8_t *)&v10,  0xCu);
    }

    goto LABEL_10;
  }

  v3 = (archive *)v2;
  if (archive_read_support_format_zip())
  {
    id v4 = TRILogCategory_Archiving();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      uint64_t v11 = archive_error_string(v3);
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "archive_read unable to set supported formats: %s.",  (uint8_t *)&v10,  0xCu);
    }

    id v6 = TRILogCategory_Archiving();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Unable to free archive_read (leaking)",  (uint8_t *)&v10,  2u);
    }

+ (archive)_createWriteDiskArchive
{
  uint64_t v2 = archive_write_disk_new(a1, a2);
  v3 = (archive *)v2;
  if (!v2) {
    return v3;
  }
  if (!archive_write_disk_set_standard_lookup(v2))
  {
    id v7 = TRILogCategory_Archiving();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v11 = 136315138;
    uint64_t v12 = archive_error_string(v3);
    id v6 = "archive_write_disk unable to set options - %s.";
    goto LABEL_14;
  }

  id v4 = TRILogCategory_Archiving();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v11 = 136315138;
    uint64_t v12 = archive_error_string(v3);
    id v6 = "archive_write_disk unable to set lookup functions - %s.";
LABEL_14:
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v11, 0xCu);
  }

+ ($A5A652246548B43F8BC05201A1C72A70)_copyDataFromReadArchive:(archive *)a3 toWriteDiskArchive:(archive *)a4 remainingQuota:(unint64_t *)a5 archiveIdentifier:(id)a6 shouldDefer:(id)a7
{
  id v11 = a6;
  uint64_t v12 = a7;
  for (i = (uint64_t (*)(void))v12[2]; (i() & 1) == 0; i = (uint64_t (*)(void))v12[2])
  {
    int v14 = archive_read_data_block(a3, &v28, &v27, &v26);
    if (v14)
    {
      if (v14 == 1)
      {
        v17.var0 = 1;
        goto LABEL_18;
      }

      id v18 = TRILogCategory_Archiving();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      uint64_t v20 = archive_error_string(a3);
      *(_DWORD *)buf = 136315138;
      uint64_t v30 = v20;
      v21 = "archive_read_data_block failed - %s.";
      goto LABEL_20;
    }

    if (*a5 < v27)
    {
      id v22 = TRILogCategory_Archiving();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
LABEL_17:

        v17.var0 = 0;
        goto LABEL_18;
      }

      *(_DWORD *)buf = 138412290;
      uint64_t v30 = (uint64_t)v11;
      v21 = "Extracted more bytes than maximum allowable unarchived size. Aborting unarchival. Archive identifier: %@";
LABEL_20:
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v21, buf, 0xCu);
      goto LABEL_17;
    }

    *a5 -= v27;
    if (archive_write_data_block(a4, v28) < 0)
    {
      id v23 = TRILogCategory_Archiving();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      uint64_t v25 = archive_error_string(a4);
      *(_DWORD *)buf = 136315138;
      uint64_t v30 = v25;
      v21 = "archive_write_data_block failed - %s.";
      goto LABEL_20;
    }
  }

  id v15 = TRILogCategory_Archiving();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Deferring during archive extraction.", buf, 2u);
  }

  v17.var0 = 2;
LABEL_18:

  return v17;
}

+ (BOOL)_withLockAndDirectoryChangedToURL:(id)a3 runBlock:(id)a4
{
  v5 = (char *)a3;
  id v6 = (void (**)(id, uint8_t *))a4;
  id v7 = objc_autoreleasePoolPush();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v40 = 0LL;
  unsigned __int8 v9 = [v8 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v40];
  int v10 = (char *)v40;

  if ((v9 & 1) == 0)
  {
    id v17 = TRILogCategory_Archiving();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v48 = v5;
      __int16 v49 = 2112;
      v50 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "failed to create directory at %@ - %@.",  buf,  0x16u);
    }

    goto LABEL_13;
  }

  id v11 = (const char *)[v5 fileSystemRepresentation];
  int v12 = open(v11, 0x100000);
  if (v12 < 0)
  {
    id v19 = TRILogCategory_Server();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v31 = __error();
      v32 = strerror(*v31);
      int v33 = *__error();
      *(_DWORD *)buf = 136315650;
      v48 = v11;
      __int16 v49 = 2080;
      v50 = v32;
      __int16 v51 = 1024;
      int v52 = v33;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Failed to open directory %s: %s (%d)",  buf,  0x1Cu);
    }

LABEL_13:
    char v21 = 0;
    goto LABEL_25;
  }

  bzero(buf, 0x400uLL);
  v13 = getcwd((char *)buf, 0x400uLL);
  if (flock(v12, 2))
  {
    id v14 = TRILogCategory_Server();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = __error();
      v29 = strerror(*v28);
      int v30 = *__error();
      *(_DWORD *)v41 = 136315650;
      v42 = v11;
      __int16 v43 = 2080;
      v44 = v29;
      __int16 v45 = 1024;
      int v46 = v30;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to lock directory %s err:%s (%d)",  v41,  0x1Cu);
    }

    int v16 = 0;
LABEL_18:
    char v21 = 0;
    goto LABEL_19;
  }

  int v16 = 1;
  if (chdir(v11))
  {
    id v22 = TRILogCategory_Server();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v37 = __error();
      v38 = strerror(*v37);
      int v39 = *__error();
      *(_DWORD *)v41 = 136315650;
      v42 = v11;
      __int16 v43 = 2080;
      v44 = v38;
      __int16 v45 = 1024;
      int v46 = v39;
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "failed to chdir directory %s err:%s (%d)",  v41,  0x1Cu);
    }

    goto LABEL_18;
  }

  unint64_t v27 = objc_autoreleasePoolPush();
  *(_DWORD *)v41 = v12;
  v6[2](v6, v41);
  objc_autoreleasePoolPop(v27);
  char v21 = 1;
LABEL_19:
  chdir(v13);
  if (v16 && flock(v12, 8))
  {
    id v24 = TRILogCategory_Server();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v34 = __error();
      v35 = strerror(*v34);
      int v36 = *__error();
      *(_DWORD *)v41 = 136315650;
      v42 = v11;
      __int16 v43 = 2080;
      v44 = v35;
      __int16 v45 = 1024;
      int v46 = v36;
      _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Failed to unlock lockfile %s: %s (%d)",  v41,  0x1Cu);
    }
  }

  close(v12);
LABEL_25:

  objc_autoreleasePoolPop(v7);
  return v21 & 1;
}

+ ($A5A652246548B43F8BC05201A1C72A70)_compressFilesInCurrentDirectoryWithLockWitness:(TRIFlockWitness_ *)a3 shouldDefer:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentDirectoryPath]);

  id v7 = objc_opt_new(&OBJC_CLASS___TRIFileSystemCompressor);
  unsigned __int8 v8 = -[TRIFileSystemCompressor inPlaceCompressDirectory:shouldDefer:]( v7,  "inPlaceCompressDirectory:shouldDefer:",  v6,  v4);

  return ($A5A652246548B43F8BC05201A1C72A70)v8;
}

+ ($A5A652246548B43F8BC05201A1C72A70)_withLockWitness:(TRIFlockWitness_ *)a3 performExtractionIntoCurrentDirectoryFromArchive:(archive *)a4 maxUnarchivedSize:(unint64_t)a5 archiveIdentifier:(id)a6 shouldDefer:(id)a7
{
  id v10 = a6;
  id v11 = a7;
  id v109 = a1;
  id v110 = [a1 _createWriteDiskArchive];
  if (!v110)
  {
    id v76 = TRILogCategory_Archiving();
    v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v118 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_ERROR,  "Unable to create disk archive for writing.",  v118,  2u);
    }

    v78.var0 = 0;
    goto LABEL_105;
  }

  unint64_t v113 = a5;
  while (1)
  {
    do
    {
      uint64_t v112 = 0LL;
      int v12 = archive_read_next_header(a4, &v112);
      if (v12)
      {
        if (v12 == 1)
        {
          v78.var0 = 1;
          goto LABEL_96;
        }

        id v79 = TRILogCategory_Archiving();
        v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          uint64_t v81 = archive_error_string(a4);
          *(_DWORD *)v118 = 136315138;
          uint64_t v119 = v81;
          v82 = "archive_read_next_header failed - %s.";
          goto LABEL_107;
        }

+ ($A5A652246548B43F8BC05201A1C72A70)extractArchiveFromHandle:(id)a3 toDestinationDirectoryURL:(id)a4 maxUnarchivedSize:(unint64_t)a5 archiveIdentifier:(id)a6 postExtractionCompression:(id)a7 shouldDefer:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  uint64_t v18 = (Block_layout *)a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v26 handleFailureInMethod:a2, a1, @"TRIArchiveExtractor.m", 435, @"Invalid parameter not satisfying: %@", @"archiveHandle" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }

  NSUInteger v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v27 handleFailureInMethod:a2, a1, @"TRIArchiveExtractor.m", 436, @"Invalid parameter not satisfying: %@", @"destinationURL" object file lineNumber description];

LABEL_3:
  if (v18) {
    id v19 = v18;
  }
  else {
    id v19 = &stru_10000C560;
  }
  uint64_t v20 = objc_retainBlock(v19);

  uint64_t v36 = 0LL;
  id v37 = &v36;
  uint64_t v38 = 0x2810000000LL;
  int v39 = &unk_1000093A9;
  char v40 = 0;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100002CF0;
  v28[3] = &unk_10000C588;
  v32 = &v36;
  id v33 = a1;
  id v21 = v15;
  id v29 = v21;
  unint64_t v34 = a5;
  id v22 = v17;
  id v30 = v22;
  id v23 = v20;
  v31 = v23;
  unint64_t var0 = a7.var0;
  +[TRIArchiveExtractor _withLockAndDirectoryChangedToURL:runBlock:]( &OBJC_CLASS___TRIArchiveExtractor,  "_withLockAndDirectoryChangedToURL:runBlock:",  v16,  v28);
  v24.unint64_t var0 = *((_BYTE *)v37 + 32);

  _Block_object_dispose(&v36, 8);
  return v24;
}

- (NSURL)archiveFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end