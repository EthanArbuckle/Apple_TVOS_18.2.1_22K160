uint64_t sub_3D08()
{
  uint64_t v0;
  return swift_allocObject(v0, 16LL, 7LL);
}

uint64_t sub_3D18()
{
  return static SnippetProvider.snippet(for:mode:idiom:)();
}

uint64_t sub_3D2C()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for SiriAppLaunchUIPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC21SiriAppLaunchUIPlugin21SiriAppLaunchUIPlugin);
}

unint64_t sub_3D60()
{
  unint64_t result = qword_8128;
  if (!qword_8128)
  {
    uint64_t v1 = type metadata accessor for AppLaunchDataModels(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for AppLaunchDataModels, v1);
    atomic_store(result, (unint64_t *)&qword_8128);
  }

  return result;
}

uint64_t sub_3DA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_3D08();
  *a1 = result;
  return result;
}

uint64_t sub_3DC4()
{
  return sub_3D18();
}