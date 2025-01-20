@interface AXTVSubtitlesAndCaptioningViewController
- (AXTVCaptionCloudView)captionImageView;
- (TSKPreviewViewController)captionPreviewViewController;
- (TSKSettingItem)captionItem;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)setCaptionImageView:(id)a3;
- (void)setCaptionItem:(id)a3;
- (void)setCaptionPreviewViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation AXTVSubtitlesAndCaptioningViewController

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AXTVSubtitlesAndCaptioningViewController;
  -[AXTVSubtitlesAndCaptioningViewController viewDidLoad](&v9, "viewDidLoad");
  +[AXTVCaptionCloudView preferredSize](&OBJC_CLASS___AXTVCaptionCloudView, "preferredSize");
  v5 = -[AXTVCaptionCloudView initWithFrame:]( objc_alloc(&OBJC_CLASS___AXTVCaptionCloudView),  "initWithFrame:",  0.0,  0.0,  v3,  v4);
  -[AXTVSubtitlesAndCaptioningViewController setCaptionImageView:](self, "setCaptionImageView:", v5);

  v6 = objc_alloc_init(&OBJC_CLASS___TSKPreviewViewController);
  -[AXTVSubtitlesAndCaptioningViewController setCaptionPreviewViewController:]( self,  "setCaptionPreviewViewController:",  v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVSubtitlesAndCaptioningViewController captionPreviewViewController]( self,  "captionPreviewViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSubtitlesAndCaptioningViewController captionImageView](self, "captionImageView"));
  [v7 setContentView:v8];
}

- (id)loadSettingGroups
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  id v4 = [[TSKSettingGroup alloc] initWithTitle:0];
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v13 = AXTVLocString(@"AXCaptionsAndSDHTitle", v6, v7, v8, v9, v10, v11, v12, v40);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v22 = AXTVLocString(@"AXCaptionsAndSDHDescription", v15, v16, v17, v18, v19, v20, v21, v40);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v14,  v23,  v3,  @"preferSDHOverRegularSubtitles",  0LL,  0LL));

  [v24 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v5, "addObject:", v24);
  id v32 = AXTVLocString(@"AXCaptionStyleTitle", v25, v26, v27, v28, v29, v30, v31, v40);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  id v34 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v33,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___AXTVCaptionStylesViewController));
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

  [v35 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v5, "addObject:", v35);
  captionItem = self->_captionItem;
  self->_captionItem = (TSKSettingItem *)v35;
  id v37 = v35;

  [v4 setSettingItems:v5];
  uint64_t v40 = (uint64_t)v4;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));

  return v38;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue( -[AXTVSubtitlesAndCaptioningViewController settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  v4));
  if (v5 == self->_captionItem)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedDescriptionForItemInViewController:atIndexPath:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedDescriptionForItemInViewController:atIndexPath:",  self,  v4));

    -[TSKPreviewViewController setDescriptionText:](self->_captionPreviewViewController, "setDescriptionText:", v8);
    uint64_t v7 = self->_captionPreviewViewController;
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___AXTVSubtitlesAndCaptioningViewController;
    id v6 = -[AXTVSubtitlesAndCaptioningViewController previewForItemAtIndexPath:](&v10, "previewForItemAtIndexPath:", v4);
    uint64_t v7 = (TSKPreviewViewController *)objc_claimAutoreleasedReturnValue(v6);
  }

  return v7;
}

- (AXTVCaptionCloudView)captionImageView
{
  return self->_captionImageView;
}

- (void)setCaptionImageView:(id)a3
{
}

- (TSKPreviewViewController)captionPreviewViewController
{
  return self->_captionPreviewViewController;
}

- (void)setCaptionPreviewViewController:(id)a3
{
}

- (TSKSettingItem)captionItem
{
  return self->_captionItem;
}

- (void)setCaptionItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end