@interface PBPictureInPictureOverlayCoordinator
- (BOOL)acceptsEventFocus;
- (PBPIPRootViewController)pipRootViewController;
- (PBPictureInPictureOverlayCoordinator)initWithName:(id)a3 layoutLevel:(int64_t)a4 presentationHandler:(id)a5 delegate:(id)a6;
- (PBSplitViewControlsViewController)splitViewControlsViewController;
- (void)_dismiss;
- (void)_present;
- (void)_updateActiveSessionIfNeeded;
- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3;
- (void)setAcceptsEventFocus:(BOOL)a3;
- (void)setPipRootViewController:(id)a3;
- (void)setSplitViewControlsViewController:(id)a3;
- (void)setSplitViewStashOverlayHintState:(int64_t)a3;
@end

@implementation PBPictureInPictureOverlayCoordinator

- (PBPictureInPictureOverlayCoordinator)initWithName:(id)a3 layoutLevel:(int64_t)a4 presentationHandler:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PBPictureInPictureOverlayCoordinator;
  v13 = -[PBPictureInPictureOverlayCoordinator init](&v17, "init");
  if (v13)
  {
    v14 = -[PBSystemOverlayController initWithName:layoutLevel:presentationHandler:delegate:]( objc_alloc(&OBJC_CLASS___PBSystemOverlayController),  "initWithName:layoutLevel:presentationHandler:delegate:",  v10,  a4,  v11,  v12);
    overlayController = v13->_overlayController;
    v13->_overlayController = v14;
  }

  return v13;
}

- (void)setAcceptsEventFocus:(BOOL)a3
{
  self->_acceptsEventFocus = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentPresentingViewController);
  [WeakRetained setAcceptsEventFocus:self->_acceptsEventFocus];
}

- (void)setPipRootViewController:(id)a3
{
  v5 = (PBPIPRootViewController *)a3;
  if (self->_pipRootViewController != v5)
  {
    objc_storeStrong((id *)&self->_pipRootViewController, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentPresentingViewController);
    [WeakRetained setPipRootViewController:self->_pipRootViewController];

    -[PBPictureInPictureOverlayCoordinator _updateActiveSessionIfNeeded](self, "_updateActiveSessionIfNeeded");
  }
}

- (void)setSplitViewControlsViewController:(id)a3
{
  v5 = (PBSplitViewControlsViewController *)a3;
  if (self->_splitViewControlsViewController != v5)
  {
    objc_storeStrong((id *)&self->_splitViewControlsViewController, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_contentPresentingViewController);
    [WeakRetained setSplitViewControlsViewController:self->_splitViewControlsViewController];

    -[PBPictureInPictureOverlayCoordinator _updateActiveSessionIfNeeded](self, "_updateActiveSessionIfNeeded");
  }
}

- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3
{
  v4 = (void (**)(id, PBPictureInPictureContentPresentingViewController *, void))a3;
  v5 = objc_alloc_init(&OBJC_CLASS___PBPictureInPictureContentPresentingViewController);
  objc_storeWeak((id *)&self->_contentPresentingViewController, v5);
  -[PBPictureInPictureContentPresentingViewController setAcceptsEventFocus:]( v5,  "setAcceptsEventFocus:",  self->_acceptsEventFocus);
  -[PBPictureInPictureContentPresentingViewController setPipRootViewController:]( v5,  "setPipRootViewController:",  self->_pipRootViewController);
  -[PBPictureInPictureContentPresentingViewController setSplitViewControlsViewController:]( v5,  "setSplitViewControlsViewController:",  self->_splitViewControlsViewController);
  v4[2](v4, v5, 0LL);
}

- (void)_updateActiveSessionIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));

  if (self->_pipRootViewController)
  {
    BOOL v4 = 1;
  }

  else
  {
    BOOL v4 = self->_splitViewControlsViewController != 0LL;
    if (!self->_splitViewControlsViewController) {
      goto LABEL_6;
    }
  }

  if (!v3)
  {
    -[PBPictureInPictureOverlayCoordinator _present](self, "_present");
    return;
  }

- (void)_present
{
  v3 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest);
  BOOL v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[PBMutableSystemOverlayPresentationRequest setIdentifier:](v3, "setIdentifier:", v6);

  -[PBMutableSystemOverlayPresentationRequest setAnimated:](v3, "setAnimated:", 0LL);
  -[PBMutableSystemOverlayPresentationRequest setProvider:](v3, "setProvider:", self);
  overlayController = self->_overlayController;
  id v8 = -[PBMutableSystemOverlayPresentationRequest copy](v3, "copy");
  -[PBSystemOverlayController presentWithRequest:completion:]( overlayController,  "presentWithRequest:completion:",  v8,  0LL);
}

- (void)_dismiss
{
  v3 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayDismissalRequest);
  BOOL v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[PBMutableSystemOverlayDismissalRequest setIdentifier:](v3, "setIdentifier:", v6);

  -[PBMutableSystemOverlayDismissalRequest setAnimated:](v3, "setAnimated:", 0LL);
  overlayController = self->_overlayController;
  id v8 = -[PBMutableSystemOverlayDismissalRequest copy](v3, "copy");
  -[PBSystemOverlayController dismissWithRequest:completion:]( overlayController,  "dismissWithRequest:completion:",  v8,  0LL);
}

- (void)setSplitViewStashOverlayHintState:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentPresentingViewController);
  [WeakRetained setSplitViewStashOverlayHintState:a3];
}

- (BOOL)acceptsEventFocus
{
  return self->_acceptsEventFocus;
}

- (PBPIPRootViewController)pipRootViewController
{
  return self->_pipRootViewController;
}

- (PBSplitViewControlsViewController)splitViewControlsViewController
{
  return self->_splitViewControlsViewController;
}

- (void).cxx_destruct
{
}

@end