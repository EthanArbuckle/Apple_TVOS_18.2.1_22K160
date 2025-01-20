@interface NRIKEv2ListenerRegistration
- (id)description;
@end

@implementation NRIKEv2ListenerRegistration

- (id)description
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@/%@/%@",  self->_localEndpoint,  self->_interfaceName,  self->_link);
}

- (void).cxx_destruct
{
}

@end