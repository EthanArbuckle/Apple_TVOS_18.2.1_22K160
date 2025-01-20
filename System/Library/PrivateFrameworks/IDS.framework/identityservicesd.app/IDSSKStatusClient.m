@interface IDSSKStatusClient
- (BOOL)_shouldRetryForError:(id)a3;
- (IDSBlockRetryHandler)provisionRetryHandler;
- (IDSBlockRetryHandler)publishRetryHandler;
- (IDSSKStatusClient)initWithStatusTypeIdentifier:(id)a3 queue:(id)a4;
- (IDSSKStatusClient)initWithStatusTypeIdentifier:(id)a3 statusPublishingService:(id)a4 queue:(id)a5;
- (IDSSKStatusClientDelegate)delegate;
- (NSString)description;
- (NSString)statusTypeIdentifier;
- (OS_dispatch_queue)queue;
- (SKStatusPublishingService)publishingService;
- (double)_retryMaximumTime;
- (double)_retryMinimumTime;
- (double)_retryTimeForAttempt:(int64_t)a3;
- (id)_publishRequestForStatusPayload:(id)a3;
- (id)_skHandlesForURIs:(id)a3;
- (id)_skInvitationPayloadForDictionary:(id)a3;
- (id)invitedHandles;
- (unint64_t)_retryMaximumAttempts;
- (void)inviteHandles:(id)a3 fromSenderHandle:(id)a4 withDictionaryPayload:(id)a5 completion:(id)a6;
- (void)invitedHandlesChanged;
- (void)provisionStatusPayload:(id)a3 completion:(id)a4;
- (void)publishStatus:(id)a3 completion:(id)a4;
- (void)publishingServiceDaemonDisconnected:(id)a3;
- (void)removeAllInvitedHandlesWithCompletion:(id)a3;
- (void)removeInvitedHandles:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setProvisionRetryHandler:(id)a3;
- (void)setPublishRetryHandler:(id)a3;
- (void)setPublishingService:(id)a3;
- (void)setStatusTypeIdentifier:(id)a3;
- (void)statusPublishRequestCompleted:(id)a3 successfully:(BOOL)a4 error:(id)a5;
@end

@implementation IDSSKStatusClient

- (IDSSKStatusClient)initWithStatusTypeIdentifier:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (objc_class *)IMWeakLinkClass(@"SKStatusPublishingService", @"StatusKit");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSSKStatusClient](&OBJC_CLASS___IDSFoundationLog, "IDSSKStatusClient"));
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v10) {
      sub_1006A0C44(v9, v11, v12, v13, v14, v15, v16, v17);
    }

    v9 = (os_log_s *)[[v8 alloc] initWithStatusTypeIdentifier:v6];
    self =  -[IDSSKStatusClient initWithStatusTypeIdentifier:statusPublishingService:queue:]( self,  "initWithStatusTypeIdentifier:statusPublishingService:queue:",  v6,  v9,  v7);
    v18 = self;
  }

  else
  {
    if (v10) {
      sub_1006A0C10(v9, v11, v12, v13, v14, v15, v16, v17);
    }
    v18 = 0LL;
  }

  return v18;
}

- (IDSSKStatusClient)initWithStatusTypeIdentifier:(id)a3 statusPublishingService:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___IDSSKStatusClient;
  uint64_t v12 = -[IDSSKStatusClient init](&v17, "init");
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_statusTypeIdentifier, a3);
    objc_storeStrong((id *)&v13->_queue, a5);
    objc_storeStrong((id *)&v13->_publishingService, a4);
    -[SKStatusPublishingService addDelegate:queue:](v13->_publishingService, "addDelegate:queue:", v13, v13->_queue);
    publishRetryHandler = v13->_publishRetryHandler;
    v13->_publishRetryHandler = 0LL;

    provisionRetryHandler = v13->_provisionRetryHandler;
    v13->_provisionRetryHandler = 0LL;
  }

  return v13;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSKStatusClient statusTypeIdentifier](self, "statusTypeIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSKStatusClient delegate](self, "delegate"));
  v5 = @"YES";
  if (!v4) {
    v5 = @"NO";
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<IDSSKStatusClient %p>: statusTypeIdentifier %@ delegate %@",  self,  v3,  v5));

  return (NSString *)v6;
}

- (double)_retryTimeForAttempt:(int64_t)a3
{
  double v6 = v5 * (double)a3;
  -[IDSSKStatusClient _retryMaximumTime](self, "_retryMaximumTime");
  if (v6 < result) {
    return v6;
  }
  return result;
}

- (void)publishStatus:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSSKStatusClient](&OBJC_CLASS___IDSFoundationLog, "IDSSKStatusClient"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Requesting publish for status payload: %@",  buf,  0xCu);
  }

  if (v6)
  {
    publishRetryHandler = self->_publishRetryHandler;
    if (publishRetryHandler)
    {
      -[IDSBlockRetryHandler stop](publishRetryHandler, "stop");
      id v10 = self->_publishRetryHandler;
      self->_publishRetryHandler = 0LL;
    }

    id v11 = objc_alloc(&OBJC_CLASS___IDSBlockRetryHandler);
    queue = self->_queue;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1001DA248;
    v25[3] = &unk_1008F9AD8;
    v25[4] = self;
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472LL;
    v20 = sub_1001DA254;
    v21 = &unk_1008FD948;
    v22 = self;
    id v23 = v6;
    id v24 = v7;
    uint64_t v13 = -[IDSBlockRetryHandler initWithQueue:backoffProvider:block:]( v11,  "initWithQueue:backoffProvider:block:",  queue,  v25,  &v18);
    uint64_t v14 = self->_publishRetryHandler;
    self->_publishRetryHandler = v13;

    -[IDSBlockRetryHandler start](self->_publishRetryHandler, "start", v18, v19, v20, v21, v22);
  }

  else
  {
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    v27 = @"Status payload is nil";
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSOffGridStatusErrorDomain,  2LL,  v15));
    objc_super v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSSKStatusClient](&OBJC_CLASS___IDSFoundationLog, "IDSSKStatusClient"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1006A0C78((uint64_t)v16, v17);
    }

    if (v7) {
      (*((void (**)(id, void *))v7 + 2))(v7, v16);
    }
  }
}

- (void)provisionStatusPayload:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSSKStatusClient](&OBJC_CLASS___IDSFoundationLog, "IDSSKStatusClient"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Requesting provisioning for payloads: %@",  buf,  0xCu);
    }

    provisionRetryHandler = self->_provisionRetryHandler;
    if (provisionRetryHandler)
    {
      -[IDSBlockRetryHandler stop](provisionRetryHandler, "stop");
      id v10 = self->_provisionRetryHandler;
      self->_provisionRetryHandler = 0LL;
    }

    id v11 = objc_alloc(&OBJC_CLASS___IDSBlockRetryHandler);
    queue = self->_queue;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1001DA684;
    v24[3] = &unk_1008F9AD8;
    v24[4] = self;
    objc_super v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472LL;
    uint64_t v19 = sub_1001DA690;
    v20 = &unk_1008FD948;
    v21 = self;
    id v22 = v6;
    id v23 = v7;
    uint64_t v13 = -[IDSBlockRetryHandler initWithQueue:backoffProvider:block:]( v11,  "initWithQueue:backoffProvider:block:",  queue,  v24,  &v17);
    uint64_t v14 = self->_provisionRetryHandler;
    self->_provisionRetryHandler = v13;

    -[IDSBlockRetryHandler start](self->_provisionRetryHandler, "start", v17, v18, v19, v20, v21);
  }

  else
  {
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    v28 = @"No payloads specified";
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSOffGridStatusErrorDomain,  2LL,  v15));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v16);
  }
}

- (id)invitedHandles
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKStatusPublishingService invitedHandles](self->_publishingService, "invitedHandles"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001DA90C;
  v5[3] = &unk_1008F7970;
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v6 = v3;
  [v2 enumerateObjectsUsingBlock:v5];

  return v3;
}

- (void)inviteHandles:(id)a3 fromSenderHandle:(id)a4 withDictionaryPayload:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10 || ![v10 count])
  {
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSSKStatusClient](&OBJC_CLASS___IDSFoundationLog, "IDSSKStatusClient"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No handles specified to invite", buf, 2u);
    }
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001DAAE0;
  block[3] = &unk_1008F9578;
  id v21 = v11;
  id v22 = self;
  id v23 = v10;
  id v24 = v12;
  id v25 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v10;
  id v19 = v11;
  dispatch_async(queue, block);
}

- (void)removeInvitedHandles:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 || ![v6 count])
  {
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSSKStatusClient](&OBJC_CLASS___IDSFoundationLog, "IDSSKStatusClient"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "No handles specified to remove invites",  buf,  2u);
    }
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001DAFD4;
  block[3] = &unk_1008F7BD8;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)removeAllInvitedHandlesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001DB1F0;
  v7[3] = &unk_1008F8F70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_skHandlesForURIs:(id)a3
{
  id v3 = a3;
  uint64_t v4 = IMWeakLinkClass(@"SKHandle", @"StatusKit");
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  id v10 = sub_1001DB3E0;
  id v11 = &unk_1008FD998;
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v13 = v4;
  double v5 = v12;
  [v3 enumerateObjectsUsingBlock:&v8];

  id v6 = -[NSMutableArray copy](v5, "copy", v8, v9, v10, v11);
  return v6;
}

- (id)_skInvitationPayloadForDictionary:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc((Class)IMWeakLinkClass(@"SKInvitationPayload", @"StatusKit"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    id v6 = [v4 initWithDictionary:v3 dateCreated:v5];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)_publishRequestForStatusPayload:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend( objc_alloc((Class)IMWeakLinkClass(@"SKStatusPublishRequest", @"StatusKit")),  "initWithStatusPayload:",  v3);

  double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSSKStatusClient](&OBJC_CLASS___IDSFoundationLog, "IDSSKStatusClient"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Created publish request: %@",  (uint8_t *)&v7,  0xCu);
  }

  return v4;
}

- (void)statusPublishRequestCompleted:(id)a3 successfully:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSSKStatusClient](&OBJC_CLASS___IDSFoundationLog, "IDSSKStatusClient"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = @"NO";
    int v12 = 138413058;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    if (v6) {
      id v11 = @"YES";
    }
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v11;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "statusPublishRequestCompleted %@: %@, successfully: %@, error: %@",  (uint8_t *)&v12,  0x2Au);
  }
}

- (void)invitedHandlesChanged
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSSKStatusClient](&OBJC_CLASS___IDSFoundationLog, "IDSSKStatusClient"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    double v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "invitedHandlesChanged %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)publishingServiceDaemonDisconnected:(id)a3
{
  id v3 = a3;
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSSKStatusClient](&OBJC_CLASS___IDSFoundationLog, "IDSSKStatusClient"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "publishingServiceDaemonDisconnected %@",  (uint8_t *)&v5,  0xCu);
  }
}

- (BOOL)_shouldRetryForError:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  if (!v3) {
    goto LABEL_8;
  }
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if (![v5 isEqualToString:APSErrorDomain])
  {

    goto LABEL_8;
  }

  if ([v4 code] != (id)4)
  {
    id v6 = [v4 code];

    if (v6 == (id)5) {
      goto LABEL_7;
    }
LABEL_8:
    BOOL v7 = 0;
    goto LABEL_9;
  }

LABEL_7:
  BOOL v7 = 1;
LABEL_9:

  return v7;
}

- (unint64_t)_retryMaximumAttempts
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"status-retry-max-attempts"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    unint64_t v6 = (unint64_t)[v3 integerValue];
  }
  else {
    unint64_t v6 = 3LL;
  }

  return v6;
}

- (double)_retryMinimumTime
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"status-retry-min-time-sec"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  double v6 = 30.0;
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    [v3 doubleValue];
    double v6 = v7;
  }

  return v6;
}

- (double)_retryMaximumTime
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"status-retry-max-time-sec"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    [v3 doubleValue];
    double v7 = v6;
  }

  else
  {
    double v7 = 300.0;
  }

  return v7;
}

- (NSString)statusTypeIdentifier
{
  return self->_statusTypeIdentifier;
}

- (void)setStatusTypeIdentifier:(id)a3
{
}

- (SKStatusPublishingService)publishingService
{
  return self->_publishingService;
}

- (void)setPublishingService:(id)a3
{
}

- (IDSBlockRetryHandler)publishRetryHandler
{
  return self->_publishRetryHandler;
}

- (void)setPublishRetryHandler:(id)a3
{
}

- (IDSBlockRetryHandler)provisionRetryHandler
{
  return self->_provisionRetryHandler;
}

- (void)setProvisionRetryHandler:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IDSSKStatusClientDelegate)delegate
{
  return (IDSSKStatusClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
}

@end