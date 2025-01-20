@interface SASetRequestOrigin
- (id)ad_deferredMetricsContext;
- (void)setPropertiesWithCLLocation:(id)a3;
@end

@implementation SASetRequestOrigin

- (void)setPropertiesWithCLLocation:(id)a3
{
  id v4 = a3;
  [v4 horizontalAccuracy];
  -[SASetRequestOrigin setHorizontalAccuracy:](self, "setHorizontalAccuracy:");
  [v4 verticalAccuracy];
  -[SASetRequestOrigin setVerticalAccuracy:](self, "setVerticalAccuracy:");
  [v4 coordinate];
  -[SASetRequestOrigin setLatitude:](self, "setLatitude:");
  [v4 coordinate];
  -[SASetRequestOrigin setLongitude:](self, "setLongitude:", v5);
  [v4 altitude];
  -[SASetRequestOrigin setAltitude:](self, "setAltitude:");
  [v4 course];
  -[SASetRequestOrigin setDirection:](self, "setDirection:");
  [v4 speed];
  -[SASetRequestOrigin setSpeed:](self, "setSpeed:");
  id v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_af_age"));

  -[SASetRequestOrigin setAge:](self, "setAge:", v6);
}

- (id)ad_deferredMetricsContext
{
  v8.receiver = self;
  v8.super_class = &OBJC_CLASS___SASetRequestOrigin;
  id v3 = -[SASetRequestOrigin ad_deferredMetricsContext](&v8, "ad_deferredMetricsContext");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[SASetRequestOrigin latitude](self, "latitude");
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v4 setObject:v5 forKey:SASetRequestOriginLatitudePListKey];

  -[SASetRequestOrigin longitude](self, "longitude");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v4 setObject:v6 forKey:SASetRequestOriginLongitudePListKey];

  return v4;
}

@end