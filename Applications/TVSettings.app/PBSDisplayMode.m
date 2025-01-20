@interface PBSDisplayMode
- (BOOL)isTrue24fps;
- (BOOL)tvs_isCommonResolutionByShowing4KModes:(BOOL)a3;
- (BOOL)tvs_isEqualResolutionAndRefreshRate:(id)a3;
@end

@implementation PBSDisplayMode

- (BOOL)isTrue24fps
{
  return fabs(v2 + -24.0) <= 2.22044605e-16;
}

- (BOOL)tvs_isCommonResolutionByShowing4KModes:(BOOL)a3
{
  BOOL v3 = a3;
  -[PBSDisplayMode resolution](self, "resolution");
  char v7 = PBSDisplayResolutionIs1080p(v5, v6);
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    if ((v7 & 1) == 0 && (PBSDisplayResolutionIs4K(-[PBSDisplayMode resolution](self, "resolution")) & 1) == 0)
    {
LABEL_14:
      LOBYTE(v13) = 0;
      return v13;
    }

- (BOOL)tvs_isEqualResolutionAndRefreshRate:(id)a3
{
  id v4 = a3;
  -[PBSDisplayMode resolution](self, "resolution");
  double v6 = v5;
  double v8 = v7;
  id v9 = [v4 resolution];
  if (PBSDisplayResolutionEqualToResolution(v9, v6, v8, v10, v11))
  {
    -[PBSDisplayMode refreshRate](self, "refreshRate");
    char refreshed = PBSDisplayRefreshRateEqualToRefreshRate([v4 refreshRate]);
  }

  else
  {
    char refreshed = 0;
  }

  return refreshed;
}

@end