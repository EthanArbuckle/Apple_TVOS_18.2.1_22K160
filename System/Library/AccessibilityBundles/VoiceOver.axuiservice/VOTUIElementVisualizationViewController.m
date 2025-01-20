@interface VOTUIElementVisualizationViewController
- (BOOL)_canShowWhileLocked;
- (NSArray)frames;
- (NSArray)labels;
- (NSArray)uiClasses;
- (void)_updateFramesForView;
- (void)didReceiveMemoryWarning;
- (void)setElementFrames:(id)a3 labels:(id)a4 uiClasses:(id)a5;
- (void)setFrames:(id)a3;
- (void)setFramesHidden:(BOOL)a3;
- (void)setLabels:(id)a3;
- (void)setUiClasses:(id)a3;
- (void)viewDidLoad;
@end

@implementation VOTUIElementVisualizationViewController

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___VOTUIElementVisualizationViewController;
  -[VOTUIElementVisualizationViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)setElementFrames:(id)a3 labels:(id)a4 uiClasses:(id)a5
{
  v8 = (NSArray *)a3;
  v9 = (NSArray *)a4;
  v10 = (NSArray *)a5;
  frames = self->_frames;
  self->_frames = v8;
  v12 = v8;

  labels = self->_labels;
  self->_labels = v9;
  v14 = v9;

  uiClasses = self->_uiClasses;
  self->_uiClasses = v10;

  -[VOTUIElementVisualizationViewController _updateFramesForView](self, "_updateFramesForView");
}

- (void)_updateFramesForView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  v4 = self->_frames;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v36;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(v4);
        }
        CGRect v40 = CGRectFromString((NSString *)*(void *)(*((void *)&v35 + 1) + 8LL * (void)v8));
        double x = v40.origin.x;
        double y = v40.origin.y;
        double width = v40.size.width;
        double height = v40.size.height;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIElementVisualizationViewController view](self, "view", (void)v35));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 window]);
        objc_msgSend(v14, "_convertRectFromSceneReferenceSpace:", x, y, width, height);
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIElementVisualizationViewController view](self, "view"));
        objc_msgSend(v23, "convertRect:fromView:", 0, v16, v18, v20, v22);
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        CGFloat v29 = v28;
        CGFloat v31 = v30;

        v41.origin.double x = v25;
        v41.origin.double y = v27;
        v41.size.double width = v29;
        v41.size.double height = v31;
        v32 = NSStringFromCGRect(v41);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        [v3 addObject:v33];

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
    }

    while (v6);
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIElementVisualizationViewController view](self, "view"));
  [v34 setElementFrames:v3 labels:self->_labels uiClasses:self->_uiClasses];
}

- (void)viewDidLoad
{
  v3 = -[VOTUIElementVisualizationView initWithFrame:]( objc_alloc(&OBJC_CLASS___VOTUIElementVisualizationView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[VOTUIElementVisualizationViewController setView:](self, "setView:", v3);

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VOTUIElementVisualizationViewController;
  -[VOTUIElementVisualizationViewController viewDidLoad](&v4, "viewDidLoad");
}

- (void)setFramesHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[VOTUIElementVisualizationViewController view](self, "view"));
  [v4 setHidden:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
}

- (NSArray)uiClasses
{
  return self->_uiClasses;
}

- (void)setUiClasses:(id)a3
{
}

- (void).cxx_destruct
{
}

@end