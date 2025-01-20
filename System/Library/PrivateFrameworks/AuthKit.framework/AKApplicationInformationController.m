@interface AKApplicationInformationController
+ (id)sharedController;
- (id)_buildApplicationAuthorizationController;
- (id)_buildApplicationMetadataServiceForAltDSID:(id)a3 client:(id)a4;
- (void)fetchAppInformationWithAltDSID:(id)a3 client:(id)a4 completion:(id)a5;
- (void)fetchPrimaryApplicationInformationForAltDSID:(id)a3 appInformation:(id)a4 client:(id)a5 completion:(id)a6;
@end

@implementation AKApplicationInformationController

+ (id)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AB03C;
  block[3] = &unk_1001C8DA0;
  block[4] = a1;
  if (qword_10020F640 != -1) {
    dispatch_once(&qword_10020F640, block);
  }
  return (id)qword_10020F638;
}

- (void)fetchAppInformationWithAltDSID:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = _AKLogSystem(v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting to fetch app info for %@", buf, 0xCu);
  }

  v13 = objc_opt_new(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  -[AKAppleIDAuthenticationContext setAltDSID:](v13, "setAltDSID:", v8);
  v14 = objc_alloc(&OBJC_CLASS___AKGrandSlamRequestProvider);
  v15 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:]( v14,  "initWithContext:urlBagKey:",  v13,  AKURLBagKeyFetchAppInfo);
  -[AKURLRequestProviderImpl setClient:](v15, "setClient:", v10);

  -[AKGrandSlamRequestProvider setAuthenticatedRequest:](v15, "setAuthenticatedRequest:", 1LL);
  v16 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v15);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000AB210;
  v19[3] = &unk_1001C6568;
  v21 = self;
  id v22 = v9;
  id v20 = v8;
  id v17 = v8;
  id v18 = v9;
  -[AKServiceControllerImpl executeRequestWithCompletion:](v16, "executeRequestWithCompletion:", v19);
}

- (void)fetchPrimaryApplicationInformationForAltDSID:(id)a3 appInformation:(id)a4 client:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  uint64_t v14 = _AKLogSystem(v13);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"client_id"]);
    *(_DWORD *)buf = 138412546;
    v25 = v16;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Starting to fetch bundle id for Primary application for serviceID: %@, altDSID: %@",  buf,  0x16u);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[AKApplicationInformationController _buildApplicationMetadataServiceForAltDSID:client:]( self,  "_buildApplicationMetadataServiceForAltDSID:client:",  v10,  v13));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"client_id"]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000AB5A8;
  v21[3] = &unk_1001C89A0;
  id v22 = v10;
  id v23 = v12;
  id v19 = v10;
  id v20 = v12;
  [v17 performFetchPrimaryApplicationInformationForClientBundleID:v18 completion:v21];
}

- (id)_buildApplicationAuthorizationController
{
  return objc_opt_new(&OBJC_CLASS___AKApplicationAuthorizationController);
}

- (id)_buildApplicationMetadataServiceForAltDSID:(id)a3 client:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  -[AKAppleIDAuthenticationContext setAltDSID:](v7, "setAltDSID:", v6);

  id v8 = objc_alloc(&OBJC_CLASS___AKApplicationMetadataRequestProvider);
  id v9 = -[AKApplicationMetadataRequestProvider initWithContext:urlBagKey:]( v8,  "initWithContext:urlBagKey:",  v7,  AKURLBagKeyFetchPrimaryBundleID);
  -[AKURLRequestProviderImpl setClient:](v9, "setClient:", v5);

  -[AKGrandSlamRequestProvider setAuthenticatedRequest:](v9, "setAuthenticatedRequest:", 1LL);
  id v10 = -[AKServiceControllerImpl initWithRequestProvider:]( objc_alloc(&OBJC_CLASS___AKServiceControllerImpl),  "initWithRequestProvider:",  v9);
  id v11 = -[AKApplicationMetadataService initWithServiceController:]( objc_alloc(&OBJC_CLASS___AKApplicationMetadataService),  "initWithServiceController:",  v10);

  return v11;
}

@end