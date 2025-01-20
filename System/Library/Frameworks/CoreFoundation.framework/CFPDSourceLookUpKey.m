@interface CFPDSourceLookUpKey
- (BOOL)isEqual:(id)a3;
- (void)dealloc;
@end

@implementation CFPDSourceLookUpKey

- (BOOL)isEqual:(id)a3
{
  return _CFPrefsEqualKeyOrSource(self, a3);
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uncanonicalizedPath = self->uncanonicalizedPath;
  if (uncanonicalizedPath) {
    CFRelease(uncanonicalizedPath);
  }
  cloudPath = self->cloudPath;
  if (cloudPath) {
    CFRelease(cloudPath);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CFPDSourceLookUpKey;
  -[CFPDSourceLookUpKey dealloc](&v5, sel_dealloc);
}

@end