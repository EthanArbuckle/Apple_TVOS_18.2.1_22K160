@interface MPCPlayerResponse
- (id)localAVPlayer;
@end

@implementation MPCPlayerResponse

- (id)localAVPlayer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 player]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 player]);

  return v4;
}

@end