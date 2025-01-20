@interface SAClientUserActivity
- (BOOL)hasLocationData;
- (CLLocationCoordinate2D)coordinate;
- (id)addressDictionary;
- (id)mapItem;
- (id)startNavigationCommand;
@end

@implementation SAClientUserActivity

- (id)startNavigationCommand
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAClientUserActivity addressDictionary](self, "addressDictionary"));
  -[SAClientUserActivity coordinate](self, "coordinate");
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[SALocation locationWithContactDictionary:coordinate:]( &OBJC_CLASS___SALocation,  "locationWithContactDictionary:coordinate:",  v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAClientUserActivity userInfo](self, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"name"]);
  [v4 setLabel:v6];

  v7 = objc_alloc_init(&OBJC_CLASS___ASStartNavigation);
  -[ASStartNavigation setDestination:](v7, "setDestination:", v4);
  -[ASStartNavigation setDirectionsType:](v7, "setDirectionsType:", SALocalSearchDirectionsTypeByCarValue);

  return v7;
}

- (id)addressDictionary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SAClientUserActivity userInfo](self, "userInfo"));
  v9[0] = CNPostalAddressStreetKey;
  v9[1] = CNPostalAddressPostalCodeKey;
  v9[2] = CNPostalAddressStateKey;
  v9[3] = CNPostalAddressCityKey;
  v9[4] = CNPostalAddressCountryKey;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 5LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 dictionaryWithValuesForKeys:v3]);
  id v5 = [v4 mutableCopy];

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keysOfEntriesPassingTest:&stru_C5F0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
  [v5 removeObjectsForKeys:v7];

  return v5;
}

- (CLLocationCoordinate2D)coordinate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAClientUserActivity userInfo](self, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"latitude"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAClientUserActivity userInfo](self, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"longitude"]);

  if (v4) {
    BOOL v7 = v6 == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7
    || ([v4 floatValue],
        CLLocationDegrees v9 = v8,
        [v6 floatValue],
        CLLocationCoordinate2D v15 = CLLocationCoordinate2DMake(v9, v10),
        CLLocationDegrees latitude = v15.latitude,
        CLLocationDegrees longitude = v15.longitude,
        !CLLocationCoordinate2DIsValid(v15)))
  {
    CLLocationDegrees latitude = kCLLocationCoordinate2DInvalid.latitude;
    CLLocationDegrees longitude = kCLLocationCoordinate2DInvalid.longitude;
  }

  double v13 = latitude;
  double v14 = longitude;
  result.CLLocationDegrees longitude = v14;
  result.CLLocationDegrees latitude = v13;
  return result;
}

- (id)mapItem
{
  if (-[SAClientUserActivity hasLocationData](self, "hasLocationData"))
  {
    v3 = objc_alloc(&OBJC_CLASS___MKPlacemark);
    -[SAClientUserActivity coordinate](self, "coordinate");
    double v5 = v4;
    double v7 = v6;
    float v8 = (void *)objc_claimAutoreleasedReturnValue(-[SAClientUserActivity addressDictionary](self, "addressDictionary"));
    CLLocationDegrees v9 = -[MKPlacemark initWithCoordinate:addressDictionary:](v3, "initWithCoordinate:addressDictionary:", v8, v5, v7);

    float v10 = -[MKMapItem initWithPlacemark:](objc_alloc(&OBJC_CLASS___MKMapItem), "initWithPlacemark:", v9);
  }

  else
  {
    float v10 = 0LL;
  }

  return v10;
}

- (BOOL)hasLocationData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SAClientUserActivity userInfo](self, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);

  if ([v3 containsObject:@"latitude"]
    && ([v3 containsObject:@"longitude"] & 1) != 0
    || [v3 containsObject:CNPostalAddressStreetKey]
    && ([v3 containsObject:CNPostalAddressCityKey] & 1) != 0
    || [v3 containsObject:CNPostalAddressStateKey]
    && ([v3 containsObject:CNPostalAddressCityKey] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }

  else
  {
    unsigned __int8 v4 = [v3 containsObject:CNPostalAddressPostalCodeKey];
  }

  return v4;
}

@end