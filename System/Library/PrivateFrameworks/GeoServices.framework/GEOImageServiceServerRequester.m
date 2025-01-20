@interface GEOImageServiceServerRequester
+ (GEOImageServiceServerRequester)sharedRequester;
- (void)cancelSimpleImageServiceRequest:(id)a3;
- (void)startSimpleImageServiceRequest:(id)a3 auditToken:(id)a4 finished:(id)a5 networkActivity:(id)a6 error:(id)a7;
@end

@implementation GEOImageServiceServerRequester

+ (GEOImageServiceServerRequester)sharedRequester
{
  if (qword_10006B068 != -1) {
    dispatch_once(&qword_10006B068, &stru_10005A528);
  }
  return (GEOImageServiceServerRequester *)(id)qword_10006B060;
}

- (void)startSimpleImageServiceRequest:(id)a3 auditToken:(id)a4 finished:(id)a5 networkActivity:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (void (**)(id, uint64_t))a6;
  id v16 = a7;
  if (v15) {
    v15[2](v15, 1LL);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[_GEOImageServiceRequestConfig standardConfig]( &OBJC_CLASS____GEOImageServiceRequestConfig,  "standardConfig"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10002CDEC;
  v21[3] = &unk_10005A550;
  v22 = v15;
  id v23 = v14;
  id v24 = v16;
  id v18 = v16;
  id v19 = v14;
  v20 = v15;
  -[GEOImageServiceServerRequester _startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:]( self,  "_startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:",  v12,  0LL,  v13,  v17,  0LL,  0LL,  v21);
}

- (void)cancelSimpleImageServiceRequest:(id)a3
{
}

@end