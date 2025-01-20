@interface SCATScrollViewPickerViewController
- (void)loadView;
- (void)willPresentWithDisplayContext:(id)a3 animated:(BOOL)a4;
@end

@implementation SCATScrollViewPickerViewController

- (void)loadView
{
  v5 = objc_alloc_init(&OBJC_CLASS___SCATPromptView);
  id v3 = sub_10002B014(@"CHOOSE_SCROLL_VIEW");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[SCATPromptView setPrompt:](v5, "setPrompt:", v4);

  -[SCATPromptView setAutoresizingMask:](v5, "setAutoresizingMask:", 18LL);
  -[SCATScrollViewPickerViewController setView:](self, "setView:", v5);
}

- (void)willPresentWithDisplayContext:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScrollViewPickerViewController view](self, "view"));
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SCATScrollViewPickerViewController;
  -[SCATElementManagerViewController willPresentWithDisplayContext:animated:]( &v16,  "willPresentWithDisplayContext:animated:",  v6,  v4);
}

@end