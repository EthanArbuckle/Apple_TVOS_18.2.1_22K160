@interface SALocation
- (id)_convertedLocation;
@end

@implementation SALocation

- (id)_convertedLocation
{
  id v3 = objc_alloc_init((Class)&OBJC_CLASS___SFLatLng);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SALocation latitude](self, "latitude"));
  [v4 doubleValue];
  objc_msgSend(v3, "setLat:");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SALocation longitude](self, "longitude"));
  [v5 doubleValue];
  objc_msgSend(v3, "setLng:");

  return v3;
}

@end