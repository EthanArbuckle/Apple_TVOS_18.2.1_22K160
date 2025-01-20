@interface MTListenNowManifest
+ (id)activityTypeSuffix;
+ (void)createManifestForActivity:(id)a3 completion:(id)a4;
- (void)nextManifest:(id)a3;
@end

@implementation MTListenNowManifest

- (void)nextManifest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTListenNowManager sharedInstance](&OBJC_CLASS___MTListenNowManager, "sharedInstance"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000E8600;
    v6[3] = &unk_100244678;
    v6[4] = self;
    id v7 = v4;
    [v5 results:v6];
  }
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForKey:@"MTPodcastManifestActivitySectionType"]);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000E8CD0;
  v12[3] = &unk_1002446A0;
  id v13 = v9;
  id v14 = v6;
  id v10 = v9;
  id v11 = v6;
  [a1 episodeUuidForActivity:v7 completion:v12];
}

+ (id)activityTypeSuffix
{
  return @"listenNow";
}

@end