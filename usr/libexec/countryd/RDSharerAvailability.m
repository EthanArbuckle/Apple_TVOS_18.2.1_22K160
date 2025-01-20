@interface RDSharerAvailability
+ (BOOL)hasLocalStatusKit;
- (_TtC8countryd20RDSharerAvailability)init;
@end

@implementation RDSharerAvailability

+ (BOOL)hasLocalStatusKit
{
  if (&class metadata base offset for LSKLocalStatusClient) {
    BOOL v2 = &type metadata accessor for LSKLocalStatusClient == 0LL;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2
    || &type metadata for LSKLocalStatusClient == 0LL
    || &nominal type descriptor for LSKLocalStatusClient == 0LL
    || &metaclass for LSKLocalStatusClient == 0LL)
  {
    uint64_t v6 = static os_log_type_t.info.getter(a1, a2);
    sub_10000B3EC(0LL, &qword_100019138, &OBJC_CLASS___OS_os_log_ptr);
    v7 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)( v6,  &_mh_execute_header,  v7,  "This platform does not have LocalStatusKit",  42LL,  2LL,  &_swiftEmptyArrayStorage);
  }

  if (&metaclass for LSKLocalStatusClient) {
    BOOL v8 = &nominal type descriptor for LSKLocalStatusClient == 0LL;
  }
  else {
    BOOL v8 = 1;
  }
  return !v8
      && &type metadata for LSKLocalStatusClient != 0LL
      && &type metadata accessor for LSKLocalStatusClient != 0LL
      && &class metadata base offset for LSKLocalStatusClient != 0LL;
}

- (_TtC8countryd20RDSharerAvailability)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RDSharerAvailability();
  return -[RDSharerAvailability init](&v3, "init");
}

@end