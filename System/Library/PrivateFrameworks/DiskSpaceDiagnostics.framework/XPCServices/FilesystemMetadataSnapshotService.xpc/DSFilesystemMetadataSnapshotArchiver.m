@interface DSFilesystemMetadataSnapshotArchiver
+ (BOOL)compressSnapshotWithName:(id)a3 atPath:(id)a4 withLogFile:(__sFILE *)a5 archiveName:(id *)a6;
@end

@implementation DSFilesystemMetadataSnapshotArchiver

+ (BOOL)compressSnapshotWithName:(id)a3 atPath:(id)a4 withLogFile:(__sFILE *)a5 archiveName:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v9;
  v12 = (const char *)[v11 UTF8String];
  id v13 = v10;
  if (fprintf(a5, "Compressing %s at %s\n", v12, (const char *)[v13 UTF8String]) == -1)
  {
    __error();
    if ((byte_100066710 & 1) == 0)
    {
      byte_100066710 = 1;
      id v14 = shared_filesystem_metadata_snapshot_service_log_handle();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  id v16 = shared_filesystem_metadata_snapshot_service_log_handle();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = [v11 UTF8String];
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = [v13 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Compressing %s at %s", buf, 0x16u);
  }

  id v18 = v13;
  chdir((const char *)[v18 UTF8String]);
  fflush(a5);
  *(void *)&__int128 v59 = 0LL;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.tgz", v11));
  v20 = v19;
  if (a6) {
    *a6 = v19;
  }
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  memset(buf, 0, sizeof(buf));
  id v21 = v20;
  *(void *)&buf[8] = [v21 UTF8String];
  id v22 = v11;
  id v23 = [v22 UTF8String];
  v24 = __stderrp;
  if (a5) {
    v24 = a5;
  }
  *(void *)&buf[16] = v23;
  *(void *)&buf[24] = v24;
  id v25 = shared_filesystem_metadata_snapshot_service_log_handle();
  uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);
  v27 = (void *)v59;
  *(void *)&__int128 v59 = v26;

  archive_snapshot_directory((uint64_t)buf);
  if (*(_DWORD *)buf)
  {
    if (fprintf(a5, "Failed to compress %s\n", *(const char **)&buf[16]) == -1)
    {
      __error();
      if ((byte_100066711 & 1) == 0)
      {
        byte_100066711 = 1;
        id v28 = shared_filesystem_metadata_snapshot_service_log_handle();
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    id v30 = shared_filesystem_metadata_snapshot_service_log_handle();
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_10002B7C4((uint64_t *)&buf[16], v31);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", v18, v21));
    if ([v32 fileExistsAtPath:v33])
    {
      if (fprintf(a5, "Deleting failed compressed archive %s\n", *(const char **)&buf[8]) == -1)
      {
        __error();
        if ((byte_100066712 & 1) == 0)
        {
          byte_100066712 = 1;
          id v34 = shared_filesystem_metadata_snapshot_service_log_handle();
          v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
            sub_10002B480();
          }
        }
      }

      id v36 = shared_filesystem_metadata_snapshot_service_log_handle();
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v54 = 136315138;
        uint64_t v55 = *(void *)&buf[8];
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Deleting failed compressed archive %s",  v54,  0xCu);
      }

      id v53 = 0LL;
      unsigned __int8 v38 = [v32 removeItemAtPath:v33 error:&v53];
      id v39 = v53;
      v40 = v39;
      if ((v38 & 1) == 0)
      {
        v41 = *(const char **)&buf[8];
        id v42 = objc_claimAutoreleasedReturnValue([v39 localizedDescription]);
        BOOL v43 = fprintf( a5,  "Failed to delete compressed archive %s: %s\n",  v41,  (const char *)[v42 UTF8String]) == -1;

        if (v43)
        {
          __error();
          if ((byte_100066713 & 1) == 0)
          {
            byte_100066713 = 1;
            id v44 = shared_filesystem_metadata_snapshot_service_log_handle();
            v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
              sub_10002B480();
            }
          }
        }

        id v46 = shared_filesystem_metadata_snapshot_service_log_handle();
        v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          uint64_t v50 = *(void *)&buf[8];
          id v51 = objc_claimAutoreleasedReturnValue([v40 localizedDescription]);
          id v52 = [v51 UTF8String];
          *(_DWORD *)v54 = 136315394;
          uint64_t v55 = v50;
          __int16 v56 = 2080;
          id v57 = v52;
          _os_log_error_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "Failed to delete compressed archive %s: %s",  v54,  0x16u);
        }
      }
    }

    BOOL v48 = *(_DWORD *)buf == 0;
  }

  else
  {
    BOOL v48 = 1;
  }

  return v48;
}

@end