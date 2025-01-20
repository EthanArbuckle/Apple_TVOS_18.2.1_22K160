void sub_1892E4714(_Unwind_Exception *a1)
{
  void *v1;
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1892E4728()
{
  qword_18C790C30 = 0x5D414D535BLL;
  *(void *)algn_18C790C38 = 0xE500000000000000LL;
}

uint64_t sub_1892E4748()
{
  return sub_1892EC6FC();
}

id sub_1892E4774()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x189607910]), sel_init);
}

id sub_1892E4798()
{
  id v1 = objc_allocWithZone(v0);
  return sub_1892E8B90();
}

os_log_s *sub_1892E47E4()
{
  v2 = v1;
  uint64_t v3 = v0;
  v4 = (os_log_s *)sub_1892EC6F0();
  os_log_type_t v5 = sub_1892EC8E8();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v40 = v7;
    *(_DWORD *)v6 = 136315138;
    if (qword_18C7904E0 != -1) {
      swift_once();
    }
    uint64_t v8 = qword_18C790C30;
    unint64_t v9 = *(void *)algn_18C790C38;
    sub_1892EC8B8();
    sub_1892E80C4(v8, v9, &v40);
    sub_1892EC8F4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1892E3000, v4, v5, "%s Sending proposeNonce request...", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E6194](v7, -1LL, -1LL);
    MEMORY[0x1895E6194](v6, -1LL, -1LL);
  }

  v10 = *(void **)(v3 + OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_lock);
  objc_msgSend(v10, sel_lock);
  swift_retain();
  sub_1892E9BE8();
  if (v2)
  {
    swift_release();
    objc_msgSend(v10, sel_unlock);
    id v11 = v2;
    id v12 = v2;
    v13 = (os_log_s *)sub_1892EC6F0();
    os_log_type_t v14 = sub_1892EC8DC();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      v16 = (void *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v40 = v17;
      *(_DWORD *)uint64_t v15 = 136315394;
      if (qword_18C7904E0 != -1) {
        swift_once();
      }
      uint64_t v18 = qword_18C790C30;
      unint64_t v19 = *(void *)algn_18C790C38;
      sub_1892EC8B8();
      sub_1892E80C4(v18, v19, &v40);
      sub_1892EC8F4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2112;
      id v20 = v2;
      uint64_t v39 = _swift_stdlib_bridgeErrorToNSError();
      sub_1892EC8F4();
      void *v16 = v39;

      _os_log_impl(&dword_1892E3000, v13, v14, "%s proposeNonce request failed: %@", (uint8_t *)v15, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C7904F0);
      swift_arrayDestroy();
      MEMORY[0x1895E6194](v16, -1LL, -1LL);
      swift_arrayDestroy();
      MEMORY[0x1895E6194](v17, -1LL, -1LL);
      MEMORY[0x1895E6194](v15, -1LL, -1LL);
    }

    else
    {
    }

    swift_willThrow();
  }

  else
  {
    swift_release();
    objc_msgSend(v10, sel_unlock);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7904F8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1892ECE50;
    *(void *)(inited + 32) = 0x65636E6F4E776172LL;
    *(void *)(inited + 40) = 0xE800000000000000LL;
    uint64_t v22 = sub_1892EC8B8();
    uint64_t v23 = sub_1892E961C(v22);
    uint64_t v25 = v24;
    swift_bridgeObjectRelease();
    *(void *)(inited + 48) = v23;
    *(void *)(inited + 56) = v25;
    *(void *)(inited + 64) = 0x6F4E747365676964LL;
    *(void *)(inited + 72) = 0xEB0000000065636ELL;
    uint64_t v26 = sub_1892EC8B8();
    uint64_t v27 = sub_1892E961C(v26);
    uint64_t v29 = v28;
    swift_bridgeObjectRelease();
    *(void *)(inited + 80) = v27;
    *(void *)(inited + 88) = v29;
    unint64_t v30 = sub_1892E4DE4(inited);
    v31 = (os_log_s *)sub_1892EC6F0();
    os_log_type_t v32 = sub_1892EC8E8();
    if (os_log_type_enabled(v31, v32))
    {
      unint64_t v38 = v30;
      v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      uint64_t v40 = v37;
      *(_DWORD *)v33 = 136315138;
      if (qword_18C7904E0 != -1) {
        swift_once();
      }
      uint64_t v34 = qword_18C790C30;
      unint64_t v35 = *(void *)algn_18C790C38;
      sub_1892EC8B8();
      sub_1892E80C4(v34, v35, &v40);
      sub_1892EC8F4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1892E3000, v31, v32, "%s proposeNonce request succeeded.", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895E6194](v37, -1LL, -1LL);
      MEMORY[0x1895E6194](v33, -1LL, -1LL);

      unint64_t v30 = v38;
    }

    else
    {
    }

    v13 = (os_log_s *)sub_1892E50E0(v30);
    swift_bridgeObjectRelease();
    sub_1892E4F08();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return v13;
}

unint64_t sub_1892E4DE4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v2 = (void *)MEMORY[0x18961AFF0];
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7905E8);
  v2 = (void *)sub_1892EC96C();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }

  swift_retain();
  v4 = (unint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v7 = *(v4 - 1);
    unint64_t v8 = *v4;
    sub_1892EC8B8();
    sub_1892E96CC(v7, v8);
    unint64_t result = sub_1892E8778(v5, v6);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    id v11 = (uint64_t *)(v2[6] + 16 * result);
    *id v11 = v5;
    v11[1] = v6;
    id v12 = (uint64_t *)(v2[7] + 16 * result);
    *id v12 = v7;
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

void sub_1892E4F08()
{
  oslog = (os_log_s *)sub_1892EC6F0();
  os_log_type_t v0 = sub_1892EC8E8();
  if (os_log_type_enabled(oslog, v0))
  {
    id v1 = (uint8_t *)swift_slowAlloc();
    uint64_t v2 = swift_slowAlloc();
    uint64_t v8 = v2;
    *(_DWORD *)id v1 = 136315138;
    uint64_t v3 = sub_1892EC8B8();
    uint64_t v4 = MEMORY[0x1895E5D38](v3, MEMORY[0x18961A610]);
    unint64_t v6 = v5;
    swift_bridgeObjectRelease();
    sub_1892E80C4(v4, v6, &v8);
    sub_1892EC8F4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1892E3000, oslog, v0, "Returning: %s", v1, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E6194](v2, -1LL, -1LL);
    MEMORY[0x1895E6194](v1, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_1892E50E0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7905E0);
    uint64_t v2 = sub_1892EC96C();
  }

  else
  {
    uint64_t v2 = MEMORY[0x18961AFF0];
  }

  uint64_t v31 = a1 + 64;
  uint64_t v3 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1LL << -(char)v3);
  }
  else {
    uint64_t v4 = -1LL;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v30 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  sub_1892EC8B8();
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

    if (v13 >= v30) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v31 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v30) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v31 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v30) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v31 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v30) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v31 + 8 * v15);
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
    uint64_t v17 = 16 * v12;
    uint64_t v18 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = v18[1];
    id v20 = (uint64_t *)(*(void *)(a1 + 56) + v17);
    uint64_t v21 = *v20;
    unint64_t v22 = v20[1];
    *(void *)&v40[0] = *v18;
    *((void *)&v40[0] + 1) = v19;
    sub_1892EC8B8();
    sub_1892E96CC(v21, v22);
    swift_dynamicCast();
    swift_dynamicCast();
    __int128 v36 = v32;
    __int128 v37 = v33;
    uint64_t v38 = v34;
    sub_1892E9A7C(&v35, v39);
    __int128 v32 = v36;
    __int128 v33 = v37;
    uint64_t v34 = v38;
    sub_1892E9A7C(v39, v40);
    sub_1892E9A7C(v40, &v36);
    uint64_t result = sub_1892EC90C();
    uint64_t v23 = -1LL << *(_BYTE *)(v2 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1LL << v24) & ~*(void *)(v6 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1LL << v24) & ~*(void *)(v6 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }

        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v6 + 8 * v25);
      }

      while (v29 == -1);
      unint64_t v9 = __clz(__rbit64(~v29)) + (v25 << 6);
    }

    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v32;
    *(_OWORD *)(v10 + 16) = v33;
    *(void *)(v10 + 32) = v34;
    uint64_t result = (uint64_t)sub_1892E9A7C(&v36, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }

  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v30)
  {
LABEL_37:
    swift_release();
    sub_1892E9A8C();
    return v2;
  }

  unint64_t v14 = *(void *)(v31 + 8 * v16);
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
    if (v15 >= v30) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v31 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }

LABEL_39:
  __break(1u);
  return result;
}

void sub_1892E5558( int a1, int a2, uint64_t a3, os_log_s *a4, uint64_t a5, id a6, uint64_t a7, unint64_t a8, _BYTE *a9)
{
  uint64_t v10 = v9;
  unint64_t v151 = a8;
  uint64_t v152 = a5;
  *(void *)&__int128 v150 = a7;
  os_log_t v143 = a4;
  int v145 = a2;
  int v146 = a1;
  uint64_t v13 = sub_1892EC738();
  os_log_t v14 = *(os_log_t *)(v13 - 8);
  MEMORY[0x1895F8858]();
  int64_t v16 = (char *)&v139 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = v9 + OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_log;
  uint64_t v18 = (os_log_s *)sub_1892EC6F0();
  os_log_type_t v19 = sub_1892EC8E8();
  BOOL v20 = os_log_type_enabled(v18, v19);
  uint64_t v148 = v10;
  uint64_t v149 = v17;
  if (v20)
  {
    os_log_t v142 = v14;
    id v144 = a6;
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v154 = v22;
    *(_DWORD *)uint64_t v21 = 136315138;
    if (qword_18C7904E0 != -1) {
      swift_once();
    }
    uint64_t v23 = qword_18C790C30;
    unint64_t v24 = *(void *)algn_18C790C38;
    sub_1892EC8B8();
    uint64_t v153 = sub_1892E80C4(v23, v24, &v154);
    sub_1892EC8F4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1892E3000, v18, v19, "%s Sending checkManifest request...", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E6194](v22, -1LL, -1LL);
    MEMORY[0x1895E6194](v21, -1LL, -1LL);

    uint64_t v10 = v148;
    a6 = v144;
    os_log_t v14 = v142;
  }

  else
  {
  }

  id v144 = *(id *)(v10 + OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_lock);
  objc_msgSend(v144, sel_lock);
  os_log_t v25 = v143;
  sub_1892E96CC(a3, (unint64_t)v143);
  sub_1892E8A28(a3, (uint64_t)v25);
  sub_1892E9710(a3, (unint64_t)v25);
  sub_1892E666C();
  swift_release();
  sub_1892E9B54(&qword_18C790500, (uint64_t (*)(uint64_t))MEMORY[0x189605958], MEMORY[0x189605950]);
  uint64_t v26 = sub_1892EC744();
  uint64_t v28 = v27;
  uint64_t v29 = (void (*)(char *, uint64_t))*((void *)v14 + 1);
  v29(v16, v13);
  uint64_t v30 = sub_1892E88BC(v26, v28);
  swift_bridgeObjectRelease();
  uint64_t v31 = v152;
  sub_1892E96CC(v152, (unint64_t)a6);
  sub_1892E8A28(v31, (uint64_t)a6);
  sub_1892E9710(v31, (unint64_t)a6);
  sub_1892E666C();
  swift_release();
  uint64_t v32 = sub_1892EC744();
  uint64_t v34 = v33;
  v29(v16, v13);
  uint64_t v152 = sub_1892E88BC(v32, v34);
  swift_bridgeObjectRelease();
  uint64_t v35 = v150;
  unint64_t v36 = v151;
  sub_1892E96CC(v150, v151);
  sub_1892E8A28(v35, v36);
  sub_1892E9710(v35, v36);
  sub_1892E666C();
  swift_release();
  uint64_t v37 = sub_1892EC744();
  uint64_t v39 = v38;
  uint64_t v40 = v16;
  v41 = (os_log_s *)v30;
  v29(v40, v13);
  uint64_t v42 = sub_1892E88BC(v37, v39);
  swift_bridgeObjectRelease();
  swift_retain_n();
  v43 = (os_log_s *)sub_1892EC6F0();
  int v44 = sub_1892EC8D0();
  BOOL v45 = os_log_type_enabled(v43, (os_log_type_t)v44);
  unint64_t v151 = v42;
  if (v45)
  {
    LODWORD(v141) = v44;
    os_log_t v143 = v43;
    v46 = (os_log_s *)swift_slowAlloc();
    uint64_t v140 = swift_slowAlloc();
    uint64_t v154 = v140;
    *(_DWORD *)v46 = 136315394;
    if (qword_18C7904E0 != -1) {
      swift_once();
    }
    uint64_t v48 = qword_18C790C30;
    unint64_t v47 = *(void *)algn_18C790C38;
    sub_1892EC8B8();
    uint64_t v153 = sub_1892E80C4(v48, v47, &v154);
    sub_1892EC8F4();
    swift_bridgeObjectRelease();
    os_log_t v142 = v46;
    *((_WORD *)v46 + 6) = 2080;
    uint64_t v49 = *(void *)(v30 + 16);
    if (v49)
    {
      swift_retain();
      uint64_t v50 = 0LL;
      v51 = (void *)MEMORY[0x18961AFE8];
      __int128 v150 = xmmword_1892ECE60;
      uint64_t v52 = MEMORY[0x18961A658];
      do
      {
        v53 = v41;
        char v54 = *((_BYTE *)v41 + v50 + 32);
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C790508);
        uint64_t v55 = swift_allocObject();
        *(_OWORD *)(v55 + 16) = v150;
        *(void *)(v55 + 56) = MEMORY[0x18961A610];
        *(void *)(v55 + 64) = v52;
        *(_BYTE *)(v55 + 32) = v54;
        uint64_t v56 = sub_1892EC87C();
        uint64_t v58 = v57;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v51 = sub_1892E7EAC(0LL, v51[2] + 1LL, 1, v51);
        }
        unint64_t v60 = v51[2];
        unint64_t v59 = v51[3];
        if (v60 >= v59 >> 1) {
          v51 = sub_1892E7EAC((void *)(v59 > 1), v60 + 1, 1, v51);
        }
        ++v50;
        v51[2] = v60 + 1;
        v61 = &v51[2 * v60];
        v61[4] = v56;
        v61[5] = v58;
        v41 = v53;
      }

      while (v49 != v50);
      swift_release();
    }

    else
    {
      v51 = (void *)MEMORY[0x18961AFE8];
    }

    v62 = (uint8_t *)v142;
    uint64_t v153 = (uint64_t)v51;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C790510);
    sub_1892E9A94(&qword_18C790518, &qword_18C790510, MEMORY[0x189618458]);
    uint64_t v63 = sub_1892EC870();
    unint64_t v65 = v64;
    swift_bridgeObjectRelease();
    uint64_t v153 = sub_1892E80C4(v63, v65, &v154);
    sub_1892EC8F4();
    swift_release_n();
    swift_bridgeObjectRelease();
    os_log_t v66 = v143;
    _os_log_impl(&dword_1892E3000, v143, (os_log_type_t)v141, "%s manifestHash=%s", v62, 0x16u);
    uint64_t v67 = v140;
    swift_arrayDestroy();
    MEMORY[0x1895E6194](v67, -1LL, -1LL);
    MEMORY[0x1895E6194](v62, -1LL, -1LL);

    uint64_t v42 = v151;
  }

  else
  {
    swift_release_n();
  }

  uint64_t v68 = v152;
  swift_retain_n();
  v69 = (os_log_s *)sub_1892EC6F0();
  int v70 = sub_1892EC8D0();
  if (os_log_type_enabled(v69, (os_log_type_t)v70))
  {
    LODWORD(v140) = v70;
    os_log_t v142 = v69;
    uint64_t v71 = swift_slowAlloc();
    uint64_t v139 = swift_slowAlloc();
    uint64_t v154 = v139;
    *(_DWORD *)uint64_t v71 = 136315394;
    if (qword_18C7904E0 != -1) {
      swift_once();
    }
    uint64_t v73 = qword_18C790C30;
    unint64_t v72 = *(void *)algn_18C790C38;
    sub_1892EC8B8();
    uint64_t v153 = sub_1892E80C4(v73, v72, &v154);
    sub_1892EC8F4();
    swift_bridgeObjectRelease();
    v141 = (uint8_t *)v71;
    *(_WORD *)(v71 + 12) = 2080;
    uint64_t v74 = *(void *)(v68 + 16);
    if (v74)
    {
      os_log_t v143 = v41;
      swift_retain();
      uint64_t v75 = 0LL;
      v76 = (void *)MEMORY[0x18961AFE8];
      __int128 v150 = xmmword_1892ECE60;
      uint64_t v77 = MEMORY[0x18961A610];
      uint64_t v78 = MEMORY[0x18961A658];
      do
      {
        char v79 = *(_BYTE *)(v152 + v75 + 32);
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C790508);
        uint64_t v80 = swift_allocObject();
        *(_OWORD *)(v80 + 16) = v150;
        *(void *)(v80 + 56) = v77;
        *(void *)(v80 + 64) = v78;
        *(_BYTE *)(v80 + 32) = v79;
        uint64_t v81 = sub_1892EC87C();
        uint64_t v83 = v82;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v76 = sub_1892E7EAC(0LL, v76[2] + 1LL, 1, v76);
        }
        unint64_t v85 = v76[2];
        unint64_t v84 = v76[3];
        if (v85 >= v84 >> 1) {
          v76 = sub_1892E7EAC((void *)(v84 > 1), v85 + 1, 1, v76);
        }
        ++v75;
        v76[2] = v85 + 1;
        v86 = &v76[2 * v85];
        v86[4] = v81;
        v86[5] = v83;
      }

      while (v74 != v75);
      uint64_t v87 = v152;
      swift_release();
      v41 = v143;
    }

    else
    {
      v76 = (void *)MEMORY[0x18961AFE8];
      uint64_t v87 = v68;
    }

    v88 = v141;
    uint64_t v153 = (uint64_t)v76;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C790510);
    sub_1892E9A94(&qword_18C790518, &qword_18C790510, MEMORY[0x189618458]);
    uint64_t v89 = sub_1892EC870();
    unint64_t v91 = v90;
    swift_bridgeObjectRelease();
    uint64_t v153 = sub_1892E80C4(v89, v91, &v154);
    sub_1892EC8F4();
    swift_release_n();
    swift_bridgeObjectRelease();
    os_log_t v92 = v142;
    _os_log_impl(&dword_1892E3000, v142, (os_log_type_t)v140, "%s infoPlistHash=%s", v88, 0x16u);
    uint64_t v93 = v139;
    swift_arrayDestroy();
    MEMORY[0x1895E6194](v93, -1LL, -1LL);
    MEMORY[0x1895E6194](v88, -1LL, -1LL);

    uint64_t v68 = v87;
    uint64_t v42 = v151;
  }

  else
  {
    swift_release_n();
  }

  swift_retain_n();
  v94 = (os_log_s *)sub_1892EC6F0();
  int v95 = sub_1892EC8D0();
  if (os_log_type_enabled(v94, (os_log_type_t)v95))
  {
    LODWORD(v141) = v95;
    os_log_t v142 = v94;
    uint64_t v96 = swift_slowAlloc();
    uint64_t v140 = swift_slowAlloc();
    uint64_t v154 = v140;
    *(_DWORD *)uint64_t v96 = 136315394;
    if (qword_18C7904E0 != -1) {
      swift_once();
    }
    uint64_t v98 = qword_18C790C30;
    unint64_t v97 = *(void *)algn_18C790C38;
    sub_1892EC8B8();
    uint64_t v153 = sub_1892E80C4(v98, v97, &v154);
    sub_1892EC8F4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v96 + 12) = 2080;
    uint64_t v99 = v42;
    uint64_t v100 = *(void *)(v42 + 16);
    if (v100)
    {
      uint64_t v139 = v96;
      os_log_t v143 = v41;
      swift_retain();
      uint64_t v101 = 0LL;
      v102 = (void *)MEMORY[0x18961AFE8];
      __int128 v150 = xmmword_1892ECE60;
      uint64_t v103 = MEMORY[0x18961A610];
      uint64_t v104 = MEMORY[0x18961A658];
      do
      {
        char v105 = *(_BYTE *)(v151 + v101 + 32);
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C790508);
        uint64_t v106 = swift_allocObject();
        *(_OWORD *)(v106 + 16) = v150;
        *(void *)(v106 + 56) = v103;
        *(void *)(v106 + 64) = v104;
        *(_BYTE *)(v106 + 32) = v105;
        uint64_t v107 = sub_1892EC87C();
        uint64_t v109 = v108;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v102 = sub_1892E7EAC(0LL, v102[2] + 1LL, 1, v102);
        }
        unint64_t v111 = v102[2];
        unint64_t v110 = v102[3];
        if (v111 >= v110 >> 1) {
          v102 = sub_1892E7EAC((void *)(v110 > 1), v111 + 1, 1, v102);
        }
        ++v101;
        v102[2] = v111 + 1;
        v112 = &v102[2 * v111];
        v112[4] = v107;
        v112[5] = v109;
      }

      while (v100 != v101);
      uint64_t v42 = v151;
      swift_release();
      v41 = v143;
      uint64_t v96 = v139;
    }

    else
    {
      v102 = (void *)MEMORY[0x18961AFE8];
      uint64_t v42 = v99;
    }

    uint64_t v153 = (uint64_t)v102;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C790510);
    sub_1892E9A94(&qword_18C790518, &qword_18C790510, MEMORY[0x189618458]);
    uint64_t v113 = sub_1892EC870();
    unint64_t v115 = v114;
    swift_bridgeObjectRelease();
    uint64_t v153 = sub_1892E80C4(v113, v115, &v154);
    sub_1892EC8F4();
    swift_release_n();
    swift_bridgeObjectRelease();
    os_log_t v116 = v142;
    _os_log_impl(&dword_1892E3000, v142, (os_log_type_t)v141, "%s catalogHash=%s", (uint8_t *)v96, 0x16u);
    uint64_t v117 = v140;
    swift_arrayDestroy();
    MEMORY[0x1895E6194](v117, -1LL, -1LL);
    MEMORY[0x1895E6194](v96, -1LL, -1LL);

    uint64_t v68 = v152;
  }

  else
  {
    swift_release_n();
  }

  swift_retain();
  v118 = v147;
  char v119 = sub_1892E9E0C(v146, v145 & 1, (uint64_t)v41, v68, v42);
  v120 = v118;
  if (v118)
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    objc_msgSend(v144, sel_unlock);
    id v121 = v118;
    id v122 = v118;
    v123 = (os_log_s *)sub_1892EC6F0();
    os_log_type_t v124 = sub_1892EC8DC();
    if (os_log_type_enabled(v123, v124))
    {
      uint64_t v125 = swift_slowAlloc();
      v126 = (void *)swift_slowAlloc();
      uint64_t v127 = swift_slowAlloc();
      uint64_t v154 = v127;
      *(_DWORD *)uint64_t v125 = 136315394;
      if (qword_18C7904E0 != -1) {
        swift_once();
      }
      uint64_t v128 = qword_18C790C30;
      unint64_t v129 = *(void *)algn_18C790C38;
      sub_1892EC8B8();
      uint64_t v153 = sub_1892E80C4(v128, v129, &v154);
      sub_1892EC8F4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v125 + 12) = 2112;
      id v130 = v120;
      uint64_t v131 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v153 = v131;
      sub_1892EC8F4();
      void *v126 = v131;

      _os_log_impl(&dword_1892E3000, v123, v124, "%s checkManifest request failed: %@", (uint8_t *)v125, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C7904F0);
      swift_arrayDestroy();
      MEMORY[0x1895E6194](v126, -1LL, -1LL);
      swift_arrayDestroy();
      MEMORY[0x1895E6194](v127, -1LL, -1LL);
      MEMORY[0x1895E6194](v125, -1LL, -1LL);
    }

    else
    {
    }

    swift_willThrow();
  }

  else
  {
    char v132 = v119;
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    objc_msgSend(v144, sel_unlock);
    v133 = (os_log_s *)sub_1892EC6F0();
    os_log_type_t v134 = sub_1892EC8E8();
    if (os_log_type_enabled(v133, v134))
    {
      v135 = (uint8_t *)swift_slowAlloc();
      uint64_t v136 = swift_slowAlloc();
      uint64_t v154 = v136;
      *(_DWORD *)v135 = 136315138;
      if (qword_18C7904E0 != -1) {
        swift_once();
      }
      uint64_t v137 = qword_18C790C30;
      unint64_t v138 = *(void *)algn_18C790C38;
      sub_1892EC8B8();
      uint64_t v153 = sub_1892E80C4(v137, v138, &v154);
      sub_1892EC8F4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1892E3000, v133, v134, "%s checkManifest request succeeded.", v135, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895E6194](v136, -1LL, -1LL);
      MEMORY[0x1895E6194](v135, -1LL, -1LL);
    }

    *a9 = v132 & 1;
  }

uint64_t sub_1892E666C()
{
  uint64_t v0 = sub_1892EC750();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1892E9B54(&qword_18C7905D8, v4, MEMORY[0x189605DE8]);
  sub_1892EC72C();
  sub_1892EC8B8();
  sub_1892EC714();
  swift_bridgeObjectRelease();
  sub_1892EC720();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void sub_1892E68B4( uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v10 = (os_log_s *)sub_1892EC6F0();
  os_log_type_t v11 = sub_1892EC8E8();
  if (os_log_type_enabled(v10, v11))
  {
    unint64_t v39 = a4;
    unint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v45 = v13;
    *(_DWORD *)unint64_t v12 = 136315138;
    if (qword_18C7904E0 != -1) {
      swift_once();
    }
    uint64_t v14 = qword_18C790C30;
    unint64_t v15 = *(void *)algn_18C790C38;
    sub_1892EC8B8();
    sub_1892E80C4(v14, v15, &v45);
    sub_1892EC8F4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1892E3000, v10, v11, "%s Sending storeManifest request...", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E6194](v13, -1LL, -1LL);
    MEMORY[0x1895E6194](v12, -1LL, -1LL);

    a4 = v39;
  }

  else
  {
  }

  int64_t v16 = *(void **)(v42 + OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_lock);
  objc_msgSend(v16, sel_lock);
  sub_1892E96CC(a1, a2);
  sub_1892E8A28(a1, a2);
  uint64_t v18 = v17;
  sub_1892E9710(a1, a2);
  sub_1892E96CC(a3, a4);
  sub_1892E8A28(a3, a4);
  uint64_t v20 = v19;
  sub_1892E9710(a3, a4);
  sub_1892E96CC(a5, a6);
  sub_1892E8A28(a5, a6);
  uint64_t v22 = v21;
  sub_1892E9710(a5, a6);
  swift_retain();
  sub_1892EA120(v18, v20, v22);
  if (v43)
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    objc_msgSend(v16, sel_unlock);
    id v23 = v43;
    id v24 = v43;
    os_log_t v25 = (os_log_s *)sub_1892EC6F0();
    os_log_type_t v26 = sub_1892EC8DC();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v28 = (void *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v45 = v29;
      *(_DWORD *)uint64_t v27 = 136315394;
      if (qword_18C7904E0 != -1) {
        swift_once();
      }
      uint64_t v30 = qword_18C790C30;
      unint64_t v31 = *(void *)algn_18C790C38;
      sub_1892EC8B8();
      sub_1892E80C4(v30, v31, &v45);
      sub_1892EC8F4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2112;
      id v32 = v43;
      uint64_t v44 = _swift_stdlib_bridgeErrorToNSError();
      sub_1892EC8F4();
      *uint64_t v28 = v44;

      _os_log_impl(&dword_1892E3000, v25, v26, "%s storeManifest request failed: %@", (uint8_t *)v27, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C7904F0);
      swift_arrayDestroy();
      MEMORY[0x1895E6194](v28, -1LL, -1LL);
      swift_arrayDestroy();
      MEMORY[0x1895E6194](v29, -1LL, -1LL);
      MEMORY[0x1895E6194](v27, -1LL, -1LL);
    }

    else
    {
    }

    swift_willThrow();
  }

  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    objc_msgSend(v16, sel_unlock);
    uint64_t v33 = (os_log_s *)sub_1892EC6F0();
    os_log_type_t v34 = sub_1892EC8E8();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v45 = v36;
      *(_DWORD *)uint64_t v35 = 136315138;
      if (qword_18C7904E0 != -1) {
        swift_once();
      }
      uint64_t v37 = qword_18C790C30;
      unint64_t v38 = *(void *)algn_18C790C38;
      sub_1892EC8B8();
      sub_1892E80C4(v37, v38, &v45);
      sub_1892EC8F4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1892E3000, v33, v34, "%s storeManifest request succeeded.", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895E6194](v36, -1LL, -1LL);
      MEMORY[0x1895E6194](v35, -1LL, -1LL);
    }
  }

void sub_1892E6FC8( uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
}

void sub_1892E7110(unint64_t a1)
{
  uint64_t v4 = v2;
  uint64_t v6 = (void *)sub_1892EC6F0();
  os_log_type_t v7 = sub_1892EC8E8();
  unint64_t v38 = a1;
  if (!os_log_type_enabled((os_log_t)v6, v7))
  {

    goto LABEL_5;
  }

  uint64_t v8 = swift_slowAlloc();
  uint64_t v3 = swift_slowAlloc();
  uint64_t v40 = v3;
  *(_DWORD *)uint64_t v8 = 136315138;
  if (qword_18C7904E0 != -1) {
    goto LABEL_34;
  }
  while (1)
  {
    uint64_t v9 = qword_18C790C30;
    unint64_t v10 = *(void *)algn_18C790C38;
    sub_1892EC8B8();
    sub_1892E80C4(v9, v10, &v40);
    sub_1892EC8F4();
    swift_bridgeObjectRelease();
    _os_log_impl( &dword_1892E3000,  (os_log_t)v6,  v7,  "%s Sending commitStagedManifestForFSTags request...",  (uint8_t *)v8,  0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E6194](v3, -1LL, -1LL);
    MEMORY[0x1895E6194](v8, -1LL, -1LL);

    a1 = v38;
LABEL_5:
    os_log_type_t v11 = *(void **)(v1 + OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_lock);
    objc_msgSend(v11, sel_lock, v36);
    if (a1 >> 62)
    {
      sub_1892EC8B8();
      uint64_t v8 = sub_1892EC960();
    }

    else
    {
      uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      sub_1892EC8B8();
    }

    uint64_t v37 = v4;
    id v36 = v11;
    if (!v8)
    {
      uint64_t v14 = (char *)MEMORY[0x18961AFE8];
      goto LABEL_20;
    }

    if (v8 >= 1) {
      break;
    }
    __break(1u);
LABEL_34:
    swift_once();
  }

  uint64_t v12 = 0LL;
  unint64_t v13 = a1 & 0xC000000000000001LL;
  uint64_t v14 = (char *)MEMORY[0x18961AFE8];
  do
  {
    if (v13) {
      id v15 = (id)MEMORY[0x1895E5DA4](v12, a1);
    }
    else {
      id v15 = *(id *)(a1 + 8 * v12 + 32);
    }
    int64_t v16 = v15;
    unsigned int v17 = objc_msgSend(v15, sel_unsignedIntValue, v36);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v14 = sub_1892E7FB8(0LL, *((void *)v14 + 2) + 1LL, 1, v14);
    }
    unint64_t v19 = *((void *)v14 + 2);
    unint64_t v18 = *((void *)v14 + 3);
    if (v19 >= v18 >> 1) {
      uint64_t v14 = sub_1892E7FB8((char *)(v18 > 1), v19 + 1, 1, v14);
    }
    ++v12;
    *((void *)v14 + 2) = v19 + 1;
    *(_DWORD *)&v14[4 * v19 + 32] = v17;

    a1 = v38;
  }

  while (v8 != v12);
LABEL_20:
  swift_bridgeObjectRelease();
  swift_retain();
  sub_1892EA404((uint64_t)v14);
  if (v37)
  {
    swift_release();
    swift_bridgeObjectRelease();
    objc_msgSend(v36, sel_unlock);
    id v20 = v37;
    id v21 = v37;
    uint64_t v22 = (os_log_s *)sub_1892EC6F0();
    os_log_type_t v23 = sub_1892EC8DC();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      os_log_t v25 = (void *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v40 = v26;
      *(_DWORD *)uint64_t v24 = 136315394;
      if (qword_18C7904E0 != -1) {
        swift_once();
      }
      uint64_t v27 = qword_18C790C30;
      unint64_t v28 = *(void *)algn_18C790C38;
      sub_1892EC8B8();
      sub_1892E80C4(v27, v28, &v40);
      sub_1892EC8F4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2112;
      id v29 = v37;
      uint64_t v39 = _swift_stdlib_bridgeErrorToNSError();
      sub_1892EC8F4();
      *os_log_t v25 = v39;

      _os_log_impl( &dword_1892E3000,  v22,  v23,  "%s commitStagedManifestForFSTags request failed: %@",  (uint8_t *)v24,  0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C7904F0);
      swift_arrayDestroy();
      MEMORY[0x1895E6194](v25, -1LL, -1LL);
      swift_arrayDestroy();
      MEMORY[0x1895E6194](v26, -1LL, -1LL);
      MEMORY[0x1895E6194](v24, -1LL, -1LL);
    }

    else
    {
    }

    swift_willThrow();
  }

  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    objc_msgSend(v36, sel_unlock);
    uint64_t v30 = (os_log_s *)sub_1892EC6F0();
    os_log_type_t v31 = sub_1892EC8E8();
    if (os_log_type_enabled(v30, v31))
    {
      id v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v40 = v33;
      *(_DWORD *)id v32 = 136315138;
      if (qword_18C7904E0 != -1) {
        swift_once();
      }
      uint64_t v34 = qword_18C790C30;
      unint64_t v35 = *(void *)algn_18C790C38;
      sub_1892EC8B8();
      sub_1892E80C4(v34, v35, &v40);
      sub_1892EC8F4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1892E3000, v30, v31, "%s commitStagedManifestForFSTags request succeeded.", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895E6194](v33, -1LL, -1LL);
      MEMORY[0x1895E6194](v32, -1LL, -1LL);
    }
  }

void sub_1892E7804(int a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v6 = (os_log_s *)sub_1892EC6F0();
  os_log_type_t v7 = sub_1892EC8E8();
  if (os_log_type_enabled(v6, v7))
  {
    id v29 = v2;
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v32 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    if (qword_18C7904E0 != -1) {
      swift_once();
    }
    uint64_t v11 = qword_18C790C30;
    unint64_t v10 = *(void *)algn_18C790C38;
    sub_1892EC8B8();
    uint64_t v30 = sub_1892E80C4(v11, v10, &v32);
    sub_1892EC8F4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1892E3000, v6, v7, "%s Sending invalidateManifestForFSTag request...", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E6194](v9, -1LL, -1LL);
    MEMORY[0x1895E6194](v8, -1LL, -1LL);

    uint64_t v3 = v29;
  }

  else
  {
  }

  uint64_t v12 = *(void **)(v4 + OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_lock);
  objc_msgSend(v12, sel_lock, v29, v30);
  swift_retain();
  sub_1892EA6F0(a1);
  if (v3)
  {
    swift_release();
    objc_msgSend(v12, sel_unlock);
    id v13 = v3;
    id v14 = v3;
    id v15 = (os_log_s *)sub_1892EC6F0();
    os_log_type_t v16 = sub_1892EC8DC();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      unint64_t v18 = (void *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v32 = v19;
      *(_DWORD *)uint64_t v17 = 136315394;
      if (qword_18C7904E0 != -1) {
        swift_once();
      }
      uint64_t v20 = qword_18C790C30;
      unint64_t v21 = *(void *)algn_18C790C38;
      sub_1892EC8B8();
      sub_1892E80C4(v20, v21, &v32);
      sub_1892EC8F4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2112;
      id v22 = v3;
      uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
      sub_1892EC8F4();
      *unint64_t v18 = v31;

      _os_log_impl( &dword_1892E3000,  v15,  v16,  "%s invalidateManifestForFSTag request failed: %@",  (uint8_t *)v17,  0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C7904F0);
      swift_arrayDestroy();
      MEMORY[0x1895E6194](v18, -1LL, -1LL);
      swift_arrayDestroy();
      MEMORY[0x1895E6194](v19, -1LL, -1LL);
      MEMORY[0x1895E6194](v17, -1LL, -1LL);
    }

    else
    {
    }

    swift_willThrow();
  }

  else
  {
    swift_release();
    objc_msgSend(v12, sel_unlock);
    os_log_type_t v23 = (os_log_s *)sub_1892EC6F0();
    os_log_type_t v24 = sub_1892EC8E8();
    if (os_log_type_enabled(v23, v24))
    {
      os_log_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v32 = v26;
      *(_DWORD *)os_log_t v25 = 136315138;
      if (qword_18C7904E0 != -1) {
        swift_once();
      }
      uint64_t v27 = qword_18C790C30;
      unint64_t v28 = *(void *)algn_18C790C38;
      sub_1892EC8B8();
      sub_1892E80C4(v27, v28, &v32);
      sub_1892EC8F4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1892E3000, v23, v24, "%s invalidateManifestForFSTag request succeeded.", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895E6194](v26, -1LL, -1LL);
      MEMORY[0x1895E6194](v25, -1LL, -1LL);
    }
  }

id sub_1892E7DA0()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void sub_1892E7DC0()
{
}

id sub_1892E7E18()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MobileAssetExclaveServicesManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *sub_1892E7EAC(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C7905C8);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      id v13 = v10 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      unint64_t v10 = (void *)MEMORY[0x18961AFE8];
      id v13 = (void *)(MEMORY[0x18961AFE8] + 32LL);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_24;
      }
    }

    sub_1892E98A0(0LL, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }

  __break(1u);
  return result;
}

char *sub_1892E7FB8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C7905C0);
      unint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      id v13 = v10 + 32;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      unint64_t v10 = (char *)MEMORY[0x18961AFE8];
      id v13 = (char *)(MEMORY[0x18961AFE8] + 32LL);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0LL;
        goto LABEL_24;
      }
    }

    sub_1892E9990(0LL, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }

  __break(1u);
  return result;
}

uint64_t sub_1892E80C4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1892E8194(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1892E9B18((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = MEMORY[0x1896191F8];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1892E9B18((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    sub_1892EC8B8();
  }

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_1892E8194(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1892EC900();
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_13:
    uint64_t result = sub_1892E834C(a5, a6);
    *a1 = v12;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  uint64_t v8 = sub_1892EC93C();
  if (!v8)
  {
    sub_1892EC948();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1892EC978();
    __break(1u);
    return result;
  }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_1892E834C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1892E83E0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1892E85B8(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1892E85B8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1892E83E0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_1892E8554(v2, 0LL);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1892EC924();
      if ((v6 & 1) != 0) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1892EC948();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1892EC8A0();
      if (!v2) {
        return MEMORY[0x18961AFE8];
      }
    }

    sub_1892EC978();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1892EC948();
    __break(1u);
  }

  else
  {
    return MEMORY[0x18961AFE8];
  }

  return result;
}

void *sub_1892E8554(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x18961AFE8];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7905D0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1892E85B8(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7905D0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }

LABEL_30:
  uint64_t result = sub_1892EC978();
  __break(1u);
  return result;
}

  uint64_t result = sub_1892EC978();
  __break(1u);
  return result;
}

_BYTE *sub_1892E8704@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0LL;
LABEL_4:
    unint64_t v5 = 0xC000000000000000LL;
    goto LABEL_5;
  }

  if (v4 <= 14)
  {
    uint64_t result = (_BYTE *)sub_1892E9464(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }

  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (_BYTE *)sub_1892E9524((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000LL;
  }

  else
  {
    uint64_t result = (_BYTE *)sub_1892E959C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000LL;
  }

unint64_t sub_1892E8778(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1892EC9E4();
  return sub_1892E87DC(a1, a2, v4);
}

unint64_t sub_1892E87DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1892EC990() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (sub_1892EC990() & 1) == 0);
    }
  }

  return v6;
}

uint64_t sub_1892E88BC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = (void *)MEMORY[0x18961AFE8];
  if (v2 != a2)
  {
    if (v2 > a2)
    {
      uint64_t v5 = a2;
      if (a2 < 0)
      {
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }

      if (!v2)
      {
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }

      uint64_t v6 = result;
      uint64_t result = sub_1892EC8B8();
      size_t v4 = 0LL;
      uint64_t v7 = v3 + 4;
      while (1)
      {
        char v8 = *(_BYTE *)(v6 + v5 + 32);
        if (!v4)
        {
          unint64_t v9 = v3[3];
          int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
          if (v10 <= 1) {
            uint64_t v11 = 1LL;
          }
          else {
            uint64_t v11 = v10;
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_18C7905D0);
          uint64_t v12 = (void *)swift_allocObject();
          size_t v13 = 2 * _swift_stdlib_malloc_size(v12) - 64;
          v12[2] = v11;
          uint64_t v12[3] = v13;
          unint64_t v14 = (unint64_t)(v12 + 4);
          size_t v15 = v3[3] >> 1;
          if (v3[2])
          {
            v3[2] = 0LL;
          }

          uint64_t v7 = (_BYTE *)(v14 + v15);
          size_t v4 = (v13 >> 1) - v15;
          uint64_t result = swift_release();
          uint64_t v3 = v12;
        }

        BOOL v17 = __OFSUB__(v4--, 1LL);
        if (v17) {
          break;
        }
        ++v5;
        *v7++ = v8;
        if (v2 == v5)
        {
          uint64_t result = swift_bridgeObjectRelease();
          goto LABEL_24;
        }
      }

      __break(1u);
LABEL_29:
      __break(1u);
    }

    __break(1u);
    goto LABEL_31;
  }

  size_t v4 = 0LL;
LABEL_24:
  unint64_t v18 = v3[3];
  if (v18 < 2) {
    return (uint64_t)v3;
  }
  unint64_t v19 = v18 >> 1;
  BOOL v17 = __OFSUB__(v19, v4);
  unint64_t v20 = v19 - v4;
  if (!v17)
  {
    v3[2] = v20;
    return (uint64_t)v3;
  }

LABEL_33:
  __break(1u);
  return result;
}

void sub_1892E8A28(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

void *sub_1892E8AA4()
{
  if (BYTE6(v0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7905D0);
    size_t v4 = (void *)swift_allocObject();
    size_t v6 = _swift_stdlib_malloc_size(v4);
    v4[2] = BYTE6(v0);
    v4[3] = 2 * v6 - 64;
    sub_1892E96CC(v2, v0);
    uint64_t v7 = sub_1892EC6C0();
    sub_1892E9710(v2, v0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v1);
    if (v7 != BYTE6(v0))
    {
      __break(1u);
      JUMPOUT(0x1892E8B78LL);
    }
  }

  return v4;
}

id sub_1892E8B90()
{
  uint64_t v1 = v0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_log];
  uint64_t v3 = v1;
  sub_1892EC6FC();
  uint64_t v4 = OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_lock;
  uint64_t v5 = &MAExclaveManifestStorageService.Server;
  *(void *)&v3[v4] = objc_msgSend(objc_allocWithZone(MEMORY[0x189607910]), sel_init);
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    uint64_t v7 = result;
    int exclaveCapability = MobileGestalt_get_exclaveCapability();

    unint64_t v9 = (os_log_s *)sub_1892EC6F0();
    os_log_type_t v10 = sub_1892EC8E8();
    BOOL v11 = os_log_type_enabled(v9, v10);
    if (exclaveCapability)
    {
      if (v11)
      {
        uint64_t v12 = (uint8_t *)swift_slowAlloc();
        uint64_t v13 = swift_slowAlloc();
        uint64_t v30 = v13;
        *(_DWORD *)uint64_t v12 = 136315138;
        if (qword_18C7904E0 != -1) {
          swift_once();
        }
        uint64_t v14 = qword_18C790C30;
        unint64_t v15 = *(void *)algn_18C790C38;
        sub_1892EC8B8();
        uint64_t v29 = sub_1892E80C4(v14, v15, &v30);
        sub_1892EC8F4();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1892E3000, v9, v10, "%s Starting com.apple.mobileasset.conclave...", v12, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1895E6194](v13, -1LL, -1LL);
        MEMORY[0x1895E6194](v12, -1LL, -1LL);

        uint64_t v5 = &MAExclaveManifestStorageService.Server;
      }

      else
      {
      }

      type metadata accessor for MAExclaveManifestStorageService.Service();
      sub_1892E9B54( &qword_18C790600,  (uint64_t (*)(uint64_t))type metadata accessor for MAExclaveManifestStorageService.Service,  (uint64_t)&unk_1892ED048);
      sub_1892EC858();
      *(void *)&v3[OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_tbClient] = v30;
      unint64_t v20 = (os_log_s *)sub_1892EC6F0();
      os_log_type_t v21 = sub_1892EC8E8();
      if (os_log_type_enabled(v20, v21))
      {
        id v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v23 = swift_slowAlloc();
        uint64_t v30 = v23;
        *(_DWORD *)id v22 = 136315138;
        if (qword_18C7904E0 != -1) {
          swift_once();
        }
        uint64_t v24 = qword_18C790C30;
        unint64_t v25 = *(void *)algn_18C790C38;
        sub_1892EC8B8();
        uint64_t v29 = sub_1892E80C4(v24, v25, &v30);
        sub_1892EC8F4();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1892E3000, v20, v21, "%s Successfully started com.apple.mobileasset.conclave", v22, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1895E6194](v23, -1LL, -1LL);
        MEMORY[0x1895E6194](v22, -1LL, -1LL);
      }

      v28.receiver = v3;
      v28.super_class = (Class)type metadata accessor for MobileAssetExclaveServicesManager();
      return objc_msgSendSuper2(&v28, *(SEL *)&v5[4].ivar_base_size);
    }

    else
    {
      if (v11)
      {
        os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v17 = swift_slowAlloc();
        uint64_t v30 = v17;
        *(_DWORD *)os_log_type_t v16 = 136315138;
        if (qword_18C7904E0 != -1) {
          swift_once();
        }
        uint64_t v18 = qword_18C790C30;
        unint64_t v19 = *(void *)algn_18C790C38;
        sub_1892EC8B8();
        uint64_t v29 = sub_1892E80C4(v18, v19, &v30);
        sub_1892EC8F4();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1892E3000, v9, v10, "%s Exclaves not supported", v16, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1895E6194](v17, -1LL, -1LL);
        MEMORY[0x1895E6194](v16, -1LL, -1LL);
      }

      uint64_t v26 = sub_1892EC708();
      (*(void (**)(char *, uint64_t))(*(void *)(v26 - 8) + 8LL))(v2, v26);
      uint64_t v27 = *(void **)&v3[v4];

      type metadata accessor for MobileAssetExclaveServicesManager();
      swift_deallocPartialClassInstance();
      return 0LL;
    }
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895E6110]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_1892E9464(_BYTE *__src, _BYTE *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0LL;
  }
  if ((v2 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }

  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_1892E9524(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0LL;
  }
  sub_1892EC6A8();
  swift_allocObject();
  uint64_t result = sub_1892EC69C();
  if (v2 < 0)
  {
    __break(1u);
  }

  else
  {
    sub_1892EC6CC();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = v2;
  }

  return result;
}

uint64_t sub_1892E959C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0LL;
  }
  sub_1892EC6A8();
  swift_allocObject();
  uint64_t result = sub_1892EC69C();
  if (v2 < (uint64_t)0xFFFFFFFF80000000LL)
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1892E961C(uint64_t a1)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7905F0);
  uint64_t v10 = sub_1892E9A94(&qword_18C7905F8, &qword_18C7905F0, MEMORY[0x189607200]);
  v8[0] = a1;
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  uint64_t v3 = (_BYTE *)(*v2 + 32LL);
  uint64_t v4 = &v3[*(void *)(*v2 + 16LL)];
  sub_1892EC8B8();
  sub_1892E8704(v3, v4, &v7);
  uint64_t v5 = v7;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
  return v5;
}

uint64_t sub_1892E96CC(uint64_t a1, unint64_t a2)
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

uint64_t sub_1892E9710(uint64_t a1, unint64_t a2)
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

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895E611C](255LL, (char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t type metadata accessor for MobileAssetExclaveServicesManager()
{
  uint64_t result = qword_18C7905A8;
  if (!qword_18C7905A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1892E97D4()
{
  return type metadata accessor for MobileAssetExclaveServicesManager();
}

uint64_t sub_1892E97DC()
{
  uint64_t result = sub_1892EC708();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

unint64_t sub_1892E9864()
{
  unint64_t result = qword_18C7905B8;
  if (!qword_18C7905B8)
  {
    objc_opt_self();
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_18C7905B8);
  }

  return result;
}

uint64_t sub_1892E98A0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else if ((v4 & 0x8000000000000000LL) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }

  uint64_t result = sub_1892EC978();
  __break(1u);
  return result;
}

char *sub_1892E9990(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else if ((v4 & 0x8000000000000000LL) == 0)
  {
    unint64_t v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }

  uint64_t result = (char *)sub_1892EC978();
  __break(1u);
  return result;
}

_OWORD *sub_1892E9A7C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1892E9A8C()
{
  return swift_release();
}

uint64_t sub_1892E9A94(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = MEMORY[0x1895E6128](a3, v6);
    atomic_store(result, a1);
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

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1892E9B18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1892E9B54(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = MEMORY[0x1895E6128](a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

void type metadata accessor for TransportError()
{
  if (!qword_18C790610)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_18C790610);
    }
  }

uint64_t sub_1892E9BE8()
{
  uint64_t v2 = sub_1892EC7B0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858]();
  unint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_1892EC804();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *(void *)(v0 + 16);
  sub_1892EC828();
  if (!v1)
  {
    uint64_t v15 = v3;
    uint64_t v16 = v2;
    sub_1892EC810();
    sub_1892EC7EC();
    sub_1892EC7F8();
    sub_1892EC834();
    swift_release();
    swift_retain();
    sub_1892EC7A4();
    uint64_t v10 = sub_1892EC098();
    if ((v11 & 1) != 0)
    {
      sub_1892EC408();
      swift_allocError();
      *uint64_t v12 = v10;
      swift_willThrow();
    }

    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v16);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

  return v10;
}

uint64_t sub_1892E9E0C(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_1892EC7B0();
  uint64_t v23 = *(void *)(v10 - 8);
  uint64_t v24 = v10;
  MEMORY[0x1895F8858]();
  id v22 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_1892EC804();
  uint64_t v26 = *(void *)(v12 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (__OFADD__(sub_1892EC188(a3, a4, a5), 13LL))
  {
    __break(1u);
  }

  else
  {
    uint64_t v25 = v12;
    uint64_t v15 = sub_1892EC828();
    if (v5) {
      return a1 & 1;
    }
    v21[1] = v15;
    sub_1892EC810();
    sub_1892EC7EC();
    sub_1892EC7E0();
    sub_1892EC7BC();
    sub_1892EAAE4(a3, a4, a5);
    sub_1892EC7F8();
    sub_1892EC834();
    swift_release();
    swift_retain();
    uint64_t v17 = v22;
    sub_1892EC7A4();
    int v18 = sub_1892EC774();
    uint64_t v19 = v25;
    if (!v18)
    {
      a1 = sub_1892EC75C();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v17, v24);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v19);
      return a1 & 1;
    }

    if (v18 == 1)
    {
      a1 = sub_1892EBFB0();
      sub_1892EC408();
      swift_allocError();
      *unint64_t v20 = a1;
      swift_willThrow();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v17, v24);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v19);
      return a1 & 1;
    }
  }

  uint64_t result = sub_1892EC954();
  __break(1u);
  return result;
}

uint64_t sub_1892EA120(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_1892EC7B0();
  uint64_t v24 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v23 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_1892EC804();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (__OFADD__(sub_1892EC188(a1, a2, a3), 8LL))
  {
    __break(1u);
LABEL_11:
    uint64_t result = sub_1892EC954();
    __break(1u);
    return result;
  }

  uint64_t v22 = v7;
  uint64_t result = sub_1892EC828();
  if (!v3)
  {
    uint64_t v21 = v10;
    sub_1892EC810();
    sub_1892EC7EC();
    sub_1892EAAE4(a1, a2, a3);
    sub_1892EC7F8();
    sub_1892EC834();
    swift_release();
    swift_retain();
    uint64_t v14 = v23;
    sub_1892EC7A4();
    int v15 = sub_1892EC774();
    uint64_t v16 = v21;
    if (!v15)
    {
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v14, v22);
      return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v12, v9);
    }

    uint64_t v17 = v22;
    if (v15 == 1)
    {
      char v18 = sub_1892EBFB0();
      sub_1892EC408();
      swift_allocError();
      *uint64_t v19 = v18;
      swift_willThrow();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v14, v17);
      return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v12, v9);
    }

    goto LABEL_11;
  }

  return result;
}

uint64_t sub_1892EA404(uint64_t a1)
{
  uint64_t v3 = sub_1892EC7B0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_1892EC804();
  MEMORY[0x1895F8858]();
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = *(void *)(a1 + 16);
  if (v12)
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = *(void *)(a1 + 16);
    do
    {
      if ((unint64_t)(v12 - 0x2000000000000000LL) < 0xE000000000000001LL)
      {
        __break(1u);
        goto LABEL_23;
      }

      v13 += 4LL;
      --v14;
    }

    while (v14);
    BOOL v8 = __OFADD__(v13, 8LL);
    uint64_t v15 = v13 + 8;
    if (v8) {
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v15 = 8LL;
    if (v8)
    {
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
  }

  if (__OFADD__(v15, 8LL))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

  uint64_t v24 = v4;
  uint64_t v25 = v3;
  uint64_t v26 = v9;
  uint64_t result = sub_1892EC828();
  if (v1) {
    return result;
  }
  sub_1892EC810();
  sub_1892EC7EC();
  sub_1892EC7EC();
  if (v12)
  {
    uint64_t v23 = v7;
    sub_1892EC8B8();
    for (uint64_t i = 0LL; i != v12; ++i)
      sub_1892EC7E0();
    swift_bridgeObjectRelease();
    uint64_t v7 = v23;
  }

  sub_1892EC7F8();
  sub_1892EC834();
LABEL_16:
  swift_release();
  swift_retain();
  sub_1892EC7A4();
  int v18 = sub_1892EC774();
  if (v18)
  {
    if (v18 == 1)
    {
      char v19 = sub_1892EBFB0();
      if (!v1)
      {
        char v20 = v19;
        sub_1892EC408();
        swift_allocError();
        *uint64_t v21 = v20;
        swift_willThrow();
      }

      goto LABEL_20;
    }

LABEL_24:
    uint64_t result = sub_1892EC954();
    __break(1u);
    return result;
  }

LABEL_20:
  (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v25);
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v11, v7);
}

uint64_t sub_1892EA6F0(int a1)
{
  int v24 = a1;
  uint64_t v2 = sub_1892EC7B0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_1892EC804();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = sub_1892EC828();
  if (!v1)
  {
    char v19 = v5;
    uint64_t v20 = v3;
    uint64_t v22 = v7;
    uint64_t v23 = v6;
    uint64_t v21 = v2;
    sub_1892EC810();
    sub_1892EC7EC();
    sub_1892EC7E0();
    sub_1892EC7F8();
    sub_1892EC834();
    swift_release();
    swift_retain();
    uint64_t v11 = v19;
    sub_1892EC7A4();
    int v12 = sub_1892EC774();
    uint64_t v14 = v22;
    uint64_t v13 = v23;
    if (v12)
    {
      uint64_t v15 = v20;
      if (v12 != 1)
      {
        uint64_t result = sub_1892EC954();
        __break(1u);
        return result;
      }

      char v16 = sub_1892EBFB0();
      sub_1892EC408();
      swift_allocError();
      *uint64_t v17 = v16;
      swift_willThrow();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v21);
    }

    else
    {
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v11, v21);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v9, v13);
  }

  return result;
}

BOOL sub_1892EA968(char *a1, char *a2)
{
  return dword_1892ED164[*a1] == dword_1892ED164[*a2];
}

uint64_t sub_1892EA98C()
{
  return sub_1892EC9E4();
}

uint64_t sub_1892EA9D8()
{
  return sub_1892EC9D8();
}

uint64_t sub_1892EAA0C()
{
  return sub_1892EC9E4();
}

uint64_t sub_1892EAA54@<X0>(int *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_1892EBEC0(*a1);
  *a2 = result;
  return result;
}

void sub_1892EAA7C(_DWORD *a1@<X8>)
{
  *a1 = dword_1892ED164[*v1];
}

uint64_t sub_1892EAA98()
{
  return sub_1892EC9C0();
}

uint64_t sub_1892EAAE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 16);
  sub_1892EC7EC();
  if (v5)
  {
    sub_1892EC8B8();
    for (uint64_t i = 0LL; i != v5; ++i)
      sub_1892EC7D4();
    swift_bridgeObjectRelease();
  }

  uint64_t v7 = *(void *)(a2 + 16);
  sub_1892EC7EC();
  if (v7)
  {
    sub_1892EC8B8();
    for (uint64_t j = 0LL; j != v7; ++j)
      sub_1892EC7D4();
    swift_bridgeObjectRelease();
  }

  uint64_t v9 = *(void *)(a3 + 16);
  uint64_t result = sub_1892EC7EC();
  if (v9)
  {
    sub_1892EC8B8();
    for (uint64_t k = 0LL; k != v9; ++k)
      sub_1892EC7D4();
    return swift_bridgeObjectRelease();
  }

  return result;
}

uint64_t sub_1892EABD4()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1892EABF8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_1892EC81C();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_1892EC84C();
  swift_allocObject();
  uint64_t v9 = sub_1892EC840();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  *(void *)(v8 + 16) = v9;
  *a2 = v8;
  return result;
}

void sub_1892EACD0(uint64_t a1)
{
  uint64_t v2 = sub_1892EC804();
  uint64_t v3 = *(void *)(v2 - 8);
  ((void (*)(void))MEMORY[0x1895F8858])();
  v19[2] = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C790870);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x1895F8858])();
  uint64_t v6 = MEMORY[0x1895F8858](v5);
  uint64_t v7 = MEMORY[0x1895F8858](v6);
  v19[3] = (char *)v19 - v8;
  uint64_t v9 = MEMORY[0x1895F8858](v7);
  v19[4] = (char *)v19 - v10;
  uint64_t v11 = MEMORY[0x1895F8858](v9);
  MEMORY[0x1895F8858](v11);
  uint64_t v13 = (char *)v19 - v12;
  uint64_t v14 = sub_1892EC7B0();
  MEMORY[0x1895F8858](v14);
  v19[7] = v17;
  v19[8] = v16;
  (*(void (**)(char *, uint64_t))(v17 + 16))((char *)v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL), a1);
  v19[5] = v2;
  v19[6] = v3;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v13, 1LL, 1LL, v2);
  uint64_t v18 = (char *)&loc_1892EAE80 + *((int *)qword_1892EB7E8 + sub_1892EC1D4());
  __asm { BR              X10 }

uint64_t sub_1892EAE90()
{
  *(void *)(v4 - 200) = v3;
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[7];
  *(void *)(v4 - 216) = __swift_project_boxed_opaque_existential_1(v0 + 3, v5);
  *(_DWORD *)(v4 - 220) = sub_1892EC780();
  char v7 = sub_1892EC75C();
  unint64_t v8 = sub_1892EC78C();
  uint64_t v9 = *(void *)(v4 - 152);
  unint64_t v10 = sub_1892EB7FC(0LL, v8);
  unint64_t v11 = sub_1892EC78C();
  unint64_t v12 = sub_1892EB7FC(0LL, v11);
  unint64_t v13 = sub_1892EC78C();
  unint64_t v14 = sub_1892EB7FC(0LL, v13);
  char v15 = (*(uint64_t (**)(void, void, unint64_t, unint64_t, unint64_t, uint64_t, uint64_t))(v6 + 16))( *(unsigned int *)(v4 - 220),  v7 & 1,  v10,  v12,  v14,  v5,  v6);
  if (v9)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v4 - 72) = v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C790608);
    if ((swift_dynamicCast() & 1) == 0)
    {

      sub_1892EC954();
      __break(1u);
      JUMPOUT(0x1892EB7E8LL);
    }

    unsigned int v16 = *(unsigned __int8 *)(v4 - 81) | 0xFFFFFF80;
  }

  else
  {
    char v17 = v15;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unsigned int v16 = v17 & 1;
  }

  uint64_t v18 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 - 200);
  uint64_t v19 = *(void *)(v4 - 192);
  sub_1892EC798();
  *(void *)(v4 - 192) = v2;
  uint64_t v20 = *(void *)(v4 - 184);
  v18(v19, 0LL, 1LL, v20);
  sub_1892EC394(v19, v1);
  uint64_t v21 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 176) + 48LL);
  if (!v21(v1, 1LL, v20))
  {
    sub_1892EC7D4();
    if ((v16 & 0x80000000) != 0) {
      sub_1892EC7C8();
    }
    else {
      sub_1892EC7BC();
    }
    uint64_t v20 = *(void *)(v4 - 184);
  }

  if (v21(v1, 1LL, v20))
  {
    uint64_t v22 = 0LL;
  }

  else
  {
    uint64_t v23 = *(void *)(v4 - 176);
    uint64_t v24 = *(void *)(v4 - 208);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v24, v1, v20);
    uint64_t v22 = sub_1892EC7F8();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v24, v20);
  }

  uint64_t v25 = *(void *)(v4 - 192);
  sub_1892EC354(v1);
  (*(void (**)(uint64_t, void))(*(void *)(v4 - 168) + 8LL))(v25, *(void *)(v4 - 160));
  return v22;
}

unint64_t sub_1892EB7FC(unint64_t result, unint64_t a2)
{
  unint64_t v3 = result;
  uint64_t v4 = a2 - result;
  if (a2 < result)
  {
    if ((uint64_t)(result - a2) < 0)
    {
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }

    uint64_t v4 = a2 - result;
LABEL_5:
    uint64_t v5 = MEMORY[0x18961AFE8];
    if (!v4) {
      return v5;
    }
    uint64_t v10 = MEMORY[0x18961AFE8];
    uint64_t result = sub_1892EBBE0(0, v4 & ~(v4 >> 63), 0);
    uint64_t v6 = a2 - v3;
    if (a2 >= v3 && (v4 & 0x8000000000000000LL) == 0)
    {
      uint64_t v5 = v10;
      while (1)
      {
        uint64_t result = sub_1892EC774();
        char v7 = result;
        unint64_t v9 = *(void *)(v10 + 16);
        unint64_t v8 = *(void *)(v10 + 24);
        if (v9 >= v8 >> 1) {
          uint64_t result = sub_1892EBBE0(v8 > 1, v9 + 1, 1);
        }
        *(void *)(v10 + 16) = v9 + 1;
        *(_BYTE *)(v10 + v9 + 32) = v7;
        if (!v6) {
          break;
        }
        --v6;
        if (!--v4) {
          return v5;
        }
      }

      __break(1u);
    }

    __break(1u);
    goto LABEL_16;
  }

LABEL_17:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  uint64_t v6 = *a1;
  char v7 = v6 >= 0x17;
  unint64_t v8 = v6 - 23;
  if (!v7) {
    unint64_t v8 = -1;
  }
  return (v8 + 1);
}

unint64_t sub_1892EB914(unint64_t result, unint64_t a2)
{
  unint64_t v3 = result;
  uint64_t v4 = a2 - result;
  if (a2 < result)
  {
    if ((uint64_t)(result - a2) < 0)
    {
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }

    uint64_t v4 = a2 - result;
LABEL_5:
    uint64_t v5 = MEMORY[0x18961AFE8];
    if (!v4) {
      return v5;
    }
    uint64_t v10 = MEMORY[0x18961AFE8];
    uint64_t result = sub_1892EBBFC(0, v4 & ~(v4 >> 63), 0);
    uint64_t v6 = a2 - v3;
    if (a2 >= v3 && (v4 & 0x8000000000000000LL) == 0)
    {
      uint64_t v5 = v10;
      while (1)
      {
        uint64_t result = sub_1892EC780();
        int v7 = result;
        unint64_t v9 = *(void *)(v10 + 16);
        unint64_t v8 = *(void *)(v10 + 24);
        if (v9 >= v8 >> 1) {
          uint64_t result = sub_1892EBBFC(v8 > 1, v9 + 1, 1);
        }
        *(void *)(v10 + 16) = v9 + 1;
        *(_DWORD *)(v10 + 4 * v9 + 32) = v7;
        if (!v6) {
          break;
        }
        --v6;
        if (!--v4) {
          return v5;
        }
      }

      __break(1u);
    }

    __break(1u);
    goto LABEL_16;
  }

uint64_t sub_1892EBA2C()
{
  return swift_deallocClassInstance();
}

void sub_1892EBA58(uint64_t a1)
{
}

uint64_t sub_1892EBA78()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MAExclaveManifestStorageService()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for MAExclaveManifestStorageService.Service()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for MAExclaveManifestStorageService.Server()
{
  return objc_opt_self();
}

unint64_t sub_1892EBAEC()
{
  unint64_t result = qword_18C790868;
  if (!qword_18C790868)
  {
    uint64_t v1 = type metadata accessor for MAExclaveManifestStorageService.Server();
    unint64_t result = MEMORY[0x1895E6128](&unk_1892ECFF8, v1);
    atomic_store(result, (unint64_t *)&qword_18C790868);
  }

  return result;
}

uint64_t sub_1892EBB30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  sub_1892EC7EC();
  if (v3)
  {
    sub_1892EC8B8();
    for (uint64_t i = 0LL; i != v3; ++i)
      sub_1892EC7D4();
    swift_bridgeObjectRelease();
  }

  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t result = sub_1892EC7EC();
  if (v5)
  {
    sub_1892EC8B8();
    for (uint64_t j = 0LL; j != v5; ++j)
      sub_1892EC7D4();
    return swift_bridgeObjectRelease();
  }

  return result;
}

uint64_t sub_1892EBBE0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1892EBC18(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1892EBBFC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1892EBD64(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1892EBC18(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7905D0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }

uint64_t sub_1892EBD64(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7905C0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }

LABEL_32:
  uint64_t result = sub_1892EC978();
  __break(1u);
  return result;
}

uint64_t sub_1892EBEC0(int a1)
{
  uint64_t result = 1LL;
  switch(a1)
  {
    case 0:
      uint64_t result = 0LL;
      break;
    case 1:
      return result;
    case 2:
      uint64_t result = 2LL;
      break;
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
    case 10:
    case 11:
    case 14:
    case 15:
    case 16:
    case 18:
    case 19:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 29:
    case 31:
    case 32:
    case 33:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 127:
      goto LABEL_5;
    case 5:
      uint64_t result = 3LL;
      break;
    case 9:
      uint64_t result = 4LL;
      break;
    case 12:
      uint64_t result = 5LL;
      break;
    case 13:
      uint64_t result = 6LL;
      break;
    case 17:
      uint64_t result = 7LL;
      break;
    case 20:
      uint64_t result = 8LL;
      break;
    case 21:
      uint64_t result = 9LL;
      break;
    case 22:
      uint64_t result = 10LL;
      break;
    case 28:
      uint64_t result = 11LL;
      break;
    case 30:
      uint64_t result = 12LL;
      break;
    case 34:
      uint64_t result = 13LL;
      break;
    case 35:
      uint64_t result = 14LL;
      break;
    case 45:
      uint64_t result = 15LL;
      break;
    case 55:
      uint64_t result = 16LL;
      break;
    case 63:
      uint64_t result = 17LL;
      break;
    case 70:
      uint64_t result = 18LL;
      break;
    case 80:
      uint64_t result = 19LL;
      break;
    case 128:
      uint64_t result = 20LL;
      break;
    case 129:
      uint64_t result = 21LL;
      break;
    default:
      if (a1 == 9999) {
        uint64_t result = 22LL;
      }
      else {
LABEL_5:
      }
        uint64_t result = 23LL;
      break;
  }

  return result;
}

uint64_t sub_1892EBFB0()
{
  int v0 = sub_1892EC768();
  uint64_t result = sub_1892EBEC0(v0);
  if (result == 23)
  {
    sub_1892EC918();
    swift_bridgeObjectRelease();
    sub_1892EC984();
    sub_1892EC894();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1892EC954();
    __break(1u);
  }

  return result;
}

uint64_t sub_1892EC098()
{
  unint64_t v1 = v0;
  int v2 = sub_1892EC774();
  if (v2 == 1)
  {
    unsigned __int8 v3 = sub_1892EBFB0();
    if (!v0) {
      return v3;
    }
    return v1;
  }

  if (!v2)
  {
    unint64_t v4 = sub_1892EC78C();
    unint64_t v1 = sub_1892EB7FC(0LL, v4);
    unint64_t v5 = sub_1892EC78C();
    sub_1892EB7FC(0LL, v5);
    return v1;
  }

  uint64_t result = sub_1892EC954();
  __break(1u);
  return result;
}

uint64_t sub_1892EC188(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(result + 16);
  BOOL v4 = __OFADD__(v3, 8LL);
  uint64_t v5 = v3 + 8;
  if (v4)
  {
    __break(1u);
    goto LABEL_8;
  }

  uint64_t v6 = *(void *)(a2 + 16);
  BOOL v4 = __OFADD__(v6, 8LL);
  uint64_t v7 = v6 + 8;
  if (v4)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  BOOL v4 = __OFADD__(v5, v7);
  uint64_t v8 = v5 + v7;
  if (v4)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  uint64_t v9 = *(void *)(a3 + 16);
  BOOL v4 = __OFADD__(v9, 8LL);
  uint64_t v10 = v9 + 8;
  if (v4)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  uint64_t result = v8 + v10;
  if (__OFADD__(v8, v10)) {
LABEL_11:
  }
    __break(1u);
  return result;
}

uint64_t sub_1892EC1D4()
{
  uint64_t v0 = sub_1892EC78C();
  if (v0 > 0x422BFAA998E697FDLL)
  {
    switch(v0)
    {
      case 0x422BFAA998E697FELL:
        return 3LL;
      case 0x784C0CECA4AF3CE9LL:
        return 4LL;
      case 0x61402D2633DA9042LL:
        return 1LL;
    }

    goto LABEL_13;
  }

  if (v0 == 0xAF59BA1DDE0196CDLL) {
    return 2LL;
  }
  if (v0 != 0x12C32D59FF853455LL)
  {
LABEL_13:
    sub_1892EC918();
    sub_1892EC894();
    sub_1892EC984();
    sub_1892EC894();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1892EC954();
    __break(1u);
    return result;
  }

  return 0LL;
}

uint64_t sub_1892EC354(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C790870);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_1892EC394(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C790870);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1892EC3DC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }

  return result;
}

unint64_t sub_1892EC408()
{
  unint64_t result = qword_18C790878;
  if (!qword_18C790878)
  {
    unint64_t result = MEMORY[0x1895E6128](&unk_1892ED120, &type metadata for MAStorageError);
    atomic_store(result, (unint64_t *)&qword_18C790878);
  }

  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MAStorageError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xEA) {
    goto LABEL_17;
  }
  if (a2 + 22 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 22) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 22;
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
      return (*a1 | (v4 << 8)) - 22;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 22;
    }
  }

uint64_t storeEnumTagSinglePayload for MAStorageError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 22 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 22) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xEA) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xE9) {
    return ((uint64_t (*)(void))((char *)&loc_1892EC538 + 4 * byte_1892ECF77[v4]))();
  }
  *a1 = a2 + 22;
  return ((uint64_t (*)(void))((char *)sub_1892EC56C + 4 * byte_1892ECF72[v4]))();
}

uint64_t sub_1892EC56C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1892EC574(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1892EC57CLL);
  }
  return result;
}

uint64_t sub_1892EC588(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1892EC590LL);
  }
  *(_BYTE *)unint64_t result = a2 + 22;
  return result;
}

uint64_t sub_1892EC594(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1892EC59C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1892EC5A8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1892EC5B4(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MAStorageError()
{
  return &type metadata for MAStorageError;
}

unint64_t sub_1892EC5D0()
{
  unint64_t result = qword_18C790880;
  if (!qword_18C790880)
  {
    unint64_t result = MEMORY[0x1895E6128](&unk_1892ED0F8, &type metadata for MAStorageError);
    atomic_store(result, (unint64_t *)&qword_18C790880);
  }

  return result;
}

unint64_t sub_1892EC614()
{
  unint64_t result = qword_18C790888;
  if (!qword_18C790888)
  {
    unint64_t result = MEMORY[0x1895E6128](&unk_1892ED080, &type metadata for MAStorageError);
    atomic_store(result, (unint64_t *)&qword_18C790888);
  }

  return result;
}

unint64_t sub_1892EC658()
{
  unint64_t result = qword_18C790890;
  if (!qword_18C790890)
  {
    unint64_t result = MEMORY[0x1895E6128](MEMORY[0x18961A488], MEMORY[0x18961A458]);
    atomic_store(result, (unint64_t *)&qword_18C790890);
  }

  return result;
}

uint64_t sub_1892EC69C()
{
  return MEMORY[0x189606200]();
}

uint64_t sub_1892EC6A8()
{
  return MEMORY[0x189606260]();
}

uint64_t sub_1892EC6B4()
{
  return MEMORY[0x189606928]();
}

uint64_t sub_1892EC6C0()
{
  return MEMORY[0x189606B90]();
}

uint64_t sub_1892EC6CC()
{
  return MEMORY[0x189606BA8]();
}

uint64_t sub_1892EC6D8()
{
  return MEMORY[0x189606CA0]();
}

uint64_t sub_1892EC6E4()
{
  return MEMORY[0x189606D08]();
}

uint64_t sub_1892EC6F0()
{
  return MEMORY[0x18961D1D8]();
}

uint64_t sub_1892EC6FC()
{
  return MEMORY[0x18961D1E0]();
}

uint64_t sub_1892EC708()
{
  return MEMORY[0x18961D1F0]();
}

uint64_t sub_1892EC714()
{
  return MEMORY[0x189605918]();
}

uint64_t sub_1892EC720()
{
  return MEMORY[0x189605920]();
}

uint64_t sub_1892EC72C()
{
  return MEMORY[0x189605930]();
}

uint64_t sub_1892EC738()
{
  return MEMORY[0x189605958]();
}

uint64_t sub_1892EC744()
{
  return MEMORY[0x189605DC8]();
}

uint64_t sub_1892EC750()
{
  return MEMORY[0x189605DF8]();
}

uint64_t sub_1892EC75C()
{
  return MEMORY[0x189612AE0]();
}

uint64_t sub_1892EC768()
{
  return MEMORY[0x189612AE8]();
}

uint64_t sub_1892EC774()
{
  return MEMORY[0x189612AF0]();
}

uint64_t sub_1892EC780()
{
  return MEMORY[0x189612AF8]();
}

uint64_t sub_1892EC78C()
{
  return MEMORY[0x189612B00]();
}

uint64_t sub_1892EC798()
{
  return MEMORY[0x189612B08]();
}

uint64_t sub_1892EC7A4()
{
  return MEMORY[0x189612B10]();
}

uint64_t sub_1892EC7B0()
{
  return MEMORY[0x189612B18]();
}

uint64_t sub_1892EC7BC()
{
  return MEMORY[0x189612B20]();
}

uint64_t sub_1892EC7C8()
{
  return MEMORY[0x189612B28]();
}

uint64_t sub_1892EC7D4()
{
  return MEMORY[0x189612B30]();
}

uint64_t sub_1892EC7E0()
{
  return MEMORY[0x189612B38]();
}

uint64_t sub_1892EC7EC()
{
  return MEMORY[0x189612B40]();
}

uint64_t sub_1892EC7F8()
{
  return MEMORY[0x189612B48]();
}

uint64_t sub_1892EC804()
{
  return MEMORY[0x189612B50]();
}

uint64_t sub_1892EC810()
{
  return MEMORY[0x189612B60]();
}

uint64_t sub_1892EC81C()
{
  return MEMORY[0x189612B68]();
}

uint64_t sub_1892EC828()
{
  return MEMORY[0x189612B70]();
}

uint64_t sub_1892EC834()
{
  return MEMORY[0x189612B78]();
}

uint64_t sub_1892EC840()
{
  return MEMORY[0x189612B80]();
}

uint64_t sub_1892EC84C()
{
  return MEMORY[0x189612B88]();
}

uint64_t sub_1892EC858()
{
  return MEMORY[0x189612BA0]();
}

uint64_t sub_1892EC864()
{
  return MEMORY[0x189607050]();
}

uint64_t sub_1892EC870()
{
  return MEMORY[0x189617B30]();
}

uint64_t sub_1892EC87C()
{
  return MEMORY[0x189607138]();
}

uint64_t sub_1892EC888()
{
  return MEMORY[0x189617DD8]();
}

uint64_t sub_1892EC894()
{
  return MEMORY[0x189617E70]();
}

uint64_t sub_1892EC8A0()
{
  return MEMORY[0x189617EB0]();
}

uint64_t sub_1892EC8AC()
{
  return MEMORY[0x1896071E0]();
}

uint64_t sub_1892EC8B8()
{
  return MEMORY[0x1896071F0]();
}

uint64_t sub_1892EC8C4()
{
  return MEMORY[0x189618318]();
}

uint64_t sub_1892EC8D0()
{
  return MEMORY[0x18961D220]();
}

uint64_t sub_1892EC8DC()
{
  return MEMORY[0x18961D228]();
}

uint64_t sub_1892EC8E8()
{
  return MEMORY[0x18961D248]();
}

uint64_t sub_1892EC8F4()
{
  return MEMORY[0x189618D30]();
}

uint64_t sub_1892EC900()
{
  return MEMORY[0x189618D50]();
}

uint64_t sub_1892EC90C()
{
  return MEMORY[0x1896190C8]();
}

uint64_t sub_1892EC918()
{
  return MEMORY[0x1896191E8]();
}

uint64_t sub_1892EC924()
{
  return MEMORY[0x1896191F0]();
}

uint64_t sub_1892EC930()
{
  return MEMORY[0x189619300]();
}

uint64_t sub_1892EC93C()
{
  return MEMORY[0x189619440]();
}

uint64_t sub_1892EC948()
{
  return MEMORY[0x1896198A0]();
}

uint64_t sub_1892EC954()
{
  return MEMORY[0x1896198A8]();
}

uint64_t sub_1892EC960()
{
  return MEMORY[0x189619930]();
}

uint64_t sub_1892EC96C()
{
  return MEMORY[0x189619960]();
}

uint64_t sub_1892EC978()
{
  return MEMORY[0x189619978]();
}

uint64_t sub_1892EC984()
{
  return MEMORY[0x189619CC8]();
}

uint64_t sub_1892EC990()
{
  return MEMORY[0x18961A050]();
}

uint64_t sub_1892EC99C()
{
  return MEMORY[0x18961A3C0]();
}

uint64_t sub_1892EC9A8()
{
  return MEMORY[0x18961A3D0]();
}

uint64_t sub_1892EC9B4()
{
  return MEMORY[0x18961A3D8]();
}

uint64_t sub_1892EC9C0()
{
  return MEMORY[0x18961A3E0]();
}

uint64_t sub_1892EC9CC()
{
  return MEMORY[0x18961A680]();
}

uint64_t sub_1892EC9D8()
{
  return MEMORY[0x18961A6A8]();
}

uint64_t sub_1892EC9E4()
{
  return MEMORY[0x18961A6C0]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x189613758]();
}

uint64_t MobileGestalt_get_exclaveCapability()
{
  return MEMORY[0x189613760]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x18961B048]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x18961B058]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1895FBCE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1896165B8](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616718](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x18961B0A8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x18961B0B0]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x18961B120]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x18961B150]();
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

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x18961B2B8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x18961B2C0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x18961B2D0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x18961B390]();
}

uint64_t swift_once()
{
  return MEMORY[0x18961B3B8]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x18961B3D0]();
}

uint64_t swift_retain()
{
  return MEMORY[0x18961B3E0]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x18961B3E8]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x18961B410]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x18961B418]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x18961B468]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x18961B4D0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x18961B518]();
}