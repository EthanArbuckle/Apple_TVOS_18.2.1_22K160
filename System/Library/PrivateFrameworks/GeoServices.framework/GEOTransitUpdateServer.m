@interface GEOTransitUpdateServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEOTransitUpdateServer)initWithDaemon:(id)a3;
- (void)cancelTransitRouteUpdateRequestWithRequest:(id)a3;
- (void)startTransitRouteUpdateRequestWithRequest:(id)a3;
@end

@implementation GEOTransitUpdateServer

+ (id)identifier
{
  return @"TransitUpdate";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100011D18(v10);
  if (v13 == 3238)
  {
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___GEOTransitRouteUpdateRequestSimple, v14, v15);
    id v22 = sub_100012270(@"TransitUpdate", v10, v11, v21, v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v19 = v23;
    BOOL v20 = v23 != 0LL;
    if (v23)
    {
      [v23 setSignpostId:a6];
      -[GEOTransitUpdateServer cancelTransitRouteUpdateRequestWithRequest:]( self,  "cancelTransitRouteUpdateRequestWithRequest:",  v19);
      goto LABEL_7;
    }
  }

  else
  {
    if (v13 != 3182)
    {
      BOOL v20 = 0;
      goto LABEL_10;
    }

    uint64_t v16 = objc_opt_class(&OBJC_CLASS___GEOTransitRouteUpdateRequestSimple, v14, v15);
    id v17 = sub_100012270(@"TransitUpdate", v10, v11, v16, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = v18;
    BOOL v20 = v18 != 0LL;
    if (v18)
    {
      [v18 setSignpostId:a6];
      -[GEOTransitUpdateServer startTransitRouteUpdateRequestWithRequest:]( self,  "startTransitRouteUpdateRequestWithRequest:",  v19);
LABEL_7:
      BOOL v20 = 1;
    }
  }

LABEL_10:
  return v20;
}

- (GEOTransitUpdateServer)initWithDaemon:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___GEOTransitUpdateServer;
  v3 = -[GEOTransitUpdateServer initWithDaemon:](&v10, "initWithDaemon:", a3);
  if (v3)
  {
    uint64_t v4 = geo_isolater_create("com.apple.geod.TransitUpdateServer");
    isolater = v3->_isolater;
    v3->_isolater = (geo_isolater *)v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    originalRequests = v3->_originalRequests;
    v3->_originalRequests = v6;

    v8 = v3;
  }

  return v3;
}

- (void)startTransitRouteUpdateRequestWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOTransitRouteUpdateReplySimple alloc] initWithRequest:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);

  if (v6)
  {
    isolater = self->_isolater;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10001CD5C;
    v16[3] = &unk_100059520;
    v16[4] = self;
    id v8 = v4;
    id v17 = v8;
    geo_isolate_sync_data(isolater, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[GEOTransitUpdateServerRequester sharedRequester]( &OBJC_CLASS___GEOTransitUpdateServerRequester,  "sharedRequester"));
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v8 request]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 preferredAuditToken]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10001CDA8;
    v13[3] = &unk_100059CE8;
    v13[4] = self;
    id v14 = v8;
    id v15 = v5;
    [v9 startSimpleTransitRouteUpdateRequest:v10 auditToken:v11 networkActivity:0 completion:v13];
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:](&OBJC_CLASS___NSError, "GEOErrorWithCode:", -10LL));
    [v5 setError:v12];

    [v5 send];
  }
}

- (void)cancelTransitRouteUpdateRequestWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOTransitRouteUpdateReplySimple alloc] initWithRequest:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);

  if (v6)
  {
    uint64_t v13 = 0LL;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000LL;
    uint64_t v16 = sub_10001D040;
    id v17 = sub_10001D050;
    id v18 = 0LL;
    isolater = self->_isolater;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10001D058;
    v10[3] = &unk_100059070;
    id v12 = &v13;
    v10[4] = self;
    id v11 = v4;
    geo_isolate_sync_data(isolater, v10);
    if (v14[5])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[GEOTransitUpdateServerRequester sharedRequester]( &OBJC_CLASS___GEOTransitUpdateServerRequester,  "sharedRequester"));
      [v8 cancelSimpleTransitRouteUpdateRequest:v14[5]];
    }

    _Block_object_dispose(&v13, 8);
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:](&OBJC_CLASS___NSError, "GEOErrorWithCode:", -10LL));
    [v5 setError:v9];

    [v5 send];
  }
}

- (void).cxx_destruct
{
}

@end