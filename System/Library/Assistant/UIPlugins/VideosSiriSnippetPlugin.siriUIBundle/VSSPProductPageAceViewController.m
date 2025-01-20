@interface VSSPProductPageAceViewController
- (AceObject)aceObject;
- (BOOL)isUtteranceUserInteractionEnabled;
- (NSUUID)viewServiceLifycycleToken;
- (SiriTVUIAceViewControllerDelegate)aceViewControllerDelegate;
- (TVPPlaybackInterruption)interruption;
- (VSSPProductPageAceViewController)initWithContentItem:(id)a3 userDriven:(BOOL)a4 playTrailer:(BOOL)a5;
- (VSSPProductPageDismissalAnimator)dismissalAnimator;
- (VSSPProductPagePresentationAnimator)presentationAnimator;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (void)_sendMetrics:(id)a3;
- (void)dealloc;
- (void)productPageApplicationViewController:(id)a3 sendMetricsWithCategory:(id)a4 info:(id)a5;
- (void)setAceObject:(id)a3;
- (void)setAceViewControllerDelegate:(id)a3;
- (void)setDismissalAnimator:(id)a3;
- (void)setInterruption:(id)a3;
- (void)setPresentationAnimator:(id)a3;
- (void)setUtteranceUserInteractionEnabled:(BOOL)a3;
- (void)setViewServiceLifycycleToken:(id)a3;
- (void)siriDidObscureView;
- (void)siriDidRevealView;
- (void)siriWillDismissViewAnimated:(BOOL)a3;
- (void)siriWillObscureView;
- (void)siriWillRevealView;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation VSSPProductPageAceViewController

- (VSSPProductPageAceViewController)initWithContentItem:(id)a3 userDriven:(BOOL)a4 playTrailer:(BOOL)a5
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___VSSPProductPageAceViewController;
  v5 = -[VSSPProductPageApplicationViewController initWithContentItem:userDriven:playTrailer:]( &v15,  "initWithContentItem:userDriven:playTrailer:",  a3,  a4,  a5);
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    viewServiceLifycycleToken = v5->_viewServiceLifycycleToken;
    v5->_viewServiceLifycycleToken = (NSUUID *)v6;

    v8 = objc_alloc_init(&OBJC_CLASS___TVPPlaybackInterruption);
    interruption = v5->_interruption;
    v5->_interruption = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___VSSPProductPagePresentationAnimator);
    presentationAnimator = v5->_presentationAnimator;
    v5->_presentationAnimator = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___VSSPProductPageDismissalAnimator);
    dismissalAnimator = v5->_dismissalAnimator;
    v5->_dismissalAnimator = v12;

    -[VSSPProductPageAceViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 4LL);
    -[VSSPProductPageAceViewController setTransitioningDelegate:](v5, "setTransitioningDelegate:", v5);
    -[VSSPProductPageApplicationViewController setDelegate:](v5, "setDelegate:", v5);
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VSSPSiriLifecycleObserver sharedInstance](&OBJC_CLASS___VSSPSiriLifecycleObserver, "sharedInstance"));
  [v3 endLifecycle:self->_viewServiceLifycycleToken];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VSSPProductPageAceViewController;
  -[VSSPProductPageAceViewController dealloc](&v4, "dealloc");
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VSSPProductPageAceViewController;
  -[VSSPProductPageAceViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[VSSPSiriLifecycleObserver sharedInstance](&OBJC_CLASS___VSSPSiriLifecycleObserver, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPProductPageAceViewController viewServiceLifycycleToken](self, "viewServiceLifycycleToken"));
  [v4 beginLifecycle:v5];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VSSPProductPageAceViewController;
  -[VSSPProductPageAceViewController viewWillDisappear:](&v6, "viewWillDisappear:", a3);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[VSSPSiriLifecycleObserver sharedInstance](&OBJC_CLASS___VSSPSiriLifecycleObserver, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPProductPageAceViewController viewServiceLifycycleToken](self, "viewServiceLifycycleToken"));
  [v4 endLifecycle:v5];
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return -[VSSPProductPageAceViewController presentationAnimator](self, "presentationAnimator", a3, a4, a5);
}

- (id)animationControllerForDismissedController:(id)a3
{
  return -[VSSPProductPageAceViewController dismissalAnimator](self, "dismissalAnimator", a3);
}

- (void)siriWillObscureView
{
  id v3 = sub_6210();
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    v7 = self;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "VSSPProductPageAceViewController: Will Obscure View for %@",  (uint8_t *)&v6,  0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPProductPageAceViewController interruption](self, "interruption"));
  [v5 interruptionWillBegin];
}

- (void)siriDidObscureView
{
  id v3 = sub_6210();
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    v7 = self;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "VSSPProductPageAceViewController: Did Obscure View for %@",  (uint8_t *)&v6,  0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPProductPageAceViewController interruption](self, "interruption"));
  [v5 interruptionDidBegin];
}

- (void)siriWillRevealView
{
  id v3 = sub_6210();
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    v7 = self;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "VSSPProductPageAceViewController: Will Reveal View for %@",  (uint8_t *)&v6,  0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPProductPageAceViewController interruption](self, "interruption"));
  [v5 interruptionWillEnd];
}

- (void)siriDidRevealView
{
  id v3 = sub_6210();
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    v7 = self;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "VSSPProductPageAceViewController: Did Reveal View for %@",  (uint8_t *)&v6,  0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPProductPageAceViewController interruption](self, "interruption"));
  [v5 interruptionDidEnd];
}

- (void)siriWillDismissViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPProductPageAceViewController presentedViewController](self, "presentedViewController"));

  if (v5) {
    -[VSSPProductPageAceViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  v3,  0LL);
  }
}

- (void)productPageApplicationViewController:(id)a3 sendMetricsWithCategory:(id)a4 info:(id)a5
{
  id v7 = a5;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[SAMetrics metricsForTVMetric:refId:duration:]( &OBJC_CLASS___SAMetrics,  "metricsForTVMetric:refId:duration:",  a4,  0LL,  0LL));
  [v8 setEventInformation:v7];

  -[VSSPProductPageAceViewController _sendMetrics:](self, "_sendMetrics:", v8);
}

- (void)_sendMetrics:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[VSSPProductPageAceViewController aceViewControllerDelegate](self, "aceViewControllerDelegate"));
  [v5 aceViewController:self performAceCommand:v4 conversationItemIdentifier:0 completion:0];
}

- (AceObject)aceObject
{
  return self->_aceObject;
}

- (void)setAceObject:(id)a3
{
}

- (SiriTVUIAceViewControllerDelegate)aceViewControllerDelegate
{
  return (SiriTVUIAceViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_aceViewControllerDelegate);
}

- (void)setAceViewControllerDelegate:(id)a3
{
}

- (BOOL)isUtteranceUserInteractionEnabled
{
  return self->_utteranceUserInteractionEnabled;
}

- (void)setUtteranceUserInteractionEnabled:(BOOL)a3
{
  self->_utteranceUserInteractionEnabled = a3;
}

- (TVPPlaybackInterruption)interruption
{
  return self->_interruption;
}

- (void)setInterruption:(id)a3
{
}

- (VSSPProductPagePresentationAnimator)presentationAnimator
{
  return self->_presentationAnimator;
}

- (void)setPresentationAnimator:(id)a3
{
}

- (VSSPProductPageDismissalAnimator)dismissalAnimator
{
  return self->_dismissalAnimator;
}

- (void)setDismissalAnimator:(id)a3
{
}

- (NSUUID)viewServiceLifycycleToken
{
  return self->_viewServiceLifycycleToken;
}

- (void)setViewServiceLifycycleToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end