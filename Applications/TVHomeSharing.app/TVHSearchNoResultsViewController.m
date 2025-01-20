@interface TVHSearchNoResultsViewController
- (NSString)searchTerm;
- (TVHSearchNoResultsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UILabel)noResultsLabel;
- (void)setNoResultsLabel:(id)a3;
- (void)setSearchTerm:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVHSearchNoResultsViewController

- (TVHSearchNoResultsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVHSearchNoResultsViewController;
  v4 = -[TVHSearchNoResultsViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0LL, 0LL);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___UILabel);
    noResultsLabel = v4->_noResultsLabel;
    v4->_noResultsLabel = v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_noResultsLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v7 = v4->_noResultsLabel;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 13LL));
    -[UILabel setFont:](v7, "setFont:", v8);

    -[UILabel setNumberOfLines:](v4->_noResultsLabel, "setNumberOfLines:", 1LL);
    -[UILabel setTextAlignment:](v4->_noResultsLabel, "setTextAlignment:", 4LL);
    v9 = v4->_noResultsLabel;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_60PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_60PercentBlackColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_90PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_90PercentWhiteColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v10,  v11));
    -[UILabel setTextColor:](v9, "setTextColor:", v12);
  }

  return v4;
}

- (void)setSearchTerm:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"NO_SEARCH_RESULTS_MESSAGE_FORMAT" value:0 table:0]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchNoResultsViewController noResultsLabel](self, "noResultsLabel"));
  [v7 setText:v6];
}

- (NSString)searchTerm
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchNoResultsViewController noResultsLabel](self, "noResultsLabel"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 text]);
  id v4 = v3;
  if (!v3) {
    v3 = &stru_100100278;
  }
  v5 = v3;

  return v5;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVHSearchNoResultsViewController;
  -[TVHSearchNoResultsViewController viewDidLoad](&v15, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchNoResultsViewController view](self, "view"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchNoResultsViewController noResultsLabel](self, "noResultsLabel"));
  [v3 addSubview:v4];
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v4 centerXAnchor]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v3 centerXAnchor]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v13]);
  v16[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 centerYAnchor]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 centerYAnchor]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 constraintEqualToAnchor:v7]);
  v16[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 widthAnchor]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 widthAnchor]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 constraintLessThanOrEqualToAnchor:v10 constant:-40.0]);
  v16[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 3LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v12);
}

- (UILabel)noResultsLabel
{
  return self->_noResultsLabel;
}

- (void)setNoResultsLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end