@interface boringssl_concrete_boringssl_identity
- (void)dealloc;
@end

@implementation boringssl_concrete_boringssl_identity

- (void)dealloc
{
  private_key = self->private_key;
  if (private_key) {
    CFRelease(private_key);
  }
  self->private_key = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___boringssl_concrete_boringssl_identity;
  -[boringssl_concrete_boringssl_identity dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end