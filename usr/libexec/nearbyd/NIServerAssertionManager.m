@interface NIServerAssertionManager
- (BOOL)acquireAssertionToSendMessageToClient;
- (NIServerAssertionManager)initWithClientPid:(int)a3 signingIdentity:(id)a4 sessionIdentifier:(id)a5;
- (id).cxx_construct;
- (void)invalidate;
@end

@implementation NIServerAssertionManager

- (NIServerAssertionManager)initWithClientPid:(int)a3 signingIdentity:(id)a4 sessionIdentifier:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }

  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v18 handleFailureInMethod:a2, self, @"NIServerAssertionManager.mm", 58, @"Invalid parameter not satisfying: %@", @"signingIdentity" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v19 handleFailureInMethod:a2, self, @"NIServerAssertionManager.mm", 59, @"Invalid parameter not satisfying: %@", @"sessionIdentifier" object file lineNumber description];

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___NIServerAssertionManager;
  v13 = -[NIServerAssertionManager init](&v20, "init");
  v14 = v13;
  if (v13)
  {
    v15 = (void *)*((void *)v13 + 1);
    *((void *)v13 + 1) = 0LL;

    *((void *)v14 + 2) = 0LL;
    *((_DWORD *)v14 + 22) = a3;
    objc_storeStrong((id *)v14 + 12, a4);
    objc_storeStrong((id *)v14 + 13, a5);
    v16 = v14;
  }

  return v14;
}

- (void)invalidate
{
  v3 = (std::mutex *)((char *)self + 24);
  std::mutex::lock((std::mutex *)((char *)self + 24));
  [*((id *)self + 1) invalidate];
  v4 = (void *)*((void *)self + 1);
  *((void *)self + 1) = 0LL;

  std::mutex::unlock(v3);
}

- (BOOL)acquireAssertionToSendMessageToClient
{
  v3 = (std::mutex *)((char *)self + 24);
  std::mutex::lock((std::mutex *)((char *)self + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NI assertion - send message to client (signing identity: %@, pid:%d, session identifier:%@)",  *((void *)self + 12),  *((unsigned int *)self + 22),  *((void *)self + 13)));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.NearbyInteraction",  @"HandleMessage"));
  v27 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));

  double v7 = sub_100023CC4();
  if (v7 >= *((double *)self + 2) + 1.0)
  {
    [*((id *)self + 1) invalidate];
    id v11 = (void *)*((void *)self + 1);
    *((void *)self + 1) = 0LL;

    v12 = objc_alloc(&OBJC_CLASS___RBSAssertion);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithPid:](&OBJC_CLASS___RBSTarget, "targetWithPid:", *((unsigned int *)self + 22)));
    v14 = -[RBSAssertion initWithExplanation:target:attributes:]( v12,  "initWithExplanation:target:attributes:",  v4,  v13,  v6);
    v15 = (void *)*((void *)self + 1);
    *((void *)self + 1) = v14;

    v16 = (void *)*((void *)self + 1);
    id v20 = 0LL;
    unsigned __int8 v9 = [v16 acquireWithError:&v20];
    id v17 = v20;
    v18 = (os_log_s *)qword_1008000A0;
    if ((v9 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v4;
        __int16 v23 = 2048;
        double v24 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "#ni-assertion,Acquired %@ at time %.3f",  buf,  0x16u);
      }

      *((double *)self + 2) = v7;
    }

    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
    {
      sub_10039448C((uint64_t)v4, (uint64_t)v17, v18);
    }
  }

  else
  {
    v8 = (os_log_s *)qword_1008000A0;
    unsigned __int8 v9 = 1;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *((void *)self + 2);
      *(_DWORD *)buf = 138412802;
      v22 = v4;
      __int16 v23 = 2048;
      double v24 = v7;
      __int16 v25 = 2048;
      uint64_t v26 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "#ni-assertion,Skip acquiring %@. Time now %.3f [s] too close to time of last assertion %.3f [s]",  buf,  0x20u);
    }
  }

  std::mutex::unlock(v3);
  return v9;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 3) = 850045863LL;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((void *)self + 10) = 0LL;
  return self;
}

@end