@interface LSDReadService
@end

@implementation LSDReadService

void __31___LSDReadService_XPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C685A40];
  v3 = (void *)+[_LSDReadService XPCInterface]::result;
  +[_LSDReadService XPCInterface]::result = v2;

  v4 = (void *)+[_LSDReadService XPCInterface]::result;
  if (+[_LSDReadService XPCInterface]::result
    || ([MEMORY[0x1896077D8] currentHandler],
        v95 = (void *)objc_claimAutoreleasedReturnValue(),
        [v95 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"LSDReadService.mm" lineNumber:129 description:@"Failed to create XPC interface object."],  v95,  (v4 = (void *)+[_LSDReadService XPCInterface]::result) != 0))
  {
    [v4 setClass:_CSStoreGetXPCClass() forSelector:sel_getServerStoreNonBlockingWithCompletionHandler_ argumentIndex:0 ofReply:1];
    v5 = (void *)+[_LSDReadService XPCInterface]::result;
    _FSNodeGetClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setClasses:v6 forSelector:sel_getServerStoreNonBlockingWithCompletionHandler_ argumentIndex:1 ofReply:1];

    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getServerStoreNonBlockingWithCompletionHandler_ argumentIndex:2 ofReply:1];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getServerStoreNonBlockingWithCompletionHandler_ argumentIndex:4 ofReply:1];
    v7 = (void *)+[_LSDReadService XPCInterface]::result;
    v8 = (void *)MEMORY[0x189604010];
    uint64_t v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setClasses:v10 forSelector:sel_getKernelPackageExtensionsWithCompletionHandler_ argumentIndex:0 ofReply:1];

    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getKernelPackageExtensionsWithCompletionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getDiskUsage_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getDiskUsage_completionHandler_ argumentIndex:0 ofReply:1];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getDiskUsage_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getKnowledgeUUIDAndSequenceNumberWithCompletionHandler_ argumentIndex:0 ofReply:1];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getKnowledgeUUIDAndSequenceNumberWithCompletionHandler_ argumentIndex:1 ofReply:1];
    v11 = (void *)+[_LSDReadService XPCInterface]::result;
    v12 = (void *)MEMORY[0x189604010];
    uint64_t v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setClasses:v14 forSelector:sel_resolveQueries_legacySPI_completionHandler_ argumentIndex:0 ofReply:0];

    v15 = (void *)+[_LSDReadService XPCInterface]::result;
    v16 = (void *)MEMORY[0x189604010];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setClasses:v21 forSelector:sel_resolveQueries_legacySPI_completionHandler_ argumentIndex:0 ofReply:1];

    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_resolveQueries_legacySPI_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getBundleRecordForCurrentProcessWithCompletionHandler_ argumentIndex:0 ofReply:1];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getBundleRecordForCurrentProcessWithCompletionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getBundleProxyForCurrentProcessWithCompletionHandler_ argumentIndex:0 ofReply:1];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getBundleProxyForCurrentProcessWithCompletionHandler_ argumentIndex:1 ofReply:1];
    v22 = (void *)+[_LSDReadService XPCInterface]::result;
    v23 = (void *)MEMORY[0x189604010];
    uint64_t v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 setClasses:v25 forSelector:sel_getBundleRecordForCoreTypesWithCompletionHandler_ argumentIndex:0 ofReply:1];

    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getExtensionPointRecordWithIdentifier_platform_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getExtensionPointRecordWithIdentifier_platform_completionHandler_ argumentIndex:0 ofReply:1];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getExtensionPointRecordWithIdentifier_platform_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getExtensionPointRecordForCurrentProcessWithCompletionHandler_ argumentIndex:0 ofReply:1];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getTypeRecordWithIdentifier_allowUndeclared_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getTypeRecordWithIdentifier_allowUndeclared_completionHandler_ argumentIndex:0 ofReply:1];
    v26 = (void *)+[_LSDReadService XPCInterface]::result;
    v27 = (void *)MEMORY[0x189604010];
    uint64_t v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 setClasses:v29 forSelector:sel_getTypeRecordsWithIdentifiers_completionHandler_ argumentIndex:0 ofReply:0];

    v30 = (void *)+[_LSDReadService XPCInterface]::result;
    v31 = (void *)MEMORY[0x189604010];
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v30 setClasses:v34 forSelector:sel_getTypeRecordsWithIdentifiers_completionHandler_ argumentIndex:0 ofReply:1];

    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getTypeRecordWithTag_ofClass_conformingToIdentifier_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getTypeRecordWithTag_ofClass_conformingToIdentifier_completionHandler_ argumentIndex:1 ofReply:0];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getTypeRecordWithTag_ofClass_conformingToIdentifier_completionHandler_ argumentIndex:2 ofReply:0];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getTypeRecordWithTag_ofClass_conformingToIdentifier_completionHandler_ argumentIndex:0 ofReply:1];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getTypeRecordsWithTag_ofClass_conformingToIdentifier_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getTypeRecordsWithTag_ofClass_conformingToIdentifier_completionHandler_ argumentIndex:1 ofReply:0];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getTypeRecordsWithTag_ofClass_conformingToIdentifier_completionHandler_ argumentIndex:2 ofReply:0];
    v35 = (void *)+[_LSDReadService XPCInterface]::result;
    v36 = (void *)MEMORY[0x189604010];
    uint64_t v37 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v35 setClasses:v38 forSelector:sel_getTypeRecordsWithTag_ofClass_conformingToIdentifier_completionHandler_ argumentIndex:0 ofReply:1];

    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getTypeRecordForImportedTypeWithIdentifier_conformingToIdentifier_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getTypeRecordForImportedTypeWithIdentifier_conformingToIdentifier_completionHandler_ argumentIndex:1 ofReply:0];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getTypeRecordForImportedTypeWithIdentifier_conformingToIdentifier_completionHandler_ argumentIndex:0 ofReply:1];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getRelatedTypesOfTypeWithIdentifier_maximumDegreeOfSeparation_completionHandler_ argumentIndex:0 ofReply:0];
    v39 = (void *)+[_LSDReadService XPCInterface]::result;
    v40 = (void *)MEMORY[0x189604010];
    uint64_t v41 = objc_opt_class();
    objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    [v39 setClasses:v42 forSelector:sel_getRelatedTypesOfTypeWithIdentifier_maximumDegreeOfSeparation_completionHandler_ argumentIndex:0 ofReply:1];

    v43 = (void *)+[_LSDReadService XPCInterface]::result;
    v44 = (void *)MEMORY[0x189604010];
    uint64_t v45 = objc_opt_class();
    objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v43 setClasses:v46 forSelector:sel_getRelatedTypesOfTypeWithIdentifier_maximumDegreeOfSeparation_completionHandler_ argumentIndex:1 ofReply:1];

    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getWhetherTypeIdentifier_conformsToTypeIdentifier_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getWhetherTypeIdentifier_conformsToTypeIdentifier_completionHandler_ argumentIndex:1 ofReply:0];
    v47 = (void *)+[_LSDReadService XPCInterface]::result;
    v48 = (void *)MEMORY[0x189604010];
    uint64_t v49 = objc_opt_class();
    objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    [v47 setClasses:v50 forSelector:sel_getAllUserActivityTypesAndDomainNamesWithCompletionHandler_ argumentIndex:0 ofReply:1];

    v51 = (void *)+[_LSDReadService XPCInterface]::result;
    v52 = (void *)MEMORY[0x189604010];
    uint64_t v53 = objc_opt_class();
    objc_msgSend(v52, "setWithObjects:", v53, objc_opt_class(), 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    [v51 setClasses:v54 forSelector:sel_getAllUserActivityTypesAndDomainNamesWithCompletionHandler_ argumentIndex:1 ofReply:1];

    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getAllUserActivityTypesAndDomainNamesWithCompletionHandler_ argumentIndex:2 ofReply:1];
    v55 = (void *)+[_LSDReadService XPCInterface]::result;
    v56 = (void *)MEMORY[0x189604010];
    uint64_t v57 = objc_opt_class();
    objc_msgSend(v56, "setWithObjects:", v57, objc_opt_class(), 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    [v55 setClasses:v58 forSelector:sel_getResourceValuesForKeys_mimic_preferredLocalizations_completionHandler_ argumentIndex:0 ofReply:0];

    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getResourceValuesForKeys_mimic_preferredLocalizations_completionHandler_ argumentIndex:1 ofReply:0];
    v59 = (void *)+[_LSDReadService XPCInterface]::result;
    _LSGetURLPropertyClasses();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    [v59 setClasses:v60 forSelector:sel_getResourceValuesForKeys_mimic_preferredLocalizations_completionHandler_ argumentIndex:0 ofReply:1];

    v61 = (void *)+[_LSDReadService XPCInterface]::result;
    v62 = (void *)MEMORY[0x189604010];
    uint64_t v63 = objc_opt_class();
    objc_msgSend(v62, "setWithObjects:", v63, objc_opt_class(), 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    [v61 setClasses:v64 forSelector:sel_getResourceValuesForKeys_mimic_preferredLocalizations_completionHandler_ argumentIndex:1 ofReply:1];

    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getResourceValuesForKeys_mimic_preferredLocalizations_completionHandler_ argumentIndex:2 ofReply:1];
    v65 = (void *)+[_LSDReadService XPCInterface]::result;
    v66 = (void *)MEMORY[0x189604010];
    uint64_t v67 = objc_opt_class();
    objc_msgSend(v66, "setWithObjects:", v67, objc_opt_class(), 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    [v65 setClasses:v68 forSelector:sel_mapBundleIdentifiers_orMachOUUIDs_completionHandler_ argumentIndex:0 ofReply:0];

    v69 = (void *)+[_LSDReadService XPCInterface]::result;
    v70 = (void *)MEMORY[0x189604010];
    uint64_t v71 = objc_opt_class();
    objc_msgSend(v70, "setWithObjects:", v71, objc_opt_class(), 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    [v69 setClasses:v72 forSelector:sel_mapBundleIdentifiers_orMachOUUIDs_completionHandler_ argumentIndex:1 ofReply:0];

    v73 = (void *)+[_LSDReadService XPCInterface]::result;
    v74 = (void *)MEMORY[0x189604010];
    uint64_t v75 = objc_opt_class();
    objc_msgSend(v74, "setWithObjects:", v75, objc_opt_class(), 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    [v73 setClasses:v76 forSelector:sel_mapBundleIdentifiers_orMachOUUIDs_completionHandler_ argumentIndex:0 ofReply:1];

    v77 = (void *)+[_LSDReadService XPCInterface]::result;
    v78 = (void *)MEMORY[0x189604010];
    uint64_t v79 = objc_opt_class();
    objc_msgSend(v78, "setWithObjects:", v79, objc_opt_class(), 0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    [v77 setClasses:v80 forSelector:sel_mapBundleIdentifiers_orMachOUUIDs_completionHandler_ argumentIndex:1 ofReply:1];

    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_mapBundleIdentifiers_orMachOUUIDs_completionHandler_ argumentIndex:2 ofReply:1];
    v81 = (void *)+[_LSDReadService XPCInterface]::result;
    v82 = (void *)MEMORY[0x189604010];
    uint64_t v83 = objc_opt_class();
    objc_msgSend(v82, "setWithObjects:", v83, objc_opt_class(), 0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    [v81 setClasses:v84 forSelector:sel_mapPlugInBundleIdentifiersToContainingBundleIdentifiers_completionHandler_ argumentIndex:0 ofReply:0];

    v85 = (void *)+[_LSDReadService XPCInterface]::result;
    v86 = (void *)MEMORY[0x189604010];
    uint64_t v87 = objc_opt_class();
    objc_msgSend(v86, "setWithObjects:", v87, objc_opt_class(), 0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    [v85 setClasses:v88 forSelector:sel_mapPlugInBundleIdentifiersToContainingBundleIdentifiers_completionHandler_ argumentIndex:0 ofReply:1];

    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_mapPlugInBundleIdentifiersToContainingBundleIdentifiers_completionHandler_ argumentIndex:1 ofReply:1];
    v89 = (void *)+[_LSDReadService XPCInterface]::result;
    XNSGetPropertyListClasses();
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    [v89 setClasses:v90 forSelector:sel_getPreferencesWithCompletionHandler_ argumentIndex:0 ofReply:1];

    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getPreferencesWithCompletionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getSettingsStoreConfigurationWithCompletionHandler_ argumentIndex:0 ofReply:1];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getSettingsStoreConfigurationWithCompletionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDReadService XPCInterface]::result setClass:_CSStoreGetXPCClass() forSelector:sel_getSystemContentStoreWithCompletionHandler_ argumentIndex:0 ofReply:1];
    v91 = (void *)+[_LSDReadService XPCInterface]::result;
    _FSNodeGetClasses();
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    [v91 setClasses:v92 forSelector:sel_getSystemContentStoreWithCompletionHandler_ argumentIndex:1 ofReply:1];

    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getSystemContentStoreWithCompletionHandler_ argumentIndex:2 ofReply:1];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getRedactedAppexRecordForSystemAppexWithUUID_node_bundleIdentifier_platform_completionHandler_ argumentIndex:0 ofReply:0];
    v93 = (void *)+[_LSDReadService XPCInterface]::result;
    _FSNodeGetClasses();
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    [v93 setClasses:v94 forSelector:sel_getRedactedAppexRecordForSystemAppexWithUUID_node_bundleIdentifier_platform_completionHandler_ argumentIndex:1 ofReply:0];

    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getRedactedAppexRecordForSystemAppexWithUUID_node_bundleIdentifier_platform_completionHandler_ argumentIndex:2 ofReply:0];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getRedactedAppexRecordForSystemAppexWithUUID_node_bundleIdentifier_platform_completionHandler_ argumentIndex:0 ofReply:1];
    [(id)+[_LSDReadService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_getRedactedAppexRecordForSystemAppexWithUUID_node_bundleIdentifier_platform_completionHandler_ argumentIndex:1 ofReply:1];
  }

@end