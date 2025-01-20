@interface IDSDXPCInternalTesting
- (BOOL)hasEntitlementForPushReplay;
- (IDSDXPCInternalTesting)initWithQueue:(id)a3 connection:(id)a4 offGridStateManager:(id)a5;
- (IDSDXPCOffGridStateManager)offGridStateManager;
- (IDSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (id)_registeredIdentityTimestamps;
- (id)transparentEndpointViewer;
- (void)assertTransportThreadRealTimeMode:(BOOL)a3 completionHandler:(id)a4;
- (void)autoBugCaptureWithCompletion:(id)a3;
- (void)checkServerStorageForService:(id)a3 withCompletion:(id)a4;
- (void)clearAllSenderKeysWithCompletion:(id)a3;
- (void)clearCacheAndUpdatePeersForService:(id)a3;
- (void)clearCacheWithCompletion:(id)a3;
- (void)currentECVersionWithBlock:(id)a3;
- (void)deviceChangedForDeviceID:(id)a3 isNearby:(BOOL)a4 isConnected:(BOOL)a5 isCloudConnected:(BOOL)a6 completionHandler:(id)a7;
- (void)fetchCurrentDeviceKVSKey:(id)a3;
- (void)fetchEndpointCacheStateForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 completion:(id)a6;
- (void)fetchPrivateClientDataDescriptionForService:(id)a3 completion:(id)a4;
- (void)fetchPrivateDeviceDataDescription:(id)a3;
- (void)fetchStoredUserDescriptions:(id)a3;
- (void)fetchTransparentEndpointsForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 verifyAgainstTrustCircle:(BOOL)a6 completion:(id)a7;
- (void)fetchVerifierKVSTrustedDevicesWithCompletion:(id)a3;
- (void)fetchXPCStateDescriptionForProcesses:(id)a3 withCompletion:(id)a4;
- (void)forceAccountRenewalOnService:(id)a3;
- (void)idsProtocolVersion:(id)a3;
- (void)kickVerificationForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 completion:(id)a6;
- (void)listDonatedHandlesWithCompletion:(id)a3;
- (void)listRegistrationHistoryWithBAADigests:(BOOL)a3 completion:(id)a4;
- (void)listSenderKeysForURIs:(id)a3 completion:(id)a4;
- (void)nukeTransparencyStateWithCompletion:(id)a3;
- (void)oneToOneECCQuicktestEncryptionWithData:(id)a3 completion:(id)a4;
- (void)popupPromptWithTitle:(id)a3 message:(id)a4 defaultButton:(id)a5 defaultUrl:(id)a6 alternateButton:(id)a7 alternatrUrl:(id)a8 completion:(id)a9;
- (void)postNewDeviceNotification:(id)a3 iCloudSignIn:(BOOL)a4 iMessageSignIn:(BOOL)a5 facetimeSignIn:(BOOL)a6 forAppleID:(id)a7;
- (void)registeredIdentityTimestampsWithBlock:(id)a3;
- (void)removeAllKVSTrustedDevices:(id)a3;
- (void)removeConnectionWithConnectionName:(id)a3 completionHandler:(id)a4;
- (void)sendFakePushFromFile:(id)a3 completion:(id)a4;
- (void)sendSenderKeyToURI:(id)a3 completion:(id)a4;
- (void)setECVersion:(unsigned int)a3 withCompletion:(id)a4;
- (void)setForceKeyRoll:(BOOL)a3 withCompletion:(id)a4;
- (void)setOffGridMode:(int64_t)a3 options:(id)a4 completion:(id)a5;
- (void)tapToRadarWithTitle:(id)a3 message:(id)a4 context:(id)a5 completion:(id)a6;
- (void)toggleDisableDeviceUserToDisabled:(BOOL)a3;
- (void)triggerAllFirewallNotificationsWithHandle:(id)a3 delay:(double)a4 service:(id)a5;
- (void)triggerAllTemporaryPhoneNotificationsWithHandle:(id)a3 delay:(double)a4;
- (void)triggerFirewallDBCleanupWithInterval:(double)a3;
- (void)triggerKTCDPAccountStatusNotificationWithAccountStatus:(int64_t)a3;
- (void)triggerKeyRollWithCompletion:(id)a3;
- (void)triggerRestrictedMessageCleanup;
- (void)updateCurrentDeviceInKVS:(id)a3;
@end

@implementation IDSDXPCInternalTesting

- (IDSDXPCInternalTesting)initWithQueue:(id)a3 connection:(id)a4 offGridStateManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (CUTIsInternalInstall())
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___IDSDXPCInternalTesting;
    v12 = -[IDSDXPCInternalTesting init](&v16, "init");
    p_isa = (id *)&v12->super.isa;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_queue, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
    }

    self = p_isa;
    v14 = self;
  }

  else
  {
    v14 = 0LL;
  }

  return v14;
}

- (void)oneToOneECCQuicktestEncryptionWithData:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v78 = 0LL;
  v59 = (void (**)(id, __CFDictionary *, id))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[IDSNGMFullDeviceIdentity identityWithAccess:usageIdentifier:error:]( &OBJC_CLASS___IDSNGMFullDeviceIdentity,  "identityWithAccess:usageIdentifier:error:",  kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly,  @"com.apple.idstool",  &v78));
  id v7 = v78;
  id v77 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 publicDeviceIdentityWithError:&v77]);
  id v9 = v77;

  id v76 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[IDSNGMFullDeviceIdentity identityWithAccess:usageIdentifier:error:]( &OBJC_CLASS___IDSNGMFullDeviceIdentity,  "identityWithAccess:usageIdentifier:error:",  kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly,  @"com.apple.idstool",  &v76));
  id v11 = v76;

  id v75 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 publicDeviceIdentityWithError:&v75]);
  id v13 = v75;

  id v14 = v5;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  id v74 = v15;
  v64 = v6;
  LOWORD(v48) = 0;
  v61 = v12;
  uint64_t v19 = objc_claimAutoreleasedReturnValue( objc_msgSend( v12,  "sealMessage:authenticatedData:messageType:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:f orceSizeOptimizations:resetState:encryptedAttributes:signedByFullIdentity:errors:",  v14,  v16,  0,  &stru_100912B50,  &stru_100912B50,  v17,  &stru_100912B50,  v18,  v48,  0,  v6,  &v74));
  id v51 = v74;

  id v73 = v13;
  v62 = v10;
  v63 = v8;
  uint64_t v20 = objc_claimAutoreleasedReturnValue([v10 unsealMessage:v19 signedByPublicIdentity:v8 error:&v73]);
  id v21 = v73;

  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utilities](&OBJC_CLASS___IDSFoundationLog, "utilities"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v80 = v14;
    __int16 v81 = 2112;
    uint64_t v82 = v19;
    __int16 v83 = 2112;
    uint64_t v84 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "plain: %@, encrypted: %@, decrypted: %@",  buf,  0x20u);
  }

  value = (void *)v19;
  v60 = (void *)v20;

  id v72 = v21;
  uint64_t v23 = objc_claimAutoreleasedReturnValue([v6 dataRepresentationWithError:&v72]);
  id v24 = v72;

  uint64_t v25 = objc_claimAutoreleasedReturnValue([v8 identityData]);
  uint64_t v26 = objc_claimAutoreleasedReturnValue([v8 prekeyData]);
  id v71 = v24;
  uint64_t v27 = objc_claimAutoreleasedReturnValue([v10 dataRepresentationWithError:&v71]);
  id v28 = v71;

  uint64_t v29 = objc_claimAutoreleasedReturnValue([v61 identityData]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v61 prekeyData]);
  id v70 = v28;
  v58 = (void *)v23;
  v52 = v14;
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[IDSNGMFullDeviceIdentity identityWithDataRepresentation:error:]( &OBJC_CLASS___IDSNGMFullDeviceIdentity,  "identityWithDataRepresentation:error:",  v23,  &v70));
  id v32 = v70;

  id v69 = v32;
  v56 = (void *)v26;
  v57 = (void *)v25;
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[IDSNGMPublicDeviceIdentity identityWithIdentityData:prekeyData:error:]( &OBJC_CLASS___IDSNGMPublicDeviceIdentity,  "identityWithIdentityData:prekeyData:error:",  v25,  v26,  &v69));
  id v34 = v69;

  id v68 = v34;
  v55 = (void *)v27;
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[IDSNGMFullDeviceIdentity identityWithDataRepresentation:error:]( &OBJC_CLASS___IDSNGMFullDeviceIdentity,  "identityWithDataRepresentation:error:",  v27,  &v68));
  id v36 = v68;

  id v67 = v36;
  v54 = (void *)v29;
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[IDSNGMPublicDeviceIdentity identityWithIdentityData:prekeyData:error:]( &OBJC_CLASS___IDSNGMPublicDeviceIdentity,  "identityWithIdentityData:prekeyData:error:",  v29,  v30,  &v67));
  id v38 = v67;

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  id v66 = v51;
  LOWORD(v49) = 0;
  v42 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v37,  "sealMessage:authenticatedData:messageType:guid:sendingURI:sendingPushToken:receivingURI:receivingPus hToken:forceSizeOptimizations:resetState:encryptedAttributes:signedByFullIdentity:errors:",  v52,  v39,  0,  &stru_100912B50,  &stru_100912B50,  v40,  &stru_100912B50,  v41,  v49,  0,  v31,  &v66));
  id v50 = v66;

  id v65 = v38;
  v43 = (void *)objc_claimAutoreleasedReturnValue([v35 unsealMessage:v42 signedByPublicIdentity:v33 error:&v65]);
  id v44 = v65;

  v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utilities](&OBJC_CLASS___IDSFoundationLog, "utilities"));
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v80 = v52;
    __int16 v81 = 2112;
    uint64_t v82 = (uint64_t)v42;
    __int16 v83 = 2112;
    uint64_t v84 = (uint64_t)v43;
    _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "plain: %@, encryptedAgain: %@, decryptedAgain: %@",  buf,  0x20u);
  }

  v46 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v47 = (__CFDictionary *)v46;
  if (v52) {
    CFDictionarySetValue((CFMutableDictionaryRef)v46, @"plain", v52);
  }
  if (value) {
    CFDictionarySetValue(v47, @"encrypted", value);
  }
  if (v60) {
    CFDictionarySetValue(v47, @"decrypted", v60);
  }
  if (v42) {
    CFDictionarySetValue(v47, @"encryptedAgain", v42);
  }
  if (v43) {
    CFDictionarySetValue(v47, @"decryptedAgain", v43);
  }
  v59[2](v59, v47, v44);
}

- (void)clearCacheWithCompletion:(id)a3
{
  v3 = (void (**)(void))a3;
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utilities](&OBJC_CLASS___IDSFoundationLog, "utilities"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Asked by idstool to clear caches!", v6, 2u);
  }

  pid_t v5 = getpid();
  kill(v5, 30);
  v3[2](v3);
}

- (void)registeredIdentityTimestampsWithBlock:(id)a3
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[IDSDXPCInternalTesting _registeredIdentityTimestamps](self, "_registeredIdentityTimestamps"));
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)triggerKeyRollWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  unsigned __int8 v6 = [v5 forceRoll];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  [v7 setForceRoll:1];

  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = sub_1000D4ADC;
  v31 = sub_1000D4AEC;
  id v32 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDRegistrationListener sharedInstance](&OBJC_CLASS___IDSDRegistrationListener, "sharedInstance"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000D4AF4;
  v23[3] = &unk_1008F97F0;
  id v9 = v4;
  v23[4] = self;
  id v24 = v9;
  uint64_t v25 = &v27;
  unsigned __int8 v26 = v6;
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 addBlockForRegistrationCompletion:v23]);
  id v11 = (void *)v28[5];
  v28[5] = v10;

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance", 0LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 serviceWithIdentifier:@"com.apple.madrid"]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v12 accountsOnService:v14]);

  id v16 = [v15 countByEnumeratingWithState:&v19 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v20;
    do
    {
      v18 = 0LL;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)v18) registerAccount];
        v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v15 countByEnumeratingWithState:&v19 objects:v33 count:16];
    }

    while (v16);
  }

  _Block_object_dispose(&v27, 8);
}

- (void)setForceKeyRoll:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  unsigned __int8 v6 = (void (**)(void))a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  [v5 setForceRoll:v4];

  v6[2]();
}

- (void)currentECVersionWithBlock:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 identityDataSource]);
  (*((void (**)(id, id))a3 + 2))(v4, [v5 ngmVersion]);
}

- (void)setECVersion:(unsigned int)a3 withCompletion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = (void (**)(void))a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
  IMSetAppValueForKey(@"NGMVersionOverride", v5);

  v6[2]();
}

- (void)checkServerStorageForService:(id)a3 withCompletion:(id)a4
{
  id v7 = (void (**)(void))a4;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[IDSServerStorageStateMachine sharedInstance]( &OBJC_CLASS___IDSServerStorageStateMachine,  "sharedInstance"));
  [v6 incomingStorageRequestForTopic:v5 primary:0 messageContext:0];

  v7[2]();
}

- (void)tapToRadarWithTitle:(id)a3 message:(id)a4 context:(id)a5 completion:(id)a6
{
  id v9 = (void (**)(void))a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v14 = [[IDSTapToRadarRequest alloc] initWithTitle:v12 message:v11];

  id v13 = [[IDSTapToRadarContext alloc] initWithDictionary:v10];
  +[IDSTapToRadar launchWithRequest:context:](&OBJC_CLASS___IDSTapToRadar, "launchWithRequest:context:", v14, v13);
  v9[2](v9);
}

- (void)popupPromptWithTitle:(id)a3 message:(id)a4 defaultButton:(id)a5 defaultUrl:(id)a6 alternateButton:(id)a7 alternatrUrl:(id)a8 completion:(id)a9
{
  v15 = (void (**)(void))a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v22 = [[IDSPopupPrompt alloc] initWithTitle:v21 promptMessage:v20];

  [v22 launchPromptWithButton:v19 defaultUrl:v18 alternateButton:v17 alternateUrl:v16];
  v15[2](v15);
}

- (void)autoBugCaptureWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000D4F98;
  v4[3] = &unk_1008F9818;
  id v5 = a3;
  id v3 = v5;
  +[IDSAutoBugCapture triggerCaptureWithEvent:context:completion:]( &OBJC_CLASS___IDSAutoBugCapture,  "triggerCaptureWithEvent:context:completion:",  0LL,  @"IDSToolTrigger",  v4);
}

- (void)forceAccountRenewalOnService:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceWithPushTopic:v3]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 appleIDAccountOnService:v5]);

  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueID]);
    int v12 = 138412546;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Told to force renew account %@ on service %@",  (uint8_t *)&v12,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[IDSAppleIDRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSAppleIDRegistrationCenter,  "sharedInstance"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 registration]);
  [v10 authenticateRegistration:v11 forceRenewal:1 requireSilentAuth:0];
}

- (BOOL)hasEntitlementForPushReplay
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[IDSXPCConnection valueForEntitlement:]( self->_connection,  "valueForEntitlement:",  @"com.apple.private.ids.allow-push-replay"));
  if (v3
    && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    && ([v3 BOOLValue] & 1) != 0)
  {
    BOOL v5 = 1;
  }

  else
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog utilities](&OBJC_CLASS___IDSFoundationLog, "utilities"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Connection is missing entitlement for replaying pushes",  v8,  2u);
    }

    BOOL v5 = 0;
  }

  return v5;
}

- (void)sendFakePushFromFile:(id)a3 completion:(id)a4
{
  id v64 = a3;
  id v6 = (void (**)(id, NSMutableArray *))a4;
  if (CUTIsInternalInstall()
    && -[IDSDXPCInternalTesting hasEntitlementForPushReplay](self, "hasEntitlementForPushReplay"))
  {
    v61 = v6;
    id v7 = objc_alloc_init(&OBJC_CLASS___IDSDaemon);
    v8 = (IDSPushHandler *)objc_claimAutoreleasedReturnValue(-[IDSDaemon pushHandlerForAPSDelegatePort](v7, "pushHandlerForAPSDelegatePort"));

    if (!v8) {
      v8 = objc_alloc_init(&OBJC_CLASS___IDSPushHandler);
    }
    char v67 = 0;
    v63 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[NSMutableArray addObject:](v63, "addObject:", @"File(s) executed:");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v9 fileExistsAtPath:v64 isDirectory:&v67];

    if (v67)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v11 = (id)objc_claimAutoreleasedReturnValue([v10 enumeratorAtPath:v64]);

      uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 nextObject]);
      if (v12)
      {
        id v13 = (void *)v12;
        v60 = v8;
        id v62 = v11;
        do
        {
          if ([v13 hasSuffix:@".data"])
          {
            __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v64 stringByAppendingPathComponent:v13]);
            id v65 = 0LL;
            id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v14,  0LL,  &v65));
            id v16 = v65;
            if (v15)
            {
              id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v15,  0LL,  0LL,  0LL));
              if (v18)
              {
                uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString, v17);
                id v20 = sub_1000D56C8(v19, v18, @"t");
                uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
                if (v21)
                {
                  uint64_t v23 = (void *)v21;
                  uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSDictionary, v22);
                  id v25 = sub_1000D56C8(v24, v18, @"p");
                  unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

                  if (v26)
                  {
                    id v27 = objc_alloc(&OBJC_CLASS___APSIncomingMessage);
                    uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSString, v28);
                    id v30 = sub_1000D56C8(v29, v18, @"t");
                    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
                    uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSDictionary, v32);
                    id v34 = sub_1000D56C8(v33, v18, @"p");
                    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
                    id v36 = [v27 initWithTopic:v31 userInfo:v35];

                    -[IDSPushHandler connection:didReceiveIncomingMessage:]( v60,  "connection:didReceiveIncomingMessage:",  0LL,  v36);
                    -[NSMutableArray addObject:](v63, "addObject:", v14);
                  }

                  id v11 = v62;
                }

                else
                {
                  id v11 = v62;
                }
              }
            }

            else
            {
              id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ read error %@",  v64,  v16));
              -[NSMutableArray addObject:](v63, "addObject:", v18);
            }
          }

          uint64_t v37 = objc_claimAutoreleasedReturnValue([v11 nextObject]);

          id v13 = (void *)v37;
        }

        while (v37);
        v8 = v60;
        id v6 = v61;
      }
    }

    else
    {
      id v66 = 0LL;
      id v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v64,  0LL,  &v66));
      id v11 = v66;
      if (v38)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v38,  0LL,  0LL,  0LL));
        if (v40)
        {
          uint64_t v41 = objc_opt_class(&OBJC_CLASS___NSString, v39);
          id v42 = sub_1000D56C8(v41, v40, @"t");
          uint64_t v43 = objc_claimAutoreleasedReturnValue(v42);
          if (v43)
          {
            v45 = (void *)v43;
            id v46 = v11;
            uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSDictionary, v44);
            id v48 = sub_1000D56C8(v47, v40, @"p");
            uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(v48);

            if (v49)
            {
              id v50 = objc_alloc(&OBJC_CLASS___APSIncomingMessage);
              uint64_t v52 = objc_opt_class(&OBJC_CLASS___NSString, v51);
              id v53 = sub_1000D56C8(v52, v40, @"t");
              v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
              uint64_t v56 = objc_opt_class(&OBJC_CLASS___NSDictionary, v55);
              id v57 = sub_1000D56C8(v56, v40, @"p");
              v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
              id v59 = [v50 initWithTopic:v54 userInfo:v58];

              -[IDSPushHandler connection:didReceiveIncomingMessage:]( v8,  "connection:didReceiveIncomingMessage:",  0LL,  v59);
              -[NSMutableArray addObject:](v63, "addObject:", v64);
            }

            id v11 = v46;
          }
        }
      }

      else
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ read error %@",  v64,  v11));
        -[NSMutableArray addObject:](v63, "addObject:", v40);
      }
    }

    v6[2](v6, v63);
  }
}

- (void)toggleDisableDeviceUserToDisabled:(BOOL)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 registrationConductor]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 userStore]);

  [v5 reloadUsersForRealm:3];
}

- (void)postNewDeviceNotification:(id)a3 iCloudSignIn:(BOOL)a4 iMessageSignIn:(BOOL)a5 facetimeSignIn:(BOOL)a6 forAppleID:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v11 = a3;
  id v12 = a7;
  id v16 = v11;
  if (!v10)
  {
    if (!v9) {
      goto LABEL_3;
    }
LABEL_7:
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[IDSAppleIDNotificationCenter sharedInstance]( &OBJC_CLASS___IDSAppleIDNotificationCenter,  "sharedInstance"));
    [v15 addUsageNotificationForSession:@"Session Guid" appleID:v12 alias:@"foo2@apple.com" deviceName:@"Foo's New Device" hardwareVersion:v16 deviceCapabilities:0 serviceType:IDSRegistrationServiceTypeiMessage];

    if (!v8) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[IDSAppleIDNotificationCenter sharedInstance]( &OBJC_CLASS___IDSAppleIDNotificationCenter,  "sharedInstance"));
  [v14 addUsageNotificationForSession:@"Session Guid" appleID:v12 alias:@"foo2@apple.com" deviceName:@"Foo's New Device" hardwareVersion:v16 deviceCapabilities:0 serviceType:IDSRegistrationServiceTypeMultiplex1];

  if (v9) {
    goto LABEL_7;
  }
LABEL_3:
  if (v8)
  {
LABEL_4:
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[IDSAppleIDNotificationCenter sharedInstance]( &OBJC_CLASS___IDSAppleIDNotificationCenter,  "sharedInstance"));
    [v13 addUsageNotificationForSession:@"Session Guid" appleID:v12 alias:@"foo2@apple.com" deviceName:@"Foo's New Device" hardwareVersion:v16 deviceCapabilities:0 serviceType:IDSRegistrationServiceTypeFaceTime];
  }

- (id)transparentEndpointViewer
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 transparentEndpointViewer]);

  return v3;
}

- (void)fetchEndpointCacheStateForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCInternalTesting transparentEndpointViewer](self, "transparentEndpointViewer"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000D5A64;
  v16[3] = &unk_1008F9880;
  id v17 = v10;
  id v15 = v10;
  objc_msgSend( v14,  "internal_fetchEndpointCacheStateForServiceIdentifier:localURI:remoteURI:completion:",  v13,  v12,  v11,  v16);
}

- (void)fetchTransparentEndpointsForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 verifyAgainstTrustCircle:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCInternalTesting transparentEndpointViewer](self, "transparentEndpointViewer"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000D5FB4;
  v18[3] = &unk_1008F98A8;
  id v19 = v12;
  id v17 = v12;
  objc_msgSend( v16,  "internal_fetchTransparentEndpointsForServiceIdentifier:localURI:remoteURI:verifyAgainstTrustCircle:completion:",  v15,  v14,  v13,  v7,  v18);
}

- (void)kickVerificationForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCInternalTesting transparentEndpointViewer](self, "transparentEndpointViewer"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000D6268;
  v16[3] = &unk_1008F98D0;
  id v17 = v10;
  id v15 = v10;
  objc_msgSend(v14, "internal_kickVerificationForServiceIdentifier:localURI:remoteURI:completion:", v13, v12, v11, v16);
}

- (void)fetchVerifierKVSTrustedDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCInternalTesting transparentEndpointViewer](self, "transparentEndpointViewer"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000D6340;
  v7[3] = &unk_1008F97A0;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "internal_fetchVerifierKVSTrustedDevicesWithCompletion:", v7);
}

- (void)removeAllKVSTrustedDevices:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCInternalTesting transparentEndpointViewer](self, "transparentEndpointViewer"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000D63DC;
  v7[3] = &unk_1008F8148;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "internal_removeAllKVSTrustedDevices:", v7);
}

- (void)fetchCurrentDeviceKVSKey:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCInternalTesting transparentEndpointViewer](self, "transparentEndpointViewer"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000D6478;
  v7[3] = &unk_1008F98F8;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "internal_fetchCurrentDeviceKVSKey:", v7);
}

- (void)updateCurrentDeviceInKVS:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCInternalTesting transparentEndpointViewer](self, "transparentEndpointViewer"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000D6514;
  v7[3] = &unk_1008F9920;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "internal_updateCurrentDeviceInKVS:", v7);
}

- (void)triggerKTCDPAccountStatusNotificationWithAccountStatus:(int64_t)a3
{
  if ((unint64_t)a3 < 5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[IDSDXPCInternalTesting transparentEndpointViewer](self, "transparentEndpointViewer"));
    objc_msgSend(v6, "internal_triggerKTCDPAccountStatusNotificationWithAccountStatus:", a3);
  }

  else
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
      *(_DWORD *)buf = 138412290;
      id v8 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Inputed account status not valid, doing nothing. { accountStatus: %@ }",  buf,  0xCu);
    }
  }

- (void)nukeTransparencyStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCInternalTesting transparentEndpointViewer](self, "transparentEndpointViewer"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000D66BC;
  v7[3] = &unk_1008F98D0;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "internal_nukeTransparencyState:", v7);
}

- (void)fetchStoredUserDescriptions:(id)a3
{
  uint64_t v44 = (void (**)(id, id))a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 registrationConductor]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userStore]);

  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendString:](v6, "appendString:", @"Stored Users:\n");
  -[NSMutableString appendString:](v6, "appendString:", @"   DS Realm:\n");
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v5 usersWithRealm:1]);
  id v8 = [v7 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v58;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v58 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 propertiesForUser:v12]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 description]);
        -[NSMutableString appendFormat:](v6, "appendFormat:", @"      %@\n", v14);

        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 description]);
        -[NSMutableString appendFormat:](v6, "appendFormat:", @"         %@\n", v15);
      }

      id v9 = [v7 countByEnumeratingWithState:&v57 objects:v64 count:16];
    }

    while (v9);
  }

  -[NSMutableString appendString:](v6, "appendString:", @"   Phone Realm:\n");
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 usersWithRealm:0]);
  id v17 = [v16 countByEnumeratingWithState:&v53 objects:v63 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v54;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v54 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)j);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v5 propertiesForUser:v21]);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 description]);
        -[NSMutableString appendFormat:](v6, "appendFormat:", @"      %@\n", v23);

        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v22 description]);
        -[NSMutableString appendFormat:](v6, "appendFormat:", @"         %@\n", v24);
      }

      id v18 = [v16 countByEnumeratingWithState:&v53 objects:v63 count:16];
    }

    while (v18);
  }

  -[NSMutableString appendString:](v6, "appendString:", @"   Transient Phone Realm:\n");
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v5 usersWithRealm:2]);
  id v26 = [v25 countByEnumeratingWithState:&v49 objects:v62 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v50;
    do
    {
      for (k = 0LL; k != v27; k = (char *)k + 1)
      {
        if (*(void *)v50 != v28) {
          objc_enumerationMutation(v25);
        }
        id v30 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)k);
        v31 = (void *)objc_claimAutoreleasedReturnValue([v5 propertiesForUser:v30]);
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v30 description]);
        -[NSMutableString appendFormat:](v6, "appendFormat:", @"      %@\n", v32);

        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v31 description]);
        -[NSMutableString appendFormat:](v6, "appendFormat:", @"         %@\n", v33);
      }

      id v27 = [v25 countByEnumeratingWithState:&v49 objects:v62 count:16];
    }

    while (v27);
  }

  -[NSMutableString appendString:](v6, "appendString:", @"   Device Realm:\n");
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v5 usersWithRealm:3]);
  id v35 = [v34 countByEnumeratingWithState:&v45 objects:v61 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v46;
    do
    {
      for (m = 0LL; m != v36; m = (char *)m + 1)
      {
        if (*(void *)v46 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)m);
        v40 = (void *)objc_claimAutoreleasedReturnValue([v5 propertiesForUser:v39]);
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v39 description]);
        -[NSMutableString appendFormat:](v6, "appendFormat:", @"      %@\n", v41);

        id v42 = (void *)objc_claimAutoreleasedReturnValue([v40 description]);
        -[NSMutableString appendFormat:](v6, "appendFormat:", @"         %@\n", v42);
      }

      id v36 = [v34 countByEnumeratingWithState:&v45 objects:v61 count:16];
    }

    while (v36);
  }

  id v43 = -[NSMutableString copy](v6, "copy");
  v44[2](v44, v43);
}

- (void)fetchPrivateClientDataDescriptionForService:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationController sharedInstance](&OBJC_CLASS___IDSRegistrationController, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeRegistrationsToRegister]);
  id v9 = [v8 _copyForEnumerating];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[IDSKeyTransparencyVerifier sharedInstance]( &OBJC_CLASS___IDSKeyTransparencyVerifier,  "sharedInstance"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[IDSClientDataGenerator clientDatasForRegistrations:keyStore:keyTransparencyVerifier:]( &OBJC_CLASS___IDSClientDataGenerator,  "clientDatasForRegistrations:keyStore:keyTransparencyVerifier:",  v9,  v10,  v11));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000D6D6C;
  v15[3] = &unk_1008F9970;
  id v16 = v5;
  id v17 = v6;
  id v13 = v5;
  id v14 = v6;
  [v12 registerResultBlock:v15];
}

- (void)fetchPrivateDeviceDataDescription:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 privateDeviceDataForKVSSuccess:0]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 debugDescription]);
  v3[2](v3, v5);
}

- (void)clearCacheAndUpdatePeersForService:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[IDSKeyTransparencyVerifier sharedInstance](&OBJC_CLASS___IDSKeyTransparencyVerifier, "sharedInstance"));
  [v4 clearCacheAndUpdatePeersForService:v3];
}

- (void)removeConnectionWithConnectionName:(id)a3 completionHandler:(id)a4
{
  id v5 = (void (**)(id, void))a4;
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pairedDeviceUniqueID]);

  v11[0] = IDSOpenSocketOptionCBUUIDKey;
  v11[1] = IDSOpenSocketOptionDeviceUniqueIDKey;
  v11[2] = @"account";
  v11[3] = @"service";
  v12[2] = @"idstest";
  v12[3] = @"localdelivery";
  v12[0] = @"12345678-7654-DADA-DADA-DADADADADADA";
  v12[1] = v8;
  v11[4] = IDSOpenSocketOptionStreamNameKey;
  v12[4] = v6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  5LL));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));

  [v10 closeSocketWithOptions:v9];
  v5[2](v5, 0LL);
}

- (void)deviceChangedForDeviceID:(id)a3 isNearby:(BOOL)a4 isConnected:(BOOL)a5 isCloudConnected:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v10 = a3;
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v9) {
      id v12 = @"YES";
    }
    else {
      id v12 = @"NO";
    }
    int v26 = 138412546;
    id v27 = v12;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received nearby change to %@ for device with uniqueID %@",  (uint8_t *)&v26,  0x16u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDevicePropertiesStateNotifier sharedInstance]( &OBJC_CLASS___IDSDevicePropertiesStateNotifier,  "sharedInstance"));
  id v14 = v13;
  if (v9) {
    uint64_t v15 = kIDSDeviceStatePropertiesIsNearby;
  }
  else {
    uint64_t v15 = 0LL;
  }
  [v13 setState:v15 forProperty:kIDSDeviceStatePropertiesIsNearby deviceUniqueID:v10];

  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      id v17 = @"YES";
    }
    else {
      id v17 = @"NO";
    }
    int v26 = 138412546;
    id v27 = v17;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Received connected change to %@ for device with uniqueID %@",  (uint8_t *)&v26,  0x16u);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDevicePropertiesStateNotifier sharedInstance]( &OBJC_CLASS___IDSDevicePropertiesStateNotifier,  "sharedInstance"));
  uint64_t v19 = v18;
  if (v8) {
    uint64_t v20 = kIDSDeviceStatePropertiesIsConnected;
  }
  else {
    uint64_t v20 = 0LL;
  }
  [v18 setState:v20 forProperty:kIDSDeviceStatePropertiesIsConnected deviceUniqueID:v10];

  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      uint64_t v22 = @"YES";
    }
    else {
      uint64_t v22 = @"NO";
    }
    int v26 = 138412546;
    id v27 = v22;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Received cloud connected change to %@ for device with uniqueID %@",  (uint8_t *)&v26,  0x16u);
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDevicePropertiesStateNotifier sharedInstance]( &OBJC_CLASS___IDSDevicePropertiesStateNotifier,  "sharedInstance"));
  uint64_t v24 = v23;
  if (v7) {
    uint64_t v25 = kIDSDeviceStatePropertiesIsCloudConnected;
  }
  else {
    uint64_t v25 = 0LL;
  }
  [v23 setState:v25 forProperty:kIDSDeviceStatePropertiesIsCloudConnected deviceUniqueID:v10];
}

- (void)assertTransportThreadRealTimeMode:(BOOL)a3 completionHandler:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000D7540;
  v6[3] = &unk_1008F9990;
  BOOL v7 = a3;
  id v4 = (void (**)(id, void))a4;
  IDSTransportThreadAddBlock(v6, v5);
  v4[2](v4, 0LL);
}

- (id)_registeredIdentityTimestamps
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 config]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 registeredIdentityContainer]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 ngmFullDeviceIdentity]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKeyPath:@"devicePrekeys.publicPrekey.timestamp"]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "__imArrayByApplyingBlock:", &stru_1008F99B0));

  return v7;
}

- (void)triggerFirewallDBCleanupWithInterval:(double)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[IDSFirewallStore sharedInstance](&OBJC_CLASS___IDSFirewallStore, "sharedInstance"));
  [v4 runCleanupWithExpirationInterval:a3];
}

- (void)triggerAllFirewallNotificationsWithHandle:(id)a3 delay:(double)a4 service:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  id v10 = v9;
  if (v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceWithIdentifier:v8]);

    if (v11)
    {
      __int16 v28 = v11;
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
    }

    else
    {
      id v12 = 0LL;
    }
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 allServices]);
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v24;
    double v17 = 0.0;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        if ([v19 isFirewallEnabled])
        {
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472LL;
          v20[2] = sub_1000D7874;
          v20[3] = &unk_1008F5F80;
          id v21 = v7;
          uint64_t v22 = v19;
          im_dispatch_after_primary_queue(v20, v17);
          double v17 = v17 + a4;
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v15);
  }
}

- (void)triggerAllTemporaryPhoneNotificationsWithHandle:(id)a3 delay:(double)a4
{
  id v5 = a3;
  id v6 = -[IDSPhoneUser initWithLabelID:phoneBookNumber:]( objc_alloc(&OBJC_CLASS___IDSPhoneUser),  "initWithLabelID:phoneBookNumber:",  @"AAA",  v5);

  id v7 = -[IDSTemporaryPhoneUser initWithPhoneUser:]( objc_alloc(&OBJC_CLASS___IDSTemporaryPhoneUser),  "initWithPhoneUser:",  v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[IDSTemporaryPhoneUser temporaryPhoneUserWithFinishedRegistration]( v7,  "temporaryPhoneUserWithFinishedRegistration"));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000D7A64;
  v16[3] = &unk_1008F6010;
  id v9 = v8;
  id v17 = v9;
  im_dispatch_after_primary_queue(v16, 0.0);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000D7A78;
  v14[3] = &unk_1008F6010;
  id v10 = v9;
  id v15 = v10;
  im_dispatch_after_primary_queue(v14, a4 + 0.0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000D7A8C;
  v12[3] = &unk_1008F6010;
  id v13 = v10;
  id v11 = v10;
  im_dispatch_after_primary_queue(v12, a4 + 0.0 + a4);
}

- (void)triggerRestrictedMessageCleanup
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  [v2 _restrictedMessageCleanupTimerFired];
}

- (void)sendSenderKeyToURI:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceWithIdentifier:IDSServiceNameiMessage]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 registeredAccountsOnService:v9]);

  id v23 = v6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[IDSQueryUtilities accountToQueryFrom:fromURI:destinationURIs:allowLocalAccount:]( &OBJC_CLASS___IDSQueryUtilities,  "accountToQueryFrom:fromURI:destinationURIs:allowLocalAccount:",  v10,  0LL,  v11,  0LL));

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 senderKeyDistributionManager]);

  id v22 = v6;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 loginID]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithUnprefixedURI:](&OBJC_CLASS___IDSURI, "URIWithUnprefixedURI:", v16));
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSenderKeySendContext idstool]( &OBJC_CLASS____TtC17identityservicesd23IDSSenderKeySendContext,  "idstool"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000D7D00;
  v20[3] = &unk_1008F99D8;
  id v21 = v5;
  id v19 = v5;
  [v14 generateAndSendKeyIfNeededToURIs:v15 fromURI:v17 context:v18 completion:v20];
}

- (void)listSenderKeysForURIs:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v7 senderKeyDistributionManager]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 formattedSenderKeyListFor:v6]);
  v5[2](v5, v8);
}

- (void)clearAllSenderKeysWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 persistenceManager]);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000D7E4C;
  v7[3] = &unk_1008F99D8;
  id v8 = v3;
  id v6 = v3;
  [v5 deleteAllSenderKeysWithCompletion:v7];
}

- (void)listDonatedHandlesWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 senderKeyDistributionManager]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 formattedDonatedHandleList]);
  v3[2](v3, v5);
}

- (void)setOffGridMode:(int64_t)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[IDSDXPCInternalTesting offGridStateManager](self, "offGridStateManager"));
  [v10 setOffGridMode:a3 allowOnlineEnablement:1 options:v9 completion:v8];
}

- (void)listRegistrationHistoryWithBAADigests:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[IDSRegistrationRequestTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationRequestTracker,  "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 eventHistoryStringWithWantsBAADigests:v5]);
  (*((void (**)(id, void *))a4 + 2))(v6, v7);
}

- (void)idsProtocolVersion:(id)a3
{
  id v3 = (void (**)(id, id, id))a3;
  uint64_t v4 = _IDSIDProtocolVersionNumber();
  id v7 = (id)objc_claimAutoreleasedReturnValue(v4);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  id v6 = [v5 forceReregValue];

  v3[2](v3, v7, v6);
}

- (void)fetchXPCStateDescriptionForProcesses:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  id v14 = sub_1000D8138;
  id v15 = &unk_1008F9A00;
  id v16 = v5;
  id v17 = v7;
  id v9 = v7;
  id v10 = v5;
  [v8 _iterateOverConnectedListeners:&v12];

  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray componentsJoinedByString:]( v9,  "componentsJoinedByString:",  @"\n",  v12,  v13,  v14,  v15));
  v6[2](v6, v11);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IDSXPCConnection)connection
{
  return self->_connection;
}

- (IDSDXPCOffGridStateManager)offGridStateManager
{
  return self->_offGridStateManager;
}

- (void).cxx_destruct
{
}

@end