const char *sub_3958()
{
  return "SiriSettings";
}

const char *sub_396C()
{
  return "settings_adoption_siri_help";
}

uint64_t sub_3980()
{
  return 1LL;
}

void sub_3988()
{
}

Swift::Int sub_39AC()
{
  return Hasher._finalize()();
}

Swift::Int sub_39F8(uint64_t a1)
{
  return Hasher._finalize()();
}

Swift::Bool __swiftcall SuggestionsPluginFeatureFlagsImpl.isSiriHelpEnabled()()
{
  v2[3] = &type metadata for SettingsSuggestionsPluginFeatures;
  v2[4] = sub_3A8C();
  char v0 = isFeatureEnabled(_:)(v2);
  sub_3AC8(v2);
  return v0 & 1;
}

unint64_t sub_3A8C()
{
  unint64_t result = qword_8000;
  if (!qword_8000)
  {
    unint64_t result = swift_getWitnessTable(&unk_3DFC, &type metadata for SettingsSuggestionsPluginFeatures);
    atomic_store(result, (unint64_t *)&qword_8000);
  }

  return result;
}

uint64_t sub_3AC8(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

ValueMetadata *type metadata accessor for SuggestionsPluginFeatureFlagsImpl()
{
  return &type metadata for SuggestionsPluginFeatureFlagsImpl;
}

uint64_t getEnumTagSinglePayload for SettingsSuggestionsPluginFeatures(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  else {
    int v2 = 2;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for SettingsSuggestionsPluginFeatures(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_3B94 + 4 * byte_3CD0[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_3BB4 + 4 * byte_3CD5[v4]))();
  }
}

_BYTE *sub_3B94(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_3BB4(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_3BBC(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_3BC4(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_3BCC(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_3BD4(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t sub_3BE0()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for SettingsSuggestionsPluginFeatures()
{
  return &type metadata for SettingsSuggestionsPluginFeatures;
}

unint64_t sub_3BFC()
{
  unint64_t result = qword_8008;
  if (!qword_8008)
  {
    unint64_t result = swift_getWitnessTable(&unk_3DD4, &type metadata for SettingsSuggestionsPluginFeatures);
    atomic_store(result, (unint64_t *)&qword_8008);
  }

  return result;
}