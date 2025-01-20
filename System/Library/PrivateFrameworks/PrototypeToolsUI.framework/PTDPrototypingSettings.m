@interface PTDPrototypingSettings
+ (id)settingsControllerModule;
- (BOOL)preventLockover;
- (void)setDefaultValues;
- (void)setPreventLockover:(BOOL)a3;
@end

@implementation PTDPrototypingSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PTDPrototypingSettings;
  -[PTDPrototypingSettings setDefaultValues](&v3, "setDefaultValues");
  -[PTDPrototypingSettings setPreventLockover:](self, "setPreventLockover:", 0LL);
}

+ (id)settingsControllerModule
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[PTSwitchRow rowWithTitle:valueKeyPath:]( &OBJC_CLASS___PTSwitchRow,  "rowWithTitle:valueKeyPath:",  @"Prevent Screen Dim",  @"preventLockover"));
  v9 = v2;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:](&OBJC_CLASS___PTModule, "sectionWithRows:", v3));
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[PTModule moduleWithTitle:contents:]( &OBJC_CLASS___PTModule,  "moduleWithTitle:contents:",  &stru_100014E20,  v5));

  return v6;
}

- (BOOL)preventLockover
{
  return self->_preventLockover;
}

- (void)setPreventLockover:(BOOL)a3
{
  self->_preventLockover = a3;
}

@end