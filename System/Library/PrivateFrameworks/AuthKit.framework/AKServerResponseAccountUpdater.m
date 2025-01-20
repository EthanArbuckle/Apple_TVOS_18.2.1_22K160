@interface AKServerResponseAccountUpdater
- (AKAccountManager)accountManager;
- (AKServerResponseAccountUpdater)init;
- (AKTokenManager)tokenManager;
- (AKUserInfoController)userInfoController;
- (BOOL)_saveAccount:(id)a3 userInfoDictionary:(id)a4 error:(id *)a5;
- (BOOL)updateAuthKitAccount:(id)a3 withServerResponse:(id)a4 context:(id)a5 error:(id *)a6;
- (void)_postUserInfoChangedNotificationWithPayload:(id)a3;
- (void)_updateAccountInUseForAccount:(id)a3 withContext:(id)a4;
- (void)_updateAccountInfoPropertiesForAccount:(id)a3 withServerResponse:(id)a4 userInfoDictionary:(id)a5;
- (void)_updateAppleAccountSecurityPropertiesForAccount:(id)a3 withServerResponse:(id)a4 userInfoDictionary:(id)a5;
- (void)_updateBeneficiaryPropertiesForAccount:(id)a3 withServerResponse:(id)a4;
- (void)_updateChildPasscodePropertiesForAccount:(id)a3 withServerResponse:(id)a4;
- (void)_updateCustodianPropertiesForAccount:(id)a3 withServerResponse:(id)a4;
- (void)_updateMaidPropertiesForAccount:(id)a3 withServerResponse:(id)a4;
- (void)_updatePasskeyPropertiesForAccount:(id)a3 withServerResponse:(id)a4;
- (void)_updateRemainingPropertiesForAccount:(id)a3 withServerResponse:(id)a4;
- (void)_updateSecurityLevelForAccount:(id)a3 withServerResponse:(id)a4 userInfoDictionary:(id)a5;
- (void)_updateTelemetryDeviceSessionIDForAccount:(id)a3 withContext:(id)a4;
- (void)_updateTokensForAccount:(id)a3 withServerResponse:(id)a4 context:(id)a5;
- (void)_updateUserInfoPropertiesForAccount:(id)a3 withServerResponse:(id)a4;
- (void)setAccountManager:(id)a3;
- (void)setTokenManager:(id)a3;
- (void)setUserInfoController:(id)a3;
@end

@implementation AKServerResponseAccountUpdater

- (AKServerResponseAccountUpdater)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AKServerResponseAccountUpdater;
  v2 = -[AKServerResponseAccountUpdater init](&v10, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    accountManager = v2->_accountManager;
    v2->_accountManager = (AKAccountManager *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[AKTokenManager sharedInstance](&OBJC_CLASS___AKTokenManager, "sharedInstance"));
    tokenManager = v2->_tokenManager;
    v2->_tokenManager = (AKTokenManager *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[AKUserInfoController sharedController](&OBJC_CLASS___AKUserInfoController, "sharedController"));
    userInfoController = v2->_userInfoController;
    v2->_userInfoController = (AKUserInfoController *)v7;
  }

  return v2;
}

- (BOOL)updateAuthKitAccount:(id)a3 withServerResponse:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  -[AKServerResponseAccountUpdater _updateAccountInfoPropertiesForAccount:withServerResponse:userInfoDictionary:]( self,  "_updateAccountInfoPropertiesForAccount:withServerResponse:userInfoDictionary:",  v10,  v12,  v13);
  -[AKServerResponseAccountUpdater _updateUserInfoPropertiesForAccount:withServerResponse:]( self,  "_updateUserInfoPropertiesForAccount:withServerResponse:",  v10,  v12);
  -[AKServerResponseAccountUpdater _updateSecurityLevelForAccount:withServerResponse:userInfoDictionary:]( self,  "_updateSecurityLevelForAccount:withServerResponse:userInfoDictionary:",  v10,  v12,  v13);
  -[AKServerResponseAccountUpdater _updateMaidPropertiesForAccount:withServerResponse:]( self,  "_updateMaidPropertiesForAccount:withServerResponse:",  v10,  v12);
  -[AKServerResponseAccountUpdater _updateAppleAccountSecurityPropertiesForAccount:withServerResponse:userInfoDictionary:]( self,  "_updateAppleAccountSecurityPropertiesForAccount:withServerResponse:userInfoDictionary:",  v10,  v12,  v13);
  -[AKServerResponseAccountUpdater _updatePasskeyPropertiesForAccount:withServerResponse:]( self,  "_updatePasskeyPropertiesForAccount:withServerResponse:",  v10,  v12);
  -[AKServerResponseAccountUpdater _updateChildPasscodePropertiesForAccount:withServerResponse:]( self,  "_updateChildPasscodePropertiesForAccount:withServerResponse:",  v10,  v12);
  -[AKServerResponseAccountUpdater _updateCustodianPropertiesForAccount:withServerResponse:]( self,  "_updateCustodianPropertiesForAccount:withServerResponse:",  v10,  v12);
  -[AKServerResponseAccountUpdater _updateBeneficiaryPropertiesForAccount:withServerResponse:]( self,  "_updateBeneficiaryPropertiesForAccount:withServerResponse:",  v10,  v12);
  -[AKServerResponseAccountUpdater _updateTokensForAccount:withServerResponse:context:]( self,  "_updateTokensForAccount:withServerResponse:context:",  v10,  v12,  v11);
  -[AKServerResponseAccountUpdater _updateTelemetryDeviceSessionIDForAccount:withContext:]( self,  "_updateTelemetryDeviceSessionIDForAccount:withContext:",  v10,  v11);
  -[AKServerResponseAccountUpdater _updateAccountInUseForAccount:withContext:]( self,  "_updateAccountInUseForAccount:withContext:",  v10,  v11);

  -[AKServerResponseAccountUpdater _updateRemainingPropertiesForAccount:withServerResponse:]( self,  "_updateRemainingPropertiesForAccount:withServerResponse:",  v10,  v12);
  [v10 setAuthenticated:1];
  BOOL v14 = -[AKServerResponseAccountUpdater _saveAccount:userInfoDictionary:error:]( self,  "_saveAccount:userInfoDictionary:error:",  v10,  v13,  a6);
  if (v14 && [v13 count])
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager altDSIDForAccount:](self->_accountManager, "altDSIDForAccount:", v10));
    [v13 setObject:v15 forKeyedSubscript:AKUserInfoChangedAltDSIDKey];

    -[AKServerResponseAccountUpdater _postUserInfoChangedNotificationWithPayload:]( self,  "_postUserInfoChangedNotificationWithPayload:",  v13);
  }

  return v14;
}

- (void)_updateAccountInfoPropertiesForAccount:(id)a3 withServerResponse:(id)a4 userInfoDictionary:(id)a5
{
  id v24 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 altDSID]);

  if (v10)
  {
    accountManager = self->_accountManager;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 altDSID]);
    -[AKAccountManager setAltDSID:forAccount:](accountManager, "setAltDSID:forAccount:", v12, v24);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 dsid]);

  if (v13)
  {
    BOOL v14 = self->_accountManager;
    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 dsid]);
    -[AKAccountManager setDSID:forAccount:](v14, "setDSID:forAccount:", v15, v24);
  }

  id v16 = -[AKAccountManager authenticationModeForAccount:](self->_accountManager, "authenticationModeForAccount:", v24);
  id v17 = [v8 authMode];
  if (v17)
  {
    id v18 = v17;
    -[AKAccountManager setAuthenticationMode:forAccount:]( self->_accountManager,  "setAuthenticationMode:forAccount:",  v17,  v24);
    if (v16)
    {
      if (v18 != v16)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v18));
        [v9 setObject:v19 forKeyedSubscript:AKUserInfoChangedAuthModeKey];
      }
    }
  }

  if ([v8 phoneAsAppleID]) {
    -[AKAccountManager setPhoneAsAppleID:forAccount:]( self->_accountManager,  "setPhoneAsAppleID:forAccount:",  [v8 phoneAsAppleID],  v24);
  }
  unsigned int v20 = -[AKAccountManager demoAccountForAccount:](self->_accountManager, "demoAccountForAccount:", v24);
  if (v20 != [v8 isDemoAccount]) {
    -[AKAccountManager setDemoAccount:forAccount:]( self->_accountManager,  "setDemoAccount:forAccount:",  [v8 isDemoAccount],  v24);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue([v8 additionalInfo]);

  if (v21)
  {
    v22 = self->_accountManager;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v8 additionalInfo]);
    -[AKAccountManager setAdditionalInfo:forAccount:](v22, "setAdditionalInfo:forAccount:", v23, v24);
  }
}

- (void)_updateUserInfoPropertiesForAccount:(id)a3 withServerResponse:(id)a4
{
  id v31 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstName]);

  if (v7)
  {
    accountManager = self->_accountManager;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 firstName]);
    -[AKAccountManager setGivenName:forAccount:](accountManager, "setGivenName:forAccount:", v9, v31);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 lastName]);

  if (v10)
  {
    id v11 = self->_accountManager;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 lastName]);
    -[AKAccountManager setFamilyName:forAccount:](v11, "setFamilyName:forAccount:", v12, v31);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 primaryEmail]);

  if (v13)
  {
    BOOL v14 = self->_accountManager;
    v15 = (void *)objc_claimAutoreleasedReturnValue([v6 primaryEmail]);
    -[AKAccountManager setPrimaryEmailAddress:forAccount:](v14, "setPrimaryEmailAddress:forAccount:", v15, v31);
  }

  -[AKAccountManager setVerifiedPrimaryEmail:forAccount:]( self->_accountManager,  "setVerifiedPrimaryEmail:forAccount:",  [v6 primaryEmailVetted],  v31);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 aliases]);

  if (v16)
  {
    id v17 = self->_accountManager;
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 aliases]);
    -[AKAccountManager setAliases:forAccount:](v17, "setAliases:forAccount:", v18, v31);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v6 appleIDCountryCode]);

  if (v19)
  {
    unsigned int v20 = self->_accountManager;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v6 appleIDCountryCode]);
    -[AKAccountManager setAppleIDCountryCode:forAccount:](v20, "setAppleIDCountryCode:forAccount:", v21, v31);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([v6 birthYear]);

  if (v22)
  {
    v23 = self->_accountManager;
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v6 birthYear]);
    -[AKAccountManager setBirthYear:forAccount:](v23, "setBirthYear:forAccount:", v24, v31);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v6 ageOfMajority]);

  if (v25)
  {
    v26 = self->_accountManager;
    v27 = (void *)objc_claimAutoreleasedReturnValue([v6 ageOfMajority]);
    -[AKAccountManager setAgeOfMajority:forAccount:](v26, "setAgeOfMajority:forAccount:", v27, v31);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue([v6 canAttestAge]);

  if (v28)
  {
    v29 = self->_accountManager;
    v30 = (void *)objc_claimAutoreleasedReturnValue([v6 canAttestAge]);
    -[AKAccountManager setCanAttestAge:forAccount:](v29, "setCanAttestAge:forAccount:", v30, v31);
  }

  -[AKAccountManager setUserUnderage:forAccount:]( self->_accountManager,  "setUserUnderage:forAccount:",  [v6 isUnderAgeOfMajority],  v31);
  if ([v6 isUnderAgeOfMajority]) {
    -[AKAccountManager setIsSiwaEnabled:forChildAccount:]( self->_accountManager,  "setIsSiwaEnabled:forChildAccount:",  [v6 isSiwaForChildEnabled],  v31);
  }
  -[AKAccountManager setUserIsSenior:forAccount:]( self->_accountManager,  "setUserIsSenior:forAccount:",  [v6 isSenior],  v31);
}

- (void)_updateSecurityLevelForAccount:(id)a3 withServerResponse:(id)a4 userInfoDictionary:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  accountManager = self->_accountManager;
  id v10 = a4;
  id v11 = -[AKAccountManager securityLevelForAccount:](accountManager, "securityLevelForAccount:", v14);
  id v12 = [v10 appleIDSecurityLevel];

  if (v12)
  {
    -[AKAccountManager setSecurityLevel:forAccount:](self->_accountManager, "setSecurityLevel:forAccount:", v12, v14);
    if (v11)
    {
      if (v12 != v11)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v12));
        [v8 setObject:v13 forKeyedSubscript:AKUserInfoChangedSecurityLevelKey];
      }
    }
  }
}

- (void)_updateMaidPropertiesForAccount:(id)a3 withServerResponse:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 hasMDM]);

  if (v7)
  {
    accountManager = self->_accountManager;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 hasMDM]);
    -[AKAccountManager setHasMDM:forAccount:]( accountManager,  "setHasMDM:forAccount:",  [v9 BOOLValue],  v17);
  }

  id v10 = [v6 managedOrganizationType];
  if (v10) {
    -[AKAccountManager setManagedOrganizationType:forAccount:]( self->_accountManager,  "setManagedOrganizationType:forAccount:",  v10,  v17);
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 managedOrganizationName]);

  if (v11)
  {
    id v12 = self->_accountManager;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 managedOrganizationName]);
    -[AKAccountManager setManagedOrganizationName:forAccount:](v12, "setManagedOrganizationName:forAccount:", v13, v17);
  }

  unsigned int v14 = +[AKFeatureManager isEnforceMDMPolicyEnabled]( &OBJC_CLASS___AKFeatureManager,  "isEnforceMDMPolicyEnabled");
  if (v17 && v14 && [v6 isMdmInfoRequired]) {
    -[AKAccountManager setMarkedForSignOut:forAccount:]( self->_accountManager,  "setMarkedForSignOut:forAccount:",  0LL,  v17);
  }
  unsigned int v15 = -[AKAccountManager mdmInformationRequiredForAccount:]( self->_accountManager,  "mdmInformationRequiredForAccount:");
  id v16 = [v6 isMdmInfoRequired];
  if (v15 != (_DWORD)v16) {
    -[AKAccountManager setMDMInformationRequired:forAccount:]( self->_accountManager,  "setMDMInformationRequired:forAccount:",  v16,  v17);
  }
}

- (void)_updateAppleAccountSecurityPropertiesForAccount:(id)a3 withServerResponse:(id)a4 userInfoDictionary:(id)a5
{
  id v29 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 adpCohort]);

  if (v10)
  {
    accountManager = self->_accountManager;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 adpCohort]);
    -[AKAccountManager setADPCohort:forAccount:](accountManager, "setADPCohort:forAccount:", v12, v29);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 webAccessEnabled]);

  if (v13)
  {
    unsigned int v14 = self->_accountManager;
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v8 webAccessEnabled]);
    -[AKAccountManager setWebAccessEnabled:forAccount:]( v14,  "setWebAccessEnabled:forAccount:",  [v15 BOOLValue],  v29);
  }

  if ([v8 isFidoAuthRequired]) {
    -[AKAccountManager setFido:forAccount:]( self->_accountManager,  "setFido:forAccount:",  [v8 isFidoAuthRequired],  v29);
  }
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 hasModernRecoveryKey]);

  if (v16)
  {
    id v17 = self->_accountManager;
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 hasModernRecoveryKey]);
    -[AKAccountManager setHasModernRecoveryKey:forAccount:]( v17,  "setHasModernRecoveryKey:forAccount:",  [v18 BOOLValue],  v29);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v8 configurationInfo]);

  id v20 = v29;
  if (v19)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[AKUserConfigController sharedController]( &OBJC_CLASS___AKUserConfigController,  "sharedController",  v29));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v8 configurationInfo]);
    [v21 updateUserConfigForAccount:v29 configurationInfo:v22];

    id v20 = v29;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager configDataVersionForAccount:]( self->_accountManager,  "configDataVersionForAccount:",  v20));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v8 configDataVersion]);
  v25 = v24;
  if (v24 && (!v23 || ([v24 isEqual:v23] & 1) == 0))
  {
    v26 = self->_accountManager;
    v27 = (void *)objc_claimAutoreleasedReturnValue([v8 configDataVersion]);
    -[AKAccountManager setConfigDataVersion:forAccount:](v26, "setConfigDataVersion:forAccount:", v27, v29);

    v28 = (void *)objc_claimAutoreleasedReturnValue([v8 configDataVersion]);
    [v9 setObject:v28 forKeyedSubscript:AKConfigDataVersion];
  }
}

- (void)_updateCustodianPropertiesForAccount:(id)a3 withServerResponse:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 canBeCustodian]);

  if (v7)
  {
    accountManager = self->_accountManager;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 canBeCustodian]);
    -[AKAccountManager setCanBeCustodian:forAccount:]( accountManager,  "setCanBeCustodian:forAccount:",  [v9 BOOLValue],  v26);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 canHaveCustodian]);

  if (v10)
  {
    id v11 = self->_accountManager;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 canHaveCustodian]);
    -[AKAccountManager setCanHaveCustodian:forAccount:]( v11,  "setCanHaveCustodian:forAccount:",  [v12 BOOLValue],  v26);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 custodianEnabled]);

  if (v13)
  {
    unsigned int v14 = self->_accountManager;
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v6 custodianEnabled]);
    -[AKAccountManager setCustodianEnabled:forAccount:]( v14,  "setCustodianEnabled:forAccount:",  [v15 BOOLValue],  v26);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 custodianLastModified]);

  id v17 = v26;
  if (v16)
  {
    id v18 = self->_accountManager;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v6 custodianLastModified]);
    -[AKAccountManager setCustodianLastModified:forAccount:](v18, "setCustodianLastModified:forAccount:", v19, v26);

    id v17 = v26;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager custodianInfosForAccount:](self->_accountManager, "custodianInfosForAccount:", v17));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v20));

  v22 = (void *)objc_claimAutoreleasedReturnValue([v6 custodianInfos]);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v22));

  if (v23 && ([v23 isEqualToSet:v21] & 1) == 0)
  {
    id v24 = self->_accountManager;
    v25 = (void *)objc_claimAutoreleasedReturnValue([v6 custodianInfos]);
    -[AKAccountManager setCustodianInfos:forAccount:](v24, "setCustodianInfos:forAccount:", v25, v26);
  }
}

- (void)_updateBeneficiaryPropertiesForAccount:(id)a3 withServerResponse:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 beneficiaryIdentifier]);

  if (v7) {
    -[AKAccountManager setBeneficiary:forAccount:](self->_accountManager, "setBeneficiary:forAccount:", 1LL, v28);
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 canBeBeneficiary]);

  if (v8)
  {
    accountManager = self->_accountManager;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 canBeBeneficiary]);
    -[AKAccountManager setCanBeBeneficiary:forAccount:]( accountManager,  "setCanBeBeneficiary:forAccount:",  [v10 BOOLValue],  v28);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 canHaveBeneficiary]);

  if (v11)
  {
    id v12 = self->_accountManager;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 canHaveBeneficiary]);
    -[AKAccountManager setCanHaveBeneficiary:forAccount:]( v12,  "setCanHaveBeneficiary:forAccount:",  [v13 BOOLValue],  v28);
  }

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 beneficiaryLastModified]);

  if (v14)
  {
    unsigned int v15 = self->_accountManager;
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 beneficiaryLastModified]);
    -[AKAccountManager setBeneficiaryLastModified:forAccount:](v15, "setBeneficiaryLastModified:forAccount:", v16, v28);
  }

  uint64_t v17 = objc_claimAutoreleasedReturnValue([v6 beneficiaryInfo]);
  if (v17)
  {
    id v18 = (void *)v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v6 beneficiaryInfo]);
    id v20 = [v19 count];

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager beneficiaryInfoForAccount:]( self->_accountManager,  "beneficiaryInfoForAccount:",  v28));
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[AKBeneficiaryUpdater removeWrappedKeyFrom:]( &OBJC_CLASS___AKBeneficiaryUpdater,  "removeWrappedKeyFrom:",  v21));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v22));

      id v24 = (void *)objc_claimAutoreleasedReturnValue([v6 beneficiaryInfo]);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v24));

      if (v25 && ([v25 isEqualToSet:v23] & 1) == 0)
      {
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v6 beneficiaryInfo]);
        v27 = (void *)objc_claimAutoreleasedReturnValue( +[AKBeneficiaryUpdater saveWrappedKeyInKeychain:]( &OBJC_CLASS___AKBeneficiaryUpdater,  "saveWrappedKeyInKeychain:",  v26));

        -[AKAccountManager setBeneficiaryInfo:forAccount:]( self->_accountManager,  "setBeneficiaryInfo:forAccount:",  v27,  v28);
      }
    }
  }
}

- (void)_updatePasskeyPropertiesForAccount:(id)a3 withServerResponse:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 passkeyEligible]);

  if (v7)
  {
    accountManager = self->_accountManager;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 passkeyEligible]);
    -[AKAccountManager setPasskeyEligible:forAccount:]( accountManager,  "setPasskeyEligible:forAccount:",  [v9 BOOLValue],  v13);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 passkeyPresent]);

  if (v10)
  {
    id v11 = self->_accountManager;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 passkeyPresent]);
    -[AKAccountManager setPasskeyPresent:forAccount:]( v11,  "setPasskeyPresent:forAccount:",  [v12 BOOLValue],  v13);
  }
}

- (void)_updateChildPasscodePropertiesForAccount:(id)a3 withServerResponse:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 passcodeAuthEnabled]);

  if (v7)
  {
    accountManager = self->_accountManager;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 passcodeAuthEnabled]);
    -[AKAccountManager setPasscodeAuthEnabled:forAccount:]( accountManager,  "setPasscodeAuthEnabled:forAccount:",  [v9 BOOLValue],  v16);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 passcodeAuth]);

  if (v10)
  {
    id v11 = self->_accountManager;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 passcodeAuth]);
    -[AKAccountManager setPasscodeAuth:forAccount:]( v11,  "setPasscodeAuth:forAccount:",  [v12 BOOLValue],  v16);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 askToBuy]);

  if (v13)
  {
    unsigned int v14 = self->_accountManager;
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v6 askToBuy]);
    -[AKAccountManager setAskToBuy:forAccount:](v14, "setAskToBuy:forAccount:", [v15 BOOLValue], v16);
  }
}

- (void)_updateTokensForAccount:(id)a3 withServerResponse:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v94 = 0LL;
  id v10 = (ACAccountCredential *)objc_claimAutoreleasedReturnValue([v7 credentialWithError:&v94]);
  id v11 = v94;
  id v12 = v11;
  if (!v10)
  {
    uint64_t v13 = _AKLogSystem(v11);
    unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10013FAF8(v14);
    }

    id v10 = objc_alloc_init(&OBJC_CLASS___ACAccountCredential);
  }

  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v8 masterToken]);
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 externalizedVersionString]);

  if (v16)
  {
    uint64_t v18 = _AKLogSystem(v17);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v96 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Server auth response contained a master token, saving to the credential for account (%@)",  buf,  0xCu);
    }

    -[ACAccountCredential setToken:](v10, "setToken:", v16);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v8 heartbeatToken]);
  uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 stringValue]);

  v91 = (void *)v21;
  v92 = (void *)v16;
  if (v21)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
    unsigned int v24 = [v23 isTokenCacheEnabled];

    uint64_t v26 = _AKLogSystem(v25);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v24)
    {
      if (v28)
      {
        *(_DWORD *)buf = 138412290;
        id v96 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Server auth response contained a HB token, saving via AKTokenManager for account (%@)",  buf,  0xCu);
      }

      tokenManager = self->_tokenManager;
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 heartbeatToken]);
      uint64_t v31 = ACHeartbeatTokenKey;
      v32 = (void *)objc_claimAutoreleasedReturnValue([v8 altDSID]);
      -[AKTokenManager updateToken:identifier:altDSID:account:credential:error:]( tokenManager,  "updateToken:identifier:altDSID:account:credential:error:",  v30,  v31,  v32,  v7,  v10,  0LL);
    }

    else
    {
      if (v28)
      {
        *(_DWORD *)buf = 138412290;
        id v96 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Server auth response contained a HB token, saving to the credential for account (%@)",  buf,  0xCu);
      }

      accountManager = self->_accountManager;
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 heartbeatToken]);
      -[AKAccountManager setToken:tokenID:account:credential:]( accountManager,  "setToken:tokenID:account:credential:",  v30,  ACHeartbeatTokenKey,  v7,  v10);
    }
  }

  else
  {
    uint64_t v33 = _AKLogSystem(v22);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10013FAC8(v30, v34, v35, v36, v37, v38, v39, v40);
    }
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue([v8 continuationToken]);
  v43 = (void *)objc_claimAutoreleasedReturnValue([v42 stringValue]);

  if (v43)
  {
    -[AKAccountManager clearDeviceRemovalReasonFromAccount:]( self->_accountManager,  "clearDeviceRemovalReasonFromAccount:",  v7);
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
    unsigned int v46 = [v45 isTokenCacheEnabled];

    uint64_t v48 = _AKLogSystem(v47);
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
    if (v46)
    {
      v51 = v12;
      id v52 = v9;
      if (v50)
      {
        *(_DWORD *)buf = 138412290;
        id v96 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Server auth response contained a CK token, saving via AKTokenManager for account (%@)",  buf,  0xCu);
      }

      v53 = self->_tokenManager;
      v54 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 continuationToken]);
      uint64_t v55 = ACContinuationTokenKey;
      v56 = (void *)objc_claimAutoreleasedReturnValue([v8 altDSID]);
      -[AKTokenManager updateToken:identifier:altDSID:account:credential:error:]( v53,  "updateToken:identifier:altDSID:account:credential:error:",  v54,  v55,  v56,  v7,  v10,  0LL);

      id v9 = v52;
      id v12 = v51;
    }

    else
    {
      if (v50)
      {
        *(_DWORD *)buf = 138412290;
        id v96 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Server auth response contained a CK token, saving to the credential for account (%@)",  buf,  0xCu);
      }

      v58 = self->_accountManager;
      v54 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 continuationToken]);
      -[AKAccountManager setToken:tokenID:account:credential:]( v58,  "setToken:tokenID:account:credential:",  v54,  ACContinuationTokenKey,  v7,  v10);
    }
  }

  else
  {
    uint64_t v57 = _AKLogSystem(v44);
    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "Server auth response did not contain CK token.",  buf,  2u);
    }
  }

  v59 = (void *)objc_claimAutoreleasedReturnValue([v8 passwordResetToken]);
  v60 = (void *)objc_claimAutoreleasedReturnValue([v59 stringValue]);

  if (!v60)
  {
    uint64_t v73 = _AKLogSystem(v61);
    v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
    v72 = v92;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "Server auth response did not contain PRK token.",  buf,  2u);
    }

    goto LABEL_35;
  }

  id v62 = [v9 _localUserHasEmptyPassword];
  if ((v62 & 1) != 0)
  {
    uint64_t v63 = _AKLogSystem(v62);
    v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
    v72 = v92;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      sub_10013FA98(v64, v65, v66, v67, v68, v69, v70, v71);
    }
LABEL_35:

    goto LABEL_36;
  }

  v90 = v9;
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
  unsigned int v78 = [v77 isTokenCacheEnabled];

  uint64_t v80 = _AKLogSystem(v79);
  v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
  BOOL v82 = os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT);
  if (v78)
  {
    if (v82)
    {
      *(_DWORD *)buf = 138412290;
      id v96 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_DEFAULT,  "Server auth response contained a PRK token, saving via AKTokenMAnager for account (%@)",  buf,  0xCu);
    }

    v83 = self->_tokenManager;
    v84 = (void *)objc_claimAutoreleasedReturnValue([v8 passwordResetToken]);
    uint64_t v85 = ACPasswordResetTokenKey;
    v86 = (void *)objc_claimAutoreleasedReturnValue([v8 altDSID]);
    -[AKTokenManager updateToken:identifier:altDSID:account:credential:error:]( v83,  "updateToken:identifier:altDSID:account:credential:error:",  v84,  v85,  v86,  v7,  v10,  0LL);
  }

  else
  {
    if (v82)
    {
      *(_DWORD *)buf = 138412290;
      id v96 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_DEFAULT,  "Server auth response contained a PRK token, saving to the credential for account (%@)",  buf,  0xCu);
    }

    v87 = self->_accountManager;
    v84 = (void *)objc_claimAutoreleasedReturnValue([v8 passwordResetToken]);
    -[AKAccountManager setToken:tokenID:account:credential:]( v87,  "setToken:tokenID:account:credential:",  v84,  ACPasswordResetTokenKey,  v7,  v10);
  }

  id v9 = v90;

  id v74 = [v90 anticipateEscrowAttempt];
  v72 = v92;
  if ((_DWORD)v74)
  {
    uint64_t v88 = _AKLogSystem(v74);
    v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v96 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_DEFAULT,  "Stashing the PRK token away for escrowing for account: %@",  buf,  0xCu);
    }

    id v74 = -[ACAccountCredential setCredentialItem:forKey:]( v10,  "setCredentialItem:forKey:",  v60,  ACPasswordResetTokenBackupKey);
  }

- (void)_updateTelemetryDeviceSessionIDForAccount:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[AKAccountManager accountAccessTelemetryOptInForAccount:]( self->_accountManager,  "accountAccessTelemetryOptInForAccount:",  v6))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager telemetryDeviceSessionIDForAccount:]( self->_accountManager,  "telemetryDeviceSessionIDForAccount:",  v6));
    id v9 = v8;
    if (v8
      && (id v10 = [v8 isEqualToString:AKTelemetryMissingDeviceSessionID], (v10 & 1) == 0))
    {
      uint64_t v16 = _AKLogSystem(v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_10013FB34((uint64_t)v9, v12);
      }
    }

    else
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);

      uint64_t v14 = _AKLogSystem(v13);
      unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        uint64_t v18 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "AuthKit account exists and is consented to telemetry collection, but is missing a deviceSessionID, creating a new one... %@",  (uint8_t *)&v17,  0xCu);
      }

      -[AKAccountManager setTelemetryDeviceSessionID:forAccount:]( self->_accountManager,  "setTelemetryDeviceSessionID:forAccount:",  v12,  v6);
      [v7 setTelemetryDeviceSessionID:v12];
    }
  }
}

- (void)_updateAccountInUseForAccount:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 serviceType] == (id)7)
  {
    uint64_t v8 = _AKLogSystem(7LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Detected a piggy service type, alias for iCloud",  (uint8_t *)&v14,  2u);
    }

    [v7 setServiceType:1];
  }

  if ([v7 serviceType])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    uint64_t v11 = _AKLogSystem(v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v7 serviceType]));
      int v14 = 138412546;
      unsigned int v15 = v13;
      __int16 v16 = 2112;
      int v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Setting serviceType %@ inUse for account %@",  (uint8_t *)&v14,  0x16u);
    }

    -[AKAccountManager setAccount:inUse:byService:]( self->_accountManager,  "setAccount:inUse:byService:",  v6,  1,  [v7 serviceType]);
  }
}

- (void)_updateRemainingPropertiesForAccount:(id)a3 withServerResponse:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 hasSOSActiveDevice]);

  if (v7)
  {
    accountManager = self->_accountManager;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 hasSOSActiveDevice]);
    -[AKAccountManager setHasSOSActiveDevice:forAccount:]( accountManager,  "setHasSOSActiveDevice:forAccount:",  [v9 BOOLValue],  v28);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 SOSNeeded]);

  if (v10)
  {
    uint64_t v11 = self->_accountManager;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 SOSNeeded]);
    -[AKAccountManager setSOSNeeded:forAccount:](v11, "setSOSNeeded:forAccount:", [v12 BOOLValue], v28);
  }

  if ([v6 authorizationUsed]) {
    -[AKAccountManager setAuthorizationUsed:forAccount:]( self->_accountManager,  "setAuthorizationUsed:forAccount:",  [v6 authorizationUsed],  v28);
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 privateAttestationEnabled]);

  if (v13)
  {
    int v14 = self->_accountManager;
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v6 privateAttestationEnabled]);
    -[AKAccountManager setPrivateAttestationEnabled:forAccount:]( v14,  "setPrivateAttestationEnabled:forAccount:",  [v15 BOOLValue],  v28);
  }

  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 serverExperimentalFeatures]);

  if (v16)
  {
    int v17 = self->_accountManager;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 serverExperimentalFeatures]);
    -[AKAccountManager setServerExperimentalFeatures:forAccount:]( v17,  "setServerExperimentalFeatures:forAccount:",  v18,  v28);
  }

  if ([v6 isProximityEligible]) {
    -[AKAccountManager setIsProximityAuthEligible:forAccount:]( self->_accountManager,  "setIsProximityAuthEligible:forAccount:",  [v6 isProximityEligible],  v28);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue([v6 isNotificationEmailAvailable]);

  if (v19)
  {
    id v20 = self->_accountManager;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v6 isNotificationEmailAvailable]);
    -[AKAccountManager setIsNotificationEmailAvailable:forAccount:]( v20,  "setIsNotificationEmailAvailable:forAccount:",  [v21 BOOLValue],  v28);
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v6 notificationEmail]);

  if (v22)
  {
    v23 = self->_accountManager;
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v6 notificationEmail]);
    -[AKAccountManager setNotificationEmail:forAccount:](v23, "setNotificationEmail:forAccount:", v24, v28);
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 thirdPartyRegulatoryOverride]);

  if (v25)
  {
    uint64_t v26 = self->_accountManager;
    v27 = (void *)objc_claimAutoreleasedReturnValue([v6 thirdPartyRegulatoryOverride]);
    -[AKAccountManager set3PRegulatoryOverride:forAccount:](v26, "set3PRegulatoryOverride:forAccount:", v27, v28);
  }
}

- (BOOL)_saveAccount:(id)a3 userInfoDictionary:(id)a4 error:(id *)a5
{
  accountManager = self->_accountManager;
  id v13 = 0LL;
  unsigned __int8 v7 = -[AKAccountManager saveAccount:error:](accountManager, "saveAccount:error:", a3, &v13);
  id v8 = v13;
  id v9 = v8;
  if ((v7 & 1) == 0)
  {
    uint64_t v10 = _AKLogSystem(v8);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10013FBA4((uint64_t)v9, v11);
    }

    if (a5) {
      *a5 = v9;
    }
  }

  return v7;
}

- (void)_postUserInfoChangedNotificationWithPayload:(id)a3
{
  id v4 = a3;
  if ([v4 count]) {
    -[AKUserInfoController sendUserInfoChangeNotificationWithPayload:]( self->_userInfoController,  "sendUserInfoChangeNotificationWithPayload:",  v4);
  }
}

- (AKAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (AKTokenManager)tokenManager
{
  return self->_tokenManager;
}

- (void)setTokenManager:(id)a3
{
}

- (AKUserInfoController)userInfoController
{
  return self->_userInfoController;
}

- (void)setUserInfoController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end