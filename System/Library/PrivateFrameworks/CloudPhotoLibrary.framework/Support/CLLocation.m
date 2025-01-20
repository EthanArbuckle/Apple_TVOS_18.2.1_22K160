@interface CLLocation
+ (CLLocation)locationWithCPLLocationDictionary:(id)a3;
- (id)cplLocationDictionary;
@end

@implementation CLLocation

+ (CLLocation)locationWithCPLLocationDictionary:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_msgSend(v3, "cpl_validObjectForKey:class:", @"lat", objc_opt_class(NSNumber));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    id v6 = objc_msgSend(v3, "cpl_validObjectForKey:class:", @"lon", objc_opt_class(NSNumber));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = objc_msgSend(v3, "cpl_validObjectForKey:class:", @"alt", objc_opt_class(NSNumber));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = objc_msgSend(v3, "cpl_validObjectForKey:class:", @"horzAcc", objc_opt_class(NSNumber));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = objc_msgSend(v3, "cpl_validObjectForKey:class:", @"vertAcc", objc_opt_class(NSNumber));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = objc_msgSend(v3, "cpl_validObjectForKey:class:", @"timestamp", objc_opt_class(NSDate));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = objc_msgSend(v3, "cpl_validObjectForKey:class:", @"course", objc_opt_class(NSNumber));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = objc_msgSend(v3, "cpl_validObjectForKey:class:", @"speed", objc_opt_class(NSNumber));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    v20 = 0LL;
    if (v5 && v7)
    {
      [v5 doubleValue];
      CLLocationDegrees v22 = v21;
      [v7 doubleValue];
      CLLocationCoordinate2D v24 = CLLocationCoordinate2DMake(v22, v23);
      v25 = objc_alloc(&OBJC_CLASS___CLLocation);
      [v9 doubleValue];
      double v27 = v26;
      [v11 doubleValue];
      double v29 = v28;
      [v13 doubleValue];
      double v31 = v30;
      [v17 doubleValue];
      double v33 = v32;
      [v19 doubleValue];
      v20 = -[CLLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:]( v25,  "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:",  v15,  v24.latitude,  v24.longitude,  v27,  v29,  v31,  v33,  v34);
    }
  }

  else
  {
    v20 = 0LL;
  }

  return v20;
}

- (id)cplLocationDictionary
{
  v14[0] = @"lat";
  -[CLLocation coordinate](self, "coordinate");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v15[0] = v3;
  v14[1] = @"lon";
  -[CLLocation coordinate](self, "coordinate");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v4));
  v15[1] = v5;
  v14[2] = @"alt";
  -[CLLocation altitude](self, "altitude");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v15[2] = v6;
  v14[3] = @"horzAcc";
  -[CLLocation horizontalAccuracy](self, "horizontalAccuracy");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v15[3] = v7;
  v14[4] = @"vertAcc";
  -[CLLocation verticalAccuracy](self, "verticalAccuracy");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v15[4] = v8;
  v14[5] = @"timestamp";
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CLLocation timestamp](self, "timestamp"));
  v15[5] = v9;
  v14[6] = @"course";
  -[CLLocation course](self, "course");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v15[6] = v10;
  v14[7] = @"speed";
  -[CLLocation speed](self, "speed");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v15[7] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  8LL));

  return v12;
}

@end