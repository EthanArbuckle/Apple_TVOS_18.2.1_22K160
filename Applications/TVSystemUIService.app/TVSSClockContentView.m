@interface TVSSClockContentView
- (TVSSClockContentView)initWithFrame:(CGRect)a3;
- (TVSSVisualContent)content;
- (id)_clockContent;
- (void)setContent:(id)a3;
@end

@implementation TVSSClockContentView

- (TVSSClockContentView)initWithFrame:(CGRect)a3
{
  CGRect v22 = a3;
  SEL v20 = a2;
  v21 = 0LL;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TVSSClockContentView;
  v21 = -[TVSSClockContentView initWithFrame:]( &v19,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v21, v21);
  if (v21)
  {
    v18 = objc_alloc_init(&OBJC_CLASS___TVSSClockView);
    -[TVSSClockView setTranslatesAutoresizingMaskIntoConstraints:]( v18,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSSClockContentView addSubview:](v21, "addSubview:", v18);
    id v17 = -[TVSSClockView leadingAnchor](v18, "leadingAnchor");
    id v16 = -[TVSSClockContentView leadingAnchor](v21, "leadingAnchor");
    id v15 = objc_msgSend(v17, "constraintEqualToAnchor:constant:", 20.0);
    v23[0] = v15;
    id v14 = -[TVSSClockView trailingAnchor](v18, "trailingAnchor");
    id v13 = -[TVSSClockContentView trailingAnchor](v21, "trailingAnchor");
    id v12 = objc_msgSend(v14, "constraintEqualToAnchor:constant:", -8.0);
    v23[1] = v12;
    id v11 = -[TVSSClockView topAnchor](v18, "topAnchor");
    id v10 = -[TVSSClockContentView topAnchor](v21, "topAnchor");
    id v9 = objc_msgSend(v11, "constraintEqualToAnchor:");
    v23[2] = v9;
    id v8 = -[TVSSClockView bottomAnchor](v18, "bottomAnchor");
    id v7 = -[TVSSClockContentView bottomAnchor](v21, "bottomAnchor");
    id v6 = objc_msgSend(v8, "constraintEqualToAnchor:");
    v23[3] = v6;
    v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 4LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    objc_storeStrong((id *)&v18, 0LL);
  }

  v4 = v21;
  objc_storeStrong((id *)&v21, 0LL);
  return v4;
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
    -[TVSSClockContentView _updateContent](v4, "_updateContent");
  }

  objc_storeStrong(location, 0LL);
}

- (id)_clockContent
{
  return self->_content;
}

  ;
}

- (TVSSVisualContent)content
{
  return self->_content;
}

- (void).cxx_destruct
{
}

@end