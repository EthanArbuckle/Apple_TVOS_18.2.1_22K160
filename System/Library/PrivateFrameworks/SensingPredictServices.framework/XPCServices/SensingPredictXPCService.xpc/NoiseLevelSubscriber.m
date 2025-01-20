@interface NoiseLevelSubscriber
- (id)callback;
- (id)client;
- (void)setCallback:(id)a3;
- (void)setClient:(id)a3;
@end

@implementation NoiseLevelSubscriber

- (id)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
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