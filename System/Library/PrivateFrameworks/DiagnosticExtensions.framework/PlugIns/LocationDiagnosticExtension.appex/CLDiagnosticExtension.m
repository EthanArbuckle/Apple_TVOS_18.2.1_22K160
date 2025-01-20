@interface CLDiagnosticExtension
- (id)attachmentsForParameters:(id)a3;
@end

@implementation CLDiagnosticExtension

- (id)attachmentsForParameters:(id)a3
{
  id v3 = a3;
  v4 = os_log_create("com.apple.locationd.Utility", "Core");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#diagnosticExtension attachmentsForParameters,called with parameters %@",  buf,  0xCu);
  }

  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Logs/gpsd"));
  -[NSMutableArray addObject:](v5, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Logs/raven"));
  -[NSMutableArray addObject:](v5, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Logs/vision"));
  -[NSMutableArray addObject:](v5, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Logs/locationd/locctl"));
  -[NSMutableArray addObject:](v5, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Logs/locationd/MslLogger"));
  -[NSMutableArray addObject:](v5, "addObject:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Logs/locationd/routesmoother"));
  -[NSMutableArray addObject:](v5, "addObject:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Logs/locationd/trackrun"));
  -[NSMutableArray addObject:](v5, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Logs/locationd/fence"));
  -[NSMutableArray addObject:](v5, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Logs/CrashReporter/com.apple.locationd/fence"));
  -[NSMutableArray addObject:](v5, "addObject:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Logs/CrashReporter/gpsd"));
  -[NSMutableArray addObject:](v5, "addObject:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Logs/CrashReporter/raven"));
  -[NSMutableArray addObject:](v5, "addObject:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Logs/CrashReporter/vision"));
  -[NSMutableArray addObject:](v5, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Logs/CrashReporter/com.apple.locationd/locctl"));
  -[NSMutableArray addObject:](v5, "addObject:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Logs/CrashReporter/com.apple.locationd/routesmoother"));
  -[NSMutableArray addObject:](v5, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Logs/CrashReporter/com.apple.locationd/trackrun"));
  -[NSMutableArray addObject:](v5, "addObject:", v20);

  dispatch_semaphore_t v21 = dispatch_semaphore_create(0LL);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v30 = _NSConcreteStackBlock;
  uint64_t v31 = 3221225472LL;
  v32 = sub_1000037BC;
  v33 = &unk_1000040F8;
  v24 = v4;
  v34 = v24;
  v25 = v21;
  v35 = v25;
  dispatch_async(v23, &v30);

  dispatch_time_t v26 = dispatch_time(0LL, 10000000000LL);
  if (dispatch_semaphore_wait(v25, v26) && os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "#diagnosticExtension CLGetPipelinedCache timeout",  buf,  2u);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Logs/pipelined",  v30,  v31,  v32,  v33));
  -[NSMutableArray addObject:](v5, "addObject:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  @"/var/mobile/Library/Logs/CrashReporter/pipelined"));
  -[NSMutableArray addObject:](v5, "addObject:", v28);

  return v5;
}

@end