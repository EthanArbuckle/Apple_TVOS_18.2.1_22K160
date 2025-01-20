@interface MRDSystemEndpointControllerRecentlyDismissedRecommendation
- (BOOL)isEqual:(id)a3;
- (MRDSystemEndpointControllerRecentlyDismissedRecommendation)initWithDictionaryRepresentation:(id)a3;
- (MRDSystemEndpointControllerRecentlyDismissedRecommendation)initWithOutputDevice:(id)a3 date:(id)a4 disableDuration:(double)a5 devicePlaybackSessionID:(id)a6;
- (NSDate)date;
- (NSDictionary)dictionaryRepresentation;
- (NSString)devicePlaybackSessionID;
- (NSString)outputDeviceUID;
- (double)disableDuration;
@end

@implementation MRDSystemEndpointControllerRecentlyDismissedRecommendation

- (MRDSystemEndpointControllerRecentlyDismissedRecommendation)initWithOutputDevice:(id)a3 date:(id)a4 disableDuration:(double)a5 devicePlaybackSessionID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = 0LL;
  if (v11 && v12)
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___MRDSystemEndpointControllerRecentlyDismissedRecommendation;
    v15 = -[MRDSystemEndpointControllerRecentlyDismissedRecommendation init](&v18, "init");
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_outputDeviceUID, a3);
      objc_storeStrong((id *)&v16->_date, a4);
      v16->_disableDuration = a5;
      objc_storeStrong((id *)&v16->_devicePlaybackSessionID, a6);
    }

    self = v16;
    v14 = self;
  }

  return v14;
}

- (MRDSystemEndpointControllerRecentlyDismissedRecommendation)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___MRDSystemEndpointControllerRecentlyDismissedRecommendation);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"outputDeviceUID"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"date"]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"disableDuration"]);
  [v8 doubleValue];
  double v10 = v9;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"devicePlaybackSessionID"]);

  id v12 = -[MRDSystemEndpointControllerRecentlyDismissedRecommendation initWithOutputDevice:date:disableDuration:devicePlaybackSessionID:]( v5,  "initWithOutputDevice:date:disableDuration:devicePlaybackSessionID:",  v6,  v7,  v11,  v10);
  return v12;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDSystemEndpointControllerRecentlyDismissedRecommendation outputDeviceUID](self, "outputDeviceUID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"outputDeviceUID");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDSystemEndpointControllerRecentlyDismissedRecommendation date](self, "date"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"date");

  -[MRDSystemEndpointControllerRecentlyDismissedRecommendation disableDuration](self, "disableDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"disableDuration");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDSystemEndpointControllerRecentlyDismissedRecommendation date](self, "date"));
  -[MRDSystemEndpointControllerRecentlyDismissedRecommendation disableDuration](self, "disableDuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:"));
  [v8 timeIntervalSinceNow];
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"timeRemaining");

  double v10 = (void *)objc_claimAutoreleasedReturnValue( -[MRDSystemEndpointControllerRecentlyDismissedRecommendation devicePlaybackSessionID]( self,  "devicePlaybackSessionID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v10,  @"devicePlaybackSessionID");

  return (NSDictionary *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRDSystemEndpointControllerRecentlyDismissedRecommendation *)a3;
  if (self == v4)
  {
    unsigned __int8 v9 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue( -[MRDSystemEndpointControllerRecentlyDismissedRecommendation outputDeviceUID]( self,  "outputDeviceUID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue( -[MRDSystemEndpointControllerRecentlyDismissedRecommendation outputDeviceUID]( v6,  "outputDeviceUID"));
      if (v7 == v8) {
        unsigned __int8 v9 = 1;
      }
      else {
        unsigned __int8 v9 = [v7 isEqual:v8];
      }
    }

    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (NSDate)date
{
  return self->_date;
}

- (double)disableDuration
{
  return self->_disableDuration;
}

- (NSString)devicePlaybackSessionID
{
  return self->_devicePlaybackSessionID;
}

- (void).cxx_destruct
{
}

@end