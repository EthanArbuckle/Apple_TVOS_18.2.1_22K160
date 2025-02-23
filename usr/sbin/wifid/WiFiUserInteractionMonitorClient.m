@interface WiFiUserInteractionMonitorClient
- (id)callback;
- (void)context;
- (void)setCallback:(id)a3;
- (void)setContext:(void *)a3;
@end

@implementation WiFiUserInteractionMonitorClient

- (void)context
{
  return self->_context;
}

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end