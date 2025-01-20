@interface NEVPNProtocolIKEv2
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)disableInitialContact;
- (BOOL)disableMOBIKE;
- (BOOL)disableRedirect;
- (BOOL)enableFallback;
- (BOOL)enablePFS;
- (BOOL)enableRevocationCheck;
- (BOOL)needToUpdateKeychain;
- (BOOL)opportunisticPFS;
- (BOOL)strictRevocationCheck;
- (BOOL)useConfigurationAttributeInternalIPSubnet;
- (NEVPNIKEv2CertificateType)certificateType;
- (NEVPNIKEv2DeadPeerDetectionRate)deadPeerDetectionRate;
- (NEVPNIKEv2PPKConfiguration)ppkConfiguration;
- (NEVPNIKEv2SecurityAssociationParameters)IKESecurityAssociationParameters;
- (NEVPNIKEv2SecurityAssociationParameters)childSecurityAssociationParameters;
- (NEVPNIKEv2TLSVersion)maximumTLSVersion;
- (NEVPNIKEv2TLSVersion)minimumTLSVersion;
- (NEVPNProtocolIKEv2)init;
- (NEVPNProtocolIKEv2)initWithCoder:(id)a3;
- (NSArray)IKESecurityAssociationParametersArray;
- (NSArray)childSecurityAssociationParametersArray;
- (NSString)pluginType;
- (NSString)providerBundleIdentifier;
- (NSString)serverCertificateCommonName;
- (NSString)serverCertificateIssuerCommonName;
- (NSUInteger)mtu;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int)disableMOBIKERetryOnWake;
- (int)natKeepAliveOffloadEnable;
- (int)natKeepAliveOffloadInterval;
- (int64_t)tunnelKind;
- (void)encodeWithCoder:(id)a3;
- (void)initWithPluginType:(void *)a1;
- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4;
- (void)setCertificateType:(NEVPNIKEv2CertificateType)certificateType;
- (void)setChildSecurityAssociationParametersArray:(id)a3;
- (void)setDeadPeerDetectionRate:(NEVPNIKEv2DeadPeerDetectionRate)deadPeerDetectionRate;
- (void)setDefaultsForUIConfiguration;
- (void)setDisableInitialContact:(BOOL)a3;
- (void)setDisableMOBIKE:(BOOL)disableMOBIKE;
- (void)setDisableMOBIKERetryOnWake:(int)a3;
- (void)setDisableRedirect:(BOOL)disableRedirect;
- (void)setEnableFallback:(BOOL)enableFallback;
- (void)setEnablePFS:(BOOL)enablePFS;
- (void)setEnableRevocationCheck:(BOOL)enableRevocationCheck;
- (void)setIKESecurityAssociationParametersArray:(id)a3;
- (void)setMaximumTLSVersion:(NEVPNIKEv2TLSVersion)maximumTLSVersion;
- (void)setMinimumTLSVersion:(NEVPNIKEv2TLSVersion)minimumTLSVersion;
- (void)setMtu:(NSUInteger)mtu;
- (void)setNatKeepAliveOffloadEnable:(int)a3;
- (void)setNatKeepAliveOffloadInterval:(int)a3;
- (void)setOpportunisticPFS:(BOOL)a3;
- (void)setPluginType:(void *)a1;
- (void)setPpkConfiguration:(id)a3;
- (void)setProviderBundleIdentifier:(id)a3;
- (void)setServerCertificateCommonName:(NSString *)serverCertificateCommonName;
- (void)setServerCertificateIssuerCommonName:(NSString *)serverCertificateIssuerCommonName;
- (void)setStrictRevocationCheck:(BOOL)strictRevocationCheck;
- (void)setTunnelKind:(int64_t)a3;
- (void)setUseConfigurationAttributeInternalIPSubnet:(BOOL)useConfigurationAttributeInternalIPSubnet;
- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5;
@end

@implementation NEVPNProtocolIKEv2

- (NEVPNProtocolIKEv2)init
{
  return (NEVPNProtocolIKEv2 *)-[NEVPNProtocolIKEv2 initWithPluginType:](self, 0LL);
}

- (NEVPNProtocolIKEv2)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___NEVPNProtocolIKEv2;
  v5 = -[NEVPNProtocolIPSec initWithCoder:](&v31, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_deadPeerDetectionRate = (int)[v4 decodeInt32ForKey:@"DeadPeerDetectionRate"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServerCertificateIssuer"];
    serverCertificateIssuerCommonName = v5->_serverCertificateIssuerCommonName;
    v5->_serverCertificateIssuerCommonName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServerCertificateCommonName"];
    serverCertificateCommonName = v5->_serverCertificateCommonName;
    v5->_serverCertificateCommonName = (NSString *)v8;

    v10 = (void *)MEMORY[0x189604010];
    uint64_t v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"IKESAParametersArray"];
    IKESecurityAssociationParametersArray = v5->_IKESecurityAssociationParametersArray;
    v5->_IKESecurityAssociationParametersArray = (NSArray *)v13;

    if (v5->_IKESecurityAssociationParametersArray)
    {
      IKESecurityAssociationParameters = v5->_IKESecurityAssociationParameters;
      v5->_IKESecurityAssociationParameters = 0LL;
    }

    else
    {
      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IKESAParameters"];
      IKESecurityAssociationParameters = v5->_IKESecurityAssociationParameters;
      v5->_IKESecurityAssociationParameters = (NEVPNIKEv2SecurityAssociationParameters *)v16;
    }

    v17 = (void *)MEMORY[0x189604010];
    uint64_t v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"ChildSAParametersArray"];
    childSecurityAssociationParametersArray = v5->_childSecurityAssociationParametersArray;
    v5->_childSecurityAssociationParametersArray = (NSArray *)v20;

    if (v5->_childSecurityAssociationParametersArray)
    {
      childSecurityAssociationParameters = v5->_childSecurityAssociationParameters;
      v5->_childSecurityAssociationParameters = 0LL;
    }

    else
    {
      uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ChildSAParameters"];
      childSecurityAssociationParameters = v5->_childSecurityAssociationParameters;
      v5->_childSecurityAssociationParameters = (NEVPNIKEv2SecurityAssociationParameters *)v23;
    }

    v5->_wakeForRekey = [v4 decodeBoolForKey:@"WakeForRekey"];
    v5->_certificateType = (int)[v4 decodeInt32ForKey:@"CertificateType"];
    v5->_useConfigurationAttributeInternalIPSubnet = [v4 decodeBoolForKey:@"UseConfigurationAttributeInternalIPSubnet"];
    v5->_disableMOBIKE = [v4 decodeBoolForKey:@"DisableMOBIKE"];
    v5->_disableRedirect = [v4 decodeBoolForKey:@"DisableRedirect"];
    v5->_enablePFS = [v4 decodeBoolForKey:@"EnablePFS"];
    v5->_opportunisticPFS = [v4 decodeBoolForKey:@"OpportunisticPFS"];
    v5->_natKeepAliveOffloadEnable = [v4 decodeInt32ForKey:@"NATKeepAliveOffloadEnable"];
    v5->_natKeepAliveOffloadInterval = [v4 decodeInt32ForKey:@"NATKeepAliveOffloadInterval"];
    v5->_disableMOBIKERetryOnWake = [v4 decodeInt32ForKey:@"DisableMOBIKERetryOnWake"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProviderBundleIdentifier"];
    providerBundleIdentifier = v5->_providerBundleIdentifier;
    v5->_providerBundleIdentifier = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PluginType"];
    pluginType = v5->_pluginType;
    v5->_pluginType = (NSString *)v26;

    v5->_enableRevocationCheck = [v4 decodeBoolForKey:@"EnableRevocationCheck"];
    v5->_strictRevocationCheck = [v4 decodeBoolForKey:@"StrictRevocationCheck"];
    v5->_minimumTLSVersion = (int)[v4 decodeInt32ForKey:@"MinimumTLSVersion"];
    v5->_maximumTLSVersion = (int)[v4 decodeInt32ForKey:@"MaximumTLSVersion"];
    v5->_tunnelKind = (int)[v4 decodeInt32ForKey:@"TunnelType"];
    v5->_disableInitialContact = [v4 decodeBoolForKey:@"DisableInitialContact"];
    v5->_enableFallback = [v4 decodeBoolForKey:@"EnableFallback"];
    v5->_mtu = (int)[v4 decodeInt32ForKey:@"MTU"];
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PPKConfiguration"];
    ppkConfiguration = v5->_ppkConfiguration;
    v5->_ppkConfiguration = (NEVPNIKEv2PPKConfiguration *)v28;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NEVPNProtocolIKEv2;
  -[NEVPNProtocolIPSec encodeWithCoder:](&v15, sel_encodeWithCoder_, v4);
  objc_msgSend( v4,  "encodeInt32:forKey:",  -[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate"),  @"DeadPeerDetectionRate");
  v5 = -[NEVPNProtocolIKEv2 serverCertificateIssuerCommonName](self, "serverCertificateIssuerCommonName");
  [v4 encodeObject:v5 forKey:@"ServerCertificateIssuer"];

  -[NEVPNProtocolIKEv2 serverCertificateCommonName](self, "serverCertificateCommonName");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"ServerCertificateCommonName"];
  v7 = -[NEVPNProtocolIKEv2 IKESecurityAssociationParameters](self, "IKESecurityAssociationParameters");
  [v4 encodeObject:v7 forKey:@"IKESAParameters"];

  -[NEVPNProtocolIKEv2 childSecurityAssociationParameters](self, "childSecurityAssociationParameters");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"ChildSAParameters"];
  v9 = -[NEVPNProtocolIKEv2 IKESecurityAssociationParametersArray](self, "IKESecurityAssociationParametersArray");
  [v4 encodeObject:v9 forKey:@"IKESAParametersArray"];
  v10 = -[NEVPNProtocolIKEv2 childSecurityAssociationParametersArray](self, "childSecurityAssociationParametersArray");
  [v4 encodeObject:v10 forKey:@"ChildSAParametersArray"];

  if (self) {
    BOOL wakeForRekey = self->_wakeForRekey;
  }
  else {
    BOOL wakeForRekey = 0LL;
  }
  [v4 encodeBool:wakeForRekey forKey:@"WakeForRekey"];
  objc_msgSend( v4,  "encodeInt32:forKey:",  -[NEVPNProtocolIKEv2 certificateType](self, "certificateType"),  @"CertificateType");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEVPNProtocolIKEv2 useConfigurationAttributeInternalIPSubnet](self, "useConfigurationAttributeInternalIPSubnet"),  @"UseConfigurationAttributeInternalIPSubnet");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEVPNProtocolIKEv2 disableMOBIKE](self, "disableMOBIKE"),  @"DisableMOBIKE");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEVPNProtocolIKEv2 disableRedirect](self, "disableRedirect"),  @"DisableRedirect");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIKEv2 enablePFS](self, "enablePFS"), @"EnablePFS");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEVPNProtocolIKEv2 opportunisticPFS](self, "opportunisticPFS"),  @"OpportunisticPFS");
  objc_msgSend( v4,  "encodeInt32:forKey:",  -[NEVPNProtocolIKEv2 natKeepAliveOffloadEnable](self, "natKeepAliveOffloadEnable"),  @"NATKeepAliveOffloadEnable");
  objc_msgSend( v4,  "encodeInt32:forKey:",  -[NEVPNProtocolIKEv2 natKeepAliveOffloadInterval](self, "natKeepAliveOffloadInterval"),  @"NATKeepAliveOffloadInterval");
  objc_msgSend( v4,  "encodeInt32:forKey:",  -[NEVPNProtocolIKEv2 disableMOBIKERetryOnWake](self, "disableMOBIKERetryOnWake"),  @"DisableMOBIKERetryOnWake");
  v12 = -[NEVPNProtocolIKEv2 providerBundleIdentifier](self, "providerBundleIdentifier");
  [v4 encodeObject:v12 forKey:@"ProviderBundleIdentifier"];

  -[NEVPNProtocolIKEv2 pluginType](self, "pluginType");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v13 forKey:@"PluginType"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEVPNProtocolIKEv2 enableRevocationCheck](self, "enableRevocationCheck"),  @"EnableRevocationCheck");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEVPNProtocolIKEv2 strictRevocationCheck](self, "strictRevocationCheck"),  @"StrictRevocationCheck");
  objc_msgSend( v4,  "encodeInt32:forKey:",  -[NEVPNProtocolIKEv2 minimumTLSVersion](self, "minimumTLSVersion"),  @"MinimumTLSVersion");
  objc_msgSend( v4,  "encodeInt32:forKey:",  -[NEVPNProtocolIKEv2 maximumTLSVersion](self, "maximumTLSVersion"),  @"MaximumTLSVersion");
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIKEv2 tunnelKind](self, "tunnelKind"), @"TunnelType");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEVPNProtocolIKEv2 disableInitialContact](self, "disableInitialContact"),  @"DisableInitialContact");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEVPNProtocolIKEv2 enableFallback](self, "enableFallback"),  @"EnableFallback");
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIKEv2 mtu](self, "mtu"), @"MTU");
  v14 = -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
  [v4 encodeObject:v14 forKey:@"PPKConfiguration"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___NEVPNProtocolIKEv2;
  id v4 = -[NEVPNProtocolIPSec copyWithZone:](&v31, sel_copyWithZone_, a3);
  v5 = -[NEVPNProtocolIKEv2 pluginType](self, "pluginType");
  -[NEVPNProtocolIKEv2 setPluginType:](v4, v5);

  objc_msgSend( v4,  "setDeadPeerDetectionRate:",  -[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate"));
  -[NEVPNProtocolIKEv2 serverCertificateIssuerCommonName](self, "serverCertificateIssuerCommonName");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setServerCertificateIssuerCommonName:v6];
  v7 = -[NEVPNProtocolIKEv2 serverCertificateCommonName](self, "serverCertificateCommonName");
  [v4 setServerCertificateCommonName:v7];

  -[NEVPNProtocolIKEv2 IKESecurityAssociationParameters](self, "IKESecurityAssociationParameters");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 copy];
  v10 = (void *)v4[37];
  v4[37] = v9;

  -[NEVPNProtocolIKEv2 childSecurityAssociationParameters](self, "childSecurityAssociationParameters");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 copy];
  uint64_t v13 = (void *)v4[38];
  v4[38] = v12;
  v14 = -[NEVPNProtocolIKEv2 IKESecurityAssociationParametersArray](self, "IKESecurityAssociationParametersArray");
  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x189603F18]);
    -[NEVPNProtocolIKEv2 IKESecurityAssociationParametersArray](self, "IKESecurityAssociationParametersArray");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v15 initWithArray:v16 copyItems:1];
    uint64_t v18 = (void *)v4[44];
    v4[44] = v17;
  }
  v19 = -[NEVPNProtocolIKEv2 childSecurityAssociationParametersArray](self, "childSecurityAssociationParametersArray");
  if (v19)
  {
    id v20 = objc_alloc(MEMORY[0x189603F18]);
    v21 = -[NEVPNProtocolIKEv2 childSecurityAssociationParametersArray](self, "childSecurityAssociationParametersArray");
    uint64_t v22 = [v20 initWithArray:v21 copyItems:1];
    uint64_t v23 = (void *)v4[45];
    v4[45] = v22;
  }

  if (self) {
    BOOL wakeForRekey = self->_wakeForRekey;
  }
  else {
    BOOL wakeForRekey = 0;
  }
  *((_BYTE *)v4 + 247) = wakeForRekey;
  v4[36] = -[NEVPNProtocolIKEv2 certificateType](self, "certificateType");
  *((_BYTE *)v4 + 240) = -[NEVPNProtocolIKEv2 useConfigurationAttributeInternalIPSubnet]( self,  "useConfigurationAttributeInternalIPSubnet");
  *((_BYTE *)v4 + 241) = -[NEVPNProtocolIKEv2 disableMOBIKE](self, "disableMOBIKE");
  *((_BYTE *)v4 + 242) = -[NEVPNProtocolIKEv2 disableRedirect](self, "disableRedirect");
  *((_BYTE *)v4 + 243) = -[NEVPNProtocolIKEv2 enablePFS](self, "enablePFS");
  *((_BYTE *)v4 + 248) = -[NEVPNProtocolIKEv2 opportunisticPFS](self, "opportunisticPFS");
  *((_DWORD *)v4 + 63) = -[NEVPNProtocolIKEv2 natKeepAliveOffloadEnable](self, "natKeepAliveOffloadEnable");
  *((_DWORD *)v4 + 64) = -[NEVPNProtocolIKEv2 natKeepAliveOffloadInterval](self, "natKeepAliveOffloadInterval");
  *((_DWORD *)v4 + 65) = -[NEVPNProtocolIKEv2 disableMOBIKERetryOnWake](self, "disableMOBIKERetryOnWake");
  uint64_t v25 = -[NEVPNProtocolIKEv2 providerBundleIdentifier](self, "providerBundleIdentifier");
  uint64_t v26 = (void *)v4[46];
  v4[46] = v25;

  *((_BYTE *)v4 + 244) = -[NEVPNProtocolIKEv2 enableRevocationCheck](self, "enableRevocationCheck");
  *((_BYTE *)v4 + 245) = -[NEVPNProtocolIKEv2 strictRevocationCheck](self, "strictRevocationCheck");
  v4[39] = -[NEVPNProtocolIKEv2 minimumTLSVersion](self, "minimumTLSVersion");
  v4[40] = -[NEVPNProtocolIKEv2 maximumTLSVersion](self, "maximumTLSVersion");
  v4[47] = -[NEVPNProtocolIKEv2 tunnelKind](self, "tunnelKind");
  *((_BYTE *)v4 + 249) = -[NEVPNProtocolIKEv2 disableInitialContact](self, "disableInitialContact");
  *((_BYTE *)v4 + 246) = -[NEVPNProtocolIKEv2 enableFallback](self, "enableFallback");
  v4[41] = -[NEVPNProtocolIKEv2 mtu](self, "mtu");
  v27 = -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
  uint64_t v28 = [v27 copy];
  v29 = (void *)v4[42];
  v4[42] = v28;

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___NEVPNProtocolIKEv2;
  unsigned int v5 = -[NEVPNProtocolIPSec checkValidityAndCollectErrors:](&v38, sel_checkValidityAndCollectErrors_, v4);
  -[NEVPNProtocolIKEv2 IKESecurityAssociationParametersArray](self, "IKESecurityAssociationParametersArray");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 count];

  if (v7)
  {
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    -[NEVPNProtocolIKEv2 IKESecurityAssociationParametersArray](self, "IKESecurityAssociationParametersArray");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v35;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(v8);
          }
        }

        uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }

      while (v10);
    }

    int v13 = v5 & 1;
  }

  else
  {
    v14 = -[NEVPNProtocolIKEv2 IKESecurityAssociationParameters](self, "IKESecurityAssociationParameters");
    int v15 = [v14 checkValidityAndCollectErrors:v4];

    int v13 = v15 & v5;
  }

  -[NEVPNProtocolIKEv2 childSecurityAssociationParametersArray](self, "childSecurityAssociationParametersArray");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 count];

  if (v17)
  {
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    -[NEVPNProtocolIKEv2 childSecurityAssociationParametersArray](self, "childSecurityAssociationParametersArray", 0LL);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v31;
      do
      {
        for (uint64_t j = 0LL; j != v20; ++j)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(v18);
          }
          v13 &= [*(id *)(*((void *)&v30 + 1) + 8 * j) checkValidityAndCollectErrors:v4];
        }

        uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }

      while (v20);
    }
  }

  else
  {
    -[NEVPNProtocolIKEv2 childSecurityAssociationParameters](self, "childSecurityAssociationParameters");
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = [v23 checkValidityAndCollectErrors:v4];

    LOBYTE(v13) = v24 & v13;
  }

  uint64_t v25 = -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    v27 = -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
    char v28 = [v27 checkValidityAndCollectErrors:v4];

    LOBYTE(v13) = v28 & v13;
  }

  return v13;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x189607940]);
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___NEVPNProtocolIKEv2;
  -[NEVPNProtocolIPSec descriptionWithIndent:options:](&v28, sel_descriptionWithIndent_options_, v5, a4);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void *)[v7 initWithString:v8];

  unint64_t v10 = a4 & 0xFFFFFFFFFFFFFFF7LL;
  if (-[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate"))
  {
    if (-[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate") == NEVPNIKEv2DeadPeerDetectionRateLow)
    {
      unint64_t v11 = a4 | 8;
      uint64_t v12 = @"low";
    }

    else if (-[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate") == NEVPNIKEv2DeadPeerDetectionRateMedium)
    {
      unint64_t v11 = a4 | 8;
      uint64_t v12 = @"medium";
    }

    else
    {
      unint64_t v11 = a4 | 8;
      if (-[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate") != NEVPNIKEv2DeadPeerDetectionRateHigh) {
        goto LABEL_10;
      }
      uint64_t v12 = @"high";
    }
  }

  else
  {
    unint64_t v11 = a4 | 8;
    uint64_t v12 = @"none";
  }

  [v9 appendPrettyObject:v12 withName:@"deadPeerDetectionRate" andIndent:v5 options:v11];
LABEL_10:
  -[NEVPNProtocolIKEv2 serverCertificateIssuerCommonName](self, "serverCertificateIssuerCommonName");
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v14 = a4 | 9;
  [v9 appendPrettyObject:v13 withName:@"serverCertificateIssuer" andIndent:v5 options:v14];

  -[NEVPNProtocolIKEv2 serverCertificateCommonName](self, "serverCertificateCommonName");
  int v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v15 withName:@"serverCertificateCommonName" andIndent:v5 options:v14];

  -[NEVPNProtocolIKEv2 IKESecurityAssociationParameters](self, "IKESecurityAssociationParameters");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v16 withName:@"IKESAParameters" andIndent:v5 options:v11];

  -[NEVPNProtocolIKEv2 childSecurityAssociationParameters](self, "childSecurityAssociationParameters");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v17 withName:@"childSAParameters" andIndent:v5 options:v11];

  -[NEVPNProtocolIKEv2 IKESecurityAssociationParametersArray](self, "IKESecurityAssociationParametersArray");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v18 withName:@"IKESAParametersArray" andIndent:v5 options:v10];

  -[NEVPNProtocolIKEv2 childSecurityAssociationParametersArray](self, "childSecurityAssociationParametersArray");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v19 withName:@"childSAParametersArray" andIndent:v5 options:v10];

  if (self) {
    BOOL wakeForRekey = self->_wakeForRekey;
  }
  else {
    BOOL wakeForRekey = 0LL;
  }
  [v9 appendPrettyBOOL:wakeForRekey withName:@"wakeForRekey" andIndent:v5 options:v10];
  if (-[NEVPNProtocolIKEv2 certificateType](self, "certificateType") == NEVPNIKEv2CertificateTypeRSA)
  {
    uint64_t v21 = @"RSA";
  }

  else if (-[NEVPNProtocolIKEv2 certificateType](self, "certificateType") == NEVPNIKEv2CertificateTypeECDSA256)
  {
    uint64_t v21 = @"ECDSA256";
  }

  else if (-[NEVPNProtocolIKEv2 certificateType](self, "certificateType") == NEVPNIKEv2CertificateTypeECDSA384)
  {
    uint64_t v21 = @"ECDSA384";
  }

  else if (-[NEVPNProtocolIKEv2 certificateType](self, "certificateType") == NEVPNIKEv2CertificateTypeECDSA521)
  {
    uint64_t v21 = @"ECDSA521";
  }

  else
  {
    if (-[NEVPNProtocolIKEv2 certificateType](self, "certificateType") != (NEVPNIKEv2CertificateTypeECDSA521|NEVPNIKEv2CertificateTypeRSA)) {
      goto LABEL_23;
    }
    uint64_t v21 = @"Ed25519";
  }

  [v9 appendPrettyObject:v21 withName:@"certificateType" andIndent:v5 options:v11];
LABEL_23:
  objc_msgSend( v9,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPNProtocolIKEv2 useConfigurationAttributeInternalIPSubnet](self, "useConfigurationAttributeInternalIPSubnet"),  @"useConfigurationAttributeInternalIPSubnet",  v5,  v11);
  objc_msgSend( v9,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPNProtocolIKEv2 disableMOBIKE](self, "disableMOBIKE"),  @"disableMOBIKE",  v5,  v11);
  objc_msgSend( v9,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPNProtocolIKEv2 disableRedirect](self, "disableRedirect"),  @"disableRedirect",  v5,  v11);
  objc_msgSend( v9,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPNProtocolIKEv2 enablePFS](self, "enablePFS"),  @"enabledPFS",  v5,  v11);
  objc_msgSend( v9,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPNProtocolIKEv2 opportunisticPFS](self, "opportunisticPFS"),  @"opportunisticPFS",  v5,  v11);
  objc_msgSend( v9,  "appendPrettyInt:withName:andIndent:options:",  -[NEVPNProtocolIKEv2 natKeepAliveOffloadEnable](self, "natKeepAliveOffloadEnable"),  @"natKeepAliveOffloadEnable",  v5,  v10);
  objc_msgSend( v9,  "appendPrettyInt:withName:andIndent:options:",  -[NEVPNProtocolIKEv2 disableMOBIKERetryOnWake](self, "disableMOBIKERetryOnWake"),  @"DisableMOBIKERetryOnWake",  v5,  v10);
  objc_msgSend( v9,  "appendPrettyInt:withName:andIndent:options:",  -[NEVPNProtocolIKEv2 natKeepAliveOffloadInterval](self, "natKeepAliveOffloadInterval"),  @"natKeepAliveOffloadInterval",  v5,  v10);
  -[NEVPNProtocolIKEv2 providerBundleIdentifier](self, "providerBundleIdentifier");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v22 withName:@"providerBundleIdentifier" andIndent:v5 options:v10];

  -[NEVPNProtocolIKEv2 pluginType](self, "pluginType");
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v23 withName:@"pluginType" andIndent:v5 options:v10];

  objc_msgSend( v9,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPNProtocolIKEv2 enableRevocationCheck](self, "enableRevocationCheck"),  @"enableRevocationCheck",  v5,  v11);
  objc_msgSend( v9,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPNProtocolIKEv2 strictRevocationCheck](self, "strictRevocationCheck"),  @"strictRevocationCheck",  v5,  v11);
  if (-[NEVPNProtocolIKEv2 minimumTLSVersion](self, "minimumTLSVersion") == NEVPNIKEv2TLSVersion1_0)
  {
    uint64_t v24 = @"1.0";
  }

  else if (-[NEVPNProtocolIKEv2 minimumTLSVersion](self, "minimumTLSVersion") == NEVPNIKEv2TLSVersion1_1)
  {
    uint64_t v24 = @"1.1";
  }

  else
  {
    if (-[NEVPNProtocolIKEv2 minimumTLSVersion](self, "minimumTLSVersion") != NEVPNIKEv2TLSVersion1_2) {
      goto LABEL_30;
    }
    uint64_t v24 = @"1.2";
  }

  [v9 appendPrettyObject:v24 withName:@"minimumTLSVersion" andIndent:v5 options:v11];
LABEL_30:
  if (-[NEVPNProtocolIKEv2 maximumTLSVersion](self, "maximumTLSVersion") == NEVPNIKEv2TLSVersion1_0)
  {
    uint64_t v25 = @"1.0";
LABEL_36:
    [v9 appendPrettyObject:v25 withName:@"maximumTLSVersion" andIndent:v5 options:v11];
    goto LABEL_37;
  }

  if (-[NEVPNProtocolIKEv2 maximumTLSVersion](self, "maximumTLSVersion") == NEVPNIKEv2TLSVersion1_1)
  {
    uint64_t v25 = @"1.1";
    goto LABEL_36;
  }

  if (-[NEVPNProtocolIKEv2 maximumTLSVersion](self, "maximumTLSVersion") == NEVPNIKEv2TLSVersion1_2)
  {
    uint64_t v25 = @"1.2";
    goto LABEL_36;
  }

- (void)setDefaultsForUIConfiguration
{
  v16[4] = *MEMORY[0x1895F89C0];
  IKESecurityAssociationParameters = self->_IKESecurityAssociationParameters;
  self->_IKESecurityAssociationParameters = 0LL;

  childSecurityAssociationParameters = self->_childSecurityAssociationParameters;
  self->_childSecurityAssociationParameters = 0LL;

  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NEVPNIKEv2SecurityAssociationParameters);
  -[NEVPNIKEv2SecurityAssociationParameters setEncryptionAlgorithm:](v5, "setEncryptionAlgorithm:", 6LL);
  -[NEVPNIKEv2SecurityAssociationParameters setIntegrityAlgorithm:](v5, "setIntegrityAlgorithm:", 3LL);
  -[NEVPNIKEv2SecurityAssociationParameters setDiffieHellmanGroup:](v5, "setDiffieHellmanGroup:", 19LL);
  -[NEVPNIKEv2SecurityAssociationParameters setLifetimeMinutes:](v5, "setLifetimeMinutes:", 60LL);
  uint64_t v6 = (void *)-[NEVPNIKEv2SecurityAssociationParameters copy](v5, "copy");
  [v6 setLifetimeMinutes:30];
  id v7 = objc_alloc_init(&OBJC_CLASS___NEVPNIKEv2SecurityAssociationParameters);
  -[NEVPNIKEv2SecurityAssociationParameters setEncryptionAlgorithm:](v7, "setEncryptionAlgorithm:", 6LL);
  -[NEVPNIKEv2SecurityAssociationParameters setIntegrityAlgorithm:](v7, "setIntegrityAlgorithm:", 3LL);
  -[NEVPNIKEv2SecurityAssociationParameters setDiffieHellmanGroup:](v7, "setDiffieHellmanGroup:", 14LL);
  -[NEVPNIKEv2SecurityAssociationParameters setLifetimeMinutes:](v7, "setLifetimeMinutes:", 60LL);
  uint64_t v8 = (void *)-[NEVPNIKEv2SecurityAssociationParameters copy](v7, "copy");
  [v8 setLifetimeMinutes:30];
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NEVPNIKEv2SecurityAssociationParameters);
  -[NEVPNIKEv2SecurityAssociationParameters setEncryptionAlgorithm:](v9, "setEncryptionAlgorithm:", 4LL);
  -[NEVPNIKEv2SecurityAssociationParameters setIntegrityAlgorithm:](v9, "setIntegrityAlgorithm:", 3LL);
  -[NEVPNIKEv2SecurityAssociationParameters setDiffieHellmanGroup:](v9, "setDiffieHellmanGroup:", 19LL);
  -[NEVPNIKEv2SecurityAssociationParameters setLifetimeMinutes:](v9, "setLifetimeMinutes:", 60LL);
  unint64_t v14 = (void *)-[NEVPNIKEv2SecurityAssociationParameters copy](v9, "copy");
  [v14 setLifetimeMinutes:30];
  unint64_t v10 = objc_alloc_init(&OBJC_CLASS___NEVPNIKEv2SecurityAssociationParameters);
  -[NEVPNIKEv2SecurityAssociationParameters setEncryptionAlgorithm:](v10, "setEncryptionAlgorithm:", 4LL);
  -[NEVPNIKEv2SecurityAssociationParameters setIntegrityAlgorithm:](v10, "setIntegrityAlgorithm:", 3LL);
  -[NEVPNIKEv2SecurityAssociationParameters setDiffieHellmanGroup:](v10, "setDiffieHellmanGroup:", 14LL);
  -[NEVPNIKEv2SecurityAssociationParameters setLifetimeMinutes:](v10, "setLifetimeMinutes:", 60LL);
  unint64_t v11 = (void *)-[NEVPNIKEv2SecurityAssociationParameters copy](v10, "copy");
  [v11 setLifetimeMinutes:30];
  v16[0] = v5;
  v16[1] = v7;
  v16[2] = v9;
  v16[3] = v10;
  [MEMORY[0x189603F18] arrayWithObjects:v16 count:4];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEVPNProtocolIKEv2 setIKESecurityAssociationParametersArray:]( self,  "setIKESecurityAssociationParametersArray:",  v12);

  v15[0] = v6;
  v15[1] = v8;
  v15[2] = v14;
  v15[3] = v11;
  [MEMORY[0x189603F18] arrayWithObjects:v15 count:4];
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEVPNProtocolIKEv2 setChildSecurityAssociationParametersArray:]( self,  "setChildSecurityAssociationParametersArray:",  v13);

  -[NEVPNProtocolIKEv2 setEnablePFS:](self, "setEnablePFS:", 1LL);
  -[NEVPNProtocolIKEv2 setOpportunisticPFS:](self, "setOpportunisticPFS:", 1LL);
}

- (id)copyLegacyDictionary
{
  v49.receiver = self;
  v49.super_class = (Class)&OBJC_CLASS___NEVPNProtocolIKEv2;
  id v3 = -[NEVPNProtocolIPSec copyLegacyDictionary](&v49, sel_copyLegacyDictionary);
  if (!v3) {
    return v3;
  }
  if (-[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate"))
  {
    if (-[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate") == NEVPNIKEv2DeadPeerDetectionRateLow)
    {
      id v4 = kNEIKEv2DeadPeerDetectionRateLowValue;
    }

    else if (-[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate") == NEVPNIKEv2DeadPeerDetectionRateMedium)
    {
      id v4 = kNEIKEv2DeadPeerDetectionRateMediumValue;
    }

    else
    {
      if (-[NEVPNProtocolIKEv2 deadPeerDetectionRate](self, "deadPeerDetectionRate") != NEVPNIKEv2DeadPeerDetectionRateHigh) {
        goto LABEL_11;
      }
      id v4 = kNEIKEv2DeadPeerDetectionRateHighValue;
    }
  }

  else
  {
    id v4 = kNEIKEv2DeadPeerDetectionRateNoneValue;
  }

  [v3 setObject:*v4 forKeyedSubscript:@"DeadPeerDetectionRate"];
LABEL_11:
  -[NEVPNProtocolIKEv2 serverCertificateIssuerCommonName](self, "serverCertificateIssuerCommonName");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NEVPNProtocolIKEv2 serverCertificateIssuerCommonName](self, "serverCertificateIssuerCommonName");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v6 forKeyedSubscript:@"ServerCertificateIssuerCommonName"];
  }

  -[NEVPNProtocolIKEv2 serverCertificateCommonName](self, "serverCertificateCommonName");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NEVPNProtocolIKEv2 serverCertificateCommonName](self, "serverCertificateCommonName");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v8 forKeyedSubscript:@"ServerCertificateCommonName"];
  }

  -[NEVPNProtocolIKEv2 IKESecurityAssociationParameters](self, "IKESecurityAssociationParameters");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = -[NEVPNIKEv2SecurityAssociationParameters copyDictionary](v9);
  [v3 setObject:v10 forKeyedSubscript:@"IKESecurityAssociationParameters"];

  -[NEVPNProtocolIKEv2 childSecurityAssociationParameters](self, "childSecurityAssociationParameters");
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = -[NEVPNIKEv2SecurityAssociationParameters copyDictionary](v11);
  [v3 setObject:v12 forKeyedSubscript:@"ChildSecurityAssociationParameters"];

  if (-[NEVPNProtocolIKEv2 certificateType](self, "certificateType") == NEVPNIKEv2CertificateTypeRSA)
  {
    int v13 = kNEIKEv2CertificateTypeRSAValue;
  }

  else if (-[NEVPNProtocolIKEv2 certificateType](self, "certificateType") == NEVPNIKEv2CertificateTypeECDSA256)
  {
    int v13 = kNEIKEv2CertificateTypeECDSA256Value;
  }

  else if (-[NEVPNProtocolIKEv2 certificateType](self, "certificateType") == NEVPNIKEv2CertificateTypeECDSA384)
  {
    int v13 = kNEIKEv2CertificateTypeECDSA384Value;
  }

  else if (-[NEVPNProtocolIKEv2 certificateType](self, "certificateType") == NEVPNIKEv2CertificateTypeECDSA521)
  {
    int v13 = kNEIKEv2CertificateTypeECDSA521Value;
  }

  else
  {
    if (-[NEVPNProtocolIKEv2 certificateType](self, "certificateType") != (NEVPNIKEv2CertificateTypeECDSA521|NEVPNIKEv2CertificateTypeRSA)) {
      goto LABEL_26;
    }
    int v13 = kNEIKEv2CertificateTypeEd25519Value;
  }

  [v3 setObject:*v13 forKeyedSubscript:@"CertificateType"];
LABEL_26:
  if (-[NEVPNProtocolIPSec useExtendedAuthentication](self, "useExtendedAuthentication")) {
    unint64_t v14 = &unk_18A0CFB10;
  }
  else {
    unint64_t v14 = &unk_18A0CFB28;
  }
  [v3 setObject:v14 forKeyedSubscript:@"ExtendedAuthEnabled"];
  if (-[NEVPNProtocolIKEv2 useConfigurationAttributeInternalIPSubnet]( self,  "useConfigurationAttributeInternalIPSubnet"))
  {
    objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[NEVPNProtocolIKEv2 useConfigurationAttributeInternalIPSubnet](self, "useConfigurationAttributeInternalIPSubnet"));
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v15 forKeyedSubscript:@"UseConfigurationAttributeInternalIPSubnet"];
  }

  if (-[NEVPNProtocolIKEv2 disableMOBIKE](self, "disableMOBIKE"))
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[NEVPNProtocolIKEv2 disableMOBIKE](self, "disableMOBIKE"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v16 forKeyedSubscript:@"DisableMOBIKE"];
  }

  if (-[NEVPNProtocolIKEv2 disableRedirect](self, "disableRedirect"))
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[NEVPNProtocolIKEv2 disableRedirect](self, "disableRedirect"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v17 forKeyedSubscript:@"DisableRedirect"];
  }

  if (-[NEVPNProtocolIKEv2 enablePFS](self, "enablePFS"))
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[NEVPNProtocolIKEv2 enablePFS](self, "enablePFS"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v18 forKeyedSubscript:@"EnablePFS"];
  }

  objc_msgSend( MEMORY[0x189607968],  "numberWithInt:",  -[NEVPNProtocolIKEv2 natKeepAliveOffloadEnable](self, "natKeepAliveOffloadEnable"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v19 forKeyedSubscript:@"NATKeepAliveOffloadEnable"];

  if (-[NEVPNProtocolIKEv2 natKeepAliveOffloadInterval](self, "natKeepAliveOffloadInterval"))
  {
    objc_msgSend( MEMORY[0x189607968],  "numberWithInt:",  -[NEVPNProtocolIKEv2 natKeepAliveOffloadInterval](self, "natKeepAliveOffloadInterval"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v20 forKeyedSubscript:@"NATKeepAliveInterval"];
  }

  if (-[NEVPNProtocolIKEv2 disableMOBIKERetryOnWake](self, "disableMOBIKERetryOnWake"))
  {
    objc_msgSend( MEMORY[0x189607968],  "numberWithInt:",  -[NEVPNProtocolIKEv2 disableMOBIKERetryOnWake](self, "disableMOBIKERetryOnWake"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v21 forKeyedSubscript:@"DisableMOBIKERetryOnWake"];
  }

  if (-[NEVPNProtocolIKEv2 enableRevocationCheck](self, "enableRevocationCheck"))
  {
    objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[NEVPNProtocolIKEv2 enableRevocationCheck](self, "enableRevocationCheck"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v22 forKeyedSubscript:@"EnableCertificateRevocationCheck"];

    if (-[NEVPNProtocolIKEv2 strictRevocationCheck](self, "strictRevocationCheck"))
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[NEVPNProtocolIKEv2 strictRevocationCheck](self, "strictRevocationCheck"));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setObject:v23 forKeyedSubscript:@"StrictCertificateRevocationCheck"];
    }
  }

  if (-[NEVPNProtocolIKEv2 minimumTLSVersion](self, "minimumTLSVersion") == NEVPNIKEv2TLSVersion1_0)
  {
    uint64_t v24 = kNEIKEv2TLSVersion1_0Value;
  }

  else if (-[NEVPNProtocolIKEv2 minimumTLSVersion](self, "minimumTLSVersion") == NEVPNIKEv2TLSVersion1_1)
  {
    uint64_t v24 = kNEIKEv2TLSVersion1_1Value;
  }

  else
  {
    if (-[NEVPNProtocolIKEv2 minimumTLSVersion](self, "minimumTLSVersion") != NEVPNIKEv2TLSVersion1_2) {
      goto LABEL_51;
    }
    uint64_t v24 = kNEIKEv2TLSVersion1_2Value;
  }

  [v3 setObject:*v24 forKeyedSubscript:@"TLSMinimumVersion"];
LABEL_51:
  if (-[NEVPNProtocolIKEv2 maximumTLSVersion](self, "maximumTLSVersion") == NEVPNIKEv2TLSVersion1_0)
  {
    uint64_t v25 = kNEIKEv2TLSVersion1_0Value;
LABEL_57:
    [v3 setObject:*v25 forKeyedSubscript:@"TLSMaximumVersion"];
    goto LABEL_58;
  }

  if (-[NEVPNProtocolIKEv2 maximumTLSVersion](self, "maximumTLSVersion") == NEVPNIKEv2TLSVersion1_1)
  {
    uint64_t v25 = kNEIKEv2TLSVersion1_1Value;
    goto LABEL_57;
  }

  if (-[NEVPNProtocolIKEv2 maximumTLSVersion](self, "maximumTLSVersion") == NEVPNIKEv2TLSVersion1_2)
  {
    uint64_t v25 = kNEIKEv2TLSVersion1_2Value;
    goto LABEL_57;
  }

- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NEVPNProtocolIKEv2;
  -[NEVPNProtocolIPSec syncWithKeychainInDomain:configuration:suffix:]( &v17,  sel_syncWithKeychainInDomain_configuration_suffix_,  a3,  v8,  v9);
  Property = -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
  id v12 = Property;
  if (Property) {
    Property = objc_getProperty(Property, v11, 32LL, 1);
  }
  id v13 = Property;

  if (v13 && [v13 domain] == a3)
  {
    if (v9)
    {
      [v9 stringByAppendingString:@".PPK"];
      unint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      unint64_t v14 = @"PPK";
    }

    -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 identifier];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 syncUsingConfiguration:v8 accountName:v16 passwordType:2 identifierSuffix:v14];
  }
}

- (BOOL)needToUpdateKeychain
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEVPNProtocolIKEv2;
  if (-[NEVPNProtocolIPSec needToUpdateKeychain](&v10, sel_needToUpdateKeychain)) {
    return 1;
  }
  Property = -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
  uint64_t v6 = Property;
  if (Property) {
    Property = objc_getProperty(Property, v5, 32LL, 1);
  }
  id v7 = Property;

  if (v7)
  {
    [v7 data];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v3 = [v8 length] != 0;
  }

  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEVPNProtocolIKEv2;
  -[NEVPNProtocolIPSec removeKeychainItemsInDomain:keepIdentity:]( &v10,  sel_removeKeychainItemsInDomain_keepIdentity_,  a3,  a4);
  Property = -[NEVPNProtocolIKEv2 ppkConfiguration](self, "ppkConfiguration");
  id v8 = Property;
  if (Property) {
    Property = objc_getProperty(Property, v7, 32LL, 1);
  }
  id v9 = Property;

  if (v9 && [v9 domain] == a3) {
    [v9 setIdentifier:0];
  }
}

- (NEVPNIKEv2DeadPeerDetectionRate)deadPeerDetectionRate
{
  return self->_deadPeerDetectionRate;
}

- (void)setDeadPeerDetectionRate:(NEVPNIKEv2DeadPeerDetectionRate)deadPeerDetectionRate
{
  self->_deadPeerDetectionRate = deadPeerDetectionRate;
}

- (NSString)serverCertificateIssuerCommonName
{
  return (NSString *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setServerCertificateIssuerCommonName:(NSString *)serverCertificateIssuerCommonName
{
}

- (NSString)serverCertificateCommonName
{
  return (NSString *)objc_getProperty(self, a2, 280LL, 1);
}

- (void)setServerCertificateCommonName:(NSString *)serverCertificateCommonName
{
}

- (NEVPNIKEv2CertificateType)certificateType
{
  return self->_certificateType;
}

- (void)setCertificateType:(NEVPNIKEv2CertificateType)certificateType
{
  self->_certificateType = certificateType;
}

- (BOOL)useConfigurationAttributeInternalIPSubnet
{
  return self->_useConfigurationAttributeInternalIPSubnet;
}

- (void)setUseConfigurationAttributeInternalIPSubnet:(BOOL)useConfigurationAttributeInternalIPSubnet
{
  self->_useConfigurationAttributeInternalIPSubnet = useConfigurationAttributeInternalIPSubnet;
}

- (NEVPNIKEv2SecurityAssociationParameters)IKESecurityAssociationParameters
{
  return (NEVPNIKEv2SecurityAssociationParameters *)objc_getProperty(self, a2, 296LL, 1);
}

- (NEVPNIKEv2SecurityAssociationParameters)childSecurityAssociationParameters
{
  return (NEVPNIKEv2SecurityAssociationParameters *)objc_getProperty(self, a2, 304LL, 1);
}

- (BOOL)disableMOBIKE
{
  return self->_disableMOBIKE;
}

- (void)setDisableMOBIKE:(BOOL)disableMOBIKE
{
  self->_disableMOBIKE = disableMOBIKE;
}

- (BOOL)disableRedirect
{
  return self->_disableRedirect;
}

- (void)setDisableRedirect:(BOOL)disableRedirect
{
  self->_disableRedirect = disableRedirect;
}

- (BOOL)enablePFS
{
  return self->_enablePFS;
}

- (void)setEnablePFS:(BOOL)enablePFS
{
  self->_enablePFS = enablePFS;
}

- (BOOL)enableRevocationCheck
{
  return self->_enableRevocationCheck;
}

- (void)setEnableRevocationCheck:(BOOL)enableRevocationCheck
{
  self->_enableRevocationCheck = enableRevocationCheck;
}

- (BOOL)strictRevocationCheck
{
  return self->_strictRevocationCheck;
}

- (void)setStrictRevocationCheck:(BOOL)strictRevocationCheck
{
  self->_strictRevocationCheck = strictRevocationCheck;
}

- (NEVPNIKEv2TLSVersion)minimumTLSVersion
{
  return self->_minimumTLSVersion;
}

- (void)setMinimumTLSVersion:(NEVPNIKEv2TLSVersion)minimumTLSVersion
{
  self->_minimumTLSVersion = minimumTLSVersion;
}

- (NEVPNIKEv2TLSVersion)maximumTLSVersion
{
  return self->_maximumTLSVersion;
}

- (void)setMaximumTLSVersion:(NEVPNIKEv2TLSVersion)maximumTLSVersion
{
  self->_maximumTLSVersion = maximumTLSVersion;
}

- (BOOL)enableFallback
{
  return self->_enableFallback;
}

- (void)setEnableFallback:(BOOL)enableFallback
{
  self->_enableFallback = enableFallback;
}

- (NSUInteger)mtu
{
  return self->_mtu;
}

- (void)setMtu:(NSUInteger)mtu
{
  self->_mtu = mtu;
}

- (NEVPNIKEv2PPKConfiguration)ppkConfiguration
{
  return (NEVPNIKEv2PPKConfiguration *)objc_getProperty(self, a2, 336LL, 1);
}

- (void)setPpkConfiguration:(id)a3
{
}

- (NSString)pluginType
{
  return (NSString *)objc_getProperty(self, a2, 344LL, 1);
}

- (NSArray)IKESecurityAssociationParametersArray
{
  return (NSArray *)objc_getProperty(self, a2, 352LL, 1);
}

- (void)setIKESecurityAssociationParametersArray:(id)a3
{
}

- (NSArray)childSecurityAssociationParametersArray
{
  return (NSArray *)objc_getProperty(self, a2, 360LL, 1);
}

- (void)setChildSecurityAssociationParametersArray:(id)a3
{
}

- (NSString)providerBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 368LL, 1);
}

- (void)setProviderBundleIdentifier:(id)a3
{
}

- (int)natKeepAliveOffloadEnable
{
  return self->_natKeepAliveOffloadEnable;
}

- (void)setNatKeepAliveOffloadEnable:(int)a3
{
  self->_natKeepAliveOffloadEnable = a3;
}

- (int)natKeepAliveOffloadInterval
{
  return self->_natKeepAliveOffloadInterval;
}

- (void)setNatKeepAliveOffloadInterval:(int)a3
{
  self->_natKeepAliveOffloadInterval = a3;
}

- (int)disableMOBIKERetryOnWake
{
  return self->_disableMOBIKERetryOnWake;
}

- (void)setDisableMOBIKERetryOnWake:(int)a3
{
  self->_disableMOBIKERetryOnWake = a3;
}

- (BOOL)opportunisticPFS
{
  return self->_opportunisticPFS;
}

- (void)setOpportunisticPFS:(BOOL)a3
{
  self->_opportunisticPFS = a3;
}

- (int64_t)tunnelKind
{
  return self->_tunnelKind;
}

- (void)setTunnelKind:(int64_t)a3
{
  self->_tunnelKind = a3;
}

- (BOOL)disableInitialContact
{
  return self->_disableInitialContact;
}

- (void)setDisableInitialContact:(BOOL)a3
{
  self->_disableInitialContact = a3;
}

- (void).cxx_destruct
{
}

- (void)setPluginType:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v14 = v3;
    uint64_t v4 = [v3 copy];
    uint64_t v5 = (void *)a1[43];
    a1[43] = v4;

    uint64_t v7 = a1[10];
    if (v14)
    {
      if (v7 != 1)
      {
        a1[10] = 1LL;
        id v8 = objc_getProperty(a1, v6, 96LL, 1);
        [v8 setDomain:1];

        [a1 passwordKeychainItem];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 setDomain:1];
      }

      objc_super v10 = @"com.apple.managed.vpn.shared";
      unint64_t v11 = a1;
    }

    else
    {
      if (v7)
      {
        a1[10] = 0LL;
        id v12 = objc_getProperty(a1, v6, 96LL, 1);
        [v12 setDomain:0];

        [a1 passwordKeychainItem];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 setDomain:0];
      }

      unint64_t v11 = a1;
      objc_super v10 = 0LL;
    }

    objc_setProperty_atomic(v11, v6, v10, 88LL);
    id v3 = v14;
  }
}

- (void)initWithPluginType:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_CLASS___NEVPNProtocolIKEv2;
    uint64_t v4 = objc_msgSendSuper2(&v11, sel_initWithType_, 5);
    a1 = v4;
    if (v4)
    {
      -[NEVPNProtocolIKEv2 setPluginType:](v4, v3);
      a1[33] = 2LL;
      uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NEVPNIKEv2SecurityAssociationParameters);
      uint64_t v6 = (void *)a1[37];
      a1[37] = v5;

      uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NEVPNIKEv2SecurityAssociationParameters);
      id v8 = (void *)a1[38];
      a1[38] = v7;

      [(id)a1[37] setLifetimeMinutes:60];
      [(id)a1[38] setLifetimeMinutes:30];
      *((_BYTE *)a1 + 247) = 0;
      a1[36] = 1LL;
      *((_BYTE *)a1 + 240) = 0;
      *((_BYTE *)a1 + 241) = 0;
      *((_BYTE *)a1 + 242) = 0;
      *((_BYTE *)a1 + 243) = 0;
      *((_BYTE *)a1 + 248) = 0;
      *((_DWORD *)a1 + 63) = 0;
      *((_DWORD *)a1 + 64) = 0;
      id v9 = (void *)a1[46];
      a1[46] = 0LL;

      *((_DWORD *)a1 + 65) = 0;
      [a1 setDisconnectOnWake:0];
      [a1 setUseExtendedAuthentication:0];
      a1[47] = 1LL;
      *((_BYTE *)a1 + 249) = 0;
      *((_BYTE *)a1 + 246) = 0;
    }
  }

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end