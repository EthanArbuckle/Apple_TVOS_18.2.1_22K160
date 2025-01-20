@interface AKAppleIDAuthenticationService
+ (id)_verificationQueue;
- (AKAppleIDAuthenticationService)init;
- (AKAppleIDAuthenticationService)initWithClient:(id)a3 passwordResetPresenter:(id)a4;
- (AKAppleIDAuthenticationService)initWithProxy:(id)a3;
- (AKPasswordResetPresenter)passwordResetPresenter;
- (BOOL)_incrementAttemptsForContext:(id)a3 error:(id *)a4;
- (BOOL)_isInteractiveAuthRequiredForContext:(id)a3;
- (BOOL)_shouldBroadcastForProximity:(id)a3;
- (BOOL)_shouldShowAlertForAuthModeError:(id)a3;
- (BOOL)_shouldSkipAccountUpdatesForAuthWithContext:(id)a3;
- (BOOL)_updateAuthKitAccount:(id)a3 withServerResponse:(id)a4 context:(id)a5 error:(id *)a6;
- (BOOL)shouldProcessAdditionalServerUIData:(id)a3;
- (id)_accountForContinuationWithContext:(id)a3 error:(id *)a4;
- (id)_addAccountNameParameterToURL:(id)a3 withContext:(id)a4;
- (id)_authKitAccountFromContext:(id)a3;
- (id)_authenticationParametersForUsername:(id)a3 altDSID:(id)a4 context:(id)a5;
- (id)_createProxAnalyticsForAuthenticationContextIfNeeded:(id)a3;
- (id)_deviceListProviderWithContext:(id)a3;
- (id)_requestingControllerWithServerResponse:(id)a3;
- (id)_srpAuthContextHelperWithContext:(id)a3;
- (void)_accountForContinuationWithContext:(id)a3 completion:(id)a4;
- (void)_attemptBiometricOrPasscodeAuthWithContext:(id)a3 completion:(id)a4;
- (void)_attemptInteractiveAuthWithContext:(id)a3 completion:(id)a4;
- (void)_attemptPasswordlessAuthAfterBiometricOrPasscodeValidationWithContext:(id)a3 promptType:(unint64_t)a4 completion:(id)a5;
- (void)_attemptPasswordlessAuthOptionsWithContext:(id)a3 completion:(id)a4;
- (void)_attemptPasswordlessAuthWithContext:(id)a3 completion:(id)a4;
- (void)_authenticateWithContext:(id)a3 completion:(id)a4;
- (void)_beginAppleIDCreationFlowWithContext:(id)a3 completion:(id)a4;
- (void)_beginChangePasswordFlowWithAccount:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_beginServerDrivenSecondaryActionWithURLKey:(id)a3 context:(id)a4 initialAuthResponse:(id)a5 completion:(id)a6;
- (void)_beginiForgotFlowWithContext:(id)a3 completion:(id)a4;
- (void)_changePasswordAndAuthenticateWithContext:(id)a3 completion:(id)a4;
- (void)_checkFreshnessAndVerifyWithPassword:(id)a3 serverResponse:(id)a4 additionalData:(id)a5 secondaryActionError:(id)a6 context:(id)a7 newServerResponse:(id)a8 username:(id)a9 completion:(id)a10;
- (void)_completeAuthenticationWithServiceTokens:(id)a3 tokenFetchError:(id)a4 altDSID:(id)a5 authenticationResults:(id)a6 context:(id)a7 completion:(id)a8;
- (void)_configureDeviceListCacheInBackgroundWithContext:(id)a3 response:(id)a4;
- (void)_correlateContext:(id)a3 withAuthModeInformation:(id)a4;
- (void)_createNewAppleIDAndAuthenticateWithContext:(id)a3 completion:(id)a4;
- (void)_edpRequestWithAltDSID:(id)a3 URLKey:(id)a4 completion:(id)a5;
- (void)_fetchAuthModeInfoWithContext:(id)a3 completion:(id)a4;
- (void)_fetchDeviceListWithContext:(id)a3 completion:(id)a4;
- (void)_fetchDeviceSafetyRestrictionStateForAltDSID:(id)a3 completion:(id)a4;
- (void)_fetchTokensForServiceIDs:(id)a3 withUsername:(id)a4 altDSID:(id)a5 masterToken:(id)a6 context:(id)a7 completion:(id)a8;
- (void)_finishAnalyticsEvent:(id)a3 authenticationResults:(id)a4 authenticationContext:(id)a5 error:(id)a6;
- (void)_handleBasicLoginUICompletionWithUsername:(id)a3 password:(id)a4 context:(id)a5 additionalData:(id)a6 collectionError:(id)a7 completion:(id)a8;
- (void)_handleCreateNewAppleIDError:(id)a3 withContext:(id)a4 andCompletion:(id)a5;
- (void)_handleDeviceListResponseRequestContext:(id)a3 responseError:(id)a4 responseData:(id)a5 completion:(id)a6;
- (void)_handleGrandslamResponse:(id)a3 data:(id)a4 error:(id)a5 serverResponse:(id)a6 completion:(id)a7;
- (void)_handleMissingUsernameOrPasswordForContext:(id)a3 password:(id)a4 username:(id)a5 completion:(id)a6;
- (void)_handlePasswordlessAuthResults:(id)a3 context:(id)a4 error:(id)a5 completion:(id)a6;
- (void)_handleRecoverCredentialsError:(id)a3 withContext:(id)a4 event:(id)a5 andCompletion:(id)a6;
- (void)_handleSecondFactorUICompletionWithCode:(id)a3 error:(id)a4 idmsData:(id)a5 initialAuthResponse:(id)a6 context:(id)a7 completion:(id)a8;
- (void)_handleSecondFactorUICompletionWithCode:(id)a3 error:(id)a4 idmsData:(id)a5 piggybacking:(BOOL)a6 initialAuthResponse:(id)a7 context:(id)a8 completion:(id)a9;
- (void)_handleSuccessfulVerificationForContext:(id)a3 withResults:(id)a4 serverResponse:(id)a5 completion:(id)a6;
- (void)_handleVerificationCompletionForUsername:(id)a3 password:(id)a4 serverResponse:(id)a5 didShowServerUI:(BOOL)a6 continuationData:(id)a7 error:(id)a8 context:(id)a9 completion:(id)a10;
- (void)_handleVerificationError:(id)a3 forContext:(id)a4 completion:(id)a5;
- (void)_initiateEDPRepairForAuthenticationContext:(id)a3 authResults:(id)a4;
- (void)_keepLoginAliveWithContext:(id)a3 error:(id)a4 andCompletion:(id)a5;
- (void)_performAuthenticationWithContext:(id)a3 completion:(id)a4;
- (void)_performDeviceListRequestWithContext:(id)a3 completion:(id)a4;
- (void)_performGrandslamEndpointActionWithContext:(id)a3 serverResponse:(id)a4 completion:(id)a5;
- (void)_performInteractiveAuthWithContext:(id)a3 completion:(id)a4;
- (void)_performInteractiveFederatedAuthWithContext:(id)a3 completion:(id)a4;
- (void)_performPasswordlessSRPAuthWithAccount:(id)a3 context:(id)a4 client:(id)a5 completion:(id)a6;
- (void)_performPasswordlessSRPAuthWithAccount:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_performPasswordlessSRPAuthWithContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)_performPasswordlessSRPAuthWithContext:(id)a3 completion:(id)a4;
- (void)_performSRPAuthenticationWithContext:(id)a3 completion:(id)a4;
- (void)_performSafeSRPAuthenticationWithContext:(id)a3 completion:(id)a4;
- (void)_performSecondaryActionWithServerResponse:(id)a3 context:(id)a4 client:(id)a5 completion:(id)a6;
- (void)_performSecondaryActionWithServerResponse:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_performSilentServiceTokenAuthWithContext:(id)a3 completion:(id)a4;
- (void)_persistGrandSlamServiceTokens:(id)a3 forAltDSID:(id)a4 DSID:(id)a5 appleID:(id)a6 forContext:(id)a7 error:(id *)a8;
- (void)_processValidationCodeSuccessResponse:(id)a3 authResponse:(id)a4 results:(id)a5 completion:(id)a6;
- (void)_provideServiceTokensIfRequiredForContext:(id)a3 authenticationResults:(id)a4 serverResponse:(id)a5 completion:(id)a6;
- (void)_recoverCredentialsAndAuthenticateWithContext:(id)a3 completion:(id)a4;
- (void)_refreshAuthModeFromServerForContext:(id)a3 completion:(id)a4;
- (void)_refreshAuthModeIfNecessaryForContext:(id)a3 completion:(id)a4;
- (void)_refreshLocalAccountAndUpdateContext:(id)a3 completion:(id)a4;
- (void)_repairAppleIDWithContext:(id)a3 completion:(id)a4;
- (void)_sendAnalyticsEvent:(id)a3 withError:(id)a4;
- (void)_setAuthKitAccount:(id)a3 inUse:(BOOL)a4 forService:(int64_t)a5 completion:(id)a6;
- (void)_shouldContinueAuthenticatingForUsername:(id)a3 password:(id)a4 serverResponse:(id)a5 didShowServerUI:(BOOL)a6 continuationData:(id)a7 error:(id)a8 context:(id)a9 completion:(id)a10;
- (void)_showAlertForLoginCodeValidationError:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_showAlertForLoginError:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_showAlertForVerificationError:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_showBiometricOrPasscodeAuthWithContext:(id)a3 completion:(id)a4;
- (void)_showContinueUsingUIWithContext:(id)a3 completion:(id)a4;
- (void)_showServerUIWithContext:(id)a3 completion:(id)a4;
- (void)_showServerUIWithURLRequest:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_showServerUIWithURLRequest:(id)a3 context:(id)a4 initialAuthResponse:(id)a5 completion:(id)a6;
- (void)_titleAndMessageForBadNetworkRelatedErrorWithCompletion:(id)a3;
- (void)_titleAndMessageForError:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_updateAltDSIDAndUsername:(id)a3;
- (void)_updateDeviceListResponseWithDeviceInfo:(id)a3 completion:(id)a4;
- (void)_upgradeSecurityLevelWithContext:(id)a3 completion:(id)a4;
- (void)_validateLoginCode:(unint64_t)a3 forAltDSID:(id)a4 masterToken:(id)a5 idmsData:(id)a6 authContext:(id)a7 completion:(id)a8;
- (void)_verifyUsername:(id)a3 password:(id)a4 context:(id)a5 completion:(id)a6;
- (void)accountNamesForAltDSID:(id)a3 completion:(id)a4;
- (void)activeLoginCode:(id)a3;
- (void)authenticateWithContext:(id)a3 completion:(id)a4;
- (void)checkSecurityUpgradeEligibilityForContext:(id)a3 completion:(id)a4;
- (void)clearSessionCacheWithCompletion:(id)a3;
- (void)configurationInfoWithIdentifiers:(id)a3 forAltDSID:(id)a4 completion:(id)a5;
- (void)deleteAuthorizationDatabaseWithAltDSID:(id)a3 completion:(id)a4;
- (void)deleteDeviceListCacheWithCompletion:(id)a3;
- (void)deleteDeviceListCacheWithContext:(id)a3 completion:(id)a4;
- (void)deleteTokensFromCacheWithAltDSID:(id)a3 tokenIdentifiers:(id)a4 completion:(id)a5;
- (void)deviceListWithContext:(id)a3 completion:(id)a4;
- (void)fetchAppListWithAltDSID:(id)a3 completion:(id)a4;
- (void)fetchAuthModeWithContext:(id)a3 completion:(id)a4;
- (void)fetchBirthdayForAltDSID:(id)a3 completion:(id)a4;
- (void)fetchGlobalConfigurationUsingPolicy:(unint64_t)a3 completion:(id)a4;
- (void)fetchTokensWithAltDSID:(id)a3 tokenIdentifiers:(id)a4 completion:(id)a5;
- (void)fetchURLBagForAltDSID:(id)a3 completion:(id)a4;
- (void)fetchURLBagFromCache:(BOOL)a3 altDSID:(id)a4 completion:(id)a5;
- (void)fetchUserInformationForAltDSID:(id)a3 completion:(id)a4;
- (void)forceURLBagUpdateForAltDSID:(id)a3 urlSwitchData:(id)a4 completion:(id)a5;
- (void)generateLoginCodeWithCompletion:(id)a3;
- (void)getServerUILoadDelegateForAltDSID:(id)a3 completion:(id)a4;
- (void)getServerUILoadDelegateWithContext:(id)a3 completion:(id)a4;
- (void)getUserInformationForAltDSID:(id)a3 completion:(id)a4;
- (void)getUserInformationWithContext:(id)a3 completion:(id)a4;
- (void)isCreateAppleIDAllowedWithCompletion:(id)a3;
- (void)isDevicePasscodeProtected:(id)a3;
- (void)performCheckInForAccountWithAltDSID:(id)a3 event:(id)a4 completion:(id)a5;
- (void)performCheckInForAccountWithAltDSID:(id)a3 event:(id)a4 reason:(unint64_t)a5 completion:(id)a6;
- (void)performCircleRequestWithContext:(id)a3 completion:(id)a4;
- (void)performEdpCompleteKeyDropWithAltDSID:(id)a3 completion:(id)a4;
- (void)performEdpMigrationWithAltDSID:(id)a3 completion:(id)a4;
- (void)performPasswordResetWithContext:(id)a3 completion:(id)a4;
- (void)performRemoveEdpTokenWithAltDSID:(id)a3 completion:(id)a4;
- (void)performSilentTTRFor:(unint64_t)a3 completion:(id)a4;
- (void)persistRecoveryKeyWithContext:(id)a3 authContext:(id)a4 completion:(id)a5;
- (void)piggyback:(id)a3 handleEscapeHatchError:(id)a4 completion:(id)a5;
- (void)piggyback:(id)a3 handleVerificationWithError:(id)a4 completion:(id)a5;
- (void)piggyback:(id)a3 promptForRandomCodeWithCompletion:(id)a4;
- (void)piggyback:(id)a3 shouldContinueWithCompletion:(id)a4;
- (void)piggyback:(id)a3 validateSecurityCode:(id)a4 completion:(id)a5;
- (void)refreshAuthMetadataWithContext:(id)a3 completion:(id)a4;
- (void)renewRecoveryTokenWithContext:(id)a3 completion:(id)a4;
- (void)reportSignOutForAllAppleIDsWithCompletion:(id)a3;
- (void)reportSignOutForAppleID:(id)a3 service:(int64_t)a4 completion:(id)a5;
- (void)revokeAuthorizationForApplicationWithClientID:(id)a3 completion:(id)a4;
- (void)serverUIContext:(id)a3 processAdditionalData:(id)a4 completion:(id)a5;
- (void)setAppleIDWithAltDSID:(id)a3 inUse:(BOOL)a4 forService:(int64_t)a5 completion:(id)a6;
- (void)setAppleIDWithDSID:(id)a3 inUse:(BOOL)a4 forService:(int64_t)a5 completion:(id)a6;
- (void)setConfigurationInfo:(id)a3 forIdentifier:(id)a4 forAltDSID:(id)a5 completion:(id)a6;
- (void)setPasswordResetPresenter:(id)a3;
- (void)startPiggybackingForServerResponse:(id)a3 context:(id)a4 password:(id)a5 username:(id)a6 completion:(id)a7;
- (void)synchronizeFollowUpItemsForContext:(id)a3 completion:(id)a4;
- (void)teardownFollowUpWithContext:(id)a3 completion:(id)a4;
- (void)updateStateWithExternalAuthenticationResponse:(id)a3 forAppleID:(id)a4 completion:(id)a5;
- (void)updateStateWithExternalAuthenticationResponse:(id)a3 forContext:(id)a4 completion:(id)a5;
- (void)updateUserInformationForAltDSID:(id)a3 userInformation:(id)a4 completion:(id)a5;
- (void)validateLoginCode:(unint64_t)a3 forAppleID:(id)a4 withCompletion:(id)a5;
- (void)validateVettingToken:(id)a3 forAltDSID:(id)a4 completion:(id)a5;
- (void)verifyMasterKey:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)warmUpVerificationSessionWithCompletion:(id)a3;
@end

@implementation AKAppleIDAuthenticationService

- (AKAppleIDAuthenticationService)initWithClient:(id)a3 passwordResetPresenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthSupportProxyImpl);
  v10 = -[AKAppleIDAuthenticationService initWithProxy:](self, "initWithProxy:", v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_client, a3);
    objc_storeStrong((id *)&v10->_passwordResetPresenter, a4);
  }

  return v10;
}

- (AKAppleIDAuthenticationService)initWithProxy:(id)a3
{
  id v5 = a3;
  v6 = -[AKAppleIDAuthenticationService init](self, "init");
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_authProxy, a3);
  }

  return v7;
}

- (AKAppleIDAuthenticationService)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___AKAppleIDAuthenticationService;
  v2 = -[AKAppleIDAuthenticationService init](&v16, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    accountManager = v2->_accountManager;
    v2->_accountManager = (AKAccountManager *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[AKTokenManager sharedInstance](&OBJC_CLASS___AKTokenManager, "sharedInstance"));
    tokenManager = v2->_tokenManager;
    v2->_tokenManager = (AKTokenManager *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[AKAuthenticationUILiaison sharedInstance](&OBJC_CLASS___AKAuthenticationUILiaison, "sharedInstance"));
    authUILiaison = v2->_authUILiaison;
    v2->_authUILiaison = (AKAuthenticationUILiaison *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[AKAuthenticationTrafficController sharedInstance]( &OBJC_CLASS___AKAuthenticationTrafficController,  "sharedInstance"));
    authTrafficController = v2->_authTrafficController;
    v2->_authTrafficController = (AKAuthenticationTrafficController *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"https://gsa.apple.com/grandslam/GsService2/lookup/v2"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 host]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[CUTReachability reachabilityWithHostName:]( &OBJC_CLASS___CUTReachability,  "reachabilityWithHostName:",  v12));
    reachability = v2->_reachability;
    v2->_reachability = (CUTReachability *)v13;
  }

  return v2;
}

+ (id)_verificationQueue
{
  if (qword_10020F408 != -1) {
    dispatch_once(&qword_10020F408, &stru_1001C7E78);
  }
  return (id)qword_10020F400;
}

- (void)accountNamesForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = -[AKClient hasInternalAccess](self->_client, "hasInternalAccess");
  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AKUserInfoController sharedController](&OBJC_CLASS___AKUserInfoController, "sharedController"));
    client = self->_client;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10003A438;
    v14[3] = &unk_1001C78F8;
    id v15 = v7;
    [v9 fetchUserInformationForAltDSID:v6 client:client completion:v14];

    v11 = v15;
  }

  else
  {
    uint64_t v12 = _AKLogSystem(v8);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100132A48();
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
  }
}

- (void)fetchURLBagForAltDSID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[AKURLBagService sharedBagService](&OBJC_CLASS___AKURLBagService, "sharedBagService"));
  [v7 fetchURLBagForAltDSID:v6 completion:v5];
}

- (void)fetchURLBagFromCache:(BOOL)a3 altDSID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[AKURLBagService sharedBagService](&OBJC_CLASS___AKURLBagService, "sharedBagService"));
  [v9 fetchURLBagForAltDSID:v8 fromCache:v6 completion:v7];
}

- (void)forceURLBagUpdateForAltDSID:(id)a3 urlSwitchData:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[AKURLBagService sharedBagService](&OBJC_CLASS___AKURLBagService, "sharedBagService"));
  [v10 forceURLBagUpdateForAltDSID:v9 urlSwitchData:v8 completion:v7];
}

- (void)setAppleIDWithAltDSID:(id)a3 inUse:(BOOL)a4 forService:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v13 = (void (**)(void, void, void))v11;
  if (v10)
  {
    id v14 = objc_msgSend((id)objc_opt_class(self, v12), "_verificationQueue");
    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003A72C;
    block[3] = &unk_1001C7EA0;
    block[4] = self;
    id v20 = v10;
    BOOL v23 = a4;
    v21 = v13;
    int64_t v22 = a5;
    dispatch_async(v15, block);
  }

  else
  {
    uint64_t v16 = _AKLogSystem(v11);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100132A74();
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7025LL));
    ((void (**)(void, void, void *))v13)[2](v13, 0LL, v18);
  }
}

- (void)setAppleIDWithDSID:(id)a3 inUse:(BOOL)a4 forService:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v13 = (void (**)(void, void, void))v11;
  if (v10)
  {
    id v14 = objc_msgSend((id)objc_opt_class(self, v12), "_verificationQueue");
    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003A920;
    block[3] = &unk_1001C7EA0;
    block[4] = self;
    id v20 = v10;
    BOOL v23 = a4;
    v21 = v13;
    int64_t v22 = a5;
    dispatch_async(v15, block);
  }

  else
  {
    uint64_t v16 = _AKLogSystem(v11);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100132B00();
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7050LL));
    ((void (**)(void, void, void *))v13)[2](v13, 0LL, v18);
  }
}

- (void)_setAuthKitAccount:(id)a3 inUse:(BOOL)a4 forService:(int64_t)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = (void (**)(id, id, id))a6;
  BOOL v12 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (v12 || (BOOL v12 = -[AKClient hasWriteAccess](self->_client, "hasWriteAccess")))
  {
    if (a5)
    {
      if (v8
        || (uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager servicesUsingAccount:]( self->_accountManager,  "servicesUsingAccount:",  v10)),  v14 = [v13 count],  v13,  v14))
      {
        uint64_t v15 = _AKLogSystem(v12);
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
          v18 = @"not";
          *(_DWORD *)buf = 138412802;
          v41 = v17;
          __int16 v42 = 2112;
          if (v8) {
            v18 = &stru_1001D1450;
          }
          v43 = v18;
          __int16 v44 = 2112;
          id v45 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Marking service %@ as %@ using account %@.",  buf,  0x20u);
        }

        -[AKAccountManager setAccount:inUse:byService:]( self->_accountManager,  "setAccount:inUse:byService:",  v10,  v8,  a5);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager servicesUsingAccount:](self->_accountManager, "servicesUsingAccount:", v10));
        if ([v19 count])
        {
          accountManager = self->_accountManager;
          id v35 = 0LL;
          id v21 = -[AKAccountManager saveAccount:error:](accountManager, "saveAccount:error:", v10, &v35);
          id v22 = v35;
          if (v8)
          {
            v11[2](v11, v21, v22);
          }

          else
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue( +[AKAppleIDCheckInHelperService sharedService]( &OBJC_CLASS___AKAppleIDCheckInHelperService,  "sharedService"));
            [v32 reportSignOutEventForService:a5 account:v10 completion:v11];
          }
        }

        else
        {
          uint64_t v29 = _AKLogSystem(0LL);
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Global signout.", buf, 2u);
          }

          v31 = (void *)objc_claimAutoreleasedReturnValue( +[AKAppleIDCheckInHelperService sharedService]( &OBJC_CLASS___AKAppleIDCheckInHelperService,  "sharedService"));
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472LL;
          v36[2] = sub_10003AE70;
          v36[3] = &unk_1001C7EC8;
          id v37 = v10;
          v38 = self;
          v39 = v11;
          [v31 reportFinalSignOutEventForAccount:v37 completion:v36];

          id v22 = v37;
        }
      }

      else
      {
        uint64_t v33 = _AKLogSystem(v12);
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          sub_100132C7C(a5, v34);
        }

        v11[2](v11, (id)1, 0LL);
      }
    }

    else
    {
      uint64_t v23 = _AKLogSystem(v12);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100132B8C(v24);
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7049LL));
      v11[2](v11, 0LL, v25);
    }
  }

  else
  {
    uint64_t v26 = _AKLogSystem(v12);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100132D0C();
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    v11[2](v11, 0LL, v28);
  }
}

- (void)fetchUserInformationForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AKUserInfoController sharedController](&OBJC_CLASS___AKUserInfoController, "sharedController"));
    client = self->_client;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10003B1AC;
    v14[3] = &unk_1001C78F8;
    id v15 = v7;
    [v9 fetchUserInformationForAltDSID:v6 client:client completion:v14];

    id v11 = v15;
  }

  else
  {
    uint64_t v12 = _AKLogSystem(v8);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100132D98();
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
  }
}

- (void)getUserInformationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AKUserInfoController sharedController](&OBJC_CLASS___AKUserInfoController, "sharedController"));
    client = self->_client;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10003B328;
    v14[3] = &unk_1001C78F8;
    id v15 = v7;
    [v9 fetchUserInformationWithContext:v6 client:client completion:v14];

    id v11 = v15;
  }

  else
  {
    uint64_t v12 = _AKLogSystem(v8);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100132D98();
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
  }
}

- (void)getUserInformationForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AKUserInfoController sharedController](&OBJC_CLASS___AKUserInfoController, "sharedController"));
    client = self->_client;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10003B4BC;
    v14[3] = &unk_1001C78F8;
    id v15 = v7;
    [v9 fetchUserInformationForAltDSID:v6 client:client completion:v14];

    id v11 = v15;
  }

  else
  {
    uint64_t v12 = _AKLogSystem(v8);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100132D98();
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
  }
}

- (void)updateUserInformationForAltDSID:(id)a3 userInformation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (-[AKClient hasInternalAccess](self->_client, "hasInternalAccess")
    || (BOOL v11 = -[AKClient hasOwnerAccess](self->_client, "hasOwnerAccess")))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[AKUserInfoController sharedController](&OBJC_CLASS___AKUserInfoController, "sharedController"));
    [v12 updateUserInformationForAltDSID:v8 userInformation:v9 completion:v10];
  }

  else
  {
    uint64_t v13 = _AKLogSystem(v11);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10012DCB4();
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    v10[2](v10, 0LL, v12);
  }
}

- (void)fetchAuthModeWithContext:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003B690;
  v7[3] = &unk_1001C7EF0;
  id v8 = a4;
  id v6 = v8;
  -[AKAppleIDAuthenticationService _fetchAuthModeInfoWithContext:completion:]( self,  "_fetchAuthModeInfoWithContext:completion:",  a3,  v7);
}

- (void)_fetchAuthModeInfoWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new(&OBJC_CLASS___AKAuthModeController);
  client = self->_client;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10003B77C;
  v13[3] = &unk_1001C7F40;
  id v14 = v8;
  id v15 = self;
  id v16 = v6;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  uint64_t v12 = v8;
  -[AKAuthModeController fetchAuthModeWithContext:client:completion:]( v12,  "fetchAuthModeWithContext:client:completion:",  v11,  client,  v13);
}

- (BOOL)_shouldShowAlertForAuthModeError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  BOOL v5 = v3 && ([v3 code] == (id)-7093 || objc_msgSend(v4, "code") == (id)-7094);

  return v5;
}

- (void)_fetchDeviceSafetyRestrictionStateForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100132DC4();
  }

  id v10 = objc_opt_new(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  -[AKAppleIDAuthenticationContext setAltDSID:](v10, "setAltDSID:", v6);
  id v11 = objc_alloc(&OBJC_CLASS___AKGrandSlamRequestProvider);
  uint64_t v12 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:]( v11,  "initWithContext:urlBagKey:",  v10,  AKURLBagKeyDeviceInfo);
  -[AKURLRequestProviderImpl setClient:](v12, "setClient:", self->_client);
  -[AKGrandSlamRequestProvider setAuthenticatedRequest:](v12, "setAuthenticatedRequest:", 1LL);
  -[AKGrandSlamRequestProvider setExpectedResponseType:](v12, "setExpectedResponseType:", 1LL);
  uint64_t v13 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v12);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10003BA24;
  v16[3] = &unk_1001C7F68;
  id v17 = v6;
  id v18 = v7;
  id v14 = v6;
  id v15 = v7;
  -[AKServiceControllerImpl executeRequestWithCompletion:](v13, "executeRequestWithCompletion:", v16);
}

- (void)_updateDeviceListResponseWithDeviceInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
  unsigned __int8 v9 = [v8 isDTOEnabled];

  if ((v9 & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AKConfiguration sharedConfiguration](&OBJC_CLASS___AKConfiguration, "sharedConfiguration"));
    id v12 = [v11 deviceSafetyRestrictionReasonOverride];

    if (v12)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 serialNumber]);

      id v15 = [[AKDeviceSafetyRestrictionState alloc] initWithDeviceMID:0 serialNumber:v14 restrictionReason:v12];
      [v6 updateWithDeviceRestrictionState:v15];
      if (v7) {
        v7[2](v7, v6, 0LL);
      }
    }

    else
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_10003BE64;
      v19[3] = &unk_1001C7F90;
      id v21 = v7;
      id v20 = v6;
      -[AKAppleIDAuthenticationService _fetchDeviceSafetyRestrictionStateForAltDSID:completion:]( self,  "_fetchDeviceSafetyRestrictionStateForAltDSID:completion:",  v18,  v19);
    }
  }

  else
  {
    uint64_t v16 = _AKLogSystem(v10);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100132F34();
    }

    if (v7) {
      v7[2](v7, v6, 0LL);
    }
  }
}

- (void)deviceListWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (v8)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10003C0C0;
    v20[3] = &unk_1001C7FB8;
    id v23 = v7;
    id v9 = v6;
    id v21 = v9;
    id v22 = self;
    uint64_t v10 = objc_retainBlock(v20);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
    unsigned int v12 = [v11 isDeviceListCacheEnabled];

    if (v12)
    {
      -[AKAppleIDAuthenticationService _fetchDeviceListWithContext:completion:]( self,  "_fetchDeviceListWithContext:completion:",  v9,  v10);
    }

    else
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10003C17C;
      v16[3] = &unk_1001C8008;
      id v17 = v9;
      id v18 = self;
      v19 = v10;
      -[AKAppleIDAuthenticationService _performDeviceListRequestWithContext:completion:]( self,  "_performDeviceListRequestWithContext:completion:",  v17,  v16);
    }

    id v15 = v23;
    goto LABEL_10;
  }

  uint64_t v13 = _AKLogSystem(v8);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_100132D98();
  }

  if (v7)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v15);
LABEL_10:
  }
}

- (void)_performDeviceListRequestWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  authTrafficController = self->_authTrafficController;
  client = self->_client;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10003C3FC;
  v12[3] = &unk_1001C7280;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  -[AKAuthenticationTrafficController beginAuthenticatedRequestWithContext:client:clearanceHandler:]( authTrafficController,  "beginAuthenticatedRequestWithContext:client:clearanceHandler:",  v11,  client,  v12);
}

- (id)_deviceListProviderWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc(&OBJC_CLASS___AKDeviceListRequestProvider);
  id v6 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:]( v5,  "initWithContext:urlBagKey:",  v4,  AKURLBagKeyDeviceList);
  -[AKDeviceListRequestProvider setDeviceRequestContext:](v6, "setDeviceRequestContext:", v4);

  -[AKGrandSlamRequestProvider setAuthenticatedRequest:](v6, "setAuthenticatedRequest:", 1LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](v6, "concreteAuthenticationContext"));
  objc_msgSend(v7, "set_shouldSendGrandSlamTokensForRemoteUI:", 1);

  -[AKURLRequestProviderImpl setClient:](v6, "setClient:", self->_client);
  return v6;
}

- (void)_handleDeviceListResponseRequestContext:(id)a3 responseError:(id)a4 responseData:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void (**)(void, void, void))v13;
  if (v11)
  {
    uint64_t v15 = _AKLogSystem(v13);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100133020();
    }

    if (v14) {
      ((void (**)(void, void, id))v14)[2](v14, 0LL, v11);
    }
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[AAFSerialization dictionaryFromObject:ofType:]( &OBJC_CLASS___AAFSerialization,  "dictionaryFromObject:ofType:",  v12,  @"application/json"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[AKDeviceListResponse deviceMapFromResponseBody:]( &OBJC_CLASS___AKDeviceListResponse,  "deviceMapFromResponseBody:",  v17));
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___AKDeviceListResponse, v19);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v10 altDSID]);
    id v22 = (id)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v21]);
    if ((objc_opt_isKindOfClass(v22, v20) & 1) != 0) {
      id v23 = v22;
    }
    else {
      id v23 = 0LL;
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 deviceList]);
    uint64_t v26 = _AKLogSystem(v25);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    v28 = v27;
    if (v24)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 138412290;
        id v33 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Fetched device list for %@",  (uint8_t *)&v32,  0xCu);
      }

      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
      unsigned int v30 = [v29 isDeviceListCacheEnableDryMode];

      if (v30) {
        -[AKAppleIDAuthenticationService _configureDeviceListCacheInBackgroundWithContext:response:]( self,  "_configureDeviceListCacheInBackgroundWithContext:response:",  v10,  v23);
      }
      if (v14) {
        ((void (**)(void, id, void))v14)[2](v14, v23, 0LL);
      }
    }

    else
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        sub_100132FC0();
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ak_deviceListErrorWithCode:]( &OBJC_CLASS___NSError,  "ak_deviceListErrorWithCode:",  -14002LL));
      if (v14) {
        ((void (**)(void, void, void *))v14)[2](v14, 0LL, v31);
      }
    }
  }
}

- (void)_configureDeviceListCacheInBackgroundWithContext:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003C9BC;
  block[3] = &unk_1001C6510;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)fetchAppListWithAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  client = self->_client;
  id v8 = a4;
  BOOL v9 = -[AKClient hasOwnerAccess](client, "hasOwnerAccess");
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[AKApplicationInformationController sharedController]( &OBJC_CLASS___AKApplicationInformationController,  "sharedController"));
    [v10 fetchAppInformationWithAltDSID:v6 client:self->_client completion:v8];
  }

  else
  {
    uint64_t v11 = _AKLogSystem(v9);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10013315C();
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0LL, v13);
  }
}

- (void)deleteAuthorizationDatabaseWithAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!-[AKClient hasInternalAccess](self->_client, "hasInternalAccess"))
  {
    BOOL v8 = -[AKClient hasOwnerAccess](self->_client, "hasOwnerAccess");
    if (!v8)
    {
      uint64_t v15 = _AKLogSystem(v8);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100133188();
      }

      id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
      uint64_t v11 = (void (*)(void *, uint64_t, id))v7[2];
      goto LABEL_8;
    }
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[AKAuthorizationStoreManager sharedInstance]( &OBJC_CLASS___AKAuthorizationStoreManager,  "sharedInstance"));
  id v17 = 0LL;
  [v9 clearDatabaseWithAltDSID:v6 error:&v17];
  id v10 = v17;

  uint64_t v11 = (void (*)(void *, uint64_t, id))v7[2];
  if (v10)
  {
LABEL_8:
    id v12 = v7;
    uint64_t v13 = 0LL;
    id v14 = v10;
    goto LABEL_9;
  }

  id v12 = v7;
  uint64_t v13 = 1LL;
  id v14 = 0LL;
LABEL_9:
  v11(v12, v13, v14);
}

- (void)revokeAuthorizationForApplicationWithClientID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, AKApplicationAuthorizationController *))a4;
  if (-[AKClient hasInternalAccess](self->_client, "hasInternalAccess")
    || (BOOL v8 = -[AKClient hasOwnerAccess](self->_client, "hasOwnerAccess")))
  {
    BOOL v9 = objc_opt_new(&OBJC_CLASS___AKApplicationAuthorizationController);
    -[AKApplicationAuthorizationController revokeAuthorizationForApplicationWithClientID:completion:]( v9,  "revokeAuthorizationForApplicationWithClientID:completion:",  v6,  v7);
  }

  else
  {
    uint64_t v10 = _AKLogSystem(v8);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100133188();
    }

    BOOL v9 = (AKApplicationAuthorizationController *)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:",  -7026LL));
    v7[2](v7, 0LL, v9);
  }
}

- (void)performSilentTTRFor:(unint64_t)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[AKTTRController sharedController](&OBJC_CLASS___AKTTRController, "sharedController"));
  [v6 performSilentTTRFor:a3 completion:v5];
}

- (void)warmUpVerificationSessionWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, AKSatoriController *))a3;
  BOOL v5 = -[AKClient hasInternalAccess](self->_client, "hasInternalAccess");
  if (v5 || (BOOL v5 = -[AKClient hasOwnerAccess](self->_client, "hasOwnerAccess")))
  {
    uint64_t v6 = _AKLogSystem(v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting WarmUp verification ...", v11, 2u);
    }

    BOOL v8 = -[AKSatoriController initWithClient:](objc_alloc(&OBJC_CLASS___AKSatoriController), "initWithClient:", 0LL);
    -[AKSatoriController warmUpVerificationSessionWithCompletionHandler:]( v8,  "warmUpVerificationSessionWithCompletionHandler:",  v4);
  }

  else
  {
    uint64_t v9 = _AKLogSystem(v5);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100133188();
    }

    BOOL v8 = (AKSatoriController *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    v4[2](v4, 0LL, v8);
  }
}

- (void)setConfigurationInfo:(id)a3 forIdentifier:(id)a4 forAltDSID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (-[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess")
    || (BOOL v14 = -[AKClient hasWriteAccess](self->_client, "hasWriteAccess")))
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[AKUserConfigController sharedController](&OBJC_CLASS___AKUserConfigController, "sharedController"));
    client = self->_client;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10003D0BC;
    v19[3] = &unk_1001C6990;
    id v20 = v13;
    [v15 setUserConfigForAltDSID:v12 client:client configurationInfo:v10 forIdentifier:v11 completion:v19];
  }

  else
  {
    uint64_t v17 = _AKLogSystem(v14);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100132D0C();
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0LL, v15);
  }
}

- (void)configurationInfoWithIdentifiers:(id)a3 forAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  BOOL v11 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (!v11)
  {
    uint64_t v14 = _AKLogSystem(v11);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100132D0C();
    }

    uint64_t v16 = -7026LL;
    goto LABEL_8;
  }

  if (!v8)
  {
    uint64_t v16 = -7053LL;
LABEL_8:
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v16));
    v10[2](v10, 0LL, v17);

    goto LABEL_9;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AKUserConfigController sharedController](&OBJC_CLASS___AKUserConfigController, "sharedController"));
  client = self->_client;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10003D218;
  v18[3] = &unk_1001C7B60;
  uint64_t v19 = v10;
  [v12 fetchUserConfigForAltDSID:v9 client:client dataCenter:0 forIdentifiers:v8 completion:v18];

LABEL_9:
}

- (void)isDevicePasscodeProtected:(id)a3
{
  BOOL v5 = (void (**)(id, id, void))a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  id v4 = [v3 isProtectedWithPasscode];

  v5[2](v5, v4, 0LL);
}

- (void)activeLoginCode:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  uint64_t v5 = _AKLogSystem(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Fetching login code", (uint8_t *)v12, 2u);
  }

  BOOL v7 = -[AKClient hasOwnerAccess](self->_client, "hasOwnerAccess");
  if (!v7)
  {
    uint64_t v10 = _AKLogSystem(v7);
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10013315C();
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    v4[2](v4, 0LL, v8);
    goto LABEL_9;
  }

  if (v4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[AKAppleIDPushHelperService sharedService]( &OBJC_CLASS___AKAppleIDPushHelperService,  "sharedService"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 activeCode]);
    ((void (**)(id, void *, void *))v4)[2](v4, v9, 0LL);

LABEL_9:
  }
}

- (void)getServerUILoadDelegateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003D468;
  block[3] = &unk_1001C7B88;
  id v13 = v6;
  id v14 = v7;
  void block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void)getServerUILoadDelegateForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  -[AKAppleIDAuthenticationContext setAltDSID:](v8, "setAltDSID:", v7);

  -[AKAppleIDAuthenticationService getServerUILoadDelegateWithContext:completion:]( self,  "getServerUILoadDelegateWithContext:completion:",  v8,  v6);
}

- (void)updateStateWithExternalAuthenticationResponse:(id)a3 forAppleID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  -[AKAppleIDAuthenticationContext setUsername:](v11, "setUsername:", v9);

  -[AKAppleIDAuthenticationService updateStateWithExternalAuthenticationResponse:forContext:completion:]( self,  "updateStateWithExternalAuthenticationResponse:forContext:completion:",  v10,  v11,  v8);
}

- (void)updateStateWithExternalAuthenticationResponse:(id)a3 forContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10003D724;
  v16[3] = &unk_1001C8108;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  dispatch_async(v12, v16);
}

- (void)generateLoginCodeWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, id))a3;
  BOOL v5 = -[AKClient hasInternalAccess](self->_client, "hasInternalAccess");
  if (v5)
  {
    id v10 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[AKAppleIDCodeGenerator generateLoginCode:]( &OBJC_CLASS___AKAppleIDCodeGenerator,  "generateLoginCode:",  &v10));
    id v7 = v10;
    if (v4) {
      v4[2](v4, v6, v7);
    }
  }

  else
  {
    uint64_t v8 = _AKLogSystem(v5);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100132A48();
    }

    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    v4[2](v4, 0LL, v7);
  }
}

- (void)validateLoginCode:(unint64_t)a3 forAppleID:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = _AKLogSystem(v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Asked to validated code: %llu",  (uint8_t *)&buf,  0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager authKitAccountWithAppleID:error:]( self->_accountManager,  "authKitAccountWithAppleID:error:",  v8,  0LL));
  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager altDSIDForAccount:](self->_accountManager, "altDSIDForAccount:", v12));
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v33 = 0x3032000000LL;
    v34 = sub_10003E828;
    id v35 = sub_10003E838;
    id v36 = 0LL;
    uint64_t v26 = 0LL;
    v27 = &v26;
    uint64_t v28 = 0x3032000000LL;
    uint64_t v29 = sub_10003E828;
    unsigned int v30 = sub_10003E838;
    id v31 = 0LL;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10003E840;
    v22[3] = &unk_1001C8130;
    v24 = &v26;
    v22[4] = self;
    id v23 = v12;
    p___int128 buf = &buf;
    +[AKAccountManager performWithinPersonaForAccount:withBlock:]( &OBJC_CLASS___AKAccountManager,  "performWithinPersonaForAccount:withBlock:",  v23,  v22);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([(id)v27[5] token]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[AKMasterToken tokenWithExternalizedVersionString:]( &OBJC_CLASS___AKMasterToken,  "tokenWithExternalizedVersionString:",  v14));

    if (v27[5] && v15)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_10003E8C8;
      v20[3] = &unk_1001C8158;
      id v21 = v9;
      -[AKAppleIDAuthenticationService _validateLoginCode:forAltDSID:masterToken:idmsData:authContext:completion:]( self,  "_validateLoginCode:forAltDSID:masterToken:idmsData:authContext:completion:",  a3,  v13,  v15,  0LL,  0LL,  v20);
      id v17 = v21;
    }

    else
    {
      uint64_t v18 = _AKLogSystem(v16);
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10013337C();
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7024LL));
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v17);
    }

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7023LL));
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v13);
  }
}

- (void)_validateLoginCode:(unint64_t)a3 forAltDSID:(id)a4 masterToken:(id)a5 idmsData:(id)a6 authContext:(id)a7 completion:(id)a8
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  uint64_t v18 = (void (**)(void, void, void, void, void))v17;
  if (v14)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([a5 stringValue]);
    if (v19)
    {
      [v16 setAltDSID:v14];
      [v16 _setRemoteUIIdentityToken:v19];
      [v16 setSecurityCode:a3];
      id v20 = objc_alloc(&OBJC_CLASS___AKGrandSlamRequestProvider);
      id v21 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:]( v20,  "initWithContext:urlBagKey:",  v16,  AKURLBagKeyValidateCode);
      uint64_t v30 = AKIdmsDataKey;
      id v31 = v15;
      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
      -[AKURLRequestProviderImpl setAuthKitBody:](v21, "setAuthKitBody:", v22);

      -[AKURLRequestProviderImpl setClient:](v21, "setClient:", self->_client);
      -[AKGrandSlamRequestProvider setAuthenticatedRequest:](v21, "setAuthenticatedRequest:", 0LL);
      -[AKURLRequestProviderImpl setDataCenterIdentifier:](v21, "setDataCenterIdentifier:", 0LL);
      id v23 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v21);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_10003EB74;
      v28[3] = &unk_1001C6C28;
      uint64_t v29 = v18;
      -[AKServiceControllerImpl executeRequestWithCompletion:](v23, "executeRequestWithCompletion:", v28);
    }

    else
    {
      uint64_t v26 = _AKLogSystem(0LL);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_100133410();
      }

      id v21 = (AKGrandSlamRequestProvider *)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:",  -7037LL));
      ((void (**)(void, void, void, void, AKGrandSlamRequestProvider *))v18)[2]( v18,  0LL,  0LL,  0LL,  v21);
    }
  }

  else
  {
    uint64_t v24 = _AKLogSystem(v17);
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1001333E4();
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7025LL));
    ((void (**)(void, void, void, void, void *))v18)[2](v18, 0LL, 0LL, 0LL, v19);
  }
}

- (void)validateVettingToken:(id)a3 forAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, void *))a5;
  BOOL v11 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (!v11)
  {
    uint64_t v12 = _AKLogSystem(v11);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10012D9D0();
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    v10[2](v10, 0LL, v14);
  }

  if (![v8 length])
  {
    uint64_t v35 = _AKLogSystem(0LL);
    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_100133538();
    }

    uint64_t v37 = -7056LL;
    goto LABEL_26;
  }

  if (![v9 length])
  {
    uint64_t v38 = _AKLogSystem(0LL);
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_100133564();
    }

    uint64_t v37 = -7025LL;
LABEL_26:
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v37));
    v10[2](v10, 0LL, v16);
    goto LABEL_34;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager authKitAccountWithAltDSID:error:]( self->_accountManager,  "authKitAccountWithAltDSID:error:",  v9,  0LL));
  id v16 = v15;
  if (v15)
  {
    v58[0] = 0LL;
    v58[1] = v58;
    v58[2] = 0x3032000000LL;
    v58[3] = sub_10003E828;
    v58[4] = sub_10003E838;
    id v59 = 0LL;
    uint64_t v52 = 0LL;
    v53 = &v52;
    uint64_t v54 = 0x3032000000LL;
    v55 = sub_10003E828;
    v56 = sub_10003E838;
    id v57 = 0LL;
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_10003F498;
    v48[3] = &unk_1001C8130;
    v50 = &v52;
    v48[4] = self;
    id v16 = v15;
    id v49 = v16;
    v51 = v58;
    +[AKAccountManager performWithinPersonaForAccount:withBlock:]( &OBJC_CLASS___AKAccountManager,  "performWithinPersonaForAccount:withBlock:",  v16,  v48);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([(id)v53[5] token]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[AKMasterToken tokenWithExternalizedVersionString:]( &OBJC_CLASS___AKMasterToken,  "tokenWithExternalizedVersionString:",  v17));

    if (!v53[5] || !v18)
    {
      uint64_t v20 = _AKLogSystem(v19);
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10013337C();
      }

      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7024LL));
      v10[2](v10, 0LL, v22);
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue([v18 stringValue]);
    if (v23)
    {
      v43 = v18;
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", v9));
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 validateVettingTokenURL]);

      if (v25)
      {
        uint64_t v26 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
        unsigned int v28 = [v27 isProtectedWithPasscode];

        if (v28) {
          -[NSMutableURLRequest ak_addPRKRequestHeader](v26, "ak_addPRKRequestHeader");
        }
        -[NSMutableURLRequest ak_addDeviceUDIDHeader](v26, "ak_addDeviceUDIDHeader");
        -[NSMutableURLRequest ak_addDeviceMLBHeader](v26, "ak_addDeviceMLBHeader");
        -[NSMutableURLRequest ak_addDeviceROMHeader](v26, "ak_addDeviceROMHeader");
        -[NSMutableURLRequest ak_addDeviceSerialNumberHeader](v26, "ak_addDeviceSerialNumberHeader");
        -[NSMutableURLRequest ak_addClientInfoHeader](v26, "ak_addClientInfoHeader");
        -[NSMutableURLRequest ak_addInternalBuildHeader](v26, "ak_addInternalBuildHeader");
        -[NSMutableURLRequest ak_addSeedBuildHeader](v26, "ak_addSeedBuildHeader");
        -[NSMutableURLRequest ak_addFeatureMaskHeader](v26, "ak_addFeatureMaskHeader");
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient name](self->_client, "name"));
        -[NSMutableURLRequest ak_addClientApp:](v26, "ak_addClientApp:", v29);

        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient bundleID](self->_client, "bundleID"));
        -[NSMutableURLRequest ak_addClientBundleIDHeader:](v26, "ak_addClientBundleIDHeader:", v30);

        -[NSMutableURLRequest ak_addAuthorizationHeaderWithIdentityToken:forAltDSID:]( v26,  "ak_addAuthorizationHeaderWithIdentityToken:forAltDSID:",  v23,  v9);
        uint64_t v31 = _AKLogSystem( -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v26,  "setValue:forHTTPHeaderField:",  v8,  @"X-Apple-I-Vetting-Token"));
        int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Vetting-token validation request is ready to go.",  buf,  2u);
        }

        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLSession sharedURLSession](&OBJC_CLASS___AKURLSession, "sharedURLSession"));
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472LL;
        v44[2] = sub_10003F520;
        v44[3] = &unk_1001C8180;
        v46 = v10;
        id v45 = v16;
        id v34 = [v33 beginDataTaskWithRequest:v26 completionHandler:v44];
      }

      else
      {
        uint64_t v26 = (NSMutableURLRequest *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7005LL));
        v10[2](v10, 0LL, v26);
      }

      uint64_t v18 = v43;
    }

    else
    {
      uint64_t v41 = _AKLogSystem(0LL);
      __int16 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_100133410();
      }

      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7037LL));
      v10[2](v10, 0LL, v25);
    }

    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(v58, 8);
  }

  else
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7055LL));
    v10[2](v10, 0LL, v40);
  }

- (void)isCreateAppleIDAllowedWithCompletion:(id)a3
{
  client = self->_client;
  id v4 = (void (**)(id, BOOL, void))a3;
  BOOL v5 = -[AKClient hasInternalPrivateAccess](client, "hasInternalPrivateAccess");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    id v11 = (id)objc_claimAutoreleasedReturnValue([v6 allAuthKitAccountsWithError:0]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aaf_firstObjectPassingTest:", &stru_1001C81C0));
    v4[2](v4, v7 == 0LL, 0LL);
  }

  else
  {
    uint64_t v8 = _AKLogSystem(v5);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100132D98();
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    ((void (**)(id, BOOL, void *))v4)[2](v4, 0, v10);
  }

- (void)checkSecurityUpgradeEligibilityForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  BOOL v8 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (!v8)
  {
    uint64_t v14 = _AKLogSystem(v8);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100132D98();
    }

    uint64_t v16 = -7026LL;
    goto LABEL_10;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);

  if (!v9)
  {
    uint64_t v17 = _AKLogSystem(v10);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10013374C();
    }

    uint64_t v16 = -7025LL;
LABEL_10:
    uint64_t v12 = (AKSecurityUpgradeEligibilityRequestProvider *)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:",  v16));
    v7[2](v7, 0LL, v12);
    goto LABEL_11;
  }

  id v11 = objc_alloc(&OBJC_CLASS___AKSecurityUpgradeEligibilityRequestProvider);
  uint64_t v12 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:]( v11,  "initWithContext:urlBagKey:",  v6,  AKURLBagKeyUpgradeEligibilityCheck);
  -[AKURLRequestProviderImpl setClient:](v12, "setClient:", self->_client);
  id v13 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v12);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10003FE18;
  v19[3] = &unk_1001C7F68;
  id v21 = v7;
  id v20 = v6;
  -[AKServiceControllerImpl executeRequestWithCompletion:](v13, "executeRequestWithCompletion:", v19);

LABEL_11:
}

- (void)performCheckInForAccountWithAltDSID:(id)a3 event:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *))a5;
  uint64_t v11 = _AKLogSystem(v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v23 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Check-in with IdMS requested for account with altDSID: %@",  buf,  0xCu);
  }

  if (!v8)
  {
    uint64_t v19 = -15002LL;
LABEL_11:
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_livenessErrorWithCode:](&OBJC_CLASS___NSError, "ak_livenessErrorWithCode:", v19));
    v10[2](v10, v13);
    goto LABEL_16;
  }

  if (!v9)
  {
    uint64_t v19 = -15003LL;
    goto LABEL_11;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager authKitAccountWithAltDSID:error:]( self->_accountManager,  "authKitAccountWithAltDSID:error:",  v8,  0LL));
  uint64_t v14 = _AKLogSystem(v13);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v23 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Performing liveness check-in for account: %@",  buf,  0xCu);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[AKAppleIDCheckInHelperService sharedService]( &OBJC_CLASS___AKAppleIDCheckInHelperService,  "sharedService"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000401D4;
    v20[3] = &unk_1001C6990;
    id v21 = v10;
    [v17 performCheckInForAccount:v13 event:v9 reason:6 completion:v20];

    uint64_t v18 = v21;
  }

  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1001337D8();
    }

    uint64_t v18 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:",  -7055LL));
    v10[2](v10, v18);
  }

LABEL_16:
}

- (void)performCheckInForAccountWithAltDSID:(id)a3 event:(id)a4 reason:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void *))a6;
  uint64_t v13 = _AKLogSystem(v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v25 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Check-in with IdMS requested for account with altDSID: %@",  buf,  0xCu);
  }

  if (!v10)
  {
    uint64_t v21 = -15002LL;
LABEL_11:
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_livenessErrorWithCode:](&OBJC_CLASS___NSError, "ak_livenessErrorWithCode:", v21));
    v12[2](v12, v15);
    goto LABEL_16;
  }

  if (!v11)
  {
    uint64_t v21 = -15003LL;
    goto LABEL_11;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager authKitAccountWithAltDSID:error:]( self->_accountManager,  "authKitAccountWithAltDSID:error:",  v10,  0LL));
  uint64_t v16 = _AKLogSystem(v15);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = v17;
  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v25 = v15;
      __int16 v26 = 2048;
      unint64_t v27 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Performing liveness check-in for account: %@ with reason: %lu",  buf,  0x16u);
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[AKAppleIDCheckInHelperService sharedService]( &OBJC_CLASS___AKAppleIDCheckInHelperService,  "sharedService"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100040440;
    v22[3] = &unk_1001C6990;
    id v23 = v12;
    [v19 performCheckInForAccount:v15 event:v11 reason:a5 completion:v22];

    id v20 = v23;
  }

  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1001337D8();
    }

    id v20 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:",  -7055LL));
    v12[2](v12, v20);
  }

LABEL_16:
}

- (void)reportSignOutForAppleID:(id)a3 service:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void, void *))a5;
  uint64_t v10 = _AKLogSystem(v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
    int v22 = 138412546;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Asked to report signout from service %@ for Apple ID: %@",  (uint8_t *)&v22,  0x16u);
  }

  BOOL v13 = -[AKClient hasInternalAccess](self->_client, "hasInternalAccess");
  if (!v13)
  {
    uint64_t v17 = _AKLogSystem(v13);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100132A48();
    }

    uint64_t v19 = -7026LL;
    goto LABEL_12;
  }

  if (!v8)
  {
    uint64_t v19 = -7022LL;
LABEL_12:
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v19));
    v9[2](v9, 0LL, v14);
    goto LABEL_18;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager authKitAccountWithAppleID:error:]( self->_accountManager,  "authKitAccountWithAppleID:error:",  v8,  0LL));
  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[AKAppleIDCheckInHelperService sharedService]( &OBJC_CLASS___AKAppleIDCheckInHelperService,  "sharedService"));
    uint64_t v16 = v15;
    if (a4) {
      [v15 reportSignOutEventForService:a4 account:v14 completion:v9];
    }
    else {
      [v15 reportFinalSignOutEventForAccount:v14 completion:v9];
    }
  }

  else
  {
    uint64_t v20 = _AKLogSystem(0LL);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100133838();
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7023LL));
    v9[2](v9, 0LL, v16);
  }

LABEL_18:
}

- (void)reportSignOutForAllAppleIDsWithCompletion:(id)a3
{
  uint64_t v17 = (void (**)(void))a3;
  uint64_t v4 = _AKLogSystem(v17);
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Asked to report signout for all Apple IDs",  buf,  2u);
  }

  BOOL v6 = -[AKClient hasWriteAccess](self->_client, "hasWriteAccess");
  if (v6)
  {
    id obj = (id)objc_claimAutoreleasedReturnValue( -[AKAccountManager allAuthKitAccountsWithError:]( self->_accountManager,  "allAuthKitAccountsWithError:",  0LL));
    if ([obj count])
    {
      *(void *)__int128 buf = 0LL;
      unint64_t v27 = buf;
      uint64_t v28 = 0x3032000000LL;
      uint64_t v29 = sub_10003E828;
      uint64_t v30 = sub_10003E838;
      id v31 = 0LL;
      id v7 = dispatch_group_create();
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      id obj = obj;
      id v8 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v23;
        do
        {
          for (i = 0LL; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v23 != v9) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
            dispatch_group_enter(v7);
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[AKAppleIDCheckInHelperService sharedService]( &OBJC_CLASS___AKAppleIDCheckInHelperService,  "sharedService"));
            v19[0] = _NSConcreteStackBlock;
            v19[1] = 3221225472LL;
            v19[2] = sub_1000409DC;
            v19[3] = &unk_1001C81E8;
            void v19[4] = v11;
            uint64_t v21 = buf;
            uint64_t v20 = v7;
            [v12 reportFinalSignOutEventForAccount:v11 completion:v19];
          }

          id v8 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
        }

        while (v8);
      }

      dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
      v17[2]();

      _Block_object_dispose(buf, 8);
    }

    else
    {
      uint64_t v15 = _AKLogSystem(0LL);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No IDMS accounts to sign out", buf, 2u);
      }

      ((void (*)(void (**)(void), uint64_t, void))v17[2])(v17, 1LL, 0LL);
    }
  }

  else
  {
    uint64_t v13 = _AKLogSystem(v6);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100133898();
    }

    id obj = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7026LL));
    ((void (*)(void (**)(void), void, id))v17[2])(v17, 0LL, obj);
  }
}

- (void)authenticateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)os_transaction_create("com.apple.akd.authenticate-with-context");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[AKAppleIDAuthenticationService _createProxAnalyticsForAuthenticationContextIfNeeded:]( self,  "_createProxAnalyticsForAuthenticationContextIfNeeded:",  v6));
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_100041014;
  v54[3] = &unk_1001C8210;
  id v10 = v8;
  id v55 = v10;
  v56 = self;
  id v11 = v9;
  id v57 = v11;
  id v12 = v6;
  id v58 = v12;
  id v13 = v7;
  id v59 = v13;
  uint64_t v14 = objc_retainBlock(v54);
  if (!+[AAFDeviceInfo isDeviceInDiagnosticMode](&OBJC_CLASS___AAFDeviceInfo, "isDeviceInDiagnosticMode")
    && (+[AAFDeviceInfo isDeviceUnlockedSinceBoot]( &OBJC_CLASS___AAFDeviceInfo,  "isDeviceUnlockedSinceBoot") & 1) == 0)
  {
    id v15 = [v12 allowAuthenticationBeforeFirstUnlock];
    if ((v15 & 1) == 0)
    {
      uint64_t v30 = _AKLogSystem(v15);
      id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Device should be unlocked after boot to continue authenticating.",  buf,  2u);
      }

      uint64_t v25 = -7123LL;
      goto LABEL_40;
    }
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 altDSID]);
  unsigned __int8 v18 = [v16 hasPersonaAvailableForAltDSID:v17];

  if ((v18 & 1) == 0)
  {
    uint64_t v23 = _AKLogSystem(v19);
    __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "No persona, account is being removed, no need to re-auth.",  buf,  2u);
    }

    uint64_t v25 = -7115LL;
    goto LABEL_40;
  }

  if ([v12 _capabilityForUIDisplay] == (id)3)
  {
    uint64_t v20 = _AKLogSystem(3LL);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "The UI Surrogate is finally here! Bypassing Traffic Controller...",  buf,  2u);
    }

    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationUILiaison surrogateManager](self->_authUILiaison, "surrogateManager"));
    [v22 registerUISurrogateContext:v12 client:self->_client completion:v14];
    goto LABEL_41;
  }

  id v26 = [v12 serviceType];
  if (!-[AKClient isPermittedForInteractiveAuthOnLimitedContext]( self->_client,  "isPermittedForInteractiveAuthOnLimitedContext"))
  {
    id v27 = [v12 isContextEligibleForSilentAuthCoercion];
    if ((_DWORD)v27 && v26 == (id)2)
    {
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[AKConfiguration sharedConfiguration](&OBJC_CLASS___AKConfiguration, "sharedConfiguration"));
      id v29 = [v28 shouldAllowExperimentalMode];

      if (v29 != (id)1) {
        goto LABEL_24;
      }
    }

    else if ((v27 & 1) == 0)
    {
      goto LABEL_24;
    }

    uint64_t v32 = _AKLogSystem(v27);
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      sub_1001339B8();
    }

    [v12 setAuthenticationType:0];
  }

- (void)_authenticateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v13 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 authKitAccount:&v13]);
  id v9 = v13;
  if (v8
    && -[AKAccountManager accountAccessTelemetryOptInForAccount:]( self->_accountManager,  "accountAccessTelemetryOptInForAccount:",  v8))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager telemetryDeviceSessionIDForAccount:]( self->_accountManager,  "telemetryDeviceSessionIDForAccount:",  v8));
    uint64_t v11 = _AKLogSystem([v6 setTelemetryDeviceSessionID:v10]);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1001339E4();
    }
  }

  if ([v6 needsRepair])
  {
    -[AKAppleIDAuthenticationService _repairAppleIDWithContext:completion:]( self,  "_repairAppleIDWithContext:completion:",  v6,  v7);
  }

  else if ([v6 needsCredentialRecovery])
  {
    -[AKAppleIDAuthenticationService _recoverCredentialsAndAuthenticateWithContext:completion:]( self,  "_recoverCredentialsAndAuthenticateWithContext:completion:",  v6,  v7);
  }

  else if (([v6 needsNewAppleID] & 1) != 0 {
         || [v6 needsNewChildAccount])
  }
  {
    -[AKAppleIDAuthenticationService _createNewAppleIDAndAuthenticateWithContext:completion:]( self,  "_createNewAppleIDAndAuthenticateWithContext:completion:",  v6,  v7);
  }

  else if ([v6 needsPasswordChange])
  {
    -[AKAppleIDAuthenticationService _changePasswordAndAuthenticateWithContext:completion:]( self,  "_changePasswordAndAuthenticateWithContext:completion:",  v6,  v7);
  }

  else if ([v6 needsSecurityUpgradeUI])
  {
    -[AKAppleIDAuthenticationService _upgradeSecurityLevelWithContext:completion:]( self,  "_upgradeSecurityLevelWithContext:completion:",  v6,  v7);
  }

  else
  {
    -[AKAppleIDAuthenticationService _performAuthenticationWithContext:completion:]( self,  "_performAuthenticationWithContext:completion:",  v6,  v7);
  }
}

- (void)_upgradeSecurityLevelWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting security upgrade flow…", buf, 2u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag sharedBag](&OBJC_CLASS___AKURLBag, "sharedBag"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 upgradeUIURL]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", v11));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10004166C;
  v15[3] = &unk_1001C8260;
  id v16 = v6;
  id v17 = v7;
  v15[4] = self;
  id v13 = v6;
  id v14 = v7;
  -[AKAppleIDAuthenticationService _showServerUIWithURLRequest:context:completion:]( self,  "_showServerUIWithURLRequest:context:completion:",  v12,  v13,  v15);
}

- (void)_performAuthenticationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = -[AKAppleIDAuthenticationService _isInteractiveAuthRequiredForContext:]( self,  "_isInteractiveAuthRequiredForContext:",  v6);
  BOOL v9 = v8;
  uint64_t v10 = _AKLogSystem(v8);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Current context requires interactive auth. Trying biometric/passcode first.",  buf,  2u);
    }

    -[AKAppleIDAuthenticationService _attemptBiometricOrPasscodeAuthWithContext:completion:]( self,  "_attemptBiometricOrPasscodeAuthWithContext:completion:",  v6,  v7);
  }

  else
  {
    if (v12)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Current context permits passwordless auth.",  buf,  2u);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100041A58;
    v13[3] = &unk_1001C8288;
    id v14 = v6;
    id v15 = self;
    id v16 = v7;
    -[AKAppleIDAuthenticationService _attemptPasswordlessAuthOptionsWithContext:completion:]( self,  "_attemptPasswordlessAuthOptionsWithContext:completion:",  v14,  v13);
  }
}

- (void)_handlePasswordlessAuthResults:(id)a3 context:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  if (v12 && [v11 authenticationType] == (id)1)
  {
    uint64_t v14 = _AKLogSystem(1LL);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100133A44();
    }

    NSErrorUserInfoKey v31 = NSUnderlyingErrorKey;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ac_secureCodingError"));
    uint64_t v32 = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));

    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAppleIDAuthenticationErrorDomain,  -7013LL,  v17));
    v13[2](v13, 0LL, v18);

    goto LABEL_19;
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 domain]);
  if ([v19 isEqualToString:AKAppleIDAuthenticationErrorDomain])
  {
    if ([v12 code] == (id)-7065)
    {

LABEL_11:
      uint64_t v22 = _AKLogSystem(v20);
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Canceling auth attempt because credential access is unavailable.",  buf,  2u);
      }

      v13[2](v13, 0LL, v12);
      goto LABEL_19;
    }

    unsigned __int8 v21 = objc_msgSend(v12, "ak_isIncompatibleDevicesError");

    if ((v21 & 1) != 0) {
      goto LABEL_11;
    }
  }

  else
  {
  }

  if (!v12
    || [v12 code] == (id)-7120
    || ([v11 piggybackingForTrustedDevice] & 1) != 0
    || (id v24 = objc_msgSend(v12, "ak_isServiceError"), (v24 & 1) != 0))
  {
    ((void (**)(id, id, void *))v13)[2](v13, v10, v12);
  }

  else
  {
    uint64_t v25 = _AKLogSystem(v24);
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "All non-interactive auth options failed. Trying interactive auth.",  buf,  2u);
    }

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100041F4C;
    v27[3] = &unk_1001C7640;
    id v28 = v12;
    id v29 = v13;
    -[AKAppleIDAuthenticationService _attemptInteractiveAuthWithContext:completion:]( self,  "_attemptInteractiveAuthWithContext:completion:",  v11,  v27);
  }

- (BOOL)_isInteractiveAuthRequiredForContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v45 = 138412290;
    *(void *)&v45[4] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Determining if interactive auth is required for context %@...",  v45,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 proxiedDeviceAnisetteData]);
  id v8 = [v4 authenticationType];
  if (v8 == (id)2 || (id v8 = [v4 authenticationType], v8 == (id)3))
  {
    uint64_t v9 = _AKLogSystem(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v4 authenticationType];
      *(_DWORD *)id v45 = 134217984;
      *(void *)&v45[4] = v11;
      id v12 = "Context is explicitly configured for interactive auth %lul.";
      id v13 = v10;
      uint32_t v14 = 12;
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, v45, v14);
    }

- (id)_createProxAnalyticsForAuthenticationContextIfNeeded:(id)a3
{
  id v3 = a3;
  id v22 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 authKitAccount:&v22]);
  id v5 = v22;
  id v6 = v5;
  if (!v4 || v5)
  {
    uint64_t v7 = _AKLogSystem(v5);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100133A9C();
    }
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 companionKeyEnvelope]);
  unsigned int v11 = v10 != 0LL;

  if (v4) {
    unsigned int v11 = [v9 accountIsSignedIntoServices:v4] ^ 1;
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 companionDevice]);
  if (v12)
  {
    BOOL v13 = 1;
  }

  else
  {
    uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 companionDeviceAnisetteData]);
    if (v14)
    {
      BOOL v13 = 1;
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 companionKeyEnvelope]);
      BOOL v13 = v15 != 0LL;
    }
  }

  if (v13) {
    unsigned int v17 = v11;
  }
  else {
    unsigned int v17 = 0;
  }
  if (v17 == 1)
  {
    uint64_t v18 = _AKLogSystem(v16);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_100133A70();
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[AAFAnalyticsEvent ak_analyticsEventWithEventName:account:error:]( &OBJC_CLASS___AAFAnalyticsEvent,  "ak_analyticsEventWithEventName:account:error:",  @"com.apple.authkit.proximityAuthentication",  v4,  0LL));
  }

  else
  {
    uint64_t v20 = 0LL;
  }

  return v20;
}

- (void)_finishAnalyticsEvent:(id)a3 authenticationResults:(id)a4 authenticationContext:(id)a5 error:(id)a6
{
  if (a3)
  {
    id v9 = a6;
    id v10 = a5;
    id v11 = a4;
    id v12 = a3;
    uint64_t v13 = _AKLogSystem(v12);
    uint32_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_100133AFC();
    }

    objc_msgSend(v12, "ak_updateWithAuthenticationResults:authContext:error:", v11, v10, v9);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[AKAnalyticsReporterRTC rtcAnalyticsReporter]( &OBJC_CLASS___AKAnalyticsReporterRTC,  "rtcAnalyticsReporter"));
    [v15 sendEvent:v12];
  }

- (void)performPasswordResetWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient bundleID](self->_client, "bundleID"));
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v29 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Password reset request received from client: %@",  buf,  0xCu);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000429BC;
  v26[3] = &unk_1001C7B60;
  id v11 = v7;
  id v27 = v11;
  id v12 = objc_retainBlock(v26);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
  unsigned __int8 v14 = [v13 isForgotPasswordNativeTakeoverEnabled];

  if ((v14 & 1) != 0)
  {
    if (-[AKClient hasOwnerAccess](self->_client, "hasOwnerAccess")
      || (BOOL v16 = -[AKClient hasInternalAccess](self->_client, "hasInternalAccess")))
    {
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 primaryAuthKitAccount]);

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 username]);
      [v6 setUsername:v19];

      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDAuthenticationService passwordResetPresenter](self, "passwordResetPresenter"));
      [v20 presentWithContext:v6 completion:v12];

LABEL_12:
      goto LABEL_13;
    }

    uint64_t v24 = _AKLogSystem(v16);
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100133B28();
    }

    if (v12)
    {
      uint64_t v23 = -7026LL;
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v21 = _AKLogSystem(v15);
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_100133B54();
    }

    if (v12)
    {
      uint64_t v23 = -7027LL;
LABEL_11:
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v23));
      ((void (*)(void *, void, void *))v12[2])(v12, 0LL, v18);
      goto LABEL_12;
    }
  }

- (void)_attemptBiometricOrPasscodeAuthWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isContextEligibleForPasscodeAuth] & 1) != 0
    || (id v8 = [v6 isContextEligibleForBiometricOrPasscodeAuth], (_DWORD)v8))
  {
    -[AKAppleIDAuthenticationService _showBiometricOrPasscodeAuthWithContext:completion:]( self,  "_showBiometricOrPasscodeAuthWithContext:completion:",  v6,  v7);
  }

  else
  {
    uint64_t v9 = _AKLogSystem(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Biometric/Passcode validation not possible for current context.",  v11,  2u);
    }

    -[AKAppleIDAuthenticationService _attemptInteractiveAuthWithContext:completion:]( self,  "_attemptInteractiveAuthWithContext:completion:",  v6,  v7);
  }
}

- (void)_showBiometricOrPasscodeAuthWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Collecting biometric/passcode validation...",  buf,  2u);
  }

  authUILiaison = self->_authUILiaison;
  client = self->_client;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100042C2C;
  v14[3] = &unk_1001C82D8;
  void v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  -[AKAuthenticationUILiaison presentBiometricOrPasscodeValidationForContext:client:completion:]( authUILiaison,  "presentBiometricOrPasscodeValidationForContext:client:completion:",  v13,  client,  v14);
}

- (void)_attemptPasswordlessAuthOptionsWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 isConfiguredForTokenUpgrade];
  if ((_DWORD)v8)
  {
    uint64_t v9 = _AKLogSystem(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Context is configured for token upgrade.",  buf,  2u);
    }

    id v11 = -[AKTokenUpgrader initWithClient:]( objc_alloc(&OBJC_CLASS___AKTokenUpgrader),  "initWithClient:",  self->_client);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100042F94;
    v13[3] = &unk_1001C8328;
    unsigned __int8 v14 = v11;
    id v15 = self;
    id v16 = v6;
    id v17 = v7;
    id v12 = v11;
    -[AKTokenUpgrader upgradeTokenWithContext:completion:](v12, "upgradeTokenWithContext:completion:", v16, v13);
  }

  else
  {
    -[AKAppleIDAuthenticationService _attemptPasswordlessAuthWithContext:completion:]( self,  "_attemptPasswordlessAuthWithContext:completion:",  v6,  v7);
  }
}

- (void)_attemptPasswordlessAuthWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10004334C;
  v9[3] = &unk_1001C8378;
  id v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  -[AKAppleIDAuthenticationService _accountForContinuationWithContext:completion:]( self,  "_accountForContinuationWithContext:completion:",  v7,  v9);
}

- (void)_accountForContinuationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v14 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[AKAppleIDAuthenticationService _accountForContinuationWithContext:error:]( self,  "_accountForContinuationWithContext:error:",  v6,  &v14));
  id v9 = v14;
  if (v8)
  {
    v7[2](v7, v8, 0LL);
  }

  else
  {
    id v10 = [v6 isUsernameEditable];
    if ((_DWORD)v10)
    {
      uint64_t v11 = _AKLogSystem(v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Silent auth not allowed due to username being editable",  (uint8_t *)&v13,  2u);
      }

      -[AKAppleIDAuthenticationService _showContinueUsingUIWithContext:completion:]( self,  "_showContinueUsingUIWithContext:completion:",  v6,  v7);
    }

    else
    {
      ((void (**)(id, void *, id))v7)[2](v7, 0LL, v9);
    }
  }
}

- (void)_showContinueUsingUIWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AKAccountManager isAccountsFrameworkAvailable](&OBJC_CLASS___AKAccountManager, "isAccountsFrameworkAvailable");
  if ((v8 & 1) == 0)
  {
    uint64_t v18 = _AKLogSystem(v8);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Accounts not available, skipping IDMS account lookup...",  buf,  2u);
    }

    goto LABEL_13;
  }

  if ([v6 _capabilityForUIDisplay] != (id)2)
  {
LABEL_13:
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    goto LABEL_20;
  }

  uint64_t v9 = _AKLogSystem(2LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Looking for IDMS accounts to suggest using...",  buf,  2u);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager mostRecentlyUsedAuthKitAccount]( self->_accountManager,  "mostRecentlyUsedAuthKitAccount"));
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager continuationTokenForAccount:]( self->_accountManager,  "continuationTokenForAccount:",  v11));
    if (v12)
    {
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 username]);
      uint64_t v14 = _AKLogSystem(v13);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v27 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Telling client to ask the user about using Apple ID: %@",  buf,  0xCu);
      }

      authUILiaison = self->_authUILiaison;
      client = self->_client;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_100043AD4;
      v22[3] = &unk_1001C83C8;
      id v25 = v7;
      void v22[4] = self;
      id v23 = v6;
      id v24 = v11;
      -[AKAuthenticationUILiaison presentKeepUsingUIForContext:client:appleID:completion:]( authUILiaison,  "presentKeepUsingUIForContext:client:appleID:completion:",  v23,  client,  v13,  v22);
    }

    else
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    }
  }

  else
  {
    uint64_t v20 = _AKLogSystem(0LL);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Nothing found.", buf, 2u);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }

LABEL_20:
}

- (id)_accountForContinuationWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[AKAccountManager isAccountsFrameworkAvailable](&OBJC_CLASS___AKAccountManager, "isAccountsFrameworkAvailable");
  if ((v7 & 1) != 0)
  {
    id v8 = [v6 isUsernameEditable];
    if ((_DWORD)v8)
    {
      uint64_t v9 = _AKLogSystem(v8);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        uint64_t v11 = "Rejecting CK auth because username is marked as editable";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
        goto LABEL_8;
      }

      goto LABEL_8;
    }

    id v32 = 0LL;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 authKitAccount:&v32]);
    id v15 = v32;
    uint64_t v16 = _AKLogSystem(v15);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v18)
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v36 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Found an existing IDMS account %@",  buf,  0xCu);
      }

      accountManager = self->_accountManager;
      id v31 = 0LL;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager continuationTokenForAccount:error:]( accountManager,  "continuationTokenForAccount:error:",  v14,  &v31));
      uint64_t v21 = (os_log_s *)v31;
      id v17 = v21;
      if (v20)
      {
        id v22 = v14;
      }

      else
      {
        uint64_t v24 = _AKLogSystem(v21);
        id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_100133B80();
        }

        id v26 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s domain](v17, "domain"));
        if ([v26 isEqualToString:ACErrorDomain])
        {
          id v27 = -[os_log_s code](v17, "code");

          if (v27 == (id)10)
          {
            if (a4)
            {
              uint64_t v28 = AKAppleIDAuthenticationErrorDomain;
              NSErrorUserInfoKey v33 = NSUnderlyingErrorKey;
              uint64_t v34 = v17;
              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
              *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v28,  -7065LL,  v29));
            }

            id v10 = 0LL;
            goto LABEL_28;
          }
        }

        else
        {
        }

        id v22 = 0LL;
      }
    }

    else
    {
      if (v18)
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 username]);
        *(_DWORD *)__int128 buf = 138412290;
        id v36 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "No existing IDMS account for %@",  buf,  0xCu);
      }

      id v22 = 0LL;
    }

    id v10 = (os_log_s *)v22;
LABEL_28:

    __int16 v13 = v10;
    goto LABEL_29;
  }

  uint64_t v12 = _AKLogSystem(v7);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    uint64_t v11 = "Accounts not available, skipping IDMS account lookup...";
    goto LABEL_7;
  }

- (void)_attemptInteractiveAuthWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 username]);
  if ([v8 length])
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 _password]);
    id v10 = [v9 length];

    if (v10)
    {
      uint64_t v12 = _AKLogSystem(v11);
      __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Username and password already provided by context. One shot at non-interactive auth.",  buf,  2u);
      }

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 username]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 _password]);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_100044240;
      v22[3] = &unk_1001C7FE0;
      id v23 = v6;
      uint64_t v24 = self;
      id v25 = v7;
      -[AKAppleIDAuthenticationService _verifyUsername:password:context:completion:]( self,  "_verifyUsername:password:context:completion:",  v14,  v15,  v23,  v22);

      goto LABEL_12;
    }
  }

  else
  {
  }

  id v16 = [v6 _shouldSkipInitialReachabilityCheck];
  if ((v16 & 1) != 0
    || (id v16 = -[CUTReachability currentReachabilityStatus](self->_reachability, "currentReachabilityStatus")) != 0LL)
  {
    uint64_t v17 = _AKLogSystem(v16);
    BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_100133BE4();
    }

    -[AKAppleIDAuthenticationService _performInteractiveAuthWithContext:completion:]( self,  "_performInteractiveAuthWithContext:completion:",  v6,  v7);
  }

  else
  {
    uint64_t v19 = _AKLogSystem(0LL);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100133C10();
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7005LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v21);
  }

- (void)refreshAuthMetadataWithContext:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004448C;
  v7[3] = &unk_1001C7EC8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[AKAppleIDAuthenticationService _refreshLocalAccountAndUpdateContext:completion:]( v8,  "_refreshLocalAccountAndUpdateContext:completion:",  v6,  v7);
}

- (void)_performInteractiveAuthWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10004472C;
  v9[3] = &unk_1001C8418;
  uint64_t v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v12;
  id v8 = v6;
  -[AKAppleIDAuthenticationService refreshAuthMetadataWithContext:completion:]( self,  "refreshAuthMetadataWithContext:completion:",  v8,  v9);
}

- (BOOL)_shouldBroadcastForProximity:(id)a3
{
  return 0;
}

- (void)_performInteractiveFederatedAuthWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100133C68();
  }

  authUILiaison = self->_authUILiaison;
  client = self->_client;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100044B8C;
  v14[3] = &unk_1001C8440;
  id v15 = v6;
  id v16 = v7;
  void v14[4] = self;
  id v12 = v6;
  id v13 = v7;
  -[AKAuthenticationUILiaison fetchUICapableContext:client:completion:]( authUILiaison,  "fetchUICapableContext:client:completion:",  v12,  client,  v14);
}

- (void)_correlateContext:(id)a3 withAuthModeInformation:(id)a4
{
  BOOL var1 = a4.var1;
  unint64_t var0 = a4.var0;
  id v7 = a3;
  [v7 setAuthenticationMode:var0];
  if (+[AKFeatureManager isEnforceMDMPolicyEnabled]( &OBJC_CLASS___AKFeatureManager,  "isEnforceMDMPolicyEnabled")) {
    [v7 setIsMDMInformationRequired:var1];
  }
  id v6 = objc_alloc_init(&OBJC_CLASS___AKAuthenticationContextSanitizer);
  -[AKAuthenticationContextSanitizer sanitizeContext:](v6, "sanitizeContext:", v7);
}

- (void)_updateAltDSIDAndUsername:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 altDSID]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 altDSID]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 authKitAccountWithAltDSID:v6 error:0]);

    if (!v7) {
      goto LABEL_16;
    }
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 username]);
    if (!v8) {
      goto LABEL_16;
    }
    id v9 = (void *)v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 username]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 username]);
    unsigned __int8 v12 = [v10 isEqualToString:v11];

    if ((v12 & 1) != 0) {
      goto LABEL_16;
    }
    uint64_t v14 = _AKLogSystem(v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_FAULT))
    {
LABEL_15:

      NSErrorUserInfoKey v33 = (void *)objc_claimAutoreleasedReturnValue([v7 username]);
      [v3 setUsername:v33];

LABEL_16:
      goto LABEL_17;
    }

- (void)_refreshLocalAccountAndUpdateContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100133F00();
  }

  if ([v6 _shouldRefreshAccountAndUpdateContext])
  {
    -[AKAppleIDAuthenticationService _updateAltDSIDAndUsername:](self, "_updateAltDSIDAndUsername:", v6);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);

    if (v10)
    {
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[AKUserInfoController sharedController](&OBJC_CLASS___AKUserInfoController, "sharedController"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 authKitAccount:0]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 previousAccountInfoRefreshDateForAccount:v13]);

      if (v14
        && (id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date")),
            [v15 timeIntervalSinceDate:v14],
            double v17 = v16,
            v15,
            v17 < 86400.0))
      {
        uint64_t v19 = _AKLogSystem(v18);
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Last account info validation was less than 24 hours ago. Skipping.",  buf,  2u);
        }

        (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
      }

      else
      {
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
        client = self->_client;
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = sub_100045374;
        v25[3] = &unk_1001C8468;
        id v28 = v7;
        id v26 = v6;
        id v27 = self;
        [v12 fetchUserInformationForAltDSID:v21 client:client completion:v25];
      }
    }

    else
    {
      uint64_t v23 = _AKLogSystem(v11);
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "No altDSID on context. Nothing to validate.",  buf,  2u);
      }

      (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    }
  }

  else
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1LL, 0LL);
  }
}

- (void)_refreshAuthModeIfNecessaryForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 username]);
  if (!v8) {
    goto LABEL_8;
  }
  id v9 = (void *)v8;
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 username]);
  if (!v10)
  {

LABEL_11:
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 authKitAccount:0]);
    if (v13)
    {
      id v14 = -[AKAccountManager shouldUpdateAuthModeForAccount:]( self->_accountManager,  "shouldUpdateAuthModeForAccount:",  v13);
      int v15 = (int)v14;
      uint64_t v16 = _AKLogSystem(v14);
      double v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (v18)
        {
          LOWORD(v24) = 0;
          uint64_t v19 = "More than 24 hours since the last authentication mode was obtained, fetching authentication mode...";
LABEL_25:
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v24, 2u);
          goto LABEL_26;
        }

        goto LABEL_26;
      }

      if (v18)
      {
        LOWORD(v24) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Less than 24 hours since the last authentication mode was obtained, using last known authentication mode",  (uint8_t *)&v24,  2u);
      }

      -[AKAppleIDAuthenticationService _correlateContext:withAuthModeInformation:]( self,  "_correlateContext:withAuthModeInformation:",  v6,  -[AKAccountManager authenticationModeForAccount:](self->_accountManager, "authenticationModeForAccount:", v13),  -[AKAccountManager mdmInformationRequiredForAccount:]( self->_accountManager,  "mdmInformationRequiredForAccount:",  v13));
    }

    else
    {
      id v20 = [v6 authenticationMode];
      uint64_t v21 = _AKLogSystem(v20);
      double v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      BOOL v22 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (!v20)
      {
        if (v22)
        {
          LOWORD(v24) = 0;
          uint64_t v19 = "No AuthKit account and authentication mode is unknown, fetching authentication mode...";
          goto LABEL_25;
        }

- (void)_refreshAuthModeFromServerForContext:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000459E8;
  v8[3] = &unk_1001C8490;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  -[AKAppleIDAuthenticationService _fetchAuthModeInfoWithContext:completion:]( self,  "_fetchAuthModeInfoWithContext:completion:",  v6,  v8);
}

- (void)_handleBasicLoginUICompletionWithUsername:(id)a3 password:(id)a4 context:(id)a5 additionalData:(id)a6 collectionError:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472LL;
  v87[2] = sub_100046174;
  v87[3] = &unk_1001C7FE0;
  v87[4] = self;
  id v20 = v16;
  id v88 = v20;
  id v21 = v19;
  id v89 = v21;
  BOOL v22 = objc_retainBlock(v87);
  if (v18)
  {
    id v65 = v17;
    id v66 = v14;
    id v23 = v15;
    int v24 = (void *)objc_claimAutoreleasedReturnValue([v18 domain]);
    uint64_t v25 = AKAppleIDAuthenticationErrorDomain;
    if ([v24 isEqual:AKAppleIDAuthenticationErrorDomain])
    {
      id v26 = [v18 code];

      if (v26 == (id)-7017LL)
      {
        uint64_t v28 = _AKLogSystem(v27);
        uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "User forgot their credentials.", buf, 2u);
        }

        id v15 = v23;
        id v14 = v66;
        if (v66) {
          [v20 setUsername:v66];
        }
        v82[0] = _NSConcreteStackBlock;
        v82[1] = 3221225472LL;
        v82[2] = sub_1000462B8;
        v82[3] = &unk_1001C84E0;
        v82[4] = self;
        id v83 = v20;
        id v84 = v21;
        v85 = v22;
        -[AKAppleIDAuthenticationService _recoverCredentialsAndAuthenticateWithContext:completion:]( self,  "_recoverCredentialsAndAuthenticateWithContext:completion:",  v83,  v82);

LABEL_9:
        id v17 = v65;
        goto LABEL_33;
      }
    }

    else
    {
    }

    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v18 domain]);
    if ([v35 isEqual:v25])
    {
      id v36 = [v18 code];

      if (v36 == (id)-7016LL)
      {
        uint64_t v38 = _AKLogSystem(v37);
        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        id v15 = v23;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "User requested a new Apple ID.", buf, 2u);
        }

        v78[0] = _NSConcreteStackBlock;
        v78[1] = 3221225472LL;
        v78[2] = sub_100046330;
        v78[3] = &unk_1001C84E0;
        v78[4] = self;
        id v79 = v20;
        id v80 = v21;
        v81 = v22;
        -[AKAppleIDAuthenticationService _createNewAppleIDAndAuthenticateWithContext:completion:]( self,  "_createNewAppleIDAndAuthenticateWithContext:completion:",  v79,  v78);

        goto LABEL_32;
      }
    }

    else
    {
    }

    id v40 = objc_msgSend(v18, "ak_isUserCancelError");
    id v15 = v23;
    if ((_DWORD)v40)
    {
      uint64_t v41 = _AKLogSystem(v40);
      unsigned __int8 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        uint64_t v43 = "User canceled. Aborting auth.";
LABEL_30:
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, v43, buf, 2u);
      }
    }

    else
    {
      id v44 = objc_msgSend(v18, "ak_isIncompatibleDevicesError");
      if (!(_DWORD)v44)
      {
        id v46 = objc_msgSend(v18, "ak_isUnableToPromptError");
        if ((v46 & 1) != 0
          || (id v46 = objc_msgSend(v18, "ak_isSurrogateAuthAlreadyInProgressError"), (_DWORD)v46))
        {
          uint64_t v47 = _AKLogSystem(v46);
          v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Unable to show prompt. Aborting auth.",  buf,  2u);
          }

          id v49 = (void *)objc_claimAutoreleasedReturnValue([v18 userInfo]);
          uint64_t v50 = objc_claimAutoreleasedReturnValue([v49 objectForKeyedSubscript:NSUnderlyingErrorKey]);
          id v51 = (void *)v50;
          if (v50) {
            uint64_t v52 = (void *)v50;
          }
          else {
            uint64_t v52 = v18;
          }
          id v53 = v52;

          (*((void (**)(id, void, id))v21 + 2))(v21, 0LL, v53);
          goto LABEL_32;
        }

        uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v18 domain]);
        if ([v54 isEqual:v25])
        {
          unsigned int v55 = [v20 _keepAlive];

          if (v55)
          {
            -[AKAppleIDAuthenticationService _keepLoginAliveWithContext:error:andCompletion:]( self,  "_keepLoginAliveWithContext:error:andCompletion:",  v20,  v18,  v21);
            id v15 = v23;
            goto LABEL_32;
          }
        }

        else
        {
        }

        v56 = (void *)objc_claimAutoreleasedReturnValue([v18 domain]);
        if ([v56 isEqual:v25])
        {
          id v57 = [v18 code];

          if (v57 == (id)-7048LL)
          {
            uint64_t v59 = _AKLogSystem(v58);
            unsigned __int8 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
            id v15 = v23;
            if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_31;
            }
            *(_WORD *)__int128 buf = 0;
            uint64_t v43 = "User request client alternate action. Aborting auth.";
            goto LABEL_30;
          }
        }

        else
        {
        }

        id v60 = objc_msgSend(v18, "ak_isUserTryAgainError");
        int v61 = (int)v60;
        uint64_t v62 = _AKLogSystem(v60);
        v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
        v64 = v63;
        id v15 = v23;
        if (v61)
        {
          id v14 = v66;
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "User chose to try again, aka retry auth.",  buf,  2u);
          }

          -[AKAppleIDAuthenticationService _showAlertForVerificationError:context:completion:]( self,  "_showAlertForVerificationError:context:completion:",  v18,  v20,  v21);
        }

        else
        {
          id v14 = v66;
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
            sub_10013400C();
          }

          (*((void (**)(id, void, id))v21 + 2))(v21, 0LL, v18);
        }

        goto LABEL_9;
      }

      uint64_t v45 = _AKLogSystem(v44);
      unsigned __int8 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        uint64_t v43 = "User has incompatible devices. Aborting auth.";
        goto LABEL_30;
      }
    }

- (void)_keepLoginAliveWithContext:(id)a3 error:(id)a4 andCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _AKLogSystem(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Prompt should be kept alive, retry auth.",  v13,  2u);
  }

  if (v9 && (objc_msgSend(v9, "ak_isUserCancelError") & 1) == 0) {
    -[AKAppleIDAuthenticationService _showAlertForVerificationError:context:completion:]( self,  "_showAlertForVerificationError:context:completion:",  v9,  v8,  v10);
  }
  else {
    -[AKAppleIDAuthenticationService _authenticateWithContext:completion:]( self,  "_authenticateWithContext:completion:",  v8,  v10);
  }
}

- (void)_handleMissingUsernameOrPasswordForContext:(id)a3 password:(id)a4 username:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v12 length])
  {
    [v10 setUsername:v12];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100046B18;
    v20[3] = &unk_1001C7EC8;
    id v21 = v10;
    BOOL v22 = self;
    id v23 = v13;
    -[AKAppleIDAuthenticationService refreshAuthMetadataWithContext:completion:]( self,  "refreshAuthMetadataWithContext:completion:",  v21,  v20);

    id v14 = v21;
  }

  else
  {
    uint64_t v15 = _AKLogSystem(0LL);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Username was not entered.", v19, 2u);
    }

    if (![v11 length])
    {
      uint64_t v17 = _AKLogSystem(0LL);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Password was not entered.", v19, 2u);
      }
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7012LL));
    -[AKAppleIDAuthenticationService _showAlertForVerificationError:context:completion:]( self,  "_showAlertForVerificationError:context:completion:",  v14,  v10,  v13);
  }
}

- (void)_handleVerificationError:(id)a3 forContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (!objc_msgSend(v8, "ak_isUserCancelError"))
  {
    if ([v8 code] != (id)-7006)
    {
      -[AKAppleIDAuthenticationService _showAlertForVerificationError:context:completion:]( self,  "_showAlertForVerificationError:context:completion:",  v8,  v9,  v10);
      goto LABEL_12;
    }

    id v16 = 0LL;
    unsigned int v11 = -[AKAppleIDAuthenticationService _incrementAttemptsForContext:error:]( self,  "_incrementAttemptsForContext:error:",  v9,  &v16);
    id v12 = v16;
    if (v11)
    {
      if ([v9 _capabilityForUIDisplay] != (id)2)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:underlyingError:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:underlyingError:",  -7017LL,  v8));
        v10[2](v10, 0LL, v15);

        goto LABEL_11;
      }

      id v13 = self;
      id v14 = v12;
    }

    else
    {
      id v13 = self;
      id v14 = v8;
    }

    -[AKAppleIDAuthenticationService _showAlertForVerificationError:context:completion:]( v13,  "_showAlertForVerificationError:context:completion:",  v14,  v9,  v10);
LABEL_11:

    goto LABEL_12;
  }

  v10[2](v10, 0LL, v8);
LABEL_12:
}

- (void)_showAlertForVerificationError:(id)a3 context:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100046ED4;
  v9[3] = &unk_1001C83F0;
  id v10 = self;
  id v11 = a4;
  id v12 = a5;
  id v7 = v12;
  id v8 = v11;
  -[AKAppleIDAuthenticationService _showAlertForLoginError:context:completion:]( v10,  "_showAlertForLoginError:context:completion:",  a3,  v8,  v9);
}

- (BOOL)_incrementAttemptsForContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 username]);
  if (![v6 length])
  {

LABEL_12:
    BOOL v16 = 0;
    goto LABEL_13;
  }

  unsigned __int8 v7 = [v5 isUsernameEditable];

  if ((v7 & 1) != 0) {
    goto LABEL_12;
  }
  uint64_t v9 = _AKLogSystem(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v5 _attemptIndex]));
    int v18 = 138412290;
    id v19 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Auth attempt %@ has failed. Incrementing counter...",  (uint8_t *)&v18,  0xCu);
  }

  objc_msgSend(v5, "set_attemptIndex:", (char *)objc_msgSend(v5, "_attemptIndex") + 1);
  id v12 = [v5 _attemptIndex];
  id v13 = [v5 maximumLoginAttempts];
  if (v12 < v13) {
    goto LABEL_12;
  }
  uint64_t v14 = _AKLogSystem(v13);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Maximum password auth attempts have been reached.",  (uint8_t *)&v18,  2u);
  }

  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7028LL));
  }
  BOOL v16 = 1;
LABEL_13:

  return v16;
}

- (void)_titleAndMessageForError:(id)a3 context:(id)a4 completion:(id)a5
{
  id v61 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, void *))a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v61 domain]);
  unsigned int v13 = [v12 isEqualToString:AKAppleIDAuthenticationErrorDomain];

  if (!v13)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v61 domain]);
    unsigned int v21 = [v20 isEqualToString:NSURLErrorDomain];

    if (!v21) {
      goto LABEL_62;
    }
LABEL_6:
    -[AKAppleIDAuthenticationService _titleAndMessageForBadNetworkRelatedErrorWithCompletion:]( self,  "_titleAndMessageForBadNetworkRelatedErrorWithCompletion:",  v11);
    BOOL v22 = 0LL;
    uint64_t v15 = 0LL;
    goto LABEL_67;
  }

  if ([v61 code] == (id)-7006)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"WRONG_PASSWORD_ALERT_TITLE" value:&stru_1001D1450 table:@"Localizable"]);

    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    uint64_t v17 = @"WRONG_PASSWORD_ALERT_MESSAGE";
    unsigned __int8 v18 = [@"WRONG_PASSWORD_ALERT_MESSAGE" containsString:@"REBRAND"];
    if ((v18 & 1) != 0)
    {
      int v19 = 0;
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
      if ([v6 isAABrandingEnabled])
      {
        uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue( [@"WRONG_PASSWORD_ALERT_MESSAGE" stringByAppendingString:@"_REBRAND"]);
        int v19 = 1;
      }

      else
      {
        int v19 = 0;
      }
    }

    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v16 localizedStringForKey:v17 value:&stru_1001D1450 table:@"Localizable"]);
    if (v19) {

    }
    if ((v18 & 1) == 0) {
    goto LABEL_65;
    }
  }

  if ([v61 code] == (id)-7012)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    int v24 = @"MISSING_INPUT_ALERT_TITLE";
    unsigned __int8 v25 = [@"MISSING_INPUT_ALERT_TITLE" containsString:@"REBRAND"];
    if ((v25 & 1) != 0)
    {
      int v26 = 0;
    }

    else
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
      if ([v5 isAABrandingEnabled])
      {
        int v24 = (__CFString *)objc_claimAutoreleasedReturnValue( [@"MISSING_INPUT_ALERT_TITLE" stringByAppendingString:@"_REBRAND"]);
        int v26 = 1;
      }

      else
      {
        int v26 = 0;
      }
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v23 localizedStringForKey:v24 value:&stru_1001D1450 table:@"Localizable"]);
    if (v26) {

    }
    if ((v25 & 1) == 0) {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    }
    BOOL v16 = v28;
    uint64_t v29 = @"MISSING_INPUT_ALERT_MESSAGE";
    goto LABEL_63;
  }

  if ([v61 code] == (id)-7005 || objc_msgSend(v61, "code") == (id)-7029) {
    goto LABEL_6;
  }
  if ([v61 code] == (id)-7036)
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( [v27 localizedStringForKey:@"CODE_INVALID_TITLE" value:&stru_1001D1450 table:@"Localizable"]);

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    BOOL v16 = v28;
    uint64_t v29 = @"CODE_INVALID_MESSAGE";
LABEL_63:
    uint64_t v51 = objc_claimAutoreleasedReturnValue([v28 localizedStringForKey:v29 value:&stru_1001D1450 table:@"Localizable"]);
    goto LABEL_64;
  }

  if ([v61 code] == (id)-7043)
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( [v30 localizedStringForKey:@"UNDERAGE_ALERT_TITLE" value:&stru_1001D1450 table:@"Localizable"]);

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    BOOL v16 = v28;
    uint64_t v29 = @"UNDERAGE_ALERT_MESSAGE";
    goto LABEL_63;
  }

  if ([v61 code] == (id)-7093)
  {
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    uint64_t v32 = @"APPLE_MANAGED_ACCOUNT_SIGN_IN_PROHIBITED_TITLE";
    unsigned __int8 v33 = [@"APPLE_MANAGED_ACCOUNT_SIGN_IN_PROHIBITED_TITLE" containsString:@"REBRAND"];
    if ((v33 & 1) != 0)
    {
      int v34 = 0;
    }

    else
    {
      id v60 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
      if ([v60 isAABrandingEnabled])
      {
        uint64_t v32 = (__CFString *)objc_claimAutoreleasedReturnValue( [@"APPLE_MANAGED_ACCOUNT_SIGN_IN_PROHIBITED_TITLE" stringByAppendingString:@"_REBRAND"]);
        int v34 = 1;
      }

      else
      {
        int v34 = 0;
      }
    }

    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v31 localizedStringForKey:v32 value:&stru_1001D1450 table:@"Localizable"]);
    id v46 = (void *)objc_claimAutoreleasedReturnValue([v10 username]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v45, v46));

    if (v34) {
    if ((v33 & 1) == 0)
    }

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    BOOL v16 = v28;
    uint64_t v29 = @"APPLE_MANAGED_ACCOUNT_SIGN_IN_PROHIBITED_MESSAGE";
    goto LABEL_63;
  }

  if ([v61 code] == (id)-7094)
  {
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    id v36 = (void *)objc_claimAutoreleasedReturnValue( [v35 localizedStringForKey:@"APPLE_MANAGED_ACCOUNT_NEEDS_SETTINGS_REDIRECT_TITLE" value:&stru_1001D1450 table:@"Localizable"]);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v10 username]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v36, v37));

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    BOOL v16 = v28;
    uint64_t v29 = @"APPLE_MANAGED_ACCOUNT_NEEDS_SETTINGS_REDIRECT_MESSAGE";
    goto LABEL_63;
  }

  if ([v61 code] == (id)-7100)
  {
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( [v38 localizedStringForKey:@"APPLE_MANAGED_ACCOUNT_UNABLE_TO_SIGN_IN_TITLE" value:&stru_1001D1450 table:@"Localizable"]);

    v39 = (void *)objc_claimAutoreleasedReturnValue([v61 userInfo]);
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:AKAuthenticationManagedOrganizationNameKey]);

    id v40 = [v16 length];
    id v41 = [0 length];
    if (v41 && v40)
    {
      unsigned __int8 v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( [v42 localizedStringForKey:@"APPLE_MANAGED_ACCOUNT_APPLICATION_BLOCKED_MESSAGE_APPNAME_ORGNAME_FORMAT" value:&stru_1001D1450 table:@"Localizable"]);
      uint64_t v59 = v16;
    }

    else
    {
      if (v40)
      {
        unsigned __int8 v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( [v42 localizedStringForKey:@"APPLE_MANAGED_ACCOUNT_APPLICATION_BLOCKED_MESSAGE_ORGNAME_FORMAT" value:&stru_1001D1450 table:@"Localizable"]);
        id v44 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v43, v16, v59);
        goto LABEL_54;
      }

      if (!v41)
      {
        unsigned __int8 v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
        BOOL v22 = (void *)objc_claimAutoreleasedReturnValue( [v42 localizedStringForKey:@"APPLE_MANAGED_ACCOUNT_APPLICATION_BLOCKED_MESSAGE" value:&stru_1001D1450 table:@"Localizable"]);
        goto LABEL_55;
      }

      unsigned __int8 v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( [v42 localizedStringForKey:@"APPLE_MANAGED_ACCOUNT_APPLICATION_BLOCKED_MESSAGE_APPNAME_FORMAT" value:&stru_1001D1450 table:@"Localizable"]);
    }

    id v44 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v43, 0LL, v59);
LABEL_54:
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(v44);

LABEL_55:
    goto LABEL_65;
  }

  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v61 userInfo]);
  NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
  id v49 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:NSLocalizedDescriptionKey]);

  if (!v49)
  {
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v61 userInfo]);
    NSErrorUserInfoKey v48 = NSLocalizedFailureReasonErrorKey;
    uint64_t v53 = objc_claimAutoreleasedReturnValue([v52 objectForKeyedSubscript:NSLocalizedFailureReasonErrorKey]);
    if (v53)
    {
      uint64_t v54 = (void *)v53;
      unsigned int v55 = (void *)objc_claimAutoreleasedReturnValue([v61 userInfo]);
      v56 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKeyedSubscript:NSLocalizedFailureErrorKey]);

      if (v56)
      {
        id v57 = (void *)objc_claimAutoreleasedReturnValue([v61 userInfo]);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKeyedSubscript:NSLocalizedFailureErrorKey]);

        goto LABEL_51;
      }
    }

    else
    {
    }

- (void)_titleAndMessageForBadNetworkRelatedErrorWithCompletion:(id)a3
{
  unsigned __int8 v7 = (void (**)(id, void *, void *))a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"BAD_NETWORK_ALERT_TITLE" value:&stru_1001D1450 table:@"Localizable"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"BAD_NETWORK_ALERT_MESSAGE" value:&stru_1001D1450 table:@"Localizable"]);

  if (v7) {
    v7[2](v7, v4, v6);
  }
}

- (void)_showAlertForLoginError:(id)a3 context:(id)a4 completion:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100047CE0;
  v11[3] = &unk_1001C8558;
  id v12 = a3;
  unsigned int v13 = self;
  id v14 = a4;
  id v15 = a5;
  id v8 = v15;
  id v9 = v14;
  id v10 = v12;
  -[AKAppleIDAuthenticationService _titleAndMessageForError:context:completion:]( self,  "_titleAndMessageForError:context:completion:",  v10,  v9,  v11);
}

- (void)_checkFreshnessAndVerifyWithPassword:(id)a3 serverResponse:(id)a4 additionalData:(id)a5 secondaryActionError:(id)a6 context:(id)a7 newServerResponse:(id)a8 username:(id)a9 completion:(id)a10
{
  id v15 = a3;
  id v16 = a5;
  id v29 = v15;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([a4 secondaryActionURLKey]);

  id v23 = v29;
  if (!v21)
  {
    uint64_t v24 = AKAuthenticationPasswordKey;
    unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:AKAuthenticationPasswordKey]);

    id v23 = v29;
    if (v25)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v24]);
    }
  }

  BOOL v26 = v22 != 0LL;
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:AKAuthenticationNewAppleIDSetupInfoKey]);
  -[AKAppleIDAuthenticationService _handleVerificationCompletionForUsername:password:serverResponse:didShowServerUI:continuationData:error:context:completion:]( self,  "_handleVerificationCompletionForUsername:password:serverResponse:didShowServerUI:continuationData:error:context:completion:",  v18,  v23,  v19,  v26,  v27,  v21,  v20,  v17);
}

- (void)_verifyUsername:(id)a3 password:(id)a4 context:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [v12 setUsername:v10];
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[AKAppleIDAuthenticationService _srpAuthContextHelperWithContext:]( self,  "_srpAuthContextHelperWithContext:",  v12));
  [v14 setPassword:v11];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100048054;
  v19[3] = &unk_1001C8580;
  id v20 = v12;
  id v21 = self;
  id v22 = v11;
  id v23 = v10;
  id v24 = v13;
  id v15 = v13;
  id v16 = v10;
  id v17 = v11;
  id v18 = v12;
  -[AKAppleIDAuthenticationService _performSRPAuthenticationWithContext:completion:]( self,  "_performSRPAuthenticationWithContext:completion:",  v14,  v19);
}

- (void)_performPasswordlessSRPAuthWithContext:(id)a3 completion:(id)a4
{
}

- (void)_performPasswordlessSRPAuthWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
}

- (void)_performPasswordlessSRPAuthWithAccount:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)_performPasswordlessSRPAuthWithAccount:(id)a3 context:(id)a4 client:(id)a5 completion:(id)a6
{
  id v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v11 username]);
  id v15 = (void *)v14;
  if (v10)
  {
    uint64_t v16 = _AKLogSystem(v14);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v45 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Attempting passwordless auth with IDMS account %@...",  buf,  0xCu);
    }

    uint64_t v18 = objc_claimAutoreleasedReturnValue(-[__CFString username](v10, "username"));
    [v11 setUsername:v18];
    id v15 = (void *)v18;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue( -[AKAppleIDAuthenticationService _srpAuthContextHelperWithContext:]( self,  "_srpAuthContextHelperWithContext:",  v11));
  uint64_t v20 = _AKLogSystem([v19 setAuthKitAccount:v10]);
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v11 passwordlessToken]);
    id v22 = v10;
    id v23 = self;
    if (v36) {
      id v24 = @"YES";
    }
    else {
      id v24 = @"NO";
    }
    unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue([v11 idmsDataToken]);
    BOOL v26 = @"YES";
    if (!v25) {
      BOOL v26 = @"NO";
    }
    *(_DWORD *)__int128 buf = 138412546;
    uint64_t v45 = v24;
    self = v23;
    id v10 = v22;
    __int16 v46 = 2112;
    uint64_t v47 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "PasswordlessSRP with passwordlessToken: %@ idmsDataToken: %@",  buf,  0x16u);
  }

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v11 passwordlessToken]);
  if (v27)
  {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v11 passwordlessToken]);
    [v19 setPasswordlessToken:v28];

    id v29 = (void *)objc_claimAutoreleasedReturnValue([v11 idmsDataToken]);
    if (v29)
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v11 idmsDataToken]);
      [v19 setIdmsDataToken:v30];
    }
  }

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_1000488C4;
  v37[3] = &unk_1001C85F8;
  id v38 = v19;
  id v39 = v15;
  id v40 = v11;
  id v41 = self;
  id v42 = v12;
  id v43 = v13;
  id v31 = v12;
  id v32 = v11;
  id v33 = v13;
  id v34 = v15;
  id v35 = v19;
  -[AKAppleIDAuthenticationService _performSRPAuthenticationWithContext:completion:]( self,  "_performSRPAuthenticationWithContext:completion:",  v35,  v37);
}

- (id)_srpAuthContextHelperWithContext:(id)a3
{
  id v4 = a3;
  id v5 = -[AKSRPAuthenticationContextHelper initWithContext:]( objc_alloc(&OBJC_CLASS___AKSRPAuthenticationContextHelper),  "initWithContext:",  v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 username]);

  -[AKSRPContextHelper setUsername:](v5, "setUsername:", v6);
  -[AKSRPContextHelper setClient:](v5, "setClient:", self->_client);
  return v5;
}

- (void)_performSRPAuthenticationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKConfiguration sharedConfiguration](&OBJC_CLASS___AKConfiguration, "sharedConfiguration"));
  id v9 = [v8 shouldFakeAuthSuccess];

  if (v9 == (id)1)
  {
    uint64_t v11 = _AKLogSystem(v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Faking IDMS auth success!", buf, 2u);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 authContext]);
    id v14 = [v13 authenticationMode];

    if (v14)
    {
      -[AKAppleIDAuthenticationService _performSafeSRPAuthenticationWithContext:completion:]( self,  "_performSafeSRPAuthenticationWithContext:completion:",  v6,  v7);
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 authContext]);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10004923C;
      v16[3] = &unk_1001C7EC8;
      void v16[4] = self;
      id v17 = v6;
      id v18 = v7;
      -[AKAppleIDAuthenticationService _refreshAuthModeIfNecessaryForContext:completion:]( self,  "_refreshAuthModeIfNecessaryForContext:completion:",  v15,  v16);
    }
  }
}

- (void)_performSafeSRPAuthenticationWithContext:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 authKitAccount:0]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 authContext]);
  if ([v10 authenticationMode] == (id)1) {
    goto LABEL_5;
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 authContext]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 companionKeyEnvelope]);
  if (v12)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 authContext]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 companionDevice]);
    if (v13)
    {

LABEL_5:
      goto LABEL_6;
    }
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v21 = [v20 authenticationModeForAccount:v9];

  if (v12)
  {
  }

  if (v21 != (id)1) {
    goto LABEL_14;
  }
LABEL_6:
  id v22 = 0LL;
  unsigned __int8 v14 = [v7 isContextSecretValidForSRP:&v22];
  id v15 = (AKSRPService *)v22;
  uint64_t v16 = v15;
  if ((v14 & 1) != 0)
  {

LABEL_14:
    uint64_t v16 = -[AKSRPService initWithClient:](objc_alloc(&OBJC_CLASS___AKSRPService), "initWithClient:", self->_client);
    -[AKSRPService performSRPContractWithContext:completion:](v16, "performSRPContractWithContext:completion:", v7, v8);
    goto LABEL_15;
  }

  uint64_t v17 = _AKLogSystem(v15);
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_10013418C(v7, v18);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:underlyingError:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:underlyingError:",  -7075LL,  v16));
  v8[2](v8, 0LL, v19);

LABEL_15:
}

- (void)_handleVerificationCompletionForUsername:(id)a3 password:(id)a4 serverResponse:(id)a5 didShowServerUI:(BOOL)a6 continuationData:(id)a7 error:(id)a8 context:(id)a9 completion:(id)a10
{
  BOOL v12 = a6;
  id v16 = a5;
  id v17 = a8;
  id v18 = a9;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100049554;
  v23[3] = &unk_1001C8620;
  id v27 = v16;
  id v28 = a10;
  id v24 = v17;
  unsigned __int8 v25 = self;
  id v26 = v18;
  id v19 = v16;
  id v20 = v18;
  id v21 = v17;
  id v22 = v28;
  -[AKAppleIDAuthenticationService _shouldContinueAuthenticatingForUsername:password:serverResponse:didShowServerUI:continuationData:error:context:completion:]( self,  "_shouldContinueAuthenticatingForUsername:password:serverResponse:didShowServerUI:continuationData:error:context:completion:",  a3,  a4,  v19,  v12,  a7,  v21,  v20,  v23);
}

- (void)_shouldContinueAuthenticatingForUsername:(id)a3 password:(id)a4 serverResponse:(id)a5 didShowServerUI:(BOOL)a6 continuationData:(id)a7 error:(id)a8 context:(id)a9 completion:(id)a10
{
  BOOL v174 = a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v19 domain]);
  if ([v22 isEqual:AKAppleIDAuthenticationErrorDomain])
  {
    id v23 = [v19 code];

    if (v23 == (id)-7014LL)
    {
      uint64_t v25 = _AKLogSystem(v24);
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1001342B4();
      }

LABEL_14:
      (*((void (**)(id, void, void, id))v21 + 2))(v21, 0LL, 0LL, v19);
      goto LABEL_143;
    }
  }

  else
  {
  }

  id v27 = objc_msgSend(v19, "ak_isUserCancelError");
  int v28 = (int)v27;
  uint64_t v29 = _AKLogSystem(v27);
  id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  id v31 = v30;
  if (v28)
  {
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "User canceled. Aborting auth.", buf, 2u);
    }

    if (v174)
    {
      id v33 = v21;
      id v34 = v20;
      id v35 = v18;
      id v36 = v15;
      uint64_t v37 = _AKLogSystem(v32);
      id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
        sub_1001342E0();
      }

      id v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7052LL));
      NSErrorUserInfoKey v185 = NSUnderlyingErrorKey;
      v186 = v39;
      id v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v186,  &v185,  1LL));
      uint64_t v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "ak_errorByAppendingUserInfo:", v40));

      id v19 = (id)v41;
      id v15 = v36;
      id v18 = v35;
      id v20 = v34;
      id v21 = v33;
    }

    goto LABEL_14;
  }

  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
    sub_100134390();
  }

  id v42 = (void *)objc_claimAutoreleasedReturnValue([v17 appleID]);
  id v173 = v16;
  if (v42)
  {
    uint64_t v44 = _AKLogSystem(v43);
    uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
      sub_100134364();
    }
  }

  else
  {
    uint64_t v46 = _AKLogSystem(v43);
    uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    uint64_t v45 = v47;
    if (v15)
    {
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
        sub_100134338();
      }
    }

    else if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      sub_10013430C();
    }
  }

  NSErrorUserInfoKey v48 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v49 = (void *)objc_claimAutoreleasedReturnValue([v20 telemetryFlowID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v48,  "setObject:forKeyedSubscript:",  v49,  AKAuthenticationTelemetryFlowID);

  uint64_t v50 = objc_claimAutoreleasedReturnValue([v17 appleID]);
  uint64_t v51 = (void *)v50;
  if (v50) {
    uint64_t v52 = (void *)v50;
  }
  else {
    uint64_t v52 = v15;
  }
  id v53 = v52;

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v48,  "setObject:forKeyedSubscript:",  v53,  AKAuthenticationUsernameKey);
  if (v53) {
    [v20 setUsername:v53];
  }
  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v17 altDSID]);

  if (v54)
  {
    unsigned int v55 = (void *)objc_claimAutoreleasedReturnValue([v17 altDSID]);
    [v20 setAltDSID:v55];
  }

  v167 = v53;
  v56 = (void *)objc_claimAutoreleasedReturnValue([v17 passwordEquivalentToken]);

  if (v56)
  {
    uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v17 passwordEquivalentToken]);
    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v58 stringValue]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v48,  "setObject:forKeyedSubscript:",  v59,  AKAuthenticationPasswordKey);

LABEL_34:
    goto LABEL_36;
  }

  if (!v19)
  {
    uint64_t v162 = _AKLogSystem(v57);
    uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(v162);
    if (os_log_type_enabled((os_log_t)v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v58,  OS_LOG_TYPE_DEFAULT,  "Successful SRP did not return a PET to client.",  buf,  2u);
    }

    goto LABEL_34;
  }

- (void)_handleSuccessfulVerificationForContext:(id)a3 withResults:(id)a4 serverResponse:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v15 = objc_msgSend((id)objc_opt_class(self, v14), "_verificationQueue");
  id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v15);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004AD34;
  block[3] = &unk_1001C8030;
  void block[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v25 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  dispatch_async(v16, block);
}

- (id)_authKitAccountFromContext:(id)a3
{
  id v4 = a3;
  id v5 = (ACAccount *)objc_claimAutoreleasedReturnValue([v4 authKitAccount:0]);
  id v6 = v5;
  if (v5
    || (id v5 = (ACAccount *)+[AKAccountManager isAccountsFrameworkAvailable]( &OBJC_CLASS___AKAccountManager,  "isAccountsFrameworkAvailable"),  !(_DWORD)v5))
  {
    uint64_t v15 = _AKLogSystem(v5);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138477827;
      id v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Fetched existing AK account: %{private}@",  (uint8_t *)&v17,  0xCu);
    }
  }

  else
  {
    uint64_t v7 = _AKLogSystem(v5);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (ACAccount *)objc_claimAutoreleasedReturnValue([v4 username]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSID]);
      int v17 = 138478083;
      id v18 = v9;
      __int16 v19 = 2113;
      id v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Creating a new authkit account <%{private}@><%{private}@>",  (uint8_t *)&v17,  0x16u);
    }

    id v11 = objc_alloc(&OBJC_CLASS___ACAccount);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager authKitAccountTypeWithError:]( self->_accountManager,  "authKitAccountTypeWithError:",  0LL));
    id v6 = -[ACAccount initWithAccountType:](v11, "initWithAccountType:", v12);

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 username]);
    -[ACAccount setUsername:](v6, "setUsername:", v13);

    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AKAccountManager personaIDIfCurrentPersonaIsDataSeparated]( &OBJC_CLASS___AKAccountManager,  "personaIDIfCurrentPersonaIsDataSeparated"));
    if (v14) {
      -[ACAccount setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v14,  ACAccountPropertyPersonaIdentifier);
    }
  }

  return v6;
}

- (void)_provideServiceTokensIfRequiredForContext:(id)a3 authenticationResults:(id)a4 serverResponse:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (id)objc_claimAutoreleasedReturnValue([v10 serviceIdentifiers]);
  if (([v10 shouldUpdatePersistentServiceTokens] & 1) != 0
    || (id v15 = [v10 needsNewAppleID], (_DWORD)v15))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 serviceTokens]);

    if (v16)
    {
      int v17 = (void *)objc_claimAutoreleasedReturnValue([v12 serviceTokens]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 allKeys]);

      if (v14)
      {
        uint64_t v19 = objc_claimAutoreleasedReturnValue([v14 arrayByAddingObjectsFromArray:v18]);

        id v14 = (id)v19;
      }

      else
      {
        id v14 = v18;
      }
    }
  }

  if (v14)
  {
    id v36 = self;
    id v38 = v13;
    id v39 = v11;
    id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    id v37 = v14;
    id v21 = v14;
    id v22 = [v21 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v49;
      do
      {
        for (i = 0LL; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v49 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v48 + 1) + 8LL * (void)i);
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v12 serviceTokens]);
          int v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v26]);

          if (!v28) {
            -[NSMutableSet addObject:](v20, "addObject:", v26);
          }
        }

        id v23 = [v21 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }

      while (v23);
    }

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v10 altDSID]);
    if (!v29) {
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v12 altDSID]);
    }
    id v11 = v39;
    if (-[NSMutableSet count](v20, "count"))
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v20, "allObjects"));
      id v35 = (void *)objc_claimAutoreleasedReturnValue([v10 username]);
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v12 masterToken]);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_10004B570;
      v40[3] = &unk_1001C86B8;
      uint64_t v41 = v20;
      id v42 = v36;
      id v43 = v12;
      id v44 = v29;
      id v45 = v39;
      id v46 = v10;
      id v13 = v38;
      id v47 = v38;
      -[AKAppleIDAuthenticationService _fetchTokensForServiceIDs:withUsername:altDSID:masterToken:context:completion:]( v36,  "_fetchTokensForServiceIDs:withUsername:altDSID:masterToken:context:completion:",  v30,  v35,  v44,  v34,  v46,  v40);

      id v31 = v41;
    }

    else
    {
      id v31 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([v12 serviceTokens]);
      id v13 = v38;
      -[AKAppleIDAuthenticationService _completeAuthenticationWithServiceTokens:tokenFetchError:altDSID:authenticationResults:context:completion:]( v36,  "_completeAuthenticationWithServiceTokens:tokenFetchError:altDSID:authenticationResults:context:completion:",  v31,  0LL,  v29,  v39,  v10,  v38);
    }

    id v14 = v37;
  }

  else
  {
    uint64_t v32 = _AKLogSystem(v15);
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "No service IDs were provided, so AKAuthenticationIDMSTokenKey will be left empty.",  buf,  2u);
    }

    (*((void (**)(id, id, void))v13 + 2))(v13, v11, 0LL);
  }
}

- (void)_completeAuthenticationWithServiceTokens:(id)a3 tokenFetchError:(id)a4 altDSID:(id)a5 authenticationResults:(id)a6 context:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  int v17 = (NSMutableDictionary *)a6;
  id v18 = a7;
  uint64_t v19 = (void (**)(id, NSMutableDictionary *, void))a8;
  uint64_t v20 = objc_claimAutoreleasedReturnValue([v18 serviceIdentifiers]);
  id v21 = (void *)v20;
  if (v14)
  {
    id v22 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v17, "mutableCopy");
    if (!v22) {
      id v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "aaf_map:", &stru_1001C86F8));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  v23,  AKAuthenticationIDMSTokenKey);
    id v24 = [v18 shouldUpdatePersistentServiceTokens];
    if ((_DWORD)v24
      && (id v24 = (id)-[AKAppleIDAuthenticationService _shouldSkipAccountUpdatesForAuthWithContext:]( self,  "_shouldSkipAccountUpdatesForAuthWithContext:",  v18),  !(_DWORD)v24))
    {
      id v32 = v16;
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v17,  "objectForKeyedSubscript:",  AKAuthenticationDSIDKey));
      id v31 = v15;
      id v30 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v17,  "objectForKeyedSubscript:",  AKAuthenticationUsernameKey));
      -[AKAppleIDAuthenticationService _persistGrandSlamServiceTokens:forAltDSID:DSID:appleID:forContext:error:]( self,  "_persistGrandSlamServiceTokens:forAltDSID:DSID:appleID:forContext:error:",  v14,  v32,  v29,  v30,  v18,  0LL);

      id v15 = v31;
      id v16 = v32;
    }

    else
    {
      uint64_t v25 = _AKLogSystem(v24);
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Context not appropriate for updating persistent tokens. All done then!",  buf,  2u);
      }
    }

    v19[2](v19, v22, 0LL);
  }

  else
  {
    uint64_t v27 = _AKLogSystem(v20);
    int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_100134508();
    }

    ((void (**)(id, NSMutableDictionary *, id))v19)[2](v19, v17, v15);
  }
}

- (void)_persistGrandSlamServiceTokens:(id)a3 forAltDSID:(id)a4 DSID:(id)a5 appleID:(id)a6 forContext:(id)a7 error:(id *)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  uint64_t v20 = -[AKGrandslamTokenUpdateRequest initWithTokens:accountManager:context:altDSID:]( objc_alloc(&OBJC_CLASS___AKGrandslamTokenUpdateRequest),  "initWithTokens:accountManager:context:altDSID:",  v18,  self->_accountManager,  v14,  v17);

  -[AKGrandslamTokenUpdateRequest setDsid:](v20, "setDsid:", v16);
  -[AKGrandslamTokenUpdateRequest setAppleIDUsername:](v20, "setAppleIDUsername:", v15);

  uint64_t v19 = objc_opt_new(&OBJC_CLASS___AKGrandslamTokenUpdater);
  -[AKGrandslamTokenUpdater updateGrandSlamServiceTokensWithRequest:error:]( v19,  "updateGrandSlamServiceTokensWithRequest:error:",  v20,  a8);
}

- (void)_performSecondaryActionWithServerResponse:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)_performSecondaryActionWithServerResponse:(id)a3 context:(id)a4 client:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v11 authenticationType] == (id)1)
  {
    uint64_t v14 = _AKLogSystem(1LL);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100134568();
    }

    uint64_t v16 = -7014LL;
    goto LABEL_5;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 federatedAuthURL]);

  if (v18)
  {
    uint64_t v19 = -[AKEducationEnterpriseController initWithContext:client:]( objc_alloc(&OBJC_CLASS___AKEducationEnterpriseController),  "initWithContext:client:",  v11,  v12);
    eduController = self->_eduController;
    self->_eduController = v19;

    -[AKEducationEnterpriseController beginFederatedAuthWithInitialResponse:completionHandler:]( self->_eduController,  "beginFederatedAuthWithInitialResponse:completionHandler:",  v10,  v13);
    goto LABEL_9;
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v10 secondaryActionURLKey]);

  if (!v21)
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v10 secondaryActionURLKey]);
    if (v27)
    {
    }

    else
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v11 _masterKey]);

      if (v33)
      {
        uint64_t v35 = _AKLogSystem(v34);
        id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Context has masterKeyEligible set and server response indicates secondary action is required",  buf,  2u);
        }

        id v37 = (void *)objc_claimAutoreleasedReturnValue( -[AKAppleIDAuthenticationService _srpAuthContextHelperWithContext:]( self,  "_srpAuthContextHelperWithContext:",  v11));
        id v38 = (void *)objc_claimAutoreleasedReturnValue([v11 _masterKey]);
        [v37 setPassword:v38];

        [v37 _setMasterKeyAsSecondFactor:1];
        __int128 v50 = v37;
        id v39 = (void *)objc_claimAutoreleasedReturnValue([v37 authContext]);
        id v40 = (void *)objc_claimAutoreleasedReturnValue([v10 altDSID]);
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v10 masterToken]);
        id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 stringValue]);
        id v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@",  v40,  v42));

        id v44 = (void *)objc_claimAutoreleasedReturnValue([v43 dataUsingEncoding:4]);
        id v45 = (void *)objc_claimAutoreleasedReturnValue([v44 base64EncodedStringWithOptions:0]);
        [v39 _setIdentityToken:v45];

        uint64_t v47 = _AKLogSystem(v46);
        __int128 v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Attempting second SRP for masterKeyAsSecondFactor",  buf,  2u);
        }

        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472LL;
        v51[2] = sub_10004BFD0;
        v51[3] = &unk_1001C8748;
        id v52 = v13;
        __int128 v49 = self;
        id v17 = v50;
        -[AKAppleIDAuthenticationService _performSRPAuthenticationWithContext:completion:]( v49,  "_performSRPAuthenticationWithContext:completion:",  v50,  v51);

        goto LABEL_6;
      }
    }

    if ([v10 isFidoAuthRequired])
    {
      uint64_t v16 = -7027LL;
    }

    else
    {
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v10 secondaryActionMessage]);
      [v11 _setMessage:v29];

      uint64_t v31 = _AKLogSystem(v30);
      id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Secondary action server URL is missing",  buf,  2u);
      }

      uint64_t v16 = -7005LL;
    }

- (void)_handleSecondFactorUICompletionWithCode:(id)a3 error:(id)a4 idmsData:(id)a5 initialAuthResponse:(id)a6 context:(id)a7 completion:(id)a8
{
}

- (void)_handleSecondFactorUICompletionWithCode:(id)a3 error:(id)a4 idmsData:(id)a5 piggybacking:(BOOL)a6 initialAuthResponse:(id)a7 context:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = (void (**)(id, void, id))a9;
  uint64_t v21 = _AKLogSystem(v20);
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  int v23 = v22;
  if (v16)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1001345F4();
    }

    v20[2](v20, 0LL, v16);
  }

  else
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_100134594();
    }

    id v26 = [v15 unsignedIntegerValue];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v18 altDSID]);
    id v27 = v15;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v18 masterToken]);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10004C1F8;
    v28[3] = &unk_1001C8798;
    BOOL v33 = a6;
    id v32 = v20;
    void v28[4] = self;
    id v29 = v19;
    id v30 = v17;
    id v31 = v18;
    -[AKAppleIDAuthenticationService _validateLoginCode:forAltDSID:masterToken:idmsData:authContext:completion:]( self,  "_validateLoginCode:forAltDSID:masterToken:idmsData:authContext:completion:",  v26,  v24,  v25,  v30,  v29,  v28);

    id v15 = v27;
  }
}

- (void)_processValidationCodeSuccessResponse:(id)a3 authResponse:(id)a4 results:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, id, void))a6;
  id v12 = a3;
  uint64_t v13 = _AKLogSystem(v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v17 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Login code successfully validated! Updating auth tokens...",  v17,  2u);
  }

  unsigned __int8 v15 = [v9 updateWithSecondaryAuthenticationResponse:v12];
  if ((v15 & 1) != 0)
  {
    [v9 updateWithSecondaryAuthenticationBody:v10];
    v11[2](v11, v9, 0LL);
  }

  else
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7021LL));
    ((void (**)(id, id, void *))v11)[2](v11, v9, v16);
  }
}

- (void)_showAlertForLoginCodeValidationError:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10004C5A4;
  v12[3] = &unk_1001C8558;
  v12[4] = self;
  id v13 = a4;
  id v14 = v8;
  id v15 = a5;
  id v9 = v15;
  id v10 = v8;
  id v11 = v13;
  -[AKAppleIDAuthenticationService _titleAndMessageForError:context:completion:]( self,  "_titleAndMessageForError:context:completion:",  v10,  v11,  v12);
}

- (void)_attemptPasswordlessAuthAfterBiometricOrPasscodeValidationWithContext:(id)a3 promptType:(unint64_t)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10004C6F4;
  v10[3] = &unk_1001C87E8;
  id v11 = a3;
  id v12 = self;
  id v13 = a5;
  unint64_t v14 = a4;
  id v8 = v11;
  id v9 = v13;
  -[AKAppleIDAuthenticationService _accountForContinuationWithContext:completion:]( self,  "_accountForContinuationWithContext:completion:",  v8,  v10);
}

- (void)_performGrandslamEndpointActionWithContext:(id)a3 serverResponse:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a3 altDSID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", v10));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 secondaryActionURLKey]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 _urlAtKey:v12]);

  if (v13)
  {
    id v15 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v13);
    -[NSMutableURLRequest setHTTPMethod:](v15, "setHTTPMethod:", @"GET");
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient name](self->_client, "name"));
    -[NSMutableURLRequest ak_addClientApp:](v15, "ak_addClientApp:", v16);

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient bundleID](self->_client, "bundleID"));
    -[NSMutableURLRequest ak_addClientBundleIDHeader:](v15, "ak_addClientBundleIDHeader:", v17);

    -[NSMutableURLRequest ak_addClientInfoHeader](v15, "ak_addClientInfoHeader");
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 masterToken]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 stringValue]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v8 altDSID]);
    -[NSMutableURLRequest ak_addAuthorizationHeaderWithIdentityToken:forAltDSID:]( v15,  "ak_addAuthorizationHeaderWithIdentityToken:forAltDSID:",  v19,  v20);

    -[NSMutableURLRequest ak_addInternalBuildHeader](v15, "ak_addInternalBuildHeader");
    -[NSMutableURLRequest ak_addSeedBuildHeader](v15, "ak_addSeedBuildHeader");
    -[NSMutableURLRequest ak_addFeatureMaskHeader](v15, "ak_addFeatureMaskHeader");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLSession sharedURLSession](&OBJC_CLASS___AKURLSession, "sharedURLSession"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10004CC80;
    v25[3] = &unk_1001C7500;
    void v25[4] = self;
    id v26 = v8;
    id v27 = v9;
    id v22 = [v21 beginDataTaskWithRequest:v15 completionHandler:v25];
  }

  else
  {
    uint64_t v23 = _AKLogSystem(v14);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100134728(v8, v24);
    }

    id v15 = (NSMutableURLRequest *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7005LL));
    (*((void (**)(id, void, NSMutableURLRequest *))v9 + 2))(v9, 0LL, v15);
  }
}

- (void)_handleGrandslamResponse:(id)a3 data:(id)a4 error:(id)a5 serverResponse:(id)a6 completion:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void (**)(id, void, void *))a7;
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse, v14);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v10, v15);
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v17 = _AKLogSystem(isKindOfClass);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1001347A8();
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7010LL));
    v13[2](v13, 0LL, v19);
  }

  id v20 = v10;
  if ([v12 updateWithSecondaryAuthenticationResponse:v20 shouldUpdateDSID:1])
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[AAFSerialization dictionaryFromObject:ofType:]( &OBJC_CLASS___AAFSerialization,  "dictionaryFromObject:ofType:",  v11,  @"application/json"));
    [v12 updateWithSecondaryAuthenticationBody:v21];
    uint64_t v22 = 0LL;
  }

  else
  {
    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7021LL));
    uint64_t v21 = (void *)v22;
  }

  ((void (**)(id, id, void *))v13)[2](v13, v12, (void *)v22);
}

- (void)clearSessionCacheWithCompletion:(id)a3
{
  id v3 = (void (**)(id, uint64_t, void))a3;
  uint64_t v4 = _AKLogSystem(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting to clear session cache.", v7, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBagService sharedBagService](&OBJC_CLASS___AKURLBagService, "sharedBagService"));
  [v6 clearCache];

  v3[2](v3, 1LL, 0LL);
}

- (void)fetchGlobalConfigurationUsingPolicy:(unint64_t)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[AKGlobalConfigService sharedInstance](&OBJC_CLASS___AKGlobalConfigService, "sharedInstance"));
  [v6 fetchGlobalConfigUsingCachePolicy:a3 context:AKRequestContextUserInitiated completion:v5];
}

- (void)_beginServerDrivenSecondaryActionWithURLKey:(id)a3 context:(id)a4 initialAuthResponse:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = _AKLogSystem(v13);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100134868();
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 altDSID]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", v16));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 _urlAtKey:v10]);

  if (v18)
  {
    if (+[AKURLBag looksLikeiForgotURLKey:](&OBJC_CLASS___AKURLBag, "looksLikeiForgotURLKey:", v10))
    {
      uint64_t v20 = objc_claimAutoreleasedReturnValue( -[AKAppleIDAuthenticationService _addAccountNameParameterToURL:withContext:]( self,  "_addAccountNameParameterToURL:withContext:",  v18,  v11));

      id v18 = (void *)v20;
    }

    uint64_t v21 = -[NSURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSURLRequest), "initWithURL:", v18);
    uint64_t v22 = _AKSignpostLogSystem(v21);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    os_signpost_id_t v24 = _AKSignpostCreate();
    uint64_t v26 = v25;

    uint64_t v28 = _AKSignpostLogSystem(v27);
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    id v30 = v29;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_DWORD *)__int128 buf = 138543362;
      os_signpost_id_t v41 = (os_signpost_id_t)v10;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v30,  OS_SIGNPOST_INTERVAL_BEGIN,  v24,  "ServerDrivenSecondaryAction",  " ActionKey=%{public,signpost.telemetry:string1,name=ActionKey}@  enableTelemetry=YES ",  buf,  0xCu);
    }

    uint64_t v32 = _AKSignpostLogSystem(v31);
    BOOL v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218242;
      os_signpost_id_t v41 = v24;
      __int16 v42 = 2114;
      id v43 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: ServerDrivenSecondaryAction  ActionKey=%{public,signpost.telemetry:string1,name=ActionKey}@  enableTelemetry=YES ",  buf,  0x16u);
    }

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10004D208;
    v36[3] = &unk_1001C8810;
    os_signpost_id_t v38 = v24;
    uint64_t v39 = v26;
    id v37 = v13;
    -[AKAppleIDAuthenticationService _showServerUIWithURLRequest:context:initialAuthResponse:completion:]( self,  "_showServerUIWithURLRequest:context:initialAuthResponse:completion:",  v21,  v11,  v12,  v36);
  }

  else
  {
    uint64_t v34 = _AKLogSystem(v19);
    uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_100134808();
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7005LL));
    (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0LL, 0LL, v18);
  }
}

- (void)_showServerUIWithURLRequest:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)_showServerUIWithURLRequest:(id)a3 context:(id)a4 initialAuthResponse:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = (id)objc_claimAutoreleasedReturnValue( +[AKDServerUIContext serverUIContextFromResponse:authContext:urlRequest:]( &OBJC_CLASS___AKDServerUIContext,  "serverUIContextFromResponse:authContext:urlRequest:",  a5,  a4,  a3));
  -[AKAppleIDAuthenticationService _showServerUIWithContext:completion:]( self,  "_showServerUIWithContext:completion:",  v11,  v10);
}

- (void)_showServerUIWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[AKDServerUIController initWithLiaison:client:delegate:]( objc_alloc(&OBJC_CLASS___AKDServerUIController),  "initWithLiaison:client:delegate:",  self->_authUILiaison,  self->_client,  self);
  -[AKDServerUIController showServerUIWithContext:completion:](v8, "showServerUIWithContext:completion:", v7, v6);
}

- (BOOL)shouldProcessAdditionalServerUIData:(id)a3
{
  return +[AKAccountRecoveryController shouldProcessServerUIRequest:]( &OBJC_CLASS___AKAccountRecoveryController,  "shouldProcessServerUIRequest:",  a3);
}

- (void)serverUIContext:(id)a3 processAdditionalData:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _AKLogSystem(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Asking client to start showing native UI",  (uint8_t *)&buf,  2u);
  }

  uint64_t v14 = _AKLogSystem(v13);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "AKAppleIDAuthenticationService serverUIContext additionalData: %@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_10003E828;
  os_signpost_id_t v24 = sub_10003E838;
  uint64_t v25 = -[AKAccountRecoveryController initWithUILiaison:client:]( objc_alloc(&OBJC_CLASS___AKAccountRecoveryController),  "initWithUILiaison:client:",  self->_authUILiaison,  self->_client);
  id v16 = *(void **)(*((void *)&buf + 1) + 40LL);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10004D6E4;
  v18[3] = &unk_1001C8838;
  p___int128 buf = &buf;
  id v17 = v10;
  id v19 = v17;
  [v16 retrieveRecoveryDataForServerContext:v8 recoveryInfo:v9 completion:v18];

  _Block_object_dispose(&buf, 8);
}

- (void)_performSilentServiceTokenAuthWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v26 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 authKitAccountForSilentServiceToken:&v26]);
  id v9 = v26;
  uint64_t v10 = _AKLogSystem(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v12)
    {
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v28 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Attempting silent service-token auth with IDMS account %@...",  buf,  0xCu);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager masterTokenForAccount:](self->_accountManager, "masterTokenForAccount:", v8));
    if (v13)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager altDSIDForAccount:](self->_accountManager, "altDSIDForAccount:", v8));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceIdentifiers]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 username]);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10004DAA8;
      v21[3] = &unk_1001C8860;
      id v22 = v6;
      id v24 = v14;
      id v25 = v7;
      uint64_t v23 = self;
      id v17 = v14;
      -[AKAppleIDAuthenticationService _fetchTokensForServiceIDs:withUsername:altDSID:masterToken:context:completion:]( self,  "_fetchTokensForServiceIDs:withUsername:altDSID:masterToken:context:completion:",  v15,  v16,  v17,  v13,  v22,  v21);
    }

    else
    {
      uint64_t v19 = _AKLogSystem(0LL);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1001348C8();
      }

      id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7024LL));
      (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v17);
    }
  }

  else
  {
    if (v12)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 username]);
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v28 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "No usable IDMS account for Apple ID: %@",  buf,  0xCu);
    }

    (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v9);
  }
}

- (void)_fetchTokensForServiceIDs:(id)a3 withUsername:(id)a4 altDSID:(id)a5 masterToken:(id)a6 context:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v65 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = (void (**)(void, void, void))v17;
  if (v14)
  {
    uint64_t v19 = objc_claimAutoreleasedReturnValue([a6 externalizedVersion]);
    uint64_t v20 = (void *)v19;
    if (!v19)
    {
      uint64_t v48 = _AKLogSystem(0LL);
      __int128 v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_1001349F0();
      }

      if (!v18) {
        goto LABEL_29;
      }
      id v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7008LL));
      ((void (**)(void, void, void *))v18)[2](v18, 0LL, v45);
      goto LABEL_28;
    }

    uint64_t v21 = _AKSignpostLogSystem(v19);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    os_signpost_id_t v23 = _AKSignpostCreate();
    uint64_t v25 = v24;

    uint64_t v27 = _AKSignpostLogSystem(v26);
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    id v29 = v28;
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v29,  OS_SIGNPOST_INTERVAL_BEGIN,  v23,  "FetchGrandslamTokens",  " enableTelemetry=YES ",  buf,  2u);
    }

    uint64_t v31 = _AKSignpostLogSystem(v30);
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134217984;
      os_signpost_id_t v76 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: FetchGrandslamTokens  enableTelemetry=YES ",  buf,  0xCu);
    }

    authProxy = self->_authProxy;
    id v74 = 0LL;
    id v34 = -[AKAppleIDAuthSupportProxy appleIDAuthSupportTokenCreateWithExternalizedVersion:error:]( authProxy,  "appleIDAuthSupportTokenCreateWithExternalizedVersion:error:",  v20,  &v74);
    id v35 = v74;
    v64 = v35;
    if (v34)
    {
      id v36 = (void *)objc_claimAutoreleasedReturnValue( -[AKAppleIDAuthenticationService _authenticationParametersForUsername:altDSID:context:]( self,  "_authenticationParametersForUsername:altDSID:context:",  v65,  v15,  v16));
      id v62 = v20;
      id v37 = v18;
      id v38 = v16;
      uint64_t v61 = v25;
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v16 altDSID]);
      id v40 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", v39));
      id v63 = v15;
      uint64_t v41 = AKURLBagKeyBasicAuthKey;
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472LL;
      v66[2] = sub_10004E0F0;
      v66[3] = &unk_1001C88B0;
      v67 = v36;
      uint64_t v68 = self;
      id v71 = v34;
      id v69 = v14;
      id v70 = v37;
      os_signpost_id_t v72 = v23;
      uint64_t v73 = v61;
      id v42 = v36;
      uint64_t v43 = v41;
      id v15 = v63;
      [v40 urlForKey:v43 completion:v66];

      id v16 = v38;
      id v18 = (void (**)(void, void, void))v37;
      uint64_t v20 = v62;

      id v44 = v67;
      id v45 = v64;
    }

    else
    {
      uint64_t v50 = _AKLogSystem(v35);
      __int128 v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        sub_100134A1C();
      }

      unint64_t Nanoseconds = _AKSignpostGetNanoseconds(v23, v25);
      uint64_t v53 = _AKSignpostLogSystem(Nanoseconds);
      id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      unsigned int v55 = v54;
      id v45 = v64;
      if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
      {
        unsigned int v56 = [v64 code];
        *(_DWORD *)__int128 buf = 67240192;
        LODWORD(v76) = v56;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v55,  OS_SIGNPOST_INTERVAL_END,  v23,  "FetchGrandslamTokens",  " Error=%{public,signpost.telemetry:number2,name=Error}d ",  buf,  8u);
      }

      uint64_t v58 = _AKSignpostLogSystem(v57);
      uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v60 = [v64 code];
        *(_DWORD *)__int128 buf = 134218496;
        os_signpost_id_t v76 = v23;
        __int16 v77 = 2048;
        double v78 = (double)Nanoseconds / 1000000000.0;
        __int16 v79 = 1026;
        unsigned int v80 = v60;
        _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs:FetchGrandslamTokens  Error=%{public,signpost.telemetry:number2,name=Error}d ",  buf,  0x1Cu);
      }

      if (!v18) {
        goto LABEL_28;
      }
      id v42 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "ac_secureCodingError"));
      id v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:underlyingError:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:underlyingError:",  -7001LL,  v42));
      ((void (**)(void, void, void *))v18)[2](v18, 0LL, v44);
    }

LABEL_28:
    goto LABEL_29;
  }

  uint64_t v46 = _AKLogSystem(v17);
  uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
    sub_1001349C4();
  }

  if (v18)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7009LL));
    ((void (**)(void, void, void *))v18)[2](v18, 0LL, v20);
LABEL_29:
  }
}

- (void)renewRecoveryTokenWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[AKAccountRecoveryController initWithUILiaison:client:]( objc_alloc(&OBJC_CLASS___AKAccountRecoveryController),  "initWithUILiaison:client:",  self->_authUILiaison,  self->_client);
  -[AKAccountRecoveryController renewRecoveryTokenWithContext:completion:]( v8,  "renewRecoveryTokenWithContext:completion:",  v7,  v6);
}

- (void)verifyMasterKey:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = -[AKAccountRecoveryController initWithUILiaison:client:]( objc_alloc(&OBJC_CLASS___AKAccountRecoveryController),  "initWithUILiaison:client:",  self->_authUILiaison,  self->_client);
  -[AKAccountRecoveryController verifyMasterKey:withContext:completion:]( v11,  "verifyMasterKey:withContext:completion:",  v10,  v9,  v8);
}

- (void)persistRecoveryKeyWithContext:(id)a3 authContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, AKAccountRecoveryController *))a5;
  p_client = &self->_client;
  BOOL v12 = -[AKClient hasInternalAccess](self->_client, "hasInternalAccess");
  if (v12)
  {
    uint64_t v13 = -[AKAccountRecoveryController initWithUILiaison:client:]( objc_alloc(&OBJC_CLASS___AKAccountRecoveryController),  "initWithUILiaison:client:",  self->_authUILiaison,  self->_client);
    -[AKAccountRecoveryController persistRecoveryKeyWithContext:authContext:completion:]( v13,  "persistRecoveryKeyWithContext:authContext:completion:",  v8,  v9,  v10);
LABEL_7:

    goto LABEL_8;
  }

  uint64_t v14 = _AKLogSystem(v12);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_100134B3C((id *)p_client, v15);
  }

  if (v10)
  {
    uint64_t v13 = (AKAccountRecoveryController *)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:",  -7026LL));
    v10[2](v10, 0LL, v13);
    goto LABEL_7;
  }

- (void)_initiateEDPRepairForAuthenticationContext:(id)a3 authResults:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = a3;
    id v7 = (void *)os_transaction_create("com.apple.authkit.edpRepair-iForgot");
    id v8 = objc_opt_new(&OBJC_CLASS___AKEDPRequestController);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = nullsub_3;
    v10[3] = &unk_1001C78A8;
    id v11 = v7;
    id v9 = v7;
    -[AKEDPRequestController repairEDPStateForContext:authenticationResults:completion:]( v8,  "repairEDPStateForContext:authenticationResults:completion:",  v6,  v5,  v10);
  }

- (void)_sendAnalyticsEvent:(id)a3 withError:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (!v5) {
    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:kAAFDidSucceed];
  }
  [v7 populateUnderlyingErrorsStartingWithRootError:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[AKAnalyticsReporterRTC rtcAnalyticsReporter]( &OBJC_CLASS___AKAnalyticsReporterRTC,  "rtcAnalyticsReporter"));
  [v6 sendEvent:v7];
}

- (void)_recoverCredentialsAndAuthenticateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "User does not have all their credentials, so we're going to iForgot...",  buf,  2u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[AAFAnalyticsEvent ak_analyticsEventWithContext:client:eventName:error:]( &OBJC_CLASS___AAFAnalyticsEvent,  "ak_analyticsEventWithContext:client:eventName:error:",  v6,  self->_client,  @"com.apple.authkit.accountRecoveryStart",  0LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[AKAnalyticsReporterRTC rtcAnalyticsReporter]( &OBJC_CLASS___AKAnalyticsReporterRTC,  "rtcAnalyticsReporter"));
  [v11 sendEvent:v10];

  uint64_t v13 = _AKSignpostLogSystem(v12);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  os_signpost_id_t v15 = _AKSignpostCreate();
  uint64_t v17 = v16;

  uint64_t v19 = _AKSignpostLogSystem(v18);
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  uint64_t v21 = v20;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_BEGIN,  v15,  "iForgot",  " enableTelemetry=YES ",  buf,  2u);
  }

  uint64_t v23 = _AKSignpostLogSystem(v22);
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    os_signpost_id_t v34 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: iForgot  enableTelemetry=YES ",  buf,  0xCu);
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10004EFE0;
  v27[3] = &unk_1001C88D8;
  os_signpost_id_t v31 = v15;
  uint64_t v32 = v17;
  id v28 = v6;
  id v29 = self;
  id v30 = v7;
  id v25 = v7;
  id v26 = v6;
  -[AKAppleIDAuthenticationService _beginiForgotFlowWithContext:completion:]( self,  "_beginiForgotFlowWithContext:completion:",  v26,  v27);
}

- (void)_handleRecoverCredentialsError:(id)a3 withContext:(id)a4 event:(id)a5 andCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void, id))a6;
  id v13 = a5;
  uint64_t v14 = _AKLogSystem(v13);
  os_signpost_id_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_100134C18();
  }

  -[AKAppleIDAuthenticationService _sendAnalyticsEvent:withError:](self, "_sendAnalyticsEvent:withError:", v13, v10);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
  if (![v16 isEqualToString:AKAppleIDAuthenticationErrorDomain])
  {

    goto LABEL_7;
  }

  unsigned int v17 = [v11 _keepAlive];

  if (!v17)
  {
LABEL_7:
    v12[2](v12, 0LL, v10);
    goto LABEL_8;
  }

  [v11 setNeedsCredentialRecovery:0];
  -[AKAppleIDAuthenticationService _keepLoginAliveWithContext:error:andCompletion:]( self,  "_keepLoginAliveWithContext:error:andCompletion:",  v11,  v10,  v12);
LABEL_8:
}

- (void)_beginiForgotFlowWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100134CA4();
  }

  id v10 = [v6 isTriggeredByNotification];
  if ((_DWORD)v10)
  {
    uint64_t v11 = _AKLogSystem(v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "iForgot flow was triggered by push notification. Will try to use dedicated URL.",  buf,  2u);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", v13));
    os_signpost_id_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 iForgotContinuationURL]);

    if (v15) {
      goto LABEL_8;
    }
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", v16));
  os_signpost_id_t v15 = (void *)objc_claimAutoreleasedReturnValue([v17 iForgotURL]);

  if (v15)
  {
LABEL_8:
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[AKAppleIDAuthenticationService _addAccountNameParameterToURL:withContext:]( self,  "_addAccountNameParameterToURL:withContext:",  v15,  v6));

    uint64_t v20 = -[NSURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSURLRequest), "initWithURL:", v19);
    [v6 setNeedsCredentialRecovery:1];
    if (([v6 isEphemeral] & 1) == 0
      && ([v6 shouldPromptForPasswordOnly] & 1) == 0)
    {
      [v6 setShouldOfferSecurityUpgrade:1];
    }

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10004F8B0;
    v23[3] = &unk_1001C8720;
    id v24 = v7;
    -[AKAppleIDAuthenticationService _showServerUIWithURLRequest:context:completion:]( self,  "_showServerUIWithURLRequest:context:completion:",  v20,  v6,  v23);
  }

  else
  {
    uint64_t v21 = _AKLogSystem(v18);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100134C78();
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7017LL));
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0LL, 0LL, v19);
  }
}

- (id)_addAccountNameParameterToURL:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 username]);
  id v8 = [v7 length];

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 username]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "aaf_urlEncoded"));

    if ([v6 needsCredentialRecovery]
      && [v6 isRequestedFromOOPViewService]
      && (uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager")),
          unsigned int v12 = [v11 isForgotPasswordNativeTakeoverEnabled],
          v11,
          v12))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 absoluteString]);
      id v14 = [v13 stringByAppendingFormat:@"?%@=%@&%@=%@", AKRecoveryUsernameRequestParameter, v10, AKRecoveryAutoSubmitAccountRequestParameter, AKTrueValue];
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 absoluteString]);
      id v14 = [v13 stringByAppendingFormat:@"?%@=%@", AKRecoveryUsernameRequestParameter, v10, v18, v19];
    }

    os_signpost_id_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v15));
  }

  else
  {
    id v16 = v5;
  }

  return v16;
}

- (void)_repairAppleIDWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting repair...", buf, 2u);
  }

  id v28 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 authKitAccount:&v28]);
  id v11 = v28;
  unsigned int v12 = v11;
  if (v11 || !v10)
  {
    uint64_t v20 = _AKLogSystem(v11);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100134CD0();
    }

    v7[2](v7, 0LL, v12);
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", v13));
    os_signpost_id_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 repairURL]);

    if (v15)
    {
      unsigned int v17 = -[NSURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSURLRequest), "initWithURL:", v15);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[AKDServerUIContext serverUIContextFromResponse:authContext:urlRequest:]( &OBJC_CLASS___AKDServerUIContext,  "serverUIContextFromResponse:authContext:urlRequest:",  0LL,  v6,  v17));
      uint64_t v19 = -[AKDServerUIController initWithLiaison:client:delegate:]( objc_alloc(&OBJC_CLASS___AKDServerUIController),  "initWithLiaison:client:delegate:",  self->_authUILiaison,  self->_client,  self);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_10004FD84;
      v24[3] = &unk_1001C85D0;
      uint64_t v27 = v7;
      v24[4] = self;
      id v25 = v10;
      id v26 = v6;
      -[AKDServerUIController showServerUIWithContext:completion:](v19, "showServerUIWithContext:completion:", v18, v24);
    }

    else
    {
      uint64_t v22 = _AKLogSystem(v16);
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100134D30();
      }

      unsigned int v17 = (NSURLRequest *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7005LL));
      v7[2](v7, 0LL, v17);
    }
  }
}

- (void)_createNewAppleIDAndAuthenticateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "User wants a new Apple ID to auth with...",  buf,  2u);
  }

  uint64_t v11 = _AKSignpostLogSystem(v10);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  os_signpost_id_t v13 = _AKSignpostCreate();
  uint64_t v15 = v14;

  uint64_t v17 = _AKSignpostLogSystem(v16);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  uint64_t v19 = v18;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "CreateNewAppleID",  " enableTelemetry=YES ",  buf,  2u);
  }

  uint64_t v21 = _AKSignpostLogSystem(v20);
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    os_signpost_id_t v31 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: CreateNewAppleID  enableTelemetry=YES ",  buf,  0xCu);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100050104;
  v25[3] = &unk_1001C8900;
  os_signpost_id_t v28 = v13;
  uint64_t v29 = v15;
  id v26 = v6;
  id v27 = v7;
  void v25[4] = self;
  id v23 = v6;
  id v24 = v7;
  -[AKAppleIDAuthenticationService _beginAppleIDCreationFlowWithContext:completion:]( self,  "_beginAppleIDCreationFlowWithContext:completion:",  v23,  v25);
}

- (void)_handleCreateNewAppleIDError:(id)a3 withContext:(id)a4 andCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, id))a5;
  uint64_t v11 = _AKLogSystem(v10);
  unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_100134E0C();
  }

  os_signpost_id_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  if (![v13 isEqualToString:AKAppleIDAuthenticationErrorDomain])
  {

    goto LABEL_7;
  }

  unsigned int v14 = [v9 _keepAlive];

  if (!v14)
  {
LABEL_7:
    v10[2](v10, 0LL, v8);
    goto LABEL_8;
  }

  [v9 setNeedsNewAppleID:0];
  [v9 setNeedsNewChildAccount:0];
  -[AKAppleIDAuthenticationService _keepLoginAliveWithContext:error:andCompletion:]( self,  "_keepLoginAliveWithContext:error:andCompletion:",  v9,  v8,  v10);
LABEL_8:
}

- (void)_beginAppleIDCreationFlowWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 needsNewChildAccount];
  int v9 = (int)v8;
  uint64_t v10 = _AKLogSystem(v8);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v12) {
      sub_100134E98();
    }

    os_signpost_id_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", v13));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 createChildAccountURL]);

    if (v15)
    {
LABEL_5:
      uint64_t v17 = -[NSURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSURLRequest), "initWithURL:", v15);
      -[AKAppleIDAuthenticationService _showServerUIWithURLRequest:context:completion:]( self,  "_showServerUIWithURLRequest:context:completion:",  v17,  v6,  v7);
      goto LABEL_12;
    }
  }

  else
  {
    if (v12) {
      sub_100134EC4();
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", v18));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v19 createAppleIDURL]);

    id v16 = [v6 setNeedsNewAppleID:1];
    if (v15) {
      goto LABEL_5;
    }
  }

  uint64_t v20 = _AKLogSystem(v16);
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_100134E6C();
  }

  uint64_t v17 = (NSURLRequest *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7016LL));
  (*((void (**)(id, void, void, NSURLRequest *))v7 + 2))(v7, 0LL, 0LL, v17);
LABEL_12:
}

- (void)_changePasswordAndAuthenticateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v16 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 authKitAccount:&v16]);
  id v9 = v16;
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = _AKLogSystem(v9);
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100134CD0();
    }

    v7[2](v7, 0LL, v10);
  }

  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100050890;
    v13[3] = &unk_1001C8260;
    uint64_t v15 = v7;
    void v13[4] = self;
    id v14 = v6;
    -[AKAppleIDAuthenticationService _beginChangePasswordFlowWithAccount:context:completion:]( self,  "_beginChangePasswordFlowWithAccount:context:completion:",  v8,  v14,  v13);
  }
}

- (void)_beginChangePasswordFlowWithAccount:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _AKLogSystem(v10);
  BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100135000();
  }

  if (v8)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 altDSID]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", v14));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 changePasswordURL]);

    if (v16)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_100050CF4;
      v23[3] = &unk_1001C8928;
      id v24 = v9;
      id v25 = v16;
      id v26 = self;
      id v27 = v10;
      -[AKAppleIDAuthenticationService _performPasswordlessSRPAuthWithAccount:context:completion:]( self,  "_performPasswordlessSRPAuthWithAccount:context:completion:",  v8,  v24,  v23);

      uint64_t v18 = v24;
    }

    else
    {
      uint64_t v21 = _AKLogSystem(v17);
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100134FD4();
      }

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7005LL));
      (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0LL, 0LL, v18);
    }
  }

  else
  {
    uint64_t v19 = _AKLogSystem(v13);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100134FA8();
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7044LL));
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0LL, 0LL, v16);
  }
}

- (id)_authenticationParametersForUsername:(id)a3 altDSID:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = -[AKSRPAuthenticationContextHelper initWithContext:]( objc_alloc(&OBJC_CLASS___AKSRPAuthenticationContextHelper),  "initWithContext:",  v8);

  -[AKSRPContextHelper setUsername:](v11, "setUsername:", v10);
  -[AKSRPContextHelper setAltDSID:](v11, "setAltDSID:", v9);

  -[AKSRPContextHelper setIgnoreInternalTokens:](v11, "setIgnoreInternalTokens:", 1LL);
  -[AKSRPContextHelper setClient:](v11, "setClient:", self->_client);
  return v11;
}

- (id)_requestingControllerWithServerResponse:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___AKCAPiggybackReporter);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 transactionId]);
  id v7 = -[AKCAPiggybackReporter initWithRequestID:](v5, "initWithRequestID:", v6);

  id v8 = -[AKPiggybackRequestingController initWithServerResponse:andDelegate:piggybackReporter:]( objc_alloc(&OBJC_CLASS___AKPiggybackRequestingController),  "initWithServerResponse:andDelegate:piggybackReporter:",  v4,  self,  v7);
  return v8;
}

- (void)startPiggybackingForServerResponse:(id)a3 context:(id)a4 password:(id)a5 username:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[AKAppleIDAuthenticationService _requestingControllerWithServerResponse:]( self,  "_requestingControllerWithServerResponse:",  a3));
  [v14 setInitiatingContext:v13];

  [v14 setInitiatingPassword:v12];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 delegate]);

  if (!v15) {
    [v14 setDelegate:self];
  }
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[AKPiggybackController sharedController](&OBJC_CLASS___AKPiggybackController, "sharedController"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10005114C;
  v18[3] = &unk_1001C7B60;
  id v19 = v11;
  id v17 = v11;
  [v16 startRequestSessionWithController:v14 completion:v18];
}

- (void)performCircleRequestWithContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKPiggybackController sharedController](&OBJC_CLASS___AKPiggybackController, "sharedController"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000512D8;
  v10[3] = &unk_1001C8950;
  id v11 = v6;
  id v8 = v6;
  id v9 = [v7 performCircleRequestWithContext:v5 completion:v10];
}

- (void)piggyback:(id)a3 promptForRandomCodeWithCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Prompting for piggybacking code", v12, 2u);
  }

  authUILiaison = self->_authUILiaison;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 initiatingContext]);

  -[AKAuthenticationUILiaison presentSecondFactorUIForContext:client:completion:]( authUILiaison,  "presentSecondFactorUIForContext:client:completion:",  v11,  self->_client,  v6);
}

- (void)piggyback:(id)a3 validateSecurityCode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 idmsData]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 initialAuthResponse]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 initiatingContext]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000514C4;
  v16[3] = &unk_1001C8978;
  id v17 = v8;
  id v18 = v9;
  void v16[4] = self;
  id v14 = v8;
  id v15 = v9;
  -[AKAppleIDAuthenticationService _handleSecondFactorUICompletionWithCode:error:idmsData:piggybacking:initialAuthResponse:context:completion:]( self,  "_handleSecondFactorUICompletionWithCode:error:idmsData:piggybacking:initialAuthResponse:context:completion:",  v10,  0LL,  v11,  1LL,  v12,  v13,  v16);
}

- (void)piggyback:(id)a3 shouldContinueWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 initiatingContext]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 username]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 initiatingPassword]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 initialAuthResponse]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 initiatingContext]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100051758;
  v15[3] = &unk_1001C89C8;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  -[AKAppleIDAuthenticationService _shouldContinueAuthenticatingForUsername:password:serverResponse:didShowServerUI:continuationData:error:context:completion:]( self,  "_shouldContinueAuthenticatingForUsername:password:serverResponse:didShowServerUI:continuationData:error:context:completion:",  v9,  v10,  v11,  0LL,  0LL,  0LL,  v12,  v15);
}

- (void)piggyback:(id)a3 handleEscapeHatchError:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _AKLogSystem(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v23 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Piggybacking session failed with error: %@",  buf,  0xCu);
  }

  authUILiaison = self->_authUILiaison;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 initiatingContext]);
  client = self->_client;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000519CC;
  v18[3] = &unk_1001C7EC8;
  id v19 = v8;
  uint64_t v20 = self;
  id v21 = v10;
  id v16 = v10;
  id v17 = v8;
  -[AKAuthenticationUILiaison dismissSecondFactorUIForContext:client:completion:]( authUILiaison,  "dismissSecondFactorUIForContext:client:completion:",  v14,  client,  v18);
}

- (void)piggyback:(id)a3 handleVerificationWithError:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue([a3 initiatingContext]);
  -[AKAppleIDAuthenticationService _showAlertForLoginCodeValidationError:context:completion:]( self,  "_showAlertForLoginCodeValidationError:context:completion:",  v9,  v10,  v8);
}

- (BOOL)_updateAuthKitAccount:(id)a3 withServerResponse:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 edpState]);

  if (v13)
  {
    accountManager = self->_accountManager;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 edpState]);
    -[AKAccountManager setEDPState:forAccount:](accountManager, "setEDPState:forAccount:", v15, v10);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 passwordVersion]);

  if (v16)
  {
    id v17 = self->_accountManager;
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 passwordVersion]);
    -[AKAccountManager setPasswordVersion:forAccount:](v17, "setPasswordVersion:forAccount:", v18, v10);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v11 srpProtocol]);

  if (v19)
  {
    uint64_t v20 = self->_accountManager;
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v11 srpProtocol]);
    -[AKAccountManager setSRPProtocol:forAccount:](v20, "setSRPProtocol:forAccount:", v21, v10);
  }

  uint64_t v22 = objc_opt_new(&OBJC_CLASS___AKServerResponseAccountUpdater);
  unsigned __int8 v23 = -[AKServerResponseAccountUpdater updateAuthKitAccount:withServerResponse:context:error:]( v22,  "updateAuthKitAccount:withServerResponse:context:error:",  v10,  v11,  v12,  a6);

  return v23;
}

- (BOOL)_shouldSkipAccountUpdatesForAuthWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 proxiedDeviceAnisetteData]);
  id v5 = +[AKAccountManager isAccountsFrameworkAvailable](&OBJC_CLASS___AKAccountManager, "isAccountsFrameworkAvailable");
  if ((v5 & 1) != 0)
  {
    id v6 = [v3 isEphemeral];
    if ((_DWORD)v6)
    {
      uint64_t v7 = _AKLogSystem(v6);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v22 = 0;
        id v9 = "This auth is ephemeral. Skip ACAccount update.";
        id v10 = (uint8_t *)&v22;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      }
    }

    else
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v3 proxiedDevice]);
      uint64_t v15 = v14 | v4;

      if (v15)
      {
        uint64_t v17 = _AKLogSystem(v16);
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_8;
        }
        __int16 v21 = 0;
        id v9 = "This is a proxy auth. Skip ACAccount update.";
        id v10 = (uint8_t *)&v21;
        goto LABEL_7;
      }

      id v18 = [v3 needsNewChildAccount];
      if (!(_DWORD)v18)
      {
        BOOL v12 = 0;
        goto LABEL_9;
      }

      uint64_t v19 = _AKLogSystem(v18);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v20 = 0;
        id v9 = "This is a child account creation flow. Skip ACAccount update.";
        id v10 = (uint8_t *)&v20;
        goto LABEL_7;
      }
    }
  }

  else
  {
    uint64_t v11 = _AKLogSystem(v5);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      id v9 = "We are running in recovery. Skip ACAccount update.";
      id v10 = buf;
      goto LABEL_7;
    }
  }

- (void)synchronizeFollowUpItemsForContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___AKAuthHandlerImpl);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[AKFollowUpManagerFactory sharedAuthKitFollowupManager]( &OBJC_CLASS___AKFollowUpManagerFactory,  "sharedAuthKitFollowupManager"));
  [v7 synchronizeFollowUpItemsForContext:v6 authHandler:v8 completion:v5];
}

- (void)teardownFollowUpWithContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = _AKLogSystem(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting to teardown follow ups", v10, 2u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[AKFollowUpManagerFactory sharedAuthKitFollowupManager]( &OBJC_CLASS___AKFollowUpManagerFactory,  "sharedAuthKitFollowupManager"));
  [v9 teardownFollowUpWithContext:v6 completion:v5];
}

- (void)_fetchDeviceListWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 type] != (id)3) {
    goto LABEL_4;
  }
  BOOL v8 = -[AKClient hasServerOnlyDeviceListAccess](self->_client, "hasServerOnlyDeviceListAccess");
  if (v8)
  {
    [v6 setForceFetch:1];
LABEL_4:
    authTrafficController = self->_authTrafficController;
    client = self->_client;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10005236C;
    v14[3] = &unk_1001C7280;
    id v15 = v6;
    uint64_t v16 = self;
    id v17 = v7;
    -[AKAuthenticationTrafficController beginAuthenticatedRequestWithContext:client:clearanceHandler:]( authTrafficController,  "beginAuthenticatedRequestWithContext:client:clearanceHandler:",  v15,  client,  v14);

    uint64_t v11 = v15;
LABEL_5:

    goto LABEL_6;
  }

  uint64_t v12 = _AKLogSystem(v8);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1001351AC();
  }

  if (v7)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ak_deviceListErrorWithCode:]( &OBJC_CLASS___NSError,  "ak_deviceListErrorWithCode:",  -14007LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
    goto LABEL_5;
  }

- (void)deleteDeviceListCacheWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
  unsigned int v9 = [v8 isDeviceListCacheEnabled];

  if (v9)
  {
    uint64_t v11 = objc_alloc(&OBJC_CLASS___AKDeviceListRequester);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[AKDeviceListStoreManager sharedManager](&OBJC_CLASS___AKDeviceListStoreManager, "sharedManager"));
    id v13 = objc_opt_new(&OBJC_CLASS___AKCDPFactory);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    id v15 = -[AKDeviceListRequester initWithStoreManager:cdpFactory:accountManager:client:]( v11,  "initWithStoreManager:cdpFactory:accountManager:client:",  v12,  v13,  v14,  self->_client);

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100052874;
    v18[3] = &unk_1001C7460;
    id v19 = v6;
    id v20 = v7;
    -[AKDeviceListRequester clearDeviceListCacheWithContext:completionHandler:]( v15,  "clearDeviceListCacheWithContext:completionHandler:",  v19,  v18);
  }

  else
  {
    uint64_t v16 = _AKLogSystem(v10);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_10013524C();
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    }
  }
}

- (void)deleteDeviceListCacheWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
  unsigned int v5 = [v4 isDeviceListCacheEnabled];

  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKDeviceListStoreManager sharedManager](&OBJC_CLASS___AKDeviceListStoreManager, "sharedManager"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100052A60;
    v10[3] = &unk_1001C8648;
    id v11 = v3;
    [v7 clearDatabaseWithCompletionHandler:v10];
  }

  else
  {
    uint64_t v8 = _AKLogSystem(v6);
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10013524C();
    }

    if (v3) {
      (*((void (**)(id, void, void))v3 + 2))(v3, 0LL, 0LL);
    }
  }
}

- (void)fetchTokensWithAltDSID:(id)a3 tokenIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  __int16 v21 = (void (**)(id, NSMutableDictionary *, id))a5;
  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = v9;
  id v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    id v12 = v11;
    id v13 = 0LL;
    uint64_t v14 = *(void *)v25;
    do
    {
      id v15 = 0LL;
      uint64_t v16 = v13;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v15);
        tokenManager = self->_tokenManager;
        id v23 = v16;
        id v19 = (void *)objc_claimAutoreleasedReturnValue( -[AKTokenManager tokenWithIdentifier:altDSID:forAccount:error:]( tokenManager,  "tokenWithIdentifier:altDSID:forAccount:error:",  v17,  v8,  0LL,  &v23));
        id v13 = v23;

        if (v19)
        {
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 description]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v20, v17);
        }

        id v15 = (char *)v15 + 1;
        uint64_t v16 = v13;
      }

      while (v12 != v15);
      id v12 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v12);
  }

  else
  {
    id v13 = 0LL;
  }

  if (v21) {
    v21[2](v21, v10, v13);
  }
}

- (void)deleteTokensFromCacheWithAltDSID:(id)a3 tokenIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, BOOL, id))a5;
  if (!v9 || ![v9 count])
  {
    tokenManager = self->_tokenManager;
    id v21 = 0LL;
    -[AKTokenManager deleteTokenFromCacheWithIdentifer:altDSID:error:]( tokenManager,  "deleteTokenFromCacheWithIdentifer:altDSID:error:",  0LL,  v8,  &v21);
    id v14 = v21;
    if (!v10) {
      goto LABEL_13;
    }
LABEL_12:
    v10[2](v10, v14 == 0LL, v14);
    goto LABEL_13;
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    id v13 = v12;
    id v14 = 0LL;
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v16 = 0LL;
      uint64_t v17 = v14;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v16);
        id v19 = self->_tokenManager;
        id v22 = v17;
        -[AKTokenManager updateToken:identifier:altDSID:account:credential:error:]( v19,  "updateToken:identifier:altDSID:account:credential:error:",  0LL,  v18,  v8,  0LL,  0LL,  &v22);
        id v14 = v22;

        uint64_t v16 = (char *)v16 + 1;
        uint64_t v17 = v14;
      }

      while (v13 != v16);
      id v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v13);
  }

  else
  {
    id v14 = 0LL;
  }

  if (v10) {
    goto LABEL_12;
  }
LABEL_13:
}

- (void)fetchBirthdayForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = -[AKClient hasBirthdayAccess](self->_client, "hasBirthdayAccess");
  if (v8)
  {
    BOOL v9 = -[AKClient isPermittedToAccessBirthday](self->_client, "isPermittedToAccessBirthday");
    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
      id v24 = 0LL;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 authKitAccountWithAltDSID:v6 error:&v24]);
      id v12 = v24;

      if (!v11)
      {
        if (v12)
        {
          if (v7) {
            (*((void (**)(id, void, void, id))v7 + 2))(v7, 0LL, 0LL, v12);
          }
          goto LABEL_26;
        }

        if (!v7)
        {
LABEL_26:

          goto LABEL_27;
        }

        id v13 = (AKBirthDayKeychain *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKPersonalInformationErrorDomain,  -18001LL,  0LL));
        (*((void (**)(id, void, void, AKBirthDayKeychain *))v7 + 2))(v7, 0LL, 0LL, v13);
LABEL_25:

        goto LABEL_26;
      }

      id v13 = objc_alloc_init(&OBJC_CLASS___AKBirthDayKeychain);
      id v23 = 0LL;
      id v14 = (void *)objc_claimAutoreleasedReturnValue( -[AKBirthDayKeychain fetchBirthDayForAltDSID:error:]( v13,  "fetchBirthDayForAltDSID:error:",  v6,  &v23));
      id v15 = v23;
      if (v15)
      {
        if (v7) {
          (*((void (**)(id, void, void, id))v7 + 2))(v7, 0LL, 0LL, v15);
        }
        goto LABEL_24;
      }

      if (v14)
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 components:28 fromDate:v14]);

        if (v7)
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v20 day]));
          id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v20 month]));
          (*((void (**)(id, void *, void *, void))v7 + 2))(v7, v21, v22, 0LL);
        }
      }

      else
      {
        if (!v7)
        {
LABEL_24:

          goto LABEL_25;
        }

        id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKPersonalInformationErrorDomain,  -18003LL,  0LL));
        (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0LL, 0LL, v20);
      }

      goto LABEL_24;
    }

    uint64_t v18 = _AKLogSystem(v9);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100135304();
    }
  }

  else
  {
    uint64_t v16 = _AKLogSystem(v8);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100135330();
    }
  }

  if (v7)
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKPersonalInformationErrorDomain,  -18002LL,  0LL));
    (*((void (**)(id, void, void, id))v7 + 2))(v7, 0LL, 0LL, v12);
LABEL_27:
  }
}

- (void)_edpRequestWithAltDSID:(id)a3 URLKey:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_new(&OBJC_CLASS___AKEDPRequestController);
  -[AKEDPRequestController setClient:](v11, "setClient:", self->_client);
  -[AKEDPRequestController edpRequestWithAltDSID:URLKey:completion:]( v11,  "edpRequestWithAltDSID:URLKey:completion:",  v10,  v9,  v8);
}

- (void)performEdpMigrationWithAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  BOOL v8 = -[AKClient hasOwnerAccess](self->_client, "hasOwnerAccess");
  if (v8)
  {
    if (v6)
    {
      -[AKAppleIDAuthenticationService _edpRequestWithAltDSID:URLKey:completion:]( self,  "_edpRequestWithAltDSID:URLKey:completion:",  v6,  AKURLBagKeyEDPMigration,  v7);
      goto LABEL_13;
    }

    uint64_t v12 = _AKLogSystem(v8);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10013535C();
    }

    if (v7)
    {
      uint64_t v11 = -7025LL;
      goto LABEL_12;
    }
  }

  else
  {
    uint64_t v9 = _AKLogSystem(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10013315C();
    }

    if (v7)
    {
      uint64_t v11 = -7026LL;
LABEL_12:
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v11));
      v7[2](v7, 0LL, v14);
    }
  }

- (void)performEdpCompleteKeyDropWithAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  BOOL v8 = -[AKClient hasOwnerAccess](self->_client, "hasOwnerAccess");
  if (v8)
  {
    if (v6)
    {
      -[AKAppleIDAuthenticationService _edpRequestWithAltDSID:URLKey:completion:]( self,  "_edpRequestWithAltDSID:URLKey:completion:",  v6,  AKURLBagKeyEDPComplete,  v7);
      goto LABEL_13;
    }

    uint64_t v12 = _AKLogSystem(v8);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10013535C();
    }

    if (v7)
    {
      uint64_t v11 = -7025LL;
      goto LABEL_12;
    }
  }

  else
  {
    uint64_t v9 = _AKLogSystem(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10013315C();
    }

    if (v7)
    {
      uint64_t v11 = -7026LL;
LABEL_12:
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v11));
      v7[2](v7, 0LL, v14);
    }
  }

- (void)performRemoveEdpTokenWithAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  BOOL v8 = -[AKClient hasOwnerAccess](self->_client, "hasOwnerAccess");
  if (v8)
  {
    if (v6)
    {
      -[AKAppleIDAuthenticationService _edpRequestWithAltDSID:URLKey:completion:]( self,  "_edpRequestWithAltDSID:URLKey:completion:",  v6,  AKURLBagKeyRemoveEDPToken,  v7);
      goto LABEL_13;
    }

    uint64_t v12 = _AKLogSystem(v8);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10013535C();
    }

    if (v7)
    {
      uint64_t v11 = -7025LL;
      goto LABEL_12;
    }
  }

  else
  {
    uint64_t v9 = _AKLogSystem(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10013315C();
    }

    if (v7)
    {
      uint64_t v11 = -7026LL;
LABEL_12:
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v11));
      v7[2](v7, 0LL, v14);
    }
  }

- (AKPasswordResetPresenter)passwordResetPresenter
{
  return self->_passwordResetPresenter;
}

- (void)setPasswordResetPresenter:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

  ;
}

@end