@interface SHShazamKitServerMatcher
- (NSISO8601DateFormatter)iso8601Formatter;
- (SHLocationProvider)locationProvider;
- (SHMatcherDelegate)delegate;
- (SHMatcherRequest)matcherRequest;
- (SHNetworkRecognitionRequester)networkRequester;
- (SHShazamKitServerCatalog)catalog;
- (SHShazamKitServerMatcher)initWithCatalog:(id)a3;
- (SHShazamKitServerMatcher)initWithCatalog:(id)a3 recognitionRequester:(id)a4;
- (id)buildURLForSignature:(id)a3 endpoint:(id)a4;
- (id)partnerURLRequestForSignature:(id)a3 endpoint:(id)a4;
- (id)payloadForSignature:(id)a3 withLocation:(id)a4;
- (void)dealloc;
- (void)matchSignature:(id)a3 tokenizedURL:(id)a4;
- (void)responseForServerData:(id)a3 signature:(id)a4;
- (void)setCatalog:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocationProvider:(id)a3;
- (void)setMatcherRequest:(id)a3;
- (void)setNetworkRequester:(id)a3;
- (void)startRecognitionForRequest:(id)a3;
- (void)stopRecognition;
- (void)stopRecognitionForRequestID:(id)a3;
@end

@implementation SHShazamKitServerMatcher

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SHShazamKitServerMatcher;
  -[SHShazamKitServerMatcher dealloc](&v3, "dealloc");
}

- (SHShazamKitServerMatcher)initWithCatalog:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___SHAMSEndpointRequester);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 clientIdentifier]);
  v7 = -[SHAMSEndpointRequester initWithClientIdentifier:clientType:]( v5,  "initWithClientIdentifier:clientType:",  v6,  [v4 clientType]);

  v8 = -[SHShazamKitServerMatcher initWithCatalog:recognitionRequester:]( self,  "initWithCatalog:recognitionRequester:",  v4,  v7);
  return v8;
}

- (SHShazamKitServerMatcher)initWithCatalog:(id)a3 recognitionRequester:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SHShazamKitServerMatcher;
  v9 = -[SHShazamKitServerMatcher init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_catalog, a3);
    objc_storeStrong((id *)&v10->_networkRequester, a4);
  }

  return v10;
}

- (NSISO8601DateFormatter)iso8601Formatter
{
  iso8601Formatter = self->_iso8601Formatter;
  if (!iso8601Formatter)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSISO8601DateFormatter);
    v5 = self->_iso8601Formatter;
    self->_iso8601Formatter = v4;

    -[NSISO8601DateFormatter setFormatOptions:](self->_iso8601Formatter, "setFormatOptions:", 3955LL);
    iso8601Formatter = self->_iso8601Formatter;
  }

  return iso8601Formatter;
}

- (void)responseForServerData:(id)a3 signature:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitServerMatcher catalog](self, "catalog"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000078EC;
  v11[3] = &unk_10006CD60;
  objc_copyWeak(&v15, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  v14 = self;
  [v8 loadContext:v11];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)startRecognitionForRequest:(id)a3
{
  id v4 = a3;
  -[SHShazamKitServerMatcher setMatcherRequest:](self, "setMatcherRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitServerMatcher matcherRequest](self, "matcherRequest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 requestID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitServerMatcher catalog](self, "catalog"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SHLocationProvider locationProviderForRequestIdentifier:clientType:]( SHLocationProvider,  "locationProviderForRequestIdentifier:clientType:",  v7,  [v8 clientType]));
  -[SHShazamKitServerMatcher setLocationProvider:](self, "setLocationProvider:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 signature]);
  objc_initWeak(&location, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitServerMatcher catalog](self, "catalog"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100007B80;
  v13[3] = &unk_10006CD88;
  objc_copyWeak(&v15, &location);
  id v12 = v10;
  id v14 = v12;
  [v11 loadConfiguration:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)matchSignature:(id)a3 tokenizedURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[SHShazamKitServerMatcher partnerURLRequestForSignature:endpoint:]( self,  "partnerURLRequestForSignature:endpoint:",  v6,  v7));
  uint64_t v9 = sh_log_object(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 metrics]);
    [v11 signatureRecordingOffset];
    uint64_t v13 = v12;
    [v6 duration];
    uint64_t v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 dataRepresentation]);
    *(_DWORD *)buf = 134218754;
    uint64_t v24 = v13;
    __int16 v25 = 2048;
    uint64_t v26 = v15;
    __int16 v27 = 2048;
    id v28 = [v16 length];
    __int16 v29 = 2112;
    v30 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Shazam service matching signature with offset %f of duration %f with data of length %lu at %@",  buf,  0x2Au);
  }

  objc_initWeak((id *)buf, self);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitServerMatcher networkRequester](self, "networkRequester"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100007EC0;
  v19[3] = &unk_10006CDB0;
  objc_copyWeak(&v22, (id *)buf);
  id v18 = v6;
  id v20 = v18;
  v21 = self;
  [v17 performRequest:v8 withReply:v19];

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

- (id)partnerURLRequestForSignature:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[SHShazamKitServerMatcher buildURLForSignature:endpoint:]( self,  "buildURLForSignature:endpoint:",  v6,  a4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](&OBJC_CLASS___NSURLRequest, "requestWithURL:", v7));
  id v9 = [v8 mutableCopy];

  [v9 setHTTPMethod:@"POST"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[SHShazamKitServerMatcher payloadForSignature:withLocation:]( self,  "payloadForSignature:withLocation:",  v6,  0LL));

  uint64_t v13 = 0LL;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v10,  0LL,  &v13));
  [v9 setHTTPBody:v11];

  [v9 addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  return v9;
}

- (id)payloadForSignature:(id)a3 withLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 dataRepresentation]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 base64EncodedStringWithOptions:0]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitServerMatcher iso8601Formatter](self, "iso8601Formatter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 audioStartDate]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 stringFromDate:v11]);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 metrics]);
  id v14 = [v13 recordingSource];

  uint64_t v15 = @"unknown";
  if (v14 == (id)2) {
    uint64_t v15 = @"external";
  }
  if (v14 == (id)1) {
    v16 = @"internal";
  }
  else {
    v16 = v15;
  }
  v32[0] = @"signature";
  __int16 v29 = (void *)v9;
  v30[0] = @"uri";
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"data:audio/vnd.shazam.sig;base64,%@",
                    v9));
  v31[0] = v17;
  v31[1] = v16;
  v30[1] = @"audioSource";
  v30[2] = @"startDate";
  id v28 = (void *)v12;
  v31[2] = v12;
  v30[3] = @"recordingOffsetInMilliseconds";
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 metrics]);
  [v18 signatureRecordingOffset];
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v19 * 1000.0));
  v31[3] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  4LL));
  v32[1] = @"sessionDurationInSeconds";
  v33[0] = v21;
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 metrics]);
  [v22 sessionDuration];
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v33[1] = v23;
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  2LL));
  __int16 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v24));

  if (v7)
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[SHLocationProvider anonymizeCoordinatesPayloadForLocation:truncatingToDecimalPlaces:]( &OBJC_CLASS___SHLocationProvider,  "anonymizeCoordinatesPayloadForLocation:truncatingToDecimalPlaces:",  v7,  2LL));
    [v25 setValue:v26 forKey:@"approximateCoordinates"];
  }

  return v25;
}

- (id)buildURLForSignature:(id)a3 endpoint:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 _ID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  [v5 updateToken:1 withValue:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 URLRepresentation]);
  return v8;
}

- (void)stopRecognition
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SHShazamKitServerMatcher matcherRequest](self, "matcherRequest"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v4 requestID]);
  -[SHShazamKitServerMatcher stopRecognitionForRequestID:](self, "stopRecognitionForRequestID:", v3);
}

- (void)stopRecognitionForRequestID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitServerMatcher matcherRequest](self, "matcherRequest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 requestID]);
  unsigned int v7 = [v6 isEqual:v4];

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitServerMatcher matcherRequest](self, "matcherRequest"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 requestID]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitServerMatcher catalog](self, "catalog"));
    id v19 = (id)objc_claimAutoreleasedReturnValue( +[SHLocationProvider locationProviderForRequestIdentifier:clientType:]( SHLocationProvider,  "locationProviderForRequestIdentifier:clientType:",  v10,  [v11 clientType]));

    [v19 stopUpdatingLocation];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SHError privateErrorWithCode:underlyingError:]( &OBJC_CLASS___SHError,  "privateErrorWithCode:underlyingError:",  203LL,  0LL));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitServerMatcher matcherRequest](self, "matcherRequest"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 signature]);
    if (v14)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  v14,  v12));
    }

    else
    {
      v16 = objc_opt_new(&OBJC_CLASS___SHSignature);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  v16,  v12));
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitServerMatcher delegate](self, "delegate"));
    [v17 matcher:self didProduceResponse:v15];

    -[SHShazamKitServerMatcher setDelegate:](self, "setDelegate:", 0LL);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitServerMatcher networkRequester](self, "networkRequester"));
    [v18 invalidate];
  }

- (SHMatcherDelegate)delegate
{
  return (SHMatcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SHShazamKitServerCatalog)catalog
{
  return self->_catalog;
}

- (void)setCatalog:(id)a3
{
}

- (SHNetworkRecognitionRequester)networkRequester
{
  return self->_networkRequester;
}

- (void)setNetworkRequester:(id)a3
{
}

- (SHMatcherRequest)matcherRequest
{
  return self->_matcherRequest;
}

- (void)setMatcherRequest:(id)a3
{
}

- (SHLocationProvider)locationProvider
{
  return self->_locationProvider;
}

- (void)setLocationProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end