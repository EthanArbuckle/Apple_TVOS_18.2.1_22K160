@interface PBOpenAppDialogsTransaction
- (BOOL)_shouldFailForChildTransaction:(id)a3;
- (BOOL)restrictionPasswordRequested;
- (BOOL)shouldContinueLaunch;
- (NSNumber)legacyGameValue;
- (NSNumber)restrictionValue;
- (NSString)launchPreventionReason;
- (PBOpenAppDialogsTransaction)initWithRequest:(id)a3;
- (PBOpenApplicationRequest)request;
- (unint64_t)signatureVersionVerificationResult;
- (void)_addCRDRestrictionDialog;
- (void)_addInitialDialogTransaction;
- (void)_addLegacyGameDialogTransaction;
- (void)_addRestrictionDialogTransaction;
- (void)_addValidateSignatureVersionDialogTransaction;
- (void)_begin;
- (void)setRestrictionPasswordRequested:(BOOL)a3;
@end

@implementation PBOpenAppDialogsTransaction

- (PBOpenAppDialogsTransaction)initWithRequest:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___PBOpenAppDialogsTransaction;
    v8 = -[PBOpenAppDialogsTransaction init](&v12, "init");
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_request, a3);
    }

    return v9;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"request != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028A50C(a2, (uint64_t)self, (uint64_t)v11);
    }
    result = (PBOpenAppDialogsTransaction *)_bs_set_crash_log_message([v11 UTF8String]);
    __break(0);
  }

  return result;
}

- (void)_begin
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBOpenAppDialogsTransaction;
  -[PBOpenAppDialogsTransaction _begin](&v3, "_begin");
  -[PBOpenAppDialogsTransaction _addInitialDialogTransaction](self, "_addInitialDialogTransaction");
}

- (BOOL)_shouldFailForChildTransaction:(id)a3
{
  return 1;
}

- (BOOL)shouldContinueLaunch
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenAppDialogsTransaction launchPreventionReason](self, "launchPreventionReason"));
  BOOL v3 = v2 == 0LL;

  return v3;
}

- (NSString)launchPreventionReason
{
  if (self->_signatureVersionVerificationResult != 1) {
    return (NSString *)@"signature version";
  }
  result = (NSString *)&self->_restrictionValue->super.super.isa;
  if (result)
  {
    if (-[NSString unsignedIntegerValue](result, "unsignedIntegerValue")) {
      return (NSString *)@"content restrictions";
    }
    else {
      return 0LL;
    }
  }

  return result;
}

- (void)_addInitialDialogTransaction
{
}

- (void)_addValidateSignatureVersionDialogTransaction
{
  BOOL v3 = -[PBOpenAppSignatureVersionDialogTransaction initWithRequest:]( objc_alloc(&OBJC_CLASS___PBOpenAppSignatureVersionDialogTransaction),  "initWithRequest:",  self->_request);
  objc_initWeak(&location, self);
  v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472LL;
  id v6 = sub_100199B88;
  v7 = &unk_1003D0A28;
  objc_copyWeak(&v8, &location);
  -[PBOpenAppSignatureVersionDialogTransaction registerBlockObserver:](v3, "registerBlockObserver:", &v4);
  -[PBOpenAppDialogsTransaction addChildTransaction:](self, "addChildTransaction:", v3, v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_addRestrictionDialogTransaction
{
  BOOL v3 = -[PBOpenAppRestrictionTransaction initWithRequest:]( objc_alloc(&OBJC_CLASS___PBOpenAppRestrictionTransaction),  "initWithRequest:",  self->_request);
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100199DA4;
  v4[3] = &unk_1003DAE80;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  -[PBOpenAppRestrictionTransaction registerBlockObserver:](v3, "registerBlockObserver:", v4);
  -[PBOpenAppDialogsTransaction addChildTransaction:](self, "addChildTransaction:", v3);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_addLegacyGameDialogTransaction
{
  BOOL v3 = -[PBOpenAppLegacyGameDialogTransaction initWithRequest:]( objc_alloc(&OBJC_CLASS___PBOpenAppLegacyGameDialogTransaction),  "initWithRequest:",  self->_request);
  objc_initWeak(&location, self);
  v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472LL;
  id v6 = sub_10019A014;
  v7 = &unk_1003D0A28;
  objc_copyWeak(&v8, &location);
  -[PBOpenAppLegacyGameDialogTransaction registerBlockObserver:](v3, "registerBlockObserver:", &v4);
  -[PBOpenAppDialogsTransaction addChildTransaction:](self, "addChildTransaction:", v3, v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_addCRDRestrictionDialog
{
  if (self->_restrictionPasswordRequested)
  {
    -[PBOpenAppDialogsTransaction _addLegacyGameDialogTransaction](self, "_addLegacyGameDialogTransaction");
  }

  else
  {
    -[PBOpenAppDialogsTransaction addMilestone:](self, "addMilestone:", @"ConferenceRoomDisplayRestrictedDialog");
    BOOL v3 = -[PBConferenceRoomDisplayOpenAppRestrictionTransaction initWithRequest:]( objc_alloc(&OBJC_CLASS___PBConferenceRoomDisplayOpenAppRestrictionTransaction),  "initWithRequest:",  self->_request);
    objc_initWeak(&location, self);
    v4 = _NSConcreteStackBlock;
    uint64_t v5 = 3221225472LL;
    id v6 = sub_10019A244;
    v7 = &unk_1003D0A28;
    objc_copyWeak(&v8, &location);
    -[PBConferenceRoomDisplayOpenAppRestrictionTransaction registerBlockObserver:](v3, "registerBlockObserver:", &v4);
    -[PBOpenAppDialogsTransaction addChildTransaction:](self, "addChildTransaction:", v3, v4, v5, v6, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

- (PBOpenApplicationRequest)request
{
  return self->_request;
}

- (NSNumber)restrictionValue
{
  return self->_restrictionValue;
}

- (NSNumber)legacyGameValue
{
  return self->_legacyGameValue;
}

- (unint64_t)signatureVersionVerificationResult
{
  return self->_signatureVersionVerificationResult;
}

- (BOOL)restrictionPasswordRequested
{
  return self->_restrictionPasswordRequested;
}

- (void)setRestrictionPasswordRequested:(BOOL)a3
{
  self->_restrictionPasswordRequested = a3;
}

- (void).cxx_destruct
{
}

@end