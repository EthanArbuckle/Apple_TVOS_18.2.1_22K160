id sub_100003C8C()
{
  void *v0;
  objc_super v2;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntentHandler()
{
  return objc_opt_self(&OBJC_CLASS____TtC14SeymourIntents13IntentHandler);
}

uint64_t sub_100003CDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003D24(&qword_100008138);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100003D24(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

void *sub_100003D64(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_100003D88(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}