@interface MRMarimbaView
- (BOOL)acceptsFirstResponder;
- (BOOL)canInteract;
- (BOOL)isInMarimba;
- (BOOL)usesExitButton;
- (BOOL)wantsSingleTap;
- (CGRect)cleanAperture;
- (MPDocument)document;
- (MRMarimbaLayer)marimbaLayer;
- (MRMarimbaView)initWithCoder:(id)a3;
- (MRMarimbaView)initWithFrame:(CGRect)a3;
- (MRMarimbaViewInteractionDelegate)interactionDelegate;
- (double)aspectRatio;
- (double)marimbaContentsScale;
- (void)_marimbaViewCommonInit;
- (void)cleanup;
- (void)close:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)enterMarimbaWithDuration:(double)a3 andCompletionBlock:(id)a4;
- (void)exitMarimbaWithDuration:(double)a3 location:(CGPoint)a4 andScale:(double)a5;
- (void)hideHUD;
- (void)marimbaWasSingleTappedAtPoint:(CGPoint)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)pinchIn:(id)a3;
- (void)setAspectRatio:(double)a3;
- (void)setDocument:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setMarimbaContentsScale:(double)a3;
- (void)setUsesExitButton:(BOOL)a3;
- (void)showHUD;
- (void)stop;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)warmupAndPlay:(BOOL)a3 completionBlock:(id)a4;
@end

@implementation MRMarimbaView

- (MRMarimbaView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRMarimbaView;
  v3 = -[MRMarimbaView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    -[MRMarimbaView _marimbaViewCommonInit](v3, "_marimbaViewCommonInit");
  }
  return v4;
}

- (MRMarimbaView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRMarimbaView;
  v3 = -[MRMarimbaView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    -[MRMarimbaView _marimbaViewCommonInit](v3, "_marimbaViewCommonInit");
  }
  return v4;
}

- (void)dealloc
{
  if (self->_marimbaLayer) {
    -[MRMarimbaView cleanup](self, "cleanup");
  }
  objc_storeWeak((id *)&self->_interactionDelegate, 0LL);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRMarimbaView;
  -[MRMarimbaView dealloc](&v3, "dealloc");
}

- (void)_marimbaViewCommonInit
{
  v7 = -[MRMarimbaLayerView initWithFrame:]( objc_alloc(&OBJC_CLASS___MRMarimbaLayerView),  "initWithFrame:",  v3,  v4,  v5,  v6);
  self->_marimbaLayerView = v7;
  -[MRMarimbaLayerView setAutoresizingMask:](v7, "setAutoresizingMask:", 18LL);
  -[MRMarimbaView addSubview:](self, "addSubview:", self->_marimbaLayerView);
  -[MRMarimbaLayerView addObserver:forKeyPath:options:context:]( self->_marimbaLayerView,  "addObserver:forKeyPath:options:context:",  self,  @"frame",  0LL,  0LL);
  self->_marimbaLayer = -[MRMarimbaLayerView marimbaLayer](self->_marimbaLayerView, "marimbaLayer");
  -[MRMarimbaView setMultipleTouchEnabled:](self, "setMultipleTouchEnabled:", 1LL);
  -[MRMarimbaLayerView setMultipleTouchEnabled:](self->_marimbaLayerView, "setMultipleTouchEnabled:", 1LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ([a3 isEqualToString:@"frame"])
  {
    -[MRMarimbaView willChangeValueForKey:](self, "willChangeValueForKey:", @"cleanAperture");
    -[MRMarimbaView didChangeValueForKey:](self, "didChangeValueForKey:", @"cleanAperture");
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___MRMarimbaView;
    -[MRMarimbaView observeValueForKeyPath:ofObject:change:context:]( &v11,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5,  a6);
  }

- (BOOL)acceptsFirstResponder
{
  return 1;
}

- (MRMarimbaViewInteractionDelegate)interactionDelegate
{
  return (MRMarimbaViewInteractionDelegate *)objc_loadWeak((id *)&self->_interactionDelegate);
}

- (void)setInteractionDelegate:(id)a3
{
}

- (void)didMoveToWindow
{
  if (-[MRMarimbaView window](self, "window"))
  {
    objc_msgSend(objc_msgSend(-[MRMarimbaView window](self, "window"), "screen"), "scale");
    -[MRMarimbaView setMarimbaContentsScale:](self, "setMarimbaContentsScale:");
    double v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v3,  "addObserver:selector:name:object:",  self,  "stop",  kMRNotificationPlaybackOver[0],  0LL);
  }

  else
  {
    -[MRMarimbaLayer pause](self->_marimbaLayer, "pause");
    double v4 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter removeObserver:name:object:]( v4,  "removeObserver:name:object:",  self,  kMRNotificationPlaybackOver[0],  0LL);
  }

- (void)cleanup
{
  double v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  self,  kMRNotificationPlaybackOver[0],  0LL);
  -[MRMarimbaLayer pause](self->_marimbaLayer, "pause");
  -[MRMarimbaLayer cleanup](self->_marimbaLayer, "cleanup");

  self->_marimbaLayer = 0LL;
  -[MRMarimbaLayerView removeObserver:forKeyPath:]( self->_marimbaLayerView,  "removeObserver:forKeyPath:",  self,  @"frame");

  self->_marimbaLayerView = 0LL;
  self->_orderedVideoPaths = 0LL;
}

- (void)setUsesExitButton:(BOOL)a3
{
  if (self->_usesExitButton != a3)
  {
    self->_usesExitButton = a3;
    if (a3)
    {
      double v4 = +[UIImage imageWithContentsOfFile:]( &OBJC_CLASS___UIImage,  "imageWithContentsOfFile:",  -[NSBundle pathForResource:ofType:]( +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"),  "pathForResource:ofType:",  @"slideshow_exit",  @"png"));
      double v5 = +[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 0LL);
      self->_exitButton = v5;
      -[UIButton setBackgroundImage:forState:](v5, "setBackgroundImage:forState:", v4, 0LL);
      -[UIButton setFrame:](self->_exitButton, "setFrame:", 0.0, 0.0, 32.0, 32.0);
      -[UIButton addTarget:action:forControlEvents:]( self->_exitButton,  "addTarget:action:forControlEvents:",  self,  "close:",  1LL);
      -[MRMarimbaView insertSubview:aboveSubview:]( self,  "insertSubview:aboveSubview:",  self->_exitButton,  self->_marimbaLayerView);
      -[UIButton setHidden:](self->_exitButton, "setHidden:", 1LL);
      -[UIButton setAlpha:](self->_exitButton, "setAlpha:", 0.0);
    }

    else
    {
      -[UIButton removeFromSuperview](self->_exitButton, "removeFromSuperview");
      self->_exitButton = 0LL;
    }
  }

- (void)warmupAndPlay:(BOOL)a3 completionBlock:(id)a4
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_6CB30;
  block[3] = &unk_24DEA0;
  BOOL v9 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(global_queue, block);
}

- (void)pause
{
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRMarimbaView;
  -[MRMarimbaView setFrame:](&v4, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[MRMarimbaView setAspectRatio:](self, "setAspectRatio:", self->_aspectRatio);
}

- (void)setAspectRatio:(double)a3
{
  self->_aspectRatio = a3;
  -[MRMarimbaView bounds](self, "bounds");
  if (a3 > 0.0) {
    double v5 = RectToFitInRect(v5, v6, v7, v8, self->_aspectRatio);
  }
  -[MRMarimbaLayerView setFrame:](self->_marimbaLayerView, "setFrame:", round(v5), round(v6), round(v7), round(v8));
}

- (CGRect)cleanAperture
{
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)enterMarimbaWithDuration:(double)a3 andCompletionBlock:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_6CDCC;
  v4[3] = &unk_24DEC8;
  v4[4] = self;
  v4[5] = a4;
  sub_6CDCC((uint64_t)v4);
}

- (void)exitMarimbaWithDuration:(double)a3 location:(CGPoint)a4 andScale:(double)a5
{
  self->_isInMarimba = 0;
  self->_isEnteringExitingMarimba = 0;
  -[MRMarimbaView close:](self, "close:", self, a3, a4.x, a4.y, a5);
}

- (void)stop
{
  if (self->_isInMarimba && !self->_isEnteringExitingMarimba)
  {
    -[MRMarimbaView bounds](self, "bounds");
    double v4 = v3 * 0.5;
    -[MRMarimbaView bounds](self, "bounds");
    -[MRMarimbaView exitMarimbaWithDuration:location:andScale:]( self,  "exitMarimbaWithDuration:location:andScale:",  0.5,  v4,  v5 * 0.5,  0.0);
  }

- (void)close:(id)a3
{
}

- (void)pinchIn:(id)a3
{
}

- (BOOL)canInteract
{
  if ((objc_opt_respondsToSelector( -[MRMarimbaView interactionDelegate](self, "interactionDelegate"),  "marimbaViewCanInteract:") & 1) != 0) {
    return -[MRMarimbaViewInteractionDelegate marimbaViewCanInteract:]( -[MRMarimbaView interactionDelegate](self, "interactionDelegate"),  "marimbaViewCanInteract:",  self);
  }
  else {
    return 1;
  }
}

- (BOOL)wantsSingleTap
{
  return -[MRMarimbaView interactionDelegate](self, "interactionDelegate") || self->_usesExitButton;
}

- (void)marimbaWasSingleTappedAtPoint:(CGPoint)a3
{
  double x = a3.x;
  -[MRMarimbaView bounds](self, "bounds", a3.x, a3.y);
  if (x <= v5 * 0.95)
  {
    -[MRMarimbaView bounds](self, "bounds");
    if (x >= v6 * 0.05)
    {
      if (-[MRMarimbaView interactionDelegate](self, "interactionDelegate"))
      {
        if ((objc_opt_respondsToSelector( -[MRMarimbaView interactionDelegate](self, "interactionDelegate"),  "slideshowWasTapped") & 1) != 0) {
          -[MRMarimbaViewInteractionDelegate slideshowWasTapped]( -[MRMarimbaView interactionDelegate](self, "interactionDelegate"),  "slideshowWasTapped");
        }
      }

      else
      {
        -[MRMarimbaView showHUD](self, "showHUD");
      }
    }

    else
    {
      -[MRRenderer jumpToPreviousMarker]( -[MRMarimbaLayer renderer](self->_marimbaLayer, "renderer"),  "jumpToPreviousMarker");
    }
  }

  else
  {
    -[MRRenderer jumpToNextMarker](-[MRMarimbaLayer renderer](self->_marimbaLayer, "renderer"), "jumpToNextMarker");
  }

- (void)showHUD
{
  if (self->_isInMarimba)
  {
    ++self->_hudShowCount;
    if (self->_usesExitButton)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_6D29C;
      v5[3] = &unk_24D5B0;
      v5[4] = self;
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v5, 0.5);
    }

    dispatch_time_t v3 = dispatch_time(0LL, 4000000000LL);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_6D2DC;
    v4[3] = &unk_24D5B0;
    v4[4] = self;
    dispatch_after(v3, &_dispatch_main_q, v4);
  }

- (void)hideHUD
{
  if (self->_isInMarimba)
  {
    unint64_t v2 = self->_hudShowCount - 1;
    self->_hudShowCount = v2;
    if (!v2 && self->_usesExitButton)
    {
      v3[4] = self;
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472LL;
      v4[2] = sub_6D39C;
      v4[3] = &unk_24D5B0;
      v4[4] = self;
      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472LL;
      v3[2] = sub_6D3B4;
      v3[3] = &unk_24DEF0;
      +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v4,  v3,  0.5);
    }
  }

- (MPDocument)document
{
  return -[MRMarimbaLayer document](self->_marimbaLayer, "document");
}

- (void)setDocument:(id)a3
{
  orderedVideoPaths = self->_orderedVideoPaths;
  if (orderedVideoPaths) {

  }
  self->_orderedVideoPaths = (NSArray *)[a3 orderedVideoPaths];
}

- (double)marimbaContentsScale
{
  return result;
}

- (void)setMarimbaContentsScale:(double)a3
{
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (self->_isInMarimba) {
    -[MRMarimbaLayerView touchesBegan:withEvent:](self->_marimbaLayerView, "touchesBegan:withEvent:", a3, a4);
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if (self->_isInMarimba) {
    -[MRMarimbaLayerView touchesMoved:withEvent:](self->_marimbaLayerView, "touchesMoved:withEvent:", a3, a4);
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if (self->_isInMarimba) {
    -[MRMarimbaLayerView touchesCancelled:withEvent:](self->_marimbaLayerView, "touchesCancelled:withEvent:", a3, a4);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (self->_isInMarimba) {
    -[MRMarimbaLayerView touchesEnded:withEvent:](self->_marimbaLayerView, "touchesEnded:withEvent:", a3, a4);
  }
}

- (MRMarimbaLayer)marimbaLayer
{
  return self->_marimbaLayer;
}

- (BOOL)isInMarimba
{
  return self->_isInMarimba;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (BOOL)usesExitButton
{
  return self->_usesExitButton;
}

@end