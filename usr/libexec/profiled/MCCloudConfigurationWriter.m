@interface MCCloudConfigurationWriter
+ (id)sharedInstance;
+ (void)setAMFISupervisionFromCloudConfiguration:(id)a3;
- (BOOL)_activationRecordIndicatesCloudConfigurationIsAvailable;
- (BOOL)_isCloudConfigurationActuallyAvailable;
- (BOOL)_isCloudConfigurationAvailableInDEP;
- (BOOL)_validateDetails:(id)a3 outReasonWhyInvalid:(id *)a4;
- (BOOL)_writeDetails:(id)a3 toFile:(id)a4;
- (BOOL)finalizeCloudConfigurationOutError:(id *)a3;
- (BOOL)saveCloudConfigurationDetails:(id)a3 outError:(id *)a4;
- (void)faceTimeSignInAttemptDidFinish;
@end

@implementation MCCloudConfigurationWriter

+ (id)sharedInstance
{
  if (qword_1000DC1D8 != -1) {
    dispatch_once(&qword_1000DC1D8, &stru_1000C3D50);
  }
  return (id)qword_1000DC1D0;
}

- (BOOL)_activationRecordIndicatesCloudConfigurationIsAvailable
{
  return CFPreferencesGetAppBooleanValue( kMCPreferencesLockdownActivationIndicatesCloudConfigurationAvailableKey,  kMCNotBackedUpPreferencesDomain,  0LL) != 0;
}

- (BOOL)_writeDetails:(id)a3 toFile:(id)a4
{
  return [a3 MCWriteToBinaryFile:a4];
}

- (void)faceTimeSignInAttemptDidFinish
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[MDMCloudConfiguration sharedConfiguration]( &OBJC_CLASS___MDMCloudConfiguration,  "sharedConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 details]);
  id v5 = [v4 mutableCopy];

  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCAttemptedFaceTimeSignInKey];
  -[MCCloudConfigurationWriter saveCloudConfigurationDetails:outError:]( self,  "saveCloudConfigurationDetails:outError:",  v5,  0LL);
}

- (BOOL)_isCloudConfigurationActuallyAvailable
{
  return CFPreferencesGetAppBooleanValue( kMCPreferencesLockdownCloudConfigurationAvailableKey,  kMCNotBackedUpPreferencesDomain,  0LL) != 0;
}

- (BOOL)_isCloudConfigurationAvailableInDEP
{
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  v4 = (void *)objc_opt_new(&OBJC_CLASS___DEPClient);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100063548;
  v10[3] = &unk_1000C3D78;
  v12 = &v13;
  v10[4] = self;
  id v5 = v3;
  v11 = v5;
  [v4 fetchConfigurationWithCompletionBlock:v10];
  if (dispatch_semaphore_wait(v5, 0x1BF08EB000uLL))
  {
    *((_BYTE *)v14 + 24) = 1;
    v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Activation indicates device must be configured using DEP.",  v9,  2u);
    }
  }

  char v7 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (BOOL)_validateDetails:(id)a3 outReasonWhyInvalid:(id *)a4
{
  id v5 = a3;
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  v40 = sub_100063DE4;
  v41 = sub_100063DF4;
  id v42 = 0LL;
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_100063DFC;
      v34[3] = &unk_1000C3DA0;
      id v7 = v5;
      id v35 = v7;
      v36 = &v37;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_100063EBC;
      v32[3] = &unk_1000C3DC8;
      v8 = objc_retainBlock(v34);
      id v33 = v8;
      v20 = objc_retainBlock(v32);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_100063F20;
      v30[3] = &unk_1000C3DC8;
      v9 = v8;
      id v31 = v9;
      v10 = objc_retainBlock(v30);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_100063F84;
      v28[3] = &unk_1000C3DC8;
      v11 = v9;
      id v29 = v11;
      v12 = objc_retainBlock(v28);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_100063FE8;
      v25[3] = &unk_1000C3DA0;
      id v26 = v7;
      v27 = &v37;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_1000641B8;
      v23[3] = &unk_1000C3DC8;
      uint64_t v13 = objc_retainBlock(v25);
      id v24 = v13;
      v14 = objc_retainBlock(v23);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10006421C;
      v21[3] = &unk_1000C3DC8;
      uint64_t v15 = v13;
      id v22 = v15;
      char v16 = objc_retainBlock(v21);
      if (((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationNameKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationShortNameKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationDepartmentKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationAddressKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationAddressLine1Key)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationAddressLine2Key)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationAddressLine3Key)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationCityKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationRegionKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationZipCodeKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationCountryKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationPhoneKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationMagicKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationEmailKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationSupportPhoneKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationSupportEmailKey)
        && ((unsigned int (*)(void *, void))v10[2])(v10, kCCMDMProtocolVersionKey)
        && ((unsigned int (*)(void *, void))v20[2])(v20, kCCIsSupervisedKey)
        && ((unsigned int (*)(void *, void))v20[2])(v20, kCCAllowPairingKey)
        && ((unsigned int (*)(void *, void))v20[2])(v20, kCCIsMandatoryKey)
        && ((unsigned int (*)(void *, void))v20[2])(v20, kCCIsMDMUnremovable)
        && ((unsigned int (*)(void *, void))v20[2])(v20, kCCAwaitDeviceConfiguredKey)
        && ((unsigned int (*)(void *, void))v20[2])(v20, kCCDeviceConfiguredKey)
        && ((unsigned int (*)(void *, void))v20[2])(v20, kCCCloudConfigurationUICompleteKey)
        && ((unsigned int (*)(void *, void))v20[2])(v20, kCCCloudConfigurationWasAppliedKey)
        && ((unsigned int (*)(void *, void))v20[2])(v20, kCCPostSetupProfileWasInstalledKey)
        && ((unsigned int (*)(void *, void))v20[2])(v20, kCCAttemptedFaceTimeSignInKey)
        && ((unsigned int (*)(void *, void))v10[2])(v10, kCCConfigurationSourceKey)
        && ((unsigned int (*)(void *, void))v14[2])(v14, kCCAnchorCertificatesKey)
        && ((unsigned int (*)(void *, void))v14[2])(v14, kCCSupervisorHostCertificatesKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCConfigurationURLKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCConfigurationWebURLKey)
        && ((unsigned int (*)(void *, void))v16[2])(v16, kCCSkipSetupKey)
        && ((unsigned int (*)(void *, void))v20[2])(v20, kCCIsMultiUserKey)
        && ((unsigned int (*)(void *, void))v20[2])(v20, kCCAutoAdvanceSetup)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationVendorID)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCDiagnosticsUploadURL)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCUserTokenKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCMAIDUsernameKey)
        && ((unsigned int (*)(void *, void))v20[2])(v20, kCCMAIDHasCredentialKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCLanguageKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCRegionKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCLanguageScriptKey))
      {
        ((void (*)(void *, void))v10[2])(v10, kCCProvisionalEnrollmentExpiryKey);
      }

      v17 = v35;
    }

    else
    {
      v17 = (void *)v38[5];
      v38[5] = (uint64_t)@"not a dictionary";
    }
  }

  v18 = (void *)v38[5];
  if (a4 && v18) {
    *a4 = v18;
  }
  _Block_object_dispose(&v37, 8);

  return v18 == 0LL;
}

- (BOOL)saveCloudConfigurationDetails:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  if (-[MCCloudConfigurationWriter _isActivated](self, "_isActivated"))
  {
    id v81 = 0LL;
    unsigned __int8 v7 = -[MCCloudConfigurationWriter _validateDetails:outReasonWhyInvalid:]( self,  "_validateDetails:outReasonWhyInvalid:",  v6,  &v81);
    id v8 = v81;
    if ((v7 & 1) == 0)
    {
      id v22 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v83 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Cannot store cloud configuration because it is invalid: %@",  buf,  0xCu);
      }

      uint64_t v23 = MCCloudConfigErrorDomain;
      uint64_t v24 = MCErrorArray(@"CLOUD_CONFIG_INVALID_PROFILE");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v24);
      uint64_t v14 = MCErrorTypeFatal;
      uint64_t v15 = v23;
      uint64_t v16 = 33002LL;
      goto LABEL_14;
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kCCConfigurationSourceKey]);
    unsigned int v10 = [v9 intValue];

    if (v10 != 1
      && -[MCCloudConfigurationWriter _activationRecordIndicatesCloudConfigurationIsAvailable]( self,  "_activationRecordIndicatesCloudConfigurationIsAvailable")
      && -[MCCloudConfigurationWriter _isCloudConfigurationAvailableInDEP](self, "_isCloudConfigurationAvailableInDEP"))
    {
      uint64_t v11 = MCCloudConfigErrorDomain;
      uint64_t v12 = MCErrorArray(@"CLOUD_CONFIG_DEP_ONLY");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      uint64_t v14 = MCErrorTypeFatal;
      uint64_t v15 = v11;
      uint64_t v16 = 33004LL;
LABEL_14:
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v15,  v16,  v13,  v14,  0LL));

      if (a4) {
        *a4 = v25;
      }

LABEL_17:
      BOOL v21 = 0;
      goto LABEL_18;
    }

    uint64_t v27 = kCCAllowPairingKey;
    uint64_t v28 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kCCAllowPairingKey]);
    if (v28
      && (id v29 = (void *)v28,
          v30 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v27]),
          unsigned __int8 v31 = [v30 BOOLValue],
          v30,
          v29,
          (v31 & 1) == 0))
    {
      if ((MCLockdownDeletePairingRecords() & 1) == 0)
      {
        uint64_t v49 = MCCloudConfigErrorDomain;
        uint64_t v50 = MCErrorArray(@"CLOUD_CONFIG_SET_INTERNAL_ERROR");
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v50);
        uint64_t v14 = MCErrorTypeFatal;
        uint64_t v15 = v49;
        uint64_t v16 = 33015LL;
        goto LABEL_14;
      }

      uint64_t v32 = 0LL;
    }

    else
    {
      uint64_t v32 = 1LL;
    }

    if (![v6 count])
    {
      v38 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Removing cloud configuration.", buf, 2u);
      }

      id v33 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      uint64_t v39 = MCCloudConfigurationDetailsFilePath(v33);
      v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      [v33 removeItemAtPath:v40 error:0];

LABEL_55:
      MCSendCloudConfigurationDetailsChangedNotification();
      v69 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
      [v69 setBoolValue:v32 forSetting:MCFeatureHostPairingAllowed sender:@"MCCloudConfigurationWriter.SaveCloudConfiguration"];

      v70 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kCCSkipSetupKey]);
      unsigned int v71 = [v70 containsObject:kMCCCSkipSetupDiagnostics];

      if (v71)
      {
        v72 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
        uint64_t v73 = MCFeatureDiagnosticsSubmissionAllowed;
        if (![v72 BOOLSettingForFeature:MCFeatureDiagnosticsSubmissionAllowed]) {
          [v72 setBoolValue:0 forSetting:v73 sender:@"MCCloudConfigurationWriter.SaveCloudConfiguration"];
        }
      }

      v74 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kCCIsSupervisedKey]);
      unsigned int v75 = [v74 BOOLValue];

      if (v75)
      {
        id v76 =  +[MCCrypto createAndStoreNewActivationLockBypassCodeAndHashIfNeeded]( &OBJC_CLASS___MCCrypto,  "createAndStoreNewActivationLockBypassCodeAndHashIfNeeded");
        +[MCCloudConfigurationWriter setAMFISupervisionFromCloudConfiguration:]( &OBJC_CLASS___MCCloudConfigurationWriter,  "setAMFISupervisionFromCloudConfiguration:",  v6);
      }

      BOOL v21 = 1;
      goto LABEL_18;
    }

    id v33 = [v6 mutableCopy];
    uint64_t v34 = kCCIsMDMUnremovable;
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:kCCIsMDMUnremovable]);
    if ([v35 BOOLValue])
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:kCCIsSupervisedKey]);
      unsigned __int8 v37 = [v36 BOOLValue];

      if ((v37 & 1) == 0) {
        [v33 setObject:&__kCFBooleanFalse forKeyedSubscript:v34];
      }
    }

    else
    {
    }

    uint64_t v41 = kCCAwaitDeviceConfiguredKey;
    id v42 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:kCCAwaitDeviceConfiguredKey]);
    if ([v42 BOOLValue])
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:kCCIsSupervisedKey]);
      unsigned __int8 v44 = [v43 BOOLValue];

      if ((v44 & 1) == 0) {
        [v33 setObject:&__kCFBooleanFalse forKeyedSubscript:v41];
      }
    }

    else
    {
    }

    uint64_t v45 = kCCIsMultiUserKey;
    v46 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:kCCIsMultiUserKey]);
    if ([v46 BOOLValue])
    {
      if ((MCGestaltSupportsMultiUser() & 1) != 0)
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:kCCIsSupervisedKey]);
        unsigned __int8 v48 = [v47 BOOLValue];

        if ((v48 & 1) != 0) {
          goto LABEL_44;
        }
      }

      else
      {
      }

      [v33 removeObjectForKey:v45];
    }

    else
    {
    }

- (BOOL)finalizeCloudConfigurationOutError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v5 = MCCloudConfigurationSetAsideDetailsFilePath(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v11 = 0LL;
  unsigned __int8 v7 = [v4 removeItemAtPath:v6 error:&v11];
  id v8 = v11;

  if ((v7 & 1) == 0)
  {
    v9 = _MCLogObjects[8];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to remove set aside cloud configuration. Error: %{public}@",  buf,  0xCu);
    }

    if (a3) {
      *a3 = v8;
    }
  }

  return v7;
}

+ (void)setAMFISupervisionFromCloudConfiguration:(id)a3
{
  dispatch_semaphore_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:kCCConfigurationSourceKey]);
  unsigned int v4 = [v3 intValue];

  switch(v4)
  {
    case 5u:
      uint64_t v5 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        LOWORD(v7[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "AMFI/SEP setting internal supervision to mimic configurator supervision",  (uint8_t *)v7,  2u);
      }

      +[MDMProvisioningProfileTrust didSuperviseThroughConfigurator]( &OBJC_CLASS___MDMProvisioningProfileTrust,  "didSuperviseThroughConfigurator");
      break;
    case 2u:
      +[MDMProvisioningProfileTrust didSuperviseThroughConfigurator]( &OBJC_CLASS___MDMProvisioningProfileTrust,  "didSuperviseThroughConfigurator");
      break;
    case 1u:
      +[MDMProvisioningProfileTrust didSuperviseThroughADE]( &OBJC_CLASS___MDMProvisioningProfileTrust,  "didSuperviseThroughADE");
      break;
    default:
      id v6 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v7[0] = 67240192;
        v7[1] = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "AMFI/SEP ignoring supervision source: %{public}d",  (uint8_t *)v7,  8u);
      }

      break;
  }

@end