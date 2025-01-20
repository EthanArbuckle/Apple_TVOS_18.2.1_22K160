@interface PBRegionSwitchingShroudView
- (PBRegionSwitchingShroudView)initWithSceneHandle:(id)a3 isOverLiveScene:(BOOL)a4;
@end

@implementation PBRegionSwitchingShroudView

- (PBRegionSwitchingShroudView)initWithSceneHandle:(id)a3 isOverLiveScene:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBRegionSwitchingShroudView;
  v4 = -[PBSceneShroudView initWithSceneHandle:isOverLiveScene:](&v9, "initWithSceneHandle:isOverLiveScene:", a3, a4);
  if (v4)
  {
    id v5 = sub_1001C307C(@"RegionSwitchingShroudText", 0LL);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudView switchingLabel](v4, "switchingLabel"));
    [v7 setText:v6];
  }

  return v4;
}

@end