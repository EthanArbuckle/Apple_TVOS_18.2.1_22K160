@interface SCATCursorController
- (CALayer)cursorContainerLayer;
- (SCATCursorController)init;
- (SCATCursorControllerDelegate)delegate;
- (SCATCursorLayer)cursorBackgroundLayer;
- (SCATCursorLayer)cursorCompositingLayer;
- (SCATCursorLayer)cursorForegroundLayer;
- (id)description;
- (void)hide:(BOOL)a3 animate:(BOOL)a4;
- (void)setCursorBackgroundLayer:(id)a3;
- (void)setCursorCompositingLayer:(id)a3;
- (void)setCursorContainerLayer:(id)a3;
- (void)setCursorForegroundLayer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateLevel:(int64_t)a3 animated:(BOOL)a4 options:(int)a5;
- (void)updatePath:(id)a3 frame:(CGRect)a4 isSimpleRect:(BOOL)a5 animated:(BOOL)a6 options:(int)a7;
- (void)updateTheme:(int64_t)a3 animated:(BOOL)a4 options:(int)a5;
- (void)updateTheme:(int64_t)a3 level:(int64_t)a4 path:(id)a5 frame:(CGRect)a6 isSimpleRect:(BOOL)a7 animated:(BOOL)a8 options:(int)a9;
@end

@implementation SCATCursorController

- (SCATCursorController)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SCATCursorController;
  v2 = -[SCATCursorController init](&v18, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___SCATForegroundCursorLayer);
    -[SCATCursorLayer setIsDark:](v3, "setIsDark:", 1LL);
    uint64_t v4 = kCAFilterPlusD;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusD));
    -[SCATForegroundCursorLayer setCompositingFilter:](v3, "setCompositingFilter:", v5);

    -[SCATCursorController setCursorForegroundLayer:](v2, "setCursorForegroundLayer:", v3);
    v6 = objc_alloc_init(&OBJC_CLASS___SCATBackgroundCursorLayer);

    -[SCATCursorLayer setIsDark:](v6, "setIsDark:", 1LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v4));
    -[SCATBackgroundCursorLayer setCompositingFilter:](v6, "setCompositingFilter:", v7);

    -[SCATCursorController setCursorBackgroundLayer:](v2, "setCursorBackgroundLayer:", v6);
    v8 = objc_alloc_init(&OBJC_CLASS___SCATBackgroundCursorLayer);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusL));
    -[SCATBackgroundCursorLayer setCompositingFilter:](v8, "setCompositingFilter:", v9);

    -[SCATCursorController setCursorCompositingLayer:](v2, "setCursorCompositingLayer:", v8);
    v10 = objc_alloc_init(&OBJC_CLASS___CALayer);
    -[CALayer setAllowsGroupBlending:](v10, "setAllowsGroupBlending:", 0LL);
    -[SCATCursorController setCursorContainerLayer:](v2, "setCursorContainerLayer:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorController cursorContainerLayer](v2, "cursorContainerLayer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorController cursorForegroundLayer](v2, "cursorForegroundLayer"));
    [v11 addSublayer:v12];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorController cursorContainerLayer](v2, "cursorContainerLayer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorController cursorBackgroundLayer](v2, "cursorBackgroundLayer"));
    [v13 addSublayer:v14];

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorController cursorContainerLayer](v2, "cursorContainerLayer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorController cursorCompositingLayer](v2, "cursorCompositingLayer"));
    [v15 addSublayer:v16];
  }

  return v2;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorController cursorForegroundLayer](self, "cursorForegroundLayer"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorController cursorBackgroundLayer](self, "cursorBackgroundLayer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SCATCursorController:<%p>. %@. %@",  self,  v3,  v4));

  return v5;
}

- (void)updateTheme:(int64_t)a3 level:(int64_t)a4 path:(id)a5 frame:(CGRect)a6 isSimpleRect:(BOOL)a7 animated:(BOOL)a8 options:(int)a9
{
  uint64_t v9 = *(void *)&a9;
  BOOL v10 = a8;
  BOOL v11 = a7;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v19 = a5;
  -[SCATCursorController updateTheme:animated:options:](self, "updateTheme:animated:options:", a3, v10, v9);
  -[SCATCursorController updateLevel:animated:options:](self, "updateLevel:animated:options:", a4, v10, v9);
  -[SCATCursorController updatePath:frame:isSimpleRect:animated:options:]( self,  "updatePath:frame:isSimpleRect:animated:options:",  v19,  v11,  v10,  v9,  x,  y,  width,  height);
}

- (void)updateTheme:(int64_t)a3 animated:(BOOL)a4 options:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorController cursorBackgroundLayer](self, "cursorBackgroundLayer"));
  [v9 updateTheme:a3 animated:v6 options:v5];

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorController cursorForegroundLayer](self, "cursorForegroundLayer"));
  [v10 updateTheme:a3 animated:v6 options:v5];

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[SCATCursorController cursorCompositingLayer](self, "cursorCompositingLayer"));
  [v11 updateTheme:a3 animated:v6 options:v5];
}

- (void)updateLevel:(int64_t)a3 animated:(BOOL)a4 options:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorController cursorBackgroundLayer](self, "cursorBackgroundLayer"));
  [v9 updateLevel:a3 animated:v6 options:v5];

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorController cursorForegroundLayer](self, "cursorForegroundLayer"));
  [v10 updateLevel:a3 animated:v6 options:v5];

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[SCATCursorController cursorCompositingLayer](self, "cursorCompositingLayer"));
  [v11 updateLevel:a3 animated:v6 options:v5];
}

- (void)updatePath:(id)a3 frame:(CGRect)a4 isSimpleRect:(BOOL)a5 animated:(BOOL)a6 options:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = a3;
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorController cursorContainerLayer](self, "cursorContainerLayer"));
    objc_msgSend(v16, "setFrame:", x, y, width, height);
  }

  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
  double v17 = CGPointZero.y;
  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorController cursorBackgroundLayer](self, "cursorBackgroundLayer"));
  objc_msgSend( v18,  "updatePath:frame:isSimpleRect:animated:options:",  v15,  v9,  v8,  v7,  CGPointZero.x,  v17,  width,  height);

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorController cursorForegroundLayer](self, "cursorForegroundLayer"));
  objc_msgSend( v19,  "updatePath:frame:isSimpleRect:animated:options:",  v15,  v9,  v8,  v7,  CGPointZero.x,  v17,  width,  height);

  id v20 = (id)objc_claimAutoreleasedReturnValue(-[SCATCursorController cursorCompositingLayer](self, "cursorCompositingLayer"));
  objc_msgSend( v20,  "updatePath:frame:isSimpleRect:animated:options:",  v15,  v9,  v8,  v7,  CGPointZero.x,  v17,  width,  height);
}

- (void)hide:(BOOL)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorController cursorForegroundLayer](self, "cursorForegroundLayer"));
  [v7 ensureHidden:v5 animated:v4];

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorController cursorBackgroundLayer](self, "cursorBackgroundLayer"));
  [v8 ensureHidden:v5 animated:v4];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[SCATCursorController cursorCompositingLayer](self, "cursorCompositingLayer"));
  [v9 ensureHidden:v5 animated:v4];
}

- (SCATCursorControllerDelegate)delegate
{
  return (SCATCursorControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SCATCursorLayer)cursorBackgroundLayer
{
  return self->_cursorBackgroundLayer;
}

- (void)setCursorBackgroundLayer:(id)a3
{
}

- (SCATCursorLayer)cursorForegroundLayer
{
  return self->_cursorForegroundLayer;
}

- (void)setCursorForegroundLayer:(id)a3
{
}

- (CALayer)cursorContainerLayer
{
  return self->_cursorContainerLayer;
}

- (void)setCursorContainerLayer:(id)a3
{
}

- (SCATCursorLayer)cursorCompositingLayer
{
  return self->_cursorCompositingLayer;
}

- (void)setCursorCompositingLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end