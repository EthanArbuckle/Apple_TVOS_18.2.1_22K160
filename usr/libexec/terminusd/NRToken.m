@interface NRToken
- (id)description;
@end

@implementation NRToken

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t type = self->_type;
  if ((_DWORD)type == 1)
  {
    v5 = @"ProxyUsage";
  }

  else if (self->_type)
  {
    v5 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"Unknown(%u)", type);
  }

  else
  {
    v5 = @"Invalid";
  }

  uint64_t action = self->_action;
  if ((action - 50) >= 3) {
    v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Unknown(%u)",  action);
  }
  else {
    v7 = off_1001ADD48[(action - 50)];
  }
  LogString = (void *)_NRKeyCreateLogString(self->_tokenValue);
  v9 = -[NSString initWithFormat:](v3, "initWithFormat:", @"NRToken[%@, %@, %@]", v5, v7, LogString);

  return v9;
}

- (void).cxx_destruct
{
}

@end