@interface TVSSHUDValueHistoryVisualizationView
- (TVSSHUDValueHistoryVisualizationView)initWithFrame:(CGRect)a3;
- (void)_updateTitleAndValueLabel;
- (void)visualizationDidUpdate;
@end

@implementation TVSSHUDValueHistoryVisualizationView

- (TVSSHUDValueHistoryVisualizationView)initWithFrame:(CGRect)a3
{
  CGRect v11 = a3;
  SEL v9 = a2;
  v10 = 0LL;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSSHUDValueHistoryVisualizationView;
  v10 = -[TVSSHUDValueHistoryVisualizationView initWithFrame:]( &v8,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleAndValueLabel = v10->_titleAndValueLabel;
    v10->_titleAndValueLabel = v3;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v10->_titleAndValueLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    id v7 = sub_100006F2C();
    -[UILabel setFont:](v10->_titleAndValueLabel, "setFont:");

    -[TVSSHUDValueHistoryVisualizationView addSubview:](v10, "addSubview:", v10->_titleAndValueLabel);
    sub_100006F58(v10->_titleAndValueLabel);
  }

  v6 = v10;
  objc_storeStrong((id *)&v10, 0LL);
  return v6;
}

- (void)visualizationDidUpdate
{
}

- (void)_updateTitleAndValueLabel
{
  v10 = self;
  v9[1] = (id)a2;
  v3 = -[TVSSHUDAbstractVisualizationView visualization](self, "visualization");
  id v2 = -[TVSSHUDVisualization values](v3, "values");
  v9[0] = [v2 componentsJoinedByString:@" <- "];

  v6 = -[TVSSHUDAbstractVisualizationView visualization](v10, "visualization");
  v5 = -[TVSSHUDVisualization title](v6, "title");
  v4 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: %@", v5, v9[0]);
  -[UILabel setText:](v10->_titleAndValueLabel, "setText:");

  objc_super v8 = -[TVSSHUDAbstractVisualizationView visualization](v10, "visualization");
  id v7 = -[TVSSHUDVisualization color](v8, "color");
  -[UILabel setTextColor:](v10->_titleAndValueLabel, "setTextColor:");

  objc_storeStrong(v9, 0LL);
}

- (void).cxx_destruct
{
}

@end