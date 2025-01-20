@interface DSSnapshotFileManager
- (BOOL)__createReadmeFileWithError:(id *)a3;
- (BOOL)__createSharedDirectoriesMapFileWithError:(id *)a3;
- (BOOL)__createSharedLogFileWithError:(id *)a3;
- (BOOL)cleanupWithError:(id *)a3;
- (BOOL)createWorkingDirectoryAndSharedFilesWithError:(id *)a3;
- (BOOL)shouldHashVolumeListings;
- (BOOL)writeFileForMetadata:(id)a3 error:(id *)a4;
- (DSSnapshotRequest)_snapshotRequest;
- (NSPointerArray)__openFiles;
- (NSString)_workingDirectoryName;
- (NSString)_workingDirectoryPath;
- (__sFILE)createFileForWritingWithName:(id)a3 error:(id *)a4;
- (__sFILE)sharedDirectoriesMapFile;
- (__sFILE)sharedLogFile;
- (id)__workingDirectoryParentPath;
- (id)_archiveToDirectoryAtPath:(id)a3 error:(id *)a4;
- (id)archiveWithError:(id *)a3;
- (id)fileURLForFileNamed:(id)a3 error:(id *)a4;
- (id)initForSnapshotRequest:(id)a3;
- (void)__closeFiles;
- (void)__flushFiles;
- (void)dealloc;
@end

@implementation DSSnapshotFileManager

- (id)__workingDirectoryParentPath
{
  if (qword_1000666D8 != -1) {
    dispatch_once(&qword_1000666D8, &stru_100060720);
  }
  return (id)qword_1000666D0;
}

- (BOOL)__createReadmeFileWithError:(id *)a3
{
  id v5 = shared_filesystem_metadata_snapshot_service_log_handle();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Creating readme file", buf, 2u);
  }

  if (a3) {
    *a3 = 0LL;
  }
  id v12 = 0LL;
  v7 = -[DSSnapshotFileManager createFileForWritingWithName:error:]( self,  "createFileForWritingWithName:error:",  @"README.txt",  &v12);
  id v8 = v12;
  if (v7)
  {
    fputs( "A filesystem metadata snapshot contains information necessary to investigate reports of issues with disk space.\n \n Use dsf(1) to inspect the contents:\n \n xcrun -sdk iphoneos dsf -h\n \n See man page for more:\n \n man $(xcrun --show-sdk-platform-path -sdk iphoneos)/usr/local/share/man/man1/dsf.1\n",  v7);
    if (a3) {
LABEL_7:
    }
      *a3 = v8;
  }

  else
  {
    id v10 = shared_filesystem_metadata_snapshot_service_log_handle();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002B2AC(v8);
    }

    if (a3) {
      goto LABEL_7;
    }
  }

  return v7 != 0LL;
}

- (BOOL)__createSharedDirectoriesMapFileWithError:(id *)a3
{
  if (a3) {
    *a3 = 0LL;
  }
  if (!-[DSSnapshotFileManager shouldHashVolumeListings](self, "shouldHashVolumeListings"))
  {
    id v10 = 0LL;
    BOOL v11 = 1;
    if (!a3) {
      goto LABEL_14;
    }
LABEL_13:
    *a3 = v10;
    goto LABEL_14;
  }

  id v5 = shared_filesystem_metadata_snapshot_service_log_handle();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Creating shared directories map file", buf, 2u);
  }

  id v17 = 0LL;
  v7 = -[DSSnapshotFileManager createFileForWritingWithName:error:]( self,  "createFileForWritingWithName:error:",  @"directories.fsmap",  &v17);
  id v8 = v17;
  self->_sharedDirectoriesMapFile = v7;
  v9 = -[DSSnapshotFileManager sharedDirectoriesMapFile](self, "sharedDirectoriesMapFile");
  id v10 = 0LL;
  BOOL v11 = v9 != 0LL;
  if (!v9)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to create mapping file for directories (%@): %@",  @"directories.fsmap",  v8));
    v19[0] = NSUnderlyingErrorKey;
    v19[1] = NSLocalizedDescriptionKey;
    v20[0] = v8;
    v20[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FilesystemMetadataSnapshot",  65543LL,  v13));

    id v14 = shared_filesystem_metadata_snapshot_service_log_handle();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10002B324(v8);
    }
  }

  if (a3) {
    goto LABEL_13;
  }
LABEL_14:

  return v11;
}

- (BOOL)__createSharedLogFileWithError:(id *)a3
{
  id v5 = shared_filesystem_metadata_snapshot_service_log_handle();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Creating log file", buf, 2u);
  }

  if (a3) {
    *a3 = 0LL;
  }
  id v13 = 0LL;
  v7 = -[DSSnapshotFileManager createFileForWritingWithName:error:]( self,  "createFileForWritingWithName:error:",  @"log.log",  &v13);
  id v8 = v13;
  self->_sharedLogFile = v7;
  v9 = -[DSSnapshotFileManager sharedLogFile](self, "sharedLogFile");
  if (!v9)
  {
    self->_sharedLogFile = __stderrp;
    id v10 = shared_filesystem_metadata_snapshot_service_log_handle();
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002B39C(v8);
    }
  }

  if (a3) {
    *a3 = v8;
  }

  return v9 != 0LL;
}

- (void)__flushFiles
{
  id v3 = shared_filesystem_metadata_snapshot_service_log_handle();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Flushing files", v12, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager __openFiles](self, "__openFiles"));
  [v5 compact];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager __openFiles](self, "__openFiles"));
  id v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0LL;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager __openFiles](self, "__openFiles"));
      fflush((FILE *)[v9 pointerAtIndex:v8]);

      ++v8;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager __openFiles](self, "__openFiles"));
      id v11 = [v10 count];
    }

    while (v8 < (unint64_t)v11);
  }

- (void)__closeFiles
{
  id v3 = shared_filesystem_metadata_snapshot_service_log_handle();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Closing files", v13, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager __openFiles](self, "__openFiles"));
  [v5 compact];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager __openFiles](self, "__openFiles"));
  id v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0LL;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager __openFiles](self, "__openFiles"));
      [v9 replacePointerAtIndex:v8 withPointer:0];

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager __openFiles](self, "__openFiles"));
      fclose((FILE *)[v10 pointerAtIndex:v8]);

      ++v8;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager __openFiles](self, "__openFiles"));
      id v12 = [v11 count];
    }

    while (v8 < (unint64_t)v12);
  }

- (id)_archiveToDirectoryAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = shared_filesystem_metadata_snapshot_service_log_handle();
  unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager _workingDirectoryName](self, "_workingDirectoryName"));
    *(_DWORD *)buf = 138412290;
    id v55 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Archiving %@", buf, 0xCu);
  }

  if (a4) {
    *a4 = 0LL;
  }
  -[DSSnapshotFileManager __flushFiles](self, "__flushFiles");
  id v10 = objc_autoreleasePoolPush();
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager _workingDirectoryName](self, "_workingDirectoryName"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager __workingDirectoryParentPath](self, "__workingDirectoryParentPath"));
  id v51 = 0LL;
  unsigned __int8 v13 = +[DSFilesystemMetadataSnapshotArchiver compressSnapshotWithName:atPath:withLogFile:archiveName:]( &OBJC_CLASS___DSFilesystemMetadataSnapshotArchiver,  "compressSnapshotWithName:atPath:withLogFile:archiveName:",  v11,  v12,  -[DSSnapshotFileManager sharedLogFile](self, "sharedLogFile"),  &v51);
  id v14 = v51;

  objc_autoreleasePoolPop(v10);
  if ((v13 & 1) != 0)
  {
    v15 = -[DSSnapshotFileManager sharedLogFile](self, "sharedLogFile");
    id v16 = objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager _workingDirectoryName](self, "_workingDirectoryName"));
    id v17 = (const char *)[v16 UTF8String];
    id v18 = v14;
    LODWORD(v15) = fprintf( v15,  "Successfully compressed directory %s into archive %s\n",  v17,  (const char *)[v18 UTF8String]);

    if ((_DWORD)v15 == -1)
    {
      __error();
      if ((byte_1000666E1 & 1) == 0)
      {
        byte_1000666E1 = 1;
        id v19 = shared_filesystem_metadata_snapshot_service_log_handle();
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    id v21 = shared_filesystem_metadata_snapshot_service_log_handle();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager _workingDirectoryName](self, "_workingDirectoryName"));
      id v24 = [v23 UTF8String];
      id v25 = [v18 UTF8String];
      *(_DWORD *)buf = 136315394;
      id v55 = v24;
      __int16 v56 = 2080;
      id v57 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Successfully compressed directory %s into archive %s",  buf,  0x16u);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager __workingDirectoryParentPath](self, "__workingDirectoryParentPath"));
    id v27 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", v26, v18));

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", v6, v18));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v50 = 0LL;
    unsigned __int8 v30 = [v29 moveItemAtPath:v27 toPath:v28 error:&v50];
    id v31 = v50;

    if ((v30 & 1) != 0)
    {
      id v32 = v28;
      v33 = 0LL;
    }

    else
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to move %@ to %@",  v27,  v28));
      v52[0] = NSUnderlyingErrorKey;
      v52[1] = NSLocalizedDescriptionKey;
      v53[0] = v31;
      v53[1] = v41;
      v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v53,  v52,  2LL));
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FilesystemMetadataSnapshot",  65543LL,  v42));

      if (a4) {
        *a4 = v33;
      }
      v43 = -[DSSnapshotFileManager sharedLogFile](self, "sharedLogFile");
      id v44 = v41;
      if (fprintf(v43, "%s\n", (const char *)[v44 UTF8String]) == -1)
      {
        __error();
        if ((byte_1000666E2 & 1) == 0)
        {
          byte_1000666E2 = 1;
          id v45 = shared_filesystem_metadata_snapshot_service_log_handle();
          v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
            sub_10002B480();
          }
        }
      }

      id v47 = shared_filesystem_metadata_snapshot_service_log_handle();
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        sub_10002B414(v44);
      }

      id v32 = 0LL;
    }
  }

  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager _workingDirectoryName](self, "_workingDirectoryName"));
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to compress directory %@",  v34));

    NSErrorUserInfoKey v58 = NSLocalizedDescriptionKey;
    v59 = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v59,  &v58,  1LL));
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FilesystemMetadataSnapshot",  131073LL,  v36));

    if (a4) {
      *a4 = v33;
    }
    v37 = -[DSSnapshotFileManager sharedLogFile](self, "sharedLogFile");
    id v27 = v35;
    if (fprintf(v37, "%s\n", (const char *)[v27 UTF8String]) == -1)
    {
      __error();
      if ((byte_1000666E0 & 1) == 0)
      {
        byte_1000666E0 = 1;
        id v38 = shared_filesystem_metadata_snapshot_service_log_handle();
        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    id v40 = shared_filesystem_metadata_snapshot_service_log_handle();
    v28 = (void *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR)) {
      sub_10002B414(v27);
    }
    id v32 = 0LL;
  }

  return v32;
}

- (BOOL)createWorkingDirectoryAndSharedFilesWithError:(id *)a3
{
  id v5 = shared_filesystem_metadata_snapshot_service_log_handle();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting up files", buf, 2u);
  }

  if (a3) {
    *a3 = 0LL;
  }
  id v7 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v7, "setDateFormat:", @"yyyy-MM-dd-HHmmss");
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager _snapshotRequest](self, "_snapshotRequest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 beginDate]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v7, "stringFromDate:", v9));

  id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@.%@",  @"FilesystemMeta",  v10,  @"fsmeta"));
  workingDirectoryName = self->__workingDirectoryName;
  self->__workingDirectoryName = v11;

  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager __workingDirectoryParentPath](self, "__workingDirectoryParentPath"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager _workingDirectoryName](self, "_workingDirectoryName"));
  v15 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v13,  v14));
  workingDirectoryPath = self->__workingDirectoryPath;
  self->__workingDirectoryPath = v15;

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager _workingDirectoryPath](self, "_workingDirectoryPath"));
  id v42 = 0LL;
  unsigned __int8 v19 = [v17 createDirectoryAtPath:v18 withIntermediateDirectories:1 attributes:0 error:&v42];
  id v20 = v42;

  if ((v19 & 1) != 0)
  {
    id v21 = shared_filesystem_metadata_snapshot_service_log_handle();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager _workingDirectoryPath](self, "_workingDirectoryPath"));
      *(_DWORD *)buf = 138412290;
      id v44 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Created working directory at %@", buf, 0xCu);
    }

    id v41 = 0LL;
    unsigned __int8 v24 = -[DSSnapshotFileManager __createSharedLogFileWithError:](self, "__createSharedLogFileWithError:", &v41);
    id v25 = v41;
    id v26 = v25;
    if ((v24 & 1) != 0)
    {
      id v40 = v25;
      unsigned __int8 v27 = -[DSSnapshotFileManager __createSharedDirectoriesMapFileWithError:]( self,  "__createSharedDirectoriesMapFileWithError:",  &v40);
      id v28 = v40;

      if ((v27 & 1) != 0)
      {
        -[DSSnapshotFileManager __createReadmeFileWithError:](self, "__createReadmeFileWithError:", 0LL);
        BOOL v29 = 1;
LABEL_28:
        id v26 = v28;
        goto LABEL_29;
      }

      if (!a3)
      {
        BOOL v29 = 0;
        goto LABEL_28;
      }

      id v26 = v28;
      goto LABEL_26;
    }

    if (a3)
    {
LABEL_26:
      id v26 = v26;
      BOOL v29 = 0;
      *a3 = v26;
      goto LABEL_29;
    }
  }

  else
  {
    unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager _workingDirectoryPath](self, "_workingDirectoryPath"));
    id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to create directory %@: %@",  v30,  v20));

    v45[0] = NSUnderlyingErrorKey;
    v45[1] = NSLocalizedDescriptionKey;
    v46[0] = v20;
    v46[1] = v31;
    id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  2LL));
    id v26 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FilesystemMetadataSnapshot",  65543LL,  v32));

    if (a3) {
      *a3 = v26;
    }
    v33 = __stderrp;
    id v34 = v31;
    if (fprintf(v33, "%s\n", (const char *)[v34 UTF8String]) == -1)
    {
      __error();
      if ((byte_1000666E3 & 1) == 0)
      {
        byte_1000666E3 = 1;
        id v35 = shared_filesystem_metadata_snapshot_service_log_handle();
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    id v37 = shared_filesystem_metadata_snapshot_service_log_handle();
    id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_10002B414(v34);
    }
  }

  BOOL v29 = 0;
LABEL_29:

  return v29;
}

- (__sFILE)createFileForWritingWithName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = shared_filesystem_metadata_snapshot_service_log_handle();
  unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Creating file named %@", buf, 0xCu);
  }

  if (a4) {
    *a4 = 0LL;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager _workingDirectoryPath](self, "_workingDirectoryPath"));
  id v10 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", v9, v6));
  id v11 = fopen((const char *)[v10 UTF8String], "w");

  if (v11)
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager __openFiles](self, "__openFiles"));
    [v12 addPointer:v11];
  }

  else
  {
    int v13 = *__error();
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager _workingDirectoryPath](self, "_workingDirectoryPath"));
    v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to open output file at %@/%@: %s. Aborting.",  v14,  v6,  strerror(v13));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v13,  0LL));
    v26[0] = NSUnderlyingErrorKey;
    v26[1] = NSLocalizedDescriptionKey;
    v27[0] = v17;
    v27[1] = v16;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  2LL));
    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FilesystemMetadataSnapshot",  65543LL,  v18));

    if (a4) {
      *a4 = v19;
    }
    id v20 = -[DSSnapshotFileManager sharedLogFile](self, "sharedLogFile");
    id v12 = v16;
    if (fprintf(v20, "%s\n", (const char *)[v12 UTF8String]) == -1)
    {
      __error();
      if ((byte_1000666E4 & 1) == 0)
      {
        byte_1000666E4 = 1;
        id v21 = shared_filesystem_metadata_snapshot_service_log_handle();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    id v23 = shared_filesystem_metadata_snapshot_service_log_handle();
    unsigned __int8 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10002B414(v12);
    }
  }

  return v11;
}

- (BOOL)writeFileForMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0LL;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[DSSnapshotFileManager fileURLForFileNamed:error:]( self,  "fileURLForFileNamed:error:",  @"metadata.plist",  a4));
  id v20 = 0LL;
  unsigned int v8 = [v6 writeToURL:v7 error:&v20];
  id v9 = v20;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v11 = -[DSSnapshotFileManager sharedLogFile](self, "sharedLogFile");
    id v12 = objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
    int v13 = (const char *)[v12 UTF8String];
    id v14 = objc_claimAutoreleasedReturnValue([v6 description]);
    LODWORD(v11) = fprintf( v11,  "Failed to save metadata to file, %s:\n%s\n",  v13,  (const char *)[v14 UTF8String]);

    if ((_DWORD)v11 == -1)
    {
      __error();
      if ((byte_1000666E5 & 1) == 0)
      {
        byte_1000666E5 = 1;
        id v15 = shared_filesystem_metadata_snapshot_service_log_handle();
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    id v17 = shared_filesystem_metadata_snapshot_service_log_handle();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10002B4E0(v10, v6);
    }

    if (a4) {
      *a4 = v10;
    }
  }

  return v8;
}

- (id)fileURLForFileNamed:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4) {
    *a4 = 0LL;
  }
  if (v6)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager _workingDirectoryPath](self, "_workingDirectoryPath"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", v8, v7));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v9, 0LL));

    id v11 = shared_filesystem_metadata_snapshot_service_log_handle();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v7;
      __int16 v18 = 2112;
      unsigned __int8 v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "File URL for file named %@: %@", buf, 0x16u);
    }
  }

  else
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid name for file URL: %@",  0LL));
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    id v21 = v12;
    int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FilesystemMetadataSnapshot",  65543LL,  v13));

    if (a4) {
      *a4 = v14;
    }

    id v10 = 0LL;
  }

  return v10;
}

- (id)archiveWithError:(id *)a3
{
  return -[DSSnapshotFileManager _archiveToDirectoryAtPath:error:]( self,  "_archiveToDirectoryAtPath:error:",  @"/var/mobile/Library/Logs/CrashReporter",  a3);
}

- (BOOL)cleanupWithError:(id *)a3
{
  id v5 = shared_filesystem_metadata_snapshot_service_log_handle();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager _workingDirectoryPath](self, "_workingDirectoryPath"));
    *(_DWORD *)buf = 138412290;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Deleting snapshot directory at %@", buf, 0xCu);
  }

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager _workingDirectoryPath](self, "_workingDirectoryPath"));
  unsigned __int8 v10 = [v8 removeItemAtPath:v9 error:a3];

  if ((v10 & 1) == 0)
  {
    id v11 = __stderrp;
    id v12 = objc_claimAutoreleasedReturnValue(-[DSSnapshotFileManager _workingDirectoryPath](self, "_workingDirectoryPath"));
    int v13 = (const char *)[v12 UTF8String];
    id v14 = objc_claimAutoreleasedReturnValue([*a3 localizedDescription]);
    LODWORD(v11) = fprintf( v11,  "Failed to delete directory %s: %s\n",  v13,  (const char *)[v14 UTF8String]);

    if ((_DWORD)v11 == -1)
    {
      __error();
      if ((byte_1000666E6 & 1) == 0)
      {
        byte_1000666E6 = 1;
        id v15 = shared_filesystem_metadata_snapshot_service_log_handle();
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    id v17 = shared_filesystem_metadata_snapshot_service_log_handle();
    __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10002B588(self, a3);
    }
  }

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DSSnapshotFileManager;
  -[DSSnapshotFileManager dealloc](&v3, "dealloc");
}

- (id)initForSnapshotRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___DSSnapshotFileManager;
    id v5 = -[DSSnapshotFileManager init](&v14, "init");
    id v6 = v5;
    if (v5)
    {
      id v7 = objc_storeWeak((id *)&v5->__snapshotRequest, v4);
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 options]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 objectForKeyedSubscript:@"FilesystemMetadatSnapshotOptionShouldHashVolumeListings"]);
      v6->_shouldHashVolumeListings = [v9 BOOLValue];

      unsigned __int8 v10 = -[NSPointerArray initWithOptions:](objc_alloc(&OBJC_CLASS___NSPointerArray), "initWithOptions:", 2LL);
      openFiles = v6->___openFiles;
      v6->___openFiles = v10;
    }

    self = v6;
    id v12 = self;
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (__sFILE)sharedLogFile
{
  return self->_sharedLogFile;
}

- (__sFILE)sharedDirectoriesMapFile
{
  return self->_sharedDirectoriesMapFile;
}

- (BOOL)shouldHashVolumeListings
{
  return self->_shouldHashVolumeListings;
}

- (NSPointerArray)__openFiles
{
  return (NSPointerArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSString)_workingDirectoryPath
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (DSSnapshotRequest)_snapshotRequest
{
  return (DSSnapshotRequest *)objc_loadWeakRetained((id *)&self->__snapshotRequest);
}

- (NSString)_workingDirectoryName
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void).cxx_destruct
{
}

@end