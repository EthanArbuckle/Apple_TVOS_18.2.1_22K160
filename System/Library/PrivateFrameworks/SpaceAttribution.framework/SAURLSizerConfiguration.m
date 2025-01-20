@interface SAURLSizerConfiguration
+ (id)newWithReplyController:(id)a3 urls:(id)a4;
- (NSArray)urls;
- (NSUUID)sizerID;
- (SAReplyProtocol)replyController;
- (SAURLSizerConfiguration)initWithReplayController:(id)a3 urls:(id)a4;
- (SAURLSizerResults)results;
- (void)callHandlerWithResults:(id)a3 error:(id)a4;
- (void)setReplyController:(id)a3;
- (void)setResults:(id)a3;
- (void)setSizerID:(id)a3;
- (void)setUrls:(id)a3;
@end

@implementation SAURLSizerConfiguration

- (SAURLSizerConfiguration)initWithReplayController:(id)a3 urls:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SAURLSizerConfiguration;
  v9 = -[SAURLSizerConfiguration init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_replyController, a3);
    objc_storeStrong((id *)&v10->_urls, a4);
  }

  return v10;
}

+ (id)newWithReplyController:(id)a3 urls:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithReplayController:v7 urls:v6];

  return v8;
}

- (void)callHandlerWithResults:(id)a3 error:(id)a4
{
  id v6 = (SAURLSizerResults *)a3;
  if (self->_replyController)
  {
    id v7 = a4;
    uint64_t v8 = SALog(v7);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000327AC(v9);
    }

    replyController = self->_replyController;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10001F49C;
    v12[3] = &unk_10004CF20;
    v12[4] = self;
    -[SAReplyProtocol callURLSizerHandlerWithResults:error:withHandlerResultsBlock:]( replyController,  "callURLSizerHandlerWithResults:error:withHandlerResultsBlock:",  v6,  v7,  v12);
  }

  results = self->_results;
  self->_results = v6;
}

- (NSArray)urls
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setUrls:(id)a3
{
}

- (SAReplyProtocol)replyController
{
  return (SAReplyProtocol *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setReplyController:(id)a3
{
}

- (SAURLSizerResults)results
{
  return (SAURLSizerResults *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setResults:(id)a3
{
}

- (NSUUID)sizerID
{
  return (NSUUID *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setSizerID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end