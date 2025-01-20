@interface GEOETAServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (id)serviceRequester;
- (void)cancelETARequestWithRequest:(id)a3;
- (void)cancelSimpleETARequestWithRequest:(id)a3;
- (void)startETARequestWithRequest:(id)a3;
- (void)startSimpleETARequestWithRequest:(id)a3;
@end

@implementation GEOETAServer

+ (id)identifier
{
  return @"ETA";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100011D18(v10);
  BOOL v16 = 0;
  if (v13 > 2138)
  {
    if (v13 == 2195)
    {
      uint64_t v27 = objc_opt_class(&OBJC_CLASS___GEOETARequestSimple, v14, v15);
      id v28 = sub_100012270(@"ETA", v10, v11, v27, v12);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v20 = v29;
      BOOL v16 = v29 != 0LL;
      if (v29)
      {
        [v29 setSignpostId:a6];
        -[GEOETAServer cancelSimpleETARequestWithRequest:](self, "cancelSimpleETARequestWithRequest:", v20);
        goto LABEL_14;
      }

      goto LABEL_15;
    }

    if (v13 == 2139)
    {
      uint64_t v21 = objc_opt_class(&OBJC_CLASS___GEOETARequestSimple, v14, v15);
      id v22 = sub_100012270(@"ETA", v10, v11, v21, v12);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v20 = v23;
      BOOL v16 = v23 != 0LL;
      if (v23)
      {
        [v23 setSignpostId:a6];
        -[GEOETAServer startSimpleETARequestWithRequest:](self, "startSimpleETARequestWithRequest:", v20);
        goto LABEL_14;
      }

- (id)serviceRequester
{
  serviceRequester = self->_serviceRequester;
  if (serviceRequester) {
    return serviceRequester;
  }
  else {
    return (id)objc_claimAutoreleasedReturnValue( +[GEOETAServiceRequester sharedRequester]( &OBJC_CLASS___GEOETAServiceRequester,  "sharedRequester"));
  }
}

- (void)startSimpleETARequestWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOETAReplySimple alloc] initWithRequest:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOETAServer serviceRequester](self, "serviceRequester"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 traits]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 preferredAuditToken]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10003A6BC;
    v14[3] = &unk_10005AD00;
    id v15 = v5;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10003A6E8;
    v12[3] = &unk_100059168;
    id v13 = v15;
    [v7 startSimpleETARequest:v8 traits:v9 auditToken:v10 finished:v14 networkActivity:0 error:v12];
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:](&OBJC_CLASS___NSError, "GEOErrorWithCode:", -10LL));
    [v5 setError:v11];

    [v5 send];
  }
}

- (void)cancelSimpleETARequestWithRequest:(id)a3
{
  id v9 = a3;
  id v4 = [[GEOETAReplySimple alloc] initWithRequest:v9];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v9 request]);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOETAServer serviceRequester](self, "serviceRequester"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v9 request]);
    [v6 cancelSimpleETARequest:v7];
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:](&OBJC_CLASS___NSError, "GEOErrorWithCode:", -10LL));
    [v4 setError:v8];

    [v4 send];
  }
}

- (void)startETARequestWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOETAReplyUpdateable alloc] initWithRequest:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOETAServer serviceRequester](self, "serviceRequester"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 connectionProperties]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 traits]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 preferredAuditToken]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10003A97C;
  v17[3] = &unk_10005AD50;
  id v18 = v4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10003AAB8;
  v15[3] = &unk_10005AD78;
  id v16 = v5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10003AAE4;
  v13[3] = &unk_100059168;
  id v14 = v16;
  id v11 = v16;
  id v12 = v4;
  [v6 startRequest:v7 connectionProperties:v8 traits:v9 auditToken:v10 willSendRequest:v17 finished:v15 networkActivity:0 error:v13];
}

- (void)cancelETARequestWithRequest:(id)a3
{
  id v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[GEOETAServiceRequester sharedRequester](&OBJC_CLASS___GEOETAServiceRequester, "sharedRequester"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 request]);

  [v5 cancelRequest:v4];
}

- (void).cxx_destruct
{
}

@end