@interface PBSSystemService
- (void)tvft_presentControlCenterFaceTimePanelWithCompletion:(id)a3;
@end

@implementation PBSSystemService

- (void)tvft_presentControlCenterFaceTimePanelWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  if ((objc_opt_respondsToSelector(self, "presentControlCenterFaceTimePanelWithCompletion:") & 1) != 0) {
    -[PBSSystemService presentControlCenterFaceTimePanelWithCompletion:]( self,  "presentControlCenterFaceTimePanelWithCompletion:",  v4);
  }
  else {
    v4[2](v4, 0LL);
  }
}

@end