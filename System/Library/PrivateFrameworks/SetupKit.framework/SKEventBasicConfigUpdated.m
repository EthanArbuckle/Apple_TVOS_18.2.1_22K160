@interface SKEventBasicConfigUpdated
- (NSDictionary)basicConfig;
- (SKEventBasicConfigUpdated)initWithBasicConfig:(id)a3;
- (id)descriptionWithLevel:(int)a3;
@end

@implementation SKEventBasicConfigUpdated

- (SKEventBasicConfigUpdated)initWithBasicConfig:(id)a3
{
  id v4 = a3;
  v5 = -[SKEvent initWithEventType:](self, "initWithEventType:", 300LL);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    basicConfig = v5->_basicConfig;
    v5->_basicConfig = (NSDictionary *)v6;

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

  CUPrintNSObjectOneLine();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CUAppendF();
  id v4 = (__CFString *)v3;

  v5 = &stru_18A2823D0;
  if (v4) {
    v5 = v4;
  }
  uint64_t v6 = v5;

  return v6;
}

- (NSDictionary)basicConfig
{
  return self->_basicConfig;
}

- (void).cxx_destruct
{
}

@end