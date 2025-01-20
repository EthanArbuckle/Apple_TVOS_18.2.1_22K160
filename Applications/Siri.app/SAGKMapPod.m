@interface SAGKMapPod
- (id)_convertedCardSections;
@end

@implementation SAGKMapPod

- (id)_convertedCardSections
{
  id v3 = objc_alloc_init((Class)&OBJC_CLASS___SFMapCardSection);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKMapPod location](self, "location"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _convertedLocation]);
  [v3 setLocation:v5];

  id v6 = objc_alloc_init((Class)&OBJC_CLASS___SFColor);
  [v6 setRedComponent:1.0];
  [v6 setAlphaComponent:1.0];
  [v3 setPinColor:v6];
  [v3 setInteractive:0];
  [v3 setSizeFormat:0];
  [v3 setPinBehavior:1];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKMapPod location](self, "location"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 latitude]);
  [v8 doubleValue];
  CLLocationDegrees v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKMapPod location](self, "location"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 longitude]);
  [v12 doubleValue];
  CLLocationCoordinate2D v14 = CLLocationCoordinate2DMake(v10, v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKMapPod zoomLevel](self, "zoomLevel"));
  id v16 = [v15 doubleValue];
  double v18 = SiriUIMapRectMakeWithZoomLevel(v16, v14.latitude, v14.longitude, v17);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  uint64_t v25 = SiriUIMapRegionFromMapRect(v18, v20, v22, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  [v3 setBoundingMapRegion:v26];

  id v29 = v3;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));

  return v27;
}

@end