@interface MISUserTrustSignature
- (MISUserTrustSignature)initWithSignature:(id)a3;
- (NSData)signature;
@end

@implementation MISUserTrustSignature

- (MISUserTrustSignature)initWithSignature:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MISUserTrustSignature;
  v6 = -[MISUserTrustSignature init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->signature, a3);
  }

  return v7;
}

- (NSData)signature
{
  return self->signature;
}

- (void).cxx_destruct
{
}

@end