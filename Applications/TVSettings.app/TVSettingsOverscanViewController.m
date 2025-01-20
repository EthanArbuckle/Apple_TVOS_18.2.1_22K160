@interface TVSettingsOverscanViewController
- (id)title;
- (void)loadView;
@end

@implementation TVSettingsOverscanViewController

- (void)loadView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v20 = -[TVSettingsOverscanView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVSettingsOverscanView),  "initWithFrame:",  v5,  v7,  v9,  v11);
  uint64_t v12 = TSKLocString(@"AVOverscanScreenTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[TVSettingsOverscanView setTitleText:](v20, "setTitleText:", v13);

  uint64_t v14 = TSKLocString(@"AVOverscanScreenInstructions");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[TVSettingsOverscanView setInstructionText:](v20, "setInstructionText:", v15);

  uint64_t v16 = TSKLocString(@"AVOverscanActionSafe");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[TVSettingsOverscanView setActionSafeText:](v20, "setActionSafeText:", v17);

  uint64_t v18 = TSKLocString(@"AVOverscanFullScreen");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[TVSettingsOverscanView setFullscreenText:](v20, "setFullscreenText:", v19);

  -[TVSettingsOverscanViewController setView:](self, "setView:", v20);
}

- (id)title
{
  return 0LL;
}

@end