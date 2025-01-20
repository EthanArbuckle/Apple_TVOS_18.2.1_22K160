@interface MCProfileServicer
- (BOOL)isCloudLockedProfileWithIdentifier:(id)a3;
- (BOOL)remoteProcessCanRemoveProfilesOutError:(id *)a3;
- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3;
- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3 error:(id *)a4;
- (BOOL)remoteProcessHasEntitlementArray:(id)a3 containingString:(id)a4;
- (BOOL)remoteProcessHasEntitlementArray:(id)a3 containingString:(id)a4 error:(id *)a5;
- (NSXPCConnection)xpcConnection;
- (id)_invalidValue:(id)a3 forArgument:(id)a4;
- (id)_missingWatchMDMEnrollmentEntitlementError;
- (id)lacksArrayEntitlementError:(id)a3 withMemberString:(id)a4;
- (id)lacksBooleanEntitlementError:(id)a3;
- (id)prefixedFeaturePromptIdentifierForIdentifier:(id)a3;
- (id)remoteProcessBundleID;
- (id)remoteProcessEntitlementStringArrayForKey:(id)a3;
- (void)addTrustedCodeSigningIdentitiesForProvisioningProfileUUID:(id)a3 completion:(id)a4;
- (void)allowedImportFromAppBundleIDs:(id)a3 importingAppBundleID:(id)a4 importingIsManaged:(BOOL)a5 completion:(id)a6;
- (void)allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 hostAppBundleID:(id)a4 accountIsManaged:(BOOL)a5 completion:(id)a6;
- (void)allowedOpenInAppBundleIDs:(id)a3 originatingAppBundleID:(id)a4 originatingIsManaged:(BOOL)a5 completion:(id)a6;
- (void)appleConnect_installMDMAssociatedProfileData:(id)a3 interactive:(BOOL)a4 options:(id)a5 completion:(id)a6;
- (void)applyPairingWatchMDMEnrollmentData:(id)a3 completion:(id)a4;
- (void)applyRestrictionDictionary:(id)a3 overrideRestrictions:(BOOL)a4 appsAndOptions:(id)a5 clientType:(id)a6 clientUUID:(id)a7 localizedClientDescription:(id)a8 localizedWarningMessage:(id)a9 completion:(id)a10;
- (void)areBundlesBlocked:(id)a3 completion:(id)a4;
- (void)cancelFeaturePromptWithIdentifier:(id)a3 completion:(id)a4;
- (void)changePasscode:(id)a3 oldPasscode:(id)a4 isRecovery:(BOOL)a5 skipRecovery:(BOOL)a6 completion:(id)a7;
- (void)checkCarrierProfileAndForceReinstallation:(BOOL)a3 completion:(id)a4;
- (void)checkInWithCompletion:(id)a3;
- (void)clearPasscodeWithEscrowKeybagData:(id)a3 secret:(id)a4 completion:(id)a5;
- (void)clearRecoveryPasscodeWithCompletion:(id)a3;
- (void)cloudConfigurationMachineInfoDataWithAdditionalInfo:(id)a3 completion:(id)a4;
- (void)cloudConfigurationStoreDetails:(id)a3 completion:(id)a4;
- (void)createActivationLockBypassCodeWithCompletion:(id)a3;
- (void)createMDMUnlockTokenIfNeededWithPasscode:(id)a3 completion:(id)a4;
- (void)debugRescheduleBackgroundActivity:(int64_t)a3 startDate:(id)a4 gracePeriod:(id)a5 repeatingInterval:(id)a6 completion:(id)a7;
- (void)defaultAppBundleIDForCommunicationServiceType:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:(id)a3;
- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:(id)a3 completion:(id)a4;
- (void)fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:(id)a3;
- (void)hasMailAccountsWithFilteringEnabled:(BOOL)a3 sourceAccountManagement:(int)a4 completion:(id)a5;
- (void)installProfileData:(id)a3 interactive:(BOOL)a4 options:(id)a5 completion:(id)a6;
- (void)installProvisioningProfileData:(id)a3 managingProfileIdentifier:(id)a4 completion:(id)a5;
- (void)isBundleBlocked:(id)a3 completion:(id)a4;
- (void)isPasscodeCompliantWithNamedPolicy:(id)a3 completion:(id)a4;
- (void)isProfileInstalledWithIdentifier:(id)a3 completion:(id)a4;
- (void)managedSystemConfigurationServiceIDsWithCompletion:(id)a3;
- (void)managedWiFiNetworkNamesWithCompletion:(id)a3;
- (void)managingOrganizationInformationWithCompletion:(id)a3;
- (void)markStoredProfileAsInstalledWithCompletion:(id)a3;
- (void)mayShareToAirDropForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4 completion:(id)a5;
- (void)mayShareToMessagesForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4 completion:(id)a5;
- (void)migrateCleanupMigratorWithContext:(int)a3 completion:(id)a4;
- (void)migrateWithContext:(int)a3 passcodeWasSetInBackup:(BOOL)a4 completion:(id)a5;
- (void)monitorEnrollmentStateWithPersonaID:(id)a3;
- (void)notifyDeviceUnlockedAndPasscodeRequiredWithCompletion:(id)a3;
- (void)notifyDeviceUnlockedWithCompletion:(id)a3;
- (void)notifyHaveSeenComplianceMessageWithLastLockDate:(id)a3 completion:(id)a4;
- (void)notifyStartComplianceTimer:(id)a3 completion:(id)a4;
- (void)openSensitiveURL:(id)a3 unlock:(BOOL)a4 completion:(id)a5;
- (void)peekProfileDataFromPurgatoryForDeviceType:(unint64_t)a3 withCompletion:(id)a4;
- (void)popProfileDataFromHeadOfInstallationQueueWithCompletion:(id)a3;
- (void)provisiongProfileUUIDsForSignerIdentity:(id)a3 completion:(id)a4;
- (void)queueProfileDataForInstallation:(id)a3 originalFileName:(id)a4 originatingBundleID:(id)a5 transitionToUI:(BOOL)a6 completion:(id)a7;
- (void)recomputePerClientUserComplianceWithCompletion:(id)a3;
- (void)recomputeProfileRestrictionsWithCompletionBlock:(id)a3;
- (void)recomputeUserComplianceWarningWithCompletion:(id)a3;
- (void)reducedMachineInfoDataWithCompletion:(id)a3;
- (void)removeBoolSetting:(id)a3 completion:(id)a4;
- (void)removeExpiredProfilesWithCompletion:(id)a3;
- (void)removeOrphanedClientRestrictionsWithCompletion:(id)a3;
- (void)removePostSetupAutoInstallSetAsideProfileWithCompletion:(id)a3;
- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5;
- (void)removeProtectedProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5;
- (void)removeProvisioningProfileWithUUID:(id)a3 managingProfileIdentifier:(id)a4 completion:(id)a5;
- (void)removeSetAsideCloudConfigurationProfileWithCompletion:(id)a3;
- (void)removeUninstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5 completion:(id)a6;
- (void)removeValueSetting:(id)a3 completion:(id)a4;
- (void)rereadManagedAppAttributesWithCompletion:(id)a3;
- (void)resetAllSettingsToDefaultsIsUserInitiated:(BOOL)a3 completion:(id)a4;
- (void)resetPasscodeMetadataWithCompletion:(id)a3;
- (void)restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:(id)a3;
- (void)setAllowedURLStrings:(id)a3 completion:(id)a4;
- (void)setAutoCorrectionAllowed:(BOOL)a3 completion:(id)a4;
- (void)setContinuousPathKeyboardAllowed:(BOOL)a3 completion:(id)a4;
- (void)setKeyboardShortcutsAllowed:(BOOL)a3 completion:(id)a4;
- (void)setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 completion:(id)a9;
- (void)setPredictiveKeyboardAllowed:(BOOL)a3 completion:(id)a4;
- (void)setSmartPunctuationAllowed:(BOOL)a3 completion:(id)a4;
- (void)setSpellCheckAllowed:(BOOL)a3 completion:(id)a4;
- (void)setUserBookmarks:(id)a3 completion:(id)a4;
- (void)setUserInfo:(id)a3 forClientUUID:(id)a4 completion:(id)a5;
- (void)setXpcConnection:(id)a3;
- (void)setupAssistantDidFinishCompletion:(id)a3;
- (void)showFeaturePromptForSetting:(id)a3 configurationUUID:(id)a4 promptOptions:(id)a5 promptIdentifier:(id)a6 completion:(id)a7;
- (void)shutDownWithCompletion:(id)a3;
- (void)stageMDMEnrollmentInfoForPairingWatchWithProfileData:(id)a3 orServiceURL:(id)a4 anchorCertificates:(id)a5 supervised:(BOOL)a6 declarationKeys:(id)a7 declarationConfiguration:(id)a8 completion:(id)a9;
- (void)storeActivationRecord:(id)a3 completion:(id)a4;
- (void)storeCertificateData:(id)a3 forIPCUIdentifier:(id)a4 completion:(id)a5;
- (void)storeProfileData:(id)a3 completion:(id)a4;
- (void)storedProfileDataWithCompletion:(id)a3;
- (void)unstageMDMEnrollmentInfoForPairingWatchWithCompletion:(id)a3;
- (void)updateMDMEnrollmentInfoForPairingWatch:(id)a3 completion:(id)a4;
- (void)updateProfileIdentifier:(id)a3 interactive:(BOOL)a4 completion:(id)a5;
- (void)validateAppBundleIDs:(id)a3 completion:(id)a4;
- (void)verifiedMDMProfileIdentifierWithCompletion:(id)a3;
- (void)waitForMigrationIncludingPostRestoreMigration:(BOOL)a3 completion:(id)a4;
@end

@implementation MCProfileServicer

- (void)checkInWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 connectionTracker]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  objc_msgSend(v6, "trackRequestFromPID:", objc_msgSend(v7, "processIdentifier"));

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  [v8 checkInWithCompletion:v4];
}

- (void)checkCarrierProfileAndForceReinstallation:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  [v6 checkCarrierProfileAndForceReinstallation:v4 completion:v5];
}

- (void)waitForMigrationIncludingPostRestoreMigration:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  [v6 waitForMigrationIncludingPostRestoreMigration:v4 completion:v5];
}

- (void)notifyDeviceUnlockedAndPasscodeRequiredWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  [v4 notifyDeviceUnlockedAndPasscodeRequiredWithCompletion:v3];
}

- (void)notifyDeviceUnlockedWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  [v4 notifyDeviceUnlockedWithCompletion:v3];
}

- (void)allowedOpenInAppBundleIDs:(id)a3 originatingAppBundleID:(id)a4 originatingIsManaged:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  [v12 allowedOpenInAppBundleIDs:v11 originatingAppBundleID:v10 originatingIsManaged:v6 completion:v9];
}

- (void)allowedImportFromAppBundleIDs:(id)a3 importingAppBundleID:(id)a4 importingIsManaged:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  [v12 allowedImportFromAppBundleIDs:v11 importingAppBundleID:v10 importingIsManaged:v6 completion:v9];
}

- (void)defaultAppBundleIDForCommunicationServiceType:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  [v10 defaultAppBundleIDForCommunicationServiceType:v9 forAccountWithIdentifier:v8 completion:v7];
}

- (void)setAutoCorrectionAllowed:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  id v8 = [v7 processIdentifier];

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
  [v10 setAutoCorrectionAllowed:v4 senderPID:v8 sender:v9 completion:v6];
}

- (void)setSmartPunctuationAllowed:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  id v8 = [v7 processIdentifier];

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
  [v10 setSmartPunctuationAllowed:v4 senderPID:v8 sender:v9 completion:v6];
}

- (void)setPredictiveKeyboardAllowed:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  id v8 = [v7 processIdentifier];

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
  [v10 setPredictiveKeyboardAllowed:v4 senderPID:v8 sender:v9 completion:v6];
}

- (void)setContinuousPathKeyboardAllowed:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  id v8 = [v7 processIdentifier];

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
  [v10 setContinuousPathKeyboardAllowed:v4 senderPID:v8 sender:v9 completion:v6];
}

- (void)setKeyboardShortcutsAllowed:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  id v8 = [v7 processIdentifier];

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
  [v10 setKeyboardShortcutsAllowed:v4 senderPID:v8 sender:v9 completion:v6];
}

- (void)setSpellCheckAllowed:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  id v8 = [v7 processIdentifier];

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
  [v10 setSpellCheckAllowed:v4 senderPID:v8 sender:v9 completion:v6];
}

- (void)setAllowedURLStrings:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  id v9 = [v8 processIdentifier];

  id v11 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
  [v11 setAllowedURLStrings:v7 senderPID:v9 sender:v10 completion:v6];
}

- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2 object:self file:@"MCProfileServicer.m" lineNumber:215 description:@"Improper use. Entitlement required for call"];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForEntitlement:v5]);

  BOOL v9 = 0;
  if (v7)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
  }

  return v9;
}

- (id)remoteProcessEntitlementStringArrayForKey:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:v4]);

  if (v6 && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        id v12 = 0LL;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v12);
          uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
          {

            id v15 = 0LL;
            goto LABEL_14;
          }

          id v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v15 = v8;
LABEL_14:
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

- (BOOL)remoteProcessHasEntitlementArray:(id)a3 containingString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[MCProfileServicer remoteProcessEntitlementStringArrayForKey:]( self,  "remoteProcessEntitlementStringArrayForKey:",  v7));
    id v10 = v9;
    if (v8)
    {
      unsigned __int8 v11 = [v9 containsObject:v8];
    }

    else if (v9)
    {
      id v12 = _MCLogObjects[2];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543362;
        id v16 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "No containing string demanded from process with array entitlement %{public}@. Granting entitlement since array is present.",  (uint8_t *)&v15,  0xCu);
      }

      unsigned __int8 v11 = 1;
    }

    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  else
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2 object:self file:@"MCProfileServicer.m" lineNumber:252 description:@"Improper use. No array entitlement demanded from process."];

    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)remoteProcessBundleID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  id v3 = v2;
  if (v2) {
    [v2 auditToken];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }

  uint64_t v4 = MCBundleIDFromAuditToken(v9);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (!v5)
  {
    id v6 = _MCLogObjects[2];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "The process XPC-ing to profiled is missing an application-identifier entitlement. Check client logs from the Man agedConfiguration framework for a log fault.",  v8,  2u);
    }
  }

  return v5;
}

- (id)lacksBooleanEntitlementError:(id)a3
{
  uint64_t v3 = MCXPCErrorDomain;
  uint64_t v4 = MCErrorArray(@"XPC_ERROR_LACKS_ENTITLEMENT_CODE");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v3,  39000LL,  v5,  MCErrorTypeFatal,  a3,  0LL));

  return v6;
}

- (id)lacksArrayEntitlementError:(id)a3 withMemberString:(id)a4
{
  uint64_t v4 = MCXPCErrorDomain;
  uint64_t v5 = MCErrorArray(@"XPC_ERROR_LACKS_ARRAY_ENTITLEMENT_WITH_STRING");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v4,  39000LL,  v6,  MCErrorTypeFatal,  a3,  a4,  0LL));

  return v7;
}

- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!-[MCProfileServicer remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", v6)
    && !-[MCProfileServicer remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.managedconfiguration.profiled-access"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer lacksBooleanEntitlementError:](self, "lacksBooleanEntitlementError:", v6));
    BOOL v8 = 0;
    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  id v7 = 0LL;
  BOOL v8 = 1;
  if (a4) {
LABEL_4:
  }
    *a4 = v7;
LABEL_5:

  return v8;
}

- (BOOL)remoteProcessHasEntitlementArray:(id)a3 containingString:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!-[MCProfileServicer remoteProcessHasEntitlementArray:containingString:]( self,  "remoteProcessHasEntitlementArray:containingString:",  v8,  v9)
    && !-[MCProfileServicer remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.managedconfiguration.profiled-access"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[MCProfileServicer lacksArrayEntitlementError:withMemberString:]( self,  "lacksArrayEntitlementError:withMemberString:",  v8,  v9));
    BOOL v11 = 0;
    if (!a5) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  id v10 = 0LL;
  BOOL v11 = 1;
  if (a5) {
LABEL_4:
  }
    *a5 = v10;
LABEL_5:

  return v11;
}

- (void)verifiedMDMProfileIdentifierWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id, void))a3;
  id v8 = 0LL;
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:]( self,  "remoteProcessHasBooleanEntitlement:error:",  @"com.apple.managedconfiguration.profiled-access",  &v8);
  id v6 = v8;
  if ((v5 & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v7 verifiedMDMProfileIdentifierWithCompletion:v4];
  }

  else if (v4)
  {
    v4[2](v4, v6, 0LL);
  }
}

- (void)isProfileInstalledWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  if (-[MCProfileServicer remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.managedconfiguration.profiled.profile-list-read"))
  {
    id v8 = 0LL;
  }

  else
  {
    id v13 = 0LL;
    unsigned __int8 v9 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.configurationprofiles",  @"Inspection",  &v13);
    id v8 = v13;
    if ((v9 & 1) == 0)
    {
      if (v7) {
        v7[2](v7, v8, 0LL);
      }
      goto LABEL_11;
    }
  }

  if (v6)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allInstalledProfileIdentifiers]);
    id v12 = [v11 containsObject:v6];

    if (!v7) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }

  id v12 = 0LL;
  if (v7) {
LABEL_8:
  }
    ((void (**)(id, id, id))v7)[2](v7, 0LL, v12);
LABEL_11:
}

- (void)installProfileData:(id)a3 interactive:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void, id))a6;
  if (v8)
  {
    v35 = 0LL;
    unsigned __int8 v13 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.configurationprofiles",  @"CustomUIInstallation",  &v35);
    uint64_t v14 = v35;
  }

  else
  {
    v34 = 0LL;
    unsigned __int8 v13 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.configurationprofiles",  @"SilentNonUIInstallation",  &v34);
    uint64_t v14 = v34;
  }

  id v15 = v14;
  if ((v13 & 1) != 0)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:kMCInstallProfileOptionFilterFlag]);
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0 && [v16 integerValue] == (id)2)
    {
      id v33 = v15;
      unsigned __int8 v18 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.configurationprofiles",  @"CarrierInstallation",  &v33);
      id v19 = v33;

      if ((v18 & 1) == 0)
      {
        if (v12) {
          v12[2](v12, 0LL, v19);
        }
LABEL_21:

        id v15 = v19;
        goto LABEL_22;
      }
    }

    else
    {
      id v19 = v15;
    }

    id v20 = v11;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    v31 = v16;
    id v22 = v10;
    id v23 = v19;
    if (v21)
    {
      v24 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v20);
      -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v21, kMCInstallProfileOptionInstalledBy);
      id v25 = -[NSMutableDictionary copy](v24, "copy");

      id v20 = v25;
    }

    else
    {
      v26 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Could not retrieve the bundle ID of the calling process. Not marking profile's installer.",  buf,  2u);
      }
    }

    if (v8)
    {
      v27 = objc_alloc(&OBJC_CLASS___MCInteractionClient);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
      v29 = -[MCInteractionClient initWithXPCClientConnection:](v27, "initWithXPCClientConnection:", v28);
    }

    else
    {
      v29 = 0LL;
    }

    id v19 = v23;
    id v10 = v22;
    id v16 = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v30 installProfileData:v10 interactionClient:v29 options:v20 source:v21 completion:v12];

    goto LABEL_21;
  }

  if (v12) {
    v12[2](v12, 0LL, v15);
  }
LABEL_22:
}

- (void)appleConnect_installMDMAssociatedProfileData:(id)a3 interactive:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void, id))a6;
  os_log_t v13 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v13;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    *(_DWORD *)buf = 138543362;
    v24 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "AppleConnect installing MDM associated profile data from process: %{public}@",  buf,  0xCu);
  }

  id v22 = 0LL;
  unsigned __int8 v16 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.configurationprofiles",  @"AppleConnectMDMInstallation",  &v22);
  id v17 = v22;
  if ((v16 & 1) != 0)
  {
    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue( +[DMCPersonaHelper enterprisePersonaIdentifier]( &OBJC_CLASS___DMCPersonaHelper,  "enterprisePersonaIdentifier"));
    id v19 = _MCLogObjects[0];
    if (v18)
    {
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "AppleConnect adding enterprise persona ID to MDM associated profile data",  buf,  2u);
      }

      id v20 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v11);
      -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v18, kMCInstallProfileOptionPersonaID);
      id v21 = -[NSMutableDictionary copy](v20, "copy");

      id v11 = v21;
    }

    else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "AppleConnect missing enterprise persona ID when installing MDM associated profile data",  buf,  2u);
    }

    -[MCProfileServicer installProfileData:interactive:options:completion:]( self,  "installProfileData:interactive:options:completion:",  v10,  v8,  v11,  v12);
  }

  else if (v12)
  {
    v12[2](v12, 0LL, v17);
  }
}

- (void)queueProfileDataForInstallation:(id)a3 originalFileName:(id)a4 originatingBundleID:(id)a5 transitionToUI:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, void, uint64_t, id))a7;
  if (-[MCProfileServicer remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.managedconfiguration.vpn-profile-access"))
  {
    id v16 = 0LL;
LABEL_4:
    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v18 queueProfileDataForInstallation:v12 originalFileName:v13 originatingBundleID:v14 transitionToUI:v8 completion:v15];

    goto LABEL_5;
  }

  id v19 = 0LL;
  unsigned __int8 v17 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.configurationprofiles",  @"UIInstallation",  &v19);
  id v16 = v19;
  if ((v17 & 1) != 0) {
    goto LABEL_4;
  }
  if (v15) {
    v15[2](v15, 0LL, 99LL, v16);
  }
LABEL_5:
}

- (void)popProfileDataFromHeadOfInstallationQueueWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, id))a3;
  id v8 = 0LL;
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.configurationprofiles",  @"PopInstallationQueue",  &v8);
  id v6 = v8;
  if ((v5 & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v7 popProfileDataFromHeadOfInstallationQueueWithCompletion:v4];
  }

  else if (v4)
  {
    v4[2](v4, 0LL, v6);
  }
}

- (void)peekProfileDataFromPurgatoryForDeviceType:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = (void (**)(id, void, id))a4;
  id v13 = 0LL;
  unsigned int v7 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.configurationprofiles",  @"PopInstallationQueue",  &v13);
  id v8 = v13;
  if (a3 >= 8 && v7)
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringValue]);
    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[MCProfileServicer _invalidValue:forArgument:]( self,  "_invalidValue:forArgument:",  v10,  @"MCProfileTargetDeviceType"));

    id v8 = (id)v11;
  }

  else if ((v7 & 1) != 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v12 peekProfileDataFromPurgatoryForDeviceType:a3 withCompletion:v6];

    goto LABEL_8;
  }

  if (v6) {
    v6[2](v6, 0LL, v8);
  }
LABEL_8:
}

- (void)updateProfileIdentifier:(id)a3 interactive:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  unsigned __int8 v9 = (void (**)(id, void, id))a5;
  if (v6)
  {
    id v19 = 0LL;
    unsigned __int8 v10 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.configurationprofiles",  @"CustomUIInstallation",  &v19);
    id v11 = v19;
    if ((v10 & 1) != 0)
    {
      id v12 = objc_alloc(&OBJC_CLASS___MCInteractionClient);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
      id v14 = -[MCInteractionClient initWithXPCClientConnection:](v12, "initWithXPCClientConnection:", v13);

LABEL_6:
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
      [v16 updateProfileIdentifier:v8 interactionClient:v14 source:v17 completion:v9];

      goto LABEL_9;
    }
  }

  else
  {
    id v18 = 0LL;
    unsigned __int8 v15 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.configurationprofiles",  @"SilentNonUIInstallation",  &v18);
    id v11 = v18;
    if ((v15 & 1) != 0)
    {
      id v14 = 0LL;
      goto LABEL_6;
    }
  }

  if (v9) {
    v9[2](v9, 0LL, v11);
  }
LABEL_9:
}

- (id)_invalidValue:(id)a3 forArgument:(id)a4
{
  uint64_t v4 = MCProfileRemovalErrorDomain;
  uint64_t v5 = MCErrorArray(@"ERROR_PROFILE_REMOVAL_INVALID_ARGUMENT");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v4,  1010LL,  v6,  MCErrorTypeFatal,  a4,  a3,  0LL));

  return v7;
}

- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  unsigned __int8 v9 = (void (**)(id, id))a5;
  id v19 = 0LL;
  unsigned int v10 = -[MCProfileServicer remoteProcessCanRemoveProfilesOutError:]( self,  "remoteProcessCanRemoveProfilesOutError:",  &v19);
  id v11 = v19;
  if (v10)
  {
    if (-[MCProfileServicer isCloudLockedProfileWithIdentifier:](self, "isCloudLockedProfileWithIdentifier:", v8))
    {
      uint64_t v12 = MCProfileRemovalErrorDomain;
      uint64_t v13 = MCErrorArray(@"ERROR_PROFILE_REMOVAL_PROFILE_PROTECTED");
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v12,  52000LL,  v14,  MCErrorTypeFatal,  0LL));
    }

    else
    {
      if ((unint64_t)a4 < 3)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
        unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
        [v16 removeProfileWithIdentifier:v8 installationType:a4 source:v17 completion:v9];

        goto LABEL_10;
      }

      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
      uint64_t v18 = objc_claimAutoreleasedReturnValue([v14 stringValue]);
      uint64_t v15 = objc_claimAutoreleasedReturnValue( -[MCProfileServicer _invalidValue:forArgument:]( self,  "_invalidValue:forArgument:",  v18,  @"MCProfileInstallationType"));

      id v11 = (id)v18;
    }

    id v11 = (id)v15;
  }

  if (v9) {
    v9[2](v9, v11);
  }
LABEL_10:
}

- (void)removeUninstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, id))a6;
  id v20 = 0LL;
  unsigned int v12 = -[MCProfileServicer remoteProcessCanRemoveProfilesOutError:]( self,  "remoteProcessCanRemoveProfilesOutError:",  &v20);
  id v13 = v20;
  if ((unint64_t)a4 >= 3 && v12)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stringValue]);
    id v16 = @"MCProfileInstallationType";
LABEL_8:
    uint64_t v18 = objc_claimAutoreleasedReturnValue(-[MCProfileServicer _invalidValue:forArgument:](self, "_invalidValue:forArgument:", v15, v16));

    id v13 = (id)v18;
    goto LABEL_9;
  }

  char v17 = v12 ^ 1;
  if (a5 < 8) {
    char v17 = 1;
  }
  if ((v17 & 1) == 0)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stringValue]);
    id v16 = @"MCProfileTargetDeviceType";
    goto LABEL_8;
  }

  if (v12)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v19 removeUninstalledProfileWithIdentifier:v10 installationType:a4 targetDeviceType:a5 completion:v11];

    goto LABEL_13;
  }

- (void)removeProtectedProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  unsigned __int8 v9 = (void (**)(id, id))a5;
  id v19 = 0LL;
  unsigned int v10 = -[MCProfileServicer remoteProcessCanRemoveProfilesOutError:]( self,  "remoteProcessCanRemoveProfilesOutError:",  &v19);
  id v11 = v19;
  if (v10)
  {
    unsigned int v12 = -[MCProfileServicer isCloudLockedProfileWithIdentifier:](self, "isCloudLockedProfileWithIdentifier:", v8);
    unsigned __int8 v13 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:]( self,  "remoteProcessHasEntitlementArray:containingString:",  @"com.apple.managedconfiguration.profiled.configurationprofiles",  @"CloudLockedRemoval");
    if (!v12 || (v13 & 1) != 0)
    {
      if ((unint64_t)a4 < 3)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
        [v15 removeProfileWithIdentifier:v8 installationType:a4 source:v16 completion:v9];

        goto LABEL_11;
      }

      char v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringValue]);
      uint64_t v14 = objc_claimAutoreleasedReturnValue( -[MCProfileServicer _invalidValue:forArgument:]( self,  "_invalidValue:forArgument:",  v18,  @"MCProfileInstallationType"));

      id v11 = v17;
    }

    else
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue( -[MCProfileServicer lacksArrayEntitlementError:withMemberString:]( self,  "lacksArrayEntitlementError:withMemberString:",  @"com.apple.managedconfiguration.profiled.configurationprofiles",  @"CloudLockedRemoval"));
    }

    id v11 = (id)v14;
  }

  if (v9) {
    v9[2](v9, v11);
  }
LABEL_11:
}

- (void)removePostSetupAutoInstallSetAsideProfileWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  id v8 = 0LL;
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessCanRemoveProfilesOutError:]( self,  "remoteProcessCanRemoveProfilesOutError:",  &v8);
  id v6 = v8;
  if ((v5 & 1) != 0)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v7 removePostSetupAutoInstallSetAsideProfileWithCompletion:v4];
  }

  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (void)removeSetAsideCloudConfigurationProfileWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  id v8 = 0LL;
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.set",  @"CloudConfiguration",  &v8);
  id v6 = v8;
  if ((v5 & 1) != 0)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v7 removeSetAsideCloudConfigurationProfileWithCompletion:v4];
  }

  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (BOOL)isCloudLockedProfileWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 installedProfileWithIdentifier:v3]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MCConfigurationProfile);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    unsigned __int8 v7 = [v5 isCloudLocked];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)remoteProcessCanRemoveProfilesOutError:(id *)a3
{
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.managedconfiguration.vpn-profile-access");
  return v5 | -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.configurationprofiles",  @"Removal",  a3);
}

- (void)applyRestrictionDictionary:(id)a3 overrideRestrictions:(BOOL)a4 appsAndOptions:(id)a5 clientType:(id)a6 clientUUID:(id)a7 localizedClientDescription:(id)a8 localizedWarningMessage:(id)a9 completion:(id)a10
{
  BOOL v26 = a4;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v27 = 0LL;
  unsigned __int8 v22 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.set",  @"ClientRestrictions",  &v27);
  id v23 = v27;
  if ((v22 & 1) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    [v24 applyRestrictionDictionary:v15 overrideRestrictions:v26 appsAndOptions:v16 clientType:v17 clientUUID:v18 sender:v25 localizedClientDescrip tion:v19 localizedWarningMessage:v20 completion:v21];
  }

  else if (v21)
  {
    (*((void (**)(id, void, void, id))v21 + 2))(v21, 0LL, 0LL, v23);
  }
}

- (void)clearRecoveryPasscodeWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  id v9 = 0LL;
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.set",  @"Passcode",  &v9);
  id v6 = v9;
  if ((v5 & 1) != 0)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    [v7 clearRecoveryPasscodeWithSenderBundleID:v8 completion:v4];
  }

  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (void)changePasscode:(id)a3 oldPasscode:(id)a4 isRecovery:(BOOL)a5 skipRecovery:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = (void (**)(id, void, id))a7;
  id v19 = 0LL;
  unsigned __int8 v15 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.set",  @"Passcode",  &v19);
  id v16 = v19;
  if ((v15 & 1) != 0)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    if (v9) {
      [v17 changePasscode:v12 recoveryPasscode:v13 skipRecovery:v8 senderBundleID:v18 completion:v14];
    }
    else {
      [v17 changePasscode:v12 oldPasscode:v13 skipRecovery:v8 senderBundleID:v18 completion:v14];
    }
  }

  else if (v14)
  {
    v14[2](v14, 0LL, v16);
  }
}

- (void)clearPasscodeWithEscrowKeybagData:(id)a3 secret:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = (void (**)(id, id))a5;
  id v15 = 0LL;
  unsigned __int8 v11 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.set",  @"Passcode",  &v15);
  id v12 = v15;
  if ((v11 & 1) != 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    [v13 clearPasscodeWithEscrowKeybagData:v8 secret:v9 senderBundleID:v14 completion:v10];
  }

  else if (v10)
  {
    v10[2](v10, v12);
  }
}

- (void)isPasscodeCompliantWithNamedPolicy:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, void, id))a4;
  id v11 = 0LL;
  unsigned __int8 v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.get",  @"PasscodeCompliance",  &v11);
  id v9 = v11;
  if ((v8 & 1) != 0)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v10 isPasscodeCompliantWithNamedPolicy:v6 completion:v7];
  }

  else if (v7)
  {
    v7[2](v7, 0LL, v9);
  }
}

- (void)resetPasscodeMetadataWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  id v8 = 0LL;
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.set",  @"PasscodeMetadata",  &v8);
  id v6 = v8;
  if ((v5 & 1) != 0)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v7 resetPasscodeMetadataWithCompletion:v4];
  }

  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (void)removeOrphanedClientRestrictionsWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  id v8 = 0LL;
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.set",  @"ClientRestrictions",  &v8);
  id v6 = v8;
  if ((v5 & 1) != 0)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v7 removeOrphanedClientRestrictionsWithCompletion:v4];
  }

  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (void)managedSystemConfigurationServiceIDsWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, id))a3;
  id v8 = 0LL;
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.get",  @"NetworkExtension",  &v8);
  id v6 = v8;
  if ((v5 & 1) != 0)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v7 managedSystemConfigurationServiceIDsWithCompletion:v4];
  }

  else if (v4)
  {
    v4[2](v4, 0LL, v6);
  }
}

- (void)managedWiFiNetworkNamesWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, id))a3;
  id v8 = 0LL;
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.get",  @"WiFiNetworks",  &v8);
  id v6 = v8;
  if ((v5 & 1) != 0)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v7 managedWiFiNetworkNamesWithCompletion:v4];
  }

  else if (v4)
  {
    v4[2](v4, 0LL, v6);
  }
}

- (void)migrateWithContext:(int)a3 passcodeWasSetInBackup:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = (void (**)(id, id))a5;
  id v12 = 0LL;
  unsigned __int8 v9 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:]( self,  "remoteProcessHasBooleanEntitlement:error:",  @"com.apple.managedconfiguration.profiled.migration",  &v12);
  id v10 = v12;
  if ((v9 & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v11 migrateWithContext:v6 passcodeWasSetInBackup:v5 completion:v8];
  }

  else if (v8)
  {
    v8[2](v8, v10);
  }
}

- (void)migrateCleanupMigratorWithContext:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = (void (**)(id, id))a4;
  id v10 = 0LL;
  unsigned __int8 v7 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:]( self,  "remoteProcessHasBooleanEntitlement:error:",  @"com.apple.managedconfiguration.profiled.migration",  &v10);
  id v8 = v10;
  if ((v7 & 1) != 0)
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v9 migrateCleanupMigratorWithContext:v4 completion:v6];
  }

  else if (v6)
  {
    v6[2](v6, v8);
  }
}

- (void)setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 completion:(id)a9
{
  BOOL v59 = a6;
  uint64_t v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  id v18 = (void (**)(id, id))a9;
  id v74 = 0LL;
  LOBYTE(a8) = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.set",  @"UserSettings",  &v74);
  id v60 = v74;
  v61 = self;
  unsigned int v53 = v11;
  id v55 = v17;
  id v56 = v16;
  id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v14 allKeys]);
  id v27 = [v26 countByEnumeratingWithState:&v70 objects:v81 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v71;
    id v57 = v14;
    v54 = v18;
    while (2)
    {
      v30 = 0LL;
      id v52 = v28;
      do
      {
        if (*(void *)v71 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v70 + 1) + 8LL * (void)v30);
        uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v31, v32) & 1) == 0)
        {
LABEL_30:

          id v18 = v54;
          goto LABEL_31;
        }

        id v33 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v31]);
        __int128 v66 = 0u;
        __int128 v67 = 0u;
        __int128 v68 = 0u;
        __int128 v69 = 0u;
        id v34 = v33;
        id v35 = [v34 countByEnumeratingWithState:&v66 objects:v80 count:16];
        if (v35)
        {
          id v36 = v35;
          uint64_t v37 = *(void *)v67;
          while (2)
          {
            for (i = 0LL; i != v36; i = (char *)i + 1)
            {
              if (*(void *)v67 != v37) {
                objc_enumerationMutation(v34);
              }
              uint64_t v39 = *(void *)(*((void *)&v66 + 1) + 8LL * (void)i);
              uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSString);
              if ((objc_opt_isKindOfClass(v39, v40) & 1) == 0)
              {

                id v14 = v57;
                goto LABEL_30;
              }

              [v25 addObject:v39];
            }

            id v36 = [v34 countByEnumeratingWithState:&v66 objects:v80 count:16];
            if (v36) {
              continue;
            }
            break;
          }
        }

        v30 = (char *)v30 + 1;
        id v14 = v57;
      }

      while (v30 != v52);
      id v28 = [v26 countByEnumeratingWithState:&v70 objects:v81 count:16];
      id v18 = v54;
      if (v28) {
        continue;
      }
      break;
    }
  }

  if ([v25 count])
  {
    id v58 = v14;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    id v41 = v25;
    id v42 = [v41 countByEnumeratingWithState:&v62 objects:v79 count:16];
    if (!v42)
    {
LABEL_28:

      id v14 = v58;
      id v17 = v55;
      id v16 = v56;
      uint64_t v11 = v53;
      self = v61;
LABEL_2:
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
      unsigned int v20 = [v19 processIdentifier];

      id v21 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
      unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
      LODWORD(v51) = v20;
      [v21 setParametersForSettingsByType:v14 configurationUUID:v15 toSystem:v11 user:v59 passcode:v16 credentialSet:v17 senderPID:v51 sender:v22 completion:v18];

      id v23 = 0LL;
      v24 = v60;
      goto LABEL_34;
    }

    id v43 = v42;
    uint64_t v44 = *(void *)v63;
LABEL_22:
    uint64_t v45 = 0LL;
    while (1)
    {
      if (*(void *)v63 != v44) {
        objc_enumerationMutation(v41);
      }
      uint64_t v46 = *(void *)(*((void *)&v62 + 1) + 8 * v45);
      v47 = objc_autoreleasePoolPush();
      id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"com.apple.managedconfiguration.feature-setting.",  v46));
      if (!-[MCProfileServicer remoteProcessHasBooleanEntitlement:](v61, "remoteProcessHasBooleanEntitlement:", v23)) {
        break;
      }

      objc_autoreleasePoolPop(v47);
      if (v43 == (id)++v45)
      {
        id v43 = [v41 countByEnumeratingWithState:&v62 objects:v79 count:16];
        if (v43) {
          goto LABEL_22;
        }
        goto LABEL_28;
      }
    }

    os_log_t v48 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v49 = v48;
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](v61, "remoteProcessBundleID"));
      *(_DWORD *)buf = 138543618;
      v76 = v50;
      __int16 v77 = 2114;
      v78 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "Process %{public}@ needs the entitlement “%{public}@”",  buf,  0x16u);
    }

    objc_autoreleasePoolPop(v47);

    id v14 = v58;
    id v17 = v55;
    if (!v23) {
      goto LABEL_32;
    }
    id v21 = (id)objc_claimAutoreleasedReturnValue(-[MCProfileServicer lacksBooleanEntitlementError:](v61, "lacksBooleanEntitlementError:", v23));
    id v16 = v56;
    v24 = v60;
    if (v18) {
      goto LABEL_33;
    }
  }

  else
  {
LABEL_31:

    id v17 = v55;
LABEL_32:
    v24 = v60;
    id v21 = v60;
    id v23 = 0LL;
    id v16 = v56;
    if (v18) {
LABEL_33:
    }
      v18[2](v18, v21);
  }

- (void)removeBoolSetting:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, id))a4;
  id v12 = 0LL;
  unsigned __int8 v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.set",  @"UserSettings",  &v12);
  id v9 = v12;
  if ((v8 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    [v10 removeBoolSetting:v6 sender:v11 completion:v7];
  }

  else if (v7)
  {
    v7[2](v7, v9);
  }
}

- (void)removeValueSetting:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, id))a4;
  id v12 = 0LL;
  unsigned __int8 v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.set",  @"UserSettings",  &v12);
  id v9 = v12;
  if ((v8 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    [v10 removeValueSetting:v6 sender:v11 completion:v7];
  }

  else if (v7)
  {
    v7[2](v7, v9);
  }
}

- (void)openSensitiveURL:(id)a3 unlock:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  id v14 = 0LL;
  unsigned __int8 v10 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:]( self,  "remoteProcessHasBooleanEntitlement:error:",  @"com.apple.managedconfiguration.profiled-access",  &v14);
  id v11 = v14;
  if ((v10 & 1) != 0)
  {
    if (-[MCProfileServicer remoteProcessHasBooleanEntitlement:]( self,  "remoteProcessHasBooleanEntitlement:",  @"com.apple.springboard.opensensitiveurl"))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
      [v12 openSensitiveURL:v8 unlock:v6 completion:v9];
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[MCProfileServicer lacksBooleanEntitlementError:]( self,  "lacksBooleanEntitlementError:",  @"com.apple.springboard.opensensitiveurl"));
      if (v9) {
        v9[2](v9, v13);
      }
    }
  }

  else if (v9)
  {
    v9[2](v9, v11);
  }
}

- (void)storeCertificateData:(id)a3 forIPCUIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, id))a5;
  id v14 = 0LL;
  unsigned __int8 v11 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.set",  @"Certificates",  &v14);
  id v12 = v14;
  if ((v11 & 1) != 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v13 storeCertificateData:v8 forIPCUIdentifier:v9 completion:v10];
  }

  else if (v10)
  {
    v10[2](v10, v12);
  }
}

- (void)installProvisioningProfileData:(id)a3 managingProfileIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, id))a5;
  id v14 = 0LL;
  unsigned __int8 v11 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.provisioningprofiles",  @"Installation",  &v14);
  id v12 = v14;
  if ((v11 & 1) != 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v13 installProvisioningProfileData:v8 managingProfileIdentifier:v9 completion:v10];
  }

  else if (v10)
  {
    v10[2](v10, v12);
  }
}

- (void)removeProvisioningProfileWithUUID:(id)a3 managingProfileIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, void, id))a5;
  id v15 = 0LL;
  unsigned __int8 v11 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.provisioningprofiles",  @"Removal",  &v15);
  id v12 = v15;
  if ((v11 & 1) != 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    [v13 removeProvisioningProfileWithUUID:v8 managingProfileIdentifier:v9 sender:v14 completion:v10];
  }

  else if (v10)
  {
    v10[2](v10, 0LL, v12);
  }
}

- (void)addTrustedCodeSigningIdentitiesForProvisioningProfileUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, void, id))a4;
  id v12 = 0LL;
  unsigned __int8 v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.provisioningprofiles",  @"AddTrusted",  &v12);
  id v9 = v12;
  if ((v8 & 1) != 0)
  {
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    [v10 addTrustedCodeSigningIdentitiesForProvisioningProfileUUID:v6 sender:v11 completion:v7];
  }

  else if (v7)
  {
    v7[2](v7, 0LL, v9);
  }
}

- (void)provisiongProfileUUIDsForSignerIdentity:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  [v7 provisiongProfileUUIDsForSignerIdentity:v6 completion:v5];
}

- (void)isBundleBlocked:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, id, id, void))a4;
  id v16 = 0LL;
  unsigned __int8 v8 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:]( self,  "remoteProcessHasBooleanEntitlement:error:",  @"com.apple.managedconfiguration.profiled-access",  &v16);
  id v9 = v16;
  if ((v8 & 1) != 0)
  {
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    id v14 = 0LL;
    id v15 = 0LL;
    id v11 = [v10 isBundleBlocked:v6 outHash:&v15 outHashType:&v14];
    id v12 = v15;
    id v13 = v14;
    v7[2](v7, v11, v12, v13, 0LL);
  }

  else if (v7)
  {
    ((void (**)(id, id, id, id, id))v7)[2](v7, 0LL, 0LL, 0LL, v9);
  }
}

- (void)areBundlesBlocked:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v37 = 0LL;
  LOBYTE(a4) = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:]( self,  "remoteProcessHasBooleanEntitlement:error:",  @"com.apple.managedconfiguration.profiled-access",  &v37);
  id v8 = v37;
  id v9 = v8;
  if ((a4 & 1) != 0)
  {
    id v22 = v8;
    id v23 = v7;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    uint64_t v29 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v24 = v6;
    id obj = v6;
    id v10 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v28 = *(void *)v34;
      uint64_t v12 = kMCMISIsBlockedKey;
      uint64_t v27 = kMCMISHashKey;
      uint64_t v26 = kMCMISHashTypeKey;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v34 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)i);
          id v31 = 0LL;
          id v32 = 0LL;
          id v15 = [v30 isBundleBlocked:v14 outHash:&v32 outHashType:&v31];
          id v16 = v32;
          id v17 = v31;
          id v18 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
          uint64_t v38 = v12;
          id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v15));
          uint64_t v39 = v19;
          unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
          id v21 = -[NSMutableDictionary initWithDictionary:](v18, "initWithDictionary:", v20);

          if (v16) {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v16, v27);
          }
          if (v17) {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v17, v26);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v21, v14);
        }

        id v11 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
      }

      while (v11);
    }

    id v7 = v23;
    ((void (**)(id, NSMutableDictionary *, id))v23)[2](v23, v29, 0LL);

    id v6 = v24;
    id v9 = v22;
  }

  else if (v7)
  {
    v7[2](v7, 0LL, v8);
  }
}

- (void)notifyStartComplianceTimer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v11 = 0LL;
  unsigned __int8 v8 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:]( self,  "remoteProcessHasBooleanEntitlement:error:",  @"com.apple.managedconfiguration.profiled.usercompliance",  &v11);
  id v9 = v11;
  if ((v8 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v10 notifyStartComplianceTimer:v6 completion:v7];
  }

  else if (v7)
  {
    v7[2](v7, v9);
  }
}

- (void)notifyHaveSeenComplianceMessageWithLastLockDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v11 = 0LL;
  unsigned __int8 v8 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:]( self,  "remoteProcessHasBooleanEntitlement:error:",  @"com.apple.managedconfiguration.profiled.usercompliance",  &v11);
  id v9 = v11;
  if ((v8 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v10 notifyHaveSeenComplianceMessageWithLastLockDate:v6 completion:v7];
  }

  else if (v7)
  {
    v7[2](v7, v9);
  }
}

- (void)recomputeUserComplianceWarningWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  id v8 = 0LL;
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:]( self,  "remoteProcessHasBooleanEntitlement:error:",  @"com.apple.managedconfiguration.profiled.usercompliance",  &v8);
  id v6 = v8;
  if ((v5 & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v7 recomputeUserComplianceWarningWithCompletion:v4];
  }

  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (void)recomputePerClientUserComplianceWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  id v8 = 0LL;
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:]( self,  "remoteProcessHasBooleanEntitlement:error:",  @"com.apple.managedconfiguration.profiled.usercompliance",  &v8);
  id v6 = v8;
  if ((v5 & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v7 recomputePerClientUserComplianceWithCompletion:v4];
  }

  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (void)resetAllSettingsToDefaultsIsUserInitiated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, id))a4;
  id v11 = 0LL;
  unsigned __int8 v7 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.set",  @"UserSettings",  &v11);
  id v8 = v11;
  if ((v7 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    [v9 resetAllSettingsToDefaultsIsUserInitiated:v4 sender:v10 completion:v6];
  }

  else if (v6)
  {
    v6[2](v6, v8);
  }
}

- (void)setUserInfo:(id)a3 forClientUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v15 = 0LL;
  unsigned __int8 v11 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.set",  @"ClientRestrictions",  &v15);
  id v12 = v15;
  if ((v11 & 1) != 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    [v13 setUserInfo:v8 forClientUUID:v9 sender:v14 completion:v10];
  }

  else if (v10)
  {
    v10[2](v10, v12);
  }
}

- (void)removeExpiredProfilesWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, id))a3;
  id v8 = 0LL;
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.provisioningprofiles",  @"Removal",  &v8);
  id v6 = v8;
  if ((v5 & 1) != 0)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v7 removeExpiredProfilesWithCompletion:v4];
  }

  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (void)storeProfileData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, id))a4;
  id v11 = 0LL;
  unsigned __int8 v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.configurationprofiles",  @"DEPInstallation",  &v11);
  id v9 = v11;
  if ((v8 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v10 storeProfileData:v6 completion:v7];
  }

  else if (v7)
  {
    v7[2](v7, v9);
  }
}

- (void)storedProfileDataWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void, id))a3;
  id v8 = 0LL;
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.configurationprofiles",  @"DEPInstallation",  &v8);
  id v6 = v8;
  if ((v5 & 1) != 0)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v7 storedProfileDataWithCompletion:v4];
  }

  else if (v4)
  {
    v4[2](v4, 0LL, v6);
  }
}

- (void)markStoredProfileAsInstalledWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, id))a3;
  id v8 = 0LL;
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.configurationprofiles",  @"DEPInstallation",  &v8);
  id v6 = v8;
  if ((v5 & 1) != 0)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v7 markStoredProfileAsInstalledWithCompletion:v4];
  }

  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (void)rereadManagedAppAttributesWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, id))a3;
  id v8 = 0LL;
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.get",  @"ManagedApplications",  &v8);
  id v6 = v8;
  if ((v5 & 1) != 0)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v7 rereadManagedAppAttributesWithCompletion:v4];
  }

  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (void)reducedMachineInfoDataWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void, id))a3;
  id v8 = 0LL;
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.get",  @"MachineInfo",  &v8);
  id v6 = v8;
  if ((v5 & 1) != 0)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v7 reducedMachineInfoDataWithCompletion:v4];
  }

  else if (v4)
  {
    v4[2](v4, 0LL, v6);
  }
}

- (void)cloudConfigurationMachineInfoDataWithAdditionalInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, void, id))a4;
  id v11 = 0LL;
  unsigned __int8 v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.get",  @"MachineInfo",  &v11);
  id v9 = v11;
  if ((v8 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v10 cloudConfigurationMachineInfoDataWithAdditionalInfo:v6 completion:v7];
  }

  else if (v7)
  {
    v7[2](v7, 0LL, v9);
  }
}

- (void)cloudConfigurationStoreDetails:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, id))a4;
  id v11 = 0LL;
  unsigned __int8 v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.set",  @"CloudConfiguration",  &v11);
  id v9 = v11;
  if ((v8 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v10 cloudConfigurationStoreDetails:v6 completion:v7];
  }

  else if (v7)
  {
    v7[2](v7, v9);
  }
}

- (void)restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void *))a3;
  id v11 = 0LL;
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.set",  @"CloudConfiguration",  &v11);
  id v6 = v11;
  unsigned __int8 v7 = v6;
  if ((v5 & 1) != 0)
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v8 restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:v4];
  }

  else if (v6)
  {
    id v9 = _MCLogObjects[2];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Remote process doesn't have the right entitlment!",  v10,  2u);
    }

    if (v4) {
      v4[2](v4, v7);
    }
  }
}

- (void)createActivationLockBypassCodeWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void, id))a3;
  id v8 = 0LL;
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.set",  @"ActivationLock",  &v8);
  id v6 = v8;
  if ((v5 & 1) != 0)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v7 createActivationLockBypassCodeWithCompletion:v4];
  }

  else if (v4)
  {
    v4[2](v4, 0LL, v6);
  }
}

- (void)storeActivationRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, id))a4;
  id v11 = 0LL;
  unsigned __int8 v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.set",  @"ActivationRecord",  &v11);
  id v9 = v11;
  if ((v8 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v10 storeActivationRecord:v6 completion:v7];
  }

  else if (v7)
  {
    v7[2](v7, v9);
  }
}

- (void)setUserBookmarks:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void (**)(id, id))a4;
  id v14 = 0LL;
  unsigned __int8 v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.set",  @"Safari",  &v14);
  id v9 = v14;
  if ((v8 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
    id v11 = [v10 processIdentifier];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    [v12 setUserBookmarks:v6 senderPID:v11 sender:v13 completion:v7];
  }

  else if (v7)
  {
    v7[2](v7, v9);
  }
}

- (void)allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 hostAppBundleID:(id)a4 accountIsManaged:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  id v14 = v13;
  if (v13) {
    [v13 auditToken];
  }
  else {
    memset(v24, 0, sizeof(v24));
  }

  uint64_t v15 = MCBundleIDFromAuditToken(v24);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if (v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v17 allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:v10 messageSendingAppBundleID:v16 hostAppBundleID:v11 accountIsManaged:v7 completion:v12];
LABEL_10:

    goto LABEL_11;
  }

  id v18 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Could not retrieve the bundle ID of the calling process. Denying access to all keyboards.",  buf,  2u);
  }

  if (v12)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    unsigned int v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004E460;
    block[3] = &unk_1000C2B28;
    id v22 = v12;
    dispatch_async(v20, block);

    id v17 = v22;
    goto LABEL_10;
  }

- (void)hasMailAccountsWithFilteringEnabled:(BOOL)a3 sourceAccountManagement:(int)a4 completion:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  id v10 = v9;
  if (v9)
  {
    [v9 auditToken];
  }

  else
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10004E55C;
  v14[3] = &unk_1000C39D8;
  id v15 = v8;
  v13[0] = v16;
  v13[1] = v17;
  id v12 = v8;
  [v11 loadMailAccountsWithAuditToken:v13 filteringEnabled:v6 sourceAccountManagement:v5 completion:v14];
}

- (void)setupAssistantDidFinishCompletion:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  BOOL v4 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Setup Assistant finished.", buf, 2u);
  }

  id v5 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-SetupAssistantFinished"];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](&OBJC_CLASS___MDMClient, "sharedClient"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[MDMCloudConfiguration sharedConfiguration]( &OBJC_CLASS___MDMCloudConfiguration,  "sharedConfiguration"));
  unsigned int v8 = [v7 isSupervised];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v10 = MDMFilePath(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  unsigned int v12 = [v9 fileExistsAtPath:v11 isDirectory:0];

  unint64_t v13 = (unint64_t)[v6 accessRights] & 4;
  id v14 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    unsigned int v26 = v12;
    __int16 v27 = 1024;
    unsigned int v28 = v8;
    __int16 v29 = 1024;
    int v30 = v13 >> 2;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Buddy completed. Enrolled in MDM: %u, supervised: %u, hasPasscodeRemovalRight: %u",  buf,  0x14u);
  }

  id v15 = _MCLogObjects[0];
  if (v12 && v13)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Scheduling token update to inform the server about the new unlock token",  buf,  2u);
    }

    [v6 scheduleTokenUpdate];
  }

  else
  {
    BOOL v16 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO);
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Deleting any unlock token created during Buddy",  buf,  2u);
    }

    uint64_t v17 = MCKeybagDeleteMDMEscrowData(v16);
    MCKeybagDeleteMDMEscrowSecret(v17);
  }

  dispatch_time_t v18 = dispatch_time(0LL, 10000000000LL);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  unsigned int v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10004E88C;
  v22[3] = &unk_1000C3A00;
  char v24 = v12;
  id v21 = v5;
  id v23 = v21;
  dispatch_after(v18, v20, v22);

  if (v3) {
    v3[2](v3, 0LL);
  }
}

- (void)validateAppBundleIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, id))a4;
  id v12 = 0LL;
  unsigned __int8 v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.provisioningprofiles",  @"Validation",  &v12);
  id v9 = v12;
  if ((v8 & 1) != 0)
  {
    uint64_t v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Validate app bundle IDs: %{public}@", buf, 0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v11 validateAppBundleIDs:v6 completion:v7];
  }

  else if (v7)
  {
    v7[2](v7, v9);
  }
}

- (void)recomputeProfileRestrictionsWithCompletionBlock:(id)a3
{
  BOOL v4 = (void (**)(id, id))a3;
  id v8 = 0LL;
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:]( self,  "remoteProcessHasBooleanEntitlement:error:",  @"com.apple.managedconfiguration.profiled.migration",  &v8);
  id v6 = v8;
  if ((v5 & 1) != 0)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v7 recomputeProfileRestrictionsWithCompletionBlock:v4];
  }

  else if (v4)
  {
    v4[2](v4, v6);
  }
}

- (void)shutDownWithCompletion:(id)a3
{
  id v4 = a3;
  id v17 = 0LL;
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:]( self,  "remoteProcessHasBooleanEntitlement:error:",  @"com.apple.managedconfiguration.profiled.shutdown",  &v17);
  id v6 = v17;
  if ((v5 & 1) != 0)
  {
    xpc_transaction_exit_clean();
    if (v4)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_10004EC48;
      v12[3] = &unk_1000C2B28;
      id v9 = &v13;
      id v13 = v4;
      dispatch_async(v8, v12);
LABEL_6:
    }
  }

  else if (v4)
  {
    dispatch_queue_global_t v10 = dispatch_get_global_queue(0LL, 0LL);
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004EC38;
    block[3] = &unk_1000C2C40;
    id v9 = &v16;
    id v16 = v4;
    id v15 = (dispatch_queue_s *)v6;
    dispatch_async(v11, block);

    id v8 = v15;
    goto LABEL_6;
  }
}

- (void)showFeaturePromptForSetting:(id)a3 configurationUUID:(id)a4 promptOptions:(id)a5 promptIdentifier:(id)a6 completion:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10004EEDC;
  v35[3] = &unk_1000C3A50;
  id v12 = a7;
  id v36 = v12;
  id v13 = objc_retainBlock(v35);
  id v34 = 0LL;
  LOBYTE(a7) = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.set",  @"UserSettings",  &v34);
  id v14 = v34;
  if ((a7 & 1) != 0)
  {
    id v31 = (void *)objc_claimAutoreleasedReturnValue(+[MCUserNotificationManager sharedManager](&OBJC_CLASS___MCUserNotificationManager, "sharedManager"));
    id v28 = v11;
    int v30 = (void *)objc_claimAutoreleasedReturnValue( -[MCProfileServicer prefixedFeaturePromptIdentifierForIdentifier:]( self,  "prefixedFeaturePromptIdentifierForIdentifier:",  v11));
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kMCFeaturePromptTitleKey]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kMCFeaturePromptMessageKey]);
    uint64_t v17 = MCLocalizedString(@"FEATURE_PROMPT_DENY_BUTTON_TITLE", v16);
    dispatch_time_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v20 = MCLocalizedString(@"FEATURE_PROMPT_ALLOW_BUTTON_TITLE", v19);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kMCFeaturePromptShowAlwaysAllowButtonKey]);
    unsigned int v24 = [v22 BOOLValue];
    if (v24)
    {
      uint64_t v25 = MCLocalizedString(@"FEATURE_PROMPT_ALWAYS_ALLOW_BUTTON_TITLE", v23);
      unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    }

    else
    {
      unsigned int v26 = 0LL;
    }

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10004EFA8;
    v32[3] = &unk_1000C3508;
    __int128 v33 = v13;
    BYTE2(v27) = 1;
    LOWORD(v27) = 1;
    objc_msgSend( v31,  "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfiel dPlaceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:",  v30,  v29,  v15,  v18,  v21,  v26,  0.0,  0,  v27,  0,  v32);
    if (v24) {

    }
    id v11 = v28;
  }

  else
  {
    ((void (*)(void *, void, id))v13[2])(v13, 0LL, v14);
  }
}

- (void)cancelFeaturePromptWithIdentifier:(id)a3 completion:(id)a4
{
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10004F27C;
  v18[3] = &unk_1000C3160;
  id v6 = a4;
  id v19 = v6;
  id v7 = a3;
  id v8 = objc_retainBlock(v18);
  if (!v7)
  {
    uint64_t v9 = MCFeaturePromptErrorDomain;
    uint64_t v10 = MCErrorArray(@"FEATURE_PROMPT_INVALID_IDENTIFIER");
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v9,  50002LL,  v11,  MCErrorTypeFatal,  0LL));
    ((void (*)(void *, void *))v8[2])(v8, v12);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCUserNotificationManager sharedManager](&OBJC_CLASS___MCUserNotificationManager, "sharedManager"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[MCProfileServicer prefixedFeaturePromptIdentifierForIdentifier:]( self,  "prefixedFeaturePromptIdentifierForIdentifier:",  v7));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10004F33C;
  v16[3] = &unk_1000C2B28;
  id v17 = v8;
  id v15 = v8;
  [v13 cancelNotificationsWithIdentifier:v14 completionBlock:v16];
}

- (id)prefixedFeaturePromptIdentifierForIdentifier:(id)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(@"feature-prompt:", "stringByAppendingString:"));
  }
  else {
    return @"feature-prompt:";
  }
}

- (void)mayShareToMessagesForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void, id))a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  id v11 = v10;
  if (v10) {
    [v10 auditToken];
  }
  else {
    memset(v20, 0, sizeof(v20));
  }

  uint64_t v12 = MCBundleIDFromAuditToken(v20);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (!v8)
  {
    id v17 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "No originating app bundle id passed. Using caller's bundle id.",  buf,  2u);
    }

    id v8 = v13;
    goto LABEL_11;
  }

  if ([v8 isEqualToString:v13])
  {
LABEL_11:
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v16 mayShareToMessagesForOriginatingAppBundleID:v8 originatingAccountIsManaged:v6 completion:v9];
    goto LABEL_12;
  }

  id v18 = 0LL;
  unsigned __int8 v14 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:]( self,  "remoteProcessHasBooleanEntitlement:error:",  @"com.apple.managedconfiguration.profiled.sharing-access-check-messages",  &v18);
  id v15 = v18;
  uint64_t v16 = v15;
  if ((v14 & 1) != 0)
  {

    goto LABEL_11;
  }

  if (v9) {
    v9[2](v9, 0LL, v15);
  }
LABEL_12:
}

- (void)mayShareToAirDropForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void, id))a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  id v11 = v10;
  if (v10) {
    [v10 auditToken];
  }
  else {
    memset(v20, 0, sizeof(v20));
  }

  uint64_t v12 = MCBundleIDFromAuditToken(v20);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (!v8)
  {
    id v17 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "No originating app bundle id passed. Using caller's bundle id.",  buf,  2u);
    }

    id v8 = v13;
    goto LABEL_11;
  }

  if ([v8 isEqualToString:v13])
  {
LABEL_11:
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v16 mayShareToAirDropForOriginatingAppBundleID:v8 originatingAccountIsManaged:v6 completion:v9];
    goto LABEL_12;
  }

  id v18 = 0LL;
  unsigned __int8 v14 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:]( self,  "remoteProcessHasBooleanEntitlement:error:",  @"com.apple.managedconfiguration.profiled.sharing-access-check-air-drop",  &v18);
  id v15 = v18;
  uint64_t v16 = v15;
  if ((v14 & 1) != 0)
  {

    goto LABEL_11;
  }

  if (v9) {
    v9[2](v9, 0LL, v15);
  }
LABEL_12:
}

- (void)createMDMUnlockTokenIfNeededWithPasscode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v11 = 0LL;
  unsigned __int8 v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.set",  @"Passcode",  &v11);
  id v9 = v11;
  if ((v8 & 1) != 0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v10 createMDMUnlockTokenIfNeededWithPasscode:v6 completion:v7];
  }

  else if (v7)
  {
    v7[2](v7, v9);
  }
}

- (void)monitorEnrollmentStateWithPersonaID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = objc_alloc(&OBJC_CLASS___MCInteractionClient);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  unsigned __int8 v8 = -[MCInteractionClient initWithXPCClientConnection:](v5, "initWithXPCClientConnection:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  [v7 monitorEnrollmentStateForClient:v8 personaID:v4];
}

- (void)managingOrganizationInformationWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  id v8 = 0LL;
  unsigned __int8 v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.get",  @"MDMInfo",  &v8);
  id v6 = v8;
  if ((v5 & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v7 managingOrganizationInformationWithCompletion:v4];
  }

  else if (v4)
  {
    v4[2](v4, 0LL, v6);
  }
}

- (void)stageMDMEnrollmentInfoForPairingWatchWithProfileData:(id)a3 orServiceURL:(id)a4 anchorCertificates:(id)a5 supervised:(BOOL)a6 declarationKeys:(id)a7 declarationConfiguration:(id)a8 completion:(id)a9
{
  BOOL v11 = a6;
  id v22 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = (void (**)(id, void *))a9;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[MCProfileServicer _missingWatchMDMEnrollmentEntitlementError]( self,  "_missingWatchMDMEnrollmentEntitlementError"));
  if (v20)
  {
    if (v19) {
      v19[2](v19, v20);
    }
  }

  else
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v21 stageMDMEnrollmentInfoForPairingWatchWithProfileData:v22 orServiceURL:v15 anchorCertificates:v16 supervised:v11 declarationKeys:v17 de clarationConfiguration:v18 completion:v19];
  }
}

- (void)unstageMDMEnrollmentInfoForPairingWatchWithCompletion:(id)a3
{
  id v6 = (void (**)(id, void *))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MCProfileServicer _missingWatchMDMEnrollmentEntitlementError]( self,  "_missingWatchMDMEnrollmentEntitlementError"));
  if (v4)
  {
    if (v6) {
      v6[2](v6, v4);
    }
  }

  else
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v5 unstageMDMEnrollmentInfoForPairingWatchWithCompletion:v6];
  }
}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:(id)a3
{
  id v6 = (void (**)(id, void, void *))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MCProfileServicer _missingWatchMDMEnrollmentEntitlementError]( self,  "_missingWatchMDMEnrollmentEntitlementError"));
  if (v4)
  {
    if (v6) {
      v6[2](v6, 0LL, v4);
    }
  }

  else
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v5 fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:v6];
  }
}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MCProfileServicer _missingWatchMDMEnrollmentEntitlementError]( self,  "_missingWatchMDMEnrollmentEntitlementError"));
  if (v7)
  {
    if (v6) {
      v6[2](v6, 0LL, v7);
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v8 fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:v9 completion:v6];
  }
}

- (void)fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:(id)a3
{
  id v6 = (void (**)(id, void, void *))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MCProfileServicer _missingWatchMDMEnrollmentEntitlementError]( self,  "_missingWatchMDMEnrollmentEntitlementError"));
  if (v4)
  {
    if (v6) {
      v6[2](v6, 0LL, v4);
    }
  }

  else
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v5 fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:v6];
  }
}

- (void)applyPairingWatchMDMEnrollmentData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MCProfileServicer _missingWatchMDMEnrollmentEntitlementError]( self,  "_missingWatchMDMEnrollmentEntitlementError"));
  if (v8)
  {
    if (v7) {
      v7[2](v7, v8);
    }
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    if (!v9)
    {
      uint64_t v10 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Could not retrieve the bundle ID of the calling process. Not marking profile's installer.",  v12,  2u);
      }
    }

    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v11 applyPairingWatchMDMEnrollmentData:v6 source:v9 completion:v7];
  }
}

- (void)updateMDMEnrollmentInfoForPairingWatch:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MCProfileServicer _missingWatchMDMEnrollmentEntitlementError]( self,  "_missingWatchMDMEnrollmentEntitlementError"));
  if (v7)
  {
    if (v6) {
      v6[2](v6, 0LL, v7);
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
    [v8 updateMDMEnrollmentInfoForPairingWatch:v9 completion:v6];
  }
}

- (id)_missingWatchMDMEnrollmentEntitlementError
{
  id v7 = 0LL;
  unsigned __int8 v2 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:]( self,  "remoteProcessHasEntitlementArray:containingString:error:",  @"com.apple.managedconfiguration.profiled.configurationprofiles",  @"WatchMDMEnrollment",  &v7);
  id v3 = v7;
  id v4 = v3;
  id v5 = 0LL;
  if ((v2 & 1) == 0) {
    id v5 = v3;
  }

  return v5;
}

- (void)debugRescheduleBackgroundActivity:(int64_t)a3 startDate:(id)a4 gracePeriod:(id)a5 repeatingInterval:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  [v15 debugRescheduleBackgroundActivity:a3 startDate:v14 gracePeriod:v13 repeatingInterval:v12 completion:v11];
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConnection);
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end