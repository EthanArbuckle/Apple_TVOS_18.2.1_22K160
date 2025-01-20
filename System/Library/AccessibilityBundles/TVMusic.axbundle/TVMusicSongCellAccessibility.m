@interface TVMusicSongCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVMusicSongCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVMusicSongCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicSongCell",  @"title",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicSongCell",  @"artist",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicSongCell",  @"durationString",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicSongCell",  @"isExplicit",  "B",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicSongCell",  @"hasOrdinal",  "B",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicSongCell",  @"ordinalValue",  "Q",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicSongCell",  @"_hasVideoBadge",  "B",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (id)accessibilityLabel
{
  char v35 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"title"));
  uint64_t v5 = __UIAccessibilityCastAsClass(v3, v4, 1LL, &v35);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v35) {
    goto LABEL_18;
  }
  char v34 = 0;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"artist"));
  uint64_t v10 = __UIAccessibilityCastAsClass(v8, v9, 1LL, &v34);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v34
    || (char v33 = 0,
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v12),
        v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicSongCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"durationString")),  uint64_t v15 = __UIAccessibilityCastAsClass(v13, v14, 1LL, &v33),  v16 = (void *)objc_claimAutoreleasedReturnValue(v15),  v14,  v33))
  {
LABEL_18:
    abort();
  }

  if ([v16 length])
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[AXAttributedString axAttributedStringWithString:]( &OBJC_CLASS___AXAttributedString,  "axAttributedStringWithString:",  v16));
    [v17 setAttribute:kCFBooleanTrue forKey:UIAccessibilityTokenDurationTimeMMSS];

    v16 = v17;
  }

  unsigned int v18 = -[TVMusicSongCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", @"isExplicit");
  unsigned int v19 = -[TVMusicSongCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", @"hasOrdinal");
  unsigned int v20 = -[TVMusicSongCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", @"_hasVideoBadge");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSongCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"ordinalValue"));
  id v22 = [v21 unsignedIntegerValue];

  if (v18)
  {
    id v23 = accessibilityLocalizedString(@"explicit.attribute.label");
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if (!v20)
    {
LABEL_8:
      v25 = 0LL;
      goto LABEL_11;
    }
  }

  else
  {
    v24 = 0LL;
    if (!v20) {
      goto LABEL_8;
    }
  }

  id v26 = accessibilityLocalizedString(@"video.attribute.label");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v26);
LABEL_11:
  if (v22) {
    unsigned int v27 = v19;
  }
  else {
    unsigned int v27 = 0;
  }
  if (v27 == 1)
  {
    uint64_t v28 = AXFormatInteger(v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  }

  else
  {
    v29 = 0LL;
  }

  uint64_t v30 = __UIAXStringForVariables(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

  return v31;
}

@end