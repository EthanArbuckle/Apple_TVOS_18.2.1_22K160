@interface HangHUDClient
+ (id)sharedInstance;
- (HangHUDClient)initWithIdentifier:(id)a3;
- (HangHUDClientDelegate)delegate;
- (id)obtainKeepHangHUDAliveAssertion:(id)a3;
- (void)clearHUDWithCompletion:(id)a3;
- (void)invalidate;
- (void)sendHangHUDInfo:(id)a3 completion:(id)a4;
- (void)sendHudConfiguration:(id)a3 completion:(id)a4;
- (void)sendMonitoredStates:(id)a3 completion:(id)a4;
- (void)sendProcExitRecord:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation HangHUDClient

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011E54;
  block[3] = &unk_100049168;
  block[4] = a1;
  if (qword_10005B4A0 != -1) {
    dispatch_once(&qword_10005B4A0, block);
  }
  return (id)qword_10005B498;
}

- (HangHUDClient)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___HangHUDClient;
  v5 = -[HangHUDClient init](&v23, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[HangHUDServiceSpecification machName](&OBJC_CLASS___HangHUDServiceSpecification, "machName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[HangHUDServiceSpecification identifier](&OBJC_CLASS___HangHUDServiceSpecification, "identifier"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[BSServiceConnectionEndpoint endpointForMachName:service:instance:]( &OBJC_CLASS___BSServiceConnectionEndpoint,  "endpointForMachName:service:instance:",  v6,  v7,  0LL));
    endpoint = v5->_endpoint;
    v5->_endpoint = (BSServiceConnectionEndpoint *)v8;

    v10 = v5->_endpoint;
    if (v10)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10001211C;
      v21[3] = &unk_100049190;
      v22 = (os_log_s *)v4;
      uint64_t v11 = objc_claimAutoreleasedReturnValue( +[BSServiceConnection connectionWithEndpoint:clientContextBuilder:]( &OBJC_CLASS___BSServiceConnection,  "connectionWithEndpoint:clientContextBuilder:",  v10,  v21));
      connection = v5->_connection;
      v5->_connection = (BSServiceConnectionClient *)v11;

      v13 = v5->_connection;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_100012180;
      v19[3] = &unk_1000491E0;
      v20 = v5;
      -[BSServiceConnectionClient configureConnection:](v13, "configureConnection:", v19);

      v14 = v22;
    }

    else
    {
      id v15 = sub_1000233A4();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[HangHUDServiceSpecification machName](&OBJC_CLASS___HangHUDServiceSpecification, "machName"));
        v17 = (void *)objc_claimAutoreleasedReturnValue( +[HangHUDServiceSpecification identifier]( &OBJC_CLASS___HangHUDServiceSpecification,  "identifier"));
        *(_DWORD *)buf = 138412546;
        v25 = v16;
        __int16 v26 = 2112;
        v27 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "failed to lookup endpoint with machName=%@ service=%@",  buf,  0x16u);
      }
    }
  }

  return v5;
}

- (void)invalidate
{
}

- (id)obtainKeepHangHUDAliveAssertion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___RBSAssertion);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentity identityForAngelJobLabel:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForAngelJobLabel:",  @"com.apple.HangHUD"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithProcessIdentity:](&OBJC_CLASS___RBSTarget, "targetWithProcessIdentity:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.common",  @"BasicAngelIPC"));
  uint64_t v11 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  id v9 = [v4 initWithExplanation:v3 target:v6 attributes:v8];

  return v9;
}

- (void)sendHangHUDInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000233A4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10002C564(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  -[BSServiceConnectionClient activate](self->_connection, "activate");
  connection = self->_connection;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.common",  @"BasicAngelIPC"));
  v25 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  v20 = (void *)objc_claimAutoreleasedReturnValue( -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:]( connection,  "remoteTargetWithLaunchingAssertionAttributes:",  v19));

  if (v20)
  {
    [v20 receiveHangHUDInfo:v6 completion:v7];
  }

  else
  {
    id v21 = sub_1000233A4();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      v24 = @"launchingTarget is nil. connection is not active or remote interface is empty.";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v23, 0xCu);
    }
  }
}

- (void)sendProcExitRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000233A4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10002C5D4(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  -[BSServiceConnectionClient activate](self->_connection, "activate");
  connection = self->_connection;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.common",  @"BasicAngelIPC"));
  v25 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  v20 = (void *)objc_claimAutoreleasedReturnValue( -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:]( connection,  "remoteTargetWithLaunchingAssertionAttributes:",  v19));

  if (v20)
  {
    [v20 receiveProcExitRecord:v6 completion:v7];
  }

  else
  {
    id v21 = sub_1000233A4();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      v24 = @"launchingTarget is nil. connection is not active or remote interface is empty.";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v23, 0xCu);
    }
  }
}

- (void)sendHudConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000233A4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10002C644(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  -[BSServiceConnectionClient activate](self->_connection, "activate");
  connection = self->_connection;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.common",  @"BasicAngelIPC"));
  v25 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  v20 = (void *)objc_claimAutoreleasedReturnValue( -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:]( connection,  "remoteTargetWithLaunchingAssertionAttributes:",  v19));

  if (v20)
  {
    [v20 receiveHudConfiguration:v6 completion:v7];
  }

  else
  {
    id v21 = sub_1000233A4();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      v24 = @"launchingTarget is nil. connection is not active or remote interface is empty.";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v23, 0xCu);
    }
  }
}

- (void)sendMonitoredStates:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000233A4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10002C6B4(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  -[BSServiceConnectionClient activate](self->_connection, "activate");
  connection = self->_connection;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.common",  @"BasicAngelIPC"));
  v25 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  v20 = (void *)objc_claimAutoreleasedReturnValue( -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:]( connection,  "remoteTargetWithLaunchingAssertionAttributes:",  v19));

  if (v20)
  {
    [v20 receiveMonitoredStates:v6 completion:v7];
  }

  else
  {
    id v21 = sub_1000233A4();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      v24 = @"launchingTarget is nil. connection is not active or remote interface is empty.";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v23, 0xCu);
    }
  }
}

- (void)clearHUDWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000233A4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10002C724(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  -[BSServiceConnectionClient activate](self->_connection, "activate");
  connection = self->_connection;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.common",  @"BasicAngelIPC"));
  v22 = v15;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  v17 = (void *)objc_claimAutoreleasedReturnValue( -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:]( connection,  "remoteTargetWithLaunchingAssertionAttributes:",  v16));

  if (v17)
  {
    [v17 clearHUDWithCompletion:v4];
  }

  else
  {
    id v18 = sub_1000233A4();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = @"launchingTarget is nil. connection is not active or remote interface is empty.";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (HangHUDClientDelegate)delegate
{
  return (HangHUDClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end