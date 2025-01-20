@interface MRDTimingEvents
- (MRDTimingEvent)condensedEvent;
- (NSArray)orderedEvents;
- (NSError)firstError;
- (NSNumber)totalDuration;
- (_TtC12mediaremoted15MRDTimingEvents)init;
@end

@implementation MRDTimingEvents

- (NSArray)orderedEvents
{
  result = (NSArray *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000028LL,  0x800000010033D3B0LL,  "mediaremoted/Analytics.swift",  28LL,  2LL,  91LL,  0);
  __break(1u);
  return result;
}

- (NSNumber)totalDuration
{
  v2 = self;
  sub_1002035B8();
  Class isa = Double._bridgeToObjectiveC()().super.super.isa;

  return (NSNumber *)isa;
}

- (NSError)firstError
{
  v2 = self;
  uint64_t v3 = sub_100203F50();

  if (v3)
  {
    v4 = (void *)_convertErrorToNSError(_:)(v3);
    swift_errorRelease(v3);
  }

  else
  {
    v4 = 0LL;
  }

  return (NSError *)v4;
}

- (MRDTimingEvent)condensedEvent
{
  v2 = self;
  uint64_t v3 = (void *)sub_10020420C();

  return (MRDTimingEvent *)v3;
}

- (_TtC12mediaremoted15MRDTimingEvents)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MRDTimingEvents();
  return -[MRDTimingEvents init](&v3, "init");
}

@end