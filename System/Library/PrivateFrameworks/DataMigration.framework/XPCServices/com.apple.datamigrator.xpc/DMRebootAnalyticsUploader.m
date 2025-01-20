@interface DMRebootAnalyticsUploader
+ (id)_createSubmissionClientWithErrorHandler:(id)a3;
+ (id)createRebootAnalyticsUploaderIfAppropriateWithEnvironment:(id)a3;
- (OSASubmissionClient)submissionClient;
- (id)_initWithSubmissionClient:(id)a3;
- (id)submissionBlock;
- (void)setSubmissionBlock:(id)a3;
- (void)setSubmissionClient:(id)a3;
- (void)start;
- (void)waitForCompletionWithTimeoutTimeInterval:(double)a3;
@end

@implementation DMRebootAnalyticsUploader

+ (id)createRebootAnalyticsUploaderIfAppropriateWithEnvironment:(id)a3
{
  if ([a3 migrationRebootCount] == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([a1 _createSubmissionClientWithErrorHandler:&stru_1000206F8]);
    id v5 = -[DMRebootAnalyticsUploader _initWithSubmissionClient:]( objc_alloc(&OBJC_CLASS___DMRebootAnalyticsUploader),  "_initWithSubmissionClient:",  v4);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)_createSubmissionClientWithErrorHandler:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x2050000000LL;
  v4 = (void *)qword_10002CB70;
  uint64_t v12 = qword_10002CB70;
  if (!qword_10002CB70)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100005208;
    v8[3] = &unk_100020748;
    v8[4] = &v9;
    sub_100005208((uint64_t)v8);
    v4 = (void *)v10[3];
  }

  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  id v6 = [[v5 alloc] initWithErrorHandler:v3];

  return v6;
}

- (id)_initWithSubmissionClient:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DMRebootAnalyticsUploader;
  id v5 = -[DMRebootAnalyticsUploader init](&v8, "init");
  id v6 = v5;
  if (v5) {
    -[DMRebootAnalyticsUploader setSubmissionClient:](v5, "setSubmissionClient:", v4);
  }

  return v6;
}

- (void)start
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000050A4;
  block[3] = &unk_100020720;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[DMRebootAnalyticsUploader submissionClient](self, "submissionClient"));
  id v3 = v9;
  dispatch_block_t v4 = dispatch_block_create((dispatch_block_flags_t)0LL, block);
  -[DMRebootAnalyticsUploader setSubmissionBlock:](self, "setSubmissionBlock:", v4);

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMRebootAnalyticsUploader submissionBlock](self, "submissionBlock"));
  dispatch_async(v6, v7);
}

- (void)waitForCompletionWithTimeoutTimeInterval:(double)a3
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMRebootAnalyticsUploader submissionBlock](self, "submissionBlock"));
  dispatch_time_t v7 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
  uint64_t v8 = dispatch_block_wait(v6, v7);

  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8 != 0));
  _DMLogFunc(v3, 7LL);
}

- (OSASubmissionClient)submissionClient
{
  return (OSASubmissionClient *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setSubmissionClient:(id)a3
{
}

- (id)submissionBlock
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSubmissionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end