@interface SCATMFIInputSource
- (BOOL)isMFIInputSource;
- (NSString)manufacturerName;
- (NSString)productName;
- (NSString)serialNumber;
- (NSString)versionNumber;
- (id)actionForButtonNumber:(int64_t)a3 withType:(id)a4;
- (id)persistentSwitchIdentifierForButtonNumber:(int64_t)a3;
- (id)switchDisplayNameForButtonNumber:(int64_t)a3;
- (id)switchSource;
- (int64_t)availableButtons;
- (int64_t)switchKeyForSwitch:(id)a3;
- (void)setAvailableButtons:(int64_t)a3;
- (void)setManufacturerName:(id)a3;
- (void)setProductName:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setVersionNumber:(id)a3;
@end

@implementation SCATMFIInputSource

- (BOOL)isMFIInputSource
{
  return 1;
}

- (id)switchSource
{
  return SCATSwitchSourceMFI;
}

- (int64_t)switchKeyForSwitch:(id)a3
{
  return (int64_t)[a3 buttonNumber];
}

- (id)actionForButtonNumber:(int64_t)a3 withType:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource actions](self, "actions"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource actions](self, "actions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v8]);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v6]);
  }

  else
  {
    _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Could not lookup action for nil event or with nil actions");
    v11 = 0LL;
  }

  return v11;
}

- (id)persistentSwitchIdentifierForButtonNumber:(int64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATHardwareInputSource persistentSwitchIdentifiers](self, "persistentSwitchIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  return v6;
}

- (id)switchDisplayNameForButtonNumber:(int64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATHardwareInputSource switchDisplayNames](self, "switchDisplayNames"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  return v6;
}

- (NSString)productName
{
  return self->_productName;
}

- (void)setProductName:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
}

- (NSString)versionNumber
{
  return self->_versionNumber;
}

- (void)setVersionNumber:(id)a3
{
}

- (int64_t)availableButtons
{
  return self->_availableButtons;
}

- (void)setAvailableButtons:(int64_t)a3
{
  self->_availableButtons = a3;
}

- (void).cxx_destruct
{
}

@end