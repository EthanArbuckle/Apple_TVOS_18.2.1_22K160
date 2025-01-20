@interface ADAnnounceWorkoutReminderRequest
- (ADAnnounceWorkoutReminderRequest)initWithWorkoutReminder:(id)a3 completion:(id)a4;
- (AFSiriWorkoutReminder)workoutReminder;
- (void)setWorkoutReminder:(id)a3;
@end

@implementation ADAnnounceWorkoutReminderRequest

- (ADAnnounceWorkoutReminderRequest)initWithWorkoutReminder:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADAnnounceWorkoutReminderRequest;
  v7 = -[ADAnnouncementRequest initWithAnnouncementRequestType:platform:completion:]( &v11,  "initWithAnnouncementRequestType:platform:completion:",  1LL,  1LL,  a4);
  if (v7)
  {
    v8 = (AFSiriWorkoutReminder *)[v6 copy];
    workoutReminder = v7->_workoutReminder;
    v7->_workoutReminder = v8;

    -[ADAnnounceNotificationRequest setAnnouncementType:](v7, "setAnnouncementType:", 8LL);
    -[ADAnnouncementRequest setRequiresOpportuneTime:](v7, "setRequiresOpportuneTime:", 0LL);
  }

  return v7;
}

- (AFSiriWorkoutReminder)workoutReminder
{
  return self->_workoutReminder;
}

- (void)setWorkoutReminder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end