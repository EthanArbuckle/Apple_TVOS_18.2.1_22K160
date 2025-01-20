@interface WAMessageAWDSubmitter
- (WAMessageAWDSubmissionDelegate)submissionDelegate;
- (id)submitMessage:(id)a3;
- (void)setSubmissionDelegate:(id)a3;
@end

@implementation WAMessageAWDSubmitter

- (id)submitMessage:(id)a3
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Abstract. You must override %@ in a subclass",  v4);

  return 0LL;
}

- (WAMessageAWDSubmissionDelegate)submissionDelegate
{
  return (WAMessageAWDSubmissionDelegate *)objc_loadWeakRetained((id *)&self->_submissionDelegate);
}

- (void)setSubmissionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end