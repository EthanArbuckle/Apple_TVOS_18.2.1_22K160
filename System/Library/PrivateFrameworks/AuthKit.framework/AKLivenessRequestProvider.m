@interface AKLivenessRequestProvider
- (AKFollowUpProvider)followUpProvider;
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (NSString)event;
- (NSString)pushToken;
- (id)authKitBody;
- (id)requestURLOverride;
- (unint64_t)livenessReason;
- (void)_updateTelemtryOptInForAccount:(id)a3 withWalrusStatus:(unint64_t)a4;
- (void)addMDMInformationIfNecessaryToRequest:(id)a3;
- (void)setEvent:(id)a3;
- (void)setFollowUpProvider:(id)a3;
- (void)setLivenessReason:(unint64_t)a3;
- (void)setPushToken:(id)a3;
@end

@implementation AKLivenessRequestProvider

- (id)requestURLOverride
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 altDSID]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 urlAtKey:v6]);

  return v7;
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AKLivenessRequestProvider;
  BOOL v7 = -[AKGrandSlamRequestProvider signRequest:error:](&v9, "signRequest:error:", v6, a4);
  if (v7) {
    -[AKLivenessRequestProvider addMDMInformationIfNecessaryToRequest:]( self,  "addMDMInformationIfNecessaryToRequest:",  v6);
  }

  return v7;
}

- (void)addMDMInformationIfNecessaryToRequest:(id)a3
{
  id v4 = a3;
  if (+[AKFeatureManager isEnforceMDMPolicyEnabled]( &OBJC_CLASS___AKFeatureManager,  "isEnforceMDMPolicyEnabled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKLivenessRequestProvider event](self, "event"));
    if ([v5 isEqualToString:AKPostDataEventLiveness])
    {
    }

    else
    {
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKLivenessRequestProvider event](self, "event"));
      unsigned int v8 = [v7 isEqualToString:AKPostDataEventUpdateDeviceState];

      if (!v8) {
        goto LABEL_12;
      }
    }

    uint64_t v9 = _AKLogSystem(v6);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "E+E: Checking if we need to gather MDM information",  v22,  2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl accountManager](self, "accountManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl context](self, "context"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 altDSID]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v11 authKitAccountWithAltDSID:v13 error:0]);

    v15 = objc_alloc_init(&OBJC_CLASS___AKMDMInformationProvider);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl accountManager](self, "accountManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue( -[AKMDMInformationProvider fetchMDMInformationIfNecessaryForAccount:accountManager:]( v15,  "fetchMDMInformationIfNecessaryForAccount:accountManager:",  v14,  v16));

    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 deviceManagedState]);
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v17 deviceManagedState]);
      objc_msgSend(v4, "ak_addHeaderForDeviceManagementState:", v19);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v17 organizationToken]);

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v17 organizationToken]);
      objc_msgSend(v4, "ak_addHeaderForMDMOrganizationToken:", v21);
    }
  }

- (id)authKitBody
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", &off_1001D8F08, @"ut");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKLivenessRequestProvider event](self, "event"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v5, @"event");

  uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 serialNumber]);
  if (v6) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, @"sn");
  }
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v3 internationalMobileEquipmentIdentity]);
  if (v7) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v7, @"imei");
  }
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 internationalMobileEquipmentIdentity2]);
  if (v8) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v8, @"imei2");
  }
  v180 = (void *)v6;
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v3 userChosenName]);
  if (v9) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v9, @"dn");
  }
  v191 = (void *)v9;
  v179 = (void *)v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKLivenessRequestProvider pushToken](self, "pushToken"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKLivenessRequestProvider pushToken](self, "pushToken"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v11,  AKRequestBodyPushTokenKey);
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKLivenessRequestProvider event](self, "event"));
    unsigned int v13 = [v12 isEqualToString:AKPostDataEventLiveness];

    if (v13)
    {
      uint64_t v15 = _AKLogSystem(v14);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100140614();
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"noptkn");
    }
  }

  uint64_t v17 = objc_claimAutoreleasedReturnValue([v3 mobileEquipmentIdentifier]);
  if (v17) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v17, @"meid");
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue([v3 integratedCircuitCardIdentifier]);
  if (v18) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v18, @"iccid");
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue([v3 color]);
  if (v19) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v19, @"dc");
  }
  uint64_t v20 = objc_claimAutoreleasedReturnValue([v3 enclosureColor]);
  if (v20) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v20, @"dec");
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue([v3 coverGlassColor]);
  v188 = v21;
  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 stringValue]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v22, @"clcg");
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v3 housingColor]);
  v187 = v23;
  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 stringValue]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v24, @"clhs");
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v3 backingColor]);
  v186 = v25;
  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 stringValue]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v26, @"clbg");
  }

  uint64_t v27 = objc_claimAutoreleasedReturnValue([v3 modelNumber]);
  if (v27) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v27, @"prtn");
  }
  v185 = (void *)v27;
  uint64_t v28 = objc_claimAutoreleasedReturnValue([v3 phoneNumber]);
  if (v28) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v28, @"pn");
  }
  v184 = (void *)v28;
  v189 = (void *)v20;
  v190 = (void *)v17;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  uint64_t v30 = objc_claimAutoreleasedReturnValue([v29 localeIdentifier]);

  if (v30) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v30, @"loc");
  }
  v183 = (void *)v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 primaryAuthKitAccount]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v31 passkeysInKeychainCountForAccount:v33]);

  if (v34)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 stringValue]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v35, @"pkc");
  }

  v182 = v34;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  id v37 = [v36 isProtectedWithPasscode];

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v37));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v38, AKPasscodeIndicatorKey);

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[AKCarrierBundleUtilities sharedInstance](&OBJC_CLASS___AKCarrierBundleUtilities, "sharedInstance"));
  id v198 = 0LL;
  uint64_t v40 = objc_claimAutoreleasedReturnValue([v39 phoneBundleInfoWithAdditionalInfo:0 error:&v198]);
  id v193 = v198;

  v192 = (void *)v8;
  v181 = (void *)v40;
  if (v40)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v40, @"phones");
  }

  else
  {
    uint64_t v42 = _AKLogSystem(v41);
    v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      sub_1001405B4();
    }
  }

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl context](self, "context"));
  v46 = (void *)objc_claimAutoreleasedReturnValue([v45 altDSID]);
  v47 = (void *)objc_claimAutoreleasedReturnValue([v44 authKitAccountWithAltDSID:v46 error:0]);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[AKLivenessRequestProvider event](self, "event"));
  LODWORD(v45) = [v48 isEqualToString:AKPostDataEventLiveness];

  v194 = v19;
  v195 = v18;
  v196 = v47;
  if ((_DWORD)v45)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[AKLivenessRequestProvider livenessReason](self, "livenessReason")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v49, @"reason");

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[AKLivenessRequestProvider followUpProvider](self, "followUpProvider"));
    id v197 = 0LL;
    v51 = (void *)objc_claimAutoreleasedReturnValue([v50 pendingFollowUpItems:&v197]);
    id v52 = v197;
    uint64_t v53 = objc_claimAutoreleasedReturnValue( +[AKFollowUpServerPayloadFormatter pendingAuthKitFollowUpPayload:]( &OBJC_CLASS___AKFollowUpServerPayloadFormatter,  "pendingAuthKitFollowUpPayload:",  v51));

    v174 = (void *)v53;
    if (v52)
    {
      uint64_t v55 = _AKLogSystem(v54);
      v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_100140554();
      }
    }

    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v53,  AKRequestBodyFollowupKey);
    }

    v57 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    v58 = (void *)objc_claimAutoreleasedReturnValue([v57 altDSIDforPrimaryiCloudAccount]);

    if (v58)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl context](self, "context"));
      v60 = (void *)objc_claimAutoreleasedReturnValue([v59 altDSID]);
      unsigned int v61 = [v58 isEqualToString:v60];

      if (v61)
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[AKCDPFactory walrusStatusLiveValue](&OBJC_CLASS___AKCDPFactory, "walrusStatusLiveValue"));
        v63 = (void *)objc_claimAutoreleasedReturnValue([v62 captureCurrentValue]);

        id v64 = [v63 unsignedIntegerValue];
        if (v64)
        {
          id v65 = v64;
          v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v64 == (id)1));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v66,  @"stingrayDisabledIndicator");

          -[AKLivenessRequestProvider _updateTelemtryOptInForAccount:withWalrusStatus:]( self,  "_updateTelemtryOptInForAccount:withWalrusStatus:",  v47,  v65);
        }

        v67 = (void *)objc_claimAutoreleasedReturnValue(+[AKCDPFactory webAccessStatusLiveValue](&OBJC_CLASS___AKCDPFactory, "webAccessStatusLiveValue"));
        v68 = (void *)objc_claimAutoreleasedReturnValue([v67 captureCurrentValue]);

        id v69 = [v68 unsignedIntegerValue];
        if (v69)
        {
          v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v69 == (id)1));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v70,  @"denyICloudWebAccess");
        }
      }
    }

    v176 = v52;
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance", v58));
    v72 = (void *)objc_claimAutoreleasedReturnValue([v71 _matchingServiceAccountForAuthKitAccount:v47 service:2]);

    if (v72)
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue([v72 objectForKeyedSubscript:@"isRegulatoryAccount"]);
      uint64_t v75 = objc_opt_class(&OBJC_CLASS___NSNumber, v74);
      if ((objc_opt_isKindOfClass(v73, v75) & 1) != 0)
      {
        id v76 = [v73 BOOLValue];
        if ((_DWORD)v76)
        {
          uint64_t v77 = _AKLogSystem(v76);
          v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG)) {
            sub_10014051C();
          }

          v79 = (void *)objc_claimAutoreleasedReturnValue( +[AKRegulatoryEligibilityHandler regulatoryEligibilities]( &OBJC_CLASS___AKRegulatoryEligibilityHandler,  "regulatoryEligibilities"));
          if (v79) {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v79, @"3prsd");
          }
        }
      }
    }

    v80 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl context](self, "context"));
    v82 = (void *)objc_claimAutoreleasedReturnValue([v81 altDSID]);
    v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v80 signInPartitionForLivenessWithAltDSID:v82]));

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v83,  AKSignInPartitionLivenessBodyKey);
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    id v85 = [v84 securityLevelForAccount:v47];

    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v85));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v86, @"usrt");

    v19 = v194;
    v18 = v195;
  }

  if (v47)
  {
    v87 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v87 repairStateForAccount:v47]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v88, @"rep");

    v89 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    v90 = (void *)objc_claimAutoreleasedReturnValue([v89 DSIDForAccount:v47]);

    uint64_t v92 = objc_opt_class(&OBJC_CLASS___NSString, v91);
    id v93 = v90;
    if ((objc_opt_isKindOfClass(v93, v92) & 1) != 0)
    {
      id v94 = v93;

      if (v94)
      {
        id v96 = v94;
        id v97 = v96;
LABEL_74:

        v100 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  +[AKCDPFactory cdpAccountIsICDPEnabledForDSID:]( &OBJC_CLASS___AKCDPFactory,  "cdpAccountIsICDPEnabledForDSID:",  v97)));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v100,  @"cdpStatus");

        v101 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl context](self, "context"));
        v102 = (void *)objc_claimAutoreleasedReturnValue([v101 altDSID]);
        v103 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  +[AKCDPFactory cdpAccountIsOTEnabledForAltDSID:]( &OBJC_CLASS___AKCDPFactory,  "cdpAccountIsOTEnabledForAltDSID:",  v102)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v103, @"otStatus");

        v19 = v194;
        v18 = v195;
        goto LABEL_75;
      }
    }

    else
    {
    }

    uint64_t v98 = objc_opt_class(&OBJC_CLASS___NSNumber, v95);
    id v99 = v93;
    if ((objc_opt_isKindOfClass(v99, v98) & 1) != 0) {
      id v96 = v99;
    }
    else {
      id v96 = 0LL;
    }

    id v97 = (id)objc_claimAutoreleasedReturnValue([v96 stringValue]);
    goto LABEL_74;
  }

- (void)_updateTelemtryOptInForAccount:(id)a3 withWalrusStatus:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  unsigned int v7 = [v6 accountAccessTelemetryOptInForAccount:v5];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accountAccessTelemetryOptInDateForAccount:v5]);

  if (v7) {
    BOOL v11 = v9 == 0LL;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    uint64_t v19 = _AKLogSystem(v10);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Telemetry opt-in time was not set, updating now in response to liveness...",  buf,  2u);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    [v21 updateAccountAccessTelemetryOptInTimestampForAccount:v5 withOptIn:1];

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    id v41 = 0LL;
    [v22 saveAccount:v5 error:&v41];
    v23 = (os_log_s *)v41;

    if (!v23) {
      goto LABEL_30;
    }
    uint64_t v25 = _AKLogSystem(v24);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100140640();
    }
    goto LABEL_29;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  if (([v12 isInternalBuild] & 1) == 0)
  {

LABEL_19:
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v27 timeIntervalSinceDate:v9];
    double v29 = v28;

    uint64_t v31 = _AKLogSystem(v30);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v29));
      *(_DWORD *)buf = 138412290;
      v43 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Opt-in was last set %@ seconds ago",  buf,  0xCu);
    }

    if (a4 == 2) {
      char v35 = v7 ^ 1;
    }
    else {
      char v35 = 1;
    }
    if ((v35 & 1) != 0 || v29 < 172800.0)
    {
      if (v29 >= 172800.0) {
        goto LABEL_31;
      }
      uint64_t v39 = _AKLogSystem(v34);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "It has NOT been more than 48 hours since the last time telemetry opt-in was set.",  buf,  2u);
      }

      goto LABEL_30;
    }

    goto LABEL_26;
  }

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[AKConfiguration sharedConfiguration](&OBJC_CLASS___AKConfiguration, "sharedConfiguration"));
  id v14 = [v13 telemetryOptInGracePeriodOverride];

  if (v14 != (id)1) {
    goto LABEL_19;
  }
  uint64_t v16 = _AKLogSystem(v15);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Telemetry opt-in grace period override is set, forcing update...",  buf,  2u);
  }

  char v18 = v7 ^ 1;
  if (a4 != 2) {
    char v18 = 1;
  }
  if ((v18 & 1) == 0)
  {
LABEL_26:
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    id v40 = 0LL;
    [v36 setAccountAccessTelemetryOptIn:0 forAccount:v5 error:&v40];
    v23 = (os_log_s *)v40;

    if (!v23)
    {
LABEL_30:

      goto LABEL_31;
    }

    uint64_t v38 = _AKLogSystem(v37);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1001406A0();
    }
LABEL_29:

    goto LABEL_30;
  }

- (NSString)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (unint64_t)livenessReason
{
  return self->_livenessReason;
}

- (void)setLivenessReason:(unint64_t)a3
{
  self->_livenessReason = a3;
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (AKFollowUpProvider)followUpProvider
{
  return self->_followUpProvider;
}

- (void)setFollowUpProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end