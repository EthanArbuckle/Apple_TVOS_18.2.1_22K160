}

void _appTransitionOccurred()
{
  if (operator||)
  {
    v0 = (void *)ZOTSharedWorkspace;
    id v1 = (id)objc_claimAutoreleasedReturnValue([(id)ZOTSharedWorkspace threadKey]);
    [v0 performSelector:"_handleApplicationActivated" withThreadKey:v1 count:0 objects:0];
  }

id _voiceOverEnabled()
{
  return [(id)ZOTSharedWorkspace _voiceOverEnabled];
}

id ___accessibilityEventTapCallback_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFollowsKeyboardFocus:0];
}

id LocString(void *a1)
{
  id v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.ZoomTouch.axbundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:v1 value:v1 table:@"ZoomStrings"]);

  return v3;
}

uint64_t ZOTInitializeUtilities()
{
  uint64_t result = AXDeviceIsPad();
  ZOTIsWildcat = result;
  return result;
}

uint64_t ZOTTimeSinceBoot()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v0 timeIntervalSince1970];
  uint64_t v2 = (uint64_t)v1 - ZOTSystemBootTime();

  return v2;
}

uint64_t ZOTSystemBootTime()
{
  uint64_t result = ZOTSystemBootTime___boottime;
  if (!ZOTSystemBootTime___boottime)
  {
    int v4 = 0;
    *(void *)v3 = 0x1500000001LL;
    size_t v1 = 16LL;
    if (sysctl(v3, 2u, &v2, &v1, 0LL, 0LL) == -1) {
      uint64_t result = 0LL;
    }
    else {
      uint64_t result = v2;
    }
    ZOTSystemBootTime___boottime = result;
  }

  return result;
}

void ZOTSetUnitTestScaleFactor(double a1)
{
  ZOTUnitTestScaleFactor = *(void *)&a1;
}

double ZOTMainScreenScaleFactor()
{
  double result = *(double *)&ZOTUnitTestScaleFactor;
  if (*(double *)&ZOTUnitTestScaleFactor <= 0.0)
  {
    uint64_t v1 = ZOTTimeSinceBoot();
    double result = 1.0;
    if (v1 >= 60)
    {
      if (ZOTMainScreenScaleFactor_onceToken != -1) {
        dispatch_once(&ZOTMainScreenScaleFactor_onceToken, &__block_literal_global_0);
      }
      return *(double *)&ZOTMainScreenScaleFactor_kZOTMainScreenScaleFactor;
    }
  }

  return result;
}

id ZOTEventMeetsOrbThreshold(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 handInfo]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 paths]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstPath]);
  id v5 = [v4 orbValue];
  if (AXForceTouchThresholdPeek(v5) < v6
    && ZOTEventRealFingerCount(v1) == 1
    && AXForceTouchAvailableAndEnabled())
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v8 = [v7 zoomPeekZoomEnabled];
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

uint64_t ZOTEventRealFingerCount(void *a1)
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "handInfo", 0));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 paths]);

  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = 0LL;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

double ZOTFlipDenormalizedPoint(double a1)
{
  return a1;
}

void ZOTDispatchEventThreadWithDelay(void *a1, void *a2, float a3)
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __ZOTDispatchEventThreadWithDelay_block_invoke;
  v9[3] = &unk_83F0;
  id v10 = a1;
  id v11 = a2;
  float v12 = a3;
  id v5 = v11;
  id v6 = v10;
  v7 = objc_retainBlock(v9);
  id v8 = [v7 copy];
  [v6 performSelector:"zotRunBlock:" onThread:v6 withObject:v8 waitUntilDone:0];
}

void __ZOTDispatchEventThreadWithDelay_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) copy];
  [v2 performSelector:"zotRunBlock:" withObject:v3 afterDelay:*(float *)(a1 + 48)];
}

void ZOTDispatchEventThread(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 copy];
  [v3 performSelector:"zotRunBlock:" onThread:v3 withObject:v4 waitUntilDone:0];
}

double ZOTNormalizeValue(double a1)
{
  return a1 / ZOTMainScreenSize();
}

double ZOTDenormalizeValue(double a1)
{
  return ZOTMainScreenSize() * a1;
}

double ZOTNormalizePoint(double a1)
{
  return a1 / ZOTMainScreenSize();
}

double ZOTDenormalizePoint(double a1)
{
  return a1 * ZOTMainScreenSize();
}

double ZOTConvertVectorToScreenStandard(uint64_t a1, double a2)
{
  double v2 = 180.0;
  float v3 = a2 * 3.14159265 / 180.0;
  double result = v3 / 0.0174532925;
  switch(a1)
  {
    case 4LL:
      double v2 = 270.0;
      goto LABEL_7;
    case 3LL:
      double v2 = 90.0;
      goto LABEL_7;
    case 2LL:
LABEL_7:
      double result = result + v2;
      break;
  }

  double v5 = 360.0;
  if (result <= 360.0)
  {
    if (result >= 0.0) {
      return result;
    }
  }

  else
  {
    double v5 = -360.0;
  }

  return result + v5;
}

double ZOTAlignDistanceAlongAngle(double result, double a2, double a3)
{
  if (a3 >= 45.0)
  {
    double v3 = 90.0;
    if (a3 < 90.0)
    {
LABEL_3:
      double v4 = (v3 - a3) / 45.0;
      return result * v4;
    }

    double v5 = 135.0;
    if (a3 < 135.0) {
      goto LABEL_5;
    }
    if (a3 >= 180.0 && a3 >= 225.0)
    {
      double v3 = 270.0;
      if (a3 < 270.0) {
        goto LABEL_3;
      }
      double v5 = 315.0;
      if (a3 < 315.0)
      {
LABEL_5:
        double v4 = (v5 - a3) / -45.0 + 1.0;
        return result * v4;
      }
    }
  }

  return result;
}

double ZOTCalculateDistanceForAngle(double a1)
{
  double v3 = v2 / ZOTMainScreenScaleFactor();
  if (a1 >= 90.0)
  {
    if (a1 >= 180.0)
    {
      if (a1 >= 270.0) {
        double v4 = -v3;
      }
      else {
        double v4 = v3;
      }
      double v3 = -v3;
    }

    else
    {
      double v4 = v3;
    }
  }

  else
  {
    double v4 = -v3;
  }

  return ZOTAlignDistanceAlongAngle(v4, v3, a1);
}

double ZOTNormalizeVelocity(double a1)
{
  double v1 = 2300.0;
  if (a1 <= 2300.0)
  {
    double v1 = a1;
    if (a1 < 125.0) {
      double v1 = 125.0;
    }
  }

  return v1 / 2175.0;
}

void ZOTDistanceForTimeAndVelocityWithMaxDistance(double a1)
{
}

void ZOTSetGutterDistanceForUnitTests(double a1)
{
  _UnitTestGutterDistance = *(void *)&a1;
}

float ZOTGutterDistance()
{
  uint64_t v0 = _UnitTestGutterDistance;
  if (*(double *)&_UnitTestGutterDistance <= 0.0)
  {
    if (ZOTGutterDistance_onceToken != -1) {
      dispatch_once(&ZOTGutterDistance_onceToken, &__block_literal_global_190);
    }
    uint64_t v0 = ZOTGutterDistance__GutterDistance;
  }

  return *(double *)&v0;
}

double ZOTNotGutterFrame()
{
  if (ZOTNotGutterFrame_onceToken != -1) {
    dispatch_once(&ZOTNotGutterFrame_onceToken, &__block_literal_global_191);
  }
  return *(double *)&ZOTNotGutterFrame_nonGutterFrame_0;
}

uint64_t ZOTShouldStartAutopan( uint64_t DistanceBetweenPoints, BOOL *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14)
{
  v21 = (double *)DistanceBetweenPoints;
  BOOL v24 = a5 != 0.0 && a8 > 1.0;
  if (v24 && !*a2)
  {
    double v26 = 0.0;
  }

  else
  {
    DistanceBetweenPoints = SCRCMathGetDistanceBetweenPoints(a6, a7, a3, a4);
    if (!ZOTIsWildcat)
    {
      uint64_t result = 0LL;
      *a2 = 0;
      return result;
    }

    double v26 = v25;
    BOOL v27 = CGPointZero.x != a6;
    if (v25 <= 0.0700000003) {
      BOOL v27 = 0;
    }
    *a2 = v27;
    if (!v27) {
      return 0LL;
    }
  }

  int v29 = _AXSVoiceOverTouchEnabled(DistanceBetweenPoints);
  float v30 = ZOTGutterDistance();
  if (v29) {
    float v30 = v30 / 3.0;
  }
  double v31 = v30 / ZOTMainScreenScaleFactor();
  if (a3 >= a11 + v31)
  {
    if (a3 <= a11 + a13 - v31)
    {
      uint64_t v36 = 0LL;
      double v35 = 0.0;
      goto LABEL_27;
    }

    double v32 = a11 + a13 - a3;
  }

  else
  {
    double v32 = a3 - a11;
  }

  double v33 = ZOTGutterDistance();
  if (ZOTIsWildcat) {
    double v34 = pow(v32 / v33, -1.2) * 1.5 / 10.0;
  }
  else {
    double v34 = (v33 - v32) / v33;
  }
  double v35 = (v34 + 0.0) * ZOTMainScreenScaleFactor() + 0.0;
  uint64_t v36 = 1LL;
LABEL_27:
  if (a4 >= a12 + v31)
  {
    if (a4 <= a12 + a14 - v31) {
      goto LABEL_35;
    }
    double v37 = a12 + a14 - a4;
  }

  else
  {
    double v37 = a4 - a12;
  }

  double v38 = ZOTGutterDistance();
  if (ZOTIsWildcat) {
    double v39 = pow(v37 / v38, -1.2) * 1.5 / 10.0;
  }
  else {
    double v39 = (v38 - v37) / v38;
  }
  double v35 = v35 + (v39 + 0.0) * ZOTMainScreenScaleFactor();
  ++v36;
LABEL_35:
  if (*a2)
  {
    double v40 = v26 + -0.0700000003;
    if (v26 > 0.899999976) {
      double v40 = 0.819999976;
    }
    double v41 = pow(v40, 3.0) * 1000.0;
    double v35 = v41 * ZOTMainScreenScaleFactor();
    ++v36;
  }

  else if (!v36)
  {
    uint64_t result = 0LL;
    double v42 = 0.0;
    goto LABEL_41;
  }

  double v42 = v35 / (double)v36;
  uint64_t result = 1LL;
LABEL_41:
  double *v21 = v42;
  return result;
}

uint64_t ZOTScreenRegionForPoint(int a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double v13 = 0.0;
  if (a1)
  {
    double v14 = ZOTGutterDistance();
    float v15 = v14 / ZOTMainScreenScaleFactor();
    double v13 = v15;
  }

  if (a2 >= a4 + a6 - v13) {
    unsigned int v16 = 2;
  }
  else {
    unsigned int v16 = 0;
  }
  if (a2 > a4 + v13) {
    uint64_t result = v16;
  }
  else {
    uint64_t result = 1LL;
  }
  if (a3 <= a5 + v13) {
    return result | 4;
  }
  if (a3 >= a5 + a7 - v13) {
    return result | 8;
  }
  return result;
}

uint64_t ZOTScreenRegionForRelativePushPan(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v18 = 0LL;
  double v19 = 0.0;
  SCRCMathGetVectorAndDistanceForPoints(&v19, &v18, a4, a5, a2, a3);
  switch(a1)
  {
    case 4LL:
      double v6 = v19;
      double v7 = 90.0;
LABEL_8:
      double v6 = v6 + v7;
      goto LABEL_10;
    case 3LL:
      double v6 = v19;
      double v7 = -90.0;
      goto LABEL_8;
    case 2LL:
      double v6 = v19 + -180.0;
      if (v19 + -180.0 >= 0.0) {
        goto LABEL_10;
      }
      double v7 = 360.0;
      goto LABEL_8;
  }

  double v6 = v19;
LABEL_10:
  double v8 = 360.0;
  if (v6 < 0.0)
  {
LABEL_13:
    double v6 = v6 + v8;
    goto LABEL_14;
  }

  if (v6 > 360.0)
  {
    double v8 = -360.0;
    goto LABEL_13;
  }

LABEL_14:
  if (v6 >= 0.0 && v6 <= 90.0)
  {
    if (v6 < 35.0)
    {
      uint64_t result = 4LL;
LABEL_26:
      BOOL v13 = 1;
      goto LABEL_27;
    }

    BOOL v10 = v6 <= 55.0;
    unsigned int v11 = 6;
    unsigned int v12 = 2;
LABEL_23:
    if (v10) {
      uint64_t result = v11;
    }
    else {
      uint64_t result = v12;
    }
    goto LABEL_26;
  }

  if (v6 <= 90.0 || v6 > 180.0)
  {
    if (v6 <= 180.0 || v6 > 270.0)
    {
      uint64_t result = 0LL;
      BOOL v13 = 1;
      if (v6 > 270.0 && v6 <= 360.0)
      {
        if (v6 >= 305.0)
        {
          BOOL v10 = v6 <= 325.0;
          unsigned int v11 = 5;
          unsigned int v12 = 4;
          goto LABEL_23;
        }

        BOOL v13 = 1;
        uint64_t result = 1LL;
      }
    }

    else if (v6 >= 215.0)
    {
      BOOL v13 = v6 > 235.0;
      if (v6 > 235.0) {
        uint64_t result = 1LL;
      }
      else {
        uint64_t result = 9LL;
      }
    }

    else
    {
      BOOL v13 = 0;
      uint64_t result = 8LL;
    }
  }

  else
  {
    if (v6 < 125.0)
    {
      uint64_t result = 2LL;
      goto LABEL_26;
    }

    BOOL v13 = 0;
    if (v6 <= 145.0) {
      uint64_t result = 10LL;
    }
    else {
      uint64_t result = 8LL;
    }
  }

LABEL_27:
  if (ZOTIsWildcat)
  {
    if (a1 == 4)
    {
      if (v13) {
        int v17 = ((result >> 1) | (2 * result)) & 9;
      }
      else {
        int v17 = ((result >> 1) | (2 * result)) & 9 | 4;
      }
      return v17 & 0xFFFFFFFD | (2 * (result & 1));
    }

    else if (a1 != 3)
    {
      int v14 = ((2 * result) | (result >> 2)) & 5;
      if (!v13) {
        v14 |= 2u;
      }
      unsigned int v15 = v14 & 0xFFFFFFF7 | (8 * (result & 1));
      unsigned int v16 = (result >> 1) & 2 | !v13 & 0xFFFFFFF3 | (4 * (result & 3));
      if (a1 == 2) {
        return v16;
      }
      else {
        return v15;
      }
    }
  }

  return result;
}

id objc_msgSend_zoomServices(void *a1, const char *a2, ...)
{
  return [a1 zoomServices];
}