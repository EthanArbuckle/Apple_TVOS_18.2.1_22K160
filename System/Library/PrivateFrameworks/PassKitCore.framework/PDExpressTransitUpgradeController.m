@interface PDExpressTransitUpgradeController
- (BOOL)hasAttemptedDefaultPassExpressUpgrade;
- (BOOL)isPassUpgradeableForExpress:(id)a3;
- (PDExpressTransitUpgradeController)initWithPaymentWebServiceCoordinator:(id)a3 databaseManager:(id)a4 expressPassManager:(id)a5 notificationManager:(id)a6 assertionManager:(id)a7 passUpgradeController:(id)a8;
- (id)_eligibleUpgradeRequestsForPass:(id)a3;
- (id)upgradeablePaymentApplicationIdentifiersForPass:(id)a3;
- (void)_upgradePaymentPass:(id)a3 withRequest:(id)a4 completionHandler:(id)a5;
- (void)recordExpressUpgradeAttemptStatus:(int64_t)a3;
- (void)resetDefaultPassExpressUpgradeAttempt;
- (void)upgradePass:(id)a3 completionHandler:(id)a4;
@end

@implementation PDExpressTransitUpgradeController

- (PDExpressTransitUpgradeController)initWithPaymentWebServiceCoordinator:(id)a3 databaseManager:(id)a4 expressPassManager:(id)a5 notificationManager:(id)a6 assertionManager:(id)a7 passUpgradeController:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___PDExpressTransitUpgradeController;
  v18 = -[PDExpressTransitUpgradeController init](&v24, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_paymentWebServiceCoordinator, a3);
    objc_storeStrong((id *)&v19->_databaseManager, a4);
    objc_storeStrong((id *)&v19->_expressPassManager, a5);
    objc_storeStrong((id *)&v19->_userNotificationManager, a6);
    objc_storeStrong((id *)&v19->_passUpgradeController, a8);
    objc_storeStrong((id *)&v19->_assertionManager, a7);
  }

  return v19;
}

- (BOOL)hasAttemptedDefaultPassExpressUpgrade
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PKPassPreferencesManager sharedInstance](&OBJC_CLASS___PKPassPreferencesManager, "sharedInstance"));
  unsigned __int8 v3 = [v2 hasDoneExpressUpgrade];

  return v3;
}

- (void)resetDefaultPassExpressUpgradeAttempt
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[PKPassPreferencesManager sharedInstance](&OBJC_CLASS___PKPassPreferencesManager, "sharedInstance"));
  [v2 setHasDoneExpressUpgrade:0];
}

- (void)recordExpressUpgradeAttemptStatus:(int64_t)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    int64_t v8 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Marking express upgrade attempt status as %ld",  (uint8_t *)&v7,  0xCu);
  }

  if (a3 == 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[PKPassPreferencesManager sharedInstance](&OBJC_CLASS___PKPassPreferencesManager, "sharedInstance"));
    [v6 setHasDoneExpressUpgrade:1];
  }

- (BOOL)isPassUpgradeableForExpress:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( -[PDExpressTransitUpgradeController _eligibleUpgradeRequestsForPass:]( self,  "_eligibleUpgradeRequestsForPass:",  a3));
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)upgradeablePaymentApplicationIdentifiersForPass:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( -[PDExpressTransitUpgradeController _eligibleUpgradeRequestsForPass:]( self,  "_eligibleUpgradeRequestsForPass:",  a3));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 paymentApplicationIdentifiers]);

  return v5;
}

- (void)upgradePass:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472LL;
  id v21 = sub_1000F09A0;
  id v22 = &unk_1006438B8;
  id v23 = self;
  id v24 = a4;
  id v7 = v24;
  int64_t v8 = objc_retainBlock(&v19);
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDExpressTransitUpgradeController _eligibleUpgradeRequestsForPass:]( self,  "_eligibleUpgradeRequestsForPass:",  v6,  v19,  v20,  v21,  v22,  v23,  v24));
    if ((unint64_t)[v9 count] < 2)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
      if (v15)
      {
        -[PDExpressTransitUpgradeController _upgradePaymentPass:withRequest:completionHandler:]( self,  "_upgradePaymentPass:withRequest:completionHandler:",  v6,  v15,  v8);
      }

      else
      {
        uint64_t Object = PKLogFacilityTypeGetObject(6LL);
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
          *(_DWORD *)buf = 138412290;
          v26 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Pass has no express upgrade: %@",  buf,  0xCu);
        }

        ((void (*)(void ***, id, uint64_t))v8[2])(v8, v6, 1LL);
      }
    }

    else
    {
      uint64_t v10 = PKLogFacilityTypeGetObject(6LL);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
        *(_DWORD *)buf = 138412290;
        v26 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Pass has multiple eligible upgrades: %@",  buf,  0xCu);
      }

      ((void (*)(void ***, id, uint64_t))v8[2])(v8, v6, 3LL);
    }
  }

  else
  {
    uint64_t v13 = PKLogFacilityTypeGetObject(6LL);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Payment pass is nil, skipping upgrade.",  buf,  2u);
    }

    ((void (*)(void ***, void, uint64_t))v8[2])(v8, 0LL, 1LL);
  }
}

- (id)_eligibleUpgradeRequestsForPass:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[PKOSVersionRequirement fromDeviceVersion](&OBJC_CLASS___PKOSVersionRequirement, "fromDeviceVersion"));
  uint64_t v5 = PKDeviceClass();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PKSecureElement secureElementIdentifiers](&OBJC_CLASS___PKSecureElement, "secureElementIdentifiers"));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v3 eligibleExpressUpgradeRequestsForDeviceClass:v6 deviceSEIDs:v7 deviceVersion:v4 technologyTest:&stru_1006438F8]);

  return v8;
}

- (void)_upgradePaymentPass:(id)a3 withRequest:(id)a4 completionHandler:(id)a5
{
  id v24 = a3;
  id v23 = a4;
  id v8 = a5;
  objc_initWeak(location, self);
  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x3032000000LL;
  v50 = sub_1000F0E18;
  v51 = sub_1000F0E28;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v52 = (id)objc_claimAutoreleasedReturnValue([v9 UUIDString]);

  uint64_t v10 = dispatch_queue_create("com.apple.passd.pdexpresstransitupgradecontroller.assertionqueue", 0LL);
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  v44 = sub_1000F0E18;
  v45 = sub_1000F0E28;
  dispatch_source_t v46 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v10);
  v11 = (dispatch_source_s *)v42[5];
  dispatch_time_t v12 = dispatch_time(0LL, 300000000000LL);
  dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  uint64_t v13 = (dispatch_source_s *)v42[5];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000F0E30;
  handler[3] = &unk_100643920;
  objc_copyWeak(&v40, location);
  handler[4] = &v47;
  handler[5] = &v41;
  dispatch_source_set_event_handler(v13, handler);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1000F0EC4;
  v33[3] = &unk_100643970;
  id v22 = v8;
  id v35 = v22;
  v14 = v10;
  v34 = v14;
  v36 = &v41;
  objc_copyWeak(&v38, location);
  v37 = &v47;
  id v15 = objc_retainBlock(v33);
  assertionManager = self->_assertionManager;
  uint64_t v17 = v48[5];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000F1000;
  v25[3] = &unk_100643A30;
  v30 = &v41;
  v25[4] = self;
  id v18 = v23;
  id v26 = v18;
  id v19 = v24;
  id v27 = v19;
  objc_copyWeak(&v32, location);
  uint64_t v20 = v15;
  id v29 = v20;
  id v21 = v14;
  v28 = v21;
  v31 = &v47;
  -[PDAssertionManager acquireAssertionOfType:withIdentifier:reason:handler:]( assertionManager,  "acquireAssertionOfType:withIdentifier:reason:handler:",  1LL,  v17,  @"Pass Upgrade Request",  v25);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v38);

  objc_destroyWeak(&v40);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  objc_destroyWeak(location);
}

- (void).cxx_destruct
{
}

@end