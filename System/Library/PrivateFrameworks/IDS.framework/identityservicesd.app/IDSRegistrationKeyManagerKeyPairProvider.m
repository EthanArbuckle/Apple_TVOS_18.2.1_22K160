@interface IDSRegistrationKeyManagerKeyPairProvider
- (void)copyRegistrationKeyPairForIdentifier:(id)a3 publicKey:(__SecKey *)a4 privateKey:(__SecKey *)a5 keyPairSignature:(id *)a6 isMigratedSignature:(BOOL *)a7 isUpgradePending:(BOOL *)a8;
@end

@implementation IDSRegistrationKeyManagerKeyPairProvider

- (void)copyRegistrationKeyPairForIdentifier:(id)a3 publicKey:(__SecKey *)a4 privateKey:(__SecKey *)a5 keyPairSignature:(id *)a6 isMigratedSignature:(BOOL *)a7 isUpgradePending:(BOOL *)a8
{
  id v9 = 0LL;
  _IDSAppleRegistrationCopyKeyPair(a3, a4, a5, &v9, a7, a8);
  if (a6) {
    *a6 = v9;
  }
}

@end