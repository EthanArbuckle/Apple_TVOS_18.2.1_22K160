@interface PBOpenAppSignatureVersionDialogTransaction
+ (BOOL)_canRepairApplication:(id)a3;
+ (BOOL)_needsUIForApplicationInfo:(id)a3;
- (BOOL)canRepairViaCurrentlyAvailableUpdate;
- (PBOpenAppSignatureVersionDialogTransaction)initWithRequest:(id)a3;
- (PBOpenApplicationRequest)request;
- (id)_alertBody;
- (id)_alertDefaultButtonTitle;
- (id)_alertSecondaryButtonTitle;
- (id)_alertTitleWithLocalizedApplicationName:(id)a3;
- (unint64_t)result;
- (void)_begin;
- (void)_performApplicationRepair;
@end

@implementation PBOpenAppSignatureVersionDialogTransaction

- (PBOpenAppSignatureVersionDialogTransaction)initWithRequest:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBOpenAppSignatureVersionDialogTransaction;
  v6 = -[PBOpenAppSignatureVersionDialogTransaction init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest toAppInfo](v7->_request, "toAppInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 applicationInfo]);

    unint64_t v10 = [(id)objc_opt_class(v7) _needsUIForApplicationInfo:v9] ^ 1;
    v7->_result = v10;
    if ((v10 & 1) != 0) {
      unsigned __int8 v11 = 0;
    }
    else {
      unsigned __int8 v11 = [(id)objc_opt_class(v7) _canRepairApplication:v9];
    }
    v7->_canRepairViaCurrentlyAvailableUpdate = v11;
  }

  return v7;
}

- (void)_begin
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PBOpenAppSignatureVersionDialogTransaction;
  -[PBOpenAppSignatureVersionDialogTransaction _begin](&v23, "_begin");
  if (self->_result != 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest toAppInfo](self->_request, "toAppInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 applicationInfo]);

    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedName]);
    -[PBOpenAppSignatureVersionDialogTransaction addMilestone:](self, "addMilestone:", @"UserNotification");
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[PBOpenAppSignatureVersionDialogTransaction _alertTitleWithLocalizedApplicationName:]( self,  "_alertTitleWithLocalizedApplicationName:",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenAppSignatureVersionDialogTransaction _alertBody](self, "_alertBody"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[PBOpenAppSignatureVersionDialogTransaction _alertDefaultButtonTitle]( self,  "_alertDefaultButtonTitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[PBOpenAppSignatureVersionDialogTransaction _alertSecondaryButtonTitle]( self,  "_alertSecondaryButtonTitle"));
    objc_initWeak(&location, self);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    unsigned __int8 v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100169504;
    v16[3] = &unk_1003D9C60;
    id v17 = v6;
    id v18 = v7;
    id v19 = v8;
    id v20 = v9;
    id v12 = v9;
    id v13 = v8;
    id v14 = v7;
    id v15 = v6;
    objc_copyWeak(&v21, &location);
    dispatch_async(v11, v16);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

+ (BOOL)_needsUIForApplicationInfo:(id)a3
{
  return [a3 unauthoritativeTrustState] == (id)9;
}

+ (BOOL)_canRepairApplication:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  v6 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( v4,  "initWithBundleIdentifier:allowPlaceholder:error:",  v5,  0LL,  0LL);

  if (v6) {
    BOOL v7 = -[LSApplicationRecord updateAvailability](v6, "updateAvailability") == (id)1;
  }
  else {
    BOOL v7 = 0;
  }
  unsigned int v8 = [v3 isProvisioningProfileValidated];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v10 = [v9 isOnDeviceAppInstallationAllowed];

  unsigned int v11 = [v3 isLicensedToDevice];
  id v12 = sub_100083CA8();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  int v14 = v8 ^ 1;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v16[0] = 67109888;
    v16[1] = v7;
    __int16 v17 = 1024;
    int v18 = v14;
    __int16 v19 = 1024;
    unsigned int v20 = v10;
    __int16 v21 = 1024;
    unsigned int v22 = v11;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Signature error: hasUpdateAvailable: %{BOOL}d, isAppStoreApp: %{BOOL}d, isAppInstallationAllowed: %{BOOL}d, isAppL icensedToDevice: %{BOOL}d",  (uint8_t *)v16,  0x1Au);
  }

  return v14 & v10 & ~(_BYTE)v11 & v7;
}

- (void)_performApplicationRepair
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest toAppInfo](self->_request, "toAppInfo"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 applicationInfo]);

  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  id v5 = sub_100083CA8();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[Signature Repair] [%{public}@] Attempting to upgrade repair",  buf,  0xCu);
  }

  id v7 = [[ASDRepairOptions alloc] initWithBundleID:v4];
  [v7 setExitReason:32];
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[ASDRepairService defaultService](&OBJC_CLASS___ASDRepairService, "defaultService"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100169938;
  v10[3] = &unk_1003D9C88;
  id v11 = v4;
  id v9 = v4;
  [v8 repairAppWithOptions:v7 replyHandler:v10];
}

- (id)_alertTitleWithLocalizedApplicationName:(id)a3
{
  id v4 = a3;
  if (-[PBOpenAppSignatureVersionDialogTransaction canRepairViaCurrentlyAvailableUpdate]( self,  "canRepairViaCurrentlyAvailableUpdate"))
  {
    id v5 = @"SIGNATURE_VERSION_UNSUPPORTED_REPAIR_TITLE";
  }

  else
  {
    id v5 = @"SIGNATURE_VERSION_UNSUPPORTED_ERROR_TITLE";
  }

  id v6 = sub_1001C307C(v5, 0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v7, v4));

  return v8;
}

- (id)_alertBody
{
  if (-[PBOpenAppSignatureVersionDialogTransaction canRepairViaCurrentlyAvailableUpdate]( self,  "canRepairViaCurrentlyAvailableUpdate"))
  {
    v2 = @"SIGNATURE_VERSION_UNSUPPORTED_REPAIR_BODY";
  }

  else
  {
    v2 = @"SIGNATURE_VERSION_UNSUPPORTED_ERROR_BODY";
  }

  id v3 = sub_1001C307C(v2, 0LL);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)_alertDefaultButtonTitle
{
  if (-[PBOpenAppSignatureVersionDialogTransaction canRepairViaCurrentlyAvailableUpdate]( self,  "canRepairViaCurrentlyAvailableUpdate"))
  {
    v2 = @"SIGNATURE_VERSION_UNSUPPORTED_REPAIR_ACKNOWLEDGE";
  }

  else
  {
    v2 = @"SIGNATURE_VERSION_UNSUPPORTED_ERROR_ACKNOWLEDGE";
  }

  id v3 = sub_1001C307C(v2, 0LL);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)_alertSecondaryButtonTitle
{
  if (-[PBOpenAppSignatureVersionDialogTransaction canRepairViaCurrentlyAvailableUpdate]( self,  "canRepairViaCurrentlyAvailableUpdate"))
  {
    id v2 = sub_1001C307C(@"SIGNATURE_VERSION_UNSUPPORTED_REPAIR_CANCEL", 0LL);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

- (unint64_t)result
{
  return self->_result;
}

- (PBOpenApplicationRequest)request
{
  return self->_request;
}

- (BOOL)canRepairViaCurrentlyAvailableUpdate
{
  return self->_canRepairViaCurrentlyAvailableUpdate;
}

- (void).cxx_destruct
{
}

@end