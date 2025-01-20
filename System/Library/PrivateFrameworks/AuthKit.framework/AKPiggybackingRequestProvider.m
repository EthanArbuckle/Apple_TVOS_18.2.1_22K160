@interface AKPiggybackingRequestProvider
- (AKPiggybackingRequestProvider)initWithCircleContext:(id)a3;
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (id)authKitBody;
@end

@implementation AKPiggybackingRequestProvider

- (AKPiggybackingRequestProvider)initWithCircleContext:(id)a3
{
  id v5 = a3;
  v6 = -[AKURLRequestProviderImpl initWithUrlBagKey:](self, "initWithUrlBagKey:", AKURLBagKeyCircle);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_circleContext, a3);
  }

  return v7;
}

- (id)authKitBody
{
  id v3 = [&__NSDictionary0__struct mutableCopy];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext payload](self->_circleContext, "payload"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 clientInfo]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 base64EncodedStringWithOptions:0]);

  if (v6)
  {
    [v3 setObject:v6 forKeyedSubscript:AKPakeDataKey];
  }

  else
  {
    uint64_t v8 = _AKLogSystem(v7);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v40 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Missing client info for circle request",  v40,  2u);
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext payload](self->_circleContext, "payload"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 presenceSID]);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 lowercaseString]);
    [v3 setObject:v13 forKeyedSubscript:AKPresenceSIDKey];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext payload](self->_circleContext, "payload"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 presenceCheckPassed]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ak_BOOLeanAsInteger"));
  [v3 setObject:v16 forKeyedSubscript:AKPresenceApprovedKey];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext payload](self->_circleContext, "payload"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 localPresenceFound]);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ak_BOOLeanAsInteger"));
  [v3 setObject:v19 forKeyedSubscript:AKPresenceFoundKey];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext pushToken](self->_circleContext, "pushToken"));
  if (v20)
  {
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext pushToken](self->_circleContext, "pushToken"));
    [v3 setObject:v22 forKeyedSubscript:@"ptkn"];
  }

  else
  {
    uint64_t v23 = _AKLogSystem(v21);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10012B634(v22);
    }
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext payload](self->_circleContext, "payload"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 serverInfo]);

  if (v25) {
    [v3 setObject:v25 forKeyedSubscript:AKIdmsDataKey];
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext payload](self->_circleContext, "payload"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 transactionId]);

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext payload](self->_circleContext, "payload"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 transactionId]);
    [v3 setObject:v29 forKeyedSubscript:AKTransactionId];
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext payload](self->_circleContext, "payload"));
  id v31 = [v30 clientErrorCode];

  if (v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext payload](self->_circleContext, "payload"));
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v32 clientErrorCode]));
    [v3 setObject:v33 forKeyedSubscript:AKErrorStatusCodeKey];
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext payload](self->_circleContext, "payload"));
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v34 circleStep]));
  [v3 setObject:v35 forKeyedSubscript:AKCircleStepKey];

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext payload](self->_circleContext, "payload"));
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v36 piggybackingContext]));
  [v3 setObject:v37 forKeyedSubscript:AKPiggybackingContextKey];

  id v38 = [v3 copy];
  return v38;
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc(&OBJC_CLASS___AKAppleIDServerResourceLoadDelegate);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext payload](self->_circleContext, "payload"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 altDSID]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext identityTokenValue](self->_circleContext, "identityTokenValue"));
  v10 = -[AKAppleIDServerResourceLoadDelegate initWithAltDSID:identityToken:]( v6,  "initWithAltDSID:identityToken:",  v8,  v9);

  -[AKAppleIDServerResourceLoadDelegate setBagUrlKey:](v10, "setBagUrlKey:", AKURLBagKeyCircle);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext heartbeatTokenValue](self->_circleContext, "heartbeatTokenValue"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext heartbeatTokenValue](self->_circleContext, "heartbeatTokenValue"));
    -[AKAppleIDServerResourceLoadDelegate setHeartbeatToken:](v10, "setHeartbeatToken:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    if (v13)
    {
      v14 = -[AKClient initWithConnection:](objc_alloc(&OBJC_CLASS___AKClient), "initWithConnection:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient name](v14, "name"));
      -[AKAppleIDServerResourceLoadDelegate setClientAppName:](v10, "setClientAppName:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient bundleID](v14, "bundleID"));
      -[AKAppleIDServerResourceLoadDelegate setClientBundleID:](v10, "setClientBundleID:", v16);
    }
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext payload](self->_circleContext, "payload"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 altDSID]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v17 authKitAccountWithAltDSID:v19 error:0]);

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  LODWORD(v18) = [v21 accountAccessTelemetryOptInForAccount:v20];

  if ((_DWORD)v18)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext authContext](self->_circleContext, "authContext"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 telemetryFlowID]);
    -[AKAppleIDServerResourceLoadDelegate setTelemetryFlowID:](v10, "setTelemetryFlowID:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[AKCircleRequestContext authContext](self->_circleContext, "authContext"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 telemetryDeviceSessionID]);
    -[AKAppleIDServerResourceLoadDelegate setTelemetryDeviceSessionID:](v10, "setTelemetryDeviceSessionID:", v25);
  }

  -[AKAppleIDServerResourceLoadDelegate decorateWithCircleRequestContext:]( v10,  "decorateWithCircleRequestContext:",  self->_circleContext);
  -[AKAppleIDServerResourceLoadDelegate signRequestWithCommonHeaders:](v10, "signRequestWithCommonHeaders:", v5);

  return 1;
}

- (void).cxx_destruct
{
}

@end