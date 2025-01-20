uint64_t sub_10000343C()
{
  return swift_task_switch(sub_100003450, 0LL, 0LL);
}

uint64_t sub_100003450()
{
  uint64_t v1 = type metadata accessor for InferenceError(0LL);
  uint64_t v2 = sub_100003948( &qword_100008108,  (uint64_t (*)(uint64_t))&type metadata accessor for InferenceError,  (uint64_t)&protocol conformance descriptor for InferenceError);
  swift_allocError(v1, v2, 0LL, 0LL);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v1 - 8) + 104LL))( v3,  enum case for InferenceError.unspecified(_:),  v1);
  swift_willThrow(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000034F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v9 = (void *)swift_task_alloc(async function pointer to InferenceProvider.loadIn(inferenceAssetIdentifier:)[1]);
  *(void *)(v4 + 16) = v9;
  void *v9 = v4;
  v9[1] = sub_100003A94;
  return InferenceProvider.loadIn(inferenceAssetIdentifier:)(a1, a2, a3, a4);
}

uint64_t sub_100003568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v9 = (void *)swift_task_alloc(async function pointer to InferenceProvider.loadOut(inferenceAssetIdentifier:)[1]);
  *(void *)(v4 + 16) = v9;
  void *v9 = v4;
  v9[1] = sub_100003A94;
  return InferenceProvider.loadOut(inferenceAssetIdentifier:)(a1, a2, a3, a4);
}

uint64_t sub_1000035E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v11 = (void *)swift_task_alloc(async function pointer to InferenceProvider.transitionAsset(withIdentifier:to:)[1]);
  *(void *)(v5 + 16) = v11;
  void *v11 = v5;
  v11[1] = sub_100003A94;
  return InferenceProvider.transitionAsset(withIdentifier:to:)(a1, a2, a3, a4, a5);
}

uint64_t sub_100003660@<X0>(void *a1@<X8>)
{
  a1[3] = sub_100003988(&qword_100008118);
  a1[4] = sub_1000039C8();
  sub_100003A58(a1);
  return AsyncThrowingStream.init<>(unfolding:)(&unk_100008110, 0LL, (char *)&type metadata for () + 8);
}

uint64_t sub_1000036C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v11 = (void *)swift_task_alloc(async function pointer to InferenceProvider.requestOneShot(clientData:configuration:)[1]);
  *(void *)(v5 + 16) = v11;
  void *v11 = v5;
  v11[1] = sub_100003A94;
  return InferenceProvider.requestOneShot(clientData:configuration:)(a1, a2, a3, a4, a5);
}

uint64_t sub_100003748(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7 = (void *)swift_task_alloc(async function pointer to InferenceProvider.cancelRequest(uuid:)[1]);
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_1000037B0;
  return InferenceProvider.cancelRequest(uuid:)(a1, a2, a3);
}

uint64_t sub_1000037B0()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(v4 + 16);
  uint64_t v2 = *v0;
  uint64_t v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000037F8()
{
  return InferenceProviderExtension.init()();
}

uint64_t sub_100003828()
{
  uint64_t v0 = InferenceProviderExtension.deinit();
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for UnimplementedInferenceService(0LL);
  uint64_t v4 = sub_100003948( &qword_100008090,  type metadata accessor for UnimplementedInferenceService,  (uint64_t)&protocol conformance descriptor for InferenceProviderExtension<A>);
  static AppExtension.main()(v3, v4);
  return 0;
}

uint64_t type metadata accessor for UnimplementedInferenceService(uint64_t a1)
{
  uint64_t result = qword_100008140;
  if (!qword_100008140) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for UnimplementedInferenceService);
  }
  return result;
}

uint64_t sub_1000038F4(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_100008128);
}

uint64_t sub_100003930()
{
  return type metadata accessor for UnimplementedInferenceService(0LL);
}

ValueMetadata *type metadata accessor for Unimplemented()
{
  return &type metadata for Unimplemented;
}

uint64_t sub_100003948(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100003988(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_1000039C8()
{
  unint64_t result = qword_100008120;
  if (!qword_100008120)
  {
    uint64_t v1 = sub_100003A14(&qword_100008118);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for AsyncThrowingStream<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100008120);
  }

  return result;
}

uint64_t sub_100003A14(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

void *sub_100003A58(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}