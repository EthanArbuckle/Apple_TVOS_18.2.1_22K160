@interface TVMusicLibraryComposersViewController
- (TVMusicLibraryComposersViewController)init;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_handlePlayPause:(id)a3;
- (void)_setColorsForCell:(id)a3 isFocused:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)viewDidLoad;
@end

@implementation TVMusicLibraryComposersViewController

- (TVMusicLibraryComposersViewController)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory composersLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "composersLibraryRequest"));
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMusicLibraryComposersViewController;
  v4 = -[TVMusicTableViewController initWithLibraryRequest:](&v6, "initWithLibraryRequest:", v3);

  if (v4)
  {
    -[TVPreviewTableViewController setBackdropViewMode:](v4, "setBackdropViewMode:", 1LL);
    -[TVPreviewTableViewController setTableViewWidth:](v4, "setTableViewWidth:", 1346.0);
    -[TVPreviewTableViewController setPreviewOnRightSide:](v4, "setPreviewOnRightSide:", 1LL);
    -[TVPreviewTableViewController setBackdropViewMode:](v4, "setBackdropViewMode:", 0LL);
    -[TVPreviewTableViewController setTableViewPadding:](v4, "setTableViewPadding:", 205.0, 90.0, 0.0, 0.0);
  }

  return v4;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TVMusicLibraryComposersViewController;
  -[TVMusicTableViewController viewDidLoad](&v19, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
  [v3 layoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
  objc_msgSend(v10, "setLayoutMargins:", v5, v7, v9, 48.0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
  [v11 setClipsToBounds:0];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
  objc_msgSend( v12,  "registerClass:forCellReuseIdentifier:",  objc_opt_class(_TVMusicLibraryTableViewCell, v13),  @"ComposersCellIdentifier");

  v14 = -[TVInteractionGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___TVInteractionGestureRecognizer),  "initWithTarget:action:",  self,  "_handlePlayPause:");
  -[TVInteractionGestureRecognizer setAllowedPressTypes:](v14, "setAllowedPressTypes:", &off_1002821B0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
  [v15 addGestureRecognizer:v14];

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryTopMenuViewController currentTopMenu]( &OBJC_CLASS___TVMusicLibraryTopMenuViewController,  "currentTopMenu"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 identifierForCurrentlySelectedItem]);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
  [v18 setAccessibilityIdentifier:v17];
}

- (void)_handlePlayPause:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager sharedInstance](&OBJC_CLASS___TVMusicPlayerManager, "sharedInstance", a3));
  id v16 = (id)objc_claimAutoreleasedReturnValue([v4 player]);

  double v5 = (void *)objc_claimAutoreleasedReturnValue([v16 state]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing"));

  if (v5 == v6)
  {
    [v16 pause];
    goto LABEL_10;
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue([v16 state]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[TVPPlaybackState paused](&OBJC_CLASS___TVPPlaybackState, "paused"));
  if (v7 == (void *)v8)
  {
  }

  else
  {
    double v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v16 state]);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));

    if (v10 != v11) {
      goto LABEL_10;
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 indexPathForLastFocusedItem]);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewController mpResults](self, "mpResults"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 itemAtIndexPath:v13]);

  if (v15) {
    +[TVMusicPlaybackHelper playItemType:withMPObject:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playItemType:withMPObject:",  5LL,  v15);
  }

LABEL_10:
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue( [a3 dequeueReusableCellWithIdentifier:@"ComposersCellIdentifier" forIndexPath:v6]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewController mpResults](self, "mpResults"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 itemAtIndexPath:v6]);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 textLabel]);
  [v11 setText:v10];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewController mpResults](self, "mpResults"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 itemAtIndexPath:v5]);

  +[TVMusicLibraryUtilities showPageForComposer:](&OBJC_CLASS___TVMusicLibraryUtilities, "showPageForComposer:", v7);
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVMusicLibraryComposersViewController;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[TVPreviewTableViewController tableView:didUpdateFocusInContext:withAnimationCoordinator:]( &v15,  "tableView:didUpdateFocusInContext:withAnimationCoordinator:",  v10,  v9,  v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "previouslyFocusedIndexPath", v15.receiver, v15.super_class));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 cellForRowAtIndexPath:v11]);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 nextFocusedIndexPath]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 cellForRowAtIndexPath:v13]);

  -[TVMusicLibraryComposersViewController _setColorsForCell:isFocused:withAnimationCoordinator:]( self,  "_setColorsForCell:isFocused:withAnimationCoordinator:",  v12,  0LL,  v8);
  -[TVMusicLibraryComposersViewController _setColorsForCell:isFocused:withAnimationCoordinator:]( self,  "_setColorsForCell:isFocused:withAnimationCoordinator:",  v14,  1LL,  v8);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 81.0;
}

- (void)_setColorsForCell:(id)a3 isFocused:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 foregroundColor]);
    if (v7)
    {
      id v10 = _NSConcreteStackBlock;
      uint64_t v11 = 3221225472LL;
      v12 = sub_100074AFC;
      uint64_t v13 = &unk_100268B30;
      id v14 = v6;
      id v15 = v8;
      [v7 addCoordinatedAnimations:&v10 completion:0];
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 textLabel]);
      [v9 setTextColor:v8];
    }

    objc_msgSend(v6, "setNeedsDisplay", v10, v11, v12, v13);
  }
}

@end