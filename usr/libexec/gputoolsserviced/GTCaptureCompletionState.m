@interface GTCaptureCompletionState
- (NSError)error;
- (NSURL)archiveURL;
- (void)setArchiveURL:(id)a3;
- (void)setError:(id)a3;
@end

@implementation GTCaptureCompletionState

- (NSURL)archiveURL
{
  return self->_archiveURL;
}

- (void)setArchiveURL:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end