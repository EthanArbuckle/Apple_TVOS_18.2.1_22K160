@interface VOTUICursorViewController
- (AXUIService)axuiService;
- (BOOL)_canShowWhileLocked;
- (BOOL)cursorHidden;
- (CGPath)cursorPath;
- (CGRect)convertFrameToCursorSpace:(CGRect)a3;
- (CGRect)cursorFrame;
- (VOTUICursorView)cursorView;
- (VOTUICursorViewController)initWithAXUIService:(id)a3;
- (void)_updateCursorFrameAnimated:(BOOL)a3;
- (void)_updateCursorPath;
- (void)dealloc;
- (void)setAxuiService:(id)a3;
- (void)setCursorFrame:(CGRect)a3;
- (void)setCursorFrame:(CGRect)a3 animated:(BOOL)a4;
- (void)setCursorHidden:(BOOL)a3;
- (void)setCursorPath:(CGPath *)a3;
- (void)setCursorView:(id)a3;
- (void)viewDidLoad;
@end

@implementation VOTUICursorViewController

- (VOTUICursorViewController)initWithAXUIService:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VOTUICursorViewController;
  v5 = -[VOTUICursorViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", 0LL, 0LL);
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_axuiService, v4);
  }

  return v6;
}

- (void)dealloc
{
  cursorPath = self->_cursorPath;
  if (cursorPath)
  {
    CFRelease(cursorPath);
    self->_cursorPath = 0LL;
  }

  -[VOTUICursorViewController setCursorView:](self, "setCursorView:", 0LL);
  -[VOTUICursorViewController setView:](self, "setView:", 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VOTUICursorViewController;
  -[VOTUICursorViewController dealloc](&v4, "dealloc");
}

- (void)setCursorFrame:(CGRect)a3 animated:(BOOL)a4
{
  self->_cursorFrame = a3;
  -[VOTUICursorViewController _updateCursorFrameAnimated:](self, "_updateCursorFrameAnimated:", a4);
}

- (void)_updateCursorFrameAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  -[VOTUICursorViewController convertFrameToCursorSpace:]( self,  "convertFrameToCursorSpace:",  self->_cursorFrame.origin.x,  self->_cursorFrame.origin.y,  self->_cursorFrame.size.width,  self->_cursorFrame.size.height);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[VOTUICursorViewController cursorView](self, "cursorView"));
  objc_msgSend(v13, "setCursorFrame:animated:", v3, v6, v8, v10, v12);
}

- (CGRect)convertFrameToCursorSpace:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICursorViewController view](self, "view"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 window]);
  objc_msgSend(v9, "_convertRectFromSceneReferenceSpace:", x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  +[VOTUICursorView resizeFrameForDisplay:](&OBJC_CLASS___VOTUICursorView, "resizeFrameForDisplay:", v11, v13, v15, v17);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICursorViewController cursorView](self, "cursorView"));
  objc_msgSend(v26, "resizeFrameForWindow:", v19, v21, v23, v25);
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICursorViewController view](self, "view"));
  objc_msgSend(v35, "convertRect:fromView:", 0, v28, v30, v32, v34);
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;

  double v44 = v37;
  double v45 = v39;
  double v46 = v41;
  double v47 = v43;
  result.size.double height = v47;
  result.size.double width = v46;
  result.origin.double y = v45;
  result.origin.double x = v44;
  return result;
}

- (void)setCursorPath:(CGPath *)a3
{
  cursorPath = self->_cursorPath;
  if (a3) {
    double v5 = (CGPath *)CFRetain(a3);
  }
  else {
    double v5 = 0LL;
  }
  self->_cursorPath = v5;
  if (cursorPath) {
    CFRelease(cursorPath);
  }
  -[VOTUICursorViewController _updateCursorPath](self, "_updateCursorPath");
}

- (void)_updateCursorPath
{
  if (self->_cursorPath)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithCGPath:](&OBJC_CLASS___UIBezierPath, "bezierPathWithCGPath:"));
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICursorViewController view](self, "view"));
    uint64_t v5 = UIAccessibilitySceneReferencePathToScreenPathWithView(v4, v3);
    id v11 = (id)objc_claimAutoreleasedReturnValue(v5);

    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICursorViewController view](self, "view"));
    uint64_t v7 = UIAccessibilityPathForAccessibilityPath(v6, v11);
    id v8 = objc_claimAutoreleasedReturnValue(v7);
    id v9 = [v8 CGPath];

    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICursorViewController cursorView](self, "cursorView"));
    [v10 setPath:v9];
  }

  else
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[VOTUICursorViewController cursorView](self, "cursorView"));
    [v11 setPath:0];
  }
}

- (BOOL)cursorHidden
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICursorViewController view](self, "view"));
  unsigned __int8 v3 = [v2 isHidden];

  return v3;
}

- (void)setCursorHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[VOTUICursorViewController view](self, "view"));
  [v4 setHidden:v3];
}

- (void)viewDidLoad
{
  BOOL v3 = objc_alloc(&OBJC_CLASS___UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  uint64_t v7 = -[UIView initWithFrame:](v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[VOTUICursorViewController setView:](self, "setView:", v7);

  id v8 = -[VOTUICursorView initWithFrame:]( objc_alloc(&OBJC_CLASS___VOTUICursorView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  -[VOTUICursorViewController setCursorView:](self, "setCursorView:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICursorViewController view](self, "view"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICursorViewController cursorView](self, "cursorView"));
  [v9 addSubview:v10];

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___VOTUICursorViewController;
  -[VOTUICursorViewController viewDidLoad](&v11, "viewDidLoad");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (AXUIService)axuiService
{
  return (AXUIService *)objc_loadWeakRetained((id *)&self->_axuiService);
}

- (void)setAxuiService:(id)a3
{
}

- (VOTUICursorView)cursorView
{
  return self->_cursorView;
}

- (void)setCursorView:(id)a3
{
}

- (CGRect)cursorFrame
{
  double x = self->_cursorFrame.origin.x;
  double y = self->_cursorFrame.origin.y;
  double width = self->_cursorFrame.size.width;
  double height = self->_cursorFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCursorFrame:(CGRect)a3
{
  self->_cursorFrame = a3;
}

- (CGPath)cursorPath
{
  return self->_cursorPath;
}

- (void).cxx_destruct
{
}

@end