@interface SMTAttachmentsDownload
+ (void)initialize;
- (SMTAttachmentsDownload)initWithQueue:(id)a3;
- (void)cancel;
- (void)downloadAttachments:(id)a3 completion:(id)a4;
@end

@implementation SMTAttachmentsDownload

- (SMTAttachmentsDownload)initWithQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SMTAttachmentsDownload;
  v6 = -[SMTAttachmentsDownload init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
    [v8 setAllowsCellularAccess:0];
    [v8 setNetworkServiceType:3];
    v9 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    -[NSOperationQueue setUnderlyingQueue:](v9, "setUnderlyingQueue:", v7->_queue);
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v8,  v7,  v9));
    session = v7->_session;
    v7->_session = (NSURLSession *)v10;
  }

  return v7;
}

- (void)cancel
{
  session = self->_session;
  self->_session = 0LL;
}

- (void)downloadAttachments:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004DEC;
  block[3] = &unk_1000106A0;
  objc_super v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void).cxx_destruct
{
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SMTAttachmentsDownload, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.speech.speechmodeltraining", "SMTAttachmentsDownload");
    v3 = (void *)qword_100016010;
    qword_100016010 = (uint64_t)v2;
  }

@end