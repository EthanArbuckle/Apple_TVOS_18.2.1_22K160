@interface String:
- (uint64_t)AttributedString._AttributeValue;
- (uint64_t)Morphology._CustomPronoun;
@end

@implementation String:

- (uint64_t)AttributedString._AttributeValue
{
  return a1;
}

- (uint64_t)Morphology._CustomPronoun
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Morphology._CustomPronoun]);
    v10[0] = a3;
    v10[1] = a2();
    uint64_t result = MEMORY[0x186E20D4C](a4, v9, v10);
    atomic_store(result, a1);
  }

  return result;
}

@end