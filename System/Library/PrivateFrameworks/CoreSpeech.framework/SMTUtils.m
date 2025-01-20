@interface SMTUtils
+ (id)decompressArchiveWithURL:(id)a3 outError:(id *)a4;
+ (void)cleanupTemporaryDirectory;
+ (void)initialize;
@end

@implementation SMTUtils

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SMTUtils, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.speech.speechmodeltraining", "SMTUtils");
    v3 = (void *)qword_100016040;
    qword_100016040 = (uint64_t)v2;
  }

+ (void)cleanupTemporaryDirectory
{
  os_log_t v2 = NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v3, 1LL));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v24 = 0LL;
  v18 = (void *)v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:0 options:0 error:&v24]);
  id v7 = v24;

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        v13 = v7;
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        id v19 = v13;
        [v15 removeItemAtURL:v14 error:&v19];
        id v7 = v19;

        if (v7)
        {
          v16 = (os_log_s *)qword_100016040;
          if (os_log_type_enabled((os_log_t)qword_100016040, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v26 = v7;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Failed to clean temporary attachment directory: %@",  buf,  0xCu);
          }
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }

    while (v10);
  }

  v17 = (os_log_s *)qword_100016040;
  if (os_log_type_enabled((os_log_t)qword_100016040, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Successfully cleaned temporary attachment directory: %@",  buf,  0xCu);
  }
}

+ (id)decompressArchiveWithURL:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  v6 = NSTemporaryDirectory();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v7, 1LL));
  uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([(id)v9 UUIDString]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 URLByAppendingPathComponent:v10]);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v44 = 0LL;
  LOBYTE(v9) = [v12 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v44];
  id v13 = v44;

  if ((v9 & 1) != 0)
  {
    uint64_t v14 = archive_read_new();
    if (archive_read_support_filter_all())
    {
      v15 = (void *)qword_100016040;
      if (os_log_type_enabled((os_log_t)qword_100016040, OS_LOG_TYPE_ERROR))
      {
        v33 = v15;
        uint64_t v34 = archive_error_string(v14);
        *(_DWORD *)buf = 136315138;
        uint64_t v54 = v34;
        _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Failed to specify compression algorithm: %s",  buf,  0xCu);
      }

      archive_read_free(v14);
      if (!a4) {
        goto LABEL_23;
      }
      NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
      v52 = @"Failed to specify compression algorithm";
      v16 = &v52;
      v17 = &v51;
      goto LABEL_22;
    }

    if (archive_read_support_format_all(v14))
    {
      __int128 v20 = (void *)qword_100016040;
      if (os_log_type_enabled((os_log_t)qword_100016040, OS_LOG_TYPE_ERROR))
      {
        v39 = v20;
        uint64_t v40 = archive_error_string(v14);
        *(_DWORD *)buf = 136315138;
        uint64_t v54 = v40;
        _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "Failed to specify format: %s",  buf,  0xCu);
      }

      archive_read_free(v14);
      if (!a4) {
        goto LABEL_23;
      }
      NSErrorUserInfoKey v49 = NSLocalizedDescriptionKey;
      v50 = @"Failed to specify format";
      v16 = &v50;
      v17 = &v49;
      goto LABEL_22;
    }

    id v21 = [v5 fileSystemRepresentation];
    __int128 v22 = (os_log_s *)qword_100016040;
    if (os_log_type_enabled((os_log_t)qword_100016040, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v54 = (uint64_t)v21;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Start extracting archive at path: %s",  buf,  0xCu);
    }

    if (archive_read_open_filename(v14, v21, 8096LL))
    {
      __int128 v23 = (void *)qword_100016040;
      if (os_log_type_enabled((os_log_t)qword_100016040, OS_LOG_TYPE_ERROR))
      {
        v41 = v23;
        uint64_t v42 = archive_error_string(v14);
        *(_DWORD *)buf = 136315138;
        uint64_t v54 = v42;
        _os_log_error_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "Failed to open archive for reading: %s",  buf,  0xCu);
      }

      archive_read_free(v14);
      if (!a4) {
        goto LABEL_23;
      }
      NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
      v48 = @"Failed to open file for reading";
      v16 = &v48;
      v17 = &v47;
LABEL_22:
      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v17,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.siri.speechmodeltraining",  5LL,  v24));

      goto LABEL_23;
    }

    id v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    while (!archive_read_next_header(v14, &v43))
    {
      v27 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  archive_entry_pathname(v43));
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:v28]);

      v30 = (os_log_s *)qword_100016040;
      if (os_log_type_enabled((os_log_t)qword_100016040, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v54 = (uint64_t)v29;
        _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Entry extraction path: %@", buf, 0xCu);
      }

      uint64_t v31 = v43;
      id v32 = v29;
      archive_entry_set_pathname(v31, [v32 fileSystemRepresentation]);
      if (archive_read_extract(v14, v43, 0LL))
      {
        v36 = (os_log_s *)qword_100016040;
        if (os_log_type_enabled((os_log_t)qword_100016040, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v54 = (uint64_t)v32;
          _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "Unable to extract file to: %@",  buf,  0xCu);
        }

        archive_read_free(v14);
        if (a4)
        {
          NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
          v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to extract file to: %@",  v32));
          v46 = v37;
          v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
          *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.siri.speechmodeltraining",  5LL,  v38));
        }

        id v19 = 0LL;
        goto LABEL_41;
      }

      -[NSMutableArray addObject:](v26, "addObject:", v32);
    }

    archive_read_free(v14);
    v35 = (os_log_s *)qword_100016040;
    if (os_log_type_enabled((os_log_t)qword_100016040, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v54 = (uint64_t)v11;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Finished extracting archive to: %@", buf, 0xCu);
    }

    id v19 = v26;
LABEL_41:
  }

  else
  {
    v18 = (os_log_s *)qword_100016040;
    if (os_log_type_enabled((os_log_t)qword_100016040, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v54 = (uint64_t)v11;
      __int16 v55 = 2112;
      id v56 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Could not make temporary attachment directory at %@: %@",  buf,  0x16u);
      if (!a4) {
        goto LABEL_23;
      }
    }

    else if (!a4)
    {
LABEL_23:
      id v19 = 0LL;
      goto LABEL_24;
    }

    id v19 = 0LL;
    *a4 = v13;
  }

@end