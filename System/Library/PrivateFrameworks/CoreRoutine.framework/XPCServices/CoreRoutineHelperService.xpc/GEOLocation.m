@interface GEOLocation
- (id)initWithRTLocation:(id)a3 includeTimeStamp:(BOOL)a4;
@end

@implementation GEOLocation

- (id)initWithRTLocation:(id)a3 includeTimeStamp:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    v7 = objc_alloc(&OBJC_CLASS___GEOLocation);
    [v6 latitude];
    double v9 = v8;
    [v6 longitude];
    v11 = -[GEOLocation initWithLatitude:longitude:](v7, "initWithLatitude:longitude:", v9, v10);
    [v6 horizontalUncertainty];
    -[GEOLocation setHorizontalAccuracy:](v11, "setHorizontalAccuracy:");
    if (v4)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v6 date]);
      [v12 timeIntervalSinceReferenceDate];
      -[GEOLocation setTimestamp:](v11, "setTimestamp:");
    }

    else
    {
      -[GEOLocation setTimestamp:](v11, "setTimestamp:", 0.0);
    }

    unsigned int v15 = [v6 referenceFrame];
    if (v15 > 2) {
      uint64_t v16 = 0LL;
    }
    else {
      uint64_t v16 = dword_100019978[v15];
    }
    -[GEOLocation setReferenceFrame:](v11, "setReferenceFrame:", v16);
  }

  else
  {
    id v13 = sub_10000B294(&qword_10002D0A0);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315394;
      v19 = "-[GEOLocation(XPCMapItemService) initWithRTLocation:includeTimeStamp:]";
      __int16 v20 = 1024;
      int v21 = 85;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Invalid parameter not satisfying: location (in %s:%d)",  (uint8_t *)&v18,  0x12u);
    }

    v11 = 0LL;
  }

  return v11;
}

@end