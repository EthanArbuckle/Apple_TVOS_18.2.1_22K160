@interface GEODirectionsRequestConfig
- ($8E8A1DFF6E8C798DDDF56DAB3917D12E)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (BOOL)usesBackgroundURL;
- (GEODirectionsRequestConfig)initWithRequest:(id)a3 requestPriority:(id)a4;
- (id)additionalHTTPHeaders;
- (id)additionalStatesForNetworkEvent;
- (id)additionalURLQueryItems;
- (id)serviceTypeNumber;
- (unint64_t)multipathServiceType;
- (unint64_t)urlType;
@end

@implementation GEODirectionsRequestConfig

- (GEODirectionsRequestConfig)initWithRequest:(id)a3 requestPriority:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___GEODirectionsRequestConfig;
  v9 = -[GEODirectionsRequestConfig init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    v11 = (NSNumber *)[v8 copy];
    requestPriority = v10->_requestPriority;
    v10->_requestPriority = v11;
  }

  return v10;
}

- (unint64_t)urlType
{
  return 2LL;
}

- (id)additionalURLQueryItems
{
  uint64_t String = GEOConfigGetString( GeoServicesConfig_ExperimentalDirectionsService[0],  GeoServicesConfig_ExperimentalDirectionsService[1]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(String);
  if (![v4 length]) {
    goto LABEL_8;
  }
  else {
    v5 = @"http://www.apple.com/?";
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v4));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](&OBJC_CLASS___NSURLComponents, "componentsWithString:", v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 queryItems]);

  if (!v8)
  {

LABEL_8:
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___GEODirectionsRequestConfig;
    id v10 = -[GEODirectionsRequestConfig additionalURLQueryItems](&v12, "additionalURLQueryItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
    goto LABEL_9;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 queryItems]);

LABEL_9:
  return v9;
}

- (id)additionalHTTPHeaders
{
  requestPriority = self->_requestPriority;
  if (!requestPriority) {
    return 0LL;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld",  -[NSNumber integerValue](requestPriority, "integerValue")));
  v6 = @"x-msg-priority";
  id v7 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));

  return v4;
}

- (id)serviceTypeNumber
{
  return +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 4LL);
}

- ($8E8A1DFF6E8C798DDDF56DAB3917D12E)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($8E8A1DFF6E8C798DDDF56DAB3917D12E)512LL;
}

- (unint64_t)multipathServiceType
{
  return GEOConfigGetInteger( GeoServicesConfig_DirectionsMPTCPServiceType[0],  GeoServicesConfig_DirectionsMPTCPServiceType[1]);
}

- (id)additionalStatesForNetworkEvent
{
  id v3 = objc_alloc_init(&OBJC_CLASS___GEOLogMsgState);
  id v4 = objc_alloc_init(&OBJC_CLASS___GEOLogMsgStateDirectionsDetail);
  [v3 setDirectionsDetail:v4];

  [v3 setStateType:721];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEODirectionsRequest routeAttributes](self->_request, "routeAttributes"));
  unsigned int v6 = [v5 hasMainTransportType];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEODirectionsRequest routeAttributes](self->_request, "routeAttributes"));
    id v8 = [v7 mainTransportType];
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 directionsDetail]);
    [v9 setTransportType:v8];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEODirectionsRequest routeAttributes](self->_request, "routeAttributes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 automobileOptions]);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 vehicleSpecifications]);
  id v13 = [v12 hasEvInfo];
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v3 directionsDetail]);
  [v14 setIsEv:v13];

  id v17 = v3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));

  return v15;
}

- (BOOL)usesBackgroundURL
{
  return 0;
}

- (void).cxx_destruct
{
}

@end