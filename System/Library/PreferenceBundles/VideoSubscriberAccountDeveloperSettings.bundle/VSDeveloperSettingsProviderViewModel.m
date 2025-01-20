@interface VSDeveloperSettingsProviderViewModel
+ (id)keyPathsForValuesAffectingTestSystemTrustHash;
- (BOOL)requireAuthUrlSystemTrust;
- (BOOL)requireXHRRequestSystemTrust;
- (BOOL)supportAPI;
- (BOOL)supportSAML;
- (BOOL)testingSystemTrust;
- (NSString)authURL;
- (NSString)displayName;
- (NSString)identifier;
- (VSDeveloperSettingsProviderViewModel)initWithIdentityProvider:(id)a3;
- (unint64_t)testSystemTrustHash;
- (void)setAuthURL:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRequireAuthUrlSystemTrust:(BOOL)a3;
- (void)setRequireXHRRequestSystemTrust:(BOOL)a3;
- (void)setSupportAPI:(BOOL)a3;
- (void)setSupportSAML:(BOOL)a3;
- (void)setTestingSystemTrust:(BOOL)a3;
@end

@implementation VSDeveloperSettingsProviderViewModel

- (VSDeveloperSettingsProviderViewModel)initWithIdentityProvider:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___VSDeveloperSettingsProviderViewModel;
  v5 = -[VSDeveloperSettingsProviderViewModel init](&v22, "init");
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v4 providerID]);
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 forceUnwrapObject]);
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v8;

      uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 nameForSorting]);
      displayName = v6->_displayName;
      v6->_displayName = (NSString *)v10;

      v12 = (void *)objc_claimAutoreleasedReturnValue([v4 authenticationURL]);
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 absoluteString]);
      authURL = v6->_authURL;
      v6->_authURL = (NSString *)v13;

      v15 = (void *)objc_claimAutoreleasedReturnValue([v4 supportedAuthenticationSchemes]);
      v6->_supportSAML = [v15 containsObject:VSAccountProviderAuthenticationSchemeSAML];

      v16 = (void *)objc_claimAutoreleasedReturnValue([v4 supportedAuthenticationSchemes]);
      v6->_supportAPI = [v16 containsObject:VSAccountProviderAuthenticationSchemeAPI];

      v6->_requireAuthUrlSystemTrust = [v4 requireAuthenticationURLSystemTrust];
      unsigned __int8 v17 = [v4 requireXHRRequestSystemTrust];
    }

    else
    {
      v18 = v5->_identifier;
      v5->_identifier = (NSString *)&stru_14B88;

      v19 = v6->_displayName;
      v6->_displayName = (NSString *)&stru_14B88;

      v20 = v6->_authURL;
      v6->_authURL = (NSString *)&stru_14B88;

      unsigned __int8 v17 = 0;
      *(_WORD *)&v6->_supportSAML = 257;
      v6->_requireAuthUrlSystemTrust = 0;
    }

    v6->_requireXHRRequestSystemTrust = v17;
  }

  return v6;
}

- (unint64_t)testSystemTrustHash
{
  if (-[VSDeveloperSettingsProviderViewModel testingSystemTrust](self, "testingSystemTrust")) {
    uint64_t v3 = 2LL;
  }
  else {
    uint64_t v3 = 0LL;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsProviderViewModel authURL](self, "authURL"));
  unint64_t v5 = v3 | ([v4 length] != 0);

  return v5;
}

+ (id)keyPathsForValuesAffectingTestSystemTrustHash
{
  if (qword_1A108 != -1) {
    dispatch_once(&qword_1A108, &stru_143C8);
  }
  return (id)qword_1A100;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)authURL
{
  return self->_authURL;
}

- (void)setAuthURL:(id)a3
{
}

- (BOOL)supportSAML
{
  return self->_supportSAML;
}

- (void)setSupportSAML:(BOOL)a3
{
  self->_supportSAML = a3;
}

- (BOOL)supportAPI
{
  return self->_supportAPI;
}

- (void)setSupportAPI:(BOOL)a3
{
  self->_supportAPI = a3;
}

- (BOOL)requireAuthUrlSystemTrust
{
  return self->_requireAuthUrlSystemTrust;
}

- (void)setRequireAuthUrlSystemTrust:(BOOL)a3
{
  self->_requireAuthUrlSystemTrust = a3;
}

- (BOOL)requireXHRRequestSystemTrust
{
  return self->_requireXHRRequestSystemTrust;
}

- (void)setRequireXHRRequestSystemTrust:(BOOL)a3
{
  self->_requireXHRRequestSystemTrust = a3;
}

- (BOOL)testingSystemTrust
{
  return self->_testingSystemTrust;
}

- (void)setTestingSystemTrust:(BOOL)a3
{
  self->_testingSystemTrust = a3;
}

- (void).cxx_destruct
{
}

@end