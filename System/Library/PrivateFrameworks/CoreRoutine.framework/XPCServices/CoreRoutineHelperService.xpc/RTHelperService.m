@interface RTHelperService
+ (id)computeMetricsForAnalyticsIdentifier:(id)a3 appIdentifier:(id)a4 requestType:(unint64_t)a5 mapItems:(id)a6 serviceError:(id)a7 isBackgroundRequest:(BOOL)a8;
+ (id)exposedErrorFrom:(id)a3;
+ (void)submitMetricsForAnalyticsIdentifier:(id)a3 appIdentifier:(id)a4 requestType:(unint64_t)a5 mapItems:(id)a6 serviceError:(id)a7 isBackgroundRequest:(BOOL)a8;
- (BOOL)insideBusinessHours:(id)a3 date:(id)a4 timeZone:(id)a5;
- (RTHelperService)init;
- (RTHelperService)initWithGeoMapService:(id)a3;
- (double)confidenceWeightForGeoMapItem:(id)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6;
- (double)weightBasedOnBusinessHours:(id)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6;
- (double)weightBasedOnDurationWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 poiCategory:(id)a6;
- (id)_buildingPolygonsFromGEOBuilding:(id)a3;
- (id)_mapItemFromGEOMapItem:(id)a3 mapItemSource:(unint64_t)a4 confidenceScalingFactor:(double)a5;
- (id)_mapItemsFromGEOMapItems:(id)a3 mapItemSource:(unint64_t)a4;
- (id)defaultTraitsForOptions:(id)a3 selector:(SEL)a4;
- (id)getDefaultMapServiceOptions;
- (void)_relatedPlacesMapItemsIdentifiersForGEOMapItem:(id)a3 relatedPlaceListType:(int)a4 handler:(id)a5;
- (void)_relatedPlacesMapItemsIdentifiersForGEOMapItems:(id)a3 relatedPlaceListType:(int)a4 handler:(id)a5;
- (void)addTicket:(id)a3;
- (void)cancelTicket:(id)a3;
- (void)createMapItemWithIdentifier:(id)a3 geoMapItemStorage:(id)a4 source:(unint64_t)a5 creationDate:(id)a6 handler:(id)a7;
- (void)dealloc;
- (void)fetchAppClipURLsForMapItem:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchBuildingPolygonsFromLocation:(id)a3 radius:(double)a4 handler:(id)a5;
- (void)fetchCountryAndSubdivisionCodesFromLocation:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchGeoMapItemFromHandle:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchMapGEOItemsFromLocation:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchMapItemFromHandle:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchMapItemsFromAddressDictionary:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchMapItemsFromAddressString:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchMapItemsFromIdentifiers:(id)a3 options:(id)a4 source:(unint64_t)a5 handler:(id)a6;
- (void)fetchMapItemsFromLocation:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchMapItemsFromLocations:(id)a3 accessPoints:(id)a4 startDate:(id)a5 endDate:(id)a6 options:(id)a7 handler:(id)a8;
- (void)fetchMapItemsFromNaturalLanguageQuery:(id)a3 location:(id)a4 options:(id)a5 handler:(id)a6;
- (void)fetchMapItemsRelatedPlacesFromLocation:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchPointOfInterestAttributesWithIdentifier:(unint64_t)a3 options:(id)a4 handler:(id)a5;
- (void)fetchPointOfInterestsAroundCoordinate:(id)a3 radius:(double)a4 options:(id)a5 handler:(id)a6;
- (void)fetchPostalAddressForMapItem:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchRelatedPlacesMapItemsForGEOMapItem:(id)a3 relatedPlaceListType:(int)a4 options:(id)a5 source:(unint64_t)a6 handler:(id)a7;
- (void)fetchRelatedPlacesMapItemsForMapItem:(id)a3 relatedPlaceListType:(int)a4 options:(id)a5 source:(unint64_t)a6 handler:(id)a7;
- (void)removeTicket:(id)a3;
@end

@implementation RTHelperService

- (RTHelperService)init
{
  v3 = objc_opt_new(&OBJC_CLASS___GEOMapService);
  v4 = -[RTHelperService initWithGeoMapService:](self, "initWithGeoMapService:", v3);

  return v4;
}

- (RTHelperService)initWithGeoMapService:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___RTHelperService;
    v6 = -[RTHelperService init](&v18, "init");
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_geoMapService, a3);
      v8 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
      tickets = v7->_tickets;
      v7->_tickets = v8;

      v10 = -[GEOMapFeatureAccess initWithQueue:memoryCacheCountLimit:memoryCacheCostLimit:]( objc_alloc(&OBJC_CLASS___GEOMapFeatureAccess),  "initWithQueue:memoryCacheCountLimit:memoryCacheCostLimit:",  &_dispatch_main_q,  0LL,  0LL);
      mapFeatureAccess = v7->_mapFeatureAccess;
      v7->_mapFeatureAccess = v10;

      -[GEOMapFeatureAccess setAllowNetworkTileLoad:](v7->_mapFeatureAccess, "setAllowNetworkTileLoad:", 1LL);
      v20[0] = GEOPOICategoryGasStation;
      v20[1] = GEOPOICategoryHospital;
      v21[0] = &off_100025968;
      v21[1] = &off_1000259B0;
      v20[2] = GEOPOICategoryRestaurant;
      v21[2] = &off_1000259F8;
      uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  3LL));
      bluePOICategoryToDurationThresholdMapping = v7->_bluePOICategoryToDurationThresholdMapping;
      v7->_bluePOICategoryToDurationThresholdMapping = (NSDictionary *)v12;
    }

    self = v7;
    v14 = self;
  }

  else
  {
    id v15 = sub_10000B294(&qword_10002D0A0);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: geoMapService",  buf,  2u);
    }

    v14 = 0LL;
  }

  return v14;
}

- (void)addTicket:(id)a3
{
  if (a3)
  {
    -[NSMutableSet addObject:](self->_tickets, "addObject:");
  }

  else
  {
    id v3 = sub_10000B294(&qword_10002D0A0);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      v6 = "-[RTHelperService addTicket:]";
      __int16 v7 = 1024;
      int v8 = 186;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: ticket (in %s:%d)",  (uint8_t *)&v5,  0x12u);
    }
  }

- (void)removeTicket:(id)a3
{
  if (a3)
  {
    -[NSMutableSet removeObject:](self->_tickets, "removeObject:");
  }

  else
  {
    id v3 = sub_10000B294(&qword_10002D0A0);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      v6 = "-[RTHelperService removeTicket:]";
      __int16 v7 = 1024;
      int v8 = 197;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: ticket (in %s:%d)",  (uint8_t *)&v5,  0x12u);
    }
  }

- (void)cancelTicket:(id)a3
{
  if (a3)
  {
    [a3 cancel];
  }

  else
  {
    id v3 = sub_10000B294(&qword_10002D0A0);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      v6 = "-[RTHelperService cancelTicket:]";
      __int16 v7 = 1024;
      int v8 = 208;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: ticket (in %s:%d)",  (uint8_t *)&v5,  0x12u);
    }
  }

- (void)dealloc
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = self->_tickets;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      __int16 v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        -[RTHelperService cancelTicket:](self, "cancelTicket:", *(void *)(*((void *)&v9 + 1) + 8LL * (void)v7));
        __int16 v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RTHelperService;
  -[RTHelperService dealloc](&v8, "dealloc");
}

- (id)getDefaultMapServiceOptions
{
  return  [[RTMapServiceOptions alloc] initWithUseBackgroundTraits:1 analyticsIdentifier:0 clientIdentifier:0];
}

- (id)defaultTraitsForOptions:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  if (!v6) {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[RTHelperService getDefaultMapServiceOptions](self, "getDefaultMapServiceOptions"));
  }
  id v7 = sub_10000B294(&qword_10002D0E8);
  objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue([v6 analyticsIdentifier]);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v6 clientIdentifier]);
    *(_DWORD *)buf = 138412546;
    v34 = v29;
    __int16 v35 = 2112;
    v36 = v30;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "RTMapServiceOptions: analytics indentifier: %@, app identifier: %@",  buf,  0x16u);
  }

  unsigned int v9 = [v6 useBackgroundTraits];
  geoMapService = self->_geoMapService;
  if (v9) {
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[GEOMapService defaultBackgroundTraits](geoMapService, "defaultBackgroundTraits"));
  }
  else {
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[GEOMapService defaultTraits](geoMapService, "defaultTraits"));
  }
  __int128 v12 = (void *)v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 clientIdentifier]);

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 appIdentifier]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 clientIdentifier]);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@|%@", v14, v15));
    [v12 setAppIdentifier:v16];
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v12 appIdentifier]);
  [v12 setAnalyticsAppIdentifier:v17];

  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v6 analyticsIdentifier]);
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v12 analyticsAppIdentifier]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v6 analyticsIdentifier]);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@|%@", v19, v20));
    [v12 setAnalyticsAppIdentifier:v21];
  }

  if (a4)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v12 analyticsAppIdentifier]);
    v23 = NSStringFromSelector(a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@|%@", v22, v24));
    [v12 setAnalyticsAppIdentifier:v25];
  }

  id v26 = sub_10000B294(&qword_10002D0E8);
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue([v12 analyticsAppIdentifier]);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v12 appIdentifier]);
    *(_DWORD *)buf = 138412546;
    v34 = v31;
    __int16 v35 = 2112;
    v36 = v32;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "GEOMapServiceTraits: analytics app indentifier: %@, app identifier: %@",  buf,  0x16u);
  }

  return v12;
}

- (void)fetchMapItemFromHandle:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v9)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10000D4D0;
      v17[3] = &unk_1000246F8;
      id v12 = v9;
      id v18 = v12;
      SEL v21 = a2;
      v19 = self;
      id v20 = v11;
      v13 = objc_retainBlock(v17);
      -[RTHelperService fetchGeoMapItemFromHandle:options:handler:]( self,  "fetchGeoMapItemFromHandle:options:handler:",  v12,  v10,  v13);

      v14 = v18;
    }

    else
    {
      uint64_t v15 = RTErrorDomain;
      NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
      v23 = @"requires valid handle.";
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  7LL,  v14));
      (*((void (**)(id, void, void *))v11 + 2))(v11, 0LL, v16);
    }
  }
}

- (void)fetchGeoMapItemFromHandle:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void, void, void))v10;
  if (v8)
  {
    if (v10)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[RTHelperService defaultTraitsForOptions:selector:]( self,  "defaultTraitsForOptions:selector:",  v9,  "resolveMapItemFromHandle:traits:completionHandler:"));
      geoMapService = self->_geoMapService;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_10000D948;
      void v20[3] = &unk_100024748;
      v20[4] = self;
      id v21 = v8;
      v24 = v11;
      id v22 = v9;
      id v23 = v12;
      v14 = v12;
      -[GEOMapService resolveMapItemFromHandle:traits:completionHandler:]( geoMapService,  "resolveMapItemFromHandle:traits:completionHandler:",  v21,  v14,  v20);

      goto LABEL_10;
    }
  }

  else
  {
    id v15 = sub_10000B294(&qword_10002D0A0);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[RTHelperService fetchGeoMapItemFromHandle:options:handler:]";
      __int16 v29 = 1024;
      int v30 = 334;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: handle (in %s:%d)",  buf,  0x12u);
    }

    if (v11)
    {
      uint64_t v17 = RTErrorDomain;
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      id v26 = @"requires valid handle.";
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v17,  7LL,  v14));
      ((void (**)(void, void, void *))v11)[2](v11, 0LL, v18);

      goto LABEL_10;
    }
  }

  id v19 = sub_10000B294(&qword_10002D0A0);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[RTHelperService fetchGeoMapItemFromHandle:options:handler:]";
    __int16 v29 = 1024;
    int v30 = 335;
    _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: handler (in %s:%d)",  buf,  0x12u);
  }

- (id)_mapItemsFromGEOMapItems:(id)a3 mapItemSource:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingTimeInterval:4838400.0]);
  id v9 = -[_RTMap initWithInput:](objc_alloc(&OBJC_CLASS____RTMap), "initWithInput:", v6);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000DC4C;
  v14[3] = &unk_100024770;
  v14[4] = self;
  id v15 = v7;
  id v16 = v8;
  unint64_t v17 = a4;
  id v10 = v8;
  id v11 = v7;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[_RTMap withBlock:](v9, "withBlock:", v14));

  return v12;
}

- (id)_mapItemFromGEOMapItem:(id)a3 mapItemSource:(unint64_t)a4 confidenceScalingFactor:(double)a5
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v8 dateByAddingTimeInterval:4838400.0]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMapService handleForMapItem:](self->_geoMapService, "handleForMapItem:", v7));
  id v10 = objc_alloc(&OBJC_CLASS___NSString);
  id v11 = -[NSString initWithCString:encoding:](v10, "initWithCString:encoding:", off_10002D120, 1LL);
  NSErrorUserInfoKey v25 = @"geoMapItemHandleSize";
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 length]));
  id v26 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
  sub_10000C330(v11, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.%@", v11));
  id v23 = @"geoMapItemHandleSize";
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 length]));
  v24 = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
  AnalyticsSendEvent(v14, v16);

  unint64_t v17 = objc_alloc(&OBJC_CLASS___RTMapItem);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v19 = -[RTMapItem initWithIdentifier:geoMapItem:geoMapItemHandle:source:creationDate:expirationDate:confidenceScalingFactor:]( v17,  "initWithIdentifier:geoMapItem:geoMapItemHandle:source:creationDate:expirationDate:confidenceScalingFactor:",  v18,  v7,  v9,  a4,  v8,  v21,  a5);

  return v19;
}

- (void)fetchMapItemsFromNaturalLanguageQuery:(id)a3 location:(id)a4 options:(id)a5 handler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v14)
  {
    if ([v11 length])
    {
      if (v12)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue( -[RTHelperService defaultTraitsForOptions:selector:]( self,  "defaultTraitsForOptions:selector:",  v13,  "ticketForSearchQuery:completionItem:maxResults:traits:"));
        [v12 latitude];
        double v17 = v16;
        [v12 longitude];
        double v19 = v18;
        [v12 horizontalUncertainty];
        double v21 = v20;
        id v22 = [v12 horizontalUncertainty];
        GEOCoordinateRegionMakeWithDistance(v22, v17, v19, v21, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue( +[GEOMapRegion _geo_mapRegionForGEOCoordinateRegion:]( &OBJC_CLASS___GEOMapRegion,  "_geo_mapRegionForGEOCoordinateRegion:"));
        [v15 setMapRegion:v24];

        NSErrorUserInfoKey v25 = (void *)objc_claimAutoreleasedReturnValue( -[GEOMapService ticketForSearchQuery:completionItem:maxResults:traits:]( self->_geoMapService,  "ticketForSearchQuery:completionItem:maxResults:traits:",  v11,  0LL,  5LL,  v15));
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = sub_10000E324;
        v30[3] = &unk_100024800;
        v30[4] = self;
        SEL v35 = a2;
        id v31 = v11;
        id v34 = v14;
        id v32 = v13;
        id v33 = v15;
        id v26 = v15;
        [v25 submitWithHandler:v30 networkActivity:0];

LABEL_8:
        goto LABEL_9;
      }

      uint64_t v27 = RTErrorDomain;
      NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
      v37 = @"requires a valid location.";
      v28 = &v37;
      __int16 v29 = &v36;
    }

    else
    {
      uint64_t v27 = RTErrorDomain;
      NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
      v39 = @"requires a valid natural language query.";
      v28 = &v39;
      __int16 v29 = &v38;
    }

    NSErrorUserInfoKey v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v29,  1LL));
    id v26 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v27,  7LL,  v25));
    (*((void (**)(id, void, id))v14 + 2))(v14, 0LL, v26);
    goto LABEL_8;
  }

- (void)fetchMapGEOItemsFromLocation:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v9)
    {
      id v12 = -[GEOLocation initWithRTLocation:includeTimeStamp:]( objc_alloc(&OBJC_CLASS___GEOLocation),  "initWithRTLocation:includeTimeStamp:",  v9,  1LL);
      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[RTHelperService defaultTraitsForOptions:selector:]( self,  "defaultTraitsForOptions:selector:",  v10,  "ticketForReverseGeocodeLocation:preserveOriginalLocation:placeTypeLimit:traits:"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue( -[GEOMapService ticketForReverseGeocodeLocation:preserveOriginalLocation:placeTypeLimit:traits:]( self->_geoMapService,  "ticketForReverseGeocodeLocation:preserveOriginalLocation:placeTypeLimit:traits:",  v12,  0LL,  0LL,  v13));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10000E848;
      v17[3] = &unk_100024800;
      SEL v23 = a2;
      id v18 = v9;
      id v22 = v11;
      double v19 = self;
      id v20 = v10;
      id v21 = v13;
      id v15 = v13;
      [v14 submitWithHandler:v17 networkActivity:0];
    }

    else
    {
      uint64_t v16 = RTErrorDomain;
      NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
      NSErrorUserInfoKey v25 = @"requires a valid location.";
      id v12 = (GEOLocation *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v16,  7LL,  v12));
      (*((void (**)(id, void, void *))v11 + 2))(v11, 0LL, v14);
    }
  }
}

- (void)fetchMapItemsFromLocation:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v9)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_10000EBB4;
      v15[3] = &unk_1000247B8;
      v15[4] = self;
      SEL v18 = a2;
      id v16 = v9;
      id v17 = v11;
      -[RTHelperService fetchMapGEOItemsFromLocation:options:handler:]( self,  "fetchMapGEOItemsFromLocation:options:handler:",  v16,  v10,  v15);
    }

    else
    {
      uint64_t v12 = RTErrorDomain;
      NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
      id v20 = @"requires a valid location.";
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v12,  7LL,  v13));
      (*((void (**)(id, void, void *))v11 + 2))(v11, 0LL, v14);
    }
  }
}

- (void)fetchMapItemsRelatedPlacesFromLocation:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v9)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10000F014;
      v16[3] = &unk_100024828;
      v16[4] = self;
      SEL v20 = a2;
      id v17 = v9;
      id v18 = v12;
      id v19 = v11;
      id v13 = v12;
      -[RTHelperService fetchMapGEOItemsFromLocation:options:handler:]( self,  "fetchMapGEOItemsFromLocation:options:handler:",  v17,  v10,  v16);
    }

    else
    {
      uint64_t v14 = RTErrorDomain;
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      id v22 = @"requires a valid location.";
      id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  7LL,  v13));
      (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0LL, 0LL, v15);
    }
  }
}

- (void)fetchMapItemsFromIdentifiers:(id)a3 options:(id)a4 source:(unint64_t)a5 handler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v13)
  {
    if ([v11 count])
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[RTHelperService defaultTraitsForOptions:selector:]( self,  "defaultTraitsForOptions:selector:",  v12,  "ticketForReverseGeocodeLocation:preserveOriginalLocation:placeTypeLimit:traits:"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue( -[GEOMapService ticketForIdentifiers:traits:]( self->_geoMapService,  "ticketForIdentifiers:traits:",  v11,  v14));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10000F7F0;
      v18[3] = &unk_100024850;
      v18[4] = self;
      unint64_t v23 = a5;
      SEL v24 = a2;
      id v19 = v11;
      id v22 = v13;
      id v20 = v12;
      id v21 = v14;
      id v16 = v14;
      [v15 submitWithHandler:v18 networkActivity:0];
    }

    else
    {
      uint64_t v17 = RTErrorDomain;
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      id v26 = @"requires a list of GEOMapItem identifiers.";
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
      id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v17,  7LL,  v15));
      (*((void (**)(id, void, id))v13 + 2))(v13, 0LL, v16);
    }
  }
}

- (void)fetchRelatedPlacesMapItemsForMapItem:(id)a3 relatedPlaceListType:(int)a4 options:(id)a5 source:(unint64_t)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  if (v14)
  {
    if (v12)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 geoMapItemHandle]);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_10000FCC4;
      v19[3] = &unk_100024878;
      v19[4] = self;
      int v23 = a4;
      id v20 = v13;
      unint64_t v22 = a6;
      id v21 = v14;
      -[RTHelperService fetchGeoMapItemFromHandle:options:handler:]( self,  "fetchGeoMapItemFromHandle:options:handler:",  v15,  v20,  v19);
    }

    else
    {
      uint64_t v16 = RTErrorDomain;
      NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
      NSErrorUserInfoKey v25 = @"requires a map item.";
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v16,  7LL,  v17));
      (*((void (**)(id, void, void *))v14 + 2))(v14, 0LL, v18);
    }
  }
}

- (void)fetchRelatedPlacesMapItemsForGEOMapItem:(id)a3 relatedPlaceListType:(int)a4 options:(id)a5 source:(unint64_t)a6 handler:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000FD9C;
  v13[3] = &unk_1000247B8;
  id v14 = self;
  id v15 = a5;
  id v16 = a7;
  unint64_t v17 = a6;
  id v11 = v16;
  id v12 = v15;
  -[RTHelperService _relatedPlacesMapItemsIdentifiersForGEOMapItem:relatedPlaceListType:handler:]( v14,  "_relatedPlacesMapItemsIdentifiersForGEOMapItem:relatedPlaceListType:handler:",  a3,  v9,  v13);
}

- (void)_relatedPlacesMapItemsIdentifiersForGEOMapItems:(id)a3 relatedPlaceListType:(int)a4 handler:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, id, void *))a5;
  if (v9)
  {
    if ([v8 count])
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_10000FFAC;
      v26[3] = &unk_1000248C8;
      int v29 = a4;
      v26[4] = self;
      id v27 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      id v28 = v10;
      id v11 = v27;
      [v8 enumerateObjectsUsingBlock:v26];
      if ([v10 count])
      {
        uint64_t v12 = _RTSafeArray(v10);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        uint64_t v21 = _RTMultiErrorCreate(v13, v14, v15, v16, v17, v18, v19, v20, 1LL);
        unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      }

      else
      {
        unint64_t v22 = 0LL;
      }

      v9[2](v9, v11, v22);
    }

    else
    {
      uint64_t v23 = RTErrorDomain;
      NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
      id v31 = @"requires a list GEOMapItems.";
      NSErrorUserInfoKey v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
      NSErrorUserInfoKey v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v23,  7LL,  v24));
      v9[2](v9, 0LL, v25);
    }
  }
}

- (void)_relatedPlacesMapItemsIdentifiersForGEOMapItem:(id)a3 relatedPlaceListType:(int)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (v8)
  {
    if (v7)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_relatedPlaceLists", 0));
      id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v20;
        do
        {
          for (i = 0LL; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
            if ([v15 type] == a4)
            {
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 mapIdentifiers]);
              [v9 addObjectsFromArray:v16];
            }
          }

          id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }

        while (v12);
      }

      if (![v9 count])
      {
        (*((void (**)(id, void, void))v8 + 2))(v8, 0LL, 0LL);
        goto LABEL_17;
      }

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);
      (*((void (**)(id, void *, void))v8 + 2))(v8, v17, 0LL);
    }

    else
    {
      uint64_t v18 = RTErrorDomain;
      NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
      NSErrorUserInfoKey v25 = @"requires a GEOMapItem.";
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v18,  7LL,  v9));
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0LL, v17);
    }

LABEL_17:
  }
}

- (void)fetchMapItemsFromLocations:(id)a3 accessPoints:(id)a4 startDate:(id)a5 endDate:(id)a6 options:(id)a7 handler:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (v20)
  {
    if ([v15 count])
    {
      aSelector = a2;
      v50 = v20;
      v51 = v17;
      v57 = v19;
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v15 count]));
      __int128 v72 = 0u;
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      id v53 = v15;
      id v22 = v15;
      id v23 = [v22 countByEnumeratingWithState:&v72 objects:v87 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v73;
        do
        {
          id v26 = 0LL;
          do
          {
            if (*(void *)v73 != v25) {
              objc_enumerationMutation(v22);
            }
            id v27 = -[GEOLocation initWithRTLocation:includeTimeStamp:]( objc_alloc(&OBJC_CLASS___GEOLocation),  "initWithRTLocation:includeTimeStamp:",  *(void *)(*((void *)&v72 + 1) + 8LL * (void)v26),  0LL);
            if (v27) {
              [v21 addObject:v27];
            }

            id v26 = (char *)v26 + 1;
          }

          while (v24 != v26);
          id v24 = [v22 countByEnumeratingWithState:&v72 objects:v87 count:16];
        }

        while (v24);
      }

      v55 = self;

      id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v16 count]));
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      __int128 v71 = 0u;
      id v52 = v16;
      id v29 = v16;
      id v30 = [v29 countByEnumeratingWithState:&v68 objects:v86 count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v69;
        do
        {
          id v33 = 0LL;
          do
          {
            if (*(void *)v69 != v32) {
              objc_enumerationMutation(v29);
            }
            id v34 = -[GEOWifiAccessPoint initWithRTWiFiAccessPoint:includeTimeStamp:]( objc_alloc(&OBJC_CLASS___GEOWifiAccessPoint),  "initWithRTWiFiAccessPoint:includeTimeStamp:",  *(void *)(*((void *)&v68 + 1) + 8LL * (void)v33),  0LL);
            if (v34) {
              [v28 addObject:v34];
            }

            id v33 = (char *)v33 + 1;
          }

          while (v31 != v33);
          id v31 = [v29 countByEnumeratingWithState:&v68 objects:v86 count:16];
        }

        while (v31);
      }

      v56 = v18;

      SEL v35 = (void *)objc_claimAutoreleasedReturnValue( -[RTHelperService defaultTraitsForOptions:selector:]( v55,  "defaultTraitsForOptions:selector:",  v57,  "ticketForWifiFingerprintWithLocations:wifiAccessPoints:maxLabels:entryTime:exitTime:traits:"));
      NSErrorUserInfoKey v36 = (void *)objc_claimAutoreleasedReturnValue( -[GEOMapService ticketForWifiFingerprintWithLocations:wifiAccessPoints:maxLabels:entryTime:exitTime:traits:]( v55->_geoMapService,  "ticketForWifiFingerprintWithLocations:wifiAccessPoints:maxLabels:entryTime:exitTime:traits:",  v21,  v28,  50LL,  0LL,  0LL,  v35));
      id v37 = sub_10000B294(&qword_10002D0E8);
      NSErrorUserInfoKey v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v39 = NSStringFromSelector(aSelector);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue([v22 firstObject]);
        v49 = v36;
        id v42 = [v22 count];
        id v43 = [v29 count];
        unsigned int v44 = [v57 useBackgroundTraits];
        *(_DWORD *)buf = 138413314;
        v77 = v40;
        __int16 v78 = 2112;
        v79 = v41;
        __int16 v80 = 2048;
        id v81 = v42;
        NSErrorUserInfoKey v36 = v49;
        __int16 v82 = 2048;
        id v83 = v43;
        __int16 v84 = 1024;
        unsigned int v85 = v44;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "%@, fetch mapItems from bluePoi, location, %@, locations, %lu, accessPoints, %lu, background, %d",  buf,  0x30u);
      }

      v45 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472LL;
      v58[2] = sub_10001083C;
      v58[3] = &unk_1000248F0;
      v58[4] = v55;
      id v17 = v51;
      id v59 = v51;
      id v60 = v56;
      v61 = v45;
      v67 = aSelector;
      id v62 = v22;
      id v63 = v29;
      id v20 = v50;
      id v66 = v50;
      id v64 = v57;
      id v65 = v35;
      id v46 = v35;
      v47 = v45;
      [v36 submitWithHandler:v58 networkActivity:0];

      id v16 = v52;
      id v15 = v53;
      id v19 = v57;
      id v18 = v56;
    }

    else
    {
      uint64_t v48 = RTErrorDomain;
      NSErrorUserInfoKey v88 = NSLocalizedDescriptionKey;
      v89 = @"requires valid locations.";
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v89,  &v88,  1LL));
      id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v48,  7LL,  v21));
      (*((void (**)(id, void, void *))v20 + 2))(v20, 0LL, v28);
    }
  }
}

- (void)fetchMapItemsFromAddressString:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v9)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[RTHelperService defaultTraitsForOptions:selector:]( self,  "defaultTraitsForOptions:selector:",  v10,  "ticketForForwardGeocodeString:maxResults:traits:"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[GEOMapService ticketForForwardGeocodeString:maxResults:traits:]( self->_geoMapService,  "ticketForForwardGeocodeString:maxResults:traits:",  v9,  5LL,  v12));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100010ED8;
      v16[3] = &unk_100024800;
      v16[4] = self;
      SEL v21 = a2;
      id v17 = v9;
      id v20 = v11;
      id v18 = v10;
      id v19 = v12;
      id v14 = v12;
      [v13 submitWithHandler:v16 networkActivity:0];
    }

    else
    {
      uint64_t v15 = RTErrorDomain;
      NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
      id v23 = @"requires a valid addressString.";
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
      id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  7LL,  v13));
      (*((void (**)(id, void, id))v11 + 2))(v11, 0LL, v14);
    }
  }
}

- (void)fetchMapItemsFromAddressDictionary:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if ([v9 count])
    {
      id v12 = v9;
      if (+[RTMapItem addressDictionaryContainsContactsKeys:]( &OBJC_CLASS___RTMapItem,  "addressDictionaryContainsContactsKeys:",  v12))
      {
        uint64_t v13 = objc_claimAutoreleasedReturnValue( +[RTMapItem convertAddressDictionaryFromContactsToGeoServices:]( &OBJC_CLASS___RTMapItem,  "convertAddressDictionaryFromContactsToGeoServices:",  v12));

        id v12 = (id)v13;
      }

      id v14 = (void *)objc_claimAutoreleasedReturnValue( -[RTHelperService defaultTraitsForOptions:selector:]( self,  "defaultTraitsForOptions:selector:",  v10,  "ticketForForwardGeocodeAddressDictionary:maxResults:traits:"));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[GEOMapService ticketForForwardGeocodeAddressDictionary:maxResults:traits:]( self->_geoMapService,  "ticketForForwardGeocodeAddressDictionary:maxResults:traits:",  v12,  5LL,  v14));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_10001141C;
      v19[3] = &unk_100024800;
      SEL v24 = a2;
      v19[4] = self;
      id v20 = v12;
      id v23 = v11;
      id v21 = v10;
      id v22 = v14;
      id v16 = v14;
      id v17 = v12;
      [v15 submitWithHandler:v19 networkActivity:0];
    }

    else
    {
      uint64_t v18 = RTErrorDomain;
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      id v26 = @"requires a valid addressDictionary.";
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
      id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v18,  7LL,  v15));
      (*((void (**)(id, void, id))v11 + 2))(v11, 0LL, v17);
    }
  }
}

- (void)fetchPostalAddressForMapItem:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (v8)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 geoMapItemHandle]);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_1000118B0;
      v15[3] = &unk_100024918;
      v15[4] = self;
      id v16 = v10;
      -[RTHelperService fetchGeoMapItemFromHandle:options:handler:]( self,  "fetchGeoMapItemFromHandle:options:handler:",  v11,  v9,  v15);

      id v12 = v16;
    }

    else
    {
      uint64_t v13 = RTErrorDomain;
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      uint64_t v18 = @"requires a valid map item.";
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  7LL,  v14));

      (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v12);
    }
  }
}

- (void)fetchAppClipURLsForMapItem:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (v8)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 geoMapItemHandle]);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_100011AC0;
      v15[3] = &unk_100024720;
      id v16 = v10;
      -[RTHelperService fetchGeoMapItemFromHandle:options:handler:]( self,  "fetchGeoMapItemFromHandle:options:handler:",  v11,  v9,  v15);

      id v12 = v16;
    }

    else
    {
      uint64_t v13 = RTErrorDomain;
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      uint64_t v18 = @"requires a valid map item.";
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  7LL,  v14));

      (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v12);
    }
  }
}

- (void)fetchCountryAndSubdivisionCodesFromLocation:(id)a3 options:(id)a4 handler:(id)a5
{
  uint64_t v5 = RTErrorDomain;
  NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
  id v10 = @"target is not supported.";
  id v6 = (void (**)(id, void, void *))a5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v5,  7LL,  v7));

  v6[2](v6, 0LL, v8);
}

- (id)_buildingPolygonsFromGEOBuilding:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sections]);
  id v5 = [v4 count];

  if (v5)
  {
    id v21 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v3 sections]);
    id v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v6)
    {
      id v7 = v6;
      id v19 = v3;
      uint64_t v8 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          id v11 = objc_autoreleasePoolPush();
          id v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
          if ([v10 coordinateCount])
          {
            uint64_t v13 = 0LL;
            unint64_t v14 = 0LL;
            do
            {
              id v15 = objc_msgSend( [RTCoordinate alloc],  "initWithLatitude:longitude:",  *(double *)((char *)objc_msgSend(v10, "coordinates") + v13),  *(double *)((char *)objc_msgSend(v10, "coordinates") + v13 + 8));
              if (v15) {
                -[NSMutableArray addObject:](v12, "addObject:", v15);
              }

              ++v14;
              v13 += 16LL;
            }

            while (v14 < (unint64_t)[v10 coordinateCount]);
          }

          id v16 = [[RTPolygon alloc] initWithVertices:v12];
          if (v16) {
            -[NSMutableArray addObject:](v21, "addObject:", v16);
          }

          objc_autoreleasePoolPop(v11);
        }

        id v7 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      }

      while (v7);
      id v3 = v19;
    }
  }

  else
  {
    id v17 = sub_10000B294(&qword_10002D0A0);
    id obj = (id)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)obj, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)obj,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: building.sections.count> 0",  buf,  2u);
    }

    id v21 = 0LL;
  }

  return v21;
}

- (void)fetchBuildingPolygonsFromLocation:(id)a3 radius:(double)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    if (v9 && a4 > 0.0)
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_100012234;
      v31[3] = &unk_100024940;
      v31[4] = self;
      id v11 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      uint64_t v32 = v11;
      id v12 = objc_retainBlock(v31);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_100012284;
      v25[3] = &unk_100024968;
      SEL v29 = a2;
      id v13 = v9;
      double v30 = a4;
      id v26 = v13;
      id v27 = v11;
      id v28 = v10;
      unint64_t v14 = v11;
      id v15 = objc_retainBlock(v25);
      [v13 latitude];
      double v17 = v16;
      [v13 longitude];
      id v19 =  -[GEOMapFeatureAccess findBuildingsNear:radius:handler:completionHandler:]( self->_mapFeatureAccess,  "findBuildingsNear:radius:handler:completionHandler:",  v12,  v15,  v17,  v18,  a4);
    }

    else
    {
      id v20 = NSStringFromSelector(a2);
      id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      unint64_t v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"invalid parameters passed to %@, location, %@, radius, %.2f",  v21,  v9,  *(void *)&a4));

      uint64_t v22 = RTErrorDomain;
      NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
      id v34 = v14;
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v22,  7LL,  v23));
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v24);
    }
  }
}

- (void)fetchPointOfInterestAttributesWithIdentifier:(unint64_t)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[RTHelperService defaultTraitsForOptions:selector:]( self,  "defaultTraitsForOptions:selector:",  v9,  "fetchPointOfInterestAttributesWithIdentifier:options:handler:"));
    geoMapService = self->_geoMapService;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    id v21 = v13;
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMapService ticketForMUIDs:traits:](geoMapService, "ticketForMUIDs:traits:", v14, v11));

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000126E8;
    v16[3] = &unk_1000249D8;
    SEL v19 = a2;
    unint64_t v20 = a3;
    id v18 = v10;
    v16[4] = self;
    id v17 = v9;
    [v15 submitWithHandler:v16 networkActivity:0];
  }
}

- (void)fetchPointOfInterestsAroundCoordinate:(id)a3 radius:(double)a4 options:(id)a5 handler:(id)a6
{
  id v10 = a6;
  if (v10)
  {
    id v11 = a3;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[RTHelperService defaultTraitsForOptions:selector:]( self,  "defaultTraitsForOptions:selector:",  a5,  "fetchPointOfInterestsAroundCoordinate:radius:options:handler:"));
    [v11 latitude];
    double v14 = v13;
    [v11 longitude];
    double v16 = v15;

    id v17 = objc_msgSend( [GEOSpatialLookupParameters alloc],  "initWithCoordinate:radius:categories:",  &__NSArray0__struct,  v14,  v16,  a4);
    geoMapService = self->_geoMapService;
    id v30 = v17;
    SEL v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[GEOMapService ticketForSpatialLookupParameters:traits:]( geoMapService,  "ticketForSpatialLookupParameters:traits:",  v19,  v12));

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100013028;
    v24[3] = &unk_100024A28;
    id v28 = v12;
    id v29 = v10;
    id v25 = v20;
    id v26 = v17;
    id v27 = self;
    id v21 = v12;
    id v22 = v17;
    id v23 = v20;
    [v23 submitWithHandler:v24 networkActivity:0];
  }
}

- (void)createMapItemWithIdentifier:(id)a3 geoMapItemStorage:(id)a4 source:(unint64_t)a5 creationDate:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  double v15 = (void (**)(id, id, void))a7;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }

  else
  {
    id v27 = sub_10000B294(&qword_10002D0A0);
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v48 = "-[RTHelperService createMapItemWithIdentifier:geoMapItemStorage:source:creationDate:handler:]";
      __int16 v49 = 1024;
      int v50 = 1336;
      _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: identifier (in %s:%d)",  buf,  0x12u);
    }

    if (v13)
    {
LABEL_3:
      if (v14) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }

  id v29 = sub_10000B294(&qword_10002D0A0);
  id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v48 = "-[RTHelperService createMapItemWithIdentifier:geoMapItemStorage:source:creationDate:handler:]";
    __int16 v49 = 1024;
    int v50 = 1337;
    _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: geoMapItemStorage (in %s:%d)",  buf,  0x12u);
  }

  if (v14)
  {
LABEL_4:
    if (v15) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }

- (double)confidenceWeightForGeoMapItem:(id)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  double v15 = 1.0;
  if (v14 && ([v12 isAfterDate:v13] & 1) == 0)
  {
    double v16 = (void *)objc_claimAutoreleasedReturnValue([v11 _businessHours]);
    -[RTHelperService weightBasedOnBusinessHours:startDate:endDate:timeZone:]( self,  "weightBasedOnBusinessHours:startDate:endDate:timeZone:",  v16,  v12,  v13,  v14);
    double v18 = v17;

    SEL v19 = (void *)objc_claimAutoreleasedReturnValue([v11 _poiCategory]);
    -[RTHelperService weightBasedOnDurationWithStartDate:endDate:timeZone:poiCategory:]( self,  "weightBasedOnDurationWithStartDate:endDate:timeZone:poiCategory:",  v12,  v13,  v14,  v19);
    double v21 = v20;

    double v15 = v18 * v21;
    id v22 = sub_10000B294(&qword_10002D0E8);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      __int128 v24 = NSStringFromSelector(a2);
      id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      int v27 = 138414082;
      id v28 = v25;
      __int16 v29 = 2048;
      double v30 = v18 * v21;
      __int16 v31 = 2048;
      double v32 = v18;
      __int16 v33 = 2048;
      double v34 = v21;
      __int16 v35 = 2048;
      id v36 = [v11 _muid];
      __int16 v37 = 2112;
      id v38 = v12;
      __int16 v39 = 2112;
      id v40 = v13;
      __int16 v41 = 2112;
      id v42 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%@, weight, %.1f, weightBasedOnBusinessHours, %.1f, weightBasedOnDuration, %.1f, muid, %lu, start, %@, end, %@, timeZone, %@",  (uint8_t *)&v27,  0x52u);
    }
  }

  return v15;
}

- (double)weightBasedOnBusinessHours:(id)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6
{
  id v11 = a3;
  id v36 = a4;
  id v35 = a5;
  id v12 = a6;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v13 = v11;
  id v14 = [v13 countByEnumeratingWithState:&v37 objects:v53 count:16];
  if (v14)
  {
    id v15 = v14;
    aSelector = a2;
    char v16 = 0;
    uint64_t v17 = *(void *)v38;
LABEL_3:
    uint64_t v18 = 0LL;
    while (1)
    {
      if (*(void *)v38 != v17) {
        objc_enumerationMutation(v13);
      }
      SEL v19 = *(void **)(*((void *)&v37 + 1) + 8 * v18);
      if ([v19 hoursType] == (id)4 || objc_msgSend(v19, "hoursType") == (id)3) {
        break;
      }
      double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 placeDailyNormalizedHours]);
      id v21 = [v20 count];

      if (v21)
      {
        if (-[RTHelperService insideBusinessHours:date:timeZone:]( self,  "insideBusinessHours:date:timeZone:",  v19,  v36,  v12)
          && -[RTHelperService insideBusinessHours:date:timeZone:]( self,  "insideBusinessHours:date:timeZone:",  v19,  v35,  v12))
        {

          double v22 = 1.0;
          goto LABEL_26;
        }

        char v16 = 1;
      }

      if (v15 == (id)++v18)
      {
        id v15 = [v13 countByEnumeratingWithState:&v37 objects:v53 count:16];
        if (v15) {
          goto LABEL_3;
        }

        double v22 = 0.0;
        if ((v16 & 1) != 0)
        {
LABEL_26:
          int v23 = 1;
        }

        else
        {
          int v23 = 0;
          double v22 = 1.0;
        }

        a2 = aSelector;
        goto LABEL_20;
      }
    }

    id v24 = sub_10000B294(&qword_10002D0E8);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      id v26 = NSStringFromSelector(aSelector);
      int v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      *(_DWORD *)buf = 138412290;
      id v42 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "%@, business is permanently/temporarily closed",  buf,  0xCu);
    }

    double v22 = 0.0;
    id v28 = (os_log_s *)v13;
  }

  else
  {

    int v23 = 0;
    double v22 = 1.0;
LABEL_20:
    id v29 = sub_10000B294(&qword_10002D0E8);
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      double v30 = NSStringFromSelector(a2);
      __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      double v32 = @"NO";
      *(_DWORD *)buf = 138413570;
      __int16 v43 = 2048;
      id v42 = v31;
      if (v23) {
        double v32 = @"YES";
      }
      double v44 = v22;
      __int16 v45 = 2112;
      id v46 = v32;
      __int16 v47 = 2112;
      id v48 = v36;
      __int16 v49 = 2112;
      id v50 = v35;
      __int16 v51 = 2112;
      id v52 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "%@, weight, %.1f, businessHoursAvailable, %@, start, %@, end, %@, timeZone, %@",  buf,  0x3Eu);
    }
  }

  return v22;
}

- (double)weightBasedOnDurationWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 poiCategory:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  [v12 timeIntervalSinceDate:v11];
  if (v15 >= 60.0)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    [v17 setTimeZone:v13];
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v17 components:736 fromDate:v11]);
    double v22 = (void *)objc_claimAutoreleasedReturnValue([v17 components:736 fromDate:v12]);
    id v48 = v21;
    id v23 = [v21 hour];
    id v24 = [v22 hour];
    [v12 timeIntervalSinceDate:v11];
    double v27 = v26;
    double v18 = 1.0;
    double v28 = 28800.0;
    if (v27 >= 28800.0)
    {
      unsigned __int8 v29 = [v14 isEqualToString:GEOPOICategoryHotel];
      double v28 = 1.0;
      BOOL v30 = (unint64_t)v24 <= 0x14 && (unint64_t)v23 >= 7;
      double v25 = 0.0;
      if (v30) {
        double v25 = 1.0;
      }
      if ((v29 & 1) != 0) {
        double v18 = 1.0;
      }
      else {
        double v18 = v25;
      }
    }

    __int16 v31 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_bluePOICategoryToDurationThresholdMapping,  "objectForKey:",  v14,  v28,  v25));

    if (v31)
    {
      double v32 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_bluePOICategoryToDurationThresholdMapping,  "objectForKey:",  v14));
      __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 firstObject]);

      double v34 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_bluePOICategoryToDurationThresholdMapping,  "objectForKey:",  v14));
      id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 lastObject]);

      if ([v33 count])
      {
        __int16 v47 = a2;
        uint64_t v36 = 0LL;
        while (1)
        {
          __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectAtIndexedSubscript:", v36, v47));
          [v37 doubleValue];
          double v39 = v38;

          if (v39 > v27) {
            break;
          }
        }

        __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v35 objectAtIndexedSubscript:v36]);
        [v40 doubleValue];
        double v18 = v18 * v41;

LABEL_21:
        a2 = v47;
      }
    }

    id v42 = sub_10000B294(&qword_10002D0E8);
    __int16 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      double v44 = NSStringFromSelector(a2);
      __int16 v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
      *(_DWORD *)buf = 138413570;
      id v50 = v45;
      __int16 v51 = 2048;
      double v52 = v18;
      __int16 v53 = 2112;
      id v54 = v11;
      __int16 v55 = 2112;
      id v56 = v12;
      __int16 v57 = 2048;
      double v58 = v27;
      __int16 v59 = 2112;
      id v60 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_INFO,  "%@, weight, %.1f, startDate, %@, endDate, %@, duration, %.1f, poi category, %@",  buf,  0x3Eu);
    }
  }

  else
  {
    id v16 = sub_10000B294(&qword_10002D0E8);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    double v18 = 1.0;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_INFO))
    {
      SEL v19 = NSStringFromSelector(a2);
      double v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138412802;
      id v50 = v20;
      __int16 v51 = 2112;
      double v52 = *(double *)&v11;
      __int16 v53 = 2112;
      id v54 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_INFO,  "%@, skip duration filter, startDate, %@, endDate, %@",  buf,  0x20u);
    }
  }

  return v18;
}

- (BOOL)insideBusinessHours:(id)a3 date:(id)a4 timeZone:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  v67 = v9;
  [v10 setTimeZone:v9];
  id v66 = v10;
  __int128 v68 = v8;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 components:736 fromDate:v8]);
  id v12 = (const __CFString *)[v11 weekday];
  id v13 = [v11 hour];
  id v14 = [v11 minute];
  id v65 = v11;
  id v15 = [v11 second];
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  id v64 = v7;
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 placeDailyNormalizedHours]);
  id v17 = -[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v74,  v89,  16LL);
  if (v17)
  {
    id v18 = v17;
    LOBYTE(v19) = 0;
    double v20 = (double)(uint64_t)v14 * 60.0 + (double)(uint64_t)v13 * 3600.0 + (double)(uint64_t)v15;
    uint64_t v21 = *(void *)v75;
    id v63 = v16;
    uint64_t v57 = *(void *)v75;
    double v58 = v12;
    do
    {
      double v22 = 0LL;
      id v59 = v18;
      do
      {
        if (*(void *)v75 != v21) {
          objc_enumerationMutation(v16);
        }
        id v23 = *(void **)(*((void *)&v74 + 1) + 8LL * (void)v22);
        id v24 = sub_10000B294(&qword_10002D0E8);
        double v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          double v26 = NSStringFromSelector(a2);
          double v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
          double v28 = (const __CFString *)[v23 weekday];
          *(_DWORD *)buf = 138412802;
          v79 = v27;
          __int16 v80 = 2048;
          id v81 = v28;
          __int16 v82 = 2048;
          id v83 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "%@, normalizedHours weekday, %lu, compareDate weekday, %lu",  buf,  0x20u);
        }

        if ([v23 weekday] == v12)
        {
          id v60 = v23;
          v61 = v22;
          BOOL v62 = v19;
          __int128 v72 = 0u;
          __int128 v73 = 0u;
          __int128 v70 = 0u;
          __int128 v71 = 0u;
          unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue([v23 localTimeIntervals]);
          id v30 = [v29 countByEnumeratingWithState:&v70 objects:v88 count:16];
          if (v30)
          {
            id v31 = v30;
            uint64_t v32 = *(void *)v71;
            while (2)
            {
              for (i = 0LL; i != v31; i = (char *)i + 1)
              {
                if (*(void *)v71 != v32) {
                  objc_enumerationMutation(v29);
                }
                double v34 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)i);
                objc_msgSend(v34, "startTime", v57, v58);
                if (v35 + -1800.0 >= v20)
                {
                  BOOL v37 = 0;
                }

                else
                {
                  [v34 endTime];
                  BOOL v37 = v36 + 1800.0 > v20;
                }

                id v38 = sub_10000B294(&qword_10002D0E8);
                double v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
                if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                {
                  __int128 v40 = NSStringFromSelector(a2);
                  double v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
                  if (v37) {
                    id v42 = @"YES";
                  }
                  else {
                    id v42 = @"NO";
                  }
                  [v34 startTime];
                  double v44 = v43;
                  [v34 endTime];
                  *(_DWORD *)buf = 138413314;
                  v79 = v41;
                  __int16 v80 = 2112;
                  id v81 = v42;
                  __int16 v82 = 2048;
                  id v83 = v44;
                  __int16 v84 = 2048;
                  uint64_t v85 = v45;
                  __int16 v86 = 2048;
                  double v87 = v20;
                  _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_INFO,  "%@, result, %@, business hours start, %.1f, end, %.1f, compareTime, %.1f",  buf,  0x34u);
                }

                if (v37)
                {

                  char v48 = 1;
                  id v50 = v63;
                  __int16 v49 = v64;
                  goto LABEL_42;
                }
              }

              id v31 = [v29 countByEnumeratingWithState:&v70 objects:v88 count:16];
              if (v31) {
                continue;
              }
              break;
            }
          }

          id v16 = v63;
          id v12 = v58;
          id v18 = v59;
          LOBYTE(v19) = v62;
          uint64_t v21 = v57;
          id v23 = v60;
          double v22 = v61;
        }

        if (v19)
        {
          BOOL v19 = 1;
        }

        else
        {
          id v46 = v22;
          __int16 v47 = (void *)objc_claimAutoreleasedReturnValue([v23 localTimeIntervals]);
          BOOL v19 = [v47 count] != 0;

          double v22 = v46;
        }

        double v22 = (char *)v22 + 1;
      }

      while (v22 != v18);
      id v18 = -[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v74,  v89,  16LL);
    }

    while (v18);
  }

  else
  {
    BOOL v19 = 0;
  }

  char v48 = !v19;
  id v51 = sub_10000B294(&qword_10002D0E8);
  id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    double v52 = NSStringFromSelector(a2);
    __int16 v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
    id v54 = @"YES";
    *(_DWORD *)buf = 138412802;
    v79 = v53;
    if (v19) {
      __int16 v55 = @"NO";
    }
    else {
      __int16 v55 = @"YES";
    }
    id v81 = v55;
    __int16 v80 = 2112;
    if (!v19) {
      id v54 = @"NO";
    }
    __int16 v82 = 2112;
    id v83 = v54;
    _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_INFO,  "%@, result, %@, hasHoursOnAnyDayThisWeek, %@",  buf,  0x20u);
  }

  __int16 v49 = v64;
LABEL_42:

  return v48;
}

+ (id)exposedErrorFrom:(id)a3
{
  id v3 = a3;
  if ([v3 code] == (id)-8)
  {
    id v4 = 0LL;
  }

  else if ([v3 code] == (id)-6)
  {
    id v4 = 0LL;
  }

  else
  {
    id v4 = v3;
  }

  id v5 = v4;

  return v5;
}

+ (id)computeMetricsForAnalyticsIdentifier:(id)a3 appIdentifier:(id)a4 requestType:(unint64_t)a5 mapItems:(id)a6 serviceError:(id)a7 isBackgroundRequest:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v17 setObject:v16 forKeyedSubscript:@"analyticsIdentifier"];

  [v17 setObject:v15 forKeyedSubscript:@"appIdentifier"];
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  [v17 setObject:v18 forKeyedSubscript:@"requestType"];

  id v19 = [v14 count];
  double v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v19));
  [v17 setObject:v20 forKeyedSubscript:@"yieldCount"];

  if (v13)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v13 domain]);
    [v17 setObject:v21 forKeyedSubscript:@"errorDomain"];

    double v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v13 code]));
    [v17 setObject:v22 forKeyedSubscript:@"errorCode"];

    id v23 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
    uint64_t v24 = GEOErrorHttpStatusCodeKey;
    double v25 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:GEOErrorHttpStatusCodeKey]);

    if (v25)
    {
      double v26 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
      double v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v24]);
      [v17 setObject:v27 forKeyedSubscript:@"errorHTTPStatus"];
    }
  }

  if (v8) {
    uint64_t v28 = 2LL;
  }
  else {
    uint64_t v28 = 1LL;
  }
  unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v28));
  [v17 setObject:v29 forKeyedSubscript:@"runningState"];

  return v17;
}

+ (void)submitMetricsForAnalyticsIdentifier:(id)a3 appIdentifier:(id)a4 requestType:(unint64_t)a5 mapItems:(id)a6 serviceError:(id)a7 isBackgroundRequest:(BOOL)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100014B54;
  v29[3] = &unk_100024A50;
  id v30 = v13;
  id v31 = v14;
  id v33 = a7;
  unint64_t v34 = a5;
  id v32 = v15;
  BOOL v35 = a8;
  id v16 = v33;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  double v20 = objc_retainBlock(v29);
  uint64_t v21 = objc_alloc(&OBJC_CLASS___NSString);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100014B74;
  v26[3] = &unk_100024A78;
  double v27 = -[NSString initWithCString:encoding:](v21, "initWithCString:encoding:", off_10002D118, 1LL);
  id v28 = v20;
  double v22 = v27;
  id v23 = v20;
  uint64_t v24 = objc_retainBlock(v26);
  double v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.%@", v22));
  AnalyticsSendEventLazy(v25, v24);
}

- (void).cxx_destruct
{
}

@end