@interface ZipManager
- (BOOL)createZipArchiveForFileURL:(id)a3 to:(id)a4;
- (FileUtilities)fileUtilities;
- (id)createZipFor:(id)a3 at:(id)a4 withStaleFileThreshold:(int64_t)a5;
- (void)setFileUtilities:(id)a3;
@end

@implementation ZipManager

- (FileUtilities)fileUtilities
{
  fileUtilities = self->_fileUtilities;
  if (!fileUtilities)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___FileUtilities);
    v5 = self->_fileUtilities;
    self->_fileUtilities = v4;

    fileUtilities = self->_fileUtilities;
  }

  return fileUtilities;
}

- (id)createZipFor:(id)a3 at:(id)a4 withStaleFileThreshold:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v10 fileExistsAtPath:v8])
  {
    id v41 = 0LL;
    [v10 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v41];
    id v11 = v41;
    if (v11)
    {
      id v12 = v11;
      if (qword_10000C6E0 != -1) {
        dispatch_once(&qword_10000C6E0, &stru_100008230);
      }
      v13 = (os_log_s *)*(id *)qword_10000C6E8;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
        *(_DWORD *)buf = 136315906;
        v43 = "ZipManager.mm";
        __int16 v44 = 1024;
        int v45 = 57;
        __int16 v46 = 2114;
        id v47 = v9;
        __int16 v48 = 2114;
        id v49 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Failed to create target directory. { target=%{public}@, error=%{public}@ }",  buf,  0x26u);
      }

      v15 = 0LL;
    }

    else
    {
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ZipManager fileUtilities](self, "fileUtilities"));
      v37 = (void *)objc_claimAutoreleasedReturnValue([v17 getOldestFileTimestampAt:v8]);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
      v38 = (void *)objc_claimAutoreleasedReturnValue([v18 components:32 fromDate:v37 toDate:v13 options:0]);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ZipManager fileUtilities](self, "fileUtilities"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
      v39 = (void *)objc_claimAutoreleasedReturnValue( [v19 createBinsFromStartDate:v13 threshold:a5 identifier:v20 targetFolderPath:v9]);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ZipManager fileUtilities](self, "fileUtilities"));
      id v22 = [v21 sortDirectory:v8 forBins:v39];

      if (qword_10000C6E0 != -1) {
        dispatch_once(&qword_10000C6E0, &stru_100008230);
      }
      v23 = (os_log_s *)*(id *)qword_10000C6E8;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v43 = "ZipManager.mm";
        __int16 v44 = 1024;
        int v45 = 69;
        __int16 v46 = 2048;
        id v47 = v22;
        __int16 v48 = 2114;
        id v49 = v8;
        __int16 v50 = 2114;
        id v51 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d Sorted and moved files. { numMoved=%ld, from=%{public}@, to=%{public}@ }",  buf,  0x30u);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue([v39 firstObject]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 folderPath]);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v25));

      v27 = (void *)objc_claimAutoreleasedReturnValue([v39 firstObject]);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 folderPath]);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.zip", v28));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v29));

      if (-[ZipManager createZipArchiveForFileURL:to:](self, "createZipArchiveForFileURL:to:", v26, v30))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue([v26 path]);
        id v40 = 0LL;
        [v10 removeItemAtPath:v31 error:&v40];
        id v12 = v40;

        if (v12)
        {
          if (qword_10000C6E0 != -1) {
            dispatch_once(&qword_10000C6E0, &stru_100008230);
          }
          v32 = (os_log_s *)*(id *)qword_10000C6E8;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue([v26 path]);
            v34 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
            *(_DWORD *)buf = 136315906;
            v43 = "ZipManager.mm";
            __int16 v44 = 1024;
            int v45 = 81;
            __int16 v46 = 2114;
            id v47 = v33;
            __int16 v48 = 2114;
            id v49 = v34;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Failed to remove zipped folder. { folderPath=%{public}@, error=%{public}@ }",  buf,  0x26u);
          }
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue([v30 path]);
      }

      else
      {
        if (qword_10000C6E0 != -1) {
          dispatch_once(&qword_10000C6E0, &stru_100008230);
        }
        v35 = (os_log_s *)*(id *)qword_10000C6E8;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v43 = "ZipManager.mm";
          __int16 v44 = 1024;
          int v45 = 75;
          __int16 v46 = 2114;
          id v47 = v26;
          __int16 v48 = 2114;
          id v49 = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Failed to create zip. { folderToZip=%{public}@, zipPath=%{public}@ }",  buf,  0x26u);
        }

        id v12 = 0LL;
        v15 = 0LL;
      }
    }
  }

  else
  {
    if (qword_10000C6E0 != -1) {
      dispatch_once(&qword_10000C6E0, &stru_100008230);
    }
    v16 = (os_log_s *)*(id *)qword_10000C6E8;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v43 = "ZipManager.mm";
      __int16 v44 = 1024;
      int v45 = 50;
      __int16 v46 = 2114;
      id v47 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%25s:%-5d Cannot create zip, directory is empty. { directory=%{public}@ }",  buf,  0x1Cu);
    }

    v15 = 0LL;
  }

  return v15;
}

- (BOOL)createZipArchiveForFileURL:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v23 = BOMCopierNew();
  if (v23)
  {
    v7 = -[NSOutputStream initWithURL:append:]( objc_alloc(&OBJC_CLASS___NSOutputStream),  "initWithURL:append:",  v6,  1LL,  &v23);
    -[NSOutputStream open](v7, "open");
    v34[0] = @"createPKZip";
    v34[1] = @"outputStream";
    v35[0] = &__kCFBooleanTrue;
    v35[1] = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  2LL));
    if (qword_10000C6E0 != -1) {
      dispatch_once(&qword_10000C6E0, &stru_100008230);
    }
    id v9 = (os_log_s *)*(id *)qword_10000C6E8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (char *)objc_claimAutoreleasedReturnValue([v5 path]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
      *(_DWORD *)buf = 136315906;
      v25 = "ZipManager.mm";
      __int16 v26 = 1024;
      int v27 = 106;
      __int16 v28 = 2114;
      v29 = v10;
      __int16 v30 = 2114;
      v31 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d Zipping file. { from=%{public}@, to=%{public}@ }",  buf,  0x26u);
    }

    uint64_t v12 = v23;
    id v13 = objc_claimAutoreleasedReturnValue([v5 path]);
    int v14 = BOMCopierCopyWithOptions(v12, [v13 fileSystemRepresentation], 0, v8);

    BOOL v15 = v14 == 0;
    if (v14)
    {
      if (qword_10000C6E0 != -1) {
        dispatch_once(&qword_10000C6E0, &stru_100008230);
      }
      v16 = (os_log_s *)*(id *)qword_10000C6E8;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (char *)objc_claimAutoreleasedReturnValue([v5 path]);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
        *(_DWORD *)buf = 136316162;
        v25 = "ZipManager.mm";
        __int16 v26 = 1024;
        int v27 = 109;
        __int16 v28 = 2114;
        v29 = v17;
        __int16 v30 = 2114;
        v31 = v18;
        __int16 v32 = 1024;
        int v33 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Failed to copy and zip. { from=%{public}@, to=%{public}@, error=%d }",  buf,  0x2Cu);
      }
    }

    BOMCopierFree(v23);
  }

  else
  {
    if (qword_10000C6E0 != -1) {
      dispatch_once(&qword_10000C6E0, &stru_100008230);
    }
    v19 = (os_log_s *)*(id *)qword_10000C6E8;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = __error();
      v21 = strerror(*v20);
      *(_DWORD *)buf = 136315650;
      v25 = "ZipManager.mm";
      __int16 v26 = 1024;
      int v27 = 91;
      __int16 v28 = 2082;
      v29 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Failed to create copier. { error=%{public}s }",  buf,  0x1Cu);
    }

    BOOL v15 = 0;
  }

  return v15;
}

- (void)setFileUtilities:(id)a3
{
}

- (void).cxx_destruct
{
}

@end