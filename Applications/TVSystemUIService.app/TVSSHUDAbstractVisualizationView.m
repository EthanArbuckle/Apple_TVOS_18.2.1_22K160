@interface TVSSHUDAbstractVisualizationView
- (TVSSHUDVisualization)visualization;
- (void)setVisualization:(id)a3;
- (void)visualizationDidChange:(id)a3;
@end

@implementation TVSSHUDAbstractVisualizationView

- (void)setVisualization:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v4->_visualization != location[0])
  {
    objc_storeStrong((id *)&v4->_visualization, location[0]);
    -[TVSSHUDVisualization setDelegate:](v4->_visualization, "setDelegate:", v4);
    -[TVSSHUDAbstractVisualizationView visualizationDidUpdate](v4, "visualizationDidUpdate");
  }

  objc_storeStrong(location, 0LL);
}

  ;
}

- (void)visualizationDidChange:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSHUDAbstractVisualizationView visualizationDidUpdate](v4, "visualizationDidUpdate");
  objc_storeStrong(location, 0LL);
}

- (TVSSHUDVisualization)visualization
{
  return self->_visualization;
}

- (void).cxx_destruct
{
}

@end