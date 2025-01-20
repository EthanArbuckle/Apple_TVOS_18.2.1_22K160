@interface LSDModifyService
@end

@implementation LSDModifyService

void __33___LSDModifyService_XPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C684568];
  v3 = (void *)+[_LSDModifyService XPCInterface]::result;
  +[_LSDModifyService XPCInterface]::result = v2;

  if (+[_LSDModifyService XPCInterface]::result
    || ([MEMORY[0x1896077D8] currentHandler],
        id v36 = (id)objc_claimAutoreleasedReturnValue(),
        [v36 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"LSDModifyService.mm" lineNumber:95 description:@"Failed to create XPC interface object."],  v36,  +[_LSDModifyService XPCInterface]::result))
  {
    XNSGetPropertyListClasses();
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_setDatabaseIsSeeded_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler_ argumentIndex:1 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler_ argumentIndex:2 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler_ argumentIndex:3 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClasses:v35 forSelector:sel_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler_ argumentIndex:4 ofReply:0];
    v4 = (void *)+[_LSDModifyService XPCInterface]::result;
    v5 = (void *)MEMORY[0x189604010];
    uint64_t v6 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setClasses:v7 forSelector:sel_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler_ argumentIndex:2 ofReply:1];

    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler_ argumentIndex:4 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_unregisterBundleUnit_options_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_registerContainerURL_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_registerContainerURL_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_updateContainerUnit_completionHandler_ argumentIndex:0 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_updateContainerUnit_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_registerExtensionPoint_platform_declaringURL_withInfo_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClasses:v35 forSelector:sel_registerExtensionPoint_platform_declaringURL_withInfo_completionHandler_ argumentIndex:3 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_registerExtensionPoint_platform_declaringURL_withInfo_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_unregisterExtensionPoint_platform_withVersion_parentBundleUnit_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_unregisterExtensionPoint_platform_withVersion_parentBundleUnit_completionHandler_ argumentIndex:2 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_unregisterExtensionPoint_platform_withVersion_parentBundleUnit_completionHandler_ argumentIndex:3 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_unregisterExtensionPoint_platform_withVersion_parentBundleUnit_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_setHandler_version_roles_forContentType_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_setHandler_version_roles_forContentType_completionHandler_ argumentIndex:3 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_setHandler_version_roles_forContentType_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_removeHandlerForContentType_roles_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_removeHandlerForContentType_roles_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_setHandler_version_forURLScheme_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_setHandler_version_forURLScheme_completionHandler_ argumentIndex:2 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_setHandler_version_forURLScheme_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_removeHandlerForURLScheme_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_removeHandlerForURLScheme_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_resetServerStoreWithCompletionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClasses:v35 forSelector:sel_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler_ argumentIndex:1 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClasses:v35 forSelector:sel_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler_ argumentIndex:2 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClasses:v35 forSelector:sel_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler_ argumentIndex:3 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler_ argumentIndex:5 ofReply:0];
    v8 = (void *)+[_LSDModifyService XPCInterface]::result;
    pendingSaveTokenInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setInterface:v9 forSelector:sel_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler_ argumentIndex:1 ofReply:1];

    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler_ argumentIndex:2 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_rebuildApplicationDatabasesForSystem_internal_user_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_installApplication_atURL_withOptions_installType_reply_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_installApplication_atURL_withOptions_installType_reply_ argumentIndex:1 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClasses:v35 forSelector:sel_installApplication_atURL_withOptions_installType_reply_ argumentIndex:2 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClasses:v35 forSelector:sel_installApplication_atURL_withOptions_installType_reply_ argumentIndex:0 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_installApplication_atURL_withOptions_installType_reply_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_uninstallApplication_withOptions_uninstallType_reply_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClasses:v35 forSelector:sel_uninstallApplication_withOptions_uninstallType_reply_ argumentIndex:1 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClasses:v35 forSelector:sel_uninstallApplication_withOptions_uninstallType_reply_ argumentIndex:0 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_uninstallApplication_withOptions_uninstallType_reply_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_unregisterApplicationAtURL_reply_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_unregisterApplicationAtURL_reply_ argumentIndex:0 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_refreshContentInFrameworkAtURL_reply_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_refreshContentInFrameworkAtURL_reply_ argumentIndex:0 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_unregisterApplicationsAtMountPoint_operationUUID_reply_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_unregisterApplicationsAtMountPoint_operationUUID_reply_ argumentIndex:1 ofReply:0];
    v10 = (void *)+[_LSDModifyService XPCInterface]::result;
    pendingSaveTokenInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setInterface:v11 forSelector:sel_unregisterApplicationsAtMountPoint_operationUUID_reply_ argumentIndex:0 ofReply:1];

    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_unregisterApplicationsAtMountPoint_operationUUID_reply_ argumentIndex:1 ofReply:1];
    v12 = (void *)+[_LSDModifyService XPCInterface]::result;
    v13 = (void *)MEMORY[0x189604010];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setClasses:v16 forSelector:sel_setUpdateAvailabilities_completionHandler_ argumentIndex:0 ofReply:0];

    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_setUpdateAvailabilities_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_garbageCollectDatabaseWithCompletionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClasses:v35 forSelector:sel_setPreferenceValue_forKey_forApplicationAtURL_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_setPreferenceValue_forKey_forApplicationAtURL_completionHandler_ argumentIndex:1 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_setPreferenceValue_forKey_forApplicationAtURL_completionHandler_ argumentIndex:2 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_setPreferenceValue_forKey_forApplicationAtURL_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClasses:v35 forSelector:sel_setPreferenceValueForCallingApplication_forKey_completionHandler_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_setPreferenceValueForCallingApplication_forKey_completionHandler_ argumentIndex:1 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_setPreferenceValueForCallingApplication_forKey_completionHandler_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClasses:v35 forSelector:sel_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply_ argumentIndex:0 ofReply:0];
    v17 = (void *)+[_LSDModifyService XPCInterface]::result;
    v18 = (void *)MEMORY[0x189604010];
    uint64_t v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 setClasses:v20 forSelector:sel_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply_ argumentIndex:1 ofReply:0];

    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply_ argumentIndex:2 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply_ argumentIndex:0 ofReply:1];
    v21 = (void *)+[_LSDModifyService XPCInterface]::result;
    pendingSaveTokenInterface();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 setInterface:v22 forSelector:sel_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply_ argumentIndex:1 ofReply:1];

    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply_ argumentIndex:2 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply_ argumentIndex:0 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply_ argumentIndex:1 ofReply:0];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply_ argumentIndex:3 ofReply:0];
    v23 = (void *)+[_LSDModifyService XPCInterface]::result;
    pendingSaveTokenInterface();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 setInterface:v24 forSelector:sel_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply_ argumentIndex:0 ofReply:1];

    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply_ argumentIndex:1 ofReply:1];
    v25 = (void *)+[_LSDModifyService XPCInterface]::result;
    v26 = (void *)MEMORY[0x189604010];
    uint64_t v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 setClasses:v28 forSelector:sel_performUpdateOfPersonasOfBundleIDs_toPersonaUniqueStrings_operationUUID_reply_ argumentIndex:0 ofReply:0];

    v29 = (void *)+[_LSDModifyService XPCInterface]::result;
    v30 = (void *)MEMORY[0x189604010];
    uint64_t v31 = objc_opt_class();
    objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 setClasses:v32 forSelector:sel_performUpdateOfPersonasOfBundleIDs_toPersonaUniqueStrings_operationUUID_reply_ argumentIndex:1 ofReply:0];

    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_performUpdateOfPersonasOfBundleIDs_toPersonaUniqueStrings_operationUUID_reply_ argumentIndex:2 ofReply:0];
    v33 = (void *)+[_LSDModifyService XPCInterface]::result;
    pendingSaveTokenInterface();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 setInterface:v34 forSelector:sel_performUpdateOfPersonasOfBundleIDs_toPersonaUniqueStrings_operationUUID_reply_ argumentIndex:0 ofReply:1];

    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_performUpdateOfPersonasOfBundleIDs_toPersonaUniqueStrings_operationUUID_reply_ argumentIndex:1 ofReply:1];
    [(id)+[_LSDModifyService XPCInterface]::result setClass:objc_opt_class() forSelector:sel_forceSaveForTestingWithCompletion_ argumentIndex:0 ofReply:1];
  }

void __34___LSDModifyService_dispatchQueue__block_invoke()
{
  uint64_t v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.launchservices.modify-service-queue", v2);
  v1 = (void *)+[_LSDModifyService dispatchQueue]::result;
  +[_LSDModifyService dispatchQueue]::result = (uint64_t)v0;
}

@end