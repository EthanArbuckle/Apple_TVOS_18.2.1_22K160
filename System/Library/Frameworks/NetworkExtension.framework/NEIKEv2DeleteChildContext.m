@interface NEIKEv2DeleteChildContext
- (id)description;
@end

@implementation NEIKEv2DeleteChildContext

- (id)description
{
  id v3 = objc_alloc(NSString);
  if (self)
  {
    uint64_t childID = self->_childID;
    reasonError = self->_reasonError;
  }

  else
  {
    uint64_t childID = 0LL;
    reasonError = 0LL;
  }

  return (id)[v3 initWithFormat:@"delete child with id %u, reason %@", childID, reasonError];
}

- (void).cxx_destruct
{
}

@end