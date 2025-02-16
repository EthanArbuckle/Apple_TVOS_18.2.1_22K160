@interface SKSendEntry
- (NSData)eventData;
- (NSDictionary)options;
- (NSDictionary)request;
- (NSNumber)xidObj;
- (NSString)eventID;
- (NSString)requestID;
- (OS_dispatch_source)timer;
- (id)completion;
- (id)responseHandler;
- (unint64_t)queueTicks;
- (unsigned)xid;
- (void)setCompletion:(id)a3;
- (void)setEventData:(id)a3;
- (void)setEventID:(id)a3;
- (void)setOptions:(id)a3;
- (void)setQueueTicks:(unint64_t)a3;
- (void)setRequest:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setTimer:(id)a3;
- (void)setXid:(unsigned int)a3;
- (void)setXidObj:(id)a3;
@end

@implementation SKSendEntry

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSData)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
}

- (NSString)eventID
{
  return self->_eventID;
}

- (void)setEventID:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (unint64_t)queueTicks
{
  return self->_queueTicks;
}

- (void)setQueueTicks:(unint64_t)a3
{
  self->_queueTicks = a3;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (NSDictionary)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (unsigned)xid
{
  return self->_xid;
}

- (void)setXid:(unsigned int)a3
{
  self->_xid = a3;
}

- (NSNumber)xidObj
{
  return self->_xidObj;
}

- (void)setXidObj:(id)a3
{
}

- (void).cxx_destruct
{
}

@end