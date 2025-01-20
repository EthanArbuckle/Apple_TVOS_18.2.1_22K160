@interface MIExtensionKitBundle
+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6;
- (BOOL)_validateDelegateClassWithError:(id *)a3;
- (BOOL)_validatePresenceOfSwiftEntrySectionInFile:(int)a3 shouldHaveSwiftEntry:(BOOL)a4 withError:(id *)a5;
- (BOOL)getMayTargetThirdPartyExtensionPoint:(BOOL *)a3 withError:(id *)a4;
- (BOOL)validateBundleMetadataWithError:(id *)a3;
- (NSDictionary)extensionAttributes;
- (id)extensionPointIdentifier;
@end

@implementation MIExtensionKitBundle

+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___MIExtensionKitBundle;
  objc_msgSendSuper2(&v7, sel_bundlesInParentBundle_subDirectory_matchingPredicate_error_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)extensionPointIdentifier
{
  extensionPointIdentifier = self->_extensionPointIdentifier;
  if (!extensionPointIdentifier)
  {
    v4 = -[MIExtensionKitBundle extensionAttributes](self, "extensionAttributes");
    v5 = v4;
    if (v4)
    {
      [v4 objectForKeyedSubscript:@"EXExtensionPointIdentifier"];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      id v7 = v6;
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        v8 = (NSString *)v7;
      }
      else {
        v8 = 0LL;
      }

      v9 = self->_extensionPointIdentifier;
      self->_extensionPointIdentifier = v8;
    }

    extensionPointIdentifier = self->_extensionPointIdentifier;
  }

  return extensionPointIdentifier;
}

- (NSDictionary)extensionAttributes
{
  extensionAttributes = self->_extensionAttributes;
  if (!extensionAttributes)
  {
    v4 = -[MIBundle infoPlistSubset](self, "infoPlistSubset");
    [v4 objectForKeyedSubscript:@"EXAppExtensionAttributes"];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v6 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v7 = (NSDictionary *)v6;
    }
    else {
      id v7 = 0LL;
    }

    v8 = self->_extensionAttributes;
    self->_extensionAttributes = v7;

    extensionAttributes = self->_extensionAttributes;
  }

  return extensionAttributes;
}

- (BOOL)getMayTargetThirdPartyExtensionPoint:(BOOL *)a3 withError:(id *)a4
{
  if (a3) {
    *a3 = 0;
  }
  return 1;
}

- (BOOL)_validatePresenceOfSwiftEntrySectionInFile:(int)a3 shouldHaveSwiftEntry:(BOOL)a4 withError:(id *)a5
{
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 0;
  v8 = -[MIExecutableBundle executableURL](self, "executableURL");
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __98__MIExtensionKitBundle__validatePresenceOfSwiftEntrySectionInFile_shouldHaveSwiftEntry_withError___block_invoke;
  v18[3] = &unk_189D48BF0;
  v18[4] = &v20;
  BOOL v19 = a4;
  v9 = (void *)MEMORY[0x186E27154](v18);
  id v10 = v8;
  if (parse_macho_iterate_slices_fd(a3, [v10 fileSystemRepresentation], (uint64_t)v9))
  {
    if (*((_BYTE *)v21 + 24))
    {
      id v12 = 0LL;
      int v13 = 1;
      goto LABEL_9;
    }

    _CreateAndLogError( (uint64_t)"-[MIExtensionKitBundle _validatePresenceOfSwiftEntrySectionInFile:shouldHaveSwiftEntry:withError:]",  137LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  &unk_189D645D8,  @"Expected executable at %@ %@to have a __swift5_entry section",  v11,  (uint64_t)v10);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    int v13 = *((unsigned __int8 *)v21 + 24);
    if (!a5) {
      goto LABEL_9;
    }
  }

  else
  {
    [v10 path];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIExtensionKitBundle _validatePresenceOfSwiftEntrySectionInFile:shouldHaveSwiftEntry:withError:]",  131LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  &unk_189D645B0,  @"Could not iterate slices in macho %@",  v15,  (uint64_t)v14);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    int v13 = 0;
    *((_BYTE *)v21 + 24) = 0;
    if (!a5) {
      goto LABEL_9;
    }
  }

  if (!v13)
  {
    id v12 = v12;
    *a5 = v12;
    int v13 = *((unsigned __int8 *)v21 + 24);
  }

uint64_t __98__MIExtensionKitBundle__validatePresenceOfSwiftEntrySectionInFile_shouldHaveSwiftEntry_withError___block_invoke( uint64_t a1,  int a2,  mach_header_64 *mhp)
{
  unint64_t size = 0LL;
  v4 = getsectiondata(mhp, "__TEXT", "__swift5_entry", &size);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = *(_BYTE *)(a1 + 40) == (((unint64_t)v4 | size) != 0);
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
}

- (BOOL)_validateDelegateClassWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIExtensionKitBundle extensionAttributes](self, "extensionAttributes");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:@"EXPrincipalClass"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_opt_class();
    id v8 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ([v8 length])
      {

        goto LABEL_5;
      }

      -[MIBundle bundleURL](self, "bundleURL");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 path];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[MIBundle identifier](self, "identifier");
      _CreateAndLogError( (uint64_t)"-[MIExtensionKitBundle _validateDelegateClassWithError:]",  167LL,  @"MIInstallerErrorDomain",  185LL,  0LL,  &unk_189D64600,  @"Appex bundle at %@ with id %@ defines an EXPrincipalClass key in the EXAppExtensionAttributes dictionary in its Info.plist with a zero length string.",  v20,  (uint64_t)v12);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {

      -[MIBundle bundleURL](self, "bundleURL");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      [v8 path];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle identifier](self, "identifier");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError( (uint64_t)"-[MIExtensionKitBundle _validateDelegateClassWithError:]",  171LL,  @"MIInstallerErrorDomain",  183LL,  0LL,  &unk_189D64628,  @"Appex bundle at %@ with id %@ defines an EXPrincipalClass key in the EXAppExtensionAttributes dictionary in its Info.plist with a value that is not a string.",  v13,  (uint64_t)v11);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_17;
  }

- (BOOL)validateBundleMetadataWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIExtensionKitBundle extensionPointIdentifier](self, "extensionPointIdentifier");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = -[MIAppExtensionBundle targetsAppleExtensionPoint](self, "targetsAppleExtensionPoint");
  v52.receiver = self;
  v52.super_class = (Class)&OBJC_CLASS___MIExtensionKitBundle;
  id v53 = 0LL;
  unsigned int v8 = -[MIAppExtensionBundle validateBundleMetadataWithError:](&v52, sel_validateBundleMetadataWithError_, &v53);
  id v9 = v53;
  id v10 = v9;
  if (!v8) {
    goto LABEL_17;
  }
  id v51 = v9;
  BOOL v11 = -[MIAppExtensionBundle validateHasNoDotInBundleIDSuffix:](self, "validateHasNoDotInBundleIDSuffix:", &v51);
  id v12 = v51;

  if (!v11)
  {
    id v16 = 0LL;
    if (!a3)
    {
LABEL_28:
      BOOL v20 = 0;
      BOOL v19 = 0LL;
      goto LABEL_29;
    }

- (void).cxx_destruct
{
}

@end