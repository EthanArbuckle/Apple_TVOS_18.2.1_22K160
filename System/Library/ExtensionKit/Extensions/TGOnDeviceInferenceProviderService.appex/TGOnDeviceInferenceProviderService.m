uint64_t TGOnDeviceInferenceProviderService.__allocating_init()()
{
  uint64_t v0;
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  return InferenceProviderExtension.init()();
}

uint64_t TGOnDeviceInferenceProviderService.__deallocating_deinit()
{
  uint64_t v0 = InferenceProviderExtension.deinit();
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for TGOnDeviceInferenceProviderService(0LL);
  unint64_t v4 = lazy protocol witness table accessor for type TGOnDeviceInferenceProviderService and conformance InferenceProviderExtension<A>();
  static AppExtension.main()(v3, v4);
  return 0;
}

uint64_t type metadata accessor for TGOnDeviceInferenceProviderService(uint64_t a1)
{
  uint64_t result = type metadata singleton initialization cache for TGOnDeviceInferenceProviderService;
  if (!type metadata singleton initialization cache for TGOnDeviceInferenceProviderService) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TGOnDeviceInferenceProviderService);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type TGOnDeviceInferenceProviderService and conformance InferenceProviderExtension<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type TGOnDeviceInferenceProviderService and conformance InferenceProviderExtension<A>;
  if (!lazy protocol witness table cache variable for type TGOnDeviceInferenceProviderService and conformance InferenceProviderExtension<A>)
  {
    uint64_t v1 = type metadata accessor for TGOnDeviceInferenceProviderService(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for InferenceProviderExtension<A>, v1);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type TGOnDeviceInferenceProviderService and conformance InferenceProviderExtension<A>);
  }

  return result;
}

uint64_t type metadata completion function for TGOnDeviceInferenceProviderService(uint64_t a1)
{
  return swift_initClassMetadata2( a1,  0LL,  0LL,  v2,  a1 + class metadata base offset for TGOnDeviceInferenceProviderService);
}

uint64_t ObjC metadata update function for TGOnDeviceInferenceProviderService()
{
  return type metadata accessor for TGOnDeviceInferenceProviderService(0LL);
}