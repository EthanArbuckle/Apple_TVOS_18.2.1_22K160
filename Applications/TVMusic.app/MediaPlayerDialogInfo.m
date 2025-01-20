@interface MediaPlayerDialogInfo
- (NSError)error;
- (NSString)identifier;
- (_TtC7TVMusic21MediaPlayerDialogInfo)init;
- (int64_t)response;
@end

@implementation MediaPlayerDialogInfo

- (NSString)identifier
{
  uint64_t v2 = *(void *)&self->identifier[OBJC_IVAR____TtC7TVMusic21MediaPlayerDialogInfo_identifier];
  swift_bridgeObjectRetain(v2);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (int64_t)response
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7TVMusic21MediaPlayerDialogInfo_response);
}

- (NSError)error
{
  return (NSError *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC7TVMusic21MediaPlayerDialogInfo_error));
}

- (_TtC7TVMusic21MediaPlayerDialogInfo)init
{
  result = (_TtC7TVMusic21MediaPlayerDialogInfo *)_swift_stdlib_reportUnimplementedInitializer( "TVMusic.MediaPlayerDialogInfo",  29LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end