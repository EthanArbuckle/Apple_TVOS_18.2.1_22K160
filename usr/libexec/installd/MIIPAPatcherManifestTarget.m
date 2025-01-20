@interface MIIPAPatcherManifestTarget
- (MIIPAPatcherManifestTarget)initWithCFBundleVersion:(id)a3 cfBundleShortVersion:(id)a4 bundleIdentifier:(id)a5 uiSupportedDevices:(id)a6 infoPlistHash:(id)a7 infoPlistHashAlgorithm:(id)a8;
- (NSArray)uiSupportedDevices;
- (NSString)bundleIdentifier;
- (NSString)cfBundleShortVersion;
- (NSString)cfBundleVersion;
- (NSString)infoPlistHash;
- (NSString)infoPlistHashAlgorithm;
- (id)plistRepresentation;
@end

@implementation MIIPAPatcherManifestTarget

- (MIIPAPatcherManifestTarget)initWithCFBundleVersion:(id)a3 cfBundleShortVersion:(id)a4 bundleIdentifier:(id)a5 uiSupportedDevices:(id)a6 infoPlistHash:(id)a7 infoPlistHashAlgorithm:(id)a8
{
  id v22 = a3;
  id v21 = a4;
  id v20 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MIIPAPatcherManifestTarget;
  v18 = -[MIIPAPatcherManifestTarget init](&v23, "init");
  if (v18)
  {
    if (qword_100095AB8 != -1) {
      dispatch_once(&qword_100095AB8, &stru_100080E18);
    }
    objc_storeStrong((id *)&v18->_cfBundleVersion, a3);
    objc_storeStrong((id *)&v18->_cfBundleShortVersion, a4);
    objc_storeStrong((id *)&v18->_bundleIdentifier, a5);
    objc_storeStrong((id *)&v18->_uiSupportedDevices, a6);
    objc_storeStrong((id *)&v18->_infoPlistHash, a7);
    objc_storeStrong((id *)&v18->_infoPlistHashAlgorithm, a8);
  }

  return v18;
}

- (id)plistRepresentation
{
  v14[0] = kCFBundleVersionKey;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifestTarget cfBundleVersion](self, "cfBundleVersion"));
  v15[0] = v3;
  v14[1] = _kCFBundleShortVersionStringKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifestTarget cfBundleShortVersion](self, "cfBundleShortVersion"));
  v15[1] = v4;
  v14[2] = kCFBundleIdentifierKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifestTarget bundleIdentifier](self, "bundleIdentifier"));
  v15[2] = v5;
  v14[3] = @"infoPlistHash";
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifestTarget infoPlistHash](self, "infoPlistHash"));
  v15[3] = v6;
  v14[4] = @"infoPlistHashAlgorithm";
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifestTarget infoPlistHashAlgorithm](self, "infoPlistHashAlgorithm"));
  v15[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  5LL));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifestTarget uiSupportedDevices](self, "uiSupportedDevices"));
  if (v9)
  {
    id v10 = [v8 mutableCopy];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifestTarget uiSupportedDevices](self, "uiSupportedDevices"));
    [v10 setObject:v11 forKeyedSubscript:@"UISupportedDevices"];

    id v12 = [v10 copy];
    v8 = v12;
  }

  return v8;
}

- (NSString)cfBundleVersion
{
  return self->_cfBundleVersion;
}

- (NSString)cfBundleShortVersion
{
  return self->_cfBundleShortVersion;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSArray)uiSupportedDevices
{
  return self->_uiSupportedDevices;
}

- (NSString)infoPlistHash
{
  return self->_infoPlistHash;
}

- (NSString)infoPlistHashAlgorithm
{
  return self->_infoPlistHashAlgorithm;
}

- (void).cxx_destruct
{
}

@end