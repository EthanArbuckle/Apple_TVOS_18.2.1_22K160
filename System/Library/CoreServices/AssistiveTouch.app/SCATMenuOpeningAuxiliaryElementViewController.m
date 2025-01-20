@interface SCATMenuOpeningAuxiliaryElementViewController
- (BOOL)_canShowWhileLocked;
- (SCATMenuOpeningAuxiliaryElementViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SCATMenuOpeningElement)menuOpeningElement;
- (void)setMenuOpeningElement:(id)a3;
- (void)viewDidLoad;
@end

@implementation SCATMenuOpeningAuxiliaryElementViewController

- (SCATMenuOpeningAuxiliaryElementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SCATMenuOpeningAuxiliaryElementViewController;
  v4 = -[SCATMenuOpeningAuxiliaryElementViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = objc_opt_new(&OBJC_CLASS___SCATMenuOpeningElement);
    -[SCATMenuOpeningAuxiliaryElementViewController setMenuOpeningElement:](v4, "setMenuOpeningElement:", v5);
  }

  return v4;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SCATMenuOpeningAuxiliaryElementViewController;
  -[SCATAuxiliaryElementManagerViewController viewDidLoad](&v11, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuOpeningAuxiliaryElementViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuOpeningAuxiliaryElementViewController menuOpeningElement](self, "menuOpeningElement"));
  [v3 addSubview:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 bottomAnchor]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bottomAnchor]);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v5 constraintEqualToAnchor:v6 constant:40.0]);
  [v7 setActive:1];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 trailingAnchor]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 trailingAnchor]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToAnchor:v9 constant:40.0]);
  [v10 setActive:1];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SCATMenuOpeningElement)menuOpeningElement
{
  return *(SCATMenuOpeningElement **)(&self->super._transitioningToOrFromActive + 1);
}

- (void)setMenuOpeningElement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end