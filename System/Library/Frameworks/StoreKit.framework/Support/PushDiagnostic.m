@interface PushDiagnostic
- (PushDiagnostic)initWithService:(id)a3;
- (void)pushService:(id)a3 didReceiveMessage:(id)a4;
@end

@implementation PushDiagnostic

- (PushDiagnostic)initWithService:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PushDiagnostic;
  v5 = -[PushDiagnostic init](&v7, "init");
  if (v5) {
    [v4 registerConsumer:v5 forActionType:99];
  }

  return v5;
}

- (void)pushService:(id)a3 didReceiveMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10032E968 != -1) {
    dispatch_once(&qword_10032E968, &stru_1002E93E8);
  }
  v8 = (void *)qword_10032E940;
  if (os_log_type_enabled((os_log_t)qword_10032E940, OS_LOG_TYPE_ERROR)) {
    sub_100262240(v8, (uint64_t)self, (uint64_t)v7);
  }
}

@end