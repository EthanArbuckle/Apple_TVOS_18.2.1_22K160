@interface _DASResultDependencyPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASActivityDependencyManager)dependencyManager;
- (_DASResultDependencyPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setDependencyManager:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASResultDependencyPolicy

+ (id)policyInstance
{
  if (qword_1001575A8 != -1) {
    dispatch_once(&qword_1001575A8, &stru_100115420);
  }
  return (id)qword_1001575B0;
}

- (_DASResultDependencyPolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____DASResultDependencyPolicy;
  v2 = -[_DASResultDependencyPolicy init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Result Dependency Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[_DASActivityDependencyManager sharedInstance]( &OBJC_CLASS____DASActivityDependencyManager,  "sharedInstance"));
    dependencyManager = v3->_dependencyManager;
    v3->_dependencyManager = (_DASActivityDependencyManager *)v5;
  }

  return v3;
}

- (BOOL)appliesToActivity:(id)a3
{
  return -[_DASActivityDependencyManager isDependentActivity:](self->_dependencyManager, "isDependentActivity:", a3);
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  BOOL v5 = -[_DASActivityDependencyManager areDependenciesSatisfiedFor:]( self->_dependencyManager,  "areDependenciesSatisfiedFor:",  a3,  a4);
  v6 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  self->_policyName);
  if (v5) {
    uint64_t v7 = 0LL;
  }
  else {
    uint64_t v7 = 100LL;
  }
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"dependencySatisfaction == %@",  v8));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v6, "addRationaleWithCondition:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v7,  v6,  (double)0x384uLL));
  return v10;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (double)weightForActivity:(id)a3
{
  return 0.001;
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
}

- (_DASActivityDependencyManager)dependencyManager
{
  return self->_dependencyManager;
}

- (void)setDependencyManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end