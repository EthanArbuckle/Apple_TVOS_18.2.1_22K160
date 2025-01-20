@interface GEOMobileAssetResourceDiskSpaceProvider
- (GEODaemon)daemon;
- (NSString)identifier;
- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4;
- (unint64_t)purgableDiskSpaceForUrgency:(int)a3;
- (void)setDaemon:(id)a3;
@end

@implementation GEOMobileAssetResourceDiskSpaceProvider

- (NSString)identifier
{
  return (NSString *)@"com.apple.geod.MAResource";
}

- (unint64_t)purgableDiskSpaceForUrgency:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = -[GEODaemon startServerClassIfNecessary:]( self->_daemon,  "startServerClassIfNecessary:",  objc_opt_class(&OBJC_CLASS___GEOMobileAssetResourceServer, a2, *(void *)&a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v5 purgableDiskSpaceForUrgency:v3];

  return (unint64_t)v6;
}

- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = -[GEODaemon startServerClassIfNecessary:]( self->_daemon,  "startServerClassIfNecessary:",  objc_opt_class(&OBJC_CLASS___GEOMobileAssetResourceServer, a2, a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = [v7 freePurgableDiskSpace:a3 urgency:v4];

  return (unint64_t)v8;
}

- (GEODaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end