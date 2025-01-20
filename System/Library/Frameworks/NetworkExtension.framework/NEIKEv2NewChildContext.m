@interface NEIKEv2NewChildContext
- (id)description;
@end

@implementation NEIKEv2NewChildContext

- (id)description
{
  id v3 = objc_alloc(NSString);
  if (self)
  {
    childSA = self->_childSA;
    if (childSA) {
      childSA = (NEIKEv2ChildSA *)childSA->_childID;
    }
  }

  else
  {
    childSA = 0LL;
  }

  return (id)objc_msgSend( v3,  "initWithFormat:",  @"new child request with id %u",  childSA);
}

- (void).cxx_destruct
{
}

@end