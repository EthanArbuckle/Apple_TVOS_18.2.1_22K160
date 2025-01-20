@interface _SFECPublicKey(TPPublicKey)
- (BOOL)checkSignature:()TPPublicKey matchesData:;
@end

@implementation _SFECPublicKey(TPPublicKey)

- (BOOL)checkSignature:()TPPublicKey matchesData:
{
  id v6 = a4;
  id v7 = a3;
  signingOperation();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)[objc_alloc(MEMORY[0x189612730]) initWithData:v6 signature:v7];

  [v8 verify:v9 withKey:a1 error:0];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v11 = v10 != 0LL;

  return v11;
}

@end