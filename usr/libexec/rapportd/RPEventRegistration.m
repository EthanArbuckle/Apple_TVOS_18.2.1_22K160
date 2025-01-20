@interface RPEventRegistration
- (NSDictionary)options;
- (NSString)eventID;
- (id)handler;
- (void)setEventID:(id)a3;
- (void)setHandler:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation RPEventRegistration

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

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end