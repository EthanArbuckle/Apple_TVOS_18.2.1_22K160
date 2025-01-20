@interface String:
- (unint64_t)Any;
- (void)Any;
@end

@implementation String:

- (unint64_t)Any
{
  uint64_t v3 = lazy protocol witness table cache variable for type [String : Any] and conformance [A : B];
  if (!lazy protocol witness table cache variable for type [String : Any] and conformance [A : B])
  {
    uint64_t v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Any]);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A : B], v0);
    atomic_store( WitnessTable,  (unint64_t *)&lazy protocol witness table cache variable for type [String : Any] and conformance [A : B]);
    return WitnessTable;
  }

  return v3;
}

- (void)Any
{
}

@end