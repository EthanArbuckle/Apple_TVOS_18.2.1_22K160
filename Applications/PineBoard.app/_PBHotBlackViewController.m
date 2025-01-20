@interface _PBHotBlackViewController
- (void)viewDidLoad;
@end

@implementation _PBHotBlackViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____PBHotBlackViewController;
  -[_PBHotBlackViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_PBHotBlackViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  [v3 setBackgroundColor:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_PBHotBlackViewController view](self, "view"));
  [v5 setUserInteractionEnabled:0];
}

@end