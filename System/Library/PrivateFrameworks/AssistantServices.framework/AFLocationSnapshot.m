@interface AFLocationSnapshot
- (id)initWithLocation:(id)a3 locationManagerState:(ADLocationManagerState)a4;
@end

@implementation AFLocationSnapshot

- (id)initWithLocation:(id)a3 locationManagerState:(ADLocationManagerState)a4
{
  int64_t accuracyAuthorization = a4.accuracyAuthorization;
  if (a4.locationServicesEnabled)
  {
    if (a4.authorizationStatus > 2u) {
      uint64_t v5 = 1LL;
    }
    else {
      uint64_t v5 = qword_1003C9E68[a4.authorizationStatus];
    }
  }

  else
  {
    uint64_t v5 = 2LL;
  }

  id v6 = a3;
  [v6 coordinate];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v6 coordinate];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));
  [v6 altitude];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v6 course];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v6 speed];
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v6 verticalAccuracy];
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v6 horizontalAccuracy];
  double v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v15));
  LOBYTE(v19) = accuracyAuthorization == 0;
  v17 = -[AFLocationSnapshot initWithLatitude:longitude:altitude:direction:speed:verticalAccuracy:horizontalAccuracy:preciseLocationEnabled:accessState:]( self,  "initWithLatitude:longitude:altitude:direction:speed:verticalAccuracy:horizontalAccuracy:preciseLocationEnabled:accessState:",  v7,  v9,  v10,  v11,  v12,  v13,  v16,  v19,  v5);

  return v17;
}

@end