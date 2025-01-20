@interface ZWMenuZoomModeChooserViewController
- (NSArray)zoomModeIdentifiers;
- (ZWMenuZoomModeChooserViewControllerDelegate)delegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setZoomModeIdentifiers:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation ZWMenuZoomModeChooserViewController

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ZWMenuZoomModeChooserViewController;
  id v3 = -[ZWMenuChooserTableViewController loadView](&v7, "loadView");
  uint64_t v4 = AXZoomUserSelectableLensModes(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 array]);
  -[ZWMenuZoomModeChooserViewController setZoomModeIdentifiers:](self, "setZoomModeIdentifiers:", v6);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ZWMenuZoomModeChooserViewController;
  id v6 = a4;
  -[ZWMenuChooserTableViewController tableView:didSelectRowAtIndexPath:]( &v11,  "tableView:didSelectRowAtIndexPath:",  a3,  v6);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuZoomModeChooserViewController delegate](self, "delegate", v11.receiver, v11.super_class));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuZoomModeChooserViewController zoomModeIdentifiers](self, "zoomModeIdentifiers"));
  id v9 = [v6 row];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:v9]);
  [v7 menuZoomModeChooserViewController:self didChooseZoomMode:v10];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuZoomModeChooserViewController zoomModeIdentifiers](self, "zoomModeIdentifiers", a3, a4));
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ZWMenuZoomModeChooserViewController;
  id v6 = a4;
  id v7 = -[ZWMenuChooserTableViewController tableView:cellForRowAtIndexPath:]( &v20,  "tableView:cellForRowAtIndexPath:",  a3,  v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[ZWMenuZoomModeChooserViewController zoomModeIdentifiers]( self,  "zoomModeIdentifiers",  v20.receiver,  v20.super_class));
  id v10 = [v6 row];

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v10]);
  uint64_t v12 = AXUILocalizedTitleForZoomLensMode(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 textLabel]);
  [v14 setText:v13];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 textLabel]);
  [v15 setTextAlignment:4];

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 zoomPreferredCurrentLensMode]);

  else {
    uint64_t v18 = 0LL;
  }
  [v8 setAccessoryType:v18];

  return v8;
}

- (ZWMenuZoomModeChooserViewControllerDelegate)delegate
{
  return (ZWMenuZoomModeChooserViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)zoomModeIdentifiers
{
  return self->_zoomModeIdentifiers;
}

- (void)setZoomModeIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end