@interface MTTVStationActionController
- (MTTVStationActionController)initWithDelegate:(id)a3;
- (id)allActions;
@end

@implementation MTTVStationActionController

- (id)allActions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMAction stationPlayAction](&OBJC_CLASS___IMAction, "stationPlayAction"));
  v8[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMAction stationRefreshAction](&OBJC_CLASS___IMAction, "stationRefreshAction"));
  v8[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMAction stationSettingsAction](&OBJC_CLASS___IMAction, "stationSettingsAction"));
  v8[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMAction stationDeleteAction](&OBJC_CLASS___IMAction, "stationDeleteAction"));
  v8[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 4LL));

  return v6;
}

- (MTTVStationActionController)initWithDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVStationActionController;
  return -[IMActionController initWithDelegate:](&v4, "initWithDelegate:", a3);
}

@end