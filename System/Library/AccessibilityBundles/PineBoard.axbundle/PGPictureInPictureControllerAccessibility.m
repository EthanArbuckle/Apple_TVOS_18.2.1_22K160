@interface PGPictureInPictureControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)stopPictureInPictureForApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
@end

@implementation PGPictureInPictureControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PGPictureInPictureController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)stopPictureInPictureForApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __140__PGPictureInPictureControllerAccessibility_stopPictureInPictureForApplication_sceneSessionPersistentIdentifier_animated_completionHandler___block_invoke;
  v15[3] = &unk_8338;
  id v16 = a6;
  id v10 = v16;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_retainBlock(v15);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PGPictureInPictureControllerAccessibility;
  -[PGPictureInPictureControllerAccessibility stopPictureInPictureForApplication:sceneSessionPersistentIdentifier:animated:completionHandler:]( &v14,  "stopPictureInPictureForApplication:sceneSessionPersistentIdentifier:animated:completionHandler:",  v12,  v11,  v6,  v13);
}

void __140__PGPictureInPictureControllerAccessibility_stopPictureInPictureForApplication_sceneSessionPersistentIdentifier_animated_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  id v9 = v5;
  if ((_DWORD)a2)
  {
    id v6 = accessibilityLocalizedString(@"pip.action.completion.expanded");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    UIAccessibilitySpeakAndDoNotBeInterrupted(v7);

    id v5 = v9;
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v9);
    id v5 = v9;
  }
}

@end