@interface ZWMenuDockPositionChooserViewController
- (NSArray)dockPositionIdentifiers;
- (ZWMenuDockPositionChooserViewControllerDelegate)delegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setDockPositionIdentifiers:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation ZWMenuDockPositionChooserViewController

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ZWMenuDockPositionChooserViewController;
  id v3 = -[ZWMenuChooserTableViewController loadView](&v7, "loadView");
  uint64_t v4 = AXZoomDockPositions(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 array]);
  -[ZWMenuDockPositionChooserViewController setDockPositionIdentifiers:](self, "setDockPositionIdentifiers:", v6);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ZWMenuDockPositionChooserViewController;
  id v6 = a4;
  -[ZWMenuChooserTableViewController tableView:didSelectRowAtIndexPath:]( &v11,  "tableView:didSelectRowAtIndexPath:",  a3,  v6);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuDockPositionChooserViewController delegate](self, "delegate", v11.receiver, v11.super_class));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWMenuDockPositionChooserViewController dockPositionIdentifiers](self, "dockPositionIdentifiers"));
  id v9 = [v6 row];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:v9]);
  [v7 menuDockPositionChooserViewController:self didChooseDockPosition:v10];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[ZWMenuDockPositionChooserViewController dockPositionIdentifiers]( self,  "dockPositionIdentifiers",  a3,  a4));
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ZWMenuDockPositionChooserViewController;
  id v6 = a4;
  id v7 = -[ZWMenuChooserTableViewController tableView:cellForRowAtIndexPath:]( &v20,  "tableView:cellForRowAtIndexPath:",  a3,  v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[ZWMenuDockPositionChooserViewController dockPositionIdentifiers]( self,  "dockPositionIdentifiers",  v20.receiver,  v20.super_class));
  id v10 = [v6 row];

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v10]);
  uint64_t v12 = AXUILocalizedTitleForDockPosition(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 textLabel]);
  [v14 setText:v13];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 textLabel]);
  [v15 setTextAlignment:4];

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 zoomPreferredCurrentDockPosition]);

  else {
    uint64_t v18 = 0LL;
  }
  [v8 setAccessoryType:v18];

  return v8;
}

- (ZWMenuDockPositionChooserViewControllerDelegate)delegate
{
  return (ZWMenuDockPositionChooserViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)dockPositionIdentifiers
{
  return self->_dockPositionIdentifiers;
}

- (void)setDockPositionIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end