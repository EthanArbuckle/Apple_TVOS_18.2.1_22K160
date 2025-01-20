@interface GEODirectionsRequesterLocalProxy
- (GEODirectionsRequesterLocalProxy)init;
- (id)_validateResponse:(id)a3;
- (void)cancelRequest:(id)a3;
- (void)startRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 useBackgroundURL:(BOOL)a6 requestPriority:(id)a7 callbackQueue:(id)a8 finished:(id)a9 networkActivity:(id)a10 error:(id)a11;
@end

@implementation GEODirectionsRequesterLocalProxy

- (GEODirectionsRequesterLocalProxy)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GEODirectionsRequesterLocalProxy;
  return -[GEODirectionsRequesterLocalProxy init](&v3, "init");
}

- (void)startRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 useBackgroundURL:(BOOL)a6 requestPriority:(id)a7 callbackQueue:(id)a8 finished:(id)a9 networkActivity:(id)a10 error:(id)a11
{
  BOOL v13 = a6;
  id v16 = a3;
  id v42 = a4;
  id v17 = a5;
  id v18 = a7;
  id v41 = a8;
  id v19 = a9;
  v20 = (uint64_t (**)(id, uint64_t))a10;
  id v21 = a11;
  v22 = v21;
  if (v20) {
    id v21 = (id)v20[2](v20, 1LL);
  }
  uint64_t Log = GEOGreenTeaGetLog(v21);
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);

  v26 = &off_100058498;
  if (!v13) {
    v26 = &off_100058550;
  }
  id v27 = objc_msgSend(objc_alloc((Class)objc_opt_class(*v26, v25)), "initWithRequest:requestPriority:", v16, v18);
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[GEOExperimentConfiguration sharedConfiguration]( &OBJC_CLASS___GEOExperimentConfiguration,  "sharedConfiguration"));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 _mapsAbClientMetadata]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 clientDatasetMetadata]);
  [v16 setAbClientMetadata:v30];

  v31 = (void *)objc_claimAutoreleasedReturnValue([v17 bundleId]);
  LODWORD(v28) = [v31 isEqualToString:MapsAppBundleId];

  if ((_DWORD)v28)
  {
    id v32 = objc_alloc(&OBJC_CLASS___GEOLocalTime);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v34 = [v32 initWithDate:v33];
    v35 = (void *)objc_claimAutoreleasedReturnValue([v16 clientCapabilities]);
    [v35 setRequestTime:v34];
  }

  if (![v16 serviceTagsCount])
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[GEOGeoServiceTag defaultTag](&OBJC_CLASS___GEOGeoServiceTag, "defaultTag"));
    [v16 addServiceTag:v36];
  }

  if (GEOConfigGetBOOL( GeoServicesConfig_ValidateSensitiveFieldsAtSend_Directions[0],  GeoServicesConfig_ValidateSensitiveFieldsAtSend_Directions[1])
    && GEODirectionsRequestHasSensitiveFields(v16, 0LL))
  {
    [v16 clearSensitiveFields:0];
  }

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_10002FFE4;
  v43[3] = &unk_10005A550;
  v44 = v20;
  id v45 = v19;
  id v46 = v22;
  id v37 = v22;
  id v38 = v19;
  v39 = v20;
  -[GEODirectionsRequesterLocalProxy _startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:]( self,  "_startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:",  v16,  v42,  v17,  v27,  0LL,  0LL,  v43);
}

- (void)cancelRequest:(id)a3
{
}

- (id)_validateResponse:(id)a3
{
  id v3 = a3;
  id v4 = [[GEODirectionsError alloc] initWithResponse:v3];
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEODirectionsError key](&OBJC_CLASS___GEODirectionsError, "key"));
    v15 = v5;
    id v16 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  }

  else
  {
    v6 = 0LL;
  }

  int v7 = [v3 status];
  if (v7 <= 4)
  {
    if (!v7)
    {
      v11 = 0LL;
      goto LABEL_18;
    }

    if (v7 == 1)
    {
      uint64_t v8 = -8LL;
      goto LABEL_17;
    }

@end