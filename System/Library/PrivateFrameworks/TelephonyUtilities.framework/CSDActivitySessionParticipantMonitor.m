@interface CSDActivitySessionParticipantMonitor
- (_TtC13callservicesd36CSDActivitySessionParticipantMonitor)init;
- (_TtC13callservicesd36CSDActivitySessionParticipantMonitor)initWithActivitySessionManager:(id)a3;
- (void)evaluateConversation:(id)a3;
@end

@implementation CSDActivitySessionParticipantMonitor

- (_TtC13callservicesd36CSDActivitySessionParticipantMonitor)initWithActivitySessionManager:(id)a3
{
  return (_TtC13callservicesd36CSDActivitySessionParticipantMonitor *)sub_100275584(a3);
}

- (void)evaluateConversation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100275660(v4);
}

- (_TtC13callservicesd36CSDActivitySessionParticipantMonitor)init
{
}

- (void).cxx_destruct
{
  sub_1001B0438((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC13callservicesd36CSDActivitySessionParticipantMonitor_topicTerminationRequestProvider));
}

@end