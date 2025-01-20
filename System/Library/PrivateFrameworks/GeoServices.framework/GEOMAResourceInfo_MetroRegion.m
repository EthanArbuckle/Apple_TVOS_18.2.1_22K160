@interface GEOMAResourceInfo_MetroRegion
+ (id)_defaultQueryParameters;
+ (id)_defaultQueryType;
+ (id)allExisitngInfos;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldPrefetchResource:(id)a3;
- (GEOMAResourceInfo_MetroRegion)initWithOverrides:(id)a3;
- (MADownloadOptions)downloadOptions;
- (NSURL)baseURL;
- (double)timeToLive;
- (unint64_t)hash;
- (unint64_t)policy;
@end

@implementation GEOMAResourceInfo_MetroRegion

- (GEOMAResourceInfo_MetroRegion)initWithOverrides:(id)a3
{
  return 0LL;
}

- (NSURL)baseURL
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GEOMAResourceInfo_MetroRegion;
  id v3 = -[GEOMAResourceInfo baseURL](&v7, "baseURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:self->_countryCode isDirectory:1]);

  return (NSURL *)v5;
}

- (unint64_t)policy
{
  if (GEOConfigGetBOOL( GeoServicesConfig_MetroRegionAssetPrefetchCurrentCC[0],  GeoServicesConfig_MetroRegionAssetPrefetchCurrentCC[1])
    && (id v3 = (void *)objc_claimAutoreleasedReturnValue( +[GEOCountryConfiguration sharedConfiguration]( GEOCountryConfiguration,  "sharedConfiguration")),  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 countryCode]),  v3,  v5 = -[NSString isEqualToString:](self->_countryCode, "isEqualToString:", v4),  v4,  (v5 & 1) != 0))
  {
    return 2LL;
  }

  else
  {
    return 3LL;
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
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100025544;
  v4[3] = &unk_1000597E8;
  id v6 = a1;
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v5 = v2;
  +[GEOMAResource onFileAccessQueueSync:](&OBJC_CLASS___GEOMAResource, "onFileAccessQueueSync:", v4);

  return v2;
}

+ (id)_defaultQueryType
{
  return @"com.apple.MobileAsset.GeoPolygonDataAssets";
}

+ (id)_defaultQueryParameters
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[GEOCountryConfiguration sharedConfiguration]( &OBJC_CLASS___GEOCountryConfiguration,  "sharedConfiguration"));
  id v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 countryCode]);

  v7[0] = @"Type";
  v7[1] = @"_CompatibilityVersion";
  v8[0] = @"Metro";
  v8[1] = @"1";
  v7[2] = GEOMetroRegionCountryCodeKey;
  if (v3) {
    v4 = v3;
  }
  else {
    v4 = @"_UNK_";
  }
  v8[2] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  3LL));

  return v5;
}

- (MADownloadOptions)downloadOptions
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GEOMAResourceInfo_MetroRegion;
  id v2 = -[GEOMAResourceInfo _backgroundDownloadOptions](&v4, "_backgroundDownloadOptions");
  return (MADownloadOptions *)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (BOOL)shouldPrefetchResource:(id)a3
{
  id v4 = a3;
  if ((id)-[GEOMAResourceInfo_MetroRegion policy](self, "policy") == (id)2)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[GEOCountryConfiguration sharedConfiguration]( &OBJC_CLASS___GEOCountryConfiguration,  "sharedConfiguration"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 countryCode]);

    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v4 attributes]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GEOMetroRegionCountryCodeKey]);
    unsigned __int8 v9 = [v8 isEqual:v6];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t type = self->super._type;
  return -[NSString hash](self->_countryCode, "hash") ^ (type << 24);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(v4, v5);
  if (v6 == objc_opt_class(&OBJC_CLASS___GEOMAResourceInfo_MetroRegion, v7)) {
    BOOL v8 = -[NSString isEqualToString:](self->_countryCode, "isEqualToString:", v4[3]);
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end