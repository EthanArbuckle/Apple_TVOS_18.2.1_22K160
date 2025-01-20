@interface RTTimerManager
- (id)timerWithIdentifier:(id)a3 queue:(id)a4 handler:(id)a5;
- (id)xpcTimerAlarmWithIdentifier:(id)a3 queue:(id)a4 handler:(id)a5;
@end

@implementation RTTimerManager

- (id)timerWithIdentifier:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = -[RTTimer initWithIdentifier:queue:handler:]( objc_alloc(&OBJC_CLASS___RTTimer),  "initWithIdentifier:queue:handler:",  v9,  v8,  v7);

  return v10;
}

- (id)xpcTimerAlarmWithIdentifier:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = -[RTXPCTimerAlarm initWithIdentifier:queue:handler:]( objc_alloc(&OBJC_CLASS___RTXPCTimerAlarm),  "initWithIdentifier:queue:handler:",  v9,  v8,  v7);

  return v10;
}

@end