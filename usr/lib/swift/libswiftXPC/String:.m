@interface String:
- (unint64_t)DecodingBuffer;
@end

@implementation String:

- (unint64_t)DecodingBuffer
{
  unint64_t result = lazy protocol witness table cache variable for type [String : DecodingBuffer].Keys and conformance [A : B].Keys;
  if (!lazy protocol witness table cache variable for type [String : DecodingBuffer].Keys and conformance [A : B].Keys)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : DecodingBuffer].Keys);
    unint64_t result = MEMORY[0x186E0B7D8](MEMORY[0x189617858], v1);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type [String : DecodingBuffer].Keys and conformance [A : B].Keys);
  }

  return result;
}

@end