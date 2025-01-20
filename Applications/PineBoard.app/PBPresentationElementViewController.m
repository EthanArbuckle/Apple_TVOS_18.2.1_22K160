@interface PBPresentationElementViewController
- (BOOL)hasVisibleWindowObserver;
- (BOOL)shouldForwardHIDEvents;
- (NSString)description;
- (NSString)identifier;
- (PBPresentationElementViewController)initWithLayoutLevel:(int64_t)a3;
- (PBPresentationElementViewControllerDelegate)delegate;
- (PBSystemUIPresentable)contentViewController;
- (PBSystemUIPresentable)observedViewController;
- (id)preferredFocusEnvironments;
- (int64_t)layoutLevel;
- (unint64_t)state;
- (void)_addAcceptsEventObserverForViewController:(id)a3;
- (void)_removeAcceptsEventObserverForViewController:(id)a3;
- (void)_updateState;
- (void)dealloc;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setContentViewController:(id)a3 animated:(BOOL)a4 transitionBlock:(id)a5;
- (void)setObservedViewController:(id)a3;
- (void)setShouldForwardHIDEvents:(BOOL)a3;
@end

@implementation PBPresentationElementViewController

- (PBPresentationElementViewController)initWithLayoutLevel:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBPresentationElementViewController;
  result = -[PBPresentationElementViewController initWithNibName:bundle:](&v5, "initWithNibName:bundle:", 0LL, 0LL);
  if (result)
  {
    result->_layoutLevel = a3;
    result->_state = 0LL;
  }

  return result;
}

- (void)loadView
{
  v3 = -[_PBPresentationElementView initWithFrame:]( objc_alloc(&OBJC_CLASS____PBPresentationElementView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[PBPresentationElementViewController setView:](self, "setView:", v3);
  -[_PBPresentationElementView addObserver:forKeyPath:options:context:]( v3,  "addObserver:forKeyPath:options:context:",  self,  @"containedInVisibleWindow",  4LL,  off_10046B100);
  self->_hasVisibleWindowObserver = 1;
}

- (void)dealloc
{
  if (self->_hasVisibleWindowObserver)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPresentationElementViewController view](self, "view"));
    [v3 removeObserver:self forKeyPath:@"containedInVisibleWindow" context:off_10046B100];
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBPresentationElementViewController observedViewController](self, "observedViewController"));
  -[PBPresentationElementViewController _removeAcceptsEventObserverForViewController:]( self,  "_removeAcceptsEventObserverForViewController:",  v4);

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBPresentationElementViewController;
  -[PBPresentationElementViewController dealloc](&v5, "dealloc");
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendInteger:self->_layoutLevel withName:@"layoutLevel"];
  id v5 = [v3 appendInteger:self->_state withName:@"state"];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v6;
}

- (id)preferredFocusEnvironments
{
  if (self->_contentViewController && self->_state == 3)
  {
    contentViewController = self->_contentViewController;
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &contentViewController,  1LL));
  }

  else
  {
    v2 = &__NSArray0__struct;
  }

  return v2;
}

- (void)setContentViewController:(id)a3 animated:(BOOL)a4 transitionBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_100084950();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = self;
    __int16 v25 = 2112;
    id v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ - setContentViewController: %@", buf, 0x16u);
  }

  if (v8)
  {
    v12 = -[_PBSystemUIPresentationTransaction initWithViewController:parentViewController:animated:transitionBlock:]( objc_alloc(&OBJC_CLASS____PBSystemUIPresentationTransaction),  "initWithViewController:parentViewController:animated:transitionBlock:",  v8,  self,  v6,  v9);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000AA704;
    v21[3] = &unk_1003CFEB8;
    v21[4] = self;
    id v22 = v8;
    -[_PBSystemUIPresentationTransaction listenForSatisfiedMilestone:withBlock:]( v12,  "listenForSatisfiedMilestone:withBlock:",  @"ViewController Added",  v21);
    -[_PBSystemUIPresentationTransaction begin](v12, "begin");
  }

  else
  {
    v13 = self->_contentViewController;
    v12 = -[_PBSystemUIDismissalTransaction initWithViewController:parentViewController:animated:transitionBlock:]( objc_alloc(&OBJC_CLASS____PBSystemUIDismissalTransaction),  "initWithViewController:parentViewController:animated:transitionBlock:",  self->_contentViewController,  self,  v6,  v9);
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    v17 = sub_1000AA750;
    v18 = &unk_1003CFEB8;
    v19 = self;
    v20 = v13;
    v14 = v13;
    -[_PBSystemUIPresentationTransaction listenForSatisfiedMilestone:withBlock:]( v12,  "listenForSatisfiedMilestone:withBlock:",  @"ViewController Removed",  &v15);
    -[_PBSystemUIPresentationTransaction begin](v12, "begin", v15, v16, v17, v18, v19);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_10046B108 == a6 || off_10046B100 == a6)
  {
    -[PBPresentationElementViewController _updateState](self, "_updateState");
  }

  else
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___PBPresentationElementViewController;
    -[PBPresentationElementViewController observeValueForKeyPath:ofObject:change:context:]( &v13,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (void)_addAcceptsEventObserverForViewController:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[PBPresentationElementViewController observedViewController](self, "observedViewController"));
  if (v5 != v4)
  {
    -[PBPresentationElementViewController _removeAcceptsEventObserverForViewController:]( self,  "_removeAcceptsEventObserverForViewController:",  v5);
    [v4 addObserver:self forKeyPath:@"acceptsEventFocus" options:4 context:off_10046B108];
    -[PBPresentationElementViewController setObservedViewController:](self, "setObservedViewController:", v4);
  }
}

- (void)_removeAcceptsEventObserverForViewController:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[PBPresentationElementViewController observedViewController](self, "observedViewController"));
  if (v5 == v4)
  {
    [v4 removeObserver:self forKeyPath:@"acceptsEventFocus" context:off_10046B108];
    -[PBPresentationElementViewController setObservedViewController:](self, "setObservedViewController:", 0LL);
  }
}

- (void)_updateState
{
  unint64_t state = self->_state;
  if (self->_contentViewController)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBPresentationElementViewController viewIfLoaded](self, "viewIfLoaded"));
    if ([v4 isContainedInVisibleWindow])
    {
      else {
        unint64_t v5 = 2LL;
      }
    }

    else
    {
      unint64_t v5 = 1LL;
    }
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  if (v5 != state)
  {
    -[PBPresentationElementViewController willChangeValueForKey:](self, "willChangeValueForKey:", @"state");
    self->_unint64_t state = v5;
    -[PBPresentationElementViewController didChangeValueForKey:](self, "didChangeValueForKey:", @"state");
    id v6 = sub_100084158();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412802;
      id v10 = self;
      __int16 v11 = 2048;
      unint64_t v12 = v5;
      __int16 v13 = 2048;
      unint64_t v14 = state;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Element: %@ didTransitionToState: %lu, fromState: %lu",  (uint8_t *)&v9,  0x20u);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBPresentationElementViewController delegate](self, "delegate"));
    [v8 presentationElementViewController:self didTransitionToState:self->_state fromState:state];
  }

- (int64_t)layoutLevel
{
  return self->_layoutLevel;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)state
{
  return self->_state;
}

- (PBPresentationElementViewControllerDelegate)delegate
{
  return (PBPresentationElementViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PBSystemUIPresentable)contentViewController
{
  return self->_contentViewController;
}

- (BOOL)shouldForwardHIDEvents
{
  return self->_shouldForwardHIDEvents;
}

- (void)setShouldForwardHIDEvents:(BOOL)a3
{
  self->_shouldForwardHIDEvents = a3;
}

- (BOOL)hasVisibleWindowObserver
{
  return self->_hasVisibleWindowObserver;
}

- (PBSystemUIPresentable)observedViewController
{
  return (PBSystemUIPresentable *)objc_loadWeakRetained((id *)&self->_observedViewController);
}

- (void)setObservedViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end