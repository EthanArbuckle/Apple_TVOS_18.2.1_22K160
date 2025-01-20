@interface AXAuditCategoryVisual
- (BOOL)_doesContainsTextForTraits:(unint64_t)a3;
- (BOOL)_isFailureContrastIssueType:(int64_t)a3;
- (BOOL)_mayContainTextForTraits:(unint64_t)a3;
- (BOOL)hasTextInRegionOfAuditIssue:(id)a3;
- (BOOL)supportAuditGroup:(unint64_t)a3;
- (id)_auditGetScreenshotImageDataForFrame:(CGRect)a3;
- (id)allSupportedAuditTypes;
- (id)caseSelectorsForAuditing;
- (void)_auditRunContrastDetectionForAuditIssue:(id)a3;
- (void)auditTextContrast;
@end

@implementation AXAuditCategoryVisual

- (id)caseSelectorsForAuditing
{
  if (qword_10B60 != -1) {
    dispatch_once(&qword_10B60, &stru_C668);
  }
  return (id)qword_10B58;
}

- (id)allSupportedAuditTypes
{
  if (qword_10B70 != -1) {
    dispatch_once(&qword_10B70, &stru_C688);
  }
  return (id)qword_10B68;
}

- (BOOL)supportAuditGroup:(unint64_t)a3
{
  return (a3 >> 1) & 1;
}

- (void)auditTextContrast
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditCategoryVisual caseStartedForSelectorName:](self, "caseStartedForSelectorName:", v4));
  if ((-[AXAuditCategoryVisual shouldRunAuditTestType:]( self,  "shouldRunAuditTestType:",  AXAuditTestTypeContrast) & 1) != 0 && (v6 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditScreenshotManager sharedManager]( AXAuditScreenshotManager,  "sharedManager")),  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lastTimestamp]),  v7,  v6,  v7))
  {
    uint64_t v28 = AXAuditContrastDetectionTest;
    uint64_t v26 = AXAuditShouldRunTestOption;
    v27 = &__kCFBooleanTrue;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
    v29 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditCategoryEmbedded iOSFrontmostAppForTargetPid](self, "iOSFrontmostAppForTargetPid"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 auditIssuesForOptions:v9]);
    [v10 addObjectsFromArray:v12];

    if ([v10 count])
    {
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v13 = v10;
      id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v22;
        do
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
            if (objc_msgSend(v18, "count", (void)v21))
            {
              id v19 = AuditIssueFromServerAppDict(v18);
              v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
              if ([v20 issueClassification] == &unk_FA1) {
                -[AXAuditCategoryVisual _auditRunContrastDetectionForAuditIssue:]( self,  "_auditRunContrastDetectionForAuditIssue:",  v20);
              }
            }
          }

          id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }

        while (v15);
      }
    }

    -[AXAuditCategoryVisual caseEndedForSelectorName:result:]( self,  "caseEndedForSelectorName:result:",  v4,  v5,  (void)v21);
  }

  else
  {
    -[AXAuditCategoryVisual caseEndedForSelectorName:result:](self, "caseEndedForSelectorName:result:", v4, v5);
  }
}

- (BOOL)hasTextInRegionOfAuditIssue:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 auditElement]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 axElement]);

  if (-[AXAuditCategoryVisual _doesContainsTextForTraits:]( self,  "_doesContainsTextForTraits:",  [v6 traits]))
  {
    char v7 = 1;
  }

  else
  {
    [v4 elementRect];
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[AXAuditCategoryVisual _auditGetScreenshotImageDataForFrame:]( self,  "_auditGetScreenshotImageDataForFrame:"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditImageDetectionManager sharedManager]( &OBJC_CLASS___AXAuditImageDetectionManager,  "sharedManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 detectionResultsFromImageData:v8]);

    char v7 = [v10 count] != 0;
  }

  return v7;
}

- (id)_auditGetScreenshotImageDataForFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  char v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXAuditScreenshotManager sharedManager](&OBJC_CLASS___AXAuditScreenshotManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastTimestamp]);
  v9 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "screenshotImageForTimestamp:inRect:", v8, x, y, width, height));
  v10 = UIImagePNGRepresentation(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (void)_auditRunContrastDetectionForAuditIssue:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditContrastDetectionManager sharedManager]( &OBJC_CLASS___AXAuditContrastDetectionManager,  "sharedManager"));
  id v6 = objc_alloc_init(&OBJC_CLASS___AXAuditContrastInput);
  char v7 = (void *)objc_claimAutoreleasedReturnValue([v4 auditElement]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 axElement]);

  [v4 elementRect];
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[AXAuditCategoryVisual _auditGetScreenshotImageDataForFrame:]( self,  "_auditGetScreenshotImageDataForFrame:"));
  [v6 setImageData:v9];
  [v6 setEnhanced:0];
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 foregroundColor]);
  if (v10) {
    [v6 setForegroundHexColorValue:v10];
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 backgroundColor]);
  if (v11) {
    [v6 setBackgroundHexColorValue:v11];
  }
  [v4 fontSize];
  if (v12 > 0.0) {
    objc_msgSend(v6, "setFontSize:");
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 elementDescription]);
  [v6 setIdentifier:v13];

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 contrastResultForInput:v6]);
  id v15 = v14;
  if (v14)
  {
    id v16 = [v14 classification];
    if (-[AXAuditCategoryVisual _isFailureContrastIssueType:](self, "_isFailureContrastIssueType:", v16))
    {
      v30 = v9;
      v31 = v8;
      v17 = (void *)objc_claimAutoreleasedReturnValue( -[AXAuditCategoryEmbedded elementDescriptionForElement:]( self,  "elementDescriptionForElement:",  v8));
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditIssue auditIssueForClassification:]( &OBJC_CLASS___AXAuditIssue,  "auditIssueForClassification:",  v16));
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___AXAuditIssue);
      if ((objc_opt_isKindOfClass(v4, v19) & 1) != 0)
      {
        v29 = v5;
        v20 = (void *)objc_claimAutoreleasedReturnValue([v4 auditElement]);
        [v18 setAuditElement:v20];

        uint64_t v28 = v17;
        [v18 setElementDescription:v17];
        [v4 elementRect];
        objc_msgSend(v18, "setElementRect:");
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v15 summary]);
        v32 = v21;
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
        [v18 setLongDescExtraInfo:v22];

        [v15 fontSize];
        objc_msgSend(v18, "setFontSize:");
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v15 compareColors]);
        if ([v23 count] == (char *)&dword_0 + 2)
        {
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:0]);
          [v18 setForegroundColor:v24];

          v25 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:1]);
          [v18 setBackgroundColor:v25];
        }

        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditCategoryVisual currentCaseResult](self, "currentCaseResult"));
        [v26 addAuditIssue:v18];
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditCategoryVisual delegate](self, "delegate"));
        [v27 auditCategory:self didEncounterIssue:v18];

        v17 = v28;
        v5 = v29;
      }

      v9 = v30;
      v8 = v31;
    }
  }
}

- (BOOL)_doesContainsTextForTraits:(unint64_t)a3
{
  return (kAXStaticTextTrait & ~a3) == 0
      || (kAXKeyboardKeyTrait & ~a3) == 0
      || (kAXTextEntryTrait & ~a3) == 0
      || (kAXHeaderTrait & ~a3) == 0
      || (kAXFooterTrait & ~a3) == 0
      || (kAXTextAreaTrait & ~a3) == 0
      || (kAXBookContentTrait & ~a3) == 0
      || (kAXMenuItemTrait & ~a3) == 0
      || (kAXAutoCorrectCandidateTrait & ~a3) == 0
      || (kAXMathEquationTrait & ~a3) == 0;
}

- (BOOL)_mayContainTextForTraits:(unint64_t)a3
{
  return (kAXButtonTrait & ~a3) == 0
      || (kAXImageTrait & ~a3) == 0
      || (kAXLinkTrait & ~a3) == 0
      || (kAXLaunchIconTrait & ~a3) == 0
      || (kAXFolderIconTrait & ~a3) == 0
      || (kAXStatusBarElementTrait & ~a3) == 0
      || (kAXPopupButtonTrait & ~a3) == 0
      || (kAXTabButtonTrait & ~a3) == 0;
}

- (BOOL)_isFailureContrastIssueType:(int64_t)a3
{
  return ((unint64_t)a3 < 0x11) & (0x1B000u >> a3);
}

@end