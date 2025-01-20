@interface PosterBoardTestingUtilities
+ (id)knownPPTTests;
+ (id)posterRackViewController;
+ (id)posterSwitcherWindowScene;
@end

@implementation PosterBoardTestingUtilities

+ (id)knownPPTTests
{
  return &off_1000042D8;
}

+ (id)posterSwitcherWindowScene
{
  Class v2 = NSClassFromString(@"PBFPosterSwitcherSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 connectedScenes]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100002134;
  v8[3] = &unk_1000040F0;
  v8[4] = v2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_firstObjectPassingTest:", v8));

  return v6;
}

+ (id)posterRackViewController
{
  Class v2 = (void *)objc_claimAutoreleasedReturnValue([a1 posterSwitcherWindowScene]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 delegate]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 posterRackViewController]);

  return v4;
}

@end