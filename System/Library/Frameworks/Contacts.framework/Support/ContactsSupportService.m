@interface ContactsSupportService
- (CNAccessAuthorization)accessAuthorization;
- (CNContactsEnvironment)environment;
- (CNContactsLogger)logger;
- (CNScheduler)workQueue;
- (ContactsSupportService)initWithWorkQueue:(id)a3 connection:(id)a4;
- (ContactsSupportService)initWithWorkQueue:(id)a3 connection:(id)a4 accessAuthorization:(id)a5;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)backgroundColorQueue;
- (void)requestProviderDomainCommand:(id)a3 withReply:(id)a4;
@end

@implementation ContactsSupportService

- (ContactsSupportService)initWithWorkQueue:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    [v7 auditToken];
  }

  else
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
  }

  v13[0] = v14;
  v13[1] = v15;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CNAuditToken auditToken:](&OBJC_CLASS___CNAuditToken, "auditToken:", v13));
  v10 = -[CNAccessAuthorization initWithAuditToken:]( objc_alloc(&OBJC_CLASS___CNAccessAuthorization),  "initWithAuditToken:",  v9);
  v11 = -[ContactsSupportService initWithWorkQueue:connection:accessAuthorization:]( self,  "initWithWorkQueue:connection:accessAuthorization:",  v6,  v8,  v10);

  return v11;
}

- (ContactsSupportService)initWithWorkQueue:(id)a3 connection:(id)a4 accessAuthorization:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___ContactsSupportService;
  v12 = -[ContactsSupportService init](&v23, "init");
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[CNContactsEnvironment currentEnvironment]( &OBJC_CLASS___CNContactsEnvironment,  "currentEnvironment"));
    objc_storeStrong((id *)&v12->_workQueue, a3);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 loggerProvider]);
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 contactsLogger]);
    logger = v12->_logger;
    v12->_logger = (CNContactsLogger *)v15;

    environment = v12->_environment;
    v12->_environment = (CNContactsEnvironment *)v13;
    id v18 = v13;

    objc_storeWeak((id *)&v12->_connection, v10);
    objc_storeStrong((id *)&v12->_accessAuthorization, a5);
    dispatch_queue_t v19 = dispatch_queue_create("contactsBackgroundColorQueue", 0LL);
    backgroundColorQueue = v12->_backgroundColorQueue;
    v12->_backgroundColorQueue = (OS_dispatch_queue *)v19;

    v21 = v12;
  }

  return v12;
}

- (void)requestProviderDomainCommand:(id)a3 withReply:(id)a4
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (CNContactsLogger)logger
{
  return self->_logger;
}

- (CNContactsEnvironment)environment
{
  return self->_environment;
}

- (CNAccessAuthorization)accessAuthorization
{
  return self->_accessAuthorization;
}

- (OS_dispatch_queue)backgroundColorQueue
{
  return self->_backgroundColorQueue;
}

- (void).cxx_destruct
{
}

@end