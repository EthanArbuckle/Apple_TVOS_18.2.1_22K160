@interface MIPluginKitBundle
+ (id)bundlesInParentBundle:(id)a3 overrideParentBundleIDForValidation:(id)a4 subDirectory:(id)a5 matchingPredicate:(id)a6 error:(id *)a7;
+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6;
- (BOOL)_validateNSExtensionWithOverlaidDictionary:(id)a3 error:(id *)a4;
- (BOOL)_validateXPCServiceWithOverlaidDictionary:(id)a3 error:(id *)a4;
- (BOOL)isFileProviderNonUIExtension;
- (BOOL)isMapsGeoServicesExtension;
- (BOOL)isMessagePayloadProviderExtension;
- (BOOL)isSiriIntentsExtension;
- (BOOL)isSiriIntentsUIExtension;
- (BOOL)isWatchKitExtension;
- (BOOL)mayContainFrameworks;
- (BOOL)validateBundleMetadataWithError:(id *)a3;
- (NSDictionary)extensionAttributes;
- (NSDictionary)overlaidInfoPlist;
- (NSString)exExtensionPointIdentifier;
- (NSString)nsExtensionPointIdentifier;
- (id)_overlayDictionary:(id)a3 onDictionary:(id)a4;
- (id)extensionPointIdentifier;
- (id)overlaidInfoPlistWithError:(id *)a3;
- (void)setOverlaidInfoPlist:(id)a3;
@end

@implementation MIPluginKitBundle

+ (id)bundlesInParentBundle:(id)a3 overrideParentBundleIDForValidation:(id)a4 subDirectory:(id)a5 matchingPredicate:(id)a6 error:(id *)a7
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v12 = a4;
  v24.receiver = a1;
  v24.super_class = (Class)&OBJC_METACLASS___MIPluginKitBundle;
  objc_msgSendSuper2(&v24, sel_bundlesInParentBundle_subDirectory_matchingPredicate_error_, a3, a5, a6, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        uint64_t v18 = 0LL;
        do
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * v18++) setValidationOverrideParentBundleID:v12];
        }

        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }

      while (v16);
    }
  }

  return v14;
}

+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6
{
  return (id)[a1 bundlesInParentBundle:a3 overrideParentBundleIDForValidation:0 subDirectory:a4 matchingPredicate:a5 error:a6];
}

- (NSString)nsExtensionPointIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"NSExtension"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  if (v5)
  {
    [v5 objectForKeyedSubscript:@"NSExtensionPointIdentifier"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v8 = v7;
    }
    else {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return (NSString *)v8;
}

- (NSString)exExtensionPointIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"EXAppExtensionAttributes"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0LL;
  }

  if (v5)
  {
    [v5 objectForKeyedSubscript:@"EXExtensionPointIdentifier"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v8 = v7;
    }
    else {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return (NSString *)v8;
}

- (id)extensionPointIdentifier
{
  extensionPointIdentifier = self->_extensionPointIdentifier;
  if (!extensionPointIdentifier)
  {
    -[MIPluginKitBundle exExtensionPointIdentifier](self, "exExtensionPointIdentifier");
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_extensionPointIdentifier;
    self->_extensionPointIdentifier = v4;

    extensionPointIdentifier = self->_extensionPointIdentifier;
    if (!extensionPointIdentifier)
    {
      -[MIPluginKitBundle nsExtensionPointIdentifier](self, "nsExtensionPointIdentifier");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v7 = self->_extensionPointIdentifier;
      self->_extensionPointIdentifier = v6;

      extensionPointIdentifier = self->_extensionPointIdentifier;
    }
  }

  return extensionPointIdentifier;
}

- (NSDictionary)extensionAttributes
{
  extensionAttributes = self->_extensionAttributes;
  if (!extensionAttributes)
  {
    -[MIBundle infoPlistSubset](self, "infoPlistSubset");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:@"NSExtension"];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v6 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v7 = v6;
    }
    else {
      id v7 = 0LL;
    }

    if (v7)
    {
      [v7 objectForKeyedSubscript:@"NSExtensionAttributes"];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      id v9 = v8;
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        v10 = (NSDictionary *)v9;
      }
      else {
        v10 = 0LL;
      }

      v11 = self->_extensionAttributes;
      self->_extensionAttributes = v10;
    }

    extensionAttributes = self->_extensionAttributes;
  }

  return extensionAttributes;
}

- (BOOL)isWatchKitExtension
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isEqualToString:@"com.apple.watchkit"];

  return v3;
}

- (BOOL)isSiriIntentsExtension
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isEqualToString:@"com.apple.intents-service"];

  return v3;
}

- (BOOL)isSiriIntentsUIExtension
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isEqualToString:@"com.apple.intents-ui-service"];

  return v3;
}

- (BOOL)isMessagePayloadProviderExtension
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isEqualToString:@"com.apple.message-payload-provider"];

  return v3;
}

- (BOOL)isFileProviderNonUIExtension
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isEqualToString:@"com.apple.fileprovider-nonui"];

  return v3;
}

- (BOOL)isMapsGeoServicesExtension
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isEqualToString:@"com.apple.geoservices.mapdata"];

  return v3;
}

- (BOOL)mayContainFrameworks
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MIPluginKitBundle;
  return -[MIBundle mayContainFrameworks](&v4, sel_mayContainFrameworks)
      || -[MIPluginKitBundle isWatchKitExtension](self, "isWatchKitExtension");
}

- (id)_overlayDictionary:(id)a3 onDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[v6 mutableCopy];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __53__MIPluginKitBundle__overlayDictionary_onDictionary___block_invoke;
  v13[3] = &unk_189D48B80;
  id v14 = v6;
  id v15 = v8;
  uint64_t v16 = self;
  id v9 = v8;
  id v10 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v13];

  v11 = (void *)[v9 copy];
  return v11;
}

void __53__MIPluginKitBundle__overlayDictionary_onDictionary___block_invoke( id *a1,  void *a2,  void *a3,  _BYTE *a4)
{
  id v10 = a2;
  id v7 = a3;
  *a4 = 0;
  [a1[4] objectForKeyedSubscript:v10];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        [a1[6] _overlayDictionary:v7 onDictionary:v8];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        [a1[5] setObject:v9 forKeyedSubscript:v10];
      }
    }
  }

  else
  {
    [a1[5] setObject:v7 forKeyedSubscript:v10];
  }
}

- (id)overlaidInfoPlistWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    id v6 = 0LL;
    goto LABEL_3;
  }

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKeyedSubscript:@"NSExtension"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0LL;
  }

  if (!v11)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 path];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[MIBundle identifier](self, "identifier");
    _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]",  177LL,  @"MIInstallerErrorDomain",  39LL,  0LL,  &unk_189D641C8,  @"Appex bundle at %@ with id %@ does not define an NSExtension dictionary in its Info.plist",  v17,  (uint64_t)v16);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_22:
    goto LABEL_23;
  }

  [v11 objectForKeyedSubscript:@"NSExtensionPointIdentifier"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v13 = v12;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v14 = v13;
  }
  else {
    id v14 = 0LL;
  }

  if (!v14)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 path];
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]",  184LL,  @"MIInstallerErrorDomain",  45LL,  0LL,  &unk_189D641F0,  @"Appex bundle at %@ with id %@ does not define a NSExtensionPointIdentifier key with a string value in the NSExtension dictionary in its Info.plist",  v24,  (uint64_t)v22);
LABEL_19:
    id v6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
LABEL_21:

    goto LABEL_22;
  }

  if ((MIIsValidRDNSString(v13) & 1) == 0)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 path];
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]",  190LL,  @"MIInstallerErrorDomain",  46LL,  0LL,  &unk_189D64218,  @"Appex bundle at %@ with id %@ does not have a legal value for the NSExtensionPointIdentifier key in the NSExtension dictionary in its Info.plist; found: %@",
      v25,
      (uint64_t)v22);
    goto LABEL_19;
  }

  [v8 objectForKeyedSubscript:@"EXAppExtensionAttributes"];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v19 = v18;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v20 = v19;
  }
  else {
    id v20 = 0LL;
  }

  [v20 objectForKeyedSubscript:@"EXExtensionPointIdentifier"];
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_opt_class();
    id v27 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((MIIsValidRDNSString(v27) & 1) != 0)
      {

        goto LABEL_32;
      }

      v48 = v20;
      v33 = -[MIBundle bundleURL](self, "bundleURL");
      [v33 path];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[MIBundle identifier](self, "identifier");
      _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]",  202LL,  @"MIInstallerErrorDomain",  46LL,  0LL,  &unk_189D64240,  @"Appex bundle at %@ with id %@ does not have a legal value for the EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist; found: %@",
        v39,
        (uint64_t)v34);
      id v6 = (id)objc_claimAutoreleasedReturnValue();

      v32 = v27;
    }

    else
    {
      v48 = v20;
      v32 = -[MIBundle bundleURL](self, "bundleURL");
      [v32 path];
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[MIBundle identifier](self, "identifier");
      _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]",  206LL,  @"MIInstallerErrorDomain",  45LL,  0LL,  &unk_189D64268,  @"Appex bundle at %@ with id %@ defines an EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist with a value that is not a string.",  v35,  (uint64_t)v33);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_21;
  }

- (BOOL)_validateXPCServiceWithOverlaidDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 objectForKeyedSubscript:@"XPCService"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 path];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle _validateXPCServiceWithOverlaidDictionary:error:]",  250LL,  @"MIInstallerErrorDomain",  38LL,  0LL,  &unk_189D64308,  @"Appex bundle at %@ with id %@ defines a value for the XPCService key in its Info.plist that is not a dictionary.",  v16,  (uint64_t)v14);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
    id v11 = 0LL;
    goto LABEL_21;
  }

  [v7 objectForKeyedSubscript:@"RunLoopType"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v8 length])
    {
      -[MIBundle bundleURL](self, "bundleURL");
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 path];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle identifier](self, "identifier");
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle _validateXPCServiceWithOverlaidDictionary:error:]",  260LL,  @"MIInstallerErrorDomain",  50LL,  0LL,  &unk_189D64330,  @"Appex bundle at %@ with id %@ has an illegal value for the RunLoopType key in the XPCService dictionary in its Info.plist",  v19,  (uint64_t)v15);
LABEL_19:
      id v12 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    }
  }

  if ([v8 isEqualToString:@"_UIApplicationMain"])
  {
    -[MIBundle infoPlistSubset](self, "infoPlistSubset");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v10 = MIHasRequiredStringValueOfNonZeroLengthCF(v9, *MEMORY[0x189604AA0]);

    if (!v10)
    {
      -[MIBundle bundleURL](self, "bundleURL");
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 path];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle identifier](self, "identifier");
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle _validateXPCServiceWithOverlaidDictionary:error:]",  266LL,  @"MIInstallerErrorDomain",  53LL,  0LL,  &unk_189D64358,  @"Appex bundle at %@ with ID %@ does not have a CFBundleDisplayName key with a non-zero length string value in its Info.plist",  v21,  (uint64_t)v15);
      goto LABEL_19;
    }
  }

  if (!MIHasStringValueOfNonZeroLengthIfDefined(v7, (uint64_t)@"ServiceType"))
  {
    -[MIBundle bundleURL](self, "bundleURL");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 path];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle _validateXPCServiceWithOverlaidDictionary:error:]",  272LL,  @"MIInstallerErrorDomain",  51LL,  0LL,  &unk_189D64380,  @"Appex bundle at %@ with id %@ has an illegal value for the ServiceType key in the XPCService dictionary in its Info.plist",  v20,  (uint64_t)v15);
    goto LABEL_19;
  }

LABEL_10:
  [v6 objectForKeyedSubscript:*MEMORY[0x189604AB8]];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v11 isEqualToString:@"XPC!"] & 1) != 0)
  {
    id v12 = 0LL;
    BOOL v13 = 1;
    goto LABEL_24;
  }

  -[MIBundle bundleURL](self, "bundleURL");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 path];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle identifier](self, "identifier");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle _validateXPCServiceWithOverlaidDictionary:error:]",  280LL,  @"MIInstallerErrorDomain",  41LL,  0LL,  &unk_189D643A8,  @"Appex bundle at %@ with id %@ has an illegal value for the CFBundlePackageType key in its Info.plist: %@",  v17,  (uint64_t)v14);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

  if (a4)
  {
    id v12 = v12;
    BOOL v13 = 0;
    *a4 = v12;
  }

  else
  {
    BOOL v13 = 0;
  }

- (BOOL)_validateNSExtensionWithOverlaidDictionary:(id)a3 error:(id *)a4
{
  uint64_t v100 = *MEMORY[0x1895F89C0];
  [a3 objectForKeyedSubscript:@"NSExtension"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0LL;
  }

  if (!v8)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 path];
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = -[MIBundle identifier](self, "identifier");
    _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]",  331LL,  @"MIInstallerErrorDomain",  39LL,  0LL,  &unk_189D643D0,  @"Appex bundle at %@ with id %@ does not define an NSExtension dictionary in its Info.plist",  v14,  (uint64_t)v13);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    unint64_t v11 = 0LL;
    unint64_t v16 = 0LL;
    id v17 = 0LL;
    uint64_t v18 = 0LL;
LABEL_16:
    id v22 = 0LL;
    goto LABEL_58;
  }

  [v8 objectForKeyedSubscript:@"NSExtensionMainStoryboard"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    unint64_t v11 = (unint64_t)v10;
  }
  else {
    unint64_t v11 = 0LL;
  }

  [v8 objectForKeyedSubscript:@"NSExtensionPrincipalClass"];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v20 = v19;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    unint64_t v16 = (unint64_t)v20;
  }
  else {
    unint64_t v16 = 0LL;
  }

  id v98 = 0LL;
  -[MIAppExtensionBundle extensionCacheEntryWithError:](self, "extensionCacheEntryWithError:", &v98);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v98;
  if (!v18)
  {
    id v17 = 0LL;
    goto LABEL_16;
  }

  [v18 objectForKeyedSubscript:@"NSExtension"];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v22 = v21;
  v93 = a4;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v17 = v22;
  }
  else {
    id v17 = 0LL;
  }

  if (!v17)
  {
    uint64_t v34 = _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]",  345LL,  @"MIInstallerErrorDomain",  154LL,  0LL,  0LL,  @"Extension cache does not define an NSExtension dictionary in its Info.plist: %@",  v23,  (uint64_t)v18);

    id v15 = (id)v34;
    goto LABEL_57;
  }

  [v22 objectForKeyedSubscript:@"NSExtensionPrincipalClassProhibited"];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  int v25 = MIBooleanValue(v24, 0LL);

  if (v25
    && !-[MIBundle isApplicableToOSVersionEarlierThan:](self, "isApplicableToOSVersionEarlierThan:", @"14.0"))
  {
    if (v11 | v16)
    {
      unint64_t v89 = v11;
      -[MIBundle bundleURL](self, "bundleURL");
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 path];
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[MIBundle identifier](self, "identifier");
      v85 = -[MIPluginKitBundle extensionPointIdentifier](self, "extensionPointIdentifier");
      uint64_t v39 = _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]",  362LL,  @"MIInstallerErrorDomain",  152LL,  0LL,  &unk_189D64420,  @"Appex bundle at %@ with id %@ defines either an NSExtensionMainStoryboard or NSExtensionPrincipalClass key, which is not allowed for the extension point %@",  v38,  (uint64_t)v36);

      id v17 = 0LL;
      id v15 = (id)v39;
      unint64_t v11 = v89;
      goto LABEL_57;
    }
  }

  else if (!(v11 | v16) || v11 && ![(id)v11 length] || v16 && !objc_msgSend((id)v16, "length"))
  {
    -[MIBundle bundleURL](self, "bundleURL");
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 path];
    id v91 = v8;
    id v27 = v18;
    id v28 = v22;
    unint64_t v29 = v16;
    unint64_t v30 = v11;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = -[MIBundle identifier](self, "identifier");
    uint64_t v33 = _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]",  357LL,  @"MIInstallerErrorDomain",  42LL,  0LL,  &unk_189D643F8,  @"Appex bundle at %@ with id %@ does not define either an NSExtensionMainStoryboard or NSExtensionPrincipalClass key with a string value in the NSExtension dictionary in its Info.plist",  v32,  (uint64_t)v31);

    unint64_t v11 = v30;
    unint64_t v16 = v29;
    id v22 = v28;
    uint64_t v18 = v27;
    id v8 = v91;

    id v17 = 0LL;
    id v15 = (id)v33;
LABEL_57:
    a4 = v93;
    goto LABEL_58;
  }

  if (!MIHasStringValueOfNonZeroLengthIfDefined(v8, (uint64_t)@"NSExtensionContextClass"))
  {
    unint64_t v52 = v11;
    v53 = -[MIBundle bundleURL](self, "bundleURL");
    [v53 path];
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = -[MIBundle identifier](self, "identifier");
    uint64_t v56 = _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]",  369LL,  @"MIInstallerErrorDomain",  43LL,  0LL,  &unk_189D64448,  @"Appex bundle at %@ with id %@ does not have a string value for the NSExtensionContextClass key in the NSExtension dictionary in its Info.plist",  v55,  (uint64_t)v54);

    id v17 = 0LL;
    id v15 = (id)v56;
    unint64_t v11 = v52;
    goto LABEL_57;
  }

  a4 = v93;
  unint64_t v90 = v11;
  if (!MIHasStringValueOfNonZeroLengthIfDefined(v8, (uint64_t)@"NSExtensionContextHostClass"))
  {
    v58 = -[MIBundle bundleURL](self, "bundleURL");
    [v58 path];
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = -[MIBundle identifier](self, "identifier");
    _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]",  375LL,  @"MIInstallerErrorDomain",  44LL,  0LL,  &unk_189D64470,  @"Appex bundle at %@ with id %@ does not have a string value for the NSExtensionContextHostClass key in the NSExtension dictionary in its Info.plist",  v61,  (uint64_t)v59);
    uint64_t v63 = LABEL_64:;

    id v17 = 0LL;
LABEL_65:
    id v15 = (id)v63;
    goto LABEL_66;
  }

  if (!MIHasStringValueOfNonZeroLengthIfDefined(v8, (uint64_t)@"NSExtensionViewControllerHostClass"))
  {
    v58 = -[MIBundle bundleURL](self, "bundleURL");
    [v58 path];
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = -[MIBundle identifier](self, "identifier");
    _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]",  381LL,  @"MIInstallerErrorDomain",  68LL,  0LL,  &unk_189D64498,  @"Appex bundle at %@ with id %@ does not have a string value for the NSExtensionViewControllerHostClass key in the NSExtension dictionary in its Info.plist",  v62,  (uint64_t)v59);
    goto LABEL_64;
  }

  [v8 objectForKeyedSubscript:@"NSExtensionAttributes"];
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17) {
    goto LABEL_55;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v64 = -[MIBundle bundleURL](self, "bundleURL");
    [v64 path];
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = -[MIBundle identifier](self, "identifier");
    _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]",  390LL,  @"MIInstallerErrorDomain",  47LL,  0LL,  &unk_189D644C0,  @"Appex bundle at %@ with id %@ does not define a NSExtensionAttributes key with a dictionary value in the NSExtension dictionary in its Info.plist",  v67,  (uint64_t)v65);
    uint64_t v63 = LABEL_70:;

    a4 = v93;
    goto LABEL_65;
  }

  if (!MIHasStringValueOfNonZeroLengthIfDefined(v17, (uint64_t)@"NSExtensionPointName"))
  {
    v64 = -[MIBundle bundleURL](self, "bundleURL");
    [v64 path];
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = -[MIBundle identifier](self, "identifier");
    _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]",  397LL,  @"MIInstallerErrorDomain",  48LL,  0LL,  &unk_189D644E8,  @"Appex bundle at %@ with id %@ does not define a NSExtensionPointName key with a string value in the NSExtensionAttributes dictionary in the NSExtension dictionary in its Info.plist",  v68,  (uint64_t)v65);
    goto LABEL_70;
  }

  if (!MIHasStringValueOfNonZeroLengthIfDefined(v17, (uint64_t)@"NSExtensionPointVersion"))
  {
    v64 = -[MIBundle bundleURL](self, "bundleURL");
    [v64 path];
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = -[MIBundle identifier](self, "identifier");
    _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]",  403LL,  @"MIInstallerErrorDomain",  49LL,  0LL,  &unk_189D64510,  @"Appex bundle at %@ with id %@ does not define a NSExtensionPointVersion key with a string value in the NSExtensionAttributes dictionary in the NSExtension dictionary in its Info.plist",  v69,  (uint64_t)v65);
    goto LABEL_70;
  }

  if (!-[MIPluginKitBundle isSiriIntentsExtension](self, "isSiriIntentsExtension")
    && !-[MIPluginKitBundle isSiriIntentsUIExtension](self, "isSiriIntentsUIExtension"))
  {
    goto LABEL_55;
  }

  [v17 objectForKeyedSubscript:@"IntentsSupported"];
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  _MIValidateObject(v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v88 = v41;
  if (v41)
  {
    objc_opt_class();
    if (MIArrayContainsOnlyClass(v41))
    {
      if ([v41 count])
      {
        [v17 objectForKeyedSubscript:@"IntentsRestrictedWhileLocked"];
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          id v92 = v8;
          v86 = v18;
          objc_opt_class();
          v87 = v42;
          uint64_t v43 = _MIValidateObject(v42);
          if (!v43
            || (v44 = (void *)v43,
                objc_opt_class(),
                char v45 = MIArrayContainsOnlyClass(v42),
                v44,
                (v45 & 1) == 0))
          {
            -[MIBundle bundleURL](self, "bundleURL");
            id v46 = (id)objc_claimAutoreleasedReturnValue();
            [v46 path];
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = -[MIBundle identifier](self, "identifier");
            uint64_t v77 = _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]",  421LL,  @"MIInstallerErrorDomain",  115LL,  0LL,  &unk_189D64560,  @"Siri Intents Appex bundle at %@ with id %@ defines an IntentsRestrictedWhileLocked key in the ExtensionAttributes dictionary in the NSExtensionDictionary in its Info.plist, but that key's value is not an array of strings.",  v76,  (uint64_t)v74);
LABEL_74:

            id v15 = (id)v77;
            id v8 = v92;
            a4 = v93;
            unint64_t v11 = v90;
            uint64_t v18 = v86;
            goto LABEL_58;
          }

          __int128 v96 = 0u;
          __int128 v97 = 0u;
          __int128 v94 = 0u;
          __int128 v95 = 0u;
          id v46 = v87;
          uint64_t v47 = [v46 countByEnumeratingWithState:&v94 objects:v99 count:16];
          if (v47)
          {
            uint64_t v48 = v47;
            uint64_t v49 = *(void *)v95;
            while (2)
            {
              for (uint64_t i = 0LL; i != v48; ++i)
              {
                if (*(void *)v95 != v49) {
                  objc_enumerationMutation(v46);
                }
                if (![v41 containsObject:*(void *)(*((void *)&v94 + 1) + 8 * i)])
                {
                  v74 = -[MIBundle bundleURL](self, "bundleURL");
                  uint64_t v78 = [v74 path];
                  uint64_t v84 = -[MIBundle identifier](self, "identifier");
                  v75 = (void *)v78;
                  uint64_t v77 = _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]",  429LL,  @"MIInstallerErrorDomain",  116LL,  0LL,  &unk_189D64588,  @"Siri Intents Appex bundle at %@ with id %@ specifies a value in the IntentsRestrictedWhileLocked key's array value in the ExtensionAttributes dictionary in the NSExtensionDictionary in its Info.plist that is not a listed in the the IntentsSupported key's array.",  v79,  v78);

                  id v15 = (id)v84;
                  goto LABEL_74;
                }
              }

              uint64_t v48 = [v46 countByEnumeratingWithState:&v94 objects:v99 count:16];
              if (v48) {
                continue;
              }
              break;
            }
          }

          uint64_t v18 = v86;
          v42 = v87;
          id v8 = v92;
        }

LABEL_55:
        BOOL v51 = 1;
        unint64_t v11 = v90;
        goto LABEL_61;
      }
    }
  }
  v70 = -[MIBundle bundleURL](self, "bundleURL");
  [v70 path];
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = -[MIBundle identifier](self, "identifier");
  uint64_t v73 = _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]",  412LL,  @"MIInstallerErrorDomain",  114LL,  0LL,  &unk_189D64538,  @"Siri Intents Appex bundle at %@ with id %@ does not define an IntentsSupported key with an array value containing strings in the ExtensionAttributes dictionary in the NSExtensionDictionary in its Info.plist.",  v72,  (uint64_t)v71);

  id v15 = (id)v73;
  a4 = v93;
LABEL_66:
  unint64_t v11 = v90;
LABEL_58:
  if (a4)
  {
    id v15 = v15;
    BOOL v51 = 0;
    *a4 = v15;
  }

  else
  {
    BOOL v51 = 0;
  }

- (BOOL)validateBundleMetadataWithError:(id *)a3
{
  id v19 = 0LL;
  -[MIPluginKitBundle overlaidInfoPlistWithError:](self, "overlaidInfoPlistWithError:", &v19);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v19;
  id v7 = v6;
  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___MIPluginKitBundle;
    id v18 = v6;
    unsigned int v8 = -[MIAppExtensionBundle validateBundleMetadataWithError:](&v17, sel_validateBundleMetadataWithError_, &v18);
    id v9 = v18;

    if (!v8) {
      goto LABEL_9;
    }
    id v16 = v9;
    BOOL v10 = -[MIAppExtensionBundle validateHasNoDotInBundleIDSuffix:](self, "validateHasNoDotInBundleIDSuffix:", &v16);
    id v7 = v16;

    if (v10)
    {
      id v15 = v7;
      BOOL v11 = -[MIPluginKitBundle _validateXPCServiceWithOverlaidDictionary:error:]( self,  "_validateXPCServiceWithOverlaidDictionary:error:",  v5,  &v15);
      id v9 = v15;

      if (v11)
      {
        id v14 = v9;
        BOOL v12 = -[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]( self,  "_validateNSExtensionWithOverlaidDictionary:error:",  v5,  &v14);
        id v7 = v14;

        if (!a3) {
          goto LABEL_12;
        }
        goto LABEL_10;
      }

- (NSDictionary)overlaidInfoPlist
{
  return self->_overlaidInfoPlist;
}

- (void)setOverlaidInfoPlist:(id)a3
{
}

- (void).cxx_destruct
{
}

@end