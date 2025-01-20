@interface NRDDTLSStack
- (id)description;
@end

@implementation NRDDTLSStack

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v4 = "client";
  if (self)
  {
    unint64_t identifier = self->_identifier;
    if (self->_server) {
      v4 = "server";
    }
  }

  else
  {
    unint64_t identifier = 0LL;
  }

  return -[NSString initWithFormat:](v3, "initWithFormat:", @"[DTLS%llu %s]", identifier, v4);
}

- (void).cxx_destruct
{
}

@end