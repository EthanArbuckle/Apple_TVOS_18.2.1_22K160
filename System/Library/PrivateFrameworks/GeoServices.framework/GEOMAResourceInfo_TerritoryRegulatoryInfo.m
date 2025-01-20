@interface GEOMAResourceInfo_TerritoryRegulatoryInfo
+ (id)_defaultQueryParameters;
+ (id)_defaultQueryType;
+ (id)allExisitngInfos;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldPrefetchResource:(id)a3;
- (GEOMAResourceInfo_TerritoryRegulatoryInfo)init;
- (MADownloadOptions)downloadOptions;
- (double)timeToLive;
- (unint64_t)hash;
- (unint64_t)policy;
@end

@implementation GEOMAResourceInfo_TerritoryRegulatoryInfo

- (GEOMAResourceInfo_TerritoryRegulatoryInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GEOMAResourceInfo_TerritoryRegulatoryInfo;
  return -[GEOMAResourceInfo initWithType:overrides:](&v3, "initWithType:overrides:", 1LL, 0LL);
}

- (unint64_t)policy
{
  unint64_t result = GEOConfigGetUInteger( GeoServicesConfig_TerritoryRegulatoryAssetPolicy[0],  GeoServicesConfig_TerritoryRegulatoryAssetPolicy[1]);
  if (result - 1 >= 3) {
    return 1LL;
  }
  return result;
}

- (double)timeToLive
{
  double result = (double)(unint64_t)GEOConfigGetUInteger( GeoServicesConfig_TerritoryRegulatoryAssetTTLDays[0],  GeoServicesConfig_TerritoryRegulatoryAssetTTLDays[1]);
  if (result < 86400.0) {
    double result = 86400.0;
  }
  if (result > 7776000.0) {
    return 7776000.0;
  }
  return result;
}

+ (id)allExisitngInfos
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_100025150;
  v10 = sub_100025160;
  id v11 = 0LL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100025168;
  v5[3] = &unk_10005A0E0;
  v5[4] = &v6;
  v5[5] = a1;
  +[GEOMAResource onFileAccessQueueSync:](&OBJC_CLASS___GEOMAResource, "onFileAccessQueueSync:", v5);
  v2 = (void *)v7[5];
  if (!v2) {
    v2 = &__NSArray0__struct;
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (id)_defaultQueryType
{
  return @"com.apple.MobileAsset.GeoPolygonDataAssets";
}

+ (id)_defaultQueryParameters
{
  v3[0] = @"Type";
  v3[1] = @"_CompatibilityVersion";
  v4[0] = @"Territories";
  v4[1] = &off_10005E8B0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

- (MADownloadOptions)downloadOptions
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GEOMAResourceInfo_TerritoryRegulatoryInfo;
  id v2 = -[GEOMAResourceInfo _backgroundDownloadOptions](&v4, "_backgroundDownloadOptions");
  return (MADownloadOptions *)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (BOOL)shouldPrefetchResource:(id)a3
{
  return 1;
}

- (unint64_t)hash
{
  return self->super._type;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3 = objc_opt_class(a3, a2, a3);
  return v3 == objc_opt_class(&OBJC_CLASS___GEOMAResourceInfo_TerritoryRegulatoryInfo, v4, v5);
}

@end