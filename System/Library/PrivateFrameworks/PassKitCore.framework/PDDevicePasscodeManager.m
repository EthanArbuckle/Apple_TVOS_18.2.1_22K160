@interface PDDevicePasscodeManager
- (BOOL)_currentPasscodeMeetsUpgradedPasscodePolicy:(id *)a3 isPasscodeCompliant:(BOOL *)a4;
- (BOOL)_requiresUpgradedPasscode;
- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3;
- (BOOL)currentPasscodeMeetsUpgradedPasscodePolicy:(id *)a3;
- (BOOL)interestedInAssertionOfType:(unint64_t)a3;
- (PDDevicePasscodeManager)initWithPaymentWebService:(id)a3 databaseManager:(id)a4 assertionManager:(id)a5;
- (id)_strongPasscodeRestrictions;
- (void)_enforceUpgradedPasscodePolicy:(BOOL)a3 withCompletion:(id)a4;
- (void)_updateUpgradedPasscodePolicyEnforcementWithCompletion:(id)a3;
- (void)_updateUpgradedPasscodePolicyEnforcementWithRemovalOnly:(BOOL)a3 completion:(id)a4;
- (void)assertionManager:(id)a3 didAcquireAssertion:(id)a4;
- (void)assertionManager:(id)a3 didInvalidateAssertion:(id)a4;
- (void)changePasscodeFrom:(id)a3 toPasscode:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)enforceUpgradedPasscodePolicyWithCompletion:(id)a3;
- (void)performUpgradedPasscodeEnforcementUpdateAfterBoot;
- (void)requiresUpgradedPasscodeWithCompletion:(id)a3;
- (void)updateUpgradedPasscodePolicyEnforcementWithCompletion:(id)a3;
@end

@implementation PDDevicePasscodeManager

- (PDDevicePasscodeManager)initWithPaymentWebService:(id)a3 databaseManager:(id)a4 assertionManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PDDevicePasscodeManager;
  v12 = -[PDDevicePasscodeManager init](&v21, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_databaseManager, a4);
    objc_storeStrong((id *)&v13->_paymentWebService, a3);
    objc_storeStrong((id *)&v13->_assertionManager, a5);
    -[PDAssertionManager registerObserver:](v13->_assertionManager, "registerObserver:", v13);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.passd.devicepasscodemanager.internal", 0LL);
    internalQueue = v13->_internalQueue;
    v13->_internalQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.passd.devicepasscodemanager.reply", 0LL);
    replyQueue = v13->_replyQueue;
    v13->_replyQueue = (OS_dispatch_queue *)v16;

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.passd.devicepasscodemanager.restrictions", 0LL);
    restrictionsQueue = v13->_restrictionsQueue;
    v13->_restrictionsQueue = (OS_dispatch_queue *)v18;
  }

  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDDevicePasscodeManager;
  -[PDDevicePasscodeManager dealloc](&v3, "dealloc");
}

- (void)enforceUpgradedPasscodePolicyWithCompletion:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10037CD50;
  v7[3] = &unk_1006396B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)internalQueue, v7);
}

- (void)updateUpgradedPasscodePolicyEnforcementWithCompletion:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10037CFC0;
  v7[3] = &unk_10063AC90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)internalQueue, v7);
}

- (void)requiresUpgradedPasscodeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    internalQueue = self->_internalQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10037D154;
    v7[3] = &unk_10063AC90;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)internalQueue, v7);
  }
}

- (void)performUpgradedPasscodeEnforcementUpdateAfterBoot
{
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10037D244;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async((dispatch_queue_t)internalQueue, block);
}

- (void)changePasscodeFrom:(id)a3 toPasscode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10037D4B8;
  v15[3] = &unk_10063B440;
  id v16 = v8;
  id v17 = v9;
  dispatch_queue_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)internalQueue, v15);
}

- (BOOL)interestedInAssertionOfType:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 6;
}

- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3
{
  if (a3 == 6) {
    return 1;
  }
  if (a3 == 7) {
    return !self->_hasActivePasscodeUpgradeFlow;
  }
  return 0;
}

- (void)assertionManager:(id)a3 didAcquireAssertion:(id)a4
{
  if (objc_msgSend(a4, "type", a3) == (id)7) {
    self->_hasActivePasscodeUpgradeFlow = 1;
  }
}

- (void)assertionManager:(id)a3 didInvalidateAssertion:(id)a4
{
  id v5 = a4;
  if ([v5 type] == (id)7)
  {
    self->_hasActivePasscodeUpgradeFlow = 0;
  }

  else if ([v5 type] == (id)6)
  {
    -[PDDevicePasscodeManager updateUpgradedPasscodePolicyEnforcementWithCompletion:]( self,  "updateUpgradedPasscodePolicyEnforcementWithCompletion:",  0LL);
  }
}

- (void)_updateUpgradedPasscodePolicyEnforcementWithCompletion:(id)a3
{
}

- (void)_updateUpgradedPasscodePolicyEnforcementWithRemovalOnly:(BOOL)a3 completion:(id)a4
{
  id v5 = (void (**)(id, uint64_t))a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDAssertionManager assertionsOfType:](self->_assertionManager, "assertionsOfType:", 6LL));
  id v7 = [v6 count];

  if (v7)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Skip updating passcode policy due to active assertions",  (uint8_t *)&v11,  2u);
    }

    if (v5) {
      v5[2](v5, 1LL);
    }
  }

  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10037DAE8;
    v12[3] = &unk_1006424D0;
    id v13 = v5;
    id v10 = objc_retainBlock(v12);
    if (-[PDDevicePasscodeManager _requiresUpgradedPasscode](self, "_requiresUpgradedPasscode")) {
      ((void (*)(void *, void))v10[2])(v10, 0LL);
    }
    else {
      -[PDDevicePasscodeManager _enforceUpgradedPasscodePolicy:withCompletion:]( self,  "_enforceUpgradedPasscodePolicy:withCompletion:",  0LL,  v10);
    }
  }
}

- (void)_enforceUpgradedPasscodePolicy:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  restrictionsQueue = self->_restrictionsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10037DC48;
  block[3] = &unk_100644C20;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)restrictionsQueue, block);
}

- (BOOL)currentPasscodeMeetsUpgradedPasscodePolicy:(id *)a3
{
  return -[PDDevicePasscodeManager _currentPasscodeMeetsUpgradedPasscodePolicy:isPasscodeCompliant:]( self,  "_currentPasscodeMeetsUpgradedPasscodePolicy:isPasscodeCompliant:",  a3,  0LL);
}

- (BOOL)_currentPasscodeMeetsUpgradedPasscodePolicy:(id *)a3 isPasscodeCompliant:(BOOL *)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v16 = 0LL;
  unsigned int v8 = [v7 isPasscodeCompliantWithNamedPolicy:kMCPasscodePolicyApplePayChinaKey outError:&v16];
  id v9 = v16;
  id v10 = v9;
  if (v8) {
    BOOL v11 = v9 == 0LL;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    if (a4) {
      *a4 = 1;
    }
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 clientRestrictionsForClientUUID:PKMCRestrictionClientUUIDUpgradedPasscode]);
    if (v13)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDDevicePasscodeManager _strongPasscodeRestrictions](self, "_strongPasscodeRestrictions"));
      char v12 = MCEqualDictionaries(v13, v14);
    }

    else
    {
      char v12 = 0;
    }
  }

  else
  {
    char v12 = 0;
    if (a3) {
      *a3 = v9;
    }
  }

  return v12;
}

- (BOOL)_requiresUpgradedPasscode
{
  v2 = self;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passesOfType:](self->_databaseManager, "passesOfType:", 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allObjects]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10037DFB4;
  v6[3] = &unk_10064F048;
  v6[4] = v2;
  LOBYTE(v2) = objc_msgSend(v4, "pk_containsObjectPassingTest:", v6);

  return (char)v2;
}

- (id)_strongPasscodeRestrictions
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary MCSetBoolRestriction:value:]( v2,  "MCSetBoolRestriction:value:",  MCFeatureSimplePasscodeAllowed,  0LL);
  uint64_t v3 = MCFeatureMinimumPasscodeLength;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  PKUpgradedDevicePasscodeMinimumLength));
  -[NSMutableDictionary MCSetValueRestriction:value:](v2, "MCSetValueRestriction:value:", v3, v4);

  id v5 = -[NSMutableDictionary copy](v2, "copy");
  return v5;
}

- (void).cxx_destruct
{
}

@end