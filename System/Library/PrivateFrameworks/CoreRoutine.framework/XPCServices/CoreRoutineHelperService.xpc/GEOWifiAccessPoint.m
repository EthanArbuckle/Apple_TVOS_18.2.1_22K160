@interface GEOWifiAccessPoint
- (id)initWithRTWiFiAccessPoint:(id)a3 includeTimeStamp:(BOOL)a4;
@end

@implementation GEOWifiAccessPoint

- (id)initWithRTWiFiAccessPoint:(id)a3 includeTimeStamp:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    v21.receiver = self;
    v21.super_class = (Class)&OBJC_CLASS___GEOWifiAccessPoint;
    v7 = -[GEOWifiAccessPoint init](&v21, "init");
    v8 = v7;
    if (v7)
    {
      if (v4)
      {
        [v6 age];
        double v10 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue([v6 date]);
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v11,  v10));
        [v12 timeIntervalSinceReferenceDate];
        -[GEOWifiAccessPoint setScanTimestamp:](v8, "setScanTimestamp:", (unint64_t)v13);
      }

      else
      {
        -[GEOWifiAccessPoint setScanTimestamp:](v7, "setScanTimestamp:", 0LL);
      }

      [v6 age];
      -[GEOWifiAccessPoint setAge:](v8, "setAge:", v17);
      -[GEOWifiAccessPoint setChannel:](v8, "setChannel:", [v6 channel]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v6 mac]);
      id v19 = [v18 copy];
      -[GEOWifiAccessPoint setMacId:](v8, "setMacId:", v19);

      -[GEOWifiAccessPoint setRssi:](v8, "setRssi:", [v6 rssi]);
    }

    self = v8;
    v16 = self;
  }

  else
  {
    id v14 = sub_10000B294(&qword_10002D0A0);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[GEOWifiAccessPoint(XPCMapItemService) initWithRTWiFiAccessPoint:includeTimeStamp:]";
      __int16 v24 = 1024;
      int v25 = 125;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: accessPoint (in %s:%d)",  buf,  0x12u);
    }

    v16 = 0LL;
  }

  return v16;
}

@end