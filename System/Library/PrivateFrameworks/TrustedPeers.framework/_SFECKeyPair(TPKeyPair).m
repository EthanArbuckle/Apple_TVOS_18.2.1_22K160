@interface _SFECKeyPair(TPKeyPair)
- (id)signatureForData:()TPKeyPair withError:;
@end

@implementation _SFECKeyPair(TPKeyPair)

- (id)signatureForData:()TPKeyPair withError:
{
  id v6 = a3;
  signingOperation();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 sign:v6 withKey:a1 error:a4];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  [v8 signature];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end