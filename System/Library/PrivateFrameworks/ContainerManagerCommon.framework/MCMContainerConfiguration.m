@interface MCMContainerConfiguration
- (BOOL)alwaysRequireSignatureScrutiny;
- (BOOL)autoRollsPathOnBuildUpdate;
- (BOOL)cleanTransientsEachBoot;
- (BOOL)handledByProxy;
- (BOOL)handledDirectly;
- (BOOL)honorGroupContainerEntitlementForAppStoreSigned;
- (BOOL)honorGroupContainerEntitlementForMatchingTeamIDPrefix;
- (BOOL)honorGroupContainerEntitlementForPlatformBinary;
- (BOOL)honorGroupContainerEntitlementForProfileValidatedEntitlements;
- (BOOL)honorGroupContainerEntitlementForTestFlight;
- (BOOL)honorGroupContainerEntitlementForiPadAppsOnMac;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContainerConfig:(id)a3;
- (BOOL)migrateCodeSignInfoFromMetadataToDB;
- (BOOL)override_initNonBoolPropertiesWithPlist:(id)a3 error:(id *)a4;
- (BOOL)ownerIssuedSandboxExtension;
- (BOOL)personaAndUserSpecific;
- (BOOL)supportedOnPlatform;
- (BOOL)supportsProtectedContainerWithRestrictedEntitlement;
- (BOOL)usesGlobalBundleUserIdentity;
- (BOOL)usesGlobalSystemUserIdentity;
- (MCMContainerConfiguration)initWithPreprocessedPlist:(id)a3 name:(id)a4;
- (NSDictionary)sandboxAffordances;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)name;
- (id)_containerIdentifierSetFromPlistValue:(id)a3 error:(id *)a4;
- (id)_sandboxAffordancesFromPlistValue:(id)a3 error:(id *)a4;
- (id)debugDescriptionWithIndentString:(id)a3;
- (unint64_t)_containerClassFromPlistValue:(id)a3;
- (unint64_t)containerClass;
- (unint64_t)hash;
- (unsigned)disposition;
@end

@implementation MCMContainerConfiguration

- (MCMContainerConfiguration)initWithPreprocessedPlist:(id)a3 name:(id)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCMContainerConfiguration;
  v8 = -[MCMPlistReadOnly initWithPreprocessedPlist:conformingToProtocol:]( &v11,  sel_initWithPreprocessedPlist_conformingToProtocol_,  a3,  &unk_18C7345B8);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_name, a4);
  }

  return v9;
}

- (unsigned)disposition
{
  if (-[MCMContainerConfiguration handledDirectly](self, "handledDirectly")) {
    return 1;
  }
  if (-[MCMContainerConfiguration handledByProxy](self, "handledByProxy")) {
    return 2;
  }
  return 0;
}

- (NSString)description
{
  v3 = (void *)NSString;
  unint64_t v4 = -[MCMContainerConfiguration containerClass](self, "containerClass");
  v5 = -[MCMContainerConfiguration name](self, "name");
  [v3 stringWithFormat:@"(%llu)%@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  return (NSString *)-[MCMContainerConfiguration debugDescriptionWithIndentString:]( self,  "debugDescriptionWithIndentString:",  &stru_18A29E970);
}

- (id)debugDescriptionWithIndentString:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCMContainerConfiguration;
  id v4 = a3;
  v5 = -[MCMPlistReadOnly descriptionOfBoolPropertiesWithIndentString:]( &v9,  sel_descriptionOfBoolPropertiesWithIndentString_,  v4);
  [v5 stringByAppendingFormat:@"%@containerClass: %llu\n", v4, self->_containerClass];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 stringByAppendingFormat:@"%@name: %@\n", v4, self->_name];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  return self->_containerClass;
}

- (BOOL)isEqualToContainerConfig:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[MCMContainerConfiguration containerClass](self, "containerClass");
  uint64_t v6 = [v4 containerClass];

  return v5 == v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MCMContainerConfiguration *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v6 = 1;
  }

  else if (-[MCMContainerConfiguration conformsToProtocol:](v4, "conformsToProtocol:", &unk_18C7345B8))
  {
    BOOL v6 = -[MCMContainerConfiguration isEqualToContainerConfig:](self, "isEqualToContainerConfig:", v5);
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)_containerClassFromPlistValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    unint64_t v4 = [v3 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = 0LL;
  }

  return v4;
}

- (id)_containerIdentifierSetFromPlistValue:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [MEMORY[0x189603FE0] set];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    container_log_handle_for_category();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = v21;
      __int16 v31 = 2112;
      id v32 = v7;
      _os_log_error_impl( &dword_188846000,  v17,  OS_LOG_TYPE_ERROR,  "Team ID container ID map value is not in a valid format; expected = NSArray, got = %@, value = %@",
        buf,
        0x16u);
    }

    v16 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  149LL,  3LL);
LABEL_18:
    v15 = 0LL;
    if (!a4) {
      goto LABEL_21;
    }
LABEL_19:
    if (!v15) {
      *a4 = v16;
    }
    goto LABEL_21;
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    while (2)
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          container_log_handle_for_category();
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v22 = (objc_class *)objc_opt_class();
            NSStringFromClass(v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v30 = v23;
            __int16 v31 = 2112;
            id v32 = v8;
            _os_log_error_impl( &dword_188846000,  v18,  OS_LOG_TYPE_ERROR,  "Team ID container ID map value is not in a valid format; expected = NSArray<NSString>, got = NSArray<%@>, value = %@",
              buf,
              0x16u);
          }

          v16 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  149LL,  3LL);
          goto LABEL_18;
        }

        [v13 lowercaseString];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 addObject:v14];

        ++v12;
      }

      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v24 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v15 = (void *)[v6 copy];
  v16 = 0LL;
  if (a4) {
    goto LABEL_19;
  }
LABEL_21:

  return v15;
}

- (id)_sandboxAffordancesFromPlistValue:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  BOOL v6 = (void *)objc_opt_new();
  if (!v5)
  {
    uint64_t v11 = 0LL;
    if (!a4) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v7 = v5;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      v23 = a4;
      id v24 = v5;
      uint64_t v11 = 0LL;
      uint64_t v12 = *(void *)v33;
      while (2)
      {
        uint64_t v13 = 0LL;
        v14 = v11;
        do
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8 * v13);
          objc_msgSend(v8, "objectForKeyedSubscript:", v15, v23, v24);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v26 = v14;
          v17 = -[MCMContainerConfiguration _containerIdentifierSetFromPlistValue:error:]( self,  "_containerIdentifierSetFromPlistValue:error:",  v16,  &v26);
          uint64_t v11 = v26;

          if (!v17)
          {

            BOOL v6 = 0LL;
            goto LABEL_19;
          }

          [v6 setObject:v17 forKeyedSubscript:v15];

          ++v13;
          v14 = v11;
        }

        while (v10 != v13);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v31 count:16];
        if (v10) {
          continue;
        }
        break;
      }

- (BOOL)override_initNonBoolPropertiesWithPlist:(id)a3 error:(id *)a4
{
  v14[1] = *(id *)MEMORY[0x1895F89C0];
  id v6 = a3;
  [v6 objectForKeyedSubscript:@"containerClass"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_containerClass = -[MCMContainerConfiguration _containerClassFromPlistValue:]( self,  "_containerClassFromPlistValue:",  v7);

  [v6 objectForKeyedSubscript:@"sandboxAffordances"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = 0LL;
  -[MCMContainerConfiguration _sandboxAffordancesFromPlistValue:error:]( self,  "_sandboxAffordancesFromPlistValue:error:",  v8,  v14);
  uint64_t v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  id v10 = v14[0];
  sandboxAffordances = self->_sandboxAffordances;
  self->_sandboxAffordances = v9;

  uint64_t v12 = self->_sandboxAffordances;
  if (a4 && !v12) {
    *a4 = v10;
  }

  return v12 != 0LL;
}

- (BOOL)supportedOnPlatform
{
  return self->_supportedOnPlatform;
}

- (BOOL)autoRollsPathOnBuildUpdate
{
  return self->_autoRollsPathOnBuildUpdate;
}

- (BOOL)handledByProxy
{
  return self->_handledByProxy;
}

- (BOOL)handledDirectly
{
  return self->_handledDirectly;
}

- (BOOL)usesGlobalBundleUserIdentity
{
  return self->_usesGlobalBundleUserIdentity;
}

- (BOOL)usesGlobalSystemUserIdentity
{
  return self->_usesGlobalSystemUserIdentity;
}

- (BOOL)personaAndUserSpecific
{
  return self->_personaAndUserSpecific;
}

- (BOOL)migrateCodeSignInfoFromMetadataToDB
{
  return self->_migrateCodeSignInfoFromMetadataToDB;
}

- (BOOL)honorGroupContainerEntitlementForMatchingTeamIDPrefix
{
  return self->_honorGroupContainerEntitlementForMatchingTeamIDPrefix;
}

- (BOOL)honorGroupContainerEntitlementForAppStoreSigned
{
  return self->_honorGroupContainerEntitlementForAppStoreSigned;
}

- (BOOL)honorGroupContainerEntitlementForPlatformBinary
{
  return self->_honorGroupContainerEntitlementForPlatformBinary;
}

- (BOOL)honorGroupContainerEntitlementForiPadAppsOnMac
{
  return self->_honorGroupContainerEntitlementForiPadAppsOnMac;
}

- (BOOL)honorGroupContainerEntitlementForProfileValidatedEntitlements
{
  return self->_honorGroupContainerEntitlementForProfileValidatedEntitlements;
}

- (BOOL)honorGroupContainerEntitlementForTestFlight
{
  return self->_honorGroupContainerEntitlementForTestFlight;
}

- (BOOL)supportsProtectedContainerWithRestrictedEntitlement
{
  return self->_supportsProtectedContainerWithRestrictedEntitlement;
}

- (BOOL)ownerIssuedSandboxExtension
{
  return self->_ownerIssuedSandboxExtension;
}

- (BOOL)cleanTransientsEachBoot
{
  return self->_cleanTransientsEachBoot;
}

- (BOOL)alwaysRequireSignatureScrutiny
{
  return self->_alwaysRequireSignatureScrutiny;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)sandboxAffordances
{
  return self->_sandboxAffordances;
}

- (void).cxx_destruct
{
}

@end