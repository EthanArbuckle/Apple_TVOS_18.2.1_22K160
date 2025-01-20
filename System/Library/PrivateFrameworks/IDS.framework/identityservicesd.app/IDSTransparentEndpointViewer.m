@interface IDSTransparentEndpointViewer
- (id)_cloudKitContainer;
- (id)_keyTransparencyEntriesForEndpoints:(id)a3;
- (id)_peerIDManager;
- (id)_registrationKeyManager;
- (id)_verifier;
- (void)internal_fetchCurrentDeviceKVSKey:(id)a3;
- (void)internal_fetchEndpointCacheStateForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 completion:(id)a6;
- (void)internal_fetchTransparentEndpointsForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 verifyAgainstTrustCircle:(BOOL)a6 completion:(id)a7;
- (void)internal_fetchVerifierKVSTrustedDevicesWithCompletion:(id)a3;
- (void)internal_kickVerificationForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 completion:(id)a6;
- (void)internal_nukeTransparencyState:(id)a3;
- (void)internal_removeAllKVSTrustedDevices:(id)a3;
- (void)internal_triggerKTCDPAccountStatusNotificationWithAccountStatus:(int64_t)a3;
- (void)internal_updateCurrentDeviceInKVS:(id)a3;
@end

@implementation IDSTransparentEndpointViewer

- (id)_verifier
{
  return +[IDSKeyTransparencyVerifier sharedInstance](&OBJC_CLASS___IDSKeyTransparencyVerifier, "sharedInstance");
}

- (id)_cloudKitContainer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransparentEndpointViewer _verifier](self, "_verifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 keyTransparencyStore]);

  return v3;
}

- (id)_registrationKeyManager
{
  return +[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance");
}

- (id)_peerIDManager
{
  return +[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance");
}

- (id)_keyTransparencyEntriesForEndpoints:(id)a3
{
  return objc_msgSend(a3, "__imArrayByApplyingBlock:", &stru_100903CE0);
}

- (void)internal_fetchEndpointCacheStateForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 completion:(id)a6
{
  v10 = (void (**)(id, void *, void *, void))a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v19 = -[IDSPeerIDKey initWithService:fromURI:toURI:]( objc_alloc(&OBJC_CLASS___IDSPeerIDKey),  "initWithService:fromURI:toURI:",  v13,  v12,  v11);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransparentEndpointViewer _peerIDManager](self, "_peerIDManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 pleaseDontCopyCacheDictionaryRepresentation]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v19]);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 keyTransparencyContext]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v16 endpoints]);
  v10[2](v10, v17, v18, 0LL);
}

- (void)internal_fetchTransparentEndpointsForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 verifyAgainstTrustCircle:(BOOL)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = -[IDSPeerIDKey initWithService:fromURI:toURI:]( objc_alloc(&OBJC_CLASS___IDSPeerIDKey),  "initWithService:fromURI:toURI:",  v14,  v13,  v12);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransparentEndpointViewer _peerIDManager](self, "_peerIDManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 pleaseDontCopyCacheDictionaryRepresentation]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v15]);

  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 keyTransparencyContext]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 ticket]);

  v21 = objc_alloc(&OBJC_CLASS___IDSKeyTransparencyIndex);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v18 keyTransparencyContext]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 accountKey]);
  v24 = -[IDSKeyTransparencyIndex initWithServiceIdentifier:accountKey:URI:]( v21,  "initWithServiceIdentifier:accountKey:URI:",  v14,  v23,  v12);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransparentEndpointViewer _verifier](self, "_verifier"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 currentPeerVerificationResultsForQueriedIndex:v24 ticket:v20]);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1003B707C;
  v28[3] = &unk_1008F8760;
  id v29 = v11;
  id v27 = v11;
  [v26 registerResultBlock:v28];
}

- (void)internal_kickVerificationForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 serviceWithIdentifier:v10]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v14 appleIDAccountOnService:v16]);

  v18 = -[IDSPeerIDQueryContext initWithSending:refresh:messaging:resultExpected:preventNewQuery:]( objc_alloc(&OBJC_CLASS___IDSPeerIDQueryContext),  "initWithSending:refresh:messaging:resultExpected:preventNewQuery:",  0LL,  1LL,  0LL,  0LL,  0LL);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Performing query for forced verification.",  buf,  2u);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
  id v34 = v12;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v17 _registrationCert]);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1003B738C;
  v27[3] = &unk_100903D08;
  id v28 = v10;
  id v29 = v11;
  id v30 = v12;
  v31 = self;
  id v32 = v13;
  id v23 = v13;
  id v24 = v12;
  id v25 = v11;
  id v26 = v10;
  [v20 startQueryForURIs:v21 fromIdentity:v22 fromURI:v25 fromService:v26 context:v18 reason:@"KTKickVerification" completionBlock:v27];
}

- (void)internal_fetchVerifierKVSTrustedDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransparentEndpointViewer _verifier](self, "_verifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 forceSyncKVS]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003B7674;
  v8[3] = &unk_1008FA860;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 registerResultBlock:v8];
}

- (void)internal_removeAllKVSTrustedDevices:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransparentEndpointViewer _verifier](self, "_verifier"));
  [v5 removeAllKVSEntries];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransparentEndpointViewer _verifier](self, "_verifier"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 forceSyncKVS]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1003B77CC;
  v9[3] = &unk_1008F8760;
  id v10 = v4;
  id v8 = v4;
  [v7 registerResultBlock:v9];
}

- (void)internal_fetchCurrentDeviceKVSKey:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransparentEndpointViewer _verifier](self, "_verifier"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003B78D0;
  v7[3] = &unk_1008F98F8;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchCurrentDeviceKVSKey:v7];
}

- (void)internal_updateCurrentDeviceInKVS:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransparentEndpointViewer _verifier](self, "_verifier"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003B7AD4;
  v7[3] = &unk_1008F9920;
  id v8 = v4;
  id v6 = v4;
  [v5 updateCurrentDeviceInKVS:v7];
}

- (void)internal_nukeTransparencyState:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransparentEndpointViewer _verifier](self, "_verifier"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003B7D50;
  v7[3] = &unk_1008F98D0;
  id v8 = v4;
  id v6 = v4;
  [v5 nukeKeyTransparencyStateWithCompletion:v7];
}

- (void)internal_triggerKTCDPAccountStatusNotificationWithAccountStatus:(int64_t)a3
{
  v5 = objc_alloc(&OBJC_CLASS___NSNotification);
  id v10 = @"accountStatus";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v11 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  id v8 = -[NSNotification initWithName:object:userInfo:]( v5,  "initWithName:object:userInfo:",  @"TransparencyAccountStatusChanged",  0LL,  v7);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTransparentEndpointViewer _verifier](self, "_verifier"));
  [v9 _handleKTCDPStatusUpdate:v8];
}

@end