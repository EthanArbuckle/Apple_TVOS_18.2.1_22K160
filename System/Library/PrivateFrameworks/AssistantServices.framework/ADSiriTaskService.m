@interface ADSiriTaskService
- (ADSiriTaskService)initWithCommandType:(id)a3 requestTransformer:(id)a4 responseTransformer:(id)a5 requestHandler:(id)a6;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (id)_informCommandCenter:(id)a3 willPerformLaunchApp:(id)a4;
- (id)commandsForDomain:(id)a3;
- (id)domains;
- (id)requestCommandAceType;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
@end

@implementation ADSiriTaskService

- (ADSiriTaskService)initWithCommandType:(id)a3 requestTransformer:(id)a4 responseTransformer:(id)a5 requestHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___ADSiriTaskService;
  v15 = -[ADSiriTaskService init](&v32, "init");
  if (v15)
  {
    v16 = objc_alloc(&OBJC_CLASS___NSString);
    id v31 = v12;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v11 qualifiedCommandName]);
    v18 = -[NSString initWithFormat:](v16, "initWithFormat:", @"SiriTaskService-%@", v17);

    v19 = v18;
    v20 = -[NSString UTF8String](v19, "UTF8String");
    dispatch_queue_attr_t v21 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v30 = v11;
    id v22 = v14;
    id v23 = v13;
    v24 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v21);
    dispatch_queue_t v25 = dispatch_queue_create(v20, v24);

    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v25;

    objc_storeStrong((id *)&v15->_commandType, a3);
    objc_storeStrong((id *)&v15->_requestTransformer, a4);
    objc_storeStrong((id *)&v15->_responseTransformer, a5);
    objc_storeStrong((id *)&v15->_requestHandler, a6);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceCommandType qualifiedCommandName](v15->_commandType, "qualifiedCommandName"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([@"SiriTaskService-" stringByAppendingString:v27]);
    -[ADService setIdentifier:](v15, "setIdentifier:", v28);

    id v13 = v23;
    id v14 = v22;
    id v11 = v30;

    id v12 = v31;
  }

  return v15;
}

- (id)_informCommandCenter:(id)a3 willPerformLaunchApp:(id)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([a4 launchId]);
  [v5 willProcessAppLaunchWithBundleIdentifier:v6];
  objc_initWeak(&location, v5);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10025D614;
  v10[3] = &unk_1004FA7E8;
  objc_copyWeak(&v12, &location);
  id v11 = v6;
  id v7 = v6;
  v8 = objc_retainBlock(v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v8;
}

- (id)domains
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceCommandType domainName](self->_commandType, "domainName"));
  id v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (id)commandsForDomain:(id)a3
{
  commandType = self->_commandType;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceCommandType domainName](commandType, "domainName"));
  unsigned int v7 = [v5 isEqualToString:v6];

  if (!v7) {
    return &__NSArray0__struct;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceCommandType className](self->_commandType, "className"));
  id v11 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));

  return v9;
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  commandType = self->_commandType;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceCommandType domainName](commandType, "domainName"));
  LODWORD(commandType) = [v8 isEqualToString:v9];

  if ((_DWORD)commandType)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceCommandType className](self->_commandType, "className"));
    unsigned __int8 v11 = [v6 isEqualToString:v10];
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = (os_log_s *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v22 = "-[ADSiriTaskService handleCommand:forDomain:executionContext:reply:]";
    __int16 v23 = 2112;
    v24 = self;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %@ handling %@", buf, 0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10025D068;
  v17[3] = &unk_1004FDA30;
  v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  id v14 = v10;
  id v15 = v11;
  id v16 = v9;
  dispatch_async(queue, v17);
}

- (id)requestCommandAceType
{
  return self->_commandType;
}

- (void).cxx_destruct
{
}

@end