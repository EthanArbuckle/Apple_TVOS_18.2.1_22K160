@interface AXAuditPluginPEP
- (AXAuditPluginPEP)init;
- (CGRect)deviceDisplayBounds;
- (CGRect)deviceNativeDisplayBounds;
- (double)deviceDisplayScale;
- (double)deviceNativeDisplayScale;
- (double)deviceRotatianInRadians;
- (id)getScreenshotData;
- (id)screenshotInfoForTransportWithFrame:(CGRect)a3;
- (void)_registerAuditElementTransportInfo;
- (void)_registerPointTransportInfo;
- (void)_registerRangeTransportInfo;
- (void)_registerRectTransportInfo;
- (void)_registerSizeTransportInfo;
@end

@implementation AXAuditPluginPEP

- (AXAuditPluginPEP)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AXAuditPluginPEP;
  v2 = -[AXAuditPluginPEP init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[AXAuditPluginPEP _registerRectTransportInfo](v2, "_registerRectTransportInfo");
    -[AXAuditPluginPEP _registerPointTransportInfo](v3, "_registerPointTransportInfo");
    -[AXAuditPluginPEP _registerSizeTransportInfo](v3, "_registerSizeTransportInfo");
    -[AXAuditPluginPEP _registerRangeTransportInfo](v3, "_registerRangeTransportInfo");
    -[AXAuditPluginPEP _registerAuditElementTransportInfo](v3, "_registerAuditElementTransportInfo");
  }

  return v3;
}

- (void)_registerAuditElementTransportInfo
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[AXAuditObjectTransportManager sharedManager]( &OBJC_CLASS___AXAuditObjectTransportManager,  "sharedManager"));
  id v2 = objc_alloc_init(&OBJC_CLASS___AXAuditObjectTransportInfoMasquerade);
  [v2 setMasqueradeAsClass:objc_opt_class(AXAuditElement)];
  [v2 setCanEncodeObjectBlock:&stru_C6C8];
  [v2 setCreateMasqueradeObjectBlock:&stru_C708];
  [v2 setCreateLocalObjectWithMasqueradeObjectBlock:0];
  [v3 registerTransportInfoMasquerade:v2 encodeOnly:1];
}

- (void)_registerRangeTransportInfo
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[AXAuditObjectTransportManager sharedManager]( &OBJC_CLASS___AXAuditObjectTransportManager,  "sharedManager"));
  id v2 = objc_alloc_init(&OBJC_CLASS___AXAuditObjectTransportInfoMasquerade);
  [v2 setMasqueradeAsClass:objc_opt_class(AXAuditRange)];
  [v2 setCanEncodeObjectBlock:&stru_C728];
  [v2 setCreateMasqueradeObjectBlock:&stru_C768];
  [v2 setCreateLocalObjectWithMasqueradeObjectBlock:&stru_C7A8];
  [v3 registerTransportInfoMasquerade:v2 encodeOnly:0];
}

- (void)_registerSizeTransportInfo
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[AXAuditObjectTransportManager sharedManager]( &OBJC_CLASS___AXAuditObjectTransportManager,  "sharedManager"));
  id v2 = objc_alloc_init(&OBJC_CLASS___AXAuditObjectTransportInfoMasquerade);
  [v2 setMasqueradeAsClass:objc_opt_class(AXAuditSize)];
  [v2 setCanEncodeObjectBlock:&stru_C7C8];
  [v2 setCreateMasqueradeObjectBlock:&stru_C808];
  [v2 setCreateLocalObjectWithMasqueradeObjectBlock:&stru_C848];
  [v3 registerTransportInfoMasquerade:v2 encodeOnly:0];
}

- (void)_registerPointTransportInfo
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[AXAuditObjectTransportManager sharedManager]( &OBJC_CLASS___AXAuditObjectTransportManager,  "sharedManager"));
  id v2 = objc_alloc_init(&OBJC_CLASS___AXAuditObjectTransportInfoMasquerade);
  [v2 setMasqueradeAsClass:objc_opt_class(AXAuditPoint)];
  [v2 setCanEncodeObjectBlock:&stru_C868];
  [v2 setCreateMasqueradeObjectBlock:&stru_C8A8];
  [v2 setCreateLocalObjectWithMasqueradeObjectBlock:&stru_C8E8];
  [v3 registerTransportInfoMasquerade:v2 encodeOnly:0];
}

- (void)_registerRectTransportInfo
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[AXAuditObjectTransportManager sharedManager]( &OBJC_CLASS___AXAuditObjectTransportManager,  "sharedManager"));
  id v2 = objc_alloc_init(&OBJC_CLASS___AXAuditObjectTransportInfoMasquerade);
  [v2 setMasqueradeAsClass:objc_opt_class(AXAuditRect)];
  [v2 setCanEncodeObjectBlock:&stru_C908];
  [v2 setCreateMasqueradeObjectBlock:&stru_C948];
  [v2 setCreateLocalObjectWithMasqueradeObjectBlock:&stru_C988];
  [v3 registerTransportInfoMasquerade:v2 encodeOnly:0];
}

- (id)screenshotInfoForTransportWithFrame:(CGRect)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[AXAuditPluginPEP getScreenshotData]( self,  "getScreenshotData",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height));
  -[AXAuditPluginPEP deviceRotatianInRadians](self, "deviceRotatianInRadians");
  double v6 = v5;
  -[AXAuditPluginPEP deviceNativeDisplayScale](self, "deviceNativeDisplayScale");
  double v8 = v7;
  -[AXAuditPluginPEP deviceDisplayBounds](self, "deviceDisplayBounds");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRect:](&OBJC_CLASS___NSValue, "valueWithRect:"));
  uint64_t v10 = kXDMScreenshotImageData;
  uint64_t v11 = kXDMScreenshotShouldFlipOutline;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6));
  uint64_t v13 = kXDMScreenshotRotation;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v4,  v10,  &__kCFBooleanTrue,  v11,  v12,  v13,  v14,  kXDMScreenshotResolutionMultiplier,  v9,  kXDMScreenshotDisplayBounds,  0LL));

  return v15;
}

- (id)getScreenshotData
{
  id v2 = (id) _UICreateScreenUIImageWithRotation(0LL, a2);
  id v3 = [v2 CGImage];

  if (v3)
  {
    CFRetain(v3);
    Mutable = CFDataCreateMutable(0LL, 0LL);
    CGImageDestinationRef v5 = CGImageDestinationCreateWithData(Mutable, @"public.png", 1uLL, 0LL);
    if (v5)
    {
      double v6 = v5;
      double v7 = (const __CFDictionary *)qword_10B78;
      if (!qword_10B78)
      {
        qword_10B78 = (uint64_t)CFDictionaryCreateMutable( 0LL,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        int valuePtr = 1061997773;
        CFNumberRef v8 = CFNumberCreate(0LL, kCFNumberFloatType, &valuePtr);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_10B78, kCGImageDestinationLossyCompressionQuality, v8);
        CFRelease(v8);
        double v7 = (const __CFDictionary *)qword_10B78;
      }

      CGImageDestinationSetProperties(v6, v7);
      CGImageDestinationAddImage(v6, (CGImageRef)v3, 0LL);
      CGImageDestinationFinalize(v6);
      CFRelease(v6);
    }

    CFRelease(v3);
  }

  else
  {
    Mutable = 0LL;
  }

  return Mutable;
}

- (double)deviceDisplayScale
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v2 scale];
  double v4 = v3;

  return v4;
}

- (double)deviceNativeDisplayScale
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v2 nativeScale];
  double v4 = v3;

  return v4;
}

- (CGRect)deviceDisplayBounds
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)deviceNativeDisplayBounds
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v2 nativeBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)deviceRotatianInRadians
{
  id v2 = objc_alloc_init(&OBJC_CLASS___FBSOrientationObserver);
  double v3 = (int *)[v2 activeInterfaceOrientation];
  [v2 invalidate];
  double v4 = 0.0;
  if (v3 != (int *)((char *)&dword_0 + 1))
  {
    if (v3 == (int *)((char *)&dword_0 + 3))
    {
      double v4 = 1.57079633;
    }

    else if (v3 == &dword_4)
    {
      double v4 = -1.57079633;
    }

    else if (v3 == (int *)((char *)&dword_0 + 2))
    {
      double v4 = 3.14159265;
    }

    else
    {
      double v4 = 0.0;
    }
  }

  double v5 = (const __CFString *)MGCopyAnswer(@"DeviceClass", 0LL);
  if (v5)
  {
    double v6 = v5;
    if (CFStringCompare(v5, @"AppleTV", 1uLL))
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
      double v8 = (char *)[v7 userInterfaceIdiom];

      if (v8 == (_BYTE *)&dword_0 + 1) {
        double v4 = 0.0;
      }
      if (v3 != (int *)((char *)&dword_0 + 1) && v8 == (_BYTE *)&dword_0 + 1)
      {
        if (v3 == (int *)((char *)&dword_0 + 3))
        {
          double v4 = 1.57079633;
        }

        else if (v3 == &dword_4)
        {
          double v4 = -1.57079633;
        }

        else if (v3 == (int *)((char *)&dword_0 + 2))
        {
          double v4 = 3.14159265;
        }

        else
        {
          double v4 = 0.0;
        }
      }
    }

    CFRelease(v6);
  }

  return v4;
}

@end