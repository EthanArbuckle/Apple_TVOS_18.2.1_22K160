@interface MIAppExtensionBundle
- (BOOL)targetsAppleExtensionPoint;
- (BOOL)targetsBrowserExtensionPoint;
- (BOOL)validateBundleMetadataWithError:(id *)a3;
- (BOOL)validateHasCorrespondingEntitlements:(id)a3 error:(id *)a4;
- (BOOL)validateHasNoDotInBundleIDSuffix:(id *)a3;
- (Class)dataContainerClass;
- (NSDictionary)extensionCacheEntry;
- (NSString)extensionPointIdentifier;
- (NSString)validationOverrideParentBundleID;
- (id)dataContainerCreatingIfNeeded:(BOOL)a3 forPersona:(id)a4 makeLive:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7;
- (id)dataContainerForPersona:(id)a3 error:(id *)a4;
- (id)extensionCacheEntryWithError:(id *)a3;
- (id)initForTesting;
- (id)minimumOSVersion;
- (unint64_t)extensionPoint;
- (void)setBundleParentDirectoryURL:(id)a3;
- (void)setExtensionCacheEntry:(id)a3;
- (void)setExtensionPoint:(unint64_t)a3;
- (void)setValidationOverrideParentBundleID:(id)a3;
@end

@implementation MIAppExtensionBundle

- (id)initForTesting
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MIAppExtensionBundle;
  return -[MIExecutableBundle initForTesting](&v3, sel_initForTesting);
}

- (id)minimumOSVersion
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MIAppExtensionBundle;
  -[MIBundle minimumOSVersion](&v6, sel_minimumOSVersion);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = -[MIBundle parentBundle](self, "parentBundle");
    [v4 minimumOSVersion];
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (Class)dataContainerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)targetsAppleExtensionPoint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 hasPrefix:@"com.apple."];

  return v3;
}

- (unint64_t)extensionPoint
{
  unint64_t extensionPoint = self->_extensionPoint;
  if (!extensionPoint)
  {
    v4 = -[MIAppExtensionBundle extensionPointIdentifier](self, "extensionPointIdentifier");
    if ([v4 isEqualToString:@"com.apple.web-browser-engine.content"])
    {
      unint64_t extensionPoint = 1LL;
    }

    else if ([v4 isEqualToString:@"com.apple.web-browser-engine.networking"])
    {
      unint64_t extensionPoint = 3LL;
    }

    else if ([v4 isEqualToString:@"com.apple.web-browser-engine.rendering"])
    {
      unint64_t extensionPoint = 2LL;
    }

    else
    {
      unint64_t extensionPoint = -1LL;
    }

    self->_unint64_t extensionPoint = extensionPoint;
  }

  return extensionPoint;
}

- (BOOL)targetsBrowserExtensionPoint
{
  return -[MIAppExtensionBundle extensionPoint](self, "extensionPoint") - 1 < 3;
}

- (void)setBundleParentDirectoryURL:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MIAppExtensionBundle;
  -[MIExecutableBundle setBundleParentDirectoryURL:](&v3, sel_setBundleParentDirectoryURL_, a3);
}

- (id)dataContainerForPersona:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MIAppExtensionBundle;
  -[MIExecutableBundle dataContainerForPersona:error:](&v5, sel_dataContainerForPersona_error_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dataContainerCreatingIfNeeded:(BOOL)a3 forPersona:(id)a4 makeLive:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7
{
  BOOL v16 = 0;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MIAppExtensionBundle;
  uint64_t v9 = -[MIExecutableBundle dataContainerCreatingIfNeeded:forPersona:makeLive:created:error:]( &v15,  sel_dataContainerCreatingIfNeeded_forPersona_makeLive_created_error_,  a3,  a4,  a5,  &v16,  a7);
  v10 = (void *)v9;
  BOOL v11 = v16;
  if (a6) {
    *a6 = v16;
  }
  if (v9) {
    BOOL v12 = !v11;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    v13 = -[MIBundle parentBundleID](self, "parentBundleID");
    [v10 setParentBundleID:v13];
  }

  return v10;
}

- (BOOL)validateHasNoDotInBundleIDSuffix:(id *)a3
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIAppExtensionBundle validationOverrideParentBundleID](self, "validationOverrideParentBundleID");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    uint64_t v7 = -[MIAppExtensionBundle validationOverrideParentBundleID](self, "validationOverrideParentBundleID");

    objc_super v5 = (void *)v7;
  }

  [v5 stringByAppendingString:@"."];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle identifier](self, "identifier");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v8, "length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  int v11 = [v10 containsString:@"."];
  if (v11)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 path];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MIBundle identifier](self, "identifier");
    _CreateAndLogError( (uint64_t)"-[MIAppExtensionBundle validateHasNoDotInBundleIDSuffix:]",  218LL,  @"MIInstallerErrorDomain",  89LL,  0LL,  &unk_189D648D0,  @"Appex bundle at %@ with identifier %@ contains a '.' in the portion after the parent app's prefix (prefix: %@ ; dot in: %@).'",
      v14,
      (uint64_t)v13);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      id v15 = v15;
      *a3 = v15;
    }
  }

  else
  {
    id v15 = 0LL;
  }

  return v11 ^ 1;
}

- (BOOL)validateBundleMetadataWithError:(id *)a3
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIAppExtensionBundle validationOverrideParentBundleID](self, "validationOverrideParentBundleID");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;

    objc_super v5 = v8;
  }

  [v5 stringByAppendingString:@"."];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MIBundle identifier](self, "identifier");
  if (([v10 hasPrefix:v9] & 1) == 0)
  {

    goto LABEL_10;
  }

  -[MIBundle identifier](self, "identifier");
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v12 = [v11 length];
  unint64_t v13 = [v9 length];

  if (v12 <= v13)
  {
LABEL_10:
    v22 = -[MIBundle bundleURL](self, "bundleURL");
    [v22 path];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MIBundle identifier](self, "identifier");
    _CreateAndLogError( (uint64_t)"-[MIAppExtensionBundle validateBundleMetadataWithError:]",  269LL,  @"MIInstallerErrorDomain",  37LL,  0LL,  &unk_189D648F8,  @"Appex bundle at \"%@\" with identifier \"%@\" does not have expected identifier prefix \"%@\"",  v25,  (uint64_t)v23);
    goto LABEL_11;
  }

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v15 = MIHasStringValueOfNonZeroLength(v14, *MEMORY[0x189604E18], 0LL);

  if (v15)
  {
    -[MIBundle infoPlistSubset](self, "infoPlistSubset");
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v17 = MIHasStringValueOfNonZeroLength(v16, *MEMORY[0x189604AC8], 1LL);

    if (v17)
    {
      v18 = -[MIBundle infoPlistSubset](self, "infoPlistSubset");
      BOOL v19 = MIHasStringValueOfNonZeroLength(v18, *MEMORY[0x189604E10], 0LL);

      if (v19)
      {
        id v20 = 0LL;
        BOOL v21 = 1;
        goto LABEL_14;
      }
      v22 = -[MIBundle bundleURL](self, "bundleURL");
      [v22 path];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[MIBundle identifier](self, "identifier");
      _CreateAndLogError( (uint64_t)"-[MIAppExtensionBundle validateBundleMetadataWithError:]",  287LL,  @"MIInstallerErrorDomain",  52LL,  0LL,  &unk_189D64970,  @"Appex bundle at %@ with ID %@ does not have a CFBundleName key with a non-zero length string value in its Info.plist",  v29,  (uint64_t)v23);
    }

    else
    {
      v22 = -[MIBundle bundleURL](self, "bundleURL");
      [v22 path];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[MIBundle identifier](self, "identifier");
      _CreateAndLogError( (uint64_t)"-[MIAppExtensionBundle validateBundleMetadataWithError:]",  281LL,  @"MIInstallerErrorDomain",  40LL,  0LL,  &unk_189D64948,  @"Appex bundle at %@ with ID %@ has a CFBundleShortVersionString key with a non-string value in its Info.plist",  v28,  (uint64_t)v23);
    }
  }

  else
  {
    v22 = -[MIBundle bundleURL](self, "bundleURL");
    [v22 path];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MIBundle identifier](self, "identifier");
    _CreateAndLogError( (uint64_t)"-[MIAppExtensionBundle validateBundleMetadataWithError:]",  275LL,  @"MIInstallerErrorDomain",  33LL,  0LL,  &unk_189D64920,  @"Appex bundle at %@ with ID %@ does not have a CFBundleVersion key with a non-zero length string value in its Info.plist",  v27,  (uint64_t)v23);
  }

- (BOOL)validateHasCorrespondingEntitlements:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[MIBundle parentBundleID](self, "parentBundleID");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v8 = -[MIAppExtensionBundle extensionPoint](self, "extensionPoint");
  if (MIHasBrowserEngineContentEntitlement(v6))
  {
    if (v8 != 1)
    {
      -[MIBundle relativePath](self, "relativePath");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIAppExtensionBundle extensionPointIdentifier](self, "extensionPointIdentifier");
      int v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = (uint64_t)v9;
      unint64_t v12 = @"The app extension at %@ has the entitlement %@ which is not allowed for an extension targeting the extension point %@.";
      uint64_t v13 = 317LL;
LABEL_21:
      uint64_t v15 = 205LL;
      goto LABEL_22;
    }
  }

  else if (v8 == 1)
  {
    -[MIBundle relativePath](self, "relativePath");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIAppExtensionBundle extensionPointIdentifier](self, "extensionPointIdentifier");
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = (uint64_t)v9;
    unint64_t v12 = @"The app extension at %@ targets the extension point %@ but is missing the corresponding required %@ = TRUE (BOOLean) entitlement.";
    uint64_t v13 = 322LL;
    goto LABEL_19;
  }

  if (MIHasBrowserEngineNetworkingEntitlement(v6))
  {
    if (v8 != 3)
    {
      -[MIBundle relativePath](self, "relativePath");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIAppExtensionBundle extensionPointIdentifier](self, "extensionPointIdentifier");
      int v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = (uint64_t)v9;
      unint64_t v12 = @"The app extension at %@ has the entitlement %@ which is not allowed for an extension targeting the extension point %@.";
      uint64_t v13 = 329LL;
      goto LABEL_21;
    }
  }

  else if (v8 == 3)
  {
    -[MIBundle relativePath](self, "relativePath");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIAppExtensionBundle extensionPointIdentifier](self, "extensionPointIdentifier");
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = (uint64_t)v9;
    unint64_t v12 = @"The app extension at %@ targets the extension point %@ but is missing the corresponding required %@ = TRUE (BOOLean) entitlement.";
    uint64_t v13 = 334LL;
    goto LABEL_19;
  }

  if (!MIHasBrowserEngineRenderingEntitlement(v6))
  {
    if (v8 != 2)
    {
      if (v8 != 1)
      {
LABEL_30:
        id v16 = 0LL;
        BOOL v17 = 1;
        goto LABEL_31;
      }

      MICopyMemoryTransferAcceptEntitlement(v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = v18;
      if (v18 && v7 && ![v18 isEqualToString:v7])
      {
        -[MIBundle relativePath](self, "relativePath");
        int v11 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = (uint64_t)v11;
        unint64_t v12 = @"The app extension at %@ specifies the entitlement %@ = %@ where the value does not match the parent app bundle's CFBundleIdentifier, %@. This entitlement, if set, must have a value that matches the bundle identifier of the parent app.";
        uint64_t v13 = 357LL;
        goto LABEL_33;
      }

- (id)extensionCacheEntryWithError:(id *)a3
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_extensionCacheEntry = &self->_extensionCacheEntry;
  uint64_t v7 = self->_extensionCacheEntry;
  if (!v7)
  {
    if (v5)
    {
      uint64_t active_platform = dyld_get_active_platform();
      id v15 = 0LL;
      MICopyExtensionCacheEntryWithPlatform(v5, active_platform, &v15);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      id v11 = v15;
      if (v10)
      {
        objc_storeStrong((id *)p_extensionCacheEntry, v10);
LABEL_10:
        unint64_t v8 = v10;

        goto LABEL_11;
      }
    }

    else
    {
      -[MIBundle identifier](self, "identifier");
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError( (uint64_t)"-[MIAppExtensionBundle extensionCacheEntryWithError:]",  391LL,  @"MIInstallerErrorDomain",  45LL,  0LL,  0LL,  @"Extension point identifier was not set for app extension with bundle ID %@.",  v13,  (uint64_t)v12);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }

    if (a3)
    {
      id v11 = v11;
      uint64_t v10 = 0LL;
      *a3 = v11;
    }

    else
    {
      uint64_t v10 = 0LL;
    }

    goto LABEL_10;
  }

  unint64_t v8 = v7;
LABEL_11:

  return v8;
}

- (void)setExtensionCacheEntry:(id)a3
{
}

- (NSString)extensionPointIdentifier
{
  return self->_extensionPointIdentifier;
}

- (void)setExtensionPoint:(unint64_t)a3
{
  self->_unint64_t extensionPoint = a3;
}

- (NSString)validationOverrideParentBundleID
{
  return self->_validationOverrideParentBundleID;
}

- (void)setValidationOverrideParentBundleID:(id)a3
{
}

- (NSDictionary)extensionCacheEntry
{
  return self->_extensionCacheEntry;
}

- (void).cxx_destruct
{
}

@end