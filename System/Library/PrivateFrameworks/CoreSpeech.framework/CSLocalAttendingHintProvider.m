@interface CSLocalAttendingHintProvider
- (CSAttendingInitiating)initiator;
- (CSLocalAttendingHintProvider)initWithAttendingIniting:(id)a3;
- (void)postAttendingJarvisHintWithInfo:(id)a3;
- (void)postAttendingMagusNotSupportedHintWithInfo:(id)a3;
- (void)postAttendingStartHintWithInfo:(id)a3;
- (void)postAttendingStopHintWithInfo:(id)a3;
- (void)postAttendingTriggerForSiriPromptHintWithInfo:(id)a3;
- (void)postAttendingWillStartHintWithInfo:(id)a3;
- (void)setInitiator:(id)a3;
@end

@implementation CSLocalAttendingHintProvider

- (CSLocalAttendingHintProvider)initWithAttendingIniting:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CSLocalAttendingHintProvider;
  v6 = -[CSLocalAttendingHintProvider init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_initiator, a3);
  }

  return v7;
}

- (void)postAttendingWillStartHintWithInfo:(id)a3
{
}

- (void)postAttendingStartHintWithInfo:(id)a3
{
}

- (void)postAttendingStopHintWithInfo:(id)a3
{
}

- (void)postAttendingTriggerForSiriPromptHintWithInfo:(id)a3
{
}

- (void)postAttendingMagusNotSupportedHintWithInfo:(id)a3
{
}

- (void)postAttendingJarvisHintWithInfo:(id)a3
{
}

- (CSAttendingInitiating)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end