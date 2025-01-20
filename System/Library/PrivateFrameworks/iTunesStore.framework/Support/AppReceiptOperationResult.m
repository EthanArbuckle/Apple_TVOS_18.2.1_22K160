@interface AppReceiptOperationResult
- (LSApplicationProxy)soonestExpiring;
- (NSDate)soonestExpirationDate;
- (NSError)resultingError;
- (NSSet)expiring;
- (NSSet)refreshed;
- (NSSet)revoked;
- (void)addExpiring:(id)a3 expirationDate:(id)a4;
- (void)addRefreshed:(id)a3;
- (void)addRevoked:(id)a3;
- (void)dealloc;
- (void)setResultingError:(id)a3;
- (void)setSoonestExpirationDate:(id)a3;
- (void)setSoonestExpiring:(id)a3;
@end

@implementation AppReceiptOperationResult

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AppReceiptOperationResult;
  -[AppReceiptOperationResult dealloc](&v3, "dealloc");
}

- (void)addExpiring:(id)a3 expirationDate:(id)a4
{
  if (a3)
  {
    expiring = self->_expiring;
    if (!expiring)
    {
      expiring = -[NSMutableSet initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithCapacity:", 5LL);
      self->_expiring = expiring;
    }

    -[NSMutableSet addObject:](expiring, "addObject:", a3);
    -[NSDate timeIntervalSinceNow](self->_soonestExpirationDate, "timeIntervalSinceNow");
    double v9 = v8;
    [a4 timeIntervalSinceNow];
    if ((int)v10 >= 1 && (!self->_soonestExpirationDate || (int)v9 > (int)v10))
    {
      -[AppReceiptOperationResult setSoonestExpirationDate:](self, "setSoonestExpirationDate:", a4);
      -[AppReceiptOperationResult setSoonestExpiring:](self, "setSoonestExpiring:", a3);
    }
  }

- (void)addRevoked:(id)a3
{
  if (a3)
  {
    revoked = self->_revoked;
    if (!revoked)
    {
      revoked = -[NSMutableSet initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithCapacity:", 5LL);
      self->_revoked = revoked;
    }

    -[NSMutableSet addObject:](revoked, "addObject:", a3);
  }

- (void)addRefreshed:(id)a3
{
  if (a3)
  {
    refreshed = self->_refreshed;
    if (!refreshed)
    {
      refreshed = -[NSMutableSet initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithCapacity:", 5LL);
      self->_refreshed = refreshed;
    }

    -[NSMutableSet addObject:](refreshed, "addObject:", a3);
  }

- (NSSet)expiring
{
  return &self->_expiring->super;
}

- (NSSet)refreshed
{
  return &self->_refreshed->super;
}

- (NSError)resultingError
{
  return self->_error;
}

- (void)setResultingError:(id)a3
{
}

- (NSSet)revoked
{
  return &self->_revoked->super;
}

- (LSApplicationProxy)soonestExpiring
{
  return self->_soonestExpiring;
}

- (void)setSoonestExpiring:(id)a3
{
}

- (NSDate)soonestExpirationDate
{
  return self->_soonestExpirationDate;
}

- (void)setSoonestExpirationDate:(id)a3
{
}

@end