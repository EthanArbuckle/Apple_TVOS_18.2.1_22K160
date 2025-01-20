@interface CEMSystemRatingsDeclaration
- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_statusForResult:(id)a3 context:(id)a4;
@end

@implementation CEMSystemRatingsDeclaration

- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4
{
  v14 = @"countryCode";
  id v6 = a3;
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[CEMSystemRatingsDeclaration payloadRatingRegion](self, "payloadRatingRegion"));
  v8 = (void *)v7;
  v9 = &stru_10009F768;
  if (v7) {
    v9 = (const __CFString *)v7;
  }
  v15 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));

  CFPreferencesSetAppValue(@"SBParentalControlsMCContentRestrictions", v10, @"com.apple.springboard");
  CFPreferencesAppSynchronize(@"com.apple.springboard");
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 assetProvidersByPayloadIdentifier]);

  v12 = (void *)objc_claimAutoreleasedReturnValue( -[CEMSystemRatingsDeclaration dmf_installSynthesizedProfileRequestWithAssetProviders:error:]( self,  "dmf_installSynthesizedProfileRequestWithAssetProviders:error:",  v11,  a4));
  return v12;
}

- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4
{
  return -[CEMSystemRatingsDeclaration dmf_removeSynthesizedProfileRequestWithError:]( self,  "dmf_removeSynthesizedProfileRequestWithError:",  a4);
}

- (id)dmf_statusForResult:(id)a3 context:(id)a4
{
  return 0LL;
}

@end