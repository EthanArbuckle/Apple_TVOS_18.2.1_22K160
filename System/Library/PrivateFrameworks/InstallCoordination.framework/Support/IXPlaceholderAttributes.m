@interface IXPlaceholderAttributes
+ (BOOL)supportsSecureCoding;
- (BOOL)arcadeApp;
- (BOOL)isEqual:(id)a3;
- (BOOL)launchProhibited;
- (BOOL)lsRequiresPostProcessing;
- (BOOL)runsIndependentlyOfCompanionApp;
- (BOOL)watchOnlyApp;
- (IXPlaceholderAttributes)init;
- (IXPlaceholderAttributes)initWithCoder:(id)a3;
- (IXPlaceholderAttributes)initWithInfoPlistDictionary:(id)a3;
- (IXPlaceholderAttributes)initWithInfoPlistFromBundle:(__CFBundle *)a3 error:(id *)a4;
- (IXPlaceholderAttributes)initWithInfoPlistFromBundleURL:(id)a3 error:(id *)a4;
- (NSArray)lsCounterpartIdentifiers;
- (NSArray)sbAppTags;
- (NSArray)uiDeviceFamily;
- (NSDictionary)exAppExtensionAttributes;
- (NSDictionary)extensionDictionary;
- (NSDictionary)requiredDeviceCapabilities;
- (NSDictionary)webKitPushBundleMetadata;
- (NSString)bundleVersion;
- (NSString)companionBundleIdentifierForWatchApp;
- (NSString)minimumOSVersion;
- (NSString)sbIconMasqueradeIdentifier;
- (id)_plistKeys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)infoPlistContent;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setArcadeApp:(BOOL)a3;
- (void)setBundleVersion:(id)a3;
- (void)setCompanionBundleIdentifierForWatchApp:(id)a3;
- (void)setExAppExtensionAttributes:(id)a3;
- (void)setExtensionDictionary:(id)a3;
- (void)setLaunchProhibited:(BOOL)a3;
- (void)setLsCounterpartIdentifiers:(id)a3;
- (void)setLsRequiresPostProcessing:(BOOL)a3;
- (void)setMinimumOSVersion:(id)a3;
- (void)setRequiredDeviceCapabilities:(id)a3;
- (void)setRequiredDeviceCapabilitiesWithArray:(id)a3;
- (void)setRunsIndependentlyOfCompanionApp:(BOOL)a3;
- (void)setSbAppTags:(id)a3;
- (void)setSbIconMasqueradeIdentifier:(id)a3;
- (void)setUiDeviceFamily:(id)a3;
- (void)setWatchOnlyApp:(BOOL)a3;
- (void)setWebKitPushBundleMetadata:(id)a3;
@end

@implementation IXPlaceholderAttributes

- (IXPlaceholderAttributes)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IXPlaceholderAttributes;
  return -[IXPlaceholderAttributes init](&v3, "init");
}

- (IXPlaceholderAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___IXPlaceholderAttributes;
  v5 = -[IXPlaceholderAttributes init](&v42, "init");
  if (v5)
  {
    v5->_launchProhibited = [v4 decodeBoolForKey:@"launchProhibited"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"bundleVersion"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 decodePropertyListForKey:@"extensionDictionary"]);
    extensionDictionary = v5->_extensionDictionary;
    v5->_extensionDictionary = (NSDictionary *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 decodePropertyListForKey:@"exAppExtensionAttributes"]);
    exAppExtensionAttributes = v5->_exAppExtensionAttributes;
    v5->_exAppExtensionAttributes = (NSDictionary *)v11;

    id v13 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"minimumOSVersion"];
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    minimumOSVersion = v5->_minimumOSVersion;
    v5->_minimumOSVersion = (NSString *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 decodePropertyListForKey:@"requiredDeviceCapabilities"]);
    requiredDeviceCapabilities = v5->_requiredDeviceCapabilities;
    v5->_requiredDeviceCapabilities = (NSDictionary *)v16;

    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray);
    v19 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v18,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v20 forKey:@"sbAppTags"]);
    sbAppTags = v5->_sbAppTags;
    v5->_sbAppTags = (NSArray *)v21;

    uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSArray);
    v24 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v23,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    uint64_t v26 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v25 forKey:@"lsCounterpartIdentifiers"]);
    lsCounterpartIdentifiers = v5->_lsCounterpartIdentifiers;
    v5->_lsCounterpartIdentifiers = (NSArray *)v26;

    v5->_lsRequiresPostProcessing = [v4 decodeBoolForKey:@"lsRequiresPostProcessing"];
    id v28 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"sbIconMasqueradeIdentifier"];
    uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
    sbIconMasqueradeIdentifier = v5->_sbIconMasqueradeIdentifier;
    v5->_sbIconMasqueradeIdentifier = (NSString *)v29;

    id v31 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"companionBundleIdentifierForWatchApp"];
    uint64_t v32 = objc_claimAutoreleasedReturnValue(v31);
    companionBundleIdentifierForWatchApp = v5->_companionBundleIdentifierForWatchApp;
    v5->_companionBundleIdentifierForWatchApp = (NSString *)v32;

    v5->_watchOnlyApp = [v4 decodeBoolForKey:@"watchOnlyApp"];
    v5->_runsIndependentlyOfCompanionApp = [v4 decodeBoolForKey:@"runsIndependentlyOfCompanionApp"];
    v5->_arcadeApp = [v4 decodeBoolForKey:@"arcadeApp"];
    uint64_t v34 = objc_claimAutoreleasedReturnValue([v4 decodePropertyListForKey:@"webKitPushBundleMetadata"]);
    webKitPushBundleMetadata = v5->_webKitPushBundleMetadata;
    v5->_webKitPushBundleMetadata = (NSDictionary *)v34;

    uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSArray);
    v37 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v36,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    uint64_t v39 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v38 forKey:@"uiDeviceFamily"]);
    uiDeviceFamily = v5->_uiDeviceFamily;
    v5->_uiDeviceFamily = (NSArray *)v39;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeBool:forKey:",  -[IXPlaceholderAttributes launchProhibited](self, "launchProhibited"),  @"launchProhibited");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes bundleVersion](self, "bundleVersion"));
  [v4 encodeObject:v5 forKey:@"bundleVersion"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes extensionDictionary](self, "extensionDictionary"));
  [v4 encodeObject:v6 forKey:@"extensionDictionary"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes exAppExtensionAttributes](self, "exAppExtensionAttributes"));
  [v4 encodeObject:v7 forKey:@"exAppExtensionAttributes"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes minimumOSVersion](self, "minimumOSVersion"));
  [v4 encodeObject:v8 forKey:@"minimumOSVersion"];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes requiredDeviceCapabilities](self, "requiredDeviceCapabilities"));
  [v4 encodeObject:v9 forKey:@"requiredDeviceCapabilities"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes sbAppTags](self, "sbAppTags"));
  [v4 encodeObject:v10 forKey:@"sbAppTags"];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes lsCounterpartIdentifiers](self, "lsCounterpartIdentifiers"));
  [v4 encodeObject:v11 forKey:@"lsCounterpartIdentifiers"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[IXPlaceholderAttributes lsRequiresPostProcessing](self, "lsRequiresPostProcessing"),  @"lsRequiresPostProcessing");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes sbIconMasqueradeIdentifier](self, "sbIconMasqueradeIdentifier"));
  [v4 encodeObject:v12 forKey:@"sbIconMasqueradeIdentifier"];

  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[IXPlaceholderAttributes companionBundleIdentifierForWatchApp]( self,  "companionBundleIdentifierForWatchApp"));
  [v4 encodeObject:v13 forKey:@"companionBundleIdentifierForWatchApp"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[IXPlaceholderAttributes watchOnlyApp](self, "watchOnlyApp"),  @"watchOnlyApp");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[IXPlaceholderAttributes runsIndependentlyOfCompanionApp](self, "runsIndependentlyOfCompanionApp"),  @"runsIndependentlyOfCompanionApp");
  objc_msgSend(v4, "encodeBool:forKey:", -[IXPlaceholderAttributes arcadeApp](self, "arcadeApp"), @"arcadeApp");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes webKitPushBundleMetadata](self, "webKitPushBundleMetadata"));
  [v4 encodeObject:v14 forKey:@"webKitPushBundleMetadata"];

  id v15 = (id)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes uiDeviceFamily](self, "uiDeviceFamily"));
  [v4 encodeObject:v15 forKey:@"uiDeviceFamily"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    unsigned int v7 = -[IXPlaceholderAttributes launchProhibited](self, "launchProhibited");
    if (v7 != [v6 launchProhibited])
    {
LABEL_3:
      BOOL v8 = 0;
LABEL_20:

      goto LABEL_21;
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes bundleVersion](self, "bundleVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleVersion]);
    id v11 = v9;
    id v12 = v10;
    id v13 = v12;

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes extensionDictionary](self, "extensionDictionary"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 extensionDictionary]);
    id v11 = v14;
    id v16 = v15;
    id v13 = v16;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes exAppExtensionAttributes](self, "exAppExtensionAttributes"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 exAppExtensionAttributes]);
    id v11 = v17;
    id v19 = v18;
    id v13 = v19;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes minimumOSVersion](self, "minimumOSVersion"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v6 minimumOSVersion]);
    id v11 = v20;
    id v22 = v21;
    id v13 = v22;
    if ((v11 != 0) != (v22 != 0) || v11 && v22 && ![v11 isEqual:v22])
    {
LABEL_18:

      BOOL v8 = 0;
    }

    else
    {

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes requiredDeviceCapabilities](self, "requiredDeviceCapabilities"));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v6 requiredDeviceCapabilities]);
      BOOL v26 = sub_10000860C(v24, v25);

      if (!v26) {
        goto LABEL_3;
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes sbAppTags](self, "sbAppTags"));
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v6 sbAppTags]);
      BOOL v29 = sub_10000860C(v27, v28);

      if (!v29) {
        goto LABEL_3;
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes lsCounterpartIdentifiers](self, "lsCounterpartIdentifiers"));
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v6 lsCounterpartIdentifiers]);
      BOOL v32 = sub_10000860C(v30, v31);

      if (!v32) {
        goto LABEL_3;
      }
      unsigned int v33 = -[IXPlaceholderAttributes lsRequiresPostProcessing](self, "lsRequiresPostProcessing");
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes sbIconMasqueradeIdentifier](self, "sbIconMasqueradeIdentifier"));
      v35 = (void *)objc_claimAutoreleasedReturnValue([v6 sbIconMasqueradeIdentifier]);
      BOOL v36 = sub_10000860C(v34, v35);

      if (!v36) {
        goto LABEL_3;
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue( -[IXPlaceholderAttributes companionBundleIdentifierForWatchApp]( self,  "companionBundleIdentifierForWatchApp"));
      v38 = (void *)objc_claimAutoreleasedReturnValue([v6 companionBundleIdentifierForWatchApp]);
      BOOL v39 = sub_10000860C(v37, v38);

      if (!v39) {
        goto LABEL_3;
      }
      unsigned int v40 = -[IXPlaceholderAttributes watchOnlyApp](self, "watchOnlyApp");
      unsigned int v41 = -[IXPlaceholderAttributes runsIndependentlyOfCompanionApp](self, "runsIndependentlyOfCompanionApp");
      unsigned int v42 = -[IXPlaceholderAttributes arcadeApp](self, "arcadeApp");
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes webKitPushBundleMetadata](self, "webKitPushBundleMetadata"));
      v44 = (void *)objc_claimAutoreleasedReturnValue([v6 webKitPushBundleMetadata]);
      BOOL v45 = sub_10000860C(v43, v44);

      if (!v45) {
        goto LABEL_3;
      }
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes uiDeviceFamily](self, "uiDeviceFamily"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 uiDeviceFamily]);
      BOOL v8 = sub_10000860C(v11, v13);
    }

    goto LABEL_20;
  }

  BOOL v8 = 0;
LABEL_21:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = -[IXPlaceholderAttributes launchProhibited](self, "launchProhibited");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes bundleVersion](self, "bundleVersion"));
  unint64_t v5 = (unint64_t)[v4 hash];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes extensionDictionary](self, "extensionDictionary"));
  unint64_t v7 = v5 | (unint64_t)[v6 hash] | v3;

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes exAppExtensionAttributes](self, "exAppExtensionAttributes"));
  unint64_t v9 = (unint64_t)[v8 hash];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes minimumOSVersion](self, "minimumOSVersion"));
  unint64_t v11 = v9 | (unint64_t)[v10 hash];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes requiredDeviceCapabilities](self, "requiredDeviceCapabilities"));
  unint64_t v13 = v7 | v11 | (unint64_t)[v12 hash];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes sbAppTags](self, "sbAppTags"));
  unint64_t v15 = (unint64_t)[v14 hash];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes lsCounterpartIdentifiers](self, "lsCounterpartIdentifiers"));
  unint64_t v17 = v15 | (unint64_t)[v16 hash];

  unint64_t v18 = v17 | -[IXPlaceholderAttributes lsRequiresPostProcessing](self, "lsRequiresPostProcessing");
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes sbIconMasqueradeIdentifier](self, "sbIconMasqueradeIdentifier"));
  unint64_t v20 = v13 | v18 | (unint64_t)[v19 hash];

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[IXPlaceholderAttributes companionBundleIdentifierForWatchApp]( self,  "companionBundleIdentifierForWatchApp"));
  unint64_t v22 = (unint64_t)[v21 hash];

  unint64_t v23 = v22 | -[IXPlaceholderAttributes watchOnlyApp](self, "watchOnlyApp");
  unint64_t v24 = v23 | -[IXPlaceholderAttributes runsIndependentlyOfCompanionApp](self, "runsIndependentlyOfCompanionApp");
  unint64_t v25 = v20 | v24 | -[IXPlaceholderAttributes arcadeApp](self, "arcadeApp");
  BOOL v26 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes webKitPushBundleMetadata](self, "webKitPushBundleMetadata"));
  unint64_t v27 = (unint64_t)[v26 hash];

  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes uiDeviceFamily](self, "uiDeviceFamily"));
  unint64_t v29 = v25 | v27 | (unint64_t)[v28 hash];

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setLaunchProhibited:", -[IXPlaceholderAttributes launchProhibited](self, "launchProhibited"));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes bundleVersion](self, "bundleVersion"));
  [v4 setBundleVersion:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes extensionDictionary](self, "extensionDictionary"));
  [v4 setExtensionDictionary:v6];

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes exAppExtensionAttributes](self, "exAppExtensionAttributes"));
  [v4 setExAppExtensionAttributes:v7];

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes minimumOSVersion](self, "minimumOSVersion"));
  [v4 setMinimumOSVersion:v8];

  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes requiredDeviceCapabilities](self, "requiredDeviceCapabilities"));
  [v4 setRequiredDeviceCapabilities:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes sbAppTags](self, "sbAppTags"));
  [v4 setSbAppTags:v10];

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes lsCounterpartIdentifiers](self, "lsCounterpartIdentifiers"));
  [v4 setLsCounterpartIdentifiers:v11];

  objc_msgSend( v4,  "setLsRequiresPostProcessing:",  -[IXPlaceholderAttributes lsRequiresPostProcessing](self, "lsRequiresPostProcessing"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes sbIconMasqueradeIdentifier](self, "sbIconMasqueradeIdentifier"));
  [v4 setSbIconMasqueradeIdentifier:v12];

  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[IXPlaceholderAttributes companionBundleIdentifierForWatchApp]( self,  "companionBundleIdentifierForWatchApp"));
  [v4 setCompanionBundleIdentifierForWatchApp:v13];

  objc_msgSend(v4, "setWatchOnlyApp:", -[IXPlaceholderAttributes watchOnlyApp](self, "watchOnlyApp"));
  objc_msgSend( v4,  "setRunsIndependentlyOfCompanionApp:",  -[IXPlaceholderAttributes runsIndependentlyOfCompanionApp](self, "runsIndependentlyOfCompanionApp"));
  objc_msgSend(v4, "setArcadeApp:", -[IXPlaceholderAttributes arcadeApp](self, "arcadeApp"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes uiDeviceFamily](self, "uiDeviceFamily"));
  [v4 setUiDeviceFamily:v14];

  return v4;
}

- (id)_plistKeys
{
  return +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  kCFBundleVersionKey,  @"LSApplicationLaunchProhibited",  @"NSExtension",  @"EXAppExtensionAttributes",  @"MinimumOSVersion",  @"UIRequiredDeviceCapabilities",  @"SBAppTags",  @"LSCounterpartIdentifiers",  @"LSRequiresPostProcessing",  @"SBIconMasqueradeIdentifier",  @"WKCompanionAppBundleIdentifier",  @"WKWatchOnly",  @"WKRunsIndependentlyOfCompanionApp",  @"NSApplicationRequiresArcade",  @"WKPushBundleMetadata",  @"UIDeviceFamily",  @"PPBundleMetadata",  0LL);
}

- (IXPlaceholderAttributes)initWithInfoPlistFromBundleURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes _plistKeys](self, "_plistKeys"));
  id v8 = sub_10007817C(v6, v7, a4);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9)
  {
    self = -[IXPlaceholderAttributes initWithInfoPlistDictionary:](self, "initWithInfoPlistDictionary:", v9);
    v10 = self;
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

- (IXPlaceholderAttributes)initWithInfoPlistFromBundle:(__CFBundle *)a3 error:(id *)a4
{
  id v6 = self;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes _plistKeys](self, "_plistKeys"));
  id v8 = sub_1000782C8(a3, v7, a4);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9)
  {
    id v6 = -[IXPlaceholderAttributes initWithInfoPlistDictionary:](v6, "initWithInfoPlistDictionary:", v9);
    v10 = v6;
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

- (IXPlaceholderAttributes)initWithInfoPlistDictionary:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[IXPlaceholderAttributes init](self, "init");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"LSApplicationLaunchProhibited"]);
    -[IXPlaceholderAttributes setLaunchProhibited:](v5, "setLaunchProhibited:", sub_100072D10(v6, 0LL));

    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kCFBundleVersionKey]);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
    id v9 = v7;
    if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0) {
      id v10 = v9;
    }
    else {
      id v10 = 0LL;
    }

    -[IXPlaceholderAttributes setBundleVersion:](v5, "setBundleVersion:", v10);
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"NSExtension"]);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v13 = v11;
    if ((objc_opt_isKindOfClass(v13, v12) & 1) != 0) {
      id v14 = v13;
    }
    else {
      id v14 = 0LL;
    }

    -[IXPlaceholderAttributes setExtensionDictionary:](v5, "setExtensionDictionary:", v14);
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"EXAppExtensionAttributes"]);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v17 = v15;
    if ((objc_opt_isKindOfClass(v17, v16) & 1) != 0) {
      id v18 = v17;
    }
    else {
      id v18 = 0LL;
    }

    -[IXPlaceholderAttributes setExAppExtensionAttributes:](v5, "setExAppExtensionAttributes:", v18);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"MinimumOSVersion"]);
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString);
    id v21 = v19;
    if ((objc_opt_isKindOfClass(v21, v20) & 1) != 0) {
      id v22 = v21;
    }
    else {
      id v22 = 0LL;
    }

    -[IXPlaceholderAttributes setMinimumOSVersion:](v5, "setMinimumOSVersion:", v22);
    unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SBAppTags"]);
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSArray);
    id v25 = v23;
    if ((objc_opt_isKindOfClass(v25, v24) & 1) != 0) {
      id v26 = v25;
    }
    else {
      id v26 = 0LL;
    }

    uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSString);
    id v28 = sub_100072E88(v26, v27);
    unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    -[IXPlaceholderAttributes setSbAppTags:](v5, "setSbAppTags:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"LSCounterpartIdentifiers"]);
    uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSArray);
    id v32 = v30;
    if ((objc_opt_isKindOfClass(v32, v31) & 1) != 0) {
      id v33 = v32;
    }
    else {
      id v33 = 0LL;
    }

    uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSString);
    id v35 = sub_100072E88(v33, v34);
    BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    -[IXPlaceholderAttributes setLsCounterpartIdentifiers:](v5, "setLsCounterpartIdentifiers:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"LSRequiresPostProcessing"]);
    -[IXPlaceholderAttributes setLsRequiresPostProcessing:](v5, "setLsRequiresPostProcessing:", sub_100072D10(v37, 0LL));

    v38 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SBIconMasqueradeIdentifier"]);
    uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSString);
    id v40 = v38;
    if ((objc_opt_isKindOfClass(v40, v39) & 1) != 0) {
      id v41 = v40;
    }
    else {
      id v41 = 0LL;
    }

    -[IXPlaceholderAttributes setSbIconMasqueradeIdentifier:](v5, "setSbIconMasqueradeIdentifier:", v41);
    unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"WKCompanionAppBundleIdentifier"]);
    uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSString);
    id v44 = v42;
    if ((objc_opt_isKindOfClass(v44, v43) & 1) != 0) {
      id v45 = v44;
    }
    else {
      id v45 = 0LL;
    }

    -[IXPlaceholderAttributes setCompanionBundleIdentifierForWatchApp:]( v5,  "setCompanionBundleIdentifierForWatchApp:",  v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"UIRequiredDeviceCapabilities"]);
    uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v48 = v46;
    if ((objc_opt_isKindOfClass(v48, v47) & 1) != 0) {
      id v49 = v48;
    }
    else {
      id v49 = 0LL;
    }

    if (v49)
    {
      id v50 = v48;
      uint64_t v51 = objc_opt_class(&OBJC_CLASS___NSString);
      uint64_t v52 = objc_opt_class(&OBJC_CLASS___NSNumber);
      id v53 = sub_100072FE8(v50, v51, v52);
      v54 = (void *)objc_claimAutoreleasedReturnValue(v53);

      -[IXPlaceholderAttributes setRequiredDeviceCapabilities:](v5, "setRequiredDeviceCapabilities:", v54);
    }

    else
    {
      uint64_t v55 = objc_opt_class(&OBJC_CLASS___NSArray);
      id v56 = v48;
      if ((objc_opt_isKindOfClass(v56, v55) & 1) != 0) {
        id v57 = v56;
      }
      else {
        id v57 = 0LL;
      }

      if (v57) {
        -[IXPlaceholderAttributes setRequiredDeviceCapabilitiesWithArray:]( v5,  "setRequiredDeviceCapabilitiesWithArray:",  v56);
      }
    }

    v58 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"WKWatchOnly"]);
    -[IXPlaceholderAttributes setWatchOnlyApp:](v5, "setWatchOnlyApp:", sub_100072D10(v58, 0LL));

    v59 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"WKRunsIndependentlyOfCompanionApp"]);
    -[IXPlaceholderAttributes setRunsIndependentlyOfCompanionApp:]( v5,  "setRunsIndependentlyOfCompanionApp:",  sub_100072D10(v59, 0LL));

    v60 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"NSApplicationRequiresArcade"]);
    -[IXPlaceholderAttributes setArcadeApp:](v5, "setArcadeApp:", sub_100072D10(v60, 0LL));

    v61 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"WKPushBundleMetadata"]);
    uint64_t v62 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v63 = v61;
    if ((objc_opt_isKindOfClass(v63, v62) & 1) != 0) {
      id v64 = v63;
    }
    else {
      id v64 = 0LL;
    }

    -[IXPlaceholderAttributes setWebKitPushBundleMetadata:](v5, "setWebKitPushBundleMetadata:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"UIDeviceFamily"]);
    uint64_t v66 = objc_opt_class(&OBJC_CLASS___NSArray);
    id v67 = v65;
    if ((objc_opt_isKindOfClass(v67, v66) & 1) != 0) {
      id v68 = v67;
    }
    else {
      id v68 = 0LL;
    }

    if (v68)
    {
      id v79 = v48;
      v80 = v5;
      v69 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      id v70 = v68;
      id v71 = [v70 countByEnumeratingWithState:&v81 objects:v85 count:16];
      if (v71)
      {
        id v72 = v71;
        uint64_t v73 = *(void *)v82;
        do
        {
          for (i = 0LL; i != v72; i = (char *)i + 1)
          {
            if (*(void *)v82 != v73) {
              objc_enumerationMutation(v70);
            }
            v75 = *(void **)(*((void *)&v81 + 1) + 8LL * (void)i);
            if ((objc_opt_respondsToSelector(v75, "intValue") & 1) != 0)
            {
              v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v75 intValue]));
              -[NSMutableArray addObject:](v69, "addObject:", v76);
            }
          }

          id v72 = [v70 countByEnumeratingWithState:&v81 objects:v85 count:16];
        }

        while (v72);
      }

      id v77 = -[NSMutableArray copy](v69, "copy");
      unint64_t v5 = v80;
      -[IXPlaceholderAttributes setUiDeviceFamily:](v80, "setUiDeviceFamily:", v77);

      id v48 = v79;
    }
  }

  return v5;
}

- (void)setRequiredDeviceCapabilitiesWithArray:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v10);
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
        id v13 = v11;
        if ((objc_opt_isKindOfClass(v13, v12) & 1) != 0) {
          id v14 = v13;
        }
        else {
          id v14 = 0LL;
        }

        if (v14) {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  v13,  (void)v16);
        }
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  if (-[NSMutableDictionary count](v5, "count"))
  {
    id v15 = -[NSMutableDictionary copy](v5, "copy");
    -[IXPlaceholderAttributes setRequiredDeviceCapabilities:](self, "setRequiredDeviceCapabilities:", v15);
  }
}

- (id)infoPlistContent
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  if (-[IXPlaceholderAttributes launchProhibited](self, "launchProhibited")) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"LSApplicationLaunchProhibited");
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes bundleVersion](self, "bundleVersion"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, kCFBundleVersionKey);

  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes extensionDictionary](self, "extensionDictionary"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"NSExtension");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes exAppExtensionAttributes](self, "exAppExtensionAttributes"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v6,  @"EXAppExtensionAttributes");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes minimumOSVersion](self, "minimumOSVersion"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"MinimumOSVersion");

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes requiredDeviceCapabilities](self, "requiredDeviceCapabilities"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v8,  @"UIRequiredDeviceCapabilities");

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes sbAppTags](self, "sbAppTags"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"SBAppTags");

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes lsCounterpartIdentifiers](self, "lsCounterpartIdentifiers"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v10,  @"LSCounterpartIdentifiers");

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes sbIconMasqueradeIdentifier](self, "sbIconMasqueradeIdentifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v11,  @"SBIconMasqueradeIdentifier");

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[IXPlaceholderAttributes companionBundleIdentifierForWatchApp]( self,  "companionBundleIdentifierForWatchApp"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v12,  @"WKCompanionAppBundleIdentifier");

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes webKitPushBundleMetadata](self, "webKitPushBundleMetadata"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v13,  @"WKPushBundleMetadata");

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes uiDeviceFamily](self, "uiDeviceFamily"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, @"UIDeviceFamily");

  if (-[IXPlaceholderAttributes watchOnlyApp](self, "watchOnlyApp")) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"WKWatchOnly");
  }
  if (-[IXPlaceholderAttributes runsIndependentlyOfCompanionApp](self, "runsIndependentlyOfCompanionApp")) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"WKRunsIndependentlyOfCompanionApp");
  }
  if (-[IXPlaceholderAttributes arcadeApp](self, "arcadeApp")) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"NSApplicationRequiresArcade");
  }
  if (-[IXPlaceholderAttributes lsRequiresPostProcessing](self, "lsRequiresPostProcessing")) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"LSRequiresPostProcessing");
  }
  id v15 = -[NSMutableDictionary copy](v3, "copy");

  return v15;
}

- (id)description
{
  uint64_t v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXPlaceholderAttributes infoPlistContent](self, "infoPlistContent"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@<%p> : %@>",  v5,  self,  v6));

  return v7;
}

- (BOOL)launchProhibited
{
  return self->_launchProhibited;
}

- (void)setLaunchProhibited:(BOOL)a3
{
  self->_launchProhibited = a3;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSDictionary)extensionDictionary
{
  return self->_extensionDictionary;
}

- (void)setExtensionDictionary:(id)a3
{
}

- (NSDictionary)exAppExtensionAttributes
{
  return self->_exAppExtensionAttributes;
}

- (void)setExAppExtensionAttributes:(id)a3
{
}

- (NSString)minimumOSVersion
{
  return self->_minimumOSVersion;
}

- (void)setMinimumOSVersion:(id)a3
{
}

- (NSDictionary)requiredDeviceCapabilities
{
  return self->_requiredDeviceCapabilities;
}

- (void)setRequiredDeviceCapabilities:(id)a3
{
}

- (NSArray)sbAppTags
{
  return self->_sbAppTags;
}

- (void)setSbAppTags:(id)a3
{
}

- (NSArray)lsCounterpartIdentifiers
{
  return self->_lsCounterpartIdentifiers;
}

- (void)setLsCounterpartIdentifiers:(id)a3
{
}

- (NSString)sbIconMasqueradeIdentifier
{
  return self->_sbIconMasqueradeIdentifier;
}

- (void)setSbIconMasqueradeIdentifier:(id)a3
{
}

- (NSString)companionBundleIdentifierForWatchApp
{
  return self->_companionBundleIdentifierForWatchApp;
}

- (void)setCompanionBundleIdentifierForWatchApp:(id)a3
{
}

- (BOOL)watchOnlyApp
{
  return self->_watchOnlyApp;
}

- (void)setWatchOnlyApp:(BOOL)a3
{
  self->_watchOnlyApp = a3;
}

- (BOOL)runsIndependentlyOfCompanionApp
{
  return self->_runsIndependentlyOfCompanionApp;
}

- (void)setRunsIndependentlyOfCompanionApp:(BOOL)a3
{
  self->_runsIndependentlyOfCompanionApp = a3;
}

- (BOOL)arcadeApp
{
  return self->_arcadeApp;
}

- (void)setArcadeApp:(BOOL)a3
{
  self->_arcadeApp = a3;
}

- (NSDictionary)webKitPushBundleMetadata
{
  return self->_webKitPushBundleMetadata;
}

- (void)setWebKitPushBundleMetadata:(id)a3
{
}

- (BOOL)lsRequiresPostProcessing
{
  return self->_lsRequiresPostProcessing;
}

- (void)setLsRequiresPostProcessing:(BOOL)a3
{
  self->_lsRequiresPostProcessing = a3;
}

- (NSArray)uiDeviceFamily
{
  return self->_uiDeviceFamily;
}

- (void)setUiDeviceFamily:(id)a3
{
}

- (void).cxx_destruct
{
}

@end