@interface RMInternalServiceHandler
- (RMConnectionEndpoint)endpoint;
- (RMConnectionListener)listener;
- (RMInternalServiceHandler)initWithEndpoint:(id)a3 managedListener:(id)a4;
- (void)dealloc;
- (void)endpoint:(id)a3 didReceiveMessage:(id)a4 withData:(id)a5 replyBlock:(id)a6;
- (void)setEndpoint:(id)a3;
- (void)setListener:(id)a3;
@end

@implementation RMInternalServiceHandler

- (RMInternalServiceHandler)initWithEndpoint:(id)a3 managedListener:(id)a4
{
  v6 = (id *)a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RMInternalServiceHandler;
  v8 = -[RMInternalServiceHandler init](&v10, "init");
  if (v8)
  {
    sub_100011130(v6, v8);
    -[RMInternalServiceHandler setEndpoint:](v8, "setEndpoint:", v6);
    -[RMInternalServiceHandler setListener:](v8, "setListener:", v7);
  }

  return v8;
}

- (void)dealloc
{
  v3 = (id *)objc_claimAutoreleasedReturnValue(-[RMInternalServiceHandler endpoint](self, "endpoint"));
  sub_100011130(v3, 0LL);

  -[RMInternalServiceHandler setEndpoint:](self, "setEndpoint:", 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RMInternalServiceHandler;
  -[RMInternalServiceHandler dealloc](&v4, "dealloc");
}

- (void)endpoint:(id)a3 didReceiveMessage:(id)a4 withData:(id)a5 replyBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_100006FE0;
  v40[3] = &unk_10001C838;
  v40[4] = self;
  id v13 = a6;
  id v41 = v13;
  v14 = objc_retainBlock(v40);
  if ([v11 isEqualToString:@"RMSpiGetNumClients"])
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v43 = 0x2020000000LL;
    v44 = 0LL;
    listener = self->_listener;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_1000070D8;
    v37[3] = &unk_10001C860;
    p___int128 buf = &buf;
    v38 = v14;
    -[RMConnectionListener traverseEndpointsAsynchronously:](listener, "traverseEndpointsAsynchronously:", v37);

LABEL_5:
    _Block_object_dispose(&buf, 8);
    goto LABEL_6;
  }

  if ([v11 isEqualToString:@"RMSpiDisconnectAllClients"])
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v43 = 0x2020000000LL;
    v44 = 0LL;
    v16 = self->_listener;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_100007194;
    v34[3] = &unk_10001C860;
    v36 = &buf;
    v35 = v14;
    -[RMConnectionListener traverseEndpointsAsynchronously:](v16, "traverseEndpointsAsynchronously:", v34);

    goto LABEL_5;
  }

  if ([v11 isEqualToString:@"RMSpiListClients"])
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v43 = 0x3032000000LL;
    v44 = sub_100007258;
    v45 = sub_100007268;
    v46 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v17 = self->_listener;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100007270;
    v31[3] = &unk_10001C860;
    v33 = &buf;
    v32 = v14;
    -[RMConnectionListener traverseEndpointsAsynchronously:](v17, "traverseEndpointsAsynchronously:", v31);

    _Block_object_dispose(&buf, 8);
  }

  else if ([v11 isEqualToString:@"RMSpiDisconnectClient"])
  {
    id v30 = 0LL;
    id v18 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSString),  v12,  &v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    id v20 = v30;
    if (v19)
    {
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v43 = 0x2020000000LL;
      v44 = 0LL;
      v21 = self->_listener;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_100007314;
      v26[3] = &unk_10001C888;
      id v27 = v19;
      v29 = &buf;
      v28 = v14;
      -[RMConnectionListener traverseEndpointsAsynchronously:](v21, "traverseEndpointsAsynchronously:", v26);

      _Block_object_dispose(&buf, 8);
    }

    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v20,  1LL,  0LL));
      ((void (*)(void *, const __CFString *, void *))v14[2])(v14, @"RMSpiError", v25);
    }
  }

  else
  {
    if (qword_100023980 != -1) {
      dispatch_once(&qword_100023980, &stru_10001C8A8);
    }
    v22 = (os_log_s *)qword_100023988;
    if (os_log_type_enabled((os_log_t)qword_100023988, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Unknown message: %@", (uint8_t *)&buf, 0xCu);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"RMSpiError",  -699LL,  0LL));
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v23,  1LL,  0LL));
    ((void (*)(void *, const __CFString *, void *))v14[2])(v14, @"RMSpiError", v24);
  }

- (RMConnectionEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (RMConnectionListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end