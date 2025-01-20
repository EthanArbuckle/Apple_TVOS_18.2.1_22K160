uint64_t sub_100003C70(uint64_t a1)
{
  unint64_t v2;
  v2 = sub_100003D8C();
  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100003D04()
{
  unint64_t result = qword_100008000;
  if (!qword_100008000)
  {
    unint64_t result = swift_getWitnessTable(&unk_100003E98, &type metadata for TextInputAppIntentsExtension);
    atomic_store(result, (unint64_t *)&qword_100008000);
  }

  return result;
}

uint64_t sub_100003D4C(uint64_t a1, uint64_t a2)
{
  v3[0] = a2;
  v3[1] = sub_100003D8C();
  return swift_getOpaqueTypeConformance2( v3,  &opaque type descriptor for <<opaque return type of AppIntentsExtension.configuration>>,  1LL);
}

unint64_t sub_100003D8C()
{
  unint64_t result = qword_100008008;
  if (!qword_100008008)
  {
    unint64_t result = swift_getWitnessTable(&unk_100003E70, &type metadata for TextInputAppIntentsExtension);
    atomic_store(result, (unint64_t *)&qword_100008008);
  }

  return result;
}

ValueMetadata *type metadata accessor for TextInputAppIntentsExtension()
{
  return &type metadata for TextInputAppIntentsExtension;
}