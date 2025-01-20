uint64_t sub_100003BD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  uint64_t v6;
  v0 = sub_100003D18(&qword_100008008);
  v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  WindowGroup.init(content:)(nullsub_1, 0LL, &type metadata for EmptyView, &protocol witness table for EmptyView);
  v4 = sub_100003D58();
  static SceneBuilder.buildBlock<A>(_:)(v3, v0, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100003CBC()
{
  unint64_t result = qword_100008000;
  if (!qword_100008000)
  {
    unint64_t result = swift_getWitnessTable(&unk_100003E74, &type metadata for ShortcutsActionsApp);
    atomic_store(result, (unint64_t *)&qword_100008000);
  }

  return result;
}

ValueMetadata *type metadata accessor for ShortcutsActionsApp()
{
  return &type metadata for ShortcutsActionsApp;
}

uint64_t sub_100003D08(uint64_t a1)
{
  return swift_getOpaqueTypeConformance(a1, &unk_100003EE0, 1LL);
}

uint64_t sub_100003D18(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_100003D58()
{
  unint64_t result = qword_100008010;
  if (!qword_100008010)
  {
    uint64_t v1 = sub_100003D9C(&qword_100008008);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for WindowGroup<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100008010);
  }

  return result;
}

uint64_t sub_100003D9C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}