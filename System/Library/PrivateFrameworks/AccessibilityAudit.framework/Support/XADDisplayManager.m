@interface XADDisplayManager
+ (id)sharedManager;
- (AXUIClient)_uiClient;
- (BOOL)_forceRefreshOnNextUpdate;
- (BOOL)_shouldHideCursor;
- (CGPath)_currentCursorPath;
- (CGRect)_currentCursorFrame;
- (NSLock)_lock;
- (XADDisplayManager)init;
- (unsigned)_currentCursorContextID;
- (void)dealloc;
- (void)hideVisualsSynchronously;
- (void)setCursorFrame:(CGRect)a3 withPath:(CGPath *)a4 withContextId:(unsigned int)a5 element:(id)a6 forceRefresh:(BOOL)a7;
- (void)setCursorFrameForElement:(id)a3;
- (void)setCursorStyle:(unint64_t)a3;
- (void)set_currentCursorContextID:(unsigned int)a3;
- (void)set_currentCursorFrame:(CGRect)a3;
- (void)set_currentCursorPath:(CGPath *)a3;
- (void)set_forceRefreshOnNextUpdate:(BOOL)a3;
- (void)set_lock:(id)a3;
- (void)set_shouldHideCursor:(BOOL)a3;
- (void)set_uiClient:(id)a3;
@end

@implementation XADDisplayManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000078A0;
  block[3] = &unk_100014868;
  block[4] = a1;
  if (qword_10001A2D8 != -1) {
    dispatch_once(&qword_10001A2D8, block);
  }
  return (id)qword_10001A2D0;
}

- (XADDisplayManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___XADDisplayManager;
  v2 = -[XADDisplayManager init](&v8, "init");
  if (v2)
  {
    v3 = -[AXUIClient initWithIdentifier:serviceBundleName:]( objc_alloc(&OBJC_CLASS___AXUIClient),  "initWithIdentifier:serviceBundleName:",  @"AXAuditAXUIClientIdentifier",  @"AXAuditAXUIService");
    uiClient = v2->__uiClient;
    v2->__uiClient = v3;

    -[AXUIClient setDelegate:](v2->__uiClient, "setDelegate:", v2);
    v5 = objc_opt_new(&OBJC_CLASS___NSLock);
    lock = v2->__lock;
    v2->__lock = v5;
  }

  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___XADDisplayManager;
  -[XADDisplayManager dealloc](&v2, "dealloc");
}

- (void)setCursorStyle:(unint64_t)a3
{
  v7 = @"frameStyle";
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  objc_super v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[XADDisplayManager _uiClient](self, "_uiClient"));
  [v6 sendAsynchronousMessage:v5 withIdentifier:2 targetAccessQueue:0 completion:0];

  -[XADDisplayManager set_forceRefreshOnNextUpdate:](self, "set_forceRefreshOnNextUpdate:", 1LL);
}

- (void)setCursorFrame:(CGRect)a3 withPath:(CGPath *)a4 withContextId:(unsigned int)a5 element:(id)a6 forceRefresh:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGFloat v15 = CGRectZero.origin.y;
  CGFloat v16 = CGRectZero.size.width;
  CGFloat v17 = CGRectZero.size.height;
  v48.origin.double x = CGRectZero.origin.x;
  v48.origin.double y = v15;
  v48.size.double width = v16;
  v48.size.double height = v17;
  v53.origin.double x = x;
  v53.origin.double y = y;
  v53.size.double width = width;
  v53.size.double height = height;
  if (!CGRectEqualToRect(v48, v53))
  {
    -[XADDisplayManager _adjustFrameToFitScreen:](self, "_adjustFrameToFitScreen:", x, y, width, height);
    double x = v18;
    double y = v19;
    double width = v20;
    double height = v21;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[XADDisplayManager _lock](self, "_lock"));
  [v22 lock];

  if (v7) {
    goto LABEL_4;
  }
  -[XADDisplayManager _currentCursorFrame](self, "_currentCursorFrame");
  v54.origin.double x = v28;
  v54.origin.double y = v29;
  v54.size.double width = v30;
  v54.size.double height = v31;
  v50.origin.double x = x;
  v50.origin.double y = y;
  v50.size.double width = width;
  v50.size.double height = height;
  BOOL v32 = CGRectEqualToRect(v50, v54);
  if (a4 || !v32)
  {
LABEL_4:
    -[XADDisplayManager set_currentCursorFrame:](self, "set_currentCursorFrame:", x, y, width, height);
    -[XADDisplayManager set_currentCursorContextID:](self, "set_currentCursorContextID:", v8);
    -[XADDisplayManager set_currentCursorPath:](self, "set_currentCursorPath:", a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[XADDisplayManager _lock](self, "_lock"));
    [v23 unlock];

    if (-[XADDisplayManager _shouldHideCursor](self, "_shouldHideCursor"))
    {
      v46 = @"frame";
      v49.origin.double x = CGRectZero.origin.x;
      v49.origin.double y = v15;
      v49.size.double width = v16;
      v49.size.double height = v17;
      v24 = NSStringFromRect(v49);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v47 = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[XADDisplayManager _uiClient](self, "_uiClient"));
      [v27 sendAsynchronousMessage:v26 withIdentifier:1 targetAccessQueue:0 completion:0];
    }

    else
    {
      if (a4 && (uint64_t v33 = AX_CGPathCopyDataRepresentation(a4)) != 0)
      {
        v34 = (const void *)v33;
        v44[0] = @"frame";
        v51.origin.double x = x;
        v51.origin.double y = y;
        v51.size.double width = width;
        v51.size.double height = height;
        v35 = NSStringFromRect(v51);
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        v44[1] = @"path";
        v45[0] = v36;
        v45[1] = v34;
        v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  2LL));

        CFRelease(v34);
      }

      else
      {
        v42 = @"frame";
        v52.origin.double x = x;
        v52.origin.double y = y;
        v52.size.double width = width;
        v52.size.double height = height;
        v38 = NSStringFromRect(v52);
        v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        v43 = v39;
        v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
      }

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[XADDisplayManager _uiClient](self, "_uiClient"));
      [v40 sendAsynchronousMessage:v37 withIdentifier:1 targetAccessQueue:0 completion:0];
    }
  }

  else
  {
    id v41 = (id)objc_claimAutoreleasedReturnValue(-[XADDisplayManager _lock](self, "_lock"));
    [v41 unlock];
  }

- (void)hideVisualsSynchronously
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  dispatch_time_t v4 = dispatch_time(0LL, 10000000000LL);
  v12 = @"frame";
  v14.origin.double x = CGRectZero.origin.x;
  v14.origin.double y = CGRectZero.origin.y;
  v14.size.double width = CGRectZero.size.width;
  v14.size.double height = CGRectZero.size.height;
  v5 = NSStringFromRect(v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v13 = v6;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[XADDisplayManager _uiClient](self, "_uiClient"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100007F30;
  v10[3] = &unk_100014AB0;
  dispatch_semaphore_t v11 = v3;
  v9 = v3;
  [v8 sendAsynchronousMessage:v7 withIdentifier:1 targetAccessQueue:0 completion:v10];

  dispatch_semaphore_wait(v9, v4);
}

- (void)setCursorFrameForElement:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 clearCachedFrame:1 cachedVisibleFrame:1];
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uiElement]);
    [v6 updateCache:2003];

    if ([v5 path])
    {
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v5 uiElement]);
      [v7 updateCache:2042];
    }

    [v5 frame];
    double x = v8;
    double y = v10;
    double width = v12;
    double height = v14;
  }

  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }

  id v16 = v5;
  CGFloat v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uiElement]);
  double v18 = (void *)objc_claimAutoreleasedReturnValue([v17 numberWithAXAttribute:2021]);
  id v19 = [v18 unsignedIntValue];

  if (!(_DWORD)v19)
  {
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v16 elementForAttribute:5002]);
    if (v20)
    {
      double v21 = (void *)v20;
      do
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 uiElement]);
        v23 = (void *)objc_claimAutoreleasedReturnValue([v22 numberWithAXAttribute:2021]);
        id v19 = [v23 unsignedIntValue];

        if ((_DWORD)v19) {
          break;
        }
        uint64_t v24 = objc_claimAutoreleasedReturnValue([v21 elementForAttribute:5002]);

        double v21 = (void *)v24;
      }

      while (v24);
    }

    else
    {
      id v19 = 0LL;
    }
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v16 uiElement]);
  unsigned int v26 = [v25 BOOLWithAXAttribute:2098];

  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
    double valuePtr = x;
    double v33 = y;
    double v34 = width;
    double v35 = height;
    AXValueRef v28 = AXValueCreate(kAXValueTypeCGRect, &valuePtr);
    CGFloat v29 = (void *)objc_claimAutoreleasedReturnValue([v27 uiElement]);
    CGFloat v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v19));
    CGFloat v31 = (const __AXValue *)objc_msgSend( v29,  "objectWithAXAttribute:parameter:",  91505,  +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v28, v30, 0));

    if (v31) {
      AXValueGetValue(v31, kAXValueTypeCGRect, &valuePtr);
    }
    if (v28) {
      CFRelease(v28);
    }
    double x = valuePtr;
    double y = v33;
    double width = v34;
    double height = v35;
  }

  -[XADDisplayManager setCursorFrame:withPath:withContextId:element:forceRefresh:]( self,  "setCursorFrame:withPath:withContextId:element:forceRefresh:",  [v16 path],  v19,  v16,  -[XADDisplayManager _forceRefreshOnNextUpdate](self, "_forceRefreshOnNextUpdate"),  x,  y,  width,  height);
  -[XADDisplayManager set_forceRefreshOnNextUpdate:](self, "set_forceRefreshOnNextUpdate:", 0LL);
}

- (NSLock)_lock
{
  return self->__lock;
}

- (void)set_lock:(id)a3
{
}

- (AXUIClient)_uiClient
{
  return self->__uiClient;
}

- (void)set_uiClient:(id)a3
{
}

- (BOOL)_shouldHideCursor
{
  return self->__shouldHideCursor;
}

- (void)set_shouldHideCursor:(BOOL)a3
{
  self->__shouldHideCursor = a3;
}

- (CGRect)_currentCursorFrame
{
  double x = self->__currentCursorFrame.origin.x;
  double y = self->__currentCursorFrame.origin.y;
  double width = self->__currentCursorFrame.size.width;
  double height = self->__currentCursorFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)set_currentCursorFrame:(CGRect)a3
{
  self->__currentCursorFrame = a3;
}

- (CGPath)_currentCursorPath
{
  return self->__currentCursorPath;
}

- (void)set_currentCursorPath:(CGPath *)a3
{
}

- (unsigned)_currentCursorContextID
{
  return self->__currentCursorContextID;
}

- (void)set_currentCursorContextID:(unsigned int)a3
{
  self->__currentCursorContextID = a3;
}

- (BOOL)_forceRefreshOnNextUpdate
{
  return self->__forceRefreshOnNextUpdate;
}

- (void)set_forceRefreshOnNextUpdate:(BOOL)a3
{
  self->__forceRefreshOnNextUpdate = a3;
}

- (void).cxx_destruct
{
}

@end