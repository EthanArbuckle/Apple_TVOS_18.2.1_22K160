@interface FileUtilities
- (BOOL)date:(id)a3 isBetweenDate:(id)a4 andDate:(id)a5;
- (id)createBinsFromStartDate:(id)a3 threshold:(int64_t)a4 identifier:(id)a5 targetFolderPath:(id)a6;
- (id)generateTimeStamp;
- (id)getOldestFileTimestampAt:(id)a3;
- (int64_t)sortDirectory:(id)a3 forBins:(id)a4;
@end

@implementation FileUtilities

- (id)createBinsFromStartDate:(id)a3 threshold:(int64_t)a4 identifier:(id)a5 targetFolderPath:(id)a6
{
  id v23 = a3;
  id v22 = a5;
  id v21 = a6;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FileUtilities generateTimeStamp](self, "generateTimeStamp"));
  if (a4 >= 1)
  {
    uint64_t v12 = 0LL;
    do
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v23 dateByAddingTimeInterval:(double)v12 * -3600.0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dateByAddingTimeInterval:-3600.0]);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringValue]);
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"coreaudio_%@_%@_%@",  v22,  v11,  v16));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByAppendingPathComponent:v17]);

      v19 = -[Bin initWithFolderPath:startDate:endDate:]( objc_alloc(&OBJC_CLASS___Bin),  "initWithFolderPath:startDate:endDate:",  v18,  v14,  v13);
      -[NSMutableArray addObject:](v10, "addObject:", v19);

      ++v12;
    }

    while (a4 != v12);
  }

  return v10;
}

- (int64_t)sortDirectory:(id)a3 forBins:(id)a4
{
  id v6 = a3;
  id v36 = a4;
  v44 = v6;
  id v61 = 0LL;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v47 subpathsOfDirectoryAtPath:v6 error:&v61]);
  id v7 = v61;
  if (v7)
  {
    v8 = v7;
    if (qword_10000C6D0 != -1) {
      dispatch_once(&qword_10000C6D0, &stru_100008210);
    }
    log = (os_log_s *)*(id *)qword_10000C6D8;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 localizedDescription]);
      *(_DWORD *)buf = 136315906;
      v63 = "FileUtilities.mm";
      __int16 v64 = 1024;
      int v65 = 53;
      __int16 v66 = 2114;
      v67 = v35;
      __int16 v68 = 2114;
      v69 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Failed to get directory subpaths. { directory=%{public}@, error=%{public}@ }",  buf,  0x26u);
    }

    goto LABEL_53;
  }

  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  log = v35;
  id v10 = -[os_log_s countByEnumeratingWithState:objects:count:]( log,  "countByEnumeratingWithState:objects:count:",  &v57,  v73,  16LL);
  if (v10)
  {
    id v39 = v10;
    v8 = 0LL;
    int64_t v42 = 0LL;
    uint64_t v38 = *(void *)v58;
    while (1)
    {
      v41 = 0LL;
      do
      {
        if (*(void *)v58 != v38) {
          objc_enumerationMutation(log);
        }
        uint64_t v45 = *(void *)(*((void *)&v57 + 1) + 8LL * (void)v41);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:"));
        char v56 = 0;
        unsigned __int8 v12 = [v47 fileExistsAtPath:v11 isDirectory:&v56];
        if (v56) {
          unsigned __int8 v13 = 0;
        }
        else {
          unsigned __int8 v13 = v12;
        }
        if ((v13 & 1) == 0) {
          goto LABEL_49;
        }
        id v55 = v8;
        v43 = v11;
        v40 = (void *)objc_claimAutoreleasedReturnValue([v47 attributesOfItemAtPath:v11 error:&v55]);
        id v14 = v55;

        if (!v14)
        {
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v40 objectForKey:NSFileCreationDate]);
          __int128 v53 = 0u;
          __int128 v54 = 0u;
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          id obj = v36;
          id v14 = 0LL;
          id v17 = [obj countByEnumeratingWithState:&v51 objects:v72 count:16];
          if (!v17) {
            goto LABEL_47;
          }
          uint64_t v18 = *(void *)v52;
          while (1)
          {
            v19 = 0LL;
            do
            {
              if (*(void *)v52 != v18) {
                objc_enumerationMutation(obj);
              }
              v20 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)v19);
              id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 start]);
              id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 end]);
              unsigned __int8 v23 = -[FileUtilities date:isBetweenDate:andDate:](self, "date:isBetweenDate:andDate:", v15, v21, v22);

              if ((v23 & 1) != 0)
              {
                v24 = (void *)objc_claimAutoreleasedReturnValue([v20 folderPath]);
                id v50 = v14;
                [v47 createDirectoryAtPath:v24 withIntermediateDirectories:1 attributes:0 error:&v50];
                id v25 = v50;

                if (v25)
                {
                  if (qword_10000C6D0 != -1) {
                    dispatch_once(&qword_10000C6D0, &stru_100008210);
                  }
                  v26 = (os_log_s *)*(id *)qword_10000C6D8;
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                  {
                    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 localizedDescription]);
                    *(_DWORD *)buf = 136315906;
                    v63 = "FileUtilities.mm";
                    __int16 v64 = 1024;
                    int v65 = 80;
                    __int16 v66 = 2114;
                    v67 = v44;
                    __int16 v68 = 2114;
                    v69 = v27;
                    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Failed to create directory. { directory=%{public}@, error=%{public}@ }",  buf,  0x26u);
                  }

                  goto LABEL_44;
                }

                v28 = (void *)objc_claimAutoreleasedReturnValue([v20 folderPath]);
                v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 stringByAppendingPathComponent:v45]);

                v29 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s stringByDeletingLastPathComponent](v26, "stringByDeletingLastPathComponent"));
                id v49 = 0LL;
                [v47 createDirectoryAtPath:v29 withIntermediateDirectories:1 attributes:0 error:&v49];
                id v25 = v49;

                if (v25)
                {
                  if (qword_10000C6D0 != -1) {
                    dispatch_once(&qword_10000C6D0, &stru_100008210);
                  }
                  v30 = (os_log_s *)*(id *)qword_10000C6D8;
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  {
                    v31 = (void *)objc_claimAutoreleasedReturnValue( -[os_log_s stringByDeletingLastPathComponent]( v26,  "stringByDeletingLastPathComponent"));
                    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 localizedDescription]);
                    *(_DWORD *)buf = 136315906;
                    v63 = "FileUtilities.mm";
                    __int16 v64 = 1024;
                    int v65 = 87;
                    __int16 v66 = 2114;
                    v67 = v31;
                    __int16 v68 = 2114;
                    v69 = v32;
                    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Failed to create directory. { directory=%{public}@, error=%{public}@ }",  buf,  0x26u);
                  }

                  goto LABEL_36;
                }

                id v48 = 0LL;
                [v47 moveItemAtPath:v43 toPath:v26 error:&v48];
                id v25 = v48;
                if (v25)
                {
                  if (qword_10000C6D0 != -1) {
                    dispatch_once(&qword_10000C6D0, &stru_100008210);
                  }
                  v30 = (os_log_s *)*(id *)qword_10000C6D8;
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  {
                    v33 = (void *)objc_claimAutoreleasedReturnValue([v25 localizedDescription]);
                    *(_DWORD *)buf = 136316162;
                    v63 = "FileUtilities.mm";
                    __int16 v64 = 1024;
                    int v65 = 93;
                    __int16 v66 = 2114;
                    v67 = v43;
                    __int16 v68 = 2114;
                    v69 = v26;
                    __int16 v70 = 2114;
                    v71 = v33;
                    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Failed to move file. { from=%{public}@, to=%{public}@, error=%{public}@",  buf,  0x30u);
                  }

- (id)getOldestFileTimestampAt:(id)a3
{
  id v21 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v28 = 0LL;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v3 subpathsOfDirectoryAtPath:v21 error:&v28]);
  id v4 = v28;
  if (v4)
  {
    v5 = v4;
    if (qword_10000C6D0 != -1) {
      dispatch_once(&qword_10000C6D0, &stru_100008210);
    }
    log = (os_log_s *)*(id *)qword_10000C6D8;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
      *(_DWORD *)buf = 136315650;
      v30 = "FileUtilities.mm";
      __int16 v31 = 1024;
      int v32 = 111;
      __int16 v33 = 2114;
      v34 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Failed to get file paths. { error=%{public}@ }",  buf,  0x1Cu);
    }

    v19 = 0LL;
  }

  else
  {
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    log = v18;
    v5 = 0LL;
    id v7 = -[os_log_s countByEnumeratingWithState:objects:count:]( log,  "countByEnumeratingWithState:objects:count:",  &v24,  v37,  16LL);
    if (v7)
    {
      uint64_t v8 = *(void *)v25;
      do
      {
        v9 = 0LL;
        do
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(log);
          }
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v21,  *(void *)(*((void *)&v24 + 1) + 8LL * (void)v9)));
          char v23 = 0;
          unsigned int v11 = [v3 fileExistsAtPath:v10 isDirectory:&v23];
          if (v23) {
            unsigned int v12 = 0;
          }
          else {
            unsigned int v12 = v11;
          }
          if (v12 == 1)
          {
            id v22 = v5;
            unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v3 attributesOfItemAtPath:v10 error:&v22]);
            id v14 = v22;

            if (v14)
            {
              if (qword_10000C6D0 != -1) {
                dispatch_once(&qword_10000C6D0, &stru_100008210);
              }
              v15 = (os_log_s *)*(id *)qword_10000C6D8;
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedDescription]);
                *(_DWORD *)buf = 136315906;
                v30 = "FileUtilities.mm";
                __int16 v31 = 1024;
                int v32 = 125;
                __int16 v33 = 2114;
                v34 = v10;
                __int16 v35 = 2114;
                id v36 = v16;
                _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Failed to fetch file attributes. { filePath=%{public}@, error=%{public}@ }",  buf,  0x26u);
              }
            }

            else
            {
              v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 objectForKey:NSFileCreationDate]);
              if (-[os_log_s compare:](v15, "compare:", v19) == (id)-1LL)
              {
                v15 = v15;

                v19 = v15;
              }
            }

            v5 = v14;
          }

          v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = -[os_log_s countByEnumeratingWithState:objects:count:]( log,  "countByEnumeratingWithState:objects:count:",  &v24,  v37,  16LL);
      }

      while (v7);
    }
  }

  return v19;
}

- (id)generateTimeStamp
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v2, "setDateFormat:", @"yyyyMMdd-HHmmss.SSS");
  v3 = objc_alloc_init(&OBJC_CLASS___NSDate);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v2, "stringFromDate:", v3));

  return v4;
}

- (BOOL)date:(id)a3 isBetweenDate:(id)a4 andDate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [v7 compare:v8] != (id)-1 && objc_msgSend(v7, "compare:", v9) != (id)1;

  return v10;
}

@end