@interface AXValueAwareRadioSettingGroup
- (AXTVColorInfo)_colorInfoForColor:(SEL)a3;
- (BOOL)_color:(id)a3 isRoughlyEqualTo:(id)a4;
- (void)_updateCheckmarkForItem:(id)a3 value:(id)a4;
@end

@implementation AXValueAwareRadioSettingGroup

- (AXTVColorInfo)_colorInfoForColor:(SEL)a3
{
  id v5 = a4;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  retstr->var8 = 0.0;
  *(_OWORD *)&retstr->var4 = 0u;
  id v10 = v5;
  if ([v5 getRed:&retstr->var3 green:&retstr->var4 blue:&retstr->var5 alpha:&retstr->var2])
  {
    int64_t v6 = 2LL;
LABEL_5:
    v7 = v10;
    goto LABEL_6;
  }

  if ([v10 getHue:&retstr->var6 saturation:&retstr->var7 brightness:&retstr->var8 alpha:&retstr->var2])
  {
    int64_t v6 = 3LL;
    goto LABEL_5;
  }

  unsigned int v9 = [v10 getWhite:&retstr->var1 alpha:&retstr->var2];
  v7 = v10;
  if (!v9) {
    goto LABEL_7;
  }
  int64_t v6 = 1LL;
LABEL_6:
  retstr->var0 = v6;
LABEL_7:

  return result;
}

- (BOOL)_color:(id)a3 isRoughlyEqualTo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___UIColor);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {
    v11 = @"Expected color1 to be some kind of UIColor";
    uint64_t v12 = 98LL;
LABEL_10:
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ATVAccessibility/settings/AccessibilitySettings/source/AXValueAwareRadioSettingGroup.m",  v12,  "-[AXValueAwareRadioSettingGroup _color:isRoughlyEqualTo:]",  v11);
    goto LABEL_11;
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___UIColor);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0)
  {
    v11 = @"Expected color2 to be some kind of UIColor";
    uint64_t v12 = 103LL;
    goto LABEL_10;
  }

  -[AXValueAwareRadioSettingGroup _colorInfoForColor:](self, "_colorInfoForColor:", v6);
  -[AXValueAwareRadioSettingGroup _colorInfoForColor:](self, "_colorInfoForColor:", v7);
  if (v26 != v17) {
    goto LABEL_11;
  }
  switch(v26)
  {
    case 3LL:
      if (vabdd_f64(v32, v23) >= 0.001 || vabdd_f64(v33, v24) >= 0.001) {
        goto LABEL_11;
      }
      double v15 = v34;
      double v16 = v25;
      break;
    case 2LL:
      if (vabdd_f64(v29, v20) >= 0.001 || vabdd_f64(v30, v21) >= 0.001) {
        goto LABEL_11;
      }
      double v15 = v31;
      double v16 = v22;
      break;
    case 1LL:
      double v10 = vabdd_f64(v27, v18);
      goto LABEL_20;
    default:
      goto LABEL_11;
  }

  double v10 = vabdd_f64(v15, v16);
LABEL_20:
  if (v10 < 0.001)
  {
    BOOL v13 = vabdd_f64(v28, v19) < 0.001;
    goto LABEL_12;
  }

- (void)_updateCheckmarkForItem:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 representedObject]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___UIColor);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0
    && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___UIColor), (objc_opt_isKindOfClass(v7, v10) & 1) != 0))
  {
    unsigned __int8 v11 = [v6 accessoryTypes];
    if (((-[AXValueAwareRadioSettingGroup _color:isRoughlyEqualTo:](self, "_color:isRoughlyEqualTo:", v8, v7) ^ ((v11 & 2) == 0LL)) & 1) == 0) {
      objc_msgSend(v6, "setAccessoryTypes:", (unint64_t)objc_msgSend(v6, "accessoryTypes") ^ 2);
    }
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___AXValueAwareRadioSettingGroup;
    -[AXValueAwareRadioSettingGroup _updateCheckmarkForItem:value:](&v12, "_updateCheckmarkForItem:value:", v6, v7);
  }
}

@end