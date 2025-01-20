void sub_3F00(id a1)
{
  NSString *v1;
  void *v2;
  NSString *v3;
  void *v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void v11[4];
  v1 = NSStringFromSelector("auditCheckApplicationsAuditIssues");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v11[0] = v2;
  v3 = NSStringFromSelector("auditCheckElementsForMissingLabelAndUsingImageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v11[1] = v4;
  v5 = NSStringFromSelector("auditCheckElementForRedundentText");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v11[2] = v6;
  v7 = NSStringFromSelector("auditCheckHumanReadable");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v11[3] = v8;
  v9 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 4LL));
  v10 = (void *)qword_10B08;
  qword_10B08 = v9;
}

void sub_402C(id a1)
{
  v4[0] = AXAuditTestTypeSufficientElementDescription;
  v4[1] = AXAuditTestTypeTrait;
  v4[2] = AXAuditTestTypeDynamicText;
  v4[3] = AXAuditTestTypeTextClipped;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, 4LL));
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v1));
  v3 = (void *)qword_10B18;
  qword_10B18 = v2;
}

void sub_4E18(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 auditIssuesForOptions:*(void *)(a1 + 32)]);
  if (v4 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      v9 = 0LL;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          if (objc_msgSend(v12, "count", (void)v15))
          {
            id v13 = AuditIssueFromServerAppDict(v12);
            uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);

            v9 = (void *)v14;
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v8);
    }

    else
    {
      v9 = 0LL;
    }
  }

  else
  {
    v9 = 0LL;
  }

  objc_msgSend( *(id *)(a1 + 40),  "_auditCheckElementForMissingLabel:withSelectorName:imageNameAuditIssue:caseResult:",  v3,  *(void *)(a1 + 48),  v9,  *(void *)(a1 + 56),  (void)v15);
}

void sub_523C(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v14 = a2;
  if ((a6 & ~a5) == 0)
  {
    id v33 = v14;
    id v15 = a8;
    id v16 = a4;
    id v17 = a3;
    __int128 v18 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AXAuditPluginPEP));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 localizedStringForKey:v15 value:&stru_C9A8 table:@"Localizable"]);

    v21 = [v20 length];
    v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) elementDescriptionForElement:v33]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v33 uiElement]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectWithAXAttribute:5019]);

    id v25 = [v17 rangeOfString:v20 options:1];
    v26 = [v17 length];

    if (v25 == (id)(v26 - v21))
    {
      v27 = *(void **)(a1 + 32);
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditElement auditElementWithElement:identifier:]( &OBJC_CLASS___AXAuditElement,  "auditElementWithElement:identifier:",  v33,  v24));
      [*(id *)(a1 + 32) orientedFrameForElement:v33];
      objc_msgSend(v27, "addIssueWithClassification:auditElement:elementRect:elementDescription:", 1004, v28, v22);
    }

    id v29 = [v16 rangeOfString:v20 options:1];
    v30 = [v16 length];

    if (v29 == (id)(v30 - v21))
    {
      v31 = *(void **)(a1 + 32);
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditElement auditElementWithElement:identifier:]( &OBJC_CLASS___AXAuditElement,  "auditElementWithElement:identifier:",  v33,  v24));
      [*(id *)(a1 + 32) orientedFrameForElement:v33];
      objc_msgSend(v31, "addIssueWithClassification:auditElement:elementRect:elementDescription:", 1005, v32, v22);
    }

    id v14 = v33;
  }
}

id sub_561C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _auditCheckHumanReadableDescription:a2];
}

void sub_5B20(id a1)
{
  v1 = NSStringFromSelector("auditHitUISize");
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v5 = v2;
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));
  v4 = (void *)qword_10B28;
  qword_10B28 = v3;
}

void sub_5BF0(id a1)
{
  uint64_t v4 = AXAuditTestTypeHitRegion;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v4, 1LL));
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v1));
  uint64_t v3 = (void *)qword_10B38;
  qword_10B38 = v2;
}

void sub_5D58(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isScannerElement])
  {
    [*(id *)(a1 + 32) orientedFrameForElement:v3];
    double v8 = v7;
    if (v5 < 20.0 || v6 < 20.0)
    {
      double v10 = v4;
      double v11 = v5;
      double v12 = v6;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectWithAXAttribute:5019]);

      id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) elementDescriptionForElement:v3]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditElement auditElementWithElement:identifier:]( &OBJC_CLASS___AXAuditElement,  "auditElementWithElement:identifier:",  v3,  v14));
      id v17 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AXAuditPluginPEP));
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 localizedStringForKey:@"currentsize.formatter" value:&stru_C9A8 table:@"Localizable"]);
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v19,  *(void *)&v11,  *(void *)&v12));

      v21 = *(void **)(a1 + 32);
      v23 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
      objc_msgSend( v21,  "addIssueWithClassification:auditElement:elementRect:elementDescription:mlGeneratedDescription:longDescExtraInfo:elementText:",  100,  v16,  v15,  0,  v22,  0,  v8,  v10,  v11,  v12);
    }
  }
}

id AuditIssueFromServerAppDict(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKey:kAXAuditIssueTypeKey]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKey:kAXAuditIssueElementDescKey]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKey:kAXAuditIssueElementKey]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKey:kAXAuditIssueAdditionalInfoKey]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKey:kAXAuditIssueIdentifierKey]);
  uint64_t v40 = objc_claimAutoreleasedReturnValue([v1 objectForKey:kAXAuditIssueForegroundColorKey]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKey:kAXAuditIssueBackgroundColorKey]);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKey:kAXAuditIssueFontSizeKey]);
  uint64_t v41 = objc_claimAutoreleasedReturnValue([v1 objectForKey:kAXAuditIssueTextKey]);
  cf = (const __AXValue *)objc_claimAutoreleasedReturnValue([v1 objectForKey:kAXAuditIssueElementRectKey]);
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditIssue auditIssueForClassification:]( AXAuditIssue,  "auditIssueForClassification:",  [v2 integerValue]));
  v39 = v7;
  if (v4)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___AXUIElement);
    if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0)
    {
      v35 = v6;
      v37 = v5;
      double v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement elementWithUIElement:](&OBJC_CLASS___AXElement, "elementWithUIElement:", v4));
      double v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectWithAXAttribute:5019]);
      double v12 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditElement auditElementWithElement:identifier:]( &OBJC_CLASS___AXAuditElement,  "auditElementWithElement:identifier:",  v10,  v11));
      [v8 setAuditElement:v12];
      [v4 rectWithAXAttribute:2003];
      objc_msgSend(v8, "setElementRect:");
    }

    else
    {
      CFTypeID v13 = CFGetTypeID(v4);
      if (v13 != AXUIElementGetTypeID()) {
        goto LABEL_7;
      }
      v35 = v6;
      v37 = v5;
      double v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIElement uiElementWithAXElement:](&OBJC_CLASS___AXUIElement, "uiElementWithAXElement:", v4));
      double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectWithAXAttribute:5019]);
      double v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement elementWithUIElement:](&OBJC_CLASS___AXElement, "elementWithUIElement:", v10));
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditElement auditElementWithElement:identifier:]( &OBJC_CLASS___AXAuditElement,  "auditElementWithElement:identifier:",  v12,  v11));
      [v8 setAuditElement:v14];
      [v10 rectWithAXAttribute:2003];
      objc_msgSend(v8, "setElementRect:");
    }

    double v6 = v35;
    double v5 = v37;
    double v7 = v39;
  }

LABEL_7:
  [v8 setElementDescription:v3];
  id v15 = (void *)v41;
  id v16 = cf;
  if (v5)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:kAXAuditIssueUnsupportedFontSizesKey]);
    if (v17)
    {
      v36 = v6;
      v38 = v5;
      v32 = v4;
      id v33 = v3;
      v34 = v2;
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      id v19 = fontSizeSymbolMapping();
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      id v21 = v17;
      id v22 = [v21 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v46;
        do
        {
          for (i = 0LL; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v46 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:*(void *)(*((void *)&v45 + 1) + 8 * (void)i)]);
            [v18 addObject:v26];
          }

          id v23 = [v21 countByEnumeratingWithState:&v45 objects:v49 count:16];
        }

        while (v23);
      }

      [v8 setLongDescExtraInfo:v18];
      id v3 = v33;
      uint64_t v2 = v34;
      double v4 = v32;
      double v6 = v36;
      double v5 = v38;
      id v15 = (void *)v41;
      id v16 = cf;
    }

    double v7 = v39;
  }

  if (v16)
  {
    CFTypeID v27 = CFGetTypeID(v16);
    if (v27 == AXValueGetTypeID())
    {
      AXValueGetValue(cf, kAXValueTypeCGRect, valuePtr);
      objc_msgSend(v8, "setElementRect:", valuePtr[0], valuePtr[1], valuePtr[2], valuePtr[3]);
    }
  }

  v28 = (void *)v40;
  if ([v2 integerValue] == &unk_FA1 || objc_msgSend(v2, "integerValue") == &stru_3D8.segname[15])
  {
    if ([v6 length])
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v8 elementDescription]);
      if ([v29 length])
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 stringByAppendingFormat:@" %@", v6]);
        [v8 setElementDescription:v30];

        v28 = (void *)v40;
      }

      else
      {
        [v8 setElementDescription:v6];
      }

      id v15 = (void *)v41;
    }

    if ([v28 length]) {
      [v8 setForegroundColor:v28];
    }
    if ([v7 length]) {
      [v8 setBackgroundColor:v7];
    }
    if (v42)
    {
      [v42 doubleValue];
      objc_msgSend(v8, "setFontSize:");
    }
  }

  if ([v15 length]) {
    [v8 setElementText:v15];
  }

  return v8;
}

id fontSizeSymbolMapping()
{
  v3[0] = UIContentSizeCategoryExtraSmall;
  v3[1] = UIContentSizeCategorySmall;
  v4[0] = @"UIContentSizeCategoryExtraSmall";
  v4[1] = @"UIContentSizeCategorySmall";
  v3[2] = UIContentSizeCategoryMedium;
  v3[3] = UIContentSizeCategoryLarge;
  v4[2] = @"UIContentSizeCategoryMedium";
  v4[3] = @"UIContentSizeCategoryLarge";
  v3[4] = UIContentSizeCategoryExtraLarge;
  v3[5] = UIContentSizeCategoryExtraExtraLarge;
  void v4[4] = @"UIContentSizeCategoryExtraLarge";
  v4[5] = @"UIContentSizeCategoryExtraExtraLarge";
  v3[6] = UIContentSizeCategoryExtraExtraExtraLarge;
  v3[7] = UIContentSizeCategoryAccessibilityMedium;
  v4[6] = @"UIContentSizeCategoryExtraExtraExtraLarge";
  v4[7] = @"UIContentSizeCategoryAccessibilityMedium";
  v3[8] = UIContentSizeCategoryAccessibilityLarge;
  v3[9] = UIContentSizeCategoryAccessibilityExtraLarge;
  v4[8] = @"UIContentSizeCategoryAccessibilityLarge";
  v4[9] = @"UIContentSizeCategoryAccessibilityExtraLarge";
  v3[10] = UIContentSizeCategoryAccessibilityExtraExtraLarge;
  v3[11] = UIContentSizeCategoryAccessibilityExtraExtraExtraLarge;
  v4[10] = @"UIContentSizeCategoryAccessibilityExtraExtraLarge";
  v4[11] = @"UIContentSizeCategoryAccessibilityExtraExtraExtraLarge";
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  12LL));
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v0));

  return v1;
}

BOOL AuditDoesAllowDeveloperAttributes(int pid)
{
  mach_port_name_t v2 = 0;
  return task_for_pid(mach_task_self_, pid, &v2) == 0;
}

id fontSizesToIgnore()
{
  if (qword_10B48 != -1) {
    dispatch_once(&qword_10B48, &stru_C648);
  }
  return (id)qword_10B50;
}

void sub_66C8(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"UIContentSizeCategoryExtraSmall",  @"UIContentSizeCategorySmall",  @"UIContentSizeCategoryMedium",  0LL));
  mach_port_name_t v2 = (void *)qword_10B50;
  qword_10B50 = v1;
}

void sub_675C(id a1)
{
  uint64_t v1 = NSStringFromSelector("auditTextContrast");
  mach_port_name_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  double v5 = v2;
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));
  double v4 = (void *)qword_10B58;
  qword_10B58 = v3;
}

void sub_682C(id a1)
{
  v4[0] = AXAuditTestTypeContrast;
  v4[1] = AXAuditTestTypeElementDetection;
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, 2LL));
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v1));
  uint64_t v3 = (void *)qword_10B68;
  qword_10B68 = v2;
}

BOOL sub_7C88(id a1, NSObject *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___AXElement);
  char isKindOfClass = objc_opt_isKindOfClass(v2, v3);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___AXUIElement);
  char v6 = objc_opt_isKindOfClass(v2, v5);
  if (v2)
  {
    CFTypeID v7 = CFGetTypeID(v2);
    BOOL v8 = v7 == AXUIElementGetTypeID();
  }

  else
  {
    BOOL v8 = 0;
  }

  char v9 = v6 | v8;
  if ((isKindOfClass & 1) != 0) {
    char v10 = 1;
  }
  else {
    char v10 = v9;
  }

  return v10 & 1;
}

AXAuditElement *__cdecl sub_7D24(id a1, id a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___AXUIElement);
  char isKindOfClass = objc_opt_isKindOfClass(v2, v3);
  if (v2)
  {
    CFTypeID v5 = CFGetTypeID(v2);
    BOOL v6 = v5 == AXUIElementGetTypeID();
  }

  else
  {
    BOOL v6 = 0;
  }

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___AXElement);
  char v8 = objc_opt_isKindOfClass(v2, v7);
  char v9 = (AXAuditElement *)v2;
  if (v6)
  {
LABEL_7:
    if (!v9) {
      goto LABEL_13;
    }
    goto LABEL_8;
  }

  if ((isKindOfClass & 1) != 0)
  {
    char v9 = (AXAuditElement *)[v2 axElement];
    goto LABEL_7;
  }

  if ((v8 & 1) == 0)
  {
    char v9 = 0LL;
    goto LABEL_13;
  }

  CFTypeID v13 = (void *)objc_claimAutoreleasedReturnValue([v2 uiElement]);
  char v9 = (AXAuditElement *)[v13 axElement];

  if (!v9) {
    goto LABEL_13;
  }
LABEL_8:
  Data = (void *)_AXUIElementCreateData(v9);
  if (Data && (uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(Data, v11) & 1) != 0))
  {
    char v9 = objc_opt_new(&OBJC_CLASS___AXAuditElement);
    -[AXAuditElement setPlatformElementToken:](v9, "setPlatformElementToken:", Data);
  }

  else
  {
    char v9 = 0LL;
  }

LABEL_13:
  return v9;
}

BOOL sub_7EEC(id a1, NSObject *a2)
{
  return isAXValueWithType(a2, 4);
}

BOOL isAXValueWithType(void *a1, int a2)
{
  uint64_t v3 = a1;
  double v4 = v3;
  v6 = v3 && (CFTypeID v5 = CFGetTypeID(v3), v5 == AXValueGetTypeID()) && AXValueGetType(v4) == a2;

  return v6;
}

AXAuditRange *__cdecl sub_7F60(id a1, id a2)
{
  id v2 = a2;
  if (isAXValueWithType(v2, 4) && AXValueGetValue((AXValueRef)v2, kAXValueTypeCFRange, v5)) {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXAuditRange createWithRange:](&OBJC_CLASS___AXAuditRange, "createWithRange:", v5[0], v5[1]));
  }
  else {
    uint64_t v3 = 0LL;
  }

  return (AXAuditRange *)v3;
}

id sub_7FD0(id a1, AXAuditRange *a2)
{
  v4[0] = -[AXAuditRange range](a2, "range");
  v4[1] = v2;
  return AXValueCreate(kAXValueTypeCFRange, v4);
}

BOOL sub_80A4(id a1, NSObject *a2)
{
  return isAXValueWithType(a2, 2);
}

AXAuditSize *__cdecl sub_80B0(id a1, id a2)
{
  id v2 = a2;
  if (isAXValueWithType(v2, 2) && AXValueGetValue((AXValueRef)v2, kAXValueTypeCGSize, v5)) {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXAuditSize createWithSize:](&OBJC_CLASS___AXAuditSize, "createWithSize:", v5[0], v5[1]));
  }
  else {
    uint64_t v3 = 0LL;
  }

  return (AXAuditSize *)v3;
}

id sub_8120(id a1, AXAuditSize *a2)
{
  v5[0] = v2;
  v5[1] = v3;
  return AXValueCreate(kAXValueTypeCGSize, v5);
}

BOOL sub_81F4(id a1, NSObject *a2)
{
  return isAXValueWithType(a2, 1);
}

AXAuditPoint *__cdecl sub_8200(id a1, id a2)
{
  id v2 = a2;
  else {
    uint64_t v3 = 0LL;
  }

  return (AXAuditPoint *)v3;
}

id sub_8270(id a1, AXAuditPoint *a2)
{
  v5[0] = v2;
  v5[1] = v3;
  return AXValueCreate(kAXValueTypeCGPoint, v5);
}

BOOL sub_8344(id a1, NSObject *a2)
{
  return isAXValueWithType(a2, 3);
}

AXAuditRect *__cdecl sub_8350(id a1, id a2)
{
  id v2 = a2;
  if (isAXValueWithType(v2, 3) && AXValueGetValue((AXValueRef)v2, kAXValueTypeCGRect, v5)) {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditRect createWithRect:]( &OBJC_CLASS___AXAuditRect,  "createWithRect:",  v5[0],  v5[1],  v5[2],  v5[3]));
  }
  else {
    uint64_t v3 = 0LL;
  }

  return (AXAuditRect *)v3;
}

id sub_83C4(id a1, AXAuditRect *a2)
{
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  v7[3] = v5;
  return AXValueCreate(kAXValueTypeCGRect, v7);
}

id objc_msgSend__auditCheckElementForMissingLabel_withSelectorName_imageNameAuditIssue_caseResult_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_auditCheckElementForMissingLabel:withSelectorName:imageNameAuditIssue:caseResult:");
}

id objc_msgSend_addIssueWithClassification_auditElement_elementRect_elementDescription_mlGeneratedDescription_longDescExtraInfo_elementText_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "addIssueWithClassification:auditElement:elementRect:elementDescription:mlGeneratedDescription:longDescExtraInfo:elementText:");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}