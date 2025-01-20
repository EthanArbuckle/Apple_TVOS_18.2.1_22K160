@interface TVSSSceneDelegateMenuModeStateContributor
- (BOOL)headboardRequestedVisibility;
- (BOOL)isDictating;
- (BOOL)isSplitViewVisible;
- (NSNumber)interactionRequestReason;
- (PBSScheduledSleep)currentScheduledSleep;
- (TVSSMenuModeStateContributingDelegate)contributorDelegate;
- (int64_t)playbackControlsState;
- (int64_t)siriPresentationVisibility;
- (void)_notifyStateContributorHasUpdate;
- (void)setContributorDelegate:(id)a3;
- (void)setCurrentScheduledSleep:(id)a3;
- (void)setDictating:(BOOL)a3;
- (void)setHeadboardRequestedVisibility:(BOOL)a3;
- (void)setInteractionRequestReason:(id)a3;
- (void)setPlaybackControlsState:(int64_t)a3;
- (void)setSiriPresentationVisibility:(int64_t)a3;
- (void)setSplitViewVisible:(BOOL)a3;
- (void)updateMenuModeState:(id)a3;
@end

@implementation TVSSSceneDelegateMenuModeStateContributor

- (void)setHeadboardRequestedVisibility:(BOOL)a3
{
  if (self->_headboardRequestedVisibility != a3)
  {
    self->_headboardRequestedVisibility = a3;
    -[TVSSSceneDelegateMenuModeStateContributor _notifyStateContributorHasUpdate]( self,  "_notifyStateContributorHasUpdate");
  }

- (void)setInteractionRequestReason:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ((-[NSNumber isEqual:](v4->_interactionRequestReason, "isEqual:", location[0]) & 1) == 0)
  {
    objc_storeStrong((id *)&v4->_interactionRequestReason, location[0]);
    -[TVSSSceneDelegateMenuModeStateContributor _notifyStateContributorHasUpdate]( v4,  "_notifyStateContributorHasUpdate");
  }

  objc_storeStrong(location, 0LL);
}

- (void)setPlaybackControlsState:(int64_t)a3
{
  if (self->_playbackControlsState != a3)
  {
    self->_playbackControlsState = a3;
    -[TVSSSceneDelegateMenuModeStateContributor _notifyStateContributorHasUpdate]( self,  "_notifyStateContributorHasUpdate");
  }

- (void)setSplitViewVisible:(BOOL)a3
{
  if (self->_splitViewVisible != a3)
  {
    self->_splitViewVisible = a3;
    -[TVSSSceneDelegateMenuModeStateContributor _notifyStateContributorHasUpdate]( self,  "_notifyStateContributorHasUpdate");
  }

- (void)setSiriPresentationVisibility:(int64_t)a3
{
  if (self->_siriPresentationVisibility != a3)
  {
    self->_siriPresentationVisibility = a3;
    -[TVSSSceneDelegateMenuModeStateContributor _notifyStateContributorHasUpdate]( self,  "_notifyStateContributorHasUpdate");
  }

- (void)setDictating:(BOOL)a3
{
  if (self->_dictating != a3)
  {
    self->_dictating = a3;
    -[TVSSSceneDelegateMenuModeStateContributor _notifyStateContributorHasUpdate]( self,  "_notifyStateContributorHasUpdate");
  }

- (void)setCurrentScheduledSleep:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ((-[PBSScheduledSleep isEqual:](v4->_currentScheduledSleep, "isEqual:", location[0]) & 1) == 0)
  {
    objc_storeStrong((id *)&v4->_currentScheduledSleep, location[0]);
    -[TVSSSceneDelegateMenuModeStateContributor _notifyStateContributorHasUpdate]( v4,  "_notifyStateContributorHasUpdate");
  }

  objc_storeStrong(location, 0LL);
}

- (void)updateMenuModeState:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_msgSend( location[0],  "setHeadboardRequestedVisibility:",  -[TVSSSceneDelegateMenuModeStateContributor headboardRequestedVisibility](v8, "headboardRequestedVisibility"));
  id v3 = location[0];
  v4 = -[TVSSSceneDelegateMenuModeStateContributor interactionRequestReason](v8, "interactionRequestReason");
  objc_msgSend(v3, "setInteractionRequestReason:");

  objc_msgSend( location[0],  "setPlaybackControlsState:",  -[TVSSSceneDelegateMenuModeStateContributor playbackControlsState](v8, "playbackControlsState"));
  objc_msgSend( location[0],  "setSplitViewVisible:",  -[TVSSSceneDelegateMenuModeStateContributor isSplitViewVisible](v8, "isSplitViewVisible"));
  objc_msgSend( location[0],  "setSiriPresentationVisibility:",  -[TVSSSceneDelegateMenuModeStateContributor siriPresentationVisibility](v8, "siriPresentationVisibility"));
  objc_msgSend( location[0],  "setDictating:",  -[TVSSSceneDelegateMenuModeStateContributor isDictating](v8, "isDictating"));
  id v5 = location[0];
  v6 = -[TVSSSceneDelegateMenuModeStateContributor currentScheduledSleep](v8, "currentScheduledSleep");
  objc_msgSend(v5, "setCurrentScheduledSleep:");

  objc_storeStrong(location, 0LL);
}

- (void)_notifyStateContributorHasUpdate
{
  v2 = -[TVSSSceneDelegateMenuModeStateContributor contributorDelegate](self, "contributorDelegate");
  -[TVSSMenuModeStateContributingDelegate stateContributorHasUpdate:](v2, "stateContributorHasUpdate:", self);
}

- (TVSSMenuModeStateContributingDelegate)contributorDelegate
{
  return (TVSSMenuModeStateContributingDelegate *)objc_loadWeakRetained((id *)&self->contributorDelegate);
}

- (void)setContributorDelegate:(id)a3
{
}

- (BOOL)headboardRequestedVisibility
{
  return self->_headboardRequestedVisibility;
}

- (NSNumber)interactionRequestReason
{
  return self->_interactionRequestReason;
}

- (int64_t)playbackControlsState
{
  return self->_playbackControlsState;
}

- (BOOL)isSplitViewVisible
{
  return self->_splitViewVisible;
}

- (int64_t)siriPresentationVisibility
{
  return self->_siriPresentationVisibility;
}

- (BOOL)isDictating
{
  return self->_dictating;
}

- (PBSScheduledSleep)currentScheduledSleep
{
  return self->_currentScheduledSleep;
}

- (void).cxx_destruct
{
}

@end