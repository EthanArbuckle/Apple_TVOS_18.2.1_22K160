@interface NRIKEv2PendingSession
- (id)description;
@end

@implementation NRIKEv2PendingSession

- (id)description
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@",  self->_session);
}

- (void).cxx_destruct
{
}

@end