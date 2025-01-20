@interface SFPublicKey_Ivars
- (void)dealloc;
@end

@implementation SFPublicKey_Ivars

- (void)dealloc
{
  secKey = self->secKey;
  if (secKey) {
    CFRelease(secKey);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFPublicKey_Ivars;
  -[SFPublicKey_Ivars dealloc](&v4, sel_dealloc);
}

@end