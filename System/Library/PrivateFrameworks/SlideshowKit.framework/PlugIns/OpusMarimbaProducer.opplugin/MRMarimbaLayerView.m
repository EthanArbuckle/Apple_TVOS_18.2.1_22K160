@interface MRMarimbaLayerView
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)marimbaInteractivityIsEnabled;
- (MRMarimbaLayer)marimbaLayer;
- (MRMarimbaLayerView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)pinch:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)tap:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation MRMarimbaLayerView

- (MRMarimbaLayerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MRMarimbaLayerView;
  v7 = -[MRMarimbaLayerView initWithFrame:](&v11, "initWithFrame:");
  v8 = v7;
  if (v7)
  {
    -[MRMarimbaLayerView setOpaque:](v7, "setOpaque:", 1LL);
    v9 = objc_alloc_init(&OBJC_CLASS___MRMarimbaLayer);
    v8->_marimbaLayer = v9;
    -[MRMarimbaLayer setOpaque:](v9, "setOpaque:", 1LL);
    objc_msgSend(-[MRMarimbaLayerView layer](v8, "layer"), "addSublayer:", v8->_marimbaLayer);
    -[MRMarimbaLayerView setFrame:](v8, "setFrame:", x, y, width, height);
  }

  return v8;
}

- (void)dealloc
{
  self->_marimbaLayer = 0LL;
  self->_pinchRecognizer = 0LL;

  self->_tapRecognizer = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRMarimbaLayerView;
  -[MRMarimbaLayerView dealloc](&v3, "dealloc");
}

- (void)setFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MRMarimbaLayerView;
  -[MRMarimbaLayerView setFrame:](&v10, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  marimbaLayer = self->_marimbaLayer;
  if (marimbaLayer)
  {
    if (!-[MRMarimbaLayer renderer](marimbaLayer, "renderer")
      || !-[MRRenderer orientation](-[MRMarimbaLayer renderer](self->_marimbaLayer, "renderer"), "orientation"))
    {
      UIInterfaceOrientation v5 = -[UIApplication statusBarOrientation]( +[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"),  "statusBarOrientation");
      v6 = self->_marimbaLayer;
      -[MRMarimbaLayerView bounds](self, "bounds");
      double v8 = v7;
      -[MRMarimbaLayerView bounds](self, "bounds");
      -[MRMarimbaLayer beginMorphingToAspectRatio:andOrientation:withDuration:switchToDocument:]( v6,  "beginMorphingToAspectRatio:andOrientation:withDuration:switchToDocument:",  v5,  0LL,  v8 / v9,  0.0);
      -[MRMarimbaLayer endMorphing](self->_marimbaLayer, "endMorphing");
    }

    -[MRMarimbaLayerView bounds](self, "bounds");
    -[MRMarimbaLayer setFrame:](self->_marimbaLayer, "setFrame:");
  }

- (BOOL)marimbaInteractivityIsEnabled
{
  unsigned int v3 = objc_msgSend(-[MRMarimbaLayerView superview](self, "superview"), "canInteract");
  if (v3) {
    LOBYTE(v3) = -[MRMarimbaLayer interactivityIsEnabled](self->_marimbaLayer, "interactivityIsEnabled");
  }
  return v3;
}

- (void)pinch:(id)a3
{
  if (-[MRMarimbaLayerView marimbaInteractivityIsEnabled](self, "marimbaInteractivityIsEnabled")) {
    objc_msgSend(-[MRMarimbaLayerView superview](self, "superview"), "pinchIn:", a3);
  }
}

- (void)tap:(id)a3
{
  if ([a3 state] == (char *)&dword_0 + 3)
  {
    id v5 = -[MRMarimbaLayerView superview](self, "superview");
    [a3 locationInView:self];
    objc_msgSend(v5, "marimbaWasSingleTappedAtPoint:");
  }

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  unsigned int v5 = objc_msgSend(-[MRMarimbaLayerView superview](self, "superview"), "canInteract");
  if (self->_tapRecognizer != a3)
  {
    if (self->_pinchRecognizer == a3)
    {
      if (!v5) {
        return v5;
      }
      if (!-[MRRenderer currentFocusedSlideAsset]( -[MRMarimbaLayer renderer](self->_marimbaLayer, "renderer"),  "currentFocusedSlideAsset"))
      {
        -[UIPinchGestureRecognizer scale](self->_pinchRecognizer, "scale");
        LOBYTE(v5) = v9 < 1.0;
        return v5;
      }
    }

    else if (!v5 {
           || (uint64_t v7 = objc_opt_class(&OBJC_CLASS___UIPanGestureRecognizer, v6), (objc_opt_isKindOfClass(a3, v7) & 1) == 0)
    }
           || ([a3 velocityInView:self],
               !-[MRRenderer canGoToMoreSlides:]( -[MRMarimbaLayer renderer](self->_marimbaLayer, "renderer"),  "canGoToMoreSlides:",  v8 > 0.0)))
    {
      v11.receiver = self;
      v11.super_class = (Class)&OBJC_CLASS___MRMarimbaLayerView;
      LOBYTE(v5) = -[MRMarimbaLayerView gestureRecognizerShouldBegin:](&v11, "gestureRecognizerShouldBegin:", a3);
      return v5;
    }

    LOBYTE(v5) = 0;
    return v5;
  }

  if (v5) {
    LOBYTE(v5) = objc_msgSend(-[MRMarimbaLayerView superview](self, "superview"), "wantsSingleTap");
  }
  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (objc_msgSend(-[MRMarimbaLayerView superview](self, "superview", a3, a4), "canInteract"))
  {
    touchSet = self->_touchSet;
    if (touchSet)
    {
      uint64_t v7 = -[MRTouchSet updateWithUITouches:inView:](touchSet, "updateWithUITouches:inView:", a3, self);
    }

    else
    {
      double v8 = -[MRTouchSet initWithUITouches:inView:]( objc_alloc(&OBJC_CLASS___MRTouchSet),  "initWithUITouches:inView:",  a3,  self);
      self->_touchSet = v8;
      uint64_t v7 = -[MRTouchSet touches](v8, "touches");
    }

    -[MRMarimbaLayer touchesBegan:](self->_marimbaLayer, "touchesBegan:", v7);
  }

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if (objc_msgSend(-[MRMarimbaLayerView superview](self, "superview", a3, a4), "canInteract")) {
    -[MRMarimbaLayer touchesMoved:]( self->_marimbaLayer,  "touchesMoved:",  -[MRTouchSet updateWithUITouches:inView:](self->_touchSet, "updateWithUITouches:inView:", a3, self));
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if (objc_msgSend(-[MRMarimbaLayerView superview](self, "superview", a3, a4), "canInteract"))
  {
    -[MRMarimbaLayer touchesCancelled:]( self->_marimbaLayer,  "touchesCancelled:",  -[MRTouchSet updateWithUITouches:inView:](self->_touchSet, "updateWithUITouches:inView:", a3, self));
    if (!-[MRTouchSet isActive](self->_touchSet, "isActive"))
    {

      self->_touchSet = 0LL;
    }
  }

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (objc_msgSend(-[MRMarimbaLayerView superview](self, "superview", a3, a4), "canInteract"))
  {
    -[MRMarimbaLayer touchesEnded:]( self->_marimbaLayer,  "touchesEnded:",  -[MRTouchSet updateWithUITouches:inView:](self->_touchSet, "updateWithUITouches:inView:", a3, self));
    if (!-[MRTouchSet isActive](self->_touchSet, "isActive"))
    {

      self->_touchSet = 0LL;
    }
  }

- (MRMarimbaLayer)marimbaLayer
{
  return self->_marimbaLayer;
}

@end