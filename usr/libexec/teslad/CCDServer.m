@interface CCDServer
- (NSOperationQueue)operationQueue;
- (id)_operationForDeviceUploadRequest:(id)a3;
- (id)_operationForEnrollmentRequest:(id)a3;
- (id)_requestForDeviceUploadRequestType:(int64_t)a3 userCredentials:(id)a4;
- (void)_addOperationToQueue:(id)a3;
- (void)_startProcessForDeviceUploadRequest:(id)a3 completionBlock:(id)a4;
- (void)_startProcessForEnrollmentRequest:(id)a3 completionBlock:(id)a4;
- (void)fetchConfigurationAndActivateAnisetteWithCompletionBlock:(id)a3;
- (void)fetchConfigurationWithCompletionBlock:(id)a3;
- (void)fetchConfigurationWithoutActivatingAnisetteWithCompletionBlock:(id)a3;
- (void)fetchConfigurationWithoutValidationWithCompletionBlock:(id)a3;
- (void)pingWithCompletionBlock:(id)a3;
- (void)provisionallyEnrollWithNonce:(id)a3 completionBlock:(id)a4;
- (void)retrieveDeviceUploadOrganizationsWithCredentials:(id)a3 completionBlock:(id)a4;
- (void)retrieveDeviceUploadRequestTypesWithCredentials:(id)a3 completionBlock:(id)a4;
- (void)retrieveDeviceUploadSoldToIdsForOrganization:(id)a3 credentials:(id)a4 completionBlock:(id)a5;
- (void)setOperationQueue:(id)a3;
- (void)submitDeviceUploadRequest:(id)a3 credentials:(id)a4 completionBlock:(id)a5;
- (void)syncDEPPushToken:(id)a3 pushTopic:(id)a4 completionBlock:(id)a5;
- (void)unenrollWithCompletionBlock:(id)a3;
@end

@implementation CCDServer

- (NSOperationQueue)operationQueue
{
  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    v4 = (NSOperationQueue *)objc_opt_new(&OBJC_CLASS___NSOperationQueue, a2);
    v5 = self->_operationQueue;
    self->_operationQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    operationQueue = self->_operationQueue;
  }

  return operationQueue;
}

- (void)provisionallyEnrollWithNonce:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = (id)objc_opt_new(&OBJC_CLASS___CCDEnrollmentProvisionallyEnrollRequest, v8);
  [v9 setNonce:v7];

  -[CCDServer _startProcessForEnrollmentRequest:completionBlock:]( self,  "_startProcessForEnrollmentRequest:completionBlock:",  v9,  v6);
}

- (void)fetchConfigurationWithCompletionBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[CCDAuthKitUtilities shouldActivateAnisette](&OBJC_CLASS___CCDAuthKitUtilities, "shouldActivateAnisette");
  BOOL v6 = v5;
  id v9 = *(os_log_s **)(DEPLogObjects(v5, v7, v8) + 8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Retrieving cloud configuration and mid", buf, 2u);
    }

    -[CCDServer fetchConfigurationAndActivateAnisetteWithCompletionBlock:]( self,  "fetchConfigurationAndActivateAnisetteWithCompletionBlock:",  v4);
  }

  else
  {
    if (v10)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Only retrieving cloud configuration", v11, 2u);
    }

    -[CCDServer fetchConfigurationWithoutActivatingAnisetteWithCompletionBlock:]( self,  "fetchConfigurationWithoutActivatingAnisetteWithCompletionBlock:",  v4);
  }
}

- (void)fetchConfigurationAndActivateAnisetteWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v33[0] = 0LL;
  v33[1] = v33;
  v33[2] = 0x2020000000LL;
  char v34 = 0;
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x2020000000LL;
  char v32 = 0;
  v29[0] = 0LL;
  v29[1] = v29;
  v29[2] = 0x2020000000LL;
  char v30 = 0;
  v27[0] = 0LL;
  v27[1] = v27;
  v27[2] = 0x3032000000LL;
  v27[3] = sub_100009320;
  v27[4] = sub_100009330;
  id v28 = 0LL;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x3032000000LL;
  v25[3] = sub_100009320;
  v25[4] = sub_100009330;
  id v26 = 0LL;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x3032000000LL;
  v23[3] = sub_100009320;
  v23[4] = sub_100009330;
  v24 = objc_alloc_init(&OBJC_CLASS___NSLock);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100009338;
  v15[3] = &unk_1000189D8;
  v17 = v23;
  v18 = v31;
  id v5 = v4;
  id v16 = v5;
  v19 = v29;
  v20 = v27;
  v21 = v25;
  v22 = v33;
  +[CCDAuthKitUtilities midWithCompletion:](&OBJC_CLASS___CCDAuthKitUtilities, "midWithCompletion:", v15);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000940C;
  v7[3] = &unk_100018A00;
  id v9 = v23;
  BOOL v10 = v33;
  id v6 = v5;
  id v8 = v6;
  v11 = v29;
  v12 = v27;
  v13 = v25;
  v14 = v31;
  -[CCDServer fetchConfigurationWithoutActivatingAnisetteWithCompletionBlock:]( self,  "fetchConfigurationWithoutActivatingAnisetteWithCompletionBlock:",  v7);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);
}

- (void)fetchConfigurationWithoutActivatingAnisetteWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_opt_new(&OBJC_CLASS___CCDEnrollmentRetrieveCloudConfigurationRequest, v5);
  -[CCDServer _startProcessForEnrollmentRequest:completionBlock:]( self,  "_startProcessForEnrollmentRequest:completionBlock:",  v6,  v4);
}

- (void)fetchConfigurationWithoutValidationWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_opt_new(&OBJC_CLASS___CCDEnrollmentRetrieveCloudConfigurationWithoutValidationRequest, v5);
  -[CCDServer _startProcessForEnrollmentRequest:completionBlock:]( self,  "_startProcessForEnrollmentRequest:completionBlock:",  v6,  v4);
}

- (void)unenrollWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_opt_new(&OBJC_CLASS___CCDEnrollmentUnenrollRequest, v5);
  -[CCDServer _startProcessForEnrollmentRequest:completionBlock:]( self,  "_startProcessForEnrollmentRequest:completionBlock:",  v6,  v4);
}

- (void)syncDEPPushToken:(id)a3 pushTopic:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = (id)objc_opt_new(&OBJC_CLASS___CCDEnrollmentUploadPushTokenRequest, v11);
  [v12 setPushToken:v10];

  [v12 setPushTopic:v9];
  -[CCDServer _startProcessForEnrollmentRequest:completionBlock:]( self,  "_startProcessForEnrollmentRequest:completionBlock:",  v12,  v8);
}

- (void)retrieveDeviceUploadOrganizationsWithCredentials:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[CCDServer _requestForDeviceUploadRequestType:userCredentials:]( self,  "_requestForDeviceUploadRequestType:userCredentials:",  0LL,  a3));
  -[CCDServer _startProcessForDeviceUploadRequest:completionBlock:]( self,  "_startProcessForDeviceUploadRequest:completionBlock:",  v7,  v6);
}

- (void)retrieveDeviceUploadRequestTypesWithCredentials:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[CCDServer _requestForDeviceUploadRequestType:userCredentials:]( self,  "_requestForDeviceUploadRequestType:userCredentials:",  1LL,  a3));
  -[CCDServer _startProcessForDeviceUploadRequest:completionBlock:]( self,  "_startProcessForDeviceUploadRequest:completionBlock:",  v7,  v6);
}

- (void)retrieveDeviceUploadSoldToIdsForOrganization:(id)a3 credentials:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue( -[CCDServer _requestForDeviceUploadRequestType:userCredentials:]( self,  "_requestForDeviceUploadRequestType:userCredentials:",  2LL,  a4));
  [v10 setOrganization:v9];

  -[CCDServer _startProcessForDeviceUploadRequest:completionBlock:]( self,  "_startProcessForDeviceUploadRequest:completionBlock:",  v10,  v8);
}

- (void)submitDeviceUploadRequest:(id)a3 credentials:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue( -[CCDServer _requestForDeviceUploadRequestType:userCredentials:]( self,  "_requestForDeviceUploadRequestType:userCredentials:",  3LL,  a4));
  [v10 setSubmitDeviceRequestPayload:v9];

  -[CCDServer _startProcessForDeviceUploadRequest:completionBlock:]( self,  "_startProcessForDeviceUploadRequest:completionBlock:",  v10,  v8);
}

- (void)_startProcessForDeviceUploadRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CCDServer _operationForDeviceUploadRequest:](self, "_operationForDeviceUploadRequest:", a3));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100009974;
  v9[3] = &unk_100018A28;
  id v10 = v6;
  id v8 = v6;
  [v7 setDeviceUploadCompletionBlock:v9];
  -[CCDServer _addOperationToQueue:](self, "_addOperationToQueue:", v7);
}

- (id)_requestForDeviceUploadRequestType:(int64_t)a3 userCredentials:(id)a4
{
  id v6 = a4;
  else {
    id v7 = (void *)objc_opt_new(*off_100018A70[a3], v5);
  }
  [v7 setUserCredentials:v6];

  return v7;
}

- (id)_operationForDeviceUploadRequest:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (unint64_t)[v3 requestType];
  if (v4 > 3) {
    id v6 = 0LL;
  }
  else {
    id v6 = (void *)objc_opt_new(*off_100018A90[v4], v5);
  }
  [v6 setTeslaRequest:v3];

  return v6;
}

- (void)pingWithCompletionBlock:(id)a3
{
}

- (void)_startProcessForEnrollmentRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = (void *)objc_opt_new(&OBJC_CLASS___CCDRetrieveClientCertificateOperation, v8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100009B30;
  v12[3] = &unk_100018A50;
  v14 = self;
  id v15 = v7;
  id v13 = v6;
  id v10 = v6;
  id v11 = v7;
  [v9 setCertificateRetrievalCompletionBlock:v12];
  -[CCDServer _addOperationToQueue:](self, "_addOperationToQueue:", v9);
}

- (void)_addOperationToQueue:(id)a3
{
  id v4 = a3;
  id v7 = *(os_log_s **)(DEPLogObjects(v4, v5, v6) + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Adding operation to the queue: %@",  (uint8_t *)&v9,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDServer operationQueue](self, "operationQueue"));
  [v8 addOperation:v4];
}

- (id)_operationForEnrollmentRequest:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (unint64_t)[v3 requestType];
  if (v4 > 4) {
    uint64_t v6 = 0LL;
  }
  else {
    uint64_t v6 = (void *)objc_opt_new(*off_100018AB0[v4], v5);
  }
  [v6 setTeslaRequest:v3];

  return v6;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end