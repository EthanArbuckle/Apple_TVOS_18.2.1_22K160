@interface SYSession
- (NSDictionary)sessionMetadata;
- (OS_dispatch_queue)targetQueue;
- (SYChangeSerializer)serializer;
- (SYSessionDelegate)delegate;
- (int64_t)fullSessionTimeout;
- (int64_t)maxConcurrentMessages;
- (int64_t)perMessageTimeout;
- (void)setDelegate:(id)a3;
- (void)setFullSessionTimeout:(int64_t)a3;
- (void)setMaxConcurrentMessages:(int64_t)a3;
- (void)setPerMessageTimeout:(int64_t)a3;
- (void)setSerializer:(id)a3;
- (void)setSessionMetadata:(id)a3;
- (void)setTargetQueue:(id)a3;
@end

@implementation SYSession

- (int64_t)maxConcurrentMessages
{
  return self->_maxConcurrentMessages;
}

- (void)setMaxConcurrentMessages:(int64_t)a3
{
  self->_maxConcurrentMessages = a3;
}

- (SYSessionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (SYChangeSerializer)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (void)setTargetQueue:(id)a3
{
  self->_targetQueue = (OS_dispatch_queue *)a3;
}

- (int64_t)perMessageTimeout
{
  return self->_perMessageTimeout;
}

- (void)setPerMessageTimeout:(int64_t)a3
{
  self->_perMessageTimeout = a3;
}

- (int64_t)fullSessionTimeout
{
  return self->_fullSessionTimeout;
}

- (void)setFullSessionTimeout:(int64_t)a3
{
  self->_fullSessionTimeout = a3;
}

- (NSDictionary)sessionMetadata
{
  return self->_sessionMetadata;
}

- (void)setSessionMetadata:(id)a3
{
  self->_sessionMetadata = (NSDictionary *)a3;
}

@end