@interface MCPairedWatchManager
- (BOOL)_updateSupervision:(BOOL)a3 cloudConfigReader:(id)a4 cloudConfigWriter:(id)a5 outError:(id *)a6;
- (DMCEnrollmentFlowController)enrollmentController;
- (NSData)pairingToken;
- (id)_derCertificatesFromPersistentRefArray:(id)a3;
- (id)_errorBadProfile;
- (id)_errorEnrollmentCannotBeStaged;
- (id)_errorEnrollmentMalformed;
- (id)_errorInvalidServiceURL;
- (id)_errorMissingMDMPayload;
- (id)_errorMissingServiceURL;
- (id)_errorPhoneUnsupervised;
- (id)_organizationNameFromProfile:(id)a3 payload:(id)a4;
- (id)_serviceURLFromEnrollmentDictionary:(id)a3 outError:(id *)a4;
- (id)detailsFromMDMProfile:(id)a3 error:(id *)a4;
- (id)getMachineInfoForEnrollmentType:(unint64_t)a3 enrollmentMethod:(unint64_t)a4;
- (void)applyPairingWatchMDMEnrollmentData:(id)a3 source:(id)a4 usingProfileInstaller:(id)a5 cloudConfigReader:(id)a6 cloudConfigWriter:(id)a7 completion:(id)a8;
- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:(id)a3;
- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:(id)a3 completion:(id)a4;
- (void)fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:(id)a3;
- (void)installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 completionHandler:(id)a7;
- (void)setEnrollmentController:(id)a3;
- (void)setPairingToken:(id)a3;
- (void)stageMDMEnrollmentInfoForPairingWatchWithProfileData:(id)a3 orServiceURL:(id)a4 anchorCertificates:(id)a5 supervised:(BOOL)a6 declarationKeys:(id)a7 declarationConfiguration:(id)a8 completion:(id)a9;
- (void)unstageMDMEnrollmentInfoForPairingWatchWithCompletion:(id)a3;
- (void)updateMDMEnrollmentInfoForPairingWatch:(id)a3 completion:(id)a4;
@end

@implementation MCPairedWatchManager

- (void)stageMDMEnrollmentInfoForPairingWatchWithProfileData:(id)a3 orServiceURL:(id)a4 anchorCertificates:(id)a5 supervised:(BOOL)a6 declarationKeys:(id)a7 declarationConfiguration:(id)a8 completion:(id)a9
{
  BOOL v11 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v19 = (void (**)(id, void))a9;
  v20 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "MCPairedWatchManager.stageMDMEnrollmentInfoForPairingWatchWithProfileData",  buf,  2u);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[MDMCloudConfiguration sharedConfiguration]( &OBJC_CLASS___MDMCloudConfiguration,  "sharedConfiguration"));
  unsigned __int8 v22 = [v21 isSupervised];

  if ((v22 & 1) != 0
    || (+[MCFeatureOverrides allowUnsupervisedWatchEnrollment]( &OBJC_CLASS___MCFeatureOverrides,  "allowUnsupervisedWatchEnrollment") & 1) != 0)
  {
    v23 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v24,  kMCWatchEnrollmentSupervisionKey);

    id v25 = +[DMCFeatureOverrides watchEnrollmentAllowLocalProfile]( &OBJC_CLASS___DMCFeatureOverrides,  "watchEnrollmentAllowLocalProfile");
    if (v14 && (_DWORD)v25) {
      id v25 = -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v14,  kMCWatchEnrollmentProfileDataKey);
    }
    if (v15) {
      id v25 = -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v15,  kMCWatchEnrollmentServiceURLKey);
    }
    if (v16)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue( -[MCPairedWatchManager _derCertificatesFromPersistentRefArray:]( self,  "_derCertificatesFromPersistentRefArray:",  v16));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v26,  kMCWatchEnrollmentAnchorCertificatesKey);
    }

    if (v17)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v17 allObjects]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v27,  kMCWatchEnrollmentDeclarationKeysKey);
    }

    if (v18) {
      id v25 = -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v18,  kMCWatchEnrollmentDeclarationConfigurationKey);
    }
    uint64_t v28 = MCSystemWatchEnrollmentDataFilePath(v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    unsigned int v30 = -[NSMutableDictionary DMCWriteToBinaryFile:](v23, "DMCWriteToBinaryFile:", v29);

    v31 = _MCLogObjects[0];
    if (v30)
    {
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v36 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Watch enrollment successfully staged",  v36,  2u);
      }

      v19[2](v19, 0LL);
    }

    else
    {
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Watch enrollment could not be staged",  v35,  2u);
      }

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager _errorEnrollmentCannotBeStaged](self, "_errorEnrollmentCannotBeStaged"));
      ((void (**)(id, void *))v19)[2](v19, v32);
    }
  }

  else
  {
    v33 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v37 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Watch enrollment could not be staged because phone is unsupervised",  v37,  2u);
    }

    v23 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager _errorPhoneUnsupervised](self, "_errorPhoneUnsupervised"));
    ((void (**)(id, NSMutableDictionary *))v19)[2](v19, v23);
  }
}

- (void)unstageMDMEnrollmentInfoForPairingWatchWithCompletion:(id)a3
{
  v3 = (void (**)(id, id))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v5 = _MCLogObjects[0];
  BOOL v6 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "MCPairedWatchManager.unstageMDMEnrollmentInfoForPairingWatchWithCompletion",  buf,  2u);
  }

  uint64_t v7 = MCSystemWatchEnrollmentDataFilePath(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if ([v4 fileExistsAtPath:v8])
  {
    id v12 = 0LL;
    [v4 removeItemAtPath:v8 error:&v12];
    id v9 = v12;
    if (v9)
    {
      v10 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Watch enrollment failed to unstage with error: %{public}@",  buf,  0xCu);
      }
    }

    v3[2](v3, v9);
  }

  else
  {
    BOOL v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Watch enrollment could not be unstaged because it does not exist",  buf,  2u);
    }

    v3[2](v3, 0LL);
  }
}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:(id)a3
{
  v3 = (void (**)(id, void *, void))a3;
  v4 = _MCLogObjects[0];
  BOOL v5 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "MCPairedWatchManager.fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion",  v9,  2u);
  }

  uint64_t v6 = MCSystemWatchEnrollmentDataFilePath(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData MCDataFromFile:](&OBJC_CLASS___NSData, "MCDataFromFile:", v7));

  v3[2](v3, v8, 0LL);
}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, id))a4;
  v8 = _MCLogObjects[0];
  BOOL v9 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "MCPairedWatchManager.fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken",  buf,  2u);
  }

  uint64_t v10 = MCSystemWatchEnrollmentDataFilePath(v9);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData MCDataFromFile:](&OBJC_CLASS___NSData, "MCDataFromFile:", v11));

  if (v12)
  {
    id v22 = 0LL;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v12,  1LL,  0LL,  &v22));
    id v14 = v22;
    if (v13 && (uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary), (objc_opt_isKindOfClass(v13, v15) & 1) != 0))
    {
      [v13 setObject:v6 forKeyedSubscript:kMCWatchEnrollmentPairingTokenKey];
      id v21 = 0LL;
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v13,  200LL,  0LL,  &v21));
      id v17 = v21;

      if (v16)
      {
        id v18 = v16;
        id v19 = 0LL;
      }

      else
      {
        id v18 = 0LL;
        id v19 = v17;
      }

      v7[2](v7, v18, v19);
      id v14 = v17;
    }

    else
    {
      v20 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Watch enrollment is malformed: %{public}@",  buf,  0xCu);
      }

      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager _errorEnrollmentMalformed](self, "_errorEnrollmentMalformed"));
      v7[2](v7, 0LL, v16);
    }
  }

  else
  {
    v7[2](v7, 0LL, 0LL);
  }
}

- (void)fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  BOOL v5 = _MCLogObjects[0];
  BOOL v6 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "MCPairedWatchManager.fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion",  buf,  2u);
  }

  uint64_t v7 = MCSystemWatchEnrollmentDataFilePath(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData MCDataFromFile:](&OBJC_CLASS___NSData, "MCDataFromFile:", v8));

  if (v9)
  {
    id v17 = 0LL;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v9,  0LL,  0LL,  &v17));
    id v11 = v17;
    if (v10 && (uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v10, v12) & 1) != 0))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kMCWatchEnrollmentDeclarationKeysKey]);
      if (v13 && (uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v13, v14) & 1) != 0))
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13));
        v4[2](v4, v15, 0LL);
      }

      else
      {
        v4[2](v4, 0LL, 0LL);
      }
    }

    else
    {
      id v16 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Watch enrollment is malformed: %{public}@",  buf,  0xCu);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager _errorEnrollmentMalformed](self, "_errorEnrollmentMalformed"));
      ((void (**)(id, void *, void *))v4)[2](v4, 0LL, v13);
    }
  }

  else
  {
    v4[2](v4, 0LL, 0LL);
  }
}

- (void)applyPairingWatchMDMEnrollmentData:(id)a3 source:(id)a4 usingProfileInstaller:(id)a5 cloudConfigReader:(id)a6 cloudConfigWriter:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v54 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = (void (**)(id, id))a8;
  id v19 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "MCPairedWatchManager.applyPairingWatchMDMEnrollmentData",  buf,  2u);
  }

  id v63 = 0LL;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v14,  0LL,  0LL,  &v63));
  id v21 = v63;
  if (!v20 || (uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v20, v22) & 1) == 0))
  {
    v24 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v65 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Watch enrollment is malformed: %{public}@",  buf,  0xCu);
    }

    id v25 = (id)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager _errorEnrollmentMalformed](self, "_errorEnrollmentMalformed"));
    goto LABEL_11;
  }

  if (+[DMCFeatureOverrides watchEnrollmentAllowLocalProfile]( &OBJC_CLASS___DMCFeatureOverrides,  "watchEnrollmentAllowLocalProfile")
    && (uint64_t v23 = objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:kMCWatchEnrollmentProfileDataKey])) != 0)
  {
    char v47 = 0;
    v51 = 0LL;
  }

  else
  {
    id v52 = v14;
    id v27 = v17;
    id v28 = v16;
    id v29 = v15;
    id v62 = v21;
    uint64_t v30 = objc_claimAutoreleasedReturnValue( -[MCPairedWatchManager _serviceURLFromEnrollmentDictionary:outError:]( self,  "_serviceURLFromEnrollmentDictionary:outError:",  v20,  &v62));
    id v25 = v62;

    if (v25)
    {
      id v21 = (id)v30;
      id v15 = v29;
      id v16 = v28;
      id v17 = v27;
      id v14 = v52;
LABEL_11:

      v18[2](v18, v25);
      v26 = v54;
      goto LABEL_12;
    }

    v51 = (void *)v30;
    uint64_t v23 = 0LL;
    id v21 = 0LL;
    char v47 = 1;
    id v15 = v29;
    id v16 = v28;
    id v17 = v27;
    id v14 = v52;
  }

  v53 = (void *)v23;
  v50 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:kMCWatchEnrollmentAnchorCertificatesKey]);
  uint64_t v31 = objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:kMCWatchEnrollmentPairingTokenKey]);
  v49 = (void *)v31;
  if (v31)
  {
    -[MCPairedWatchManager setPairingToken:](self, "setPairingToken:", v31);
    v32 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v33 = "applyPairingWatchMDMEnrollmentData: pairingToken extracted from enrollmentDictionary";
  }

  else
  {
    v32 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v33 = "applyPairingWatchMDMEnrollmentData: pairingToken in enrollmentDictionary is nil";
  }

  _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, v33, buf, 2u);
LABEL_22:
  v34 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:kMCWatchEnrollmentSupervisionKey]);
  uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSNumber);
  v48 = v34;
  if ((objc_opt_isKindOfClass(v34, v35) & 1) != 0) {
    id v36 = [v34 BOOLValue];
  }
  else {
    id v36 = 0LL;
  }
  id v61 = v21;
  -[MCPairedWatchManager _updateSupervision:cloudConfigReader:cloudConfigWriter:outError:]( self,  "_updateSupervision:cloudConfigReader:cloudConfigWriter:outError:",  v36,  v16,  v17,  &v61);
  id v25 = v61;

  if (v25)
  {

    id v21 = v53;
    goto LABEL_11;
  }

  v46 = v15;
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  v59[2] = sub_1000173E8;
  v59[3] = &unk_1000C3160;
  v60 = v18;
  v37 = objc_retainBlock(v59);
  v38 = v37;
  if ((v47 & 1) != 0)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[DMCEnrollmentFlowController enrollmentFlowControllerWithPresenter:managedConfigurationHelper:]( &OBJC_CLASS___DMCEnrollmentFlowController,  "enrollmentFlowControllerWithPresenter:managedConfigurationHelper:",  0LL,  self));
    -[MCPairedWatchManager setEnrollmentController:](self, "setEnrollmentController:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager enrollmentController](self, "enrollmentController"));
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_1000174C0;
    v55[3] = &unk_1000C33A0;
    v55[4] = self;
    id v56 = v38;
    id v41 = v38;
    v42 = v50;
    v43 = v51;
    [v40 startWatchEnrollmentFlowWithServiceURL:v51 anchorCertificates:v50 restartIfFail:0 completionHandler:v55];

    v44 = v53;
    v26 = v54;
  }

  else
  {
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472LL;
    v57[2] = sub_1000174B0;
    v57[3] = &unk_1000C3378;
    id v58 = v37;
    v45 = v37;
    v44 = v53;
    v26 = v54;
    [v46 installProfileData:v53 interactionClient:0 options:0 source:v54 completion:v57];

    v42 = v50;
    v43 = v51;
  }

  id v25 = 0LL;
  id v15 = v46;
LABEL_12:
}

- (void)updateMDMEnrollmentInfoForPairingWatch:(id)a3 completion:(id)a4
{
  BOOL v5 = (void (**)(id, void *, id))a4;
  uint64_t v6 = kDMCPairingParametersSecurityTokenKey;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMCMobileGestalt deviceUDID](&OBJC_CLASS___DMCMobileGestalt, "deviceUDID"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kDMCPairingParametersWatchUDIDKey]);

  id v11 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v18 = v8;
    __int16 v19 = 2112;
    v20 = v9;
    __int16 v21 = 2112;
    uint64_t v22 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "MCPairedWatchManager.updateMDMEnrollmentInfoForPairingWatch security token: %@ ; deviceID : %@ ; watchID : %@",
      buf,
      0x20u);
  }

  id v16 = 0LL;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[MDMConfiguration getWatchPairingTokenForPhoneID:watchID:securityToken:outError:]( &OBJC_CLASS___MDMConfiguration,  "getWatchPairingTokenForPhoneID:watchID:securityToken:outError:",  v9,  v10,  v8,  &v16));
  id v13 = v16;
  if (v13)
  {
    id v14 = 0LL;
    id v15 = v13;
  }

  else
  {
    id v14 = v12;
    id v15 = 0LL;
  }

  v5[2](v5, v14, v15);
}

- (id)getMachineInfoForEnrollmentType:(unint64_t)a3 enrollmentMethod:(unint64_t)a4
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer", a3, a4));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager pairingToken](self, "pairingToken"));

  if (v6)
  {
    id v13 = @"PAIRING_TOKEN";
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager pairingToken](self, "pairingToken"));
    id v14 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));

    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudConfigurationMachineInfoDataWithAdditionalInfo:v8]);
  }

  else
  {
    uint64_t v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "MCPairedWatchManager.getMachineIfoForEnrollmentType self.pairingToken==nil",  v12,  2u);
    }

    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudConfigurationMachineInfo]);
  }

  return v9;
}

- (id)detailsFromMDMProfile:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](&OBJC_CLASS___MCProfile, "profileWithData:outError:", a3));
  if (v6)
  {
    id v7 = [v6 payloadsWithClass:objc_opt_class(MCMDMPayload)];
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);

    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  7LL));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      [v10 setObject:v11 forKeyedSubscript:kMCBridgeProfileIdentifierKey];

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 managedAppleID]);
      [v10 setObject:v12 forKeyedSubscript:kMCBridgeManagedAppleIDKey];

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 assignedManagedAppleID]);
      [v10 setObject:v13 forKeyedSubscript:kMCBridgeAssignedManagedAppleIDKey];

      id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 friendlyName]);
      [v10 setObject:v14 forKeyedSubscript:kMCBridgeFriendlyNameKey];

      id v15 = (void *)objc_claimAutoreleasedReturnValue( -[MCPairedWatchManager _organizationNameFromProfile:payload:]( self,  "_organizationNameFromProfile:payload:",  v6,  v9));
      [v10 setObject:v15 forKeyedSubscript:kMCBridgeOrganizationNameKey];

      id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 enrollmentMode]);
      [v10 setObject:v16 forKeyedSubscript:kMCBridgeEnrollmentModeKey];

      id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 serverCapabilities]);
      [v10 setObject:v17 forKeyedSubscript:kMCBridgeServerCapabilitiesKey];

      id v18 = [v10 copy];
    }

    else if (a4)
    {
      id v20 = (id)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager _errorMissingMDMPayload](self, "_errorMissingMDMPayload"));
      id v18 = 0LL;
      *a4 = v20;
    }

    else
    {
      id v18 = 0LL;
    }
  }

  else if (a4)
  {
    id v19 = (id)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager _errorBadProfile](self, "_errorBadProfile"));
    id v18 = 0LL;
    *a4 = v19;
  }

  else
  {
    id v18 = 0LL;
  }

  return v18;
}

- (id)_organizationNameFromProfile:(id)a3 payload:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 organization]);

  if (v7)
  {
    v8 = v6;
LABEL_5:
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 organization]);
    goto LABEL_6;
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v5 organization]);

  if (v9)
  {
    v8 = v5;
    goto LABEL_5;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 serverURLString]);

  if (v10)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 serverURLString]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v12));

    if (v13)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v13 host]);
    }

    else
    {
      uint64_t v10 = 0LL;
    }
  }

- (void)installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 completionHandler:(id)a7
{
  id v10 = a7;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v12,  kMCInstallProfileOptionPersonaID);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v11,  kMCInstallProfileOptionRMAccountIdentifier);
  if (v12) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  kDMCProfileInstallationSourceAccountDrivenUserEnrollment,  kMCInstallProfileOptionInstallationSource);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kMCInstallProfileOptionIsCloudLocked);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kMCInstallProfileOptionIsCloudProfile);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](&OBJC_CLASS___MCProfileServiceServer, "sharedServer"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100017CAC;
  v17[3] = &unk_1000C3378;
  id v18 = v10;
  id v16 = v10;
  [v15 installProfileData:v13 interactionClient:0 options:v14 source:@"MCPairedWatchManager" completion:v17];
}

- (id)_derCertificatesFromPersistentRefArray:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v15 = v3;
    id v4 = [(id)objc_opt_class(DMCKeychain) copyCertificatesWithPersistentIDs:v3 useSystemKeychain:1 enforcePersonalPersona:0];
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          CFDataRef v11 = SecCertificateCopyData(*(SecCertificateRef *)(*((void *)&v16 + 1) + 8LL * (void)i));
          [v5 addObject:v11];
          id v12 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "_derCertificatesFromPersistentRefArray :: converted persistentRef to der NSData",  buf,  2u);
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }

      while (v8);
    }

    id v3 = v15;
  }

  else
  {
    id v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
    }

    id v5 = 0LL;
  }

  return v5;
}

- (id)_serviceURLFromEnrollmentDictionary:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kMCWatchEnrollmentServiceURLKey]);
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v7));
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }

    else
    {
      id v12 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        int v14 = 138543362;
        id v15 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Watch enrollment service URL is invalid: %{public}@",  (uint8_t *)&v14,  0xCu);
      }

      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager _errorInvalidServiceURL](self, "_errorInvalidServiceURL"));
      }
    }
  }

  else
  {
    CFDataRef v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543362;
      id v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Watch enrollment is missing a profile service URL: %{public}@",  (uint8_t *)&v14,  0xCu);
    }

    uint64_t v9 = 0LL;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue(-[MCPairedWatchManager _errorMissingServiceURL](self, "_errorMissingServiceURL"));
    }
  }

  return v9;
}

- (BOOL)_updateSupervision:(BOOL)a3 cloudConfigReader:(id)a4 cloudConfigWriter:(id)a5 outError:(id *)a6
{
  BOOL v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v9 refreshDetailsFromDisk];
  CFDataRef v11 = (void *)objc_claimAutoreleasedReturnValue([v9 details]);
  id v12 = [v11 mutableCopy];

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
    [v12 setObject:v13 forKeyedSubscript:kMCCCIsSupervisedKey];
  }

  else
  {
    id v14 = [(id)objc_opt_class(v9) canonicalConfigurationWithSupervision:v8];
    id v12 = (id)objc_claimAutoreleasedReturnValue(v14);
  }

  [v12 setObject:&off_1000CBF08 forKeyedSubscript:kCCConfigurationSourceKey];
  unsigned __int8 v15 = [v10 saveCloudConfigurationDetails:v12 outError:a6];
  if ((v15 & 1) != 0)
  {
    [v10 finalizeCloudConfigurationOutError:0];
  }

  else
  {
    __int128 v16 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      id v17 = *a6;
      int v19 = 138543362;
      id v20 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Watch enrollment failed to apply supervision state: %{public}@",  (uint8_t *)&v19,  0xCu);
    }
  }

  return v15;
}

- (id)_errorEnrollmentCannotBeStaged
{
  uint64_t v2 = MDMErrorDomain;
  uint64_t v3 = DMCErrorArray(@"MDM_ERROR_WATCH_ENROLLMENT_CANNOT_BE_STAGED", a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "DMCErrorWithDomain:code:descriptionArray:errorType:",  v2,  12116LL,  v4,  DMCErrorTypeFatal));

  return v5;
}

- (id)_errorPhoneUnsupervised
{
  uint64_t v2 = MDMErrorDomain;
  uint64_t v3 = DMCErrorArray(@"MDM_ERROR_WATCH_ENROLLMENT_PHONE_UNSUPERVISED", a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "DMCErrorWithDomain:code:descriptionArray:errorType:",  v2,  12121LL,  v4,  DMCErrorTypeFatal,  0LL));

  return v5;
}

- (id)_errorEnrollmentMalformed
{
  uint64_t v2 = MDMErrorDomain;
  uint64_t v3 = DMCErrorArray(@"MDM_ERROR_WATCH_ENROLLMENT_MALFORMED", a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "DMCErrorWithDomain:code:descriptionArray:errorType:",  v2,  12008LL,  v4,  DMCErrorTypeFatal,  0LL));

  return v5;
}

- (id)_errorMissingServiceURL
{
  uint64_t v2 = MDMErrorDomain;
  uint64_t v3 = DMCErrorArray(@"MDM_ERROR_WATCH_ENROLLMENT_MISSING_SERVICE_URL", a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "DMCErrorWithDomain:code:descriptionArray:errorType:",  v2,  12117LL,  v4,  DMCErrorTypeFatal,  0LL));

  return v5;
}

- (id)_errorInvalidServiceURL
{
  uint64_t v2 = MDMErrorDomain;
  uint64_t v3 = DMCErrorArray(@"MDM_ERROR_WATCH_ENROLLMENT_INVALID_SERVICE_URL", a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "DMCErrorWithDomain:code:descriptionArray:errorType:",  v2,  12118LL,  v4,  DMCErrorTypeFatal,  0LL));

  return v5;
}

- (id)_errorBadProfile
{
  uint64_t v2 = MDMErrorDomain;
  uint64_t v3 = DMCErrorArray(@"MDM_ERROR_WATCH_ENROLLMENT_BAD_PROFILE", a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "DMCErrorWithDomain:code:descriptionArray:errorType:",  v2,  12119LL,  v4,  DMCErrorTypeFatal,  0LL));

  return v5;
}

- (id)_errorMissingMDMPayload
{
  uint64_t v2 = MDMErrorDomain;
  uint64_t v3 = DMCErrorArray(@"MDM_ERROR_WATCH_ENROLLMENT_MISSING_MDM_PAYLOAD", a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "DMCErrorWithDomain:code:descriptionArray:errorType:",  v2,  12120LL,  v4,  DMCErrorTypeFatal,  0LL));

  return v5;
}

- (DMCEnrollmentFlowController)enrollmentController
{
  return self->_enrollmentController;
}

- (void)setEnrollmentController:(id)a3
{
}

- (NSData)pairingToken
{
  return self->_pairingToken;
}

- (void)setPairingToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end