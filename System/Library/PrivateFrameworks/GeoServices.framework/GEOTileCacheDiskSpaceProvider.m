@interface GEOTileCacheDiskSpaceProvider
- (NSString)identifier;
- (int)minimumUregency;
- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4;
- (unint64_t)purgableDiskSpaceForUrgency:(int)a3;
@end

@implementation GEOTileCacheDiskSpaceProvider

- (NSString)identifier
{
  return (NSString *)@"com.apple.geod.TileCache";
}

- (int)minimumUregency
{
  return 3;
}

- (unint64_t)purgableDiskSpaceForUrgency:(int)a3
{
  if (-[GEOTileCacheDiskSpaceProvider minimumUregency](self, "minimumUregency") > a3) {
    return 0LL;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GEODiskSpaceManager-%@",  v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOTileLoader modernLoader](&OBJC_CLASS___GEOTileLoader, "modernLoader"));
  [v7 openForClient:v6];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEOTileLoader modernLoader](&OBJC_CLASS___GEOTileLoader, "modernLoader"));
  id v9 = [v8 calculateFreeableSizeSync];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOTileLoader modernLoader](&OBJC_CLASS___GEOTileLoader, "modernLoader"));
  [v10 closeForClient:v6];

  return (unint64_t)v9;
}

- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (-[GEOTileCacheDiskSpaceProvider minimumUregency](self, "minimumUregency") > a4) {
    return 0LL;
  }
  unint64_t v8 = -[GEOTileCacheDiskSpaceProvider purgableDiskSpaceForUrgency:](self, "purgableDiskSpaceForUrgency:", v4);
  if (v8 >= a3) {
    unint64_t v9 = v8 - a3;
  }
  else {
    unint64_t v9 = 0LL;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GEODiskSpaceManager-%@",  v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GEOTileLoader modernLoader](&OBJC_CLASS___GEOTileLoader, "modernLoader"));
  [v13 openForClient:v12];

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GEOTileLoader modernLoader](&OBJC_CLASS___GEOTileLoader, "modernLoader"));
  id v15 = [v14 shrinkDiskCacheToSizeSync:v9];

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GEOTileLoader modernLoader](&OBJC_CLASS___GEOTileLoader, "modernLoader"));
  [v16 closeForClient:v12];

  return (unint64_t)v15;
}

@end