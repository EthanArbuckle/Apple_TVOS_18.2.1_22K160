@interface TTSTraceServer
+ (_TtC9axassetsd14TTSTraceServer)shared;
+ (void)setShared:(id)a3;
- (_TtC9axassetsd14TTSTraceServer)init;
@end

@implementation TTSTraceServer

+ (_TtC9axassetsd14TTSTraceServer)shared
{
  if (qword_100027A58 != -1) {
    swift_once(&qword_100027A58, sub_1000120DC);
  }
  swift_beginAccess(&qword_100027A60, v3, 0LL, 0LL);
  return (_TtC9axassetsd14TTSTraceServer *)(id)qword_100027A60;
}

+ (void)setShared:(id)a3
{
  uint64_t v3 = qword_100027A58;
  id v4 = a3;
  if (v3 != -1) {
    swift_once(&qword_100027A58, sub_1000120DC);
  }
  swift_beginAccess(&qword_100027A60, v6, 1LL, 0LL);
  v5 = (void *)qword_100027A60;
  qword_100027A60 = (uint64_t)v4;
}

- (_TtC9axassetsd14TTSTraceServer)init
{
  return (_TtC9axassetsd14TTSTraceServer *)sub_100012450();
}

- (void).cxx_destruct
{
}

@end