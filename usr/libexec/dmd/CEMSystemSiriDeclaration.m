@interface CEMSystemSiriDeclaration
- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_statusForResult:(id)a3 context:(id)a4;
@end

@implementation CEMSystemSiriDeclaration

- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue([a3 assetProvidersByPayloadIdentifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[CEMSystemSiriDeclaration dmf_installSynthesizedProfileRequestWithAssetProviders:error:]( self,  "dmf_installSynthesizedProfileRequestWithAssetProviders:error:",  v6,  a4));

  return v7;
}

- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4
{
  return -[CEMSystemSiriDeclaration dmf_removeSynthesizedProfileRequestWithError:]( self,  "dmf_removeSynthesizedProfileRequestWithError:",  a4);
}

- (id)dmf_statusForResult:(id)a3 context:(id)a4
{
  return 0LL;
}

@end