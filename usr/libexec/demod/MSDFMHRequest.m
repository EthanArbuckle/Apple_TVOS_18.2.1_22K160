@interface MSDFMHRequest
- (BOOL)isValid;
- (BOOL)logicSync;
- (Class)getResponseClass;
- (MSDFMHRequest)init;
- (NSDictionary)bundleInfo;
- (NSString)countryCode;
- (NSString)language;
- (NSString)offlineDuration;
- (NSString)storeId;
- (id)getPostData;
- (id)getUrl;
- (id)parseResponseForError:(id)a3 andPayload:(id)a4;
- (void)setBundleInfo:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLogicSync:(BOOL)a3;
- (void)setOfflineDuration:(id)a3;
- (void)setStoreId:(id)a3;
@end

@implementation MSDFMHRequest

- (MSDFMHRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDFMHRequest;
  v2 = -[MSDDemoUnitServerRequest init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDCommandServerRequest setServer:](v2, "setServer:", @"api.demounit.net");
    -[MSDCommandServerRequest setPort:](v3, "setPort:", @"443");
    -[MSDFMHRequest setStoreId:](v3, "setStoreId:", 0LL);
    v4 = v3;
  }

  return v3;
}

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDFMHRequest;
  if (!-[MSDDemoUnitServerRequest isValid](&v6, "isValid")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFMHRequest bundleInfo](self, "bundleInfo"));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (id)getPostData
{
  if (!-[MSDFMHRequest isValid](self, "isValid")) {
    return 0LL;
  }
  BOOL v4 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFMHRequest storeId](self, "storeId"));

  if (v5)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFMHRequest storeId](self, "storeId"));
    [v4 setObject:v6 forKey:@"store_id"];
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFMHRequest bundleInfo](self, "bundleInfo"));
  id v8 = [v7 count];

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFMHRequest bundleInfo](self, "bundleInfo"));
    [v4 setObject:v9 forKey:@"bundle_info"];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFMHRequest countryCode](self, "countryCode"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFMHRequest countryCode](self, "countryCode"));
    [v4 setObject:v11 forKey:@"country"];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFMHRequest language](self, "language"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFMHRequest language](self, "language"));
    [v4 setObject:v13 forKey:@"language"];
  }

  id v14 = sub_10003A95C();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543362;
    v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "FMH payload: %{public}@",  (uint8_t *)&v18,  0xCu);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 convertToNSData]);
  return v16;
}

- (id)getUrl
{
  unsigned int v3 = -[MSDFMHRequest logicSync](self, "logicSync");
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest deviceUDID](self, "deviceUDID"));
  v5 = (void *)v4;
  if (v3)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFMHRequest offlineDuration](self, "offlineDuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/api/device/%@/%@/hub?duration=%@",  @"4",  v5,  v6));
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/api/device/%@/%@/hub",  @"4",  v4));
  }

  return v7;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___MSDFMHResponse, a2);
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MSDFMHRequest;
  id v8 = -[MSDServerRequest parseResponseForError:andPayload:](&v23, "parseResponseForError:andPayload:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);

  if (v10)
  {
    v13 = 0LL;
    v12 = 0LL;
    goto LABEL_19;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"statusCode"]);
  if (!v11)
  {
    id v17 = sub_10003A95C();
    int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000A0400(self);
    }
    v12 = 0LL;
    goto LABEL_17;
  }

  v12 = v11;
  if ([v11 intValue] != 200 && objc_msgSend(v12, "intValue") != 202)
  {
    id v19 = sub_10003A95C();
    int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000A048C(self);
    }
LABEL_17:

    v13 = 0LL;
    goto LABEL_19;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"retryAfter"]);
  if ([v12 intValue] != 202)
  {
    id v22 = v6;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[MSDCommandServerRequest getDataDictFromPayload:error:]( self,  "getDataDictFromPayload:error:",  v7,  &v22));
    id v15 = v22;

    if (v14)
    {
      [v9 setFmhDict:v14];

LABEL_9:
      id v6 = v15;
      goto LABEL_10;
    }

    id v6 = v15;
LABEL_19:
    v20 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);

    if (v20) {
      goto LABEL_10;
    }
    id v21 = v6;
    sub_100087694(&v21, 3727744512LL, @"Unexpected server response.");
    id v15 = v21;

    [v9 setError:v15];
    goto LABEL_9;
  }

  [v9 setRetryAfter:v13];
LABEL_10:

  return v9;
}

- (BOOL)logicSync
{
  return self->_logicSync;
}

- (void)setLogicSync:(BOOL)a3
{
  self->_logicSync = a3;
}

- (NSDictionary)bundleInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setBundleInfo:(id)a3
{
}

- (NSString)offlineDuration
{
  return self->_offlineDuration;
}

- (void)setOfflineDuration:(id)a3
{
  self->_offlineDuration = (NSString *)a3;
}

- (NSString)countryCode
{
  return (NSString *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setLanguage:(id)a3
{
}

- (NSString)storeId
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setStoreId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end