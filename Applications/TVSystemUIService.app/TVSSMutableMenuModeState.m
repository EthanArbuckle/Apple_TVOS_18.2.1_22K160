@interface TVSSMutableMenuModeState
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBannerContext:(id)a3;
- (void)setCameraInUse:(BOOL)a3;
- (void)setCurrentScheduledSleep:(id)a3;
- (void)setDictating:(BOOL)a3;
- (void)setFaceTimeActive:(BOOL)a3;
- (void)setFaceTimePlatterState:(id)a3;
- (void)setFocusedApp:(id)a3;
- (void)setHasUserAttention:(BOOL)a3;
- (void)setHeadboardRequestedVisibility:(BOOL)a3;
- (void)setInteractionRequestReason:(id)a3;
- (void)setKeyboardFocusedElement:(id)a3;
- (void)setLocationInUse:(BOOL)a3;
- (void)setMicInUse:(BOOL)a3;
- (void)setPipActive:(BOOL)a3;
- (void)setPlaybackControlsState:(int64_t)a3;
- (void)setSiriPresentationVisibility:(int64_t)a3;
- (void)setSplitViewVisible:(BOOL)a3;
@end

@implementation TVSSMutableMenuModeState

- (void)setFocusedApp:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->super._focusedApp, location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)setKeyboardFocusedElement:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->super._keyboardFocusedElement, location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)setHeadboardRequestedVisibility:(BOOL)a3
{
  self->super._headboardRequestedVisibility = a3;
}

- (void)setInteractionRequestReason:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->super._interactionRequestReason, location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)setHasUserAttention:(BOOL)a3
{
  self->super._hasUserAttention = a3;
}

- (void)setSplitViewVisible:(BOOL)a3
{
  self->super._splitViewVisible = a3;
}

- (void)setPipActive:(BOOL)a3
{
  self->super._pipActive = a3;
}

- (void)setBannerContext:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->super._bannerContext, location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)setLocationInUse:(BOOL)a3
{
  self->super._locationInUse = a3;
}

- (void)setCameraInUse:(BOOL)a3
{
  self->super._cameraInUse = a3;
}

- (void)setMicInUse:(BOOL)a3
{
  self->super._micInUse = a3;
}

- (void)setPlaybackControlsState:(int64_t)a3
{
  self->super._playbackControlsState = a3;
}

- (void)setFaceTimeActive:(BOOL)a3
{
  self->super._faceTimeActive = a3;
}

- (void)setFaceTimePlatterState:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = (NSString *)[location[0] copy];
  faceTimePlatterState = v6->super._faceTimePlatterState;
  v6->super._faceTimePlatterState = v3;

  objc_storeStrong(location, 0LL);
}

- (void)setSiriPresentationVisibility:(int64_t)a3
{
  self->super._siriPresentationVisibility = a3;
}

- (void)setDictating:(BOOL)a3
{
  self->super._dictating = a3;
}

- (void)setCurrentScheduledSleep:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->super._currentScheduledSleep, location[0]);
  objc_storeStrong(location, 0LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TVSSMenuModeState initWithMenuModeEvaluationState:]( objc_alloc(&OBJC_CLASS___TVSSMenuModeState),  "initWithMenuModeEvaluationState:",  self);
}

@end