@interface SecConcrete_sec_certificate
- (SecConcrete_sec_certificate)initWithCertificate:(__SecCertificate *)a3;
- (void)dealloc;
@end

@implementation SecConcrete_sec_certificate

- (SecConcrete_sec_certificate)initWithCertificate:(__SecCertificate *)a3
{
  v3 = (SecConcrete_sec_certificate *)a3;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___SecConcrete_sec_certificate;
    self = -[SecConcrete_sec_certificate init](&v6, sel_init);
    if (self)
    {
      v4 = self;
      CFRetain(v3);
      v4->certificate = (__SecCertificate *)v3;
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
  certificate = self->certificate;
  if (certificate)
  {
    CFRelease(certificate);
    self->certificate = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SecConcrete_sec_certificate;
  -[SecConcrete_sec_certificate dealloc](&v4, sel_dealloc);
}

@end