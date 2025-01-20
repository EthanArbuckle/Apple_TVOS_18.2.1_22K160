@interface TransparencyTrustedKeyStore
- (NSDictionary)trustedKeys;
- (TransparencySignatureVerifier)signatureVerifier;
- (TransparencyTrustedKeyStore)initWithTrustedKeys:(id)a3;
- (void)setSignatureVerifier:(id)a3;
- (void)setTrustedKeys:(id)a3;
@end

@implementation TransparencyTrustedKeyStore

- (TransparencyTrustedKeyStore)initWithTrustedKeys:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TransparencyTrustedKeyStore;
  v5 = -[TransparencyTrustedKeyStore init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[TransparencyTrustedKeyStore setTrustedKeys:](v5, "setTrustedKeys:", v4);
    v7 = -[TransparencySignatureVerifier initWithTrustedKeys:]( objc_alloc(&OBJC_CLASS___TransparencySignatureVerifier),  "initWithTrustedKeys:",  v4);
    -[TransparencyTrustedKeyStore setSignatureVerifier:](v6, "setSignatureVerifier:", v7);
  }

  return v6;
}

- (TransparencySignatureVerifier)signatureVerifier
{
  return (TransparencySignatureVerifier *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setSignatureVerifier:(id)a3
{
}

- (NSDictionary)trustedKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTrustedKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end