id sub_3AC8()
{
  void *v0;
  objc_super v2;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnalyticsServiceMaintenance();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AnalyticsServiceMaintenance()
{
  return objc_opt_self(&OBJC_CLASS___PLAnalyticsServiceMaintenance);
}

uint64_t sub_3B18()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_3BEC(v0, qword_81F0);
  sub_3B94(v0, (uint64_t)qword_81F0);
  return Logger.init(subsystem:category:)( 0xD000000000000013LL,  0x8000000000003E00LL,  0xD00000000000001BLL,  0x8000000000003DA0LL);
}

uint64_t sub_3B94(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_3BAC(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

uint64_t sub_3BBC()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_3BE0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16LL))();
}

uint64_t *sub_3BEC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    uint64_t v4 = swift_slowAlloc(*(void *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }

  return a2;
}