@interface CSDPulledCallContext
- (CSDProviderCall)call;
- (id)completionHandler;
- (void)setCall:(id)a3;
- (void)setCompletionHandler:(id)a3;
@end

@implementation CSDPulledCallContext

- (CSDProviderCall)call
{
  return self->_call;
}

- (void)setCall:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end