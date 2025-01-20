@interface PDTrustedDeviceEnrollmentInfoProvider
- (PDPaymentWebServiceCoordinator)paymentWebServiceCoordinator;
- (PDTrustedDeviceEnrollmentInfoProvider)initWithConnection:(id)a3;
- (PDTrustedDeviceEnrollmentInfoProvider)initWithConnection:(id)a3 server:(id)a4;
- (void)localTrustedDeviceEnrollmentSignatureWithAccountDSID:(id)a3 sessionData:(id)a4 handler:(id)a5;
- (void)remoteTrustedDeviceEnrollmentSignatureWithAccountDSID:(id)a3 sessionData:(id)a4 handler:(id)a5;
- (void)setPaymentWebServiceCoordinator:(id)a3;
- (void)trustedDeviceEnrollmentInfoWithHandler:(id)a3;
- (void)trustedDeviceEnrollmentSignatureForDevice:(unint64_t)a3 accountDSID:(id)a4 sessionData:(id)a5 handler:(id)a6;
@end

@implementation PDTrustedDeviceEnrollmentInfoProvider

- (PDTrustedDeviceEnrollmentInfoProvider)initWithConnection:(id)a3
{
  return 0LL;
}

- (PDTrustedDeviceEnrollmentInfoProvider)initWithConnection:(id)a3 server:(id)a4
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PDTrustedDeviceEnrollmentInfoProvider;
  v6 = -[PDTrustedDeviceEnrollmentInfoProvider initWithConnection:](&v16, "initWithConnection:", v5);
  if (v6)
  {
    v7 = -[PKEntitlementWhitelist initWithConnection:]( objc_alloc(&OBJC_CLASS___PKEntitlementWhitelist),  "initWithConnection:",  v5);
    whitelist = v6->_whitelist;
    v6->_whitelist = v7;

    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.passd.trusted-device-enrollment-info-provider", v10);
    processingQueue = v6->_processingQueue;
    v6->_processingQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = PDTrustedDeviceEnrollmentInfoProviderExportedInterface([v5 setRemoteObjectInterface:0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v5 setExportedInterface:v14];

    [v5 setExportedObject:v6];
  }

  return v6;
}

- (void)trustedDeviceEnrollmentInfoWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (-[PKEntitlementWhitelist trustedDeviceEnrollmentInfo]( self->_whitelist,  "trustedDeviceEnrollmentInfo"))
    {
      processingQueue = self->_processingQueue;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_1003AA578;
      v8[3] = &unk_10063AC90;
      v8[4] = self;
      id v9 = v4;
      dispatch_async((dispatch_queue_t)processingQueue, v8);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        dispatch_queue_t v11 = "-[PDTrustedDeviceEnrollmentInfoProvider trustedDeviceEnrollmentInfoWithHandler:]";
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
      }

      (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
    }
  }
}

- (void)trustedDeviceEnrollmentSignatureForDevice:(unint64_t)a3 accountDSID:(id)a4 sessionData:(id)a5 handler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    if (-[PKEntitlementWhitelist trustedDeviceEnrollmentInfo]( self->_whitelist,  "trustedDeviceEnrollmentInfo"))
    {
      processingQueue = self->_processingQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1003AA830;
      block[3] = &unk_10063B150;
      unint64_t v22 = a3;
      block[4] = self;
      id v19 = v10;
      id v20 = v11;
      id v21 = v12;
      dispatch_async((dispatch_queue_t)processingQueue, block);
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[PDTrustedDeviceEnrollmentInfoProvider trustedDeviceEnrollmentSignatureForDevice:accountDSID:sessionData:handler:]";
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  buf,  0xCu);
      }

      NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
      v24 = @"Missing entitlement for Trusted Device Enrollment info.";
      objc_super v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  4LL,  v16));
      (*((void (**)(id, void, void, void, void *))v12 + 2))(v12, 0LL, 0LL, 0LL, v17);
    }
  }
}

- (void)localTrustedDeviceEnrollmentSignatureWithAccountDSID:(id)a3 sessionData:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebService]( self->_paymentWebServiceCoordinator,  "sharedWebService"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 targetDevice]);
  if ((objc_opt_respondsToSelector(v12, "trustedDeviceEnrollmentInfoForWebService:") & 1) != 0
    && (objc_opt_respondsToSelector(v12, "paymentWebService:signData:signatureEntanglementMode:withCompletionHandler:") & 1) != 0)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 trustedDeviceEnrollmentInfoForWebService:v11]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceUDID]);
    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v14 dataUsingEncoding:4]);
    -[NSMutableData appendData:](v15, "appendData:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue([v8 dataUsingEncoding:4]);
    -[NSMutableData appendData:](v15, "appendData:", v17);

    -[NSMutableData appendData:](v15, "appendData:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableData SHA256Hash](v15, "SHA256Hash"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1003AAAD0;
    v19[3] = &unk_10065ACD0;
    id v20 = v10;
    [v12 paymentWebService:v11 signData:v18 signatureEntanglementMode:0 withCompletionHandler:v19];
  }

  else
  {
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    unint64_t v22 = @"Error connecting to target device.";
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  -1LL,  v13));
    (*((void (**)(id, void, void, void, void *))v10 + 2))(v10, 0LL, 0LL, 0LL, v14);
  }
}

- (void)remoteTrustedDeviceEnrollmentSignatureWithAccountDSID:(id)a3 sessionData:(id)a4 handler:(id)a5
{
  NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
  id v10 = @"Error connecting to remote target device.";
  id v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPassKitErrorDomain,  -1LL,  v7));
  (*((void (**)(id, void, void, void, void *))a5 + 2))(v6, 0LL, 0LL, 0LL, v8);
}

- (PDPaymentWebServiceCoordinator)paymentWebServiceCoordinator
{
  return self->_paymentWebServiceCoordinator;
}

- (void)setPaymentWebServiceCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end