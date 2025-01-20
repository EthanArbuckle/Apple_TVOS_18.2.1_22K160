@interface AXAuditTextElementInfo
- (AXAuditTextElementInfo)init;
- (BOOL)supportAuditGroup:(unint64_t)a3;
- (id)_elementsForElement:(id)a3 attribute:(int64_t)a4 withParameter:(id)a5;
- (id)_elementsFromElement:(id)a3 direction:(int64_t)a4 withCount:(unint64_t)a5;
- (id)allSupportedAuditTypes;
- (id)caseSelectorsForAuditing;
- (id)navigationElementForElement:(id)a3 inDirection:(int64_t)a4;
- (id)nextElementForElement:(id)a3;
- (id)previousElementForElement:(id)a3;
- (id)swipeOrderForElement:(id)a3 inDirection:(int64_t)a4 includeElement:(BOOL)a5;
- (int64_t)_remainingElementsToAnalyze;
- (void)_auditCheckElementForMissingLabel:(id)a3 withSelectorName:(id)a4 imageNameAuditIssue:(id)a5 caseResult:(id)a6;
- (void)_auditCheckHumanReadableDescription:(id)a3;
- (void)_elementFinishedAnalyzingForAudit:(id)a3 caseResult:(id)a4;
- (void)_getAuditIssuesForElement:(id)a3;
- (void)auditCheckApplicationsAuditIssues;
- (void)auditCheckElementForRedundentText;
- (void)auditCheckElementsForMissingLabelAndUsingImageName;
- (void)auditCheckHitTest;
- (void)auditCheckHumanReadable;
- (void)set_remainingElementsToAnalyze:(int64_t)a3;
@end

@implementation AXAuditTextElementInfo

- (AXAuditTextElementInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AXAuditTextElementInfo;
  return -[AXAuditTextElementInfo init](&v3, "init");
}

- (id)caseSelectorsForAuditing
{
  if (qword_10B10 != -1) {
    dispatch_once(&qword_10B10, &stru_C550);
  }
  return (id)qword_10B08;
}

- (id)allSupportedAuditTypes
{
  if (qword_10B20 != -1) {
    dispatch_once(&qword_10B20, &stru_C570);
  }
  return (id)qword_10B18;
}

- (BOOL)supportAuditGroup:(unint64_t)a3
{
  return a3 & 1;
}

- (void)_getAuditIssuesForElement:(id)a3
{
  id v4 = a3;
  id v5 = -[AXAuditTextElementInfo shouldRunAuditTestType:](self, "shouldRunAuditTestType:", AXAuditTestTypeDynamicText);
  id v6 = -[AXAuditTextElementInfo shouldRunAuditTestType:](self, "shouldRunAuditTestType:", AXAuditTestTypeTextClipped);
  id v7 = -[AXAuditTextElementInfo shouldRunAuditTestType:](self, "shouldRunAuditTestType:", AXAuditTestTypeTrait);
  id v8 = v7;
  if ((v5 & 1) != 0 || (v6 & 1) != 0 || (_DWORD)v7)
  {
    v106 = self;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditPreferenceController sharedController]( &OBJC_CLASS___AXAuditPreferenceController,  "sharedController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v9 spinRunloop]));

    uint64_t v130 = AXAuditDynamicTextSupportTest;
    uint64_t v11 = AXAuditShouldRunTestOption;
    v128[0] = AXAuditShouldRunTestOption;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
    v128[1] = AXAuditSpinRunLoopOption;
    v129[0] = v12;
    v129[1] = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v129,  v128,  2LL));
    v131 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v131,  &v130,  1LL));

    uint64_t v126 = AXAuditClippingTest;
    uint64_t v124 = v11;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
    v125 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v125,  &v124,  1LL));
    v127 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v127,  &v126,  1LL));

    uint64_t v122 = AXAuditMissingTraitNotEnabledTest;
    uint64_t v120 = v11;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
    v121 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v121,  &v120,  1LL));
    v123 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v123,  &v122,  1LL));

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v21 addEntriesFromDictionary:v14];
    [v21 addEntriesFromDictionary:v17];
    [v21 addEntriesFromDictionary:v20];
    v22 = (void *)objc_claimAutoreleasedReturnValue([v4 auditIssuesForOptions:v21]);
    if (v22)
    {
      uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
      {
        v100 = v21;
        v101 = v20;
        v102 = v17;
        v103 = v14;
        v104 = v10;
        id v105 = v4;
        __int128 v109 = 0u;
        __int128 v110 = 0u;
        memset(&aRect[1], 0, 32);
        v99 = v22;
        id obj = v22;
        id v24 = [obj countByEnumeratingWithState:&aRect[1] objects:v119 count:16];
        v25 = self;
        if (!v24) {
          goto LABEL_28;
        }
        id v26 = v24;
        uint64_t v27 = *(void *)aRect[3];
        while (1)
        {
          for (i = 0LL; i != v26; i = (char *)i + 1)
          {
            if (*(void *)aRect[3] != v27) {
              objc_enumerationMutation(obj);
            }
            v29 = *(void **)(aRect[2] + 8LL * (void)i);
            if ([v29 count])
            {
              id v30 = AuditIssueFromServerAppDict(v29);
              v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
              [v31 elementRect];
              double v33 = v32;
              double v35 = v34;
              double v37 = v36;
              double v39 = v38;
              -[AXAuditCategoryEmbedded orientedScreenBounds](v25, "orientedScreenBounds");
              double v41 = v40;
              double v43 = v42;
              double v45 = v44;
              double v47 = v46;
              v132.origin.x = v33;
              v132.origin.y = v35;
              v132.size.width = v37;
              v132.size.height = v39;
              if (CGRectIsEmpty(v132)
                || (v133.origin.x = v41,
                    v133.origin.y = v43,
                    v133.size.width = v45,
                    v133.size.height = v47,
                    CGRectIsEmpty(v133))
                || (AXMIsContainedBy(v41, v43, v45, v47, v33, v35, v37, v39, 0.7) & 1) != 0)
              {
                v48 = (void *)objc_claimAutoreleasedReturnValue([v31 auditElement]);
                v49 = (void *)objc_claimAutoreleasedReturnValue([v48 axElement]);
                v50 = (void *)objc_claimAutoreleasedReturnValue([v49 uiElement]);
                [v50 rectWithAXAttribute:2003];
                aRect[0] = v51;
                CGFloat v53 = v52;
                double v55 = v54;
                double v57 = v56;

                v58 = (void *)objc_claimAutoreleasedReturnValue([v31 auditElement]);
                v59 = (void *)objc_claimAutoreleasedReturnValue([v58 axElement]);
                v60 = (void *)objc_claimAutoreleasedReturnValue([v59 uiElement]);
                [v60 rectWithAXAttribute:2057];
                CGFloat v62 = v61;
                CGFloat v64 = v63;
                double v66 = v65;
                double v68 = v67;

                if (v66 * v68 / (v55 * v57) <= 0.5)
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                  {
                    v87 = (void *)objc_claimAutoreleasedReturnValue([v31 auditElement]);
                    v88 = (void *)objc_claimAutoreleasedReturnValue([v87 axElement]);
                    *(void *)&v134.origin.x = aRect[0];
                    v134.origin.y = v53;
                    v134.size.width = v55;
                    v134.size.height = v57;
                    v89 = NSStringFromRect(v134);
                    v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
                    v135.origin.x = v62;
                    v135.origin.y = v64;
                    v135.size.width = v66;
                    v135.size.height = v68;
                    v91 = NSStringFromRect(v135);
                    v92 = (void *)objc_claimAutoreleasedReturnValue(v91);
                    *(_DWORD *)buf = 136315906;
                    v112 = "-[AXAuditTextElementInfo _getAuditIssuesForElement:]";
                    __int16 v113 = 2112;
                    v114 = v88;
                    __int16 v115 = 2112;
                    v116 = v90;
                    __int16 v117 = 2112;
                    v118 = v92;
                    _os_log_debug_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%s: skipping because AXElement %@ with frame %@ has a visible frame %@ that is less than 50 percent visible",  buf,  0x2Au);
                  }
                }

                else
                {
                  if ([v31 issueClassification] != "ameworks/QuartzCore.framework/QuartzCore") {
                    goto LABEL_19;
                  }
                  id v69 = fontSizesToIgnore();
                  v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
                  v71 = (void *)objc_claimAutoreleasedReturnValue([v31 longDescExtraInfo]);
                  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v71));

                  [v72 minusSet:v70];
                  if ([v72 count])
                  {
                    v73 = (void *)objc_claimAutoreleasedReturnValue([v72 allObjects]);
                    [v31 setLongDescExtraInfo:v73];

LABEL_19:
                    v74 = (void *)objc_claimAutoreleasedReturnValue([v31 auditElement]);
                    v70 = (void *)objc_claimAutoreleasedReturnValue([v74 axElement]);

                    v72 = (void *)objc_claimAutoreleasedReturnValue( -[AXAuditCategoryEmbedded elementDescriptionForElement:]( v25,  "elementDescriptionForElement:",  v70));
                    id v75 = [v31 issueClassification];
                    v76 = (void *)objc_claimAutoreleasedReturnValue([v31 auditElement]);
                    [v31 elementRect];
                    double v78 = v77;
                    double v80 = v79;
                    double v82 = v81;
                    double v84 = v83;
                    v85 = (void *)objc_claimAutoreleasedReturnValue([v31 longDescExtraInfo]);
                    v86 = (void *)objc_claimAutoreleasedReturnValue([v31 elementText]);
                    -[AXAuditTextElementInfo addIssueWithClassification:auditElement:elementRect:elementDescription:mlGeneratedDescription:longDescExtraInfo:elementText:]( v106,  "addIssueWithClassification:auditElement:elementRect:elementDescription:mlGeneratedDescription:long DescExtraInfo:elementText:",  v75,  v76,  v72,  0LL,  v85,  v86,  v78,  v80,  v82,  v84);

                    v25 = v106;
                  }
                }
              }

              else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
              {
                v93 = (void *)objc_claimAutoreleasedReturnValue([v31 auditElement]);
                v94 = (void *)objc_claimAutoreleasedReturnValue([v93 axElement]);
                v136.origin.x = v33;
                v136.origin.y = v35;
                v136.size.width = v37;
                v136.size.height = v39;
                v95 = NSStringFromRect(v136);
                v96 = (void *)objc_claimAutoreleasedReturnValue(v95);
                v137.origin.x = v41;
                v137.origin.y = v43;
                v137.size.width = v45;
                v137.size.height = v47;
                v97 = NSStringFromRect(v137);
                v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
                *(_DWORD *)buf = 136315906;
                v112 = "-[AXAuditTextElementInfo _getAuditIssuesForElement:]";
                __int16 v113 = 2112;
                v114 = v94;
                __int16 v115 = 2112;
                v116 = v96;
                __int16 v117 = 2112;
                v118 = v98;
                _os_log_debug_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%s: skipping because AXElement %@ with frame %@ is less than 70 percent contained by screen bounds %@",  buf,  0x2Au);
              }

              continue;
            }
          }

          id v26 = [obj countByEnumeratingWithState:&aRect[1] objects:v119 count:16];
          if (!v26)
          {
LABEL_28:

            v10 = v104;
            id v4 = v105;
            v17 = v102;
            v14 = v103;
            v21 = v100;
            v20 = v101;
            v22 = v99;
            break;
          }
        }
      }
    }
  }
}

- (void)auditCheckApplicationsAuditIssues
{
  objc_super v3 = NSStringFromSelector(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditTextElementInfo caseStartedForSelectorName:](self, "caseStartedForSelectorName:", v6));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditCategoryEmbedded iOSFrontmostAppForTargetPid](self, "iOSFrontmostAppForTargetPid"));
  -[AXAuditTextElementInfo _getAuditIssuesForElement:](self, "_getAuditIssuesForElement:", v5);
  -[AXAuditTextElementInfo caseEndedForSelectorName:result:](self, "caseEndedForSelectorName:result:", v6, v4);
}

- (void)_auditCheckElementForMissingLabel:(id)a3 withSelectorName:(id)a4 imageNameAuditIssue:(id)a5 caseResult:(id)a6
{
  id v16 = a3;
  if (-[AXAuditTextElementInfo shouldRunAuditTestType:]( self,  "shouldRunAuditTestType:",  AXAuditTestTypeSufficientElementDescription))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v16 label]);
    if ([v8 length])
    {
      BOOL v9 = 1;
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v16 value]);
      BOOL v9 = [v10 length] != 0;
    }

    if (a5 || !v9)
    {
      unint64_t v11 = (unint64_t)[v16 traits];
      if ((kAXBackButtonTrait & ~v11) != 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue( -[AXAuditCategoryEmbedded elementDescriptionForElement:]( self,  "elementDescriptionForElement:",  v16));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v16 uiElement]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectWithAXAttribute:5019]);

        -[AXAuditTextElementInfo set_remainingElementsToAnalyze:]( self,  "set_remainingElementsToAnalyze:",  (char *)-[AXAuditTextElementInfo _remainingElementsToAnalyze](self, "_remainingElementsToAnalyze") + 1);
        -[AXAuditTextElementInfo set_remainingElementsToAnalyze:]( self,  "set_remainingElementsToAnalyze:",  (char *)-[AXAuditTextElementInfo _remainingElementsToAnalyze](self, "_remainingElementsToAnalyze") - 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditElement auditElementWithElement:identifier:]( &OBJC_CLASS___AXAuditElement,  "auditElementWithElement:identifier:",  v16,  v14));
        -[AXAuditCategoryEmbedded orientedFrameForElement:](self, "orientedFrameForElement:", v16);
        -[AXAuditTextElementInfo addIssueWithClassification:auditElement:elementRect:elementDescription:]( self,  "addIssueWithClassification:auditElement:elementRect:elementDescription:",  1000LL,  v15,  v12);
      }
    }
  }
}

- (void)_elementFinishedAnalyzingForAudit:(id)a3 caseResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[AXAuditTextElementInfo _remainingElementsToAnalyze](self, "_remainingElementsToAnalyze") <= 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      BOOL v9 = "-[AXAuditTextElementInfo _elementFinishedAnalyzingForAudit:caseResult:]";
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: no more remaining elements! ending case for selector: %@",  (uint8_t *)&v8,  0x16u);
    }

    -[AXAuditTextElementInfo set_remainingElementsToAnalyze:](self, "set_remainingElementsToAnalyze:", 0LL);
    -[AXAuditTextElementInfo caseEndedForSelectorName:result:](self, "caseEndedForSelectorName:result:", v6, v7);
  }
}

- (void)auditCheckElementsForMissingLabelAndUsingImageName
{
  objc_super v3 = NSStringFromSelector(a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditTextElementInfo caseStartedForSelectorName:](self, "caseStartedForSelectorName:", v4));
  if ((-[AXAuditTextElementInfo shouldRunAuditTestType:]( self,  "shouldRunAuditTestType:",  AXAuditTestTypeSufficientElementDescription) & 1) != 0)
  {
    -[AXAuditTextElementInfo set_remainingElementsToAnalyze:](self, "set_remainingElementsToAnalyze:", 0LL);
    uint64_t v19 = AXAuditElementLabelUsesImageNameTest;
    uint64_t v17 = AXAuditShouldRunTestOption;
    v18 = &__kCFBooleanTrue;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    v20 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));

    int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v8 addEntriesFromDictionary:v7];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_4E18;
    v12[3] = &unk_C598;
    id v13 = v8;
    v14 = self;
    id v9 = v4;
    id v15 = v9;
    id v10 = v5;
    id v16 = v10;
    id v11 = v8;
    -[AXAuditCategoryEmbedded testOnAllVisibleElements:](self, "testOnAllVisibleElements:", v12);
    -[AXAuditTextElementInfo _elementFinishedAnalyzingForAudit:caseResult:]( self,  "_elementFinishedAnalyzingForAudit:caseResult:",  v9,  v10);
  }

  else
  {
    -[AXAuditTextElementInfo caseEndedForSelectorName:result:](self, "caseEndedForSelectorName:result:", v4, v5);
  }
}

- (void)auditCheckElementForRedundentText
{
  objc_super v3 = NSStringFromSelector(a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditTextElementInfo caseStartedForSelectorName:](self, "caseStartedForSelectorName:", v4));
  if ((-[AXAuditTextElementInfo shouldRunAuditTestType:]( self,  "shouldRunAuditTestType:",  AXAuditTestTypeTrait) & 1) != 0)
  {
    v21 = v5;
    v22 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditCategoryEmbedded iOSFrontmostAppForTargetPid](self, "iOSFrontmostAppForTargetPid"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_523C;
    v29[3] = &unk_C5C0;
    v20 = self;
    v29[4] = self;
    id v7 = objc_retainBlock(v29);
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    uint64_t v19 = v6;
    id obj = (id)objc_claimAutoreleasedReturnValue([v6 visibleElements]);
    id v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v24 = *(void *)v26;
      uint64_t v10 = kAXButtonTrait;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v26 != v24) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 label]);
          v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByTrimmingCharactersInSet:v14]);

          id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 value]);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByTrimmingCharactersInSet:v17]);

          ((void (*)(void *, void *, void *, void *, id, uint64_t, const __CFString *, const __CFString *))v7[2])( v7,  v12,  v15,  v18,  [v12 traits],  v10,  @"UIAccessibilityTraitButton",  @"trait.button");
        }

        id v9 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      }

      while (v9);
    }

    id v5 = v21;
    id v4 = v22;
    -[AXAuditTextElementInfo caseEndedForSelectorName:result:](v20, "caseEndedForSelectorName:result:", v22, v21);
  }

  else
  {
    -[AXAuditTextElementInfo caseEndedForSelectorName:result:](self, "caseEndedForSelectorName:result:", v4, v5);
  }
}

- (void)_auditCheckHumanReadableDescription:(id)a3
{
  id v11 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v11 label]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByTrimmingCharactersInSet:v5]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v11 uiElement]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectWithAXAttribute:5019]);

  if ([v6 length] && (objc_msgSend(v6, "axAuditStringIsHumanReadable") & 1) == 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditCategoryEmbedded elementDescriptionForElement:](self, "elementDescriptionForElement:", v11));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditElement auditElementWithElement:identifier:]( &OBJC_CLASS___AXAuditElement,  "auditElementWithElement:identifier:",  v11,  v8));
    -[AXAuditCategoryEmbedded orientedFrameForElement:](self, "orientedFrameForElement:", v11);
    -[AXAuditTextElementInfo addIssueWithClassification:auditElement:elementRect:elementDescription:]( self,  "addIssueWithClassification:auditElement:elementRect:elementDescription:",  1002LL,  v10,  v9);
  }
}

- (void)auditCheckHumanReadable
{
  objc_super v3 = NSStringFromSelector(a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditTextElementInfo caseStartedForSelectorName:](self, "caseStartedForSelectorName:", v4));
  if ((-[AXAuditTextElementInfo shouldRunAuditTestType:]( self,  "shouldRunAuditTestType:",  AXAuditTestTypeSufficientElementDescription) & 1) != 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_561C;
    v6[3] = &unk_C5E8;
    v6[4] = self;
    -[AXAuditCategoryEmbedded testOnAllVisibleElements:](self, "testOnAllVisibleElements:", v6);
  }

  -[AXAuditTextElementInfo caseEndedForSelectorName:result:](self, "caseEndedForSelectorName:result:", v4, v5);
}

- (void)auditCheckHitTest
{
  objc_super v3 = NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditTextElementInfo caseStartedForSelectorName:](self, "caseStartedForSelectorName:", v5));
  -[AXAuditTextElementInfo shouldRunAuditTestType:](self, "shouldRunAuditTestType:", AXAuditTestTypeSwipeOrder);
  -[AXAuditTextElementInfo caseEndedForSelectorName:result:](self, "caseEndedForSelectorName:result:", v5, v4);
}

- (id)_elementsFromElement:(id)a3 direction:(int64_t)a4 withCount:(unint64_t)a5
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uiElement]);
  id v9 = v8;
  if (a4 == 1) {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 nextElementsWithCount:a5]);
  }
  else {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 previousElementsWithCount:a5]);
  }
  id v11 = (void *)v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v11 count]));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v13 = v11;
  id v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[AXElement elementWithUIElement:]( &OBJC_CLASS___AXElement,  "elementWithUIElement:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)i),  (void)v20));
        [v12 addObject:v18];
      }

      id v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v15);
  }

  return v12;
}

- (id)_elementsForElement:(id)a3 attribute:(int64_t)a4 withParameter:(id)a5
{
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a3 uiElement]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uiElementsWithAttribute:a4 parameter:v7]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v9 count]));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      id v15 = 0LL;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[AXElement elementWithUIElement:]( &OBJC_CLASS___AXElement,  "elementWithUIElement:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)v15),  (void)v18));
        if (a3) {
          [v10 addObject:v16];
        }

        id v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v13);
  }

  return v10;
}

- (id)navigationElementForElement:(id)a3 inDirection:(int64_t)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[AXAuditTextElementInfo _elementsFromElement:direction:withCount:]( self,  "_elementsFromElement:direction:withCount:",  a3,  a4,  1LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastObject]);

  return v5;
}

- (id)nextElementForElement:(id)a3
{
  return -[AXAuditTextElementInfo navigationElementForElement:inDirection:]( self,  "navigationElementForElement:inDirection:",  a3,  1LL);
}

- (id)previousElementForElement:(id)a3
{
  return -[AXAuditTextElementInfo navigationElementForElement:inDirection:]( self,  "navigationElementForElement:inDirection:",  a3,  2LL);
}

- (id)swipeOrderForElement:(id)a3 inDirection:(int64_t)a4 includeElement:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v10 = v9;
  if (v8 && v5)
  {
    [v9 addObject:v8];
    id v11 = v8;
  }

  else if (!v8)
  {
    goto LABEL_9;
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue( -[AXAuditTextElementInfo navigationElementForElement:inDirection:]( self,  "navigationElementForElement:inDirection:",  v8,  a4));
  id v13 = v8;
  if (v12)
  {
    uint64_t v14 = v8;
    do
    {
      id v13 = (void *)v12;
      [v10 addObject:v12];

      uint64_t v12 = objc_claimAutoreleasedReturnValue( -[AXAuditTextElementInfo navigationElementForElement:inDirection:]( self,  "navigationElementForElement:inDirection:",  v13,  a4));
      uint64_t v14 = v13;
    }

    while (v12);
  }

LABEL_9:
  return v10;
}

- (int64_t)_remainingElementsToAnalyze
{
  return self->__remainingElementsToAnalyze;
}

- (void)set_remainingElementsToAnalyze:(int64_t)a3
{
  self->__remainingElementsToAnalyze = a3;
}

@end