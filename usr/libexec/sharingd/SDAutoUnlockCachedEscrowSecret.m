@interface SDAutoUnlockCachedEscrowSecret
- (BOOL)isValid;
- (NSData)escrowSecret;
- (NSDate)expireDate;
- (SDAutoUnlockCachedEscrowSecret)initWithEscrowSecret:(id)a3;
- (id)getEscrowSecretCopyIfValid;
- (void)setEscrowSecret:(id)a3;
- (void)setExpireDate:(id)a3;
@end

@implementation SDAutoUnlockCachedEscrowSecret

- (SDAutoUnlockCachedEscrowSecret)initWithEscrowSecret:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SDAutoUnlockCachedEscrowSecret;
  v5 = -[SDAutoUnlockCachedEscrowSecret init](&v13, "init");
  v6 = v5;
  if (v5)
  {
    -[SDAutoUnlockCachedEscrowSecret setEscrowSecret:](v5, "setEscrowSecret:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingTimeInterval:3600.0]);
    -[SDAutoUnlockCachedEscrowSecret setExpireDate:](v6, "setExpireDate:", v8);

    dispatch_time_t v9 = dispatch_time(0LL, 3600000000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000AE33C;
    block[3] = &unk_1005CB2F8;
    v12 = v6;
    dispatch_after(v9, &_dispatch_main_q, block);
  }

  return v6;
}

- (BOOL)isValid
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockCachedEscrowSecret escrowSecret](self, "escrowSecret"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockCachedEscrowSecret expireDate](self, "expireDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 laterDate:v5]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockCachedEscrowSecret expireDate](self, "expireDate"));
    BOOL v8 = v6 == v7;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)getEscrowSecretCopyIfValid
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockCachedEscrowSecret escrowSecret](self, "escrowSecret"));
  id v4 = [v3 copy];

  unsigned int v5 = -[SDAutoUnlockCachedEscrowSecret isValid](self, "isValid");
  id v6 = 0LL;
  if (v5 && v4) {
    id v6 = v4;
  }

  return v6;
}

- (NSData)escrowSecret
{
  return (NSData *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setEscrowSecret:(id)a3
{
}

- (NSDate)expireDate
{
  return self->_expireDate;
}

- (void)setExpireDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end