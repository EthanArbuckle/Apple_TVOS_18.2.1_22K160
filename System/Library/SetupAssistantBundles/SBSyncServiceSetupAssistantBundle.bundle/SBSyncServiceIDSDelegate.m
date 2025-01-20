@interface SBSyncServiceIDSDelegate
- (SBSyncServiceIDSDelegate)init;
- (id)accountSetupRequestParameters;
- (id)delegateServiceIdentifier;
- (void)completeSetupWithResponseParameters:(id)a3 handler:(id)a4;
- (void)setupOperationFailed;
@end

@implementation SBSyncServiceIDSDelegate

- (SBSyncServiceIDSDelegate)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SBSyncServiceIDSDelegate;
  v2 = -[SBSyncServiceIDSDelegate init](&v5, "init");
  v3 = (os_log_s *)+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "*** Initializing IDS Setup Delegate %p", buf, 0xCu);
  }

  return v2;
}

- (id)delegateServiceIdentifier
{
  return (id)IDSAuthenticationDictionaryKeyIDSDelegate;
}

- (id)accountSetupRequestParameters
{
  return &off_4260;
}

- (void)completeSetupWithResponseParameters:(id)a3 handler:(id)a4
{
  v7 = (os_log_s *)+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "completeSetupWithResponseParameters", buf, 2u);
  }

  IDSAuthenticationDelegatePrintLoginDelegatesBag(a3);
  id v8 = [a4 copy];
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_3330;
  block[3] = &unk_4148;
  block[4] = a3;
  dispatch_async(global_queue, block);
  v10 = (os_log_s *)+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Dispatching deferred completion...", buf, 2u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_36B8;
  v11[3] = &unk_4170;
  v11[4] = self;
  v11[5] = v8;
  im_dispatch_after(v11, 1.0);
}

- (void)setupOperationFailed
{
  self->_setupOperationCancelled = 1;
  v2 = (os_log_s *)+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "setupOperationFailed", v3, 2u);
  }

@end