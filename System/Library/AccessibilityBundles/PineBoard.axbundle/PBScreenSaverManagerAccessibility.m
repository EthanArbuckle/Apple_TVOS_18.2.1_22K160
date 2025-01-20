@interface PBScreenSaverManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)dismissScreenSaver;
- (void)activateScreenSaverFromUserAction:(BOOL)a3 forPosterBundleID:(id)a4 completion:(id)a5;
@end

@implementation PBScreenSaverManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBScreenSaverManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBScreenSaverManager",  @"activateScreenSaverFromUserAction: forPosterBundleID: completion:",  "v",  "B",  "@",  "@?",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBScreenSaverManager",  @"dismissScreenSaver",  "B",  0);
}

- (void)activateScreenSaverFromUserAction:(BOOL)a3 forPosterBundleID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __100__PBScreenSaverManagerAccessibility_activateScreenSaverFromUserAction_forPosterBundleID_completion___block_invoke;
  v12[3] = &unk_8258;
  id v13 = a5;
  id v8 = v13;
  id v9 = a4;
  v10 = objc_retainBlock(v12);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBScreenSaverManagerAccessibility;
  -[PBScreenSaverManagerAccessibility activateScreenSaverFromUserAction:forPosterBundleID:completion:]( &v11,  "activateScreenSaverFromUserAction:forPosterBundleID:completion:",  v6,  v9,  v10);
}

uint64_t __100__PBScreenSaverManagerAccessibility_activateScreenSaverFromUserAction_forPosterBundleID_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (BOOL)dismissScreenSaver
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBScreenSaverManagerAccessibility;
  BOOL v2 = -[PBScreenSaverManagerAccessibility dismissScreenSaver](&v4, "dismissScreenSaver");
  if (v2) {
    AXPerformBlockOnMainThreadAfterDelay(&__block_literal_global, 0.5);
  }
  return v2;
}

void __55__PBScreenSaverManagerAccessibility_dismissScreenSaver__block_invoke(id a1)
{
}

@end