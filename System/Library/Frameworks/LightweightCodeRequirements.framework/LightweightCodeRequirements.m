uint64_t sub_1890C4A98(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;
  _BYTE v12[40];
  __int128 v13;
  uint64_t v14;
  v3 = *(void *)(a2 + 16);
  v4 = MEMORY[0x18961AFE8];
  if (v3)
  {
    v14 = MEMORY[0x18961AFE8];
    swift_bridgeObjectRetain();
    sub_1890D0914(0LL, v3, 0);
    v7 = a2 + 32;
    v4 = v14;
    do
    {
      sub_1890D51E0(v7, (uint64_t)v12);
      sub_1890D51E0((uint64_t)v12, (uint64_t)&v11);
      __swift_instantiateConcreteTypeFromMangledName(a3);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768628);
      swift_dynamicCast();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1890D0914(0LL, *(void *)(v4 + 16) + 1LL, 1);
        v4 = v14;
      }

      v9 = *(void *)(v4 + 16);
      v8 = *(void *)(v4 + 24);
      if (v9 >= v8 >> 1)
      {
        sub_1890D0914((void *)(v8 > 1), v9 + 1, 1);
        v4 = v14;
      }

      *(void *)(v4 + 16) = v9 + 1;
      sub_1890D2660(&v13, v4 + 40 * v9 + 32);
      v7 += 40LL;
      --v3;
    }

    while (v3);
    swift_bridgeObjectRelease();
  }

  return v4;
}

void *sub_1890C4BF8( void (*a1)(uint64_t *__return_ptr, uint64_t *, uint64_t *), uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  if (a3 >> 62) {
    goto LABEL_18;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (1)
  {
    uint64_t v7 = MEMORY[0x18961AFE8];
    if (!v6) {
      return (void *)v7;
    }
    uint64_t v18 = MEMORY[0x18961AFE8];
    result = sub_1890D0940(0LL, v6 & ~(v6 >> 63), 0);
    if (v6 < 0) {
      break;
    }
    uint64_t v9 = 0LL;
    uint64_t v7 = v18;
    while (v6 != v9)
    {
      if ((a3 & 0xC000000000000001LL) != 0)
      {
        uint64_t v10 = MEMORY[0x1895DF6C8](v9, a3);
      }

      else
      {
        uint64_t v10 = *(void *)(a3 + 8 * v9 + 32);
        swift_retain();
      }

      uint64_t v16 = v10;
      a1(&v17, &v16, &v15);
      if (v4)
      {
        swift_release();
        swift_release();
        return (void *)v7;
      }

      uint64_t v4 = 0LL;
      swift_release();
      uint64_t v11 = v17;
      uint64_t v18 = v7;
      unint64_t v13 = *(void *)(v7 + 16);
      unint64_t v12 = *(void *)(v7 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_1890D0940((void *)(v12 > 1), v13 + 1, 1);
        uint64_t v7 = v18;
      }

      ++v9;
      *(void *)(v7 + 16) = v13 + 1;
      *(void *)(v7 + 8 * v13 + 32) = v11;
      if (v6 == v9) {
        return (void *)v7;
      }
    }

    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1890F16BC();
    swift_bridgeObjectRelease();
  }

  __break(1u);
  return result;
}

uint64_t sub_1890C4D90( void (*a1)(uint64_t *__return_ptr, __int16 *, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = MEMORY[0x18961AFE8];
  if (v5)
  {
    uint64_t v19 = MEMORY[0x18961AFE8];
    sub_1890D0940(0LL, v5, 0);
    uint64_t v6 = v19;
    for (i = (__int16 *)(a3 + 32); ; i += 8)
    {
      uint64_t v10 = *((void *)i + 1);
      __int16 v16 = *i;
      uint64_t v17 = v10;
      swift_bridgeObjectRetain();
      a1(&v18, &v16, &v15);
      if (v4) {
        break;
      }
      uint64_t v4 = 0LL;
      swift_bridgeObjectRelease();
      uint64_t v11 = v18;
      uint64_t v19 = v6;
      unint64_t v13 = *(void *)(v6 + 16);
      unint64_t v12 = *(void *)(v6 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_1890D0940((void *)(v12 > 1), v13 + 1, 1);
        uint64_t v6 = v19;
      }

      *(void *)(v6 + 16) = v13 + 1;
      *(void *)(v6 + 8 * v13 + 32) = v11;
      if (!--v5) {
        return v6;
      }
    }

    swift_release();
    swift_bridgeObjectRelease();
  }

  return v6;
}

void *sub_1890C4EC0(char *a1, char **a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = (void *)a4;
  sub_1890D51E0(a4, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768628);
  type metadata accessor for EntitlementsQuery();
  if (swift_dynamicCast())
  {
    uint64_t v14 = swift_retain();
    MEMORY[0x1895DF650](v14);
    if (*(void *)((*a3 & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((*a3 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
      sub_1890F1644();
    }
    sub_1890F1650();
    sub_1890F162C();
    return (void *)swift_release();
  }

  sub_1890D51E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) != 0)
  {
    uint64_t v7 = *((void *)&v26 + 1);
    if (*((void *)&v26 + 1))
    {
      uint64_t v16 = sub_1890C4A98((unsigned __int16)v26, *((uint64_t *)&v26 + 1), &qword_18C768630);
      uint64_t v17 = *(void *)(v16 + 16);
      if (v17)
      {
        v28[6] = v16;
        uint64_t v18 = v16 + 32;
        while (1)
        {
          sub_1890D51E0(v18, (uint64_t)v28);
          sub_1890C4EC0(a1, a2, a3, v28, a5, a6);
          if (v6) {
            break;
          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
          v18 += 40LL;
          if (!--v17) {
            goto LABEL_26;
          }
        }

        __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      }

LABEL_26:
      swift_bridgeObjectRelease();
      return (void *)swift_bridgeObjectRelease();
    }
  }

  sub_1890D51E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) == 0 || (uint64_t v7 = *((void *)&v26 + 1)) == 0)
  {
    uint64_t v20 = v10[3];
    uint64_t v21 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v20);
    result = (*(void *(**)(void *__return_ptr, uint64_t, uint64_t))(v21 + 32))(v28, v20, v21);
    if (v6) {
      return result;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
    swift_dynamicCast();
    a2 = (char **)v26;
    if (*(void *)(v26 + 16) == 1LL)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v28[0] = *(void *)a1;
      *(void *)a1 = 0x8000000000000000LL;
      sub_1890D0D18((uint64_t)a2, (uint64_t)sub_1890D0CD8, 0LL, isUniquelyReferenced_nonNull_native, v28);
      *(void *)a1 = v28[0];
      return (void *)swift_bridgeObjectRelease();
    }

    __break(1u);
    goto LABEL_30;
  }

  LOWORD(v10) = v26;
  uint64_t v19 = sub_1890C4A98(v26, *((uint64_t *)&v26 + 1), &qword_18C768630);
  if (*(void *)(v19 + 16) == 1LL)
  {
    sub_1890D51E0(v19 + 32, (uint64_t)&v26);
    result = (void *)swift_bridgeObjectRelease();
    if (!v27)
    {
      __break(1u);
      return result;
    }

    sub_1890D2660(&v26, (uint64_t)v28);
    sub_1890C4EC0(a1, a2, a3, v28, a5, a6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return (void *)swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  a1 = *a2;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_30:
  }
    a1 = sub_1890EA1AC(0LL, *((void *)a1 + 2) + 1LL, 1, a1);
  unint64_t v24 = *((void *)a1 + 2);
  unint64_t v23 = *((void *)a1 + 3);
  if (v24 >= v23 >> 1) {
    a1 = sub_1890EA1AC((char *)(v23 > 1), v24 + 1, 1, a1);
  }
  *((void *)a1 + 2) = v24 + 1;
  v25 = &a1[16 * v24];
  *((_WORD *)v25 + 16) = (_WORD)v10;
  *((void *)v25 + 5) = v7;
  result = (void *)swift_bridgeObjectRelease();
  *a2 = a1;
  return result;
}

      swift_bridgeObjectRelease();
      return (void *)swift_bridgeObjectRelease();
    }
  }

  sub_1890D51E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) == 0 || (uint64_t v7 = *((void *)&v26 + 1)) == 0)
  {
    uint64_t v20 = v10[3];
    uint64_t v21 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v20);
    result = (*(void *(**)(void *__return_ptr, uint64_t, uint64_t))(v21 + 32))(v28, v20, v21);
    if (v6) {
      return result;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
    swift_dynamicCast();
    a2 = (char **)v26;
    if (*(void *)(v26 + 16) == 1LL)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v28[0] = *(void *)a1;
      *(void *)a1 = 0x8000000000000000LL;
      sub_1890D0D18((uint64_t)a2, (uint64_t)sub_1890D0CD8, 0LL, isUniquelyReferenced_nonNull_native, v28);
      *(void *)a1 = v28[0];
      return (void *)swift_bridgeObjectRelease();
    }

    __break(1u);
    goto LABEL_30;
  }

  LOWORD(v10) = v26;
  uint64_t v19 = sub_1890C4A98(v26, *((uint64_t *)&v26 + 1), &qword_18C768630);
  if (*(void *)(v19 + 16) == 1LL)
  {
    sub_1890D51E0(v19 + 32, (uint64_t)&v26);
    result = (void *)swift_bridgeObjectRelease();
    if (!v27)
    {
      __break(1u);
      return result;
    }

    sub_1890D2660(&v26, (uint64_t)v28);
    sub_1890C52AC(a1, a2, a3, v28, a5, a6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return (void *)swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  a1 = *a2;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_30:
  }
    a1 = sub_1890EA198(0LL, *((void *)a1 + 2) + 1LL, 1, a1);
  unint64_t v24 = *((void *)a1 + 2);
  unint64_t v23 = *((void *)a1 + 3);
  if (v24 >= v23 >> 1) {
    a1 = sub_1890EA198((char *)(v23 > 1), v24 + 1, 1, a1);
  }
  *((void *)a1 + 2) = v24 + 1;
  v25 = &a1[16 * v24];
  *((_WORD *)v25 + 16) = (_WORD)v10;
  *((void *)v25 + 5) = v7;
  result = (void *)swift_bridgeObjectRelease();
  *a2 = a1;
  return result;
}

      swift_bridgeObjectRelease();
      return (void *)swift_bridgeObjectRelease();
    }
  }

  sub_1890D51E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) == 0 || (uint64_t v7 = *((void *)&v26 + 1)) == 0)
  {
    uint64_t v20 = v10[3];
    uint64_t v21 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v20);
    result = (*(void *(**)(void *__return_ptr, uint64_t, uint64_t))(v21 + 32))(v28, v20, v21);
    if (v6) {
      return result;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
    swift_dynamicCast();
    a2 = (char **)v26;
    if (*(void *)(v26 + 16) == 1LL)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v28[0] = *(void *)a1;
      *(void *)a1 = 0x8000000000000000LL;
      sub_1890D0D18((uint64_t)a2, (uint64_t)sub_1890D0CD8, 0LL, isUniquelyReferenced_nonNull_native, v28);
      *(void *)a1 = v28[0];
      return (void *)swift_bridgeObjectRelease();
    }

    __break(1u);
    goto LABEL_30;
  }

  LOWORD(v10) = v26;
  uint64_t v19 = sub_1890C4A98(v26, *((uint64_t *)&v26 + 1), &qword_18C768648);
  if (*(void *)(v19 + 16) == 1LL)
  {
    sub_1890D51E0(v19 + 32, (uint64_t)&v26);
    result = (void *)swift_bridgeObjectRelease();
    if (!v27)
    {
      __break(1u);
      return result;
    }

    sub_1890D2660(&v26, (uint64_t)v28);
    sub_1890C5698(a1, a2, a3, v28, a5, a6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return (void *)swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  a1 = *a2;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_30:
  }
    a1 = sub_1890EA1D4(0LL, *((void *)a1 + 2) + 1LL, 1, a1);
  unint64_t v24 = *((void *)a1 + 2);
  unint64_t v23 = *((void *)a1 + 3);
  if (v24 >= v23 >> 1) {
    a1 = sub_1890EA1D4((char *)(v23 > 1), v24 + 1, 1, a1);
  }
  *((void *)a1 + 2) = v24 + 1;
  v25 = &a1[16 * v24];
  *((_WORD *)v25 + 16) = (_WORD)v10;
  *((void *)v25 + 5) = v7;
  result = (void *)swift_bridgeObjectRelease();
  *a2 = a1;
  return result;
}

      swift_bridgeObjectRelease();
      return (void *)swift_bridgeObjectRelease();
    }
  }

  sub_1890D51E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) == 0 || (uint64_t v7 = *((void *)&v26 + 1)) == 0)
  {
    uint64_t v20 = v10[3];
    uint64_t v21 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v20);
    result = (*(void *(**)(void *__return_ptr, uint64_t, uint64_t))(v21 + 32))(v28, v20, v21);
    if (v6) {
      return result;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
    swift_dynamicCast();
    a2 = (char **)v26;
    if (*(void *)(v26 + 16) == 1LL)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v28[0] = *(void *)a1;
      *(void *)a1 = 0x8000000000000000LL;
      sub_1890D0D18((uint64_t)a2, (uint64_t)sub_1890D0CD8, 0LL, isUniquelyReferenced_nonNull_native, v28);
      *(void *)a1 = v28[0];
      return (void *)swift_bridgeObjectRelease();
    }

    __break(1u);
    goto LABEL_30;
  }

  LOWORD(v10) = v26;
  uint64_t v19 = sub_1890C4A98(v26, *((uint64_t *)&v26 + 1), &qword_18C768648);
  if (*(void *)(v19 + 16) == 1LL)
  {
    sub_1890D51E0(v19 + 32, (uint64_t)&v26);
    result = (void *)swift_bridgeObjectRelease();
    if (!v27)
    {
      __break(1u);
      return result;
    }

    sub_1890D2660(&v26, (uint64_t)v28);
    sub_1890C5A84(a1, a2, a3, v28, a5, a6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return (void *)swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  a1 = *a2;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_30:
  }
    a1 = sub_1890EA1C0(0LL, *((void *)a1 + 2) + 1LL, 1, a1);
  unint64_t v24 = *((void *)a1 + 2);
  unint64_t v23 = *((void *)a1 + 3);
  if (v24 >= v23 >> 1) {
    a1 = sub_1890EA1C0((char *)(v23 > 1), v24 + 1, 1, a1);
  }
  *((void *)a1 + 2) = v24 + 1;
  v25 = &a1[16 * v24];
  *((_WORD *)v25 + 16) = (_WORD)v10;
  *((void *)v25 + 5) = v7;
  result = (void *)swift_bridgeObjectRelease();
  *a2 = a1;
  return result;
}

      swift_bridgeObjectRelease();
      return (void *)swift_bridgeObjectRelease();
    }
  }

  sub_1890D51E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) == 0 || (uint64_t v7 = *((void *)&v26 + 1)) == 0)
  {
    uint64_t v20 = v10[3];
    uint64_t v21 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v20);
    result = (*(void *(**)(void *__return_ptr, uint64_t, uint64_t))(v21 + 32))(v28, v20, v21);
    if (v6) {
      return result;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
    swift_dynamicCast();
    a2 = (char **)v26;
    if (*(void *)(v26 + 16) == 1LL)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v28[0] = *(void *)a1;
      *(void *)a1 = 0x8000000000000000LL;
      sub_1890D0D18((uint64_t)a2, (uint64_t)sub_1890D0CD8, 0LL, isUniquelyReferenced_nonNull_native, v28);
      *(void *)a1 = v28[0];
      return (void *)swift_bridgeObjectRelease();
    }

    __break(1u);
    goto LABEL_30;
  }

  LOWORD(v10) = v26;
  uint64_t v19 = sub_1890C4A98(v26, *((uint64_t *)&v26 + 1), &qword_18C768640);
  if (*(void *)(v19 + 16) == 1LL)
  {
    sub_1890D51E0(v19 + 32, (uint64_t)&v26);
    result = (void *)swift_bridgeObjectRelease();
    if (!v27)
    {
      __break(1u);
      return result;
    }

    sub_1890D2660(&v26, (uint64_t)v28);
    sub_1890C5E70(a1, a2, a3, v28, a5, a6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return (void *)swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  a1 = *a2;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_30:
  }
    a1 = sub_1890EA1FC(0LL, *((void *)a1 + 2) + 1LL, 1, a1);
  unint64_t v24 = *((void *)a1 + 2);
  unint64_t v23 = *((void *)a1 + 3);
  if (v24 >= v23 >> 1) {
    a1 = sub_1890EA1FC((char *)(v23 > 1), v24 + 1, 1, a1);
  }
  *((void *)a1 + 2) = v24 + 1;
  v25 = &a1[16 * v24];
  *((_WORD *)v25 + 16) = (_WORD)v10;
  *((void *)v25 + 5) = v7;
  result = (void *)swift_bridgeObjectRelease();
  *a2 = a1;
  return result;
}

      swift_bridgeObjectRelease();
      return (void *)swift_bridgeObjectRelease();
    }
  }

  sub_1890D51E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) == 0 || (uint64_t v7 = *((void *)&v26 + 1)) == 0)
  {
    uint64_t v20 = v10[3];
    uint64_t v21 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v20);
    result = (*(void *(**)(void *__return_ptr, uint64_t, uint64_t))(v21 + 32))(v28, v20, v21);
    if (v6) {
      return result;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
    swift_dynamicCast();
    a2 = (char **)v26;
    if (*(void *)(v26 + 16) == 1LL)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v28[0] = *(void *)a1;
      *(void *)a1 = 0x8000000000000000LL;
      sub_1890D0D18((uint64_t)a2, (uint64_t)sub_1890D0CD8, 0LL, isUniquelyReferenced_nonNull_native, v28);
      *(void *)a1 = v28[0];
      return (void *)swift_bridgeObjectRelease();
    }

    __break(1u);
    goto LABEL_30;
  }

  LOWORD(v10) = v26;
  uint64_t v19 = sub_1890C4A98(v26, *((uint64_t *)&v26 + 1), &qword_18C768640);
  if (*(void *)(v19 + 16) == 1LL)
  {
    sub_1890D51E0(v19 + 32, (uint64_t)&v26);
    result = (void *)swift_bridgeObjectRelease();
    if (!v27)
    {
      __break(1u);
      return result;
    }

    sub_1890D2660(&v26, (uint64_t)v28);
    sub_1890C625C(a1, a2, a3, v28, a5, a6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return (void *)swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  a1 = *a2;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_30:
  }
    a1 = sub_1890EA1E8(0LL, *((void *)a1 + 2) + 1LL, 1, a1);
  unint64_t v24 = *((void *)a1 + 2);
  unint64_t v23 = *((void *)a1 + 3);
  if (v24 >= v23 >> 1) {
    a1 = sub_1890EA1E8((char *)(v23 > 1), v24 + 1, 1, a1);
  }
  *((void *)a1 + 2) = v24 + 1;
  v25 = &a1[16 * v24];
  *((_WORD *)v25 + 16) = (_WORD)v10;
  *((void *)v25 + 5) = v7;
  result = (void *)swift_bridgeObjectRelease();
  *a2 = a1;
  return result;
}

void *sub_1890C52AC(char *a1, char **a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = (void *)a4;
  sub_1890D51E0(a4, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768628);
  type metadata accessor for EntitlementsQuery();
  if (swift_dynamicCast())
  {
    uint64_t v14 = swift_retain();
    MEMORY[0x1895DF650](v14);
    if (*(void *)((*a3 & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((*a3 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
      sub_1890F1644();
    }
    sub_1890F1650();
    sub_1890F162C();
    return (void *)swift_release();
  }

  sub_1890D51E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) != 0)
  {
    uint64_t v7 = *((void *)&v26 + 1);
    if (*((void *)&v26 + 1))
    {
      uint64_t v16 = sub_1890C4A98((unsigned __int16)v26, *((uint64_t *)&v26 + 1), &qword_18C768630);
      uint64_t v17 = *(void *)(v16 + 16);
      if (v17)
      {
        v28[6] = v16;
        uint64_t v18 = v16 + 32;
        while (1)
        {
          sub_1890D51E0(v18, (uint64_t)v28);
          sub_1890C52AC(a1, a2, a3, v28, a5, a6);
          if (v6) {
            break;
          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
          v18 += 40LL;
          if (!--v17) {
            goto LABEL_26;
          }
        }

        __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      }

void *sub_1890C5698(char *a1, char **a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = (void *)a4;
  sub_1890D51E0(a4, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768628);
  type metadata accessor for EntitlementsQuery();
  if (swift_dynamicCast())
  {
    uint64_t v14 = swift_retain();
    MEMORY[0x1895DF650](v14);
    if (*(void *)((*a3 & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((*a3 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
      sub_1890F1644();
    }
    sub_1890F1650();
    sub_1890F162C();
    return (void *)swift_release();
  }

  sub_1890D51E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) != 0)
  {
    uint64_t v7 = *((void *)&v26 + 1);
    if (*((void *)&v26 + 1))
    {
      uint64_t v16 = sub_1890C4A98((unsigned __int16)v26, *((uint64_t *)&v26 + 1), &qword_18C768648);
      uint64_t v17 = *(void *)(v16 + 16);
      if (v17)
      {
        v28[6] = v16;
        uint64_t v18 = v16 + 32;
        while (1)
        {
          sub_1890D51E0(v18, (uint64_t)v28);
          sub_1890C5698(a1, a2, a3, v28, a5, a6);
          if (v6) {
            break;
          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
          v18 += 40LL;
          if (!--v17) {
            goto LABEL_26;
          }
        }

        __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      }

void *sub_1890C5A84(char *a1, char **a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = (void *)a4;
  sub_1890D51E0(a4, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768628);
  type metadata accessor for EntitlementsQuery();
  if (swift_dynamicCast())
  {
    uint64_t v14 = swift_retain();
    MEMORY[0x1895DF650](v14);
    if (*(void *)((*a3 & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((*a3 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
      sub_1890F1644();
    }
    sub_1890F1650();
    sub_1890F162C();
    return (void *)swift_release();
  }

  sub_1890D51E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) != 0)
  {
    uint64_t v7 = *((void *)&v26 + 1);
    if (*((void *)&v26 + 1))
    {
      uint64_t v16 = sub_1890C4A98((unsigned __int16)v26, *((uint64_t *)&v26 + 1), &qword_18C768648);
      uint64_t v17 = *(void *)(v16 + 16);
      if (v17)
      {
        v28[6] = v16;
        uint64_t v18 = v16 + 32;
        while (1)
        {
          sub_1890D51E0(v18, (uint64_t)v28);
          sub_1890C5A84(a1, a2, a3, v28, a5, a6);
          if (v6) {
            break;
          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
          v18 += 40LL;
          if (!--v17) {
            goto LABEL_26;
          }
        }

        __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      }

void *sub_1890C5E70(char *a1, char **a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = (void *)a4;
  sub_1890D51E0(a4, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768628);
  type metadata accessor for EntitlementsQuery();
  if (swift_dynamicCast())
  {
    uint64_t v14 = swift_retain();
    MEMORY[0x1895DF650](v14);
    if (*(void *)((*a3 & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((*a3 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
      sub_1890F1644();
    }
    sub_1890F1650();
    sub_1890F162C();
    return (void *)swift_release();
  }

  sub_1890D51E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) != 0)
  {
    uint64_t v7 = *((void *)&v26 + 1);
    if (*((void *)&v26 + 1))
    {
      uint64_t v16 = sub_1890C4A98((unsigned __int16)v26, *((uint64_t *)&v26 + 1), &qword_18C768640);
      uint64_t v17 = *(void *)(v16 + 16);
      if (v17)
      {
        v28[6] = v16;
        uint64_t v18 = v16 + 32;
        while (1)
        {
          sub_1890D51E0(v18, (uint64_t)v28);
          sub_1890C5E70(a1, a2, a3, v28, a5, a6);
          if (v6) {
            break;
          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
          v18 += 40LL;
          if (!--v17) {
            goto LABEL_26;
          }
        }

        __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      }

void *sub_1890C625C(char *a1, char **a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = (void *)a4;
  sub_1890D51E0(a4, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768628);
  type metadata accessor for EntitlementsQuery();
  if (swift_dynamicCast())
  {
    uint64_t v14 = swift_retain();
    MEMORY[0x1895DF650](v14);
    if (*(void *)((*a3 & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((*a3 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
      sub_1890F1644();
    }
    sub_1890F1650();
    sub_1890F162C();
    return (void *)swift_release();
  }

  sub_1890D51E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) != 0)
  {
    uint64_t v7 = *((void *)&v26 + 1);
    if (*((void *)&v26 + 1))
    {
      uint64_t v16 = sub_1890C4A98((unsigned __int16)v26, *((uint64_t *)&v26 + 1), &qword_18C768640);
      uint64_t v17 = *(void *)(v16 + 16);
      if (v17)
      {
        v28[6] = v16;
        uint64_t v18 = v16 + 32;
        while (1)
        {
          sub_1890D51E0(v18, (uint64_t)v28);
          sub_1890C625C(a1, a2, a3, v28, a5, a6);
          if (v6) {
            break;
          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
          v18 += 40LL;
          if (!--v17) {
            goto LABEL_26;
          }
        }

        __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      }

uint64_t sub_1890C6648@<X0>( uint64_t a1@<X0>, unint64_t *a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>)
{
  return sub_1890C7290( a1,  a2,  a3,  (void (*)(unint64_t *, uint64_t *, unint64_t *, uint64_t, unint64_t *, unint64_t))sub_1890C4EC0,  (uint64_t)sub_1890D5164,  &qword_18C768630,  (void (*)(void *__return_ptr))sub_1890C6698,  (uint64_t)sub_1890D51C4,  a4,  (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))sub_1890D51C4);
}

uint64_t sub_1890C6698@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  int64_t v5 = a3;
  uint64_t v6 = a2;
  v103 = a4;
  __int16 v101 = a2;
  LODWORD(v8) = a2 >> 8;
  v102 = a3;
  uint64_t v9 = (char *)MEMORY[0x18961AFE8];
  unint64_t v10 = sub_1890C7D78(MEMORY[0x18961AFE8]);
  v99 = v9;
  unint64_t v100 = v10;
  v98 = v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11)
  {
    uint64_t v12 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_1890C52AC((char *)&v100, &v99, &v98, v12, v6, (uint64_t)v5);
      if (v4) {
        break;
      }
      v12 += 40LL;
      if (!--v11)
      {
        unint64_t v10 = swift_bridgeObjectRelease();
        unint64_t v13 = (unint64_t)v98;
        goto LABEL_7;
      }
    }

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }

  unint64_t v13 = (unint64_t)v9;
LABEL_7:
  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v80 = sub_1890F16BC();
    unint64_t v10 = swift_bridgeObjectRelease();
    if (v80 > 1)
    {
LABEL_9:
      MEMORY[0x1895F8858](v10);
      v83 = (unint64_t *)&v101;
      int64_t v5 = sub_1890C4BF8( (void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t *))sub_1890D5164,  (uint64_t)v82,  v13);
      swift_bridgeObjectRelease();
      if (v4)
      {
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }

      *(void *)&__int128 v92 = v5;
      unint64_t v26 = v100;
      if (!*(void *)(v100 + 16))
      {
        uint64_t isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease();
        goto LABEL_36;
      }

      __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685D8);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_1890F1C30;
      uint64_t v27 = sub_1890EFBB4(HIBYTE(v101));
      *(void *)(v6 + 56) = MEMORY[0x189617FA8];
      *(void *)(v6 + 64) = &off_18A349C48;
      *(void *)(v6 + 32) = v27;
      *(void *)(v6 + 40) = v28;
      *(void *)(v6 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
      *(void *)(v6 + 104) = &off_18A349CF0;
      *(void *)(v6 + 72) = v26;
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
LABEL_22:
        unint64_t v31 = v5[2];
        unint64_t v30 = v5[3];
        if (v31 >= v30 >> 1)
        {
          uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_1890EA184((void *)(v30 > 1), v31 + 1, 1, v5);
          int64_t v5 = (void *)isUniquelyReferenced_nonNull_native;
        }

        v5[2] = v31 + 1;
        v5[v31 + 4] = v6;
        *(void *)&__int128 v92 = v5;
LABEL_36:
        v43 = v99;
        LOWORD(v95) = v101;
        v96 = v102;
        MEMORY[0x1895F8858](isUniquelyReferenced_nonNull_native);
        v83 = &v95;
        uint64_t v44 = sub_1890C4D90( (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))sub_1890D5148,  (uint64_t)v82,  (uint64_t)v43);
        if (!v4)
        {
          v45 = (void *)v44;
          swift_bridgeObjectRelease();
          v46 = v45;
LABEL_43:
          sub_1890C847C(v46);
          uint64_t v49 = v92;
          uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685B0);
          v50 = v103;
          v103[3] = result;
          v50[4] = &off_18A349CF8;
          void *v50 = v49;
          return result;
        }

LABEL_40:
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }

        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }

LABEL_93:
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_1890EA184(0LL, v5[2] + 1LL, 1, v5);
      int64_t v5 = (void *)isUniquelyReferenced_nonNull_native;
      goto LABEL_22;
    }

    swift_bridgeObjectRetain();
    uint64_t v81 = sub_1890F16BC();
    swift_bridgeObjectRelease();
    if (v81 != 1) {
      goto LABEL_26;
    }
    swift_bridgeObjectRetain();
    if (!sub_1890F16BC())
    {
      swift_bridgeObjectRelease();
      __break(1u);
LABEL_87:
      __break(1u);
LABEL_88:
      __break(1u);
LABEL_89:
      __break(1u);
      goto LABEL_90;
    }
  }

  else
  {
    unint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (v14 > 1) {
      goto LABEL_9;
    }
    if (v14 != 1) {
      goto LABEL_26;
    }
    swift_bridgeObjectRetain();
  }

  LODWORD(v90) = v8;
  if ((v13 & 0xC000000000000001LL) != 0)
  {
LABEL_90:
    uint64_t v16 = MEMORY[0x1895DF6C8](0LL, v13);
    goto LABEL_16;
  }

  if (!*(void *)((v13 & 0xFFFFFFFFFFFFF8LL) + 0x10))
  {
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }

  uint64_t v16 = *(void *)(v13 + 32);
  swift_retain();
LABEL_16:
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685E0);
  uint64_t inited = swift_initStackObject();
  __int128 v89 = xmmword_1890F1C20;
  *(_OWORD *)(inited + 16) = xmmword_1890F1C20;
  *(void *)(inited + 32) = sub_1890EFBB4(*(_BYTE *)(v16 + 16));
  *(void *)(inited + 40) = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685E8);
  uint64_t v19 = swift_initStackObject();
  *(_OWORD *)(v19 + 16) = v89;
  *(void *)(v19 + 32) = sub_1890EFBB4(*(_BYTE *)(v16 + 17));
  *(void *)(v19 + 40) = v20;
  *(void *)(v19 + 48) = *(void *)(v16 + 24);
  swift_bridgeObjectRetain();
  *(void *)(inited + 48) = sub_1890C8368(v19, &qword_18C768620);
  unint64_t v21 = sub_1890C8368(inited, &qword_18C768618);
  v97[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685F0);
  v97[2] = &off_18A349CF0;
  unint64_t v95 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
  swift_dynamicCast();
  uint64_t v22 = v92;
  uint64_t v23 = *(void *)(v92 + 16);
  swift_release();
  if (v23 != 1)
  {
    __break(1u);
    goto LABEL_92;
  }

  unint64_t v24 = v100;
  char v25 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v95 = v24;
  sub_1890D0D18(v22, (uint64_t)sub_1890D0CD8, 0LL, v25, &v95);
  LODWORD(v8) = v90;
  if (v4)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_34:
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }

  unint64_t v100 = v95;
  swift_bridgeObjectRelease();
LABEL_26:
  v32 = v99;
  unint64_t v33 = *((void *)v99 + 2);
  if (v33 > 1)
  {
    swift_bridgeObjectRelease();
    *(void *)&__int128 v92 = v9;
    unint64_t v34 = v100;
    if (*(void *)(v100 + 16))
    {
      LODWORD(v90) = v8;
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685D8);
      uint64_t v35 = swift_allocObject();
      *(_OWORD *)(v35 + 16) = xmmword_1890F1C30;
      uint64_t v36 = sub_1890EFBB4(BYTE1(v6));
      *(void *)(v35 + 56) = MEMORY[0x189617FA8];
      *(void *)(v35 + 64) = &off_18A349C48;
      *(void *)(v35 + 32) = v36;
      *(void *)(v35 + 40) = v37;
      *(void *)(v35 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
      *(void *)(v35 + 104) = &off_18A349CF0;
      *(void *)(v35 + 72) = v34;
      v38 = sub_1890EA184(0LL, 1LL, 1, MEMORY[0x18961AFE8]);
      v39 = v38;
      unint64_t v8 = v38[2];
      unint64_t v40 = v38[3];
      if (v8 >= v40 >> 1)
      {
        v38 = sub_1890EA184((void *)(v40 > 1), v8 + 1, 1, v38);
        v39 = v38;
      }

      v39[2] = v8 + 1;
      v39[v8 + 4] = v35;
      *(void *)&__int128 v92 = v39;
      LOBYTE(v8) = v90;
    }

    else
    {
      v38 = (void *)swift_bridgeObjectRelease();
    }

    LOBYTE(v95) = v6;
    BYTE1(v95) = v8;
    v96 = v5;
    MEMORY[0x1895F8858](v38);
    v83 = &v95;
    uint64_t v47 = sub_1890C4D90( (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))sub_1890D5148,  (uint64_t)v82,  (uint64_t)v32);
    if (!v4)
    {
      v48 = (void *)v47;
      swift_bridgeObjectRelease();
      v46 = v48;
      goto LABEL_43;
    }

    goto LABEL_40;
  }

  if (v33 == 1)
  {
    uint64_t v41 = *((void *)v99 + 5);
    uint64_t v42 = *((unsigned __int16 *)v99 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1890C85BC(v42, v41, &qword_18C768630, (void (*)(void *__return_ptr))sub_1890C6648, &v95);
    if (v4) {
      goto LABEL_34;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
    unint64_t v13 = (unint64_t)&v92;
    uint64_t v9 = (char *)&v95;
    swift_dynamicCast();
    uint64_t v51 = v92;
    uint64_t v52 = *(void *)(v92 + 16);
    swift_bridgeObjectRelease();
    if (v52 != 1)
    {
LABEL_95:
      __break(1u);
LABEL_96:
      uint64_t result = sub_1890F1854();
      __break(1u);
      return result;
    }

    int64_t v90 = 0LL;
    uint64_t v88 = v51;
    uint64_t v53 = *(void *)(v51 + 64);
    uint64_t v85 = v51 + 64;
    uint64_t v54 = 1LL << *(_BYTE *)(v51 + 32);
    uint64_t v55 = -1LL;
    if (v54 < 64) {
      uint64_t v55 = ~(-1LL << v54);
    }
    uint64_t v6 = v55 & v53;
    int64_t v5 = (void *)v100;
    int64_t v86 = (unint64_t)(v54 + 63) >> 6;
    v87 = v93;
    *(void *)&__int128 v89 = v97;
    int64_t v84 = v86 - 1;
    while (!v6)
    {
      int64_t v62 = v90 + 1;
      if (__OFADD__(v90, 1LL)) {
        goto LABEL_89;
      }
      if (v62 < v86)
      {
        unint64_t v63 = *(void *)(v85 + 8 * v62);
        if (v63) {
          goto LABEL_56;
        }
        int64_t v64 = v90 + 2;
        ++v90;
        if (v62 + 1 < v86)
        {
          unint64_t v63 = *(void *)(v85 + 8 * v64);
          if (v63)
          {
            ++v62;
            goto LABEL_56;
          }

          int64_t v65 = v62 + 2;
          int64_t v90 = v62 + 1;
          if (v62 + 2 < v86)
          {
            unint64_t v63 = *(void *)(v85 + 8 * v65);
            if (!v63)
            {
              while (1)
              {
                int64_t v62 = v65 + 1;
                if (__OFADD__(v65, 1LL)) {
                  break;
                }
                if (v62 >= v86)
                {
                  int64_t v90 = v84;
                  goto LABEL_68;
                }

                unint64_t v63 = *(void *)(v85 + 8 * v62);
                ++v65;
                if (v63) {
                  goto LABEL_56;
                }
              }

              __break(1u);
              goto LABEL_95;
            }

            v62 += 2LL;
LABEL_56:
            uint64_t v6 = (v63 - 1) & v63;
            unint64_t v58 = __clz(__rbit64(v63)) + (v62 << 6);
            int64_t v90 = v62;
LABEL_52:
            uint64_t v59 = *(void *)(v88 + 56);
            v60 = (void *)(*(void *)(v88 + 48) + 16 * v58);
            uint64_t v61 = v60[1];
            *(void *)&__int128 v92 = *v60;
            *((void *)&v92 + 1) = v61;
            sub_1890D51E0(v59 + 40 * v58, (uint64_t)v87);
            swift_bridgeObjectRetain();
            goto LABEL_69;
          }
        }
      }

LABEL_68:
      uint64_t v6 = 0LL;
      uint64_t v94 = 0LL;
      memset(v93, 0, sizeof(v93));
      __int128 v92 = 0u;
LABEL_69:
      sub_1890D5100((uint64_t)&v92, (uint64_t)&v95);
      uint64_t v66 = (uint64_t)v96;
      if (!v96)
      {
        swift_release();
        goto LABEL_82;
      }

      uint64_t v67 = v95;
      sub_1890D2660((__int128 *)v89, (uint64_t)&v92);
      unint64_t v13 = swift_isUniquelyReferenced_nonNull_native();
      v91 = v5;
      unint64_t v69 = sub_1890D146C(v67, v66);
      uint64_t v70 = v5[2];
      BOOL v71 = (v68 & 1) == 0;
      uint64_t v72 = v70 + v71;
      if (__OFADD__(v70, v71)) {
        goto LABEL_87;
      }
      uint64_t v9 = v68;
      if (v5[3] >= v72)
      {
        if ((v13 & 1) != 0)
        {
          int64_t v5 = v91;
        }

        else
        {
          sub_1890D14D0();
          int64_t v5 = v91;
        }
      }

      else
      {
        sub_1890D1148(v72, v13);
        unint64_t v73 = sub_1890D146C(v67, v66);
        unint64_t v69 = v73;
        int64_t v5 = v91;
        if ((v9 & 1) != 0)
        {
LABEL_48:
          uint64_t v56 = v5[7] + 40 * v69;
          __swift_destroy_boxed_opaque_existential_1(v56);
          sub_1890D2660(&v92, v56);
          goto LABEL_49;
        }
      }

      v5[(v69 >> 6) + 8] |= 1LL << v69;
      v75 = (uint64_t *)(v5[6] + 16 * v69);
      uint64_t *v75 = v67;
      v75[1] = v66;
      sub_1890D2660(&v92, v5[7] + 40 * v69);
      uint64_t v76 = v5[2];
      BOOL v77 = __OFADD__(v76, 1LL);
      uint64_t v78 = v76 + 1;
      if (v77) {
        goto LABEL_88;
      }
      v5[2] = v78;
      swift_bridgeObjectRetain();
LABEL_49:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }

    unint64_t v57 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v58 = v57 | (v90 << 6);
    goto LABEL_52;
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int64_t v5 = (void *)v100;
LABEL_82:
  v79 = v103;
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
  v79[3] = result;
  v79[4] = &off_18A349CF0;
  void *v79 = v5;
  return result;
}

uint64_t sub_1890C7150@<X0>( uint64_t a1@<X0>, unint64_t *a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>)
{
  return sub_1890C7290( a1,  a2,  a3,  (void (*)(unint64_t *, uint64_t *, unint64_t *, uint64_t, unint64_t *, unint64_t))sub_1890C5698,  (uint64_t)sub_1890D5164,  &qword_18C768648,  (void (*)(void *__return_ptr))sub_1890C71A0,  (uint64_t)sub_1890D5278,  a4,  (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))sub_1890D5278);
}

uint64_t sub_1890C71A0@<X0>( uint64_t a1@<X0>, unint64_t *a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>)
{
  return sub_1890C7290( a1,  a2,  a3,  (void (*)(unint64_t *, uint64_t *, unint64_t *, uint64_t, unint64_t *, unint64_t))sub_1890C5A84,  (uint64_t)sub_1890D5164,  &qword_18C768648,  (void (*)(void *__return_ptr))sub_1890C7150,  (uint64_t)sub_1890D525C,  a4,  (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))sub_1890D525C);
}

uint64_t sub_1890C71F0@<X0>( uint64_t a1@<X0>, unint64_t *a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>)
{
  return sub_1890C7290( a1,  a2,  a3,  (void (*)(unint64_t *, uint64_t *, unint64_t *, uint64_t, unint64_t *, unint64_t))sub_1890C5E70,  (uint64_t)sub_1890D5164,  &qword_18C768640,  (void (*)(void *__return_ptr))sub_1890C7240,  (uint64_t)sub_1890D5240,  a4,  (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))sub_1890D5240);
}

uint64_t sub_1890C7240@<X0>( uint64_t a1@<X0>, unint64_t *a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>)
{
  return sub_1890C7290( a1,  a2,  a3,  (void (*)(unint64_t *, uint64_t *, unint64_t *, uint64_t, unint64_t *, unint64_t))sub_1890C625C,  (uint64_t)sub_1890D5164,  &qword_18C768640,  (void (*)(void *__return_ptr))sub_1890C71F0,  (uint64_t)sub_1890D5224,  a4,  (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))sub_1890D5224);
}

uint64_t sub_1890C7290@<X0>( uint64_t a1@<X0>, unint64_t *a2@<X1>, unint64_t a3@<X2>, void (*a4)(unint64_t *, uint64_t *, unint64_t *, uint64_t, unint64_t *, unint64_t)@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X5>, void (*a7)(void *__return_ptr)@<X6>, uint64_t a8@<X7>, void *a9@<X8>, void (*a10)(uint64_t *__return_ptr, __int16 *, uint64_t *))
{
  void (*v16)(uint64_t *__return_ptr, __int16 *, uint64_t *);
  unint64_t v17;
  void (*v18)(uint64_t *__return_ptr, __int16 *, uint64_t *);
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;
  uint64_t inited;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t isUniquelyReferenced_nonNull_native;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void (*v55)(uint64_t *__return_ptr, __int16 *, uint64_t *);
  uint64_t v56;
  void *v57;
  _UNKNOWN **v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  BOOL v77;
  uint64_t v78;
  char v79;
  unint64_t v80;
  char v81;
  uint64_t *v82;
  uint64_t v83;
  BOOL v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  _BYTE v88[16];
  unint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  __int128 v92;
  uint64_t *v93;
  void (*v94)(void *__return_ptr);
  __int128 *v95;
  uint64_t v96;
  void *v97;
  __int128 v98;
  _BYTE v99[32];
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  void v103[5];
  unint64_t v104;
  uint64_t v105;
  unint64_t v106;
  __int16 v107;
  unint64_t v108;
  void *v109;
  v96 = a8;
  v93 = a6;
  uint64_t v94 = a7;
  unint64_t v13 = a3;
  unint64_t v14 = a2;
  v109 = a9;
  v107 = (__int16)a2;
  LODWORD(v95) = a2 >> 8;
  v108 = a3;
  uint64_t v16 = (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))MEMORY[0x18961AFE8];
  uint64_t v17 = sub_1890C7D78(MEMORY[0x18961AFE8]);
  v105 = (uint64_t)v16;
  v106 = v17;
  v104 = (unint64_t)v16;
  uint64_t v18 = *(void (**)(uint64_t *__return_ptr, __int16 *, uint64_t *))(a1 + 16);
  if (v18)
  {
    uint64_t v19 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      a4(&v106, &v105, &v104, v19, v14, v13);
      if (v10) {
        break;
      }
      v19 += 40LL;
      uint64_t v18 = (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))((char *)v18 - 1);
      if (!v18)
      {
        uint64_t v17 = swift_bridgeObjectRelease();
        uint64_t v20 = v104;
        uint64_t v16 = (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))MEMORY[0x18961AFE8];
        goto LABEL_7;
      }
    }

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }

  uint64_t v20 = (unint64_t)v16;
LABEL_7:
  if (v20 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = v16;
    v87 = sub_1890F16BC();
    uint64_t v17 = swift_bridgeObjectRelease();
    if (v87 > 1)
    {
LABEL_9:
      MEMORY[0x1895F8858](v17);
      __int128 v89 = (unint64_t *)&v107;
      a5 = (uint64_t)sub_1890C4BF8( (void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t *))a5,  (uint64_t)v88,  v20);
      swift_bridgeObjectRelease();
      if (v10)
      {
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }

      uint64_t v18 = a10;
      *(void *)&v98 = a5;
      unint64_t v31 = v106;
      if (!*(void *)(v106 + 16))
      {
        uint64_t isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease();
        goto LABEL_36;
      }

      __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685D8);
      unint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_1890F1C30;
      v32 = sub_1890EFBB4(HIBYTE(v107));
      *(void *)(v13 + 56) = MEMORY[0x189617FA8];
      *(void *)(v13 + 64) = &off_18A349C48;
      *(void *)(v13 + 32) = v32;
      *(void *)(v13 + 40) = v33;
      *(void *)(v13 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
      *(void *)(v13 + 104) = &off_18A349CF0;
      *(void *)(v13 + 72) = v31;
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
LABEL_22:
        uint64_t v36 = *(void *)(a5 + 16);
        uint64_t v35 = *(void *)(a5 + 24);
        if (v36 >= v35 >> 1)
        {
          uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_1890EA184((void *)(v35 > 1), v36 + 1, 1, (void *)a5);
          a5 = isUniquelyReferenced_nonNull_native;
        }

        *(void *)(a5 + 16) = v36 + 1;
        *(void *)(a5 + 8 * v36 + 32) = v13;
        *(void *)&v98 = a5;
LABEL_36:
        uint64_t v51 = v105;
        LOWORD(v101) = v107;
        v102 = v108;
        MEMORY[0x1895F8858](isUniquelyReferenced_nonNull_native);
        __int128 v89 = &v101;
        uint64_t v52 = sub_1890C4D90(v18, (uint64_t)v88, v51);
        if (!v10)
        {
          uint64_t v53 = (void *)v52;
          swift_bridgeObjectRelease();
          uint64_t v54 = v53;
LABEL_43:
          sub_1890C847C(v54);
          v50 = (void *)v98;
          uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685B0);
          unint64_t v58 = &off_18A349CF8;
LABEL_85:
          int64_t v86 = v109;
          v109[3] = result;
          v86[4] = v58;
          *int64_t v86 = v50;
          return result;
        }

LABEL_96:
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_1890EA184(0LL, *(void *)(a5 + 16) + 1LL, 1, (void *)a5);
      a5 = isUniquelyReferenced_nonNull_native;
      goto LABEL_22;
    }

    uint64_t v16 = v18;
    swift_bridgeObjectRetain();
    a5 = sub_1890F16BC();
    swift_bridgeObjectRelease();
    if (a5 != 1) {
      goto LABEL_26;
    }
    swift_bridgeObjectRetain();
    if (!sub_1890F16BC())
    {
      swift_bridgeObjectRelease();
      __break(1u);
LABEL_90:
      __break(1u);
LABEL_91:
      __break(1u);
LABEL_92:
      __break(1u);
      goto LABEL_93;
    }
  }

  else
  {
    unint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (v21 > 1) {
      goto LABEL_9;
    }
    if (v21 != 1) {
      goto LABEL_26;
    }
    swift_bridgeObjectRetain();
  }

  if ((v20 & 0xC000000000000001LL) != 0)
  {
LABEL_93:
    a5 = MEMORY[0x1895DF6C8](0LL, v20);
    goto LABEL_16;
  }

  if (!*(void *)((v20 & 0xFFFFFFFFFFFFF8LL) + 0x10))
  {
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }

  a5 = *(void *)(v20 + 32);
  swift_retain();
LABEL_16:
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685E0);
  uint64_t inited = swift_initStackObject();
  __int128 v92 = xmmword_1890F1C20;
  *(_OWORD *)(inited + 16) = xmmword_1890F1C20;
  *(void *)(inited + 32) = sub_1890EFBB4(*(_BYTE *)(a5 + 16));
  *(void *)(inited + 40) = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685E8);
  char v25 = swift_initStackObject();
  *(_OWORD *)(v25 + 16) = v92;
  *(void *)(v25 + 32) = sub_1890EFBB4(*(_BYTE *)(a5 + 17));
  *(void *)(v25 + 40) = v26;
  *(void *)(v25 + 48) = *(void *)(a5 + 24);
  swift_bridgeObjectRetain();
  *(void *)(inited + 48) = sub_1890C8368(v25, &qword_18C768620);
  uint64_t v27 = sub_1890C8368(inited, &qword_18C768618);
  v103[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685F0);
  v103[2] = &off_18A349CF0;
  __int16 v101 = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
  swift_dynamicCast();
  uint64_t v28 = v98;
  uint64_t v18 = *(void (**)(uint64_t *__return_ptr, __int16 *, uint64_t *))(v98 + 16);
  swift_release();
  if (v18 != (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))1)
  {
    __break(1u);
    goto LABEL_95;
  }

  v29 = v106;
  unint64_t v30 = swift_isUniquelyReferenced_nonNull_native();
  __int16 v101 = v29;
  sub_1890D0D18(v28, (uint64_t)sub_1890D0CD8, 0LL, v30, &v101);
  uint64_t v16 = (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))MEMORY[0x18961AFE8];
  if (v10)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }

  v106 = v101;
  swift_bridgeObjectRelease();
LABEL_26:
  uint64_t v37 = v105;
  v38 = *(void *)(v105 + 16);
  if (v38 > 1)
  {
    swift_bridgeObjectRelease();
    *(void *)&v98 = v16;
    v39 = v106;
    if (*(void *)(v106 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685D8);
      unint64_t v40 = swift_allocObject();
      *(_OWORD *)(v40 + 16) = xmmword_1890F1C30;
      uint64_t v41 = sub_1890EFBB4(BYTE1(v14));
      *(void *)(v40 + 56) = MEMORY[0x189617FA8];
      *(void *)(v40 + 64) = &off_18A349C48;
      *(void *)(v40 + 32) = v41;
      *(void *)(v40 + 40) = v42;
      *(void *)(v40 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
      *(void *)(v40 + 104) = &off_18A349CF0;
      *(void *)(v40 + 72) = v39;
      v43 = sub_1890EA184(0LL, 1LL, 1, MEMORY[0x18961AFE8]);
      v45 = v43[2];
      uint64_t v44 = v43[3];
      if (v45 >= v44 >> 1) {
        v43 = sub_1890EA184((void *)(v44 > 1), v45 + 1, 1, v43);
      }
      v46 = v96;
      uint64_t v47 = (char)v95;
      v43[2] = v45 + 1;
      v43[v45 + 4] = v40;
      *(void *)&v98 = v43;
    }

    else
    {
      swift_bridgeObjectRelease();
      v46 = v96;
      uint64_t v47 = (char)v95;
    }

    LOBYTE(v101) = (_BYTE)v14;
    BYTE1(v101) = v47;
    v102 = v13;
    uint64_t v55 = (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))MEMORY[0x1895F8858](v46);
    __int128 v89 = &v101;
    uint64_t v56 = sub_1890C4D90(v55, (uint64_t)v88, v37);
    if (!v10)
    {
      unint64_t v57 = (void *)v56;
      swift_bridgeObjectRelease();
      uint64_t v54 = v57;
      goto LABEL_43;
    }

    goto LABEL_40;
  }

  if (v38 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v50 = (void *)v106;
LABEL_84:
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
    unint64_t v58 = &off_18A349CF0;
    goto LABEL_85;
  }

  v48 = *(void *)(v105 + 40);
  uint64_t v49 = *(unsigned __int16 *)(v105 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1890C85BC(v49, v48, v93, v94, &v101);
  if (v10)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
  unint64_t v14 = &v101;
  swift_dynamicCast();
  uint64_t v59 = v98;
  v60 = *(void *)(v98 + 16);
  swift_bridgeObjectRelease();
  if (v60 == 1)
  {
    uint64_t v94 = (void (*)(void *__return_ptr))v59;
    uint64_t v61 = *(void *)(v59 + 64);
    v91 = v59 + 64;
    int64_t v62 = 1LL << *(_BYTE *)(v59 + 32);
    unint64_t v63 = -1LL;
    if (v62 < 64) {
      unint64_t v63 = ~(-1LL << v62);
    }
    unint64_t v13 = v63 & v61;
    v50 = (void *)v106;
    v93 = (uint64_t *)v99;
    unint64_t v95 = (__int128 *)v103;
    v96 = 0LL;
    *(void *)&__int128 v92 = (unint64_t)(v62 + 63) >> 6;
    int64_t v90 = v92 - 1;
    while (!v13)
    {
      uint64_t v70 = v96 + 1;
      if (__OFADD__(v96, 1LL)) {
        goto LABEL_92;
      }
      if (v70 < (uint64_t)v92)
      {
        BOOL v71 = *(void *)(v91 + 8 * v70);
        if (v71) {
          goto LABEL_56;
        }
        uint64_t v72 = v96 + 2;
        ++v96;
        if (v70 + 1 < (uint64_t)v92)
        {
          BOOL v71 = *(void *)(v91 + 8 * v72);
          if (v71) {
            goto LABEL_59;
          }
          v96 = v70 + 1;
          if (v70 + 2 < (uint64_t)v92)
          {
            BOOL v71 = *(void *)(v91 + 8 * (v70 + 2));
            if (v71)
            {
              v70 += 2LL;
              goto LABEL_56;
            }

            uint64_t v72 = v70 + 3;
            v96 = v70 + 2;
            if (v70 + 3 < (uint64_t)v92)
            {
              BOOL v71 = *(void *)(v91 + 8 * v72);
              if (!v71)
              {
                while (1)
                {
                  uint64_t v70 = v72 + 1;
                  if (__OFADD__(v72, 1LL)) {
                    goto LABEL_98;
                  }
                  if (v70 >= (uint64_t)v92)
                  {
                    v96 = v90;
                    goto LABEL_70;
                  }

                  BOOL v71 = *(void *)(v91 + 8 * v70);
                  ++v72;
                  if (v71) {
                    goto LABEL_56;
                  }
                }
              }

LABEL_59:
              uint64_t v70 = v72;
LABEL_56:
              unint64_t v13 = (v71 - 1) & v71;
              uint64_t v66 = __clz(__rbit64(v71)) + (v70 << 6);
              v96 = v70;
LABEL_52:
              uint64_t v67 = *((void *)v94 + 7);
              v68 = (void *)(*((void *)v94 + 6) + 16 * v66);
              unint64_t v69 = v68[1];
              *(void *)&v98 = *v68;
              *((void *)&v98 + 1) = v69;
              sub_1890D51E0(v67 + 40 * v66, (uint64_t)v93);
              swift_bridgeObjectRetain();
              goto LABEL_71;
            }
          }
        }
      }

LABEL_70:
      unint64_t v13 = 0LL;
      unint64_t v100 = 0LL;
      memset(v99, 0, sizeof(v99));
      v98 = 0u;
LABEL_71:
      sub_1890D5100((uint64_t)&v98, (uint64_t)&v101);
      unint64_t v73 = v102;
      if (!v102)
      {
        swift_release();
        goto LABEL_84;
      }

      char v74 = v101;
      sub_1890D2660(v95, (uint64_t)&v98);
      LOWORD(v14) = swift_isUniquelyReferenced_nonNull_native();
      v97 = v50;
      uint64_t v20 = sub_1890D146C(v74, v73);
      uint64_t v76 = v50[2];
      BOOL v77 = (v75 & 1) == 0;
      uint64_t v78 = v76 + v77;
      if (__OFADD__(v76, v77)) {
        goto LABEL_90;
      }
      v79 = v75;
      if (v50[3] >= v78)
      {
        if ((v14 & 1) != 0)
        {
          v50 = v97;
          if ((v75 & 1) != 0) {
            goto LABEL_48;
          }
        }

        else
        {
          sub_1890D14D0();
          v50 = v97;
          if ((v79 & 1) != 0) {
            goto LABEL_48;
          }
        }
      }

      else
      {
        sub_1890D1148(v78, (char)v14);
        uint64_t v80 = sub_1890D146C(v74, v73);
        if ((v79 & 1) != (v81 & 1)) {
          goto LABEL_99;
        }
        uint64_t v20 = v80;
        v50 = v97;
        if ((v79 & 1) != 0)
        {
LABEL_48:
          int64_t v64 = v50[7] + 40 * v20;
          __swift_destroy_boxed_opaque_existential_1(v64);
          sub_1890D2660(&v98, v64);
          goto LABEL_49;
        }
      }

      v50[(v20 >> 6) + 8] |= 1LL << v20;
      v82 = (uint64_t *)(v50[6] + 16 * v20);
      *v82 = v74;
      v82[1] = v73;
      sub_1890D2660(&v98, v50[7] + 40 * v20);
      v83 = v50[2];
      int64_t v84 = __OFADD__(v83, 1LL);
      uint64_t v85 = v83 + 1;
      if (v84) {
        goto LABEL_91;
      }
      v50[2] = v85;
      swift_bridgeObjectRetain();
LABEL_49:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }

    int64_t v65 = __clz(__rbit64(v13));
    v13 &= v13 - 1;
    uint64_t v66 = v65 | (v96 << 6);
    goto LABEL_52;
  }

  __break(1u);
LABEL_98:
  __break(1u);
LABEL_99:
  uint64_t result = sub_1890F1854();
  __break(1u);
  return result;
}

unint64_t sub_1890C7D78(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x18961AFF0];
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685C0);
  uint64_t v2 = sub_1890F16E0();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }

  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1890D50B8(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1890D146C(v15, v16);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = sub_1890D2660(&v17, v3[7] + 40 * result);
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1LL);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 56LL;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1890C7EA4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x18961AFF0];
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768650);
  uint64_t v2 = (void *)sub_1890F16E0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }

  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_1890D146C(v5, v6);
    if ((v9 & 1) != 0) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1LL);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1890C7FB4(uint64_t a1)
{
  return sub_1890C8368(a1, &qword_18C768658);
}

unint64_t sub_1890C7FC0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x18961AFF0];
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768680);
  uint64_t v2 = (void *)sub_1890F16E0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }

  swift_retain();
  uint64_t v4 = (unint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v7 = *(v4 - 1);
    unint64_t v8 = *v4;
    swift_bridgeObjectRetain();
    sub_1890D52D8(v7, v8);
    unint64_t result = sub_1890D146C(v5, v6);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    BOOL v12 = (uint64_t *)(v2[7] + 16 * result);
    *BOOL v12 = v7;
    v12[1] = v8;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1890C80E4(uint64_t a1)
{
  return sub_1890C8368(a1, &qword_18C768688);
}

unint64_t sub_1890C80F0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x18961AFF0];
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768668);
  uint64_t v2 = (void *)sub_1890F16E0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }

  swift_retain();
  uint64_t v4 = (_BYTE *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_1890D146C(v5, v6);
    if ((v9 & 1) != 0) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(_BYTE *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1LL);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1890C8200(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x18961AFF0];
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768670);
  uint64_t v2 = (void *)sub_1890F16E0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }

  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_1890D146C(v5, v6);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    BOOL v12 = (void *)(v2[7] + 16 * result);
    *BOOL v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1890C8320(uint64_t a1)
{
  return sub_1890C8368(a1, &qword_18C768678);
}

unint64_t sub_1890C832C(uint64_t a1)
{
  return sub_1890C8368(a1, &qword_18C768620);
}

unint64_t sub_1890C8338(uint64_t a1)
{
  return sub_1890C8368(a1, &qword_18C768618);
}

unint64_t sub_1890C8344(uint64_t a1)
{
  return sub_1890C8368(a1, &qword_18C768690);
}

unint64_t sub_1890C8350(uint64_t a1)
{
  return sub_1890C8368(a1, &qword_18C768698);
}

unint64_t sub_1890C835C(uint64_t a1)
{
  return sub_1890C8368(a1, &qword_18C7686A8);
}

unint64_t sub_1890C8368(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x18961AFF0];
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_1890F16E0();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }

  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v6 = *(v5 - 2);
    uint64_t v7 = *(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_1890D146C(v6, v7);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v6;
    v11[1] = v7;
    *(void *)(v3[7] + 8 * result) = v8;
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1LL);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v5 += 3;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void *sub_1890C847C(void *result)
{
  uint64_t v2 = result[2];
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16LL);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  uint64_t v6 = result;
  unint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= v3[3] >> 1)
  {
    if (v6[2]) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }

  if (v4 <= v5) {
    int64_t v10 = v4 + v2;
  }
  else {
    int64_t v10 = v4;
  }
  unint64_t result = sub_1890EA184(result, v10, 1, v3);
  uint64_t v3 = result;
  if (!v6[2])
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }

LABEL_5:
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768600);
  unint64_t result = (void *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    unint64_t result = (void *)swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }

  uint64_t v7 = v3[2];
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    v3[2] = v9;
    goto LABEL_14;
  }

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 5141LL;
      }
    }

    uint64_t v14 = sub_1890CB534();
    if (v2) {
      goto LABEL_35;
    }
    uint64_t v16 = v14;
    __int128 v17 = v15;
    uint64_t v18 = v14 >> 8;
    unint64_t v63 = &type metadata for ProcessConstraintConjunction;
    uint64_t v19 = sub_1890CFBE0();
    LOBYTE(v62) = v16;
    BYTE1(v62) = v18;
    int64_t v64 = v19;
    *((void *)&v62 + 1) = v17;
    uint64_t v20 = v66;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_1890EA314(0LL, v20[2] + 1LL, 1, v20);
      uint64_t v66 = v20;
    }

    uint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      uint64_t v66 = sub_1890EA314((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    uint64_t v6 = v63;
    int64_t v5 = v64;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
    MEMORY[0x1895F8858](v7);
    uint64_t v9 = (char *)v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    BOOL v13 = (uint64_t)v6;
LABEL_4:
    sub_1890D1998(v11, v12, (uint64_t *)&v66, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
    goto LABEL_5;
  }

  swift_bridgeObjectRelease();
  return 5141LL;
}

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 7197LL;
      }
    }

    uint64_t v14 = sub_1890CB534();
    if (v2) {
      goto LABEL_35;
    }
    uint64_t v16 = v14;
    __int128 v17 = v15;
    uint64_t v18 = v14 >> 8;
    uint64_t v61 = &type metadata for ProcessConstraintConjunction;
    uint64_t v19 = sub_1890CFBE0();
    LOBYTE(v60) = v16;
    BYTE1(v60) = v18;
    int64_t v62 = v19;
    *((void *)&v60 + 1) = v17;
    uint64_t v20 = v64;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_1890EA314(0LL, v20[2] + 1LL, 1, v20);
      int64_t v64 = v20;
    }

    uint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      int64_t v64 = sub_1890EA314((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    uint64_t v6 = v61;
    int64_t v5 = v62;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
    MEMORY[0x1895F8858](v7);
    uint64_t v9 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    BOOL v13 = (uint64_t)v6;
LABEL_4:
    sub_1890D1998(v11, v12, (uint64_t *)&v64, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
    goto LABEL_5;
  }

  swift_bridgeObjectRelease();
  return 7197LL;
}

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 5141LL;
      }
    }

    uint64_t v14 = sub_1890CCCC8();
    if (v2) {
      goto LABEL_35;
    }
    uint64_t v16 = v14;
    __int128 v17 = v15;
    uint64_t v18 = v14 >> 8;
    unint64_t v63 = &type metadata for LaunchConstraintConjunction;
    uint64_t v19 = sub_1890CFC40();
    LOBYTE(v62) = v16;
    BYTE1(v62) = v18;
    int64_t v64 = v19;
    *((void *)&v62 + 1) = v17;
    uint64_t v20 = v66;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_1890EA41C(0LL, v20[2] + 1LL, 1, v20);
      uint64_t v66 = v20;
    }

    uint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      uint64_t v66 = sub_1890EA41C((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    uint64_t v6 = v63;
    int64_t v5 = v64;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
    MEMORY[0x1895F8858](v7);
    uint64_t v9 = (char *)v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    BOOL v13 = (uint64_t)v6;
LABEL_4:
    sub_1890D1998(v11, v12, (uint64_t *)&v66, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
    goto LABEL_5;
  }

  swift_bridgeObjectRelease();
  return 5141LL;
}

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 7197LL;
      }
    }

    uint64_t v14 = sub_1890CCCC8();
    if (v2) {
      goto LABEL_35;
    }
    uint64_t v16 = v14;
    __int128 v17 = v15;
    uint64_t v18 = v14 >> 8;
    uint64_t v61 = &type metadata for LaunchConstraintConjunction;
    uint64_t v19 = sub_1890CFC40();
    LOBYTE(v60) = v16;
    BYTE1(v60) = v18;
    int64_t v62 = v19;
    *((void *)&v60 + 1) = v17;
    uint64_t v20 = v64;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_1890EA41C(0LL, v20[2] + 1LL, 1, v20);
      int64_t v64 = v20;
    }

    uint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      int64_t v64 = sub_1890EA41C((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    uint64_t v6 = v61;
    int64_t v5 = v62;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
    MEMORY[0x1895F8858](v7);
    uint64_t v9 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    BOOL v13 = (uint64_t)v6;
LABEL_4:
    sub_1890D1998(v11, v12, (uint64_t *)&v64, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
    goto LABEL_5;
  }

  swift_bridgeObjectRelease();
  return 7197LL;
}

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 5141LL;
      }
    }

    uint64_t v14 = sub_1890CDAD4();
    if (v2) {
      goto LABEL_35;
    }
    uint64_t v16 = v14;
    __int128 v17 = v15;
    uint64_t v18 = v14 >> 8;
    unint64_t v63 = &type metadata for OnDiskConstraintConjunction;
    uint64_t v19 = sub_1890CFCA0();
    LOBYTE(v62) = v16;
    BYTE1(v62) = v18;
    int64_t v64 = v19;
    *((void *)&v62 + 1) = v17;
    uint64_t v20 = v66;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_1890EA430(0LL, v20[2] + 1LL, 1, v20);
      uint64_t v66 = v20;
    }

    uint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      uint64_t v66 = sub_1890EA430((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    uint64_t v6 = v63;
    int64_t v5 = v64;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
    MEMORY[0x1895F8858](v7);
    uint64_t v9 = (char *)v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    BOOL v13 = (uint64_t)v6;
LABEL_4:
    sub_1890D1998(v11, v12, (uint64_t *)&v66, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
    goto LABEL_5;
  }

  swift_bridgeObjectRelease();
  return 5141LL;
}

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 7197LL;
      }
    }

    uint64_t v14 = sub_1890CDAD4();
    if (v2) {
      goto LABEL_35;
    }
    uint64_t v16 = v14;
    __int128 v17 = v15;
    uint64_t v18 = v14 >> 8;
    uint64_t v61 = &type metadata for OnDiskConstraintConjunction;
    uint64_t v19 = sub_1890CFCA0();
    LOBYTE(v60) = v16;
    BYTE1(v60) = v18;
    int64_t v62 = v19;
    *((void *)&v60 + 1) = v17;
    uint64_t v20 = v64;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_1890EA430(0LL, v20[2] + 1LL, 1, v20);
      int64_t v64 = v20;
    }

    uint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      int64_t v64 = sub_1890EA430((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    uint64_t v6 = v61;
    int64_t v5 = v62;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
    MEMORY[0x1895F8858](v7);
    uint64_t v9 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    BOOL v13 = (uint64_t)v6;
LABEL_4:
    sub_1890D1998(v11, v12, (uint64_t *)&v64, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
    goto LABEL_5;
  }

  swift_bridgeObjectRelease();
  return 7197LL;
}

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 5141LL;
      }
    }

    uint64_t v14 = sub_1890CE704();
    if (v2) {
      goto LABEL_35;
    }
    uint64_t v16 = v14;
    __int128 v17 = v15;
    uint64_t v18 = v14 >> 8;
    unint64_t v63 = &type metadata for OnDiskConstraintConjunction;
    uint64_t v19 = sub_1890CFCA0();
    LOBYTE(v62) = v16;
    BYTE1(v62) = v18;
    int64_t v64 = v19;
    *((void *)&v62 + 1) = v17;
    uint64_t v20 = v66;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_1890EA430(0LL, v20[2] + 1LL, 1, v20);
      uint64_t v66 = v20;
    }

    uint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      uint64_t v66 = sub_1890EA430((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    uint64_t v6 = v63;
    int64_t v5 = v64;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
    MEMORY[0x1895F8858](v7);
    uint64_t v9 = (char *)v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    BOOL v13 = (uint64_t)v6;
LABEL_4:
    sub_1890D1998(v11, v12, (uint64_t *)&v66, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
    goto LABEL_5;
  }

  swift_bridgeObjectRelease();
  return 5141LL;
}

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 7197LL;
      }
    }

    uint64_t v14 = sub_1890CE704();
    if (v2) {
      goto LABEL_35;
    }
    uint64_t v16 = v14;
    __int128 v17 = v15;
    uint64_t v18 = v14 >> 8;
    uint64_t v61 = &type metadata for OnDiskConstraintConjunction;
    uint64_t v19 = sub_1890CFCA0();
    LOBYTE(v60) = v16;
    BYTE1(v60) = v18;
    int64_t v62 = v19;
    *((void *)&v60 + 1) = v17;
    uint64_t v20 = v64;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_1890EA430(0LL, v20[2] + 1LL, 1, v20);
      int64_t v64 = v20;
    }

    uint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      int64_t v64 = sub_1890EA430((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    uint64_t v6 = v61;
    int64_t v5 = v62;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
    MEMORY[0x1895F8858](v7);
    uint64_t v9 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    BOOL v13 = (uint64_t)v6;
LABEL_4:
    sub_1890D1998(v11, v12, (uint64_t *)&v64, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
    goto LABEL_5;
  }

  swift_bridgeObjectRelease();
  return 7197LL;
}

LABEL_18:
  __break(1u);
  return result;
}

    sub_1890D25E0();
    swift_allocError();
    *__int128 v17 = 1;
    swift_willThrow();
    goto LABEL_19;
  }

  sub_1890D51E0(a1, (uint64_t)&v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_18;
  }
  if (*(void *)(v38[0] + 16) != 1LL)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }

  sub_1890DBB84(v38[0], (uint64_t)&v34);
  unint64_t result = swift_bridgeObjectRelease();
  BOOL v8 = v35;
  if (v35)
  {
    uint64_t v9 = v34;
    sub_1890D2660(&v36, (uint64_t)v38);
    sub_1890D51E0((uint64_t)v38, (uint64_t)&v34);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7696C8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      unint64_t v30 = a2;
      int64_t v10 = v31[0];
      uint64_t v11 = *(void *)(v31[0] + 16LL);
      if (v11)
      {
        v39 = v8;
        swift_bridgeObjectRetain();
        uint64_t v12 = 0LL;
        BOOL v13 = (char *)MEMORY[0x18961AFE8];
        do
        {
          uint64_t v14 = *(void *)(v10 + 8 * v12 + 32);
          if (v14 <= 3)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              BOOL v13 = sub_1890EA328(0LL, *((void *)v13 + 2) + 1LL, 1, v13, qword_18C769738);
            }
            uint64_t v16 = *((void *)v13 + 2);
            uint64_t v15 = *((void *)v13 + 3);
            if (v16 >= v15 >> 1) {
              BOOL v13 = sub_1890EA328((char *)(v15 > 1), v16 + 1, 1, v13, qword_18C769738);
            }
            *((void *)v13 + 2) = v16 + 1;
            *(void *)&v13[8 * v16 + 32] = v14;
          }

          ++v12;
        }

        while (v11 != v12);
        swift_bridgeObjectRelease();
        uint64_t v19 = *(void *)(v10 + 16);
        BOOL v8 = v39;
      }

      else
      {
        uint64_t v19 = 0LL;
        BOOL v13 = (char *)MEMORY[0x18961AFE8];
      }

      swift_bridgeObjectRelease();
      if (v19 == *((void *)v13 + 2))
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C769720);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_1890F1C20;
        *(void *)(inited + 32) = v9;
        *(void *)(inited + 40) = v8;
        *(void *)(inited + 48) = v13;
        unint64_t v21 = sub_1890C835C(inited);
        *((void *)&v36 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C769728);
        uint64_t v37 = &off_18A349CF0;
        unint64_t v34 = v21;
        sub_1890DEA1C((uint64_t)&v34, &qword_18C769730, (uint64_t)v31);
        if (v2)
        {
LABEL_30:
          __swift_destroy_boxed_opaque_existential_1(a1);
          uint64_t v18 = v38;
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
        }

        uint64_t v22 = v31[0];
        uint64_t v23 = v31[1];
        unint64_t v24 = v32;
        char v25 = v33;
        if (sub_1890EFBB4(v31[0]) == 7235876 && v26 == 0xE300000000000000LL)
        {
          swift_bridgeObjectRelease();
LABEL_32:
          *(_BYTE *)unint64_t v30 = 10;
          *(void *)(v30 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768A68);
          *(void *)(v30 + 40) = sub_1890EAE38(&qword_18C768A70, &qword_18C768A68, (uint64_t)&unk_1890F6710);
          v29 = swift_allocObject();
          *(void *)(v30 + 8) = v29;
          *(_BYTE *)(v29 + 16) = v22;
          *(void *)(v29 + 24) = v23;
          *(_BYTE *)(v29 + 32) = v24;
          *(void *)(v29 + 40) = v25;
          goto LABEL_30;
        }

        uint64_t v28 = sub_1890F183C();
        swift_bridgeObjectRelease();
        if ((v28 & 1) != 0) {
          goto LABEL_32;
        }
      }

      else
      {
        swift_bridgeObjectRelease();
      }
    }

    swift_bridgeObjectRelease();
    sub_1890D25E0();
    swift_allocError();
    *uint64_t v27 = 1;
    swift_willThrow();
    goto LABEL_30;
  }

  __break(1u);
  return result;
}

    sub_1890D25E0();
    swift_allocError();
    *__int128 v17 = 1;
    swift_willThrow();
    goto LABEL_19;
  }

  sub_1890D51E0(a1, (uint64_t)&v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_18;
  }
  if (*(void *)(v38[0] + 16) != 1LL)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }

  sub_1890DBB84(v38[0], (uint64_t)&v34);
  unint64_t result = swift_bridgeObjectRelease();
  BOOL v8 = v35;
  if (v35)
  {
    uint64_t v9 = v34;
    sub_1890D2660(&v36, (uint64_t)v38);
    sub_1890D51E0((uint64_t)v38, (uint64_t)&v34);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7696C8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      unint64_t v30 = a2;
      int64_t v10 = v31[0];
      uint64_t v11 = *(void *)(v31[0] + 16LL);
      if (v11)
      {
        v39 = v8;
        swift_bridgeObjectRetain();
        uint64_t v12 = 0LL;
        BOOL v13 = (char *)MEMORY[0x18961AFE8];
        do
        {
          uint64_t v14 = *(void *)(v10 + 8 * v12 + 32);
          if ((unint64_t)(v14 - 13) >= 0xFFFFFFFFFFFFFFF4LL)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              BOOL v13 = sub_1890EA328(0LL, *((void *)v13 + 2) + 1LL, 1, v13, &qword_18C7696F8);
            }
            uint64_t v16 = *((void *)v13 + 2);
            uint64_t v15 = *((void *)v13 + 3);
            if (v16 >= v15 >> 1) {
              BOOL v13 = sub_1890EA328((char *)(v15 > 1), v16 + 1, 1, v13, &qword_18C7696F8);
            }
            *((void *)v13 + 2) = v16 + 1;
            *(void *)&v13[8 * v16 + 32] = v14;
          }

          ++v12;
        }

        while (v11 != v12);
        swift_bridgeObjectRelease();
        uint64_t v19 = *(void *)(v10 + 16);
        BOOL v8 = v39;
      }

      else
      {
        uint64_t v19 = 0LL;
        BOOL v13 = (char *)MEMORY[0x18961AFE8];
      }

      swift_bridgeObjectRelease();
      if (v19 == *((void *)v13 + 2))
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C7696E0);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_1890F1C20;
        *(void *)(inited + 32) = v9;
        *(void *)(inited + 40) = v8;
        *(void *)(inited + 48) = v13;
        unint64_t v21 = sub_1890C8344(inited);
        *((void *)&v36 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7696E8);
        uint64_t v37 = &off_18A349CF0;
        unint64_t v34 = v21;
        sub_1890DEA1C((uint64_t)&v34, &qword_18C7696F0, (uint64_t)v31);
        if (v2)
        {
LABEL_30:
          __swift_destroy_boxed_opaque_existential_1(a1);
          uint64_t v18 = v38;
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
        }

        uint64_t v22 = v31[0];
        uint64_t v23 = v31[1];
        unint64_t v24 = v32;
        char v25 = v33;
        if (sub_1890EFBB4(v31[0]) == 7235876 && v26 == 0xE300000000000000LL)
        {
          swift_bridgeObjectRelease();
LABEL_32:
          *(_BYTE *)unint64_t v30 = 15;
          *(void *)(v30 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768B18);
          *(void *)(v30 + 40) = sub_1890EAE38(&qword_18C768B20, &qword_18C768B18, (uint64_t)&unk_1890F6710);
          v29 = swift_allocObject();
          *(void *)(v30 + 8) = v29;
          *(_BYTE *)(v29 + 16) = v22;
          *(void *)(v29 + 24) = v23;
          *(_BYTE *)(v29 + 32) = v24;
          *(void *)(v29 + 40) = v25;
          goto LABEL_30;
        }

        uint64_t v28 = sub_1890F183C();
        swift_bridgeObjectRelease();
        if ((v28 & 1) != 0) {
          goto LABEL_32;
        }
      }

      else
      {
        swift_bridgeObjectRelease();
      }
    }

    swift_bridgeObjectRelease();
    sub_1890D25E0();
    swift_allocError();
    *uint64_t v27 = 1;
    swift_willThrow();
    goto LABEL_30;
  }

  __break(1u);
  return result;
}

    sub_1890D25E0();
    swift_allocError();
    *__int128 v17 = 1;
    swift_willThrow();
    goto LABEL_19;
  }

  sub_1890D51E0(a1, (uint64_t)&v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_18;
  }
  if (*(void *)(v38[0] + 16) != 1LL)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }

  sub_1890DBB84(v38[0], (uint64_t)&v34);
  unint64_t result = swift_bridgeObjectRelease();
  BOOL v8 = v35;
  if (v35)
  {
    uint64_t v9 = v34;
    sub_1890D2660(&v36, (uint64_t)v38);
    sub_1890D51E0((uint64_t)v38, (uint64_t)&v34);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7696C8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      unint64_t v30 = a2;
      int64_t v10 = v31[0];
      uint64_t v11 = *(void *)(v31[0] + 16LL);
      if (v11)
      {
        v39 = v8;
        swift_bridgeObjectRetain();
        uint64_t v12 = 0LL;
        BOOL v13 = (char *)MEMORY[0x18961AFE8];
        do
        {
          uint64_t v14 = *(void *)(v10 + 8 * v12 + 32);
          if (v14 <= 0xA)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              BOOL v13 = sub_1890EA328(0LL, *((void *)v13 + 2) + 1LL, 1, v13, &qword_18C769718);
            }
            uint64_t v16 = *((void *)v13 + 2);
            uint64_t v15 = *((void *)v13 + 3);
            if (v16 >= v15 >> 1) {
              BOOL v13 = sub_1890EA328((char *)(v15 > 1), v16 + 1, 1, v13, &qword_18C769718);
            }
            *((void *)v13 + 2) = v16 + 1;
            *(void *)&v13[8 * v16 + 32] = v14;
          }

          ++v12;
        }

        while (v11 != v12);
        swift_bridgeObjectRelease();
        uint64_t v19 = *(void *)(v10 + 16);
        BOOL v8 = v39;
      }

      else
      {
        uint64_t v19 = 0LL;
        BOOL v13 = (char *)MEMORY[0x18961AFE8];
      }

      swift_bridgeObjectRelease();
      if (v19 == *((void *)v13 + 2))
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C769700);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_1890F1C20;
        *(void *)(inited + 32) = v9;
        *(void *)(inited + 40) = v8;
        *(void *)(inited + 48) = v13;
        unint64_t v21 = sub_1890C8350(inited);
        *((void *)&v36 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C769708);
        uint64_t v37 = &off_18A349CF0;
        unint64_t v34 = v21;
        sub_1890DEA1C((uint64_t)&v34, &qword_18C769710, (uint64_t)v31);
        if (v2)
        {
LABEL_30:
          __swift_destroy_boxed_opaque_existential_1(a1);
          uint64_t v18 = v38;
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
        }

        uint64_t v22 = v31[0];
        uint64_t v23 = v31[1];
        unint64_t v24 = v32;
        char v25 = v33;
        if (sub_1890EFBB4(v31[0]) == 7235876 && v26 == 0xE300000000000000LL)
        {
          swift_bridgeObjectRelease();
LABEL_32:
          *(_BYTE *)unint64_t v30 = 19;
          *(void *)(v30 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768BB8);
          *(void *)(v30 + 40) = sub_1890EAE38(&qword_18C768BC0, &qword_18C768BB8, (uint64_t)&unk_1890F6710);
          v29 = swift_allocObject();
          *(void *)(v30 + 8) = v29;
          *(_BYTE *)(v29 + 16) = v22;
          *(void *)(v29 + 24) = v23;
          *(_BYTE *)(v29 + 32) = v24;
          *(void *)(v29 + 40) = v25;
          goto LABEL_30;
        }

        uint64_t v28 = sub_1890F183C();
        swift_bridgeObjectRelease();
        if ((v28 & 1) != 0) {
          goto LABEL_32;
        }
      }

      else
      {
        swift_bridgeObjectRelease();
      }
    }

    swift_bridgeObjectRelease();
    sub_1890D25E0();
    swift_allocError();
    *uint64_t v27 = 1;
    swift_willThrow();
    goto LABEL_30;
  }

  __break(1u);
  return result;
}

uint64_t sub_1890C8574@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_1890C85BC(a1, a2, &qword_18C768630, (void (*)(void *__return_ptr))sub_1890C6648, a3);
}

uint64_t sub_1890C8598@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_1890C85BC(a1, a2, &qword_18C768630, (void (*)(void *__return_ptr))sub_1890C6698, a3);
}

uint64_t sub_1890C85BC@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void (*a4)(void *__return_ptr)@<X3>, unint64_t *a5@<X8>)
{
  __int16 v7 = a1;
  sub_1890C4A98(a1, a2, a3);
  a4(v15);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v5)
  {
    sub_1890D51E0((uint64_t)v15, (uint64_t)v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A0);
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      LOBYTE(v7) = HIBYTE(v7);
      swift_bridgeObjectRelease();
    }

    else
    {
      sub_1890D51E0((uint64_t)v15, (uint64_t)v14);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685B0);
      uint64_t result = swift_dynamicCast();
      if ((result & 1) == 0)
      {
        __break(1u);
        return result;
      }

      swift_bridgeObjectRelease();
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685B8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1890F1C20;
    *(void *)(inited + 32) = sub_1890EFBB4(v7);
    *(void *)(inited + 40) = v12;
    sub_1890D51E0((uint64_t)v15, inited + 48);
    unint64_t v13 = sub_1890C7D78(inited);
    a5[3] = v10;
    a5[4] = (unint64_t)&off_18A349CF0;
    *a5 = v13;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  }

  return result;
}

uint64_t sub_1890C8738@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_1890C85BC(a1, a2, &qword_18C768648, (void (*)(void *__return_ptr))sub_1890C7150, a3);
}

uint64_t sub_1890C875C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_1890C85BC(a1, a2, &qword_18C768648, (void (*)(void *__return_ptr))sub_1890C71A0, a3);
}

uint64_t sub_1890C8780@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_1890C85BC(a1, a2, &qword_18C768640, (void (*)(void *__return_ptr))sub_1890C71F0, a3);
}

uint64_t sub_1890C87A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_1890C85BC(a1, a2, &qword_18C768640, (void (*)(void *__return_ptr))sub_1890C7240, a3);
}

_OWORD *sub_1890C87C8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (v2)
  {
    MEMORY[0x1895DFB0C](v2);
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v7 = 0u;
    sub_1890D531C((uint64_t)&v7, &qword_18C768260);
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
    sub_1890D26BC();
    sub_1890F17DC();
    __int128 v10 = v7;
    __int128 v11 = v8;
    __int128 v12 = v9;
    a2[3] = &type metadata for CodeDirectoryHash;
    a2[4] = sub_1890D2F1C();
  }

  else
  {
    __int128 v10 = v7;
    __int128 v11 = v8;
    __int128 v12 = v9;
    a2[3] = &type metadata for AppleInternal;
    a2[4] = sub_1890D2F60();
  }

  uint64_t result = (_OWORD *)swift_allocObject();
  *a2 = result;
  __int128 v6 = v11;
  result[1] = v10;
  result[2] = v6;
  result[3] = v12;
  return result;
}

_OWORD *sub_1890C93C0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (v2)
  {
    MEMORY[0x1895DFB0C](v2);
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v7 = 0u;
    sub_1890D531C((uint64_t)&v7, &qword_18C768260);
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
    sub_1890D26BC();
    sub_1890F17DC();
    __int128 v10 = v7;
    __int128 v11 = v8;
    __int128 v12 = v9;
    a2[3] = &type metadata for CodeDirectoryHash;
    a2[4] = sub_1890D4180();
  }

  else
  {
    __int128 v10 = v7;
    __int128 v11 = v8;
    __int128 v12 = v9;
    a2[3] = &type metadata for AppleInternal;
    a2[4] = sub_1890D41C4();
  }

  uint64_t result = (_OWORD *)swift_allocObject();
  *a2 = result;
  __int128 v6 = v11;
  result[1] = v10;
  result[2] = v6;
  result[3] = v12;
  return result;
}

_OWORD *sub_1890C9FB8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (v2)
  {
    MEMORY[0x1895DFB0C](v2);
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v7 = 0u;
    sub_1890D531C((uint64_t)&v7, &qword_18C768260);
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
    sub_1890D26BC();
    sub_1890F17DC();
    __int128 v10 = v7;
    __int128 v11 = v8;
    __int128 v12 = v9;
    a2[3] = &type metadata for CodeDirectoryHash;
    a2[4] = sub_1890D4B90();
  }

  else
  {
    __int128 v10 = v7;
    __int128 v11 = v8;
    __int128 v12 = v9;
    a2[3] = &type metadata for AppleInternal;
    a2[4] = sub_1890D4BD4();
  }

  uint64_t result = (_OWORD *)swift_allocObject();
  *a2 = result;
  __int128 v6 = v11;
  result[1] = v10;
  result[2] = v6;
  result[3] = v12;
  return result;
}

uint64_t sub_1890CAB1C(uint64_t a1, uint64_t a2)
{
  int64_t v62 = (void *)MEMORY[0x18961AFE8];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v49[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40LL)
    {
      sub_1890D51E0(i, (uint64_t)v61);
      sub_1890D51E0((uint64_t)v61, (uint64_t)&v56);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768640);
      if ((swift_dynamicCast() & 1) != 0) {
        break;
      }
      sub_1890D51E0((uint64_t)v61, (uint64_t)&v56);
      uint64_t v23 = swift_dynamicCast();
      if ((v23 & 1) != 0)
      {
        unsigned int v24 = sub_1890CB028(v23, v53);
        if (v2)
        {
LABEL_28:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }

        char v26 = v24;
        uint64_t v27 = v25;
        unsigned int v28 = v24 >> 8;
        uint64_t v59 = &type metadata for ProcessConstraintDisjunction;
        unint64_t v29 = sub_1890CFD00();
        char v56 = v26;
        char v57 = v28;
        unint64_t v60 = v29;
        uint64_t v58 = v27;
        unint64_t v30 = v62;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v30 = sub_1890EA314(0LL, v30[2] + 1LL, 1, v30);
          int64_t v62 = v30;
        }

        unint64_t v32 = v30[2];
        unint64_t v31 = v30[3];
        if (v32 >= v31 >> 1) {
          int64_t v62 = sub_1890EA314((void *)(v31 > 1), v32 + 1, 1, v30);
        }
        unint64_t v33 = v59;
        uint64_t v5 = v60;
        uint64_t v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v56, (uint64_t)v59);
        MEMORY[0x1895F8858](v34);
        uint64_t v36 = (char *)v49 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        (*(void (**)(char *))(v37 + 16))(v36);
        uint64_t v11 = v32;
        uint64_t v12 = (uint64_t)v36;
        uint64_t v13 = (uint64_t)v33;
        goto LABEL_4;
      }

      sub_1890D51E0((uint64_t)v61, (uint64_t)v52);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768630);
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v51 = 0LL;
        memset(v50, 0, sizeof(v50));
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1890D531C((uint64_t)v50, &qword_18C7686B8);
        sub_1890D25E0();
        swift_allocError();
        _BYTE *v48 = 3;
        swift_willThrow();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
      }

      sub_1890D2660(v50, (uint64_t)&v56);
      sub_1890D51E0((uint64_t)&v56, (uint64_t)v52);
      v38 = v62;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        v38 = sub_1890EA314(0LL, v38[2] + 1LL, 1, v38);
        int64_t v62 = v38;
      }

      unint64_t v40 = v38[2];
      unint64_t v39 = v38[3];
      if (v40 >= v39 >> 1) {
        int64_t v62 = sub_1890EA314((void *)(v39 > 1), v40 + 1, 1, v38);
      }
      uint64_t v41 = v54;
      uint64_t v42 = v55;
      uint64_t v43 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v52, v54);
      MEMORY[0x1895F8858](v43);
      v45 = (char *)v49 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      (*(void (**)(char *))(v46 + 16))(v45);
      sub_1890D1998( v40,  (uint64_t)v45,  (uint64_t *)&v62,  v41,  v42,  (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v56);
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 5141LL;
      }
    }

    unsigned int v14 = sub_1890CAB1C();
    if (v2) {
      goto LABEL_28;
    }
    char v16 = v14;
    uint64_t v17 = v15;
    unsigned int v18 = v14 >> 8;
    uint64_t v59 = &type metadata for ProcessConstraintConjunction;
    unint64_t v19 = sub_1890CFBE0();
    char v56 = v16;
    char v57 = v18;
    unint64_t v60 = v19;
    uint64_t v58 = v17;
    uint64_t v20 = v62;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_1890EA314(0LL, v20[2] + 1LL, 1, v20);
      int64_t v62 = v20;
    }

    unint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      int64_t v62 = sub_1890EA314((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    __int128 v6 = v59;
    uint64_t v5 = v60;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v56, (uint64_t)v59);
    MEMORY[0x1895F8858](v7);
    __int128 v9 = (char *)v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    uint64_t v13 = (uint64_t)v6;
LABEL_4:
    sub_1890D1998(v11, v12, (uint64_t *)&v62, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v56);
    goto LABEL_5;
  }

  swift_bridgeObjectRelease();
  return 5141LL;
}

uint64_t sub_1890CB028(uint64_t a1, uint64_t a2)
{
  unint64_t v60 = (void *)MEMORY[0x18961AFE8];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v48[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40LL)
    {
      sub_1890D51E0(i, (uint64_t)v59);
      sub_1890D51E0((uint64_t)v59, (uint64_t)&v54);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768640);
      if ((swift_dynamicCast() & 1) != 0) {
        break;
      }
      sub_1890D51E0((uint64_t)v59, (uint64_t)&v54);
      if ((swift_dynamicCast() & 1) != 0)
      {
        unsigned int v23 = sub_1890CB028();
        if (v2)
        {
LABEL_28:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }

        char v25 = v23;
        uint64_t v26 = v24;
        unsigned int v27 = v23 >> 8;
        char v57 = &type metadata for ProcessConstraintDisjunction;
        unint64_t v28 = sub_1890CFD00();
        char v54 = v25;
        char v55 = v27;
        unint64_t v58 = v28;
        uint64_t v56 = v26;
        unint64_t v29 = v60;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v29 = sub_1890EA314(0LL, v29[2] + 1LL, 1, v29);
          unint64_t v60 = v29;
        }

        unint64_t v31 = v29[2];
        unint64_t v30 = v29[3];
        if (v31 >= v30 >> 1) {
          unint64_t v60 = sub_1890EA314((void *)(v30 > 1), v31 + 1, 1, v29);
        }
        unint64_t v32 = v57;
        uint64_t v5 = v58;
        uint64_t v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v54, (uint64_t)v57);
        MEMORY[0x1895F8858](v33);
        uint64_t v35 = (char *)v48 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        (*(void (**)(char *))(v36 + 16))(v35);
        uint64_t v11 = v31;
        uint64_t v12 = (uint64_t)v35;
        uint64_t v13 = (uint64_t)v32;
        goto LABEL_4;
      }

      sub_1890D51E0((uint64_t)v59, (uint64_t)v51);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768630);
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v50 = 0LL;
        memset(v49, 0, sizeof(v49));
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1890D531C((uint64_t)v49, &qword_18C7686B8);
        sub_1890D25E0();
        swift_allocError();
        *uint64_t v47 = 3;
        swift_willThrow();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
      }

      sub_1890D2660(v49, (uint64_t)&v54);
      sub_1890D51E0((uint64_t)&v54, (uint64_t)v51);
      uint64_t v37 = v60;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        uint64_t v37 = sub_1890EA314(0LL, v37[2] + 1LL, 1, v37);
        unint64_t v60 = v37;
      }

      unint64_t v39 = v37[2];
      unint64_t v38 = v37[3];
      if (v39 >= v38 >> 1) {
        unint64_t v60 = sub_1890EA314((void *)(v38 > 1), v39 + 1, 1, v37);
      }
      uint64_t v40 = v52;
      uint64_t v41 = v53;
      uint64_t v42 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v51, v52);
      MEMORY[0x1895F8858](v42);
      uint64_t v44 = (char *)v48 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      (*(void (**)(char *))(v45 + 16))(v44);
      sub_1890D1998( v39,  (uint64_t)v44,  (uint64_t *)&v60,  v40,  v41,  (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v54);
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 7197LL;
      }
    }

    unsigned int v14 = sub_1890CAB1C();
    if (v2) {
      goto LABEL_28;
    }
    char v16 = v14;
    uint64_t v17 = v15;
    unsigned int v18 = v14 >> 8;
    char v57 = &type metadata for ProcessConstraintConjunction;
    unint64_t v19 = sub_1890CFBE0();
    char v54 = v16;
    char v55 = v18;
    unint64_t v58 = v19;
    uint64_t v56 = v17;
    uint64_t v20 = v60;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_1890EA314(0LL, v20[2] + 1LL, 1, v20);
      unint64_t v60 = v20;
    }

    unint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      unint64_t v60 = sub_1890EA314((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    __int128 v6 = v57;
    uint64_t v5 = v58;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v54, (uint64_t)v57);
    MEMORY[0x1895F8858](v7);
    __int128 v9 = (char *)v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    uint64_t v13 = (uint64_t)v6;
LABEL_4:
    sub_1890D1998(v11, v12, (uint64_t *)&v60, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v54);
    goto LABEL_5;
  }

  swift_bridgeObjectRelease();
  return 7197LL;
}

uint64_t sub_1890CB534(uint64_t a1, uint64_t a2)
{
  uint64_t v66 = (void *)MEMORY[0x18961AFE8];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v54[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40LL)
    {
      sub_1890D51E0(i, (uint64_t)v65);
      sub_1890D51E0((uint64_t)v65, (uint64_t)&v62);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768648);
      if ((swift_dynamicCast() & 1) != 0) {
        break;
      }
      sub_1890D51E0((uint64_t)v65, (uint64_t)&v62);
      uint64_t v23 = swift_dynamicCast();
      if ((v23 & 1) != 0)
      {
        unsigned int v24 = sub_1890CBB4C(v23, v58);
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }

        char v26 = v24;
        uint64_t v27 = v25;
        unsigned int v28 = v24 >> 8;
        unint64_t v63 = &type metadata for ProcessConstraintDisjunction;
        unint64_t v29 = sub_1890CFD00();
        LOBYTE(v62) = v26;
        BYTE1(v62) = v28;
        unint64_t v64 = v29;
        *((void *)&v62 + 1) = v27;
        unint64_t v30 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v30 = sub_1890EA314(0LL, v30[2] + 1LL, 1, v30);
          uint64_t v66 = v30;
        }

        unint64_t v32 = v30[2];
        unint64_t v31 = v30[3];
        if (v32 >= v31 >> 1) {
          uint64_t v66 = sub_1890EA314((void *)(v31 > 1), v32 + 1, 1, v30);
        }
        uint64_t v33 = v63;
        uint64_t v5 = v64;
        uint64_t v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
        MEMORY[0x1895F8858](v34);
        uint64_t v36 = (char *)v54 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        (*(void (**)(char *))(v37 + 16))(v36);
        uint64_t v11 = v32;
        uint64_t v12 = (uint64_t)v36;
        uint64_t v13 = (uint64_t)v33;
        goto LABEL_4;
      }

      sub_1890D51E0((uint64_t)v65, (uint64_t)v57);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768630);
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_1890D2660(v55, (uint64_t)&v62);
        sub_1890D51E0((uint64_t)&v62, (uint64_t)v57);
        unint64_t v38 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v38 = sub_1890EA314(0LL, v38[2] + 1LL, 1, v38);
          uint64_t v66 = v38;
        }

        unint64_t v40 = v38[2];
        unint64_t v39 = v38[3];
        if (v40 >= v39 >> 1) {
          uint64_t v66 = sub_1890EA314((void *)(v39 > 1), v40 + 1, 1, v38);
        }
        uint64_t v41 = v60;
        uint64_t v42 = v61;
        uint64_t v43 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v57, v60);
        MEMORY[0x1895F8858](v43);
        uint64_t v45 = (char *)v54 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        (*(void (**)(char *))(v46 + 16))(v45);
        sub_1890D1998( v40,  (uint64_t)v45,  (uint64_t *)&v66,  v41,  v42,  (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
      }

      else
      {
        uint64_t v56 = 0LL;
        memset(v55, 0, sizeof(v55));
        sub_1890D531C((uint64_t)v55, &qword_18C7686B8);
        sub_1890D51E0((uint64_t)v65, (uint64_t)&v62);
        uint64_t result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1890D25E0();
          swift_allocError();
          *uint64_t v53 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
        }

        if ((v60 & 1) != 0)
        {
          __break(1u);
          return result;
        }

        uint64_t v48 = v59;
        swift_bridgeObjectRelease();
        uint64_t v49 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v49 = sub_1890EA314(0LL, v49[2] + 1LL, 1, v49);
        }
        unint64_t v51 = v49[2];
        unint64_t v50 = v49[3];
        if (v51 >= v50 >> 1) {
          uint64_t v49 = sub_1890EA314((void *)(v50 > 1), v51 + 1, 1, v49);
        }
        unint64_t v63 = &type metadata for ProcessCodeSigningFlags;
        unint64_t v64 = sub_1890D2ED8();
        uint64_t v52 = swift_allocObject();
        *(void *)&__int128 v62 = v52;
        *(_BYTE *)(v52 + 16) = 2;
        *(_BYTE *)(v52 + 24) = 23;
        *(void *)(v52 + 32) = v48;
        *(_BYTE *)(v52 + 40) = 0;
        *(void *)(v52 + 48) = 0LL;
        __int128 v49[2] = v51 + 1;
        sub_1890D2660(&v62, (uint64_t)&v49[5 * v51 + 4]);
        uint64_t v66 = v49;
      }

uint64_t sub_1890CBB4C(uint64_t a1, uint64_t a2)
{
  unint64_t v64 = (void *)MEMORY[0x18961AFE8];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v53[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40LL)
    {
      sub_1890D51E0(i, (uint64_t)v63);
      sub_1890D51E0((uint64_t)v63, (uint64_t)&v60);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768648);
      if ((swift_dynamicCast() & 1) != 0) {
        break;
      }
      sub_1890D51E0((uint64_t)v63, (uint64_t)&v60);
      if ((swift_dynamicCast() & 1) != 0)
      {
        unsigned int v23 = sub_1890CBB4C();
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }

        char v25 = v23;
        uint64_t v26 = v24;
        unsigned int v27 = v23 >> 8;
        uint64_t v61 = &type metadata for ProcessConstraintDisjunction;
        unint64_t v28 = sub_1890CFD00();
        LOBYTE(v60) = v25;
        BYTE1(v60) = v27;
        unint64_t v62 = v28;
        *((void *)&v60 + 1) = v26;
        unint64_t v29 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v29 = sub_1890EA314(0LL, v29[2] + 1LL, 1, v29);
          unint64_t v64 = v29;
        }

        unint64_t v31 = v29[2];
        unint64_t v30 = v29[3];
        if (v31 >= v30 >> 1) {
          unint64_t v64 = sub_1890EA314((void *)(v30 > 1), v31 + 1, 1, v29);
        }
        unint64_t v32 = v61;
        uint64_t v5 = v62;
        uint64_t v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
        MEMORY[0x1895F8858](v33);
        uint64_t v35 = (char *)v53 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        (*(void (**)(char *))(v36 + 16))(v35);
        uint64_t v11 = v31;
        uint64_t v12 = (uint64_t)v35;
        uint64_t v13 = (uint64_t)v32;
        goto LABEL_4;
      }

      sub_1890D51E0((uint64_t)v63, (uint64_t)v56);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768630);
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_1890D2660(v54, (uint64_t)&v60);
        sub_1890D51E0((uint64_t)&v60, (uint64_t)v56);
        uint64_t v37 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          uint64_t v37 = sub_1890EA314(0LL, v37[2] + 1LL, 1, v37);
          unint64_t v64 = v37;
        }

        unint64_t v39 = v37[2];
        unint64_t v38 = v37[3];
        if (v39 >= v38 >> 1) {
          unint64_t v64 = sub_1890EA314((void *)(v38 > 1), v39 + 1, 1, v37);
        }
        uint64_t v40 = v58;
        uint64_t v41 = v59;
        uint64_t v42 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v56, v58);
        MEMORY[0x1895F8858](v42);
        uint64_t v44 = (char *)v53 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        (*(void (**)(char *))(v45 + 16))(v44);
        sub_1890D1998( v39,  (uint64_t)v44,  (uint64_t *)&v64,  v40,  v41,  (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
      }

      else
      {
        uint64_t v55 = 0LL;
        memset(v54, 0, sizeof(v54));
        sub_1890D531C((uint64_t)v54, &qword_18C7686B8);
        sub_1890D51E0((uint64_t)v63, (uint64_t)&v60);
        uint64_t result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1890D25E0();
          swift_allocError();
          *uint64_t v52 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
        }

        if ((v58 & 1) != 0)
        {
          __break(1u);
          return result;
        }

        uint64_t v47 = v57;
        swift_bridgeObjectRelease();
        uint64_t v48 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v48 = sub_1890EA314(0LL, v48[2] + 1LL, 1, v48);
        }
        unint64_t v50 = v48[2];
        unint64_t v49 = v48[3];
        if (v50 >= v49 >> 1) {
          uint64_t v48 = sub_1890EA314((void *)(v49 > 1), v50 + 1, 1, v48);
        }
        uint64_t v61 = &type metadata for ProcessCodeSigningFlags;
        unint64_t v62 = sub_1890D2ED8();
        uint64_t v51 = swift_allocObject();
        *(void *)&__int128 v60 = v51;
        *(_BYTE *)(v51 + 16) = 2;
        *(_BYTE *)(v51 + 24) = 23;
        *(void *)(v51 + 32) = v47;
        *(_BYTE *)(v51 + 40) = 0;
        *(void *)(v51 + 48) = 0LL;
        void v48[2] = v50 + 1;
        sub_1890D2660(&v60, (uint64_t)&v48[5 * v50 + 4]);
        unint64_t v64 = v48;
      }

uint64_t sub_1890CC164(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1890DD8A0(*a1, *a2);
}

uint64_t sub_1890CC17C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_1890D4C18();
  *a1 = result;
  return result;
}

uint64_t sub_1890CC1B0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_1890D4C18();
  *a1 = result;
  return result;
}

uint64_t sub_1890CC1DC()
{
  return 0LL;
}

void sub_1890CC1E8(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1890CC1F4()
{
  return sub_1890F18D8();
}

uint64_t sub_1890CC21C()
{
  return sub_1890F18E4();
}

uint64_t sub_1890CC244@<X0>(unint64_t *a1@<X8>)
{
  return sub_1890CFB2C(&qword_18C768630, (void (*)(void *__return_ptr))sub_1890C6698, a1);
}

uint64_t sub_1890CC268@<X0>(uint64_t a1@<X8>)
{
  return sub_1890CFB64((uint64_t (*)(void))sub_1890D2140, a1);
}

uint64_t sub_1890CC284(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1890CDAB8(a1, a2, a3, &qword_18C768230, (void (*)(void))sub_1890D08B4);
}

uint64_t sub_1890CC2B0(uint64_t a1, uint64_t a2)
{
  unint64_t v62 = (void *)MEMORY[0x18961AFE8];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v49[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40LL)
    {
      sub_1890D51E0(i, (uint64_t)v61);
      sub_1890D51E0((uint64_t)v61, (uint64_t)&v56);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768630);
      if ((swift_dynamicCast() & 1) != 0) {
        break;
      }
      sub_1890D51E0((uint64_t)v61, (uint64_t)&v56);
      uint64_t v23 = swift_dynamicCast();
      if ((v23 & 1) != 0)
      {
        unsigned int v24 = sub_1890CC7BC(v23, v53);
        if (v2)
        {
LABEL_28:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }

        char v26 = v24;
        uint64_t v27 = v25;
        unsigned int v28 = v24 >> 8;
        uint64_t v59 = &type metadata for LaunchConstraintDisjunction;
        unint64_t v29 = sub_1890CFD60();
        char v56 = v26;
        char v57 = v28;
        unint64_t v60 = v29;
        uint64_t v58 = v27;
        unint64_t v30 = v62;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v30 = sub_1890EA41C(0LL, v30[2] + 1LL, 1, v30);
          unint64_t v62 = v30;
        }

        unint64_t v32 = v30[2];
        unint64_t v31 = v30[3];
        if (v32 >= v31 >> 1) {
          unint64_t v62 = sub_1890EA41C((void *)(v31 > 1), v32 + 1, 1, v30);
        }
        uint64_t v33 = v59;
        uint64_t v5 = v60;
        uint64_t v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v56, (uint64_t)v59);
        MEMORY[0x1895F8858](v34);
        uint64_t v36 = (char *)v49 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        (*(void (**)(char *))(v37 + 16))(v36);
        uint64_t v11 = v32;
        uint64_t v12 = (uint64_t)v36;
        uint64_t v13 = (uint64_t)v33;
        goto LABEL_4;
      }

      sub_1890D51E0((uint64_t)v61, (uint64_t)v52);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768640);
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v51 = 0LL;
        memset(v50, 0, sizeof(v50));
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1890D531C((uint64_t)v50, &qword_18C7686B0);
        sub_1890D25E0();
        swift_allocError();
        _BYTE *v48 = 3;
        swift_willThrow();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
      }

      sub_1890D2660(v50, (uint64_t)&v56);
      sub_1890D51E0((uint64_t)&v56, (uint64_t)v52);
      unint64_t v38 = v62;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        unint64_t v38 = sub_1890EA41C(0LL, v38[2] + 1LL, 1, v38);
        unint64_t v62 = v38;
      }

      unint64_t v40 = v38[2];
      unint64_t v39 = v38[3];
      if (v40 >= v39 >> 1) {
        unint64_t v62 = sub_1890EA41C((void *)(v39 > 1), v40 + 1, 1, v38);
      }
      uint64_t v41 = v54;
      uint64_t v42 = v55;
      uint64_t v43 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v52, v54);
      MEMORY[0x1895F8858](v43);
      uint64_t v45 = (char *)v49 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      (*(void (**)(char *))(v46 + 16))(v45);
      sub_1890D1998( v40,  (uint64_t)v45,  (uint64_t *)&v62,  v41,  v42,  (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v56);
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 5141LL;
      }
    }

    unsigned int v14 = sub_1890CC2B0();
    if (v2) {
      goto LABEL_28;
    }
    char v16 = v14;
    uint64_t v17 = v15;
    unsigned int v18 = v14 >> 8;
    uint64_t v59 = &type metadata for LaunchConstraintConjunction;
    unint64_t v19 = sub_1890CFC40();
    char v56 = v16;
    char v57 = v18;
    unint64_t v60 = v19;
    uint64_t v58 = v17;
    uint64_t v20 = v62;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_1890EA41C(0LL, v20[2] + 1LL, 1, v20);
      unint64_t v62 = v20;
    }

    unint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      unint64_t v62 = sub_1890EA41C((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    __int128 v6 = v59;
    uint64_t v5 = v60;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v56, (uint64_t)v59);
    MEMORY[0x1895F8858](v7);
    __int128 v9 = (char *)v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    uint64_t v13 = (uint64_t)v6;
LABEL_4:
    sub_1890D1998(v11, v12, (uint64_t *)&v62, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v56);
    goto LABEL_5;
  }

  swift_bridgeObjectRelease();
  return 5141LL;
}

uint64_t sub_1890CC7BC(uint64_t a1, uint64_t a2)
{
  unint64_t v60 = (void *)MEMORY[0x18961AFE8];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v48[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40LL)
    {
      sub_1890D51E0(i, (uint64_t)v59);
      sub_1890D51E0((uint64_t)v59, (uint64_t)&v54);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768630);
      if ((swift_dynamicCast() & 1) != 0) {
        break;
      }
      sub_1890D51E0((uint64_t)v59, (uint64_t)&v54);
      if ((swift_dynamicCast() & 1) != 0)
      {
        unsigned int v23 = sub_1890CC7BC();
        if (v2)
        {
LABEL_28:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }

        char v25 = v23;
        uint64_t v26 = v24;
        unsigned int v27 = v23 >> 8;
        char v57 = &type metadata for LaunchConstraintDisjunction;
        unint64_t v28 = sub_1890CFD60();
        char v54 = v25;
        char v55 = v27;
        unint64_t v58 = v28;
        uint64_t v56 = v26;
        unint64_t v29 = v60;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v29 = sub_1890EA41C(0LL, v29[2] + 1LL, 1, v29);
          unint64_t v60 = v29;
        }

        unint64_t v31 = v29[2];
        unint64_t v30 = v29[3];
        if (v31 >= v30 >> 1) {
          unint64_t v60 = sub_1890EA41C((void *)(v30 > 1), v31 + 1, 1, v29);
        }
        unint64_t v32 = v57;
        uint64_t v5 = v58;
        uint64_t v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v54, (uint64_t)v57);
        MEMORY[0x1895F8858](v33);
        uint64_t v35 = (char *)v48 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        (*(void (**)(char *))(v36 + 16))(v35);
        uint64_t v11 = v31;
        uint64_t v12 = (uint64_t)v35;
        uint64_t v13 = (uint64_t)v32;
        goto LABEL_4;
      }

      sub_1890D51E0((uint64_t)v59, (uint64_t)v51);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768640);
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v50 = 0LL;
        memset(v49, 0, sizeof(v49));
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1890D531C((uint64_t)v49, &qword_18C7686B0);
        sub_1890D25E0();
        swift_allocError();
        *uint64_t v47 = 3;
        swift_willThrow();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
      }

      sub_1890D2660(v49, (uint64_t)&v54);
      sub_1890D51E0((uint64_t)&v54, (uint64_t)v51);
      uint64_t v37 = v60;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        uint64_t v37 = sub_1890EA41C(0LL, v37[2] + 1LL, 1, v37);
        unint64_t v60 = v37;
      }

      unint64_t v39 = v37[2];
      unint64_t v38 = v37[3];
      if (v39 >= v38 >> 1) {
        unint64_t v60 = sub_1890EA41C((void *)(v38 > 1), v39 + 1, 1, v37);
      }
      uint64_t v40 = v52;
      uint64_t v41 = v53;
      uint64_t v42 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v51, v52);
      MEMORY[0x1895F8858](v42);
      uint64_t v44 = (char *)v48 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      (*(void (**)(char *))(v45 + 16))(v44);
      sub_1890D1998( v39,  (uint64_t)v44,  (uint64_t *)&v60,  v40,  v41,  (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v54);
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 7197LL;
      }
    }

    unsigned int v14 = sub_1890CC2B0();
    if (v2) {
      goto LABEL_28;
    }
    char v16 = v14;
    uint64_t v17 = v15;
    unsigned int v18 = v14 >> 8;
    char v57 = &type metadata for LaunchConstraintConjunction;
    unint64_t v19 = sub_1890CFC40();
    char v54 = v16;
    char v55 = v18;
    unint64_t v58 = v19;
    uint64_t v56 = v17;
    uint64_t v20 = v60;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v20 = sub_1890EA41C(0LL, v20[2] + 1LL, 1, v20);
      unint64_t v60 = v20;
    }

    unint64_t v22 = v20[2];
    unint64_t v21 = v20[3];
    if (v22 >= v21 >> 1) {
      unint64_t v60 = sub_1890EA41C((void *)(v21 > 1), v22 + 1, 1, v20);
    }
    __int128 v6 = v57;
    uint64_t v5 = v58;
    uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v54, (uint64_t)v57);
    MEMORY[0x1895F8858](v7);
    __int128 v9 = (char *)v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v10 + 16))(v9);
    uint64_t v11 = v22;
    uint64_t v12 = (uint64_t)v9;
    uint64_t v13 = (uint64_t)v6;
LABEL_4:
    sub_1890D1998(v11, v12, (uint64_t *)&v60, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v54);
    goto LABEL_5;
  }

  swift_bridgeObjectRelease();
  return 7197LL;
}

uint64_t sub_1890CCCC8(uint64_t a1, uint64_t a2)
{
  uint64_t v66 = (void *)MEMORY[0x18961AFE8];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v54[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40LL)
    {
      sub_1890D51E0(i, (uint64_t)v65);
      sub_1890D51E0((uint64_t)v65, (uint64_t)&v62);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768648);
      if ((swift_dynamicCast() & 1) != 0) {
        break;
      }
      sub_1890D51E0((uint64_t)v65, (uint64_t)&v62);
      uint64_t v23 = swift_dynamicCast();
      if ((v23 & 1) != 0)
      {
        unsigned int v24 = sub_1890CD2E0(v23, v58);
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }

        char v26 = v24;
        uint64_t v27 = v25;
        unsigned int v28 = v24 >> 8;
        unint64_t v63 = &type metadata for LaunchConstraintDisjunction;
        unint64_t v29 = sub_1890CFD60();
        LOBYTE(v62) = v26;
        BYTE1(v62) = v28;
        unint64_t v64 = v29;
        *((void *)&v62 + 1) = v27;
        unint64_t v30 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v30 = sub_1890EA41C(0LL, v30[2] + 1LL, 1, v30);
          uint64_t v66 = v30;
        }

        unint64_t v32 = v30[2];
        unint64_t v31 = v30[3];
        if (v32 >= v31 >> 1) {
          uint64_t v66 = sub_1890EA41C((void *)(v31 > 1), v32 + 1, 1, v30);
        }
        uint64_t v33 = v63;
        uint64_t v5 = v64;
        uint64_t v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
        MEMORY[0x1895F8858](v34);
        uint64_t v36 = (char *)v54 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        (*(void (**)(char *))(v37 + 16))(v36);
        uint64_t v11 = v32;
        uint64_t v12 = (uint64_t)v36;
        uint64_t v13 = (uint64_t)v33;
        goto LABEL_4;
      }

      sub_1890D51E0((uint64_t)v65, (uint64_t)v57);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768640);
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_1890D2660(v55, (uint64_t)&v62);
        sub_1890D51E0((uint64_t)&v62, (uint64_t)v57);
        unint64_t v38 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v38 = sub_1890EA41C(0LL, v38[2] + 1LL, 1, v38);
          uint64_t v66 = v38;
        }

        unint64_t v40 = v38[2];
        unint64_t v39 = v38[3];
        if (v40 >= v39 >> 1) {
          uint64_t v66 = sub_1890EA41C((void *)(v39 > 1), v40 + 1, 1, v38);
        }
        uint64_t v41 = v60;
        uint64_t v42 = v61;
        uint64_t v43 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v57, v60);
        MEMORY[0x1895F8858](v43);
        uint64_t v45 = (char *)v54 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        (*(void (**)(char *))(v46 + 16))(v45);
        sub_1890D1998( v40,  (uint64_t)v45,  (uint64_t *)&v66,  v41,  v42,  (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
      }

      else
      {
        uint64_t v56 = 0LL;
        memset(v55, 0, sizeof(v55));
        sub_1890D531C((uint64_t)v55, &qword_18C7686B0);
        sub_1890D51E0((uint64_t)v65, (uint64_t)&v62);
        uint64_t result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1890D25E0();
          swift_allocError();
          *uint64_t v53 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
        }

        if ((v60 & 1) != 0)
        {
          __break(1u);
          return result;
        }

        uint64_t v48 = v59;
        swift_bridgeObjectRelease();
        unint64_t v49 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v49 = sub_1890EA41C(0LL, v49[2] + 1LL, 1, v49);
        }
        unint64_t v51 = v49[2];
        unint64_t v50 = v49[3];
        if (v51 >= v50 >> 1) {
          unint64_t v49 = sub_1890EA41C((void *)(v50 > 1), v51 + 1, 1, v49);
        }
        unint64_t v63 = &type metadata for ProcessCodeSigningFlags;
        unint64_t v64 = sub_1890D413C();
        uint64_t v52 = swift_allocObject();
        *(void *)&__int128 v62 = v52;
        *(_BYTE *)(v52 + 16) = 2;
        *(_BYTE *)(v52 + 24) = 23;
        *(void *)(v52 + 32) = v48;
        *(_BYTE *)(v52 + 40) = 0;
        *(void *)(v52 + 48) = 0LL;
        __int128 v49[2] = v51 + 1;
        sub_1890D2660(&v62, (uint64_t)&v49[5 * v51 + 4]);
        uint64_t v66 = v49;
      }

uint64_t sub_1890CD2E0(uint64_t a1, uint64_t a2)
{
  unint64_t v64 = (void *)MEMORY[0x18961AFE8];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v53[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40LL)
    {
      sub_1890D51E0(i, (uint64_t)v63);
      sub_1890D51E0((uint64_t)v63, (uint64_t)&v60);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768648);
      if ((swift_dynamicCast() & 1) != 0) {
        break;
      }
      sub_1890D51E0((uint64_t)v63, (uint64_t)&v60);
      if ((swift_dynamicCast() & 1) != 0)
      {
        unsigned int v23 = sub_1890CD2E0();
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }

        char v25 = v23;
        uint64_t v26 = v24;
        unsigned int v27 = v23 >> 8;
        uint64_t v61 = &type metadata for LaunchConstraintDisjunction;
        unint64_t v28 = sub_1890CFD60();
        LOBYTE(v60) = v25;
        BYTE1(v60) = v27;
        unint64_t v62 = v28;
        *((void *)&v60 + 1) = v26;
        unint64_t v29 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v29 = sub_1890EA41C(0LL, v29[2] + 1LL, 1, v29);
          unint64_t v64 = v29;
        }

        unint64_t v31 = v29[2];
        unint64_t v30 = v29[3];
        if (v31 >= v30 >> 1) {
          unint64_t v64 = sub_1890EA41C((void *)(v30 > 1), v31 + 1, 1, v29);
        }
        unint64_t v32 = v61;
        uint64_t v5 = v62;
        uint64_t v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
        MEMORY[0x1895F8858](v33);
        uint64_t v35 = (char *)v53 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        (*(void (**)(char *))(v36 + 16))(v35);
        uint64_t v11 = v31;
        uint64_t v12 = (uint64_t)v35;
        uint64_t v13 = (uint64_t)v32;
        goto LABEL_4;
      }

      sub_1890D51E0((uint64_t)v63, (uint64_t)v56);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768640);
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_1890D2660(v54, (uint64_t)&v60);
        sub_1890D51E0((uint64_t)&v60, (uint64_t)v56);
        uint64_t v37 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          uint64_t v37 = sub_1890EA41C(0LL, v37[2] + 1LL, 1, v37);
          unint64_t v64 = v37;
        }

        unint64_t v39 = v37[2];
        unint64_t v38 = v37[3];
        if (v39 >= v38 >> 1) {
          unint64_t v64 = sub_1890EA41C((void *)(v38 > 1), v39 + 1, 1, v37);
        }
        uint64_t v40 = v58;
        uint64_t v41 = v59;
        uint64_t v42 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v56, v58);
        MEMORY[0x1895F8858](v42);
        uint64_t v44 = (char *)v53 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        (*(void (**)(char *))(v45 + 16))(v44);
        sub_1890D1998( v39,  (uint64_t)v44,  (uint64_t *)&v64,  v40,  v41,  (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
      }

      else
      {
        uint64_t v55 = 0LL;
        memset(v54, 0, sizeof(v54));
        sub_1890D531C((uint64_t)v54, &qword_18C7686B0);
        sub_1890D51E0((uint64_t)v63, (uint64_t)&v60);
        uint64_t result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1890D25E0();
          swift_allocError();
          *uint64_t v52 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
        }

        if ((v58 & 1) != 0)
        {
          __break(1u);
          return result;
        }

        uint64_t v47 = v57;
        swift_bridgeObjectRelease();
        uint64_t v48 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v48 = sub_1890EA41C(0LL, v48[2] + 1LL, 1, v48);
        }
        unint64_t v50 = v48[2];
        unint64_t v49 = v48[3];
        if (v50 >= v49 >> 1) {
          uint64_t v48 = sub_1890EA41C((void *)(v49 > 1), v50 + 1, 1, v48);
        }
        uint64_t v61 = &type metadata for ProcessCodeSigningFlags;
        unint64_t v62 = sub_1890D413C();
        uint64_t v51 = swift_allocObject();
        *(void *)&__int128 v60 = v51;
        *(_BYTE *)(v51 + 16) = 2;
        *(_BYTE *)(v51 + 24) = 23;
        *(void *)(v51 + 32) = v47;
        *(_BYTE *)(v51 + 40) = 0;
        *(void *)(v51 + 48) = 0LL;
        void v48[2] = v50 + 1;
        sub_1890D2660(&v60, (uint64_t)&v48[5 * v50 + 4]);
        unint64_t v64 = v48;
      }

uint64_t sub_1890CD8F8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_1890D4C18();
  *a1 = result;
  return result;
}

void sub_1890CD92C(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE300000000000000LL;
  unint64_t v4 = 0xE800000000000000LL;
  uint64_t v5 = 0x79654B7961727261LL;
  if (v2 != 1)
  {
    uint64_t v5 = 0x65756C6176LL;
    unint64_t v4 = 0xE500000000000000LL;
  }

  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 7955819LL;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_1890CD980()
{
  uint64_t v1 = 0x79654B7961727261LL;
  if (*v0 != 1) {
    uint64_t v1 = 0x65756C6176LL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 7955819LL;
  }
}

uint64_t sub_1890CD9D0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_1890D4C18();
  *a1 = result;
  return result;
}

uint64_t sub_1890CD9FC()
{
  return sub_1890F18D8();
}

uint64_t sub_1890CDA24()
{
  return sub_1890F18E4();
}

uint64_t sub_1890CDA4C@<X0>(unint64_t *a1@<X8>)
{
  return sub_1890CFB2C(&qword_18C768640, (void (*)(void *__return_ptr))sub_1890C7240, a1);
}

uint64_t sub_1890CDA70@<X0>(uint64_t a1@<X8>)
{
  return sub_1890CFB64((uint64_t (*)(void))sub_1890D2FA4, a1);
}

uint64_t sub_1890CDA8C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1890CDAB8(a1, a2, a3, &qword_18C768410, (void (*)(void))sub_1890D3CFC);
}

uint64_t sub_1890CDAB8(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(void))
{
  return sub_1890CF8CC(a1, *v5, *((void *)v5 + 1), a4, a5);
}

uint64_t sub_1890CDAD4(uint64_t a1, uint64_t a2)
{
  uint64_t v66 = (void *)MEMORY[0x18961AFE8];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v54[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40LL)
    {
      sub_1890D51E0(i, (uint64_t)v65);
      sub_1890D51E0((uint64_t)v65, (uint64_t)&v62);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768640);
      if ((swift_dynamicCast() & 1) != 0) {
        break;
      }
      sub_1890D51E0((uint64_t)v65, (uint64_t)&v62);
      uint64_t v23 = swift_dynamicCast();
      if ((v23 & 1) != 0)
      {
        unsigned int v24 = sub_1890CE0EC(v23, v58);
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }

        char v26 = v24;
        uint64_t v27 = v25;
        unsigned int v28 = v24 >> 8;
        unint64_t v63 = &type metadata for OnDiskConstraintDisjunction;
        unint64_t v29 = sub_1890CFE20();
        LOBYTE(v62) = v26;
        BYTE1(v62) = v28;
        unint64_t v64 = v29;
        *((void *)&v62 + 1) = v27;
        unint64_t v30 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v30 = sub_1890EA430(0LL, v30[2] + 1LL, 1, v30);
          uint64_t v66 = v30;
        }

        unint64_t v32 = v30[2];
        unint64_t v31 = v30[3];
        if (v32 >= v31 >> 1) {
          uint64_t v66 = sub_1890EA430((void *)(v31 > 1), v32 + 1, 1, v30);
        }
        uint64_t v33 = v63;
        uint64_t v5 = v64;
        uint64_t v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
        MEMORY[0x1895F8858](v34);
        uint64_t v36 = (char *)v54 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        (*(void (**)(char *))(v37 + 16))(v36);
        uint64_t v11 = v32;
        uint64_t v12 = (uint64_t)v36;
        uint64_t v13 = (uint64_t)v33;
        goto LABEL_4;
      }

      sub_1890D51E0((uint64_t)v65, (uint64_t)v57);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768648);
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_1890D2660(v55, (uint64_t)&v62);
        sub_1890D51E0((uint64_t)&v62, (uint64_t)v57);
        unint64_t v38 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v38 = sub_1890EA430(0LL, v38[2] + 1LL, 1, v38);
          uint64_t v66 = v38;
        }

        unint64_t v40 = v38[2];
        unint64_t v39 = v38[3];
        if (v40 >= v39 >> 1) {
          uint64_t v66 = sub_1890EA430((void *)(v39 > 1), v40 + 1, 1, v38);
        }
        uint64_t v41 = v60;
        uint64_t v42 = v61;
        uint64_t v43 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v57, v60);
        MEMORY[0x1895F8858](v43);
        uint64_t v45 = (char *)v54 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        (*(void (**)(char *))(v46 + 16))(v45);
        sub_1890D1998( v40,  (uint64_t)v45,  (uint64_t *)&v66,  v41,  v42,  (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
      }

      else
      {
        uint64_t v56 = 0LL;
        memset(v55, 0, sizeof(v55));
        sub_1890D531C((uint64_t)v55, &qword_18C7686A0);
        sub_1890D51E0((uint64_t)v65, (uint64_t)&v62);
        uint64_t result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1890D25E0();
          swift_allocError();
          *uint64_t v53 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
        }

        if ((v60 & 1) != 0)
        {
          __break(1u);
          return result;
        }

        uint64_t v48 = v59;
        swift_bridgeObjectRelease();
        unint64_t v49 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v49 = sub_1890EA430(0LL, v49[2] + 1LL, 1, v49);
        }
        unint64_t v51 = v49[2];
        unint64_t v50 = v49[3];
        if (v51 >= v50 >> 1) {
          unint64_t v49 = sub_1890EA430((void *)(v50 > 1), v51 + 1, 1, v49);
        }
        unint64_t v63 = &type metadata for OnDiskCodeSigningFlags;
        unint64_t v64 = sub_1890D4B28();
        uint64_t v52 = swift_allocObject();
        *(void *)&__int128 v62 = v52;
        *(_BYTE *)(v52 + 16) = 2;
        *(_BYTE *)(v52 + 24) = 23;
        *(void *)(v52 + 32) = v48;
        *(_BYTE *)(v52 + 40) = 0;
        *(void *)(v52 + 48) = 0LL;
        __int128 v49[2] = v51 + 1;
        sub_1890D2660(&v62, (uint64_t)&v49[5 * v51 + 4]);
        uint64_t v66 = v49;
      }

uint64_t sub_1890CE0EC(uint64_t a1, uint64_t a2)
{
  unint64_t v64 = (void *)MEMORY[0x18961AFE8];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v53[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40LL)
    {
      sub_1890D51E0(i, (uint64_t)v63);
      sub_1890D51E0((uint64_t)v63, (uint64_t)&v60);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768640);
      if ((swift_dynamicCast() & 1) != 0) {
        break;
      }
      sub_1890D51E0((uint64_t)v63, (uint64_t)&v60);
      if ((swift_dynamicCast() & 1) != 0)
      {
        unsigned int v23 = sub_1890CE0EC();
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }

        char v25 = v23;
        uint64_t v26 = v24;
        unsigned int v27 = v23 >> 8;
        uint64_t v61 = &type metadata for OnDiskConstraintDisjunction;
        unint64_t v28 = sub_1890CFE20();
        LOBYTE(v60) = v25;
        BYTE1(v60) = v27;
        unint64_t v62 = v28;
        *((void *)&v60 + 1) = v26;
        unint64_t v29 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v29 = sub_1890EA430(0LL, v29[2] + 1LL, 1, v29);
          unint64_t v64 = v29;
        }

        unint64_t v31 = v29[2];
        unint64_t v30 = v29[3];
        if (v31 >= v30 >> 1) {
          unint64_t v64 = sub_1890EA430((void *)(v30 > 1), v31 + 1, 1, v29);
        }
        unint64_t v32 = v61;
        uint64_t v5 = v62;
        uint64_t v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
        MEMORY[0x1895F8858](v33);
        uint64_t v35 = (char *)v53 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        (*(void (**)(char *))(v36 + 16))(v35);
        uint64_t v11 = v31;
        uint64_t v12 = (uint64_t)v35;
        uint64_t v13 = (uint64_t)v32;
        goto LABEL_4;
      }

      sub_1890D51E0((uint64_t)v63, (uint64_t)v56);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768648);
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_1890D2660(v54, (uint64_t)&v60);
        sub_1890D51E0((uint64_t)&v60, (uint64_t)v56);
        uint64_t v37 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          uint64_t v37 = sub_1890EA430(0LL, v37[2] + 1LL, 1, v37);
          unint64_t v64 = v37;
        }

        unint64_t v39 = v37[2];
        unint64_t v38 = v37[3];
        if (v39 >= v38 >> 1) {
          unint64_t v64 = sub_1890EA430((void *)(v38 > 1), v39 + 1, 1, v37);
        }
        uint64_t v40 = v58;
        uint64_t v41 = v59;
        uint64_t v42 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v56, v58);
        MEMORY[0x1895F8858](v42);
        uint64_t v44 = (char *)v53 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        (*(void (**)(char *))(v45 + 16))(v44);
        sub_1890D1998( v39,  (uint64_t)v44,  (uint64_t *)&v64,  v40,  v41,  (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
      }

      else
      {
        uint64_t v55 = 0LL;
        memset(v54, 0, sizeof(v54));
        sub_1890D531C((uint64_t)v54, &qword_18C7686A0);
        sub_1890D51E0((uint64_t)v63, (uint64_t)&v60);
        uint64_t result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1890D25E0();
          swift_allocError();
          *uint64_t v52 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
        }

        if ((v58 & 1) != 0)
        {
          __break(1u);
          return result;
        }

        uint64_t v47 = v57;
        swift_bridgeObjectRelease();
        uint64_t v48 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v48 = sub_1890EA430(0LL, v48[2] + 1LL, 1, v48);
        }
        unint64_t v50 = v48[2];
        unint64_t v49 = v48[3];
        if (v50 >= v49 >> 1) {
          uint64_t v48 = sub_1890EA430((void *)(v49 > 1), v50 + 1, 1, v48);
        }
        uint64_t v61 = &type metadata for OnDiskCodeSigningFlags;
        unint64_t v62 = sub_1890D4B28();
        uint64_t v51 = swift_allocObject();
        *(void *)&__int128 v60 = v51;
        *(_BYTE *)(v51 + 16) = 2;
        *(_BYTE *)(v51 + 24) = 23;
        *(void *)(v51 + 32) = v47;
        *(_BYTE *)(v51 + 40) = 0;
        *(void *)(v51 + 48) = 0LL;
        void v48[2] = v50 + 1;
        sub_1890D2660(&v60, (uint64_t)&v48[5 * v50 + 4]);
        unint64_t v64 = v48;
      }

uint64_t sub_1890CE704(uint64_t a1, uint64_t a2)
{
  uint64_t v66 = (void *)MEMORY[0x18961AFE8];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v54[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40LL)
    {
      sub_1890D51E0(i, (uint64_t)v65);
      sub_1890D51E0((uint64_t)v65, (uint64_t)&v62);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768630);
      if ((swift_dynamicCast() & 1) != 0) {
        break;
      }
      sub_1890D51E0((uint64_t)v65, (uint64_t)&v62);
      uint64_t v23 = swift_dynamicCast();
      if ((v23 & 1) != 0)
      {
        unsigned int v24 = sub_1890CED1C(v23, v58);
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }

        char v26 = v24;
        uint64_t v27 = v25;
        unsigned int v28 = v24 >> 8;
        unint64_t v63 = &type metadata for OnDiskConstraintDisjunction;
        unint64_t v29 = sub_1890CFE20();
        LOBYTE(v62) = v26;
        BYTE1(v62) = v28;
        unint64_t v64 = v29;
        *((void *)&v62 + 1) = v27;
        unint64_t v30 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v30 = sub_1890EA430(0LL, v30[2] + 1LL, 1, v30);
          uint64_t v66 = v30;
        }

        unint64_t v32 = v30[2];
        unint64_t v31 = v30[3];
        if (v32 >= v31 >> 1) {
          uint64_t v66 = sub_1890EA430((void *)(v31 > 1), v32 + 1, 1, v30);
        }
        uint64_t v33 = v63;
        uint64_t v5 = v64;
        uint64_t v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
        MEMORY[0x1895F8858](v34);
        uint64_t v36 = (char *)v54 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        (*(void (**)(char *))(v37 + 16))(v36);
        uint64_t v11 = v32;
        uint64_t v12 = (uint64_t)v36;
        uint64_t v13 = (uint64_t)v33;
        goto LABEL_4;
      }

      sub_1890D51E0((uint64_t)v65, (uint64_t)v57);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768648);
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_1890D2660(v55, (uint64_t)&v62);
        sub_1890D51E0((uint64_t)&v62, (uint64_t)v57);
        unint64_t v38 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v38 = sub_1890EA430(0LL, v38[2] + 1LL, 1, v38);
          uint64_t v66 = v38;
        }

        unint64_t v40 = v38[2];
        unint64_t v39 = v38[3];
        if (v40 >= v39 >> 1) {
          uint64_t v66 = sub_1890EA430((void *)(v39 > 1), v40 + 1, 1, v38);
        }
        uint64_t v41 = v60;
        uint64_t v42 = v61;
        uint64_t v43 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v57, v60);
        MEMORY[0x1895F8858](v43);
        uint64_t v45 = (char *)v54 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        (*(void (**)(char *))(v46 + 16))(v45);
        sub_1890D1998( v40,  (uint64_t)v45,  (uint64_t *)&v66,  v41,  v42,  (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
      }

      else
      {
        uint64_t v56 = 0LL;
        memset(v55, 0, sizeof(v55));
        sub_1890D531C((uint64_t)v55, &qword_18C7686A0);
        sub_1890D51E0((uint64_t)v65, (uint64_t)&v62);
        uint64_t result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1890D25E0();
          swift_allocError();
          *uint64_t v53 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
        }

        if ((v60 & 1) != 0)
        {
          __break(1u);
          return result;
        }

        uint64_t v48 = v59;
        swift_bridgeObjectRelease();
        unint64_t v49 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v49 = sub_1890EA430(0LL, v49[2] + 1LL, 1, v49);
        }
        unint64_t v51 = v49[2];
        unint64_t v50 = v49[3];
        if (v51 >= v50 >> 1) {
          unint64_t v49 = sub_1890EA430((void *)(v50 > 1), v51 + 1, 1, v49);
        }
        unint64_t v63 = &type metadata for OnDiskCodeSigningFlags;
        unint64_t v64 = sub_1890D4B28();
        uint64_t v52 = swift_allocObject();
        *(void *)&__int128 v62 = v52;
        *(_BYTE *)(v52 + 16) = 2;
        *(_BYTE *)(v52 + 24) = 23;
        *(void *)(v52 + 32) = v48;
        *(_BYTE *)(v52 + 40) = 0;
        *(void *)(v52 + 48) = 0LL;
        __int128 v49[2] = v51 + 1;
        sub_1890D2660(&v62, (uint64_t)&v49[5 * v51 + 4]);
        uint64_t v66 = v49;
      }

uint64_t sub_1890CED1C(uint64_t a1, uint64_t a2)
{
  unint64_t v64 = (void *)MEMORY[0x18961AFE8];
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    v53[1] = a2;
    for (uint64_t i = a2 + 32; ; i += 40LL)
    {
      sub_1890D51E0(i, (uint64_t)v63);
      sub_1890D51E0((uint64_t)v63, (uint64_t)&v60);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768630);
      if ((swift_dynamicCast() & 1) != 0) {
        break;
      }
      sub_1890D51E0((uint64_t)v63, (uint64_t)&v60);
      if ((swift_dynamicCast() & 1) != 0)
      {
        unsigned int v23 = sub_1890CED1C();
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }

        char v25 = v23;
        uint64_t v26 = v24;
        unsigned int v27 = v23 >> 8;
        uint64_t v61 = &type metadata for OnDiskConstraintDisjunction;
        unint64_t v28 = sub_1890CFE20();
        LOBYTE(v60) = v25;
        BYTE1(v60) = v27;
        unint64_t v62 = v28;
        *((void *)&v60 + 1) = v26;
        unint64_t v29 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          unint64_t v29 = sub_1890EA430(0LL, v29[2] + 1LL, 1, v29);
          unint64_t v64 = v29;
        }

        unint64_t v31 = v29[2];
        unint64_t v30 = v29[3];
        if (v31 >= v30 >> 1) {
          unint64_t v64 = sub_1890EA430((void *)(v30 > 1), v31 + 1, 1, v29);
        }
        unint64_t v32 = v61;
        uint64_t v5 = v62;
        uint64_t v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
        MEMORY[0x1895F8858](v33);
        uint64_t v35 = (char *)v53 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        (*(void (**)(char *))(v36 + 16))(v35);
        uint64_t v11 = v31;
        uint64_t v12 = (uint64_t)v35;
        uint64_t v13 = (uint64_t)v32;
        goto LABEL_4;
      }

      sub_1890D51E0((uint64_t)v63, (uint64_t)v56);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C768648);
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_1890D2660(v54, (uint64_t)&v60);
        sub_1890D51E0((uint64_t)&v60, (uint64_t)v56);
        uint64_t v37 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          uint64_t v37 = sub_1890EA430(0LL, v37[2] + 1LL, 1, v37);
          unint64_t v64 = v37;
        }

        unint64_t v39 = v37[2];
        unint64_t v38 = v37[3];
        if (v39 >= v38 >> 1) {
          unint64_t v64 = sub_1890EA430((void *)(v38 > 1), v39 + 1, 1, v37);
        }
        uint64_t v40 = v58;
        uint64_t v41 = v59;
        uint64_t v42 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v56, v58);
        MEMORY[0x1895F8858](v42);
        uint64_t v44 = (char *)v53 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        (*(void (**)(char *))(v45 + 16))(v44);
        sub_1890D1998( v39,  (uint64_t)v44,  (uint64_t *)&v64,  v40,  v41,  (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
      }

      else
      {
        uint64_t v55 = 0LL;
        memset(v54, 0, sizeof(v54));
        sub_1890D531C((uint64_t)v54, &qword_18C7686A0);
        sub_1890D51E0((uint64_t)v63, (uint64_t)&v60);
        uint64_t result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1890D25E0();
          swift_allocError();
          *uint64_t v52 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
        }

        if ((v58 & 1) != 0)
        {
          __break(1u);
          return result;
        }

        uint64_t v47 = v57;
        swift_bridgeObjectRelease();
        uint64_t v48 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v48 = sub_1890EA430(0LL, v48[2] + 1LL, 1, v48);
        }
        unint64_t v50 = v48[2];
        unint64_t v49 = v48[3];
        if (v50 >= v49 >> 1) {
          uint64_t v48 = sub_1890EA430((void *)(v49 > 1), v50 + 1, 1, v48);
        }
        uint64_t v61 = &type metadata for OnDiskCodeSigningFlags;
        unint64_t v62 = sub_1890D4B28();
        uint64_t v51 = swift_allocObject();
        *(void *)&__int128 v60 = v51;
        *(_BYTE *)(v51 + 16) = 2;
        *(_BYTE *)(v51 + 24) = 23;
        *(void *)(v51 + 32) = v47;
        *(_BYTE *)(v51 + 40) = 0;
        *(void *)(v51 + 48) = 0LL;
        void v48[2] = v50 + 1;
        sub_1890D2660(&v60, (uint64_t)&v48[5 * v50 + 4]);
        unint64_t v64 = v48;
      }

uint64_t sub_1890CF334@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_1890D4C18();
  *a1 = result;
  return result;
}

uint64_t sub_1890CF368@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_1890D4C18();
  *a1 = result;
  return result;
}

uint64_t sub_1890CF394()
{
  return sub_1890F18D8();
}

uint64_t sub_1890CF3BC()
{
  return sub_1890F18E4();
}

uint64_t sub_1890CF3E4@<X0>(unint64_t *a1@<X8>)
{
  return sub_1890CFB2C(&qword_18C768648, (void (*)(void *__return_ptr))sub_1890C71A0, a1);
}

uint64_t sub_1890CF408@<X0>(uint64_t a1@<X8>)
{
  return sub_1890CFB64((uint64_t (*)(void))sub_1890D3400, a1);
}

uint64_t sub_1890CF424(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1890CDAB8(a1, a2, a3, &qword_18C7684E0, (void (*)(void))sub_1890D46A8);
}

uint64_t sub_1890CF450@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_1890D4C18();
  *a1 = result;
  return result;
}

uint64_t sub_1890CF484@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_1890D4C18();
  *a1 = result;
  return result;
}

uint64_t sub_1890CF4B0()
{
  return sub_1890F18D8();
}

uint64_t sub_1890CF4D8()
{
  return sub_1890F18E4();
}

uint64_t sub_1890CF500@<X0>(unint64_t *a1@<X8>)
{
  return sub_1890CFB2C(&qword_18C768630, (void (*)(void *__return_ptr))sub_1890C6648, a1);
}

uint64_t sub_1890CF524@<X0>(uint64_t a1@<X8>)
{
  return sub_1890CFB64((uint64_t (*)(void))sub_1890D385C, a1);
}

uint64_t sub_1890CF540(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1890CDAB8(a1, a2, a3, &qword_18C768218, (void (*)(void))sub_1890D07E4);
}

uint64_t sub_1890CF56C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_1890D4C18();
  *a1 = result;
  return result;
}

uint64_t sub_1890CF5A0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_1890D4C18();
  *a1 = result;
  return result;
}

uint64_t sub_1890CF5CC()
{
  return sub_1890F18D8();
}

uint64_t sub_1890CF5F4()
{
  return sub_1890F18E4();
}

uint64_t sub_1890CF61C@<X0>(unint64_t *a1@<X8>)
{
  return sub_1890CFB2C(&qword_18C768640, (void (*)(void *__return_ptr))sub_1890C71F0, a1);
}

uint64_t sub_1890CF640@<X0>(uint64_t a1@<X8>)
{
  return sub_1890CFB64((uint64_t (*)(void))sub_1890D4208, a1);
}

uint64_t sub_1890CF65C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1890CDAB8(a1, a2, a3, &qword_18C768400, (void (*)(void))sub_1890D3CB8);
}

uint64_t sub_1890CF688()
{
  return sub_1890F18B4();
}

uint64_t sub_1890CF71C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1890CF78C()
{
  return sub_1890F18B4();
}

uint64_t sub_1890CF81C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_1890D4C18();
  *a1 = result;
  return result;
}

uint64_t sub_1890CF850@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_1890D4C18();
  *a1 = result;
  return result;
}

uint64_t sub_1890CF87C()
{
  return sub_1890F18D8();
}

uint64_t sub_1890CF8A4()
{
  return sub_1890F18E4();
}

uint64_t sub_1890CF8CC(void *a1, unsigned int a2, uint64_t a3, uint64_t *a4, void (*a5)(void))
{
  uint64_t v16 = a3;
  LODWORD(v17) = a2;
  unsigned int v7 = a2 >> 8;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a5();
  sub_1890F18CC();
  v19[0] = v7;
  char v21 = 0;
  sub_1890D0828();
  uint64_t v12 = v18;
  sub_1890F177C();
  if (v12) {
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  uint64_t v18 = v9;
  v19[0] = v17;
  char v21 = 1;
  sub_1890F177C();
  char v21 = 2;
  sub_1890F174C();
  uint64_t v14 = *(void *)(v16 + 16);
  if (v14)
  {
    uint64_t v17 = v8;
    uint64_t v15 = (void *)(v16 + 32);
    swift_bridgeObjectRetain();
    do
    {
      __swift_project_boxed_opaque_existential_1(v15, v15[3]);
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v19, v20);
      sub_1890F1824();
      v15 += 5;
      --v14;
    }

    while (v14);
    swift_bridgeObjectRelease();
    uint64_t v8 = v17;
  }

  (*(void (**)(char *, uint64_t))(v18 + 8))(v11, v8);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
}

uint64_t sub_1890CFB08@<X0>(unint64_t *a1@<X8>)
{
  return sub_1890CFB2C(&qword_18C768648, (void (*)(void *__return_ptr))sub_1890C7150, a1);
}

uint64_t sub_1890CFB2C@<X0>( uint64_t *a1@<X2>, void (*a2)(void *__return_ptr)@<X3>, unint64_t *a3@<X8>)
{
  return sub_1890C85BC(*v3, *((void *)v3 + 1), a1, a2, a3);
}

uint64_t sub_1890CFB48@<X0>(uint64_t a1@<X8>)
{
  return sub_1890CFB64((uint64_t (*)(void))sub_1890D4C5C, a1);
}

uint64_t sub_1890CFB64@<X0>(uint64_t (*a1)(void)@<X3>, uint64_t a2@<X8>)
{
  uint64_t result = a1();
  if (!v2)
  {
    *(_WORD *)a2 = result;
    *(void *)(a2 + 8) = v5;
  }

  return result;
}

uint64_t sub_1890CFB98(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1890CDAB8(a1, a2, a3, &qword_18C7684D0, (void (*)(void))sub_1890D4664);
}

uint64_t allOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  return sub_1890CFDC0( a1,  (uint64_t)&type metadata for ProcessConstraintConjunction,  (uint64_t (*)(void))sub_1890CFBE0,  21,  20,  a2);
}

{
  return sub_1890CFDC0( a1,  (uint64_t)&type metadata for LaunchConstraintConjunction,  (uint64_t (*)(void))sub_1890CFC40,  21,  20,  a2);
}

{
  return sub_1890CFDC0( a1,  (uint64_t)&type metadata for OnDiskConstraintConjunction,  (uint64_t (*)(void))sub_1890CFCA0,  21,  20,  a2);
}

unint64_t sub_1890CFBE0()
{
  unint64_t result = qword_18C767ED0;
  if (!qword_18C767ED0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2208, &type metadata for ProcessConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_18C767ED0);
  }

  return result;
}

unint64_t sub_1890CFC40()
{
  unint64_t result = qword_18C767ED8;
  if (!qword_18C767ED8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F21EC, &type metadata for LaunchConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_18C767ED8);
  }

  return result;
}

unint64_t sub_1890CFCA0()
{
  unint64_t result = qword_18C767EE0;
  if (!qword_18C767EE0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F21D0, &type metadata for OnDiskConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_18C767EE0);
  }

  return result;
}

uint64_t anyOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  return sub_1890CFDC0( a1,  (uint64_t)&type metadata for ProcessConstraintDisjunction,  (uint64_t (*)(void))sub_1890CFD00,  29,  28,  a2);
}

{
  return sub_1890CFDC0( a1,  (uint64_t)&type metadata for LaunchConstraintDisjunction,  (uint64_t (*)(void))sub_1890CFD60,  29,  28,  a2);
}

{
  return sub_1890CFDC0( a1,  (uint64_t)&type metadata for OnDiskConstraintDisjunction,  (uint64_t (*)(void))sub_1890CFE20,  29,  28,  a2);
}

unint64_t sub_1890CFD00()
{
  unint64_t result = qword_18C767EE8;
  if (!qword_18C767EE8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F21B4, &type metadata for ProcessConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_18C767EE8);
  }

  return result;
}

unint64_t sub_1890CFD60()
{
  unint64_t result = qword_18C767EF0;
  if (!qword_18C767EF0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2198, &type metadata for LaunchConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_18C767EF0);
  }

  return result;
}

uint64_t sub_1890CFDC0@<X0>( uint64_t (*a1)(void)@<X0>, uint64_t a2@<X2>, uint64_t (*a3)(void)@<X3>, char a4@<W4>, char a5@<W5>, uint64_t a6@<X8>)
{
  uint64_t v11 = a1();
  *(void *)(a6 + 24) = a2;
  uint64_t result = a3();
  *(void *)(a6 + 32) = result;
  *(_BYTE *)a6 = a4;
  *(_BYTE *)(a6 + 1) = a5;
  *(void *)(a6 + 8) = v11;
  return result;
}

unint64_t sub_1890CFE20()
{
  unint64_t result = qword_18C767EF8;
  if (!qword_18C767EF8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F217C, &type metadata for OnDiskConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_18C767EF8);
  }

  return result;
}

void type metadata accessor for CFString()
{
  if (!qword_18C767F00)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_18C767F00);
    }
  }
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for OnDiskConstraintDisjunction()
{
  return &type metadata for OnDiskConstraintDisjunction;
}

ValueMetadata *type metadata accessor for LaunchConstraintDisjunction()
{
  return &type metadata for LaunchConstraintDisjunction;
}

ValueMetadata *type metadata accessor for ProcessConstraintDisjunction()
{
  return &type metadata for ProcessConstraintDisjunction;
}

ValueMetadata *type metadata accessor for OnDiskConstraintConjunction()
{
  return &type metadata for OnDiskConstraintConjunction;
}

uint64_t destroy for LaunchConstraintConjunction()
{
  return swift_bridgeObjectRelease();
}

ValueMetadata *type metadata accessor for LaunchConstraintConjunction()
{
  return &type metadata for LaunchConstraintConjunction;
}

uint64_t _s27LightweightCodeRequirements27OnDiskConstraintDisjunctionVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s27LightweightCodeRequirements27OnDiskConstraintDisjunctionVwca_0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s27LightweightCodeRequirements27OnDiskConstraintDisjunctionVwta_0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s27LightweightCodeRequirements27OnDiskConstraintDisjunctionVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1890D002C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ProcessConstraintConjunction()
{
  return &type metadata for ProcessConstraintConjunction;
}

unint64_t sub_1890D007C()
{
  unint64_t result = qword_18C767F08;
  if (!qword_18C767F08)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F1DA0, &type metadata for ProcessConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_18C767F08);
  }

  return result;
}

unint64_t sub_1890D00C4()
{
  unint64_t result = qword_18C767F10;
  if (!qword_18C767F10)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F1DF4, &type metadata for ProcessConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_18C767F10);
  }

  return result;
}

uint64_t sub_1890D0108(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D011C, (uint64_t (*)(void))sub_1890D0160);
}

unint64_t sub_1890D011C()
{
  unint64_t result = qword_18C767F80;
  if (!qword_18C767F80)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2104, &type metadata for ProcessConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_18C767F80);
  }

  return result;
}

unint64_t sub_1890D0160()
{
  unint64_t result = qword_18C767F88;
  if (!qword_18C767F88)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F212C, &type metadata for ProcessConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_18C767F88);
  }

  return result;
}

unint64_t sub_1890D01A8()
{
  unint64_t result = qword_18C767F90;
  if (!qword_18C767F90)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F1DBC, &type metadata for LaunchConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_18C767F90);
  }

  return result;
}

unint64_t sub_1890D01F0()
{
  unint64_t result = qword_18C767F98;
  if (!qword_18C767F98)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F1E10, &type metadata for LaunchConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_18C767F98);
  }

  return result;
}

uint64_t sub_1890D0234(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D0248, (uint64_t (*)(void))sub_1890D028C);
}

unint64_t sub_1890D0248()
{
  unint64_t result = qword_18C768008;
  if (!qword_18C768008)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2064, &type metadata for LaunchConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_18C768008);
  }

  return result;
}

unint64_t sub_1890D028C()
{
  unint64_t result = qword_18C768010;
  if (!qword_18C768010)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F208C, &type metadata for LaunchConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_18C768010);
  }

  return result;
}

unint64_t sub_1890D02D4()
{
  unint64_t result = qword_18C768018;
  if (!qword_18C768018)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F1DD8, &type metadata for OnDiskConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_18C768018);
  }

  return result;
}

unint64_t sub_1890D031C()
{
  unint64_t result = qword_18C768020;
  if (!qword_18C768020)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F1E2C, &type metadata for OnDiskConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_18C768020);
  }

  return result;
}

uint64_t sub_1890D0360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D0374, (uint64_t (*)(void))sub_1890D03B8);
}

unint64_t sub_1890D0374()
{
  unint64_t result = qword_18C768090;
  if (!qword_18C768090)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F1FC4, &type metadata for OnDiskConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_18C768090);
  }

  return result;
}

unint64_t sub_1890D03B8()
{
  unint64_t result = qword_18C768098;
  if (!qword_18C768098)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F1FEC, &type metadata for OnDiskConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_18C768098);
  }

  return result;
}

uint64_t sub_1890D03FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D0410, (uint64_t (*)(void))sub_1890D0454);
}

unint64_t sub_1890D0410()
{
  unint64_t result = qword_18C768108;
  if (!qword_18C768108)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F20DC, &type metadata for ProcessConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_18C768108);
  }

  return result;
}

unint64_t sub_1890D0454()
{
  unint64_t result = qword_18C768110;
  if (!qword_18C768110)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2154, &type metadata for ProcessConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_18C768110);
  }

  return result;
}

uint64_t sub_1890D0498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D04AC, (uint64_t (*)(void))sub_1890D04F0);
}

unint64_t sub_1890D04AC()
{
  unint64_t result = qword_18C768180;
  if (!qword_18C768180)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F203C, &type metadata for LaunchConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_18C768180);
  }

  return result;
}

unint64_t sub_1890D04F0()
{
  unint64_t result = qword_18C768188;
  if (!qword_18C768188)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F20B4, &type metadata for LaunchConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_18C768188);
  }

  return result;
}

uint64_t sub_1890D0534(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D0548, (uint64_t (*)(void))sub_1890D058C);
}

unint64_t sub_1890D0548()
{
  unint64_t result = qword_18C7681F8;
  if (!qword_18C7681F8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F1F9C, &type metadata for OnDiskConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_18C7681F8);
  }

  return result;
}

unint64_t sub_1890D058C()
{
  unint64_t result = qword_18C768200;
  if (!qword_18C768200)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2014, &type metadata for OnDiskConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_18C768200);
  }

  return result;
}

uint64_t sub_1890D05D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890F1578();
}

uint64_t sub_1890D061C()
{
  return sub_1890D4AA4( &qword_18C768208,  (uint64_t (*)(uint64_t))type metadata accessor for CFString,  (uint64_t)&unk_1890F1E58);
}

uint64_t sub_1890D0648(uint64_t a1)
{
  return sub_1890F1590();
}

uint64_t sub_1890D0684()
{
  return sub_1890F1584();
}

uint64_t sub_1890D06CC(uint64_t a1, uint64_t a2)
{
  return sub_1890F18B4();
}

uint64_t sub_1890D0724()
{
  return sub_1890D4AA4( &qword_18C768210,  (uint64_t (*)(uint64_t))type metadata accessor for CFString,  (uint64_t)&unk_1890F1E84);
}

uint64_t sub_1890D0750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  *(void *)(a1 + 8) = a4();
  uint64_t result = a5();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895DFB48]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

unint64_t sub_1890D07E4()
{
  unint64_t result = qword_18C768220;
  if (!qword_18C768220)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2960, &type metadata for ProcessConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768220);
  }

  return result;
}

unint64_t sub_1890D0828()
{
  unint64_t result = qword_18C768228;
  if (!qword_18C768228)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F7118, &type metadata for ConstraintKeys);
    atomic_store(result, (unint64_t *)&qword_18C768228);
  }

  return result;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }

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

unint64_t sub_1890D08B4()
{
  unint64_t result = qword_18C768238;
  if (!qword_18C768238)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2910, &type metadata for ProcessConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768238);
  }

  return result;
}

char *sub_1890D08F8(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1890D0988(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_1890D0914(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1890D0BA0(a1, a2, a3, *v3, &qword_18C768638, &qword_18C768628);
  *uint64_t v3 = result;
  return result;
}

void *sub_1890D0940(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1890D0A80(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_1890D095C(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1890D0BA0(a1, a2, a3, *v3, &qword_18C7685D8, &qword_18C7685A0);
  *uint64_t v3 = result;
  return result;
}

char *sub_1890D0988(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C768660);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v13, v14, 8 * v8);
  }

  swift_release();
  return v10;
}

void *sub_1890D0A80(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685F8);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }

  else
  {
    uint64_t v10 = (void *)MEMORY[0x18961AFE8];
  }

  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0LL;
  }

  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C768600);
    swift_arrayInitWithCopy();
  }

  swift_release();
  return v10;
}

void *sub_1890D0BA0(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v10 = a2;
  }

  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v13 = (void *)swift_allocObject();
    size_t v14 = _swift_stdlib_malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
  }

  else
  {
    uint64_t v13 = (void *)MEMORY[0x18961AFE8];
  }

  if ((v8 & 1) != 0)
  {
    if (v13 != a4 || v13 + 4 >= &a4[5 * v11 + 4]) {
      memmove(v13 + 4, a4 + 4, 40 * v11);
    }
    a4[2] = 0LL;
  }

  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
  }

  swift_release();
  return v13;
}

uint64_t sub_1890D0CD8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  sub_1890D51E0((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  *a2 = v4;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1890D0D18(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  uint64_t v7 = -1LL << *(_BYTE *)(a1 + 32);
  uint64_t v8 = ~v7;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = -v7;
  uint64_t v51 = a1;
  uint64_t v52 = a1 + 64;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  else {
    uint64_t v11 = -1LL;
  }
  uint64_t v53 = v8;
  uint64_t v54 = 0LL;
  uint64_t v55 = v11 & v9;
  uint64_t v56 = a2;
  uint64_t v57 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1890D1798((uint64_t)&v48);
  uint64_t v12 = v49;
  if (!v49) {
    goto LABEL_23;
  }
  uint64_t v13 = v48;
  uint64_t v46 = v48;
  uint64_t v47 = v49;
  sub_1890D2660(v50, (uint64_t)v45);
  size_t v14 = (void *)*a5;
  unint64_t v16 = sub_1890D146C(v13, v12);
  uint64_t v17 = v14[2];
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  char v20 = v15;
  if (v14[3] >= v19)
  {
    if ((a4 & 1) != 0)
    {
      if ((v15 & 1) == 0) {
        goto LABEL_15;
      }
    }

    else
    {
      sub_1890D14D0();
      if ((v20 & 1) == 0) {
        goto LABEL_15;
      }
    }

LABEL_12:
    sub_1890D25E0();
    uint64_t v23 = swift_allocError();
    *uint64_t v24 = 0;
    swift_willThrow();
    uint64_t v58 = v23;
    MEMORY[0x1895DFB18](v23);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C768608);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_release();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
      swift_bridgeObjectRelease();
      sub_1890D51BC();
      swift_release();
      return MEMORY[0x1895DFB0C](v58);
    }

    goto LABEL_28;
  }

  sub_1890D1148(v19, a4 & 1);
  unint64_t v21 = sub_1890D146C(v13, v12);
  if ((v20 & 1) != (v22 & 1))
  {
LABEL_27:
    sub_1890F1854();
    __break(1u);
LABEL_28:
    sub_1890F168C();
    sub_1890F15E4();
    sub_1890F16A4();
    sub_1890F15E4();
    uint64_t result = sub_1890F16B0();
    __break(1u);
    return result;
  }

  unint64_t v16 = v21;
  if ((v20 & 1) != 0) {
    goto LABEL_12;
  }
LABEL_15:
  uint64_t v26 = (void *)*a5;
  *(void *)(*a5 + 8 * (v16 >> 6) + 64) |= 1LL << v16;
  unsigned int v27 = (uint64_t *)(v26[6] + 16 * v16);
  *unsigned int v27 = v13;
  v27[1] = v12;
  sub_1890D2660(v45, v26[7] + 40 * v16);
  uint64_t v28 = v26[2];
  BOOL v29 = __OFADD__(v28, 1LL);
  uint64_t v30 = v28 + 1;
  if (v29)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }

  v26[2] = v30;
  sub_1890D1798((uint64_t)&v48);
  for (uint64_t i = v49; v49; uint64_t i = v49)
  {
    uint64_t v32 = v48;
    uint64_t v46 = v48;
    uint64_t v47 = i;
    sub_1890D2660(v50, (uint64_t)v45);
    uint64_t v33 = (void *)*a5;
    unint64_t v34 = sub_1890D146C(v32, i);
    uint64_t v36 = v33[2];
    BOOL v37 = (v35 & 1) == 0;
    BOOL v29 = __OFADD__(v36, v37);
    uint64_t v38 = v36 + v37;
    if (v29) {
      goto LABEL_25;
    }
    char v39 = v35;
    if (v33[3] < v38)
    {
      sub_1890D1148(v38, 1);
      unint64_t v34 = sub_1890D146C(v32, i);
      if ((v39 & 1) != (v40 & 1)) {
        goto LABEL_27;
      }
    }

    if ((v39 & 1) != 0) {
      goto LABEL_12;
    }
    uint64_t v41 = (void *)*a5;
    *(void *)(*a5 + 8 * (v34 >> 6) + 64) |= 1LL << v34;
    uint64_t v42 = (uint64_t *)(v41[6] + 16 * v34);
    *uint64_t v42 = v32;
    v42[1] = i;
    sub_1890D2660(v45, v41[7] + 40 * v34);
    uint64_t v43 = v41[2];
    BOOL v29 = __OFADD__(v43, 1LL);
    uint64_t v44 = v43 + 1;
    if (v29) {
      goto LABEL_26;
    }
    v41[2] = v44;
    sub_1890D1798((uint64_t)&v48);
  }

LABEL_23:
  swift_release();
  swift_bridgeObjectRelease();
  sub_1890D51BC();
  return swift_release();
}

uint64_t sub_1890D1148(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685C0);
  char v37 = a2;
  uint64_t v6 = sub_1890F16D4();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1LL << v8);
  }
  else {
    uint64_t v9 = -1LL;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  unint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0LL;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }

    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1LL))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }

    if (v18 >= v35) {
      break;
    }
    uint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v35) {
        goto LABEL_34;
      }
      unint64_t v20 = *(void *)(v36 + 8 * v13);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }

        unint64_t v20 = *(void *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1LL)) {
              goto LABEL_43;
            }
            if (v13 >= v35) {
              goto LABEL_34;
            }
            unint64_t v20 = *(void *)(v36 + 8 * v13);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }

        int64_t v13 = v21;
      }
    }

LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    char v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    char v25 = (__int128 *)(*(void *)(v5 + 56) + 40 * v17);
    if ((v37 & 1) != 0)
    {
      sub_1890D2660(v25, (uint64_t)v38);
    }

    else
    {
      sub_1890D51E0((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }

    sub_1890F1890();
    sub_1890F15D8();
    uint64_t result = sub_1890F18B4();
    uint64_t v26 = -1LL << *(_BYTE *)(v7 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1LL << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1LL << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }

        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0LL;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v11 + 8 * v28);
      }

      while (v32 == -1);
      unint64_t v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }

    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
    char v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    *char v15 = v24;
    v15[1] = v23;
    uint64_t result = sub_1890D2660(v38, *(void *)(v7 + 56) + 40 * v14);
    ++*(void *)(v7 + 16);
  }

  swift_release();
  uint64_t v3 = v34;
  uint64_t v19 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v33 = 1LL << *(_BYTE *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v19 = -1LL << v33;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_1890D146C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1890F18B4();
  return sub_1890D16B8(a1, a2, v4);
}

void *sub_1890D14D0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685C0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1890F16C8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }

  char v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }

LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 40 * v15;
    sub_1890D51E0(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = v19;
    v21[1] = v18;
    sub_1890D2660(v26, *(void *)(v4 + 56) + v20);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }

  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }

  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }

LABEL_30:
  __break(1u);
  return result;
}

unint64_t sub_1890D16B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1890F183C() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (sub_1890F183C() & 1) == 0);
    }
  }

  return v6;
}

uint64_t sub_1890D1798@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  int64_t v5 = v1[3];
  int64_t v7 = v5;
  unint64_t v8 = v1[4];
  if (v8)
  {
    uint64_t v9 = (v8 - 1) & v8;
    unint64_t v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    BOOL v11 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_1890D51E0(*(void *)(v3 + 56) + 40 * v10, (uint64_t)v26);
    *(void *)&__int128 v25 = v13;
    *((void *)&v25 + 1) = v12;
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }

  int64_t v14 = v5 + 1;
  if (__OFADD__(v5, 1LL))
  {
    __break(1u);
    return result;
  }

  int64_t v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    unint64_t v16 = *(void *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      uint64_t v9 = (v16 - 1) & v16;
      unint64_t v10 = __clz(__rbit64(v16)) + (v14 << 6);
      int64_t v7 = v14;
      goto LABEL_3;
    }

    int64_t v17 = v5 + 2;
    int64_t v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      unint64_t v16 = *(void *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        int64_t v14 = v17;
        goto LABEL_7;
      }

      int64_t v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        unint64_t v16 = *(void *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          int64_t v14 = v5 + 3;
          goto LABEL_7;
        }

        int64_t v17 = v5 + 4;
        int64_t v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          unint64_t v16 = *(void *)(v4 + 8 * v17);
          if (v16) {
            goto LABEL_10;
          }
          int64_t v14 = v5 + 5;
          int64_t v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            unint64_t v16 = *(void *)(v4 + 8 * v14);
            if (v16) {
              goto LABEL_7;
            }
            int64_t v7 = v15 - 1;
            int64_t v18 = v5 + 6;
            while (v15 != v18)
            {
              unint64_t v16 = *(void *)(v4 + 8 * v18++);
              if (v16)
              {
                int64_t v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }

  uint64_t v9 = 0LL;
  uint64_t v27 = 0LL;
  memset(v26, 0, sizeof(v26));
  __int128 v25 = 0u;
LABEL_23:
  *uint64_t v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  uint64_t v19 = (void (*)(_OWORD *))v1[5];
  uint64_t result = sub_1890D5100((uint64_t)&v25, (uint64_t)v23);
  if (*((void *)&v23[0] + 1))
  {
    v21[0] = v23[0];
    v21[1] = v23[1];
    v21[2] = v23[2];
    uint64_t v22 = v24;
    v19(v21);
    return sub_1890D531C((uint64_t)v21, &qword_18C768610);
  }

  else
  {
    *(void *)(a1 + 48) = 0LL;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
  }

  return result;
}

uint64_t sub_1890D198C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  return sub_1890D1998(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
}

uint64_t sub_1890D1998( uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t *, uint64_t))
{
  v14[3] = a4;
  v14[4] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32LL))(boxed_opaque_existential_1, a2, a4);
  uint64_t v12 = *a3;
  *(void *)(v12 + 16) = a1 + 1;
  return a6(v14, v12 + 40 * a1 + 32);
}

uint64_t sub_1890D1A1C(uint64_t a1, uint64_t a2)
{
  return sub_1890D1A54(a1, a2, (void (*)(void *__return_ptr))sub_1890C6698);
}

uint64_t sub_1890D1A38(uint64_t a1, uint64_t a2)
{
  return sub_1890D1A54(a1, a2, (void (*)(void *__return_ptr))sub_1890C6648);
}

uint64_t sub_1890D1A54(uint64_t a1, uint64_t a2, void (*a3)(void *__return_ptr))
{
  if (v3)
  {
    swift_bridgeObjectRelease();
    return a2;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
  swift_dynamicCast();
  uint64_t v7 = *(void *)(v27 + 16);
  swift_bridgeObjectRelease();
  if (v7 != 1)
  {
    __break(1u);
    goto LABEL_29;
  }

  char v8 = *(_BYTE *)(v27 + 32);
  uint64_t v9 = 1LL << v8;
  uint64_t v10 = -1LL;
  if (1LL << v8 < 64) {
    uint64_t v10 = ~(-1LL << (1LL << v8));
  }
  unint64_t v11 = v10 & *(void *)(v27 + 64);
  if (v11)
  {
    unint64_t v12 = __clz(__rbit64(v11));
LABEL_8:
    uint64_t v13 = *(void *)(v27 + 56);
    int64_t v14 = (void *)(*(void *)(v27 + 48) + 16 * v12);
    uint64_t v15 = v14[1];
    *(void *)&__int128 v27 = *v14;
    *((void *)&v27 + 1) = v15;
    sub_1890D51E0(v13 + 40 * v12, (uint64_t)v28);
    swift_bridgeObjectRetain();
    goto LABEL_25;
  }

  unsigned int v16 = v8 & 0x3F;
  if (v16 > 6)
  {
    unint64_t v17 = *(void *)(v27 + 72);
    if (v17)
    {
      uint64_t v18 = 64LL;
LABEL_12:
      unint64_t v12 = __clz(__rbit64(v17)) + v18;
      goto LABEL_8;
    }

    if (v16 >= 8)
    {
      unint64_t v17 = *(void *)(v27 + 80);
      if (v17)
      {
        uint64_t v18 = 128LL;
        goto LABEL_12;
      }

      unint64_t v17 = *(void *)(v27 + 88);
      if (v17)
      {
        uint64_t v18 = 192LL;
        goto LABEL_12;
      }

      int64_t v19 = (unint64_t)(v9 + 63) >> 6;
      if (v19 <= 4) {
        int64_t v19 = 4LL;
      }
      int64_t v20 = v19 - 4;
      int64_t v21 = (unint64_t *)(v27 + 96);
      uint64_t v18 = 192LL;
      while (v20)
      {
        unint64_t v22 = *v21++;
        unint64_t v17 = v22;
        --v20;
        v18 += 64LL;
        if (v22) {
          goto LABEL_12;
        }
      }
    }
  }

  uint64_t v29 = 0LL;
  memset(v28, 0, sizeof(v28));
  __int128 v27 = 0u;
LABEL_25:
  sub_1890D5100((uint64_t)&v27, (uint64_t)&v30);
  uint64_t v23 = v31;
  if (v31)
  {
    unint64_t v24 = v30;
    sub_1890D2660(&v32, (uint64_t)&v27);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685D8);
    a2 = swift_allocObject();
    uint64_t v25 = MEMORY[0x189617FA8];
    *(_OWORD *)(a2 + 16) = xmmword_1890F1C30;
    *(void *)(a2 + 56) = v25;
    *(void *)(a2 + 64) = &off_18A349C48;
    *(void *)(a2 + 32) = v24;
    *(void *)(a2 + 40) = v23;
    sub_1890D2660(&v27, a2 + 72);
    swift_bridgeObjectRelease();
    return a2;
  }

LABEL_29:
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_1890D1CA0(uint64_t a1, uint64_t a2)
{
  return sub_1890D1D30(a1, a2, &qword_18C768648, (void (*)(void *__return_ptr))sub_1890C71A0);
}

uint64_t sub_1890D1CC4(uint64_t a1, uint64_t a2)
{
  return sub_1890D1D30(a1, a2, &qword_18C768648, (void (*)(void *__return_ptr))sub_1890C7150);
}

uint64_t sub_1890D1CE8(uint64_t a1, uint64_t a2)
{
  return sub_1890D1D30(a1, a2, &qword_18C768640, (void (*)(void *__return_ptr))sub_1890C7240);
}

uint64_t sub_1890D1D0C(uint64_t a1, uint64_t a2)
{
  return sub_1890D1D30(a1, a2, &qword_18C768640, (void (*)(void *__return_ptr))sub_1890C71F0);
}

uint64_t sub_1890D1D30(uint64_t a1, uint64_t a2, uint64_t *a3, void (*a4)(void *__return_ptr))
{
  if (v4)
  {
    swift_bridgeObjectRelease();
    return a2;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
  swift_dynamicCast();
  uint64_t v9 = *(void *)(v29 + 16);
  swift_bridgeObjectRelease();
  if (v9 != 1)
  {
    __break(1u);
    goto LABEL_32;
  }

  char v10 = *(_BYTE *)(v29 + 32);
  uint64_t v11 = 1LL << v10;
  uint64_t v12 = -1LL;
  if (1LL << v10 < 64) {
    uint64_t v12 = ~(-1LL << (1LL << v10));
  }
  unint64_t v13 = v12 & *(void *)(v29 + 64);
  if (v13)
  {
    unint64_t v14 = __clz(__rbit64(v13));
LABEL_8:
    uint64_t v15 = *(void *)(v29 + 56);
    unsigned int v16 = (void *)(*(void *)(v29 + 48) + 16 * v14);
    uint64_t v17 = v16[1];
    *(void *)&__int128 v29 = *v16;
    *((void *)&v29 + 1) = v17;
    sub_1890D51E0(v15 + 40 * v14, (uint64_t)v30);
    swift_bridgeObjectRetain();
    goto LABEL_28;
  }

  unsigned int v18 = v10 & 0x3F;
  if (v18 > 6)
  {
    unint64_t v19 = *(void *)(v29 + 72);
    if (v19)
    {
      uint64_t v20 = 64LL;
LABEL_12:
      unint64_t v14 = __clz(__rbit64(v19)) + v20;
      goto LABEL_8;
    }

    if (v18 >= 8)
    {
      unint64_t v19 = *(void *)(v29 + 80);
      if (v19)
      {
        uint64_t v20 = 128LL;
        goto LABEL_12;
      }

      unint64_t v19 = *(void *)(v29 + 88);
      if (v19)
      {
        uint64_t v20 = 192LL;
        goto LABEL_12;
      }

      if (v18 >= 9)
      {
        unint64_t v19 = *(void *)(v29 + 96);
        if (v19)
        {
          uint64_t v20 = 256LL;
          goto LABEL_12;
        }

        int64_t v21 = (unint64_t)(v11 + 63) >> 6;
        if (v21 <= 5) {
          int64_t v21 = 5LL;
        }
        int64_t v22 = v21 - 5;
        uint64_t v23 = (unint64_t *)(v29 + 104);
        uint64_t v20 = 256LL;
        while (v22)
        {
          unint64_t v24 = *v23++;
          unint64_t v19 = v24;
          --v22;
          v20 += 64LL;
          if (v24) {
            goto LABEL_12;
          }
        }
      }
    }
  }

  uint64_t v31 = 0LL;
  memset(v30, 0, sizeof(v30));
  __int128 v29 = 0u;
LABEL_28:
  sub_1890D5100((uint64_t)&v29, (uint64_t)&v32);
  uint64_t v25 = v33;
  if (v33)
  {
    unint64_t v26 = v32;
    sub_1890D2660(&v34, (uint64_t)&v29);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685D8);
    a2 = swift_allocObject();
    uint64_t v27 = MEMORY[0x189617FA8];
    *(_OWORD *)(a2 + 16) = xmmword_1890F1C30;
    *(void *)(a2 + 56) = v27;
    *(void *)(a2 + 64) = &off_18A349C48;
    *(void *)(a2 + 32) = v26;
    *(void *)(a2 + 40) = v25;
    sub_1890D2660(&v29, a2 + 72);
    swift_bridgeObjectRelease();
    return a2;
  }

LABEL_32:
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_1890D1F94(uint64_t a1, unsigned __int8 a2)
{
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1890F1C20;
  *(void *)(inited + 32) = sub_1890EFBB4(*(_BYTE *)(a1 + 16));
  *(void *)(inited + 40) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685E8);
  uint64_t v6 = swift_initStackObject();
  *(_OWORD *)(v6 + 16) = xmmword_1890F1C20;
  *(void *)(v6 + 32) = sub_1890EFBB4(*(_BYTE *)(a1 + 17));
  *(void *)(v6 + 40) = v7;
  *(void *)(v6 + 48) = *(void *)(a1 + 24);
  swift_retain();
  swift_bridgeObjectRetain();
  *(void *)(inited + 48) = sub_1890C8368(v6, &qword_18C768620);
  sub_1890C8368(inited, &qword_18C768618);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
  swift_dynamicCast();
  uint64_t v9 = *(void *)(v14 + 16);
  uint64_t result = swift_release();
  if (v9 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685D8);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_1890F1C30;
    uint64_t v12 = sub_1890EFBB4(a2);
    *(void *)(v11 + 56) = MEMORY[0x189617FA8];
    *(void *)(v11 + 64) = &off_18A349C48;
    *(void *)(v11 + 32) = v12;
    *(void *)(v11 + 40) = v13;
    *(void *)(v11 + 96) = v8;
    *(void *)(v11 + 104) = &off_18A349CF0;
    *(void *)(v11 + 72) = v14;
    return v11;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_1890D2140(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768240);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890D08B4();
  sub_1890F18C0();
  if (v1) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v29[0]) = 0;
  sub_1890D259C();
  sub_1890F1728();
  int v24 = LOBYTE(v30[0]);
  if (sub_1890EFBB4(v30[0]) == 1684955428 && v7 == 0xE400000000000000LL)
  {
    swift_bridgeObjectRelease();
  }

  else
  {
    char v8 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
LABEL_17:
      sub_1890D25E0();
      swift_allocError();
      *uint64_t v20 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
  }

  LOBYTE(v29[0]) = 1;
  sub_1890F1728();
  int v23 = LOBYTE(v30[0]);
  if (sub_1890EFBB4(v30[0]) != 0x7272612D646E6124LL || v9 != 0xEA00000000007961LL)
  {
    char v10 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }

  swift_bridgeObjectRelease();
LABEL_10:
  unint64_t v32 = (void *)MEMORY[0x18961AFE8];
  LOBYTE(v29[0]) = 2;
  sub_1890F16F8();
  __swift_project_boxed_opaque_existential_1(v30, v31);
  while ((sub_1890F17F4() & 1) == 0)
  {
    sub_1890C87C8((uint64_t)v30, v29);
    sub_1890D51E0((uint64_t)v29, (uint64_t)v26);
    uint64_t v11 = v32;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v11 = sub_1890EA314(0LL, v11[2] + 1LL, 1, v11);
      unint64_t v32 = v11;
    }

    unint64_t v13 = v11[2];
    unint64_t v12 = v11[3];
    if (v13 >= v12 >> 1) {
      unint64_t v32 = sub_1890EA314((void *)(v12 > 1), v13 + 1, 1, v11);
    }
    uint64_t v15 = v27;
    uint64_t v14 = v28;
    uint64_t v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    uint64_t v25 = &v22;
    MEMORY[0x1895F8858](v16);
    unsigned int v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v19 + 16))(v18);
    sub_1890D1998( v13,  (uint64_t)v18,  (uint64_t *)&v32,  v15,  v14,  (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    __swift_project_boxed_opaque_existential_1(v30, v31);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v23 | (v24 << 8);
}

unint64_t sub_1890D259C()
{
  unint64_t result = qword_18C768248;
  if (!qword_18C768248)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F7140, &type metadata for ConstraintKeys);
    atomic_store(result, (unint64_t *)&qword_18C768248);
  }

  return result;
}

unint64_t sub_1890D25E0()
{
  unint64_t result = qword_18C768250;
  if (!qword_18C768250)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ConstraintError,  &type metadata for ConstraintError);
    atomic_store(result, (unint64_t *)&qword_18C768250);
  }

  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }

  return v1;
}

uint64_t sub_1890D2660(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_1890D2678()
{
  unint64_t result = qword_18C768258;
  if (!qword_18C768258)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for AppleInternal, &type metadata for AppleInternal);
    atomic_store(result, (unint64_t *)&qword_18C768258);
  }

  return result;
}

unint64_t sub_1890D26BC()
{
  unint64_t result = qword_18C768268;
  if (!qword_18C768268)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for CodeDirectoryHash,  &type metadata for CodeDirectoryHash);
    atomic_store(result, (unint64_t *)&qword_18C768268);
  }

  return result;
}

unint64_t sub_1890D2700()
{
  unint64_t result = qword_18C768278;
  if (!qword_18C768278)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ProcessCodeSigningFlags,  &type metadata for ProcessCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_18C768278);
  }

  return result;
}

unint64_t sub_1890D2744()
{
  unint64_t result = qword_18C768280;
  if (!qword_18C768280)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for DeveloperMode, &type metadata for DeveloperMode);
    atomic_store(result, (unint64_t *)&qword_18C768280);
  }

  return result;
}

unint64_t sub_1890D2788()
{
  unint64_t result = qword_18C768298;
  if (!qword_18C768298)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for InfoPlistHash, &type metadata for InfoPlistHash);
    atomic_store(result, (unint64_t *)&qword_18C768298);
  }

  return result;
}

unint64_t sub_1890D27CC()
{
  unint64_t result = qword_18C7682A8;
  if (!qword_18C7682A8)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for InTrustCacheWithConstraintCategory,  &type metadata for InTrustCacheWithConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_18C7682A8);
  }

  return result;
}

unint64_t sub_1890D2810()
{
  unint64_t result = qword_18C7682B8;
  if (!qword_18C7682B8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for IsInitProcess, &type metadata for IsInitProcess);
    atomic_store(result, (unint64_t *)&qword_18C7682B8);
  }

  return result;
}

unint64_t sub_1890D2854()
{
  unint64_t result = qword_18C7682C8;
  if (!qword_18C7682C8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for IsSIPProtected, &type metadata for IsSIPProtected);
    atomic_store(result, (unint64_t *)&qword_18C7682C8);
  }

  return result;
}

unint64_t sub_1890D2898()
{
  unint64_t result = qword_18C7682D8;
  if (!qword_18C7682D8)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for OnAuthorizedAuthAPFSVolume,  &type metadata for OnAuthorizedAuthAPFSVolume);
    atomic_store(result, (unint64_t *)&qword_18C7682D8);
  }

  return result;
}

unint64_t sub_1890D28DC()
{
  unint64_t result = qword_18C7682E8;
  if (!qword_18C7682E8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for OnSystemVolume, &type metadata for OnSystemVolume);
    atomic_store(result, (unint64_t *)&qword_18C7682E8);
  }

  return result;
}

unint64_t sub_1890D2920()
{
  unint64_t result = qword_18C7682F8;
  if (!qword_18C7682F8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for OSEnvironment, &type metadata for OSEnvironment);
    atomic_store(result, (unint64_t *)&qword_18C7682F8);
  }

  return result;
}

unint64_t sub_1890D2964()
{
  unint64_t result = qword_18C768308;
  if (!qword_18C768308)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for PlatformType, &type metadata for PlatformType);
    atomic_store(result, (unint64_t *)&qword_18C768308);
  }

  return result;
}

unint64_t sub_1890D29A8()
{
  unint64_t result = qword_18C768318;
  if (!qword_18C768318)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for PlatformIdentifier,  &type metadata for PlatformIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C768318);
  }

  return result;
}

unint64_t sub_1890D29EC()
{
  unint64_t result = qword_18C768328;
  if (!qword_18C768328)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for SigningIdentifier,  &type metadata for SigningIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C768328);
  }

  return result;
}

unint64_t sub_1890D2A30()
{
  unint64_t result = qword_18C768338;
  if (!qword_18C768338)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for TeamIdentifier, &type metadata for TeamIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C768338);
  }

  return result;
}

unint64_t sub_1890D2A74()
{
  unint64_t result = qword_18C768348;
  if (!qword_18C768348)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for TeamIdentifierMatchesCurrentProcess,  &type metadata for TeamIdentifierMatchesCurrentProcess);
    atomic_store(result, (unint64_t *)&qword_18C768348);
  }

  return result;
}

unint64_t sub_1890D2AB8()
{
  unint64_t result = qword_18C768358;
  if (!qword_18C768358)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ValidationCategory,  &type metadata for ValidationCategory);
    atomic_store(result, (unint64_t *)&qword_18C768358);
  }

  return result;
}

unint64_t sub_1890D2AFC()
{
  unint64_t result = qword_18C768368;
  if (!qword_18C768368)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ValidationCategory,  &type metadata for ValidationCategory);
    atomic_store(result, (unint64_t *)&qword_18C768368);
  }

  return result;
}

uint64_t sub_1890D2B40()
{
  return swift_deallocObject();
}

unint64_t sub_1890D2B64()
{
  unint64_t result = qword_18C768370;
  if (!qword_18C768370)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for TeamIdentifierMatchesCurrentProcess,  &type metadata for TeamIdentifierMatchesCurrentProcess);
    atomic_store(result, (unint64_t *)&qword_18C768370);
  }

  return result;
}

unint64_t sub_1890D2BA8()
{
  unint64_t result = qword_18C768378;
  if (!qword_18C768378)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for TeamIdentifier, &type metadata for TeamIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C768378);
  }

  return result;
}

unint64_t sub_1890D2BEC()
{
  unint64_t result = qword_18C768380;
  if (!qword_18C768380)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for SigningIdentifier,  &type metadata for SigningIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C768380);
  }

  return result;
}

unint64_t sub_1890D2C30()
{
  unint64_t result = qword_18C768388;
  if (!qword_18C768388)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for PlatformIdentifier,  &type metadata for PlatformIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C768388);
  }

  return result;
}

unint64_t sub_1890D2C74()
{
  unint64_t result = qword_18C768390;
  if (!qword_18C768390)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for PlatformType, &type metadata for PlatformType);
    atomic_store(result, (unint64_t *)&qword_18C768390);
  }

  return result;
}

unint64_t sub_1890D2CB8()
{
  unint64_t result = qword_18C768398;
  if (!qword_18C768398)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for OSEnvironment, &type metadata for OSEnvironment);
    atomic_store(result, (unint64_t *)&qword_18C768398);
  }

  return result;
}

unint64_t sub_1890D2CFC()
{
  unint64_t result = qword_18C7683A0;
  if (!qword_18C7683A0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for OnSystemVolume, &type metadata for OnSystemVolume);
    atomic_store(result, (unint64_t *)&qword_18C7683A0);
  }

  return result;
}

unint64_t sub_1890D2D40()
{
  unint64_t result = qword_18C7683A8;
  if (!qword_18C7683A8)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for OnAuthorizedAuthAPFSVolume,  &type metadata for OnAuthorizedAuthAPFSVolume);
    atomic_store(result, (unint64_t *)&qword_18C7683A8);
  }

  return result;
}

unint64_t sub_1890D2D84()
{
  unint64_t result = qword_18C7683B0;
  if (!qword_18C7683B0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for IsSIPProtected, &type metadata for IsSIPProtected);
    atomic_store(result, (unint64_t *)&qword_18C7683B0);
  }

  return result;
}

unint64_t sub_1890D2DC8()
{
  unint64_t result = qword_18C7683B8;
  if (!qword_18C7683B8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for IsInitProcess, &type metadata for IsInitProcess);
    atomic_store(result, (unint64_t *)&qword_18C7683B8);
  }

  return result;
}

unint64_t sub_1890D2E0C()
{
  unint64_t result = qword_18C7683C0;
  if (!qword_18C7683C0)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for InTrustCacheWithConstraintCategory,  &type metadata for InTrustCacheWithConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_18C7683C0);
  }

  return result;
}

unint64_t sub_1890D2E50()
{
  unint64_t result = qword_18C7683C8;
  if (!qword_18C7683C8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for InfoPlistHash, &type metadata for InfoPlistHash);
    atomic_store(result, (unint64_t *)&qword_18C7683C8);
  }

  return result;
}

unint64_t sub_1890D2E94()
{
  unint64_t result = qword_18C7683D8;
  if (!qword_18C7683D8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for DeveloperMode, &type metadata for DeveloperMode);
    atomic_store(result, (unint64_t *)&qword_18C7683D8);
  }

  return result;
}

unint64_t sub_1890D2ED8()
{
  unint64_t result = qword_18C7683E0;
  if (!qword_18C7683E0)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ProcessCodeSigningFlags,  &type metadata for ProcessCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_18C7683E0);
  }

  return result;
}

unint64_t sub_1890D2F1C()
{
  unint64_t result = qword_18C7683E8;
  if (!qword_18C7683E8)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for CodeDirectoryHash,  &type metadata for CodeDirectoryHash);
    atomic_store(result, (unint64_t *)&qword_18C7683E8);
  }

  return result;
}

unint64_t sub_1890D2F60()
{
  unint64_t result = qword_18C7683F0;
  if (!qword_18C7683F0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for AppleInternal, &type metadata for AppleInternal);
    atomic_store(result, (unint64_t *)&qword_18C7683F0);
  }

  return result;
}

uint64_t sub_1890D2FA4(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768420);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890D3CFC();
  sub_1890F18C0();
  if (v1) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v29[0]) = 0;
  sub_1890D259C();
  sub_1890F1728();
  int v24 = LOBYTE(v30[0]);
  if (sub_1890EFBB4(v30[0]) == 1684955428 && v7 == 0xE400000000000000LL)
  {
    swift_bridgeObjectRelease();
  }

  else
  {
    char v8 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
LABEL_17:
      sub_1890D25E0();
      swift_allocError();
      *uint64_t v20 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
  }

  LOBYTE(v29[0]) = 1;
  sub_1890F1728();
  int v23 = LOBYTE(v30[0]);
  if (sub_1890EFBB4(v30[0]) != 0x7272612D646E6124LL || v9 != 0xEA00000000007961LL)
  {
    char v10 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }

  swift_bridgeObjectRelease();
LABEL_10:
  unint64_t v32 = (void *)MEMORY[0x18961AFE8];
  LOBYTE(v29[0]) = 2;
  sub_1890F16F8();
  __swift_project_boxed_opaque_existential_1(v30, v31);
  while ((sub_1890F17F4() & 1) == 0)
  {
    sub_1890C93C0((uint64_t)v30, v29);
    sub_1890D51E0((uint64_t)v29, (uint64_t)v26);
    uint64_t v11 = v32;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v11 = sub_1890EA41C(0LL, v11[2] + 1LL, 1, v11);
      unint64_t v32 = v11;
    }

    unint64_t v13 = v11[2];
    unint64_t v12 = v11[3];
    if (v13 >= v12 >> 1) {
      unint64_t v32 = sub_1890EA41C((void *)(v12 > 1), v13 + 1, 1, v11);
    }
    uint64_t v15 = v27;
    uint64_t v14 = v28;
    uint64_t v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    uint64_t v25 = &v22;
    MEMORY[0x1895F8858](v16);
    unsigned int v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v19 + 16))(v18);
    sub_1890D1998( v13,  (uint64_t)v18,  (uint64_t *)&v32,  v15,  v14,  (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    __swift_project_boxed_opaque_existential_1(v30, v31);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v23 | (v24 << 8);
}

uint64_t sub_1890D3400(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7684F0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890D46A8();
  sub_1890F18C0();
  if (v1) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v29[0]) = 0;
  sub_1890D259C();
  sub_1890F1728();
  int v24 = LOBYTE(v30[0]);
  if (sub_1890EFBB4(v30[0]) == 1684955428 && v7 == 0xE400000000000000LL)
  {
    swift_bridgeObjectRelease();
  }

  else
  {
    char v8 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
LABEL_17:
      sub_1890D25E0();
      swift_allocError();
      *uint64_t v20 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
  }

  LOBYTE(v29[0]) = 1;
  sub_1890F1728();
  int v23 = LOBYTE(v30[0]);
  if (sub_1890EFBB4(v30[0]) != 0x7272612D646E6124LL || v9 != 0xEA00000000007961LL)
  {
    char v10 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }

  swift_bridgeObjectRelease();
LABEL_10:
  unint64_t v32 = (void *)MEMORY[0x18961AFE8];
  LOBYTE(v29[0]) = 2;
  sub_1890F16F8();
  __swift_project_boxed_opaque_existential_1(v30, v31);
  while ((sub_1890F17F4() & 1) == 0)
  {
    sub_1890C9FB8((uint64_t)v30, v29);
    sub_1890D51E0((uint64_t)v29, (uint64_t)v26);
    uint64_t v11 = v32;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v11 = sub_1890EA430(0LL, v11[2] + 1LL, 1, v11);
      unint64_t v32 = v11;
    }

    unint64_t v13 = v11[2];
    unint64_t v12 = v11[3];
    if (v13 >= v12 >> 1) {
      unint64_t v32 = sub_1890EA430((void *)(v12 > 1), v13 + 1, 1, v11);
    }
    uint64_t v15 = v27;
    uint64_t v14 = v28;
    uint64_t v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    uint64_t v25 = &v22;
    MEMORY[0x1895F8858](v16);
    unsigned int v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v19 + 16))(v18);
    sub_1890D1998( v13,  (uint64_t)v18,  (uint64_t *)&v32,  v15,  v14,  (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    __swift_project_boxed_opaque_existential_1(v30, v31);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v23 | (v24 << 8);
}

uint64_t sub_1890D385C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7683F8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890D07E4();
  sub_1890F18C0();
  if (v1) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v29[0]) = 0;
  sub_1890D259C();
  sub_1890F1728();
  int v24 = LOBYTE(v30[0]);
  if (sub_1890EFBB4(v30[0]) == 7499556 && v7 == 0xE300000000000000LL)
  {
    swift_bridgeObjectRelease();
  }

  else
  {
    char v8 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
LABEL_17:
      sub_1890D25E0();
      swift_allocError();
      *uint64_t v20 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
  }

  LOBYTE(v29[0]) = 1;
  sub_1890F1728();
  int v23 = LOBYTE(v30[0]);
  if (sub_1890EFBB4(v30[0]) != 0x617272612D726F24LL || v9 != 0xE900000000000079LL)
  {
    char v10 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }

  swift_bridgeObjectRelease();
LABEL_10:
  unint64_t v32 = (void *)MEMORY[0x18961AFE8];
  LOBYTE(v29[0]) = 2;
  sub_1890F16F8();
  __swift_project_boxed_opaque_existential_1(v30, v31);
  while ((sub_1890F17F4() & 1) == 0)
  {
    sub_1890C87C8((uint64_t)v30, v29);
    sub_1890D51E0((uint64_t)v29, (uint64_t)v26);
    uint64_t v11 = v32;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v11 = sub_1890EA314(0LL, v11[2] + 1LL, 1, v11);
      unint64_t v32 = v11;
    }

    unint64_t v13 = v11[2];
    unint64_t v12 = v11[3];
    if (v13 >= v12 >> 1) {
      unint64_t v32 = sub_1890EA314((void *)(v12 > 1), v13 + 1, 1, v11);
    }
    uint64_t v15 = v27;
    uint64_t v14 = v28;
    uint64_t v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    uint64_t v25 = &v22;
    MEMORY[0x1895F8858](v16);
    unsigned int v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v19 + 16))(v18);
    sub_1890D1998( v13,  (uint64_t)v18,  (uint64_t *)&v32,  v15,  v14,  (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    __swift_project_boxed_opaque_existential_1(v30, v31);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v23 | (v24 << 8);
}

unint64_t sub_1890D3CB8()
{
  unint64_t result = qword_18C768408;
  if (!qword_18C768408)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F28C0, &type metadata for LaunchConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768408);
  }

  return result;
}

unint64_t sub_1890D3CFC()
{
  unint64_t result = qword_18C768418;
  if (!qword_18C768418)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2870, &type metadata for LaunchConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768418);
  }

  return result;
}

unint64_t sub_1890D3D40()
{
  unint64_t result = qword_18C768428;
  if (!qword_18C768428)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for LaunchType, &type metadata for LaunchType);
    atomic_store(result, (unint64_t *)&qword_18C768428);
  }

  return result;
}

unint64_t sub_1890D3D84()
{
  unint64_t result = qword_18C768438;
  if (!qword_18C768438)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ValidationCategory,  &type metadata for ValidationCategory);
    atomic_store(result, (unint64_t *)&qword_18C768438);
  }

  return result;
}

unint64_t sub_1890D3DC8()
{
  unint64_t result = qword_18C768440;
  if (!qword_18C768440)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for TeamIdentifier, &type metadata for TeamIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C768440);
  }

  return result;
}

unint64_t sub_1890D3E0C()
{
  unint64_t result = qword_18C768448;
  if (!qword_18C768448)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for SigningIdentifier,  &type metadata for SigningIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C768448);
  }

  return result;
}

unint64_t sub_1890D3E50()
{
  unint64_t result = qword_18C768450;
  if (!qword_18C768450)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for PlatformIdentifier,  &type metadata for PlatformIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C768450);
  }

  return result;
}

unint64_t sub_1890D3E94()
{
  unint64_t result = qword_18C768458;
  if (!qword_18C768458)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for PlatformType, &type metadata for PlatformType);
    atomic_store(result, (unint64_t *)&qword_18C768458);
  }

  return result;
}

unint64_t sub_1890D3ED8()
{
  unint64_t result = qword_18C768460;
  if (!qword_18C768460)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for OSEnvironment, &type metadata for OSEnvironment);
    atomic_store(result, (unint64_t *)&qword_18C768460);
  }

  return result;
}

unint64_t sub_1890D3F1C()
{
  unint64_t result = qword_18C768468;
  if (!qword_18C768468)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for OnSystemVolume, &type metadata for OnSystemVolume);
    atomic_store(result, (unint64_t *)&qword_18C768468);
  }

  return result;
}

unint64_t sub_1890D3F60()
{
  unint64_t result = qword_18C768470;
  if (!qword_18C768470)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for OnAuthorizedAuthAPFSVolume,  &type metadata for OnAuthorizedAuthAPFSVolume);
    atomic_store(result, (unint64_t *)&qword_18C768470);
  }

  return result;
}

unint64_t sub_1890D3FA4()
{
  unint64_t result = qword_18C768478;
  if (!qword_18C768478)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for LaunchType, &type metadata for LaunchType);
    atomic_store(result, (unint64_t *)&qword_18C768478);
  }

  return result;
}

unint64_t sub_1890D3FE8()
{
  unint64_t result = qword_18C768480;
  if (!qword_18C768480)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for IsSIPProtected, &type metadata for IsSIPProtected);
    atomic_store(result, (unint64_t *)&qword_18C768480);
  }

  return result;
}

unint64_t sub_1890D402C()
{
  unint64_t result = qword_18C768488;
  if (!qword_18C768488)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for IsInitProcess, &type metadata for IsInitProcess);
    atomic_store(result, (unint64_t *)&qword_18C768488);
  }

  return result;
}

unint64_t sub_1890D4070()
{
  unint64_t result = qword_18C768490;
  if (!qword_18C768490)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for InTrustCacheWithConstraintCategory,  &type metadata for InTrustCacheWithConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_18C768490);
  }

  return result;
}

unint64_t sub_1890D40B4()
{
  unint64_t result = qword_18C768498;
  if (!qword_18C768498)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for InfoPlistHash, &type metadata for InfoPlistHash);
    atomic_store(result, (unint64_t *)&qword_18C768498);
  }

  return result;
}

unint64_t sub_1890D40F8()
{
  unint64_t result = qword_18C7684A8;
  if (!qword_18C7684A8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for DeveloperMode, &type metadata for DeveloperMode);
    atomic_store(result, (unint64_t *)&qword_18C7684A8);
  }

  return result;
}

unint64_t sub_1890D413C()
{
  unint64_t result = qword_18C7684B0;
  if (!qword_18C7684B0)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ProcessCodeSigningFlags,  &type metadata for ProcessCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_18C7684B0);
  }

  return result;
}

unint64_t sub_1890D4180()
{
  unint64_t result = qword_18C7684B8;
  if (!qword_18C7684B8)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for CodeDirectoryHash,  &type metadata for CodeDirectoryHash);
    atomic_store(result, (unint64_t *)&qword_18C7684B8);
  }

  return result;
}

unint64_t sub_1890D41C4()
{
  unint64_t result = qword_18C7684C0;
  if (!qword_18C7684C0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for AppleInternal, &type metadata for AppleInternal);
    atomic_store(result, (unint64_t *)&qword_18C7684C0);
  }

  return result;
}

uint64_t sub_1890D4208(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7684C8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890D3CB8();
  sub_1890F18C0();
  if (v1) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v29[0]) = 0;
  sub_1890D259C();
  sub_1890F1728();
  int v24 = LOBYTE(v30[0]);
  if (sub_1890EFBB4(v30[0]) == 7499556 && v7 == 0xE300000000000000LL)
  {
    swift_bridgeObjectRelease();
  }

  else
  {
    char v8 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
LABEL_17:
      sub_1890D25E0();
      swift_allocError();
      *uint64_t v20 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
  }

  LOBYTE(v29[0]) = 1;
  sub_1890F1728();
  int v23 = LOBYTE(v30[0]);
  if (sub_1890EFBB4(v30[0]) != 0x617272612D726F24LL || v9 != 0xE900000000000079LL)
  {
    char v10 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }

  swift_bridgeObjectRelease();
LABEL_10:
  unint64_t v32 = (void *)MEMORY[0x18961AFE8];
  LOBYTE(v29[0]) = 2;
  sub_1890F16F8();
  __swift_project_boxed_opaque_existential_1(v30, v31);
  while ((sub_1890F17F4() & 1) == 0)
  {
    sub_1890C93C0((uint64_t)v30, v29);
    sub_1890D51E0((uint64_t)v29, (uint64_t)v26);
    uint64_t v11 = v32;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v11 = sub_1890EA41C(0LL, v11[2] + 1LL, 1, v11);
      unint64_t v32 = v11;
    }

    unint64_t v13 = v11[2];
    unint64_t v12 = v11[3];
    if (v13 >= v12 >> 1) {
      unint64_t v32 = sub_1890EA41C((void *)(v12 > 1), v13 + 1, 1, v11);
    }
    uint64_t v15 = v27;
    uint64_t v14 = v28;
    uint64_t v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    uint64_t v25 = &v22;
    MEMORY[0x1895F8858](v16);
    unsigned int v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v19 + 16))(v18);
    sub_1890D1998( v13,  (uint64_t)v18,  (uint64_t *)&v32,  v15,  v14,  (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    __swift_project_boxed_opaque_existential_1(v30, v31);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v23 | (v24 << 8);
}

unint64_t sub_1890D4664()
{
  unint64_t result = qword_18C7684D8;
  if (!qword_18C7684D8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2820, &type metadata for OnDiskConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7684D8);
  }

  return result;
}

unint64_t sub_1890D46A8()
{
  unint64_t result = qword_18C7684E8;
  if (!qword_18C7684E8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F27D0, &type metadata for OnDiskConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7684E8);
  }

  return result;
}

unint64_t sub_1890D46EC()
{
  unint64_t result = qword_18C7684F8;
  if (!qword_18C7684F8)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for OnDiskCodeSigningFlags,  &type metadata for OnDiskCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_18C7684F8);
  }

  return result;
}

unint64_t sub_1890D4730()
{
  unint64_t result = qword_18C768500;
  if (!qword_18C768500)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for IsMainBinary, &type metadata for IsMainBinary);
    atomic_store(result, (unint64_t *)&qword_18C768500);
  }

  return result;
}

unint64_t sub_1890D4774()
{
  unint64_t result = qword_18C768510;
  if (!qword_18C768510)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ValidationCategory,  &type metadata for ValidationCategory);
    atomic_store(result, (unint64_t *)&qword_18C768510);
  }

  return result;
}

unint64_t sub_1890D47B8()
{
  unint64_t result = qword_18C768518;
  if (!qword_18C768518)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for TeamIdentifier, &type metadata for TeamIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C768518);
  }

  return result;
}

unint64_t sub_1890D47FC()
{
  unint64_t result = qword_18C768520;
  if (!qword_18C768520)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for SigningIdentifier,  &type metadata for SigningIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C768520);
  }

  return result;
}

unint64_t sub_1890D4840()
{
  unint64_t result = qword_18C768528;
  if (!qword_18C768528)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for PlatformIdentifier,  &type metadata for PlatformIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C768528);
  }

  return result;
}

unint64_t sub_1890D4884()
{
  unint64_t result = qword_18C768530;
  if (!qword_18C768530)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for PlatformType, &type metadata for PlatformType);
    atomic_store(result, (unint64_t *)&qword_18C768530);
  }

  return result;
}

unint64_t sub_1890D48C8()
{
  unint64_t result = qword_18C768538;
  if (!qword_18C768538)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for OSEnvironment, &type metadata for OSEnvironment);
    atomic_store(result, (unint64_t *)&qword_18C768538);
  }

  return result;
}

unint64_t sub_1890D490C()
{
  unint64_t result = qword_18C768540;
  if (!qword_18C768540)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for OnSystemVolume, &type metadata for OnSystemVolume);
    atomic_store(result, (unint64_t *)&qword_18C768540);
  }

  return result;
}

unint64_t sub_1890D4950()
{
  unint64_t result = qword_18C768548;
  if (!qword_18C768548)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for OnAuthorizedAuthAPFSVolume,  &type metadata for OnAuthorizedAuthAPFSVolume);
    atomic_store(result, (unint64_t *)&qword_18C768548);
  }

  return result;
}

unint64_t sub_1890D4994()
{
  unint64_t result = qword_18C768550;
  if (!qword_18C768550)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for IsSIPProtected, &type metadata for IsSIPProtected);
    atomic_store(result, (unint64_t *)&qword_18C768550);
  }

  return result;
}

unint64_t sub_1890D49D8()
{
  unint64_t result = qword_18C768558;
  if (!qword_18C768558)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for IsMainBinary, &type metadata for IsMainBinary);
    atomic_store(result, (unint64_t *)&qword_18C768558);
  }

  return result;
}

unint64_t sub_1890D4A1C()
{
  unint64_t result = qword_18C768560;
  if (!qword_18C768560)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for InTrustCacheWithConstraintCategory,  &type metadata for InTrustCacheWithConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_18C768560);
  }

  return result;
}

unint64_t sub_1890D4A60()
{
  unint64_t result = qword_18C768568;
  if (!qword_18C768568)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for InfoPlistHash, &type metadata for InfoPlistHash);
    atomic_store(result, (unint64_t *)&qword_18C768568);
  }

  return result;
}

uint64_t sub_1890D4AA4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = MEMORY[0x1895DFB60](a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_1890D4AE4()
{
  unint64_t result = qword_18C768578;
  if (!qword_18C768578)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for DeveloperMode, &type metadata for DeveloperMode);
    atomic_store(result, (unint64_t *)&qword_18C768578);
  }

  return result;
}

unint64_t sub_1890D4B28()
{
  unint64_t result = qword_18C768580;
  if (!qword_18C768580)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for OnDiskCodeSigningFlags,  &type metadata for OnDiskCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_18C768580);
  }

  return result;
}

uint64_t sub_1890D4B6C()
{
  return swift_deallocObject();
}

unint64_t sub_1890D4B90()
{
  unint64_t result = qword_18C768588;
  if (!qword_18C768588)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for CodeDirectoryHash,  &type metadata for CodeDirectoryHash);
    atomic_store(result, (unint64_t *)&qword_18C768588);
  }

  return result;
}

unint64_t sub_1890D4BD4()
{
  unint64_t result = qword_18C768590;
  if (!qword_18C768590)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for AppleInternal, &type metadata for AppleInternal);
    atomic_store(result, (unint64_t *)&qword_18C768590);
  }

  return result;
}

uint64_t sub_1890D4C18()
{
  unint64_t v0 = sub_1890F16EC();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3LL;
  }
  else {
    return v0;
  }
}

uint64_t sub_1890D4C5C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768598);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890D4664();
  sub_1890F18C0();
  if (v1) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v29[0]) = 0;
  sub_1890D259C();
  sub_1890F1728();
  int v24 = LOBYTE(v30[0]);
  if (sub_1890EFBB4(v30[0]) == 7499556 && v7 == 0xE300000000000000LL)
  {
    swift_bridgeObjectRelease();
  }

  else
  {
    char v8 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
LABEL_17:
      sub_1890D25E0();
      swift_allocError();
      *uint64_t v20 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
  }

  LOBYTE(v29[0]) = 1;
  sub_1890F1728();
  int v23 = LOBYTE(v30[0]);
  if (sub_1890EFBB4(v30[0]) != 0x617272612D726F24LL || v9 != 0xE900000000000079LL)
  {
    char v10 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }

  swift_bridgeObjectRelease();
LABEL_10:
  unint64_t v32 = (void *)MEMORY[0x18961AFE8];
  LOBYTE(v29[0]) = 2;
  sub_1890F16F8();
  __swift_project_boxed_opaque_existential_1(v30, v31);
  while ((sub_1890F17F4() & 1) == 0)
  {
    sub_1890C9FB8((uint64_t)v30, v29);
    sub_1890D51E0((uint64_t)v29, (uint64_t)v26);
    uint64_t v11 = v32;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v11 = sub_1890EA430(0LL, v11[2] + 1LL, 1, v11);
      unint64_t v32 = v11;
    }

    unint64_t v13 = v11[2];
    unint64_t v12 = v11[3];
    if (v13 >= v12 >> 1) {
      unint64_t v32 = sub_1890EA430((void *)(v12 > 1), v13 + 1, 1, v11);
    }
    uint64_t v15 = v27;
    uint64_t v14 = v28;
    uint64_t v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    uint64_t v25 = &v22;
    MEMORY[0x1895F8858](v16);
    unsigned int v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v19 + 16))(v18);
    sub_1890D1998( v13,  (uint64_t)v18,  (uint64_t *)&v32,  v15,  v14,  (uint64_t (*)(uint64_t *, uint64_t))sub_1890D2660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    __swift_project_boxed_opaque_existential_1(v30, v31);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v23 | (v24 << 8);
}

uint64_t sub_1890D50B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1890D5100(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1890D5148@<X0>(unsigned __int16 *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_1890D5178(a1, a2, sub_1890D1A38, a3);
}

uint64_t sub_1890D5164@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_1890D5294(a1, a2, a3);
}

uint64_t sub_1890D5178@<X0>( unsigned __int16 *a1@<X0>, void *a2@<X1>, uint64_t (*a3)(void, void)@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result = a3(*a1, *((void *)a1 + 1));
  if (v4) {
    *a2 = v4;
  }
  else {
    *a4 = result;
  }
  return result;
}

uint64_t sub_1890D51BC()
{
  return swift_release();
}

uint64_t sub_1890D51C4@<X0>(unsigned __int16 *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_1890D5178(a1, a2, sub_1890D1A1C, a3);
}

uint64_t sub_1890D51E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1890D5224@<X0>(unsigned __int16 *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_1890D5178(a1, a2, sub_1890D1D0C, a3);
}

uint64_t sub_1890D5240@<X0>(unsigned __int16 *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_1890D5178(a1, a2, sub_1890D1CE8, a3);
}

uint64_t sub_1890D525C@<X0>(unsigned __int16 *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_1890D5178(a1, a2, sub_1890D1CC4, a3);
}

uint64_t sub_1890D5278@<X0>(unsigned __int16 *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_1890D5178(a1, a2, sub_1890D1CA0, a3);
}

uint64_t sub_1890D5294@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_1890D1F94(*a1, *(_BYTE *)(*(void *)(v3 + 16) + 1LL));
  if (v4) {
    *a2 = v4;
  }
  else {
    *a3 = result;
  }
  return result;
}

uint64_t sub_1890D52D8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_1890D531C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  void *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for OnDiskConstraintConjunction.CodingKeys()
{
  return &type metadata for OnDiskConstraintConjunction.CodingKeys;
}

ValueMetadata *type metadata accessor for OnDiskConstraintDisjunction.CodingKeys()
{
  return &type metadata for OnDiskConstraintDisjunction.CodingKeys;
}

uint64_t sub_1890D5394(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1890D539C(_BYTE *result, char a2)
{
  void *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LaunchConstraintConjunction.CodingKeys()
{
  return &type metadata for LaunchConstraintConjunction.CodingKeys;
}

ValueMetadata *type metadata accessor for LaunchConstraintDisjunction.CodingKeys()
{
  return &type metadata for LaunchConstraintDisjunction.CodingKeys;
}

ValueMetadata *type metadata accessor for ProcessConstraintConjunction.CodingKeys()
{
  return &type metadata for ProcessConstraintConjunction.CodingKeys;
}

uint64_t _s27LightweightCodeRequirements27OnDiskConstraintConjunctionV10CodingKeysOwet_0( unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

    int v4 = 0LL;
    uint64_t v36 = 0LL;
    memset(v35, 0, sizeof(v35));
    uint64_t v33 = 0u;
    __int128 v34 = 0u;
LABEL_18:
    sub_1890F1188((uint64_t)&v33, (uint64_t)&v37);
    if (!*((void *)&v38 + 1)) {
      goto LABEL_46;
    }
    sub_1890DBB6C(v41, v32);
    uint64_t v33 = v37;
    __int128 v34 = v38;
    *(void *)&v35[0] = v39;
    if (!swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      sub_1890D25E0();
      swift_allocError();
      *unint64_t v26 = 1;
      swift_willThrow();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
LABEL_46:
      swift_release();
      return (uint64_t)v6;
    }

    unint64_t v12 = v31[0];
    sub_1890F035C((uint64_t)v32, (uint64_t *)&v33);
    if (v1)
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
      swift_bridgeObjectRelease();
      goto LABEL_46;
    }

    sub_1890D51E0((uint64_t)&v33, (uint64_t)v31);
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v15 = sub_1890D146C(v12, *((uint64_t *)&v12 + 1));
    uint64_t v16 = v6[2];
    uint64_t v17 = (v14 & 1) == 0;
    unsigned int v18 = v16 + v17;
    if (__OFADD__(v16, v17)) {
      break;
    }
    uint64_t v19 = v14;
    if (v6[3] >= v18)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v14 & 1) != 0) {
          goto LABEL_4;
        }
      }

      else
      {
        sub_1890D14D0();
        if ((v19 & 1) != 0) {
          goto LABEL_4;
        }
      }
    }

    else
    {
      sub_1890D1148(v18, isUniquelyReferenced_nonNull_native);
      uint64_t v20 = sub_1890D146C(v12, *((uint64_t *)&v12 + 1));
      if ((v19 & 1) != (v21 & 1)) {
        goto LABEL_51;
      }
      uint64_t v15 = v20;
      if ((v19 & 1) != 0)
      {
LABEL_4:
        BOOL v7 = v6[7] + 40 * v15;
        __swift_destroy_boxed_opaque_existential_1(v7);
        sub_1890D2660(v31, v7);
        goto LABEL_5;
      }
    }

    v6[(v15 >> 6) + 8] |= 1LL << v15;
    *(_OWORD *)(v6[6] + 16 * v15) = v12;
    sub_1890D2660(v31, v6[7] + 40 * v15);
    uint64_t v22 = v6[2];
    int v23 = __OFADD__(v22, 1LL);
    int v24 = v22 + 1;
    if (v23) {
      goto LABEL_48;
    }
    v6[2] = v24;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v33);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  }

  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  uint64_t result = sub_1890F1854();
  __break(1u);
  return result;
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1F;
  int v8 = v6 - 31;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t _s27LightweightCodeRequirements27OnDiskConstraintConjunctionV10CodingKeysOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_1890D54B0 + 4 * byte_1890F1C45[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1890D54E4 + 4 * byte_1890F1C40[v4]))();
}

uint64_t sub_1890D54E4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1890D54EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1890D54F4LL);
  }
  return result;
}

uint64_t sub_1890D5500(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1890D5508LL);
  }
  *(_BYTE *)uint64_t result = a2 + 2;
  return result;
}

uint64_t sub_1890D550C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1890D5514(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProcessConstraintDisjunction.CodingKeys()
{
  return &type metadata for ProcessConstraintDisjunction.CodingKeys;
}

unint64_t sub_1890D5534()
{
  unint64_t result = qword_18C7686C0;
  if (!qword_18C7686C0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F22F8, &type metadata for ProcessConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7686C0);
  }

  return result;
}

unint64_t sub_1890D557C()
{
  unint64_t result = qword_18C7686C8;
  if (!qword_18C7686C8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F23E8, &type metadata for ProcessConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7686C8);
  }

  return result;
}

unint64_t sub_1890D55C4()
{
  unint64_t result = qword_18C7686D0;
  if (!qword_18C7686D0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F24D8, &type metadata for LaunchConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7686D0);
  }

  return result;
}

unint64_t sub_1890D560C()
{
  unint64_t result = qword_18C7686D8;
  if (!qword_18C7686D8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F25C8, &type metadata for LaunchConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7686D8);
  }

  return result;
}

unint64_t sub_1890D5654()
{
  unint64_t result = qword_18C7686E0;
  if (!qword_18C7686E0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F26B8, &type metadata for OnDiskConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7686E0);
  }

  return result;
}

unint64_t sub_1890D569C()
{
  unint64_t result = qword_18C7686E8;
  if (!qword_18C7686E8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F27A8, &type metadata for OnDiskConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7686E8);
  }

  return result;
}

unint64_t sub_1890D56E4()
{
  unint64_t result = qword_18C7686F0;
  if (!qword_18C7686F0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F26E0, &type metadata for OnDiskConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7686F0);
  }

  return result;
}

unint64_t sub_1890D572C()
{
  unint64_t result = qword_18C7686F8;
  if (!qword_18C7686F8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2708, &type metadata for OnDiskConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7686F8);
  }

  return result;
}

unint64_t sub_1890D5774()
{
  unint64_t result = qword_18C768700;
  if (!qword_18C768700)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F25F0, &type metadata for OnDiskConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768700);
  }

  return result;
}

unint64_t sub_1890D57BC()
{
  unint64_t result = qword_18C768708;
  if (!qword_18C768708)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2618, &type metadata for OnDiskConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768708);
  }

  return result;
}

unint64_t sub_1890D5804()
{
  unint64_t result = qword_18C768710;
  if (!qword_18C768710)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2500, &type metadata for LaunchConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768710);
  }

  return result;
}

unint64_t sub_1890D584C()
{
  unint64_t result = qword_18C768718;
  if (!qword_18C768718)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2528, &type metadata for LaunchConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768718);
  }

  return result;
}

unint64_t sub_1890D5894()
{
  unint64_t result = qword_18C768720;
  if (!qword_18C768720)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2410, &type metadata for LaunchConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768720);
  }

  return result;
}

unint64_t sub_1890D58DC()
{
  unint64_t result = qword_18C768728;
  if (!qword_18C768728)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2438, &type metadata for LaunchConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768728);
  }

  return result;
}

unint64_t sub_1890D5924()
{
  unint64_t result = qword_18C768730;
  if (!qword_18C768730)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2320, &type metadata for ProcessConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768730);
  }

  return result;
}

unint64_t sub_1890D596C()
{
  unint64_t result = qword_18C768738;
  if (!qword_18C768738)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2348, &type metadata for ProcessConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768738);
  }

  return result;
}

unint64_t sub_1890D59B4()
{
  unint64_t result = qword_18C768740;
  if (!qword_18C768740)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2230, &type metadata for ProcessConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768740);
  }

  return result;
}

unint64_t sub_1890D59FC()
{
  unint64_t result = qword_18C768748;
  if (!qword_18C768748)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2258, &type metadata for ProcessConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768748);
  }

  return result;
}

uint64_t sub_1890D5A9C()
{
  id v1 = objc_msgSend(v0, sel_dictionary);
  if (v1)
  {
    int v2 = v1;
    uint64_t v3 = sub_1890F15A8();

    uint64_t v4 = sub_1890EFEF4(v3);
    swift_bridgeObjectRelease();
    if (*(void *)(v4 + 16) && (unint64_t v5 = sub_1890D146C(1936811378LL, 0xE400000000000000LL), (v6 & 1) != 0))
    {
      sub_1890D51E0(*(void *)(v4 + 56) + 40 * v5, (uint64_t)&v9);
      swift_bridgeObjectRelease();
      if (*((void *)&v10 + 1))
      {
        sub_1890D2660(&v9, (uint64_t)v12);
        sub_1890D2660(v12, (uint64_t)&v9);
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A0);
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
        swift_dynamicCast();
        return v8;
      }
    }

    else
    {
      uint64_t v11 = 0LL;
      __int128 v9 = 0u;
      __int128 v10 = 0u;
      swift_bridgeObjectRelease();
    }

    sub_1890D531C((uint64_t)&v9, &qword_18C7688C8);
  }

  return MEMORY[0x18961AFF0];
}

uint64_t sub_1890D5BF4( uint64_t a1, uint64_t a2, void (*a3)(_OWORD *__return_ptr, void, void), uint64_t a4, void (*a5)(_OWORD *__return_ptr, void, void))
{
  if (swift_dynamicCast())
  {
    a3(v17, (unsigned __int16)v15, *((void *)&v15 + 1));
    if (v5)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)a5;
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7688B8);
    swift_dynamicCast();
    a5 = (void (*)(_OWORD *__return_ptr, void, void))v15;
    if (!*(void *)(v15 + 16) || (unint64_t v10 = sub_1890D146C(1684955428LL, 0xE400000000000000LL), (v11 & 1) == 0))
    {
      memset(v17, 0, 32);
      sub_1890D531C((uint64_t)v17, &qword_18C7688C0);
      swift_bridgeObjectRelease();
      return (uint64_t)a5;
    }

    sub_1890DBB30(*(void *)(v15 + 56) + 32 * v10, (uint64_t)v17);
    sub_1890D531C((uint64_t)v17, &qword_18C7688C0);
    if (*(void *)(v15 + 16) && (unint64_t v12 = sub_1890D146C(1684955428LL, 0xE400000000000000LL), (v13 & 1) != 0))
    {
      sub_1890DBB30(*(void *)(v15 + 56) + 32 * v12, (uint64_t)&v15);
    }

    else
    {
      __int128 v15 = 0u;
      __int128 v16 = 0u;
    }

    uint64_t result = swift_bridgeObjectRelease();
    if (*((void *)&v16 + 1))
    {
      swift_bridgeObjectRelease();
      sub_1890DBB6C(&v15, v17);
      swift_dynamicCast();
      return v14;
    }
  }

  else
  {
    sub_1890DBB30(a1, (uint64_t)v17);
    uint64_t result = swift_dynamicCast();
    if ((result & 1) != 0)
    {
      a5(v17, (unsigned __int16)v15, *((void *)&v15 + 1));
      swift_bridgeObjectRelease();
      if (!v5)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A0);
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C7688B8);
        swift_dynamicCast();
        return v15;
      }

      return (uint64_t)a5;
    }

    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_1890D5E54(uint64_t a1, uint64_t a2)
{
  __int128 v12[3] = *(id *)MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)objc_opt_self();
  sub_1890D6088(a2);
  uint64_t v5 = (void *)sub_1890F159C();
  swift_bridgeObjectRelease();
  v12[0] = 0LL;
  id v6 = objc_msgSend(v4, sel_withVersion_withConstraintCategory_withRequirements_withError_, 1, a1, v5, v12);

  if (v6)
  {
    id v7 = v12[0];
    id v8 = objc_msgSend(v6, sel_externalRepresentation);
    uint64_t v9 = sub_1890F156C();

    return v9;
  }

  else
  {
    id v11 = v12[0];
    sub_1890F1554();

    swift_willThrow();
    v12[0] = 0LL;
    v12[1] = (id)0xE000000000000000LL;
    sub_1890F168C();
    sub_1890F15E4();
    sub_1890F17A0();
    sub_1890F15E4();
    swift_bridgeObjectRelease();
    sub_1890F15E4();
    sub_1890F15B4();
    sub_1890F15E4();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1890F16B0();
    __break(1u);
  }

  return result;
}

uint64_t sub_1890D6088(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7688B0);
    uint64_t v2 = sub_1890F16E0();
  }

  else
  {
    uint64_t v2 = MEMORY[0x18961AFF0];
  }

  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1LL << -(char)v3);
  }
  else {
    uint64_t v4 = -1LL;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0LL;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }

    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1LL))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }

    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }

LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_1890DBB30(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&__int128 v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1890DBB6C(v38, v32);
    __int128 v33 = v29;
    __int128 v34 = v30;
    uint64_t v35 = v31;
    sub_1890DBB6C(v32, v36);
    __int128 v29 = v33;
    __int128 v30 = v34;
    uint64_t v31 = v35;
    sub_1890DBB6C(v36, v37);
    sub_1890DBB6C(v37, &v33);
    uint64_t result = sub_1890F1680();
    uint64_t v20 = -1LL << *(_BYTE *)(v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1LL << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1LL << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }

        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0LL;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v6 + 8 * v22);
      }

      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }

    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_1890DBB6C(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }

  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_1890D51BC();
    return v2;
  }

  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }

  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1LL)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }

LABEL_39:
  __break(1u);
  return result;
}

uint64_t ProcessCodeRequirement.dictionaryEncoding.getter()
{
  id v1 = v0;
  uint64_t v2 = v0[3];
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v1, v2);
  v7[3] = v2;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16LL))( boxed_opaque_existential_1,  v3,  v2);
  uint64_t v5 = sub_1890D5BF4( (uint64_t)v7,  (uint64_t)&type metadata for ProcessConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8598,  (uint64_t)&type metadata for ProcessConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8574);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

uint64_t ProcessCodeRequirement.dataEncoding.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  sub_1890D52D8(v1, *(void *)(v0 + 48));
  return v1;
}

uint64_t static ProcessCodeRequirement.allOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1();
  *(void *)(a2 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = &type metadata for ProcessConstraintConjunction;
  *(void *)(a2 + 32) = sub_1890CFBE0();
  *(_WORD *)a2 = 5141;
  *(void *)(a2 + 8) = v4;
  __int16 v10 = 5141;
  unint64_t v12 = &type metadata for ProcessConstraintConjunction;
  uint64_t v11 = v4;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1890D5BF4( (uint64_t)&v10,  (uint64_t)&type metadata for ProcessConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8598,  (uint64_t)&type metadata for ProcessConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8574);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1(a2);
  }
  uint64_t v7 = sub_1890D5E54(0LL, v5);
  uint64_t v9 = v8;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(a2 + 40) = v7;
  *(void *)(a2 + 48) = v9;
  return result;
}

uint64_t static ProcessCodeRequirement.anyOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1();
  *(void *)(a2 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = &type metadata for ProcessConstraintDisjunction;
  *(void *)(a2 + 32) = sub_1890CFD00();
  *(_WORD *)a2 = 7197;
  *(void *)(a2 + 8) = v4;
  __int16 v10 = 7197;
  unint64_t v12 = &type metadata for ProcessConstraintDisjunction;
  uint64_t v11 = v4;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1890D5BF4( (uint64_t)&v10,  (uint64_t)&type metadata for ProcessConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8598,  (uint64_t)&type metadata for ProcessConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8574);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1(a2);
  }
  uint64_t v7 = sub_1890D5E54(0LL, v5);
  uint64_t v9 = v8;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(a2 + 40) = v7;
  *(void *)(a2 + 48) = v9;
  return result;
}

uint64_t ProcessCodeRequirement.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(void *)(a1 + 16))
  {
    sub_1890D25E0();
    swift_allocError();
    *uint64_t v5 = 2;
    swift_willThrow();
    return sub_1890D6944(a1);
  }

  sub_1890D51E0(a1 + 24, (uint64_t)&v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768640);
  if ((swift_dynamicCast() & 1) != 0)
  {
    unsigned int v7 = sub_1890CAB1C(v24, v25);
    if (v2) {
      return sub_1890D6944(a1);
    }
    char v9 = v7;
    uint64_t v10 = v8;
    unsigned int v11 = v7 >> 8;
    *((void *)&v28 + 1) = &type metadata for ProcessConstraintConjunction;
    unint64_t v12 = sub_1890CFBE0();
    LOBYTE(v27) = v9;
    BYTE1(v27) = v11;
    *(void *)&__int128 v29 = v12;
    *((void *)&v27 + 1) = v10;
    LOBYTE(v__swift_destroy_boxed_opaque_existential_1(v0 + 24) = v9;
    HIBYTE(v__swift_destroy_boxed_opaque_existential_1(v0 + 24) = v11;
    uint64_t v26 = &type metadata for ProcessConstraintConjunction;
    uint64_t v25 = v10;
    swift_bridgeObjectRetain();
LABEL_10:
    uint64_t v19 = sub_1890D5BF4( (uint64_t)&v24,  (uint64_t)&type metadata for ProcessConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8598,  (uint64_t)&type metadata for ProcessConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8574);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
    uint64_t v20 = sub_1890D5E54(0LL, v19);
    uint64_t v22 = v21;
    swift_bridgeObjectRelease();
    *((void *)&v29 + 1) = v20;
    *(void *)(a2 + 48) = v22;
    __int128 v23 = v28;
    *(_OWORD *)a2 = v27;
    *(_OWORD *)(a2 + 16) = v23;
    *(_OWORD *)(a2 + 32) = v29;
    return sub_1890D6944(a1);
  }

  sub_1890D51E0(a1 + 24, (uint64_t)&v27);
  uint64_t result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    unsigned int v13 = sub_1890CB028(v24, v25);
    if (v2) {
      return sub_1890D6944(a1);
    }
    char v15 = v13;
    uint64_t v16 = v14;
    unsigned int v17 = v13 >> 8;
    *((void *)&v28 + 1) = &type metadata for ProcessConstraintDisjunction;
    unint64_t v18 = sub_1890CFD00();
    LOBYTE(v27) = v15;
    BYTE1(v27) = v17;
    *(void *)&__int128 v29 = v18;
    *((void *)&v27 + 1) = v16;
    LOBYTE(v__swift_destroy_boxed_opaque_existential_1(v0 + 24) = v15;
    HIBYTE(v__swift_destroy_boxed_opaque_existential_1(v0 + 24) = v17;
    uint64_t v26 = &type metadata for ProcessConstraintDisjunction;
    uint64_t v25 = v16;
    swift_bridgeObjectRetain();
    goto LABEL_10;
  }

  __break(1u);
  return result;
}

{
  uint64_t v2;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t result;
  unsigned int v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  unsigned int v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  unsigned __int16 v24;
  uint64_t v25;
  ValueMetadata *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v5 = a1 + 16;
  sub_1890D51E0(a1 + 16, (uint64_t)&v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768648);
  if ((swift_dynamicCast() & 1) != 0)
  {
    uint64_t v6 = sub_1890CB534(v24, v25);
    if (!v2)
    {
      uint64_t v8 = v6;
      char v9 = v7;
      uint64_t v10 = v6 >> 8;
      *((void *)&v28 + 1) = &type metadata for ProcessConstraintConjunction;
      unsigned int v11 = sub_1890CFBE0();
      LOBYTE(v27) = v8;
      BYTE1(v27) = v10;
      *(void *)&__int128 v29 = v11;
      *((void *)&v27 + 1) = v9;
      LOBYTE(v__swift_destroy_boxed_opaque_existential_1(v0 + 24) = v8;
      HIBYTE(v__swift_destroy_boxed_opaque_existential_1(v0 + 24) = v10;
      uint64_t v26 = &type metadata for ProcessConstraintConjunction;
      uint64_t v25 = v9;
      swift_bridgeObjectRetain();
LABEL_7:
      uint64_t v19 = sub_1890D5BF4( (uint64_t)&v24,  (uint64_t)&type metadata for ProcessConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8598,  (uint64_t)&type metadata for ProcessConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8574);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
      uint64_t v20 = sub_1890D5E54(0LL, v19);
      uint64_t v22 = v21;
      swift_bridgeObjectRelease();
      *((void *)&v29 + 1) = v20;
      *(void *)(a2 + 48) = v22;
      __int128 v23 = v28;
      *(_OWORD *)a2 = v27;
      *(_OWORD *)(a2 + 16) = v23;
      *(_OWORD *)(a2 + 32) = v29;
      return sub_1890D6B98(a1);
    }

    return sub_1890D6B98(a1);
  }

  sub_1890D51E0(v5, (uint64_t)&v27);
  uint64_t result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    unsigned int v13 = sub_1890CBB4C(v24, v25);
    if (!v2)
    {
      char v15 = v13;
      uint64_t v16 = v14;
      unsigned int v17 = v13 >> 8;
      *((void *)&v28 + 1) = &type metadata for ProcessConstraintDisjunction;
      unint64_t v18 = sub_1890CFD00();
      LOBYTE(v27) = v15;
      BYTE1(v27) = v17;
      *(void *)&__int128 v29 = v18;
      *((void *)&v27 + 1) = v16;
      LOBYTE(v__swift_destroy_boxed_opaque_existential_1(v0 + 24) = v15;
      HIBYTE(v__swift_destroy_boxed_opaque_existential_1(v0 + 24) = v17;
      uint64_t v26 = &type metadata for ProcessConstraintDisjunction;
      uint64_t v25 = v16;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    }

    return sub_1890D6B98(a1);
  }

  __break(1u);
  return result;
}

{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int16 v15;
  uint64_t v16;
  ValueMetadata *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void v21[5];
  uint64_t v4 = sub_1890EFEF4(a1);
  if (v2) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  sub_1890DDC1C(v5, v21);
  swift_bridgeObjectRelease();
  sub_1890D51E0((uint64_t)v21, (uint64_t)&v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768630);
  if ((swift_dynamicCast() & 1) != 0)
  {
    *((void *)&v19 + 1) = &type metadata for ProcessConstraintConjunction;
    unsigned int v7 = sub_1890CFBE0();
    LOWORD(v18) = v15;
    *(void *)&uint64_t v20 = v7;
    *((void *)&v18 + 1) = v16;
    unsigned int v17 = &type metadata for ProcessConstraintConjunction;
    swift_bridgeObjectRetain();
  }

  else
  {
    sub_1890D51E0((uint64_t)v21, (uint64_t)&v18);
    if ((swift_dynamicCast() & 1) == 0)
    {
      sub_1890D25E0();
      swift_allocError();
      *uint64_t v10 = 1;
      swift_willThrow();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    }

    *((void *)&v19 + 1) = &type metadata for ProcessConstraintDisjunction;
    uint64_t v8 = sub_1890CFD00();
    LOWORD(v18) = v15;
    *(void *)&uint64_t v20 = v8;
    *((void *)&v18 + 1) = v16;
    unsigned int v17 = &type metadata for ProcessConstraintDisjunction;
    swift_bridgeObjectRetain();
  }

  char v9 = sub_1890D5BF4( (uint64_t)&v15,  (uint64_t)&type metadata for ProcessConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8598,  (uint64_t)&type metadata for ProcessConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8574);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v15);
  unsigned int v11 = sub_1890D5E54(0LL, v9);
  unsigned int v13 = v12;
  swift_bridgeObjectRelease();
  *((void *)&v20 + 1) = v11;
  *(void *)(a2 + 48) = v13;
  uint64_t v14 = v19;
  *(_OWORD *)a2 = v18;
  *(_OWORD *)(a2 + 16) = v14;
  *(_OWORD *)(a2 + 32) = v20;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
}

uint64_t sub_1890D6944(uint64_t a1)
{
  return a1;
}

uint64_t sub_1890D6B98(uint64_t a1)
{
  return a1;
}

uint64_t sub_1890D6BCC()
{
  return 1LL;
}

uint64_t sub_1890D6BD8()
{
  return sub_1890F15D8();
}

uint64_t sub_1890D6BF0@<X0>(BOOL *a1@<X8>)
{
  return sub_1890D9710(a1);
}

uint64_t sub_1890D6BFC()
{
  return 0x65756C6176LL;
}

uint64_t sub_1890D6C10@<X0>(BOOL *a1@<X8>)
{
  return sub_1890D9780(a1);
}

void sub_1890D6C1C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1890D6C28()
{
  return sub_1890F18D8();
}

uint64_t sub_1890D6C50()
{
  return sub_1890F18E4();
}

uint64_t ProcessCodeRequirement.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768750);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  unsigned int v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890D6E14();
  sub_1890F18CC();
  sub_1890D51E0(v2, (uint64_t)&v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768630);
  if (swift_dynamicCast())
  {
    __int16 v12 = v10;
    uint64_t v13 = v11;
    sub_1890D0160();
LABEL_5:
    sub_1890F177C();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return swift_bridgeObjectRelease();
  }

  sub_1890D51E0(v2, (uint64_t)&v12);
  uint64_t result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    __int16 v12 = v10;
    uint64_t v13 = v11;
    sub_1890D0454();
    goto LABEL_5;
  }

  __break(1u);
  return result;
}

unint64_t sub_1890D6E14()
{
  unint64_t result = qword_18C768758;
  if (!qword_18C768758)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2FC4, &type metadata for ProcessCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768758);
  }

  return result;
}

uint64_t ProcessCodeRequirement.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768760);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890D6E14();
  sub_1890F18C0();
  if (!v2)
  {
    sub_1890D011C();
    sub_1890F1728();
    uint64_t v31 = a2;
    char v9 = v24;
    char v10 = BYTE1(v24);
    uint64_t v11 = *((void *)&v24 + 1);
    *((void *)&v25 + 1) = &type metadata for ProcessConstraintConjunction;
    unint64_t v12 = sub_1890CFBE0();
    LOBYTE(v__swift_destroy_boxed_opaque_existential_1(v0 + 24) = v9;
    BYTE1(v__swift_destroy_boxed_opaque_existential_1(v0 + 24) = v10;
    *(void *)&__int128 v26 = v12;
    *((void *)&v24 + 1) = v11;
    v21[0] = v9;
    v21[1] = v10;
    __int128 v23 = &type metadata for ProcessConstraintConjunction;
    uint64_t v22 = v11;
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_1890D5BF4( (uint64_t)v21,  (uint64_t)&type metadata for ProcessConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8598,  (uint64_t)&type metadata for ProcessConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8574);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    uint64_t v14 = sub_1890D5E54(0LL, v13);
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    *((void *)&v26 + 1) = v14;
    uint64_t v30 = v16;
    __int128 v27 = v24;
    __int128 v28 = v25;
    __int128 v29 = v26;
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    __int128 v17 = v28;
    unint64_t v18 = v31;
    *uint64_t v31 = v27;
    v18[1] = v17;
    v18[2] = v29;
    *((void *)v18 + 6) = v30;
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void ProcessCodeRequirement.init(_:)(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void v29[5] = *MEMORY[0x1895F89C0];
  uint64_t v7 = (void *)objc_opt_self();
  uint64_t v8 = (void *)sub_1890F1560();
  *(void *)&__int128 v25 = 0LL;
  id v9 = objc_msgSend(v7, sel_withData_withError_, v8, &v25);

  if (!v9)
  {
    id v12 = (id)v25;
    sub_1890F1554();

    swift_willThrow();
    sub_1890D74E0(a1, a2);
    return;
  }

  id v10 = (id)v25;
  if (!objc_msgSend(v9, sel_hasRequirements))
  {
    sub_1890D25E0();
    swift_allocError();
    *uint64_t v13 = 1;
    swift_willThrow();
    sub_1890D74E0(a1, a2);

    return;
  }

  uint64_t v11 = sub_1890D5A9C();
  sub_1890DDC1C(v11, v29);
  if (v3)
  {
    sub_1890D74E0(a1, a2);
    swift_bridgeObjectRelease();

    return;
  }

  swift_bridgeObjectRelease();
  sub_1890D51E0((uint64_t)v29, (uint64_t)&v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768630);
  if ((swift_dynamicCast() & 1) != 0)
  {
    *((void *)&v26 + 1) = &type metadata for ProcessConstraintConjunction;
    unint64_t v14 = sub_1890CFBE0();
    LOWORD(v25) = v22;
    *(void *)&__int128 v27 = v14;
    *((void *)&v25 + 1) = v23;
    __int128 v24 = &type metadata for ProcessConstraintConjunction;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_1890D5BF4( (uint64_t)&v22,  (uint64_t)&type metadata for ProcessConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8598,  (uint64_t)&type metadata for ProcessConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8574);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
LABEL_12:
    uint64_t v18 = sub_1890D5E54(0LL, v15);
    uint64_t v20 = v19;
    swift_bridgeObjectRelease();
    *((void *)&v27 + 1) = v18;
    uint64_t v28 = v20;
    *(void *)(a3 + 48) = v20;
    __int128 v21 = v26;
    *(_OWORD *)a3 = v25;
    *(_OWORD *)(a3 + 16) = v21;
    *(_OWORD *)(a3 + 32) = v27;
    goto LABEL_13;
  }

  sub_1890D51E0((uint64_t)v29, (uint64_t)&v25);
  if ((swift_dynamicCast() & 1) != 0)
  {
    *((void *)&v26 + 1) = &type metadata for ProcessConstraintDisjunction;
    unint64_t v16 = sub_1890CFD00();
    LOWORD(v25) = v22;
    *(void *)&__int128 v27 = v16;
    *((void *)&v25 + 1) = v23;
    __int128 v24 = &type metadata for ProcessConstraintDisjunction;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_1890D5BF4( (uint64_t)&v22,  (uint64_t)&type metadata for ProcessConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8598,  (uint64_t)&type metadata for ProcessConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8574);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_12;
  }

  sub_1890D25E0();
  swift_allocError();
  *__int128 v17 = 1;
  swift_willThrow();
LABEL_13:

  sub_1890D74E0(a1, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
}

uint64_t sub_1890D74E0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_1890D7770@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return ProcessCodeRequirement.init(from:)(a1, a2);
}

uint64_t sub_1890D7784(void *a1)
{
  return ProcessCodeRequirement.encode(to:)(a1);
}

uint64_t LaunchCodeRequirement.dictionaryEncoding.getter()
{
  uint64_t v1 = (void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v1, v2);
  v7[3] = v2;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16LL))( boxed_opaque_existential_1,  v3,  v2);
  uint64_t v5 = sub_1890D5BF4( (uint64_t)v7,  (uint64_t)&type metadata for LaunchConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C87A4,  (uint64_t)&type metadata for LaunchConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8780);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

uint64_t LaunchCodeRequirement.dataEncoding.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_1890D52D8(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

void LaunchCodeRequirement.constraintCategory.getter(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
}

uint64_t static LaunchCodeRequirement.allOf(constraintCategory:requirement:)@<X0>( uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a2();
  *(void *)(a3 + 16) = v5;
  *(void *)(a3 + 48) = &type metadata for LaunchConstraintConjunction;
  unint64_t v7 = sub_1890CFC40();
  *(_WORD *)(a3 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = 5141;
  *(void *)(a3 + 56) = v7;
  *(void *)(a3 + 32) = v6;
  __int16 v13 = 5141;
  uint64_t v15 = &type metadata for LaunchConstraintConjunction;
  uint64_t v14 = v6;
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_1890D5BF4( (uint64_t)&v13,  (uint64_t)&type metadata for LaunchConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C87A4,  (uint64_t)&type metadata for LaunchConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8780);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  if (v3) {
    return __swift_destroy_boxed_opaque_existential_1(a3 + 24);
  }
  uint64_t v10 = sub_1890D5E54(v5, v8);
  uint64_t v12 = v11;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a3 = v10;
  *(void *)(a3 + 8) = v12;
  return result;
}

uint64_t static LaunchCodeRequirement.allOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1();
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 48) = &type metadata for LaunchConstraintConjunction;
  unint64_t v5 = sub_1890CFC40();
  *(_WORD *)(a2 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = 5141;
  *(void *)(a2 + 56) = v5;
  *(void *)(a2 + 32) = v4;
  __int16 v11 = 5141;
  __int16 v13 = &type metadata for LaunchConstraintConjunction;
  uint64_t v12 = v4;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1890D5BF4( (uint64_t)&v11,  (uint64_t)&type metadata for LaunchConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C87A4,  (uint64_t)&type metadata for LaunchConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8780);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1(a2 + 24);
  }
  uint64_t v8 = sub_1890D5E54(0LL, v6);
  uint64_t v10 = v9;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v8;
  *(void *)(a2 + 8) = v10;
  return result;
}

uint64_t static LaunchCodeRequirement.anyOf(constraintCategory:requirement:)@<X0>( uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a2();
  *(void *)(a3 + 16) = v5;
  *(void *)(a3 + 48) = &type metadata for LaunchConstraintDisjunction;
  unint64_t v7 = sub_1890CFD60();
  *(_WORD *)(a3 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = 7197;
  *(void *)(a3 + 56) = v7;
  *(void *)(a3 + 32) = v6;
  __int16 v13 = 7197;
  uint64_t v15 = &type metadata for LaunchConstraintDisjunction;
  uint64_t v14 = v6;
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_1890D5BF4( (uint64_t)&v13,  (uint64_t)&type metadata for LaunchConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C87A4,  (uint64_t)&type metadata for LaunchConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8780);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  if (v3) {
    return __swift_destroy_boxed_opaque_existential_1(a3 + 24);
  }
  uint64_t v10 = sub_1890D5E54(v5, v8);
  uint64_t v12 = v11;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a3 = v10;
  *(void *)(a3 + 8) = v12;
  return result;
}

uint64_t static LaunchCodeRequirement.anyOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1();
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 48) = &type metadata for LaunchConstraintDisjunction;
  unint64_t v5 = sub_1890CFD60();
  *(_WORD *)(a2 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = 7197;
  *(void *)(a2 + 56) = v5;
  *(void *)(a2 + 32) = v4;
  __int16 v11 = 7197;
  __int16 v13 = &type metadata for LaunchConstraintDisjunction;
  uint64_t v12 = v4;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1890D5BF4( (uint64_t)&v11,  (uint64_t)&type metadata for LaunchConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C87A4,  (uint64_t)&type metadata for LaunchConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8780);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1(a2 + 24);
  }
  uint64_t v8 = sub_1890D5E54(0LL, v6);
  uint64_t v10 = v9;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v8;
  *(void *)(a2 + 8) = v10;
  return result;
}

uint64_t LaunchCodeRequirement.init(_:)@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  if ((swift_dynamicCast() & 1) != 0)
  {
    unsigned int v5 = sub_1890CC2B0(v24, v25);
    if (!v2)
    {
      char v7 = v5;
      uint64_t v8 = v6;
      unsigned int v9 = v5 >> 8;
      *(void *)&__int128 v28 = 0LL;
      *(void *)&__int128 v30 = &type metadata for LaunchConstraintConjunction;
      unint64_t v10 = sub_1890CFC40();
      BYTE8(v28) = v7;
      BYTE9(v28) = v9;
      *((void *)&v30 + 1) = v10;
      *(void *)&__int128 v29 = v8;
      LOBYTE(v__swift_destroy_boxed_opaque_existential_1(v0 + 24) = v7;
      HIBYTE(v__swift_destroy_boxed_opaque_existential_1(v0 + 24) = v9;
      __int128 v26 = &type metadata for LaunchConstraintConjunction;
      uint64_t v25 = v8;
      swift_bridgeObjectRetain();
LABEL_7:
      uint64_t v18 = sub_1890D5BF4( (uint64_t)&v24,  (uint64_t)&type metadata for LaunchConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C87A4,  (uint64_t)&type metadata for LaunchConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8780);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
      uint64_t v19 = sub_1890D5E54(0LL, v18);
      uint64_t v21 = v20;
      swift_bridgeObjectRelease();
      *(void *)&__int128 v27 = v19;
      *((void *)&v27 + 1) = v21;
      __int128 v22 = v30;
      a2[2] = v29;
      a2[3] = v22;
      __int128 v23 = v28;
      *a2 = v27;
      a2[1] = v23;
      return sub_1890DABF4(a1);
    }

    return sub_1890DABF4(a1);
  }

  sub_1890D51E0(a1, (uint64_t)&v27);
  uint64_t result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    unsigned int v12 = sub_1890CC7BC(v24, v25);
    if (!v2)
    {
      char v14 = v12;
      uint64_t v15 = v13;
      unsigned int v16 = v12 >> 8;
      *(void *)&__int128 v28 = 0LL;
      *(void *)&__int128 v30 = &type metadata for LaunchConstraintDisjunction;
      unint64_t v17 = sub_1890CFD60();
      BYTE8(v28) = v14;
      BYTE9(v28) = v16;
      *((void *)&v30 + 1) = v17;
      *(void *)&__int128 v29 = v15;
      LOBYTE(v__swift_destroy_boxed_opaque_existential_1(v0 + 24) = v14;
      HIBYTE(v__swift_destroy_boxed_opaque_existential_1(v0 + 24) = v16;
      __int128 v26 = &type metadata for LaunchConstraintDisjunction;
      uint64_t v25 = v15;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    }

    return sub_1890DABF4(a1);
  }

  __break(1u);
  return result;
}

{
  uint64_t v2;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t result;
  unsigned int v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  unsigned int v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  unsigned __int16 v25;
  uint64_t v26;
  ValueMetadata *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  unsigned int v5 = a1 + 16;
  sub_1890D51E0(a1 + 16, (uint64_t)&v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768648);
  if ((swift_dynamicCast() & 1) != 0)
  {
    uint64_t v6 = sub_1890CCCC8(v25, v26);
    if (!v2)
    {
      uint64_t v8 = v6;
      unsigned int v9 = v7;
      unint64_t v10 = v6 >> 8;
      *(void *)&__int128 v29 = 0LL;
      *(void *)&uint64_t v31 = &type metadata for LaunchConstraintConjunction;
      __int16 v11 = sub_1890CFC40();
      BYTE8(v29) = v8;
      BYTE9(v29) = v10;
      *((void *)&v31 + 1) = v11;
      *(void *)&__int128 v30 = v9;
      LOBYTE(v25) = v8;
      HIBYTE(v25) = v10;
      __int128 v27 = &type metadata for LaunchConstraintConjunction;
      __int128 v26 = v9;
      swift_bridgeObjectRetain();
LABEL_7:
      uint64_t v19 = sub_1890D5BF4( (uint64_t)&v25,  (uint64_t)&type metadata for LaunchConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C87A4,  (uint64_t)&type metadata for LaunchConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8780);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
      uint64_t v20 = sub_1890D5E54(0LL, v19);
      __int128 v22 = v21;
      swift_bridgeObjectRelease();
      *(void *)&__int128 v28 = v20;
      *((void *)&v28 + 1) = v22;
      __int128 v23 = v31;
      a2[2] = v30;
      a2[3] = v23;
      unsigned __int16 v24 = v29;
      *a2 = v28;
      a2[1] = v24;
      return sub_1890D6B98(a1);
    }

    return sub_1890D6B98(a1);
  }

  sub_1890D51E0(v5, (uint64_t)&v28);
  uint64_t result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    uint64_t v13 = sub_1890CD2E0(v25, v26);
    if (!v2)
    {
      uint64_t v15 = v13;
      unsigned int v16 = v14;
      unint64_t v17 = v13 >> 8;
      *(void *)&__int128 v29 = 0LL;
      *(void *)&uint64_t v31 = &type metadata for LaunchConstraintDisjunction;
      uint64_t v18 = sub_1890CFD60();
      BYTE8(v29) = v15;
      BYTE9(v29) = v17;
      *((void *)&v31 + 1) = v18;
      *(void *)&__int128 v30 = v16;
      LOBYTE(v25) = v15;
      HIBYTE(v25) = v17;
      __int128 v27 = &type metadata for LaunchConstraintDisjunction;
      __int128 v26 = v16;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    }

    return sub_1890D6B98(a1);
  }

  __break(1u);
  return result;
}

{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int16 v16;
  uint64_t v17;
  ValueMetadata *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void v23[5];
  uint64_t v4 = sub_1890EFEF4(a1);
  if (v2) {
    return swift_bridgeObjectRelease();
  }
  unsigned int v5 = v4;
  swift_bridgeObjectRelease();
  sub_1890DDDFC(v5, v23);
  swift_bridgeObjectRelease();
  sub_1890D51E0((uint64_t)v23, (uint64_t)&v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768640);
  if ((swift_dynamicCast() & 1) != 0)
  {
    *(void *)&uint64_t v20 = 0LL;
    *(void *)&__int128 v22 = &type metadata for LaunchConstraintConjunction;
    char v7 = sub_1890CFC40();
    WORD4(v20) = v16;
    *((void *)&v22 + 1) = v7;
    *(void *)&uint64_t v21 = v17;
    uint64_t v18 = &type metadata for LaunchConstraintConjunction;
    swift_bridgeObjectRetain();
  }

  else
  {
    sub_1890D51E0((uint64_t)v23, (uint64_t)&v19);
    if ((swift_dynamicCast() & 1) == 0)
    {
      sub_1890D25E0();
      swift_allocError();
      *unint64_t v10 = 1;
      swift_willThrow();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    }

    *(void *)&uint64_t v20 = 0LL;
    *(void *)&__int128 v22 = &type metadata for LaunchConstraintDisjunction;
    uint64_t v8 = sub_1890CFD60();
    WORD4(v20) = v16;
    *((void *)&v22 + 1) = v8;
    *(void *)&uint64_t v21 = v17;
    uint64_t v18 = &type metadata for LaunchConstraintDisjunction;
    swift_bridgeObjectRetain();
  }

  unsigned int v9 = sub_1890D5BF4( (uint64_t)&v16,  (uint64_t)&type metadata for LaunchConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C87A4,  (uint64_t)&type metadata for LaunchConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8780);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v16);
  __int16 v11 = sub_1890D5E54(0LL, v9);
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  *(void *)&uint64_t v19 = v11;
  *((void *)&v19 + 1) = v13;
  char v14 = v22;
  a2[2] = v21;
  a2[3] = v14;
  uint64_t v15 = v20;
  *a2 = v19;
  a2[1] = v15;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
}

uint64_t sub_1890D8078(char *a1, char *a2)
{
  return sub_1890DDB4C(*a1, *a2);
}

uint64_t sub_1890D8084()
{
  return sub_1890F18B4();
}

uint64_t sub_1890D8104()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1890D8160()
{
  return sub_1890F18B4();
}

uint64_t sub_1890D81DC@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_1890F16EC();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_1890D8238(unint64_t *a1@<X8>)
{
  unint64_t v2 = 0x65756C6176LL;
  if (*v1) {
    unint64_t v2 = 0xD000000000000012LL;
  }
  unint64_t v3 = 0x80000001890F7370LL;
  if (!*v1) {
    unint64_t v3 = 0xE500000000000000LL;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1890D8278()
{
  if (*v0) {
    return 0xD000000000000012LL;
  }
  else {
    return 0x65756C6176LL;
  }
}

uint64_t sub_1890D82B4@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_1890F16EC();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_1890D8314(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1890D8320()
{
  return sub_1890F18D8();
}

uint64_t sub_1890D8348()
{
  return sub_1890F18E4();
}

uint64_t LaunchCodeRequirement.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768768);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890DAC20();
  sub_1890F18CC();
  uint64_t v13 = *(void *)(v3 + 16);
  LOBYTE(v11) = 1;
  sub_1890DAC64();
  sub_1890F177C();
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_1890D51E0(v3 + 24, (uint64_t)&v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768640);
  if (swift_dynamicCast())
  {
    LOWORD(v13) = v11;
    uint64_t v14 = v12;
    LOBYTE(v11) = 0;
    sub_1890D028C();
LABEL_7:
    sub_1890F177C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }

  sub_1890D51E0(v3 + 24, (uint64_t)&v13);
  uint64_t result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    LOWORD(v13) = v11;
    uint64_t v14 = v12;
    LOBYTE(v11) = 0;
    sub_1890D04F0();
    goto LABEL_7;
  }

  __break(1u);
  return result;
}

uint64_t LaunchCodeRequirement.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768780);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890DAC20();
  sub_1890F18C0();
  if (!v2)
  {
    v24[0] = 1;
    sub_1890DACA8();
    sub_1890F1728();
    uint64_t v10 = v27;
    v24[0] = 0;
    sub_1890D0248();
    sub_1890F1728();
    uint64_t v35 = a2;
    uint64_t v11 = v10;
    LOBYTE(v10) = v27;
    char v12 = BYTE1(v27);
    uint64_t v13 = *((void *)&v27 + 1);
    uint64_t v23 = v11;
    *(void *)&__int128 v28 = v11;
    *(void *)&__int128 v30 = &type metadata for LaunchConstraintConjunction;
    unint64_t v14 = sub_1890CFC40();
    BYTE8(v28) = v10;
    BYTE9(v28) = v12;
    *((void *)&v30 + 1) = v14;
    *(void *)&__int128 v29 = v13;
    v24[0] = v10;
    v24[1] = v12;
    __int128 v26 = &type metadata for LaunchConstraintConjunction;
    uint64_t v25 = v13;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_1890D5BF4( (uint64_t)v24,  (uint64_t)&type metadata for LaunchConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C87A4,  (uint64_t)&type metadata for LaunchConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8780);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
    uint64_t v16 = sub_1890D5E54(v23, v15);
    uint64_t v18 = v17;
    swift_bridgeObjectRelease();
    *(void *)&__int128 v27 = v16;
    *((void *)&v27 + 1) = v18;
    __int128 v33 = v29;
    __int128 v34 = v30;
    __int128 v31 = v27;
    __int128 v32 = v28;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    __int128 v19 = v32;
    uint64_t v20 = v35;
    *uint64_t v35 = v31;
    v20[1] = v19;
    __int128 v21 = v34;
    v20[2] = v33;
    v20[3] = v21;
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void LaunchCodeRequirement.init(_:)(uint64_t a1@<X0>, unint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  v33[5] = *MEMORY[0x1895F89C0];
  uint64_t v7 = (void *)objc_opt_self();
  uint64_t v8 = (void *)sub_1890F1560();
  *(void *)&__int128 v29 = 0LL;
  id v9 = objc_msgSend(v7, sel_withData_withError_, v8, &v29);

  if (!v9)
  {
    id v12 = (id)v29;
    sub_1890F1554();

    swift_willThrow();
    sub_1890D74E0(a1, a2);
    return;
  }

  id v10 = (id)v29;
  if (!objc_msgSend(v9, sel_hasRequirements))
  {
    sub_1890D25E0();
    swift_allocError();
    *uint64_t v13 = 1;
    swift_willThrow();
    sub_1890D74E0(a1, a2);

    return;
  }

  uint64_t v11 = sub_1890D5A9C();
  sub_1890DDDFC(v11, v33);
  if (v3)
  {
    sub_1890D74E0(a1, a2);
    swift_bridgeObjectRelease();

    return;
  }

  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v9, sel_constraintCategory);
  uint64_t v15 = (uint64_t)v14;
  if (v14 && v14 != (id)17 && v14 != (id)255) {
    __break(1u);
  }
  sub_1890D51E0((uint64_t)v33, (uint64_t)&v29);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768640);
  if ((swift_dynamicCast() & 1) != 0)
  {
    uint64_t v25 = v15;
    *(void *)&__int128 v30 = v15;
    *(void *)&__int128 v32 = &type metadata for LaunchConstraintConjunction;
    unint64_t v16 = sub_1890CFC40();
    WORD4(v30) = v26;
    *((void *)&v32 + 1) = v16;
    *(void *)&__int128 v31 = v27;
    __int128 v28 = &type metadata for LaunchConstraintConjunction;
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_1890D5BF4( (uint64_t)&v26,  (uint64_t)&type metadata for LaunchConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C87A4,  (uint64_t)&type metadata for LaunchConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8780);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v26);
LABEL_15:
    uint64_t v20 = sub_1890D5E54(v25, v17);
    uint64_t v22 = v21;
    swift_bridgeObjectRelease();
    *(void *)&__int128 v29 = v20;
    *((void *)&v29 + 1) = v22;
    __int128 v23 = v32;
    a3[2] = v31;
    a3[3] = v23;
    __int128 v24 = v30;
    *a3 = v29;
    a3[1] = v24;
    goto LABEL_16;
  }

  sub_1890D51E0((uint64_t)v33, (uint64_t)&v29);
  if ((swift_dynamicCast() & 1) != 0)
  {
    uint64_t v25 = v15;
    *(void *)&__int128 v30 = v15;
    *(void *)&__int128 v32 = &type metadata for LaunchConstraintDisjunction;
    unint64_t v18 = sub_1890CFD60();
    WORD4(v30) = v26;
    *((void *)&v32 + 1) = v18;
    *(void *)&__int128 v31 = v27;
    __int128 v28 = &type metadata for LaunchConstraintDisjunction;
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_1890D5BF4( (uint64_t)&v26,  (uint64_t)&type metadata for LaunchConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C87A4,  (uint64_t)&type metadata for LaunchConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8780);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v26);
    goto LABEL_15;
  }

  sub_1890D25E0();
  swift_allocError();
  *__int128 v19 = 1;
  swift_willThrow();
LABEL_16:

  sub_1890D74E0(a1, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
}

uint64_t sub_1890D8F18@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return LaunchCodeRequirement.init(from:)(a1, a2);
}

uint64_t sub_1890D8F2C(void *a1)
{
  return LaunchCodeRequirement.encode(to:)(a1);
}

uint64_t OnDiskCodeRequirement.dictionaryEncoding.getter()
{
  uint64_t v1 = (void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v1, v2);
  v7[3] = v2;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16LL))( boxed_opaque_existential_1,  v3,  v2);
  uint64_t v5 = sub_1890D5BF4( (uint64_t)v7,  (uint64_t)&type metadata for OnDiskConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C875C,  (uint64_t)&type metadata for OnDiskConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8738);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

uint64_t OnDiskCodeRequirement.dataEncoding.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_1890D52D8(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t static OnDiskCodeRequirement.allOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1();
  *(void *)(a2 + 40) = &type metadata for OnDiskConstraintConjunction;
  unint64_t v5 = sub_1890CFCA0();
  *(_WORD *)(a2 + 16) = 5141;
  *(void *)(a2 + 48) = v5;
  *(void *)(a2 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v4;
  __int16 v11 = 5141;
  uint64_t v13 = &type metadata for OnDiskConstraintConjunction;
  uint64_t v12 = v4;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1890D5BF4( (uint64_t)&v11,  (uint64_t)&type metadata for OnDiskConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C875C,  (uint64_t)&type metadata for OnDiskConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8738);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1(a2 + 16);
  }
  uint64_t v8 = sub_1890D5E54(0LL, v6);
  uint64_t v10 = v9;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v8;
  *(void *)(a2 + 8) = v10;
  return result;
}

uint64_t static OnDiskCodeRequirement.anyOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1();
  *(void *)(a2 + 40) = &type metadata for OnDiskConstraintDisjunction;
  unint64_t v5 = sub_1890CFE20();
  *(_WORD *)(a2 + 16) = 7197;
  *(void *)(a2 + 48) = v5;
  *(void *)(a2 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v4;
  __int16 v11 = 7197;
  uint64_t v13 = &type metadata for OnDiskConstraintDisjunction;
  uint64_t v12 = v4;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1890D5BF4( (uint64_t)&v11,  (uint64_t)&type metadata for OnDiskConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C875C,  (uint64_t)&type metadata for OnDiskConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8738);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1(a2 + 16);
  }
  uint64_t v8 = sub_1890D5E54(0LL, v6);
  uint64_t v10 = v9;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v8;
  *(void *)(a2 + 8) = v10;
  return result;
}

uint64_t OnDiskCodeRequirement.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if ((swift_dynamicCast() & 1) != 0)
  {
    unsigned int v5 = sub_1890CE704(v24, v25);
    if (!v2)
    {
      char v7 = v5;
      uint64_t v8 = v6;
      unsigned int v9 = v5 >> 8;
      *((void *)&v29 + 1) = &type metadata for OnDiskConstraintConjunction;
      unint64_t v10 = sub_1890CFCA0();
      LOBYTE(v28) = v7;
      BYTE1(v28) = v9;
      unint64_t v30 = v10;
      *((void *)&v28 + 1) = v8;
      LOBYTE(v__swift_destroy_boxed_opaque_existential_1(v0 + 24) = v7;
      HIBYTE(v__swift_destroy_boxed_opaque_existential_1(v0 + 24) = v9;
      __int16 v26 = &type metadata for OnDiskConstraintConjunction;
      uint64_t v25 = v8;
      swift_bridgeObjectRetain();
LABEL_7:
      uint64_t v18 = sub_1890D5BF4( (uint64_t)&v24,  (uint64_t)&type metadata for OnDiskConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C875C,  (uint64_t)&type metadata for OnDiskConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8738);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
      uint64_t v19 = sub_1890D5E54(0LL, v18);
      uint64_t v21 = v20;
      swift_bridgeObjectRelease();
      *(void *)&__int128 v27 = v19;
      *((void *)&v27 + 1) = v21;
      __int128 v22 = v29;
      *(void *)(a2 + 48) = v30;
      __int128 v23 = v27;
      *(_OWORD *)(a2 + 16) = v28;
      *(_OWORD *)(a2 + 32) = v22;
      *(_OWORD *)a2 = v23;
      return sub_1890DABF4(a1);
    }

    return sub_1890DABF4(a1);
  }

  sub_1890D51E0(a1, (uint64_t)&v27);
  uint64_t result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    unsigned int v12 = sub_1890CED1C(v24, v25);
    if (!v2)
    {
      char v14 = v12;
      uint64_t v15 = v13;
      unsigned int v16 = v12 >> 8;
      *((void *)&v29 + 1) = &type metadata for OnDiskConstraintDisjunction;
      unint64_t v17 = sub_1890CFE20();
      LOBYTE(v28) = v14;
      BYTE1(v28) = v16;
      unint64_t v30 = v17;
      *((void *)&v28 + 1) = v15;
      LOBYTE(v__swift_destroy_boxed_opaque_existential_1(v0 + 24) = v14;
      HIBYTE(v__swift_destroy_boxed_opaque_existential_1(v0 + 24) = v16;
      __int16 v26 = &type metadata for OnDiskConstraintDisjunction;
      uint64_t v25 = v15;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    }

    return sub_1890DABF4(a1);
  }

  __break(1u);
  return result;
}

{
  uint64_t v2;
  _BYTE *v5;
  uint64_t result;
  unsigned int v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  unsigned int v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  unsigned int v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  unsigned __int16 v25;
  uint64_t v26;
  ValueMetadata *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  unint64_t v31;
  if (*(void *)(a1 + 16))
  {
    sub_1890D25E0();
    swift_allocError();
    *unsigned int v5 = 2;
    swift_willThrow();
    return sub_1890D6944(a1);
  }

  sub_1890D51E0(a1 + 24, (uint64_t)&v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768640);
  if ((swift_dynamicCast() & 1) != 0)
  {
    char v7 = sub_1890CDAD4(v25, v26);
    if (v2) {
      return sub_1890D6944(a1);
    }
    unsigned int v9 = v7;
    unint64_t v10 = v8;
    __int16 v11 = v7 >> 8;
    *((void *)&v30 + 1) = &type metadata for OnDiskConstraintConjunction;
    unsigned int v12 = sub_1890CFCA0();
    LOBYTE(v29) = v9;
    BYTE1(v29) = v11;
    __int128 v31 = v12;
    *((void *)&v29 + 1) = v10;
    LOBYTE(v25) = v9;
    HIBYTE(v25) = v11;
    __int128 v27 = &type metadata for OnDiskConstraintConjunction;
    __int16 v26 = v10;
    swift_bridgeObjectRetain();
LABEL_10:
    uint64_t v19 = sub_1890D5BF4( (uint64_t)&v25,  (uint64_t)&type metadata for OnDiskConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C875C,  (uint64_t)&type metadata for OnDiskConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8738);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
    uint64_t v20 = sub_1890D5E54(0LL, v19);
    __int128 v22 = v21;
    swift_bridgeObjectRelease();
    *(void *)&__int128 v28 = v20;
    *((void *)&v28 + 1) = v22;
    __int128 v23 = v30;
    *(void *)(a2 + 48) = v31;
    unsigned __int16 v24 = v28;
    *(_OWORD *)(a2 + 16) = v29;
    *(_OWORD *)(a2 + 32) = v23;
    *(_OWORD *)a2 = v24;
    return sub_1890D6944(a1);
  }

  sub_1890D51E0(a1 + 24, (uint64_t)&v28);
  uint64_t result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    uint64_t v13 = sub_1890CE0EC(v25, v26);
    if (v2) {
      return sub_1890D6944(a1);
    }
    uint64_t v15 = v13;
    unsigned int v16 = v14;
    unint64_t v17 = v13 >> 8;
    *((void *)&v30 + 1) = &type metadata for OnDiskConstraintDisjunction;
    uint64_t v18 = sub_1890CFE20();
    LOBYTE(v29) = v15;
    BYTE1(v29) = v17;
    __int128 v31 = v18;
    *((void *)&v29 + 1) = v16;
    LOBYTE(v25) = v15;
    HIBYTE(v25) = v17;
    __int128 v27 = &type metadata for OnDiskConstraintDisjunction;
    __int16 v26 = v16;
    swift_bridgeObjectRetain();
    goto LABEL_10;
  }

  __break(1u);
  return result;
}

{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int16 v16;
  uint64_t v17;
  ValueMetadata *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  unint64_t v22;
  void v23[5];
  uint64_t v4 = sub_1890EFEF4(a1);
  if (v2) {
    return swift_bridgeObjectRelease();
  }
  unsigned int v5 = v4;
  swift_bridgeObjectRelease();
  sub_1890DDFDC(v5, v23);
  swift_bridgeObjectRelease();
  sub_1890D51E0((uint64_t)v23, (uint64_t)&v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768648);
  if ((swift_dynamicCast() & 1) != 0)
  {
    *((void *)&v21 + 1) = &type metadata for OnDiskConstraintConjunction;
    char v7 = sub_1890CFCA0();
    LOWORD(v20) = v16;
    __int128 v22 = v7;
    *((void *)&v20 + 1) = v17;
    uint64_t v18 = &type metadata for OnDiskConstraintConjunction;
    swift_bridgeObjectRetain();
  }

  else
  {
    sub_1890D51E0((uint64_t)v23, (uint64_t)&v19);
    if ((swift_dynamicCast() & 1) == 0)
    {
      sub_1890D25E0();
      swift_allocError();
      *unint64_t v10 = 1;
      swift_willThrow();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    }

    *((void *)&v21 + 1) = &type metadata for OnDiskConstraintDisjunction;
    uint64_t v8 = sub_1890CFE20();
    LOWORD(v20) = v16;
    __int128 v22 = v8;
    *((void *)&v20 + 1) = v17;
    uint64_t v18 = &type metadata for OnDiskConstraintDisjunction;
    swift_bridgeObjectRetain();
  }

  unsigned int v9 = sub_1890D5BF4( (uint64_t)&v16,  (uint64_t)&type metadata for OnDiskConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C875C,  (uint64_t)&type metadata for OnDiskConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8738);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v16);
  __int16 v11 = sub_1890D5E54(0LL, v9);
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  *(void *)&uint64_t v19 = v11;
  *((void *)&v19 + 1) = v13;
  char v14 = v21;
  *(void *)(a2 + 48) = v22;
  uint64_t v15 = v19;
  *(_OWORD *)(a2 + 16) = v20;
  *(_OWORD *)(a2 + 32) = v14;
  *(_OWORD *)a2 = v15;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
}

uint64_t sub_1890D9670()
{
  return sub_1890F18B4();
}

uint64_t sub_1890D96BC()
{
  return sub_1890F18B4();
}

uint64_t sub_1890D9704@<X0>(BOOL *a1@<X8>)
{
  return sub_1890D9710(a1);
}

uint64_t sub_1890D9710@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_1890F16EC();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_1890D975C(void *a1@<X8>)
{
  *a1 = 0x65756C6176LL;
  a1[1] = 0xE500000000000000LL;
}

uint64_t sub_1890D9774@<X0>(BOOL *a1@<X8>)
{
  return sub_1890D9780(a1);
}

uint64_t sub_1890D9780@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_1890F16EC();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_1890D97D0()
{
  return sub_1890F18D8();
}

uint64_t sub_1890D97F8()
{
  return sub_1890F18E4();
}

uint64_t OnDiskCodeRequirement.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768790);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  char v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890DACEC();
  sub_1890F18CC();
  sub_1890D51E0(v2 + 16, (uint64_t)&v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768648);
  if (swift_dynamicCast())
  {
    __int16 v12 = v10;
    uint64_t v13 = v11;
    sub_1890D03B8();
LABEL_5:
    sub_1890F177C();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return swift_bridgeObjectRelease();
  }

  sub_1890D51E0(v2 + 16, (uint64_t)&v12);
  uint64_t result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    __int16 v12 = v10;
    uint64_t v13 = v11;
    sub_1890D058C();
    goto LABEL_5;
  }

  __break(1u);
  return result;
}

uint64_t OnDiskCodeRequirement.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7687A0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890DACEC();
  sub_1890F18C0();
  if (!v2)
  {
    sub_1890D0374();
    sub_1890F1728();
    __int128 v32 = a2;
    char v9 = v24;
    char v10 = BYTE1(v24);
    uint64_t v11 = *((void *)&v24 + 1);
    *((void *)&v26 + 1) = &type metadata for OnDiskConstraintConjunction;
    unint64_t v12 = sub_1890CFCA0();
    LOBYTE(v25) = v9;
    BYTE1(v25) = v10;
    unint64_t v27 = v12;
    *((void *)&v25 + 1) = v11;
    v21[0] = v9;
    v21[1] = v10;
    __int128 v23 = &type metadata for OnDiskConstraintConjunction;
    uint64_t v22 = v11;
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_1890D5BF4( (uint64_t)v21,  (uint64_t)&type metadata for OnDiskConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C875C,  (uint64_t)&type metadata for OnDiskConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8738);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    uint64_t v14 = sub_1890D5E54(0LL, v13);
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    *(void *)&__int128 v24 = v14;
    *((void *)&v24 + 1) = v16;
    unint64_t v31 = v27;
    __int128 v29 = v25;
    __int128 v30 = v26;
    __int128 v28 = v24;
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    __int128 v17 = v29;
    uint64_t v18 = v32;
    _OWORD *v32 = v28;
    v18[1] = v17;
    v18[2] = v30;
    *((void *)v18 + 6) = v31;
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void OnDiskCodeRequirement.init(_:)(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v30[5] = *MEMORY[0x1895F89C0];
  uint64_t v7 = (void *)objc_opt_self();
  uint64_t v8 = (void *)sub_1890F1560();
  *(void *)&__int128 v26 = 0LL;
  id v9 = objc_msgSend(v7, sel_withData_withError_, v8, &v26);

  if (!v9)
  {
    id v12 = (id)v26;
    sub_1890F1554();

    swift_willThrow();
    sub_1890D74E0(a1, a2);
    return;
  }

  id v10 = (id)v26;
  if (!objc_msgSend(v9, sel_hasRequirements))
  {
    sub_1890D25E0();
    swift_allocError();
    *uint64_t v13 = 1;
    swift_willThrow();
    sub_1890D74E0(a1, a2);

    return;
  }

  uint64_t v11 = sub_1890D5A9C();
  sub_1890DDFDC(v11, v30);
  if (v3)
  {
    sub_1890D74E0(a1, a2);
    swift_bridgeObjectRelease();

    return;
  }

  swift_bridgeObjectRelease();
  sub_1890D51E0((uint64_t)v30, (uint64_t)&v26);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768648);
  if ((swift_dynamicCast() & 1) != 0)
  {
    *((void *)&v28 + 1) = &type metadata for OnDiskConstraintConjunction;
    unint64_t v14 = sub_1890CFCA0();
    LOWORD(v27) = v23;
    unint64_t v29 = v14;
    *((void *)&v27 + 1) = v24;
    __int128 v25 = &type metadata for OnDiskConstraintConjunction;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_1890D5BF4( (uint64_t)&v23,  (uint64_t)&type metadata for OnDiskConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C875C,  (uint64_t)&type metadata for OnDiskConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8738);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
LABEL_12:
    uint64_t v18 = sub_1890D5E54(0LL, v15);
    uint64_t v20 = v19;
    swift_bridgeObjectRelease();
    *(void *)&__int128 v26 = v18;
    *((void *)&v26 + 1) = v20;
    __int128 v21 = v28;
    *(void *)(a3 + 48) = v29;
    __int128 v22 = v26;
    *(_OWORD *)(a3 + 16) = v27;
    *(_OWORD *)(a3 + 32) = v21;
    *(_OWORD *)a3 = v22;
    goto LABEL_13;
  }

  sub_1890D51E0((uint64_t)v30, (uint64_t)&v26);
  if ((swift_dynamicCast() & 1) != 0)
  {
    *((void *)&v28 + 1) = &type metadata for OnDiskConstraintDisjunction;
    unint64_t v16 = sub_1890CFE20();
    LOWORD(v27) = v23;
    unint64_t v29 = v16;
    *((void *)&v27 + 1) = v24;
    __int128 v25 = &type metadata for OnDiskConstraintDisjunction;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_1890D5BF4( (uint64_t)&v23,  (uint64_t)&type metadata for OnDiskConstraintConjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C875C,  (uint64_t)&type metadata for OnDiskConstraintDisjunction,  (void (*)(_OWORD *__return_ptr, void, void))sub_1890C8738);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
    goto LABEL_12;
  }

  sub_1890D25E0();
  swift_allocError();
  *__int128 v17 = 1;
  swift_willThrow();
LABEL_13:

  sub_1890D74E0(a1, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
}

uint64_t sub_1890DA2C4@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return OnDiskCodeRequirement.init(from:)(a1, a2);
}

uint64_t sub_1890DA2D8(void *a1)
{
  return OnDiskCodeRequirement.encode(to:)(a1);
}

void sub_1890DA2F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }

uint64_t sub_1890DA354( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20, char a21, char a22, char a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37)
{
  uint64_t v42 = v39;
  __int16 v43 = v40;
  char v44 = BYTE2(v40);
  char v45 = BYTE3(v40);
  char v46 = BYTE4(v40);
  char v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x1890DA538LL);
  }

  uint64_t result = memcmp(v38, &v42, BYTE6(v40));
  *char v37 = (_DWORD)result == 0;
  return result;
}

void sub_1890DA55C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

uint64_t sub_1890DA5B8()
{
  uint64_t v8 = v3;
  __int16 v9 = v4;
  char v10 = BYTE2(v4);
  char v11 = BYTE3(v4);
  char v12 = BYTE4(v4);
  char v13 = BYTE5(v4);
  sub_1890DA2F4((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_1890D74E0(v1, v0);
  if (!v2) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_1890DA780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = sub_1890F1530();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_1890F1548();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }

    v11 += a1 - result;
  }

  BOOL v12 = __OFSUB__(a2, a1);
  uint64_t v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v14 = sub_1890F153C();
  if (v14 >= v13) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v14;
  }
  uint64_t v16 = v11 + v15;
  if (v11) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0LL;
  }
  sub_1890DA2F4(v11, v17, a4, a5);
  if (!v5) {
    char v18 = v19;
  }
  return v18 & 1;
}

void _s27LightweightCodeRequirements06LaunchB11RequirementV2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X11 }

uint64_t sub_1890DA870()
{
  return ((uint64_t (*)(void))((char *)&loc_1890DA8A4 + dword_1890DA964[v0 >> 62]))();
}

uint64_t sub_1890DA8B4@<X0>(uint64_t a1@<X8>)
{
  if (a1 == BYTE6(v4))
  {
    if (a1 < 1)
    {
      char v5 = 1;
    }

    else
    {
      sub_1890D52D8(v3, v4);
      sub_1890DA55C(v1, v2);
    }
  }

  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

void _s27LightweightCodeRequirements06OnDiskB11RequirementV2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X11 }

uint64_t sub_1890DA9B0()
{
  return ((uint64_t (*)(void))((char *)&loc_1890DA9E4 + dword_1890DAAA4[v0 >> 62]))();
}

uint64_t sub_1890DA9F4@<X0>(uint64_t a1@<X8>)
{
  if (a1 == BYTE6(v4))
  {
    if (a1 < 1)
    {
      char v5 = 1;
    }

    else
    {
      sub_1890D52D8(v3, v4);
      sub_1890DA55C(v1, v2);
    }
  }

  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

void _s27LightweightCodeRequirements07ProcessB11RequirementV2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X11 }

uint64_t sub_1890DAAF0()
{
  return ((uint64_t (*)(void))((char *)&loc_1890DAB24 + dword_1890DABE4[v0 >> 62]))();
}

uint64_t sub_1890DAB34@<X0>(uint64_t a1@<X8>)
{
  if (a1 == BYTE6(v4))
  {
    if (a1 < 1)
    {
      char v5 = 1;
    }

    else
    {
      sub_1890D52D8(v3, v4);
      sub_1890DA55C(v1, v2);
    }
  }

  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

uint64_t sub_1890DABF4(uint64_t a1)
{
  return a1;
}

unint64_t sub_1890DAC20()
{
  unint64_t result = qword_18C768770;
  if (!qword_18C768770)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2F74, &type metadata for LaunchCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768770);
  }

  return result;
}

unint64_t sub_1890DAC64()
{
  unint64_t result = qword_18C768778;
  if (!qword_18C768778)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ConstraintCategory,  &type metadata for ConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_18C768778);
  }

  return result;
}

unint64_t sub_1890DACA8()
{
  unint64_t result = qword_18C768788;
  if (!qword_18C768788)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ConstraintCategory,  &type metadata for ConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_18C768788);
  }

  return result;
}

unint64_t sub_1890DACEC()
{
  unint64_t result = qword_18C768798;
  if (!qword_18C768798)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2F24, &type metadata for OnDiskCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768798);
  }

  return result;
}

unint64_t sub_1890DAD34()
{
  unint64_t result = qword_18C7687A8;
  if (!qword_18C7687A8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F1F54, &type metadata for ProcessConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_18C7687A8);
  }

  return result;
}

unint64_t sub_1890DAD7C()
{
  unint64_t result = qword_18C7687B0;
  if (!qword_18C7687B0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F1F38, &type metadata for ProcessConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_18C7687B0);
  }

  return result;
}

unint64_t sub_1890DADC4()
{
  unint64_t result = qword_18C7687E8;
  if (!qword_18C7687E8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F1F1C, &type metadata for LaunchConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_18C7687E8);
  }

  return result;
}

unint64_t sub_1890DAE0C()
{
  unint64_t result = qword_18C7687F0;
  if (!qword_18C7687F0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F1F00, &type metadata for LaunchConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_18C7687F0);
  }

  return result;
}

unint64_t sub_1890DAE54()
{
  unint64_t result = qword_18C768828;
  if (!qword_18C768828)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F1EE4, &type metadata for OnDiskConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_18C768828);
  }

  return result;
}

unint64_t sub_1890DAE9C()
{
  unint64_t result = qword_18C768830;
  if (!qword_18C768830)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F1EC8, &type metadata for OnDiskConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_18C768830);
  }

  return result;
}

uint64_t destroy for ProcessCodeRequirement(uint64_t a1)
{
  return sub_1890D74E0(*(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t initializeWithCopy for ProcessCodeRequirement(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v6 = *(void *)(a2 + 40);
  unint64_t v5 = *(void *)(a2 + 48);
  sub_1890D52D8(v6, v5);
  *(void *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = v5;
  return a1;
}

uint64_t *assignWithCopy for ProcessCodeRequirement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v5 = a2[5];
  unint64_t v4 = a2[6];
  sub_1890D52D8(v5, v4);
  uint64_t v6 = a1[5];
  unint64_t v7 = a1[6];
  a1[5] = v5;
  a1[6] = v4;
  sub_1890D74E0(v6, v7);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v9 = *(void *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        uint64_t v10 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v10;
      }

      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }

    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      int v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          void *result = *a2;
          swift_retain();
        }

        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }

        return (uint64_t *)swift_release();
      }

      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }

        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }

        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }

  return result;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ProcessCodeRequirement(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  unint64_t v6 = *(void *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  sub_1890D74E0(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProcessCodeRequirement(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ProcessCodeRequirement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 56) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ProcessCodeRequirement()
{
  return &type metadata for ProcessCodeRequirement;
}

uint64_t initializeBufferWithCopyOfBuffer for LaunchCodeRequirement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for LaunchCodeRequirement(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1 + 24);
}

uint64_t initializeWithCopy for LaunchCodeRequirement(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  sub_1890D52D8(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  __int128 v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 48) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 24, a2 + 24);
  return a1;
}

uint64_t *assignWithCopy for LaunchCodeRequirement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_1890D52D8(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_1890D74E0(v6, v7);
  a1[2] = a2[2];
  __swift_assign_boxed_opaque_existential_1(a1 + 3, a2 + 3);
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for LaunchCodeRequirement(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_1890D74E0(v4, v5);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 24);
  *(_OWORD *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for LaunchCodeRequirement(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LaunchCodeRequirement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0LL;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 64) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for LaunchCodeRequirement()
{
  return &type metadata for LaunchCodeRequirement;
}

uint64_t destroy for OnDiskCodeRequirement(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1 + 16);
}

uint64_t initializeWithCopy for OnDiskCodeRequirement(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  sub_1890D52D8(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  __int128 v6 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 16, a2 + 16);
  return a1;
}

uint64_t *assignWithCopy for OnDiskCodeRequirement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_1890D52D8(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_1890D74E0(v6, v7);
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  return a1;
}

uint64_t assignWithTake for OnDiskCodeRequirement(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_1890D74E0(v4, v5);
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  __int128 v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for OnDiskCodeRequirement(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OnDiskCodeRequirement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 56) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for OnDiskCodeRequirement()
{
  return &type metadata for OnDiskCodeRequirement;
}

uint64_t sub_1890DB63C()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for OnDiskCodeRequirement.CodingKeys()
{
  return &type metadata for OnDiskCodeRequirement.CodingKeys;
}

uint64_t getEnumTagSinglePayload for LaunchCodeRequirement.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

uint64_t storeEnumTagSinglePayload for LaunchCodeRequirement.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_1890DB730 + 4 * byte_1890F29C5[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1890DB764 + 4 * byte_1890F29C0[v4]))();
}

uint64_t sub_1890DB764(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1890DB76C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1890DB774LL);
  }
  return result;
}

uint64_t sub_1890DB780(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1890DB788LL);
  }
  *(_BYTE *)__n128 result = a2 + 1;
  return result;
}

uint64_t sub_1890DB78C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1890DB794(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1890DB7A0(_BYTE *result, char a2)
{
  void *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LaunchCodeRequirement.CodingKeys()
{
  return &type metadata for LaunchCodeRequirement.CodingKeys;
}

uint64_t _s27LightweightCodeRequirements21OnDiskCodeRequirementV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t _s27LightweightCodeRequirements21OnDiskCodeRequirementV10CodingKeysOwst_0( uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1890DB84C + 4 * byte_1890F29CA[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1890DB86C + 4 * byte_1890F29CF[v4]))();
  }
}

_BYTE *sub_1890DB84C(_BYTE *result, char a2)
{
  void *result = a2;
  return result;
}

_BYTE *sub_1890DB86C(_BYTE *result)
{
  void *result = 0;
  return result;
}

_DWORD *sub_1890DB874(_DWORD *result, int a2)
{
  void *result = a2;
  return result;
}

_WORD *sub_1890DB87C(_WORD *result, __int16 a2)
{
  void *result = a2;
  return result;
}

_WORD *sub_1890DB884(_WORD *result)
{
  void *result = 0;
  return result;
}

_DWORD *sub_1890DB88C(_DWORD *result)
{
  void *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ProcessCodeRequirement.CodingKeys()
{
  return &type metadata for ProcessCodeRequirement.CodingKeys;
}

unint64_t sub_1890DB8AC()
{
  unint64_t result = qword_18C768868;
  if (!qword_18C768868)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2D1C, &type metadata for ProcessCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768868);
  }

  return result;
}

unint64_t sub_1890DB8F4()
{
  unint64_t result = qword_18C768870;
  if (!qword_18C768870)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2E0C, &type metadata for LaunchCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768870);
  }

  return result;
}

unint64_t sub_1890DB93C()
{
  unint64_t result = qword_18C768878;
  if (!qword_18C768878)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2EFC, &type metadata for OnDiskCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768878);
  }

  return result;
}

unint64_t sub_1890DB984()
{
  unint64_t result = qword_18C768880;
  if (!qword_18C768880)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2E34, &type metadata for OnDiskCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768880);
  }

  return result;
}

unint64_t sub_1890DB9CC()
{
  unint64_t result = qword_18C768888;
  if (!qword_18C768888)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2E5C, &type metadata for OnDiskCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768888);
  }

  return result;
}

unint64_t sub_1890DBA14()
{
  unint64_t result = qword_18C768890;
  if (!qword_18C768890)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2D44, &type metadata for LaunchCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768890);
  }

  return result;
}

unint64_t sub_1890DBA5C()
{
  unint64_t result = qword_18C768898;
  if (!qword_18C768898)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2D6C, &type metadata for LaunchCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768898);
  }

  return result;
}

unint64_t sub_1890DBAA4()
{
  unint64_t result = qword_18C7688A0;
  if (!qword_18C7688A0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2C54, &type metadata for ProcessCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7688A0);
  }

  return result;
}

unint64_t sub_1890DBAEC()
{
  unint64_t result = qword_18C7688A8;
  if (!qword_18C7688A8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F2C7C, &type metadata for ProcessCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7688A8);
  }

  return result;
}

uint64_t sub_1890DBB30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_1890DBB6C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1890DBB84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1890EF154(a1);
  if ((v6 & 1) != 0) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v5)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }

  if (result == 1LL << *(_BYTE *)(a1 + 32))
  {
    *(void *)(a2 + 48) = 0LL;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
  }

  else
  {
    v8[0] = sub_1890EF1DC((uint64_t)v9, result, v5, 0LL, a1);
    v8[1] = v7;
    *(void *)a2 = v8[0];
    *(void *)(a2 + 8) = v7;
    sub_1890D51E0((uint64_t)v9, a2 + 16);
    swift_bridgeObjectRetain();
    return sub_1890EF610((uint64_t)v8);
  }

  return result;
}

void *sub_1890DBC48(uint64_t a1)
{
  uint64_t result = (void *)sub_1890EF154(a1);
  if ((v4 & 1) != 0) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }

  if (result == (void *)(1LL << *(_BYTE *)(a1 + 32))) {
    return 0LL;
  }
  else {
    return sub_1890EF26C(&v5, (uint64_t)result, v3, 0LL, a1);
  }
}

uint64_t sub_1890DBCD0( uint64_t a1, void (*a2)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *), uint64_t *a3, uint64_t *a4, void (*a5)(unint64_t, char *, void **, uint64_t, uint64_t))
{
  void (*v56)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *);
  void v57[3];
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  _OWORD v61[2];
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v55 = a5;
  unint64_t v50 = a3;
  uint64_t v56 = a2;
  v68 = (void *)MEMORY[0x18961AFE8];
  sub_1890D51E0(a1, (uint64_t)&v63);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
  uint64_t result = swift_dynamicCast();
  if (!(_DWORD)result)
  {
    sub_1890D51E0(a1, (uint64_t)&v63);
    uint64_t v54 = (__int128 *)__swift_instantiateConcreteTypeFromMangledName(&qword_18C768600);
    if ((swift_dynamicCast() & 1) != 0)
    {
      uint64_t v49 = a4;
      uint64_t v34 = *(void *)(v60 + 16);
      if (v34)
      {
        uint64_t v53 = (_OWORD *)v60;
        uint64_t v35 = v60 + 32;
        while (1)
        {
          sub_1890D51E0(v35, (uint64_t)&v63);
          uint64_t v36 = v60;
          if (*(void *)(v60 + 16) != 2LL
            || (sub_1890D51E0(v60 + 32, (uint64_t)&v63), uint64_t result = swift_dynamicCast(), (result & 1) == 0))
          {
            swift_bridgeObjectRelease();
LABEL_54:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_1890D25E0();
            swift_allocError();
            *char v47 = 1;
            return swift_willThrow();
          }

          if (*(void *)(v36 + 16) < 2uLL) {
            goto LABEL_59;
          }
          __int128 v37 = v60;
          sub_1890D51E0(v36 + 72, (uint64_t)&v60);
          swift_bridgeObjectRelease();
          v56(&v63, v37, *((void *)&v37 + 1), &v60);
          if (v5) {
            break;
          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
          swift_bridgeObjectRelease();
          uint64_t v38 = v68;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            uint64_t v38 = sub_1890EA8B4(0LL, v38[2] + 1LL, 1, v38, v50, v49);
            v68 = v38;
          }

          unint64_t v40 = v38[2];
          unint64_t v39 = v38[3];
          if (v40 >= v39 >> 1) {
            v68 = sub_1890EA8B4((void *)(v39 > 1), v40 + 1, 1, v38, v50, v49);
          }
          uint64_t v41 = v66;
          uint64_t v42 = v67;
          uint64_t v43 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v63, v66);
          MEMORY[0x1895F8858](v43);
          char v45 = (char *)&v48 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          (*(void (**)(char *))(v46 + 16))(v45);
          v55(v40, v45, &v68, v41, v42);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v63);
          v35 += 40LL;
          if (!--v34) {
            goto LABEL_56;
          }
        }

        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }

LABEL_56:
      swift_bridgeObjectRelease();
    }

    return (uint64_t)v68;
  }

  uint64_t v49 = a4;
  int64_t v9 = 0LL;
  uint64_t v10 = v60;
  uint64_t v11 = *(void *)(v60 + 64);
  uint64_t v51 = v60 + 64;
  uint64_t v12 = 1LL << *(_BYTE *)(v60 + 32);
  uint64_t v13 = -1LL;
  if (v12 < 64) {
    uint64_t v13 = ~(-1LL << v12);
  }
  unint64_t v14 = v13 & v11;
  uint64_t v53 = v61;
  uint64_t v54 = (__int128 *)&v65;
  int64_t v52 = (unint64_t)(v12 + 63) >> 6;
  int64_t v48 = v52 - 1;
  if ((v13 & v11) == 0) {
    goto LABEL_7;
  }
LABEL_5:
  unint64_t v15 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  unint64_t v16 = v15 | (v9 << 6);
LABEL_6:
  uint64_t v17 = *(void *)(v10 + 56);
  char v18 = (void *)(*(void *)(v10 + 48) + 16 * v16);
  uint64_t v19 = v18[1];
  *(void *)&__int128 v60 = *v18;
  *((void *)&v60 + 1) = v19;
  sub_1890D51E0(v17 + 40 * v16, (uint64_t)v53);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_1890D5100((uint64_t)&v60, (uint64_t)&v63);
    uint64_t v22 = v64;
    if (!v64)
    {
      swift_release();
      return (uint64_t)v68;
    }

    uint64_t v23 = v63;
    sub_1890D2660(v54, (uint64_t)&v60);
    v56(v57, v23, v22, &v60);
    swift_bridgeObjectRelease();
    if (v5)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
      swift_release();
      return swift_bridgeObjectRelease();
    }

    uint64_t v24 = v68;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v24 = sub_1890EA8B4(0LL, v24[2] + 1LL, 1, v24, v50, v49);
      v68 = v24;
    }

    unint64_t v26 = v24[2];
    unint64_t v25 = v24[3];
    if (v26 >= v25 >> 1) {
      v68 = sub_1890EA8B4((void *)(v25 > 1), v26 + 1, 1, v24, v50, v49);
    }
    uint64_t v27 = v58;
    uint64_t v28 = v59;
    uint64_t v29 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v57, v58);
    MEMORY[0x1895F8858](v29);
    unint64_t v31 = (char *)&v48 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v32 + 16))(v31);
    v55(v26, v31, &v68, v27, v28);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
    if (v14) {
      goto LABEL_5;
    }
LABEL_7:
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1LL)) {
      break;
    }
    if (v20 < v52)
    {
      unint64_t v21 = *(void *)(v51 + 8 * v20);
      if (v21) {
        goto LABEL_10;
      }
      v9 += 2LL;
      if (v20 + 1 >= v52)
      {
        int64_t v9 = v20;
      }

      else
      {
        unint64_t v21 = *(void *)(v51 + 8 * v9);
        if (v21)
        {
          ++v20;
          goto LABEL_10;
        }

        if (v20 + 2 < v52)
        {
          unint64_t v21 = *(void *)(v51 + 8 * (v20 + 2));
          if (v21)
          {
            v20 += 2LL;
            goto LABEL_10;
          }

          int64_t v33 = v20 + 3;
          if (v20 + 3 < v52)
          {
            unint64_t v21 = *(void *)(v51 + 8 * v33);
            if (!v21)
            {
              while (1)
              {
                int64_t v20 = v33 + 1;
                if (__OFADD__(v33, 1LL)) {
                  goto LABEL_60;
                }
                if (v20 >= v52)
                {
                  int64_t v9 = v48;
                  goto LABEL_15;
                }

                unint64_t v21 = *(void *)(v51 + 8 * v20);
                ++v33;
                if (v21) {
                  goto LABEL_10;
                }
              }
            }

            v20 += 3LL;
LABEL_10:
            unint64_t v14 = (v21 - 1) & v21;
            unint64_t v16 = __clz(__rbit64(v21)) + (v20 << 6);
            int64_t v9 = v20;
            goto LABEL_6;
          }

          int64_t v9 = v20 + 2;
        }
      }
    }

LABEL_15:
    unint64_t v14 = 0LL;
    unint64_t v62 = 0LL;
    memset(v61, 0, sizeof(v61));
    __int128 v60 = 0u;
  }

  __break(1u);
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
  return result;
}

unint64_t sub_1890DC3B8@<X0>(uint64_t a1@<X2>, void *a2@<X8>)
{
  switch(sub_1890F10FC())
  {
    case 0u:
      unint64_t result = sub_1890EA0A0(a1);
      if (!v2)
      {
        char v11 = result;
        a2[3] = &type metadata for AppleInternal;
        a2[4] = sub_1890D2F60();
        unint64_t result = swift_allocObject();
        *a2 = result;
        *(_BYTE *)(result + 16) = 0;
        goto LABEL_35;
      }

      return result;
    case 1u:
      sub_1890D51E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for CodeDirectoryHash;
      a2[4] = sub_1890D2F1C();
      uint64_t v12 = swift_allocObject();
      uint64_t v13 = v12 + 16;
      *a2 = v12;
      char v14 = 1;
      goto LABEL_16;
    case 2u:
      sub_1890D51E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for ProcessCodeSigningFlags;
      a2[4] = sub_1890D2ED8();
      uint64_t v15 = swift_allocObject();
      *a2 = v15;
      unint64_t result = sub_1890E15FC((uint64_t)v25, v15 + 16);
      goto LABEL_37;
    case 3u:
      unint64_t result = sub_1890EA0A0(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for DeveloperMode;
      a2[4] = sub_1890D2E94();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 3;
      goto LABEL_34;
    case 4u:
      sub_1890D51E0(a1, (uint64_t)v25);
      unint64_t result = sub_1890EF300((uint64_t)v25);
      if (!v2)
      {
        unint64_t v17 = result;
        a2[3] = type metadata accessor for EntitlementsQuery();
        unint64_t result = sub_1890EF698(&qword_18C7683D0, (uint64_t)&protocol conformance descriptor for EntitlementsQuery);
        a2[4] = result;
        *a2 = v17;
      }

      return result;
    case 5u:
      sub_1890D51E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for InfoPlistHash;
      a2[4] = sub_1890D2E50();
      uint64_t v18 = swift_allocObject();
      uint64_t v13 = v18 + 16;
      *a2 = v18;
      char v14 = 5;
LABEL_16:
      unint64_t result = sub_1890E3F54((uint64_t)v25, v14, v13);
      goto LABEL_37;
    case 6u:
      unint64_t result = sub_1890EA0A0(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for InTrustCacheWithConstraintCategory;
      a2[4] = sub_1890D2E0C();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 6;
      goto LABEL_34;
    case 7u:
      unint64_t result = sub_1890EA0A0(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for IsInitProcess;
      a2[4] = sub_1890D2DC8();
      unint64_t result = swift_allocObject();
      *a2 = result;
      *(_BYTE *)(result + 16) = 7;
      goto LABEL_35;
    case 9u:
      unint64_t result = sub_1890EA0A0(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for IsSIPProtected;
      a2[4] = sub_1890D2D84();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 9;
      goto LABEL_34;
    case 0xBu:
      unint64_t result = sub_1890EA0A0(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for OnAuthorizedAuthAPFSVolume;
      a2[4] = sub_1890D2D40();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 11;
      goto LABEL_34;
    case 0xCu:
      unint64_t result = sub_1890EA0A0(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for OnSystemVolume;
      a2[4] = sub_1890D2CFC();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 12;
      goto LABEL_34;
    case 0xDu:
      sub_1890D51E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for OSEnvironment;
      a2[4] = sub_1890D2CB8();
      uint64_t v19 = swift_allocObject();
      *a2 = v19;
      unint64_t result = sub_1890E89AC((uint64_t)v25, 13, v19 + 16);
      goto LABEL_37;
    case 0xEu:
      sub_1890D51E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for PlatformIdentifier;
      a2[4] = sub_1890D2C30();
      uint64_t v20 = swift_allocObject();
      *a2 = v20;
      unint64_t result = sub_1890E7B10((uint64_t)v25, v20 + 16);
      goto LABEL_37;
    case 0xFu:
      sub_1890D51E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for PlatformType;
      a2[4] = sub_1890D2C74();
      uint64_t v21 = swift_allocObject();
      *a2 = v21;
      unint64_t result = sub_1890E6E78((uint64_t)v25, v21 + 16);
      goto LABEL_37;
    case 0x10u:
      sub_1890D51E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for SigningIdentifier;
      a2[4] = sub_1890D2BEC();
      uint64_t v22 = swift_allocObject();
      *a2 = v22;
      unint64_t result = sub_1890E89AC((uint64_t)v25, 16, v22 + 16);
      goto LABEL_37;
    case 0x11u:
      sub_1890D51E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for TeamIdentifier;
      a2[4] = sub_1890D2BA8();
      uint64_t v23 = swift_allocObject();
      *a2 = v23;
      unint64_t result = sub_1890E89AC((uint64_t)v25, 17, v23 + 16);
      goto LABEL_37;
    case 0x12u:
      unint64_t result = sub_1890EA0A0(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for TeamIdentifierMatchesCurrentProcess;
      a2[4] = sub_1890D2B64();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 18;
LABEL_34:
      *(_BYTE *)(result + 16) = v16;
LABEL_35:
      *(void *)(result + 48) = MEMORY[0x1896184C8];
      *(void *)(result + 56) = &off_18A3472C0;
      *(_BYTE *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v11 & 1;
      return result;
    case 0x13u:
      sub_1890D51E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for ValidationCategory;
      a2[4] = sub_1890D2AFC();
      uint64_t v24 = swift_allocObject();
      *a2 = v24;
      unint64_t result = sub_1890E9C28((uint64_t)v25, v24 + 16);
LABEL_37:
      if (v2) {
        return __swift_deallocate_boxed_opaque_existential_1((uint64_t)a2);
      }
      return result;
    case 0x14u:
    case 0x15u:
      sub_1890D51E0(a1, (uint64_t)v25);
      uint64_t v5 = sub_1890DBCD0( (uint64_t)v25,  (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *))sub_1890DC3B8,  &qword_18C7688D0,  &qword_18C768630,  (void (*)(unint64_t, char *, void **, uint64_t, uint64_t))sub_1890D198C);
      if (v2) {
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      }
      uint64_t v6 = v5;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      a2[3] = &type metadata for ProcessConstraintConjunction;
      unint64_t result = sub_1890CFBE0();
      a2[4] = result;
      __int16 v8 = 5141;
      goto LABEL_40;
    case 0x1Cu:
    case 0x1Du:
      sub_1890D51E0(a1, (uint64_t)v25);
      uint64_t v9 = sub_1890DBCD0( (uint64_t)v25,  (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *))sub_1890DC3B8,  &qword_18C7688D0,  &qword_18C768630,  (void (*)(unint64_t, char *, void **, uint64_t, uint64_t))sub_1890D198C);
      if (v2) {
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      }
      uint64_t v6 = v9;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      a2[3] = &type metadata for ProcessConstraintDisjunction;
      unint64_t result = sub_1890CFD00();
      a2[4] = result;
      __int16 v8 = 7197;
LABEL_40:
      *(_WORD *)a2 = v8;
      a2[1] = v6;
      return result;
    default:
      sub_1890D25E0();
      swift_allocError();
      *uint64_t v10 = 1;
      return swift_willThrow();
  }

unint64_t sub_1890DCAE4@<X0>(uint64_t a1@<X2>, void *a2@<X8>)
{
  switch(sub_1890F10FC())
  {
    case 0u:
      unint64_t result = sub_1890EA0A0(a1);
      if (!v2)
      {
        char v11 = result;
        a2[3] = &type metadata for AppleInternal;
        a2[4] = sub_1890D41C4();
        unint64_t result = swift_allocObject();
        *a2 = result;
        *(_BYTE *)(result + 16) = 0;
        goto LABEL_29;
      }

      return result;
    case 1u:
      sub_1890D51E0(a1, (uint64_t)v26);
      a2[3] = &type metadata for CodeDirectoryHash;
      a2[4] = sub_1890D4180();
      uint64_t v12 = swift_allocObject();
      uint64_t v13 = v12 + 16;
      *a2 = v12;
      char v14 = 1;
      goto LABEL_16;
    case 2u:
      sub_1890D51E0(a1, (uint64_t)v26);
      a2[3] = &type metadata for ProcessCodeSigningFlags;
      a2[4] = sub_1890D413C();
      uint64_t v15 = swift_allocObject();
      *a2 = v15;
      unint64_t result = sub_1890E15FC((uint64_t)v26, v15 + 16);
      goto LABEL_36;
    case 3u:
      unint64_t result = sub_1890EA0A0(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for DeveloperMode;
      a2[4] = sub_1890D40F8();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 3;
      goto LABEL_28;
    case 4u:
      sub_1890D51E0(a1, (uint64_t)v26);
      unint64_t result = sub_1890EF300((uint64_t)v26);
      if (!v2)
      {
        unint64_t v17 = result;
        a2[3] = type metadata accessor for EntitlementsQuery();
        unint64_t result = sub_1890EF698(&qword_18C7684A0, (uint64_t)&protocol conformance descriptor for EntitlementsQuery);
        a2[4] = result;
        *a2 = v17;
      }

      return result;
    case 5u:
      sub_1890D51E0(a1, (uint64_t)v26);
      a2[3] = &type metadata for InfoPlistHash;
      a2[4] = sub_1890D40B4();
      uint64_t v18 = swift_allocObject();
      uint64_t v13 = v18 + 16;
      *a2 = v18;
      char v14 = 5;
LABEL_16:
      unint64_t result = sub_1890E3F54((uint64_t)v26, v14, v13);
      goto LABEL_36;
    case 6u:
      unint64_t result = sub_1890EA0A0(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for InTrustCacheWithConstraintCategory;
      a2[4] = sub_1890D4070();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 6;
      goto LABEL_28;
    case 7u:
      unint64_t result = sub_1890EA0A0(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for IsInitProcess;
      a2[4] = sub_1890D402C();
      unint64_t result = swift_allocObject();
      *a2 = result;
      *(_BYTE *)(result + 16) = 7;
      goto LABEL_29;
    case 9u:
      unint64_t result = sub_1890EA0A0(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for IsSIPProtected;
      a2[4] = sub_1890D3FE8();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 9;
      goto LABEL_28;
    case 0xAu:
      sub_1890D51E0(a1, (uint64_t)v26);
      a2[3] = &type metadata for LaunchType;
      a2[4] = sub_1890D3FA4();
      uint64_t v19 = swift_allocObject();
      *a2 = v19;
      unint64_t result = sub_1890E57BC((uint64_t)v26, v19 + 16);
      goto LABEL_36;
    case 0xBu:
      unint64_t result = sub_1890EA0A0(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for OnAuthorizedAuthAPFSVolume;
      a2[4] = sub_1890D3F60();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 11;
      goto LABEL_28;
    case 0xCu:
      unint64_t result = sub_1890EA0A0(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for OnSystemVolume;
      a2[4] = sub_1890D3F1C();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 12;
LABEL_28:
      *(_BYTE *)(result + 16) = v16;
LABEL_29:
      *(void *)(result + 48) = MEMORY[0x1896184C8];
      *(void *)(result + 56) = &off_18A3472C0;
      *(_BYTE *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v11 & 1;
      return result;
    case 0xDu:
      sub_1890D51E0(a1, (uint64_t)v26);
      a2[3] = &type metadata for OSEnvironment;
      a2[4] = sub_1890D3ED8();
      uint64_t v20 = swift_allocObject();
      *a2 = v20;
      unint64_t result = sub_1890E89AC((uint64_t)v26, 13, v20 + 16);
      goto LABEL_36;
    case 0xEu:
      sub_1890D51E0(a1, (uint64_t)v26);
      a2[3] = &type metadata for PlatformIdentifier;
      a2[4] = sub_1890D3E50();
      uint64_t v21 = swift_allocObject();
      *a2 = v21;
      unint64_t result = sub_1890E7B10((uint64_t)v26, v21 + 16);
      goto LABEL_36;
    case 0xFu:
      sub_1890D51E0(a1, (uint64_t)v26);
      a2[3] = &type metadata for PlatformType;
      a2[4] = sub_1890D3E94();
      uint64_t v22 = swift_allocObject();
      *a2 = v22;
      unint64_t result = sub_1890E6E78((uint64_t)v26, v22 + 16);
      goto LABEL_36;
    case 0x10u:
      sub_1890D51E0(a1, (uint64_t)v26);
      a2[3] = &type metadata for SigningIdentifier;
      a2[4] = sub_1890D3E0C();
      uint64_t v23 = swift_allocObject();
      *a2 = v23;
      unint64_t result = sub_1890E89AC((uint64_t)v26, 16, v23 + 16);
      goto LABEL_36;
    case 0x11u:
      sub_1890D51E0(a1, (uint64_t)v26);
      a2[3] = &type metadata for TeamIdentifier;
      a2[4] = sub_1890D3DC8();
      uint64_t v24 = swift_allocObject();
      *a2 = v24;
      unint64_t result = sub_1890E89AC((uint64_t)v26, 17, v24 + 16);
      goto LABEL_36;
    case 0x13u:
      sub_1890D51E0(a1, (uint64_t)v26);
      a2[3] = &type metadata for ValidationCategory;
      a2[4] = sub_1890D3D84();
      uint64_t v25 = swift_allocObject();
      *a2 = v25;
      unint64_t result = sub_1890E9C28((uint64_t)v26, v25 + 16);
LABEL_36:
      if (v2) {
        return __swift_deallocate_boxed_opaque_existential_1((uint64_t)a2);
      }
      return result;
    case 0x14u:
    case 0x15u:
      sub_1890D51E0(a1, (uint64_t)v26);
      uint64_t v5 = sub_1890DBCD0( (uint64_t)v26,  (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *))sub_1890DCAE4,  &qword_18C7688D8,  &qword_18C768640,  (void (*)(unint64_t, char *, void **, uint64_t, uint64_t))sub_1890D198C);
      if (v2) {
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      }
      uint64_t v6 = v5;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      a2[3] = &type metadata for LaunchConstraintConjunction;
      unint64_t result = sub_1890CFC40();
      a2[4] = result;
      __int16 v8 = 5141;
      goto LABEL_40;
    case 0x1Cu:
    case 0x1Du:
      sub_1890D51E0(a1, (uint64_t)v26);
      uint64_t v9 = sub_1890DBCD0( (uint64_t)v26,  (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *))sub_1890DCAE4,  &qword_18C7688D8,  &qword_18C768640,  (void (*)(unint64_t, char *, void **, uint64_t, uint64_t))sub_1890D198C);
      if (v2) {
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      }
      uint64_t v6 = v9;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      a2[3] = &type metadata for LaunchConstraintDisjunction;
      unint64_t result = sub_1890CFD60();
      a2[4] = result;
      __int16 v8 = 7197;
LABEL_40:
      *(_WORD *)a2 = v8;
      a2[1] = v6;
      return result;
    default:
      sub_1890D25E0();
      swift_allocError();
      *uint64_t v10 = 1;
      return swift_willThrow();
  }

unint64_t sub_1890DD210@<X0>(uint64_t a1@<X2>, void *a2@<X8>)
{
  switch(sub_1890F10FC())
  {
    case 0u:
      unint64_t result = sub_1890EA0A0(a1);
      if (!v2)
      {
        char v11 = result;
        a2[3] = &type metadata for AppleInternal;
        a2[4] = sub_1890D4BD4();
        unint64_t result = swift_allocObject();
        *a2 = result;
        *(_BYTE *)(result + 16) = 0;
        goto LABEL_26;
      }

      return result;
    case 1u:
      sub_1890D51E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for CodeDirectoryHash;
      a2[4] = sub_1890D4B90();
      uint64_t v12 = swift_allocObject();
      uint64_t v13 = v12 + 16;
      *a2 = v12;
      char v14 = 1;
      goto LABEL_16;
    case 2u:
      sub_1890D51E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for OnDiskCodeSigningFlags;
      a2[4] = sub_1890D4B28();
      uint64_t v15 = swift_allocObject();
      *a2 = v15;
      unint64_t result = sub_1890E15FC((uint64_t)v25, v15 + 16);
      goto LABEL_33;
    case 3u:
      unint64_t result = sub_1890EA0A0(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for DeveloperMode;
      a2[4] = sub_1890D4AE4();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 3;
      goto LABEL_25;
    case 4u:
      sub_1890D51E0(a1, (uint64_t)v25);
      unint64_t result = sub_1890EF300((uint64_t)v25);
      if (!v2)
      {
        unint64_t v17 = result;
        a2[3] = type metadata accessor for EntitlementsQuery();
        unint64_t result = sub_1890EF698(&qword_18C768570, (uint64_t)&protocol conformance descriptor for EntitlementsQuery);
        a2[4] = result;
        *a2 = v17;
      }

      return result;
    case 5u:
      sub_1890D51E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for InfoPlistHash;
      a2[4] = sub_1890D4A60();
      uint64_t v18 = swift_allocObject();
      uint64_t v13 = v18 + 16;
      *a2 = v18;
      char v14 = 5;
LABEL_16:
      unint64_t result = sub_1890E3F54((uint64_t)v25, v14, v13);
      goto LABEL_33;
    case 6u:
      unint64_t result = sub_1890EA0A0(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for InTrustCacheWithConstraintCategory;
      a2[4] = sub_1890D4A1C();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 6;
      goto LABEL_25;
    case 9u:
      unint64_t result = sub_1890EA0A0(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for IsSIPProtected;
      a2[4] = sub_1890D4994();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 9;
      goto LABEL_25;
    case 0xBu:
      unint64_t result = sub_1890EA0A0(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for OnAuthorizedAuthAPFSVolume;
      a2[4] = sub_1890D4950();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 11;
      goto LABEL_25;
    case 0xCu:
      unint64_t result = sub_1890EA0A0(a1);
      if (v2) {
        return result;
      }
      char v11 = result;
      a2[3] = &type metadata for OnSystemVolume;
      a2[4] = sub_1890D490C();
      unint64_t result = swift_allocObject();
      *a2 = result;
      char v16 = 12;
LABEL_25:
      *(_BYTE *)(result + 16) = v16;
LABEL_26:
      *(void *)(result + 48) = MEMORY[0x1896184C8];
      *(void *)(result + 56) = &off_18A3472C0;
      *(_BYTE *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v11 & 1;
      return result;
    case 0xDu:
      sub_1890D51E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for OSEnvironment;
      a2[4] = sub_1890D48C8();
      uint64_t v19 = swift_allocObject();
      *a2 = v19;
      unint64_t result = sub_1890E89AC((uint64_t)v25, 13, v19 + 16);
      goto LABEL_33;
    case 0xEu:
      sub_1890D51E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for PlatformIdentifier;
      a2[4] = sub_1890D4840();
      uint64_t v20 = swift_allocObject();
      *a2 = v20;
      unint64_t result = sub_1890E7B10((uint64_t)v25, v20 + 16);
      goto LABEL_33;
    case 0xFu:
      sub_1890D51E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for PlatformType;
      a2[4] = sub_1890D4884();
      uint64_t v21 = swift_allocObject();
      *a2 = v21;
      unint64_t result = sub_1890E6E78((uint64_t)v25, v21 + 16);
      goto LABEL_33;
    case 0x10u:
      sub_1890D51E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for SigningIdentifier;
      a2[4] = sub_1890D47FC();
      uint64_t v22 = swift_allocObject();
      *a2 = v22;
      unint64_t result = sub_1890E89AC((uint64_t)v25, 16, v22 + 16);
      goto LABEL_33;
    case 0x11u:
      sub_1890D51E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for TeamIdentifier;
      a2[4] = sub_1890D47B8();
      uint64_t v23 = swift_allocObject();
      *a2 = v23;
      unint64_t result = sub_1890E89AC((uint64_t)v25, 17, v23 + 16);
      goto LABEL_33;
    case 0x13u:
      sub_1890D51E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for ValidationCategory;
      a2[4] = sub_1890D4774();
      uint64_t v24 = swift_allocObject();
      *a2 = v24;
      unint64_t result = sub_1890E9C28((uint64_t)v25, v24 + 16);
LABEL_33:
      if (v2) {
        return __swift_deallocate_boxed_opaque_existential_1((uint64_t)a2);
      }
      return result;
    case 0x14u:
    case 0x15u:
      sub_1890D51E0(a1, (uint64_t)v25);
      uint64_t v5 = sub_1890DBCD0( (uint64_t)v25,  (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *))sub_1890DD210,  &qword_18C7688E0,  &qword_18C768648,  (void (*)(unint64_t, char *, void **, uint64_t, uint64_t))sub_1890D198C);
      if (v2) {
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      }
      uint64_t v6 = v5;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      a2[3] = &type metadata for OnDiskConstraintConjunction;
      unint64_t result = sub_1890CFCA0();
      a2[4] = result;
      __int16 v8 = 5141;
      goto LABEL_36;
    case 0x1Cu:
    case 0x1Du:
      sub_1890D51E0(a1, (uint64_t)v25);
      uint64_t v9 = sub_1890DBCD0( (uint64_t)v25,  (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *))sub_1890DD210,  &qword_18C7688E0,  &qword_18C768648,  (void (*)(unint64_t, char *, void **, uint64_t, uint64_t))sub_1890D198C);
      if (v2) {
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      }
      uint64_t v6 = v9;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      a2[3] = &type metadata for OnDiskConstraintDisjunction;
      unint64_t result = sub_1890CFE20();
      a2[4] = result;
      __int16 v8 = 7197;
LABEL_36:
      *(_WORD *)a2 = v8;
      a2[1] = v6;
      return result;
    default:
      sub_1890D25E0();
      swift_allocError();
      *uint64_t v10 = 1;
      return swift_willThrow();
  }

uint64_t sub_1890DD8A4(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x79654B7961727261LL;
    }
    else {
      uint64_t v3 = 0x65756C6176LL;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE800000000000000LL;
    }
    else {
      unint64_t v4 = 0xE500000000000000LL;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x79654B7961727261LL;
      }
      else {
        uint64_t v6 = 0x65756C6176LL;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE800000000000000LL;
      }
      else {
        unint64_t v7 = 0xE500000000000000LL;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }

  else
  {
    unint64_t v4 = 0xE300000000000000LL;
    uint64_t v3 = 7955819LL;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }

  unint64_t v7 = 0xE300000000000000LL;
  if (v3 != 7955819)
  {
LABEL_21:
    char v8 = sub_1890F183C();
    goto LABEL_22;
  }

LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1890DD9A4(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x726F74617265706FLL;
    }
    else {
      uint64_t v3 = 0x65756C6176LL;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xEB0000000079654BLL;
    }
    else {
      unint64_t v4 = 0xE500000000000000LL;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x726F74617265706FLL;
      }
      else {
        uint64_t v6 = 0x65756C6176LL;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xEB0000000079654BLL;
      }
      else {
        unint64_t v7 = 0xE500000000000000LL;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }

  else
  {
    unint64_t v4 = 0xE300000000000000LL;
    uint64_t v3 = 7955819LL;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }

  unint64_t v7 = 0xE300000000000000LL;
  if (v3 != 7955819)
  {
LABEL_21:
    char v8 = sub_1890F183C();
    goto LABEL_22;
  }

uint64_t sub_1890DDAB4(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0) {
    uint64_t v3 = 0x65756C6176LL;
  }
  else {
    uint64_t v3 = 7955819LL;
  }
  if (v2) {
    unint64_t v4 = 0xE300000000000000LL;
  }
  else {
    unint64_t v4 = 0xE500000000000000LL;
  }
  if ((a2 & 1) != 0) {
    uint64_t v5 = 0x65756C6176LL;
  }
  else {
    uint64_t v5 = 7955819LL;
  }
  if ((a2 & 1) != 0) {
    unint64_t v6 = 0xE500000000000000LL;
  }
  else {
    unint64_t v6 = 0xE300000000000000LL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1890F183C();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1890DDB4C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0) {
    unint64_t v3 = 0xD000000000000012LL;
  }
  else {
    unint64_t v3 = 0x65756C6176LL;
  }
  if (v2) {
    unint64_t v4 = 0xE500000000000000LL;
  }
  else {
    unint64_t v4 = 0x80000001890F7370LL;
  }
  if ((a2 & 1) != 0) {
    unint64_t v5 = 0xD000000000000012LL;
  }
  else {
    unint64_t v5 = 0x65756C6176LL;
  }
  if ((a2 & 1) != 0) {
    unint64_t v6 = 0x80000001890F7370LL;
  }
  else {
    unint64_t v6 = 0xE500000000000000LL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1890F183C();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t OnDiskCodeSigningFlags.ValueSet.init(rawValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t *static OnDiskCodeSigningFlags.isSuperset(of:)@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  *(_BYTE *)a2 = 2;
  *(_BYTE *)(a2 + 8) = 23;
  *(void *)(a2 + 16) = v2;
  *(_BYTE *)(a2 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = 0;
  *(void *)(a2 + 32) = 0LL;
  return result;
}

uint64_t sub_1890DDC1C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (*(void *)(a1 + 16) == 1LL)
  {
    uint64_t v5 = swift_bridgeObjectRetain();
    sub_1890DBB84(v5, (uint64_t)&v10);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v7 = v11;
    if (!v11)
    {
      __break(1u);
      return result;
    }

    uint64_t v8 = v10;
    sub_1890D2660(&v12, (uint64_t)v14);
    if (v8 == 7499556 && v7 == 0xE300000000000000LL
      || (sub_1890F183C() & 1) != 0
      || v8 == 0x617272612D726F24LL && v7 == 0xE900000000000079LL
      || (sub_1890F183C() & 1) != 0)
    {
      sub_1890DC3B8((uint64_t)v14, a2);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
      return swift_bridgeObjectRelease();
    }

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    swift_bridgeObjectRelease();
  }

  *((void *)&v12 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
  uint64_t v13 = &off_18A349CF0;
  uint64_t v10 = a1;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_1890DBCD0( (uint64_t)&v10,  (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *))sub_1890DC3B8,  &qword_18C7688D0,  &qword_18C768630,  (void (*)(unint64_t, char *, void **, uint64_t, uint64_t))sub_1890D198C);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  if (!v2)
  {
    a2[3] = &type metadata for ProcessConstraintConjunction;
    uint64_t result = sub_1890CFBE0();
    a2[4] = result;
    *(_WORD *)a2 = 5141;
    a2[1] = v9;
  }

  return result;
}

uint64_t sub_1890DDDFC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (*(void *)(a1 + 16) == 1LL)
  {
    uint64_t v5 = swift_bridgeObjectRetain();
    sub_1890DBB84(v5, (uint64_t)&v10);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v7 = v11;
    if (!v11)
    {
      __break(1u);
      return result;
    }

    uint64_t v8 = v10;
    sub_1890D2660(&v12, (uint64_t)v14);
    if (v8 == 7499556 && v7 == 0xE300000000000000LL
      || (sub_1890F183C() & 1) != 0
      || v8 == 0x617272612D726F24LL && v7 == 0xE900000000000079LL
      || (sub_1890F183C() & 1) != 0)
    {
      sub_1890DCAE4((uint64_t)v14, a2);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
      return swift_bridgeObjectRelease();
    }

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    swift_bridgeObjectRelease();
  }

  *((void *)&v12 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
  uint64_t v13 = &off_18A349CF0;
  uint64_t v10 = a1;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_1890DBCD0( (uint64_t)&v10,  (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *))sub_1890DCAE4,  &qword_18C7688D8,  &qword_18C768640,  (void (*)(unint64_t, char *, void **, uint64_t, uint64_t))sub_1890D198C);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  if (!v2)
  {
    a2[3] = &type metadata for LaunchConstraintConjunction;
    uint64_t result = sub_1890CFC40();
    a2[4] = result;
    *(_WORD *)a2 = 5141;
    a2[1] = v9;
  }

  return result;
}

uint64_t sub_1890DDFDC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (*(void *)(a1 + 16) == 1LL)
  {
    uint64_t v5 = swift_bridgeObjectRetain();
    sub_1890DBB84(v5, (uint64_t)&v10);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v7 = v11;
    if (!v11)
    {
      __break(1u);
      return result;
    }

    uint64_t v8 = v10;
    sub_1890D2660(&v12, (uint64_t)v14);
    if (v8 == 7499556 && v7 == 0xE300000000000000LL
      || (sub_1890F183C() & 1) != 0
      || v8 == 0x617272612D726F24LL && v7 == 0xE900000000000079LL
      || (sub_1890F183C() & 1) != 0)
    {
      sub_1890DD210((uint64_t)v14, a2);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
      return swift_bridgeObjectRelease();
    }

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    swift_bridgeObjectRelease();
  }

  *((void *)&v12 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
  uint64_t v13 = &off_18A349CF0;
  uint64_t v10 = a1;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_1890DBCD0( (uint64_t)&v10,  (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *))sub_1890DD210,  &qword_18C7688E0,  &qword_18C768648,  (void (*)(unint64_t, char *, void **, uint64_t, uint64_t))sub_1890D198C);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  if (!v2)
  {
    a2[3] = &type metadata for OnDiskConstraintConjunction;
    uint64_t result = sub_1890CFCA0();
    a2[4] = result;
    *(_WORD *)a2 = 5141;
    a2[1] = v9;
  }

  return result;
}

void *static ProcessConstraintBuilder.buildBlock(_:)(uint64_t a1)
{
  return sub_1890DE1F0(a1, &qword_18C7688D0, &qword_18C768630);
}

uint64_t static ProcessConstraintBuilder.buildExpression(_:)(uint64_t a1)
{
  return sub_1890DE360(a1, &qword_18C7688D0);
}

void *static LaunchConstraintBuilder.buildBlock(_:)(uint64_t a1)
{
  return sub_1890DE1F0(a1, &qword_18C7688D8, &qword_18C768640);
}

void *sub_1890DE1F0(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return (void *)MEMORY[0x18961AFE8];
  }
  uint64_t result = (void *)swift_bridgeObjectRetain();
  uint64_t v8 = 0LL;
  uint64_t v9 = (void *)MEMORY[0x18961AFE8];
  while (1)
  {
    uint64_t v10 = *(void *)(a1 + 8 * v8 + 32);
    uint64_t v11 = *(void *)(v10 + 16);
    int64_t v12 = v9[2];
    int64_t v13 = v12 + v11;
    if (__OFADD__(v12, v11)) {
      break;
    }
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
    if ((_DWORD)result && v13 <= v9[3] >> 1)
    {
      if (*(void *)(v10 + 16)) {
        goto LABEL_14;
      }
    }

    else
    {
      if (v12 <= v13) {
        int64_t v14 = v12 + v11;
      }
      else {
        int64_t v14 = v12;
      }
      uint64_t result = sub_1890EA8B4(result, v14, 1, v9, a2, a3);
      uint64_t v9 = result;
      if (*(void *)(v10 + 16))
      {
LABEL_14:
        if ((v9[3] >> 1) - v9[2] < v11) {
          goto LABEL_23;
        }
        __swift_instantiateConcreteTypeFromMangledName(a3);
        uint64_t result = (void *)swift_arrayInitWithCopy();
        if (v11)
        {
          uint64_t v15 = v9[2];
          BOOL v16 = __OFADD__(v15, v11);
          uint64_t v17 = v15 + v11;
          if (v16) {
            goto LABEL_24;
          }
          v9[2] = v17;
        }

        goto LABEL_4;
      }
    }

    if (v11) {
      goto LABEL_22;
    }
LABEL_4:
    uint64_t result = (void *)swift_bridgeObjectRelease();
    if (v3 == ++v8)
    {
      swift_bridgeObjectRelease();
      return v9;
    }
  }

  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t static LaunchConstraintBuilder.buildExpression(_:)(uint64_t a1)
{
  return sub_1890DE360(a1, &qword_18C7688D8);
}

uint64_t sub_1890DE360(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1890F1C20;
  sub_1890D51E0(a1, v3 + 32);
  return v3;
}

uint64_t static LaunchConstraintBuilder.buildOptional(_:)(uint64_t a1)
{
  if (a1) {
    uint64_t v1 = a1;
  }
  else {
    uint64_t v1 = MEMORY[0x18961AFE8];
  }
  swift_bridgeObjectRetain();
  return v1;
}

void *static OnDiskConstraintBuilder.buildBlock(_:)(uint64_t a1)
{
  return sub_1890DE1F0(a1, &qword_18C7688E0, &qword_18C768648);
}

uint64_t static OnDiskConstraintBuilder.buildExpression(_:)(uint64_t a1)
{
  return sub_1890DE360(a1, &qword_18C7688E0);
}

uint64_t sub_1890DE404@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(void *)(v15[0] + 16) != 1LL)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    sub_1890D25E0();
    swift_allocError();
    *uint64_t v9 = 1;
    swift_willThrow();
    uint64_t v10 = (uint64_t *)a1;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }

  sub_1890DBB84(v15[0], (uint64_t)v13);
  uint64_t result = swift_bridgeObjectRelease();
  if (v13[1])
  {
    sub_1890D2660(&v14, (uint64_t)v15);
    char v5 = sub_1890F10FC();
    if (v5 != 31)
    {
      char v6 = v5;
      sub_1890D51E0((uint64_t)v15, (uint64_t)v13);
      if ((swift_dynamicCast() & 1) != 0)
      {
        __swift_destroy_boxed_opaque_existential_1(a1);
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
        uint64_t v7 = 0LL;
        __int128 v8 = v12;
LABEL_12:
        *(_BYTE *)a2 = v6;
        *(_OWORD *)(a2 + 8) = v8;
        *(void *)(a2 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v7;
        return result;
      }

      sub_1890D51E0((uint64_t)v15, (uint64_t)v13);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C7696C0);
      if ((swift_dynamicCast() & 1) != 0)
      {
        uint64_t v7 = v12;
        __swift_destroy_boxed_opaque_existential_1(a1);
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
        __int128 v8 = xmmword_1890F6C20;
        goto LABEL_12;
      }
    }

    sub_1890D25E0();
    swift_allocError();
    *uint64_t v11 = 1;
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1(a1);
    uint64_t v10 = v15;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }

  __break(1u);
  return result;
}

uint64_t sub_1890DE614(uint64_t a1)
{
  uint64_t v1 = v11[0];
  if (*(void *)(v11[0] + 16) != 1LL)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    sub_1890D25E0();
    swift_allocError();
    *char v5 = 1;
    swift_willThrow();
    char v6 = (uint64_t *)a1;
    goto LABEL_9;
  }

  sub_1890DBB84(v11[0], (uint64_t)&v8);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v1 = v9;
  if (v9)
  {
    sub_1890D2660(&v10, (uint64_t)v11);
    uint64_t v4 = sub_1890F10FC();
    if (v4 != 31)
    {
      uint64_t v1 = v4;
      sub_1890D51E0((uint64_t)v11, (uint64_t)&v8);
      if ((swift_dynamicCast() & 1) != 0
        || (sub_1890D51E0((uint64_t)v11, (uint64_t)&v8),
            __swift_instantiateConcreteTypeFromMangledName(&qword_18C7696C8),
            (swift_dynamicCast() & 1) != 0))
      {
        __swift_destroy_boxed_opaque_existential_1(a1);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
        return v1;
      }
    }

    sub_1890D25E0();
    swift_allocError();
    *uint64_t v7 = 1;
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1(a1);
    char v6 = v11;
LABEL_9:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
    return v1;
  }

  __break(1u);
  return result;
}

uint64_t sub_1890DE81C(uint64_t a1)
{
  uint64_t v1 = v11[0];
  if (*(void *)(v11[0] + 16) != 1LL)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    sub_1890D25E0();
    swift_allocError();
    *char v5 = 1;
    swift_willThrow();
    char v6 = (uint64_t *)a1;
    goto LABEL_9;
  }

  sub_1890DBB84(v11[0], (uint64_t)&v8);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v1 = v9;
  if (v9)
  {
    sub_1890D2660(&v10, (uint64_t)v11);
    uint64_t v4 = sub_1890F10FC();
    if (v4 != 31)
    {
      uint64_t v1 = v4;
      sub_1890D51E0((uint64_t)v11, (uint64_t)&v8);
      if ((swift_dynamicCast() & 1) != 0
        || (sub_1890D51E0((uint64_t)v11, (uint64_t)&v8),
            __swift_instantiateConcreteTypeFromMangledName(&qword_18C7696D8),
            (swift_dynamicCast() & 1) != 0))
      {
        __swift_destroy_boxed_opaque_existential_1(a1);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
        return v1;
      }
    }

    sub_1890D25E0();
    swift_allocError();
    *uint64_t v7 = 1;
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1(a1);
    char v6 = v11;
LABEL_9:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
    return v1;
  }

  __break(1u);
  return result;
}

uint64_t sub_1890DEA1C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X2>, uint64_t a3@<X8>)
{
  if (*(void *)(v18[0] + 16) != 1LL)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    sub_1890D25E0();
    swift_allocError();
    *__int128 v12 = 1;
    swift_willThrow();
    int64_t v13 = (uint64_t *)a1;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }

  sub_1890DBB84(v18[0], (uint64_t)v16);
  uint64_t result = swift_bridgeObjectRelease();
  if (v16[1])
  {
    sub_1890D2660(&v17, (uint64_t)v18);
    char v7 = sub_1890F10FC();
    if (v7 != 31)
    {
      char v8 = v7;
      sub_1890D51E0((uint64_t)v18, (uint64_t)v16);
      char v9 = swift_dynamicCast();
      if ((v9 & 1) != 0)
      {
        __swift_destroy_boxed_opaque_existential_1(a1);
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
        uint64_t v10 = 0LL;
        uint64_t v11 = v15;
LABEL_12:
        *(_BYTE *)a3 = v8;
        *(void *)(a3 + 8) = v11;
        *(_BYTE *)(a3 + 16) = v9 ^ 1;
        *(void *)(a3 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v10;
        return result;
      }

      sub_1890D51E0((uint64_t)v18, (uint64_t)v16);
      __swift_instantiateConcreteTypeFromMangledName(a2);
      if ((swift_dynamicCast() & 1) != 0)
      {
        uint64_t v10 = v15;
        __swift_destroy_boxed_opaque_existential_1(a1);
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
        uint64_t v11 = 0LL;
        goto LABEL_12;
      }
    }

    sub_1890D25E0();
    swift_allocError();
    *__int128 v14 = 1;
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1(a1);
    int64_t v13 = v18;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }

  __break(1u);
  return result;
}

BOOL sub_1890DEC40(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_1890DEC50()
{
  return sub_1890F189C();
}

uint64_t sub_1890DEC74(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7955819 && a2 == 0xE300000000000000LL;
  if (v2 || (sub_1890F183C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0x6E695365756C6176LL && a2 == 0xEB00000000656C67LL || (sub_1890F183C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else if (a1 == 0x72724165756C6176LL && a2 == 0xEA00000000007961LL)
  {
    swift_bridgeObjectRelease();
    return 2LL;
  }

  else
  {
    char v6 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 2LL;
    }
    else {
      return 3LL;
    }
  }

uint64_t sub_1890DEDDC()
{
  return sub_1890F18B4();
}

uint64_t sub_1890DEE20(char a1)
{
  if (!a1) {
    return 7955819LL;
  }
  if (a1 == 1) {
    return 0x6E695365756C6176LL;
  }
  return 0x72724165756C6176LL;
}

BOOL sub_1890DEE7C(char *a1, char *a2)
{
  return sub_1890DEC40(*a1, *a2);
}

uint64_t sub_1890DEE94()
{
  return sub_1890DEDDC();
}

uint64_t sub_1890DEEA4()
{
  return sub_1890DEC50();
}

uint64_t sub_1890DEEB4()
{
  return sub_1890F18B4();
}

uint64_t sub_1890DEEFC(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v17 = *(void *)(a2 + 16);
  uint64_t v18 = v5;
  uint64_t v6 = type metadata accessor for ContainerConstraint.CodingKeys(255LL, v17, v4, v5);
  MEMORY[0x1895DFB60](&unk_1890F6BD0, v6);
  uint64_t v7 = sub_1890F1794();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858](v7);
  uint64_t v10 = (char *)&v17 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v11 = v19;
  sub_1890F18CC();
  LOBYTE(v22) = *v11;
  char v23 = 0;
  sub_1890D0828();
  uint64_t v12 = v20;
  sub_1890F177C();
  if (v12) {
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  uint64_t v14 = v8;
  LOBYTE(v22) = 1;
  uint64_t v15 = v18;
  sub_1890F1758();
  uint64_t v22 = *(void *)&v11[*(int *)(a2 + 48)];
  char v23 = 2;
  uint64_t v16 = sub_1890F165C();
  uint64_t v21 = v15;
  MEMORY[0x1895DFB60](MEMORY[0x189618448], v16, &v21);
  sub_1890F1758();
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v10, v7);
}

uint64_t sub_1890DF0DC@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v31 = a5;
  uint64_t v9 = sub_1890F1668();
  uint64_t v32 = *(void *)(v9 - 8);
  uint64_t v33 = v9;
  MEMORY[0x1895F8858](v9);
  uint64_t v36 = (char *)v29 - v10;
  uint64_t v11 = type metadata accessor for ContainerConstraint.CodingKeys(255LL, a2, a3, a4);
  MEMORY[0x1895DFB60](&unk_1890F6BD0, v11);
  uint64_t v39 = sub_1890F1740();
  uint64_t v35 = *(void *)(v39 - 8);
  MEMORY[0x1895F8858](v39);
  int64_t v13 = (char *)v29 - v12;
  uint64_t v37 = a2;
  uint64_t v38 = a3;
  uint64_t v34 = type metadata accessor for ContainerConstraint(0LL, a2, a3, a4);
  uint64_t v14 = *(void *)(v34 - 8);
  MEMORY[0x1895F8858](v34);
  uint64_t v16 = (char *)v29 - v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  unint64_t v40 = v13;
  uint64_t v17 = v41;
  sub_1890F18C0();
  if (v17) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v18 = v16;
  uint64_t v41 = v14;
  uint64_t v19 = v35;
  uint64_t v20 = v38;
  char v44 = 0;
  sub_1890D259C();
  uint64_t v21 = v39;
  sub_1890F1728();
  uint64_t v30 = v18;
  *uint64_t v18 = v43;
  LOBYTE(v43) = 1;
  sub_1890F1704();
  uint64_t v22 = *(void (**)(void))(v32 + 32);
  v29[1] = &v30[*(int *)(v34 + 44)];
  v22();
  uint64_t v23 = sub_1890F165C();
  char v44 = 2;
  uint64_t v42 = v20;
  MEMORY[0x1895DFB60](MEMORY[0x189618478], v23, &v42);
  sub_1890F1704();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v40, v21);
  uint64_t v24 = v34;
  unint64_t v26 = v30;
  uint64_t v25 = v31;
  *(void *)&v30[*(int *)(v34 + 48)] = v43;
  uint64_t v27 = v41;
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v41 + 16))(v25, v26, v24);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v27 + 8))(v26, v24);
}

uint64_t sub_1890DF408()
{
  return sub_1890DEE20(*v0);
}

uint64_t sub_1890DF418@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1890DEC74(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1890DF448@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_1890EF498();
  *a1 = result;
  return result;
}

uint64_t sub_1890DF478(uint64_t a1)
{
  return sub_1890F18D8();
}

uint64_t sub_1890DF4AC(uint64_t a1)
{
  return sub_1890F18E4();
}

uint64_t sub_1890DF4E0@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1890DF0DC(a1, a2[2], a2[3], a2[4], a3);
}

uint64_t sub_1890DF500(void *a1, uint64_t a2)
{
  return sub_1890DEEFC(a1, a2);
}

uint64_t sub_1890DF514@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1890DF858(a1, a2);
}

uint64_t sub_1890DF528@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, unint64_t *a5@<X8>)
{
  unsigned __int8 v5 = result;
  if ((a3 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C769648);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1890F1C20;
    *(void *)(inited + 32) = sub_1890EFBB4(v5);
    *(void *)(inited + 40) = v9;
    *(void *)(inited + 48) = a2;
    unint64_t v10 = sub_1890C7EA4(inited);
    uint64_t v11 = (uint64_t *)&unk_18C769650;
LABEL_5:
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(v11);
    a5[3] = result;
    a5[4] = (unint64_t)&off_18A349CF0;
    *a5 = v10;
    return result;
  }

  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C769658);
    uint64_t v13 = swift_initStackObject();
    *(_OWORD *)(v13 + 16) = xmmword_1890F1C20;
    *(void *)(v13 + 32) = sub_1890EFBB4(v5);
    *(void *)(v13 + 40) = v14;
    *(void *)(v13 + 48) = a4;
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_1890C7FB4(v13);
    uint64_t v11 = (uint64_t *)&unk_18C769660;
    goto LABEL_5;
  }

  __break(1u);
  return result;
}

uint64_t sub_1890DF62C@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t *a5@<X8>)
{
  unsigned __int8 v5 = result;
  if (a3 >> 60 != 15)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C769698);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1890F1C20;
    *(void *)(inited + 32) = sub_1890EFBB4(v5);
    *(void *)(inited + 40) = v15;
    *(void *)(inited + 48) = a2;
    *(void *)(inited + 56) = a3;
    sub_1890D52D8(a2, a3);
    unint64_t v10 = sub_1890C7FC0(inited);
    uint64_t v11 = (uint64_t *)&unk_18C7696A0;
    goto LABEL_5;
  }

  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7696A8);
    uint64_t v8 = swift_initStackObject();
    *(_OWORD *)(v8 + 16) = xmmword_1890F1C20;
    *(void *)(v8 + 32) = sub_1890EFBB4(v5);
    *(void *)(v8 + 40) = v9;
    *(void *)(v8 + 48) = a4;
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_1890C80E4(v8);
    uint64_t v11 = (uint64_t *)&unk_18C7696B0;
LABEL_5:
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(v11);
    a5[3] = result;
    a5[4] = (unint64_t)&off_18A349CF0;
    *a5 = v10;
    return result;
  }

  __break(1u);
  return result;
}

uint64_t sub_1890DF748@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t *a5@<X8>)
{
  unsigned __int8 v5 = result;
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C769678);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1890F1C20;
    *(void *)(inited + 32) = sub_1890EFBB4(v5);
    *(void *)(inited + 40) = v10;
    *(void *)(inited + 48) = a2;
    *(void *)(inited + 56) = a3;
    swift_bridgeObjectRetain();
    unint64_t v11 = sub_1890C8200(inited);
    uint64_t v12 = (uint64_t *)&unk_18C769680;
LABEL_5:
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(v12);
    a5[3] = result;
    a5[4] = (unint64_t)&off_18A349CF0;
    *a5 = v11;
    return result;
  }

  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C769688);
    uint64_t v14 = swift_initStackObject();
    *(_OWORD *)(v14 + 16) = xmmword_1890F1C20;
    *(void *)(v14 + 32) = sub_1890EFBB4(v5);
    *(void *)(v14 + 40) = v15;
    *(void *)(v14 + 48) = a4;
    swift_bridgeObjectRetain();
    unint64_t v11 = sub_1890C8320(v14);
    uint64_t v12 = (uint64_t *)&unk_18C769690;
    goto LABEL_5;
  }

  __break(1u);
  return result;
}

uint64_t sub_1890DF858@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = sub_1890F1668();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1895F8858](v5);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v7);
  unint64_t v11 = (char *)&v28 - v10;
  uint64_t v12 = *(int *)(a1 + 44);
  uint64_t v32 = v2;
  uint64_t v13 = &v2[v12];
  uint64_t v30 = *(void (**)(char *, unsigned __int8 *, uint64_t))(v6 + 16);
  v30((char *)&v28 - v10, &v2[v12], v5);
  uint64_t v29 = *(void *)(v4 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48);
  int v15 = v14(v11, 1LL, v4);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  if (v15 == 1)
  {
    uint64_t v17 = v32;
    uint64_t v18 = *(void *)&v32[*(int *)(a1 + 48)];
    if (v18)
    {
      sub_1890F165C();
      swift_getTupleTypeMetadata2();
      sub_1890F17AC();
      swift_initStackObject();
      sub_1890F1638();
      uint64_t v20 = v19;
      *uint64_t v19 = sub_1890EFBB4(*v17);
      v20[1] = v21;
      v20[2] = v18;
      sub_1890F165C();
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_1890F15C0();
LABEL_6:
      uint64_t result = sub_1890F15CC();
      uint64_t v27 = v31;
      v31[3] = result;
      v27[4] = (uint64_t)&off_18A349CF0;
      *uint64_t v27 = v22;
      return result;
    }

    __break(1u);
  }

  else
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    sub_1890F17AC();
    swift_allocObject();
    sub_1890F1638();
    uint64_t v25 = v24;
    *uint64_t v24 = sub_1890EFBB4(*v32);
    v25[1] = v26;
    v30(v9, v13, v5);
    uint64_t result = v14(v9, 1LL, v4);
    if ((_DWORD)result != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 32))( (char *)v25 + *(int *)(TupleTypeMetadata2 + 48),  v9,  v4);
      sub_1890F165C();
      uint64_t v22 = sub_1890F15C0();
      goto LABEL_6;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_1890DFB30@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, unint64_t *a5@<X8>)
{
  unsigned __int8 v5 = result;
  if ((a3 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C769648);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1890F1C20;
    *(void *)(inited + 32) = sub_1890EFBB4(v5);
    *(void *)(inited + 40) = v9;
    *(void *)(inited + 48) = a2;
    unint64_t v10 = sub_1890C7EA4(inited);
    unint64_t v11 = (uint64_t *)&unk_18C769650;
LABEL_11:
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(v11);
    a5[3] = result;
    a5[4] = (unint64_t)&off_18A349CF0;
    *a5 = v10;
    return result;
  }

  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C769658);
    uint64_t v13 = swift_initStackObject();
    *(_OWORD *)(v13 + 16) = xmmword_1890F1C20;
    *(void *)(v13 + 32) = sub_1890EFBB4(v5);
    *(void *)(v13 + 40) = v14;
    int64_t v15 = *(void *)(a4 + 16);
    uint64_t v16 = MEMORY[0x18961AFE8];
    if (v15)
    {
      uint64_t v21 = MEMORY[0x18961AFE8];
      swift_bridgeObjectRetain();
      sub_1890D08F8(0LL, v15, 0);
      uint64_t v17 = 0LL;
      uint64_t v16 = v21;
      unint64_t v18 = *(void *)(v21 + 16);
      do
      {
        uint64_t v19 = *(void *)(a4 + 8 * v17 + 32);
        unint64_t v20 = *(void *)(v21 + 24);
        if (v18 >= v20 >> 1) {
          sub_1890D08F8((char *)(v20 > 1), v18 + 1, 1);
        }
        ++v17;
        *(void *)(v21 + 16) = v18 + 1;
        *(void *)(v21 + 8 * v18++ + 32) = v19;
      }

      while (v15 != v17);
      swift_bridgeObjectRelease();
    }

    *(void *)(v13 + 48) = v16;
    unint64_t v10 = sub_1890C7FB4(v13);
    unint64_t v11 = (uint64_t *)&unk_18C769660;
    goto LABEL_11;
  }

  __break(1u);
  return result;
}

uint64_t sub_1890DFCE4@<X0>(unint64_t *a1@<X8>)
{
  if (swift_dynamicCast())
  {
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C769678);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1890F1C20;
    *(void *)(inited + 32) = sub_1890EFBB4(*v1);
    *(void *)(inited + 40) = v5;
    sub_1890D51E0((uint64_t)(v1 + 8), (uint64_t)v15);
    swift_dynamicCast();
    unint64_t v6 = sub_1890C8200(inited);
    uint64_t v7 = (uint64_t *)&unk_18C769680;
  }

  else
  {
    sub_1890D51E0((uint64_t)(v1 + 8), (uint64_t)v15);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C768AD8);
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685B8);
    uint64_t v8 = swift_initStackObject();
    *(_OWORD *)(v8 + 16) = xmmword_1890F1C20;
    *(void *)(v8 + 32) = sub_1890EFBB4(*v1);
    *(void *)(v8 + 40) = v9;
    sub_1890DF748(v11, v12, v13, v14, (unint64_t *)(v8 + 48));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v2)
    {
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685C8);
      return swift_arrayDestroy();
    }

    unint64_t v6 = sub_1890C7D78(v8);
    uint64_t v7 = &qword_18C7685A8;
  }

  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(v7);
  a1[3] = result;
  a1[4] = (unint64_t)&off_18A349CF0;
  *a1 = v6;
  return result;
}

uint64_t sub_1890DFEEC@<X0>(unint64_t *a1@<X8>)
{
  if (swift_dynamicCast())
  {
    sub_1890D74E0(v10, v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C769698);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1890F1C20;
    *(void *)(inited + 32) = sub_1890EFBB4(*v1);
    *(void *)(inited + 40) = v5;
    sub_1890D51E0((uint64_t)(v1 + 8), (uint64_t)v14);
    swift_dynamicCast();
    unint64_t v6 = sub_1890C7FC0(inited);
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7696A0);
    a1[3] = result;
    a1[4] = (unint64_t)&off_18A349CF0;
  }

  else
  {
    sub_1890D51E0((uint64_t)(v1 + 8), (uint64_t)v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C768910);
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685B8);
    uint64_t v8 = swift_initStackObject();
    *(_OWORD *)(v8 + 16) = xmmword_1890F1C20;
    *(void *)(v8 + 32) = sub_1890EFBB4(*v1);
    *(void *)(v8 + 40) = v9;
    sub_1890DF62C(v10, v11, v12, v13, (unint64_t *)(v8 + 48));
    if (v2)
    {
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685C8);
      swift_arrayDestroy();
      sub_1890EA590(v11, v12);
      return swift_bridgeObjectRelease();
    }

    unint64_t v6 = sub_1890C7D78(v8);
    a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
    a1[4] = (unint64_t)&off_18A349CF0;
    sub_1890EA590(v11, v12);
    uint64_t result = swift_bridgeObjectRelease();
  }

  *a1 = v6;
  return result;
}

uint64_t sub_1890E011C@<X0>(unint64_t *a1@<X8>)
{
  if (swift_dynamicCast())
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C769648);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1890F1C20;
    *(void *)(inited + 32) = sub_1890EFBB4(*v1);
    *(void *)(inited + 40) = v5;
    sub_1890D51E0((uint64_t)(v1 + 8), (uint64_t)v15);
    swift_dynamicCast();
    unint64_t v6 = sub_1890C7EA4(inited);
    uint64_t v7 = &qword_18C769650;
  }

  else
  {
    sub_1890D51E0((uint64_t)(v1 + 8), (uint64_t)v15);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C768970);
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685B8);
    uint64_t v8 = swift_initStackObject();
    *(_OWORD *)(v8 + 16) = xmmword_1890F1C20;
    *(void *)(v8 + 32) = sub_1890EFBB4(*v1);
    *(void *)(v8 + 40) = v9;
    sub_1890DF528(v11, v12, v13, v14, (unint64_t *)(v8 + 48));
    swift_bridgeObjectRelease();
    if (v2)
    {
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685C8);
      return swift_arrayDestroy();
    }

    unint64_t v6 = sub_1890C7D78(v8);
    uint64_t v7 = &qword_18C7685A8;
  }

  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(v7);
  a1[3] = result;
  a1[4] = (unint64_t)&off_18A349CF0;
  *a1 = v6;
  return result;
}

uint64_t sub_1890E0318@<X0>(uint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  if (swift_dynamicCast())
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C769648);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1890F1C20;
    *(void *)(inited + 32) = sub_1890EFBB4(*v2);
    *(void *)(inited + 40) = v7;
    sub_1890D51E0((uint64_t)(v2 + 8), (uint64_t)v17);
    swift_dynamicCast();
    unint64_t v8 = sub_1890C7EA4(inited);
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_18C769650);
    a2[3] = result;
    a2[4] = (unint64_t)&off_18A349CF0;
    *a2 = v8;
  }

  else
  {
    sub_1890D51E0((uint64_t)(v2 + 8), (uint64_t)v17);
    __swift_instantiateConcreteTypeFromMangledName(a1);
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685B8);
    uint64_t v10 = swift_initStackObject();
    *(_OWORD *)(v10 + 16) = xmmword_1890F1C20;
    *(void *)(v10 + 32) = sub_1890EFBB4(*v2);
    *(void *)(v10 + 40) = v11;
    sub_1890DFB30(v13, v14, v15, v16, (unint64_t *)(v10 + 48));
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685C8);
      swift_arrayDestroy();
    }

    else
    {
      unint64_t v12 = sub_1890C7D78(v10);
      a2[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
      a2[4] = (unint64_t)&off_18A349CF0;
      *a2 = v12;
    }

    return swift_bridgeObjectRelease();
  }

  return result;
}

uint64_t sub_1890E0510@<X0>( void (*a1)(uint64_t)@<X0>, void (*a2)(uint64_t)@<X1>, unint64_t *a3@<X8>)
{
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1890F1C20;
  *(void *)(inited + 32) = sub_1890EFBB4(*(_BYTE *)v3);
  *(void *)(inited + 40) = v6;
  uint64_t v7 = *(void *)(v3 + 16);
  char v8 = *(_BYTE *)(v3 + 24);
  uint64_t v9 = *(void *)(v3 + 32);
  uint64_t v10 = *(unsigned __int8 *)(v3 + 8);
  a1(v3);
  sub_1890DF528(v10, v7, v8, v9, (unint64_t *)(inited + 48));
  a2(v3);
  if (v14)
  {
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685C8);
    return swift_arrayDestroy();
  }

  else
  {
    unint64_t v12 = sub_1890C7D78(inited);
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
    a3[3] = result;
    a3[4] = (unint64_t)&off_18A349CF0;
    *a3 = v12;
  }

  return result;
}

void AppleInternal.init()(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 0;
  *(void *)(a1 + 32) = MEMORY[0x1896184C8];
  *(void *)(a1 + 40) = &off_18A3472C0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t AppleInternal.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x1896184C8];
  *(_BYTE *)a2 = 0;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = &off_18A3472C0;
  *(_BYTE *)(a2 + 8) = result;
  return result;
}

uint64_t sub_1890E0694@<X0>(char *a1@<X8>)
{
  return sub_1890E95FC(a1);
}

uint64_t sub_1890E06A0@<X0>(char *a1@<X8>)
{
  return sub_1890E9660(a1);
}

uint64_t sub_1890E06AC()
{
  return sub_1890F18D8();
}

uint64_t sub_1890E06D4()
{
  return sub_1890F18E4();
}

uint64_t AppleInternal.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7688E8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  char v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EA444();
  sub_1890F18CC();
  sub_1890EFBB4(*v3);
  v11[0] = 0;
  sub_1890F1764();
  if (v2)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }

  else
  {
    swift_bridgeObjectRelease();
    sub_1890D51E0((uint64_t)(v3 + 8), (uint64_t)v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7688F8);
    swift_dynamicCast();
    v11[0] = 1;
    sub_1890F1770();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

uint64_t AppleInternal.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768900);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  char v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EA444();
  sub_1890F18C0();
  if (!v2)
  {
    char v20 = 0;
    sub_1890D259C();
    sub_1890F1728();
    LOBYTE(v19[0]) = v16;
    if (sub_1890EFBB4(v16) == 0x6E692D656C707061LL && v9 == 0xEE006C616E726574LL)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }

    char v10 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
    {
LABEL_7:
      char v20 = 1;
      char v11 = sub_1890F171C();
      uint64_t v17 = MEMORY[0x1896184C8];
      unint64_t v18 = &off_18A3472C0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_1890D2660(&v16, (uint64_t)v19 + 8);
      __int128 v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }

    sub_1890D25E0();
    swift_allocError();
    *unsigned __int8 v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1890E0AC8@<X0>(unint64_t *a1@<X8>)
{
  return sub_1890E2010(a1);
}

uint64_t sub_1890E0ADC@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return AppleInternal.init(from:)(a1, a2);
}

uint64_t sub_1890E0AF0(void *a1)
{
  return AppleInternal.encode(to:)(a1);
}

unint64_t CodeDirectoryHash.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1890E38C8(a1, a2, 1, a3);
}

uint64_t static CodeDirectoryHash.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1890E0B1C(a1, 1, a2);
}

{
  return sub_1890E0B1C(a1, 1, a2);
}

uint64_t sub_1890E0B1C@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  *(_BYTE *)a3 = a2;
  *(void *)(a3 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768910);
  *(void *)(a3 + 40) = sub_1890EAE38(&qword_18C768918, &qword_18C768910, (uint64_t)&unk_1890F6A9C);
  uint64_t v5 = swift_allocObject();
  *(void *)(a3 + 8) = v5;
  *(_BYTE *)(v5 + 16) = 22;
  *(_OWORD *)(v5 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = xmmword_1890F6C20;
  *(void *)(v5 + 40) = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1890E0BAC(char *a1, char *a2)
{
  return sub_1890DDAB4(*a1, *a2) & 1;
}

uint64_t sub_1890E0BCC@<X0>(char *a1@<X8>)
{
  return sub_1890E95FC(a1);
}

void sub_1890E0BD8(uint64_t *a1@<X8>)
{
  uint64_t v2 = 7955819LL;
  if (*v1) {
    uint64_t v2 = 0x65756C6176LL;
  }
  unint64_t v3 = 0xE300000000000000LL;
  if (*v1) {
    unint64_t v3 = 0xE500000000000000LL;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1890E0C0C()
{
  if (*v0) {
    return 0x65756C6176LL;
  }
  else {
    return 7955819LL;
  }
}

uint64_t sub_1890E0C3C@<X0>(char *a1@<X8>)
{
  return sub_1890E9660(a1);
}

uint64_t sub_1890E0C48()
{
  return sub_1890F18D8();
}

uint64_t sub_1890E0C70()
{
  return sub_1890F18E4();
}

uint64_t CodeDirectoryHash.encode(to:)(void *a1)
{
  return sub_1890E39B4(a1, &qword_18C768920, (void (*)(void))sub_1890EA54C);
}

uint64_t CodeDirectoryHash.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768948);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  char v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EA54C();
  sub_1890F18C0();
  if (!v2)
  {
    char v21 = 0;
    sub_1890D259C();
    sub_1890F1728();
    LOBYTE(v20[0]) = v17;
    if (sub_1890EFBB4(v17) == 0x687361686463LL && v10 == 0xE600000000000000LL)
    {
      swift_bridgeObjectRelease();
    }

    else
    {
      char v11 = sub_1890F183C();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_1890D25E0();
        swift_allocError();
        *unsigned __int8 v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }

    char v21 = 1;
    sub_1890EA5E8();
    uint64_t v12 = MEMORY[0x189606D70];
    sub_1890F1728();
    __int128 v14 = v17;
    uint64_t v18 = v12;
    unint64_t v19 = sub_1890EA488();
    __int128 v17 = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_1890D2660(&v17, (uint64_t)v20 + 8);
    __int128 v15 = v20[1];
    *a2 = v20[0];
    a2[1] = v15;
    a2[2] = v20[2];
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1890E0FC4@<X0>(unint64_t *a1@<X8>)
{
  return sub_1890DFEEC(a1);
}

uint64_t sub_1890E0FD8@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return CodeDirectoryHash.init(from:)(a1, a2);
}

uint64_t sub_1890E0FEC(void *a1)
{
  return CodeDirectoryHash.encode(to:)(a1);
}

uint64_t ProcessCodeSigningFlags.ValueSet.rawValue.getter()
{
  return *(void *)v0;
}

void static ProcessCodeSigningFlags.ValueSet.isDynamicallyValid.getter(void *a1@<X8>)
{
  *a1 = 1LL;
}

void static ProcessCodeSigningFlags.ValueSet.isDebuggable.getter(void *a1@<X8>)
{
  *a1 = 4LL;
}

void static ProcessCodeSigningFlags.ValueSet.canInstallFilesToSIPProtectedLocations.getter(void *a1@<X8>)
{
  *a1 = 8LL;
}

void static ProcessCodeSigningFlags.ValueSet.hasLibraryValidationBecauseOfHardenedRuntime.getter( void *a1@<X8>)
{
  *a1 = 16LL;
}

void static ProcessCodeSigningFlags.ValueSet.invalidAllowed.getter(void *a1@<X8>)
{
  *a1 = 32LL;
}

void static ProcessCodeSigningFlags.ValueSet.isEntitlementSetValidated.getter(void *a1@<X8>)
{
  *a1 = 0x4000LL;
}

void static ProcessCodeSigningFlags.ValueSet.isAccessToNVRAMUnrestricted.getter(void *a1@<X8>)
{
  *a1 = 0x8000LL;
}

void static ProcessCodeSigningFlags.ValueSet.launchedProcessesWillBusErrorOnCodeSigningFailure.getter( void *a1@<X8>)
{
  *a1 = 0x100000LL;
}

void static ProcessCodeSigningFlags.ValueSet.launchedProcessesWillTerminateOnCodeSigningFailure.getter( void *a1@<X8>)
{
  *a1 = 0x200000LL;
}

void static ProcessCodeSigningFlags.ValueSet.launchedProcessesRequireCodeSignaturesForAllExecutableCode.getter( void *a1@<X8>)
{
  *a1 = 0x400000LL;
}

void static ProcessCodeSigningFlags.ValueSet.launchedProcessesCanInstallFilesToSIPProtectedLocations.getter( void *a1@<X8>)
{
  *a1 = 0x800000LL;
}

void static ProcessCodeSigningFlags.ValueSet.noUntrustedHelper.getter(void *a1@<X8>)
{
  *a1 = 0x2000000LL;
}

void static ProcessCodeSigningFlags.ValueSet.isPlatformSigned.getter(void *a1@<X8>)
{
  *a1 = 0x4000000LL;
}

void static ProcessCodeSigningFlags.ValueSet.platformPath.getter(void *a1@<X8>)
{
  *a1 = 0x8000000LL;
}

void static ProcessCodeSigningFlags.ValueSet.isDebugged.getter(void *a1@<X8>)
{
  *a1 = 0x10000000LL;
}

void static ProcessCodeSigningFlags.ValueSet.isSigned.getter(void *a1@<X8>)
{
  *a1 = 0x20000000LL;
}

void static ProcessCodeSigningFlags.ValueSet.isDevelopmentSigned.getter(void *a1@<X8>)
{
  *a1 = 0x40000000LL;
}

void static ProcessCodeSigningFlags.ValueSet.dataVaultController.getter(void *a1@<X8>)
{
  *a1 = 0x80000000LL;
}

uint64_t sub_1890E10E0()
{
  return sub_1890F1614();
}

uint64_t sub_1890E113C()
{
  return sub_1890F15FC();
}

uint64_t sub_1890E1190()
{
  return sub_1890F1674();
}

uint64_t sub_1890E11A8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_1890E11BC(a1, a2);
}

uint64_t sub_1890E11BC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0LL;
      }
      v4 |= v6;
      --v3;
    }

    while (v3);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t sub_1890E1218()
{
  return sub_1890F18D8();
}

uint64_t sub_1890E1240()
{
  return sub_1890F18E4();
}

uint64_t ProcessCodeSigningFlags.encode(to:)(void *a1)
{
  return sub_1890E18C8(a1, &qword_18C768960, (void (*)(void))sub_1890EA660);
}

uint64_t ProcessCodeSigningFlags.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1890E1AA0(a1, &qword_18C768980, (void (*)(void))sub_1890EA660, a2);
}

uint64_t sub_1890E12C0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ProcessCodeSigningFlags.init(from:)(a1, a2);
}

uint64_t sub_1890E12D4(void *a1)
{
  return ProcessCodeSigningFlags.encode(to:)(a1);
}

uint64_t sub_1890E12E8@<X0>(unint64_t *a1@<X8>)
{
  return sub_1890E0510((void (*)(uint64_t))sub_1890EF8BC, (void (*)(uint64_t))sub_1890EF8C0, a1);
}

uint64_t OnDiskCodeSigningFlags.ValueSet.rawValue.getter()
{
  return *(void *)v0;
}

void static OnDiskCodeSigningFlags.ValueSet.isAdhocSigned.getter(void *a1@<X8>)
{
  *a1 = 2LL;
}

void static OnDiskCodeSigningFlags.ValueSet.signalsBusErrorOnCodeSigningFailure.getter(void *a1@<X8>)
{
  *a1 = 256LL;
}

void static OnDiskCodeSigningFlags.ValueSet.terminatesOnCodeSigningFailure.getter(void *a1@<X8>)
{
  *a1 = 512LL;
}

void static OnDiskCodeSigningFlags.ValueSet.isCertificateExpirationEnforced.getter(void *a1@<X8>)
{
  *a1 = 1024LL;
}

void static OnDiskCodeSigningFlags.ValueSet.isDynamicLinkerPolicyHardened.getter(void *a1@<X8>)
{
  *a1 = 2048LL;
}

void static OnDiskCodeSigningFlags.ValueSet.isCodeSignatureRequiredForAllExecutableCode.getter( void *a1@<X8>)
{
  *a1 = 4096LL;
}

void static OnDiskCodeSigningFlags.ValueSet.isLibraryValidationRequired.getter(void *a1@<X8>)
{
  *a1 = 0x2000LL;
}

void static OnDiskCodeSigningFlags.ValueSet.isHardenedRuntimeEnforced.getter(void *a1@<X8>)
{
  *a1 = 0x10000LL;
}

void static OnDiskCodeSigningFlags.ValueSet.isSignedByLinker.getter(void *a1@<X8>)
{
  *a1 = 0x20000LL;
}

uint64_t sub_1890E13A4()
{
  return sub_1890F1614();
}

uint64_t sub_1890E1400()
{
  return sub_1890F15FC();
}

void *sub_1890E144C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1890E1458(void *a1@<X8>)
{
  *a1 = 0LL;
}

void *sub_1890E1460@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_1890E1474@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_1890E1488@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1890E149C(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_1890E14CC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1890E14F8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_1890E151C(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_1890E1530(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_1890E1544(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_1890E1558@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1890E156C(void *a1)
{
  return (*v1 & ~*a1) == 0LL;
}

BOOL sub_1890E1580(void *a1)
{
  return (*v1 & *a1) == 0LL;
}

BOOL sub_1890E1594(void *a1)
{
  return (*a1 & ~*v1) == 0LL;
}

BOOL sub_1890E15A8()
{
  return *v0 == 0LL;
}

void *sub_1890E15B8(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_1890E15CC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1890E15DC(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_1890E15E8(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1890E15FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 v5 = sub_1890DE614((uint64_t)v17);
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  unsigned __int8 v10 = v5;
  uint64_t v11 = v6;
  char v12 = v7;
  uint64_t v13 = v8;
  if (sub_1890EFBB4(v5) == 0x68632D67616C6624LL && v14 == 0xEB000000006B6365LL)
  {
    swift_bridgeObjectRelease();
  }

  else
  {
    char v15 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      sub_1890D25E0();
      swift_allocError();
      *uint64_t v16 = 1;
      swift_willThrow();
      return __swift_destroy_boxed_opaque_existential_1(a1);
    }
  }

  uint64_t result = __swift_destroy_boxed_opaque_existential_1(a1);
  *(_BYTE *)a2 = 2;
  *(_BYTE *)(a2 + 8) = v10;
  *(void *)(a2 + 16) = v11;
  *(_BYTE *)(a2 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v12 & 1;
  *(void *)(a2 + 32) = v13;
  return result;
}

BOOL sub_1890E1764(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1890E177C()
{
  return sub_1890F18B4();
}

uint64_t sub_1890E17C0()
{
  return sub_1890F189C();
}

uint64_t sub_1890E17E8()
{
  return sub_1890F18B4();
}

uint64_t sub_1890E1828@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1890EF4A0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1890E184C()
{
  return sub_1890F18D8();
}

uint64_t sub_1890E1874()
{
  return sub_1890F18E4();
}

uint64_t OnDiskCodeSigningFlags.encode(to:)(void *a1)
{
  return sub_1890E18C8(a1, &qword_18C768990, (void (*)(void))sub_1890EA6A4);
}

uint64_t sub_1890E18C8(void *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v17 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  char v9 = *v3;
  int v22 = v3[8];
  uint64_t v15 = *((void *)v3 + 2);
  int v14 = v3[24];
  uint64_t v13 = *((void *)v3 + 4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_1890F18CC();
  char v18 = v9;
  char v23 = 0;
  sub_1890D0828();
  uint64_t v10 = v16;
  sub_1890F177C();
  if (!v10)
  {
    char v18 = v22;
    uint64_t v19 = v15;
    char v20 = v14;
    uint64_t v21 = v13;
    char v23 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C768970);
    sub_1890EAE38(&qword_18C768978, &qword_18C768970, (uint64_t)&unk_1890F6A24);
    sub_1890F177C();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v8, v6);
}

uint64_t OnDiskCodeSigningFlags.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1890E1AA0(a1, &qword_18C7689A0, (void (*)(void))sub_1890EA6A4, a2);
}

uint64_t sub_1890E1AA0@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, void (*a3)(void)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v19 = a4;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v20 - 8);
  MEMORY[0x1895F8858](v20);
  char v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_1890F18C0();
  if (!v4)
  {
    uint64_t v10 = v7;
    uint64_t v11 = v19;
    char v25 = 0;
    sub_1890D259C();
    uint64_t v12 = v20;
    sub_1890F1728();
    char v13 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C768970);
    char v25 = 1;
    sub_1890EAE38(&qword_18C768988, &qword_18C768970, (uint64_t)&unk_1890F69FC);
    sub_1890F1728();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v9, v12);
    char v14 = v21;
    uint64_t v15 = v22;
    char v16 = v23;
    uint64_t v17 = v24;
    *(_BYTE *)uint64_t v11 = v13;
    *(_BYTE *)(v11 + 8) = v14;
    *(void *)(v11 + 16) = v15;
    *(_BYTE *)(v11 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v16;
    *(void *)(v11 + 32) = v17;
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1890E1C68@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return OnDiskCodeSigningFlags.init(from:)(a1, a2);
}

uint64_t sub_1890E1C7C(void *a1)
{
  return OnDiskCodeSigningFlags.encode(to:)(a1);
}

uint64_t sub_1890E1C90@<X0>(unint64_t *a1@<X8>)
{
  return sub_1890E0510((void (*)(uint64_t))sub_1890EF5C0, (void (*)(uint64_t))sub_1890EF5E8, a1);
}

void DeveloperMode.init()(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 3;
  *(void *)(a1 + 32) = MEMORY[0x1896184C8];
  *(void *)(a1 + 40) = &off_18A3472C0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t DeveloperMode.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x1896184C8];
  *(_BYTE *)a2 = 3;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = &off_18A3472C0;
  *(_BYTE *)(a2 + 8) = result;
  return result;
}

uint64_t sub_1890E1D24@<X0>(char *a1@<X8>)
{
  return sub_1890E95FC(a1);
}

uint64_t sub_1890E1D30@<X0>(char *a1@<X8>)
{
  return sub_1890E9660(a1);
}

uint64_t sub_1890E1D3C()
{
  return sub_1890F18D8();
}

uint64_t sub_1890E1D64()
{
  return sub_1890F18E4();
}

uint64_t DeveloperMode.encode(to:)(void *a1)
{
  return sub_1890E4240(a1, &qword_18C7689A8, (void (*)(void))sub_1890EA6E8);
}

uint64_t DeveloperMode.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7689B8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EA6E8();
  sub_1890F18C0();
  if (!v2)
  {
    char v20 = 0;
    sub_1890D259C();
    sub_1890F1728();
    LOBYTE(v19[0]) = v16;
    if (sub_1890EFBB4(v16) == 0x65706F6C65766564LL && v9 == 0xEE0065646F6D2D72LL)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }

    char v10 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
    {
LABEL_7:
      char v20 = 1;
      char v11 = sub_1890F171C();
      uint64_t v17 = MEMORY[0x1896184C8];
      char v18 = &off_18A3472C0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_1890D2660(&v16, (uint64_t)v19 + 8);
      __int128 v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }

    sub_1890D25E0();
    swift_allocError();
    *char v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1890E2010@<X0>(unint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C769668);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1890F1C20;
  *(void *)(inited + 32) = sub_1890EFBB4(*v2);
  *(void *)(inited + 40) = v5;
  sub_1890D51E0((uint64_t)(v2 + 8), (uint64_t)&v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7688F8);
  swift_dynamicCast();
  unint64_t v6 = sub_1890C80F0(inited);
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_18C769670);
  a1[3] = result;
  a1[4] = (unint64_t)&off_18A349CF0;
  *a1 = v6;
  return result;
}

uint64_t sub_1890E20E0@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return DeveloperMode.init(from:)(a1, a2);
}

uint64_t sub_1890E20F4(void *a1)
{
  return DeveloperMode.encode(to:)(a1);
}

LightweightCodeRequirements::EntitlementsQuery::DataType_optional __swiftcall EntitlementsQuery.DataType.init(rawValue:)( Swift::Int64 rawValue)
{
  unint64_t v2 = 0x40302010005uLL >> (8 * rawValue);
  *uint64_t v1 = v2;
  return (LightweightCodeRequirements::EntitlementsQuery::DataType_optional)rawValue;
}

uint64_t EntitlementsQuery.DataType.rawValue.getter()
{
  return *v0 + 1LL;
}

BOOL sub_1890E213C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1890E2150()
{
  return sub_1890F18B4();
}

uint64_t sub_1890E2194()
{
  return sub_1890F18A8();
}

uint64_t sub_1890E21C0()
{
  return sub_1890F18B4();
}

LightweightCodeRequirements::EntitlementsQuery::DataType_optional sub_1890E2200(Swift::Int64 *a1)
{
  return EntitlementsQuery.DataType.init(rawValue:)(*a1);
}

void sub_1890E2208(void *a1@<X8>)
{
  *a1 = *v1 + 1LL;
}

uint64_t static EntitlementsQuery.key(_:)(uint64_t a1, uint64_t a2)
{
  return sub_1890E25C8(a1, a2, 1LL);
}

uint64_t sub_1890E2220(uint64_t a1, uint64_t a2)
{
  return sub_1890E2238(a1, a2, 1LL);
}

uint64_t sub_1890E2228(uint64_t a1)
{
  return sub_1890E24A4(a1, 2LL);
}

uint64_t sub_1890E2230(uint64_t a1, uint64_t a2)
{
  return sub_1890E2238(a1, a2, 3LL);
}

uint64_t sub_1890E2238(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 56) = MEMORY[0x18961A4C0];
  *(void *)(v7 + 64) = &off_18A349D38;
  *(void *)(v7 + 32) = a3;
  uint64_t v8 = MEMORY[0x189617FA8];
  *(_OWORD *)(v7 + 16) = xmmword_1890F1C30;
  *(void *)(v7 + 96) = v8;
  *(void *)(v7 + 104) = &off_18A349D50;
  *(void *)(v7 + 72) = a1;
  *(void *)(v7 + 80) = a2;
  uint64_t v9 = *(void **)(v3 + 24);
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v3 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v9 = sub_1890EA74C(0LL, v9[2] + 1LL, 1, v9, &qword_18C7689C8, &qword_18C7696B8);
    *(void *)(v3 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v9;
  }

  unint64_t v12 = v9[2];
  unint64_t v11 = v9[3];
  if (v12 >= v11 >> 1)
  {
    uint64_t v9 = sub_1890EA74C((void *)(v11 > 1), v12 + 1, 1, v9, &qword_18C7689C8, &qword_18C7696B8);
    *(void *)(v3 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v9;
  }

  v9[2] = v12 + 1;
  v9[v12 + 4] = v7;
  return swift_retain();
}

uint64_t sub_1890E2368(uint64_t a1, uint64_t a2)
{
  return sub_1890E2238(a1, a2, 4LL);
}

uint64_t sub_1890E2370(char a1)
{
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1890F1C30;
  *(void *)(v3 + 56) = MEMORY[0x18961A4C0];
  *(void *)(v3 + 64) = &off_18A349D38;
  *(void *)(v3 + 32) = 5LL;
  *(void *)(v3 + 96) = MEMORY[0x1896184C8];
  *(void *)(v3 + 104) = &off_18A349D68;
  *(_BYTE *)(v3 + 72) = a1;
  uint64_t v4 = *(void **)(v1 + 24);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v4 = sub_1890EA74C(0LL, v4[2] + 1LL, 1, v4, &qword_18C7689C8, &qword_18C7696B8);
    *(void *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v4;
  }

  unint64_t v7 = v4[2];
  unint64_t v6 = v4[3];
  if (v7 >= v6 >> 1)
  {
    uint64_t v4 = sub_1890EA74C((void *)(v6 > 1), v7 + 1, 1, v4, &qword_18C7689C8, &qword_18C7696B8);
    *(void *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v4;
  }

  v4[2] = v7 + 1;
  v4[v7 + 4] = v3;
  return swift_retain();
}

uint64_t sub_1890E2494(uint64_t a1, uint64_t a2)
{
  return sub_1890E2238(a1, a2, 6LL);
}

uint64_t sub_1890E249C(uint64_t a1)
{
  return sub_1890E24A4(a1, 7LL);
}

uint64_t sub_1890E24A4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1890F1C30;
  uint64_t v6 = MEMORY[0x18961A4C0];
  *(void *)(v5 + 56) = MEMORY[0x18961A4C0];
  *(void *)(v5 + 64) = &off_18A349D38;
  *(void *)(v5 + 32) = a2;
  *(void *)(v5 + 96) = v6;
  *(void *)(v5 + 104) = &off_18A349D38;
  *(void *)(v5 + 72) = a1;
  unint64_t v7 = *(void **)(v2 + 24);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v7 = sub_1890EA74C(0LL, v7[2] + 1LL, 1, v7, &qword_18C7689C8, &qword_18C7696B8);
    *(void *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v7;
  }

  unint64_t v10 = v7[2];
  unint64_t v9 = v7[3];
  if (v10 >= v9 >> 1)
  {
    unint64_t v7 = sub_1890EA74C((void *)(v9 > 1), v10 + 1, 1, v7, &qword_18C7689C8, &qword_18C7696B8);
    *(void *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v7;
  }

  v7[2] = v10 + 1;
  v7[v10 + 4] = v5;
  return swift_retain();
}

uint64_t sub_1890E25B8(uint64_t a1, uint64_t a2)
{
  return sub_1890E2238(a1, a2, 8LL);
}

uint64_t static EntitlementsQuery.keyPrefix(_:)(uint64_t a1, uint64_t a2)
{
  return sub_1890E25C8(a1, a2, 9LL);
}

uint64_t sub_1890E25C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = MEMORY[0x18961A4C0];
  *(_OWORD *)(v6 + 16) = xmmword_1890F1C30;
  *(void *)(v6 + 56) = v7;
  *(void *)(v6 + 64) = &off_18A349D38;
  *(void *)(v6 + 32) = a3;
  *(void *)(v6 + 96) = MEMORY[0x189617FA8];
  *(void *)(v6 + 104) = &off_18A349D50;
  *(void *)(v6 + 72) = a1;
  *(void *)(v6 + 80) = a2;
  type metadata accessor for EntitlementsQuery();
  uint64_t v8 = swift_allocObject();
  *(_WORD *)(v8 + 16) = 7684;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7689C8);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1890F1C20;
  *(void *)(v9 + 32) = v6;
  *(void *)(v8 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v9;
  swift_bridgeObjectRetain();
  return v8;
}

uint64_t sub_1890E26A0(uint64_t a1, uint64_t a2)
{
  return sub_1890E2238(a1, a2, 9LL);
}

uint64_t sub_1890E26A8(uint64_t a1)
{
  return sub_1890E24A4(a1, 10LL);
}

uint64_t sub_1890E26B0(unsigned __int8 *a1)
{
  uint64_t v2 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7689C0);
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = MEMORY[0x18961A4C0];
  *(_OWORD *)(v3 + 16) = xmmword_1890F1C30;
  *(void *)(v3 + 56) = v4;
  *(void *)(v3 + 64) = &off_18A349D38;
  *(void *)(v3 + 32) = 11LL;
  *(void *)(v3 + 96) = v4;
  *(void *)(v3 + 104) = &off_18A349D38;
  *(void *)(v3 + 72) = v2 + 1;
  uint64_t v5 = *(void **)(v1 + 24);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v5 = sub_1890EA74C(0LL, v5[2] + 1LL, 1, v5, &qword_18C7689C8, &qword_18C7696B8);
    *(void *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v5;
  }

  unint64_t v8 = v5[2];
  unint64_t v7 = v5[3];
  if (v8 >= v7 >> 1)
  {
    uint64_t v5 = sub_1890EA74C((void *)(v7 > 1), v8 + 1, 1, v5, &qword_18C7689C8, &qword_18C7696B8);
    *(void *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v5;
  }

  v5[2] = v8 + 1;
  v5[v8 + 4] = v3;
  return swift_retain();
}

uint64_t sub_1890E27C8@<X0>(unint64_t *a1@<X8>)
{
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1890F1C20;
  *(void *)(inited + 32) = sub_1890EFBB4(*(_BYTE *)(v1 + 16));
  *(void *)(inited + 40) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685E8);
  uint64_t v5 = swift_initStackObject();
  *(_OWORD *)(v5 + 16) = xmmword_1890F1C20;
  *(void *)(v5 + 32) = sub_1890EFBB4(*(_BYTE *)(v1 + 17));
  *(void *)(v5 + 40) = v6;
  *(void *)(v5 + 48) = *(void *)(v1 + 24);
  swift_bridgeObjectRetain();
  *(void *)(inited + 48) = sub_1890C832C(v5);
  unint64_t v7 = sub_1890C8338(inited);
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685F0);
  a1[3] = result;
  a1[4] = (unint64_t)&off_18A349CF0;
  *a1 = v7;
  return result;
}

uint64_t sub_1890E28A4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1890DD9A4(*a1, *a2);
}

uint64_t sub_1890E28B0()
{
  return sub_1890F18B4();
}

uint64_t sub_1890E294C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1890E29C4()
{
  return sub_1890F18B4();
}

uint64_t sub_1890E2A5C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_1890EF578();
  *a1 = result;
  return result;
}

void sub_1890E2A88(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE300000000000000LL;
  unint64_t v4 = 0xEB0000000079654BLL;
  uint64_t v5 = 0x726F74617265706FLL;
  if (v2 != 1)
  {
    uint64_t v5 = 0x65756C6176LL;
    unint64_t v4 = 0xE500000000000000LL;
  }

  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 7955819LL;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_1890E2AE4()
{
  uint64_t v1 = 0x726F74617265706FLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x65756C6176LL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 7955819LL;
  }
}

uint64_t sub_1890E2B3C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_1890EF578();
  *a1 = result;
  return result;
}

uint64_t sub_1890E2B60()
{
  return sub_1890F18D8();
}

uint64_t sub_1890E2B88()
{
  return sub_1890F18E4();
}

uint64_t sub_1890E2BB0(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7689D0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  unint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EA870();
  sub_1890F18CC();
  v23[0] = *(_BYTE *)(v3 + 16);
  v21[0] = 0;
  sub_1890D0828();
  sub_1890F177C();
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  v23[0] = *(_BYTE *)(v3 + 17);
  v21[0] = 1;
  sub_1890F177C();
  v21[0] = 2;
  sub_1890F174C();
  uint64_t v10 = *(void *)(v3 + 24);
  v15[0] = *(void *)(v10 + 16);
  if (v15[0])
  {
    uint64_t v18 = v10 + 32;
    uint64_t result = swift_bridgeObjectRetain();
    unint64_t v11 = 0LL;
    uint64_t v17 = v6;
    uint64_t v16 = result;
    while (v11 < *(void *)(result + 16))
    {
      unint64_t v25 = v11;
      uint64_t v12 = *(void *)(v18 + 8 * v11);
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v23, v24);
      swift_bridgeObjectRetain();
      sub_1890F1800();
      uint64_t v13 = *(void *)(v12 + 16);
      if (v13)
      {
        v15[1] = v12;
        uint64_t v14 = v12 + 32;
        do
        {
          sub_1890D51E0(v14, (uint64_t)v20);
          sub_1890D51E0((uint64_t)v20, (uint64_t)v19);
          __swift_instantiateConcreteTypeFromMangledName(&qword_18C7689E0);
          if (swift_dynamicCast())
          {
            __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v22);
            sub_1890F1830();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
          }

          else
          {
            sub_1890D51E0((uint64_t)v20, (uint64_t)v19);
            if (swift_dynamicCast())
            {
              __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v22);
              sub_1890F180C();
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
              swift_bridgeObjectRelease();
            }

            else
            {
              sub_1890D51E0((uint64_t)v20, (uint64_t)v19);
              uint64_t result = swift_dynamicCast();
              if (!(_DWORD)result) {
                goto LABEL_20;
              }
              __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v22);
              sub_1890F1818();
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
            }
          }

          v14 += 40LL;
          --v13;
        }

        while (v13);
      }

      swift_bridgeObjectRelease();
      unint64_t v11 = v25 + 1;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
      uint64_t v6 = v17;
      uint64_t result = v16;
      if (v11 == v15[0])
      {
        swift_bridgeObjectRelease();
        goto LABEL_18;
      }
    }

    __break(1u);
LABEL_20:
    __break(1u);
  }

  else
  {
LABEL_18:
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  }

  return result;
}

uint64_t EntitlementsQuery.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  EntitlementsQuery.init(from:)(a1);
  return v2;
}

uint64_t EntitlementsQuery.init(from:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7689E8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  unint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EA870();
  sub_1890F18C0();
  if (v2) {
    goto LABEL_14;
  }
  LOBYTE(v31[0]) = 0;
  sub_1890D259C();
  sub_1890F1728();
  uint64_t v35 = v6;
  unsigned __int8 v9 = v33[0];
  *(_BYTE *)(v1 + 16) = v33[0];
  if (sub_1890EFBB4(v9) == 0x6D656C7469746E65LL && v10 == 0xEC00000073746E65LL)
  {
    swift_bridgeObjectRelease();
    uint64_t v11 = v35;
  }

  else
  {
    char v12 = sub_1890F183C();
    swift_bridgeObjectRelease();
    uint64_t v11 = v35;
    if ((v12 & 1) == 0)
    {
LABEL_13:
      sub_1890D25E0();
      swift_allocError();
      *uint64_t v16 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v5);
LABEL_14:
      type metadata accessor for EntitlementsQuery();
      swift_deallocPartialClassInstance();
      goto LABEL_15;
    }
  }

  LOBYTE(v31[0]) = 1;
  sub_1890F1728();
  unsigned __int8 v13 = v33[0];
  *(_BYTE *)(v1 + 17) = v33[0];
  if (sub_1890EFBB4(v13) != 0x797265757124LL || v14 != 0xE600000000000000LL)
  {
    char v15 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v15 & 1) != 0) {
      goto LABEL_10;
    }
    goto LABEL_13;
  }

  swift_bridgeObjectRelease();
LABEL_10:
  LOBYTE(v31[0]) = 2;
  sub_1890F16F8();
  __swift_project_boxed_opaque_existential_1(v33, v34);
  if ((sub_1890F17F4() & 1) != 0)
  {
    uint64_t v27 = (void *)MEMORY[0x18961AFE8];
  }

  else
  {
    uint64_t v27 = (void *)MEMORY[0x18961AFE8];
    do
    {
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v33, v34);
      sub_1890F17B8();
      __swift_project_boxed_opaque_existential_1(v31, v32);
      char v18 = sub_1890F17F4();
      uint64_t v19 = (void *)MEMORY[0x18961AFE8];
      if ((v18 & 1) == 0)
      {
        do
        {
          __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v31, v32);
          uint64_t v23 = sub_1890F17E8();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v19 = sub_1890EA8B4(0LL, v19[2] + 1LL, 1, v19, &qword_18C7689C0, &qword_18C7689E0);
          }
          unint64_t v25 = v19[2];
          unint64_t v24 = v19[3];
          if (v25 >= v24 >> 1) {
            uint64_t v19 = sub_1890EA8B4((void *)(v24 > 1), v25 + 1, 1, v19, &qword_18C7689C0, &qword_18C7689E0);
          }
          uint64_t v30 = &off_18A349D38;
          uint64_t v29 = MEMORY[0x18961A4C0];
          *(void *)&__int128 v28 = v23;
          v19[2] = v25 + 1;
          sub_1890D2660(&v28, (uint64_t)&v19[5 * v25 + 4]);
          __swift_project_boxed_opaque_existential_1(v31, v32);
        }

        while ((sub_1890F17F4() & 1) == 0);
      }

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v27 = sub_1890EA74C(0LL, v27[2] + 1LL, 1, v27, &qword_18C7689C8, &qword_18C7696B8);
      }
      unint64_t v21 = v27[2];
      unint64_t v20 = v27[3];
      uint64_t v11 = v35;
      if (v21 >= v20 >> 1) {
        uint64_t v27 = sub_1890EA74C((void *)(v20 > 1), v21 + 1, 1, v27, &qword_18C7689C8, &qword_18C7696B8);
      }
      uint64_t v22 = v27;
      v27[2] = v21 + 1;
      v22[v21 + 4] = v19;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
      __swift_project_boxed_opaque_existential_1(v33, v34);
    }

    while ((sub_1890F17F4() & 1) == 0);
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v5);
  *(void *)(v3 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v27;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
LABEL_15:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t EntitlementsQuery.deinit()
{
  return v0;
}

uint64_t EntitlementsQuery.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1890E382C@<X0>(unint64_t *a1@<X8>)
{
  return sub_1890E27C8(a1);
}

uint64_t sub_1890E384C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = swift_allocObject();
  uint64_t result = EntitlementsQuery.init(from:)(a1);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

uint64_t sub_1890E38A0(void *a1)
{
  return sub_1890E2BB0(a1);
}

unint64_t InfoPlistHash.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1890E38C8(a1, a2, 5, a3);
}

unint64_t sub_1890E38C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  *(_BYTE *)a4 = a3;
  *(void *)(a4 + 32) = MEMORY[0x189606D70];
  unint64_t result = sub_1890EA488();
  *(void *)(a4 + 40) = result;
  *(void *)(a4 + 8) = a1;
  *(void *)(a4 + 16) = a2;
  return result;
}

uint64_t static InfoPlistHash.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1890E0B1C(a1, 5, a2);
}

{
  return sub_1890E0B1C(a1, 5, a2);
}

uint64_t sub_1890E3920@<X0>(char *a1@<X8>)
{
  return sub_1890E95FC(a1);
}

uint64_t sub_1890E392C@<X0>(char *a1@<X8>)
{
  return sub_1890E9660(a1);
}

uint64_t sub_1890E3938()
{
  return sub_1890F18D8();
}

uint64_t sub_1890E3960()
{
  return sub_1890F18E4();
}

uint64_t InfoPlistHash.encode(to:)(void *a1)
{
  return sub_1890E39B4(a1, &qword_18C7689F0, (void (*)(void))sub_1890EA9EC);
}

uint64_t sub_1890E39B4(void *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v5 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858](v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_1890F18CC();
  LOBYTE(v22) = *v5;
  LOBYTE(v18) = 0;
  sub_1890D0828();
  uint64_t v11 = v26;
  sub_1890F177C();
  if (v11) {
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  sub_1890D51E0((uint64_t)(v5 + 8), (uint64_t)&v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768930);
  if (swift_dynamicCast())
  {
    uint64_t v13 = v18;
    unint64_t v14 = v19;
    uint64_t v22 = v18;
    unint64_t v23 = v19;
    LOBYTE(v18) = 1;
    sub_1890EA5A4();
    sub_1890F177C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return sub_1890D74E0(v13, v14);
  }

  else
  {
    sub_1890D51E0((uint64_t)(v5 + 8), (uint64_t)&v22);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C768910);
    uint64_t result = swift_dynamicCast();
    if ((_DWORD)result)
    {
      uint64_t v15 = v19;
      unint64_t v16 = v20;
      LOBYTE(v22) = v18;
      unint64_t v23 = v19;
      unint64_t v24 = v20;
      uint64_t v25 = v21;
      LOBYTE(v18) = 1;
      sub_1890EAE38(&qword_18C768938, &qword_18C768910, (uint64_t)&unk_1890F6A24);
      sub_1890F177C();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      sub_1890EA590(v15, v16);
      return swift_bridgeObjectRelease();
    }

    else
    {
      __break(1u);
    }
  }

  return result;
}

uint64_t InfoPlistHash.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768A00);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EA9EC();
  sub_1890F18C0();
  if (!v2)
  {
    char v21 = 0;
    sub_1890D259C();
    sub_1890F1728();
    LOBYTE(v20[0]) = v17;
    if (sub_1890EFBB4(v17) == 0x696C702D6F666E69LL && v10 == 0xEF687361682D7473LL)
    {
      swift_bridgeObjectRelease();
    }

    else
    {
      char v11 = sub_1890F183C();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_1890D25E0();
        swift_allocError();
        *uint64_t v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }

    char v21 = 1;
    sub_1890EA5E8();
    uint64_t v12 = MEMORY[0x189606D70];
    sub_1890F1728();
    __int128 v14 = v17;
    uint64_t v18 = v12;
    unint64_t v19 = sub_1890EA488();
    __int128 v17 = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_1890D2660(&v17, (uint64_t)v20 + 8);
    __int128 v15 = v20[1];
    *a2 = v20[0];
    a2[1] = v15;
    a2[2] = v20[2];
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1890E3F54@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v7 = MEMORY[0x189606D70];
  if ((swift_dynamicCast() & 1) != 0)
  {
    uint64_t v8 = v18;
    uint64_t v9 = v19;
    *(_BYTE *)a3 = a2;
    *(void *)(a3 + 32) = v7;
    *(void *)(a3 + 40) = sub_1890EA488();
    *(void *)(a3 + 8) = v8;
    *(void *)(a3 + 16) = v9;
  }

  else
  {
    sub_1890D51E0(a1, (uint64_t)v22);
    sub_1890DE404((uint64_t)v22, (uint64_t)&v18);
    if (!v3)
    {
      char v10 = v18;
      uint64_t v12 = v19;
      unint64_t v11 = v20;
      uint64_t v23 = v21;
      if (sub_1890EFBB4(v18) == 7235876 && v13 == 0xE300000000000000LL)
      {
        swift_bridgeObjectRelease();
      }

      else
      {
        char v14 = sub_1890F183C();
        swift_bridgeObjectRelease();
        if ((v14 & 1) == 0)
        {
          sub_1890D25E0();
          swift_allocError();
          *uint64_t v16 = 1;
          swift_willThrow();
          sub_1890EA590(v12, v11);
          swift_bridgeObjectRelease();
          return __swift_destroy_boxed_opaque_existential_1(a1);
        }
      }

      *(_BYTE *)a3 = a2;
      *(void *)(a3 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768910);
      *(void *)(a3 + 40) = sub_1890EAE38(&qword_18C768918, &qword_18C768910, (uint64_t)&unk_1890F6A9C);
      uint64_t v15 = swift_allocObject();
      *(void *)(a3 + 8) = v15;
      *(_BYTE *)(v15 + 16) = v10;
      *(void *)(v15 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v12;
      *(void *)(v15 + 32) = v11;
      *(void *)(v15 + 40) = v23;
    }
  }

  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_1890E4138@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return InfoPlistHash.init(from:)(a1, a2);
}

uint64_t sub_1890E414C(void *a1)
{
  return InfoPlistHash.encode(to:)(a1);
}

void InTrustCacheWithConstraintCategory.init()(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 6;
  *(void *)(a1 + 32) = MEMORY[0x1896184C8];
  *(void *)(a1 + 40) = &off_18A3472C0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t InTrustCacheWithConstraintCategory.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x1896184C8];
  *(_BYTE *)a2 = 6;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = &off_18A3472C0;
  *(_BYTE *)(a2 + 8) = result;
  return result;
}

uint64_t sub_1890E41AC@<X0>(char *a1@<X8>)
{
  return sub_1890E95FC(a1);
}

uint64_t sub_1890E41B8@<X0>(char *a1@<X8>)
{
  return sub_1890E9660(a1);
}

uint64_t sub_1890E41C4()
{
  return sub_1890F18D8();
}

uint64_t sub_1890E41EC()
{
  return sub_1890F18E4();
}

uint64_t InTrustCacheWithConstraintCategory.encode(to:)(void *a1)
{
  return sub_1890E4240(a1, &qword_18C768A08, (void (*)(void))sub_1890EAA30);
}

uint64_t sub_1890E4240(void *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v6 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v12 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  char v10 = &v13[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_1890F18CC();
  v13[0] = *v6;
  v13[55] = 0;
  sub_1890D0828();
  sub_1890F177C();
  if (!v4)
  {
    sub_1890D51E0((uint64_t)(v6 + 8), (uint64_t)v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7688F8);
    swift_dynamicCast();
    v13[0] = 1;
    sub_1890F1770();
  }

  return (*(uint64_t (**)(_BYTE *, uint64_t))(v12 + 8))(v10, v8);
}

uint64_t InTrustCacheWithConstraintCategory.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768A18);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EAA30();
  sub_1890F18C0();
  if (!v2)
  {
    char v20 = 0;
    sub_1890D259C();
    sub_1890F1728();
    LOBYTE(v19[0]) = v16;
    if (sub_1890EFBB4(v16) == 0xD00000000000001ELL && v9 == 0x80000001890F71E0LL)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }

    char v10 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
    {
LABEL_7:
      char v20 = 1;
      char v11 = sub_1890F171C();
      uint64_t v17 = MEMORY[0x1896184C8];
      uint64_t v18 = &off_18A3472C0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_1890D2660(&v16, (uint64_t)v19 + 8);
      __int128 v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }

    sub_1890D25E0();
    swift_allocError();
    *uint64_t v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1890E45E4@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return InTrustCacheWithConstraintCategory.init(from:)(a1, a2);
}

uint64_t sub_1890E45F8(void *a1)
{
  return InTrustCacheWithConstraintCategory.encode(to:)(a1);
}

void IsInitProcess.init()(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 7;
  *(void *)(a1 + 32) = MEMORY[0x1896184C8];
  *(void *)(a1 + 40) = &off_18A3472C0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t IsInitProcess.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x1896184C8];
  *(_BYTE *)a2 = 7;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = &off_18A3472C0;
  *(_BYTE *)(a2 + 8) = result;
  return result;
}

uint64_t sub_1890E4658@<X0>(char *a1@<X8>)
{
  return sub_1890E95FC(a1);
}

uint64_t sub_1890E4664@<X0>(char *a1@<X8>)
{
  return sub_1890E9660(a1);
}

uint64_t sub_1890E4670()
{
  return sub_1890F18D8();
}

uint64_t sub_1890E4698()
{
  return sub_1890F18E4();
}

uint64_t IsInitProcess.encode(to:)(void *a1)
{
  return sub_1890E4240(a1, &qword_18C768A20, (void (*)(void))sub_1890EAA74);
}

uint64_t IsInitProcess.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768A30);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EAA74();
  sub_1890F18C0();
  if (!v2)
  {
    char v20 = 0;
    sub_1890D259C();
    sub_1890F1728();
    LOBYTE(v19[0]) = v16;
    if (sub_1890EFBB4(v16) == 0x2D74696E692D7369LL && v9 == 0xEC000000636F7270LL)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }

    char v10 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
    {
LABEL_7:
      char v20 = 1;
      char v11 = sub_1890F171C();
      uint64_t v17 = MEMORY[0x1896184C8];
      uint64_t v18 = &off_18A3472C0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_1890D2660(&v16, (uint64_t)v19 + 8);
      __int128 v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }

    sub_1890D25E0();
    swift_allocError();
    *uint64_t v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1890E4938@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return IsInitProcess.init(from:)(a1, a2);
}

uint64_t sub_1890E494C(void *a1)
{
  return IsInitProcess.encode(to:)(a1);
}

void IsMainBinary.init()(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 8;
  *(void *)(a1 + 32) = MEMORY[0x1896184C8];
  *(void *)(a1 + 40) = &off_18A3472C0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t IsMainBinary.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x1896184C8];
  *(_BYTE *)a2 = 8;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = &off_18A3472C0;
  *(_BYTE *)(a2 + 8) = result;
  return result;
}

uint64_t sub_1890E49AC@<X0>(char *a1@<X8>)
{
  return sub_1890E95FC(a1);
}

uint64_t sub_1890E49B8@<X0>(char *a1@<X8>)
{
  return sub_1890E9660(a1);
}

uint64_t sub_1890E49C4()
{
  return sub_1890F18D8();
}

uint64_t sub_1890E49EC()
{
  return sub_1890F18E4();
}

uint64_t IsMainBinary.encode(to:)(void *a1)
{
  return sub_1890E4240(a1, &qword_18C768A38, (void (*)(void))sub_1890EAAB8);
}

uint64_t IsMainBinary.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768A48);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EAAB8();
  sub_1890F18C0();
  if (!v2)
  {
    char v20 = 0;
    sub_1890D259C();
    sub_1890F1728();
    LOBYTE(v19[0]) = v16;
    if (sub_1890EFBB4(v16) == 0x2D6E69616D2D7369LL && v9 == 0xEE007972616E6962LL)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }

    char v10 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
    {
LABEL_7:
      char v20 = 1;
      char v11 = sub_1890F171C();
      uint64_t v17 = MEMORY[0x1896184C8];
      uint64_t v18 = &off_18A3472C0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_1890D2660(&v16, (uint64_t)v19 + 8);
      __int128 v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }

    sub_1890D25E0();
    swift_allocError();
    *uint64_t v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1890E4C98@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return IsMainBinary.init(from:)(a1, a2);
}

uint64_t sub_1890E4CAC(void *a1)
{
  return IsMainBinary.encode(to:)(a1);
}

void IsSIPProtected.init()(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 9;
  *(void *)(a1 + 32) = MEMORY[0x1896184C8];
  *(void *)(a1 + 40) = &off_18A3472C0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t IsSIPProtected.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x1896184C8];
  *(_BYTE *)a2 = 9;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = &off_18A3472C0;
  *(_BYTE *)(a2 + 8) = result;
  return result;
}

uint64_t sub_1890E4D0C@<X0>(char *a1@<X8>)
{
  return sub_1890E95FC(a1);
}

uint64_t sub_1890E4D18@<X0>(char *a1@<X8>)
{
  return sub_1890E9660(a1);
}

uint64_t sub_1890E4D24()
{
  return sub_1890F18D8();
}

uint64_t sub_1890E4D4C()
{
  return sub_1890F18E4();
}

uint64_t IsSIPProtected.encode(to:)(void *a1)
{
  return sub_1890E4240(a1, &qword_18C768A50, (void (*)(void))sub_1890EAAFC);
}

uint64_t IsSIPProtected.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768A60);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EAAFC();
  sub_1890F18C0();
  if (!v2)
  {
    char v20 = 0;
    sub_1890D259C();
    sub_1890F1728();
    LOBYTE(v19[0]) = v16;
    if (sub_1890EFBB4(v16) == 0xD000000000000010LL && v9 == 0x80000001890F7220LL)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }

    char v10 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
    {
LABEL_7:
      char v20 = 1;
      char v11 = sub_1890F171C();
      uint64_t v17 = MEMORY[0x1896184C8];
      uint64_t v18 = &off_18A3472C0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_1890D2660(&v16, (uint64_t)v19 + 8);
      __int128 v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }

    sub_1890D25E0();
    swift_allocError();
    *uint64_t v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1890E4FD4@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return IsSIPProtected.init(from:)(a1, a2);
}

uint64_t sub_1890E4FE8(void *a1)
{
  return IsSIPProtected.encode(to:)(a1);
}

uint64_t LaunchType.Value.rawValue.getter()
{
  return *(void *)v0;
}

unint64_t LaunchType.Value.init(rawValue:)@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  if (result <= 3) {
    unint64_t v2 = result;
  }
  else {
    unint64_t v2 = 0LL;
  }
  *(void *)a2 = v2;
  *(_BYTE *)(a2 + 8) = result > 3;
  return result;
}

void static LaunchType.Value.none.getter(void *a1@<X8>)
{
  *a1 = 0LL;
}

void static LaunchType.Value.application.getter(void *a1@<X8>)
{
  *a1 = 3LL;
}

uint64_t sub_1890E5030()
{
  return sub_1890F1614();
}

uint64_t sub_1890E508C()
{
  return sub_1890F15FC();
}

uint64_t sub_1890E50DC()
{
  return sub_1890F18A8();
}

uint64_t *sub_1890E5108@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 3;
  *(void *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

uint64_t *LaunchType.init(_:)@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  uint64_t v3 = MEMORY[0x18961A4C0];
  *(_BYTE *)a2 = 10;
  *(void *)(a2 + 32) = v3;
  *(void *)(a2 + 40) = &off_18A3472D8;
  *(void *)(a2 + 8) = v2;
  return result;
}

uint64_t static LaunchType.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1890E518C(a1, 10, &qword_18C768A68, &qword_18C768A70, a2);
}

{
  return sub_1890E518C(a1, 10, &qword_18C768A68, &qword_18C768A70, a2);
}

uint64_t sub_1890E518C@<X0>( uint64_t a1@<X0>, char a2@<W1>, uint64_t *a3@<X2>, unint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  *(_BYTE *)a5 = a2;
  *(void *)(a5 + 32) = __swift_instantiateConcreteTypeFromMangledName(a3);
  *(void *)(a5 + 40) = sub_1890EAE38(a4, a3, (uint64_t)&unk_1890F6710);
  uint64_t v9 = swift_allocObject();
  *(void *)(a5 + 8) = v9;
  *(_BYTE *)(v9 + 16) = 22;
  *(void *)(v9 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = 0LL;
  *(_BYTE *)(v9 + 32) = 1;
  *(void *)(v9 + 40) = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1890E5220@<X0>(char *a1@<X8>)
{
  return sub_1890E95FC(a1);
}

uint64_t sub_1890E522C@<X0>(char *a1@<X8>)
{
  return sub_1890E9660(a1);
}

uint64_t sub_1890E5238()
{
  return sub_1890F18D8();
}

uint64_t sub_1890E5260()
{
  return sub_1890F18E4();
}

uint64_t LaunchType.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768A78);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EAB40();
  sub_1890F18CC();
  v15[0] = *v3;
  LOBYTE(v11) = 0;
  sub_1890D0828();
  sub_1890F177C();
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_1890D51E0((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768A88);
  if (swift_dynamicCast())
  {
    v15[0] = 1;
    sub_1890F1788();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  sub_1890D51E0((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768A68);
  uint64_t result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    v15[0] = v11;
    uint64_t v16 = v12;
    char v17 = v13;
    uint64_t v18 = v14;
    LOBYTE(v11) = 1;
    sub_1890EAE38(&qword_18C768A90, &qword_18C768A68, (uint64_t)&unk_1890F6A24);
    sub_1890F177C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t LaunchType.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768A98);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EAB40();
  sub_1890F18C0();
  if (!v2)
  {
    char v20 = 0;
    sub_1890D259C();
    sub_1890F1728();
    LOBYTE(v19[0]) = v16;
    if (sub_1890EFBB4(v16) == 0x742D68636E75616CLL && v10 == 0xEB00000000657079LL)
    {
      swift_bridgeObjectRelease();
    }

    else
    {
      char v11 = sub_1890F183C();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_1890D25E0();
        swift_allocError();
        *char v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }

    LOBYTE(v16) = 1;
    uint64_t v12 = sub_1890F1734();
    uint64_t v17 = MEMORY[0x18961A4C0];
    uint64_t v18 = &off_18A3472D8;
    *(void *)&__int128 v16 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_1890D2660(&v16, (uint64_t)v19 + 8);
    __int128 v14 = v19[1];
    *a2 = v19[0];
    a2[1] = v14;
    a2[2] = v19[2];
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1890E57BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = MEMORY[0x18961A4C0];
  if ((swift_dynamicCast() & 1) != 0)
  {
    uint64_t v6 = v38[0];
    if (v38[0] < 4uLL)
    {
      *(_BYTE *)a2 = 10;
      *(void *)(a2 + 32) = v5;
      *(void *)(a2 + 40) = &off_18A3472D8;
      *(void *)(a2 + 8) = v6;
LABEL_19:
      uint64_t v18 = (uint64_t *)a1;
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    }

uint64_t sub_1890E5BF0@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return LaunchType.init(from:)(a1, a2);
}

uint64_t sub_1890E5C04(void *a1)
{
  return LaunchType.encode(to:)(a1);
}

uint64_t sub_1890E5C18@<X0>(unint64_t *a1@<X8>)
{
  return sub_1890E0318(&qword_18C768A68, a1);
}

void OnAuthorizedAuthAPFSVolume.init()(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 11;
  *(void *)(a1 + 32) = MEMORY[0x1896184C8];
  *(void *)(a1 + 40) = &off_18A3472C0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t OnAuthorizedAuthAPFSVolume.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x1896184C8];
  *(_BYTE *)a2 = 11;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = &off_18A3472C0;
  *(_BYTE *)(a2 + 8) = result;
  return result;
}

uint64_t sub_1890E5C80@<X0>(char *a1@<X8>)
{
  return sub_1890E95FC(a1);
}

uint64_t sub_1890E5C8C@<X0>(char *a1@<X8>)
{
  return sub_1890E9660(a1);
}

uint64_t sub_1890E5C98()
{
  return sub_1890F18D8();
}

uint64_t sub_1890E5CC0()
{
  return sub_1890F18E4();
}

uint64_t OnAuthorizedAuthAPFSVolume.encode(to:)(void *a1)
{
  return sub_1890E4240(a1, &qword_18C768AA8, (void (*)(void))sub_1890EAB84);
}

uint64_t OnAuthorizedAuthAPFSVolume.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768AB8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EAB84();
  sub_1890F18C0();
  if (!v2)
  {
    char v20 = 0;
    sub_1890D259C();
    sub_1890F1728();
    LOBYTE(v19[0]) = v16;
    if (sub_1890EFBB4(v16) == 0xD00000000000001DLL && v9 == 0x80000001890F7240LL)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }

    char v10 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
    {
LABEL_7:
      char v20 = 1;
      char v11 = sub_1890F171C();
      uint64_t v17 = MEMORY[0x1896184C8];
      uint64_t v18 = &off_18A3472C0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_1890D2660(&v16, (uint64_t)v19 + 8);
      __int128 v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }

    sub_1890D25E0();
    swift_allocError();
    *char v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1890E5F48@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return OnAuthorizedAuthAPFSVolume.init(from:)(a1, a2);
}

uint64_t sub_1890E5F5C(void *a1)
{
  return OnAuthorizedAuthAPFSVolume.encode(to:)(a1);
}

void OnSystemVolume.init()(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 12;
  *(void *)(a1 + 32) = MEMORY[0x1896184C8];
  *(void *)(a1 + 40) = &off_18A3472C0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t OnSystemVolume.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x1896184C8];
  *(_BYTE *)a2 = 12;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = &off_18A3472C0;
  *(_BYTE *)(a2 + 8) = result;
  return result;
}

uint64_t sub_1890E5FBC@<X0>(char *a1@<X8>)
{
  return sub_1890E95FC(a1);
}

uint64_t sub_1890E5FC8@<X0>(char *a1@<X8>)
{
  return sub_1890E9660(a1);
}

uint64_t sub_1890E5FD4()
{
  return sub_1890F18D8();
}

uint64_t sub_1890E5FFC()
{
  return sub_1890F18E4();
}

uint64_t OnSystemVolume.encode(to:)(void *a1)
{
  return sub_1890E4240(a1, &qword_18C768AC0, (void (*)(void))sub_1890EABC8);
}

uint64_t OnSystemVolume.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768AD0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EABC8();
  sub_1890F18C0();
  if (!v2)
  {
    char v20 = 0;
    sub_1890D259C();
    sub_1890F1728();
    LOBYTE(v19[0]) = v16;
    if (sub_1890EFBB4(v16) == 0xD000000000000010LL && v9 == 0x80000001890F7260LL)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }

    char v10 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
    {
LABEL_7:
      char v20 = 1;
      char v11 = sub_1890F171C();
      uint64_t v17 = MEMORY[0x1896184C8];
      uint64_t v18 = &off_18A3472C0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_1890D2660(&v16, (uint64_t)v19 + 8);
      __int128 v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }

    sub_1890D25E0();
    swift_allocError();
    *char v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1890E6284@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return OnSystemVolume.init(from:)(a1, a2);
}

uint64_t sub_1890E6298(void *a1)
{
  return OnSystemVolume.encode(to:)(a1);
}

uint64_t OSEnvironment.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_BYTE *)a3 = 13;
  *(void *)(a3 + 32) = MEMORY[0x189617FA8];
  *(void *)(a3 + 40) = &off_18A347290;
  *(void *)(a3 + 8) = result;
  *(void *)(a3 + 16) = a2;
  return result;
}

uint64_t static OSEnvironment.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1890E62E0(a1, 13, a2);
}

{
  return sub_1890E62E0(a1, 13, a2);
}

uint64_t sub_1890E62E0@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  *(_BYTE *)a3 = a2;
  *(void *)(a3 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768AD8);
  *(void *)(a3 + 40) = sub_1890EAE38(&qword_18C768AE0, &qword_18C768AD8, (uint64_t)&unk_1890F6604);
  uint64_t v5 = swift_allocObject();
  *(void *)(a3 + 8) = v5;
  *(_BYTE *)(v5 + 16) = 22;
  *(void *)(v5 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = 0LL;
  *(void *)(v5 + 32) = 0LL;
  *(void *)(v5 + 40) = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1890E6368@<X0>(char *a1@<X8>)
{
  return sub_1890E95FC(a1);
}

uint64_t sub_1890E6374@<X0>(char *a1@<X8>)
{
  return sub_1890E9660(a1);
}

uint64_t sub_1890E6380()
{
  return sub_1890F18D8();
}

uint64_t sub_1890E63A8()
{
  return sub_1890F18E4();
}

uint64_t OSEnvironment.encode(to:)(void *a1)
{
  return sub_1890E846C(a1, &qword_18C768AE8, (void (*)(void))sub_1890EAC38);
}

uint64_t OSEnvironment.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768B08);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EAC38();
  sub_1890F18C0();
  if (!v2)
  {
    char v21 = 0;
    sub_1890D259C();
    sub_1890F1728();
    LOBYTE(v20[0]) = v17;
    if (sub_1890EFBB4(v17) == 0x7269766E652D736FLL && v10 == 0xEE00746E656D6E6FLL)
    {
      swift_bridgeObjectRelease();
    }

    else
    {
      char v11 = sub_1890F183C();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_1890D25E0();
        swift_allocError();
        *char v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }

    LOBYTE(v17) = 1;
    uint64_t v12 = sub_1890F1710();
    uint64_t v18 = MEMORY[0x189617FA8];
    uint64_t v19 = &off_18A347290;
    *(void *)&__int128 v17 = v12;
    *((void *)&v17 + 1) = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_1890D2660(&v17, (uint64_t)v20 + 8);
    __int128 v15 = v20[1];
    *a2 = v20[0];
    a2[1] = v15;
    a2[2] = v20[2];
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1890E6710@<X0>(unint64_t *a1@<X8>)
{
  return sub_1890DFCE4(a1);
}

uint64_t sub_1890E6724@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return OSEnvironment.init(from:)(a1, a2);
}

uint64_t sub_1890E6738(void *a1)
{
  return OSEnvironment.encode(to:)(a1);
}

uint64_t PlatformType.Value.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t PlatformType.Value.init(rawValue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  else {
    uint64_t v2 = 0LL;
  }
  *(void *)a2 = v2;
  *(_BYTE *)(a2 + 8) = (unint64_t)(result - 13) < 0xFFFFFFFFFFFFFFF4LL;
  return result;
}

void static PlatformType.Value.bridgeOS.getter(void *a1@<X8>)
{
  *a1 = 5LL;
}

void static PlatformType.Value.macCatalyst.getter(void *a1@<X8>)
{
  *a1 = 6LL;
}

void static PlatformType.Value.iOSSimulator.getter(void *a1@<X8>)
{
  *a1 = 7LL;
}

void static PlatformType.Value.watchOSSimulator.getter(void *a1@<X8>)
{
  *a1 = 9LL;
}

void static PlatformType.Value.driverKit.getter(void *a1@<X8>)
{
  *a1 = 10LL;
}

void static PlatformType.Value.visionOS.getter(void *a1@<X8>)
{
  *a1 = 11LL;
}

void static PlatformType.Value.visionOSSimulator.getter(void *a1@<X8>)
{
  *a1 = 12LL;
}

uint64_t sub_1890E67C4()
{
  return sub_1890F1614();
}

uint64_t sub_1890E6820()
{
  return sub_1890F15FC();
}

uint64_t *sub_1890E686C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  unint64_t v3 = *result - 13;
  BOOL v4 = __CFADD__(v3, 12LL);
  BOOL v5 = v3 < 0xFFFFFFFFFFFFFFF4LL;
  if (!v4) {
    uint64_t v2 = 0LL;
  }
  *(void *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v5;
  return result;
}

uint64_t *PlatformType.init(_:)@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  uint64_t v3 = MEMORY[0x18961A4C0];
  *(_BYTE *)a2 = 15;
  *(void *)(a2 + 32) = v3;
  *(void *)(a2 + 40) = &off_18A3472D8;
  *(void *)(a2 + 8) = v2;
  return result;
}

uint64_t static PlatformType.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1890E518C(a1, 15, &qword_18C768B18, &qword_18C768B20, a2);
}

{
  return sub_1890E518C(a1, 15, &qword_18C768B18, &qword_18C768B20, a2);
}

uint64_t sub_1890E68F4@<X0>(char *a1@<X8>)
{
  return sub_1890E95FC(a1);
}

uint64_t sub_1890E6900@<X0>(char *a1@<X8>)
{
  return sub_1890E9660(a1);
}

uint64_t sub_1890E690C()
{
  return sub_1890F18D8();
}

uint64_t sub_1890E6934()
{
  return sub_1890F18E4();
}

uint64_t PlatformType.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768B28);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EACA0();
  sub_1890F18CC();
  v15[0] = *v3;
  LOBYTE(v11) = 0;
  sub_1890D0828();
  sub_1890F177C();
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_1890D51E0((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768A88);
  if (swift_dynamicCast())
  {
    v15[0] = 1;
    sub_1890F1788();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  sub_1890D51E0((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768B18);
  uint64_t result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    v15[0] = v11;
    uint64_t v16 = v12;
    char v17 = v13;
    uint64_t v18 = v14;
    LOBYTE(v11) = 1;
    sub_1890EAE38(&qword_18C768B38, &qword_18C768B18, (uint64_t)&unk_1890F6A24);
    sub_1890F177C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t PlatformType.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768B40);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EACA0();
  sub_1890F18C0();
  if (!v2)
  {
    char v20 = 0;
    sub_1890D259C();
    sub_1890F1728();
    LOBYTE(v19[0]) = v16;
    if (sub_1890EFBB4(v16) == 0x6D726F6674616C70LL && v10 == 0xE800000000000000LL)
    {
      swift_bridgeObjectRelease();
    }

    else
    {
      char v11 = sub_1890F183C();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_1890D25E0();
        swift_allocError();
        *char v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }

    LOBYTE(v16) = 1;
    uint64_t v12 = sub_1890F1734();
    uint64_t v17 = MEMORY[0x18961A4C0];
    uint64_t v18 = &off_18A3472D8;
    *(void *)&__int128 v16 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_1890D2660(&v16, (uint64_t)v19 + 8);
    __int128 v14 = v19[1];
    *a2 = v19[0];
    a2[1] = v14;
    a2[2] = v19[2];
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1890E6E78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = MEMORY[0x18961A4C0];
  if ((swift_dynamicCast() & 1) != 0)
  {
    uint64_t v6 = v38[0];
    if ((unint64_t)(v38[0] - 13) > 0xFFFFFFFFFFFFFFF3LL)
    {
      *(_BYTE *)a2 = 15;
      *(void *)(a2 + 32) = v5;
      *(void *)(a2 + 40) = &off_18A3472D8;
      *(void *)(a2 + 8) = v6;
LABEL_19:
      uint64_t v18 = (uint64_t *)a1;
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    }

uint64_t sub_1890E72B4@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return PlatformType.init(from:)(a1, a2);
}

uint64_t sub_1890E72C8(void *a1)
{
  return PlatformType.encode(to:)(a1);
}

uint64_t sub_1890E72DC@<X0>(unint64_t *a1@<X8>)
{
  return sub_1890E0318(&qword_18C768B18, a1);
}

uint64_t PlatformIdentifier.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x18961A4C0];
  *(_BYTE *)a2 = 14;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = &off_18A3472D8;
  *(void *)(a2 + 8) = result;
  return result;
}

uint64_t static PlatformIdentifier.greaterThan(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_BYTE *)a2 = 14;
  *(void *)(a2 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768970);
  *(void *)(a2 + 40) = sub_1890EAE38(&qword_18C768B50, &qword_18C768970, (uint64_t)&unk_1890F6710);
  uint64_t result = swift_allocObject();
  *(void *)(a2 + 8) = result;
  *(_BYTE *)(result + 16) = 24;
  *(void *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = a1;
  *(_BYTE *)(result + 32) = 0;
  *(void *)(result + 40) = 0LL;
  return result;
}

uint64_t static PlatformIdentifier.greaterThanOrEqual(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_BYTE *)a2 = 14;
  *(void *)(a2 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768970);
  *(void *)(a2 + 40) = sub_1890EAE38(&qword_18C768B50, &qword_18C768970, (uint64_t)&unk_1890F6710);
  uint64_t result = swift_allocObject();
  *(void *)(a2 + 8) = result;
  *(_BYTE *)(result + 16) = 25;
  *(void *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = a1;
  *(_BYTE *)(result + 32) = 0;
  *(void *)(result + 40) = 0LL;
  return result;
}

uint64_t static PlatformIdentifier.lessThan(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_BYTE *)a2 = 14;
  *(void *)(a2 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768970);
  *(void *)(a2 + 40) = sub_1890EAE38(&qword_18C768B50, &qword_18C768970, (uint64_t)&unk_1890F6710);
  uint64_t result = swift_allocObject();
  *(void *)(a2 + 8) = result;
  *(_BYTE *)(result + 16) = 26;
  *(void *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = a1;
  *(_BYTE *)(result + 32) = 0;
  *(void *)(result + 40) = 0LL;
  return result;
}

uint64_t static PlatformIdentifier.lessThanOrEqual(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_BYTE *)a2 = 14;
  *(void *)(a2 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768970);
  *(void *)(a2 + 40) = sub_1890EAE38(&qword_18C768B50, &qword_18C768970, (uint64_t)&unk_1890F6710);
  uint64_t result = swift_allocObject();
  *(void *)(a2 + 8) = result;
  *(_BYTE *)(result + 16) = 27;
  *(void *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = a1;
  *(_BYTE *)(result + 32) = 0;
  *(void *)(result + 40) = 0LL;
  return result;
}

uint64_t static PlatformIdentifier.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1890E518C(a1, 14, &qword_18C768970, &qword_18C768B50, a2);
}

{
  return sub_1890E518C(a1, 14, &qword_18C768970, &qword_18C768B50, a2);
}

uint64_t sub_1890E758C@<X0>(char *a1@<X8>)
{
  return sub_1890E95FC(a1);
}

uint64_t sub_1890E7598@<X0>(char *a1@<X8>)
{
  return sub_1890E9660(a1);
}

uint64_t sub_1890E75A4()
{
  return sub_1890F18D8();
}

uint64_t sub_1890E75CC()
{
  return sub_1890F18E4();
}

uint64_t PlatformIdentifier.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768B58);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EACE4();
  sub_1890F18CC();
  v15[0] = *v3;
  LOBYTE(v11) = 0;
  sub_1890D0828();
  sub_1890F177C();
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_1890D51E0((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768A88);
  if (swift_dynamicCast())
  {
    v15[0] = 1;
    sub_1890F1788();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  sub_1890D51E0((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768970);
  uint64_t result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    v15[0] = v11;
    uint64_t v16 = v12;
    char v17 = v13;
    uint64_t v18 = v14;
    LOBYTE(v11) = 1;
    sub_1890EAE38(&qword_18C768978, &qword_18C768970, (uint64_t)&unk_1890F6A24);
    sub_1890F177C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t PlatformIdentifier.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768B68);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EACE4();
  sub_1890F18C0();
  if (!v2)
  {
    char v20 = 0;
    sub_1890D259C();
    sub_1890F1728();
    LOBYTE(v19[0]) = v16;
    if (sub_1890EFBB4(v16) == 0xD000000000000013LL && v10 == 0x80000001890F7280LL)
    {
      swift_bridgeObjectRelease();
    }

    else
    {
      char v11 = sub_1890F183C();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_1890D25E0();
        swift_allocError();
        *char v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }

    LOBYTE(v16) = 1;
    uint64_t v12 = sub_1890F1734();
    uint64_t v17 = MEMORY[0x18961A4C0];
    uint64_t v18 = &off_18A3472D8;
    *(void *)&__int128 v16 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_1890D2660(&v16, (uint64_t)v19 + 8);
    __int128 v14 = v19[1];
    *a2 = v19[0];
    a2[1] = v14;
    a2[2] = v19[2];
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1890E7B10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = MEMORY[0x18961A4C0];
  if ((swift_dynamicCast() & 1) != 0)
  {
    *(_BYTE *)a2 = 14;
    *(void *)(a2 + 32) = v5;
    *(void *)(a2 + 40) = &off_18A3472D8;
    *(void *)(a2 + 8) = v17;
  }

  else
  {
    sub_1890D51E0(a1, (uint64_t)v18);
    uint64_t v6 = sub_1890DE614((uint64_t)v18);
    if (!v2)
    {
      char v10 = v6;
      uint64_t v11 = v7;
      char v12 = v8;
      uint64_t v13 = v9;
      if ((sub_1890E7C98(v6, (uint64_t)&unk_18A345760) & 1) != 0)
      {
        *(_BYTE *)a2 = 14;
        *(void *)(a2 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768970);
        *(void *)(a2 + 40) = sub_1890EAE38(&qword_18C768B50, &qword_18C768970, (uint64_t)&unk_1890F6710);
        uint64_t v14 = swift_allocObject();
        *(void *)(a2 + 8) = v14;
        *(_BYTE *)(v14 + 16) = v10;
        *(void *)(v14 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v11;
        *(_BYTE *)(v14 + 32) = v12 & 1;
        *(void *)(v14 + 40) = v13;
      }

      else
      {
        swift_bridgeObjectRelease();
        sub_1890D25E0();
        swift_allocError();
        *uint64_t v15 = 1;
        swift_willThrow();
      }
    }
  }

  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_1890E7C98(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    swift_bridgeObjectRetain();
    __asm { BR              X9 }
  }

  return 0LL;
}

uint64_t sub_1890E8368@<X0>(unint64_t *a1@<X8>)
{
  return sub_1890E011C(a1);
}

uint64_t sub_1890E837C@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return PlatformIdentifier.init(from:)(a1, a2);
}

uint64_t sub_1890E8390(void *a1)
{
  return PlatformIdentifier.encode(to:)(a1);
}

uint64_t SigningIdentifier.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_BYTE *)a3 = 16;
  *(void *)(a3 + 32) = MEMORY[0x189617FA8];
  *(void *)(a3 + 40) = &off_18A347290;
  *(void *)(a3 + 8) = result;
  *(void *)(a3 + 16) = a2;
  return result;
}

uint64_t static SigningIdentifier.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1890E62E0(a1, 16, a2);
}

{
  return sub_1890E62E0(a1, 16, a2);
}

uint64_t sub_1890E83D8@<X0>(char *a1@<X8>)
{
  return sub_1890E95FC(a1);
}

uint64_t sub_1890E83E4@<X0>(char *a1@<X8>)
{
  return sub_1890E9660(a1);
}

uint64_t sub_1890E83F0()
{
  return sub_1890F18D8();
}

uint64_t sub_1890E8418()
{
  return sub_1890F18E4();
}

uint64_t SigningIdentifier.encode(to:)(void *a1)
{
  return sub_1890E846C(a1, &qword_18C768B70, (void (*)(void))sub_1890EAD28);
}

uint64_t sub_1890E846C(void *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v5 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858](v7);
  char v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_1890F18CC();
  v18[0] = *v5;
  LOBYTE(v14) = 0;
  sub_1890D0828();
  uint64_t v11 = v22;
  sub_1890F177C();
  if (v11) {
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  sub_1890D51E0((uint64_t)(v5 + 8), (uint64_t)v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768AF8);
  if (swift_dynamicCast())
  {
    v18[0] = 1;
    sub_1890F1764();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }

  else
  {
    sub_1890D51E0((uint64_t)(v5 + 8), (uint64_t)v18);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C768AD8);
    uint64_t result = swift_dynamicCast();
    if (!(_DWORD)result)
    {
      __break(1u);
      return result;
    }

    v18[0] = v14;
    uint64_t v19 = v15;
    uint64_t v20 = v16;
    uint64_t v21 = v17;
    LOBYTE(v14) = 1;
    sub_1890EAE38(&qword_18C768B00, &qword_18C768AD8, (uint64_t)&unk_1890F6A24);
    sub_1890F177C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

uint64_t SigningIdentifier.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768B80);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EAD28();
  sub_1890F18C0();
  if (!v2)
  {
    char v21 = 0;
    sub_1890D259C();
    sub_1890F1728();
    LOBYTE(v20[0]) = v17;
    if (sub_1890EFBB4(v17) == 0xD000000000000012LL && v10 == 0x80000001890F72A0LL)
    {
      swift_bridgeObjectRelease();
    }

    else
    {
      char v11 = sub_1890F183C();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_1890D25E0();
        swift_allocError();
        *uint64_t v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }

    LOBYTE(v17) = 1;
    uint64_t v12 = sub_1890F1710();
    uint64_t v18 = MEMORY[0x189617FA8];
    uint64_t v19 = &off_18A347290;
    *(void *)&__int128 v17 = v12;
    *((void *)&v17 + 1) = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_1890D2660(&v17, (uint64_t)v20 + 8);
    __int128 v15 = v20[1];
    *a2 = v20[0];
    a2[1] = v15;
    a2[2] = v20[2];
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1890E89AC@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v7 = MEMORY[0x189617FA8];
  if ((swift_dynamicCast() & 1) != 0)
  {
    *(_BYTE *)a3 = a2;
    *(void *)(a3 + 32) = v7;
    *(void *)(a3 + 40) = &off_18A347290;
    *(void *)(a3 + 8) = v20;
    *(void *)(a3 + 16) = v21;
  }

  else
  {
    sub_1890D51E0(a1, (uint64_t)v22);
    unsigned __int8 v8 = sub_1890DE81C((uint64_t)v22);
    if (!v3)
    {
      unsigned __int8 v12 = v8;
      uint64_t v13 = v10;
      uint64_t v14 = v11;
      uint64_t v23 = v9;
      if (sub_1890EFBB4(v8) == 7235876 && v15 == 0xE300000000000000LL)
      {
        swift_bridgeObjectRelease();
      }

      else
      {
        char v16 = sub_1890F183C();
        swift_bridgeObjectRelease();
        if ((v16 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1890D25E0();
          swift_allocError();
          *uint64_t v18 = 1;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1(a1);
        }
      }

      *(_BYTE *)a3 = a2;
      *(void *)(a3 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768AD8);
      *(void *)(a3 + 40) = sub_1890EAE38(&qword_18C768AE0, &qword_18C768AD8, (uint64_t)&unk_1890F6604);
      uint64_t v17 = swift_allocObject();
      *(void *)(a3 + 8) = v17;
      *(_BYTE *)(v17 + 16) = v12;
      *(void *)(v17 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v23;
      *(void *)(v17 + 32) = v13;
      *(void *)(v17 + 40) = v14;
    }
  }

  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_1890E8B84@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return SigningIdentifier.init(from:)(a1, a2);
}

uint64_t sub_1890E8B98(void *a1)
{
  return SigningIdentifier.encode(to:)(a1);
}

uint64_t TeamIdentifier.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_BYTE *)a3 = 17;
  *(void *)(a3 + 32) = MEMORY[0x189617FA8];
  *(void *)(a3 + 40) = &off_18A347290;
  *(void *)(a3 + 8) = result;
  *(void *)(a3 + 16) = a2;
  return result;
}

uint64_t static TeamIdentifier.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1890E62E0(a1, 17, a2);
}

{
  return sub_1890E62E0(a1, 17, a2);
}

uint64_t sub_1890E8BE0@<X0>(char *a1@<X8>)
{
  return sub_1890E95FC(a1);
}

uint64_t sub_1890E8BEC@<X0>(char *a1@<X8>)
{
  return sub_1890E9660(a1);
}

uint64_t sub_1890E8BF8()
{
  return sub_1890F18D8();
}

uint64_t sub_1890E8C20()
{
  return sub_1890F18E4();
}

uint64_t TeamIdentifier.encode(to:)(void *a1)
{
  return sub_1890E846C(a1, &qword_18C768B88, (void (*)(void))sub_1890EAD6C);
}

uint64_t TeamIdentifier.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768B98);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  unsigned __int8 v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EAD6C();
  sub_1890F18C0();
  if (!v2)
  {
    char v21 = 0;
    sub_1890D259C();
    sub_1890F1728();
    LOBYTE(v20[0]) = v17;
    if (sub_1890EFBB4(v17) == 0x6564692D6D616574LL && v10 == 0xEF7265696669746ELL)
    {
      swift_bridgeObjectRelease();
    }

    else
    {
      char v11 = sub_1890F183C();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_1890D25E0();
        swift_allocError();
        *uint64_t v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }

    LOBYTE(v17) = 1;
    uint64_t v12 = sub_1890F1710();
    uint64_t v18 = MEMORY[0x189617FA8];
    uint64_t v19 = &off_18A347290;
    *(void *)&__int128 v17 = v12;
    *((void *)&v17 + 1) = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_1890D2660(&v17, (uint64_t)v20 + 8);
    __int128 v15 = v20[1];
    *a2 = v20[0];
    a2[1] = v15;
    a2[2] = v20[2];
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1890E8F88@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return TeamIdentifier.init(from:)(a1, a2);
}

uint64_t sub_1890E8F9C(void *a1)
{
  return TeamIdentifier.encode(to:)(a1);
}

void TeamIdentifierMatchesCurrentProcess.init()(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 18;
  *(void *)(a1 + 32) = MEMORY[0x1896184C8];
  *(void *)(a1 + 40) = &off_18A3472C0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t TeamIdentifierMatchesCurrentProcess.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x1896184C8];
  *(_BYTE *)a2 = 18;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = &off_18A3472C0;
  *(_BYTE *)(a2 + 8) = result;
  return result;
}

uint64_t sub_1890E8FFC@<X0>(char *a1@<X8>)
{
  return sub_1890E95FC(a1);
}

uint64_t sub_1890E9008@<X0>(char *a1@<X8>)
{
  return sub_1890E9660(a1);
}

uint64_t sub_1890E9014()
{
  return sub_1890F18D8();
}

uint64_t sub_1890E903C()
{
  return sub_1890F18E4();
}

uint64_t TeamIdentifierMatchesCurrentProcess.encode(to:)(void *a1)
{
  return sub_1890E4240(a1, &qword_18C768BA0, (void (*)(void))sub_1890EADB0);
}

uint64_t TeamIdentifierMatchesCurrentProcess.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768BB0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  unsigned __int8 v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EADB0();
  sub_1890F18C0();
  if (!v2)
  {
    char v20 = 0;
    sub_1890D259C();
    sub_1890F1728();
    LOBYTE(v19[0]) = v16;
    if (sub_1890EFBB4(v16) == 0xD000000000000023LL && v9 == 0x80000001890F72D0LL)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }

    char v10 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
    {
LABEL_7:
      char v20 = 1;
      char v11 = sub_1890F171C();
      uint64_t v17 = MEMORY[0x1896184C8];
      uint64_t v18 = &off_18A3472C0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_1890D2660(&v16, (uint64_t)v19 + 8);
      __int128 v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }

    sub_1890D25E0();
    swift_allocError();
    *uint64_t v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1890E92C4@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return TeamIdentifierMatchesCurrentProcess.init(from:)(a1, a2);
}

uint64_t sub_1890E92D8(void *a1)
{
  return TeamIdentifierMatchesCurrentProcess.encode(to:)(a1);
}

uint64_t ValidationCategory.Value.rawValue.getter()
{
  return *(void *)v0;
}

unint64_t ValidationCategory.Value.init(rawValue:)@<X0>( unint64_t result@<X0>, uint64_t a2@<X8>)
{
  if (result <= 0xA) {
    unint64_t v2 = result;
  }
  else {
    unint64_t v2 = 0LL;
  }
  *(void *)a2 = v2;
  *(_BYTE *)(a2 + 8) = result > 0xA;
  return result;
}

uint64_t sub_1890E930C()
{
  return sub_1890F1614();
}

uint64_t sub_1890E9368()
{
  return sub_1890F15FC();
}

uint64_t sub_1890E93B4()
{
  return sub_1890F18B4();
}

uint64_t sub_1890E93F8()
{
  return sub_1890F18B4();
}

uint64_t *sub_1890E9438@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 0xA;
  *(void *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

uint64_t *ValidationCategory.init(_:)@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  uint64_t v3 = MEMORY[0x18961A4C0];
  *(_BYTE *)a2 = 19;
  *(void *)(a2 + 32) = v3;
  *(void *)(a2 + 40) = &off_18A3472D8;
  *(void *)(a2 + 8) = v2;
  return result;
}

uint64_t static ValidationCategory.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1890E518C(a1, 19, &qword_18C768BB8, &qword_18C768BC0, a2);
}

{
  return sub_1890E518C(a1, 19, &qword_18C768BB8, &qword_18C768BC0, a2);
}

uint64_t sub_1890E94BC()
{
  return sub_1890F18B4();
}

uint64_t sub_1890E9530()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1890E9580()
{
  return sub_1890F18B4();
}

uint64_t sub_1890E95F0@<X0>(char *a1@<X8>)
{
  return sub_1890E95FC(a1);
}

uint64_t sub_1890E95FC@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_1890F16EC();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_1890E9654@<X0>(char *a1@<X8>)
{
  return sub_1890E9660(a1);
}

uint64_t sub_1890E9660@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_1890F16EC();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_1890E96BC()
{
  return sub_1890F18D8();
}

uint64_t sub_1890E96E4()
{
  return sub_1890F18E4();
}

uint64_t ValidationCategory.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768BC8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  unsigned __int8 v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EADF4();
  sub_1890F18CC();
  v15[0] = *v3;
  LOBYTE(v11) = 0;
  sub_1890D0828();
  sub_1890F177C();
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_1890D51E0((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768A88);
  if (swift_dynamicCast())
  {
    v15[0] = 1;
    sub_1890F1788();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  sub_1890D51E0((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C768BB8);
  uint64_t result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    v15[0] = v11;
    uint64_t v16 = v12;
    char v17 = v13;
    uint64_t v18 = v14;
    LOBYTE(v11) = 1;
    sub_1890EAE38(&qword_18C768BD8, &qword_18C768BB8, (uint64_t)&unk_1890F6A24);
    sub_1890F177C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t ValidationCategory.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768BE0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  unsigned __int8 v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1890EADF4();
  sub_1890F18C0();
  if (!v2)
  {
    char v20 = 0;
    sub_1890D259C();
    sub_1890F1728();
    LOBYTE(v19[0]) = v16;
    if (sub_1890EFBB4(v16) == 0xD000000000000013LL && v10 == 0x80000001890F7300LL)
    {
      swift_bridgeObjectRelease();
    }

    else
    {
      char v11 = sub_1890F183C();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_1890D25E0();
        swift_allocError();
        *char v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }

    LOBYTE(v16) = 1;
    uint64_t v12 = sub_1890F1734();
    uint64_t v17 = MEMORY[0x18961A4C0];
    uint64_t v18 = &off_18A3472D8;
    *(void *)&__int128 v16 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_1890D2660(&v16, (uint64_t)v19 + 8);
    __int128 v14 = v19[1];
    *a2 = v19[0];
    a2[1] = v14;
    a2[2] = v19[2];
  }

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1890E9C28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = MEMORY[0x18961A4C0];
  if ((swift_dynamicCast() & 1) != 0)
  {
    uint64_t v6 = v38[0];
    if (v38[0] < 0xBuLL)
    {
      *(_BYTE *)a2 = 19;
      *(void *)(a2 + 32) = v5;
      *(void *)(a2 + 40) = &off_18A3472D8;
      *(void *)(a2 + 8) = v6;
LABEL_19:
      uint64_t v18 = (uint64_t *)a1;
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    }

uint64_t sub_1890EA05C@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return ValidationCategory.init(from:)(a1, a2);
}

uint64_t sub_1890EA070(void *a1)
{
  return ValidationCategory.encode(to:)(a1);
}

uint64_t sub_1890EA084@<X0>(unint64_t *a1@<X8>)
{
  return sub_1890E0318(&qword_18C768BB8, a1);
}

uint64_t sub_1890EA0A0(uint64_t a1)
{
  if (swift_dynamicCast())
  {
    char v2 = v6;
  }

  else
  {
    sub_1890D51E0(a1, (uint64_t)v5);
    if ((swift_dynamicCast() & 1) == 0 || (char v2 = v6, v6 >= 2))
    {
      sub_1890D25E0();
      swift_allocError();
      *uint64_t v3 = 1;
      swift_willThrow();
    }
  }

  return v2 & 1;
}

void *sub_1890EA184(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_1890EA74C(a1, a2, a3, a4, &qword_18C7685F8, &qword_18C768600);
}

char *sub_1890EA198(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_1890EA210(a1, a2, a3, a4, &qword_18C769620);
}

char *sub_1890EA1AC(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_1890EA210(a1, a2, a3, a4, &qword_18C769618);
}

char *sub_1890EA1C0(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_1890EA210(a1, a2, a3, a4, &qword_18C769640);
}

char *sub_1890EA1D4(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_1890EA210(a1, a2, a3, a4, &qword_18C769638);
}

char *sub_1890EA1E8(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_1890EA210(a1, a2, a3, a4, &qword_18C769630);
}

char *sub_1890EA1FC(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_1890EA210(a1, a2, a3, a4, &qword_18C769628);
}

char *sub_1890EA210(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v8 = a2;
  }

  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v11 = (char *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (char *)MEMORY[0x18961AFE8];
  }

  unint64_t v14 = v11 + 32;
  unint64_t v15 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v9]) {
      memmove(v14, v15, 16 * v9);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy();
  }

  swift_bridgeObjectRelease();
  return v11;
}

void *sub_1890EA314(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_1890EA8B4(a1, a2, a3, a4, &qword_18C7688D0, &qword_18C768630);
}

char *sub_1890EA328(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v8 = a2;
  }

  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v11 = (char *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }

  else
  {
    uint64_t v11 = (char *)MEMORY[0x18961AFE8];
  }

  unint64_t v14 = v11 + 32;
  unint64_t v15 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9]) {
      memmove(v14, v15, 8 * v9);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v14, v15, 8 * v9);
  }

  swift_bridgeObjectRelease();
  return v11;
}

void *sub_1890EA41C(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_1890EA8B4(a1, a2, a3, a4, &qword_18C7688D8, &qword_18C768640);
}

void *sub_1890EA430(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_1890EA8B4(a1, a2, a3, a4, &qword_18C7688E0, &qword_18C768648);
}

unint64_t sub_1890EA444()
{
  unint64_t result = qword_18C7688F0;
  if (!qword_18C7688F0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F6AB8, &type metadata for AppleInternal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7688F0);
  }

  return result;
}

unint64_t sub_1890EA488()
{
  unint64_t result = qword_18C768908;
  if (!qword_18C768908)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F3160, MEMORY[0x189606D70]);
    atomic_store(result, (unint64_t *)&qword_18C768908);
  }

  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895DFB54](255LL, (char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_1890EA510()
{
  unint64_t v1 = *(void *)(v0 + 32);
  if (v1 >> 60 != 15) {
    sub_1890D74E0(*(void *)(v0 + 24), v1);
  }
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_1890EA54C()
{
  unint64_t result = qword_18C768928;
  if (!qword_18C768928)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F6A4C, &type metadata for CodeDirectoryHash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768928);
  }

  return result;
}

uint64_t sub_1890EA590(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1890D74E0(a1, a2);
  }
  return a1;
}

unint64_t sub_1890EA5A4()
{
  unint64_t result = qword_18C768940;
  if (!qword_18C768940)
  {
    unint64_t result = MEMORY[0x1895DFB60](MEMORY[0x189606D88], MEMORY[0x189606D70]);
    atomic_store(result, (unint64_t *)&qword_18C768940);
  }

  return result;
}

unint64_t sub_1890EA5E8()
{
  unint64_t result = qword_18C768950;
  if (!qword_18C768950)
  {
    unint64_t result = MEMORY[0x1895DFB60](MEMORY[0x189606DA0], MEMORY[0x189606D70]);
    atomic_store(result, (unint64_t *)&qword_18C768950);
  }

  return result;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8LL) + 80LL) & 0x20000) != 0) {
    JUMPOUT(0x1895DFBCCLL);
  }
  return result;
}

unint64_t sub_1890EA660()
{
  unint64_t result = qword_18C768968;
  if (!qword_18C768968)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F69AC, &type metadata for ProcessCodeSigningFlags.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768968);
  }

  return result;
}

unint64_t sub_1890EA6A4()
{
  unint64_t result = qword_18C768998;
  if (!qword_18C768998)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F695C, &type metadata for OnDiskCodeSigningFlags.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768998);
  }

  return result;
}

unint64_t sub_1890EA6E8()
{
  unint64_t result = qword_18C7689B0;
  if (!qword_18C7689B0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F690C, &type metadata for DeveloperMode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7689B0);
  }

  return result;
}

uint64_t type metadata accessor for EntitlementsQuery()
{
  return objc_opt_self();
}

void *sub_1890EA74C(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v10 = a2;
  }

  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v13 = (void *)swift_allocObject();
    int64_t v14 = _swift_stdlib_malloc_size(v13);
    uint64_t v15 = v14 - 32;
    if (v14 < 32) {
      uint64_t v15 = v14 - 25;
    }
    void v13[2] = v11;
    v13[3] = 2 * (v15 >> 3);
  }

  else
  {
    uint64_t v13 = (void *)MEMORY[0x18961AFE8];
  }

  if ((v8 & 1) != 0)
  {
    if (v13 != a4 || v13 + 4 >= &a4[v11 + 4]) {
      memmove(v13 + 4, a4 + 4, 8 * v11);
    }
    a4[2] = 0LL;
  }

  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
  }

  swift_bridgeObjectRelease();
  return v13;
}

unint64_t sub_1890EA870()
{
  unint64_t result = qword_18C7689D8;
  if (!qword_18C7689D8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F68BC, &type metadata for EntitlementsQuery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7689D8);
  }

  return result;
}

void *sub_1890EA8B4(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v10 = a2;
  }

  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v13 = (void *)swift_allocObject();
    size_t v14 = _swift_stdlib_malloc_size(v13);
    void v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
  }

  else
  {
    uint64_t v13 = (void *)MEMORY[0x18961AFE8];
  }

  if ((v8 & 1) != 0)
  {
    if (v13 != a4 || v13 + 4 >= &a4[5 * v11 + 4]) {
      memmove(v13 + 4, a4 + 4, 40 * v11);
    }
    a4[2] = 0LL;
  }

  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
  }

  swift_bridgeObjectRelease();
  return v13;
}

unint64_t sub_1890EA9EC()
{
  unint64_t result = qword_18C7689F8;
  if (!qword_18C7689F8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F686C, &type metadata for InfoPlistHash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7689F8);
  }

  return result;
}

unint64_t sub_1890EAA30()
{
  unint64_t result = qword_18C768A10;
  if (!qword_18C768A10)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F681C, &type metadata for InTrustCacheWithConstraintCategory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768A10);
  }

  return result;
}

unint64_t sub_1890EAA74()
{
  unint64_t result = qword_18C768A28;
  if (!qword_18C768A28)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F67CC, &type metadata for IsInitProcess.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768A28);
  }

  return result;
}

unint64_t sub_1890EAAB8()
{
  unint64_t result = qword_18C768A40;
  if (!qword_18C768A40)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F677C, &type metadata for IsMainBinary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768A40);
  }

  return result;
}

unint64_t sub_1890EAAFC()
{
  unint64_t result = qword_18C768A58;
  if (!qword_18C768A58)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F672C, &type metadata for IsSIPProtected.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768A58);
  }

  return result;
}

unint64_t sub_1890EAB40()
{
  unint64_t result = qword_18C768A80;
  if (!qword_18C768A80)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F66C0, &type metadata for LaunchType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768A80);
  }

  return result;
}

unint64_t sub_1890EAB84()
{
  unint64_t result = qword_18C768AB0;
  if (!qword_18C768AB0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F6670, &type metadata for OnAuthorizedAuthAPFSVolume.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768AB0);
  }

  return result;
}

unint64_t sub_1890EABC8()
{
  unint64_t result = qword_18C768AC8;
  if (!qword_18C768AC8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F6620, &type metadata for OnSystemVolume.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768AC8);
  }

  return result;
}

uint64_t sub_1890EAC0C()
{
  return swift_deallocObject();
}

unint64_t sub_1890EAC38()
{
  unint64_t result = qword_18C768AF0;
  if (!qword_18C768AF0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F65B4, &type metadata for OSEnvironment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768AF0);
  }

  return result;
}

uint64_t sub_1890EAC7C()
{
  return swift_deallocObject();
}

unint64_t sub_1890EACA0()
{
  unint64_t result = qword_18C768B30;
  if (!qword_18C768B30)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F6564, &type metadata for PlatformType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768B30);
  }

  return result;
}

unint64_t sub_1890EACE4()
{
  unint64_t result = qword_18C768B60;
  if (!qword_18C768B60)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F6514, &type metadata for PlatformIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768B60);
  }

  return result;
}

unint64_t sub_1890EAD28()
{
  unint64_t result = qword_18C768B78;
  if (!qword_18C768B78)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F64C4, &type metadata for SigningIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768B78);
  }

  return result;
}

unint64_t sub_1890EAD6C()
{
  unint64_t result = qword_18C768B90;
  if (!qword_18C768B90)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F6474, &type metadata for TeamIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768B90);
  }

  return result;
}

unint64_t sub_1890EADB0()
{
  unint64_t result = qword_18C768BA8;
  if (!qword_18C768BA8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F6424, &type metadata for TeamIdentifierMatchesCurrentProcess.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768BA8);
  }

  return result;
}

unint64_t sub_1890EADF4()
{
  unint64_t result = qword_18C768BD0;
  if (!qword_18C768BD0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F63D4, &type metadata for ValidationCategory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C768BD0);
  }

  return result;
}

uint64_t sub_1890EAE38(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = MEMORY[0x1895DFB60](a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1890EAE78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890EA5E8, (uint64_t (*)(void))sub_1890EA5A4);
}

unint64_t sub_1890EAE8C(uint64_t a1)
{
  unint64_t result = sub_1890EAEB0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1890EAEB0()
{
  unint64_t result = qword_18C768BF0;
  if (!qword_18C768BF0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F320C, &type metadata for AppleInternal);
    atomic_store(result, (unint64_t *)&qword_18C768BF0);
  }

  return result;
}

uint64_t sub_1890EAEF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D2678, (uint64_t (*)(void))sub_1890EAF08);
}

unint64_t sub_1890EAF08()
{
  unint64_t result = qword_18C768BF8;
  if (!qword_18C768BF8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for AppleInternal, &type metadata for AppleInternal);
    atomic_store(result, (unint64_t *)&qword_18C768BF8);
  }

  return result;
}

uint64_t sub_1890EAF4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890EAF60, (uint64_t (*)(void))sub_1890EAFA4);
}

unint64_t sub_1890EAF60()
{
  unint64_t result = qword_18C768C00;
  if (!qword_18C768C00)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F32E8, &type metadata for CodeDirectoryHash);
    atomic_store(result, (unint64_t *)&qword_18C768C00);
  }

  return result;
}

unint64_t sub_1890EAFA4()
{
  unint64_t result = qword_18C768C08;
  if (!qword_18C768C08)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F3304, &type metadata for CodeDirectoryHash);
    atomic_store(result, (unint64_t *)&qword_18C768C08);
  }

  return result;
}

uint64_t sub_1890EAFE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D26BC, (uint64_t (*)(void))sub_1890EAFFC);
}

unint64_t sub_1890EAFFC()
{
  unint64_t result = qword_18C768C10;
  if (!qword_18C768C10)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for CodeDirectoryHash,  &type metadata for CodeDirectoryHash);
    atomic_store(result, (unint64_t *)&qword_18C768C10);
  }

  return result;
}

_UNKNOWN **sub_1890EB040()
{
  return &off_18A349CE8;
}

uint64_t sub_1890EB050(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1890EC460( a1,  a2,  a3,  (uint64_t (*)(void))sub_1890EB06C,  (uint64_t (*)(void))sub_1890EB0B0,  (uint64_t (*)(void))sub_1890EB0F4);
}

unint64_t sub_1890EB06C()
{
  unint64_t result = qword_18C768C50;
  if (!qword_18C768C50)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ProcessCodeSigningFlags.ValueSet,  &type metadata for ProcessCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_18C768C50);
  }

  return result;
}

unint64_t sub_1890EB0B0()
{
  unint64_t result = qword_18C768C58;
  if (!qword_18C768C58)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ProcessCodeSigningFlags.ValueSet,  &type metadata for ProcessCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_18C768C58);
  }

  return result;
}

unint64_t sub_1890EB0F4()
{
  unint64_t result = qword_18C768C60;
  if (!qword_18C768C60)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ProcessCodeSigningFlags.ValueSet,  &type metadata for ProcessCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_18C768C60);
  }

  return result;
}

unint64_t sub_1890EB13C()
{
  unint64_t result = qword_18C768C68;
  if (!qword_18C768C68)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ProcessCodeSigningFlags.ValueSet,  &type metadata for ProcessCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_18C768C68);
  }

  return result;
}

unint64_t sub_1890EB184()
{
  unint64_t result = qword_18C768C70;
  if (!qword_18C768C70)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ProcessCodeSigningFlags.ValueSet,  &type metadata for ProcessCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_18C768C70);
  }

  return result;
}

unint64_t sub_1890EB1CC()
{
  unint64_t result = qword_18C768C78;
  if (!qword_18C768C78)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ProcessCodeSigningFlags.ValueSet,  &type metadata for ProcessCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_18C768C78);
  }

  return result;
}

unint64_t sub_1890EB214()
{
  unint64_t result = qword_18C768C80;
  if (!qword_18C768C80)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ProcessCodeSigningFlags.ValueSet,  &type metadata for ProcessCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_18C768C80);
  }

  return result;
}

uint64_t sub_1890EB258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890EB26C, (uint64_t (*)(void))sub_1890EB2B0);
}

unint64_t sub_1890EB26C()
{
  unint64_t result = qword_18C768CB0;
  if (!qword_18C768CB0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F3610, &type metadata for ProcessCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_18C768CB0);
  }

  return result;
}

unint64_t sub_1890EB2B0()
{
  unint64_t result = qword_18C768CB8;
  if (!qword_18C768CB8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F362C, &type metadata for ProcessCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_18C768CB8);
  }

  return result;
}

uint64_t sub_1890EB2F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D2700, (uint64_t (*)(void))sub_1890EB308);
}

unint64_t sub_1890EB308()
{
  unint64_t result = qword_18C768CC0;
  if (!qword_18C768CC0)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ProcessCodeSigningFlags,  &type metadata for ProcessCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_18C768CC0);
  }

  return result;
}

unint64_t sub_1890EB350()
{
  unint64_t result = qword_18C768CC8;
  if (!qword_18C768CC8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F3370, &type metadata for ProcessCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_18C768CC8);
  }

  return result;
}

uint64_t sub_1890EB398(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1890EC460( a1,  a2,  a3,  (uint64_t (*)(void))sub_1890EB3B4,  (uint64_t (*)(void))sub_1890EB3F8,  (uint64_t (*)(void))sub_1890EB43C);
}

unint64_t sub_1890EB3B4()
{
  unint64_t result = qword_18C768D00;
  if (!qword_18C768D00)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for OnDiskCodeSigningFlags.ValueSet,  &type metadata for OnDiskCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_18C768D00);
  }

  return result;
}

unint64_t sub_1890EB3F8()
{
  unint64_t result = qword_18C768D08;
  if (!qword_18C768D08)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for OnDiskCodeSigningFlags.ValueSet,  &type metadata for OnDiskCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_18C768D08);
  }

  return result;
}

unint64_t sub_1890EB43C()
{
  unint64_t result = qword_18C768D10;
  if (!qword_18C768D10)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for OnDiskCodeSigningFlags.ValueSet,  &type metadata for OnDiskCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_18C768D10);
  }

  return result;
}

unint64_t sub_1890EB484()
{
  unint64_t result = qword_18C768D18;
  if (!qword_18C768D18)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for OnDiskCodeSigningFlags.ValueSet,  &type metadata for OnDiskCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_18C768D18);
  }

  return result;
}

unint64_t sub_1890EB4CC()
{
  unint64_t result = qword_18C768D20;
  if (!qword_18C768D20)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for OnDiskCodeSigningFlags.ValueSet,  &type metadata for OnDiskCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_18C768D20);
  }

  return result;
}

unint64_t sub_1890EB514()
{
  unint64_t result = qword_18C768D28;
  if (!qword_18C768D28)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for OnDiskCodeSigningFlags.ValueSet,  &type metadata for OnDiskCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_18C768D28);
  }

  return result;
}

unint64_t sub_1890EB55C()
{
  unint64_t result = qword_18C768D30;
  if (!qword_18C768D30)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for OnDiskCodeSigningFlags.ValueSet,  &type metadata for OnDiskCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_18C768D30);
  }

  return result;
}

uint64_t sub_1890EB5A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890EB5B4, (uint64_t (*)(void))sub_1890EB5F8);
}

unint64_t sub_1890EB5B4()
{
  unint64_t result = qword_18C768D60;
  if (!qword_18C768D60)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F38CC, &type metadata for OnDiskCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_18C768D60);
  }

  return result;
}

unint64_t sub_1890EB5F8()
{
  unint64_t result = qword_18C768D68;
  if (!qword_18C768D68)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F38E8, &type metadata for OnDiskCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_18C768D68);
  }

  return result;
}

uint64_t sub_1890EB63C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D46EC, (uint64_t (*)(void))sub_1890EB650);
}

unint64_t sub_1890EB650()
{
  unint64_t result = qword_18C768D70;
  if (!qword_18C768D70)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for OnDiskCodeSigningFlags,  &type metadata for OnDiskCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_18C768D70);
  }

  return result;
}

unint64_t sub_1890EB698()
{
  unint64_t result = qword_18C768D78;
  if (!qword_18C768D78)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F3648, &type metadata for OnDiskCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_18C768D78);
  }

  return result;
}

unint64_t sub_1890EB6E0(uint64_t a1)
{
  unint64_t result = sub_1890EB704();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1890EB704()
{
  unint64_t result = qword_18C768DB0;
  if (!qword_18C768DB0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F3974, &type metadata for DeveloperMode);
    atomic_store(result, (unint64_t *)&qword_18C768DB0);
  }

  return result;
}

uint64_t sub_1890EB748(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D2744, (uint64_t (*)(void))sub_1890EB75C);
}

unint64_t sub_1890EB75C()
{
  unint64_t result = qword_18C768DB8;
  if (!qword_18C768DB8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for DeveloperMode, &type metadata for DeveloperMode);
    atomic_store(result, (unint64_t *)&qword_18C768DB8);
  }

  return result;
}

unint64_t sub_1890EB7A4()
{
  unint64_t result = qword_18C768DC0;
  if (!qword_18C768DC0)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for EntitlementsQuery.DataType,  &type metadata for EntitlementsQuery.DataType);
    atomic_store(result, (unint64_t *)&qword_18C768DC0);
  }

  return result;
}

uint64_t sub_1890EB7EC(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1890EF698(&qword_18C768290, (uint64_t)&protocol conformance descriptor for EntitlementsQuery);
  uint64_t result = sub_1890EF698(&qword_18C768DC8, (uint64_t)&protocol conformance descriptor for EntitlementsQuery);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1890EB838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890EB84C, (uint64_t (*)(void))sub_1890EB890);
}

unint64_t sub_1890EB84C()
{
  unint64_t result = qword_18C768DD0;
  if (!qword_18C768DD0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F3BB0, &type metadata for InfoPlistHash);
    atomic_store(result, (unint64_t *)&qword_18C768DD0);
  }

  return result;
}

unint64_t sub_1890EB890()
{
  unint64_t result = qword_18C768DD8;
  if (!qword_18C768DD8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F3BCC, &type metadata for InfoPlistHash);
    atomic_store(result, (unint64_t *)&qword_18C768DD8);
  }

  return result;
}

uint64_t sub_1890EB8D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D2788, (uint64_t (*)(void))sub_1890EB8E8);
}

unint64_t sub_1890EB8E8()
{
  unint64_t result = qword_18C768DE0;
  if (!qword_18C768DE0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for InfoPlistHash, &type metadata for InfoPlistHash);
    atomic_store(result, (unint64_t *)&qword_18C768DE0);
  }

  return result;
}

unint64_t sub_1890EB930(uint64_t a1)
{
  unint64_t result = sub_1890EB954();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1890EB954()
{
  unint64_t result = qword_18C768E20;
  if (!qword_18C768E20)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F3CA8, &type metadata for InTrustCacheWithConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_18C768E20);
  }

  return result;
}

uint64_t sub_1890EB998(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D27CC, (uint64_t (*)(void))sub_1890EB9AC);
}

unint64_t sub_1890EB9AC()
{
  unint64_t result = qword_18C768E28;
  if (!qword_18C768E28)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for InTrustCacheWithConstraintCategory,  &type metadata for InTrustCacheWithConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_18C768E28);
  }

  return result;
}

unint64_t sub_1890EB9F0(uint64_t a1)
{
  unint64_t result = sub_1890EBA14();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1890EBA14()
{
  unint64_t result = qword_18C768E30;
  if (!qword_18C768E30)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F3D68, &type metadata for IsInitProcess);
    atomic_store(result, (unint64_t *)&qword_18C768E30);
  }

  return result;
}

uint64_t sub_1890EBA58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D2810, (uint64_t (*)(void))sub_1890EBA6C);
}

unint64_t sub_1890EBA6C()
{
  unint64_t result = qword_18C768E38;
  if (!qword_18C768E38)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for IsInitProcess, &type metadata for IsInitProcess);
    atomic_store(result, (unint64_t *)&qword_18C768E38);
  }

  return result;
}

unint64_t sub_1890EBAB0(uint64_t a1)
{
  unint64_t result = sub_1890EBAD4();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1890EBAD4()
{
  unint64_t result = qword_18C768E40;
  if (!qword_18C768E40)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F3E0C, &type metadata for IsMainBinary);
    atomic_store(result, (unint64_t *)&qword_18C768E40);
  }

  return result;
}

uint64_t sub_1890EBB18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D4730, (uint64_t (*)(void))sub_1890EBB2C);
}

unint64_t sub_1890EBB2C()
{
  unint64_t result = qword_18C768E48;
  if (!qword_18C768E48)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for IsMainBinary, &type metadata for IsMainBinary);
    atomic_store(result, (unint64_t *)&qword_18C768E48);
  }

  return result;
}

unint64_t sub_1890EBB70(uint64_t a1)
{
  unint64_t result = sub_1890EBB94();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1890EBB94()
{
  unint64_t result = qword_18C768E50;
  if (!qword_18C768E50)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F3EE8, &type metadata for IsSIPProtected);
    atomic_store(result, (unint64_t *)&qword_18C768E50);
  }

  return result;
}

uint64_t sub_1890EBBD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D2854, (uint64_t (*)(void))sub_1890EBBEC);
}

unint64_t sub_1890EBBEC()
{
  unint64_t result = qword_18C768E58;
  if (!qword_18C768E58)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for IsSIPProtected, &type metadata for IsSIPProtected);
    atomic_store(result, (unint64_t *)&qword_18C768E58);
  }

  return result;
}

uint64_t sub_1890EBC30(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1890EC8B8( a1,  a2,  a3,  (uint64_t (*)(void))sub_1890EBC54,  (uint64_t (*)(void))sub_1890EBC98,  (uint64_t (*)(void))sub_1890EBCDC,  (uint64_t (*)(void))sub_1890EBD20);
}

unint64_t sub_1890EBC54()
{
  unint64_t result = qword_18C768E60;
  if (!qword_18C768E60)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for LaunchType.Value,  &type metadata for LaunchType.Value);
    atomic_store(result, (unint64_t *)&qword_18C768E60);
  }

  return result;
}

unint64_t sub_1890EBC98()
{
  unint64_t result = qword_18C768E68;
  if (!qword_18C768E68)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for LaunchType.Value,  &type metadata for LaunchType.Value);
    atomic_store(result, (unint64_t *)&qword_18C768E68);
  }

  return result;
}

unint64_t sub_1890EBCDC()
{
  unint64_t result = qword_18C768E70;
  if (!qword_18C768E70)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for LaunchType.Value,  &type metadata for LaunchType.Value);
    atomic_store(result, (unint64_t *)&qword_18C768E70);
  }

  return result;
}

unint64_t sub_1890EBD20()
{
  unint64_t result = qword_18C768E78;
  if (!qword_18C768E78)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for LaunchType.Value,  &type metadata for LaunchType.Value);
    atomic_store(result, (unint64_t *)&qword_18C768E78);
  }

  return result;
}

unint64_t sub_1890EBD68()
{
  unint64_t result = qword_18C768E80;
  if (!qword_18C768E80)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for LaunchType.Value,  &type metadata for LaunchType.Value);
    atomic_store(result, (unint64_t *)&qword_18C768E80);
  }

  return result;
}

unint64_t sub_1890EBDB0()
{
  unint64_t result = qword_18C768E88;
  if (!qword_18C768E88)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F3F54, &type metadata for LaunchType.Value);
    atomic_store(result, (unint64_t *)&qword_18C768E88);
  }

  return result;
}

uint64_t sub_1890EBDF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890EBE08, (uint64_t (*)(void))sub_1890EBE4C);
}

unint64_t sub_1890EBE08()
{
  unint64_t result = qword_18C768ED0;
  if (!qword_18C768ED0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F40F8, &type metadata for LaunchType);
    atomic_store(result, (unint64_t *)&qword_18C768ED0);
  }

  return result;
}

unint64_t sub_1890EBE4C()
{
  unint64_t result = qword_18C768ED8;
  if (!qword_18C768ED8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F4114, &type metadata for LaunchType);
    atomic_store(result, (unint64_t *)&qword_18C768ED8);
  }

  return result;
}

uint64_t sub_1890EBE90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D3D40, (uint64_t (*)(void))sub_1890EBEA4);
}

unint64_t sub_1890EBEA4()
{
  unint64_t result = qword_18C768EE0;
  if (!qword_18C768EE0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for LaunchType, &type metadata for LaunchType);
    atomic_store(result, (unint64_t *)&qword_18C768EE0);
  }

  return result;
}

_UNKNOWN **sub_1890EBEE8()
{
  return &off_18A3478F0;
}

unint64_t sub_1890EBEF8(uint64_t a1)
{
  unint64_t result = sub_1890EBF1C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1890EBF1C()
{
  unint64_t result = qword_18C768F20;
  if (!qword_18C768F20)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F41A0, &type metadata for OnAuthorizedAuthAPFSVolume);
    atomic_store(result, (unint64_t *)&qword_18C768F20);
  }

  return result;
}

uint64_t sub_1890EBF60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D2898, (uint64_t (*)(void))sub_1890EBF74);
}

unint64_t sub_1890EBF74()
{
  unint64_t result = qword_18C768F28;
  if (!qword_18C768F28)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for OnAuthorizedAuthAPFSVolume,  &type metadata for OnAuthorizedAuthAPFSVolume);
    atomic_store(result, (unint64_t *)&qword_18C768F28);
  }

  return result;
}

unint64_t sub_1890EBFB8(uint64_t a1)
{
  unint64_t result = sub_1890EBFDC();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1890EBFDC()
{
  unint64_t result = qword_18C768F30;
  if (!qword_18C768F30)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F427C, &type metadata for OnSystemVolume);
    atomic_store(result, (unint64_t *)&qword_18C768F30);
  }

  return result;
}

uint64_t sub_1890EC020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D28DC, (uint64_t (*)(void))sub_1890EC034);
}

unint64_t sub_1890EC034()
{
  unint64_t result = qword_18C768F38;
  if (!qword_18C768F38)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for OnSystemVolume, &type metadata for OnSystemVolume);
    atomic_store(result, (unint64_t *)&qword_18C768F38);
  }

  return result;
}

uint64_t sub_1890EC078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890EC08C, (uint64_t (*)(void))sub_1890EC0D0);
}

unint64_t sub_1890EC08C()
{
  unint64_t result = qword_18C768F40;
  if (!qword_18C768F40)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F4358, &type metadata for OSEnvironment);
    atomic_store(result, (unint64_t *)&qword_18C768F40);
  }

  return result;
}

unint64_t sub_1890EC0D0()
{
  unint64_t result = qword_18C768F48;
  if (!qword_18C768F48)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F4374, &type metadata for OSEnvironment);
    atomic_store(result, (unint64_t *)&qword_18C768F48);
  }

  return result;
}

uint64_t sub_1890EC114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D2920, (uint64_t (*)(void))sub_1890EC128);
}

unint64_t sub_1890EC128()
{
  unint64_t result = qword_18C768F50;
  if (!qword_18C768F50)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for OSEnvironment, &type metadata for OSEnvironment);
    atomic_store(result, (unint64_t *)&qword_18C768F50);
  }

  return result;
}

_UNKNOWN **sub_1890EC16C()
{
  return &off_18A349C58;
}

uint64_t sub_1890EC17C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1890EC8B8( a1,  a2,  a3,  (uint64_t (*)(void))sub_1890EC1A0,  (uint64_t (*)(void))sub_1890EC1E4,  (uint64_t (*)(void))sub_1890EC228,  (uint64_t (*)(void))sub_1890EC26C);
}

unint64_t sub_1890EC1A0()
{
  unint64_t result = qword_18C768F90;
  if (!qword_18C768F90)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for PlatformType.Value,  &type metadata for PlatformType.Value);
    atomic_store(result, (unint64_t *)&qword_18C768F90);
  }

  return result;
}

unint64_t sub_1890EC1E4()
{
  unint64_t result = qword_18C768F98;
  if (!qword_18C768F98)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for PlatformType.Value,  &type metadata for PlatformType.Value);
    atomic_store(result, (unint64_t *)&qword_18C768F98);
  }

  return result;
}

unint64_t sub_1890EC228()
{
  unint64_t result = qword_18C768FA0;
  if (!qword_18C768FA0)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for PlatformType.Value,  &type metadata for PlatformType.Value);
    atomic_store(result, (unint64_t *)&qword_18C768FA0);
  }

  return result;
}

unint64_t sub_1890EC26C()
{
  unint64_t result = qword_18C768FA8;
  if (!qword_18C768FA8)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for PlatformType.Value,  &type metadata for PlatformType.Value);
    atomic_store(result, (unint64_t *)&qword_18C768FA8);
  }

  return result;
}

unint64_t sub_1890EC2B4()
{
  unint64_t result = qword_18C768FB0;
  if (!qword_18C768FB0)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for PlatformType.Value,  &type metadata for PlatformType.Value);
    atomic_store(result, (unint64_t *)&qword_18C768FB0);
  }

  return result;
}

unint64_t sub_1890EC2FC()
{
  unint64_t result = qword_18C768FB8;
  if (!qword_18C768FB8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F43E0, &type metadata for PlatformType.Value);
    atomic_store(result, (unint64_t *)&qword_18C768FB8);
  }

  return result;
}

uint64_t sub_1890EC340(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890EC354, (uint64_t (*)(void))sub_1890EC398);
}

unint64_t sub_1890EC354()
{
  unint64_t result = qword_18C769000;
  if (!qword_18C769000)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F45BC, &type metadata for PlatformType);
    atomic_store(result, (unint64_t *)&qword_18C769000);
  }

  return result;
}

unint64_t sub_1890EC398()
{
  unint64_t result = qword_18C769008;
  if (!qword_18C769008)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F45D8, &type metadata for PlatformType);
    atomic_store(result, (unint64_t *)&qword_18C769008);
  }

  return result;
}

uint64_t sub_1890EC3DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D2964, (uint64_t (*)(void))sub_1890EC3F0);
}

unint64_t sub_1890EC3F0()
{
  unint64_t result = qword_18C769010;
  if (!qword_18C769010)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for PlatformType, &type metadata for PlatformType);
    atomic_store(result, (unint64_t *)&qword_18C769010);
  }

  return result;
}

_UNKNOWN **sub_1890EC434()
{
  return &off_18A347B38;
}

uint64_t sub_1890EC444(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1890EC460( a1,  a2,  a3,  (uint64_t (*)(void))sub_1890EC4A4,  (uint64_t (*)(void))sub_1890EC4E8,  (uint64_t (*)(void))sub_1890EC52C);
}

uint64_t sub_1890EC460( void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  a1[1] = a4();
  a1[2] = a5();
  uint64_t result = a6();
  a1[3] = result;
  return result;
}

unint64_t sub_1890EC4A4()
{
  unint64_t result = qword_18C769050;
  if (!qword_18C769050)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F4664, &type metadata for PlatformIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C769050);
  }

  return result;
}

unint64_t sub_1890EC4E8()
{
  unint64_t result = qword_18C769058;
  if (!qword_18C769058)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F469C, &type metadata for PlatformIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C769058);
  }

  return result;
}

unint64_t sub_1890EC52C()
{
  unint64_t result = qword_18C769060;
  if (!qword_18C769060)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F4680, &type metadata for PlatformIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C769060);
  }

  return result;
}

uint64_t sub_1890EC570(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D29A8, (uint64_t (*)(void))sub_1890EC584);
}

unint64_t sub_1890EC584()
{
  unint64_t result = qword_18C769068;
  if (!qword_18C769068)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for PlatformIdentifier,  &type metadata for PlatformIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C769068);
  }

  return result;
}

_UNKNOWN **sub_1890EC5C8()
{
  return &off_18A349C88;
}

_UNKNOWN **sub_1890EC5D8()
{
  return &off_18A349C60;
}

uint64_t sub_1890EC5E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890EC5F8, (uint64_t (*)(void))sub_1890EC63C);
}

unint64_t sub_1890EC5F8()
{
  unint64_t result = qword_18C7690F0;
  if (!qword_18C7690F0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F4778, &type metadata for SigningIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C7690F0);
  }

  return result;
}

unint64_t sub_1890EC63C()
{
  unint64_t result = qword_18C7690F8;
  if (!qword_18C7690F8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F4794, &type metadata for SigningIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C7690F8);
  }

  return result;
}

uint64_t sub_1890EC680(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D29EC, (uint64_t (*)(void))sub_1890EC694);
}

unint64_t sub_1890EC694()
{
  unint64_t result = qword_18C769100;
  if (!qword_18C769100)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for SigningIdentifier,  &type metadata for SigningIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C769100);
  }

  return result;
}

uint64_t sub_1890EC6DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890EC6F0, (uint64_t (*)(void))sub_1890EC734);
}

unint64_t sub_1890EC6F0()
{
  unint64_t result = qword_18C769140;
  if (!qword_18C769140)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F4870, &type metadata for TeamIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C769140);
  }

  return result;
}

unint64_t sub_1890EC734()
{
  unint64_t result = qword_18C769148;
  if (!qword_18C769148)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F488C, &type metadata for TeamIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C769148);
  }

  return result;
}

uint64_t sub_1890EC778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D2A30, (uint64_t (*)(void))sub_1890EC78C);
}

unint64_t sub_1890EC78C()
{
  unint64_t result = qword_18C769150;
  if (!qword_18C769150)
  {
    unint64_t result = MEMORY[0x1895DFB60](&protocol conformance descriptor for TeamIdentifier, &type metadata for TeamIdentifier);
    atomic_store(result, (unint64_t *)&qword_18C769150);
  }

  return result;
}

unint64_t sub_1890EC7D4(uint64_t a1)
{
  unint64_t result = sub_1890EC7F8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1890EC7F8()
{
  unint64_t result = qword_18C769190;
  if (!qword_18C769190)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F4930, &type metadata for TeamIdentifierMatchesCurrentProcess);
    atomic_store(result, (unint64_t *)&qword_18C769190);
  }

  return result;
}

uint64_t sub_1890EC83C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D2A74, (uint64_t (*)(void))sub_1890EC850);
}

unint64_t sub_1890EC850()
{
  unint64_t result = qword_18C769198;
  if (!qword_18C769198)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for TeamIdentifierMatchesCurrentProcess,  &type metadata for TeamIdentifierMatchesCurrentProcess);
    atomic_store(result, (unint64_t *)&qword_18C769198);
  }

  return result;
}

uint64_t sub_1890EC894(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1890EC8B8( a1,  a2,  a3,  (uint64_t (*)(void))sub_1890EC908,  (uint64_t (*)(void))sub_1890EC94C,  (uint64_t (*)(void))sub_1890EC990,  (uint64_t (*)(void))sub_1890EC9D4);
}

uint64_t sub_1890EC8B8( void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  a1[2] = a4();
  a1[3] = a5();
  a1[4] = a6();
  uint64_t result = a7();
  a1[5] = result;
  return result;
}

unint64_t sub_1890EC908()
{
  unint64_t result = qword_18C7691A0;
  if (!qword_18C7691A0)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ValidationCategory.Value,  &type metadata for ValidationCategory.Value);
    atomic_store(result, (unint64_t *)&qword_18C7691A0);
  }

  return result;
}

unint64_t sub_1890EC94C()
{
  unint64_t result = qword_18C7691A8;
  if (!qword_18C7691A8)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ValidationCategory.Value,  &type metadata for ValidationCategory.Value);
    atomic_store(result, (unint64_t *)&qword_18C7691A8);
  }

  return result;
}

unint64_t sub_1890EC990()
{
  unint64_t result = qword_18C7691B0;
  if (!qword_18C7691B0)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ValidationCategory.Value,  &type metadata for ValidationCategory.Value);
    atomic_store(result, (unint64_t *)&qword_18C7691B0);
  }

  return result;
}

unint64_t sub_1890EC9D4()
{
  unint64_t result = qword_18C7691B8;
  if (!qword_18C7691B8)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ValidationCategory.Value,  &type metadata for ValidationCategory.Value);
    atomic_store(result, (unint64_t *)&qword_18C7691B8);
  }

  return result;
}

unint64_t sub_1890ECA1C()
{
  unint64_t result = qword_18C7691C0;
  if (!qword_18C7691C0)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ValidationCategory.Value,  &type metadata for ValidationCategory.Value);
    atomic_store(result, (unint64_t *)&qword_18C7691C0);
  }

  return result;
}

unint64_t sub_1890ECA64()
{
  unint64_t result = qword_18C7691C8;
  if (!qword_18C7691C8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F499C, &type metadata for ValidationCategory.Value);
    atomic_store(result, (unint64_t *)&qword_18C7691C8);
  }

  return result;
}

uint64_t sub_1890ECAA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890ECABC, (uint64_t (*)(void))sub_1890ECB00);
}

unint64_t sub_1890ECABC()
{
  unint64_t result = qword_18C769210;
  if (!qword_18C769210)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F4B78, &type metadata for ValidationCategory);
    atomic_store(result, (unint64_t *)&qword_18C769210);
  }

  return result;
}

unint64_t sub_1890ECB00()
{
  unint64_t result = qword_18C769218;
  if (!qword_18C769218)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F4B94, &type metadata for ValidationCategory);
    atomic_store(result, (unint64_t *)&qword_18C769218);
  }

  return result;
}

uint64_t sub_1890ECB44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1890D0750(a1, a2, a3, (uint64_t (*)(void))sub_1890D2AB8, (uint64_t (*)(void))sub_1890ECB58);
}

unint64_t sub_1890ECB58()
{
  unint64_t result = qword_18C769220;
  if (!qword_18C769220)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ValidationCategory,  &type metadata for ValidationCategory);
    atomic_store(result, (unint64_t *)&qword_18C769220);
  }

  return result;
}

_UNKNOWN **sub_1890ECB9C()
{
  return &off_18A347E30;
}

ValueMetadata *type metadata accessor for ProcessConstraintBuilder()
{
  return &type metadata for ProcessConstraintBuilder;
}

ValueMetadata *type metadata accessor for LaunchConstraintBuilder()
{
  return &type metadata for LaunchConstraintBuilder;
}

ValueMetadata *type metadata accessor for OnDiskConstraintBuilder()
{
  return &type metadata for OnDiskConstraintBuilder;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for AppleInternal()
{
  return &type metadata for AppleInternal;
}

uint64_t destroy for CodeDirectoryHash(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1 + 8);
}

uint64_t assignWithCopy for CodeDirectoryHash(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
  return a1;
}

uint64_t assignWithTake for CodeDirectoryHash(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

ValueMetadata *type metadata accessor for CodeDirectoryHash()
{
  return &type metadata for CodeDirectoryHash;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ProcessCodeSigningFlags()
{
  return &type metadata for ProcessCodeSigningFlags;
}

ValueMetadata *type metadata accessor for ProcessCodeSigningFlags.ValueSet()
{
  return &type metadata for ProcessCodeSigningFlags.ValueSet;
}

uint64_t destroy for OnDiskCodeSigningFlags()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s27LightweightCodeRequirements23ProcessCodeSigningFlagsVwcp_0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_BYTE *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = *(_BYTE *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s27LightweightCodeRequirements23ProcessCodeSigningFlagsVwca_0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 16);
  *(_BYTE *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = *(_BYTE *)(a2 + 24);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s27LightweightCodeRequirements23ProcessCodeSigningFlagsVwta_0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_BYTE *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = *(_BYTE *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s27LightweightCodeRequirements23ProcessCodeSigningFlagsVwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 32);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s27LightweightCodeRequirements23ProcessCodeSigningFlagsVwst_0( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 40) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)(result + 32) = a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for OnDiskCodeSigningFlags()
{
  return &type metadata for OnDiskCodeSigningFlags;
}

ValueMetadata *type metadata accessor for OnDiskCodeSigningFlags.ValueSet()
{
  return &type metadata for OnDiskCodeSigningFlags.ValueSet;
}

ValueMetadata *type metadata accessor for DeveloperMode()
{
  return &type metadata for DeveloperMode;
}

uint64_t method lookup function for EntitlementsQuery()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EntitlementsQuery.key(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144LL))();
}

uint64_t dispatch thunk of EntitlementsQuery.elementAtIndex(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152LL))();
}

uint64_t dispatch thunk of EntitlementsQuery.matchSingle(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160LL))();
}

{
  uint64_t v0;
  return (*(uint64_t (**)(void))(*(void *)v0 + 192LL))();
}

uint64_t dispatch thunk of EntitlementsQuery.matchPrefixSingle(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168LL))();
}

uint64_t dispatch thunk of EntitlementsQuery.match(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176LL))();
}

{
  uint64_t v0;
  return (*(uint64_t (**)(void))(*(void *)v0 + 184LL))();
}

{
  uint64_t v0;
  return (*(uint64_t (**)(void))(*(void *)v0 + 216LL))();
}

uint64_t dispatch thunk of EntitlementsQuery.matchPrefix(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200LL))();
}

uint64_t dispatch thunk of EntitlementsQuery.keyPrefix(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208LL))();
}

uint64_t dispatch thunk of EntitlementsQuery.matchType(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224LL))();
}

uint64_t dispatch thunk of EntitlementsQuery.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240LL))();
}

uint64_t dispatch thunk of EntitlementsQuery.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t getEnumTagSinglePayload for EntitlementsQuery.DataType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }

uint64_t storeEnumTagSinglePayload for EntitlementsQuery.DataType( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFB) {
    return ((uint64_t (*)(void))((char *)&loc_1890ED064 + 4 * byte_1890F3123[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1890ED098 + 4 * byte_1890F311E[v4]))();
}

uint64_t sub_1890ED098(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1890ED0A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1890ED0A8LL);
  }
  return result;
}

uint64_t sub_1890ED0B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1890ED0BCLL);
  }
  *(_BYTE *)__n128 result = a2 + 4;
  return result;
}

uint64_t sub_1890ED0C0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1890ED0C8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EntitlementsQuery.DataType()
{
  return &type metadata for EntitlementsQuery.DataType;
}

ValueMetadata *type metadata accessor for InfoPlistHash()
{
  return &type metadata for InfoPlistHash;
}

ValueMetadata *type metadata accessor for InTrustCacheWithConstraintCategory()
{
  return &type metadata for InTrustCacheWithConstraintCategory;
}

ValueMetadata *type metadata accessor for IsInitProcess()
{
  return &type metadata for IsInitProcess;
}

ValueMetadata *type metadata accessor for IsMainBinary()
{
  return &type metadata for IsMainBinary;
}

ValueMetadata *type metadata accessor for IsSIPProtected()
{
  return &type metadata for IsSIPProtected;
}

ValueMetadata *type metadata accessor for LaunchType()
{
  return &type metadata for LaunchType;
}

ValueMetadata *type metadata accessor for LaunchType.Value()
{
  return &type metadata for LaunchType.Value;
}

ValueMetadata *type metadata accessor for OnAuthorizedAuthAPFSVolume()
{
  return &type metadata for OnAuthorizedAuthAPFSVolume;
}

ValueMetadata *type metadata accessor for OnSystemVolume()
{
  return &type metadata for OnSystemVolume;
}

ValueMetadata *type metadata accessor for OSEnvironment()
{
  return &type metadata for OSEnvironment;
}

ValueMetadata *type metadata accessor for PlatformType()
{
  return &type metadata for PlatformType;
}

ValueMetadata *type metadata accessor for PlatformType.Value()
{
  return &type metadata for PlatformType.Value;
}

ValueMetadata *type metadata accessor for PlatformIdentifier()
{
  return &type metadata for PlatformIdentifier;
}

ValueMetadata *type metadata accessor for SigningIdentifier()
{
  return &type metadata for SigningIdentifier;
}

ValueMetadata *type metadata accessor for TeamIdentifier()
{
  return &type metadata for TeamIdentifier;
}

ValueMetadata *type metadata accessor for TeamIdentifierMatchesCurrentProcess()
{
  return &type metadata for TeamIdentifierMatchesCurrentProcess;
}

uint64_t _s27LightweightCodeRequirements13AppleInternalVwcp_0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a1 + 8, a2 + 8);
  return a1;
}

uint64_t _s27LightweightCodeRequirements13AppleInternalVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1890ED274(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0LL;
    *(_OWORD *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 48) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ValidationCategory()
{
  return &type metadata for ValidationCategory;
}

ValueMetadata *type metadata accessor for ValidationCategory.Value()
{
  return &type metadata for ValidationCategory.Value;
}

ValueMetadata *type metadata accessor for ValidationCategory.CodingKeys()
{
  return &type metadata for ValidationCategory.CodingKeys;
}

ValueMetadata *type metadata accessor for TeamIdentifierMatchesCurrentProcess.CodingKeys()
{
  return &type metadata for TeamIdentifierMatchesCurrentProcess.CodingKeys;
}

ValueMetadata *type metadata accessor for TeamIdentifier.CodingKeys()
{
  return &type metadata for TeamIdentifier.CodingKeys;
}

ValueMetadata *type metadata accessor for SigningIdentifier.CodingKeys()
{
  return &type metadata for SigningIdentifier.CodingKeys;
}

ValueMetadata *type metadata accessor for PlatformIdentifier.CodingKeys()
{
  return &type metadata for PlatformIdentifier.CodingKeys;
}

ValueMetadata *type metadata accessor for PlatformType.CodingKeys()
{
  return &type metadata for PlatformType.CodingKeys;
}

ValueMetadata *type metadata accessor for OSEnvironment.CodingKeys()
{
  return &type metadata for OSEnvironment.CodingKeys;
}

ValueMetadata *type metadata accessor for OnSystemVolume.CodingKeys()
{
  return &type metadata for OnSystemVolume.CodingKeys;
}

ValueMetadata *type metadata accessor for OnAuthorizedAuthAPFSVolume.CodingKeys()
{
  return &type metadata for OnAuthorizedAuthAPFSVolume.CodingKeys;
}

ValueMetadata *type metadata accessor for LaunchType.CodingKeys()
{
  return &type metadata for LaunchType.CodingKeys;
}

ValueMetadata *type metadata accessor for IsSIPProtected.CodingKeys()
{
  return &type metadata for IsSIPProtected.CodingKeys;
}

ValueMetadata *type metadata accessor for IsMainBinary.CodingKeys()
{
  return &type metadata for IsMainBinary.CodingKeys;
}

ValueMetadata *type metadata accessor for IsInitProcess.CodingKeys()
{
  return &type metadata for IsInitProcess.CodingKeys;
}

ValueMetadata *type metadata accessor for InTrustCacheWithConstraintCategory.CodingKeys()
{
  return &type metadata for InTrustCacheWithConstraintCategory.CodingKeys;
}

ValueMetadata *type metadata accessor for InfoPlistHash.CodingKeys()
{
  return &type metadata for InfoPlistHash.CodingKeys;
}

ValueMetadata *type metadata accessor for EntitlementsQuery.CodingKeys()
{
  return &type metadata for EntitlementsQuery.CodingKeys;
}

ValueMetadata *type metadata accessor for DeveloperMode.CodingKeys()
{
  return &type metadata for DeveloperMode.CodingKeys;
}

ValueMetadata *type metadata accessor for OnDiskCodeSigningFlags.CodingKeys()
{
  return &type metadata for OnDiskCodeSigningFlags.CodingKeys;
}

ValueMetadata *type metadata accessor for ProcessCodeSigningFlags.CodingKeys()
{
  return &type metadata for ProcessCodeSigningFlags.CodingKeys;
}

ValueMetadata *type metadata accessor for CodeDirectoryHash.CodingKeys()
{
  return &type metadata for CodeDirectoryHash.CodingKeys;
}

uint64_t sub_1890ED42C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1890ED434()
{
  uint64_t result = sub_1890F1668();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t *sub_1890ED4B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  __int128 v3 = a1;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = v6;
  if (*(_DWORD *)(v5 + 84)) {
    size_t v8 = *(void *)(v5 + 64);
  }
  else {
    size_t v8 = *(void *)(v5 + 64) + 1LL;
  }
  int v9 = v6 & 0x100000;
  if (v7 > 7 || v9 != 0 || ((v8 + 7 + ((v7 + 1) & ~v7)) & 0xFFFFFFFFFFFFFFF8LL) + 8 > 0x18)
  {
    uint64_t v12 = *a2;
    *__int128 v3 = *a2;
    __int128 v3 = (uint64_t *)(v12 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16)));
    swift_retain();
  }

  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    uint64_t v13 = (void *)(((unint64_t)a1 + v7 + 1) & ~v7);
    size_t v14 = (const void *)(((unint64_t)a2 + v7 + 1) & ~v7);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v14, 1LL, v4))
    {
      memcpy(v13, v14, v8);
    }

    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(v13, v14, v4);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(v13, 0LL, 1LL, v4);
    }

    *(void *)(((unint64_t)v13 + v8 + 7) & 0xFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v14 + v8 + 7) & 0xFFFFFFFFFFFFF8LL);
    swift_bridgeObjectRetain();
  }

  return v3;
}

uint64_t sub_1890ED5F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  uint64_t v3 = *(void *)(v2 - 8);
  unint64_t v4 = (a1 + *(unsigned __int8 *)(v3 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return swift_bridgeObjectRelease();
}

_BYTE *sub_1890ED670(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (void *)((unint64_t)&a1[v6 + 1] & ~v6);
  size_t v8 = (const void *)((unint64_t)&a2[v6 + 1] & ~v6);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v8, 1LL, v4))
  {
    int v9 = *(_DWORD *)(v5 + 84);
    size_t v10 = *(void *)(v5 + 64);
    if (v9) {
      size_t v11 = v10;
    }
    else {
      size_t v11 = v10 + 1;
    }
    memcpy(v7, v8, v11);
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(v7, v8, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(v7, 0LL, 1LL, v4);
    int v9 = *(_DWORD *)(v5 + 84);
    size_t v10 = *(void *)(v5 + 64);
  }

  if (v9) {
    size_t v12 = v10;
  }
  else {
    size_t v12 = v10 + 1;
  }
  *(void *)(((unint64_t)v7 + v12 + 7) & 0xFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v8 + v12 + 7) & 0xFFFFFFFFFFFFF8LL);
  swift_bridgeObjectRetain();
  return a1;
}

_BYTE *sub_1890ED760(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (void *)((unint64_t)&a1[v6 + 1] & ~v6);
  size_t v8 = (void *)((unint64_t)&a2[v6 + 1] & ~v6);
  int v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v10 = v9(v7, 1LL, v4);
  int v11 = v9(v8, 1LL, v4);
  if (v10)
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 16))(v7, v8, v4);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(v7, 0LL, 1LL, v4);
      goto LABEL_10;
    }
  }

  else
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(v7, v8, v4);
      goto LABEL_10;
    }

    (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  }

  if (*(_DWORD *)(v5 + 84)) {
    size_t v12 = *(void *)(v5 + 64);
  }
  else {
    size_t v12 = *(void *)(v5 + 64) + 1LL;
  }
  memcpy(v7, v8, v12);
LABEL_10:
  if (*(_DWORD *)(v5 + 84)) {
    uint64_t v13 = *(void *)(v5 + 64);
  }
  else {
    uint64_t v13 = *(void *)(v5 + 64) + 1LL;
  }
  *(void *)(((unint64_t)v7 + v13 + 7) & 0xFFFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v8 + v13 + 7) & 0xFFFFFFFFFFFFF8LL);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_BYTE *sub_1890ED8A8(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (void *)((unint64_t)&a1[v6 + 1] & ~v6);
  size_t v8 = (const void *)((unint64_t)&a2[v6 + 1] & ~v6);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v8, 1LL, v4))
  {
    int v9 = *(_DWORD *)(v5 + 84);
    size_t v10 = *(void *)(v5 + 64);
    if (v9) {
      size_t v11 = v10;
    }
    else {
      size_t v11 = v10 + 1;
    }
    memcpy(v7, v8, v11);
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(v7, v8, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(v7, 0LL, 1LL, v4);
    int v9 = *(_DWORD *)(v5 + 84);
    size_t v10 = *(void *)(v5 + 64);
  }

  if (v9) {
    size_t v12 = v10;
  }
  else {
    size_t v12 = v10 + 1;
  }
  *(void *)(((unint64_t)v7 + v12 + 7) & 0xFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v8 + v12 + 7) & 0xFFFFFFFFFFFFF8LL);
  return a1;
}

_BYTE *sub_1890ED994(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (void *)((unint64_t)&a1[v6 + 1] & ~v6);
  size_t v8 = (void *)((unint64_t)&a2[v6 + 1] & ~v6);
  int v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v10 = v9(v7, 1LL, v4);
  int v11 = v9(v8, 1LL, v4);
  if (v10)
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 32))(v7, v8, v4);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(v7, 0LL, 1LL, v4);
      goto LABEL_10;
    }
  }

  else
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(v7, v8, v4);
      goto LABEL_10;
    }

    (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  }

  if (*(_DWORD *)(v5 + 84)) {
    size_t v12 = *(void *)(v5 + 64);
  }
  else {
    size_t v12 = *(void *)(v5 + 64) + 1LL;
  }
  memcpy(v7, v8, v12);
LABEL_10:
  if (*(_DWORD *)(v5 + 84)) {
    uint64_t v13 = *(void *)(v5 + 64);
  }
  else {
    uint64_t v13 = *(void *)(v5 + 64) + 1LL;
  }
  *(void *)(((unint64_t)v7 + v13 + 7) & 0xFFFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v8 + v13 + 7) & 0xFFFFFFFFFFFFF8LL);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1890EDAD4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  int v5 = *(_DWORD *)(v4 + 84);
  if (v5) {
    unsigned int v6 = v5 - 1;
  }
  else {
    unsigned int v6 = 0;
  }
  if (v6 <= 0x7FFFFFFE) {
    unsigned int v7 = 2147483646;
  }
  else {
    unsigned int v7 = v6;
  }
  uint64_t v8 = *(void *)(v4 + 64);
  if (!v5) {
    ++v8;
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v9 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v10 = v8 + 7;
  if (v7 < a2)
  {
    if (((((v10 + ((v9 + 1) & ~v9)) & 0xFFFFFFFFFFFFFFF8LL) + 8) & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = a2 - v7 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0LL;
    }
    __asm { BR              X17 }
  }

  uint64_t v15 = (a1 + v9 + 1) & ~v9;
  if (v6 < 0x7FFFFFFE)
  {
    unint64_t v17 = *(void *)((v10 + v15) & 0xFFFFFFFFFFFFF8LL);
    if (v17 >= 0xFFFFFFFF) {
      LODWORD(v17) = -1;
    }
    else {
      return 0LL;
    }
  }

  else
  {
    unsigned int v16 = (*(uint64_t (**)(uint64_t))(v4 + 48))(v15);
    if (v16 >= 2) {
      return v16 - 1;
    }
    else {
      return 0LL;
    }
  }

void sub_1890EDC30(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0u;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8LL);
  int v8 = *(_DWORD *)(v7 + 84);
  if (v8) {
    unsigned int v9 = v8 - 1;
  }
  else {
    unsigned int v9 = 0;
  }
  if (v9 <= 0x7FFFFFFE) {
    unsigned int v10 = 2147483646;
  }
  else {
    unsigned int v10 = v9;
  }
  uint64_t v11 = *(void *)(v7 + 64);
  if (!v8) {
    ++v11;
  }
  if (v10 < a3)
  {
    unsigned int v12 = a3 - v10;
    else {
      unsigned int v13 = 2;
    }
    if (v13 >= 0x10000) {
      int v14 = 4;
    }
    else {
      int v14 = 2;
    }
    if (v13 < 0x100) {
      int v14 = 1;
    }
    if (v13 >= 2) {
      int v6 = v14;
    }
    else {
      int v6 = 0;
    }
  }

  if (a2 > v10)
  {
    if ((((_DWORD)v11 + 7 + ((*(unsigned __int8 *)(v7 + 80) + 1) & ~*(unsigned __int8 *)(v7 + 80))) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      unsigned int v15 = ~v10 + a2;
      bzero( a1,  ((v11 + 7 + ((*(unsigned __int8 *)(v7 + 80) + 1LL) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))) & 0xFFFFFFFFFFFFFFF8LL)
      + 8);
      *a1 = v15;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X16 }

uint64_t sub_1890EDD3C@<X0>( unsigned int a1@<W1>, size_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  *(_BYTE *)(v15 + v16) = 0;
  if (a1)
  {
    unint64_t v17 = (void *)((v15 + v14 + 1) & v10);
    if (v11 < 0x7FFFFFFE)
    {
      uint64_t v19 = (void *)(((unint64_t)v17 + v13) & 0xFFFFFFFFFFFFFFF8LL);
      if (a1 > 0x7FFFFFFE)
      {
        *uint64_t v19 = 0LL;
        *(_DWORD *)uint64_t v19 = a1 - 0x7FFFFFFF;
      }

      else
      {
        *uint64_t v19 = a1;
      }
    }

    else if (v11 >= a1)
    {
      return (*(uint64_t (**)(void *, void))(v12 + 56))(v17, a1 + 1);
    }

    else if ((_DWORD)a2)
    {
      else {
        int v18 = 4;
      }
      bzero(v17, a2);
      __asm { BR              X10 }
    }
  }

  return result;
}

void sub_1890EDE4C()
{
  *(_WORD *)uint64_t v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
}

void sub_1890EDE5C()
{
  _WORD *v0 = v1;
}

void sub_1890EDE64()
{
  _DWORD *v0 = v1;
}

uint64_t type metadata accessor for ContainerConstraint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ContainerConstraint);
}

uint64_t _s27LightweightCodeRequirements18ValidationCategoryV10CodingKeysOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_1890EDEC8 + 4 * byte_1890F3140[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1890EDEFC + 4 * byte_1890F313B[v4]))();
}

uint64_t sub_1890EDEFC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1890EDF04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1890EDF0CLL);
  }
  return result;
}

uint64_t sub_1890EDF18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1890EDF20LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_1890EDF24(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1890EDF2C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppleInternal.CodingKeys()
{
  return &type metadata for AppleInternal.CodingKeys;
}

unint64_t sub_1890EDF4C()
{
  unint64_t result = qword_18C769420;
  if (!qword_18C769420)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5140, &type metadata for AppleInternal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769420);
  }

  return result;
}

unint64_t sub_1890EDF98()
{
  unint64_t result = qword_18C769428;
  if (!qword_18C769428)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F524C, &type metadata for CodeDirectoryHash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769428);
  }

  return result;
}

unint64_t sub_1890EDFE0()
{
  unint64_t result = qword_18C769430;
  if (!qword_18C769430)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5304, &type metadata for ProcessCodeSigningFlags.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769430);
  }

  return result;
}

unint64_t sub_1890EE028()
{
  unint64_t result = qword_18C769438;
  if (!qword_18C769438)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F53BC, &type metadata for OnDiskCodeSigningFlags.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769438);
  }

  return result;
}

unint64_t sub_1890EE070()
{
  unint64_t result = qword_18C769440;
  if (!qword_18C769440)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F54AC, &type metadata for DeveloperMode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769440);
  }

  return result;
}

unint64_t sub_1890EE0B8()
{
  unint64_t result = qword_18C769448;
  if (!qword_18C769448)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F559C, &type metadata for EntitlementsQuery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769448);
  }

  return result;
}

unint64_t sub_1890EE100()
{
  unint64_t result = qword_18C769450;
  if (!qword_18C769450)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F568C, &type metadata for InfoPlistHash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769450);
  }

  return result;
}

unint64_t sub_1890EE148()
{
  unint64_t result = qword_18C769458;
  if (!qword_18C769458)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F577C, &type metadata for InTrustCacheWithConstraintCategory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769458);
  }

  return result;
}

unint64_t sub_1890EE190()
{
  unint64_t result = qword_18C769460;
  if (!qword_18C769460)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F586C, &type metadata for IsInitProcess.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769460);
  }

  return result;
}

unint64_t sub_1890EE1D8()
{
  unint64_t result = qword_18C769468;
  if (!qword_18C769468)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F595C, &type metadata for IsMainBinary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769468);
  }

  return result;
}

unint64_t sub_1890EE220()
{
  unint64_t result = qword_18C769470;
  if (!qword_18C769470)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5A4C, &type metadata for IsSIPProtected.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769470);
  }

  return result;
}

unint64_t sub_1890EE268()
{
  unint64_t result = qword_18C769478;
  if (!qword_18C769478)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5B3C, &type metadata for LaunchType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769478);
  }

  return result;
}

unint64_t sub_1890EE2B0()
{
  unint64_t result = qword_18C769480;
  if (!qword_18C769480)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5C2C, &type metadata for OnAuthorizedAuthAPFSVolume.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769480);
  }

  return result;
}

unint64_t sub_1890EE2F8()
{
  unint64_t result = qword_18C769488;
  if (!qword_18C769488)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5D1C, &type metadata for OnSystemVolume.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769488);
  }

  return result;
}

unint64_t sub_1890EE340()
{
  unint64_t result = qword_18C769490;
  if (!qword_18C769490)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5E0C, &type metadata for OSEnvironment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769490);
  }

  return result;
}

unint64_t sub_1890EE388()
{
  unint64_t result = qword_18C769498;
  if (!qword_18C769498)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5EFC, &type metadata for PlatformType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769498);
  }

  return result;
}

unint64_t sub_1890EE3D0()
{
  unint64_t result = qword_18C7694A0;
  if (!qword_18C7694A0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5FEC, &type metadata for PlatformIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7694A0);
  }

  return result;
}

unint64_t sub_1890EE418()
{
  unint64_t result = qword_18C7694A8;
  if (!qword_18C7694A8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F60DC, &type metadata for SigningIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7694A8);
  }

  return result;
}

unint64_t sub_1890EE460()
{
  unint64_t result = qword_18C7694B0;
  if (!qword_18C7694B0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F61CC, &type metadata for TeamIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7694B0);
  }

  return result;
}

unint64_t sub_1890EE4A8()
{
  unint64_t result = qword_18C7694B8;
  if (!qword_18C7694B8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F62BC, &type metadata for TeamIdentifierMatchesCurrentProcess.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7694B8);
  }

  return result;
}

unint64_t sub_1890EE4F0()
{
  unint64_t result = qword_18C7694C0;
  if (!qword_18C7694C0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F63AC, &type metadata for ValidationCategory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7694C0);
  }

  return result;
}

unint64_t sub_1890EE538()
{
  unint64_t result = qword_18C7694C8;
  if (!qword_18C7694C8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F62E4, &type metadata for ValidationCategory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7694C8);
  }

  return result;
}

unint64_t sub_1890EE580()
{
  unint64_t result = qword_18C7694D0;
  if (!qword_18C7694D0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F630C, &type metadata for ValidationCategory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7694D0);
  }

  return result;
}

unint64_t sub_1890EE5C8()
{
  unint64_t result = qword_18C7694D8;
  if (!qword_18C7694D8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F61F4, &type metadata for TeamIdentifierMatchesCurrentProcess.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7694D8);
  }

  return result;
}

unint64_t sub_1890EE610()
{
  unint64_t result = qword_18C7694E0;
  if (!qword_18C7694E0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F621C, &type metadata for TeamIdentifierMatchesCurrentProcess.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7694E0);
  }

  return result;
}

unint64_t sub_1890EE658()
{
  unint64_t result = qword_18C7694E8;
  if (!qword_18C7694E8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F6104, &type metadata for TeamIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7694E8);
  }

  return result;
}

unint64_t sub_1890EE6A0()
{
  unint64_t result = qword_18C7694F0;
  if (!qword_18C7694F0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F612C, &type metadata for TeamIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7694F0);
  }

  return result;
}

unint64_t sub_1890EE6E8()
{
  unint64_t result = qword_18C7694F8;
  if (!qword_18C7694F8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F6014, &type metadata for SigningIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7694F8);
  }

  return result;
}

unint64_t sub_1890EE730()
{
  unint64_t result = qword_18C769500;
  if (!qword_18C769500)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F603C, &type metadata for SigningIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769500);
  }

  return result;
}

unint64_t sub_1890EE778()
{
  unint64_t result = qword_18C769508;
  if (!qword_18C769508)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5F24, &type metadata for PlatformIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769508);
  }

  return result;
}

unint64_t sub_1890EE7C0()
{
  unint64_t result = qword_18C769510;
  if (!qword_18C769510)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5F4C, &type metadata for PlatformIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769510);
  }

  return result;
}

unint64_t sub_1890EE808()
{
  unint64_t result = qword_18C769518;
  if (!qword_18C769518)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5E34, &type metadata for PlatformType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769518);
  }

  return result;
}

unint64_t sub_1890EE850()
{
  unint64_t result = qword_18C769520;
  if (!qword_18C769520)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5E5C, &type metadata for PlatformType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769520);
  }

  return result;
}

unint64_t sub_1890EE898()
{
  unint64_t result = qword_18C769528;
  if (!qword_18C769528)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5D44, &type metadata for OSEnvironment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769528);
  }

  return result;
}

unint64_t sub_1890EE8E0()
{
  unint64_t result = qword_18C769530;
  if (!qword_18C769530)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5D6C, &type metadata for OSEnvironment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769530);
  }

  return result;
}

unint64_t sub_1890EE928()
{
  unint64_t result = qword_18C769538;
  if (!qword_18C769538)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5C54, &type metadata for OnSystemVolume.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769538);
  }

  return result;
}

unint64_t sub_1890EE970()
{
  unint64_t result = qword_18C769540;
  if (!qword_18C769540)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5C7C, &type metadata for OnSystemVolume.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769540);
  }

  return result;
}

unint64_t sub_1890EE9B8()
{
  unint64_t result = qword_18C769548;
  if (!qword_18C769548)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5B64, &type metadata for OnAuthorizedAuthAPFSVolume.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769548);
  }

  return result;
}

unint64_t sub_1890EEA00()
{
  unint64_t result = qword_18C769550;
  if (!qword_18C769550)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5B8C, &type metadata for OnAuthorizedAuthAPFSVolume.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769550);
  }

  return result;
}

unint64_t sub_1890EEA48()
{
  unint64_t result = qword_18C769558;
  if (!qword_18C769558)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5A74, &type metadata for LaunchType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769558);
  }

  return result;
}

unint64_t sub_1890EEA90()
{
  unint64_t result = qword_18C769560;
  if (!qword_18C769560)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5A9C, &type metadata for LaunchType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769560);
  }

  return result;
}

unint64_t sub_1890EEAD8()
{
  unint64_t result = qword_18C769568;
  if (!qword_18C769568)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5984, &type metadata for IsSIPProtected.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769568);
  }

  return result;
}

unint64_t sub_1890EEB20()
{
  unint64_t result = qword_18C769570;
  if (!qword_18C769570)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F59AC, &type metadata for IsSIPProtected.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769570);
  }

  return result;
}

unint64_t sub_1890EEB68()
{
  unint64_t result = qword_18C769578;
  if (!qword_18C769578)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5894, &type metadata for IsMainBinary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769578);
  }

  return result;
}

unint64_t sub_1890EEBB0()
{
  unint64_t result = qword_18C769580;
  if (!qword_18C769580)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F58BC, &type metadata for IsMainBinary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769580);
  }

  return result;
}

unint64_t sub_1890EEBF8()
{
  unint64_t result = qword_18C769588;
  if (!qword_18C769588)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F57A4, &type metadata for IsInitProcess.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769588);
  }

  return result;
}

unint64_t sub_1890EEC40()
{
  unint64_t result = qword_18C769590;
  if (!qword_18C769590)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F57CC, &type metadata for IsInitProcess.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769590);
  }

  return result;
}

unint64_t sub_1890EEC88()
{
  unint64_t result = qword_18C769598;
  if (!qword_18C769598)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F56B4, &type metadata for InTrustCacheWithConstraintCategory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769598);
  }

  return result;
}

unint64_t sub_1890EECD0()
{
  unint64_t result = qword_18C7695A0;
  if (!qword_18C7695A0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F56DC, &type metadata for InTrustCacheWithConstraintCategory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7695A0);
  }

  return result;
}

unint64_t sub_1890EED18()
{
  unint64_t result = qword_18C7695A8;
  if (!qword_18C7695A8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F55C4, &type metadata for InfoPlistHash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7695A8);
  }

  return result;
}

unint64_t sub_1890EED60()
{
  unint64_t result = qword_18C7695B0;
  if (!qword_18C7695B0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F55EC, &type metadata for InfoPlistHash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7695B0);
  }

  return result;
}

unint64_t sub_1890EEDA8()
{
  unint64_t result = qword_18C7695B8;
  if (!qword_18C7695B8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F54D4, &type metadata for EntitlementsQuery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7695B8);
  }

  return result;
}

unint64_t sub_1890EEDF0()
{
  unint64_t result = qword_18C7695C0;
  if (!qword_18C7695C0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F54FC, &type metadata for EntitlementsQuery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7695C0);
  }

  return result;
}

unint64_t sub_1890EEE38()
{
  unint64_t result = qword_18C7695C8;
  if (!qword_18C7695C8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F53E4, &type metadata for DeveloperMode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7695C8);
  }

  return result;
}

unint64_t sub_1890EEE80()
{
  unint64_t result = qword_18C7695D0;
  if (!qword_18C7695D0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F540C, &type metadata for DeveloperMode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7695D0);
  }

  return result;
}

unint64_t sub_1890EEEC8()
{
  unint64_t result = qword_18C7695D8;
  if (!qword_18C7695D8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F532C, &type metadata for OnDiskCodeSigningFlags.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7695D8);
  }

  return result;
}

unint64_t sub_1890EEF10()
{
  unint64_t result = qword_18C7695E0;
  if (!qword_18C7695E0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5354, &type metadata for OnDiskCodeSigningFlags.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7695E0);
  }

  return result;
}

unint64_t sub_1890EEF58()
{
  unint64_t result = qword_18C7695E8;
  if (!qword_18C7695E8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5274, &type metadata for ProcessCodeSigningFlags.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7695E8);
  }

  return result;
}

unint64_t sub_1890EEFA0()
{
  unint64_t result = qword_18C7695F0;
  if (!qword_18C7695F0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F529C, &type metadata for ProcessCodeSigningFlags.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7695F0);
  }

  return result;
}

unint64_t sub_1890EEFE8()
{
  unint64_t result = qword_18C7695F8;
  if (!qword_18C7695F8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5184, &type metadata for CodeDirectoryHash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C7695F8);
  }

  return result;
}

unint64_t sub_1890EF030()
{
  unint64_t result = qword_18C769600;
  if (!qword_18C769600)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F51AC, &type metadata for CodeDirectoryHash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769600);
  }

  return result;
}

uint64_t sub_1890EF074(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 8) = MEMORY[0x1895DFB60](&unk_1890F69FC);
  uint64_t result = MEMORY[0x1895DFB60](&unk_1890F6A24, a2);
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1890EF0BC()
{
  unint64_t result = qword_18C769608;
  if (!qword_18C769608)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F5078, &type metadata for AppleInternal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769608);
  }

  return result;
}

unint64_t sub_1890EF104()
{
  unint64_t result = qword_18C769610;
  if (!qword_18C769610)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F50A0, &type metadata for AppleInternal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C769610);
  }

  return result;
}

uint64_t type metadata accessor for ContainerConstraint.CodingKeys( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for ContainerConstraint.CodingKeys);
}

uint64_t sub_1890EF154(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0LL;
    return __clz(__rbit64(v1)) + v2;
  }

  char v5 = *(_BYTE *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1LL << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64LL;
    return __clz(__rbit64(v1)) + v2;
  }

  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2LL;
  }
  unint64_t v8 = v7 - 2;
  unsigned int v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64LL;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64LL;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }

  return v3;
}

uint64_t sub_1890EF1DC(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1LL << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }

  if (((*(void *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8LL) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }

  if (*(_DWORD *)(a5 + 36) == a3)
  {
    uint64_t v5 = *(void *)(*(void *)(a5 + 48) + 16 * a2);
    sub_1890D51E0(*(void *)(a5 + 56) + 40 * a2, result);
    swift_bridgeObjectRetain();
    return v5;
  }

LABEL_8:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

void *sub_1890EF26C(void *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1LL << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }

  if (((*(void *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8LL) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }

  if (*(_DWORD *)(a5 + 36) == a3)
  {
    uint64_t v5 = *(void *)(*(void *)(a5 + 48) + 16 * a2);
    void *result = *(void *)(*(void *)(a5 + 56) + 8 * a2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return (void *)v5;
  }

uint64_t sub_1890EF300(uint64_t a1)
{
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_12;
  }
  if (*(void *)(v11 + 16) != 1LL)
  {
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_12:
    sub_1890D25E0();
    swift_allocError();
    *unint64_t v10 = 1;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }

  sub_1890DBC48(v11);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t result = swift_bridgeObjectRelease();
  if (v3)
  {
    unsigned __int8 v7 = sub_1890F10FC();
    if (v7 != 31)
    {
      if (sub_1890EFBB4(v7) == 0x797265757124LL && v8 == 0xE600000000000000LL)
      {
        swift_bridgeObjectRelease();
LABEL_10:
        __swift_destroy_boxed_opaque_existential_1(a1);
        type metadata accessor for EntitlementsQuery();
        uint64_t result = swift_allocObject();
        *(_WORD *)(result + 16) = 7684;
        *(void *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 24) = v5;
        return result;
      }

      char v9 = sub_1890F183C();
      swift_bridgeObjectRelease();
      if ((v9 & 1) != 0) {
        goto LABEL_10;
      }
    }

    goto LABEL_11;
  }

  __break(1u);
  return result;
}

uint64_t sub_1890EF498()
{
  return 3LL;
}

uint64_t sub_1890EF4A0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7955819 && a2 == 0xE300000000000000LL;
  if (v2 || (sub_1890F183C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0x65756C6176LL && a2 == 0xE500000000000000LL)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else
  {
    char v6 = sub_1890F183C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_1890EF578()
{
  unint64_t v0 = sub_1890F16EC();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3LL;
  }
  else {
    return v0;
  }
}

uint64_t sub_1890EF5C0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1890EF5E8(uint64_t a1)
{
  return a1;
}

uint64_t sub_1890EF610(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768610);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_1890EF650()
{
  return swift_deallocObject();
}

uint64_t sub_1890EF674()
{
  return swift_deallocObject();
}

uint64_t sub_1890EF698(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for EntitlementsQuery();
    uint64_t result = MEMORY[0x1895DFB60](a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1895DFB30](a1, v6, a5);
}

uint64_t sub_1890EF700()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t _s27LightweightCodeRequirements17EntitlementsQueryC10CodingKeysOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_1890EF754 + 4 * byte_1890F314A[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1890EF788 + 4 * byte_1890F3145[v4]))();
}

uint64_t sub_1890EF788(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1890EF790(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1890EF798LL);
  }
  return result;
}

uint64_t sub_1890EF7A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1890EF7ACLL);
  }
  *(_BYTE *)uint64_t result = a2 + 2;
  return result;
}

uint64_t sub_1890EF7B0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1890EF7B8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_1890EF7C4()
{
}

void sub_1890EF7D4()
{
}

void sub_1890EF7E4()
{
}

void SecTaskValidateForRequirement(task:requirement:)()
{
  uint64_t v0 = (void *)sub_1890F1560();
  char v1 = SecTaskValidateForLightweightCodeRequirementData();

  if ((v1 & 1) == 0) {
    __break(1u);
  }
}

unint64_t sub_1890EFB6C()
{
  unint64_t result = qword_18C7697C0;
  if (!qword_18C7697C0)
  {
    type metadata accessor for CFString();
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F1F70, v1);
    atomic_store(result, (unint64_t *)&qword_18C7697C0);
  }

  return result;
}

uint64_t sub_1890EFBB4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1890EFBF4 + 4 * byte_1890F6C30[a1]))( 0x6E692D656C707061LL,  0xEE006C616E726574LL);
}

uint64_t sub_1890EFBF4()
{
  return 0x687361686463LL;
}

unint64_t sub_1890EFC08()
{
  return 0xD000000000000012LL;
}

uint64_t sub_1890EFE10()
{
  return 1684955428LL;
}

uint64_t sub_1890EFE20()
{
  return 0x7272612D646E6124LL;
}

uint64_t sub_1890EFE3C()
{
  return 7235876LL;
}

uint64_t sub_1890EFE4C()
{
  return 0x68632D67616C6624LL;
}

uint64_t sub_1890EFE6C()
{
  return 7628580LL;
}

uint64_t sub_1890EFE7C()
{
  return 1702127396LL;
}

uint64_t sub_1890EFE8C()
{
  return 1702128676LL;
}

uint64_t sub_1890EFEA0()
{
  return 7499556LL;
}

uint64_t sub_1890EFEB0()
{
  return 0x617272612D726F24LL;
}

uint64_t sub_1890EFECC()
{
  return 0x797265757124LL;
}

uint64_t sub_1890EFEE0()
{
  return 7629860LL;
}

uint64_t sub_1890EFEF4(uint64_t a1)
{
  uint64_t v28 = a1 + 64;
  uint64_t v2 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v3 = -1LL;
  if (v2 < 64) {
    uint64_t v3 = ~(-1LL << v2);
  }
  unint64_t v4 = v3 & *(void *)(a1 + 64);
  uint64_t v41 = &v40;
  int64_t v29 = (unint64_t)(v2 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v5 = 0LL;
  char v6 = (void *)MEMORY[0x18961AFF0];
  while (1)
  {
    if (v4)
    {
      unint64_t v8 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      unint64_t v9 = v8 | (v5 << 6);
LABEL_8:
      sub_1890F114C(*(void *)(a1 + 48) + 40 * v9, (uint64_t)&v33);
      sub_1890DBB30(*(void *)(a1 + 56) + 32 * v9, (uint64_t)v35 + 8);
      goto LABEL_18;
    }

    int64_t v10 = v5 + 1;
    if (__OFADD__(v5, 1LL)) {
      goto LABEL_49;
    }
    if (v10 < v29)
    {
      unint64_t v11 = *(void *)(v28 + 8 * v10);
      if (v11) {
        goto LABEL_12;
      }
      v5 += 2LL;
      if (v10 + 1 >= v29)
      {
        int64_t v5 = v10;
      }

      else
      {
        unint64_t v11 = *(void *)(v28 + 8 * v5);
        if (v11)
        {
          ++v10;
LABEL_12:
          unint64_t v4 = (v11 - 1) & v11;
          unint64_t v9 = __clz(__rbit64(v11)) + (v10 << 6);
          int64_t v5 = v10;
          goto LABEL_8;
        }

        if (v10 + 2 < v29)
        {
          unint64_t v11 = *(void *)(v28 + 8 * (v10 + 2));
          if (v11)
          {
            v10 += 2LL;
            goto LABEL_12;
          }

          int64_t v25 = v10 + 3;
          if (v10 + 3 < v29)
          {
            unint64_t v11 = *(void *)(v28 + 8 * v25);
            if (!v11)
            {
              while (1)
              {
                int64_t v10 = v25 + 1;
                if (__OFADD__(v25, 1LL)) {
                  goto LABEL_50;
                }
                if (v10 >= v29)
                {
                  int64_t v5 = v29 - 1;
                  goto LABEL_17;
                }

                unint64_t v11 = *(void *)(v28 + 8 * v10);
                ++v25;
                if (v11) {
                  goto LABEL_12;
                }
              }
            }

            v10 += 3LL;
            goto LABEL_12;
          }

          int64_t v5 = v10 + 2;
        }
      }
    }

uint64_t ConstraintCategory.init(rawValue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  if (result == 255) {
    uint64_t v2 = 255LL;
  }
  else {
    uint64_t v2 = 0LL;
  }
  BOOL v3 = result != 255;
  if (result == 17)
  {
    uint64_t v2 = 17LL;
    BOOL v3 = 0;
  }

  if (!result)
  {
    uint64_t v2 = 0LL;
    BOOL v3 = 0;
  }

  *(void *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

uint64_t sub_1890F035C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = MEMORY[0x189617FA8];
  if (swift_dynamicCast())
  {
    swift_bridgeObjectRelease();
    sub_1890DBB30(a1, (uint64_t)v24);
    char v6 = &off_18A349C48;
LABEL_3:
    a2[3] = v5;
    a2[4] = (uint64_t)v6;
LABEL_7:
    swift_dynamicCast();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  }

  uint64_t v7 = MEMORY[0x189606D70];
  if (swift_dynamicCast())
  {
    sub_1890D74E0(v23[0], v23[1]);
    sub_1890DBB30(a1, (uint64_t)v24);
    unint64_t v8 = &off_18A349CD8;
LABEL_6:
    a2[3] = v7;
    a2[4] = (uint64_t)v8;
    goto LABEL_7;
  }

  if (swift_dynamicCast())
  {
    sub_1890DBB30(a1, (uint64_t)v24);
    swift_dynamicCast();
    a2[3] = MEMORY[0x18961A4C0];
    a2[4] = (uint64_t)&off_18A349C78;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  }

  if (swift_dynamicCast())
  {
    sub_1890DBB30(a1, (uint64_t)v24);
    swift_dynamicCast();
    uint64_t v10 = MEMORY[0x18961A4C0];
    uint64_t v11 = (char)v27;
LABEL_17:
    a2[3] = v10;
    a2[4] = (uint64_t)&off_18A349C78;
    *a2 = v11;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  }

  if (swift_dynamicCast())
  {
    sub_1890DBB30(a1, (uint64_t)v24);
    swift_dynamicCast();
    uint64_t v10 = MEMORY[0x18961A4C0];
    uint64_t v11 = (__int16)v27;
    goto LABEL_17;
  }

  if (swift_dynamicCast())
  {
    sub_1890DBB30(a1, (uint64_t)v24);
    swift_dynamicCast();
    uint64_t v10 = MEMORY[0x18961A4C0];
    uint64_t v11 = (int)v27;
    goto LABEL_17;
  }

  uint64_t v5 = MEMORY[0x18961A4C0];
  if (swift_dynamicCast())
  {
    sub_1890DBB30(a1, (uint64_t)v24);
    char v6 = &off_18A349C78;
    goto LABEL_3;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C769800);
  if (!swift_dynamicCast())
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C769808);
    if (!swift_dynamicCast())
    {
      uint64_t v7 = MEMORY[0x1896184C8];
      if (!swift_dynamicCast())
      {
        sub_1890D25E0();
        swift_allocError();
        *unint64_t v20 = 1;
        swift_willThrow();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      }

      sub_1890DBB30(a1, (uint64_t)v24);
      unint64_t v8 = &off_18A349CA8;
      goto LABEL_6;
    }

    swift_bridgeObjectRelease();
    sub_1890DBB30(a1, (uint64_t)v24);
    swift_dynamicCast();
    uint64_t v14 = sub_1890EFEF4(v27);
    swift_bridgeObjectRelease();
    if (v2) {
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    }
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7685A8);
    char v19 = &off_18A349CF0;
LABEL_37:
    a2[3] = v18;
    a2[4] = (uint64_t)v19;
    *a2 = v14;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  }

  swift_bridgeObjectRelease();
  sub_1890DBB30(a1, (uint64_t)v24);
  swift_dynamicCast();
  int64_t v12 = *(void *)(v23[0] + 16);
  if (!v12)
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = MEMORY[0x18961AFE8];
LABEL_36:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C768600);
    char v19 = &off_18A349CF8;
    goto LABEL_37;
  }

  uint64_t v25 = MEMORY[0x18961AFE8];
  sub_1890D095C(0LL, v12, 0);
  uint64_t v13 = v23[0] + 32;
  while (1)
  {
    sub_1890DBB30(v13, (uint64_t)v23);
    sub_1890F035C(v24, v23);
    if (v2) {
      break;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    uint64_t v14 = v25;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_1890D095C(0LL, *(void *)(v14 + 16) + 1LL, 1);
      uint64_t v14 = v25;
    }

    unint64_t v15 = *(void *)(v14 + 16);
    unint64_t v16 = *(void *)(v14 + 24);
    unint64_t v17 = v15 + 1;
    if (v15 >= v16 >> 1)
    {
      unint64_t v21 = *(void *)(v14 + 16);
      unint64_t v22 = v15 + 1;
      sub_1890D095C((void *)(v16 > 1), v15 + 1, 1);
      unint64_t v15 = v21;
      unint64_t v17 = v22;
      uint64_t v14 = v25;
    }

    *(void *)(v14 + 16) = v17;
    sub_1890D2660(v24, v14 + 40 * v15 + 32);
    v13 += 32LL;
    if (!--v12)
    {
      swift_bridgeObjectRelease();
      goto LABEL_36;
    }
  }

  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t ConstraintCategory.rawValue.getter()
{
  return *(void *)v0;
}

void static ConstraintCategory.none.getter(void *a1@<X8>)
{
  *a1 = 0LL;
}

void static ConstraintCategory.sysdiagnoseNewTool.getter(void *a1@<X8>)
{
  *a1 = 17LL;
}

void static ConstraintCategory.logOnly.getter(void *a1@<X8>)
{
  *a1 = 255LL;
}

uint64_t sub_1890F08FC()
{
  return sub_1890F1614();
}

uint64_t sub_1890F0958()
{
  return sub_1890F15FC();
}

uint64_t *sub_1890F09A4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  if (!*result || (v2 != 255 ? (BOOL v3 = v2 == 17) : (BOOL v3 = 1), v3))
  {
    char v4 = 0;
  }

  else
  {
    uint64_t v2 = 0LL;
    char v4 = 1;
  }

  *(void *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v4;
  return result;
}

BOOL static ConstraintError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ConstraintError.hash(into:)()
{
  return sub_1890F189C();
}

uint64_t ConstraintError.hashValue.getter()
{
  return sub_1890F18B4();
}

unint64_t sub_1890F0A54(void *a1)
{
  a1[2] = sub_1890DACA8();
  a1[3] = sub_1890DAC64();
  a1[4] = sub_1890F0A90();
  unint64_t result = sub_1890F0AD4();
  a1[5] = result;
  return result;
}

unint64_t sub_1890F0A90()
{
  unint64_t result = qword_18C7697C8;
  if (!qword_18C7697C8)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ConstraintCategory,  &type metadata for ConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_18C7697C8);
  }

  return result;
}

unint64_t sub_1890F0AD4()
{
  unint64_t result = qword_18C7697D0;
  if (!qword_18C7697D0)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ConstraintCategory,  &type metadata for ConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_18C7697D0);
  }

  return result;
}

unint64_t sub_1890F0B1C()
{
  unint64_t result = qword_18C7697D8;
  if (!qword_18C7697D8)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ConstraintCategory,  &type metadata for ConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_18C7697D8);
  }

  return result;
}

unint64_t sub_1890F0B64()
{
  unint64_t result = qword_18C7697E0;
  if (!qword_18C7697E0)
  {
    unint64_t result = MEMORY[0x1895DFB60]( &protocol conformance descriptor for ConstraintError,  &type metadata for ConstraintError);
    atomic_store(result, (unint64_t *)&qword_18C7697E0);
  }

  return result;
}

ValueMetadata *type metadata accessor for ConstraintCategory()
{
  return &type metadata for ConstraintCategory;
}

uint64_t storeEnumTagSinglePayload for ConstraintError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFB) {
    return ((uint64_t (*)(void))((char *)&loc_1890F0C14 + 4 * byte_1890F6C54[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1890F0C48 + 4 * byte_1890F6C4F[v4]))();
}

uint64_t sub_1890F0C48(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1890F0C50(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1890F0C58LL);
  }
  return result;
}

uint64_t sub_1890F0C64(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1890F0C6CLL);
  }
  *(_BYTE *)unint64_t result = a2 + 4;
  return result;
}

uint64_t sub_1890F0C70(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1890F0C78(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ConstraintError()
{
  return &type metadata for ConstraintError;
}

uint64_t getEnumTagSinglePayload for ConstraintKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xE2) {
    goto LABEL_17;
  }
  if (a2 + 30 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 30) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 30;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 30;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 30;
    }
  }

uint64_t storeEnumTagSinglePayload for ConstraintKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 30 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 30) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xE2) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xE1) {
    return ((uint64_t (*)(void))((char *)&loc_1890F0D70 + 4 * byte_1890F6C5E[v4]))();
  }
  *a1 = a2 + 30;
  return ((uint64_t (*)(void))((char *)sub_1890F0DA4 + 4 * byte_1890F6C59[v4]))();
}

uint64_t sub_1890F0DA4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1890F0DAC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1890F0DB4LL);
  }
  return result;
}

uint64_t sub_1890F0DC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1890F0DC8LL);
  }
  *(_BYTE *)unint64_t result = a2 + 30;
  return result;
}

uint64_t sub_1890F0DCC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1890F0DD4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ConstraintKeys()
{
  return &type metadata for ConstraintKeys;
}

uint64_t sub_1890F0DF0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2 = *a2;
  uint64_t v3 = sub_1890EFBB4(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_1890EFBB4(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_1890F183C();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1890F0E78()
{
  unsigned __int8 v1 = *v0;
  sub_1890F1890();
  sub_1890EFBB4(v1);
  sub_1890F15D8();
  swift_bridgeObjectRelease();
  return sub_1890F18B4();
}

uint64_t sub_1890F0ED8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1890F0F18()
{
  unsigned __int8 v1 = *v0;
  sub_1890F1890();
  sub_1890EFBB4(v1);
  sub_1890F15D8();
  swift_bridgeObjectRelease();
  return sub_1890F18B4();
}

uint64_t sub_1890F0F74@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_1890F10FC();
  *a1 = result;
  return result;
}

uint64_t sub_1890F0FA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1890EFBB4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_1890F0FCC()
{
  unint64_t result = qword_18C7697E8;
  if (!qword_18C7697E8)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F70F0, &type metadata for ConstraintKeys);
    atomic_store(result, (unint64_t *)&qword_18C7697E8);
  }

  return result;
}

uint64_t sub_1890F1010()
{
  return sub_1890F1608();
}

uint64_t sub_1890F106C()
{
  return sub_1890F15F0();
}

unint64_t sub_1890F10B8()
{
  unint64_t result = qword_18C7697F0;
  if (!qword_18C7697F0)
  {
    unint64_t result = MEMORY[0x1895DFB60](&unk_1890F7078, &type metadata for ConstraintKeys);
    atomic_store(result, (unint64_t *)&qword_18C7697F0);
  }

  return result;
}

uint64_t sub_1890F10FC()
{
  unint64_t v0 = sub_1890F1848();
  swift_bridgeObjectRelease();
  if (v0 >= 0x1F) {
    return 31LL;
  }
  else {
    return v0;
  }
}

uint64_t sub_1890F114C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1890F1188(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7697F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t ValidationResult.signatureIsValid.getter()
{
  return *v0;
}

uint64_t ValidationResult.requirementMatched.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t ValidationResult.failureReason.getter()
{
  return *(unsigned int *)(v0 + 4);
}

void sub_1890F11E8()
{
  uint64_t v0 = (void *)sub_1890F1560();
  int v1 = SecRequirementCreateWithLightweightCodeRequirementData();

  if (!v1) {
    __break(1u);
  }
}

void SecStaticCodeCheckValidityWithOnDiskRequirement(code:flags:requirement:)( const __SecCode *a1@<X0>, SecCSFlags a2@<W1>, uint64_t a3@<X8>)
{
  if (v7)
  {
    char v8 = v7;
    OSStatus v9 = SecStaticCodeCheckValidity(a1, a2, v7);

    BOOL v10 = v9 == -67050;
    if (v9 == -66996) {
      BOOL v10 = 0;
    }
    if (v9) {
      char v11 = v10;
    }
    else {
      char v11 = 1;
    }
    if (v9) {
      BOOL v12 = v9 == -66996;
    }
    else {
      BOOL v12 = 1;
    }
  }

  else
  {
    OSStatus v9 = v6;
    char v11 = 0;
    BOOL v12 = 0;
  }

  *(_BYTE *)a3 = v11;
  *(_BYTE *)(a3 + 1) = v12;
  *(_DWORD *)(a3 + 4) = v9;
}

void SecCodeCheckValidityWithOnDiskRequirement(code:flags:requirement:)( __SecCode *a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  if (v7)
  {
    char v8 = v7;
    OSStatus v9 = SecCodeCheckValidity(a1, a2 & 0xFF7FFFFF, v7);

    BOOL v10 = v9 == -67050;
    if (v9 == -66996) {
      BOOL v10 = 0;
    }
    if (v9) {
      char v11 = v10;
    }
    else {
      char v11 = 1;
    }
    if (v9) {
      BOOL v12 = v9 == -66996;
    }
    else {
      BOOL v12 = 1;
    }
  }

  else
  {
    OSStatus v9 = v6;
    char v11 = 0;
    BOOL v12 = 0;
  }

  *(_BYTE *)a3 = v11;
  *(_BYTE *)(a3 + 1) = v12;
  *(_DWORD *)(a3 + 4) = v9;
}

void SecCodeCheckValidityWithProcessRequirement(code:flags:requirement:)( __SecCode *a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  if (v7)
  {
    char v8 = v7;
    OSStatus v9 = SecCodeCheckValidity(a1, a2 | 0x800000, v7);

    BOOL v10 = v9 == -67050;
    if (v9 == -66996) {
      BOOL v10 = 0;
    }
    if (v9) {
      char v11 = v10;
    }
    else {
      char v11 = 1;
    }
    if (v9) {
      BOOL v12 = v9 == -66996;
    }
    else {
      BOOL v12 = 1;
    }
  }

  else
  {
    OSStatus v9 = v6;
    char v11 = 0;
    BOOL v12 = 0;
  }

  *(_BYTE *)a3 = v11;
  *(_BYTE *)(a3 + 1) = v12;
  *(_DWORD *)(a3 + 4) = v9;
}

void *__swift_memcpy8_4(void *result, void *a2)
{
  void *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ValidationResult(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFF && a1[8]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ValidationResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 8) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 8) = 0;
    }
    if (a2) {
      *(_BYTE *)unint64_t result = a2 + 1;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ValidationResult()
{
  return &type metadata for ValidationResult;
}

uint64_t sub_1890F1530()
{
  return MEMORY[0x189606208]();
}

uint64_t sub_1890F153C()
{
  return MEMORY[0x189606230]();
}

uint64_t sub_1890F1548()
{
  return MEMORY[0x189606240]();
}

uint64_t sub_1890F1554()
{
  return MEMORY[0x189606940]();
}

uint64_t sub_1890F1560()
{
  return MEMORY[0x189606C58]();
}

uint64_t sub_1890F156C()
{
  return MEMORY[0x189606CA0]();
}

uint64_t sub_1890F1578()
{
  return MEMORY[0x18961B560]();
}

uint64_t sub_1890F1584()
{
  return MEMORY[0x18961B568]();
}

uint64_t sub_1890F1590()
{
  return MEMORY[0x18961B580]();
}

uint64_t sub_1890F159C()
{
  return MEMORY[0x189607050]();
}

uint64_t sub_1890F15A8()
{
  return MEMORY[0x189607078]();
}

uint64_t sub_1890F15B4()
{
  return MEMORY[0x189617818]();
}

uint64_t sub_1890F15C0()
{
  return MEMORY[0x189617838]();
}

uint64_t sub_1890F15CC()
{
  return MEMORY[0x1896178E0]();
}

uint64_t sub_1890F15D8()
{
  return MEMORY[0x189617DD8]();
}

uint64_t sub_1890F15E4()
{
  return MEMORY[0x189617E70]();
}

uint64_t sub_1890F15F0()
{
  return MEMORY[0x189618248]();
}

uint64_t sub_1890F15FC()
{
  return MEMORY[0x189618270]();
}

uint64_t sub_1890F1608()
{
  return MEMORY[0x1896182A8]();
}

uint64_t sub_1890F1614()
{
  return MEMORY[0x1896182D0]();
}

uint64_t sub_1890F1620()
{
  return MEMORY[0x189618308]();
}

uint64_t sub_1890F162C()
{
  return MEMORY[0x189618320]();
}

uint64_t sub_1890F1638()
{
  return MEMORY[0x189618330]();
}

uint64_t sub_1890F1644()
{
  return MEMORY[0x189618358]();
}

uint64_t sub_1890F1650()
{
  return MEMORY[0x1896183C8]();
}

uint64_t sub_1890F165C()
{
  return MEMORY[0x189618410]();
}

uint64_t sub_1890F1668()
{
  return MEMORY[0x189618AC0]();
}

uint64_t sub_1890F1674()
{
  return MEMORY[0x189619010]();
}

uint64_t sub_1890F1680()
{
  return MEMORY[0x1896190C8]();
}

uint64_t sub_1890F168C()
{
  return MEMORY[0x1896191E8]();
}

uint64_t sub_1890F1698()
{
  return MEMORY[0x189619300]();
}

uint64_t sub_1890F16A4()
{
  return MEMORY[0x189619660]();
}

uint64_t sub_1890F16B0()
{
  return MEMORY[0x1896198A8]();
}

uint64_t sub_1890F16BC()
{
  return MEMORY[0x189619930]();
}

uint64_t sub_1890F16C8()
{
  return MEMORY[0x189619948]();
}

uint64_t sub_1890F16D4()
{
  return MEMORY[0x189619950]();
}

uint64_t sub_1890F16E0()
{
  return MEMORY[0x189619960]();
}

uint64_t sub_1890F16EC()
{
  return MEMORY[0x189619A40]();
}

uint64_t sub_1890F16F8()
{
  return MEMORY[0x189619A60]();
}

uint64_t sub_1890F1704()
{
  return MEMORY[0x189619AB0]();
}

uint64_t sub_1890F1710()
{
  return MEMORY[0x189619AF8]();
}

uint64_t sub_1890F171C()
{
  return MEMORY[0x189619B00]();
}

uint64_t sub_1890F1728()
{
  return MEMORY[0x189619B28]();
}

uint64_t sub_1890F1734()
{
  return MEMORY[0x189619B38]();
}

uint64_t sub_1890F1740()
{
  return MEMORY[0x189619B70]();
}

uint64_t sub_1890F174C()
{
  return MEMORY[0x189619B90]();
}

uint64_t sub_1890F1758()
{
  return MEMORY[0x189619BD8]();
}

uint64_t sub_1890F1764()
{
  return MEMORY[0x189619BF0]();
}

uint64_t sub_1890F1770()
{
  return MEMORY[0x189619BF8]();
}

uint64_t sub_1890F177C()
{
  return MEMORY[0x189619C20]();
}

uint64_t sub_1890F1788()
{
  return MEMORY[0x189619C40]();
}

uint64_t sub_1890F1794()
{
  return MEMORY[0x189619C70]();
}

uint64_t sub_1890F17A0()
{
  return MEMORY[0x189619CC8]();
}

uint64_t sub_1890F17AC()
{
  return MEMORY[0x189619CD8]();
}

uint64_t sub_1890F17B8()
{
  return MEMORY[0x189619D10]();
}

uint64_t sub_1890F17C4()
{
  return MEMORY[0x189619D40]();
}

uint64_t sub_1890F17D0()
{
  return MEMORY[0x189619D48]();
}

uint64_t sub_1890F17DC()
{
  return MEMORY[0x189619D58]();
}

uint64_t sub_1890F17E8()
{
  return MEMORY[0x189619D60]();
}

uint64_t sub_1890F17F4()
{
  return MEMORY[0x189619D80]();
}

uint64_t sub_1890F1800()
{
  return MEMORY[0x189619E38]();
}

uint64_t sub_1890F180C()
{
  return MEMORY[0x189619E60]();
}

uint64_t sub_1890F1818()
{
  return MEMORY[0x189619E68]();
}

uint64_t sub_1890F1824()
{
  return MEMORY[0x189619E78]();
}

uint64_t sub_1890F1830()
{
  return MEMORY[0x189619E80]();
}

uint64_t sub_1890F183C()
{
  return MEMORY[0x18961A050]();
}

uint64_t sub_1890F1848()
{
  return MEMORY[0x18961A2C8]();
}

uint64_t sub_1890F1854()
{
  return MEMORY[0x18961A3A0]();
}

uint64_t sub_1890F1860()
{
  return MEMORY[0x18961A3C0]();
}

uint64_t sub_1890F186C()
{
  return MEMORY[0x18961A3C8]();
}

uint64_t sub_1890F1878()
{
  return MEMORY[0x18961A3D0]();
}

uint64_t sub_1890F1884()
{
  return MEMORY[0x18961A3D8]();
}

uint64_t sub_1890F1890()
{
  return MEMORY[0x18961A680]();
}

uint64_t sub_1890F189C()
{
  return MEMORY[0x18961A690]();
}

uint64_t sub_1890F18A8()
{
  return MEMORY[0x18961A6B0]();
}

uint64_t sub_1890F18B4()
{
  return MEMORY[0x18961A6C0]();
}

uint64_t sub_1890F18C0()
{
  return MEMORY[0x18961A950]();
}

uint64_t sub_1890F18CC()
{
  return MEMORY[0x18961A978]();
}

uint64_t sub_1890F18D8()
{
  return MEMORY[0x18961AF60]();
}

uint64_t sub_1890F18E4()
{
  return MEMORY[0x18961AF68]();
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x189602C70](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x189602C78](err);
}

OSStatus SecCodeCheckValidity(SecCodeRef code, SecCSFlags flags, SecRequirementRef requirement)
{
  return MEMORY[0x18960B350](code, *(void *)&flags, requirement);
}

uint64_t SecRequirementCreateWithLightweightCodeRequirementData()
{
  return MEMORY[0x18960B600]();
}

OSStatus SecStaticCodeCheckValidity( SecStaticCodeRef staticCode, SecCSFlags flags, SecRequirementRef requirement)
{
  return MEMORY[0x18960B610](staticCode, *(void *)&flags, requirement);
}

uint64_t SecTaskValidateForLightweightCodeRequirementData()
{
  return MEMORY[0x18960B678]();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1895FBCE0](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616718](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x18961B0A0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x18961B0A8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x18961B0B0]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x18961B0C0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x18961B0D8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x18961B0E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x18961B110]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x18961B118]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x18961B150]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x18961B158]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x18961B160]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x18961B180]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x18961B1E8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x18961B1F0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x18961B270]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x18961B290]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x18961B2F8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x18961B310]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x18961B318]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x18961B328]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x18961B348]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x18961B358]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x18961B390]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x18961B3A0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x18961B3A8]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x18961B3E0]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x18961B408]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x18961B418]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x18961B450]();
}