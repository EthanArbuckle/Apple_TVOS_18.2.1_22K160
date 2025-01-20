uint64_t sub_3C10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  type metadata accessor for CalendarSnippetProvider(0LL);
  v6 = CalendarSnippetProvider.__allocating_init()();
  v7 = CalendarSnippetProvider.snippet(for:mode:idiom:)(a1, a2, a3);
  swift_release(v6);
  return v7;
}

uint64_t sub_3C88()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for CalendarUIPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC16CalendarUIPlugin16CalendarUIPlugin);
}

uint64_t sub_3CB8()
{
  return swift_allocObject(v0, 16LL, 7LL);
}

unint64_t sub_3CCC()
{
  unint64_t result = qword_8128;
  if (!qword_8128)
  {
    uint64_t v1 = type metadata accessor for Snippet(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Snippet, v1);
    atomic_store(result, (unint64_t *)&qword_8128);
  }

  return result;
}

uint64_t sub_3D0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_3CB8();
  *a1 = result;
  return result;
}

uint64_t sub_3D30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_3C10(a1, a2, a3);
}