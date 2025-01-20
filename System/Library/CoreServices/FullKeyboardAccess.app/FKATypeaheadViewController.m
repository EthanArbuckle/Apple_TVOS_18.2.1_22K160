@interface FKATypeaheadViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)requiresNativeFocus;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (FKATypeaheadViewControllerDelegate)delegate;
- (NSString)cachedTypeaheadString;
- (NSString)queryString;
- (NSTimer)clearCachedTypeaheadStringTimer;
- (unint64_t)state;
- (void)dealloc;
- (void)loadView;
- (void)sendDidChangeQueryString:(id)a3;
- (void)setCachedTypeaheadString:(id)a3;
- (void)setClearCachedTypeaheadStringTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startTypeaheadStringClearCacheTimer;
- (void)toggleTypeaheadState;
@end

@implementation FKATypeaheadViewController

- (void)loadView
{
  v3 = objc_opt_new(&OBJC_CLASS___UIView);
  -[FKATypeaheadViewController setView:](self, "setView:", v3);
}

- (BOOL)requiresNativeFocus
{
  return -[FKATypeaheadViewController state](self, "state") != 0;
}

- (void)toggleTypeaheadState
{
  unint64_t v3 = -[FKATypeaheadViewController state](self, "state");
  if (v3)
  {
    if (v3 != 1) {
      return;
    }
    uint64_t v4 = 0LL;
  }

  else
  {
    uint64_t v4 = 1LL;
  }

  -[FKATypeaheadViewController setState:](self, "setState:", v4);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  id v10 = a3;
  unsigned int v11 = [v9 isEqualToString:@"\n"];
  if (v11)
  {
    [v10 setText:0];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FKATypeaheadViewController delegate](self, "delegate"));
    [v12 typeaheadViewControllerDidTypeReturn:self];
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v10 text]);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", location, length, v9));
    -[FKATypeaheadViewController sendDidChangeQueryString:](self, "sendDidChangeQueryString:", v12);
  }

  return v11 ^ 1;
}

- (void)sendDidChangeQueryString:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[FKATypeaheadViewController delegate](self, "delegate"));
  [v5 typeaheadViewController:self didChangeQueryString:v4];
}

- (NSString)queryString
{
  return (NSString *)&stru_100020B80;
}

- (void)startTypeaheadStringClearCacheTimer
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKATypeaheadViewController clearCachedTypeaheadStringTimer](self, "clearCachedTypeaheadStringTimer"));
  if (v3)
  {
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[FKATypeaheadViewController cachedTypeaheadString](self, "cachedTypeaheadString"));
    id v5 = [v4 length];

    if (v5)
    {
      objc_initWeak(&location, self);
      v7 = _NSConcreteStackBlock;
      uint64_t v8 = 3221225472LL;
      id v9 = sub_10000AD90;
      id v10 = &unk_1000208A0;
      objc_copyWeak(&v11, &location);
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  &v7,  30.0));
      -[FKATypeaheadViewController setClearCachedTypeaheadStringTimer:]( self,  "setClearCachedTypeaheadStringTimer:",  v6,  v7,  v8,  v9,  v10);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }

- (void)dealloc
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKATypeaheadViewController clearCachedTypeaheadStringTimer](self, "clearCachedTypeaheadStringTimer"));
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___FKATypeaheadViewController;
  -[FKATypeaheadViewController dealloc](&v4, "dealloc");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)state
{
  return self->_state;
}

- (FKATypeaheadViewControllerDelegate)delegate
{
  return (FKATypeaheadViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)cachedTypeaheadString
{
  return self->_cachedTypeaheadString;
}

- (void)setCachedTypeaheadString:(id)a3
{
}

- (NSTimer)clearCachedTypeaheadStringTimer
{
  return self->_clearCachedTypeaheadStringTimer;
}

- (void)setClearCachedTypeaheadStringTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end