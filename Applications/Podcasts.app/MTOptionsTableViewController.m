@interface MTOptionsTableViewController
+ (double)rowHeight;
+ (id)optionFont;
- (MTOptionSetting)option;
- (MTOptionsTableViewController)initWithOption:(id)a3;
- (MTOptionsTableViewController)initWithOption:(id)a3 largeTitleDisplayMode:(int64_t)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)footerText;
- (id)headerText;
- (id)metricsName;
- (id)optionSelectedBlock;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)selectedIndex;
- (void)_updateTextColorForCell:(id)a3 selected:(BOOL)a4;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)setOption:(id)a3;
- (void)setOptionSelectedBlock:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)updateRowHeight;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTOptionsTableViewController

+ (double)rowHeight
{
  id v2 = [(id)objc_opt_class(a1) optionFont];
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  [v3 lineHeight];
  double v5 = v4 + 30.0;

  return v5;
}

+ (id)optionFont
{
  return +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleBody);
}

- (MTOptionsTableViewController)initWithOption:(id)a3
{
  return -[MTOptionsTableViewController initWithOption:largeTitleDisplayMode:]( self,  "initWithOption:largeTitleDisplayMode:",  a3,  0LL);
}

- (MTOptionsTableViewController)initWithOption:(id)a3 largeTitleDisplayMode:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MTOptionsTableViewController;
  v7 = -[MTOptionsTableViewController initWithStyle:](&v11, "initWithStyle:", 1LL);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_option, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:v8 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }

  return v8;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTOptionsTableViewController;
  -[MTOptionsTableViewController viewDidLoad](&v3, "viewDidLoad");
  -[MTOptionsTableViewController updateRowHeight](self, "updateRowHeight");
}

- (void)dealloc
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTOptionsTableViewController;
  -[MTOptionsTableViewController dealloc](&v4, "dealloc");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTOptionsTableViewController;
  id v7 = a4;
  -[MTOptionsTableViewController viewWillTransitionToSize:withTransitionCoordinator:]( &v9,  "viewWillTransitionToSize:withTransitionCoordinator:",  v7,  width,  height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000A85EC;
  v8[3] = &unk_100241C60;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController view](self, "view", a3));
  [v4 setNeedsLayout];

  -[MTOptionsTableViewController updateRowHeight](self, "updateRowHeight");
}

- (void)updateRowHeight
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController tableView](self, "tableView"));
  [(id)objc_opt_class(self) rowHeight];
  objc_msgSend(v3, "setRowHeight:");

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController tableView](self, "tableView"));
  [v4 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1LL;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option", a3, a4));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 options]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 longTitles]);
  id v7 = [v6 count];

  return (int64_t)v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = (MTTableViewCell *)objc_claimAutoreleasedReturnValue([a3 dequeueReusableCellWithIdentifier:@"OptionCell"]);
  if (!v7) {
    id v7 = -[MTTableViewCell initWithStyle:reuseIdentifier:]( objc_alloc(&OBJC_CLASS___MTTableViewCell),  "initWithStyle:reuseIdentifier:",  0LL,  @"OptionCell");
  }
  id v8 = [v6 row];
  BOOL v9 = v8 == (id)-[MTOptionsTableViewController selectedIndex](self, "selectedIndex");
  BOOL v10 = v9;
  if (v9) {
    uint64_t v11 = 3LL;
  }
  else {
    uint64_t v11 = 0LL;
  }
  -[MTTableViewCell setAccessoryType:](v7, "setAccessoryType:", v11);
  -[MTOptionsTableViewController _updateTextColorForCell:selected:](self, "_updateTextColorForCell:selected:", v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell textLabel](v7, "textLabel"));
  id v13 = [(id)objc_opt_class(self) optionFont];
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v12 setFont:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell textLabel](v7, "textLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 options]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 longTitles]);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v6, "row")));
  [v15 setText:v19];

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  double v5 = (MTGenericSettingsFooterLabelView *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController footerText](self, "footerText", a3, a4));

  if (v5)
  {
    double v5 = objc_alloc_init(&OBJC_CLASS___MTGenericSettingsFooterLabelView);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController footerText](self, "footerText"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](v5, "textView"));
    [v7 setAttributedText:v6];
  }

  return v5;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController footerText](self, "footerText", a3, a4));
  if ([v5 length])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 string]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController view](self, "view"));
    [v7 frame];
    CGFloat v8 = CGRectGetWidth(v17) + -64.0;
    NSAttributedStringKey v15 = NSFontAttributeName;
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont sectionFooterFont](&OBJC_CLASS___UIFont, "sectionFooterFont"));
    v16 = v9;
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v10, 0, v8, 1.79769313e308);
    double v12 = v11;

    double v13 = v12 + 16.0;
  }

  else
  {
    double v13 = 16.0;
  }

  return v13;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v10 = a4;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___UITableViewHeaderFooterView);
  if ((objc_opt_isKindOfClass(v10, v6) & 1) != 0)
  {
    id v7 = v10;
    CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController headerText](self, "headerText"));
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v7 textLabel]);

    [v9 setText:v8];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( NSIndexPath,  "indexPathForRow:inSection:",  -[MTOptionsTableViewController selectedIndex](self, "selectedIndex"),  [v6 section]));
  CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue([v15 cellForRowAtIndexPath:v7]);
  [v8 setAccessoryType:0];
  -[MTOptionsTableViewController _updateTextColorForCell:selected:](self, "_updateTextColorForCell:selected:", v8, 0LL);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v15 cellForRowAtIndexPath:v6]);

  [v9 setAccessoryType:3];
  -[MTOptionsTableViewController _updateTextColorForCell:selected:](self, "_updateTextColorForCell:selected:", v9, 1LL);
  [v15 deselectRowAtIndexPath:v6 animated:1];
  optionSelectedBlock = (void (**)(id, id))self->_optionSelectedBlock;
  if (optionSelectedBlock) {
    optionSelectedBlock[2](optionSelectedBlock, [v6 row]);
  }
  double v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "headerViewForSection:", objc_msgSend(v6, "section")));
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___UITableViewHeaderFooterView);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v11 textLabel]);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController headerText](self, "headerText"));
    [v13 setText:v14];
  }
}

- (void)_updateTextColorForCell:(id)a3 selected:(BOOL)a4
{
  id v5 = a3;
  if (a4) {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[UIColor appTintColor](&OBJC_CLASS___UIColor, "appTintColor"));
  }
  else {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[UIColor cellTextColor](&OBJC_CLASS___UIColor, "cellTextColor"));
  }
  id v8 = (id)v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 textLabel]);

  [v7 setTextColor:v8];
}

- (id)footerText
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 footerText]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 options]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 footerCallback]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 options]);
    id v10 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v9 footerCallback]);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 value]);
    id v13 = (id)((uint64_t (**)(void, id))v10)[2]( v10,  [v12 unsignedIntegerValue]);
  }

  return v4;
}

- (id)headerText
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 options]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 headerCallback]);

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 options]);
    id v8 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v7 headerCallback]);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 value]);
    id v11 = (id)((uint64_t (**)(void, id))v8)[2]( v8,  [v10 unsignedIntegerValue]);
  }

  return 0LL;
}

- (unint64_t)selectedIndex
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 options]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 value]);
  id v7 = objc_msgSend(v4, "indexForValue:", objc_msgSend(v6, "unsignedIntegerValue"));

  return (unint64_t)v7;
}

- (id)metricsName
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTOptionsTableViewController option](self, "option"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 headerTitle]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Settings: %@", v3));

  return v4;
}

- (id)optionSelectedBlock
{
  return self->_optionSelectedBlock;
}

- (void)setOptionSelectedBlock:(id)a3
{
}

- (MTOptionSetting)option
{
  return self->_option;
}

- (void)setOption:(id)a3
{
}

- (void).cxx_destruct
{
}

@end