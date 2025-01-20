@interface ADAnnounceWorkoutVoiceFeedbackRequest
- (ADAnnounceWorkoutVoiceFeedbackRequest)initWithVoiceFeedbackData:(id)a3 completion:(id)a4;
- (NSDictionary)data;
- (void)setData:(id)a3;
@end

@implementation ADAnnounceWorkoutVoiceFeedbackRequest

- (ADAnnounceWorkoutVoiceFeedbackRequest)initWithVoiceFeedbackData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADAnnounceWorkoutVoiceFeedbackRequest;
  v7 = -[ADAnnouncementRequest initWithAnnouncementRequestType:platform:completion:]( &v11,  "initWithAnnouncementRequestType:platform:completion:",  1LL,  4LL,  a4);
  if (v7)
  {
    v8 = (NSDictionary *)[v6 copy];
    data = v7->_data;
    v7->_data = v8;

    -[ADAnnounceNotificationRequest setAnnouncementType:](v7, "setAnnouncementType:", 9LL);
    -[ADAnnouncementRequest setShouldSkipTriggerlessReply:](v7, "setShouldSkipTriggerlessReply:", 1LL);
    -[ADAnnouncementRequest setRequiresOpportuneTime:](v7, "setRequiresOpportuneTime:", 0LL);
  }

  return v7;
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end