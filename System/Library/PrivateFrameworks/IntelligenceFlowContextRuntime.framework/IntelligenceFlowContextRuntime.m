int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  unint64_t v4;
  v3 = type metadata accessor for IntelligenceFlowContextDaemon(0LL);
  v4 = sub_10000393C();
  static Daemon.main()(v3, v4);
  return 0;
}

unint64_t sub_10000393C()
{
  unint64_t result = qword_100008000;
  if (!qword_100008000)
  {
    uint64_t v1 = type metadata accessor for IntelligenceFlowContextDaemon(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for IntelligenceFlowContextDaemon, v1);
    atomic_store(result, (unint64_t *)&qword_100008000);
  }

  return result;
}