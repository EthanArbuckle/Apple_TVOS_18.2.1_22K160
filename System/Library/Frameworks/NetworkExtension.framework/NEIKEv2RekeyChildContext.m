@interface NEIKEv2RekeyChildContext
- (id)description;
@end

@implementation NEIKEv2RekeyChildContext

- (id)description
{
  id v3 = objc_alloc(NSString);
  if (self) {
    uint64_t childID = self->_childID;
  }
  else {
    uint64_t childID = 0LL;
  }
  return (id)objc_msgSend( v3,  "initWithFormat:",  @"rekey child context with child id %u",  childID);
}

@end