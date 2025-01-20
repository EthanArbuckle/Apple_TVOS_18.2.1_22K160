@interface (label:String?,value:
- (unint64_t)Any);
@end

@implementation (label:String?,value:

- (unint64_t)Any)
{
  unint64_t result = lazy protocol witness table cache variable for type [(label: String?, value: Any)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(label: String?, value: Any)] and conformance [A])
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(label: String?, value: Any)]);
    unint64_t result = MEMORY[0x186E20D4C](MEMORY[0x189618488], v1);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type [(label: String?, value: Any)] and conformance [A]);
  }

  return result;
}

@end