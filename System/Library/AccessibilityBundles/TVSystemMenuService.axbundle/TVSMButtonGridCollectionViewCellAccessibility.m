@interface TVSMButtonGridCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldSpeakExplorerElementsAfterFocus;
- (BOOL)isAccessibilityElement;
- (id)_axControlCenterModule;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation TVSMButtonGridCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSMButtonGridCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVSMButtonGridCollectionViewController"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSMButtonGridCollectionViewController",  @"_moduleAtIndexPath:",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSMButtonGridCollectionViewCellAccessibility _axControlCenterModule](self, "_axControlCenterModule"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessibilityLabel]);
  if (![v4 length])
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___TVSMButtonGridCollectionViewCellAccessibility;
    id v5 = -[TVSMButtonGridCollectionViewCellAccessibility accessibilityLabel](&v8, "accessibilityLabel");
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);

    v4 = (void *)v6;
  }

  return v4;
}

- (id)accessibilityValue
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSMButtonGridCollectionViewCellAccessibility _axControlCenterModule](self, "_axControlCenterModule"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessibilityValue]);
  if (![v4 length])
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___TVSMButtonGridCollectionViewCellAccessibility;
    id v5 = -[TVSMButtonGridCollectionViewCellAccessibility accessibilityValue](&v8, "accessibilityValue");
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);

    v4 = (void *)v6;
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSMButtonGridCollectionViewCellAccessibility _axControlCenterModule](self, "_axControlCenterModule"));
  id v4 = [v3 accessibilityTraits];
  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___TVSMButtonGridCollectionViewCellAccessibility;
    id v4 = -[TVSMButtonGridCollectionViewCellAccessibility accessibilityTraits](&v6, "accessibilityTraits");
  }

  return (unint64_t)v4;
}

- (id)_axControlCenterModule
{
  if (_axControlCenterModule_onceToken != -1) {
    dispatch_once(&_axControlCenterModule_onceToken, &__block_literal_global_1);
  }
  LOBYTE(v19) = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell, a2);
  uint64_t v4 = __UIAccessibilityCastAsClass(v3, self, 1LL, &v19);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  if ((_BYTE)v19) {
    abort();
  }
  v7 = (void *)v5;
  if (v5)
  {
    id v8 = -[TVSMButtonGridCollectionViewCellAccessibility _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  objc_opt_class(&OBJC_CLASS___UICollectionView, v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 delegate]);
    if ((objc_opt_isKindOfClass(v10, _axControlCenterModule_TVSMButtonGridCollectionViewControllerClass) & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v9 indexPathForCell:v7]);
      v12 = v11;
      if (v11 && [v11 item] != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v19 = 0LL;
        v20 = &v19;
        uint64_t v21 = 0x3032000000LL;
        v22 = __Block_byref_object_copy_;
        v23 = __Block_byref_object_dispose_;
        id v24 = 0LL;
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = __71__TVSMButtonGridCollectionViewCellAccessibility__axControlCenterModule__block_invoke_195;
        v15[3] = &unk_4268;
        v18 = &v19;
        id v16 = v10;
        id v17 = v12;
        AXPerformSafeBlock(v15);
        id v13 = (id)v20[5];

        _Block_object_dispose(&v19, 8);
      }

      else
      {
        id v13 = 0LL;
      }
    }

    else
    {
      id v13 = 0LL;
    }
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

void __71__TVSMButtonGridCollectionViewCellAccessibility__axControlCenterModule__block_invoke(id a1)
{
  _axControlCenterModule_TVSMButtonGridCollectionViewControllerClass = AXSafeClassFromString(@"TVSMButtonGridCollectionViewController");
}

void __71__TVSMButtonGridCollectionViewCellAccessibility__axControlCenterModule__block_invoke_195( uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _moduleAtIndexPath:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)_accessibilityShouldSpeakExplorerElementsAfterFocus
{
  return 0;
}

@end