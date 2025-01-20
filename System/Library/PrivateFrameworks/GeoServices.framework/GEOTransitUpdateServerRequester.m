@interface GEOTransitUpdateServerRequester
+ (GEOTransitUpdateServerRequester)sharedRequester;
- (void)cancelSimpleTransitRouteUpdateRequest:(id)a3;
- (void)startSimpleTransitRouteUpdateRequest:(id)a3 auditToken:(id)a4 networkActivity:(id)a5 completion:(id)a6;
@end

@implementation GEOTransitUpdateServerRequester

+ (GEOTransitUpdateServerRequester)sharedRequester
{
  if (qword_10006B0E0 != -1) {
    dispatch_once(&qword_10006B0E0, &stru_10005ABF0);
  }
  return (GEOTransitUpdateServerRequester *)(id)qword_10006B0D8;
}

- (void)startSimpleTransitRouteUpdateRequest:(id)a3 auditToken:(id)a4 networkActivity:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, uint64_t))a5;
  id v13 = a6;
  if (v12) {
    v12[2](v12, 1LL);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[_GEOTransitRouteUpdateRequestConfig standardConfig]( &OBJC_CLASS____GEOTransitRouteUpdateRequestConfig,  "standardConfig"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100038F2C;
  v17[3] = &unk_10005AC18;
  v18 = v12;
  id v19 = v13;
  id v15 = v13;
  v16 = v12;
  -[GEOTransitUpdateServerRequester _startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:]( self,  "_startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:",  v10,  0LL,  v11,  v14,  0LL,  0LL,  v17);
}

- (void)cancelSimpleTransitRouteUpdateRequest:(id)a3
{
}

@end