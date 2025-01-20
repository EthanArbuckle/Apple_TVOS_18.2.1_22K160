@interface PDDeviceRegistrationService
- (PDDeviceRegistrationService)initWithConnection:(id)a3;
- (PDDeviceRegistrationService)initWithConnection:(id)a3 server:(id)a4;
- (PDDeviceRegistrationServiceCoordinator)deviceRegistrationServiceCoordinator;
- (void)performDeviceRegistrationReturningContextForReason:(id)a3 brokerURL:(id)a4 actionType:(int64_t)a5 completion:(id)a6;
- (void)performRegistrationForMemberOfRegions:(id)a3 withReason:(id)a4 completion:(id)a5;
- (void)performRegistrationForRegion:(id)a3 withReason:(id)a4 completion:(id)a5;
- (void)setDeviceRegistrationServiceCoordinator:(id)a3;
@end

@implementation PDDeviceRegistrationService

- (PDDeviceRegistrationService)initWithConnection:(id)a3
{
  return 0LL;
}

- (PDDeviceRegistrationService)initWithConnection:(id)a3 server:(id)a4
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PDDeviceRegistrationService;
  v6 = -[PDDeviceRegistrationService initWithConnection:](&v14, "initWithConnection:", v5);
  if (v6)
  {
    v7 = -[PKEntitlementWhitelist initWithConnection:]( objc_alloc(&OBJC_CLASS___PKEntitlementWhitelist),  "initWithConnection:",  v5);
    whitelist = v6->_whitelist;
    v6->_whitelist = v7;

    uint64_t v9 = PKDeviceRegistrationServiceInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    [v5 setRemoteObjectInterface:v10];

    uint64_t v11 = PDDeviceRegistrationServiceInterface();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v5 setExportedInterface:v12];

    [v5 setExportedObject:v6];
  }

  return v6;
}

- (void)performRegistrationForMemberOfRegions:(id)a3 withReason:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315394;
      v17 = "-[PDDeviceRegistrationService performRegistrationForMemberOfRegions:withReason:completion:]";
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "RegistrationService: %s called with reason: %@",  (uint8_t *)&v16,  0x16u);
    }

    deviceRegistrationServiceCoordinator = self->_deviceRegistrationServiceCoordinator;
    if (deviceRegistrationServiceCoordinator)
    {
      -[PDDeviceRegistrationServiceCoordinator performRegistrationForMemberOfRegions:force:withReason:completion:]( deviceRegistrationServiceCoordinator,  "performRegistrationForMemberOfRegions:force:withReason:completion:",  v8,  0LL,  v9,  v10);
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v14 = PKLogFacilityTypeGetObject(0LL);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      v17 = "-[PDDeviceRegistrationService performRegistrationForMemberOfRegions:withReason:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v16,  0xCu);
    }
  }

  if (v10) {
    (*((void (**)(id, uint64_t, void, void))v10 + 2))(v10, 1LL, 0LL, 0LL);
  }
LABEL_11:
}

- (void)performRegistrationForRegion:(id)a3 withReason:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315394;
      v17 = "-[PDDeviceRegistrationService performRegistrationForRegion:withReason:completion:]";
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "RegistrationService: %s called with reason: %@",  (uint8_t *)&v16,  0x16u);
    }

    deviceRegistrationServiceCoordinator = self->_deviceRegistrationServiceCoordinator;
    if (deviceRegistrationServiceCoordinator)
    {
      -[PDDeviceRegistrationServiceCoordinator performRegistrationForRegion:force:withReason:completion:]( deviceRegistrationServiceCoordinator,  "performRegistrationForRegion:force:withReason:completion:",  v8,  0LL,  v9,  v10);
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v14 = PKLogFacilityTypeGetObject(0LL);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      v17 = "-[PDDeviceRegistrationService performRegistrationForRegion:withReason:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v16,  0xCu);
    }
  }

  if (v10) {
    (*((void (**)(id, uint64_t, void, void))v10 + 2))(v10, 1LL, 0LL, 0LL);
  }
LABEL_11:
}

- (void)performDeviceRegistrationReturningContextForReason:(id)a3 brokerURL:(id)a4 actionType:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess"))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315650;
      id v19 = "-[PDDeviceRegistrationService performDeviceRegistrationReturningContextForReason:brokerURL:actionType:completion:]";
      __int16 v20 = 2112;
      id v21 = v10;
      __int16 v22 = 2048;
      int64_t v23 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "RegistrationService: %s called with reason: %@ type: %lu",  (uint8_t *)&v18,  0x20u);
    }

    deviceRegistrationServiceCoordinator = self->_deviceRegistrationServiceCoordinator;
    if (deviceRegistrationServiceCoordinator)
    {
      -[PDDeviceRegistrationServiceCoordinator performDeviceRegistrationForReason:brokerURL:action:forceApplePayRegister:forcePeerPaymentRegister:completion:]( deviceRegistrationServiceCoordinator,  "performDeviceRegistrationForReason:brokerURL:action:forceApplePayRegister:forcePeerPaymentRegister:completion:",  v10,  v11,  a5,  v11 != 0LL,  0LL,  v12);
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v16 = PKLogFacilityTypeGetObject(0LL);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      id v19 = "-[PDDeviceRegistrationService performDeviceRegistrationReturningContextForReason:brokerURL:actionType:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled for method: %s",  (uint8_t *)&v18,  0xCu);
    }
  }

  if (v12) {
    (*((void (**)(id, uint64_t, void, void))v12 + 2))(v12, 1LL, 0LL, 0LL);
  }
LABEL_11:
}

- (PDDeviceRegistrationServiceCoordinator)deviceRegistrationServiceCoordinator
{
  return self->_deviceRegistrationServiceCoordinator;
}

- (void)setDeviceRegistrationServiceCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end