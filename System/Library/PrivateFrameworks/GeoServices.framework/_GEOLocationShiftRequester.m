@interface _GEOLocationShiftRequester
- (_GEOLocationShiftRequester)init;
- (id)_validateResponse:(id)a3;
- (void)cancelRequest:(id)a3;
- (void)startWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 completionHandler:(id)a6;
@end

@implementation _GEOLocationShiftRequester

- (_GEOLocationShiftRequester)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____GEOLocationShiftRequester;
  v2 = -[_GEOLocationShiftRequester init](&v6, "init");
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)startWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[_GEOLocationShiftRequestConfig standardConfig]( &OBJC_CLASS____GEOLocationShiftRequestConfig,  "standardConfig"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10001BD0C;
  v16[3] = &unk_100059308;
  id v17 = v10;
  id v15 = v10;
  -[_GEOLocationShiftRequester _startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:]( self,  "_startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:",  v13,  v12,  v11,  v14,  0LL,  0LL,  v16);
}

- (void)cancelRequest:(id)a3
{
}

- (id)_validateResponse:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 status];
  if (v4 != 1)
  {
    if (v4)
    {
      uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:](&OBJC_CLASS___NSError, "GEOErrorWithCode:", -7LL));
      goto LABEL_7;
    }

    if ((unint64_t)[v3 parametersCount] <= 8)
    {
      uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -11LL,  @"Response contains too few parameters"));
LABEL_7:
      objc_super v6 = (void *)v5;
      goto LABEL_8;
    }
  }

  objc_super v6 = 0LL;
LABEL_8:

  return v6;
}

@end