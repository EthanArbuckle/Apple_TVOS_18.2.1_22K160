@interface ZWMenuLensEffectChooserViewController
- (NSArray)lensEffectIdentifiers;
- (ZWMenuLensEffectChooserViewControllerDelegate)delegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setLensEffectIdentifiers:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation ZWMenuLensEffectChooserViewController

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ZWMenuLensEffectChooserViewController;
  id v3 = -[ZWMenuChooserTableViewController loadView](&v7, "loadView");
  uint64_t v4 = AXZoomAllLensEffects(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 array]);
  -[ZWMenuLensEffectChooserViewController setLensEffectIdentifiers:](self, "setLensEffectIdentifiers:", v6);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ZWMenuLensEffectChooserViewController;
  id v6 = a4;
  -[ZWMenuChooserTableViewController tableView:didSelectRowAtIndexPath:]( &v11,  "tableView:didSelectRowAtIndexPath:",  a3,  v6);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuLensEffectChooserViewController delegate](self, "delegate", v11.receiver, v11.super_class));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuLensEffectChooserViewController lensEffectIdentifiers](self, "lensEffectIdentifiers"));
  id v9 = [v6 row];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:v9]);
  [v7 menuLensEffectChooserViewController:self didChooseLensEffect:v10];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuLensEffectChooserViewController lensEffectIdentifiers](self, "lensEffectIdentifiers", a3, a4));
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ZWMenuLensEffectChooserViewController;
  id v6 = a4;
  id v7 = -[ZWMenuChooserTableViewController tableView:cellForRowAtIndexPath:]( &v20,  "tableView:cellForRowAtIndexPath:",  a3,  v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[ZWMenuLensEffectChooserViewController lensEffectIdentifiers]( self,  "lensEffectIdentifiers",  v20.receiver,  v20.super_class));
  id v10 = [v6 row];

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v10]);
  uint64_t v12 = AXUILocalizedTitleForZoomLensEffect(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 textLabel]);
  [v14 setText:v13];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 textLabel]);
  [v15 setTextAlignment:4];

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 zoomCurrentLensEffect]);

  else {
    uint64_t v18 = 0LL;
  }
  [v8 setAccessoryType:v18];

  return v8;
}

- (ZWMenuLensEffectChooserViewControllerDelegate)delegate
{
  return (ZWMenuLensEffectChooserViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)lensEffectIdentifiers
{
  return self->_lensEffectIdentifiers;
}

- (void)setLensEffectIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end