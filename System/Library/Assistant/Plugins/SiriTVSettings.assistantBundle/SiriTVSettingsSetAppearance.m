@interface SiriTVSettingsSetAppearance
- (id)_getSystemServiceProxy;
- (void)performWithCompletion:(id)a3;
@end

@implementation SiriTVSettingsSetAppearance

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriTVSettingsSetAppearance _getSystemServiceProxy](self, "_getSystemServiceProxy"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1DFC;
  v7[3] = &unk_4218;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 systemAppearanceWithReply:v7];
}

- (id)_getSystemServiceProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 systemServiceProxy]);

  return v3;
}

@end