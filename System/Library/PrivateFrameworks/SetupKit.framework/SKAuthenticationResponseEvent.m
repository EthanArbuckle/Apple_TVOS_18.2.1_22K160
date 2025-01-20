@interface SKAuthenticationResponseEvent
- (NSString)password;
- (SKAuthenticationResponseEvent)initWithPassword:(id)a3;
- (id)descriptionWithLevel:(int)a3;
@end

@implementation SKAuthenticationResponseEvent

- (SKAuthenticationResponseEvent)initWithPassword:(id)a3
{
  id v4 = a3;
  v5 = -[SKEvent initWithEventType:](self, "initWithEventType:", 130LL);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    password = v5->_password;
    v5->_password = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v3 = 0LL;
  }

  else
  {
    [(id)objc_opt_class() description];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    id v3 = 0LL;
  }

  CUAppendF();
  id v4 = (__CFString *)v3;

  v5 = &stru_18A2823D0;
  if (v4) {
    v5 = v4;
  }
  uint64_t v6 = v5;

  return v6;
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
}

@end