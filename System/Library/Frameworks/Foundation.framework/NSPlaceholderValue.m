@interface NSPlaceholderValue
+ (BOOL)supportsSecureCoding;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (NSPlaceholderValue)init;
- (NSPlaceholderValue)initWithBytes:(const void *)a3 objCType:(const char *)a4;
- (NSPlaceholderValue)initWithCoder:(id)a3;
- (const)objCType;
- (unint64_t)retainCount;
- (void)getValue:(void *)a3;
- (void)getValue:(void *)a3 size:(unint64_t)a4;
@end

@implementation NSPlaceholderValue

- (unint64_t)retainCount
{
  return -1LL;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (NSPlaceholderValue)init
{
  return 0LL;
}

- (NSPlaceholderValue)initWithBytes:(const void *)a3 objCType:(const char *)a4
{
  return (NSPlaceholderValue *)_NSNewValue((float32x2_t *)a3, (char *)a4, self->zoneForInstance);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPlaceholderValue)initWithCoder:(id)a3
{
  return (NSPlaceholderValue *)newDecodedValue(a3, self->zoneForInstance);
}

- (const)objCType
{
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_self();
  v6 = __SCR_NSValue;
  if (v4 == v5) {
    v6 = __SCR_NSNumber;
  }
  NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)*v6);
}

- (void)getValue:(void *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_self();
  v7 = __SCR_NSValue;
  if (v5 == v6) {
    v7 = __SCR_NSNumber;
  }
  NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)*v7);
}

- (void)getValue:(void *)a3 size:(unint64_t)a4
{
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_self();
  v8 = __SCR_NSValue;
  if (v6 == v7) {
    v8 = __SCR_NSNumber;
  }
  NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)*v8);
}

@end