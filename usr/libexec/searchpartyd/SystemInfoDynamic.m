@interface SystemInfoDynamic
- (void)systemClockDidChangeHandler;
@end

@implementation SystemInfoDynamic

- (void)systemClockDidChangeHandler
{
  uint64_t v2 = *(void *)self->_TtCs12_SwiftObject_opaque;
  uint64_t v3 = *(void *)self->clockLock;
  v4[2] = self;
  v4[3] = v2;
  swift_retain();
  OSAllocatedUnfairLock.callAsFunction<A>(_:)( sub_1007C8574,  v4,  v3,  (char *)&type metadata for () + 8,  (char *)&type metadata for () + 8);
  swift_release();
}

@end