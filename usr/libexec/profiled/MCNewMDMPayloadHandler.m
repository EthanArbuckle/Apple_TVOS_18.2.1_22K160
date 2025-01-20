@interface MCNewMDMPayloadHandler
+ (id)_exchangeSyncUUIDString;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (id)_cannotCheckInErrorWithName:(id)a3;
- (id)_mdmDictWithInstaller:(id)a3 options:(id)a4 payload:(id)a5;
- (id)persistentRefForUUID:(id)a3 outError:(id *)a4;
- (id)persistentRefsForUUIDs:(id)a3 outError:(id *)a4;
- (void)_releaseDependency;
- (void)_retainDependency;
- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
- (void)removeWithInstaller:(id)a3 options:(id)a4;
- (void)setAside;
- (void)setAsideWithInstaller:(id)a3;
- (void)unsetAside;
@end

@implementation MCNewMDMPayloadHandler

+ (id)_exchangeSyncUUIDString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  [v2 getUUIDBytes:v17];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v17, 16LL));
  signed int v4 = (8 * [v3 length]) | 4;
  uint64_t v5 = (v4 / 5);
  id v6 = [v3 mutableCopy];
  [v6 appendBytes:&unk_1000DC058 length:4];
  id v7 = v6;
  v8 = (char *)[v7 bytes];
  v9 = calloc((int)v5 + 1, (int)v5);
  v10 = v9;
  if (v4 >= 5)
  {
    unsigned int v11 = 0;
    v12 = v9;
    do
    {
      unsigned int v13 = (16 * ((v8[v11 >> 3] >> (~(_BYTE)v11 & 7)) & 1)) | (8
                                                                            * ((v8[(unint64_t)(v11 + 1) >> 3] >> (~(v11 + 1) & 7)) & 1)) | (4 * ((v8[(unint64_t)(v11 + 2) >> 3] >> (~(v11 + 2) & 7)) & 1)) | (2 * ((v8[(unint64_t)(v11 + 3) >> 3] >> (~(v11 + 3) & 7)) & 1)) | (v8[(unint64_t)(v11 + 4) >> 3] >> (~(v11 + 4) & 7)) & 1;
      if (v13 >= 0xA) {
        char v14 = 55;
      }
      else {
        char v14 = 48;
      }
      *v12++ = v14 + v13;
      v11 += 5;
      --v5;
    }

    while (v5);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9));
  free(v10);

  return v15;
}

- (id)_cannotCheckInErrorWithName:(id)a3
{
  uint64_t v3 = MCMDMErrorDomain;
  uint64_t v4 = MCErrorArray(@"MDM_ERROR_CANNOT_CHECK_IN_P_NAME");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v3,  12002LL,  v5,  MCErrorTypeNeedsRetry,  a3,  0LL));

  return v6;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v11 = kMDMPasscodeKey;
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kMDMPasscodeKey]);
  unsigned int v13 = (void *)v12;
  if (v12)
  {
    id v14 = [v9 mutableCopy];
    [v14 removeObjectForKey:v11];
    id v15 = [v14 copy];

    id v9 = v15;
  }

  uint64_t v16 = MDMFilePath(v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  unsigned int v18 = [v10 fileExistsAtPath:v17];

  if (v18)
  {
    uint64_t v19 = MCMDMErrorDomain;
    uint64_t v20 = MCErrorArray(@"MDM_ERROR_ALREADY_INSTALLED");
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    uint64_t v22 = MCErrorTypeFatal;
    uint64_t v23 = v19;
    uint64_t v24 = 12001LL;
    goto LABEL_7;
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  unsigned int v26 = [v25 effectiveRestrictedBoolForSetting:MCFeatureMDMEnrollmentAllowed];

  if (v26 != 2)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v50 = (void *)objc_claimAutoreleasedReturnValue([v49 identityUUID]);
    id v103 = 0LL;
    v51 = (void *)objc_claimAutoreleasedReturnValue( -[MCNewMDMPayloadHandler persistentRefForUUID:outError:]( self,  "persistentRefForUUID:outError:",  v50,  &v103));
    id v30 = v103;

    if (v30)
    {
      BOOL v31 = 0;
      goto LABEL_36;
    }

    [v49 setIdentityPersistentID:v51];
    v52 = (void *)objc_claimAutoreleasedReturnValue([v49 serverPinningUUIDs]);
    id v102 = 0LL;
    uint64_t v53 = objc_claimAutoreleasedReturnValue( -[MCNewMDMPayloadHandler persistentRefsForUUIDs:outError:]( self,  "persistentRefsForUUIDs:outError:",  v52,  &v102));
    id v30 = v102;

    v96 = (void *)v53;
    if (v30)
    {
      BOOL v31 = 0;
LABEL_35:

LABEL_36:
      if (v30) {
        goto LABEL_8;
      }
LABEL_37:
      MDMSendDevicePostureChangedNotification();
      goto LABEL_38;
    }

    [v49 setServerPinningPersistentRefs:v53];
    v54 = (void *)objc_claimAutoreleasedReturnValue([v49 checkInPinningUUIDs]);
    id v101 = 0LL;
    uint64_t v55 = objc_claimAutoreleasedReturnValue( -[MCNewMDMPayloadHandler persistentRefsForUUIDs:outError:]( self,  "persistentRefsForUUIDs:outError:",  v54,  &v101));
    id v30 = v101;

    v94 = (void *)v55;
    if (v30)
    {
      BOOL v31 = 0;
LABEL_34:

      goto LABEL_35;
    }

    [v49 setCheckInPinningPersistentRefs:v55];
    v56 = (void *)objc_claimAutoreleasedReturnValue([v49 topic]);
    BOOL v31 = v56 != 0LL;

    if (!v56)
    {
      uint64_t v92 = MCMDMErrorDomain;
      v93 = (void *)objc_claimAutoreleasedReturnValue([v49 friendlyName]);
      uint64_t v63 = MCErrorArray(@"MDM_ERROR_MISSING_TOPIC_P_NAME");
      v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
      id v30 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v92,  12098LL,  v64,  MCErrorTypeFatal,  v93,  0LL));
LABEL_33:

      goto LABEL_34;
    }

    v90 = v10;
    id v98 = v9;
    v57 = (void *)objc_claimAutoreleasedReturnValue( -[MCNewMDMPayloadHandler _mdmDictWithInstaller:options:payload:]( self,  "_mdmDictWithInstaller:options:payload:",  v8,  v9,  v49));
    uint64_t v58 = MDMFilePath(v57);
    v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    v93 = v57;
    [v57 MCWriteToBinaryFile:v59];

    v60 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](&OBJC_CLASS___MDMConfiguration, "sharedConfiguration"));
    [v60 refreshDetailsFromDisk];

    MDMSendManagingOrgInfoChangedNotification();
    +[MDMProvisioningProfileTrust didEnrollInMDMWithPasscode:duringMigration:]( &OBJC_CLASS___MDMProvisioningProfileTrust,  "didEnrollInMDMWithPasscode:duringMigration:",  v13,  0LL);
    v61 = (void *)objc_claimAutoreleasedReturnValue([v49 checkInURLString]);
    id v89 = v8;
    if ([v61 length]) {
      uint64_t v62 = objc_claimAutoreleasedReturnValue([v49 checkInURLString]);
    }
    else {
      uint64_t v62 = objc_claimAutoreleasedReturnValue([v49 serverURLString]);
    }
    v65 = (void *)v62;
    uint64_t v66 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v62));

    v67 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v68 = (void *)objc_claimAutoreleasedReturnValue([v67 profile]);
    id v69 = +[MCKeychain copyIdentityWithPersistentID:useSystemKeychain:]( MCKeychain,  "copyIdentityWithPersistentID:useSystemKeychain:",  v51,  [v68 isInstalledForSystem]);

    v88 = v69;
    v91 = (void *)v66;
    if (v69)
    {
      v70 = (void *)objc_opt_class(&OBJC_CLASS___MCKeychain);
      v71 = (void *)objc_claimAutoreleasedReturnValue([v49 checkInPinningPersistentRefs]);
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v73 = (void *)objc_claimAutoreleasedReturnValue([v72 profile]);
      id v74 = objc_msgSend( v70,  "copyCertificatesWithPersistentIDs:useSystemKeychain:",  v71,  objc_msgSend(v73, "isInstalledForSystem"));

      v75 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](&OBJC_CLASS___MDMClient, "sharedClient"));
      unsigned int v87 = [v49 pinningRevocationCheckRequired];
      v76 = (void *)objc_claimAutoreleasedReturnValue([v49 topic]);
      unsigned int v86 = [v49 useDevelopmentAPNS];
      unsigned __int8 v85 = [v49 signMessage];
      LOBYTE(v73) = [v49 isUserEnrollment];
      v77 = (void *)objc_claimAutoreleasedReturnValue([v49 enrollmentID]);
      id v100 = 0LL;
      BYTE1(v84) = (_BYTE)v73;
      LOBYTE(v84) = v85;
      uint64_t v78 = v66;
      v79 = v74;
      objc_msgSend( v75,  "authenticateWithCheckInURL:identity:pinnedSecCertificateRefs:pinningRevocationCheckRequired:topic:useDevelopment APNS:signMessage:isUserEnrollment:enrollmentID:outError:",  v78,  v88,  v74,  v87,  v76,  v86,  v84,  v77,  &v100);
      id v30 = v100;

      CFRelease(v88);
      if (!v30)
      {
        -[MCNewMDMPayloadHandler _retainDependency](self, "_retainDependency");
        v80 = (void *)objc_claimAutoreleasedReturnValue([v49 serverCapabilities]);
        unsigned int v81 = [v80 containsObject:kMDMUserChannelCapability];

        id v8 = v89;
        if (v81)
        {
          v82 = (void *)objc_claimAutoreleasedReturnValue(+[MDMUserClient sharedClient](&OBJC_CLASS___MDMUserClient, "sharedClient"));
          [v82 scheduleTokenUpdate];
        }

        goto LABEL_32;
      }
    }

    else
    {
      v79 = (void *)objc_claimAutoreleasedReturnValue([v49 friendlyName]);
      id v30 = (id)objc_claimAutoreleasedReturnValue(-[MCNewMDMPayloadHandler _cannotCheckInErrorWithName:](self, "_cannotCheckInErrorWithName:", v79));
    }

    id v8 = v89;
LABEL_32:
    v10 = v90;

    id v9 = v98;
    BOOL v31 = 1;
    v64 = v91;
    goto LABEL_33;
  }

  uint64_t v27 = MCMDMErrorDomain;
  uint64_t v28 = MCErrorArray(@"MDM_ERROR_NOT_ALLOWED");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v28);
  uint64_t v22 = MCErrorTypeFatal;
  uint64_t v23 = v27;
  uint64_t v24 = 12088LL;
LABEL_7:
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v23,  v24,  v21,  v22,  0LL));
  id v30 = [v29 MCCopyAsPrimaryError];

  BOOL v31 = 0;
  if (!v30) {
    goto LABEL_37;
  }
LABEL_8:
  v95 = v13;
  id v97 = v9;
  v32 = v10;
  id v33 = v8;
  uint64_t v34 = MCInstallationErrorDomain;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 friendlyName]);
  uint64_t v37 = MCErrorArray(@"ERROR_PAYLOAD_FAILED_P_ID");
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v34,  4001LL,  v38,  v30,  MCErrorTypeFatal,  v36,  0LL));

  if (a6) {
    *a6 = v39;
  }
  os_log_t v40 = _MCLogObjects[0];
  BOOL v41 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR);
  if (v41)
  {
    v42 = v40;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v43 friendlyName]);
    v45 = (void *)objc_claimAutoreleasedReturnValue([v39 MCVerboseDescription]);
    *(_DWORD *)buf = 138543618;
    v105 = v44;
    __int16 v106 = 2114;
    v107 = v45;
    _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "Cannot install MDM “%{public}@”. Error: %{public}@",  buf,  0x16u);
  }

  v10 = v32;
  if (v31)
  {
    uint64_t v46 = MDMFilePath(v41);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    [v32 removeItemAtPath:v47 error:0];

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](&OBJC_CLASS___MDMConfiguration, "sharedConfiguration"));
    [v48 refreshDetailsFromDisk];

    MDMSendManagingOrgInfoChangedNotification();
  }

  id v8 = v33;
  unsigned int v13 = v95;
  id v9 = v97;
LABEL_38:

  return v30 == 0LL;
}

- (id)_mdmDictWithInstaller:(id)a3 options:(id)a4 payload:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v10 profile]);
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 identifier]);
  [v12 setObject:v14 forKey:kMDMManagingProfileIdentifierKey];

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 identityPersistentID]);
  [v12 MCSetObjectIfNotNil:v15 forKey:kMDMIdentityPersistentRefKey];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 serverPinningPersistentRefs]);
  [v12 MCSetObjectIfNotNil:v16 forKey:kMDMServerPinningCertPersistentRefsKey];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v10 checkInPinningPersistentRefs]);
  [v12 MCSetObjectIfNotNil:v17 forKey:kMDMCheckInPinningCertPersistentRefsKey];

  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 pinningRevocationCheckRequired]));
  [v12 setObject:v18 forKey:kMDMPinningRevocationCheckRequiredKey];

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v10 topic]);
  [v12 MCSetObjectIfNotNil:v19 forKey:kMDMTopicKey];

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v10 pollingIntervalMinutes]);
  [v12 MCSetObjectIfNotNil:v20 forKey:kMDMPollingIntervalKey];

  v21 = (void *)objc_claimAutoreleasedReturnValue([v10 serverURLString]);
  [v12 MCSetObjectIfNotNil:v21 forKey:kMDMServerURLKey];

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v10 checkInURLString]);
  [v12 MCSetObjectIfNotNil:v22 forKey:kMDMCheckInURLKey];

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v10 serverCapabilities]);
  [v12 MCSetObjectIfNotNil:v23 forKey:kMDMServerCapabilitiesKey];

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  [v10 accessRights]));
  [v12 setObject:v24 forKey:kMDMAccessRightsKey];

  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 useDevelopmentAPNS]));
  [v12 setObject:v25 forKey:kMDMUseDevelopmentAPNSKey];

  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString MCMakeUUID](&OBJC_CLASS___NSString, "MCMakeUUID"));
  [v12 setObject:v26 forKey:kMDMPushMagicKey];

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 signMessage]));
  [v12 setObject:v27 forKey:kMDMSignMessageKey];

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v10 enrollmentMode]);
  [v12 MCSetObjectIfNotNil:v28 forKey:kMDMEnrollmentModeKey];

  v29 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kMCInstallProfileOptionIsESSOEnrollment]);
  LOBYTE(v14) = [v29 BOOLValue];

  if ((v14 & 1) != 0)
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kMCInstallProfileOptionESSOAppITunesStoreID]);
    [v12 MCSetObjectIfNotNil:v30 forKey:kMDMRequiredAppIDForMDMKey];
    [v10 setRequiredAppIDForMDM:v30];
  }

  else
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v10 requiredAppIDForMDM]);
    [v12 MCSetObjectIfNotNil:v30 forKey:kMDMRequiredAppIDForMDMKey];
  }

  uint64_t v31 = objc_claimAutoreleasedReturnValue(+[MCMDMOptionsUtilities defaultMDMOptions](&OBJC_CLASS___MCMDMOptionsUtilities, "defaultMDMOptions"));
  if (v31) {
    [v12 setObject:v31 forKeyedSubscript:kMDMOptionsKey];
  }
  id v32 = [v11 setAsideDictionariesForPayloadHandlerClass:objc_opt_class(self)];
  id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

  v73 = (void *)v31;
  if ([v33 count] == (id)1)
  {
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 anyObject]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:kMDMPersonaKey]);
  }

  else
  {
    v35 = 0LL;
  }

  if ([v10 isUserEnrollment])
  {
    SEL v70 = a2;
    v71 = v33;
    v72 = self;
    if ([v33 count] == (id)1)
    {
      v68 = v35;
      id v36 = v9;
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v33 anyObject]);
      uint64_t v38 = kMDMEnrollmentIDKey;
      v39 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:kMDMEnrollmentIDKey]);
      uint64_t v40 = kMDMiCloudEnrollmentIDKey;
      BOOL v41 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:kMDMiCloudEnrollmentIDKey]);
      uint64_t v42 = kMDMEASEnrollmentIDKey;
      v43 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:kMDMEASEnrollmentIDKey]);

      id v9 = v36;
      v35 = v68;
    }

    else
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      v39 = (void *)objc_claimAutoreleasedReturnValue([v44 UUIDString]);

      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      uint64_t v69 = objc_claimAutoreleasedReturnValue([v45 UUIDString]);

      id v46 = [(id)objc_opt_class(self) _exchangeSyncUUIDString];
      v43 = (void *)objc_claimAutoreleasedReturnValue(v46);
      v47 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v75 = v43;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Generated new EAS Enrollment ID: %{private}@",  buf,  0xCu);
      }

      uint64_t v38 = kMDMEnrollmentIDKey;
      uint64_t v40 = kMDMiCloudEnrollmentIDKey;
      uint64_t v42 = kMDMEASEnrollmentIDKey;
      BOOL v41 = (void *)v69;
    }

    [v12 setObject:v39 forKeyedSubscript:v38];
    [v12 setObject:v41 forKeyedSubscript:v40];
    [v12 setObject:v43 forKeyedSubscript:v42];
    [v10 setEnrollmentID:v39];
    [v10 setICloudEnrollmentID:v41];
    [v10 setEasEnrollmentID:v43];
    [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:kMDMUserEnrollmentKey];
    if (v35)
    {
      uint64_t v48 = objc_claimAutoreleasedReturnValue([v10 personaID]);
      if (v48)
      {
        v49 = (void *)v48;
        v50 = (void *)objc_claimAutoreleasedReturnValue([v10 personaID]);
        unsigned __int8 v51 = [v50 isEqualToString:v35];

        if ((v51 & 1) == 0)
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
          uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v10 personaID]);
          [v52 handleFailureInMethod:v70, v72, @"MCNewMDMPayloadHandler.m", 377, @"Persona ID from the new payload (%@) and the old payload (%@) doesn't match!!!", v53, v35 object file lineNumber description];
        }
      }
    }

    id v33 = v71;
    self = v72;
  }

  uint64_t v54 = objc_claimAutoreleasedReturnValue([v10 personaID]);
  uint64_t v55 = (void *)v54;
  if (v54) {
    v56 = (void *)v54;
  }
  else {
    v56 = v35;
  }
  [v10 setPersonaID:v56];

  v57 = (void *)objc_claimAutoreleasedReturnValue([v10 personaID]);
  [v12 setObject:v57 forKeyedSubscript:kMDMPersonaKey];

  uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kMCInstallProfileOptionIsCloudProfile]);
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v58 BOOLValue]));
  [v12 setObject:v59 forKeyedSubscript:kMDMIsADEProfileKey];

  v60 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kMCInstallProfileOptionIsCloudLocked]);
  LODWORD(v58) = [v60 BOOLValue];

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v61 profile]);
  uint64_t v63 = v58 | [v62 isLocked];

  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v63));
  [v12 setObject:v64 forKeyedSubscript:kMDMIsProfileLockedKey];

  v65 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kMCInstallProfileOptionRMAccountIdentifier]);
  if (v65)
  {
    uint64_t v66 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v65, v66) & 1) != 0) {
      [v12 setObject:v65 forKeyedSubscript:kMDMRMAccountIDKey];
    }
  }

  return v12;
}

- (id)persistentRefForUUID:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 persistentIDForCertificateUUID:v6]);

  if (v8)
  {
    id v9 = v8;
  }

  else if (a4)
  {
    uint64_t v10 = MCMDMErrorDomain;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 friendlyName]);
    uint64_t v13 = MCErrorArray(@"MDM_ERROR_CERT_NOT_FOUND_P_NAME");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v10,  12005LL,  v14,  MCErrorTypeFatal,  v12,  0LL));
  }

  return v8;
}

- (id)persistentRefsForUUIDs:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
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
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_claimAutoreleasedReturnValue( -[MCNewMDMPayloadHandler persistentRefForUUID:outError:]( self,  "persistentRefForUUID:outError:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)v12),  a4,  (void)v17));
        if (!v13)
        {

          id v15 = 0LL;
          goto LABEL_11;
        }

        uint64_t v14 = (void *)v13;
        [v7 addObject:v13];

        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v15 = v7;
LABEL_11:

  return v15;
}

- (void)_retainDependency
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identityPersistentID]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v3));

  uint64_t v5 = objc_claimAutoreleasedReturnValue([v2 serverPinningPersistentRefs]);
  if (v5) {
    [v4 addObjectsFromArray:v5];
  }
  uint64_t v16 = (void *)v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 checkInPinningPersistentRefs]);
  if (v6) {
    [v4 addObjectsFromArray:v6];
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v2 UUID]);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    uint64_t v13 = kMCDMCertificateToPayloadUUIDDependencyKey;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v17 + 1) + 8 * (void)v14) MCHexString]);
        [v7 addDependent:v8 ofParent:v15 inDomain:v13];

        uint64_t v14 = (char *)v14 + 1;
      }

      while (v11 != v14);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v11);
  }
}

- (void)_releaseDependency
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identityPersistentID]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v3));

  uint64_t v5 = objc_claimAutoreleasedReturnValue([v2 serverPinningPersistentRefs]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 serverPinningPersistentRefs]);

  if (v6) {
    [v4 addObjectsFromArray:v5];
  }
  __int128 v18 = (void *)v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v2 checkInPinningPersistentRefs]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v2 checkInPinningPersistentRefs]);

  if (v8) {
    [v4 addObjectsFromArray:v7];
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v2 UUID]);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v11 = v4;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    uint64_t v15 = kMCDMCertificateToPayloadUUIDDependencyKey;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v19 + 1) + 8 * (void)v16) MCHexString]);
        [v9 removeDependent:v10 fromParent:v17 inDomain:v15];

        uint64_t v16 = (char *)v16 + 1;
      }

      while (v13 != v16);
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v13);
  }
}

- (void)setAside
{
  uint64_t v3 = MDMFilePath(self);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v4));
  id v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "MCSafePropertyListWithData:options:format:error:",  v5,  0LL,  0LL,  0LL));
  setAsideDictionary = self->_setAsideDictionary;
  self->_setAsideDictionary = v6;

  id v8 = (NSString *)objc_claimAutoreleasedReturnValue( +[MCKeychain stringFromService:account:label:description:useSystemKeychain:outError:]( &OBJC_CLASS___MCKeychain,  "stringFromService:account:label:description:useSystemKeychain:outError:",  kMDMServiceKey,  kMDMEscrowSecretAccountKey,  0LL,  0LL,  0LL,  0LL));
  setAsideEscrowSecret = self->_setAsideEscrowSecret;
  self->_setAsideEscrowSecret = v8;

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v11 = MDMFilePath(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v19 = 0LL;
  [v10 removeItemAtPath:v12 error:&v19];
  id v13 = v19;

  if (v13)
  {
    os_log_t v14 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = v14;
      uint64_t v16 = MDMFilePath(v15);
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      *(_DWORD *)buf = 136315650;
      __int128 v21 = "-[MCNewMDMPayloadHandler setAside]";
      __int16 v22 = 2112;
      uint64_t v23 = v17;
      __int16 v24 = 2112;
      id v25 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s: Failed to remove item at path: %@ with error: %@",  buf,  0x20u);
    }
  }

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](&OBJC_CLASS___MDMConfiguration, "sharedConfiguration"));
  [v18 refreshDetailsFromDisk];

  MDMSendManagingOrgInfoChangedNotification();
  self->_setAside = 1;
  -[MCNewMDMPayloadHandler _releaseDependency](self, "_releaseDependency");
}

- (void)setAsideWithInstaller:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MCNewMDMPayloadHandler;
  -[MCNewPayloadHandler setAsideWithInstaller:](&v12, "setAsideWithInstaller:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 enrollmentID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v7, kMDMEnrollmentIDKey);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 iCloudEnrollmentID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v8, kMDMiCloudEnrollmentIDKey);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 easEnrollmentID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, kMDMEASEnrollmentIDKey);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 personaID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v10, kMDMPersonaKey);

  if (-[NSMutableDictionary count](v6, "count"))
  {
    id v11 = -[NSMutableDictionary copy](v6, "copy");
    [v4 addSetAsideDictionary:v11 forPayloadHandlerClass:objc_opt_class(self)];
  }
}

- (void)unsetAside
{
  if (self->_setAside)
  {
    setAsideDictionary = self->_setAsideDictionary;
    uint64_t v4 = MDMFilePath(self);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    -[NSMutableDictionary MCWriteToBinaryFile:](setAsideDictionary, "MCWriteToBinaryFile:", v5);

    id v6 = self->_setAsideDictionary;
    self->_setAsideDictionary = 0LL;

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](&OBJC_CLASS___MDMConfiguration, "sharedConfiguration"));
    [v7 refreshDetailsFromDisk];

    setAsideEscrowSecret = self->_setAsideEscrowSecret;
    if (setAsideEscrowSecret)
    {
      LOWORD(v11) = 256;
      +[MCKeychain setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:]( &OBJC_CLASS___MCKeychain,  "setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:",  setAsideEscrowSecret,  kMDMServiceKey,  kMDMEscrowSecretAccountKey,  0LL,  0LL,  kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate,  0LL,  v11,  0LL);
      id v9 = self->_setAsideEscrowSecret;
      self->_setAsideEscrowSecret = 0LL;
    }

    -[MCNewMDMPayloadHandler _retainDependency](self, "_retainDependency");
    self->_setAside = 0;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](&OBJC_CLASS___MDMClient, "sharedClient"));
    [v10 notifyNewConfiguration];

    if (+[DMCMultiUserModeUtilities inSharediPadUserSession]( &OBJC_CLASS___DMCMultiUserModeUtilities,  "inSharediPadUserSession"))
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue(+[MDMUserClient sharedClient](&OBJC_CLASS___MDMUserClient, "sharedClient"));
      [v12 notifyNewConfiguration];
    }
  }

- (void)removeWithInstaller:(id)a3 options:(id)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( [a4 objectForKeyedSubscript:kMCRemoveProfileOptionRemovedDueToMigrationFromOtherDevice]);
  unsigned int v6 = [v5 BOOLValue];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](&OBJC_CLASS___MDMConfiguration, "sharedConfiguration"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 rmAccountID]);

  if (!self->_setAside)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    id v10 = &MailAccountHostname_ptr;
    if ([v9 checkOutWhenRemoved])
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identityPersistentID]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 profile]);
      id v14 = +[MCKeychain copyIdentityWithPersistentID:useSystemKeychain:]( MCKeychain,  "copyIdentityWithPersistentID:useSystemKeychain:",  v11,  [v13 isInstalledForSystem]);

      if (v14)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 topic]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 checkInURLString]);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v16));

        if (v17)
        {
          __int128 v18 = (void *)objc_opt_class(&OBJC_CLASS___MCKeychain);
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 checkInPinningPersistentRefs]);
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
          v39 = v15;
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 profile]);
          id v38 = objc_msgSend( v18,  "copyCertificatesWithPersistentIDs:useSystemKeychain:",  v19,  objc_msgSend(v21, "isInstalledForSystem"));

          __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](&OBJC_CLASS___MDMClient, "sharedClient"));
          [v9 pinningRevocationCheckRequired];
          [v9 signMessage];
          LOBYTE(v18) = [v9 isUserEnrollment];
          uint64_t v23 = objc_claimAutoreleasedReturnValue([v9 enrollmentID]);
          __int16 v24 = v17;
          id v25 = (void *)v23;
          id v41 = 0LL;
          LOBYTE(v37) = (_BYTE)v18;
          uint64_t v40 = v24;
          objc_msgSend( v22,  "checkOutCheckInURL:identity:pinnedSecCertificateRefs:pinningRevocationCheckRequired:topic:signMessage:isUser Enrollment:enrollmentID:outError:",  v37,  v23,  &v41);
          id v26 = v41;

          if (v26)
          {
            os_log_t v27 = _MCLogObjects[1];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              uint64_t v28 = v27;
              v29 = (void *)objc_claimAutoreleasedReturnValue([v26 MCVerboseDescription]);
              *(_DWORD *)buf = 138543362;
              v43 = v29;
              _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Cannot check out. Error: %{public}@",  buf,  0xCu);
            }
          }

          uint64_t v15 = v39;
          __int128 v17 = v40;
        }

        else
        {
          uint64_t v31 = _MCLogObjects[1];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Cannot check out because the Check-In URL is invalid.",  buf,  2u);
          }
        }

        CFRelease(v14);

        id v10 = &MailAccountHostname_ptr;
      }

      else
      {
        id v30 = _MCLogObjects[1];
        id v10 = &MailAccountHostname_ptr;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Cannot check out because the MDM identity cannot be retrieved.",  buf,  2u);
        }
      }
    }

    +[MDMProvisioningProfileTrust didUnenrollFromMDM](&OBJC_CLASS___MDMProvisioningProfileTrust, "didUnenrollFromMDM");
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v10[117] sharedClient]);
    [v32 uprootMDM];

    id v33 = _MCLogObjects[1];
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v34)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Preserving unlock token (if any) because we removed the MDM profile through migration",  buf,  2u);
      }
    }

    else
    {
      if (v34)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Deleting unlock token (if any) because we removed the MDM profile",  buf,  2u);
      }

      uint64_t v35 = MCKeybagDeleteMDMEscrowSecret();
      MCKeybagDeleteMDMEscrowData(v35);
    }

    -[MCNewMDMPayloadHandler _releaseDependency](self, "_releaseDependency");
    setAsideDictionary = self->_setAsideDictionary;
    self->_setAsideDictionary = 0LL;
  }
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](&OBJC_CLASS___MDMClient, "sharedClient", a3, a4));
  [v4 notifyNewConfiguration];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](&OBJC_CLASS___MDMClient, "sharedClient"));
  [v5 scheduleTokenUpdate];

  if (+[DMCMultiUserModeUtilities inSharediPadUserSession]( &OBJC_CLASS___DMCMultiUserModeUtilities,  "inSharediPadUserSession"))
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[MDMUserClient sharedClient](&OBJC_CLASS___MDMUserClient, "sharedClient"));
    [v6 notifyNewConfiguration];
  }

- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](&OBJC_CLASS___MDMClient, "sharedClient", a3, a4));
  [v4 notifyNewConfiguration];

  if (+[DMCMultiUserModeUtilities inSharediPadUserSession]( &OBJC_CLASS___DMCMultiUserModeUtilities,  "inSharediPadUserSession"))
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[MDMUserClient sharedClient](&OBJC_CLASS___MDMUserClient, "sharedClient"));
    [v5 notifyNewConfiguration];
  }

- (void).cxx_destruct
{
}

@end