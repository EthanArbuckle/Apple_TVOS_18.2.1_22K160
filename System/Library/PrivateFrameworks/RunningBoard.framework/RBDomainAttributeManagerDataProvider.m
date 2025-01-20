@interface RBDomainAttributeManagerDataProvider
- (BOOL)_checkConflictingAttributes:(uint64_t)a3 error:;
- (RBDomainAttributeManagerDataProvider)initWithDictionary:(id)a3;
- (RBDomainAttributeManagerDataProvider)initWithPath:(id)a3;
- (RBDomainAttributeTemplate)_templateWithDomain:(void *)a3 name:(void *)a4 dictionary:(void *)a5 errors:;
- (RBDomainAttributeTemplate)_validatedDomainAttributeTemplateFromDomainAttributeTemplate:(void *)a3 dependenciesByFullyQualifiedName:(void *)a4 errors:;
- (id)_additionalRestrictionsFromDictionary:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:;
- (id)_attributeTemplateForItem:(void *)a3 domain:(void *)a4 name:(void *)a5 errors:;
- (id)_attributeTemplateGroupsFromArray:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:;
- (id)_attributeTemplatesFromArray:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:;
- (id)_bundlePropertiesFromDictionary:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:;
- (id)_legalClassNames;
- (id)_legalPropertyNamesByClassName;
- (id)_restrictionFromDictionary:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:;
- (id)_templatesByDomainWithErrors:(void *)a1;
- (id)_templatesWithDomain:(void *)a3 fromDictionary:(void *)a4 errors:;
- (id)_templatesWithDomain:(void *)a3 fromFilename:(void *)a4 dirpath:(void *)a5 errors:;
- (id)_validatedAttributeTemplateFromAttributeTemplate:(void *)a3 domainAttributeTemplate:(void *)a4 dependenciesByFullyQualifiedName:(void *)a5 errors:;
- (id)templatesByDomain;
- (id)validDomains;
- (id)validationErrors;
- (uint64_t)_isPropertyLegalForClassName:(void *)a3 propertyName:(void *)a4 value:(uint64_t)a5 error:;
- (void)_configureTemplate:(void *)a3 fromInfo:(void *)a4 forDomain:(void *)a5 name:(char)a6 allowRestrictions:(void *)a7 errors:;
- (void)_isAttributeClassNameLegal:(void *)result;
- (void)_preAttributeTemplateFromAttributeTemplate:(void *)a3 domainAttributeTemplate:(void *)a4 generateDependenciesByFullyQualifiedName:;
- (void)_preDomainAttributeTemplateFromDomainAttributeTemplate:(void *)a3 generateDependenciesByFullyQualifiedName:;
- (void)_templatesWithDomain:(void *)a3 fromFilename:(void *)a4 errors:;
- (void)_validatedTemplatesByDomainWithErrors:(void *)a1;
@end

@implementation RBDomainAttributeManagerDataProvider

- (RBDomainAttributeManagerDataProvider)initWithPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RBDomainAttributeManagerDataProvider;
  v5 = -[RBDomainAttributeManagerDataProvider init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    path = v5->_path;
    v5->_path = (NSString *)v6;
  }

  return v5;
}

- (RBDomainAttributeManagerDataProvider)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RBDomainAttributeManagerDataProvider;
  uint64_t v6 = -[RBDomainAttributeManagerDataProvider init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rawTemplates, a3);
  }

  return v7;
}

- (id)validationErrors
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = -[RBDomainAttributeManagerDataProvider _validatedTemplatesByDomainWithErrors:](self, v3);
  return v3;
}

- (void)_validatedTemplatesByDomainWithErrors:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    -[RBDomainAttributeManagerDataProvider _templatesByDomainWithErrors:](a1, v3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FC8] dictionary];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FC8] dictionary];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = MEMORY[0x1895F87A8];
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke;
    v17[3] = &unk_18A2572E0;
    v17[4] = a1;
    id v8 = v6;
    id v18 = v8;
    [v4 enumerateKeysAndObjectsUsingBlock:v17];
    v13[0] = v7;
    v13[1] = 3221225472LL;
    v13[2] = __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke_3;
    v13[3] = &unk_18A257330;
    v13[4] = a1;
    id v14 = v8;
    id v15 = v3;
    id v9 = v5;
    id v16 = v9;
    id v10 = v8;
    [v4 enumerateKeysAndObjectsUsingBlock:v13];
    v11 = v16;
    a1 = v9;
  }

  return a1;
}

- (id)validDomains
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBDomainAttributeManagerDataProvider _templatesByDomainWithErrors:](self, v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 allKeys];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_templatesByDomainWithErrors:(void *)a1
{
  v121[1] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (!a1)
  {
    id v14 = 0LL;
    goto LABEL_52;
  }

  [MEMORY[0x189603FC8] dictionary];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (!a1[1])
  {
    v13 = (void *)a1[2];
    v94[0] = MEMORY[0x1895F87A8];
    v94[1] = 3221225472LL;
    v94[2] = __69__RBDomainAttributeManagerDataProvider__templatesByDomainWithErrors___block_invoke;
    v94[3] = &unk_18A257358;
    id v14 = v4;
    id v95 = v14;
    v96 = a1;
    id v97 = v3;
    [v13 enumerateKeysAndObjectsUsingBlock:v94];

    goto LABEL_52;
  }

  rbs_general_log();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = a1[1];
    *(_DWORD *)buf = 138543362;
    uint64_t v110 = v7;
    _os_log_impl(&dword_188634000, v6, OS_LOG_TYPE_DEFAULT, "Loading Domain Attributes from: %{public}@", buf, 0xCu);
  }

  [(id)a1[1] stringByDeletingLastPathComponent];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 stringByAppendingPathComponent:@"domains.plist"];

  uint64_t v85 = [MEMORY[0x189603F68] dictionaryWithContentsOfFile:v9];
  v86 = (void *)v9;
  if (!v85)
  {
    rbs_general_log();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[RBDomainAttributeManagerDataProvider _templatesByDomainWithErrors:].cold.1();
    }

    id v16 = (void *)MEMORY[0x189607870];
    uint64_t v116 = *MEMORY[0x1896075F0];
    [NSString stringWithFormat:@"Domains plist failure: %@", v9];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = v17;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:1 userInfo:v18];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    [v3 addObject:v10];
    goto LABEL_20;
  }

  RBSArrayForKey();
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    rbs_general_log();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[RBDomainAttributeManagerDataProvider _templatesByDomainWithErrors:].cold.2( v19,  v20,  v21,  v22,  v23,  v24,  v25,  v26);
    }

    v27 = (void *)MEMORY[0x189607870];
    uint64_t v118 = *MEMORY[0x1896075F0];
    [NSString stringWithFormat:@"Domains array missing"];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = v28;
    v29 = (void *)MEMORY[0x189603F68];
    v30 = &v119;
    v31 = &v118;
    goto LABEL_19;
  }

  uint64_t v11 = [MEMORY[0x189604010] setWithArray:v10];
  if (!v11)
  {
    rbs_general_log();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
      -[RBDomainAttributeManagerDataProvider _templatesByDomainWithErrors:].cold.3( v32,  v33,  v34,  v35,  v36,  v37,  v38,  v39);
    }

    v27 = (void *)MEMORY[0x189607870];
    uint64_t v120 = *MEMORY[0x1896075F0];
    [NSString stringWithFormat:@"Could not create domain set from plist"];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v121[0] = v28;
    v29 = (void *)MEMORY[0x189603F68];
    v30 = (void **)v121;
    v31 = &v120;
LABEL_19:
    [v29 dictionaryWithObjects:v30 forKeys:v31 count:1];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:1 userInfo:v40];
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    [v3 addObject:v41];
LABEL_20:
    v12 = 0LL;
    goto LABEL_21;
  }

  v12 = (void *)v11;
LABEL_21:

  [MEMORY[0x1896078A8] defaultManager];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v43 = a1[1];
  id v107 = 0LL;
  [v42 contentsOfDirectoryAtPath:v43 error:&v107];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  id v84 = v107;

  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  id v45 = v44;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v103 objects:v115 count:16];
  id v14 = v5;
  v47 = v45;
  v93 = a1;
  if (v46)
  {
    uint64_t v48 = v46;
    uint64_t v49 = *(void *)v104;
    uint64_t v88 = *MEMORY[0x1896075F0];
    uint64_t v90 = *(void *)v104;
    do
    {
      uint64_t v50 = 0LL;
      id obj = (id)v48;
      do
      {
        if (*(void *)v104 != v49) {
          objc_enumerationMutation(v47);
        }
        v51 = *(void **)(*((void *)&v103 + 1) + 8 * v50);
        [v51 stringByDeletingPathExtension];
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v12 containsObject:v51])
        {
          v53 = -[RBDomainAttributeManagerDataProvider _templatesWithDomain:fromFilename:errors:]((void **)a1, v52, v51, v3);
          [v14 setObject:v53 forKeyedSubscript:v52];
        }

        else
        {
          v54 = v47;
          v55 = v12;
          id v56 = v14;
          v57 = v3;
          rbs_general_log();
          v58 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v110 = (uint64_t)v51;
            _os_log_fault_impl( &dword_188634000,  v58,  OS_LOG_TYPE_FAULT,  "Unknown RunningBoard domain file found: %{public}@",  buf,  0xCu);
          }

          v59 = (void *)MEMORY[0x189607870];
          uint64_t v113 = v88;
          [NSString stringWithFormat:@"Domain %@ not allowed", v52];
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = v60;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          [v59 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:4 userInfo:v61];
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          id v3 = v57;
          [v57 addObject:v53];
          id v14 = v56;
          v12 = v55;
          v47 = v54;
          uint64_t v49 = v90;
          uint64_t v48 = (uint64_t)obj;
          a1 = v93;
        }

        ++v50;
      }

      while (v48 != v50);
      uint64_t v48 = [v47 countByEnumeratingWithState:&v103 objects:v115 count:16];
    }

    while (v48);
  }

  if (os_variant_has_internal_content())
  {
    v89 = v12;
    v62 = v3;
    [(id)a1[1] stringByReplacingOccurrencesOfString:@"System/Library/LifecyclePolicy" withString:@"AppleInternal/LifecyclePolicy"];
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896078A8] defaultManager];
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    id v102 = v84;
    [v64 contentsOfDirectoryAtPath:v63 error:&v102];
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    id v87 = v102;

    rbs_general_log();
    v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v67 = [v65 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v110 = v67;
      __int16 v111 = 2114;
      v112 = v63;
      _os_log_impl( &dword_188634000,  v66,  OS_LOG_TYPE_DEFAULT,  "Loading %lu Internal Domains from %{public}@",  buf,  0x16u);
    }

    __int128 v100 = 0u;
    __int128 v101 = 0u;
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    id obja = v65;
    uint64_t v68 = [obja countByEnumeratingWithState:&v98 objects:v108 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v99;
      do
      {
        for (uint64_t i = 0LL; i != v69; ++i)
        {
          if (*(void *)v99 != v70) {
            objc_enumerationMutation(obja);
          }
          v72 = *(void **)(*((void *)&v98 + 1) + 8 * i);
          [v72 stringByDeletingPathExtension];
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 objectForKeyedSubscript:v73];
          v74 = (void *)objc_claimAutoreleasedReturnValue();

          rbs_general_log();
          v75 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          BOOL v76 = os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT);
          if (v74)
          {
            if (!v76) {
              goto LABEL_47;
            }
            *(_DWORD *)buf = 138543362;
            uint64_t v110 = (uint64_t)v73;
            v77 = v75;
            v78 = "Replacing domain %{public}@ with internal version";
          }

          else
          {
            if (!v76) {
              goto LABEL_47;
            }
            *(_DWORD *)buf = 138543362;
            uint64_t v110 = (uint64_t)v73;
            v77 = v75;
            v78 = "Adding internal domain %{public}@";
          }

          _os_log_impl(&dword_188634000, v77, OS_LOG_TYPE_DEFAULT, v78, buf, 0xCu);
LABEL_47:
          v79 = -[RBDomainAttributeManagerDataProvider _templatesWithDomain:fromFilename:dirpath:errors:]( v93,  v73,  v72,  v63,  v62);
          [v14 setObject:v79 forKeyedSubscript:v73];
        }

        uint64_t v69 = [obja countByEnumeratingWithState:&v98 objects:v108 count:16];
      }

      while (v69);
    }

    v80 = obja;

    v81 = v87;
    id v3 = v62;
    v82 = (void *)v85;
    v12 = v89;
  }

  else
  {
    v80 = v47;
    v81 = v84;
    v82 = (void *)v85;
  }

LABEL_52:
  return v14;
}

- (id)templatesByDomain
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBDomainAttributeManagerDataProvider _validatedTemplatesByDomainWithErrors:](self, v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke_2;
  v5[3] = &unk_18A2572B8;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [a3 enumerateKeysAndObjectsUsingBlock:v5];
}

void __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
}

- (void)_preDomainAttributeTemplateFromDomainAttributeTemplate:(void *)a3 generateDependenciesByFullyQualifiedName:
{
  id v7 = a2;
  id v5 = a3;
  if (a1)
  {
    [v7 attributeGroups];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __136__RBDomainAttributeManagerDataProvider__preDomainAttributeTemplateFromDomainAttributeTemplate_generateDependenciesByFullyQualifiedName___block_invoke;
    v8[3] = &unk_18A2573F8;
    v8[4] = a1;
    id v9 = v7;
    id v10 = v5;
    [v6 enumerateObjectsUsingBlock:v8];
  }
}

void __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = (void *)MEMORY[0x189603FC8];
  id v6 = a3;
  id v7 = a2;
  [v5 dictionary];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke_4;
  v11[3] = &unk_18A257308;
  id v9 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v9;
  id v13 = *(id *)(a1 + 48);
  id v14 = v8;
  id v10 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:v11];

  [*(id *)(a1 + 56) setObject:v10 forKeyedSubscript:v7];
}

void __78__RBDomainAttributeManagerDataProvider__validatedTemplatesByDomainWithErrors___block_invoke_4( uint64_t a1,  void *a2,  void *a3)
{
  id v6 = a2;
  -[RBDomainAttributeManagerDataProvider _validatedDomainAttributeTemplateFromDomainAttributeTemplate:dependenciesByFullyQualifiedName:errors:]( *(void *)(a1 + 32),  a3,  *(void **)(a1 + 40),  *(void **)(a1 + 48));
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    [*(id *)(a1 + 56) setObject:v5 forKeyedSubscript:v6];
  }
}

- (RBDomainAttributeTemplate)_validatedDomainAttributeTemplateFromDomainAttributeTemplate:(void *)a3 dependenciesByFullyQualifiedName:(void *)a4 errors:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = objc_alloc_init(&OBJC_CLASS___RBDomainAttributeTemplate);
    -[RBDomainAttributeTemplate name]((uint64_t)v7);
    uint64_t v11 = (char *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate setName:](v10, v11);

    -[RBDomainAttributeTemplate domain]((uint64_t)v7);
    id v12 = (char *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate setDomain:](v10, v12);

    [v7 originatorEntitlements];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate setOriginatorEntitlements:](v10, "setOriginatorEntitlements:", v13);

    -[RBDomainAttributeTemplate endowmentNamespace]((uint64_t)v7);
    id v14 = (char *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate setEndowmentNamespace:](v10, v14);

    [v7 targetBundleProperties];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate setTargetBundleProperties:](v10, "setTargetBundleProperties:", v15);

    [v7 targetEntitlements];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate setTargetEntitlements:](v10, "setTargetEntitlements:", v16);

    [v7 additionalRestrictions];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate setAdditionalRestrictions:](v10, "setAdditionalRestrictions:", v17);

    [v7 restriction];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate setRestriction:](v10, "setRestriction:", v18);

    [MEMORY[0x189603FA8] array];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 attributeGroups];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __141__RBDomainAttributeManagerDataProvider__validatedDomainAttributeTemplateFromDomainAttributeTemplate_dependenciesByFullyQualifiedName_errors___block_invoke;
    v23[3] = &unk_18A257448;
    v23[4] = a1;
    id v24 = v7;
    id v25 = v8;
    id v26 = v9;
    id v27 = v19;
    id v21 = v19;
    [v20 enumerateObjectsUsingBlock:v23];

    -[RBDomainAttributeTemplate setAttributeGroups:](v10, "setAttributeGroups:", v21);
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (void)_templatesWithDomain:(void *)a3 fromFilename:(void *)a4 errors:
{
  if (a1)
  {
    -[RBDomainAttributeManagerDataProvider _templatesWithDomain:fromFilename:dirpath:errors:](a1, a2, a3, a1[1], a4);
    a1 = (void **)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (id)_templatesWithDomain:(void *)a3 fromFilename:(void *)a4 dirpath:(void *)a5 errors:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    [a4 stringByAppendingPathComponent:v10];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603F68] dictionaryWithContentsOfFile:v12];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FC8] dictionary];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __89__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromFilename_dirpath_errors___block_invoke;
    v18[3] = &unk_18A2573A8;
    v18[4] = a1;
    id v19 = v9;
    id v20 = v11;
    id v15 = v14;
    id v21 = v15;
    id v22 = v10;
    [v13 enumerateKeysAndObjectsUsingBlock:v18];
    id v16 = v22;
    a1 = v15;
  }

  return a1;
}

void __69__RBDomainAttributeManagerDataProvider__templatesByDomainWithErrors___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v7 = a2;
  -[RBDomainAttributeManagerDataProvider _templatesWithDomain:fromDictionary:errors:](v5, v7, a3, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
}

- (id)_templatesWithDomain:(void *)a3 fromDictionary:(void *)a4 errors:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    id v9 = (void *)MEMORY[0x189603FC8];
    id v10 = a3;
    [v9 dictionary];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __83__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromDictionary_errors___block_invoke;
    v15[3] = &unk_18A256A00;
    v15[4] = a1;
    id v16 = v7;
    id v17 = v8;
    id v12 = v11;
    id v18 = v12;
    [v10 enumerateKeysAndObjectsUsingBlock:v15];

    id v13 = v18;
    a1 = v12;
  }

  return a1;
}

- (id)_attributeTemplateForItem:(void *)a3 domain:(void *)a4 name:(void *)a5 errors:
{
  uint64_t v67 = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v45 = a3;
  id v44 = a4;
  id v46 = a5;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v9 objectForKeyedSubscript:@"Class"];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((-[RBDomainAttributeManagerDataProvider _isAttributeClassNameLegal:](a1, v10) & 1) != 0)
        {
          uint64_t v43 = v10;
          [MEMORY[0x189603FC8] dictionary];
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          id v41 = v9;
          id v11 = v9;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v48 objects:v54 count:16];
          if (!v12) {
            goto LABEL_21;
          }
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v49;
          uint64_t v15 = *MEMORY[0x1896075F0];
          while (1)
          {
            for (uint64_t i = 0LL; i != v13; ++i)
            {
              if (*(void *)v49 != v14) {
                objc_enumerationMutation(v11);
              }
              id v17 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                rbs_assertion_log();
                id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  id v62 = v45;
                  __int16 v63 = 2114;
                  id v64 = v44;
                  __int16 v65 = 2114;
                  id v66 = v17;
                  _os_log_error_impl( &dword_188634000,  v22,  OS_LOG_TYPE_ERROR,  "Domain %{public}@ attribute %{public}@ contains subattribute property of wrong type: %{public}@",  buf,  0x20u);
                }

                uint64_t v23 = (void *)MEMORY[0x189607870];
                uint64_t v52 = v15;
                [NSString stringWithFormat:@"Domain %@ attribute %@ contains subattribute template of wrong type: %@", v45, v44, v11];
                id v24 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = v24;
                [MEMORY[0x189603F68] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
                id v25 = (void *)objc_claimAutoreleasedReturnValue();
                [v23 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v25];
                id v20 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
                [v46 addObject:v20];
                goto LABEL_18;
              }

              if ([v17 isEqualToString:@"Class"]) {
                continue;
              }
              [v11 objectForKeyedSubscript:v17];
              id v18 = (void *)objc_claimAutoreleasedReturnValue();
              id v47 = 0LL;
              char v19 = -[RBDomainAttributeManagerDataProvider _isPropertyLegalForClassName:propertyName:value:error:]( a1,  v43,  v17,  v18,  (uint64_t)&v47);
              id v20 = v47;

              if ((v19 & 1) == 0) {
                goto LABEL_17;
              }
              [v11 objectForKeyedSubscript:v17];
              id v21 = (void *)objc_claimAutoreleasedReturnValue();
              [v42 setObject:v21 forKeyedSubscript:v17];

LABEL_18:
            }

            uint64_t v13 = [v11 countByEnumeratingWithState:&v48 objects:v54 count:16];
            if (!v13)
            {
LABEL_21:

              id v26 = v42;
              id v10 = v43;
              +[RBAttributeFactory attributeForClass:andProperties:errors:]( &OBJC_CLASS___RBAttributeFactory,  "attributeForClass:andProperties:errors:",  v43,  v42,  v46);
              id v27 = (void *)objc_claimAutoreleasedReturnValue();
              id v9 = v41;
              goto LABEL_32;
            }
          }
        }

        rbs_assertion_log();
        uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          id v62 = v45;
          __int16 v63 = 2114;
          id v64 = v44;
          __int16 v65 = 2114;
          id v66 = v10;
          _os_log_error_impl( &dword_188634000,  v38,  OS_LOG_TYPE_ERROR,  "Domain %{public}@ attribute %{public}@ contains subattribute property with an unsupported class name: %{public}@",  buf,  0x20u);
        }

        uint64_t v33 = (void *)MEMORY[0x189607870];
        uint64_t v55 = *MEMORY[0x1896075F0];
        [NSString stringWithFormat:@"Domain %@ attribute %@ contains subattribute property with an unsupported class name: %@", v45, v44, v10];
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
        id v56 = v34;
        uint64_t v35 = (void *)MEMORY[0x189603F68];
        uint64_t v36 = &v56;
        uint64_t v37 = &v55;
      }

      else
      {
        rbs_assertion_log();
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          id v62 = v45;
          __int16 v63 = 2114;
          id v64 = v44;
          __int16 v65 = 2114;
          id v66 = v10;
          _os_log_error_impl( &dword_188634000,  v32,  OS_LOG_TYPE_ERROR,  "Domain %{public}@ attribute %{public}@ contains subattribute with class name of wrong type: %{public}@",  buf,  0x20u);
        }

        uint64_t v33 = (void *)MEMORY[0x189607870];
        uint64_t v57 = *MEMORY[0x1896075F0];
        [NSString stringWithFormat:@"Domain %@ attribute %@ contains subattribute with class name of wrong type: %@", v45, v44, v10];
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v34;
        uint64_t v35 = (void *)MEMORY[0x189603F68];
        uint64_t v36 = &v58;
        uint64_t v37 = &v57;
      }

      [v35 dictionaryWithObjects:v36 forKeys:v37 count:1];
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
      [v33 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v39];
      id v26 = (void *)objc_claimAutoreleasedReturnValue();

      [v46 addObject:v26];
      id v27 = 0LL;
LABEL_32:
    }

    else
    {
      rbs_general_log();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v62 = v45;
        __int16 v63 = 2114;
        id v64 = v44;
        __int16 v65 = 2114;
        id v66 = v9;
        _os_log_error_impl( &dword_188634000,  v28,  OS_LOG_TYPE_ERROR,  "Domain %{public}@ attribute %{public}@ contains subattribute template of wrong type: %{public}@",  buf,  0x20u);
      }

      v29 = (void *)MEMORY[0x189607870];
      uint64_t v59 = *MEMORY[0x1896075F0];
      [NSString stringWithFormat:@"Domain %@ attribute %@ contains subattribute template of wrong type: %@", v45, v44, v9];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v30;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v31];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();

      [v46 addObject:v10];
      id v27 = 0LL;
    }
  }

  else
  {
    id v27 = 0LL;
  }

  return v27;
}

- (void)_isAttributeClassNameLegal:(void *)result
{
  if (result)
  {
    v2 = result;
    id v3 = a2;
    -[RBDomainAttributeManagerDataProvider _legalClassNames](v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 containsObject:v3];

    return (void *)v5;
  }

  return result;
}

- (uint64_t)_isPropertyLegalForClassName:(void *)a3 propertyName:(void *)a4 value:(uint64_t)a5 error:
{
  v37[1] = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (!a1)
  {
    a5 = 0LL;
    goto LABEL_13;
  }

  -[RBDomainAttributeManagerDataProvider _legalPropertyNamesByClassName](a1);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 objectForKeyedSubscript:v9];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 objectForKeyedSubscript:v10];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = v14;
  if (!v14)
  {
    rbs_assertion_log();
    char v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[RBDomainAttributeManagerDataProvider _isPropertyLegalForClassName:propertyName:value:error:].cold.1();
    }

    if (!a5) {
      goto LABEL_12;
    }
    id v20 = (void *)MEMORY[0x189607870];
    uint64_t v36 = *MEMORY[0x1896075F0];
    [NSString stringWithFormat:@"Unknown property %@ of attribute class %@", v10, v9];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v21;
    id v22 = (void *)MEMORY[0x189603F68];
    uint64_t v23 = (void **)v37;
    id v24 = &v36;
LABEL_11:
    [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:3 userInfo:v25];
    *(void *)a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0LL;
    goto LABEL_12;
  }

  if (([v14 containsObject:v11] & 1) == 0 && objc_msgSend(v15, "count") != 1)
  {
    [v15 firstObject];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FE8] null];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    char v18 = [v16 isEqual:v17];

    if ((v18 & 1) == 0)
    {
      rbs_assertion_log();
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v31 = v11;
        __int16 v32 = 2114;
        id v33 = v10;
        __int16 v34 = 2114;
        id v35 = v9;
        _os_log_error_impl( &dword_188634000,  v27,  OS_LOG_TYPE_ERROR,  "Unknown value %{public}@ for property %{public}@ of attribute class %{public}@",  buf,  0x20u);
      }

      if (!a5) {
        goto LABEL_12;
      }
      id v20 = (void *)MEMORY[0x189607870];
      uint64_t v28 = *MEMORY[0x1896075F0];
      [NSString stringWithFormat:@"Unknown value %@ for property %@ of attribute class %@", v11, v10, v9];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v21;
      id v22 = (void *)MEMORY[0x189603F68];
      uint64_t v23 = &v29;
      id v24 = &v28;
      goto LABEL_11;
    }
  }

  a5 = 1LL;
LABEL_12:

LABEL_13:
  return a5;
}

- (id)_attributeTemplatesFromArray:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:
{
  v49[1] = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!a1)
  {
    uint64_t v13 = 0LL;
    goto LABEL_23;
  }

  [MEMORY[0x189603FA8] array];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    rbs_general_log();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[RBDomainAttributeManagerDataProvider _attributeTemplatesFromArray:forDomainAttributeWithDomain:name:errors:].cold.1();
    }

    id v21 = (void *)MEMORY[0x189607870];
    uint64_t v48 = *MEMORY[0x1896075F0];
    [NSString stringWithFormat:@"Domain %@ attribute %@ contains no subattributes", v10, v11];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v22;
    [MEMORY[0x189603F68] dictionaryWithObjects:v49 forKeys:&v48 count:1];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    id v24 = v21;
    uint64_t v25 = 1LL;
    goto LABEL_21;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    rbs_general_log();
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v43 = v10;
      __int16 v44 = 2114;
      id v45 = v11;
      __int16 v46 = 2114;
      id v47 = v9;
      _os_log_error_impl( &dword_188634000,  v26,  OS_LOG_TYPE_ERROR,  "Domain %{public}@ attribute %{public}@ contains subattributes data of wrong type: %{public}@",  buf,  0x20u);
    }

    id v27 = (void *)MEMORY[0x189607870];
    uint64_t v40 = *MEMORY[0x1896075F0];
    [NSString stringWithFormat:@"Domain %@ attribute %@ contains subattributes data of wrong type: %@", v10, v11, v9];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    id v41 = v22;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    id v24 = v27;
    uint64_t v25 = 2LL;
LABEL_21:
    [v24 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:v25 userInfo:v23];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

    [v12 addObject:v28];
    goto LABEL_23;
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v32 = v9;
  id v14 = v9;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v34;
    do
    {
      for (uint64_t i = 0LL; i != v16; ++i)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v14);
        }
        -[RBDomainAttributeManagerDataProvider _attributeTemplateForItem:domain:name:errors:]( a1,  *(void **)(*((void *)&v33 + 1) + 8 * i),  v10,  v11,  v12);
        char v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19) {
          [v13 addObject:v19];
        }
      }

      uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }

    while (v16);
  }

  if (![v13 count])
  {
    rbs_general_log();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[RBDomainAttributeManagerDataProvider _attributeTemplatesFromArray:forDomainAttributeWithDomain:name:errors:].cold.2();
    }

    id v31 = (void *)MEMORY[0x189607870];
    uint64_t v37 = *MEMORY[0x1896075F0];
    [NSString stringWithFormat:@"Domain %@ attribute %@ contains no subattributes", v10, v11];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = v22;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:1 userInfo:v23];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v32;
    goto LABEL_22;
  }

  id v9 = v32;
LABEL_23:

  return v13;
}

- (void)_configureTemplate:(void *)a3 fromInfo:(void *)a4 forDomain:(void *)a5 name:(char)a6 allowRestrictions:(void *)a7 errors:
{
  id v17 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (a1)
  {
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __108__RBDomainAttributeManagerDataProvider__configureTemplate_fromInfo_forDomain_name_allowRestrictions_errors___block_invoke;
    v18[3] = &unk_18A257380;
    id v19 = v14;
    id v20 = v13;
    char v25 = a6;
    id v21 = v16;
    uint64_t v22 = a1;
    id v23 = v15;
    id v24 = v17;
    [v20 enumerateKeysAndObjectsUsingBlock:v18];
  }
}

void __108__RBDomainAttributeManagerDataProvider__configureTemplate_fromInfo_forDomain_name_allowRestrictions_errors___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  v30[1] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = (void *)MEMORY[0x189607870];
    uint64_t v29 = *MEMORY[0x1896075F0];
    [NSString stringWithFormat:@"RB Domain template %@ malformed: %@", *(void *)(a1 + 32), *(void *)(a1 + 40)];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v9;
    [MEMORY[0x189603F68] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v8;
    uint64_t v12 = 2LL;
    goto LABEL_8;
  }

  if (([v5 isEqualToString:@"Attributes"] & 1) == 0
    && ([v5 isEqualToString:@"AttributeGroups"] & 1) == 0)
  {
    if ([v5 isEqualToString:@"Restriction"])
    {
      if (*(_BYTE *)(a1 + 80))
      {
LABEL_6:
        -[RBDomainAttributeManagerDataProvider _restrictionFromDictionary:forDomainAttributeWithDomain:name:errors:]( *(void *)(a1 + 56),  v6,  *(void **)(a1 + 32),  *(void **)(a1 + 64),  *(void **)(a1 + 48));
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 72) setRestriction:v7];
LABEL_9:

        goto LABEL_10;
      }

      id v13 = (void *)MEMORY[0x189607870];
      uint64_t v27 = *MEMORY[0x1896075F0];
      [NSString stringWithFormat:@"RB Domain template %@ contains unexpected restriction with key : %@", *(void *)(a1 + 32), v5];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v28 = v9;
      id v14 = (void *)MEMORY[0x189603F68];
      id v15 = &v28;
      id v16 = &v27;
    }

    else
    {
      if ([v5 isEqualToString:@"RequiredTargetBundleProperties"])
      {
        -[RBDomainAttributeManagerDataProvider _bundlePropertiesFromDictionary:forDomainAttributeWithDomain:name:errors:]( *(void *)(a1 + 56),  v6,  *(void **)(a1 + 32),  *(void **)(a1 + 64),  *(void **)(a1 + 48));
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 72) setTargetBundleProperties:v7];
        goto LABEL_9;
      }

      if ([v5 isEqualToString:@"Selector"])
      {
        if (!*(_BYTE *)(a1 + 80)) {
          goto LABEL_6;
        }
        id v13 = (void *)MEMORY[0x189607870];
        uint64_t v25 = *MEMORY[0x1896075F0];
        [NSString stringWithFormat:@"RB Domain template %@ contains unexpected selector", *(void *)(a1 + 32)];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        id v26 = v9;
        id v14 = (void *)MEMORY[0x189603F68];
        id v15 = &v26;
        id v16 = &v25;
      }

      else if ([v5 isEqualToString:@"RequiredOriginatorEntitlements"])
      {
        if (*(_BYTE *)(a1 + 80))
        {
          +[RBEntitlementPredicate predicateForObject:forDomain:attribute:errors:]( &OBJC_CLASS___RBEntitlementPredicate,  "predicateForObject:forDomain:attribute:errors:",  v6,  *(void *)(a1 + 32),  *(void *)(a1 + 64),  *(void *)(a1 + 48));
          id v7 = (void *)objc_claimAutoreleasedReturnValue();
          [*(id *)(a1 + 72) setOriginatorEntitlements:v7];
          goto LABEL_9;
        }

        id v13 = (void *)MEMORY[0x189607870];
        uint64_t v23 = *MEMORY[0x1896075F0];
        [NSString stringWithFormat:@"RB Domain template %@ contains unexpected restriction with key : %@", *(void *)(a1 + 32), v5];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        id v24 = v9;
        id v14 = (void *)MEMORY[0x189603F68];
        id v15 = &v24;
        id v16 = &v23;
      }

      else if ([v5 isEqualToString:@"RequiredTargetEntitlements"])
      {
        if (*(_BYTE *)(a1 + 80))
        {
          +[RBEntitlementPredicate predicateForObject:forDomain:attribute:errors:]( &OBJC_CLASS___RBEntitlementPredicate,  "predicateForObject:forDomain:attribute:errors:",  v6,  *(void *)(a1 + 32),  *(void *)(a1 + 64),  *(void *)(a1 + 48));
          id v7 = (void *)objc_claimAutoreleasedReturnValue();
          [*(id *)(a1 + 72) setTargetEntitlements:v7];
          goto LABEL_9;
        }

        id v13 = (void *)MEMORY[0x189607870];
        uint64_t v21 = *MEMORY[0x1896075F0];
        [NSString stringWithFormat:@"RB Domain template %@ contains unexpected restriction with key : %@", *(void *)(a1 + 32), v5];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v22 = v9;
        id v14 = (void *)MEMORY[0x189603F68];
        id v15 = &v22;
        id v16 = &v21;
      }

      else if ([v5 isEqualToString:@"AdditionalRestrictions"])
      {
        if (*(_BYTE *)(a1 + 80))
        {
          -[RBDomainAttributeManagerDataProvider _additionalRestrictionsFromDictionary:forDomainAttributeWithDomain:name:errors:]( *(void *)(a1 + 56),  v6,  *(void **)(a1 + 32),  *(void **)(a1 + 64),  *(void **)(a1 + 48));
          id v7 = (void *)objc_claimAutoreleasedReturnValue();
          [*(id *)(a1 + 72) setAdditionalRestrictions:v7];
          goto LABEL_9;
        }

        id v13 = (void *)MEMORY[0x189607870];
        uint64_t v19 = *MEMORY[0x1896075F0];
        [NSString stringWithFormat:@"RB Domain template %@ contains unexpected restriction with key : %@", *(void *)(a1 + 32), v5];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        id v20 = v9;
        id v14 = (void *)MEMORY[0x189603F68];
        id v15 = &v20;
        id v16 = &v19;
      }

      else
      {
        if ([v5 isEqualToString:@"EndowmentNamespace"]) {
          goto LABEL_10;
        }
        id v13 = (void *)MEMORY[0x189607870];
        uint64_t v17 = *MEMORY[0x1896075F0];
        [NSString stringWithFormat:@"RB Domain template %@ contains unrecognized key: %@", *(void *)(a1 + 32), v5];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        char v18 = v9;
        id v14 = (void *)MEMORY[0x189603F68];
        id v15 = &v18;
        id v16 = &v17;
      }
    }

    [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v13;
    uint64_t v12 = 4LL;
LABEL_8:
    [v11 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:v12 userInfo:v10];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 48) addObject:v7];
    goto LABEL_9;
  }

- (id)_restrictionFromDictionary:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = 0LL;
  if (a1 && v9)
  {
    id v17 = 0LL;
    +[RBDomainRestriction domainRestrictionForDictionary:withError:]( &OBJC_CLASS___RBDomainRestriction,  "domainRestrictionForDictionary:withError:",  v9,  &v17);
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = v17;
    if (v14)
    {
      rbs_general_log();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v19 = v10;
        __int16 v20 = 2114;
        id v21 = v11;
        __int16 v22 = 2114;
        id v23 = v14;
        _os_log_error_impl( &dword_188634000,  v15,  OS_LOG_TYPE_ERROR,  "Domain %{public}@ attribute %{public}@ contains restriction that failed to resolve with error: %{public}@",  buf,  0x20u);
      }

      [v12 addObject:v14];
    }
  }

  return v13;
}

- (id)_bundlePropertiesFromDictionary:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    [MEMORY[0x189603FC8] dictionary];
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20[0] = MEMORY[0x1895F87A8];
        v20[1] = 3221225472LL;
        v20[2] = __113__RBDomainAttributeManagerDataProvider__bundlePropertiesFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke;
        v20[3] = &unk_18A256A00;
        id v21 = v10;
        id v22 = v11;
        id v23 = v12;
        id v13 = v13;
        id v24 = v13;
        [v9 enumerateKeysAndObjectsUsingBlock:v20];
      }

      else
      {
        rbs_general_log();
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          id v28 = v10;
          __int16 v29 = 2114;
          id v30 = v11;
          __int16 v31 = 2114;
          id v32 = v9;
          _os_log_error_impl( &dword_188634000,  v14,  OS_LOG_TYPE_ERROR,  "Domain %{public}@ attribute %{public}@ contains bundle properties of wrong type: %{public}@",  buf,  0x20u);
        }

        if (v12)
        {
          id v15 = (void *)MEMORY[0x189607870];
          uint64_t v25 = *MEMORY[0x1896075F0];
          [NSString stringWithFormat:@"Domain %@ attribute %@ contains bundle property of wrong type: %@", v10, v11, v9];
          id v16 = (void *)objc_claimAutoreleasedReturnValue();
          id v26 = v16;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          id v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v17];
          char v18 = (void *)objc_claimAutoreleasedReturnValue();

          [v12 addObject:v18];
        }
      }
    }
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

- (id)_additionalRestrictionsFromDictionary:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    [MEMORY[0x189603FC8] dictionary];
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20[0] = MEMORY[0x1895F87A8];
        v20[1] = 3221225472LL;
        v20[2] = __119__RBDomainAttributeManagerDataProvider__additionalRestrictionsFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke;
        v20[3] = &unk_18A256A00;
        id v21 = v10;
        id v22 = v11;
        id v23 = v12;
        id v13 = v13;
        id v24 = v13;
        [v9 enumerateKeysAndObjectsUsingBlock:v20];
      }

      else
      {
        rbs_general_log();
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          id v28 = v10;
          __int16 v29 = 2114;
          id v30 = v11;
          __int16 v31 = 2114;
          id v32 = v9;
          _os_log_error_impl( &dword_188634000,  v14,  OS_LOG_TYPE_ERROR,  "Domain %{public}@ attribute %{public}@ contains additionalRestrictions of wrong type: %{public}@",  buf,  0x20u);
        }

        if (v12)
        {
          id v15 = (void *)MEMORY[0x189607870];
          uint64_t v25 = *MEMORY[0x1896075F0];
          [NSString stringWithFormat:@"Domain %@ attribute %@ contains additionalRestrictions of wrong type: %@", v10, v11, v9];
          id v16 = (void *)objc_claimAutoreleasedReturnValue();
          id v26 = v16;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          id v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v17];
          char v18 = (void *)objc_claimAutoreleasedReturnValue();

          [v12 addObject:v18];
        }
      }
    }
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

- (BOOL)_checkConflictingAttributes:(uint64_t)a3 error:
{
  if (result)
  {
    [MEMORY[0x189604010] setWithArray:a2];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v5 = +[RBAssertionDescriptorValidator checkConflictingAttributes:error:]( &OBJC_CLASS___RBAssertionDescriptorValidator,  "checkConflictingAttributes:error:",  v4,  a3);

    return v5;
  }

  return result;
}

- (id)_attributeTemplateGroupsFromArray:(void *)a3 forDomainAttributeWithDomain:(void *)a4 name:(void *)a5 errors:
{
  v71[1] = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a1;
  id v13 = v11;
  id v51 = a5;
  if (!a1)
  {
    id v47 = 0LL;
    goto LABEL_30;
  }

  [MEMORY[0x189603FA8] array];
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  id v45 = v13;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      id v14 = v9;
      uint64_t v50 = [v14 countByEnumeratingWithState:&v53 objects:v61 count:16];
      if (v50)
      {
        id v44 = v9;
        uint64_t v48 = *MEMORY[0x1896075F0];
        uint64_t v49 = *(void *)v54;
        id v46 = v14;
        do
        {
          for (uint64_t i = 0LL; i != v50; ++i)
          {
            if (*(void *)v54 != v49) {
              objc_enumerationMutation(v14);
            }
            id v16 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              [v16 objectForKeyedSubscript:@"Attributes"];
              id v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[RBDomainAttributeManagerDataProvider _attributeTemplatesFromArray:forDomainAttributeWithDomain:name:errors:]( v12,  v17,  v10,  v13,  v51);
              char v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
              {
                id v52 = 0LL;
                uint64_t v19 = (uint64_t)v12;
                BOOL v20 = -[RBDomainAttributeManagerDataProvider _checkConflictingAttributes:error:]( (BOOL)v12,  (uint64_t)v18,  (uint64_t)&v52);
                id v21 = v52;
                if (!v20)
                {
                  rbs_general_log();
                  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v65 = v10;
                    __int16 v66 = 2112;
                    id v67 = v21;
                    _os_log_error_impl( &dword_188634000,  v22,  OS_LOG_TYPE_ERROR,  "Conflicting attributes found in Domain: %@ with error: %@",  buf,  0x16u);
                  }

                  id v23 = (void *)MEMORY[0x189607870];
                  uint64_t v57 = v48;
                  [NSString stringWithFormat:@"Error in Domain %@: %@", v10, v21];
                  id v24 = v10;
                  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v58 = v25;
                  [MEMORY[0x189603F68] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
                  id v26 = (void *)objc_claimAutoreleasedReturnValue();
                  [v23 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:5 userInfo:v26];
                  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

                  id v10 = v24;
                  [v51 addObject:v27];

                  id v13 = v45;
                }

                id v28 = objc_alloc_init(&OBJC_CLASS___RBAttributeTemplateGroup);
                -[RBAttributeTemplateGroup setAttributes:](v28, "setAttributes:", v18);
                -[RBDomainAttributeManagerDataProvider _configureTemplate:fromInfo:forDomain:name:allowRestrictions:errors:]( v19,  v28,  v16,  v10,  v13,  0,  v51);
                [v47 addObject:v28];

                id v12 = (void *)v19;
                id v14 = v46;
              }
            }

            else
            {
              rbs_general_log();
              __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                id v65 = v10;
                __int16 v66 = 2114;
                id v67 = v13;
                __int16 v68 = 2114;
                id v69 = v16;
                _os_log_error_impl( &dword_188634000,  v29,  OS_LOG_TYPE_ERROR,  "Domain %{public}@ attribute %{public}@ contains attribute group of wrong type: %{public}@",  buf,  0x20u);
              }

              id v30 = (void *)MEMORY[0x189607870];
              uint64_t v59 = v48;
              [NSString stringWithFormat:@"Domain %@ attribute %@ contains attribute group of wrong type: %@", v10, v13, v16];
              __int16 v31 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = v31;
              [MEMORY[0x189603F68] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
              id v32 = (void *)objc_claimAutoreleasedReturnValue();
              [v30 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v32];
              char v18 = (void *)objc_claimAutoreleasedReturnValue();

              [v51 addObject:v18];
            }
          }

          uint64_t v50 = [v14 countByEnumeratingWithState:&v53 objects:v61 count:16];
        }

        while (v50);
        id v9 = v44;
      }

      goto LABEL_29;
    }

    rbs_general_log();
    uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v65 = v10;
      __int16 v66 = 2114;
      id v67 = v13;
      __int16 v68 = 2114;
      id v69 = v9;
      _os_log_error_impl( &dword_188634000,  v40,  OS_LOG_TYPE_ERROR,  "Domain %{public}@ attribute %{public}@ contains attribute groups data of wrong type: %{public}@",  buf,  0x20u);
    }

    id v41 = v13;
    v42 = (void *)MEMORY[0x189607870];
    uint64_t v62 = *MEMORY[0x1896075F0];
    [NSString stringWithFormat:@"Domain %@ attribute %@ contains attribute groups data of wrong type: %@", v10, v41, v9];
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue();
    __int16 v63 = v36;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = v42;
    uint64_t v39 = 2LL;
  }

  else
  {
    rbs_general_log();
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[RBDomainAttributeManagerDataProvider _attributeTemplateGroupsFromArray:forDomainAttributeWithDomain:name:errors:].cold.1();
    }

    id v34 = v13;
    __int128 v35 = (void *)MEMORY[0x189607870];
    uint64_t v70 = *MEMORY[0x1896075F0];
    [NSString stringWithFormat:@"Domain %@ attribute %@ contains no subattributes", v10, v34];
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v36;
    [MEMORY[0x189603F68] dictionaryWithObjects:v71 forKeys:&v70 count:1];
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = v35;
    uint64_t v39 = 1LL;
  }

  [v38 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:v39 userInfo:v37];
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  [v51 addObject:v14];
  id v13 = v45;
LABEL_29:

LABEL_30:
  return v47;
}

void __113__RBDomainAttributeManagerDataProvider__bundlePropertiesFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [*(id *)(a1 + 56) setObject:v6 forKeyedSubscript:v5];
  }

  else
  {
    rbs_general_log();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __113__RBDomainAttributeManagerDataProvider__bundlePropertiesFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke_cold_1();
    }

    if (*(void *)(a1 + 48))
    {
      id v8 = (void *)MEMORY[0x189607870];
      [NSString stringWithFormat:@"Domain %@ attribute %@ contains bundle property name of wrong type: %@", *(void *)(a1 + 32), *(void *)(a1 + 40), v5, *MEMORY[0x1896075F0]];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v9;
      [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v10];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();

      [*(id *)(a1 + 48) addObject:v11];
    }
  }
}

void __119__RBDomainAttributeManagerDataProvider__additionalRestrictionsFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  v19[1] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [*(id *)(a1 + 56) setObject:v6 forKeyedSubscript:v5];
      goto LABEL_13;
    }

    rbs_general_log();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __119__RBDomainAttributeManagerDataProvider__additionalRestrictionsFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke_cold_1();
    }

    if (*(void *)(a1 + 48))
    {
      id v8 = (void *)MEMORY[0x189607870];
      [NSString stringWithFormat:@"Domain %@ attribute %@ contains entitlement value of wrong type: %@", *(void *)(a1 + 32), *(void *)(a1 + 40), v6, *MEMORY[0x1896075F0]];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      id v17 = v9;
      id v10 = (void *)MEMORY[0x189603F68];
      id v11 = &v17;
      uint64_t v12 = &v16;
      goto LABEL_12;
    }
  }

  else
  {
    rbs_general_log();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __119__RBDomainAttributeManagerDataProvider__additionalRestrictionsFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke_cold_2();
    }

    if (*(void *)(a1 + 48))
    {
      id v8 = (void *)MEMORY[0x189607870];
      uint64_t v18 = *MEMORY[0x1896075F0];
      [NSString stringWithFormat:@"Domain %@ attribute %@ contains entitlement name of wrong type: %@", *(void *)(a1 + 32), *(void *)(a1 + 40), v5];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v9;
      id v10 = (void *)MEMORY[0x189603F68];
      id v11 = (void **)v19;
      uint64_t v12 = &v18;
LABEL_12:
      [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v14];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();

      [*(id *)(a1 + 48) addObject:v15];
    }
  }

- (RBDomainAttributeTemplate)_templateWithDomain:(void *)a3 name:(void *)a4 dictionary:(void *)a5 errors:
{
  v45[1] = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v13 = objc_alloc_init(&OBJC_CLASS___RBDomainAttributeTemplate);
        -[RBDomainAttributeTemplate setName:](v13, v10);
        -[RBDomainAttributeTemplate setDomain:](v13, v9);
        -[RBDomainAttributeManagerDataProvider _configureTemplate:fromInfo:forDomain:name:allowRestrictions:errors:]( (uint64_t)a1,  v13,  v11,  v9,  v10,  1,  v12);
        RBSArrayForKey();
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 firstObject];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          rbs_general_log();
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
            -[RBDomainAttributeManagerDataProvider _templateWithDomain:name:dictionary:errors:].cold.1( v16,  v17,  v18,  v19,  v20,  v21,  v22,  v23);
          }

          id v24 = (void *)MEMORY[0x189607870];
          uint64_t v40 = *MEMORY[0x1896075F0];
          [NSString stringWithFormat:@"Domain attribute specified with legacy array EndowmentNamespace"];
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
          id v41 = v25;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
          id v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v24 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:3 userInfo:v26];
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

          [v12 addObject:v27];
          id v28 = v15;
        }

        else
        {
          RBSStringForKey();
          id v28 = (char *)objc_claimAutoreleasedReturnValue();
          if (!v28)
          {
LABEL_20:
            [v11 objectForKeyedSubscript:@"AttributeGroups"];
            uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[RBDomainAttributeManagerDataProvider _attributeTemplateGroupsFromArray:forDomainAttributeWithDomain:name:errors:]( a1,  v37,  v9,  v10,  v12);
            uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v38)
            {
              -[RBDomainAttributeTemplate setAttributeGroups:](v13, "setAttributeGroups:", v38);
            }

            else
            {

              id v13 = 0LL;
            }

            goto LABEL_24;
          }
        }

        -[RBDomainAttributeTemplate setEndowmentNamespace:](v13, v28);

        goto LABEL_20;
      }

      rbs_general_log();
      __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[RBDomainAttributeManagerDataProvider _templateWithDomain:name:dictionary:errors:].cold.2();
      }

      if (v12)
      {
        id v30 = (void *)MEMORY[0x189607870];
        uint64_t v42 = *MEMORY[0x1896075F0];
        [NSString stringWithFormat:@"Domain attribute templates for %@ is not a dictionary: %@", v10, v11];
        __int16 v31 = (void *)objc_claimAutoreleasedReturnValue();
        id v43 = v31;
        id v32 = (void *)MEMORY[0x189603F68];
        uint64_t v33 = &v43;
        id v34 = &v42;
        goto LABEL_16;
      }
    }

    else
    {
      rbs_general_log();
      __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[RBDomainAttributeManagerDataProvider _templateWithDomain:name:dictionary:errors:].cold.3();
      }

      if (v12)
      {
        id v30 = (void *)MEMORY[0x189607870];
        uint64_t v44 = *MEMORY[0x1896075F0];
        [NSString stringWithFormat:@"Domain %@ attribute name is not a string: %@", v9, v10];
        __int16 v31 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = v31;
        id v32 = (void *)MEMORY[0x189603F68];
        uint64_t v33 = (void **)v45;
        id v34 = &v44;
LABEL_16:
        [v32 dictionaryWithObjects:v33 forKeys:v34 count:1];
        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue();
        [v30 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v36];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();

        [v12 addObject:v15];
        id v13 = 0LL;
LABEL_24:

        goto LABEL_25;
      }
    }
  }

  id v13 = 0LL;
LABEL_25:

  return v13;
}

void __89__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromFilename_dirpath_errors___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  uint64_t v6 = -[RBDomainAttributeManagerDataProvider _templateWithDomain:name:dictionary:errors:]( *(void **)(a1 + 32),  *(void **)(a1 + 40),  v5,  a3,  *(void **)(a1 + 48));
  id v7 = (void *)v6;
  if (v6)
  {
    id v8 = *(void **)(a1 + 56);
    -[RBDomainAttributeTemplate name](v6);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v7 forKeyedSubscript:v9];
  }

  else
  {
    rbs_general_log();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __89__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromFilename_dirpath_errors___block_invoke_cold_1();
    }
  }
}

void __83__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromDictionary_errors___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  uint64_t v6 = -[RBDomainAttributeManagerDataProvider _templateWithDomain:name:dictionary:errors:]( *(void **)(a1 + 32),  *(void **)(a1 + 40),  v5,  a3,  *(void **)(a1 + 48));
  id v7 = (void *)v6;
  if (v6)
  {
    id v8 = *(void **)(a1 + 56);
    -[RBDomainAttributeTemplate name](v6);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v7 forKeyedSubscript:v9];
  }

  else
  {
    rbs_general_log();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __83__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromDictionary_errors___block_invoke_cold_1();
    }
  }
}

void __136__RBDomainAttributeManagerDataProvider__preDomainAttributeTemplateFromDomainAttributeTemplate_generateDependenciesByFullyQualifiedName___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __136__RBDomainAttributeManagerDataProvider__preDomainAttributeTemplateFromDomainAttributeTemplate_generateDependenciesByFullyQualifiedName___block_invoke_2;
  v5[3] = &unk_18A2573D0;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 enumerateObjectsUsingBlock:v5];
}

void __136__RBDomainAttributeManagerDataProvider__preDomainAttributeTemplateFromDomainAttributeTemplate_generateDependenciesByFullyQualifiedName___block_invoke_2( uint64_t a1,  void *a2)
{
}

- (void)_preAttributeTemplateFromAttributeTemplate:(void *)a3 domainAttributeTemplate:(void *)a4 generateDependenciesByFullyQualifiedName:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    id v9 = a3;
    -[RBDomainAttributeTemplate domain]((uint64_t)v9);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate name]((uint64_t)v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    [v10 stringByAppendingPathExtension:v11];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v13 = v7;
      [v13 domain];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 name];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 stringByAppendingPathExtension:v15];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v16 isEqualToString:v12])
      {
        rbs_assertion_log();
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[RBDomainAttributeManagerDataProvider _preAttributeTemplateFromAttributeTemplate:domainAttributeTemplate:generateDependenciesByFullyQualifiedName:].cold.1();
        }
      }

      else
      {
        [v8 objectForKeyedSubscript:v12];
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          [MEMORY[0x189603FE0] set];
          uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          [v8 setObject:v17 forKeyedSubscript:v12];
        }

        -[os_log_s addObject:](v17, "addObject:", v16);
      }
    }
  }
}

void __141__RBDomainAttributeManagerDataProvider__validatedDomainAttributeTemplateFromDomainAttributeTemplate_dependenciesByFullyQualifiedName_errors___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v13 = objc_alloc_init(&OBJC_CLASS___RBAttributeTemplateGroup);
  [v3 originatorEntitlements];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAttributeTemplateGroup setOriginatorEntitlements:](v13, "setOriginatorEntitlements:", v4);

  [v3 targetBundleProperties];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAttributeTemplateGroup setTargetBundleProperties:](v13, "setTargetBundleProperties:", v5);

  [v3 targetEntitlements];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAttributeTemplateGroup setTargetEntitlements:](v13, "setTargetEntitlements:", v6);

  [v3 additionalRestrictions];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAttributeTemplateGroup setAdditionalRestrictions:](v13, "setAdditionalRestrictions:", v7);

  [v3 restriction];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAttributeTemplateGroup setRestriction:](v13, "setRestriction:", v8);

  [MEMORY[0x189603FA8] array];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 attributes];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __141__RBDomainAttributeManagerDataProvider__validatedDomainAttributeTemplateFromDomainAttributeTemplate_dependenciesByFullyQualifiedName_errors___block_invoke_2;
  v14[3] = &unk_18A257420;
  id v11 = *(void **)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  id v15 = v11;
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v18 = v9;
  id v12 = v9;
  [v10 enumerateObjectsUsingBlock:v14];

  -[RBAttributeTemplateGroup setAttributes:](v13, "setAttributes:", v12);
  [*(id *)(a1 + 64) addObject:v13];
}

void __141__RBDomainAttributeManagerDataProvider__validatedDomainAttributeTemplateFromDomainAttributeTemplate_dependenciesByFullyQualifiedName_errors___block_invoke_2( void **a1,  void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    id v4 = v3;
    [a1[8] addObject:v3];
    id v3 = v4;
  }
}

- (id)_validatedAttributeTemplateFromAttributeTemplate:(void *)a3 domainAttributeTemplate:(void *)a4 dependenciesByFullyQualifiedName:(void *)a5 errors:
{
  v47[1] = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (a1)
  {
    id v12 = a3;
    -[RBDomainAttributeTemplate domain]((uint64_t)v12);
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBDomainAttributeTemplate name]((uint64_t)v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();

    [v13 stringByAppendingPathExtension:v14];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_19;
    }
    id v16 = v9;
    [v16 domain];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 name];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 stringByAppendingPathExtension:v18];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v19 isEqualToString:v15])
    {
      rbs_assertion_log();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[RBDomainAttributeManagerDataProvider _preAttributeTemplateFromAttributeTemplate:domainAttributeTemplate:generateDependenciesByFullyQualifiedName:].cold.1();
      }

      if (!v11)
      {
        int v23 = 1;
        goto LABEL_17;
      }

      uint64_t v21 = (void *)MEMORY[0x189607870];
      uint64_t v46 = *MEMORY[0x1896075F0];
      [NSString stringWithFormat:@"Domain attribute %@ attempts to include itself", v15];
      uint64_t v42 = v19;
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v22;
      int v23 = 1;
      [MEMORY[0x189603F68] dictionaryWithObjects:v47 forKeys:&v46 count:1];
      uint64_t v40 = v18;
      id v24 = v16;
      id v25 = v11;
      id v26 = v10;
      uint64_t v27 = v17;
      id v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:3 userInfo:v28];
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue();

      id v17 = v27;
      id v10 = v26;
      id v11 = v25;
      id v16 = v24;
      id v18 = v40;

      uint64_t v19 = v42;
      [v11 addObject:v29];
    }

    else
    {
      [v10 objectForKeyedSubscript:v19];
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v29 containsObject:v15])
      {
        id v43 = v19;
        rbs_assertion_log();
        id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[RBDomainAttributeManagerDataProvider _validatedAttributeTemplateFromAttributeTemplate:domainAttributeTemplate:dependenciesByFullyQualifiedName:errors:].cold.2();
        }

        if (v11)
        {
          __int16 v31 = (void *)MEMORY[0x189607870];
          uint64_t v44 = *MEMORY[0x1896075F0];
          [NSString stringWithFormat:@"Detected cycle between domain attributes %@ and %@", v15, v43];
          id v41 = (void *)objc_claimAutoreleasedReturnValue();
          id v45 = v41;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
          id v32 = v18;
          id v33 = v16;
          id v34 = v11;
          id v35 = v10;
          __int128 v36 = v17;
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
          [v31 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:3 userInfo:v37];
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();

          id v17 = v36;
          id v10 = v35;
          id v11 = v34;
          id v16 = v33;
          id v18 = v32;

          [v11 addObject:v38];
          uint64_t v19 = v43;
          int v23 = 1;
        }

        else
        {
          int v23 = 1;
          uint64_t v19 = v43;
        }
      }

      else
      {
        int v23 = 0;
      }
    }

LABEL_17:
    if (v23)
    {
      a1 = 0LL;
LABEL_20:

      goto LABEL_21;
    }

- (id)_legalPropertyNamesByClassName
{
  if (a1)
  {
    if (_legalPropertyNamesByClassName_onceToken != -1) {
      dispatch_once(&_legalPropertyNamesByClassName_onceToken, &__block_literal_global_183);
    }
    a1 = (id)_legalPropertyNamesByClassName_legalPropertyNamesByClassName;
  }

  return a1;
}

- (id)_legalClassNames
{
  if (a1)
  {
    if (_legalClassNames_onceToken != -1) {
      dispatch_once(&_legalClassNames_onceToken, &__block_literal_global_24);
    }
    a1 = (id)_legalClassNames_legalClassNames;
  }

  return a1;
}

void __56__RBDomainAttributeManagerDataProvider__legalClassNames__block_invoke()
{
  uint64_t v0 = objc_msgSend( MEMORY[0x189604010],  "setWithObjects:",  @"RBSAcquisitionCompletionAttribute",  @"RBSCPUAccessGrant",  @"RBSSuspendableCPUGrant",  @"RBSCarPlayModeGrant",  @"RBSCoalitionLevelGrant",  @"RBSCPUMaximumUsageLimitation",  @"RBSCPUMinimumUsageGrant",  @"RBSDefineRelativeStartTimeGrant",  @"RBSDomainAttribute",  @"RBSDebugGrant",  @"RBSDurationAttribute",  @"RBSGPUAccessGrant",  @"RBSJetsamPriorityGrant",  @"RBSBaseMemoryGrant",  @"RBSLaunchGrant",  @"RBSPreserveBaseMemoryGrant",  @"RBSPreventIdleSleepGrant",  @"RBSPreventResourceUsageInvalidationAttribute",  @"RBSResistTerminationGrant",  @"RBSRunningReasonAttribute",  @"RBSTagAttribute",  @"RBSAppNapEnableGrant",  @"RBSAppNapInactiveGrant",  @"RBSAppNapPreventBackgroundSocketsGrant",  @"RBSAppNapPreventDiskThrottleGrant",  @"RBSAppNapPreventLowPriorityCPUGrant",  @"RBSAppNapPreventSuppressedCPUGrant",  @"RBSAppNapPreventTimerThrottleGrant",  @"RBSMimicTaskSuspensionAttribute",  @"RBSForceRoleManageAttribute",  @"RBSEndowmentGrant",  @"RBSSubordinateProcessAttribute",  @"RBSSavedEndowmentGrant",  @"RBSConditionAttribute",  @"RBSInvalidateUnderConditionAttribute",  @"RBSPersistentAttribute",  0);
  v1 = (void *)_legalClassNames_legalClassNames;
  _legalClassNames_legalClassNames = v0;
}

void __70__RBDomainAttributeManagerDataProvider__legalPropertyNamesByClassName__block_invoke()
{
  v90[19] = *MEMORY[0x1895F89C0];
  v89[0] = @"RBSAcquisitionCompletionAttribute";
  v89[1] = @"RBSCoalitionLevelGrant";
  v90[0] = &unk_18A26F600;
  v90[1] = &unk_18A26F628;
  v89[2] = @"RBSCPUAccessGrant";
  v89[3] = @"RBSSuspendableCPUGrant";
  v90[2] = &unk_18A26F650;
  v90[3] = &unk_18A26F678;
  v89[4] = @"RBSCPUMaximumUsageLimitation";
  v87[0] = @"Duration";
  [MEMORY[0x189603FE8] null];
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v48;
  [MEMORY[0x189603F18] arrayWithObjects:&v86 count:1];
  id v47 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v47;
  v87[1] = @"Percentage";
  [MEMORY[0x189603FE8] null];
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v85 = v46;
  [MEMORY[0x189603F18] arrayWithObjects:&v85 count:1];
  id v45 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = v45;
  v88[2] = &unk_18A26F7B8;
  v87[2] = @"Role";
  v87[3] = @"ViolationPolicy";
  v88[3] = &unk_18A26F7D0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v88 forKeys:v87 count:4];
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
  v90[4] = v44;
  v89[5] = @"RBSCPUMinimumUsageGrant";
  v83[0] = @"Duration";
  [MEMORY[0x189603FE8] null];
  id v43 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v43;
  [MEMORY[0x189603F18] arrayWithObjects:&v82 count:1];
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v42;
  v83[1] = @"Percentage";
  [MEMORY[0x189603FE8] null];
  id v41 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v41;
  [MEMORY[0x189603F18] arrayWithObjects:&v81 count:1];
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
  v83[2] = @"Role";
  v84[1] = v40;
  v84[2] = &unk_18A26F7E8;
  [MEMORY[0x189603F68] dictionaryWithObjects:v84 forKeys:v83 count:3];
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  v90[5] = v39;
  v89[6] = @"RBSDurationAttribute";
  v80[0] = &unk_18A26F800;
  v79[0] = @"EndPolicy";
  v79[1] = @"WarningDuration";
  [MEMORY[0x189603FE8] null];
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v38;
  [MEMORY[0x189603F18] arrayWithObjects:&v78 count:1];
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v37;
  v79[2] = @"InvalidationDuration";
  [MEMORY[0x189603FE8] null];
  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v36;
  [MEMORY[0x189603F18] arrayWithObjects:&v77 count:1];
  id v35 = (void *)objc_claimAutoreleasedReturnValue();
  v79[3] = @"StartPolicy";
  v80[2] = v35;
  v80[3] = &unk_18A26F818;
  [MEMORY[0x189603F68] dictionaryWithObjects:v80 forKeys:v79 count:4];
  id v34 = (void *)objc_claimAutoreleasedReturnValue();
  v90[6] = v34;
  v89[7] = @"RBSDomainAttribute";
  v75[0] = @"Domain";
  [MEMORY[0x189603FE8] null];
  id v33 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v33;
  [MEMORY[0x189603F18] arrayWithObjects:&v74 count:1];
  id v32 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v32;
  v75[1] = @"Name";
  [MEMORY[0x189603FE8] null];
  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v31;
  [MEMORY[0x189603F18] arrayWithObjects:&v73 count:1];
  id v30 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = v30;
  [MEMORY[0x189603F68] dictionaryWithObjects:v76 forKeys:v75 count:2];
  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue();
  v90[7] = v29;
  v89[8] = @"RBSJetsamPriorityGrant";
  v71 = @"Band";
  [MEMORY[0x189603FE8] null];
  id v28 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v70 = v28;
  [MEMORY[0x189603F18] arrayWithObjects:&v70 count:1];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v27;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  v90[8] = v26;
  v89[9] = @"RBSBaseMemoryGrant";
  v68[0] = @"Category";
  [MEMORY[0x189603FE8] null];
  id v25 = (void *)objc_claimAutoreleasedReturnValue();
  id v67 = v25;
  [MEMORY[0x189603F18] arrayWithObjects:&v67 count:1];
  id v24 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = @"Strength";
  v69[0] = v24;
  v69[1] = &unk_18A26F830;
  [MEMORY[0x189603F68] dictionaryWithObjects:v69 forKeys:v68 count:2];
  int v23 = (void *)objc_claimAutoreleasedReturnValue();
  v90[9] = v23;
  v90[10] = &unk_18A26F6A0;
  v89[10] = @"RBSResistTerminationGrant";
  v89[11] = @"RBSRunningReasonAttribute";
  id v65 = @"RunningReason";
  [MEMORY[0x189603FE8] null];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  id v64 = v22;
  [MEMORY[0x189603F18] arrayWithObjects:&v64 count:1];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  __int16 v66 = v21;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v90[11] = v20;
  v89[12] = @"RBSTagAttribute";
  uint64_t v62 = @"Tag";
  [MEMORY[0x189603FE8] null];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v19;
  [MEMORY[0x189603F18] arrayWithObjects:&v61 count:1];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  __int16 v63 = v18;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  v90[12] = v17;
  v90[13] = &unk_18A26F6C8;
  v89[13] = @"RBSAppNapPreventTimerThrottleGrant";
  v89[14] = @"RBSEndowmentGrant";
  v90[14] = &unk_18A26F6F0;
  v89[15] = @"RBSSavedEndowmentGrant";
  v59[0] = @"Namespace";
  [MEMORY[0x189603FE8] null];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v16;
  [MEMORY[0x189603F18] arrayWithObjects:&v58 count:1];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = @"Key";
  v60[0] = v15;
  [MEMORY[0x189603FE8] null];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v57 = v14;
  [MEMORY[0x189603F18] arrayWithObjects:&v57 count:1];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v13;
  [MEMORY[0x189603F68] dictionaryWithObjects:v60 forKeys:v59 count:2];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  v90[15] = v12;
  v90[16] = &unk_18A26F718;
  v89[16] = @"RBSGPUAccessGrant";
  v89[17] = @"RBSConditionAttribute";
  v55[0] = @"Condition";
  [MEMORY[0x189603FE8] null];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v54 = v11;
  [MEMORY[0x189603F18] arrayWithObjects:&v54 count:1];
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = @"Value";
  v56[0] = v0;
  [MEMORY[0x189603FE8] null];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v53 = v1;
  [MEMORY[0x189603F18] arrayWithObjects:&v53 count:1];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v56 forKeys:v55 count:2];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v90[17] = v3;
  v89[18] = @"RBSInvalidateUnderConditionAttribute";
  v51[0] = @"Condition";
  [MEMORY[0x189603FE8] null];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v50 = v4;
  [MEMORY[0x189603F18] arrayWithObjects:&v50 count:1];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = @"MinValue";
  v52[0] = v5;
  [MEMORY[0x189603FE8] null];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v49 = v6;
  [MEMORY[0x189603F18] arrayWithObjects:&v49 count:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v52 forKeys:v51 count:2];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v90[18] = v8;
  uint64_t v9 = [MEMORY[0x189603F68] dictionaryWithObjects:v90 forKeys:v89 count:19];
  id v10 = (void *)_legalPropertyNamesByClassName_legalPropertyNamesByClassName;
  _legalPropertyNamesByClassName_legalPropertyNamesByClassName = v9;
}

- (void).cxx_destruct
{
}

- (void)_templatesByDomainWithErrors:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_188634000, v0, OS_LOG_TYPE_FAULT, "Domains plist failure: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_1_1();
}

- (void)_templatesByDomainWithErrors:(uint64_t)a3 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)_templatesByDomainWithErrors:(uint64_t)a3 .cold.3( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)_isPropertyLegalForClassName:propertyName:value:error:.cold.1()
{
}

- (void)_attributeTemplatesFromArray:forDomainAttributeWithDomain:name:errors:.cold.1()
{
}

- (void)_attributeTemplatesFromArray:forDomainAttributeWithDomain:name:errors:.cold.2()
{
}

- (void)_attributeTemplateGroupsFromArray:forDomainAttributeWithDomain:name:errors:.cold.1()
{
}

void __113__RBDomainAttributeManagerDataProvider__bundlePropertiesFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke_cold_1()
{
}

void __119__RBDomainAttributeManagerDataProvider__additionalRestrictionsFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke_cold_1()
{
}

void __119__RBDomainAttributeManagerDataProvider__additionalRestrictionsFromDictionary_forDomainAttributeWithDomain_name_errors___block_invoke_cold_2()
{
}

- (void)_templateWithDomain:(uint64_t)a3 name:(uint64_t)a4 dictionary:(uint64_t)a5 errors:(uint64_t)a6 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)_templateWithDomain:name:dictionary:errors:.cold.2()
{
}

- (void)_templateWithDomain:name:dictionary:errors:.cold.3()
{
}

void __89__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromFilename_dirpath_errors___block_invoke_cold_1()
{
}

void __83__RBDomainAttributeManagerDataProvider__templatesWithDomain_fromDictionary_errors___block_invoke_cold_1()
{
}

- (void)_preAttributeTemplateFromAttributeTemplate:domainAttributeTemplate:generateDependenciesByFullyQualifiedName:.cold.1()
{
}

- (void)_validatedAttributeTemplateFromAttributeTemplate:domainAttributeTemplate:dependenciesByFullyQualifiedName:errors:.cold.2()
{
}

@end