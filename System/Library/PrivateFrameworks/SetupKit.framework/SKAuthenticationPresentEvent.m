@interface SKAuthenticationPresentEvent
- (NSString)password;
- (SKAuthenticationPresentEvent)initWithPasswordType:(int)a3 password:(id)a4;
- (id)descriptionWithLevel:(int)a3;
- (int)passwordType;
@end

@implementation SKAuthenticationPresentEvent

- (SKAuthenticationPresentEvent)initWithPasswordType:(int)a3 password:(id)a4
{
  id v6 = a4;
  v7 = -[SKEvent initWithEventType:](self, "initWithEventType:", 110LL);
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    password = v7->_password;
    v7->_password = (NSString *)v8;

    v7->_passwordType = a3;
    v10 = v7;
  }

  return v7;
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v4 = 0LL;
  }

  else
  {
    [(id)objc_opt_class() description];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    id v4 = 0LL;
  }

  if (self->_passwordType)
  {
    CUAppendF();
    id v5 = v4;

    id v4 = v5;
  }

  CUAppendF();
  id v6 = (__CFString *)v4;

  v7 = &stru_18A2823D0;
  if (v6) {
    v7 = v6;
  }
  uint64_t v8 = v7;

  return v8;
}

- (NSString)password
{
  return self->_password;
}

- (int)passwordType
{
  return self->_passwordType;
}

- (void).cxx_destruct
{
}

@end