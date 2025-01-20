@interface MRDLockScreenAssertion
- (MRDLockScreenAssertion)init;
- (MROSTransaction)transaction;
- (SBSLockScreenContentAssertion)assertion;
- (void)createAssertion;
- (void)dealloc;
- (void)delayCreateAssertion;
- (void)setAssertion:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation MRDLockScreenAssertion

- (MRDLockScreenAssertion)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDLockScreenAssertion;
  v2 = -[MRDLockScreenAssertion init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[MRDLockScreenAssertion createAssertion](v2, "createAssertion");
  }
  return v3;
}

- (void)setAssertion:(id)a3
{
  v4 = (SBSLockScreenContentAssertion *)a3;
  uint64_t v6 = _MRLogForCategory(0LL, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDLockScreenController] Activating lockScreenAssertion",  buf,  2u);
    }

    v9 = -[MROSTransaction initWithName:]( objc_alloc(&OBJC_CLASS___MROSTransaction),  "initWithName:",  @"com.apple.mediaremoted.LockScreen");
    transaction = self->_transaction;
    self->_transaction = v9;

    MRRegisterTransaction(self->_transaction);
  }

  else
  {
    if (v8)
    {
      *(_WORD *)v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDLockScreenController] Deactivating lockScreenAssertion",  v13,  2u);
    }

    v11 = self->_transaction;
    self->_transaction = 0LL;
  }

  assertion = self->_assertion;
  self->_assertion = v4;
}

- (void)createAssertion
{
  Class v3 = off_1003F67D0();
  id v4 = off_1003F67D8();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  v9 = sub_1000AA134;
  v10 = &unk_10039C500;
  objc_copyWeak(&v11, &location);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class acquireContentProviderAssertionForType:slot:identifier:errorHandler:]( v3,  "acquireContentProviderAssertionForType:slot:identifier:errorHandler:",  1LL,  v5,  @"SBDashBoardNowPlayingAssertionIdentifier",  &v7));
  -[MRDLockScreenAssertion setAssertion:](self, "setAssertion:", v6, v7, v8, v9, v10);

  if (!self->_assertion) {
    -[MRDLockScreenAssertion delayCreateAssertion](self, "delayCreateAssertion");
  }
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)delayCreateAssertion
{
  dispatch_time_t v2 = dispatch_time(0LL, 1000000000LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000AA2B8;
  v3[3] = &unk_10039A668;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, &_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRDLockScreenAssertion;
  -[MRDLockScreenAssertion dealloc](&v3, "dealloc");
}

- (SBSLockScreenContentAssertion)assertion
{
  return self->_assertion;
}

- (MROSTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end