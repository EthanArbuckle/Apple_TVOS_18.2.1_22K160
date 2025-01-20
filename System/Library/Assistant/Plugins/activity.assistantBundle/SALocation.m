@interface SALocation
+ (SALocation)locationWithContactDictionary:(id)a3 coordinate:(CLLocationCoordinate2D)a4;
- (BOOL)hasLocationData;
- (CLLocationCoordinate2D)coordinate;
- (id)addressDictionary;
- (id)mapItem;
@end

@implementation SALocation

+ (SALocation)locationWithContactDictionary:(id)a3 coordinate:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___SALocation);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  v24.double latitude = latitude;
  v24.double longitude = longitude;
  if (CLLocationCoordinate2DIsValid(v24))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", longitude));
    -[SALocation setLongitude:](v7, "setLongitude:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", latitude));
    -[SALocation setLatitude:](v7, "setLatitude:", v10);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
  -[SALocation setAceId:](v7, "setAceId:", v12);

  if ([v8 containsObject:@"latitude"])
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:@"latitude"]);
    -[SALocation setLatitude:](v7, "setLatitude:", v13);
  }

  if ([v8 containsObject:@"longitude"])
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:@"longitude"]);
    -[SALocation setLongitude:](v7, "setLongitude:", v14);
  }

  if ([v8 containsObject:@"name"])
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:@"name"]);
    -[SALocation setLabel:](v7, "setLabel:", v15);
  }

  if ([v8 containsObject:CNPostalAddressStreetKey])
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:CNPostalAddressStreetKey]);
    -[SALocation setStreet:](v7, "setStreet:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:CNPostalAddressStreetKey]);
    -[SALocation setThoroughfare:](v7, "setThoroughfare:", v17);
  }

  if ([v8 containsObject:CNPostalAddressCityKey])
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:CNPostalAddressCityKey]);
    -[SALocation setCity:](v7, "setCity:", v18);
  }

  if ([v8 containsObject:CNPostalAddressStateKey])
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:CNPostalAddressStateKey]);
    -[SALocation setStateCode:](v7, "setStateCode:", v19);
  }

  if ([v8 containsObject:CNPostalAddressCountryKey])
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:CNPostalAddressCountryKey]);
    -[SALocation setCountryCode:](v7, "setCountryCode:", v20);
  }

  if ([v8 containsObject:CNPostalAddressPostalCodeKey])
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:CNPostalAddressPostalCodeKey]);
    -[SALocation setPostalCode:](v7, "setPostalCode:", v21);
  }

  if ([v8 containsObject:CNPostalAddressPostalCodeKey])
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:CNPostalAddressPostalCodeKey]);
    -[SALocation setPostalCode:](v7, "setPostalCode:", v22);
  }

  return v7;
}

- (id)addressDictionary
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SALocation street](self, "street"));
  if (v4)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v4,  CNPostalAddressStreetKey);
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SALocation thoroughfare](self, "thoroughfare"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v5,  CNPostalAddressStreetKey);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SALocation city](self, "city"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, CNPostalAddressCityKey);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SALocation stateCode](self, "stateCode"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, CNPostalAddressStateKey);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SALocation postalCode](self, "postalCode"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v8,  CNPostalAddressPostalCodeKey);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SALocation countryCode](self, "countryCode"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, CNPostalAddressCountryKey);

  return v3;
}

- (CLLocationCoordinate2D)coordinate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SALocation latitude](self, "latitude"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SALocation longitude](self, "longitude"));
  v5 = (void *)v4;
  if (!v3
    || !v4
    || ([v3 floatValue],
        CLLocationDegrees v7 = v6,
        [v5 floatValue],
        CLLocationCoordinate2D v13 = CLLocationCoordinate2DMake(v7, v8),
        CLLocationDegrees latitude = v13.latitude,
        CLLocationDegrees longitude = v13.longitude,
        !CLLocationCoordinate2DIsValid(v13)))
  {
    CLLocationDegrees latitude = kCLLocationCoordinate2DInvalid.latitude;
    CLLocationDegrees longitude = kCLLocationCoordinate2DInvalid.longitude;
  }

  double v11 = latitude;
  double v12 = longitude;
  result.CLLocationDegrees longitude = v12;
  result.CLLocationDegrees latitude = v11;
  return result;
}

- (BOOL)hasLocationData
{
  if (!CLLocationCoordinate2DIsValid(v8))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SALocation street](self, "street"));
    if (v4 && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[SALocation city](self, "city"))) != 0LL)
    {
      char v3 = 1;
    }

    else
    {
      float v6 = (void *)objc_claimAutoreleasedReturnValue(-[SALocation postalCode](self, "postalCode"));
      char v3 = v6 != 0LL;

      if (!v4)
      {
LABEL_9:

        return v3;
      }

      v5 = 0LL;
    }

    goto LABEL_9;
  }

  return 1;
}

- (id)mapItem
{
  if (-[SALocation hasLocationData](self, "hasLocationData"))
  {
    char v3 = objc_alloc(&OBJC_CLASS___MKPlacemark);
    -[SALocation coordinate](self, "coordinate");
    double v5 = v4;
    double v7 = v6;
    CLLocationCoordinate2D v8 = (void *)objc_claimAutoreleasedReturnValue(-[SALocation addressDictionary](self, "addressDictionary"));
    v9 = -[MKPlacemark initWithCoordinate:addressDictionary:](v3, "initWithCoordinate:addressDictionary:", v8, v5, v7);

    v10 = -[MKMapItem initWithPlacemark:](objc_alloc(&OBJC_CLASS___MKMapItem), "initWithPlacemark:", v9);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SALocation label](self, "label"));
    -[MKMapItem setName:](v10, "setName:", v11);
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

@end