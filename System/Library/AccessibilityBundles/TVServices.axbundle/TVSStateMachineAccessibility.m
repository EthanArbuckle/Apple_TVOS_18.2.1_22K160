@interface TVSStateMachineAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_transitionToState:(id)a3 withEvent:(id)a4 context:(id)a5 userInfo:(id)a6;
@end

@implementation TVSStateMachineAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSStateMachine";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSStateMachine",  @"_transitionToState:withEvent:context:userInfo:",  "v",  "@",  "@",  "@",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSStateMachine",  @"currentState",  "@",  0);
}

- (void)_transitionToState:(id)a3 withEvent:(id)a4 context:(id)a5 userInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSStateMachineAccessibility safeStringForKey:](self, "safeStringForKey:", @"currentState"));
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TVSStateMachineAccessibility;
  -[TVSStateMachineAccessibility _transitionToState:withEvent:context:userInfo:]( &v23,  "_transitionToState:withEvent:context:userInfo:",  v10,  v11,  v13,  v12);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = __78__TVSStateMachineAccessibility__transitionToState_withEvent_context_userInfo___block_invoke;
  v18[3] = &unk_40F8;
  id v19 = v14;
  id v20 = v10;
  id v21 = v11;
  v22 = self;
  id v15 = v11;
  id v16 = v10;
  id v17 = v14;
  AXPerformBlockOnMainThread(v18);
}

void __78__TVSStateMachineAccessibility__transitionToState_withEvent_context_userInfo___block_invoke( uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ([*(id *)(a1 + 32) length]) {
    [v3 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"fromState"];
  }
  if ([*(id *)(a1 + 40) length]) {
    [v3 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"toState"];
  }
  if ([*(id *)(a1 + 48) length]) {
    [v3 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"event"];
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v2 postNotificationName:@"AXTVSStateMachineDidTransitionToState" object:*(void *)(a1 + 56) userInfo:v3];
}

@end