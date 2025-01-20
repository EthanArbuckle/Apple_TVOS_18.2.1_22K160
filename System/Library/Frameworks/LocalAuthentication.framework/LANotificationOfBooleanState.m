@interface LANotificationOfBooleanState
+ (void)postNotificationWithNewBoolState:(BOOL)a3;
- (BOOL)BOOLValue;
- (BOOL)oldBoolValue;
- (id)darwinNotificationForBoolValue:(BOOL)a3;
- (id)darwinNotificationForValue:(id)a3;
@end

@implementation LANotificationOfBooleanState

- (BOOL)BOOLValue
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[LANotification value](self, "value");
    char v5 = [v4 BOOLValue];
  }

  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)darwinNotificationForValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[LANotificationOfBooleanState darwinNotificationForBoolValue:]( self,  "darwinNotificationForBoolValue:",  [v4 BOOLValue]);
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    char v5 = 0LL;
  }

  return v5;
}

- (id)darwinNotificationForBoolValue:(BOOL)a3
{
  return 0LL;
}

+ (void)postNotificationWithNewBoolState:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = (id)objc_opt_new();
  [MEMORY[0x189607968] numberWithBool:v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:v3 ^ 1];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 postNewValue:v4 oldValue:v5];
}

- (BOOL)oldBoolValue
{
  return self->_oldBoolValue;
}

@end