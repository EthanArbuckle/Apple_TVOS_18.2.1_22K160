@interface SKRequestEntry
- (NSDictionary)options;
- (NSString)requestID;
- (OS_dispatch_source)timer;
- (id)responseHandler;
- (unint64_t)sendTicks;
- (void)setOptions:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setSendTicks:(unint64_t)a3;
- (void)setTimer:(id)a3;
@end

@implementation SKRequestEntry

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
}

- (unint64_t)sendTicks
{
  return self->_sendTicks;
}

- (void)setSendTicks:(unint64_t)a3
{
  self->_sendTicks = a3;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end