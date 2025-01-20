@interface RBSLaunchContext
+ (BOOL)supportsRBSXPCSecureCoding;
+ (id)context;
+ (id)contextWithIdentity:(id)a3;
+ (id)contextWithLSAppID:(id)a3;
- (BOOL)calculatedContainerIdentifier;
- (BOOL)forceSubmit;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTesting;
- (BOOL)lsManageRoleOnly;
- (LSApplicationIdentity)appID;
- (NSArray)_additionalMachServices;
- (NSArray)arguments;
- (NSArray)attributes;
- (NSArray)lsBinpref;
- (NSArray)lsBinprefSubtype;
- (NSDictionary)_additionalEnvironment;
- (NSDictionary)extensionOverlay;
- (NSDictionary)spawnConstraint;
- (NSNumber)preventContainerization;
- (NSNumber)requiredSequenceNumber;
- (NSSet)managedEndpointLaunchIdentifiers;
- (NSString)_overrideExecutablePath;
- (NSString)beforeTranslocationBundlePath;
- (NSString)bundleIdentifier;
- (NSString)containerIdentifier;
- (NSString)explanation;
- (NSString)homeDirectory;
- (NSString)managedPersona;
- (NSString)standardErrorPath;
- (NSString)standardInPath;
- (NSString)standardOutputPath;
- (NSString)tmpDirectory;
- (NSUUID)oneShotUUID;
- (NSUUID)requiredCacheUUID;
- (RBProcess)hostProcess;
- (RBSLaunchContext)initWithRBSXPCCoder:(id)a3;
- (RBSProcessHandle)requestorHandle;
- (RBSProcessIdentifier)requiredExistingProcess;
- (RBSProcessIdentity)identity;
- (id)copyWithZone:(_NSZone *)a3;
- (int)hostPid;
- (unint64_t)executionOptions;
- (unint64_t)hash;
- (unint64_t)lsSpawnFlags;
- (unsigned)dextCheckInPort;
- (unsigned)initialRole;
- (unsigned)lsInitialRole;
- (unsigned)lsPersona;
- (unsigned)lsUMask;
- (unsigned)spawnType;
- (void)_setAdditionalEnvironment:(id)a3;
- (void)_setAdditionalMachServices:(id)a3;
- (void)_setOverrideExecutablePath:(id)a3;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setAppID:(id)a3;
- (void)setArguments:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setBeforeTranslocationBundlePath:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCalculatedContainerIdentifier:(BOOL)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setDextCheckInPort:(unsigned int)a3;
- (void)setExecutionOptions:(unint64_t)a3;
- (void)setExplanation:(id)a3;
- (void)setExtensionOverlay:(id)a3;
- (void)setForceSubmit:(BOOL)a3;
- (void)setHomeDirectory:(id)a3;
- (void)setHostPid:(int)a3;
- (void)setHostProcess:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setInitialRole:(unsigned __int8)a3;
- (void)setLsBinpref:(id)a3;
- (void)setLsBinprefSubtype:(id)a3;
- (void)setLsInitialRole:(unsigned int)a3;
- (void)setLsManageRoleOnly:(BOOL)a3;
- (void)setLsPersona:(unsigned int)a3;
- (void)setLsSpawnFlags:(unint64_t)a3;
- (void)setLsUMask:(unsigned __int16)a3;
- (void)setManagedEndpointLaunchIdentifiers:(id)a3;
- (void)setManagedPersona:(id)a3;
- (void)setOneShotUUID:(id)a3;
- (void)setPreventContainerization:(id)a3;
- (void)setRequestorHandle:(id)a3;
- (void)setRequiredCacheUUID:(id)a3;
- (void)setRequiredExistingProcess:(id)a3;
- (void)setRequiredSequenceNumber:(id)a3;
- (void)setSpawnConstraint:(id)a3;
- (void)setSpawnType:(unsigned __int8)a3;
- (void)setStandardErrorPath:(id)a3;
- (void)setStandardInPath:(id)a3;
- (void)setStandardOutputPath:(id)a3;
- (void)setTesting:(BOOL)a3;
- (void)setTmpDirectory:(id)a3;
@end

@implementation RBSLaunchContext

+ (id)context
{
  return objc_alloc_init((Class)a1);
}

+ (id)contextWithIdentity:(id)a3
{
  id v4 = a3;
  [a1 context];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setIdentity:v4];

  return v5;
}

+ (id)contextWithLSAppID:(id)a3
{
  id v4 = a3;
  [a1 context];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setAppID:v4];

  return v5;
}

- (void)setIdentity:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_identity, a3);
  v5 = -[RBSProcessIdentity embeddedApplicationIdentifier](self->_identity, "embeddedApplicationIdentifier");
  if (v5)
  {
    -[RBSProcessIdentity embeddedApplicationIdentifier](self->_identity, "embeddedApplicationIdentifier");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v6;
  }
}

- (void)setBundleIdentifier:(id)a3
{
  id v6 = a3;
  v5 = -[RBSProcessIdentity embeddedApplicationIdentifier](self->_identity, "embeddedApplicationIdentifier");
  if (!v5) {
    objc_storeStrong((id *)&self->_bundleIdentifier, a3);
  }
}

- (unsigned)lsInitialRole
{
  return RBSDarwinRoleFromRBSRole(self->_initialRole);
}

- (void)setLsInitialRole:(unsigned int)a3
{
  self->_initialRole = RBSRoleFromDarwinRole(a3);
}

- (unsigned)dextCheckInPort
{
  return -[RBSMachPort port](self->_dextCheckInPort, "port");
}

- (void)setDextCheckInPort:(unsigned int)a3
{
  id v4 = (RBSMachPort *)objc_claimAutoreleasedReturnValue();
  dextCheckInPort = self->_dextCheckInPort;
  self->_dextCheckInPort = v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSLaunchContext *)a3;
  if (self == v4) {
    goto LABEL_71;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_3;
  }
  identity = self->_identity;
  if (identity != v4->_identity && !-[RBSProcessIdentity isEqual:](identity, "isEqual:")) {
    goto LABEL_3;
  }
  appID = self->_appID;
  overrideExecutablePath = self->__overrideExecutablePath;
  if (overrideExecutablePath != v4->__overrideExecutablePath
    && !-[NSString isEqualToString:](overrideExecutablePath, "isEqualToString:"))
  {
    goto LABEL_3;
  }

  arguments = self->_arguments;
  if (arguments != v4->_arguments && !-[NSArray isEqualToArray:](arguments, "isEqualToArray:")) {
    goto LABEL_3;
  }
  additionalMachServices = self->__additionalMachServices;
  if (additionalMachServices != v4->__additionalMachServices
    && !-[NSArray isEqualToArray:](additionalMachServices, "isEqualToArray:"))
  {
    goto LABEL_3;
  }

  if (self->_executionOptions != v4->_executionOptions) {
    goto LABEL_3;
  }
  additionalEnvironment = self->__additionalEnvironment;
  if (additionalEnvironment != v4->__additionalEnvironment
    && !-[NSDictionary isEqualToDictionary:](additionalEnvironment, "isEqualToDictionary:"))
  {
    goto LABEL_3;
  }

  standardOutputPath = self->_standardOutputPath;
  if (standardOutputPath != v4->_standardOutputPath
    && !-[NSString isEqualToString:](standardOutputPath, "isEqualToString:"))
  {
    goto LABEL_3;
  }

  standardErrorPath = self->_standardErrorPath;
  if (standardErrorPath != v4->_standardErrorPath
    && !-[NSString isEqualToString:](standardErrorPath, "isEqualToString:"))
  {
    goto LABEL_3;
  }

  standardInPath = self->_standardInPath;
  if (standardInPath != v4->_standardInPath && !-[NSString isEqualToString:](standardInPath, "isEqualToString:")) {
    goto LABEL_3;
  }
  managedPersona = self->_managedPersona;
  if (managedPersona != v4->_managedPersona && !-[NSString isEqualToString:](managedPersona, "isEqualToString:")) {
    goto LABEL_3;
  }
  if (self->_spawnType != v4->_spawnType) {
    goto LABEL_3;
  }
  attributes = self->_attributes;
  if (attributes != v4->_attributes && !-[NSArray isEqualToArray:](attributes, "isEqualToArray:")) {
    goto LABEL_3;
  }
  managedEndpointLaunchIdentifiers = self->_managedEndpointLaunchIdentifiers;
  if (managedEndpointLaunchIdentifiers != v4->_managedEndpointLaunchIdentifiers
    && !-[NSSet isEqualToSet:](managedEndpointLaunchIdentifiers, "isEqualToSet:"))
  {
    goto LABEL_3;
  }

  explanation = self->_explanation;
  if (explanation != v4->_explanation && !-[NSString isEqualToString:](explanation, "isEqualToString:")) {
    goto LABEL_3;
  }
  if (self->_lsManageRoleOnly != v4->_lsManageRoleOnly
    || self->_lsSpawnFlags != v4->_lsSpawnFlags
    || self->_lsUMask != v4->_lsUMask)
  {
    goto LABEL_3;
  }

  lsBinpref = self->_lsBinpref;
  v21 = v4->_lsBinpref;
  if (lsBinpref != v21)
  {
    BOOL v6 = 0;
    if (!lsBinpref || !v21) {
      goto LABEL_72;
    }
  }

  lsBinprefSubtype = self->_lsBinprefSubtype;
  v23 = v4->_lsBinprefSubtype;
  if (lsBinprefSubtype != v23)
  {
    BOOL v6 = 0;
    if (!lsBinprefSubtype || !v23) {
      goto LABEL_72;
    }
  }

  if (self->_initialRole != v4->_initialRole) {
    goto LABEL_3;
  }
  if (self->_lsPersona != v4->_lsPersona) {
    goto LABEL_3;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier != v4->_bundleIdentifier && !-[NSString isEqualToString:](bundleIdentifier, "isEqualToString:")) {
    goto LABEL_3;
  }
  if (self->_hostPid != v4->_hostPid) {
    goto LABEL_3;
  }
  extensionOverlay = self->_extensionOverlay;
  if (extensionOverlay != v4->_extensionOverlay
    && !-[NSDictionary isEqualToDictionary:](extensionOverlay, "isEqualToDictionary:"))
  {
    goto LABEL_3;
  }

  oneShotUUID = self->_oneShotUUID;
  if (self->_forceSubmit != v4->_forceSubmit) {
    goto LABEL_3;
  }
  beforeTranslocationBundlePath = self->_beforeTranslocationBundlePath;
  if (beforeTranslocationBundlePath != v4->_beforeTranslocationBundlePath
    && !-[NSString isEqualToString:](beforeTranslocationBundlePath, "isEqualToString:"))
  {
    goto LABEL_3;
  }

  homeDirectory = self->_homeDirectory;
  if (homeDirectory != v4->_homeDirectory && !-[NSString isEqualToString:](homeDirectory, "isEqualToString:")) {
    goto LABEL_3;
  }
  tmpDirectory = self->_tmpDirectory;
  if (tmpDirectory != v4->_tmpDirectory && !-[NSString isEqualToString:](tmpDirectory, "isEqualToString:")) {
    goto LABEL_3;
  }
  requiredExistingProcess = self->_requiredExistingProcess;
  if (requiredExistingProcess != v4->_requiredExistingProcess
    && !-[RBSProcessIdentifier isEqual:](requiredExistingProcess, "isEqual:"))
  {
    goto LABEL_3;
  }

  preventContainerization = self->_preventContainerization;
  if (preventContainerization != v4->_preventContainerization
    && !-[NSNumber isEqual:](preventContainerization, "isEqual:"))
  {
    goto LABEL_3;
  }

  containerIdentifier = self->_containerIdentifier;
  if (containerIdentifier != v4->_containerIdentifier
    && !-[NSString isEqual:](containerIdentifier, "isEqual:"))
  {
    goto LABEL_3;
  }

  dextCheckInPort = self->_dextCheckInPort;
  v34 = v4->_dextCheckInPort;
  if (dextCheckInPort == v34)
  {
LABEL_69:
    spawnConstraint = self->_spawnConstraint;
    if (spawnConstraint == v4->_spawnConstraint
      || -[NSDictionary isEqualToDictionary:](spawnConstraint, "isEqualToDictionary:"))
    {
LABEL_71:
      BOOL v6 = 1;
      goto LABEL_72;
    }

    goto LABEL_3;
  }

  BOOL v6 = 0;
  if (dextCheckInPort && v34)
  {
    if (-[RBSMachPort isEqual:](dextCheckInPort, "isEqual:")) {
      goto LABEL_69;
    }
LABEL_3:
    BOOL v6 = 0;
  }

- (unint64_t)hash
{
  return -[RBSProcessIdentity hash](self->_identity, "hash");
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  -[RBSLaunchContext identity](self, "identity");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"_identity"];

  -[RBSLaunchContext arguments](self, "arguments");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeCollection:v6 forKey:@"_arguments"];

  objc_msgSend( v4,  "encodeUInt64:forKey:",  -[RBSLaunchContext executionOptions](self, "executionOptions"),  @"_executionOptions");
  v7 = -[RBSLaunchContext _overrideExecutablePath](self, "_overrideExecutablePath");
  [v4 encodeObject:v7 forKey:@"__overrideExecutablePath"];

  -[RBSLaunchContext _additionalMachServices](self, "_additionalMachServices");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeCollection:v8 forKey:@"__additionalMachServices"];
  v9 = -[RBSLaunchContext _additionalEnvironment](self, "_additionalEnvironment");
  [v4 encodeObject:v9 forKey:@"__additionalEnvironment"];
  v10 = -[RBSLaunchContext standardOutputPath](self, "standardOutputPath");
  [v4 encodeObject:v10 forKey:@"_standardOutputPath"];
  v11 = -[RBSLaunchContext standardErrorPath](self, "standardErrorPath");
  [v4 encodeObject:v11 forKey:@"_standardErrorPath"];
  v12 = -[RBSLaunchContext standardInPath](self, "standardInPath");
  [v4 encodeObject:v12 forKey:@"_standardInPath"];
  v13 = -[RBSLaunchContext attributes](self, "attributes");
  [v4 encodeCollection:v13 forKey:@"_attributes"];
  v14 = -[RBSLaunchContext managedEndpointLaunchIdentifiers](self, "managedEndpointLaunchIdentifiers");
  [v4 encodeCollection:v14 forKey:@"_managedEndpointLaunchIdentifiers"];
  v15 = -[RBSLaunchContext explanation](self, "explanation");
  [v4 encodeObject:v15 forKey:@"_explanation"];
  v16 = -[RBSLaunchContext managedPersona](self, "managedPersona");
  [v4 encodeObject:v16 forKey:@"_managedPersona"];

  objc_msgSend(v4, "encodeUInt64:forKey:", -[RBSLaunchContext spawnType](self, "spawnType"), @"_spawnType");
  objc_msgSend( v4,  "encodeUInt64:forKey:",  -[RBSLaunchContext lsManageRoleOnly](self, "lsManageRoleOnly"),  @"_lsManageRoleOnly");
  objc_msgSend( v4,  "encodeUInt64:forKey:",  -[RBSLaunchContext lsSpawnFlags](self, "lsSpawnFlags"),  @"_lsSpawnFlags");
  objc_msgSend(v4, "encodeUInt64:forKey:", -[RBSLaunchContext lsUMask](self, "lsUMask"), @"_lsUMask");
  v17 = -[RBSLaunchContext lsBinpref](self, "lsBinpref");
  [v4 encodeCollection:v17 forKey:@"_lsBinpref"];
  v18 = -[RBSLaunchContext lsBinprefSubtype](self, "lsBinprefSubtype");
  [v4 encodeCollection:v18 forKey:@"_lsBinprefSubtype"];

  objc_msgSend(v4, "encodeUInt64:forKey:", -[RBSLaunchContext initialRole](self, "initialRole"), @"_initialRole");
  objc_msgSend(v4, "encodeUInt64:forKey:", -[RBSLaunchContext lsPersona](self, "lsPersona"), @"_lsPersona");
  v19 = -[RBSLaunchContext bundleIdentifier](self, "bundleIdentifier");
  [v4 encodeObject:v19 forKey:@"_bundleIdentifier"];

  objc_msgSend(v4, "encodeUInt64:forKey:", -[RBSLaunchContext hostPid](self, "hostPid"), @"_hostPid");
  v20 = -[RBSLaunchContext extensionOverlay](self, "extensionOverlay");
  [v4 encodeObject:v20 forKey:@"_extensionOverlay"];
  v21 = -[RBSLaunchContext oneShotUUID](self, "oneShotUUID");
  [v4 encodeObject:v21 forKey:@"_oneShotUUID"];

  objc_msgSend(v4, "encodeUInt64:forKey:", -[RBSLaunchContext forceSubmit](self, "forceSubmit"), @"_forceSubmit");
  v22 = -[RBSLaunchContext beforeTranslocationBundlePath](self, "beforeTranslocationBundlePath");
  [v4 encodeObject:v22 forKey:@"_beforeTranslocationBundlePath"];
  v23 = -[RBSLaunchContext homeDirectory](self, "homeDirectory");
  [v4 encodeObject:v23 forKey:@"_homeDirectory"];
  v24 = -[RBSLaunchContext tmpDirectory](self, "tmpDirectory");
  [v4 encodeObject:v24 forKey:@"_tmpDirectory"];
  v25 = -[RBSLaunchContext requiredExistingProcess](self, "requiredExistingProcess");
  [v4 encodeObject:v25 forKey:@"_requiredExistingProcess"];
  v26 = -[RBSLaunchContext preventContainerization](self, "preventContainerization");
  [v4 encodeObject:v26 forKey:@"_preventContainerization"];
  v27 = -[RBSLaunchContext containerIdentifier](self, "containerIdentifier");
  [v4 encodeObject:v27 forKey:@"_containerIdentifier"];
  v28 = -[RBSLaunchContext appID](self, "appID");
  [v4 encodeObject:v28 forKey:@"_appID"];

  [v4 encodeObject:self->_dextCheckInPort forKey:@"_dextCheckInPort"];
  -[RBSLaunchContext spawnConstraint](self, "spawnConstraint");
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v29 forKey:@"_spawnConstraint"];
}

- (RBSLaunchContext)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___RBSLaunchContext;
  uint64_t v5 = -[RBSLaunchContext init](&v40, sel_init);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identity"];
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setIdentity:](v5, "setIdentity:", v6);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_appID"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setAppID:](v5, "setAppID:", v7);

    uint64_t v8 = objc_opt_class();
    [v4 decodeCollectionOfClass:v8 containingClass:objc_opt_class() forKey:@"_arguments"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setArguments:](v5, "setArguments:", v9);

    -[RBSLaunchContext setExecutionOptions:]( v5,  "setExecutionOptions:",  [v4 decodeUInt64ForKey:@"_executionOptions"]);
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__overrideExecutablePath"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext _setOverrideExecutablePath:](v5, "_setOverrideExecutablePath:", v10);

    uint64_t v11 = objc_opt_class();
    [v4 decodeCollectionOfClass:v11 containingClass:objc_opt_class() forKey:@"__additionalMachServices"];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext _setAdditionalMachServices:](v5, "_setAdditionalMachServices:", v12);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__additionalEnvironment"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext _setAdditionalEnvironment:](v5, "_setAdditionalEnvironment:", v13);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_standardOutputPath"];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setStandardOutputPath:](v5, "setStandardOutputPath:", v14);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_standardErrorPath"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setStandardErrorPath:](v5, "setStandardErrorPath:", v15);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_standardInPath"];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setStandardInPath:](v5, "setStandardInPath:", v16);

    uint64_t v17 = objc_opt_class();
    [v4 decodeCollectionOfClass:v17 containingClass:objc_opt_class() forKey:@"_attributes"];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setAttributes:](v5, "setAttributes:", v18);

    uint64_t v19 = objc_opt_class();
    [v4 decodeCollectionOfClass:v19 containingClass:objc_opt_class() forKey:@"_managedEndpointLaunchIdentifiers"];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setManagedEndpointLaunchIdentifiers:](v5, "setManagedEndpointLaunchIdentifiers:", v20);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_explanation"];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setExplanation:](v5, "setExplanation:", v21);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_managedPersona"];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setManagedPersona:](v5, "setManagedPersona:", v22);

    -[RBSLaunchContext setSpawnType:]( v5,  "setSpawnType:",  [v4 decodeUInt64ForKey:@"_spawnType"]);
    -[RBSLaunchContext setLsManageRoleOnly:]( v5,  "setLsManageRoleOnly:",  [v4 decodeUInt64ForKey:@"_lsManageRoleOnly"] != 0);
    -[RBSLaunchContext setLsSpawnFlags:]( v5,  "setLsSpawnFlags:",  [v4 decodeUInt64ForKey:@"_lsSpawnFlags"]);
    -[RBSLaunchContext setLsUMask:]( v5,  "setLsUMask:",  (unsigned __int16)[v4 decodeUInt64ForKey:@"_lsUMask"]);
    uint64_t v23 = objc_opt_class();
    [v4 decodeCollectionOfClass:v23 containingClass:objc_opt_class() forKey:@"_lsBinpref"];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setLsBinpref:](v5, "setLsBinpref:", v24);

    uint64_t v25 = objc_opt_class();
    [v4 decodeCollectionOfClass:v25 containingClass:objc_opt_class() forKey:@"_lsBinprefSubtype"];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setLsBinprefSubtype:](v5, "setLsBinprefSubtype:", v26);

    -[RBSLaunchContext setInitialRole:]( v5,  "setInitialRole:",  [v4 decodeUInt64ForKey:@"_initialRole"]);
    -[RBSLaunchContext setLsPersona:](v5, "setLsPersona:", [v4 decodeUInt64ForKey:@"_lsPersona"]);
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleIdentifier"];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setBundleIdentifier:](v5, "setBundleIdentifier:", v27);

    -[RBSLaunchContext setHostPid:](v5, "setHostPid:", [v4 decodeUInt64ForKey:@"_hostPid"]);
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_extensionOverlay"];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setExtensionOverlay:](v5, "setExtensionOverlay:", v28);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_oneShotUUID"];
    id v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setOneShotUUID:](v5, "setOneShotUUID:", v29);

    -[RBSLaunchContext setForceSubmit:]( v5,  "setForceSubmit:",  [v4 decodeUInt64ForKey:@"_forceSubmit"] != 0);
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_beforeTranslocationBundlePath"];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setBeforeTranslocationBundlePath:](v5, "setBeforeTranslocationBundlePath:", v30);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_homeDirectory"];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setHomeDirectory:](v5, "setHomeDirectory:", v31);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_tmpDirectory"];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setTmpDirectory:](v5, "setTmpDirectory:", v32);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_requiredExistingProcess"];
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setRequiredExistingProcess:](v5, "setRequiredExistingProcess:", v33);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_preventContainerization"];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setPreventContainerization:](v5, "setPreventContainerization:", v34);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_containerIdentifier"];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setContainerIdentifier:](v5, "setContainerIdentifier:", v35);

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_dextCheckInPort"];
    dextCheckInPort = v5->_dextCheckInPort;
    v5->_dextCheckInPort = (RBSMachPort *)v36;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_spawnConstraint"];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSLaunchContext setSpawnConstraint:](v5, "setSpawnConstraint:", v38);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[RBSLaunchContext init]( +[RBSLaunchContext allocWithZone:](&OBJC_CLASS___RBSLaunchContext, "allocWithZone:", a3),  "init");
  -[RBSLaunchContext identity](self, "identity");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setIdentity:](v4, "setIdentity:", v5);

  -[RBSLaunchContext appID](self, "appID");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setAppID:](v4, "setAppID:", v6);
  v7 = -[RBSLaunchContext arguments](self, "arguments");
  -[RBSLaunchContext setArguments:](v4, "setArguments:", v7);

  -[RBSLaunchContext setExecutionOptions:]( v4,  "setExecutionOptions:",  -[RBSLaunchContext executionOptions](self, "executionOptions"));
  -[RBSLaunchContext _overrideExecutablePath](self, "_overrideExecutablePath");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext _setOverrideExecutablePath:](v4, "_setOverrideExecutablePath:", v8);
  v9 = -[RBSLaunchContext _additionalMachServices](self, "_additionalMachServices");
  -[RBSLaunchContext _setAdditionalMachServices:](v4, "_setAdditionalMachServices:", v9);
  v10 = -[RBSLaunchContext _additionalEnvironment](self, "_additionalEnvironment");
  -[RBSLaunchContext _setAdditionalEnvironment:](v4, "_setAdditionalEnvironment:", v10);

  -[RBSLaunchContext standardOutputPath](self, "standardOutputPath");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setStandardOutputPath:](v4, "setStandardOutputPath:", v11);
  v12 = -[RBSLaunchContext standardErrorPath](self, "standardErrorPath");
  -[RBSLaunchContext setStandardErrorPath:](v4, "setStandardErrorPath:", v12);
  v13 = -[RBSLaunchContext standardInPath](self, "standardInPath");
  -[RBSLaunchContext setStandardInPath:](v4, "setStandardInPath:", v13);
  v14 = -[RBSLaunchContext attributes](self, "attributes");
  -[RBSLaunchContext setAttributes:](v4, "setAttributes:", v14);
  v15 = -[RBSLaunchContext managedEndpointLaunchIdentifiers](self, "managedEndpointLaunchIdentifiers");
  -[RBSLaunchContext setManagedEndpointLaunchIdentifiers:](v4, "setManagedEndpointLaunchIdentifiers:", v15);
  v16 = -[RBSLaunchContext explanation](self, "explanation");
  -[RBSLaunchContext setExplanation:](v4, "setExplanation:", v16);

  -[RBSLaunchContext managedPersona](self, "managedPersona");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setManagedPersona:](v4, "setManagedPersona:", v17);

  -[RBSLaunchContext setSpawnType:](v4, "setSpawnType:", -[RBSLaunchContext spawnType](self, "spawnType"));
  -[RBSLaunchContext setLsManageRoleOnly:]( v4,  "setLsManageRoleOnly:",  -[RBSLaunchContext lsManageRoleOnly](self, "lsManageRoleOnly"));
  -[RBSLaunchContext setLsSpawnFlags:](v4, "setLsSpawnFlags:", -[RBSLaunchContext lsSpawnFlags](self, "lsSpawnFlags"));
  -[RBSLaunchContext setLsUMask:](v4, "setLsUMask:", -[RBSLaunchContext lsUMask](self, "lsUMask"));
  v18 = -[RBSLaunchContext lsBinpref](self, "lsBinpref");
  -[RBSLaunchContext setLsBinpref:](v4, "setLsBinpref:", v18);

  -[RBSLaunchContext lsBinprefSubtype](self, "lsBinprefSubtype");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setLsBinprefSubtype:](v4, "setLsBinprefSubtype:", v19);

  -[RBSLaunchContext setInitialRole:](v4, "setInitialRole:", -[RBSLaunchContext initialRole](self, "initialRole"));
  -[RBSLaunchContext setLsPersona:](v4, "setLsPersona:", -[RBSLaunchContext lsPersona](self, "lsPersona"));
  v20 = -[RBSLaunchContext bundleIdentifier](self, "bundleIdentifier");
  -[RBSLaunchContext setBundleIdentifier:](v4, "setBundleIdentifier:", v20);

  -[RBSLaunchContext setHostPid:](v4, "setHostPid:", -[RBSLaunchContext hostPid](self, "hostPid"));
  v21 = -[RBSLaunchContext extensionOverlay](self, "extensionOverlay");
  -[RBSLaunchContext setExtensionOverlay:](v4, "setExtensionOverlay:", v21);
  v22 = -[RBSLaunchContext oneShotUUID](self, "oneShotUUID");
  -[RBSLaunchContext setOneShotUUID:](v4, "setOneShotUUID:", v22);

  -[RBSLaunchContext setForceSubmit:](v4, "setForceSubmit:", -[RBSLaunchContext forceSubmit](self, "forceSubmit"));
  -[RBSLaunchContext beforeTranslocationBundlePath](self, "beforeTranslocationBundlePath");
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setBeforeTranslocationBundlePath:](v4, "setBeforeTranslocationBundlePath:", v23);
  v24 = -[RBSLaunchContext homeDirectory](self, "homeDirectory");
  -[RBSLaunchContext setHomeDirectory:](v4, "setHomeDirectory:", v24);

  -[RBSLaunchContext tmpDirectory](self, "tmpDirectory");
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext setTmpDirectory:](v4, "setTmpDirectory:", v25);
  v26 = -[RBSLaunchContext requiredExistingProcess](self, "requiredExistingProcess");
  -[RBSLaunchContext setRequiredExistingProcess:](v4, "setRequiredExistingProcess:", v26);
  v27 = -[RBSLaunchContext preventContainerization](self, "preventContainerization");
  -[RBSLaunchContext setPreventContainerization:](v4, "setPreventContainerization:", v27);
  v28 = -[RBSLaunchContext containerIdentifier](self, "containerIdentifier");
  -[RBSLaunchContext setContainerIdentifier:](v4, "setContainerIdentifier:", v28);

  uint64_t v29 = -[RBSMachPort copy](self->_dextCheckInPort, "copy");
  dextCheckInPort = v4->_dextCheckInPort;
  v4->_dextCheckInPort = (RBSMachPort *)v29;
  v31 = -[RBSLaunchContext spawnConstraint](self, "spawnConstraint");
  -[RBSLaunchContext setSpawnConstraint:](v4, "setSpawnConstraint:", v31);

  return v4;
}

- (void)setRequestorHandle:(id)a3
{
}

- (BOOL)lsManageRoleOnly
{
  return self->_lsManageRoleOnly;
}

- (void)setLsManageRoleOnly:(BOOL)a3
{
  self->_lsManageRoleOnly = a3;
}

- (unint64_t)lsSpawnFlags
{
  return self->_lsSpawnFlags;
}

- (void)setLsSpawnFlags:(unint64_t)a3
{
  self->_lsSpawnFlags = a3;
}

- (unsigned)lsUMask
{
  return self->_lsUMask;
}

- (void)setLsUMask:(unsigned __int16)a3
{
  self->_lsUMask = a3;
}

- (NSArray)lsBinpref
{
  return self->_lsBinpref;
}

- (void)setLsBinpref:(id)a3
{
}

- (NSArray)lsBinprefSubtype
{
  return self->_lsBinprefSubtype;
}

- (void)setLsBinprefSubtype:(id)a3
{
}

- (unsigned)lsPersona
{
  return self->_lsPersona;
}

- (void)setLsPersona:(unsigned int)a3
{
  self->_lsPersona = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int)hostPid
{
  return self->_hostPid;
}

- (void)setHostPid:(int)a3
{
  self->_hostPid = a3;
}

- (NSDictionary)extensionOverlay
{
  return self->_extensionOverlay;
}

- (void)setExtensionOverlay:(id)a3
{
}

- (NSUUID)oneShotUUID
{
  return self->_oneShotUUID;
}

- (void)setOneShotUUID:(id)a3
{
}

- (NSString)standardOutputPath
{
  return self->_standardOutputPath;
}

- (void)setStandardOutputPath:(id)a3
{
}

- (NSString)standardErrorPath
{
  return self->_standardErrorPath;
}

- (void)setStandardErrorPath:(id)a3
{
}

- (NSString)standardInPath
{
  return self->_standardInPath;
}

- (void)setStandardInPath:(id)a3
{
}

- (BOOL)forceSubmit
{
  return self->_forceSubmit;
}

- (void)setForceSubmit:(BOOL)a3
{
  self->_forceSubmit = a3;
}

- (unsigned)initialRole
{
  return self->_initialRole;
}

- (void)setInitialRole:(unsigned __int8)a3
{
  self->_initialRole = a3;
}

- (NSString)beforeTranslocationBundlePath
{
  return self->_beforeTranslocationBundlePath;
}

- (void)setBeforeTranslocationBundlePath:(id)a3
{
}

- (NSString)homeDirectory
{
  return self->_homeDirectory;
}

- (void)setHomeDirectory:(id)a3
{
}

- (NSString)tmpDirectory
{
  return self->_tmpDirectory;
}

- (void)setTmpDirectory:(id)a3
{
}

- (RBSProcessIdentifier)requiredExistingProcess
{
  return self->_requiredExistingProcess;
}

- (void)setRequiredExistingProcess:(id)a3
{
}

- (NSNumber)preventContainerization
{
  return self->_preventContainerization;
}

- (void)setPreventContainerization:(id)a3
{
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (LSApplicationIdentity)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (BOOL)isTesting
{
  return self->_testing;
}

- (void)setTesting:(BOOL)a3
{
  self->_testing = a3;
}

- (BOOL)calculatedContainerIdentifier
{
  return self->_calculatedContainerIdentifier;
}

- (void)setCalculatedContainerIdentifier:(BOOL)a3
{
  self->_calculatedContainerIdentifier = a3;
}

- (RBSProcessHandle)requestorHandle
{
  return self->_requestorHandle;
}

- (NSDictionary)spawnConstraint
{
  return self->_spawnConstraint;
}

- (void)setSpawnConstraint:(id)a3
{
}

- (NSSet)managedEndpointLaunchIdentifiers
{
  return self->_managedEndpointLaunchIdentifiers;
}

- (void)setManagedEndpointLaunchIdentifiers:(id)a3
{
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
}

- (unint64_t)executionOptions
{
  return self->_executionOptions;
}

- (void)setExecutionOptions:(unint64_t)a3
{
  self->_executionOptions = a3;
}

- (unsigned)spawnType
{
  return self->_spawnType;
}

- (void)setSpawnType:(unsigned __int8)a3
{
  self->_spawnType = a3;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
}

- (NSString)managedPersona
{
  return self->_managedPersona;
}

- (void)setManagedPersona:(id)a3
{
}

- (RBProcess)hostProcess
{
  return self->_hostProcess;
}

- (void)setHostProcess:(id)a3
{
}

- (NSString)_overrideExecutablePath
{
  return self->__overrideExecutablePath;
}

- (void)_setOverrideExecutablePath:(id)a3
{
}

- (NSArray)_additionalMachServices
{
  return self->__additionalMachServices;
}

- (void)_setAdditionalMachServices:(id)a3
{
}

- (NSDictionary)_additionalEnvironment
{
  return self->__additionalEnvironment;
}

- (void)_setAdditionalEnvironment:(id)a3
{
}

- (NSUUID)requiredCacheUUID
{
  return self->_requiredCacheUUID;
}

- (void)setRequiredCacheUUID:(id)a3
{
}

- (NSNumber)requiredSequenceNumber
{
  return self->_requiredSequenceNumber;
}

- (void)setRequiredSequenceNumber:(id)a3
{
}

- (void).cxx_destruct
{
}

@end