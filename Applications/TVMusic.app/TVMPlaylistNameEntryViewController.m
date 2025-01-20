@interface TVMPlaylistNameEntryViewController
- (BOOL)hidePresentingView;
- (TVMPlaylistNameEntryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIButton)doneButton;
- (id)completionBlock;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)_doneButtonAction:(id)a3;
- (void)_textChanged:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setHidePresentingView:(BOOL)a3;
- (void)textEntryControllerDidFinish:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVMPlaylistNameEntryViewController

- (TVMPlaylistNameEntryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVMPlaylistNameEntryViewController;
  v4 = -[TVMPlaylistNameEntryViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[TVMPlaylistNameEntryViewController setTransitioningDelegate:](v4, "setTransitioningDelegate:", v4);
    -[TVMPlaylistNameEntryViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 4LL);
    -[TVMPlaylistNameEntryViewController setOverrideUserInterfaceStyle:](v5, "setOverrideUserInterfaceStyle:", 2LL);
  }

  return v5;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TVMPlaylistNameEntryViewController;
  -[TVMPlaylistNameEntryViewController viewDidLoad](&v19, "viewDidLoad");
  v3 = objc_alloc_init(&OBJC_CLASS___TVTextEntryController);
  textEntryVC = self->_textEntryVC;
  self->_textEntryVC = v3;

  -[TVTextEntryController setOverrideUserInterfaceStyle:](self->_textEntryVC, "setOverrideUserInterfaceStyle:", 2LL);
  -[TVTextEntryController setDelegate:](self->_textEntryVC, "setDelegate:", self);
  v5 = objc_alloc_init(&OBJC_CLASS___TVTextEntryHeaderView);
  v20[0] = NSFontAttributeName;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle3));
  v21[0] = v6;
  v20[1] = NSForegroundColorAttributeName;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](&OBJC_CLASS___UIColor, "systemWhiteColor"));
  v21[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));

  v9 = objc_alloc(&OBJC_CLASS___NSAttributedString);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"PlaylistNameHeading" value:&stru_100279068 table:0]);
  v12 = -[NSAttributedString initWithString:attributes:](v9, "initWithString:attributes:", v11, v8);
  -[TVTextEntryHeaderView setTitle:](v5, "setTitle:", v12);

  -[TVTextEntryController setTopAccessoryView:](self->_textEntryVC, "setTopAccessoryView:", v5);
  v13 = objc_alloc_init(&OBJC_CLASS___TVTextEntryFooterView);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"CreatePlaylistButton" value:&stru_100279068 table:0]);
  [v14 setTitle:v16 forState:0];

  -[TVTextEntryFooterView setSubmitButton:](v13, "setSubmitButton:", v14);
  -[TVTextEntryController setBottomAccessoryView:](self->_textEntryVC, "setBottomAccessoryView:", v13);
  [v14 addTarget:self action:"_doneButtonAction:" forControlEvents:0x2000];
  [v14 setEnabled:0];
  -[TVMPlaylistNameEntryViewController setDoneButton:](self, "setDoneButton:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVTextEntryController textField](self->_textEntryVC, "textField"));
  [v17 addObserver:self selector:"_textChanged:" name:UITextFieldTextDidChangeNotification object:v18];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMPlaylistNameEntryViewController;
  -[TVMPlaylistNameEntryViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  -[TVMPlaylistNameEntryViewController addChildViewController:](self, "addChildViewController:", self->_textEntryVC);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMPlaylistNameEntryViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVTextEntryController view](self->_textEntryVC, "view"));
  [v4 addSubview:v5];

  -[TVTextEntryController didMoveToParentViewController:](self->_textEntryVC, "didMoveToParentViewController:", self);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMPlaylistNameEntryViewController;
  -[TVMPlaylistNameEntryViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  -[TVTextEntryController willMoveToParentViewController:](self->_textEntryVC, "willMoveToParentViewController:", 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVTextEntryController view](self->_textEntryVC, "view"));
  [v4 removeFromSuperview];

  -[TVTextEntryController removeFromParentViewController](self->_textEntryVC, "removeFromParentViewController");
}

- (void)_doneButtonAction:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMPlaylistNameEntryViewController completionBlock](self, "completionBlock", a3));

  if (v4)
  {
    -[TVMPlaylistNameEntryViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  0LL);
    objc_super v7 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue( -[TVMPlaylistNameEntryViewController completionBlock]( self,  "completionBlock"));
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVTextEntryController textField](self->_textEntryVC, "textField"));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 text]);
    v7[2](v7, v6);
  }

- (void)_textChanged:(id)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVTextEntryController textField](self->_textEntryVC, "textField", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v7 text]);
  BOOL v5 = [v4 length] != 0;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMPlaylistNameEntryViewController doneButton](self, "doneButton"));
  [v6 setEnabled:v5];
}

- (void)textEntryControllerDidFinish:(id)a3
{
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[TVMAddToPlaylistPresentationController initWithPresentedViewController:presentingViewController:]( objc_alloc(&OBJC_CLASS___TVMAddToPlaylistPresentationController),  "initWithPresentedViewController:presentingViewController:",  v7,  v6);

  return v8;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (BOOL)hidePresentingView
{
  return self->_hidePresentingView;
}

- (void)setHidePresentingView:(BOOL)a3
{
  self->_hidePresentingView = a3;
}

- (UIButton)doneButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_doneButton);
}

- (void)setDoneButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end