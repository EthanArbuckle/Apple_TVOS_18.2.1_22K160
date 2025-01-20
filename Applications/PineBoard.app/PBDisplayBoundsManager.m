@interface PBDisplayBoundsManager
+ ($8C8843CC7FA1D30B6C7680EF9AF852CC)_resolveDisplayBoundsWithSoftwareDisplaySize:(SEL)a3 display:(CGSize)a4 fallbackDisplayBounds:(id)a5;
+ (id)sharedInstance;
- ($8C8843CC7FA1D30B6C7680EF9AF852CC)currentDisplayBounds;
- (id)_init;
- (void)_updateCurrentDisplayBounds;
- (void)beginMonitoringDisplayManager:(id)a3;
- (void)dealloc;
- (void)displayState:(id)a3 didChangeWithConnection:(int64_t)a4;
- (void)setCurrentDisplayBounds:(id *)a3;
@end

@implementation PBDisplayBoundsManager

+ (id)sharedInstance
{
  if (qword_1004714E8 != -1) {
    dispatch_once(&qword_1004714E8, &stru_1003DCD90);
  }
  return (id)qword_1004714E0;
}

- (id)_init
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PBDisplayBoundsManager;
  v2 = -[PBDisplayBoundsManager init](&v21, "init");
  v3 = v2;
  if (v2)
  {
    __int128 v17 = xmmword_1002EC088;
    __int128 v18 = *(_OWORD *)&qword_1002EC098;
    __int128 v19 = xmmword_1002EC088;
    __int128 v20 = *(_OWORD *)&qword_1002EC098;
    p_x = (_OWORD *)&v2->_currentDisplayBounds.bounds.origin.x;
    v5 = (void *)objc_opt_class(v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
    if (v5)
    {
      double v7 = PBSDisplaySize16x9[1];
      v12[0] = v17;
      v12[1] = v18;
      v12[2] = v19;
      v12[3] = v20;
      objc_msgSend( v5,  "_resolveDisplayBoundsWithSoftwareDisplaySize:display:fallbackDisplayBounds:",  v6,  v12,  PBSDisplaySize16x9[0],  v7);
    }

    else
    {
      CGPoint v15 = (CGPoint)0;
      CGSize v16 = (CGSize)0;
      __int128 v13 = 0u;
      CGSize v14 = (CGSize)0;
    }

    CGPoint v9 = v15;
    CGSize v8 = v16;
    CGSize v10 = v14;
    _OWORD *p_x = v13;
    v3->_currentDisplayBounds.bounds.size = v10;
    v3->_currentDisplayBounds.fullDisplayBounds.origin = v9;
    v3->_currentDisplayBounds.fullDisplayBounds.size = v8;
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBDisplayBoundsManager;
  -[PBDisplayBoundsManager dealloc](&v3, "dealloc");
}

- (void)setCurrentDisplayBounds:(id *)a3
{
  CGSize size = self->_currentDisplayBounds.bounds.size;
  v16.CGPoint origin = self->_currentDisplayBounds.bounds.origin;
  v16.CGSize size = size;
  CGSize v6 = self->_currentDisplayBounds.fullDisplayBounds.size;
  CGPoint origin = self->_currentDisplayBounds.fullDisplayBounds.origin;
  CGSize v18 = v6;
  CGSize v7 = a3->var0.size;
  v13.CGPoint origin = a3->var0.origin;
  v13.CGSize size = v7;
  CGSize v8 = a3->var1.size;
  CGPoint v14 = a3->var1.origin;
  CGSize v15 = v8;
  if (!sub_1002006FC(&v16, &v13))
  {
    CGPoint v9 = a3->var0.origin;
    CGSize v10 = a3->var0.size;
    CGSize v11 = a3->var1.size;
    self->_currentDisplayBounds.fullDisplayBounds.CGPoint origin = a3->var1.origin;
    self->_currentDisplayBounds.fullDisplayBounds.CGSize size = v11;
    self->_currentDisplayBounds.bounds.CGPoint origin = v9;
    self->_currentDisplayBounds.bounds.CGSize size = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 postNotificationName:@"PBDisplayBoundsManagerBoundsDidChangeNotification" object:0];
  }

- (void)beginMonitoringDisplayManager:(id)a3
{
  v5 = (PBDisplayManager *)a3;
  if (!v5)
  {
    CGSize v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"displayManager"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100292480(a2);
    }
LABEL_9:
    _bs_set_crash_log_message([v7 UTF8String]);
    __break(0);
    JUMPOUT(0x100200A4CLL);
  }

  if (self->_currentDisplayManager)
  {
    CGSize v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"beginMonitoringDisplayManager should only be called once"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10029252C(a2);
    }
    goto LABEL_9;
  }

  self->_currentDisplayManager = v5;
  CGSize v6 = v5;

  -[PBDisplayManager addStateObserver:](self->_currentDisplayManager, "addStateObserver:", self);
  -[PBDisplayBoundsManager _updateCurrentDisplayBounds](self, "_updateCurrentDisplayBounds");
}

- (void)displayState:(id)a3 didChangeWithConnection:(int64_t)a4
{
}

- (void)_updateCurrentDisplayBounds
{
  currentDisplayManager = self->_currentDisplayManager;
  if (currentDisplayManager)
  {
    -[PBDisplayManager softwareDisplaySize](currentDisplayManager, "softwareDisplaySize");
    double v5 = v4;
    double v7 = v6;
    CGSize v8 = (void *)objc_opt_class(self);
    CGPoint v9 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
    if (v8)
    {
      CGSize size = self->_currentDisplayBounds.bounds.size;
      CGPoint origin = self->_currentDisplayBounds.bounds.origin;
      CGSize v15 = size;
      CGSize v11 = self->_currentDisplayBounds.fullDisplayBounds.size;
      CGPoint v16 = self->_currentDisplayBounds.fullDisplayBounds.origin;
      CGSize v17 = v11;
      objc_msgSend( v8,  "_resolveDisplayBoundsWithSoftwareDisplaySize:display:fallbackDisplayBounds:",  v9,  &origin,  v5,  v7);
    }

    else
    {
      CGPoint v20 = (CGPoint)0;
      CGSize v21 = (CGSize)0;
      CGPoint v18 = (CGPoint)0;
      CGSize v19 = (CGSize)0;
    }

    CGPoint origin = v18;
    CGSize v15 = v19;
    CGPoint v16 = v20;
    CGSize v17 = v21;
    -[PBDisplayBoundsManager setCurrentDisplayBounds:](self, "setCurrentDisplayBounds:", &origin);
  }

  else
  {
    CGRect v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"_updateCurrentDisplayBounds should only be called after beginMonitoringDisplayManager"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002925D8(a2);
    }
    _bs_set_crash_log_message([v13 UTF8String]);
    __break(0);
  }

+ ($8C8843CC7FA1D30B6C7680EF9AF852CC)_resolveDisplayBoundsWithSoftwareDisplaySize:(SEL)a3 display:(CGSize)a4 fallbackDisplayBounds:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a5;
  CGSize size = a6->var0.size;
  retstr->var0.CGPoint origin = a6->var0.origin;
  retstr->var0.CGSize size = size;
  CGSize v12 = a6->var1.size;
  retstr->var1.CGPoint origin = a6->var1.origin;
  retstr->var1.CGSize size = v12;
  if (!PBSDisplaySizeIsAutomatic(width, height))
  {
    CGPoint v20 = CGPointZero;
    retstr->var0.CGPoint origin = (CGPoint)xmmword_1002EC088;
    retstr->var0.CGSize size = *(CGSize *)&qword_1002EC098;
    retstr->var1.CGPoint origin = v20;
    goto LABEL_8;
  }

  [v10 nativeSize];
  if (v14 != CGSizeZero.width || v13 != CGSizeZero.height)
  {
    double v16 = sub_100028EB8(v10);
    double width = v17;
    double height = v18;
    retstr->var0.CGPoint origin = (CGPoint)xmmword_1002EC088;
    retstr->var0.CGSize size = *(CGSize *)&qword_1002EC098;
    retstr->var1.origin.x = v16;
    retstr->var1.origin.y = v19;
LABEL_8:
    retstr->var1.size.double width = width;
    retstr->var1.size.double height = height;
  }

  return result;
}

- ($8C8843CC7FA1D30B6C7680EF9AF852CC)currentDisplayBounds
{
  CGPoint origin = self->var1.origin;
  retstr->var0.CGPoint origin = (CGPoint)self->var0.size;
  retstr->var0.CGSize size = (CGSize)origin;
  CGPoint v4 = self[1].var0.origin;
  retstr->var1.CGPoint origin = (CGPoint)self->var1.size;
  retstr->var1.CGSize size = (CGSize)v4;
  return self;
}

- (void).cxx_destruct
{
}

@end