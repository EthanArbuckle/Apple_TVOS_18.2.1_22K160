@interface RPRequestRegistration
- (NSDictionary)options;
- (NSString)requestID;
- (id)cnxHandler;
- (id)handler;
- (void)setCnxHandler:(id)a3;
- (void)setHandler:(id)a3;
- (void)setOptions:(id)a3;
- (void)setRequestID:(id)a3;
@end

@implementation RPRequestRegistration

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (id)cnxHandler
{
  return self->_cnxHandler;
}

- (void)setCnxHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end