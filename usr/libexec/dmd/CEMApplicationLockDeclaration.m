@interface CEMApplicationLockDeclaration
- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_statusForResult:(id)a3 context:(id)a4;
@end

@implementation CEMApplicationLockDeclaration

- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue([a3 assetProvidersByPayloadIdentifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[CEMApplicationLockDeclaration dmf_installSynthesizedProfileRequestWithAssetProviders:error:]( self,  "dmf_installSynthesizedProfileRequestWithAssetProviders:error:",  v6,  a4));

  return v7;
}

- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4
{
  return -[CEMApplicationLockDeclaration dmf_removeSynthesizedProfileRequestWithError:]( self,  "dmf_removeSynthesizedProfileRequestWithError:",  a4);
}

- (id)dmf_statusForResult:(id)a3 context:(id)a4
{
  return 0LL;
}

@end