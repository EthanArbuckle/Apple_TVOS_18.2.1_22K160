@interface CompressedOutputStream
- (BOOL)hasSpaceAvailable;
- (NSError)streamError;
- (NSOutputStream)outputStream;
- (NSString)dataDigestForStream;
- (_TtC7parsecd22CompressedOutputStream)init;
- (_TtC7parsecd22CompressedOutputStream)initWithOutputStream:(id)a3;
- (_TtC7parsecd22CompressedOutputStream)initWithURL:(id)a3 append:(BOOL)a4;
- (id)initToBuffer:(char *)a3 capacity:(int64_t)a4;
- (id)initToMemory;
- (int64_t)compressedBytesWritten;
- (int64_t)uncompressedBytesWritten;
- (int64_t)write:(const char *)a3 maxLength:(int64_t)a4;
- (unint64_t)streamStatus;
- (void)close;
- (void)open;
@end

@implementation CompressedOutputStream

- (NSOutputStream)outputStream
{
  return (NSOutputStream *)sub_10001C1E0();
}

- (int64_t)uncompressedBytesWritten
{
  return sub_10001C210();
}

- (int64_t)compressedBytesWritten
{
  return sub_10001C240();
}

- (_TtC7parsecd22CompressedOutputStream)init
{
  return result;
}

- (_TtC7parsecd22CompressedOutputStream)initWithOutputStream:(id)a3
{
  return (_TtC7parsecd22CompressedOutputStream *)sub_10001C2F4(a3);
}

- (NSString)dataDigestForStream
{
  v2 = self;
  sub_10001C550();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (int64_t)write:(const char *)a3 maxLength:(int64_t)a4
{
  v6 = self;
  int64_t v7 = sub_10001C6F0((const uint8_t *)a3, a4);

  return v7;
}

- (BOOL)hasSpaceAvailable
{
  return 1;
}

- (unint64_t)streamStatus
{
  return sub_10001C9F4();
}

- (NSError)streamError
{
  v2 = self;
  sub_10001CA74();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)_convertErrorToNSError(_:)(v4);
    swift_errorRelease(v4);
  }

  else
  {
    v5 = 0LL;
  }

  return (NSError *)v5;
}

- (void)open
{
  v2 = self;
  sub_10001CAE4();
}

- (void)close
{
  v2 = self;
  sub_10001CB30();
}

- (id)initToMemory
{
}

- (id)initToBuffer:(char *)a3 capacity:(int64_t)a4
{
}

- (_TtC7parsecd22CompressedOutputStream)initWithURL:(id)a3 append:(BOOL)a4
{
  uint64_t v5 = type metadata accessor for URL(0LL);
  __chkstk_darwin(v5);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  sub_10001CE20();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7parsecd22CompressedOutputStream_outputStream));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7parsecd22CompressedOutputStream_destBuffer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7parsecd22CompressedOutputStream_digest));
}

@end