@interface TVSSHUDView
+ (Class)visualizationClassToViewClass:(Class)a3;
- (NSMapTable)visualizationToView;
- (TVSSHUDView)initWithCoder:(id)a3;
- (TVSSHUDView)initWithFrame:(CGRect)a3;
- (UIStackView)stackView;
- (void)addVisualization:(id)a3;
- (void)removeVisualization:(id)a3;
- (void)setStackView:(id)a3;
- (void)setVisualizationToView:(id)a3;
@end

@implementation TVSSHUDView

+ (Class)visualizationClassToViewClass:(Class)a3
{
  v6 = (dispatch_once_t *)&unk_100221CE0;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B8EC8);
  if (*v6 != -1) {
    dispatch_once(v6, location);
  }
  objc_storeStrong(&location, 0LL);
  return (Class)[(id)qword_100221CD8 objectForKey:a3];
}

- (TVSSHUDView)initWithCoder:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVSSHUDView;
  v8 = -[TVSSHUDView initWithCoder:](&v6, "initWithCoder:", location[0]);
  objc_storeStrong((id *)&v8, v8);
  if (v8) {
    sub_10007D8F8(v8);
  }
  v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (TVSSHUDView)initWithFrame:(CGRect)a3
{
  CGRect v8 = a3;
  SEL v6 = a2;
  v7 = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSSHUDView;
  v7 = -[TVSSHUDView initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v7, v7);
  if (v7) {
    sub_10007D8F8(v7);
  }
  v4 = v7;
  objc_storeStrong((id *)&v7, 0LL);
  return v4;
}

- (void)addVisualization:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  SEL v6 = -[TVSSHUDView visualizationToView](v9, "visualizationToView");
  id v7 = -[NSMapTable objectForKey:](v6, "objectForKey:", location[0]);

  if (!v7)
  {
    v3 = (void *)objc_opt_class(v9);
    id v7 = objc_alloc_init((Class)[v3 visualizationClassToViewClass:objc_opt_class(location[0])]);

    [v7 setVisualization:location[0]];
    v4 = -[TVSSHUDView stackView](v9, "stackView");
    -[UIStackView addArrangedSubview:](v4, "addArrangedSubview:", v7);

    objc_super v5 = -[TVSSHUDView visualizationToView](v9, "visualizationToView");
    -[NSMapTable setObject:forKey:](v5, "setObject:forKey:", v7, location[0]);
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)removeVisualization:(id)a3
{
  CGRect v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_super v5 = -[TVSSHUDView visualizationToView](v8, "visualizationToView");
  id v6 = -[NSMapTable objectForKey:](v5, "objectForKey:", location[0]);

  if (v6)
  {
    v3 = -[TVSSHUDView visualizationToView](v8, "visualizationToView");
    -[NSMapTable removeObjectForKey:](v3, "removeObjectForKey:", location[0]);

    v4 = -[TVSSHUDView stackView](v8, "stackView");
    -[UIStackView removeArrangedSubview:](v4, "removeArrangedSubview:", v6);

    [v6 removeFromSuperview];
  }

  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (NSMapTable)visualizationToView
{
  return self->_visualizationToView;
}

- (void)setVisualizationToView:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end