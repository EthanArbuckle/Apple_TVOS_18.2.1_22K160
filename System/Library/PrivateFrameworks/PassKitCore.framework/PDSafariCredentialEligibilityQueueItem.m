@interface PDSafariCredentialEligibilityQueueItem
- (NSArray)credentials;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)setCredentials:(id)a3;
@end

@implementation PDSafariCredentialEligibilityQueueItem

- (NSArray)credentials
{
  return self->_credentials;
}

- (void)setCredentials:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end