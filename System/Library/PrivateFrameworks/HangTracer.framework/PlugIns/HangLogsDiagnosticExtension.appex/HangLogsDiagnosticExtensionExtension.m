@interface HangLogsDiagnosticExtensionExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation HangLogsDiagnosticExtensionExtension

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  unsigned __int8 v67 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", a3));
  unsigned int v4 = [v3 fileExistsAtPath:@"/tmp/com.apple.HangTracer.HangLogsDiagnosticExtension" isDirectory:&v67];
  int v5 = v67;

  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    id v17 = shared_ht_log_handle();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v70 = COERCE_DOUBLE(@"/tmp/com.apple.HangTracer.HangLogsDiagnosticExtension");
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Location for temp HangLogsDE directory %@ not usable.",  buf,  0xCu);
    }

    goto LABEL_12;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v8 = [v7 fileExistsAtPath:@"/tmp/com.apple.HangTracer.HangLogsDiagnosticExtension"];

  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/tmp/com.apple.HangTracer.HangLogsDiagnosticExtension"));
    id v66 = 0LL;
    [v9 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&v66];
    v11 = (os_log_s *)v66;

    if (v11)
    {
      id v12 = shared_ht_log_handle();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [@"/tmp/com.apple.HangTracer.HangLogsDiagnosticExtension" UTF8String];
        id v15 = objc_claimAutoreleasedReturnValue(-[os_log_s localizedDescription](v11, "localizedDescription"));
        id v16 = [v15 UTF8String];
        *(_DWORD *)buf = 136315394;
        double v70 = *(double *)&v14;
        __int16 v71 = 2080;
        id v72 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Error creating destination directory %s %s\n",  buf,  0x16u);
      }

LABEL_12:
      v18 = (NSMutableArray *)&__NSArray0__struct;
      goto LABEL_45;
    }
  }

  id ListOfHangArchiveFiles = getListOfHangArchiveFiles(@"/tmp/com.apple.HangTracer.HangLogsDiagnosticExtension");
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(ListOfHangArchiveFiles);
  HTCollectHangLogsBundle(@"/tmp/com.apple.HangTracer.HangLogsDiagnosticExtension", 1);
  float v20 = 0.0;
  do
  {
    id v21 = getListOfHangArchiveFiles(@"/tmp/com.apple.HangTracer.HangLogsDiagnosticExtension");
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    id v23 = v22;
    id v24 = [v23 countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v63;
LABEL_16:
      uint64_t v27 = 0LL;
      while (1)
      {
        if (*(void *)v63 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v62 + 1) + 8 * v27);
        if (-[os_log_s indexOfObject:](v11, "indexOfObject:", v28) == (id)0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        if (v25 == (id)++v27)
        {
          id v25 = [v23 countByEnumeratingWithState:&v62 objects:v68 count:16];
          if (v25) {
            goto LABEL_16;
          }
          goto LABEL_22;
        }
      }

      v29 = v28;

      if (!v29) {
        goto LABEL_24;
      }

      v18 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      v31 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  v29));
      [v31 setDeleteOnAttach:&__kCFBooleanTrue];
      [v31 setShouldCompress:&__kCFBooleanTrue];
      v58 = v31;
      -[NSMutableArray addObject:](v18, "addObject:", v31);
      uint64_t v32 = MGCopyAnswer(@"HWModelStr", 0LL);
      uint64_t v33 = MGCopyAnswer(@"SupplementalBuildVersion", 0LL);
      v34 = objc_opt_new(&OBJC_CLASS___NSDateFormatter);
      -[NSDateFormatter setDateFormat:](v34, "setDateFormat:", @"yyyy-MM-dd-HHmmss");
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v60 = v34;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v34, "stringFromDate:", v35));
      v57 = (void *)v33;
      uint64_t v56 = v33;
      v37 = (void *)v32;
      uint64_t v38 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@-%@-%@.%@",  @"HangHistory",  v32,  v56,  v36,  @"log"));

      v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  @"/tmp/com.apple.HangTracer.HangLogsDiagnosticExtension",  v38));
      id HangHistoryInfo = getHangHistoryInfo(0);
      v41 = (void *)objc_claimAutoreleasedReturnValue(HangHistoryInfo);
      v42 = v41;
      v59 = (void *)v38;
      if (v41 && [v41 length])
      {
        id v61 = 0LL;
        unsigned __int8 v43 = [v42 writeToFile:v39 atomically:1 encoding:4 error:&v61];
        id v44 = v61;
        if ((v43 & 1) != 0)
        {
          v45 = v37;
          v47 = v57;
          v46 = v58;
LABEL_39:
          id v51 = v39;
          if (chmod((const char *)[v51 UTF8String], 0x1B6u))
          {
            id v52 = shared_ht_log_handle();
            v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              double v70 = *(double *)&v51;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Failed to chmod file: %@", buf, 0xCu);
            }
          }

          v54 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  v51));
          [v54 setDeleteOnAttach:&__kCFBooleanTrue];
          -[NSMutableArray addObject:](v18, "addObject:", v54);

          goto LABEL_44;
        }

        id v50 = shared_ht_log_handle();
        v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        v45 = v37;
        v47 = v57;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          double v70 = *(double *)&v39;
          __int16 v71 = 2112;
          id v72 = v44;
          _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Failed to write hang history log into %@ with error: %@",  buf,  0x16u);
        }

        v46 = v58;
      }

      else
      {
        id v48 = shared_ht_log_handle();
        v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Failed to collect hang history info",  buf,  2u);
        }

        id v44 = 0LL;
        v45 = v37;
        v47 = v57;
        v46 = v58;
      }

      goto LABEL_39;
    }

@end