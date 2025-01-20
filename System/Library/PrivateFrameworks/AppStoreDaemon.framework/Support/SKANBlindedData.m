@interface SKANBlindedData
- (NSString)blindedElement;
- (NSString)privateInput;
- (_TtC9appstored15SKANBlindedData)init;
- (unint64_t)timestamp;
@end

@implementation SKANBlindedData

- (NSString)blindedElement
{
  return (NSString *)sub_100017CE0( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC9appstored15SKANBlindedData_blindedElement);
}

- (NSString)privateInput
{
  return (NSString *)sub_100017CE0( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC9appstored15SKANBlindedData_privateInput);
}

- (unint64_t)timestamp
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored15SKANBlindedData_timestamp);
}

- (_TtC9appstored15SKANBlindedData)init
{
  result = (_TtC9appstored15SKANBlindedData *)_swift_stdlib_reportUnimplementedInitializer( "appstored.SKANBlindedData",  25LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end