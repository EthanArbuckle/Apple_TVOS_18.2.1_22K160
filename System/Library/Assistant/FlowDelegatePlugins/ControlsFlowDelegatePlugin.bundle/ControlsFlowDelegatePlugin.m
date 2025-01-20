uint64_t sub_3B80()
{
  uint64_t v0;
  return swift_allocObject(v0, 16LL, 7LL);
}

uint64_t sub_3B90(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ControlsFlowProvider(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin();
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  ControlsFlowProvider.init()(v4);
  ControlsFlowProvider.findFlowFor(parse:)(a1);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_3C24(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ControlsFlowProvider(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  ControlsFlowProvider.init()(v4);
  uint64_t v7 = ControlsFlowProvider.makeFlow(for:)(a1);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  if (v7) {
    return v7;
  }
  __break(1u);
  return result;
}

uint64_t sub_3CB4()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for ControlsFlowDelegatePlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC26ControlsFlowDelegatePlugin26ControlsFlowDelegatePlugin);
}

uint64_t sub_3CE4(uint64_t a1)
{
  return sub_3B90(a1);
}

uint64_t sub_3CF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_3B80();
  *a1 = result;
  return result;
}

uint64_t sub_3D28(uint64_t a1)
{
  return sub_3C24(a1);
}

unint64_t sub_3D44()
{
  unint64_t result = qword_8138;
  if (!qword_8138)
  {
    uint64_t v1 = type metadata accessor for ControlsFlowDelegatePlugin();
    unint64_t result = swift_getWitnessTable(&unk_3E6C, v1);
    atomic_store(result, (unint64_t *)&qword_8138);
  }

  return result;
}