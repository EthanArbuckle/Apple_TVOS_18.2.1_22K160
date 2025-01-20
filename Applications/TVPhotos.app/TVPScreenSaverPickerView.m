@interface TVPScreenSaverPickerView
- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4;
- (PHAssetCollection)highlightedAlbum;
- (TVPScreenSaverDataSource)dataSource;
- (TVPScreenSaverPickerView)init;
- (TVPScreenSaverPickerViewDelegate)delegate;
- (UILabel)viewTitle;
- (UITableView)tableView;
- (id)preferredFocusEnvironments;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlightedAlbum:(id)a3;
- (void)setTableView:(id)a3;
- (void)setViewTitle:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)updateDelegate:(id)a3;
@end

@implementation TVPScreenSaverPickerView

- (id)preferredFocusEnvironments
{
  tableView = self->_tableView;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &tableView,  1LL));
}

- (TVPScreenSaverPickerView)init
{
  v80.receiver = self;
  v80.super_class = (Class)&OBJC_CLASS___TVPScreenSaverPickerView;
  v2 = -[TVPScreenSaverPickerView init](&v80, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___TVPScreenSaverDataSource);
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetCollection slideshowCompatibleSubtypes]( &OBJC_CLASS___PHAssetCollection,  "slideshowCompatibleSubtypes"));
    v5 = -[TVPScreenSaverDataSource initWithAllowedCollectionSubtypes:](v3, "initWithAllowedCollectionSubtypes:", v4);
    dataSource = v2->_dataSource;
    v2->_dataSource = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___UITableView);
    tableView = v2->_tableView;
    v2->_tableView = v7;

    v9 = -[UILabel initWithFrame:](objc_alloc(&OBJC_CLASS___UILabel), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
    viewTitle = v2->_viewTitle;
    v2->_viewTitle = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4LL));
    v12 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v11);
    v79 = (void *)objc_claimAutoreleasedReturnValue( +[UIVibrancyEffect effectForBlurEffect:]( &OBJC_CLASS___UIVibrancyEffect,  "effectForBlurEffect:",  v11));
    v13 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v79);
    -[UITableView setDataSource:](v2->_tableView, "setDataSource:", v2->_dataSource);
    -[UITableView setDelegate:](v2->_tableView, "setDelegate:", v2);
    -[UITableView registerClass:forCellReuseIdentifier:]( v2->_tableView,  "registerClass:forCellReuseIdentifier:",  objc_opt_class(&OBJC_CLASS___UITableViewCell, v14),  @"slideshowReuseIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"Screen_Saver_Albums" value:&stru_1000CC6C8 table:0]);
    -[UILabel setText:](v2->_viewTitle, "setText:", v16);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v2->_viewTitle,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle2));
    -[UILabel setFont:](v2->_viewTitle, "setFont:", v17);

    -[UILabel setTextAlignment:](v2->_viewTitle, "setTextAlignment:", 1LL);
    -[TVPScreenSaverPickerView addSubview:](v2, "addSubview:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v12, "contentView"));
    [v18 addSubview:v13];

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v12, "contentView"));
    [v19 addSubview:v2->_tableView];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v13, "contentView"));
    [v20 addSubview:v2->_viewTitle];

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v12,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leftAnchor](v12, "leftAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverPickerView leftAnchor](v2, "leftAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v21 constraintEqualToAnchor:v22]);
    [v23 setActive:1];

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView rightAnchor](v12, "rightAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverPickerView rightAnchor](v2, "rightAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v25]);
    [v26 setActive:1];

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](v12, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverPickerView topAnchor](v2, "topAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v27 constraintEqualToAnchor:v28]);
    [v29 setActive:1];

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](v12, "bottomAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverPickerView bottomAnchor](v2, "bottomAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v30 constraintEqualToAnchor:v31]);
    [v32 setActive:1];

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v13,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leftAnchor](v13, "leftAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v12, "contentView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 leftAnchor]);
    v36 = (void *)objc_claimAutoreleasedReturnValue([v33 constraintEqualToAnchor:v35]);
    [v36 setActive:1];

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView rightAnchor](v13, "rightAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v12, "contentView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v38 rightAnchor]);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v37 constraintEqualToAnchor:v39]);
    [v40 setActive:1];

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](v13, "topAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v12, "contentView"));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v42 topAnchor]);
    v44 = (void *)objc_claimAutoreleasedReturnValue([v41 constraintEqualToAnchor:v43 constant:45.0]);
    [v44 setActive:1];

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView heightAnchor](v13, "heightAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v45 constraintEqualToConstant:125.0]);
    [v46 setActive:1];

    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:]( v2->_tableView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](v2->_tableView, "bottomAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v12, "contentView"));
    v49 = (void *)objc_claimAutoreleasedReturnValue([v48 bottomAnchor]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([v47 constraintEqualToAnchor:v49]);
    [v50 setActive:1];

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leftAnchor](v2->_tableView, "leftAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v12, "contentView"));
    v53 = (void *)objc_claimAutoreleasedReturnValue([v52 leftAnchor]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([v51 constraintEqualToAnchor:v53 constant:100.0]);
    [v54 setActive:1];

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView rightAnchor](v2->_tableView, "rightAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v12, "contentView"));
    v57 = (void *)objc_claimAutoreleasedReturnValue([v56 rightAnchor]);
    v58 = (void *)objc_claimAutoreleasedReturnValue([v55 constraintEqualToAnchor:v57 constant:-100.0]);
    [v58 setActive:1];

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](v2->_tableView, "topAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](v13, "bottomAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue([v59 constraintEqualToAnchor:v60]);
    [v61 setActive:1];

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v2->_viewTitle,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leftAnchor](v2->_viewTitle, "leftAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v13, "contentView"));
    v64 = (void *)objc_claimAutoreleasedReturnValue([v63 leftAnchor]);
    v65 = (void *)objc_claimAutoreleasedReturnValue([v62 constraintEqualToAnchor:v64]);
    [v65 setActive:1];

    v66 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel rightAnchor](v2->_viewTitle, "rightAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v13, "contentView"));
    v68 = (void *)objc_claimAutoreleasedReturnValue([v67 rightAnchor]);
    v69 = (void *)objc_claimAutoreleasedReturnValue([v66 constraintEqualToAnchor:v68]);
    [v69 setActive:1];

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v2->_viewTitle, "topAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v13, "contentView"));
    v72 = (void *)objc_claimAutoreleasedReturnValue([v71 topAnchor]);
    v73 = (void *)objc_claimAutoreleasedReturnValue([v70 constraintEqualToAnchor:v72]);
    [v73 setActive:1];

    v74 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v2->_viewTitle, "bottomAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v13, "contentView"));
    v76 = (void *)objc_claimAutoreleasedReturnValue([v75 bottomAnchor]);
    v77 = (void *)objc_claimAutoreleasedReturnValue([v74 constraintEqualToAnchor:v76]);
    [v77 setActive:1];
  }

  return v2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v22 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  id v9 = [v8 mutableCopy];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverPickerView dataSource](self, "dataSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 selectedIndexPath]);

  if (v11) {
    [v9 addObject:v11];
  }
  -[TVPScreenSaverDataSource setSelectedIndexPath:](self->_dataSource, "setSelectedIndexPath:", v7);
  [v6 reloadRowsAtIndexPaths:v9 withRowAnimation:5];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverDataSource albumForIndexPath:](self->_dataSource, "albumForIndexPath:", v7));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVPScreenSaverDataSource activityFeedAssetCollection]( self->_dataSource,  "activityFeedAssetCollection"));

    if (v12 == v13) {
      uint64_t v14 = @"ActivityFeedCollection";
    }
    else {
      uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
    }
    v15 = v14;
    if (v14)
    {
      v20 = @"CollectionID";
      v21 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverDataSource albumForIndexPath:](self->_dataSource, "albumForIndexPath:", v7));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedTitle]);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[TVScreenSaverProvider sharedInstance](&OBJC_CLASS___TVScreenSaverProvider, "sharedInstance"));
      [v19 setScreenSaverWithName:v18 style:0 extraInfo:v16 showConfirmation:0 completion:0];
    }
  }

  else
  {
    v15 = 0LL;
  }

  [v6 deselectRowAtIndexPath:v7 animated:1];
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v10 = a4;
  debounceTimer = self->_debounceTimer;
  if (debounceTimer) {
    -[NSTimer invalidate](debounceTimer, "invalidate");
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 nextFocusedIndexPath]);
  v8 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "updateDelegate:",  v7,  0LL,  1.0));
  id v9 = self->_debounceTimer;
  self->_debounceTimer = v8;
}

- (void)updateDelegate:(id)a3
{
  dataSource = self->_dataSource;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverDataSource albumForIndexPath:](dataSource, "albumForIndexPath:", v5));
  -[TVPScreenSaverPickerView setHighlightedAlbum:](self, "setHighlightedAlbum:", v6);

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverPickerView delegate](self, "delegate"));
  [v7 highlightedAlbumChanged];
}

- (TVPScreenSaverPickerViewDelegate)delegate
{
  return (TVPScreenSaverPickerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVPScreenSaverDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (PHAssetCollection)highlightedAlbum
{
  return self->_highlightedAlbum;
}

- (void)setHighlightedAlbum:(id)a3
{
}

- (UILabel)viewTitle
{
  return self->_viewTitle;
}

- (void)setViewTitle:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end