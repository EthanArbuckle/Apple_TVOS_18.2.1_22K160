@interface NSPPrivateAccessTokenRequest
- (void)dealloc;
@end

@implementation NSPPrivateAccessTokenRequest

- (void)dealloc
{
  if (self)
  {
    ephemeralPrivateKey = self->_ephemeralPrivateKey;
    if (ephemeralPrivateKey)
    {
      CFRelease(ephemeralPrivateKey);
      self->_ephemeralPrivateKey = 0LL;
    }

    hpkeContext = self->_hpkeContext;
    if (hpkeContext)
    {
      free(hpkeContext);
      self->_hpkeContext = 0LL;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSPPrivateAccessTokenRequest;
  -[NSPPrivateAccessTokenRequest dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
}

@end