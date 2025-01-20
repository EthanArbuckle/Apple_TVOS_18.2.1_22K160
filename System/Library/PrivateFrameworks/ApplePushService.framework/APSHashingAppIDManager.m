@interface APSHashingAppIDManager
- (id)loadAppIdForEnvironmentName:(id)a3 topic:(id)a4 identifier:(id)a5;
- (id)loadOrCreateAppIdForEnvironmentName:(id)a3 topic:(id)a4 identifier:(id)a5;
@end

@implementation APSHashingAppIDManager

- (id)loadAppIdForEnvironmentName:(id)a3 topic:(id)a4 identifier:(id)a5
{
  unsigned __int16 v9 = 0;
  id v5 = sub_100077D74(a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v6 getBytes:&v9 length:2];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v9));

  return v7;
}

- (id)loadOrCreateAppIdForEnvironmentName:(id)a3 topic:(id)a4 identifier:(id)a5
{
  unsigned __int16 v9 = 0;
  id v5 = sub_100077D74(a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v6 getBytes:&v9 length:2];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v9));

  return v7;
}

@end