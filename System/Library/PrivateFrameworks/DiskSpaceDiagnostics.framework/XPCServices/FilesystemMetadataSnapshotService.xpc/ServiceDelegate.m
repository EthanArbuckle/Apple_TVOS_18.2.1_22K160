@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  id v5 = shared_filesystem_metadata_snapshot_service_log_handle();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = [v4 processIdentifier];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "New connection from pid %d ",  (uint8_t *)v12,  8u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.filesystem-metadata-snapshotting"]);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DSFilesystemMetadataSnapshotting));
    [v4 setExportedInterface:v8];

    v9 = objc_opt_new(&OBJC_CLASS___DSFilesystemMetadataSnapshotService);
    [v4 setExportedObject:v9];
    [v4 resume];
  }

  else
  {
    id v10 = shared_filesystem_metadata_snapshot_service_log_handle();
    v9 = (DSFilesystemMetadataSnapshotService *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
      sub_10002CEA8(v4);
    }
  }

  return v7 != 0LL;
}

@end