@interface GEODirectionsServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (id)serviceRequester;
- (void)cancelWithRequest:(id)a3;
- (void)startWithRequest:(id)a3;
@end

@implementation GEODirectionsServer

- (id)serviceRequester
{
  serviceRequester = self->_serviceRequester;
  if (serviceRequester) {
    return serviceRequester;
  }
  else {
    return (id)objc_claimAutoreleasedReturnValue( +[GEODirectionsRequester sharedRequester]( &OBJC_CLASS___GEODirectionsRequester,  "sharedRequester"));
  }
}

- (void)startWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOXPCDirectionsReply alloc] initWithRequest:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 directionsRequest]);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEODirectionsServer serviceRequester](self, "serviceRequester"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 traits]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 preferredAuditToken]);
    id v10 = [v4 useBackgroundURL];
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 priority]));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10000A5F0;
    v15[3] = &unk_100059330;
    id v16 = v5;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000A61C;
    v13[3] = &unk_100059358;
    id v14 = v16;
    [v7 startRequest:v6 traits:v8 auditToken:v9 skipFinalize:0 useBackgroundURL:v10 requestPriority:v11 callbackQueue:&_dispatch_main_q finished:v15 networkActivity:0 error:v13];
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:userInfo:",  -10LL,  0LL));
    [v5 setError:v12];

    [v5 send];
  }
}

- (void)cancelWithRequest:(id)a3
{
  id v4 = a3;
  id v7 = [[GEOXPCDirectionsReply alloc] initWithRequest:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 directionsRequest]);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEODirectionsServer serviceRequester](self, "serviceRequester"));
    [v6 cancelRequest:v5];
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:userInfo:",  -10LL,  0LL));
    [v7 setError:v6];
  }

  [v7 send];
}

- (void).cxx_destruct
{
}

+ (id)identifier
{
  return @"directions";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100011D18(v10);
  if (v13 == 614)
  {
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___GEOXPCDirectionsRequest, v14, v15);
    id v22 = sub_100012270(@"directions", v10, v11, v21, v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v19 = v23;
    BOOL v20 = v23 != 0LL;
    if (v23)
    {
      [v23 setSignpostId:a6];
      -[GEODirectionsServer cancelWithRequest:](self, "cancelWithRequest:", v19);
      goto LABEL_7;
    }
  }

  else
  {
    if (v13 != 558)
    {
      BOOL v20 = 0;
      goto LABEL_10;
    }

    uint64_t v16 = objc_opt_class(&OBJC_CLASS___GEOXPCDirectionsRequest, v14, v15);
    id v17 = sub_100012270(@"directions", v10, v11, v16, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = v18;
    BOOL v20 = v18 != 0LL;
    if (v18)
    {
      [v18 setSignpostId:a6];
      -[GEODirectionsServer startWithRequest:](self, "startWithRequest:", v19);
LABEL_7:
      BOOL v20 = 1;
    }
  }

LABEL_10:
  return v20;
}

@end