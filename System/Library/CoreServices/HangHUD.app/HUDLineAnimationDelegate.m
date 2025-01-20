@interface HUDLineAnimationDelegate
- (HUDLine)hudLine;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)setHudLine:(id)a3;
@end

@implementation HUDLineAnimationDelegate

- (void)animationDidStart:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[HUDLineAnimationDelegate hudLine](self, "hudLine", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v4 lineDelegate]);
  [v3 animationDidStartOnLine:v4];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[HUDLineAnimationDelegate hudLine](self, "hudLine", a3, a4));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 lineDelegate]);
  [v4 animationDidStopOnLine:v5];
}

- (HUDLine)hudLine
{
  return (HUDLine *)objc_loadWeakRetained((id *)&self->_hudLine);
}

- (void)setHudLine:(id)a3
{
}

- (void).cxx_destruct
{
}

@end