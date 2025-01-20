@interface NRLinkDirectorMessageState
- (id)description;
@end

@implementation NRLinkDirectorMessageState

- (id)description
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"[%@, %@]",  self->_sequenceNum,  self->_localReceiveID);
}

- (void).cxx_destruct
{
}

@end