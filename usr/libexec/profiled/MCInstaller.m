@interface MCInstaller
+ (id)_installationFailureErrorWithUnderlyingError:(id)a3;
+ (id)considerProfilesInstalledDuringBuddyForManagement;
+ (id)deviceIsSupervisedError;
+ (id)deviceNotSupervisedError;
+ (id)notInstalledByMDMError;
+ (id)notSupportedUnderMultiUserModeError;
+ (id)sharedInstaller;
+ (void)_enumerateProfilesWithCriteria:(id)a3 filterFlags:(int)a4 block:(id)a5;
+ (void)_setPathsSystemProfileStorageDirectory:(id)a3 userProfileStorageDirectory:(id)a4;
+ (void)isInteractiveProfileInstallationAllowedBySDP:(id)a3 completion:(id)a4;
- (BOOL)_allowsPasswordPoliciesFromProfile:(id)a3 outError:(id *)a4;
- (BOOL)_overrideProfileValidation;
- (BOOL)_promptUserForComplianceWithRestrictions:(id)a3 handler:(id)a4 interactionClient:(id)a5 outPasscode:(id *)a6 outError:(id *)a7;
- (BOOL)_promptUserForMAIDSignIn:(id)a3 personaID:(id)a4 handler:(id)a5 interactionClient:(id)a6 outError:(id *)a7;
- (BOOL)_showWarnings:(id)a3 interactionClient:(id)a4 outError:(id *)a5;
- (BOOL)_showWarningsForProfile:(id)a3 interactionClient:(id)a4 outError:(id *)a5;
- (BOOL)_showWarningsForUpdatingProfile:(id)a3 originalProfile:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)deviceSupervisionRequiredForPayload:(id)a3;
- (BOOL)interactionClient:(id)a3 didRequestPreflightUserInputResponses:(id)a4 forPayloadIndex:(unint64_t)a5 outError:(id *)a6;
- (BOOL)isCertificateReference:(id)a3 aliasedInDependencyManager:(id)a4;
- (BOOL)sendPurgatoryProfileData:(id)a3 identifier:(id)a4 targetDevice:(unint64_t)a5 outError:(id *)a6;
- (MCInstaller)init;
- (NSMutableDictionary)setAsideAccountIdentifiersByPayloadClass;
- (NSMutableDictionary)setAsideDictionariesByPayloadClass;
- (NSTimer)purgatoryTimer;
- (id)_assumeOwnershipProfileHandler:(id)a3 options:(id)a4 source:(id)a5 outError:(id *)a6;
- (id)_badProvisioningProfileError;
- (id)_deviceLockedError;
- (id)_errorUnacceptablePayload:(id)a3;
- (id)_guardAgainstNoMDMPayloadWithNewProfile:(id)a3 oldProfile:(id)a4;
- (id)_installProfileHandler:(id)a3 options:(id)a4 interactionClient:(id)a5 source:(id)a6 outError:(id *)a7;
- (id)_installationHaltedTopLevelError;
- (id)_installedProfileWithIdentifier:(id)a3 installationType:(int64_t)a4;
- (id)_invalidInputError;
- (id)_malformedPayloadErrorInternal:(BOOL)a3;
- (id)_malformedPayloadErrorWithUnderlyingError:(id)a3;
- (id)_managingProfileIdentifierForProfileIdentifier:(id)a3;
- (id)_preflightProfileForInstallationOnHomePod:(id)a3;
- (id)_preflightProfileForInstallationOnWatch:(id)a3;
- (id)_profileDrivenEnrollmentBlocked;
- (id)_profileDrivenUserEnrollmentNotSupportedError;
- (id)_profileNotEligibleErrorWithProfile:(id)a3;
- (id)_reallyRemoveInstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 options:(id)a5 source:(id)a6;
- (id)_reallyRemoveProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 profileInstalled:(BOOL)a5 targetDeviceType:(unint64_t)a6 options:(id)a7 source:(id)a8;
- (id)_targetDeviceArchivedError;
- (id)_targetDeviceErrorWithUnderlyingError:(id)a3;
- (id)_targetDeviceMismatchError;
- (id)_targetDevicePreflightFailedError;
- (id)_targetDeviceUnavailableError;
- (id)_uiProfileInstallationDisabledTopLevelErrorWithCause:(id)a3;
- (id)_userCancelledErrorWithFriendlyName:(id)a3;
- (id)_validateMDMReplacementNewProfile:(id)a3 oldProfile:(id)a4 client:(id)a5;
- (id)_validateNewMDMProfile:(id)a3 installationOption:(id)a4;
- (id)_watchInformationOutIsCellularSupported:(BOOL *)a3;
- (id)existingProfileContainingPayloadClass:(Class)a3 excludingProfileIdentifier:(id)a4;
- (id)existingProfileContainingPayloadClass:(Class)a3 inProfilesWithFilterFlags:(int)a4 excludingProfileIdentifier:(id)a5;
- (id)identifiersOfInstalledProfilesWithFilterFlags:(int)a3;
- (id)installProfileData:(id)a3 options:(id)a4 interactionClient:(id)a5 source:(id)a6 outError:(id *)a7;
- (id)pathToInstalledProfileByIdentifier:(id)a3 installationType:(int64_t)a4;
- (id)pathToInstalledProfileByUUID:(id)a3;
- (id)pathToUninstalledProfileByIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5;
- (id)peekPurgatoryProfileDataForTargetDevice:(unint64_t)a3;
- (id)popProfileDataAtHeadOfInstallationQueue;
- (id)removeProvisioningProfileUUID:(id)a3 sender:(id)a4;
- (id)setAsideAccountIdentifiersForPayloadClass:(Class)a3;
- (id)setAsideDictionariesForPayloadHandlerClass:(Class)a3;
- (id)updateProfileWithIdentifier:(id)a3 interactionClient:(id)a4 installForSystem:(BOOL)a5 source:(id)a6 outError:(id *)a7;
- (id)updateProfileWithIdentifier:(id)a3 interactionClient:(id)a4 source:(id)a5 outError:(id *)a6;
- (id)verifiedMDMProfileIdentifierWithCleanUp;
- (int64_t)_targetValidationStatusForProfile:(id)a3;
- (void)_checkinWithMdmd;
- (void)_cleanUpAfterRemovingProfileWithIdentifier:(id)a3 installedForUser:(BOOL)a4 profileHandler:(id)a5 oldRestrictions:(id)a6;
- (void)_continueQueueingProfile:(id)a3 profileData:(id)a4 forDevice:(unint64_t)a5 completion:(id)a6;
- (void)_postPurgatoryFollowUpForProfileData:(id)a3 targetDevice:(unint64_t)a4;
- (void)_promptUserForRestoreWithAccountID:(id)a3 personaID:(id)a4 interactionClient:(id)a5;
- (void)_purgatoryWorkerQueue_didPurgePurgatory:(BOOL)a3;
- (void)_queueProfileData:(id)a3 profile:(id)a4 forDevice:(unint64_t)a5 completion:(id)a6;
- (void)_removeOrphanedCertificateDependencyManager:(id)a3 persistentID:(id)a4 persona:(id)a5;
- (void)_removeOrphanedResourcesOptions:(id)a3 includingAccounts:(BOOL)a4;
- (void)_replacePurgatoryProfilesForTargetDevice:(unint64_t)a3;
- (void)_sendMDMEnrollmentEventWithInstallationOptions:(id)a3;
- (void)_updateCDPWithNewPasscode:(id)a3 passcodeType:(int)a4;
- (void)addSetAsideAccountIdentifier:(id)a3 forPayloadClass:(Class)a4;
- (void)addSetAsideDictionary:(id)a3 forPayloadHandlerClass:(Class)a4;
- (void)purgePurgatoryProfileWithIdentifier:(id)a3 targetDevice:(unint64_t)a4;
- (void)purgePurgatoryProfilesForTargetDevice:(unint64_t)a3;
- (void)queueProfileDataForInstallation:(id)a3 originalFileName:(id)a4 completion:(id)a5;
- (void)recomputeProfileRestrictionsWithCompletionBlock:(id)a3;
- (void)removeAllProfilesFromInstallationQueue;
- (void)removeManagedProfilesIfNecessary;
- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 options:(id)a5 source:(id)a6;
- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 source:(id)a5;
- (void)removeUninstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5;
- (void)setPurgatoryTimer:(id)a3;
- (void)setSetAsideAccountIdentifiersByPayloadClass:(id)a3;
- (void)setSetAsideDictionariesByPayloadClass:(id)a3;
@end

@implementation MCInstaller

+ (id)sharedInstaller
{
  if (qword_1000DC128 != -1) {
    dispatch_once(&qword_1000DC128, &stru_1000C3810);
  }
  return (id)qword_1000DC120;
}

- (MCInstaller)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MCInstaller;
  v2 = -[MCInstaller init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    queuedProfiles = v2->_queuedProfiles;
    v2->_queuedProfiles = v3;

    dispatch_queue_t v5 = dispatch_queue_create("MCInstaller Purgatory worker queue", 0LL);
    purgatoryWorkerQueue = v2->_purgatoryWorkerQueue;
    v2->_purgatoryWorkerQueue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (id)identifiersOfInstalledProfilesWithFilterFlags:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiersOfProfilesWithFilterFlags:v3]);

  return v5;
}

- (id)pathToInstalledProfileByIdentifier:(id)a3 installationType:(int64_t)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allInstalledProfileIdentifiers]);

  if ([v7 containsObject:v5])
  {
    if (a4 == 2) {
      id v8 = sub_10003CEFC();
    }
    else {
      id v8 = sub_10003CF38();
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v5 MCHashedFilenameWithExtension:@"stub"]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:v11]);
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (id)pathToUninstalledProfileByIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCHoldingTankManifest sharedManifest](&OBJC_CLASS___MCHoldingTankManifest, "sharedManifest"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uninstalledProfileIdentifiersForDevice:a5]);

  if ([v8 containsObject:v6])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCHoldingTankManifest sharedManifest](&OBJC_CLASS___MCHoldingTankManifest, "sharedManifest"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 pathToHoldingTankProfileDataForIdentifier:v6 targetDevice:a5 createDirectory:0]);
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

- (id)pathToInstalledProfileByUUID:(id)a3
{
  id v26 = a3;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allInstalledProfileIdentifiers]);

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v30;
    id v8 = &MailAccountHostname_ptr;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v30 != v7) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v29 + 1) + 8 * v9);
      v11 = objc_autoreleasePoolPush();
      v12 = (void *)objc_claimAutoreleasedReturnValue([v8[93] sharedManifest]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allInstalledUserProfileIdentifiers]);
      unsigned int v14 = [v13 containsObject:v10];

      if (v14) {
        id v15 = sub_10003CEFC();
      }
      else {
        id v15 = sub_10003CF38();
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v10 MCHashedFilenameWithExtension:@"stub"]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByAppendingPathComponent:v17]);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v18));
      uint64_t v28 = 0LL;
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfile profileWithData:outError:]( &OBJC_CLASS___MCProfile,  "profileWithData:outError:",  v19,  &v28));
      v21 = v20;
      id v22 = 0LL;
      if (!v28)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue([v20 UUID]);
        unsigned int v24 = [v23 isEqualToString:v26];

        if (v24) {
          id v22 = v18;
        }
        else {
          id v22 = 0LL;
        }
        id v8 = &MailAccountHostname_ptr;
      }

      objc_autoreleasePoolPop(v11);
      if (v22) {
        break;
      }
      if (v6 == (id)++v9)
      {
        id v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_17;
      }
    }
  }

  else
  {
LABEL_17:
    id v22 = 0LL;
  }

  return v22;
}

- (id)popProfileDataAtHeadOfInstallationQueue
{
  if (-[NSMutableArray count](self->_queuedProfiles, "count"))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_queuedProfiles, "objectAtIndex:", 0LL));
    -[NSMutableArray removeObjectAtIndex:](self->_queuedProfiles, "removeObjectAtIndex:", 0LL);
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

- (id)_badProvisioningProfileError
{
  uint64_t v2 = MCProvisioningProfileErrorDomain;
  uint64_t v3 = MCErrorArray(@"PROVISIONING_ERROR_BAD_PROFILE");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  25000LL,  v4,  MCErrorTypeFatal,  0LL));

  return v5;
}

- (void)queueProfileDataForInstallation:(id)a3 originalFileName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v47 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfile profileWithData:fileName:allowEmptyPayload:outError:]( &OBJC_CLASS___MCProfile,  "profileWithData:fileName:allowEmptyPayload:outError:",  v8,  a4,  0LL,  &v47));
  id v11 = v47;
  if (!v11)
  {
    v16 = _MCLogObjects[9];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Stub profile cannot be queued for installation",  buf,  2u);
    }

    id v11 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _malformedPayloadErrorInternal:](self, "_malformedPayloadErrorInternal:", 1LL));
    if (!v11)
    {
LABEL_32:
      if ([v10 targetDeviceType])
      {
        v36 = _NSConcreteStackBlock;
        uint64_t v37 = 3221225472LL;
        v38 = sub_10003D8C0;
        v39 = &unk_1000C3860;
        v40 = self;
        id v17 = v10;
        id v41 = v17;
        id v18 = v9;
        id v42 = v18;
        v19 = objc_retainBlock(&v36);
        switch(-[MCInstaller _targetValidationStatusForProfile:]( self,  "_targetValidationStatusForProfile:",  v17,  v36,  v37,  v38,  v39,  v40))
        {
          case 0LL:
            os_log_t v20 = _MCLogObjects[9];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21 = v20;
              id v22 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfile stringForDeviceType:]( MCProfile,  "stringForDeviceType:",  [v17 targetDeviceType]));
              *(_DWORD *)buf = 138543362;
              v49 = v22;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Profile-defined target-device-type %{public}@ successfully validated",  buf,  0xCu);
            }

            -[MCInstaller _queueProfileData:profile:forDevice:completion:]( self,  "_queueProfileData:profile:forDevice:completion:",  v8,  v17,  [v17 targetDeviceType],  v18);
            break;
          case 1LL:
            uint64_t v34 = objc_claimAutoreleasedReturnValue(-[MCInstaller _targetDeviceMismatchError](self, "_targetDeviceMismatchError"));
            goto LABEL_25;
          case 2LL:
            uint64_t v34 = objc_claimAutoreleasedReturnValue(-[MCInstaller _targetDevicePreflightFailedError](self, "_targetDevicePreflightFailedError"));
            goto LABEL_25;
          case 3LL:
            uint64_t v34 = objc_claimAutoreleasedReturnValue(-[MCInstaller _targetDeviceUnavailableError](self, "_targetDeviceUnavailableError"));
            goto LABEL_25;
          case 4LL:
            uint64_t v34 = objc_claimAutoreleasedReturnValue(-[MCInstaller _targetDeviceArchivedError](self, "_targetDeviceArchivedError"));
LABEL_25:
            v35 = (void *)v34;
            ((void (*)(void ***, uint64_t))v19[2])(v19, v34);

            break;
          default:
            break;
        }

        __int128 v29 = v41;
      }

      else
      {
        id v23 = +[MCProfile thisDeviceType](&OBJC_CLASS___MCProfile, "thisDeviceType");
        if (v23 != (id)1)
        {
          id v30 = v23;
          os_log_t v31 = _MCLogObjects[9];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            __int128 v32 = v31;
            v33 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
            *(_DWORD *)buf = 138543618;
            v49 = v33;
            __int16 v50 = 2050;
            id v51 = v30;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Profile '%{public}@' does not define a target device. Assuming %{public}lu...",  buf,  0x16u);
          }

          -[MCInstaller _queueProfileData:profile:forDevice:completion:]( self,  "_queueProfileData:profile:forDevice:completion:",  v8,  v10,  v30,  v9);
          goto LABEL_28;
        }

        unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue( -[MCInstaller _preflightProfileForInstallationOnWatch:]( self,  "_preflightProfileForInstallationOnWatch:",  v10));

        v25 = (void *)objc_claimAutoreleasedReturnValue( -[MCInstaller _preflightProfileForInstallationOnHomePod:]( self,  "_preflightProfileForInstallationOnHomePod:",  v10));
        os_log_t v26 = _MCLogObjects[9];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = v26;
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
          *(_DWORD *)buf = 138543362;
          v49 = v28;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Profile '%{public}@' does not define a target device. Asking user to resolve...",  buf,  0xCu);
        }

        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472LL;
        v43[2] = sub_10003D8AC;
        v43[3] = &unk_1000C3838;
        v43[4] = self;
        id v44 = v8;
        id v45 = v10;
        id v46 = v9;
        +[MCTargetDeviceResolver showResolutionPromptWithWatchOption:homePodOption:completionBlock:]( &OBJC_CLASS___MCTargetDeviceResolver,  "showResolutionPromptWithWatchOption:homePodOption:completionBlock:",  v24 == 0LL,  v25 == 0LL,  v43);

        __int128 v29 = v44;
      }

LABEL_28:
      id v11 = 0LL;
      goto LABEL_29;
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue( -[MCInstaller _malformedPayloadErrorWithUnderlyingError:]( self,  "_malformedPayloadErrorWithUnderlyingError:",  v11));
  os_log_t v13 = _MCLogObjects[9];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    unsigned int v14 = v13;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 MCVerboseDescription]);
    *(_DWORD *)buf = 138543362;
    v49 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Profile cannot be queued for installation. Error: %{public}@",  buf,  0xCu);
  }

  (*((void (**)(id, void *, void *, uint64_t))v9 + 2))(v9, v12, v10, 99LL);

LABEL_29:
}

- (int64_t)_targetValidationStatusForProfile:(id)a3
{
  id v4 = a3;
  int64_t v5 = 1LL;
  switch((unint64_t)[v4 targetDeviceType])
  {
    case 1uLL:
      if ((MCGestaltIsPhone() & 1) == 0)
      {
        int IsAppleTV = MCGestaltIsiPad();
        goto LABEL_17;
      }

      int64_t v5 = 0LL;
      break;
    case 2uLL:
      id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MCInstaller _preflightProfileForInstallationOnWatch:]( self,  "_preflightProfileForInstallationOnWatch:",  v4));

      if (v6) {
        goto LABEL_13;
      }
      unint64_t v7 = +[MCTargetDeviceResolver watchAvailability](&OBJC_CLASS___MCTargetDeviceResolver, "watchAvailability");
      if (v7 >= 3) {
        int64_t v5 = 3LL;
      }
      else {
        int64_t v5 = qword_1000968E0[v7];
      }
      break;
    case 3uLL:
      if ((MCGestaltIsPhone() & 1) != 0 || (MCGestaltIsiPad() & 1) != 0 || MCGestaltIsHomePod())
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MCInstaller _preflightProfileForInstallationOnHomePod:]( self,  "_preflightProfileForInstallationOnHomePod:",  v4));

        if (v8)
        {
LABEL_13:
          int64_t v5 = 2LL;
        }

        else if (+[MCTargetDeviceResolver isHomePodAvailable]( &OBJC_CLASS___MCTargetDeviceResolver,  "isHomePodAvailable"))
        {
          int64_t v5 = 0LL;
        }

        else
        {
          int64_t v5 = 3LL;
        }
      }

      else
      {
LABEL_19:
        int64_t v5 = 1LL;
      }

      break;
    case 4uLL:
      int IsAppleTV = MCGestaltIsAppleTV();
      goto LABEL_17;
    case 6uLL:
      int IsAppleTV = MCGestaltIsVisionDevice();
LABEL_17:
      int64_t v5 = IsAppleTV ^ 1u;
      break;
    default:
      break;
  }

  return v5;
}

+ (void)isInteractiveProfileInstallationAllowedBySDP:(id)a3 completion:(id)a4
{
}

- (void)_queueProfileData:(id)a3 profile:(id)a4 forDevice:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, void, id, uint64_t))a6;
  if (a5 == 99)
  {
    os_log_t v13 = _MCLogObjects[9];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v14 = v13;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
      *(_DWORD *)buf = 138543362;
      v40 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Profile %{public}@ cancelled queueing for installation",  buf,  0xCu);
    }

    v12[2](v12, 0LL, v11, 99LL);
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
    unsigned int v17 = [v16 effectiveRestrictedBoolForSetting:MCFeatureUIConfigurationProfileInstallationAllowed];

    if (v17 != 2)
    {
      if (a5 == 6
        && (+[DMCFeatureFlags isVisionProfileEnrollEnabled]( &OBJC_CLASS___DMCFeatureFlags,  "isVisionProfileEnrollEnabled") & 1) == 0 && (uint64_t v24 = objc_opt_class(&OBJC_CLASS___MCConfigurationProfile), (objc_opt_isKindOfClass(v11, v24) & 1) != 0)
        && [v11 isMDMProfile])
      {
        os_log_t v25 = _MCLogObjects[9];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          os_log_t v26 = v25;
          v27 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile stringForDeviceType:](&OBJC_CLASS___MCProfile, "stringForDeviceType:", 6LL));
          *(_DWORD *)buf = 138543618;
          v40 = v27;
          __int16 v41 = 2114;
          id v42 = v28;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Profile %{public}@ failed queueing for %{public}@ because profile-driven MDM enrollment is blocked",  buf,  0x16u);
        }

        __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _profileDrivenEnrollmentBlocked](self, "_profileDrivenEnrollmentBlocked"));
        ((void (**)(id, void *, id, uint64_t))v12)[2](v12, v29, v11, 6LL);
      }

      else
      {
        if (![v11 isUserEnrollmentProfile])
        {
          if (a5 == 3)
          {
            -[MCInstaller _continueQueueingProfile:profileData:forDevice:completion:]( self,  "_continueQueueingProfile:profileData:forDevice:completion:",  v11,  v10,  3LL,  v12);
          }

          else
          {
            v34[0] = _NSConcreteStackBlock;
            v34[1] = 3221225472LL;
            v34[2] = sub_10003E018;
            v34[3] = &unk_1000C3888;
            uint64_t v37 = v12;
            v34[4] = self;
            id v35 = v11;
            unint64_t v38 = a5;
            id v36 = v10;
            +[MCInstaller isInteractiveProfileInstallationAllowedBySDP:completion:]( &OBJC_CLASS___MCInstaller,  "isInteractiveProfileInstallationAllowedBySDP:completion:",  v35,  v34);
          }

          goto LABEL_24;
        }

        os_log_t v30 = _MCLogObjects[9];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          os_log_t v31 = v30;
          __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile stringForDeviceType:](&OBJC_CLASS___MCProfile, "stringForDeviceType:", a5));
          *(_DWORD *)buf = 138543618;
          v40 = v32;
          __int16 v41 = 2114;
          id v42 = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Profile %{public}@ failed queueing for %{public}@ because profile-driven user enrollment is not supported",  buf,  0x16u);
        }

        __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( -[MCInstaller _profileDrivenUserEnrollmentNotSupportedError]( self,  "_profileDrivenUserEnrollmentNotSupportedError"));
        ((void (**)(id, void *, id, uint64_t))v12)[2](v12, v29, v11, a5);
      }

      goto LABEL_24;
    }

    id v18 = MCErrorRestrictionCauseProfile;
    os_log_t v19 = _MCLogObjects[9];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      os_log_t v20 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile stringForDeviceType:](&OBJC_CLASS___MCProfile, "stringForDeviceType:", a5));
      *(_DWORD *)buf = 138543618;
      v40 = v21;
      __int16 v41 = 2114;
      id v42 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Profile %{public}@ failed queueing for %{public}@ because UI profile installation is restricted",  buf,  0x16u);
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue( -[MCInstaller _uiProfileInstallationDisabledTopLevelErrorWithCause:]( self,  "_uiProfileInstallationDisabledTopLevelErrorWithCause:",  v18));
    ((void (**)(id, void *, id, uint64_t))v12)[2](v12, v23, v11, a5);
  }

- (void)_continueQueueingProfile:(id)a3 profileData:(id)a4 forDevice:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, void, id, unint64_t))a6;
  os_log_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile stringForDeviceType:](&OBJC_CLASS___MCProfile, "stringForDeviceType:", a5));
  if (+[MCTargetDeviceResolver purgatorySupportedForDevice:]( &OBJC_CLASS___MCTargetDeviceResolver,  "purgatorySupportedForDevice:",  a5))
  {
    *(void *)uint64_t v37 = 0LL;
    *(void *)&v37[8] = v37;
    *(void *)&v37[16] = 0x3032000000LL;
    unint64_t v38 = sub_10003E440;
    v39 = sub_10003E450;
    purgatoryWorkerQueue = (dispatch_queue_s *)self->_purgatoryWorkerQueue;
    id v40 = 0LL;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003E458;
    block[3] = &unk_1000C38B0;
    block[4] = self;
    id v27 = v11;
    id v15 = v10;
    __int128 v29 = v37;
    unint64_t v30 = a5;
    id v28 = v15;
    dispatch_sync(purgatoryWorkerQueue, block);
    uint64_t v16 = *(void *)(*(void *)&v37[8] + 40LL);
    unsigned int v17 = _MCLogObjects[9];
    id v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        os_log_t v19 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
        os_log_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&v37[8] + 40) MCVerboseDescription]);
        *(_DWORD *)buf = 138543874;
        __int128 v32 = v19;
        __int16 v33 = 2114;
        uint64_t v34 = v13;
        __int16 v35 = 2114;
        id v36 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Profile %{public}@ failed queueing for %{public}@ with purgatory error: %{public}@",  buf,  0x20u);
      }

      v12[2](v12, *(void *)(*(void *)&v37[8] + 40LL), v15, a5);
    }

    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
        *(_DWORD *)buf = 138543618;
        __int128 v32 = v24;
        __int16 v33 = 2114;
        uint64_t v34 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Profile %{public}@ succesfully queued in holding tank for %{public}@",  buf,  0x16u);
      }

      os_log_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _installationHaltedTopLevelError](self, "_installationHaltedTopLevelError"));
      ((void (**)(id, void *, id, unint64_t))v12)[2](v12, v25, v15, a5);
    }

    _Block_object_dispose(v37, 8);
  }

  else
  {
    -[NSMutableArray addObject:](self->_queuedProfiles, "addObject:", v11);
    os_log_t v21 = _MCLogObjects[9];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v21;
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
      *(_DWORD *)uint64_t v37 = 138543618;
      *(void *)&v37[4] = v23;
      *(_WORD *)&v37[12] = 2114;
      *(void *)&v37[14] = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Profile %{public}@ successfully queued for Settings jump for %{public}@",  v37,  0x16u);
    }

    v12[2](v12, 0LL, v10, a5);
  }
}

- (id)_malformedPayloadErrorInternal:(BOOL)a3
{
  uint64_t v3 = (uint64_t *)&MCProfileErrorDomain;
  if (!a3) {
    uint64_t v3 = (uint64_t *)&MCInstallationErrorDomain;
  }
  uint64_t v4 = *v3;
  if (a3) {
    uint64_t v5 = 1000LL;
  }
  else {
    uint64_t v5 = 4000LL;
  }
  uint64_t v6 = MCErrorArray(@"MALFORMED_PAYLOAD_ERROR_DESCRIPTION");
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v4,  v5,  v7,  MCErrorTypeFatal,  0LL));

  return v8;
}

- (id)_malformedPayloadErrorWithUnderlyingError:(id)a3
{
  uint64_t v3 = MCInstallationErrorDomain;
  id v4 = a3;
  uint64_t v5 = MCErrorArray(@"MALFORMED_PAYLOAD_ERROR_DESCRIPTION");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v3,  4000LL,  v6,  v4,  MCErrorTypeFatal,  0LL));

  return v7;
}

- (id)_targetDeviceErrorWithUnderlyingError:(id)a3
{
  uint64_t v3 = MCInstallationErrorDomain;
  id v4 = a3;
  uint64_t v5 = MCErrorArray(@"ERROR_PROFILE_TARGET_DESCRIPTION");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v3,  4035LL,  v6,  v4,  MCErrorTypeFatal,  0LL));

  return v7;
}

- (id)_targetDeviceUnavailableError
{
  uint64_t v2 = MCProfileErrorDomain;
  uint64_t v3 = MCErrorArray(@"ERROR_PROFILE_TARGET_UNAVAILABLE");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  1012LL,  v4,  MCErrorTypeFatal,  0LL));

  return v5;
}

- (id)_targetDeviceArchivedError
{
  uint64_t v2 = MCProfileErrorDomain;
  uint64_t v3 = MCErrorArray(@"ERROR_PROFILE_TARGET_ARCHIVED");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  1014LL,  v4,  MCErrorTypeFatal,  0LL));

  return v5;
}

- (id)_targetDevicePreflightFailedError
{
  uint64_t v2 = MCProfileErrorDomain;
  uint64_t v3 = MCErrorArray(@"ERROR_PROFILE_TARGET_PREFLIGHT_FAILED");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  1011LL,  v4,  MCErrorTypeFatal,  0LL));

  return v5;
}

- (id)_targetDeviceMismatchError
{
  uint64_t v2 = MCProfileErrorDomain;
  uint64_t v3 = MCErrorArray(@"ERROR_PROFILE_TARGET_MISMATCH");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  1015LL,  v4,  MCErrorTypeFatal,  0LL));

  return v5;
}

- (id)_uiProfileInstallationDisabledTopLevelErrorWithCause:(id)a3
{
  id v3 = a3;
  uint64_t v4 = MCInstallationErrorDomain;
  uint64_t v5 = MCErrorArray(@"ERROR_PROFILE_UI_INSTALLATION_DISABLED");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = MCErrorTypeFatal;
  if (v3)
  {
    uint64_t v11 = MCErrorRestrictionCauseKey;
    id v12 = v3;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL,  0LL));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:extraUserInfo:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:extraUserInfo:",  v4,  4037LL,  v6,  0LL,  0LL,  0LL,  v7,  v8));
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:extraUserInfo:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:extraUserInfo:",  v4,  4037LL,  v6,  0LL,  0LL,  0LL,  MCErrorTypeFatal,  0LL));
  }

  return v9;
}

- (id)_installationHaltedTopLevelError
{
  uint64_t v2 = MCInstallationErrorDomain;
  uint64_t v3 = MCErrorArray(@"ERROR_PROFILE_UI_INSTALLATION_HALTED");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = MCProfileErrorDomain;
  uint64_t v6 = MCErrorArray(@"ERROR_PROFILE_UI_INSTALLATION_HALTED");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = MCErrorTypeFatal;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v5,  1013LL,  v7,  MCErrorTypeFatal,  0LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v2,  4036LL,  v4,  v9,  v8));

  return v10;
}

- (id)_invalidInputError
{
  uint64_t v2 = MCInstallationErrorDomain;
  uint64_t v3 = MCErrorArray(@"ERROR_USER_INPUT_INVALID");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  4006LL,  v4,  MCErrorTypeFatal,  0LL));

  return v5;
}

- (id)_userCancelledErrorWithFriendlyName:(id)a3
{
  uint64_t v3 = MCInstallationErrorDomain;
  uint64_t v4 = MCErrorArray(@"ERROR_PROFILE_USER_CANCELLED_P_ID");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v3,  4004LL,  v5,  MCErrorTypeFatal,  a3,  0LL));

  return v6;
}

- (id)_profileDrivenEnrollmentBlocked
{
  uint64_t v2 = MCInstallationErrorDomain;
  uint64_t v3 = MCErrorArrayByDevice(@"ERROR_PROFILE_DRIVEN_ENROLLMENT_BLOCKED", a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  4054LL,  v4,  MCErrorTypeFatal));

  return v5;
}

- (id)_profileDrivenUserEnrollmentNotSupportedError
{
  uint64_t v2 = MCInstallationErrorDomain;
  uint64_t v3 = MCErrorArrayByDevice(@"ERROR_PROFILE_DRIVEN_USER_ENROLLMENT_NOT_SUPPORTED", a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  4055LL,  v4,  MCErrorTypeFatal,  0LL));

  return v5;
}

- (BOOL)_promptUserForComplianceWithRestrictions:(id)a3 handler:(id)a4 interactionClient:(id)a5 outPasscode:(id *)a6 outError:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](&OBJC_CLASS___MCPasscodeManagerWriter, "sharedManager"));
    unsigned int v17 = [v16 currentPasscodeCompliesWithPolicyFromRestrictions:v13 outError:0];

    if (v17)
    {
      currentlyInstallingRestrictions = self->_currentlyInstallingRestrictions;
      self->_currentlyInstallingRestrictions = 0LL;

      id v19 = 0LL;
      goto LABEL_48;
    }

    id v79 = 0LL;
    unsigned __int8 v21 = [v15 requestCurrentPasscodeOutPasscode:&v79];
    id v22 = v79;
    if ((v21 & 1) == 0)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue([v14 profile]);
      v62 = (void *)objc_claimAutoreleasedReturnValue([v61 friendlyName]);
      id v19 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _userCancelledErrorWithFriendlyName:](self, "_userCancelledErrorWithFriendlyName:", v62));

LABEL_42:
LABEL_43:

      v65 = self->_currentlyInstallingRestrictions;
      self->_currentlyInstallingRestrictions = 0LL;

      if (v19)
      {
        if (a7) {
          *a7 = v19;
        }
        BOOL v20 = 0;
        if (a6) {
          *a6 = &stru_1000C4568;
        }
        goto LABEL_49;
      }

- (void)_updateCDPWithNewPasscode:(id)a3 passcodeType:(int)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___CDPContext);
  [v6 setType:6];
  if (a4 == -1) {
    uint64_t v7 = 3LL;
  }
  else {
    uint64_t v7 = 2LL;
  }
  id v8 = [[CDPStateController alloc] initWithContext:v6];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10003F400;
  v9[3] = &unk_1000C38D0;
  v9[4] = v7;
  [v8 localSecretChangedTo:v5 secretType:v7 completion:v9];
}

- (BOOL)_promptUserForMAIDSignIn:(id)a3 personaID:(id)a4 handler:(id)a5 interactionClient:(id)a6 outError:(id *)a7
{
  id v11 = a5;
  char v14 = 0;
  unsigned int v12 = [a6 requestMAIDSignIn:a3 personaID:a4 outError:a7 isCancelled:&v14];
  if (a7 && v14) {
    *a7 = (id)objc_claimAutoreleasedReturnValue([v11 userCancelledError]);
  }
  if (a7 && v12 != 1 && !*a7) {
    *a7 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  MCInstallationErrorDomain,  4038LL,  0LL,  MCErrorTypeFatal));
  }

  return v12;
}

- (void)_promptUserForRestoreWithAccountID:(id)a3 personaID:(id)a4 interactionClient:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = _MCLogObjects[9];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requesting managed restore...", v11, 2u);
  }

  [v9 requestManagedRestoreWithManagedAppleID:v7 personaID:v8];
}

- (id)_validateNewMDMProfile:(id)a3 installationOption:(id)a4
{
  uint64_t v5 = kMCInstallProfileOptionInstallationSource;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 objectForKeyedSubscript:v5]);
  id v8 = [v6 payloadsWithClass:objc_opt_class(MCMDMPayload)];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assignedManagedAppleID]);
  if (v11
    && ([v7 isEqualToString:kDMCProfileInstallationSourceAccountDrivenUserEnrollment] & 1) == 0)
  {
    unsigned __int8 v16 = [v7 isEqualToString:kDMCProfileInstallationSourceAccountDrivenDeviceEnrollment];

    if ((v16 & 1) == 0)
    {
      uint64_t v17 = MCInstallationErrorDomain;
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 friendlyName]);
      unsigned __int8 v21 = v12;
      id v18 = @"MDM_ERROR_PROFILE_CONTAINS_ASSIGNED_MAID_KEY";
LABEL_14:
      uint64_t v19 = MCErrorArray(v18);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v19);
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v17,  4022LL,  v13,  MCErrorTypeFatal,  v21,  0LL));
      goto LABEL_15;
    }
  }

  else
  {
  }

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 enrollmentMode]);
  if ([v12 isEqualToString:kMDMEnrollmentModeBYOD]
    && ([v7 isEqualToString:kDMCProfileInstallationSourceAccountDrivenUserEnrollment] & 1) == 0)
  {

LABEL_13:
    uint64_t v17 = MCInstallationErrorDomain;
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 friendlyName]);
    unsigned __int8 v21 = v12;
    id v18 = @"MDM_ERROR_PROFILE_CONTAINS_INVALID_ENROLLMENT_MODE_KEY";
    goto LABEL_14;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 enrollmentMode]);
  if (![v13 isEqualToString:kMDMEnrollmentModeADDE])
  {
    id v15 = 0LL;
LABEL_15:

    goto LABEL_16;
  }

  unsigned __int8 v14 = [v7 isEqualToString:kDMCProfileInstallationSourceAccountDrivenDeviceEnrollment];

  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
  id v15 = 0LL;
LABEL_16:

  return v15;
}

- (id)_validateMDMReplacementNewProfile:(id)a3 oldProfile:(id)a4 client:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [v7 payloadsWithClass:objc_opt_class(MCMDMPayload)];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
  id v12 = [v8 payloadsWithClass:objc_opt_class(MCMDMPayload)];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
  id v15 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v14 managedAppleIDName]);
  if (!v16) {
    goto LABEL_3;
  }
  uint64_t v17 = (void *)v16;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v11 managedAppleIDName]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v5 lowercaseString]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v14 managedAppleIDName]);
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v19 lowercaseString]);
  unsigned __int8 v21 = [v18 isEqualToString:v20];

  if ((v21 & 1) == 0)
  {
    os_log_t v23 = _MCLogObjects[9];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = v23;
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v11 managedAppleIDName]);
      os_log_t v25 = (void *)objc_claimAutoreleasedReturnValue([v14 managedAppleIDName]);
      *(_DWORD *)buf = 138543618;
      *(void *)v87 = v5;
      *(_WORD *)&v87[8] = 2114;
      v88 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "appleID doesn't match! Old managedAppleIDName:%{public}@, new managedAppleIDName: %{public}@",  buf,  0x16u);
    }

    -[NSMutableArray addObject:](v15, "addObject:", kMDMManagedAppleIDKey);
    char v22 = 1;
  }

  else
  {
LABEL_3:
    char v22 = 0;
  }

  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v11 enrollmentMode]);
  if (!v26)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v14 enrollmentMode]);
    if (!v5) {
      goto LABEL_11;
    }
  }

  unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v11 enrollmentMode]);
  unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v14 enrollmentMode]);
  unsigned __int8 v29 = [v27 isEqualToString:v28];

  if (v26)
  {

    if ((v29 & 1) != 0)
    {
LABEL_11:
      char v85 = 0;
      goto LABEL_16;
    }
  }

  else
  {

    if ((v29 & 1) != 0) {
      goto LABEL_11;
    }
  }

  os_log_t v30 = _MCLogObjects[9];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    signed int v31 = v30;
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v11 enrollmentMode]);
    signed int v33 = (void *)objc_claimAutoreleasedReturnValue([v14 enrollmentMode]);
    *(_DWORD *)buf = 138543618;
    *(void *)v87 = v32;
    *(_WORD *)&v87[8] = 2114;
    v88 = v33;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "enrollmentMode doesn't match! Old enrollmentMode:%{public}@, new enrollmentMode: %{public}@",  buf,  0x16u);
  }

  -[NSMutableArray addObject:](v15, "addObject:", kMDMEnrollmentModeKey);
  char v85 = 1;
LABEL_16:
  uint64_t v34 = objc_claimAutoreleasedReturnValue([v14 requiredAppIDForMDM]);
  if (v34)
  {
    unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue([v11 requiredAppIDForMDM]);
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v14 requiredAppIDForMDM]);
    unsigned __int8 v37 = [v35 isEqualToNumber:v36];

    if ((v37 & 1) != 0)
    {
      LOBYTE(v34) = 0;
    }

    else
    {
      os_log_t v38 = _MCLogObjects[9];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        uint64_t v39 = v38;
        id v40 = (void *)objc_claimAutoreleasedReturnValue([v11 requiredAppIDForMDM]);
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v14 requiredAppIDForMDM]);
        *(_DWORD *)buf = 138543618;
        *(void *)v87 = v40;
        *(_WORD *)&v87[8] = 2114;
        v88 = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "requiredAppIDForMDM doesn't match! Old requiredAppIDForMDM:%{public}@, new requiredAppIDForMDM: %{public}@",  buf,  0x16u);
      }

      -[NSMutableArray addObject:](v15, "addObject:", kMDMRequiredAppIDForMDMKey);
      LOBYTE(v34) = 1;
    }
  }

  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v11 topic]);
  v43 = (void *)objc_claimAutoreleasedReturnValue([v14 topic]);
  unsigned __int8 v44 = [v42 isEqualToString:v43];

  unsigned __int8 v84 = v44;
  if ((v44 & 1) == 0)
  {
    os_log_t v45 = _MCLogObjects[9];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      id v46 = v45;
      id v47 = (void *)objc_claimAutoreleasedReturnValue([v11 topic]);
      v48 = (void *)objc_claimAutoreleasedReturnValue([v14 topic]);
      *(_DWORD *)buf = 138543618;
      *(void *)v87 = v47;
      *(_WORD *)&v87[8] = 2114;
      v88 = v48;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "topic doesn't match! Old topic:%{public}@, new topic: %{public}@",  buf,  0x16u);
    }

    -[NSMutableArray addObject:](v15, "addObject:", kMDMTopicKey);
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue([v11 serverURLString]);
  uint64_t v50 = objc_claimAutoreleasedReturnValue([v14 serverURLString]);
  unsigned __int8 v51 = [v49 isEqualToString:v50];

  if ((v51 & 1) == 0)
  {
    os_log_t v52 = _MCLogObjects[9];
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      uint64_t v53 = v52;
      uint64_t v50 = objc_claimAutoreleasedReturnValue([v11 serverURLString]);
      unsigned int v54 = (void *)objc_claimAutoreleasedReturnValue([v14 serverURLString]);
      *(_DWORD *)buf = 138543618;
      *(void *)v87 = v50;
      *(_WORD *)&v87[8] = 2114;
      v88 = v54;
      _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "serverURLString doesn't match! Old serverURLString:%{public}@, new serverURLString: %{public}@",  buf,  0x16u);
    }

    -[NSMutableArray addObject:](v15, "addObject:", kMDMServerURLKey);
  }

  id v55 = (void *)objc_claimAutoreleasedReturnValue([v11 checkInURLString]);
  if (v55 || (uint64_t v50 = objc_claimAutoreleasedReturnValue([v14 checkInURLString])) != 0)
  {
    unsigned __int8 v83 = v51;
    char v56 = v34;
    v57 = v15;
    char v58 = v22;
    v59 = (void *)objc_claimAutoreleasedReturnValue([v11 checkInURLString]);
    v60 = (void *)objc_claimAutoreleasedReturnValue([v14 checkInURLString]);
    unsigned __int8 v61 = [v59 isEqualToString:v60];

    if (v55) {
    else
    }

    char v22 = v58;
    if ((v61 & 1) != 0)
    {
      LOBYTE(v50) = 0;
      id v15 = v57;
    }

    else
    {
      os_log_t v62 = _MCLogObjects[9];
      id v15 = v57;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        v63 = v62;
        id v64 = (void *)objc_claimAutoreleasedReturnValue([v11 checkInURLString]);
        v65 = (void *)objc_claimAutoreleasedReturnValue([v14 checkInURLString]);
        *(_DWORD *)buf = 138543618;
        *(void *)v87 = v64;
        *(_WORD *)&v87[8] = 2114;
        v88 = v65;
        _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_ERROR,  "checkInURLString doesn't match! Old checkInURLString:%{public}@, new checkInURLString: %{public}@",  buf,  0x16u);
      }

      -[NSMutableArray addObject:](v57, "addObject:", kMDMCheckInURLKey);
      LOBYTE(v50) = 1;
    }

    LOBYTE(v34) = v56;
    unsigned __int8 v51 = v83;
  }

  unsigned int v66 = [v11 supportUserChannel];
  unsigned int v67 = v66 ^ [v14 supportUserChannel];
  if (v67 == 1)
  {
    os_log_t v68 = _MCLogObjects[9];
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      v69 = v68;
      unsigned int v70 = [v11 supportUserChannel];
      unsigned int v71 = [v14 supportUserChannel];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v87 = v70;
      *(_WORD *)&v87[4] = 1024;
      *(_DWORD *)&v87[6] = v71;
      _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_ERROR,  "supportUserChannel doesn't match! Old supportUserChannel:%d, new supportUserChannel: %d",  buf,  0xEu);
    }

    -[NSMutableArray addObject:](v15, "addObject:", kMDMUserChannelCapability);
  }

  if ((v67 | (v85 | v22)) & 1 | v34 & 1 | v50 & 1 | ((v51 & 1) == 0) | ((v84 & 1) == 0))
  {
    id v72 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v15, "componentsJoinedByString:", @", "));
    uint64_t v73 = MCMDMErrorDomain;
    uint64_t v74 = MCErrorArray(@"MDM_ERROR_REPLACEMENT_MISMATCH");
    id v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
    id v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v73,  12012LL,  v75,  MCErrorTypeFatal,  v72,  0LL));
  }

  else
  {
    if (a5
      || (unint64_t v77 = (unint64_t)[v11 accessRights],
          id v78 = (id)((unint64_t)[v14 accessRights] | v77),
          v78 == [v11 accessRights]))
    {
      id v76 = 0LL;
      goto LABEL_51;
    }

    uint64_t v80 = MCMDMErrorDomain;
    uint64_t v81 = MCErrorArray(@"MDM_ERROR_REPLACEMENT_TOO_MUCH_RIGHTS");
    id v72 = (void *)objc_claimAutoreleasedReturnValue(v81);
    id v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v80,  12012LL,  v72,  MCErrorTypeFatal,  0LL));
  }

LABEL_51:
  return v76;
}

- (id)_guardAgainstNoMDMPayloadWithNewProfile:(id)a3 oldProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___MCConfigurationProfile);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0) {
    unsigned int v8 = [v5 isMDMProfile];
  }
  else {
    unsigned int v8 = 0;
  }
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___MCConfigurationProfile);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0 && ((v8 | [v6 isMDMProfile] ^ 1) & 1) == 0)
  {
    uint64_t v11 = MCInstallationErrorDomain;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 friendlyName]);
    uint64_t v13 = MCErrorArray(@"ERROR_PROFILE_MDM_REPLACEMENT_P_OLD_ID");
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v11,  4015LL,  v14,  MCErrorTypeFatal,  v12,  0LL));
    id v10 = [v15 MCCopyAsPrimaryError];
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (id)_deviceLockedError
{
  uint64_t v2 = MCInstallationErrorDomain;
  uint64_t v3 = MCErrorArray(@"ERROR_DEVICE_LOCKED");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  4009LL,  v4,  MCErrorTypeFatal,  0LL));

  return v5;
}

+ (id)deviceNotSupervisedError
{
  uint64_t v2 = MCChaperoneErrorDomain;
  uint64_t v3 = MCErrorArray(@"CHAPERONE_DEVICE_NOT_CHAPERONED");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  29000LL,  v4,  MCErrorTypeFatal,  0LL));
  id v6 = [v5 MCCopyAsPrimaryError];

  return v6;
}

+ (id)deviceIsSupervisedError
{
  uint64_t v2 = MCChaperoneErrorDomain;
  uint64_t v3 = MCErrorArray(@"CHAPERONE_DEVICE_IS_CHAPERONED");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  29004LL,  v4,  MCErrorTypeFatal,  0LL));
  id v6 = [v5 MCCopyAsPrimaryError];

  return v6;
}

+ (id)notInstalledByMDMError
{
  uint64_t v2 = MCInstallationErrorDomain;
  uint64_t v3 = MCErrorArray(@"ERROR_PROFILE_MDM_ONLY");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  4021LL,  v4,  MCErrorTypeFatal,  0LL));

  return v5;
}

+ (id)notSupportedUnderMultiUserModeError
{
  uint64_t v2 = MCInstallationErrorDomain;
  uint64_t v3 = MCErrorArray(@"ERROR_NOT_SUPPORTED_UNDER_MULTIUSER_MODE");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  4047LL,  v4,  MCErrorTypeFatal,  0LL));

  return v5;
}

- (id)_installProfileHandler:(id)a3 options:(id)a4 interactionClient:(id)a5 source:(id)a6 outError:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v261 = a5;
  id v13 = a6;
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  -[MCInstaller setSetAsideAccountIdentifiersByPayloadClass:](self, "setSetAsideAccountIdentifiersByPayloadClass:", v16);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  -[MCInstaller setSetAsideDictionariesByPayloadClass:](self, "setSetAsideDictionariesByPayloadClass:", v17);

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
  v263 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);

  v259 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:kMCInstallProfileOptionManagingProfileIdentifier]);
  v258 = (void *)objc_claimAutoreleasedReturnValue( [v12 objectForKeyedSubscript:kMCInstallProfileOptionAdditionalManagedProfileIdentifiers]);
  uint64_t v19 = kMCInstallProfileOptionIsInstalledByMDM;
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM]);
  unsigned __int8 v21 = [v20 BOOLValue];

  char v22 = (void *)objc_claimAutoreleasedReturnValue( [v12 objectForKeyedSubscript:kMCInstallProfileOptionsIsInstalledByDeclarativeManagement]);
  unsigned int v23 = [v22 BOOLValue];

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:kMCInstallProfileOptionFilterFlag]);
  unsigned int v253 = [v24 intValue];

  v262 = v14;
  os_log_t v25 = (void *)objc_claimAutoreleasedReturnValue([v14 currentRestrictions]);
  id v260 = [v25 MCDeepCopy];

  char v289 = 0;
  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:kMCInstallProfileOptionInstallationType]);
  unsigned int v256 = [v26 intValue];

  unsigned int v27 = _MCLogObjects[9];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Beginning profile installation...", buf, 2u);
  }

  unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:kMCInstallProfileOptionAssumeOwnership]);
  unsigned int v29 = [v28 BOOLValue];

  if (!v29)
  {
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v262 systemProfileRestrictions]);
    id v251 = [v36 MCMutableDeepCopy];

    unsigned __int8 v37 = (void *)objc_claimAutoreleasedReturnValue([v262 userProfileRestrictions]);
    id v38 = [v37 MCMutableDeepCopy];

    uint64_t v39 = _MCLogObjects[5];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v291 = v263;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Beginning profile installation for %{public}@",  buf,  0xCu);
    }

    char obj = v21;

    id v40 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
    v250 = (void *)objc_claimAutoreleasedReturnValue([v40 installedMDMProfile]);

    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
    uint64_t v42 = objc_opt_class(&OBJC_CLASS___MCConfigurationProfile);
    id v245 = v13;
    v255 = v15;
    if ((objc_opt_isKindOfClass(v41, v42) & 1) != 0)
    {
      v43 = v38;
      unsigned __int8 v44 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
      unsigned int v45 = [v44 isMDMProfile];

      if (v45)
      {
        BOOL v241 = v250 != 0LL;
        id v46 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
        if (v250)
        {
          id v47 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
          v48 = (void *)objc_claimAutoreleasedReturnValue([v47 installedMDMProfile]);
          id v35 = (id)objc_claimAutoreleasedReturnValue( -[MCInstaller _validateMDMReplacementNewProfile:oldProfile:client:]( self,  "_validateMDMReplacementNewProfile:oldProfile:client:",  v46,  v48,  v261));
        }

        else
        {
          id v35 = (id)objc_claimAutoreleasedReturnValue( -[MCInstaller _validateNewMDMProfile:installationOption:]( self,  "_validateNewMDMProfile:installationOption:",  v46,  v12));
        }

        id v15 = v255;

        id v75 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v19]);
        unsigned __int8 v76 = [v75 BOOLValue];

        if ((v76 & 1) == 0) {
          -[MCInstaller _checkinWithMdmd](self, "_checkinWithMdmd");
        }
        id v38 = v43;
        if (v35)
        {

          id v32 = 0LL;
          id obja = 0LL;
          v243 = 0LL;
LABEL_89:
          id v107 = (id)objc_claimAutoreleasedReturnValue( +[MCInstaller _installationFailureErrorWithUnderlyingError:]( &OBJC_CLASS___MCInstaller,  "_installationFailureErrorWithUnderlyingError:",  v35));
          v108 = _MCLogObjects[5];
          if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
          {
            id v109 = (id)objc_claimAutoreleasedReturnValue([v107 MCVerboseDescription]);
            *(_DWORD *)buf = 138543618;
            v291 = v263;
            __int16 v292 = 2114;
            id v293 = v109;
            _os_log_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_ERROR,  "Profile “%{public}@” failed to install with error: %{public}@",  buf,  0x16u);
          }

          if (a7)
          {
            id v107 = v107;
            int v110 = 0;
            *a7 = v107;
          }

          else
          {
            int v110 = 0;
          }

- (BOOL)deviceSupervisionRequiredForPayload:(id)a3
{
  id v3 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MCPayload supervisedRequiredPayloads](&OBJC_CLASS___MCPayload, "supervisedRequiredPayloads"));
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        if ((objc_opt_isKindOfClass(v3, *(void *)(*((void *)&v14 + 1) + 8LL * (void)i)) & 1) != 0)
        {

          goto LABEL_13;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___MCVPNPayload);
  if ((objc_opt_isKindOfClass(v3, v9) & 1) != 0
    && (id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "vpnType", (void)v14)),
        unsigned __int8 v11 = [v10 isEqualToString:kMCVPNPayloadBaseVPNTypeAlwaysOn],
        v10,
        (v11 & 1) != 0))
  {
LABEL_13:
    BOOL v12 = 1;
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)addSetAsideAccountIdentifier:(id)a3 forPayloadClass:(Class)a4
{
  id v11 = a3;
  id v6 = NSStringFromClass(a4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( -[MCInstaller setAsideAccountIdentifiersByPayloadClass]( self,  "setAsideAccountIdentifiersByPayloadClass"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);

  if (!v9)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[MCInstaller setAsideAccountIdentifiersByPayloadClass]( self,  "setAsideAccountIdentifiersByPayloadClass"));
    [v10 setObject:v9 forKeyedSubscript:v7];
  }

  [v9 addObject:v11];
}

- (id)setAsideAccountIdentifiersForPayloadClass:(Class)a3
{
  id v4 = NSStringFromClass(a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MCInstaller setAsideAccountIdentifiersByPayloadClass]( self,  "setAsideAccountIdentifiersByPayloadClass"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v5]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);

  return v8;
}

- (void)addSetAsideDictionary:(id)a3 forPayloadHandlerClass:(Class)a4
{
  id v9 = a3;
  id v6 = NSStringFromClass(a4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_setAsideDictionariesByPayloadClass,  "objectForKeyedSubscript:",  v7));
  if (!v8)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_setAsideDictionariesByPayloadClass,  "setObject:forKeyedSubscript:",  v8,  v7);
  }

  [v8 addObject:v9];
}

- (id)setAsideDictionariesForPayloadHandlerClass:(Class)a3
{
  id v4 = NSStringFromClass(a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_setAsideDictionariesByPayloadClass,  "objectForKeyedSubscript:",  v5));

  return v6;
}

- (BOOL)_showWarningsForProfile:(id)a3 interactionClient:(id)a4 outError:(id *)a5
{
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a3 installationWarnings]);
  LOBYTE(a5) = -[MCInstaller _showWarnings:interactionClient:outError:]( self,  "_showWarnings:interactionClient:outError:",  v9,  v8,  a5);

  return (char)a5;
}

- (BOOL)_showWarningsForUpdatingProfile:(id)a3 originalProfile:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([a4 installationWarnings]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 installationWarnings]);

  id v14 = [v13 mutableCopy];
  [v14 removeObjectsInArray:v12];
  LOBYTE(a6) = -[MCInstaller _showWarnings:interactionClient:outError:]( self,  "_showWarnings:interactionClient:outError:",  v14,  v10,  a6);

  return (char)a6;
}

- (BOOL)_showWarnings:(id)a3 interactionClient:(id)a4 outError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v8) {
    goto LABEL_5;
  }
  char v13 = 0;
  unsigned int v10 = [v8 showUserWarnings:v7 outResult:&v13];
  if (v13 && v10)
  {
    id v8 = 0LL;
LABEL_5:
    BOOL v11 = 1;
    goto LABEL_6;
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileHandler userCancelledError](&OBJC_CLASS___MCProfileHandler, "userCancelledError"));
  BOOL v11 = v8 == 0LL;
  if (a5 && v8)
  {
    id v8 = v8;
    BOOL v11 = 0;
    *a5 = v8;
  }

- (id)existingProfileContainingPayloadClass:(Class)a3 excludingProfileIdentifier:(id)a4
{
  return -[MCInstaller existingProfileContainingPayloadClass:inProfilesWithFilterFlags:excludingProfileIdentifier:]( self,  "existingProfileContainingPayloadClass:inProfilesWithFilterFlags:excludingProfileIdentifier:",  a3,  3LL,  a4);
}

- (id)existingProfileContainingPayloadClass:(Class)a3 inProfilesWithFilterFlags:(int)a4 excludingProfileIdentifier:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifiersOfProfilesWithFilterFlags:v5]);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v7, "isEqualToString:", v15, (void)v18) & 1) == 0)
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[MCManifest installedProfileWithIdentifier:]( &OBJC_CLASS___MCManifest,  "installedProfileWithIdentifier:",  v15));
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v12);
  }

  __int128 v16 = 0LL;
LABEL_12:

  return v16;
}

- (id)installProfileData:(id)a3 options:(id)a4 interactionClient:(id)a5 source:(id)a6 outError:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v201 = a6;
  uint64_t v13 = kMCInstallProfileOptionFilterFlag;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kMCInstallProfileOptionFilterFlag]);
  unsigned int v15 = [v14 intValue];

  if (v15 <= 1) {
    int v16 = 1;
  }
  else {
    int v16 = v15;
  }
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kMCInstallProfileOptionInstallationType]);
  unsigned int v18 = [v17 intValue];

  if (v18 == 2) {
    int v19 = 8;
  }
  else {
    int v19 = 16;
  }
  uint64_t v20 = v19 | v16;
  if (v11) {
    id v21 = [v11 mutableCopy];
  }
  else {
    id v21 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  char v22 = v21;
  unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v20));
  [v22 setObject:v23 forKeyedSubscript:v13];

  if (v12) {
    uint64_t v24 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v24 = &__kCFBooleanFalse;
  }
  [v22 setObject:v24 forKeyedSubscript:kMCInstallProfileOptionIsInstalledInteractively];
  id v25 = +[MCProfile newProfileSignatureVersion](&OBJC_CLASS___MCProfile, "newProfileSignatureVersion");
  [v22 setObject:v25 forKeyedSubscript:kMCInstallProfileOptionSignatureVersion];

  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  [v26 commitChanges];
  id v217 = 0LL;
  unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfile profileWithData:options:outError:]( &OBJC_CLASS___MCProfile,  "profileWithData:options:outError:",  v10,  v22,  &v217));
  id v28 = v217;
  if (v28)
  {
    id v29 = v28;
    id v30 = 0LL;
    goto LABEL_91;
  }

  v194 = v12;
  id v216 = 0LL;
  unsigned int v31 = [v27 mayInstallWithOptions:v22 hasInteractionClient:v12 != 0 outError:&v216];
  id v29 = v216;
  if (!v31)
  {
    id v30 = 0LL;
    id v12 = v194;
    goto LABEL_91;
  }

  v193 = v27;
  id v192 = [v27 createHandler];
  if (!v192)
  {
    id v30 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _malformedPayloadErrorInternal:](self, "_malformedPayloadErrorInternal:", 0LL));
    id v35 = 0LL;
    uint64_t v34 = 0LL;
    id v12 = v194;
    goto LABEL_89;
  }

  id v32 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](&OBJC_CLASS___MCPasscodeManagerWriter, "sharedManager"));
  unsigned int v33 = [v32 isDeviceLocked];

  id v12 = v194;
  if (v33)
  {
    id v30 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _deviceLockedError](self, "_deviceLockedError"));
    uint64_t v34 = 0LL;
    goto LABEL_88;
  }

  if ([v193 targetDeviceType])
  {
    if ([v193 targetDeviceType])
    {
      id v36 = [v193 targetDeviceType];
      if (v36 != +[MCProfile thisDeviceType](&OBJC_CLASS___MCProfile, "thisDeviceType"))
      {
        uint64_t v45 = objc_claimAutoreleasedReturnValue(-[MCInstaller _targetDeviceMismatchError](self, "_targetDeviceMismatchError"));
        id v30 = (id)objc_claimAutoreleasedReturnValue( -[MCInstaller _targetDeviceErrorWithUnderlyingError:]( self,  "_targetDeviceErrorWithUnderlyingError:",  v45));

        uint64_t v34 = 0LL;
        id v29 = (id)v45;
        goto LABEL_88;
      }
    }
  }

  if ([v193 isStub])
  {
    uint64_t v37 = MCProfileErrorDomain;
    uint64_t v38 = objc_claimAutoreleasedReturnValue([v193 friendlyName]);
    uint64_t v39 = MCErrorArray(@"ERROR_PROFILE_MALFORMED_P_ID");
    id v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v37,  1000LL,  v40,  0LL,  MCErrorTypeFatal,  v38,  0LL));
    id v30 = [v41 MCCopyAsPrimaryError];

    uint64_t v34 = 0LL;
    id v29 = (id)v38;
    goto LABEL_88;
  }

  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[MDMCloudConfiguration sharedConfiguration]( &OBJC_CLASS___MDMCloudConfiguration,  "sharedConfiguration"));
  unsigned int v43 = [v42 userMode];

  if (v43 != 1)
  {
    id v30 = v29;
    unsigned int v27 = v193;
    goto LABEL_54;
  }

  id v190 = (id)objc_claimAutoreleasedReturnValue( +[MCPayload unavailablePayloadsInEphemeralMultiUser]( &OBJC_CLASS___MCPayload,  "unavailablePayloadsInEphemeralMultiUser"));
  if (v18 == 2) {
    uint64_t v44 = objc_claimAutoreleasedReturnValue( +[MCPayload unavailableUserPayloadsInEphemeralMultiUser]( &OBJC_CLASS___MCPayload,  "unavailableUserPayloadsInEphemeralMultiUser"));
  }
  else {
    uint64_t v44 = objc_claimAutoreleasedReturnValue( +[MCPayload unavailableSystemPayloadsInEphemeralMultiUser]( &OBJC_CLASS___MCPayload,  "unavailableSystemPayloadsInEphemeralMultiUser"));
  }
  v188 = (void *)v44;
  unsigned int v27 = v193;
  __int128 v214 = 0u;
  __int128 v215 = 0u;
  __int128 v213 = 0u;
  __int128 v212 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v193 payloads]);
  id v46 = [obj countByEnumeratingWithState:&v212 objects:v221 count:16];
  if (!v46) {
    goto LABEL_52;
  }
  id v47 = v46;
  id v185 = v10;
  uint64_t v48 = *(void *)v213;
  while (2)
  {
    for (i = 0LL; i != v47; i = (char *)i + 1)
    {
      if (*(void *)v213 != v48) {
        objc_enumerationMutation(obj);
      }
      uint64_t v50 = *(void **)(*((void *)&v212 + 1) + 8LL * (void)i);
      if ([v190 containsObject:objc_opt_class(v50)])
      {
        uint64_t v51 = MCInstallationErrorDomain;
        os_log_t v52 = (void *)objc_claimAutoreleasedReturnValue([v50 type]);
        unsigned int v181 = v52;
        uint64_t v53 = MCErrorArray(@"ERROR_UNACCEPTABLE_PAYLOAD_IN_MULTI_USER_P_TYPE");
        unsigned int v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
        uint64_t v55 = MCErrorTypeFatal;
        uint64_t v56 = v51;
        uint64_t v57 = 4029LL;
LABEL_50:
        uint64_t v61 = objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v56,  v57,  v54,  v55,  v181,  0LL));

        id v29 = (id)v61;
        goto LABEL_51;
      }

      if ([v188 containsObject:objc_opt_class(v50)])
      {
        if (v18 == 2) {
          uint64_t v58 = 4032LL;
        }
        else {
          uint64_t v58 = 4031LL;
        }
        if (v18 == 2) {
          uint64_t v59 = @"ERROR_UNACCEPTABLE_USER_PAYLOAD_IN_MULTI_USER_P_TYPE";
        }
        else {
          uint64_t v59 = @"ERROR_UNACCEPTABLE_SYSTEM_PAYLOAD_IN_MULTI_USER_P_TYPE";
        }
        uint64_t v184 = MCInstallationErrorDomain;
        os_log_t v52 = (void *)objc_claimAutoreleasedReturnValue([v50 type]);
        unsigned int v181 = v52;
        uint64_t v60 = MCErrorArray(v59);
        unsigned int v54 = (void *)objc_claimAutoreleasedReturnValue(v60);
        uint64_t v55 = MCErrorTypeFatal;
        uint64_t v56 = v184;
        uint64_t v57 = v58;
        goto LABEL_50;
      }
    }

    id v47 = [obj countByEnumeratingWithState:&v212 objects:v221 count:16];
    if (v47) {
      continue;
    }
    break;
  }

- (id)_assumeOwnershipProfileHandler:(id)a3 options:(id)a4 source:(id)a5 outError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v64 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 profile]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kMCInstallProfileOptionInstallationType]);
  LODWORD(a5) = [v14 intValue];

  v63 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  int v62 = (int)a5;
  if ((_DWORD)a5 == 2) {
    uint64_t v15 = 2LL;
  }
  else {
    uint64_t v15 = 1LL;
  }
  int v16 = (void *)objc_claimAutoreleasedReturnValue( -[MCInstaller _installedProfileWithIdentifier:installationType:]( self,  "_installedProfileWithIdentifier:installationType:",  v13,  v15));
  uint64_t v17 = kMCInstallProfileOptionsIsInstalledByDeclarativeManagement;
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( [v11 objectForKeyedSubscript:kMCInstallProfileOptionsIsInstalledByDeclarativeManagement]);
  unsigned __int8 v19 = [v18 BOOLValue];

  if ((v19 & 1) == 0)
  {
    uint64_t v20 = MCInstallationErrorDomain;
    uint64_t v21 = MCErrorArray(@"ERROR_PROFILE_ASSUME_OWNERSHIP_NOT_ALLOWED");
    char v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v20,  4048LL,  v22,  MCErrorTypeFatal,  0LL));
    id v24 = [v23 MCCopyAsPrimaryError];

    if (v24) {
      goto LABEL_19;
    }
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue([v10 profile]);
  uint64_t v26 = objc_opt_class(&OBJC_CLASS___MCConfigurationProfile);
  if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0)
  {
    unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v10 profile]);
    unsigned int v28 = [v27 isMDMProfile];

    if (v28)
    {
      uint64_t v29 = MCInstallationErrorDomain;
      uint64_t v30 = MCErrorArray(@"ERROR_PROFILE_ASSUME_OWNERSHIP_NOT_MDM_PROFILE");
      unsigned int v31 = a6;
      id v32 = (void *)objc_claimAutoreleasedReturnValue(v30);
      unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v29,  4049LL,  v32,  MCErrorTypeFatal,  0LL));
      id v24 = [v33 MCCopyAsPrimaryError];

      a6 = v31;
      if (v24) {
        goto LABEL_19;
      }
    }
  }

  else
  {
  }

  if (v16) {
    goto LABEL_12;
  }
  uint64_t v47 = MCInstallationErrorDomain;
  uint64_t v48 = MCErrorArray(@"ERROR_PROFILE_ASSUME_OWNERSHIP_MISSING_P_ID");
  int v49 = a6;
  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(v48);
  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v47,  4050LL,  v50,  MCErrorTypeFatal,  v13,  0LL));
  id v24 = [v51 MCCopyAsPrimaryError];

  a6 = v49;
  if (!v24)
  {
LABEL_12:
    if ([v16 isManagedByMDM])
    {
      id v24 = 0LL;
    }

    else
    {
      uint64_t v34 = MCInstallationErrorDomain;
      uint64_t v35 = MCErrorArray(@"ERROR_PROFILE_ASSUME_OWNERSHIP_NOT_MANAGED_P_ID");
      id v36 = a6;
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v35);
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v34,  4051LL,  v37,  MCErrorTypeFatal,  v13,  0LL));
      id v24 = [v38 MCCopyAsPrimaryError];

      a6 = v36;
      if (v24) {
        goto LABEL_19;
      }
    }

    if (v16)
    {
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v16 installOptions]);
      id v40 = [v39 mutableCopy];

      uint64_t v41 = kMCInstallProfileOptionManagingProfileIdentifier;
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKeyedSubscript:kMCInstallProfileOptionManagingProfileIdentifier]);
      [v40 setObject:0 forKeyedSubscript:v41];
      uint64_t v43 = kMCInstallProfileOptionInstalledBy;
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kMCInstallProfileOptionInstalledBy]);
      [v40 setObject:v44 forKeyedSubscript:v43];

      [v40 setObject:&__kCFBooleanTrue forKeyedSubscript:v17];
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"RemoteManagement.UserInfo"]);
      [v40 setObject:v45 forKeyedSubscript:@"RemoteManagement.UserInfo"];

      [v16 setInstallOptions:v40];
      if (v62 == 2) {
        id v46 = sub_10003CEFC();
      }
      else {
        id v46 = sub_10003CF38();
      }
      uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(v46);
      uint64_t v55 = v63;
      uint64_t v57 = v64;
      [v16 writeStubToDirectory:v58];

      uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
      [v63 removeDependent:v59 fromParent:v42 inDomain:kMCDMManagingProfileToManagedProfileKey reciprocalDomain:kMCDMManagedProfileToManagingProfileKey fromSystem:1 user:1];

      [v63 commitChanges];
      uint64_t v60 = objc_opt_new(&OBJC_CLASS___MCProfileEventsManager);
      -[MCProfileEventsManager addEventForProfile:operation:source:]( v60,  "addEventForProfile:operation:source:",  v16,  @"assume-ownership",  v64);

      id v56 = v13;
      id v24 = 0LL;
      goto LABEL_27;
    }
  }

- (BOOL)_allowsPasswordPoliciesFromProfile:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  if ((+[MCRestrictionManager mayChangePasscode](&OBJC_CLASS___MCRestrictionManager, "mayChangePasscode") & 1) != 0)
  {
    BOOL v6 = 1;
  }

  else
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v7 = [v5 payloadsOfKindOfClass:objc_opt_class(MCPasswordPolicyPayload)];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      id v24 = a4;
      id v25 = v5;
      id v11 = 0LL;
      uint64_t v12 = *(void *)v28;
LABEL_5:
      uint64_t v13 = 0LL;
      id v14 = v11;
      while (1)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v13);
        int v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](&OBJC_CLASS___MCPasscodeManagerWriter, "sharedManager"));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 restrictions]);
        id v26 = v14;
        unsigned __int8 v18 = [v16 currentPasscodeCompliesWithPolicyFromRestrictions:v17 outError:&v26];
        id v11 = v26;

        if ((v18 & 1) == 0) {
          break;
        }
        uint64_t v13 = (char *)v13 + 1;
        id v14 = v11;
        if (v10 == v13)
        {
          id v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v10) {
            goto LABEL_5;
          }
          BOOL v6 = 1;
          goto LABEL_15;
        }
      }

      BOOL v6 = (char)v24;
      if (v24)
      {
        uint64_t v19 = MCInstallationErrorDomain;
        id v5 = v25;
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v25 friendlyName]);
        uint64_t v21 = MCErrorArray(@"ERROR_PROFILE_REQUIRES_PASSCODE_CHANGE");
        char v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        *id v24 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v19,  4026LL,  v22,  v11,  MCErrorTypeFatal,  v20,  0LL));

        BOOL v6 = 0;
        goto LABEL_16;
      }

- (BOOL)_overrideProfileValidation
{
  BOOL result = 0;
  if (os_variant_has_internal_ui("com.apple.ManagedConfiguration.OverrideProfileValidation", a2))
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue( kMCInternalOverrideProfileValidationKey,  kCFPreferencesAnyApplication,  &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat && AppBooleanValue != 0) {
      return 1;
    }
  }

  return result;
}

- (id)_errorUnacceptablePayload:(id)a3
{
  uint64_t v3 = MCInstallationErrorDomain;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 type]);
  uint64_t v5 = MCErrorArray(@"ERROR_UNNACEPTABLE_PAYLOAD_P_TYPE");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v3,  4022LL,  v6,  MCErrorTypeFatal,  v4,  0LL));

  return v7;
}

- (id)_preflightProfileForInstallationOnHomePod:(id)a3
{
  id v4 = a3;
  if (-[MCInstaller _overrideProfileValidation](self, "_overrideProfileValidation"))
  {
    uint64_t v5 = _MCLogObjects[9];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Overriding profile validation for HomePod",  buf,  2u);
    }

    BOOL v6 = 0LL;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MCPayload remoteQueueableHomePodPayloadClasses]( &OBJC_CLASS___MCPayload,  "remoteQueueableHomePodPayloadClasses"));
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payloads", 0));
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          if (([v7 containsObject:objc_opt_class(v13)] & 1) == 0)
          {
            os_log_t v14 = _MCLogObjects[9];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v15 = v14;
              int v16 = (objc_class *)objc_opt_class(v13);
              uint64_t v17 = NSStringFromClass(v16);
              unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v13 type]);
              *(_DWORD *)buf = 138543618;
              id v26 = v18;
              __int16 v27 = 2114;
              __int128 v28 = v19;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Payload class %{public}@ (%{public}@) is not available on HomePod",  buf,  0x16u);
            }

            BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller _errorUnacceptablePayload:](self, "_errorUnacceptablePayload:", v13));
            goto LABEL_17;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    BOOL v6 = 0LL;
LABEL_17:
  }

  return v6;
}

- (id)_preflightProfileForInstallationOnWatch:(id)a3
{
  id v4 = a3;
  if (-[MCInstaller _overrideProfileValidation](self, "_overrideProfileValidation"))
  {
    uint64_t v5 = _MCLogObjects[9];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Overriding profile validation for Watch",  buf,  2u);
    }

    BOOL v6 = 0LL;
  }

  else
  {
    char v36 = 1;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MCInstaller _watchInformationOutIsCellularSupported:]( self,  "_watchInformationOutIsCellularSupported:",  &v36));
    if (qword_1000DC148 != -1) {
      dispatch_once(&qword_1000DC148, &stru_1000C3910);
    }
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 payloads]);
    id v9 = [v8 countByEnumeratingWithState:&v32 objects:v43 count:16];
    if (v9)
    {
      id v10 = v9;
      unsigned int v31 = self;
      uint64_t v11 = *(void *)v33;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
          if (([(id)qword_1000DC140 containsObject:objc_opt_class(v13)] & 1) == 0)
          {
            int v16 = _MCLogObjects[9];
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_29;
            }
            uint64_t v17 = v16;
            unsigned __int8 v18 = (objc_class *)objc_opt_class(v13);
            uint64_t v19 = NSStringFromClass(v18);
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v13 type]);
            *(_DWORD *)buf = 138543618;
            uint64_t v38 = v20;
            __int16 v39 = 2114;
            id v40 = v21;
            __int128 v22 = "Payload class %{public}@ (%{public}@) is not available on Watch";
            goto LABEL_27;
          }

          if ([v7 count]
            && ([v13 isSupportedByWatchVersions:v7] & 1) == 0)
          {
            os_log_t v23 = _MCLogObjects[9];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v17 = v23;
              __int128 v24 = (objc_class *)objc_opt_class(v13);
              id v25 = NSStringFromClass(v24);
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v25);
              __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v13 type]);
              id v26 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
              *(_DWORD *)buf = 138543874;
              uint64_t v38 = v20;
              __int16 v39 = 2114;
              id v40 = v21;
              __int16 v41 = 2114;
              uint64_t v42 = v26;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Payload class %{public}@ (%{public}@) is not supported on any Watch version: %{public}@",  buf,  0x20u);

              goto LABEL_28;
            }

- (id)_watchInformationOutIsCellularSupported:(BOOL *)a3
{
  return 0LL;
}

- (id)_profileNotEligibleErrorWithProfile:(id)a3
{
  uint64_t v3 = MCInstallationErrorDomain;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 friendlyName]);
  uint64_t v5 = MCErrorArray(@"ERROR_PROFILE_UPDATE_NOT_ELIGIBLE_P_ID");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v3,  4012LL,  v6,  MCErrorTypeFatal,  v4,  0LL));

  return v7;
}

- (id)updateProfileWithIdentifier:(id)a3 interactionClient:(id)a4 source:(id)a5 outError:(id *)a6
{
  return -[MCInstaller updateProfileWithIdentifier:interactionClient:installForSystem:source:outError:]( self,  "updateProfileWithIdentifier:interactionClient:installForSystem:source:outError:",  a3,  a4,  1LL,  a5,  a6);
}

- (id)updateProfileWithIdentifier:(id)a3 interactionClient:(id)a4 installForSystem:(BOOL)a5 source:(id)a6 outError:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  id v64 = a6;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allInstalledUserProfileIdentifiers]);

  id v15 = [v14 containsObject:v10];
  int v16 = (int)v15;
  if ((_DWORD)v15) {
    uint64_t v17 = MCUserProfileStorageDirectory();
  }
  else {
    uint64_t v17 = MCSystemProfileStorageDirectory(v15);
  }
  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v10 MCHashedFilenameWithExtension:@"stub"]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingPathComponent:v19]);

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v20));
  id v68 = 0LL;
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfile profileWithData:outError:]( &OBJC_CLASS___MCProfile,  "profileWithData:outError:",  v21,  &v68));
  id v23 = v68;
  if (v23) {
    goto LABEL_10;
  }
  uint64_t v24 = objc_opt_class(&OBJC_CLASS___MCConfigurationProfile);
  if ((objc_opt_isKindOfClass(v22, v24) & 1) == 0)
  {
    id v23 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _profileNotEligibleErrorWithProfile:](self, "_profileNotEligibleErrorWithProfile:", v22));
LABEL_10:
    id v28 = v23;
    __int128 v29 = 0LL;
    goto LABEL_11;
  }

  int v62 = (void *)objc_claimAutoreleasedReturnValue([v22 OTAProfile]);
  if (v62)
  {
    uint64_t v61 = v11;
    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter sharedManager](&OBJC_CLASS___MCPasscodeManagerWriter, "sharedManager"));
    unsigned int v26 = [v25 isDeviceLocked];

    if (v26)
    {
      id v28 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _deviceLockedError](self, "_deviceLockedError"));
      __int128 v29 = 0LL;
      id v11 = v61;
    }

    else
    {
      uint64_t v38 = MCLocalizedString(@"INSTALL_STATUS_UPDATING_PROFILE", v27);
      __int16 v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      [v61 setDefaultStatus:v39];

      id v11 = v61;
      id v66 = 0LL;
      id v67 = 0LL;
      id v58 = [v62 createHandler];
      uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v58 fetchFinalProfileWithClient:v61 outProfileData:&v67 outError:&v66]);
      id v59 = v67;
      id v40 = v66;
      if (v40)
      {
        id v28 = v40;
        __int128 v29 = 0LL;
      }

      else
      {
        __int16 v41 = (void *)objc_claimAutoreleasedReturnValue([v60 identifier]);
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);
        unsigned __int8 v56 = [v41 isEqualToString:v42];

        if ((v56 & 1) != 0)
        {
          id v57 = [v60 createHandler];
          if (v57)
          {
            id v11 = v61;
            if (v61 && ([v61 didBeginInstallingNextProfileData:v59] & 1) == 0)
            {
              uint64_t v48 = v57;
              id v28 = (id)objc_claimAutoreleasedReturnValue([v57 userCancelledError]);
              __int128 v29 = 0LL;
            }

            else
            {
              uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
              uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);
              uint64_t v53 = self;
              uint64_t v45 = objc_claimAutoreleasedReturnValue( -[MCInstaller _managingProfileIdentifierForProfileIdentifier:]( self,  "_managingProfileIdentifierForProfileIdentifier:",  v44));

              uint64_t v55 = (void *)v45;
              if (v45) {
                [v43 setObject:v45 forKeyedSubscript:kMCInstallProfileOptionManagingProfileIdentifier];
              }
              if (v16) {
                id v46 = &off_1000CC010;
              }
              else {
                id v46 = &off_1000CC028;
              }
              [v43 setObject:v46 forKeyedSubscript:kMCInstallProfileOptionFilterFlag];
              [v43 setObject:&__kCFBooleanTrue forKeyedSubscript:kMCInstallProfileOptionIsOTAInstallation];
              [v43 setObject:&__kCFBooleanTrue forKeyedSubscript:kMCInstallProfileOptionIsOTAUpdate];
              id v47 = +[MCProfile newProfileSignatureVersion](&OBJC_CLASS___MCProfile, "newProfileSignatureVersion");
              [v43 setObject:v47 forKeyedSubscript:kMCInstallProfileOptionSignatureVersion];

              id v65 = 0LL;
              uint64_t v48 = v57;
              id v11 = v61;
              __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( -[MCInstaller _installProfileHandler:options:interactionClient:source:outError:]( v53,  "_installProfileHandler:options:interactionClient:source:outError:",  v57,  v43,  v61,  v64,  &v65));
              unsigned int v54 = v43;
              id v28 = v65;
            }
          }

          else
          {
            id v28 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _malformedPayloadErrorInternal:](self, "_malformedPayloadErrorInternal:", 0LL));
            __int128 v29 = 0LL;
            id v11 = v61;
            uint64_t v48 = 0LL;
          }
        }

        else
        {
          uint64_t v49 = MCInstallationErrorDomain;
          uint64_t v50 = MCErrorArray(@"ERROR_PROFILE_UPDATE_NOT_SAME_IDENTIFIER");
          uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(v50);
          id v28 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v49,  4010LL,  v48,  MCErrorTypeFatal,  0LL));
          __int128 v29 = 0LL;
          id v11 = v61;
        }
      }
    }
  }

  else
  {
    id v28 = (id)objc_claimAutoreleasedReturnValue(-[MCInstaller _profileNotEligibleErrorWithProfile:](self, "_profileNotEligibleErrorWithProfile:", v22));
    __int128 v29 = 0LL;
  }

LABEL_11:
  id v30 = [v12 commitChanges];
  if (v29) {
    MCSendProfileListChangedNotification(v30);
  }
  if (v28)
  {
    uint64_t v31 = MCInstallationErrorDomain;
    if (v22)
    {
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v22 friendlyName]);
      uint64_t v51 = v21;
      uint64_t v52 = 0LL;
      uint64_t v32 = MCErrorArray(@"ERROR_PROFILE_UPDATE_FAILED_P_ID");
    }

    else
    {
      uint64_t v51 = 0LL;
      uint64_t v32 = MCErrorArray(@"ERROR_PROFILE_UPDATE_FAILED");
    }

    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v31,  4013LL,  v33,  v28,  MCErrorTypeFatal,  v51,  v52));
    if (v22)
    {

      __int128 v33 = v21;
    }

    char v36 = _MCLogObjects[9];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      unsigned int v70 = v35;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Profile update failed: %{public}@", buf, 0xCu);
    }

    if (a7) {
      *a7 = v35;
    }

    id v34 = 0LL;
  }

  else
  {
    id v34 = v29;
  }

  return v34;
}

- (BOOL)interactionClient:(id)a3 didRequestPreflightUserInputResponses:(id)a4 forPayloadIndex:(unint64_t)a5 outError:(id *)a6
{
  id v8 = a4;
  if ([v8 count])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:0]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kMCIDResponseKey]);
    if (v10)
    {
      currentlyInstallingRestrictions = self->_currentlyInstallingRestrictions;
      id v20 = 0LL;
      unsigned int v12 = +[MCPasscodeManagerWriter passcode:compliesWithPolicyFromRestrictions:checkHistory:outError:]( &OBJC_CLASS___MCPasscodeManagerWriter,  "passcode:compliesWithPolicyFromRestrictions:checkHistory:outError:",  v10,  currentlyInstallingRestrictions,  1LL,  &v20);
      id v13 = v20;
      os_log_t v14 = v13;
      if (a6)
      {
        if (v12) {
          BOOL v15 = 1;
        }
        else {
          BOOL v15 = v13 == 0LL;
        }
        if (!v15)
        {
          int v16 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
          id v17 = [v16 mutableCopy];

          [v17 setObject:MCErrorTypeNeedsRetry forKey:MCErrorTypeKey];
          unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v14 domain]);
          *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  v18,  [v14 code],  v17));
        }
      }
    }

    else
    {
      LOBYTE(v12) = 0;
    }
  }

  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (void)_removeOrphanedResourcesOptions:(id)a3 includingAccounts:(BOOL)a4
{
  BOOL v83 = a4;
  id v85 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  uint64_t v6 = kMCDMManagedProfileToManagingProfileKey;
  uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue([v5 orphanedParentsForDomain:kMCDMManagedProfileToManagingProfileKey]);
  if ([v84 count])
  {
    __int128 v117 = 0u;
    __int128 v118 = 0u;
    __int128 v115 = 0u;
    __int128 v116 = 0u;
    id v7 = v84;
    id v8 = [v7 countByEnumeratingWithState:&v115 objects:v127 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v116;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v116 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v115 + 1) + 8LL * (void)i);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 dependentsOfParent:v12 inSystemDomain:v6]);
          id v14 = [v13 count];

          if (!v14) {
            id v15 =  -[MCInstaller _reallyRemoveInstalledProfileWithIdentifier:installationType:options:source:]( self,  "_reallyRemoveInstalledProfileWithIdentifier:installationType:options:source:",  v12,  1LL,  0LL,  @"Orphaned Resource Removal");
          }
          int v16 = (void *)objc_claimAutoreleasedReturnValue([v5 dependentsOfParent:v12 inUserDomain:v6]);
          id v17 = [v16 count];

          if (!v17) {
            id v18 =  -[MCInstaller _reallyRemoveInstalledProfileWithIdentifier:installationType:options:source:]( self,  "_reallyRemoveInstalledProfileWithIdentifier:installationType:options:source:",  v12,  2LL,  0LL,  @"Orphaned Resource Removal");
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v115 objects:v127 count:16];
      }

      while (v9);
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](&OBJC_CLASS___MCServerSideHacks, "sharedHacks"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 effectiveUserSettings]);
    [v19 recomputeHacksAfterProfileChangesEffectiveUserSettings:v21 sendNotifications:1];
  }

  uint64_t v22 = kMCDMProvisioningProfileToManagingProfileKey;
  __int128 v111 = 0u;
  __int128 v112 = 0u;
  __int128 v113 = 0u;
  __int128 v114 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v5 orphanedParentsForDomain:kMCDMProvisioningProfileToManagingProfileKey]);
  id v23 = [obj countByEnumeratingWithState:&v111 objects:v126 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v112;
    do
    {
      for (j = 0LL; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v112 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v111 + 1) + 8LL * (void)j);
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v5 dependentsOfParent:v27 inDomain:v22]);
        id v29 = [v28 count];

        if (!v29) {
          id v30 =  -[MCInstaller removeProvisioningProfileUUID:sender:]( self,  "removeProvisioningProfileUUID:sender:",  v27,  @"MCInstaller.removeOrphanedResources");
        }
      }

      id v24 = [obj countByEnumeratingWithState:&v111 objects:v126 count:16];
    }

    while (v24);
  }

  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v5 orphanedParentsForDomain:kMCDMCertificateToPayloadUUIDDependencyKey]);
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  id v32 = [v31 countByEnumeratingWithState:&v107 objects:v125 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v108;
    do
    {
      for (k = 0LL; k != v33; k = (char *)k + 1)
      {
        if (*(void *)v108 != v34) {
          objc_enumerationMutation(v31);
        }
        -[MCInstaller _removeOrphanedCertificateDependencyManager:persistentID:persona:]( self,  "_removeOrphanedCertificateDependencyManager:persistentID:persona:",  v5,  *(void *)(*((void *)&v107 + 1) + 8LL * (void)k),  0LL);
      }

      id v33 = [v31 countByEnumeratingWithState:&v107 objects:v125 count:16];
    }

    while (v33);
  }

  uint64_t v82 = v31;
  char v36 = (void *)objc_claimAutoreleasedReturnValue([v5 orphanedParentsForDomain:kMCDMEnterpriseCertificateToPayloadUUIDDependencyKey]);
  if ([v36 count])
  {
    uint64_t v37 = kMDMPersonaKey;
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v85 objectForKeyedSubscript:kMDMPersonaKey]);
    uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v38, v39) & 1) != 0) {
      id v40 = (void *)objc_claimAutoreleasedReturnValue([v85 objectForKeyedSubscript:v37]);
    }
    else {
      id v40 = 0LL;
    }

    __int128 v105 = 0u;
    __int128 v106 = 0u;
    __int128 v103 = 0u;
    __int128 v104 = 0u;
    id v41 = v36;
    id v42 = [v41 countByEnumeratingWithState:&v103 objects:v124 count:16];
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v104;
      do
      {
        for (m = 0LL; m != v43; m = (char *)m + 1)
        {
          if (*(void *)v104 != v44) {
            objc_enumerationMutation(v41);
          }
          -[MCInstaller _removeOrphanedCertificateDependencyManager:persistentID:persona:]( self,  "_removeOrphanedCertificateDependencyManager:persistentID:persona:",  v5,  *(void *)(*((void *)&v103 + 1) + 8LL * (void)m),  v40);
        }

        id v43 = [v41 countByEnumeratingWithState:&v103 objects:v124 count:16];
      }

      while (v43);
    }
  }

  int v81 = v36;
  id v46 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v46 removeOrphanedClientRestrictions];

  +[MCAirPlayPayloadHandler recomputeAirPlaySettings](&OBJC_CLASS___MCAirPlayPayloadHandler, "recomputeAirPlaySettings");
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  id v87 = (id)objc_claimAutoreleasedReturnValue([v5 orphanedParentsForDomain:kMCDMAirPlayPasswordDeviceNameToPayloadUUIDDependencyKey]);
  id v47 = [v87 countByEnumeratingWithState:&v99 objects:v123 count:16];
  if (v47)
  {
    id v48 = v47;
    uint64_t v49 = *(void *)v100;
    uint64_t v50 = kMCAirPlayPasswordServiceKey;
    uint64_t v51 = kMCAppleKeychainGroup;
    do
    {
      for (n = 0LL; n != v48; n = (char *)n + 1)
      {
        if (*(void *)v100 != v49) {
          objc_enumerationMutation(v87);
        }
        uint64_t v53 = *(const void **)(*((void *)&v99 + 1) + 8LL * (void)n);
        unsigned int v54 = _MCLogObjects[9];
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          CFTypeRef v122 = v53;
          _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "Removing AirPlay password for device name %{public}@",  buf,  0xCu);
        }

        +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:]( &OBJC_CLASS___MCKeychain,  "removeItemForService:account:label:description:useSystemKeychain:group:",  v50,  v53,  0LL,  0LL,  1LL,  v51);
      }

      id v48 = [v87 countByEnumeratingWithState:&v99 objects:v123 count:16];
    }

    while (v48);
  }

  uint64_t v55 = kMCDMFontURLToProfileIdentifierKey;
  unsigned __int8 v56 = (void *)objc_claimAutoreleasedReturnValue([v5 orphanedParentsForDomain:kMCDMFontURLToProfileIdentifierKey]);
  v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v56 count]));
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  id v89 = v56;
  id v57 = [v89 countByEnumeratingWithState:&v95 objects:v120 count:16];
  if (v57)
  {
    id v58 = v57;
    uint64_t v59 = *(void *)v96;
    do
    {
      for (ii = 0LL; ii != v58; ii = (char *)ii + 1)
      {
        if (*(void *)v96 != v59) {
          objc_enumerationMutation(v89);
        }
        uint64_t v61 = *(void *)(*((void *)&v95 + 1) + 8LL * (void)ii);
        int v62 = (void *)objc_claimAutoreleasedReturnValue([v5 dependentsOfParent:v61 inDomain:v55]);
        id v63 = [v62 count];

        if (!v63)
        {
          id v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v61));
          id v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          id v66 = (void *)objc_claimAutoreleasedReturnValue([v64 path]);
          unsigned int v67 = [v65 fileExistsAtPath:v66];

          if (v67)
          {
            id v68 = _MCLogObjects[9];
            if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543362;
              CFTypeRef v122 = v64;
              _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "Removing font at %{public}@", buf, 0xCu);
            }

            [v86 addObject:v64];
          }
        }
      }

      id v58 = [v89 countByEnumeratingWithState:&v95 objects:v120 count:16];
    }

    while (v58);
  }

  os_log_t v69 = _MCLogObjects[9];
  if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
  {
    unsigned int v70 = v69;
    id v71 = [v89 count];
    *(_DWORD *)buf = 134217984;
    CFTypeRef v122 = v71;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "Unregistering %lu fonts.", buf, 0xCu);
  }

  CFTypeRef cf = 0LL;
  GSFontUnregisterPersistentURLs(v86, &cf);
  uint64_t v72 = _MCLogObjects[9];
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    CFTypeRef v122 = cf;
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "Results: %{public}@", buf, 0xCu);
  }

  if (cf) {
    CFRelease(cf);
  }
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  id v73 = v86;
  id v74 = [v73 countByEnumeratingWithState:&v90 objects:v119 count:16];
  if (v74)
  {
    id v75 = v74;
    uint64_t v76 = *(void *)v91;
    do
    {
      for (jj = 0LL; jj != v75; jj = (char *)jj + 1)
      {
        if (*(void *)v91 != v76) {
          objc_enumerationMutation(v73);
        }
        uint64_t v78 = *(void *)(*((void *)&v90 + 1) + 8LL * (void)jj);
        GSFontUnregisterURL(v78);
        id v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        [v79 removeItemAtURL:v78 error:0];
      }

      id v75 = [v73 countByEnumeratingWithState:&v90 objects:v119 count:16];
    }

    while (v75);
  }

  if (v83)
  {
    uint64_t v80 = _MCLogObjects[9];
    if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "Fixing orphaned accounts...", buf, 2u);
    }

    +[MCAccountUtilities checkAccountConsistencyAndReleaseOrphanedAccounts]( &OBJC_CLASS___MCAccountUtilities,  "checkAccountConsistencyAndReleaseOrphanedAccounts");
  }
}

- (void)_removeOrphanedCertificateDependencyManager:(id)a3 persistentID:(id)a4 persona:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 dependentsOfParent:v8 inDomain:kMCDMCertificateToHostIdentifierDependencyKey]);
  id v10 = [v9 count];

  if (!v10)
  {
    unsigned int v11 = -[MCInstaller isCertificateReference:aliasedInDependencyManager:]( self,  "isCertificateReference:aliasedInDependencyManager:",  v8,  v7);
    uint64_t v12 = _MCLogObjects[9];
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        int v18 = 138543362;
        id v19 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Skipping aliased certificate with persistent ID %{public}@",  (uint8_t *)&v18,  0xCu);
      }
    }

    else
    {
      if (v13)
      {
        int v18 = 138543362;
        id v19 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Removing certificate with persistent ID %{public}@",  (uint8_t *)&v18,  0xCu);
      }

      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData MCDataWithHexString:](&OBJC_CLASS___NSData, "MCDataWithHexString:", v8));
      id v15 = +[MCKeychain copyCertificateWithPersistentID:useSystemKeychain:]( &OBJC_CLASS___MCKeychain,  "copyCertificateWithPersistentID:useSystemKeychain:",  v14,  1LL);
      if (v15)
      {
        int v16 = v15;
        if (SecCertificateIsSelfSignedCA(v15))
        {
          uint64_t v17 = SecTrustStoreForDomain(2LL);
          SecTrustStoreRemoveCertificate(v17, v16);
        }

        CFRelease(v16);
      }

      +[MCKeychain removeItemWithPersistentID:useSystemKeychain:]( &OBJC_CLASS___MCKeychain,  "removeItemWithPersistentID:useSystemKeychain:",  v14,  1LL);
    }
  }
}

- (id)_managingProfileIdentifierForProfileIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dependentsOfParent:v3 inDomain:kMCDMManagedProfileToManagingProfileKey]);

  if ([v5 count]) {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:0]);
  }
  else {
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (void)removeAllProfilesFromInstallationQueue
{
}

- (id)_reallyRemoveInstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 options:(id)a5 source:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( -[MCInstaller _reallyRemoveProfileWithIdentifier:installationType:profileInstalled:targetDeviceType:options:source:]( self,  "_reallyRemoveProfileWithIdentifier:installationType:profileInstalled:targetDeviceType:options:source:",  v12,  a4,  1LL,  +[MCProfile thisDeviceType](&OBJC_CLASS___MCProfile, "thisDeviceType"),  v11,  v10));

  return v13;
}

- (id)_reallyRemoveProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 profileInstalled:(BOOL)a5 targetDeviceType:(unint64_t)a6 options:(id)a7 source:(id)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  if (!v14)
  {
    id v30 = _MCLogObjects[5];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Profile identifier is nil.", buf, 2u);
    }

    goto LABEL_21;
  }

  if (v11)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue( -[MCInstaller pathToInstalledProfileByIdentifier:installationType:]( self,  "pathToInstalledProfileByIdentifier:installationType:",  v14,  a4));
    if (v17)
    {
      int v18 = (void *)v17;
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v17));
      if (!v19)
      {
        __int128 v35 = _MCLogObjects[5];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "Cannot load profile to uninstall.",  buf,  2u);
        }

        id v27 = 0LL;
        uint64_t v57 = 0LL;
        int v28 = 0;
        id v29 = 0LL;
        char v58 = 1;
LABEL_30:

        -[MCInstaller _cleanUpAfterRemovingProfileWithIdentifier:installedForUser:profileHandler:oldRestrictions:]( self,  "_cleanUpAfterRemovingProfileWithIdentifier:installedForUser:profileHandler:oldRestrictions:",  v14,  a4 == 2,  v29,  v27);
        if (v28)
        {
          uint64_t v44 = _MCLogObjects[9];
          uint64_t v45 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);
          if ((_DWORD)v45)
          {
            id v46 = v44;
            id v47 = (void *)objc_claimAutoreleasedReturnValue([v29 profile]);
            id v48 = (void *)objc_claimAutoreleasedReturnValue([v47 identifier]);
            *(_DWORD *)buf = 138543362;
            id v62 = v48;
            _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_INFO,  "Profile “%{public}@“ removed",  buf,  0xCu);
          }

          if ((_DWORD)v57) {
            uint64_t v45 = notify_post((const char *)[MCDefaultsDidChangeNotification UTF8String]);
          }
          if (HIDWORD(v57)) {
            MDMSendDevicePostureChangedNotification(v45);
          }
          uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          [v49 removeItemAtPath:v18 error:0];
        }

        char v33 = v58;
        if (a4 == 2) {
          goto LABEL_39;
        }
        goto LABEL_20;
      }

      id v60 = 0LL;
      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfile profileWithData:outError:]( &OBJC_CLASS___MCProfile,  "profileWithData:outError:",  v19,  &v60));
      id v21 = v60;
      uint64_t v55 = v21;
      unsigned __int8 v56 = v20;
      if (v21)
      {
        uint64_t v22 = v21;
        os_log_t v23 = _MCLogObjects[5];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          id v24 = v23;
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v22 MCVerboseDescription]);
          *(_DWORD *)buf = 138543362;
          id v62 = v25;
          unsigned int v26 = "Cannot parse profile to uninstall. Error: %{public}@";
LABEL_8:
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v26, buf, 0xCu);
        }
      }

      else
      {
        id v36 = [v20 createHandler];
        if (v36)
        {
          id v29 = v36;
          unsigned int v54 = v19;
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 currentRestrictions]);
          id v27 = [v38 MCDeepCopy];

          os_log_t v39 = _MCLogObjects[5];
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            id v40 = v39;
            uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v29 profile]);
            id v41 = (void *)objc_claimAutoreleasedReturnValue([v59 identifier]);
            *(_DWORD *)buf = 138543618;
            id v62 = v41;
            __int16 v63 = 2114;
            id v64 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Removing profile “%{public}@” on behalf of “%{public}@”...",  buf,  0x16u);
          }

          [v29 removeWithInstaller:self options:v15];
          id v42 = objc_opt_new(&OBJC_CLASS___MCProfileEventsManager);
          id v43 = (void *)objc_claimAutoreleasedReturnValue([v29 profile]);
          -[MCProfileEventsManager addEventForProfile:operation:source:]( v42,  "addEventForProfile:operation:source:",  v43,  @"remove",  v16);

          LODWORD(v57) = [v56 containsPayloadOfClass:objc_opt_class(MCDefaultsPayload)];
          HIDWORD(v57) = [v56 containsPayloadOfClass:objc_opt_class(MCMDMPayload)];
          char v58 = 0;
          int v28 = 1;
          id v19 = v54;
          goto LABEL_29;
        }

        os_log_t v53 = _MCLogObjects[5];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          id v24 = v53;
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v20 friendlyName]);
          *(_DWORD *)buf = 138543362;
          id v62 = v25;
          unsigned int v26 = "Cannot create handler for profile ‚“%{public}@”.";
          goto LABEL_8;
        }
      }

      id v27 = 0LL;
      uint64_t v57 = 0LL;
      int v28 = 0;
      id v29 = 0LL;
      char v58 = 1;
LABEL_29:

      goto LABEL_30;
    }

    goto LABEL_16;
  }

  uint64_t v31 = objc_claimAutoreleasedReturnValue( -[MCInstaller pathToUninstalledProfileByIdentifier:installationType:targetDeviceType:]( self,  "pathToUninstalledProfileByIdentifier:installationType:targetDeviceType:",  v14,  a4,  a6));
  if (!v31)
  {
LABEL_16:
    id v32 = _MCLogObjects[5];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v62 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Profile “%{public}@” is not installed. Ignoring.",  buf,  0xCu);
    }

    if (v11)
    {
      -[MCInstaller _cleanUpAfterRemovingProfileWithIdentifier:installedForUser:profileHandler:oldRestrictions:]( self,  "_cleanUpAfterRemovingProfileWithIdentifier:installedForUser:profileHandler:oldRestrictions:",  v14,  a4 == 2,  0LL,  0LL);
      id v29 = 0LL;
      int v18 = 0LL;
      id v27 = 0LL;
      char v33 = 1;
      if (a4 == 2)
      {
LABEL_39:
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
        [v34 removeIdentifierFromUserManifest:v14 flag:3];
LABEL_40:

        if ((v33 & 1) == 0) {
          goto LABEL_43;
        }
        goto LABEL_41;
      }

- (void)_cleanUpAfterRemovingProfileWithIdentifier:(id)a3 installedForUser:(BOOL)a4 profileHandler:(id)a5 oldRestrictions:(id)a6
{
  BOOL v45 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  if (v10)
  {
    id v13 = v10;
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 currentRestrictions]);
    id v13 = [v14 MCDeepCopy];
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 systemProfileRestrictions]);
  id v16 = [v15 MCMutableDeepCopy];

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v11 userProfileRestrictions]);
  id v18 = [v17 MCMutableDeepCopy];

  if (v45) {
    id v19 = v18;
  }
  else {
    id v19 = v16;
  }
  [v19 removeObjectForKey:v8];
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v9 profile]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 loggingID]);
  uint64_t v44 = v18;
  [v11 setSystemProfileRestrictions:v16 userProfileRestrictions:v18 sender:v21 outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outAp pWhitelistSettingsChanged:0 outRecomputedNag:0 outError:0];

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v11 currentRestrictions]);
  [v9 didRemoveOldGlobalRestrictions:v13 newGlobalRestrictions:v22];

  uint64_t v23 = kMCDMManagingProfileToManagedProfileKey;
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v12 dependentsOfParent:v8 inDomain:kMCDMManagingProfileToManagedProfileKey]);
  uint64_t v25 = kMCDMManagingProfileToProvisioningProfileKey;
  id v47 = (void *)objc_claimAutoreleasedReturnValue([v12 dependentsOfParent:v8 inDomain:kMCDMManagingProfileToProvisioningProfileKey]);
  if ([v24 count] || objc_msgSend(v47, "count"))
  {
    id v40 = v16;
    id v41 = v13;
    id v43 = v10;
    id v46 = v9;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    os_log_t v39 = v24;
    id v26 = [v24 copy];
    id v27 = [v26 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v53;
      uint64_t v30 = kMCDMManagedProfileToManagingProfileKey;
      do
      {
        for (i = 0LL; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v53 != v29) {
            objc_enumerationMutation(v26);
          }
          [v12 removeDependent:*(void *)(*((void *)&v52 + 1) + 8 * (void)i) fromParent:v8 inDomain:v23 reciprocalDomain:v30 fromSystem:1 user:1];
        }

        id v28 = [v26 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }

      while (v28);
    }

    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id v32 = [v47 copy];
    id v33 = [v32 countByEnumeratingWithState:&v48 objects:v56 count:16];
    id v16 = v40;
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v49;
      uint64_t v36 = kMCDMProvisioningProfileToManagingProfileKey;
      do
      {
        for (j = 0LL; j != v34; j = (char *)j + 1)
        {
          if (*(void *)v49 != v35) {
            objc_enumerationMutation(v32);
          }
          [v12 removeDependent:*(void *)(*((void *)&v48 + 1) + 8 * (void)j) fromParent:v8 inDomain:v25 reciprocalDomain:v36 fromSystem:1 user:1];
        }

        id v34 = [v32 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }

      while (v34);
    }

    id v9 = v46;
    id v13 = v41;
    id v10 = v43;
    id v24 = v39;
  }

  else
  {
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( -[MCInstaller _managingProfileIdentifierForProfileIdentifier:]( self,  "_managingProfileIdentifierForProfileIdentifier:",  v8));
    if (v38) {
      objc_msgSend( v12,  "removeDependent:fromParent:inDomain:reciprocalDomain:fromSystem:user:",  v8,  v38,  v23,  kMCDMManagedProfileToManagingProfileKey,  !v45);
    }
  }
}

- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 source:(id)a5
{
}

- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 options:(id)a5 source:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v26 = (id)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  [v26 commitChanges];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 currentRestrictions]);
  id v15 = [v14 MCDeepCopy];

  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[MCInstaller _reallyRemoveInstalledProfileWithIdentifier:installationType:options:source:]( self,  "_reallyRemoveInstalledProfileWithIdentifier:installationType:options:source:",  v12,  a4,  v11,  v10));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[MCPayload accountPayloads](&OBJC_CLASS___MCPayload, "accountPayloads"));
  id v18 = [v17 setByAddingObject:objc_opt_class(MCMDMPayload)];
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  -[MCInstaller _removeOrphanedResourcesOptions:includingAccounts:]( self,  "_removeOrphanedResourcesOptions:includingAccounts:",  v11,  [v16 containsAnyPayloadOfClasses:v19]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](&OBJC_CLASS___MCServerSideHacks, "sharedHacks"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 effectiveUserSettings]);
  [v20 recomputeHacksAfterProfileChangesEffectiveUserSettings:v22 sendNotifications:1];

  id v23 = [v20 recomputeAccountVPNAssociations];
  LODWORD(v21) = +[MCRestrictionManager isWebContentFilterUIActiveWithRestrictionDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "isWebContentFilterUIActiveWithRestrictionDictionary:",  v15);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 currentRestrictions]);
  LODWORD(v22) = +[MCRestrictionManager isWebContentFilterUIActiveWithRestrictionDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "isWebContentFilterUIActiveWithRestrictionDictionary:",  v25);

  if ((_DWORD)v21 != (_DWORD)v22) {
    MCSendWebContentFilterUIActiveChangedNotification();
  }
  MCSendProfileListChangedNotification([v26 commitChanges]);
}

- (void)removeUninstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5
{
}

- (void)removeManagedProfilesIfNecessary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 parentsInDomain:kMCDMManagingProfileToManagedProfileKey]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  uint64_t v5 = v8;
  if (v8)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 installedSystemProfileWithIdentifier:v8]);

    if (!v7) {
      -[MCInstaller removeProfileWithIdentifier:installationType:source:]( self,  "removeProfileWithIdentifier:installationType:source:",  v8,  1LL,  @"Managed Profile Removal");
    }

    uint64_t v5 = v8;
  }
}

- (id)removeProvisioningProfileUUID:(id)a3 sender:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _MCLogObjects[2];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "MCInstaller removing provisioning profile UUID %{public}@ on behalf of %{public}@",  (uint8_t *)&v11,  0x16u);
  }

  uint64_t v8 = MISRemoveProvisioningProfile(v5);
  if ((_DWORD)v8) {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
  }
  else {
    id v9 = 0LL;
  }

  return v9;
}

- (id)verifiedMDMProfileIdentifierWithCleanUp
{
  id v3 = _MCLogObjects[9];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "MCInstaller checking for MDM installation...",  buf,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiersOfProfilesWithFilterFlags:3]);

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v6 = v5;
  id v34 = [v6 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (!v34)
  {

LABEL_23:
    id v19 = _MCLogObjects[9];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "MCInstaller could not find an MDM installation. Removing MDM-related files...",  buf,  2u);
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v21 = MDMFilePath(v20);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    [v20 removeItemAtPath:v22 error:0];

    uint64_t v23 = MDMOutstandingActivitiesFilePath();
    id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    [v20 removeItemAtPath:v24 error:0];

    uint64_t v25 = MDMUserFilePath();
    id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    [v20 removeItemAtPath:v26 error:0];

    uint64_t v27 = MDMUserOutstandingActivitiesFilePath();
    id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    [v20 removeItemAtPath:v28 error:0];

    -[MCInstaller removeManagedProfilesIfNecessary](self, "removeManagedProfilesIfNecessary");
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](&OBJC_CLASS___MDMConfiguration, "sharedConfiguration"));
    [v29 refreshDetailsFromDisk];

    MDMSendManagingOrgInfoChangedNotification();
    id v7 = 0LL;
    goto LABEL_26;
  }

  id v32 = self;
  id v7 = 0LL;
  uint64_t v33 = *(void *)v40;
  do
  {
    for (i = 0LL; i != v34; i = (char *)i + 1)
    {
      if (*(void *)v40 != v33) {
        objc_enumerationMutation(v6);
      }
      id v9 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MCManifest installedProfileWithIdentifier:]( &OBJC_CLASS___MCManifest,  "installedProfileWithIdentifier:",  v9,  v32));
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 payloads]);
      id v12 = [v11 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v36;
        while (2)
        {
          for (j = 0LL; j != v13; j = (char *)j + 1)
          {
            if (*(void *)v36 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)j);
            uint64_t v17 = objc_opt_class(&OBJC_CLASS___MCMDMPayload);
            if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
            {
              id v18 = v9;

              id v7 = v18;
              goto LABEL_18;
            }
          }

          id v13 = [v11 countByEnumeratingWithState:&v35 objects:v44 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

- (void)recomputeProfileRestrictionsWithCompletionBlock:(id)a3
{
  __int128 v51 = (void (**)(id, id))a3;
  id v3 = _MCLogObjects[9];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Recomputing profile restrictions...", buf, 2u);
  }

  __int128 v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allInstalledProfileIdentifiers]);

  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v68 objects:v78 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v69;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v69 != v9) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v68 + 1) + 8LL * (void)i);
        id v12 = sub_10003CF38();
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 MCHashedFilenameWithExtension:@"stub"]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByAppendingPathComponent:v14]);

        [v4 setObject:v15 forKey:v11];
      }

      id v8 = [obj countByEnumeratingWithState:&v68 objects:v78 count:16];
    }

    while (v8);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 allInstalledUserProfileIdentifiers]);

  __int128 v67 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v64 = 0u;
  id v54 = v17;
  id v18 = [v54 countByEnumeratingWithState:&v64 objects:v77 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v65;
    do
    {
      for (j = 0LL; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v65 != v20) {
          objc_enumerationMutation(v54);
        }
        uint64_t v22 = *(void **)(*((void *)&v64 + 1) + 8LL * (void)j);
        id v23 = sub_10003CEFC();
        id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v22 MCHashedFilenameWithExtension:@"stub"]);
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v24 stringByAppendingPathComponent:v25]);

        [v4 setObject:v26 forKey:v22];
      }

      id v19 = [v54 countByEnumeratingWithState:&v64 objects:v77 count:16];
    }

    while (v19);
  }

  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id v27 = v4;
  id v28 = [v27 countByEnumeratingWithState:&v60 objects:v76 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = 0LL;
    uint64_t v56 = *(void *)v61;
    do
    {
      for (k = 0LL; k != v29; k = (char *)k + 1)
      {
        if (*(void *)v61 != v56) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void *)(*((void *)&v60 + 1) + 8LL * (void)k);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:v32]);
        id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v33));
        if (v34)
        {
          id v59 = v30;
          __int128 v35 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfile profileWithData:outError:]( &OBJC_CLASS___MCProfile,  "profileWithData:outError:",  v34,  &v59));
          id v36 = v59;

          if (v36)
          {
            os_log_t v37 = _MCLogObjects[9];
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              __int128 v38 = v37;
              __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v36 MCVerboseDescription]);
              *(_DWORD *)buf = 138543618;
              uint64_t v73 = v32;
              __int16 v74 = 2114;
              id v75 = v39;
              _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Error parsing stub for profile ID %{public}@. Error:%{public}@",  buf,  0x16u);
            }
          }

          else
          {
            id v58 = 0LL;
            __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v35 restrictionsWithHeuristicsAppliedOutError:&v58]);
            id v36 = v58;
            __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v35 identifier]);
            if (v41) {
              [v53 setObject:v41 forKey:v42];
            }
            else {
              [v53 removeObjectForKey:v42];
            }

            id v43 = (void *)objc_claimAutoreleasedReturnValue([v35 appAccessibilityParameters]);
            if (v43) {
              [v52 addEntriesFromDictionary:v43];
            }
          }

          uint64_t v30 = v36;
        }

        else
        {
          __int128 v40 = _MCLogObjects[9];
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v73 = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "Can't read stub for profile ID %{public}@",  buf,  0xCu);
          }
        }
      }

      id v29 = [v27 countByEnumeratingWithState:&v60 objects:v76 count:16];
    }

    while (v29);
  }

  else
  {
    uint64_t v30 = 0LL;
  }

  uint64_t v44 = MCSystemAppAccessibilityParametersFilePath();
  BOOL v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  [v52 MCWriteToBinaryFile:v45];

  id v46 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  id v57 = 0LL;
  [v46 setSystemProfileRestrictions:v53 userProfileRestrictions:v50 sender:@"MCInstaller.RecomputeProfileRestrictions" outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outAp pWhitelistSettingsChanged:0 outRecomputedNag:0 outError:&v57];
  id v47 = v57;
  __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(+[MCServerSideHacks sharedHacks](&OBJC_CLASS___MCServerSideHacks, "sharedHacks"));
  __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v46 effectiveUserSettings]);
  [v48 recomputeHacksAfterProfileChangesEffectiveUserSettings:v49 sendNotifications:1];

  if (v51) {
    v51[2](v51, v47);
  }
}

+ (void)_setPathsSystemProfileStorageDirectory:(id)a3 userProfileStorageDirectory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)qword_1000DC110;
  qword_1000DC110 = (uint64_t)v5;
  id v9 = v5;

  id v8 = (void *)qword_1000DC118;
  qword_1000DC118 = (uint64_t)v6;
}

+ (id)_installationFailureErrorWithUnderlyingError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = MCErrorArray(@"INSTALLATION_FAILED");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  MCInstallationErrorDomain,  4001LL,  v5,  v3,  MCErrorTypeFatal,  0LL));

  return v6;
}

- (id)_installedProfileWithIdentifier:(id)a3 installationType:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  id v7 = v6;
  if (a4 == 2)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiersOfProfilesWithFilterFlags:9]);

    if ([v8 containsObject:v5])
    {
      id v9 = sub_10003CEFC();
      uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
LABEL_6:
      id v12 = (void *)v10;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 MCHashedFilenameWithExtension:@"stub"]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathComponent:v13]);

      goto LABEL_8;
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiersOfProfilesWithFilterFlags:19]);

    if ([v8 containsObject:v5])
    {
      id v11 = sub_10003CF38();
      uint64_t v10 = objc_claimAutoreleasedReturnValue(v11);
      goto LABEL_6;
    }
  }

  uint64_t v14 = 0LL;
LABEL_8:

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v14));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfile profileWithData:outError:]( &OBJC_CLASS___MCProfile,  "profileWithData:outError:",  v15,  0LL));
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  return v16;
}

- (void)_sendMDMEnrollmentEventWithInstallationOptions:(id)a3
{
  id v3 = a3;
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](&OBJC_CLASS___MDMCloudConfiguration, "sharedConfiguration"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](&OBJC_CLASS___MDMConfiguration, "sharedConfiguration"));
  [v17 refreshDetailsFromDisk];
  [v4 refreshDetailsFromDisk];
  id v5 = [v17 isSupervised];
  unsigned int v6 = [v17 isTeslaEnrolled];
  else {
    uint64_t v7 = (uint64_t)+[DMCMultiUserModeUtilities isSharediPad](&OBJC_CLASS___DMCMultiUserModeUtilities, "isSharediPad");
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 personaID]);

  id v9 = [v4 isUserEnrollment];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 enrollmentMode]);
  if ([v10 isEqualToString:kMDMEnrollmentModeBYOD])
  {
    uint64_t v11 = 1LL;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 enrollmentMode]);
    uint64_t v11 = (uint64_t)[v12 isEqualToString:kMDMEnrollmentModeADDE];
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kMCInstallProfileOptionInstallationSource]);
  id v14 = [v13 isEqualToString:kDMCProfileInstallationSourceReturnToService];

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kMCInstallProfileOptionIsESSOEnrollment]);
  id v16 = [v15 BOOLValue];

  DMCAnalyticsSendEnrollmentEvent(v5, v6 & v5, v7, v8 != 0LL, v9, v11, v14, v16);
}

- (void)_checkinWithMdmd
{
  uint64_t v2 = _MCLogObjects[9];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Checking in with mdmd...", buf, 2u);
  }

  *(void *)buf = 0LL;
  id v13 = buf;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](&OBJC_CLASS___MDMClient, "sharedClient"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10004865C;
  v9[3] = &unk_1000C32C0;
  uint64_t v11 = buf;
  id v5 = v3;
  uint64_t v10 = v5;
  [v4 touchWithCompletion:v9];

  dispatch_time_t v6 = dispatch_time(0LL, 30000000000LL);
  dispatch_semaphore_wait(v5, v6);
  if (!v13[24])
  {
    uint64_t v7 = _MCLogObjects[9];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "mdmd didn't respond within 30 seconds, give up waiting.",  v8,  2u);
    }
  }

  _Block_object_dispose(buf, 8);
}

+ (id)considerProfilesInstalledDuringBuddyForManagement
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[MDMCloudConfiguration sharedConfiguration]( &OBJC_CLASS___MDMCloudConfiguration,  "sharedConfiguration"));
  id v3 = [v2 isTeslaEnrolled];
  if ((_DWORD)v3)
  {
    id v3 = [v2 isSupervised];
    int v4 = (int)v3;
  }

  else
  {
    int v4 = 0;
  }

  uint64_t v5 = MDMFilePath(v3);
  dispatch_time_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v6));

  if (v7) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kMDMManagingProfileIdentifierKey]);
  }
  else {
    id v8 = 0LL;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCPayload mdmAdoptablePayloads](&OBJC_CLASS___MCPayload, "mdmAdoptablePayloads"));
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  uint64_t v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if (v4 && [v8 length])
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000488AC;
    v19[3] = &unk_1000C3938;
    id v11 = v8;
    id v20 = v11;
    id v21 = v9;
    id v12 = objc_retainBlock(v19);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10004896C;
    v15[3] = &unk_1000C3960;
    id v16 = v11;
    id v17 = v10;
    id v18 = &v22;
    +[MCInstaller _enumerateProfilesWithCriteria:filterFlags:block:]( &OBJC_CLASS___MCInstaller,  "_enumerateProfilesWithCriteria:filterFlags:block:",  v12,  17LL,  v15);
  }

  if (*((_BYTE *)v23 + 24))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
    [v13 commitChanges];
  }

  _Block_object_dispose(&v22, 8);

  return v10;
}

+ (void)_enumerateProfilesWithCriteria:(id)a3 filterFlags:(int)a4 block:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = (unsigned int (**)(id, void *))a3;
  id v8 = a5;
  id v9 = (unsigned int (**)(void, void))v8;
  if (v7 && v8)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifiersOfProfilesWithFilterFlags:v6]);

    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v12 = v11;
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
      while (2)
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
          id v18 = objc_autoreleasePoolPush();
          id v19 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest", (void)v21));
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 installedProfileWithIdentifier:v17]);

          if (v20 && v7[2](v7, v20) && !((unsigned int (**)(void, void *))v9)[2](v9, v20))
          {

            objc_autoreleasePoolPop(v18);
            goto LABEL_15;
          }

          objc_autoreleasePoolPop(v18);
        }

        id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

- (BOOL)sendPurgatoryProfileData:(id)a3 identifier:(id)a4 targetDevice:(unint64_t)a5 outError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  -[MCInstaller _replacePurgatoryProfilesForTargetDevice:](self, "_replacePurgatoryProfilesForTargetDevice:", a5);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCHoldingTankManifest sharedManifest](&OBJC_CLASS___MCHoldingTankManifest, "sharedManifest"));
  id v19 = 0LL;
  unsigned __int8 v13 = [v12 addPurgatoryProfileData:v10 identifier:v11 targetDevice:a5 outError:&v19];

  id v14 = v19;
  if ((v13 & 1) != 0)
  {
    MCSendProfileListChangedNotification( -[MCInstaller _postPurgatoryFollowUpForProfileData:targetDevice:]( self,  "_postPurgatoryFollowUpForProfileData:targetDevice:",  v10,  a5));
  }

  else if (a6)
  {
    uint64_t v15 = MCInstallationErrorDomain;
    uint64_t v16 = MCErrorArray(@"ERROR_PROFILE_INSTALLATION_FAILED_TITLE");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v15,  4043LL,  v17,  v14,  MCErrorTypeFatal,  0LL));
  }

  return v13;
}

- (void)_postPurgatoryFollowUpForProfileData:(id)a3 targetDevice:(unint64_t)a4
{
  id v22 = 0LL;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](&OBJC_CLASS___MCProfile, "profileWithData:outError:", a3, &v22));
  id v7 = v22;
  if (v7)
  {
    id v8 = _MCLogObjects[9];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Profile purgatory followUp failed to create MCProfile with error: %{public}@",  buf,  0xCu);
    }
  }

  else
  {
    sub_100065010(v6);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller purgatoryTimer](self, "purgatoryTimer"));
    [v9 invalidate];

    id v10 = objc_alloc(&OBJC_CLASS___NSTimer);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  480.0));
    uint64_t v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    uint64_t v17 = sub_100048FB8;
    id v18 = &unk_1000C39B0;
    id v19 = self;
    id v20 = v6;
    unint64_t v21 = a4;
    id v12 = -[NSTimer initWithFireDate:interval:repeats:block:]( v10,  "initWithFireDate:interval:repeats:block:",  v11,  0LL,  &v15,  0.0);
    -[MCInstaller setPurgatoryTimer:](self, "setPurgatoryTimer:", v12, v15, v16, v17, v18, v19);

    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller purgatoryTimer](self, "purgatoryTimer"));
    [v13 addTimer:v14 forMode:NSRunLoopCommonModes];
  }
}

- (void)_replacePurgatoryProfilesForTargetDevice:(unint64_t)a3
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCHoldingTankManifest sharedManifest](&OBJC_CLASS___MCHoldingTankManifest, "sharedManifest"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uninstalledProfileIdentifiersForDevice:a3]);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uninstalledProfileDataWithIdentifier:v10 targetDevice:a3]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfile profileWithData:outError:]( &OBJC_CLASS___MCProfile,  "profileWithData:outError:",  v11,  0LL));
        unsigned __int8 v13 = v12;
        if (v12) {
          sub_1000650CC(v12, 2);
        }
        [v4 removeProfileDataWithIdentifier:v10 fromHoldingTankForDevice:a3];
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }
}

- (void)purgePurgatoryProfilesForTargetDevice:(unint64_t)a3
{
  int v4 = _MCLogObjects[9];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Purging purgatory profiles", buf, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCHoldingTankManifest sharedManifest](&OBJC_CLASS___MCHoldingTankManifest, "sharedManifest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uninstalledProfileIdentifiersForDevice:a3]);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v12 = _MCLogObjects[9];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v19 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Purging purgatory profile data for identifier: %@",  buf,  0xCu);
        }

        [v5 removeProfileDataWithIdentifier:v11 fromHoldingTankForDevice:a3];
      }

      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v8);
  }

  -[MCInstaller _purgatoryWorkerQueue_didPurgePurgatory:]( self,  "_purgatoryWorkerQueue_didPurgePurgatory:",  [v6 count] != 0);
}

- (void)purgePurgatoryProfileWithIdentifier:(id)a3 targetDevice:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCHoldingTankManifest sharedManifest](&OBJC_CLASS___MCHoldingTankManifest, "sharedManifest"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uninstalledProfileIdentifiersForDevice:a4]);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        unsigned __int8 v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ([v13 isEqualToString:v6])
        {
          [v7 removeProfileDataWithIdentifier:v13 fromHoldingTankForDevice:a4];
          purgatoryWorkerQueue = (dispatch_queue_s *)self->_purgatoryWorkerQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100049540;
          block[3] = &unk_1000C29D0;
          block[4] = self;
          dispatch_sync(purgatoryWorkerQueue, block);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }
}

- (void)_purgatoryWorkerQueue_didPurgePurgatory:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCInstaller purgatoryTimer](self, "purgatoryTimer"));
  [v5 invalidate];

  id v6 = -[MCInstaller setPurgatoryTimer:](self, "setPurgatoryTimer:", 0LL);
  if (v3) {
    MCSendProfileListChangedNotification(v6);
  }
}

- (id)peekPurgatoryProfileDataForTargetDevice:(unint64_t)a3
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCHoldingTankManifest sharedManifest](&OBJC_CLASS___MCHoldingTankManifest, "sharedManifest"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uninstalledProfileIdentifiersForDevice:a3]);
  if ([v5 count])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uninstalledProfileDataWithIdentifier:v6 targetDevice:a3]);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (BOOL)isCertificateReference:(id)a3 aliasedInDependencyManager:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData MCDataWithHexString:](&OBJC_CLASS___NSData, "MCDataWithHexString:", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MCKeychain canonicalPersistentReferenceForItemWithPersistentReference:inSystemKeychain:]( &OBJC_CLASS___MCKeychain,  "canonicalPersistentReferenceForItemWithPersistentReference:inSystemKeychain:",  v6,  1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 parentsInDomain:kMCDMCertificateToPayloadUUIDDependencyKey]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 MCHexString]);
  if ([v9 containsObject:v10])
  {
    os_log_t v11 = _MCLogObjects[9];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 MCHexString]);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v7 MCHexString]);
      *(_DWORD *)buf = 138543618;
      id v36 = v13;
      __int16 v37 = 2114;
      __int128 v38 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Certificate ID %{public}@ is aliased to canonical ID %{public}@, which is still referenced.",  buf,  0x16u);
    }

    BOOL v15 = 1;
  }

  else
  {
    id v28 = v10;
    id v29 = v5;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v16 = v9;
    id v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v31;
      while (2)
      {
        id v20 = 0LL;
        unint64_t v21 = v7;
        do
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v16);
          }
          id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSData MCDataWithHexString:]( &OBJC_CLASS___NSData,  "MCDataWithHexString:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)v20),  v28,  v29,  (void)v30));
          id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MCKeychain canonicalPersistentReferenceForItemWithPersistentReference:inSystemKeychain:]( &OBJC_CLASS___MCKeychain,  "canonicalPersistentReferenceForItemWithPersistentReference:inSystemKeychain:",  v22,  1LL));

          if ([v7 isEqualToData:v6])
          {
            os_log_t v23 = _MCLogObjects[9];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              id v24 = v23;
              char v25 = (void *)objc_claimAutoreleasedReturnValue([v6 MCHexString]);
              id v26 = (void *)objc_claimAutoreleasedReturnValue([v7 MCHexString]);
              *(_DWORD *)buf = 138543618;
              id v36 = v25;
              __int16 v37 = 2114;
              __int128 v38 = v26;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Certificate ID %{public}@ is aliased to non-canonical ID %{public}@, which is still referenced.",  buf,  0x16u);
            }

            BOOL v15 = 1;
            goto LABEL_17;
          }

          id v20 = (char *)v20 + 1;
          unint64_t v21 = v7;
        }

        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    BOOL v15 = 0;
LABEL_17:
    id v10 = v28;
    id v5 = v29;
  }

  return v15;
}

- (NSMutableDictionary)setAsideAccountIdentifiersByPayloadClass
{
  return self->_setAsideAccountIdentifiersByPayloadClass;
}

- (void)setSetAsideAccountIdentifiersByPayloadClass:(id)a3
{
}

- (NSMutableDictionary)setAsideDictionariesByPayloadClass
{
  return self->_setAsideDictionariesByPayloadClass;
}

- (void)setSetAsideDictionariesByPayloadClass:(id)a3
{
}

- (NSTimer)purgatoryTimer
{
  return self->_purgatoryTimer;
}

- (void)setPurgatoryTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end