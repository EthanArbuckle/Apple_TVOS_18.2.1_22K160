@interface VSSetupFlowConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)canShowSupportedAppsButton;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldOfferAuthenticationFlow;
- (BOOL)shouldOfferSTBAuthenticationFlow;
- (BOOL)shouldOfferSoleAuthenticationFlow;
- (BOOL)shouldSkipSetupEntirely;
- (NSArray)bundlesIDsToConsent;
- (NSArray)supportedApps;
- (NSDictionary)vouchersByBundleID;
- (NSString)preferredAppID;
- (NSString)providerAccountUsername;
- (VSAppDescription)msoAppDescription;
- (VSIdentityProvider)identityProvider;
- (VSSetupFlowConfiguration)init;
- (VSSetupFlowConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundlesIDsToConsent:(id)a3;
- (void)setCanShowSupportedAppsButton:(BOOL)a3;
- (void)setIdentityProvider:(id)a3;
- (void)setMsoAppDescription:(id)a3;
- (void)setPreferredAppID:(id)a3;
- (void)setProviderAccountUsername:(id)a3;
- (void)setShouldOfferAuthenticationFlow:(BOOL)a3;
- (void)setShouldOfferSTBAuthenticationFlow:(BOOL)a3;
- (void)setShouldOfferSoleAuthenticationFlow:(BOOL)a3;
- (void)setShouldSkipSetupEntirely:(BOOL)a3;
- (void)setSupportedApps:(id)a3;
- (void)setVouchersByBundleID:(id)a3;
@end

@implementation VSSetupFlowConfiguration

- (VSSetupFlowConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VSSetupFlowConfiguration;
  v2 = -[VSSetupFlowConfiguration init](&v6, "init");
  if (v2)
  {
    id v3 = sub_15450();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    VSValueTypeInit(v4, v2);
  }

  return v2;
}

- (VSSetupFlowConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___VSSetupFlowConfiguration;
  v5 = -[VSSetupFlowConfiguration init](&v9, "init");
  if (v5)
  {
    id v6 = sub_15450();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    VSValueTypeInitWithCoder(v7, v5, v4);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = sub_15450();
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  VSValueTypeEncodeWithCoder(v6, self, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = sub_15450();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = VSValueTypeCopyWithZone(v6, self, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (unint64_t)hash
{
  id v3 = sub_15450();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = VSValueTypeHash(v4, self);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = sub_15450();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  LOBYTE(self) = VSValueTypeIsEqual(v6, self, v4);

  return (char)self;
}

- (id)description
{
  id v3 = sub_15450();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = VSValueTypeDescription(v4, self);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (BOOL)shouldSkipSetupEntirely
{
  return self->_shouldSkipSetupEntirely;
}

- (void)setShouldSkipSetupEntirely:(BOOL)a3
{
  self->_shouldSkipSetupEntirely = a3;
}

- (BOOL)shouldOfferAuthenticationFlow
{
  return self->_shouldOfferAuthenticationFlow;
}

- (void)setShouldOfferAuthenticationFlow:(BOOL)a3
{
  self->_shouldOfferAuthenticationFlow = a3;
}

- (BOOL)shouldOfferSoleAuthenticationFlow
{
  return self->_shouldOfferSoleAuthenticationFlow;
}

- (void)setShouldOfferSoleAuthenticationFlow:(BOOL)a3
{
  self->_shouldOfferSoleAuthenticationFlow = a3;
}

- (BOOL)shouldOfferSTBAuthenticationFlow
{
  return self->_shouldOfferSTBAuthenticationFlow;
}

- (void)setShouldOfferSTBAuthenticationFlow:(BOOL)a3
{
  self->_shouldOfferSTBAuthenticationFlow = a3;
}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (void)setIdentityProvider:(id)a3
{
}

- (NSString)providerAccountUsername
{
  return self->_providerAccountUsername;
}

- (void)setProviderAccountUsername:(id)a3
{
}

- (NSString)preferredAppID
{
  return self->_preferredAppID;
}

- (void)setPreferredAppID:(id)a3
{
}

- (VSAppDescription)msoAppDescription
{
  return self->_msoAppDescription;
}

- (void)setMsoAppDescription:(id)a3
{
}

- (NSArray)bundlesIDsToConsent
{
  return self->_bundlesIDsToConsent;
}

- (void)setBundlesIDsToConsent:(id)a3
{
}

- (NSDictionary)vouchersByBundleID
{
  return self->_vouchersByBundleID;
}

- (void)setVouchersByBundleID:(id)a3
{
}

- (BOOL)canShowSupportedAppsButton
{
  return self->_canShowSupportedAppsButton;
}

- (void)setCanShowSupportedAppsButton:(BOOL)a3
{
  self->_canShowSupportedAppsButton = a3;
}

- (NSArray)supportedApps
{
  return self->_supportedApps;
}

- (void)setSupportedApps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end