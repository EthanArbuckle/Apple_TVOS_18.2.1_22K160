@interface AXAuditCategoryEmbedded
+ (CGRect)_appRelativeRectForRect:(CGRect)a3 contextId:(unsigned int)a4;
+ (int)axInterfaceOrientationForDeviceOrientation:(int64_t)a3;
+ (int64_t)axDeviceOrientationForInterfaceOrientation:(int)a3;
- ($0DE818DE613AE78A8FE37301195E8D80)windowContextInformation;
- (CGRect)frameForElement:(id)a3;
- (CGRect)orientedFrameForElement:(id)a3;
- (CGRect)orientedFrameForRect:(CGRect)a3;
- (CGRect)orientedScreenBounds;
- (id)_topLevelAppElement;
- (id)elementDescriptionForElement:(id)a3;
- (id)iOSFrontmostAppForTargetPid;
- (int)interfaceOrientation;
- (void)testOnAllVisibleElements:(id)a3;
@end

@implementation AXAuditCategoryEmbedded

- (void)testOnAllVisibleElements:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditCategoryEmbedded iOSFrontmostAppForTargetPid](self, "iOSFrontmostAppForTargetPid"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleElements", 0));
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10));
        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (id)iOSFrontmostAppForTargetPid
{
  if (-[AXAuditCategoryEmbedded targetPid](self, "targetPid"))
  {
    uint64_t v3 = AXAuditCurrentApplications();
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
    id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v15;
LABEL_4:
      uint64_t v8 = 0LL;
      while (1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
        int v10 = AXAuditPidForElement(v9);
        if (v6 == (id)++v8)
        {
          id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v6) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }

      id v11 = v9;

      if (v11) {
        return v11;
      }
    }

    else
    {
LABEL_10:
    }
  }

  uint64_t v12 = iOSFrontmostApp();
  id v11 = (id)objc_claimAutoreleasedReturnValue(v12);
  return v11;
}

- (CGRect)frameForElement:(id)a3
{
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)orientedFrameForElement:(id)a3
{
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)orientedFrameForRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = objc_msgSend( (id)objc_opt_class(self),  "axDeviceOrientationForInterfaceOrientation:",  -[AXAuditCategoryEmbedded interfaceOrientation](self, "interfaceOrientation"));
  AX_CGRectToOrientation(v7, x, y, width, height);
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (id)elementDescriptionForElement:(id)a3
{
  double v3 = (const __AXUIElement *)[a3 elementRef];
  pid_t pid = 0;
  if (AXUIElementGetPid(v3, &pid) || !AuditDoesAllowDeveloperAttributes(pid)) {
    goto LABEL_7;
  }
  CFTypeRef cf = 0LL;
  AXError v4 = AXUIElementCopyAttributeValue(v3, (CFStringRef)&unk_13B5, &cf);
  double v5 = 0LL;
  if (v4 == kAXErrorSuccess)
  {
    if (cf)
    {
      CFTypeID v6 = CFGetTypeID(cf);
      CFTypeID TypeID = CFStringGetTypeID();
      double v5 = (void *)cf;
      if (v6 != TypeID)
      {
        CFRelease(cf);
LABEL_7:
        double v5 = 0LL;
      }
    }
  }

  return v5;
}

- (id)_topLevelAppElement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditCategoryEmbedded iOSFrontmostAppForTargetPid](self, "iOSFrontmostAppForTargetPid"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uiElement]);

  return v3;
}

- (int)interfaceOrientation
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditCategoryEmbedded _topLevelAppElement](self, "_topLevelAppElement"));
  AXError v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElementsWithAttribute:2017]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastObject]);

  CFTypeID v6 = (void *)objc_claimAutoreleasedReturnValue([v5 numberWithAXAttribute:3035]);
  int v7 = [v6 unsignedIntegerValue];

  if (!v7)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIElement uiSystemWideApplication](&OBJC_CLASS___AXUIElement, "uiSystemWideApplication"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uiElementsWithAttribute:1001]);
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lastObject]);

    double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 numberWithAXAttribute:1503]);
    unsigned int v12 = [v11 intValue];

    if (v12 <= 1) {
      int v13 = 1;
    }
    else {
      int v13 = v12;
    }
    int v7 = [(id)objc_opt_class(self) axInterfaceOrientationForDeviceOrientation:v13];
  }

  return v7;
}

+ (int64_t)axDeviceOrientationForInterfaceOrientation:(int)a3
{
  uint64_t v3 = (a3 - 1);
  else {
    return 0LL;
  }
}

+ (int)axInterfaceOrientationForDeviceOrientation:(int64_t)a3
{
  return 0;
}

- (CGRect)orientedScreenBounds
{
  double MainScreenBounds = AXDeviceGetMainScreenBounds(self, a2);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = -[AXAuditCategoryEmbedded interfaceOrientation](self, "interfaceOrientation");
  if ((v10 - 3) <= 1)
  {
    AXDeviceGetMainScreenBounds(v10, v11);
    double v7 = v12;
    AXDeviceGetMainScreenBounds(v13, v14);
    double v9 = v15;
  }

  double v16 = MainScreenBounds;
  double v17 = v5;
  double v18 = v7;
  double v19 = v9;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- ($0DE818DE613AE78A8FE37301195E8D80)windowContextInformation
{
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditCategoryEmbedded _topLevelAppElement](self, "_topLevelAppElement"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v39 arrayWithAXAttribute:3052]);
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id obj = v3;
  id v8 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = @"contextId";
    uint64_t v11 = *(void *)v47;
    double v12 = &AXAuditClippingTest_ptr;
    do
    {
      uint64_t v13 = 0LL;
      id v43 = v9;
      do
      {
        if (*(void *)v47 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)v13);
        double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v10]);
        double v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"isKeyboardWindow"]);
        uint64_t v17 = objc_opt_class(v12[70]);
        if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
        {
          double v18 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"isKeyboardWindow"]);
          unsigned int v19 = [v18 BOOLValue];
        }

        else
        {
          unsigned int v19 = 0;
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"isMainWindow"]);
        uint64_t v21 = objc_opt_class(v12[70]);
        if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
        {
          v22 = v12;
          uint64_t v23 = v11;
          v24 = v10;
          v25 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"isKeyboardWindow"]);
          unsigned int v26 = [v25 BOOLValue] ^ 1;

          if (((v19 | v26) & 1) != 0)
          {
            uint64_t v10 = v24;
            uint64_t v11 = v23;
          }

          else
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"frame"]);

            AXValueGetValue((AXValueRef)v27, kAXValueTypeCGRect, valuePtr);
            if (v15) {
              [v41 addObject:v15];
            }
            v28 = (void *)objc_opt_class(self);
            id v29 = [v15 unsignedIntValue];
            objc_msgSend( v28,  "_appRelativeRectForRect:contextId:",  v29,  valuePtr[0],  valuePtr[1],  valuePtr[2],  valuePtr[3]);
            CGFloat v31 = v30;
            CGFloat v33 = v32;
            CGFloat v35 = v34;
            CGFloat v37 = v36;
            v51.origin.CGFloat x = x;
            v51.origin.CGFloat y = y;
            v51.size.CGFloat width = width;
            v51.size.CGFloat height = height;
            uint64_t v10 = v24;
            if (!CGRectIsEmpty(v51))
            {
              v52.origin.CGFloat x = x;
              v52.origin.CGFloat y = y;
              v52.size.CGFloat width = width;
              v52.size.CGFloat height = height;
              v54.origin.CGFloat x = v31;
              v54.origin.CGFloat y = v33;
              v54.size.CGFloat width = v35;
              v54.size.CGFloat height = v37;
              CGRect v53 = CGRectUnion(v52, v54);
              CGFloat v31 = v53.origin.x;
              CGFloat v33 = v53.origin.y;
              CGFloat v35 = v53.size.width;
              CGFloat v37 = v53.size.height;
            }

            uint64_t v11 = v23;
            CGFloat x = v31;
            CGFloat y = v33;
            CGFloat width = v35;
            CGFloat height = v37;
          }

          double v12 = v22;
          id v9 = v43;
        }

        else
        {
        }

        uint64_t v13 = (char *)v13 + 1;
      }

      while (v9 != v13);
      id v9 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    }

    while (v9);
  }

  retstr->var0 = v41;
  retstr->var1.origin.CGFloat x = x;
  retstr->var1.origin.CGFloat y = y;
  retstr->var1.size.CGFloat width = width;
  retstr->var1.size.CGFloat height = height;

  return result;
}

+ (CGRect)_appRelativeRectForRect:(CGRect)a3 contextId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  CGRect valuePtr = a3;
  AXValueRef v5 = AXValueCreate(kAXValueTypeCGRect, &valuePtr);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIElement uiSystemWideApplication](&OBJC_CLASS___AXUIElement, "uiSystemWideApplication"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
  id v8 = (const __AXValue *)objc_msgSend( v6,  "objectWithAXAttribute:parameter:",  91505,  +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v5, v7, 0));

  if (v5) {
    CFRelease(v5);
  }
  if (v8) {
    AXValueGetValue(v8, kAXValueTypeCGRect, &valuePtr);
  }
  double width = valuePtr.size.width;
  double height = valuePtr.size.height;
  double x = valuePtr.origin.x;
  double y = valuePtr.origin.y;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end