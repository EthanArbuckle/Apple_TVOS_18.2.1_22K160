@interface JSValue
- (void)_IAM_setConstantValue:(id)a3 forProperty:(id)a4;
@end

@implementation JSValue

- (void)_IAM_setConstantValue:(id)a3 forProperty:(id)a4
{
  v9[0] = JSPropertyDescriptorValueKey;
  v9[1] = JSPropertyDescriptorWritableKey;
  v10[0] = a3;
  v10[1] = &__kCFBooleanFalse;
  v9[2] = JSPropertyDescriptorEnumerableKey;
  v9[3] = JSPropertyDescriptorConfigurableKey;
  v10[2] = &__kCFBooleanFalse;
  v10[3] = &__kCFBooleanFalse;
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  4LL));

  -[JSValue defineProperty:descriptor:](self, "defineProperty:descriptor:", v6, v8);
}

@end