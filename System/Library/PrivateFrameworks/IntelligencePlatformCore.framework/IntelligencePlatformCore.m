int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  v3 = os_transaction_create("com.apple.intelligenceplatform.KnowledgeConstructionDaemon.start", argv, envp);
  sub_1000035F0();
  swift_unknownObjectRelease(v3);
  dispatch_main();
}

id sub_1000035F0()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100003734();
  uint64_t v4 = static Daemon.enterSandbox(identifier:macOSProfile:)( 0xD000000000000020LL,  0x8000000100003880LL,  0xD000000000000020LL,  0x8000000100003880LL);
  uint64_t v5 = static Logging.mdlog.getter(v4);
  v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Starting knowledgeconstructiond", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  uint64_t v9 = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  static KnowledgeConstructionSystem.start()(v9);
  return [(id)objc_opt_self(GDDaemonEventHandlers) registerForLaunchEvents];
}

unint64_t sub_100003734()
{
  unint64_t result = qword_100008008;
  if (!qword_100008008)
  {
    unint64_t result = swift_getWitnessTable("M\b", &type metadata for KnowledgeConstructionDaemon);
    atomic_store(result, (unint64_t *)&qword_100008008);
  }

  return result;
}

ValueMetadata *type metadata accessor for KnowledgeConstructionDaemon()
{
  return &type metadata for KnowledgeConstructionDaemon;
}