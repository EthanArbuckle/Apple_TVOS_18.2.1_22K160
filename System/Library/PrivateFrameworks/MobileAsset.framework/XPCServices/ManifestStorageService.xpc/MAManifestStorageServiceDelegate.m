@interface MAManifestStorageServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_descriptionForConnection:(id)a3;
@end

@implementation MAManifestStorageServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.private.MobileAsset.ManifestStorageService"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if (objc_opt_isKindOfClass(v6, v7) & 1) != 0 && ([v6 BOOLValue])
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[MAManifestStorageServiceDelegate _descriptionForConnection:]( self,  "_descriptionForConnection:",  v5));
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAManifestStorageServiceDelegate listener:shouldAcceptNewConnection:]",  @"Client connected: %@",  v13,  v14,  v15,  v16,  (uint64_t)v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MAManifestStorageServiceProtocol));
    [v5 setExportedInterface:v17];

    v18 = objc_alloc_init(&OBJC_CLASS___MAManifestStorageService);
    [v5 setExportedObject:v18];

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100003344;
    v25[3] = &unk_1000082E8;
    id v19 = v12;
    id v26 = v19;
    [v5 setInvalidationHandler:v25];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100003380;
    v23[3] = &unk_1000082E8;
    id v24 = v19;
    id v20 = v19;
    [v5 setInterruptionHandler:v23];
    [v5 resume];

    BOOL v21 = 1;
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAManifestStorageServiceDelegate listener:shouldAcceptNewConnection:]",  @"Rejecting incoming XPC connection: %@",  v8,  v9,  v10,  v11,  (uint64_t)v5);
    BOOL v21 = 0;
  }

  return v21;
}

- (id)_descriptionForConnection:(id)a3
{
  id v3 = a3;
  id v4 = [v3 processIdentifier];
  id v5 = [v3 effectiveUserIdentifier];

  bzero(buffer, 0x1000uLL);
  if (proc_pidpath((int)v4, buffer, 0x1000u) < 1)
  {
    v6 = 0LL;
    uint64_t v7 = 0LL;
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buffer));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (pid = %d, uid = %d, path = %@)",  v7,  v4,  v5,  v6));

  return v8;
}

@end