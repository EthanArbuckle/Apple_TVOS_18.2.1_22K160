@interface GEOWiFiQualityServiceLocalProxy
- (GEOWiFiQualityServiceLocalProxy)init;
- (void)cancelRequestId:(id)a3;
- (void)submitWiFiQualityServiceRequest:(id)a3 requestId:(id)a4 auditToken:(id)a5 completionQueue:(id)a6 completion:(id)a7;
- (void)submitWiFiQualityTileLoadForKey:(id)a3 eTag:(id)a4 requestId:(id)a5 auditToken:(id)a6 completionQueue:(id)a7 completion:(id)a8;
@end

@implementation GEOWiFiQualityServiceLocalProxy

- (GEOWiFiQualityServiceLocalProxy)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GEOWiFiQualityServiceLocalProxy;
  v2 = -[GEOWiFiQualityServiceLocalProxy init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  1LL));
    inflightRequests = v2->_inflightRequests;
    v2->_inflightRequests = (NSMutableDictionary *)v3;

    uint64_t v5 = geo_isolater_create("com.apple.geo.wifiqualsvc");
    inflightIsolater = v2->_inflightIsolater;
    v2->_inflightIsolater = (geo_isolater *)v5;
  }

  return v2;
}

- (void)submitWiFiQualityServiceRequest:(id)a3 requestId:(id)a4 auditToken:(id)a5 completionQueue:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  v17 = sub_100027844((id *)objc_alloc(&OBJC_CLASS___GEOWiFiQualityServiceRequester), v16, v15);

  inflightIsolater = self->_inflightIsolater;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10001BFD0;
  v26[3] = &unk_100059048;
  v26[4] = self;
  id v19 = v12;
  id v27 = v19;
  v28 = v17;
  v20 = v17;
  geo_isolate_sync(inflightIsolater, v26);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10001BFE0;
  v23[3] = &unk_100059C28;
  v23[4] = self;
  id v24 = v19;
  id v25 = v13;
  id v21 = v13;
  id v22 = v19;
  sub_1000278EC(v20, v14, v23);
}

- (void)submitWiFiQualityTileLoadForKey:(id)a3 eTag:(id)a4 requestId:(id)a5 auditToken:(id)a6 completionQueue:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a4;
  v20 = sub_100023548((id *)objc_alloc(&OBJC_CLASS___GEOWiFiQualityTileRequester), v14, v19, v18);

  inflightIsolater = self->_inflightIsolater;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10001C238;
  v31[3] = &unk_100059048;
  v31[4] = self;
  id v22 = v15;
  id v32 = v22;
  v33 = v20;
  v23 = v20;
  geo_isolate_sync(inflightIsolater, v31);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10001C248;
  v27[3] = &unk_100059C50;
  v27[4] = self;
  id v28 = v22;
  id v29 = v14;
  id v30 = v16;
  id v24 = v14;
  id v25 = v16;
  id v26 = v22;
  sub_100023604((uint64_t)v23, v17, v27);
}

- (void)cancelRequestId:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_10001C40C;
  id v14 = sub_10001C41C;
  id v15 = 0LL;
  inflightIsolater = self->_inflightIsolater;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001C424;
  v7[3] = &unk_100059070;
  v9 = &v10;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  geo_isolate_sync(inflightIsolater, v7);
  [(id)v11[5] cancel];

  _Block_object_dispose(&v10, 8);
}

- (void).cxx_destruct
{
}

@end