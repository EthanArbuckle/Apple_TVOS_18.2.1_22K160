@interface GEOImageServiceDiskSpaceProvider
- (BOOL)_shouldPurgeForUrgency:(int)a3;
- (GEODaemon)daemon;
- (GEOImageServicePersistence)persistence;
- (NSString)identifier;
- (int)minimumUregency;
- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4;
- (unint64_t)purgableDiskSpaceForUrgency:(int)a3;
- (void)setDaemon:(id)a3;
- (void)setPersistence:(id)a3;
@end

@implementation GEOImageServiceDiskSpaceProvider

- (NSString)identifier
{
  return (NSString *)@"com.apple.geod.ImageService";
}

- (int)minimumUregency
{
  if (GEOConfigGetBOOL( GeoServicesConfig_ImageServiceSupported[0],  GeoServicesConfig_ImageServiceSupported[1])) {
    return 3;
  }
  else {
    return 1;
  }
}

- (BOOL)_shouldPurgeForUrgency:(int)a3
{
  if (-[GEOImageServiceDiskSpaceProvider minimumUregency](self, "minimumUregency") > a3) {
    goto LABEL_8;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFilePaths pathFor:](&OBJC_CLASS___GEOFilePaths, "pathFor:", 26LL));
  unsigned __int8 v5 = [v3 fileExistsAtPath:v4];

  if ((v5 & 1) != 0)
  {
    LOBYTE(v6) = 1;
    return v6;
  }

  if (qword_10006AFE8 != -1) {
    dispatch_once(&qword_10006AFE8, &stru_100059CA0);
  }
  v7 = (os_log_s *)qword_10006AFE0;
  BOOL v6 = os_log_type_enabled((os_log_t)qword_10006AFE0, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    *(_WORD *)v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "ImageService DB does not exist. Nothing to purge.",  v9,  2u);
LABEL_8:
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (unint64_t)purgableDiskSpaceForUrgency:(int)a3
{
  if (-[GEOImageServiceDiskSpaceProvider _shouldPurgeForUrgency:](self, "_shouldPurgeForUrgency:", *(void *)&a3))
  {
    id v5 =  -[GEODaemon startServerClassIfNecessary:]( self->_daemon,  "startServerClassIfNecessary:",  objc_opt_class(&OBJC_CLASS___GEOImageServiceServer, v4));
    persistence = self->_persistence;
    if (persistence) {
      return -[GEOImageServicePersistence calculateFreeableSize](persistence, "calculateFreeableSize");
    }
    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v8) {
      sub_10003AD68(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  return 0LL;
}

- (unint64_t)freePurgableDiskSpace:(unint64_t)a3 urgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!-[GEOImageServiceDiskSpaceProvider _shouldPurgeForUrgency:](self, "_shouldPurgeForUrgency:", *(void *)&a4)) {
    return 0LL;
  }
  id v8 =  -[GEODaemon startServerClassIfNecessary:]( self->_daemon,  "startServerClassIfNecessary:",  objc_opt_class(&OBJC_CLASS___GEOImageServiceServer, v7));
  if (!self->_persistence)
  {
    BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v12) {
      sub_10003AD68(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    return 0LL;
  }

  unint64_t v9 = -[GEOImageServiceDiskSpaceProvider purgableDiskSpaceForUrgency:](self, "purgableDiskSpaceForUrgency:", v4);
  if (v9 >= a3) {
    unint64_t v10 = v9 - a3;
  }
  else {
    unint64_t v10 = 0LL;
  }
  return -[GEOImageServicePersistence shrinkToSize:](self->_persistence, "shrinkToSize:", v10);
}

- (GEODaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (GEOImageServicePersistence)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
}

- (void).cxx_destruct
{
}

@end