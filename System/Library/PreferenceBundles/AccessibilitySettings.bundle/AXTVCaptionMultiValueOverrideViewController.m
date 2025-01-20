@interface AXTVCaptionMultiValueOverrideViewController
- (AXTVCaptionStyle)style;
- (NSArray)availableValues;
- (NSString)overrideDescription;
- (NSString)overrideKey;
- (NSString)valueKey;
- (TSKMappingFormatter)formatter;
- (id)defaultValue;
- (id)loadSettingGroups;
- (void)setAvailableValues:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)setFormatter:(id)a3;
- (void)setOverrideDescription:(id)a3;
- (void)setOverrideKey:(id)a3;
- (void)setStyle:(id)a3;
- (void)setValueKey:(id)a3;
@end

@implementation AXTVCaptionMultiValueOverrideViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionMultiValueOverrideViewController formatter](self, "formatter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionMultiValueOverrideViewController defaultValue](self, "defaultValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVCaptionUtilities defaultValueFormatterWithFormatter:defaultValue:]( &OBJC_CLASS___AXTVCaptionUtilities,  "defaultValueFormatterWithFormatter:defaultValue:",  v3,  v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionMultiValueOverrideViewController availableValues](self, "availableValues"));
  if (!v6) {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 inputs]);
  }
  v7 = objc_alloc(&OBJC_CLASS___AXValueAwareRadioSettingGroup);
  style = self->_style;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionMultiValueOverrideViewController valueKey](self, "valueKey"));
  v10 = -[AXValueAwareRadioSettingGroup initWithTitle:representedObject:keyPath:availableValues:]( v7,  "initWithTitle:representedObject:keyPath:availableValues:",  0LL,  style,  v9,  v6);

  -[AXValueAwareRadioSettingGroup setLocalizedValueFormatter:](v10, "setLocalizedValueFormatter:", v5);
  id v11 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  id v19 = AXTVLocString(@"AXCaptionVideoOverrideSectionTitle", v12, v13, v14, v15, v16, v17, v18, v38[0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v21 = [v11 initWithTitle:v20];

  id v29 = AXTVLocString(@"AXCAptionVideoOverrideTitle", v22, v23, v24, v25, v26, v27, v28, v38[0]);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  overrideDescription = self->_overrideDescription;
  v32 = self->_style;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionMultiValueOverrideViewController overrideKey](self, "overrideKey"));
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v30,  overrideDescription,  v32,  v33,  0LL,  0LL));

  v39 = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v39, 1LL));
  [v21 setSettingItems:v35];

  v38[0] = (uint64_t)v10;
  v38[1] = (uint64_t)v21;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 2LL));

  return v36;
}

- (AXTVCaptionStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (NSString)valueKey
{
  return self->_valueKey;
}

- (void)setValueKey:(id)a3
{
}

- (NSString)overrideKey
{
  return self->_overrideKey;
}

- (void)setOverrideKey:(id)a3
{
}

- (NSString)overrideDescription
{
  return self->_overrideDescription;
}

- (void)setOverrideDescription:(id)a3
{
}

- (NSArray)availableValues
{
  return self->_availableValues;
}

- (void)setAvailableValues:(id)a3
{
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
}

- (TSKMappingFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end