@interface GKDataTransport
+ (GKDataTransport)transportWithBag:(id)a3 clientProxy:(id)a4 credential:(id)a5;
- (GKActivity)activity;
- (GKClientProxy)clientProxy;
- (GKDataTransport)initWithBag:(id)a3 clientProxy:(id)a4 credential:(id)a5;
- (GKPlayerCredential)credential;
- (GKStoreBag)storeBag;
- (id)errorForBagError:(id)a3 serverError:(id)a4;
- (id)language;
- (void)postRequest:(id)a3 forBagKey:(id)a4 response:(id)a5;
- (void)postRequest:(id)a3 forBagKey:(id)a4 result:(id)a5;
- (void)setActivity:(id)a3;
- (void)setClientProxy:(id)a3;
- (void)setCredential:(id)a3;
- (void)setStoreBag:(id)a3;
@end

@implementation GKDataTransport

+ (GKDataTransport)transportWithBag:(id)a3 clientProxy:(id)a4 credential:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = -[GKDataTransport initWithBag:clientProxy:credential:]( objc_alloc(&OBJC_CLASS___GKDataTransport),  "initWithBag:clientProxy:credential:",  v9,  v8,  v7);

  return v10;
}

- (GKDataTransport)initWithBag:(id)a3 clientProxy:(id)a4 credential:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!os_log_GKGeneral) {
    id v13 = (id)GKOSLoggers(v11);
  }
  v14 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "GKDataTransport: initWithBag:", buf, 2u);
  }

  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___GKDataTransport;
  v15 = -[GKDataTransport init](&v22, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_storeBag, a3);
    objc_storeStrong((id *)&v16->_clientProxy, a4);
    objc_storeStrong((id *)&v16->_credential, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GKDataTransport - %@",  v17));
    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[GKActivity named:](&OBJC_CLASS___GKActivity, "named:", v18));
    activity = v16->_activity;
    v16->_activity = (GKActivity *)v19;
  }

  return v16;
}

- (id)errorForBagError:(id)a3 serverError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    id v9 = [v8 mutableCopy];

    [v9 setObject:v5 forKeyedSubscript:NSUnderlyingErrorKey];
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  v10,  [v7 code],  v9));
  }

  else
  {
    if (v6)
    {
      id v12 = v6;
    }

    else
    {
      if (!v5)
      {
        id v11 = 0LL;
        goto LABEL_9;
      }

      id v12 = v5;
    }

    id v11 = v12;
  }

- (void)postRequest:(id)a3 forBagKey:(id)a4 response:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataTransport activity](self, "activity"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"postRequest method:%@ bagKey:%@",  @"default",  v9));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000B8FF0;
  v16[3] = &unk_10026B0F8;
  v16[4] = self;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  [v11 childNamed:v12 execute:v16];
}

- (void)postRequest:(id)a3 forBagKey:(id)a4 result:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataTransport activity](self, "activity"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKDataTransport.m",  94LL,  "-[GKDataTransport postRequest:forBagKey:result:]"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000B93C0;
  v16[3] = &unk_10026B0F8;
  v16[4] = self;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  [v11 childNamed:v12 execute:v16];
}

- (id)language
{
  return -[GKClientProxy language](self->_clientProxy, "language");
}

- (GKStoreBag)storeBag
{
  return self->_storeBag;
}

- (void)setStoreBag:(id)a3
{
}

- (GKClientProxy)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
}

- (GKPlayerCredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (GKActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end