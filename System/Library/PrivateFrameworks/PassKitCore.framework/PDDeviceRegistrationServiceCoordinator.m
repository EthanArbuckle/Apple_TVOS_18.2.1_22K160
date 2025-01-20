@interface PDDeviceRegistrationServiceCoordinator
- (PDDeviceRegistrationServiceCoordinator)init;
- (PDDeviceRegistrationServiceCoordinator)initWithPaymentWebServiceCoordinator:(id)a3 peerPaymentWebServiceCoordinator:(id)a4;
- (PDPaymentWebServiceCoordinator)paymentWebServiceCoordinator;
- (PDPeerPaymentWebServiceCoordinator)peerPaymentWebServiceCoordinator;
- (void)dealloc;
- (void)notePasscodeChanged;
- (void)performDeviceRegistrationForReason:(id)a3 brokerURL:(id)a4 action:(int64_t)a5 forceApplePayRegister:(BOOL)a6 forcePeerPaymentRegister:(BOOL)a7 completion:(id)a8;
- (void)performRegistrationForMemberOfRegions:(id)a3 force:(BOOL)a4 withReason:(id)a5 completion:(id)a6;
- (void)performRegistrationForRegion:(id)a3 force:(BOOL)a4 withReason:(id)a5 completion:(id)a6;
@end

@implementation PDDeviceRegistrationServiceCoordinator

- (PDDeviceRegistrationServiceCoordinator)init
{
  return -[PDDeviceRegistrationServiceCoordinator initWithPaymentWebServiceCoordinator:peerPaymentWebServiceCoordinator:]( self,  "initWithPaymentWebServiceCoordinator:peerPaymentWebServiceCoordinator:",  0LL,  0LL);
}

- (PDDeviceRegistrationServiceCoordinator)initWithPaymentWebServiceCoordinator:(id)a3 peerPaymentWebServiceCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PDDeviceRegistrationServiceCoordinator;
  v9 = -[PDDeviceRegistrationServiceCoordinator init](&v20, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paymentWebServiceCoordinator, a3);
    -[PDPaymentWebServiceCoordinator registerObserver:](v10->_paymentWebServiceCoordinator, "registerObserver:", v10);
    objc_storeStrong((id *)&v10->_peerPaymentWebServiceCoordinator, a4);
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.passd.registration.service", v12);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    registrationTasks = v10->_registrationTasks;
    v10->_registrationTasks = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue([v7 sharedWebService]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 _appleAccountInformation]);
  }

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDDeviceRegistrationServiceCoordinator;
  -[PDDeviceRegistrationServiceCoordinator dealloc](&v3, "dealloc");
}

- (void)notePasscodeChanged
{
  if (PKPasscodeEnabled(self, a2))
  {
    unsigned __int8 v3 = +[PDSetupAssistantCompleteMonitor hasCompletedSetupAssistant]( &OBJC_CLASS___PDSetupAssistantCompleteMonitor,  "hasCompletedSetupAssistant");
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if ((v3 & 1) != 0)
    {
      if (v6)
      {
        *(_WORD *)v9 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "RegistrationService: Passcode changed and device has passcode. Attempting to register for Apple Pay.",  v9,  2u);
      }

      -[PDDeviceRegistrationServiceCoordinator performDeviceRegistrationForReason:brokerURL:action:forceApplePayRegister:forcePeerPaymentRegister:completion:]( self,  "performDeviceRegistrationForReason:brokerURL:action:forceApplePayRegister:forcePeerPaymentRegister:completion:",  @"passcode changed",  0LL,  0LL,  0LL,  0LL,  0LL);
    }

    else
    {
      if (v6)
      {
        *(_WORD *)v10 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "RegistrationService: Passcode changed but still in buddy - skipping registration",  v10,  2u);
      }
    }
  }

  else
  {
    uint64_t v7 = PKLogFacilityTypeGetObject(6LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "RegistrationService: Passcode changed but disabled - skipping registration",  buf,  2u);
    }
  }

- (void)performRegistrationForMemberOfRegions:(id)a3 force:(BOOL)a4 withReason:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000B718;
  block[3] = &unk_100639508;
  id v18 = v11;
  id v19 = v10;
  BOOL v22 = a4;
  objc_super v20 = self;
  id v21 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)performRegistrationForRegion:(id)a3 force:(BOOL)a4 withReason:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000B908;
  block[3] = &unk_100639508;
  id v18 = v11;
  id v19 = v10;
  BOOL v22 = a4;
  objc_super v20 = self;
  id v21 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)performDeviceRegistrationForReason:(id)a3 brokerURL:(id)a4 action:(int64_t)a5 forceApplePayRegister:(BOOL)a6 forcePeerPaymentRegister:(BOOL)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  workQueue = self->_workQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10000BA64;
  v21[3] = &unk_100639530;
  id v24 = v16;
  int64_t v25 = a5;
  v21[4] = self;
  id v22 = v15;
  BOOL v26 = a6;
  BOOL v27 = a7;
  id v23 = v14;
  id v18 = v14;
  id v19 = v16;
  id v20 = v15;
  dispatch_async((dispatch_queue_t)workQueue, v21);
}

- (PDPaymentWebServiceCoordinator)paymentWebServiceCoordinator
{
  return self->_paymentWebServiceCoordinator;
}

- (PDPeerPaymentWebServiceCoordinator)peerPaymentWebServiceCoordinator
{
  return self->_peerPaymentWebServiceCoordinator;
}

- (void).cxx_destruct
{
}

@end