@interface AKPasswordResetPresenter
- (BOOL)isPasswordResetRequestInProgress;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)remoteListener;
- (id)resetCompletion;
- (void)dealloc;
- (void)passwordResetFinishedWithResult:(id)a3 error:(id)a4 completion:(id)a5;
- (void)presentWithContext:(id)a3 completion:(id)a4;
- (void)setIsPasswordResetRequestInProgress:(BOOL)a3;
- (void)setRemoteListener:(id)a3;
- (void)setResetCompletion:(id)a3;
@end

@implementation AKPasswordResetPresenter

- (void)presentWithContext:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, void, void *))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
  unsigned __int8 v7 = [v6 isForgotPasswordNativeTakeoverEnabled];

  if ((v7 & 1) != 0)
  {
    BOOL v9 = -[AKPasswordResetPresenter isPasswordResetRequestInProgress](self, "isPasswordResetRequestInProgress");
    BOOL v10 = v9;
    uint64_t v11 = _AKLogSystem(v9);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v13) {
        sub_10012C86C(v12, v14, v15, v16, v17, v18, v19, v20);
      }

      if (v5)
      {
        uint64_t v21 = -7113LL;
LABEL_13:
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", v21));
        v5[2](v5, 0LL, v30);

        goto LABEL_14;
      }

      goto LABEL_14;
    }

    if (v13) {
      sub_10012C89C(v12, v14, v15, v16, v17, v18, v19, v20);
    }
  }

  else
  {
    uint64_t v22 = _AKLogSystem(v8);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10012C8CC(v12, v23, v24, v25, v26, v27, v28, v29);
    }
  }

  if (v5)
  {
    uint64_t v21 = -7027LL;
    goto LABEL_13;
  }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[AKPasswordResetPresenterHostInterface XPCInterface]( &OBJC_CLASS___AKPasswordResetPresenterHostInterface,  "XPCInterface"));
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)passwordResetFinishedWithResult:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v11 = _AKLogSystem(v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v13 = @"NO";
    if (!v9) {
      BOOL v13 = @"YES";
    }
    int v19 = 138412290;
    uint64_t v20 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Password reset finished with result is success: %@",  (uint8_t *)&v19,  0xCu);
  }

  uint64_t v15 = _AKLogSystem(v14);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_10012C8FC((uint64_t)v8, (uint64_t)v9, v16);
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[AKPasswordResetPresenter resetCompletion](self, "resetCompletion"));
  if (v17)
  {
    uint64_t v18 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[AKPasswordResetPresenter resetCompletion]( self,  "resetCompletion"));
    ((void (**)(void, id, id))v18)[2](v18, v8, v9);
  }

  -[AKPasswordResetPresenter setResetCompletion:](self, "setResetCompletion:", 0LL);
  if (v10) {
    v10[2](v10, 1LL, 0LL);
  }
  -[AKPasswordResetPresenter setIsPasswordResetRequestInProgress:](self, "setIsPasswordResetRequestInProgress:", 0LL);
}

- (void)dealloc
{
  uint64_t v3 = _AKLogSystem(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10012C980((uint64_t)self, v4);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AKPasswordResetPresenter;
  -[AKPasswordResetPresenter dealloc](&v5, "dealloc");
}

- (NSXPCListener)remoteListener
{
  return self->_remoteListener;
}

- (void)setRemoteListener:(id)a3
{
}

- (id)resetCompletion
{
  return self->_resetCompletion;
}

- (void)setResetCompletion:(id)a3
{
}

- (BOOL)isPasswordResetRequestInProgress
{
  return self->_isPasswordResetRequestInProgress;
}

- (void)setIsPasswordResetRequestInProgress:(BOOL)a3
{
  self->_isPasswordResetRequestInProgress = a3;
}

- (void).cxx_destruct
{
}

@end