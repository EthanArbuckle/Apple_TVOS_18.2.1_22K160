@interface AXAuditCategoryGeneral
- (BOOL)supportAuditGroup:(unint64_t)a3;
- (id)allSupportedAuditTypes;
- (id)caseSelectorsForAuditing;
- (void)auditHitUISize;
@end

@implementation AXAuditCategoryGeneral

- (id)caseSelectorsForAuditing
{
  if (qword_10B30 != -1) {
    dispatch_once(&qword_10B30, &stru_C608);
  }
  return (id)qword_10B28;
}

- (id)allSupportedAuditTypes
{
  if (qword_10B40 != -1) {
    dispatch_once(&qword_10B40, &stru_C628);
  }
  return (id)qword_10B38;
}

- (BOOL)supportAuditGroup:(unint64_t)a3
{
  return a3 & 1;
}

- (void)auditHitUISize
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXAuditCategoryGeneral caseStartedForSelectorName:](self, "caseStartedForSelectorName:", v4));
  if ((-[AXAuditCategoryGeneral shouldRunAuditTestType:]( self,  "shouldRunAuditTestType:",  AXAuditTestTypeHitRegion) & 1) != 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_5D58;
    v6[3] = &unk_C5E8;
    v6[4] = self;
    -[AXAuditCategoryEmbedded testOnAllVisibleElements:](self, "testOnAllVisibleElements:", v6);
  }

  -[AXAuditCategoryGeneral caseEndedForSelectorName:result:](self, "caseEndedForSelectorName:result:", v4, v5);
}

@end