uint64_t sub_118AA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  v4 = type metadata accessor for HealthDataLogModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

void sub_118AE8()
{
}

void sub_118B14()
{
}

void sub_118B40(void *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_118B54(void *a1)
{
  return HealthDataLogModel.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for HealthDataLogModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = type metadata accessor for SnippetHeaderModel(0LL);
    if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a2, 1LL, v7))
    {
      uint64_t v8 = sub_494C(&qword_18A1A8);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64LL));
    }

    else
    {
      uint64_t v10 = type metadata accessor for SpeakableString(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16LL))(a1, a2, v10);
      uint64_t v11 = *(int *)(v7 + 20);
      v12 = (uint64_t *)((char *)a1 + v11);
      v13 = (uint64_t *)((char *)a2 + v11);
      uint64_t v14 = v13[1];
      void *v12 = *v13;
      v12[1] = v14;
      uint64_t v15 = *(int *)(v7 + 24);
      v16 = (uint64_t *)((char *)a1 + v15);
      v17 = (uint64_t *)((char *)a2 + v15);
      uint64_t v18 = v17[1];
      void *v16 = *v17;
      v16[1] = v18;
      swift_bridgeObjectRetain(v14);
      swift_bridgeObjectRetain(v18);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)a1, 0LL, 1LL, v7);
    }

    uint64_t v19 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    v20 = (uint64_t *)((char *)a1 + v19);
    v21 = (uint64_t *)((char *)a2 + v19);
    uint64_t v22 = v21[1];
    void *v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = a3[7];
    uint64_t v24 = a3[8];
    v25 = (uint64_t *)((char *)a1 + v23);
    v26 = (uint64_t *)((char *)a2 + v23);
    uint64_t v27 = v26[1];
    void *v25 = *v26;
    v25[1] = v27;
    v28 = (uint64_t *)((char *)a1 + v24);
    v29 = (uint64_t *)((char *)a2 + v24);
    uint64_t v30 = v29[1];
    void *v28 = *v29;
    v28[1] = v30;
    uint64_t v31 = a3[9];
    uint64_t v32 = a3[10];
    v33 = (uint64_t *)((char *)a1 + v31);
    v34 = (uint64_t *)((char *)a2 + v31);
    uint64_t v35 = v34[1];
    void *v33 = *v34;
    v33[1] = v35;
    __dst = (char *)a1 + v32;
    v36 = (char *)a2 + v32;
    uint64_t v37 = type metadata accessor for AppPunchout(0LL);
    swift_retain();
    swift_bridgeObjectRetain(v22);
    swift_bridgeObjectRetain(v27);
    swift_bridgeObjectRetain(v30);
    swift_bridgeObjectRetain(v35);
    if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v36, 1LL, v37))
    {
      uint64_t v38 = sub_494C(&qword_18A1A0);
      memcpy(__dst, v36, *(void *)(*(void *)(v38 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16LL))(__dst, v36, v37);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)__dst, 0LL, 1LL, v37);
    }

    uint64_t v39 = a3[11];
    v40 = (uint64_t *)((char *)a1 + v39);
    v41 = (uint64_t *)((char *)a2 + v39);
    uint64_t v42 = v41[1];
    void *v40 = *v41;
    v40[1] = v42;
    swift_bridgeObjectRetain(v42);
  }

  return a1;
}

uint64_t destroy for HealthDataLogModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SnippetHeaderModel(0LL);
  if (!_s18WellnessFlowPlugin16WellnessSnippetsOwet_0(a1, 1LL, v4))
  {
    uint64_t v5 = type metadata accessor for SpeakableString(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(a1, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 40);
  uint64_t v7 = type metadata accessor for AppPunchout(0LL);
  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for HealthDataLogModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SnippetHeaderModel(0LL);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a2, 1LL, v6))
  {
    uint64_t v7 = sub_494C(&qword_18A1A8);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64LL));
  }

  else
  {
    uint64_t v8 = type metadata accessor for SpeakableString(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16LL))(a1, a2, v8);
    uint64_t v9 = *(int *)(v6 + 20);
    uint64_t v10 = &a1[v9];
    uint64_t v11 = &a2[v9];
    uint64_t v12 = *((void *)v11 + 1);
    *(void *)uint64_t v10 = *(void *)v11;
    *((void *)v10 + 1) = v12;
    uint64_t v13 = *(int *)(v6 + 24);
    uint64_t v14 = &a1[v13];
    uint64_t v15 = &a2[v13];
    uint64_t v16 = *((void *)v15 + 1);
    *(void *)uint64_t v14 = *(void *)v15;
    *((void *)v14 + 1) = v16;
    swift_bridgeObjectRetain(v12);
    swift_bridgeObjectRetain(v16);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)a1, 0LL, 1LL, v6);
  }

  uint64_t v17 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  uint64_t v20 = *((void *)v19 + 1);
  *(void *)uint64_t v18 = *(void *)v19;
  *((void *)v18 + 1) = v20;
  uint64_t v21 = a3[7];
  uint64_t v22 = a3[8];
  uint64_t v23 = &a1[v21];
  uint64_t v24 = &a2[v21];
  uint64_t v25 = *((void *)v24 + 1);
  *(void *)uint64_t v23 = *(void *)v24;
  *((void *)v23 + 1) = v25;
  v26 = &a1[v22];
  uint64_t v27 = &a2[v22];
  uint64_t v28 = *((void *)v27 + 1);
  *(void *)v26 = *(void *)v27;
  *((void *)v26 + 1) = v28;
  uint64_t v29 = a3[9];
  uint64_t v30 = a3[10];
  uint64_t v31 = &a1[v29];
  uint64_t v32 = &a2[v29];
  uint64_t v33 = *((void *)v32 + 1);
  *(void *)uint64_t v31 = *(void *)v32;
  *((void *)v31 + 1) = v33;
  __dst = &a1[v30];
  v34 = &a2[v30];
  uint64_t v35 = type metadata accessor for AppPunchout(0LL);
  swift_retain();
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRetain(v25);
  swift_bridgeObjectRetain(v28);
  swift_bridgeObjectRetain(v33);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v34, 1LL, v35))
  {
    uint64_t v36 = sub_494C(&qword_18A1A0);
    memcpy(__dst, v34, *(void *)(*(void *)(v36 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16LL))(__dst, v34, v35);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)__dst, 0LL, 1LL, v35);
  }

  uint64_t v37 = a3[11];
  uint64_t v38 = &a1[v37];
  uint64_t v39 = &a2[v37];
  uint64_t v40 = *((void *)v39 + 1);
  *(void *)uint64_t v38 = *(void *)v39;
  *((void *)v38 + 1) = v40;
  swift_bridgeObjectRetain(v40);
  return a1;
}

char *assignWithCopy for HealthDataLogModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SnippetHeaderModel(0LL);
  int v7 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a1, 1LL, v6);
  int v8 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a2, 1LL, v6);
  if (v7)
  {
    if (!v8)
    {
      uint64_t v9 = type metadata accessor for SpeakableString(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16LL))(a1, a2, v9);
      uint64_t v10 = *(int *)(v6 + 20);
      uint64_t v11 = &a1[v10];
      uint64_t v12 = &a2[v10];
      *(void *)uint64_t v11 = *(void *)v12;
      uint64_t v13 = *((void *)v12 + 1);
      *((void *)v11 + 1) = v13;
      uint64_t v14 = *(int *)(v6 + 24);
      uint64_t v15 = &a1[v14];
      uint64_t v16 = &a2[v14];
      *(void *)uint64_t v15 = *(void *)v16;
      uint64_t v17 = *((void *)v16 + 1);
      *((void *)v15 + 1) = v17;
      swift_bridgeObjectRetain(v13);
      swift_bridgeObjectRetain(v17);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)a1, 0LL, 1LL, v6);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  if (v8)
  {
    sub_26F04((uint64_t)a1, type metadata accessor for SnippetHeaderModel);
LABEL_6:
    uint64_t v18 = sub_494C(&qword_18A1A8);
    memcpy(a1, a2, *(void *)(*(void *)(v18 - 8) + 64LL));
    goto LABEL_7;
  }

  uint64_t v48 = type metadata accessor for SpeakableString(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 24LL))(a1, a2, v48);
  uint64_t v49 = *(int *)(v6 + 20);
  v50 = &a1[v49];
  v51 = &a2[v49];
  *(void *)v50 = *(void *)v51;
  uint64_t v52 = *((void *)v51 + 1);
  *((void *)v50 + 1) = v52;
  swift_bridgeObjectRetain(v52);
  swift_bridgeObjectRelease();
  uint64_t v53 = *(int *)(v6 + 24);
  v54 = &a1[v53];
  v55 = &a2[v53];
  *(void *)v54 = *(void *)v55;
  uint64_t v56 = *((void *)v55 + 1);
  *((void *)v54 + 1) = v56;
  swift_bridgeObjectRetain(v56);
  swift_bridgeObjectRelease();
LABEL_7:
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  swift_retain();
  swift_release();
  uint64_t v19 = a3[6];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  *(void *)uint64_t v20 = *(void *)v21;
  uint64_t v22 = *((void *)v21 + 1);
  *((void *)v20 + 1) = v22;
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[7];
  uint64_t v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  *(void *)uint64_t v24 = *(void *)v25;
  uint64_t v26 = *((void *)v25 + 1);
  *((void *)v24 + 1) = v26;
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRelease();
  uint64_t v27 = a3[8];
  uint64_t v28 = &a1[v27];
  uint64_t v29 = &a2[v27];
  *(void *)uint64_t v28 = *(void *)v29;
  uint64_t v30 = *((void *)v29 + 1);
  *((void *)v28 + 1) = v30;
  swift_bridgeObjectRetain(v30);
  swift_bridgeObjectRelease();
  uint64_t v31 = a3[9];
  uint64_t v32 = &a1[v31];
  uint64_t v33 = &a2[v31];
  *(void *)uint64_t v32 = *(void *)v33;
  uint64_t v34 = *((void *)v33 + 1);
  *((void *)v32 + 1) = v34;
  swift_bridgeObjectRetain(v34);
  swift_bridgeObjectRelease();
  uint64_t v35 = a3[10];
  uint64_t v36 = &a1[v35];
  uint64_t v37 = &a2[v35];
  uint64_t v38 = type metadata accessor for AppPunchout(0LL);
  int v39 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v36, 1LL, v38);
  int v40 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v37, 1LL, v38);
  if (!v39)
  {
    uint64_t v41 = *(void *)(v38 - 8);
    if (!v40)
    {
      (*(void (**)(char *, char *, uint64_t))(v41 + 24))(v36, v37, v38);
      goto LABEL_13;
    }

    (*(void (**)(char *, uint64_t))(v41 + 8))(v36, v38);
    goto LABEL_12;
  }

  if (v40)
  {
LABEL_12:
    uint64_t v42 = sub_494C(&qword_18A1A0);
    memcpy(v36, v37, *(void *)(*(void *)(v42 - 8) + 64LL));
    goto LABEL_13;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16LL))(v36, v37, v38);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v36, 0LL, 1LL, v38);
LABEL_13:
  uint64_t v43 = a3[11];
  v44 = &a1[v43];
  v45 = &a2[v43];
  *(void *)v44 = *(void *)v45;
  uint64_t v46 = *((void *)v45 + 1);
  *((void *)v44 + 1) = v46;
  swift_bridgeObjectRetain(v46);
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for HealthDataLogModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SnippetHeaderModel(0LL);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a2, 1LL, v6))
  {
    uint64_t v7 = sub_494C(&qword_18A1A8);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64LL));
  }

  else
  {
    uint64_t v8 = type metadata accessor for SpeakableString(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32LL))(a1, a2, v8);
    *(_OWORD *)&a1[*(int *)(v6 + 20)] = *(_OWORD *)&a2[*(int *)(v6 + 20)];
    *(_OWORD *)&a1[*(int *)(v6 + 24)] = *(_OWORD *)&a2[*(int *)(v6 + 24)];
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)a1, 0LL, 1LL, v6);
  }

  uint64_t v9 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  *(_OWORD *)&a1[v9] = *(_OWORD *)&a2[v9];
  uint64_t v10 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v10] = *(_OWORD *)&a2[v10];
  uint64_t v11 = a3[10];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = type metadata accessor for AppPunchout(0LL);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v13, 1LL, v14))
  {
    uint64_t v15 = sub_494C(&qword_18A1A0);
    memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32LL))(v12, v13, v14);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v12, 0LL, 1LL, v14);
  }

  *(_OWORD *)&a1[a3[11]] = *(_OWORD *)&a2[a3[11]];
  return a1;
}

char *assignWithTake for HealthDataLogModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for SnippetHeaderModel(0LL);
  int v7 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a1, 1LL, v6);
  int v8 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a2, 1LL, v6);
  if (v7)
  {
    if (!v8)
    {
      uint64_t v9 = type metadata accessor for SpeakableString(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32LL))(a1, a2, v9);
      *(_OWORD *)&a1[*(int *)(v6 + 20)] = *(_OWORD *)&a2[*(int *)(v6 + 20)];
      *(_OWORD *)&a1[*(int *)(v6 + 24)] = *(_OWORD *)&a2[*(int *)(v6 + 24)];
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)a1, 0LL, 1LL, v6);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  if (v8)
  {
    sub_26F04((uint64_t)a1, type metadata accessor for SnippetHeaderModel);
LABEL_6:
    uint64_t v10 = sub_494C(&qword_18A1A8);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64LL));
    goto LABEL_7;
  }

  uint64_t v45 = type metadata accessor for SpeakableString(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 40LL))(a1, a2, v45);
  uint64_t v46 = *(int *)(v6 + 20);
  v47 = &a1[v46];
  uint64_t v48 = &a2[v46];
  uint64_t v50 = *(void *)v48;
  uint64_t v49 = *((void *)v48 + 1);
  *(void *)v47 = v50;
  *((void *)v47 + 1) = v49;
  swift_bridgeObjectRelease();
  uint64_t v51 = *(int *)(v6 + 24);
  uint64_t v52 = &a1[v51];
  uint64_t v53 = &a2[v51];
  uint64_t v55 = *(void *)v53;
  uint64_t v54 = *((void *)v53 + 1);
  *(void *)uint64_t v52 = v55;
  *((void *)v52 + 1) = v54;
  swift_bridgeObjectRelease();
LABEL_7:
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  swift_release();
  uint64_t v11 = a3[6];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v15 = *(void *)v13;
  uint64_t v14 = *((void *)v13 + 1);
  *(void *)uint64_t v12 = v15;
  *((void *)v12 + 1) = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[7];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v20 = *(void *)v18;
  uint64_t v19 = *((void *)v18 + 1);
  *(void *)uint64_t v17 = v20;
  *((void *)v17 + 1) = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[8];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  uint64_t v25 = *(void *)v23;
  uint64_t v24 = *((void *)v23 + 1);
  *(void *)uint64_t v22 = v25;
  *((void *)v22 + 1) = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = a3[9];
  uint64_t v27 = &a1[v26];
  uint64_t v28 = &a2[v26];
  uint64_t v30 = *(void *)v28;
  uint64_t v29 = *((void *)v28 + 1);
  *(void *)uint64_t v27 = v30;
  *((void *)v27 + 1) = v29;
  swift_bridgeObjectRelease();
  uint64_t v31 = a3[10];
  uint64_t v32 = &a1[v31];
  uint64_t v33 = &a2[v31];
  uint64_t v34 = type metadata accessor for AppPunchout(0LL);
  int v35 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v32, 1LL, v34);
  int v36 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v33, 1LL, v34);
  if (!v35)
  {
    uint64_t v37 = *(void *)(v34 - 8);
    if (!v36)
    {
      (*(void (**)(char *, char *, uint64_t))(v37 + 40))(v32, v33, v34);
      goto LABEL_13;
    }

    (*(void (**)(char *, uint64_t))(v37 + 8))(v32, v34);
    goto LABEL_12;
  }

  if (v36)
  {
LABEL_12:
    uint64_t v38 = sub_494C(&qword_18A1A0);
    memcpy(v32, v33, *(void *)(*(void *)(v38 - 8) + 64LL));
    goto LABEL_13;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 32LL))(v32, v33, v34);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v32, 0LL, 1LL, v34);
LABEL_13:
  uint64_t v39 = a3[11];
  int v40 = &a1[v39];
  uint64_t v41 = &a2[v39];
  uint64_t v43 = *(void *)v41;
  uint64_t v42 = *((void *)v41 + 1);
  *(void *)int v40 = v43;
  *((void *)v40 + 1) = v42;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HealthDataLogModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_119874);
}

uint64_t sub_119874(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_494C(&qword_18A1A8);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = a1;
    return _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v8, a2, v7);
  }

  if ((_DWORD)a2 != 2147483646)
  {
    uint64_t v7 = sub_494C(&qword_18A1A0);
    uint64_t v8 = a1 + *(int *)(a3 + 40);
    return _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v8, a2, v7);
  }

  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  int v10 = v9 - 1;
  if (v10 < 0) {
    int v10 = -1;
  }
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for HealthDataLogModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_119930);
}

void sub_119930(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_494C(&qword_18A1A8);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = a1;
  }

  else
  {
    if (a3 == 2147483646)
    {
      *(void *)(a1 + *(int *)(a4 + 20)) = a2;
      sub_1EB0C();
      return;
    }

    uint64_t v9 = sub_494C(&qword_18A1A0);
    uint64_t v10 = a1 + *(int *)(a4 + 40);
  }

  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v10, a2, a2, v9);
}

void sub_1199C8(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v6[0] = *(void *)(v2 - 8) + 64LL;
    v6[1] = "\b";
    v6[2] = &unk_13F170;
    v6[3] = &unk_13F170;
    v6[4] = &unk_13F170;
    v6[5] = &unk_13F170;
    sub_27758(319LL, &qword_18AB38, (uint64_t (*)(uint64_t))&type metadata accessor for AppPunchout);
    if (v5 <= 0x3F)
    {
      v6[6] = *(void *)(v4 - 8) + 64LL;
      v6[7] = &unk_13F170;
      swift_initStructMetadata(a1, 256LL, 8LL, v6, a1 + 16);
    }
  }

uint64_t storeEnumTagSinglePayload for HealthDataLogModel.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF8) {
    return ((uint64_t (*)(void))((char *)&loc_119AD0 + 4 * byte_13F08D[v4]))();
  }
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_119B04 + 4 * byte_13F088[v4]))();
}

uint64_t sub_119B04(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_119B0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x119B14LL);
  }
  return result;
}

uint64_t sub_119B20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x119B28LL);
  }
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_119B2C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_119B34(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HealthDataLogModel.CodingKeys()
{
  return &type metadata for HealthDataLogModel.CodingKeys;
}

unint64_t sub_119B54()
{
  unint64_t result = qword_190448;
  if (!qword_190448)
  {
    unint64_t result = swift_getWitnessTable(&unk_13F224, &type metadata for HealthDataLogModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_190448);
  }

  return result;
}

unint64_t sub_119B94()
{
  unint64_t result = qword_190450;
  if (!qword_190450)
  {
    unint64_t result = swift_getWitnessTable(&unk_13F194, &type metadata for HealthDataLogModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_190450);
  }

  return result;
}

unint64_t sub_119BD4()
{
  unint64_t result = qword_190458[0];
  if (!qword_190458[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_13F1BC, &type metadata for HealthDataLogModel.CodingKeys);
    atomic_store(result, qword_190458);
  }

  return result;
}

uint64_t sub_119C10()
{
  return type metadata accessor for HealthDataLogModel(0LL);
}

uint64_t sub_119C18@<X0>(char a1@<W8>)
{
  *(_BYTE *)(v2 - 72) = a1;
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v2 - 72, v1);
}

uint64_t sub_119C2C(uint64_t a1, uint64_t a2)
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(a1, a2, v2, v3);
}

uint64_t sub_119C40()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 160) + 8LL))(v0, v1);
}

uint64_t sub_119C54@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, void))(a1 + 8))(v1, *(void *)(v2 - 120));
}

  ;
}

uint64_t sub_119C70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(a1, a2, a3, a4);
}

  ;
}

ValueMetadata *type metadata accessor for PunchoutFlow()
{
  return &type metadata for PunchoutFlow;
}

uint64_t sub_119C94(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_3A358();
  return Flow.deferToExecuteAsync(_:)(a1, a2, &type metadata for PunchoutFlow, v4);
}

uint64_t sub_119CD4(uint64_t a1)
{
  v2[111] = v1;
  v2[110] = a1;
  uint64_t v3 = sub_D984();
  v2[112] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[113] = v4;
  v2[114] = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_119D34, 0LL, 0LL);
}

uint64_t sub_119D34()
{
  uint64_t v1 = *(void **)(v0 + 888);
  FlowTaskLogger.taskStart()();
  uint64_t v2 = v1 + 1;
  uint64_t v3 = v1[4];
  uint64_t v4 = v1[5];
  sub_500C(v1 + 1, v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
  uint64_t v5 = *(void *)(v0 + 712);
  uint64_t v6 = *(void *)(v0 + 720);
  sub_500C((void *)(v0 + 688), v5);
  char v7 = dispatch thunk of DeviceState.isPhone.getter(v5, v6);
  sub_11B128((uint64_t)v1, v0 + 16);
  if ((v7 & 1) != 0)
  {
    sub_3A394((void *)(v0 + 16));
    sub_36E94();
LABEL_4:
    sub_11A0F4();
LABEL_5:
    static ExecuteResponse.complete(next:)(v13);
    swift_release();
    goto LABEL_6;
  }

  uint64_t v8 = *(void *)(v0 + 48);
  uint64_t v9 = *(void *)(v0 + 56);
  sub_500C((void *)(v0 + 24), v8);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v9);
  uint64_t v10 = *(void *)(v0 + 792);
  uint64_t v11 = *(void *)(v0 + 800);
  sub_500C((void *)(v0 + 768), v10);
  char v12 = dispatch thunk of DeviceState.isPad.getter(v10, v11);
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0((void *)(v0 + 768));
  sub_3A394((void *)(v0 + 16));
  sub_36E94();
  if ((v12 & 1) != 0) {
    goto LABEL_4;
  }
  uint64_t v16 = v1[4];
  uint64_t v15 = v1[5];
  sub_500C(v2, v16);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v16, v15);
  uint64_t v17 = *(void *)(v0 + 832);
  sub_500C((void *)(v0 + 808), v17);
  char v18 = dispatch thunk of DeviceState.isWatch.getter(v17);
  uint64_t v19 = sub_36E94();
  if ((v18 & 1) != 0)
  {
    sub_11A7EC();
    goto LABEL_5;
  }

  uint64_t v20 = *(void *)(v0 + 912);
  uint64_t v21 = *(void *)(v0 + 904);
  uint64_t v22 = *(void *)(v0 + 896);
  uint64_t v23 = *(void *)(v0 + 888);
  uint64_t v24 = Logger.wellness.unsafeMutableAddressor(v19);
  sub_A5DC(v24, v0 + 848);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v20, v24, v22);
  uint64_t v25 = sub_11B128(v23, v0 + 272);
  uint64_t v26 = (os_log_s *)Logger.logObject.getter(v25);
  os_log_type_t v27 = static os_log_type_t.error.getter();
  BOOL v28 = os_log_type_enabled(v26, v27);
  uint64_t v29 = *(void *)(v0 + 912);
  uint64_t v30 = *(void *)(v0 + 904);
  uint64_t v31 = *(void *)(v0 + 896);
  if (v28)
  {
    uint64_t v40 = *(void *)(v0 + 912);
    uint64_t v32 = (uint8_t *)sub_A5E8(12LL);
    uint64_t v38 = sub_A5E8(32LL);
    *(_DWORD *)uint64_t v32 = 136315138;
    uint64_t v41 = v38;
    uint64_t v39 = v31;
    uint64_t v33 = *(void *)(v0 + 304);
    uint64_t v34 = *(void *)(v0 + 312);
    sub_500C((void *)(v0 + 280), v33);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v34);
    uint64_t v35 = sub_494C(&qword_18D608);
    uint64_t v36 = String.init<A>(describing:)(v0 + 728, v35);
    *(void *)(v0 + 872) = sub_39178(v36, v37, &v41);
    sub_11B230(v0 + 872, v0 + 880, (uint64_t)(v32 + 4));
    swift_bridgeObjectRelease();
    sub_3A394((void *)(v0 + 272));
    sub_DA24(&dword_0, v26, v27, "Failed to execute PunchoutFlow (unsupported device: %s.", v32);
    sub_A81C(v38);
    sub_5050(v38);
    sub_5050((uint64_t)v32);

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v40, v39);
  }

  else
  {
    sub_3A394((void *)(v0 + 272));

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v31);
  }

  sub_A13C((_OWORD *)(*(void *)(v0 + 888) + 88LL), (_OWORD *)(v0 + 528));
  sub_A178();
  static ExecuteResponse.complete<A>(next:)();
  sub_A1B4((void *)(v0 + 528));
LABEL_6:
  swift_task_dealloc(*(void *)(v0 + 912));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_11A0F4()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_D984();
  uint64_t v88 = *(void *)(v3 - 8);
  uint64_t v89 = v3;
  __chkstk_darwin(v3);
  sub_AA58();
  uint64_t v6 = v4 - v5;
  __chkstk_darwin(v7);
  v85 = (char *)&v80 - v8;
  uint64_t v84 = type metadata accessor for AppPunchOutFlow(0LL);
  sub_6D20();
  __chkstk_darwin(v9);
  sub_6D30();
  uint64_t v83 = v10;
  uint64_t v82 = type metadata accessor for OutputFlow(0LL);
  sub_6D20();
  __chkstk_darwin(v11);
  sub_6D30();
  uint64_t v81 = v12;
  sub_494C(&qword_189D00);
  sub_6D20();
  __chkstk_darwin(v13);
  sub_41C68();
  sub_494C(&qword_18AFC0);
  sub_6D20();
  __chkstk_darwin(v14);
  sub_AA58();
  uint64_t v17 = v15 - v16;
  __chkstk_darwin(v18);
  uint64_t v86 = (uint64_t)&v80 - v19;
  sub_494C(&qword_189CF8);
  sub_6D20();
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v80 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = type metadata accessor for URL(0LL);
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  sub_AA58();
  uint64_t v27 = v25 - v26;
  __chkstk_darwin(v28);
  v87 = (char *)&v80 - v29;
  unsigned __int16 v30 = *v2;
  sub_12C160(*v2);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v22, 1LL, v23) == 1)
  {
    sub_279E0((uint64_t)v22, &qword_189CF8);
LABEL_5:
    uint64_t v33 = Logger.wellness.unsafeMutableAddressor(v31);
    sub_A5DC(v33, (uint64_t)v90);
    uint64_t v34 = v88;
    uint64_t v35 = v89;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v88 + 16))(v6, v33, v89);
    uint64_t v36 = sub_11B128((uint64_t)v2, (uint64_t)v93);
    unint64_t v37 = (os_log_s *)Logger.logObject.getter(v36);
    static os_log_type_t.error.getter();
    if (sub_11B204(v37))
    {
      uint64_t v38 = (_DWORD *)sub_A5E8(12LL);
      uint64_t v39 = sub_A5E8(32LL);
      uint64_t v92 = v39;
      *uint64_t v38 = 136315138;
      uint64_t v40 = sub_10F1C0(v93[0]);
      uint64_t v91 = sub_39178(v40, v41, &v92);
      sub_A738((uint64_t)&v91, (uint64_t)&v92);
      swift_bridgeObjectRelease();
      sub_3A394(v93);
      sub_11B1CC(&dword_0, v37, v42, "Failed to create deepLink for dataType: %s.");
      sub_A81C(v39);
      sub_5050(v39);
      sub_5050((uint64_t)v38);

      (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v6, v89);
    }

    else
    {
      sub_3A394(v93);

      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v6, v35);
    }

    sub_A13C(v2 + 44, v93);
    sub_A178();
    Flow.eraseToAnyFlow()(&type metadata for GenericErrorFlow);
    sub_A1B4(v93);
    goto LABEL_12;
  }

  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v87, v22, v23);
  unsigned __int8 v32 = sub_12BAB0(v30);
  if (v32 == 205)
  {
    uint64_t v31 = (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v87, v23);
    goto LABEL_5;
  }

  unsigned __int8 v43 = v32;
  v44 = sub_500C((void *)v2 + 6, *((void *)v2 + 9));
  sub_11EC54(*v44);
  uint64_t v45 = sub_27CC8(v43);
  String.toSpeakableString.getter(v45, v46);
  swift_bridgeObjectRelease();
  uint64_t v47 = type metadata accessor for SpeakableString(0LL);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v1, 0LL, 1LL, v47);
  uint64_t v48 = HealthApps.sirikitApp.getter(11LL);
  uint64_t v80 = v24;
  uint64_t v49 = v86;
  sub_214AC(v1, v48);
  swift_release();
  swift_release();
  sub_279E0(v1, &qword_189D00);
  uint64_t v50 = v2 + 4;
  uint64_t v51 = *((void *)v2 + 4);
  uint64_t v52 = *((void *)v2 + 5);
  sub_500C((void *)v2 + 1, v51);
  (*(void (**)(_OWORD *__return_ptr, uint64_t, uint64_t))(v52 + 16))(v93, v51, v52);
  uint64_t v53 = sub_494C(&qword_18A460);
  uint64_t v54 = swift_allocObject(v53, 48LL, 7LL);
  *(_OWORD *)(v54 + 16) = xmmword_139EC0;
  sub_3BF9C(v49, v17);
  sub_A304((uint64_t)(v2 + 4), (uint64_t)v90);
  uint64_t v55 = v81;
  OutputFlow.init(templatingResult:snippets:flowConfig:rrEntities:)(v17, _swiftEmptyArrayStorage, v90, 0LL);
  sub_A410( &qword_18AFD0,  (uint64_t (*)(uint64_t))&type metadata accessor for OutputFlow,  (uint64_t)&protocol conformance descriptor for OutputFlow);
  uint64_t v56 = Flow.eraseToAnyFlow()(v82);
  sub_26F04(v55, (uint64_t (*)(void))&type metadata accessor for OutputFlow);
  *(void *)(v54 + 32) = v56;
  uint64_t v57 = *((void *)v2 + 4);
  uint64_t v58 = *((void *)v2 + 5);
  sub_500C(v50, v57);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v58 + 16))(v90, v57, v58);
  v59 = v87;
  (*(void (**)(uint64_t, char *, uint64_t))(v80 + 16))(v27, v87, v23);
  uint64_t v60 = v83;
  AppPunchOutFlow.init(aceService:url:instrumentationTask:)(v90, v27, 0LL, 0LL);
  sub_A410( &qword_18AFC8,  (uint64_t (*)(uint64_t))&type metadata accessor for AppPunchOutFlow,  (uint64_t)&protocol conformance descriptor for AppPunchOutFlow);
  uint64_t v61 = Flow.eraseToAnyFlow()(v84);
  sub_26F04(v60, (uint64_t (*)(void))&type metadata accessor for AppPunchOutFlow);
  *(void *)(v54 + 40) = v61;
  v90[0] = v54;
  specialized Array._endMutation()(v62, v63, v64);
  uint64_t v65 = v90[0];
  uint64_t v66 = type metadata accessor for SequenceFlow(0LL);
  swift_allocObject(v66, 64LL, 7LL);
  uint64_t v67 = SequenceFlow.init(aceService:flows:)(v93, v65);
  uint64_t v68 = Logger.wellness.unsafeMutableAddressor(v67);
  sub_A5DC(v68, (uint64_t)v93);
  uint64_t v70 = v88;
  uint64_t v69 = v89;
  v71 = v85;
  uint64_t v72 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v88 + 16))(v85, v68, v89);
  v73 = (os_log_s *)Logger.logObject.getter(v72);
  os_log_type_t v74 = static os_log_type_t.debug.getter(v73);
  if (os_log_type_enabled(v73, v74))
  {
    v75 = (uint8_t *)sub_A5E8(2LL);
    uint64_t v84 = v66;
    uint64_t v76 = v67;
    v77 = v59;
    v78 = v75;
    *(_WORD *)v75 = 0;
    _os_log_impl(&dword_0, v73, v74, "Preparing SequenceFlow for Output and AppPunchOut.", v75, 2u);
    uint64_t v79 = (uint64_t)v78;
    v59 = v77;
    uint64_t v67 = v76;
    uint64_t v66 = v84;
    sub_5050(v79);
  }

  (*(void (**)(char *, uint64_t))(v70 + 8))(v71, v69);
  v90[0] = v67;
  sub_A410( &qword_18AFD8,  (uint64_t (*)(uint64_t))&type metadata accessor for SequenceFlow,  (uint64_t)&protocol conformance descriptor for SequenceFlow);
  Flow.eraseToAnyFlow()(v66);
  sub_279E0(v86, &qword_18AFC0);
  (*(void (**)(char *, uint64_t))(v80 + 8))(v59, v23);
  swift_release();
LABEL_12:
  sub_D8FC();
}

void sub_11A7EC()
{
  uint64_t v2 = v0;
  type metadata accessor for CATOption(0LL);
  sub_6D20();
  __chkstk_darwin(v3);
  sub_41C68();
  uint64_t v4 = sub_D984();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  sub_AA58();
  uint64_t v8 = v6 - v7;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v77 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v77 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v77 - v16;
  uint64_t v18 = sub_12BAB0(*(_WORD *)v2);
  if (v18 == 205)
  {
    uint64_t v19 = Logger.wellness.unsafeMutableAddressor(v18);
    sub_A5DC(v19, (uint64_t)&v81);
    sub_DA34(v8, v19, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
    uint64_t v20 = sub_11B1F8();
    uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
    static os_log_type_t.error.getter();
    if (sub_11B204(v21))
    {
      uint64_t v80 = v4;
      uint64_t v22 = (_DWORD *)sub_A5E8(12LL);
      uint64_t v23 = sub_A5E8(32LL);
      v83[0] = v23;
      *uint64_t v22 = 136315138;
      uint64_t v79 = (uint8_t *)v5;
      uint64_t v24 = sub_11B21C();
      uint64_t v26 = sub_11B214(v24, v25);
      uint64_t v27 = sub_11B1E4(v26);
      sub_11B230(v27, v28, (uint64_t)(v22 + 1));
      swift_bridgeObjectRelease();
      sub_11B1DC();
      sub_11B1CC(&dword_0, v21, v29, "%s does not have a HealthKitIdentifier - cannot launch Watch app.");
      sub_A81C(v23);
      sub_5050(v23);
      sub_5050((uint64_t)v22);

      (*((void (**)(uint64_t, uint64_t))v79 + 1))(v8, v80);
    }

    else
    {
      sub_11B1DC();

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v4);
    }

    sub_A13C((_OWORD *)(v2 + 88), v84);
    sub_A178();
    sub_11B20C((uint64_t)&type metadata for GenericErrorFlow);
    uint64_t v42 = (void *)sub_11B224();
    sub_A1B4(v42);
  }

  else
  {
    uint64_t v30 = sub_11AEB0(v18);
    if (v30 == 14)
    {
      uint64_t v31 = Logger.wellness.unsafeMutableAddressor(v30);
      sub_A5DC(v31, (uint64_t)&v81);
      sub_DA34((uint64_t)v12, v31, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
      uint64_t v32 = sub_11B1F8();
      uint64_t v33 = (os_log_s *)Logger.logObject.getter(v32);
      os_log_type_t v34 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v80 = v4;
        uint64_t v35 = (uint8_t *)sub_A5E8(12LL);
        uint64_t v36 = sub_A5E8(32LL);
        v83[0] = v36;
        *(_DWORD *)uint64_t v35 = 136315138;
        uint64_t v79 = v35 + 4;
        uint64_t v37 = sub_11B21C();
        uint64_t v39 = sub_11B214(v37, v38);
        uint64_t v40 = sub_11B1E4(v39);
        sub_11B230(v40, v41, (uint64_t)v79);
        swift_bridgeObjectRelease();
        sub_11B1DC();
        sub_DA24( &dword_0,  v33,  v34,  "Failed to determine watch app for dataType: %s - it's an unsupported datatype on Watch. Returning DataTypePunchoutFlow.",  v35);
        sub_A81C(v36);
        sub_5050(v36);
        sub_5050((uint64_t)v35);

        (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v80);
      }

      else
      {
        sub_11B1DC();

        (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
      }

      unsigned __int16 v55 = *(_WORD *)v2;
      sub_A304(v2 + 8, (uint64_t)v84 + 8);
      sub_A304(v2 + 48, (uint64_t)v86);
      sub_A13C((_OWORD *)(v2 + 88), v87);
      LOWORD(v84[0]) = v55;
      char v88 = 0;
      sub_3BFE4();
      sub_11B20C((uint64_t)&type metadata for DataTypePunchoutFlow);
      uint64_t v56 = (void *)sub_11B224();
      sub_9BBBC(v56);
    }

    else
    {
      uint64_t v43 = v30;
      uint64_t v44 = HealthApps.isInstalled.getter(v30);
      char v45 = v44;
      uint64_t v46 = Logger.wellness.unsafeMutableAddressor(v44);
      uint64_t v47 = v46;
      if ((v45 & 1) != 0)
      {
        sub_A5DC(v46, (uint64_t)v83);
        uint64_t v48 = sub_DA34((uint64_t)v17, v47, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
        uint64_t v49 = (os_log_s *)Logger.logObject.getter(v48);
        static os_log_type_t.debug.getter(v49);
        if (sub_11B204(v49))
        {
          uint64_t v80 = v4;
          uint64_t v50 = (_DWORD *)sub_A5E8(12LL);
          uint64_t v51 = sub_A5E8(32LL);
          *(void *)&v84[0] = v51;
          uint64_t v79 = (uint8_t *)v5;
          _DWORD *v50 = 136315138;
          v78 = (uint8_t *)(v50 + 1);
          uint64_t v52 = HealthApps.rawValue.getter(v43);
          uint64_t v81 = sub_39178(v52, v53, (uint64_t *)v84);
          sub_11B238((uint64_t)&v81, (uint64_t)&v82);
          swift_bridgeObjectRelease();
          sub_11B1CC(&dword_0, v49, v54, "Will punch out to app: %s.");
          sub_A81C(v51);
          sub_5050(v51);
          sub_5050((uint64_t)v50);

          (*((void (**)(char *, uint64_t))v79 + 1))(v17, v80);
        }

        else
        {

          (*(void (**)(char *, uint64_t))(v5 + 8))(v17, v4);
        }

        uint64_t v67 = (void *)(v2 + 8);
        uint64_t v69 = *(void *)(v2 + 32);
        uint64_t v68 = *(void *)(v2 + 40);
        sub_500C(v67, v69);
        (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v68 + 24))(&v81, v69, v68);
        LaunchAppFlow.init(aceService:app:)(v84, &v81, v43);
        sub_11B15C();
        sub_11B20C((uint64_t)&type metadata for LaunchAppFlow);
        uint64_t v70 = sub_11B224();
        sub_11B198(v70);
      }

      else
      {
        sub_A5DC(v46, (uint64_t)&v81);
        sub_DA34((uint64_t)v15, v47, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
        uint64_t v57 = sub_11B1F8();
        uint64_t v58 = (os_log_s *)Logger.logObject.getter(v57);
        os_log_type_t v59 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v58, v59))
        {
          uint64_t v80 = v4;
          uint64_t v60 = (uint8_t *)sub_A5E8(12LL);
          uint64_t v61 = sub_A5E8(32LL);
          v83[0] = v61;
          uint64_t v79 = (uint8_t *)v5;
          *(_DWORD *)uint64_t v60 = 136315138;
          v78 = v60 + 4;
          uint64_t v62 = sub_11B21C();
          uint64_t v64 = sub_11B214(v62, v63);
          uint64_t v65 = sub_11B1E4(v64);
          sub_11B238(v65, v66);
          swift_bridgeObjectRelease();
          sub_11B1DC();
          sub_DA24(&dword_0, v58, v59, "%s doesn't have the appropriate Watch app installed.", v60);
          sub_A81C(v61);
          sub_5050(v61);
          sub_5050((uint64_t)v60);

          (*((void (**)(char *, uint64_t))v79 + 1))(v15, v80);
        }

        else
        {
          sub_11B1DC();

          (*(void (**)(char *, uint64_t))(v5 + 8))(v15, v4);
        }

        sub_A304(v2 + 8, (uint64_t)v84);
        uint64_t v71 = type metadata accessor for ResponseFactory(0LL);
        uint64_t v72 = swift_allocObject(v71, *(unsigned int *)(v71 + 48), *(unsigned __int16 *)(v71 + 52));
        uint64_t v73 = ResponseFactory.init()(v72);
        v86[2] = v71;
        v86[3] = &protocol witness table for ResponseFactory;
        uint64_t v85 = v73;
        type metadata accessor for WellnessCATsSimple(0LL);
        sub_7DF94();
        uint64_t v74 = CATWrapperSimple.__allocating_init(options:globals:)(v1, 0LL);
        type metadata accessor for WellnessCATs(0LL);
        sub_7DF94();
        uint64_t v75 = CATWrapper.__allocating_init(options:globals:)(v1, 0LL);
        v86[4] = v74;
        *(void *)&v87[0] = v75;
        sub_81C18();
        sub_11B20C((uint64_t)&type metadata for InstallAppFlow);
        uint64_t v76 = (void *)sub_11B224();
        sub_81BEC(v76);
      }
    }
  }

  sub_D8FC();
}

uint64_t sub_11AEB0(unsigned __int8 a1)
{
  uint64_t v2 = sub_D984();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a1 - 69 <= 0x18)
  {
    int v9 = 1 << (a1 - 69);
    if ((v9 & 0x1700000) != 0) {
      return 6LL;
    }
    if ((v9 & 0x80401) != 0) {
      return 9LL;
    }
  }

  uint64_t v7 = a1 - 155;
  if (((1LL << (a1 + 101)) & 0x100020000001LL) != 0) {
    return 6LL;
  }
  if (((1LL << (a1 + 101)) & 0x100010) != 0) {
    return 2LL;
  }
  if (v7 == 15) {
    return 0LL;
  }
LABEL_11:
  if (!a1 || a1 == 4) {
    return 6LL;
  }
  if (a1 == 60) {
    return 4LL;
  }
  uint64_t v10 = Logger.wellness.unsafeMutableAddressor(v4);
  sub_A5DC(v10, (uint64_t)v21);
  uint64_t v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v10, v2);
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  static os_log_type_t.error.getter();
  if (sub_11B204(v12))
  {
    uint64_t v13 = (_DWORD *)sub_A5E8(12LL);
    uint64_t v14 = sub_A5E8(32LL);
    uint64_t v20 = v14;
    _DWORD *v13 = 136315138;
    uint64_t v15 = sub_27CC8(a1);
    uint64_t v19 = sub_39178(v15, v16, &v20);
    sub_A738((uint64_t)&v19, (uint64_t)&v20);
    swift_bridgeObjectRelease();
    sub_11B1CC(&dword_0, v12, v17, "No known watch app for dataType: %s.");
    sub_A81C(v14);
    sub_5050(v14);
    sub_5050((uint64_t)v13);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return 14LL;
}

uint64_t sub_11B0D8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_190474);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_A108;
  return sub_119CD4(a1);
}

uint64_t sub_11B128(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_11B15C()
{
  unint64_t result = qword_190478;
  if (!qword_190478)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for LaunchAppFlow, &type metadata for LaunchAppFlow);
    atomic_store(result, (unint64_t *)&qword_190478);
  }

  return result;
}

uint64_t sub_11B198(uint64_t a1)
{
  return a1;
}

void sub_11B1CC(void *a1, os_log_s *a2, uint64_t a3, const char *a4)
{
}

void *sub_11B1DC()
{
  return sub_3A394((void *)(v0 + 104));
}

uint64_t sub_11B1E4(uint64_t a1)
{
  *(void *)(v1 + 96) = a1;
  return v1 + 96;
}

uint64_t sub_11B1F8()
{
  return sub_11B128(v1, v0 + 104);
}

BOOL sub_11B204(os_log_s *a1)
{
  return os_log_type_enabled(a1, v1);
}

uint64_t sub_11B20C(uint64_t a1)
{
  return Flow.eraseToAnyFlow()(a1);
}

uint64_t sub_11B214(uint64_t a1, unint64_t a2)
{
  return sub_39178(a1, a2, (uint64_t *)(v2 + 72));
}

uint64_t sub_11B21C()
{
  return sub_10F1C0(*(_WORD *)(v0 + 104));
}

uint64_t sub_11B224()
{
  return v0 + 104;
}

uint64_t sub_11B230(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2, a3, v3);
}

uint64_t sub_11B238(uint64_t a1, uint64_t a2)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2, *(void *)(v2 + 8), v3);
}

uint64_t sub_11B244()
{
  v2[3] = &type metadata for WellnessFeatureFlagsKey;
  v2[4] = sub_354B0();
  LOBYTE(v2[0]) = 4;
  char v0 = isFeatureEnabled(_:)(v2);
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v2);
  return v0 & 1;
}

uint64_t storeEnumTagSinglePayload for WellnessFeatureFlagsKey(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_11B2E4 + 4 * byte_13F325[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_11B318 + 4 * byte_13F320[v4]))();
}

uint64_t sub_11B318(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_11B320(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x11B328LL);
  }
  return result;
}

uint64_t sub_11B334(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x11B33CLL);
  }
  *(_BYTE *)unint64_t result = a2 + 4;
  return result;
}

uint64_t sub_11B340(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_11B348(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WellnessFeatureFlagsKey()
{
  return &type metadata for WellnessFeatureFlagsKey;
}

unint64_t sub_11B368()
{
  unint64_t result = qword_190480;
  if (!qword_190480)
  {
    unint64_t result = swift_getWitnessTable(&unk_13F3C8, &type metadata for WellnessFeatureFlagsKey);
    atomic_store(result, (unint64_t *)&qword_190480);
  }

  return result;
}

const char *sub_11B3A4()
{
  return "SiriWellness";
}

uint64_t sub_11B3B8(unsigned __int8 a1)
{
  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_11B3E4 + 4 * byte_13F32A[a1]))( "wellness_scribe",  15LL);
}

const char *sub_11B3E4()
{
  return "wellness_medications";
}

uint64_t sub_11B428()
{
  return sub_11B3B8(*v0);
}

ValueMetadata *type metadata accessor for WellnessFeatureFlags()
{
  return &type metadata for WellnessFeatureFlags;
}

uint64_t sub_11B454()
{
  return swift_allocObject(v0, 16LL, 7LL);
}

uint64_t sub_11B464(uint64_t a1)
{
  uint64_t v2 = (int *)type metadata accessor for MainFlow(0LL);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for Parse(0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(v4, a1, v5);
  sub_84784((uint64_t *)&v4[v2[5]]);
  uint64_t v6 = (uint64_t *)&v4[v2[6]];
  v6[3] = (uint64_t)&type metadata for WellnessCATProvider;
  v6[4] = (uint64_t)&off_182110;
  uint64_t v7 = swift_allocObject(&unk_181DC0, 48LL, 7LL);
  *uint64_t v6 = v7;
  *(_OWORD *)(v7 + 16) = 0u;
  *(_OWORD *)(v7 + 32) = 0u;
  sub_84788((uint64_t *)&v4[v2[7]]);
  sub_11B60C();
  uint64_t v8 = Flow.eraseToAnyFlow()(v2);
  sub_11B64C((uint64_t)v4);
  return v8;
}

uint64_t sub_11B558()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for WellnessFlowPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC18WellnessFlowPlugin18WellnessFlowPlugin);
}

uint64_t sub_11B588@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_11B454();
  *a1 = result;
  return result;
}

uint64_t sub_11B5B8(uint64_t a1)
{
  return sub_11B464(a1);
}

uint64_t sub_11B5D0()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

unint64_t sub_11B60C()
{
  unint64_t result = qword_18D650;
  if (!qword_18D650)
  {
    uint64_t v1 = type metadata accessor for MainFlow(255LL);
    unint64_t result = swift_getWitnessTable(&unk_13BA50, v1);
    atomic_store(result, (unint64_t *)&qword_18D650);
  }

  return result;
}

uint64_t sub_11B64C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MainFlow(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for UnsupportedDeviceFlow()
{
  return &type metadata for UnsupportedDeviceFlow;
}

uint64_t sub_11B698(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_89318();
  return Flow.deferToExecuteAsync(_:)(a1, a2, &type metadata for UnsupportedDeviceFlow, v4);
}

uint64_t sub_11B6D8(uint64_t a1)
{
  void v2[5] = a1;
  v2[6] = v1;
  uint64_t v3 = type metadata accessor for Logger(0LL);
  v2[7] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[8] = v4;
  v2[9] = sub_A5C0(v4);
  uint64_t v5 = type metadata accessor for DialogPhase(0LL);
  v2[10] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v2[11] = v6;
  unint64_t v7 = (*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[12] = swift_task_alloc(v7);
  v2[13] = swift_task_alloc(v7);
  uint64_t v8 = type metadata accessor for OutputGenerationManifest(0LL);
  v2[14] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v2[15] = v9;
  v2[16] = sub_A5C0(v9);
  return swift_task_switch(sub_11B780, 0LL, 0LL);
}

uint64_t sub_11B780()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_18CCFC);
  *(void *)(v0 + 136) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_11B7D8;
  return sub_76674();
}

uint64_t sub_11B7D8(uint64_t a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc(*(void *)(*v2 + 136));
  if (v1)
  {
    swift_errorRelease(v1);
    uint64_t v5 = sub_11B850;
  }

  else
  {
    *(void *)(v4 + 144) = a1;
    uint64_t v5 = sub_23548;
  }

  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_11B850(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v4 = *(void *)(v1 + 56);
  uint64_t v5 = Logger.wellness.unsafeMutableAddressor(a1);
  swift_beginAccess(v5, v1 + 16, 0LL, 0LL);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  unint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_0, v7, v8, "Failed to get unsupportedDevice pattern result", v9, 2u);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  uint64_t v11 = *(void *)(v1 + 64);
  uint64_t v10 = *(void *)(v1 + 72);
  uint64_t v12 = *(void *)(v1 + 56);

  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  static ExecuteResponse.complete()(v13);
  sub_23848();
  swift_task_dealloc(v7);
  swift_task_dealloc(v10);
  swift_task_dealloc(v12);
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_11B974(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_19053C);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_A108;
  return sub_11B6D8(a1);
}

uint64_t GenericButtonSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_11C7B8();
  return sub_11C064(a1, a2 + *(int *)(v4 + 20), type metadata accessor for GenericButtonModel);
}

uint64_t type metadata accessor for GenericButtonSnippet(uint64_t a1)
{
  uint64_t result = qword_1905A0;
  if (!qword_1905A0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for GenericButtonSnippet);
  }
  return result;
}

id sub_11BA3C()
{
  uint64_t v0 = type metadata accessor for UUID(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  sub_372F4();
  id v2 = [objc_allocWithZone(SAUIAppPunchOut) init];
  sub_11C7B8();
  uint64_t v3 = sub_F2A40();
  URL._bridgeToObjectiveC()((NSURL *)*(int *)(v3 + 20));
  uint64_t v5 = v4;
  [v2 setPunchOutUri:v4];

  id v6 = v2;
  uint64_t v7 = UUID.init()();
  uint64_t v8 = UUID.uuidString.getter(v7);
  uint64_t v10 = v9;
  sub_11C7D0(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_125B84(v8, v10, v6);

  return v6;
}

uint64_t GenericButtonSnippet.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1;
  v21[1] = a1;
  uint64_t v4 = type metadata accessor for RFButtonStyle(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  sub_372F4();
  uint64_t v6 = sub_11C7B8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_494C(&qword_189D38);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_11BF80(v3, (uint64_t)v9);
  uint64_t v14 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v15 = (v14 + 16) & ~v14;
  uint64_t v16 = swift_allocObject(&unk_181EE0, v15 + v8, v14 | 7);
  sub_11C064((uint64_t)v9, v16 + v15, type metadata accessor for GenericButtonSnippet);
  uint64_t v23 = v3;
  uint64_t v17 = Button.init(action:label:)( sub_11C0A8,  v16,  sub_11C14C,  v22,  &type metadata for Text,  &protocol witness table for Text);
  static PrimitiveButtonStyle<>.rfButton.getter(v17);
  unint64_t v18 = sub_11C154();
  unint64_t v19 = sub_11C198();
  View.buttonStyle<A>(_:)(v2, v10, v4, v18, v19);
  sub_11C7D0(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_11BCC4()
{
  uint64_t v0 = sub_494C(&qword_1905D8);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = sub_494C(&qword_1905E0);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_494C(&qword_1905E8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for ActionProperty(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_494C(&qword_1905F0);
  uint64_t v14 = swift_allocObject(v13, 72LL, 7LL);
  *(_OWORD *)(v14 + 16) = xmmword_137250;
  uint64_t v15 = type metadata accessor for Command(0LL);
  *(void *)(v14 + 56) = v15;
  *(void *)(v14 + 64) = &protocol witness table for Command;
  uint64_t v16 = sub_B76C((void *)(v14 + 32));
  void *v16 = sub_11BA3C();
  *((_BYTE *)v16 + 8) = 1;
  (*(void (**)(void *, void, uint64_t))(*(void *)(v15 - 8) + 104LL))( v16,  enum case for Command.aceCommand(_:),  v15);
  uint64_t v17 = ActionProperty.init(_:)(v14);
  ActionHandler.wrappedValue.getter(v17);
  uint64_t v18 = type metadata accessor for StandardActionHandler(0LL);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v8, 1LL, v18) == 1)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    return sub_11C78C((uint64_t)v8, &qword_1905E8);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v5, v12, v9);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v5, 0LL, 1LL, v9);
    uint64_t v20 = enum case for InteractionType.buttonTapped(_:);
    uint64_t v21 = type metadata accessor for InteractionType(0LL);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 104LL))(v2, v20, v21);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v2, 0LL, 1LL, v21);
    StandardActionHandler.perform(_:interactionType:)(v5, v2);
    sub_11C78C((uint64_t)v2, &qword_1905D8);
    sub_11C78C((uint64_t)v5, &qword_1905E0);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8LL))(v8, v18);
  }

uint64_t sub_11BF80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GenericButtonSnippet(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_11BFC4()
{
  uint64_t v1 = *(void *)(sub_11C7B8() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8LL))(v6, v7);
  swift_bridgeObjectRelease();
  sub_F2A40();
  uint64_t v8 = type metadata accessor for URL(0LL);
  sub_27A6C(v8);
  return swift_deallocObject(v0, v4, v5);
}

uint64_t sub_11C064(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_11C0A8()
{
  return sub_11BCC4();
}

uint64_t sub_11C0D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = (void *)(a1 + *(int *)(type metadata accessor for GenericButtonSnippet(0LL) + 20));
  uint64_t v4 = v3[1];
  v10[0] = *v3;
  v10[1] = v4;
  unint64_t v5 = sub_B6D8();
  swift_bridgeObjectRetain(v4);
  uint64_t result = Text.init<A>(_:)(v10, &type metadata for String, v5);
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v7;
  *(_BYTE *)(a2 + 16) = v8 & 1;
  *(void *)(a2 + 24) = v9;
  return result;
}

uint64_t sub_11C14C@<X0>(uint64_t a1@<X8>)
{
  return sub_11C0D0(*(void *)(v1 + 16), a1);
}

unint64_t sub_11C154()
{
  unint64_t result = qword_189D50;
  if (!qword_189D50)
  {
    uint64_t v1 = sub_B64C(&qword_189D38);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Button<A>, v1);
    atomic_store(result, (unint64_t *)&qword_189D50);
  }

  return result;
}

unint64_t sub_11C198()
{
  unint64_t result = qword_190540;
  if (!qword_190540)
  {
    uint64_t v1 = type metadata accessor for RFButtonStyle(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for RFButtonStyle, v1);
    atomic_store(result, (unint64_t *)&qword_190540);
  }

  return result;
}

uint64_t sub_11C1D8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2( a1,  &opaque type descriptor for <<opaque return type of GenericButtonSnippet.body>>,  1LL);
}

uint64_t *initializeBufferWithCopyOfBuffer for GenericButtonSnippet(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = type metadata accessor for ActionHandler(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(uint64_t *)((char *)a2 + v8);
    uint64_t v12 = *((void *)v10 + 1);
    *uint64_t v9 = v11;
    v9[1] = v12;
    uint64_t v13 = *(int *)(type metadata accessor for GenericButtonModel(0LL) + 20);
    uint64_t v14 = (char *)v9 + v13;
    uint64_t v15 = &v10[v13];
    uint64_t v16 = type metadata accessor for URL(0LL);
    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16LL);
    swift_bridgeObjectRetain(v12);
    v17(v14, v15, v16);
  }

  return a1;
}

uint64_t destroy for GenericButtonSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  uint64_t v6 = v5 + *(int *)(type metadata accessor for GenericButtonModel(0LL) + 20);
  uint64_t v7 = type metadata accessor for URL(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8LL))(v6, v7);
}

uint64_t initializeWithCopy for GenericButtonSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7 + 8);
  *uint64_t v8 = *(void *)(a2 + v7);
  v8[1] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for GenericButtonModel(0LL) + 20);
  uint64_t v12 = (char *)v8 + v11;
  uint64_t v13 = v9 + v11;
  uint64_t v14 = type metadata accessor for URL(0LL);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16LL);
  swift_bridgeObjectRetain(v10);
  v15(v12, v13, v14);
  return a1;
}

uint64_t assignWithCopy for GenericButtonSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  uint64_t v10 = v9[1];
  v8[1] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease();
  uint64_t v11 = *(int *)(type metadata accessor for GenericButtonModel(0LL) + 20);
  uint64_t v12 = (char *)v8 + v11;
  uint64_t v13 = (char *)v9 + v11;
  uint64_t v14 = type metadata accessor for URL(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 24LL))(v12, v13, v14);
  return a1;
}

uint64_t initializeWithTake for GenericButtonSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + v7) = *v9;
  uint64_t v10 = *(int *)(type metadata accessor for GenericButtonModel(0LL) + 20);
  uint64_t v11 = v8 + v10;
  uint64_t v12 = (char *)v9 + v10;
  uint64_t v13 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v13 - 8) + 32LL))(v11, v12, v13);
  return a1;
}

uint64_t assignWithTake for GenericButtonSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionHandler(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(int *)(type metadata accessor for GenericButtonModel(0LL) + 20);
  uint64_t v12 = (char *)v8 + v11;
  uint64_t v13 = (char *)v9 + v11;
  uint64_t v14 = type metadata accessor for URL(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 40LL))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for GenericButtonSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_11C5D8);
}

uint64_t sub_11C5D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_11C7C0();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)v3)
  {
    uint64_t v7 = v6;
    uint64_t v8 = v4;
  }

  else
  {
    uint64_t v7 = sub_F2A40();
    uint64_t v8 = v4 + *(int *)(a3 + 20);
  }

  return _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v8, v3, v7);
}

uint64_t storeEnumTagSinglePayload for GenericButtonSnippet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_11C63C);
}

uint64_t sub_11C63C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_11C7C0();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = v5;
  }

  else
  {
    uint64_t v9 = sub_F2A40();
    uint64_t v10 = v5 + *(int *)(a4 + 20);
  }

  return _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v10, v4, v4, v9);
}

uint64_t sub_11C69C(uint64_t a1)
{
  uint64_t result = type metadata accessor for ActionHandler(319LL);
  if (v3 <= 0x3F)
  {
    v5[0] = *(void *)(result - 8) + 64LL;
    uint64_t result = type metadata accessor for GenericButtonModel(319LL);
    if (v4 <= 0x3F)
    {
      v5[1] = *(void *)(result - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 2LL, v5, a1 + 16);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_11C720()
{
  v1[0] = sub_B64C(&qword_189D38);
  v1[1] = type metadata accessor for RFButtonStyle(255LL);
  v1[2] = sub_11C154();
  v1[3] = sub_11C198();
  return swift_getOpaqueTypeConformance2( v1,  &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>,  1LL);
}

uint64_t sub_11C78C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_494C(a2);
  sub_27A6C(v3);
  return a1;
}

uint64_t sub_11C7B8()
{
  return type metadata accessor for GenericButtonSnippet(0LL);
}

uint64_t sub_11C7C0()
{
  return type metadata accessor for ActionHandler(0LL);
}

uint64_t sub_11C7D0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

uint64_t CycleTrackingLogModel.init(date:loggedLabel:cycleTrackingType:snippetHeaderModel:url:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v17 = v16 - v15;
  uint64_t v37 = type metadata accessor for AppPunchout(0LL);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(a8, 1LL, 1LL, v37);
  uint64_t v18 = sub_11E9D4();
  unint64_t v19 = (int *)v18;
  uint64_t v20 = (uint64_t *)(a8 + *(int *)(v18 + 20));
  uint64_t *v20 = 0LL;
  v20[1] = 0LL;
  if (a1)
  {
    dispatch thunk of DialogCalendar.dateDescriptive.getter(v18);
    uint64_t v21 = type metadata accessor for SpeakableString(0LL);
    uint64_t v22 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v17, 1LL, v21);
    if ((_DWORD)v22 != 1)
    {
      SpeakableString.print.getter(v22);
      uint64_t v33 = a5;
      uint64_t v26 = v25;
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8LL))(v17, v21);
      unint64_t v27 = sub_B6D8();
      uint64_t v23 = StringProtocol.capitalized.getter(&type metadata for String, v27);
      uint64_t v24 = v28;
      uint64_t v29 = v26;
      a5 = v33;
      swift_bridgeObjectRelease(v29);
      goto LABEL_6;
    }

    sub_279E0(v17, &qword_189D00);
  }

  uint64_t v23 = 0LL;
  uint64_t v24 = 0LL;
LABEL_6:
  swift_bridgeObjectRelease(v20[1]);
  uint64_t *v20 = v23;
  v20[1] = v24;
  uint64_t v30 = (void *)(a8 + v19[6]);
  *uint64_t v30 = a2;
  v30[1] = a3;
  uint64_t v31 = (void *)(a8 + v19[7]);
  *uint64_t v31 = a4;
  v31[1] = a5;
  sub_A44C(a6, a8 + v19[8], &qword_18A1A8);
  sub_A44C(a7, a8 + v19[9], &qword_189CF8);
  sub_2521C(a7);
  swift_release();
  sub_279E0(a7, &qword_189CF8);
  sub_279E0(a6, &qword_18A1A8);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v8, 0LL, 1LL, v37);
  return sub_11CB9C(v8, a8);
}

uint64_t type metadata accessor for CycleTrackingLogModel(uint64_t a1)
{
  uint64_t result = qword_190668;
  if (!qword_190668) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CycleTrackingLogModel);
  }
  return result;
}

uint64_t CycleTrackingLogModel.appPunchout.setter(uint64_t a1)
{
  return sub_11CB9C(a1, v1);
}

void CycleTrackingLogModel.dateLabel.getter()
{
  uint64_t v0 = sub_11E9D4();
  sub_27A30(*(int *)(v0 + 20));
  sub_A890();
}

void CycleTrackingLogModel.dateLabel.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(sub_11E9D4() + 20));
  swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  sub_1EB0C();
}

uint64_t (*CycleTrackingLogModel.dateLabel.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

void CycleTrackingLogModel.loggedLabel.getter()
{
  uint64_t v0 = sub_11E9D4();
  sub_27A30(*(int *)(v0 + 24));
  sub_A890();
}

void CycleTrackingLogModel.cycleTrackingType.getter()
{
  uint64_t v0 = sub_11E9D4();
  sub_27A30(*(int *)(v0 + 28));
  sub_A890();
}

void CycleTrackingLogModel.snippetHeaderModel.getter(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_11E9D4();
  sub_A44C(v1 + *(int *)(v3 + 32), a1, &qword_18A1A8);
}

void CycleTrackingLogModel.url.getter(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_11E9D4();
  sub_A44C(v1 + *(int *)(v3 + 36), a1, &qword_189CF8);
}

uint64_t sub_11CB9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_494C(&qword_18A1A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_11CBE4(uint64_t a1, unint64_t a2)
{
  BOOL v3 = a1 == 0x68636E7550707061LL && a2 == 0xEB0000000074756FLL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x68636E7550707061LL, 0xEB0000000074756FLL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  BOOL v6 = a1 == 0x6562614C65746164LL && a2 == 0xE90000000000006CLL;
  if (v6
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6562614C65746164LL, 0xE90000000000006CLL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 1LL;
  }

  BOOL v7 = a1 == 0x614C646567676F6CLL && a2 == 0xEB000000006C6562LL;
  if (v7
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x614C646567676F6CLL, 0xEB000000006C6562LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 2LL;
  }

  if (a1 == 0xD000000000000011LL)
  {
    unint64_t v8 = 0x8000000000147D70LL;
    if (a2 == 0x8000000000147D70LL) {
      goto LABEL_23;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011LL, 0x8000000000147D70LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
LABEL_23:
    swift_bridgeObjectRelease(v8);
    return 3LL;
  }

  if (a1 == 0xD000000000000012LL && a2 == 0x8000000000141630LL)
  {
    unint64_t v9 = 0x8000000000141630LL;
LABEL_29:
    swift_bridgeObjectRelease(v9);
    return 4LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012LL, 0x8000000000141630LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v9 = a2;
    goto LABEL_29;
  }

  if (a1 == 7107189 && a2 == 0xE300000000000000LL)
  {
    swift_bridgeObjectRelease(a2);
    return 5LL;
  }

  else
  {
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)(7107189LL, 0xE300000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v11 & 1) != 0) {
      return 5LL;
    }
    else {
      return 6LL;
    }
  }

uint64_t sub_11CE4C()
{
  return 6LL;
}

uint64_t sub_11CE54(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_11CE8C + 4 * byte_13F5F0[a1]))( 0xD000000000000011LL,  0x8000000000147D70LL);
}

uint64_t sub_11CE8C()
{
  return 0x68636E7550707061LL;
}

uint64_t sub_11CEAC()
{
  return 0x6562614C65746164LL;
}

uint64_t sub_11CEC8()
{
  return 0x614C646567676F6CLL;
}

uint64_t sub_11CEE8(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_11CF00()
{
  return 7107189LL;
}

uint64_t sub_11CF10()
{
  return sub_11CE54(*v0);
}

uint64_t sub_11CF18@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_11CBE4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_11CF3C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_11CE4C();
  *a1 = result;
  return result;
}

uint64_t sub_11CF60(uint64_t a1)
{
  unint64_t v2 = sub_11D1DC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_11CF88(uint64_t a1)
{
  unint64_t v2 = sub_11D1DC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t CycleTrackingLogModel.encode(to:)(void *a1)
{
  uint64_t v4 = v1;
  uint64_t v6 = sub_494C(&qword_1905F8);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_27AD8();
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_500C(a1, v8);
  unint64_t v10 = sub_11D1DC();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for CycleTrackingLogModel.CodingKeys,  &type metadata for CycleTrackingLogModel.CodingKeys,  v10,  v8,  v9);
  char v32 = 0;
  uint64_t v11 = type metadata accessor for AppPunchout(0LL);
  sub_A410( &qword_18AA98,  (uint64_t (*)(uint64_t))&type metadata accessor for AppPunchout,  (uint64_t)&protocol conformance descriptor for AppPunchout);
  sub_5E21C(v4, (uint64_t)&v32, v6, v11);
  if (!v2)
  {
    uint64_t v12 = (int *)type metadata accessor for CycleTrackingLogModel(0LL);
    uint64_t v13 = (uint64_t *)(v4 + v12[5]);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    char v31 = 1;
    sub_27A10(v14, v15, (uint64_t)&v31);
    uint64_t v16 = (uint64_t *)(v4 + v12[6]);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    char v30 = 2;
    sub_27A10(v17, v18, (uint64_t)&v30);
    unint64_t v19 = (uint64_t *)(v4 + v12[7]);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    char v29 = 3;
    sub_27A10(v20, v21, (uint64_t)&v29);
    uint64_t v22 = v4 + v12[8];
    char v28 = 4;
    uint64_t v23 = type metadata accessor for SnippetHeaderModel(0LL);
    sub_A410( &qword_18AAA8,  type metadata accessor for SnippetHeaderModel,  (uint64_t)&protocol conformance descriptor for SnippetHeaderModel);
    sub_5E21C(v22, (uint64_t)&v28, v6, v23);
    uint64_t v24 = v4 + v12[9];
    char v27 = 5;
    uint64_t v25 = type metadata accessor for URL(0LL);
    sub_A410( &qword_18D668,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
    sub_5E21C(v24, (uint64_t)&v27, v6, v25);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v3, v6);
}

unint64_t sub_11D1DC()
{
  unint64_t result = qword_190600;
  if (!qword_190600)
  {
    unint64_t result = swift_getWitnessTable(&unk_13F7A4, &type metadata for CycleTrackingLogModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_190600);
  }

  return result;
}

void CycleTrackingLogModel.init(from:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = v7 - v6;
  sub_494C(&qword_18A1A8);
  sub_6D20();
  __chkstk_darwin(v8);
  sub_41C68();
  sub_494C(&qword_18A1A0);
  sub_6D20();
  __chkstk_darwin(v9);
  sub_6D44();
  uint64_t v12 = (int *)(v11 - v10);
  uint64_t v35 = sub_494C(&qword_190608);
  __chkstk_darwin(v35);
  sub_6D44();
  uint64_t v13 = type metadata accessor for CycleTrackingLogModel(0LL);
  sub_6D20();
  __chkstk_darwin(v14);
  sub_27AD8();
  uint64_t v15 = type metadata accessor for AppPunchout(0LL);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v2, 1LL, 1LL, v15);
  uint64_t v37 = (int *)v13;
  uint64_t v16 = (uint64_t *)(v2 + *(int *)(v13 + 20));
  uint64_t *v16 = 0LL;
  v16[1] = 0LL;
  uint64_t v39 = v16;
  uint64_t v18 = a1[3];
  uint64_t v17 = a1[4];
  uint64_t v36 = a1;
  unsigned int v19 = sub_500C(a1, v18);
  unint64_t v20 = sub_11D1DC();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for CycleTrackingLogModel.CodingKeys,  &type metadata for CycleTrackingLogModel.CodingKeys,  v20,  v18,  v17);
  if (!v38)
  {
    char v45 = 0;
    sub_A410( &qword_18AAB8,  (uint64_t (*)(uint64_t))&type metadata accessor for AppPunchout,  (uint64_t)&protocol conformance descriptor for AppPunchout);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v15, &v45, v35, v15);
    sub_11CB9C((uint64_t)v12, v2);
    char v44 = 1;
    uint64_t v22 = sub_11E9F4((uint64_t)&v44);
    uint64_t v24 = v23;
    swift_bridgeObjectRelease();
    *uint64_t v39 = v22;
    v39[1] = v24;
    char v43 = 2;
    uint64_t v25 = sub_11E9F4((uint64_t)&v43);
    uint64_t v26 = (uint64_t *)(v2 + v37[6]);
    uint64_t *v26 = v25;
    v26[1] = v27;
    char v42 = 3;
    uint64_t v28 = sub_11E9F4((uint64_t)&v42);
    char v29 = (uint64_t *)(v2 + v37[7]);
    uint64_t *v29 = v28;
    v29[1] = v30;
    type metadata accessor for SnippetHeaderModel(0LL);
    char v41 = 4;
    sub_A410( &qword_18AAC8,  type metadata accessor for SnippetHeaderModel,  (uint64_t)&protocol conformance descriptor for SnippetHeaderModel);
    sub_11E9DC(v31, (uint64_t)&v41);
    sub_A478(v3, v2 + v37[8], &qword_18A1A8);
    type metadata accessor for URL(0LL);
    char v40 = 5;
    sub_A410( &qword_18D678,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
    sub_11E9DC(v32, (uint64_t)&v40);
    sub_11EA00();
    sub_A478(v34, v2 + v37[9], &qword_189CF8);
    sub_11D64C(v2, a2);
    _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v36);
    sub_26F04(v2, type metadata accessor for CycleTrackingLogModel);
    return;
  }

  uint64_t v21 = (void *)sub_11EA10();
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v21);
  sub_279E0(v2, &qword_18A1A0);
  sub_DECF4((uint64_t)v39);
  if (!(_DWORD)v15)
  {
    if (!v19) {
      goto LABEL_5;
    }
LABEL_8:
    sub_DECF4(v2 + v12[7]);
    if (!(_DWORD)v17) {
      return;
    }
    goto LABEL_9;
  }

  sub_DECF4(v2 + v12[6]);
  if (v19) {
    goto LABEL_8;
  }
LABEL_5:
  if ((_DWORD)v17) {
LABEL_9:
  }
    sub_279E0(v2 + v12[8], &qword_18A1A8);
}

uint64_t sub_11D64C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CycleTrackingLogModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

void sub_11D690()
{
}

void sub_11D6BC()
{
}

void sub_11D6E8(void *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_11D6FC(void *a1)
{
  return CycleTrackingLogModel.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for CycleTrackingLogModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = type metadata accessor for AppPunchout(0LL);
    if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a2, 1LL, v7))
    {
      uint64_t v8 = sub_494C(&qword_18A1A0);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)a1, 0LL, 1LL, v7);
    }

    uint64_t v10 = a3[5];
    uint64_t v11 = a3[6];
    uint64_t v12 = (uint64_t *)((char *)a1 + v10);
    uint64_t v13 = (uint64_t *)((char *)a2 + v10);
    uint64_t v14 = v13[1];
    void *v12 = *v13;
    v12[1] = v14;
    uint64_t v15 = (uint64_t *)((char *)a1 + v11);
    uint64_t v16 = (uint64_t *)((char *)a2 + v11);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = a3[7];
    uint64_t v19 = a3[8];
    unint64_t v20 = (uint64_t *)((char *)a1 + v18);
    uint64_t v21 = (uint64_t *)((char *)a2 + v18);
    uint64_t v22 = v21[1];
    void *v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = (char *)a1 + v19;
    uint64_t v24 = (char *)a2 + v19;
    uint64_t v25 = type metadata accessor for SnippetHeaderModel(0LL);
    swift_bridgeObjectRetain(v14);
    swift_bridgeObjectRetain(v17);
    swift_bridgeObjectRetain(v22);
    if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v24, 1LL, v25))
    {
      uint64_t v26 = sub_494C(&qword_18A1A8);
      memcpy(v23, v24, *(void *)(*(void *)(v26 - 8) + 64LL));
    }

    else
    {
      uint64_t v27 = type metadata accessor for SpeakableString(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16LL))(v23, v24, v27);
      uint64_t v28 = *(int *)(v25 + 20);
      char v29 = &v23[v28];
      uint64_t v30 = &v24[v28];
      uint64_t v31 = *((void *)v30 + 1);
      *(void *)char v29 = *(void *)v30;
      *((void *)v29 + 1) = v31;
      uint64_t v32 = *(int *)(v25 + 24);
      uint64_t v33 = &v23[v32];
      uint64_t v34 = &v24[v32];
      uint64_t v35 = *((void *)v34 + 1);
      *(void *)uint64_t v33 = *(void *)v34;
      *((void *)v33 + 1) = v35;
      swift_bridgeObjectRetain(v31);
      swift_bridgeObjectRetain(v35);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v23, 0LL, 1LL, v25);
    }

    uint64_t v36 = a3[9];
    uint64_t v37 = (char *)a1 + v36;
    uint64_t v38 = (char *)a2 + v36;
    uint64_t v39 = type metadata accessor for URL(0LL);
    if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v38, 1LL, v39))
    {
      uint64_t v40 = sub_494C(&qword_189CF8);
      memcpy(v37, v38, *(void *)(*(void *)(v40 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 16LL))(v37, v38, v39);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v37, 0LL, 1LL, v39);
    }
  }

  return a1;
}

uint64_t destroy for CycleTrackingLogModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppPunchout(0LL);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 32);
  uint64_t v6 = type metadata accessor for SnippetHeaderModel(0LL);
  if (!_s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v5, 1LL, v6))
  {
    uint64_t v7 = type metadata accessor for SpeakableString(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8LL))(v5, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  uint64_t v8 = a1 + *(int *)(a2 + 36);
  uint64_t v9 = type metadata accessor for URL(0LL);
  uint64_t result = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v8, 1LL, v9);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8LL))(v8, v9);
  }
  return result;
}

char *initializeWithCopy for CycleTrackingLogModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AppPunchout(0LL);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a2, 1LL, v6))
  {
    uint64_t v7 = sub_494C(&qword_18A1A0);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)a1, 0LL, 1LL, v6);
  }

  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v8];
  uint64_t v11 = &a2[v8];
  uint64_t v12 = *((void *)v11 + 1);
  *(void *)uint64_t v10 = *(void *)v11;
  *((void *)v10 + 1) = v12;
  uint64_t v13 = &a1[v9];
  uint64_t v14 = &a2[v9];
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = v15;
  uint64_t v16 = a3[7];
  uint64_t v17 = a3[8];
  uint64_t v18 = &a1[v16];
  uint64_t v19 = &a2[v16];
  uint64_t v20 = *((void *)v19 + 1);
  *(void *)uint64_t v18 = *(void *)v19;
  *((void *)v18 + 1) = v20;
  uint64_t v21 = &a1[v17];
  uint64_t v22 = &a2[v17];
  uint64_t v23 = type metadata accessor for SnippetHeaderModel(0LL);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRetain(v20);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v22, 1LL, v23))
  {
    uint64_t v24 = sub_494C(&qword_18A1A8);
    memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64LL));
  }

  else
  {
    uint64_t v25 = type metadata accessor for SpeakableString(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16LL))(v21, v22, v25);
    uint64_t v26 = *(int *)(v23 + 20);
    uint64_t v27 = &v21[v26];
    uint64_t v28 = &v22[v26];
    uint64_t v29 = *((void *)v28 + 1);
    *(void *)uint64_t v27 = *(void *)v28;
    *((void *)v27 + 1) = v29;
    uint64_t v30 = *(int *)(v23 + 24);
    uint64_t v31 = &v21[v30];
    uint64_t v32 = &v22[v30];
    uint64_t v33 = *((void *)v32 + 1);
    *(void *)uint64_t v31 = *(void *)v32;
    *((void *)v31 + 1) = v33;
    swift_bridgeObjectRetain(v29);
    swift_bridgeObjectRetain(v33);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v21, 0LL, 1LL, v23);
  }

  uint64_t v34 = a3[9];
  uint64_t v35 = &a1[v34];
  uint64_t v36 = &a2[v34];
  uint64_t v37 = type metadata accessor for URL(0LL);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v36, 1LL, v37))
  {
    uint64_t v38 = sub_494C(&qword_189CF8);
    memcpy(v35, v36, *(void *)(*(void *)(v38 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16LL))(v35, v36, v37);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v35, 0LL, 1LL, v37);
  }

  return a1;
}

char *assignWithCopy for CycleTrackingLogModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AppPunchout(0LL);
  int v7 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a1, 1LL, v6);
  int v8 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a2, 1LL, v6);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)a1, 0LL, 1LL, v6);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = sub_494C(&qword_18A1A0);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = a3[5];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  *(void *)uint64_t v12 = *(void *)v13;
  uint64_t v14 = *((void *)v13 + 1);
  *((void *)v12 + 1) = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  *(void *)uint64_t v16 = *(void *)v17;
  uint64_t v18 = *((void *)v17 + 1);
  *((void *)v16 + 1) = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[7];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  *(void *)uint64_t v20 = *(void *)v21;
  uint64_t v22 = *((void *)v21 + 1);
  *((void *)v20 + 1) = v22;
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[8];
  uint64_t v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  uint64_t v26 = type metadata accessor for SnippetHeaderModel(0LL);
  int v27 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v24, 1LL, v26);
  int v28 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v25, 1LL, v26);
  if (v27)
  {
    if (!v28)
    {
      uint64_t v29 = type metadata accessor for SpeakableString(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16LL))(v24, v25, v29);
      uint64_t v30 = *(int *)(v26 + 20);
      uint64_t v31 = &v24[v30];
      uint64_t v32 = &v25[v30];
      *(void *)uint64_t v31 = *(void *)v32;
      uint64_t v33 = *((void *)v32 + 1);
      *((void *)v31 + 1) = v33;
      uint64_t v34 = *(int *)(v26 + 24);
      uint64_t v35 = &v24[v34];
      uint64_t v36 = &v25[v34];
      *(void *)uint64_t v35 = *(void *)v36;
      uint64_t v37 = *((void *)v36 + 1);
      *((void *)v35 + 1) = v37;
      swift_bridgeObjectRetain(v33);
      swift_bridgeObjectRetain(v37);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v24, 0LL, 1LL, v26);
      goto LABEL_13;
    }

    goto LABEL_12;
  }

  if (v28)
  {
    sub_26F04((uint64_t)v24, type metadata accessor for SnippetHeaderModel);
LABEL_12:
    uint64_t v38 = sub_494C(&qword_18A1A8);
    memcpy(v24, v25, *(void *)(*(void *)(v38 - 8) + 64LL));
    goto LABEL_13;
  }

  uint64_t v48 = type metadata accessor for SpeakableString(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 24LL))(v24, v25, v48);
  uint64_t v49 = *(int *)(v26 + 20);
  uint64_t v50 = &v24[v49];
  uint64_t v51 = &v25[v49];
  *(void *)uint64_t v50 = *(void *)v51;
  uint64_t v52 = *((void *)v51 + 1);
  *((void *)v50 + 1) = v52;
  swift_bridgeObjectRetain(v52);
  swift_bridgeObjectRelease();
  uint64_t v53 = *(int *)(v26 + 24);
  uint64_t v54 = &v24[v53];
  unsigned __int16 v55 = &v25[v53];
  *(void *)uint64_t v54 = *(void *)v55;
  uint64_t v56 = *((void *)v55 + 1);
  *((void *)v54 + 1) = v56;
  swift_bridgeObjectRetain(v56);
  swift_bridgeObjectRelease();
LABEL_13:
  uint64_t v39 = a3[9];
  uint64_t v40 = &a1[v39];
  char v41 = &a2[v39];
  uint64_t v42 = type metadata accessor for URL(0LL);
  int v43 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v40, 1LL, v42);
  int v44 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v41, 1LL, v42);
  if (!v43)
  {
    uint64_t v45 = *(void *)(v42 - 8);
    if (!v44)
    {
      (*(void (**)(char *, char *, uint64_t))(v45 + 24))(v40, v41, v42);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v45 + 8))(v40, v42);
    goto LABEL_18;
  }

  if (v44)
  {
LABEL_18:
    uint64_t v46 = sub_494C(&qword_189CF8);
    memcpy(v40, v41, *(void *)(*(void *)(v46 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16LL))(v40, v41, v42);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v40, 0LL, 1LL, v42);
  return a1;
}

char *initializeWithTake for CycleTrackingLogModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AppPunchout(0LL);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a2, 1LL, v6))
  {
    uint64_t v7 = sub_494C(&qword_18A1A0);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)a1, 0LL, 1LL, v6);
  }

  uint64_t v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  uint64_t v9 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = type metadata accessor for SnippetHeaderModel(0LL);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v11, 1LL, v12))
  {
    uint64_t v13 = sub_494C(&qword_18A1A8);
    memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64LL));
  }

  else
  {
    uint64_t v14 = type metadata accessor for SpeakableString(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32LL))(v10, v11, v14);
    *(_OWORD *)&v10[*(int *)(v12 + 20)] = *(_OWORD *)&v11[*(int *)(v12 + 20)];
    *(_OWORD *)&v10[*(int *)(v12 + 24)] = *(_OWORD *)&v11[*(int *)(v12 + 24)];
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v10, 0LL, 1LL, v12);
  }

  uint64_t v15 = a3[9];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  uint64_t v18 = type metadata accessor for URL(0LL);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v17, 1LL, v18))
  {
    uint64_t v19 = sub_494C(&qword_189CF8);
    memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32LL))(v16, v17, v18);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v16, 0LL, 1LL, v18);
  }

  return a1;
}

char *assignWithTake for CycleTrackingLogModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AppPunchout(0LL);
  int v7 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a1, 1LL, v6);
  int v8 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a2, 1LL, v6);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)a1, 0LL, 1LL, v6);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = sub_494C(&qword_18A1A0);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = a3[5];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v15 = *(void *)v13;
  uint64_t v14 = *((void *)v13 + 1);
  *(void *)uint64_t v12 = v15;
  *((void *)v12 + 1) = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[6];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v20 = *(void *)v18;
  uint64_t v19 = *((void *)v18 + 1);
  *(void *)uint64_t v17 = v20;
  *((void *)v17 + 1) = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[7];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  uint64_t v25 = *(void *)v23;
  uint64_t v24 = *((void *)v23 + 1);
  *(void *)uint64_t v22 = v25;
  *((void *)v22 + 1) = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = a3[8];
  int v27 = &a1[v26];
  int v28 = &a2[v26];
  uint64_t v29 = type metadata accessor for SnippetHeaderModel(0LL);
  int v30 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v27, 1LL, v29);
  int v31 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v28, 1LL, v29);
  if (v30)
  {
    if (!v31)
    {
      uint64_t v32 = type metadata accessor for SpeakableString(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32LL))(v27, v28, v32);
      *(_OWORD *)&v27[*(int *)(v29 + 20)] = *(_OWORD *)&v28[*(int *)(v29 + 20)];
      *(_OWORD *)&v27[*(int *)(v29 + 24)] = *(_OWORD *)&v28[*(int *)(v29 + 24)];
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v27, 0LL, 1LL, v29);
      goto LABEL_13;
    }

    goto LABEL_12;
  }

  if (v31)
  {
    sub_26F04((uint64_t)v27, type metadata accessor for SnippetHeaderModel);
LABEL_12:
    uint64_t v33 = sub_494C(&qword_18A1A8);
    memcpy(v27, v28, *(void *)(*(void *)(v33 - 8) + 64LL));
    goto LABEL_13;
  }

  uint64_t v43 = type metadata accessor for SpeakableString(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 40LL))(v27, v28, v43);
  uint64_t v44 = *(int *)(v29 + 20);
  uint64_t v45 = &v27[v44];
  uint64_t v46 = &v28[v44];
  uint64_t v48 = *(void *)v46;
  uint64_t v47 = *((void *)v46 + 1);
  *(void *)uint64_t v45 = v48;
  *((void *)v45 + 1) = v47;
  swift_bridgeObjectRelease();
  uint64_t v49 = *(int *)(v29 + 24);
  uint64_t v50 = &v27[v49];
  uint64_t v51 = &v28[v49];
  uint64_t v53 = *(void *)v51;
  uint64_t v52 = *((void *)v51 + 1);
  *(void *)uint64_t v50 = v53;
  *((void *)v50 + 1) = v52;
  swift_bridgeObjectRelease();
LABEL_13:
  uint64_t v34 = a3[9];
  uint64_t v35 = &a1[v34];
  uint64_t v36 = &a2[v34];
  uint64_t v37 = type metadata accessor for URL(0LL);
  int v38 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v35, 1LL, v37);
  int v39 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v36, 1LL, v37);
  if (!v38)
  {
    uint64_t v40 = *(void *)(v37 - 8);
    if (!v39)
    {
      (*(void (**)(char *, char *, uint64_t))(v40 + 40))(v35, v36, v37);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v40 + 8))(v35, v37);
    goto LABEL_18;
  }

  if (v39)
  {
LABEL_18:
    uint64_t v41 = sub_494C(&qword_189CF8);
    memcpy(v35, v36, *(void *)(*(void *)(v41 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 32LL))(v35, v36, v37);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v35, 0LL, 1LL, v37);
  return a1;
}

uint64_t getEnumTagSinglePayload for CycleTrackingLogModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_11E5B0);
}

uint64_t sub_11E5B0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_494C(&qword_18A1A0);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = a1;
    return _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v8, a2, v7);
  }

  if ((_DWORD)a2 != 2147483646)
  {
    uint64_t v12 = sub_494C(&qword_18A1A8);
    if (*(_DWORD *)(*(void *)(v12 - 8) + 84LL) == (_DWORD)a2)
    {
      uint64_t v7 = v12;
      uint64_t v13 = a3[8];
    }

    else
    {
      uint64_t v7 = sub_494C(&qword_189CF8);
      uint64_t v13 = a3[9];
    }

    uint64_t v8 = a1 + v13;
    return _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v8, a2, v7);
  }

  unint64_t v9 = *(void *)(a1 + a3[5] + 8);
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  int v10 = v9 - 1;
  if (v10 < 0) {
    int v10 = -1;
  }
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for CycleTrackingLogModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_11E698);
}

void sub_11E698(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_494C(&qword_18A1A0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = a1;
  }

  else
  {
    if (a3 == 2147483646)
    {
      *(void *)(a1 + a4[5] + 8) = a2;
      sub_1EB0C();
      return;
    }

    uint64_t v11 = sub_494C(&qword_18A1A8);
    if (*(_DWORD *)(*(void *)(v11 - 8) + 84LL) == a3)
    {
      uint64_t v9 = v11;
      uint64_t v12 = a4[8];
    }

    else
    {
      uint64_t v9 = sub_494C(&qword_189CF8);
      uint64_t v12 = a4[9];
    }

    uint64_t v10 = a1 + v12;
  }

  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v10, a2, a2, v9);
}

void sub_11E75C(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v8[0] = *(void *)(v2 - 8) + 64LL;
    v8[1] = &unk_13F6C8;
    v8[2] = &unk_13F6C8;
    v8[3] = &unk_13F6C8;
    sub_27758(319LL, (unint64_t *)&qword_18AB48, type metadata accessor for SnippetHeaderModel);
    if (v5 <= 0x3F)
    {
      v8[4] = *(void *)(v4 - 8) + 64LL;
      sub_27758( 319LL,  (unint64_t *)&unk_18D6E8,  (uint64_t (*)(uint64_t))&type metadata accessor for URL);
      if (v7 <= 0x3F)
      {
        v8[5] = *(void *)(v6 - 8) + 64LL;
        swift_initStructMetadata(a1, 256LL, 6LL, v8, a1 + 16);
      }
    }
  }

uint64_t storeEnumTagSinglePayload for CycleTrackingLogModel.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFA) {
    return ((uint64_t (*)(void))((char *)&loc_11E884 + 4 * byte_13F5FB[v4]))();
  }
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_11E8B8 + 4 * byte_13F5F6[v4]))();
}

uint64_t sub_11E8B8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_11E8C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x11E8C8LL);
  }
  return result;
}

uint64_t sub_11E8D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x11E8DCLL);
  }
  *(_BYTE *)uint64_t result = a2 + 5;
  return result;
}

uint64_t sub_11E8E0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_11E8E8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CycleTrackingLogModel.CodingKeys()
{
  return &type metadata for CycleTrackingLogModel.CodingKeys;
}

unint64_t sub_11E908()
{
  unint64_t result = qword_1906B0;
  if (!qword_1906B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_13F77C, &type metadata for CycleTrackingLogModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1906B0);
  }

  return result;
}

unint64_t sub_11E948()
{
  unint64_t result = qword_1906B8;
  if (!qword_1906B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_13F6EC, &type metadata for CycleTrackingLogModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1906B8);
  }

  return result;
}

unint64_t sub_11E988()
{
  unint64_t result = qword_1906C0[0];
  if (!qword_1906C0[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_13F714, &type metadata for CycleTrackingLogModel.CodingKeys);
    atomic_store(result, qword_1906C0);
  }

  return result;
}

uint64_t sub_11E9C4()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t sub_11E9D4()
{
  return type metadata accessor for CycleTrackingLogModel(0LL);
}

uint64_t sub_11E9DC(uint64_t a1, uint64_t a2)
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v2, a2, v3, v2);
}

uint64_t sub_11E9F4(uint64_t a1)
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)(a1, v1);
}

uint64_t sub_11EA00()
{
  return (*(uint64_t (**)(uint64_t, void))(v1 + 8))(v0, *(void *)(v2 - 128));
}

uint64_t sub_11EA10()
{
  return *(void *)(v0 - 120);
}

uint64_t destroy for WellnessCATProvider(void *a1)
{
  return swift_release(a1[3]);
}

uint64_t *initializeWithCopy for WellnessCATProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  a1[2] = v5;
  a1[3] = v6;
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  return a1;
}

uint64_t *assignWithCopy for WellnessCATProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  uint64_t v6 = a1[1];
  uint64_t v7 = a2[1];
  a1[1] = v7;
  swift_retain(v7);
  swift_release(v6);
  uint64_t v8 = a1[2];
  uint64_t v9 = a2[2];
  a1[2] = v9;
  swift_retain(v9);
  swift_release(v8);
  uint64_t v10 = a1[3];
  uint64_t v11 = a2[3];
  a1[3] = v11;
  swift_retain(v11);
  swift_release(v10);
  return a1;
}

__n128 initializeWithTake for WellnessCATProvider(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for WellnessCATProvider(void *a1, _OWORD *a2)
{
  uint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_release(v4);
  swift_release(a1[2]);
  uint64_t v5 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  swift_release(v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for WellnessCATProvider(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 32))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }

    else
    {
      uint64_t v3 = *a1;
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }

  else
  {
    int v2 = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WellnessCATProvider(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 32) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for WellnessCATProvider()
{
  return &type metadata for WellnessCATProvider;
}

void sub_11EC54(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CATOption(0LL);
  __chkstk_darwin(v2);
  sub_41C50();
  if (!a1)
  {
    type metadata accessor for WellnessCATs(0LL);
    sub_11ED44();
    sub_11ED34();
  }

  swift_retain();
  sub_1EB0C();
}

void sub_11ECC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = type metadata accessor for CATOption(0LL);
  __chkstk_darwin(v5);
  sub_41C50();
  if (!a4)
  {
    type metadata accessor for WellnessUnsupportedCATs(0LL);
    sub_11ED44();
    sub_11ED34();
  }

  swift_retain();
  sub_1EB0C();
}

uint64_t sub_11ED34()
{
  return CATWrapper.__allocating_init(options:globals:)(v0, 0LL);
}

uint64_t sub_11ED44()
{
  return static CATOption.defaultMode.getter();
}

uint64_t destroy for InvalidUnitsFlow(uint64_t a1)
{
  return swift_release();
}

uint64_t initializeWithCopy for InvalidUnitsFlow(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  __int128 v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 8, a2 + 8);
  __int128 v5 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 72) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 48, a2 + 48);
  uint64_t v6 = *(void *)(a2 + 88);
  uint64_t v7 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = v6;
  *(void *)(a1 + 96) = v7;
  swift_retain(v6);
  swift_retain(v7);
  return a1;
}

uint64_t assignWithCopy for InvalidUnitsFlow(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  sub_7030((void *)(a1 + 8), (void *)(a2 + 8));
  sub_7030((void *)(a1 + 48), (void *)(a2 + 48));
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_retain();
  swift_release();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_retain();
  swift_release();
  return a1;
}

void *initializeWithTake for InvalidUnitsFlow(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x68uLL);
}

uint64_t assignWithTake for InvalidUnitsFlow(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0((void *)(a1 + 8));
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0((void *)(a1 + 48));
  __int128 v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  uint64_t v5 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v5;
  swift_release();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for InvalidUnitsFlow(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 104))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 32);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InvalidUnitsFlow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 104) = 1;
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

    *(_BYTE *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for InvalidUnitsFlow()
{
  return &type metadata for InvalidUnitsFlow;
}

uint64_t sub_11EF9C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_7DCBC();
  return Flow.deferToExecuteAsync(_:)(a1, a2, &type metadata for InvalidUnitsFlow, v4);
}

uint64_t sub_11EFDC(uint64_t a1)
{
  v2[40] = a1;
  v2[41] = v1;
  uint64_t v3 = type metadata accessor for GenericButtonModel(0LL);
  v2[42] = v3;
  v2[43] = sub_A5C0(*(void *)(v3 - 8));
  uint64_t v4 = sub_494C(&qword_189BA0);
  v2[44] = sub_A5C0(*(void *)(v4 - 8));
  uint64_t v5 = sub_494C(&qword_189CF8);
  v2[45] = sub_A5C0(*(void *)(v5 - 8));
  uint64_t v6 = type metadata accessor for URL(0LL);
  v2[46] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[47] = v7;
  v2[48] = sub_A5C0(v7);
  uint64_t v8 = type metadata accessor for DialogPhase(0LL);
  v2[49] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v2[50] = v9;
  unint64_t v10 = (*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[51] = swift_task_alloc(v10);
  v2[52] = swift_task_alloc(v10);
  uint64_t v11 = type metadata accessor for OutputGenerationManifest(0LL);
  v2[53] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v2[54] = v12;
  v2[55] = sub_A5C0(v12);
  uint64_t v13 = sub_494C(&qword_189D00);
  v2[56] = sub_A5C0(*(void *)(v13 - 8));
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_11F0D8()
{
  uint64_t v1 = *(void *)(v0 + 448);
  uint64_t v2 = sub_27CC8(**(_BYTE **)(v0 + 328));
  String.toSpeakableString.getter(v2, v3);
  swift_bridgeObjectRelease();
  uint64_t v4 = type metadata accessor for SpeakableString(0LL);
  sub_A66C(v1, 0LL, v5, v4);
  uint64_t v6 = (void *)swift_task_alloc(dword_190BE4);
  *(void *)(v0 + 456) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_11F16C;
  return sub_131508(*(void *)(v0 + 448));
}

uint64_t sub_11F16C(uint64_t a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc(*(void *)(*v2 + 456));
  uint64_t v5 = *(void *)(v4 + 448);
  if (v1) {
    swift_errorRelease(v1);
  }
  else {
    *(void *)(v4 + 464) = a1;
  }
  sub_2012C(v5, &qword_189D00);
  sub_A964();
  return sub_D954();
}

uint64_t sub_11F200( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = (void *)v8[58];
  v8[59] = v9;
  uint64_t v11 = v8[51];
  uint64_t v10 = v8[52];
  uint64_t v12 = v8[49];
  uint64_t v13 = v8[50];
  static DialogPhase.completion.getter(a1, a2, a3, a4, a5, a6, a7, a8);
  sub_81CCC(v11, v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16));
  OutputGenerationManifest.init(dialogPhase:_:)(v11, sub_A633C, 0LL);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v10, v12);
  OutputGenerationManifest.printSupportingDialogInDisplayModes.setter(1LL);
  if (v9)
  {
    id v14 = [v9 catId];
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    uint64_t v17 = v16;
  }

  else
  {
    uint64_t v15 = 0LL;
    uint64_t v17 = 0LL;
  }

  uint64_t v19 = v8[45];
  uint64_t v18 = v8[46];
  uint64_t v20 = v8[44];
  uint64_t v21 = (unsigned __int8 *)v8[41];
  OutputGenerationManifest.responseViewId.setter(v15, v17);
  uint64_t v22 = *v21;
  uint64_t v23 = type metadata accessor for DateInterval(0LL);
  sub_A66C(v20, 1LL, v24, v23);
  sub_F4F10(v22, v20);
  sub_2012C(v20, &qword_189BA0);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v19, 1LL, v18) == 1)
  {
    sub_2012C(v8[45], &qword_189CF8);
LABEL_6:
    sub_11FD78();
    uint64_t v25 = v8[18];
    sub_500C((void *)v22, v25);
    uint64_t v26 = sub_494C(&qword_18A460);
    uint64_t result = sub_80BF8(v26);
    *(_OWORD *)(result + 16) = xmmword_138BA0;
    if (v9)
    {
      sub_11FD8C(result, v28, v29);
      v8[62] = v57;
      uint64_t v30 = async function pointer to dispatch thunk of ResponseGenerating.makeResponseOutput(dialog:outputGenerationManifest:)[1];
      id v31 = v9;
      uint64_t v32 = (void *)swift_task_alloc(v30);
      v8[63] = v32;
      *uint64_t v32 = v8;
      v32[1] = sub_11F724;
      return dispatch thunk of ResponseGenerating.makeResponseOutput(dialog:outputGenerationManifest:)( v8[40],  v57,  v8[55],  v25);
    }

    __break(1u);
    goto LABEL_15;
  }

  uint64_t v33 = v8[41];
  (*(void (**)(void, void, void))(v8[47] + 32LL))(v8[48], v8[45], v8[46]);
  sub_500C((void *)(v33 + 8), *(void *)(v33 + 32));
  sub_DD4CC();
  uint64_t v34 = v8[23];
  uint64_t v35 = v8[24];
  sub_500C(v8 + 20, v34);
  char v36 = dispatch thunk of DeviceState.isPhone.getter(v34, v35);
  sub_11FCDC(v33, (uint64_t)(v8 + 2));
  if ((v36 & 1) != 0)
  {
    sub_7DCF8((uint64_t)(v8 + 2));
    _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v8 + 20);
  }

  else
  {
    sub_500C(v8 + 3, v8[6]);
    sub_DD4CC();
    uint64_t v37 = v8[28];
    uint64_t v38 = v8[29];
    sub_500C(v8 + 25, v37);
    uint64_t v22 = dispatch thunk of DeviceState.isPad.getter(v37, v38);
    _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v8 + 25);
    sub_7DCF8((uint64_t)(v8 + 2));
    _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v8 + 20);
    if ((v22 & 1) == 0)
    {
      sub_11FD9C();
      goto LABEL_6;
    }
  }

  uint64_t v39 = v8[47];
  uint64_t v55 = v8[48];
  uint64_t v56 = v9;
  uint64_t v41 = v8[42];
  uint64_t v40 = (uint64_t *)v8[43];
  uint64_t v42 = v8[41];
  uint64_t v43 = sub_11FD10();
  uint64_t v45 = v44;
  sub_81CCC((uint64_t)v40 + *(int *)(v41 + 20), v55, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 16));
  uint64_t *v40 = v43;
  v40[1] = v45;
  sub_D7EC(v42 + 48, (uint64_t)(v8 + 30));
  uint64_t v46 = v8[33];
  sub_500C(v8 + 30, v46);
  uint64_t v47 = type metadata accessor for WellnessSnippets(0LL);
  v8[38] = v47;
  v8[39] = sub_20168();
  uint64_t v48 = sub_B76C(v8 + 35);
  sub_201A8((uint64_t)v40, (uint64_t)v48);
  swift_storeEnumTagMultiPayload(v48, v47, 4LL);
  uint64_t v49 = sub_494C(&qword_18A460);
  uint64_t result = sub_80BF8(v49);
  *(_OWORD *)(result + 16) = xmmword_138BA0;
  if (v56)
  {
    sub_11FD8C(result, v50, v51);
    v8[60] = v57;
    uint64_t v52 = async function pointer to dispatch thunk of ResponseGenerating.makeResponseOutput(conversationModel:dialog:outputGenerationManifest:)[1];
    id v53 = v56;
    uint64_t v54 = (void *)swift_task_alloc(v52);
    v8[61] = v54;
    void *v54 = v8;
    v54[1] = sub_11F61C;
    return dispatch thunk of ResponseGenerating.makeResponseOutput(conversationModel:dialog:outputGenerationManifest:)( v8[40],  v8 + 35,  v57,  v8[55],  v46);
  }

uint64_t sub_11F61C()
{
  uint64_t v1 = (void *)(v0 + 280);
  sub_20264(*(void *)(v0 + 488));
  swift_bridgeObjectRelease();
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v1);
  sub_A964();
  return sub_D954();
}

uint64_t sub_11F668()
{
  uint64_t v2 = *(void *)(v0 + 432);
  uint64_t v1 = *(void *)(v0 + 440);
  uint64_t v3 = *(void *)(v0 + 424);
  uint64_t v5 = *(void *)(v0 + 376);
  uint64_t v4 = *(void *)(v0 + 384);
  uint64_t v6 = *(void *)(v0 + 368);
  uint64_t v7 = *(void *)(v0 + 344);

  sub_201EC(v7);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  sub_202F4(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_11FD50();
  swift_task_dealloc(v0 + 240);
  swift_task_dealloc(v1);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_11F724()
{
  return sub_A5D0();
}

uint64_t sub_11F760()
{
  uint64_t v5 = *(void *)(v0 + 432);
  uint64_t v4 = *(void *)(v0 + 440);
  uint64_t v6 = *(void *)(v0 + 424);

  sub_202F4(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  sub_11FD50();
  swift_task_dealloc(v0 + 120);
  swift_task_dealloc(v4);
  swift_task_dealloc(v6);
  swift_task_dealloc(v5);
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_11F7F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[59] = 0LL;
  uint64_t v10 = v8[51];
  uint64_t v9 = v8[52];
  uint64_t v11 = v8[49];
  uint64_t v12 = v8[50];
  static DialogPhase.completion.getter(a1, a2, a3, a4, a5, a6, a7, a8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, v9, v11);
  OutputGenerationManifest.init(dialogPhase:_:)(v10, sub_A633C, 0LL);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v9, v11);
  OutputGenerationManifest.printSupportingDialogInDisplayModes.setter(1LL);
  uint64_t v14 = v8[45];
  uint64_t v13 = v8[46];
  uint64_t v15 = v8[44];
  uint64_t v16 = (unsigned __int8 *)v8[41];
  OutputGenerationManifest.responseViewId.setter(0LL, 0LL);
  uint64_t v17 = *v16;
  uint64_t v18 = type metadata accessor for DateInterval(0LL);
  sub_A66C(v15, 1LL, v19, v18);
  sub_F4F10(v17, v15);
  sub_2012C(v15, &qword_189BA0);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v14, 1LL, v13) != 1)
  {
    uint64_t v20 = v8[41];
    (*(void (**)(void, void, void))(v8[47] + 32LL))(v8[48], v8[45], v8[46]);
    sub_500C((void *)(v20 + 8), *(void *)(v20 + 32));
    sub_202B4();
    uint64_t v21 = v8[23];
    uint64_t v22 = v8[24];
    sub_500C(v8 + 20, v21);
    char v23 = dispatch thunk of DeviceState.isPhone.getter(v21, v22);
    sub_11FCDC(v20, (uint64_t)(v8 + 2));
    if ((v23 & 1) != 0)
    {
      sub_7DCF8((uint64_t)(v8 + 2));
      sub_20300();
    }

    else
    {
      sub_500C(v8 + 3, v8[6]);
      sub_202B4();
      uint64_t v24 = v8[28];
      uint64_t v25 = v8[29];
      sub_500C(v8 + 25, v24);
      uint64_t v17 = dispatch thunk of DeviceState.isPad.getter(v24, v25);
      _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v8 + 25);
      sub_7DCF8((uint64_t)(v8 + 2));
      sub_20300();
      if ((v17 & 1) == 0)
      {
LABEL_7:
        sub_11FD9C();
        goto LABEL_8;
      }
    }

    uint64_t v27 = v8[47];
    uint64_t v26 = v8[48];
    uint64_t v29 = v8[42];
    uint64_t v28 = (uint64_t *)v8[43];
    uint64_t v30 = v8[41];
    uint64_t v31 = sub_11FD10();
    uint64_t v33 = v32;
    sub_81CCC((uint64_t)v28 + *(int *)(v29 + 20), v26, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v27 + 16));
    uint64_t *v28 = v31;
    v28[1] = v33;
    sub_D7EC(v30 + 48, (uint64_t)(v8 + 30));
    sub_500C(v8 + 30, v8[33]);
    uint64_t v34 = type metadata accessor for WellnessSnippets(0LL);
    v8[38] = v34;
    v8[39] = sub_20168();
    uint64_t v17 = (uint64_t)sub_B76C(v8 + 35);
    sub_201A8((uint64_t)v28, v17);
    swift_storeEnumTagMultiPayload(v17, v34, 4LL);
    uint64_t v35 = sub_494C(&qword_18A460);
    sub_80BF8(v35);
    __break(1u);
    goto LABEL_7;
  }

  sub_2012C(v8[45], &qword_189CF8);
LABEL_8:
  sub_11FD78();
  sub_500C((void *)v17, v8[18]);
  uint64_t v36 = sub_494C(&qword_18A460);
  uint64_t result = sub_80BF8(v36);
  __break(1u);
  return result;
}

uint64_t sub_11FAAC(uint64_t a1)
{
  *(void *)(v1 + 104) = a1;
  uint64_t v2 = (void *)swift_task_alloc(dword_1906E4);
  *(void *)(v1 + 112) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_11FB00;
  return sub_11EFDC(v1 + 16);
}

uint64_t sub_11FB00()
{
  return sub_A5D0();
}

uint64_t sub_11FB34()
{
  uint64_t v1 = swift_allocObject(&unk_1821D8, 56LL, 7LL);
  sub_20004((__int128 *)(v0 + 56), v1 + 16);
  static OutputPublisherFactory.makeOutputPublisherAsync()(v4);
  uint64_t v2 = type metadata accessor for SimpleOutputFlowAsync(0LL);
  swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  *(void *)(v0 + 96) = SimpleOutputFlowAsync.init(outputPublisher:outputGenerator:)(v4, &unk_1906F0, v1);
  static ExecuteResponse.complete<A>(next:)();
  sub_20300();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_11FC10(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_1906DC);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1FF58;
  return sub_11FAAC(a1);
}

uint64_t sub_11FC60()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_11FC84(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc(dword_1906EC);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_20098;
  return sub_1FE14(a1, v1 + 16);
}

uint64_t sub_11FCDC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_11FD10()
{
  return sub_90E74(0x616548206E65704FLL, 0xEB0000000068746CLL, 0x6C6165486E65706FLL, (void *)0xED00007070416874LL);
}

uint64_t sub_11FD50()
{
  return swift_task_dealloc(*(void *)(v1 + 448));
}

uint64_t sub_11FD78()
{
  return sub_D7EC(*(void *)(v0 + 328) + 48LL, v0 + 120);
}

uint64_t sub_11FD8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 32) = v3;
  return specialized Array._endMutation()(a1, a2, a3);
}

uint64_t sub_11FD9C()
{
  return (*(uint64_t (**)(void, void))(v0[47] + 8LL))(v0[48], v0[46]);
}

uint64_t SleepQueryModel.init(snippetHeaderModel:dateLabel:sleepTypeLabel:dataLabel:avgTimeAsleepLabel:avgTimeInBedLabel:avgTimeAsleep:avgTimeInBed:totalTimeAsleep:totalTimeInBed:url:sleepDuration:avgTimeAsleepData:avgTimeInBedData:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23)
{
  uint64_t v45 = type metadata accessor for AppPunchout(0LL);
  sub_6D78(a9, v26, v27, v45);
  uint64_t v28 = (int *)sub_122D84();
  uint64_t v29 = a9 + v28[5];
  uint64_t v44 = v29;
  uint64_t v30 = type metadata accessor for SnippetHeaderModel(0LL);
  sub_6D78(v29, v31, v32, v30);
  uint64_t v33 = (void *)(a9 + v28[6]);
  void *v33 = 0LL;
  v33[1] = 0LL;
  uint64_t v34 = (void *)(a9 + v28[7]);
  void *v34 = 0LL;
  v34[1] = 0LL;
  uint64_t v35 = (void *)(a9 + v28[8]);
  *uint64_t v35 = 0LL;
  v35[1] = 0LL;
  uint64_t v36 = (void *)(a9 + v28[9]);
  void *v36 = 0LL;
  v36[1] = 0LL;
  uint64_t v37 = (void *)(a9 + v28[10]);
  *uint64_t v37 = 0LL;
  v37[1] = 0LL;
  uint64_t v38 = v28[11];
  *(void *)(a9 + v38) = 0LL;
  uint64_t v39 = v28[12];
  *(void *)(a9 + v39) = 0LL;
  uint64_t v46 = v28[13];
  *(void *)(a9 + v46) = 0LL;
  uint64_t v47 = v28[14];
  *(void *)(a9 + v47) = 0LL;
  uint64_t v40 = (void *)(a9 + v28[15]);
  void *v40 = 0LL;
  v40[1] = 0LL;
  uint64_t v41 = (void *)(a9 + v28[16]);
  void *v41 = 0LL;
  v41[1] = 0LL;
  uint64_t v42 = (void *)(a9 + v28[17]);
  *uint64_t v42 = 0LL;
  v42[1] = 0LL;
  sub_2521C(a17);
  sub_279E0(a17, &qword_189CF8);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v23, 0LL, 1LL, v45);
  sub_24D88(v23, a9, &qword_18A1A0);
  sub_24D88(a1, v44, &qword_18A1A8);
  swift_bridgeObjectRelease(v33[1]);
  void *v33 = a2;
  v33[1] = a3;
  swift_bridgeObjectRelease(v34[1]);
  void *v34 = a4;
  v34[1] = a5;
  swift_bridgeObjectRelease(v35[1]);
  *uint64_t v35 = a6;
  v35[1] = a7;
  swift_bridgeObjectRelease(v36[1]);
  void *v36 = a8;
  v36[1] = a10;
  swift_bridgeObjectRelease(v37[1]);
  *uint64_t v37 = a11;
  v37[1] = a12;
  swift_release();
  *(void *)(a9 + v38) = a13;
  swift_release();
  *(void *)(a9 + v39) = a14;
  swift_release();
  *(void *)(a9 + v46) = a15;
  uint64_t result = swift_release();
  *(void *)(a9 + v47) = a16;
  return result;
}

uint64_t type metadata accessor for SleepQueryModel(uint64_t a1)
{
  uint64_t result = qword_190778;
  if (!qword_190778) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SleepQueryModel);
  }
  return result;
}

Swift::String_optional __swiftcall SleepQueryModel.fetchSleepDuration()()
{
  uint64_t v1 = (int *)sub_122D84();
  if (*(void *)(v0 + v1[11]) || *(void *)(v0 + v1[12]) || *(void *)(v0 + v1[13]) || *(void *)(v0 + v1[14]))
  {
    swift_retain();
    uint64_t v2 = SleepQueryModel.getAbbrHoursMinDialogDuration(duration:)();
    uint64_t v4 = v3;
    swift_release();
  }

  else
  {
    uint64_t v2 = 0LL;
    uint64_t v4 = 0LL;
  }

  uint64_t v5 = v2;
  uint64_t v6 = v4;
  result.value._object = v6;
  result.value._countAndFlagsBits = v5;
  return result;
}

uint64_t SleepQueryModel.getAbbrHoursMinDialogDuration(duration:)()
{
  uint64_t v3 = type metadata accessor for SpeakableString(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_27AD8();
  dispatch thunk of DialogDuration.hoursMinutesAbbreviated.getter();
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v0, 1LL, v3) == 1)
  {
    sub_279E0(v0, &qword_189D00);
    return 0LL;
  }

  else
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v1, v0, v3);
    uint64_t v5 = SpeakableString.print.getter(v6);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
  }

  return v5;
}

void SleepQueryModel.snippetHeaderModel.getter(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_122D84();
  sub_A44C(v1 + *(int *)(v3 + 20), a1, &qword_18A1A8);
}

void SleepQueryModel.snippetHeaderModel.setter(uint64_t a1)
{
  uint64_t v3 = sub_122D84();
  sub_24D88(a1, v1 + *(int *)(v3 + 20), &qword_18A1A8);
}

uint64_t (*SleepQueryModel.snippetHeaderModel.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

void SleepQueryModel.dateLabel.getter()
{
  uint64_t v0 = sub_122D84();
  sub_27A30(*(int *)(v0 + 24));
  sub_1EB8C();
  sub_A890();
}

void SleepQueryModel.dateLabel.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_122D84();
  sub_27AB4(*(int *)(v5 + 24));
  *uint64_t v2 = a1;
  v2[1] = a2;
  sub_1EB0C();
}

uint64_t (*SleepQueryModel.dateLabel.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

void SleepQueryModel.sleepTypeLabel.getter()
{
  uint64_t v0 = sub_122D84();
  sub_27A30(*(int *)(v0 + 28));
  sub_1EB8C();
  sub_A890();
}

void SleepQueryModel.sleepTypeLabel.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_122D84();
  sub_27AB4(*(int *)(v5 + 28));
  *uint64_t v2 = a1;
  v2[1] = a2;
  sub_1EB0C();
}

uint64_t (*SleepQueryModel.sleepTypeLabel.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

void SleepQueryModel.dataLabel.getter()
{
  uint64_t v0 = sub_122D84();
  sub_27A30(*(int *)(v0 + 32));
  sub_1EB8C();
  sub_A890();
}

void SleepQueryModel.dataLabel.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_122D84();
  sub_27AB4(*(int *)(v5 + 32));
  *uint64_t v2 = a1;
  v2[1] = a2;
  sub_1EB0C();
}

uint64_t (*SleepQueryModel.dataLabel.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

void SleepQueryModel.avgTimeAsleepLabel.getter()
{
  uint64_t v0 = sub_122D84();
  sub_27A30(*(int *)(v0 + 36));
  sub_1EB8C();
  sub_A890();
}

void SleepQueryModel.avgTimeAsleepLabel.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_122D84();
  sub_27AB4(*(int *)(v5 + 36));
  *uint64_t v2 = a1;
  v2[1] = a2;
  sub_1EB0C();
}

uint64_t (*SleepQueryModel.avgTimeAsleepLabel.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

void SleepQueryModel.avgTimeInBedLabel.getter()
{
  uint64_t v0 = sub_122D84();
  sub_27A30(*(int *)(v0 + 40));
  sub_1EB8C();
  sub_A890();
}

void SleepQueryModel.avgTimeInBedLabel.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_122D84();
  sub_27AB4(*(int *)(v5 + 40));
  *uint64_t v2 = a1;
  v2[1] = a2;
  sub_1EB0C();
}

uint64_t (*SleepQueryModel.avgTimeInBedLabel.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

uint64_t SleepQueryModel.avgTimeAsleep.getter()
{
  return swift_retain();
}

void SleepQueryModel.avgTimeAsleep.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(sub_122D84() + 44);
  sub_122E04();
  *(void *)(v1 + v3) = a1;
  sub_1EB0C();
}

uint64_t (*SleepQueryModel.avgTimeAsleep.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

uint64_t SleepQueryModel.avgTimeInBed.getter()
{
  return swift_retain();
}

void SleepQueryModel.avgTimeInBed.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(sub_122D84() + 48);
  sub_122E04();
  *(void *)(v1 + v3) = a1;
  sub_1EB0C();
}

uint64_t (*SleepQueryModel.avgTimeInBed.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

uint64_t SleepQueryModel.totalTimeAsleep.getter()
{
  return swift_retain();
}

void SleepQueryModel.totalTimeAsleep.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(sub_122D84() + 52);
  sub_122E04();
  *(void *)(v1 + v3) = a1;
  sub_1EB0C();
}

uint64_t (*SleepQueryModel.totalTimeAsleep.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

uint64_t SleepQueryModel.totalTimeInBed.getter()
{
  return swift_retain();
}

void SleepQueryModel.totalTimeInBed.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(sub_122D84() + 56);
  sub_122E04();
  *(void *)(v1 + v3) = a1;
  sub_1EB0C();
}

uint64_t (*SleepQueryModel.totalTimeInBed.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

void SleepQueryModel.sleepDuration.getter()
{
  uint64_t v0 = sub_122D84();
  sub_27A30(*(int *)(v0 + 60));
  sub_1EB8C();
  sub_A890();
}

void SleepQueryModel.sleepDuration.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_122D84();
  sub_27AB4(*(int *)(v5 + 60));
  *uint64_t v2 = a1;
  v2[1] = a2;
  sub_1EB0C();
}

uint64_t (*SleepQueryModel.sleepDuration.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

void SleepQueryModel.avgTimeAsleepData.getter()
{
  uint64_t v0 = sub_122D84();
  sub_27A30(*(int *)(v0 + 64));
  sub_1EB8C();
  sub_A890();
}

void SleepQueryModel.avgTimeAsleepData.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_122D84();
  sub_27AB4(*(int *)(v5 + 64));
  *uint64_t v2 = a1;
  v2[1] = a2;
  sub_1EB0C();
}

uint64_t (*SleepQueryModel.avgTimeAsleepData.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

void SleepQueryModel.avgTimeInBedData.getter()
{
  uint64_t v0 = sub_122D84();
  sub_27A30(*(int *)(v0 + 68));
  sub_1EB8C();
  sub_A890();
}

void SleepQueryModel.avgTimeInBedData.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_122D84();
  sub_27AB4(*(int *)(v5 + 68));
  *uint64_t v2 = a1;
  v2[1] = a2;
  sub_1EB0C();
}

uint64_t (*SleepQueryModel.avgTimeInBedData.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

uint64_t sub_1207F8(uint64_t a1, unint64_t a2)
{
  BOOL v3 = a1 == 0x68636E7550707061LL && a2 == 0xEB0000000074756FLL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x68636E7550707061LL, 0xEB0000000074756FLL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  if (a1 == 0xD000000000000012LL)
  {
    unint64_t v6 = 0x8000000000141630LL;
    if (a2 == 0x8000000000141630LL) {
      goto LABEL_11;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012LL, 0x8000000000141630LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v6 = a2;
LABEL_11:
    swift_bridgeObjectRelease(v6);
    return 1LL;
  }

  BOOL v7 = a1 == 0x6562614C65746164LL && a2 == 0xE90000000000006CLL;
  if (v7
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6562614C65746164LL, 0xE90000000000006CLL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 2LL;
  }

  BOOL v8 = a1 == 0x7079547065656C73LL && a2 == 0xEE006C6562614C65LL;
  if (v8
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x7079547065656C73LL, 0xEE006C6562614C65LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 3LL;
  }

  BOOL v9 = a1 == 0x6562614C61746164LL && a2 == 0xE90000000000006CLL;
  if (v9
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6562614C61746164LL, 0xE90000000000006CLL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 4LL;
  }

  if (a1 == 0xD000000000000012LL)
  {
    unint64_t v10 = 0x8000000000147D90LL;
    if (a2 == 0x8000000000147D90LL) {
      goto LABEL_34;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012LL, 0x8000000000147D90LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v10 = a2;
LABEL_34:
    swift_bridgeObjectRelease(v10);
    return 5LL;
  }

  if (a1 == 0xD000000000000011LL)
  {
    unint64_t v11 = 0x8000000000147DB0LL;
    if (a2 == 0x8000000000147DB0LL) {
      goto LABEL_39;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011LL, 0x8000000000147DB0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v11 = a2;
LABEL_39:
    swift_bridgeObjectRelease(v11);
    return 6LL;
  }

  BOOL v12 = a1 == 0x41656D6954677661LL && a2 == 0xED00007065656C73LL;
  if (v12
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x41656D6954677661LL, 0xED00007065656C73LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 7LL;
  }

  BOOL v13 = a1 == 0x49656D6954677661LL && a2 == 0xEC0000006465426ELL;
  if (v13
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x49656D6954677661LL, 0xEC0000006465426ELL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 8LL;
  }

  BOOL v14 = a1 == 0x6D69546C61746F74LL && a2 == 0xEF7065656C734165LL;
  if (v14
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6D69546C61746F74LL, 0xEF7065656C734165LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 9LL;
  }

  BOOL v15 = a1 == 0x6D69546C61746F74LL && a2 == 0xEE006465426E4965LL;
  if (v15
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6D69546C61746F74LL, 0xEE006465426E4965LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 10LL;
  }

  BOOL v16 = a1 == 0x7275447065656C73LL && a2 == 0xED00006E6F697461LL;
  if (v16
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x7275447065656C73LL, 0xED00006E6F697461LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 11LL;
  }

  if (a1 == 0xD000000000000011LL)
  {
    unint64_t v17 = 0x8000000000147DD0LL;
    if (a2 == 0x8000000000147DD0LL) {
      goto LABEL_74;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011LL, 0x8000000000147DD0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v17 = a2;
LABEL_74:
    swift_bridgeObjectRelease(v17);
    return 12LL;
  }

  if (a1 == 0xD000000000000010LL && a2 == 0x8000000000147DF0LL)
  {
    swift_bridgeObjectRelease(0x8000000000147DF0LL);
    return 13LL;
  }

  else
  {
    char v18 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010LL, 0x8000000000147DF0LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v18 & 1) != 0) {
      return 13LL;
    }
    else {
      return 14LL;
    }
  }

uint64_t sub_120D88()
{
  return 14LL;
}

uint64_t sub_120D90(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_120DCC + 4 * byte_13F920[a1]))( 0xD000000000000012LL,  0x8000000000141630LL);
}

uint64_t sub_120DCC()
{
  return 0x68636E7550707061LL;
}

uint64_t sub_120DEC()
{
  return 0x6562614C65746164LL;
}

uint64_t sub_120E38()
{
  return v0 + 1;
}

uint64_t sub_120F28()
{
  return sub_120D90(*v0);
}

uint64_t sub_120F30@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1207F8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_120F54@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_120D88();
  *a1 = result;
  return result;
}

uint64_t sub_120F78(uint64_t a1)
{
  unint64_t v2 = sub_121278();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_120FA0(uint64_t a1)
{
  unint64_t v2 = sub_121278();
  return CodingKey.debugDescription.getter(a1, v2);
}

void SleepQueryModel.encode(to:)(void *a1)
{
  uint64_t v4 = v1;
  uint64_t v6 = sub_494C(&qword_1906F8);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_27AD8();
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_500C(a1, v8);
  unint64_t v10 = sub_121278();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for SleepQueryModel.CodingKeys,  &type metadata for SleepQueryModel.CodingKeys,  v10,  v8,  v9);
  uint64_t v11 = type metadata accessor for AppPunchout(0LL);
  sub_A410( &qword_18AA98,  (uint64_t (*)(uint64_t))&type metadata accessor for AppPunchout,  (uint64_t)&protocol conformance descriptor for AppPunchout);
  sub_119C64();
  sub_5E21C(v4, v12, v6, v11);
  if (!v2)
  {
    Model = (int *)type metadata accessor for SleepQueryModel(0LL);
    uint64_t v14 = v4 + Model[5];
    uint64_t v15 = type metadata accessor for SnippetHeaderModel(0LL);
    sub_A410( &qword_18AAA8,  type metadata accessor for SnippetHeaderModel,  (uint64_t)&protocol conformance descriptor for SnippetHeaderModel);
    sub_119C64();
    sub_5E21C(v14, v16, v6, v15);
    uint64_t v17 = sub_5E260(Model[6]);
    sub_ADC4C(v17, v18, 2);
    uint64_t v19 = sub_5E260(Model[7]);
    sub_ADC4C(v19, v20, 3);
    uint64_t v21 = sub_5E260(Model[8]);
    sub_ADC4C(v21, v22, 4);
    uint64_t v23 = sub_5E260(Model[9]);
    sub_ADC4C(v23, v24, 5);
    uint64_t v25 = sub_5E260(Model[10]);
    sub_ADC4C(v25, v26, 6);
    sub_122E18(Model[11]);
    type metadata accessor for DialogDuration(0LL);
    sub_A410( &qword_190708,  (uint64_t (*)(uint64_t))&type metadata accessor for DialogDuration,  (uint64_t)&protocol conformance descriptor for DialogDuration);
    sub_122D8C();
    sub_122E18(Model[12]);
    sub_122D8C();
    sub_122E18(Model[13]);
    sub_122D8C();
    sub_122E18(Model[14]);
    sub_122D8C();
    uint64_t v27 = sub_5E260(Model[15]);
    sub_ADC4C(v27, v28, 11);
    uint64_t v29 = sub_5E260(Model[16]);
    sub_ADC4C(v29, v30, 12);
    uint64_t v31 = sub_5E260(Model[17]);
    sub_ADC4C(v31, v32, 13);
  }

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v3, v6);
  sub_1C6D8();
}

unint64_t sub_121278()
{
  unint64_t result = qword_190700;
  if (!qword_190700)
  {
    unint64_t result = swift_getWitnessTable(&unk_13FADC, &type metadata for SleepQueryModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_190700);
  }

  return result;
}

void SleepQueryModel.init(from:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v80 = a2;
  sub_494C(&qword_18A1A8);
  sub_6D20();
  __chkstk_darwin(v3);
  sub_6D30();
  uint64_t v91 = v4;
  sub_494C(&qword_18A1A0);
  sub_6D20();
  __chkstk_darwin(v5);
  sub_6D30();
  uint64_t v92 = v6;
  uint64_t v93 = sub_494C(&qword_190710);
  uint64_t v90 = *(void *)(v93 - 8);
  __chkstk_darwin(v93);
  sub_6D30();
  uint64_t v97 = v7;
  Model = (int *)type metadata accessor for SleepQueryModel(0LL);
  sub_6D20();
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)v77 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v89 = type metadata accessor for AppPunchout(0LL);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v11, 1LL, 1LL, v89);
  uint64_t v12 = (uint64_t)&v11[Model[5]];
  uint64_t v13 = type metadata accessor for SnippetHeaderModel(0LL);
  uint64_t v87 = v12;
  uint64_t v88 = v13;
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v12, 1LL, 1LL, v13);
  uint64_t v14 = &v11[Model[6]];
  *(void *)uint64_t v14 = 0LL;
  *((void *)v14 + 1) = 0LL;
  uint64_t v86 = v14;
  uint64_t v15 = &v11[Model[7]];
  *(void *)uint64_t v15 = 0LL;
  *((void *)v15 + 1) = 0LL;
  uint64_t v85 = v15;
  uint64_t v16 = &v11[Model[8]];
  *(void *)uint64_t v16 = 0LL;
  *((void *)v16 + 1) = 0LL;
  uint64_t v17 = &v11[Model[9]];
  *(void *)uint64_t v17 = 0LL;
  *((void *)v17 + 1) = 0LL;
  uint64_t v18 = &v11[Model[10]];
  *(void *)uint64_t v18 = 0LL;
  *((void *)v18 + 1) = 0LL;
  uint64_t v84 = Model[11];
  *(void *)&v11[v84] = 0LL;
  uint64_t v83 = (uint64_t *)Model[12];
  *(uint64_t *)((char *)v83 + (void)v11) = 0LL;
  uint64_t v82 = Model[13];
  *(void *)&v11[v82] = 0LL;
  uint64_t v81 = Model[14];
  *(void *)&v11[v81] = 0LL;
  uint64_t v19 = &v11[Model[15]];
  *(void *)uint64_t v19 = 0LL;
  *((void *)v19 + 1) = 0LL;
  uint64_t v20 = &v11[Model[16]];
  *(void *)uint64_t v20 = 0LL;
  *((void *)v20 + 1) = 0LL;
  uint64_t v21 = Model[17];
  v96 = v11;
  uint64_t v22 = &v11[v21];
  *(void *)uint64_t v22 = 0LL;
  *((void *)v22 + 1) = 0LL;
  uint64_t v23 = a1;
  uint64_t v24 = a1[3];
  uint64_t v25 = a1[4];
  v94 = v23;
  sub_500C(v23, v24);
  unint64_t v26 = sub_121278();
  uint64_t v27 = v95;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for SleepQueryModel.CodingKeys,  &type metadata for SleepQueryModel.CodingKeys,  v26,  v24,  v25);
  if (v27)
  {
    uint64_t v33 = (uint64_t)v96;
    _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v94);
    uint64_t v76 = v33;
  }

  else
  {
    v95 = v16;
    uint64_t v28 = v91;
    v78 = v18;
    uint64_t v79 = v17;
    v77[3] = v19;
    v77[2] = v20;
    v77[1] = v22;
    uint64_t v29 = v90;
    LOBYTE(v99) = 0;
    sub_A410( &qword_18AAB8,  (uint64_t (*)(uint64_t))&type metadata accessor for AppPunchout,  (uint64_t)&protocol conformance descriptor for AppPunchout);
    sub_119C64();
    uint64_t v30 = v92;
    uint64_t v31 = v93;
    sub_122DF0(v89, v32, v93, v89);
    uint64_t v34 = v30;
    uint64_t v35 = (uint64_t)v96;
    sub_24D88(v34, (uint64_t)v96, &qword_18A1A0);
    LOBYTE(v99) = 1;
    sub_A410( &qword_18AAC8,  type metadata accessor for SnippetHeaderModel,  (uint64_t)&protocol conformance descriptor for SnippetHeaderModel);
    sub_119C64();
    sub_122DF0(v88, v36, v31, v88);
    sub_24D88(v28, v87, &qword_18A1A8);
    sub_122DAC(2);
    sub_122E0C();
    uint64_t v37 = v86;
    sub_8DE70();
    *uint64_t v37 = v17;
    v37[1] = v20;
    sub_122DAC(3);
    sub_122E0C();
    uint64_t v38 = v85;
    sub_8DE70();
    *uint64_t v38 = v17;
    v38[1] = v20;
    sub_122DAC(4);
    sub_122E0C();
    uint64_t v39 = v95;
    sub_8DE70();
    *uint64_t v39 = v17;
    v39[1] = v20;
    sub_122DAC(5);
    sub_122E0C();
    uint64_t v40 = v79;
    sub_8DE70();
    void *v40 = v17;
    v40[1] = v20;
    sub_122DAC(6);
    sub_122E0C();
    uint64_t v41 = v78;
    sub_8DE70();
    void *v41 = v17;
    v41[1] = v20;
    uint64_t v42 = type metadata accessor for DialogDuration(0LL);
    v98[0] = 7;
    sub_A410( &qword_190718,  (uint64_t (*)(uint64_t))&type metadata accessor for DialogDuration,  (uint64_t)&protocol conformance descriptor for DialogDuration);
    uint64_t v44 = v43;
    uint64_t v45 = sub_122DD8();
    sub_122DF0(v45, v46, v47, v48);
    v95 = v99;
    uint64_t v49 = v84;
    swift_release();
    *(void *)(v35 + v49) = v95;
    v98[0] = 8;
    uint64_t v50 = sub_122DD8();
    v95 = v44;
    sub_122DF0(v50, v51, v52, v53);
    uint64_t v54 = (uint64_t)v99;
    uint64_t v55 = v83;
    swift_release();
    *(uint64_t *)((char *)v55 + v35) = v54;
    v98[0] = 9;
    uint64_t v56 = sub_122DD8();
    sub_122DF0(v56, v57, v58, v59);
    uint64_t v60 = v99;
    uint64_t v61 = (uint64_t)v96;
    uint64_t v62 = v82;
    swift_release();
    *(void *)(v61 + v62) = v60;
    v98[0] = 10;
    sub_122DF0(v42, (uint64_t)v98, v93, v42);
    unint64_t v63 = v99;
    uint64_t v64 = v81;
    uint64_t v65 = (uint64_t)v96;
    swift_release();
    *(void *)(v65 + v64) = v63;
    uint64_t v66 = sub_122DC0(11);
    uint64_t v68 = v67;
    sub_122DF8((uint64_t)&v102);
    uint64_t *v55 = v66;
    v55[1] = v68;
    uint64_t v69 = sub_122DC0(12);
    uint64_t v71 = v70;
    sub_122DF8((uint64_t)&v101);
    uint64_t *v55 = v69;
    v55[1] = v71;
    uint64_t v72 = sub_122DC0(13);
    uint64_t v74 = v73;
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v97, v93);
    sub_122DF8((uint64_t)&v100);
    uint64_t *v55 = v72;
    v55[1] = v74;
    uint64_t v75 = (uint64_t)v96;
    sub_121870((uint64_t)v96, v80);
    _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v94);
    uint64_t v76 = v75;
  }

  sub_26F04(v76, type metadata accessor for SleepQueryModel);
  sub_1C6D8();
}

uint64_t sub_121870(uint64_t a1, uint64_t a2)
{
  uint64_t Model = type metadata accessor for SleepQueryModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(Model - 8) + 16LL))(a2, a1, Model);
  return a2;
}

void sub_1218B4()
{
}

void sub_1218E0()
{
}

void sub_12190C(void *a1@<X0>, uint64_t a2@<X8>)
{
}

void sub_121920(void *a1)
{
}

uint64_t *initializeBufferWithCopyOfBuffer for SleepQueryModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = type metadata accessor for AppPunchout(0LL);
    if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a2, 1LL, v7))
    {
      uint64_t v8 = sub_494C(&qword_18A1A0);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)a1, 0LL, 1LL, v7);
    }

    uint64_t v10 = a3[5];
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = type metadata accessor for SnippetHeaderModel(0LL);
    if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v12, 1LL, v13))
    {
      uint64_t v14 = sub_494C(&qword_18A1A8);
      memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64LL));
    }

    else
    {
      uint64_t v15 = type metadata accessor for SpeakableString(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16LL))(v11, v12, v15);
      uint64_t v16 = *(int *)(v13 + 20);
      uint64_t v17 = &v11[v16];
      uint64_t v18 = &v12[v16];
      uint64_t v19 = *((void *)v18 + 1);
      *(void *)uint64_t v17 = *(void *)v18;
      *((void *)v17 + 1) = v19;
      uint64_t v20 = *(int *)(v13 + 24);
      uint64_t v21 = &v11[v20];
      uint64_t v22 = &v12[v20];
      uint64_t v23 = *((void *)v22 + 1);
      *(void *)uint64_t v21 = *(void *)v22;
      *((void *)v21 + 1) = v23;
      swift_bridgeObjectRetain(v19);
      swift_bridgeObjectRetain(v23);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v11, 0LL, 1LL, v13);
    }

    uint64_t v24 = a3[6];
    uint64_t v25 = a3[7];
    unint64_t v26 = (uint64_t *)((char *)a1 + v24);
    uint64_t v27 = (uint64_t *)((char *)a2 + v24);
    uint64_t v28 = v27[1];
    void *v26 = *v27;
    v26[1] = v28;
    uint64_t v29 = (uint64_t *)((char *)a1 + v25);
    uint64_t v30 = (uint64_t *)((char *)a2 + v25);
    uint64_t v58 = v30[1];
    void *v29 = *v30;
    v29[1] = v58;
    uint64_t v31 = a3[8];
    uint64_t v32 = a3[9];
    uint64_t v33 = (uint64_t *)((char *)a1 + v31);
    uint64_t v34 = (uint64_t *)((char *)a2 + v31);
    uint64_t v35 = v34[1];
    void *v33 = *v34;
    v33[1] = v35;
    uint64_t v36 = (uint64_t *)((char *)a1 + v32);
    uint64_t v37 = (uint64_t *)((char *)a2 + v32);
    uint64_t v57 = v37[1];
    void *v36 = *v37;
    v36[1] = v57;
    uint64_t v38 = a3[10];
    uint64_t v39 = a3[11];
    uint64_t v40 = (uint64_t *)((char *)a1 + v38);
    uint64_t v41 = (uint64_t *)((char *)a2 + v38);
    uint64_t v42 = v41[1];
    void *v40 = *v41;
    v40[1] = v42;
    *(uint64_t *)((char *)a1 + v39) = *(uint64_t *)((char *)a2 + v39);
    uint64_t v43 = a3[13];
    *(uint64_t *)((char *)a1 + a3[12]) = *(uint64_t *)((char *)a2 + a3[12]);
    *(uint64_t *)((char *)a1 + v43) = *(uint64_t *)((char *)a2 + v43);
    uint64_t v44 = a3[15];
    *(uint64_t *)((char *)a1 + a3[14]) = *(uint64_t *)((char *)a2 + a3[14]);
    uint64_t v45 = (uint64_t *)((char *)a1 + v44);
    uint64_t v46 = (uint64_t *)((char *)a2 + v44);
    uint64_t v47 = v46[1];
    void *v45 = *v46;
    v45[1] = v47;
    uint64_t v48 = a3[16];
    uint64_t v49 = a3[17];
    uint64_t v50 = (uint64_t *)((char *)a1 + v48);
    uint64_t v51 = (uint64_t *)((char *)a2 + v48);
    uint64_t v52 = v51[1];
    void *v50 = *v51;
    v50[1] = v52;
    uint64_t v53 = (uint64_t *)((char *)a1 + v49);
    uint64_t v54 = (uint64_t *)((char *)a2 + v49);
    uint64_t v55 = v54[1];
    *uint64_t v53 = *v54;
    v53[1] = v55;
    swift_bridgeObjectRetain(v28);
    swift_bridgeObjectRetain(v58);
    swift_bridgeObjectRetain(v35);
    swift_bridgeObjectRetain(v57);
    swift_bridgeObjectRetain(v42);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain(v47);
    swift_bridgeObjectRetain(v52);
    swift_bridgeObjectRetain(v55);
  }

  return a1;
}

uint64_t destroy for SleepQueryModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppPunchout(0LL);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for SnippetHeaderModel(0LL);
  if (!_s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v5, 1LL, v6))
  {
    uint64_t v7 = type metadata accessor for SpeakableString(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8LL))(v5, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for SleepQueryModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AppPunchout(0LL);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a2, 1LL, v6))
  {
    uint64_t v7 = sub_494C(&qword_18A1A0);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)a1, 0LL, 1LL, v6);
  }

  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = type metadata accessor for SnippetHeaderModel(0LL);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v10, 1LL, v11))
  {
    uint64_t v12 = sub_494C(&qword_18A1A8);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64LL));
  }

  else
  {
    uint64_t v13 = type metadata accessor for SpeakableString(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16LL))(v9, v10, v13);
    uint64_t v14 = *(int *)(v11 + 20);
    uint64_t v15 = &v9[v14];
    uint64_t v16 = &v10[v14];
    uint64_t v17 = *((void *)v16 + 1);
    *(void *)uint64_t v15 = *(void *)v16;
    *((void *)v15 + 1) = v17;
    uint64_t v18 = *(int *)(v11 + 24);
    uint64_t v19 = &v9[v18];
    uint64_t v20 = &v10[v18];
    uint64_t v21 = *((void *)v20 + 1);
    *(void *)uint64_t v19 = *(void *)v20;
    *((void *)v19 + 1) = v21;
    swift_bridgeObjectRetain(v17);
    swift_bridgeObjectRetain(v21);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v9, 0LL, 1LL, v11);
  }

  uint64_t v22 = a3[6];
  uint64_t v23 = a3[7];
  uint64_t v24 = &a1[v22];
  uint64_t v25 = &a2[v22];
  uint64_t v26 = *((void *)v25 + 1);
  *(void *)uint64_t v24 = *(void *)v25;
  *((void *)v24 + 1) = v26;
  uint64_t v27 = &a1[v23];
  uint64_t v28 = &a2[v23];
  uint64_t v56 = *((void *)v28 + 1);
  *(void *)uint64_t v27 = *(void *)v28;
  *((void *)v27 + 1) = v56;
  uint64_t v29 = a3[8];
  uint64_t v30 = a3[9];
  uint64_t v31 = &a1[v29];
  uint64_t v32 = &a2[v29];
  uint64_t v33 = *((void *)v32 + 1);
  *(void *)uint64_t v31 = *(void *)v32;
  *((void *)v31 + 1) = v33;
  uint64_t v34 = &a1[v30];
  uint64_t v35 = &a2[v30];
  uint64_t v55 = *((void *)v35 + 1);
  *(void *)uint64_t v34 = *(void *)v35;
  *((void *)v34 + 1) = v55;
  uint64_t v36 = a3[10];
  uint64_t v37 = a3[11];
  uint64_t v38 = &a1[v36];
  uint64_t v39 = &a2[v36];
  uint64_t v40 = *((void *)v39 + 1);
  *(void *)uint64_t v38 = *(void *)v39;
  *((void *)v38 + 1) = v40;
  *(void *)&a1[v37] = *(void *)&a2[v37];
  uint64_t v41 = a3[13];
  *(void *)&a1[a3[12]] = *(void *)&a2[a3[12]];
  *(void *)&a1[v41] = *(void *)&a2[v41];
  uint64_t v42 = a3[15];
  *(void *)&a1[a3[14]] = *(void *)&a2[a3[14]];
  uint64_t v43 = &a1[v42];
  uint64_t v44 = &a2[v42];
  uint64_t v45 = *((void *)v44 + 1);
  *(void *)uint64_t v43 = *(void *)v44;
  *((void *)v43 + 1) = v45;
  uint64_t v46 = a3[16];
  uint64_t v47 = a3[17];
  uint64_t v48 = &a1[v46];
  uint64_t v49 = &a2[v46];
  uint64_t v50 = *((void *)v49 + 1);
  *(void *)uint64_t v48 = *(void *)v49;
  *((void *)v48 + 1) = v50;
  uint64_t v51 = &a1[v47];
  uint64_t v52 = &a2[v47];
  uint64_t v53 = *((void *)v52 + 1);
  *(void *)uint64_t v51 = *(void *)v52;
  *((void *)v51 + 1) = v53;
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRetain(v56);
  swift_bridgeObjectRetain(v33);
  swift_bridgeObjectRetain(v55);
  swift_bridgeObjectRetain(v40);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain(v45);
  swift_bridgeObjectRetain(v50);
  swift_bridgeObjectRetain(v53);
  return a1;
}

char *assignWithCopy for SleepQueryModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AppPunchout(0LL);
  int v7 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a1, 1LL, v6);
  int v8 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a2, 1LL, v6);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)a1, 0LL, 1LL, v6);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = sub_494C(&qword_18A1A0);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = a3[5];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = type metadata accessor for SnippetHeaderModel(0LL);
  int v15 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v12, 1LL, v14);
  int v16 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v13, 1LL, v14);
  if (!v15)
  {
    if (!v16)
    {
      uint64_t v60 = type metadata accessor for SpeakableString(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 24LL))(v12, v13, v60);
      uint64_t v61 = *(int *)(v14 + 20);
      uint64_t v62 = &v12[v61];
      unint64_t v63 = &v13[v61];
      *(void *)uint64_t v62 = *(void *)v63;
      uint64_t v64 = *((void *)v63 + 1);
      *((void *)v62 + 1) = v64;
      swift_bridgeObjectRetain(v64);
      swift_bridgeObjectRelease();
      uint64_t v65 = *(int *)(v14 + 24);
      uint64_t v66 = &v12[v65];
      uint64_t v67 = &v13[v65];
      *(void *)uint64_t v66 = *(void *)v67;
      uint64_t v68 = *((void *)v67 + 1);
      *((void *)v66 + 1) = v68;
      swift_bridgeObjectRetain(v68);
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }

    sub_26F04((uint64_t)v12, type metadata accessor for SnippetHeaderModel);
    goto LABEL_12;
  }

  if (v16)
  {
LABEL_12:
    uint64_t v26 = sub_494C(&qword_18A1A8);
    memcpy(v12, v13, *(void *)(*(void *)(v26 - 8) + 64LL));
    goto LABEL_13;
  }

  uint64_t v17 = type metadata accessor for SpeakableString(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16LL))(v12, v13, v17);
  uint64_t v18 = *(int *)(v14 + 20);
  uint64_t v19 = &v12[v18];
  uint64_t v20 = &v13[v18];
  *(void *)uint64_t v19 = *(void *)v20;
  uint64_t v21 = *((void *)v20 + 1);
  *((void *)v19 + 1) = v21;
  uint64_t v22 = *(int *)(v14 + 24);
  uint64_t v23 = &v12[v22];
  uint64_t v24 = &v13[v22];
  *(void *)uint64_t v23 = *(void *)v24;
  uint64_t v25 = *((void *)v24 + 1);
  *((void *)v23 + 1) = v25;
  swift_bridgeObjectRetain(v21);
  swift_bridgeObjectRetain(v25);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v12, 0LL, 1LL, v14);
LABEL_13:
  uint64_t v27 = a3[6];
  uint64_t v28 = &a1[v27];
  uint64_t v29 = &a2[v27];
  *(void *)uint64_t v28 = *(void *)v29;
  uint64_t v30 = *((void *)v29 + 1);
  *((void *)v28 + 1) = v30;
  swift_bridgeObjectRetain(v30);
  swift_bridgeObjectRelease();
  uint64_t v31 = a3[7];
  uint64_t v32 = &a1[v31];
  uint64_t v33 = &a2[v31];
  *(void *)uint64_t v32 = *(void *)v33;
  uint64_t v34 = *((void *)v33 + 1);
  *((void *)v32 + 1) = v34;
  swift_bridgeObjectRetain(v34);
  swift_bridgeObjectRelease();
  uint64_t v35 = a3[8];
  uint64_t v36 = &a1[v35];
  uint64_t v37 = &a2[v35];
  *(void *)uint64_t v36 = *(void *)v37;
  uint64_t v38 = *((void *)v37 + 1);
  *((void *)v36 + 1) = v38;
  swift_bridgeObjectRetain(v38);
  swift_bridgeObjectRelease();
  uint64_t v39 = a3[9];
  uint64_t v40 = &a1[v39];
  uint64_t v41 = &a2[v39];
  *(void *)uint64_t v40 = *(void *)v41;
  uint64_t v42 = *((void *)v41 + 1);
  *((void *)v40 + 1) = v42;
  swift_bridgeObjectRetain(v42);
  swift_bridgeObjectRelease();
  uint64_t v43 = a3[10];
  uint64_t v44 = &a1[v43];
  uint64_t v45 = &a2[v43];
  *(void *)uint64_t v44 = *(void *)v45;
  uint64_t v46 = *((void *)v45 + 1);
  *((void *)v44 + 1) = v46;
  swift_bridgeObjectRetain(v46);
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  swift_retain();
  swift_release();
  *(void *)&a1[a3[12]] = *(void *)&a2[a3[12]];
  swift_retain();
  swift_release();
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  swift_retain();
  swift_release();
  *(void *)&a1[a3[14]] = *(void *)&a2[a3[14]];
  swift_retain();
  swift_release();
  uint64_t v47 = a3[15];
  uint64_t v48 = &a1[v47];
  uint64_t v49 = &a2[v47];
  *(void *)uint64_t v48 = *(void *)v49;
  uint64_t v50 = *((void *)v49 + 1);
  *((void *)v48 + 1) = v50;
  swift_bridgeObjectRetain(v50);
  swift_bridgeObjectRelease();
  uint64_t v51 = a3[16];
  uint64_t v52 = &a1[v51];
  uint64_t v53 = &a2[v51];
  *(void *)uint64_t v52 = *(void *)v53;
  uint64_t v54 = *((void *)v53 + 1);
  *((void *)v52 + 1) = v54;
  swift_bridgeObjectRetain(v54);
  swift_bridgeObjectRelease();
  uint64_t v55 = a3[17];
  uint64_t v56 = &a1[v55];
  uint64_t v57 = &a2[v55];
  *(void *)uint64_t v56 = *(void *)v57;
  uint64_t v58 = *((void *)v57 + 1);
  *((void *)v56 + 1) = v58;
  swift_bridgeObjectRetain(v58);
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for SleepQueryModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AppPunchout(0LL);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a2, 1LL, v6))
  {
    uint64_t v7 = sub_494C(&qword_18A1A0);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)a1, 0LL, 1LL, v6);
  }

  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = type metadata accessor for SnippetHeaderModel(0LL);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v10, 1LL, v11))
  {
    uint64_t v12 = sub_494C(&qword_18A1A8);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64LL));
  }

  else
  {
    uint64_t v13 = type metadata accessor for SpeakableString(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32LL))(v9, v10, v13);
    *(_OWORD *)&v9[*(int *)(v11 + 20)] = *(_OWORD *)&v10[*(int *)(v11 + 20)];
    *(_OWORD *)&v9[*(int *)(v11 + 24)] = *(_OWORD *)&v10[*(int *)(v11 + 24)];
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v9, 0LL, 1LL, v11);
  }

  uint64_t v14 = a3[7];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  *(_OWORD *)&a1[v14] = *(_OWORD *)&a2[v14];
  uint64_t v15 = a3[9];
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  *(_OWORD *)&a1[v15] = *(_OWORD *)&a2[v15];
  uint64_t v16 = a3[11];
  *(_OWORD *)&a1[a3[10]] = *(_OWORD *)&a2[a3[10]];
  *(void *)&a1[v16] = *(void *)&a2[v16];
  uint64_t v17 = a3[13];
  *(void *)&a1[a3[12]] = *(void *)&a2[a3[12]];
  *(void *)&a1[v17] = *(void *)&a2[v17];
  uint64_t v18 = a3[15];
  *(void *)&a1[a3[14]] = *(void *)&a2[a3[14]];
  *(_OWORD *)&a1[v18] = *(_OWORD *)&a2[v18];
  uint64_t v19 = a3[17];
  *(_OWORD *)&a1[a3[16]] = *(_OWORD *)&a2[a3[16]];
  *(_OWORD *)&a1[v19] = *(_OWORD *)&a2[v19];
  return a1;
}

char *assignWithTake for SleepQueryModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AppPunchout(0LL);
  int v7 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a1, 1LL, v6);
  int v8 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a2, 1LL, v6);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)a1, 0LL, 1LL, v6);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = sub_494C(&qword_18A1A0);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = a3[5];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = type metadata accessor for SnippetHeaderModel(0LL);
  int v15 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v12, 1LL, v14);
  int v16 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v13, 1LL, v14);
  if (!v15)
  {
    if (!v16)
    {
      uint64_t v60 = type metadata accessor for SpeakableString(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 40LL))(v12, v13, v60);
      uint64_t v61 = *(int *)(v14 + 20);
      uint64_t v62 = &v12[v61];
      unint64_t v63 = &v13[v61];
      uint64_t v65 = *(void *)v63;
      uint64_t v64 = *((void *)v63 + 1);
      *(void *)uint64_t v62 = v65;
      *((void *)v62 + 1) = v64;
      swift_bridgeObjectRelease();
      uint64_t v66 = *(int *)(v14 + 24);
      uint64_t v67 = &v12[v66];
      uint64_t v68 = &v13[v66];
      uint64_t v70 = *(void *)v68;
      uint64_t v69 = *((void *)v68 + 1);
      *(void *)uint64_t v67 = v70;
      *((void *)v67 + 1) = v69;
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }

    sub_26F04((uint64_t)v12, type metadata accessor for SnippetHeaderModel);
    goto LABEL_12;
  }

  if (v16)
  {
LABEL_12:
    uint64_t v18 = sub_494C(&qword_18A1A8);
    memcpy(v12, v13, *(void *)(*(void *)(v18 - 8) + 64LL));
    goto LABEL_13;
  }

  uint64_t v17 = type metadata accessor for SpeakableString(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32LL))(v12, v13, v17);
  *(_OWORD *)&v12[*(int *)(v14 + 20)] = *(_OWORD *)&v13[*(int *)(v14 + 20)];
  *(_OWORD *)&v12[*(int *)(v14 + 24)] = *(_OWORD *)&v13[*(int *)(v14 + 24)];
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v12, 0LL, 1LL, v14);
LABEL_13:
  uint64_t v19 = a3[6];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v23 = *(void *)v21;
  uint64_t v22 = *((void *)v21 + 1);
  *(void *)uint64_t v20 = v23;
  *((void *)v20 + 1) = v22;
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[7];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  uint64_t v28 = *(void *)v26;
  uint64_t v27 = *((void *)v26 + 1);
  *(void *)uint64_t v25 = v28;
  *((void *)v25 + 1) = v27;
  swift_bridgeObjectRelease();
  uint64_t v29 = a3[8];
  uint64_t v30 = &a1[v29];
  uint64_t v31 = &a2[v29];
  uint64_t v33 = *(void *)v31;
  uint64_t v32 = *((void *)v31 + 1);
  *(void *)uint64_t v30 = v33;
  *((void *)v30 + 1) = v32;
  swift_bridgeObjectRelease();
  uint64_t v34 = a3[9];
  uint64_t v35 = &a1[v34];
  uint64_t v36 = &a2[v34];
  uint64_t v38 = *(void *)v36;
  uint64_t v37 = *((void *)v36 + 1);
  *(void *)uint64_t v35 = v38;
  *((void *)v35 + 1) = v37;
  swift_bridgeObjectRelease();
  uint64_t v39 = a3[10];
  uint64_t v40 = &a1[v39];
  uint64_t v41 = &a2[v39];
  uint64_t v43 = *(void *)v41;
  uint64_t v42 = *((void *)v41 + 1);
  *(void *)uint64_t v40 = v43;
  *((void *)v40 + 1) = v42;
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  swift_release();
  *(void *)&a1[a3[12]] = *(void *)&a2[a3[12]];
  swift_release();
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  swift_release();
  *(void *)&a1[a3[14]] = *(void *)&a2[a3[14]];
  swift_release();
  uint64_t v44 = a3[15];
  uint64_t v45 = &a1[v44];
  uint64_t v46 = &a2[v44];
  uint64_t v48 = *(void *)v46;
  uint64_t v47 = *((void *)v46 + 1);
  *(void *)uint64_t v45 = v48;
  *((void *)v45 + 1) = v47;
  swift_bridgeObjectRelease();
  uint64_t v49 = a3[16];
  uint64_t v50 = &a1[v49];
  uint64_t v51 = &a2[v49];
  uint64_t v53 = *(void *)v51;
  uint64_t v52 = *((void *)v51 + 1);
  *(void *)uint64_t v50 = v53;
  *((void *)v50 + 1) = v52;
  swift_bridgeObjectRelease();
  uint64_t v54 = a3[17];
  uint64_t v55 = &a1[v54];
  uint64_t v56 = &a2[v54];
  uint64_t v58 = *(void *)v56;
  uint64_t v57 = *((void *)v56 + 1);
  *(void *)uint64_t v55 = v58;
  *((void *)v55 + 1) = v57;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SleepQueryModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_122940);
}

uint64_t sub_122940(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_494C(&qword_18A1A0);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = a1;
    return _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v8, a2, v7);
  }

  uint64_t v9 = sub_494C(&qword_18A1A8);
  if (*(_DWORD *)(*(void *)(v9 - 8) + 84LL) == (_DWORD)a2)
  {
    uint64_t v7 = v9;
    uint64_t v8 = a1 + *(int *)(a3 + 20);
    return _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v8, a2, v7);
  }

  unint64_t v11 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v11 >= 0xFFFFFFFF) {
    LODWORD(v11) = -1;
  }
  int v12 = v11 - 1;
  if (v12 < 0) {
    int v12 = -1;
  }
  return (v12 + 1);
}

uint64_t storeEnumTagSinglePayload for SleepQueryModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_122A04);
}

void sub_122A04(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_494C(&qword_18A1A0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = a1;
LABEL_5:
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v10, a2, a2, v9);
    return;
  }

  uint64_t v11 = sub_494C(&qword_18A1A8);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84LL) == a3)
  {
    uint64_t v9 = v11;
    uint64_t v10 = a1 + *(int *)(a4 + 20);
    goto LABEL_5;
  }

  *(void *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  sub_1EB0C();
}

void sub_122AA4(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v6[0] = *(void *)(v2 - 8) + 64LL;
    sub_27758(319LL, (unint64_t *)&qword_18AB48, type metadata accessor for SnippetHeaderModel);
    if (v5 <= 0x3F)
    {
      v6[1] = *(void *)(v4 - 8) + 64LL;
      v6[2] = &unk_13F9E8;
      v6[3] = &unk_13F9E8;
      v6[4] = &unk_13F9E8;
      v6[5] = &unk_13F9E8;
      v6[6] = &unk_13F9E8;
      v6[7] = &unk_13FA00;
      void v6[8] = &unk_13FA00;
      v6[9] = &unk_13FA00;
      v6[10] = &unk_13FA00;
      v6[11] = &unk_13F9E8;
      v6[12] = &unk_13F9E8;
      v6[13] = &unk_13F9E8;
      swift_initStructMetadata(a1, 256LL, 14LL, v6, a1 + 16);
    }
  }

uint64_t getEnumTagSinglePayload for SleepQueryModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xF3)
  {
    if (a2 + 13 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 13) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }

    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }

    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }

    int v5 = (*a1 | (v4 << 8)) - 14;
    return (v5 + 1);
  }

uint64_t storeEnumTagSinglePayload for SleepQueryModel.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF2) {
    return ((uint64_t (*)(void))((char *)&loc_122C44 + 4 * byte_13F933[v4]))();
  }
  *a1 = a2 + 13;
  return ((uint64_t (*)(void))((char *)sub_122C78 + 4 * byte_13F92E[v4]))();
}

uint64_t sub_122C78(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_122C80(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x122C88LL);
  }
  return result;
}

uint64_t sub_122C94(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x122C9CLL);
  }
  *(_BYTE *)unint64_t result = a2 + 13;
  return result;
}

uint64_t sub_122CA0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_122CA8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SleepQueryModel.CodingKeys()
{
  return &type metadata for SleepQueryModel.CodingKeys;
}

unint64_t sub_122CC8()
{
  unint64_t result = qword_1907E0;
  if (!qword_1907E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_13FAB4, &type metadata for SleepQueryModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1907E0);
  }

  return result;
}

unint64_t sub_122D08()
{
  unint64_t result = qword_1907E8;
  if (!qword_1907E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_13FA24, &type metadata for SleepQueryModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1907E8);
  }

  return result;
}

unint64_t sub_122D48()
{
  unint64_t result = qword_1907F0;
  if (!qword_1907F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_13FA4C, &type metadata for SleepQueryModel.CodingKeys);
    atomic_store(result, &qword_1907F0);
  }

  return result;
}

uint64_t sub_122D84()
{
  return type metadata accessor for SleepQueryModel(0LL);
}

uint64_t sub_122D8C()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v2 - 72, v2 - 81, v0, v1);
}

uint64_t sub_122DAC@<X0>(char a1@<W8>)
{
  *(_BYTE *)(v2 - 72) = a1;
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v2 - 72, v1);
}

uint64_t sub_122DC0@<X0>(char a1@<W8>)
{
  *(_BYTE *)(v1 - 72) = a1;
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v1 - 72, *(void *)(v1 - 136));
}

uint64_t sub_122DD8()
{
  return v0;
}

uint64_t sub_122DF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(a1, a2, a3, a4);
}

uint64_t sub_122DF8@<X0>(uint64_t a1@<X8>)
{
  return swift_bridgeObjectRelease(*(void *)(*(void *)(a1 - 256) + 8LL));
}

uint64_t sub_122E04()
{
  return swift_release(*(void *)(v0 + v1));
}

  ;
}

void sub_122E18(uint64_t a1@<X8>)
{
  *(void *)(v2 - 72) = *(void *)(v1 + a1);
}

uint64_t sub_122E24(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 48) = a2;
  *(void *)(v3 + sub_D7EC(v0 + 16, v0 + 56) = a3;
  *(_BYTE *)(v3 + 160) = a1;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  *(void *)(v3 + 64) = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  *(void *)(v3 + 72) = v5;
  *(void *)(v3 + 80) = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_122E7C(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(v1 + 160);
  if (((1 << (v2 - 89)) & 0x44181) != 0)
  {
LABEL_13:
    uint64_t v19 = (void *)swift_task_alloc(dword_190844);
    *(void *)(v1 + 88) = v19;
    *uint64_t v19 = v1;
    v19[1] = sub_123260;
    sub_125D18();
    return sub_123E94(v20, v21, v22);
  }

  if (v2 != 105)
  {
LABEL_14:
    switch(*(_BYTE *)(v1 + 160))
    {
      case 0x93:
        uint64_t v24 = (void *)swift_task_alloc(dword_190834);
        *(void *)(v1 + 104) = v24;
        sub_125D90(v24, (uint64_t)sub_1232C0);
        sub_125D18();
        return sub_123544(v25, v26);
      case 0x94:
      case 0x95:
      case 0x98:
      case 0x99:
      case 0x9A:
        goto LABEL_10;
      case 0x96:
        uint64_t v30 = (void *)swift_task_alloc(dword_19082C);
        *(void *)(v1 + 112) = v30;
        sub_125D90(v30, (uint64_t)sub_1232F0);
        sub_125D18();
        return sub_12361C(v31, v32);
      case 0x97:
        uint64_t v33 = (void *)swift_task_alloc(dword_190824);
        *(void *)(v1 + 120) = v33;
        sub_125D90(v33, (uint64_t)sub_123320);
        sub_125D18();
        return sub_1236F4(v34, v35);
      case 0x9B:
        uint64_t v36 = (void *)swift_task_alloc(dword_19081C);
        *(void *)(v1 + 128) = v36;
        sub_125D90(v36, (uint64_t)sub_123350);
        sub_125D18();
        return sub_1237CC(v37, v38);
      default:
        switch(v2)
        {
          case 159:
            goto LABEL_13;
          case 162:
            uint64_t v39 = (void *)swift_task_alloc(dword_190814);
            *(void *)(v1 + 136) = v39;
            sub_125D90(v39, (uint64_t)sub_123380);
            sub_125D18();
            return sub_1239A8(v40, v41);
          case 170:
            uint64_t v42 = (void *)swift_task_alloc(dword_19080C);
            *(void *)(v1 + 144) = v42;
            sub_125D90(v42, (uint64_t)sub_1233B0);
            sub_125D18();
            return sub_123D10(v43, v44);
          case 173:
            uint64_t v45 = (void *)swift_task_alloc(dword_190804);
            *(void *)(v1 + 152) = v45;
            sub_125D90(v45, (uint64_t)sub_1233E0);
            sub_125D18();
            return sub_123DBC(v46, v47);
        }

        if (v2 != 174 && v2 != 189 && v2 != 184)
        {
LABEL_10:
          uint64_t v4 = *(void *)(v1 + 72);
          uint64_t v3 = *(void *)(v1 + 80);
          uint64_t v5 = *(void *)(v1 + 64);
          uint64_t v6 = Logger.wellness.unsafeMutableAddressor(a1);
          swift_beginAccess(v6, v1 + 16, 0LL, 0LL);
          uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
          uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
          os_log_type_t v9 = static os_log_type_t.error.getter();
          BOOL v10 = os_log_type_enabled(v8, v9);
          uint64_t v12 = *(void *)(v1 + 72);
          uint64_t v11 = *(void *)(v1 + 80);
          uint64_t v13 = *(void *)(v1 + 64);
          if (v10)
          {
            unsigned __int8 v14 = *(_BYTE *)(v1 + 160);
            int v15 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
            uint64_t v16 = swift_slowAlloc(32LL, -1LL);
            uint64_t v49 = v16;
            *(_DWORD *)int v15 = 136315138;
            uint64_t v17 = sub_27CC8(v14);
            *(void *)(v1 + 40) = sub_39178(v17, v18, &v49);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 40, v1 + 48, v15 + 4, v15 + 12);
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_0, v8, v9, "No pattern implemented for %s", v15, 0xCu);
            swift_arrayDestroy(v16, 1LL);
            sub_5050(v16);
            sub_5050((uint64_t)v15);
          }

          else
          {
          }

          (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
          swift_task_dealloc(*(void *)(v1 + 80));
          sub_125D18();
          __asm { BR              X1 }
        }

        return result;
    }

    goto LABEL_13;
  }

  uint64_t v27 = (void *)swift_task_alloc(dword_19083C);
  *(void *)(v1 + 96) = v27;
  sub_125D90(v27, (uint64_t)sub_123290);
  sub_125D18();
  return sub_123410(v28, v29);
}

uint64_t sub_123260()
{
  uint64_t v2 = sub_565DC();
  return sub_55F88(v2, v3);
}

uint64_t sub_123290()
{
  uint64_t v2 = sub_565DC();
  return sub_55F88(v2, v3);
}

uint64_t sub_1232C0()
{
  uint64_t v2 = sub_565DC();
  return sub_55F88(v2, v3);
}

uint64_t sub_1232F0()
{
  uint64_t v2 = sub_565DC();
  return sub_55F88(v2, v3);
}

uint64_t sub_123320()
{
  uint64_t v2 = sub_565DC();
  return sub_55F88(v2, v3);
}

uint64_t sub_123350()
{
  uint64_t v2 = sub_565DC();
  return sub_55F88(v2, v3);
}

uint64_t sub_123380()
{
  uint64_t v2 = sub_565DC();
  return sub_55F88(v2, v3);
}

uint64_t sub_1233B0()
{
  uint64_t v2 = sub_565DC();
  return sub_55F88(v2, v3);
}

uint64_t sub_1233E0()
{
  uint64_t v2 = sub_565DC();
  return sub_55F88(v2, v3);
}

uint64_t sub_123410(uint64_t a1, uint64_t a2)
{
  v2[7] = a1;
  v2[8] = a2;
  uint64_t v3 = sub_494C(&qword_189BA0);
  v2[9] = sub_36390(v3);
  uint64_t v4 = sub_494C(&qword_189CF8);
  v2[10] = sub_36390(v4);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_123464()
{
  uint64_t v1 = sub_125D68();
  sub_125D7C(v1);
  uint64_t v2 = sub_5687C(105LL);
  sub_56860(v2, &qword_189BA0);
  sub_125E04();
  uint64_t v3 = sub_125D34();
  sub_125DA4(v3);
  uint64_t v4 = (void *)swift_task_alloc(dword_18EC4C);
  *(void *)(v0 + 96) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1234F0;
  sub_9950C();
  return sub_E2548(v5, v6);
}

uint64_t sub_1234F0()
{
  if (v1) {
    sub_36860();
  }
  else {
    *(void *)(v2 + 104) = v0;
  }
  sub_A7C8();
  sub_A964();
  return sub_55F28(v3, v4, v5);
}

uint64_t sub_123544(uint64_t a1, uint64_t a2)
{
  v2[7] = a1;
  v2[8] = a2;
  uint64_t v3 = sub_494C(&qword_189BA0);
  v2[9] = sub_36390(v3);
  uint64_t v4 = sub_494C(&qword_189CF8);
  v2[10] = sub_36390(v4);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_123598()
{
  uint64_t v1 = sub_125D68();
  sub_125D7C(v1);
  uint64_t v2 = sub_5687C(147LL);
  sub_56860(v2, &qword_189BA0);
  sub_125E04();
  uint64_t v3 = sub_125D34();
  sub_125DA4(v3);
  uint64_t v4 = (void *)swift_task_alloc(dword_18EC0C);
  *(void *)(v0 + 96) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1234F0;
  sub_125F08();
  sub_9950C();
  return sub_E0B70(v5, v6, v7);
}

uint64_t sub_12361C(uint64_t a1, uint64_t a2)
{
  v2[7] = a1;
  v2[8] = a2;
  uint64_t v3 = sub_494C(&qword_189BA0);
  v2[9] = sub_36390(v3);
  uint64_t v4 = sub_494C(&qword_189CF8);
  v2[10] = sub_36390(v4);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_123670()
{
  uint64_t v1 = sub_125D68();
  sub_125D7C(v1);
  uint64_t v2 = sub_5687C(150LL);
  sub_56860(v2, &qword_189BA0);
  sub_125E04();
  uint64_t v3 = sub_125D34();
  sub_125DA4(v3);
  uint64_t v4 = (void *)swift_task_alloc(dword_18EC14);
  *(void *)(v0 + 96) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1234F0;
  sub_125F08();
  sub_9950C();
  return sub_E0CE4(v5, v6, v7);
}

uint64_t sub_1236F4(uint64_t a1, uint64_t a2)
{
  v2[7] = a1;
  v2[8] = a2;
  uint64_t v3 = sub_494C(&qword_189BA0);
  v2[9] = sub_36390(v3);
  uint64_t v4 = sub_494C(&qword_189CF8);
  v2[10] = sub_36390(v4);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_123748()
{
  uint64_t v1 = sub_125D68();
  sub_125D7C(v1);
  uint64_t v2 = sub_5687C(151LL);
  sub_56860(v2, &qword_189BA0);
  sub_125E04();
  uint64_t v3 = sub_125D34();
  sub_125DA4(v3);
  uint64_t v4 = (void *)swift_task_alloc(dword_18EC1C);
  *(void *)(v0 + 96) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1234F0;
  sub_125F08();
  sub_9950C();
  return sub_E0E50(v5, v6, v7);
}

uint64_t sub_1237CC(uint64_t a1, uint64_t a2)
{
  v2[7] = a1;
  v2[8] = a2;
  uint64_t v3 = sub_494C(&qword_189BA0);
  v2[9] = sub_36390(v3);
  uint64_t v4 = sub_494C(&qword_189CF8);
  v2[10] = sub_36390(v4);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_123820()
{
  uint64_t v1 = sub_125D68();
  sub_125D7C(v1);
  uint64_t v2 = sub_5687C(155LL);
  sub_56860(v2, &qword_189BA0);
  sub_125E04();
  uint64_t v3 = sub_125D34();
  sub_125DA4(v3);
  uint64_t v4 = (void *)swift_task_alloc(dword_18EC24);
  *(void *)(v0 + 96) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1238A4;
  sub_125F08();
  sub_9950C();
  return sub_E0FBC(v5, v6, v7);
}

uint64_t sub_1238A4()
{
  if (v1) {
    sub_36860();
  }
  else {
    *(void *)(v2 + 104) = v0;
  }
  sub_A7C8();
  sub_A964();
  return sub_55F28(v3, v4, v5);
}

uint64_t sub_1238F8(uint64_t a1)
{
  uint64_t v2 = sub_59B14();
  return sub_73380(v2, v3);
}

uint64_t sub_12394C(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 80);
  sub_56628(a1, &qword_189CF8);
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0((void *)(v1 + 16));
  swift_task_dealloc(v2);
  sub_A7C8();
  return (*(uint64_t (**)(void))(v1 + 8))(0LL);
}

uint64_t sub_1239A8(uint64_t a1, uint64_t a2)
{
  v2[7] = a1;
  v2[8] = a2;
  uint64_t v3 = sub_494C(&qword_189D00);
  v2[9] = sub_36390(v3);
  uint64_t v4 = sub_494C(&qword_189BA0);
  v2[10] = sub_36390(v4);
  uint64_t v5 = sub_494C(&qword_189CF8);
  v2[11] = sub_36390(v5);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_123A10()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = sub_ABEC();
  uint64_t v3 = 1LL;
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v1, 1LL, 1LL, v2);
  uint64_t v4 = sub_5687C(162LL);
  sub_56860(v4, &qword_189BA0);
  uint64_t v5 = sub_126108();
  sub_10A39C(v5, v6);
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  if (v10)
  {
    String.toSpeakableString.getter(v8, v10);
    sub_2A184();
    uint64_t v3 = 0LL;
  }

  uint64_t v11 = v0[11];
  uint64_t v13 = v0[8];
  uint64_t v12 = v0[9];
  unsigned __int8 v14 = (void *)v0[7];
  uint64_t v15 = sub_ABF4();
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v12, v3, 1LL, v15);
  uint64_t v16 = type metadata accessor for DialogPersonHeight.Builder(0LL);
  sub_A72C(v16);
  DialogPersonHeight.Builder.init()();
  [v14 doubleValue];
  dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)(v17, 0LL);
  sub_3652C();
  dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)(v12);
  uint64_t v18 = sub_126110();
  uint64_t v19 = dispatch thunk of DialogAbstractMeasurement.Builder.build()(v18);
  v0[12] = v19;
  sub_3652C();
  sub_D7EC(v13 + 80, (uint64_t)(v0 + 2));
  sub_500C(v0 + 2, v0[5]);
  char v20 = (void *)swift_task_alloc(48LL);
  v0[13] = v20;
  v20[2] = v19;
  v20[3] = v14;
  v20[4] = v11;
  uint64_t v21 = (void *)swift_task_alloc(dword_18EC2C);
  v0[14] = v21;
  void *v21 = v0;
  v21[1] = sub_123BAC;
  return sub_E13D4((uint64_t)sub_125CB8, (uint64_t)v20);
}

uint64_t sub_123BAC(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v9 = v4;
  sub_59AF4(*(void *)(v4 + 112), &v9);
  if (v1) {
    sub_36860();
  }
  else {
    *(void *)(v4 + 120) = a1;
  }
  sub_A7C8();
  sub_A964();
  return sub_55F28(v5, v6, v7);
}

uint64_t sub_123C14()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = sub_2012C(v1, &qword_189D00);
  sub_56860(v2, &qword_189CF8);
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0((void *)(v0 + 16));
  sub_A7C8();
  sub_A760();
  swift_task_dealloc(v1);
  uint64_t v3 = sub_59B14();
  return v4(v3);
}

uint64_t sub_123C98()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = sub_2012C(*(void *)(v0 + 72), &qword_189D00);
  sub_56628(v2, &qword_189CF8);
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0((void *)(v0 + 16));
  swift_task_dealloc(v1);
  sub_A7C8();
  sub_A760();
  return sub_73380(0LL, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_123D10(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return sub_5F0F0((uint64_t)sub_123D20);
}

uint64_t sub_123D20()
{
  uint64_t v2 = *sub_500C((void *)(v1[3] + 80), *(void *)(v1[3] + 104));
  sub_1260B8();
  uint64_t v3 = (uint64_t **)swift_task_alloc(v0);
  void v1[4] = (uint64_t)v3;
  *uint64_t v3 = v1;
  v3[1] = (uint64_t *)sub_123D8C;
  return sub_125F40(v2, 170LL, v1[2], v5);
}

uint64_t sub_123D8C()
{
  if (v0) {
    sub_36860();
  }
  uint64_t v1 = sub_59B14();
  return sub_55F88(v1, v2);
}

uint64_t sub_123DBC(uint64_t a1, uint64_t a2)
{
  v2[7] = a1;
  v2[8] = a2;
  uint64_t v3 = sub_494C(&qword_189BA0);
  v2[9] = sub_36390(v3);
  uint64_t v4 = sub_494C(&qword_189CF8);
  v2[10] = sub_36390(v4);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_123E10()
{
  uint64_t v1 = sub_125D68();
  sub_125D7C(v1);
  uint64_t v2 = sub_5687C(173LL);
  sub_56860(v2, &qword_189BA0);
  sub_125E04();
  uint64_t v3 = sub_125D34();
  sub_125DA4(v3);
  uint64_t v4 = (void *)swift_task_alloc(dword_18EC3C);
  *(void *)(v0 + 96) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1234F0;
  sub_125F08();
  sub_9950C();
  return sub_E1F10(v5, v6, v7);
}

uint64_t sub_123E94(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  *(_BYTE *)(v3 + 40) = a1;
  return sub_5F0F0((uint64_t)sub_123EA8);
}

uint64_t sub_123EA8()
{
  uint64_t v2 = *sub_500C((void *)(*(void *)(v1 + 24) + 80LL), *(void *)(*(void *)(v1 + 24) + 104LL));
  sub_1260B8();
  uint64_t v3 = (void *)swift_task_alloc(v0);
  *(void *)(v1 + 32) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_123D8C;
  return sub_125F40(v2, *(unsigned __int8 *)(v1 + 40), *(void *)(v1 + 16), v5);
}

void sub_123F14()
{
  uint64_t v2 = v1;
  uint64_t v87 = v3;
  char v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = sub_125F18(__stack_chk_guard);
  uint64_t v85 = *(void *)(v10 - 8);
  uint64_t v86 = v10;
  sub_D978();
  __chkstk_darwin(v11);
  uint64_t v84 = (char *)&v82 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_494C(&qword_189CF8);
  sub_6D20();
  __chkstk_darwin(v13);
  uint64_t v15 = sub_125EE8(v14, v82);
  uint64_t v83 = *(void *)(v15 - 8);
  sub_D978();
  __chkstk_darwin(v16);
  sub_125DBC(v17, v82);
  sub_494C(&qword_189CE8);
  sub_6D20();
  __chkstk_darwin(v18);
  sub_DE7AC();
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v82 - v20;
  sub_494C(&qword_189D00);
  sub_6D20();
  __chkstk_darwin(v22);
  sub_125F94(v23, v82);
  uint64_t v25 = __chkstk_darwin(v24);
  uint64_t v27 = (char *)&v82 - v26;
  __chkstk_darwin(v25);
  uint64_t v29 = (char *)&v82 - v28;
  uint64_t v30 = sub_27CC8(v7);
  String.toSpeakableString.getter(v30, v31);
  swift_bridgeObjectRelease();
  uint64_t v32 = 1LL;
  uint64_t v88 = sub_ABF4();
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v29, 0LL, 1LL, v88);
  uint64_t v33 = (int *)v2(0LL);
  sub_A384((uint64_t)v29, v9 + v33[6]);
  [v5 doubleValue];
  double v35 = v34;
  uint64_t v36 = sub_57DD0(v5);
  double v38 = sub_90668(v36, v37, v7, v35);
  swift_bridgeObjectRelease();
  uint64_t v39 = v9 + v33[10];
  *(double *)uint64_t v39 = v38;
  *(_BYTE *)(v39 + 8) = 0;
  uint64_t v40 = sub_57DD0(v5);
  if (v41)
  {
    uint64_t v7 = v41;
    String.toSpeakableString.getter(v40, v41);
    swift_bridgeObjectRelease();
    uint64_t v32 = 0LL;
  }

  uint64_t v42 = 1LL;
  sub_125F5C((uint64_t)v27, v32);
  sub_A384((uint64_t)v27, v9 + v33[9]);
  uint64_t v43 = sub_126174();
  sub_A72C(v43);
  sub_12618C();
  id v44 = [v5 start];
  if (v44)
  {
    sub_126264((uint64_t)v44);

    uint64_t v42 = 0LL;
  }

  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v0, v42, 1LL, v15);
  sub_126194();
  uint64_t v45 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v21, 1LL, v15);
  if ((_DWORD)v45)
  {
    sub_56860(v45, &qword_189CE8);
    uint64_t v46 = 0LL;
  }

  else
  {
    uint64_t v47 = v82;
    uint64_t v0 = v83;
    uint64_t v48 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v83 + 16))(v82, v21, v15);
    uint64_t v49 = sub_56860(v48, &qword_189CE8);
    double v50 = Date.timeIntervalSince1970.getter(v49);
    (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v47, v15);
    uint64_t v46 = *(void *)&v50;
  }

  sub_1260CC(v46);
  uint64_t v51 = sub_126110();
  uint64_t v52 = dispatch thunk of DialogCalendar.Builder.build()(v51);
  sub_3652C();
  uint64_t v53 = v33[7];
  swift_release();
  *(void *)(v9 + v53) = v52;
  sub_35468(v87, v0);
  uint64_t v54 = sub_3C798();
  uint64_t v55 = sub_1261F0(v54);
  if (v56)
  {
    sub_125EC0(v55, &qword_189CF8);
    sub_125F5C(v15, 1LL);
  }

  else
  {
    id v57 = [objc_allocWithZone(SAUIAppPunchOut) init];
    URL._bridgeToObjectiveC()(v58);
    uint64_t v60 = v59;
    [v57 setPunchOutUri:v59];

    id v61 = v57;
    uint64_t v62 = v84;
    uint64_t v63 = UUID.init()();
    uint64_t v64 = UUID.uuidString.getter(v63);
    uint64_t v66 = v65;
    (*(void (**)(char *, uint64_t))(v85 + 8))(v62, v86);
    sub_125B84(v64, v66, v61);

    id v68 = sub_373D8(v67, "dictionary");
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = (void *)objc_opt_self(&OBJC_CLASS___NSPropertyListSerialization);
      uint64_t v89 = 0LL;
      id v71 = sub_125DD8(v70, "dataWithPropertyList:format:options:error:");
      id v72 = sub_12612C();
      if (v71)
      {
        uint64_t v73 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v71);
        unint64_t v75 = v74;

        Swift::String v76 = Data.base64EncodedString(options:)(0LL);
        sub_56A24(v76._countAndFlagsBits, (uint64_t)v76._object);

        sub_A3CC(v73, v75);
        swift_bridgeObjectRelease();
        uint64_t v77 = v15;
        uint64_t v78 = 0LL;
      }

      else
      {
        uint64_t v79 = v72;
        uint64_t v80 = _convertNSErrorToError(_:)();

        swift_willThrow(v81);
        swift_errorRelease(v80);
        uint64_t v77 = v15;
        uint64_t v78 = 1LL;
      }

      sub_125F5C(v77, v78);
    }

    else
    {
      sub_125F5C(v15, 1LL);
    }

    sub_1260F4();
  }

  sub_A384(v15, v9);
  sub_A744();
}

void sub_1243E8()
{
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_125F18(__stack_chk_guard);
  v61[3] = *(void *)(v5 - 8);
  v61[4] = v5;
  sub_D978();
  __chkstk_darwin(v6);
  sub_125DBC(v7, v61[0]);
  sub_494C(&qword_189BA0);
  sub_6D20();
  __chkstk_darwin(v8);
  sub_126014(v9, v61[0]);
  sub_494C(&qword_189CF8);
  sub_6D20();
  __chkstk_darwin(v10);
  uint64_t v12 = sub_125EC8(v11, v61[0]);
  v61[1] = *(void *)(v12 - 8);
  sub_D978();
  __chkstk_darwin(v13);
  sub_125E10(v14, v61[0]);
  sub_494C(&qword_189CE8);
  sub_6D20();
  __chkstk_darwin(v15);
  sub_72E90();
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)v61 - v17;
  sub_494C(&qword_189D00);
  sub_6D20();
  __chkstk_darwin(v19);
  sub_125FB4(v20, v61[0]);
  __chkstk_darwin(v21);
  sub_FB534();
  __chkstk_darwin(v22);
  uint64_t v23 = sub_1260E0();
  sub_1261A0(v23, v24);
  swift_bridgeObjectRelease();
  uint64_t v25 = sub_ABF4();
  uint64_t v26 = sub_125F68(v25);
  sub_1260A4(v26);
  [v2 doubleValue];
  uint64_t v27 = sub_126108();
  double v29 = sub_126084(v27, v28);
  sub_2A184();
  uint64_t v30 = sub_125F24();
  if (v31)
  {
    sub_126228(v30, v31);
    sub_2A184();
  }

  sub_125E2C();
  uint64_t v32 = sub_126174();
  sub_A72C(v32);
  uint64_t v33 = sub_12618C();
  id v34 = sub_373D8(v33, "start");
  if (v34)
  {
    sub_12624C((uint64_t)v34);
  }

  sub_125FD4();
  uint64_t v35 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v18, 1LL, v12);
  if ((_DWORD)v35)
  {
    sub_125EC0(v35, &qword_189CE8);
    uint64_t v36 = 0LL;
  }

  else
  {
    uint64_t v37 = sub_125FFC();
    uint64_t v38 = sub_125EC0(v37, &qword_189CE8);
    Date.timeIntervalSince1970.getter(v38);
    sub_12605C();
    uint64_t v36 = *(void *)&v29;
  }

  sub_126164(v36);
  uint64_t v39 = sub_126258();
  uint64_t v40 = (void *)dispatch thunk of DialogCalendar.Builder.build()(v39);
  sub_3652C();
  sub_126154();
  *(void *)&v0[v4] = v40;
  uint64_t v41 = sub_ABEC();
  uint64_t v42 = sub_125E8C(v41);
  sub_56628(v42, &qword_189BA0);
  uint64_t v43 = sub_3C798();
  uint64_t v44 = sub_1261AC(v43);
  if (v45)
  {
    sub_125EC0(v44, &qword_189CF8);
    sub_125F50(v62, 1LL);
  }

  else
  {
    [objc_allocWithZone(SAUIAppPunchOut) init];
    sub_126050(v46);
    uint64_t v48 = (void *)v47;
    sub_126030(v47, "setPunchOutUri:");

    id v49 = v40;
    sub_126098();
    sub_126214();
    sub_125DEC();
    sub_12611C();

    id v50 = [v49 dictionary];
    uint64_t v51 = v62;
    if (v50)
    {
      uint64_t v52 = v50;
      uint64_t v53 = (void *)objc_opt_self(&OBJC_CLASS___NSPropertyListSerialization);
      uint64_t v63 = 0LL;
      id v54 = sub_125DD8(v53, "dataWithPropertyList:format:options:error:");
      id v55 = sub_12612C();
      if (v54)
      {
        static Data._unconditionallyBridgeFromObjectiveC(_:)(v54);
        sub_1261E4();
        uint64_t v56 = sub_12617C();
        sub_12621C(v56, v57);

        sub_126234();
        sub_2A184();
        uint64_t v58 = v51;
        uint64_t v59 = 0LL;
      }

      else
      {
        uint64_t v60 = v55;
        _convertNSErrorToError(_:)();

        sub_1261DC();
        sub_A604();
        uint64_t v58 = v51;
        uint64_t v59 = 1LL;
      }

      sub_125F50(v58, v59);
    }

    else
    {
      sub_126134();
    }

    sub_126070();
  }

  sub_1261D0();
  sub_A744();
}

void sub_12477C()
{
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_125F18(__stack_chk_guard);
  v61[3] = *(void *)(v5 - 8);
  v61[4] = v5;
  sub_D978();
  __chkstk_darwin(v6);
  sub_125DBC(v7, v61[0]);
  sub_494C(&qword_189BA0);
  sub_6D20();
  __chkstk_darwin(v8);
  sub_126014(v9, v61[0]);
  sub_494C(&qword_189CF8);
  sub_6D20();
  __chkstk_darwin(v10);
  uint64_t v12 = sub_125EC8(v11, v61[0]);
  v61[1] = *(void *)(v12 - 8);
  sub_D978();
  __chkstk_darwin(v13);
  sub_125E10(v14, v61[0]);
  sub_494C(&qword_189CE8);
  sub_6D20();
  __chkstk_darwin(v15);
  sub_72E90();
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)v61 - v17;
  sub_494C(&qword_189D00);
  sub_6D20();
  __chkstk_darwin(v19);
  sub_125FB4(v20, v61[0]);
  __chkstk_darwin(v21);
  sub_FB534();
  __chkstk_darwin(v22);
  uint64_t v23 = sub_1260E0();
  sub_1261A0(v23, v24);
  swift_bridgeObjectRelease();
  uint64_t v25 = sub_ABF4();
  uint64_t v26 = sub_125F68(v25);
  sub_1260A4(v26);
  [v2 doubleValue];
  uint64_t v27 = sub_126108();
  double v29 = sub_126084(v27, v28);
  sub_2A184();
  uint64_t v30 = sub_125F24();
  if (v31)
  {
    sub_126228(v30, v31);
    sub_2A184();
  }

  sub_125E2C();
  uint64_t v32 = sub_126174();
  sub_A72C(v32);
  uint64_t v33 = sub_12618C();
  id v34 = sub_373D8(v33, "start");
  if (v34)
  {
    sub_12624C((uint64_t)v34);
  }

  sub_125FD4();
  uint64_t v35 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v18, 1LL, v12);
  if ((_DWORD)v35)
  {
    sub_125EC0(v35, &qword_189CE8);
    uint64_t v36 = 0LL;
  }

  else
  {
    uint64_t v37 = sub_125FFC();
    uint64_t v38 = sub_125EC0(v37, &qword_189CE8);
    Date.timeIntervalSince1970.getter(v38);
    sub_12605C();
    uint64_t v36 = *(void *)&v29;
  }

  sub_126164(v36);
  uint64_t v39 = sub_126258();
  uint64_t v40 = (void *)dispatch thunk of DialogCalendar.Builder.build()(v39);
  sub_3652C();
  sub_126154();
  *(void *)&v0[v4] = v40;
  uint64_t v41 = sub_ABEC();
  uint64_t v42 = sub_125E8C(v41);
  sub_56628(v42, &qword_189BA0);
  uint64_t v43 = sub_3C798();
  uint64_t v44 = sub_1261AC(v43);
  if (v45)
  {
    sub_125EC0(v44, &qword_189CF8);
    sub_125F50(v62, 1LL);
  }

  else
  {
    [objc_allocWithZone(SAUIAppPunchOut) init];
    sub_126050(v46);
    uint64_t v48 = (void *)v47;
    sub_126030(v47, "setPunchOutUri:");

    id v49 = v40;
    sub_126098();
    sub_126214();
    sub_125DEC();
    sub_12611C();

    id v50 = [v49 dictionary];
    uint64_t v51 = v62;
    if (v50)
    {
      uint64_t v52 = v50;
      uint64_t v53 = (void *)objc_opt_self(&OBJC_CLASS___NSPropertyListSerialization);
      uint64_t v63 = 0LL;
      id v54 = sub_125DD8(v53, "dataWithPropertyList:format:options:error:");
      id v55 = sub_12612C();
      if (v54)
      {
        static Data._unconditionallyBridgeFromObjectiveC(_:)(v54);
        sub_1261E4();
        uint64_t v56 = sub_12617C();
        sub_12621C(v56, v57);

        sub_126234();
        sub_2A184();
        uint64_t v58 = v51;
        uint64_t v59 = 0LL;
      }

      else
      {
        uint64_t v60 = v55;
        _convertNSErrorToError(_:)();

        sub_1261DC();
        sub_A604();
        uint64_t v58 = v51;
        uint64_t v59 = 1LL;
      }

      sub_125F50(v58, v59);
    }

    else
    {
      sub_126134();
    }

    sub_126070();
  }

  sub_1261D0();
  sub_A744();
}

uint64_t sub_124B08(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v80 = a4;
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v78 = *(void *)(v7 - 8);
  uint64_t v79 = v7;
  __chkstk_darwin(v7);
  uint64_t v77 = (char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_494C(&qword_189CF8);
  __chkstk_darwin(v9);
  uint64_t v82 = (uint64_t)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for Date(0LL);
  uint64_t v76 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  unint64_t v75 = (char *)&v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_494C(&qword_189CE8);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v75 - v17;
  uint64_t v19 = sub_494C(&qword_189D00);
  uint64_t v20 = __chkstk_darwin(v19);
  uint64_t v81 = (char *)&v75 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v75 - v22;
  uint64_t v24 = (int *)type metadata accessor for WellnessLoggingHeightParameters(0LL);
  uint64_t v25 = v24[7];
  swift_retain();
  swift_release();
  uint64_t v83 = a1;
  *(void *)(a1 + v25) = a2;
  uint64_t v26 = sub_57DD0(a3);
  if (v27)
  {
    String.toSpeakableString.getter(v26, v27);
    swift_bridgeObjectRelease();
    uint64_t v28 = type metadata accessor for SpeakableString(0LL);
    uint64_t v29 = 0LL;
  }

  else
  {
    uint64_t v28 = type metadata accessor for SpeakableString(0LL);
    uint64_t v29 = 1LL;
  }

  uint64_t v30 = 1LL;
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v23, v29, 1LL, v28);
  sub_A384((uint64_t)v23, v83 + v24[9]);
  uint64_t v31 = type metadata accessor for DialogCalendar.Builder(0LL);
  swift_allocObject(v31, *(unsigned int *)(v31 + 48), *(unsigned __int16 *)(v31 + 52));
  DialogCalendar.Builder.init()();
  id v32 = [a3 start];
  if (v32)
  {
    uint64_t v33 = v32;
    static Date._unconditionallyBridgeFromObjectiveC(_:)(v32);

    uint64_t v30 = 0LL;
  }

  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v16, v30, 1LL, v11);
  sub_125BD4((uint64_t)v16, (uint64_t)v18);
  int v34 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v18, 1LL, v11);
  if (v34)
  {
    sub_2012C((uint64_t)v18, &qword_189CE8);
    double v35 = 0.0;
  }

  else
  {
    uint64_t v37 = v75;
    uint64_t v36 = v76;
    (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v75, v18, v11);
    uint64_t v38 = sub_2012C((uint64_t)v18, &qword_189CE8);
    double v39 = Date.timeIntervalSince1970.getter(v38);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v11);
    double v35 = v39;
  }

  uint64_t v40 = (uint64_t)v81;
  dispatch thunk of DialogCalendar.Builder.withSecs(_:)(*(void *)&v35, v34 != 0);
  uint64_t v41 = swift_release();
  uint64_t v42 = dispatch thunk of DialogCalendar.Builder.build()(v41);
  swift_release();
  uint64_t v43 = v24[8];
  uint64_t v44 = v83;
  swift_release();
  *(void *)(v44 + v43) = v42;
  uint64_t v45 = v82;
  sub_35468(v80, v82);
  uint64_t v46 = type metadata accessor for URL(0LL);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v45, 1LL, v46) == 1)
  {
    sub_2012C(v45, &qword_189CF8);
    uint64_t v47 = type metadata accessor for SpeakableString(0LL);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v40, 1LL, 1LL, v47);
  }

  else
  {
    id v48 = [objc_allocWithZone(SAUIAppPunchOut) init];
    URL._bridgeToObjectiveC()(v49);
    uint64_t v51 = v50;
    [v48 setPunchOutUri:v50];

    id v52 = v48;
    uint64_t v53 = v77;
    uint64_t v54 = UUID.init()();
    uint64_t v55 = UUID.uuidString.getter(v54);
    uint64_t v57 = v56;
    (*(void (**)(char *, uint64_t))(v78 + 8))(v53, v79);
    sub_125B84(v55, v57, v52);

    id v58 = [v52 dictionary];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = (void *)objc_opt_self(&OBJC_CLASS___NSPropertyListSerialization);
      id v84 = 0LL;
      id v61 = [v60 dataWithPropertyList:v59 format:200 options:0 error:&v84];
      id v62 = v84;
      if (v61)
      {
        uint64_t v63 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v61);
        unint64_t v65 = v64;

        Swift::String v66 = Data.base64EncodedString(options:)(0LL);
        String.toSpeakableString.getter(v66._countAndFlagsBits, v66._object);

        sub_A3CC(v63, v65);
        swift_bridgeObjectRelease();
        uint64_t v67 = type metadata accessor for SpeakableString(0LL);
        uint64_t v68 = v40;
        uint64_t v69 = 0LL;
      }

      else
      {
        id v71 = v62;
        uint64_t v72 = _convertNSErrorToError(_:)();

        swift_willThrow(v73);
        swift_errorRelease(v72);
        uint64_t v67 = type metadata accessor for SpeakableString(0LL);
        uint64_t v68 = v40;
        uint64_t v69 = 1LL;
      }

      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v68, v69, 1LL, v67);
    }

    else
    {
      uint64_t v70 = type metadata accessor for SpeakableString(0LL);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v40, 1LL, 1LL, v70);
    }

    (*(void (**)(uint64_t, uint64_t))(*(void *)(v46 - 8) + 8LL))(v45, v46);
  }

  return sub_A384(v40, v83);
}

void sub_1250E4()
{
  uint64_t v82 = v2;
  uint64_t v4 = v3;
  uint64_t v80 = v5;
  uint64_t v7 = v6;
  unsigned __int8 v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = sub_125F18(__stack_chk_guard);
  uint64_t v77 = *(void *)(v12 - 8);
  uint64_t v78 = v12;
  sub_D978();
  __chkstk_darwin(v13);
  sub_125DBC(v14, v75);
  sub_494C(&qword_189CF8);
  sub_6D20();
  __chkstk_darwin(v15);
  uint64_t v79 = sub_125EE8(v16, v75);
  uint64_t v76 = *(void *)(v79 - 8);
  sub_D978();
  __chkstk_darwin(v17);
  sub_125E10(v18, v75);
  sub_494C(&qword_189CE8);
  sub_6D20();
  __chkstk_darwin(v19);
  sub_DE7AC();
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v75 - v21;
  sub_494C(&qword_189D00);
  sub_6D20();
  __chkstk_darwin(v23);
  sub_125F94(v24, v75);
  __chkstk_darwin(v25);
  sub_FB534();
  __chkstk_darwin(v26);
  uint64_t v28 = (char *)&v75 - v27;
  uint64_t v29 = sub_27CC8(v9);
  String.toSpeakableString.getter(v29, v30);
  swift_bridgeObjectRelease();
  uint64_t v31 = sub_ABF4();
  uint64_t v32 = 1LL;
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v28, 0LL, 1LL, v31);
  uint64_t v33 = (int *)v4(0LL);
  sub_A384((uint64_t)v28, v11 + v33[6]);
  [v7 doubleValue];
  double v35 = v34;
  uint64_t v36 = sub_57DD0(v7);
  double v38 = sub_90668(v36, v37, v9, v35);
  sub_2A184();
  uint64_t v39 = v11 + v33[10];
  *(double *)uint64_t v39 = v38;
  *(_BYTE *)(v39 + 8) = 0;
  String.toSpeakableString.getter(v82, 0xE600000000000000LL);
  uint64_t v81 = v31;
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v0, 0LL, 1LL, v31);
  uint64_t v40 = v33[9];
  uint64_t v82 = v11;
  sub_A384((uint64_t)v0, v11 + v40);
  uint64_t v41 = sub_126174();
  sub_A72C(v41);
  sub_12618C();
  id v42 = [v7 start];
  if (v42)
  {
    sub_126264((uint64_t)v42);

    uint64_t v32 = 0LL;
  }

  uint64_t v43 = v79;
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v1, v32, 1LL, v79);
  sub_126194();
  uint64_t v44 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v22, 1LL, v43);
  if ((_DWORD)v44)
  {
    sub_56860(v44, &qword_189CE8);
    uint64_t v45 = 0LL;
  }

  else
  {
    uint64_t v47 = v75;
    uint64_t v46 = v76;
    uint64_t v48 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v76 + 16))(v75, v22, v43);
    uint64_t v49 = sub_56860(v48, &qword_189CE8);
    double v50 = Date.timeIntervalSince1970.getter(v49);
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v47, v43);
    uint64_t v45 = *(void *)&v50;
  }

  sub_1260CC(v45);
  uint64_t v51 = sub_126110();
  id v52 = (void *)dispatch thunk of DialogCalendar.Builder.build()(v51);
  sub_3652C();
  uint64_t v53 = v33[7];
  uint64_t v54 = v82;
  swift_release();
  *(void *)(v54 + v53) = v52;
  sub_35468(v80, v1);
  uint64_t v55 = sub_3C798();
  uint64_t v56 = sub_1261F0(v55);
  if (v57)
  {
    sub_125EC0(v56, &qword_189CF8);
    sub_12603C();
  }

  else
  {
    [objc_allocWithZone(SAUIAppPunchOut) init];
    sub_126050(v58);
    uint64_t v60 = (void *)v59;
    sub_126030(v59, "setPunchOutUri:");

    id v61 = v52;
    sub_126098();
    sub_126214();
    sub_125DEC();
    sub_125B84((uint64_t)v52, (uint64_t)v60, v61);

    id v63 = sub_373D8(v62, "dictionary");
    if (v63)
    {
      unint64_t v64 = v63;
      unint64_t v65 = (void *)objc_opt_self(&OBJC_CLASS___NSPropertyListSerialization);
      uint64_t v83 = 0LL;
      id v66 = sub_125DD8(v65, "dataWithPropertyList:format:options:error:");
      id v67 = sub_12612C();
      if (v66)
      {
        uint64_t v68 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v66);
        unint64_t v70 = v69;

        Swift::String v71 = Data.base64EncodedString(options:)(0LL);
        sub_56A24(v71._countAndFlagsBits, (uint64_t)v71._object);

        sub_A3CC(v68, v70);
        swift_bridgeObjectRelease();
        uint64_t v72 = (uint64_t)v7;
        uint64_t v73 = 0LL;
      }

      else
      {
        unint64_t v74 = v67;
        _convertNSErrorToError(_:)();

        sub_1261DC();
        sub_A604();
        uint64_t v72 = (uint64_t)v7;
        uint64_t v73 = 1LL;
      }

      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v72, v73, 1LL, v81);
    }

    else
    {
      sub_12603C();
    }

    sub_1260F4();
  }

  sub_A384((uint64_t)v7, v54);
  sub_A744();
}

uint64_t sub_125558(uint64_t a1, unsigned __int8 a2, void *a3, uint64_t a4)
{
  uint64_t v85 = a4;
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v83 = *(void *)(v7 - 8);
  uint64_t v84 = v7;
  __chkstk_darwin(v7);
  uint64_t v82 = (char *)&v80 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_494C(&qword_189CF8);
  __chkstk_darwin(v9);
  uint64_t v87 = (char *)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for Date(0LL);
  uint64_t v81 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v80 = (char *)&v80 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_494C(&qword_189CE8);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v80 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v80 - v17;
  uint64_t v19 = sub_494C(&qword_189D00);
  uint64_t v20 = __chkstk_darwin(v19);
  uint64_t v86 = (char *)&v80 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v80 - v23;
  __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v80 - v25;
  uint64_t v27 = sub_27CC8(a2);
  String.toSpeakableString.getter(v27, v28);
  swift_bridgeObjectRelease();
  uint64_t v29 = 1LL;
  uint64_t v88 = type metadata accessor for SpeakableString(0LL);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v26, 0LL, 1LL, v88);
  uint64_t v30 = (int *)type metadata accessor for WellnessLoggingWeightParameters(0LL);
  sub_A384((uint64_t)v26, a1 + v30[6]);
  [a3 doubleValue];
  double v32 = v31;
  uint64_t v33 = sub_57DD0(a3);
  double v35 = sub_90668(v33, v34, a2, v32);
  swift_bridgeObjectRelease();
  uint64_t v36 = a1 + v30[9];
  *(double *)uint64_t v36 = v35;
  *(_BYTE *)(v36 + 8) = 0;
  uint64_t v37 = sub_57DD0(a3);
  if (v38)
  {
    String.toSpeakableString.getter(v37, v38);
    swift_bridgeObjectRelease();
    uint64_t v29 = 0LL;
  }

  uint64_t v39 = 1LL;
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v24, v29, 1LL, v88);
  sub_A384((uint64_t)v24, a1 + v30[8]);
  uint64_t v40 = type metadata accessor for DialogCalendar.Builder(0LL);
  swift_allocObject(v40, *(unsigned int *)(v40 + 48), *(unsigned __int16 *)(v40 + 52));
  DialogCalendar.Builder.init()();
  id v41 = [a3 start];
  if (v41)
  {
    id v42 = v41;
    static Date._unconditionallyBridgeFromObjectiveC(_:)(v41);

    uint64_t v39 = 0LL;
  }

  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v16, v39, 1LL, v11);
  sub_125BD4((uint64_t)v16, (uint64_t)v18);
  int v43 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v18, 1LL, v11);
  if (v43)
  {
    sub_2012C((uint64_t)v18, &qword_189CE8);
    double v44 = 0.0;
  }

  else
  {
    uint64_t v45 = v80;
    uint64_t v46 = v81;
    (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v80, v18, v11);
    uint64_t v47 = sub_2012C((uint64_t)v18, &qword_189CE8);
    double v48 = Date.timeIntervalSince1970.getter(v47);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v45, v11);
    double v44 = v48;
  }

  uint64_t v50 = (uint64_t)v86;
  uint64_t v49 = (uint64_t)v87;
  dispatch thunk of DialogCalendar.Builder.withSecs(_:)(*(void *)&v44, v43 != 0);
  uint64_t v51 = swift_release();
  uint64_t v52 = dispatch thunk of DialogCalendar.Builder.build()(v51);
  swift_release();
  uint64_t v53 = v30[7];
  swift_release();
  *(void *)(a1 + v53) = v52;
  sub_35468(v85, v49);
  uint64_t v54 = type metadata accessor for URL(0LL);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v49, 1LL, v54) == 1)
  {
    sub_2012C(v49, &qword_189CF8);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v50, 1LL, 1LL, v88);
  }

  else
  {
    id v55 = [objc_allocWithZone(SAUIAppPunchOut) init];
    URL._bridgeToObjectiveC()(v56);
    id v58 = v57;
    [v55 setPunchOutUri:v57];

    id v59 = v55;
    uint64_t v60 = v82;
    uint64_t v61 = UUID.init()();
    uint64_t v62 = UUID.uuidString.getter(v61);
    uint64_t v64 = v63;
    (*(void (**)(char *, uint64_t))(v83 + 8))(v60, v84);
    sub_125B84(v62, v64, v59);

    id v65 = [v59 dictionary];
    if (v65)
    {
      id v66 = v65;
      id v67 = (void *)objc_opt_self(&OBJC_CLASS___NSPropertyListSerialization);
      id v89 = 0LL;
      id v68 = [v67 dataWithPropertyList:v66 format:200 options:0 error:&v89];
      id v69 = v89;
      if (v68)
      {
        uint64_t v70 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v68);
        unint64_t v72 = v71;

        Swift::String v73 = Data.base64EncodedString(options:)(0LL);
        String.toSpeakableString.getter(v73._countAndFlagsBits, v73._object);

        sub_A3CC(v70, v72);
        swift_bridgeObjectRelease();
        uint64_t v74 = v50;
        uint64_t v75 = 0LL;
      }

      else
      {
        uint64_t v76 = v69;
        uint64_t v77 = _convertNSErrorToError(_:)();

        swift_willThrow(v78);
        swift_errorRelease(v77);
        uint64_t v74 = v50;
        uint64_t v75 = 1LL;
      }

      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v74, v75, 1LL, v88);
    }

    else
    {
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v50, 1LL, 1LL, v88);
    }

    (*(void (**)(uint64_t, uint64_t))(*(void *)(v54 - 8) + 8LL))(v49, v54);
  }

  return sub_A384(v50, a1);
}

void sub_125B84(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  [a3 setAceId:v5];
}

uint64_t sub_125BD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_494C(&qword_189CE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_125C1C()
{
  return sub_125558(v0, v1, v2, v3);
}

void sub_125C2C()
{
}

void sub_125C4C()
{
}

void sub_125C6C()
{
}

void sub_125C8C()
{
}

uint64_t sub_125CB8(uint64_t a1)
{
  return sub_124B08(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32));
}

void sub_125CC4()
{
}

uint64_t sub_125CF8()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (uint64_t *)(v1 - 8);
  *uint64_t v3 = *v0;
  uint64_t v4 = *(void *)(v2 + 96);
  *uint64_t v3 = *v0;
  return swift_task_dealloc(v4);
}

  ;
}

uint64_t sub_125D34()
{
  return swift_task_alloc(48LL);
}

void sub_125D54()
{
  *(void *)(v1 - 8) = *v0;
}

uint64_t sub_125D68()
{
  return type metadata accessor for DateInterval(0LL);
}

uint64_t sub_125D7C(uint64_t a1)
{
  return _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v1, 1LL, 1LL, a1);
}

uint64_t sub_125D90@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *a1 = v2;
  a1[1] = a2;
  return *(void *)(v2 + 48);
}

uint64_t sub_125DA4(uint64_t result)
{
  *(void *)(v2 + 88) = result;
  *(_BYTE *)(result + 16) = v4;
  *(void *)(result + 24) = v3;
  *(void *)(result + 32) = v1;
  return result;
}

void sub_125DBC(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 192) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

id sub_125DD8(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, v2, 200, 0, v3 - 112);
}

uint64_t sub_125DEC()
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 184) + 8LL))(v0, *(void *)(v1 - 176));
}

uint64_t sub_125E04()
{
  return sub_D7EC(v1 + 80, v0);
}

void sub_125E10(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 208) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_125E2C()
{
  return sub_A384(v0, *(void *)(v3 - 128) + *(int *)(v1 + 32));
}

uint64_t sub_125E60()
{
  return swift_task_dealloc(*(void *)(v0 + 80));
}

uint64_t sub_125E68()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 32);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t sub_125E8C(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 - 168);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v2, 1LL, 1LL, a1);
  return sub_F4F10(*(unsigned int *)(v1 - 156), v2);
}

uint64_t sub_125EC0(uint64_t a1, uint64_t *a2)
{
  return sub_2012C(v2, a2);
}

uint64_t sub_125EC8@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 144) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  return type metadata accessor for Date(0LL);
}

uint64_t sub_125EE8@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 136) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  return type metadata accessor for Date(0LL);
}

uint64_t sub_125F08()
{
  return 0LL;
}

uint64_t sub_125F18@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 104) = a1;
  return type metadata accessor for UUID(0LL);
}

uint64_t sub_125F24()
{
  uint64_t v5 = *(int *)(v2 + 36);
  *(void *)(v3 - 128) = v0;
  uint64_t v6 = v0 + v5;
  *(void *)uint64_t v6 = v4;
  *(_BYTE *)(v6 + 8) = 0;
  return sub_57DD0(v1);
}

uint64_t sub_125F40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t sub_125F50(uint64_t a1, uint64_t a2)
{
  return _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(a1, a2, 1LL, *(void *)(v2 - 136));
}

uint64_t sub_125F5C(uint64_t a1, uint64_t a2)
{
  return _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(a1, a2, 1LL, *(void *)(v2 - 128));
}

uint64_t sub_125F68(uint64_t a1)
{
  *(void *)(v2 - 136) = a1;
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v1, 0LL, 1LL, a1);
  return type metadata accessor for WellnessLoggingGenericDatatypeParameters(0LL);
}

void sub_125F94(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 144) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

void sub_125FB4(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_125FD4()
{
  return sub_125BD4(v1, v2);
}

uint64_t sub_125FFC()
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)(v2 - 200) + 16LL))( *(void *)(v2 - 208),  v0,  v1);
}

void sub_126014(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 168) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

id sub_126030(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_12603C()
{
  return _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v0, 1LL, 1LL, *(void *)(v1 - 152));
}

void sub_126050(NSURL *retstr@<X8>)
{
}

uint64_t sub_12605C()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t sub_126070()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v0 - 8) + 8LL))(v1, v0);
}

double sub_126084(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(v3 - 1sub_D7EC(v0 + 16, v0 + 56) = v2;
  return sub_90668(a1, a2, v2, v4);
}

uint64_t sub_126098()
{
  return UUID.init()();
}

uint64_t sub_1260A4(uint64_t a1)
{
  return sub_A384(v1, v2 + *(int *)(a1 + 24));
}

id sub_1260B8()
{
  return v0;
}

uint64_t sub_1260CC(uint64_t a1)
{
  return dispatch thunk of DialogCalendar.Builder.withSecs(_:)(a1, v1 != 0);
}

uint64_t sub_1260E0()
{
  return sub_27CC8(v0);
}

uint64_t sub_1260F4()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8LL))(v0, v1);
}

uint64_t sub_126108()
{
  return sub_57DD0(v0);
}

uint64_t sub_126110()
{
  return swift_release(v0);
}

void sub_12611C()
{
}

id sub_12612C()
{
  return *(id *)(v0 - 112);
}

void sub_126134()
{
}

uint64_t sub_126154()
{
  return swift_release(*(void *)(*(void *)(v1 - 128) + *(int *)(v0 + 28)));
}

uint64_t sub_126164(uint64_t a1)
{
  return dispatch thunk of DialogCalendar.Builder.withSecs(_:)(a1, v1 != 0);
}

uint64_t sub_126174()
{
  return type metadata accessor for DialogCalendar.Builder(0LL);
}

uint64_t sub_12617C()
{
  return Data.base64EncodedString(options:)(0LL)._countAndFlagsBits;
}

uint64_t sub_12618C()
{
  return DialogCalendar.Builder.init()();
}

uint64_t sub_126194()
{
  return sub_125BD4(v1, v0);
}

uint64_t sub_1261A0(uint64_t a1, uint64_t a2)
{
  return String.toSpeakableString.getter(a1, a2);
}

uint64_t sub_1261AC(uint64_t a1)
{
  return _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v1, 1LL, a1);
}

uint64_t sub_1261D0()
{
  return sub_A384(v0, *(void *)(v1 - 128));
}

uint64_t sub_1261DC()
{
  return swift_willThrow();
}

void sub_1261E4()
{
}

uint64_t sub_1261F0(uint64_t a1)
{
  return _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v1, 1LL, a1);
}

uint64_t sub_126214()
{
  return UUID.uuidString.getter();
}

uint64_t sub_12621C(uint64_t a1, uint64_t a2)
{
  return String.toSpeakableString.getter(a1, a2);
}

uint64_t sub_126228(uint64_t a1, uint64_t a2)
{
  return String.toSpeakableString.getter(a1, a2);
}

uint64_t sub_126234()
{
  return sub_A3CC(v0, v1);
}

  ;
}

uint64_t sub_12624C(uint64_t a1)
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

uint64_t sub_126258()
{
  return swift_release(v0);
}

uint64_t sub_126264(uint64_t a1)
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

  ;
}

uint64_t sub_126284(char a1)
{
  return *(void *)&aCheckexicreate_0[8 * a1];
}

unint64_t sub_1262A4(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_17A2F8, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 9) {
    return 9LL;
  }
  else {
    return v3;
  }
}

_UNKNOWN **sub_1262EC()
{
  return &off_17B538;
}

void sub_1262F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
}

void sub_126304()
{
}

uint64_t sub_12630C(uint64_t a1)
{
  return sub_12BC68(a1, *v1);
}

void sub_126314(uint64_t a1)
{
}

unint64_t sub_12631C@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_1262A4(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_126348@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_126284(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_126370(void *a1@<X8>)
{
  *a1 = &off_17B538;
}

uint64_t getEnumTagSinglePayload for Verb(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xF8)
  {
    if (a2 + 8 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 8) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }

    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }

    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }

    int v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }

uint64_t storeEnumTagSinglePayload for Verb(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF7) {
    return ((uint64_t (*)(void))((char *)&loc_126454 + 4 * byte_13FB45[v4]))();
  }
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_126488 + 4 * byte_13FB40[v4]))();
}

uint64_t sub_126488(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_126490(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x126498LL);
  }
  return result;
}

uint64_t sub_1264A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1264ACLL);
  }
  *(_BYTE *)uint64_t result = a2 + 8;
  return result;
}

uint64_t sub_1264B0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1264B8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Verb()
{
  return &type metadata for Verb;
}

unint64_t sub_1264D8()
{
  unint64_t result = qword_190848;
  if (!qword_190848)
  {
    uint64_t v1 = sub_B64C(&qword_190850);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_190848);
  }

  return result;
}

unint64_t sub_126520()
{
  unint64_t result = qword_190858;
  if (!qword_190858)
  {
    unint64_t result = swift_getWitnessTable(&unk_13FC18, &type metadata for Verb);
    atomic_store(result, (unint64_t *)&qword_190858);
  }

  return result;
}

char *sub_12655C(char *a1, char *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    uint64_t v4 = (char *)(v12 + ((v5 + 16LL) & ~(unint64_t)v5));
  }

  else
  {
    *a1 = *a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = &a1[v7];
    uint64_t v9 = &a2[v7];
    uint64_t v10 = type metadata accessor for DateInterval(0LL);
    if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v9, 1LL, v10))
    {
      uint64_t v11 = sub_494C(&qword_189BA0);
      memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16LL))(v8, v9, v10);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v8, 0LL, 1LL, v10);
    }

    uint64_t v13 = a3[6];
    __int128 v14 = *(_OWORD *)&a2[v13 + 24];
    *(_OWORD *)&v4[v13 + 24] = v14;
    (**(void (***)(void))(v14 - 8))();
    uint64_t v15 = a3[7];
    uint64_t v16 = &v4[v15];
    uint64_t v17 = &a2[v15];
    __int128 v18 = *(_OWORD *)&a2[v15 + 24];
    *(_OWORD *)&v4[v15 + 24] = v18;
    (**(void (***)(char *, char *))(v18 - 8))(&v4[v15], &a2[v15]);
    __int128 v19 = *((_OWORD *)v17 + 4);
    *((_OWORD *)v16 + 4) = v19;
    (**(void (***)(uint64_t, uint64_t))(v19 - 8))((uint64_t)(v16 + 40), (uint64_t)(v17 + 40));
    __int128 v20 = *(_OWORD *)(v17 + 104);
    *(_OWORD *)(v16 + 104) = v20;
    (**(void (***)(uint64_t, uint64_t))(v20 - 8))((uint64_t)(v16 + 80), (uint64_t)(v17 + 80));
    __int128 v21 = *((_OWORD *)v17 + 9);
    *((_OWORD *)v16 + 9) = v21;
    (**(void (***)(uint64_t, uint64_t))(v21 - 8))((uint64_t)(v16 + 120), (uint64_t)(v17 + 120));
    uint64_t v22 = a3[8];
    __int128 v23 = *(_OWORD *)&a2[v22 + 24];
    *(_OWORD *)&v4[v22 + 24] = v23;
    (**(void (***)(void))(v23 - 8))();
    uint64_t v24 = a3[10];
    *(void *)&v4[a3[9]] = *(void *)&a2[a3[9]];
    *(void *)&v4[v24] = *(void *)&a2[v24];
    swift_retain();
  }

  swift_retain();
  return v4;
}

uint64_t sub_126734(uint64_t a1, int *a2)
{
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = type metadata accessor for DateInterval(0LL);
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0((void *)(a1 + a2[6]));
  unsigned int v6 = (void *)(a1 + a2[7]);
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v6);
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v6 + 5);
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v6 + 10);
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v6 + 15);
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0((void *)(a1 + a2[8]));
  swift_release();
  return swift_release();
}

_BYTE *sub_1267EC(_BYTE *a1, _BYTE *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for DateInterval(0LL);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v8, 1LL, v9))
  {
    uint64_t v10 = sub_494C(&qword_189BA0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(void *)(v9 - 8) + 16LL))(v7, v8, v9);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v7, 0LL, 1LL, v9);
  }

  uint64_t v11 = a3[6];
  __int128 v12 = *(_OWORD *)&a2[v11 + 24];
  *(_OWORD *)&a1[v11 + 24] = v12;
  (**(void (***)(void))(v12 - 8))();
  uint64_t v13 = a3[7];
  __int128 v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  __int128 v16 = *(_OWORD *)&a2[v13 + 24];
  *(_OWORD *)&a1[v13 + 24] = v16;
  (**(void (***)(_BYTE *, _BYTE *))(v16 - 8))(&a1[v13], &a2[v13]);
  __int128 v17 = v15[4];
  v14[4] = v17;
  (**(void (***)(uint64_t, uint64_t))(v17 - 8))((uint64_t)v14 + 40, (uint64_t)v15 + 40);
  __int128 v18 = *(_OWORD *)((char *)v15 + 104);
  *(_OWORD *)((char *)v14 + 104) = v18;
  (**(void (***)(uint64_t, uint64_t))(v18 - 8))((uint64_t)(v14 + 5), (uint64_t)(v15 + 5));
  __int128 v19 = v15[9];
  v14[9] = v19;
  (**(void (***)(uint64_t, uint64_t))(v19 - 8))((uint64_t)v14 + 120, (uint64_t)v15 + 120);
  uint64_t v20 = a3[8];
  __int128 v21 = *(_OWORD *)&a2[v20 + 24];
  *(_OWORD *)&a1[v20 + 24] = v21;
  (**(void (***)(void))(v21 - 8))();
  uint64_t v22 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  *(void *)&a1[v22] = *(void *)&a2[v22];
  swift_retain();
  swift_retain();
  return a1;
}

_BYTE *sub_12699C(_BYTE *a1, _BYTE *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for DateInterval(0LL);
  int v10 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v7, 1LL, v9);
  int v11 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v8, 1LL, v9);
  if (!v10)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v12 + 24))(v7, v8, v9);
      goto LABEL_7;
    }

    (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }

  if (v11)
  {
LABEL_6:
    uint64_t v13 = sub_494C(&qword_189BA0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(void *)(v9 - 8) + 16LL))(v7, v8, v9);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v7, 0LL, 1LL, v9);
LABEL_7:
  sub_7030(&a1[a3[6]], &a2[a3[6]]);
  uint64_t v14 = a3[7];
  uint64_t v15 = &a1[v14];
  __int128 v16 = &a2[v14];
  sub_7030(&a1[v14], &a2[v14]);
  sub_7030(v15 + 5, v16 + 5);
  sub_7030(v15 + 10, v16 + 10);
  sub_7030(v15 + 15, v16 + 15);
  sub_7030(&a1[a3[8]], &a2[a3[8]]);
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  swift_retain();
  swift_release();
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  swift_retain();
  swift_release();
  return a1;
}

_BYTE *sub_126B3C(_BYTE *a1, _BYTE *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for DateInterval(0LL);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v8, 1LL, v9))
  {
    uint64_t v10 = sub_494C(&qword_189BA0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v7, 0LL, 1LL, v9);
  }

  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = &a1[v11];
  uint64_t v14 = &a2[v11];
  __int128 v15 = *((_OWORD *)v14 + 1);
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  *((_OWORD *)v13 + 1) = v15;
  *((void *)v13 + 4) = *((void *)v14 + 4);
  memcpy(&a1[v12], &a2[v12], 0xA0uLL);
  uint64_t v16 = a3[8];
  uint64_t v17 = a3[9];
  __int128 v18 = &a1[v16];
  __int128 v19 = &a2[v16];
  __int128 v20 = *(_OWORD *)v19;
  __int128 v21 = *((_OWORD *)v19 + 1);
  *((void *)v18 + 4) = *((void *)v19 + 4);
  *(_OWORD *)__int128 v18 = v20;
  *((_OWORD *)v18 + 1) = v21;
  *(void *)&a1[v17] = *(void *)&a2[v17];
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  return a1;
}

_BYTE *sub_126C54(_BYTE *a1, _BYTE *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for DateInterval(0LL);
  int v10 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v7, 1LL, v9);
  int v11 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v8, 1LL, v9);
  if (!v10)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v12 + 40))(v7, v8, v9);
      goto LABEL_7;
    }

    (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }

  if (v11)
  {
LABEL_6:
    uint64_t v13 = sub_494C(&qword_189BA0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v7, 0LL, 1LL, v9);
LABEL_7:
  uint64_t v14 = a3[6];
  __int128 v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(&a1[v14]);
  __int128 v17 = *((_OWORD *)v16 + 1);
  *(_OWORD *)__int128 v15 = *(_OWORD *)v16;
  *((_OWORD *)v15 + 1) = v17;
  *((void *)v15 + 4) = *((void *)v16 + 4);
  uint64_t v18 = a3[7];
  __int128 v19 = &a1[v18];
  __int128 v20 = &a2[v18];
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(&a1[v18]);
  __int128 v21 = *((_OWORD *)v20 + 1);
  *(_OWORD *)__int128 v19 = *(_OWORD *)v20;
  *((_OWORD *)v19 + 1) = v21;
  *((void *)v19 + 4) = *((void *)v20 + 4);
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0((void *)v19 + 5);
  *(_OWORD *)(v19 + 40) = *(_OWORD *)(v20 + 40);
  *(_OWORD *)(v19 + sub_D7EC(v0 + 16, v0 + 56) = *(_OWORD *)(v20 + 56);
  *((void *)v19 + 9) = *((void *)v20 + 9);
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0((void *)v19 + 10);
  __int128 v22 = *((_OWORD *)v20 + 6);
  *((_OWORD *)v19 + 5) = *((_OWORD *)v20 + 5);
  *((_OWORD *)v19 + 6) = v22;
  *((void *)v19 + 14) = *((void *)v20 + 14);
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0((void *)v19 + 15);
  *(_OWORD *)(v19 + 120) = *(_OWORD *)(v20 + 120);
  *(_OWORD *)(v19 + 136) = *(_OWORD *)(v20 + 136);
  *((void *)v19 + 19) = *((void *)v20 + 19);
  uint64_t v23 = a3[8];
  uint64_t v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(&a1[v23]);
  __int128 v26 = *((_OWORD *)v25 + 1);
  *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
  *((_OWORD *)v24 + 1) = v26;
  *((void *)v24 + 4) = *((void *)v25 + 4);
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  swift_release();
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  swift_release();
  return a1;
}

uint64_t sub_126E4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_126E58);
}

uint64_t sub_126E58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_494C(&qword_189BA0);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2) {
    return _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(a1 + *(int *)(a3 + 20), a2, v6);
  }
  unint64_t v8 = *(void *)(a1 + *(int *)(a3 + 24) + 24);
  if (v8 >= 0xFFFFFFFF) {
    LODWORD(v8) = -1;
  }
  return (v8 + 1);
}

uint64_t sub_126EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_126EE8);
}

uint64_t sub_126EE8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_494C(&qword_189BA0);
  if (*(_DWORD *)(*(void *)(result - 8) + 84LL) == a3) {
    return _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(a1 + *(int *)(a4 + 20), a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 24) + 24) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for UnavailableDataFlow(uint64_t a1)
{
  uint64_t result = qword_1908B8;
  if (!qword_1908B8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for UnavailableDataFlow);
  }
  return result;
}

void sub_126FA0(uint64_t a1)
{
  v4[0] = &unk_13FD18;
  sub_127038(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(v2 - 8) + 64LL;
    v4[2] = &unk_13FD30;
    v4[3] = &unk_13FD48;
    v4[4] = &unk_13FD30;
    void v4[5] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[6] = (char *)&value witness table for Builtin.NativeObject + 64;
    swift_initStructMetadata(a1, 256LL, 7LL, v4, a1 + 16);
  }

void sub_127038(uint64_t a1)
{
  if (!qword_189C10)
  {
    uint64_t v2 = type metadata accessor for DateInterval(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_189C10);
    }
  }

uint64_t sub_12708C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1281D4();
  sub_A410(&qword_189CC8, type metadata accessor for UnavailableDataFlow, (uint64_t)&unk_13FD60);
  return Flow.deferToExecuteAsync(_:)(a1, a2, v4, v5);
}

uint64_t sub_1270E8(uint64_t a1)
{
  v2[17] = a1;
  v2[18] = v1;
  uint64_t v3 = type metadata accessor for GenericButtonModel(0LL);
  v2[19] = v3;
  v2[20] = sub_A5C0(*(void *)(v3 - 8));
  uint64_t v4 = sub_1281D4();
  v2[21] = v4;
  v2[22] = sub_A5C0(*(void *)(v4 - 8));
  uint64_t v5 = sub_494C(&qword_189CF8);
  v2[23] = sub_A5C0(*(void *)(v5 - 8));
  uint64_t v6 = type metadata accessor for URL(0LL);
  v2[24] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[25] = v7;
  v2[26] = sub_A5C0(v7);
  uint64_t v8 = type metadata accessor for DialogPhase(0LL);
  v2[27] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v2[28] = v9;
  v2[29] = sub_D8CC(v9);
  v2[30] = sub_A5B8();
  uint64_t v10 = type metadata accessor for OutputGenerationManifest(0LL);
  v2[31] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v2[32] = v11;
  v2[33] = sub_A5C0(v11);
  uint64_t v12 = sub_494C(&qword_189D00);
  v2[34] = sub_A5C0(*(void *)(v12 - 8));
  uint64_t v13 = type metadata accessor for Date(0LL);
  v2[35] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v2[36] = v14;
  v2[37] = sub_A5C0(v14);
  uint64_t v15 = sub_494C(&qword_189BA0);
  v2[38] = sub_D8CC(*(void *)(v15 - 8));
  v2[39] = sub_A5B8();
  uint64_t v16 = type metadata accessor for DateInterval(0LL);
  v2[40] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v2[41] = v17;
  v2[42] = sub_A5C0(v17);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_127224()
{
  uint64_t v1 = *(void *)(v0 + 312);
  uint64_t v2 = *(void *)(v0 + 320);
  sub_128134(*(void *)(v0 + 144) + *(int *)(*(void *)(v0 + 168) + 20LL), v1);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v1, 1LL, v2) == 1)
  {
    sub_279E0(*(void *)(v0 + 312), &qword_189BA0);
    uint64_t v3 = 0LL;
  }

  else
  {
    uint64_t v4 = *(void *)(v0 + 328);
    (*(void (**)(void, void, void))(v4 + 32))( *(void *)(v0 + 336),  *(void *)(v0 + 312),  *(void *)(v0 + 320));
    uint64_t v5 = type metadata accessor for DialogCalendarRange.Builder(0LL);
    sub_A72C(v5);
    uint64_t v6 = DialogCalendarRange.Builder.init()();
    uint64_t v7 = DateInterval.start.getter(v6);
    double v8 = Date.timeIntervalSince1970.getter(v7);
    sub_1281DC();
    dispatch thunk of DialogCalendarRange.Builder.withStartSecs(_:)(*(void *)&v8, 0LL);
    uint64_t v9 = swift_release();
    uint64_t v10 = DateInterval.end.getter(v9);
    double v11 = Date.timeIntervalSince1970.getter(v10);
    sub_1281DC();
    dispatch thunk of DialogCalendarRange.Builder.withEndSecs(_:)(*(void *)&v11, 0LL);
    uint64_t v12 = swift_release();
    uint64_t v3 = dispatch thunk of DialogCalendarRange.Builder.build()(v12);
    swift_release();
    sub_202F4(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  }

  *(void *)(v0 + 344) = v3;
  uint64_t v13 = *(void *)(v0 + 272);
  uint64_t v14 = sub_27CC8(**(_BYTE **)(v0 + 144));
  String.toSpeakableString.getter(v14, v15);
  swift_bridgeObjectRelease();
  uint64_t v16 = type metadata accessor for SpeakableString(0LL);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v13, 0LL, 1LL, v16);
  uint64_t v17 = (void *)swift_task_alloc(dword_18B0AC);
  *(void *)(v0 + 352) = v17;
  void *v17 = v0;
  v17[1] = sub_1273F8;
  return sub_3CD2C(*(void *)(v0 + 272), v3);
}

uint64_t sub_1273F8(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 352);
  uint64_t v5 = *(void *)(*v2 + 272);
  *(void *)(v3 + 360) = a1;
  *(void *)(v3 + 368) = v1;
  swift_task_dealloc(v4);
  sub_279E0(v5, &qword_189D00);
  sub_A964();
  return sub_A810();
}

uint64_t sub_12746C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v12 = (void *)v11[45];
  uint64_t v13 = v11[38];
  uint64_t v15 = v11[29];
  uint64_t v14 = v11[30];
  uint64_t v17 = v11[27];
  uint64_t v16 = v11[28];
  uint64_t v18 = v11[23];
  uint64_t v82 = v11[40];
  uint64_t v83 = v11[24];
  __int128 v19 = (unsigned __int8 *)v11[18];
  static DialogPhase.completion.getter(v20, v21, v22, v23, v24, v25, v26, v27);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v15, v14, v17);
  OutputGenerationManifest.init(dialogPhase:_:)(v15, sub_A633C, 0LL);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v17);
  OutputGenerationManifest.printSupportingDialogInDisplayModes.setter(1LL);
  id v28 = [v12 catId];
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
  uint64_t v31 = v30;

  OutputGenerationManifest.responseViewId.setter(v29, v31);
  uint64_t v32 = *v19;
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v13, 1LL, 1LL, v82);
  sub_F4F10(v32, v13);
  sub_279E0(v13, &qword_189BA0);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v18, 1LL, v83) != 1)
  {
    uint64_t v34 = v11[21];
    uint64_t v33 = v11[22];
    uint64_t v35 = v11[18];
    (*(void (**)(void, void, void))(v11[25] + 32LL))(v11[26], v11[23], v11[24]);
    sub_500C((void *)(v35 + *(int *)(v34 + 24)), *(void *)(v35 + *(int *)(v34 + 24) + 24));
    sub_202B4();
    uint64_t v36 = v11[5];
    uint64_t v37 = v11[6];
    sub_500C(v11 + 2, v36);
    char v38 = dispatch thunk of DeviceState.isPhone.getter(v36, v37);
    sub_35554(v35, v33, type metadata accessor for UnavailableDataFlow);
    uint64_t v39 = v11[22];
    if ((v38 & 1) != 0)
    {
      sub_26F04(v11[22], type metadata accessor for UnavailableDataFlow);
      sub_20300();
    }

    else
    {
      sub_500C((void *)(v39 + *(int *)(v34 + 24)), *(void *)(v39 + *(int *)(v34 + 24) + 24));
      sub_202B4();
      uint64_t v40 = v11[10];
      uint64_t v41 = v11[11];
      sub_500C(v11 + 7, v40);
      char v42 = dispatch thunk of DeviceState.isPad.getter(v40, v41);
      _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v11 + 7);
      sub_26F04(v39, type metadata accessor for UnavailableDataFlow);
      sub_20300();
      if ((v42 & 1) == 0)
      {
        (*(void (**)(void, void))(v11[25] + 8LL))(v11[26], v11[24]);
        goto LABEL_8;
      }
    }

    uint64_t v84 = (void *)v11[45];
    uint64_t v44 = v11[25];
    uint64_t v43 = v11[26];
    uint64_t v45 = v11[24];
    uint64_t v46 = (uint64_t *)v11[20];
    uint64_t v47 = v11[21];
    uint64_t v49 = v11[18];
    uint64_t v48 = v11[19];
    uint64_t v50 = sub_90E74(0x616548206E65704FLL, 0xEB0000000068746CLL, 0x6C6165486E65706FLL, (void *)0xED00007070416874LL);
    uint64_t v52 = v51;
    (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))((char *)v46 + *(int *)(v48 + 20), v43, v45);
    *uint64_t v46 = v50;
    v46[1] = v52;
    sub_500C((void *)(v49 + *(int *)(v47 + 32)), *(void *)(v49 + *(int *)(v47 + 32) + 24));
    uint64_t v53 = type metadata accessor for WellnessSnippets(0LL);
    v11[15] = v53;
    sub_A410( (unint64_t *)&qword_18A468,  type metadata accessor for WellnessSnippets,  (uint64_t)&protocol conformance descriptor for WellnessSnippets);
    v11[16] = v54;
    id v55 = sub_B76C(v11 + 12);
    sub_35554((uint64_t)v46, (uint64_t)v55, type metadata accessor for GenericButtonModel);
    swift_storeEnumTagMultiPayload(v55, v53, 4LL);
    uint64_t v56 = sub_494C(&qword_18A460);
    uint64_t v57 = sub_20308(v56, 40LL);
    *(_OWORD *)(v57 + 16) = xmmword_138BA0;
    *(void *)(v57 + 32) = v84;
    sub_202E8(v57, v58, v59);
    v11[47] = a11;
    uint64_t v60 = async function pointer to dispatch thunk of ResponseGenerating.makeResponseOutput(conversationModel:dialog:outputGenerationManifest:)[1];
    id v61 = v84;
    uint64_t v62 = (void *)swift_task_alloc(v60);
    v11[48] = v62;
    *uint64_t v62 = v11;
    v62[1] = sub_1278E4;
    sub_125D18();
    return dispatch thunk of ResponseGenerating.makeResponseOutput(conversationModel:dialog:outputGenerationManifest:)( v63,  v64,  v65,  v66,  v67);
  }

  sub_279E0(v11[23], &qword_189CF8);
LABEL_8:
  id v69 = (void *)v11[45];
  uint64_t v70 = (void *)(v11[18] + *(int *)(v11[21] + 32LL));
  sub_500C(v70, v70[3]);
  uint64_t v71 = sub_494C(&qword_18A460);
  uint64_t v72 = sub_20308(v71, 40LL);
  *(_OWORD *)(v72 + 16) = xmmword_138BA0;
  *(void *)(v72 + 32) = v69;
  sub_202E8(v72, v73, v74);
  v11[49] = a11;
  uint64_t v75 = async function pointer to dispatch thunk of ResponseGenerating.makeResponseOutput(dialog:outputGenerationManifest:)[1];
  id v76 = v69;
  uint64_t v77 = (void *)swift_task_alloc(v75);
  v11[50] = v77;
  void *v77 = v11;
  v77[1] = sub_1279BC;
  sub_125D18();
  return dispatch thunk of ResponseGenerating.makeResponseOutput(dialog:outputGenerationManifest:)(v78, v79, v80, v81);
}

uint64_t sub_1278E4()
{
  uint64_t v1 = (void *)(v0 + 96);
  sub_20264(*(void *)(v0 + 384));
  swift_bridgeObjectRelease();
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v1);
  sub_A964();
  return sub_A810();
}

#error "1279A0: call analysis failed (funcsize=35)"
uint64_t sub_1279BC()
{
  uint64_t v0;
  sub_AA10();
  sub_20264(*(void *)(v0 + 400));
  swift_bridgeObjectRelease();
  sub_A964();
  return sub_A5D0();
}

#error "127A48: call analysis failed (funcsize=27)"
#error "127AD0: call analysis failed (funcsize=34)"
uint64_t sub_127AEC(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  v2[42] = a1;
  v2[43] = v1;
  uint64_t v3 = sub_1281D4();
  v2[44] = sub_A5C0(*(void *)(v3 - 8));
  uint64_t v4 = type metadata accessor for Logger(0LL);
  v2[45] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[46] = v5;
  v2[47] = sub_D8CC(v5);
  v2[48] = sub_A5B8();
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_127B4C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20, uint64_t a21, uint64_t a22)
{
  a21 = v23;
  a22 = v24;
  a20 = v22;
  uint64_t v25 = v22[48];
  uint64_t v26 = v22[45];
  uint64_t v27 = v22[46];
  uint64_t v29 = v22[43];
  uint64_t v28 = v22[44];
  uint64_t v30 = Logger.wellness.unsafeMutableAddressor(v24);
  v22[49] = v30;
  sub_A5DC(v30, (uint64_t)(v22 + 32));
  uint64_t v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16);
  v22[50] = v31;
  v31(v25, v30, v26);
  sub_35554(v29, v28, type metadata accessor for UnavailableDataFlow);
  uint64_t v33 = (os_log_s *)Logger.logObject.getter(v32);
  os_log_type_t v34 = static os_log_type_t.debug.getter(v33);
  if (sub_A634(v34))
  {
    uint64_t v35 = v22[46];
    uint64_t v48 = v22[45];
    uint64_t v49 = v22[48];
    uint64_t v36 = (unsigned __int8 *)v22[44];
    uint64_t v37 = sub_A5E8(22LL);
    uint64_t v38 = sub_A5E8(64LL);
    a11 = v38;
    *(_DWORD *)uint64_t v37 = 136315394;
    v22[40] = sub_39178(0xD000000000000013LL, 0x800000000013FCE0LL, &a11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v22 + 40, v22 + 41, v37 + 4, v37 + 12);
    *(_WORD *)(v37 + 12) = 2080;
    uint64_t v39 = sub_27CC8(*v36);
    v22[41] = sub_39178(v39, v40, &a11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v22 + 41, v22 + 42, v37 + 14, v37 + 22);
    swift_bridgeObjectRelease();
    sub_26F04((uint64_t)v36, type metadata accessor for UnavailableDataFlow);
    _os_log_impl(&dword_0, v33, (os_log_type_t)v28, "%s for %s", (uint8_t *)v37, 0x16u);
    swift_arrayDestroy(v38, 2LL);
    sub_5050(v38);
    sub_5050(v37);

    uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
    v41(v49, v48);
  }

  else
  {
    uint64_t v42 = v22[48];
    uint64_t v43 = v22[45];
    uint64_t v44 = v22[46];
    sub_26F04(v22[44], type metadata accessor for UnavailableDataFlow);

    uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
    v41(v42, v43);
  }

  v22[51] = v41;
  uint64_t v45 = (void *)swift_task_alloc(dword_190924);
  v22[52] = v45;
  void *v45 = v22;
  v45[1] = sub_127D68;
  sub_125D18();
  return sub_1270E8(v46);
}

uint64_t sub_127D68()
{
  uint64_t v3 = *(void *)(v2 + 416);
  *uint64_t v4 = *v1;
  *(void *)(v2 + 424) = v0;
  swift_task_dealloc(v3);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_127DB8()
{
  uint64_t v1 = sub_20308((uint64_t)&unk_1824A0, 56LL);
  sub_20004((__int128 *)(v0 + 216), v1 + 16);
  static OutputPublisherFactory.makeOutputPublisherAsync()(v4);
  uint64_t v2 = type metadata accessor for SimpleOutputFlowAsync(0LL);
  sub_A72C(v2);
  *(void *)(v0 + 312) = SimpleOutputFlowAsync.init(outputPublisher:outputGenerator:)(v4, &unk_190930, v1);
  static ExecuteResponse.complete<A>(next:)();
  sub_20300();
  sub_3652C();
  sub_1281E8();
  sub_A78C();
  sub_A67C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_127E98()
{
  uint64_t v1 = *(void *)(v0 + 424);
  uint64_t v2 = *(void *)(v0 + 392);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 400);
  uint64_t v4 = *(void *)(v0 + 376);
  uint64_t v5 = *(void *)(v0 + 360);
  sub_A5DC(v2, v0 + 280);
  v3(v4, v2, v5);
  swift_errorRetain(v1);
  uint64_t v6 = swift_errorRetain(v1);
  uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.error.getter();
  if (sub_A634(v8))
  {
    uint64_t v9 = *(void *)(v0 + 424);
    uint64_t v10 = (uint8_t *)sub_A5E8(12LL);
    double v11 = (void *)sub_A5E8(8LL);
    *(_DWORD *)uint64_t v10 = 138412290;
    swift_errorRetain(v9);
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError(v9);
    *(void *)(v0 + 304) = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 304, v0 + 312, v10 + 4, v10 + 12);
    *double v11 = v12;
    sub_A604();
    sub_A604();
    _os_log_impl(&dword_0, v7, (os_log_type_t)v5, "%@", v10, 0xCu);
    sub_494C(&qword_189CB8);
    swift_arrayDestroy(v11, 1LL);
    sub_5050((uint64_t)v11);
    sub_5050((uint64_t)v10);

    sub_A604();
  }

  else
  {
    sub_A604();
    sub_A604();
    sub_A604();
  }

  (*(void (**)(void, void))(v0 + 408))(*(void *)(v0 + 376), *(void *)(v0 + 360));
  sub_5A9C0((uint64_t *)(v0 + 16));
  sub_A178();
  static ExecuteResponse.complete<A>(next:)();
  sub_A1B4((void *)(v0 + 16));
  sub_1281E8();
  sub_A78C();
  sub_A67C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_128068(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_19091C);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_A108;
  return sub_127AEC(a1);
}

uint64_t sub_1280B8()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_1280DC(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc(dword_19092C);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_7564C;
  return sub_1FE14(a1, v1 + 16);
}

uint64_t sub_128134(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_494C(&qword_189BA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_12817C()
{
  return (*(uint64_t (**)(void, void))(v0[32] + 8LL))(v0[33], v0[31]);
}

  ;
}

uint64_t sub_1281D4()
{
  return type metadata accessor for UnavailableDataFlow(0LL);
}

uint64_t sub_1281DC()
{
  return v2(v0, v1);
}

uint64_t sub_1281E8()
{
  return swift_task_dealloc(*(void *)(v0 + 384));
}

void __swiftcall WatchRingsSnippet.init(model:)( WellnessFlowPlugin::WatchRingsSnippet *__return_ptr retstr, WellnessFlowPlugin::WatchRingsModel *model)
{
  Swift::Double value = model->exerciseGoalValue.value;
  Swift::Bool is_nil = model->exerciseGoalValue.is_nil;
  Swift::Double v4 = model->exerciseTotalValue.value;
  Swift::Bool v5 = model->exerciseTotalValue.is_nil;
  Swift::Double v6 = model->moveGoalValue.value;
  Swift::Bool v7 = model->moveGoalValue.is_nil;
  Swift::Double v8 = model->moveTotalValue.value;
  Swift::Bool v9 = model->moveTotalValue.is_nil;
  Swift::Double v10 = model->standGoalValue.value;
  Swift::Bool v11 = model->standGoalValue.is_nil;
  Swift::Double v12 = model->standTotalValue.value;
  Swift::Bool v13 = model->standTotalValue.is_nil;
  retstr->model.exerciseGoalValue.Swift::Double value = value;
  retstr->model.exerciseGoalValue.Swift::Bool is_nil = is_nil;
  retstr->model.exerciseTotalValue.Swift::Double value = v4;
  retstr->model.exerciseTotalValue.Swift::Bool is_nil = v5;
  retstr->model.moveGoalValue.Swift::Double value = v6;
  retstr->model.moveGoalValue.Swift::Bool is_nil = v7;
  retstr->model.moveTotalValue.Swift::Double value = v8;
  retstr->model.moveTotalValue.Swift::Bool is_nil = v9;
  retstr->model.standGoalValue.Swift::Double value = v10;
  retstr->model.standGoalValue.Swift::Bool is_nil = v11;
  retstr->model.standTotalValue.Swift::Double value = v12;
  retstr->model.standTotalValue.Swift::Bool is_nil = v13;
}

uint64_t WatchRingsSnippet.body.getter()
{
  uint64_t v0 = sub_494C(&qword_190938);
  unint64_t v1 = sub_128358();
  return SnippetBody.init(content:)(sub_1282BC, 0LL, v0, v1);
}

double sub_1282BC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = static Color.red.getter();
  uint64_t KeyPath = swift_getKeyPath(&unk_13FE58);
  uint64_t v4 = static Alignment.trailing.getter();
  _FrameLayout.init(width:height:alignment:)(&v11, 0x4062C00000000000LL, 0LL, 0x4062C00000000000LL, 0LL, v4, v5);
  uint64_t v6 = v11;
  char v7 = v12;
  uint64_t v8 = v13;
  char v9 = v14;
  *(void *)a1 = KeyPath;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(_BYTE *)(a1 + 40) = v9;
  double result = *(double *)&v15;
  *(_OWORD *)(a1 + 48) = v15;
  return result;
}

unint64_t sub_128358()
{
  unint64_t result = qword_190940;
  if (!qword_190940)
  {
    uint64_t v1 = sub_B64C(&qword_190938);
    sub_1283C4();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_190940);
  }

  return result;
}

unint64_t sub_1283C4()
{
  unint64_t result = qword_190948;
  if (!qword_190948)
  {
    uint64_t v1 = sub_B64C(&qword_190950);
    sub_128448();
    sub_128550( &qword_190960,  &qword_190968,  (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_190948);
  }

  return result;
}

unint64_t sub_128448()
{
  unint64_t result = qword_190958;
  if (!qword_190958)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Circle, &type metadata for Circle);
    atomic_store(result, (unint64_t *)&qword_190958);
  }

  return result;
}

uint64_t sub_128484(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2( a1,  &opaque type descriptor for <<opaque return type of WatchRingsSnippet.body>>,  1LL);
}

uint64_t sub_128494()
{
  return WatchRingsSnippet.body.getter();
}

void *initializeWithCopy for WatchRingsModel(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x59uLL);
}

uint64_t getEnumTagSinglePayload for WatchRingsModel(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 89)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for WatchRingsModel(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + sub_D7EC(v0 + 16, v0 + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 88) = 0;
    *(void *)unint64_t result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 89) = v3;
  return result;
}

ValueMetadata *type metadata accessor for WatchRingsSnippet()
{
  return &type metadata for WatchRingsSnippet;
}

uint64_t sub_128524()
{
  return sub_128550(&qword_190970, &qword_190978, (uint64_t)&protocol conformance descriptor for SnippetBody<A>);
}

uint64_t sub_128550(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_B64C(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_128590@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1285B8(void *a1)
{
  uint64_t v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t static UsoEntity_common_MedicationEvent.builder(dateTime:completionStatus:medSchedule:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UsoEntityBuilder_common_MedicationEvent(0LL);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  uint64_t v7 = UsoEntityBuilder_common_MedicationEvent.init()();
  if (a1)
  {
    uint64_t v8 = swift_retain(a1);
    dispatch thunk of UsoEntityBuilder_common_MedicationEvent.setDateTime(value:)( v8,  &protocol witness table for UsoEntityBuilder_common_DateTime);
    swift_release(a1);
  }

  if (a2)
  {
    uint64_t v9 = swift_retain(a2);
    dispatch thunk of UsoEntityBuilder_common_MedicationEvent.setCompletionStatus(value:)( v9,  &protocol witness table for UsoEntityBuilder_common_CompletionStatus);
    swift_release(a2);
  }

  if (a3)
  {
    uint64_t v10 = swift_retain(a3);
    dispatch thunk of UsoEntityBuilder_common_MedicationEvent.setMedicationSchedule(value:)( v10,  &protocol witness table for UsoEntityBuilder_common_MedicationSchedule);
    swift_release(a3);
  }

  return v7;
}

uint64_t static UsoEntity_common_MedicationEvent.with(dateTime:completionStatus:medSchedule:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = static UsoBuilderConversionUtils.convertEntityBuilderToEntity(entityBuilder:)();
  uint64_t v4 = type metadata accessor for UsoEntity_common_MedicationEvent(0LL);
  static UsoEntity_CodeGenConverter.convertAs<A>(entity:asType:)(v3, v4, v4);
  swift_release();
  swift_release();
  return v6;
}

void *sub_1286F4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for Date(0LL);
  uint64_t v28 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v27 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_494C(&qword_189CE8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11)
  {
    uint64_t v29 = a2;
    v25[0] = a1;
    v25[1] = v2;
    uint64_t v12 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v13 = *(void *)(v8 + 72);
    swift_bridgeObjectRetain(a1);
    char v14 = _swiftEmptyArrayStorage;
    __int128 v15 = &qword_189CE8;
    uint64_t v26 = v13;
    uint64_t v16 = (uint64_t)v27;
    do
    {
      sub_41850(v12, (uint64_t)v10, v15);
      if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v10, 1LL, v5) == 1)
      {
        sub_A4A4((uint64_t)v10, v15);
      }

      else
      {
        uint64_t v17 = v15;
        sub_12A4EC(v16);
        double v18 = Date.timeIntervalSince(_:)(v16);
        __int128 v19 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
        v19(v16, v5);
        v19((uint64_t)v10, v5);
        if ((swift_isUniquelyReferenced_nonNull_native(v14) & 1) == 0)
        {
          sub_3896C(0, v14[2] + 1LL, 1, (uint64_t)v14);
          char v14 = v22;
        }

        unint64_t v21 = v14[2];
        unint64_t v20 = v14[3];
        if (v21 >= v20 >> 1)
        {
          sub_3896C(v20 > 1, v21 + 1, 1, (uint64_t)v14);
          char v14 = v23;
        }

        v14[2] = v21 + 1;
        *(double *)&v14[v21 + 4] = v18;
        __int128 v15 = v17;
        uint64_t v13 = v26;
      }

      v12 += v13;
      --v11;
    }

    while (v11);
    swift_release();
    swift_bridgeObjectRelease();
  }

  else
  {
    swift_release();
    return _swiftEmptyArrayStorage;
  }

  return v14;
}

void sub_12892C()
{
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  sub_494C(&qword_189CE8);
  sub_6D20();
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  sub_12B100();
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v32 - v15;
  __chkstk_darwin(v14);
  double v18 = (char *)&v32 - v17;
  uint64_t v19 = type metadata accessor for Date(0LL);
  uint64_t v33 = v8;
  uint64_t v20 = 0LL;
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v8, 1LL, v19) != 1)
  {
    sub_41850(v33, (uint64_t)v18, &qword_189CE8);
    sub_A370C((uint64_t)v18);
    if (v21)
    {
      __break(1u);
      goto LABEL_21;
    }

    sub_73678();
    uint64_t v20 = static DialogCalendar.make(date:)(v18);
    sub_12B328();
    sub_B2558((uint64_t)v18, v22);
  }

  sub_A370C(v6);
  if (v21)
  {
    uint64_t v23 = 0LL;
    goto LABEL_9;
  }

  sub_41850(v6, (uint64_t)v16, &qword_189CE8);
  sub_A370C((uint64_t)v16);
  if (v21)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  sub_73678();
  uint64_t v23 = static DialogCalendar.make(date:)(v16);
  sub_12B328();
  sub_B2558((uint64_t)v16, v24);
LABEL_9:
  sub_A370C(v4);
  if (!v21)
  {
    sub_41850(v4, v0, &qword_189CE8);
    sub_A370C(v0);
    if (!v21)
    {
      sub_73678();
      uint64_t v25 = static DialogCalendar.make(date:)(v0);
      sub_12B328();
      sub_B2558(v0, v26);
      goto LABEL_14;
    }

uint64_t sub_128C14()
{
  unsigned __int8 v0 = sub_12AB68();
  return (v0 > 6u) | (0x38u >> v0) & 1;
}

uint64_t sub_128C44()
{
  *(double *)&uint64_t result = COERCE_DOUBLE(sub_12A1C0());
  if ((v1 & 1) == 0) {
    *(double *)&uint64_t result = fabs(*(double *)&result / 60.0);
  }
  return result;
}

uint64_t sub_128C7C@<X0>(uint64_t a1@<X8>)
{
  char v2 = sub_12AB68();
  if (v2 == 6)
  {
    uint64_t v3 = 1LL;
  }

  else
  {
    uint64_t v4 = sub_B2610(v2);
    String.toSpeakableString.getter(v4, v5);
    swift_bridgeObjectRelease();
    uint64_t v3 = 0LL;
  }

  uint64_t v6 = type metadata accessor for SpeakableString(0LL);
  return _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(a1, v3, 1LL, v6);
}

void sub_128CE4()
{
  uint64_t v6 = sub_12B0D8();
  sub_12B114();
  __chkstk_darwin(v7);
  sub_A37EC();
  __chkstk_darwin(v8);
  sub_12B030();
  __chkstk_darwin(v9);
  sub_12B0C4();
  sub_A614(v3, 1LL, v6);
  if (v11)
  {
    uint64_t v10 = v3;
LABEL_7:
    sub_A4A4(v10, &qword_189CE8);
    goto LABEL_8;
  }

  sub_12B09C();
  sub_12B2F4();
  sub_A614(v2, 1LL, v6);
  if (v11)
  {
    sub_12B124();
    uint64_t v10 = v2;
    goto LABEL_7;
  }

  sub_12B150();
  uint64_t v12 = sub_12B24C();
  if ((v13 & 1) != 0 || v12 != 6)
  {
    sub_12B170();
    sub_90E6C(v0);
  }

  else
  {
    sub_12B2E4();
    sub_12B160();
    sub_12B088();
    sub_BB2E4(v1);
    sub_BB2E4(v0);
  }

LABEL_8:
  sub_D8FC();
}

  sub_D8FC();
}

  sub_D8FC();
}

void sub_128E1C()
{
  uint64_t v16 = __chkstk_darwin(v15);
  sub_12B274(v16, v17, v18, v19, v20, v21, v22, v23, v43);
  __chkstk_darwin(v24);
  sub_A37EC();
  __chkstk_darwin(v25);
  sub_12B0B0();
  sub_12B114();
  __chkstk_darwin(v26);
  sub_72EAC();
  __chkstk_darwin(v27);
  sub_12B100();
  __chkstk_darwin(v28);
  sub_12B0EC();
  sub_12AF80(v3);
  if (v31)
  {
    uint64_t v29 = &qword_189CE8;
    uint64_t v30 = v3;
  }

  else
  {
    sub_12B180();
    sub_12B2EC();
    sub_12AF80(v2);
    if (v31)
    {
      sub_12B220(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
      uint64_t v29 = &qword_189CE8;
      uint64_t v30 = v2;
    }

    else
    {
      sub_12B2AC();
      uint64_t v32 = sub_12B208();
      if ((v33 & 1) != 0 || v32 != 6)
      {
        sub_DE330(v6);
        sub_DE330(v5);
        goto LABEL_8;
      }

      uint64_t v34 = sub_12B00C();
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v44, 1LL, 1LL, v34);
      sub_12AFA4();
      uint64_t v35 = sub_12B258();
      sub_12B31C(v35, v36, v37, v38, 0LL, 1LL);
      sub_12B2BC();
      sub_12B314();
      sub_12B134();
      sub_12AF9C(v0);
      sub_12B28C();
      sub_12B22C(v44, v39, &qword_189CE8);
      sub_12AF80(v1);
      if (!v31)
      {
        sub_12B214();
        sub_A4A4(v44, &qword_189CE8);
        sub_12B078();
        sub_12AF9C(v6);
        sub_12AF9C(v5);
        sub_12AF9C(v1);
        goto LABEL_8;
      }

      sub_A3758(v44);
      sub_12B078();
      sub_12AF9C(v6);
      sub_12AF9C(v5);
      uint64_t v30 = sub_BB080();
    }
  }

  sub_A4A4(v30, v29);
LABEL_8:
  sub_D8FC();
}

void sub_1290B8()
{
  uint64_t v6 = sub_12B0D8();
  sub_12B114();
  __chkstk_darwin(v7);
  sub_A37EC();
  __chkstk_darwin(v8);
  sub_12B030();
  __chkstk_darwin(v9);
  sub_12B0C4();
  sub_A614(v3, 1LL, v6);
  if (v11)
  {
    uint64_t v10 = v3;
LABEL_7:
    sub_A4A4(v10, &qword_189CE8);
    goto LABEL_8;
  }

  sub_12B09C();
  sub_12B2F4();
  sub_A614(v2, 1LL, v6);
  if (v11)
  {
    sub_12B124();
    uint64_t v10 = v2;
    goto LABEL_7;
  }

  sub_12B150();
  uint64_t v12 = sub_12B24C();
  if ((v13 & 1) != 0 || (unint64_t)(v12 - 31) < 0xFFFFFFFFFFFFFFFCLL)
  {
    sub_12B170();
    sub_90E6C(v0);
  }

  else
  {
    sub_12B2E4();
    sub_12B160();
    sub_12B088();
    sub_BB2E4(v1);
    sub_BB2E4(v0);
  }

void sub_1291F4()
{
  uint64_t v43 = sub_BB308();
  uint64_t v41 = *(void *)(v43 - 8);
  sub_D978();
  __chkstk_darwin(v7);
  uint64_t v39 = (char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_494C(&qword_18CED0);
  sub_6D20();
  __chkstk_darwin(v9);
  sub_12B1B4(v10, v35[0]);
  sub_494C(&qword_18CED8);
  sub_6D20();
  __chkstk_darwin(v11);
  uint64_t v42 = sub_12AFF0();
  uint64_t v40 = *(void *)(v42 - 8);
  sub_D978();
  __chkstk_darwin(v12);
  sub_12B05C(v13, v35[0]);
  sub_494C(&qword_189CE8);
  sub_6D20();
  __chkstk_darwin(v14);
  sub_12B198();
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v37 = (char *)v35 - v17;
  __chkstk_darwin(v16);
  sub_A37EC();
  __chkstk_darwin(v18);
  uint64_t v19 = sub_12B0B0();
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  sub_72EAC();
  __chkstk_darwin(v21);
  sub_12B100();
  __chkstk_darwin(v22);
  sub_12B0EC();
  sub_12AF80(v3);
  if (v26)
  {
    uint64_t v23 = &qword_189CE8;
    uint64_t v24 = v3;
LABEL_12:
    sub_A4A4(v24, v23);
    goto LABEL_13;
  }

  v35[1] = v4;
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32);
  v25(v5, v3, v19);
  sub_12B2EC();
  sub_12AF80(v2);
  if (v26)
  {
    sub_12B220(*(uint64_t (**)(uint64_t, uint64_t))(v20 + 8));
    uint64_t v23 = &qword_189CE8;
    uint64_t v24 = v2;
    goto LABEL_12;
  }

  v25(v6, v2, v19);
  uint64_t v27 = sub_12B208();
  if ((v28 & 1) != 0 || (unint64_t)(v27 - 31) < 0xFFFFFFFFFFFFFFFCLL)
  {
    sub_DE330(v6);
    sub_DE330(v5);
    goto LABEL_13;
  }

  uint64_t v29 = sub_12B00C();
  uint64_t v30 = v36;
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v36, 1LL, 1LL, v29);
  uint64_t v31 = v38;
  DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)( v1,  v30,  0LL,  1LL,  0LL,  1LL,  -1LL,  0LL);
  uint64_t v32 = (uint64_t)v39;
  sub_1299B0();
  sub_12B314();
  uint64_t v33 = (uint64_t)v37;
  Calendar.date(byAdding:to:wrappingComponents:)(v31, v0, 0LL);
  sub_12AF9C(v0);
  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v32, v43);
  sub_12B22C(v33, v34, &qword_189CE8);
  sub_12AF80(v32);
  if (v26)
  {
    sub_A3758(v33);
    sub_12B238();
    sub_12AF9C(v6);
    sub_12AF9C(v5);
    uint64_t v24 = sub_BB080();
    goto LABEL_12;
  }

  sub_12B214();
  sub_A4A4(v33, &qword_189CE8);
  sub_12B238();
  sub_12AF9C(v6);
  sub_12AF9C(v5);
  sub_12AF9C(v32);
LABEL_13:
  sub_D8FC();
}

void sub_12956C()
{
  uint64_t v6 = sub_12B0D8();
  sub_12B114();
  __chkstk_darwin(v7);
  sub_A37EC();
  __chkstk_darwin(v8);
  sub_12B030();
  __chkstk_darwin(v9);
  sub_12B0C4();
  sub_A614(v3, 1LL, v6);
  if (v11)
  {
    uint64_t v10 = v3;
LABEL_7:
    sub_A4A4(v10, &qword_189CE8);
    goto LABEL_8;
  }

  sub_12B09C();
  sub_12B2F4();
  sub_A614(v2, 1LL, v6);
  if (v11)
  {
    sub_12B124();
    uint64_t v10 = v2;
    goto LABEL_7;
  }

  sub_12B150();
  uint64_t v12 = sub_12B24C();
  if ((v13 & 1) != 0 || (v12 & 0xFFFFFFFFFFFFFFFELL) != 0x16C)
  {
    sub_12B170();
    sub_90E6C(v0);
  }

  else
  {
    sub_12B2E4();
    sub_12B160();
    sub_12B088();
    sub_BB2E4(v1);
    sub_BB2E4(v0);
  }

void sub_1296A8()
{
  uint64_t v16 = __chkstk_darwin(v15);
  sub_12B274(v16, v17, v18, v19, v20, v21, v22, v23, v43);
  __chkstk_darwin(v24);
  sub_A37EC();
  __chkstk_darwin(v25);
  sub_12B0B0();
  sub_12B114();
  __chkstk_darwin(v26);
  sub_72EAC();
  __chkstk_darwin(v27);
  sub_12B100();
  __chkstk_darwin(v28);
  sub_12B0EC();
  sub_12AF80(v3);
  if (v31)
  {
    uint64_t v29 = &qword_189CE8;
    uint64_t v30 = v3;
  }

  else
  {
    sub_12B180();
    sub_12B2EC();
    sub_12AF80(v2);
    if (v31)
    {
      sub_12B220(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
      uint64_t v29 = &qword_189CE8;
      uint64_t v30 = v2;
    }

    else
    {
      sub_12B2AC();
      uint64_t v32 = sub_12B208();
      if ((v33 & 1) != 0 || (v32 & 0xFFFFFFFFFFFFFFFELL) != 0x16C)
      {
        sub_DE330(v6);
        sub_DE330(v5);
        goto LABEL_8;
      }

      uint64_t v34 = sub_12B00C();
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v44, 1LL, 1LL, v34);
      sub_12AFA4();
      uint64_t v35 = sub_12B258();
      sub_12B31C(v35, v36, v37, v38, -1LL, 0LL);
      sub_12B2BC();
      sub_12B314();
      sub_12B134();
      sub_12AF9C(v0);
      sub_12B28C();
      sub_12B22C(v44, v39, &qword_189CE8);
      sub_12AF80(v1);
      if (!v31)
      {
        sub_12B214();
        sub_A4A4(v44, &qword_189CE8);
        sub_12B078();
        sub_12AF9C(v6);
        sub_12AF9C(v5);
        sub_12AF9C(v1);
        goto LABEL_8;
      }

      sub_A3758(v44);
      sub_12B078();
      sub_12AF9C(v6);
      sub_12AF9C(v5);
      uint64_t v30 = sub_BB080();
    }
  }

  sub_A4A4(v30, v29);
LABEL_8:
  sub_D8FC();
}

uint64_t sub_129944()
{
  uint64_t v0 = type metadata accessor for DialogDuration.Builder(0LL);
  sub_A72C(v0);
  DialogDuration.Builder.init()();
  uint64_t v1 = sub_12A1C0();
  dispatch thunk of DialogDuration.Builder.withSecs(_:)(v1, v2 & 1);
  uint64_t v3 = swift_release();
  uint64_t v4 = dispatch thunk of DialogDuration.Builder.build()(v3);
  sub_3652C();
  return v4;
}

uint64_t sub_1299B0()
{
  uint64_t v70 = v2;
  uint64_t v71 = v3;
  uint64_t v5 = v4;
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v65 = *(void *)(v6 - 8);
  sub_D978();
  __chkstk_darwin(v7);
  sub_12B1B4(v8, v60);
  uint64_t v9 = ((uint64_t (*)(void))type metadata accessor for Calendar.Identifier)(0LL);
  uint64_t v66 = *(void *)(v9 - 8);
  sub_D978();
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_494C(&qword_189D00);
  sub_6D20();
  __chkstk_darwin(v13);
  sub_12B198();
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v60 - v15;
  uint64_t v63 = v0;
  uint64_t v17 = v0 + OBJC_IVAR____TtC18WellnessFlowPlugin12WellnessTime_calendarIdentifier;
  sub_41850( v0 + OBJC_IVAR____TtC18WellnessFlowPlugin12WellnessTime_calendarIdentifier,  (uint64_t)&v60 - v15,  &qword_189D00);
  uint64_t v18 = type metadata accessor for SpeakableString(0LL);
  uint64_t v19 = sub_A370C((uint64_t)v16);
  if (v26)
  {
    sub_A4A4((uint64_t)v16, &qword_189D00);
    return static Calendar.current.getter(v20);
  }

  uint64_t v60 = v6;
  uint64_t v61 = v9;
  uint64_t v62 = v5;
  uint64_t v22 = SpeakableString.print.getter(v19);
  uint64_t v24 = v23;
  uint64_t v25 = *(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8LL);
  v25(v16, v18);
  BOOL v26 = v22 == 0x6169726F67657267LL && v24 == 0xE90000000000006ELL;
  if (!v26 && (sub_12AF70(0x6169726F67657267LL, 0xE90000000000006ELL) & 1) == 0)
  {
    BOOL v30 = v22 == 0x7473696864647562LL && v24 == 0xE800000000000000LL;
    if (v30 || (sub_12AF70(0x7473696864647562LL, 0xE800000000000000LL) & 1) != 0)
    {
      sub_1EBF4();
      uint64_t v27 = (unsigned int *)&enum case for Calendar.Identifier.buddhist(_:);
      goto LABEL_11;
    }

    BOOL v31 = v22 == 0x6573656E696863LL && v24 == 0xE700000000000000LL;
    if (v31 || (sub_12AF70(0x6573656E696863LL, 0xE700000000000000LL) & 1) != 0)
    {
      sub_1EBF4();
      uint64_t v27 = (unsigned int *)&enum case for Calendar.Identifier.chinese(_:);
      goto LABEL_11;
    }

    BOOL v32 = v22 == 0x636974706F63LL && v24 == 0xE600000000000000LL;
    if (v32 || (sub_12AF70(0x636974706F63LL, 0xE600000000000000LL) & 1) != 0)
    {
      sub_1EBF4();
      uint64_t v27 = (unsigned int *)&enum case for Calendar.Identifier.coptic(_:);
      goto LABEL_11;
    }

    char v33 = (void (*)(uint64_t, uint64_t))v25;
    if (v22 == 0xD000000000000013LL && v24 == 0x8000000000147E30LL
      || (sub_12AF70(0xD000000000000013LL, 0x8000000000147E30LL) & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v27 = (unsigned int *)&enum case for Calendar.Identifier.ethiopicAmeteMihret(_:);
      goto LABEL_11;
    }

    if (v22 == 0xD000000000000011LL && v24 == 0x8000000000147E50LL
      || (sub_12AF70(0xD000000000000011LL, 0x8000000000147E50LL) & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v27 = (unsigned int *)&enum case for Calendar.Identifier.ethiopicAmeteAlem(_:);
      goto LABEL_11;
    }

    BOOL v34 = v22 == 0x776572626568LL && v24 == 0xE600000000000000LL;
    if (v34 || (sub_12AF70(0x776572626568LL, 0xE600000000000000LL) & 1) != 0)
    {
      sub_1EBF4();
      uint64_t v27 = (unsigned int *)&enum case for Calendar.Identifier.hebrew(_:);
      goto LABEL_11;
    }

    BOOL v35 = v22 == 0x313036386F7369LL && v24 == 0xE700000000000000LL;
    if (v35 || (sub_12AF70(0x313036386F7369LL, 0xE700000000000000LL) & 1) != 0)
    {
      sub_1EBF4();
      uint64_t v27 = (unsigned int *)&enum case for Calendar.Identifier.iso8601(_:);
      goto LABEL_11;
    }

    BOOL v36 = v22 == 0x6E6169646E69LL && v24 == 0xE600000000000000LL;
    if (v36 || (sub_12AF70(0x6E6169646E69LL, 0xE600000000000000LL) & 1) != 0)
    {
      sub_1EBF4();
      uint64_t v27 = (unsigned int *)&enum case for Calendar.Identifier.indian(_:);
      goto LABEL_11;
    }

    BOOL v37 = v22 == 0x63696D616C7369LL && v24 == 0xE700000000000000LL;
    if (v37
      || (uint64_t v38 = sub_12B29C(), (sub_12AF70(v38 & 0xFFFFFFFFFFFFLL | 0x63000000000000LL, 0xE700000000000000LL) & 1) != 0))
    {
      sub_1EBF4();
      uint64_t v27 = (unsigned int *)&enum case for Calendar.Identifier.islamic(_:);
      goto LABEL_11;
    }

    BOOL v39 = v22 == 0x4363696D616C7369LL && v24 == 0xEC0000006C697669LL;
    if (v39
      || (uint64_t v40 = sub_12B29C(), (sub_12AF70(v40 & 0xFFFFFFFFFFFFLL | 0x4363000000000000LL, 0xEC0000006C697669LL) & 1) != 0))
    {
      sub_1EBF4();
      uint64_t v27 = (unsigned int *)&enum case for Calendar.Identifier.islamicCivil(_:);
      goto LABEL_11;
    }

    BOOL v41 = v22 == 0x6573656E6170616ALL && v24 == 0xE800000000000000LL;
    if (v41 || (sub_12AF70(0x6573656E6170616ALL, 0xE800000000000000LL) & 1) != 0)
    {
      sub_1EBF4();
      uint64_t v27 = (unsigned int *)&enum case for Calendar.Identifier.japanese(_:);
      goto LABEL_11;
    }

    BOOL v42 = v22 == 0x6E616973726570LL && v24 == 0xE700000000000000LL;
    if (v42 || (sub_12AF70(0x6E616973726570LL, 0xE700000000000000LL) & 1) != 0)
    {
      sub_1EBF4();
      uint64_t v27 = (unsigned int *)&enum case for Calendar.Identifier.persian(_:);
      goto LABEL_11;
    }

    BOOL v43 = v22 == 0x63696C6275706572LL && v24 == 0xEF616E696843664FLL;
    if (v43 || (sub_12AF70(0x63696C6275706572LL, 0xEF616E696843664FLL) & 1) != 0)
    {
      sub_1EBF4();
      uint64_t v27 = (unsigned int *)&enum case for Calendar.Identifier.republicOfChina(_:);
      goto LABEL_11;
    }

    BOOL v44 = v22 == 0x5463696D616C7369LL && v24 == 0xEE0072616C756261LL;
    if (v44
      || (uint64_t v45 = sub_12B29C(), (sub_12AF70(v45 & 0xFFFFFFFFFFFFLL | 0x5463000000000000LL, 0xEE0072616C756261LL) & 1) != 0))
    {
      sub_1EBF4();
      uint64_t v27 = (unsigned int *)&enum case for Calendar.Identifier.islamicTabular(_:);
      goto LABEL_11;
    }

    if (v22 == 0xD000000000000010LL && v24 == 0x8000000000147E70LL)
    {
      swift_bridgeObjectRelease();
LABEL_96:
      uint64_t v27 = (unsigned int *)&enum case for Calendar.Identifier.islamicUmmAlQura(_:);
      goto LABEL_11;
    }

    char v46 = sub_12AF70(0xD000000000000010LL, 0x8000000000147E70LL);
    uint64_t v47 = sub_1EBF4();
    if ((v46 & 1) != 0) {
      goto LABEL_96;
    }
    uint64_t v48 = Logger.wellness.unsafeMutableAddressor(v47);
    swift_beginAccess(v48, &v69, 0LL, 0LL);
    uint64_t v49 = sub_BB080();
    v50(v49);
    uint64_t v51 = swift_retain_n(v63, 2LL);
    uint64_t v52 = (os_log_s *)Logger.logObject.getter(v51);
    os_log_type_t v53 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v52, v53))
    {
      uint64_t v54 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v55 = swift_slowAlloc(32LL, -1LL);
      uint64_t v68 = v55;
      *(_DWORD *)uint64_t v54 = 136315138;
      sub_41850(v17, v1, &qword_189D00);
      uint64_t v56 = sub_A370C(v1);
      if (v26)
      {
        sub_A4A4(v1, &qword_189D00);
        uint64_t v57 = 0LL;
        unint64_t v59 = 0xE000000000000000LL;
      }

      else
      {
        uint64_t v57 = SpeakableString.print.getter(v56);
        unint64_t v59 = v58;
        v33(v1, v18);
      }

      uint64_t v67 = sub_39178(v57, v59, &v68);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, &v68, v54 + 4, v54 + 12);
      sub_12B2FC();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v52, v53, "Unknown calendar identifier: %s", v54, 0xCu);
      swift_arrayDestroy(v55, 1LL);
      sub_5050(v55);
      sub_5050((uint64_t)v54);
    }

    else
    {

      sub_12B2FC();
    }

    uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v65 + 8))(v64, v60);
    return static Calendar.current.getter(v20);
  }

  sub_1EBF4();
  uint64_t v27 = (unsigned int *)&enum case for Calendar.Identifier.gregorian(_:);
LABEL_11:
  uint64_t v28 = v66;
  uint64_t v29 = v61;
  (*(void (**)(char *, void, uint64_t))(v66 + 104))(v12, *v27, v61);
  ((void (*)(char *))Calendar.init(identifier:))(v12);
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v12, v29);
}

uint64_t sub_12A1C0()
{
  uint64_t v1 = sub_494C(&qword_190980);
  uint64_t v2 = *(void *)(sub_494C(&qword_189CE8) - 8);
  uint64_t v3 = *(void *)(v2 + 72);
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 32) & ~v4;
  uint64_t v6 = swift_allocObject(v1, v5 + 2 * v3, v4 | 7);
  *(_OWORD *)(v6 + 16) = xmmword_138D90;
  sub_12AC34(v6 + v5);
  sub_12ABD8(v6 + v5 + v3);
  swift_retain();
  uint64_t v7 = sub_1286F4(v6, v0);
  swift_setDeallocating(v6);
  sub_12AC90();
  if (v7[2])
  {
    uint64_t v8 = v7[4];
    swift_bridgeObjectRelease();
    return v8 & 0x7FFFFFFFFFFFFFFFLL;
  }

  else
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

uint64_t sub_12A2B0@<X0>(uint64_t a1@<X8>)
{
  if (!*(void *)(v1 + 24) || (double v3 = COERCE_DOUBLE(DialogCalendar.secs.getter()), (v4 & 1) != 0))
  {
    uint64_t v5 = 1LL;
  }

  else
  {
    Date.init(timeIntervalSince1970:)(v3);
    uint64_t v5 = 0LL;
  }

  uint64_t v6 = type metadata accessor for Date(0LL);
  return _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(a1, v5, 1LL, v6);
}

uint64_t sub_12A30C@<X0>(uint64_t a1@<X8>)
{
  if (!*(void *)(v1 + 32) || (double v3 = COERCE_DOUBLE(DialogCalendar.secs.getter()), (v4 & 1) != 0))
  {
    uint64_t v5 = 1LL;
  }

  else
  {
    Date.init(timeIntervalSince1970:)(v3);
    uint64_t v5 = 0LL;
  }

  uint64_t v6 = type metadata accessor for Date(0LL);
  return _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(a1, v5, 1LL, v6);
}

uint64_t sub_12A368(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  uint64_t v2 = type metadata accessor for Calendar(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DateComponents(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1299B0();
  uint64_t v10 = sub_494C(&qword_18E418);
  uint64_t v11 = type metadata accessor for Calendar.Component(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  uint64_t v15 = swift_allocObject(v10, v14 + *(void *)(v12 + 72), v13 | 7);
  *(_OWORD *)(v15 + 16) = xmmword_137250;
  (*(void (**)(uint64_t, void, uint64_t))(v12 + 104))( v15 + v14,  enum case for Calendar.Component.day(_:),  v11);
  sub_12AD20();
  Calendar.dateComponents(_:from:to:)(v16, v20, v21);
  swift_bridgeObjectRelease();
  uint64_t v17 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v18 = DateComponents.day.getter(v17);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v18;
}

void sub_12A4EC(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_494C(&qword_189CE8);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = &v19[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  __chkstk_darwin(v4);
  uint64_t v8 = &v19[-v7 - 8];
  swift_beginAccess(v1 + 16, v19, 0LL, 0LL);
  uint64_t v9 = *(void **)(v1 + 16);
  if (!v9)
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    goto LABEL_12;
  }

  id v10 = v9;
  uint64_t v11 = dispatch thunk of CATGlobals.toDictionary.getter();

  sub_12BE4C(0xD000000000000010LL, 0x8000000000147E10LL, v11, &v20);
  swift_bridgeObjectRelease();
  if (!*((void *)&v21 + 1))
  {
LABEL_12:
    sub_A4A4((uint64_t)&v20, &qword_18AA78);
LABEL_13:
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    goto LABEL_14;
  }

  uint64_t v12 = sub_494C(&qword_190988);
  sub_12BE4C(7827310LL, 0xE300000000000000LL, v18, &v20);
  swift_bridgeObjectRelease();
  if (!*((void *)&v21 + 1))
  {
LABEL_14:
    sub_A4A4((uint64_t)&v20, &qword_18AA78);
LABEL_15:
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    goto LABEL_16;
  }

  uint64_t v13 = sub_494C(&qword_190988);
  sub_12BE4C(1935893875LL, 0xE400000000000000LL, v18, &v20);
  swift_bridgeObjectRelease();
  if (!*((void *)&v21 + 1))
  {
LABEL_16:
    sub_A4A4((uint64_t)&v20, &qword_18AA78);
    goto LABEL_17;
  }

  if ((swift_dynamicCast(&v18, &v20, (char *)&type metadata for Any + 8, &type metadata for Double, 6LL) & 1) != 0)
  {
    Date.init(timeIntervalSince1970:)(*(double *)&v18);
    uint64_t v14 = type metadata accessor for Date(0LL);
    uint64_t v15 = (uint64_t)v8;
    uint64_t v16 = 0LL;
    goto LABEL_18;
  }

uint64_t sub_12A7C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_494C(&qword_190990);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v31 - v10;
  uint64_t v12 = sub_494C(&qword_190998);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v31 - v16;
  uint64_t v18 = type metadata accessor for Date(0LL);
  sub_A410( &qword_189D08,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
  uint64_t result = dispatch thunk of static Comparable.<= infix(_:_:)(a1, a2, v18, v19);
  if ((result & 1) != 0)
  {
    uint64_t v21 = *(int *)(v6 + 48);
    uint64_t v31 = v12;
    uint64_t v32 = v3;
    uint64_t v22 = &v11[v21];
    uint64_t v23 = *(void **)(v18 - 8);
    uint64_t v24 = a1;
    uint64_t v25 = a2;
    BOOL v26 = (void (*)(char *, uint64_t, uint64_t))v23[2];
    v26(v11, v24, v18);
    v26(v22, v25, v18);
    uint64_t v27 = &v9[*(int *)(v6 + 48)];
    v26(v9, (uint64_t)v11, v18);
    v26(v27, (uint64_t)v22, v18);
    uint64_t v28 = (void (*)(char *, char *, uint64_t))v23[4];
    v28(v15, v9, v18);
    uint64_t v29 = (void (*)(char *, uint64_t))v23[1];
    v29(v27, v18);
    BOOL v30 = &v9[*(int *)(v6 + 48)];
    v28(v9, v11, v18);
    v28(v30, v22, v18);
    v28(&v15[*(int *)(v31 + 36)], v30, v18);
    v29(v9, v18);
    sub_12ACD8((uint64_t)v15, (uint64_t)v17);
    LOBYTE(v22) = sub_12AA04(v32);
    sub_A4A4((uint64_t)v17, &qword_190998);
    return v22 & 1;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_12AA04(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_494C(&qword_190998);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for Date(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_A410(&qword_189D08, v11, (uint64_t)&protocol conformance descriptor for Date);
  uint64_t v13 = v12;
  char v14 = dispatch thunk of static Comparable.>= infix(_:_:)(a1, v2, v7, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  sub_41850(v2, (uint64_t)v6, &qword_190998);
  if ((v14 & 1) != 0) {
    char v15 = dispatch thunk of static Comparable.<= infix(_:_:)(v10, &v6[*(int *)(v4 + 36)], v7, v13);
  }
  else {
    char v15 = 0;
  }
  sub_A4A4((uint64_t)v6, &qword_190998);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15 & 1;
}

uint64_t sub_12AB68()
{
  if ((v0 & 1) != 0) {
    return 0LL;
  }
  sub_1290B8();
  if ((v2 & 1) != 0) {
    return 1LL;
  }
  sub_12956C();
  if ((v3 & 1) != 0) {
    return 2LL;
  }
  sub_128E1C();
  if ((v4 & 1) != 0) {
    return 3LL;
  }
  sub_1291F4();
  if ((v5 & 1) != 0) {
    return 4LL;
  }
  sub_1296A8();
  if ((v6 & 1) != 0) {
    return 5LL;
  }
  else {
    return 6LL;
  }
}

uint64_t sub_12ABD8@<X0>(uint64_t a1@<X8>)
{
  if (!*(void *)(v1 + 40) || (double v3 = COERCE_DOUBLE(DialogCalendar.secs.getter()), (v4 & 1) != 0))
  {
    uint64_t v5 = 1LL;
  }

  else
  {
    Date.init(timeIntervalSince1970:)(v3);
    uint64_t v5 = 0LL;
  }

  uint64_t v6 = type metadata accessor for Date(0LL);
  return _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(a1, v5, 1LL, v6);
}

uint64_t sub_12AC34@<X0>(uint64_t a1@<X8>)
{
  if (!*(void *)(v1 + 48) || (double v3 = COERCE_DOUBLE(DialogCalendar.secs.getter()), (v4 & 1) != 0))
  {
    uint64_t v5 = 1LL;
  }

  else
  {
    Date.init(timeIntervalSince1970:)(v3);
    uint64_t v5 = 0LL;
  }

  uint64_t v6 = type metadata accessor for Date(0LL);
  return _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(a1, v5, 1LL, v6);
}

uint64_t sub_12AC90()
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(sub_494C(&qword_189CE8) - 8) + 80LL);
  swift_arrayDestroy(v0 + ((v1 + 32) & ~v1), *(void *)(v0 + 16));
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t sub_12ACD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_494C(&qword_190998);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void sub_12AD20()
{
  uint64_t v2 = v1;
  uint64_t v3 = type metadata accessor for Calendar.Component(0LL);
  uint64_t v34 = *(void *)(v3 - 8);
  sub_D978();
  __chkstk_darwin(v4);
  sub_12B030();
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v29 - v6;
  uint64_t v8 = *(void *)(v2 + 16);
  if (v8
    && (sub_494C(&qword_1909A0),
        uint64_t v9 = static _SetStorage.allocate(capacity:)(v8),
        uint64_t v10 = v9,
        (uint64_t v31 = *(void *)(v2 + 16)) != 0))
  {
    unint64_t v11 = 0LL;
    uint64_t v33 = v9 + 56;
    uint64_t v12 = *(unsigned __int8 *)(v34 + 80);
    uint64_t v29 = v2;
    uint64_t v30 = v2 + ((v12 + 32) & ~v12);
    while (v11 < *(void *)(v2 + 16))
    {
      uint64_t v13 = *(void *)(v34 + 72);
      char v14 = *(void (**)(char *, unint64_t, uint64_t))(v34 + 16);
      v14(v7, v30 + v13 * v11, v3);
      uint64_t v15 = *(void *)(v10 + 40);
      sub_A410( &qword_1909A8,  (uint64_t (*)(uint64_t))&type metadata accessor for Calendar.Component,  (uint64_t)&protocol conformance descriptor for Calendar.Component);
      uint64_t v17 = dispatch thunk of Hashable._rawHashValue(seed:)(v15, v3, v16) & ~(-1LL << *(_BYTE *)(v10 + 32));
      sub_12B2CC();
      if ((v20 & v19) != 0)
      {
        unint64_t v32 = v11;
        uint64_t v22 = ~v21;
        while (1)
        {
          v14(v0, *(void *)(v10 + 48) + v17 * v13, v3);
          sub_A410( qword_1909B0,  (uint64_t (*)(uint64_t))&type metadata accessor for Calendar.Component,  (uint64_t)&protocol conformance descriptor for Calendar.Component);
          char v24 = dispatch thunk of static Equatable.== infix(_:_:)(v0, v7, v3, v23);
          uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
          v25((uint64_t)v0, v3);
          if ((v24 & 1) != 0) {
            break;
          }
          uint64_t v17 = (v17 + 1) & v22;
          sub_12B2CC();
          if ((v19 & v20) == 0)
          {
            uint64_t v2 = v29;
            unint64_t v11 = v32;
            goto LABEL_10;
          }
        }

        v25((uint64_t)v7, v3);
        uint64_t v2 = v29;
        unint64_t v11 = v32;
      }

      else
      {
LABEL_10:
        *(void *)(v33 + 8 * v18) = v20 | v19;
        (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(*(void *)(v10 + 48) + v17 * v13, v7, v3);
        uint64_t v26 = *(void *)(v10 + 16);
        BOOL v27 = __OFADD__(v26, 1LL);
        uint64_t v28 = v26 + 1;
        if (v27) {
          goto LABEL_16;
        }
        *(void *)(v10 + 16) = v28;
      }

      if (++v11 == v31) {
        goto LABEL_14;
      }
    }

    __break(1u);
LABEL_16:
    __break(1u);
  }

  else
  {
LABEL_14:
    swift_bridgeObjectRelease(v2);
    sub_D8FC();
  }

uint64_t sub_12AF70(uint64_t a1, uint64_t a2)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v2, v3, 0LL);
}

uint64_t sub_12AF80(uint64_t a1)
{
  return _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(a1, 1LL, v1);
}

uint64_t sub_12AF9C(uint64_t a1)
{
  return v1(a1, v2);
}

  ;
}

uint64_t sub_12AFF0()
{
  return type metadata accessor for DateComponents(0LL);
}

uint64_t sub_12B00C()
{
  return type metadata accessor for TimeZone(0LL);
}

  ;
}

  ;
}

void sub_12B05C(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 128) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_12B078()
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 144) + 8LL))(v0, *(void *)(v1 - 136));
}

uint64_t sub_12B088()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_12B09C()
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v1, v2, v0);
}

uint64_t sub_12B0B0()
{
  return type metadata accessor for Date(0LL);
}

uint64_t sub_12B0C4()
{
  return sub_12A2B0(v0);
}

uint64_t sub_12B0D8()
{
  return type metadata accessor for Date(0LL);
}

uint64_t sub_12B0EC()
{
  return sub_12A2B0(v0);
}

  ;
}

  ;
}

uint64_t sub_12B124()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_12B134()
{
  return Calendar.date(byAdding:to:wrappingComponents:)(v1, v0, 0LL);
}

uint64_t sub_12B150()
{
  return v3(v1, v2, v0);
}

uint64_t sub_12B160()
{
  return sub_12A7C4(v0, v1);
}

uint64_t sub_12B170()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_12B180()
{
  *(void *)(v5 - 152) = v0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v4, v1, v2);
}

  ;
}

void sub_12B1B4(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 144) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

void sub_12B1D0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 104) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

void sub_12B1EC(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 112) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_12B208()
{
  return sub_12A368(v0, v1);
}

uint64_t sub_12B214()
{
  return sub_12A7C4(v0, v1);
}

uint64_t sub_12B220@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

void sub_12B22C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
}

uint64_t sub_12B238()
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 112) + 8LL))(v0, *(void *)(v1 - 96));
}

uint64_t sub_12B24C()
{
  return sub_12A368(v0, v1);
}

uint64_t sub_12B258()
{
  return v0;
}

void sub_12B274( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 120) = (char *)&a9 - v9;
}

uint64_t sub_12B28C()
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 96) + 8LL))(v0, *(void *)(v1 - 88));
}

uint64_t sub_12B29C()
{
  return 0x696D616C7369LL;
}

uint64_t sub_12B2AC()
{
  return v0(v3, v1, v2);
}

uint64_t sub_12B2BC()
{
  return sub_1299B0();
}

  ;
}

void sub_12B2E4()
{
}

uint64_t sub_12B2EC()
{
  return sub_12A30C(v0);
}

uint64_t sub_12B2F4()
{
  return sub_12A30C(v0);
}

uint64_t sub_12B2FC()
{
  return swift_release_n(*(void *)(v0 - 152), 2LL);
}

uint64_t sub_12B308()
{
  return swift_release(v0);
}

void sub_12B314()
{
}

uint64_t sub_12B31C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)( a1,  a2,  a3,  a4,  a5,  a6,  0LL,  1LL);
}

  ;
}

ValueMetadata *type metadata accessor for HealthAppOnboardingRequiredFlow()
{
  return &type metadata for HealthAppOnboardingRequiredFlow;
}

uint64_t sub_12B344(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_A1E8();
  return Flow.deferToExecuteAsync(_:)(a1, a2, &type metadata for HealthAppOnboardingRequiredFlow, v4);
}

uint64_t sub_12B384(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = type metadata accessor for DialogPhase(0LL);
  v2[4] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  void v2[5] = v4;
  unint64_t v5 = (*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[6] = swift_task_alloc(v5);
  v2[7] = swift_task_alloc(v5);
  uint64_t v6 = type metadata accessor for OutputGenerationManifest(0LL);
  v2[8] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[9] = v7;
  v2[10] = sub_A5C0(v7);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_12B404()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_18B094);
  *(void *)(v0 + 88) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_12B450;
  return sub_3CB38();
}

uint64_t sub_12B450(uint64_t a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc(*(void *)(*v2 + 88));
  if (v1) {
    swift_errorRelease(v1);
  }
  else {
    *(void *)(v4 + 96) = a1;
  }
  sub_A964();
  return swift_task_switch(v5, v6, v7);
}

uint64_t sub_12B4C4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = (void *)v8[12];
  uint64_t v11 = v8[6];
  uint64_t v10 = v8[7];
  uint64_t v12 = v8[4];
  uint64_t v13 = v8[5];
  uint64_t v14 = v8[3];
  static DialogPhase.completion.getter(a1, a2, a3, a4, a5, a6, a7, a8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v11, v10, v12);
  OutputGenerationManifest.init(dialogPhase:_:)(v11, sub_A633C, 0LL);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v10, v12);
  OutputGenerationManifest.printSupportingDialogInDisplayModes.setter(1LL);
  id v15 = [v9 catId];
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
  uint64_t v18 = v17;

  OutputGenerationManifest.responseViewId.setter(v16, v18);
  uint64_t v19 = *(void *)(v14 + 224);
  sub_500C((void *)(v14 + 200), v19);
  uint64_t v20 = sub_494C(&qword_18A460);
  uint64_t v21 = swift_allocObject(v20, 40LL, 7LL);
  *(_OWORD *)(v21 + 16) = xmmword_138BA0;
  *(void *)(v21 + 32) = v9;
  uint64_t v28 = v21;
  specialized Array._endMutation()(v21, v22, v23);
  v8[13] = v28;
  uint64_t v24 = async function pointer to dispatch thunk of ResponseGenerating.makeResponseOutput(dialog:outputGenerationManifest:)[1];
  id v25 = v9;
  uint64_t v26 = (void *)swift_task_alloc(v24);
  v8[14] = v26;
  void *v26 = v8;
  v26[1] = sub_12B630;
  return dispatch thunk of ResponseGenerating.makeResponseOutput(dialog:outputGenerationManifest:)( v8[2],  v28,  v8[10],  v19);
}

uint64_t sub_12B630()
{
  return sub_A5D0();
}

uint64_t sub_12B674()
{
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 64);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_12BAA4();
  swift_task_dealloc(v1);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_12B6D8()
{
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v3 + 32) = 0LL;
  *(_OWORD *)uint64_t v3 = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  sub_12BAA4();
  swift_task_dealloc(v1);
  swift_task_dealloc(v0);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_12B724(uint64_t a1)
{
  v2[41] = a1;
  v2[42] = v1;
  uint64_t v3 = type metadata accessor for Logger(0LL);
  v2[43] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[44] = v4;
  v2[45] = sub_A5C0(v4);
  uint64_t v5 = (void *)swift_task_alloc(dword_1909D4);
  v2[46] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_12B794;
  return sub_12B384((uint64_t)(v2 + 27));
}

uint64_t sub_12B794()
{
  return sub_A5D0();
}

uint64_t sub_12B7D0()
{
  uint64_t v1 = (__int128 *)(v0 + 216);
  if (*(void *)(v0 + 240))
  {
    sub_20004(v1, v0 + 176);
    sub_D7EC(v0 + 176, v0 + 256);
    uint64_t v2 = swift_allocObject(&unk_182658, 56LL, 7LL);
    sub_20004((__int128 *)(v0 + 256), v2 + 16);
    static OutputPublisherFactory.makeOutputPublisherAsync()(v18);
    uint64_t v3 = type metadata accessor for SimpleOutputFlowAsync(0LL);
    swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52));
    *(void *)(v0 + 320) = SimpleOutputFlowAsync.init(outputPublisher:outputGenerator:)(v18, &unk_1909E0, v2);
    static ExecuteResponse.complete<A>(next:)();
    _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0((void *)(v0 + 176));
    swift_release();
  }

  else
  {
    uint64_t v5 = *(void *)(v0 + 352);
    uint64_t v4 = *(void *)(v0 + 360);
    uint64_t v6 = *(void *)(v0 + 344);
    uint64_t v7 = sub_74434((uint64_t)v1);
    uint64_t v8 = Logger.wellness.unsafeMutableAddressor(v7);
    swift_beginAccess(v8, v0 + 296, 0LL, 0LL);
    uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v8, v6);
    uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_0, v10, v11, "Failed to create output for onboarding required flow", v12, 2u);
      swift_slowDealloc(v12, -1LL, -1LL);
    }

    uint64_t v14 = *(void *)(v0 + 352);
    uint64_t v13 = *(void *)(v0 + 360);
    uint64_t v16 = *(void *)(v0 + 336);
    uint64_t v15 = *(void *)(v0 + 344);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    sub_A13C((_OWORD *)(v16 + 40), (_OWORD *)(v0 + 16));
    sub_A178();
    static ExecuteResponse.complete<A>(next:)();
    sub_A1B4((void *)(v0 + 16));
  }

  swift_task_dealloc(*(void *)(v0 + 360));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_12B9D8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_1909CC);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_A108;
  return sub_12B724(a1);
}

uint64_t sub_12BA28()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_12BA4C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc(dword_1909DC);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_7564C;
  return sub_1FE14(a1, v1 + 16);
}

uint64_t sub_12BAA4()
{
  return swift_task_dealloc(*(void *)(v0 + 80));
}

uint64_t sub_12BAB0(unsigned __int16 a1)
{
  unint64_t v2 = sub_12BC2C();
  uint64_t v3 = Dictionary.init(dictionaryLiteral:)( &off_17A9F0,  &type metadata for HealthDataType,  &type metadata for HealthKitIdentifier,  v2);
  uint64_t v4 = sub_12BE10(a1, v3);
  swift_bridgeObjectRelease(v3);
  return v4;
}

uint64_t sub_12BB10(void *a1)
{
  uint64_t v2 = sub_494C(&qword_189BA0);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  sub_500C(a1, v5);
  unsigned __int16 v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 24))(v5, v6);
  if (v7 == 270 || (uint64_t v8 = sub_12BAB0(v7), v8 == 205))
  {
    sub_3C798();
    uint64_t v9 = sub_4A04();
    return _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v9, v10, v11, v12);
  }

  else
  {
    uint64_t v14 = v8;
    uint64_t v15 = a1[3];
    uint64_t v16 = a1[4];
    sub_500C(a1, v15);
    (*(void (**)(uint64_t, uint64_t))(v16 + 32))(v15, v16);
    sub_F4F10(v14, v4);
    return sub_6CA4((uint64_t)v4);
  }

unint64_t sub_12BC2C()
{
  unint64_t result = qword_1909E8;
  if (!qword_1909E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_13EC2C, &type metadata for HealthDataType);
    atomic_store(result, (unint64_t *)&qword_1909E8);
  }

  return result;
}

uint64_t sub_12BC68(uint64_t a1, uint64_t a2)
{
  return sub_12BCCC(a1, a2, (uint64_t (*)(uint64_t))sub_126284);
}

uint64_t sub_12BC74(uint64_t a1, uint64_t a2)
{
  return sub_12BCCC(a1, a2, (uint64_t (*)(uint64_t))sub_27CC8);
}

uint64_t sub_12BC80(uint64_t a1, uint64_t a2)
{
  return sub_12BCCC(a1, a2, (uint64_t (*)(uint64_t))sub_375B4);
}

uint64_t sub_12BC8C(uint64_t a1, unsigned __int16 a2)
{
  uint64_t v3 = sub_10F1C0(a2);
  sub_12C684(v3, v4);
  return sub_12C67C(v2);
}

uint64_t sub_12BCB4(uint64_t a1, uint64_t a2)
{
  return sub_12BCCC(a1, a2, (uint64_t (*)(uint64_t))sub_F8E6C);
}

uint64_t sub_12BCC0(uint64_t a1, uint64_t a2)
{
  return sub_12BCCC(a1, a2, (uint64_t (*)(uint64_t))sub_78B84);
}

uint64_t sub_12BCCC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = a3(a2);
  sub_12C684(v4, v5);
  return sub_12C67C(v3);
}

uint64_t sub_12BCF4(uint64_t a1, char a2)
{
  uint64_t v2 = qword_13FF50[a2];
  String.hash(into:)(a1, *(void *)&aFirst_3[8 * a2], v2);
  return sub_12C67C(v2);
}

void sub_12BD30(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  sub_12C6CC(a1, a2);
  sub_12BCF4((uint64_t)v3, v2);
  sub_2A17C();
  sub_1C730();
}

void sub_12BD60(uint64_t a1, uint64_t a2)
{
}

void sub_12BD6C(uint64_t a1, uint64_t a2)
{
}

void sub_12BD78(uint64_t a1, uint64_t a2)
{
  unsigned __int16 v2 = a2;
  sub_12C6CC(a1, a2);
  uint64_t v3 = sub_10F1C0(v2);
  sub_2A164(v3, v4, v5);
  swift_bridgeObjectRelease();
  sub_2A17C();
  sub_1C730();
}

void sub_12BDB0(uint64_t a1, uint64_t a2)
{
}

void sub_12BDBC(uint64_t a1, uint64_t a2)
{
}

void sub_12BDC8(uint64_t a1, uint64_t a2)
{
}

void sub_12BDD4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = a3(a2);
  sub_2A164(v5, v6, v7);
  swift_bridgeObjectRelease(a3);
  sub_2A17C();
  sub_1C730();
}

uint64_t sub_12BE10(unsigned __int16 a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (unint64_t v3 = sub_12C330(a1), (v4 & 1) != 0)) {
    return *(unsigned __int8 *)(*(void *)(a2 + 56) + v3);
  }
  else {
    return 205LL;
  }
}

double sub_12BE4C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_12C3A4(a1, a2), (v7 & 1) != 0))
  {
    sub_39A90(*(void *)(a3 + 56) + 32 * v6, (uint64_t)a4);
  }

  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }

  return result;
}

uint64_t sub_12BE9C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a2) {
    goto LABEL_6;
  }
  uint64_t v4 = sub_12C240(a3);
  uint64_t v6 = v4;
  uint64_t v7 = v5;
  unint64_t v8 = 0x8000000000147E90LL;
  if (v4 == 0xD000000000000010LL && v5 == 0x8000000000147E90LL) {
    goto LABEL_4;
  }
  char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, 0xD000000000000010LL, 0x8000000000147E90LL, 0LL);
  swift_bridgeObjectRelease(v7);
  if ((v9 & 1) != 0) {
    goto LABEL_6;
  }
  unint64_t v8 = 0x8000000000147EB0LL;
  if (v6 == 0xD000000000000012LL && v7 == 0x8000000000147EB0LL)
  {
LABEL_4:
    swift_bridgeObjectRelease(v8);
    goto LABEL_6;
  }

  char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v6, v7, 0xD000000000000012LL, 0x8000000000147EB0LL, 0LL);
  swift_bridgeObjectRelease(v7);
  if ((v10 & 1) != 0) {
LABEL_6:
  }
    __asm { BR              X10 }

  sub_3C798();
  uint64_t v11 = sub_4A04();
  return _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v11, v12, v13, v14);
}

uint64_t sub_12C160(uint64_t a1)
{
  uint64_t v2 = sub_494C(&qword_189BA0);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_57F38(a1, (uint64_t)&off_17B500);
  if ((v5 & 1) != 0)
  {
    uint64_t v6 = type metadata accessor for DateInterval(0LL);
    sub_12C6A8(v6);
    uint64_t v7 = 42LL;
  }

  else
  {
    uint64_t v8 = sub_12BAB0(a1);
    if (v8 == 205)
    {
      sub_3C798();
      uint64_t v9 = sub_4A04();
      return _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v9, v10, v11, v12);
    }

    uint64_t v14 = v8;
    uint64_t v15 = type metadata accessor for DateInterval(0LL);
    sub_12C6A8(v15);
    uint64_t v7 = v14;
  }

  sub_F4F10(v7, v4);
  return sub_6CA4((uint64_t)v4);
}

uint64_t sub_12C240(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_12C27C + 4 * byte_13FF28[a1]))( 0xD000000000000012LL,  0x8000000000147EB0LL);
}

unint64_t sub_12C27C()
{
  return 0xD000000000000018LL;
}

uint64_t sub_12C2D4()
{
  return v0 + 8;
}

void sub_12C2E4()
{
}

void sub_12C2FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
}

uint64_t sub_12C308@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_12C240(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_12C330(unsigned __int16 a1)
{
  uint64_t v3 = sub_10F1C0(a1);
  uint64_t v5 = v4;
  String.hash(into:)(v8, v3, v4);
  swift_bridgeObjectRelease(v5);
  Swift::Int v6 = Hasher._finalize()();
  return sub_12C408(a1, v6);
}

unint64_t sub_12C3A4(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_12C57C(a1, a2, v5);
}

unint64_t sub_12C408(unsigned __int16 a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
  {
    uint64_t v7 = sub_10F1C0(*(_WORD *)(*(void *)(v2 + 48) + 2 * v5));
    uint64_t v9 = v8;
    uint64_t v10 = sub_10F1C0(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2LL);
      return v5;
    }

    uint64_t v13 = v11;
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0LL);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      uint64_t v15 = ~v4;
      unint64_t v5 = (v5 + 1) & v15;
      if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
      {
        while (1)
        {
          uint64_t v16 = sub_10F1C0(*(_WORD *)(*(void *)(v2 + 48) + 2 * v5));
          uint64_t v9 = v17;
          uint64_t v18 = sub_10F1C0(a1);
          if (v16 == v18 && v9 == v19) {
            break;
          }
          uint64_t v21 = v19;
          char v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0LL);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v15;
            if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0) {
              continue;
            }
          }

          return v5;
        }

        goto LABEL_16;
      }
    }
  }

  return v5;
}

unint64_t sub_12C57C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    uint64_t v11 = v10[1];
    BOOL v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0LL) & 1) == 0)
    {
      uint64_t v13 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v13;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        char v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

void sub_12C65C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v2 = (a2 - 32) | 0x8000000000000000LL;
  String.append(_:)(*(Swift::String *)&a1);
}

  ;
}

uint64_t sub_12C67C(uint64_t a1)
{
  return swift_bridgeObjectRelease(a1);
}

uint64_t sub_12C684(uint64_t a1, uint64_t a2)
{
  return String.hash(into:)(v2, a1, a2);
}

  ;
}

uint64_t sub_12C6A8(uint64_t a1)
{
  return _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v1, 1LL, 1LL, a1);
}

void *sub_12C6CC(uint64_t a1, uint64_t a2, ...)
{
  return Hasher.init(_seed:)((uint64_t *)va, a1);
}

uint64_t type metadata accessor for WellnessLoggingCATs(uint64_t a1)
{
  uint64_t result = qword_1909F0;
  if (!qword_1909F0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for WellnessLoggingCATs);
  }
  return result;
}

uint64_t sub_12C70C(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_19C3D8);
}

uint64_t sub_12C748()
{
  return type metadata accessor for WellnessLoggingCATs(0LL);
}

void __swiftcall WatchRingsModel.init(exerciseGoalValue:exerciseTotalValue:moveGoalValue:moveTotalValue:standGoalValue:standTotalValue:)( WellnessFlowPlugin::WatchRingsModel *__return_ptr retstr, Swift::Double exerciseGoalValue, Swift::Double exerciseTotalValue, Swift::Double moveGoalValue, Swift::Double moveTotalValue, Swift::Double standGoalValue, Swift::Double standTotalValue)
{
  retstr->exerciseGoalValue.Swift::Double value = exerciseGoalValue;
  retstr->exerciseGoalValue.Swift::Bool is_nil = 0;
  retstr->exerciseTotalValue.Swift::Double value = exerciseTotalValue;
  retstr->exerciseTotalValue.Swift::Bool is_nil = 0;
  retstr->moveGoalValue.Swift::Double value = moveGoalValue;
  retstr->moveGoalValue.Swift::Bool is_nil = 0;
  retstr->moveTotalValue.Swift::Double value = moveTotalValue;
  retstr->moveTotalValue.Swift::Bool is_nil = 0;
  retstr->standGoalValue.Swift::Double value = standGoalValue;
  retstr->standGoalValue.Swift::Bool is_nil = 0;
  retstr->standTotalValue.Swift::Double value = standTotalValue;
  retstr->standTotalValue.Swift::Bool is_nil = 0;
}

uint64_t sub_12C784(uint64_t a1, unint64_t a2)
{
  if (a1 == 0xD000000000000011LL)
  {
    unint64_t v4 = 0x8000000000141350LL;
    if (a2 == 0x8000000000141350LL) {
      goto LABEL_5;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011LL, 0x8000000000141350LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v4 = a2;
LABEL_5:
    swift_bridgeObjectRelease(v4);
    return 0LL;
  }

  if (a1 == 0xD000000000000012LL && a2 == 0x8000000000141370LL)
  {
    unint64_t v6 = 0x8000000000141370LL;
LABEL_11:
    swift_bridgeObjectRelease(v6);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012LL, 0x8000000000141370LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v6 = a2;
    goto LABEL_11;
  }

  BOOL v7 = a1 == 0x6C616F4765766F6DLL && a2 == 0xED000065756C6156LL;
  if (v7
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6C616F4765766F6DLL, 0xED000065756C6156LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 2LL;
  }

  else
  {
    BOOL v8 = a1 == 0x61746F5465766F6DLL && a2 == 0xEE0065756C61566CLL;
    if (v8
      || (_stringCompareWithSmolCheck(_:_:expecting:)(0x61746F5465766F6DLL, 0xEE0065756C61566CLL, a1, a2, 0LL) & 1) != 0)
    {
      swift_bridgeObjectRelease(a2);
      return 3LL;
    }

    else
    {
      BOOL v9 = a1 == 0x616F47646E617473LL && a2 == 0xEE0065756C61566CLL;
      if (v9
        || (_stringCompareWithSmolCheck(_:_:expecting:)(0x616F47646E617473LL, 0xEE0065756C61566CLL, a1, a2, 0LL) & 1) != 0)
      {
        swift_bridgeObjectRelease(a2);
        return 4LL;
      }

      else if (a1 == 0x746F54646E617473LL && a2 == 0xEF65756C61566C61LL)
      {
        swift_bridgeObjectRelease(a2);
        return 5LL;
      }

      else
      {
        char v11 = _stringCompareWithSmolCheck(_:_:expecting:)(0x746F54646E617473LL, 0xEF65756C61566C61LL, a1, a2, 0LL);
        swift_bridgeObjectRelease(a2);
        if ((v11 & 1) != 0) {
          return 5LL;
        }
        else {
          return 6LL;
        }
      }
    }
  }

uint64_t sub_12CA24(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_12CA5C + 4 * byte_13FFC0[a1]))( 0xD000000000000011LL,  0x8000000000141350LL);
}

uint64_t sub_12CA5C(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_12CA74()
{
  return 0x6C616F4765766F6DLL;
}

uint64_t sub_12CA98()
{
  return 0x61746F5465766F6DLL;
}

uint64_t sub_12CAD0()
{
  return 0x746F54646E617473LL;
}

uint64_t sub_12CAF4()
{
  return sub_12CA24(*v0);
}

uint64_t sub_12CAFC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_12C784(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_12CB20(uint64_t a1)
{
  unint64_t v2 = sub_12CCF4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_12CB48(uint64_t a1)
{
  unint64_t v2 = sub_12CCF4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t WatchRingsModel.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_494C(&qword_190A40);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  BOOL v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_500C(a1, v9);
  unint64_t v11 = sub_12CCF4();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for WatchRingsModel.CodingKeys,  &type metadata for WatchRingsModel.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *(void *)v3;
  uint64_t v13 = *(unsigned __int8 *)(v3 + 8);
  char v31 = 0;
  sub_27A20(v12, v13, (uint64_t)&v31);
  if (!v2)
  {
    uint64_t v14 = *(void *)(v3 + 16);
    uint64_t v15 = *(unsigned __int8 *)(v3 + 24);
    char v30 = 1;
    sub_27A20(v14, v15, (uint64_t)&v30);
    uint64_t v16 = *(void *)(v3 + 32);
    uint64_t v17 = *(unsigned __int8 *)(v3 + 40);
    char v29 = 2;
    sub_27A20(v16, v17, (uint64_t)&v29);
    uint64_t v18 = *(void *)(v3 + 48);
    uint64_t v19 = *(unsigned __int8 *)(v3 + 56);
    char v28 = 3;
    sub_27A20(v18, v19, (uint64_t)&v28);
    uint64_t v20 = *(void *)(v3 + 64);
    uint64_t v21 = *(unsigned __int8 *)(v3 + 72);
    char v27 = 4;
    sub_27A20(v20, v21, (uint64_t)&v27);
    uint64_t v22 = *(void *)(v3 + 80);
    uint64_t v23 = *(unsigned __int8 *)(v3 + 88);
    char v26 = 5;
    sub_27A20(v22, v23, (uint64_t)&v26);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_12CCF4()
{
  unint64_t result = qword_190A48;
  if (!qword_190A48)
  {
    unint64_t result = swift_getWitnessTable(&unk_140148, &type metadata for WatchRingsModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_190A48);
  }

  return result;
}

uint64_t WatchRingsModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_494C(&qword_190A50);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  BOOL v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_500C(a1, v9);
  unint64_t v11 = sub_12CCF4();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for WatchRingsModel.CodingKeys,  &type metadata for WatchRingsModel.CodingKeys,  v11,  v9,  v10);
  if (v2) {
    return _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(a1);
  }
  char v41 = 0;
  uint64_t v12 = sub_12D158((uint64_t)&v41);
  char v14 = v13;
  char v40 = 1;
  uint64_t v15 = sub_12D158((uint64_t)&v40);
  int v34 = v16;
  uint64_t v35 = v15;
  char v39 = 2;
  uint64_t v17 = sub_12D158((uint64_t)&v39);
  int v32 = v18;
  uint64_t v33 = v17;
  char v38 = 3;
  uint64_t v19 = sub_12D158((uint64_t)&v38);
  int v30 = v20;
  uint64_t v31 = v19;
  char v37 = 4;
  uint64_t v21 = sub_12D158((uint64_t)&v37);
  HIDWORD(v28) = v22;
  uint64_t v29 = v21;
  char v36 = 5;
  uint64_t v23 = sub_12D158((uint64_t)&v36);
  uint64_t v24 = v8;
  char v26 = v25;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v24, v5);
  uint64_t result = _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(a1);
  *(void *)a2 = v12;
  *(_BYTE *)(a2 + 8) = v14 & 1;
  *(void *)(a2 + 16) = v35;
  *(_BYTE *)(a2 + 24) = v34 & 1;
  *(void *)(a2 + 32) = v33;
  *(_BYTE *)(a2 + 40) = v32 & 1;
  *(void *)(a2 + 48) = v31;
  *(_BYTE *)(a2 + sub_D7EC(v0 + 16, v0 + 56) = v30 & 1;
  *(void *)(a2 + 64) = v29;
  *(_BYTE *)(a2 + 72) = BYTE4(v28) & 1;
  *(void *)(a2 + 80) = v23;
  *(_BYTE *)(a2 + 88) = v26 & 1;
  return result;
}

void *sub_12CF60@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = (void *)WatchRingsModel.init(from:)(a1, (uint64_t)v5);
  if (!v2) {
    return memcpy(a2, v5, 0x59uLL);
  }
  return result;
}

uint64_t sub_12CFA8(void *a1)
{
  return WatchRingsModel.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for WatchRingsModel()
{
  return &type metadata for WatchRingsModel;
}

uint64_t storeEnumTagSinglePayload for WatchRingsModel.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFA) {
    return ((uint64_t (*)(void))((char *)&loc_12D018 + 4 * byte_13FFCB[v4]))();
  }
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_12D04C + 4 * byte_13FFC6[v4]))();
}

uint64_t sub_12D04C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_12D054(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x12D05CLL);
  }
  return result;
}

uint64_t sub_12D068(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x12D070LL);
  }
  *(_BYTE *)uint64_t result = a2 + 5;
  return result;
}

uint64_t sub_12D074(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_12D07C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WatchRingsModel.CodingKeys()
{
  return &type metadata for WatchRingsModel.CodingKeys;
}

unint64_t sub_12D09C()
{
  unint64_t result = qword_190A58;
  if (!qword_190A58)
  {
    unint64_t result = swift_getWitnessTable(&unk_140120, &type metadata for WatchRingsModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_190A58);
  }

  return result;
}

unint64_t sub_12D0DC()
{
  unint64_t result = qword_190A60;
  if (!qword_190A60)
  {
    unint64_t result = swift_getWitnessTable(&unk_140090, &type metadata for WatchRingsModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_190A60);
  }

  return result;
}

unint64_t sub_12D11C()
{
  unint64_t result = qword_190A68;
  if (!qword_190A68)
  {
    unint64_t result = swift_getWitnessTable(&unk_1400B8, &type metadata for WatchRingsModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_190A68);
  }

  return result;
}

uint64_t sub_12D158(uint64_t a1)
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)(a1, v1);
}

uint64_t sub_12D168@<X0>( char a1@<W1>, char a2@<W3>, char a3@<W5>, char a4@<W7>, uint64_t a5@<X8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v18 = v17 - v16;
  uint64_t v66 = type metadata accessor for AppPunchout(0LL);
  sub_6D78(a5, v19, v20, v66);
  uint64_t v21 = (int *)sub_1302B4();
  uint64_t v22 = a5 + v21[9];
  uint64_t v64 = v22;
  uint64_t v23 = type metadata accessor for SpeakableString(0LL);
  sub_6D78(v22, v24, v25, v23);
  char v26 = (uint64_t *)(a5 + v21[10]);
  uint64_t *v26 = 0LL;
  v26[1] = 0LL;
  char v27 = (uint64_t *)(a5 + v21[11]);
  *char v27 = 0LL;
  v27[1] = 0LL;
  uint64_t v28 = (uint64_t *)(a5 + v21[12]);
  uint64_t *v28 = 0LL;
  v28[1] = 0LL;
  uint64_t v68 = (uint64_t *)(a5 + v21[13]);
  *uint64_t v68 = 0LL;
  v68[1] = 0LL;
  uint64_t v29 = (void *)(a5 + v21[15]);
  void *v29 = 0LL;
  v29[1] = 0LL;
  uint64_t v30 = a5 + v21[16];
  uint64_t v63 = v30;
  uint64_t v31 = type metadata accessor for SnippetHeaderModel(0LL);
  sub_6D78(v30, v32, v33, v31);
  sub_BED9C();
  sub_BED90();
  char v35 = a1 | v34;
  uint64_t v36 = a5 + v21[5];
  *(void *)uint64_t v36 = v37;
  *(_BYTE *)(v36 + 8) = v35 & 1;
  sub_BED9C();
  sub_BED90();
  char v39 = a2 | v38;
  uint64_t v40 = a5 + v21[6];
  *(void *)uint64_t v40 = v41;
  *(_BYTE *)(v40 + 8) = v39 & 1;
  sub_BED9C();
  sub_BED90();
  uint64_t v43 = a5 + v21[7];
  *(void *)uint64_t v43 = v44;
  *(_BYTE *)(v43 + 8) = (a3 | v42) & 1;
  sub_BED9C();
  sub_BED90();
  uint64_t v45 = v21[14];
  uint64_t v47 = a5 + v21[8];
  *(void *)uint64_t v47 = v48;
  *(_BYTE *)(v47 + 8) = (a4 | v46) & 1;
  uint64_t v49 = (void *)(a5 + v45);
  *uint64_t v49 = a6;
  v49[1] = a7;
  sub_279B4(a8, v64, &qword_189D00);
  sub_2521C(a9);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v18, 0LL, 1LL, v66);
  sub_24D88(v18, a5, &qword_18A1A0);
  swift_bridgeObjectRelease();
  void *v29 = a10;
  v29[1] = a11;
  sub_279B4(a12, v63, &qword_18A1A8);
  uint64_t v50 = sub_FC248(*(void *)v36, *(_BYTE *)(v36 + 8));
  uint64_t v52 = v51;
  swift_bridgeObjectRelease();
  uint64_t *v26 = v50;
  v26[1] = v52;
  uint64_t v53 = sub_FC248(*(void *)v40, *(_BYTE *)(v40 + 8));
  uint64_t v55 = v54;
  swift_bridgeObjectRelease();
  *char v27 = v53;
  v27[1] = v55;
  uint64_t v56 = sub_FC248(*(void *)v43, *(_BYTE *)(v43 + 8));
  uint64_t v58 = v57;
  swift_bridgeObjectRelease();
  uint64_t *v28 = v56;
  v28[1] = v58;
  uint64_t v59 = sub_FC248(*(void *)v47, *(_BYTE *)(v47 + 8));
  uint64_t v61 = v60;
  sub_279E0(a12, &qword_18A1A8);
  sub_279E0(a9, &qword_189CF8);
  sub_279E0(a8, &qword_189D00);
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v68 = v59;
  v68[1] = v61;
  return result;
}

uint64_t OxygenSaturationQueryModel.averageValue.getter()
{
  uint64_t v1 = sub_1302B4();
  return sub_27A9C(v0 + *(int *)(v1 + 20));
}

uint64_t type metadata accessor for OxygenSaturationQueryModel(uint64_t a1)
{
  uint64_t result = qword_190AE0;
  if (!qword_190AE0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for OxygenSaturationQueryModel);
  }
  return result;
}

void OxygenSaturationQueryModel.averageValue.setter()
{
  uint64_t v0 = sub_1302B4();
  sub_27A40(*(int *)(v0 + 20));
  sub_1EB0C();
}

uint64_t (*OxygenSaturationQueryModel.averageValue.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

uint64_t OxygenSaturationQueryModel.maxValue.getter()
{
  uint64_t v1 = sub_1302B4();
  return sub_27A9C(v0 + *(int *)(v1 + 24));
}

void OxygenSaturationQueryModel.maxValue.setter()
{
  uint64_t v0 = sub_1302B4();
  sub_27A40(*(int *)(v0 + 24));
  sub_1EB0C();
}

uint64_t (*OxygenSaturationQueryModel.maxValue.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

uint64_t OxygenSaturationQueryModel.minValue.getter()
{
  uint64_t v1 = sub_1302B4();
  return sub_27A9C(v0 + *(int *)(v1 + 28));
}

void OxygenSaturationQueryModel.minValue.setter()
{
  uint64_t v0 = sub_1302B4();
  sub_27A40(*(int *)(v0 + 28));
  sub_1EB0C();
}

uint64_t (*OxygenSaturationQueryModel.minValue.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

uint64_t OxygenSaturationQueryModel.mostRecentValue.getter()
{
  uint64_t v1 = sub_1302B4();
  return sub_27A9C(v0 + *(int *)(v1 + 32));
}

void OxygenSaturationQueryModel.mostRecentValue.setter()
{
  uint64_t v0 = sub_1302B4();
  sub_27A40(*(int *)(v0 + 32));
  sub_1EB0C();
}

uint64_t (*OxygenSaturationQueryModel.mostRecentValue.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

void OxygenSaturationQueryModel.dateLabel.getter(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1302B4();
  sub_A44C(v1 + *(int *)(v3 + 36), a1, &qword_189D00);
  sub_A890();
}

void OxygenSaturationQueryModel.dateLabel.setter(uint64_t a1)
{
  uint64_t v3 = sub_1302B4();
  sub_24D88(a1, v1 + *(int *)(v3 + 36), &qword_189D00);
  sub_A890();
}

uint64_t (*OxygenSaturationQueryModel.dateLabel.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

void OxygenSaturationQueryModel.averageValueString.getter()
{
  uint64_t v0 = sub_1302B4();
  sub_27A30(*(int *)(v0 + 40));
  sub_1EB8C();
  sub_A890();
}

void OxygenSaturationQueryModel.averageValueString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1302B4();
  sub_27AB4(*(int *)(v5 + 40));
  *uint64_t v2 = a1;
  v2[1] = a2;
  sub_1EB0C();
}

uint64_t (*OxygenSaturationQueryModel.averageValueString.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

void OxygenSaturationQueryModel.maxValueString.getter()
{
  uint64_t v0 = sub_1302B4();
  sub_27A30(*(int *)(v0 + 44));
  sub_1EB8C();
  sub_A890();
}

void OxygenSaturationQueryModel.maxValueString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1302B4();
  sub_27AB4(*(int *)(v5 + 44));
  *uint64_t v2 = a1;
  v2[1] = a2;
  sub_1EB0C();
}

uint64_t (*OxygenSaturationQueryModel.maxValueString.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

void OxygenSaturationQueryModel.minValueString.getter()
{
  uint64_t v0 = sub_1302B4();
  sub_27A30(*(int *)(v0 + 48));
  sub_1EB8C();
  sub_A890();
}

void OxygenSaturationQueryModel.minValueString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1302B4();
  sub_27AB4(*(int *)(v5 + 48));
  *uint64_t v2 = a1;
  v2[1] = a2;
  sub_1EB0C();
}

uint64_t (*OxygenSaturationQueryModel.minValueString.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

void OxygenSaturationQueryModel.mostRecentValueString.getter()
{
  uint64_t v0 = sub_1302B4();
  sub_27A30(*(int *)(v0 + 52));
  sub_1EB8C();
  sub_A890();
}

void OxygenSaturationQueryModel.mostRecentValueString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1302B4();
  sub_27AB4(*(int *)(v5 + 52));
  *uint64_t v2 = a1;
  v2[1] = a2;
  sub_1EB0C();
}

uint64_t (*OxygenSaturationQueryModel.mostRecentValueString.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

void OxygenSaturationQueryModel.unit.getter()
{
  uint64_t v0 = sub_1302B4();
  sub_27A30(*(int *)(v0 + 56));
  sub_1EB8C();
  sub_A890();
}

void OxygenSaturationQueryModel.unit.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1302B4();
  sub_27AB4(*(int *)(v5 + 56));
  *uint64_t v2 = a1;
  v2[1] = a2;
  sub_1EB0C();
}

uint64_t (*OxygenSaturationQueryModel.unit.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

void OxygenSaturationQueryModel.averageLabelString.getter()
{
  uint64_t v0 = sub_1302B4();
  sub_27A30(*(int *)(v0 + 60));
  sub_1EB8C();
  sub_A890();
}

void OxygenSaturationQueryModel.averageLabelString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1302B4();
  sub_27AB4(*(int *)(v5 + 60));
  *uint64_t v2 = a1;
  v2[1] = a2;
  sub_1EB0C();
}

uint64_t (*OxygenSaturationQueryModel.averageLabelString.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

void OxygenSaturationQueryModel.snippetHeaderModel.getter(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1302B4();
  sub_A44C(v1 + *(int *)(v3 + 64), a1, &qword_18A1A8);
  sub_A890();
}

void OxygenSaturationQueryModel.snippetHeaderModel.setter(uint64_t a1)
{
  uint64_t v3 = sub_1302B4();
  sub_24D88(a1, v1 + *(int *)(v3 + 64), &qword_18A1A8);
  sub_A890();
}

uint64_t (*OxygenSaturationQueryModel.snippetHeaderModel.modify())(void)
{
  return PhoneRingsSnippet.body.getter;
}

uint64_t sub_12DAA8(uint64_t a1, unint64_t a2)
{
  BOOL v3 = a1 == 0x68636E7550707061LL && a2 == 0xEB0000000074756FLL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x68636E7550707061LL, 0xEB0000000074756FLL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  BOOL v6 = a1 == 0x5665676172657661LL && a2 == 0xEC00000065756C61LL;
  if (v6
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x5665676172657661LL, 0xEC00000065756C61LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 1LL;
  }

  BOOL v7 = a1 == 0x65756C615678616DLL && a2 == 0xE800000000000000LL;
  if (v7
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x65756C615678616DLL, 0xE800000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 2LL;
  }

  BOOL v8 = a1 == 0x65756C61566E696DLL && a2 == 0xE800000000000000LL;
  if (v8
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x65756C61566E696DLL, 0xE800000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 3LL;
  }

  BOOL v9 = a1 == 0x6563655274736F6DLL && a2 == 0xEF65756C6156746ELL;
  if (v9
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6563655274736F6DLL, 0xEF65756C6156746ELL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 4LL;
  }

  BOOL v10 = a1 == 0x6562614C65746164LL && a2 == 0xE90000000000006CLL;
  if (v10
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6562614C65746164LL, 0xE90000000000006CLL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 5LL;
  }

  if (a1 == 0xD000000000000012LL)
  {
    unint64_t v11 = 0x80000000001448F0LL;
    if (a2 == 0x80000000001448F0LL) {
      goto LABEL_41;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012LL, 0x80000000001448F0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v11 = a2;
LABEL_41:
    swift_bridgeObjectRelease(v11);
    return 6LL;
  }

  BOOL v12 = a1 == 0x65756C615678616DLL && a2 == 0xEE00676E69727453LL;
  if (v12
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x65756C615678616DLL, 0xEE00676E69727453LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 7LL;
  }

  BOOL v13 = a1 == 0x65756C61566E696DLL && a2 == 0xEE00676E69727453LL;
  if (v13
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x65756C61566E696DLL, 0xEE00676E69727453LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 8LL;
  }

  if (a1 == 0xD000000000000015LL && a2 == 0x80000000001460B0LL)
  {
    unint64_t v14 = 0x80000000001460B0LL;
LABEL_59:
    swift_bridgeObjectRelease(v14);
    return 9LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000015LL, 0x80000000001460B0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v14 = a2;
    goto LABEL_59;
  }

  BOOL v15 = a1 == 1953066613 && a2 == 0xE400000000000000LL;
  if (v15 || (_stringCompareWithSmolCheck(_:_:expecting:)(1953066613LL, 0xE400000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 10LL;
  }

  if (a1 == 0xD000000000000012LL)
  {
    unint64_t v16 = 0x80000000001460F0LL;
    if (a2 == 0x80000000001460F0LL) {
      goto LABEL_70;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012LL, 0x80000000001460F0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v16 = a2;
LABEL_70:
    swift_bridgeObjectRelease(v16);
    return 11LL;
  }

  if (a1 == 0xD000000000000012LL && a2 == 0x8000000000141630LL)
  {
    swift_bridgeObjectRelease(0x8000000000141630LL);
    return 12LL;
  }

  else
  {
    char v17 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012LL, 0x8000000000141630LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v17 & 1) != 0) {
      return 12LL;
    }
    else {
      return 13LL;
    }
  }

uint64_t sub_12DFA4()
{
  return 13LL;
}

uint64_t sub_12DFAC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_12DFE4 + 4 * byte_1401A0[a1]))( 0xD000000000000012LL,  0x80000000001448F0LL);
}

uint64_t sub_12DFE4()
{
  return 0x68636E7550707061LL;
}

uint64_t sub_12E004()
{
  return 0x5665676172657661LL;
}

uint64_t sub_12E024()
{
  return 0x65756C615678616DLL;
}

uint64_t sub_12E04C()
{
  return 0x6563655274736F6DLL;
}

uint64_t sub_12E070()
{
  return 0x6562614C65746164LL;
}

uint64_t sub_12E08C()
{
  return 0x65756C615678616DLL;
}

uint64_t sub_12E0BC(uint64_t a1)
{
  return a1 + 3;
}

uint64_t sub_12E0FC()
{
  return sub_12DFAC(*v0);
}

uint64_t sub_12E104@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_12DAA8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_12E128@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_12DFA4();
  *a1 = result;
  return result;
}

uint64_t sub_12E14C(uint64_t a1)
{
  unint64_t v2 = sub_12E4B4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_12E174(uint64_t a1)
{
  unint64_t v2 = sub_12E4B4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t OxygenSaturationQueryModel.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_494C(&qword_190A70);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_6D44();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  sub_500C(a1, v10);
  unint64_t v12 = sub_12E4B4();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for OxygenSaturationQueryModel.CodingKeys,  &type metadata for OxygenSaturationQueryModel.CodingKeys,  v12,  v10,  v11);
  char v52 = 0;
  uint64_t v13 = type metadata accessor for AppPunchout(0LL);
  sub_A410( &qword_18AA98,  (uint64_t (*)(uint64_t))&type metadata accessor for AppPunchout,  (uint64_t)&protocol conformance descriptor for AppPunchout);
  sub_5E21C(v3, (uint64_t)&v52, v5, v13);
  if (!v2)
  {
    uint64_t Model = (int *)type metadata accessor for OxygenSaturationQueryModel(0LL);
    uint64_t v15 = sub_27A9C(v3 + Model[5]);
    char v51 = 1;
    sub_27A20(v15, v16, (uint64_t)&v51);
    uint64_t v17 = sub_27A9C(v3 + Model[6]);
    char v50 = 2;
    sub_27A20(v17, v18, (uint64_t)&v50);
    uint64_t v19 = sub_27A9C(v3 + Model[7]);
    char v49 = 3;
    sub_27A20(v19, v20, (uint64_t)&v49);
    uint64_t v21 = sub_27A9C(v3 + Model[8]);
    char v48 = 4;
    sub_27A20(v21, v22, (uint64_t)&v48);
    uint64_t v23 = v3 + Model[9];
    char v47 = 5;
    uint64_t v24 = type metadata accessor for SpeakableString(0LL);
    sub_A410( &qword_18AAA0,  (uint64_t (*)(uint64_t))&type metadata accessor for SpeakableString,  (uint64_t)&protocol conformance descriptor for SpeakableString);
    sub_5E21C(v23, (uint64_t)&v47, v5, v24);
    uint64_t v25 = sub_5E260(Model[10]);
    char v46 = 6;
    sub_27A10(v25, v26, (uint64_t)&v46);
    uint64_t v27 = sub_5E260(Model[11]);
    char v45 = 7;
    sub_27A10(v27, v28, (uint64_t)&v45);
    uint64_t v29 = sub_5E260(Model[12]);
    char v44 = 8;
    sub_27A10(v29, v30, (uint64_t)&v44);
    uint64_t v31 = sub_5E260(Model[13]);
    char v43 = 9;
    sub_27A10(v31, v32, (uint64_t)&v43);
    uint64_t v33 = sub_5E260(Model[14]);
    char v42 = 10;
    sub_27A10(v33, v34, (uint64_t)&v42);
    uint64_t v35 = sub_5E260(Model[15]);
    char v41 = 11;
    sub_27A10(v35, v36, (uint64_t)&v41);
    uint64_t v37 = v3 + Model[16];
    char v40 = 12;
    uint64_t v38 = type metadata accessor for SnippetHeaderModel(0LL);
    sub_A410( &qword_18AAA8,  type metadata accessor for SnippetHeaderModel,  (uint64_t)&protocol conformance descriptor for SnippetHeaderModel);
    sub_5E21C(v37, (uint64_t)&v40, v5, v38);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
}

unint64_t sub_12E4B4()
{
  unint64_t result = qword_190A78;
  if (!qword_190A78)
  {
    unint64_t result = swift_getWitnessTable(&unk_140374, &type metadata for OxygenSaturationQueryModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_190A78);
  }

  return result;
}

void OxygenSaturationQueryModel.init(from:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v61 = v4;
  sub_494C(&qword_189D00);
  sub_6D20();
  __chkstk_darwin(v5);
  sub_6D30();
  uint64_t v66 = v6;
  sub_494C(&qword_18A1A0);
  sub_6D20();
  __chkstk_darwin(v7);
  sub_6D30();
  uint64_t v67 = v8;
  uint64_t v68 = sub_494C(&qword_190A80);
  uint64_t v69 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  sub_6D30();
  uint64_t v73 = v9;
  uint64_t Model = (int *)type metadata accessor for OxygenSaturationQueryModel(0LL);
  sub_6D20();
  __chkstk_darwin(v11);
  sub_6D44();
  uint64_t v14 = v13 - v12;
  uint64_t v65 = type metadata accessor for AppPunchout(0LL);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v14, 1LL, 1LL, v65);
  sub_FEE60(Model[5]);
  *(_BYTE *)(v15 + 8) = 1;
  sub_FEE60(Model[6]);
  *(_BYTE *)(v16 + 8) = 1;
  sub_FEE60(Model[7]);
  *(_BYTE *)(v17 + 8) = 1;
  sub_FEE60(Model[8]);
  *(_BYTE *)(v18 + 8) = 1;
  uint64_t v63 = v14 + Model[9];
  uint64_t v64 = type metadata accessor for SpeakableString(0LL);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v63, 1LL, 1LL, v64);
  uint64_t v19 = (uint64_t *)(v14 + Model[10]);
  *uint64_t v19 = 0LL;
  v19[1] = 0LL;
  uint64_t v62 = v19;
  uint64_t v20 = (uint64_t *)(v14 + Model[11]);
  uint64_t *v20 = 0LL;
  v20[1] = 0LL;
  uint64_t v21 = (uint64_t *)(v14 + Model[12]);
  uint64_t *v21 = 0LL;
  v21[1] = 0LL;
  uint64_t v22 = (uint64_t *)(v14 + Model[13]);
  *uint64_t v22 = 0LL;
  v22[1] = 0LL;
  uint64_t v23 = (uint64_t *)(v14 + Model[14]);
  *uint64_t v23 = 0LL;
  v23[1] = 0LL;
  uint64_t v24 = (uint64_t *)(v14 + Model[15]);
  *uint64_t v24 = 0LL;
  v24[1] = 0LL;
  uint64_t v72 = v14;
  uint64_t v25 = v14 + Model[16];
  uint64_t v26 = type metadata accessor for SnippetHeaderModel(0LL);
  uint64_t v59 = v25;
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v25, 1LL, 1LL, v26);
  uint64_t v27 = a1;
  uint64_t v28 = a1[3];
  uint64_t v29 = a1[4];
  uint64_t v71 = v27;
  sub_500C(v27, v28);
  unint64_t v30 = sub_12E4B4();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for OxygenSaturationQueryModel.CodingKeys,  &type metadata for OxygenSaturationQueryModel.CodingKeys,  v30,  v28,  v29);
  if (v70)
  {
    uint64_t v57 = v72;
  }

  else
  {
    uint64_t v58 = v21;
    char v86 = 0;
    sub_A410( &qword_18AAB8,  (uint64_t (*)(uint64_t))&type metadata accessor for AppPunchout,  (uint64_t)&protocol conformance descriptor for AppPunchout);
    sub_FEE6C(v65, (uint64_t)&v86, v68, v65);
    sub_24D88(v67, v72, &qword_18A1A0);
    char v85 = 1;
    uint64_t v31 = sub_BED38((uint64_t)&v85);
    sub_BED44(v31, v32);
    char v84 = 2;
    uint64_t v33 = sub_BED38((uint64_t)&v84);
    sub_BED44(v33, v34);
    char v83 = 3;
    uint64_t v35 = sub_BED38((uint64_t)&v83);
    sub_BED44(v35, v36);
    char v82 = 4;
    uint64_t v37 = sub_BED38((uint64_t)&v82);
    sub_BED44(v37, v38);
    char v81 = 5;
    sub_A410( &qword_18AAC0,  (uint64_t (*)(uint64_t))&type metadata accessor for SpeakableString,  (uint64_t)&protocol conformance descriptor for SpeakableString);
    sub_FEE6C(v64, (uint64_t)&v81, v68, v64);
    sub_24D88(v66, v63, &qword_189D00);
    char v80 = 6;
    uint64_t v39 = sub_BED60((uint64_t)&v80, v68);
    uint64_t v41 = v40;
    sub_1302BC(v39);
    *uint64_t v62 = v67;
    v62[1] = v41;
    char v79 = 7;
    uint64_t v42 = sub_BED60((uint64_t)&v79, v68);
    uint64_t v44 = v43;
    sub_1302BC(v42);
    uint64_t *v20 = v67;
    v20[1] = v44;
    v78[0] = 8;
    uint64_t v45 = sub_BED60((uint64_t)v78, v68);
    uint64_t v47 = v46;
    swift_bridgeObjectRelease();
    *uint64_t v58 = v45;
    v58[1] = v47;
    char v77 = 9;
    uint64_t v48 = sub_BED60((uint64_t)&v77, v68);
    uint64_t v50 = v49;
    swift_bridgeObjectRelease();
    *uint64_t v22 = v48;
    v22[1] = v50;
    char v76 = 10;
    uint64_t v51 = sub_BED60((uint64_t)&v76, v68);
    uint64_t v53 = v52;
    swift_bridgeObjectRelease();
    *uint64_t v23 = v51;
    v23[1] = v53;
    char v75 = 11;
    uint64_t v54 = sub_BED60((uint64_t)&v75, v68);
    uint64_t v56 = v55;
    swift_bridgeObjectRelease();
    *uint64_t v24 = v54;
    v24[1] = v56;
    char v74 = 12;
    sub_A410( &qword_18AAC8,  type metadata accessor for SnippetHeaderModel,  (uint64_t)&protocol conformance descriptor for SnippetHeaderModel);
    sub_FEE6C(v26, (uint64_t)&v74, v68, v26);
    (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v73, v68);
    uint64_t v57 = v72;
    sub_24D88(v61, v59, &qword_18A1A8);
    sub_12EAEC(v72, a2);
  }

  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v71);
  sub_26F04(v57, type metadata accessor for OxygenSaturationQueryModel);
}

uint64_t sub_12EAEC(uint64_t a1, uint64_t a2)
{
  uint64_t Model = type metadata accessor for OxygenSaturationQueryModel(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(Model - 8) + 16LL))(a2, a1, Model);
  return a2;
}

void sub_12EB30()
{
}

void sub_12EB5C()
{
}

void sub_12EB88(void *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_12EB9C(void *a1)
{
  return OxygenSaturationQueryModel.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for OxygenSaturationQueryModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = type metadata accessor for AppPunchout(0LL);
    if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a2, 1LL, v7))
    {
      uint64_t v8 = sub_494C(&qword_18A1A0);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)a1, 0LL, 1LL, v7);
    }

    uint64_t v10 = a3[5];
    uint64_t v11 = a3[6];
    uint64_t v12 = (char *)a1 + v10;
    uint64_t v13 = (char *)a2 + v10;
    *(void *)uint64_t v12 = *(void *)v13;
    v12[8] = v13[8];
    uint64_t v14 = (char *)a1 + v11;
    uint64_t v15 = (char *)a2 + v11;
    *(void *)uint64_t v14 = *(void *)v15;
    v14[8] = v15[8];
    uint64_t v16 = a3[7];
    uint64_t v17 = a3[8];
    uint64_t v18 = (char *)a1 + v16;
    uint64_t v19 = (char *)a2 + v16;
    *(void *)uint64_t v18 = *(void *)v19;
    v18[8] = v19[8];
    uint64_t v20 = (char *)a1 + v17;
    uint64_t v21 = (char *)a2 + v17;
    *(void *)uint64_t v20 = *(void *)v21;
    v20[8] = v21[8];
    uint64_t v22 = a3[9];
    uint64_t v23 = (char *)a1 + v22;
    uint64_t v24 = (char *)a2 + v22;
    uint64_t v25 = type metadata accessor for SpeakableString(0LL);
    uint64_t v66 = v25;
    if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v24, 1LL, v25))
    {
      uint64_t v26 = sub_494C(&qword_189D00);
      memcpy(v23, v24, *(void *)(*(void *)(v26 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16LL))(v23, v24, v25);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v23, 0LL, 1LL, v25);
    }

    uint64_t v27 = a3[10];
    uint64_t v28 = a3[11];
    uint64_t v29 = (uint64_t *)((char *)a1 + v27);
    unint64_t v30 = (uint64_t *)((char *)a2 + v27);
    uint64_t v31 = v30[1];
    void *v29 = *v30;
    v29[1] = v31;
    char v32 = (uint64_t *)((char *)a1 + v28);
    uint64_t v33 = (uint64_t *)((char *)a2 + v28);
    uint64_t v34 = v33[1];
    *char v32 = *v33;
    v32[1] = v34;
    uint64_t v35 = a3[12];
    uint64_t v36 = a3[13];
    uint64_t v37 = (uint64_t *)((char *)a1 + v35);
    char v38 = (uint64_t *)((char *)a2 + v35);
    uint64_t v39 = v38[1];
    *uint64_t v37 = *v38;
    v37[1] = v39;
    uint64_t v40 = (uint64_t *)((char *)a1 + v36);
    uint64_t v41 = (uint64_t *)((char *)a2 + v36);
    uint64_t v42 = v41[1];
    void *v40 = *v41;
    v40[1] = v42;
    uint64_t v43 = a3[14];
    uint64_t v44 = a3[15];
    uint64_t v45 = (uint64_t *)((char *)a1 + v43);
    uint64_t v46 = (uint64_t *)((char *)a2 + v43);
    uint64_t v47 = v46[1];
    void *v45 = *v46;
    v45[1] = v47;
    uint64_t v48 = (uint64_t *)((char *)a1 + v44);
    uint64_t v49 = (uint64_t *)((char *)a2 + v44);
    uint64_t v50 = *v49;
    uint64_t v51 = v49[1];
    uint64_t v52 = a3[16];
    uint64_t v53 = (char *)a2 + v52;
    uint64_t v54 = (char *)a1 + v52;
    *uint64_t v48 = v50;
    v48[1] = v51;
    uint64_t v55 = type metadata accessor for SnippetHeaderModel(0LL);
    swift_bridgeObjectRetain(v31);
    swift_bridgeObjectRetain(v34);
    swift_bridgeObjectRetain(v39);
    swift_bridgeObjectRetain(v42);
    swift_bridgeObjectRetain(v47);
    swift_bridgeObjectRetain(v51);
    if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v53, 1LL, v55))
    {
      uint64_t v56 = sub_494C(&qword_18A1A8);
      memcpy(v54, v53, *(void *)(*(void *)(v56 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *))(*(void *)(v66 - 8) + 16LL))(v54, v53);
      uint64_t v57 = *(int *)(v55 + 20);
      uint64_t v58 = &v54[v57];
      uint64_t v59 = &v53[v57];
      uint64_t v60 = *((void *)v59 + 1);
      *(void *)uint64_t v58 = *(void *)v59;
      *((void *)v58 + 1) = v60;
      uint64_t v61 = *(int *)(v55 + 24);
      uint64_t v62 = &v54[v61];
      uint64_t v63 = &v53[v61];
      uint64_t v64 = *((void *)v63 + 1);
      *(void *)uint64_t v62 = *(void *)v63;
      *((void *)v62 + 1) = v64;
      swift_bridgeObjectRetain(v60);
      swift_bridgeObjectRetain(v64);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v54, 0LL, 1LL, v55);
    }
  }

  return a1;
}

uint64_t destroy for OxygenSaturationQueryModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppPunchout(0LL);
  uint64_t v5 = a1 + *(int *)(a2 + 36);
  uint64_t v6 = type metadata accessor for SpeakableString(0LL);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + *(int *)(a2 + 64);
  uint64_t v8 = type metadata accessor for SnippetHeaderModel(0LL);
  uint64_t result = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v7, 1LL, v8);
  if (!(_DWORD)result)
  {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v7, v6);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }

  return result;
}

char *initializeWithCopy for OxygenSaturationQueryModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AppPunchout(0LL);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a2, 1LL, v6))
  {
    uint64_t v7 = sub_494C(&qword_18A1A0);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)a1, 0LL, 1LL, v6);
  }

  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v8];
  uint64_t v11 = &a2[v8];
  *(void *)uint64_t v10 = *(void *)v11;
  v10[8] = v11[8];
  uint64_t v12 = &a1[v9];
  uint64_t v13 = &a2[v9];
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v13[8];
  uint64_t v14 = a3[7];
  uint64_t v15 = a3[8];
  uint64_t v16 = &a1[v14];
  uint64_t v17 = &a2[v14];
  *(void *)uint64_t v16 = *(void *)v17;
  v16[8] = v17[8];
  uint64_t v18 = &a1[v15];
  uint64_t v19 = &a2[v15];
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  uint64_t v20 = a3[9];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  uint64_t v23 = type metadata accessor for SpeakableString(0LL);
  uint64_t v64 = v23;
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v22, 1LL, v23))
  {
    uint64_t v24 = sub_494C(&qword_189D00);
    memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16LL))(v21, v22, v23);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v21, 0LL, 1LL, v23);
  }

  uint64_t v25 = a3[10];
  uint64_t v26 = a3[11];
  uint64_t v27 = &a1[v25];
  uint64_t v28 = &a2[v25];
  uint64_t v29 = *((void *)v28 + 1);
  *(void *)uint64_t v27 = *(void *)v28;
  *((void *)v27 + 1) = v29;
  unint64_t v30 = &a1[v26];
  uint64_t v31 = &a2[v26];
  uint64_t v32 = *((void *)v31 + 1);
  *(void *)unint64_t v30 = *(void *)v31;
  *((void *)v30 + 1) = v32;
  uint64_t v33 = a3[12];
  uint64_t v34 = a3[13];
  uint64_t v35 = &a1[v33];
  uint64_t v36 = &a2[v33];
  uint64_t v37 = *((void *)v36 + 1);
  *(void *)uint64_t v35 = *(void *)v36;
  *((void *)v35 + 1) = v37;
  char v38 = &a1[v34];
  uint64_t v39 = &a2[v34];
  uint64_t v40 = *((void *)v39 + 1);
  *(void *)char v38 = *(void *)v39;
  *((void *)v38 + 1) = v40;
  uint64_t v41 = a3[14];
  uint64_t v42 = a3[15];
  uint64_t v43 = &a1[v41];
  uint64_t v44 = &a2[v41];
  uint64_t v45 = *((void *)v44 + 1);
  *(void *)uint64_t v43 = *(void *)v44;
  *((void *)v43 + 1) = v45;
  uint64_t v46 = &a1[v42];
  uint64_t v47 = &a2[v42];
  uint64_t v48 = *(void *)v47;
  uint64_t v49 = *((void *)v47 + 1);
  uint64_t v50 = a3[16];
  uint64_t v51 = &a2[v50];
  uint64_t v52 = &a1[v50];
  *(void *)uint64_t v46 = v48;
  *((void *)v46 + 1) = v49;
  uint64_t v53 = type metadata accessor for SnippetHeaderModel(0LL);
  swift_bridgeObjectRetain(v29);
  swift_bridgeObjectRetain(v32);
  swift_bridgeObjectRetain(v37);
  swift_bridgeObjectRetain(v40);
  swift_bridgeObjectRetain(v45);
  swift_bridgeObjectRetain(v49);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v51, 1LL, v53))
  {
    uint64_t v54 = sub_494C(&qword_18A1A8);
    memcpy(v52, v51, *(void *)(*(void *)(v54 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *))(*(void *)(v64 - 8) + 16LL))(v52, v51);
    uint64_t v55 = *(int *)(v53 + 20);
    uint64_t v56 = &v52[v55];
    uint64_t v57 = &v51[v55];
    uint64_t v58 = *((void *)v57 + 1);
    *(void *)uint64_t v56 = *(void *)v57;
    *((void *)v56 + 1) = v58;
    uint64_t v59 = *(int *)(v53 + 24);
    uint64_t v60 = &v52[v59];
    uint64_t v61 = &v51[v59];
    uint64_t v62 = *((void *)v61 + 1);
    *(void *)uint64_t v60 = *(void *)v61;
    *((void *)v60 + 1) = v62;
    swift_bridgeObjectRetain(v58);
    swift_bridgeObjectRetain(v62);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v52, 0LL, 1LL, v53);
  }

  return a1;
}

char *assignWithCopy for OxygenSaturationQueryModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AppPunchout(0LL);
  int v7 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a1, 1LL, v6);
  int v8 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a2, 1LL, v6);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)a1, 0LL, 1LL, v6);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = sub_494C(&qword_18A1A0);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = a3[5];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = *(void *)v13;
  v12[8] = v13[8];
  *(void *)uint64_t v12 = v14;
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  uint64_t v18 = *(void *)v17;
  v16[8] = v17[8];
  *(void *)uint64_t v16 = v18;
  uint64_t v19 = a3[7];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v22 = *(void *)v21;
  v20[8] = v21[8];
  *(void *)uint64_t v20 = v22;
  uint64_t v23 = a3[8];
  uint64_t v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  uint64_t v26 = *(void *)v25;
  v24[8] = v25[8];
  *(void *)uint64_t v24 = v26;
  uint64_t v27 = a3[9];
  uint64_t v28 = &a1[v27];
  uint64_t v29 = &a2[v27];
  uint64_t v30 = type metadata accessor for SpeakableString(0LL);
  int v31 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v28, 1LL, v30);
  int v32 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v29, 1LL, v30);
  if (v31)
  {
    if (!v32)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16LL))(v28, v29, v30);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v28, 0LL, 1LL, v30);
      goto LABEL_13;
    }

    goto LABEL_12;
  }

  uint64_t v33 = *(void *)(v30 - 8);
  if (v32)
  {
    (*(void (**)(char *, uint64_t))(v33 + 8))(v28, v30);
LABEL_12:
    uint64_t v34 = sub_494C(&qword_189D00);
    memcpy(v28, v29, *(void *)(*(void *)(v34 - 8) + 64LL));
    goto LABEL_13;
  }

  (*(void (**)(char *, char *, uint64_t))(v33 + 24))(v28, v29, v30);
LABEL_13:
  uint64_t v35 = a3[10];
  uint64_t v36 = &a1[v35];
  uint64_t v37 = &a2[v35];
  *(void *)uint64_t v36 = *(void *)v37;
  uint64_t v38 = *((void *)v37 + 1);
  *((void *)v36 + 1) = v38;
  swift_bridgeObjectRetain(v38);
  swift_bridgeObjectRelease();
  uint64_t v39 = a3[11];
  uint64_t v40 = &a1[v39];
  uint64_t v41 = &a2[v39];
  *(void *)uint64_t v40 = *(void *)v41;
  uint64_t v42 = *((void *)v41 + 1);
  *((void *)v40 + 1) = v42;
  swift_bridgeObjectRetain(v42);
  swift_bridgeObjectRelease();
  uint64_t v43 = a3[12];
  uint64_t v44 = &a1[v43];
  uint64_t v45 = &a2[v43];
  *(void *)uint64_t v44 = *(void *)v45;
  uint64_t v46 = *((void *)v45 + 1);
  *((void *)v44 + 1) = v46;
  swift_bridgeObjectRetain(v46);
  swift_bridgeObjectRelease();
  uint64_t v47 = a3[13];
  uint64_t v48 = &a1[v47];
  uint64_t v49 = &a2[v47];
  *(void *)uint64_t v48 = *(void *)v49;
  uint64_t v50 = *((void *)v49 + 1);
  *((void *)v48 + 1) = v50;
  swift_bridgeObjectRetain(v50);
  swift_bridgeObjectRelease();
  uint64_t v51 = a3[14];
  uint64_t v52 = &a1[v51];
  uint64_t v53 = &a2[v51];
  *(void *)uint64_t v52 = *(void *)v53;
  uint64_t v54 = *((void *)v53 + 1);
  *((void *)v52 + 1) = v54;
  swift_bridgeObjectRetain(v54);
  swift_bridgeObjectRelease();
  uint64_t v55 = a3[15];
  uint64_t v56 = &a1[v55];
  uint64_t v57 = &a2[v55];
  *(void *)uint64_t v56 = *(void *)v57;
  uint64_t v58 = *((void *)v57 + 1);
  *((void *)v56 + 1) = v58;
  swift_bridgeObjectRetain(v58);
  swift_bridgeObjectRelease();
  uint64_t v59 = a3[16];
  uint64_t v60 = &a1[v59];
  uint64_t v61 = &a2[v59];
  uint64_t v62 = type metadata accessor for SnippetHeaderModel(0LL);
  int v63 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v60, 1LL, v62);
  int v64 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v61, 1LL, v62);
  if (!v63)
  {
    if (!v64)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 24LL))(v60, v61, v30);
      uint64_t v75 = *(int *)(v62 + 20);
      char v76 = &v60[v75];
      char v77 = &v61[v75];
      *(void *)char v76 = *(void *)v77;
      uint64_t v78 = *((void *)v77 + 1);
      *((void *)v76 + 1) = v78;
      swift_bridgeObjectRetain(v78);
      swift_bridgeObjectRelease();
      uint64_t v79 = *(int *)(v62 + 24);
      char v80 = &v60[v79];
      char v81 = &v61[v79];
      *(void *)char v80 = *(void *)v81;
      uint64_t v82 = *((void *)v81 + 1);
      *((void *)v80 + 1) = v82;
      swift_bridgeObjectRetain(v82);
      swift_bridgeObjectRelease();
      return a1;
    }

    sub_26F04((uint64_t)v60, type metadata accessor for SnippetHeaderModel);
    goto LABEL_18;
  }

  if (v64)
  {
LABEL_18:
    uint64_t v73 = sub_494C(&qword_18A1A8);
    memcpy(v60, v61, *(void *)(*(void *)(v73 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16LL))(v60, v61, v30);
  uint64_t v65 = *(int *)(v62 + 20);
  uint64_t v66 = &v60[v65];
  uint64_t v67 = &v61[v65];
  *(void *)uint64_t v66 = *(void *)v67;
  uint64_t v68 = *((void *)v67 + 1);
  *((void *)v66 + 1) = v68;
  uint64_t v69 = *(int *)(v62 + 24);
  uint64_t v70 = &v60[v69];
  uint64_t v71 = &v61[v69];
  *(void *)uint64_t v70 = *(void *)v71;
  uint64_t v72 = *((void *)v71 + 1);
  *((void *)v70 + 1) = v72;
  swift_bridgeObjectRetain(v68);
  swift_bridgeObjectRetain(v72);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v60, 0LL, 1LL, v62);
  return a1;
}

char *initializeWithTake for OxygenSaturationQueryModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AppPunchout(0LL);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a2, 1LL, v6))
  {
    uint64_t v7 = sub_494C(&qword_18A1A0);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)a1, 0LL, 1LL, v6);
  }

  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v8];
  uint64_t v11 = &a2[v8];
  *(void *)uint64_t v10 = *(void *)v11;
  v10[8] = v11[8];
  uint64_t v12 = &a1[v9];
  uint64_t v13 = &a2[v9];
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v13[8];
  uint64_t v14 = a3[7];
  uint64_t v15 = a3[8];
  uint64_t v16 = &a1[v14];
  uint64_t v17 = &a2[v14];
  *(void *)uint64_t v16 = *(void *)v17;
  v16[8] = v17[8];
  uint64_t v18 = &a1[v15];
  uint64_t v19 = &a2[v15];
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  uint64_t v20 = a3[9];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  uint64_t v23 = type metadata accessor for SpeakableString(0LL);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v22, 1LL, v23))
  {
    uint64_t v24 = sub_494C(&qword_189D00);
    memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32LL))(v21, v22, v23);
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v21, 0LL, 1LL, v23);
  }

  uint64_t v25 = a3[11];
  *(_OWORD *)&a1[a3[10]] = *(_OWORD *)&a2[a3[10]];
  *(_OWORD *)&a1[v25] = *(_OWORD *)&a2[v25];
  uint64_t v26 = a3[13];
  *(_OWORD *)&a1[a3[12]] = *(_OWORD *)&a2[a3[12]];
  *(_OWORD *)&a1[v26] = *(_OWORD *)&a2[v26];
  uint64_t v27 = a3[15];
  *(_OWORD *)&a1[a3[14]] = *(_OWORD *)&a2[a3[14]];
  *(_OWORD *)&a1[v27] = *(_OWORD *)&a2[v27];
  uint64_t v28 = a3[16];
  uint64_t v29 = &a1[v28];
  uint64_t v30 = &a2[v28];
  uint64_t v31 = type metadata accessor for SnippetHeaderModel(0LL);
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v30, 1LL, v31))
  {
    uint64_t v32 = sub_494C(&qword_18A1A8);
    memcpy(v29, v30, *(void *)(*(void *)(v32 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32LL))(v29, v30, v23);
    *(_OWORD *)&v29[*(int *)(v31 + 20)] = *(_OWORD *)&v30[*(int *)(v31 + 20)];
    *(_OWORD *)&v29[*(int *)(v31 + 24)] = *(_OWORD *)&v30[*(int *)(v31 + 24)];
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v29, 0LL, 1LL, v31);
  }

  return a1;
}

char *assignWithTake for OxygenSaturationQueryModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for AppPunchout(0LL);
  int v7 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a1, 1LL, v6);
  int v8 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)a2, 1LL, v6);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)a1, 0LL, 1LL, v6);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = sub_494C(&qword_18A1A0);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = a3[5];
  uint64_t v12 = a3[6];
  uint64_t v13 = &a1[v11];
  uint64_t v14 = &a2[v11];
  *(void *)uint64_t v13 = *(void *)v14;
  v13[8] = v14[8];
  uint64_t v15 = &a1[v12];
  uint64_t v16 = &a2[v12];
  *(void *)uint64_t v15 = *(void *)v16;
  v15[8] = v16[8];
  uint64_t v17 = a3[7];
  uint64_t v18 = a3[8];
  uint64_t v19 = &a1[v17];
  uint64_t v20 = &a2[v17];
  *(void *)uint64_t v19 = *(void *)v20;
  v19[8] = v20[8];
  uint64_t v21 = &a1[v18];
  uint64_t v22 = &a2[v18];
  *(void *)uint64_t v21 = *(void *)v22;
  v21[8] = v22[8];
  uint64_t v23 = a3[9];
  uint64_t v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  uint64_t v26 = type metadata accessor for SpeakableString(0LL);
  int v27 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v24, 1LL, v26);
  int v28 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v25, 1LL, v26);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32LL))(v24, v25, v26);
      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v24, 0LL, 1LL, v26);
      goto LABEL_13;
    }

    goto LABEL_12;
  }

  uint64_t v29 = *(void *)(v26 - 8);
  if (v28)
  {
    (*(void (**)(char *, uint64_t))(v29 + 8))(v24, v26);
LABEL_12:
    uint64_t v30 = sub_494C(&qword_189D00);
    memcpy(v24, v25, *(void *)(*(void *)(v30 - 8) + 64LL));
    goto LABEL_13;
  }

  (*(void (**)(char *, char *, uint64_t))(v29 + 40))(v24, v25, v26);
LABEL_13:
  uint64_t v31 = a3[10];
  uint64_t v32 = &a1[v31];
  uint64_t v33 = &a2[v31];
  uint64_t v35 = *(void *)v33;
  uint64_t v34 = *((void *)v33 + 1);
  *(void *)uint64_t v32 = v35;
  *((void *)v32 + 1) = v34;
  swift_bridgeObjectRelease();
  uint64_t v36 = a3[11];
  uint64_t v37 = &a1[v36];
  uint64_t v38 = &a2[v36];
  uint64_t v40 = *(void *)v38;
  uint64_t v39 = *((void *)v38 + 1);
  *(void *)uint64_t v37 = v40;
  *((void *)v37 + 1) = v39;
  swift_bridgeObjectRelease();
  uint64_t v41 = a3[12];
  uint64_t v42 = &a1[v41];
  uint64_t v43 = &a2[v41];
  uint64_t v45 = *(void *)v43;
  uint64_t v44 = *((void *)v43 + 1);
  *(void *)uint64_t v42 = v45;
  *((void *)v42 + 1) = v44;
  swift_bridgeObjectRelease();
  uint64_t v46 = a3[13];
  uint64_t v47 = &a1[v46];
  uint64_t v48 = &a2[v46];
  uint64_t v50 = *(void *)v48;
  uint64_t v49 = *((void *)v48 + 1);
  *(void *)uint64_t v47 = v50;
  *((void *)v47 + 1) = v49;
  swift_bridgeObjectRelease();
  uint64_t v51 = a3[14];
  uint64_t v52 = &a1[v51];
  uint64_t v53 = &a2[v51];
  uint64_t v55 = *(void *)v53;
  uint64_t v54 = *((void *)v53 + 1);
  *(void *)uint64_t v52 = v55;
  *((void *)v52 + 1) = v54;
  swift_bridgeObjectRelease();
  uint64_t v56 = a3[15];
  uint64_t v57 = &a1[v56];
  uint64_t v58 = &a2[v56];
  uint64_t v60 = *(void *)v58;
  uint64_t v59 = *((void *)v58 + 1);
  *(void *)uint64_t v57 = v60;
  *((void *)v57 + 1) = v59;
  swift_bridgeObjectRelease();
  uint64_t v61 = a3[16];
  uint64_t v62 = &a1[v61];
  int v63 = &a2[v61];
  uint64_t v64 = type metadata accessor for SnippetHeaderModel(0LL);
  int v65 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v62, 1LL, v64);
  int v66 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0((uint64_t)v63, 1LL, v64);
  if (!v65)
  {
    if (!v66)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 40LL))(v62, v63, v26);
      uint64_t v69 = *(int *)(v64 + 20);
      uint64_t v70 = &v62[v69];
      uint64_t v71 = &v63[v69];
      uint64_t v73 = *(void *)v71;
      uint64_t v72 = *((void *)v71 + 1);
      *(void *)uint64_t v70 = v73;
      *((void *)v70 + 1) = v72;
      swift_bridgeObjectRelease();
      uint64_t v74 = *(int *)(v64 + 24);
      uint64_t v75 = &v62[v74];
      char v76 = &v63[v74];
      uint64_t v78 = *(void *)v76;
      uint64_t v77 = *((void *)v76 + 1);
      *(void *)uint64_t v75 = v78;
      *((void *)v75 + 1) = v77;
      swift_bridgeObjectRelease();
      return a1;
    }

    sub_26F04((uint64_t)v62, type metadata accessor for SnippetHeaderModel);
    goto LABEL_18;
  }

  if (v66)
  {
LABEL_18:
    uint64_t v67 = sub_494C(&qword_18A1A8);
    memcpy(v62, v63, *(void *)(*(void *)(v67 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32LL))(v62, v63, v26);
  *(_OWORD *)&v62[*(int *)(v64 + 20)] = *(_OWORD *)&v63[*(int *)(v64 + 20)];
  *(_OWORD *)&v62[*(int *)(v64 + 24)] = *(_OWORD *)&v63[*(int *)(v64 + 24)];
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0((uint64_t)v62, 0LL, 1LL, v64);
  return a1;
}

uint64_t getEnumTagSinglePayload for OxygenSaturationQueryModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_12FE00);
}

uint64_t sub_12FE00(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_494C(&qword_18A1A0);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = a1;
    return _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v8, a2, v7);
  }

  uint64_t v9 = sub_494C(&qword_189D00);
  if (*(_DWORD *)(*(void *)(v9 - 8) + 84LL) == (_DWORD)a2)
  {
    uint64_t v7 = v9;
    uint64_t v10 = a3[9];
LABEL_12:
    uint64_t v8 = a1 + v10;
    return _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v8, a2, v7);
  }

  if ((_DWORD)a2 != 2147483646)
  {
    uint64_t v7 = sub_494C(&qword_18A1A8);
    uint64_t v10 = a3[16];
    goto LABEL_12;
  }

  unint64_t v11 = *(void *)(a1 + a3[10] + 8);
  if (v11 >= 0xFFFFFFFF) {
    LODWORD(v11) = -1;
  }
  int v12 = v11 - 1;
  if (v12 < 0) {
    int v12 = -1;
  }
  return (v12 + 1);
}

uint64_t storeEnumTagSinglePayload for OxygenSaturationQueryModel( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_12FEE8);
}

void sub_12FEE8(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_494C(&qword_18A1A0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = a1;
  }

  else
  {
    uint64_t v11 = sub_494C(&qword_189D00);
    if (*(_DWORD *)(*(void *)(v11 - 8) + 84LL) == a3)
    {
      uint64_t v9 = v11;
      uint64_t v12 = a4[9];
    }

    else
    {
      if (a3 == 2147483646)
      {
        *(void *)(a1 + a4[10] + 8) = a2;
        sub_1EB0C();
        return;
      }

      uint64_t v9 = sub_494C(&qword_18A1A8);
      uint64_t v12 = a4[16];
    }

    uint64_t v10 = a1 + v12;
  }

  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v10, a2, a2, v9);
}

void sub_12FFAC(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v8[0] = *(void *)(v2 - 8) + 64LL;
    v8[1] = "\t";
    v8[2] = "\t";
    v8[3] = "\t";
    v8[4] = "\t";
    sub_27758( 319LL,  (unint64_t *)&qword_18AB40,  (uint64_t (*)(uint64_t))&type metadata accessor for SpeakableString);
    if (v5 <= 0x3F)
    {
      v8[5] = *(void *)(v4 - 8) + 64LL;
      void v8[6] = &unk_140298;
      v8[7] = &unk_140298;
      v8[8] = &unk_140298;
      void v8[9] = &unk_140298;
      v8[10] = &unk_140298;
      v8[11] = &unk_140298;
      sub_27758(319LL, (unint64_t *)&qword_18AB48, type metadata accessor for SnippetHeaderModel);
      if (v7 <= 0x3F)
      {
        v8[12] = *(void *)(v6 - 8) + 64LL;
        swift_initStructMetadata(a1, 256LL, 13LL, v8, a1 + 16);
      }
    }
  }

uint64_t getEnumTagSinglePayload for OxygenSaturationQueryModel.CodingKeys( unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xF4)
  {
    if (a2 + 12 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 12) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }

    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }

    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }

    int v5 = (*a1 | (v4 << 8)) - 13;
    return (v5 + 1);
  }

uint64_t storeEnumTagSinglePayload for OxygenSaturationQueryModel.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF3) {
    return ((uint64_t (*)(void))((char *)&loc_130174 + 4 * byte_1401B2[v4]))();
  }
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_1301A8 + 4 * byte_1401AD[v4]))();
}

uint64_t sub_1301A8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1301B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1301B8LL);
  }
  return result;
}

uint64_t sub_1301C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1301CCLL);
  }
  *(_BYTE *)uint64_t result = a2 + 12;
  return result;
}

uint64_t sub_1301D0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1301D8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OxygenSaturationQueryModel.CodingKeys()
{
  return &type metadata for OxygenSaturationQueryModel.CodingKeys;
}

unint64_t sub_1301F8()
{
  unint64_t result = qword_190B48;
  if (!qword_190B48)
  {
    unint64_t result = swift_getWitnessTable(&unk_14034C, &type metadata for OxygenSaturationQueryModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_190B48);
  }

  return result;
}

unint64_t sub_130238()
{
  unint64_t result = qword_190B50;
  if (!qword_190B50)
  {
    unint64_t result = swift_getWitnessTable(&unk_1402BC, &type metadata for OxygenSaturationQueryModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_190B50);
  }

  return result;
}

unint64_t sub_130278()
{
  unint64_t result = qword_190B58;
  if (!qword_190B58)
  {
    unint64_t result = swift_getWitnessTable(&unk_1402E4, &type metadata for OxygenSaturationQueryModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_190B58);
  }

  return result;
}

uint64_t sub_1302B4()
{
  return type metadata accessor for OxygenSaturationQueryModel(0LL);
}

uint64_t sub_1302BC(uint64_t a1)
{
  *(void *)(v2 - 152) = a1;
  return swift_bridgeObjectRelease(*(void *)(v1 + 8));
}

uint64_t type metadata accessor for WellnessLoggingCATsSimple(uint64_t a1)
{
  uint64_t result = qword_190B60;
  if (!qword_190B60) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for WellnessLoggingCATsSimple);
  }
  return result;
}

uint64_t sub_130300(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_19C3E8);
}

uint64_t sub_13033C(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5)
{
  *(void *)(v6 + 32) = a5;
  *(void *)(v6 + 40) = v5;
  *(_BYTE *)(v6 + 81) = a4;
  *(_BYTE *)(v6 + 80) = a2;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a3;
  uint64_t v7 = sub_494C(&qword_189D00);
  *(void *)(v6 + 48) = sub_36390(v7);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_130388()
{
  char v3 = *(_BYTE *)(v1 + 80);
  uint64_t v4 = sub_494C(&qword_18A6A0);
  uint64_t v5 = sub_20308(v4, 176LL);
  uint64_t v6 = sub_132CD4(v5);
  *(_OWORD *)(v6 + 16) = xmmword_13A2F0;
  *(void *)(v6 + 32) = 0x63696C6F74737973LL;
  *(void *)(v6 + 40) = 0xE800000000000000LL;
  if ((v3 & 1) != 0)
  {
    sub_132BFC();
  }

  else
  {
    uint64_t v7 = *(void *)(v1 + 16);
    uint64_t v8 = &type metadata for Double;
  }

  char v9 = *(_BYTE *)(v1 + 81);
  v2[6] = v7;
  v2[9] = v8;
  v2[10] = 0x696C6F7473616964LL;
  v2[11] = 0xE900000000000063LL;
  if ((v9 & 1) != 0)
  {
    uint64_t v11 = 0LL;
    uint64_t v10 = 0LL;
    v2[13] = 0LL;
    v2[14] = 0LL;
  }

  else
  {
    uint64_t v10 = *(void *)(v1 + 24);
    uint64_t v11 = &type metadata for Double;
  }

  v2[12] = v10;
  sub_132D20((uint64_t)v11);
  sub_3D7C4(v12, v13, &qword_189D00);
  uint64_t v14 = sub_ABF4();
  uint64_t v15 = sub_132CF8(v14);
  if (v16)
  {
    sub_3D7BC(v15, &qword_189D00);
    sub_3D8B0();
  }

  else
  {
    v2[21] = v0;
    uint64_t v17 = sub_A0730();
    sub_3D738((uint64_t)v17);
  }

  uint64_t v18 = (void *)sub_3D6E4((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v1 + 64) = v18;
  *uint64_t v18 = v1;
  v18[1] = sub_1304C8;
  sub_3D80C();
  unint64_t v19 = sub_3D7FC(36LL);
  return sub_3D6D0(v19, v20, v21, v22);
}

uint64_t sub_1304C8()
{
  if (v0)
  {
    sub_A964();
    return sub_363F8(v2, v3, v4);
  }

  else
  {
    swift_bridgeObjectRelease(*(void *)(v1 + 56));
    sub_A78C();
    uint64_t v6 = sub_3D7AC();
    return sub_3D6F8(v6, v7);
  }

uint64_t sub_130514()
{
  uint64_t v1 = (uint64_t (*)(void))sub_72C58();
  return sub_202A8(v1);
}

uint64_t sub_130540(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 48) = a1;
  return sub_5F0F0((uint64_t)sub_130554);
}

uint64_t sub_130554()
{
  char v1 = *(_BYTE *)(v0 + 48);
  uint64_t v2 = sub_494C(&qword_18A6A0);
  uint64_t v3 = sub_20308(v2, 80LL);
  sub_73318();
  *(void *)(v4 + 32) = 0xD000000000000011LL;
  *(void *)(v4 + 40) = v5;
  *(void *)(v4 + 72) = &type metadata for Bool;
  *(_BYTE *)(v4 + 48) = v1;
  uint64_t v6 = *((unsigned int *)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:) + 1);
  *(void *)(v0 + 24) = v3;
  *(_OWORD *)(v3 + 16) = v7;
  uint64_t v8 = (void *)swift_task_alloc(v6);
  *(void *)(v0 + 32) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_130610;
  uint64_t v9 = sub_132D38(0xD00000000000003BLL);
  return sub_125F40(v9, v10, v11, v13);
}

uint64_t sub_130610()
{
  if (v1)
  {
    sub_A964();
    return sub_363F8(v4, v5, v6);
  }

  else
  {
    swift_bridgeObjectRelease(*(void *)(v2 + 24));
    return sub_3D6F8(v0, *(uint64_t (**)(void))(v3 + 8));
  }

uint64_t sub_13065C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(_BYTE *)(v5 + 80) = a4;
  *(void *)(v5 + 32) = a3;
  *(void *)(v5 + 40) = v4;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  uint64_t v6 = sub_494C(&qword_189D00);
  *(void *)(v5 + 48) = sub_36390(v6);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_1306A4()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = sub_494C(&qword_18A6A0);
  uint64_t v4 = sub_20308(v3, 176LL);
  uint64_t v5 = (__n128 *)sub_132CD4(v4);
  sub_3D774(v5, (__n128)xmmword_13A2F0);
  sub_3D7C4(v2, v6, &qword_189D00);
  uint64_t v7 = sub_ABF4();
  uint64_t v8 = sub_132CF8(v7);
  if (v9)
  {
    sub_3D7BC(v8, &qword_189D00);
    sub_3D8B0();
  }

  else
  {
    v1[9] = v2;
    uint64_t v10 = sub_A0730();
    sub_3D738((uint64_t)v10);
  }

  uint64_t v11 = *(void *)(v0 + 24);
  v1[10] = 1702125924LL;
  v1[11] = 0xE400000000000000LL;
  if (v11)
  {
    uint64_t v12 = type metadata accessor for DialogCalendar(0LL);
    uint64_t v13 = v11;
  }

  else
  {
    uint64_t v13 = 0LL;
    uint64_t v12 = 0LL;
    v1[13] = 0LL;
    v1[14] = 0LL;
  }

  char v14 = *(_BYTE *)(v0 + 80);
  v1[12] = v13;
  v1[15] = v12;
  v1[16] = 2003790950LL;
  v1[17] = 0xE400000000000000LL;
  if ((v14 & 1) != 0)
  {
    char v16 = 0LL;
    uint64_t v15 = 0LL;
    v1[19] = 0LL;
    v1[20] = 0LL;
  }

  else
  {
    uint64_t v15 = *(void *)(v0 + 32);
    char v16 = &type metadata for Double;
  }

  v1[21] = v16;
  v1[18] = v15;
  uint64_t v17 = *((unsigned int *)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:) + 1);
  swift_retain();
  uint64_t v18 = (void *)swift_task_alloc(v17);
  *(void *)(v0 + 64) = v18;
  *uint64_t v18 = v0;
  v18[1] = sub_1304C8;
  unint64_t v19 = sub_3D7FC(29LL);
  return sub_3D6D0(v19, v20, v21, v22);
}

uint64_t sub_1307FC(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = v3;
  *(_BYTE *)(v4 + 72) = a3;
  *(void *)(v4 + 16) = a1;
  uint64_t v5 = sub_494C(&qword_189D00);
  *(void *)(v4 + 40) = sub_36390(v5);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_130844()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = sub_494C(&qword_18A6A0);
  uint64_t v4 = sub_20308(v3, 128LL);
  uint64_t v5 = (__n128 *)sub_132CBC(v4);
  sub_3D774(v5, (__n128)xmmword_138D90);
  sub_3D7C4(v2, v6, &qword_189D00);
  uint64_t v7 = sub_ABF4();
  uint64_t v8 = sub_132B28(v7);
  if (v9)
  {
    sub_3D7BC(v8, &qword_189D00);
    sub_3D8B0();
  }

  else
  {
    v1[9] = v2;
    uint64_t v10 = sub_A0730();
    sub_3D738((uint64_t)v10);
  }

  char v11 = *(_BYTE *)(v0 + 72);
  v1[10] = 2003790950LL;
  v1[11] = 0xE400000000000000LL;
  if ((v11 & 1) != 0)
  {
    uint64_t v13 = 0LL;
    uint64_t v12 = 0LL;
    v1[13] = 0LL;
    v1[14] = 0LL;
  }

  else
  {
    uint64_t v12 = *(void *)(v0 + 24);
    uint64_t v13 = &type metadata for Double;
  }

  v1[15] = v13;
  v1[12] = v12;
  char v14 = (void *)sub_3D6E4((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v0 + sub_D7EC(v0 + 16, v0 + 56) = v14;
  sub_72C40(v14, (uint64_t)sub_130940);
  unint64_t v15 = sub_3D7FC(35LL);
  return sub_3D6D0(v15, v16, v17, v18);
}

uint64_t sub_130940()
{
  if (v0)
  {
    sub_A964();
    return sub_363F8(v1, v2, v3);
  }

  else
  {
    sub_132C74();
    sub_A78C();
    uint64_t v5 = sub_3D7AC();
    return sub_3D6F8(v5, v6);
  }

uint64_t sub_130988()
{
  uint64_t v0 = (uint64_t (*)(void))sub_132D78();
  return sub_202A8(v0);
}

uint64_t sub_1309B0(uint64_t a1, char a2)
{
  *(_BYTE *)(v3 + 64) = a2;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = v2;
  uint64_t v4 = sub_494C(&qword_189D00);
  *(void *)(v3 + 32) = sub_36390(v4);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_1309F4()
{
  uint64_t v3 = sub_494C(&qword_18A6A0);
  uint64_t v4 = sub_20308(v3, 128LL);
  uint64_t v5 = (__n128 *)sub_3D908(v4);
  sub_3D774(v5, (__n128)xmmword_138D90);
  sub_3D7C4(v0, v6, &qword_189D00);
  uint64_t v7 = sub_ABF4();
  uint64_t v8 = sub_3D74C(v7);
  if (v9)
  {
    sub_3D7BC(v8, &qword_189D00);
    sub_3D8B0();
  }

  else
  {
    *(void *)(v2 + 72) = v0;
    uint64_t v10 = sub_A0730();
    sub_3D738((uint64_t)v10);
  }

  sub_A0A28();
  *(void *)(v2 + 80) = 0xD000000000000019LL;
  *(void *)(v2 + 88) = v11;
  *(void *)(v2 + 120) = &type metadata for Bool;
  *(_BYTE *)(v2 + 96) = v12;
  uint64_t v13 = (void *)sub_3D6E4((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v1 + 48) = v13;
  sub_3D8F0(v13, (uint64_t)sub_3CA68);
  uint64_t v14 = sub_3D844(0xD00000000000002BLL);
  return sub_3D6D0(v14, v15, v16, v17);
}

uint64_t sub_130AD0(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v5 = sub_494C(&qword_189D00);
  *(void *)(v4 + 40) = sub_36390(v5);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_130B10()
{
  char v3 = *(_BYTE *)(v1 + 72);
  uint64_t v4 = sub_494C(&qword_18A6A0);
  uint64_t v5 = sub_20308(v4, 176LL);
  uint64_t v6 = (__n128 *)sub_132CBC(v5);
  sub_132BA4(v6, (__n128)xmmword_13A2F0);
  if ((v3 & 1) != 0) {
    sub_132BFC();
  }
  else {
    uint64_t v7 = &type metadata for Double;
  }
  uint64_t v8 = sub_132B50((uint64_t)v7);
  sub_3D7C4(v8, v9, &qword_189D00);
  uint64_t v10 = sub_ABF4();
  uint64_t v11 = sub_132B28(v10);
  if (v12)
  {
    sub_3D7BC(v11, &qword_189D00);
    sub_3D8B0();
  }

  else
  {
    *(void *)(v2 + 120) = v0;
    uint64_t v13 = sub_A0730();
    sub_3D738((uint64_t)v13);
  }

  sub_132B78();
  sub_132CC8(v14);
  uint64_t v15 = (void *)sub_3D6E4((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v1 + sub_D7EC(v0 + 16, v0 + 56) = v15;
  sub_72C40(v15, (uint64_t)sub_130BF4);
  unint64_t v16 = sub_3D7FC(38LL);
  return sub_3D6D0(v16, v17, v18, v19);
}

uint64_t sub_130BF4()
{
  if (v0)
  {
    sub_A964();
    return sub_363F8(v1, v2, v3);
  }

  else
  {
    sub_132C74();
    sub_A78C();
    uint64_t v5 = sub_3D7AC();
    return sub_3D6F8(v5, v6);
  }

uint64_t sub_130C3C(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v5 = sub_494C(&qword_189D00);
  *(void *)(v4 + 40) = sub_36390(v5);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_130C7C()
{
  char v3 = *(_BYTE *)(v1 + 72);
  uint64_t v4 = sub_494C(&qword_18A6A0);
  uint64_t v5 = sub_20308(v4, 176LL);
  uint64_t v6 = (__n128 *)sub_132CBC(v5);
  sub_132BA4(v6, (__n128)xmmword_13A2F0);
  if ((v3 & 1) != 0) {
    sub_132BFC();
  }
  else {
    uint64_t v7 = &type metadata for Double;
  }
  uint64_t v8 = sub_132B50((uint64_t)v7);
  sub_3D7C4(v8, v9, &qword_189D00);
  uint64_t v10 = sub_ABF4();
  uint64_t v11 = sub_132B28(v10);
  if (v12)
  {
    sub_3D7BC(v11, &qword_189D00);
    sub_3D8B0();
  }

  else
  {
    *(void *)(v2 + 120) = v0;
    uint64_t v13 = sub_A0730();
    sub_3D738((uint64_t)v13);
  }

  sub_132B78();
  sub_132CC8(v14);
  uint64_t v15 = (void *)sub_3D6E4((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v1 + sub_D7EC(v0 + 16, v0 + 56) = v15;
  sub_72C40(v15, (uint64_t)sub_130BF4);
  sub_3D80C();
  unint64_t v16 = sub_3D7FC(45LL);
  return sub_3D6D0(v16, v17, v18, v19);
}

uint64_t sub_130D58(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v5 = sub_494C(&qword_189D00);
  *(void *)(v4 + 40) = sub_36390(v5);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_130D98()
{
  char v3 = *(_BYTE *)(v1 + 72);
  uint64_t v4 = sub_494C(&qword_18A6A0);
  uint64_t v5 = sub_20308(v4, 176LL);
  uint64_t v6 = (__n128 *)sub_132CBC(v5);
  sub_132BA4(v6, (__n128)xmmword_13A2F0);
  if ((v3 & 1) != 0) {
    sub_132BFC();
  }
  else {
    uint64_t v7 = &type metadata for Double;
  }
  uint64_t v8 = sub_132B50((uint64_t)v7);
  sub_3D7C4(v8, v9, &qword_189D00);
  uint64_t v10 = sub_ABF4();
  uint64_t v11 = sub_132B28(v10);
  if (v12)
  {
    sub_3D7BC(v11, &qword_189D00);
    sub_3D8B0();
  }

  else
  {
    *(void *)(v2 + 120) = v0;
    uint64_t v13 = sub_A0730();
    sub_3D738((uint64_t)v13);
  }

  sub_132B78();
  sub_132CC8(v14);
  uint64_t v15 = (void *)sub_3D6E4((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v1 + sub_D7EC(v0 + 16, v0 + 56) = v15;
  sub_72C40(v15, (uint64_t)sub_130BF4);
  sub_3D80C();
  unint64_t v16 = sub_3D7FC(41LL);
  return sub_3D6D0(v16, v17, v18, v19);
}

uint64_t sub_130E74(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v5 = sub_494C(&qword_189D00);
  *(void *)(v4 + 40) = sub_36390(v5);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_130EB4()
{
  char v3 = *(_BYTE *)(v1 + 72);
  uint64_t v4 = sub_494C(&qword_18A6A0);
  uint64_t v5 = sub_20308(v4, 176LL);
  uint64_t v6 = (__n128 *)sub_132CBC(v5);
  sub_132BA4(v6, (__n128)xmmword_13A2F0);
  if ((v3 & 1) != 0) {
    sub_132BFC();
  }
  else {
    uint64_t v7 = &type metadata for Double;
  }
  uint64_t v8 = sub_132B50((uint64_t)v7);
  sub_3D7C4(v8, v9, &qword_189D00);
  uint64_t v10 = sub_ABF4();
  uint64_t v11 = sub_132B28(v10);
  if (v12)
  {
    sub_3D7BC(v11, &qword_189D00);
    sub_3D8B0();
  }

  else
  {
    *(void *)(v2 + 120) = v0;
    uint64_t v13 = sub_A0730();
    sub_3D738((uint64_t)v13);
  }

  sub_132B78();
  sub_132CC8(v14);
  uint64_t v15 = (void *)sub_3D6E4((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v1 + sub_D7EC(v0 + 16, v0 + 56) = v15;
  sub_72C40(v15, (uint64_t)sub_130BF4);
  sub_3D80C();
  unint64_t v16 = sub_3D7FC(37LL);
  return sub_3D6D0(v16, v17, v18, v19);
}

uint64_t sub_130F90(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  *(void *)(v5 + 32) = a4;
  *(void *)(v5 + 40) = v4;
  *(_BYTE *)(v5 + 88) = a3;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  uint64_t v6 = sub_494C(&qword_189D00);
  *(void *)(v5 + 48) = sub_21410(v6);
  *(void *)(v5 + sub_D7EC(v0 + 16, v0 + 56) = sub_A5B8();
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_130FE0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = sub_494C(&qword_18A6A0);
  uint64_t v3 = sub_20308(v2, 176LL);
  *(void *)(v0 + 64) = v3;
  *(_OWORD *)(v3 + 16) = xmmword_13A2F0;
  *(void *)(v3 + 32) = 0x6570795461746164LL;
  *(void *)(v3 + 40) = 0xE800000000000000LL;
  sub_3D7C4(v1, v4, &qword_189D00);
  uint64_t v5 = sub_ABF4();
  uint64_t v6 = sub_A0744();
  if ((_DWORD)v6 == 1)
  {
    sub_3D7BC(v6, &qword_189D00);
    sub_3D92C();
  }

  else
  {
    *(void *)(v3 + 72) = v5;
    uint64_t v7 = sub_3D86C();
    sub_3D798((uint64_t)v7);
  }

  char v8 = *(_BYTE *)(v0 + 88);
  *(void *)(v3 + 80) = 0x65756C6176LL;
  *(void *)(v3 + 88) = 0xE500000000000000LL;
  if ((v8 & 1) != 0)
  {
    uint64_t v10 = 0LL;
    uint64_t v9 = 0LL;
    *(void *)(v3 + 104) = 0LL;
    *(void *)(v3 + 112) = 0LL;
  }

  else
  {
    uint64_t v9 = *(void *)(v0 + 24);
    uint64_t v10 = &type metadata for Double;
  }

  *(void *)(v3 + 96) = v9;
  sub_132D20((uint64_t)v10);
  sub_3D7C4(v11, v12, &qword_189D00);
  uint64_t v13 = sub_132BD8();
  if (v14)
  {
    sub_3D7BC(v13, &qword_189D00);
    sub_3D92C();
  }

  else
  {
    *(void *)(v3 + 168) = v5;
    uint64_t v15 = sub_3D86C();
    sub_3D798((uint64_t)v15);
  }

  unint64_t v16 = (void *)sub_3D6E4((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v0 + 72) = v16;
  void *v16 = v0;
  v16[1] = sub_131150;
  unint64_t v17 = sub_3D7FC(38LL);
  return sub_3D6D0(v17, v18, v19, v20);
}

uint64_t sub_131150()
{
  uint64_t v3 = *(void *)(v1 + 72);
  *uint64_t v4 = *v2;
  *(void *)(v1 + 80) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    sub_A964();
    return sub_363F8(v5, v6, v7);
  }

  else
  {
    swift_bridgeObjectRelease();
    sub_A78C();
    sub_A7C8();
    uint64_t v9 = sub_3D7AC();
    return sub_3D6F8(v9, v10);
  }

uint64_t sub_1311B8()
{
  return sub_D8C4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1311F4(char a1, char a2)
{
  *(void *)(v3 + 16) = v2;
  *(_BYTE *)(v3 + 49) = a2;
  *(_BYTE *)(v3 + 48) = a1;
  return sub_5F0F0((uint64_t)sub_13120C);
}

uint64_t sub_13120C()
{
  char v1 = *(_BYTE *)(v0 + 49);
  char v2 = *(_BYTE *)(v0 + 48);
  uint64_t v3 = sub_494C(&qword_18A6A0);
  uint64_t v4 = sub_20308(v3, 128LL);
  *(void *)(v0 + 24) = v4;
  *(_OWORD *)(v4 + 16) = xmmword_138D90;
  *(_BYTE *)(sub_132C0C(v4) + 48) = v2;
  sub_132D64();
  *(void *)(v5 + 72) = v6;
  *(void *)(v5 + 80) = v7;
  *(void *)(v5 + 88) = 0xEA00000000006465LL;
  *(void *)(v5 + 120) = v6;
  *(_BYTE *)(v5 + 96) = v1;
  char v8 = (void *)sub_3D6E4((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v0 + 32) = v8;
  *char v8 = v0;
  v8[1] = sub_130610;
  sub_3D80C();
  return sub_125F40(0xD000000000000034LL, v9, v4, v11);
}

uint64_t sub_1312C4()
{
  char v1 = (void *)sub_3D6E4((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v0 + 16) = v1;
  *char v1 = v0;
  v1[1] = sub_3CCD8;
  return sub_3D72C(0xD000000000000031LL, 0x8000000000148480LL, (uint64_t)_swiftEmptyArrayStorage, v3);
}

uint64_t sub_131324()
{
  char v1 = (void *)sub_3D6E4((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v0 + 16) = v1;
  *char v1 = v0;
  v1[1] = sub_3D6C4;
  return sub_3D72C(0xD000000000000039LL, 0x8000000000148440LL, (uint64_t)_swiftEmptyArrayStorage, v3);
}

uint64_t sub_131384(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = sub_494C(&qword_189D00);
  v3[5] = sub_36390(v4);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_1313C8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(void))
{
  uint64_t v11 = v10[2];
  uint64_t v12 = sub_494C(&qword_18A6A0);
  uint64_t v14 = sub_20308(v12, 128LL);
  v10[6] = v14;
  *(_OWORD *)(v14 + 16) = xmmword_138D90;
  *(void *)(v14 + 32) = 0x746867696568LL;
  *(void *)(v14 + 40) = 0xE600000000000000LL;
  uint64_t v15 = 0LL;
  if (v11)
  {
    uint64_t v15 = type metadata accessor for DialogPersonHeight(0LL);
  }

  else
  {
    *(void *)(v14 + sub_D7EC(v0 + 16, v0 + 56) = 0LL;
    *(void *)(v14 + 64) = 0LL;
  }

  uint64_t v16 = v10[5];
  uint64_t v17 = v10[3];
  *(void *)(v14 + 48) = v11;
  *(void *)(v14 + 72) = v15;
  *(void *)(v14 + 80) = 1953066613LL;
  *(void *)(v14 + 88) = 0xE400000000000000LL;
  sub_3D7C4(v17, v13, &qword_189D00);
  uint64_t v18 = sub_ABF4();
  if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v16, 1LL, v18) == 1)
  {
    uint64_t v19 = swift_retain();
    sub_3D7BC(v19, &qword_189D00);
    sub_3D8B0();
  }

  else
  {
    *(void *)(v14 + 120) = v18;
    uint64_t v20 = sub_A0730();
    sub_3D738((uint64_t)v20);
    swift_retain();
  }

  uint64_t v21 = (void *)sub_729E8((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  v10[7] = v21;
  sub_72C40(v21, (uint64_t)sub_130940);
  return sub_729C8(0xD00000000000001DLL, 0x8000000000148420LL, v14, a10);
}

uint64_t sub_131508(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_494C(&qword_189D00);
  v2[4] = sub_36390(v3);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_131548()
{
  uint64_t v3 = sub_494C(&qword_18A6A0);
  uint64_t v4 = sub_20308(v3, 80LL);
  uint64_t v5 = (__n128 *)sub_3D908(v4);
  sub_3D774(v5, (__n128)xmmword_137250);
  sub_3D7C4(v0, v6, &qword_189D00);
  uint64_t v7 = sub_ABF4();
  uint64_t v8 = sub_3D74C(v7);
  if (v9)
  {
    sub_3D7BC(v8, &qword_189D00);
    sub_3D8B0();
  }

  else
  {
    *(void *)(v2 + 72) = v0;
    uint64_t v10 = sub_A0730();
    sub_3D738((uint64_t)v10);
  }

  uint64_t v11 = (void *)sub_3D6E4((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v1 + 48) = v11;
  sub_3D8F0(v11, (uint64_t)sub_3CA68);
  unint64_t v12 = sub_3D7FC(35LL);
  return sub_3D6D0(v12, v13, v14, v15);
}

uint64_t sub_131604(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = v3;
  *(_BYTE *)(v4 + 80) = a3;
  *(void *)(v4 + 16) = a1;
  uint64_t v5 = sub_494C(&qword_189D00);
  *(void *)(v4 + 40) = sub_21410(v5);
  *(void *)(v4 + 48) = sub_A5B8();
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_131654()
{
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = sub_494C(&qword_18A6A0);
  uint64_t v5 = sub_20308(v4, 176LL);
  uint64_t v6 = sub_132CD4(v5);
  *(_OWORD *)(v6 + 16) = xmmword_13A2F0;
  sub_132C7C(v6);
  sub_3D7C4(v3, v7, &qword_189D00);
  uint64_t v8 = sub_ABF4();
  uint64_t v9 = sub_132BD8();
  if (v10)
  {
    sub_3D7BC(v9, &qword_189D00);
    sub_3D92C();
  }

  else
  {
    v1[9] = v8;
    uint64_t v11 = sub_3D86C();
    sub_3D798((uint64_t)v11);
  }

  uint64_t v12 = sub_132C40();
  sub_3D7C4(v12, v13, &qword_189D00);
  uint64_t v14 = sub_132BC0(v2, 1LL, v8);
  if (v10)
  {
    sub_3D7BC(v14, &qword_189D00);
    sub_3D92C();
  }

  else
  {
    v1[15] = v8;
    uint64_t v15 = sub_3D86C();
    sub_3D798((uint64_t)v15);
  }

  char v16 = *(_BYTE *)(v0 + 80);
  v1[16] = 0x757461745364656DLL;
  v1[17] = 0xE900000000000073LL;
  sub_132CC8(v16);
  uint64_t v17 = (void *)sub_3D6E4((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v0 + 64) = v17;
  sub_72C40(v17, (uint64_t)sub_131788);
  sub_3D80C();
  unint64_t v18 = sub_3D7FC(49LL);
  return sub_3D6D0(v18, v19, v20, v21);
}

uint64_t sub_131788()
{
  if (v0)
  {
    sub_A964();
    return sub_363F8(v1, v2, v3);
  }

  else
  {
    sub_3D914();
    sub_A78C();
    sub_A7C8();
    uint64_t v5 = sub_3D7AC();
    return sub_3D6F8(v5, v6);
  }

uint64_t sub_1317D4(uint64_t a1, char a2, uint64_t a3)
{
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 32) = v3;
  *(_BYTE *)(v4 + 72) = a2;
  *(void *)(v4 + 16) = a1;
  uint64_t v5 = sub_494C(&qword_189D00);
  *(void *)(v4 + 40) = sub_36390(v5);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_13181C()
{
  char v3 = *(_BYTE *)(v1 + 72);
  uint64_t v4 = sub_494C(&qword_18A6A0);
  uint64_t v5 = sub_20308(v4, 128LL);
  uint64_t v6 = sub_132CBC(v5);
  *(_OWORD *)(v6 + 16) = xmmword_138D90;
  sub_132CE0(v6, (uint64_t)"remainingMedCount");
  if ((v3 & 1) != 0) {
    sub_132BFC();
  }
  else {
    uint64_t v7 = *(void *)(v1 + 16);
  }
  v2[6] = v7;
  sub_132D90();
  v2[9] = v8;
  v2[10] = v9;
  v2[11] = 0xE700000000000000LL;
  sub_3D7C4(v10, v11, &qword_189D00);
  uint64_t v12 = sub_ABF4();
  uint64_t v13 = sub_132B28(v12);
  if (v14)
  {
    sub_3D7BC(v13, &qword_189D00);
    sub_3D8B0();
  }

  else
  {
    v2[15] = v0;
    uint64_t v15 = sub_A0730();
    sub_3D738((uint64_t)v15);
  }

  char v16 = (void *)sub_729E8((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v1 + sub_D7EC(v0 + 16, v0 + 56) = v16;
  void *v16 = v1;
  v16[1] = sub_130BF4;
  uint64_t v17 = sub_A0518(0xD000000000000031LL);
  return sub_729C8(v17, v18, v19, v20);
}

uint64_t sub_131918(char a1, uint64_t a2, char a3, char a4, char a5)
{
  *(_BYTE *)(v6 + 59) = a5;
  *(_BYTE *)(v6 + 58) = a4;
  *(_BYTE *)(v6 + 57) = a3;
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = v5;
  *(_BYTE *)(v6 + sub_D7EC(v0 + 16, v0 + 56) = a1;
  return sub_5F0F0((uint64_t)sub_131938);
}

uint64_t sub_131938()
{
  char v1 = *(_BYTE *)(v0 + 57);
  char v2 = *(_BYTE *)(v0 + 56);
  uint64_t v3 = sub_494C(&qword_18A6A0);
  uint64_t v4 = sub_20308(v3, 224LL);
  *(void *)(v0 + 32) = v4;
  *(_OWORD *)(v4 + 16) = xmmword_13A310;
  sub_A0A28();
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v7;
  *(_BYTE *)(v5 + 48) = v2;
  *(void *)(v5 + 72) = &type metadata for Bool;
  *(void *)(v5 + 80) = 0xD000000000000016LL;
  sub_A0A28();
  *(void *)(v8 + 88) = v9;
  if ((v1 & 1) != 0)
  {
    uint64_t v11 = 0LL;
    uint64_t v10 = 0LL;
    *(void *)(v4 + 104) = 0LL;
    *(void *)(v4 + 112) = 0LL;
  }

  else
  {
    uint64_t v10 = *(void *)(v0 + 16);
    uint64_t v11 = &type metadata for Double;
  }

  *(void *)(v4 + 96) = v10;
  *(void *)(v4 + 120) = v11;
  *(void *)(v4 + 128) = 0xD000000000000018LL;
  sub_A0A28();
  *(void *)(v4 + 136) = v12;
  *(_BYTE *)(v4 + 144) = v13;
  *(void *)(v4 + 168) = v14;
  *(void *)(v4 + 176) = 0xD000000000000016LL;
  sub_A0A28();
  *(void *)(v4 + 184) = v15;
  *(void *)(v4 + sub_D7EC(v0 + 176, v0 + 216) = v16;
  *(_BYTE *)(v4 + 192) = v17;
  uint64_t v18 = (void *)sub_729E8((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v0 + 40) = v18;
  sub_3D8F0(v18, (uint64_t)sub_131A68);
  uint64_t v19 = sub_132D38(0xD00000000000003BLL);
  return v21(v19);
}

uint64_t sub_131A68()
{
  uint64_t v4 = v2[5];
  uint64_t v5 = *v3;
  *uint64_t v6 = v5;
  v2[6] = v1;
  swift_task_dealloc(v4);
  if (v1)
  {
    sub_A964();
    return sub_363F8(v7, v8, v9);
  }

  else
  {
    swift_bridgeObjectRelease(v2[4]);
    return sub_3D6F8(v0, *(uint64_t (**)(void))(v5 + 8));
  }

uint64_t sub_131AC8()
{
  return sub_202A8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_131AF4(uint64_t a1, char a2, uint64_t a3, char a4, char a5, char a6)
{
  *(void *)(v7 + 24) = a3;
  *(void *)(v7 + 32) = v6;
  *(_BYTE *)(v7 + 75) = a6;
  *(_BYTE *)(v7 + 74) = a5;
  *(_BYTE *)(v7 + 73) = a4;
  *(_BYTE *)(v7 + 72) = a2;
  *(void *)(v7 + 16) = a1;
  uint64_t v8 = sub_494C(&qword_189D00);
  *(void *)(v7 + 40) = sub_36390(v8);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_131B48()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = sub_494C(&qword_18A6A0);
  uint64_t v4 = sub_20308(v3, 272LL);
  uint64_t v5 = sub_132CBC(v4);
  *(_OWORD *)(v5 + 16) = xmmword_13A300;
  sub_132C7C(v5);
  sub_3D7C4(v2, v6, &qword_189D00);
  uint64_t v7 = sub_ABF4();
  uint64_t v8 = sub_132B28(v7);
  if (v9)
  {
    sub_3D7BC(v8, &qword_189D00);
    sub_3D8B0();
  }

  else
  {
    *(void *)(v1 + 72) = v2;
    uint64_t v10 = sub_A0730();
    sub_3D738((uint64_t)v10);
  }

  char v11 = *(_BYTE *)(v0 + 73);
  char v12 = *(_BYTE *)(v0 + 72);
  *(void *)(v1 + 80) = 0xD000000000000012LL;
  *(void *)(v1 + 88) = 0x8000000000144960LL;
  *(_BYTE *)(v1 + 96) = v12;
  *(void *)(v1 + 120) = &type metadata for Bool;
  *(void *)(v1 + 128) = 0xD000000000000016LL;
  *(void *)(v1 + 136) = 0x8000000000148290LL;
  if ((v11 & 1) != 0)
  {
    uint64_t v14 = 0LL;
    uint64_t v13 = 0LL;
    *(void *)(v1 + 152) = 0LL;
    *(void *)(v1 + 160) = 0LL;
  }

  else
  {
    uint64_t v13 = *(void *)(v0 + 24);
    uint64_t v14 = &type metadata for Double;
  }

  *(void *)(v1 + 144) = v13;
  *(void *)(v1 + 168) = v14;
  *(void *)(v1 + 176) = 0xD000000000000018LL;
  sub_A0A28();
  *(void *)(v1 + 184) = v15;
  *(_BYTE *)(v1 + 192) = v16;
  *(void *)(v1 + sub_D7EC(v0 + 176, v0 + 216) = v17;
  *(void *)(v1 + 224) = 0xD000000000000016LL;
  sub_A0A28();
  *(void *)(v1 + 232) = v18;
  *(void *)(v1 + 264) = v19;
  *(_BYTE *)(v1 + 240) = v20;
  uint64_t v21 = (void *)sub_3D6E4((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v0 + sub_D7EC(v0 + 16, v0 + 56) = v21;
  sub_72C40(v21, (uint64_t)sub_130BF4);
  uint64_t v22 = sub_3D844(0xD00000000000003CLL);
  return sub_3D6D0(v22, v23, v24, v25);
}

uint64_t sub_131CB4(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = sub_494C(&qword_189D00);
  v3[5] = sub_21410(v4);
  v3[6] = sub_A5B8();
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_131D00()
{
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[2];
  uint64_t v4 = sub_494C(&qword_18A6A0);
  uint64_t v5 = sub_20308(v4, 128LL);
  uint64_t v6 = sub_132CD4(v5);
  *(_OWORD *)(v6 + 16) = xmmword_138D90;
  sub_132C7C(v6);
  sub_3D7C4(v3, v7, &qword_189D00);
  uint64_t v8 = sub_ABF4();
  uint64_t v9 = sub_132BD8();
  if (v10)
  {
    sub_3D7BC(v9, &qword_189D00);
    sub_3D92C();
  }

  else
  {
    *(void *)(v1 + 72) = v8;
    char v11 = sub_3D86C();
    sub_3D798((uint64_t)v11);
  }

  uint64_t v12 = sub_132C40();
  sub_3D7C4(v12, v13, &qword_189D00);
  uint64_t v14 = sub_132BC0(v2, 1LL, v8);
  if (v10)
  {
    sub_3D7BC(v14, &qword_189D00);
    sub_3D92C();
  }

  else
  {
    *(void *)(v1 + 120) = v8;
    uint64_t v15 = sub_3D86C();
    sub_3D798((uint64_t)v15);
  }

  char v16 = (void *)sub_3D6E4((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  v0[8] = v16;
  sub_72C40(v16, (uint64_t)sub_131788);
  sub_3D80C();
  unint64_t v17 = sub_3D7FC(55LL);
  return sub_3D6D0(v17, v18, v19, v20);
}

uint64_t sub_131E08()
{
  uint64_t v1 = (void *)sub_3D6E4((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_3D6C4;
  return sub_3D72C(0xD000000000000037LL, 0x8000000000148210LL, (uint64_t)_swiftEmptyArrayStorage, v3);
}

uint64_t sub_131E68(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v5 = sub_494C(&qword_189D00);
  *(void *)(v4 + 40) = sub_36390(v5);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_131EA8()
{
  char v3 = *(_BYTE *)(v1 + 72);
  uint64_t v4 = sub_494C(&qword_18A6A0);
  uint64_t v5 = sub_20308(v4, 176LL);
  uint64_t v6 = (__n128 *)sub_132CBC(v5);
  sub_132BA4(v6, (__n128)xmmword_13A2F0);
  if ((v3 & 1) != 0) {
    sub_132BFC();
  }
  else {
    uint64_t v7 = &type metadata for Double;
  }
  uint64_t v8 = sub_132B50((uint64_t)v7);
  sub_3D7C4(v8, v9, &qword_189D00);
  uint64_t v10 = sub_ABF4();
  uint64_t v11 = sub_132B28(v10);
  if (v12)
  {
    sub_3D7BC(v11, &qword_189D00);
    sub_3D8B0();
  }

  else
  {
    *(void *)(v2 + 120) = v0;
    uint64_t v13 = sub_A0730();
    sub_3D738((uint64_t)v13);
  }

  sub_132B78();
  sub_132CC8(v14);
  uint64_t v15 = (void *)sub_3D6E4((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v1 + sub_D7EC(v0 + 16, v0 + 56) = v15;
  sub_72C40(v15, (uint64_t)sub_130940);
  sub_3D80C();
  unint64_t v16 = sub_3D7FC(32LL);
  return sub_3D6D0(v16, v17, v18, v19);
}

uint64_t sub_131F84(char a1, uint64_t a2)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = v2;
  *(_BYTE *)(v3 + 64) = a1;
  uint64_t v4 = sub_494C(&qword_189D00);
  *(void *)(v3 + 32) = sub_36390(v4);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_131FC8()
{
  char v3 = *(_BYTE *)(v1 + 64);
  uint64_t v4 = sub_494C(&qword_18A6A0);
  uint64_t v5 = sub_20308(v4, 128LL);
  uint64_t v6 = sub_3D908(v5);
  *(_OWORD *)(v6 + 16) = xmmword_138D90;
  *(_BYTE *)(sub_132C0C(v6) + 48) = v3;
  sub_132D90();
  void v7[9] = v8;
  v7[10] = v9;
  v7[11] = 0xE700000000000000LL;
  sub_3D7C4(v0, v10, &qword_189D00);
  uint64_t v11 = sub_ABF4();
  uint64_t v12 = sub_3D74C(v11);
  if (v13)
  {
    sub_3D7BC(v12, &qword_189D00);
    sub_3D8B0();
  }

  else
  {
    *(void *)(v2 + 120) = v0;
    char v14 = sub_A0730();
    sub_3D738((uint64_t)v14);
  }

  uint64_t v15 = (void *)sub_3D6E4((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v1 + 48) = v15;
  sub_3D8F0(v15, (uint64_t)sub_3C90C);
  sub_3D80C();
  unint64_t v16 = sub_3D7FC(61LL);
  return sub_3D6D0(v16, v17, v18, v19);
}

uint64_t sub_1320A4(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = sub_494C(&qword_189D00);
  v3[5] = sub_21410(v4);
  v3[6] = sub_A5B8();
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_1320F0()
{
  uint64_t v4 = sub_494C(&qword_18A6A0);
  uint64_t v5 = sub_20308(v4, 128LL);
  uint64_t v6 = sub_132CD4(v5);
  *(_OWORD *)(v6 + 16) = xmmword_138D90;
  sub_132CE0(v6, (uint64_t)"requestedMedName");
  sub_3D7C4(v0, v7, &qword_189D00);
  uint64_t v8 = sub_ABF4();
  uint64_t v9 = sub_132BD8();
  if (v10)
  {
    sub_3D7BC(v9, &qword_189D00);
    sub_3D92C();
  }

  else
  {
    v2[9] = v8;
    uint64_t v11 = sub_3D86C();
    sub_3D798((uint64_t)v11);
  }

  uint64_t v12 = *(void *)(v1 + 40);
  sub_A0A28();
  v2[10] = v13;
  v2[11] = v14;
  sub_3D7C4(v15, v16, &qword_189D00);
  uint64_t v17 = sub_132BC0(v12, 1LL, v8);
  if (v10)
  {
    sub_3D7BC(v17, &qword_189D00);
    sub_3D92C();
  }

  else
  {
    v2[15] = v8;
    uint64_t v18 = sub_3D86C();
    sub_3D798((uint64_t)v18);
  }

  uint64_t v19 = (void *)sub_729E8((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v1 + 64) = v19;
  sub_72C40(v19, (uint64_t)sub_132214);
  uint64_t v20 = sub_A0518(v3 + 34);
  return sub_729C8(v20, v21, v22, v23);
}

uint64_t sub_132214()
{
  if (v0)
  {
    sub_A964();
    return sub_363F8(v1, v2, v3);
  }

  else
  {
    sub_3D914();
    sub_A78C();
    sub_A7C8();
    uint64_t v5 = sub_3D7AC();
    return sub_3D6F8(v5, v6);
  }

uint64_t sub_132260()
{
  uint64_t v0 = (uint64_t (*)(void))sub_72C58();
  return sub_D8C4(v0);
}

uint64_t sub_132290(uint64_t a1, char a2, uint64_t a3)
{
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 32) = v3;
  *(_BYTE *)(v4 + 80) = a2;
  *(void *)(v4 + 16) = a1;
  uint64_t v5 = sub_494C(&qword_189D00);
  *(void *)(v4 + 40) = sub_21410(v5);
  *(void *)(v4 + 48) = sub_A5B8();
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_1322E0()
{
  uint64_t v4 = sub_494C(&qword_18A6A0);
  uint64_t v5 = sub_20308(v4, 176LL);
  uint64_t v6 = sub_132CD4(v5);
  *(_OWORD *)(v6 + 16) = xmmword_13A2F0;
  sub_132CE0(v6, (uint64_t)"requestedMedName");
  sub_3D7C4(v0, v7, &qword_189D00);
  uint64_t v8 = sub_ABF4();
  uint64_t v9 = sub_132BD8();
  if (v10)
  {
    sub_3D7BC(v9, &qword_189D00);
    sub_3D92C();
  }

  else
  {
    *(void *)(v2 + 72) = v8;
    uint64_t v11 = sub_3D86C();
    sub_3D798((uint64_t)v11);
  }

  uint64_t v12 = *(void *)(v1 + 40);
  char v13 = *(_BYTE *)(v1 + 80);
  *(void *)(v2 + 80) = v3 + 1;
  *(void *)(v2 + 88) = 0x8000000000148100LL;
  *(_BYTE *)(v2 + 96) = v13;
  *(void *)(v2 + 120) = &type metadata for Bool;
  *(void *)(v2 + 128) = v3 + 4;
  sub_73318();
  *(void *)(v2 + 136) = v14;
  sub_3D7C4(v15, v16, &qword_189D00);
  uint64_t v17 = sub_132BC0(v12, 1LL, v8);
  if (v10)
  {
    sub_3D7BC(v17, &qword_189D00);
    sub_3D92C();
  }

  else
  {
    *(void *)(v2 + 168) = v8;
    uint64_t v18 = sub_3D86C();
    sub_3D798((uint64_t)v18);
  }

  uint64_t v19 = (void *)sub_729E8((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v1 + 64) = v19;
  *uint64_t v19 = v1;
  v19[1] = sub_132214;
  uint64_t v20 = sub_A0518(v3 + 32);
  return sub_729C8(v20, v21, v22, v23);
}

uint64_t sub_132434(char a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7, uint64_t a8)
{
  *(_BYTE *)(v9 + 124) = v16;
  *(void *)(v9 + 48) = v15;
  *(void *)(v9 + sub_D7EC(v0 + 16, v0 + 56) = v8;
  *(_BYTE *)(v9 + 123) = a7;
  *(_BYTE *)(v9 + 122) = a6;
  *(void *)(v9 + 32) = a5;
  *(void *)(v9 + 40) = a8;
  *(void *)(v9 + 16) = a3;
  *(void *)(v9 + 24) = a4;
  *(_BYTE *)(v9 + 121) = a2;
  *(_BYTE *)(v9 + 120) = a1;
  uint64_t v10 = sub_494C(&qword_189D00);
  *(void *)(v9 + 64) = sub_21410(v10);
  *(void *)(v9 + 72) = sub_A5B8();
  *(void *)(v9 + 80) = sub_A5B8();
  *(void *)(v9 + 88) = sub_A5B8();
  sub_A964();
  return swift_task_switch(v11, v12, v13);
}

uint64_t sub_1324B8()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 16);
  char v3 = *(_BYTE *)(v0 + 121);
  char v4 = *(_BYTE *)(v0 + 120);
  uint64_t v5 = sub_494C(&qword_18A6A0);
  uint64_t v6 = sub_20308(v5, 464LL);
  *(void *)(v0 + 96) = v6;
  uint64_t v7 = sub_132C0C(v6);
  *(_OWORD *)(v7 + 16) = v8;
  *(_BYTE *)(v7 + 48) = v4;
  *(void *)(v7 + 72) = &type metadata for Bool;
  *(void *)(v7 + 80) = 0xD000000000000010LL;
  sub_73318();
  *(void *)(v9 + 88) = v10;
  *(_BYTE *)(v9 + 96) = v3;
  uint64_t v11 = v9 + 144;
  *(void *)(v9 + 120) = &type metadata for Bool;
  *(void *)(v9 + 128) = 0xD000000000000010LL;
  sub_73318();
  *(void *)(v12 + 136) = v13;
  sub_217DC(v2, v1, &qword_189D00);
  uint64_t v14 = sub_ABF4();
  int v15 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v1, 1LL, v14);
  uint64_t v16 = *(void *)(v0 + 88);
  if (v15 == 1)
  {
    sub_2012C(*(void *)(v0 + 88), &qword_189D00);
    *(_OWORD *)uint64_t v11 = 0u;
    *(_OWORD *)(v11 + 16) = 0u;
  }

  else
  {
    *(void *)(v6 + 168) = v14;
    uint64_t v17 = sub_B76C((void *)v11);
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32LL))(v17, v16, v14);
  }

  sub_A0A28();
  *(void *)(v6 + 176) = v18;
  *(void *)(v6 + 184) = v19;
  sub_3D7C4(v20, v21, &qword_189D00);
  uint64_t v22 = sub_A0744();
  if ((_DWORD)v22 == 1)
  {
    sub_3D7BC(v22, &qword_189D00);
    sub_3D92C();
  }

  else
  {
    *(void *)(v6 + sub_D7EC(v0 + 176, v0 + 216) = v14;
    uint64_t v24 = sub_3D86C();
    sub_3D798((uint64_t)v24);
  }

  char v25 = *(_BYTE *)(v0 + 122);
  strcpy((char *)(v6 + 224), "totalMedCount");
  *(_WORD *)(v6 + 238) = -4864;
  if ((v25 & 1) != 0)
  {
    int v27 = 0LL;
    uint64_t v26 = 0LL;
    *(void *)(v6 + 248) = 0LL;
    *(void *)(v6 + 2sub_D7EC(v0 + 16, v0 + 56) = 0LL;
  }

  else
  {
    uint64_t v26 = *(void *)(v0 + 32);
    int v27 = &type metadata for Double;
  }

  uint64_t v28 = *(void *)(v0 + 40);
  char v29 = *(_BYTE *)(v0 + 123);
  *(void *)(v6 + 240) = v26;
  *(void *)(v6 + 264) = v27;
  strcpy((char *)(v6 + 272), "hasDosageEdit");
  *(_WORD *)(v6 + 286) = -4864;
  *(_BYTE *)(v6 + 288) = v29;
  *(void *)(v6 + 312) = &type metadata for Bool;
  *(void *)(v6 + 320) = 0x656761736F64LL;
  *(void *)(v6 + 328) = 0xE600000000000000LL;
  sub_3D7C4(v28, v23, &qword_189D00);
  uint64_t v30 = sub_A0744();
  if ((_DWORD)v30 == 1)
  {
    sub_3D7BC(v30, &qword_189D00);
    sub_3D92C();
  }

  else
  {
    *(void *)(v6 + 360) = v14;
    uint64_t v32 = sub_3D86C();
    sub_3D798((uint64_t)v32);
  }

  uint64_t v33 = *(void *)(v0 + 48);
  *(void *)(v6 + 368) = 0x6E55656761736F64LL;
  *(void *)(v6 + 376) = 0xEA00000000007469LL;
  sub_3D7C4(v33, v31, &qword_189D00);
  uint64_t v34 = sub_A0744();
  if ((_DWORD)v34 == 1)
  {
    sub_3D7BC(v34, &qword_189D00);
    sub_3D92C();
  }

  else
  {
    *(void *)(v6 + 408) = v14;
    uint64_t v35 = sub_3D86C();
    sub_3D798((uint64_t)v35);
  }

  sub_132D64();
  *(void *)(v6 + 416) = v36;
  *(void *)(v6 + 424) = 0xEA00000000006465LL;
  *(void *)(v6 + 4sub_D7EC(v0 + 16, v0 + 56) = &type metadata for Bool;
  *(_BYTE *)(v6 + 432) = v37;
  uint64_t v38 = (void *)sub_3D6E4((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v0 + 104) = v38;
  *uint64_t v38 = v0;
  v38[1] = sub_1327D0;
  uint64_t v39 = sub_3D844(0xD000000000000030LL);
  return v40(v39);
}

uint64_t sub_1327D0()
{
  uint64_t v3 = *(void *)(*(void *)v1 + 104LL);
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 112LL) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    sub_A964();
    return swift_task_switch(v4, v5, v6);
  }

  else
  {
    uint64_t v8 = v2[12];
    uint64_t v9 = v2[9];
    uint64_t v10 = v2[8];
    swift_bridgeObjectRelease(v8);
    sub_A78C();
    sub_A7C8();
    swift_task_dealloc(v9);
    swift_task_dealloc(v10);
    uint64_t v11 = sub_3D7AC();
    return v12(v11);
  }

uint64_t sub_132878()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRelease(*(void *)(v0 + 96));
  sub_A78C();
  sub_A67C();
  sub_A7C8();
  swift_task_dealloc(v1);
  return sub_D8C4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1328CC(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_494C(&qword_189D00);
  v2[4] = sub_36390(v3);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_13290C()
{
  uint64_t v3 = sub_494C(&qword_18A6A0);
  uint64_t v4 = sub_20308(v3, 80LL);
  uint64_t v5 = sub_3D908(v4);
  *(_OWORD *)(v5 + 16) = xmmword_137250;
  *(void *)(v5 + 32) = 0x6954646567676F6CLL;
  *(void *)(v5 + 40) = 0xEA0000000000656DLL;
  sub_3D7C4(v0, v6, &qword_189D00);
  uint64_t v7 = sub_ABF4();
  uint64_t v8 = sub_3D74C(v7);
  if (v9)
  {
    sub_3D7BC(v8, &qword_189D00);
    sub_3D8B0();
  }

  else
  {
    *(void *)(v2 + 72) = v0;
    uint64_t v10 = sub_A0730();
    sub_3D738((uint64_t)v10);
  }

  uint64_t v11 = (void *)sub_3D6E4((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v1 + 48) = v11;
  sub_3D8F0(v11, (uint64_t)sub_3C90C);
  sub_3D80C();
  unint64_t v12 = sub_3D7FC(58LL);
  return sub_3D6D0(v12, v13, v14, v15);
}

uint64_t sub_1329E0(uint64_t a1, char a2, uint64_t a3)
{
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 32) = v3;
  *(_BYTE *)(v4 + 72) = a2;
  *(void *)(v4 + 16) = a1;
  uint64_t v5 = sub_494C(&qword_189D00);
  *(void *)(v4 + 40) = sub_36390(v5);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_132A28()
{
  char v3 = *(_BYTE *)(v1 + 72);
  uint64_t v4 = sub_494C(&qword_18A6A0);
  uint64_t v5 = sub_20308(v4, 128LL);
  uint64_t v6 = (__n128 *)sub_132CBC(v5);
  sub_132BA4(v6, (__n128)xmmword_138D90);
  if ((v3 & 1) != 0) {
    sub_132BFC();
  }
  else {
    uint64_t v7 = &type metadata for Double;
  }
  uint64_t v8 = sub_132B50((uint64_t)v7);
  sub_3D7C4(v8, v9, &qword_189D00);
  uint64_t v10 = sub_ABF4();
  uint64_t v11 = sub_132B28(v10);
  if (v12)
  {
    sub_3D7BC(v11, &qword_189D00);
    sub_3D8B0();
  }

  else
  {
    *(void *)(v2 + 120) = v0;
    uint64_t v13 = sub_A0730();
    sub_3D738((uint64_t)v13);
  }

  uint64_t v14 = (void *)sub_3D6E4((uint64_t)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v1 + sub_D7EC(v0 + 16, v0 + 56) = v14;
  sub_72C40(v14, (uint64_t)sub_130940);
  unint64_t v15 = sub_3D7FC(29LL);
  return sub_3D6D0(v15, v16, v17, v18);
}

uint64_t sub_132B04()
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t *)(v2 - 8);
  *uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(v3 + 56);
  *uint64_t v4 = *v1;
  *(void *)(v3 + 64) = v0;
  return swift_task_dealloc(v5);
}

uint64_t sub_132B28(uint64_t a1)
{
  return _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v1, 1LL, a1);
}

uint64_t sub_132B50@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = *(void *)(v2 + 24);
  v3[6] = v1;
  v3[9] = a1;
  v3[10] = 1953066613LL;
  v3[11] = 0xE400000000000000LL;
  return result;
}

void sub_132B78()
{
  *(_WORD *)(v0 + 142) = -4864;
}

__n128 *sub_132BA4(__n128 *result, __n128 a2)
{
  result[1] = a2;
  result[2].n128_u64[0] = 0x65756C6176LL;
  result[2].n128_u64[1] = 0xE500000000000000LL;
  return result;
}

uint64_t sub_132BC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(a1, a2, a3);
}

uint64_t sub_132BD8()
{
  return _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v1, 1LL, v0);
}

void sub_132BFC()
{
  *(void *)(v0 + sub_D7EC(v0 + 16, v0 + 56) = 0LL;
  *(void *)(v0 + 64) = 0LL;
}

uint64_t sub_132C0C(uint64_t result)
{
  *(void *)(result + 32) = 0x757461745364656DLL;
  *(void *)(result + 40) = 0xE900000000000073LL;
  return result;
}

uint64_t sub_132C2C(uint64_t result, char a2, uint64_t a3, char a4)
{
  *(void *)(v5 + 24) = a3;
  *(void *)(v5 + 32) = v4;
  *(_BYTE *)(v5 + 73) = a4;
  *(_BYTE *)(v5 + 72) = a2;
  *(void *)(v5 + 16) = result;
  return result;
}

uint64_t sub_132C40()
{
  uint64_t result = *(void *)(v0 + 24);
  strcpy((char *)(v1 + 80), "medDisplayName");
  *(_BYTE *)(v1 + 95) = -18;
  return result;
}

uint64_t sub_132C74()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 48));
}

uint64_t sub_132C7C(uint64_t result)
{
  *(void *)(result + 32) = 0x656D695464656DLL;
  *(void *)(result + 40) = 0xE700000000000000LL;
  return result;
}

uint64_t sub_132C98()
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t *)(v2 - 8);
  *uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(v3 + 32);
  *uint64_t v4 = *v1;
  *(void *)(v3 + 40) = v0;
  return swift_task_dealloc(v5);
}

uint64_t sub_132CBC(uint64_t result)
{
  *(void *)(v1 + 48) = result;
  return result;
}

void sub_132CC8(char a1@<W8>)
{
  *(void *)(v2 + 168) = v1;
  *(_BYTE *)(v2 + 144) = a1;
}

uint64_t sub_132CD4(uint64_t result)
{
  *(void *)(v1 + sub_D7EC(v0 + 16, v0 + 56) = result;
  return result;
}

uint64_t sub_132CE0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(result + 32) = v2;
  *(void *)(result + 40) = (a2 - 32) | 0x8000000000000000LL;
  return result;
}

uint64_t sub_132CF0()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 48));
}

uint64_t sub_132CF8(uint64_t a1)
{
  return _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v1, 1LL, a1);
}

void sub_132D20(uint64_t a1@<X8>)
{
  v1[15] = a1;
  v1[16] = 1953066613LL;
  v1[17] = 0xE400000000000000LL;
}

uint64_t sub_132D38@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

  ;
}

  ;
}

uint64_t sub_132D78()
{
  return *(void *)(v0 + 8);
}

uint64_t sub_132D84()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 56));
}

  ;
}

uint64_t sub_132DA4(uint64_t a1)
{
  v2[17] = a1;
  v2[18] = v1;
  v2[19] = *v1;
  uint64_t v3 = type metadata accessor for Parse.DirectInvocation(0LL);
  v2[20] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[21] = v4;
  v2[22] = sub_A5C0(v4);
  uint64_t v5 = sub_494C(&qword_18B900);
  v2[23] = sub_A5C0(*(void *)(v5 - 8));
  uint64_t v6 = type metadata accessor for Siri_Nlu_External_UserParse(0LL);
  v2[24] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[25] = v7;
  v2[26] = sub_A5C0(v7);
  uint64_t v8 = type metadata accessor for Siri_Nlu_External_UserDialogAct(0LL);
  v2[27] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v2[28] = v9;
  v2[29] = sub_D8CC(v9);
  v2[30] = sub_A5B8();
  uint64_t v10 = type metadata accessor for Parse(0LL);
  v2[31] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v2[32] = v11;
  v2[33] = sub_D8CC(v11);
  v2[34] = sub_A5B8();
  uint64_t v12 = type metadata accessor for USOParse(0LL);
  v2[35] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v2[36] = v13;
  v2[37] = sub_A5C0(v13);
  uint64_t v14 = type metadata accessor for Input(0LL);
  v2[38] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v2[39] = v15;
  v2[40] = sub_A5C0(v15);
  uint64_t v16 = sub_D984();
  v2[41] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v2[42] = v17;
  v2[43] = sub_D8CC(v17);
  v2[44] = sub_A5B8();
  v2[45] = sub_A5B8();
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_132ED0()
{
  uint64_t v1 = v0;
  uint64_t v3 = *(void *)(v0 + 136);
  uint64_t v2 = (void *)(v0 + 136);
  uint64_t v4 = v2[28];
  uint64_t v5 = v2[24];
  uint64_t v6 = v2[25];
  uint64_t v7 = v2[22];
  uint64_t v8 = v2[23];
  uint64_t v9 = v2[21];
  uint64_t v10 = Logger.workout.unsafeMutableAddressor();
  sub_A5DC(v10, (uint64_t)(v2 - 8));
  v109 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v109(v4, v10, v5);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v8, v3, v9);
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.debug.getter(v12);
  int v14 = v13;
  v110 = v2;
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v112 = *(void *)(v1 + 360);
    uint64_t v15 = *(void *)(v1 + 320);
    uint64_t v106 = *(void *)(v1 + 336);
    uint64_t v107 = *(void *)(v1 + 328);
    uint64_t v16 = *(void *)(v1 + 304);
    uint64_t v105 = *(void *)(v1 + 312);
    uint64_t v17 = *(void *)(v1 + 152);
    uint64_t v18 = sub_A5E8(22LL);
    uint64_t v104 = sub_A5E8(64LL);
    uint64_t v115 = v104;
    *(_DWORD *)uint64_t v18 = 136315394;
    uint64_t v19 = _typeName(_:qualified:)(v17, 0LL);
    *(void *)(v1 + 120) = sub_39178(v19, v20, &v115);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 120, v1 + 128, v18 + 4, v18 + 12);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2080;
    sub_A410( (unint64_t *)&qword_189EE8,  (uint64_t (*)(uint64_t))&type metadata accessor for Input,  (uint64_t)&protocol conformance descriptor for Input);
    HIDWORD(v103) = v14;
    uint64_t v22 = dispatch thunk of CustomStringConvertible.description.getter(v16, v21);
    *(void *)(v1 + 128) = sub_39178(v22, v23, &v115);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 128, v2, v18 + 14, v18 + 22);
    sub_249D4();
    sub_41BBC(v15, *(uint64_t (**)(uint64_t, uint64_t))(v105 + 8));
    sub_D9B0(&dword_0, v12, (os_log_type_t)v14, "%s Parsing Input: %s", (uint8_t *)v18);
    swift_arrayDestroy(v104, 2LL);
    sub_5050(v104);
    sub_5050(v18);

    uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v106 + 8);
    v24(v112, v107);
  }

  else
  {
    uint64_t v25 = *(void *)(v1 + 360);
    uint64_t v27 = *(void *)(v1 + 328);
    uint64_t v26 = *(void *)(v1 + 336);
    sub_565A8(*(void *)(v1 + 312));

    uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v24(v25, v27);
  }

  sub_114384();
  if (sub_DEE0C() == enum case for Parse.uso(_:))
  {
    uint64_t v107 = (uint64_t)v24;
    uint64_t v28 = *(void *)(v1 + 288);
    uint64_t v29 = *(void *)(v1 + 296);
    uint64_t v30 = *(void *)(v1 + 272);
    uint64_t v31 = *(void *)(v1 + 208);
    uint64_t v113 = *(void *)(v1 + 216);
    uint64_t v33 = *(void *)(v1 + 192);
    uint64_t v32 = *(void *)(v1 + 200);
    uint64_t v34 = *(void *)(v1 + 184);
    (*(void (**)(uint64_t, void))(*(void *)(v1 + 256) + 96LL))(v30, *(void *)(v1 + 248));
    uint64_t v35 = sub_DA14(v29, v30, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v28 + 32));
    uint64_t v36 = USOParse.userParse.getter(v35);
    uint64_t v37 = Siri_Nlu_External_UserParse.userDialogActs.getter(v36);
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
    sub_9109C(v37, v34);
    sub_249D4();
    if (_s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v34, 1LL, v113) == 1)
    {
      uint64_t v38 = *(void *)(v1 + 184);
      sub_565A8(*(void *)(v1 + 288));
      sub_A4A4(v38, &qword_18B900);
      goto LABEL_8;
    }

    uint64_t v63 = (*(uint64_t (**)(void, void, void))(*(void *)(v1 + 224) + 32LL))( *(void *)(v1 + 240),  *(void *)(v1 + 184),  *(void *)(v1 + 216));
    if ((Siri_Nlu_External_UserDialogAct.hasAccepted.getter(v63) & 1) != 0)
    {
      uint64_t v65 = *(void *)(v1 + 288);
      uint64_t v64 = *(void *)(v1 + 296);
      uint64_t v66 = *(void *)(v1 + 280);
      uint64_t v67 = *(void *)(v1 + 144);
      sub_565A8(*(void *)(v1 + 224));
      (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v64, v66);
      v109 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v67 + 16);
      swift_bridgeObjectRetain(v109);
      uint64_t v68 = 1LL;
LABEL_30:
      uint64_t v108 = v68;
      goto LABEL_24;
    }

    uint64_t v90 = *(void *)(v1 + 232);
    uint64_t v91 = *(void *)(v1 + 240);
    uint64_t v92 = *(void *)(v1 + 224);
    char v93 = Siri_Nlu_External_UserDialogAct.hasRejected.getter();
    uint64_t v94 = sub_DA14(v90, v91, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v92 + 16));
    uint64_t v95 = *(void *)(v1 + 288);
    uint64_t v96 = *(void *)(v1 + 232);
    uint64_t v97 = *(void *)(v1 + 240);
    uint64_t v98 = *(void *)(v1 + 216);
    uint64_t v99 = *(void *)(v1 + 224);
    if ((v93 & 1) != 0)
    {
      uint64_t v100 = *(void (**)(uint64_t, uint64_t))(v99 + 8);
      v100(*(void *)(v1 + 232), *(void *)(v1 + 216));
      v100(v97, v98);
      sub_202F4(*(uint64_t (**)(uint64_t, uint64_t))(v95 + 8));
    }

    else
    {
      char v101 = Siri_Nlu_External_UserDialogAct.hasCancelled.getter(v94);
      uint64_t v102 = *(void (**)(uint64_t, uint64_t))(v99 + 8);
      v102(v96, v98);
      v102(v97, v98);
      sub_202F4(*(uint64_t (**)(uint64_t, uint64_t))(v95 + 8));
      if ((v101 & 1) == 0)
      {
        sub_114374();
        uint64_t v68 = 2LL;
        goto LABEL_30;
      }
    }

    sub_114374();
    uint64_t v108 = 0LL;
    goto LABEL_24;
  }

  sub_565A8(*(void *)(v1 + 256));
LABEL_8:
  sub_114384();
  if (sub_DEE0C() != enum case for Parse.directInvocation(_:))
  {
    uint64_t v48 = sub_565A8(*(void *)(v1 + 256));
    uint64_t v49 = Logger.wellness.unsafeMutableAddressor(v48);
    uint64_t v50 = sub_A5DC(v49, (uint64_t)(v110 - 11));
    sub_114360(v50, v51, v52, v53, v54, v55, v56, v57, v103, v104, v105, v106, v107, v109);
    uint64_t v58 = (void *)sub_23374();
    os_log_type_t v59 = static os_log_type_t.error.getter();
    if (sub_A988(v59))
    {
      uint64_t v60 = (_WORD *)sub_A5E8(2LL);
      *uint64_t v60 = 0;
      sub_A940(&dword_0, v61, v62, "Received unsupported type of input");
      sub_5050((uint64_t)v60);
    }

    sub_995CC();
    goto LABEL_23;
  }

  uint64_t v39 = v110 - 15;
  uint64_t v40 = *(void *)(v1 + 264);
  uint64_t v41 = *(void *)(v1 + 168);
  uint64_t v42 = *(void *)(v1 + 176);
  uint64_t v43 = *(void *)(v1 + 160);
  (*(void (**)(uint64_t, void))(*(void *)(v1 + 256) + 96LL))(v40, *(void *)(v1 + 248));
  uint64_t v44 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v41 + 32))(v42, v40, v43);
  uint64_t v45 = Parse.DirectInvocation.userData.getter(v44);
  if (!v45)
  {
    *uint64_t v39 = 0u;
    *(_OWORD *)(v110 - 13) = 0u;
    goto LABEL_19;
  }

  sub_12BE4C(0xD000000000000012LL, 0x8000000000141130LL, v45, v39);
  uint64_t v45 = sub_249D4();
  if (!*(void *)(v1 + 40))
  {
LABEL_19:
    sub_41B5C(v45, &qword_18AA78);
    goto LABEL_20;
  }

  uint64_t v46 = swift_dynamicCast(v110 + 29, v39, (char *)&type metadata for Any + 8, &type metadata for Bool, 6LL);
  if ((v46 & 1) == 0)
  {
LABEL_20:
    uint64_t v69 = Logger.wellness.unsafeMutableAddressor(v46);
    uint64_t v70 = sub_A5DC(v69, (uint64_t)(v110 - 5));
    sub_114360(v70, v71, v72, v73, v74, v75, v76, v77, v103, v104, v105, v106, v107, v109);
    uint64_t v78 = (void *)sub_23374();
    os_log_type_t v79 = static os_log_type_t.error.getter();
    if (sub_A988(v79))
    {
      char v80 = (_WORD *)sub_A5E8(2LL);
      *char v80 = 0;
      sub_A940( &dword_0,  v81,  v82,  "LogMedAsNeededConfirmationStrategy failed to unpack directInvocation, returning nil");
      sub_5050((uint64_t)v80);
    }

    uint64_t v84 = *(void *)(v1 + 168);
    uint64_t v83 = *(void *)(v1 + 176);
    uint64_t v85 = *(void *)(v1 + 160);

    sub_995CC();
    (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v83, v85);
LABEL_23:
    uint64_t v108 = 0LL;
    v109 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(&dword_0 + 1);
    goto LABEL_24;
  }

  uint64_t v47 = *(void *)(v1 + 144);
  uint64_t v108 = *((unsigned __int8 *)v110 + 232);
  sub_565A8(*(void *)(v1 + 168));
  v109 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v47 + 16);
  swift_bridgeObjectRetain(v109);
LABEL_24:
  uint64_t v86 = *(void *)(v1 + 320);
  uint64_t v87 = *(void *)(v1 + 264);
  uint64_t v88 = *(void *)(v1 + 240);
  uint64_t v111 = *(void *)(v1 + 184);
  uint64_t v114 = *(void *)(v1 + 176);
  swift_task_dealloc(*(void *)(v1 + 360));
  sub_A7C8();
  sub_A760();
  swift_task_dealloc(v86);
  sub_A910();
  sub_A864();
  swift_task_dealloc(v87);
  swift_task_dealloc(v88);
  sub_A67C();
  sub_A78C();
  swift_task_dealloc(v111);
  swift_task_dealloc(v114);
  return (*(uint64_t (**)(uint64_t, uint64_t (*)(uint64_t, uint64_t, uint64_t)))(v1 + 8))(v108, v109);
}

void sub_133598(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for Input(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_D984();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_27AD8();
  uint64_t v11 = Logger.workout.unsafeMutableAddressor();
  sub_A5DC(v11, (uint64_t)v31);
  uint64_t v27 = v10;
  uint64_t v28 = v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v2, v11, v9);
  uint64_t v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  os_log_type_t v13 = (os_log_s *)Logger.logObject.getter(v12);
  os_log_type_t v14 = static os_log_type_t.debug.getter(v13);
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = sub_A5E8(22LL);
    uint64_t v26 = a2;
    uint64_t v16 = v15;
    uint64_t v25 = sub_A5E8(64LL);
    uint64_t v30 = v25;
    *(_DWORD *)uint64_t v16 = 136315394;
    uint64_t v17 = sub_618E8();
    uint64_t v29 = sub_39178(v17, v18, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, &v30, v16 + 4, v16 + 12);
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    sub_A410( (unint64_t *)&qword_189EE8,  (uint64_t (*)(uint64_t))&type metadata accessor for Input,  (uint64_t)&protocol conformance descriptor for Input);
    uint64_t v20 = dispatch thunk of CustomStringConvertible.description.getter(v5, v19);
    uint64_t v29 = sub_39178(v20, v21, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, &v30, v16 + 14, v16 + 22);
    sub_249D4();
    sub_D970((uint64_t)v8, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    sub_D9B0(&dword_0, v13, v14, "%s Handling Input: %s", (uint8_t *)v16);
    uint64_t v22 = v25;
    swift_arrayDestroy(v25, 2LL);
    sub_5050(v22);
    sub_5050(v16);
  }

  else
  {
    sub_D970((uint64_t)v8, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  }

  uint64_t v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 8))(v2, v28);
  static ActionForInput.handle()(v23);
  sub_D8FC();
}

uint64_t sub_1337DC(uint64_t a1, uint64_t a2)
{
  v3[13] = a2;
  v3[14] = v2;
  v3[12] = a1;
  v3[15] = *v2;
  uint64_t v4 = type metadata accessor for DialogPhase(0LL);
  v3[16] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[17] = v5;
  v3[18] = sub_D8CC(v5);
  v3[19] = sub_A5B8();
  uint64_t v6 = type metadata accessor for OutputGenerationManifest(0LL);
  v3[20] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[21] = v7;
  v3[22] = sub_A5C0(v7);
  uint64_t v8 = sub_D984();
  v3[23] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v3[24] = v9;
  v3[25] = sub_A5C0(v9);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_13386C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = (uint64_t)(v1 + 7);
  uint64_t v6 = v1 + 24;
  uint64_t v5 = v1[24];
  uint64_t v4 = v6[1];
  uint64_t v7 = v2[13];
  uint64_t v8 = Logger.wellness.unsafeMutableAddressor(a1);
  sub_A5DC(v8, v3);
  sub_DA14(v4, v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
  swift_errorRetain(v7);
  swift_errorRetain(v7);
  uint64_t v9 = (os_log_s *)sub_23374();
  os_log_type_t v10 = static os_log_type_t.debug.getter(v9);
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v24 = v2[24];
    uint64_t v25 = v2[23];
    uint64_t v26 = v2[25];
    uint64_t v11 = v2[13];
    uint64_t v12 = sub_A5E8(22LL);
    os_log_type_t v13 = (void *)sub_A5E8(8LL);
    uint64_t v23 = sub_A5E8(32LL);
    uint64_t v27 = v23;
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v14 = sub_618E8();
    v2[10] = sub_39178(v14, v15, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v2 + 10, v2 + 11, v12 + 4, v12 + 12);
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2112;
    swift_errorRetain(v11);
    uint64_t v16 = _swift_stdlib_bridgeErrorToNSError(v11);
    v2[11] = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v2 + 11, v2 + 12, v12 + 14, v12 + 22);
    void *v13 = v16;
    swift_errorRelease(v11);
    swift_errorRelease(v11);
    sub_D9B0(&dword_0, v9, v10, "%s makeErrorResponse called with error: %@", (uint8_t *)v12);
    sub_494C(&qword_189CB8);
    swift_arrayDestroy(v13, 1LL);
    sub_5050((uint64_t)v13);
    swift_arrayDestroy(v23, 1LL);
    sub_5050(v23);
    sub_5050(v12);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v26, v25);
  }

  else
  {
    uint64_t v18 = v2[24];
    uint64_t v17 = v2[25];
    uint64_t v19 = v2[23];
    uint64_t v20 = v2[13];
    swift_errorRelease(v20);
    swift_errorRelease(v20);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  }

  sub_500C((void *)(v2[14] + 64LL), *(void *)(v2[14] + 88LL));
  unint64_t v21 = (void *)swift_task_alloc(dword_18CCDC);
  v2[26] = v21;
  void *v21 = v2;
  v21[1] = sub_133AD0;
  return sub_764C8();
}

uint64_t sub_133AD0(uint64_t a1)
{
  uint64_t v3 = *(void *)(*v2 + 208);
  uint64_t v4 = *v2;
  *(void *)(v4 + sub_D7EC(v0 + 176, v0 + 216) = a1;
  swift_task_dealloc(v3);
  if (v1)
  {
    swift_task_dealloc(*(void *)(v4 + 200));
    sub_A67C();
    sub_A7C8();
    sub_A760();
    return sub_D8C4(*(uint64_t (**)(void))(v4 + 8));
  }

  else
  {
    sub_A964();
    return sub_D954();
  }

uint64_t sub_133B60(uint64_t a1)
{
  uint64_t v2 = (void *)v1[27];
  uint64_t v4 = v1[18];
  uint64_t v3 = v1[19];
  uint64_t v5 = v1[16];
  uint64_t v6 = v1[17];
  uint64_t v7 = v1[14];
  static DialogPhase.error.getter(a1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v3, v5);
  OutputGenerationManifest.init(dialogPhase:_:)(v4, sub_A633C, 0LL);
  sub_41BBC(v3, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  OutputGenerationManifest.canUseServerTTS.setter(0LL);
  id v8 = [v2 patternId];
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  uint64_t v11 = v10;

  OutputGenerationManifest.responseViewId.setter(v9, v11);
  sub_D7EC(v7 + 200, (uint64_t)(v1 + 2));
  uint64_t v12 = v1[5];
  uint64_t v13 = v1[6];
  sub_500C(v1 + 2, v12);
  uint64_t v14 = (void *)swift_task_alloc(async function pointer to dispatch thunk of ResponseGenerating.makeResponseOutput(patternExecutionResult:outputGenerationManifest:)[1]);
  v1[28] = v14;
  *uint64_t v14 = v1;
  v14[1] = sub_133C90;
  return dispatch thunk of ResponseGenerating.makeResponseOutput(patternExecutionResult:outputGenerationManifest:)( v1[12],  v1[27],  v1[22],  v12,  v13);
}

uint64_t sub_133C90()
{
  uint64_t v3 = *(void *)(v2 + 224);
  *uint64_t v4 = *v1;
  *(void *)(v2 + 232) = v0;
  swift_task_dealloc(v3);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_133CE0(uint64_t a1)
{
  v2[26] = a1;
  v2[27] = v1;
  uint64_t v3 = sub_D984();
  v2[28] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[29] = v4;
  v2[30] = sub_A5C0(v4);
  uint64_t v5 = sub_494C(&qword_189EE0);
  v2[31] = sub_A5C0(*(void *)(v5 - 8));
  uint64_t v6 = type metadata accessor for DialogPhase(0LL);
  v2[32] = sub_A5C0(*(void *)(v6 - 8));
  uint64_t v7 = type metadata accessor for OutputGenerationManifest(0LL);
  v2[33] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v2[34] = v8;
  v2[35] = sub_A5C0(v8);
  uint64_t v9 = type metadata accessor for SpeakableString(0LL);
  v2[36] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v2[37] = v10;
  v2[38] = sub_D8CC(v10);
  v2[39] = sub_A5B8();
  uint64_t v11 = sub_494C(&qword_189D00);
  v2[40] = sub_D8CC(*(void *)(v11 - 8));
  v2[41] = sub_A5B8();
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_133DB0()
{
  uint64_t v1 = v0[27];
  uint64_t v2 = *(void *)(v1 + 16);
  if (!((unint64_t)v2 >> 62))
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFF8LL));
    swift_bridgeObjectRetain(*(void *)(v1 + 16));
    if (v3) {
      goto LABEL_3;
    }
LABEL_16:
    sub_249D4();
LABEL_17:
    char v9 = 0;
    goto LABEL_18;
  }

  if (v2 < 0) {
    uint64_t v10 = *(void *)(v1 + 16);
  }
  else {
    uint64_t v10 = v2 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(*(void *)(v1 + 16));
  if (!_CocoaArrayWrapper.endIndex.getter(v10)) {
    goto LABEL_16;
  }
LABEL_3:
  sub_398E0(0LL, (v2 & 0xC000000000000001LL) == 0, v2);
  if ((v2 & 0xC000000000000001LL) != 0) {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v2);
  }
  else {
    id v4 = *(id *)(v2 + 32);
  }
  uint64_t v5 = v4;
  sub_249D4();
  sub_134BE4(v5, (SEL *)&selRef_completionStatus);
  if (!v7) {
    goto LABEL_17;
  }
  if (v6 == 0x6E656B6174LL && v7 == 0xE500000000000000LL)
  {
    sub_2A184();
    char v9 = 1;
  }

  else
  {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v6, v7, 0x6E656B6174LL, 0xE500000000000000LL, 0LL);
    sub_2A184();
  }

LABEL_27:
  uint64_t v16 = 1LL;
LABEL_28:
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v0[41], v16, 1LL, v0[36]);
  uint64_t v19 = *(void *)(v1 + 16);
  if (!((unint64_t)v19 >> 62))
  {
    uint64_t v20 = *(void *)((char *)&dword_10 + (v19 & 0xFFFFFFFFFFFFF8LL));
    sub_134E5C();
    if (v20) {
      goto LABEL_30;
    }
LABEL_36:
    sub_2A184();
    goto LABEL_37;
  }

  if (v19 < 0) {
    uint64_t v28 = *(void *)(v1 + 16);
  }
  else {
    uint64_t v28 = v19 & 0xFFFFFFFFFFFFFF8LL;
  }
  sub_134E5C();
  if (!_CocoaArrayWrapper.endIndex.getter(v28)) {
    goto LABEL_36;
  }
LABEL_30:
  sub_134E64();
  unint64_t v21 = (void *)sub_41D50();
  sub_2A184();
  sub_134BE4(v21, (SEL *)&selRef_schedule);
  if (!v23)
  {
LABEL_37:
    String.toSpeakableString.getter(0x656465654E207341LL, 0xE900000000000064LL);
    goto LABEL_38;
  }

  uint64_t v25 = v0[38];
  uint64_t v24 = v0[39];
  uint64_t v26 = v0[36];
  uint64_t v27 = v0[37];
  String.toSpeakableString.getter(v22, v23);
  sub_2A184();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v24, v25, v26);
LABEL_38:
  uint64_t v30 = v0[39];
  uint64_t v31 = v0[40];
  uint64_t v33 = v0[36];
  uint64_t v32 = v0[37];
  v0[42] = *(void *)(v0[27] + 184LL);
  sub_DA14(v31, v30, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v32 + 16));
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v31, 0LL, 1LL, v33);
  uint64_t v34 = dword_190BEC;
  swift_retain();
  uint64_t v35 = (void *)swift_task_alloc(v34);
  v0[43] = v35;
  *uint64_t v35 = v0;
  v35[1] = sub_1340A8;
  return sub_131604(v0[40], v0[41], v9 & 1);
}

uint64_t sub_1340A8(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v11 = v4;
  uint64_t v5 = sub_59AF4(*(void *)(v4 + 344), &v11);
  if (v1)
  {
    swift_release();
    uint64_t v6 = swift_errorRelease(v1);
    sub_41B5C(v6, &qword_189D00);
  }

  else
  {
    *(void *)(v4 + 352) = a1;
    sub_41B5C(v5, &qword_189D00);
    swift_release();
  }

  sub_A964();
  return swift_task_switch(v7, v8, v9);
}

uint64_t sub_13414C()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_18B6EC);
  *(void *)(v0 + 360) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_134198;
  return sub_36164(0x6C65636E6163LL, 0xE600000000000000LL);
}

uint64_t sub_134198()
{
  v2[20] = v0;
  v2[21] = v1;
  v2[22] = v3;
  uint64_t v4 = v2[45];
  *uint64_t v5 = *v0;
  v2[46] = v3;
  swift_task_dealloc(v4);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_1341E0()
{
  v0[47] = v0[21];
  uint64_t v1 = (void *)swift_task_alloc(dword_18B6EC);
  v0[48] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_134238;
  return sub_36164(0x6D7269666E6F63LL, 0xE700000000000000LL);
}

uint64_t sub_134238()
{
  v2[23] = v0;
  v2[24] = v1;
  v2[25] = v3;
  uint64_t v4 = v2[48];
  *uint64_t v5 = *v0;
  v2[49] = v3;
  swift_task_dealloc(v4);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_134280()
{
  unint64_t v1 = v0[49];
  unint64_t v3 = v0[46];
  uint64_t v2 = v0[47];
  uint64_t v4 = (void *)v0[44];
  uint64_t v5 = v0[31];
  uint64_t v6 = v0[32];
  uint64_t v7 = v0[27];
  BOOL v8 = v3 == 0;
  if (!v3) {
    unint64_t v3 = 0xE600000000000000LL;
  }
  unint64_t v32 = v3;
  if (v8) {
    uint64_t v2 = 0x6C65636E6143LL;
  }
  uint64_t v31 = v2;
  if (v1) {
    uint64_t v9 = v0[24];
  }
  else {
    uint64_t v9 = 0x6D7269666E6F43LL;
  }
  if (!v1) {
    unint64_t v1 = 0xE700000000000000LL;
  }
  unint64_t v29 = v1;
  uint64_t v30 = v9;
  v0[5] = &type metadata for WellnessFeatureFlagsKey;
  v0[6] = sub_354B0();
  *((_BYTE *)v0 + 16) = 4;
  char v10 = isFeatureEnabled(_:)(v0 + 2);
  uint64_t v11 = _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v0 + 2);
  static DialogPhase.clarification.getter(v11);
  OutputGenerationManifest.init(dialogPhase:_:)(v6, PhoneRingsSnippet.body.getter, 0LL);
  OutputGenerationManifest.listenAfterSpeaking.setter(1LL);
  sub_1348A4();
  uint64_t v12 = type metadata accessor for NLContextUpdate(0LL);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v5, 0LL, 1LL, v12);
  OutputGenerationManifest.nlContextUpdate.setter(v5);
  OutputGenerationManifest.canUseServerTTS.setter(0LL);
  id v13 = [v4 catId];
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
  uint64_t v16 = v15;

  OutputGenerationManifest.responseViewId.setter(v14, v16);
  OutputGenerationManifest.printSupportingDialogInDisplayModes.setter(1LL);
  sub_D7EC(v7 + 200, (uint64_t)(v0 + 7));
  uint64_t v17 = v0[10];
  sub_500C(v0 + 7, v17);
  uint64_t v18 = type metadata accessor for WellnessSnippets(0LL);
  v0[15] = v18;
  sub_A410( (unint64_t *)&qword_18A468,  type metadata accessor for WellnessSnippets,  (uint64_t)&protocol conformance descriptor for WellnessSnippets);
  v0[16] = v19;
  uint64_t v20 = sub_B76C(v0 + 12);
  void *v20 = 0xD000000000000031LL;
  v20[1] = 0x80000000001449C0LL;
  v20[2] = v31;
  v20[3] = v32;
  v20[4] = v30;
  v20[5] = v29;
  *((_BYTE *)v20 + 48) = v10 & 1;
  swift_storeEnumTagMultiPayload(v20, v18, 5LL);
  uint64_t v21 = sub_494C(&qword_18A460);
  uint64_t v22 = swift_allocObject(v21, 40LL, 7LL);
  *(_OWORD *)(v22 + 16) = xmmword_138BA0;
  *(void *)(v22 + 32) = v4;
  uint64_t v33 = v22;
  specialized Array._endMutation()(v22, v23, v24);
  v0[50] = v33;
  uint64_t v25 = async function pointer to dispatch thunk of ResponseGenerating.makeResponseOutput(conversationModel:dialog:outputGenerationManifest:)[1];
  id v26 = v4;
  uint64_t v27 = (void *)swift_task_alloc(v25);
  v0[51] = v27;
  *uint64_t v27 = v0;
  v27[1] = sub_134528;
  return dispatch thunk of ResponseGenerating.makeResponseOutput(conversationModel:dialog:outputGenerationManifest:)( v0[26],  v0 + 12,  v33,  v0[35],  v17);
}

uint64_t sub_134528()
{
  return sub_D954();
}

uint64_t sub_13456C()
{
  uint64_t v1 = *(void *)(v0 + 328);
  uint64_t v2 = *(void *)(v0 + 312);
  uint64_t v3 = *(void *)(v0 + 296);
  uint64_t v5 = *(void *)(v0 + 272);
  uint64_t v4 = *(void *)(v0 + 280);

  sub_41BBC(v4, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  sub_D970(v2, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  sub_A4A4(v1, &qword_189D00);
  sub_AA20();
  sub_134E44();
  sub_A78C();
  sub_A67C();
  sub_A7C8();
  sub_A760();
  sub_A8EC();
  sub_A910();
  sub_A864();
  return sub_D8C4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_134618(uint64_t a1)
{
  uint64_t v3 = v1[29];
  uint64_t v2 = v1[30];
  uint64_t v4 = Logger.wellness.unsafeMutableAddressor(a1);
  sub_A5DC(v4, (uint64_t)(v1 + 17));
  sub_DA14(v2, v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
  uint64_t v5 = (void *)sub_23374();
  os_log_type_t v6 = static os_log_type_t.debug.getter(v5);
  if (sub_A988(v6))
  {
    uint64_t v7 = (_WORD *)sub_A5E8(2LL);
    *uint64_t v7 = 0;
    sub_A940(&dword_0, v8, v9, "Couldn't create logMedAsNeededConfirmation_Dialog, returning generic error output.");
    sub_5050((uint64_t)v7);
  }

  uint64_t v10 = v1[29];

  sub_202F4(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
  unint64_t v11 = sub_134D28();
  uint64_t v12 = swift_allocError(&type metadata for LogMedAsNeededConfirmationStrategyError, v11, 0LL, 0LL);
  v1[52] = v12;
  id v13 = (uint64_t **)swift_task_alloc(dword_190CC4);
  v1[53] = (uint64_t)v13;
  void *v13 = v1;
  v13[1] = (uint64_t *)sub_13471C;
  return sub_1337DC(v1[26], v12);
}

uint64_t sub_13471C()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 424);
  *(void *)(*v1 + 432) = v0;
  swift_task_dealloc(v3);
  if (!v0) {
    swift_errorRelease(*(void *)(v2 + 416));
  }
  sub_A964();
  return sub_D954();
}

uint64_t sub_134780()
{
  uint64_t v1 = *(void *)(v0 + 328);
  sub_565A8(*(void *)(v0 + 296));
  sub_A4A4(v1, &qword_189D00);
  sub_134E44();
  sub_A78C();
  sub_A67C();
  sub_A7C8();
  sub_A760();
  sub_A8EC();
  sub_A910();
  sub_A864();
  return sub_61844(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1347F0()
{
  uint64_t v1 = *(void *)(v0 + 416);
  uint64_t v2 = *(void *)(v0 + 328);
  uint64_t v3 = *(void *)(v0 + 248);
  uint64_t v4 = *(void *)(v0 + 240);
  (*(void (**)(void, void))(*(void *)(v0 + 296) + 8LL))(*(void *)(v0 + 312), *(void *)(v0 + 288));
  sub_A4A4(v2, &qword_189D00);
  swift_errorRelease(v1);
  sub_A67C();
  sub_A7C8();
  sub_A760();
  sub_A8EC();
  sub_A910();
  sub_A864();
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1348A4()
{
  uint64_t v1 = type metadata accessor for Siri_Nlu_External_SystemDialogAct(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  sub_27AD8();
  uint64_t v3 = type metadata accessor for Siri_Nlu_External_SystemOffered(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v17 - v9;
  uint64_t v11 = Siri_Nlu_External_SystemOffered.init()(v8);
  Siri_Nlu_External_SystemDialogAct.init()(v11);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v10, v3);
  uint64_t v12 = Siri_Nlu_External_SystemDialogAct.offered.setter(v7);
  NLContextUpdate.init()(v12);
  uint64_t v13 = sub_494C(&qword_189ED8);
  uint64_t v14 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v15 = (v14 + 32) & ~v14;
  uint64_t v16 = swift_allocObject(v13, v15 + *(void *)(v2 + 72), v14 | 7);
  *(_OWORD *)(v16 + 16) = xmmword_137250;
  sub_DA14(v16 + v15, v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
  NLContextUpdate.nluSystemDialogActs.setter(v16);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  sub_D970((uint64_t)v10, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  sub_D8FC();
}

uint64_t type metadata accessor for LogMedAsNeededConfirmationStrategy()
{
  return objc_opt_self(&OBJC_CLASS____TtC18WellnessFlowPlugin34LogMedAsNeededConfirmationStrategy);
}

uint64_t sub_134A18(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc(dword_190CBC);
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_134A68;
  return sub_132DA4(a2);
}

uint64_t sub_134A68(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  uint64_t v9 = v6;
  sub_59AF4(*(void *)(v6 + 24), &v9);
  if (!v2)
  {
    uint64_t v7 = *(void **)(v6 + 16);
    *uint64_t v7 = a1;
    v7[1] = a2;
  }

  return sub_D8C4((uint64_t (*)(void))v3[1]);
}

uint64_t sub_134ABC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc(dword_190CCC);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_A622C;
  return sub_133CE0(a1);
}

uint64_t sub_134B0C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_190CC4);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_A622C;
  return sub_1337DC(a1, a2);
}

void sub_134B70(uint64_t a1)
{
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v1 = a1;
    }
    else {
      uint64_t v1 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    sub_134E5C();
    _CocoaArrayWrapper.endIndex.getter(v1);
    sub_2A184();
  }

  sub_A890();
}

BOOL sub_134BC0(uint64_t a1)
{
  return (a1 & 0xC000000000000001LL) == 0;
}

void sub_134BCC(void *a1)
{
}

void sub_134BD8(void *a1)
{
}

void sub_134BE4(void *a1, SEL *a2)
{
  id v3 = [a1 *a2];

  if (v3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  }

  sub_1EB0C();
}

void sub_134C44(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  sub_134CBC(v6, a2, a3);
  v6[4] = v7;
  sub_1EB0C();
}

void sub_134C90(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32LL))(*a1);
  free(v1);
}

void sub_134CBC(void *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = a3 & 0xC000000000000001LL;
  sub_398E0(a2, (a3 & 0xC000000000000001LL) == 0, a3);
  if (v6) {
    id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
  }
  else {
    id v7 = *(id *)(a3 + 8 * a2 + 32);
  }
  *a1 = v7;
  sub_1EB0C();
}

void sub_134D20(id *a1)
{
}

unint64_t sub_134D28()
{
  unint64_t result = qword_190E40;
  if (!qword_190E40)
  {
    unint64_t result = swift_getWitnessTable(&unk_1405B0, &type metadata for LogMedAsNeededConfirmationStrategyError);
    atomic_store(result, (unint64_t *)&qword_190E40);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for LogMedAsNeededConfirmationStrategyError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_134DA4 + 4 * byte_140430[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_134DC4 + 4 * byte_140435[v4]))();
  }
}

_BYTE *sub_134DA4(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_134DC4(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_134DCC(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_134DD4(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_134DDC(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_134DE4(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for LogMedAsNeededConfirmationStrategyError()
{
  return &type metadata for LogMedAsNeededConfirmationStrategyError;
}

unint64_t sub_134E04()
{
  unint64_t result = qword_190E48;
  if (!qword_190E48)
  {
    unint64_t result = swift_getWitnessTable(&unk_140588, &type metadata for LogMedAsNeededConfirmationStrategyError);
    atomic_store(result, (unint64_t *)&qword_190E48);
  }

  return result;
}

uint64_t sub_134E44()
{
  return swift_task_dealloc(*(void *)(v0 + 328));
}

uint64_t sub_134E5C()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_134E64()
{
  return sub_398E0(0LL, (v0 & 0xC000000000000001LL) == 0, v0);
}

uint64_t _s18WellnessFlowPlugin20GenericButtonSnippetV14_actionHandler33_C4F64AB2145C6C08CB305FFD78E00F71LL0F2UI06ActionH0Vvpfi_0()
{
  return ActionHandler.init()();
}