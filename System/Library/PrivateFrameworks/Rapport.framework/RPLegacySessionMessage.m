@interface RPLegacySessionMessage
- (NSDictionary)message;
- (NSDictionary)options;
- (NSString)requestID;
- (id)responseHandler;
- (void)setMessage:(id)a3;
- (void)setOptions:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation RPLegacySessionMessage

- (NSDictionary)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

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

- (void).cxx_destruct
{
}

@end