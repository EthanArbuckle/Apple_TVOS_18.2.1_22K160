@interface DEFaceTimeExtension
- (id)attachmentsForParameters:(id)a3;
@end

@implementation DEFaceTimeExtension

- (id)attachmentsForParameters:(id)a3
{
  id v3 = a3;
  v27[0] = @"collectionFlags";
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 223LL));
  v28[0] = v4;
  v28[1] = @"FaceTime Log Dump";
  v27[1] = @"title";
  v27[2] = @"displayFlags";
  v28[2] = &off_1000041F8;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  3LL));

  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = sub_100003AE8;
  v24 = sub_100003AF8;
  id v25 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100003B00;
  v17[3] = &unk_100004128;
  v19 = &v20;
  v6 = dispatch_semaphore_create(0LL);
  v18 = v6;
  v7 = objc_retainBlock(v17);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  int v10 = DLCCollectLogsWithCompletionHandler(@"FaceTime", v5, v7, v9);

  if (!v10)
  {
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DELogging fwHandle](&OBJC_CLASS___DELogging, "fwHandle"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      v13 = "FaceTime logging failed";
      goto LABEL_7;
    }

@end