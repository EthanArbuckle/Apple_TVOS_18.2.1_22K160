@interface BDRegistrationStatus
- (BOOL)isEqual:(id)a3;
- (BOOL)roaming;
- (BOOL)service;
- (id)description;
- (void)setRoaming:(BOOL)a3;
- (void)setService:(BOOL)a3;
@end

@implementation BDRegistrationStatus

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    unsigned int v7 = -[BDRegistrationStatus service](self, "service");
    if (v7 == [v6 service])
    {
      unsigned int v9 = -[BDRegistrationStatus roaming](self, "roaming");
      unsigned int v8 = v9 ^ [v6 roaming] ^ 1;
    }

    else
    {
      LOBYTE(v8) = 0;
    }
  }

  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<service:%d roaming:%d>",  -[BDRegistrationStatus service](self, "service"),  -[BDRegistrationStatus roaming](self, "roaming"));
}

- (BOOL)service
{
  return self->_service;
}

- (void)setService:(BOOL)a3
{
  self->_service = a3;
}

- (BOOL)roaming
{
  return self->_roaming;
}

- (void)setRoaming:(BOOL)a3
{
  self->_roaming = a3;
}

@end