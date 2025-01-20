@interface AXAuditUICursorViewController
- (AXAuditUICursorView)cursorView;
- (AXAuditUICursorViewController)initWithAXUIService:(id)a3;
- (AXUIService)axuiService;
- (BOOL)_canShowWhileLocked;
- (CGPath)cursorPath;
- (CGRect)cursorFrame;
- (unint64_t)highlightStyle;
- (void)_updateCursorFrame;
- (void)_updateCursorPath;
- (void)setAxuiService:(id)a3;
- (void)setCursorFrame:(CGRect)a3;
- (void)setCursorHidden:(BOOL)a3;
- (void)setCursorPath:(CGPath *)a3;
- (void)setCursorView:(id)a3;
- (void)setHighlightStyle:(unint64_t)a3;
- (void)viewDidLoad;
@end

@implementation AXAuditUICursorViewController

- (AXAuditUICursorViewController)initWithAXUIService:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AXAuditUICursorViewController;
  result = -[AXAuditUICursorViewController initWithNibName:bundle:](&v5, "initWithNibName:bundle:", 0LL, 0LL);
  if (result) {
    result->_axuiService = (AXUIService *)a3;
  }
  return result;
}

- (void)setHighlightStyle:(unint64_t)a3
{
  self->_highlightStyle = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[AXAuditUICursorViewController cursorView](self, "cursorView"));
  [v4 setHighlightStyle:a3];
}

- (void)setCursorFrame:(CGRect)a3
{
  self->_cursorFrame.origin.x = round(a3.origin.x);
  self->_cursorFrame.origin.y = round(a3.origin.y);
  self->_cursorFrame.size.width = round(a3.size.width);
  self->_cursorFrame.size.height = round(a3.size.height);
  -[AXAuditUICursorViewController _updateCursorFrame](self, "_updateCursorFrame");
}

- (void)_updateCursorFrame
{
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditUICursorViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 window]);
  objc_msgSend(v12, "_convertRectFromSceneReferenceSpace:", v4, v6, v8, v10);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditUICursorViewController cursorView](self, "cursorView"));
  objc_msgSend(v21, "resizeFrameForWindow:", v14, v16, v18, v20);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditUICursorViewController view](self, "view"));
  objc_msgSend(v30, "convertRect:fromView:", 0, v23, v25, v27, v29);
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;

  id v39 = (id)objc_claimAutoreleasedReturnValue(-[AXAuditUICursorViewController cursorView](self, "cursorView"));
  objc_msgSend(v39, "setCursorFrame:", v32, v34, v36, v38);
}

- (void)setCursorPath:(CGPath *)a3
{
  self->_cursorPath = a3;
  -[AXAuditUICursorViewController _updateCursorPath](self, "_updateCursorPath");
}

- (void)_updateCursorPath
{
  if (-[AXAuditUICursorViewController cursorPath](self, "cursorPath"))
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithCGPath:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithCGPath:",  -[AXAuditUICursorViewController cursorPath](self, "cursorPath")));
    uint64_t v4 = UIAccessibilitySceneReferencePathToScreenPath();
    id v10 = (id)objc_claimAutoreleasedReturnValue(v4);

    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditUICursorViewController view](self, "view"));
    uint64_t v6 = UIAccessibilityPathForAccessibilityPath(v5, v10);
    id v7 = objc_claimAutoreleasedReturnValue(v6);
    id v8 = [v7 CGPath];

    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditUICursorViewController cursorView](self, "cursorView"));
    [v9 setPath:v8];
  }

  else
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[AXAuditUICursorViewController cursorView](self, "cursorView"));
    [v10 setPath:0];
  }
}

- (void)setCursorHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[AXAuditUICursorViewController view](self, "view"));
  [v4 setHidden:v3];
}

- (void)viewDidLoad
{
  BOOL v3 = objc_alloc(&OBJC_CLASS___UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = -[UIView initWithFrame:](v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[AXAuditUICursorViewController setView:](self, "setView:", v7);

  id v8 = -[AXAuditUICursorView initWithFrame:]( objc_alloc(&OBJC_CLASS___AXAuditUICursorView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  -[AXAuditUICursorViewController setCursorView:](self, "setCursorView:", v8);

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditUICursorViewController view](self, "view"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditUICursorViewController cursorView](self, "cursorView"));
  [v9 addSubview:v10];

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___AXAuditUICursorViewController;
  -[AXAuditUICursorViewController viewDidLoad](&v11, "viewDidLoad");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (AXUIService)axuiService
{
  return self->_axuiService;
}

- (void)setAxuiService:(id)a3
{
  self->_axuiService = (AXUIService *)a3;
}

- (unint64_t)highlightStyle
{
  return self->_highlightStyle;
}

- (AXAuditUICursorView)cursorView
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

- (CGPath)cursorPath
{
  return self->_cursorPath;
}

- (void).cxx_destruct
{
}

@end