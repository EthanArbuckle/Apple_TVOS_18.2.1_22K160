@interface SecConcrete_sec_trust
- (SecConcrete_sec_trust)initWithTrust:(__SecTrust *)a3;
- (void)dealloc;
@end

@implementation SecConcrete_sec_trust

- (SecConcrete_sec_trust)initWithTrust:(__SecTrust *)a3
{
  v3 = (SecConcrete_sec_trust *)a3;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___SecConcrete_sec_trust;
    self = -[SecConcrete_sec_trust init](&v6, sel_init);
    if (self)
    {
      v4 = self;
      CFRetain(v3);
      v4->trust = (__SecTrust *)v3;
      self = v4;
      v3 = self;
    }

    else
    {
      v3 = 0LL;
    }
  }

  return v3;
}

- (void)dealloc
{
  trust = self->trust;
  if (trust)
  {
    CFRelease(trust);
    self->trust = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SecConcrete_sec_trust;
  -[SecConcrete_sec_trust dealloc](&v4, sel_dealloc);
}

@end