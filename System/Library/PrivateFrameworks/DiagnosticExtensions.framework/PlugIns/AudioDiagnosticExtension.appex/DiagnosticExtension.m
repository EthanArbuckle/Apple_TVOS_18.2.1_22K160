@interface DiagnosticExtension
- (DiagnosticExtension)init;
- (ZipManager)zipManager;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)createAttachments;
- (void)setZipManager:(id)a3;
@end

@implementation DiagnosticExtension

- (DiagnosticExtension)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DiagnosticExtension;
  v2 = -[DiagnosticExtension init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___ZipManager);
    -[DiagnosticExtension setZipManager:](v2, "setZipManager:", v3);
  }

  return v2;
}

- (id)attachmentList
{
  if (qword_10000C6C0 != -1) {
    dispatch_once(&qword_10000C6C0, &stru_1000081F0);
  }
  v3 = (os_log_s *)*(id *)qword_10000C6C8;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    v6 = "DiagnosticExtension.mm";
    __int16 v7 = 1024;
    int v8 = 54;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d attachmentList called.",  (uint8_t *)&v5,  0x12u);
  }

  return (id)objc_claimAutoreleasedReturnValue(-[DiagnosticExtension createAttachments](self, "createAttachments"));
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  if (qword_10000C6C0 != -1) {
    dispatch_once(&qword_10000C6C0, &stru_1000081F0);
  }
  int v5 = (os_log_s *)*(id *)qword_10000C6C8;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315394;
    v9 = "DiagnosticExtension.mm";
    __int16 v10 = 1024;
    int v11 = 60;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d attachmentsForParameters called.",  (uint8_t *)&v8,  0x12u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DiagnosticExtension createAttachments](self, "createAttachments"));

  return v6;
}

- (id)createAttachments
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v35 = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DiagnosticExtension zipManager](self, "zipManager"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue( [v4 createZipFor:@"/private/var/mobile/tmp/com.apple.audiomxd/AudioCapture" at:@"/private/var/mobile/Library/Logs/CrashReporter/AudioDiagnosticExtension" withStaleFileThreshold:3]);

  uint64_t v31 = v5;
  if (v5) {
    -[NSMutableArray addObject:](v3, "addObject:", v5, v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DiagnosticExtension zipManager](self, "zipManager", v31));
  uint64_t v7 = objc_claimAutoreleasedReturnValue( [v6 createZipFor:@"/var/mobile/Library/Logs/CrashReporter/Assistant/AVVCCapture" at:@"/private/var/mobile/Library/Logs/CrashReporter/AudioDiagnosticExtension" withStaleFileThreshold:3]);

  v33 = (void *)v7;
  if (v7) {
    -[NSMutableArray addObject:](v3, "addObject:", v7);
  }
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[DiagnosticExtension zipManager](self, "zipManager"));
  uint64_t v9 = objc_claimAutoreleasedReturnValue( [v8 createZipFor:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Audio/Tailspin" at:@"/private/var/mobile/Library/Logs/CrashReporter/AudioDiagnosticExtension" withStaleFileThreshold:3]);

  v34 = (void *)v9;
  if (v9) {
    -[NSMutableArray addObject:](v3, "addObject:", v9);
  }
  __int16 v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  obj = v35;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v37,  v49,  16LL);
  if (v11)
  {
    uint64_t v12 = *(void *)v38;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  *(void *)(*((void *)&v37 + 1) + 8LL * (void)v13)));
        [v14 setDeleteOnAttach:&__kCFBooleanTrue];
        -[NSMutableArray addObject:](v10, "addObject:", v14);
        if (qword_10000C6C0 != -1) {
          dispatch_once(&qword_10000C6C0, &stru_1000081F0);
        }
        v15 = (os_log_s *)*(id *)qword_10000C6C8;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue([v14 displayName]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v14 filesize]);
          [v17 floatValue];
          *(_DWORD *)buf = 136315906;
          v42 = "DiagnosticExtension.mm";
          __int16 v43 = 1024;
          int v44 = 93;
          __int16 v45 = 2114;
          id v46 = v16;
          __int16 v47 = 2048;
          double v48 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d Created attachment. { name=%{public}@, size=%f }",  buf,  0x26u);
        }

        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v37,  v49,  16LL);
    }

    while (v11);
  }

  if (!-[NSMutableArray count](v10, "count"))
  {
    v19 = NSTemporaryDirectory();
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 stringByAppendingString:@"DiagnosticExtensions.audio.empty.txt"]);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v23 = [v22 fileExistsAtPath:v21];

    if ((v23 & 1) == 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([@"No audio capture files found." dataUsingEncoding:4]);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      [v25 createFileAtPath:v21 contents:v24 attributes:0];

      if (qword_10000C6C0 != -1) {
        dispatch_once(&qword_10000C6C0, &stru_1000081F0);
      }
      v26 = (os_log_s *)*(id *)qword_10000C6C8;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v42 = "DiagnosticExtension.mm";
        __int16 v43 = 1024;
        int v44 = 103;
        __int16 v45 = 2114;
        id v46 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d No attachment found. Creating placeholder. { path=%{public}@ }",  buf,  0x1Cu);
      }
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPath:](&OBJC_CLASS___DEAttachmentItem, "attachmentWithPath:", v21));
    -[NSMutableArray addObject:](v10, "addObject:", v27);
  }

  if (qword_10000C6C0 != -1) {
    dispatch_once(&qword_10000C6C0, &stru_1000081F0);
  }
  v28 = (os_log_s *)*(id *)qword_10000C6C8;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    id v29 = -[NSMutableArray count](v10, "count");
    *(_DWORD *)buf = 136315650;
    v42 = "DiagnosticExtension.mm";
    __int16 v43 = 1024;
    int v44 = 109;
    __int16 v45 = 2048;
    id v46 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d Returning attachments. { count=%lu }",  buf,  0x1Cu);
  }

  return v10;
}

- (ZipManager)zipManager
{
  return self->_zipManager;
}

- (void)setZipManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end