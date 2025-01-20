@interface _PBPresentationElementView
- (BOOL)isContainedInVisibleWindow;
- (_PBPresentationElementView)initWithFrame:(CGRect)a3;
- (void)_updateObserversForWindow:(id)a3;
- (void)_updateStateForWindow:(id)a3;
- (void)_windowDidBecomeHidden:(id)a3;
- (void)_windowDidBecomeVisible:(id)a3;
- (void)didMoveToWindow;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _PBPresentationElementView

- (_PBPresentationElementView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____PBPresentationElementView;
  result = -[_PBPresentationElementView initWithFrame:]( &v4,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (result) {
    result->_containedInVisibleWindow = 0;
  }
  return result;
}

- (void)didMoveToWindow
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_PBPresentationElementView window](self, "window"));
  -[_PBPresentationElementView _updateObserversForWindow:](self, "_updateObserversForWindow:", v3);
  -[_PBPresentationElementView _updateStateForWindow:](self, "_updateStateForWindow:", v3);
}

- (void)willMoveToWindow:(id)a3
{
  if (!a3)
  {
    -[_PBPresentationElementView _updateObserversForWindow:](self, "_updateObserversForWindow:");
    -[_PBPresentationElementView _updateStateForWindow:](self, "_updateStateForWindow:", 0LL);
  }

- (void)_windowDidBecomeVisible:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  -[_PBPresentationElementView _updateStateForWindow:](self, "_updateStateForWindow:", v4);
}

- (void)_windowDidBecomeHidden:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  -[_PBPresentationElementView _updateStateForWindow:](self, "_updateStateForWindow:", v4);
}

- (void)_updateObserversForWindow:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self name:UIWindowDidBecomeVisibleNotification object:0];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 removeObserver:self name:UIWindowDidBecomeHiddenNotification object:0];

  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:self selector:"_windowDidBecomeVisible:" name:UIWindowDidBecomeVisibleNotification object:v4];

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:self selector:"_windowDidBecomeHidden:" name:UIWindowDidBecomeHiddenNotification object:v4];
  }
}

- (void)_updateStateForWindow:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4) {
    unsigned int v6 = [v4 isHidden] ^ 1;
  }
  else {
    unsigned int v6 = 0;
  }
  if (self->_containedInVisibleWindow != v6)
  {
    -[_PBPresentationElementView willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"containedInVisibleWindow");
    self->_containedInVisibleWindow = v6;
    -[_PBPresentationElementView didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"containedInVisibleWindow");
  }
}

- (BOOL)isContainedInVisibleWindow
{
  return self->_containedInVisibleWindow;
}

@end