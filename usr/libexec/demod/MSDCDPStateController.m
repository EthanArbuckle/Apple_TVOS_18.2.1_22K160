@interface MSDCDPStateController
- (BOOL)isCDPEnabled;
- (BOOL)isCDPManateeAvailable;
- (BOOL)isRecoveryKeyAvailable:(id *)a3;
- (CDPStateController)cdpController;
- (MSDCDPStateController)initWithAuthenticationResults:(id)a3;
- (MSDCDPStateController)initWithCDPContext:(id)a3;
- (id)generateRecoveryKeyWithError:(id *)a3;
- (id)initForPrimaryiCloudAccount;
- (void)dealloc;
- (void)setCdpController:(id)a3;
@end

@implementation MSDCDPStateController

- (id)initForPrimaryiCloudAccount
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CDPContext contextForPrimaryAccount](&OBJC_CLASS___CDPContext, "contextForPrimaryAccount"));
  if (v3)
  {
    self = -[MSDCDPStateController initWithCDPContext:](self, "initWithCDPContext:", v3);
    v4 = self;
  }

  else
  {
    id v5 = sub_10003A95C();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100093750(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    v4 = 0LL;
  }

  return v4;
}

- (MSDCDPStateController)initWithAuthenticationResults:(id)a3
{
  id v4 = a3;
  id v5 = -[CDPContext initWithAuthenticationResults:]( objc_alloc(&OBJC_CLASS___CDPContext),  "initWithAuthenticationResults:",  v4);

  v6 = -[MSDCDPStateController initWithCDPContext:](self, "initWithCDPContext:", v5);
  return v6;
}

- (MSDCDPStateController)initWithCDPContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MSDCDPStateController;
  id v5 = -[MSDCDPStateController init](&v8, "init");
  if (v5)
  {
    v6 = -[CDPStateController initWithContext:](objc_alloc(&OBJC_CLASS___CDPStateController), "initWithContext:", v4);
    -[MSDCDPStateController setCdpController:](v5, "setCdpController:", v6);
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDPStateController cdpController](self, "cdpController"));
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MSDCDPStateController;
  -[MSDCDPStateController dealloc](&v4, "dealloc");
}

- (BOOL)isCDPEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDPStateController cdpController](self, "cdpController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 context]);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dsid]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);

  if (v5)
  {
    unsigned __int8 v6 = +[CDPAccount isICDPEnabledForDSID:](&OBJC_CLASS___CDPAccount, "isICDPEnabledForDSID:", v5);
  }

  else
  {
    id v7 = sub_10003A95C();
    objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100093784(v8, v9, v10, v11, v12, v13, v14, v15);
    }

    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)isCDPManateeAvailable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDPStateController cdpController](self, "cdpController"));
  id v9 = 0LL;
  unsigned __int8 v3 = [v2 isManateeAvailable:&v9];
  id v4 = v9;

  if ((v3 & 1) == 0)
  {
    id v5 = sub_10003A95C();
    unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "CDP manatee is NOT available because: %{public}@",  buf,  0xCu);
    }
  }

  return v3;
}

- (BOOL)isRecoveryKeyAvailable:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDPStateController cdpController](self, "cdpController"));
  id v10 = 0LL;
  unsigned __int8 v5 = [v4 isRecoveryKeyAvailableWithError:&v10];
  id v6 = v10;

  if (v6)
  {
    id v7 = sub_10003A95C();
    objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000937B8(v6);
    }
  }

  if (a3) {
    *a3 = v6;
  }

  return v5;
}

- (id)generateRecoveryKeyWithError:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDPStateController cdpController](self, "cdpController"));
  id v10 = 0LL;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 generateRandomRecoveryKey:&v10]);
  id v6 = v10;

  if (!v5)
  {
    id v7 = sub_10003A95C();
    objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100093834(v6);
    }
  }

  if (a3) {
    *a3 = v6;
  }

  return v5;
}

- (CDPStateController)cdpController
{
  return self->_cdpController;
}

- (void)setCdpController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end