@interface MCProvisioningProfileJanitor
+ (id)sharedJanitor;
- (BOOL)_updateMCTrustedCodeSigningIdentities:(id)a3 outError:(id *)a4;
- (MCProvisioningProfileJanitor)init;
- (MDMProvisioningProfileTrust)profileTrust;
- (OS_dispatch_queue)workQueue;
- (id)earliestRequiredManagedAppValidationDate;
- (void)setProfileTrust:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)updateMISTrust;
- (void)updateMISTrustAndValidateApps:(id)a3 validateManagedApps:(BOOL)a4 completion:(id)a5;
@end

@implementation MCProvisioningProfileJanitor

- (MCProvisioningProfileJanitor)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MCProvisioningProfileJanitor;
  v2 = -[MCProvisioningProfileJanitor init](&v14, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("MCProvisioningProfileJanitor work queue", v4);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc(&OBJC_CLASS___MDMProvisioningProfileTrust);
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("MIS Validate UPP queue", v9);
    v11 = -[MDMProvisioningProfileTrust initWithValidationQueue:](v7, "initWithValidationQueue:", v10);
    profileTrust = v2->_profileTrust;
    v2->_profileTrust = v11;
  }

  return v2;
}

+ (id)sharedJanitor
{
  if (qword_1000DC160 != -1) {
    dispatch_once(&qword_1000DC160, &stru_1000C3A70);
  }
  return (id)qword_1000DC158;
}

- (void)updateMISTrust
{
}

- (void)updateMISTrustAndValidateApps:(id)a3 validateManagedApps:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-UpdateMISTrustValidateApps"];
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005752C;
  block[3] = &unk_1000C3A98;
  block[4] = self;
  id v16 = v8;
  BOOL v19 = a4;
  id v17 = v10;
  id v18 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(workQueue, block);
}

- (BOOL)_updateMCTrustedCodeSigningIdentities:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v7 = MCFeatureTrustedCodeSigningIdentities;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);

  -[NSMutableDictionary MCSetUnionRestriction:values:](v6, "MCSetUnionRestriction:values:", v7, v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  uint64_t v10 = MCLocalizedFormat(@"TRUSTED_CODE_SIGNING_IDS_CLIENT_TYPE");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v16 = 0LL;
  LOBYTE(v15) = 0;
  [v9 setClientRestrictions:v6 overrideRestrictions:0 appsAndOptions:0 system:1 clientType:@"com.apple.profiled.trustedcodesigningidentities" clientUUID:@"com.apple.profiled.trustedcodesigningidentities" sender:@"MCProvisioningProfileJanitor._updateMCTrustedCodeSigningIdentities" localizedClientDescrip tion:v11 localizedWarning:0 shouldRecomputeNag:v15 outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outRecomputedNag:0 outError:&v16];
  id v12 = v16;

  if (v12)
  {
    id v13 = _MCLogObjects[11];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "MCProvisioningProfileJanitor failed to set MCFeatureTrustedCodeSigningIdentities with error: %{public}@",  buf,  0xCu);
    }

    if (a4) {
      *a4 = v12;
    }
  }

  return v12 == 0LL;
}

- (id)earliestRequiredManagedAppValidationDate
{
  if (+[MDMProvisioningProfileTrust anyUPPExistsForManagedAppSigners]( &OBJC_CLASS___MDMProvisioningProfileTrust,  "anyUPPExistsForManagedAppSigners")) {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }
  else {
    v2 = 0LL;
  }
  return v2;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (MDMProvisioningProfileTrust)profileTrust
{
  return self->_profileTrust;
}

- (void)setProfileTrust:(id)a3
{
}

- (void).cxx_destruct
{
}

@end