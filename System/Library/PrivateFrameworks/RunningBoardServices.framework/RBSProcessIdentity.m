@interface RBSProcessIdentity
+ (BOOL)shouldManageExtensionWithExtensionPoint:(id)a3;
+ (BOOL)supportsRBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)_identityForXPCServiceIdentifier:(id)a3 variant:(int64_t)a4;
+ (id)decodeFromJob:(id)a3 uuid:(id)a4;
+ (id)extensionIdentityForBundleIdentifier:(id)a3 persona:(id)a4 instanceUUID:(id)a5 hostIdentifier:(id)a6 validationToken:(id)a7;
+ (id)extensionIdentityForPlugInKitIdentifier:(id)a3 bundledURL:(id)a4 hostIdentifier:(id)a5 UUID:(id)a6;
+ (id)extensionIdentityForPlugInKitIdentifier:(id)a3 hostIdentifier:(id)a4 UUID:(id)a5;
+ (id)externalExtensionIdentityForExtensionKitIdentifier:(id)a3 bundledURL:(id)a4 hostIdentifier:(id)a5 UUID:(id)a6;
+ (id)externalExtensionIdentityForExtensionKitIdentifier:(id)a3 hostIdentifier:(id)a4 UUID:(id)a5;
+ (id)identityForAngelJobLabel:(id)a3;
+ (id)identityForApplicationJobLabel:(id)a3;
+ (id)identityForApplicationJobLabel:(id)a3 bundleID:(id)a4 platform:(int)a5;
+ (id)identityForDaemonJobLabel:(id)a3;
+ (id)identityForDextWithServerName:(id)a3 tagString:(id)a4 containingAppBundleID:(id)a5;
+ (id)identityForEmbeddedApplicationIdentifier:(id)a3;
+ (id)identityForEmbeddedApplicationIdentifier:(id)a3 auid:(unsigned int)a4;
+ (id)identityForEmbeddedApplicationIdentifier:(id)a3 jobLabel:(id)a4 auid:(unsigned int)a5 platform:(int)a6;
+ (id)identityForExecutablePath:(id)a3 pid:(int)a4 auid:(unsigned int)a5;
+ (id)identityForLSApplicationIdentity:(id)a3;
+ (id)identityForLSApplicationIdentity:(id)a3 LSApplicationRecord:(id)a4;
+ (id)identityForLSApplicationIdentity:(id)a3 LSApplicationRecord:(id)a4 uuid:(id)a5;
+ (id)identityForLaunchdJobLabel:(id)a3 isMultiInstance:(BOOL)a4 pid:(int)a5 auid:(unsigned int)a6;
+ (id)identityForMacApplicationJobLabel:(id)a3 appID:(id)a4 bundleID:(id)a5 platform:(int)a6;
+ (id)identityForMacApplicationJobLabel:(id)a3 appID:(id)a4 platform:(int)a5;
+ (id)identityForPlugInKitIdentifier:(id)a3;
+ (id)identityForUnbundledMacApplicationJobLabel:(id)a3;
+ (id)identityForUnknownServiceWithJobLabel:(id)a3;
+ (id)identityForWrappedInfoProvider:(id)a3;
+ (id)identityForWrappedInfoProvider:(id)a3 uuid:(id)a4;
+ (id)identityForXPCServiceExecutablePath:(id)a3 host:(id)a4;
+ (id)identityForXPCServiceExecutablePath:(id)a3 pid:(int)a4 auid:(unsigned int)a5 host:(id)a6 UUID:(id)a7;
+ (id)identityForXPCServiceIdentifier:(id)a3;
+ (id)identityForXPCServiceIdentifier:(id)a3 hostInstance:(id)a4 UUID:(id)a5 persona:(id)a6 validationToken:(id)a7 variant:(int64_t)a8;
+ (id)identityForXPCServiceIdentifier:(id)a3 hostInstance:(id)a4 UUID:(id)a5 variant:(int64_t)a6;
+ (id)identityOfCurrentProcess;
- (BOOL)_matchesIdentity:(id)a3;
- (BOOL)hasConsistentLaunchdJob;
- (BOOL)inheritsCoalitionBand;
- (BOOL)isAngel;
- (BOOL)isAnonymous;
- (BOOL)isApplication;
- (BOOL)isDaemon;
- (BOOL)isDext;
- (BOOL)isEmbeddedApplication;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIdentity:(id)a3;
- (BOOL)isExtension;
- (BOOL)isExternal;
- (BOOL)isMultiInstanceExtension;
- (BOOL)isXPCService;
- (BOOL)matchesProcess:(id)a3;
- (BOOL)supportsLaunchingDirectly;
- (BOOL)treatedAsAnAppByFrontBoard:(id *)a3;
- (NSData)validationToken;
- (NSString)angelJobLabel;
- (NSString)applicationJobLabel;
- (NSString)consistentLaunchdJobLabel;
- (NSString)daemonJobLabel;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)dextContainingAppBundleID;
- (NSString)dextLabel;
- (NSString)dextServerName;
- (NSString)embeddedApplicationIdentifier;
- (NSString)persona;
- (NSString)personaString;
- (NSString)shortDescription;
- (NSString)xpcServiceIdentifier;
- (NSUUID)uuid;
- (RBSProcessIdentifier)hostIdentifier;
- (RBSProcessIdentity)hostIdentity;
- (RBSProcessIdentity)init;
- (RBSProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4;
- (RBSProcessIdentity)initWithRBSXPCCoder:(id)a3;
- (id)_init;
- (id)copyWithAuid:(unsigned int)a3;
- (id)encodeForJob;
- (id)processPredicate;
- (int)platform;
- (unint64_t)hash;
- (unsigned)auid;
- (unsigned)defaultManageFlags;
- (unsigned)osServiceType;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessIdentity

+ (id)identityForPlugInKitIdentifier:(id)a3
{
  return +[RBSProcessIdentity _identityForXPCServiceIdentifier:variant:]( &OBJC_CLASS___RBSProcessIdentity,  "_identityForXPCServiceIdentifier:variant:",  a3,  2LL);
}

- (unsigned)auid
{
  return 0;
}

- (int)platform
{
  return 0;
}

- (NSString)shortDescription
{
  return self->_description;
}

+ (id)identityOfCurrentProcess
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[RBSConnection identity]((uint64_t)v2);
  return v3;
}

+ (id)identityForApplicationJobLabel:(id)a3 bundleID:(id)a4 platform:(int)a5
{
  id v5 = a4;
  id v6 = -[RBSEmbeddedAppProcessIdentity _initEmbeddedAppWithBundleID:]( objc_alloc(&OBJC_CLASS___RBSEmbeddedAppProcessIdentity),  "_initEmbeddedAppWithBundleID:",  v5);

  return v6;
}

+ (id)identityForUnbundledMacApplicationJobLabel:(id)a3
{
  id v3 = a3;
  id v4 = -[RBSOSServiceProcessIdentity _initUnknownOSServiceWithJobLabel:]( objc_alloc(&OBJC_CLASS___RBSOSServiceProcessIdentity),  "_initUnknownOSServiceWithJobLabel:",  v3);

  return v4;
}

+ (id)identityForEmbeddedApplicationIdentifier:(id)a3 jobLabel:(id)a4 auid:(unsigned int)a5 platform:(int)a6
{
  id v6 = a3;
  id v7 = -[RBSEmbeddedAppProcessIdentity _initEmbeddedAppWithBundleID:]( objc_alloc(&OBJC_CLASS___RBSEmbeddedAppProcessIdentity),  "_initEmbeddedAppWithBundleID:",  v6);

  return v7;
}

+ (id)identityForWrappedInfoProvider:(id)a3 uuid:(id)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v12 = 0LL;
  objc_msgSend(a3, "fetchWrappedInfoWithError:", &v12, a4);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v12;
  if (v4)
  {
    [v4 persistentJobLabel];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      [v4 persistentJobLabel];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[RBSProcessIdentity identityForUnknownServiceWithJobLabel:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForUnknownServiceWithJobLabel:",  v7);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v8 = -[RBSEmbeddedAppProcessIdentity _initEmbeddedAppWithAppInfo:]( objc_alloc(&OBJC_CLASS___RBSEmbeddedAppProcessIdentity),  "_initEmbeddedAppWithAppInfo:",  v4);
    }
  }

  else
  {
    rbs_general_log();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      [v5 description];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl( &dword_185F67000,  v9,  OS_LOG_TYPE_DEFAULT,  "_initEmbeddedAppWithAppInfoProvider failed due to %{public}@",  buf,  0xCu);
    }

    id v8 = 0LL;
  }

  return v8;
}

+ (id)identityForWrappedInfoProvider:(id)a3
{
  return +[RBSProcessIdentity identityForWrappedInfoProvider:uuid:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForWrappedInfoProvider:uuid:",  a3,  0LL);
}

+ (id)identityForEmbeddedApplicationIdentifier:(id)a3
{
  return (id)[a1 identityForEmbeddedApplicationIdentifier:a3 auid:0];
}

+ (id)identityForEmbeddedApplicationIdentifier:(id)a3 auid:(unsigned int)a4
{
  return +[RBSProcessIdentity identityForEmbeddedApplicationIdentifier:jobLabel:auid:platform:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForEmbeddedApplicationIdentifier:jobLabel:auid:platform:",  a3,  0LL,  *(void *)&a4,  6LL);
}

+ (id)identityForLSApplicationIdentity:(id)a3
{
  return +[RBSProcessIdentity identityForWrappedInfoProvider:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForWrappedInfoProvider:",  a3);
}

+ (id)identityForLSApplicationIdentity:(id)a3 LSApplicationRecord:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSProcessIdentity identityForWrappedInfoProvider:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForWrappedInfoProvider:",  v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)identityForLSApplicationIdentity:(id)a3 LSApplicationRecord:(id)a4 uuid:(id)a5
{
  id v7 = a5;
  +[RBSIdentityAndRecordInfoProvider _providerWithIdentity:record:]( &OBJC_CLASS___RBSIdentityAndRecordInfoProvider,  "_providerWithIdentity:record:",  a3,  a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[RBSProcessIdentity identityForWrappedInfoProvider:uuid:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForWrappedInfoProvider:uuid:",  v8,  v7);
  return v9;
}

+ (id)identityForUnknownServiceWithJobLabel:(id)a3
{
  id v3 = a3;
  id v4 = -[RBSOSServiceProcessIdentity _initUnknownOSServiceWithJobLabel:]( objc_alloc(&OBJC_CLASS___RBSOSServiceProcessIdentity),  "_initUnknownOSServiceWithJobLabel:",  v3);

  return v4;
}

+ (id)identityForApplicationJobLabel:(id)a3
{
  return +[RBSProcessIdentity identityForApplicationJobLabel:bundleID:platform:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForApplicationJobLabel:bundleID:platform:",  a3,  a3,  0LL);
}

+ (id)identityForMacApplicationJobLabel:(id)a3 appID:(id)a4 platform:(int)a5
{
  return +[RBSProcessIdentity identityForLSApplicationIdentity:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForLSApplicationIdentity:",  a4);
}

+ (id)identityForMacApplicationJobLabel:(id)a3 appID:(id)a4 bundleID:(id)a5 platform:(int)a6
{
  return +[RBSProcessIdentity identityForLSApplicationIdentity:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForLSApplicationIdentity:",  a4);
}

+ (id)identityForDaemonJobLabel:(id)a3
{
  id v3 = a3;
  id v4 = -[RBSOSServiceProcessIdentity _initDaemonWithJobLabel:pid:auid:]( objc_alloc(&OBJC_CLASS___RBSOSServiceProcessIdentity),  "_initDaemonWithJobLabel:pid:auid:",  v3,  0LL,  0LL);

  return v4;
}

+ (id)identityForAngelJobLabel:(id)a3
{
  id v3 = a3;
  id v4 = -[RBSOSServiceProcessIdentity _initAngelWithJobLabel:]( objc_alloc(&OBJC_CLASS___RBSOSServiceProcessIdentity),  "_initAngelWithJobLabel:",  v3);

  return v4;
}

+ (id)identityForDextWithServerName:(id)a3 tagString:(id)a4 containingAppBundleID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = -[RBSDextProcessIdentity _initDextWithServerName:tagString:containingAppBundleID:]( objc_alloc(&OBJC_CLASS___RBSDextProcessIdentity),  "_initDextWithServerName:tagString:containingAppBundleID:",  v9,  v8,  v7);

  return v10;
}

- (RBSProcessIdentity)init
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBSProcessIdentity.m" lineNumber:248 description:@"-init is not allowed on RBSProcessIdentity"];

  return 0LL;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RBSProcessIdentity;
  return -[RBSProcessIdentity init](&v3, sel_init);
}

- (id)copyWithAuid:(unsigned int)a3
{
  id v3 = (id)objc_opt_class();
  _os_log_send_and_compose_impl();

  id result = (id)_os_crash_msg();
  __break(1u);
  return result;
}

+ (id)identityForLaunchdJobLabel:(id)a3 isMultiInstance:(BOOL)a4 pid:(int)a5 auid:(unsigned int)a6
{
  BOOL v7 = a4;
  id v8 = a3;
  id v9 = v8;
  if (!a5 && v7)
  {
    rbs_process_log();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[RBSProcessIdentity identityForLaunchdJobLabel:isMultiInstance:pid:auid:].cold.1();
    }
LABEL_12:

    id v13 = 0LL;
    goto LABEL_13;
  }

  if (!v8)
  {
    rbs_process_log();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[RBSProcessIdentity identityForLaunchdJobLabel:isMultiInstance:pid:auid:].cold.2(v10);
    }
    goto LABEL_12;
  }

  v11 = objc_alloc(&OBJC_CLASS___RBSOSServiceProcessIdentity);
  if (v7) {
    uint64_t v12 = a5;
  }
  else {
    uint64_t v12 = 0LL;
  }
  id v13 = -[RBSOSServiceProcessIdentity _initDaemonWithJobLabel:pid:auid:]( v11,  "_initDaemonWithJobLabel:pid:auid:",  v9,  v12,  0LL);
LABEL_13:

  return v13;
}

+ (id)identityForExecutablePath:(id)a3 pid:(int)a4 auid:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = objc_alloc(&OBJC_CLASS___RBSOpaqueProcessIdentity);
  [v7 lastPathComponent];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  id v10 = -[RBSOpaqueProcessIdentity _initOpaqueWithPid:name:auid:](v8, "_initOpaqueWithPid:name:auid:", v6, v9, v5);
  return v10;
}

+ (id)identityForXPCServiceIdentifier:(id)a3 hostInstance:(id)a4 UUID:(id)a5 persona:(id)a6 validationToken:(id)a7 variant:(int64_t)a8
{
  id v15 = a3;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  NSClassFromString(@"NSString");
  if (!v15)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 handleFailureInMethod:a2, a1, @"RBSProcessIdentity.m", 293, @"Invalid condition not satisfying: %@", @"object != nil" object file lineNumber description];
  }

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 handleFailureInMethod:a2, a1, @"RBSProcessIdentity.m", 293, @"Invalid condition not satisfying: %@", @"[object isKindOfClass:NSStringClass]" object file lineNumber description];
  }

  uint64_t v20 = 3LL;
  if (v19) {
    uint64_t v20 = 1LL;
  }
  if (a8 <= 1) {
    uint64_t v21 = 0LL;
  }
  else {
    uint64_t v21 = v20;
  }
  v22 = +[RBSXPCServiceDefinition definitionWithIdentifier:variant:scope:]( &OBJC_CLASS___RBSXPCServiceDefinition,  "definitionWithIdentifier:variant:scope:",  v15,  a8,  v21);
  v23 = +[RBSXPCServiceIdentity identityWithDefinition:sessionID:host:UUID:persona:validationToken:]( &OBJC_CLASS___RBSXPCServiceIdentity,  "identityWithDefinition:sessionID:host:UUID:persona:validationToken:",  v22,  0LL,  v19,  v18,  v17,  v16);
  id v24 = -[RBSXPCServiceProcessIdentity _initWithXPCServiceID:pid:auid:]( objc_alloc(&OBJC_CLASS___RBSXPCServiceProcessIdentity),  "_initWithXPCServiceID:pid:auid:",  v23,  0LL,  0LL);
  return v24;
}

+ (id)identityForXPCServiceIdentifier:(id)a3 hostInstance:(id)a4 UUID:(id)a5 variant:(int64_t)a6
{
  return (id)[a1 identityForXPCServiceIdentifier:a3 hostInstance:a4 UUID:a5 persona:0 validationToken:0 variant:a6];
}

+ (id)_identityForXPCServiceIdentifier:(id)a3 variant:(int64_t)a4
{
  return +[RBSProcessIdentity identityForXPCServiceIdentifier:hostInstance:UUID:variant:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForXPCServiceIdentifier:hostInstance:UUID:variant:",  a3,  0LL,  0LL,  a4);
}

+ (id)identityForXPCServiceIdentifier:(id)a3
{
  return +[RBSProcessIdentity _identityForXPCServiceIdentifier:variant:]( &OBJC_CLASS___RBSProcessIdentity,  "_identityForXPCServiceIdentifier:variant:",  a3,  0LL);
}

+ (id)extensionIdentityForPlugInKitIdentifier:(id)a3 hostIdentifier:(id)a4 UUID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    id v11 = 0LL;
    goto LABEL_5;
  }

  id v17 = 0LL;
  +[RBSProcessHandle handleForIdentifier:error:](&OBJC_CLASS___RBSProcessHandle, "handleForIdentifier:error:", v8, &v17);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v17;
  if (v10)
  {
    [v10 identity];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = +[RBSProcessInstance instanceWithIdentifier:identity:]( &OBJC_CLASS___RBSProcessInstance,  "instanceWithIdentifier:identity:",  v8,  v12);

    id v11 = (id)v13;
LABEL_5:
    v14 = +[RBSProcessIdentity identityForXPCServiceIdentifier:hostInstance:UUID:variant:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForXPCServiceIdentifier:hostInstance:UUID:variant:",  v7,  v11,  v9,  2LL);
    goto LABEL_9;
  }

  rbs_process_log();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    +[RBSProcessIdentity extensionIdentityForPlugInKitIdentifier:hostIdentifier:UUID:].cold.1();
  }

  v14 = 0LL;
LABEL_9:

  return v14;
}

+ (id)externalExtensionIdentityForExtensionKitIdentifier:(id)a3 hostIdentifier:(id)a4 UUID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    id v11 = 0LL;
    goto LABEL_5;
  }

  id v17 = 0LL;
  +[RBSProcessHandle handleForIdentifier:error:](&OBJC_CLASS___RBSProcessHandle, "handleForIdentifier:error:", v8, &v17);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v17;
  if (v10)
  {
    [v10 identity];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = +[RBSProcessInstance instanceWithIdentifier:identity:]( &OBJC_CLASS___RBSProcessInstance,  "instanceWithIdentifier:identity:",  v8,  v12);

    id v11 = (id)v13;
LABEL_5:
    v14 = +[RBSProcessIdentity identityForXPCServiceIdentifier:hostInstance:UUID:variant:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForXPCServiceIdentifier:hostInstance:UUID:variant:",  v7,  v11,  v9,  3LL);
    goto LABEL_9;
  }

  rbs_process_log();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    +[RBSProcessIdentity extensionIdentityForPlugInKitIdentifier:hostIdentifier:UUID:].cold.1();
  }

  v14 = 0LL;
LABEL_9:

  return v14;
}

+ (id)extensionIdentityForPlugInKitIdentifier:(id)a3 bundledURL:(id)a4 hostIdentifier:(id)a5 UUID:(id)a6
{
  return (id)[a1 extensionIdentityForPlugInKitIdentifier:a3 hostIdentifier:a5 UUID:a6];
}

+ (id)externalExtensionIdentityForExtensionKitIdentifier:(id)a3 bundledURL:(id)a4 hostIdentifier:(id)a5 UUID:(id)a6
{
  return (id)[a1 externalExtensionIdentityForExtensionKitIdentifier:a3 hostIdentifier:a5 UUID:a6];
}

+ (id)extensionIdentityForBundleIdentifier:(id)a3 persona:(id)a4 instanceUUID:(id)a5 hostIdentifier:(id)a6 validationToken:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v14)
  {
    id v17 = 0LL;
    goto LABEL_5;
  }

  id v23 = 0LL;
  +[RBSProcessHandle handleForIdentifier:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForIdentifier:error:",  v14,  &v23);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = v23;
  if (v16)
  {
    [v16 identity];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = +[RBSProcessInstance instanceWithIdentifier:identity:]( &OBJC_CLASS___RBSProcessInstance,  "instanceWithIdentifier:identity:",  v14,  v18);

    id v17 = (id)v19;
LABEL_5:
    +[RBSProcessIdentity identityForXPCServiceIdentifier:hostInstance:UUID:persona:validationToken:variant:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForXPCServiceIdentifier:hostInstance:UUID:persona:validationToken:variant:",  v11,  v17,  v13,  v12,  v15,  2LL);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }

  rbs_process_log();
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    +[RBSProcessIdentity extensionIdentityForPlugInKitIdentifier:hostIdentifier:UUID:].cold.1();
  }

  uint64_t v20 = 0LL;
LABEL_9:

  return v20;
}

+ (id)identityForXPCServiceExecutablePath:(id)a3 host:(id)a4
{
  return +[RBSProcessIdentity identityForXPCServiceExecutablePath:pid:auid:host:UUID:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForXPCServiceExecutablePath:pid:auid:host:UUID:",  a3,  0LL,  0LL,  a4,  0LL);
}

+ (id)identityForXPCServiceExecutablePath:(id)a3 pid:(int)a4 auid:(unsigned int)a5 host:(id)a6 UUID:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v63 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = v12;
  NSClassFromString(@"NSString");
  if (!v15)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v38 handleFailureInMethod:a2, a1, @"RBSProcessIdentity.m", 386, @"Invalid condition not satisfying: %@", @"object != nil" object file lineNumber description];
  }

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v39 handleFailureInMethod:a2, a1, @"RBSProcessIdentity.m", 386, @"Invalid condition not satisfying: %@", @"[object isKindOfClass:NSStringClass]" object file lineNumber description];
  }

  id v16 = v15;
  [v16 UTF8String];
  id v17 = (void *)xpc_bundle_create();
  uint64_t error = xpc_bundle_get_error();
  if (!(_DWORD)error)
  {
    xpc_bundle_get_info_dictionary();
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      string = (char *)xpc_dictionary_get_string( v20, (const char *)[(id) *MEMORY[0x189604E00] UTF8String]);
      if (string) {
        string = (char *)[objc_alloc(NSString) initWithUTF8String:string];
      }
      id v23 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      id v24 = v23;
      if (string)
      {
        if (v23)
        {
          RBSDictionaryForKey(v23, @"XPCService");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          RBSExtensionPointFromBundleDict(v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            v46 = v25;
            if (v13) {
              int v27 = 1;
            }
            else {
              int v27 = 3;
            }
            uint64_t v28 = 2LL;
            goto LABEL_31;
          }

          if (v25)
          {
            RBSStringForKey(v25, @"ServiceType");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v29;
            v46 = v25;
            if (!v29 || ([v29 isEqualToString:@"Application"] & 1) != 0)
            {
              int v31 = 1;
LABEL_30:
              int v43 = v31;

              uint64_t v28 = 1LL;
              int v27 = v43;
LABEL_31:
              int v44 = v27;
              v30 = +[RBSXPCServiceDefinition definitionWithIdentifier:variant:scope:]( &OBJC_CLASS___RBSXPCServiceDefinition,  "definitionWithIdentifier:variant:scope:",  string,  v28);
              v45 = string;
              if (v30)
              {
                v42 = v30;
                uint64_t v41 = +[RBSXPCServiceIdentity identityWithDefinition:sessionID:host:UUID:persona:validationToken:]( &OBJC_CLASS___RBSXPCServiceIdentity,  "identityWithDefinition:sessionID:host:UUID:persona:validationToken:",  v30,  0LL,  v13,  v14,  0LL,  0LL);
                rbs_process_log();
                v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  [v16 lastPathComponent];
                  int v40 = v28;
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138545154;
                  v48 = string;
                  __int16 v49 = 2114;
                  v50 = v33;
                  __int16 v51 = 1024;
                  int v52 = objc_msgSend(v13, "rbs_pid");
                  __int16 v53 = 1024;
                  int v54 = v40;
                  __int16 v55 = 1024;
                  int v56 = v44;
                  __int16 v57 = 2112;
                  id v58 = v14;
                  __int16 v59 = 1024;
                  int v60 = v9;
                  __int16 v61 = 1024;
                  int v62 = 0;
                  _os_log_impl( &dword_185F67000,  v32,  OS_LOG_TYPE_DEFAULT,  "Resolved XPC Service %{public}@ (%{public}@) with host pid %d, variant %d, scope %d, uuid %@, pid %d, and auid %d",  buf,  0x3Eu);
                }

                v34 = (os_log_s *)v41;
                id v21 = -[RBSXPCServiceProcessIdentity _initWithXPCServiceID:pid:auid:]( objc_alloc(&OBJC_CLASS___RBSXPCServiceProcessIdentity),  "_initWithXPCServiceID:pid:auid:",  v41,  v9,  0LL);
                v35 = v46;
                v30 = v42;
              }

              else
              {
                rbs_process_log();
                v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                v35 = v46;
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
                  +[RBSProcessIdentity identityForXPCServiceExecutablePath:pid:auid:host:UUID:].cold.4(v16, v34);
                }
                id v21 = 0LL;
              }

              v25 = v35;
              string = v45;
              goto LABEL_39;
            }

            if ([v30 isEqualToString:@"System"])
            {
              int v31 = 3;
              goto LABEL_30;
            }

            if ([v30 isEqualToString:@"User"])
            {
              int v31 = 2;
              goto LABEL_30;
            }

            rbs_process_log();
            v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              +[RBSProcessIdentity identityForXPCServiceExecutablePath:pid:auid:host:UUID:].cold.5();
            }
          }

          else
          {
            rbs_process_log();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR)) {
              +[RBSProcessIdentity identityForXPCServiceExecutablePath:pid:auid:host:UUID:].cold.3();
            }
          }

          id v21 = 0LL;
LABEL_39:

          goto LABEL_40;
        }

        rbs_process_log();
        id v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR)) {
          +[RBSProcessIdentity identityForXPCServiceExecutablePath:pid:auid:host:UUID:].cold.2();
        }
LABEL_23:
        id v21 = 0LL;
LABEL_40:

        goto LABEL_41;
      }

      string = (char *)v23;
    }

    else
    {
      string = 0LL;
    }

    rbs_process_log();
    id v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR)) {
      +[RBSProcessIdentity identityForXPCServiceExecutablePath:pid:auid:host:UUID:].cold.1();
    }
    goto LABEL_23;
  }

  uint64_t v19 = error;
  rbs_process_log();
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR)) {
    +[RBSProcessIdentity identityForXPCServiceExecutablePath:pid:auid:host:UUID:].cold.6( v19,  (uint64_t)v16,  (os_log_s *)v20);
  }
  id v21 = 0LL;
LABEL_41:

  return v21;
}

- (BOOL)isExtension
{
  return 0;
}

- (BOOL)isMultiInstanceExtension
{
  return 0;
}

- (BOOL)isExternal
{
  return 0;
}

+ (BOOL)shouldManageExtensionWithExtensionPoint:(id)a3
{
  return +[RBSXPCServiceProcessIdentity shouldManageExtensionWithExtensionPoint:]( &OBJC_CLASS___RBSXPCServiceProcessIdentity,  "shouldManageExtensionWithExtensionPoint:",  a3);
}

- (unsigned)defaultManageFlags
{
  return 0;
}

- (BOOL)isEmbeddedApplication
{
  return 0;
}

- (BOOL)isXPCService
{
  return 0;
}

- (NSString)xpcServiceIdentifier
{
  return 0LL;
}

- (BOOL)isDaemon
{
  return 0;
}

- (BOOL)isAngel
{
  return 0;
}

- (BOOL)isApplication
{
  return 0;
}

- (BOOL)isDext
{
  return 0;
}

- (BOOL)isAnonymous
{
  return 1;
}

- (NSString)embeddedApplicationIdentifier
{
  return 0LL;
}

- (NSString)daemonJobLabel
{
  return 0LL;
}

- (RBSProcessIdentity)hostIdentity
{
  return 0LL;
}

- (RBSProcessIdentifier)hostIdentifier
{
  return 0LL;
}

- (NSString)applicationJobLabel
{
  return 0LL;
}

- (NSUUID)uuid
{
  return 0LL;
}

- (NSString)personaString
{
  return 0LL;
}

- (NSString)dextServerName
{
  return 0LL;
}

- (NSString)dextLabel
{
  return 0LL;
}

- (NSString)dextContainingAppBundleID
{
  return 0LL;
}

- (BOOL)supportsLaunchingDirectly
{
  return 0;
}

- (BOOL)hasConsistentLaunchdJob
{
  return 0;
}

- (NSString)consistentLaunchdJobLabel
{
  return 0LL;
}

- (BOOL)treatedAsAnAppByFrontBoard:(id *)a3
{
  return 0;
}

- (unsigned)osServiceType
{
  return 0;
}

- (id)encodeForJob
{
  id v2 = (id)objc_opt_class();
  _os_log_send_and_compose_impl();

  id result = (id)_os_crash_msg();
  __break(1u);
  return result;
}

- (RBSProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  id v7 = (id)objc_opt_class();
  _os_log_send_and_compose_impl();

  id result = (RBSProcessIdentity *)_os_crash_msg();
  __break(1u);
  return result;
}

+ (id)decodeFromJob:(id)a3 uuid:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = xpc_dictionary_get_int64(v5, "TYPE") - 1;
  if (v7 <= 6
    && ((0x7Bu >> v7) & 1) != 0
    && (objc_opt_class(), (id v8 = (objc_class *)(id)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    uint64_t v9 = (void *)[[v8 alloc] initWithDecodeFromJob:v5 uuid:v6];
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

- (BOOL)_matchesIdentity:(id)a3
{
  return self->_pid == *((_DWORD *)a3 + 2);
}

- (BOOL)matchesProcess:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[RBSProcessIdentity _matchesIdentity:](self, "_matchesIdentity:", v4);

  return (char)self;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatchingIdentity:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingIdentity:",  self);
}

- (BOOL)inheritsCoalitionBand
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSProcessIdentity *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class() && -[RBSProcessIdentity isEqualToIdentity:](self, "isEqualToIdentity:", v4);
  }

  return v6;
}

- (BOOL)isEqualToIdentity:(id)a3
{
  id v4 = (RBSProcessIdentity *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = self->_hash == v4->_hash
  }
      && self->_pid == v4->_pid
      && -[RBSProcessIdentity _matchesIdentity:](self, "_matchesIdentity:", v4);

  return v6;
}

- (NSString)debugDescription
{
  uint64_t v3 = -[RBSProcessIdentity auid](self, "auid");
  uint64_t v4 = v3;
  uint64_t v5 = (void *)NSString;
  description = self->_description;
  uint64_t pid = self->_pid;
  else {
    id v8 = @" pid=";
  }
  if ((int)pid < 1)
  {
    uint64_t v9 = &stru_189DE1D08;
    if ((_DWORD)v3) {
      goto LABEL_6;
    }
  }

  else
  {
    [MEMORY[0x189607968] numberWithInt:pid];
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v4)
    {
LABEL_6:
      [MEMORY[0x189607968] numberWithUnsignedInt:v4];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 stringWithFormat:@"<%@%@%@%@%@>", description, v8, v9, @" AUID=", v10];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
  }

  [v5 stringWithFormat:@"<%@%@%@%@%@>", description, v8, v9, &stru_189DE1D08, &stru_189DE1D08];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  return (NSString *)v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v3 = a3;
  os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  id v4 = (id)objc_opt_class();
  _os_log_send_and_compose_impl();

  _os_crash_msg();
  __break(1u);
}

- (RBSProcessIdentity)initWithRBSXPCCoder:(id)a3
{
  id v3 = a3;
  os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  id v4 = (id)objc_opt_class();
  _os_log_send_and_compose_impl();

  id result = (RBSProcessIdentity *)_os_crash_msg();
  __break(1u);
  return result;
}

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (unint64_t)hash
{
  return self->_hash;
}

- (NSString)angelJobLabel
{
  return self->_angelJobLabel;
}

- (NSString)persona
{
  return self->_persona;
}

- (NSData)validationToken
{
  return self->_validationToken;
}

- (void).cxx_destruct
{
}

+ (void)identityForLaunchdJobLabel:isMultiInstance:pid:auid:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5();
  __int16 v2 = 1024;
  int v3 = 0;
  _os_log_error_impl( &dword_185F67000,  v0,  OS_LOG_TYPE_ERROR,  "invalid pid (0) for multi-instance job: %@, auid: %d",  v1,  0x12u);
  OUTLINED_FUNCTION_0();
}

+ (void)identityForLaunchdJobLabel:(os_log_t)log isMultiInstance:pid:auid:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl( &dword_185F67000,  log,  OS_LOG_TYPE_ERROR,  "identityForDaemonLaunchProperties called with nil job label",  v1,  2u);
}

+ (void)extensionIdentityForPlugInKitIdentifier:hostIdentifier:UUID:.cold.1()
{
}

+ (void)identityForXPCServiceExecutablePath:pid:auid:host:UUID:.cold.1()
{
}

+ (void)identityForXPCServiceExecutablePath:pid:auid:host:UUID:.cold.2()
{
}

+ (void)identityForXPCServiceExecutablePath:pid:auid:host:UUID:.cold.3()
{
}

+ (void)identityForXPCServiceExecutablePath:(void *)a1 pid:(os_log_s *)a2 auid:host:UUID:.cold.4( void *a1,  os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  [a1 lastPathComponent];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_error_impl( &dword_185F67000,  a2,  OS_LOG_TYPE_ERROR,  "Couldn't generate XPCService definition for %{public}@",  v4,  0xCu);

  OUTLINED_FUNCTION_0_1();
}

+ (void)identityForXPCServiceExecutablePath:pid:auid:host:UUID:.cold.5()
{
}

+ (void)identityForXPCServiceExecutablePath:(os_log_s *)a3 pid:auid:host:UUID:.cold.6( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  xpc_strerror();
  OUTLINED_FUNCTION_5();
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl( &dword_185F67000,  a3,  OS_LOG_TYPE_ERROR,  "Error (%{public}s) creating xpc service bundle for %{public}@",  v5,  0x16u);
  OUTLINED_FUNCTION_0_1();
}

@end