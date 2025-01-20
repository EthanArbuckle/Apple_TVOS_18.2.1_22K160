@interface AXTVEnableSettingWithDurationViewController
- (AXTVEnableSettingWithDurationViewController)initWithCoder:(id)a3;
- (AXTVEnableSettingWithDurationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AXTVEnableSettingWithDurationViewController)initWithStyle:(int64_t)a3;
- (AXTVEnableSettingWithDurationViewController)initWithTitle:(id)a3 description:(id)a4 featureOnOffKey:(id)a5 featureDurationKey:(id)a6 featureDurationAdjustmentInstructions:(id)a7 minimumDuration:(double)a8 maximumDuration:(double)a9 discreteAdjustmentValue:(double)a10;
- (NSArray)additionalSettingsItems;
- (NSString)featureDurationAdjustmentInstructions;
- (NSString)featureDurationKey;
- (NSString)featureOnOffKey;
- (NSString)settingDescription;
- (NSString)settingDurationTitle;
- (NSString)settingTitle;
- (double)discreteAdjustmentValue;
- (double)maximumDuration;
- (double)mimimumDuration;
- (id)_featureDurationGroup;
- (id)_featureOnOffGroup;
- (id)loadSettingGroups;
- (void)_featureOnOffCellWasToggled:(id)a3;
- (void)setAdditionalSettingsItems:(id)a3;
- (void)setDiscreteAdjustmentValue:(double)a3;
- (void)setFeatureDurationAdjustmentInstructions:(id)a3;
- (void)setFeatureDurationKey:(id)a3;
- (void)setFeatureOnOffKey:(id)a3;
- (void)setMaximumDuration:(double)a3;
- (void)setMimimumDuration:(double)a3;
- (void)setSettingDescription:(id)a3;
- (void)setSettingDurationTitle:(id)a3;
- (void)setSettingTitle:(id)a3;
@end

@implementation AXTVEnableSettingWithDurationViewController

- (AXTVEnableSettingWithDurationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0LL;
}

- (AXTVEnableSettingWithDurationViewController)initWithCoder:(id)a3
{
  return 0LL;
}

- (AXTVEnableSettingWithDurationViewController)initWithStyle:(int64_t)a3
{
  return 0LL;
}

- (AXTVEnableSettingWithDurationViewController)initWithTitle:(id)a3 description:(id)a4 featureOnOffKey:(id)a5 featureDurationKey:(id)a6 featureDurationAdjustmentInstructions:(id)a7 minimumDuration:(double)a8 maximumDuration:(double)a9 discreteAdjustmentValue:(double)a10
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___AXTVEnableSettingWithDurationViewController;
  v23 = -[AXTVEnableSettingWithDurationViewController initWithStyle:](&v26, "initWithStyle:", 1LL);
  v24 = v23;
  if (v23)
  {
    -[AXTVEnableSettingWithDurationViewController setSettingTitle:](v23, "setSettingTitle:", v18);
    -[AXTVEnableSettingWithDurationViewController setTitle:](v24, "setTitle:", v18);
    -[AXTVEnableSettingWithDurationViewController setSettingDescription:](v24, "setSettingDescription:", v19);
    -[AXTVEnableSettingWithDurationViewController setFeatureOnOffKey:](v24, "setFeatureOnOffKey:", v20);
    -[AXTVEnableSettingWithDurationViewController setFeatureDurationKey:](v24, "setFeatureDurationKey:", v21);
    -[AXTVEnableSettingWithDurationViewController setFeatureDurationAdjustmentInstructions:]( v24,  "setFeatureDurationAdjustmentInstructions:",  v22);
    -[AXTVEnableSettingWithDurationViewController setMimimumDuration:](v24, "setMimimumDuration:", a8);
    -[AXTVEnableSettingWithDurationViewController setMaximumDuration:](v24, "setMaximumDuration:", a9);
    -[AXTVEnableSettingWithDurationViewController setDiscreteAdjustmentValue:](v24, "setDiscreteAdjustmentValue:", a10);
  }

  return v24;
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVEnableSettingWithDurationViewController _featureOnOffGroup](self, "_featureOnOffGroup"));
  [v3 axSafelyAddObject:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVEnableSettingWithDurationViewController _featureDurationGroup](self, "_featureDurationGroup"));
  [v3 axSafelyAddObject:v5];

  id v6 = [[TSKSettingGroup alloc] initWithTitle:0];
  v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVEnableSettingWithDurationViewController additionalSettingsItems](self, "additionalSettingsItems"));
  -[NSMutableArray axSafelyAddObjectsFromArray:](v7, "axSafelyAddObjectsFromArray:", v8);

  [v6 setSettingItems:v7];
  [v3 axSafelyAddObject:v6];

  return v3;
}

- (id)_featureOnOffGroup
{
  id v3 = [[TSKSettingGroup alloc] initWithTitle:0];
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVEnableSettingWithDurationViewController settingTitle](self, "settingTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVEnableSettingWithDurationViewController featureOnOffKey](self, "featureOnOffKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v6,  0LL,  v5,  v7,  self,  "_featureOnOffCellWasToggled:"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVEnableSettingWithDurationViewController settingDescription](self, "settingDescription"));
  [v8 setLocalizedDescription:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils BOOLeanOnOffFormatter](&OBJC_CLASS___AXTVUtils, "BOOLeanOnOffFormatter"));
  [v8 setLocalizedValueFormatter:v10];

  -[NSMutableArray addObject:](v4, "addObject:", v8);
  [v3 setSettingItems:v4];

  return v3;
}

- (id)_featureDurationGroup
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v5 = [[TSKSettingGroup alloc] initWithTitle:0];
  objc_initWeak(&from, v5);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_91C0;
  v18[3] = &unk_653D0;
  objc_copyWeak(&v19, &from);
  objc_copyWeak(&v20, &location);
  [v5 setUpdateBlock:v18];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVEnableSettingWithDurationViewController settingDurationTitle](self, "settingDurationTitle"));
  if (![v6 length])
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[AXTVEnableSettingWithDurationViewController settingTitle](self, "settingTitle"));

    id v6 = (void *)v7;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVEnableSettingWithDurationViewController featureDurationKey](self, "featureDurationKey"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_9264;
  v14[3] = &unk_65440;
  id v9 = v6;
  id v15 = v9;
  objc_copyWeak(&v17, &location);
  id v10 = v3;
  id v16 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v9,  0LL,  v10,  v8,  v14));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils shortStyleDurationFormatter](&OBJC_CLASS___AXTVUtils, "shortStyleDurationFormatter"));
  [v11 setLocalizedValueFormatter:v12];

  -[NSMutableArray addObject:](v4, "addObject:", v11);
  [v5 setSettingItems:v4];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
  return v5;
}

- (void)_featureOnOffCellWasToggled:(id)a3
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVEnableSettingWithDurationViewController featureOnOffKey](self, "featureOnOffKey"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForKey:v4]);
  unsigned int v6 = [v5 BOOLValue];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6 ^ 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVEnableSettingWithDurationViewController featureOnOffKey](self, "featureOnOffKey"));
  [v9 setValue:v7 forKey:v8];

  -[AXTVEnableSettingWithDurationViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

- (NSString)settingDurationTitle
{
  return self->_settingDurationTitle;
}

- (void)setSettingDurationTitle:(id)a3
{
}

- (NSArray)additionalSettingsItems
{
  return self->_additionalSettingsItems;
}

- (void)setAdditionalSettingsItems:(id)a3
{
}

- (NSString)settingTitle
{
  return self->_settingTitle;
}

- (void)setSettingTitle:(id)a3
{
}

- (NSString)settingDescription
{
  return self->_settingDescription;
}

- (void)setSettingDescription:(id)a3
{
}

- (NSString)featureOnOffKey
{
  return self->_featureOnOffKey;
}

- (void)setFeatureOnOffKey:(id)a3
{
}

- (NSString)featureDurationKey
{
  return self->_featureDurationKey;
}

- (void)setFeatureDurationKey:(id)a3
{
}

- (NSString)featureDurationAdjustmentInstructions
{
  return self->_featureDurationAdjustmentInstructions;
}

- (void)setFeatureDurationAdjustmentInstructions:(id)a3
{
}

- (double)mimimumDuration
{
  return self->_mimimumDuration;
}

- (void)setMimimumDuration:(double)a3
{
  self->_mimimumDuration = a3;
}

- (double)maximumDuration
{
  return self->_maximumDuration;
}

- (void)setMaximumDuration:(double)a3
{
  self->_maximumDuration = a3;
}

- (double)discreteAdjustmentValue
{
  return self->_discreteAdjustmentValue;
}

- (void)setDiscreteAdjustmentValue:(double)a3
{
  self->_discreteAdjustmentValue = a3;
}

- (void).cxx_destruct
{
}

@end