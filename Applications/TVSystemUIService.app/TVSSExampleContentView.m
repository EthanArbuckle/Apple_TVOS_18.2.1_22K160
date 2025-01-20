@interface TVSSExampleContentView
- (TVSSExampleContentView)initWithFrame:(CGRect)a3;
- (TVSSVisualContent)content;
- (UILabel)label;
- (id)_exampleContent;
- (void)_updateContent;
- (void)setContent:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation TVSSExampleContentView

- (TVSSExampleContentView)initWithFrame:(CGRect)a3
{
  CGRect v25 = a3;
  SEL v23 = a2;
  v24 = 0LL;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVSSExampleContentView;
  v24 = -[TVSSExampleContentView initWithFrame:]( &v22,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v24, v24);
  if (v24)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___UILabel);
    label = v24->_label;
    v24->_label = v3;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v24->_label,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v7 = v24->_label;
    id v8 =  +[UIFont monospacedSystemFontOfSize:weight:]( &OBJC_CLASS___UIFont,  "monospacedSystemFontOfSize:weight:",  18.0,  UIFontWeightRegular);
    -[UILabel setFont:](v7, "setFont:");

    -[TVSSExampleContentView addSubview:](v24, "addSubview:", v24->_label);
    id v21 = -[TVSSExampleContentView leadingAnchor](v24, "leadingAnchor");
    id v20 = -[UILabel leadingAnchor](v24->_label, "leadingAnchor");
    id v19 = objc_msgSend(v21, "constraintEqualToAnchor:");
    v26[0] = v19;
    id v18 = -[TVSSExampleContentView trailingAnchor](v24, "trailingAnchor");
    id v17 = -[UILabel trailingAnchor](v24->_label, "trailingAnchor");
    id v16 = objc_msgSend(v18, "constraintEqualToAnchor:");
    v26[1] = v16;
    id v15 = -[TVSSExampleContentView topAnchor](v24, "topAnchor");
    id v14 = -[UILabel topAnchor](v24->_label, "topAnchor");
    id v13 = objc_msgSend(v15, "constraintEqualToAnchor:");
    v26[2] = v13;
    id v12 = -[TVSSExampleContentView bottomAnchor](v24, "bottomAnchor");
    id v11 = -[UILabel bottomAnchor](v24->_label, "bottomAnchor");
    id v10 = objc_msgSend(v12, "constraintEqualToAnchor:");
    v26[3] = v10;
    v9 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 4LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");
  }

  v6 = v24;
  objc_storeStrong((id *)&v24, 0LL);
  return v6;
}

- (void)setContent:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v4->_content != location[0])
  {
    objc_storeStrong((id *)&v4->_content, location[0]);
    -[TVSSExampleContentView _updateContent](v4, "_updateContent");
  }

  objc_storeStrong(location, 0LL);
}

- (id)_exampleContent
{
  return self->_content;
}

- (void)_updateContent
{
  v9 = self;
  v8[1] = (id)a2;
  v8[0] = -[TVSSExampleContentView _exampleContent](self, "_exampleContent");
  id v7 = [v8[0] name];
  id v6 = [v8[0] counter];
  id v2 = v7;
  v3 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v6);
  v5 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"'%@' - '%@'", v2, v3);

  v4 = -[TVSSExampleContentView label](v9, "label");
  -[UILabel setText:](v4, "setText:", v5);

  objc_storeStrong((id *)&v5, 0LL);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(v8, 0LL);
}

- (TVSSVisualContent)content
{
  return self->_content;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end