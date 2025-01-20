@interface DEMessagesExtension
- (id)attachmentsForParameters:(id)a3;
@end

@implementation DEMessagesExtension

- (id)attachmentsForParameters:(id)a3
{
  id v3 = a3;
  v42[0] = @"collectionFlags";
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 1023LL));
  v43[0] = v4;
  v43[1] = @"iMessage Log Dump";
  v42[1] = @"title";
  v42[2] = @"displayFlags";
  v43[2] = &off_100004200;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  3LL));

  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  v38 = sub_100003A44;
  v39 = sub_100003A54;
  id v40 = 0LL;
  v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472LL;
  v31 = sub_100003A5C;
  v32 = &unk_100004130;
  v34 = &v35;
  v6 = dispatch_semaphore_create(0LL);
  v33 = v6;
  v7 = objc_retainBlock(&v29);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  int v10 = DLCCollectLogsWithCompletionHandler(@"Messages", v5, v7, v9);

  if (!v10)
  {
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DELogging fwHandle](&OBJC_CLASS___DELogging, "fwHandle", v29, v30, v31, v32));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100003B34(v12, v20, v21, v22, v23, v24, v25, v26);
    }
    goto LABEL_7;
  }

  dispatch_time_t v11 = dispatch_time(0LL, 120000000000LL);
  if (dispatch_semaphore_wait(v6, v11))
  {
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DELogging fwHandle](&OBJC_CLASS___DELogging, "fwHandle", v29, v30, v31, v32));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100003B00(v12, v13, v14, v15, v16, v17, v18, v19);
    }
LABEL_7:
    v27 = &__NSArray0__struct;
    goto LABEL_8;
  }

  if (!v36[5])
  {
    v27 = &__NSArray0__struct;
    goto LABEL_9;
  }

  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  v29,  v30,  v31,  v32));
  v41 = v12;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v41, 1LL));
LABEL_8:

LABEL_9:
  _Block_object_dispose(&v35, 8);

  return v27;
}

@end