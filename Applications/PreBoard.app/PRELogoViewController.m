@interface PRELogoViewController
- (void)didReceiveMemoryWarning;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation PRELogoViewController

- (void)loadView
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"Logo"));
  v3 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v4);
  -[UIImageView setContentMode:](v3, "setContentMode:", 4LL);
  -[PRELogoViewController setView:](self, "setView:", v3);
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___PRELogoViewController;
  -[PRELogoViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___PRELogoViewController;
  -[PRELogoViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

@end