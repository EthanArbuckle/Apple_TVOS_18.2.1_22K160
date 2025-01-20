@interface TVSSSleepTimerContentView
- (CGSize)intrinsicContentSize;
- (TVSSAutoUpdatingSleepTimerGlyphView)glyphView;
- (TVSSSleepTimerContentView)initWithFrame:(CGRect)a3;
- (TVSSVisualContent)content;
- (id)_sleepTimerContent;
- (void)_updateAppearance;
- (void)_updateContent;
- (void)setContent:(id)a3;
@end

@implementation TVSSSleepTimerContentView

- (TVSSSleepTimerContentView)initWithFrame:(CGRect)a3
{
  CGRect v19 = a3;
  SEL v17 = a2;
  p_isa = 0LL;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVSSSleepTimerContentView;
  v15 = -[TVSSSleepTimerContentView initWithFrame:]( &v16,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  p_isa = (id *)&v15->super.super.super.isa;
  objc_storeStrong((id *)&p_isa, v15);
  if (v15)
  {
    id v7 = [p_isa layer];
    [v7 setAllowsGroupBlending:0];

    v3 = objc_alloc_init(&OBJC_CLASS___TVSSAutoUpdatingSleepTimerGlyphView);
    id v4 = p_isa[2];
    p_isa[2] = v3;

    [p_isa[2] setTimerSize:1];
    [p_isa[2] setTranslatesAutoresizingMaskIntoConstraints:0];
    [p_isa addSubview:p_isa[2]];
    id v14 = [p_isa[2] centerXAnchor];
    id v13 = [p_isa centerXAnchor];
    id v12 = objc_msgSend(v14, "constraintEqualToAnchor:");
    v20[0] = v12;
    id v11 = [p_isa[2] centerYAnchor];
    id v10 = [p_isa centerYAnchor];
    id v9 = objc_msgSend(v11, "constraintEqualToAnchor:");
    v20[1] = v9;
    v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    [p_isa _updateAppearance];
  }

  v6 = p_isa;
  objc_storeStrong((id *)&p_isa, 0LL);
  return v6;
}

- (CGSize)intrinsicContentSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

  ;
}

- (void)setContent:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v4->_content != location[0])
  {
    objc_storeStrong((id *)&v4->_content, location[0]);
    -[TVSSSleepTimerContentView _updateContent](v4, "_updateContent");
  }

  objc_storeStrong(location, 0LL);
}

- (id)_sleepTimerContent
{
  content = self->_content;
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___TVSSSleepTimerContent);
  return sub_100013EEC(content, v2);
}

- (void)_updateAppearance
{
  id v10 = self;
  SEL v9 = a2;
  id v4 = -[TVSSSleepTimerContentView traitCollection](self, "traitCollection");
  BOOL v5 = [v4 userInterfaceStyle] == (id)2;

  BOOL v8 = v5;
  if (v5) {
    uint64_t v3 = kCAFilterPlusL;
  }
  else {
    uint64_t v3 = kCAFilterPlusD;
  }
  id v7 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v3);
  v6 = +[TVSSConstants normalMenuItemTextColor](&OBJC_CLASS___TVSSConstants, "normalMenuItemTextColor");
  -[TVSSAutoUpdatingSleepTimerGlyphView setTintColor:](v10->_glyphView, "setTintColor:", v6);
  id v2 = -[TVSSAutoUpdatingSleepTimerGlyphView layer](v10->_glyphView, "layer");
  [v2 setCompositingFilter:v7];

  objc_storeStrong((id *)&v6, 0LL);
  objc_storeStrong((id *)&v7, 0LL);
}

- (void)_updateContent
{
  glyphView = self->_glyphView;
  id v4 = -[TVSSSleepTimerContentView _sleepTimerContent](self, "_sleepTimerContent");
  id v3 = [v4 sleepTimerController];
  -[TVSSAutoUpdatingSleepTimerGlyphView setSleepTimerController:](glyphView, "setSleepTimerController:");
}

- (TVSSVisualContent)content
{
  return self->_content;
}

- (TVSSAutoUpdatingSleepTimerGlyphView)glyphView
{
  return self->_glyphView;
}

- (void).cxx_destruct
{
}

@end