@interface NullStream
- (BOOL)hasSpaceAvailable;
- (NSError)streamError;
- (_TtC7parsecd10NullStream)initWithURL:(id)a3 append:(BOOL)a4;
- (id)initToBuffer:(char *)a3 capacity:(int64_t)a4;
- (id)initToMemory;
- (int64_t)write:(const char *)a3 maxLength:(int64_t)a4;
- (unint64_t)streamStatus;
@end

@implementation NullStream

- (int64_t)write:(const char *)a3 maxLength:(int64_t)a4
{
  return a4;
}

- (BOOL)hasSpaceAvailable
{
  return 1;
}

- (unint64_t)streamStatus
{
  return 2LL;
}

- (NSError)streamError
{
  return (NSError *)0LL;
}

- (id)initToMemory
{
  return sub_1000CAA90();
}

- (id)initToBuffer:(char *)a3 capacity:(int64_t)a4
{
  return sub_1000CAAEC((uint64_t)a3, a4);
}

- (_TtC7parsecd10NullStream)initWithURL:(id)a3 append:(BOOL)a4
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  __chkstk_darwin(v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (_TtC7parsecd10NullStream *)sub_1000CAB70((uint64_t)v8, a4);
}

@end