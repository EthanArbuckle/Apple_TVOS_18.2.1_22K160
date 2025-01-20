@interface PBSceneDeferralTargetAssertion
- (PBSceneDeferralTargetAssertion)initWithSceneHandle:(id)a3 reason:(id)a4;
- (PBSceneHandle)sceneHandle;
@end

@implementation PBSceneDeferralTargetAssertion

- (PBSceneDeferralTargetAssertion)initWithSceneHandle:(id)a3 reason:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PBSceneDeferralTargetAssertion;
  v11 = -[PBSceneDeferralTargetAssertion initWithIdentifier:forReason:invalidationBlock:]( &v14,  "initWithIdentifier:forReason:invalidationBlock:",  v10,  v8,  &stru_1003D82B0);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_sceneHandle, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    [v12 addSceneDeferralTargetAssertion:v11];
  }

  return v11;
}

- (PBSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (void).cxx_destruct
{
}

@end