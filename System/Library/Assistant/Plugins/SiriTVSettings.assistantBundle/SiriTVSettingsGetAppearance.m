@interface SiriTVSettingsGetAppearance
- (id)_getSystemServiceProxy;
- (void)performWithCompletion:(id)a3;
@end

@implementation SiriTVSettingsGetAppearance

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriTVSettingsGetAppearance _getSystemServiceProxy](self, "_getSystemServiceProxy"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_21EC;
    v6[3] = &unk_4240;
    id v7 = v4;
    [v5 systemAppearanceWithReply:v6];
  }
}

- (id)_getSystemServiceProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 systemServiceProxy]);

  return v3;
}

@end