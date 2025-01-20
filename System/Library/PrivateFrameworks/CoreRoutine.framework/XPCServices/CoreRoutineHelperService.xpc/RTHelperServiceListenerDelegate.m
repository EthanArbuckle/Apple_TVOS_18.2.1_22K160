@interface RTHelperServiceListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (RTHelperServiceListenerDelegate)init;
- (RTHelperServiceListenerProtocol)delegate;
- (void)_configureXpcInterface:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation RTHelperServiceListenerDelegate

- (RTHelperServiceListenerDelegate)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RTHelperServiceListenerDelegate;
  v2 = -[RTHelperServiceListenerDelegate init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RTHelperServiceProtocol));
    xpcInterface = v2->_xpcInterface;
    v2->_xpcInterface = (NSXPCInterface *)v3;

    -[RTHelperServiceListenerDelegate _configureXpcInterface:](v2, "_configureXpcInterface:", v2->_xpcInterface);
    v5 = objc_opt_new(&OBJC_CLASS___RTHelperService);
    helperService = v2->_helperService;
    v2->_helperService = v5;
  }

  return v2;
}

- (void)_configureXpcInterface:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  v5 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v4,  objc_opt_class(&OBJC_CLASS___RTLocation),  0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v3 setClasses:v6 forSelector:"fetchMapItemsFromLocations:accessPoints:startDate:endDate:options:handler:" argumentIndex:0 ofReply:0];

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray);
  objc_super v8 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  objc_opt_class(&OBJC_CLASS___RTWiFiAccessPoint),  0LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v3 setClasses:v9 forSelector:"fetchMapItemsFromLocations:accessPoints:startDate:endDate:options:handler:" argumentIndex:1 ofReply:0];

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
  v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v10,  objc_opt_class(&OBJC_CLASS___GEOMapItemIdentifier),  0LL);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v3 setClasses:v12 forSelector:"fetchMapItemsFromIdentifiers:options:source:handler:" argumentIndex:0 ofReply:0];

  v13 = +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", objc_opt_class(&OBJC_CLASS___RTMapItem));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v3 setClasses:v14 forSelector:"fetchPostalAddressForMapItem:options:handler:" argumentIndex:0 ofReply:0];

  v15 = +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", objc_opt_class(&OBJC_CLASS___RTMapItem));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  [v3 setClasses:v16 forSelector:"fetchAppClipURLsForMapItem:options:handler:" argumentIndex:0 ofReply:0];

  v17 = +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___RTMapServiceOptions));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v3 setClasses:v18 forSelector:"fetchPostalAddressForMapItem:options:handler:" argumentIndex:1 ofReply:0];

  v19 = +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___RTMapServiceOptions));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  [v3 setClasses:v20 forSelector:"fetchAppClipURLsForMapItem:options:handler:" argumentIndex:1 ofReply:0];

  v21 = +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", objc_opt_class(&OBJC_CLASS___RTLocation));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  [v3 setClasses:v22 forSelector:"fetchBuildingPolygonsFromLocation:radius:handler:" argumentIndex:0 ofReply:0];

  uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSArray);
  v24 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v23,  objc_opt_class(&OBJC_CLASS___RTPolygon),  0LL);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  [v3 setClasses:v25 forSelector:"fetchBuildingPolygonsFromLocation:radius:handler:" argumentIndex:0 ofReply:1];

  v26 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___RTPointOfInterestAttributes),  0LL);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  [v3 setClasses:v27 forSelector:"fetchPointOfInterestAttributesWithIdentifier:options:handler:" argumentIndex:0 ofReply:1];

  uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSArray);
  v29 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v28,  objc_opt_class(&OBJC_CLASS___RTMapItem),  0LL);
  id v30 = (id)objc_claimAutoreleasedReturnValue(v29);
  [v3 setClasses:v30 forSelector:"fetchPointOfInterestsAroundCoordinate:radius:options:handler:" argumentIndex:0 ofReply:1];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  [v5 setExportedInterface:self->_xpcInterface];
  [v5 setExportedObject:self->_helperService];
  [v5 resume];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "serviceListener:didAcceptConnection:") & 1) != 0) {
    [WeakRetained serviceListener:self didAcceptConnection:v5];
  }

  return 1;
}

- (RTHelperServiceListenerProtocol)delegate
{
  return (RTHelperServiceListenerProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end