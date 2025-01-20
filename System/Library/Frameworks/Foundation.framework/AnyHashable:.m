@interface AnyHashable:
- (unint64_t)AnyHashable;
@end

@implementation AnyHashable:

- (unint64_t)AnyHashable
{
  unint64_t result = lazy protocol witness table cache variable for type [AnyHashable : AnyHashable] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [AnyHashable : AnyHashable] and conformance <> [A : B])
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [AnyHashable : AnyHashable]);
    uint64_t v2 = MEMORY[0x1896190F8];
    unint64_t result = MEMORY[0x186E20D4C](MEMORY[0x189617918], v1, &v2);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type [AnyHashable : AnyHashable] and conformance <> [A : B]);
  }

  return result;
}

@end