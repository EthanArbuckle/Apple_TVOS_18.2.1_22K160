@interface BKBootUIOverlayVendor
+ (id)sharedInstance;
- (BKBootUIOverlayVendor)initWithFirstBootDetector:(id)a3;
- (id)currentOverlayWithLevel:(float)a3;
@end

@implementation BKBootUIOverlayVendor

- (BKBootUIOverlayVendor)initWithFirstBootDetector:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = [BKBootUIOverlayVendor class];
  v6 = [BKBootUIOverlayVendor init];
  v7 = v6;
  if (v6) {
    v6->_firstBootDetector = a3;
  }

  return v7;
}

- (id)currentOverlayWithLevel:(float)a3
{
  unsigned int v4 = [self->_firstBootDetector isFirstBoot];
  id v5 = sub_10003F0B0();
  v6 = [v5 autorelease];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      LOWORD(v16) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Current bootUI is an Apple Logo",  (uint8_t *)&v16,  2u);
    }

    CADisplay *v9 = [CADisplay mainDisplay];
    *(float *)&double v10 = a3;
    v11 = [BKDisplayRenderOverlayAppleLogo overlayWithLevel:v9 display:v10];
  }

  else
  {
    if (v7)
    {
      *(float *)&double v8 = a3;
      v12 = [NSNumber numberWithFloat:v8];
      int v16 = 138412290;
      v17 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Current bootUI is the spinny, level %@",  (uint8_t *)&v16,  0xCu);
    }

    v13 = [CADisplay mainDisplay];
    *(float *)&double v14 = a3;
    BKDisplayRenderOverlaySpinny *v11 = [BKDisplayRenderOverlaySpinny overlayWithLevel:v13 display:v14];

    [v11 setBackground:1];
  }

  return v11;
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_1000DC278 != -1) {
    dispatch_once(&qword_1000DC278, &stru_1000B7FC8);
  }
  return (id)qword_1000DC270;
}

@end