@interface TBDefaults
+ (double)nearbyTileSearchRadius;
+ (double)tileSearchRadius;
+ (unsigned)zoomLevel;
+ (void)setOverrideZoomLevel:(unsigned __int8)a3;
@end

@implementation TBDefaults

+ (double)tileSearchRadius
{
  if (tileSearchRadius_radiusToken != -1) {
    dispatch_once(&tileSearchRadius_radiusToken, &__block_literal_global_10);
  }
  return *(double *)&_tileSearchRadius;
}

void __30__TBDefaults_tileSearchRadius__block_invoke()
{
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 wiFiQualitySearchRadiusMeters];
  _tileSearchRadius = v0;
}

+ (double)nearbyTileSearchRadius
{
  if (nearbyTileSearchRadius_nearbyRadiusToken != -1) {
    dispatch_once(&nearbyTileSearchRadius_nearbyRadiusToken, &__block_literal_global_4);
  }
  return *(double *)&_nearbyTileSearchRadius;
}

void __36__TBDefaults_nearbyTileSearchRadius__block_invoke()
{
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 wiFiQualitySmallSearchRadiusMeters];
  _nearbyTileSearchRadius = v0;
}

+ (unsigned)zoomLevel
{
  if (zoomLevel_zoomToken != -1) {
    dispatch_once(&zoomLevel_zoomToken, &__block_literal_global_5_0);
  }
  if (_overrideZoomLevel)
  {
    NSLog( @"%s: returning override zoom level of %d (actual zoom level: %d)",  "+[TBDefaults zoomLevel]",  _overrideZoomLevel,  _zoomLevel);
    v2 = &_overrideZoomLevel;
  }

  else
  {
    v2 = &_zoomLevel;
  }

  return *v2;
}

void __23__TBDefaults_zoomLevel__block_invoke()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  _zoomLevel = [v0 wiFiQualitySearchZoomLevel];
}

+ (void)setOverrideZoomLevel:(unsigned __int8)a3
{
  _overrideZoomLevel = a3;
}

@end