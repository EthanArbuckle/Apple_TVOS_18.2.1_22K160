@interface TVSettingsUserErrorPresenter
- (_TtC10TVSettings28TVSettingsUserErrorPresenter)init;
- (id)addUserFailedAlertForError:(id)a3;
- (id)repairUserFailedAlertForError:(id)a3 copyStyle:(int64_t)a4;
- (id)signInServiceFailedAlertForError:(id)a3;
@end

@implementation TVSettingsUserErrorPresenter

- (id)addUserFailedAlertForError:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1000F38C0((uint64_t)v4);

  return v6;
}

- (id)signInServiceFailedAlertForError:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1000F3D74((uint64_t)v4);

  return v6;
}

- (id)repairUserFailedAlertForError:(id)a3 copyStyle:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  v8 = (void *)sub_1000F33C4((uint64_t)v6, a4);

  return v8;
}

- (_TtC10TVSettings28TVSettingsUserErrorPresenter)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TVSettingsUserErrorPresenter();
  return -[TVSettingsUserErrorPresenter init](&v3, "init");
}

@end