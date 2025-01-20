@interface B2PAutoHealGetResponse
- (BOOL)parseResponse:(id)a3;
- (id)description;
- (unsigned)enable;
- (unsigned)persistent;
@end

@implementation B2PAutoHealGetResponse

- (BOOL)parseResponse:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 length];
  if (v5 >= 2)
  {
    v6 = (unsigned __int8 *)[v4 bytes];
    self->_enable = *v6;
    self->_persistent = v6[1];
  }

  return v5 > 1;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___B2PAutoHealGetResponse;
  -[B2PResponse description](&v10, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@\n", v4];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_enable) {
    v6 = "yes";
  }
  else {
    v6 = "no";
  }
  objc_msgSend(v5, "appendFormat:", @"\tEnable: %s\n", v6);
  if (self->_persistent) {
    v7 = "yes";
  }
  else {
    v7 = "no";
  }
  objc_msgSend(v5, "appendFormat:", @"\tPersistent: %s\n", v7);
  [NSString stringWithString:v5];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unsigned)enable
{
  return self->_enable;
}

- (unsigned)persistent
{
  return self->_persistent;
}

@end