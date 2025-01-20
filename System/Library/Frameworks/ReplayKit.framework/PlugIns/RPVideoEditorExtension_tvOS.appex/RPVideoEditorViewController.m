@interface RPVideoEditorViewController
- (AVPlayer)avPlayer;
- (AVPlayerItem)avPlayerItem;
- (AVPlayerLayer)avPlayerLayer;
- (AVPlayerViewController)avPlayerViewController;
- (AVURLAsset)avAsset;
- (NSString)applicationName;
- (NSString)bundleIdentifier;
- (NSString)overrideShareMessage;
- (NSURL)fileAttachmentURL;
- (NSURL)videoURL;
- (RPVideoEditorViewController)initWithBundleIdentifier:(id)a3 URL:(id)a4 applicationName:(id)a5;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)delegate;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)dealloc;
- (void)dismissPlayerViewController:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setApplicationName:(id)a3;
- (void)setAvAsset:(id)a3;
- (void)setAvPlayer:(id)a3;
- (void)setAvPlayerItem:(id)a3;
- (void)setAvPlayerLayer:(id)a3;
- (void)setAvPlayerViewController:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFileAttachmentURL:(id)a3;
- (void)setOverrideShareMessage:(id)a3;
- (void)setVideoURL:(id)a3;
- (void)viewDidLoad;
@end

@implementation RPVideoEditorViewController

- (RPVideoEditorViewController)initWithBundleIdentifier:(id)a3 URL:(id)a4 applicationName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___RPVideoEditorViewController;
  v11 = -[RPVideoEditorViewController init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[RPVideoEditorViewController setVideoURL:](v11, "setVideoURL:", v9);
    -[RPVideoEditorViewController setApplicationName:](v12, "setApplicationName:", v10);
    -[RPVideoEditorViewController setBundleIdentifier:](v12, "setBundleIdentifier:", v8);
  }

  return v12;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_avPlayer, "currentItem"));
  [v4 removeObserver:self forKeyPath:@"status"];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RPVideoEditorViewController;
  -[RPVideoEditorViewController dealloc](&v5, "dealloc");
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___RPVideoEditorViewController;
  -[RPVideoEditorViewController viewDidLoad](&v14, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPVideoEditorViewController view](self, "view"));
  [v4 setBackgroundColor:v3];

  objc_super v5 = -[AVURLAsset initWithURL:options:]( objc_alloc(&OBJC_CLASS___AVURLAsset),  "initWithURL:options:",  self->_videoURL,  0LL);
  -[RPVideoEditorViewController setAvAsset:](self, "setAvAsset:", v5);

  v6 = objc_alloc(&OBJC_CLASS___AVPlayerItem);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPVideoEditorViewController avAsset](self, "avAsset"));
  id v8 = -[AVPlayerItem initWithAsset:](v6, "initWithAsset:", v7);
  -[RPVideoEditorViewController setAvPlayerItem:](self, "setAvPlayerItem:", v8);

  id v9 = objc_alloc(&OBJC_CLASS___AVPlayer);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPVideoEditorViewController avPlayerItem](self, "avPlayerItem"));
  v11 = -[AVPlayer initWithPlayerItem:](v9, "initWithPlayerItem:", v10);
  -[RPVideoEditorViewController setAvPlayer:](self, "setAvPlayer:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayer currentItem](self->_avPlayer, "currentItem"));
  [v12 addObserver:self forKeyPath:@"status" options:0 context:0];

  v13 = objc_alloc_init(&OBJC_CLASS___AVPlayerViewController);
  -[RPVideoEditorViewController setAvPlayerViewController:](self, "setAvPlayerViewController:", v13);

  -[AVPlayerViewController setDelegate:](self->_avPlayerViewController, "setDelegate:", self);
  -[AVPlayerViewController setPlayer:](self->_avPlayerViewController, "setPlayer:", self->_avPlayer);
  -[AVPlayer play](self->_avPlayer, "play");
  -[AVPlayerViewController setTransitioningDelegate:](self->_avPlayerViewController, "setTransitioningDelegate:", self);
  -[RPVideoEditorViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  self->_avPlayerViewController,  1LL,  0LL);
}

- (void)dismissPlayerViewController:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "dismissPlayerViewController",  buf,  2u);
  }

  -[AVPlayer pause](self->_avPlayer, "pause");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100004828;
  v5[3] = &unk_10000C3E8;
  v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPVideoEditorViewController avPlayer](self, "avPlayer"));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 currentItem]);
  if (v11 == v9)
  {
    unsigned int v12 = [v8 isEqualToString:@"status"];

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPVideoEditorViewController avPlayer](self, "avPlayer"));
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 currentItem]);
      id v15 = [v14 status];

      if (v15 == (id)1)
      {
        -[AVPlayer play](self->_avPlayer, "play");
        dispatch_time_t v16 = dispatch_time(0LL, 500000000LL);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000049DC;
        block[3] = &unk_10000C3E8;
        block[4] = self;
        dispatch_after(v16, &_dispatch_main_q, block);
      }
    }
  }

  else
  {
  }
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return [[_UIProgressiveBlurPresentationAnimator alloc] initForPresenting:1];
}

- (id)animationControllerForDismissedController:(id)a3
{
  return [[_UIProgressiveBlurPresentationAnimator alloc] initForPresenting:0];
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[_UIProgressiveBlurPresentationController alloc] initWithPresentedViewController:v7 presentingViewController:v6];

  return v8;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)fileAttachmentURL
{
  return self->_fileAttachmentURL;
}

- (void)setFileAttachmentURL:(id)a3
{
}

- (NSString)overrideShareMessage
{
  return self->_overrideShareMessage;
}

- (void)setOverrideShareMessage:(id)a3
{
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setVideoURL:(id)a3
{
}

- (AVPlayer)avPlayer
{
  return self->_avPlayer;
}

- (void)setAvPlayer:(id)a3
{
}

- (AVPlayerLayer)avPlayerLayer
{
  return self->_avPlayerLayer;
}

- (void)setAvPlayerLayer:(id)a3
{
}

- (AVPlayerItem)avPlayerItem
{
  return self->_avPlayerItem;
}

- (void)setAvPlayerItem:(id)a3
{
}

- (AVURLAsset)avAsset
{
  return self->_avAsset;
}

- (void)setAvAsset:(id)a3
{
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void)setApplicationName:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (AVPlayerViewController)avPlayerViewController
{
  return self->_avPlayerViewController;
}

- (void)setAvPlayerViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end