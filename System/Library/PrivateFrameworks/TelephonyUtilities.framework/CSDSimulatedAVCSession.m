@interface CSDSimulatedAVCSession
- (BOOL)containsRemoteParticipantWithIdentifier:(unint64_t)a3;
- (BOOL)isAudioEnabled;
- (BOOL)isAudioPaused;
- (BOOL)isAudioReady;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isRelaying;
- (BOOL)isScreenEnabled;
- (BOOL)isScreening;
- (BOOL)isUplinkMuted;
- (BOOL)isVideo;
- (BOOL)isVideoEnabled;
- (BOOL)isVideoPaused;
- (CGRect)presentationRect;
- (CSDSimulatedAVCSession)init;
- (CSDSimulatedAVCSession)initWithDelegate:(id)a3 queue:(id)a4 videoEnabled:(BOOL)a5 oneToOneModeEnabled:(BOOL)a6;
- (NSData)localParticipantData;
- (NSString)sessionIdentifier;
- (id)localParticipantDataWithVersion:(unint64_t)a3;
- (id)pendingRemovedRemoteParticipantByIdentififer:(unint64_t)a3;
- (int)presentationState;
- (int64_t)localCaptionsToken;
- (int64_t)maxVideoDecodesAllowed;
- (int64_t)sessionToken;
- (void)addParticipant:(id)a3 withVideoEnabled:(BOOL)a4 audioPaused:(BOOL)a5 screenEnabled:(BOOL)a6;
- (void)removeParticipant:(id)a3;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setAudioPaused:(BOOL)a3;
- (void)setAudioReady:(BOOL)a3;
- (void)setOneToOneModeEnabled:(BOOL)a3;
- (void)setPresentationRect:(CGRect)a3;
- (void)setPresentationState:(int)a3;
- (void)setRelaying:(BOOL)a3;
- (void)setScreening:(BOOL)a3;
- (void)setUplinkMuted:(BOOL)a3;
- (void)setVideo:(BOOL)a3;
- (void)setVideoEnabled:(BOOL)a3;
- (void)setVideoPaused:(BOOL)a3;
- (void)start;
- (void)stop;
- (void)stopWithError:(id)a3;
@end

@implementation CSDSimulatedAVCSession

- (CSDSimulatedAVCSession)initWithDelegate:(id)a3 queue:(id)a4 videoEnabled:(BOOL)a5 oneToOneModeEnabled:(BOOL)a6
{
  id v7 = a4;
  return (CSDSimulatedAVCSession *)sub_1001E0A60();
}

- (NSData)localParticipantData
{
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_1001BB39C(0LL, 0xC000000000000000LL);
  return (NSData *)isa;
}

- (NSString)sessionIdentifier
{
  if (v2)
  {
    uint64_t v3 = v2;
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v3);
  }

  else
  {
    NSString v4 = 0LL;
  }

  return (NSString *)v4;
}

- (int64_t)sessionToken
{
  return 1LL;
}

- (int64_t)maxVideoDecodesAllowed
{
  return 100LL;
}

- (BOOL)isVideo
{
  return sub_1001E0D98() & 1;
}

- (void)setVideo:(BOOL)a3
{
}

- (BOOL)isAudioReady
{
  return sub_1001E0DF8() & 1;
}

- (void)setAudioReady:(BOOL)a3
{
}

- (BOOL)isUplinkMuted
{
  return sub_1001E0E58() & 1;
}

- (void)setUplinkMuted:(BOOL)a3
{
}

- (BOOL)isAudioEnabled
{
  return sub_1001E0EB8() & 1;
}

- (void)setAudioEnabled:(BOOL)a3
{
}

- (BOOL)isVideoEnabled
{
  return sub_1001E0F18() & 1;
}

- (void)setVideoEnabled:(BOOL)a3
{
}

- (BOOL)isScreenEnabled
{
  return 0;
}

- (BOOL)isVideoPaused
{
  return sub_1001E0F80() & 1;
}

- (void)setVideoPaused:(BOOL)a3
{
}

- (BOOL)isAudioPaused
{
  return sub_1001E0FE0() & 1;
}

- (void)setAudioPaused:(BOOL)a3
{
}

- (BOOL)isOneToOneModeEnabled
{
  return sub_1001E1040() & 1;
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
}

- (BOOL)isRelaying
{
  return sub_1001E10A0() & 1;
}

- (void)setRelaying:(BOOL)a3
{
}

- (BOOL)isScreening
{
  return sub_1001E1100() & 1;
}

- (void)setScreening:(BOOL)a3
{
}

- (int64_t)localCaptionsToken
{
  return 1LL;
}

- (int)presentationState
{
  return sub_1001E1164();
}

- (void)setPresentationState:(int)a3
{
}

- (CGRect)presentationRect
{
  double v2 = sub_1001E11C8();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setPresentationRect:(CGRect)a3
{
}

- (id)localParticipantDataWithVersion:(unint64_t)a3
{
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_1001BB39C(0LL, 0xC000000000000000LL);
  return isa;
}

- (BOOL)containsRemoteParticipantWithIdentifier:(unint64_t)a3
{
  return sub_1001E1250(a3) & 1;
}

- (void)addParticipant:(id)a3 withVideoEnabled:(BOOL)a4 audioPaused:(BOOL)a5 screenEnabled:(BOOL)a6
{
  id v7 = a3;
  v8 = self;
  sub_1001E12E4();
}

- (void)removeParticipant:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1001E1628();
}

- (id)pendingRemovedRemoteParticipantByIdentififer:(unint64_t)a3
{
  return 0LL;
}

- (void)start
{
  double v2 = self;
  sub_1001E193C();
}

- (void)stop
{
  double v2 = self;
  sub_1001E1B28();
}

- (void)stopWithError:(id)a3
{
  id v4 = self;
  id v5 = a3;
  sub_1001E1B64();
}

- (CSDSimulatedAVCSession)init
{
}

- (void).cxx_destruct
{
  sub_1001C954C((uint64_t)self + OBJC_IVAR___CSDSimulatedAVCSession_delegate);
  swift_bridgeObjectRelease(*(void *)&self->participants[OBJC_IVAR___CSDSimulatedAVCSession_sessionIdentifier]);
}

@end