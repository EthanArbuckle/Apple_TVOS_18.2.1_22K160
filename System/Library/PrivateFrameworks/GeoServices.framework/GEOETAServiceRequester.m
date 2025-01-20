@interface GEOETAServiceRequester
+ (GEOETAServiceRequester)sharedRequester;
- (GEOETAServiceRequester)init;
- (id)_keyForRequest:(id)a3;
- (id)_validateResponse:(id)a3;
- (void)cancelRequest:(id)a3;
- (void)cancelSimpleETARequest:(id)a3;
- (void)startRequest:(id)a3 connectionProperties:(id)a4 traits:(id)a5 auditToken:(id)a6 willSendRequest:(id)a7 finished:(id)a8 networkActivity:(id)a9 error:(id)a10;
- (void)startSimpleETARequest:(id)a3 traits:(id)a4 auditToken:(id)a5 finished:(id)a6 networkActivity:(id)a7 error:(id)a8;
@end

@implementation GEOETAServiceRequester

+ (GEOETAServiceRequester)sharedRequester
{
  if (qword_10006B0F0 != -1) {
    dispatch_once(&qword_10006B0F0, &stru_10005AC38);
  }
  return (GEOETAServiceRequester *)(id)qword_10006B0E8;
}

- (GEOETAServiceRequester)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GEOETAServiceRequester;
  v2 = -[GEOETAServiceRequester init](&v6, "init");
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)startSimpleETARequest:(id)a3 traits:(id)a4 auditToken:(id)a5 finished:(id)a6 networkActivity:(id)a7 error:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = (uint64_t (**)(id, uint64_t))a7;
  id v19 = a8;
  v20 = v19;
  if (v18) {
    id v19 = (id)v18[2](v18, 1LL);
  }
  uint64_t Log = GEOGreenTeaGetLog(v19);
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);

  v23 = (void *)objc_claimAutoreleasedReturnValue( +[GEOExperimentConfiguration sharedConfiguration]( &OBJC_CLASS___GEOExperimentConfiguration,  "sharedConfiguration"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 _mapsAbClientMetadata]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 clientDatasetMetadata]);
  [v14 setAbClientMetadata:v25];

  if (![v14 serviceTagsCount])
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[GEOGeoServiceTag defaultTag](&OBJC_CLASS___GEOGeoServiceTag, "defaultTag"));
    [v14 addServiceTag:v26];
  }

  if (GEOConfigGetBOOL( GeoServicesConfig_ValidateSensitiveFieldsAtSend_ETA[0],  GeoServicesConfig_ValidateSensitiveFieldsAtSend_ETA[1])) {
    GEOETARequestRemoveFieldsForSendingRequest(v14);
  }
  v27 = objc_alloc_init(&OBJC_CLASS____GEOSimpleETARequestConfig);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100039A2C;
  v31[3] = &unk_10005A550;
  v32 = v18;
  id v33 = v17;
  id v34 = v20;
  id v28 = v20;
  id v29 = v17;
  v30 = v18;
  -[GEOETAServiceRequester _startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:]( self,  "_startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:",  v14,  v15,  v16,  v27,  0LL,  0LL,  v31);
}

- (void)cancelSimpleETARequest:(id)a3
{
}

- (void)startRequest:(id)a3 connectionProperties:(id)a4 traits:(id)a5 auditToken:(id)a6 willSendRequest:(id)a7 finished:(id)a8 networkActivity:(id)a9 error:(id)a10
{
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  id v17 = (void (**)(id, uint64_t))a9;
  id v18 = a10;
  id v33 = a6;
  id v19 = a5;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[GEOExperimentConfiguration sharedConfiguration]( &OBJC_CLASS___GEOExperimentConfiguration,  "sharedConfiguration"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 _mapsAbClientMetadata]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 clientDatasetMetadata]);
  [v14 setAbClientMetadata:v22];

  v23 = (void *)objc_claimAutoreleasedReturnValue( +[GEOAdditionalEnabledMarkets additionalEnabledMarkets]( &OBJC_CLASS___GEOAdditionalEnabledMarkets,  "additionalEnabledMarkets"));
  [v14 setAdditionalEnabledMarkets:v23];

  if (![v14 serviceTagsCount])
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[GEOGeoServiceTag defaultTag](&OBJC_CLASS___GEOGeoServiceTag, "defaultTag"));
    [v14 addServiceTag:v24];
  }

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100039DC0;
  v41[3] = &unk_10005AC88;
  id v42 = v15;
  id v25 = v15;
  v26 = objc_retainBlock(v41);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_100039ED8;
  v39[3] = &unk_10005ACB0;
  id v40 = v16;
  id v27 = v16;
  id v28 = objc_retainBlock(v39);
  if (GEOConfigGetBOOL( GeoServicesConfig_ValidateSensitiveFieldsAtSend_ETA[0],  GeoServicesConfig_ValidateSensitiveFieldsAtSend_ETA[1])
    && GEOETATrafficUpdateRequestHasSensitiveFields(v14, 0LL))
  {
    [v14 clearSensitiveFields:0];
  }

  if (v17) {
    v17[2](v17, 1LL);
  }
  id v29 = objc_alloc_init(&OBJC_CLASS____GEOTrafficUpdateETARequestConfig);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10003A078;
  v35[3] = &unk_10005A550;
  v36 = v17;
  id v37 = v18;
  id v38 = v28;
  v30 = v28;
  id v31 = v18;
  v32 = v17;
  -[GEOETAServiceRequester _startWithRequest:traits:auditToken:config:throttleToken:options:willSendRequestHandler:completionHandler:]( self,  "_startWithRequest:traits:auditToken:config:throttleToken:options:willSendRequestHandler:completionHandler:",  v14,  v19,  v33,  v29,  0LL,  0LL,  v26,  v35);
}

- (id)_keyForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___GEOETATrafficUpdateRequest, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 xpcUuid]);
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___GEOETAServiceRequester;
    id v8 = -[GEOETAServiceRequester _keyForRequest:](&v11, "_keyForRequest:", v4);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v8);
  }

  v9 = (void *)v7;

  return v9;
}

- (void)cancelRequest:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GEOETAServiceRequester;
  -[GEOETAServiceRequester _cancelRequest:](&v3, "_cancelRequest:", a3);
}

- (id)_validateResponse:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___GEOETAResponse, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) == 0)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___GEOETATrafficUpdateResponse, v6);
    if ((objc_opt_isKindOfClass(v3, v8) & 1) == 0)
    {
      v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Response is of unexpected type %@",  objc_opt_class(v3, v9));
      id v10 = (id)objc_claimAutoreleasedReturnValue(v13);
      uint64_t v14 = DefaultLoggingSubsystem;
      uint64_t v15 = GEOURLLogFacility(5LL);
      id v16 = objc_claimAutoreleasedReturnValue(v15);
      uint64_t Log = GEOFindOrCreateLog(v14, [v16 UTF8String]);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v10;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:reason:](&OBJC_CLASS___NSError, "GEOErrorWithCode:reason:", -13LL, v10));
      goto LABEL_21;
    }

    id v10 = v3;
    int v11 = [v10 status];
    uint64_t v7 = 0LL;
    if (v11 > 19)
    {
      if (v11 != 20)
      {
        if (v11 == 60)
        {
          uint64_t v12 = -28LL;
          goto LABEL_17;
        }

@end