int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t MainExecutor;
  uint64_t v5;
  uint64_t v6;
  int result;
  v3 = swift_task_create(2048LL, 0LL, (char *)&type metadata for () + 8, &unk_100008000, 0LL);
  MainExecutor = swift_task_getMainExecutor();
  v6 = swift_job_run(v3, MainExecutor, v5);
  result = swift_task_asyncMainDrainQueue(v6);
  __break(1u);
  return result;
}

uint64_t sub_1000036D8()
{
  v0[2] = swift_task_getMainExecutor();
  v0[3] = v1;
  nullsub_1();
  v2 = (void *)swift_task_alloc(async function pointer to static SNDaemon.soundanalysisdLaunch()[1]);
  v0[4] = v2;
  void *v2 = v0;
  v2[1] = sub_10000372C;
  return static SNDaemon.soundanalysisdLaunch()();
}

uint64_t sub_10000372C()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 32);
  *(void *)(*v1 + 40) = v0;
  swift_task_dealloc(v3);
  if (v0) {
    v4 = sub_1000037A8;
  }
  else {
    v4 = sub_10000378C;
  }
  return swift_task_switch(v4, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

void sub_10000378C()
{
}

uint64_t sub_1000037A8()
{
  return swift_errorInMain(*(void *)(v0 + 40));
}

uint64_t sub_1000037B0()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_10000800C);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000037F4;
  return sub_1000036D8();
}

uint64_t sub_1000037F4()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}