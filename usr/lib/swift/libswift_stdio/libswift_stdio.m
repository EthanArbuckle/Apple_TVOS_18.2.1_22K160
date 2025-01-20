uint64_t stdin.getter()
{
  uint64_t result;
  result = *MEMORY[0x1895F89D8];
  if (!*MEMORY[0x1895F89D8]) {
    __break(1u);
  }
  return result;
}

uint64_t stdin.setter(uint64_t result)
{
  *MEMORY[0x1895F89D8] = result;
  return result;
}

void *stdin.modify(void *result)
{
  if (*MEMORY[0x1895F89D8])
  {
    *result = *MEMORY[0x1895F89D8];
    return stdin.modify;
  }

  else
  {
    __break(1u);
  }

  return result;
}

{
  *MEMORY[0x1895F89D8] = *result;
  return result;
}

uint64_t stdout.getter()
{
  uint64_t result = *MEMORY[0x1895F89E0];
  if (!*MEMORY[0x1895F89E0]) {
    __break(1u);
  }
  return result;
}

uint64_t stdout.setter(uint64_t result)
{
  *MEMORY[0x1895F89E0] = result;
  return result;
}

void *stdout.modify(void *result)
{
  if (*MEMORY[0x1895F89E0])
  {
    *uint64_t result = *MEMORY[0x1895F89E0];
    return stdout.modify;
  }

  else
  {
    __break(1u);
  }

  return result;
}

{
  *MEMORY[0x1895F89E0] = *result;
  return result;
}

uint64_t stderr.getter()
{
  uint64_t result = *MEMORY[0x1895F89D0];
  if (!*MEMORY[0x1895F89D0]) {
    __break(1u);
  }
  return result;
}

uint64_t stderr.setter(uint64_t result)
{
  *MEMORY[0x1895F89D0] = result;
  return result;
}

void *stderr.modify(void *result)
{
  if (*MEMORY[0x1895F89D0])
  {
    *uint64_t result = *MEMORY[0x1895F89D0];
    return stderr.modify;
  }

  else
  {
    __break(1u);
  }

  return result;
}

{
  *MEMORY[0x1895F89D0] = *result;
  return result;
}

char *dprintf(_:_:_:)(uint64_t a1, const char *a2, uint64_t a3)
{
  return specialized withVaList<A>(_:_:)(a3, a1, a2);
}

char *specialized withVaList<A>(_:_:)(uint64_t a1, uint64_t a2, const char *a3)
{
  v4 = (void *)swift_allocObject();
  v4[2] = 8LL;
  v4[3] = 0LL;
  v5 = v4 + 3;
  v4[4] = 0LL;
  v4[5] = 0LL;
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = a1 + 32;
    while (1)
    {
      outlined init with copy of CVarArg(v8 + 40 * v7, (uint64_t)v28);
      uint64_t v9 = v29;
      uint64_t v10 = v30;
      __swift_project_boxed_opaque_existential_1(v28, v29);
      uint64_t result = (char *)MEMORY[0x1895E8C94](v9, v10);
      uint64_t v12 = *v5;
      uint64_t v13 = *((void *)result + 2);
      BOOL v14 = __OFADD__(*v5, v13);
      uint64_t v15 = *v5 + v13;
      if (v14)
      {
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }

      v16 = result;
      uint64_t v17 = v4[4];
      if (v17 >= v15) {
        goto LABEL_18;
      }
      if (v17 + 0x4000000000000000LL < 0) {
        goto LABEL_30;
      }
      v18 = (char *)v4[5];
      if (2 * v17 > v15) {
        uint64_t v15 = 2 * v17;
      }
      v4[4] = v15;
      uint64_t result = (char *)swift_slowAlloc();
      v4[5] = result;
      if (v18) {
        break;
      }
LABEL_19:
      if (!result) {
        goto LABEL_34;
      }
      uint64_t v20 = *((void *)v16 + 2);
      if (v20)
      {
        v21 = (uint64_t *)(v16 + 32);
        uint64_t v22 = *v5;
        while (1)
        {
          uint64_t v23 = *v21++;
          *(void *)&result[8 * v22] = v23;
          uint64_t v22 = *v5 + 1;
          if (__OFADD__(*v5, 1LL)) {
            break;
          }
          uint64_t *v5 = v22;
          if (!--v20) {
            goto LABEL_3;
          }
        }

        __break(1u);
        goto LABEL_29;
      }

LABEL_3:
      ++v7;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      if (v7 == v6) {
        goto LABEL_25;
      }
    }

    if (result != v18 || result >= &v18[8 * v12]) {
      memmove(result, v18, 8 * v12);
    }
    __VaListBuilder.deallocStorage(wordCount:storage:)();
LABEL_18:
    uint64_t result = (char *)v4[5];
    goto LABEL_19;
  }

    ++v8;
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
    if (v8 == v7) {
      goto LABEL_25;
    }
  }

  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

LABEL_25:
  va_list v24 = (va_list)__VaListBuilder.va_list()();
  uint64_t result = (char *)a2;
  if (a2 > 0x7FFFFFFF)
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
  }

  else
  {
    uint64_t v25 = vdprintf(a2, a3, v24);
    swift_release();
    return (char *)v25;
  }

  return result;
}

char *specialized withVaList<A>(_:_:)(uint64_t a1, char *a2, size_t a3, const char *a4)
{
  v5 = (void *)swift_allocObject();
  v5[2] = 8LL;
  v5[3] = 0LL;
  uint64_t v6 = v5 + 3;
  v5[4] = 0LL;
  v5[5] = 0LL;
  uint64_t v7 = *(void *)(a1 + 16);
  if (!v7)
  {
LABEL_25:
    va_list v25 = (va_list)__VaListBuilder.va_list()();
    uint64_t v26 = vsnprintf(a2, a3, a4, v25);
    swift_release();
    return (char *)v26;
  }

  uint64_t v8 = 0LL;
  uint64_t v9 = a1 + 32;
  while (1)
  {
    outlined init with copy of CVarArg(v9 + 40 * v8, (uint64_t)v30);
    uint64_t v10 = v31;
    uint64_t v11 = v32;
    __swift_project_boxed_opaque_existential_1(v30, v31);
    uint64_t result = (char *)MEMORY[0x1895E8C94](v10, v11);
    uint64_t v13 = *v6;
    uint64_t v14 = *((void *)result + 2);
    BOOL v15 = __OFADD__(*v6, v14);
    uint64_t v16 = *v6 + v14;
    if (v15) {
      break;
    }
    uint64_t v17 = result;
    uint64_t v18 = v5[4];
    if (v18 >= v16) {
      goto LABEL_18;
    }
    if (v18 + 0x4000000000000000LL < 0) {
      goto LABEL_28;
    }
    v19 = (char *)v5[5];
    if (2 * v18 > v16) {
      uint64_t v16 = 2 * v18;
    }
    v5[4] = v16;
    uint64_t result = (char *)swift_slowAlloc();
    v5[5] = result;
    if (v19)
    {
      if (result != v19 || result >= &v19[8 * v13]) {
        memmove(result, v19, 8 * v13);
      }
      __VaListBuilder.deallocStorage(wordCount:storage:)();
LABEL_18:
      uint64_t result = (char *)v5[5];
    }

    if (!result) {
      goto LABEL_30;
    }
    uint64_t v21 = *((void *)v17 + 2);
    if (v21)
    {
      uint64_t v22 = (uint64_t *)(v17 + 32);
      uint64_t v23 = *v6;
      while (1)
      {
        uint64_t v24 = *v22++;
        *(void *)&result[8 * v23] = v24;
        uint64_t v23 = *v6 + 1;
        if (__OFADD__(*v6, 1LL)) {
          break;
        }
        *uint64_t v6 = v23;
        if (!--v21) {
          goto LABEL_3;
        }
      }

      __break(1u);
      break;
    }

char *snprintf(ptr:_:_:_:)(char *a1, size_t a2, const char *a3, uint64_t a4)
{
  return specialized withVaList<A>(_:_:)(a4, a1, a2, a3);
}

uint64_t outlined init with copy of CVarArg(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t __VaListBuilder.deallocStorage(wordCount:storage:)()
{
  return MEMORY[0x189619640]();
}

uint64_t __VaListBuilder.va_list()()
{
  return MEMORY[0x189619648]();
}

uint64_t type metadata accessor for __VaListBuilder()
{
  return MEMORY[0x189619650]();
}

uint64_t dispatch thunk of CVarArg._cVarArgEncoding.getter()
{
  return MEMORY[0x18961A920]();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x18961B0B0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x18961B410]();
}

int vdprintf(int a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FD520](*(void *)&a1, a2, a3);
}