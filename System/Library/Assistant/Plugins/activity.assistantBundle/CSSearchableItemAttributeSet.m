@interface CSSearchableItemAttributeSet
- (BOOL)hasLocationData;
- (CLLocationCoordinate2D)coordinate;
- (id)addressDictionary;
- (id)mapItem;
- (void)openDirections;
@end

@implementation CSSearchableItemAttributeSet

- (BOOL)hasLocationData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet thoroughfare](self, "thoroughfare"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet city](self, "city"));
    if (v4)
    {
      char v5 = 1;
LABEL_12:

      goto LABEL_13;
    }
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet latitude](self, "latitude"));
  if (v6
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet longitude](self, "longitude"))) != 0LL)
  {
    char v5 = 1;
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet postalCode](self, "postalCode"));
    char v5 = v8 != 0LL;

    if (!v6) {
      goto LABEL_10;
    }
    v7 = 0LL;
  }

LABEL_10:
  if (v3)
  {
    v4 = 0LL;
    goto LABEL_12;
  }

- (void)openDirections
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet mapItem](self, "mapItem"));
  v3 = (void *)v2;
  if (v2)
  {
    uint64_t v8 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
    v6 = MKLaunchOptionsDirectionsModeKey;
    v7 = MKLaunchOptionsDirectionsModeDriving;
    char v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
    +[MKMapItem openMapsWithItems:launchOptions:](&OBJC_CLASS___MKMapItem, "openMapsWithItems:launchOptions:", v4, v5);
  }
}

- (CLLocationCoordinate2D)coordinate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet latitude](self, "latitude"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet longitude](self, "longitude"));
  char v5 = (void *)v4;
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

- (id)addressDictionary
{
  if (!-[CSSearchableItemAttributeSet hasLocationData](self, "hasLocationData"))
  {
    v3 = 0LL;
    return v3;
  }

  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet subThoroughfare](self, "subThoroughfare"));
  if (v4)
  {
    char v5 = (void *)v4;
    float v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet thoroughfare](self, "thoroughfare"));

    if (v6)
    {
      CLLocationDegrees v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet subThoroughfare](self, "subThoroughfare"));
      float v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet thoroughfare](self, "thoroughfare"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v7, v8));

LABEL_8:
      -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v9, CNPostalAddressStreetKey);

      goto LABEL_9;
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet thoroughfare](self, "thoroughfare"));

  if (v10)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet thoroughfare](self, "thoroughfare"));
    goto LABEL_8;
  }

- (id)mapItem
{
  if (-[CSSearchableItemAttributeSet hasLocationData](self, "hasLocationData"))
  {
    v3 = objc_alloc(&OBJC_CLASS___MKPlacemark);
    -[CSSearchableItemAttributeSet coordinate](self, "coordinate");
    double v5 = v4;
    double v7 = v6;
    float v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet addressDictionary](self, "addressDictionary"));
    v9 = -[MKPlacemark initWithCoordinate:addressDictionary:](v3, "initWithCoordinate:addressDictionary:", v8, v5, v7);

    v10 = -[MKMapItem initWithPlacemark:](objc_alloc(&OBJC_CLASS___MKMapItem), "initWithPlacemark:", v9);
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

@end