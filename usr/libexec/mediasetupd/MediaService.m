@interface MediaService
- (id)_getAppleMusicAccountName:(id)a3;
- (id)_getLocalIconImagePath:(id)a3 remoteIconURL:(id)a4;
- (void)populateMediaService:(id)a3 homeID:(id)a4 homeUserID:(id)a5;
@end

@implementation MediaService

- (void)populateMediaService:(id)a3 homeID:(id)a4 homeUserID:(id)a5
{
  id v28 = a5;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService serviceID](self, "serviceID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  unsigned int v10 = [v9 isEqualToString:kAppleMusicServiceIdentifier];

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService _getAppleMusicAccountName:](self, "_getAppleMusicAccountName:", v28));
    -[MediaService setAccountName:](self, "setAccountName:", v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceIconPath]);
  -[MediaService setRemoteIconURL:](self, "setRemoteIconURL:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceType]);
  id v14 = [v13 copy];
  -[MediaService setServiceType:](self, "setServiceType:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceName]);
  id v16 = [v15 copy];
  -[MediaService setServiceName:](self, "setServiceName:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIDS]);
  id v18 = [v17 copy];
  -[MediaService setAlternateBundleIdentifiers:](self, "setAlternateBundleIdentifiers:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue([v7 configurationPublicKey]);
  id v20 = [v19 copy];
  -[MediaService setConfigPublicKey:](self, "setConfigPublicKey:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIDS]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 firstObject]);
  id v23 = [v22 copy];
  -[MediaService setBundleIdentifier:](self, "setBundleIdentifier:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService serviceID](self, "serviceID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 UUIDString]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceIconPath]);

  v27 = (void *)objc_claimAutoreleasedReturnValue( -[MediaService _getLocalIconImagePath:remoteIconURL:]( self,  "_getLocalIconImagePath:remoteIconURL:",  v25,  v26));
  -[MediaService setIconImageURL:](self, "setIconImageURL:", v27);
}

- (id)_getAppleMusicAccountName:(id)a3
{
  id v3 = a3;
  v4 = -[MSDAccount initWithHomeUserIdentifier:]( objc_alloc(&OBJC_CLASS___MSDAccount),  "initWithHomeUserIdentifier:",  v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccount iTunesAccountName](v4, "iTunesAccountName"));
  return v5;
}

- (id)_getLocalIconImagePath:(id)a3 remoteIconURL:(id)a4
{
  return 0LL;
}

@end