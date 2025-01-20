@interface LSBundleRecord(Personas)
- (NSArray)_personasWithAttributes;
@end

@implementation LSBundleRecord(Personas)

- (NSArray)_personasWithAttributes
{
  return (NSArray *)MEMORY[0x189604A58];
}

@end