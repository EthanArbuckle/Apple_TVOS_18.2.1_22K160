@interface TVSSHUDVisualizationView
- (TVSSHUDVisualizationView)initWithFrame:(CGRect)a3;
- (void)_updateTitleLabel;
- (void)visualizationDidUpdate;
@end

@implementation TVSSHUDVisualizationView

- (TVSSHUDVisualizationView)initWithFrame:(CGRect)a3
{
  CGRect v11 = a3;
  SEL v9 = a2;
  v10 = 0LL;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSSHUDVisualizationView;
  v10 = -[TVSSHUDVisualizationView initWithFrame:]( &v8,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = v3;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v10->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    id v7 = sub_100006F2C();
    -[UILabel setFont:](v10->_titleLabel, "setFont:");

    -[TVSSHUDVisualizationView addSubview:](v10, "addSubview:", v10->_titleLabel);
    sub_100006F58(v10->_titleLabel);
  }

  v6 = v10;
  objc_storeStrong((id *)&v10, 0LL);
  return v6;
}

- (void)visualizationDidUpdate
{
}

- (void)_updateTitleLabel
{
  v3 = -[TVSSHUDAbstractVisualizationView visualization](self, "visualization");
  v2 = -[TVSSHUDVisualization title](v3, "title");
  -[UILabel setText:](self->_titleLabel, "setText:");

  v5 = -[TVSSHUDAbstractVisualizationView visualization](self, "visualization");
  v4 = -[TVSSHUDVisualization color](v5, "color");
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:");
}

- (void).cxx_destruct
{
}

@end