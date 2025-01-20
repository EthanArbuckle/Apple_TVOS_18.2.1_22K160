@interface AXAuditUIServer
+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3;
- (AXAuditUICursorViewController)cursorViewController;
- (AXAuditUIServer)init;
- (double)desiredWindowLevelForContentViewController:(id)a3 userInteractionEnabled:(BOOL)a4;
- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6;
- (unint64_t)_highlightStyle;
- (void)_handleSetCursorFrameMessage:(id)a3;
- (void)_handleSetCursorFrameStyleMessage:(id)a3;
- (void)_removeCursorViewController;
- (void)dealloc;
- (void)setCursorViewController:(id)a3;
- (void)set_highlightStyle:(unint64_t)a3;
@end

@implementation AXAuditUIServer

- (AXAuditUIServer)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AXAuditUIServer;
  return -[AXAuditUIServer init](&v3, "init");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AXAuditUIServer;
  -[AXAuditUIServer dealloc](&v3, "dealloc");
}

- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  if (a4 == 2)
  {
    -[AXAuditUIServer _handleSetCursorFrameStyleMessage:](self, "_handleSetCursorFrameStyleMessage:", v9);
  }

  else
  {
    if (a4 != 1) {
      abort();
    }
    -[AXAuditUIServer _handleSetCursorFrameMessage:](self, "_handleSetCursorFrameMessage:", v9);
  }

  return 0LL;
}

+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3
{
  return @"com.apple.accessibility.axauditd";
}

- (void)_handleSetCursorFrameStyleMessage:(id)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"frameStyle"]);
  -[AXAuditUIServer set_highlightStyle:](self, "set_highlightStyle:", [v8 integerValue]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditUIServer cursorViewController](self, "cursorViewController"));

  if (v4)
  {
    unint64_t v5 = -[AXAuditUIServer _highlightStyle](self, "_highlightStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditUIServer cursorViewController](self, "cursorViewController"));
    [v6 setHighlightStyle:v5];
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditUIServer cursorViewController](self, "cursorViewController"));
  objc_msgSend(v7, "setHighlightStyle:", objc_msgSend(v8, "integerValue"));
}

- (void)_handleSetCursorFrameMessage:(id)a3
{
  id v22 = a3;
  v4 = (NSString *)objc_claimAutoreleasedReturnValue([v22 objectForKey:@"frame"]);
  unint64_t v5 = v4;
  if (v4)
  {
    CGRect v23 = CGRectFromString(v4);
    double x = v23.origin.x;
    double y = v23.origin.y;
    double width = v23.size.width;
    double height = v23.size.height;
  }

  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }

  uint64_t v10 = objc_claimAutoreleasedReturnValue([v22 objectForKey:@"path"]);
  v11 = (void *)v10;
  if (v10) {
    v12 = (const void *)AX_CGPathCreateWithDataRepresentation(v10);
  }
  else {
    v12 = 0LL;
  }
  v24.origin.double x = CGRectZero.origin.x;
  v24.origin.double y = CGRectZero.origin.y;
  v24.size.double width = CGRectZero.size.width;
  v24.size.double height = CGRectZero.size.height;
  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  BOOL v13 = CGRectEqualToRect(v24, v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditUIServer cursorViewController](self, "cursorViewController"));
  v15 = v14;
  if (v13 && v12 == 0LL)
  {

    if (v15) {
      -[AXAuditUIServer _removeCursorViewController](self, "_removeCursorViewController");
    }
  }

  else
  {

    if (!v15)
    {
      v17 = objc_alloc_init(&OBJC_CLASS___AXAuditUICursorViewController);
      -[AXAuditUIServer setCursorViewController:](self, "setCursorViewController:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditUIServer cursorViewController](self, "cursorViewController"));
      [v18 addContentViewController:v19 withUserInteractionEnabled:0 forService:self];
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditUIServer cursorViewController](self, "cursorViewController"));
    objc_msgSend(v20, "setCursorFrame:", x, y, width, height);
    [v20 setCursorPath:v12];
    objc_msgSend(v20, "setHighlightStyle:", -[AXAuditUIServer _highlightStyle](self, "_highlightStyle"));
    if (v12) {
      CFRelease(v12);
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditUIServer cursorViewController](self, "cursorViewController"));
    [v21 setCursorHidden:0];
  }
}

- (void)_removeCursorViewController
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditUIServer cursorViewController](self, "cursorViewController"));
  [v3 setCursorHidden:1];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditUIServer cursorViewController](self, "cursorViewController"));
  [v4 removeContentViewController:v5 withUserInteractionEnabled:0 forService:self];

  -[AXAuditUIServer setCursorViewController:](self, "setCursorViewController:", 0LL);
}

- (double)desiredWindowLevelForContentViewController:(id)a3 userInteractionEnabled:(BOOL)a4
{
  return 10000013.0;
}

- (AXAuditUICursorViewController)cursorViewController
{
  return self->_cursorViewController;
}

- (void)setCursorViewController:(id)a3
{
}

- (unint64_t)_highlightStyle
{
  return self->__highlightStyle;
}

- (void)set_highlightStyle:(unint64_t)a3
{
  self->__highlightStyle = a3;
}

- (void).cxx_destruct
{
}

@end