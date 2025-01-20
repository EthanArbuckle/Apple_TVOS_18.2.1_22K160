@interface AKPCSAuthPushHandler
- (AKPCSAuthPushHandler)initWithAccountManager:(id)a3 webSessionPCSKeyProvider:(id)a4;
- (BOOL)_isPrimaryAccountAltDSID:(id)a3;
- (double)_safeTTL:(double)a3;
- (id)_teardownPayloadWithPushMessage:(id)a3 isArmed:(BOOL)a4;
- (void)armDeviceWithPCSAuthorizationContextForMessage:(id)a3 completion:(id)a4;
@end

@implementation AKPCSAuthPushHandler

- (AKPCSAuthPushHandler)initWithAccountManager:(id)a3 webSessionPCSKeyProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AKPCSAuthPushHandler;
  v9 = -[AKPCSAuthPushHandler init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeStrong((id *)&v10->_webSessionKeyProvider, a4);
  }

  return v10;
}

- (void)armDeviceWithPCSAuthorizationContextForMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 webSessionUUID]);
  if (!v8
    || (v9 = (void *)v8,
        v10 = (void *)objc_claimAutoreleasedReturnValue([v6 timestamp]),
        v10,
        v9,
        !v10))
  {
    uint64_t v28 = _AKLogSystem(v8);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Incoming push does not contain walrus web access info, abandoning device arming",  buf,  2u);
    }

    goto LABEL_11;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
  unsigned __int8 v12 = -[AKPCSAuthPushHandler _isPrimaryAccountAltDSID:](self, "_isPrimaryAccountAltDSID:", v11);

  if ((v12 & 1) == 0)
  {
    uint64_t v30 = _AKLogSystem(v13);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1001387E8(v29);
    }
LABEL_11:

    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    goto LABEL_12;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 ttlInMinutes]);
  [v14 doubleValue];
  -[AKPCSAuthPushHandler _safeTTL:](self, "_safeTTL:", v15 * 60.0);
  double v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", v17));
  id v19 = objc_alloc(&OBJC_CLASS___AKPCSAuthContext);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v6 webSessionUUID]);
  id v21 = [v19 initWithWebSessionIdentifier:v20 expiryDate:v18 userInfo:0];

  uint64_t v23 = _AKLogSystem(v22);
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v21 description]);
    *(_DWORD *)buf = 138412290;
    v37 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Begin arming device with context %@.",  buf,  0xCu);
  }

  webSessionKeyProvider = self->_webSessionKeyProvider;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000736F8;
  v31[3] = &unk_1001C94C8;
  id v32 = v21;
  id v35 = v7;
  v33 = self;
  id v34 = v6;
  id v27 = v21;
  -[AKWebSessionPCSKeyProvider saveContext:completion:](webSessionKeyProvider, "saveContext:completion:", v27, v31);

LABEL_12:
}

- (BOOL)_isPrimaryAccountAltDSID:(id)a3
{
  accountManager = self->_accountManager;
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager altDSIDforPrimaryiCloudAccount](accountManager, "altDSIDforPrimaryiCloudAccount"));
  unsigned __int8 v6 = [v5 isEqualToString:v4];

  return v6;
}

- (id)_teardownPayloadWithPushMessage:(id)a3 isArmed:(BOOL)a4
{
  BOOL v4 = a4;
  v14[0] = @"idmsdata";
  id v5 = a3;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 idmsData]);
  v15[0] = v6;
  v14[1] = @"srdwa";
  v12[0] = @"wscUUID";
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 webSessionUUID]);

  v13[0] = v7;
  v12[1] = @"PCSKeysArmedEligible";
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  v13[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL));
  v15[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));

  return v10;
}

- (double)_safeTTL:(double)a3
{
  double v4 = 3600.0;
  if (a3 <= 3600.0) {
    return a3;
  }
  uint64_t v5 = _AKLogSystem(self);
  unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    double v9 = a3;
    __int16 v10 = 2048;
    uint64_t v11 = 0x40AC200000000000LL;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Requested PCS auth TTL [%f] over max [%f]",  (uint8_t *)&v8,  0x16u);
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end