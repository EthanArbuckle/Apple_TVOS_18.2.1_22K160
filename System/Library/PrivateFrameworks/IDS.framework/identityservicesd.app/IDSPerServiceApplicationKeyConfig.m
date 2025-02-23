@interface IDSPerServiceApplicationKeyConfig
- (BOOL)isRegistered;
- (IDSPerServiceApplicationKeyConfig)init;
- (__SecKey)identity;
- (void)dealloc;
- (void)setIdentity:(__SecKey *)a3;
- (void)setIsRegistered:(BOOL)a3;
@end

@implementation IDSPerServiceApplicationKeyConfig

- (IDSPerServiceApplicationKeyConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSPerServiceApplicationKeyConfig;
  result = -[IDSPerServiceApplicationKeyConfig init](&v3, "init");
  if (result)
  {
    result->_identity = 0LL;
    result->_isRegistered = 0;
  }

  return result;
}

- (void)setIdentity:(__SecKey *)a3
{
  identity = self->_identity;
  if (a3)
  {
    if (identity)
    {
      CFRelease(identity);
      self->_identity = 0LL;
    }

    v6 = (__SecKey *)CFRetain(a3);
  }

  else
  {
    if (!identity) {
      return;
    }
    CFRelease(identity);
    v6 = 0LL;
  }

  self->_identity = v6;
}

- (void)dealloc
{
  identity = self->_identity;
  if (identity)
  {
    CFRelease(identity);
    self->_identity = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSPerServiceApplicationKeyConfig;
  -[IDSPerServiceApplicationKeyConfig dealloc](&v4, "dealloc");
}

- (__SecKey)identity
{
  return self->_identity;
}

- (BOOL)isRegistered
{
  return self->_isRegistered;
}

- (void)setIsRegistered:(BOOL)a3
{
  self->_isRegistered = a3;
}

@end