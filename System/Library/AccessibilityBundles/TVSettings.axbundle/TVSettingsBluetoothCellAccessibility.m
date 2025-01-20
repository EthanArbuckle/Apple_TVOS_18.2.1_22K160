@interface TVSettingsBluetoothCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityValue;
@end

@implementation TVSettingsBluetoothCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSettingsBluetoothCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVSettingsBluetoothCell" hasInstanceVariable:@"_bluetoothDevice" withType:"TVSBluetoothDevice"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSBluetoothDevice",  @"batteryLevel",  "q",  0);
}

- (id)accessibilityValue
{
  char v21 = 0;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsBluetoothCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"_bluetoothDevice"));
  uint64_t v4 = __UIAccessibilitySafeClass(@"TVSBluetoothDevice", v3, 1LL, &v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  if (v21) {
    abort();
  }
  uint64_t v6 = (uint64_t)[v5 batteryLevel];
  v7 = (char *)[v5 state];
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsBluetoothCellAccessibility safeStringForKey:]( self,  "safeStringForKey:",  @"accessibilityValue_TSKTableViewTextCell"));
  if ((v6 & 0x8000000000000000LL) == 0 && v7 == (_BYTE *)&dword_0 + 2)
  {
    if ([v5 isCharging])
    {
      id v9 = accessibilityLocalizedString(@"device.charging");
      v19 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v10 = __UIAXStringForVariables(v8);
      uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);

      v8 = (void *)v11;
    }

    id v12 = accessibilityLocalizedString(@"battery.percent.device");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v14 = AXFormatFloatWithPercentage(0LL, (float)v6 / 100.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v13, v15));
    uint64_t v16 = __UIAXStringForVariables(v8);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);

    v8 = (void *)v17;
  }

  return v8;
}

@end