@interface __stdlib_ReturnAutoreleasedDummy
- (id)returnsAutoreleased:(id)a3;
@end

@implementation __stdlib_ReturnAutoreleasedDummy

- (id)returnsAutoreleased:(id)a3
{
  return swift_unknownObjectRetain(a3, (uint64_t)a2, (uint64_t)a3, v3);
}

@end