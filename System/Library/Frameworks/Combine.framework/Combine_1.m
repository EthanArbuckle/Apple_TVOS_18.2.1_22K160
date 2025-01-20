void Publishers.Throttle.Inner.receive(_:)(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void v17[10];
  uint64_t v18;
  uint64_t v19;
  uint64_t AssociatedTypeWitness;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  v17[7] = a1;
  v2 = *(void **)v1;
  v3 = *(void *)(*(void *)v1 + 120LL);
  v4 = *(void *)(*(void *)v1 + 96LL);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v18 = type metadata accessor for Optional();
  v17[9] = *(void *)(v18 - 8);
  v5 = MEMORY[0x1895F8858](v18);
  v17[6] = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v5);
  v17[5] = (char *)v17 - v7;
  v8 = v2[14];
  v9 = v2[11];
  v19 = swift_getAssociatedTypeWitness();
  v17[8] = *(void *)(v19 - 8);
  v10 = MEMORY[0x1895F8858](v19);
  v21 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v12 = MEMORY[0x1895F8858](v10);
  v24 = (char *)v17 - v13;
  v23 = *(void *)(v9 - 8);
  MEMORY[0x1895F8858](v12);
  v22 = (char *)v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v15 = v2[10];
  v16 = v2[13];
  v25 = v15;
  v26 = v9;
  v27 = v4;
  v28 = v16;
  v29 = v8;
  v30 = v3;
  type metadata accessor for Publishers.Throttle.Inner.State();
}

void sub_183B64998(uint64_t a1)
{
  *(void *)(v7 - 136) = v6;
  *(void *)(v7 - 128) = v1;
  *(void *)(v7 - 248) = v1;
  *(void *)(v7 - 120) = v2;
  *(void *)(v7 - 112) = v3;
  *(void *)(v7 - 264) = v5;
  *(void *)(v7 - 104) = v5;
  *(void *)(v7 - 96) = v4;
  type metadata accessor for Publishers.Throttle.Inner.Scheduling();
}

uint64_t sub_183B649E8(uint64_t a1)
{
  uint64_t v8 = *(void *)(a1 - 8);
  MEMORY[0x1895F8858](a1);
  v10 = (char *)&v54 - v9;
  v11 = (os_unfair_lock_s *)v2[2];
  *(void *)(v6 - 216) = v11;
  os_unfair_lock_lock(v11);
  v12 = (char *)v2 + *(void *)(*v2 + 144LL);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 16))(v5, v12, v3);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v3);
LABEL_8:
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v6 - 216));
    return 0LL;
  }

  *(void *)(v6 - 136) = a1;
  *(void *)(v6 - 128) = v1;
  *(void *)(v6 - 120) = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Subscription);
  uint64_t v13 = v8;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  type metadata accessor for Subscribers.Completion(255LL, AssociatedTypeWitness, AssociatedConformanceWitness, v16);
  *(void *)(v6 - 112) = type metadata accessor for Optional();
  TupleTypeMetadata = (int *)swift_getTupleTypeMetadata();
  *(void *)(v6 - 336) = v5 + TupleTypeMetadata[12];
  uint64_t v18 = v5 + TupleTypeMetadata[16];
  uint64_t v19 = v5 + TupleTypeMetadata[20];
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))(v10, v5, a1);
  uint64_t v21 = type metadata accessor for Subscribers.Completion(0LL, AssociatedTypeWitness, AssociatedConformanceWitness, v20);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 48LL))(v19, 1LL, v21) != 1)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, a1);
    uint64_t v41 = type metadata accessor for Optional();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v41 - 8) + 8LL))(v19, v41);
    __swift_destroy_boxed_opaque_existential_1(v18);
    (*(void (**)(void, uint64_t))(*(void *)(v1 - 8) + 8LL))(*(void *)(v6 - 336), v1);
    goto LABEL_8;
  }

  *(void *)(v6 - 344) = v13;
  uint64_t v22 = type metadata accessor for Optional();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8LL))(v19, v22);
  __swift_destroy_boxed_opaque_existential_1(v18);
  (*(void (**)(void, uint64_t))(*(void *)(v1 - 8) + 8LL))(*(void *)(v6 - 336), v1);
  uint64_t v23 = *(void *)(v6 - 248);
  (*(void (**)(void, char *, uint64_t))(*(void *)(v6 - 232) + 16LL))( *(void *)(v6 - 240),  &v10[*(int *)(a1 + 68)],  v23);
  (*(void (**)(uint64_t, void))(*(void *)(v6 - 264) + 40LL))(v23, *(void *)(v6 - 264));
  v24 = (char *)v2 + *(void *)(*v2 + 168LL);
  swift_beginAccess();
  uint64_t v25 = *(void *)(v6 - 304);
  v26 = *(void (**)(uint64_t, char *, uint64_t))(v25 + 16);
  uint64_t v27 = *(void *)(v6 - 256);
  *(void *)(v6 - 352) = v24;
  uint64_t v28 = *(void *)(v6 - 280);
  *(void *)(v6 - 360) = v26;
  v26(v27, v24, v28);
  swift_getAssociatedConformanceWitness();
  uint64_t v29 = v25;
  char v30 = dispatch thunk of static Comparable.>= infix(_:_:)();
  v31 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
  v31(v27, v28);
  *(void *)(v6 - 336) = a1;
  char v32 = v10[*(int *)(a1 + 72)];
  v33 = v10;
  uint64_t v34 = *(void *)(v6 - 288);
  uint64_t v35 = *(void *)(v6 - 296);
  if ((v32 & 1) == 0)
  {
    if ((v30 & 1) != 0)
    {
      uint64_t v36 = *(void *)(v6 - 256);
      *(void *)(v6 - 328) = v33;
      char v37 = v30;
      uint64_t v38 = v29;
      dispatch thunk of Strideable.advanced(by:)();
      uint64_t v39 = *(void *)(v6 - 352);
      swift_beginAccess();
      v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 40);
      char v30 = v37;
      v33 = *(char **)(v6 - 328);
      v40(v39, v36, v28);
      swift_endAccess();
    }

    else
    {
      v42 = (char *)v2 + *(void *)(*v2 + 160LL);
      swift_beginAccess();
      uint64_t v43 = *(void *)(v6 - 328);
      (*(void (**)(uint64_t, char *, uint64_t))(v35 + 16))(v43, v42, v34);
      LODWORD(v42) = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v6 - 272) - 8LL) + 48LL))( v43,  1LL);
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v43, v34);
      if ((_DWORD)v42 != 1) {
        goto LABEL_11;
      }
    }
  }

  uint64_t v44 = *(void *)(v6 - 272);
  uint64_t v45 = *(void *)(v44 - 8);
  uint64_t v46 = *(void *)(v6 - 320);
  (*(void (**)(uint64_t, void, uint64_t))(v45 + 16))(v46, *(void *)(v6 - 312), v44);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v45 + 56))(v46, 0LL, 1LL, v44);
  v47 = (char *)v2 + *(void *)(*v2 + 160LL);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 40))(v47, v46, v34);
  swift_endAccess();
LABEL_11:
  uint64_t v48 = *(void *)(*v2 + 176LL);
  if ((*((_BYTE *)v2 + v48) & 1) != 0 || !*(void *)((char *)v2 + *(void *)(*v2 + 152LL)))
  {
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v6 - 216));
    v31(*(void *)(v6 - 224), v28);
    (*(void (**)(void, void))(*(void *)(v6 - 232) + 8LL))(*(void *)(v6 - 240), *(void *)(v6 - 248));
  }

  else
  {
    *((_BYTE *)v2 + v48) = 1;
    uint64_t v49 = *(void *)(v6 - 248);
    uint64_t v50 = *(void *)(v6 - 240);
    v51 = *(os_unfair_lock_s **)(v6 - 216);
    if ((v30 & 1) != 0)
    {
      os_unfair_lock_unlock(*(os_unfair_lock_t *)(v6 - 216));
      swift_retain();
      Scheduler.schedule(_:)( (uint64_t)partial apply for closure #2 in Publishers.Throttle.Inner.receive(_:),  (uint64_t)v2,  v49,  *(void *)(v6 - 264));
      swift_release();
    }

    else
    {
      uint64_t v52 = *(void *)(v6 - 256);
      (*(void (**)(uint64_t, void, uint64_t))(v6 - 360))(v52, *(void *)(v6 - 352), v28);
      os_unfair_lock_unlock(v51);
      swift_retain();
      Scheduler.schedule(after:_:)( v52,  (uint64_t)partial apply for closure #2 in Publishers.Throttle.Inner.receive(_:),  (uint64_t)v2,  v49,  *(void *)(v6 - 264));
      swift_release();
      v31(v52, v28);
    }

    v31(*(void *)(v6 - 224), v28);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 232) + 8LL))(v50, v49);
  }

  (*(void (**)(char *, void))(*(void *)(v6 - 344) + 8LL))(v33, *(void *)(v6 - 336));
  return 0LL;
}

void Publishers.Throttle.Inner.receive(completion:)(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v2 = (void *)*v1;
  uint64_t v3 = v2[14];
  uint64_t v4 = v2[11];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11[7] = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v5 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  v11[6] = (char *)v11 - v6;
  uint64_t v15 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v5);
  v14 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = v2[12];
  uint64_t v9 = v2[13];
  uint64_t v10 = v2[15];
  uint64_t v16 = v2[10];
  uint64_t v17 = v4;
  uint64_t v18 = v8;
  uint64_t v19 = v9;
  uint64_t v20 = v3;
  uint64_t v21 = v10;
  type metadata accessor for Publishers.Throttle.Inner.State();
}

void sub_183B650DC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16 = MEMORY[0x1895F8858](a1);
  *(void *)(v15 - 240) = (char *)&a9 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = MEMORY[0x1895F8858](v16);
  *(void *)(v15 - 208) = *(void *)(v9 - 8);
  MEMORY[0x1895F8858](v18);
  *(void *)(v15 - 216) = (char *)&a9 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v15 - 136) = v10;
  *(void *)(v15 - 128) = v11;
  *(void *)(v15 - 200) = v9;
  *(void *)(v15 - 120) = v9;
  *(void *)(v15 - 112) = v12;
  *(void *)(v15 - 104) = v13;
  *(void *)(v15 - 96) = v14;
  type metadata accessor for Publishers.Throttle.Inner.Scheduling();
}

void sub_183B65180(uint64_t a1)
{
  *(void *)(v7 - 224) = *(void *)(a1 - 8);
  MEMORY[0x1895F8858](a1);
  *(void *)(v7 - 232) = (char *)&v50 - v9;
  uint64_t v10 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v10);
  uint64_t v11 = (char *)v1 + *(void *)(*v1 + 144LL);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(v2, v11, v4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *(void *)(v7 - 320) = v11;
    *(void *)(v7 - 304) = v10;
    *(void *)(v7 - 296) = v3;
    *(void *)(v7 - 312) = v4;
    *(void *)(v7 - 328) = v6;
    uint64_t v12 = *(void *)(v7 - 200);
    *(void *)(v7 - 192) = a1;
    *(void *)(v7 - 184) = v12;
    *(void *)(v7 - 176) = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Subscription);
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    type metadata accessor for Subscribers.Completion(255LL, AssociatedTypeWitness, AssociatedConformanceWitness, v15);
    *(void *)(v7 - 168) = type metadata accessor for Optional();
    TupleTypeMetadata = (int *)swift_getTupleTypeMetadata();
    uint64_t v17 = a1;
    uint64_t v18 = v2 + TupleTypeMetadata[12];
    uint64_t v19 = (__int128 *)(v2 + TupleTypeMetadata[16]);
    uint64_t v20 = v2 + TupleTypeMetadata[20];
    uint64_t v21 = v2;
    uint64_t v22 = v17;
    (*(void (**)(void, uint64_t))(*(void *)(v7 - 224) + 32LL))(*(void *)(v7 - 232), v21);
    (*(void (**)(void, uint64_t, uint64_t))(*(void *)(v7 - 208) + 32LL))(*(void *)(v7 - 216), v18, v12);
    outlined init with take of Subscription(v19, v7 - 136);
    uint64_t v24 = type metadata accessor for Subscribers.Completion( 0LL,  AssociatedTypeWitness,  AssociatedConformanceWitness,  v23);
    uint64_t v25 = *(void *)(v24 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v20, 1LL, v24) == 1)
    {
      uint64_t v26 = type metadata accessor for Optional();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 8LL))(v20, v26);
      uint64_t v27 = v22;
      uint64_t v28 = *(void *)(v7 - 232);
      uint64_t v29 = v28 + *(int *)(v22 + 68);
      char v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 248) + 16LL);
      uint64_t v31 = *(void *)(v7 - 256);
      *(void *)(v7 - 336) = v5;
      v30(v31, v29, v5);
      uint64_t v32 = *(void *)(v7 - 288);
      (*(void (**)(uint64_t))(*(void *)(v7 - 328) + 40LL))(v5);
      v33 = (char *)v1 + *(void *)(*v1 + 168LL);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, void))(*(void *)(v7 - 280) + 40LL))(v33, v32, *(void *)(v7 - 272));
      swift_endAccess();
      uint64_t v34 = *(void *)(v7 - 240);
      uint64_t v35 = v34 + TupleTypeMetadata[12];
      uint64_t v36 = v34 + TupleTypeMetadata[16];
      uint64_t v37 = v34 + TupleTypeMetadata[20];
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 224) + 16LL))(v34, v28, v27);
      (*(void (**)(uint64_t, void, void))(*(void *)(v7 - 208) + 16LL))( v35,  *(void *)(v7 - 216),  *(void *)(v7 - 200));
      outlined init with copy of Subscription(v7 - 136, v36);
      (*(void (**)(uint64_t, void, uint64_t))(v25 + 16))(v37, *(void *)(v7 - 264), v24);
      uint64_t v38 = v27;
      uint64_t v39 = *(void *)(v7 - 248);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v25 + 56))(v37, 0LL, 1LL, v24);
      uint64_t v40 = *(void *)(v7 - 312);
      swift_storeEnumTagMultiPayload();
      uint64_t v41 = *(void *)(v7 - 320);
      swift_beginAccess();
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)(v7 - 336);
      uint64_t v44 = v34;
      uint64_t v45 = *(void *)(v7 - 256);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 296) + 40LL))(v42, v44, v40);
      swift_endAccess();
      uint64_t v46 = *(void *)(*v1 + 176LL);
      v47 = *(os_unfair_lock_s **)(v7 - 304);
      if ((*((_BYTE *)v1 + v46) & 1) != 0)
      {
        os_unfair_lock_unlock(v47);
      }

      else
      {
        *((_BYTE *)v1 + v46) = 1;
        os_unfair_lock_unlock(v47);
        swift_retain();
        Scheduler.schedule(_:)( (uint64_t)partial apply for closure #1 in Publishers.Throttle.Inner.receive(completion:),  (uint64_t)v1,  v43,  *(void *)(v7 - 328));
        swift_release();
      }

      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v45, v43);
      __swift_destroy_boxed_opaque_existential_1(v7 - 136);
      (*(void (**)(void, void))(*(void *)(v7 - 208) + 8LL))( *(void *)(v7 - 216),  *(void *)(v7 - 200));
      (*(void (**)(void, uint64_t))(*(void *)(v7 - 224) + 8LL))(*(void *)(v7 - 232), v38);
      return;
    }

    __swift_destroy_boxed_opaque_existential_1(v7 - 136);
    (*(void (**)(void, void))(*(void *)(v7 - 208) + 8LL))(*(void *)(v7 - 216), *(void *)(v7 - 200));
    (*(void (**)(void, uint64_t))(*(void *)(v7 - 224) + 8LL))(*(void *)(v7 - 232), v22);
    uint64_t v48 = type metadata accessor for Optional();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v48 - 8) + 8LL))(v20, v48);
    uint64_t v4 = *(void *)(v7 - 312);
    uint64_t v3 = *(void *)(v7 - 296);
    uint64_t v10 = *(os_unfair_lock_s **)(v7 - 304);
    uint64_t v11 = *(char **)(v7 - 320);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  }

  if ((*((_BYTE *)v1 + *(void *)(*v1 + 176LL)) & 1) == 0)
  {
    uint64_t v49 = *(void *)(v7 - 240);
    swift_storeEnumTagMultiPayload();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 40))(v11, v49, v4);
    swift_endAccess();
  }

  os_unfair_lock_unlock(v10);
}

void protocol witness for Subscriber.receive(subscription:) in conformance Publishers.Throttle<A, B>.Inner<A1>( uint64_t a1)
{
}

  ;
}

void protocol witness for Subscriber.receive(_:) in conformance Publishers.Throttle<A, B>.Inner<A1>( uint64_t a1)
{
}

  ;
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.Throttle<A, B>.Inner<A1>( uint64_t a1)
{
}

  ;
}

void protocol witness for Subscription.request(_:) in conformance Publishers.Throttle<A, B>.Inner<A1>( uint64_t a1)
{
}

  ;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Throttle<A, B>.Inner<A1>()
{
  return 0x656C74746F726854LL;
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Throttle<A, B>.Inner<A1>( void *a1@<X8>)
{
}

void protocol witness for Cancellable.cancel() in conformance Publishers.Throttle<A, B>.Inner<A1>()
{
}

  ;
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Throttle<A, B>()
{
}

void specialized Publishers.Throttle.Inner.init(_:interval:scheduler:latest:)( uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v17 = a4;
  v16[8] = a2;
  v16[9] = a3;
  uint64_t v19 = a1;
  uint64_t v5 = *(void **)v4;
  uint64_t v6 = *(void *)(*(void *)v4 + 112LL);
  uint64_t v7 = *(void *)(*(void *)v4 + 88LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v20 = *(void *)(AssociatedTypeWitness - 8);
  v16[10] = AssociatedTypeWitness;
  uint64_t v9 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v18 = (char *)v16 - v10;
  v16[7] = *(void *)(v7 - 8);
  MEMORY[0x1895F8858](v9);
  v16[6] = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_getAssociatedConformanceWitness();
  uint64_t v12 = swift_getAssociatedTypeWitness();
  v16[2] = *(void *)(v12 - 8);
  v16[3] = v12;
  MEMORY[0x1895F8858](v12);
  uint64_t v14 = v5[12];
  uint64_t v13 = v5[13];
  uint64_t v15 = v5[15];
  uint64_t v21 = v5[10];
  uint64_t v22 = v7;
  v16[0] = v21;
  v16[1] = v13;
  uint64_t v23 = v14;
  uint64_t v24 = v13;
  uint64_t v25 = v6;
  uint64_t v26 = v15;
  type metadata accessor for Publishers.Throttle.Inner.State();
}

void sub_183B658D8(uint64_t a1)
{
  uint64_t v9 = *(void *)(a1 - 8);
  *(void *)(v8 - 224) = a1;
  *(void *)(v8 - 216) = v9;
  MEMORY[0x1895F8858](a1);
  uint64_t v10 = (_DWORD *)swift_slowAlloc();
  _DWORD *v10 = 0;
  v1[2] = v10;
  uint64_t v11 = (void *)swift_slowAlloc();
  void *v11 = 0LL;
  v1[3] = v11;
  uint64_t v12 = (char *)v1 + *(void *)(*v1 + 160LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL))( v12,  1LL,  1LL,  AssociatedTypeWitness);
  *((_BYTE *)v1 + *(void *)(*v1 + 176LL)) = 0;
  *((_BYTE *)v1 + *(void *)(*v1 + 184LL)) = 0;
  *(void *)(v8 - 136) = v5;
  *(void *)(v8 - 128) = v4;
  *(void *)(v8 - 120) = v6;
  *(void *)(v8 - 112) = v2;
  *(void *)(v8 - 104) = v3;
  *(void *)(v8 - 96) = v7;
  type metadata accessor for Publishers.Throttle.Inner.Scheduling();
}

void sub_183B659A4()
{
}

uint64_t sub_183B65A20()
{
  uint64_t v7 = *(void *)(v6 - 224);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 216) + 32LL))( v0 + *(void *)(*(void *)v0 + 144LL),  v5,  v7);
  *(void *)(v0 + *(void *)(*(void *)v0 + 152LL)) = 0LL;
  uint64_t v8 = *(void *)(v6 - 160);
  (*(void (**)(uint64_t, uint64_t))(v1 + 40))(v2, v1);
  (*(void (**)(uint64_t, uint64_t, void))(*(void *)(v6 - 144) + 32LL))( v0 + *(void *)(*(void *)v0 + 168LL),  v8,  *(void *)(v6 - 176));
  return v0;
}

uint64_t type metadata completion function for Publishers.Throttle()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    uint64_t result = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.Throttle(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = *(void *)(v4 - 8);
  int v13 = *(_DWORD *)(v12 + 80);
  uint64_t v14 = *(void *)(v9 + 64) + v13;
  uint64_t v15 = *(void *)(v12 + 64);
  uint64_t v16 = (*(_BYTE *)(v9 + 80) | *(_BYTE *)(v6 + 80) | v13);
  if (v16 > 7
    || ((*(_DWORD *)(v9 + 80) | *(_DWORD *)(v6 + 80) | v13) & 0x100000) != 0
    || v15 + ((v14 + (v11 & ~v10)) & ~(unint64_t)v13) + 1 > 0x18)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v16 + 16) & ~v16));
    swift_retain();
  }

  else
  {
    uint64_t v20 = ~v10;
    uint64_t v26 = AssociatedTypeWitness;
    unint64_t v27 = ~(unint64_t)v13;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    unint64_t v21 = ((unint64_t)a1 + v11) & v20;
    unint64_t v22 = ((unint64_t)a2 + v11) & v20;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(v21, v22, v26);
    unint64_t v23 = (v21 + v14) & v27;
    unint64_t v24 = (v22 + v14) & v27;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v12 + 16))(v23, v24, v4);
    *(_BYTE *)(v23 + v15) = *(_BYTE *)(v24 + v15);
  }

  return a1;
}

uint64_t destroy for Publishers.Throttle(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8LL);
  (*(void (**)(void))(v4 + 8))();
  uint64_t v5 = *(void *)(v4 + 64) + a1;
  uint64_t v6 = *(void *)(a2 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  unint64_t v9 = (v5 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v9, AssociatedTypeWitness);
  return (*(uint64_t (**)(unint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))( (v9 + *(void *)(v8 + 64) + *(unsigned __int8 *)(*(void *)(v6 - 8) + 80LL)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80LL),  v6);
}

uint64_t initializeWithCopy for Publishers.Throttle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v6 + 16))();
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v11 + a1) & ~v11;
  uint64_t v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v12, v13, AssociatedTypeWitness);
  uint64_t v14 = *(void *)(v10 + 64);
  uint64_t v15 = *(void *)(v8 - 8);
  uint64_t v16 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v17 = v14 + v16;
  uint64_t v18 = (v17 + v12) & ~v16;
  uint64_t v19 = (v17 + v13) & ~v16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v18, v19, v8);
  *(_BYTE *)(v18 + *(void *)(v15 + 64)) = *(_BYTE *)(v19 + *(void *)(v15 + 64));
  return a1;
}

uint64_t assignWithCopy for Publishers.Throttle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v6 + 24))();
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v11 + a1) & ~v11;
  uint64_t v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24))(v12, v13, AssociatedTypeWitness);
  uint64_t v14 = *(void *)(v10 + 64);
  uint64_t v15 = *(void *)(v8 - 8);
  uint64_t v16 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v17 = v14 + v16;
  uint64_t v18 = (v17 + v12) & ~v16;
  uint64_t v19 = (v17 + v13) & ~v16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 24))(v18, v19, v8);
  *(_BYTE *)(v18 + *(void *)(v15 + 64)) = *(_BYTE *)(v19 + *(void *)(v15 + 64));
  return a1;
}

uint64_t initializeWithTake for Publishers.Throttle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v6 + 32))();
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v11 + a1) & ~v11;
  uint64_t v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v12, v13, AssociatedTypeWitness);
  uint64_t v14 = *(void *)(v10 + 64);
  uint64_t v15 = *(void *)(v8 - 8);
  uint64_t v16 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v17 = v14 + v16;
  uint64_t v18 = (v17 + v12) & ~v16;
  uint64_t v19 = (v17 + v13) & ~v16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v18, v19, v8);
  *(_BYTE *)(v18 + *(void *)(v15 + 64)) = *(_BYTE *)(v19 + *(void *)(v15 + 64));
  return a1;
}

uint64_t assignWithTake for Publishers.Throttle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v6 + 40))();
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v11 + a1) & ~v11;
  uint64_t v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 40))(v12, v13, AssociatedTypeWitness);
  uint64_t v14 = *(void *)(v10 + 64);
  uint64_t v15 = *(void *)(v8 - 8);
  uint64_t v16 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v17 = v14 + v16;
  uint64_t v18 = (v17 + v12) & ~v16;
  uint64_t v19 = (v17 + v13) & ~v16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 40))(v18, v19, v8);
  *(_BYTE *)(v18 + *(void *)(v15 + 64)) = *(_BYTE *)(v19 + *(void *)(v15 + 64));
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.Throttle(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  unsigned int v11 = *(_DWORD *)(v10 + 84);
  else {
    unsigned int v12 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v13 = *(void *)(v5 - 8);
  uint64_t v14 = *(unsigned int *)(v13 + 84);
  if (v12 <= 0xFE) {
    unsigned int v12 = 254;
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v15 = AssociatedTypeWitness;
  uint64_t v16 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v17 = *(void *)(v7 + 64) + v16;
  uint64_t v18 = *(void *)(v10 + 64);
  uint64_t v19 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v20 = *(void *)(v13 + 64);
  if (a2 <= v12) {
    goto LABEL_27;
  }
  uint64_t v21 = v20 + ((v18 + v19 + (v17 & ~v16)) & ~v19) + 1;
  char v22 = 8 * v21;
  unsigned int v24 = ((a2 - v12 + ~(-1 << v22)) >> v22) + 1;
  if (HIWORD(v24))
  {
    int v23 = *(_DWORD *)(a1 + v21);
    if (v23) {
      goto LABEL_18;
    }
  }

  else
  {
    if (v24 <= 0xFF)
    {
      if (v24 < 2) {
        goto LABEL_27;
      }
LABEL_11:
      int v23 = *(unsigned __int8 *)(a1 + v21);
      if (!*(_BYTE *)(a1 + v21)) {
        goto LABEL_27;
      }
LABEL_18:
      int v25 = (v23 - 1) << v22;
      if ((_DWORD)v20 + (((_DWORD)v18 + (_DWORD)v19 + (v17 & ~(_DWORD)v16)) & ~(_DWORD)v19) != -1)
      {
        else {
          int v26 = 4;
        }
        __asm { BR              X12 }
      }

      int v31 = v12 + v25;
      return (v31 + 1);
    }

    int v23 = *(unsigned __int16 *)(a1 + v21);
    if (*(_WORD *)(a1 + v21)) {
      goto LABEL_18;
    }
  }

void storeEnumTagSinglePayload for Publishers.Throttle( _BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 24);
  uint64_t v8 = *(void *)(*(void *)(a4 + 16) - 8LL);
  unsigned int v9 = *(_DWORD *)(v8 + 84);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v10 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v10 + 84) <= v9) {
    unsigned int v11 = v9;
  }
  else {
    unsigned int v11 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v12 = *(void *)(v7 - 8);
  if (*(_DWORD *)(v12 + 84) > v11) {
    unsigned int v11 = *(_DWORD *)(v12 + 84);
  }
  if (v11 <= 0xFE) {
    unsigned int v11 = 254;
  }
  uint64_t v13 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
  size_t v15 = *(void *)(v12 + 64) + ((*(void *)(v10 + 64) + v14 + ((*(void *)(v8 + 64) + v13) & ~v13)) & ~v14) + 1;
  if (a3 <= v11)
  {
    unsigned int v16 = 0u;
  }

  else if (v15 <= 3)
  {
    unsigned int v18 = ((a3 - v11 + ~(-1 << (8 * v15))) >> (8 * v15)) + 1;
    if (HIWORD(v18))
    {
      unsigned int v16 = 4u;
    }

    else if (v18 >= 0x100)
    {
      unsigned int v16 = 2;
    }

    else
    {
      unsigned int v16 = v18 > 1;
    }
  }

  else
  {
    unsigned int v16 = 1u;
  }

  if (v11 < a2)
  {
    int v17 = ~v11 + a2;
    if (v15 < 4)
    {
      if (*(_DWORD *)(v12 + 64)
         + ((*(_DWORD *)(v10 + 64) + (_DWORD)v14 + ((*(_DWORD *)(v8 + 64) + (_DWORD)v13) & ~(_DWORD)v13)) & ~(_DWORD)v14) != -1)
      {
        int v19 = v17 & ~(-1 << (8 * v15));
        bzero(a1, v15);
        if ((_DWORD)v15 == 3)
        {
          *(_WORD *)a1 = v19;
          a1[2] = BYTE2(v19);
        }

        else if ((_DWORD)v15 == 2)
        {
          *(_WORD *)a1 = v19;
        }

        else
        {
          *a1 = v19;
        }
      }
    }

    else
    {
      bzero( a1,  *(void *)(v12 + 64) + ((*(void *)(v10 + 64) + v14 + ((*(void *)(v8 + 64) + v13) & ~v13)) & ~v14) + 1);
      *(_DWORD *)a1 = v17;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X4 }

void type metadata completion function for Publishers.Throttle.Inner()
{
}

void type metadata accessor for Publishers.Throttle.Inner.State()
{
}

void type metadata completion function for Publishers.Throttle.Inner.State()
{
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.Throttle.Inner.State( uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v7 = *(void *)(v4 - 8);
  int v8 = *(_DWORD *)(v7 + 80);
  uint64_t v46 = AssociatedTypeWitness;
  uint64_t v47 = *(void *)(v6 + 64) + v8;
  uint64_t v48 = v7;
  uint64_t v9 = *(void *)(*(void *)(a3 + 32) - 8LL);
  int v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v10;
  uint64_t v50 = *(void *)(v7 + 64);
  uint64_t v51 = v9;
  unint64_t v49 = v50 + v10 + (v47 & ~(unint64_t)v8) + 1;
  uint64_t v45 = *(void *)(v9 + 64);
  unint64_t v12 = (v49 & ~(unint64_t)v10) + v45;
  uint64_t v52 = *(void *)(a3 + 32);
  uint64_t v14 = swift_getAssociatedTypeWitness();
  uint64_t v15 = *(void *)(v14 - 8);
  unsigned int v16 = *(_DWORD *)(v15 + 84);
  uint64_t v17 = *(_DWORD *)(v15 + 80);
  if (v16) {
    uint64_t v18 = *(void *)(v15 + 64);
  }
  else {
    uint64_t v18 = *(void *)(v15 + 64) + 1LL;
  }
  if (v16 >= 2) {
    size_t v19 = v18;
  }
  else {
    size_t v19 = v18 + 1;
  }
  unint64_t v13 = (v12 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  if (((v17 + v13 + 40) & ~v17) + v19 <= v12) {
    unint64_t v20 = (v49 & ~(unint64_t)v10) + v45;
  }
  else {
    unint64_t v20 = ((v17 + v13 + 40) & ~v17) + v19;
  }
  int v21 = v8 | v10 | *(_DWORD *)(v15 + 80) | *(_DWORD *)(v6 + 80);
  if ((v21 & 0x1000F8) == 0 && v20 + 1 <= 0x18)
  {
    unsigned int v22 = *((unsigned __int8 *)a2 + v20);
    if (v22 >= 2)
    {
      else {
        uint64_t v23 = 4LL;
      }
      __asm { BR              X12 }
    }

    int v25 = a1;
    unint64_t v26 = ~(unint64_t)v8;
    uint64_t v27 = ~v11;
    if (v22 != 1)
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v46);
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v48 + 16))( ((unint64_t)a1 + v47) & v26,  ((unint64_t)a2 + v47) & v26,  v4);
      *(_BYTE *)((((unint64_t)a1 + v47) & v26) + v50) = *(_BYTE *)((((unint64_t)a2 + v47) & v26) + v50);
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v51 + 16))( ((unint64_t)a1 + v49) & v27,  ((unint64_t)a2 + v49) & v27,  v52);
      *((_BYTE *)a1 + v20) = 0;
      return v25;
    }

    size_t v41 = v19;
    unint64_t v42 = v20;
    uint64_t v43 = v14;
    size_t __n = v18;
    uint64_t v28 = a1;
    unsigned int __dsta = *(_DWORD *)(v15 + 84);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(v28, a2, v46);
    unint64_t v29 = ((unint64_t)a2 + v47) & v26;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v48 + 16))( ((unint64_t)v25 + v47) & v26,  v29,  v4);
    *(_BYTE *)((((unint64_t)v25 + v47) & v26) + v50) = *(_BYTE *)(v29 + v50);
    unint64_t v30 = ((unint64_t)a2 + v49) & v27;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v51 + 16))( ((unint64_t)v25 + v49) & v27,  v30,  v52);
    unint64_t v31 = (v45 + 7 + (((unint64_t)v25 + v49) & v27)) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v32 = (v45 + 7 + v30) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v33 = *(void *)(v32 + 24);
    *(void *)(v31 + 24) = v33;
    *(void *)(v31 + 32) = *(void *)(v32 + 32);
    (**(void (***)(unint64_t, unint64_t))(v33 - 8))(v31, v32);
    uint64_t v34 = v32 + v17;
    uint64_t v35 = (void *)((v31 + v17 + 40) & ~v17);
    uint64_t v36 = (unsigned __int8 *)((v34 + 40) & ~v17);
    if (__dsta > 1)
    {
      unint64_t v37 = v42;
      if ((*(unsigned int (**)(uint64_t))(v15 + 48))((v34 + 40) & ~v17) >= 2)
      {
LABEL_36:
        memcpy(v35, v36, v41);
LABEL_37:
        *((_BYTE *)v25 + v37) = 1;
        return v25;
      }
    }

    else
    {
      unint64_t v37 = v42;
      if (v36[__n])
      {
        int v38 = (v36[__n] - 1) << (8 * __n);
        if ((_DWORD)__n)
        {
          else {
            int v39 = 4;
          }
          __asm { BR              X11 }
        }

        if (v38 != -1) {
          goto LABEL_36;
        }
      }
    }

    if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v15 + 48))(v36, 1LL, v43))
    {
      memcpy(v35, v36, __n);
    }

    else
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v15 + 16))(v35, v36, v43);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v35, 0LL, 1LL, v43);
    }

    if (__dsta <= 1) {
      *((_BYTE *)v35 + __n) = 0;
    }
    goto LABEL_37;
  }

  uint64_t v24 = *a2;
  *a1 = *a2;
  int v25 = (uint64_t *)(v24 + (((v21 & 0xF8 | 7u) + 16LL) & ~(unint64_t)(v21 & 0xF8 | 7u)));
  swift_retain();
  return v25;
}

uint64_t destroy for Publishers.Throttle.Inner.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v36 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(void *)(v4 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v37 = *(void *)(v36 + 64) + v7;
  uint64_t v38 = AssociatedTypeWitness;
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v39 = *(void *)(v6 + 64) + v10 + (v37 & ~v7) + 1;
  uint64_t v35 = *(void *)(v9 + 64);
  unint64_t v11 = (v39 & ~v10) + v35;
  uint64_t v12 = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v15 = *(unsigned int *)(v13 + 84);
  if ((_DWORD)v15) {
    uint64_t v16 = *(void *)(v13 + 64);
  }
  else {
    uint64_t v16 = *(void *)(v13 + 64) + 1LL;
  }
  else {
    uint64_t v17 = v16 + 1;
  }
  unint64_t v18 = v17 + ((v14 + ((v11 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 40) & ~v14);
  if (v18 <= v11) {
    unint64_t v18 = (v39 & ~v10) + v35;
  }
  unsigned int v19 = *(unsigned __int8 *)(a1 + v18);
  if (v19 >= 2)
  {
    else {
      uint64_t v20 = 4LL;
    }
    __asm { BR              X13 }
  }

  uint64_t v21 = ~v7;
  uint64_t v22 = ~v10;
  if (v19 != 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(a1, v38);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))((v37 + a1) & v21, v4);
    uint64_t v23 = (v39 + a1) & v22;
    uint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    uint64_t v25 = v8;
    return v24(v23, v25);
  }

  uint64_t v32 = v16;
  uint64_t v33 = *(void *)(v12 - 8);
  uint64_t v34 = v12;
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(a1, v38);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))((v37 + a1) & v21, v4);
  uint64_t v27 = (v39 + a1) & v22;
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v27, v8);
  unint64_t v28 = (v35 + v27 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t result = __swift_destroy_boxed_opaque_existential_1(v28);
  uint64_t v29 = (v28 + v14 + 40) & ~v14;
  if (v15 > 1)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v29, v15, v34);
  }

  else if (*(_BYTE *)(v29 + v32))
  {
    int v30 = (*(unsigned __int8 *)(v29 + v32) - 1) << (8 * v32);
    if ((_DWORD)v32)
    {
      else {
        int v31 = 4;
      }
      __asm { BR              X11 }
    }

    if (v30 != -1) {
      return result;
    }
  }

  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v29, 1LL, v34);
  if (!(_DWORD)result)
  {
    uint64_t v25 = v34;
    uint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t))(v33 + 8);
    uint64_t v23 = v29;
    return v24(v23, v25);
  }

  return result;
}

uint64_t initializeWithCopy for Publishers.Throttle.Inner.State(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v50 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v52 = AssociatedTypeWitness;
  uint64_t v7 = *(void *)(v5 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v53 = *(void *)(v50 + 64) + v8;
  uint64_t v9 = *(void *)(a3 + 32);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v55 = *(void *)(v7 + 64);
  uint64_t v56 = v10;
  uint64_t v54 = v55 + v11 + (v53 & ~v8) + 1;
  uint64_t v49 = *(void *)(v10 + 64);
  unint64_t v12 = (v54 & ~v11) + v49;
  uint64_t v14 = swift_getAssociatedTypeWitness();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned __int8 *)(v15 + 80);
  unsigned int v17 = *(_DWORD *)(v15 + 84);
  if (v17) {
    uint64_t v18 = *(void *)(v15 + 64);
  }
  else {
    uint64_t v18 = *(void *)(v15 + 64) + 1LL;
  }
  if (v17 >= 2) {
    size_t v19 = v18;
  }
  else {
    size_t v19 = v18 + 1;
  }
  unint64_t v13 = (v12 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  if (((v16 + v13 + 40) & ~v16) + v19 <= v12) {
    unint64_t v20 = (v54 & ~v11) + v49;
  }
  else {
    unint64_t v20 = ((v16 + v13 + 40) & ~v16) + v19;
  }
  unsigned int v21 = *(unsigned __int8 *)(a2 + v20);
  if (v21 >= 2)
  {
    else {
      uint64_t v22 = 4LL;
    }
    __asm { BR              X12 }
  }

  uint64_t v23 = ~v8;
  uint64_t v24 = ~v11;
  if (v21 == 1)
  {
    size_t __n = v19;
    uint64_t v45 = v18;
    unint64_t v46 = v20;
    uint64_t v47 = v9;
    uint64_t v48 = v14;
    uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16);
    uint64_t v28 = a1;
    unsigned int v51 = *(_DWORD *)(v15 + 84);
    uint64_t v30 = a2;
    v29(a1, a2, v52);
    uint64_t v31 = (v53 + a1) & v23;
    uint64_t v32 = (v53 + a2) & v23;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v31, v32, v5);
    *(_BYTE *)(v31 + v55) = *(_BYTE *)(v32 + v55);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 16))((v54 + a1) & v24, (v54 + v30) & v24, v47);
    unint64_t v33 = (v49 + 7 + ((v54 + a1) & v24)) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v34 = (v49 + 7 + ((v54 + v30) & v24)) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v35 = *(void *)(v34 + 24);
    *(void *)(v33 + 24) = v35;
    *(void *)(v33 + 32) = *(void *)(v34 + 32);
    (**(void (***)(unint64_t, unint64_t))(v35 - 8))(v33, v34);
    uint64_t v36 = v34 + v16;
    uint64_t v37 = (void *)((v33 + v16 + 40) & ~v16);
    uint64_t v38 = (unsigned __int8 *)((v36 + 40) & ~v16);
    if (v51 > 1)
    {
      size_t v39 = v45;
      if ((*(unsigned int (**)(uint64_t))(v15 + 48))((v36 + 40) & ~v16) >= 2)
      {
LABEL_33:
        memcpy(v37, v38, __n);
        unint64_t v42 = v46;
LABEL_34:
        *(_BYTE *)(a1 + v42) = 1;
        return v28;
      }
    }

    else
    {
      size_t v39 = v45;
      if (v38[v45])
      {
        int v40 = (v38[v45] - 1) << (8 * v45);
        if ((_DWORD)v45)
        {
          else {
            int v41 = 4;
          }
          __asm { BR              X11 }
        }

        if (v40 != -1) {
          goto LABEL_33;
        }
      }
    }

    if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v15 + 48))(v38, 1LL, v48))
    {
      memcpy(v37, v38, v39);
    }

    else
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v15 + 16))(v37, v38, v48);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v37, 0LL, 1LL, v48);
    }

    unint64_t v42 = v46;
    if (v51 <= 1) {
      *((_BYTE *)v37 + v39) = 0;
    }
    goto LABEL_34;
  }

  unint64_t v25 = v20;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16))(a1, a2, v52);
  unint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v27 = v9;
  uint64_t v28 = a1;
  v26((v53 + a1) & v23, (v53 + a2) & v23, v5);
  *(_BYTE *)(((v53 + a1) & v23) + v55) = *(_BYTE *)(((v53 + a2) & v23) + v55);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 16))((v54 + a1) & v24, (v54 + a2) & v24, v27);
  *(_BYTE *)(a1 + v25) = 0;
  return v28;
}

uint64_t assignWithCopy for Publishers.Throttle.Inner.State(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v52 = *(void *)(AssociatedTypeWitness - 8);
    uint64_t v53 = AssociatedTypeWitness;
    uint64_t v8 = *(void *)(v6 - 8);
    uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
    uint64_t v54 = *(void *)(v52 + 64) + v9;
    uint64_t v10 = *(void *)(*(void *)(a3 + 32) - 8LL);
    uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
    uint64_t v47 = *(void *)(v8 + 64);
    uint64_t v55 = v47 + v11 + (v54 & ~v9) + 1;
    uint64_t v46 = *(void *)(v10 + 64);
    unint64_t v12 = (v55 & ~v11) + v46;
    uint64_t v56 = *(void *)(a3 + 32);
    uint64_t v13 = swift_getAssociatedTypeWitness();
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
    unsigned int v16 = *(_DWORD *)(v14 + 84);
    uint64_t v49 = v14;
    uint64_t v50 = v13;
    size_t v17 = *(void *)(v14 + 64);
    if (v16) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v17 + 1;
    }
    unsigned int v48 = v16;
    if (v16 >= 2) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v18 + 1;
    }
    if (((v15 + ((v12 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 40) & ~v15) + v19 > v12) {
      unint64_t v12 = ((v15 + ((v12 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 40) & ~v15) + v19;
    }
    unsigned int v20 = *(unsigned __int8 *)(a1 + v12);
    if (v20 >= 2)
    {
      else {
        uint64_t v21 = 4LL;
      }
      __asm { BR              X12 }
    }

    uint64_t v22 = ~v9;
    uint64_t v51 = ~v11;
    size_t __n = v19;
    uint64_t v45 = ~v15;
    if (v20 != 1)
    {
      (*(void (**)(uint64_t, uint64_t))(v52 + 8))(a1, v53);
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))((v54 + a1) & v22, v6);
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))((v55 + a1) & v51, v56);
      goto LABEL_31;
    }

    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(a1, v53);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))((v54 + a1) & v22, v6);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))((v55 + a1) & v51, v56);
    unint64_t v23 = (v46 + ((v55 + a1) & v51) + 7) & 0xFFFFFFFFFFFFFFF8LL;
    __swift_destroy_boxed_opaque_existential_1(v23);
    uint64_t v24 = (v23 + v15 + 40) & v45;
    if (v48 > 1)
    {
    }

    else if (*(_BYTE *)(v24 + v18))
    {
      int v25 = (*(unsigned __int8 *)(v24 + v18) - 1) << (8 * v18);
      if ((_DWORD)v18)
      {
        else {
          int v26 = 4;
        }
        __asm { BR              X11 }
      }

      if (v25 != -1)
      {
LABEL_31:
        unsigned int v27 = *(unsigned __int8 *)(a2 + v12);
        if (v27 >= 2)
        {
          else {
            uint64_t v28 = 4LL;
          }
          __asm { BR              X12 }
        }

        if (v27 != 1)
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 16))(a1, a2, v53);
          uint64_t v29 = (v54 + a1) & v22;
          uint64_t v30 = (v54 + a2) & v22;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v29, v30, v6);
          *(_BYTE *)(v29 + v47) = *(_BYTE *)(v30 + v47);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))((v55 + a1) & v51, (v55 + a2) & v51, v56);
          *(_BYTE *)(a1 + v12) = 0;
          return a1;
        }

        (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 16))(a1, a2, v53);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))((v54 + a1) & v22, (v54 + a2) & v22, v6);
        *(_BYTE *)(((v54 + a1) & v22) + v47) = *(_BYTE *)(((v54 + a2) & v22) + v47);
        uint64_t v31 = (v55 + a2) & v51;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))((v55 + a1) & v51, v31, v56);
        unint64_t v32 = (v46 + 7 + ((v55 + a1) & v51)) & 0xFFFFFFFFFFFFFFF8LL;
        unint64_t v33 = (v46 + 7 + v31) & 0xFFFFFFFFFFFFFFF8LL;
        uint64_t v34 = *(void *)(v33 + 24);
        *(void *)(v32 + 24) = v34;
        *(void *)(v32 + 32) = *(void *)(v33 + 32);
        (**(void (***)(unint64_t, unint64_t))(v34 - 8))(v32, v33);
        uint64_t v35 = v33 + v15;
        uint64_t v36 = (void *)((v32 + v15 + 40) & v45);
        uint64_t v37 = (unsigned __int8 *)((v35 + 40) & v45);
        if (v48 > 1)
        {
          uint64_t v40 = v49;
          uint64_t v39 = v50;
          size_t v38 = v18;
          if ((*(unsigned int (**)(uint64_t, void, uint64_t))(v49 + 48))((v35 + 40) & v45, v48, v50) >= 2)
          {
LABEL_54:
            memcpy(v36, v37, __n);
            goto LABEL_55;
          }
        }

        else
        {
          size_t v38 = v18;
          uint64_t v40 = v49;
          uint64_t v39 = v50;
          if (v37[v18])
          {
            int v41 = (v37[v18] - 1) << (8 * v18);
            if ((_DWORD)v18)
            {
              else {
                int v42 = 4;
              }
              __asm { BR              X11 }
            }

            if (v41 != -1) {
              goto LABEL_54;
            }
          }
        }

        if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v40 + 48))(v37, 1LL, v39))
        {
          memcpy(v36, v37, v38);
          if (v48 > 1) {
            goto LABEL_55;
          }
        }

        else
        {
          (*(void (**)(void *, unsigned __int8 *, uint64_t))(v40 + 16))(v36, v37, v39);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v36, 0LL, 1LL, v39);
          if (v48 > 1)
          {
LABEL_55:
            *(_BYTE *)(a1 + v12) = 1;
            return a1;
          }
        }

        *((_BYTE *)v36 + v38) = 0;
        goto LABEL_55;
      }
    }

    goto LABEL_31;
  }

  return a1;
}

uint64_t initializeWithTake for Publishers.Throttle.Inner.State(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v50 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v52 = AssociatedTypeWitness;
  uint64_t v7 = *(void *)(v5 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v53 = *(void *)(v50 + 64) + v8;
  uint64_t v9 = *(void *)(a3 + 32);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v55 = *(void *)(v7 + 64);
  uint64_t v56 = v10;
  uint64_t v54 = v55 + v11 + (v53 & ~v8) + 1;
  uint64_t v49 = *(void *)(v10 + 64);
  unint64_t v12 = (v54 & ~v11) + v49;
  uint64_t v14 = swift_getAssociatedTypeWitness();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned __int8 *)(v15 + 80);
  unsigned int v17 = *(_DWORD *)(v15 + 84);
  if (v17) {
    uint64_t v18 = *(void *)(v15 + 64);
  }
  else {
    uint64_t v18 = *(void *)(v15 + 64) + 1LL;
  }
  if (v17 >= 2) {
    size_t v19 = v18;
  }
  else {
    size_t v19 = v18 + 1;
  }
  unint64_t v13 = (v12 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  if (((v16 + v13 + 40) & ~v16) + v19 <= v12) {
    unint64_t v20 = (v54 & ~v11) + v49;
  }
  else {
    unint64_t v20 = ((v16 + v13 + 40) & ~v16) + v19;
  }
  unsigned int v21 = *(unsigned __int8 *)(a2 + v20);
  if (v21 >= 2)
  {
    else {
      uint64_t v22 = 4LL;
    }
    __asm { BR              X12 }
  }

  uint64_t v23 = ~v8;
  uint64_t v24 = ~v11;
  if (v21 == 1)
  {
    size_t __n = v19;
    uint64_t v45 = v18;
    unint64_t v46 = v20;
    uint64_t v47 = v9;
    uint64_t v48 = v14;
    uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 32);
    uint64_t v28 = a1;
    unsigned int v51 = *(_DWORD *)(v15 + 84);
    uint64_t v30 = a2;
    v29(a1, a2, v52);
    uint64_t v31 = (v53 + a1) & v23;
    uint64_t v32 = (v53 + a2) & v23;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v31, v32, v5);
    *(_BYTE *)(v31 + v55) = *(_BYTE *)(v32 + v55);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 32))((v54 + a1) & v24, (v54 + v30) & v24, v47);
    unint64_t v33 = (v49 + 7 + ((v54 + a1) & v24)) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v34 = (v49 + 7 + ((v54 + v30) & v24)) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v35 = *(void *)(v34 + 32);
    __int128 v36 = *(_OWORD *)(v34 + 16);
    *(_OWORD *)unint64_t v33 = *(_OWORD *)v34;
    *(_OWORD *)(v33 + 16) = v36;
    *(void *)(v33 + 32) = v35;
    uint64_t v37 = (void *)((v33 + v16 + 40) & ~v16);
    size_t v38 = (unsigned __int8 *)((v34 + v16 + 40) & ~v16);
    if (v51 > 1)
    {
      size_t v39 = v45;
      if ((*(unsigned int (**)(unsigned __int8 *))(v15 + 48))(v38) >= 2)
      {
LABEL_33:
        memcpy(v37, v38, __n);
        unint64_t v42 = v46;
LABEL_34:
        *(_BYTE *)(a1 + v42) = 1;
        return v28;
      }
    }

    else
    {
      size_t v39 = v45;
      if (v38[v45])
      {
        int v40 = (v38[v45] - 1) << (8 * v45);
        if ((_DWORD)v45)
        {
          else {
            int v41 = 4;
          }
          __asm { BR              X11 }
        }

        if (v40 != -1) {
          goto LABEL_33;
        }
      }
    }

    if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v15 + 48))(v38, 1LL, v48))
    {
      memcpy(v37, v38, v39);
    }

    else
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v15 + 32))(v37, v38, v48);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v37, 0LL, 1LL, v48);
    }

    unint64_t v42 = v46;
    if (v51 <= 1) {
      *((_BYTE *)v37 + v39) = 0;
    }
    goto LABEL_34;
  }

  unint64_t v25 = v20;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 32))(a1, a2, v52);
  int v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  uint64_t v27 = v9;
  uint64_t v28 = a1;
  v26((v53 + a1) & v23, (v53 + a2) & v23, v5);
  *(_BYTE *)(((v53 + a1) & v23) + v55) = *(_BYTE *)(((v53 + a2) & v23) + v55);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 32))((v54 + a1) & v24, (v54 + a2) & v24, v27);
  *(_BYTE *)(a1 + v25) = 0;
  return v28;
}

uint64_t assignWithTake for Publishers.Throttle.Inner.State(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = *(void *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v52 = *(void *)(AssociatedTypeWitness - 8);
    uint64_t v53 = AssociatedTypeWitness;
    uint64_t v8 = *(void *)(v6 - 8);
    uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
    uint64_t v54 = *(void *)(v52 + 64) + v9;
    uint64_t v10 = *(void *)(*(void *)(a3 + 32) - 8LL);
    uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
    uint64_t v47 = *(void *)(v8 + 64);
    uint64_t v55 = v47 + v11 + (v54 & ~v9) + 1;
    uint64_t v46 = *(void *)(v10 + 64);
    unint64_t v12 = (v55 & ~v11) + v46;
    uint64_t v56 = *(void *)(a3 + 32);
    uint64_t v13 = swift_getAssociatedTypeWitness();
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
    unsigned int v16 = *(_DWORD *)(v14 + 84);
    uint64_t v49 = v14;
    uint64_t v50 = v13;
    size_t v17 = *(void *)(v14 + 64);
    if (v16) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v17 + 1;
    }
    unsigned int v48 = v16;
    if (v16 >= 2) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v18 + 1;
    }
    if (((v15 + ((v12 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 40) & ~v15) + v19 > v12) {
      unint64_t v12 = ((v15 + ((v12 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 40) & ~v15) + v19;
    }
    unsigned int v20 = *(unsigned __int8 *)(a1 + v12);
    if (v20 >= 2)
    {
      else {
        uint64_t v21 = 4LL;
      }
      __asm { BR              X12 }
    }

    uint64_t v22 = ~v9;
    uint64_t v51 = ~v11;
    size_t __n = v19;
    uint64_t v45 = ~v15;
    if (v20 != 1)
    {
      (*(void (**)(uint64_t, uint64_t))(v52 + 8))(a1, v53);
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))((v54 + a1) & v22, v6);
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))((v55 + a1) & v51, v56);
      goto LABEL_31;
    }

    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(a1, v53);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))((v54 + a1) & v22, v6);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))((v55 + a1) & v51, v56);
    unint64_t v23 = (v46 + ((v55 + a1) & v51) + 7) & 0xFFFFFFFFFFFFFFF8LL;
    __swift_destroy_boxed_opaque_existential_1(v23);
    uint64_t v24 = (v23 + v15 + 40) & v45;
    if (v48 > 1)
    {
    }

    else if (*(_BYTE *)(v24 + v18))
    {
      int v25 = (*(unsigned __int8 *)(v24 + v18) - 1) << (8 * v18);
      if ((_DWORD)v18)
      {
        else {
          int v26 = 4;
        }
        __asm { BR              X11 }
      }

      if (v25 != -1)
      {
LABEL_31:
        unsigned int v27 = *(unsigned __int8 *)(a2 + v12);
        if (v27 >= 2)
        {
          else {
            uint64_t v28 = 4LL;
          }
          __asm { BR              X12 }
        }

        if (v27 != 1)
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 32))(a1, a2, v53);
          uint64_t v29 = (v54 + a1) & v22;
          uint64_t v30 = (v54 + a2) & v22;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v29, v30, v6);
          *(_BYTE *)(v29 + v47) = *(_BYTE *)(v30 + v47);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))((v55 + a1) & v51, (v55 + a2) & v51, v56);
          *(_BYTE *)(a1 + v12) = 0;
          return a1;
        }

        (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 32))(a1, a2, v53);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))((v54 + a1) & v22, (v54 + a2) & v22, v6);
        *(_BYTE *)(((v54 + a1) & v22) + v47) = *(_BYTE *)(((v54 + a2) & v22) + v47);
        uint64_t v31 = (v55 + a2) & v51;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))((v55 + a1) & v51, v31, v56);
        unint64_t v32 = (v46 + 7 + ((v55 + a1) & v51)) & 0xFFFFFFFFFFFFFFF8LL;
        unint64_t v33 = (v46 + 7 + v31) & 0xFFFFFFFFFFFFFFF8LL;
        uint64_t v34 = *(void *)(v33 + 32);
        __int128 v35 = *(_OWORD *)(v33 + 16);
        *(_OWORD *)unint64_t v32 = *(_OWORD *)v33;
        *(_OWORD *)(v32 + 16) = v35;
        *(void *)(v32 + 32) = v34;
        __int128 v36 = (void *)((v32 + v15 + 40) & v45);
        uint64_t v37 = (unsigned __int8 *)((v33 + v15 + 40) & v45);
        if (v48 > 1)
        {
          uint64_t v40 = v49;
          uint64_t v39 = v50;
          size_t v38 = v18;
          if ((*(unsigned int (**)(unsigned __int8 *, void, uint64_t))(v49 + 48))(v37, v48, v50) >= 2)
          {
LABEL_54:
            memcpy(v36, v37, __n);
            goto LABEL_55;
          }
        }

        else
        {
          size_t v38 = v18;
          uint64_t v40 = v49;
          uint64_t v39 = v50;
          if (v37[v18])
          {
            int v41 = (v37[v18] - 1) << (8 * v18);
            if ((_DWORD)v18)
            {
              else {
                int v42 = 4;
              }
              __asm { BR              X11 }
            }

            if (v41 != -1) {
              goto LABEL_54;
            }
          }
        }

        if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v40 + 48))(v37, 1LL, v39))
        {
          memcpy(v36, v37, v38);
          if (v48 > 1) {
            goto LABEL_55;
          }
        }

        else
        {
          (*(void (**)(void *, unsigned __int8 *, uint64_t))(v40 + 32))(v36, v37, v39);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v36, 0LL, 1LL, v39);
          if (v48 > 1)
          {
LABEL_55:
            *(_BYTE *)(a1 + v12) = 1;
            return a1;
          }
        }

        *((_BYTE *)v36 + v38) = 0;
        goto LABEL_55;
      }
    }

    goto LABEL_31;
  }

  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.Throttle.Inner.State(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(a3 + 32);
  unint64_t v9 = ((*(void *)(*(void *)(v6 - 8) + 64LL)
       + *(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL)
       + ((*(void *)(*(void *)(AssociatedTypeWitness - 8) + 64LL) + *(unsigned __int8 *)(*(void *)(v6 - 8) + 80LL)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80LL))
  uint64_t v10 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v11 = (((v9 + 7) & 0xFFFFFFFFFFFFFFF8LL) + *(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unsigned int v12 = *(_DWORD *)(v10 + 84);
  uint64_t v13 = *(void *)(v10 + 64);
  if (!v12) {
    ++v13;
  }
  if (v12 < 2) {
    ++v13;
  }
  unint64_t v14 = v13 + v11;
  if (v14 <= v9) {
    unint64_t v15 = v9;
  }
  else {
    unint64_t v15 = v14;
  }
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFE) {
    goto LABEL_26;
  }
  unint64_t v16 = v15 + 1;
  char v17 = 8 * (v15 + 1);
  if ((v15 + 1) <= 3)
  {
    unsigned int v20 = ((a2 + ~(-1 << v17) - 253) >> v17) + 1;
    if (HIWORD(v20))
    {
      int v18 = *(_DWORD *)(a1 + v16);
      if (!v18) {
        goto LABEL_26;
      }
      goto LABEL_19;
    }

    if (v20 > 0xFF)
    {
      int v18 = *(unsigned __int16 *)(a1 + v16);
      if (!*(_WORD *)(a1 + v16)) {
        goto LABEL_26;
      }
      goto LABEL_19;
    }

    if (v20 < 2)
    {
LABEL_26:
      unsigned int v22 = *(unsigned __int8 *)(a1 + v15);
      if (v22 >= 3) {
        return (v22 ^ 0xFF) + 1;
      }
      else {
        return 0LL;
      }
    }
  }

  int v18 = *(unsigned __int8 *)(a1 + v16);
  if (!*(_BYTE *)(a1 + v16)) {
    goto LABEL_26;
  }
LABEL_19:
  int v21 = (v18 - 1) << v17;
  if ((_DWORD)v16)
  {
    __asm { BR              X11 }
  }

  return (v21 + 254);
}

void storeEnumTagSinglePayload for Publishers.Throttle.Inner.State( _BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(a4 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(a4 + 32);
  unint64_t v11 = ((*(void *)(*(void *)(v8 - 8) + 64LL)
        + *(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL)
        + ((*(void *)(*(void *)(AssociatedTypeWitness - 8) + 64LL) + *(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL))
  uint64_t v12 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v13 = (((v11 + 7) & 0xFFFFFFFFFFFFFFF8LL) + *(unsigned __int8 *)(v12 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unsigned int v14 = *(_DWORD *)(v12 + 84);
  uint64_t v15 = *(void *)(v12 + 64);
  if (!v14) {
    ++v15;
  }
  if (v14 < 2) {
    ++v15;
  }
  unint64_t v16 = v15 + v13;
  if (v16 <= v11) {
    unint64_t v16 = v11;
  }
  size_t v17 = v16 + 1;
  if (a3 < 0xFE)
  {
    unsigned int v18 = 0u;
  }

  else if (v17 <= 3)
  {
    unsigned int v20 = ((a3 + ~(-1 << (8 * v17)) - 253) >> (8 * v17)) + 1;
    if (HIWORD(v20))
    {
      unsigned int v18 = 4u;
    }

    else if (v20 >= 0x100)
    {
      unsigned int v18 = 2;
    }

    else
    {
      unsigned int v18 = v20 > 1;
    }
  }

  else
  {
    unsigned int v18 = 1u;
  }

  if (a2 <= 0xFD) {
    __asm { BR              X11 }
  }

  unsigned int v19 = a2 - 254;
  if (v17 < 4)
  {
    if ((_DWORD)v16 != -1)
    {
      int v21 = v19 & ~(-1 << (8 * v17));
      bzero(a1, v17);
      if ((_DWORD)v17 == 3)
      {
        *(_WORD *)a1 = v21;
        a1[2] = BYTE2(v21);
      }

      else if ((_DWORD)v17 == 2)
      {
        *(_WORD *)a1 = v21;
      }

      else
      {
        *a1 = v21;
      }
    }
  }

  else
  {
    bzero(a1, v16 + 1);
    *(_DWORD *)a1 = v19;
  }

  __asm { BR              X10 }

uint64_t getEnumTag for Publishers.Throttle.Inner.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(a2 + 32);
  unint64_t v7 = ((*(void *)(*(void *)(v4 - 8) + 64LL)
       + *(unsigned __int8 *)(*(void *)(v6 - 8) + 80LL)
       + ((*(void *)(*(void *)(AssociatedTypeWitness - 8) + 64LL) + *(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL))
  uint64_t v8 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v9 = (((v7 + 7) & 0xFFFFFFFFFFFFFFF8LL) + *(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unsigned int v10 = *(_DWORD *)(v8 + 84);
  uint64_t v11 = *(void *)(v8 + 64);
  if (!v10) {
    ++v11;
  }
  if (v10 < 2) {
    ++v11;
  }
  unint64_t v12 = v11 + v9;
  if (v12 <= v7) {
    unint64_t v12 = v7;
  }
  uint64_t result = *(unsigned __int8 *)(a1 + v12);
  if (result >= 2)
  {
    else {
      uint64_t v14 = 4LL;
    }
    __asm { BR              X12 }
  }

  return result;
}

uint64_t destructiveInjectEnumTag for Publishers.Throttle.Inner.State(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(a3 + 32);
  unint64_t v9 = ((*(void *)(*(void *)(v6 - 8) + 64LL)
       + *(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL)
       + ((*(void *)(*(void *)(AssociatedTypeWitness - 8) + 64LL) + *(unsigned __int8 *)(*(void *)(v6 - 8) + 80LL)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80LL))
  uint64_t result = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(result - 8);
  unint64_t v12 = (((v9 + 7) & 0xFFFFFFFFFFFFFFF8LL) + *(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unsigned int v13 = *(_DWORD *)(v11 + 84);
  uint64_t v14 = *(void *)(v11 + 64);
  if (!v13) {
    ++v14;
  }
  if (v13 < 2) {
    ++v14;
  }
  size_t v15 = v14 + v12;
  if (v15 <= v9) {
    size_t v16 = v9;
  }
  else {
    size_t v16 = v15;
  }
  if (a2 > 1)
  {
    else {
      char v17 = 2;
    }
    a1[v16] = v17;
    else {
      int v18 = v16;
    }
    bzero(a1, v16);
    __asm { BR              X10 }
  }

  a1[v16] = a2;
  return result;
}

void type metadata accessor for Publishers.Throttle.Inner.Scheduling()
{
}

uint64_t type metadata completion function for Publishers.Throttle.Inner.Scheduling()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0LL;
    }
  }

  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.Throttle.Inner.Scheduling( uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80);
  uint64_t v10 = *(void *)(v7 + 64) + v9;
  uint64_t v11 = *(void *)(v8 + 64);
  uint64_t v12 = (*(_BYTE *)(v7 + 80) | *(_BYTE *)(v8 + 80));
  if (v12 > 7
    || ((*(_DWORD *)(v7 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0
    || v11 + (v10 & (unint64_t)~v9) + 1 > 0x18)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v12 + 16) & ~v12));
    swift_retain();
  }

  else
  {
    uint64_t v16 = ~v9;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, AssociatedTypeWitness);
    unint64_t v17 = ((unint64_t)a2 + v10) & v16;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))( ((unint64_t)a1 + v10) & v16,  v17,  v5);
    *(_BYTE *)((((unint64_t)a1 + v10) & v16) + v11) = *(_BYTE *)(v17 + v11);
  }

  return a1;
}

uint64_t destroy for Publishers.Throttle.Inner.Scheduling(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
  return (*(uint64_t (**)(unint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))( (*(void *)(v5 + 64) + a1 + *(unsigned __int8 *)(*(void *)(v3 - 8) + 80LL)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80LL),  v3);
}

uint64_t initializeWithCopy for Publishers.Throttle.Inner.Scheduling(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a1, a2, AssociatedTypeWitness);
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v7 + 64) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v11, v12, v5);
  *(_BYTE *)(v11 + *(void *)(v8 + 64)) = *(_BYTE *)(v12 + *(void *)(v8 + 64));
  return a1;
}

uint64_t assignWithCopy for Publishers.Throttle.Inner.Scheduling(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(a1, a2, AssociatedTypeWitness);
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v7 + 64) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v11, v12, v5);
  *(_BYTE *)(v11 + *(void *)(v8 + 64)) = *(_BYTE *)(v12 + *(void *)(v8 + 64));
  return a1;
}

uint64_t initializeWithTake for Publishers.Throttle.Inner.Scheduling(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(a1, a2, AssociatedTypeWitness);
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v7 + 64) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v11, v12, v5);
  *(_BYTE *)(v11 + *(void *)(v8 + 64)) = *(_BYTE *)(v12 + *(void *)(v8 + 64));
  return a1;
}

uint64_t assignWithTake for Publishers.Throttle.Inner.Scheduling(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(a1, a2, AssociatedTypeWitness);
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v7 + 64) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40))(v11, v12, v5);
  *(_BYTE *)(v11 + *(void *)(v8 + 64)) = *(_BYTE *)(v12 + *(void *)(v8 + 64));
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.Throttle.Inner.Scheduling( uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  uint64_t v9 = *(void *)(v5 - 8);
  uint64_t v10 = *(unsigned int *)(v9 + 84);
  else {
    unsigned int v11 = *(_DWORD *)(v9 + 84);
  }
  if (v11 <= 0xFE) {
    unsigned int v11 = 254;
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v12 = AssociatedTypeWitness;
  uint64_t v13 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v14 = *(void *)(v7 + 64) + v13;
  uint64_t v15 = *(void *)(v9 + 64);
  if (a2 <= v11) {
    goto LABEL_25;
  }
  uint64_t v16 = v15 + (v14 & ~v13) + 1;
  char v17 = 8 * v16;
  unsigned int v19 = ((a2 - v11 + ~(-1 << v17)) >> v17) + 1;
  if (HIWORD(v19))
  {
    int v18 = *(_DWORD *)(a1 + v16);
    if (v18) {
      goto LABEL_16;
    }
  }

  else
  {
    if (v19 <= 0xFF)
    {
      if (v19 < 2) {
        goto LABEL_25;
      }
LABEL_9:
      int v18 = *(unsigned __int8 *)(a1 + v16);
      if (!*(_BYTE *)(a1 + v16)) {
        goto LABEL_25;
      }
LABEL_16:
      int v20 = (v18 - 1) << v17;
      if ((_DWORD)v15 + (v14 & ~(_DWORD)v13) != -1)
      {
        else {
          int v21 = 4;
        }
        __asm { BR              X12 }
      }

      int v26 = v11 + v20;
      return (v26 + 1);
    }

    int v18 = *(unsigned __int16 *)(a1 + v16);
    if (*(_WORD *)(a1 + v16)) {
      goto LABEL_16;
    }
  }

void storeEnumTagSinglePayload for Publishers.Throttle.Inner.Scheduling( _BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v8 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v9 = *(void *)(v7 - 8);
  if (*(_DWORD *)(v9 + 84) <= *(_DWORD *)(v8 + 84)) {
    unsigned int v10 = *(_DWORD *)(v8 + 84);
  }
  else {
    unsigned int v10 = *(_DWORD *)(v9 + 84);
  }
  if (v10 <= 0xFE) {
    unsigned int v11 = 254;
  }
  else {
    unsigned int v11 = v10;
  }
  uint64_t v12 = *(unsigned __int8 *)(v9 + 80);
  size_t v13 = *(void *)(v9 + 64) + ((*(void *)(v8 + 64) + v12) & ~v12) + 1;
  if (a3 <= v11)
  {
    unsigned int v14 = 0u;
  }

  else if (v13 <= 3)
  {
    unsigned int v16 = ((a3 - v11 + ~(-1 << (8 * v13))) >> (8 * v13)) + 1;
    if (HIWORD(v16))
    {
      unsigned int v14 = 4u;
    }

    else if (v16 >= 0x100)
    {
      unsigned int v14 = 2;
    }

    else
    {
      unsigned int v14 = v16 > 1;
    }
  }

  else
  {
    unsigned int v14 = 1u;
  }

  if (v11 < a2)
  {
    int v15 = ~v11 + a2;
    if (v13 < 4)
    {
      if (*(_DWORD *)(v9 + 64) + ((*(_DWORD *)(v8 + 64) + (_DWORD)v12) & ~(_DWORD)v12) != -1)
      {
        int v17 = v15 & ~(-1 << (8 * v13));
        bzero(a1, v13);
        if ((_DWORD)v13 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }

        else if ((_DWORD)v13 == 2)
        {
          *(_WORD *)a1 = v17;
        }

        else
        {
          *a1 = v17;
        }
      }
    }

    else
    {
      bzero(a1, *(void *)(v9 + 64) + ((*(void *)(v8 + 64) + v12) & ~v12) + 1);
      *(_DWORD *)a1 = v15;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X17 }

uint64_t associated type witness table accessor for Subscriber.Failure : Error in Publishers.Throttle<A, B>.Inner<A1>()
{
  return swift_getAssociatedConformanceWitness();
}

void Publisher.share()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

  ;
}

uint64_t type metadata accessor for Publishers.Share(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Share);
}

void Publishers.Share.__allocating_init(upstream:)(uint64_t a1)
{
}

uint64_t sub_183B6A07C(uint64_t a1)
{
  return a1;
}

uint64_t Publishers.Share.upstream.getter@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v1 + 80LL) - 8LL) + 16LL))( a1,  v1 + *(void *)(*(void *)v1 + 104LL));
}

void Publishers.Share.init(upstream:)(uint64_t a1)
{
}

uint64_t sub_183B6A0E4(uint64_t a1)
{
  return a1;
}

void Publishers.Share.receive<A>(subscriber:)()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v1 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v3 = type metadata accessor for PassthroughSubject(255LL, AssociatedTypeWitness, v1, AssociatedConformanceWitness);
  MEMORY[0x186E22960](&protocol conformance descriptor for PassthroughSubject<A, B>, v3);
  type metadata accessor for Publishers.Multicast();
}

uint64_t sub_183B6A1E8(uint64_t a1)
{
  uint64_t v5 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.Multicast<A, B>, a1);
  uint64_t v7 = type metadata accessor for Publishers.Autoconnect(0LL, a1, v5, v6);
  uint64_t v8 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.Autoconnect<A>, v7);
  return Publisher.subscribe<A>(_:)(v3, v7, v2, v8, v1);
}

BOOL static Publishers.Share.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t *Publishers.Share.deinit()
{
  uint64_t v1 = *v0;
  swift_release();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8LL) + 8LL))((uint64_t)v0 + *(void *)(*v0 + 104));
  return v0;
}

uint64_t Publishers.Share.__deallocating_deinit()
{
  uint64_t v1 = *v0;
  swift_release();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8LL) + 8LL))((uint64_t)v0 + *(void *)(*v0 + 104));
  return swift_deallocClassInstance();
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Share<A>()
{
}

  ;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance Publishers.Share<A>( uint64_t *a1, uint64_t *a2)
{
  return static Publishers.Share.== infix(_:_:)(*a1, *a2);
}

void specialized Publishers.Share.init(upstream:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *(void **)v1;
  uint64_t v4 = v3[10];
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(&v2[v3[13]], a1, v4);
  uint64_t v5 = v3[11];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v9 = type metadata accessor for PassthroughSubject(0LL, AssociatedTypeWitness, v7, AssociatedConformanceWitness);
  uint64_t v10 = PassthroughSubject.__allocating_init()();
  uint64_t v11 = MEMORY[0x186E22960](&protocol conformance descriptor for PassthroughSubject<A, B>, v9);
  Publisher.multicast<A>(subject:)(v10, v4, v9, v5, v11);
}

void sub_183B6A43C()
{
}

uint64_t sub_183B6A458(uint64_t a1)
{
  uint64_t v3 = ConnectablePublisher.autoconnect()(a1);
  swift_release();
  swift_release();
  *(void *)(v1 + 16) = v3;
  return v1;
}

void specialized Publishers.Share.__allocating_init(upstream:)(uint64_t a1)
{
}

  ;
}

uint64_t type metadata completion function for Publishers.Share()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t method lookup function for Publishers.Share()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Publishers.Share.__allocating_init(upstream:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed A.Publisher.Output, @in_guaranteed A.Publisher.Output) -> (@unowned Bool)@<X0>( uint64_t (*a1)(void)@<X2>, _BYTE *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result & 1;
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed A.Publisher.Output, @in_guaranteed A.Publisher.Output) -> (@unowned Bool, @error @owned Error)@<X0>( uint64_t (*a1)(void)@<X2>, _BYTE *a2@<X8>)
{
  uint64_t result = a1();
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t Publisher<>.min()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = *(void *)(a1 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v4, a1);
  uint64_t v12 = (uint64_t (*)())swift_allocObject();
  *((void *)v12 + 2) = a1;
  *((void *)v12 + 3) = a2;
  *((void *)v12 + 4) = a3;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a4, v11, a1);
  uint64_t result = type metadata accessor for Publishers.Comparison(0LL, a1, a2, v13);
  int v15 = (uint64_t (**)())(a4 + *(int *)(result + 36));
  *int v15 = partial apply for closure #1 in Publisher<>.min();
  v15[1] = v12;
  return result;
}

uint64_t sub_183B6A6B8()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in Publisher<>.min()()
{
  return dispatch thunk of static Comparable.< infix(_:_:)() & 1;
}

uint64_t Publishers.Comparison.init(upstream:areInIncreasingOrder:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return Publishers.DropWhile.init(upstream:predicate:)( a1,  a2,  a3,  a4,  a5,  (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for Publishers.Comparison,  a6);
}

uint64_t type metadata accessor for Publishers.Comparison(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Comparison);
}

uint64_t Publisher<>.max()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = *(void *)(a1 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v4, a1);
  uint64_t v12 = (uint64_t (*)())swift_allocObject();
  *((void *)v12 + 2) = a1;
  *((void *)v12 + 3) = a2;
  *((void *)v12 + 4) = a3;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a4, v11, a1);
  uint64_t result = type metadata accessor for Publishers.Comparison(0LL, a1, a2, v13);
  int v15 = (uint64_t (**)())(a4 + *(int *)(result + 36));
  *int v15 = partial apply for closure #1 in Publisher<>.max();
  v15[1] = v12;
  return result;
}

uint64_t sub_183B6A820()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in Publisher<>.max()()
{
  return dispatch thunk of static Comparable.< infix(_:_:)() & 1;
}

uint64_t Publisher.min(by:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return Publisher.drop(while:)( a1,  a2,  a3,  a4,  (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for Publishers.Comparison,  a5);
}

uint64_t Publisher.tryMin(by:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return Publisher.drop(while:)( a1,  a2,  a3,  a4,  (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for Publishers.TryComparison,  a5);
}

uint64_t Publishers.TryComparison.init(upstream:areInIncreasingOrder:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return Publishers.DropWhile.init(upstream:predicate:)( a1,  a2,  a3,  a4,  a5,  (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for Publishers.TryComparison,  a6);
}

uint64_t type metadata accessor for Publishers.TryComparison(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for Publishers.TryComparison);
}

uint64_t Publisher.max(by:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v11 = *(void *)(a3 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v11 + 16))(v13, v5);
  unsigned int v14 = (uint64_t (*)(uint64_t, uint64_t))swift_allocObject();
  *((void *)v14 + 2) = a3;
  *((void *)v14 + 3) = a4;
  *((void *)v14 + 4) = a1;
  *((void *)v14 + 5) = a2;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(a5, v13, a3);
  uint64_t v16 = (uint64_t (**)(uint64_t, uint64_t))(a5
                                                  + *(int *)(type metadata accessor for Publishers.Comparison( 0LL,  a3,  a4,  v15)
                                                           + 36));
  *uint64_t v16 = partial apply for closure #1 in Publisher.max(by:);
  v16[1] = v14;
  return swift_retain();
}

uint64_t sub_183B6A9A8()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in Publisher.max(by:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 32))(a2, a1) & 1;
}

uint64_t Publisher.tryMax(by:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v11 = *(void *)(a3 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v11 + 16))(v13, v5);
  unsigned int v14 = (uint64_t (*)(uint64_t, uint64_t))swift_allocObject();
  *((void *)v14 + 2) = a3;
  *((void *)v14 + 3) = a4;
  *((void *)v14 + 4) = a1;
  *((void *)v14 + 5) = a2;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(a5, v13, a3);
  uint64_t v16 = (uint64_t (**)(uint64_t, uint64_t))(a5
                                                  + *(int *)(type metadata accessor for Publishers.TryComparison( 0LL,  a3,  a4,  v15)
                                                           + 36));
  *uint64_t v16 = partial apply for closure #1 in Publisher.tryMax(by:);
  v16[1] = v14;
  return swift_retain();
}

uint64_t partial apply for closure #1 in Publisher.tryMax(by:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 32))(a2, a1) & 1;
}

uint64_t Publishers.Comparison.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 16LL))(a2, v2);
}

uint64_t Publishers.Comparison.receive<A>(subscriber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.LastWhere.receive<A>(subscriber:)( a1,  a2,  a3,  a4,  (uint64_t (*)(void, void *))type metadata accessor for Publishers.Comparison.Inner,  (uint64_t)&unk_189D2B340,  (uint64_t)_s6Output7Combine9PublisherPQzSbIegnd_AESbIegnr_AbCRzAB10SubscriberRd__7FailureQyd__AGRtzSb5InputRtd__r__lTRTA_0);
}

void type metadata accessor for Publishers.Comparison.Inner()
{
}

uint64_t Publishers.Comparison.Inner.description.getter()
{
  return 0x73697261706D6F43LL;
}

uint64_t Publishers.Comparison.Inner.receive(newValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v25[0] = a1;
  v25[3] = a2;
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 456);
  v25[1] = *(void *)(*v2 + 440);
  v25[2] = v4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = type metadata accessor for Optional();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1895F8858](v6);
  uint64_t v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = MEMORY[0x1895F8858](v8);
  uint64_t v13 = (char *)v25 - v12;
  uint64_t v14 = MEMORY[0x1895F8858](v11);
  uint64_t v16 = (char *)v25 - v15;
  uint64_t v17 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](v14);
  unsigned int v19 = (char *)v25 - v18;
  uint64_t v20 = (uint64_t)v2 + *(void *)(v3 + 136);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v16, v20, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v16, 1LL, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v16, v6);
    (*(void (**)(char *, void, uint64_t))(v17 + 16))(v13, v25[0], AssociatedTypeWitness);
LABEL_5:
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v13, 0LL, 1LL, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v13, v6);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 40))(v20, v10, v6);
    swift_endAccess();
    goto LABEL_6;
  }

  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v16, AssociatedTypeWitness);
  uint64_t v21 = v25[0];
  (*(void (**)(void *__return_ptr, void, char *))((char *)v2 + *(void *)(*v2 + 152)))(v26, v25[0], v19);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, AssociatedTypeWitness);
  if (LOBYTE(v26[0]) == 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v13, v21, AssociatedTypeWitness);
    goto LABEL_5;
  }

uint64_t protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Comparison<A>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.Comparison.receive<A>(subscriber:)(a1, a4, a2, a3);
}

uint64_t Publishers.TryComparison.receive<A>(subscriber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.LastWhere.receive<A>(subscriber:)( a1,  a2,  a3,  a4,  (uint64_t (*)(void, void *))type metadata accessor for Publishers.TryComparison.Inner,  (uint64_t)&unk_189D2B318,  (uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Publisher.Output) -> (@unowned Bool, @error @owned Error));
}

uint64_t Publishers.TryComparison.Inner.description.getter()
{
  return 0x61706D6F43797254LL;
}

uint64_t Publishers.TryComparison.Inner.receive(newValue:)(uint64_t a1)
{
  v21[0] = a1;
  uint64_t v2 = *v1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = type metadata accessor for Optional();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1895F8858](v4);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = MEMORY[0x1895F8858](v6);
  uint64_t v11 = (char *)v21 - v10;
  uint64_t v12 = MEMORY[0x1895F8858](v9);
  uint64_t v14 = (char *)v21 - v13;
  uint64_t v15 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](v12);
  uint64_t v17 = (char *)v21 - v16;
  uint64_t v18 = (uint64_t)v1 + *(void *)(v2 + 136);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v14, v18, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v14, 1LL, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v14, v4);
    (*(void (**)(char *, void, uint64_t))(v15 + 16))(v11, v21[0], AssociatedTypeWitness);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v14, AssociatedTypeWitness);
    (*(void (**)(void *__return_ptr, void, char *))((char *)v1 + *(void *)(*v1 + 152)))( v22,  v21[0],  v17);
    uint64_t v20 = v21[0];
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, AssociatedTypeWitness);
    if (LOBYTE(v22[0]) != 1) {
      return 0LL;
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v11, v20, AssociatedTypeWitness);
  }

  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v11, 0LL, 1LL, AssociatedTypeWitness);
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v11, v4);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v18, v8, v4);
  swift_endAccess();
  return 0LL;
}

uint64_t vtable thunk for ReduceProducer.receive(newValue:) dispatching to Publishers.TryComparison.Inner.receive(newValue:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = Publishers.TryComparison.Inner.receive(newValue:)(a1);
  *(void *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4;
  return result;
}

uint64_t protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.TryComparison<A>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.TryComparison.receive<A>(subscriber:)(a1, a4, a2, a3);
}

void type metadata accessor for Publishers.TryComparison.Inner()
{
}

uint64_t getEnumTagSinglePayload for Publishers.Comparison(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v7 = *(void *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      unint64_t v12 = *(void *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8LL);
      if (v12 >= 0xFFFFFFFF) {
        LODWORD(v12) = -1;
      }
      return (v12 + 1);
    }

    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }

  else
  {
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 16) & 0xFFFFFFF8) != 0) {
      unsigned int v8 = 2;
    }
    else {
      unsigned int v8 = a2 - v6 + 1;
    }
    if (v8 >= 0x10000) {
      unsigned int v9 = 4;
    }
    else {
      unsigned int v9 = 2;
    }
    if (v8 < 0x100) {
      unsigned int v9 = 1;
    }
    if (v8 >= 2) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0LL;
    }
    return ((uint64_t (*)(void))((char *)&loc_183B6B1AC + 4 * byte_183BA4820[v10]))();
  }

void storeEnumTagSinglePayload for Publishers.Comparison( unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 16) - 8LL);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v5 + 84);
  }
  if (v6 >= a3)
  {
    int v9 = 0u;
    if (a2 <= v6) {
      goto LABEL_17;
    }
  }

  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v7 = a3 - v6 + 1;
    }
    else {
      unsigned int v7 = 2;
    }
    if (v7 >= 0x10000) {
      int v8 = 4;
    }
    else {
      int v8 = 2;
    }
    if (v7 < 0x100) {
      int v8 = 1;
    }
    if (v7 >= 2) {
      int v9 = v8;
    }
    else {
      int v9 = 0;
    }
    if (a2 <= v6) {
LABEL_17:
    }
      __asm { BR              X12 }
  }

  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    unsigned int v10 = ~v6 + a2;
    bzero(a1, ((*(void *)(v5 + 64) + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + 16);
    *a1 = v10;
  }

  __asm { BR              X10 }

void sub_183B6B324()
{
  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x183B6B39CLL);
}

void sub_183B6B32C(uint64_t a1, int a2)
{
  *(_DWORD *)(v2 + v3) = 0;
  if (a2) {
    JUMPOUT(0x183B6B334LL);
  }
  JUMPOUT(0x183B6B39CLL);
}

void sub_183B6B374()
{
  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x183B6B39CLL);
}

void sub_183B6B37C()
{
  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x183B6B39CLL);
}

uint64_t sub_183B6B384(uint64_t a1, int a2, unsigned int a3)
{
  *(_WORD *)(v5 + v6) = 0;
  if (!a2) {
    JUMPOUT(0x183B6B39CLL);
  }
  if (a3 < 0x7FFFFFFF)
  {
    if ((a2 & 0x80000000) == 0) {
      JUMPOUT(0x183B6B398LL);
    }
    JUMPOUT(0x183B6B390LL);
  }

  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v5);
}

uint64_t sub_183B6B3B4()
{
  return swift_deallocObject();
}

uint64_t Publisher.replaceNil<A>(with:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = *(void *)(a3 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1895F8858](a1);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v9 + 16))(v11);
  unint64_t v12 = (*(unsigned __int8 *)(v9 + 80) + 40LL) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = (char *)swift_allocObject();
  *((void *)v13 + 2) = a2;
  *((void *)v13 + 3) = a3;
  *((void *)v13 + 4) = a4;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v13[v12], v11, a3);
  Publisher.map<A>(_:)( (uint64_t)partial apply for closure #1 in Publisher.replaceNil<A>(with:),  (uint64_t)v13,  a2,  a3,  a4,  a5);
  return swift_release();
}

uint64_t closure #1 in Publisher.replaceNil<A>(with:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for Optional();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = (char *)&v14 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v14 - v10, a1, v8);
  uint64_t v12 = *(void *)(a3 - 8);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(a4, a2, a3);
}

uint64_t sub_183B6B5B8()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in Publisher.replaceNil<A>(with:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(v2 + 24);
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(v3 - 8) + 80LL);
  return closure #1 in Publisher.replaceNil<A>(with:)(a1, v2 + ((v4 + 40) & ~v4), v3, a2);
}

uint64_t Publisher.replaceError(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Publisher.replaceError(with:)( a1,  a2,  a3,  (uint64_t (*)(char *, char *, uint64_t, uint64_t))Publishers.ReplaceError.init(upstream:output:));
}

uint64_t Publishers.ReplaceError.init(upstream:output:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return Publishers.ReplaceError.init(upstream:output:)( a1,  a2,  a3,  a4,  (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for Publishers.ReplaceError,  a5);
}

uint64_t type metadata accessor for Publishers.ReplaceError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for Publishers.ReplaceError);
}

uint64_t Publisher.replaceEmpty(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Publisher.replaceError(with:)( a1,  a2,  a3,  (uint64_t (*)(char *, char *, uint64_t, uint64_t))Publishers.ReplaceEmpty.init(upstream:output:));
}

uint64_t Publisher.replaceError(with:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(char *, char *, uint64_t, uint64_t))
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v13 = (char *)&v18 - v12;
  MEMORY[0x1895F8858](v11);
  uint64_t v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v15, v4, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a1, AssociatedTypeWitness);
  return a4(v15, v13, a2, a3);
}

uint64_t Publishers.ReplaceEmpty.init(upstream:output:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return Publishers.ReplaceError.init(upstream:output:)( a1,  a2,  a3,  a4,  (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for Publishers.ReplaceEmpty,  a5);
}

uint64_t Publishers.ReplaceError.init(upstream:output:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (*a5)(void, uint64_t, uint64_t)@<X4>, uint64_t a6@<X8>)
{
  uint64_t v10 = a5(0LL, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32LL))(a6 + *(int *)(v10 + 36), a1, a3);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32LL))( a6,  a2,  AssociatedTypeWitness);
}

uint64_t type metadata accessor for Publishers.ReplaceEmpty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for Publishers.ReplaceEmpty);
}

void Publishers.ReplaceEmpty.receive<A>(subscriber:)()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v1 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  MEMORY[0x1895F8858](v1);
  type metadata accessor for Publishers.ReplaceEmpty.Inner();
}

uint64_t sub_183B6B8E4(uint64_t a1)
{
  *(void *)(v9 - 112) = Publishers.ReplaceEmpty.Inner.init(downstream:output:)(v8, v7);
  uint64_t v11 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.ReplaceEmpty<A>.Inner<A1>, a1);
  Publisher.subscribe<A>(_:)(v9 - 112, v3, a1, v1, v11);
  return swift_release();
}

void type metadata accessor for Publishers.ReplaceEmpty.Inner()
{
}

uint64_t Publishers.ReplaceEmpty.Inner.__allocating_init(downstream:output:)(uint64_t a1, uint64_t a2)
{
  return Publishers.ReplaceEmpty.Inner.__allocating_init(downstream:output:)( a1,  a2,  (uint64_t (*)(uint64_t, uint64_t))Publishers.ReplaceEmpty.Inner.init(downstream:output:));
}

void Publishers.ReplaceEmpty.Inner.playgroundDescription.getter(uint64_t a1@<X8>)
{
  *(void *)(a1 + 24) = MEMORY[0x189617FA8];
  strcpy((char *)a1, "ReplaceEmpty");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

uint64_t *Publishers.ReplaceEmpty.Inner.init(downstream:output:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  *((_BYTE *)v2 + *(void *)(*v2 + 128)) = 0;
  uint64_t v6 = *(void *)(*v2 + 136);
  uint64_t v7 = (_DWORD *)swift_slowAlloc();
  *uint64_t v7 = 0;
  *(uint64_t *)((char *)v2 + (*(void (**)(uint64_t, void, uint64_t))(v4 + 16))(v7, *(void *)(v9 - 120), v6) = (uint64_t)v7;
  *((_BYTE *)v2 + *(void *)(*v2 + 144)) = 0;
  *((_BYTE *)v2 + *(void *)(*v2 + 152)) = 0;
  uint64_t v8 = (uint64_t)v2 + *(void *)(*v2 + 160);
  *(void *)(v8 + 32) = 0LL;
  *(_OWORD *)uint64_t v8 = 0u;
  *(_OWORD *)(v8 + 16) = 0u;
  *(_BYTE *)(v8 + 40) = 2;
  uint64_t v9 = (uint64_t)v2 + *(void *)(*v2 + 112);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32LL))( v9,  a2,  AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v5 + 88) - 8LL) + 32LL))( (uint64_t)v2 + *(void *)(*v2 + 120),  a1);
  return v2;
}

uint64_t *Publishers.ReplaceEmpty.Inner.deinit()
{
  uint64_t v1 = *v0;
  MEMORY[0x186E22A2C](*(uint64_t *)((char *)v0 + *(void *)(*v0 + 136)), -1LL, -1LL);
  uint64_t v2 = (uint64_t)v0 + *(void *)(*v0 + 112);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8LL))(v2, AssociatedTypeWitness);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 88) - 8LL) + 8LL))((uint64_t)v0 + *(void *)(*v0 + 120));
  outlined destroy of SubscriptionStatus((uint64_t)v0 + *(void *)(*v0 + 160));
  return v0;
}

uint64_t Publishers.ReplaceEmpty.Inner.__deallocating_deinit()
{
  return Publishers.DropWhile.Inner.__deallocating_deinit((void (*)(void))Publishers.ReplaceEmpty.Inner.deinit);
}

uint64_t Publishers.ReplaceEmpty.Inner.receive(subscription:)(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(*v1 + 136));
  os_unfair_lock_lock(v4);
  uint64_t v5 = (uint64_t)v1 + *(void *)(*v1 + 160);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v5, (uint64_t)&v15);
  if (v18 == 2
    && (int8x16_t v6 = vorrq_s8(v16, v17),
        !(*(void *)&vorr_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)) | (unint64_t)v15)))
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v15);
    outlined init with copy of Subscription((uint64_t)a1, (uint64_t)&v15);
    char v18 = 0;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v15, v5);
    swift_endAccess();
    os_unfair_lock_unlock(v4);
    v17.i64[0] = v3;
    v17.i64[1] = (uint64_t)&protocol witness table for Publishers.ReplaceEmpty<A>.Inner<A1>;
    uint64_t v15 = v1;
    uint64_t v10 = *(void *)(v3 + 104);
    uint64_t v11 = *(void (**)(uint64_t **, uint64_t, uint64_t))(v10 + 40);
    uint64_t v12 = *(void *)(v3 + 88);
    swift_retain();
    v11(&v15, v12, v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v15);
    uint64_t v13 = a1[3];
    uint64_t v14 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v13);
    return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v14 + 24))(0x8000000000000000LL, v13, v14);
  }

  else
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v15);
    os_unfair_lock_unlock(v4);
    uint64_t v8 = a1[3];
    uint64_t v7 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v8);
    return (*(uint64_t (**)(uint64_t))(*(void *)(v7 + 8) + 8LL))(v8);
  }

uint64_t Publishers.ReplaceEmpty.Inner.receive(_:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(*v1 + 136));
  os_unfair_lock_lock(v4);
  uint64_t v5 = (uint64_t)v1 + *(void *)(*v1 + 160);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v5, (uint64_t)v7);
  LODWORD((*(void (**)(uint64_t, void, uint64_t))(v2 + 16))(v8, *(void *)(v9 - 128), v5) = v7[40];
  outlined destroy of SubscriptionStatus((uint64_t)v7);
  if ((_DWORD)v5)
  {
    os_unfair_lock_unlock(v4);
    return 0LL;
  }

  else
  {
    *((_BYTE *)v1 + *(void *)(*v1 + 128)) = 1;
    os_unfair_lock_unlock(v4);
    return (*(uint64_t (**)(uint64_t, void))(*(void *)(v3 + 104) + 48LL))(a1, *(void *)(v3 + 88));
  }

void Publishers.ReplaceEmpty.Inner.receive(completion:)(uint64_t a1)
{
  uint64_t v34 = a1;
  uint64_t v2 = *v1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v6 = type metadata accessor for Subscribers.Completion(0LL, AssociatedTypeWitness, AssociatedConformanceWitness, v5);
  uint64_t v33 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  uint64_t v8 = (char *)&v28 - v7;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x1895F8858](TupleTypeMetadata2);
  uint64_t v11 = (char *)&v28 - v10;
  uint64_t v12 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(v2 + 136));
  os_unfair_lock_lock(v12);
  uint64_t v13 = (uint64_t)v1 + *(void *)(*v1 + 160);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v13, (uint64_t)&v35);
  int v14 = v38;
  outlined destroy of SubscriptionStatus((uint64_t)&v35);
  if (v14)
  {
    uint64_t v15 = v12;
LABEL_3:
    os_unfair_lock_unlock(v15);
    return;
  }

  uint64_t v31 = v2;
  os_unfair_lock_t v32 = v12;
  uint64_t v29 = v11;
  uint64_t v30 = AssociatedTypeWitness;
  uint64_t v28 = v8;
  uint64_t v35 = 1LL;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  unsigned __int8 v38 = 2;
  swift_beginAccess();
  outlined assign with take of SubscriptionStatus((uint64_t)&v35, v13);
  swift_endAccess();
  if (*((_BYTE *)v1 + *(void *)(*v1 + 128)) == 1)
  {
    os_unfair_lock_unlock(v32);
    (*(void (**)(uint64_t, void))(*(void *)(v31 + 104) + 56LL))(v34, *(void *)(v31 + 88));
  }

  else
  {
    int v16 = *((unsigned __int8 *)v1 + *(void *)(*v1 + 144));
    uint64_t v17 = *(int *)(TupleTypeMetadata2 + 48);
    uint64_t v18 = v33;
    uint64_t v19 = v34;
    uint64_t v20 = v29;
    uint64_t v21 = v6;
    (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v29, v34, v6);
    v20[v17] = v16;
    uint64_t v22 = v30;
    uint64_t v23 = *(void *)(v30 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v20, 1LL, v30) == 1)
    {
      if (!v16)
      {
        *((_BYTE *)v1 + *(void *)(*v1 + 152)) = 1;
        uint64_t v15 = v32;
        goto LABEL_3;
      }

      os_unfair_lock_unlock(v32);
      uint64_t v24 = *(void *)(v31 + 104);
      uint64_t v25 = *(void *)(v31 + 88);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))((uint64_t)v1 + *(void *)(*v1 + 112), v25, v24);
      int v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
      unsigned int v27 = v28;
      v26(v28, 1LL, 1LL, v22);
      (*(void (**)(char *, uint64_t, uint64_t))(v24 + 56))(v27, v25, v24);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v27, v21);
    }

    else
    {
      os_unfair_lock_unlock(v32);
      (*(void (**)(uint64_t, void))(*(void *)(v31 + 104) + 56LL))(v19, *(void *)(v31 + 88));
      (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v21);
    }
  }

void Publishers.ReplaceEmpty.Inner.cancel()()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + *(void *)(*(void *)v0 + 136LL));
  os_unfair_lock_lock(v1);
  uint64_t v2 = v0 + *(void *)(*(void *)v0 + 160LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v2, (uint64_t)&v5);
  if (v8)
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v5);
    os_unfair_lock_unlock(v1);
  }

  else
  {
    outlined init with take of Subscription((__int128 *)&v5, (uint64_t)v9);
    uint64_t v5 = 1LL;
    __int128 v6 = 0u;
    __int128 v7 = 0u;
    char v8 = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v5, v2);
    swift_endAccess();
    os_unfair_lock_unlock(v1);
    uint64_t v3 = v10;
    uint64_t v4 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    (*(void (**)(uint64_t))(*(void *)(v4 + 8) + 8LL))(v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }

void Publishers.ReplaceEmpty.Inner.request(_:)(uint64_t a1)
{
  uint64_t v3 = *(void **)v1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v7 = type metadata accessor for Subscribers.Completion(0LL, AssociatedTypeWitness, AssociatedConformanceWitness, v6);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858](v7);
  uint64_t v10 = (char *)v17 - v9;
  if (a1 == 0x8000000000000000LL) {
    goto LABEL_4;
  }
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_11;
  }

  if (!a1)
  {
LABEL_11:
    __break(1u);
    return;
  }

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.ReplaceEmpty<A>.Inner<A1>( void *a1)
{
  return Publishers.ReplaceEmpty.Inner.receive(subscription:)(a1);
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance Publishers.ReplaceEmpty<A>.Inner<A1>( uint64_t a1)
{
  return Publishers.ReplaceEmpty.Inner.receive(_:)(a1);
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.ReplaceEmpty<A>.Inner<A1>( uint64_t a1)
{
}

void protocol witness for Subscription.request(_:) in conformance Publishers.ReplaceEmpty<A>.Inner<A1>( uint64_t a1)
{
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.ReplaceEmpty<A>.Inner<A1>()
{
  return 0x456563616C706552LL;
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.ReplaceEmpty<A>.Inner<A1>( uint64_t a1@<X8>)
{
}

void protocol witness for Cancellable.cancel() in conformance Publishers.ReplaceEmpty<A>.Inner<A1>()
{
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.ReplaceEmpty<A>()
{
}

uint64_t Publishers.ReplaceEmpty.output.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16LL))( a1,  v1,  AssociatedTypeWitness);
}

uint64_t Publishers.ReplaceEmpty.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 16LL))( a2,  v2 + *(int *)(a1 + 36));
}

void Publishers.ReplaceError.receive<A>(subscriber:)()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v1 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  MEMORY[0x1895F8858](v1);
  type metadata accessor for Publishers.ReplaceError.Inner();
}

uint64_t sub_183B6C670(uint64_t a1)
{
  *(void *)(v10 - 112) = Publishers.ReplaceError.Inner.init(downstream:output:)(v9, v8);
  uint64_t v12 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.ReplaceError<A>.Inner<A1>, a1);
  Publisher.subscribe<A>(_:)(v10 - 112, v3, a1, v4, v12);
  return swift_release();
}

void type metadata accessor for Publishers.ReplaceError.Inner()
{
}

uint64_t Publishers.ReplaceError.Inner.__allocating_init(downstream:output:)(uint64_t a1, uint64_t a2)
{
  return Publishers.ReplaceEmpty.Inner.__allocating_init(downstream:output:)( a1,  a2,  (uint64_t (*)(uint64_t, uint64_t))Publishers.ReplaceError.Inner.init(downstream:output:));
}

uint64_t Publishers.ReplaceEmpty.Inner.__allocating_init(downstream:output:)( uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  return a3(a1, a2);
}

void Publishers.ReplaceError.Inner.playgroundDescription.getter(uint64_t a1@<X8>)
{
  *(void *)(a1 + 24) = MEMORY[0x189617FA8];
  strcpy((char *)a1, "ReplaceError");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

uint64_t *Publishers.ReplaceError.Inner.init(downstream:output:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = (uint64_t)v2 + *(void *)(*v2 + 128);
  *(_OWORD *)uint64_t v6 = 0u;
  *(_OWORD *)(v6 + 16) = 0u;
  *(void *)(v6 + 32) = 0LL;
  *(_BYTE *)(v6 + 40) = 2;
  *((_BYTE *)v2 + *(void *)(*v2 + 136)) = 0;
  *(uint64_t *)((char *)v2 + *(void *)(*v2 + 144)) = 0LL;
  uint64_t v7 = *(void *)(*v2 + 152);
  uint64_t v8 = (_DWORD *)swift_slowAlloc();
  *(uint64_t *)((char *)v2 + (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v8, v2, v7) = (uint64_t)v8;
  *uint64_t v8 = 0;
  uint64_t v9 = (uint64_t)v2 + *(void *)(*v2 + 112);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32LL))( v9,  a2,  AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v5 + 88) - 8LL) + 32LL))( (uint64_t)v2 + *(void *)(*v2 + 120),  a1);
  return v2;
}

uint64_t *Publishers.ReplaceError.Inner.deinit()
{
  uint64_t v1 = *v0;
  MEMORY[0x186E22A2C](*(uint64_t *)((char *)v0 + *(void *)(*v0 + 152)), -1LL, -1LL);
  uint64_t v2 = (uint64_t)v0 + *(void *)(*v0 + 112);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8LL))(v2, AssociatedTypeWitness);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 88) - 8LL) + 8LL))((uint64_t)v0 + *(void *)(*v0 + 120));
  outlined destroy of SubscriptionStatus((uint64_t)v0 + *(void *)(*v0 + 128));
  return v0;
}

uint64_t Publishers.ReplaceError.Inner.__deallocating_deinit()
{
  return Publishers.DropWhile.Inner.__deallocating_deinit((void (*)(void))Publishers.ReplaceError.Inner.deinit);
}

uint64_t Publishers.ReplaceError.Inner.receive(subscription:)(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(*v1 + 152));
  os_unfair_lock_lock(v4);
  uint64_t v5 = (uint64_t)v1 + *(void *)(*v1 + 128);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v5, (uint64_t)&v13);
  if (v16 == 2
    && (int8x16_t v6 = vorrq_s8(v14, v15),
        !(*(void *)&vorr_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)) | (unint64_t)v13)))
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v13);
    outlined init with copy of Subscription((uint64_t)a1, (uint64_t)&v13);
    char v16 = 0;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v13, v5);
    swift_endAccess();
    os_unfair_lock_unlock(v4);
    v15.i64[0] = v3;
    v15.i64[1] = (uint64_t)&protocol witness table for Publishers.ReplaceError<A>.Inner<A1>;
    uint64_t v13 = v1;
    uint64_t v10 = *(void *)(v3 + 104);
    uint64_t v11 = *(void (**)(uint64_t **, uint64_t, uint64_t))(v10 + 40);
    uint64_t v12 = *(void *)(v3 + 88);
    swift_retain();
    v11(&v13, v12, v10);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  }

  else
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v13);
    os_unfair_lock_unlock(v4);
    uint64_t v7 = a1[3];
    uint64_t v8 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v7);
    return (*(uint64_t (**)(uint64_t))(*(void *)(v8 + 8) + 8LL))(v7);
  }

void Publishers.ReplaceError.Inner.receive(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(*v1 + 152));
  os_unfair_lock_lock(v5);
  uint64_t v6 = (uint64_t)v1 + *(void *)(*v1 + 128);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v6, (uint64_t)v15);
  int v7 = v15[40];
  outlined destroy of SubscriptionStatus((uint64_t)v15);
  if (v7) {
    goto LABEL_2;
  }
  uint64_t v8 = *(void *)(*v2 + 144);
  uint64_t v9 = *(uint64_t *)((char *)v2 + v8);
  if (v9 != 0x8000000000000000LL)
  {
    if (v9 < 0)
    {
      __break(1u);
    }

    else if (v9)
    {
      *(uint64_t *)((char *)v2 + v8) = v9 - 1;
      goto LABEL_8;
    }

    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

void Publishers.ReplaceError.Inner.receive(completion:)(uint64_t a1)
{
  uint64_t v3 = *(void **)v1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v7 = type metadata accessor for Subscribers.Completion(0LL, AssociatedTypeWitness, AssociatedConformanceWitness, v6);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858](v7);
  uint64_t v10 = &v18[-v9];
  uint64_t v11 = *(os_unfair_lock_s **)(v1 + v3[19]);
  os_unfair_lock_lock(v11);
  uint64_t v12 = v1 + *(void *)(*(void *)v1 + 128LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v12, (uint64_t)&v19);
  int v13 = v22;
  outlined destroy of SubscriptionStatus((uint64_t)&v19);
  if (!v13)
  {
    uint64_t v14 = *(void *)(*(void *)v1 + 136LL);
    if ((*(_BYTE *)(v1 + v14) & 1) == 0)
    {
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 48LL))( v10,  1LL,  AssociatedTypeWitness) == 1)
      {
        uint64_t v19 = 1LL;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        unsigned __int8 v22 = 2;
        swift_beginAccess();
        outlined assign with take of SubscriptionStatus((uint64_t)&v19, v12);
        swift_endAccess();
        os_unfair_lock_unlock(v11);
        LOBYTE(v19) = 1;
        (*(void (**)(uint64_t *, void))(v3[13] + 56LL))(&v19, v3[11]);
        return;
      }

      uint64_t v15 = *(void *)(v1 + *(void *)(*(void *)v1 + 144LL));
      if (v15 == 0x8000000000000000LL) {
        goto LABEL_10;
      }
      if (v15 < 0)
      {
        __break(1u);
        return;
      }

      if (v15)
      {
LABEL_10:
        uint64_t v19 = 1LL;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        unsigned __int8 v22 = 2;
        swift_beginAccess();
        outlined assign with take of SubscriptionStatus((uint64_t)&v19, v12);
        swift_endAccess();
        os_unfair_lock_unlock(v11);
        uint64_t v16 = v3[13];
        uint64_t v17 = v3[11];
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))( v1 + *(void *)(*(void *)v1 + 112LL),  v17,  v16);
        LOBYTE(v19) = 1;
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v16 + 56))(&v19, v17, v16);
      }

      else
      {
        *(_BYTE *)(v1 + v14) = 1;
        os_unfair_lock_unlock(v11);
      }

      (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
      return;
    }
  }

  os_unfair_lock_unlock(v11);
}

void Publishers.ReplaceError.Inner.cancel()()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + *(void *)(*(void *)v0 + 152LL));
  os_unfair_lock_lock(v1);
  uint64_t v2 = v0 + *(void *)(*(void *)v0 + 128LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v2, (uint64_t)&v5);
  if (v8)
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v5);
    os_unfair_lock_unlock(v1);
  }

  else
  {
    outlined init with take of Subscription((__int128 *)&v5, (uint64_t)v9);
    uint64_t v5 = 1LL;
    __int128 v6 = 0u;
    __int128 v7 = 0u;
    char v8 = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v5, v2);
    swift_endAccess();
    os_unfair_lock_unlock(v1);
    uint64_t v3 = v10;
    uint64_t v4 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    (*(void (**)(uint64_t))(*(void *)(v4 + 8) + 8LL))(v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }

void Publishers.ReplaceError.Inner.request(_:)(uint64_t a1)
{
  uint64_t v3 = *(void **)v1;
  if (a1 != 0x8000000000000000LL)
  {
    if (a1 < 0)
    {
      __break(1u);
    }

    else if (a1)
    {
      goto LABEL_4;
    }

    __break(1u);
    goto LABEL_20;
  }

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.ReplaceError<A>.Inner<A1>( void *a1)
{
  return Publishers.ReplaceError.Inner.receive(subscription:)(a1);
}

void protocol witness for Subscriber.receive(_:) in conformance Publishers.ReplaceError<A>.Inner<A1>( uint64_t a1)
{
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.ReplaceError<A>.Inner<A1>( uint64_t a1)
{
}

void protocol witness for Subscription.request(_:) in conformance Publishers.ReplaceError<A>.Inner<A1>( uint64_t a1)
{
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.ReplaceError<A>.Inner<A1>()
{
  return 0x456563616C706552LL;
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.ReplaceError<A>.Inner<A1>( uint64_t a1@<X8>)
{
}

void protocol witness for Cancellable.cancel() in conformance Publishers.ReplaceError<A>.Inner<A1>()
{
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.ReplaceError<A>()
{
}

uint64_t static Publishers.ReplaceEmpty<>.== infix(_:_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return static Publishers.ReplaceEmpty<>.== infix(_:_:)( a1,  a2,  a3,  a4,  a5,  a6,  (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for Publishers.ReplaceEmpty);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.ReplaceEmpty<A>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static Publishers.ReplaceEmpty<>.== infix(_:_:)( a1,  a2,  *(void *)(a3 + 16),  *(void *)(a3 + 24),  *(void *)(a4 - 8),  *(void *)(a4 - 16));
}

uint64_t static Publishers.ReplaceError<>.== infix(_:_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return static Publishers.ReplaceEmpty<>.== infix(_:_:)( a1,  a2,  a3,  a4,  a5,  a6,  (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for Publishers.ReplaceError);
}

uint64_t static Publishers.ReplaceEmpty<>.== infix(_:_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(void, uint64_t, uint64_t))
{
  v21[1] = a6;
  uint64_t v9 = a7(0LL, a3, a4);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1895F8858](v9);
  uint64_t v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v11);
  uint64_t v15 = (char *)v21 - v14;
  char v16 = dispatch thunk of static Equatable.== infix(_:_:)();
  __int128 v17 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v17(v15, a1, v9);
  v17(v13, a2, v9);
  if ((v16 & 1) != 0)
  {
    swift_getAssociatedTypeWitness();
    char v18 = dispatch thunk of static Equatable.== infix(_:_:)();
  }

  else
  {
    char v18 = 0;
  }

  uint64_t v19 = *(void (**)(char *, uint64_t))(v10 + 8);
  v19(v13, v9);
  v19(v15, v9);
  return v18 & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.ReplaceError<A>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static Publishers.ReplaceError<>.== infix(_:_:)( a1,  a2,  *(void *)(a3 + 16),  *(void *)(a3 + 24),  *(void *)(a4 - 8),  *(void *)(a4 - 16));
}

uint64_t type metadata completion function for Publishers.ReplaceEmpty.Inner()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_initClassMetadata2();
      if (!result) {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t type metadata completion function for Publishers.ReplaceEmpty()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0LL;
    }
  }

  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.ReplaceEmpty(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80);
  uint64_t v10 = *(void *)(v7 + 64) + v9;
  uint64_t v11 = (*(_BYTE *)(v7 + 80) | *(_BYTE *)(v8 + 80));
  if (v11 > 7
    || ((*(_DWORD *)(v7 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0
    || (v10 & (unint64_t)~v9) + *(void *)(v8 + 64) > 0x18)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v11 + 16) & ~v11));
    swift_retain();
  }

  else
  {
    uint64_t v15 = ~v9;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, AssociatedTypeWitness);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))( ((unint64_t)a1 + v10) & v15,  ((unint64_t)a2 + v10) & v15,  v5);
  }

  return a1;
}

uint64_t destroy for Publishers.ReplaceEmpty(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
  return (*(uint64_t (**)(unint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))( (*(void *)(v5 + 64) + a1 + *(unsigned __int8 *)(*(void *)(v3 - 8) + 80LL)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80LL),  v3);
}

uint64_t initializeWithCopy for Publishers.ReplaceEmpty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a1, a2, AssociatedTypeWitness);
  uint64_t v8 = *(void *)(v5 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))( (*(void *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80),  (*(void *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80),  v5);
  return a1;
}

uint64_t assignWithCopy for Publishers.ReplaceEmpty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(a1, a2, AssociatedTypeWitness);
  uint64_t v8 = *(void *)(v5 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 24))( (*(void *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80),  (*(void *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80),  v5);
  return a1;
}

uint64_t initializeWithTake for Publishers.ReplaceEmpty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(a1, a2, AssociatedTypeWitness);
  uint64_t v8 = *(void *)(v5 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 32))( (*(void *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80),  (*(void *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80),  v5);
  return a1;
}

uint64_t assignWithTake for Publishers.ReplaceEmpty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(a1, a2, AssociatedTypeWitness);
  uint64_t v8 = *(void *)(v5 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40))( (*(void *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80),  (*(void *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80),  v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.ReplaceEmpty(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  uint64_t v9 = *(void *)(v5 - 8);
  uint64_t v10 = *(unsigned int *)(v9 + 84);
  else {
    unsigned int v11 = *(_DWORD *)(v9 + 84);
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v12 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = *(void *)(v7 + 64) + v12;
  if (a2 <= v11) {
    goto LABEL_23;
  }
  uint64_t v14 = (v13 & ~v12) + *(void *)(v9 + 64);
  char v15 = 8 * v14;
  if (v14 <= 3)
  {
    unsigned int v17 = ((a2 - v11 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v17))
    {
      int v16 = *(_DWORD *)(a1 + v14);
      if (!v16) {
        goto LABEL_23;
      }
      goto LABEL_14;
    }

    if (v17 > 0xFF)
    {
      int v16 = *(unsigned __int16 *)(a1 + v14);
      if (!*(_WORD *)(a1 + v14)) {
        goto LABEL_23;
      }
      goto LABEL_14;
    }

    if (v17 < 2)
    {
LABEL_23:
      if (v11)
      {
        if (v8 >= v10) {
          return (*(uint64_t (**)(uint64_t, void, uint64_t))(v7 + 48))( a1,  *(unsigned int *)(v7 + 84),  AssociatedTypeWitness);
        }
        else {
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))((v13 + a1) & ~v12, v10, v5);
        }
      }

      return 0LL;
    }
  }

  int v16 = *(unsigned __int8 *)(a1 + v14);
  if (!*(_BYTE *)(a1 + v14)) {
    goto LABEL_23;
  }
LABEL_14:
  int v18 = (v16 - 1) << v15;
  if ((_DWORD)v14)
  {
    else {
      int v19 = 4;
    }
    __asm { BR              X12 }
  }

  return v11 + v18 + 1;
}

void storeEnumTagSinglePayload for Publishers.ReplaceEmpty( _BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v9 = *(void *)(v7 - 8);
  if (*(_DWORD *)(v9 + 84) <= *(_DWORD *)(v8 + 84)) {
    unsigned int v10 = *(_DWORD *)(v8 + 84);
  }
  else {
    unsigned int v10 = *(_DWORD *)(v9 + 84);
  }
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  size_t v12 = ((*(void *)(v8 + 64) + v11) & ~v11) + *(void *)(v9 + 64);
  if (a3 <= v10)
  {
    unsigned int v13 = 0u;
  }

  else if (v12 <= 3)
  {
    unsigned int v15 = ((a3 - v10 + ~(-1 << (8 * v12))) >> (8 * v12)) + 1;
    if (HIWORD(v15))
    {
      unsigned int v13 = 4u;
    }

    else if (v15 >= 0x100)
    {
      unsigned int v13 = 2;
    }

    else
    {
      unsigned int v13 = v15 > 1;
    }
  }

  else
  {
    unsigned int v13 = 1u;
  }

  if (v10 < a2)
  {
    unsigned int v14 = ~v10 + a2;
    if (v12 < 4)
    {
      if ((_DWORD)v12)
      {
        int v16 = v14 & ~(-1 << (8 * v12));
        bzero(a1, v12);
        if ((_DWORD)v12 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }

        else if ((_DWORD)v12 == 2)
        {
          *(_WORD *)a1 = v16;
        }

        else
        {
          *a1 = v16;
        }
      }
    }

    else
    {
      bzero(a1, ((*(void *)(v8 + 64) + v11) & ~v11) + *(void *)(v9 + 64));
      *(_DWORD *)a1 = v14;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X15 }

uint64_t type metadata completion function for Publishers.ReplaceError.Inner()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_initClassMetadata2();
      if (!result) {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t Publisher.assertNoFailure(_:file:line:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v27 = a6;
  HIDWORD(v26) = a5;
  uint64_t v17 = *(void *)(a7 - 8);
  MEMORY[0x1895F8858](a1);
  int v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v9, v20);
  (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(a9, v19, a7);
  unsigned __int8 v22 = (int *)type metadata accessor for Publishers.AssertNoFailure(0LL, a7, a8, v21);
  uint64_t v23 = (void *)(a9 + v22[9]);
  *uint64_t v23 = a1;
  v23[1] = a2;
  uint64_t v24 = a9 + v22[10];
  *(void *)uint64_t v24 = a3;
  *(void *)(v24 + 8) = a4;
  *(_BYTE *)(v24 + 16) = BYTE4(v26);
  *(void *)(a9 + v22[11]) = v27;
  return swift_bridgeObjectRetain();
}

int *Publishers.AssertNoFailure.init(upstream:prefix:file:line:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t result = (int *)type metadata accessor for Publishers.AssertNoFailure(0LL, a8, a10, v18);
  uint64_t v20 = (void *)(a9 + result[9]);
  *uint64_t v20 = a2;
  v20[1] = a3;
  uint64_t v21 = a9 + result[10];
  *(void *)uint64_t v21 = a4;
  *(void *)(v21 + 8) = a5;
  *(_BYTE *)(v21 + 16) = a6;
  *(void *)(a9 + result[11]) = a7;
  return result;
}

uint64_t type metadata accessor for Publishers.AssertNoFailure( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for Publishers.AssertNoFailure);
}

uint64_t Publishers.AssertNoFailure.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 16LL))(a2, v2);
}

uint64_t Publishers.AssertNoFailure.prefix.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 36));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t Publishers.AssertNoFailure.file.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 40));
}

uint64_t Publishers.AssertNoFailure.line.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 44));
}

void Publishers.AssertNoFailure.receive<A>(subscriber:)(uint64_t a1)
{
}

void sub_183B6E0A4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v15 - 120) = *(void *)(a1 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v17 = (char *)&a9 - v16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v14, v13, v11);
  *(void *)(v15 - 152) = *(void *)(v10 + *(int *)(v12 + 40) + 8);
  *(void *)(v15 - 144) = v10;
  swift_bridgeObjectRetain();
  Publishers.AssertNoFailure.Inner.init(downstream:prefix:file:line:)(v14, (uint64_t)v17, v11);
}

uint64_t sub_183B6E150()
{
  uint64_t v5 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.AssertNoFailure<A>.Inner<A1>, v2);
  Publisher.subscribe<A>(_:)(v3, v0, v2, v1, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 120) + 8LL))(v3, v2);
}

void type metadata accessor for Publishers.AssertNoFailure.Inner()
{
}

void Publishers.AssertNoFailure.Inner.init(downstream:prefix:file:line:)( uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3)
{
}

void sub_183B6E234(int *a1)
{
  uint64_t v7 = (void *)(v1 + a1[13]);
  *uint64_t v7 = v6;
  v7[1] = v5;
  uint64_t v8 = v1 + a1[14];
  *(void *)uint64_t v8 = v4;
  *(void *)(v8 + 8) = v3;
  *(_BYTE *)(v8 + 16) = v2;
  *(void *)(v1 + a1[15]) = v12;
  uint64_t v9 = a1[16];
  if (one-time initialization token for lock != -1) {
    swift_once();
  }
  uint64_t v10 = (os_unfair_lock_s *)static lock in Global #1 in CombineIdentifier.init();
  os_unfair_lock_lock((os_unfair_lock_t)static lock in Global #1 in CombineIdentifier.init());
  uint64_t v11 = static generation in Global #1 in CombineIdentifier.init();
  if (static generation in Global #1 in CombineIdentifier.init() == -1)
  {
    __break(1u);
  }

  else
  {
    ++static generation in Global #1 in CombineIdentifier.init();
    os_unfair_lock_unlock(v10);
    *(void *)(v1 + v9) = v11;
  }

uint64_t Publishers.AssertNoFailure.Inner.customMirror.getter(int *a1)
{
  uint64_t v3 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1895F8858](v3);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  uint64_t v7 = MEMORY[0x1895F8858](v6);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v7);
  (*(void (**)(char *, uint64_t, int *))(v11 + 16))( (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v1,  a1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_183B9EBF0;
  *(void *)(v12 + 32) = 1701603686LL;
  *(void *)(v12 + 40) = 0xE400000000000000LL;
  uint64_t v13 = a1[13];
  uint64_t v14 = v1 + a1[14];
  char v15 = *(_BYTE *)(v14 + 16);
  uint64_t v16 = MEMORY[0x189619270];
  *(_OWORD *)(v12 + 48) = *(_OWORD *)v14;
  *(_BYTE *)(v12 + 64) = v15;
  uint64_t v17 = *(void *)(v1 + a1[15]);
  *(void *)(v12 + 72) = v16;
  *(void *)(v12 + 80) = 1701734764LL;
  uint64_t v18 = MEMORY[0x189618CD8];
  *(void *)(v12 + 88) = 0xE400000000000000LL;
  *(void *)(v12 + 96) = v17;
  *(void *)(v12 + 120) = v18;
  *(void *)(v12 + 128) = 0x786966657270LL;
  uint64_t v19 = v1 + v13;
  uint64_t v20 = *(void *)(v1 + v13);
  uint64_t v21 = *(void *)(v19 + 8);
  *(void *)(v12 + 168) = MEMORY[0x189617FA8];
  *(void *)(v12 + 136) = 0xE600000000000000LL;
  *(void *)(v12 + 144) = v20;
  *(void *)(v12 + 152) = v21;
  uint64_t v22 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56LL))(v9, 1LL, 1LL, v22);
  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)((uint64_t)v5);
  swift_bridgeObjectRetain();
  return Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
}

void Publishers.AssertNoFailure.Inner.playgroundDescription.getter(void *a1@<X8>)
{
  a1[3] = MEMORY[0x189617FA8];
  *a1 = 0x6F4E747265737341LL;
  a1[1] = 0xEF6572756C696146LL;
}

uint64_t Publishers.AssertNoFailure.Inner.receive(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v7 = type metadata accessor for Subscribers.Completion(0LL, AssociatedTypeWitness, AssociatedConformanceWitness, v6);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858](v7);
  uint64_t v10 = &v12[-v9];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(&v12[-v9], a1, v7);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 48LL))( v10,  1LL,  AssociatedTypeWitness) == 1)
  {
    char v13 = 1;
    return (*(uint64_t (**)(char *, void))(*(void *)(a2 + 40) + 56LL))(&v13, *(void *)(a2 + 24));
  }

  else
  {
    uint64_t result = (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
    __break(1u);
  }

  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.AssertNoFailure<A>.Inner<A1>()
{
  return 0x6F4E747265737341LL;
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.AssertNoFailure<A>( uint64_t a1)
{
}

uint64_t type metadata completion function for Publishers.AssertNoFailure()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.AssertNoFailure( uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 47) & 0xFFFFFFFFFFFFFFF8LL) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }

  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    uint64_t v10 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8LL);
    uint64_t v11 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8LL);
    void *v10 = *v11;
    v10[1] = v11[1];
    unint64_t v12 = ((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v13 = ((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8LL;
    __int128 v14 = *(_OWORD *)v13;
    *(_BYTE *)(v12 + 16) = *(_BYTE *)(v13 + 16);
    *(_OWORD *)unint64_t v12 = v14;
    *(void *)(((unint64_t)v10 + 47) & 0xFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v11 + 47) & 0xFFFFFFFFFFFFF8LL);
    swift_bridgeObjectRetain();
  }

  return v4;
}

uint64_t destroy for Publishers.AssertNoFailure(uint64_t a1, uint64_t a2)
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Publishers.AssertNoFailure(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v5 + 16))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8LL);
  *int v7 = *v8;
  v7[1] = v8[1];
  unint64_t v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  char v11 = *(_BYTE *)(v10 + 16);
  *(_OWORD *)unint64_t v9 = *(_OWORD *)v10;
  *(_BYTE *)(v9 + 16) = v11;
  *(void *)(((unint64_t)v7 + 47) & 0xFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v8 + 47) & 0xFFFFFFFFFFFFF8LL);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Publishers.AssertNoFailure(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v5 + 24))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8LL);
  *int v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  *(void *)unint64_t v9 = *(void *)v10;
  *(void *)(v9 + 8) = *(void *)(v10 + 8);
  *(_BYTE *)(v9 + 16) = *(_BYTE *)(v10 + 16);
  *(void *)(((unint64_t)v7 + 47) & 0xFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v8 + 47) & 0xFFFFFFFFFFFFF8LL);
  return a1;
}

uint64_t initializeWithTake for Publishers.AssertNoFailure(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v5 + 32))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  int v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8LL);
  *int v7 = *v8;
  unint64_t v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  __int128 v11 = *(_OWORD *)v10;
  *(_BYTE *)(v9 + 16) = *(_BYTE *)(v10 + 16);
  *(_OWORD *)unint64_t v9 = v11;
  *(void *)(((unint64_t)v7 + 47) & 0xFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v8 + 47) & 0xFFFFFFFFFFFFF8LL);
  return a1;
}

uint64_t assignWithTake for Publishers.AssertNoFailure(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v5 + 40))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8LL);
  *int v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  unint64_t v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  *(void *)unint64_t v9 = *(void *)v10;
  *(void *)(v9 + 8) = *(void *)(v10 + 8);
  *(_BYTE *)(v9 + 16) = *(_BYTE *)(v10 + 16);
  *(void *)(((unint64_t)v7 + 47) & 0xFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v8 + 47) & 0xFFFFFFFFFFFFF8LL);
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.AssertNoFailure(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v7 = *(void *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      unint64_t v12 = *(void *)(((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8LL) + 8);
      if (v12 >= 0xFFFFFFFF) {
        LODWORD(v12) = -1;
      }
      return (v12 + 1);
    }

    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }

  else
  {
    if (((((((v7 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 47) & 0xFFFFFFFFFFFFFFF8LL) + 8) & 0xFFFFFFF8) != 0) {
      unsigned int v8 = 2;
    }
    else {
      unsigned int v8 = a2 - v6 + 1;
    }
    if (v8 >= 0x10000) {
      unsigned int v9 = 4;
    }
    else {
      unsigned int v9 = 2;
    }
    if (v8 < 0x100) {
      unsigned int v9 = 1;
    }
    if (v8 >= 2) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0LL;
    }
    return ((uint64_t (*)(void))((char *)&loc_183B6EB48 + 4 * byte_183BA4C48[v10]))();
  }

void storeEnumTagSinglePayload for Publishers.AssertNoFailure( unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 16) - 8LL);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v5 + 84);
  }
  if (v6 >= a3)
  {
    int v9 = 0u;
    if (a2 <= v6) {
      goto LABEL_17;
    }
  }

  else
  {
    if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 47) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v7 = a3 - v6 + 1;
    }
    else {
      unsigned int v7 = 2;
    }
    if (v7 >= 0x10000) {
      int v8 = 4;
    }
    else {
      int v8 = 2;
    }
    if (v7 < 0x100) {
      int v8 = 1;
    }
    if (v7 >= 2) {
      int v9 = v8;
    }
    else {
      int v9 = 0;
    }
    if (a2 <= v6) {
LABEL_17:
    }
      __asm { BR              X12 }
  }

  if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 47) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    unsigned int v10 = ~v6 + a2;
    bzero(a1, ((((*(void *)(v5 + 64) + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + 47) & 0xFFFFFFFFFFFFFFF8LL) + 8);
    *a1 = v10;
  }

  __asm { BR              X10 }

void sub_183B6ECC8()
{
  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x183B6ED40LL);
}

void sub_183B6ECD0(uint64_t a1, int a2)
{
  *(_DWORD *)(v2 + v3) = 0;
  if (a2) {
    JUMPOUT(0x183B6ECD8LL);
  }
  JUMPOUT(0x183B6ED40LL);
}

void sub_183B6ED1C()
{
  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x183B6ED40LL);
}

void sub_183B6ED24()
{
  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x183B6ED40LL);
}

uint64_t sub_183B6ED2C(uint64_t a1, int a2, unsigned int a3)
{
  *(_WORD *)(v6 + (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v8, v2, v7) = 0;
  if (!a2) {
    goto LABEL_6;
  }
  if (a3 < 0x7FFFFFFF)
  {
    if (a2 < 0) {
      JUMPOUT(0x183B6ED38LL);
    }
    *(void *)(((v6 + v5 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 8) = (a2 - 1);
LABEL_6:
    JUMPOUT(0x183B6ED40LL);
  }

  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v6);
}

uint64_t type metadata completion function for Publishers.AssertNoFailure.Inner()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.AssertNoFailure.Inner( uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8LL);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0
    || ((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 47) & 0xFFFFFFFFFFFFFFF8LL) + 15) & 0xFFFFFFFFFFFFFFF8LL) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }

  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unsigned int v10 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8LL);
    __int128 v11 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8LL);
    void *v10 = *v11;
    v10[1] = v11[1];
    unint64_t v12 = ((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v13 = ((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8LL;
    __int128 v14 = *(_OWORD *)v13;
    *(_BYTE *)(v12 + 16) = *(_BYTE *)(v13 + 16);
    *(_OWORD *)unint64_t v12 = v14;
    char v15 = (void *)(((unint64_t)v10 + 47) & 0xFFFFFFFFFFFFF8LL);
    uint64_t v16 = (void *)(((unint64_t)v11 + 47) & 0xFFFFFFFFFFFFF8LL);
    *char v15 = *v16;
    *(void *)(((unint64_t)v15 + 15) & 0xFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v16 + 15) & 0xFFFFFFFFFFFFF8LL);
    swift_bridgeObjectRetain();
  }

  return v4;
}

uint64_t destroy for Publishers.AssertNoFailure.Inner(uint64_t a1, uint64_t a2)
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Publishers.AssertNoFailure.Inner(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8LL);
  (*(void (**)(void))(v5 + 16))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8LL);
  int v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8LL);
  *int v7 = *v8;
  v7[1] = v8[1];
  unint64_t v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  char v11 = *(_BYTE *)(v10 + 16);
  *(_OWORD *)unint64_t v9 = *(_OWORD *)v10;
  *(_BYTE *)(v9 + 16) = v11;
  unint64_t v12 = (void *)(((unint64_t)v7 + 47) & 0xFFFFFFFFFFFFF8LL);
  unint64_t v13 = (void *)(((unint64_t)v8 + 47) & 0xFFFFFFFFFFFFF8LL);
  void *v12 = *v13;
  *(void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v13 + 15) & 0xFFFFFFFFFFFFF8LL);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Publishers.AssertNoFailure.Inner(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8LL);
  (*(void (**)(void))(v5 + 24))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8LL);
  int v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8LL);
  *int v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  *(void *)unint64_t v9 = *(void *)v10;
  *(void *)(v9 + 8) = *(void *)(v10 + 8);
  *(_BYTE *)(v9 + 16) = *(_BYTE *)(v10 + 16);
  char v11 = (void *)(((unint64_t)v7 + 47) & 0xFFFFFFFFFFFFF8LL);
  unint64_t v12 = (void *)(((unint64_t)v8 + 47) & 0xFFFFFFFFFFFFF8LL);
  void *v11 = *v12;
  *(void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFF8LL);
  return a1;
}

uint64_t initializeWithTake for Publishers.AssertNoFailure.Inner(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8LL);
  (*(void (**)(void))(v5 + 32))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  int v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8LL);
  int v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8LL);
  *int v7 = *v8;
  unint64_t v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  __int128 v11 = *(_OWORD *)v10;
  *(_BYTE *)(v9 + 16) = *(_BYTE *)(v10 + 16);
  *(_OWORD *)unint64_t v9 = v11;
  unint64_t v12 = (void *)(((unint64_t)v7 + 47) & 0xFFFFFFFFFFFFF8LL);
  unint64_t v13 = (void *)(((unint64_t)v8 + 47) & 0xFFFFFFFFFFFFF8LL);
  void *v12 = *v13;
  *(void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v13 + 15) & 0xFFFFFFFFFFFFF8LL);
  return a1;
}

uint64_t assignWithTake for Publishers.AssertNoFailure.Inner(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8LL);
  (*(void (**)(void))(v5 + 40))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8LL);
  int v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8LL);
  *int v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  unint64_t v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  *(void *)unint64_t v9 = *(void *)v10;
  *(void *)(v9 + 8) = *(void *)(v10 + 8);
  *(_BYTE *)(v9 + 16) = *(_BYTE *)(v10 + 16);
  __int128 v11 = (void *)(((unint64_t)v7 + 47) & 0xFFFFFFFFFFFFF8LL);
  unint64_t v12 = (void *)(((unint64_t)v8 + 47) & 0xFFFFFFFFFFFFF8LL);
  void *v11 = *v12;
  *(void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFF8LL) = *(void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFF8LL);
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.AssertNoFailure.Inner( uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v7 = *(void *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      unint64_t v12 = *(void *)(((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8LL) + 8);
      if (v12 >= 0xFFFFFFFF) {
        LODWORD(v12) = -1;
      }
      return (v12 + 1);
    }

    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }

  else
  {
    if (((((((((v7 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 47) & 0xFFFFFFFFFFFFFFF8LL) + 15) & 0xFFFFFFFFFFFFFFF8LL) + 8) & 0xFFFFFFF8) != 0) {
      unsigned int v8 = 2;
    }
    else {
      unsigned int v8 = a2 - v6 + 1;
    }
    if (v8 >= 0x10000) {
      unsigned int v9 = 4;
    }
    else {
      unsigned int v9 = 2;
    }
    if (v8 < 0x100) {
      unsigned int v9 = 1;
    }
    if (v8 >= 2) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0LL;
    }
    return ((uint64_t (*)(void))((char *)&loc_183B6F29C + 4 * byte_183BA4C57[v10]))();
  }

void storeEnumTagSinglePayload for Publishers.AssertNoFailure.Inner( unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 24) - 8LL);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v5 + 84);
  }
  if (v6 >= a3)
  {
    int v9 = 0u;
    if (a2 <= v6) {
      goto LABEL_17;
    }
  }

  else
  {
    if (((((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 47) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v7 = a3 - v6 + 1;
    }
    else {
      unsigned int v7 = 2;
    }
    if (v7 >= 0x10000) {
      int v8 = 4;
    }
    else {
      int v8 = 2;
    }
    if (v7 < 0x100) {
      int v8 = 1;
    }
    if (v7 >= 2) {
      int v9 = v8;
    }
    else {
      int v9 = 0;
    }
    if (a2 <= v6) {
LABEL_17:
    }
      __asm { BR              X12 }
  }

  if (((((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 47) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    unsigned int v10 = ~v6 + a2;
    bzero( a1,  ((((((*(void *)(v5 + 64) + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + 47) & 0xFFFFFFFFFFFFFFF8LL) + 15) & 0xFFFFFFFFFFFFFFF8LL)
    + 8);
    *a1 = v10;
  }

  __asm { BR              X10 }

void sub_183B6F424()
{
  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x183B6F49CLL);
}

void sub_183B6F42C(uint64_t a1, int a2)
{
  *(_DWORD *)(v2 + v3) = 0;
  if (a2) {
    JUMPOUT(0x183B6F434LL);
  }
  JUMPOUT(0x183B6F49CLL);
}

void sub_183B6F478()
{
  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x183B6F49CLL);
}

void sub_183B6F480()
{
  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x183B6F49CLL);
}

uint64_t sub_183B6F488(uint64_t a1, int a2, unsigned int a3)
{
  *(_WORD *)(v6 + (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v8, v2, v7) = 0;
  if (!a2) {
    goto LABEL_6;
  }
  if (a3 < 0x7FFFFFFF)
  {
    if (a2 < 0) {
      JUMPOUT(0x183B6F494LL);
    }
    *(void *)(((v6 + v5 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 8) = (a2 - 1);
LABEL_6:
    JUMPOUT(0x183B6F49CLL);
  }

  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v6);
}

void Publisher.drop<A>(untilOutputFrom:)( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v21 = a5;
  uint64_t v12 = *(void *)(a3 - 8);
  uint64_t v13 = MEMORY[0x1895F8858](a1);
  char v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1895F8858](v13);
  uint64_t v19 = (char *)&v20 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v6, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a1, a3);
  (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(a6, v19, a2);
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v24 = a4;
  uint64_t v25 = v21;
  type metadata accessor for Publishers.DropUntilOutput();
}

uint64_t sub_183B6F598(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v2 + *(int *)(a1 + 52), v3, v1);
}

void Publishers.DropUntilOutput.init(upstream:other:)( uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
}

uint64_t sub_183B6F628(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v1 - 8) + 32LL))( v3 + *(int *)(a1 + 52),  v2,  v1);
}

void type metadata accessor for Publishers.DropUntilOutput()
{
}

uint64_t Publishers.DropUntilOutput.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 16LL))(a2, v2);
}

uint64_t Publishers.DropUntilOutput.other.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) - 8LL) + 16LL))( a2,  v2 + *(int *)(a1 + 52));
}

void Publishers.DropUntilOutput.receive<A>(subscriber:)(uint64_t a1, uint64_t a2)
{
  v6[0] = a1;
  MEMORY[0x1895F8858](a1);
  (*(void (**)(char *))(v5 + 16))((char *)v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  v6[1] = v2 + *(int *)(a2 + 52);
  specialized Publishers.DropUntilOutput.Inner.__allocating_init(downstream:other:)();
}

void sub_183B6F748()
{
  *(void *)(v6 - 144) = v0;
  *(void *)(v6 - 136) = v4;
  *(void *)(v6 - 128) = v3;
  *(void *)(v6 - 120) = v4;
  *(void *)(v6 - 112) = v1;
  *(void *)(v6 - 104) = v5;
  *(void *)(v6 - 96) = v2;
  *(void *)(v6 - 88) = v5;
  type metadata accessor for Publishers.DropUntilOutput.Inner();
}

void sub_183B6F76C(uint64_t a1)
{
  *(void *)(v8 - 120) = a1;
  *(void *)(v8 - 112) = &protocol witness table for Publishers.DropUntilOutput<A, B>.Inner<A1, B1>;
  *(void *)(v8 - 144) = v3;
  int v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);
  swift_retain_n();
  v9(v8 - 144, v5, v4);
  __swift_destroy_boxed_opaque_existential_1(v8 - 144);
  *(void *)(v8 - 152) = v3;
  *(void *)(v8 - 144) = v1;
  *(void *)(v8 - 136) = v6;
  *(void *)(v8 - 128) = v5;
  *(void *)(v8 - 120) = v6;
  *(void *)(v8 - 112) = v2;
  *(void *)(v8 - 104) = v7;
  *(void *)(v8 - 96) = v4;
  *(void *)(v8 - 88) = v7;
  type metadata accessor for Publishers.DropUntilOutput.Inner.OtherSubscriber();
}

uint64_t sub_183B6F7CC(uint64_t a1)
{
  uint64_t v9 = MEMORY[0x186E22960]( &protocol conformance descriptor for Publishers.DropUntilOutput<A, B>.Inner<A1, B1>.OtherSubscriber,  a1);
  Publisher.subscribe<A>(_:)(v7 - 152, v5, a1, v6, v9);
  *(void *)(v7 - 144) = v3;
  uint64_t v10 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.DropUntilOutput<A, B>.Inner<A1, B1>, v4);
  Publisher.subscribe<A>(_:)(v7 - 144, v1, v4, v2, v10);
  return swift_release_n();
}

void Publishers.DropUntilOutput.Inner.playgroundDescription.getter(void *a1@<X8>)
{
  a1[3] = MEMORY[0x189617FA8];
  *a1 = 0x69746E55706F7244LL;
  a1[1] = 0xEF74757074754F6CLL;
}

uint64_t *Publishers.DropUntilOutput.Inner.deinit()
{
  uint64_t v1 = *v0;
  MEMORY[0x186E22A2C](*(uint64_t *)((char *)v0 + *(void *)(*v0 + 160)), -1LL, -1LL);
  MEMORY[0x186E22A2C](*(uint64_t *)((char *)v0 + *(void *)(*v0 + 168)), -1LL, -1LL);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 96) - 8LL) + 8LL))((uint64_t)v0 + *(void *)(*v0 + 144));
  outlined destroy of Subscription?((uint64_t)v0 + *(void *)(*v0 + 176));
  outlined destroy of Subscription?((uint64_t)v0 + *(void *)(*v0 + 192));
  return v0;
}

uint64_t Publishers.DropUntilOutput.Inner.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t Publishers.DropUntilOutput.Inner.cancel()()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + *(void *)(*(void *)v0 + 160LL));
  os_unfair_lock_lock(v1);
  uint64_t v2 = v0 + *(void *)(*(void *)v0 + 176LL);
  swift_beginAccess();
  outlined init with copy of Subscription?(v2, (uint64_t)v15);
  uint64_t v3 = v0 + *(void *)(*(void *)v0 + 192LL);
  swift_beginAccess();
  outlined init with copy of Subscription?(v3, (uint64_t)v14);
  uint64_t v13 = 0LL;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  swift_beginAccess();
  outlined assign with take of Subscription?((uint64_t)&v11, v2);
  swift_endAccess();
  uint64_t v13 = 0LL;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  swift_beginAccess();
  outlined assign with take of Subscription?((uint64_t)&v11, v3);
  swift_endAccess();
  *(_BYTE *)(v0 + *(void *)(*(void *)v0 + 208LL)) = 1;
  os_unfair_lock_unlock(v1);
  outlined init with copy of Subscription?((uint64_t)v15, (uint64_t)&v9);
  if (v10)
  {
    outlined init with take of Subscription(&v9, (uint64_t)&v11);
    uint64_t v4 = *((void *)&v12 + 1);
    uint64_t v5 = v13;
    __swift_project_boxed_opaque_existential_1(&v11, *((uint64_t *)&v12 + 1));
    (*(void (**)(uint64_t))(*(void *)(v5 + 8) + 8LL))(v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);
  }

  else
  {
    outlined destroy of Subscription?((uint64_t)&v9);
  }

  outlined init with copy of Subscription?((uint64_t)v14, (uint64_t)&v9);
  if (v10)
  {
    outlined init with take of Subscription(&v9, (uint64_t)&v11);
    uint64_t v6 = *((void *)&v12 + 1);
    uint64_t v7 = v13;
    __swift_project_boxed_opaque_existential_1(&v11, *((uint64_t *)&v12 + 1));
    (*(void (**)(uint64_t))(*(void *)(v7 + 8) + 8LL))(v6);
    outlined destroy of Subscription?((uint64_t)v14);
    outlined destroy of Subscription?((uint64_t)v15);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);
  }

  else
  {
    outlined destroy of Subscription?((uint64_t)v14);
    outlined destroy of Subscription?((uint64_t)v15);
    return outlined destroy of Subscription?((uint64_t)&v9);
  }

void Publishers.DropUntilOutput.Inner.request(_:)(uint64_t a1)
{
  uint64_t v3 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(*v1 + 160));
  os_unfair_lock_lock(v3);
  uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(*v1 + 184);
  uint64_t v6 = *(uint64_t *)((char *)v1 + v5);
  unint64_t v7 = 0x8000000000000000LL;
  if (v6 == 0x8000000000000000LL) {
    goto LABEL_9;
  }
  if (a1 != 0x8000000000000000LL)
  {
    if ((v6 | a1) < 0)
    {
      __break(1u);
      goto LABEL_14;
    }

    unint64_t v7 = v6 + a1;
    if (!__OFADD__(v6, a1))
    {
      if ((v7 & 0x8000000000000000LL) == 0) {
        goto LABEL_8;
      }
LABEL_14:
      __break(1u);
      return;
    }

    unint64_t v7 = 0x8000000000000000LL;
  }

void Publishers.DropUntilOutput.Inner.receive(subscription:)(void *a1)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + *(void *)(*(void *)v1 + 160LL));
  os_unfair_lock_lock(v3);
  uint64_t v4 = v1 + *(void *)(*(void *)v1 + 176LL);
  swift_beginAccess();
  outlined init with copy of Subscription?(v4, (uint64_t)v11);
  uint64_t v5 = v12;
  outlined destroy of Subscription?((uint64_t)v11);
  if (!v5 && (*(_BYTE *)(v1 + *(void *)(*(void *)v1 + 208LL)) & 1) == 0)
  {
    outlined init with copy of Subscription((uint64_t)a1, (uint64_t)v11);
    swift_beginAccess();
    outlined assign with take of Subscription?((uint64_t)v11, v4);
    swift_endAccess();
    uint64_t v8 = *(void *)(v1 + *(void *)(*(void *)v1 + 184LL));
    if (v8 != 0x8000000000000000LL)
    {
      if (v8 < 0)
      {
        __break(1u);
        return;
      }

      if (!v8)
      {
        os_unfair_lock_unlock(v3);
        return;
      }
    }

    os_unfair_lock_unlock(v3);
    uint64_t v9 = a1[3];
    uint64_t v10 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v9);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24))(v8, v9, v10);
    return;
  }

  os_unfair_lock_unlock(v3);
  uint64_t v7 = a1[3];
  uint64_t v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  (*(void (**)(uint64_t))(*(void *)(v6 + 8) + 8LL))(v7);
}

void Publishers.DropUntilOutput.Inner.receive(_:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(*v1 + 160));
  os_unfair_lock_lock(v4);
  uint64_t v5 = *v1;
  if (*((_BYTE *)v1 + *(void *)(*v1 + 152)) == 1 && (*((_BYTE *)v1 + *(void *)(v5 + 208)) & 1) == 0)
  {
    os_unfair_lock_unlock(v4);
    os_unfair_recursive_lock_lock_with_options();
    (*(void (**)(uint64_t, void))(*(void *)(v3 + 128) + 48LL))(a1, *(void *)(v3 + 96));
    os_unfair_recursive_lock_unlock();
  }

  else
  {
    uint64_t v6 = *(void *)(v5 + 184);
    uint64_t v7 = *(uint64_t *)((char *)v1 + v6);
    if (v7 == 0x8000000000000000LL)
    {
LABEL_7:
      os_unfair_lock_unlock(v4);
      return;
    }

    if (v7 < 0)
    {
      __break(1u);
    }

    else if (v7)
    {
      *(uint64_t *)((char *)v1 + (*(void (**)(uint64_t, void, uint64_t))(v4 + 16))(v7, *(void *)(v9 - 120), v6) = v7 - 1;
      goto LABEL_7;
    }

    __break(1u);
  }

void Publishers.DropUntilOutput.Inner.receive(completion:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(*v1 + 160));
  os_unfair_lock_lock(v4);
  uint64_t v5 = *(void *)(*v1 + 208);
  if ((*((_BYTE *)v1 + v5) & 1) != 0)
  {
    os_unfair_lock_unlock(v4);
  }

  else
  {
    *((_BYTE *)v1 + (*(void (**)(uint64_t, void, uint64_t))(v1 + 16))(v9, *(void *)(v10 - 128), v5) = 1;
    os_unfair_lock_unlock(v4);
    os_unfair_recursive_lock_lock_with_options();
    (*(void (**)(uint64_t, void))(*(void *)(v3 + 128) + 56LL))(a1, *(void *)(v3 + 96));
    os_unfair_recursive_lock_unlock();
  }

void Publishers.DropUntilOutput.Inner.OtherSubscriber.combineIdentifier.getter()
{
}

void sub_183B6FF54()
{
}

uint64_t Publishers.DropUntilOutput.Inner.OtherSubscriber.customMirror.getter()
{
  return Publishers.Multicast.Inner.customMirror.getter();
}

uint64_t Publishers.DropUntilOutput.Inner.OtherSubscriber.receive(subscription:)(void *a1)
{
  return Publishers.DropUntilOutput.Inner.receiveOther(subscription:)(a1);
}

uint64_t Publishers.DropUntilOutput.Inner.receiveOther(subscription:)(void *a1)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 192LL);
  swift_beginAccess();
  outlined init with copy of Subscription?(v3, (uint64_t)v10);
  uint64_t v4 = v11;
  outlined destroy of Subscription?((uint64_t)v10);
  if (v4)
  {
    uint64_t v6 = a1[3];
    uint64_t v5 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v6);
    return (*(uint64_t (**)(uint64_t))(*(void *)(v5 + 8) + 8LL))(v6);
  }

  else
  {
    outlined init with copy of Subscription((uint64_t)a1, (uint64_t)v10);
    swift_beginAccess();
    outlined assign with take of Subscription?((uint64_t)v10, v3);
    swift_endAccess();
    uint64_t v8 = a1[3];
    uint64_t v9 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 24))(1LL, v8, v9);
  }

uint64_t Publishers.DropUntilOutput.Inner.receiveOther()()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + *(void *)(*(void *)v0 + 160LL));
  os_unfair_lock_lock(v1);
  *(_BYTE *)(v0 + *(void *)(*(void *)v0 + 152LL)) = 1;
  uint64_t v5 = 0LL;
  memset(v4, 0, sizeof(v4));
  uint64_t v2 = v0 + *(void *)(*(void *)v0 + 192LL);
  swift_beginAccess();
  outlined assign with take of Subscription?((uint64_t)v4, v2);
  swift_endAccess();
  os_unfair_lock_unlock(v1);
  return 0LL;
}

void Publishers.DropUntilOutput.Inner.OtherSubscriber.receive(completion:)(uint64_t a1)
{
}

void Publishers.DropUntilOutput.Inner.receiveOther(completion:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(*v1 + 160));
  os_unfair_lock_lock(v5);
  uint64_t v6 = *v2;
  if (*((_BYTE *)v2 + *(void *)(*v2 + 152)) == 1)
  {
    uint64_t v16 = 0LL;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v7 = (uint64_t)v2 + *(void *)(v6 + 192);
    swift_beginAccess();
    outlined assign with take of Subscription?((uint64_t)&v14, v7);
    swift_endAccess();
    os_unfair_lock_unlock(v5);
  }

  else
  {
    *((_BYTE *)v2 + *(void *)(v6 + 200)) = 1;
    uint64_t v8 = (uint64_t)v2 + *(void *)(*v2 + 176);
    swift_beginAccess();
    outlined init with copy of Subscription?(v8, (uint64_t)&v11);
    if (*((void *)&v12 + 1))
    {
      outlined init with take of Subscription(&v11, (uint64_t)&v14);
      uint64_t v13 = 0LL;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      swift_beginAccess();
      outlined assign with take of Subscription?((uint64_t)&v11, v8);
      swift_endAccess();
      os_unfair_lock_unlock(v5);
      uint64_t v10 = *((void *)&v15 + 1);
      uint64_t v9 = v16;
      __swift_project_boxed_opaque_existential_1(&v14, *((uint64_t *)&v15 + 1));
      (*(void (**)(uint64_t))(*(void *)(v9 + 8) + 8LL))(v10);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
    }

    else
    {
      outlined destroy of Subscription?((uint64_t)&v11);
      os_unfair_lock_unlock(v5);
    }

    os_unfair_recursive_lock_lock_with_options();
    (*(void (**)(uint64_t, void))(*(void *)(v4 + 128) + 56LL))(a1, *(void *)(v4 + 96));
    os_unfair_recursive_lock_unlock();
  }

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>.OtherSubscriber( void *a1)
{
  return Publishers.DropUntilOutput.Inner.OtherSubscriber.receive(subscription:)(a1);
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>.OtherSubscriber()
{
  return specialized Publishers.DropUntilOutput.Inner.OtherSubscriber.receive(_:)();
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>.OtherSubscriber( uint64_t a1)
{
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>.OtherSubscriber()
{
  return 0x69746E55706F7244LL;
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>.OtherSubscriber()
{
  return Publishers.DropUntilOutput.Inner.OtherSubscriber.customMirror.getter();
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>.OtherSubscriber( void *a1@<X8>)
{
}

void protocol witness for CustomCombineIdentifierConvertible.combineIdentifier.getter in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>.OtherSubscriber()
{
}

  ;
}

void protocol witness for Subscriber.receive(subscription:) in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>( void *a1)
{
}

void protocol witness for Subscriber.receive(_:) in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>( uint64_t a1)
{
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>( uint64_t a1)
{
}

void protocol witness for Subscription.request(_:) in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>( uint64_t a1)
{
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>( void *a1@<X8>)
{
}

uint64_t protocol witness for Cancellable.cancel() in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>()
{
  return Publishers.DropUntilOutput.Inner.cancel()();
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.DropUntilOutput<A, B>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void static Publishers.DropUntilOutput<>.== infix(_:_:)()
{
}

uint64_t sub_183B70594(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = MEMORY[0x1895F8858](a1);
  uint64_t v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  MEMORY[0x1895F8858](v5);
  uint64_t v9 = &v15[-v8];
  char v10 = dispatch thunk of static Equatable.== infix(_:_:)();
  __int128 v11 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16);
  v11(v9, v2, a1);
  v11(v7, v1, a1);
  if ((v10 & 1) != 0) {
    char v12 = dispatch thunk of static Equatable.== infix(_:_:)();
  }
  else {
    char v12 = 0;
  }
  uint64_t v13 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v13(v7, a1);
  v13(v9, a1);
  return v12 & 1;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.DropUntilOutput<A, B>()
{
  static Publishers.DropUntilOutput<>.== infix(_:_:)();
}

uint64_t specialized Publishers.DropUntilOutput.Inner.OtherSubscriber.receive(_:)()
{
  return Publishers.DropUntilOutput.Inner.receiveOther()();
}

uint64_t *specialized Publishers.DropUntilOutput.Inner.init(downstream:other:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  *((_BYTE *)v1 + *(void *)(*v1 + 152)) = 0;
  uint64_t v4 = *(void *)(*v1 + 160);
  uint64_t v5 = (_DWORD *)swift_slowAlloc();
  *uint64_t v5 = 0;
  *(uint64_t *)((char *)v1 + (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v4 - 8) + 16LL))(v3, *(void *)(v6 - 152), v4) = (uint64_t)v5;
  uint64_t v6 = *(void *)(*v1 + 168);
  uint64_t v7 = (void *)swift_slowAlloc();
  *uint64_t v7 = 0LL;
  *(uint64_t *)((char *)v1 + (*(void (**)(uint64_t, void, uint64_t))(v4 + 16))(v7, *(void *)(v9 - 120), v6) = (uint64_t)v7;
  uint64_t v8 = (uint64_t)v1 + *(void *)(*v1 + 176);
  *(void *)(v8 + 32) = 0LL;
  *(_OWORD *)uint64_t v8 = 0u;
  *(_OWORD *)(v8 + 16) = 0u;
  *(uint64_t *)((char *)v1 + *(void *)(*v1 + 184)) = 0LL;
  uint64_t v9 = (uint64_t)v1 + *(void *)(*v1 + 192);
  *(_OWORD *)uint64_t v9 = 0u;
  *(_OWORD *)(v9 + 16) = 0u;
  *(void *)(v9 + 32) = 0LL;
  *((_BYTE *)v1 + *(void *)(*v1 + 200)) = 0;
  *((_BYTE *)v1 + *(void *)(*v1 + 208)) = 0;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 96) - 8LL) + 32LL))( (uint64_t)v1 + *(void *)(*v1 + 144),  a1);
  return v1;
}

void specialized Publishers.DropUntilOutput.Inner.__allocating_init(downstream:other:)()
{
}

uint64_t *sub_183B707CC()
{
  return specialized Publishers.DropUntilOutput.Inner.init(downstream:other:)(v0);
}

void type metadata accessor for Publishers.DropUntilOutput.Inner()
{
}

void type metadata accessor for Publishers.DropUntilOutput.Inner.OtherSubscriber()
{
}

uint64_t getEnumTagSinglePayload for Publishers.DropUntilOutput(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8LL);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= v5) {
    unsigned int v8 = *(_DWORD *)(v4 + 84);
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = *(void *)(v4 + 64) + v9;
  unsigned int v11 = a2 - v8;
  if (a2 <= v8) {
    goto LABEL_23;
  }
  uint64_t v12 = (v10 & ~v9) + *(void *)(v6 + 64);
  char v13 = 8 * v12;
  if (v12 <= 3)
  {
    unsigned int v15 = ((v11 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v15))
    {
      int v14 = *(_DWORD *)(a1 + v12);
      if (!v14) {
        goto LABEL_23;
      }
      goto LABEL_14;
    }

    if (v15 > 0xFF)
    {
      int v14 = *(unsigned __int16 *)(a1 + v12);
      if (!*(_WORD *)(a1 + v12)) {
        goto LABEL_23;
      }
      goto LABEL_14;
    }

    if (v15 < 2)
    {
LABEL_23:
      if (v8)
      {
        if (v5 >= v7) {
          return (*(uint64_t (**)(void))(v4 + 48))();
        }
        else {
          return (*(uint64_t (**)(uint64_t))(v6 + 48))((v10 + a1) & ~v9);
        }
      }

      return 0LL;
    }
  }

  int v14 = *(unsigned __int8 *)(a1 + v12);
  if (!*(_BYTE *)(a1 + v12)) {
    goto LABEL_23;
  }
LABEL_14:
  int v16 = (v14 - 1) << v13;
  if (!(_DWORD)v12) {
    return v8 + v16 + 1;
  }
  else {
    int v17 = 4;
  }
  return ((uint64_t (*)(void))((char *)&loc_183B708E8 + 4 * byte_183BA4DB8[v17 - 1]))();
}

void storeEnumTagSinglePayload for Publishers.DropUntilOutput( _WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 16) - 8LL);
  uint64_t v6 = *(void *)(*(void *)(a4 + 24) - 8LL);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84)) {
    unsigned int v7 = *(_DWORD *)(v5 + 84);
  }
  else {
    unsigned int v7 = *(_DWORD *)(v6 + 84);
  }
  if (a3 > v7)
  {
    if (v8 <= 3)
    {
      unsigned int v11 = ((a3 - v7 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v11))
      {
        unsigned int v9 = 4u;
      }

      else if (v11 >= 0x100)
      {
        unsigned int v9 = 2;
      }

      else
      {
        unsigned int v9 = v11 > 1;
      }
    }

    else
    {
      unsigned int v9 = 1u;
    }
  }

  else
  {
    unsigned int v9 = 0u;
  }

  if (v7 < a2)
  {
    unsigned int v10 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        int v12 = v10 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v12;
          *((_BYTE *)a1 + 2) = BYTE2(v12);
        }

        else if ((_DWORD)v8 == 2)
        {
          *a1 = v12;
        }

        else
        {
          *(_BYTE *)a1 = v12;
        }
      }
    }

    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v10;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X16 }

uint64_t type metadata completion function for Publishers.DropUntilOutput.Inner()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t Publisher.handleEvents(receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v43 = a7;
  uint64_t v44 = a8;
  uint64_t v41 = a5;
  uint64_t v42 = a6;
  uint64_t v35 = a3;
  uint64_t v36 = a1;
  uint64_t v39 = a4;
  uint64_t v40 = a11;
  uint64_t v37 = a2;
  uint64_t v38 = a10;
  uint64_t v15 = *(void *)(a12 - 8);
  MEMORY[0x1895F8858](a1);
  int v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v18, a12);
  uint64_t v20 = (int *)type metadata accessor for Publishers.HandleEvents(0LL, a12, a13, v19);
  uint64_t v21 = (uint64_t *)(a9 + v20[9]);
  uint64_t v22 = (uint64_t *)(a9 + v20[10]);
  uint64_t v23 = (uint64_t *)(a9 + v20[11]);
  uint64_t v24 = (uint64_t *)(a9 + v20[12]);
  uint64_t v25 = (uint64_t *)(a9 + v20[13]);
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(a9, v17, a12);
  uint64_t v26 = v36;
  uint64_t v27 = v37;
  *uint64_t v21 = v36;
  v21[1] = v27;
  *uint64_t v22 = a3;
  uint64_t v28 = v38;
  v22[1] = v39;
  uint64_t v30 = v41;
  uint64_t v29 = v42;
  *uint64_t v23 = v41;
  v23[1] = v29;
  uint64_t v32 = v43;
  uint64_t v31 = v44;
  uint64_t *v24 = v43;
  v24[1] = v31;
  uint64_t v33 = v40;
  *uint64_t v25 = v28;
  v25[1] = v33;
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v26);
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v35);
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v30);
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v32);
  return outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v28);
}

uint64_t Publishers.HandleEvents.init(upstream:receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v18 = (int *)type metadata accessor for Publishers.HandleEvents(0LL, a13, a14, a4);
  uint64_t v19 = (void *)(a9 + v18[9]);
  uint64_t v20 = (uint64_t *)(a9 + v18[10]);
  uint64_t v21 = (void *)(a9 + v18[11]);
  uint64_t v22 = (void *)(a9 + v18[12]);
  uint64_t v23 = (void *)(a9 + v18[13]);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a13 - 8) + 32LL))(a9, a1, a13);
  *uint64_t v19 = a2;
  v19[1] = a3;
  *uint64_t v20 = a4;
  v20[1] = a5;
  *uint64_t v21 = a6;
  v21[1] = a7;
  *uint64_t v22 = a8;
  v22[1] = a10;
  *uint64_t v23 = a11;
  v23[1] = a12;
  return result;
}

uint64_t type metadata accessor for Publishers.HandleEvents(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for Publishers.HandleEvents);
}

uint64_t Publishers.HandleEvents.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 16LL))(a2, v2);
}

uint64_t key path getter for Publishers.HandleEvents.receiveSubscription : <A>Publishers.HandleEvents<A>@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (**a5)(uint64_t a1)@<X8>)
{
  uint64_t v6 = (uint64_t *)(a1
                 + *(int *)(type metadata accessor for Publishers.HandleEvents( 0LL,  *(void *)(a3 + a2 - 16),  *(void *)(a3 + a2 - 8),  a4)
                          + 36));
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  if (*v6)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    *(void *)(v9 + 24) = v8;
    unsigned int v10 = _s7Combine12Subscription_pytIegnr_AaB_pIegn_TRTA_0;
  }

  else
  {
    unsigned int v10 = 0LL;
    uint64_t v9 = 0LL;
  }

  *a5 = v10;
  a5[1] = (uint64_t (*)(uint64_t))v9;
  return outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v7);
}

uint64_t key path setter for Publishers.HandleEvents.receiveSubscription : <A>Publishers.HandleEvents<A>( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 + a3 - 16);
  uint64_t v6 = *(void *)(a4 + a3 - 8);
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  if (*a1)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    *(void *)(v9 + 24) = v8;
    unsigned int v10 = _s7Combine12Subscription_pytIegnr_AaB_pIegn_TRTA_0;
  }

  else
  {
    unsigned int v10 = 0LL;
    uint64_t v9 = 0LL;
  }

  unsigned int v11 = (uint64_t *)(a2 + *(int *)(type metadata accessor for Publishers.HandleEvents(0LL, v5, v6, a4) + 36));
  uint64_t v12 = *v11;
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v7);
  uint64_t result = _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v12);
  uint64_t *v11 = (uint64_t)v10;
  v11[1] = v9;
  return result;
}

uint64_t Publishers.HandleEvents.receiveSubscription.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 36));
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v2);
  return v2;
}

uint64_t Publishers.HandleEvents.receiveSubscription.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (uint64_t *)(v3 + *(int *)(a3 + 36));
  uint64_t result = _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(*v6);
  *uint64_t v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*Publishers.HandleEvents.receiveSubscription.modify())()
{
  return specialized closure #1 in Publisher.multicast<A>(subject:);
}

uint64_t key path getter for Publishers.HandleEvents.receiveOutput : <A>Publishers.HandleEvents<A>@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (**a5)()@<X8>)
{
  uint64_t v6 = *(void *)(a3 + a2 - 16);
  uint64_t v7 = *(void *)(a3 + a2 - 8);
  uint64_t v8 = (uint64_t *)(a1 + *(int *)(type metadata accessor for Publishers.HandleEvents(0LL, v6, v7, a4) + 40));
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  if (*v8)
  {
    unsigned int v11 = (uint64_t (*)())swift_allocObject();
    *((void *)v11 + 2) = v6;
    *((void *)v11 + 3) = v7;
    *((void *)v11 + 4) = v9;
    *((void *)v11 + 5) = v10;
    uint64_t v12 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Publisher.Output) -> (@out ());
  }

  else
  {
    uint64_t v12 = 0LL;
    unsigned int v11 = 0LL;
  }

  *a5 = v12;
  a5[1] = v11;
  return outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v9);
}

uint64_t key path setter for Publishers.HandleEvents.receiveOutput : <A>Publishers.HandleEvents<A>( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 + a3 - 16);
  uint64_t v6 = *(void *)(a4 + a3 - 8);
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  if (*a1)
  {
    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = v5;
    void v9[3] = v6;
    v9[4] = v7;
    v9[5] = v8;
    uint64_t v10 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Publisher.Output) -> (@out ());
  }

  else
  {
    uint64_t v10 = 0LL;
    uint64_t v9 = 0LL;
  }

  unsigned int v11 = (uint64_t *)(a2 + *(int *)(type metadata accessor for Publishers.HandleEvents(0LL, v5, v6, a4) + 40));
  uint64_t v12 = *v11;
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v7);
  uint64_t result = _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v12);
  uint64_t *v11 = (uint64_t)v10;
  v11[1] = (uint64_t)v9;
  return result;
}

uint64_t Publishers.HandleEvents.receiveOutput.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 40));
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v2);
  return v2;
}

uint64_t Publishers.HandleEvents.receiveOutput.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (uint64_t *)(v3 + *(int *)(a3 + 40));
  uint64_t result = _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(*v6);
  *uint64_t v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*Publishers.HandleEvents.receiveOutput.modify())()
{
  return specialized closure #1 in Publisher.multicast<A>(subject:);
}

uint64_t key path getter for Publishers.HandleEvents.receiveCompletion : <A>Publishers.HandleEvents<A>@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (**a5)()@<X8>)
{
  uint64_t v6 = *(void *)(a3 + a2 - 16);
  uint64_t v7 = *(void *)(a3 + a2 - 8);
  uint64_t v8 = (uint64_t *)(a1 + *(int *)(type metadata accessor for Publishers.HandleEvents(0LL, v6, v7, a4) + 44));
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  if (*v8)
  {
    unsigned int v11 = (uint64_t (*)())swift_allocObject();
    *((void *)v11 + 2) = v6;
    *((void *)v11 + 3) = v7;
    *((void *)v11 + 4) = v9;
    *((void *)v11 + 5) = v10;
    uint64_t v12 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Subscribers.Completion<A.Publisher.Failure>) -> ();
  }

  else
  {
    uint64_t v12 = 0LL;
    unsigned int v11 = 0LL;
  }

  *a5 = v12;
  a5[1] = v11;
  return outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v9);
}

uint64_t key path setter for Publishers.HandleEvents.receiveCompletion : <A>Publishers.HandleEvents<A>( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 + a3 - 16);
  uint64_t v6 = *(void *)(a4 + a3 - 8);
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  if (*a1)
  {
    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = v5;
    void v9[3] = v6;
    v9[4] = v7;
    v9[5] = v8;
    uint64_t v10 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Subscribers.Completion<A.Publisher.Failure>) -> ();
  }

  else
  {
    uint64_t v10 = 0LL;
    uint64_t v9 = 0LL;
  }

  unsigned int v11 = (uint64_t *)(a2 + *(int *)(type metadata accessor for Publishers.HandleEvents(0LL, v5, v6, a4) + 44));
  uint64_t v12 = *v11;
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v7);
  uint64_t result = _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v12);
  uint64_t *v11 = (uint64_t)v10;
  v11[1] = (uint64_t)v9;
  return result;
}

uint64_t Publishers.HandleEvents.receiveCompletion.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 44));
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v2);
  return v2;
}

uint64_t Publishers.HandleEvents.receiveCompletion.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (uint64_t *)(v3 + *(int *)(a3 + 44));
  uint64_t result = _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(*v6);
  *uint64_t v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*Publishers.HandleEvents.receiveCompletion.modify())()
{
  return specialized closure #1 in Publisher.multicast<A>(subject:);
}

uint64_t key path getter for Publishers.HandleEvents.receiveCancel : <A>Publishers.HandleEvents<A>@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (**a5)()@<X8>)
{
  uint64_t v6 = (uint64_t *)(a1
                 + *(int *)(type metadata accessor for Publishers.HandleEvents( 0LL,  *(void *)(a3 + a2 - 16),  *(void *)(a3 + a2 - 8),  a4)
                          + 48));
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  if (*v6)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    *(void *)(v9 + 24) = v8;
    uint64_t v10 = partial apply for thunk for @escaping @callee_guaranteed () -> ();
  }

  else
  {
    uint64_t v10 = 0LL;
    uint64_t v9 = 0LL;
  }

  *a5 = v10;
  a5[1] = (uint64_t (*)())v9;
  return outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v7);
}

uint64_t key path setter for Publishers.HandleEvents.receiveCancel : <A>Publishers.HandleEvents<A>( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 + a3 - 16);
  uint64_t v6 = *(void *)(a4 + a3 - 8);
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  if (*a1)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    *(void *)(v9 + 24) = v8;
    uint64_t v10 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Subscription) -> (@out ());
  }

  else
  {
    uint64_t v10 = 0LL;
    uint64_t v9 = 0LL;
  }

  unsigned int v11 = (uint64_t *)(a2 + *(int *)(type metadata accessor for Publishers.HandleEvents(0LL, v5, v6, a4) + 48));
  uint64_t v12 = *v11;
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v7);
  uint64_t result = _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v12);
  uint64_t *v11 = (uint64_t)v10;
  v11[1] = v9;
  return result;
}

uint64_t Publishers.HandleEvents.receiveCancel.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 48));
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v2);
  return v2;
}

uint64_t Publishers.HandleEvents.receiveCancel.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (uint64_t *)(v3 + *(int *)(a3 + 48));
  uint64_t result = _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(*v6);
  *uint64_t v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*Publishers.HandleEvents.receiveCancel.modify())()
{
  return specialized closure #1 in Publisher.multicast<A>(subject:);
}

uint64_t key path getter for Publishers.HandleEvents.receiveRequest : <A>Publishers.HandleEvents<A>@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v6 = (uint64_t *)(a1
                 + *(int *)(type metadata accessor for Publishers.HandleEvents( 0LL,  *(void *)(a3 + a2 - 16),  *(void *)(a3 + a2 - 8),  a4)
                          + 52));
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  if (*v6)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    *(void *)(v9 + 24) = v8;
    uint64_t v10 = partial apply for thunk for @escaping @callee_guaranteed (@unowned Subscribers.Demand) -> ();
  }

  else
  {
    uint64_t v10 = 0LL;
    uint64_t v9 = 0LL;
  }

  *a5 = v10;
  a5[1] = v9;
  return outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v7);
}

uint64_t key path setter for Publishers.HandleEvents.receiveRequest : <A>Publishers.HandleEvents<A>( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 + a3 - 16);
  uint64_t v6 = *(void *)(a4 + a3 - 8);
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  if (*a1)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    *(void *)(v9 + 24) = v8;
    uint64_t v10 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Subscribers.Demand) -> (@out ());
  }

  else
  {
    uint64_t v10 = 0LL;
    uint64_t v9 = 0LL;
  }

  unsigned int v11 = (uint64_t *)(a2 + *(int *)(type metadata accessor for Publishers.HandleEvents(0LL, v5, v6, a4) + 52));
  uint64_t v12 = *v11;
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v7);
  uint64_t result = _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v12);
  uint64_t *v11 = (uint64_t)v10;
  v11[1] = v9;
  return result;
}

uint64_t Publishers.HandleEvents.receiveRequest.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 52));
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v2);
  return v2;
}

uint64_t Publishers.HandleEvents.receiveRequest.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (uint64_t *)(v3 + *(int *)(a3 + 52));
  uint64_t result = _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(*v6);
  *uint64_t v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*Publishers.HandleEvents.receiveRequest.modify())()
{
  return specialized closure #1 in Publisher.multicast<A>(subject:);
}

void Publishers.HandleEvents.receive<A>(subscriber:)(uint64_t a1)
{
}

uint64_t sub_183B71790(uint64_t a1)
{
  *(void *)(v8 - 96) = specialized Publishers.HandleEvents.Inner.init(downstream:events:)(v4, v1);
  uint64_t v10 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.HandleEvents<A>.Inner<A1>, a1);
  Publisher.subscribe<A>(_:)(v8 - 96, v5, a1, v6, v10);
  return swift_release();
}

void type metadata accessor for Publishers.HandleEvents.Inner()
{
}

void Publishers.HandleEvents.Inner.playgroundDescription.getter(uint64_t a1@<X8>)
{
  *(void *)(a1 + 24) = MEMORY[0x189617FA8];
  strcpy((char *)a1, "HandleEvents");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

char *Publishers.HandleEvents.Inner.deinit()
{
  uint64_t v1 = *(void *)v0;
  MEMORY[0x186E22A2C](*((void *)v0 + 8), -1LL, -1LL);
  outlined destroy of SubscriptionStatus((uint64_t)(v0 + 16));
  _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(*((void *)v0 + 9));
  _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(*((void *)v0 + 11));
  _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(*((void *)v0 + 13));
  _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(*((void *)v0 + 15));
  _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(*((void *)v0 + 17));
  (*(void (**)(char *))(*(void *)(*(void *)(v1 + 88) - 8LL) + 8LL))(&v0[*(void *)(*(void *)v0 + 168LL)]);
  return v0;
}

uint64_t Publishers.HandleEvents.Inner.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void Publishers.HandleEvents.Inner.cancel()()
{
  uint64_t v1 = (os_unfair_lock_s *)v0[8];
  os_unfair_lock_lock(v1);
  uint64_t v2 = (void (*)(void))v0[15];
  if (v2)
  {
    swift_retain();
    os_unfair_lock_unlock(v1);
    v2();
    os_unfair_lock_lock(v1);
    _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe((uint64_t)v2);
  }

  swift_beginAccess();
  outlined init with copy of SubscriptionStatus((uint64_t)(v0 + 2), (uint64_t)&v10);
  if (v13)
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v10);
    os_unfair_lock_unlock(v1);
  }

  else
  {
    outlined init with take of Subscription((__int128 *)&v10, (uint64_t)v14);
    uint64_t v3 = v0[9];
    v0[9] = 0LL;
    v0[10] = 0LL;
    _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v3);
    uint64_t v4 = v0[11];
    v0[11] = 0LL;
    v0[12] = 0LL;
    _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v4);
    uint64_t v5 = v0[13];
    v0[13] = 0LL;
    v0[14] = 0LL;
    _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v5);
    uint64_t v6 = v0[15];
    v0[15] = 0LL;
    v0[16] = 0LL;
    _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v6);
    uint64_t v7 = v0[17];
    v0[17] = 0LL;
    v0[18] = 0LL;
    _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v7);
    uint64_t v10 = 1LL;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    char v13 = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v10, (uint64_t)(v0 + 2));
    swift_endAccess();
    os_unfair_lock_unlock(v1);
    uint64_t v8 = v15;
    uint64_t v9 = v16;
    __swift_project_boxed_opaque_existential_1(v14, v15);
    (*(void (**)(uint64_t))(*(void *)(v9 + 8) + 8LL))(v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  }

void Publishers.HandleEvents.Inner.request(_:)(uint64_t a1)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 64);
  os_unfair_lock_lock(v3);
  uint64_t v4 = *(void (**)(uint64_t))(v1 + 136);
  if (v4)
  {
    swift_retain();
    os_unfair_lock_unlock(v3);
    v4(a1);
    os_unfair_lock_lock(v3);
    _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe((uint64_t)v4);
  }

  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v1 + 16, (uint64_t)v7);
  if (v8)
  {
    outlined destroy of SubscriptionStatus((uint64_t)v7);
    os_unfair_lock_unlock(v3);
  }

  else
  {
    outlined init with take of Subscription(v7, (uint64_t)v9);
    os_unfair_lock_unlock(v3);
    uint64_t v5 = v10;
    uint64_t v6 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24))(a1, v5, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }

uint64_t Publishers.HandleEvents.Inner.receive(subscription:)(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (os_unfair_lock_s *)v1[8];
  os_unfair_lock_lock(v4);
  uint64_t v5 = (void (*)(void *))v1[9];
  if (v5)
  {
    swift_retain();
    os_unfair_lock_unlock(v4);
    v5(a1);
    os_unfair_lock_lock(v4);
    _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe((uint64_t)v5);
  }

  swift_beginAccess();
  outlined init with copy of SubscriptionStatus((uint64_t)(v1 + 2), (uint64_t)&v13);
  if (v16 == 2
    && (int8x16_t v6 = vorrq_s8(v14, v15),
        !(*(void *)&vorr_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)) | (unint64_t)v13)))
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v13);
    outlined init with copy of Subscription((uint64_t)a1, (uint64_t)&v13);
    char v16 = 0;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v13, (uint64_t)(v1 + 2));
    swift_endAccess();
    os_unfair_lock_unlock(v4);
    v15.i64[0] = v3;
    v15.i64[1] = (uint64_t)&protocol witness table for Publishers.HandleEvents<A>.Inner<A1>;
    char v13 = v1;
    uint64_t v10 = *(void *)(v3 + 104);
    uint64_t v11 = *(void (**)(uint64_t **, uint64_t, uint64_t))(v10 + 40);
    uint64_t v12 = *(void *)(v3 + 88);
    swift_retain();
    v11(&v13, v12, v10);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  }

  else
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v13);
    os_unfair_lock_unlock(v4);
    uint64_t v7 = a1[3];
    uint64_t v8 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v7);
    return (*(uint64_t (**)(uint64_t))(*(void *)(v8 + 8) + 8LL))(v7);
  }

void Publishers.HandleEvents.Inner.receive(_:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (os_unfair_lock_s *)v1[8];
  os_unfair_lock_lock(v4);
  uint64_t v5 = (void (*)(uint64_t))v1[11];
  if (v5)
  {
    swift_retain();
    os_unfair_lock_unlock(v4);
    v5(a1);
    _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe((uint64_t)v5);
  }

  else
  {
    os_unfair_lock_unlock(v4);
  }

  uint64_t v6 = (*(uint64_t (**)(uint64_t, void))(*(void *)(v3 + 104) + 48LL))(a1, *(void *)(v3 + 88));
  os_unfair_lock_lock(v4);
  uint64_t v7 = (void (*)(uint64_t))v1[17];
  if (!v7)
  {
LABEL_9:
    os_unfair_lock_unlock(v4);
    return;
  }

  if (v6 == 0x8000000000000000LL)
  {
LABEL_8:
    swift_retain();
    os_unfair_lock_unlock(v4);
    v7(v6);
    _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe((uint64_t)v7);
    return;
  }

  if ((v6 & 0x8000000000000000LL) == 0)
  {
    if (v6) {
      goto LABEL_8;
    }
    goto LABEL_9;
  }

  __break(1u);
}

uint64_t Publishers.HandleEvents.Inner.receive(completion:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (os_unfair_lock_s *)v1[8];
  os_unfair_lock_lock(v4);
  uint64_t v5 = (void (*)(uint64_t))v1[13];
  if (v5)
  {
    swift_retain();
    os_unfair_lock_unlock(v4);
    v5(a1);
    os_unfair_lock_lock(v4);
    _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe((uint64_t)v5);
  }

  uint64_t v6 = v1[9];
  v1[9] = 0LL;
  v1[10] = 0LL;
  _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v6);
  uint64_t v7 = v1[11];
  v1[11] = 0LL;
  v1[12] = 0LL;
  _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v7);
  uint64_t v8 = v1[13];
  v1[13] = 0LL;
  v1[14] = 0LL;
  _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v8);
  uint64_t v9 = v1[15];
  v1[15] = 0LL;
  v1[16] = 0LL;
  _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v9);
  uint64_t v10 = v1[17];
  v1[17] = 0LL;
  v1[18] = 0LL;
  _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v10);
  uint64_t v12 = 1LL;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  char v15 = 2;
  swift_beginAccess();
  outlined assign with take of SubscriptionStatus((uint64_t)&v12, (uint64_t)(v1 + 2));
  swift_endAccess();
  os_unfair_lock_unlock(v4);
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v3 + 104) + 56LL))(a1, *(void *)(v3 + 88));
}

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.HandleEvents<A>.Inner<A1>( void *a1)
{
  return Publishers.HandleEvents.Inner.receive(subscription:)(a1);
}

void protocol witness for Subscriber.receive(_:) in conformance Publishers.HandleEvents<A>.Inner<A1>( uint64_t a1)
{
}

uint64_t protocol witness for Subscriber.receive(completion:) in conformance Publishers.HandleEvents<A>.Inner<A1>( uint64_t a1)
{
  return Publishers.HandleEvents.Inner.receive(completion:)(a1);
}

void protocol witness for Subscription.request(_:) in conformance Publishers.HandleEvents<A>.Inner<A1>( uint64_t a1)
{
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.HandleEvents<A>.Inner<A1>()
{
  return 0x7645656C646E6148LL;
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.HandleEvents<A>.Inner<A1>( uint64_t a1@<X8>)
{
}

void protocol witness for Cancellable.cancel() in conformance Publishers.HandleEvents<A>.Inner<A1>()
{
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.HandleEvents<A>( uint64_t a1)
{
}

uint64_t specialized Publishers.HandleEvents.Inner.init(downstream:events:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(uint64_t **)v2;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(void *)(v2 + 48) = 0LL;
  *(_BYTE *)(v2 + 56) = 2;
  uint64_t v6 = (_DWORD *)swift_slowAlloc();
  *uint64_t v6 = 0;
  *(void *)(v2 + 64) = v6;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_OWORD *)(v2 + 104) = 0u;
  *(_OWORD *)(v2 + 120) = 0u;
  *(_OWORD *)(v2 + 136) = 0u;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5[11] - 8) + 32LL))( v2 + *(void *)(*(void *)v2 + 168LL),  a1);
  uint64_t v8 = (int *)type metadata accessor for Publishers.HandleEvents(0LL, v5[10], v5[12], v7);
  uint64_t v9 = (uint64_t *)(a2 + v8[9]);
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = *(void *)(v2 + 72);
  *(void *)(v2 + 72) = *v9;
  *(void *)(v2 + 80) = v11;
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v10);
  _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v12);
  __int128 v13 = (uint64_t *)(a2 + v8[10]);
  uint64_t v14 = *v13;
  uint64_t v15 = v13[1];
  uint64_t v16 = *(void *)(v2 + 88);
  *(void *)(v2 + 88) = *v13;
  *(void *)(v2 + 96) = v15;
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v14);
  _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v16);
  int v17 = (uint64_t *)(a2 + v8[11]);
  uint64_t v18 = *v17;
  uint64_t v19 = v17[1];
  uint64_t v20 = *(void *)(v2 + 104);
  *(void *)(v2 + 104) = *v17;
  *(void *)(v2 + 112) = v19;
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v18);
  _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v20);
  uint64_t v21 = (uint64_t *)(a2 + v8[12]);
  uint64_t v22 = *v21;
  uint64_t v23 = v21[1];
  uint64_t v24 = *(void *)(v2 + 120);
  *(void *)(v2 + 120) = *v21;
  *(void *)(v2 + 128) = v23;
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v22);
  _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v24);
  uint64_t v25 = (uint64_t *)(a2 + v8[13]);
  uint64_t v26 = *v25;
  uint64_t v27 = v25[1];
  uint64_t v28 = *(void *)(v2 + 136);
  *(void *)(v2 + 136) = *v25;
  *(void *)(v2 + 144) = v27;
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v26);
  _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v28);
  return v2;
}

uint64_t sub_183B7219C()
{
  return 16LL;
}

__n128 sub_183B721A8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_183B721BC()
{
  return 16LL;
}

__n128 sub_183B721C8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_183B721DC()
{
  return 16LL;
}

__n128 sub_183B721E8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_183B721FC()
{
  return 16LL;
}

__n128 sub_183B72208(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_183B7221C()
{
  return 16LL;
}

__n128 sub_183B72228(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t type metadata completion function for Publishers.HandleEvents()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.HandleEvents(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0
    || ((((((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 23) & 0xFFFFFFFFFFFFFFF8LL) + 23) & 0xFFFFFFFFFFFFFFF8LL) + 23) & 0xFFFFFFFFFFFFFFF8LL)
       + 23) & 0xFFFFFFFFFFFFFFF8LL)
     + 16 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }

  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v10 = ((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    if (*(void *)v11 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)unint64_t v10 = *(_OWORD *)v11;
    }

    else
    {
      uint64_t v12 = *(void *)(v11 + 8);
      *(void *)unint64_t v10 = *(void *)v11;
      *(void *)(v10 + 8) = v12;
      swift_retain();
    }

    unint64_t v13 = (v10 + 23) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v14 = (v11 + 23) & 0xFFFFFFFFFFFFFFF8LL;
    if (*(void *)v14 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)unint64_t v13 = *(_OWORD *)v14;
    }

    else
    {
      uint64_t v15 = *(void *)(v14 + 8);
      *(void *)unint64_t v13 = *(void *)v14;
      *(void *)(v13 + 8) = v15;
      swift_retain();
    }

    unint64_t v16 = (v13 + 23) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v17 = (v14 + 23) & 0xFFFFFFFFFFFFFFF8LL;
    if (*(void *)v17 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)unint64_t v16 = *(_OWORD *)v17;
    }

    else
    {
      uint64_t v18 = *(void *)(v17 + 8);
      *(void *)unint64_t v16 = *(void *)v17;
      *(void *)(v16 + 8) = v18;
      swift_retain();
    }

    unint64_t v19 = (v16 + 23) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v20 = (v17 + 23) & 0xFFFFFFFFFFFFFFF8LL;
    if (*(void *)v20 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)unint64_t v19 = *(_OWORD *)v20;
    }

    else
    {
      uint64_t v21 = *(void *)(v20 + 8);
      *(void *)unint64_t v19 = *(void *)v20;
      *(void *)(v19 + 8) = v21;
      swift_retain();
    }

    unint64_t v22 = (v19 + 23) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v23 = (v20 + 23) & 0xFFFFFFFFFFFFFFF8LL;
    if (*(void *)v23 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)unint64_t v22 = *(_OWORD *)v23;
      return v4;
    }

    uint64_t v24 = *(void *)(v23 + 8);
    *(void *)unint64_t v22 = *(void *)v23;
    *(void *)(v22 + 8) = v24;
  }

  swift_retain();
  return v4;
}

uint64_t destroy for Publishers.HandleEvents(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8LL);
  uint64_t result = (*(uint64_t (**)(void))(v3 + 8))();
  uint64_t v5 = (void *)((a1 + *(void *)(v3 + 64) + 7) & 0xFFFFFFFFFFFFFFF8LL);
  if (*v5 >= 0xFFFFFFFFuLL) {
    uint64_t result = swift_release();
  }
  uint64_t v6 = (void *)(((unint64_t)v5 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  if (*v6 >= 0xFFFFFFFFuLL) {
    uint64_t result = swift_release();
  }
  int v7 = (void *)(((unint64_t)v6 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  if (*v7 >= 0xFFFFFFFFuLL) {
    uint64_t result = swift_release();
  }
  uint64_t v8 = (void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  if (*v8 >= 0xFFFFFFFFuLL) {
    uint64_t result = swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for Publishers.HandleEvents(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v5 + 16))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8LL;
  if (*(void *)v8 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v7 = *(_OWORD *)v8;
  }

  else
  {
    uint64_t v9 = *(void *)(v8 + 8);
    *(void *)unint64_t v7 = *(void *)v8;
    *(void *)(v7 + 8) = v9;
    swift_retain();
  }

  unint64_t v10 = (v7 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v11 = (v8 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  if (*(void *)v11 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v10 = *(_OWORD *)v11;
  }

  else
  {
    uint64_t v12 = *(void *)(v11 + 8);
    *(void *)unint64_t v10 = *(void *)v11;
    *(void *)(v10 + 8) = v12;
    swift_retain();
  }

  unint64_t v13 = (v10 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v14 = (v11 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  if (*(void *)v14 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v13 = *(_OWORD *)v14;
  }

  else
  {
    uint64_t v15 = *(void *)(v14 + 8);
    *(void *)unint64_t v13 = *(void *)v14;
    *(void *)(v13 + 8) = v15;
    swift_retain();
  }

  unint64_t v16 = (v13 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v17 = (v14 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  if (*(void *)v17 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v16 = *(_OWORD *)v17;
  }

  else
  {
    uint64_t v18 = *(void *)(v17 + 8);
    *(void *)unint64_t v16 = *(void *)v17;
    *(void *)(v16 + 8) = v18;
    swift_retain();
  }

  unint64_t v19 = (v16 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v20 = (v17 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  if (*(void *)v20 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v19 = *(_OWORD *)v20;
  }

  else
  {
    uint64_t v21 = *(void *)(v20 + 8);
    *(void *)unint64_t v19 = *(void *)v20;
    *(void *)(v19 + 8) = v21;
    swift_retain();
  }

  return a1;
}

uint64_t assignWithCopy for Publishers.HandleEvents(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v5 + 24))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  unint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v8 = (unint64_t *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v9 = *v8;
  if (*v7 < 0xFFFFFFFFuLL)
  {
    if (v9 >= 0xFFFFFFFF)
    {
      unint64_t v11 = v8[1];
      *unint64_t v7 = v9;
      v7[1] = v11;
      swift_retain();
      goto LABEL_8;
    }
  }

  else
  {
    if (v9 >= 0xFFFFFFFF)
    {
      unint64_t v10 = v8[1];
      *unint64_t v7 = v9;
      v7[1] = v10;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }

    swift_release();
  }

  *(_OWORD *)unint64_t v7 = *(_OWORD *)v8;
LABEL_8:
  uint64_t v12 = (void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v13 = (unint64_t *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v14 = *v13;
  if (*v12 < 0xFFFFFFFFuLL)
  {
    if (v14 >= 0xFFFFFFFF)
    {
      unint64_t v16 = v13[1];
      void *v12 = v14;
      v12[1] = v16;
      swift_retain();
      goto LABEL_15;
    }
  }

  else
  {
    if (v14 >= 0xFFFFFFFF)
    {
      unint64_t v15 = v13[1];
      void *v12 = v14;
      v12[1] = v15;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }

    swift_release();
  }

  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
LABEL_15:
  unint64_t v17 = (void *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v18 = (unint64_t *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v19 = *v18;
  if (*v17 < 0xFFFFFFFFuLL)
  {
    if (v19 >= 0xFFFFFFFF)
    {
      unint64_t v21 = v18[1];
      *unint64_t v17 = v19;
      v17[1] = v21;
      swift_retain();
      goto LABEL_22;
    }
  }

  else
  {
    if (v19 >= 0xFFFFFFFF)
    {
      unint64_t v20 = v18[1];
      *unint64_t v17 = v19;
      v17[1] = v20;
      swift_retain();
      swift_release();
      goto LABEL_22;
    }

    swift_release();
  }

  *(_OWORD *)unint64_t v17 = *(_OWORD *)v18;
LABEL_22:
  unint64_t v22 = (void *)(((unint64_t)v17 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v23 = (unint64_t *)(((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v24 = *v23;
  if (*v22 < 0xFFFFFFFFuLL)
  {
    if (v24 >= 0xFFFFFFFF)
    {
      unint64_t v26 = v23[1];
      *unint64_t v22 = v24;
      v22[1] = v26;
      swift_retain();
      goto LABEL_29;
    }
  }

  else
  {
    if (v24 >= 0xFFFFFFFF)
    {
      unint64_t v25 = v23[1];
      *unint64_t v22 = v24;
      v22[1] = v25;
      swift_retain();
      swift_release();
      goto LABEL_29;
    }

    swift_release();
  }

  *(_OWORD *)unint64_t v22 = *(_OWORD *)v23;
LABEL_29:
  uint64_t v27 = (void *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v28 = (unint64_t *)(((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v29 = *v28;
  if (*v27 < 0xFFFFFFFFuLL)
  {
    if (v29 >= 0xFFFFFFFF)
    {
      unint64_t v31 = v28[1];
      *uint64_t v27 = v29;
      v27[1] = v31;
      swift_retain();
      return a1;
    }

LABEL_35:
    *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
    return a1;
  }

  if (v29 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_35;
  }

  unint64_t v30 = v28[1];
  *uint64_t v27 = v29;
  v27[1] = v30;
  swift_retain();
  swift_release();
  return a1;
}

    *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
    return a1;
  }

  if (v29 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_35;
  }

  unint64_t v30 = v28[1];
  *uint64_t v27 = v29;
  v27[1] = v30;
  swift_release();
  return a1;
}

uint64_t initializeWithTake for Publishers.HandleEvents(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v5 + 32))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8LL;
  if (*(void *)v8 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v7 = *(_OWORD *)v8;
  }

  else
  {
    uint64_t v9 = *(void *)(v8 + 8);
    *(void *)unint64_t v7 = *(void *)v8;
    *(void *)(v7 + 8) = v9;
  }

  unint64_t v10 = (v7 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v11 = (v8 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  if (*(void *)v11 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v10 = *(_OWORD *)v11;
  }

  else
  {
    uint64_t v12 = *(void *)(v11 + 8);
    *(void *)unint64_t v10 = *(void *)v11;
    *(void *)(v10 + 8) = v12;
  }

  unint64_t v13 = (v10 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v14 = (v11 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  if (*(void *)v14 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v13 = *(_OWORD *)v14;
  }

  else
  {
    uint64_t v15 = *(void *)(v14 + 8);
    *(void *)unint64_t v13 = *(void *)v14;
    *(void *)(v13 + 8) = v15;
  }

  unint64_t v16 = (v13 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v17 = (v14 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  if (*(void *)v17 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v16 = *(_OWORD *)v17;
  }

  else
  {
    uint64_t v18 = *(void *)(v17 + 8);
    *(void *)unint64_t v16 = *(void *)v17;
    *(void *)(v16 + 8) = v18;
  }

  unint64_t v19 = (v16 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v20 = (uint64_t *)((v17 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v21 = *v20;
  if ((unint64_t)*v20 < 0xFFFFFFFF)
  {
    *(_OWORD *)unint64_t v19 = *(_OWORD *)v20;
  }

  else
  {
    uint64_t v22 = v20[1];
    *(void *)unint64_t v19 = v21;
    *(void *)(v19 + 8) = v22;
  }

  return a1;
}

uint64_t assignWithTake for Publishers.HandleEvents(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v5 + 40))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  unint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v8 = (unint64_t *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v9 = *v8;
  if (*v7 < 0xFFFFFFFFuLL)
  {
    if (v9 >= 0xFFFFFFFF)
    {
      unint64_t v11 = v8[1];
      *unint64_t v7 = v9;
      v7[1] = v11;
      goto LABEL_8;
    }
  }

  else
  {
    if (v9 >= 0xFFFFFFFF)
    {
      unint64_t v10 = v8[1];
      *unint64_t v7 = v9;
      v7[1] = v10;
      swift_release();
      goto LABEL_8;
    }

    swift_release();
  }

  *(_OWORD *)unint64_t v7 = *(_OWORD *)v8;
LABEL_8:
  uint64_t v12 = (void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v13 = (unint64_t *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v14 = *v13;
  if (*v12 < 0xFFFFFFFFuLL)
  {
    if (v14 >= 0xFFFFFFFF)
    {
      unint64_t v16 = v13[1];
      void *v12 = v14;
      v12[1] = v16;
      goto LABEL_15;
    }
  }

  else
  {
    if (v14 >= 0xFFFFFFFF)
    {
      unint64_t v15 = v13[1];
      void *v12 = v14;
      v12[1] = v15;
      swift_release();
      goto LABEL_15;
    }

    swift_release();
  }

  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
LABEL_15:
  unint64_t v17 = (void *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v18 = (unint64_t *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v19 = *v18;
  if (*v17 < 0xFFFFFFFFuLL)
  {
    if (v19 >= 0xFFFFFFFF)
    {
      unint64_t v21 = v18[1];
      *unint64_t v17 = v19;
      v17[1] = v21;
      goto LABEL_22;
    }
  }

  else
  {
    if (v19 >= 0xFFFFFFFF)
    {
      unint64_t v20 = v18[1];
      *unint64_t v17 = v19;
      v17[1] = v20;
      swift_release();
      goto LABEL_22;
    }

    swift_release();
  }

  *(_OWORD *)unint64_t v17 = *(_OWORD *)v18;
LABEL_22:
  uint64_t v22 = (void *)(((unint64_t)v17 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v23 = (unint64_t *)(((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v24 = *v23;
  if (*v22 < 0xFFFFFFFFuLL)
  {
    if (v24 >= 0xFFFFFFFF)
    {
      unint64_t v26 = v23[1];
      *uint64_t v22 = v24;
      v22[1] = v26;
      goto LABEL_29;
    }
  }

  else
  {
    if (v24 >= 0xFFFFFFFF)
    {
      unint64_t v25 = v23[1];
      *uint64_t v22 = v24;
      v22[1] = v25;
      swift_release();
      goto LABEL_29;
    }

    swift_release();
  }

  *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
LABEL_29:
  uint64_t v27 = (void *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v28 = (unint64_t *)(((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v29 = *v28;
  if (*v27 < 0xFFFFFFFFuLL)
  {
    if (v29 >= 0xFFFFFFFF)
    {
      unint64_t v31 = v28[1];
      *uint64_t v27 = v29;
      v27[1] = v31;
      return a1;
    }

uint64_t getEnumTagSinglePayload for Publishers.HandleEvents(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFE) {
    unsigned int v6 = 2147483646;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v7 = *(void *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFE)
    {
      unint64_t v12 = *(void *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8LL);
      if (v12 >= 0xFFFFFFFF) {
        LODWORD(v12) = -1;
      }
      else {
        return 0LL;
      }
    }

    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }

  else
  {
    if (((((((((((((v7 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 23) & 0xFFFFFFFFFFFFFFF8LL) + 23) & 0xFFFFFFFFFFFFFFF8LL) + 23) & 0xFFFFFFFFFFFFFFF8LL)
           + 23) & 0xFFFFFFFFFFFFFFF8LL)
         + 16) & 0xFFFFFFF8) != 0)
      unsigned int v8 = 2;
    else {
      unsigned int v8 = a2 - v6 + 1;
    }
    if (v8 >= 0x10000) {
      unsigned int v9 = 4;
    }
    else {
      unsigned int v9 = 2;
    }
    if (v8 < 0x100) {
      unsigned int v9 = 1;
    }
    if (v8 >= 2) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0LL;
    }
    return ((uint64_t (*)(void))((char *)&loc_183B72D94 + 4 * byte_183BA5050[v10]))();
  }

void storeEnumTagSinglePayload for Publishers.HandleEvents( unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 16) - 8LL);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFEu) {
    unsigned int v6 = 2147483646;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v5 + 84);
  }
  if (v6 >= a3)
  {
    int v9 = 0u;
    if (a2 <= v6) {
      goto LABEL_17;
    }
  }

  else
  {
    if (((((((((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      unsigned int v7 = a3 - v6 + 1;
    else {
      unsigned int v7 = 2;
    }
    if (v7 >= 0x10000) {
      int v8 = 4;
    }
    else {
      int v8 = 2;
    }
    if (v7 < 0x100) {
      int v8 = 1;
    }
    if (v7 >= 2) {
      int v9 = v8;
    }
    else {
      int v9 = 0;
    }
    if (a2 <= v6) {
LABEL_17:
    }
      __asm { BR              X12 }
  }

  if (((((((((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    unsigned int v10 = ~v6 + a2;
    bzero( a1,  ((((((((((*(void *)(v5 + 64) + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + 23) & 0xFFFFFFFFFFFFFFF8LL) + 23) & 0xFFFFFFFFFFFFFFF8LL)
        + 23) & 0xFFFFFFFFFFFFFFF8LL)
      + 23) & 0xFFFFFFFFFFFFFFF8LL)
    + 16);
    *a1 = v10;
  }

  __asm { BR              X10 }

void sub_183B72F34()
{
  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x183B72FB8LL);
}

void sub_183B72F3C(uint64_t a1, int a2)
{
  *(_DWORD *)(v2 + v3) = 0;
  if (a2) {
    JUMPOUT(0x183B72F44LL);
  }
  JUMPOUT(0x183B72FB8LL);
}

void sub_183B72F8C()
{
  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x183B72FB8LL);
}

void sub_183B72F94()
{
  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x183B72FB8LL);
}

uint64_t sub_183B72F9C(uint64_t a1, unsigned int a2, unsigned int a3)
{
  *(_WORD *)(v6 + (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v8, v2, v7) = 0;
  if (!a2) {
    goto LABEL_6;
  }
  if (a3 < 0x7FFFFFFE)
  {
    if (a2 > 0x7FFFFFFE) {
      JUMPOUT(0x183B72FA8LL);
    }
    *(void *)((v6 + v5 + 7) & 0xFFFFFFFFFFFFFFF8LL) = a2;
LABEL_6:
    JUMPOUT(0x183B72FB8LL);
  }

  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v6);
}

uint64_t type metadata completion function for Publishers.HandleEvents.Inner()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_183B7306C()
{
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Subscribers.Demand) -> (@out ())( uint64_t a1)
{
  int v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@unowned Subscribers.Demand) -> ()( void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> ()()
{
  return thunk for @escaping @callee_guaranteed () -> ()(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_183B730EC()
{
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Publisher.Output) -> (@out ())()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t _s7Combine12Subscription_pytIegnr_AaB_pIegn_TRTA_0(uint64_t a1)
{
  return thunk for @escaping @callee_guaranteed (@in_guaranteed Subscribers.Completion<B>) -> ()( a1,  *(uint64_t (**)(void))(v1 + 16));
}

void Publisher.prepend(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void Publisher.prepend<A>(_:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v6[7] = a3;
  v6[3] = a1;
  v6[5] = *(void *)(a2 - 8);
  MEMORY[0x1895F8858](a1);
  v6[4] = (char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v6[8] = v4;
  v6[9] = MEMORY[0x18961A520];
  v6[10] = v5;
  v6[11] = MEMORY[0x18961A528];
  type metadata accessor for Publishers.Sequence();
}

void sub_183B731F8(uint64_t a1)
{
  *(void *)(v4 - 168) = *(void *)(a1 - 8);
  MEMORY[0x1895F8858](a1);
  *(void *)(v4 - 160) = v2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  *(void *)(v4 - 112) = v3;
  *(void *)(v4 - 104) = AssociatedTypeWitness;
  *(void *)(v4 - 96) = v1;
  *(void *)(v4 - 88) = AssociatedConformanceWitness;
  type metadata accessor for Publishers.Sequence();
}

void sub_183B73288( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16 = *(void *)(a1 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v18 = (char *)&a9 - v17;
  Sequence.publisher.getter(v11, v13);
  Publishers.Sequence.setFailureType<A>(to:)(v10, v12, (uint64_t)v18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 168) + 8LL))(v13, v12);
  (*(void (**)(void, void, uint64_t))(*(void *)(v14 - 136) + 16LL))( *(void *)(v14 - 144),  *(void *)(v14 - 128),  v9);
  uint64_t v19 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.Sequence<A, B>, a1);
  (*(void (**)(void, char *, uint64_t))(v16 + 32))(*(void *)(v14 - 120), v18, a1);
  *(void *)(v14 - 112) = a1;
  *(void *)(v14 - 104) = v9;
  uint64_t v20 = *(void *)(v14 - 160);
  *(void *)(v14 - 96) = v19;
  *(void *)(v14 - 88) = v20;
  type metadata accessor for Publishers.Concatenate();
}

uint64_t sub_183B73354(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v2 + *(int *)(a1 + 52), v4, v1);
}

void Publishers.Concatenate.init(prefix:suffix:)( uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
}

uint64_t sub_183B733E4(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v1 - 8) + 32LL))( v3 + *(int *)(a1 + 52),  v2,  v1);
}

void type metadata accessor for Publishers.Concatenate()
{
}

void Publisher.prepend<A>(_:)( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = *(void *)(a2 - 8);
  uint64_t v13 = MEMORY[0x1895F8858](a1);
  unint64_t v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1895F8858](v13);
  uint64_t v19 = (char *)v20 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v17 + 16))(v19);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v6, a2);
  (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(a6, v19, a3);
  v20[0] = a3;
  v20[1] = a2;
  v20[2] = a5;
  v20[3] = a4;
  type metadata accessor for Publishers.Concatenate();
}

uint64_t sub_183B734FC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v2 + *(int *)(a1 + 52), v3, v1);
}

void Publisher.append(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void Publisher.prepend(_:)( uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v9 = a1;
  swift_getAssociatedTypeWitness();
  uint64_t v7 = type metadata accessor for Array();
  uint64_t v8 = MEMORY[0x186E22960](MEMORY[0x189618470], v7);
  a4(&v9, a2, v7, a3, v8);
  JUMPOUT(0x183B735C8LL);
}

void Publisher.append<A>(_:)()
{
}

void sub_183B73644(uint64_t a1)
{
  *(void *)(v3 - 144) = *(void *)(a1 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  *(void *)(v3 - 112) = v1;
  *(void *)(v3 - 104) = AssociatedTypeWitness;
  *(void *)(v3 - 96) = v2;
  *(void *)(v3 - 88) = AssociatedConformanceWitness;
  type metadata accessor for Publishers.Sequence();
}

void sub_183B736D0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v14 - 160) = *(void *)(a1 - 8);
  uint64_t v16 = MEMORY[0x1895F8858](a1);
  uint64_t v18 = (char *)&a9 - v17;
  uint64_t v19 = *(void *)(v10 - 8);
  MEMORY[0x1895F8858](v16);
  unint64_t v21 = (char *)&a9 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, void, uint64_t))(v19 + 16))(v21, *(void *)(v14 - 136), v10);
  Sequence.publisher.getter(v9, v13);
  Publishers.Sequence.setFailureType<A>(to:)(v12, v11, (uint64_t)v18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 144) + 8LL))(v13, v11);
  uint64_t v22 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.Sequence<A, B>, a1);
  (*(void (**)(void, char *, uint64_t))(v19 + 32))(*(void *)(v14 - 120), v21, v10);
  *(void *)(v14 - 112) = v10;
  *(void *)(v14 - 104) = a1;
  *(void *)(v14 - 96) = *(void *)(v14 - 152);
  *(void *)(v14 - 88) = v22;
  type metadata accessor for Publishers.Concatenate();
}

uint64_t sub_183B737C8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 160) + 32LL))( v1 + *(int *)(a1 + 52),  v2,  v3);
}

void Publisher.append<A>(_:)( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v21 = a5;
  uint64_t v12 = *(void *)(a3 - 8);
  uint64_t v13 = MEMORY[0x1895F8858](a1);
  unint64_t v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1895F8858](v13);
  uint64_t v19 = (char *)&v20 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v6, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a1, a3);
  (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(a6, v19, a2);
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v24 = a4;
  uint64_t v25 = v21;
  type metadata accessor for Publishers.Concatenate();
}

uint64_t sub_183B738E8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v2 + *(int *)(a1 + 52), v3, v1);
}

uint64_t Publishers.Concatenate.prefix.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 16LL))(a2, v2);
}

uint64_t Publishers.Concatenate.suffix.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) - 8LL) + 16LL))( a2,  v2 + *(int *)(a1 + 52));
}

void Publishers.Concatenate.receive<A>(subscriber:)(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1895F8858](a1);
  MEMORY[0x1895F8858](v1);
  type metadata accessor for Publishers.Concatenate.Inner();
}

void sub_183B73A04()
{
  uint64_t v10 = swift_allocObject();
  Publishers.Concatenate.Inner.init(_:suffix:)(v8, v0);
  swift_retain();
  *(void *)(v9 - 136) = v10;
  *(void *)(v9 - 128) = v5;
  *(void *)(v9 - 120) = v3;
  *(void *)(v9 - 112) = v2;
  uint64_t v11 = *(void *)(v9 - 160);
  *(void *)(v9 - 104) = v4;
  *(void *)(v9 - 96) = v11;
  *(void *)(v9 - 88) = *(void *)(v9 - 152);
  type metadata accessor for Publishers.Concatenate.Inner.PrefixSubscriber();
}

uint64_t sub_183B73A88(uint64_t a1)
{
  uint64_t v5 = MEMORY[0x186E22960]( &protocol conformance descriptor for Publishers.Concatenate<A, B>.Inner<A1>.PrefixSubscriber,  a1);
  Publisher.subscribe<A>(_:)(v3 - 136, v2, a1, v1, v5);
  return swift_release_n();
}

void type metadata accessor for Publishers.Concatenate.Inner()
{
}

uint64_t Publishers.Concatenate.Inner.__allocating_init(_:suffix:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  Publishers.Concatenate.Inner.init(_:suffix:)(a1, a2);
  return v4;
}

uint64_t Publishers.Concatenate.Inner.prefixSubscriber.getter()
{
  return swift_retain();
}

void type metadata accessor for Publishers.Concatenate.Inner.PrefixSubscriber()
{
}

void Publishers.Concatenate.Inner.PrefixSubscriber.playgroundDescription.getter(void *a1@<X8>)
{
  a1[3] = MEMORY[0x189617FA8];
  *a1 = 0x6E657461636E6F43LL;
  a1[1] = 0xEB00000000657461LL;
}

uint64_t Publishers.Concatenate.Inner.PrefixSubscriber.receive(subscription:)(void *a1)
{
  return Publishers.Concatenate.Inner.prefixReceive(subscription:)(a1);
}

uint64_t Publishers.Concatenate.Inner.prefixReceive(subscription:)(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(*v1 + 168));
  os_unfair_lock_lock(v4);
  uint64_t v5 = (uint64_t)v1 + *(void *)(*v1 + 136);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v5, (uint64_t)&v13);
  if (v16 == 2
    && (int8x16_t v6 = vorrq_s8(v14, v15),
        !(*(void *)&vorr_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)) | (unint64_t)v13)))
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v13);
    outlined init with copy of Subscription((uint64_t)a1, (uint64_t)&v13);
    char v16 = 0;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v13, v5);
    swift_endAccess();
    os_unfair_lock_unlock(v4);
    v15.i64[0] = v3;
    v15.i64[1] = (uint64_t)&protocol witness table for Publishers.Concatenate<A, B>.Inner<A1>;
    uint64_t v13 = v1;
    uint64_t v10 = *(void *)(v3 + 120);
    uint64_t v11 = *(void (**)(uint64_t **, uint64_t, uint64_t))(v10 + 40);
    uint64_t v12 = *(void *)(v3 + 96);
    swift_retain();
    v11(&v13, v12, v10);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  }

  else
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v13);
    os_unfair_lock_unlock(v4);
    uint64_t v7 = a1[3];
    uint64_t v8 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v7);
    return (*(uint64_t (**)(uint64_t))(*(void *)(v8 + 8) + 8LL))(v7);
  }

void Publishers.Concatenate.Inner.PrefixSubscriber.receive(_:)(uint64_t a1)
{
}

void Publishers.Concatenate.Inner.prefixReceive(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(*v1 + 168));
  os_unfair_lock_lock(v5);
  uint64_t v6 = (uint64_t)v1 + *(void *)(*v1 + 136);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v6, (uint64_t)v13);
  int v7 = v13[40];
  outlined destroy of SubscriptionStatus((uint64_t)v13);
  if (v7) {
    goto LABEL_2;
  }
  uint64_t v8 = *(void *)(*v2 + 160);
  uint64_t v9 = *(uint64_t *)((char *)v2 + v8);
  if (v9 != 0x8000000000000000LL)
  {
    if (!v9) {
      goto LABEL_2;
    }
    if (v9 < 0)
    {
      __break(1u);
      __break(1u);
      goto LABEL_18;
    }

    *(uint64_t *)((char *)v2 + v8) = v9 - 1;
  }

  os_unfair_lock_unlock(v5);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, void))(*(void *)(v4 + 120) + 48LL))(a1, *(void *)(v4 + 96));
  if (v10)
  {
    os_unfair_lock_lock(v5);
    uint64_t v11 = *(uint64_t *)((char *)v2 + v8);
    unint64_t v12 = 0x8000000000000000LL;
    if (v11 != 0x8000000000000000LL)
    {
      if (v10 == 0x8000000000000000LL) {
        goto LABEL_16;
      }
      if (((v11 | v10) & 0x8000000000000000LL) == 0)
      {
        unint64_t v12 = v11 + v10;
        if (!__OFADD__(v11, v10))
        {
          if ((v12 & 0x8000000000000000LL) == 0) {
            goto LABEL_16;
          }
LABEL_19:
          __break(1u);
          return;
        }

        unint64_t v12 = 0x8000000000000000LL;
LABEL_16:
        *(uint64_t *)((char *)v2 + v8) = v12;
        goto LABEL_2;
      }

LABEL_18:
      __break(1u);
      goto LABEL_19;
    }

        int8x16_t v15 = 1LL;
        goto LABEL_19;
      }

LABEL_2:
    os_unfair_lock_unlock(v5);
  }

void Publishers.Concatenate.Inner.PrefixSubscriber.receive(completion:)(uint64_t a1)
{
}

void Publishers.Concatenate.Inner.prefixReceive(completion:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v39 = a1;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 104);
  uint64_t v5 = *(void *)(*v1 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v38 = type metadata accessor for Subscribers.Completion(0LL, AssociatedTypeWitness, AssociatedConformanceWitness, v8);
  *(void *)&__int128 v43 = *(void *)(v38 - 8);
  MEMORY[0x1895F8858](v38);
  uint64_t v37 = (char *)&v31 - v9;
  uint64_t v42 = *(void *)(v3 + 88);
  uint64_t v41 = type metadata accessor for Optional();
  uint64_t v44 = *(void *)(v41 - 8);
  uint64_t v10 = MEMORY[0x1895F8858](v41);
  unint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = MEMORY[0x1895F8858](v10);
  int8x16_t v15 = (char *)&v31 - v14;
  MEMORY[0x1895F8858](v13);
  uint64_t v40 = (char *)&v31 - v16;
  uint64_t v17 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(v3 + 168));
  os_unfair_lock_lock(v17);
  uint64_t v18 = (uint64_t)v2 + *(void *)(*v2 + 136);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v18, (uint64_t)&v45);
  int v19 = v47[16];
  outlined destroy of SubscriptionStatus((uint64_t)&v45);
  if (v19)
  {
    os_unfair_lock_unlock(v17);
  }

  else
  {
    uint64_t v36 = v12;
    uint64_t v33 = v5;
    uint64_t v32 = v4;
    uint64_t v45 = 1LL;
    __int128 v46 = 0u;
    *(_OWORD *)uint64_t v47 = 0u;
    v47[16] = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v45, v18);
    swift_endAccess();
    uint64_t v20 = (uint64_t)v2 + *(void *)(*v2 + 152);
    swift_beginAccess();
    uint64_t v21 = v44;
    uint64_t v22 = v40;
    uint64_t v23 = v41;
    uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v44 + 16);
    v34(v40, v20, v41);
    uint64_t v24 = v42;
    uint64_t v35 = *(void *)(v42 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v35 + 56))(v15, 1LL, 1LL, v42);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v21 + 40))(v20, v15, v23);
    swift_endAccess();
    os_unfair_lock_unlock(v17);
    uint64_t v25 = v37;
    uint64_t v26 = v39;
    uint64_t v27 = v38;
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v37, v39, v38);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 48LL))( v25,  1LL,  AssociatedTypeWitness) == 1)
    {
      uint64_t v28 = v36;
      v34(v36, (uint64_t)v22, v23);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v28, 1LL, v24) != 1)
      {
        swift_retain();
        unsigned int v48 = v2;
        uint64_t v30 = *(void *)(v3 + 96);
        uint64_t v45 = v33;
        *(void *)&__int128 v46 = v24;
        *((void *)&v46 + 1) = v30;
        *(void *)uint64_t v47 = v32;
        __int128 v43 = *(_OWORD *)(v3 + 112);
        *(_OWORD *)&v47[8] = v43;
        type metadata accessor for Publishers.Concatenate.Inner.SuffixSubscriber();
      }

      unint64_t v29 = *(void (**)(char *, uint64_t))(v44 + 8);
      v29(v22, v23);
      v29(v28, v23);
    }

    else
    {
      (*(void (**)(uint64_t, void))(*(void *)(v3 + 120) + 56LL))(v26, *(void *)(v3 + 96));
      (*(void (**)(char *, uint64_t))(v44 + 8))(v22, v23);
      (*(void (**)(char *, uint64_t))(v43 + 8))(v25, v27);
    }
  }

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.Concatenate<A, B>.Inner<A1>.PrefixSubscriber( void *a1)
{
  return Publishers.Concatenate.Inner.PrefixSubscriber.receive(subscription:)(a1);
}

void protocol witness for Subscriber.receive(_:) in conformance Publishers.Concatenate<A, B>.Inner<A1>.PrefixSubscriber( uint64_t a1)
{
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.Concatenate<A, B>.Inner<A1>.PrefixSubscriber( uint64_t a1)
{
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Concatenate<A, B>.Inner<A1>.PrefixSubscriber()
{
  return 0x6E657461636E6F43LL;
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Concatenate<A, B>.Inner<A1>.PrefixSubscriber()
{
  return Publishers.DropUntilOutput.Inner.OtherSubscriber.customMirror.getter();
}

void Publishers.Concatenate.Inner.PrefixSubscriber.combineIdentifier.getter()
{
}

void sub_183B74364()
{
}

void Publishers.Concatenate.Inner.SuffixSubscriber.receive(subscription:)(void *a1)
{
}

void Publishers.Concatenate.Inner.suffixReceive(subscription:)(void *a1)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + *(void *)(*(void *)v1 + 168LL));
  os_unfair_lock_lock(v3);
  uint64_t v4 = v1 + *(void *)(*(void *)v1 + 144LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v4, (uint64_t)&v11);
  if (v14 == 2
    && (int8x16_t v5 = vorrq_s8(v12, v13),
        !(*(void *)&vorr_s8(*(int8x8_t *)v5.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL)) | v11)))
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v11);
    outlined init with copy of Subscription((uint64_t)a1, (uint64_t)&v11);
    char v14 = 0;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v11, v4);
    swift_endAccess();
    uint64_t v8 = *(void *)(v1 + *(void *)(*(void *)v1 + 160LL));
    os_unfair_lock_unlock(v3);
    if (v8)
    {
      uint64_t v9 = a1[3];
      uint64_t v10 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v9);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24))(v8, v9, v10);
    }
  }

  else
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v11);
    os_unfair_lock_unlock(v3);
    uint64_t v7 = a1[3];
    uint64_t v6 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v7);
    (*(void (**)(uint64_t))(*(void *)(v6 + 8) + 8LL))(v7);
  }

uint64_t Publishers.Concatenate.Inner.SuffixSubscriber.receive(_:)(uint64_t a1)
{
  return Publishers.Concatenate.Inner.suffixReceive(_:)(a1);
}

uint64_t Publishers.Concatenate.Inner.suffixReceive(_:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(*v1 + 168));
  os_unfair_lock_lock(v4);
  uint64_t v5 = (uint64_t)v1 + *(void *)(*v1 + 144);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v5, (uint64_t)v7);
  LODWORD((*(void (**)(uint64_t, void, uint64_t))(v1 + 16))(v9, *(void *)(v10 - 128), v5) = v7[40];
  outlined destroy of SubscriptionStatus((uint64_t)v7);
  os_unfair_lock_unlock(v4);
  uint64_t result = 0LL;
  if (!(_DWORD)v5) {
    return (*(uint64_t (**)(uint64_t, void))(*(void *)(v3 + 120) + 48LL))(a1, *(void *)(v3 + 96));
  }
  return result;
}

void Publishers.Concatenate.Inner.SuffixSubscriber.receive(completion:)(uint64_t a1)
{
}

void Publishers.Concatenate.Inner.suffixReceive(completion:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(*v1 + 168));
  os_unfair_lock_lock(v4);
  uint64_t v5 = (uint64_t)v1 + *(void *)(*v1 + 144);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v5, (uint64_t)&v8);
  int v6 = v11;
  outlined destroy of SubscriptionStatus((uint64_t)&v8);
  if (v6)
  {
    os_unfair_lock_unlock(v4);
  }

  else
  {
    uint64_t v8 = 1LL;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    unsigned __int8 v11 = 2;
    uint64_t v7 = (uint64_t)v1 + *(void *)(*v1 + 136);
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v8, v7);
    swift_endAccess();
    uint64_t v8 = 1LL;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    unsigned __int8 v11 = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v8, v5);
    swift_endAccess();
    os_unfair_lock_unlock(v4);
    (*(void (**)(uint64_t, void))(*(void *)(v3 + 120) + 56LL))(a1, *(void *)(v3 + 96));
  }

void protocol witness for Subscriber.receive(subscription:) in conformance Publishers.Concatenate<A, B>.Inner<A1>.SuffixSubscriber( void *a1)
{
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance Publishers.Concatenate<A, B>.Inner<A1>.SuffixSubscriber( uint64_t a1)
{
  return Publishers.Concatenate.Inner.SuffixSubscriber.receive(_:)(a1);
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.Concatenate<A, B>.Inner<A1>.SuffixSubscriber( uint64_t a1)
{
}

void protocol witness for CustomCombineIdentifierConvertible.combineIdentifier.getter in conformance Publishers.Concatenate<A, B>.Inner<A1>.PrefixSubscriber()
{
}

  ;
}

char *Publishers.Concatenate.Inner.init(_:suffix:)(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = a2;
  uint64_t v4 = *(void *)v2;
  uint64_t v5 = *(void *)(*(void *)v2 + 88LL);
  uint64_t v6 = type metadata accessor for Optional();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  __int128 v9 = (char *)&v18 - v8;
  __int128 v10 = &v2[*(void *)(v4 + 136)];
  *(_OWORD *)__int128 v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *((void *)v10 + 4) = 0LL;
  v10[40] = 2;
  unsigned __int8 v11 = &v2[*(void *)(*(void *)v2 + 144LL)];
  *((void *)v11 + 4) = 0LL;
  *(_OWORD *)unsigned __int8 v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  v11[40] = 2;
  uint64_t v12 = *(void *)(v5 - 8);
  int8x16_t v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  v13(&v2[*(void *)(*(void *)v2 + 152LL)], 1LL, 1LL, v5);
  *(void *)&v2[*(void *)(*(void *)v2 + 160LL)] = 0LL;
  uint64_t v14 = *(void *)(*(void *)v2 + 168LL);
  int8x16_t v15 = (_DWORD *)swift_slowAlloc();
  *int8x16_t v15 = 0;
  *(void *)&v2[v14] = v15;
  (*(void (**)(char *, uint64_t))(*(void *)(*(void *)(v4 + 96) - 8LL) + 32LL))( &v2[*(void *)(*(void *)v2 + 128LL)],  a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v9, v18, v5);
  v13(v9, 0LL, 1LL, v5);
  uint64_t v16 = &v2[*(void *)(*(void *)v2 + 152LL)];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(v16, v9, v6);
  swift_endAccess();
  return v2;
}

uint64_t *Publishers.Concatenate.Inner.deinit()
{
  uint64_t v1 = *v0;
  MEMORY[0x186E22A2C](*(uint64_t *)((char *)v0 + *(void *)(*v0 + 168)), -1LL, -1LL);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 96) - 8LL) + 8LL))((uint64_t)v0 + *(void *)(*v0 + 128));
  outlined destroy of SubscriptionStatus((uint64_t)v0 + *(void *)(*v0 + 136));
  outlined destroy of SubscriptionStatus((uint64_t)v0 + *(void *)(*v0 + 144));
  uint64_t v2 = (uint64_t)v0 + *(void *)(*v0 + 152);
  uint64_t v3 = type metadata accessor for Optional();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
  return v0;
}

uint64_t Publishers.Concatenate.Inner.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

Swift::Void __swiftcall Publishers.Concatenate.Inner.request(_:)(Combine::Subscribers::Demand a1)
{
  uint64_t v3 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(*v1 + 168));
  os_unfair_lock_lock(v3);
  uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(*v1 + 160);
  uint64_t v6 = *(uint64_t *)((char *)v1 + v5);
  unint64_t v7 = 0x8000000000000000LL;
  if (v6 != 0x8000000000000000LL)
  {
    if (a1.rawValue != 0x8000000000000000LL)
    {
      if (((v6 | a1.rawValue) & 0x8000000000000000LL) != 0)
      {
        __break(1u);
        goto LABEL_15;
      }

      unint64_t v7 = v6 + a1.rawValue;
      if (!__OFADD__(v6, a1.rawValue))
      {
        if ((v7 & 0x8000000000000000LL) == 0) {
          goto LABEL_8;
        }
LABEL_15:
        __break(1u);
        return;
      }

      unint64_t v7 = 0x8000000000000000LL;
    }

Swift::Void __swiftcall Publishers.Concatenate.Inner.cancel()()
{
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = type metadata accessor for Optional();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)&v17 - v4;
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v0 + *(void *)(v1 + 168)));
  uint64_t v6 = v0 + *(void *)(*(void *)v0 + 136LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v6, (uint64_t)&v18);
  if (v21)
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v18);
    uint64_t v7 = v0 + *(void *)(*(void *)v0 + 144LL);
    swift_beginAccess();
    outlined init with copy of SubscriptionStatus(v7, (uint64_t)&v18);
    if (v21)
    {
      outlined destroy of SubscriptionStatus((uint64_t)&v18);
      uint64_t v18 = 1LL;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      char v21 = 2;
      swift_beginAccess();
      outlined assign with take of SubscriptionStatus((uint64_t)&v18, v7);
      swift_endAccess();
      uint64_t v18 = 1LL;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      char v21 = 2;
      swift_beginAccess();
      outlined assign with take of SubscriptionStatus((uint64_t)&v18, v6);
      swift_endAccess();
      uint64_t v8 = v0 + *(void *)(*(void *)v0 + 152LL);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
      _ss20withExtendedLifetimeyq0_x_q0_yq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF( (uint64_t)v5,  (uint64_t)partial apply for closure #3 in Publishers.Concatenate.Inner.cancel(),  v0,  v2,  MEMORY[0x18961A520],  MEMORY[0x18961AFC8] + 8LL,  MEMORY[0x18961A528],  v9);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }

    else
    {
      outlined init with take of Subscription((__int128 *)&v18, (uint64_t)v22);
      uint64_t v18 = 1LL;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      char v21 = 2;
      swift_beginAccess();
      outlined assign with take of SubscriptionStatus((uint64_t)&v18, v7);
      swift_endAccess();
      uint64_t v18 = 1LL;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      char v21 = 2;
      swift_beginAccess();
      outlined assign with take of SubscriptionStatus((uint64_t)&v18, v6);
      swift_endAccess();
      uint64_t v14 = v0 + *(void *)(*(void *)v0 + 152LL);
      swift_beginAccess();
      uint64_t v15 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v14, v2);
      MEMORY[0x1895F8858](v15);
      *(&v17 - 2) = v0;
      *(&v17 - 1) = (uint64_t)v22;
      _ss20withExtendedLifetimeyq0_x_q0_yq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF( (uint64_t)v5,  (uint64_t)partial apply for closure #2 in Publishers.Concatenate.Inner.cancel(),  (uint64_t)(&v17 - 4),  v2,  MEMORY[0x18961A520],  MEMORY[0x18961AFC8] + 8LL,  MEMORY[0x18961A528],  v16);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    }
  }

  else
  {
    outlined init with take of Subscription((__int128 *)&v18, (uint64_t)v22);
    uint64_t v18 = 1LL;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    char v21 = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v18, v6);
    swift_endAccess();
    uint64_t v18 = 1LL;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    char v21 = 2;
    uint64_t v10 = v0 + *(void *)(*(void *)v0 + 144LL);
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v18, v10);
    swift_endAccess();
    uint64_t v11 = v0 + *(void *)(*(void *)v0 + 152LL);
    swift_beginAccess();
    uint64_t v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v11, v2);
    MEMORY[0x1895F8858](v12);
    *(&v17 - 2) = v0;
    *(&v17 - 1) = (uint64_t)v22;
    _ss20withExtendedLifetimeyq0_x_q0_yq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF( (uint64_t)v5,  (uint64_t)partial apply for closure #1 in Publishers.Concatenate.Inner.cancel(),  (uint64_t)(&v17 - 4),  v2,  MEMORY[0x18961A520],  MEMORY[0x18961AFC8] + 8LL,  MEMORY[0x18961A528],  v13);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  }

uint64_t closure #1 in Publishers.Concatenate.Inner.cancel()(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(*(void *)a1 + 88LL);
  uint64_t v5 = type metadata accessor for Optional();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v13 - v7;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))( (char *)&v13 - v7,  1LL,  1LL,  v4);
  uint64_t v9 = a1 + *(void *)(*(void *)a1 + 152LL);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 40))(v9, v8, v5);
  swift_endAccess();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + *(void *)(*(void *)a1 + 168LL)));
  uint64_t v10 = a2[3];
  uint64_t v11 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v10);
  return (*(uint64_t (**)(uint64_t))(*(void *)(v11 + 8) + 8LL))(v10);
}

void closure #3 in Publishers.Concatenate.Inner.cancel()(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 88LL);
  uint64_t v3 = type metadata accessor for Optional();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3);
  uint64_t v6 = (char *)&v8 - v5;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56LL))( (char *)&v8 - v5,  1LL,  1LL,  v2);
  uint64_t v7 = a1 + *(void *)(*(void *)a1 + 152LL);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 40))(v7, v6, v3);
  swift_endAccess();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + *(void *)(*(void *)a1 + 168LL)));
}

void protocol witness for Subscription.request(_:) in conformance Publishers.Concatenate<A, B>.Inner<A1>( Combine::Subscribers::Demand a1)
{
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Concatenate<A, B>.Inner<A1>( void *a1@<X8>)
{
}

void protocol witness for Cancellable.cancel() in conformance Publishers.Concatenate<A, B>.Inner<A1>()
{
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Concatenate<A, B>( uint64_t a1)
{
}

void static Publishers.Concatenate<>.== infix(_:_:)()
{
}

uint64_t sub_183B75240(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = MEMORY[0x1895F8858](a1);
  uint64_t v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  MEMORY[0x1895F8858](v5);
  uint64_t v9 = &v15[-v8];
  char v10 = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v11 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16);
  v11(v9, v2, a1);
  v11(v7, v1, a1);
  if ((v10 & 1) != 0) {
    char v12 = dispatch thunk of static Equatable.== infix(_:_:)();
  }
  else {
    char v12 = 0;
  }
  uint64_t v13 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v13(v7, a1);
  v13(v9, a1);
  return v12 & 1;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.Concatenate<A, B>()
{
  static Publishers.Concatenate<>.== infix(_:_:)();
}

uint64_t getEnumTagSinglePayload for Publishers.Concatenate(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8LL);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= v5) {
    unsigned int v8 = *(_DWORD *)(v4 + 84);
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = *(void *)(v4 + 64) + v9;
  unsigned int v11 = a2 - v8;
  if (a2 <= v8) {
    goto LABEL_23;
  }
  uint64_t v12 = (v10 & ~v9) + *(void *)(v6 + 64);
  char v13 = 8 * v12;
  if (v12 <= 3)
  {
    unsigned int v15 = ((v11 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v15))
    {
      int v14 = *(_DWORD *)(a1 + v12);
      if (!v14) {
        goto LABEL_23;
      }
      goto LABEL_14;
    }

    if (v15 > 0xFF)
    {
      int v14 = *(unsigned __int16 *)(a1 + v12);
      if (!*(_WORD *)(a1 + v12)) {
        goto LABEL_23;
      }
      goto LABEL_14;
    }

    if (v15 < 2)
    {
LABEL_23:
      if (v8)
      {
        if (v5 >= v7) {
          return (*(uint64_t (**)(void))(v4 + 48))();
        }
        else {
          return (*(uint64_t (**)(uint64_t))(v6 + 48))((v10 + a1) & ~v9);
        }
      }

      return 0LL;
    }
  }

  int v14 = *(unsigned __int8 *)(a1 + v12);
  if (!*(_BYTE *)(a1 + v12)) {
    goto LABEL_23;
  }
LABEL_14:
  int v16 = (v14 - 1) << v13;
  if (!(_DWORD)v12) {
    return v8 + v16 + 1;
  }
  else {
    int v17 = 4;
  }
  return ((uint64_t (*)(void))((char *)&loc_183B75424 + 4 * byte_183BA5210[v17 - 1]))();
}

void storeEnumTagSinglePayload for Publishers.Concatenate( _WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 16) - 8LL);
  uint64_t v6 = *(void *)(*(void *)(a4 + 24) - 8LL);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84)) {
    unsigned int v7 = *(_DWORD *)(v5 + 84);
  }
  else {
    unsigned int v7 = *(_DWORD *)(v6 + 84);
  }
  if (a3 > v7)
  {
    if (v8 <= 3)
    {
      unsigned int v11 = ((a3 - v7 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v11))
      {
        unsigned int v9 = 4u;
      }

      else if (v11 >= 0x100)
      {
        unsigned int v9 = 2;
      }

      else
      {
        unsigned int v9 = v11 > 1;
      }
    }

    else
    {
      unsigned int v9 = 1u;
    }
  }

  else
  {
    unsigned int v9 = 0u;
  }

  if (v7 < a2)
  {
    unsigned int v10 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        int v12 = v10 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v12;
          *((_BYTE *)a1 + 2) = BYTE2(v12);
        }

        else if ((_DWORD)v8 == 2)
        {
          *a1 = v12;
        }

        else
        {
          *(_BYTE *)a1 = v12;
        }
      }
    }

    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v10;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X16 }

uint64_t type metadata completion function for Publishers.Concatenate.Inner()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for Optional();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_initClassMetadata2();
      if (!result) {
        return 0LL;
      }
    }
  }

  return result;
}

void type metadata accessor for Publishers.Concatenate.Inner.SuffixSubscriber()
{
}

void partial apply for closure #3 in Publishers.Concatenate.Inner.cancel()()
{
}

uint64_t partial apply for closure #2 in Publishers.Concatenate.Inner.cancel()()
{
  return closure #1 in Publishers.Concatenate.Inner.cancel()(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t partial apply for closure #1 in Publishers.Concatenate.Inner.cancel()()
{
  return partial apply for closure #2 in Publishers.Concatenate.Inner.cancel()();
}

void CustomCombineIdentifierConvertible<>.combineIdentifier.getter(void *a1@<X8>)
{
  *a1 = v1;
}

void CombineIdentifier.init()(uint64_t *a1@<X8>)
{
  if (one-time initialization token for lock != -1) {
    swift_once();
  }
  unint64_t v2 = (os_unfair_lock_s *)static lock in Global #1 in CombineIdentifier.init();
  os_unfair_lock_lock((os_unfair_lock_t)static lock in Global #1 in CombineIdentifier.init());
  uint64_t v3 = static generation in Global #1 in CombineIdentifier.init();
  if (static generation in Global #1 in CombineIdentifier.init() == -1)
  {
    __break(1u);
  }

  else
  {
    ++static generation in Global #1 in CombineIdentifier.init();
    os_unfair_lock_unlock(v2);
    *a1 = v3;
  }

void protocol witness for CustomCombineIdentifierConvertible.combineIdentifier.getter in conformance AbstractCombineLatest<A1, B1, C1>( void *a1@<X8>)
{
}

uint64_t CombineIdentifier.value.getter()
{
  return *(void *)v0;
}

uint64_t CombineIdentifier.init(_:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = swift_unknownObjectRelease();
  *a2 = a1;
  return result;
}

uint64_t CombineIdentifier.description.getter()
{
  v0._countAndFlagsBits = String.init<A>(_:radix:uppercase:)();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  return 30768LL;
}

void CombineIdentifier.hash(into:)()
{
}

BOOL static CombineIdentifier.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Int CombineIdentifier.hashValue.getter()
{
  Swift::UInt64 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CombineIdentifier()
{
  Swift::UInt64 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CombineIdentifier()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CombineIdentifier()
{
  Swift::UInt64 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CombineIdentifier()
{
  v0._countAndFlagsBits = String.init<A>(_:radix:uppercase:)();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  return 30768LL;
}

unint64_t lazy protocol witness table accessor for type UInt64 and conformance UInt64()
{
  unint64_t result = lazy protocol witness table cache variable for type UInt64 and conformance UInt64;
  if (!lazy protocol witness table cache variable for type UInt64 and conformance UInt64)
  {
    unint64_t result = MEMORY[0x186E22960](MEMORY[0x18961A8F0], MEMORY[0x18961A8C8]);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type UInt64 and conformance UInt64);
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type CombineIdentifier and conformance CombineIdentifier()
{
  unint64_t result = lazy protocol witness table cache variable for type CombineIdentifier and conformance CombineIdentifier;
  if (!lazy protocol witness table cache variable for type CombineIdentifier and conformance CombineIdentifier)
  {
    unint64_t result = MEMORY[0x186E22960]( &protocol conformance descriptor for CombineIdentifier,  &type metadata for CombineIdentifier);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type CombineIdentifier and conformance CombineIdentifier);
  }

  return result;
}

ValueMetadata *type metadata accessor for CombineIdentifier()
{
  return &type metadata for CombineIdentifier;
}

uint64_t dispatch thunk of CustomCombineIdentifierConvertible.combineIdentifier.getter( uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void Publisher.debounce<A>(for:scheduler:options:)( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v27 = a1;
  uint64_t v30 = a7;
  uint64_t v31 = a6;
  uint64_t v28 = a2;
  uint64_t v29 = a3;
  swift_getAssociatedTypeWitness();
  uint64_t v9 = type metadata accessor for Optional();
  uint64_t v24 = *(void *)(v9 - 8);
  uint64_t v25 = v9;
  uint64_t v10 = MEMORY[0x1895F8858](v9);
  int v12 = (char *)&v24 - v11;
  uint64_t v13 = *(void *)(a5 - 8);
  MEMORY[0x1895F8858](v10);
  unsigned int v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v17 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v18 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  __int128 v20 = (char *)&v24 - v19;
  MEMORY[0x1895F8858](v18);
  uint64_t v22 = (char *)&v24 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v22, v26, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v20, v27, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v28, a5);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v12, v29, v25);
  Publishers.Debounce.init(upstream:dueTime:scheduler:options:)((uint64_t)v22, a4, v30);
}

  ;
}

void Publishers.Debounce.init(upstream:dueTime:scheduler:options:)( uint64_t a1@<X0>, uint64_t a2@<X4>, uint64_t a3@<X8>)
{
}

uint64_t sub_183B75DDC(int *a1)
{
  uint64_t v7 = v3 + a1[13];
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32LL))( v7,  v5,  AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 32LL))(v3 + a1[14], v4, v2);
  uint64_t v9 = v3 + a1[15];
  swift_getAssociatedTypeWitness();
  uint64_t v10 = type metadata accessor for Optional();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))(v9, v1, v10);
}

void type metadata accessor for Publishers.Debounce()
{
}

uint64_t Publishers.Debounce.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 16LL))(a2, v2);
}

uint64_t Publishers.Debounce.dueTime.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 52);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16LL))( a2,  v4,  AssociatedTypeWitness);
}

uint64_t Publishers.Debounce.scheduler.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) - 8LL) + 16LL))( a2,  v2 + *(int *)(a1 + 56));
}

uint64_t Publishers.Debounce.options.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 60);
  swift_getAssociatedTypeWitness();
  uint64_t v5 = type metadata accessor for Optional();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, v4, v5);
}

void Publishers.Debounce.receive<A>(subscriber:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = a4;
  uint64_t v21 = a1;
  uint64_t v6 = a2[5];
  uint64_t v7 = a2[3];
  swift_getAssociatedTypeWitness();
  uint64_t v22 = type metadata accessor for Optional();
  uint64_t v20 = *(void *)(v22 - 8);
  uint64_t v8 = MEMORY[0x1895F8858](v22);
  uint64_t v19 = (char *)&v14 - v9;
  uint64_t v17 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858](v8);
  int v16 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  MEMORY[0x1895F8858](v12);
  uint64_t v13 = a2[2];
  uint64_t v15 = a2[4];
  uint64_t v23 = v13;
  uint64_t v24 = v7;
  uint64_t v25 = a3;
  uint64_t v26 = v15;
  uint64_t v27 = v6;
  uint64_t v28 = v18;
  type metadata accessor for Publishers.Debounce.Inner();
}

void sub_183B761F0()
{
  uint64_t v9 = *(void *)(v8 - 136);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v9 + v1[13], v3);
  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(v8 - 184) + 16LL))( *(void *)(v8 - 192),  v9 + v1[14],  v2);
  (*(void (**)(void, uint64_t, void))(*(void *)(v8 - 160) + 16LL))( *(void *)(v8 - 168),  v9 + v1[15],  *(void *)(v8 - 144));
  swift_allocObject();
  Publishers.Debounce.Inner.init(_:dueTime:scheduler:options:)();
}

uint64_t sub_183B76284(uint64_t a1)
{
  *(void *)(v3 - 128) = a1;
  uint64_t v4 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.Debounce<A, B>.Inner<A1>, v2);
  Publisher.subscribe<A>(_:)(v3 - 128, v1, v2, *(void *)(v3 - 200), v4);
  return swift_release();
}

void type metadata accessor for Publishers.Debounce.Inner()
{
}

void Publishers.Debounce.Inner.__allocating_init(_:dueTime:scheduler:options:)()
{
}

  ;
}

uint64_t Publishers.Debounce.Inner.CancellerState.cancel()(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 - 8);
  uint64_t result = (*(uint64_t (**)(__int128 *, uint64_t, uint64_t))(v3 + 16))(&v10, v1, a1);
  if (v11 != 1)
  {
    if (v11)
    {
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, a1);
      outlined init with take of Subscription(&v10, (uint64_t)v7);
      *(void *)(v1 + 8) = 0LL;
      *(void *)(v1 + 16) = 0LL;
      *(void *)uint64_t v1 = 0LL;
      *(_OWORD *)(v1 + 24) = xmmword_183B9D5C0;
      uint64_t v5 = v8;
      uint64_t v6 = v9;
      __swift_project_boxed_opaque_existential_1(v7, v8);
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
    }

    else
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v1, a1);
      *(void *)uint64_t v1 = 0LL;
      *(void *)(v1 + 8) = 0LL;
      *(void *)(v1 + 16) = 0LL;
      *(_OWORD *)(v1 + 24) = xmmword_183B9D5C0;
    }
  }

  return result;
}

void Publishers.Debounce.Inner.customMirror.getter()
{
  os_unfair_lock_t v1 = *v0;
  uint64_t v2 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1895F8858](v2);
  uint64_t v4 = &v17[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1895F8858](v5);
  uint64_t v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  os_unfair_lock_lock(v0[2]);
  uint64_t v18 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_183B9EBF0;
  *(void *)(v8 + 32) = 0x657274736E776F64LL;
  *(void *)(v8 + 40) = 0xEA00000000006D61LL;
  uint64_t v9 = (char *)v0 + *(void *)&(*v0)[36]._os_unfair_lock_opaque;
  uint64_t v10 = *(void *)&v1[24]._os_unfair_lock_opaque;
  *(void *)(v8 + 72) = v10;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v8 + 48));
  (*(void (**)(uint64_t *, char *, uint64_t))(*(void *)(v10 - 8) + 16LL))( boxed_opaque_existential_1,  v9,  v10);
  *(void *)(v8 + 80) = 0xD000000000000010LL;
  *(void *)(v8 + 88) = 0x8000000183BA8230LL;
  os_unfair_lock_t v12 = *v0;
  *(void *)(v8 + 96) = *(os_unfair_lock_t *)((char *)v0 + *(void *)&(*v0)[52]._os_unfair_lock_opaque);
  *(void *)(v8 + 120) = &type metadata for Subscribers.Demand;
  strcpy((char *)(v8 + 128), "currentValue");
  *(_BYTE *)(v8 + 141) = 0;
  *(_WORD *)(v8 + 142) = -5120;
  uint64_t v13 = (char *)v0 + *(void *)&v12[48]._os_unfair_lock_opaque;
  swift_beginAccess();
  swift_getAssociatedTypeWitness();
  uint64_t v14 = type metadata accessor for Optional();
  *(void *)(v8 + 168) = v14;
  uint64_t v15 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v8 + 144));
  (*(void (**)(uint64_t *, char *, uint64_t))(*(void *)(v14 - 8) + 16LL))(v15, v13, v14);
  uint64_t v16 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v7, 1LL, 1LL, v16);
  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)((uint64_t)v4);
  swift_retain();
  Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
  os_unfair_lock_unlock(v0[2]);
}

void Publishers.Debounce.Inner.playgroundDescription.getter(void *a1@<X8>)
{
  a1[3] = MEMORY[0x189617FA8];
  *a1 = 0x65636E756F626544LL;
  a1[1] = 0xE800000000000000LL;
}

void Publishers.Debounce.Inner.init(_:dueTime:scheduler:options:)()
{
  os_unfair_lock_t v1 = (_DWORD *)swift_slowAlloc();
  *os_unfair_lock_t v1 = 0;
  v0[2] = v1;
  uint64_t v2 = (void *)swift_slowAlloc();
  *uint64_t v2 = 0LL;
  v0[3] = v2;
  uint64_t v3 = (char *)v0 + *(void *)(*v0 + 176LL);
  *((void *)v3 + 4) = 0LL;
  *(_OWORD *)uint64_t v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  v3[40] = 2;
  type metadata accessor for Publishers.Debounce.Inner.CancellerState();
}

uint64_t sub_183B76750()
{
  *(void *)(v1 + (*(void (**)(uint64_t, void, uint64_t))(v4 + 16))(v7, *(void *)(v9 - 120), v6) = Dictionary.init()();
  uint64_t v7 = v1 + *(void *)(*(void *)v1 + 192LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL))( v7,  1LL,  1LL,  AssociatedTypeWitness);
  *(void *)(v1 + *(void *)(*(void *)v1 + 200LL)) = 0LL;
  *(void *)(v1 + *(void *)(*(void *)v1 + 208LL)) = 0LL;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 32LL))(v1 + *(void *)(*(void *)v1 + 144LL), v5);
  uint64_t v9 = v1 + *(void *)(*(void *)v1 + 152LL);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v10 = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))(v9, v3, v10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))( v1 + *(void *)(*(void *)v1 + 160LL),  v2,  v4);
  uint64_t v11 = v1 + *(void *)(*(void *)v1 + 168LL);
  swift_getAssociatedTypeWitness();
  uint64_t v12 = type metadata accessor for Optional();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32LL))(v11, v0, v12);
  return v1;
}

void Publishers.Debounce.Inner.deinit()
{
}

void Publishers.Debounce.Inner.__deallocating_deinit()
{
}

uint64_t sub_183B76CE8()
{
  return swift_deallocClassInstance();
}

void Publishers.Debounce.Inner.request(_:)(uint64_t a1)
{
  uint64_t v3 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v3);
  uint64_t v4 = (uint64_t)v1 + *(void *)(*v1 + 176LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v4, (uint64_t)v8);
  LODWORD((*(void (**)(uint64_t, void, uint64_t))(*(void *)(v4 - 8) + 16LL))(v3, *(void *)(v6 - 152), v4) = v8[40];
  outlined destroy of SubscriptionStatus((uint64_t)v8);
  if ((_DWORD)v4) {
    goto LABEL_10;
  }
  uint64_t v5 = *(void *)(*v1 + 208LL);
  uint64_t v6 = *(void *)((char *)v1 + v5);
  unint64_t v7 = 0x8000000000000000LL;
  if (v6 == 0x8000000000000000LL) {
    goto LABEL_10;
  }
  if (a1 == 0x8000000000000000LL)
  {
LABEL_9:
    *(void *)((char *)v1 + (*(void (**)(uint64_t, void, uint64_t))(v1 + 16))(v9, *(void *)(v10 - 128), v5) = v7;
LABEL_10:
    os_unfair_lock_unlock(v3);
    return;
  }

  if ((v6 | a1) < 0)
  {
    __break(1u);
    goto LABEL_12;
  }

  unint64_t v7 = v6 + a1;
  if (__OFADD__(v6, a1))
  {
    unint64_t v7 = 0x8000000000000000LL;
    goto LABEL_9;
  }

  if ((v7 & 0x8000000000000000LL) == 0) {
    goto LABEL_9;
  }
LABEL_12:
  __break(1u);
}

void Publishers.Debounce.Inner.cancel()()
{
  uint64_t v1 = (_OWORD *)*v0;
  uint64_t v2 = (os_unfair_lock_s *)v0[2];
  os_unfair_lock_lock(v2);
  uint64_t v3 = (uint64_t)v0 + *(void *)(*v0 + 176LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v3, (uint64_t)v5);
  if (!v5[40])
  {
    outlined init with take of Subscription((__int128 *)v5, (uint64_t)v6);
    *(void *)uint64_t v5 = 1LL;
    memset(&v5[8], 0, 32);
    v5[40] = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)v5, v3);
    swift_endAccess();
    *(void *)((char *)v0 + *(void *)(*v0 + 208LL)) = 0LL;
    swift_beginAccess();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    __int128 v4 = v1[6];
    *(_OWORD *)uint64_t v5 = v1[5];
    *(_OWORD *)&v5[16] = v4;
    *(_OWORD *)&v5[32] = v1[7];
    type metadata accessor for Publishers.Debounce.Inner.CancellerState();
  }

  outlined destroy of SubscriptionStatus((uint64_t)v5);
  os_unfair_lock_unlock(v2);
}

uint64_t Publishers.Debounce.Inner.receive(subscription:)(void *a1)
{
  uint64_t v3 = *v1;
  __int128 v4 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v4);
  uint64_t v5 = (uint64_t)v1 + *(void *)(*v1 + 176);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v5, (uint64_t)&v15);
  if (v18 == 2
    && (int8x16_t v6 = vorrq_s8(v16, v17),
        !(*(void *)&vorr_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)) | (unint64_t)v15)))
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v15);
    outlined init with copy of Subscription((uint64_t)a1, (uint64_t)&v15);
    char v18 = 0;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v15, v5);
    swift_endAccess();
    os_unfair_lock_unlock(v4);
    os_unfair_recursive_lock_lock_with_options();
    v17.i64[0] = v3;
    v17.i64[1] = (uint64_t)&protocol witness table for Publishers.Debounce<A, B>.Inner<A1>;
    uint64_t v15 = v1;
    uint64_t v10 = *(void *)(v3 + 120);
    uint64_t v11 = *(void (**)(uint64_t **, uint64_t, uint64_t))(v10 + 40);
    uint64_t v12 = *(void *)(v3 + 96);
    swift_retain();
    v11(&v15, v12, v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v15);
    os_unfair_recursive_lock_unlock();
    uint64_t v13 = a1[3];
    uint64_t v14 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v13);
    return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v14 + 24))(0x8000000000000000LL, v13, v14);
  }

  else
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v15);
    os_unfair_lock_unlock(v4);
    uint64_t v8 = a1[3];
    uint64_t v7 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v8);
    return (*(uint64_t (**)(uint64_t))(*(void *)(v7 + 8) + 8LL))(v8);
  }

uint64_t Publishers.Debounce.Inner.receive(_:)(char *a1)
{
  uint64_t v2 = v1;
  uint64_t v31 = a1;
  uint64_t v3 = (void *)*v1;
  uint64_t v4 = *(void *)(*v1 + 112LL);
  uint64_t v5 = *(void *)(*v1 + 88LL);
  swift_getAssociatedTypeWitness();
  uint64_t v39 = v4;
  uint64_t v41 = v5;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v37 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v36 = (char *)v30 - v6;
  uint64_t v7 = swift_checkMetadataState();
  uint64_t v32 = *(void **)(v7 - 8);
  uint64_t v8 = MEMORY[0x1895F8858](v7);
  uint64_t v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v8);
  uint64_t v12 = (char *)v30 - v11;
  uint64_t v13 = v3[12];
  uint64_t v34 = v3[15];
  uint64_t v33 = v13;
  uint64_t v14 = swift_getAssociatedTypeWitness();
  uint64_t v15 = type metadata accessor for Optional();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x1895F8858](v15);
  char v18 = (char *)v30 - v17;
  os_unfair_lock_t v42 = (os_unfair_lock_t)v2[2];
  os_unfair_lock_lock(v42);
  uint64_t v19 = (uint64_t)v2 + *(void *)(*v2 + 176LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v19, (uint64_t)v43);
  LODWORD(v19) = v44;
  outlined destroy of SubscriptionStatus((uint64_t)v43);
  if (!(_DWORD)v19)
  {
    uint64_t v20 = *(void *)(*v2 + 200LL);
    ++*(void *)((char *)v2 + v20);
    uint64_t v40 = v12;
    uint64_t v21 = v7;
    uint64_t v22 = *(void *)(v14 - 8);
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v18, v31, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v18, 0LL, 1LL, v14);
    uint64_t v23 = (char *)v2 + *(void *)(*v2 + 192LL);
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v23, v18, v15);
    swift_endAccess();
    v30[1] = *(void *)((char *)v2 + v20);
    v30[2] = (char *)v2 + *(void *)(*v2 + 160LL);
    uint64_t v24 = v39;
    uint64_t v25 = v41;
    (*(void (**)(uint64_t, uint64_t))(v39 + 40))(v41, v39);
    uint64_t v31 = (char *)v2 + *(void *)(*v2 + 152LL);
    dispatch thunk of Strideable.advanced(by:)();
    uint64_t v26 = (void *)v32[1];
    v30[0] = v21;
    uint64_t v32 = v26;
    ((void (*)(char *, uint64_t))v26)(v10, v21);
    swift_beginAccess();
    swift_beginAccess();
    uint64_t v27 = v3[10];
    uint64_t v28 = v3[13];
    swift_bridgeObjectRetain();
    v43[0] = v27;
    v43[1] = v25;
    v43[2] = v33;
    v43[3] = v28;
    v43[4] = v24;
    uint64_t v44 = v34;
    type metadata accessor for Publishers.Debounce.Inner.CancellerState();
  }

  os_unfair_lock_unlock(v42);
  return 0LL;
}

void closure #1 in Publishers.Debounce.Inner.receive(_:)(void *a1, uint64_t a2)
{
  uint64_t v4 = (void *)*a1;
  uint64_t v5 = *(void *)(*a1 + 112LL);
  uint64_t v6 = *(void *)(*a1 + 88LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v24[3] = swift_getAssociatedConformanceWitness();
  uint64_t v26 = AssociatedTypeWitness;
  uint64_t v25 = swift_getAssociatedTypeWitness();
  v24[4] = *(void *)(v25 - 8);
  MEMORY[0x1895F8858](v25);
  v24[2] = (char *)v24 - v8;
  uint64_t v9 = v4[12];
  uint64_t v30 = v4[15];
  uint64_t v31 = v9;
  uint64_t v10 = swift_getAssociatedTypeWitness();
  uint64_t v11 = type metadata accessor for Optional();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1895F8858](v11);
  uint64_t v15 = (char *)v24 - v14;
  uint64_t v28 = v10;
  uint64_t v29 = *(void *)(v10 - 8);
  MEMORY[0x1895F8858](v13);
  uint64_t v27 = (char *)v24 - v16;
  uint64_t v17 = (os_unfair_lock_s *)a1[2];
  os_unfair_lock_lock(v17);
  uint64_t v18 = (uint64_t)a1 + *(void *)(*a1 + 176LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v18, (uint64_t)&v32);
  outlined init with copy of SubscriptionStatus((uint64_t)&v32, (uint64_t)v39);
  LODWORD(v18) = v39[40];
  outlined destroy of SubscriptionStatus((uint64_t)v39);
  outlined destroy of SubscriptionStatus((uint64_t)&v32);
  if (v18 <= 1)
  {
    v24[1] = v17;
    if (*(void *)((char *)a1 + *(void *)(*a1 + 200LL)) == a2)
    {
      uint64_t v19 = (char *)a1 + *(void *)(*a1 + 192LL);
      swift_beginAccess();
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v19, v11);
      uint64_t v20 = v29;
      uint64_t v21 = v28;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v15, 1LL, v28) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v27, v15, v21);
        swift_beginAccess();
        uint64_t v23 = v4[13];
        uint64_t v32 = v4[10];
        uint64_t v33 = v6;
        uint64_t v34 = v31;
        uint64_t v35 = v23;
        uint64_t v36 = v5;
        uint64_t v37 = v30;
        uint64_t v38 = a2;
        type metadata accessor for Publishers.Debounce.Inner.CancellerState();
      }

      (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    }

    swift_beginAccess();
    uint64_t v22 = v4[13];
    uint64_t v32 = v4[10];
    uint64_t v33 = v6;
    uint64_t v34 = v31;
    uint64_t v35 = v22;
    uint64_t v36 = v5;
    uint64_t v37 = v30;
    uint64_t v38 = a2;
    type metadata accessor for Publishers.Debounce.Inner.CancellerState();
  }

  os_unfair_lock_unlock(v17);
}

void Publishers.Debounce.Inner.receive(completion:)(uint64_t a1)
{
  uint64_t v27 = a1;
  uint64_t v2 = *(void *)(*v1 + 120LL);
  uint64_t v23 = (void *)*v1;
  uint64_t v3 = v23[12];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v7 = type metadata accessor for Subscribers.Completion(0LL, AssociatedTypeWitness, AssociatedConformanceWitness, v6);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x1895F8858](v7);
  uint64_t v11 = (char *)v22 - v10;
  uint64_t v25 = v2;
  uint64_t v12 = swift_getAssociatedTypeWitness();
  uint64_t v24 = type metadata accessor for Optional();
  uint64_t v13 = *(void *)(v24 - 8);
  MEMORY[0x1895F8858](v24);
  uint64_t v15 = (char *)v22 - v14;
  os_unfair_lock_t v26 = (os_unfair_lock_t)v1[2];
  os_unfair_lock_lock(v26);
  uint64_t v16 = (uint64_t)v1 + *(void *)(*v1 + 176LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v16, (uint64_t)&v28);
  if (!(_BYTE)v32)
  {
    v22[4] = v9;
    v22[5] = v11;
    v22[6] = v8;
    v22[7] = v7;
    outlined init with take of Subscription(&v28, (uint64_t)v33);
    outlined init with copy of Subscription((uint64_t)v33, (uint64_t)&v28);
    LOBYTE(v32) = 1;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v28, v16);
    swift_endAccess();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v15, 1LL, 1LL, v12);
    uint64_t v17 = (char *)v1 + *(void *)(*v1 + 192LL);
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v17, v15, v24);
    swift_endAccess();
    uint64_t v24 = (uint64_t)v1;
    swift_beginAccess();
    swift_beginAccess();
    uint64_t v19 = v23[10];
    uint64_t v18 = (void *)v23[11];
    uint64_t v21 = v23[13];
    uint64_t v20 = v23[14];
    swift_bridgeObjectRetain();
    v22[2] = v19;
    *(void *)&__int128 v28 = v19;
    *((void *)&v28 + 1) = v18;
    uint64_t v23 = v18;
    uint64_t v29 = v3;
    uint64_t v30 = v21;
    v22[1] = v21;
    void v22[3] = v20;
    uint64_t v31 = v20;
    uint64_t v32 = v25;
    type metadata accessor for Publishers.Debounce.Inner.CancellerState();
  }

  outlined destroy of SubscriptionStatus((uint64_t)&v28);
  os_unfair_lock_unlock(v26);
}

uint64_t closure #1 in Publishers.Debounce.Inner.receive(completion:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  os_unfair_recursive_lock_lock_with_options();
  (*(void (**)(uint64_t, void))(*(void *)(v3 + 120) + 56LL))(a2, *(void *)(v3 + 96));
  return os_unfair_recursive_lock_unlock();
}

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.Debounce<A, B>.Inner<A1>( void *a1)
{
  return Publishers.Debounce.Inner.receive(subscription:)(a1);
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance Publishers.Debounce<A, B>.Inner<A1>( char *a1)
{
  return Publishers.Debounce.Inner.receive(_:)(a1);
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.Debounce<A, B>.Inner<A1>( uint64_t a1)
{
}

void protocol witness for Subscription.request(_:) in conformance Publishers.Debounce<A, B>.Inner<A1>( uint64_t a1)
{
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Debounce<A, B>.Inner<A1>()
{
  return 0x65636E756F626544LL;
}

void protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Debounce<A, B>.Inner<A1>()
{
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Debounce<A, B>.Inner<A1>( void *a1@<X8>)
{
}

void protocol witness for Cancellable.cancel() in conformance Publishers.Debounce<A, B>.Inner<A1>()
{
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Debounce<A, B>( uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
}

uint64_t type metadata completion function for Publishers.Debounce()
{
  uint64_t AssociatedTypeWitness = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      uint64_t AssociatedTypeWitness = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        swift_getAssociatedTypeWitness();
        uint64_t AssociatedTypeWitness = type metadata accessor for Optional();
        if (v4 <= 0x3F)
        {
          swift_initStructMetadata();
          return 0LL;
        }
      }
    }
  }

  return AssociatedTypeWitness;
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.Debounce(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 24);
  uint64_t v44 = *(void *)(a3 + 16);
  uint64_t v45 = *(void *)(v44 - 8);
  uint64_t v4 = *(void *)(v45 + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  int v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = v7;
  uint64_t v40 = v4 + v7;
  uint64_t v9 = (v4 + v8) & ~v8;
  uint64_t v10 = *(void *)(v3 - 8);
  int v11 = *(_DWORD *)(v10 + 80);
  uint64_t v12 = v11;
  uint64_t v41 = *(void *)(v6 + 64) + v11;
  unint64_t v13 = (v41 + v9) & ~(unint64_t)v11;
  uint64_t v42 = v10;
  uint64_t v43 = AssociatedTypeWitness;
  uint64_t v14 = *(void *)(v10 + 64);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v16 = *(void *)(v15 - 8);
  int v17 = *(_DWORD *)(v16 + 80);
  uint64_t v18 = v17;
  uint64_t v19 = v14 + v17;
  if (*(_DWORD *)(v16 + 84)) {
    uint64_t v20 = *(void *)(v16 + 64);
  }
  else {
    uint64_t v20 = *(void *)(v16 + 64) + 1LL;
  }
  int v21 = v7 | *(_DWORD *)(v45 + 80) | v11 | v17;
  uint64_t v22 = (v7 | *(_BYTE *)(v45 + 80) | v11 | v17);
  int v23 = v21 & 0x100000;
  if (v22 <= 7 && v20 + ((v19 + v13) & ~v18) <= 0x18 && v23 == 0)
  {
    unint64_t v28 = ~(unint64_t)v7;
    uint64_t v29 = ~v12;
    size_t __n = v20;
    uint64_t v39 = ~v18;
    uint64_t v27 = a1;
    uint64_t v30 = v15;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v45 + 16))(a1, a2, v44);
    unint64_t v31 = ((unint64_t)a1 + v40) & ~v8;
    unint64_t v32 = ((unint64_t)a2 + v40) & v28;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16))(v31, v32, v43);
    unint64_t v33 = (v31 + v41) & v29;
    unint64_t v34 = (v32 + v41) & v29;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v42 + 16))(v33, v34, v3);
    uint64_t v35 = (void *)((v33 + v19) & v39);
    uint64_t v36 = (const void *)((v34 + v19) & v39);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48))(v36, 1LL, v30))
    {
      memcpy(v35, v36, __n);
    }

    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v16 + 16))(v35, v36, v30);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v35, 0LL, 1LL, v30);
    }
  }

  else
  {
    uint64_t v26 = *a2;
    *a1 = *a2;
    uint64_t v27 = (uint64_t *)(v26 + ((v22 + 16) & ~v22));
    swift_retain();
  }

  return v27;
}

uint64_t destroy for Publishers.Debounce(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8LL);
  (*(void (**)(void))(v4 + 8))();
  uint64_t v5 = *(void *)(v4 + 64) + a1;
  uint64_t v6 = *(void *)(a2 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  unint64_t v9 = (v5 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v9, AssociatedTypeWitness);
  uint64_t v10 = *(void *)(v6 - 8);
  unint64_t v11 = (v9 + *(void *)(v8 + 64) + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  (*(void (**)(unint64_t, uint64_t))(v10 + 8))(v11, v6);
  uint64_t v12 = *(void *)(v10 + 64);
  uint64_t v13 = swift_getAssociatedTypeWitness();
  uint64_t v14 = *(void *)(v13 - 8);
  unint64_t v15 = (v11 + v12 + *(unsigned __int8 *)(v14 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v14 + 48))(v15, 1LL, v13);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(unint64_t, uint64_t))(v14 + 8))(v15, v13);
  }
  return result;
}

uint64_t initializeWithCopy for Publishers.Debounce(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v6 + 16))();
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v11 + a1) & ~v11;
  uint64_t v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v12, v13, AssociatedTypeWitness);
  uint64_t v14 = *(void *)(v8 - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = *(void *)(v10 + 64) + v15;
  uint64_t v17 = (v16 + v12) & ~v15;
  uint64_t v18 = (v16 + v13) & ~v15;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v17, v18, v8);
  uint64_t v19 = *(void *)(v14 + 64);
  uint64_t v20 = swift_getAssociatedTypeWitness();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(unsigned __int8 *)(v21 + 80);
  int v23 = (void *)((v19 + v22 + v17) & ~v22);
  uint64_t v24 = (const void *)((v19 + v22 + v18) & ~v22);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48))(v24, 1LL, v20))
  {
    if (*(_DWORD *)(v21 + 84)) {
      size_t v25 = *(void *)(v21 + 64);
    }
    else {
      size_t v25 = *(void *)(v21 + 64) + 1LL;
    }
    memcpy(v23, v24, v25);
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v21 + 16))(v23, v24, v20);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v23, 0LL, 1LL, v20);
  }

  return a1;
}

uint64_t assignWithCopy for Publishers.Debounce(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v6 + 24))();
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v11 + a1) & ~v11;
  uint64_t v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24))(v12, v13, AssociatedTypeWitness);
  uint64_t v14 = *(void *)(v8 - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = *(void *)(v10 + 64) + v15;
  uint64_t v17 = (v16 + v12) & ~v15;
  uint64_t v18 = (v16 + v13) & ~v15;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 24))(v17, v18, v8);
  uint64_t v19 = *(void *)(v14 + 64);
  uint64_t v20 = swift_getAssociatedTypeWitness();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(unsigned __int8 *)(v21 + 80);
  int v23 = (void *)((v19 + v22 + v17) & ~v22);
  uint64_t v24 = (void *)((v19 + v22 + v18) & ~v22);
  size_t v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  LODWORD(v18) = v25(v23, 1LL, v20);
  int v26 = v25(v24, 1LL, v20);
  if ((_DWORD)v18)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 16))(v23, v24, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v23, 0LL, 1LL, v20);
      return a1;
    }
  }

  else
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 24))(v23, v24, v20);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v21 + 8))(v23, v20);
  }

  if (*(_DWORD *)(v21 + 84)) {
    size_t v27 = *(void *)(v21 + 64);
  }
  else {
    size_t v27 = *(void *)(v21 + 64) + 1LL;
  }
  memcpy(v23, v24, v27);
  return a1;
}

uint64_t initializeWithTake for Publishers.Debounce(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v6 + 32))();
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v11 + a1) & ~v11;
  uint64_t v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v12, v13, AssociatedTypeWitness);
  uint64_t v14 = *(void *)(v8 - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = *(void *)(v10 + 64) + v15;
  uint64_t v17 = (v16 + v12) & ~v15;
  uint64_t v18 = (v16 + v13) & ~v15;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v17, v18, v8);
  uint64_t v19 = *(void *)(v14 + 64);
  uint64_t v20 = swift_getAssociatedTypeWitness();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(unsigned __int8 *)(v21 + 80);
  int v23 = (void *)((v19 + v22 + v17) & ~v22);
  uint64_t v24 = (const void *)((v19 + v22 + v18) & ~v22);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48))(v24, 1LL, v20))
  {
    if (*(_DWORD *)(v21 + 84)) {
      size_t v25 = *(void *)(v21 + 64);
    }
    else {
      size_t v25 = *(void *)(v21 + 64) + 1LL;
    }
    memcpy(v23, v24, v25);
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v21 + 32))(v23, v24, v20);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v23, 0LL, 1LL, v20);
  }

  return a1;
}

uint64_t assignWithTake for Publishers.Debounce(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v6 + 40))();
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v11 + a1) & ~v11;
  uint64_t v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 40))(v12, v13, AssociatedTypeWitness);
  uint64_t v14 = *(void *)(v8 - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = *(void *)(v10 + 64) + v15;
  uint64_t v17 = (v16 + v12) & ~v15;
  uint64_t v18 = (v16 + v13) & ~v15;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 40))(v17, v18, v8);
  uint64_t v19 = *(void *)(v14 + 64);
  uint64_t v20 = swift_getAssociatedTypeWitness();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(unsigned __int8 *)(v21 + 80);
  int v23 = (void *)((v19 + v22 + v17) & ~v22);
  uint64_t v24 = (void *)((v19 + v22 + v18) & ~v22);
  size_t v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  LODWORD(v18) = v25(v23, 1LL, v20);
  int v26 = v25(v24, 1LL, v20);
  if ((_DWORD)v18)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 32))(v23, v24, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v23, 0LL, 1LL, v20);
      return a1;
    }
  }

  else
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 40))(v23, v24, v20);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v21 + 8))(v23, v20);
  }

  if (*(_DWORD *)(v21 + 84)) {
    size_t v27 = *(void *)(v21 + 64);
  }
  else {
    size_t v27 = *(void *)(v21 + 64) + 1LL;
  }
  memcpy(v23, v24, v27);
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.Debounce(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v36 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v36 - 8);
  unsigned int v6 = *(_DWORD *)(v5 + 84);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  unsigned int v37 = v6;
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = *(void *)(v4 - 8);
  uint64_t v11 = *(unsigned int *)(v10 + 84);
  else {
    unsigned int v12 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v13 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  int v14 = *(_DWORD *)(v13 + 84);
  unsigned int v15 = v14 - 1;
  if (!v14) {
    unsigned int v15 = 0;
  }
  if (v15 <= v12) {
    unsigned int v15 = v12;
  }
  if (v14) {
    uint64_t v16 = *(void *)(v13 + 64);
  }
  else {
    uint64_t v16 = *(void *)(v13 + 64) + 1LL;
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v17 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v18 = *(void *)(v5 + 64) + v17;
  uint64_t v19 = *(void *)(v7 + 64);
  uint64_t v20 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v21 = *(void *)(v10 + 64);
  uint64_t v22 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v23 = a1;
  if (a2 <= v15) {
    goto LABEL_33;
  }
  uint64_t v24 = v16 + ((v21 + v22 + ((v19 + v20 + (v18 & ~v17)) & ~v20)) & ~v22);
  char v25 = 8 * v24;
  unsigned int v27 = ((a2 - v15 + ~(-1 << v25)) >> v25) + 1;
  if (HIWORD(v27))
  {
    int v26 = *(_DWORD *)(a1 + v24);
    if (!v26) {
      goto LABEL_33;
    }
    goto LABEL_24;
  }

  if (v27 > 0xFF)
  {
    int v26 = *(unsigned __int16 *)(a1 + v24);
    if (!*(_WORD *)(a1 + v24)) {
      goto LABEL_33;
    }
    goto LABEL_24;
  }

  if (v27 >= 2)
  {
LABEL_17:
    int v26 = *(unsigned __int8 *)(a1 + v24);
    if (!*(_BYTE *)(a1 + v24)) {
      goto LABEL_33;
    }
LABEL_24:
    int v28 = (v26 - 1) << v25;
    if ((_DWORD)v24)
    {
      else {
        int v29 = 4;
      }
      __asm { BR              X12 }
    }

    return v15 + v28 + 1;
  }

LABEL_33:
  if (!v15) {
    return 0LL;
  }
  if (v37 == v15)
  {
    uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    uint64_t v31 = v37;
    uint64_t v32 = v36;
    return v30(v23, v31, v32);
  }

  uint64_t v23 = (v18 + a1) & ~v17;
  if ((_DWORD)v8 == v15)
  {
    uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v31 = v8;
    uint64_t v32 = AssociatedTypeWitness;
    return v30(v23, v31, v32);
  }

  uint64_t v23 = (v23 + v19 + v20) & ~v20;
  if ((_DWORD)v11 == v15)
  {
    uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    uint64_t v31 = v11;
    uint64_t v32 = v4;
    return v30(v23, v31, v32);
  }

  unsigned int v33 = (*(uint64_t (**)(uint64_t))(v13 + 48))((v23 + v21 + v22) & ~v22);
  if (v33 >= 2) {
    return v33 - 1;
  }
  else {
    return 0LL;
  }
}

  __break(1u);
}

  if (!v15) {
    return 0LL;
  }
  if (v40 == v15)
  {
    uint64_t v32 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    unsigned int v33 = v40;
    unint64_t v34 = v39;
    return v32(v25, v33, v34);
  }

  uint64_t v35 = ~v17;
  char v25 = (v18 + a1) & v35;
  if ((_DWORD)v8 == v15)
  {
    uint64_t v32 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    unsigned int v33 = v8;
    unint64_t v34 = AssociatedTypeWitness;
    return v32(v25, v33, v34);
  }

  char v25 = (v22 + ((v20 + v25) & v35)) & ~v21;
  if ((_DWORD)v11 == v15)
  {
    uint64_t v32 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    unsigned int v33 = v11;
    unint64_t v34 = v4;
    return v32(v25, v33, v34);
  }

  uint64_t v36 = (*(uint64_t (**)(uint64_t))(v13 + 48))((v24 + v25) & ~v23);
  if (v36 >= 2) {
    return v36 - 1;
  }
  else {
    return 0LL;
  }
}

void storeEnumTagSinglePayload for Publishers.Debounce( _BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a4 + 24);
  uint64_t v5 = *(void *)(*(void *)(a4 + 16) - 8LL);
  unsigned int v6 = *(_DWORD *)(v5 + 84);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v7 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v7 + 84) <= v6) {
    unsigned int v8 = v6;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v9 = *(void *)(v4 - 8);
  if (*(_DWORD *)(v9 + 84) <= v8) {
    unsigned int v10 = v8;
  }
  else {
    unsigned int v10 = *(_DWORD *)(v9 + 84);
  }
  unsigned int v11 = 0u;
  uint64_t v12 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  int v13 = *(_DWORD *)(v12 + 84);
  unsigned int v14 = v13 - 1;
  if (!v13) {
    unsigned int v14 = 0;
  }
  if (v14 <= v10) {
    unsigned int v15 = v10;
  }
  else {
    unsigned int v15 = v14;
  }
  uint64_t v16 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v19 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v21 = *(unsigned __int8 *)(v12 + 80);
  if (v13) {
    uint64_t v22 = *(void *)(v12 + 64);
  }
  else {
    uint64_t v22 = *(void *)(v12 + 64) + 1LL;
  }
  uint64_t v20 = *(void *)(v9 + 64);
  uint64_t v18 = *(void *)(v7 + 64);
  uint64_t v17 = *(void *)(v5 + 64) + v16;
  unsigned int v23 = ((v20 + v21 + ((v18 + v19 + (v17 & ~(_DWORD)v16)) & ~(_DWORD)v19)) & ~(_DWORD)v21) + v22;
  if (a3 > v15)
  {
    if (v23 <= 3)
    {
      unsigned int v24 = ((a3 - v15 + ~(-1 << (8 * v23))) >> (8 * v23)) + 1;
      if (HIWORD(v24))
      {
        unsigned int v11 = 4u;
      }

      else if (v24 >= 0x100)
      {
        unsigned int v11 = 2;
      }

      else
      {
        unsigned int v11 = v24 > 1;
      }
    }

    else
    {
      unsigned int v11 = 1u;
    }
  }

  if (v15 < a2)
  {
    unsigned int v25 = ~v15 + a2;
    if (v23 < 4)
    {
      if (v23)
      {
        int v26 = v25 & ~(-1 << (8 * v23));
        bzero(a1, ((v20 + v21 + ((v18 + v19 + (v17 & ~v16)) & ~v19)) & ~v21) + v22);
        if (v23 == 3)
        {
          *(_WORD *)a1 = v26;
          a1[2] = BYTE2(v26);
        }

        else if (v23 == 2)
        {
          *(_WORD *)a1 = v26;
        }

        else
        {
          *a1 = v26;
        }
      }
    }

    else
    {
      bzero(a1, ((v20 + v21 + ((v18 + v19 + (v17 & ~v16)) & ~v19)) & ~v21) + v22);
      *(_DWORD *)a1 = v25;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X6 }

void sub_183B79C24()
{
  *(_BYTE *)(v1 + (*(void (**)(uint64_t, void, uint64_t))(v7 + 16))(v8, *(void *)(v9 - 168), v2) = v0;
}

void sub_183B79C2C()
{
  *(_WORD *)(v1 + (*(void (**)(uint64_t, void, uint64_t))(v7 + 16))(v8, *(void *)(v9 - 168), v2) = v0;
}

void sub_183B79CC0()
{
  *__int16 v0 = v1;
}

void sub_183B79CF4()
{
  *__int16 v0 = v1;
}

void sub_183B79CFC()
{
  *(_WORD *)uint64_t v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
}

void sub_183B79D0C()
{
  *uint64_t v0 = v1;
}

uint64_t type metadata completion function for Publishers.Debounce.Inner()
{
  uint64_t v0 = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v3 > 0x3F) {
      return AssociatedTypeWitness;
    }
    uint64_t v4 = swift_checkMetadataState();
    if (v5 > 0x3F) {
      return v4;
    }
    swift_getAssociatedTypeWitness();
    uint64_t AssociatedTypeWitness = type metadata accessor for Optional();
    if (v6 > 0x3F)
    {
      return AssociatedTypeWitness;
    }

    else
    {
      swift_getAssociatedTypeWitness();
      uint64_t v0 = type metadata accessor for Optional();
      if (v7 <= 0x3F) {
        return swift_initClassMetadata2();
      }
    }
  }

  return v0;
}

void type metadata accessor for Publishers.Debounce.Inner.CancellerState()
{
}

uint64_t sub_183B79F20()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(type metadata accessor for Subscribers.Completion( 0LL,  AssociatedTypeWitness,  AssociatedConformanceWitness,  v3)
                                      - 8)
                          + 80LL);
  uint64_t v5 = (v4 + 72) & ~v4;
  swift_release();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in Publishers.Debounce.Inner.receive(completion:)()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(type metadata accessor for Subscribers.Completion( 0LL,  AssociatedTypeWitness,  AssociatedConformanceWitness,  v3)
                                      - 8)
                          + 80LL);
  return closure #1 in Publishers.Debounce.Inner.receive(completion:)(*(uint64_t **)(v0 + 64), v0 + ((v4 + 72) & ~v4));
}

uint64_t sub_183B7A0A0()
{
  return swift_deallocObject();
}

void partial apply for closure #1 in Publishers.Debounce.Inner.receive(_:)()
{
}

uint64_t Fail.init(error:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 32LL))(a3, a1);
}

uint64_t Fail.init(outputType:failure:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32LL))(a3, a1, a2);
}

uint64_t Fail.error.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) - 8LL) + 16LL))(a2, v2);
}

uint64_t Fail.receive<A>(subscriber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = type metadata accessor for Subscribers.Completion(0LL, v7, *(void *)(a2 + 32), a4);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  unsigned int v11 = (char *)&v14 - v10;
  if (one-time initialization token for singleton != -1) {
    swift_once();
  }
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(a4 + 40))( static Subscriptions._EmptySubscription.singleton,  a3,  a4);
  uint64_t v12 = *(void *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v11, v4, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v11, 0LL, 1LL, v7);
  (*(void (**)(char *, uint64_t, uint64_t))(a4 + 56))(v11, a3, a4);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t protocol witness for Publisher.receive<A>(subscriber:) in conformance Fail<A, B>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Fail.receive<A>(subscriber:)(a1, a4, a2, a3);
}

uint64_t static Fail<>.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)() & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> Fail<A, B>()
{
  return static Fail<>.== infix(_:_:)();
}

uint64_t type metadata completion function for Fail()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t getEnumTagSinglePayload for Fail(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)(v4 + 64);
  char v8 = 8 * v7;
  if (v7 <= 3)
  {
    unsigned int v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)(a1 + v7);
      if (!v9) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }

    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7)) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }

    if (v10 < 2)
    {
LABEL_18:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0LL;
    }
  }

  int v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7)) {
    goto LABEL_18;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (!(_DWORD)v7) {
    return v5 + v11 + 1;
  }
  return ((uint64_t (*)(void))((char *)&loc_183B7A390 + 4 * byte_183BA5820[(v7 - 1)]))();
}

void storeEnumTagSinglePayload for Fail(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 24) - 8LL);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        unsigned int v11 = 4u;
      }

      else if (v13 >= 0x100)
      {
        unsigned int v11 = 2;
      }

      else
      {
        unsigned int v11 = v13 > 1;
      }
    }

    else
    {
      unsigned int v11 = 1u;
    }
  }

  else
  {
    unsigned int v11 = 0u;
  }

  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        int v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }

        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }

        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }

    else
    {
      bzero(a1, *(void *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X11 }

uint64_t type metadata accessor for Fail(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Fail);
}

uint64_t Publisher.last()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v4 + 16))(v6);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(a2, v6, a1);
}

uint64_t Publishers.Last.init(upstream:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 32LL))(a3, a1);
}

uint64_t Publishers.Last.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 16LL))(a2, v2);
}

void Publishers.Last.receive<A>(subscriber:)()
{
  uint64_t v0 = type metadata accessor for Optional();
  MEMORY[0x1895F8858](v0);
  type metadata accessor for Publishers.Last.Inner();
}

uint64_t sub_183B7A6F0(uint64_t a1)
{
  unsigned int v10 = specialized Publishers.Last.Inner.init(downstream:initial:reduce:)(v1, v6);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v5);
  *(void *)(v8 - 112) = v10;
  uint64_t v11 = MEMORY[0x186E22960](&protocol conformance descriptor for ReduceProducer<A, B, C, D, E>, a1);
  Publisher.subscribe<A>(_:)(v8 - 112, v3, a1, v2, v11);
  return swift_release();
}

void type metadata accessor for Publishers.Last.Inner()
{
}

uint64_t Publishers.Last.Inner.description.getter()
{
  return 1953718604LL;
}

uint64_t Publishers.Last.Inner.receive(newValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = type metadata accessor for Optional();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1895F8858](v5);
  BOOL v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v7);
  uint64_t v11 = (char *)&v17 - v10;
  uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v17 - v10, a1, AssociatedTypeWitness);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v11, 0LL, 1LL, AssociatedTypeWitness);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v11, v5);
  uint64_t v13 = v2 + *(void *)(*(void *)v2 + 136LL);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 40))(v13, v9, v5);
  swift_endAccess();
  uint64_t v14 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  type metadata accessor for PartialCompletion(0LL, MEMORY[0x18961AFC8] + 8LL, v14, AssociatedConformanceWitness);
  return swift_storeEnumTagMultiPayload();
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Last<A>()
{
}

uint64_t static Publishers.Last<>.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)() & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.Last<A>()
{
  return static Publishers.Last<>.== infix(_:_:)();
}

uint64_t *specialized Publishers.Last.Inner.init(downstream:initial:reduce:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Optional();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1895F8858](v4);
  uint64_t v8 = (char *)&v14 - v7;
  MEMORY[0x1895F8858](v6);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v11 + 16))(v10, a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a2, v4);
  return ReduceProducer.init(downstream:initial:reduce:)((uint64_t)v10, (uint64_t)v8, v12);
}

uint64_t getEnumTagSinglePayload for Publishers.Last(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)(v4 + 64);
  char v8 = 8 * v7;
  if (v7 <= 3)
  {
    unsigned int v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)(a1 + v7);
      if (!v9) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }

    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7)) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }

    if (v10 < 2)
    {
LABEL_18:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0LL;
    }
  }

  int v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7)) {
    goto LABEL_18;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (!(_DWORD)v7) {
    return v5 + v11 + 1;
  }
  return ((uint64_t (*)(void))((char *)&loc_183B7AB6C + 4 * byte_183BA58A8[(v7 - 1)]))();
}

void storeEnumTagSinglePayload for Publishers.Last(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8LL);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        unsigned int v11 = 4u;
      }

      else if (v13 >= 0x100)
      {
        unsigned int v11 = 2;
      }

      else
      {
        unsigned int v11 = v13 > 1;
      }
    }

    else
    {
      unsigned int v11 = 1u;
    }
  }

  else
  {
    unsigned int v11 = 0u;
  }

  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        int v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }

        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }

        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }

    else
    {
      bzero(a1, *(void *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X11 }

uint64_t type metadata accessor for Publishers.Last(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Last);
}

uint64_t PublisherBoxBase.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t PublisherBoxBase.init()()
{
  return v0;
}

uint64_t PublisherBoxBase.deinit()
{
  return v0;
}

uint64_t PublisherBoxBase.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void PublisherBoxBase.receive<A>(subscriber:)()
{
}

uint64_t PublisherBox.base.getter@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v1 + 120LL) - 8LL) + 16LL))( a1,  v1 + *(void *)(*(void *)v1 + 136LL));
}

uint64_t PublisherBox.init(_:)(uint64_t a1)
{
  return v1;
}

uint64_t PublisherBox.__ivar_destroyer()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 120LL) - 8LL) + 8LL))(v0 + *(void *)(*(void *)v0 + 136LL));
}

uint64_t PublisherBox.deinit()
{
  return v0;
}

void PublisherBox.__allocating_init()()
{
}

void PublisherBox.init()()
{
}

uint64_t AnyPublisher.description.getter()
{
  return 0x696C627550796E41LL;
}

void AnyPublisher.playgroundDescription.getter(uint64_t a1@<X8>)
{
  *(void *)(a1 + 24) = MEMORY[0x189617FA8];
  strcpy((char *)a1, "AnyPublisher");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AnyPublisher<A, B>()
{
  return 0x696C627550796E41LL;
}

void specialized PublisherBox.init()()
{
}

uint64_t type metadata accessor for PublisherBoxBase(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PublisherBoxBase);
}

uint64_t method lookup function for PublisherBoxBase()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PublisherBoxBase.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of PublisherBoxBase.receive<A>(subscriber:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112LL))();
}

uint64_t type metadata completion function for PublisherBox()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t method lookup function for PublisherBox()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PublisherBox.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t Publisher.map<A>(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return Publisher.compactMap<A>(_:)(a1, a2, a3, a4, a5, type metadata accessor for Publishers.Map, a6);
}

uint64_t Publishers.Map.init(upstream:transform:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  return Publishers.CompactMap.init(upstream:transform:)( a1,  a2,  a3,  a4,  a5,  a6,  type metadata accessor for Publishers.Map,  a7);
}

uint64_t type metadata accessor for Publishers.Map(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Map);
}

uint64_t Publisher.tryMap<A>(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return Publisher.compactMap<A>(_:)(a1, a2, a3, a4, a5, type metadata accessor for Publishers.TryMap, a6);
}

uint64_t Publishers.TryMap.init(upstream:transform:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  return Publishers.CompactMap.init(upstream:transform:)( a1,  a2,  a3,  a4,  a5,  a6,  type metadata accessor for Publishers.TryMap,  a7);
}

uint64_t type metadata accessor for Publishers.TryMap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.TryMap);
}

uint64_t Publishers.Map.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 16LL))(a2, v2);
}

void Publishers.Map.receive<A>(subscriber:)(uint64_t a1)
{
}

void sub_183B7B114( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v12 - 128) = *(void *)(a1 - 8);
  MEMORY[0x1895F8858](a1);
  int v14 = (char *)&a9 - v13;
  (*(void (**)(uint64_t, void, uint64_t))(v9 + 16))(v11, *(void *)(v12 - 144), v10);
  swift_retain();
  Publishers.Map.Inner.init(downstream:map:)(v11, v10, (uint64_t)v14);
}

uint64_t sub_183B7B194()
{
  uint64_t v5 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.Map<A, B>.Inner<A1>, v3);
  Publisher.subscribe<A>(_:)(v2, v0, v3, v1, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 128) + 8LL))(v2, v3);
}

void type metadata accessor for Publishers.Map.Inner()
{
}

void Publishers.Map.Inner.init(downstream:map:)( uint64_t a1@<X0>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
}

void sub_183B7B26C(uint64_t a1)
{
  uint64_t v4 = (void *)(v1 + *(int *)(a1 + 60));
  *uint64_t v4 = v3;
  v4[1] = v2;
  uint64_t v5 = *(int *)(a1 + 64);
  if (one-time initialization token for lock != -1) {
    swift_once();
  }
  uint64_t v6 = (os_unfair_lock_s *)static lock in Global #1 in CombineIdentifier.init();
  os_unfair_lock_lock((os_unfair_lock_t)static lock in Global #1 in CombineIdentifier.init());
  uint64_t v7 = static generation in Global #1 in CombineIdentifier.init();
  if (static generation in Global #1 in CombineIdentifier.init() == -1)
  {
    __break(1u);
  }

  else
  {
    ++static generation in Global #1 in CombineIdentifier.init();
    os_unfair_lock_unlock(v6);
    *(void *)(v1 + (*(void (**)(uint64_t, void, uint64_t))(v1 + 16))(v9, *(void *)(v10 - 128), v5) = v7;
  }

void Publishers.Map.Inner.playgroundDescription.getter(void *a1@<X8>)
{
  a1[3] = MEMORY[0x189617FA8];
  *a1 = 7364941LL;
  a1[1] = 0xE300000000000000LL;
}

uint64_t Publishers.Map.Inner.receive(_:)(uint64_t a1, void *a2)
{
  uint64_t v4 = a2[3];
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1895F8858](a1);
  size_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(uint64_t))(v2 + *(int *)(v9 + 60)))(v6);
  uint64_t v10 = (*(uint64_t (**)(char *, void))(a2[6] + 48LL))(v8, a2[4]);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return v10;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Map<A, B>.Inner<A1>()
{
  return 7364941LL;
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Map<A, B>( uint64_t a1)
{
}

void Publishers.TryMap.receive<A>(subscriber:)(uint64_t a1)
{
}

uint64_t sub_183B7B464(uint64_t a1)
{
  uint64_t v10 = (uint64_t *)(v1 + *(int *)(v4 + 44));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  swift_allocObject();
  swift_retain();
  Publishers.TryMap.Inner.init(downstream:map:)(v6, v11, v12);
  *(void *)(v8 - 112) = v13;
  uint64_t v14 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.TryMap<A, B>.Inner<A1>, a1);
  Publisher.subscribe<A>(_:)(v8 - 112, *(void *)(v8 - 128), a1, v3, v14);
  return swift_release();
}

void type metadata accessor for Publishers.TryMap.Inner()
{
}

void Publishers.TryMap.Inner.__allocating_init(downstream:map:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void Publishers.TryMap.Inner.init(downstream:map:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = (uint64_t)v3 + *(void *)(*v3 + 136);
  *(_OWORD *)uint64_t v8 = 0u;
  *(_OWORD *)(v8 + 16) = 0u;
  *(void *)(v8 + 32) = 0LL;
  *(_BYTE *)(v8 + 40) = 2;
  uint64_t v9 = *(void *)(*v3 + 144);
  uint64_t v10 = (_DWORD *)swift_slowAlloc();
  *(uint64_t *)((char *)v3 + v9) = (uint64_t)v10;
  _DWORD *v10 = 0;
  uint64_t v11 = *(void *)(*v3 + 152);
  if (one-time initialization token for lock != -1) {
    swift_once();
  }
  uint64_t v12 = (os_unfair_lock_s *)static lock in Global #1 in CombineIdentifier.init();
  os_unfair_lock_lock((os_unfair_lock_t)static lock in Global #1 in CombineIdentifier.init());
  uint64_t v13 = static generation in Global #1 in CombineIdentifier.init();
  if (static generation in Global #1 in CombineIdentifier.init() == -1)
  {
    __break(1u);
  }

  else
  {
    ++static generation in Global #1 in CombineIdentifier.init();
    os_unfair_lock_unlock(v12);
    *(uint64_t *)((char *)v3 + v11) = v13;
    (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v7 + 96) - 8LL) + 32LL))( (uint64_t)v3 + *(void *)(*v3 + 120),  a1);
    uint64_t v14 = (uint64_t *)((char *)v3 + *(void *)(*v3 + 128));
    void *v14 = a2;
    v14[1] = a3;
  }

uint64_t *Publishers.TryMap.Inner.deinit()
{
  uint64_t v1 = *v0;
  MEMORY[0x186E22A2C](*(uint64_t *)((char *)v0 + *(void *)(*v0 + 144)), -1LL, -1LL);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 96) - 8LL) + 8LL))((uint64_t)v0 + *(void *)(*v0 + 120));
  swift_release();
  outlined destroy of SubscriptionStatus((uint64_t)v0 + *(void *)(*v0 + 136));
  return v0;
}

uint64_t Publishers.TryMap.Inner.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void Publishers.TryMap.Inner.customMirror.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1895F8858](v2);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1895F8858](v3);
  uint64_t v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = v0;
  uint64_t v6 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(v5, 1LL, 1LL, v6);
  uint64_t v7 = *(void *)(v1 + 112);
  __int128 v8 = *(_OWORD *)(v1 + 96);
  v9[0] = *(_OWORD *)(v1 + 80);
  v9[1] = v8;
  uint64_t v10 = v7;
  type metadata accessor for Publishers.TryMap.Inner();
}

uint64_t sub_183B7B7E4()
{
  return Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
}

void Publishers.TryMap.Inner.playgroundDescription.getter(void *a1@<X8>)
{
  a1[3] = MEMORY[0x189617FA8];
  *a1 = 0x70614D797254LL;
  a1[1] = 0xE600000000000000LL;
}

uint64_t Publishers.TryMap.Inner.receive(subscription:)(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 144);
  os_unfair_lock_lock(*(os_unfair_lock_t *)((char *)v1 + v4));
  uint64_t v5 = (uint64_t)v1 + *(void *)(*v1 + 136);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v5, (uint64_t)v13);
  if (v14 == 2)
  {
    int8x16_t v6 = vorrq_s8(*(int8x16_t *)&v13[8], *(int8x16_t *)&v13[24]);
    if (!(*(void *)&vorr_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)) | *(void *)v13))
    {
      outlined destroy of SubscriptionStatus((uint64_t)v13);
      outlined init with copy of Subscription((uint64_t)a1, (uint64_t)v13);
      char v14 = 0;
      outlined init with take of SubscriptionStatus((uint64_t)v13, (uint64_t)v12);
      swift_beginAccess();
      outlined assign with take of SubscriptionStatus((uint64_t)v12, v5);
      swift_endAccess();
      os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v1 + v4));
      uint64_t v10 = *(void *)(v3 + 112);
      __int128 v11 = *(_OWORD *)(v3 + 96);
      *(_OWORD *)uint64_t v13 = *(_OWORD *)(v3 + 80);
      *(_OWORD *)&v13[16] = v11;
      *(void *)&v13[32] = v10;
      type metadata accessor for Publishers.TryMap.Inner();
    }
  }

  outlined destroy of SubscriptionStatus((uint64_t)v13);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v1 + v4));
  uint64_t v8 = a1[3];
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v8);
  return (*(uint64_t (**)(uint64_t))(*(void *)(v7 + 8) + 8LL))(v8);
}

uint64_t Publishers.TryMap.Inner.receive(_:)(uint64_t a1)
{
  uint64_t v3 = *(void **)v1;
  uint64_t v4 = *(void *)(*(void *)v1 + 88LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1895F8858](a1);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = v3[12];
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1895F8858](v6);
  uint64_t v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = *(void (**)(char *))(v10 + 16);
  v16[1] = v1 + v3[15];
  v13(v12);
  (*(void (**)(uint64_t))(v1 + *(void *)(*(void *)v1 + 128LL)))(a1);
  uint64_t v14 = (*(uint64_t (**)(char *, uint64_t))(v3[14] + 48LL))(v8, v9);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v14;
}

void Publishers.TryMap.Inner.receive(completion:)(uint64_t a1)
{
  uint64_t v20 = a1;
  uint64_t v2 = *(void **)v1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v21 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v5 = (char *)&v18 - v4;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v19 = type metadata accessor for Subscribers.Completion(0LL, AssociatedTypeWitness, AssociatedConformanceWitness, v7);
  uint64_t v8 = *(void *)(v19 - 8);
  MEMORY[0x1895F8858](v19);
  uint64_t v10 = (char *)&v18 - v9;
  uint64_t v11 = v2[18];
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v1 + v11));
  uint64_t v12 = v1 + *(void *)(*(void *)v1 + 136LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v12, (uint64_t)&v22);
  int v13 = v25;
  outlined destroy of SubscriptionStatus((uint64_t)&v22);
  if (v13)
  {
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v1 + v11));
  }

  else
  {
    uint64_t v18 = AssociatedConformanceWitness;
    uint64_t v22 = 1LL;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    unsigned __int8 v25 = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v22, v12);
    swift_endAccess();
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v1 + v11));
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v20, v19);
    uint64_t v14 = v21;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v10, 1LL, AssociatedTypeWitness) == 1)
    {
      uint64_t v22 = 0LL;
      (*(void (**)(uint64_t *, void))(v2[14] + 56LL))(&v22, v2[12]);
    }

    else
    {
      unsigned int v15 = v5;
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v5, v10, AssociatedTypeWitness);
      uint64_t v16 = swift_allocError();
      (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(v17, v15, AssociatedTypeWitness);
      uint64_t v22 = v16;
      (*(void (**)(uint64_t *, void))(v2[14] + 56LL))(&v22, v2[12]);
      MEMORY[0x186E22870](v16);
      (*(void (**)(char *, uint64_t))(v14 + 8))(v15, AssociatedTypeWitness);
    }
  }

void Publishers.TryMap.Inner.request(_:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 144LL);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v1 + v3));
  uint64_t v4 = v1 + *(void *)(*(void *)v1 + 136LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v4, (uint64_t)v7);
  if (v8)
  {
    outlined destroy of SubscriptionStatus((uint64_t)v7);
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v1 + v3));
  }

  else
  {
    outlined init with take of Subscription(v7, (uint64_t)v9);
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v1 + v3));
    uint64_t v5 = v10;
    uint64_t v6 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24))(a1, v5, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }

void Publishers.TryMap.Inner.cancel()()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 144LL);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v0 + v1));
  uint64_t v2 = v0 + *(void *)(*(void *)v0 + 136LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v2, (uint64_t)&v5);
  if (v8)
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v5);
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v0 + v1));
  }

  else
  {
    outlined init with take of Subscription((__int128 *)&v5, (uint64_t)v9);
    uint64_t v5 = 1LL;
    __int128 v6 = 0u;
    __int128 v7 = 0u;
    char v8 = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v5, v2);
    swift_endAccess();
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v0 + v1));
    uint64_t v3 = v10;
    uint64_t v4 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    (*(void (**)(uint64_t))(*(void *)(v4 + 8) + 8LL))(v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.TryMap<A, B>.Inner<A1>( void *a1)
{
  return Publishers.TryMap.Inner.receive(subscription:)(a1);
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance Publishers.TryMap<A, B>.Inner<A1>( uint64_t a1)
{
  return Publishers.TryMap.Inner.receive(_:)(a1);
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.TryMap<A, B>.Inner<A1>( uint64_t a1)
{
}

void protocol witness for Subscription.request(_:) in conformance Publishers.TryMap<A, B>.Inner<A1>( uint64_t a1)
{
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.TryMap<A, B>.Inner<A1>()
{
  return 0x70614D797254LL;
}

void protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.TryMap<A, B>.Inner<A1>()
{
}

  ;
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.TryMap<A, B>.Inner<A1>( void *a1@<X8>)
{
}

void protocol witness for CustomCombineIdentifierConvertible.combineIdentifier.getter in conformance Publishers.TryMap<A, B>.Inner<A1>( void *a1@<X8>)
{
  *a1 = *(void *)(*(void *)v1 + *(void *)(**(void **)v1 + 152LL));
}

void protocol witness for Cancellable.cancel() in conformance Publishers.TryMap<A, B>.Inner<A1>()
{
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.TryMap<A, B>( uint64_t a1)
{
}

uint64_t Publishers.Map.map<A>(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6 = v5;
  uint64_t v25 = a1;
  uint64_t v26 = a5;
  uint64_t v10 = a3[2];
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1895F8858](a1);
  int v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unsigned int v15 = (uint64_t *)(v6 + *(int *)(v14 + 44));
  uint64_t v16 = *v15;
  uint64_t v17 = v15[1];
  uint64_t v18 = (uint64_t (*)(uint64_t))swift_allocObject();
  uint64_t v19 = a3[3];
  uint64_t v20 = a3[4];
  *((void *)v18 + 2) = v10;
  *((void *)v18 + 3) = v19;
  *((void *)v18 + 4) = a4;
  *((void *)v18 + 5) = v20;
  *((void *)v18 + 6) = v25;
  *((void *)v18 + 7) = a2;
  *((void *)v18 + 8) = v16;
  *((void *)v18 + 9) = v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v6, v10);
  uint64_t v21 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 32);
  uint64_t v22 = v26;
  v21(v26, v13, v10);
  __int128 v23 = (uint64_t (**)(uint64_t))(v22
                                         + *(int *)(type metadata accessor for Publishers.Map(0LL, v10, a4, v20) + 44));
  *__int128 v23 = partial apply for closure #1 in Publishers.Map.map<A>(_:);
  v23[1] = v18;
  swift_retain();
  return swift_retain();
}

uint64_t closure #1 in Publishers.Map.map<A>(_:)( uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9 = *(void *)(a7 - 8);
  uint64_t v10 = MEMORY[0x1895F8858](a1);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v13(v10);
  a2(v12);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, a7);
}

uint64_t partial apply for closure #1 in Publishers.Map.map<A>(_:)(uint64_t a1)
{
  return closure #1 in Publishers.Map.map<A>(_:)( a1,  *(void (**)(char *))(v1 + 48),  *(void *)(v1 + 56),  *(void *)(v1 + 64),  *(void *)(v1 + 72),  *(void *)(v1 + 16),  *(void *)(v1 + 24));
}

uint64_t Publishers.Map.tryMap<A>(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6 = v5;
  uint64_t v25 = a1;
  uint64_t v26 = a5;
  uint64_t v10 = a3[2];
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1895F8858](a1);
  int v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = (uint64_t *)(v6 + *(int *)(v14 + 44));
  uint64_t v16 = *v15;
  uint64_t v17 = v15[1];
  uint64_t v18 = (uint64_t (*)(uint64_t))swift_allocObject();
  uint64_t v19 = a3[3];
  uint64_t v20 = a3[4];
  *((void *)v18 + 2) = v10;
  *((void *)v18 + 3) = v19;
  *((void *)v18 + 4) = a4;
  *((void *)v18 + 5) = v20;
  *((void *)v18 + 6) = v25;
  *((void *)v18 + 7) = a2;
  *((void *)v18 + 8) = v16;
  *((void *)v18 + 9) = v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v6, v10);
  uint64_t v21 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 32);
  uint64_t v22 = v26;
  v21(v26, v13, v10);
  __int128 v23 = (uint64_t (**)(uint64_t))(v22
                                         + *(int *)(type metadata accessor for Publishers.TryMap(0LL, v10, a4, v20) + 44));
  *__int128 v23 = partial apply for closure #1 in Publishers.Map.tryMap<A>(_:);
  v23[1] = v18;
  swift_retain();
  return swift_retain();
}

uint64_t closure #1 in Publishers.Map.tryMap<A>(_:)( uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9 = *(void *)(a7 - 8);
  uint64_t v10 = MEMORY[0x1895F8858](a1);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v13(v10);
  a2(v12);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, a7);
}

uint64_t partial apply for closure #1 in Publishers.Map.tryMap<A>(_:)(uint64_t a1)
{
  return partial apply for closure #1 in Publishers.CompactMap.compactMap<A>(_:)( a1,  (uint64_t (*)(uint64_t, void, void, void, void, void, void, void, void))closure #1 in Publishers.Map.tryMap<A>(_:));
}

uint64_t Publishers.TryMap.map<A>(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6 = v5;
  uint64_t v25 = a1;
  uint64_t v26 = a5;
  uint64_t v10 = a3[2];
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1895F8858](a1);
  int v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = (uint64_t *)(v6 + *(int *)(v14 + 44));
  uint64_t v16 = *v15;
  uint64_t v17 = v15[1];
  uint64_t v18 = (uint64_t (*)(uint64_t))swift_allocObject();
  uint64_t v19 = a3[3];
  uint64_t v20 = a3[4];
  *((void *)v18 + 2) = v10;
  *((void *)v18 + 3) = v19;
  *((void *)v18 + 4) = a4;
  *((void *)v18 + 5) = v20;
  *((void *)v18 + 6) = v25;
  *((void *)v18 + 7) = a2;
  *((void *)v18 + 8) = v16;
  *((void *)v18 + 9) = v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v6, v10);
  uint64_t v21 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 32);
  uint64_t v22 = v26;
  v21(v26, v13, v10);
  __int128 v23 = (uint64_t (**)(uint64_t))(v22
                                         + *(int *)(type metadata accessor for Publishers.TryMap(0LL, v10, a4, v20) + 44));
  *__int128 v23 = partial apply for closure #1 in Publishers.TryMap.map<A>(_:);
  v23[1] = v18;
  swift_retain();
  return swift_retain();
}

uint64_t closure #1 in Publishers.TryMap.map<A>(_:)( uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10 = *(void *)(a7 - 8);
  uint64_t v11 = MEMORY[0x1895F8858](a1);
  int v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = v14(v11);
  if (!v7)
  {
    a2(v13);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, a7);
  }

  return result;
}

uint64_t partial apply for closure #1 in Publishers.TryMap.map<A>(_:)(uint64_t a1)
{
  return partial apply for closure #1 in Publishers.CompactMap.compactMap<A>(_:)( a1,  (uint64_t (*)(uint64_t, void, void, void, void, void, void, void, void))closure #1 in Publishers.TryMap.map<A>(_:));
}

uint64_t Publishers.TryMap.tryMap<A>(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6 = v5;
  uint64_t v25 = a1;
  uint64_t v26 = a5;
  uint64_t v10 = a3[2];
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1895F8858](a1);
  int v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = (uint64_t *)(v6 + *(int *)(v14 + 44));
  uint64_t v16 = *v15;
  uint64_t v17 = v15[1];
  uint64_t v18 = (uint64_t (*)(uint64_t))swift_allocObject();
  uint64_t v19 = a3[3];
  uint64_t v20 = a3[4];
  *((void *)v18 + 2) = v10;
  *((void *)v18 + 3) = v19;
  *((void *)v18 + 4) = a4;
  *((void *)v18 + 5) = v20;
  *((void *)v18 + 6) = v25;
  *((void *)v18 + 7) = a2;
  *((void *)v18 + 8) = v16;
  *((void *)v18 + 9) = v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v6, v10);
  uint64_t v21 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 32);
  uint64_t v22 = v26;
  v21(v26, v13, v10);
  __int128 v23 = (uint64_t (**)(uint64_t))(v22
                                         + *(int *)(type metadata accessor for Publishers.TryMap(0LL, v10, a4, v20) + 44));
  *__int128 v23 = partial apply for closure #1 in Publishers.TryMap.tryMap<A>(_:);
  v23[1] = v18;
  swift_retain();
  return swift_retain();
}

uint64_t closure #1 in Publishers.TryMap.tryMap<A>(_:)( uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10 = *(void *)(a7 - 8);
  uint64_t v11 = MEMORY[0x1895F8858](a1);
  int v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = v14(v11);
  if (!v7)
  {
    a2(v13);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, a7);
  }

  return result;
}

uint64_t partial apply for closure #1 in Publishers.TryMap.tryMap<A>(_:)(uint64_t a1)
{
  return partial apply for closure #1 in Publishers.CompactMap.compactMap<A>(_:)( a1,  (uint64_t (*)(uint64_t, void, void, void, void, void, void, void, void))closure #1 in Publishers.TryMap.tryMap<A>(_:));
}

uint64_t getEnumTagSinglePayload for Publishers.Map(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v7 = *(void *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      unint64_t v12 = *(void *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8LL);
      if (v12 >= 0xFFFFFFFF) {
        LODWORD(v12) = -1;
      }
      return (v12 + 1);
    }

    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }

  else
  {
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 16) & 0xFFFFFFF8) != 0) {
      unsigned int v8 = 2;
    }
    else {
      unsigned int v8 = a2 - v6 + 1;
    }
    if (v8 >= 0x10000) {
      unsigned int v9 = 4;
    }
    else {
      unsigned int v9 = 2;
    }
    if (v8 < 0x100) {
      unsigned int v9 = 1;
    }
    if (v8 >= 2) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0LL;
    }
    return ((uint64_t (*)(void))((char *)&loc_183B7CA24 + 4 * byte_183BA5A78[v10]))();
  }

void storeEnumTagSinglePayload for Publishers.Map( unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 16) - 8LL);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v5 + 84);
  }
  if (v6 >= a3)
  {
    int v9 = 0u;
    if (a2 <= v6) {
      goto LABEL_17;
    }
  }

  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v7 = a3 - v6 + 1;
    }
    else {
      unsigned int v7 = 2;
    }
    if (v7 >= 0x10000) {
      int v8 = 4;
    }
    else {
      int v8 = 2;
    }
    if (v7 < 0x100) {
      int v8 = 1;
    }
    if (v7 >= 2) {
      int v9 = v8;
    }
    else {
      int v9 = 0;
    }
    if (a2 <= v6) {
LABEL_17:
    }
      __asm { BR              X12 }
  }

  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    unsigned int v10 = ~v6 + a2;
    bzero(a1, ((*(void *)(v5 + 64) + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + 16);
    *a1 = v10;
  }

  __asm { BR              X10 }

void sub_183B7CB9C()
{
  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x183B7CC14LL);
}

void sub_183B7CBA4(uint64_t a1, int a2)
{
  *(_DWORD *)(v2 + (*(void (**)(uint64_t, void, uint64_t))(v1 + 16))(v0, *(void *)(v9 - 144) + *(int *)(v6 + 52), v3) = 0;
  if (a2) {
    JUMPOUT(0x183B7CBACLL);
  }
  JUMPOUT(0x183B7CC14LL);
}

void sub_183B7CBEC()
{
  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x183B7CC14LL);
}

void sub_183B7CBF4()
{
  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x183B7CC14LL);
}

uint64_t sub_183B7CBFC(uint64_t a1, int a2, unsigned int a3)
{
  *(_WORD *)(v5 + (*(void (**)(uint64_t, void, uint64_t))(v4 + 16))(v7, *(void *)(v9 - 120), v6) = 0;
  if (!a2) {
    JUMPOUT(0x183B7CC14LL);
  }
  if (a3 < 0x7FFFFFFF)
  {
    if ((a2 & 0x80000000) == 0) {
      JUMPOUT(0x183B7CC10LL);
    }
    JUMPOUT(0x183B7CC08LL);
  }

  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v5);
}

uint64_t type metadata completion function for Publishers.TryMap.Inner()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t getEnumTagSinglePayload for Publishers.Map.Inner(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 32) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v7 = *(void *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      unint64_t v12 = *(void *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8LL);
      if (v12 >= 0xFFFFFFFF) {
        LODWORD(v12) = -1;
      }
      return (v12 + 1);
    }

    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }

  else
  {
    if (((((((v7 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 23) & 0xFFFFFFFFFFFFFFF8LL) + 8) & 0xFFFFFFF8) != 0) {
      unsigned int v8 = 2;
    }
    else {
      unsigned int v8 = a2 - v6 + 1;
    }
    if (v8 >= 0x10000) {
      unsigned int v9 = 4;
    }
    else {
      unsigned int v9 = 2;
    }
    if (v8 < 0x100) {
      unsigned int v9 = 1;
    }
    if (v8 >= 2) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0LL;
    }
    return ((uint64_t (*)(void))((char *)&loc_183B7CD54 + 4 * byte_183BA5A87[v10]))();
  }

void storeEnumTagSinglePayload for Publishers.Map.Inner( unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 32) - 8LL);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v5 + 84);
  }
  if (v6 >= a3)
  {
    int v9 = 0u;
    if (a2 <= v6) {
      goto LABEL_17;
    }
  }

  else
  {
    if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v7 = a3 - v6 + 1;
    }
    else {
      unsigned int v7 = 2;
    }
    if (v7 >= 0x10000) {
      int v8 = 4;
    }
    else {
      int v8 = 2;
    }
    if (v7 < 0x100) {
      int v8 = 1;
    }
    if (v7 >= 2) {
      int v9 = v8;
    }
    else {
      int v9 = 0;
    }
    if (a2 <= v6) {
LABEL_17:
    }
      __asm { BR              X12 }
  }

  if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    unsigned int v10 = ~v6 + a2;
    bzero(a1, ((((*(void *)(v5 + 64) + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + 23) & 0xFFFFFFFFFFFFFFF8LL) + 8);
    *a1 = v10;
  }

  __asm { BR              X10 }

void sub_183B7CED4()
{
  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x183B7CF4CLL);
}

void sub_183B7CEDC(uint64_t a1, int a2)
{
  *(_DWORD *)(v2 + (*(void (**)(uint64_t, void, uint64_t))(v1 + 16))(v0, *(void *)(v9 - 144) + *(int *)(v6 + 52), v3) = 0;
  if (a2) {
    JUMPOUT(0x183B7CEE4LL);
  }
  JUMPOUT(0x183B7CF4CLL);
}

void sub_183B7CF24()
{
  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x183B7CF4CLL);
}

void sub_183B7CF2C()
{
  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x183B7CF4CLL);
}

uint64_t sub_183B7CF34(uint64_t a1, int a2, unsigned int a3)
{
  *(_WORD *)(v5 + (*(void (**)(uint64_t, void, uint64_t))(v4 + 16))(v7, *(void *)(v9 - 120), v6) = 0;
  if (!a2) {
    JUMPOUT(0x183B7CF4CLL);
  }
  if (a3 < 0x7FFFFFFF)
  {
    if ((a2 & 0x80000000) == 0) {
      JUMPOUT(0x183B7CF48LL);
    }
    JUMPOUT(0x183B7CF40LL);
  }

  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v5);
}

void Publisher.timeout<A>(_:scheduler:options:customError:)( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  uint64_t v9 = v8;
  uint64_t v36 = a7;
  uint64_t v37 = a4;
  uint64_t v38 = a5;
  uint64_t v33 = a2;
  uint64_t v34 = a3;
  uint64_t v32 = a1;
  uint64_t v35 = a8;
  swift_getAssociatedTypeWitness();
  uint64_t v11 = type metadata accessor for Optional();
  uint64_t v30 = *(void *)(v11 - 8);
  uint64_t v31 = v11;
  uint64_t v12 = MEMORY[0x1895F8858](v11);
  uint64_t v14 = (char *)&v29 - v13;
  uint64_t v15 = *(void *)(a6 - 8);
  MEMORY[0x1895F8858](v12);
  uint64_t v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v19 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v20 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v22 = (char *)&v29 - v21;
  MEMORY[0x1895F8858](v20);
  __int128 v24 = (char *)&v29 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = v9;
  uint64_t v28 = v27;
  (*(void (**)(char *, uint64_t))(v25 + 16))(v24, v26);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v22, v32, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v33, a6);
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v14, v34, v31);
  Publishers.Timeout.init(upstream:interval:scheduler:options:customError:)((uint64_t)v24, v28, v35);
}

uint64_t sub_183B7D178()
{
  return outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v0);
}

void Publishers.Timeout.init(upstream:interval:scheduler:options:customError:)( uint64_t a1@<X0>, uint64_t a2@<X6>, uint64_t a3@<X8>)
{
}

uint64_t sub_183B7D214(int *a1)
{
  uint64_t v7 = v1 + a1[13];
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32LL))( v7,  v5,  AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 32LL))(v1 + a1[14], v4, v3);
  uint64_t v9 = v1 + a1[15];
  swift_getAssociatedTypeWitness();
  uint64_t v10 = type metadata accessor for Optional();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))(v9, v2, v10);
  uint64_t v12 = (void *)(v1 + a1[16]);
  void *v12 = v13;
  v12[1] = v14;
  return result;
}

void type metadata accessor for Publishers.Timeout()
{
}

uint64_t Publishers.Timeout.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 16LL))(a2, v2);
}

uint64_t Publishers.Timeout.interval.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 52);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16LL))( a2,  v4,  AssociatedTypeWitness);
}

uint64_t Publishers.Timeout.scheduler.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) - 8LL) + 16LL))( a2,  v2 + *(int *)(a1 + 56));
}

uint64_t Publishers.Timeout.options.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 60);
  swift_getAssociatedTypeWitness();
  uint64_t v5 = type metadata accessor for Optional();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, v4, v5);
}

uint64_t Publishers.Timeout.customError.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 64));
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v2);
  return v2;
}

void Publishers.Timeout.receive<A>(subscriber:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = a4;
  uint64_t v22 = a1;
  uint64_t v6 = a2[5];
  uint64_t v7 = a2[3];
  swift_getAssociatedTypeWitness();
  uint64_t v23 = type metadata accessor for Optional();
  uint64_t v21 = *(void *)(v23 - 8);
  uint64_t v8 = MEMORY[0x1895F8858](v23);
  uint64_t v20 = (char *)&v14 - v9;
  uint64_t v18 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v17 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  MEMORY[0x1895F8858](v12);
  uint64_t v13 = a2[2];
  uint64_t v15 = a2[4];
  uint64_t v16 = v13;
  uint64_t v24 = v13;
  uint64_t v25 = v7;
  uint64_t v26 = a3;
  uint64_t v27 = v15;
  uint64_t v28 = v6;
  uint64_t v29 = v19;
  type metadata accessor for Publishers.Timeout.Inner();
}

uint64_t sub_183B7D674(uint64_t a1)
{
  uint64_t v12 = *(void *)(v10 - 184);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 176) + 16LL))(v12, v1 + v2[14], v4);
  uint64_t v13 = *(void *)(v10 - 160);
  (*(void (**)(uint64_t, uint64_t, void))(*(void *)(v10 - 152) + 16LL))( v13,  v1 + v2[15],  *(void *)(v10 - 136));
  uint64_t v14 = (uint64_t *)(v1 + v2[16]);
  uint64_t v15 = *v14;
  uint64_t v16 = v14[1];
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(*v14);
  swift_allocObject();
  *(void *)(v10 - 128) = Publishers.Timeout.Inner.init(_:interval:scheduler:options:customError:)( v3,  v6,  v12,  v13,  v15,  v16);
  uint64_t v17 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.Timeout<A, B>.Inner<A1>, a1);
  Publisher.subscribe<A>(_:)(v10 - 128, *(void *)(v10 - 192), a1, *(void *)(v10 - 200), v17);
  return swift_release();
}

void type metadata accessor for Publishers.Timeout.Inner()
{
}

void *Publishers.Timeout.Inner.__allocating_init(_:interval:scheduler:options:customError:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return Publishers.Timeout.Inner.init(_:interval:scheduler:options:customError:)(a1, a2, a3, a4, a5, a6);
}

void Publishers.Timeout.Inner.playgroundDescription.getter(void *a1@<X8>)
{
  a1[3] = MEMORY[0x189617FA8];
  *a1 = 0x74756F656D6954LL;
  a1[1] = 0xE700000000000000LL;
}

void Publishers.Timeout.Inner.timedOut()()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v6 = type metadata accessor for Subscribers.Completion(0LL, AssociatedTypeWitness, AssociatedConformanceWitness, v5);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1895F8858](v6);
  uint64_t v10 = (char *)&v26 - v9;
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v13 = (char *)&v26 - v12;
  uint64_t v14 = (os_unfair_lock_s *)v0[2];
  os_unfair_lock_lock(v14);
  uint64_t v15 = *v1;
  uint64_t v16 = *(void *)(*v1 + 192LL);
  if ((*((_BYTE *)v1 + v16) & 1) != 0)
  {
    os_unfair_lock_unlock(v14);
  }

  else
  {
    uint64_t v29 = v6;
    uint64_t v17 = (uint64_t)v1 + *(void *)(v15 + 184);
    swift_beginAccess();
    outlined init with copy of SubscriptionStatus(v17, (uint64_t)&v30);
    if (v33)
    {
      outlined destroy of SubscriptionStatus((uint64_t)&v30);
      os_unfair_lock_unlock(v14);
    }

    else
    {
      outlined init with take of Subscription((__int128 *)&v30, (uint64_t)v34);
      uint64_t v18 = (void *)((char *)v1 + *(void *)(*v1 + 176LL));
      uint64_t v19 = (void (*)(void))*v18;
      uint64_t v28 = v18[1];
      *((_BYTE *)v1 + v16) = 1;
      uint64_t v20 = v19;
      uint64_t v30 = 1LL;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      char v33 = 2;
      swift_beginAccess();
      outlined assign with take of SubscriptionStatus((uint64_t)&v30, v17);
      swift_endAccess();
      *(void *)((char *)v1 + *(void *)(*v1 + 200LL)) = 0LL;
      swift_release();
      os_unfair_lock_unlock(v14);
      if (v20)
      {
        uint64_t v21 = swift_retain();
        uint64_t v27 = v20;
        v20(v21);
        uint64_t v23 = v35;
        uint64_t v22 = v36;
        __swift_project_boxed_opaque_existential_1(v34, v35);
        (*(void (**)(uint64_t))(*(void *)(v22 + 8) + 8LL))(v23);
        os_unfair_recursive_lock_lock_with_options();
        (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v10, v13, AssociatedTypeWitness);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v10, 0LL, 1LL, AssociatedTypeWitness);
        (*(void (**)(char *, void))(*(void *)(v2 + 120) + 56LL))(v10, *(void *)(v2 + 96));
        (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v29);
        os_unfair_recursive_lock_unlock();
        _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe((uint64_t)v27);
        (*(void (**)(char *, uint64_t))(v11 + 8))(v13, AssociatedTypeWitness);
      }

      else
      {
        uint64_t v25 = v35;
        uint64_t v24 = v36;
        __swift_project_boxed_opaque_existential_1(v34, v35);
        (*(void (**)(uint64_t))(*(void *)(v24 + 8) + 8LL))(v25);
        os_unfair_recursive_lock_lock_with_options();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v10, 1LL, 1LL, AssociatedTypeWitness);
        (*(void (**)(char *, void))(*(void *)(v2 + 120) + 56LL))(v10, *(void *)(v2 + 96));
        (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v29);
        os_unfair_recursive_lock_unlock();
      }

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
    }
  }

uint64_t Publishers.Timeout.Inner.timeoutClock()()
{
  void (*v15)(void *__return_ptr, char *, uint64_t, char *, uint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  _DWORD *v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t AssociatedConformanceWitness;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  __int128 v28[2];
  void v29[5];
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(*(void *)v0 + 112LL);
  uint64_t v3 = *(void *)(*(void *)v0 + 88LL);
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v23 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v24 = AssociatedTypeWitness;
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v6 = (char *)&AssociatedConformanceWitness - v5;
  uint64_t v7 = swift_checkMetadataState();
  uint64_t v27 = *(void *)(v7 - 8);
  uint64_t v25 = v7;
  uint64_t v8 = MEMORY[0x1895F8858](v7);
  uint64_t v10 = (char *)&AssociatedConformanceWitness - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v2 + 40);
  uint64_t v26 = (char *)&AssociatedConformanceWitness - v12;
  v11(v3, v2);
  uint64_t v13 = v1 + *(void *)(*(void *)v1 + 152LL);
  dispatch thunk of Strideable.advanced(by:)();
  (*(void (**)(uint64_t, uint64_t))(v2 + 48))(v3, v2);
  uint64_t v14 = v1 + *(void *)(*(void *)v1 + 168LL);
  uint64_t v15 = *(void (**)(void *__return_ptr, char *, uint64_t, char *, uint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 72);
  swift_retain();
  v15( v29,  v10,  v13,  v6,  v14,  partial apply for closure #1 in Publishers.Timeout.Inner.timeoutClock(),  v1,  v3,  v2,  AssociatedConformanceWitness);
  swift_release();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v24);
  outlined init with copy of Subscription((uint64_t)v29, (uint64_t)v28);
  uint64_t v16 = swift_allocObject();
  outlined init with take of Subscription(v28, v16 + 16);
  type metadata accessor for AnyCancellable();
  uint64_t v17 = swift_allocObject();
  uint64_t v18 = (_DWORD *)swift_slowAlloc();
  *uint64_t v18 = 0;
  *(void *)(v17 + 64) = v18;
  *(void *)(v17 + 16) = partial apply for closure #2 in Publishers.Timeout.Inner.timeoutClock();
  *(void *)(v17 + 24) = v16;
  *(_BYTE *)(v17 + 56) = 0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  uint64_t v19 = *(void (**)(char *, uint64_t))(v27 + 8);
  uint64_t v20 = v25;
  v19(v10, v25);
  v19(v26, v20);
  return v17;
}

uint64_t Publishers.Timeout.Inner.receive(subscription:)(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v4);
  uint64_t v5 = (uint64_t)v1 + *(void *)(*v1 + 184);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v5, (uint64_t)&v13);
  if (v16 == 2
    && (int8x16_t v6 = vorrq_s8(v14, v15),
        !(*(void *)&vorr_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)) | (unint64_t)v13)))
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v13);
    outlined init with copy of Subscription((uint64_t)a1, (uint64_t)&v13);
    char v16 = 0;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v13, v5);
    swift_endAccess();
    *(uint64_t *)((char *)v1 + *(void *)(*v1 + 200)) = Publishers.Timeout.Inner.timeoutClock()();
    swift_release();
    os_unfair_lock_unlock(v4);
    os_unfair_recursive_lock_lock_with_options();
    v15.i64[0] = v3;
    v15.i64[1] = (uint64_t)&protocol witness table for Publishers.Timeout<A, B>.Inner<A1>;
    uint64_t v13 = v1;
    uint64_t v10 = *(void *)(v3 + 120);
    uint64_t v11 = *(void (**)(uint64_t **, uint64_t, uint64_t))(v10 + 40);
    uint64_t v12 = *(void *)(v3 + 96);
    swift_retain();
    v11(&v13, v12, v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
    return os_unfair_recursive_lock_unlock();
  }

  else
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v13);
    os_unfair_lock_unlock(v4);
    uint64_t v7 = a1[3];
    uint64_t v8 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v7);
    return (*(uint64_t (**)(uint64_t))(*(void *)(v8 + 8) + 8LL))(v7);
  }

void Publishers.Timeout.Inner.scheduledReceive(_:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v4);
  if ((*((_BYTE *)v1 + *(void *)(*v1 + 192LL)) & 1) != 0) {
    goto LABEL_13;
  }
  uint64_t v5 = (uint64_t)v1 + *(void *)(*v1 + 184LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v5, (uint64_t)v14);
  outlined init with copy of SubscriptionStatus((uint64_t)v14, (uint64_t)v9);
  if (v10 != 1 && v10)
  {
    uint64_t v13 = 0LL;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    outlined destroy of SubscriptionStatus((uint64_t)v9);
  }

  else
  {
    outlined init with take of Subscription(v9, (uint64_t)&v11);
  }

  outlined destroy of SubscriptionStatus((uint64_t)v14);
  if (!*((void *)&v12 + 1))
  {
    outlined destroy of Subscription?((uint64_t)&v11);
LABEL_13:
    os_unfair_lock_unlock(v4);
    return;
  }

  outlined init with take of Subscription(&v11, (uint64_t)v15);
  os_unfair_lock_unlock(v4);
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v6 = (*(uint64_t (**)(uint64_t, void))(*(void *)(v3 + 120) + 48LL))(a1, *(void *)(v3 + 96));
  os_unfair_recursive_lock_unlock();
  if (v6 == 0x8000000000000000LL) {
    goto LABEL_10;
  }
  if ((v6 & 0x8000000000000000LL) == 0)
  {
    if (!v6)
    {
LABEL_11:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      return;
    }

uint64_t Publishers.Timeout.Inner.receive(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v22 = a1;
  uint64_t v3 = (void *)*v1;
  uint64_t v4 = *(void *)(*v1 + 96LL);
  uint64_t v23 = *(void *)(*v1 + 120LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v8 = (char *)&v21 - v7;
  uint64_t v9 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v9);
  uint64_t v10 = *(void *)(*v1 + 192LL);
  if ((*((_BYTE *)v1 + v10) & 1) != 0
    || (uint64_t v11 = (uint64_t)v1 + *(void *)(*v1 + 184LL),
        swift_beginAccess(),
        outlined init with copy of SubscriptionStatus(v11, (uint64_t)v24),
        LODWORD(v11) = v24[40],
        outlined destroy of SubscriptionStatus((uint64_t)v24),
        (_DWORD)v11))
  {
    os_unfair_lock_unlock(v9);
  }

  else
  {
    uint64_t v21 = *(char **)(*v2 + 200LL);
    if (*(void *)&v21[(void)v2])
    {
      swift_retain();
      AnyCancellable.cancel()();
      swift_release();
    }

    *((_BYTE *)v2 + v10) = 0;
    *(void *)&v21[(void)v2] = Publishers.Timeout.Inner.timeoutClock()();
    swift_release();
    os_unfair_lock_unlock(v9);
    uint64_t v13 = *(void *)(*v2 + 168LL);
    uint64_t v21 = (char *)v2 + *(void *)(*v2 + 160LL);
    int8x16_t v14 = (char *)v2 + v13;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v22, AssociatedTypeWitness);
    unint64_t v15 = (*(unsigned __int8 *)(v6 + 80) + 72LL) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    uint64_t v16 = (char *)swift_allocObject();
    *((void *)v16 + 2) = v3[10];
    uint64_t v17 = v3[11];
    *((void *)v16 + 3) = v17;
    *((void *)v16 + 4) = v4;
    *((void *)v16 + 5) = v3[13];
    uint64_t v18 = v3[14];
    uint64_t v19 = v23;
    *((void *)v16 + 6) = v18;
    *((void *)v16 + 7) = v19;
    *((void *)v16 + 8) = v2;
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v16[v15], v8, AssociatedTypeWitness);
    uint64_t v20 = *(void (**)(char *, void (*)(), char *, uint64_t, uint64_t))(v18 + 56);
    swift_retain();
    v20(v14, partial apply for closure #1 in Publishers.Timeout.Inner.receive(_:), v16, v17, v18);
    swift_release();
  }

  return 0LL;
}

void Publishers.Timeout.Inner.scheduledReceive(completion:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v4);
  uint64_t v5 = (uint64_t)v1 + *(void *)(*v1 + 184LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v5, (uint64_t)&v7);
  int v6 = v10;
  outlined destroy of SubscriptionStatus((uint64_t)&v7);
  if (v6 == 1)
  {
    uint64_t v7 = 1LL;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    unsigned __int8 v10 = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v7, v5);
    swift_endAccess();
    os_unfair_lock_unlock(v4);
    os_unfair_recursive_lock_lock_with_options();
    (*(void (**)(uint64_t, void))(*(void *)(v3 + 120) + 56LL))(a1, *(void *)(v3 + 96));
    os_unfair_recursive_lock_unlock();
  }

  else
  {
    os_unfair_lock_unlock(v4);
  }

void Publishers.Timeout.Inner.receive(completion:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v28 = a1;
  uint64_t v3 = (void *)*v1;
  uint64_t v4 = *(void *)(*v1 + 104LL);
  uint64_t v5 = *(void *)(*v1 + 80LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v9 = type metadata accessor for Subscribers.Completion(0LL, AssociatedTypeWitness, AssociatedConformanceWitness, v8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1895F8858](v9);
  __int128 v12 = (char *)&v23 - v11;
  uint64_t v13 = (os_unfair_lock_s *)v2[2];
  os_unfair_lock_lock(v13);
  uint64_t v14 = (uint64_t)v2 + *(void *)(*v2 + 184LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v14, (uint64_t)v29);
  if (v30)
  {
    outlined destroy of SubscriptionStatus((uint64_t)v29);
    os_unfair_lock_unlock(v13);
  }

  else
  {
    uint64_t v26 = v12;
    uint64_t v27 = v9;
    outlined init with take of Subscription(v29, (uint64_t)v31);
    if (*(void *)((char *)v2 + *(void *)(*v2 + 200LL)))
    {
      swift_retain();
      AnyCancellable.cancel()();
      swift_release();
    }

    outlined init with copy of Subscription((uint64_t)v31, (uint64_t)v29);
    char v30 = 1;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)v29, v14);
    swift_endAccess();
    os_unfair_lock_unlock(v13);
    uint64_t v15 = *(void *)(*v2 + 168LL);
    uint64_t v25 = (char *)v2 + *(void *)(*v2 + 160LL);
    uint64_t v24 = (char *)v2 + v15;
    uint64_t v16 = v26;
    uint64_t v17 = v27;
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v26, v28, v27);
    unint64_t v18 = (*(unsigned __int8 *)(v10 + 80) + 72LL) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    uint64_t v19 = (char *)swift_allocObject();
    *((void *)v19 + 2) = v5;
    uint64_t v20 = v3[11];
    *((void *)v19 + 3) = v20;
    *((void *)v19 + 4) = v3[12];
    *((void *)v19 + 5) = v4;
    uint64_t v21 = v3[14];
    *((void *)v19 + 6) = v21;
    *((void *)v19 + 7) = v3[15];
    *((void *)v19 + 8) = v2;
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v19[v18], v16, v17);
    uint64_t v22 = *(void (**)(char *, void (*)(), char *, uint64_t, uint64_t))(v21 + 56);
    swift_retain();
    v22(v24, partial apply for closure #1 in Publishers.Timeout.Inner.receive(completion:), v19, v20, v21);
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  }

void Publishers.Timeout.Inner.request(_:)(uint64_t a1)
{
  uint64_t v3 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v3);
  uint64_t v4 = (uint64_t)v1 + *(void *)(*v1 + 184LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v4, (uint64_t)v8);
  if (v9)
  {
    outlined destroy of SubscriptionStatus((uint64_t)v8);
    os_unfair_lock_unlock(v3);
  }

  else
  {
    outlined init with take of Subscription(v8, (uint64_t)v10);
    uint64_t v5 = *(void *)(*v1 + 208LL);
    if ((*((_BYTE *)v1 + v5) & 1) == 0)
    {
      *(void *)((char *)v1 + *(void *)(*v1 + 200LL)) = Publishers.Timeout.Inner.timeoutClock()();
      swift_release();
      *((_BYTE *)v1 + (*(void (**)(uint64_t, void, uint64_t))(v1 + 16))(v9, *(void *)(v10 - 128), v5) = 1;
    }

    os_unfair_lock_unlock(v3);
    uint64_t v6 = v11;
    uint64_t v7 = v12;
    __swift_project_boxed_opaque_existential_1(v10, v11);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(a1, v6, v7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }

void Publishers.Timeout.Inner.cancel()()
{
  uint64_t v1 = (os_unfair_lock_s *)v0[2];
  os_unfair_lock_lock(v1);
  uint64_t v2 = (uint64_t)v0 + *(void *)(*v0 + 184LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v2, (uint64_t)&v12);
  outlined init with copy of SubscriptionStatus((uint64_t)&v12, (uint64_t)v7);
  if (v8 != 1 && v8)
  {
    uint64_t v11 = 0LL;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    outlined destroy of SubscriptionStatus((uint64_t)v7);
  }

  else
  {
    outlined init with take of Subscription(v7, (uint64_t)&v9);
  }

  outlined destroy of SubscriptionStatus((uint64_t)&v12);
  if (*((void *)&v10 + 1))
  {
    outlined init with take of Subscription(&v9, (uint64_t)v16);
    uint64_t v12 = 1LL;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    char v15 = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v12, v2);
    swift_endAccess();
    uint64_t v3 = *(void *)(*v0 + 200LL);
    uint64_t v4 = *(void *)((char *)v0 + v3);
    *(void *)((char *)v0 + (*(void (**)(uint64_t, void, uint64_t))(v1 + 16))(v0, *(void *)(v9 - 144) + *(int *)(v6 + 52), v3) = 0LL;
    os_unfair_lock_unlock(v1);
    if (v4)
    {
      swift_retain();
      AnyCancellable.cancel()();
      swift_release();
    }

    uint64_t v5 = v17;
    uint64_t v6 = v18;
    __swift_project_boxed_opaque_existential_1(v16, v17);
    (*(void (**)(uint64_t))(*(void *)(v6 + 8) + 8LL))(v5);
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }

  else
  {
    outlined destroy of Subscription?((uint64_t)&v9);
    os_unfair_lock_unlock(v1);
  }

void *Publishers.Timeout.Inner.init(_:interval:scheduler:options:customError:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = *v6;
  __int128 v13 = (_DWORD *)swift_slowAlloc();
  *__int128 v13 = 0;
  void v6[2] = v13;
  __int128 v14 = (void *)swift_slowAlloc();
  void *v14 = 0LL;
  v6[3] = v14;
  *((_BYTE *)v6 + *(void *)(*v6 + 192LL)) = 0;
  *(void *)((char *)v6 + *(void *)(*v6 + 200LL)) = 0LL;
  *((_BYTE *)v6 + *(void *)(*v6 + 208LL)) = 0;
  (*(void (**)(char *, uint64_t))(*(void *)(*(void *)(v12 + 96) - 8LL) + 32LL))( (char *)v6 + *(void *)(*v6 + 144LL),  a1);
  char v15 = (char *)v6 + *(void *)(*v6 + 152LL);
  uint64_t v16 = *(void *)(v12 + 88);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32LL))( v15,  a2,  AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32LL))( (char *)v6 + *(void *)(*v6 + 160LL),  a3,  v16);
  uint64_t v18 = (char *)v6 + *(void *)(*v6 + 168LL);
  swift_getAssociatedTypeWitness();
  uint64_t v19 = type metadata accessor for Optional();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32LL))(v18, a4, v19);
  uint64_t v20 = (void *)((char *)v6 + *(void *)(*v6 + 176LL));
  *uint64_t v20 = a5;
  v20[1] = a6;
  uint64_t v21 = (char *)v6 + *(void *)(*v6 + 184LL);
  *(_OWORD *)uint64_t v21 = 0u;
  *((_OWORD *)v21 + 1) = 0u;
  *((void *)v21 + 4) = 0LL;
  v21[40] = 2;
  return v6;
}

char *Publishers.Timeout.Inner.deinit()
{
  uint64_t v1 = *(void *)v0;
  MEMORY[0x186E22A2C](*((void *)v0 + 2), -1LL, -1LL);
  MEMORY[0x186E22A2C](*((void *)v0 + 3), -1LL, -1LL);
  (*(void (**)(char *))(*(void *)(*(void *)(v1 + 96) - 8LL) + 8LL))(&v0[*(void *)(*(void *)v0 + 144LL)]);
  uint64_t v2 = &v0[*(void *)(*(void *)v0 + 152LL)];
  uint64_t v3 = *(void *)(v1 + 88);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(char *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8LL))(v2, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8LL))(&v0[*(void *)(*(void *)v0 + 160LL)], v3);
  uint64_t v5 = &v0[*(void *)(*(void *)v0 + 168LL)];
  swift_getAssociatedTypeWitness();
  uint64_t v6 = type metadata accessor for Optional();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
  _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(*(void *)&v0[*(void *)(*(void *)v0 + 176LL)]);
  outlined destroy of SubscriptionStatus((uint64_t)&v0[*(void *)(*(void *)v0 + 184LL)]);
  swift_release();
  return v0;
}

uint64_t Publishers.Timeout.Inner.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.Timeout<A, B>.Inner<A1>( void *a1)
{
  return Publishers.Timeout.Inner.receive(subscription:)(a1);
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance Publishers.Timeout<A, B>.Inner<A1>( uint64_t a1)
{
  return Publishers.Timeout.Inner.receive(_:)(a1);
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.Timeout<A, B>.Inner<A1>( uint64_t a1)
{
}

void protocol witness for Subscription.request(_:) in conformance Publishers.Timeout<A, B>.Inner<A1>( uint64_t a1)
{
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Timeout<A, B>.Inner<A1>()
{
  return 0x74756F656D6954LL;
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Timeout<A, B>.Inner<A1>( void *a1@<X8>)
{
}

void protocol witness for Cancellable.cancel() in conformance Publishers.Timeout<A, B>.Inner<A1>()
{
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Timeout<A, B>( uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
}

uint64_t type metadata completion function for Publishers.Timeout()
{
  uint64_t AssociatedTypeWitness = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      uint64_t AssociatedTypeWitness = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        swift_getAssociatedTypeWitness();
        uint64_t AssociatedTypeWitness = type metadata accessor for Optional();
        if (v4 <= 0x3F)
        {
          swift_initStructMetadata();
          return 0LL;
        }
      }
    }
  }

  return AssociatedTypeWitness;
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.Timeout(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 24);
  uint64_t v45 = *(void *)(a3 + 16);
  uint64_t v4 = *(void *)(v45 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  int v8 = *(_DWORD *)(v7 + 80);
  uint64_t v9 = v8;
  uint64_t v40 = v5 + v8;
  uint64_t v10 = *(void *)(v3 - 8);
  int v11 = *(_DWORD *)(v10 + 80);
  uint64_t v41 = *(void *)(v7 + 64) + v11;
  unint64_t v12 = (v41 + ((v5 + v9) & ~v9)) & ~(unint64_t)v11;
  uint64_t v42 = v10;
  uint64_t v43 = AssociatedTypeWitness;
  uint64_t v13 = *(void *)(v10 + 64);
  uint64_t v14 = swift_getAssociatedTypeWitness();
  uint64_t v15 = v4;
  uint64_t v44 = v14;
  uint64_t v16 = *(void *)(v14 - 8);
  uint64_t v17 = *(_DWORD *)(v16 + 80);
  uint64_t v18 = v13 + v17;
  if (*(_DWORD *)(v16 + 84)) {
    uint64_t v19 = *(void *)(v16 + 64);
  }
  else {
    uint64_t v19 = *(void *)(v16 + 64) + 1LL;
  }
  unsigned int v20 = v8 | *(_DWORD *)(v15 + 80) & 0xF8 | v11 | v17;
  if (v20 > 7
    || ((v11 | *(_DWORD *)(v16 + 80) | *(_DWORD *)(v15 + 80) | v8) & 0x100000) != 0
    || ((v19 + 7 + ((v13 + v17 + v12) & ~v17)) & 0xFFFFFFFFFFFFFFF8LL) + 16 > 0x18)
  {
    uint64_t v23 = *a2;
    *a1 = *a2;
    uint64_t v27 = (uint64_t *)(v23 + (((v20 | 7) + 16LL) & ~(unint64_t)(v20 | 7)));
  }

  else
  {
    size_t __n = v19;
    uint64_t v39 = v19 + 7;
    unint64_t v24 = ~(unint64_t)v8;
    unint64_t v25 = ~(unint64_t)v11;
    uint64_t v26 = ~v17;
    uint64_t v27 = a1;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v15 + 16))(a1, a2, v45);
    unint64_t v28 = ((unint64_t)a1 + v40) & ~v9;
    unint64_t v29 = ((unint64_t)a2 + v40) & v24;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))(v28, v29, v43);
    unint64_t v30 = (v28 + v41) & v25;
    unint64_t v31 = (v29 + v41) & v25;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v42 + 16))(v30, v31, v3);
    __int128 v32 = (void *)((v30 + v18) & v26);
    char v33 = (const void *)((v31 + v18) & v26);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48))(v33, 1LL, v44))
    {
      memcpy(v32, v33, __n);
    }

    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v16 + 16))(v32, v33, v44);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v32, 0LL, 1LL, v44);
    }

    unint64_t v34 = ((unint64_t)v32 + v39) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v35 = ((unint64_t)v33 + v39) & 0xFFFFFFFFFFFFFFF8LL;
    if (*(void *)v35 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)unint64_t v34 = *(_OWORD *)v35;
      return v27;
    }

    uint64_t v36 = *(void *)(v35 + 8);
    *(void *)unint64_t v34 = *(void *)v35;
    *(void *)(v34 + 8) = v36;
  }

  swift_retain();
  return v27;
}

uint64_t destroy for Publishers.Timeout(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8LL);
  (*(void (**)(void))(v4 + 8))();
  uint64_t v5 = *(void *)(v4 + 64) + a1;
  uint64_t v6 = *(void *)(a2 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  unint64_t v9 = (v5 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v9, AssociatedTypeWitness);
  uint64_t v10 = *(void *)(v6 - 8);
  unint64_t v11 = (v9 + *(void *)(v8 + 64) + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  (*(void (**)(unint64_t, uint64_t))(v10 + 8))(v11, v6);
  uint64_t v12 = *(void *)(v10 + 64);
  uint64_t v13 = swift_getAssociatedTypeWitness();
  uint64_t v14 = *(void *)(v13 - 8);
  unint64_t v15 = (v11 + v12 + *(unsigned __int8 *)(v14 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v14 + 48))(v15, 1LL, v13);
  if (!(_DWORD)result) {
    uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t))(v14 + 8))(v15, v13);
  }
  unint64_t v17 = v15 + *(void *)(v14 + 64);
  if (!*(_DWORD *)(v14 + 84)) {
    ++v17;
  }
  if (*(void *)((v17 + 7) & 0xFFFFFFFFFFFFFFF8LL) >= 0xFFFFFFFFuLL) {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for Publishers.Timeout(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v6 + 16))();
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v11 + a1) & ~v11;
  uint64_t v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v12, v13, AssociatedTypeWitness);
  uint64_t v14 = *(void *)(v8 - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = *(void *)(v10 + 64) + v15;
  uint64_t v17 = (v16 + v12) & ~v15;
  uint64_t v18 = (v16 + v13) & ~v15;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v17, v18, v8);
  uint64_t v19 = *(void *)(v14 + 64);
  uint64_t v20 = swift_getAssociatedTypeWitness();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v23 = (void *)((v19 + v22 + v17) & ~v22);
  unint64_t v24 = (const void *)((v19 + v22 + v18) & ~v22);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48))(v24, 1LL, v20))
  {
    int v25 = *(_DWORD *)(v21 + 84);
    uint64_t v26 = *(void *)(v21 + 64);
    if (v25) {
      size_t v27 = *(void *)(v21 + 64);
    }
    else {
      size_t v27 = v26 + 1;
    }
    memcpy(v23, v24, v27);
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v21 + 16))(v23, v24, v20);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v23, 0LL, 1LL, v20);
    int v25 = *(_DWORD *)(v21 + 84);
    uint64_t v26 = *(void *)(v21 + 64);
  }

  if (v25) {
    uint64_t v28 = v26;
  }
  else {
    uint64_t v28 = v26 + 1;
  }
  unint64_t v29 = ((unint64_t)v23 + v28 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v30 = ((unint64_t)v24 + v28 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  if (*(void *)v30 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v29 = *(_OWORD *)v30;
  }

  else
  {
    uint64_t v31 = *(void *)(v30 + 8);
    *(void *)unint64_t v29 = *(void *)v30;
    *(void *)(v29 + 8) = v31;
    swift_retain();
  }

  return a1;
}

uint64_t assignWithCopy for Publishers.Timeout(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v6 + 24))();
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v11 + a1) & ~v11;
  uint64_t v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24))(v12, v13, AssociatedTypeWitness);
  uint64_t v14 = *(void *)(v8 - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = *(void *)(v10 + 64) + v15;
  uint64_t v17 = (v16 + v12) & ~v15;
  uint64_t v18 = (v16 + v13) & ~v15;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 24))(v17, v18, v8);
  uint64_t v19 = *(void *)(v14 + 64);
  uint64_t v20 = swift_getAssociatedTypeWitness();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v23 = (void *)((v19 + v22 + v17) & ~v22);
  unint64_t v24 = (void *)((v19 + v22 + v18) & ~v22);
  int v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  LODWORD(v18) = v25(v23, 1LL, v20);
  int v26 = v25(v24, 1LL, v20);
  if ((_DWORD)v18)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 16))(v23, v24, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v23, 0LL, 1LL, v20);
      goto LABEL_10;
    }
  }

  else
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 24))(v23, v24, v20);
      goto LABEL_10;
    }

    (*(void (**)(void *, uint64_t))(v21 + 8))(v23, v20);
  }

  if (*(_DWORD *)(v21 + 84)) {
    size_t v27 = *(void *)(v21 + 64);
  }
  else {
    size_t v27 = *(void *)(v21 + 64) + 1LL;
  }
  memcpy(v23, v24, v27);
LABEL_10:
  if (*(_DWORD *)(v21 + 84)) {
    uint64_t v28 = *(void *)(v21 + 64);
  }
  else {
    uint64_t v28 = *(void *)(v21 + 64) + 1LL;
  }
  unint64_t v29 = (void *)(((unint64_t)v23 + v28 + 7) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v30 = (unint64_t *)(((unint64_t)v24 + v28 + 7) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v31 = *v30;
  if (*v29 < 0xFFFFFFFFuLL)
  {
    if (v31 >= 0xFFFFFFFF)
    {
      unint64_t v33 = v30[1];
      *unint64_t v29 = v31;
      v29[1] = v33;
      swift_retain();
      return a1;
    }

uint64_t initializeWithTake for Publishers.Timeout(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v6 + 32))();
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v11 + a1) & ~v11;
  uint64_t v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v12, v13, AssociatedTypeWitness);
  uint64_t v14 = *(void *)(v8 - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = *(void *)(v10 + 64) + v15;
  uint64_t v17 = (v16 + v12) & ~v15;
  uint64_t v18 = (v16 + v13) & ~v15;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v17, v18, v8);
  uint64_t v19 = *(void *)(v14 + 64);
  uint64_t v20 = swift_getAssociatedTypeWitness();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v23 = (void *)((v19 + v22 + v17) & ~v22);
  unint64_t v24 = (const void *)((v19 + v22 + v18) & ~v22);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48))(v24, 1LL, v20))
  {
    int v25 = *(_DWORD *)(v21 + 84);
    uint64_t v26 = *(void *)(v21 + 64);
    if (v25) {
      size_t v27 = *(void *)(v21 + 64);
    }
    else {
      size_t v27 = v26 + 1;
    }
    memcpy(v23, v24, v27);
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v21 + 32))(v23, v24, v20);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v23, 0LL, 1LL, v20);
    int v25 = *(_DWORD *)(v21 + 84);
    uint64_t v26 = *(void *)(v21 + 64);
  }

  if (v25) {
    uint64_t v28 = v26;
  }
  else {
    uint64_t v28 = v26 + 1;
  }
  unint64_t v29 = ((unint64_t)v23 + v28 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v30 = (uint64_t *)(((unint64_t)v24 + v28 + 7) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v31 = *v30;
  if ((unint64_t)*v30 < 0xFFFFFFFF)
  {
    *(_OWORD *)unint64_t v29 = *(_OWORD *)v30;
  }

  else
  {
    uint64_t v32 = v30[1];
    *(void *)unint64_t v29 = v31;
    *(void *)(v29 + 8) = v32;
  }

  return a1;
}

uint64_t assignWithTake for Publishers.Timeout(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v6 + 40))();
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v11 + a1) & ~v11;
  uint64_t v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 40))(v12, v13, AssociatedTypeWitness);
  uint64_t v14 = *(void *)(v8 - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = *(void *)(v10 + 64) + v15;
  uint64_t v17 = (v16 + v12) & ~v15;
  uint64_t v18 = (v16 + v13) & ~v15;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 40))(v17, v18, v8);
  uint64_t v19 = *(void *)(v14 + 64);
  uint64_t v20 = swift_getAssociatedTypeWitness();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v23 = (void *)((v19 + v22 + v17) & ~v22);
  unint64_t v24 = (void *)((v19 + v22 + v18) & ~v22);
  int v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  LODWORD(v18) = v25(v23, 1LL, v20);
  int v26 = v25(v24, 1LL, v20);
  if ((_DWORD)v18)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 32))(v23, v24, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v23, 0LL, 1LL, v20);
      goto LABEL_10;
    }
  }

  else
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 40))(v23, v24, v20);
      goto LABEL_10;
    }

    (*(void (**)(void *, uint64_t))(v21 + 8))(v23, v20);
  }

  if (*(_DWORD *)(v21 + 84)) {
    size_t v27 = *(void *)(v21 + 64);
  }
  else {
    size_t v27 = *(void *)(v21 + 64) + 1LL;
  }
  memcpy(v23, v24, v27);
LABEL_10:
  if (*(_DWORD *)(v21 + 84)) {
    uint64_t v28 = *(void *)(v21 + 64);
  }
  else {
    uint64_t v28 = *(void *)(v21 + 64) + 1LL;
  }
  unint64_t v29 = (void *)(((unint64_t)v23 + v28 + 7) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v30 = (unint64_t *)(((unint64_t)v24 + v28 + 7) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v31 = *v30;
  if (*v29 < 0xFFFFFFFFuLL)
  {
    if (v31 >= 0xFFFFFFFF)
    {
      unint64_t v33 = v30[1];
      *unint64_t v29 = v31;
      v29[1] = v33;
      return a1;
    }

uint64_t getEnumTagSinglePayload for Publishers.Timeout(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v37 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v37 - 8);
  unsigned int v6 = *(_DWORD *)(v5 + 84);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  unsigned int v38 = v6;
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = *(void *)(v4 - 8);
  uint64_t v11 = *(unsigned int *)(v10 + 84);
  else {
    unsigned int v12 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v13 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v14 = *(_DWORD *)(v13 + 84);
  if (v14) {
    unsigned int v15 = v14 - 1;
  }
  else {
    unsigned int v15 = 0;
  }
  if (v15 <= v12) {
    unsigned int v16 = v12;
  }
  else {
    unsigned int v16 = v15;
  }
  if (v16 <= 0x7FFFFFFE) {
    unsigned int v16 = 2147483646;
  }
  uint64_t v17 = *(void *)(v13 + 64);
  if (!v14) {
    ++v17;
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v18 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v19 = *(void *)(v5 + 64) + v18;
  uint64_t v20 = *(void *)(v7 + 64);
  uint64_t v21 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v22 = *(void *)(v10 + 64);
  uint64_t v23 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v24 = v17 + 7;
  uint64_t v25 = a1;
  if (v16 < a2)
  {
    if (((((v24 + ((v22 + v23 + ((v20 + v21 + (v19 & ~v18)) & ~v21)) & ~v23)) & 0xFFFFFFFFFFFFFFF8LL) + 16) & 0xFFFFFFF8) != 0) {
      unsigned int v26 = 2;
    }
    else {
      unsigned int v26 = a2 - v16 + 1;
    }
    if (v26 >= 0x10000) {
      unsigned int v27 = 4;
    }
    else {
      unsigned int v27 = 2;
    }
    if (v26 < 0x100) {
      unsigned int v27 = 1;
    }
    if (v26 >= 2) {
      uint64_t v28 = v27;
    }
    else {
      uint64_t v28 = 0LL;
    }
    __asm { BR              X6 }
  }

  if (v38 == v16)
  {
    unint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    uint64_t v30 = v38;
    uint64_t v31 = v37;
    return v29(v25, v30, v31);
  }

  uint64_t v25 = (v19 + a1) & ~v18;
  if ((_DWORD)v8 == v16)
  {
    unint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v30 = v8;
    uint64_t v31 = AssociatedTypeWitness;
    return v29(v25, v30, v31);
  }

  uint64_t v25 = (v25 + v20 + v21) & ~v21;
  if ((_DWORD)v11 == v16)
  {
    unint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    uint64_t v30 = v11;
    uint64_t v31 = v4;
    return v29(v25, v30, v31);
  }

  uint64_t v33 = (v25 + v22 + v23) & ~v23;
  if (v15 == v16)
  {
    if (v14 < 2) {
      return 0LL;
    }
    unsigned int v35 = (*(uint64_t (**)(uint64_t))(v13 + 48))(v33);
    if (v35 >= 2) {
      return v35 - 1;
    }
    else {
      return 0LL;
    }
  }

  else
  {
    unint64_t v34 = *(void *)((v24 + v33) & 0xFFFFFFFFFFFFF8LL);
    if (v34 >= 0xFFFFFFFF) {
      LODWORD(v34) = -1;
    }
    else {
      return 0LL;
    }
  }

void storeEnumTagSinglePayload for Publishers.Timeout( unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 + 24);
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8LL);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v8 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v8 + 84) <= v7) {
    unsigned int v9 = v7;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v8 + 84);
  }
  uint64_t v10 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v10 + 84) <= v9) {
    unsigned int v11 = v9;
  }
  else {
    unsigned int v11 = *(_DWORD *)(v10 + 84);
  }
  int v12 = 0u;
  uint64_t v13 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  int v14 = *(_DWORD *)(v13 + 84);
  if (v14) {
    unsigned int v15 = v14 - 1;
  }
  else {
    unsigned int v15 = 0;
  }
  if (v15 <= v11) {
    unsigned int v16 = v11;
  }
  else {
    unsigned int v16 = v15;
  }
  if (v16 <= 0x7FFFFFFE) {
    unsigned int v16 = 2147483646;
  }
  uint64_t v17 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v20 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v22 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v23 = *(void *)(v13 + 64);
  if (!v14) {
    ++v23;
  }
  uint64_t v21 = *(void *)(v10 + 64);
  uint64_t v19 = *(void *)(v8 + 64);
  uint64_t v18 = *(void *)(v6 + 64) + v17;
  if (v16 < a3)
  {
    if ((((_DWORD)v23 {
         + 7
    }
         + (((_DWORD)v21
           + (_DWORD)v22
    else {
      unsigned int v24 = 2;
    }
    if (v24 >= 0x10000) {
      int v25 = 4;
    }
    else {
      int v25 = 2;
    }
    if (v24 < 0x100) {
      int v25 = 1;
    }
    if (v24 >= 2) {
      int v12 = v25;
    }
    else {
      int v12 = 0;
    }
  }

  if (a2 > v16)
  {
    if ((((_DWORD)v23
         + 7
         + (((_DWORD)v21
           + (_DWORD)v22
           + (((_DWORD)v19 + (_DWORD)v20 + (v18 & ~(_DWORD)v17)) & ~(_DWORD)v20)) & ~(_DWORD)v22)) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      unsigned int v26 = ~v16 + a2;
      bzero(a1, ((v23 + 7 + ((v21 + v22 + ((v19 + v20 + (v18 & ~v17)) & ~v20)) & ~v22)) & 0xFFFFFFFFFFFFFFF8LL) + 16);
      *a1 = v26;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X6 }

uint64_t sub_183B8025C@<X0>(uint64_t result@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  *(_BYTE *)(result + v19) = 0;
  if (a2)
  {
    if (v24 == v3)
    {
      uint64_t v20 = *(uint64_t (**)(void))(v14 + 56);
      return v20();
    }

    uint64_t v21 = (v10 + result) & v18;
    if (v17 == v3)
    {
      uint64_t v20 = *(uint64_t (**)(void))(v12 + 56);
      return v20();
    }

    uint64_t v22 = (v21 + v8 + v7) & v13;
    if (v16 == v3)
    {
      uint64_t v20 = *(uint64_t (**)(void))(v15 + 56);
      return v20();
    }

    uint64_t result = (v22 + v6 + v5) & v11;
    if (v4 == v3)
    {
      uint64_t v20 = *(uint64_t (**)(void))(a3 + 56);
      return v20();
    }

    uint64_t v23 = (void *)((v9 + result) & 0xFFFFFFFFFFFFFFF8LL);
    if (a2 > 0x7FFFFFFE)
    {
      *uint64_t v23 = 0LL;
      v23[1] = 0LL;
      *(_DWORD *)uint64_t v23 = a2 - 0x7FFFFFFF;
    }

    else
    {
      *uint64_t v23 = a2;
    }
  }

  return result;
}

void sub_183B802BC(uint64_t a1, int a2)
{
  *(_WORD *)(a1 + (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v5, v2) = 0;
  if (!a2) {
    JUMPOUT(0x183B802C4LL);
  }
  JUMPOUT(0x183B80280LL);
}

uint64_t type metadata completion function for Publishers.Timeout.Inner()
{
  uint64_t AssociatedTypeWitness = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      uint64_t AssociatedTypeWitness = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        swift_getAssociatedTypeWitness();
        uint64_t AssociatedTypeWitness = type metadata accessor for Optional();
        if (v4 <= 0x3F) {
          return swift_initClassMetadata2();
        }
      }
    }
  }

  return AssociatedTypeWitness;
}

uint64_t sub_183B80524()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(type metadata accessor for Subscribers.Completion( 0LL,  AssociatedTypeWitness,  AssociatedConformanceWitness,  v3)
                                      - 8)
                          + 80LL);
  uint64_t v5 = (v4 + 72) & ~v4;
  swift_release();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  return swift_deallocObject();
}

void partial apply for closure #1 in Publishers.Timeout.Inner.receive(completion:)()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(type metadata accessor for Subscribers.Completion( 0LL,  AssociatedTypeWitness,  AssociatedConformanceWitness,  v3)
                                      - 8)
                          + 80LL);
  Publishers.Timeout.Inner.scheduledReceive(completion:)(v0 + ((v4 + 72) & ~v4));
}

uint64_t sub_183B806AC()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v2 = *(void *)(AssociatedTypeWitness - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 72LL) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, AssociatedTypeWitness);
  return swift_deallocObject();
}

void partial apply for closure #1 in Publishers.Timeout.Inner.receive(_:)()
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 80LL);
  Publishers.Timeout.Inner.scheduledReceive(_:)(v0 + ((v1 + 72) & ~v1));
}

uint64_t sub_183B80794()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #2 in Publishers.Timeout.Inner.timeoutClock()()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
}

uint64_t one-time initialization function for observableObservableObjectAvailable()
{
  uint64_t result = observableObservableObjectAvailableCheck();
  static CombineFeatures.observableObservableObjectAvailable = result & 1;
  return result;
}

unint64_t Publisher.buffer(size:prefetch:whenFull:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v9 = *(void *)(a2 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  char v13 = *v12;
  unint64_t v15 = *v14;
  unint64_t v16 = v14[1];
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v4, v17);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a4, v11, a2);
  uint64_t v19 = (int *)type metadata accessor for Publishers.Buffer(0LL, a2, a3, v18);
  *(void *)(a4 + v19[9]) = a1;
  *(_BYTE *)(a4 + v19[10]) = v13;
  uint64_t v20 = (unint64_t *)(a4 + v19[11]);
  *uint64_t v20 = v15;
  v20[1] = v16;
  return outlined copy of Publishers.BufferingStrategy<A><A>(v15);
}

int *Publishers.Buffer.init(upstream:size:prefetch:whenFull:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  char v11 = *a3;
  uint64_t v12 = *a4;
  uint64_t v13 = a4[1];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32LL))(a7, a1, a5);
  uint64_t result = (int *)type metadata accessor for Publishers.Buffer(0LL, a5, a6, v14);
  *(void *)(a7 + result[9]) = a2;
  *(_BYTE *)(a7 + result[10]) = v11;
  unint64_t v16 = (void *)(a7 + result[11]);
  *unint64_t v16 = v12;
  v16[1] = v13;
  return result;
}

unint64_t outlined copy of Publishers.BufferingStrategy<A><A>(unint64_t result)
{
  if (result >= 2) {
    return swift_retain();
  }
  return result;
}

uint64_t type metadata accessor for Publishers.Buffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Buffer);
}

BOOL static Publishers.PrefetchStrategy.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void Publishers.PrefetchStrategy.hash(into:)()
{
}

Swift::Int Publishers.PrefetchStrategy.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance Publishers.PrefetchStrategy( unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Publishers.PrefetchStrategy()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance Publishers.PrefetchStrategy()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Publishers.PrefetchStrategy()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t Publishers.Buffer.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 16LL))(a2, v2);
}

uint64_t Publishers.Buffer.size.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 36));
}

uint64_t Publishers.Buffer.prefetch.getter@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *(_BYTE *)(v2 + *(int *)(result + 40));
  return result;
}

unint64_t Publishers.Buffer.whenFull.getter@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v3 = (unint64_t *)(v2 + *(int *)(a1 + 44));
  unint64_t v4 = *v3;
  unint64_t v5 = v3[1];
  *a2 = *v3;
  a2[1] = v5;
  return outlined copy of Publishers.BufferingStrategy<A><A>(v4);
}

void Publishers.Buffer.receive<A>(subscriber:)(uint64_t a1)
{
}

uint64_t sub_183B80BAC(uint64_t a1)
{
  uint64_t v11 = *(void *)(v1 + v5[9]);
  *(_BYTE *)(v9 - 113) = *(_BYTE *)(v1 + v5[10]);
  uint64_t v12 = (unint64_t *)(v1 + v5[11]);
  unint64_t v13 = *v12;
  unint64_t v14 = v12[1];
  *(void *)(v9 - 112) = *v12;
  *(void *)(v9 - 104) = v14;
  outlined copy of Publishers.BufferingStrategy<A><A>(v13);
  swift_allocObject();
  *(void *)(v9 - 112) = Publishers.Buffer.Inner.init(_:size:prefetch:whenFull:)( v7,  v11,  (char *)(v9 - 113),  (uint64_t *)(v9 - 112));
  uint64_t v15 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.Buffer<A>.Inner<A1>, a1);
  Publisher.subscribe<A>(_:)(v9 - 112, v4, a1, v3, v15);
  return swift_release();
}

void type metadata accessor for Publishers.Buffer.Inner()
{
}

uint64_t *Publishers.Buffer.Inner.__allocating_init(_:size:prefetch:whenFull:)( uint64_t a1, uint64_t a2, char *a3, uint64_t *a4)
{
  return Publishers.Buffer.Inner.init(_:size:prefetch:whenFull:)(a1, a2, a3, a4);
}

unint64_t lazy protocol witness table accessor for type Publishers.PrefetchStrategy and conformance Publishers.PrefetchStrategy()
{
  unint64_t result = lazy protocol witness table cache variable for type Publishers.PrefetchStrategy and conformance Publishers.PrefetchStrategy;
  if (!lazy protocol witness table cache variable for type Publishers.PrefetchStrategy and conformance Publishers.PrefetchStrategy)
  {
    unint64_t result = MEMORY[0x186E22960]( &protocol conformance descriptor for Publishers.PrefetchStrategy,  &type metadata for Publishers.PrefetchStrategy);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type Publishers.PrefetchStrategy and conformance Publishers.PrefetchStrategy);
  }

  return result;
}

uint64_t *Publishers.Buffer.Inner.init(_:size:prefetch:whenFull:)( uint64_t a1, uint64_t a2, char *a3, uint64_t *a4)
{
  uint64_t v6 = *v4;
  char v7 = *a3;
  uint64_t v8 = *a4;
  uint64_t v18 = a4[1];
  uint64_t v9 = (_DWORD *)swift_slowAlloc();
  *uint64_t v9 = 0;
  _OWORD v4[2] = (uint64_t)v9;
  *((_BYTE *)v4 + 24) = 0;
  uint64_t v10 = (uint64_t)v4 + *(void *)(*v4 + 160);
  *(void *)(v10 + 32) = 0LL;
  *(_OWORD *)uint64_t v10 = 0u;
  *(_OWORD *)(v10 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0u;
  *(_BYTE *)(v10 + 40) = 2;
  *(uint64_t *)((char *)v4 + *(void *)(*v4 + 168)) = 0LL;
  uint64_t v11 = *(void *)(*v4 + 176);
  swift_getAssociatedTypeWitness();
  *(uint64_t *)((char *)v4 + v11) = Array.init()();
  *((_BYTE *)v4 + *(void *)(*v4 + 184)) = 0;
  uint64_t v12 = (uint64_t)v4 + *(void *)(*v4 + 192);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v16 = type metadata accessor for Subscribers.Completion(0LL, AssociatedTypeWitness, AssociatedConformanceWitness, v15);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v12, 1LL, 1LL, v16);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v6 + 88) - 8LL) + 32LL))( (uint64_t)v4 + *(void *)(*v4 + 152),  a1);
  v4[4] = a2;
  *((_BYTE *)v4 + 40) = v7;
  v4[6] = v8;
  v4[7] = v18;
  return v4;
}

char *Publishers.Buffer.Inner.deinit()
{
  uint64_t v1 = *(void *)v0;
  MEMORY[0x186E22A2C](*((void *)v0 + 2), -1LL, -1LL);
  outlined consume of Publishers.BufferingStrategy<A.Failure><A><A1>(*((void *)v0 + 6));
  (*(void (**)(char *))(*(void *)(*(void *)(v1 + 88) - 8LL) + 8LL))(&v0[*(void *)(*(void *)v0 + 152LL)]);
  outlined destroy of SubscriptionStatus((uint64_t)&v0[*(void *)(*(void *)v0 + 160LL)]);
  swift_bridgeObjectRelease();
  uint64_t v2 = &v0[*(void *)(*(void *)v0 + 192LL)];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  type metadata accessor for Subscribers.Completion(255LL, AssociatedTypeWitness, AssociatedConformanceWitness, v5);
  uint64_t v6 = type metadata accessor for Optional();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v2, v6);
  return v0;
}

uint64_t Publishers.Buffer.Inner.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void Publishers.Buffer.Inner.request(_:)(uint64_t a1)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 16);
  os_unfair_lock_lock(v3);
  uint64_t v4 = v1 + *(void *)(*(void *)v1 + 160LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v4, (uint64_t)v13);
  if (v14)
  {
    outlined destroy of SubscriptionStatus((uint64_t)v13);
    os_unfair_lock_unlock(v3);
    return;
  }

  outlined init with take of Subscription(v13, (uint64_t)v15);
  uint64_t v5 = *(void *)(*(void *)v1 + 168LL);
  uint64_t v6 = *(void *)(v1 + v5);
  unint64_t v7 = 0x8000000000000000LL;
  if (v6 != 0x8000000000000000LL)
  {
    if (a1 != 0x8000000000000000LL)
    {
      if ((v6 | a1) < 0)
      {
        __break(1u);
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }

      unint64_t v7 = v6 + a1;
      if (__OFADD__(v6, a1))
      {
        unint64_t v7 = 0x8000000000000000LL;
      }

      else if ((v7 & 0x8000000000000000LL) != 0)
      {
LABEL_20:
        __break(1u);
        return;
      }
    }

    *(void *)(v1 + (*(void (**)(uint64_t, void, uint64_t))(v1 + 16))(v9, *(void *)(v10 - 128), v5) = v7;
  }

  char v8 = *(_BYTE *)(v1 + 24);
  os_unfair_lock_unlock(v3);
  if ((v8 & 1) != 0) {
    goto LABEL_16;
  }
  Publishers.Buffer.Inner.drain()();
  uint64_t v10 = v9;
  if (v9 == 0x8000000000000000LL)
  {
LABEL_15:
    uint64_t v11 = v16;
    uint64_t v12 = v17;
    __swift_project_boxed_opaque_existential_1(v15, v16);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 24))(v10, v11, v12);
    goto LABEL_16;
  }

  if (v9 < 0) {
    goto LABEL_19;
  }
  if (v9) {
    goto LABEL_15;
  }
LABEL_16:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
}

void Publishers.Buffer.Inner.drain()()
{
  uint64_t v1 = (void *)*v0;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(char **)(AssociatedTypeWitness - 8);
  uint64_t v65 = *((void *)v3 + 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  v81 = (char *)&v59 - v4;
  uint64_t v5 = swift_getAssociatedTypeWitness();
  v63 = *(char **)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  v60 = (char *)&v59 - v6;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v64 = v5;
  uint64_t v9 = type metadata accessor for Subscribers.Completion(255LL, v5, AssociatedConformanceWitness, v8);
  uint64_t v70 = type metadata accessor for Optional();
  uint64_t v69 = *(void *)(v70 - 8);
  uint64_t v10 = MEMORY[0x1895F8858](v70);
  v68 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = MEMORY[0x1895F8858](v10);
  v67 = (char *)&v59 - v13;
  uint64_t v72 = v9;
  unint64_t v71 = *(void *)(v9 - 8);
  uint64_t v14 = MEMORY[0x1895F8858](v12);
  v66 = (char *)&v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = MEMORY[0x1895F8858](v14);
  v59 = (char *)&v59 - v17;
  uint64_t v18 = MEMORY[0x1895F8858](v16);
  v61 = (char *)&v59 - v19;
  MEMORY[0x1895F8858](v18);
  v62 = (char *)&v59 - v20;
  uint64_t v21 = v1[19];
  uint64_t v22 = (uint64_t)v0 + v1[20];
  uint64_t v24 = v1[21];
  uint64_t v23 = v1[22];
  v80 = v1;
  int v25 = (void *)((char *)v0 + v23);
  v78 = v0;
  unsigned int v26 = (os_unfair_lock_s *)v0[2];
  swift_beginAccess();
  v76 = v25;
  swift_beginAccess();
  os_unfair_lock_lock(v26);
  uint64_t v75 = v22;
  outlined init with copy of SubscriptionStatus(v22, (uint64_t)&v82);
  if (v85)
  {
LABEL_2:
    outlined destroy of SubscriptionStatus((uint64_t)&v82);
LABEL_3:
    os_unfair_lock_unlock(v26);
    return;
  }

  unint64_t v27 = 0LL;
  v79 = &v78[v21];
  v73 = v26;
  uint64_t v77 = v24;
  while (1)
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v82);
    unint64_t v29 = v78;
    uint64_t v30 = *(void *)&v78[v24];
    if (v30 != 0x8000000000000000LL)
    {
      if (v30 < 0)
      {
LABEL_66:
        __break(1u);
LABEL_67:
        __break(1u);
LABEL_68:
        __break(1u);
LABEL_69:
        __break(1u);
LABEL_70:
        __break(1u);
LABEL_71:
        __break(1u);
LABEL_72:
        __break(1u);
LABEL_73:
        __break(1u);
        return;
      }

      if (!v30) {
        break;
      }
    }

    uint64_t v82 = *v76;
    uint64_t v31 = type metadata accessor for Array();
    MEMORY[0x186E22960](MEMORY[0x189618488], v31);
    if ((Collection.isEmpty.getter() & 1) != 0) {
      goto LABEL_56;
    }
    uint64_t v32 = Publishers.Buffer.Inner.locked_pop(_:)(*(void *)&v29[v24]);
    uint64_t v33 = MEMORY[0x186E22090](v32, AssociatedTypeWitness);
    uint64_t v34 = *(void *)&v29[v24];
    if (v34 != 0x8000000000000000LL)
    {
      if (v34 < 0) {
        goto LABEL_67;
      }
      BOOL v35 = __OFSUB__(v34, v33);
      uint64_t v36 = v34 - v33;
      if (v35)
      {
        uint64_t v36 = 0LL;
      }

      else if (v36 < 0)
      {
        goto LABEL_69;
      }

      *(void *)&v29[v24] = v36;
    }

    uint64_t v82 = v32;
    if ((Collection.isEmpty.getter() & 1) != 0)
    {
      os_unfair_lock_unlock(v26);
      swift_bridgeObjectRelease();
      return;
    }

    v29[24] = 1;
    os_unfair_lock_unlock(v26);
    if (MEMORY[0x186E220A8](v32, AssociatedTypeWitness))
    {
      unint64_t v74 = v27;
      uint64_t v37 = 0LL;
      unint64_t v38 = 0LL;
      uint64_t v39 = v80[13];
      uint64_t v40 = *(uint64_t (**)(char *, void, uint64_t))(v39 + 48);
      do
      {
        unint64_t v41 = v38;
        Swift::Bool IsNativeType = Array._hoistableIsNativeTypeChecked()();
        Array._checkSubscript(_:wasNativeTypeChecked:)();
        if (IsNativeType)
        {
          (*((void (**)(char *, unint64_t, uint64_t))v3 + 2))( v81,  v32 + ((v3[80] + 32LL) & ~(unint64_t)v3[80])
          + *((void *)v3 + 9) * v37,
            AssociatedTypeWitness);
          unsigned int v26 = (os_unfair_lock_s *)(v37 + 1);
          if (__OFADD__(v37, 1LL)) {
            goto LABEL_61;
          }
        }

        else
        {
          uint64_t v45 = _ArrayBuffer._getElementSlowPath(_:)();
          if (v65 != 8) {
            goto LABEL_73;
          }
          uint64_t v82 = v45;
          (*((void (**)(char *, uint64_t *, uint64_t))v3 + 2))(v81, &v82, AssociatedTypeWitness);
          swift_unknownObjectRelease();
          unsigned int v26 = (os_unfair_lock_s *)(v37 + 1);
          if (__OFADD__(v37, 1LL))
          {
LABEL_61:
            __break(1u);
            goto LABEL_62;
          }
        }

        uint64_t v43 = v81;
        uint64_t v44 = v40(v81, v80[11], v39);
        (*((void (**)(char *, uint64_t))v3 + 1))(v43, AssociatedTypeWitness);
        unint64_t v38 = 0x8000000000000000LL;
        if (v41 != 0x8000000000000000LL && v44 != 0x8000000000000000LL)
        {
          if (v44 < 0)
          {
            __break(1u);
            goto LABEL_65;
          }

          unint64_t v38 = v41 + v44;
          if (__OFADD__(v41, v44))
          {
            unint64_t v38 = 0x8000000000000000LL;
          }

          else if ((v38 & 0x8000000000000000LL) != 0)
          {
            __break(1u);
            goto LABEL_66;
          }
        }

        ++v37;
      }

      while (v26 != (os_unfair_lock_s *)MEMORY[0x186E220A8](v32, AssociatedTypeWitness));
      swift_bridgeObjectRelease();
      unint64_t v29 = v78;
      unint64_t v27 = v74;
      if ((v78[40] & 1) != 0) {
        goto LABEL_46;
      }
    }

    else
    {
      swift_bridgeObjectRelease();
      unsigned int v26 = 0LL;
      unint64_t v38 = 0LL;
      if ((v29[40] & 1) != 0)
      {
        unint64_t v38 = 0LL;
LABEL_46:
        unsigned int v26 = v73;
        goto LABEL_47;
      }
    }

    if (v27 == 0x8000000000000000LL) {
      goto LABEL_45;
    }
    if ((v27 & 0x8000000000000000LL) != 0) {
      goto LABEL_70;
    }
    BOOL v35 = __OFADD__(v27, v26);
    v27 += (unint64_t)v26;
    if (v35)
    {
LABEL_45:
      unint64_t v27 = 0x8000000000000000LL;
      goto LABEL_46;
    }

    unsigned int v26 = v73;
    if ((v27 & 0x8000000000000000LL) != 0)
    {
      __break(1u);
LABEL_56:
      uint64_t v47 = &v29[*(void *)(*(void *)v29 + 192LL)];
      swift_beginAccess();
      uint64_t v48 = v69;
      uint64_t v3 = v68;
      uint64_t v49 = v70;
      (*(void (**)(char *, _BYTE *, uint64_t))(v69 + 16))(v68, v47, v70);
      unint64_t v50 = v71;
      uint64_t v51 = v72;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v71 + 48))(v3, 1LL, v72) != 1)
      {
        uint64_t v52 = v66;
        (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v66, v3, v51);
        uint64_t v82 = 1LL;
        __int128 v83 = 0u;
        __int128 v84 = 0u;
        char v85 = 2;
        uint64_t v53 = v75;
        swift_beginAccess();
        outlined assign with take of SubscriptionStatus((uint64_t)&v82, v53);
        swift_endAccess();
        os_unfair_lock_unlock(v26);
        (*(void (**)(char *, void))(v80[13] + 56LL))(v52, v80[11]);
        (*(void (**)(char *, uint64_t))(v50 + 8))(v52, v51);
        return;
      }

LABEL_60:
      (*(void (**)(char *, uint64_t))(v48 + 8))(v3, v49);
      goto LABEL_3;
    }

LABEL_47:
    os_unfair_lock_lock(v26);
    v29[24] = 0;
    if ((uint64_t)(v38 - 1) >= 0)
    {
      uint64_t v46 = *(void *)&v29[v77];
      unint64_t v28 = 0x8000000000000000LL;
      if (v46 != 0x8000000000000000LL)
      {
        if (v38 != 0x8000000000000000LL)
        {
          if (v46 < 0) {
            goto LABEL_71;
          }
          unint64_t v28 = v46 + v38;
          if (__OFADD__(v46, v38))
          {
            unint64_t v28 = 0x8000000000000000LL;
          }

          else if ((v28 & 0x8000000000000000LL) != 0)
          {
            goto LABEL_72;
          }
        }

        *(void *)&v29[v77] = v28;
      }
    }

    os_unfair_lock_unlock(v26);
    os_unfair_lock_lock(v26);
    outlined init with copy of SubscriptionStatus(v75, (uint64_t)&v82);
    uint64_t v24 = v77;
    if (v85) {
      goto LABEL_2;
    }
  }

  uint64_t v54 = &v78[*(void *)(*(void *)v78 + 192LL)];
  swift_beginAccess();
  uint64_t v48 = v69;
  uint64_t v3 = v67;
  uint64_t v49 = v70;
  (*(void (**)(char *, _BYTE *, uint64_t))(v69 + 16))(v67, v54, v70);
  unint64_t v41 = v71;
  uint64_t v39 = v72;
LABEL_62:
  uint64_t AssociatedTypeWitness = (uint64_t)v62;
  (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v62, v3, v39);
  uint64_t v44 = (uint64_t)v61;
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v61, AssociatedTypeWitness, v39);
  uint64_t v3 = v63;
  uint64_t v32 = v64;
  if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v63 + 6))(v44, 1LL, v64) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(AssociatedTypeWitness, v39);
    goto LABEL_3;
  }

LABEL_65:
  uint64_t v55 = v60;
  (*((void (**)(char *, uint64_t, uint64_t))v3 + 4))(v60, v44, v32);
  uint64_t v82 = 1LL;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  char v85 = 2;
  uint64_t v56 = v75;
  swift_beginAccess();
  outlined assign with take of SubscriptionStatus((uint64_t)&v82, v56);
  swift_endAccess();
  os_unfair_lock_unlock(v26);
  v57 = v59;
  (*((void (**)(char *, char *, uint64_t))v3 + 2))(v59, v55, v32);
  (*((void (**)(char *, void, uint64_t, uint64_t))v3 + 7))(v57, 0LL, 1LL, v32);
  (*(void (**)(char *, void))(v80[13] + 56LL))(v57, v80[11]);
  v58 = *(void (**)(char *, uint64_t))(v41 + 8);
  v58(v57, v39);
  (*((void (**)(char *, uint64_t))v3 + 1))(v55, v32);
  v58((char *)AssociatedTypeWitness, v39);
}

void Publishers.Buffer.Inner.cancel()()
{
  uint64_t v1 = (os_unfair_lock_s *)v0[2];
  os_unfair_lock_lock(v1);
  uint64_t v2 = (uint64_t)v0 + *(void *)(*v0 + 160LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v2, (uint64_t)&v7);
  if (v10)
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v7);
    os_unfair_lock_unlock(v1);
  }

  else
  {
    outlined init with take of Subscription((__int128 *)&v7, (uint64_t)v11);
    uint64_t v7 = 1LL;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    char v10 = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v7, v2);
    swift_endAccess();
    swift_getAssociatedTypeWitness();
    uint64_t v3 = Array.init()();
    uint64_t v4 = (void *)((char *)v0 + *(void *)(*v0 + 176LL));
    swift_beginAccess();
    *uint64_t v4 = v3;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v1);
    uint64_t v5 = v12;
    uint64_t v6 = v13;
    __swift_project_boxed_opaque_existential_1(v11, v12);
    (*(void (**)(uint64_t))(*(void *)(v6 + 8) + 8LL))(v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }

uint64_t Publishers.Buffer.Inner.receive(subscription:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)v2;
  uint64_t v5 = *(os_unfair_lock_s **)(v2 + 16);
  os_unfair_lock_lock(v5);
  uint64_t v6 = v2 + *(void *)(*(void *)v2 + 160LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v6, (uint64_t)&v17);
  if (v20 == 2)
  {
    int8x16_t v7 = vorrq_s8(v18, v19);
    if (!(*(void *)&vorr_s8(*(int8x8_t *)v7.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)) | v17))
    {
      outlined destroy of SubscriptionStatus((uint64_t)&v17);
      outlined init with copy of Subscription((uint64_t)a1, (uint64_t)&v17);
      char v20 = 0;
      swift_beginAccess();
      outlined assign with take of SubscriptionStatus((uint64_t)&v17, v6);
      uint64_t result = swift_endAccess();
      if ((*(_BYTE *)(v2 + 40) & 1) != 0)
      {
        unint64_t v11 = 0x8000000000000000LL;
      }

      else
      {
        unint64_t v11 = *(void *)(v2 + 32);
        if ((v11 & 0x8000000000000000LL) != 0)
        {
          __break(1u);
          return result;
        }
      }

      os_unfair_lock_unlock(v5);
      uint64_t v12 = a1[3];
      uint64_t v13 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v12);
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v13 + 24))(v11, v12, v13);
      v19.i64[0] = v4;
      v19.i64[1] = (uint64_t)&protocol witness table for Publishers.Buffer<A>.Inner<A1>;
      uint64_t v17 = v2;
      uint64_t v14 = *(void *)(v4 + 104);
      uint64_t v15 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v14 + 40);
      uint64_t v16 = *(void *)(v4 + 88);
      swift_retain();
      v15(&v17, v16, v14);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v17);
    }
  }

  outlined destroy of SubscriptionStatus((uint64_t)&v17);
  os_unfair_lock_unlock(v5);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v8);
  return (*(uint64_t (**)(uint64_t))(*(void *)(v9 + 8) + 8LL))(v8);
}

uint64_t Publishers.Buffer.Inner.receive(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v58 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v60 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v56 = (char *)&v50 - v4;
  uint64_t v59 = swift_getAssociatedTypeWitness();
  uint64_t v57 = *(void *)(v59 - 8);
  MEMORY[0x1895F8858](v59);
  uint64_t v6 = (char *)&v50 - v5;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v9 = type metadata accessor for Subscribers.Completion(255LL, AssociatedTypeWitness, AssociatedConformanceWitness, v8);
  uint64_t v10 = type metadata accessor for Optional();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1895F8858](v10);
  uint64_t v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v12);
  uint64_t v16 = (char *)&v50 - v15;
  uint64_t v17 = (os_unfair_lock_s *)v2[2];
  os_unfair_lock_lock(v17);
  uint64_t v18 = (uint64_t)v2 + *(void *)(*v2 + 160LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v18, (uint64_t)v61);
  if (!v62)
  {
    uint64_t v20 = v60;
    uint64_t v53 = v14;
    uint64_t v54 = v6;
    os_unfair_lock_t v55 = v17;
    outlined init with take of Subscription(v61, (uint64_t)v63);
    uint64_t v21 = (char *)v2 + *(void *)(*v2 + 192LL);
    swift_beginAccess();
    uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
    uint64_t v52 = v21;
    v22(v16, v21, v10);
    uint64_t v23 = *(void *)(v9 - 8);
    int v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48))(v16, 1LL, v9);
    uint64_t v25 = v11;
    unsigned int v26 = v2;
    uint64_t v51 = v9;
    if (v24 == 1)
    {
      uint64_t v27 = v23;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
      uint64_t v28 = v59;
    }

    else
    {
      int v29 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48))(v16, 1LL, AssociatedTypeWitness);
      uint64_t v27 = v23;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v16, v9);
      uint64_t v28 = v59;
      if (v29 != 1)
      {
        os_unfair_lock_unlock(v55);
        goto LABEL_16;
      }
    }

    uint64_t v30 = AssociatedTypeWitness;
    uint64_t v59 = v25;
    swift_beginAccess();
    uint64_t v31 = swift_bridgeObjectRetain();
    uint64_t v32 = MEMORY[0x186E22090](v31, v28);
    swift_bridgeObjectRelease();
    BOOL v33 = v32 < v26[4];
    uint64_t v34 = v58;
    BOOL v35 = v55;
    uint64_t v36 = v54;
    uint64_t v37 = v57;
    if (v33)
    {
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v36, v34, v28);
      swift_beginAccess();
      type metadata accessor for Array();
      Array.append(_:)();
      swift_endAccess();
      goto LABEL_12;
    }

    uint64_t v38 = v26[6];
    if (!v38)
    {
LABEL_12:
      os_unfair_lock_unlock(v35);
      Publishers.Buffer.Inner.drain()();
      uint64_t v19 = v40;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
      return v19;
    }

    if (v38 == 1)
    {
      swift_beginAccess();
      uint64_t v39 = type metadata accessor for Array();
      MEMORY[0x186E22960](MEMORY[0x189618490], v39);
      RangeReplaceableCollection.removeFirst()();
      swift_endAccess();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v36, v28);
      goto LABEL_11;
    }

    unint64_t v50 = (void (*)(uint64_t))v26[6];
    uint64_t v42 = v50;
    uint64_t v43 = swift_retain();
    uint64_t v44 = v56;
    v42(v43);
    uint64_t v45 = v60;
    uint64_t v46 = v53;
    (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v53, v44, v30);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v46, 0LL, 1LL, v30);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v46, 0LL, 1LL, v51);
    uint64_t v47 = v52;
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v59 + 40))(v47, v46, v10);
    swift_endAccess();
    os_unfair_lock_unlock(v35);
    uint64_t v49 = v64;
    uint64_t v48 = v65;
    __swift_project_boxed_opaque_existential_1(v63, v64);
    (*(void (**)(uint64_t))(*(void *)(v48 + 8) + 8LL))(v49);
    outlined consume of Publishers.BufferingStrategy<A.Failure><A><A1>((unint64_t)v50);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v44, v30);
LABEL_16:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
    return 0LL;
  }

  outlined destroy of SubscriptionStatus((uint64_t)v61);
  os_unfair_lock_unlock(v17);
  return 0LL;
}

void Publishers.Buffer.Inner.receive(completion:)(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v6 = type metadata accessor for Subscribers.Completion(255LL, AssociatedTypeWitness, AssociatedConformanceWitness, v5);
  uint64_t v7 = type metadata accessor for Optional();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1895F8858](v7);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v9);
  uint64_t v13 = (char *)&v20 - v12;
  uint64_t v14 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v14);
  uint64_t v15 = (uint64_t)v1 + *(void *)(*v1 + 160LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v15, (uint64_t)v22);
  int v16 = v22[40];
  outlined destroy of SubscriptionStatus((uint64_t)v22);
  if (v16
    || (uint64_t v21 = a1,
        uint64_t v17 = (char *)v1 + *(void *)(*v1 + 192LL),
        swift_beginAccess(),
        (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v17, v7),
        uint64_t v18 = *(void *)(v6 - 8),
        int v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v13, 1LL, v6),
        (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7),
        v19 != 1))
  {
    os_unfair_lock_unlock(v14);
  }

  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v11, v21, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v11, 0LL, 1LL, v6);
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v8 + 40))(v17, v11, v7);
    swift_endAccess();
    os_unfair_lock_unlock(v14);
    Publishers.Buffer.Inner.drain()();
  }

uint64_t Publishers.Buffer.Inner.locked_pop(_:)(uint64_t result)
{
  if (result == 0x8000000000000000LL)
  {
    uint64_t v2 = (uint64_t *)(v1 + *(void *)(*(void *)v1 + 176LL));
    swift_beginAccess();
    uint64_t v3 = *v2;
    swift_getAssociatedTypeWitness();
    swift_bridgeObjectRetain();
    *uint64_t v2 = Array.init()();
    swift_bridgeObjectRelease();
    return v3;
  }

  if (result < 0)
  {
    __break(1u);
  }

  else if (result)
  {
    swift_beginAccess();
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v5 = type metadata accessor for Array();
    swift_bridgeObjectRetain();
    MEMORY[0x186E22960](MEMORY[0x189618488], v5);
    Collection.prefix(_:)();
    uint64_t v6 = type metadata accessor for ArraySlice();
    MEMORY[0x186E22960](MEMORY[0x189618F90], v6);
    uint64_t v3 = Array.init<A>(_:)();
    Swift::Int v7 = MEMORY[0x186E22090](v3, AssociatedTypeWitness);
    swift_beginAccess();
    MEMORY[0x186E22960](MEMORY[0x189618490], v5);
    RangeReplaceableCollection.removeFirst(_:)(v7);
    swift_endAccess();
    return v3;
  }

  __break(1u);
  return result;
}

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.Buffer<A>.Inner<A1>( void *a1)
{
  return Publishers.Buffer.Inner.receive(subscription:)(a1);
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance Publishers.Buffer<A>.Inner<A1>( uint64_t a1)
{
  return Publishers.Buffer.Inner.receive(_:)(a1);
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.Buffer<A>.Inner<A1>( uint64_t a1)
{
}

void protocol witness for Subscription.request(_:) in conformance Publishers.Buffer<A>.Inner<A1>(uint64_t a1)
{
}

void protocol witness for Cancellable.cancel() in conformance Publishers.Buffer<A>.Inner<A1>()
{
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Buffer<A>( uint64_t a1)
{
}

uint64_t storeEnumTagSinglePayload for Publishers.PrefetchStrategy( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD((*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))(v6, 1LL, 1LL, v4) = 1;
  }
  else {
    LODWORD((*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))(v6, 1LL, 1LL, v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_183B827DC + 4 * byte_183BA5EC5[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_183B82810 + 4 * byte_183BA5EC0[v4]))();
}

uint64_t sub_183B82810(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_183B82818(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x183B82820LL);
  }
  return result;
}

uint64_t sub_183B8282C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x183B82834LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_183B82838(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_183B82840(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Publishers.PrefetchStrategy()
{
  return &type metadata for Publishers.PrefetchStrategy;
}

void *destroy for Publishers.BufferingStrategy(void *result)
{
  if (*result >= 0xFFFFFFFFuLL) {
    return (void *)swift_release();
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Publishers.BufferingStrategy(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }

  else
  {
    uint64_t v3 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_retain();
  }

  return a1;
}

unint64_t *assignWithCopy for Publishers.BufferingStrategy( unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  if (*a1 < 0xFFFFFFFF)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      unint64_t v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      swift_retain();
      return a1;
    }

unint64_t *assignWithTake for Publishers.BufferingStrategy( unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  if (*a1 < 0xFFFFFFFF)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      unint64_t v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      return a1;
    }

uint64_t getEnumTagSinglePayload for Publishers.BufferingStrategy(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFE && *((_BYTE *)a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for Publishers.BufferingStrategy( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)uint64_t result = 0LL;
    *(void *)(result + 8) = 0LL;
    *(_DWORD *)uint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(_BYTE *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(_BYTE *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2 + 1;
    }
  }

  return result;
}

uint64_t getEnumTag for Publishers.BufferingStrategy(uint64_t *a1)
{
  uint64_t v1 = *a1;
  return (v1 + 1);
}

void *destructiveInjectEnumTag for Publishers.BufferingStrategy(void *result, int a2)
{
  if (a2 < 0)
  {
    uint64_t v2 = a2 ^ 0x80000000;
    result[1] = 0LL;
  }

  else
  {
    if (!a2) {
      return result;
    }
    uint64_t v2 = (a2 - 1);
  }

  *uint64_t result = v2;
  return result;
}

uint64_t type metadata accessor for Publishers.BufferingStrategy( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for Publishers.BufferingStrategy);
}

uint64_t type metadata completion function for Publishers.Buffer()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.Buffer(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 23) & 0xFFFFFFFFFFFFFFF8LL) + 16 > 0x18)
  {
    uint64_t v9 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }

  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v10 = ((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    *(void *)unint64_t v10 = *(void *)v11;
    *(_BYTE *)(v10 + 8) = *(_BYTE *)(v11 + 8);
    unint64_t v12 = ((unint64_t)v4 + v6 + 23) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v13 = ((unint64_t)a2 + v6 + 23) & 0xFFFFFFFFFFFFFFF8LL;
    if (*(void *)v13 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)unint64_t v12 = *(_OWORD *)v13;
      return v4;
    }

    uint64_t v14 = *(void *)(v13 + 8);
    *(void *)unint64_t v12 = *(void *)v13;
    *(void *)(v12 + 8) = v14;
  }

  swift_retain();
  return v4;
}

uint64_t destroy for Publishers.Buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8LL);
  uint64_t result = (*(uint64_t (**)(void))(v3 + 8))();
  if (*(void *)((a1 + *(void *)(v3 + 64) + 23) & 0xFFFFFFFFFFFFFFF8LL) >= 0xFFFFFFFFuLL) {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for Publishers.Buffer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v5 + 16))();
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = v6 + a1;
  uint64_t v8 = v6 + a2;
  unint64_t v9 = (v6 + a1 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v10 = (v8 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  *(void *)unint64_t v9 = *(void *)v10;
  *(_BYTE *)(v9 + 8) = *(_BYTE *)(v10 + 8);
  unint64_t v11 = (v7 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v12 = (v8 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  if (*(void *)v12 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v11 = *(_OWORD *)v12;
  }

  else
  {
    uint64_t v13 = *(void *)(v12 + 8);
    *(void *)unint64_t v11 = *(void *)v12;
    *(void *)(v11 + 8) = v13;
    swift_retain();
  }

  return a1;
}

uint64_t assignWithCopy for Publishers.Buffer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v5 + 24))();
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = v6 + a1;
  uint64_t v8 = v6 + a2;
  unint64_t v9 = (v7 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v10 = (v8 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  *(void *)unint64_t v9 = *(void *)v10;
  *(_BYTE *)(v9 + 8) = *(_BYTE *)(v10 + 8);
  unint64_t v11 = (void *)((v7 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v12 = (unint64_t *)((v8 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v13 = *v12;
  if (*v11 < 0xFFFFFFFFuLL)
  {
    if (v13 >= 0xFFFFFFFF)
    {
      unint64_t v15 = v12[1];
      void *v11 = v13;
      v11[1] = v15;
      swift_retain();
      return a1;
    }

uint64_t initializeWithTake for Publishers.Buffer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v5 + 32))();
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = v6 + a1;
  uint64_t v8 = v6 + a2;
  unint64_t v9 = (v6 + a1 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v10 = (v8 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  *(void *)unint64_t v9 = *(void *)v10;
  *(_BYTE *)(v9 + 8) = *(_BYTE *)(v10 + 8);
  unint64_t v11 = (v7 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v12 = (uint64_t *)((v8 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v13 = *v12;
  if ((unint64_t)*v12 < 0xFFFFFFFF)
  {
    *(_OWORD *)unint64_t v11 = *(_OWORD *)v12;
  }

  else
  {
    uint64_t v14 = v12[1];
    *(void *)unint64_t v11 = v13;
    *(void *)(v11 + 8) = v14;
  }

  return a1;
}

uint64_t assignWithTake for Publishers.Buffer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v5 + 40))();
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = v6 + a1;
  uint64_t v8 = v6 + a2;
  unint64_t v9 = (v7 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v10 = (v8 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  *(void *)unint64_t v9 = *(void *)v10;
  *(_BYTE *)(v9 + 8) = *(_BYTE *)(v10 + 8);
  unint64_t v11 = (void *)((v7 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v12 = (unint64_t *)((v8 + 23) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v13 = *v12;
  if (*v11 < 0xFFFFFFFFuLL)
  {
    if (v13 >= 0xFFFFFFFF)
    {
      unint64_t v15 = v12[1];
      void *v11 = v13;
      v11[1] = v15;
      return a1;
    }

uint64_t getEnumTagSinglePayload for Publishers.Buffer(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFD) {
    unsigned int v6 = 2147483645;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v7 = *(void *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFD)
    {
      unint64_t v12 = *(void *)((a1 + v7 + 23) & 0xFFFFFFFFFFFFF8LL);
      if (v12 >= 0xFFFFFFFF) {
        LODWORD(v12) = -1;
      }
      unsigned int v13 = v12 + 1;
      unsigned int v14 = v12 - 1;
      if (v13 >= 3) {
        return v14;
      }
      else {
        return 0LL;
      }
    }

    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }

  else
  {
    if (((((v7 + 23) & 0xFFFFFFFFFFFFFFF8LL) + 16) & 0xFFFFFFF8) != 0) {
      unsigned int v8 = 2;
    }
    else {
      unsigned int v8 = a2 - v6 + 1;
    }
    if (v8 >= 0x10000) {
      unsigned int v9 = 4;
    }
    else {
      unsigned int v9 = 2;
    }
    if (v8 < 0x100) {
      unsigned int v9 = 1;
    }
    if (v8 >= 2) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0LL;
    }
    return ((uint64_t (*)(void))((char *)&loc_183B83008 + 4 * byte_183BA5ECA[v10]))();
  }

void storeEnumTagSinglePayload for Publishers.Buffer( unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 16) - 8LL);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFDu) {
    unsigned int v6 = 2147483645;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v5 + 84);
  }
  if (v6 >= a3)
  {
    int v9 = 0u;
    if (a2 <= v6) {
      goto LABEL_17;
    }
  }

  else
  {
    if (((*(_DWORD *)(v5 + 64) + 23) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v7 = a3 - v6 + 1;
    }
    else {
      unsigned int v7 = 2;
    }
    if (v7 >= 0x10000) {
      int v8 = 4;
    }
    else {
      int v8 = 2;
    }
    if (v7 < 0x100) {
      int v8 = 1;
    }
    if (v7 >= 2) {
      int v9 = v8;
    }
    else {
      int v9 = 0;
    }
    if (a2 <= v6) {
LABEL_17:
    }
      __asm { BR              X12 }
  }

  if (((*(_DWORD *)(v5 + 64) + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    unsigned int v10 = ~v6 + a2;
    bzero(a1, ((*(void *)(v5 + 64) + 23LL) & 0xFFFFFFFFFFFFFFF8LL) + 16);
    *a1 = v10;
  }

  __asm { BR              X10 }

void sub_183B83194()
{
  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x183B83220LL);
}

void sub_183B8319C(uint64_t a1, int a2)
{
  *(_DWORD *)(v2 + (*(void (**)(uint64_t, void, uint64_t))(v1 + 16))(v0, *(void *)(v9 - 144) + *(int *)(v6 + 52), v3) = 0;
  if (a2) {
    JUMPOUT(0x183B831A4LL);
  }
  JUMPOUT(0x183B83220LL);
}

void sub_183B831F0()
{
  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x183B83220LL);
}

void sub_183B831F8()
{
  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x183B83220LL);
}

uint64_t sub_183B83200(uint64_t a1, unsigned int a2, unsigned int a3)
{
  *(_WORD *)(v6 + (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v3, *(void *)(v10 - 144), v7) = 0;
  if (!a2) {
    goto LABEL_6;
  }
  if (a3 < 0x7FFFFFFD)
  {
    if (a2 > 0x7FFFFFFD) {
      JUMPOUT(0x183B8320CLL);
    }
    *(void *)((v6 + v5 + 23) & 0xFFFFFFFFFFFFFFF8LL) = a2 + 1;
LABEL_6:
    JUMPOUT(0x183B83220LL);
  }

  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v6);
}

uint64_t type metadata completion function for Publishers.Buffer.Inner()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    type metadata accessor for Subscribers.Completion(255LL, AssociatedTypeWitness, AssociatedConformanceWitness, v4);
    uint64_t result = type metadata accessor for Optional();
    if (v5 <= 0x3F) {
      return swift_initClassMetadata2();
    }
  }

  return result;
}

void Publishers.Buffer.Inner.customMirror.getter(uint64_t a1@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v2 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1895F8858](v2);
  uint64_t v23 = (uint64_t)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1895F8858](v4);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  os_unfair_lock_lock(v1[2]);
  uint64_t v25 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = xmmword_183B9F040;
  *(void *)(v7 + 32) = 0x7365756C6176LL;
  *(void *)(v7 + 40) = 0xE600000000000000LL;
  int v8 = (uint64_t *)((char *)v1 + *(void *)&(*v1)[44]._os_unfair_lock_opaque);
  swift_beginAccess();
  uint64_t v22 = *v8;
  uint64_t v9 = v22;
  swift_getAssociatedTypeWitness();
  uint64_t v10 = type metadata accessor for Array();
  *(void *)(v7 + 48) = v9;
  *(void *)(v7 + 72) = v10;
  *(void *)(v7 + 80) = 0x6574617473LL;
  *(void *)(v7 + 88) = 0xE500000000000000LL;
  uint64_t v11 = (uint64_t)v1 + *(void *)&(*v1)[40]._os_unfair_lock_opaque;
  swift_beginAccess();
  *(void *)(v7 + 120) = &type metadata for SubscriptionStatus;
  uint64_t v12 = swift_allocObject();
  *(void *)(v7 + 96) = v12;
  outlined init with copy of SubscriptionStatus(v11, v12 + 16);
  *(void *)(v7 + 128) = 0xD000000000000010LL;
  *(void *)(v7 + 136) = 0x8000000183BA8230LL;
  os_unfair_lock_t v13 = *v1;
  *(void *)(v7 + 144) = *(os_unfair_lock_t *)((char *)v1 + *(void *)&(*v1)[42]._os_unfair_lock_opaque);
  *(void *)(v7 + 168) = &type metadata for Subscribers.Demand;
  *(void *)(v7 + 176) = 0x6C616E696D726574LL;
  *(void *)(v7 + 184) = 0xE800000000000000LL;
  unsigned int v14 = (char *)v1 + *(void *)&v13[48]._os_unfair_lock_opaque;
  swift_beginAccess();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  type metadata accessor for Subscribers.Completion(255LL, AssociatedTypeWitness, AssociatedConformanceWitness, v17);
  uint64_t v18 = type metadata accessor for Optional();
  *(void *)(v7 + 2__swift_destroy_boxed_opaque_existential_1(v0 + 16) = v18;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v7 + 192));
  (*(void (**)(uint64_t *, char *, uint64_t))(*(void *)(v18 - 8) + 16LL))( boxed_opaque_existential_1,  v14,  v18);
  uint64_t v20 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56LL))(v6, 1LL, 1LL, v20);
  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)(v23);
  swift_retain();
  swift_bridgeObjectRetain();
  Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
  os_unfair_lock_unlock(v1[2]);
}

void Publishers.Buffer.Inner.playgroundDescription.getter(void *a1@<X8>)
{
  a1[3] = MEMORY[0x189617FA8];
  *a1 = 0x726566667542LL;
  a1[1] = 0xE600000000000000LL;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Buffer<A>.Inner<A1>()
{
  return 0x726566667542LL;
}

void protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Buffer<A>.Inner<A1>( uint64_t a1@<X8>)
{
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Buffer<A>.Inner<A1>( void *a1@<X8>)
{
}

unint64_t outlined consume of Publishers.BufferingStrategy<A.Failure><A><A1>(unint64_t result)
{
  if (result >= 2) {
    return swift_release();
  }
  return result;
}

uint64_t sub_183B8372C()
{
  return swift_deallocObject();
}

uint64_t Sequence.publisher.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v4 + 16))(v6);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(a2, v6, a1);
}

uint64_t Publishers.Sequence.setFailureType<A>(to:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v3, v5);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a3, v8, v5);
}

uint64_t Publishers.Sequence.init(sequence:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 32LL))(a3, a1);
}

uint64_t Publishers.Sequence.sequence.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 16LL))(a2, v2);
}

void Publishers.Sequence.receive<A>(subscriber:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void v14[3] = a1;
  uint64_t v7 = a2[3];
  uint64_t v8 = a2[5];
  uint64_t v9 = type metadata accessor for Subscribers.Completion(0LL, v7, v8, a4);
  v14[1] = *(void *)(v9 - 8);
  v14[2] = v9;
  MEMORY[0x1895F8858](v9);
  v14[0] = (char *)v14 - v10;
  uint64_t v11 = a2[4];
  uint64_t v12 = a2[2];
  swift_getAssociatedTypeWitness();
  uint64_t v13 = type metadata accessor for Optional();
  MEMORY[0x1895F8858](v13);
  v14[9] = v12;
  v14[10] = v7;
  v14[5] = a3;
  v14[11] = a3;
  v14[12] = v12;
  v14[13] = v7;
  v14[14] = v11;
  v14[15] = v8;
  v14[16] = a4;
  v14[17] = v11;
  type metadata accessor for Publishers.Sequence.Inner();
}

uint64_t sub_183B83998(uint64_t a1)
{
  uint64_t v10 = specialized Publishers.Sequence.Inner.init(downstream:sequence:)(v2, *(void *)(v8 - 192));
  uint64_t v11 = v10 + *(void *)(*(void *)v10 + 176LL);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v11, v6);
  LODWORD(v11) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48LL))(v3, 1LL, v7);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v6);
  if ((_DWORD)v11 == 1)
  {
    uint64_t v12 = *(void *)(v8 - 184);
    if (one-time initialization token for singleton != -1) {
      swift_once();
    }
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v1 + 40))( static Subscriptions._EmptySubscription.singleton,  v12,  v1);
    uint64_t v13 = *(void *)(v8 - 224);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))(v13, 1LL, 1LL, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 56))(v13, v12, v1);
    (*(void (**)(uint64_t, void))(*(void *)(v8 - 216) + 8LL))(v13, *(void *)(v8 - 208));
    Publishers.Sequence.Inner.cancel()();
    return swift_release();
  }

  else
  {
    *(void *)(v8 - 128) = a1;
    *(void *)(v8 - 120) = &protocol witness table for Publishers.Sequence<A, B>.Inner<A1, B1, C1>;
    *(void *)(v8 - 152) = v10;
    (*(void (**)(uint64_t, void, uint64_t))(v1 + 40))(v8 - 152, *(void *)(v8 - 184), v1);
    return __swift_destroy_boxed_opaque_existential_1(v8 - 152);
  }

void type metadata accessor for Publishers.Sequence.Inner()
{
}

void Publishers.Sequence.Inner.cancel()()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 96);
  uint64_t v3 = type metadata accessor for Optional();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3);
  uint64_t v6 = (char *)&v14 - v5;
  uint64_t v7 = *(void *)(v1 + 104);
  uint64_t v8 = type metadata accessor for Optional();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = (char *)&v14 - v10;
  os_unfair_lock_lock(*(os_unfair_lock_t *)((char *)v0 + *(void *)(v1 + 200)));
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))(v11, 1LL, 1LL, v7);
  uint64_t v12 = (uint64_t)v0 + *(void *)(*v0 + 152);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(v12, v11, v8);
  swift_endAccess();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56LL))(v6, 1LL, 1LL, v2);
  uint64_t v13 = (uint64_t)v0 + *(void *)(*v0 + 160);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 40))(v13, v6, v3);
  swift_endAccess();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v0 + *(void *)(*v0 + 200)));
}

uint64_t Publishers.Sequence.Inner.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = *(void *)(*v0 + 104);
  uint64_t v4 = type metadata accessor for Optional();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  uint64_t v7 = (char *)&v11 - v6;
  os_unfair_lock_lock(*(os_unfair_lock_t *)((char *)v1 + *(void *)(v2 + 200)));
  uint64_t v8 = (uint64_t)v1 + *(void *)(*v1 + 152);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 48LL))(v7, 1LL, v3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
LABEL_6:
    uint64_t v14 = 0LL;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    goto LABEL_7;
  }

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CustomStringConvertible);
  if (!*((void *)&v13 + 1))
  {
LABEL_7:
    outlined destroy of CustomStringConvertible?((uint64_t)&v12);
    uint64_t v9 = 0x65636E6575716553LL;
    goto LABEL_8;
  }

  outlined init with take of Subscription(&v12, (uint64_t)v15);
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  uint64_t v9 = dispatch thunk of CustomStringConvertible.description.getter();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
LABEL_8:
  os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v1 + *(void *)(*v1 + 200)));
  return v9;
}

void Publishers.Sequence.Inner.customMirror.getter(uint64_t a1@<X8>)
{
  v20[1] = a1;
  uint64_t v2 = *v1;
  uint64_t v3 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1895F8858](v3);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1895F8858](v6);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = *(void *)(v2 + 104);
  uint64_t v10 = type metadata accessor for Optional();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1895F8858](v10);
  __int128 v13 = (char *)v20 - v12;
  os_unfair_lock_lock(*(os_unfair_lock_t *)((char *)v1 + *(void *)(v2 + 200)));
  uint64_t v23 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = xmmword_183B9D5B0;
  *(void *)(v14 + 32) = 0x65636E6575716573LL;
  *(void *)(v14 + 40) = 0xE800000000000000LL;
  uint64_t v15 = (uint64_t)v1 + *(void *)(*v1 + 152);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v15, v10);
  uint64_t v16 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v13, 1LL, v9) == 1)
  {
    uint64_t v17 = *(void (**)(char *, uint64_t))(v11 + 8);
    swift_retain();
    v17(v13, v10);
    *(void *)(v14 + 72) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Any]);
    *(void *)(v14 + 48) = MEMORY[0x18961AFE8];
  }

  else
  {
    uint64_t v22 = v9;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v21);
    (*(void (**)(uint64_t *, char *, uint64_t))(v16 + 32))(boxed_opaque_existential_1, v13, v9);
    outlined init with take of Any(v21, (_OWORD *)(v14 + 48));
    swift_retain();
  }

  uint64_t v19 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56LL))(v8, 1LL, 1LL, v19);
  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)((uint64_t)v5);
  Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v1 + *(void *)(*v1 + 200)));
}

uint64_t Publishers.Sequence.Inner.playgroundDescription.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Publishers.Sequence.Inner.description.getter();
  a1[3] = MEMORY[0x189617FA8];
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t Publishers.Sequence.Inner.deinit()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 152LL);
  uint64_t v2 = type metadata accessor for Optional();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  uint64_t v3 = v0 + *(void *)(*(void *)v0 + 160LL);
  uint64_t v4 = type metadata accessor for Optional();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  uint64_t v5 = v0 + *(void *)(*(void *)v0 + 168LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8LL))(v5, AssociatedTypeWitness);
  uint64_t v7 = v0 + *(void *)(*(void *)v0 + 176LL);
  swift_getAssociatedTypeWitness();
  uint64_t v8 = type metadata accessor for Optional();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);
  return v0;
}

uint64_t Publishers.Sequence.Inner.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void Publishers.Sequence.Inner.request(_:)(void (*a1)(void, void, void))
{
  uint64_t v2 = v1;
  unint64_t v121 = (unint64_t)a1;
  uint64_t v3 = *(void **)v1;
  uint64_t v4 = *(void *)(*(void *)v1 + 112LL);
  uint64_t v5 = v3[17];
  uint64_t v6 = v3[12];
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v101 = v4;
  uint64_t v102 = type metadata accessor for Subscribers.Completion(0LL, v4, AssociatedConformanceWitness, v8);
  uint64_t v100 = *(void *)(v102 - 8);
  MEMORY[0x1895F8858](v102);
  uint64_t v10 = (char *)&v92 - v9;
  uint64_t v112 = v5;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v126 = type metadata accessor for Optional();
  uint64_t v105 = *(void *)(v126 - 8);
  uint64_t v12 = MEMORY[0x1895F8858](v126);
  v109 = (char *)&v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = MEMORY[0x1895F8858](v12);
  v110 = (char *)&v92 - v15;
  uint64_t v16 = MEMORY[0x1895F8858](v14);
  v119 = (char *)&v92 - v17;
  uint64_t v123 = AssociatedTypeWitness;
  uint64_t v114 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](v16);
  v122 = (char *)&v92 - v18;
  uint64_t v125 = v3[13];
  uint64_t v117 = type metadata accessor for Optional();
  uint64_t v116 = *(void *)(v117 - 8);
  uint64_t v19 = MEMORY[0x1895F8858](v117);
  v98 = (char *)&v92 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v19);
  v113 = (char *)&v92 - v21;
  uint64_t v22 = type metadata accessor for Optional();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = MEMORY[0x1895F8858](v22);
  v99 = (char *)&v92 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = MEMORY[0x1895F8858](v24);
  uint64_t v28 = (char *)&v92 - v27;
  int v29 = *(void **)(v6 - 8);
  MEMORY[0x1895F8858](v26);
  uint64_t v31 = (char *)&v92 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v111 = v3;
  uint64_t v32 = *(os_unfair_lock_s **)(v2 + v3[25]);
  os_unfair_lock_lock(v32);
  uint64_t v33 = v2 + *(void *)(*(void *)v2 + 160LL);
  swift_beginAccess();
  uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 16);
  uint64_t v97 = v33;
  v34(v28, v33, v22);
  BOOL v35 = (unsigned int (*)(char *, uint64_t, uint64_t))v29[6];
  uint64_t v120 = v6;
  if (v35(v28, 1LL, v6) == 1)
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v28, v22);
    os_unfair_lock_unlock(v32);
    return;
  }

  uint64_t v95 = v23;
  v96 = v10;
  uint64_t v36 = (void (*)(char *, char *, uint64_t))v29[4];
  v108 = v31;
  v36(v31, v28, v120);
  uint64_t v37 = *(void **)v2;
  uint64_t v124 = *(void *)(*(void *)v2 + 184LL);
  uint64_t v38 = *(void *)(v2 + v124);
  unint64_t v39 = 0x8000000000000000LL;
  uint64_t v40 = v105;
  unint64_t v41 = v119;
  if (v38 != 0x8000000000000000LL)
  {
    if (v121 != 0x8000000000000000LL)
    {
      if (((v38 | v121) & 0x8000000000000000LL) != 0) {
        goto LABEL_43;
      }
      unint64_t v39 = v38 + v121;
      if (__OFADD__(v38, v121))
      {
        unint64_t v39 = 0x8000000000000000LL;
      }

      else if ((v39 & 0x8000000000000000LL) != 0)
      {
        goto LABEL_44;
      }
    }

    *(void *)(v2 + v124) = v39;
    uint64_t v37 = *(void **)v2;
  }

  if ((*(_BYTE *)(v2 + v37[24]) & 1) != 0)
  {
    os_unfair_lock_unlock(v32);
    uint64_t v42 = (void (*)(char *, uint64_t))v29[1];
LABEL_34:
    v42(v108, v120);
    return;
  }

  uint64_t v118 = v37[24];
  os_unfair_lock_t v106 = v32;
  uint64_t v93 = v22;
  v94 = v29;
  uint64_t v43 = v2 + v37[19];
  uint64_t v44 = v2 + v37[22];
  uint64_t v103 = v2 + v37[21];
  uint64_t v107 = v43;
  swift_beginAccess();
  swift_beginAccess();
  uint64_t v45 = v114;
  uint64_t v46 = v124;
  for (i = v2; ; uint64_t v2 = i)
  {
    uint64_t v47 = *(void *)(v2 + v46);
    if (v47 == 0x8000000000000000LL) {
      goto LABEL_17;
    }
    if (v47 < 0) {
      break;
    }
    if (!v47) {
      goto LABEL_33;
    }
LABEL_17:
    uint64_t v48 = v116;
    uint64_t v49 = v113;
    uint64_t v50 = v117;
    (*(void (**)(char *, uint64_t, uint64_t))(v116 + 16))(v113, v107, v117);
    uint64_t v104 = *(void *)(v125 - 8);
    int v51 = (*(uint64_t (**)(char *, uint64_t))(v104 + 48))(v49, 1LL);
    uint64_t v52 = v49;
    uint64_t v53 = v124;
    uint64_t v54 = v50;
    uint64_t v55 = v126;
    (*(void (**)(char *, uint64_t))(v48 + 8))(v52, v54);
    if (v51 == 1)
    {
LABEL_33:
      os_unfair_lock_unlock(v106);
      uint64_t v42 = (void (*)(char *, uint64_t))v94[1];
      goto LABEL_34;
    }

    uint64_t v56 = *(void (**)(char *, uint64_t, uint64_t))(v40 + 16);
    v56(v41, v44, v55);
    uint64_t v57 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48);
    uint64_t v58 = v123;
    if (v57(v41, 1LL, v123) == 1)
    {
      (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v126);
      v76 = v98;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v104 + 56))(v98, 1LL, 1LL, v125);
      uint64_t v77 = v107;
      swift_beginAccess();
      (*(void (**)(uint64_t, char *, uint64_t))(v116 + 40))(v77, v76, v117);
      swift_endAccess();
      v78 = v94;
      v79 = v99;
      uint64_t v80 = v120;
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v94[7])(v99, 1LL, 1LL, v120);
      uint64_t v81 = v97;
      swift_beginAccess();
      (*(void (**)(uint64_t, char *, uint64_t))(v95 + 40))(v81, v79, v93);
      swift_endAccess();
      os_unfair_lock_unlock(v106);
      uint64_t v82 = v96;
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v101 - 8) + 56LL))(v96, 1LL, 1LL);
      __int128 v83 = v108;
      (*(void (**)(char *, uint64_t))(v112 + 56))(v82, v80);
      (*(void (**)(char *, uint64_t))(v100 + 8))(v82, v102);
      ((void (*)(char *, uint64_t))v78[1])(v83, v80);
      return;
    }

    unint64_t v121 = (unint64_t)v56;
    uint64_t v59 = v122;
    (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v122, v41, v58);
    uint64_t v60 = *(void *)(v2 + v53);
    if (v60 != 0x8000000000000000LL)
    {
      if (v60 < 0) {
        goto LABEL_39;
      }
      if (!v60) {
        goto LABEL_40;
      }
      *(void *)(v2 + v53) = v60 - 1;
    }

    swift_beginAccess();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    v61 = v110;
    uint64_t v62 = v40;
    uint64_t v63 = v120;
    dispatch thunk of IteratorProtocol.next()();
    swift_endAccess();
    swift_beginAccess();
    uint64_t v64 = v126;
    (*(void (**)(uint64_t, char *, uint64_t))(v62 + 40))(v44, v61, v126);
    swift_endAccess();
    uint64_t v65 = v44;
    uint64_t v66 = v118;
    *(_BYTE *)(v2 + v118) = 1;
    os_unfair_lock_t v67 = v106;
    os_unfair_lock_unlock(v106);
    uint64_t v68 = (*(uint64_t (**)(char *, uint64_t))(v112 + 48))(v59, v63);
    uint64_t v69 = v67;
    uint64_t v46 = v124;
    os_unfair_lock_lock(v69);
    uint64_t v70 = *(void *)(v2 + v46);
    unint64_t v71 = 0x8000000000000000LL;
    uint64_t v72 = (void (*)(char *, uint64_t, uint64_t))v121;
    if (v70 != 0x8000000000000000LL)
    {
      if (v68 != 0x8000000000000000LL)
      {
        if ((v70 | v68) < 0) {
          goto LABEL_41;
        }
        unint64_t v71 = v70 + v68;
        if (__OFADD__(v70, v68))
        {
          unint64_t v71 = 0x8000000000000000LL;
        }

        else if ((v71 & 0x8000000000000000LL) != 0)
        {
          goto LABEL_42;
        }
      }

      uint64_t v2 = i;
      *(void *)(i + v46) = v71;
      uint64_t v64 = v126;
      uint64_t v62 = v105;
      uint64_t v66 = v118;
    }

    *(_BYTE *)(v2 + v66) = 0;
    v73 = v109;
    v72(v109, v65, v64);
    uint64_t v74 = v123;
    unsigned int v75 = v57(v73, 1LL, v123);
    (*(void (**)(char *, uint64_t))(v62 + 8))(v73, v64);
    if (v75 == 1)
    {
      __int128 v84 = v98;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v104 + 56))(v98, 1LL, 1LL, v125);
      uint64_t v85 = v107;
      swift_beginAccess();
      (*(void (**)(uint64_t, char *, uint64_t))(v116 + 40))(v85, v84, v117);
      swift_endAccess();
      v86 = v94;
      v87 = v99;
      uint64_t v88 = v120;
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v94[7])(v99, 1LL, 1LL, v120);
      uint64_t v89 = v97;
      swift_beginAccess();
      (*(void (**)(uint64_t, char *, uint64_t))(v95 + 40))(v89, v87, v93);
      swift_endAccess();
      os_unfair_lock_unlock(v106);
      v90 = v96;
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v101 - 8) + 56LL))(v96, 1LL, 1LL);
      v91 = v108;
      (*(void (**)(char *, uint64_t))(v112 + 56))(v90, v88);
      (*(void (**)(char *, uint64_t))(v100 + 8))(v90, v102);
      (*(void (**)(char *, uint64_t))(v114 + 8))(v122, v74);
      ((void (*)(char *, uint64_t))v86[1])(v91, v88);
      return;
    }

    uint64_t v40 = v62;
    uint64_t v44 = v65;
    uint64_t v45 = v114;
    (*(void (**)(char *, uint64_t))(v114 + 8))(v122, v74);
    unint64_t v41 = v119;
  }

  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
}

void protocol witness for Subscription.request(_:) in conformance Publishers.Sequence<A, B>.Inner<A1, B1, C1>( void (*a1)(void, void, void))
{
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Sequence<A, B>.Inner<A1, B1, C1>()
{
  return Publishers.Sequence.Inner.description.getter();
}

void protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Sequence<A, B>.Inner<A1, B1, C1>( uint64_t a1@<X8>)
{
}

uint64_t protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Sequence<A, B>.Inner<A1, B1, C1>@<X0>( uint64_t *a1@<X8>)
{
  return Publishers.Sequence.Inner.playgroundDescription.getter(a1);
}

void protocol witness for Cancellable.cancel() in conformance Publishers.Sequence<A, B>.Inner<A1, B1, C1>()
{
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Sequence<A, B>( uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
}

uint64_t Publishers.Sequence<>.min(by:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return Publishers.Sequence<>.min(by:)(a1, a2, a3, MEMORY[0x189618108], a4);
}

uint64_t Publishers.Sequence<>.max(by:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return Publishers.Sequence<>.min(by:)(a1, a2, a3, MEMORY[0x189618100], a4);
}

uint64_t Publishers.Sequence<>.first(where:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return Publishers.Sequence<>.min(by:)(a1, a2, a3, MEMORY[0x189618120], a4);
}

uint64_t Publishers.Sequence<>.min(by:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t)@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = *(void *)(a3 + 32);
  uint64_t v10 = *(void *)(a3 + 16);
  swift_getAssociatedTypeWitness();
  uint64_t v11 = type metadata accessor for Optional();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1895F8858](v11);
  uint64_t v14 = (char *)&v16 - v13;
  a4(a1, a2, v10, v9);
  Optional.publisher.getter(v11, a5);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t Publishers.Sequence.allSatisfy(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return Publishers.Sequence.allSatisfy(_:)( a1,  a2,  a3,  (uint64_t (*)(uint64_t, uint64_t, void, void))MEMORY[0x1896180C8],  a4);
}

uint64_t Publishers.Sequence.tryAllSatisfy(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return Publishers.Sequence.tryAllSatisfy(_:)( a1,  a2,  a3,  (uint64_t (*)(uint64_t, uint64_t, void, void))MEMORY[0x1896180C8],  a4);
}

uint64_t Publishers.Sequence.collect()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_getAssociatedTypeWitness();
  type metadata accessor for Array();
  uint64_t v9 = type metadata accessor for Result();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1895F8858](v9);
  uint64_t v12 = (uint64_t *)((char *)&v14 - v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v3, v5);
  uint64_t *v12 = Array.init<A>(_:)();
  swift_storeEnumTagMultiPayload();
  Result.publisher.getter(v9, a2);
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t Publishers.Sequence.compactMap<A>(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = Sequence.compactMap<A>(_:)();
  uint64_t v2 = type metadata accessor for Array();
  MEMORY[0x186E22960](MEMORY[0x189618470], v2);
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v2 - 8) + 32LL))(a1, &v4, v2);
}

uint64_t Publishers.Sequence.contains(where:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return Publishers.Sequence.allSatisfy(_:)(a1, a2, a3, MEMORY[0x189618160], a4);
}

uint64_t Publishers.Sequence.allSatisfy(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, void, void)@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = type metadata accessor for Result();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1895F8858](v10);
  uint64_t v13 = (char *)&v15 - v12;
  *uint64_t v13 = a4(a1, a2, *(void *)(a3 + 16), *(void *)(a3 + 32)) & 1;
  swift_storeEnumTagMultiPayload();
  Result.publisher.getter(v10, a5);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t Publishers.Sequence.tryContains(where:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return Publishers.Sequence.tryAllSatisfy(_:)(a1, a2, a3, MEMORY[0x189618160], a4);
}

uint64_t Publishers.Sequence.tryAllSatisfy(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, void, void)@<X3>, uint64_t a5@<X8>)
{
  uint64_t result = a4(a1, a2, *(void *)(a3 + 16), *(void *)(a3 + 32));
  *(void *)a5 = result & 1;
  *(_BYTE *)(a5 + 8) = 0;
  return result;
}

uint64_t Publishers.Sequence.drop(while:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  v13[0] = a3;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for DropWhileSequence();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = (char *)v13 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v3, v4);
  Sequence.drop(while:)();
  MEMORY[0x186E22960](MEMORY[0x189619730], v8);
  return (*(uint64_t (**)(void, char *, uint64_t))(v9 + 32))(v13[0], v11, v8);
}

uint64_t Publishers.Sequence.dropFirst(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t Sequence = type metadata accessor for DropFirstSequence();
  uint64_t v10 = *(void *)(Sequence - 8);
  MEMORY[0x1895F8858](Sequence);
  uint64_t v12 = (char *)&v14 - v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v3, v5);
  Sequence.dropFirst(_:)();
  MEMORY[0x186E22960](MEMORY[0x189619720], Sequence);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a3, v12, Sequence);
}

uint64_t Publishers.Sequence.filter(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return Publishers.Sequence.filter(_:)(a1, a2, a3, MEMORY[0x189618128], a4);
}

uint64_t Publishers.Sequence.ignoreOutput()@<X0>(_BYTE *a1@<X8>)
{
  return Empty.init(completeImmediately:)(1LL, a1);
}

uint64_t Publishers.Sequence.map<A>(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v11 = *(void *)(a3 + 16);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v14 = &v20[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 16))(v14, v5, v11);
  uint64_t v15 = *(void *)(a3 + 24);
  uint64_t v21 = v11;
  uint64_t v22 = v15;
  uint64_t v23 = a4;
  __int128 v24 = *(_OWORD *)(a3 + 32);
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  uint64_t v17 = _sSTsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF( (void (*)(char *, char *))partial apply for thunk for @callee_guaranteed (@in_guaranteed A.Sequence.Element) -> (@out A1),  (uint64_t)v20,  v11,  a4,  MEMORY[0x18961A520],  v24,  MEMORY[0x18961A528],  v16);
  (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v27 = v17;
  uint64_t v18 = type metadata accessor for Array();
  MEMORY[0x186E22960](MEMORY[0x189618470], v18);
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v18 - 8) + 32LL))(a5, &v27, v18);
}

uint64_t _sSTsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF( void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v40 = a8;
  uint64_t v41 = a5;
  uint64_t v9 = v8;
  uint64_t v53 = a4;
  uint64_t v54 = a1;
  uint64_t v55 = a2;
  uint64_t v39 = *(void *)(a5 - 8);
  uint64_t v10 = MEMORY[0x1895F8858](a1);
  uint64_t v52 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v10);
  int v51 = (char *)v37 - v12;
  uint64_t v45 = v13;
  uint64_t v15 = v14;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v17 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v38 = (char *)v37 - v18;
  uint64_t v19 = type metadata accessor for Optional();
  uint64_t v42 = *(void *)(v19 - 8);
  uint64_t v43 = v19;
  uint64_t v20 = MEMORY[0x1895F8858](v19);
  uint64_t v49 = (char *)v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = MEMORY[0x1895F8858](v20);
  __int128 v24 = (char *)v37 - v23;
  uint64_t v25 = MEMORY[0x1895F8858](v22);
  v37[1] = (char *)v37 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v27 = MEMORY[0x1895F8858](v25);
  uint64_t v48 = *((void *)v15 - 1);
  MEMORY[0x1895F8858](v27);
  uint64_t v47 = (char *)v37 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v56 = swift_getAssociatedTypeWitness();
  uint64_t v44 = *(void *)(v56 - 8);
  MEMORY[0x1895F8858](v56);
  uint64_t v46 = (char *)v37 - v29;
  uint64_t v30 = v15;
  Swift::Int v31 = dispatch thunk of Sequence.underestimatedCount.getter();
  uint64_t v57 = Array.init()();
  uint64_t v53 = type metadata accessor for ContiguousArray();
  ContiguousArray.reserveCapacity(_:)(v31);
  (*(void (**)(char *, void, void *))(v48 + 16))(v47, v50, v15);
  uint64_t v32 = v46;
  uint64_t v50 = v30;
  uint64_t result = dispatch thunk of Sequence.makeIterator()();
  if (v31 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }

  if (v31)
  {
    swift_getAssociatedConformanceWitness();
    while (1)
    {
      dispatch thunk of IteratorProtocol.next()();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v24, 1LL, AssociatedTypeWitness);
      if ((_DWORD)result == 1) {
        goto LABEL_18;
      }
      v54(v24, v52);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v52, v41);
        return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v24, AssociatedTypeWitness);
      }

      uint64_t v9 = 0LL;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v24, AssociatedTypeWitness);
      ContiguousArray.append(_:)();
      if (!--v31)
      {
        uint64_t v34 = v49;
        goto LABEL_9;
      }
    }
  }

  swift_getAssociatedConformanceWitness();
  uint64_t v34 = v49;
LABEL_9:
  dispatch thunk of IteratorProtocol.next()();
  uint64_t v52 = *(char **)(v17 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v52)(v34, 1LL, AssociatedTypeWitness) == 1)
  {
    BOOL v35 = v49;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v35, v43);
    return v57;
  }

  else
  {
    uint64_t v50 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    uint64_t v36 = v38;
    BOOL v35 = v49;
    while (1)
    {
      v50(v36, v35, AssociatedTypeWitness);
      v54(v36, v51);
      if (v9) {
        break;
      }
      uint64_t v9 = 0LL;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
      ContiguousArray.append(_:)();
      dispatch thunk of IteratorProtocol.next()();
    }

    (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v51, v41);
  }

uint64_t Publishers.Sequence.prefix(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for PrefixSequence();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1895F8858](v9);
  uint64_t v12 = (char *)&v14 - v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v3, v5);
  Sequence.prefix(_:)();
  MEMORY[0x186E22960](MEMORY[0x189619478], v9);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a3, v12, v9);
}

uint64_t Publishers.Sequence.prefix(while:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return Publishers.Sequence.filter(_:)(a1, a2, a3, MEMORY[0x189618130], a4);
}

uint64_t Publishers.Sequence.filter(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, void)@<X3>, uint64_t a5@<X8>)
{
  uint64_t v11 = *(void *)(a3 + 16);
  MEMORY[0x1895F8858](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))( (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v5,  v11);
  v16[0] = a4(a1, a2, v11, *(void *)(a3 + 32));
  swift_getAssociatedTypeWitness();
  uint64_t v14 = type metadata accessor for Array();
  MEMORY[0x186E22960](MEMORY[0x189618470], v14);
  return (*(uint64_t (**)(uint64_t, void *, uint64_t))(*(void *)(v14 - 8) + 32LL))(a5, v16, v14);
}

uint64_t Publishers.Sequence.reduce<A>(_:_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Result();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)&v7 - v4;
  Sequence.reduce<A>(_:_:)();
  swift_storeEnumTagMultiPayload();
  Result.publisher.getter(v2, a1);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t Publishers.Sequence.tryReduce<A>(_:_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v7 = v6;
  uint64_t v20 = a6;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  uint64_t v13 = type metadata accessor for Result();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1895F8858](v13);
  uint64_t v16 = (char *)&v19 - v15;
  __int128 v17 = *(_OWORD *)(a4 + 32);
  __int128 v21 = *(_OWORD *)(a4 + 16);
  uint64_t v22 = a5;
  __int128 v23 = v17;
  uint64_t v24 = v7;
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  _ss6ResultOsRi_zrlE8catchingAByxq_Gxyq_YKXE_tcfC( (void (*)(_BYTE *))partial apply for closure #1 in Publishers.Sequence.tryReduce<A>(_:_:),  (uint64_t)&v19 - v15);
  Result.publisher.getter(v13, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t Publishers.Sequence.replaceNil<A>(with:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v4, v9);
  uint64_t v13 = *(void *)(a2 + 24);
  uint64_t v18 = v9;
  uint64_t v19 = v13;
  uint64_t v20 = a3;
  __int128 v17 = *(_OWORD *)(a2 + 32);
  __int128 v21 = v17;
  uint64_t v22 = a1;
  type metadata accessor for Optional();
  uint64_t v14 = Sequence.compactMap<A>(_:)();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v23 = v14;
  uint64_t v15 = type metadata accessor for Array();
  MEMORY[0x186E22960](MEMORY[0x189618470], v15);
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v15 - 8) + 32LL))(a4, &v23, v15);
}

uint64_t closure #1 in Publishers.Sequence.replaceNil<A>(with:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, char *a4@<X8>)
{
  uint64_t v8 = type metadata accessor for Optional();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1895F8858](v8);
  uint64_t v12 = (char *)&v18 - v11;
  uint64_t v13 = *(void *)(a3 - 8);
  MEMORY[0x1895F8858](v10);
  uint64_t v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1LL, a3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(a4, a2, a3);
  }

  else
  {
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v16(v15, v12, a3);
    v16(a4, v15, a3);
  }

  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(a4, 0LL, 1LL, a3);
  return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(a4, 0LL, 1LL, v8);
}

uint64_t Publishers.Sequence.scan<A>(_:_:)@<X0>( void (*a1)(void, void, void)@<X0>, void (*a2)(char *, char *)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v37 = a2;
  uint64_t v38 = a3;
  uint64_t v34 = a6;
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v32 = *(void *)(a4 + 32);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v39 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v10 = (char *)&v30 - v9;
  uint64_t v11 = type metadata accessor for Optional();
  uint64_t v12 = MEMORY[0x1895F8858](v11);
  uint64_t v14 = (char *)&v30 - v13;
  uint64_t v31 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858](v12);
  uint64_t v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v41 = swift_getAssociatedTypeWitness();
  uint64_t v33 = *(void *)(v41 - 8);
  uint64_t v17 = MEMORY[0x1895F8858](v41);
  uint64_t v40 = (char *)&v30 - v18;
  uint64_t v19 = *(void *)(a5 - 8);
  uint64_t v20 = MEMORY[0x1895F8858](v17);
  uint64_t v22 = (char *)&v30 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v20);
  uint64_t v24 = (char *)&v30 - v23;
  uint64_t v43 = static Array._allocateUninitialized(_:)();
  uint64_t v25 = v36;
  uint64_t v36 = *(void (**)(void, void, void))(v19 + 16);
  v36(v24, v25, a5);
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v16, AssociatedConformanceWitness, v7);
  dispatch thunk of Sequence.makeIterator()();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  dispatch thunk of IteratorProtocol.next()();
  uint64_t v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48);
  if (v26(v14, 1LL, AssociatedTypeWitness) != 1)
  {
    uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v39 + 32);
    do
    {
      v27(v10, v14, AssociatedTypeWitness);
      v37(v24, v10);
      (*(void (**)(char *, uint64_t))(v19 + 8))(v24, a5);
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v24, v22, a5);
      v36(v22, v24, a5);
      type metadata accessor for Array();
      Array.append(_:)();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v10, AssociatedTypeWitness);
      dispatch thunk of IteratorProtocol.next()();
    }

    while (v26(v14, 1LL, AssociatedTypeWitness) != 1);
  }

  (*(void (**)(char *, uint64_t))(v33 + 8))(v40, v41);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v24, a5);
  uint64_t v42 = v43;
  uint64_t v28 = type metadata accessor for Array();
  MEMORY[0x186E22960](MEMORY[0x189618470], v28);
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v28 - 8) + 32LL))(v34, &v42, v28);
}

uint64_t Publishers.Sequence<>.removeDuplicates()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v39 = a3;
  uint64_t v40 = a2;
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v45 = *(void (**)(void, void, void))(a1 + 32);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v49 = *(void **)(AssociatedTypeWitness - 8);
  uint64_t v5 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v43 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = MEMORY[0x1895F8858](v5);
  uint64_t v9 = (void (**)(char *, uint64_t, uint64_t))((char *)&v38 - v8);
  uint64_t v10 = MEMORY[0x1895F8858](v7);
  uint64_t v12 = (char *)&v38 - v11;
  uint64_t v41 = *(void (***)(char *, uint64_t, uint64_t))(v3 - 8);
  MEMORY[0x1895F8858](v10);
  uint64_t v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v48 = swift_getAssociatedTypeWitness();
  uint64_t v38 = *(void *)(v48 - 8);
  MEMORY[0x1895F8858](v48);
  uint64_t v47 = (char *)&v38 - v15;
  uint64_t v16 = type metadata accessor for Optional();
  uint64_t v44 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x1895F8858](v16);
  uint64_t v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = MEMORY[0x1895F8858](v17);
  uint64_t v22 = (char *)&v38 - v21;
  MEMORY[0x1895F8858](v20);
  uint64_t v24 = (char *)&v38 - v23;
  uint64_t v51 = static Array._allocateUninitialized(_:)();
  uint64_t v42 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v49[7];
  v42(v24, 1LL, 1LL, AssociatedTypeWitness);
  v41[2](v14, v46, v3);
  dispatch thunk of Sequence.makeIterator()();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v26 = v44;
  uint64_t v46 = AssociatedConformanceWitness;
  dispatch thunk of IteratorProtocol.next()();
  uint64_t v27 = (unsigned int (*)(char *, uint64_t, uint64_t))v49[6];
  if (v27(v22, 1LL, AssociatedTypeWitness) != 1)
  {
    uint64_t v30 = (void (*)(void, void, void))v49[4];
    uint64_t v41 = v9;
    uint64_t v45 = v30;
    v30(v12, v22, AssociatedTypeWitness);
    while (1)
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v19, v24, v16);
      if (v27(v19, 1LL, AssociatedTypeWitness) == 1)
      {
        uint64_t v31 = *(void (**)(char *, uint64_t))(v26 + 8);
        v31(v24, v16);
        v31(v19, v16);
        uint64_t v32 = v49;
        uint64_t v33 = (void (*)(char *, char *, uint64_t))v49[2];
        v33(v24, v12, AssociatedTypeWitness);
        v42(v24, 0LL, 1LL, AssociatedTypeWitness);
        v33(v43, v12, AssociatedTypeWitness);
        type metadata accessor for Array();
        uint64_t v26 = v44;
        Array.append(_:)();
        uint64_t v34 = (void (*)(char *, uint64_t))v32[1];
        uint64_t v9 = v41;
      }

      else
      {
        v30(v9, v19, AssociatedTypeWitness);
        if ((dispatch thunk of static Equatable.== infix(_:_:)() & 1) != 0)
        {
          uint64_t v34 = (void (*)(char *, uint64_t))v49[1];
          v34((char *)v9, AssociatedTypeWitness);
        }

        else
        {
          (*(void (**)(char *, uint64_t))(v26 + 8))(v24, v16);
          uint64_t v36 = v49;
          uint64_t v37 = (void (*)(char *, char *, uint64_t))v49[2];
          v37(v24, v12, AssociatedTypeWitness);
          v42(v24, 0LL, 1LL, AssociatedTypeWitness);
          v37(v43, v12, AssociatedTypeWitness);
          type metadata accessor for Array();
          uint64_t v26 = v44;
          Array.append(_:)();
          uint64_t v34 = (void (*)(char *, uint64_t))v36[1];
          uint64_t v9 = v41;
          v34((char *)v41, AssociatedTypeWitness);
        }
      }

      v34(v12, AssociatedTypeWitness);
      dispatch thunk of IteratorProtocol.next()();
      unsigned int v35 = v27(v22, 1LL, AssociatedTypeWitness);
      uint64_t v30 = v45;
      if (v35 == 1) {
        break;
      }
      v45(v12, v22, AssociatedTypeWitness);
    }
  }

  (*(void (**)(char *, uint64_t))(v38 + 8))(v47, v48);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v24, v16);
  uint64_t v50 = v51;
  uint64_t v28 = type metadata accessor for Array();
  MEMORY[0x186E22960](MEMORY[0x189618470], v28);
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v28 - 8) + 32LL))(v39, &v50, v28);
}

uint64_t Publishers.Sequence<>.contains(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Result();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)&v7 - v4;
  *uint64_t v5 = Sequence<>.contains(_:)() & 1;
  swift_storeEnumTagMultiPayload();
  Result.publisher.getter(v2, a1);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t Publishers.Sequence<>.min()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return Publishers.Sequence<>.min()(a1, a2, MEMORY[0x189618180], a3);
}

uint64_t Publishers.Sequence<>.max()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return Publishers.Sequence<>.min()(a1, a2, MEMORY[0x189618178], a3);
}

uint64_t Publishers.Sequence<>.min()@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(uint64_t, uint64_t, uint64_t)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 16);
  swift_getAssociatedTypeWitness();
  uint64_t v9 = type metadata accessor for Optional();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1895F8858](v9);
  uint64_t v12 = (char *)&v14 - v11;
  a3(v8, v7, a2);
  Optional.publisher.getter(v9, a4);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t Publishers.Sequence<>.first()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Optional();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)&v7 - v4;
  Collection.first.getter();
  Optional.publisher.getter(v2, a1);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t Publishers.Sequence<>.output(at:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = type metadata accessor for Optional();
  MEMORY[0x1895F8858](v3);
  uint64_t v5 = (char *)&v15 - v4;
  uint64_t v6 = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  uint64_t v9 = (char *)&v15 - v8;
  dispatch thunk of Collection.indices.getter();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  char v10 = Sequence<>.contains(_:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if ((v10 & 1) != 0)
  {
    uint64_t v11 = (void (*)(_BYTE *, void))dispatch thunk of Collection.subscript.read();
    uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
    (*(void (**)(char *))(v12 + 16))(v5);
    v11(v17, 0LL);
    uint64_t v13 = 0LL;
  }

  else
  {
    uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
    uint64_t v13 = 1LL;
  }

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v5, v13, 1LL, AssociatedTypeWitness);
  return Optional.Publisher.init(_:)((uint64_t)v5, v16);
}

{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  void (*v11)(_BYTE *, void);
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  _BYTE v17[32];
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = type metadata accessor for Optional();
  MEMORY[0x1895F8858](v3);
  uint64_t v5 = (char *)&v15 - v4;
  uint64_t v6 = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  uint64_t v9 = (char *)&v15 - v8;
  dispatch thunk of Collection.indices.getter();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  char v10 = Sequence<>.contains(_:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if ((v10 & 1) != 0)
  {
    uint64_t v11 = (void (*)(_BYTE *, void))dispatch thunk of Collection.subscript.read();
    uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
    (*(void (**)(char *))(v12 + 16))(v5);
    v11(v17, 0LL);
    uint64_t v13 = 0LL;
  }

  else
  {
    uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
    uint64_t v13 = 1LL;
  }

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v5, v13, 1LL, AssociatedTypeWitness);
  return Optional.Publisher.init(_:)((uint64_t)v5, v16);
}

uint64_t Publishers.Sequence<>.count()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Result();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (uint64_t *)((char *)&v7 - v4);
  *uint64_t v5 = dispatch thunk of Collection.count.getter();
  swift_storeEnumTagMultiPayload();
  Result.publisher.getter(v2, a1);
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 8))(v5, v2);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v7;
  uint64_t v2 = type metadata accessor for Result();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (uint64_t *)((char *)&v7 - v4);
  *uint64_t v5 = dispatch thunk of Collection.count.getter();
  swift_storeEnumTagMultiPayload();
  Result.publisher.getter(v2, a1);
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t Publishers.Sequence<>.output(in:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v16[1] = a1;
  uint64_t v17 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v16[0] = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v3 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v3);
  uint64_t v7 = (char *)v16 - v6;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v8 = type metadata accessor for Range();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = (char *)v16 - v10;
  Range.relative<A>(to:)();
  dispatch thunk of Collection.subscript.getter();
  uint64_t v12 = v16[0];
  (*(void (**)(char *, char *, uint64_t))(v16[0] + 16LL))(v5, v7, AssociatedTypeWitness);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v13 = Array.init<A>(_:)();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v18 = v13;
  uint64_t v14 = type metadata accessor for Array();
  MEMORY[0x186E22960](MEMORY[0x189618470], v14);
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v14 - 8) + 32LL))(v17, &v18, v14);
}

uint64_t Publishers.Sequence<>.last()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Optional();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)&v7 - v4;
  BidirectionalCollection.last.getter();
  Optional.publisher.getter(v2, a1);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t Publishers.Sequence<>.last(where:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Optional();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)&v7 - v4;
  BidirectionalCollection.last(where:)();
  Optional.publisher.getter(v2, a1);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t Publishers.Sequence<>.output(in:)@<X0>( char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v78 = a1;
  uint64_t v85 = a4;
  uint64_t v5 = *(void *)(*(void *)(a3 + 8) + 8LL);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v82 = (char *)&v70 - v7;
  uint64_t v8 = swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v9 = MEMORY[0x1895F8858](TupleTypeMetadata2);
  uint64_t v11 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = MEMORY[0x1895F8858](v9);
  uint64_t v14 = (char *)&v70 - v13;
  v76 = *(char **)(v8 - 8);
  uint64_t v15 = MEMORY[0x1895F8858](v12);
  v79 = (char *)&v70 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = MEMORY[0x1895F8858](v15);
  uint64_t v88 = (char *)&v70 - v18;
  uint64_t v19 = MEMORY[0x1895F8858](v17);
  uint64_t v21 = (char *)&v70 - v20;
  MEMORY[0x1895F8858](v19);
  uint64_t v23 = (char *)&v70 - v22;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v25 = type metadata accessor for Range();
  uint64_t v90 = *(void *)(v25 - 8);
  uint64_t v91 = v25;
  uint64_t v26 = MEMORY[0x1895F8858](v25);
  uint64_t v89 = (char *)&v70 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v28 = MEMORY[0x1895F8858](v26);
  uint64_t v30 = (char *)&v70 - v29;
  MEMORY[0x1895F8858](v28);
  uint64_t v80 = (char *)&v70 - v31;
  dispatch thunk of Collection.startIndex.getter();
  uint64_t v81 = v4;
  uint64_t v84 = v6;
  dispatch thunk of Collection.endIndex.getter();
  uint64_t v77 = AssociatedConformanceWitness;
  uint64_t result = dispatch thunk of static Comparable.<= infix(_:_:)();
  if ((result & 1) != 0)
  {
    uint64_t v75 = v5;
    uint64_t v33 = TupleTypeMetadata2;
    uint64_t v34 = &v14[*(int *)(TupleTypeMetadata2 + 48)];
    v86 = v30;
    unsigned int v35 = v76;
    uint64_t v36 = (void (*)(char *, char *, uint64_t))*((void *)v76 + 4);
    v36(v14, v23, v8);
    v36(v34, v21, v8);
    uint64_t v37 = &v11[*(int *)(v33 + 48)];
    uint64_t v38 = (void (*)(char *, char *, uint64_t))*((void *)v35 + 2);
    v38(v11, v14, v8);
    unint64_t v71 = v38;
    v38(v37, v34, v8);
    uint64_t v39 = v89;
    v36(v89, v11, v8);
    uint64_t v40 = (void (*)(char *, uint64_t))*((void *)v35 + 1);
    v40(v37, v8);
    uint64_t v41 = &v11[*(int *)(v33 + 48)];
    v76 = v14;
    v36(v11, v14, v8);
    v36(v41, v34, v8);
    uint64_t v42 = v91;
    v36(&v39[*(int *)(v91 + 36)], v41, v8);
    v73 = v11;
    uint64_t v74 = v40;
    v40(v11, v8);
    uint64_t v43 = v86;
    uint64_t v72 = *(void (**)(char *, char *, uint64_t))(v90 + 32);
    v72(v86, v39, v42);
    uint64_t v44 = v78;
    if ((dispatch thunk of static Comparable.> infix(_:_:)() & 1) != 0)
    {
      uint64_t v45 = v71;
      v71(v88, v43, v8);
    }

    else
    {
      uint64_t v45 = v71;
      uint64_t v46 = &v43[*(int *)(v42 + 36)];
      if ((dispatch thunk of static Comparable.< infix(_:_:)() & 1) != 0)
      {
        uint64_t v47 = v88;
        uint64_t v48 = v46;
      }

      else
      {
        uint64_t v47 = v88;
        uint64_t v48 = v44;
      }

      v45(v47, v48, v8);
      uint64_t v42 = v91;
    }

    uint64_t v49 = v73;
    uint64_t v50 = *(int *)(v42 + 36);
    uint64_t v51 = &v43[v50];
    uint64_t v52 = &v44[v50];
    if ((dispatch thunk of static Comparable.< infix(_:_:)() & 1) != 0)
    {
      uint64_t v53 = v79;
      v45(v79, v51, v8);
      uint64_t v55 = v89;
      uint64_t v54 = v90;
      uint64_t v56 = v76;
    }

    else
    {
      char v57 = dispatch thunk of static Comparable.> infix(_:_:)();
      uint64_t v55 = v89;
      uint64_t v56 = v76;
      uint64_t v53 = v79;
      if ((v57 & 1) != 0)
      {
        uint64_t v58 = v79;
        uint64_t v59 = v43;
      }

      else
      {
        uint64_t v58 = v79;
        uint64_t v59 = v52;
      }

      v45(v58, v59, v8);
      uint64_t v54 = v90;
    }

    uint64_t v60 = TupleTypeMetadata2;
    v61 = &v56[*(int *)(TupleTypeMetadata2 + 48)];
    v36(v56, v88, v8);
    v36(v61, v53, v8);
    uint64_t v62 = &v49[*(int *)(v60 + 48)];
    v45(v49, v56, v8);
    v45(v62, v61, v8);
    v36(v55, v49, v8);
    uint64_t v63 = v74;
    v74(v62, v8);
    uint64_t v64 = &v49[*(int *)(v60 + 48)];
    v36(v49, v56, v8);
    v36(v64, v61, v8);
    uint64_t v65 = v91;
    v36(&v55[*(int *)(v91 + 36)], v64, v8);
    v63(v49, v8);
    uint64_t v66 = v80;
    v72(v80, v55, v65);
    os_unfair_lock_t v67 = *(void (**)(char *, uint64_t))(v54 + 8);
    v67(v86, v65);
    dispatch thunk of Collection.subscript.getter();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    uint64_t v68 = Array.init<A>(_:)();
    v67(v66, v65);
    uint64_t v92 = v68;
    uint64_t v69 = type metadata accessor for Array();
    MEMORY[0x186E22960](MEMORY[0x189618470], v69);
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v69 - 8) + 32LL))(v85, &v92, v69);
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t Publishers.Sequence<>.count()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = dispatch thunk of Collection.count.getter();
  *a1 = result;
  return result;
}

uint64_t Publishers.Sequence<>.prepend(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1895F8858](a1);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v11[1] = v6;
  swift_getAssociatedTypeWitness();
  uint64_t v9 = type metadata accessor for Array();
  MEMORY[0x186E22960](MEMORY[0x189618470], v9);
  static RangeReplaceableCollection.+ infix<A>(_:_:)();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a3, v8, v4);
}

{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static RangeReplaceableCollection.+ infix<A>(_:_:)();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a3, v7, v4);
}

uint64_t Publishers.Sequence<>.prepend<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static RangeReplaceableCollection.+ infix<A>(_:_:)();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a3, v7, v4);
}

uint64_t Publishers.Sequence<>.append(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1895F8858](a1);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v11[1] = v6;
  swift_getAssociatedTypeWitness();
  uint64_t v9 = type metadata accessor for Array();
  MEMORY[0x186E22960](MEMORY[0x189618490], v9);
  static RangeReplaceableCollection.+ infix<A>(_:_:)();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a3, v8, v4);
}

{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static RangeReplaceableCollection.+ infix<A>(_:_:)();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a3, v7, v4);
}

uint64_t Publishers.Sequence<>.append<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static RangeReplaceableCollection.+ infix<A>(_:_:)();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a3, v7, v4);
}

uint64_t static Publishers.Sequence<>.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)() & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.Sequence<A, B>()
{
  return static Publishers.Sequence<>.== infix(_:_:)();
}

uint64_t specialized Publishers.Sequence.Inner.init(downstream:sequence:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v38 = a2;
  uint64_t v44 = a1;
  uint64_t v4 = *(void **)v2;
  uint64_t v5 = *(void *)(*(void *)v2 + 96LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = type metadata accessor for Optional();
  uint64_t v46 = *(void *)(v7 - 8);
  uint64_t v47 = v7;
  uint64_t v8 = MEMORY[0x1895F8858](v7);
  uint64_t v45 = (char *)&v33 - v9;
  uint64_t v10 = v4[13];
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v40 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v42 = v4[18];
  uint64_t v43 = swift_getAssociatedTypeWitness();
  uint64_t v41 = *(void *)(v43 - 8);
  MEMORY[0x1895F8858](v43);
  uint64_t v39 = (char *)&v33 - v13;
  uint64_t v14 = type metadata accessor for Optional();
  uint64_t v36 = *(void *)(v14 - 8);
  uint64_t v37 = v14;
  MEMORY[0x1895F8858](v14);
  uint64_t v16 = (char *)&v33 - v15;
  uint64_t v17 = type metadata accessor for Optional();
  uint64_t v34 = *(void *)(v17 - 8);
  uint64_t v35 = v17;
  MEMORY[0x1895F8858](v17);
  uint64_t v19 = (char *)&v33 - v18;
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v20(v3 + v4[19], 1LL, 1LL, v10);
  uint64_t v21 = v3 + *(void *)(*(void *)v3 + 160LL);
  uint64_t v22 = *(void *)(v5 - 8);
  uint64_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56);
  v33(v21, 1LL, 1LL, v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL))( v3 + *(void *)(*(void *)v3 + 176LL),  1LL,  1LL,  AssociatedTypeWitness);
  *(void *)(v3 + *(void *)(*(void *)v3 + 184LL)) = 0LL;
  *(_BYTE *)(v3 + *(void *)(*(void *)v3 + 192LL)) = 0;
  uint64_t v23 = *(void *)(*(void *)v3 + 200LL);
  uint64_t v24 = (_DWORD *)swift_slowAlloc();
  _DWORD *v24 = 0;
  *(void *)(v3 + v23) = v24;
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v26 = v38;
  v25(v19, v38, v10);
  v20((uint64_t)v19, 0LL, 1LL, v10);
  uint64_t v27 = v3 + *(void *)(*(void *)v3 + 152LL);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v34 + 40))(v27, v19, v35);
  swift_endAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v16, v44, v5);
  v33((uint64_t)v16, 0LL, 1LL, v5);
  uint64_t v28 = v3 + *(void *)(*(void *)v3 + 160LL);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v36 + 40))(v28, v16, v37);
  swift_endAccess();
  v25(v40, v26, v10);
  uint64_t v29 = v39;
  dispatch thunk of Sequence.makeIterator()();
  (*(void (**)(uint64_t, char *, uint64_t))(v41 + 32))(v3 + *(void *)(*(void *)v3 + 168LL), v29, v43);
  swift_beginAccess();
  swift_getAssociatedConformanceWitness();
  uint64_t v30 = v45;
  dispatch thunk of IteratorProtocol.next()();
  swift_endAccess();
  uint64_t v31 = v3 + *(void *)(*(void *)v3 + 176LL);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v46 + 40))(v31, v30, v47);
  swift_endAccess();
  return v3;
}

uint64_t partial apply for thunk for @callee_guaranteed (@in_guaranteed A.Sequence.Element) -> (@out A1)()
{
  return (*(uint64_t (**)(void))(v0 + 56))();
}

uint64_t partial apply for closure #1 in Publishers.Sequence.tryReduce<A>(_:_:)(void *a1)
{
  uint64_t result = Sequence.reduce<A>(_:_:)();
  if (v1) {
    *a1 = v1;
  }
  return result;
}

uint64_t partial apply for closure #1 in Publishers.Sequence.replaceNil<A>(with:)@<X0>( uint64_t a1@<X0>, char *a2@<X8>)
{
  return closure #1 in Publishers.Sequence.replaceNil<A>(with:)(a1, *(void *)(v2 + 56), *(void *)(v2 + 32), a2);
}

uint64_t getEnumTagSinglePayload for Publishers.Sequence(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)(v4 + 64);
  char v8 = 8 * v7;
  if (v7 <= 3)
  {
    unsigned int v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)(a1 + v7);
      if (!v9) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }

    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7)) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }

    if (v10 < 2)
    {
LABEL_18:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0LL;
    }
  }

  int v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7)) {
    goto LABEL_18;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (!(_DWORD)v7) {
    return v5 + v11 + 1;
  }
  return ((uint64_t (*)(void))((char *)&loc_183B885E8 + 4 * byte_183BA6168[(v7 - 1)]))();
}

void storeEnumTagSinglePayload for Publishers.Sequence( _WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8LL);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        unsigned int v11 = 4u;
      }

      else if (v13 >= 0x100)
      {
        unsigned int v11 = 2;
      }

      else
      {
        unsigned int v11 = v13 > 1;
      }
    }

    else
    {
      unsigned int v11 = 1u;
    }
  }

  else
  {
    unsigned int v11 = 0u;
  }

  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        int v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }

        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }

        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }

    else
    {
      bzero(a1, *(void *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X11 }

void type metadata accessor for Publishers.Sequence()
{
}

uint64_t type metadata completion function for Publishers.Sequence.Inner()
{
  uint64_t result = type metadata accessor for Optional();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for Optional();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_getAssociatedTypeWitness();
      if (v3 <= 0x3F)
      {
        swift_getAssociatedTypeWitness();
        uint64_t result = type metadata accessor for Optional();
        if (v4 <= 0x3F) {
          return swift_initClassMetadata2();
        }
      }
    }
  }

  return result;
}

uint64_t outlined destroy of CustomStringConvertible?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CustomStringConvertible?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void Publisher.zip<A>(_:)( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v21 = a5;
  uint64_t v12 = *(void *)(a3 - 8);
  uint64_t v13 = MEMORY[0x1895F8858](a1);
  uint64_t v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1895F8858](v13);
  uint64_t v19 = (char *)&v20 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v6, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a1, a3);
  (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(a6, v19, a2);
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v24 = a4;
  uint64_t v25 = v21;
  type metadata accessor for Publishers.Zip();
}

uint64_t sub_183B88A4C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v2 + *(int *)(a1 + 52), v3, v1);
}

void Publishers.Zip.init(_:_:)(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
}

uint64_t sub_183B88ADC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v1 - 8) + 32LL))( v3 + *(int *)(a1 + 52),  v2,  v1);
}

void type metadata accessor for Publishers.Zip()
{
}

void Publisher.zip<A, B>(_:_:)(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1895F8858](a1);
  MEMORY[0x1895F8858](v1);
  type metadata accessor for Publishers.Zip();
}

void sub_183B88BC8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v17 - 152) = *(void *)(a1 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v19 = (char *)&a9 - v18;
  (*(void (**)(uint64_t, void, uint64_t))(v9 + 16))(v14, *(void *)(v17 - 160), v16);
  (*(void (**)(uint64_t, void, uint64_t))(v10 + 16))(v11, *(void *)(v17 - 168), v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v19, v14, v16);
  *(void *)(v17 - 112) = v16;
  *(void *)(v17 - 104) = v15;
  *(void *)(v17 - 96) = v13;
  *(void *)(v17 - 88) = v12;
  type metadata accessor for Publishers.Zip();
}

uint64_t sub_183B88C48(uint64_t a1)
{
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = v6;
  void v10[3] = v5;
  uint64_t v11 = *(void *)(v9 - 144);
  uint64_t v12 = *(void *)(v9 - 136);
  v10[4] = v12;
  v10[5] = v4;
  v10[6] = v3;
  v10[7] = v11;
  v10[8] = *(void *)(v9 - 128);
  uint64_t v13 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.Zip<A, B>, v7);
  Publisher.map<A>(_:)( (uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Publisher.Output, @in_guaranteed A1.Publisher.Output) -> (@out B1),  (uint64_t)v10,  v7,  v12,  v13,  *(void *)(v9 - 120));
  swift_retain();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 152) + 8LL))(v8, v7);
}

uint64_t sub_183B88D08()
{
  return swift_deallocObject();
}

void Publisher.zip<A, B>(_:_:)( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  v27[1] = a8;
  v27[2] = a6;
  v27[3] = a7;
  v27[0] = a9;
  uint64_t v14 = *(void *)(a5 - 8);
  uint64_t v15 = MEMORY[0x1895F8858](a1);
  uint64_t v17 = (char *)v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x1895F8858](v15);
  uint64_t v22 = (char *)v27 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v20);
  uint64_t v24 = (char *)v27 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v25 + 16))(v24, v26);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v22, a1, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, a2, a5);
  Publishers.Zip3.init(_:_:_:)((uint64_t)v24, a3, v27[0]);
}

  ;
}

void Publishers.Zip3.init(_:_:_:)(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
}

uint64_t sub_183B88EF0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v1 - 8) + 32LL))( v5 + *(int *)(a1 + 72),  v3,  v1);
}

void type metadata accessor for Publishers.Zip3()
{
}

void Publisher.zip<A, B, C>(_:_:_:)(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1895F8858](a1);
  uint64_t v2 = MEMORY[0x1895F8858](v1);
  MEMORY[0x1895F8858](v2);
  type metadata accessor for Publishers.Zip3();
}

void sub_183B89044( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v17 - 176) = *(void *)(a1 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v19 = (char *)&a9 - v18;
  (*(void (**)(uint64_t, void, uint64_t))(v15 + 16))(v11, *(void *)(v17 - 192), v14);
  (*(void (**)(uint64_t, void, uint64_t))(v16 + 16))(v10, *(void *)(v17 - 200), v13);
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v17 - 208) + 16LL))(v9, *(void *)(v17 - 184), v12);
  Publishers.Zip3.init(_:_:_:)(v11, v14, (uint64_t)v19);
}

uint64_t sub_183B890E8()
{
  uint64_t v9 = (void *)swift_allocObject();
  __int128 v9[2] = v4;
  void v9[3] = v3;
  uint64_t v10 = *(void *)(v8 - 168);
  uint64_t v11 = *(void *)(v8 - 160);
  v9[4] = v2;
  v9[5] = v11;
  v9[6] = v6;
  v9[7] = v1;
  v9[8] = v5;
  v9[9] = v10;
  v9[10] = *(void *)(v8 - 152);
  uint64_t v12 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.Zip3<A, B, C>, v7);
  Publisher.map<A>(_:)( (uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Publisher.Output, @in_guaranteed A1.Publisher.Output, @in_guaranteed B1.Publisher.Output) -> (@out C1),  (uint64_t)v9,  v7,  v11,  v12,  *(void *)(v8 - 144));
  swift_retain();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 176) + 8LL))(v0, v7);
}

uint64_t sub_183B89194()
{
  return swift_deallocObject();
}

void Publisher.zip<A, B, C>(_:_:_:)( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __int128 a10, uint64_t a11)
{
  uint64_t v41 = a9;
  uint64_t v42 = a8;
  uint64_t v37 = a2;
  uint64_t v38 = a3;
  __int128 v40 = a10;
  uint64_t v39 = a11;
  uint64_t v15 = *(void *)(a7 - 8);
  uint64_t v35 = a1;
  uint64_t v36 = v15;
  uint64_t v16 = MEMORY[0x1895F8858](a1);
  uint64_t v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x1895F8858](v16);
  uint64_t v23 = (char *)&v34 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = MEMORY[0x1895F8858](v21);
  uint64_t v28 = (char *)&v34 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v26);
  uint64_t v30 = (char *)&v34 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v30, v33, v32);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v28, v35, a5);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v23, v37, a6);
  (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v18, v38, a7);
  Publishers.Zip4.init(_:_:_:_:)((uint64_t)v30, a4, v41);
}

  ;
}

void Publishers.Zip4.init(_:_:_:_:)(uint64_t a1@<X0>, uint64_t a2@<X4>, uint64_t a3@<X8>)
{
}

uint64_t sub_183B893F8(int *a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v1 - 8) + 32LL))(v7 + a1[23], v4, v1);
}

void type metadata accessor for Publishers.Zip4()
{
}

void Publisher.zip<A, B, C, D>(_:_:_:_:)( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  v25[11] = a1;
  v25[18] = a4;
  v25[19] = a5;
  v25[16] = a3;
  v25[14] = a2;
  v25[20] = a6;
  void v25[4] = a12;
  v25[5] = a11;
  v25[6] = a10;
  v25[7] = a9;
  v25[17] = a8;
  v25[13] = *(void *)(a7 - 8);
  uint64_t v12 = MEMORY[0x1895F8858](a1);
  v25[9] = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = MEMORY[0x1895F8858](v12);
  v25[8] = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = MEMORY[0x1895F8858](v14);
  v25[0] = (char *)v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v16);
  v25[21] = v18;
  v25[22] = v19;
  v25[2] = v18;
  v25[1] = v19;
  v25[23] = v20;
  v25[24] = a7;
  v25[25] = v22;
  v25[26] = v21;
  v25[27] = v23;
  v25[28] = v24;
  type metadata accessor for Publishers.Zip4();
}

void sub_183B895E4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v18 - 240) = a1;
  *(void *)(v18 - 200) = *(void *)(a1 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v20 = (char *)&a9 - v19;
  *(void *)(v18 - 296) = (char *)&a9 - v19;
  (*(void (**)(uint64_t, void, uint64_t))(v10 + 16))(v9, *(void *)(v18 - 224), v12);
  (*(void (**)(uint64_t, void, uint64_t))(v11 + 16))(v17, *(void *)(v18 - 232), v16);
  (*(void (**)(void, void, uint64_t))(v14 + 16))(*(void *)(v18 - 256), *(void *)(v18 - 208), v13);
  (*(void (**)(void, void, uint64_t))(*(void *)(v18 - 216) + 16LL))( *(void *)(v18 - 248),  *(void *)(v18 - 192),  v15);
  Publishers.Zip4.init(_:_:_:_:)(v9, *(void *)(v18 - 304), (uint64_t)v20);
}

uint64_t sub_183B896EC()
{
  uint64_t v9 = (void *)swift_allocObject();
  __int128 v9[2] = v0;
  void v9[3] = v2;
  v9[4] = v7;
  v9[5] = v5;
  uint64_t v11 = *(void *)(v8 - 184);
  uint64_t v10 = *(void *)(v8 - 176);
  v9[6] = v11;
  v9[7] = v6;
  v9[8] = v4;
  v9[9] = v3;
  v9[10] = v1;
  v9[11] = v10;
  v9[12] = *(void *)(v8 - 168);
  uint64_t v12 = *(void *)(v8 - 240);
  uint64_t v13 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.Zip4<A, B, C, D>, v12);
  uint64_t v14 = *(void *)(v8 - 296);
  Publisher.map<A>(_:)( (uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Publisher.Output, @in_guaranteed A1.Publisher.Output, @in_guaranteed B1.Publisher.Output, @in_guaranteed C1.Publisher.Output) -> (@out D1),  (uint64_t)v9,  v12,  v11,  v13,  *(void *)(v8 - 160));
  swift_retain();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 200) + 8LL))(v14, v12);
}

uint64_t sub_183B897A8()
{
  return swift_deallocObject();
}

uint64_t Publishers.Zip.a.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 16LL))(a2, v2);
}

uint64_t Publishers.Zip.b.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) - 8LL) + 16LL))( a2,  v2 + *(int *)(a1 + 52));
}

void Publishers.Zip.receive<A>(subscriber:)()
{
}

void sub_183B898CC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t TupleTypeMetadata2, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  uint64_t v25 = specialized AbstractZip.init(downstream:upstreamCount:)(v24, 2uLL);
  swift_retain();
  Publishers._Merged.Side.init(index:merger:)(0LL, v25, &a17);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  a24 = a9;
  type metadata accessor for AbstractZip.Side();
}

void sub_183B89950( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v22 = MEMORY[0x186E22960](&protocol conformance descriptor for AbstractZip<A, B, C>.Side<A1>, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&a14, v20, a1, a10, v22);
  swift_release();
  swift_retain();
  Publishers._Merged.Side.init(index:merger:)(1LL, v19, &a17);
  a14 = a17;
  a15 = a18;
  a16 = a19;
  type metadata accessor for AbstractZip.Side();
}

uint64_t sub_183B899D0(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x186E22960](&protocol conformance descriptor for AbstractZip<A, B, C>.Side<A1>, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&v6, v4, a1, v5, v2);
  swift_release();
  return swift_release();
}

void type metadata accessor for Zip2Inner()
{
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Zip<A, B>()
{
}

uint64_t Publishers.Zip3.b.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) - 8LL) + 16LL))( a2,  v2 + *(int *)(a1 + 68));
}

uint64_t Publishers.Zip3.c.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 32) - 8LL) + 16LL))( a2,  v2 + *(int *)(a1 + 72));
}

void Publishers.Zip3.receive<A>(subscriber:)()
{
}

void sub_183B89B74( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t TupleTypeMetadata3, uint64_t a27)
{
  uint64_t v28 = specialized AbstractZip.init(downstream:upstreamCount:)(v27, 3uLL);
  swift_retain();
  Publishers._Merged.Side.init(index:merger:)(0LL, v28, &a23);
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  a27 = a19;
  type metadata accessor for AbstractZip.Side();
}

void sub_183B89BF8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28)
{
  uint64_t v30 = MEMORY[0x186E22960](&protocol conformance descriptor for AbstractZip<A, B, C>.Side<A1>, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&a20, a11, a1, a12, v30);
  swift_release();
  swift_retain();
  Publishers._Merged.Side.init(index:merger:)(1LL, v28, &a23);
  a20 = a23;
  a21 = a24;
  a22 = a25;
  a28 = a10;
  type metadata accessor for AbstractZip.Side();
}

void sub_183B89C80( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29)
{
  uint64_t v31 = MEMORY[0x186E22960](&protocol conformance descriptor for AbstractZip<A, B, C>.Side<A1>, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&a20, a15, a1, a16, v31);
  swift_release();
  swift_retain();
  Publishers._Merged.Side.init(index:merger:)(2LL, v29, &a23);
  a20 = a23;
  a21 = a24;
  a22 = a25;
  a27 = a19;
  a29 = a13;
  type metadata accessor for AbstractZip.Side();
}

uint64_t sub_183B89D04(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x186E22960](&protocol conformance descriptor for AbstractZip<A, B, C>.Side<A1>, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&v6, v4, a1, v5, v2);
  swift_release();
  return swift_release();
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Zip3<A, B, C>()
{
}

uint64_t Publishers.Zip4.b.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) - 8LL) + 16LL))( a2,  v2 + *(int *)(a1 + 84));
}

uint64_t Publishers.Zip4.c.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 32) - 8LL) + 16LL))( a2,  v2 + *(int *)(a1 + 88));
}

uint64_t Publishers.Zip4.d.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 40) - 8LL) + 16LL))( a2,  v2 + *(int *)(a1 + 92));
}

void Publishers.Zip4.receive<A>(subscriber:)()
{
}

void sub_183B89ED8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26)
{
  uint64_t v32 = specialized AbstractZip.init(downstream:upstreamCount:)(a12, 4uLL);
  swift_retain();
  Publishers._Merged.Side.init(index:merger:)(0LL, v32, &a26);
  *(void *)(v31 - 144) = v26;
  *(void *)(v31 - 136) = v27;
  *(void *)(v31 - 128) = v30;
  *(void *)(v31 - 120) = v28;
  *(void *)(v31 - 144) = swift_getTupleTypeMetadata();
  *(void *)(v31 - 136) = a9;
  *(void *)(v31 - 128) = v29;
  *(void *)(v31 - 120) = v26;
  *(void *)(v31 - 112) = a10;
  type metadata accessor for AbstractZip.Side();
}

void sub_183B89F68( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28)
{
  uint64_t v37 = MEMORY[0x186E22960](&protocol conformance descriptor for AbstractZip<A, B, C>.Side<A1>, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&a23, v28, a1, a13, v37);
  swift_release();
  swift_retain();
  Publishers._Merged.Side.init(index:merger:)(1LL, v30, &a26);
  a23 = a26;
  a24 = a27;
  a25 = a28;
  *(void *)(v35 - 144) = v32;
  *(void *)(v35 - 136) = v34;
  *(void *)(v35 - 128) = v33;
  *(void *)(v35 - 120) = v31;
  *(void *)(v35 - 112) = v29;
  type metadata accessor for AbstractZip.Side();
}

void sub_183B89FF8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28)
{
  uint64_t v35 = MEMORY[0x186E22960](&protocol conformance descriptor for AbstractZip<A, B, C>.Side<A1>, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&a23, a17, a1, a18, v35);
  swift_release();
  swift_retain();
  Publishers._Merged.Side.init(index:merger:)(2LL, v28, &a26);
  a23 = a26;
  a24 = a27;
  a25 = a28;
  *(void *)(v33 - 144) = v30;
  *(void *)(v33 - 136) = v32;
  *(void *)(v33 - 128) = v31;
  *(void *)(v33 - 120) = a14;
  *(void *)(v33 - 112) = v29;
  type metadata accessor for AbstractZip.Side();
}

void sub_183B8A078( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28)
{
  uint64_t v35 = MEMORY[0x186E22960](&protocol conformance descriptor for AbstractZip<A, B, C>.Side<A1>, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&a23, a19, a1, a20, v35);
  swift_release();
  swift_retain();
  Publishers._Merged.Side.init(index:merger:)(3LL, v28, &a26);
  a23 = a26;
  a24 = a27;
  a25 = a28;
  *(void *)(v33 - 144) = v30;
  *(void *)(v33 - 136) = v32;
  *(void *)(v33 - 128) = v31;
  *(void *)(v33 - 120) = a16;
  *(void *)(v33 - 112) = v29;
  type metadata accessor for AbstractZip.Side();
}

uint64_t sub_183B8A0F8(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x186E22960](&protocol conformance descriptor for AbstractZip<A, B, C>.Side<A1>, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&v6, v4, a1, v5, v2);
  swift_release();
  return swift_release();
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Zip4<A, B, C, D>()
{
}

void static Publishers.Zip<>.== infix(_:_:)()
{
}

uint64_t sub_183B8A1B0(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = MEMORY[0x1895F8858](a1);
  uint64_t v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  MEMORY[0x1895F8858](v5);
  uint64_t v9 = &v15[-v8];
  char v10 = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v11 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16);
  v11(v9, v2, a1);
  v11(v7, v1, a1);
  if ((v10 & 1) != 0) {
    char v12 = dispatch thunk of static Equatable.== infix(_:_:)();
  }
  else {
    char v12 = 0;
  }
  uint64_t v13 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v13(v7, a1);
  v13(v9, a1);
  return v12 & 1;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.Zip<A, B>()
{
  static Publishers.Zip<>.== infix(_:_:)();
}

void static Publishers.Zip3<>.== infix(_:_:)()
{
}

uint64_t sub_183B8A308(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = MEMORY[0x1895F8858](a1);
  uint64_t v7 = &v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v8 = MEMORY[0x1895F8858](v5);
  char v10 = &v22[-v9];
  uint64_t v11 = MEMORY[0x1895F8858](v8);
  uint64_t v13 = &v22[-v12];
  MEMORY[0x1895F8858](v11);
  uint64_t v15 = &v22[-v14];
  char v16 = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v17 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16);
  v17(v15, v2, a1);
  v17(v13, v1, a1);
  if ((v16 & 1) != 0) {
    char v18 = dispatch thunk of static Equatable.== infix(_:_:)();
  }
  else {
    char v18 = 0;
  }
  uint64_t v19 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v19(v13, a1);
  v19(v15, a1);
  v17(v10, v2, a1);
  v17(v7, v1, a1);
  if ((v18 & 1) != 0) {
    char v20 = dispatch thunk of static Equatable.== infix(_:_:)();
  }
  else {
    char v20 = 0;
  }
  v19(v7, a1);
  v19(v10, a1);
  return v20 & 1;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.Zip3<A, B, C>()
{
  static Publishers.Zip3<>.== infix(_:_:)();
}

uint64_t sub_183B8A4C8(char a1)
{
  return a1 & 1;
}

void static Publishers.Zip4<>.== infix(_:_:)()
{
}

uint64_t sub_183B8A538(uint64_t a1)
{
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = MEMORY[0x1895F8858](a1);
  *(void *)(v3 - 160) = &v32[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v8 = MEMORY[0x1895F8858](v6);
  *(void *)(v3 - 168) = &v32[-v9];
  uint64_t v10 = MEMORY[0x1895F8858](v8);
  uint64_t v12 = &v32[-v11];
  uint64_t v13 = MEMORY[0x1895F8858](v10);
  uint64_t v15 = &v32[-v14];
  uint64_t v16 = MEMORY[0x1895F8858](v13);
  char v18 = &v32[-v17];
  MEMORY[0x1895F8858](v16);
  char v20 = &v32[-v19];
  char v21 = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v22 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16);
  *(void *)(v3 - 152) = v2;
  v22(v20, v2, a1);
  uint64_t v23 = v1;
  v22(v18, v1, a1);
  if ((v21 & 1) != 0) {
    char v24 = dispatch thunk of static Equatable.== infix(_:_:)();
  }
  else {
    char v24 = 0;
  }
  uint64_t v25 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
  v25(v18, a1);
  v25(v20, a1);
  uint64_t v26 = *(void *)(v3 - 152);
  v22(v15, v26, a1);
  v22(v12, v23, a1);
  if ((v24 & 1) == 0)
  {
    v25(v12, a1);
    v25(v15, a1);
    uint64_t v28 = *(_BYTE **)(v3 - 168);
    v22(v28, v26, a1);
    uint64_t v29 = *(_BYTE **)(v3 - 160);
    v22(v29, v23, a1);
    goto LABEL_8;
  }

  char v27 = dispatch thunk of static Equatable.== infix(_:_:)();
  v25(v12, a1);
  v25(v15, a1);
  uint64_t v28 = *(_BYTE **)(v3 - 168);
  v22(v28, v26, a1);
  uint64_t v29 = *(_BYTE **)(v3 - 160);
  v22(v29, v23, a1);
  if ((v27 & 1) == 0)
  {
LABEL_8:
    char v30 = 0;
    goto LABEL_9;
  }

  char v30 = dispatch thunk of static Equatable.== infix(_:_:)();
LABEL_9:
  v25(v29, a1);
  v25(v28, a1);
  return v30 & 1;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.Zip4<A, B, C, D>()
{
  static Publishers.Zip4<>.== infix(_:_:)();
}

uint64_t sub_183B8A7F0(char a1)
{
  return a1 & 1;
}

void AbstractZip.Side.customMirror.getter()
{
  uint64_t v0 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1895F8858](v0);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1895F8858](v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = xmmword_183B9D5B0;
  *(void *)(v2 + 32) = 0xD000000000000012LL;
  *(void *)(v2 + 40) = 0x8000000183BA8110LL;
  *(void *)(v2 + 72) = &type metadata for CombineIdentifier;
  type metadata accessor for AbstractZip();
}

uint64_t sub_183B8A914()
{
  uint64_t v3 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56LL))(v2, 1LL, 1LL, v3);
  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)(v1);
  swift_retain();
  return Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
}

void AbstractZip.Side.playgroundDescription.getter(void *a1@<X8>)
{
  a1[3] = MEMORY[0x189617FA8];
  *a1 = 7367002LL;
  a1[1] = 0xE300000000000000LL;
}

void AbstractZip.Side.receive(subscription:)(void *a1)
{
}

uint64_t AbstractZip.Side.receive(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *v2;
  uint64_t v11 = *(void *)(a2 + 40);
  uint64_t v5 = v11;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v10);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(boxed_opaque_existential_1, a1, v5);
  AbstractZip.receive(_:index:)((uint64_t)v10, v4);
  uint64_t v8 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  return v8;
}

void AbstractZip.Side.receive(completion:)(uint64_t a1)
{
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AbstractZip<A, B, C>.Side<A1>()
{
  return 7367002LL;
}

void AbstractZip.customMirror.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1895F8858](v2);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1895F8858](v3);
  uint64_t v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = v0;
  uint64_t v6 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(v5, 1LL, 1LL, v6);
  __int128 v7 = *(_OWORD *)(v1 + 96);
  v8[0] = *(_OWORD *)(v1 + 80);
  v8[1] = v7;
  type metadata accessor for AbstractZip();
}

uint64_t sub_183B8AB54()
{
  return Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
}

uint64_t *AbstractZip.deinit()
{
  uint64_t v1 = *v0;
  MEMORY[0x186E22A2C](*(uint64_t *)((char *)v0 + *(void *)(*v0 + 176)), -1LL, -1LL);
  MEMORY[0x186E22A2C](*(uint64_t *)((char *)v0 + *(void *)(*v0 + 184)), -1LL, -1LL);
  (*(void (**)(uint64_t, void))(*(void *)(*(void *)(v1 + 96) - 8LL) + 8LL))( (uint64_t)v0 + *(void *)(*v0 + 112),  *(void *)(v1 + 96));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = (uint64_t)v0 + *(void *)(*v0 + 208);
  uint64_t v3 = *(void *)(v1 + 88);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  type metadata accessor for Subscribers.Completion(255LL, v3, AssociatedConformanceWitness, v5);
  uint64_t v6 = type metadata accessor for Optional();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v2, v6);
  return v0;
}

uint64_t AbstractZip.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void AbstractZip.receive(subscription:index:)(void *a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = (void *)*v2;
  uint64_t v7 = *(void *)(*v2 + 104);
  uint64_t v8 = *(void *)(*v2 + 88);
  uint64_t v33 = *(void *)(*v2 + 96);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v11 = type metadata accessor for Subscribers.Completion(255LL, v8, AssociatedConformanceWitness, v10);
  uint64_t v12 = type metadata accessor for Optional();
  uint64_t v13 = MEMORY[0x1895F8858](v12);
  uint64_t v14 = *(void **)(v11 - 8);
  MEMORY[0x1895F8858](v13);
  char v18 = (char *)v29 - v17;
  if (*(uint64_t *)((char *)v3 + v6[21]) <= (uint64_t)a2)
  {
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  uint64_t v30 = v7;
  uint64_t v31 = v16;
  uint64_t v32 = v15;
  uint64_t v7 = v6[22];
  os_unfair_lock_lock(*(os_unfair_lock_t *)((char *)v3 + v7));
  uint64_t v19 = *v3;
  if ((*((_BYTE *)v3 + *(void *)(*v3 + 136)) & 1) != 0)
  {
LABEL_6:
    os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v3 + v7));
    uint64_t v22 = a1[3];
    uint64_t v23 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v22);
    (*(void (**)(uint64_t))(*(void *)(v23 + 8) + 8LL))(v22);
    return;
  }

  __int128 v29[2] = v12;
  uint64_t v12 = (uint64_t)v3 + *(void *)(v19 + 128);
  swift_beginAccess();
  if ((a2 & 0x8000000000000000LL) != 0) {
    goto LABEL_19;
  }
  uint64_t v20 = *(void *)v12;
  if (*(void *)(*(void *)v12 + 16LL) <= a2)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    uint64_t v14 = specialized _ArrayBuffer._consumeAndCreateNew()(v14);
    *(void *)uint64_t v12 = v14;
    goto LABEL_9;
  }

  v29[1] = v18;
  outlined init with copy of Subscription?(v20 + 40 * a2 + 32, (uint64_t)v34);
  uint64_t v21 = v35;
  outlined destroy of Subscription?((uint64_t)v34);
  if (v21) {
    goto LABEL_6;
  }
  v29[0] = v14;
  outlined init with copy of Subscription((uint64_t)a1, (uint64_t)v34);
  swift_beginAccess();
  uint64_t v14 = *(void **)v12;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)uint64_t v12 = v14;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    goto LABEL_21;
  }
LABEL_9:
  if (v14[2] <= a2)
  {
    __break(1u);
  }

  else
  {
    outlined assign with take of Subscription?((uint64_t)v34, (uint64_t)&v14[5 * a2 + 4]);
    uint64_t v25 = *(void *)v12;
    swift_endAccess();
    uint64_t v26 = *(void *)(v25 + 16);
    if (v26)
    {
      uint64_t v27 = v25 + 32;
      swift_bridgeObjectRetain();
      while (1)
      {
        outlined init with copy of Subscription?(v27, (uint64_t)v34);
        uint64_t v28 = v35;
        outlined destroy of Subscription?((uint64_t)v34);
        if (!v28) {
          break;
        }
        v27 += 40LL;
        if (!--v26)
        {
          swift_bridgeObjectRelease();
          goto LABEL_16;
        }
      }

      swift_bridgeObjectRelease();
      LOBYTE(v26) = 1;
    }

void AbstractZip.receive(_:index:)(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(char **)v2;
  uint64_t v7 = *((void *)v6 + 13);
  unint64_t v8 = *((void *)v6 + 11);
  uint64_t v59 = *((void *)v6 + 12);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v11 = type metadata accessor for Subscribers.Completion(0LL, v8, AssociatedConformanceWitness, v10);
  uint64_t v12 = MEMORY[0x1895F8858](v11);
  unint64_t v13 = *((void *)v6 + 10);
  uint64_t v14 = *(uint64_t **)(v13 - 8);
  uint64_t v15 = MEMORY[0x1895F8858](v12);
  uint64_t v19 = (char *)&v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v58 = v7;
  uint64_t v55 = v17;
  uint64_t v56 = v16;
  uint64_t v57 = v15;
  uint64_t v7 = *((void *)v6 + 22);
  os_unfair_lock_lock(*(os_unfair_lock_t *)&v3[v7]);
  uint64_t v20 = *(void *)v3;
  if ((v3[*(void *)(*(void *)v3 + 136LL)] & 1) != 0
    || (v3[*(void *)(v20 + 144)] & 1) != 0
    || (uint64_t v6 = *(char **)(v20 + 152), (v6[(void)v3] & 1) != 0))
  {
LABEL_5:
    os_unfair_lock_unlock(*(os_unfair_lock_t *)&v3[v7]);
    return;
  }

  outlined init with copy of Any(a1, (uint64_t)&v68);
  uint64_t v21 = *(void *)(*(void *)v3 + 120LL);
  a1 = *(void *)&v3[v21];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v53 = v21;
  *(void *)&v3[v21] = a1;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    goto LABEL_70;
  }
LABEL_8:
  uint64_t v49 = v6;
  uint64_t v52 = v19;
  if (*(void *)(a1 + 16) > (unint64_t)a2)
  {
    uint64_t v19 = (char *)(a1 + 32);
    a1 = *(void *)(a1 + 32 + 8LL * (void)a2);
    char v23 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&v19[8 * (void)a2] = a1;
    uint64_t v54 = a2;
    if ((v23 & 1) == 0) {
      goto LABEL_73;
    }
    goto LABEL_10;
  }

  while (1)
  {
    __break(1u);
LABEL_73:
    a1 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0LL,  *(void *)(a1 + 16) + 1LL,  1,  (char *)a1);
    *(void *)&v19[8 * (void)a2] = a1;
LABEL_10:
    a2 = *(char **)(a1 + 16);
    unint64_t v24 = *(void *)(a1 + 24);
    if ((unint64_t)a2 >= v24 >> 1)
    {
      a1 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( (char *)(v24 > 1),  (int64_t)(a2 + 1),  1,  (char *)a1);
      *(void *)&v19[8 * (void)v54] = a1;
    }

    uint64_t v25 = v52;
    *(void *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = a2 + 1;
    outlined init with take of Any(&v68, (_OWORD *)(a1 + 32LL * (void)a2 + 32));
    uint64_t v6 = *(char **)&v3[v53];
    uint64_t v26 = *((void *)v6 + 2);
    unint64_t v51 = v13;
    uint64_t v50 = v14;
    if (!v26) {
      break;
    }
    uint64_t v19 = (char *)*((void *)v6 + 4);
    int64_t v27 = *((void *)v19 + 2);
    if (!v27) {
      goto LABEL_5;
    }
    uint64_t v62 = (uint64_t *)(v26 - 1);
    if (v26 == 1)
    {
LABEL_19:
      unint64_t v48 = v8;
      *(void *)&__int128 v61 = *(void *)(*(void *)v3 + 160LL);
      swift_bridgeObjectRetain();
      uint64_t v14 = 0LL;
      unint64_t v8 = 0LL;
      a2 = (char *)MEMORY[0x18961AFE8];
      uint64_t v60 = MEMORY[0x18961AFC0] + 8LL;
      a1 = MEMORY[0x18961AFE8];
      while (1)
      {
        outlined init with copy of Any((uint64_t)(v19 + 32), (uint64_t)&v68);
        swift_bridgeObjectRetain();
        uint64_t v30 = (char *)swift_isUniquelyReferenced_nonNull_native();
        if (!(_DWORD)v30 || (unint64_t)(v27 - 1) > *((void *)v19 + 3) >> 1) {
          uint64_t v19 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( v30,  v27,  1,  v19);
        }
        swift_arrayDestroy();
        uint64_t v31 = *((void *)v19 + 2);
        memmove(v19 + 32, v19 + 64, 32 * v31 - 32);
        *((void *)v19 + 2) = v31 - 1;
        outlined init with copy of Any((uint64_t)&v68, (uint64_t)&v65);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          a2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0LL,  *((void *)a2 + 2) + 1LL,  1,  a2);
        }
        unint64_t v33 = *((void *)a2 + 2);
        unint64_t v32 = *((void *)a2 + 3);
        if (v33 >= v32 >> 1) {
          a2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( (char *)(v32 > 1),  v33 + 1,  1,  a2);
        }
        *((void *)a2 + 2) = v33 + 1;
        outlined init with take of Any(&v65, &a2[32 * v33 + 32]);
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          a1 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0LL,  *(void *)(a1 + 16) + 1LL,  1,  (void *)a1);
        }
        unint64_t v13 = *(void *)(a1 + 16);
        unint64_t v34 = *(void *)(a1 + 24);
        if (v13 >= v34 >> 1) {
          a1 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( (void *)(v34 > 1),  v13 + 1,  1,  (void *)a1);
        }
        *(void *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v13 + 1;
        *(void *)(a1 + 8 * v13 + 32) = v19;
        uint64_t v35 = *(void *)&v3[v61];
        if (*((_BYTE *)v14 + v35 + 32) == 1)
        {
          unint64_t v13 = *((void *)v19 + 2);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v68);
          swift_bridgeObjectRelease();
          if (!v13) {
            unint64_t v8 = 1LL;
          }
        }

        else
        {
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v68);
          swift_bridgeObjectRelease();
        }

        if (v62 == v14)
        {
          swift_bridgeObjectRelease();
          uint64_t v25 = v52;
          goto LABEL_41;
        }

        uint64_t v19 = *(char **)&v6[8 * (void)v14 + 40];
        int64_t v27 = *((void *)v19 + 2);
        uint64_t v14 = (uint64_t *)((char *)v14 + 1);
        if (!v27) {
          goto LABEL_66;
        }
      }

      __break(1u);
LABEL_66:
      __break(1u);
LABEL_67:
      __break(1u);
      goto LABEL_68;
    }

    uint64_t v28 = 5LL;
    while (1)
    {
      uint64_t v29 = v28 - 3;
      if (__OFADD__(v28 - 4, 1LL)) {
        break;
      }
      if (!*(void *)(*(void *)&v6[8 * v28] + 16LL)) {
        goto LABEL_5;
      }
      ++v28;
      if (v29 == v26) {
        goto LABEL_19;
      }
    }

LABEL_69:
    __break(1u);
LABEL_70:
    a1 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew()((void *)a1);
    *(void *)&v3[v53] = a1;
LABEL_71:
    __break(1u);
  }

  unint64_t v48 = v8;
  LOBYTE((*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v6, v1 + v2[13], v8) = 0;
  a1 = MEMORY[0x18961AFE8];
  a2 = (char *)MEMORY[0x18961AFE8];
LABEL_41:
  *(void *)&v3[v53] = a1;
  swift_bridgeObjectRelease();
  uint64_t v36 = *(void *)(*(void *)v3 + 192LL);
  v3[v36] = 1;
  os_unfair_lock_unlock(*(os_unfair_lock_t *)&v3[v7]);
  (*(void (**)(char *))(*(void *)v3 + 504LL))(a2);
  swift_bridgeObjectRelease();
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v37 = (*(uint64_t (**)(char *, uint64_t))(v58 + 48))(v25, v59);
  os_unfair_recursive_lock_unlock();
  os_unfair_lock_lock(*(os_unfair_lock_t *)&v3[v7]);
  v3[v36] = 0;
  if ((v8 & 1) != 0)
  {
    v49[(void)v3] = 1;
    uint64_t v38 = v55;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56LL))(v55, 1LL, 1LL);
    AbstractZip.lockedSendCompletion(completion:)(v38);
    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v38, v57);
    ((void (*)(char *, unint64_t))v50[1])(v25, v51);
    return;
  }

  uint64_t v39 = *(void *)(*(void *)v3 + 200LL);
  unint64_t v40 = v51;
  uint64_t v41 = v50;
  if (v37 == 0x8000000000000000LL) {
    goto LABEL_48;
  }
  uint64_t v42 = *(void *)&v3[v39];
  if (v42 == 0x8000000000000000LL) {
    goto LABEL_48;
  }
  if (((v42 | v37) & 0x8000000000000000LL) == 0)
  {
    BOOL v43 = __OFADD__(v37, v42);
    a1 = v37 + v42;
    if (!v43)
    {
      if (a1 < 0) {
        goto LABEL_75;
      }
      *(void *)&v3[v39] = 0LL;
      if (!a1)
      {
        os_unfair_lock_unlock(*(os_unfair_lock_t *)&v3[v7]);
        ((void (*)(char *, unint64_t))v41[1])(v52, v40);
        return;
      }

      goto LABEL_49;
    }

LABEL_48:
    *(void *)&v3[v39] = 0LL;
    a1 = 0x8000000000000000LL;
LABEL_49:
    uint64_t v44 = &v3[*(void *)(*(void *)v3 + 128LL)];
    swift_beginAccess();
    uint64_t v45 = *(void *)v44;
    uint64_t v6 = *(char **)&v3[v7];
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock((os_unfair_lock_t)v6);
    unint64_t v8 = 0LL;
    unint64_t v13 = *(void *)(v45 + 16);
    uint64_t v62 = (uint64_t *)v45;
    uint64_t v60 = v45 + 32;
    uint64_t v3 = (char *)&v63 + 8;
    uint64_t v59 = (uint64_t)&v65 + 8;
    a2 = (char *)&v68 + 8;
    __int128 v61 = xmmword_183B9D5C0;
    uint64_t v19 = (char *)&demangling cache variable for type metadata for (offset: Int, element: Subscription?)?;
    uint64_t v14 = &demangling cache variable for type metadata for Subscription?;
    if (!v13)
    {
LABEL_52:
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      unint64_t v8 = v13;
      __int128 v67 = v61;
      goto LABEL_55;
    }

    while (v8 < v62[2])
    {
      outlined init with copy of Subscription?(v60 + 40 * v8, (uint64_t)&v63 + 8);
      *(void *)&__int128 v65 = v8;
      outlined init with take of Subscription?( (uint64_t)&v63 + 8,  v59,  &demangling cache variable for type metadata for Subscription?);
      ++v8;
LABEL_55:
      outlined init with take of Subscription?( (uint64_t)&v65,  (uint64_t)&v68,  &demangling cache variable for type metadata for (offset: Int, element: Subscription?)?);
      if (v69 == 1)
      {
        swift_bridgeObjectRelease();
        ((void (*)(char *, unint64_t))v50[1])(v52, v51);
        return;
      }

      uint64_t v6 = (char *)v68;
      outlined init with take of Subscription?( (uint64_t)&v68 + 8,  (uint64_t)&v63,  &demangling cache variable for type metadata for Subscription?);
      if (v64)
      {
        outlined init with take of Subscription(&v63, (uint64_t)&v65);
        if (v6 != v54)
        {
          uint64_t v46 = *((void *)&v66 + 1);
          uint64_t v7 = v67;
          uint64_t v6 = (char *)__swift_project_boxed_opaque_existential_1(&v65, *((uint64_t *)&v66 + 1));
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(a1, v46, v7);
        }

        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v65);
        if (v8 == v13) {
          goto LABEL_52;
        }
      }

      else
      {
        outlined destroy of Subscription?((uint64_t)&v63);
        if (v8 == v13) {
          goto LABEL_52;
        }
      }
    }

LABEL_68:
    __break(1u);
    goto LABEL_69;
  }

  __break(1u);
LABEL_75:
  __break(1u);
}

void AbstractZip.convert(values:)()
{
}

void AbstractZip.receive(completion:index:)(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = *(void *)(*v2 + 88);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v9 = type metadata accessor for Subscribers.Completion(0LL, v6, AssociatedConformanceWitness, v8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1895F8858](v9);
  uint64_t v12 = (char *)&v21 - v11;
  uint64_t v13 = *(void *)(v5 + 176);
  os_unfair_lock_lock(*(os_unfair_lock_t *)((char *)v2 + v13));
  uint64_t v14 = *v2;
  if ((*((_BYTE *)v2 + *(void *)(*v2 + 136)) & 1) != 0) {
    goto LABEL_11;
  }
  uint64_t v15 = *(void *)(v14 + 144);
  if ((*((_BYTE *)v2 + v15) & 1) != 0) {
    goto LABEL_11;
  }
  uint64_t v16 = *(void *)(v14 + 152);
  if ((*((_BYTE *)v2 + v16) & 1) != 0) {
    goto LABEL_11;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48LL))(v12, 1LL, v6) != 1)
  {
    *((_BYTE *)v2 + v15) = 1;
    AbstractZip.lockedSendCompletion(completion:)(a1);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    return;
  }

  uint64_t v17 = *(void *)(*v2 + 160);
  uint64_t v18 = *(char **)((char *)v2 + v17);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(uint64_t *)((char *)v2 + v17) = (uint64_t)v18;
  if ((isUniquelyReferenced_nonNull_native & 1) != 0)
  {
    if ((a2 & 0x8000000000000000LL) == 0) {
      goto LABEL_8;
    }
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  uint64_t v18 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v18);
  *(uint64_t *)((char *)v2 + v17) = (uint64_t)v18;
  if ((a2 & 0x8000000000000000LL) != 0) {
    goto LABEL_15;
  }
LABEL_8:
  if (*((void *)v18 + 2) <= a2)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  v18[a2 + 32] = 1;
  uint64_t v20 = *(uint64_t *)((char *)v2 + *(void *)(*v2 + 120));
  if (*(void *)(v20 + 16) <= a2)
  {
LABEL_17:
    __break(1u);
    return;
  }

  if (*(void *)(*(void *)(v20 + 8 * a2 + 32) + 16LL))
  {
LABEL_11:
    os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v2 + v13));
    return;
  }

  *((_BYTE *)v2 + v__swift_destroy_boxed_opaque_existential_1(v0 + 16) = 1;
  AbstractZip.lockedSendCompletion(completion:)(a1);
}

void AbstractZip.lockedSendCompletion(completion:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v6 = *(void *)(*v1 + 96);
  uint64_t v5 = *(void *)(*v1 + 104);
  uint64_t v7 = *(void *)(*v1 + 88);
  uint64_t v46 = v5;
  uint64_t v45 = v6;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v10 = type metadata accessor for Subscribers.Completion(255LL, v7, AssociatedConformanceWitness, v9);
  uint64_t v11 = type metadata accessor for Optional();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1895F8858](v11);
  uint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v13);
  uint64_t v17 = (char *)&v37 - v16;
  uint64_t v43 = *(uint64_t *)((char *)v2 + *(void *)(v4 + 168));
  *(uint64_t *)((char *)v2 + *(void *)(*v2 + 120)) = (uint64_t)specialized Array.init(repeating:count:)( MEMORY[0x18961AFE8],  v43);
  swift_bridgeObjectRelease();
  uint64_t v18 = (uint64_t *)((char *)v2 + *(void *)(*v2 + 128));
  swift_beginAccess();
  uint64_t v42 = v18;
  uint64_t v19 = *v18;
  uint64_t v44 = *(void *)(*v2 + 192);
  *((_BYTE *)v2 + v44) = 1;
  uint64_t v20 = *(void *)(v10 - 8);
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  uint64_t v48 = a1;
  v21(v17, a1, v10);
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  uint64_t v49 = v10;
  uint64_t v41 = v22;
  v22(v17, 0LL, 1LL, v10);
  char v23 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  uint64_t v47 = v17;
  v23(v15, v17, v11);
  uint64_t v24 = (uint64_t)v2 + *(void *)(*v2 + 208);
  swift_beginAccess();
  uint64_t v25 = *(void (**)(uint64_t, char *, uint64_t))(v12 + 40);
  swift_bridgeObjectRetain();
  uint64_t v40 = v24;
  uint64_t v50 = v11;
  uint64_t v39 = v25;
  v25(v24, v15, v11);
  swift_endAccess();
  uint64_t v38 = *(void *)(*v2 + 176);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v2 + v38));
  unint64_t v26 = 0LL;
  unint64_t v27 = *(void *)(v19 + 16);
  uint64_t v28 = *(void *)(*v2 + 160);
  uint64_t v54 = v19;
  uint64_t v52 = v19 + 32;
  uint64_t v51 = (uint64_t)v61 + 8;
  __int128 v53 = xmmword_183B9D5C0;
  if (v27) {
    goto LABEL_5;
  }
LABEL_4:
  memset(v61, 0, 32);
  unint64_t v26 = v27;
  __int128 v61[2] = v53;
  while (1)
  {
    outlined init with take of Subscription?( (uint64_t)v61,  (uint64_t)v62,  &demangling cache variable for type metadata for (offset: Int, element: Subscription?)?);
    if (v63 == 1)
    {
      swift_bridgeObjectRelease();
      os_unfair_recursive_lock_lock_with_options();
      (*(void (**)(uint64_t, uint64_t))(v46 + 56))(v48, v45);
      os_unfair_recursive_lock_unlock();
      uint64_t v33 = v38;
      os_unfair_lock_lock(*(os_unfair_lock_t *)((char *)v2 + v38));
      uint64_t v63 = 0LL;
      memset(v62, 0, sizeof(v62));
      uint64_t v34 = specialized Array.init(repeating:count:)((uint64_t)v62, v43);
      uint64_t *v42 = v34;
      swift_bridgeObjectRelease();
      uint64_t v35 = v47;
      v41(v47, 1LL, 1LL, v49);
      uint64_t v36 = v40;
      swift_beginAccess();
      v39(v36, v35, v50);
      swift_endAccess();
      *((_BYTE *)v2 + v44) = 0;
      *(uint64_t *)((char *)v2 + *(void *)(*v2 + 200)) = 0LL;
      os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v2 + v33));
      return;
    }

    unint64_t v29 = v62[0];
    outlined init with take of Subscription?( (uint64_t)&v62[1],  (uint64_t)v61,  &demangling cache variable for type metadata for Subscription?);
    if ((v29 & 0x8000000000000000LL) != 0) {
      break;
    }
    uint64_t v30 = *(uint64_t *)((char *)v2 + v28);
    if (v29 >= *(void *)(v30 + 16)) {
      goto LABEL_17;
    }
    if (*(_BYTE *)(v30 + v29 + 32) == 1)
    {
      outlined destroy of Subscription?((uint64_t)v61);
      if (v26 == v27) {
        goto LABEL_4;
      }
    }

    else
    {
      outlined init with copy of Subscription?((uint64_t)v61, (uint64_t)&v55);
      if (!v56)
      {
        outlined destroy of Subscription?((uint64_t)v61);
        swift_bridgeObjectRelease();
        outlined destroy of Subscription?((uint64_t)&v55);
        return;
      }

      outlined init with take of Subscription(&v55, (uint64_t)&v57);
      uint64_t v32 = v59;
      uint64_t v31 = v60;
      __swift_project_boxed_opaque_existential_1(&v57, v59);
      (*(void (**)(uint64_t))(*(void *)(v31 + 8) + 8LL))(v32);
      outlined destroy of Subscription?((uint64_t)v61);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v57);
      if (v26 == v27) {
        goto LABEL_4;
      }
    }

void AbstractZip.cancel()()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 176LL);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v0 + v1));
  uint64_t v2 = *(void *)(*(void *)v0 + 136LL);
  if ((*(_BYTE *)(v0 + v2) & 1) != 0)
  {
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v0 + v1));
  }

  else
  {
    uint64_t v3 = (uint64_t *)(v0 + *(void *)(*(void *)v0 + 128LL));
    swift_beginAccess();
    uint64_t v4 = *v3;
    *(_BYTE *)(v0 + (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v6, v2) = 1;
    uint64_t v12 = 0LL;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    uint64_t v5 = *(void *)(v0 + *(void *)(*(void *)v0 + 168LL));
    swift_bridgeObjectRetain();
    *uint64_t v3 = specialized Array.init(repeating:count:)((uint64_t)&v10, v5);
    swift_bridgeObjectRelease();
    *(void *)(v0 + *(void *)(*(void *)v0 + 120LL)) = specialized Array.init(repeating:count:)( MEMORY[0x18961AFE8],  v5);
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v0 + v1));
    uint64_t v6 = *(void *)(v4 + 16);
    if (v6)
    {
      uint64_t v7 = v4 + 32;
      do
      {
        outlined init with copy of Subscription?(v7, (uint64_t)&v10);
        uint64_t v9 = *((void *)&v11 + 1);
        if (*((void *)&v11 + 1))
        {
          uint64_t v8 = v12;
          __swift_project_boxed_opaque_existential_1(&v10, *((uint64_t *)&v11 + 1));
          (*(void (**)(uint64_t))(*(void *)(v8 + 8) + 8LL))(v9);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
        }

        else
        {
          outlined destroy of Subscription?((uint64_t)&v10);
        }

        v7 += 40LL;
        --v6;
      }

      while (v6);
    }

    swift_bridgeObjectRelease();
  }

void AbstractZip.resolvePendingDemandAndUnlock()()
{
  uint64_t v1 = (uint64_t *)(v0 + *(void *)(*(void *)v0 + 128LL));
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*(void *)v0 + 200LL);
  uint64_t v4 = *(void *)(v0 + v3);
  *(void *)(v0 + (*(void (**)(uint64_t, void, uint64_t))(v1 + 16))(v0, *(void *)(v9 - 144) + *(int *)(v6 + 52), v3) = 0LL;
  uint64_t v5 = *(os_unfair_lock_s **)(v0 + *(void *)(*(void *)v0 + 176LL));
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v5);
  if (v4 == 0x8000000000000000LL) {
    goto LABEL_4;
  }
  if ((v4 & 0x8000000000000000LL) == 0)
  {
    if (!v4)
    {
LABEL_10:
      swift_bridgeObjectRelease();
      return;
    }

void AbstractZip.request(_:)(uint64_t a1)
{
  if (a1 != 0x8000000000000000LL)
  {
    if (a1 < 0)
    {
      __break(1u);
    }

    else if (a1)
    {
      goto LABEL_4;
    }

    __break(1u);
    goto LABEL_26;
  }

void protocol witness for Subscription.request(_:) in conformance AbstractZip<A, B, C>(uint64_t a1)
{
}

void protocol witness for CustomReflectable.customMirror.getter in conformance AbstractZip<A, B, C>()
{
}

  ;
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance AbstractZip<A, B, C>( void *a1@<X8>)
{
}

void protocol witness for Cancellable.cancel() in conformance AbstractZip<A, B, C>()
{
}

uint64_t Zip2Inner.convert(values:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  if (v3)
  {
    outlined init with copy of Any(a3 + 32, (uint64_t)v7);
    uint64_t result = swift_dynamicCast();
    if (v3 != 1)
    {
      outlined init with copy of Any(a3 + 64, (uint64_t)&v6);
      return swift_dynamicCast();
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t vtable thunk for AbstractZip.convert(values:) dispatching to Zip2Inner.convert(values:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a2 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  return Zip2Inner.convert(values:)(a2, v4, a1);
}

uint64_t Zip3Inner.convert(values:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a4 + 16);
  if (!v4)
  {
    __break(1u);
    goto LABEL_6;
  }

  outlined init with copy of Any(a4 + 32, (uint64_t)v9);
  uint64_t result = swift_dynamicCast();
  if (v4 == 1)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  outlined init with copy of Any(a4 + 64, (uint64_t)v8);
  uint64_t result = swift_dynamicCast();
  if (v4 >= 3)
  {
    outlined init with copy of Any(a4 + 96, (uint64_t)&v7);
    return swift_dynamicCast();
  }

uint64_t vtable thunk for AbstractZip.convert(values:) dispatching to Zip3Inner.convert(values:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  return Zip3Inner.convert(values:)( a2,  a2 + *(int *)(TupleTypeMetadata3 + 48),  a2 + *(int *)(TupleTypeMetadata3 + 64),  a1);
}

uint64_t Zip4Inner.convert(values:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5 = *(void *)(a5 + 16);
  if (!v5)
  {
    __break(1u);
    goto LABEL_7;
  }

  outlined init with copy of Any(a5 + 32, (uint64_t)v11);
  uint64_t result = swift_dynamicCast();
  if (v5 == 1)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }

  outlined init with copy of Any(a5 + 64, (uint64_t)v10);
  uint64_t result = swift_dynamicCast();
  if (v5 < 3)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  outlined init with copy of Any(a5 + 96, (uint64_t)v9);
  uint64_t result = swift_dynamicCast();
  if (v5 != 3)
  {
    outlined init with copy of Any(a5 + 128, (uint64_t)&v8);
    return swift_dynamicCast();
  }

uint64_t vtable thunk for AbstractZip.convert(values:) dispatching to Zip4Inner.convert(values:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  TupleTypeMetadata = (int *)swift_getTupleTypeMetadata();
  return Zip4Inner.convert(values:)( a2,  a2 + TupleTypeMetadata[12],  a2 + TupleTypeMetadata[16],  a2 + TupleTypeMetadata[20],  a1);
}

uint64_t specialized AbstractZip.init(downstream:upstreamCount:)(uint64_t a1, size_t a2)
{
  uint64_t v5 = *v2;
  *((_BYTE *)v2 + *(void *)(*v2 + 136)) = 0;
  *((_BYTE *)v2 + *(void *)(*v2 + 144)) = 0;
  *((_BYTE *)v2 + *(void *)(*v2 + 152)) = 0;
  uint64_t v6 = *(void *)(*v2 + 176);
  uint64_t v7 = (_DWORD *)swift_slowAlloc();
  *uint64_t v7 = 0;
  *(uint64_t *)((char *)v2 + (*(void (**)(uint64_t, void, uint64_t))(v4 + 16))(v7, *(void *)(v9 - 120), v6) = (uint64_t)v7;
  uint64_t v8 = *(void *)(*v2 + 184);
  uint64_t v9 = (void *)swift_slowAlloc();
  *uint64_t v9 = 0LL;
  *(uint64_t *)((char *)v2 + (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v6, v1 + v2[13], v8) = (uint64_t)v9;
  *((_BYTE *)v2 + *(void *)(*v2 + 192)) = 0;
  *(uint64_t *)((char *)v2 + *(void *)(*v2 + 200)) = 0LL;
  uint64_t v10 = (uint64_t)v2 + *(void *)(*v2 + 208);
  uint64_t v11 = *(void *)(v5 + 88);
  uint64_t v12 = *(void *)(v5 + 96);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v15 = type metadata accessor for Subscribers.Completion(0LL, v11, AssociatedConformanceWitness, v14);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v10, 1LL, 1LL, v15);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16LL))( (uint64_t)v2 + *(void *)(*v2 + 112),  a1,  v12);
  *(uint64_t *)((char *)v2 + *(void *)(*v2 + 168)) = a2;
  *(uint64_t *)((char *)v2 + *(void *)(*v2 + 120)) = (uint64_t)specialized Array.init(repeating:count:)( MEMORY[0x18961AFE8],  a2);
  uint64_t v19 = 0LL;
  memset(v18, 0, sizeof(v18));
  uint64_t result = specialized Array.init(repeating:count:)((uint64_t)v18, a2);
  *(uint64_t *)((char *)v2 + *(void *)(*v2 + 128)) = result;
  if ((a2 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
  }

  else
  {
    if (a2)
    {
      uint64_t v17 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(void *)(v17 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = a2;
      bzero((void *)(v17 + 32), a2);
    }

    else
    {
      uint64_t v17 = MEMORY[0x18961AFE8];
    }

    *(uint64_t *)((char *)v2 + *(void *)(*v2 + 160)) = v17;
    return (uint64_t)v2;
  }

  return result;
}

void type metadata accessor for AbstractZip.Side()
{
}

void type metadata accessor for Zip3Inner()
{
}

void type metadata accessor for Zip4Inner()
{
}

uint64_t getEnumTagSinglePayload for Publishers.Zip(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8LL);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= v5) {
    unsigned int v8 = *(_DWORD *)(v4 + 84);
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = *(void *)(v4 + 64) + v9;
  unsigned int v11 = a2 - v8;
  if (a2 <= v8) {
    goto LABEL_23;
  }
  uint64_t v12 = (v10 & ~v9) + *(void *)(v6 + 64);
  char v13 = 8 * v12;
  if (v12 <= 3)
  {
    unsigned int v15 = ((v11 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v15))
    {
      int v14 = *(_DWORD *)(a1 + v12);
      if (!v14) {
        goto LABEL_23;
      }
      goto LABEL_14;
    }

    if (v15 > 0xFF)
    {
      int v14 = *(unsigned __int16 *)(a1 + v12);
      if (!*(_WORD *)(a1 + v12)) {
        goto LABEL_23;
      }
      goto LABEL_14;
    }

    if (v15 < 2)
    {
LABEL_23:
      if (v8)
      {
        if (v5 >= v7) {
          return (*(uint64_t (**)(void))(v4 + 48))();
        }
        else {
          return (*(uint64_t (**)(uint64_t))(v6 + 48))((v10 + a1) & ~v9);
        }
      }

      return 0LL;
    }
  }

  int v14 = *(unsigned __int8 *)(a1 + v12);
  if (!*(_BYTE *)(a1 + v12)) {
    goto LABEL_23;
  }
LABEL_14:
  int v16 = (v14 - 1) << v13;
  if (!(_DWORD)v12) {
    return v8 + v16 + 1;
  }
  else {
    int v17 = 4;
  }
  return ((uint64_t (*)(void))((char *)&loc_183B8CC68 + 4 * byte_183BA62E0[v17 - 1]))();
}

void storeEnumTagSinglePayload for Publishers.Zip(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 16) - 8LL);
  uint64_t v6 = *(void *)(*(void *)(a4 + 24) - 8LL);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84)) {
    unsigned int v7 = *(_DWORD *)(v5 + 84);
  }
  else {
    unsigned int v7 = *(_DWORD *)(v6 + 84);
  }
  if (a3 > v7)
  {
    if (v8 <= 3)
    {
      unsigned int v11 = ((a3 - v7 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v11))
      {
        unsigned int v9 = 4u;
      }

      else if (v11 >= 0x100)
      {
        unsigned int v9 = 2;
      }

      else
      {
        unsigned int v9 = v11 > 1;
      }
    }

    else
    {
      unsigned int v9 = 1u;
    }
  }

  else
  {
    unsigned int v9 = 0u;
  }

  if (v7 < a2)
  {
    unsigned int v10 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        int v12 = v10 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v12;
          *((_BYTE *)a1 + 2) = BYTE2(v12);
        }

        else if ((_DWORD)v8 == 2)
        {
          *a1 = v12;
        }

        else
        {
          *(_BYTE *)a1 = v12;
        }
      }
    }

    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v10;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X16 }

uint64_t getEnumTagSinglePayload for Publishers.Zip3(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v4 = *(void *)(a3[2] - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(a3[3] - 8LL);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= v5) {
    unsigned int v8 = *(_DWORD *)(v4 + 84);
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = a3[4];
  uint64_t v10 = *(void *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) > v8) {
    unsigned int v8 = *(_DWORD *)(v10 + 84);
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v11 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v12 = *(void *)(v4 + 64) + v11;
  uint64_t v13 = *(void *)(v6 + 64);
  uint64_t v14 = *(unsigned __int8 *)(v10 + 80);
  unsigned int v15 = a2 - v8;
  if (a2 <= v8) {
    goto LABEL_25;
  }
  uint64_t v16 = ((v13 + v14 + (v12 & ~v11)) & ~v14) + *(void *)(v10 + 64);
  char v17 = 8 * v16;
  if (v16 <= 3)
  {
    unsigned int v19 = ((v15 + ~(-1 << v17)) >> v17) + 1;
    if (HIWORD(v19))
    {
      int v18 = *(_DWORD *)(a1 + v16);
      if (!v18) {
        goto LABEL_25;
      }
      goto LABEL_16;
    }

    if (v19 > 0xFF)
    {
      int v18 = *(unsigned __int16 *)(a1 + v16);
      if (!*(_WORD *)(a1 + v16)) {
        goto LABEL_25;
      }
      goto LABEL_16;
    }

    if (v19 < 2)
    {
LABEL_25:
      if (v8)
      {
        if (v5 == v8) {
          return (*(uint64_t (**)(void))(v4 + 48))();
        }
        uint64_t v22 = (v12 + a1) & ~v11;
        if (v7 == v8) {
          return (*(uint64_t (**)(uint64_t))(v6 + 48))(v22);
        }
        else {
          return (*(uint64_t (**)(uint64_t, void, uint64_t))(v10 + 48))( (v22 + v13 + v14) & ~v14,  *(unsigned int *)(v10 + 84),  v9);
        }
      }

      return 0LL;
    }
  }

  int v18 = *(unsigned __int8 *)(a1 + v16);
  if (!*(_BYTE *)(a1 + v16)) {
    goto LABEL_25;
  }
LABEL_16:
  int v20 = (v18 - 1) << v17;
  if ((_DWORD)v16)
  {
    else {
      int v21 = 4;
    }
    __asm { BR              X11 }
  }

  return v8 + v20 + 1;
}

void storeEnumTagSinglePayload for Publishers.Zip3(_WORD *a1, unsigned int a2, unsigned int a3, void *a4)
{
  uint64_t v5 = *(void *)(a4[2] - 8LL);
  uint64_t v6 = *(void *)(a4[3] - 8LL);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84)) {
    unsigned int v7 = *(_DWORD *)(v5 + 84);
  }
  else {
    unsigned int v7 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v8 = *(void *)(a4[4] - 8LL);
  if (*(_DWORD *)(v8 + 84) > v7) {
    unsigned int v7 = *(_DWORD *)(v8 + 84);
  }
  size_t v9 = ((*(void *)(v6 + 64)
       + *(unsigned __int8 *)(v8 + 80)
  if (a3 > v7)
  {
    if (v9 <= 3)
    {
      unsigned int v12 = ((a3 - v7 + ~(-1 << (8 * v9))) >> (8 * v9)) + 1;
      if (HIWORD(v12))
      {
        unsigned int v10 = 4u;
      }

      else if (v12 >= 0x100)
      {
        unsigned int v10 = 2;
      }

      else
      {
        unsigned int v10 = v12 > 1;
      }
    }

    else
    {
      unsigned int v10 = 1u;
    }
  }

  else
  {
    unsigned int v10 = 0u;
  }

  if (v7 < a2)
  {
    unsigned int v11 = ~v7 + a2;
    if (v9 < 4)
    {
      if ((_DWORD)v9)
      {
        int v13 = v11 & ~(-1 << (8 * v9));
        bzero(a1, v9);
        if ((_DWORD)v9 == 3)
        {
          *a1 = v13;
          *((_BYTE *)a1 + 2) = BYTE2(v13);
        }

        else if ((_DWORD)v9 == 2)
        {
          *a1 = v13;
        }

        else
        {
          *(_BYTE *)a1 = v13;
        }
      }
    }

    else
    {
      bzero(a1, v9);
      *(_DWORD *)a1 = v11;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X21 }

uint64_t getEnumTagSinglePayload for Publishers.Zip4(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v6 = a3[2];
  uint64_t v5 = a3[3];
  uint64_t v7 = *(void *)(v6 - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  uint64_t v9 = *(void *)(v5 - 8);
  unsigned int v10 = *(_DWORD *)(v9 + 84);
  if (v10 <= v8) {
    unsigned int v11 = *(_DWORD *)(v7 + 84);
  }
  else {
    unsigned int v11 = *(_DWORD *)(v9 + 84);
  }
  uint64_t v12 = a3[4];
  uint64_t v13 = a3[5];
  uint64_t v14 = *(void *)(v12 - 8);
  uint64_t v15 = *(unsigned int *)(v14 + 84);
  uint64_t v16 = *(void *)(v13 - 8);
  uint64_t v17 = *(unsigned int *)(v16 + 84);
  if (!a2) {
    return 0LL;
  }
  uint64_t v18 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v19 = *(void *)(v7 + 64) + v18;
  uint64_t v20 = *(void *)(v9 + 64);
  uint64_t v21 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v22 = *(void *)(v14 + 64);
  uint64_t v23 = *(unsigned __int8 *)(v16 + 80);
  int v24 = a2 - v11;
  if (a2 <= v11) {
    goto LABEL_27;
  }
  uint64_t v25 = ((v22 + v23 + ((v20 + v21 + (v19 & ~v18)) & ~v21)) & ~v23) + *(void *)(v16 + 64);
  char v26 = 8 * v25;
  if (v25 <= 3)
  {
    unsigned int v28 = ((v24 + ~(-1 << v26)) >> v26) + 1;
    if (HIWORD(v28))
    {
      int v27 = *(_DWORD *)(a1 + v25);
      if (!v27) {
        goto LABEL_27;
      }
      goto LABEL_18;
    }

    if (v28 > 0xFF)
    {
      int v27 = *(unsigned __int16 *)(a1 + v25);
      if (!*(_WORD *)(a1 + v25)) {
        goto LABEL_27;
      }
      goto LABEL_18;
    }

    if (v28 < 2)
    {
LABEL_27:
      if (v11)
      {
        if (v8 == v11) {
          return (*(uint64_t (**)(uint64_t, void, uint64_t))(v7 + 48))(a1, *(unsigned int *)(v7 + 84), v6);
        }
        uint64_t v31 = (v19 + a1) & ~v18;
        if (v10 == v11) {
          return (*(uint64_t (**)(uint64_t, void, uint64_t))(v9 + 48))(v31, *(unsigned int *)(v9 + 84), v5);
        }
        uint64_t v32 = (v31 + v20 + v21) & ~v21;
        if ((_DWORD)v15 == v11) {
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v32, v15, v12);
        }
        else {
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))((v32 + v22 + v23) & ~v23, v17, v13);
        }
      }

      return 0LL;
    }
  }

  int v27 = *(unsigned __int8 *)(a1 + v25);
  if (!*(_BYTE *)(a1 + v25)) {
    goto LABEL_27;
  }
LABEL_18:
  int v29 = (v27 - 1) << v26;
  if ((_DWORD)v25)
  {
    else {
      int v30 = 4;
    }
    __asm { BR              X11 }
  }

  return v11 + v29 + 1;
}

void storeEnumTagSinglePayload for Publishers.Zip4(_WORD *a1, unsigned int a2, unsigned int a3, void *a4)
{
  uint64_t v5 = *(void *)(a4[2] - 8LL);
  uint64_t v6 = *(void *)(a4[3] - 8LL);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84)) {
    unsigned int v7 = *(_DWORD *)(v5 + 84);
  }
  else {
    unsigned int v7 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v8 = *(void *)(a4[4] - 8LL);
  if (*(_DWORD *)(v8 + 84) <= v7) {
    unsigned int v9 = v7;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v8 + 84);
  }
  uint64_t v10 = *(void *)(a4[5] - 8LL);
  if (*(_DWORD *)(v10 + 84) > v9) {
    unsigned int v9 = *(_DWORD *)(v10 + 84);
  }
  size_t v11 = ((*(void *)(v8 + 64)
        + *(unsigned __int8 *)(v10 + 80)
        + ((*(void *)(v6 + 64)
          + *(unsigned __int8 *)(v8 + 80)
  if (a3 > v9)
  {
    if (v11 <= 3)
    {
      unsigned int v14 = ((a3 - v9 + ~(-1 << (8 * v11))) >> (8 * v11)) + 1;
      if (HIWORD(v14))
      {
        unsigned int v12 = 4u;
      }

      else
      {
        unsigned int v12 = v14 > 1;
        if (v14 >= 0x100) {
          unsigned int v12 = 2;
        }
      }
    }

    else
    {
      unsigned int v12 = 1u;
    }
  }

  else
  {
    unsigned int v12 = 0u;
  }

  if (v9 < a2)
  {
    unsigned int v13 = ~v9 + a2;
    if (v11 < 4)
    {
      if ((_DWORD)v11)
      {
        int v15 = v13 & ~(-1 << (8 * v11));
        bzero(a1, v11);
        if ((_DWORD)v11 == 3)
        {
          *a1 = v15;
          *((_BYTE *)a1 + 2) = BYTE2(v15);
        }

        else if ((_DWORD)v11 == 2)
        {
          *a1 = v15;
        }

        else
        {
          *(_BYTE *)a1 = v15;
        }
      }
    }

    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v13;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X27 }

uint64_t type metadata completion function for AbstractZip(uint64_t a1)
{
  uint64_t v2 = swift_checkMetadataState();
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(a1 + 88);
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    type metadata accessor for Subscribers.Completion(255LL, v4, AssociatedConformanceWitness, v6);
    uint64_t v2 = type metadata accessor for Optional();
    if (v7 <= 0x3F) {
      return swift_initClassMetadata2();
    }
  }

  return v2;
}

void type metadata accessor for AbstractZip()
{
}

uint64_t type metadata completion function for Zip2Inner()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata completion function for Zip3Inner()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata completion function for Zip4Inner()
{
  return swift_initClassMetadata2();
}

uint64_t Publisher.output<A>(in:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v9 = *(void *)(a2 - 8);
  MEMORY[0x1895F8858](a1);
  size_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __int128 v15 = xmmword_183B9EED0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<Int>);
  lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>();
  uint64_t result = dispatch thunk of RangeExpression.relative<A>(to:)();
  uint64_t v13 = v16;
  if (v16 < 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v14 = v17;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v5, a2);
    return Publishers.Output.init(upstream:range:)((uint64_t)v11, v13, v14, a2, a3, a4);
  }

  return result;
}

unint64_t Publisher.output(at:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t result = MEMORY[0x1895F8858](a1);
  unsigned int v12 = (char *)&v13 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (result > 0x7FFFFFFFFFFFFFFDLL)
  {
    __break(1u);
  }

  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v4, a2);
    return Publishers.Output.init(upstream:range:)((uint64_t)v12, a1, a1 + 1, a2, a3, a4);
  }

  return result;
}

uint64_t Publishers.Output.init(upstream:range:)@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  if ((a3 | a2) < 0)
  {
    __break(1u);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32LL))(a6, result, a4);
    unint64_t result = type metadata accessor for Publishers.Output(0LL, a4, a5, v11);
    unsigned int v12 = (void *)(a6 + *(int *)(result + 36));
    void *v12 = a2;
    v12[1] = a3;
  }

  return result;
}

uint64_t type metadata accessor for Publishers.Output(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Output);
}

uint64_t Publishers.Output.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 16LL))(a2, v2);
}

uint64_t Publishers.Output.range.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 36));
}

void Publishers.Output.receive<A>(subscriber:)()
{
}

uint64_t sub_183B8DC18(uint64_t a1)
{
  unint64_t v7 = (uint64_t *)(v1 + *(int *)(v2 + 36));
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];
  swift_allocObject();
  uint64_t v12 = specialized Publishers.Output.Inner.init(downstream:range:)(v3, v8, v9);
  uint64_t v10 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.Output<A>.Inner<A1>, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&v12, v4, a1, v5, v10);
  return swift_release();
}

void type metadata accessor for Publishers.Output.Inner()
{
}

void Publishers.Output.Inner.playgroundDescription.getter(void *a1@<X8>)
{
  a1[3] = MEMORY[0x189617FA8];
  *a1 = 0x74757074754FLL;
  a1[1] = 0xE600000000000000LL;
}

uint64_t *Publishers.Output.Inner.deinit()
{
  uint64_t v1 = *v0;
  MEMORY[0x186E22A2C](*(uint64_t *)((char *)v0 + *(void *)(*v0 + 144)), -1LL, -1LL);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 88) - 8LL) + 8LL))((uint64_t)v0 + *(void *)(*v0 + 112));
  outlined destroy of SubscriptionStatus((uint64_t)v0 + *(void *)(*v0 + 120));
  return v0;
}

uint64_t Publishers.Output.Inner.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void Publishers.Output.Inner.request(_:)(uint64_t a1)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + *(void *)(*(void *)v1 + 144LL));
  os_unfair_lock_lock(v3);
  uint64_t v4 = v1 + *(void *)(*(void *)v1 + 120LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v4, (uint64_t)v7);
  if (v8)
  {
    outlined destroy of SubscriptionStatus((uint64_t)v7);
    os_unfair_lock_unlock(v3);
  }

  else
  {
    outlined init with take of Subscription(v7, (uint64_t)v9);
    os_unfair_lock_unlock(v3);
    uint64_t v5 = v10;
    uint64_t v6 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24))(a1, v5, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }

uint64_t Publishers.Output.Inner.receive(subscription:)(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(*v1 + 144));
  os_unfair_lock_lock(v4);
  uint64_t v5 = (uint64_t)v1 + *(void *)(*v1 + 120);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v5, (uint64_t)&v13);
  if (v16 == 2
    && (int8x16_t v6 = vorrq_s8(v14, v15),
        !(*(void *)&vorr_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)) | (unint64_t)v13)))
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v13);
    outlined init with copy of Subscription((uint64_t)a1, (uint64_t)&v13);
    char v16 = 0;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v13, v5);
    swift_endAccess();
    os_unfair_lock_unlock(v4);
    v15.i64[0] = v3;
    v15.i64[1] = (uint64_t)&protocol witness table for Publishers.Output<A>.Inner<A1>;
    uint64_t v13 = v1;
    uint64_t v10 = *(void *)(v3 + 104);
    uint64_t v11 = *(void (**)(uint64_t **, uint64_t, uint64_t))(v10 + 40);
    uint64_t v12 = *(void *)(v3 + 88);
    swift_retain();
    v11(&v13, v12, v10);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  }

  else
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v13);
    os_unfair_lock_unlock(v4);
    uint64_t v7 = a1[3];
    uint64_t v8 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v7);
    return (*(uint64_t (**)(uint64_t))(*(void *)(v8 + 8) + 8LL))(v7);
  }

uint64_t Publishers.Output.Inner.receive(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void **)v1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v8 = type metadata accessor for Subscribers.Completion(0LL, AssociatedTypeWitness, AssociatedConformanceWitness, v7);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = (char *)&v24 - v10;
  uint64_t v12 = v4[16];
  uint64_t v13 = *(void *)(v1 + v12);
  BOOL v14 = v13 < 1;
  uint64_t v15 = v13 - 1;
  if (v14)
  {
    uint64_t v17 = v4[17];
    uint64_t v18 = *(void *)(v1 + v17);
    if (v18 < 1)
    {
      uint64_t v16 = 0LL;
      if (v18) {
        return v16;
      }
    }

    else
    {
      *(void *)(v1 + v17) = v18 - 1;
      uint64_t v16 = (*(uint64_t (**)(uint64_t, void))(v4[13] + 48LL))(a1, v4[11]);
      if (*(void *)(v1 + v17)) {
        return v16;
      }
    }

    uint64_t v19 = *(os_unfair_lock_s **)(v1 + *(void *)(*(void *)v1 + 144LL));
    os_unfair_lock_lock(*(os_unfair_lock_t *)(v2 + *(void *)(*(void *)v2 + 144LL)));
    uint64_t v20 = v2 + *(void *)(*(void *)v2 + 120LL);
    swift_beginAccess();
    outlined init with copy of SubscriptionStatus(v20, (uint64_t)&v25);
    if (v28)
    {
      outlined destroy of SubscriptionStatus((uint64_t)&v25);
      os_unfair_lock_unlock(v19);
    }

    else
    {
      outlined init with take of Subscription((__int128 *)&v25, (uint64_t)v29);
      uint64_t v25 = 1LL;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      char v28 = 2;
      swift_beginAccess();
      outlined assign with take of SubscriptionStatus((uint64_t)&v25, v20);
      swift_endAccess();
      os_unfair_lock_unlock(v19);
      uint64_t v22 = v30;
      uint64_t v21 = v31;
      __swift_project_boxed_opaque_existential_1(v29, v30);
      (*(void (**)(uint64_t))(*(void *)(v21 + 8) + 8LL))(v22);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL))( v11,  1LL,  1LL,  AssociatedTypeWitness);
      (*(void (**)(char *, void))(v4[13] + 56LL))(v11, v4[11]);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    }
  }

  else
  {
    *(void *)(v1 + v12) = v15;
    return 1LL;
  }

  return v16;
}

void Publishers.Output.Inner.receive(completion:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(*v1 + 144));
  os_unfair_lock_lock(v4);
  uint64_t v5 = (uint64_t)v1 + *(void *)(*v1 + 120);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v5, (uint64_t)&v7);
  int v6 = v10;
  outlined destroy of SubscriptionStatus((uint64_t)&v7);
  if (v6)
  {
    os_unfair_lock_unlock(v4);
  }

  else
  {
    uint64_t v7 = 1LL;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    unsigned __int8 v10 = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v7, v5);
    swift_endAccess();
    os_unfair_lock_unlock(v4);
    (*(void (**)(uint64_t, void))(*(void *)(v3 + 104) + 56LL))(a1, *(void *)(v3 + 88));
  }

void Publishers.Output.Inner.cancel()()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + *(void *)(*(void *)v0 + 144LL));
  os_unfair_lock_lock(v1);
  uint64_t v2 = v0 + *(void *)(*(void *)v0 + 120LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v2, (uint64_t)&v5);
  if (v8)
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v5);
    os_unfair_lock_unlock(v1);
  }

  else
  {
    outlined init with take of Subscription((__int128 *)&v5, (uint64_t)v9);
    uint64_t v5 = 1LL;
    __int128 v6 = 0u;
    __int128 v7 = 0u;
    char v8 = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v5, v2);
    swift_endAccess();
    os_unfair_lock_unlock(v1);
    uint64_t v3 = v10;
    uint64_t v4 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    (*(void (**)(uint64_t))(*(void *)(v4 + 8) + 8LL))(v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.Output<A>.Inner<A1>( void *a1)
{
  return Publishers.Output.Inner.receive(subscription:)(a1);
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance Publishers.Output<A>.Inner<A1>( uint64_t a1)
{
  return Publishers.Output.Inner.receive(_:)(a1);
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.Output<A>.Inner<A1>( uint64_t a1)
{
}

void protocol witness for Subscription.request(_:) in conformance Publishers.Output<A>.Inner<A1>(uint64_t a1)
{
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Output<A>.Inner<A1>()
{
  return 0x74757074754FLL;
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Output<A>.Inner<A1>( void *a1@<X8>)
{
}

void protocol witness for Cancellable.cancel() in conformance Publishers.Output<A>.Inner<A1>()
{
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Output<A>()
{
}

BOOL static Publishers.Output<>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = type metadata accessor for Publishers.Output(0LL, a3, a4, a4);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1895F8858](v6);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v8);
  uint64_t v12 = (char *)&v22 - v11;
  char v13 = dispatch thunk of static Equatable.== infix(_:_:)();
  BOOL v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v14(v12, a1, v6);
  v14(v10, a2, v6);
  BOOL v19 = (v13 & 1) != 0
  uint64_t v20 = *(void (**)(char *, uint64_t))(v7 + 8);
  v20(v10, v6);
  v20(v12, v6);
  return v19;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.Output<A>( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static Publishers.Output<>.== infix(_:_:)(a1, a2, *(void *)(a3 + 16), *(void *)(a3 + 24));
}

uint64_t specialized Publishers.Output.Inner.init(downstream:range:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = (uint64_t)v3 + *(void *)(*v3 + 120);
  *(_OWORD *)uint64_t v8 = 0u;
  *(_OWORD *)(v8 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0u;
  *(void *)(v8 + 32) = 0LL;
  *(_BYTE *)(v8 + 40) = 2;
  uint64_t v9 = *(void *)(*v3 + 144);
  uint64_t v10 = (_DWORD *)swift_slowAlloc();
  _DWORD *v10 = 0;
  *(uint64_t *)((char *)v3 + v9) = (uint64_t)v10;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v7 + 88) - 8LL) + 16LL))( (uint64_t)v3 + *(void *)(*v3 + 112),  a1);
  *(uint64_t *)((char *)v3 + *(void *)(*v3 + 128)) = a2;
  if (__OFSUB__(a3, a2))
  {
    __break(1u);
  }

  else
  {
    *(uint64_t *)((char *)v3 + *(void *)(*v3 + 136)) = a3 - a2;
    return (uint64_t)v3;
  }

  return result;
}

uint64_t type metadata completion function for Publishers.Output()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.Output(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 16 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }

  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    *(_OWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8LL) = *(_OWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8LL);
  }

  return v4;
}

uint64_t initializeWithCopy for Publishers.Output(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v5 + 16))();
  *(_OWORD *)((*(void *)(v5 + 64) + 7LL + a1) & 0xFFFFFFFFFFFFF8LL) = *(_OWORD *)((*(void *)(v5 + 64) + 7LL + a2) & 0xFFFFFFFFFFFFF8LL);
  return a1;
}

uint64_t assignWithCopy for Publishers.Output(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v5 + 24))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8LL);
  *int v7 = *v8;
  v7[1] = v8[1];
  return a1;
}

uint64_t assignWithTake for Publishers.Output(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v5 + 40))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8LL);
  *int v7 = *v8;
  v7[1] = v8[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.Output(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (v5 >= a2)
  {
    if (v5) {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
    return 0LL;
  }

  if (((((*(void *)(v4 + 64) + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + 16) & 0xFFFFFFF8) != 0) {
    unsigned int v6 = 2;
  }
  else {
    unsigned int v6 = a2 - v5 + 1;
  }
  if (v6 >= 0x10000) {
    unsigned int v7 = 4;
  }
  else {
    unsigned int v7 = 2;
  }
  if (v6 < 0x100) {
    unsigned int v7 = 1;
  }
  if (v6 >= 2) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0LL;
  }
  return ((uint64_t (*)(void))((char *)&loc_183B8E98C + 4 * byte_183BA6750[v8]))();
}

void storeEnumTagSinglePayload for Publishers.Output( unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8LL);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 >= a3)
  {
    int v11 = 0u;
    if (a2 <= v7) {
      goto LABEL_14;
    }
  }

  else
  {
    unsigned int v8 = a3 - v7;
    if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v9 = v8 + 1;
    }
    else {
      unsigned int v9 = 2;
    }
    if (v9 >= 0x10000) {
      int v10 = 4;
    }
    else {
      int v10 = 2;
    }
    if (v9 < 0x100) {
      int v10 = 1;
    }
    if (v9 >= 2) {
      int v11 = v10;
    }
    else {
      int v11 = 0;
    }
    if (a2 <= v7) {
LABEL_14:
    }
      __asm { BR              X11 }
  }

  if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    unsigned int v12 = ~v7 + a2;
    bzero(a1, ((*(void *)(v6 + 64) + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + 16);
    *a1 = v12;
  }

  __asm { BR              X10 }

void sub_183B8EACC()
{
  *(_BYTE *)(v0 + v1) = v2;
}

void sub_183B8EAD4(uint64_t a1, int a2)
{
  *(_DWORD *)(v2 + (*(void (**)(uint64_t, void, uint64_t))(v1 + 16))(v0, *(void *)(v9 - 144) + *(int *)(v6 + 52), v3) = 0;
  if (a2) {
    JUMPOUT(0x183B8EADCLL);
  }
}

void sub_183B8EAF8()
{
  *(_WORD *)(v0 + v1) = v2;
}

void sub_183B8EB00()
{
  *(_DWORD *)(v0 + v1) = v2;
}

uint64_t sub_183B8EB08(uint64_t a1, int a2)
{
  *(_WORD *)(v4 + (*(void (**)(uint64_t, void, uint64_t))(v1 + 16))(v9, *(void *)(v10 - 128), v5) = 0;
  if (!a2) {
    JUMPOUT(0x183B8EB10LL);
  }
  return (*(uint64_t (**)(uint64_t))(v3 + 56))(v4);
}

uint64_t type metadata completion function for Publishers.Output.Inner()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t Publisher.catch<A>(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  return Publisher.catch<A>(_:)( a1,  a2,  a3,  a4,  a5,  a6,  (uint64_t (*)(void, void *))type metadata accessor for Publishers.Catch,  a7);
}

void Publishers.Catch.init(upstream:handler:)( uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
}

void type metadata accessor for Publishers.Catch()
{
}

uint64_t Publisher.tryCatch<A>(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  return Publisher.catch<A>(_:)( a1,  a2,  a3,  a4,  a5,  a6,  (uint64_t (*)(void, void *))type metadata accessor for Publishers.TryCatch,  a7);
}

uint64_t Publisher.catch<A>(_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t (*a7)(void, void *)@<X6>, uint64_t a8@<X8>)
{
  uint64_t v22 = a7;
  uint64_t v16 = *(void *)(a3 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v18 = (char *)&v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v16 + 16))(v18, v8);
  (*(void (**)(uint64_t, char *, uint64_t))(v16 + 32))(a8, v18, a3);
  v23[0] = a3;
  v23[1] = a4;
  v23[2] = a5;
  v23[3] = a6;
  BOOL v19 = (void *)(a8 + *(int *)(v22(0LL, v23) + 52));
  *BOOL v19 = a1;
  v19[1] = a2;
  return swift_retain();
}

void Publishers.TryCatch.init(upstream:handler:)( uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
}

void Publishers.Catch.init(upstream:handler:)( uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, void (*a6)(void, void *)@<X7>, uint64_t a7@<X8>)
{
  v12[0] = a2;
  v12[1] = a3;
  __int128 v12[2] = a4;
  v12[3] = a5;
  a6(0LL, v12);
  JUMPOUT(0x183B8ED40LL);
}

void type metadata accessor for Publishers.TryCatch()
{
}

uint64_t Publishers.Catch.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 16LL))(a2, v2);
}

void Publishers.Catch.receive<A>(subscriber:)(uint64_t a1)
{
}

void sub_183B8EE0C()
{
}

void sub_183B8EE64(uint64_t a1)
{
  *(void *)(v6 - 136) = a1;
  *(void *)(v6 - 128) = v2;
  *(void *)(v6 - 120) = v1;
  *(void *)(v6 - 112) = v5;
  *(void *)(v6 - 104) = v3;
  *(void *)(v6 - 96) = v4;
  *(void *)(v6 - 88) = *(void *)(v6 - 144);
  type metadata accessor for Publishers.Catch.Inner.UncaughtS();
}

uint64_t sub_183B8EE88(uint64_t a1)
{
  uint64_t v5 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.Catch<A, B>.Inner<A1>.UncaughtS, a1);
  Publisher.subscribe<A>(_:)(v3 - 136, v1, a1, v2, v5);
  return swift_release();
}

void type metadata accessor for Publishers.Catch.Inner()
{
}

void Publishers.Catch.Inner.__allocating_init(downstream:handler:)()
{
}

  ;
}

void type metadata accessor for Publishers.Catch.Inner.UncaughtS()
{
}

void Publishers.Catch.Inner.playgroundDescription.getter(void *a1@<X8>)
{
  a1[3] = MEMORY[0x189617FA8];
  *a1 = 0x6863746143LL;
  a1[1] = 0xE500000000000000LL;
}

void Publishers.Catch.Inner.init(downstream:handler:)()
{
  uint64_t v1 = (_DWORD *)swift_slowAlloc();
  *uint64_t v1 = 0;
  v0[2] = v1;
  v0[3] = 0LL;
  uint64_t v2 = (char *)v0 + *(void *)(*v0 + 144LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL))( v2,  1LL,  1LL,  AssociatedTypeWitness);
  type metadata accessor for Publishers.Catch.Inner.State();
}

uint64_t sub_183B8F020()
{
  uint64_t v5 = (void *)(v1 + *(void *)(*(void *)v1 + 160LL));
  *uint64_t v5 = v2;
  v5[1] = v0;
  return v1;
}

uint64_t Publishers.Catch.Inner.__deallocating_deinit()
{
  return Publishers.Catch.Inner.__deallocating_deinit((uint64_t (*)(void, _OWORD *))type metadata accessor for Publishers.Catch.Inner.State);
}

void Publishers.Catch.Inner.UncaughtS.receive(subscription:)(uint64_t a1)
{
}

  ;
}

void Publishers.Catch.Inner.receivePre(subscription:)(uint64_t a1)
{
  uint64_t v18 = a1;
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 88LL);
  v16[6] = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](a1);
  v16[5] = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = v2[13];
  uint64_t v6 = v2[10];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  void v16[11] = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  v16[9] = (char *)v16 - v9;
  v16[10] = v8;
  uint64_t v17 = type metadata accessor for Optional();
  v16[13] = *(void *)(v17 - 8);
  uint64_t v10 = MEMORY[0x1895F8858](v17);
  v16[12] = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v10);
  v16[14] = (char *)v16 - v12;
  uint64_t v13 = v2[12];
  uint64_t v14 = v2[14];
  uint64_t v15 = v2[15];
  void v16[3] = v6;
  uint64_t v19 = v6;
  uint64_t v20 = v3;
  v16[7] = v3;
  uint64_t v21 = v13;
  uint64_t v22 = v5;
  v16[4] = v5;
  uint64_t v23 = v14;
  uint64_t v24 = v15;
  type metadata accessor for Publishers.Catch.Inner.State();
}

uint64_t sub_183B8F208(uint64_t a1)
{
  uint64_t v8 = *(void *)(a1 - 8);
  uint64_t v9 = MEMORY[0x1895F8858](a1);
  *(void *)(v6 - 240) = &v38[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  MEMORY[0x1895F8858](v9);
  uint64_t v12 = &v38[-v11];
  uint64_t v13 = (os_unfair_lock_s *)v4[2];
  os_unfair_lock_lock(v13);
  uint64_t v14 = (char *)v4 + *(void *)(*v4 + 144LL);
  swift_beginAccess();
  (*(void (**)(_BYTE *, char *, uint64_t))(v8 + 16))(v12, v14, a1);
  if (swift_getEnumCaseMultiPayload())
  {
    os_unfair_lock_unlock(v13);
    uint64_t v15 = *(void **)(v6 - 176);
    uint64_t v16 = v15[3];
    uint64_t v17 = v15[4];
    __swift_project_boxed_opaque_existential_1(v15, v16);
    (*(void (**)(uint64_t))(*(void *)(v17 + 8) + 8LL))(v16);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v12, a1);
  }

  else
  {
    *(void *)(v6 - 304) = v2;
    *(void *)(v6 - 296) = v1;
    *(void *)(v6 - 288) = v3;
    uint64_t v18 = *(void *)(v6 - 232);
    uint64_t v20 = *(void *)(v6 - 200);
    uint64_t v19 = *(void *)(v6 - 192);
    uint64_t v21 = v12;
    uint64_t v22 = *(void *)(v6 - 184);
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(v20 + 32))(v19, v21, v22);
    uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16);
    uint64_t v24 = *(void *)(v6 - 208);
    v23(v24, v19, v22);
    uint64_t v25 = *(void *)(v6 - 224);
    int v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 216) + 48LL))(v24, 1LL, v25);
    __int128 v27 = v4;
    char v28 = v13;
    uint64_t v29 = *(void *)(v6 - 240);
    if (v26 != 1)
    {
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 216) + 32LL))(v18, *(void *)(v6 - 208), v25);
      swift_storeEnumTagMultiPayload();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 40))(v14, v29, a1);
      swift_endAccess();
      os_unfair_lock_unlock(v28);
      (*(void (**)(uint64_t))((char *)v4 + *(void *)(*v4 + 160LL)))(v18);
      *(void *)(v6 - 168) = v4;
      swift_retain();
      uint64_t v34 = *(void *)(v6 - 248);
      *(void *)(v6 - 136) = *(void *)(v6 - 280);
      *(void *)(v6 - 128) = v34;
      uint64_t v35 = *(void *)(v6 - 272);
      *(void *)(v6 - 120) = *(void *)(v6 - 296);
      *(void *)(v6 - 112) = v35;
      uint64_t v36 = *(void *)(v6 - 288);
      *(void *)(v6 - 104) = *(void *)(v6 - 304);
      *(void *)(v6 - 96) = v36;
      type metadata accessor for Publishers.Catch.Inner.CaughtS();
    }

    uint64_t v30 = *(void (**)(void, uint64_t))(*(void *)(v6 - 200) + 8LL);
    uint64_t v31 = *(void *)(v6 - 184);
    v30(*(void *)(v6 - 208), v31);
    outlined init with copy of Subscription(*(void *)(v6 - 176), v29);
    swift_storeEnumTagMultiPayload();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 40))(v14, v29, a1);
    swift_endAccess();
    os_unfair_lock_unlock(v28);
    *(void *)(v6 - 112) = v5;
    *(void *)(v6 - 104) = &protocol witness table for Publishers.Catch<A, B>.Inner<A1>;
    *(void *)(v6 - 136) = v27;
    uint64_t v32 = *(void *)(v6 - 288);
    uint64_t v33 = *(void (**)(uint64_t, void, uint64_t))(v32 + 40);
    swift_retain();
    v33(v6 - 136, *(void *)(v6 - 296), v32);
    v30(*(void *)(v6 - 192), v31);
    return __swift_destroy_boxed_opaque_existential_1(v6 - 136);
  }

void Publishers.Catch.Inner.UncaughtS.receive(_:)(uint64_t a1)
{
}

void Publishers.Catch.Inner.receivePre(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v5);
  uint64_t v6 = v1[3];
  if (v6 != 0x8000000000000000LL)
  {
    if (v6 < 0)
    {
      __break(1u);
    }

    else if (v6)
    {
      v1[3] = v6 - 1;
      goto LABEL_5;
    }

    __break(1u);
    goto LABEL_16;
  }

void Publishers.Catch.Inner.UncaughtS.receive(completion:)(uint64_t a1)
{
}

  ;
}

void Publishers.Catch.Inner.receivePre(completion:)(uint64_t a1)
{
  v17[14] = a1;
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 88LL);
  v17[4] = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](a1);
  v17[3] = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = v2[13];
  uint64_t v6 = v2[10];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  v17[11] = (char *)v17 - v8;
  uint64_t v9 = v2[14];
  uint64_t v10 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v17[8] = v10;
  uint64_t v13 = type metadata accessor for Subscribers.Completion(0LL, v10, AssociatedConformanceWitness, v12);
  v17[6] = *(void *)(v13 - 8);
  v17[7] = v13;
  MEMORY[0x1895F8858](v13);
  v17[5] = (char *)v17 - v14;
  uint64_t v15 = v2[12];
  uint64_t v16 = v2[15];
  v17[19] = v6;
  v17[20] = v3;
  v17[1] = v3;
  v17[9] = v15;
  v17[21] = v15;
  v17[22] = v5;
  v17[0] = v9;
  v17[23] = v9;
  _BYTE v17[24] = v16;
  v17[10] = v16;
  type metadata accessor for Publishers.Catch.Inner.State();
}

uint64_t sub_183B8F830(uint64_t a1)
{
  uint64_t v7 = *(void *)(a1 - 8);
  uint64_t v8 = MEMORY[0x1895F8858](a1);
  uint64_t v10 = &v41[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v11 = MEMORY[0x1895F8858](v8);
  *(void *)(v5 - 192) = &v41[-v12];
  MEMORY[0x1895F8858](v11);
  uint64_t v14 = &v41[-v13];
  *(void *)(v5 - 272) = v2;
  uint64_t v15 = v3;
  uint64_t v16 = v1;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v19 = type metadata accessor for Subscribers.Completion(0LL, v1, AssociatedConformanceWitness, v18);
  MEMORY[0x1895F8858](v19);
  uint64_t v21 = &v41[-v20];
  (*(void (**)(_BYTE *, void))(v22 + 16))(&v41[-v20], *(void *)(v5 - 176));
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v4 + 48))(v21, 1LL, v1) == 1)
  {
    uint64_t v23 = *(void **)(v5 - 184);
    uint64_t v24 = (os_unfair_lock_s *)v23[2];
    os_unfair_lock_lock(v24);
    uint64_t v25 = (char *)v23 + *(void *)(*v23 + 144LL);
    swift_beginAccess();
    (*(void (**)(_BYTE *, char *, uint64_t))(v7 + 16))(v14, v25, a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v26 = *(void *)(v5 - 192);
      swift_storeEnumTagMultiPayload();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 40))(v25, v26, a1);
      swift_endAccess();
      os_unfair_lock_unlock(v24);
      uint64_t v27 = *(void *)(v5 - 248);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(v5 - 224) - 8LL) + 56LL))( v27,  1LL,  1LL);
      (*(void (**)(uint64_t, void))(*(void *)(v5 - 208) + 56LL))(v27, *(void *)(v5 - 216));
      (*(void (**)(uint64_t, void))(*(void *)(v5 - 240) + 8LL))(v27, *(void *)(v5 - 232));
    }

    else
    {
      os_unfair_lock_unlock(v24);
    }

    return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v14, a1);
  }

  else
  {
    *(void *)(v5 - 176) = v4;
    char v28 = *(void (**)(uint64_t, _BYTE *, uint64_t))(v4 + 32);
    uint64_t v29 = *(void *)(v5 - 200);
    v28(v29, v21, v1);
    uint64_t v30 = *(void **)(v5 - 184);
    uint64_t v31 = (os_unfair_lock_s *)v30[2];
    os_unfair_lock_lock(v31);
    uint64_t v32 = (char *)v30 + *(void *)(*v30 + 144LL);
    swift_beginAccess();
    *(void *)(v5 - 224) = v7;
    (*(void (**)(_BYTE *, char *, uint64_t))(v7 + 16))(v10, v32, a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      os_unfair_lock_unlock(v31);
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 176) + 8LL))(v29, v16);
    }

    else
    {
      if (EnumCaseMultiPayload == 1)
      {
        uint64_t v34 = *(void *)(v5 - 192);
        *(void *)(v5 - 232) = v10;
        swift_storeEnumTagMultiPayload();
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 224) + 40LL))(v32, v34, a1);
        swift_endAccess();
        os_unfair_lock_unlock(v31);
        (*(void (**)(uint64_t))((char *)v30 + *(void *)(*v30 + 160LL)))(v29);
        *(void *)(v5 - 168) = v30;
        swift_retain();
        *(void *)(v5 - 136) = v15;
        uint64_t v35 = *(void *)(v5 - 216);
        *(void *)(v5 - 128) = *(void *)(v5 - 280);
        *(void *)(v5 - 120) = v35;
        uint64_t v36 = *(void *)(v5 - 288);
        *(void *)(v5 - 112) = *(void *)(v5 - 272);
        *(void *)(v5 - 104) = v36;
        *(void *)(v5 - 96) = *(void *)(v5 - 208);
        type metadata accessor for Publishers.Catch.Inner.CaughtS();
      }

      if (EnumCaseMultiPayload)
      {
        uint64_t result = _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }

      else
      {
        uint64_t v38 = *(void *)(v5 - 176);
        uint64_t v39 = *(void *)(v5 - 192);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v39, v29, v16);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v38 + 56))(v39, 0LL, 1LL, v16);
        swift_storeEnumTagMultiPayload();
        swift_beginAccess();
        uint64_t v40 = *(void *)(v5 - 224);
        (*(void (**)(char *, uint64_t, uint64_t))(v40 + 40))(v32, v39, a1);
        swift_endAccess();
        os_unfair_lock_unlock(v31);
        (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v29, v16);
        return (*(uint64_t (**)(_BYTE *, uint64_t))(v40 + 8))(v10, a1);
      }
    }
  }

  return result;
}

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( uint64_t a1, void *a2, uint64_t a3)
{
  return protocol witness for Subscriber.receive(_:) in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( a1,  a2,  a3,  (uint64_t (*)(uint64_t, void, void, void, void, void, void, void))Publishers.Catch.Inner.UncaughtS.receive(subscription:));
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( uint64_t a1, void *a2, uint64_t a3)
{
  return protocol witness for Subscriber.receive(_:) in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( a1,  a2,  a3,  (uint64_t (*)(uint64_t, void, void, void, void, void, void, void))Publishers.Catch.Inner.UncaughtS.receive(_:));
}

uint64_t protocol witness for Subscriber.receive(completion:) in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( uint64_t a1, void *a2, uint64_t a3)
{
  return protocol witness for Subscriber.receive(_:) in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( a1,  a2,  a3,  (uint64_t (*)(uint64_t, void, void, void, void, void, void, void))Publishers.Catch.Inner.UncaughtS.receive(completion:));
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS()
{
  return 0x6863746143LL;
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( void *a1, uint64_t a2)
{
  return protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( a1,  a2,  (uint64_t (*)(void, void, void, void, void, void, void))Publishers.Catch.Inner.UncaughtS.customMirror.getter);
}

uint64_t protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( void *a1, uint64_t a2)
{
  return protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( a1,  a2,  (uint64_t (*)(void, void, void, void, void, void, void))Publishers.Catch.Inner.UncaughtS.playgroundDescription.getter);
}

void protocol witness for CustomCombineIdentifierConvertible.combineIdentifier.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( uint64_t *a1@<X0>, void *a2@<X8>)
{
}

void Publishers.Catch.Inner.CaughtS.customMirror.getter()
{
}

void Publishers.Catch.Inner.CaughtS.receive(subscription:)()
{
}

  ;
}

void Publishers.Catch.Inner.receivePost(subscription:)()
{
}

void sub_183B8FE0C(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = MEMORY[0x1895F8858](a1);
  uint64_t v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  MEMORY[0x1895F8858](v5);
  uint64_t v9 = &v17[-v8];
  uint64_t v10 = (os_unfair_lock_s *)v2[2];
  os_unfair_lock_lock(v10);
  uint64_t v11 = (char *)v2 + *(void *)(*v2 + 144LL);
  swift_beginAccess();
  (*(void (**)(_BYTE *, char *, uint64_t))(v4 + 16))(v9, v11, a1);
  if (swift_getEnumCaseMultiPayload() == 3)
  {
    outlined init with copy of Subscription((uint64_t)v1, (uint64_t)v7);
    swift_storeEnumTagMultiPayload();
    swift_beginAccess();
    (*(void (**)(char *, _BYTE *, uint64_t))(v4 + 40))(v11, v7, a1);
    swift_endAccess();
    uint64_t v12 = v2[3];
    os_unfair_lock_unlock(v10);
    if (v12 == 0x8000000000000000LL)
    {
LABEL_5:
      uint64_t v13 = v1[3];
      uint64_t v14 = v1[4];
      __swift_project_boxed_opaque_existential_1(v1, v13);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 24))(v12, v13, v14);
      return;
    }

    if (v12 < 0)
    {
      __break(1u);
    }

    else if (v12)
    {
      goto LABEL_5;
    }
  }

  else
  {
    os_unfair_lock_unlock(v10);
    uint64_t v16 = v1[3];
    uint64_t v15 = v1[4];
    __swift_project_boxed_opaque_existential_1(v1, v16);
    (*(void (**)(uint64_t))(*(void *)(v15 + 8) + 8LL))(v16);
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v9, a1);
  }

void Publishers.Catch.Inner.CaughtS.receive(completion:)()
{
}

  ;
}

void Publishers.Catch.Inner.receivePost(completion:)()
{
}

uint64_t sub_183B9000C(uint64_t a1)
{
  uint64_t v6 = *(void *)(a1 - 8);
  uint64_t v7 = MEMORY[0x1895F8858](a1);
  uint64_t v9 = &v15[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  MEMORY[0x1895F8858](v7);
  uint64_t v11 = &v15[-v10];
  uint64_t v12 = (os_unfair_lock_s *)v2[2];
  os_unfair_lock_lock(v12);
  uint64_t v13 = (char *)v2 + *(void *)(*v2 + 144LL);
  swift_beginAccess();
  (*(void (**)(_BYTE *, char *, uint64_t))(v6 + 16))(v11, v13, a1);
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    swift_storeEnumTagMultiPayload();
    swift_beginAccess();
    (*(void (**)(char *, _BYTE *, uint64_t))(v6 + 40))(v13, v9, a1);
    swift_endAccess();
    os_unfair_lock_unlock(v12);
    (*(void (**)(uint64_t, void, uint64_t))(v1 + 56))(v3, *(void *)(v4 - 176), v1);
  }

  else
  {
    os_unfair_lock_unlock(v12);
  }

  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, a1);
}

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.Catch<A, B>.Inner<A1>.CaughtS( uint64_t a1, void *a2, uint64_t a3)
{
  return protocol witness for Subscriber.receive(_:) in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( a1,  a2,  a3,  (uint64_t (*)(uint64_t, void, void, void, void, void, void, void))Publishers.Catch.Inner.CaughtS.receive(subscription:));
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance Publishers.TryCatch<A, B>.Inner<A1>.CaughtS( uint64_t a1)
{
  return Publishers.Catch.Inner.CaughtS.receive(_:)(a1, *v1);
}

uint64_t protocol witness for Subscriber.receive(completion:) in conformance Publishers.Catch<A, B>.Inner<A1>.CaughtS( uint64_t a1, void *a2, uint64_t a3)
{
  return protocol witness for Subscriber.receive(_:) in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( a1,  a2,  a3,  (uint64_t (*)(uint64_t, void, void, void, void, void, void, void))Publishers.Catch.Inner.CaughtS.receive(completion:));
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Catch<A, B>.Inner<A1>.CaughtS( void *a1, uint64_t a2)
{
  return protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( a1,  a2,  (uint64_t (*)(void, void, void, void, void, void, void))Publishers.Catch.Inner.CaughtS.customMirror.getter);
}

uint64_t protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Catch<A, B>.Inner<A1>.CaughtS( void *a1, uint64_t a2)
{
  return protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( a1,  a2,  (uint64_t (*)(void, void, void, void, void, void, void))Publishers.Catch.Inner.playgroundDescription.getter);
}

void protocol witness for CustomCombineIdentifierConvertible.combineIdentifier.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( uint64_t *a1@<X0>, void (*a2)(void, void *)@<X2>, void *a3@<X8>)
{
}

void Publishers.Catch.Inner.cancel()()
{
}

void sub_183B90228(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = MEMORY[0x1895F8858](a1);
  uint64_t v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  MEMORY[0x1895F8858](v5);
  uint64_t v9 = (__int128 *)&v15[-v8];
  uint64_t v10 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v10);
  uint64_t v11 = (char *)v1 + *(void *)(*v1 + 144LL);
  swift_beginAccess();
  (*(void (**)(__int128 *, char *, uint64_t))(v4 + 16))(v9, v11, a1);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1 || EnumCaseMultiPayload == 2)
  {
    outlined init with take of Subscription(v9, v2 - 112);
    swift_storeEnumTagMultiPayload();
    swift_beginAccess();
    (*(void (**)(char *, _BYTE *, uint64_t))(v4 + 40))(v11, v7, a1);
    swift_endAccess();
    os_unfair_lock_unlock(v10);
    uint64_t v13 = *(void *)(v2 - 88);
    uint64_t v14 = *(void *)(v2 - 80);
    __swift_project_boxed_opaque_existential_1((void *)(v2 - 112), v13);
    (*(void (**)(uint64_t))(*(void *)(v14 + 8) + 8LL))(v13);
    __swift_destroy_boxed_opaque_existential_1(v2 - 112);
  }

  else if (EnumCaseMultiPayload == 4)
  {
    os_unfair_lock_unlock(v10);
  }

  else
  {
    os_unfair_lock_unlock(v10);
    (*(void (**)(__int128 *, uint64_t))(v4 + 8))(v9, a1);
  }

void Publishers.Catch.Inner.request(_:)()
{
}

void sub_183B903DC(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v6 = (char *)&v9 - v5;
  if (v1 != 0x8000000000000000LL)
  {
    if (v1 < 0)
    {
      __break(1u);
    }

    else if (v1)
    {
      goto LABEL_4;
    }

    __break(1u);
    JUMPOUT(0x183B90578LL);
  }

void sub_183B90588()
{
}

void protocol witness for Subscription.request(_:) in conformance Publishers.Catch<A, B>.Inner<A1>()
{
}

  ;
}

void protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Catch<A, B>.Inner<A1>()
{
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Catch<A, B>.Inner<A1>( void *a1@<X8>)
{
}

void protocol witness for Cancellable.cancel() in conformance Publishers.Catch<A, B>.Inner<A1>()
{
}

  ;
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Catch<A, B>( uint64_t a1)
{
}

uint64_t Publishers.Catch.handler.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 52));
  swift_retain();
  return v2;
}

void Publishers.TryCatch.receive<A>(subscriber:)()
{
}

void sub_183B90710()
{
}

void sub_183B90748()
{
}

uint64_t sub_183B90770(uint64_t a1)
{
  uint64_t v4 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.TryCatch<A, B>.Inner<A1>.UncaughtS, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&v6, v1, a1, v2, v4);
  return swift_release();
}

void type metadata accessor for Publishers.TryCatch.Inner()
{
}

void Publishers.Catch.Inner.customMirror.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1895F8858](v2);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1895F8858](v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  os_unfair_lock_lock((os_unfair_lock_t)v0[2]);
  uint64_t v15 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = xmmword_183B9DB50;
  *(void *)(v8 + 32) = 0x657274736E776F64LL;
  *(void *)(v8 + 40) = 0xEA00000000006D61LL;
  uint64_t v9 = (uint64_t)v0 + *(void *)(*v0 + 152);
  uint64_t v10 = *(void *)(v1 + 96);
  *(void *)(v8 + 72) = v10;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v8 + 48));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL))( boxed_opaque_existential_1,  v9,  v10);
  *(void *)(v8 + 80) = 0x646E616D6564LL;
  *(void *)(v8 + 88) = 0xE600000000000000LL;
  uint64_t v12 = v0[3];
  *(void *)(v8 + 120) = &type metadata for Subscribers.Demand;
  *(void *)(v8 + 96) = v12;
  uint64_t v13 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56LL))(v7, 1LL, 1LL, v13);
  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)((uint64_t)v4);
  swift_retain();
  Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
  os_unfair_lock_unlock((os_unfair_lock_t)v0[2]);
}

void Publishers.TryCatch.Inner.playgroundDescription.getter(void *a1@<X8>)
{
  a1[3] = MEMORY[0x189617FA8];
  *a1 = 0x6863746143797254LL;
  a1[1] = 0xE800000000000000LL;
}

char *Publishers.Catch.Inner.deinit(uint64_t (*a1)(void, _OWORD *))
{
  uint64_t v3 = *(_OWORD **)v1;
  MEMORY[0x186E22A2C](*((void *)v1 + 2), -1LL, -1LL);
  uint64_t v4 = &v1[*(void *)(*(void *)v1 + 144LL)];
  __int128 v8 = v3[6];
  v9[0] = v3[5];
  __int128 v5 = v3[7];
  v9[1] = v8;
  __int128 v9[2] = v5;
  uint64_t v6 = a1(0LL, v9);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v4, v6);
  (*(void (**)(char *))(*(void *)(v8 - 8) + 8LL))(&v1[*(void *)(*(void *)v1 + 152LL)]);
  swift_release();
  return v1;
}

uint64_t Publishers.TryCatch.Inner.__deallocating_deinit()
{
  return Publishers.Catch.Inner.__deallocating_deinit((uint64_t (*)(void, _OWORD *))type metadata accessor for Publishers.TryCatch.Inner.State);
}

uint64_t Publishers.Catch.Inner.__deallocating_deinit(uint64_t (*a1)(void, _OWORD *))
{
  return swift_deallocClassInstance();
}

void Publishers.TryCatch.Inner.UncaughtS.receive(subscription:)(uint64_t a1)
{
}

  ;
}

void Publishers.TryCatch.Inner.receivePre(subscription:)(uint64_t a1)
{
  v18[19] = a1;
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 88LL);
  v18[10] = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](a1);
  v18[11] = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = v2[13];
  uint64_t v6 = v2[10];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v18[17] = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  v18[13] = (char *)v18 - v8;
  v18[18] = v9;
  uint64_t v10 = type metadata accessor for Optional();
  uint64_t v11 = *(void *)(v10 - 8);
  v18[14] = v10;
  v18[15] = v11;
  uint64_t v12 = MEMORY[0x1895F8858](v10);
  v18[12] = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v12);
  v18[16] = (char *)v18 - v14;
  uint64_t v15 = v2[12];
  uint64_t v16 = v2[14];
  uint64_t v17 = v2[15];
  v18[8] = v6;
  v18[25] = v6;
  v18[26] = v3;
  v18[7] = v3;
  v18[27] = v15;
  v18[28] = v5;
  v18[9] = v5;
  v18[29] = v16;
  v18[30] = v17;
  type metadata accessor for Publishers.TryCatch.Inner.State();
}

uint64_t sub_183B90C00(uint64_t a1)
{
  uint64_t v8 = *(void *)(a1 - 8);
  uint64_t v9 = MEMORY[0x1895F8858](a1);
  uint64_t v11 = &v37[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  MEMORY[0x1895F8858](v9);
  uint64_t v13 = &v37[-v12];
  os_unfair_lock_lock(v2[2]);
  uint64_t v14 = (char *)v2 + *(void *)&(*v2)[36]._os_unfair_lock_opaque;
  swift_beginAccess();
  (*(void (**)(_BYTE *, char *, uint64_t))(v8 + 16))(v13, v14, a1);
  if (swift_getEnumCaseMultiPayload())
  {
    os_unfair_lock_unlock(v2[2]);
    uint64_t v15 = *(void **)(v6 - 184);
    uint64_t v16 = v15[3];
    uint64_t v17 = v15[4];
    __swift_project_boxed_opaque_existential_1(v15, v16);
    (*(void (**)(uint64_t))(*(void *)(v17 + 8) + 8LL))(v16);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v13, a1);
  }

  else
  {
    *(void *)(v6 - 320) = v8;
    *(void *)(v6 - 312) = v14;
    *(void *)(v6 - 328) = v1;
    *(void *)(v6 - 304) = v11;
    *(void *)(v6 - 296) = v3;
    *(void *)(v6 - 288) = v4;
    uint64_t v18 = *(void *)(v6 - 216);
    uint64_t v19 = *(void *)(v6 - 208);
    uint64_t v20 = v13;
    uint64_t v21 = *(void *)(v6 - 232);
    uint64_t v22 = *(void *)(v6 - 224);
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(v18 + 32))(v19, v20, v22);
    uint64_t v23 = *(void *)(v6 - 240);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v23, v19, v22);
    if ((*(unsigned int (**)(uint64_t, uint64_t, void))(*(void *)(v6 - 200) + 48LL))( v23,  1LL,  *(void *)(v6 - 192)) != 1)
    {
      (*(void (**)(uint64_t, uint64_t, void))(*(void *)(v6 - 200) + 32LL))(v21, v23, *(void *)(v6 - 192));
      uint64_t v29 = *(void *)(v6 - 304);
      uint64_t v30 = a1;
      swift_storeEnumTagMultiPayload();
      uint64_t v31 = *(void *)(v6 - 312);
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 320) + 40LL))(v31, v29, v30);
      swift_endAccess();
      os_unfair_lock_unlock(v2[2]);
      (*(void (**)(uint64_t))((char *)v2 + *(void *)&(*v2)[40]._os_unfair_lock_opaque))(v21);
      uint64_t v32 = *(void *)(v6 - 288);
      uint64_t v33 = *(void *)(v6 - 296);
      *(void *)(v6 - 176) = v2;
      swift_retain();
      uint64_t v34 = *(void *)(v6 - 280);
      *(void *)(v6 - 136) = *(void *)(v6 - 272);
      *(void *)(v6 - 128) = v34;
      uint64_t v35 = *(void *)(v6 - 264);
      *(void *)(v6 - 120) = v33;
      *(void *)(v6 - 112) = v35;
      *(void *)(v6 - 104) = *(void *)(v6 - 328);
      *(void *)(v6 - 96) = v32;
      type metadata accessor for Publishers.TryCatch.Inner.CaughtS();
    }

    uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v24(v23, v22);
    uint64_t v25 = *(void *)(v6 - 304);
    outlined init with copy of Subscription(*(void *)(v6 - 184), v25);
    swift_storeEnumTagMultiPayload();
    uint64_t v26 = *(void *)(v6 - 312);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 320) + 40LL))(v26, v25, a1);
    swift_endAccess();
    os_unfair_lock_unlock(v2[2]);
    *(void *)(v6 - 112) = v5;
    *(void *)(v6 - 104) = &protocol witness table for Publishers.TryCatch<A, B>.Inner<A1>;
    *(void *)(v6 - 136) = v2;
    uint64_t v27 = *(void *)(v6 - 288);
    char v28 = *(void (**)(uint64_t, void, uint64_t))(v27 + 40);
    swift_retain();
    v28(v6 - 136, *(void *)(v6 - 296), v27);
    v24(v19, v22);
    return __swift_destroy_boxed_opaque_existential_1(v6 - 136);
  }

void Publishers.TryCatch.Inner.UncaughtS.receive(_:)(uint64_t a1)
{
}

void Publishers.TryCatch.Inner.receivePre(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  os_unfair_lock_lock((os_unfair_lock_t)v1[2]);
  uint64_t v5 = v1[3];
  if (v5 != 0x8000000000000000LL)
  {
    if (v5 < 0)
    {
      __break(1u);
    }

    else if (v5)
    {
      v1[3] = v5 - 1;
      goto LABEL_5;
    }

    __break(1u);
    goto LABEL_16;
  }

void Publishers.TryCatch.Inner.UncaughtS.receive(completion:)(uint64_t a1)
{
}

  ;
}

void Publishers.TryCatch.Inner.receivePre(completion:)(uint64_t a1)
{
  v11[11] = a1;
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 88LL);
  v11[5] = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](a1);
  v11[7] = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = v2[13];
  uint64_t v6 = v2[10];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v8 = v2[12];
  uint64_t v10 = v2[14];
  uint64_t v9 = v2[15];
  v11[17] = v6;
  v11[18] = v3;
  v11[6] = v3;
  void v11[8] = v8;
  v11[9] = v9;
  v11[19] = v8;
  v11[20] = v5;
  void v11[3] = v10;
  v11[21] = v10;
  v11[22] = v9;
  type metadata accessor for Publishers.TryCatch.Inner.State();
}

uint64_t sub_183B91250(uint64_t a1)
{
  uint64_t v9 = *(void *)(a1 - 8);
  uint64_t v10 = MEMORY[0x1895F8858](a1);
  uint64_t v12 = &v39[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v13 = MEMORY[0x1895F8858](v10);
  *(void *)(v7 - 192) = &v39[-v14];
  MEMORY[0x1895F8858](v13);
  uint64_t v16 = &v39[-v15];
  *(void *)(v7 - 240) = v4;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v19 = type metadata accessor for Subscribers.Completion(0LL, v5, AssociatedConformanceWitness, v18);
  MEMORY[0x1895F8858](v19);
  uint64_t v21 = &v39[-v20];
  (*(void (**)(_BYTE *, void))(v22 + 16))(&v39[-v20], *(void *)(v7 - 184));
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v1 + 48))(v21, 1LL, v5) == 1)
  {
    os_unfair_lock_lock(v2[2]);
    uint64_t v23 = (char *)v2 + *(void *)&(*v2)[36]._os_unfair_lock_opaque;
    swift_beginAccess();
    (*(void (**)(_BYTE *, char *, uint64_t))(v9 + 16))(v16, v23, a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v24 = *(void *)(v7 - 192);
      swift_storeEnumTagMultiPayload();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 40))(v23, v24, a1);
      swift_endAccess();
      os_unfair_lock_unlock(v2[2]);
      *(void *)(v7 - 160) = 0LL;
      (*(void (**)(uint64_t, void))(*(void *)(v7 - 200) + 56LL))(v7 - 160, *(void *)(v7 - 208));
    }

    else
    {
      os_unfair_lock_unlock(v2[2]);
    }

    return (*(uint64_t (**)(_BYTE *, uint64_t))(v9 + 8))(v16, a1);
  }

  else
  {
    uint64_t v25 = *(void (**)(uint64_t, _BYTE *, uint64_t))(v1 + 32);
    *(void *)(v7 - 256) = v5;
    v25(v6, v21, v5);
    os_unfair_lock_lock(v2[2]);
    uint64_t v26 = (char *)v2 + *(void *)&(*v2)[36]._os_unfair_lock_opaque;
    swift_beginAccess();
    *(void *)(v7 - 184) = v9;
    (*(void (**)(_BYTE *, char *, uint64_t))(v9 + 16))(v12, v26, a1);
    uint64_t v27 = a1;
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      os_unfair_lock_unlock(v2[2]);
      return (*(uint64_t (**)(uint64_t, void))(v1 + 8))(v6, *(void *)(v7 - 256));
    }

    else
    {
      if (EnumCaseMultiPayload == 1)
      {
        *(void *)(v7 - 264) = v12;
        *(void *)(v7 - 272) = v1;
        uint64_t v29 = *(void *)(v7 - 192);
        swift_storeEnumTagMultiPayload();
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 184) + 40LL))(v26, v29, v27);
        swift_endAccess();
        os_unfair_lock_unlock(v2[2]);
        (*(void (**)(uint64_t))((char *)v2 + *(void *)&(*v2)[40]._os_unfair_lock_opaque))(v6);
        *(void *)(v7 - 176) = v2;
        swift_retain();
        uint64_t v35 = *(void *)(v7 - 224);
        *(void *)(v7 - 136) = v3;
        *(void *)(v7 - 128) = v35;
        uint64_t v37 = *(void *)(v7 - 248);
        uint64_t v36 = *(void *)(v7 - 240);
        *(void *)(v7 - 120) = *(void *)(v7 - 208);
        *(void *)(v7 - 112) = v36;
        uint64_t v38 = *(void *)(v7 - 200);
        *(void *)(v7 - 104) = v37;
        *(void *)(v7 - 96) = v38;
        type metadata accessor for Publishers.TryCatch.Inner.CaughtS();
      }

      uint64_t v31 = *(void *)(v7 - 256);
      uint64_t v32 = *(void *)(v7 - 192);
      if (EnumCaseMultiPayload)
      {
        uint64_t result = _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }

      else
      {
        (*(void (**)(void, uint64_t, void))(v1 + 16))(*(void *)(v7 - 192), v6, *(void *)(v7 - 256));
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v1 + 56))(v32, 0LL, 1LL, v31);
        swift_storeEnumTagMultiPayload();
        swift_beginAccess();
        uint64_t v33 = v1;
        uint64_t v34 = *(void *)(v7 - 184);
        (*(void (**)(char *, uint64_t, uint64_t))(v34 + 40))(v26, v32, a1);
        swift_endAccess();
        os_unfair_lock_unlock(v2[2]);
        (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v6, v31);
        return (*(uint64_t (**)(_BYTE *, uint64_t))(v34 + 8))(v12, a1);
      }
    }
  }

  return result;
}

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.TryCatch<A, B>.Inner<A1>.UncaughtS( uint64_t a1, void *a2, uint64_t a3)
{
  return protocol witness for Subscriber.receive(_:) in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( a1,  a2,  a3,  (uint64_t (*)(uint64_t, void, void, void, void, void, void, void))Publishers.TryCatch.Inner.UncaughtS.receive(subscription:));
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance Publishers.TryCatch<A, B>.Inner<A1>.UncaughtS( uint64_t a1, void *a2, uint64_t a3)
{
  return protocol witness for Subscriber.receive(_:) in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( a1,  a2,  a3,  (uint64_t (*)(uint64_t, void, void, void, void, void, void, void))Publishers.TryCatch.Inner.UncaughtS.receive(_:));
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( uint64_t a1, void *a2, uint64_t a3, uint64_t (*a4)(uint64_t, void, void, void, void, void, void, void))
{
  return a4(a1, *v4, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7]);
}

uint64_t protocol witness for Subscriber.receive(completion:) in conformance Publishers.TryCatch<A, B>.Inner<A1>.UncaughtS( uint64_t a1, void *a2, uint64_t a3)
{
  return protocol witness for Subscriber.receive(_:) in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( a1,  a2,  a3,  (uint64_t (*)(uint64_t, void, void, void, void, void, void, void))Publishers.TryCatch.Inner.UncaughtS.receive(completion:));
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.TryCatch<A, B>.Inner<A1>.UncaughtS()
{
  return 0x6863746143797254LL;
}

uint64_t protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.TryCatch<A, B>.Inner<A1>.UncaughtS( void *a1, uint64_t a2)
{
  return protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( a1,  a2,  (uint64_t (*)(void, void, void, void, void, void, void))Publishers.TryCatch.Inner.UncaughtS.playgroundDescription.getter);
}

void protocol witness for CustomCombineIdentifierConvertible.combineIdentifier.getter in conformance Publishers.TryCatch<A, B>.Inner<A1>.UncaughtS( uint64_t *a1@<X0>, void *a2@<X8>)
{
}

void Publishers.Catch.Inner.UncaughtS.combineIdentifier.getter( uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, void (*a7)(void, void *)@<X7>, void *a8@<X8>)
{
  v9[0] = a1;
  v9[1] = a2;
  __int128 v9[2] = a3;
  _OWORD v9[3] = a4;
  v9[4] = a5;
  v9[5] = a6;
  a7(0LL, v9);
  CustomCombineIdentifierConvertible<>.combineIdentifier.getter(a8);
}

void Publishers.TryCatch.Inner.CaughtS.receive(subscription:)()
{
}

  ;
}

void Publishers.TryCatch.Inner.receivePost(subscription:)()
{
}

void sub_183B918D0(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = MEMORY[0x1895F8858](a1);
  uint64_t v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  MEMORY[0x1895F8858](v5);
  uint64_t v9 = &v16[-v8];
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v2 + 16));
  uint64_t v10 = v2 + *(void *)(*(void *)v2 + 144LL);
  swift_beginAccess();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(v9, v10, a1);
  if (swift_getEnumCaseMultiPayload() == 3)
  {
    outlined init with copy of Subscription((uint64_t)v1, (uint64_t)v7);
    swift_storeEnumTagMultiPayload();
    swift_beginAccess();
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(v4 + 40))(v10, v7, a1);
    swift_endAccess();
    uint64_t v11 = *(void *)(v2 + 24);
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v2 + 16));
    if (v11 == 0x8000000000000000LL)
    {
LABEL_5:
      uint64_t v12 = v1[3];
      uint64_t v13 = v1[4];
      __swift_project_boxed_opaque_existential_1(v1, v12);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 24))(v11, v12, v13);
      return;
    }

    if (v11 < 0)
    {
      __break(1u);
    }

    else if (v11)
    {
      goto LABEL_5;
    }
  }

  else
  {
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v2 + 16));
    uint64_t v15 = v1[3];
    uint64_t v14 = v1[4];
    __swift_project_boxed_opaque_existential_1(v1, v15);
    (*(void (**)(uint64_t))(*(void *)(v14 + 8) + 8LL))(v15);
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v9, a1);
  }

uint64_t Publishers.Catch.Inner.CaughtS.receive(_:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(*(void *)a2 + 120LL) + 48LL))( a1,  *(void *)(*(void *)a2 + 96LL));
}

void Publishers.TryCatch.Inner.CaughtS.receive(completion:)(uint64_t a1)
{
}

  ;
}

void Publishers.TryCatch.Inner.receivePost(completion:)(uint64_t a1)
{
  v11[4] = a1;
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 112);
  uint64_t v4 = *(void *)(*v1 + 88);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11[5] = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v8 = type metadata accessor for Subscribers.Completion(0LL, AssociatedTypeWitness, AssociatedConformanceWitness, v7);
  v11[1] = *(void *)(v8 - 8);
  void v11[2] = v8;
  MEMORY[0x1895F8858](v8);
  void v11[3] = (char *)v11 - v9;
  uint64_t v10 = *(void *)(v2 + 120);
  uint64_t v13 = *(void *)(v2 + 80);
  uint64_t v14 = v4;
  __int128 v12 = *(_OWORD *)(v2 + 96);
  __int128 v15 = v12;
  uint64_t v16 = v3;
  uint64_t v17 = v10;
  type metadata accessor for Publishers.TryCatch.Inner.State();
}

uint64_t sub_183B91BBC(uint64_t a1)
{
  uint64_t v7 = *(void *)(a1 - 8);
  uint64_t v8 = MEMORY[0x1895F8858](a1);
  uint64_t v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  MEMORY[0x1895F8858](v8);
  __int128 v12 = &v19[-v11];
  os_unfair_lock_lock(v2[2]);
  uint64_t v13 = (char *)v2 + *(void *)&(*v2)[36]._os_unfair_lock_opaque;
  swift_beginAccess();
  (*(void (**)(_BYTE *, char *, uint64_t))(v7 + 16))(v12, v13, a1);
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    *(void *)(v5 - 224) = v3;
    swift_storeEnumTagMultiPayload();
    swift_beginAccess();
    (*(void (**)(char *, _BYTE *, uint64_t))(v7 + 40))(v13, v10, a1);
    swift_endAccess();
    os_unfair_lock_unlock(v2[2]);
    uint64_t v14 = *(void *)(v5 - 200);
    (*(void (**)(uint64_t, void, void))(*(void *)(v5 - 216) + 16LL))( v14,  *(void *)(v5 - 192),  *(void *)(v5 - 208));
    uint64_t v15 = *(void *)(v5 - 184);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v14, 1LL, v1) == 1)
    {
      *(void *)(v5 - 152) = 0LL;
      (*(void (**)(uint64_t, void))(*(void *)(v5 - 224) + 56LL))(v5 - 152, *(void *)(v5 - 176));
    }

    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v4, v14, v1);
      uint64_t v16 = swift_allocError();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v17, v4, v1);
      *(void *)(v5 - 152) = v16;
      (*(void (**)(uint64_t, void))(*(void *)(v5 - 224) + 56LL))(v5 - 152, *(void *)(v5 - 176));
      MEMORY[0x186E22870](v16);
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v4, v1);
    }
  }

  else
  {
    os_unfair_lock_unlock(v2[2]);
  }

  return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, a1);
}

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.TryCatch<A, B>.Inner<A1>.CaughtS( uint64_t a1, void *a2, uint64_t a3)
{
  return protocol witness for Subscriber.receive(_:) in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( a1,  a2,  a3,  (uint64_t (*)(uint64_t, void, void, void, void, void, void, void))Publishers.TryCatch.Inner.CaughtS.receive(subscription:));
}

uint64_t protocol witness for Subscriber.receive(completion:) in conformance Publishers.TryCatch<A, B>.Inner<A1>.CaughtS( uint64_t a1, void *a2, uint64_t a3)
{
  return protocol witness for Subscriber.receive(_:) in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( a1,  a2,  a3,  (uint64_t (*)(uint64_t, void, void, void, void, void, void, void))Publishers.TryCatch.Inner.CaughtS.receive(completion:));
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( void *a1, uint64_t a2, uint64_t (*a3)(void, void, void, void, void, void, void))
{
  return a3(*v3, a1[2], a1[3], a1[4], a1[5], a1[6], a1[7]);
}

uint64_t protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.TryCatch<A, B>.Inner<A1>.CaughtS( void *a1, uint64_t a2)
{
  return protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS( a1,  a2,  (uint64_t (*)(void, void, void, void, void, void, void))Publishers.TryCatch.Inner.playgroundDescription.getter);
}

void Publishers.TryCatch.Inner.cancel()()
{
}

void sub_183B91E38(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = MEMORY[0x1895F8858](a1);
  uint64_t v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  MEMORY[0x1895F8858](v5);
  uint64_t v9 = (__int128 *)&v14[-v8];
  os_unfair_lock_lock(v1[2]);
  uint64_t v10 = (char *)v1 + *(void *)&(*v1)[36]._os_unfair_lock_opaque;
  swift_beginAccess();
  (*(void (**)(__int128 *, char *, uint64_t))(v4 + 16))(v9, v10, a1);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1 || EnumCaseMultiPayload == 2)
  {
    outlined init with take of Subscription(v9, v2 - 96);
    swift_storeEnumTagMultiPayload();
    swift_beginAccess();
    (*(void (**)(char *, _BYTE *, uint64_t))(v4 + 40))(v10, v7, a1);
    swift_endAccess();
    os_unfair_lock_unlock(v1[2]);
    uint64_t v12 = *(void *)(v2 - 72);
    uint64_t v13 = *(void *)(v2 - 64);
    __swift_project_boxed_opaque_existential_1((void *)(v2 - 96), v12);
    (*(void (**)(uint64_t))(*(void *)(v13 + 8) + 8LL))(v12);
    __swift_destroy_boxed_opaque_existential_1(v2 - 96);
  }

  else if (EnumCaseMultiPayload == 4)
  {
    os_unfair_lock_unlock(v1[2]);
  }

  else
  {
    os_unfair_lock_unlock(v1[2]);
    (*(void (**)(__int128 *, uint64_t))(v4 + 8))(v9, a1);
  }

void Publishers.TryCatch.Inner.request(_:)()
{
}

void sub_183B91FE0(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v6 = (char *)&v9 - v5;
  if (v1 != 0x8000000000000000LL)
  {
    if (v1 < 0)
    {
      __break(1u);
    }

    else if (v1)
    {
      goto LABEL_4;
    }

    __break(1u);
    JUMPOUT(0x183B92174LL);
  }

void sub_183B92184()
{
}

void protocol witness for Subscription.request(_:) in conformance Publishers.TryCatch<A, B>.Inner<A1>()
{
}

  ;
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.TryCatch<A, B>.Inner<A1>( void *a1@<X8>)
{
}

void protocol witness for Cancellable.cancel() in conformance Publishers.TryCatch<A, B>.Inner<A1>()
{
}

  ;
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.TryCatch<A, B>()
{
}

void specialized Publishers.TryCatch.Inner.init(downstream:handler:)()
{
  uint64_t v1 = *v0;
  v0[3] = 0LL;
  uint64_t v2 = (char *)v0 + *(void *)(v1 + 144);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL))( v2,  1LL,  1LL,  AssociatedTypeWitness);
  type metadata accessor for Publishers.TryCatch.Inner.State();
}

char *sub_183B92300()
{
  uint64_t v5 = &v1[*(void *)(*(void *)v1 + 160LL)];
  *(void *)uint64_t v5 = v2;
  *((void *)v5 + 1) = v0;
  swift_retain();
  uint64_t v6 = (_DWORD *)swift_slowAlloc();
  *uint64_t v6 = 0;
  *((void *)v1 + 2) = v6;
  return v1;
}

void type metadata accessor for Publishers.TryCatch.Inner.UncaughtS()
{
}

uint64_t associated type witness table accessor for Publisher.Failure : Error in Publishers.Catch<A, B>()
{
  return swift_getAssociatedConformanceWitness();
}

void type metadata completion function for Publishers.Catch.Inner( _OWORD *a1, uint64_t a2, uint64_t a3)
{
}

void type metadata accessor for Publishers.Catch.Inner.State()
{
}

uint64_t getEnumTagSinglePayload for Publishers.Catch(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v7 = *(void *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      unint64_t v12 = *(void *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8LL);
      if (v12 >= 0xFFFFFFFF) {
        LODWORD(v12) = -1;
      }
      return (v12 + 1);
    }

    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }

  else
  {
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 16) & 0xFFFFFFF8) != 0) {
      unsigned int v8 = 2;
    }
    else {
      unsigned int v8 = a2 - v6 + 1;
    }
    if (v8 >= 0x10000) {
      unsigned int v9 = 4;
    }
    else {
      unsigned int v9 = 2;
    }
    if (v8 < 0x100) {
      unsigned int v9 = 1;
    }
    if (v8 >= 2) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0LL;
    }
    return ((uint64_t (*)(void))((char *)&loc_183B9244C + 4 * byte_183BA6900[v10]))();
  }

void storeEnumTagSinglePayload for Publishers.Catch( unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 16) - 8LL);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v5 + 84);
  }
  if (v6 >= a3)
  {
    int v9 = 0u;
    if (a2 <= v6) {
      goto LABEL_17;
    }
  }

  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v7 = a3 - v6 + 1;
    }
    else {
      unsigned int v7 = 2;
    }
    if (v7 >= 0x10000) {
      int v8 = 4;
    }
    else {
      int v8 = 2;
    }
    if (v7 < 0x100) {
      int v8 = 1;
    }
    if (v7 >= 2) {
      int v9 = v8;
    }
    else {
      int v9 = 0;
    }
    if (a2 <= v6) {
LABEL_17:
    }
      __asm { BR              X12 }
  }

  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    unsigned int v10 = ~v6 + a2;
    bzero(a1, ((*(void *)(v5 + 64) + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + 16);
    *a1 = v10;
  }

  __asm { BR              X10 }

void sub_183B925C4()
{
  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x183B9263CLL);
}

void sub_183B925CC(uint64_t a1, int a2)
{
  *(_DWORD *)(v2 + (*(void (**)(uint64_t, void, uint64_t))(v1 + 16))(v0, *(void *)(v9 - 144) + *(int *)(v6 + 52), v3) = 0;
  if (a2) {
    JUMPOUT(0x183B925D4LL);
  }
  JUMPOUT(0x183B9263CLL);
}

void sub_183B92614()
{
  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x183B9263CLL);
}

void sub_183B9261C()
{
  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x183B9263CLL);
}

uint64_t sub_183B92624(uint64_t a1, int a2, unsigned int a3)
{
  *(_WORD *)(v5 + (*(void (**)(uint64_t, void, uint64_t))(v4 + 16))(v7, *(void *)(v9 - 120), v6) = 0;
  if (!a2) {
    JUMPOUT(0x183B9263CLL);
  }
  if (a3 < 0x7FFFFFFF)
  {
    if ((a2 & 0x80000000) == 0) {
      JUMPOUT(0x183B92638LL);
    }
    JUMPOUT(0x183B92630LL);
  }

  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v5);
}

void type metadata completion function for Publishers.TryCatch.Inner( _OWORD *a1, uint64_t a2, uint64_t a3)
{
}

void type metadata completion function for Publishers.Catch.Inner( _OWORD *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, _OWORD *))
{
  uint64_t v7 = MEMORY[0x189617780] + 64LL;
  uint64_t v8 = MEMORY[0x189617760] + 64LL;
  __int128 v5 = a1[6];
  v6[0] = a1[5];
  __int128 v4 = a1[7];
  v6[1] = v5;
  void v6[2] = v4;
  a4(319LL, v6);
  JUMPOUT(0x183B926ACLL);
}

void type metadata accessor for Publishers.TryCatch.Inner.State()
{
}

uint64_t type metadata completion function for Publishers.TryCatch.Inner.State()
{
  uint64_t result = type metadata accessor for Optional();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0LL;
  }

  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.TryCatch.Inner.State(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  if (*(_DWORD *)(v5 + 84)) {
    size_t v6 = *(void *)(v5 + 64);
  }
  else {
    size_t v6 = *(void *)(v5 + 64) + 1LL;
  }
  if (v6 <= 0x28) {
    uint64_t v7 = 40LL;
  }
  else {
    uint64_t v7 = v6;
  }
  if (v7 <= 3)
  {
    unsigned int v10 = ((1 << (8 * v7)) + 1) >> (8 * v7);
    int v8 = *(_DWORD *)(v5 + 80);
    if (v10 > 0xFFFC)
    {
      unsigned int v13 = *(_DWORD *)((char *)a2 + v7);
      if (v13 >= 3) {
        goto LABEL_36;
      }
    }

    else
    {
      int v11 = v8 & 0x1000F8;
      if (v10 <= 0xFC)
      {
LABEL_20:
        unsigned int v13 = *((unsigned __int8 *)a2 + v7);
        if (v13 < 3) {
          goto LABEL_40;
        }
LABEL_36:
        else {
          uint64_t v18 = 4LL;
        }
        __asm { BR              X12 }
      }

      unsigned int v13 = *(unsigned __int16 *)((char *)a2 + v7);
      if (v13 >= 3) {
        goto LABEL_36;
      }
    }

LABEL_58:
      *(_DWORD *)((char *)a1 + (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v3, *(void *)(v10 - 144), v7) = v22;
      return a1;
    }

    __int128 v19 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 3) = v19;
    (**(void (***)(uint64_t *, uint64_t *))(v19 - 8))(a1, a2);
    if (v7 <= 3)
    {
      unsigned int v20 = ((1 << (8 * v7)) + 1) >> (8 * v7);
      if (v20 > 0xFFFC)
      {
        int v22 = 2;
        goto LABEL_58;
      }

      if (v20 > 0xFC)
      {
        LOWORD(v22) = 2;
        goto LABEL_61;
      }
    }

    *((_BYTE *)a1 + (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v3, *(void *)(v10 - 144), v7) = 2;
    return a1;
  }

  int v8 = *(_DWORD *)(v5 + 80);
LABEL_33:
  uint64_t v16 = *a2;
  *a1 = *a2;
  a1 = (uint64_t *)(v16 + (((v8 & 0xF8 | 7u) + 16LL) & ~(unint64_t)(v8 & 0xF8 | 7u)));
  swift_retain();
  return a1;
}

uint64_t destroy for Publishers.TryCatch.Inner.State(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  if (*(_DWORD *)(v3 + 84)) {
    unint64_t v4 = *(void *)(v3 + 64);
  }
  else {
    unint64_t v4 = *(void *)(v3 + 64) + 1LL;
  }
  if (v4 <= 0x28) {
    unint64_t v4 = 40LL;
  }
  unsigned int v6 = ((1 << (8 * v4)) + 1) >> (8 * v4);
  if (v6 > 0xFFFC)
  {
    unsigned int v5 = *(_DWORD *)(a1 + v4);
  }

  else
  {
    if (v6 <= 0xFC)
    {
LABEL_7:
      unsigned int v5 = *(unsigned __int8 *)(a1 + v4);
      goto LABEL_12;
    }

    unsigned int v5 = *(unsigned __int16 *)(a1 + v4);
  }

uint64_t initializeWithCopy for Publishers.TryCatch.Inner.State(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  if (*(_DWORD *)(v5 + 84)) {
    size_t v6 = *(void *)(v5 + 64);
  }
  else {
    size_t v6 = *(void *)(v5 + 64) + 1LL;
  }
  if (v6 <= 0x28) {
    uint64_t v7 = 40LL;
  }
  else {
    uint64_t v7 = v6;
  }
  unsigned int v8 = ((1 << (8 * v7)) + 1) >> (8 * v7);
  if (v8 <= 0xFFFC)
  {
    if (v8 > 0xFC)
    {
      unsigned int v9 = *(unsigned __int16 *)(a2 + v7);
      if (v9 < 3) {
        goto LABEL_19;
      }
      goto LABEL_15;
    }

void *assignWithCopy for Publishers.TryCatch.Inner.State(void *a1, void *a2)
{
  if (a1 == a2) {
    return a1;
  }
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  if (*(_DWORD *)(v5 + 84)) {
    size_t v6 = *(void *)(v5 + 64);
  }
  else {
    size_t v6 = *(void *)(v5 + 64) + 1LL;
  }
  if (v6 <= 0x28) {
    uint64_t v7 = 40LL;
  }
  else {
    uint64_t v7 = v6;
  }
  char v8 = 8 * v7;
  unsigned int v9 = ((1 << v8) + 1) >> v8;
  if (v9 > 0xFFFC)
  {
    unsigned int v10 = *(_DWORD *)((char *)a1 + v7);
    if (v10 < 3) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }

  if (v9 <= 0xFC)
  {
LABEL_11:
    unsigned int v10 = *((unsigned __int8 *)a1 + v7);
    if (v10 < 3) {
      goto LABEL_20;
    }
LABEL_16:
    else {
      uint64_t v11 = 4LL;
    }
    __asm { BR              X12 }
  }

  unsigned int v10 = *(unsigned __int16 *)((char *)a1 + v7);
  if (v10 >= 3) {
    goto LABEL_16;
  }
LABEL_20:
  if (v10 == 2 || v10 == 1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }

  else
  {
  }

  unsigned int v12 = ((1 << v8) + 1) >> v8;
  if (v12 > 0xFFFC)
  {
    unsigned int v13 = *(_DWORD *)((char *)a2 + v7);
    if (v13 < 3) {
      goto LABEL_38;
    }
    goto LABEL_34;
  }

  if (v12 <= 0xFC)
  {
LABEL_29:
    unsigned int v13 = *((unsigned __int8 *)a2 + v7);
    if (v13 < 3) {
      goto LABEL_38;
    }
LABEL_34:
    else {
      uint64_t v14 = 4LL;
    }
    __asm { BR              X12 }
  }

  unsigned int v13 = *(unsigned __int16 *)((char *)a2 + v7);
  if (v13 >= 3) {
    goto LABEL_34;
  }
LABEL_38:
  if (v13 != 2)
  {
    if (v13 != 1)
    {
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v5 + 48))(a2, 1LL, AssociatedTypeWitness))
      {
        memcpy(a1, a2, v6);
      }

      else
      {
        (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0LL, 1LL, AssociatedTypeWitness);
        if (v7 > 3)
        {
LABEL_54:
          *((_BYTE *)a1 + (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v3, *(void *)(v10 - 144), v7) = 0;
          return a1;
        }
      }

      unsigned int v20 = ((1 << v8) + 1) >> v8;
      if (v20 > 0xFFFC)
      {
        *(_DWORD *)((char *)a1 + (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v3, *(void *)(v10 - 144), v7) = 0;
        return a1;
      }

      if (v20 > 0xFC)
      {
        *(_WORD *)((char *)a1 + (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v3, *(void *)(v10 - 144), v7) = 0;
        return a1;
      }

      goto LABEL_54;
    }

    uint64_t v17 = a2[3];
    a1[3] = v17;
    a1[4] = a2[4];
    (**(void (***)(void *, void *))(v17 - 8))(a1, a2);
    int v18 = 1;
    unsigned int v19 = ((1 << v8) + 1) >> v8;
    if (v19 <= 0xFFFC)
    {
      if (v19 <= 0xFC)
      {
LABEL_50:
        *((_BYTE *)a1 + (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v3, *(void *)(v10 - 144), v7) = 1;
        return a1;
      }

LABEL_59:
      *(_WORD *)((char *)a1 + (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v3, *(void *)(v10 - 144), v7) = v18;
      return a1;
    }

      *(_WORD *)((char *)a1 + (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v3, *(void *)(v10 - 144), v7) = v18;
      return a1;
    }

LABEL_56:
    *(_DWORD *)((char *)a1 + (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v3, *(void *)(v10 - 144), v7) = v18;
    return a1;
  }

  uint64_t v15 = a2[3];
  a1[3] = v15;
  a1[4] = a2[4];
  (**(void (***)(void *, void *))(v15 - 8))(a1, a2);
  if (v7 <= 3)
  {
    unsigned int v16 = ((1 << v8) + 1) >> v8;
    if (v16 > 0xFFFC)
    {
      int v18 = 2;
      goto LABEL_56;
    }

    if (v16 > 0xFC)
    {
      LOWORD(v18) = 2;
      goto LABEL_59;
    }
  }

  *((_BYTE *)a1 + (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v3, *(void *)(v10 - 144), v7) = 2;
  return a1;
}

    *(_DWORD *)((char *)a1 + (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v3, *(void *)(v10 - 144), v7) = v18;
    return a1;
  }

  uint64_t v15 = a2[1];
  *a1 = *a2;
  a1[1] = v15;
  *((void *)a1 + 4) = *((void *)a2 + 4);
  if (v7 <= 3)
  {
    unsigned int v16 = ((1 << v8) + 1) >> v8;
    if (v16 > 0xFFFC)
    {
      int v18 = 2;
      goto LABEL_56;
    }

    if (v16 > 0xFC)
    {
      LOWORD(v18) = 2;
      goto LABEL_59;
    }
  }

  *((_BYTE *)a1 + (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v3, *(void *)(v10 - 144), v7) = 2;
  return a1;
}

_OWORD *initializeWithTake for Publishers.TryCatch.Inner.State(_OWORD *a1, _OWORD *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  if (*(_DWORD *)(v5 + 84)) {
    size_t v6 = *(void *)(v5 + 64);
  }
  else {
    size_t v6 = *(void *)(v5 + 64) + 1LL;
  }
  if (v6 <= 0x28) {
    uint64_t v7 = 40LL;
  }
  else {
    uint64_t v7 = v6;
  }
  unsigned int v8 = ((1 << (8 * v7)) + 1) >> (8 * v7);
  if (v8 <= 0xFFFC)
  {
    if (v8 > 0xFC)
    {
      unsigned int v9 = *(unsigned __int16 *)((char *)a2 + v7);
      if (v9 < 3) {
        goto LABEL_19;
      }
      goto LABEL_15;
    }

_OWORD *assignWithTake for Publishers.TryCatch.Inner.State(_OWORD *a1, _OWORD *a2)
{
  if (a1 == a2) {
    return a1;
  }
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  if (*(_DWORD *)(v5 + 84)) {
    size_t v6 = *(void *)(v5 + 64);
  }
  else {
    size_t v6 = *(void *)(v5 + 64) + 1LL;
  }
  if (v6 <= 0x28) {
    uint64_t v7 = 40LL;
  }
  else {
    uint64_t v7 = v6;
  }
  char v8 = 8 * v7;
  unsigned int v9 = ((1 << v8) + 1) >> v8;
  if (v9 > 0xFFFC)
  {
    unsigned int v10 = *(_DWORD *)((char *)a1 + v7);
    if (v10 < 3) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }

  if (v9 <= 0xFC)
  {
LABEL_11:
    unsigned int v10 = *((unsigned __int8 *)a1 + v7);
    if (v10 < 3) {
      goto LABEL_20;
    }
LABEL_16:
    else {
      uint64_t v11 = 4LL;
    }
    __asm { BR              X12 }
  }

  unsigned int v10 = *(unsigned __int16 *)((char *)a1 + v7);
  if (v10 >= 3) {
    goto LABEL_16;
  }
LABEL_20:
  if (v10 == 2 || v10 == 1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }

  else
  {
  }

  unsigned int v12 = ((1 << v8) + 1) >> v8;
  if (v12 > 0xFFFC)
  {
    unsigned int v13 = *(_DWORD *)((char *)a2 + v7);
    if (v13 < 3) {
      goto LABEL_38;
    }
    goto LABEL_34;
  }

  if (v12 <= 0xFC)
  {
LABEL_29:
    unsigned int v13 = *((unsigned __int8 *)a2 + v7);
    if (v13 < 3) {
      goto LABEL_38;
    }
LABEL_34:
    else {
      uint64_t v14 = 4LL;
    }
    __asm { BR              X12 }
  }

  unsigned int v13 = *(unsigned __int16 *)((char *)a2 + v7);
  if (v13 >= 3) {
    goto LABEL_34;
  }
LABEL_38:
  if (v13 != 2)
  {
    if (v13 != 1)
    {
      if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v5 + 48))(a2, 1LL, AssociatedTypeWitness))
      {
        memcpy(a1, a2, v6);
      }

      else
      {
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
        (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0LL, 1LL, AssociatedTypeWitness);
        if (v7 > 3)
        {
LABEL_54:
          *((_BYTE *)a1 + (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v3, *(void *)(v10 - 144), v7) = 0;
          return a1;
        }
      }

      unsigned int v20 = ((1 << v8) + 1) >> v8;
      if (v20 > 0xFFFC)
      {
        *(_DWORD *)((char *)a1 + (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v3, *(void *)(v10 - 144), v7) = 0;
        return a1;
      }

      if (v20 > 0xFC)
      {
        *(_WORD *)((char *)a1 + (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v3, *(void *)(v10 - 144), v7) = 0;
        return a1;
      }

      goto LABEL_54;
    }

    __int128 v17 = a2[1];
    *a1 = *a2;
    a1[1] = v17;
    *((void *)a1 + 4) = *((void *)a2 + 4);
    int v18 = 1;
    unsigned int v19 = ((1 << v8) + 1) >> v8;
    if (v19 <= 0xFFFC)
    {
      if (v19 <= 0xFC)
      {
LABEL_50:
        *((_BYTE *)a1 + (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v3, *(void *)(v10 - 144), v7) = 1;
        return a1;
      }

uint64_t getEnumTagSinglePayload for Publishers.TryCatch.Inner.State(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  int v5 = *(_DWORD *)(v4 + 84);
  unint64_t v6 = *(void *)(v4 + 64);
  if (!v5) {
    ++v6;
  }
  if (v6 <= 0x28) {
    unint64_t v6 = 40LL;
  }
  if (v6 > 3)
  {
    int v7 = 4;
LABEL_9:
    char v9 = 8;
    goto LABEL_10;
  }

  unsigned int v8 = ((1 << (8 * v6)) + 1) >> (8 * v6);
  if (v8 > 0xFFFC) {
    goto LABEL_13;
  }
  int v7 = v8 + 3;
  if (v8 <= 0xFC) {
    goto LABEL_9;
  }
  char v9 = 16;
LABEL_10:
  unsigned int v10 = (1 << v9) - v7;
  if ((v10 & 0x80000000) == 0)
  {
LABEL_14:
    unsigned int v11 = ((1 << (8 * v6)) + 1) >> (8 * v6);
    uint64_t v12 = 2LL;
    if (v11 > 0xFFFC) {
      uint64_t v12 = 4LL;
    }
    if (v11 > 0xFC) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

void storeEnumTagSinglePayload for Publishers.TryCatch.Inner.State( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  int v7 = *(_DWORD *)(v6 + 84);
  unint64_t v8 = *(void *)(v6 + 64);
  if (!v7) {
    ++v8;
  }
  if (v8 <= 0x28) {
    unint64_t v8 = 40LL;
  }
  char v9 = 8 * v8;
  if (v8 <= 3)
  {
    unsigned int v13 = ((1 << v9) + 1) >> v9;
    if (v13 > 0xFFFC) {
      goto LABEL_14;
    }
    int v10 = v13 + 3;
    if (v13 > 0xFC)
    {
      char v11 = 16;
LABEL_8:
      unsigned int v12 = (1 << v11) - v10;
      if ((v12 & 0x80000000) == 0)
      {
LABEL_15:
        unsigned int v14 = ((1 << v9) + 1) >> v9;
        uint64_t v15 = 2LL;
        if (v14 > 0xFFFC) {
          uint64_t v15 = 4LL;
        }
        if (v14 > 0xFC)
        {
LABEL_19:
          size_t v16 = v15 + v8;
          if (a3 <= v12)
          {
            unsigned int v17 = 0u;
          }

          else if (v16 <= 3)
          {
            unsigned int v19 = ((a3 - v12 + ~(-1 << (8 * v16))) >> (8 * v16)) + 1;
            if (HIWORD(v19))
            {
              unsigned int v17 = 4u;
            }

            else if (v19 >= 0x100)
            {
              unsigned int v17 = 2;
            }

            else
            {
              unsigned int v17 = v19 > 1;
            }
          }

          else
          {
            unsigned int v17 = 1u;
          }

          if (v12 < a2)
          {
            int v18 = ~v12 + a2;
            if (v16 < 4)
            {
              if ((_DWORD)v16)
              {
                int v20 = v18 & ~(-1 << (8 * v16));
                bzero(a1, v16);
                if ((_DWORD)v16 == 3)
                {
                  *(_WORD *)a1 = v20;
                  a1[2] = BYTE2(v20);
                }

                else if ((_DWORD)v16 == 2)
                {
                  *(_WORD *)a1 = v20;
                }

                else
                {
                  *a1 = v20;
                }
              }
            }

            else
            {
              bzero(a1, v16);
              *(_DWORD *)a1 = v18;
            }

            __asm { BR              X10 }
          }

          __asm { BR              X12 }
        }

LABEL_14:
      unsigned int v12 = 0x7FFFFFFF;
      goto LABEL_15;
    }
  }

  else
  {
    int v10 = 4;
  }

  char v11 = 8;
  goto LABEL_8;
}

uint64_t getEnumTag for Publishers.TryCatch.Inner.State(uint64_t a1)
{
  uint64_t v2 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  int v3 = *(_DWORD *)(v2 + 84);
  unint64_t v4 = *(void *)(v2 + 64);
  if (!v3) {
    ++v4;
  }
  if (v4 <= 0x28) {
    unint64_t v4 = 40LL;
  }
  unsigned int v6 = ((1 << (8 * v4)) + 1) >> (8 * v4);
  if (v6 > 0xFFFC)
  {
    uint64_t result = *(unsigned int *)(a1 + v4);
  }

  else
  {
    if (v6 <= 0xFC)
    {
LABEL_6:
      uint64_t result = *(unsigned __int8 *)(a1 + v4);
      goto LABEL_11;
    }

    uint64_t result = *(unsigned __int16 *)(a1 + v4);
  }

uint64_t destructiveInjectEnumTag for Publishers.TryCatch.Inner.State(_BYTE *a1, unsigned int a2)
{
  uint64_t result = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(result - 8);
  int v6 = *(_DWORD *)(v5 + 84);
  unint64_t v7 = *(void *)(v5 + 64);
  if (!v6) {
    ++v7;
  }
  if (v7 <= 0x28) {
    size_t v8 = 40LL;
  }
  else {
    size_t v8 = v7;
  }
  if (a2 > 2)
  {
    unsigned int v9 = a2 - 3;
    if (v8 < 4)
    {
      int v11 = (v9 >> (8 * v8)) + 3;
      unsigned int v12 = (int *)&a1[v8];
      unsigned int v13 = ((1 << (8 * v8)) + 1) >> (8 * v8);
      if (v13 > 0xFFFC)
      {
        int *v12 = v11;
      }

      else if (v13 > 0xFC)
      {
        *(_WORD *)unsigned int v12 = v11;
      }

      else
      {
        *(_BYTE *)unsigned int v12 = v11;
      }
    }

    else
    {
      a1[v8] = 3;
    }

    else {
      int v14 = v8;
    }
    bzero(a1, v8);
    __asm { BR              X10 }
  }

  unsigned int v10 = ((1 << (8 * v8)) + 1) >> (8 * v8);
  if (v10 > 0xFFFC)
  {
    *(_DWORD *)&a1[v8] = a2;
  }

  else
  {
    if (v10 <= 0xFC)
    {
LABEL_8:
      a1[v8] = a2;
      return result;
    }

    *(_WORD *)&a1[v8] = a2;
  }

  return result;
}

void type metadata accessor for Publishers.Catch.Inner.CaughtS()
{
}

void type metadata accessor for Publishers.TryCatch.Inner.CaughtS()
{
}

uint64_t associated type witness table accessor for Subscriber.Failure : Error in Publishers.Catch<A, B>.Inner<A1>.CaughtS()
{
  return swift_getAssociatedConformanceWitness();
}

void Publisher.flatMap<A, B>(maxPublishers:_:)( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t a7@<X8>)
{
  v17[1] = a2;
  uint64_t v13 = *(void *)(a3 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v15 = (char *)v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v7, v16);
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(a7, v15, a3);
  __int128 v17[2] = a4;
  v17[3] = a3;
  v17[4] = a6;
  v17[5] = a5;
  type metadata accessor for Publishers.FlatMap();
}

uint64_t sub_183B9444C(uint64_t a1)
{
  *(void *)(v3 + *(int *)(a1 + 52)) = v2;
  uint64_t v5 = (void *)(v3 + *(int *)(a1 + 56));
  *uint64_t v5 = *(void *)(v4 - 120);
  v5[1] = v1;
  return swift_retain();
}

void Publishers.FlatMap.init(upstream:maxPublishers:transform:)( uint64_t a1@<X0>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
}

uint64_t sub_183B944F4(uint64_t result)
{
  *(void *)(v4 + *(int *)(result + 52)) = v3;
  uint64_t v5 = (void *)(v4 + *(int *)(result + 56));
  *uint64_t v5 = v2;
  v5[1] = v1;
  return result;
}

void type metadata accessor for Publishers.FlatMap()
{
}

void Publisher<>.flatMap<A>(maxPublishers:_:)()
{
}

void sub_183B945C4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v15 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.SetFailureType<A, B>, a1);
  Publisher.flatMap<A, B>(maxPublishers:_:)( *(void *)(v12 - 136),  *(void *)(v12 - 128),  a1,  v10,  v15,  v9,  *(void *)(v12 - 144));
}

uint64_t sub_183B9463C()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

void Publisher<>.flatMap<A>(maxPublishers:_:)( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  v17[1] = a2;
  uint64_t v13 = *(void *)(a3 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v15 = (char *)v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v7, v16);
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(a7, v15, a3);
  __int128 v17[2] = a4;
  v17[3] = a3;
  v17[4] = a6;
  v17[5] = a5;
  type metadata accessor for Publishers.FlatMap();
}

uint64_t sub_183B94714(uint64_t a1)
{
  *(void *)(v3 + *(int *)(a1 + 52)) = v2;
  uint64_t v5 = (void *)(v3 + *(int *)(a1 + 56));
  *uint64_t v5 = *(void *)(v4 - 120);
  v5[1] = v1;
  return swift_retain();
}

void Publisher.flatMap<A>(maxPublishers:_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = (void *)swift_allocObject();
  void v13[2] = a4;
  void v13[3] = a5;
  v13[4] = a6;
  v13[5] = a7;
  v13[6] = a2;
  v13[7] = a3;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  type metadata accessor for Publishers.SetFailureType();
}

void sub_183B94814(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.SetFailureType<A, B>, a1);
  Publisher.flatMap<A, B>(maxPublishers:_:)( v1,  (uint64_t)partial apply for closure #1 in Publisher.flatMap<A>(maxPublishers:_:),  v3,  a1,  v2,  v6,  v4);
}

uint64_t sub_183B94854()
{
  return swift_release();
}

uint64_t closure #1 in Publisher.flatMap<A>(maxPublishers:_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X4>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = MEMORY[0x1895F8858](a1);
  size_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v9(v6);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  Publisher<>.setFailureType<A>(to:)(a2, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, a2);
}

uint64_t sub_183B94980()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in Publisher.flatMap<A>(maxPublishers:_:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return closure #1 in Publisher.flatMap<A>(maxPublishers:_:)(a1, *(void *)(v2 + 24), a2);
}

uint64_t Publishers.FlatMap.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) - 8LL) + 16LL))(a2, v2);
}

uint64_t Publishers.FlatMap.maxPublishers.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 52));
}

uint64_t Publishers.FlatMap.transform.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 56));
  swift_retain();
  return v2;
}

void Publishers.FlatMap.receive<A>(subscriber:)(uint64_t a1)
{
}

uint64_t sub_183B94A90(uint64_t a1)
{
  uint64_t v10 = *(int *)(v2 + 56);
  uint64_t v11 = *(void *)(v1 + *(int *)(v2 + 52));
  uint64_t v13 = *(void *)(v1 + v10);
  uint64_t v12 = *(void *)(v1 + v10 + 8);
  swift_allocObject();
  swift_retain();
  uint64_t v14 = Publishers.FlatMap.Outer.init(downstream:maxPublishers:map:)(v7, v11, v13, v12);
  *(void *)(v8 - 104) = a1;
  *(void *)(v8 - 96) = &protocol witness table for Publishers.FlatMap<A, B>.Outer<A1>;
  *(void *)(v8 - 128) = v14;
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);
  swift_retain();
  v15(v8 - 128, v5, v4);
  __swift_destroy_boxed_opaque_existential_1(v8 - 128);
  *(void *)(v8 - 128) = v14;
  uint64_t v16 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.FlatMap<A, B>.Outer<A1>, a1);
  Publisher.subscribe<A>(_:)(v8 - 128, *(void *)(v8 - 136), a1, *(void *)(v8 - 144), v16);
  return swift_release();
}

void type metadata accessor for Publishers.FlatMap.Outer()
{
}

uint64_t *Publishers.FlatMap.Outer.__allocating_init(downstream:maxPublishers:map:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.FlatMap.Outer.init(downstream:maxPublishers:map:)(a1, a2, a3, a4);
}

void Publishers.FlatMap.Outer.Side.customMirror.getter()
{
  uint64_t v0 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1895F8858](v0);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1895F8858](v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = xmmword_183B9D5B0;
  *(void *)(v2 + 32) = 0xD000000000000012LL;
  *(void *)(v2 + 40) = 0x8000000183BA8110LL;
  *(void *)(v2 + 72) = &type metadata for CombineIdentifier;
  type metadata accessor for Publishers.FlatMap.Outer();
}

uint64_t sub_183B94CF0()
{
  uint64_t v3 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56LL))(v2, 1LL, 1LL, v3);
  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)(v1);
  swift_retain();
  return Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
}

void Publishers.FlatMap.Outer.Side.playgroundDescription.getter(void *a1@<X8>)
{
  a1[3] = MEMORY[0x189617FA8];
  *a1 = 0x70614D74616C46LL;
  a1[1] = 0xE700000000000000LL;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.FlatMap<A, B>.Outer<A1>.Side()
{
  return 0x70614D74616C46LL;
}

uint64_t *Publishers.FlatMap.Outer.init(downstream:maxPublishers:map:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  uint64_t v10 = (_DWORD *)swift_slowAlloc();
  _DWORD *v10 = 0;
  _OWORD v4[2] = (uint64_t)v10;
  *(_OWORD *)(v4 + 3) = 0u;
  *(_OWORD *)(v4 + 5) = 0u;
  v4[7] = 0LL;
  uint64_t v11 = (void *)swift_slowAlloc();
  void *v11 = 0LL;
  v4[8] = (uint64_t)v11;
  *(uint64_t *)((char *)v4 + *(void *)(*v4 + 160)) = 0LL;
  *((_BYTE *)v4 + *(void *)(*v4 + 168)) = 0;
  *((_BYTE *)v4 + *(void *)(*v4 + 176)) = 0;
  uint64_t v12 = *(void *)(*v4 + 184);
  *(uint64_t *)((char *)v4 + v12) = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x18961AFE8]);
  *(uint64_t *)((char *)v4 + *(void *)(*v4 + 192)) = 0LL;
  *(uint64_t *)((char *)v4 + *(void *)(*v4 + 200)) = 0LL;
  uint64_t v13 = *(void *)(*v4 + 208);
  swift_getAssociatedTypeWitness();
  swift_getTupleTypeMetadata2();
  *(uint64_t *)((char *)v4 + v13) = static Array._allocateUninitialized(_:)();
  *((_BYTE *)v4 + *(void *)(*v4 + (*(void (**)(uint64_t, void, void))(*(void *)(v3 - 240) + 16LL))( v1,  *(void *)(v3 - 192),  *(void *)(v3 - 232)) = 0;
  *((_BYTE *)v4 + *(void *)(*v4 + 240)) = 0;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v9 + 96) - 8LL) + 32LL))( (uint64_t)v4 + *(void *)(*v4 + 152),  a1);
  *(uint64_t *)((char *)v4 + *(void *)(*v4 + 216)) = a2;
  uint64_t v14 = (uint64_t *)((char *)v4 + *(void *)(*v4 + 224));
  void *v14 = a3;
  v14[1] = a4;
  return v4;
}

char *Publishers.FlatMap.Outer.deinit()
{
  uint64_t v1 = *(void *)v0;
  MEMORY[0x186E22A2C](*((void *)v0 + 2), -1LL, -1LL);
  MEMORY[0x186E22A2C](*((void *)v0 + 8), -1LL, -1LL);
  outlined destroy of Subscription?((uint64_t)(v0 + 24));
  (*(void (**)(char *))(*(void *)(*(void *)(v1 + 96) - 8LL) + 8LL))(&v0[*(void *)(*(void *)v0 + 152LL)]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t Publishers.FlatMap.Outer.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t Publishers.FlatMap.Outer.receive(subscription:)(void *a1)
{
  uint64_t v3 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v3);
  swift_beginAccess();
  outlined init with copy of Any?( (uint64_t)(v1 + 3),  (uint64_t)v10,  &demangling cache variable for type metadata for Subscription?);
  uint64_t v4 = v11;
  outlined destroy of Subscription?((uint64_t)v10);
  if (v4 || *((_BYTE *)v1 + *(void *)(*v1 + 232LL)) == 1)
  {
    os_unfair_lock_unlock(v3);
    uint64_t v6 = a1[3];
    uint64_t v5 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v6);
    return (*(uint64_t (**)(uint64_t))(*(void *)(v5 + 8) + 8LL))(v6);
  }

  else
  {
    outlined init with copy of Subscription((uint64_t)a1, (uint64_t)v10);
    swift_beginAccess();
    outlined assign with take of Subscription?((uint64_t)v10, (uint64_t)(v1 + 3));
    swift_endAccess();
    os_unfair_lock_unlock(v3);
    uint64_t v8 = a1[3];
    uint64_t v9 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v8);
    return (*(uint64_t (**)(void, uint64_t, uint64_t))(v9 + 24))( *(void *)((char *)v1 + *(void *)(*v1 + 216LL)),  v8,  v9);
  }

void Publishers.FlatMap.Outer.receive(completion:)(uint64_t a1)
{
  uint64_t v63 = a1;
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 104LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v7 = (char *)v53 - v6;
  uint64_t v59 = v3;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v10 = type metadata accessor for Subscribers.Completion(0LL, AssociatedTypeWitness, AssociatedConformanceWitness, v9);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1895F8858](v10);
  uint64_t v60 = (char *)v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v12);
  uint64_t v15 = (char *)v53 - v14;
  os_unfair_lock_t v62 = (os_unfair_lock_t)v1[2];
  os_unfair_lock_lock(v62);
  uint64_t v68 = 0LL;
  memset(v67, 0, sizeof(v67));
  swift_beginAccess();
  uint64_t v16 = v1;
  outlined assign with take of Subscription?((uint64_t)v67, (uint64_t)(v1 + 3));
  swift_endAccess();
  *((_BYTE *)v1 + *(void *)(*v1 + 240LL)) = 1;
  uint64_t v61 = v11;
  unsigned int v17 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v18 = v63;
  uint64_t v63 = v10;
  v17(v15, v18, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v15, 1LL, AssociatedTypeWitness) == 1)
  {
    uint64_t v19 = *(void *)(*v1 + 232LL);
    if ((*((_BYTE *)v1 + v19) & 1) != 0) {
      goto LABEL_6;
    }
    uint64_t v20 = v2;
    char v21 = (void *)((char *)v1 + *(void *)(*v1 + 208LL));
    swift_beginAccess();
    *(void *)&__int128 v64 = *v21;
    swift_getAssociatedTypeWitness();
    swift_getTupleTypeMetadata2();
    uint64_t v22 = type metadata accessor for Array();
    MEMORY[0x186E22960](MEMORY[0x189618488], v22);
    if ((Collection.isEmpty.getter() & 1) == 0) {
      goto LABEL_6;
    }
    unsigned int v23 = (char *)v1 + *(void *)(*v1 + 184LL);
    swift_beginAccess();
    uint64_t v24 = *(void *)(*(void *)v23 + 16LL);
    uint64_t v25 = *(void *)((char *)v16 + *(void *)(*v16 + 200LL));
    BOOL v26 = __OFADD__(v24, v25);
    uint64_t v27 = v24 + v25;
    if (v26) {
      goto LABEL_38;
    }
    if (v27)
    {
LABEL_6:
      os_unfair_lock_unlock(v62);
    }

    else
    {
      *((_BYTE *)v16 + v19) = 1;
      os_unfair_lock_unlock(v62);
      os_unfair_recursive_lock_lock_with_options();
      uint64_t v52 = v60;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v60, 1LL, 1LL, AssociatedTypeWitness);
      (*(void (**)(char *, void))(*(void *)(v20 + 120) + 56LL))(v52, *(void *)(v20 + 96));
      (*(void (**)(char *, uint64_t))(v61 + 8))(v52, v63);
      os_unfair_recursive_lock_unlock();
    }
  }

  else
  {
    uint64_t v54 = v2;
    uint64_t v58 = v5;
    char v28 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    uint64_t v57 = v7;
    uint64_t v59 = AssociatedTypeWitness;
    v28(v7, v15, AssociatedTypeWitness);
    uint64_t v29 = *(void *)(*v1 + 232LL);
    int v56 = *((unsigned __int8 *)v1 + v29);
    *((_BYTE *)v1 + v29) = 1;
    uint64_t v30 = *(void *)(*v1 + 184LL);
    v53[1] = v1;
    uint64_t v31 = (void *)((char *)v1 + v30);
    swift_beginAccess();
    __int128 v55 = v31;
    unint64_t v32 = *v31;
    uint64_t v33 = *v31 + 64;
    uint64_t v34 = 1LL << *(_BYTE *)(*v31 + 32);
    uint64_t v35 = -1LL;
    if (v34 < 64) {
      uint64_t v35 = ~(-1LL << v34);
    }
    unint64_t v36 = v35 & *(void *)(*v31 + 64);
    int64_t v37 = (unint64_t)(v34 + 63) >> 6;
    v53[0] = v37 - 1;
    swift_bridgeObjectRetain();
    int64_t v38 = 0LL;
    if (!v36) {
      goto LABEL_14;
    }
LABEL_12:
    unint64_t v41 = __clz(__rbit64(v36));
    v36 &= v36 - 1;
    unint64_t v42 = v41 | (v38 << 6);
LABEL_13:
    uint64_t v43 = *(void *)(v32 + 56);
    *(void *)&__int128 v64 = *(void *)(*(void *)(v32 + 48) + 8 * v42);
    outlined init with copy of Subscription(v43 + 40 * v42, (uint64_t)&v64 + 8);
    while (1)
    {
      outlined init with take of (key: Int, value: Subscription)?((uint64_t)&v64, (uint64_t)v67);
      if (!v68)
      {
        swift_release();
        unint64_t v47 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x18961AFE8]);
        *__int128 v55 = v47;
        swift_bridgeObjectRelease();
        os_unfair_lock_unlock(v62);
        uint64_t v49 = v58;
        uint64_t v48 = v59;
        uint64_t v50 = v57;
        if ((v56 & 1) == 0)
        {
          os_unfair_recursive_lock_lock_with_options();
          uint64_t v51 = v60;
          (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v60, v50, v48);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v49 + 56))(v51, 0LL, 1LL, v48);
          (*(void (**)(char *, void))(*(void *)(v54 + 120) + 56LL))(v51, *(void *)(v54 + 96));
          (*(void (**)(char *, uint64_t))(v61 + 8))(v51, v63);
          os_unfair_recursive_lock_unlock();
        }

        (*(void (**)(char *, uint64_t))(v49 + 8))(v50, v48);
        return;
      }

      outlined init with take of Subscription((__int128 *)((char *)v67 + 8), (uint64_t)&v64);
      uint64_t v40 = *((void *)&v65 + 1);
      uint64_t v39 = v66;
      __swift_project_boxed_opaque_existential_1(&v64, *((uint64_t *)&v65 + 1));
      (*(void (**)(uint64_t))(*(void *)(v39 + 8) + 8LL))(v40);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
      if (v36) {
        goto LABEL_12;
      }
LABEL_14:
      int64_t v44 = v38 + 1;
      if (__OFADD__(v38, 1LL)) {
        break;
      }
      if (v44 < v37)
      {
        unint64_t v45 = *(void *)(v33 + 8 * v44);
        if (v45) {
          goto LABEL_17;
        }
        int64_t v46 = v38 + 2;
        ++v38;
        if (v44 + 1 < v37)
        {
          unint64_t v45 = *(void *)(v33 + 8 * v46);
          if (v45) {
            goto LABEL_20;
          }
          int64_t v38 = v44 + 1;
          if (v44 + 2 < v37)
          {
            unint64_t v45 = *(void *)(v33 + 8 * (v44 + 2));
            if (v45)
            {
              v44 += 2LL;
              goto LABEL_17;
            }

            int64_t v46 = v44 + 3;
            int64_t v38 = v44 + 2;
            if (v44 + 3 < v37)
            {
              unint64_t v45 = *(void *)(v33 + 8 * v46);
              if (!v45)
              {
                while (1)
                {
                  int64_t v44 = v46 + 1;
                  if (__OFADD__(v46, 1LL)) {
                    goto LABEL_39;
                  }
                  if (v44 >= v37)
                  {
                    int64_t v38 = v53[0];
                    goto LABEL_31;
                  }

                  unint64_t v45 = *(void *)(v33 + 8 * v44);
                  ++v46;
                  if (v45) {
                    goto LABEL_17;
                  }
                }
              }

void Publishers.FlatMap.Outer.request(_:)(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v97 = *v2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v89 = AssociatedTypeWitness;
  uint64_t v88 = type metadata accessor for Subscribers.Completion(0LL, AssociatedTypeWitness, AssociatedConformanceWitness, v6);
  uint64_t v87 = *(void *)(v88 - 8);
  MEMORY[0x1895F8858](v88);
  v86 = (char *)&v83 - v7;
  uint64_t v8 = swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v10 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v11 = MEMORY[0x1895F8858](TupleTypeMetadata2);
  Swift::Bool IsNativeType = (uint64_t *)((char *)&v83 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v14 = MEMORY[0x1895F8858](v11);
  uint64_t v16 = (uint64_t *)((char *)&v83 - v15);
  uint64_t v85 = v17;
  MEMORY[0x1895F8858](v14);
  uint64_t v19 = (uint64_t *)((char *)&v83 - v18);
  if (a1 != 0x8000000000000000LL)
  {
    if ((a1 & 0x8000000000000000LL) != 0) {
      goto LABEL_103;
    }
    if (!a1)
    {
LABEL_104:
      __break(1u);
LABEL_105:
      __break(1u);
      goto LABEL_106;
    }
  }

  uint64_t v20 = v2[8];
  os_unfair_recursive_lock_lock_with_options();
  v94 = *(char **)(*v2 + 168LL);
  char v21 = v94[(void)v2];
  uint64_t v95 = v20;
  os_unfair_recursive_lock_unlock();
  os_unfair_lock_t v98 = (os_unfair_lock_t)v2[2];
  os_unfair_lock_lock(v98);
  uint64_t v22 = (void *)*v2;
  if ((v21 & 1) != 0)
  {
    uint64_t v23 = v22[20];
    uint64_t v24 = *(void *)((char *)v2 + v23);
    unint64_t v25 = 0x8000000000000000LL;
    BOOL v26 = v98;
    if (v24 == 0x8000000000000000LL)
    {
LABEL_58:
      os_unfair_lock_unlock(v26);
      return;
    }

    if (a1 == 0x8000000000000000LL)
    {
LABEL_57:
      *(void *)((char *)v2 + v23) = v25;
      goto LABEL_58;
    }

    if (((v24 | a1) & 0x8000000000000000LL) == 0)
    {
      unint64_t v25 = v24 + a1;
      if (__OFADD__(v24, a1))
      {
        unint64_t v25 = 0x8000000000000000LL;
      }

      else if ((v25 & 0x8000000000000000LL) != 0)
      {
        goto LABEL_109;
      }

      goto LABEL_57;
    }

LABEL_110:
              __break(1u);
LABEL_111:
              __break(1u);
              goto LABEL_112;
            }

LABEL_108:
            __break(1u);
LABEL_109:
            __break(1u);
            goto LABEL_110;
          }

LABEL_61:
          uint64_t v51 = (void *)((char *)v2 + v22[26]);
          uint64_t v52 = v22[19];
          uint64_t v53 = v22[23];
          uint64_t v91 = (_BYTE *)v22[22];
          swift_beginAccess();
          uint64_t v54 = type metadata accessor for Array();
          *(void *)&v102[0] = *v51;
          MEMORY[0x186E22960](MEMORY[0x189618488], v54);
          if ((Collection.isEmpty.getter() & 1) != 0)
          {
LABEL_62:
            uint64_t v55 = v84;
            if ((*((_BYTE *)v2 + v84) & 1) == 0 && *((_BYTE *)v2 + *(void *)(*v2 + 240LL)) == 1)
            {
              int v56 = (void *)((char *)v2 + *(void *)(*v2 + 208LL));
              swift_beginAccess();
              *(void *)&__int128 v99 = *v56;
              uint64_t v57 = type metadata accessor for Array();
              MEMORY[0x186E22960](MEMORY[0x189618488], v57);
              if ((Collection.isEmpty.getter() & 1) != 0)
              {
                uint64_t v58 = (char *)v2 + *(void *)(*v2 + 184LL);
                swift_beginAccess();
                uint64_t v59 = *(void *)(*(void *)v58 + 16LL);
                uint64_t v60 = *(void *)((char *)v2 + *(void *)(*v2 + 200LL));
                BOOL v61 = __OFADD__(v59, v60);
                uint64_t v62 = v59 + v60;
                if (v61) {
                  goto LABEL_111;
                }
                if (!v62)
                {
                  *((_BYTE *)v2 + v55) = 1;
                  os_unfair_lock_unlock(v98);
                  os_unfair_recursive_lock_lock_with_options();
                  uint64_t v82 = v86;
                  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v89 - 8) + 56LL))(v86, 1LL, 1LL);
                  (*(void (**)(char *, void))(*(void *)(v97 + 120) + 56LL))(v82, *(void *)(v97 + 96));
                  (*(void (**)(char *, uint64_t))(v87 + 8))(v82, v88);
                  os_unfair_recursive_lock_unlock();
                  return;
                }
              }
            }

LABEL_53:
      unint64_t v41 = 0LL;
      __int128 v100 = 0u;
      __int128 v101 = 0u;
      __int128 v99 = 0u;
    }

    unint64_t v49 = *(void *)&v94[8 * v50];
    if (v49)
    {
LABEL_42:
      int64_t v48 = v50;
LABEL_39:
      unint64_t v41 = (v49 - 1) & v49;
      unint64_t v46 = __clz(__rbit64(v49)) + (v48 << 6);
      int64_t v37 = v48;
      continue;
    }

    break;
  }

  while (1)
  {
    int64_t v48 = v50 + 1;
    if (__OFADD__(v50, 1LL)) {
      break;
    }
    if (v48 >= v42)
    {
      int64_t v37 = (int64_t)v93;
      goto LABEL_53;
    }

    unint64_t v49 = *(void *)&v94[8 * v48];
    ++v50;
    if (v49) {
      goto LABEL_39;
    }
  }

void Publishers.FlatMap.Outer.cancel()()
{
  uint64_t v1 = (os_unfair_lock_s *)v0[2];
  os_unfair_lock_lock(v1);
  uint64_t v2 = *(void *)(*v0 + 232LL);
  if ((*((_BYTE *)v0 + v2) & 1) != 0)
  {
    os_unfair_lock_unlock(v1);
    return;
  }

  *((_BYTE *)v0 + (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v6, v2) = 1;
  uint64_t v3 = (void *)((char *)v0 + *(void *)(*v0 + 184LL));
  swift_beginAccess();
  unint64_t v4 = *v3;
  *uint64_t v3 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x18961AFE8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = (uint64_t)(v0 + 3);
  swift_beginAccess();
  outlined init with copy of Any?(v5, (uint64_t)v28, &demangling cache variable for type metadata for Subscription?);
  uint64_t v27 = 0LL;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  swift_beginAccess();
  outlined assign with take of Subscription?((uint64_t)&v25, v5);
  swift_endAccess();
  os_unfair_lock_unlock(v1);
  int64_t v6 = 0LL;
  unint64_t v7 = v4 + 64;
  uint64_t v8 = 1LL << *(_BYTE *)(v4 + 32);
  uint64_t v9 = -1LL;
  if (v8 < 64) {
    uint64_t v9 = ~(-1LL << v8);
  }
  unint64_t v10 = v9 & *(void *)(v4 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  if (!v10) {
    goto LABEL_10;
  }
LABEL_8:
  unint64_t v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  unint64_t v15 = v14 | (v6 << 6);
  while (2)
  {
    uint64_t v16 = *(void *)(v4 + 56);
    *(void *)&__int128 v22 = *(void *)(*(void *)(v4 + 48) + 8 * v15);
    outlined init with copy of Subscription(v16 + 40 * v15, (uint64_t)&v22 + 8);
    while (1)
    {
      outlined init with take of (key: Int, value: Subscription)?((uint64_t)&v22, (uint64_t)&v25);
      if (!v27)
      {
        swift_release();
        outlined init with copy of Any?( (uint64_t)v28,  (uint64_t)&v25,  &demangling cache variable for type metadata for Subscription?);
        uint64_t v20 = *((void *)&v26 + 1);
        if (*((void *)&v26 + 1))
        {
          uint64_t v21 = v27;
          __swift_project_boxed_opaque_existential_1(&v25, *((uint64_t *)&v26 + 1));
          (*(void (**)(uint64_t))(*(void *)(v21 + 8) + 8LL))(v20);
          outlined destroy of Subscription?((uint64_t)v28);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
        }

        else
        {
          outlined destroy of Subscription?((uint64_t)v28);
          outlined destroy of Subscription?((uint64_t)&v25);
        }

        return;
      }

      outlined init with take of Subscription((__int128 *)((char *)&v25 + 8), (uint64_t)&v22);
      uint64_t v13 = *((void *)&v23 + 1);
      uint64_t v12 = v24;
      __swift_project_boxed_opaque_existential_1(&v22, *((uint64_t *)&v23 + 1));
      (*(void (**)(uint64_t))(*(void *)(v12 + 8) + 8LL))(v13);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
      if (v10) {
        goto LABEL_8;
      }
LABEL_10:
      int64_t v17 = v6 + 1;
      if (__OFADD__(v6, 1LL))
      {
        __break(1u);
        goto LABEL_33;
      }

      if (v17 < v11)
      {
        unint64_t v18 = *(void *)(v7 + 8 * v17);
        if (v18) {
          goto LABEL_13;
        }
        int64_t v19 = v6 + 2;
        ++v6;
        if (v17 + 1 < v11)
        {
          unint64_t v18 = *(void *)(v7 + 8 * v19);
          if (v18) {
            goto LABEL_16;
          }
          int64_t v6 = v17 + 1;
          if (v17 + 2 < v11)
          {
            unint64_t v18 = *(void *)(v7 + 8 * (v17 + 2));
            if (v18)
            {
              v17 += 2LL;
              goto LABEL_13;
            }

            int64_t v19 = v17 + 3;
            int64_t v6 = v17 + 2;
            if (v17 + 3 < v11) {
              break;
            }
          }
        }
      }

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.FlatMap<A, B>.Outer<A1>( void *a1)
{
  return Publishers.FlatMap.Outer.receive(subscription:)(a1);
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.FlatMap<A, B>.Outer<A1>( uint64_t a1)
{
}

void protocol witness for Subscription.request(_:) in conformance Publishers.FlatMap<A, B>.Outer<A1>( unint64_t a1)
{
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.FlatMap<A, B>.Outer<A1>( void *a1@<X8>)
{
}

void protocol witness for Cancellable.cancel() in conformance Publishers.FlatMap<A, B>.Outer<A1>()
{
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.FlatMap<A, B>( uint64_t a1)
{
}

uint64_t type metadata completion function for Publishers.FlatMap()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.FlatMap(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8LL);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 15) & 0xFFFFFFFFFFFFFFF8LL) + 16 > 0x18)
  {
    uint64_t v9 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }

  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v10 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8LL);
    int64_t v11 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8LL);
    void *v10 = *v11;
    uint64_t v12 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8LL);
    uint64_t v13 = v12[1];
    unint64_t v14 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8LL);
    void *v14 = *v12;
    v14[1] = v13;
  }

  swift_retain();
  return v4;
}

uint64_t destroy for Publishers.FlatMap(uint64_t a1, uint64_t a2)
{
  return swift_release();
}

uint64_t initializeWithCopy for Publishers.FlatMap(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8LL);
  (*(void (**)(void))(v5 + 16))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8LL);
  *int v7 = *v8;
  uint64_t v9 = (void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v10 = (void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for Publishers.FlatMap(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8LL);
  (*(void (**)(void))(v5 + 24))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8LL);
  *int v7 = *v8;
  uint64_t v9 = (void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v10 = (void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for Publishers.FlatMap(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8LL);
  (*(void (**)(void))(v5 + 32))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8LL);
  *int v7 = *v8;
  *(_OWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFF8LL) = *(_OWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8LL);
  return a1;
}

uint64_t assignWithTake for Publishers.FlatMap(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8LL);
  (*(void (**)(void))(v5 + 40))();
  uint64_t v6 = *(void *)(v5 + 64) + 7LL;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8LL);
  *int v7 = *v8;
  *(_OWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8LL) = *(_OWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8LL);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.FlatMap(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v7 = *(void *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      unint64_t v12 = *(void *)((((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8LL) + 15) & 0xFFFFFFFFFFFFF8LL);
      if (v12 >= 0xFFFFFFFF) {
        LODWORD(v12) = -1;
      }
      return (v12 + 1);
    }

    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }

  else
  {
    if (((((((v7 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 15) & 0xFFFFFFFFFFFFFFF8LL) + 16) & 0xFFFFFFF8) != 0) {
      unsigned int v8 = 2;
    }
    else {
      unsigned int v8 = a2 - v6 + 1;
    }
    if (v8 >= 0x10000) {
      unsigned int v9 = 4;
    }
    else {
      unsigned int v9 = 2;
    }
    if (v8 < 0x100) {
      unsigned int v9 = 1;
    }
    if (v8 >= 2) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0LL;
    }
    return ((uint64_t (*)(void))((char *)&loc_183B96B24 + 4 * byte_183BA6F10[v10]))();
  }

void storeEnumTagSinglePayload for Publishers.FlatMap( unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 24) - 8LL);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v5 + 84);
  }
  if (v6 >= a3)
  {
    int v9 = 0u;
    if (a2 <= v6) {
      goto LABEL_17;
    }
  }

  else
  {
    if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v7 = a3 - v6 + 1;
    }
    else {
      unsigned int v7 = 2;
    }
    if (v7 >= 0x10000) {
      int v8 = 4;
    }
    else {
      int v8 = 2;
    }
    if (v7 < 0x100) {
      int v8 = 1;
    }
    if (v7 >= 2) {
      int v9 = v8;
    }
    else {
      int v9 = 0;
    }
    if (a2 <= v6) {
LABEL_17:
    }
      __asm { BR              X12 }
  }

  if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    unsigned int v10 = ~v6 + a2;
    bzero(a1, ((((*(void *)(v5 + 64) + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + 15) & 0xFFFFFFFFFFFFFFF8LL) + 16);
    *a1 = v10;
  }

  __asm { BR              X10 }

void sub_183B96CAC()
{
  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x183B96D2CLL);
}

void sub_183B96CB4(uint64_t a1, int a2)
{
  *(_DWORD *)(v2 + (*(void (**)(uint64_t, void, uint64_t))(v1 + 16))(v0, *(void *)(v9 - 144) + *(int *)(v6 + 52), v3) = 0;
  if (a2) {
    JUMPOUT(0x183B96CBCLL);
  }
  JUMPOUT(0x183B96D2CLL);
}

void sub_183B96D04()
{
  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x183B96D2CLL);
}

void sub_183B96D0C()
{
  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x183B96D2CLL);
}

uint64_t sub_183B96D14(uint64_t a1, int a2, unsigned int a3)
{
  *(_WORD *)(v5 + (*(void (**)(uint64_t, void, uint64_t))(v4 + 16))(v7, *(void *)(v9 - 120), v6) = 0;
  if (!a2) {
    JUMPOUT(0x183B96D2CLL);
  }
  if (a3 < 0x7FFFFFFF)
  {
    if ((a2 & 0x80000000) == 0) {
      JUMPOUT(0x183B96D28LL);
    }
    JUMPOUT(0x183B96D20LL);
  }

  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v5);
}

uint64_t type metadata completion function for Publishers.FlatMap.Outer()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F) {
    return swift_initClassMetadata2();
  }
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  Swift::Int v2 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

{
  uint64_t v2;
  Swift::Int v2 = static Hasher._hash(seed:_:)();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      outlined init with copy of ObservableObjectTable.Storage(*(void *)(v2 + 48) + 16 * v4, (uint64_t)v10);
      uint64_t v7 = v10[1];
      uint64_t v8 = *(void *)(a1 + 8);
      outlined destroy of ObservableObjectTable.Storage((uint64_t)v10);
      if (v7 == v8) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;
  unint64_t v4 = v2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v2 + 32);
  uint64_t result = a2 & ~v5;
  if (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0)
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (uint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0;
            uint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }

  return result;
}

uint64_t outlined init with take of (key: Int, value: Subscription)?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: Int, value: Subscription)?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<Int, Subscription>);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
    for (uint64_t i = a1 + 32; ; i += 48LL)
    {
      outlined init with copy of Any?( i,  (uint64_t)&v11,  &demangling cache variable for type metadata for (Int, Subscription));
      uint64_t v5 = v11;
      unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v11);
      if ((v7 & 1) != 0) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
      *(void *)(v3[6] + 8 * result) = v5;
      unint64_t result = outlined init with take of Subscription(&v12, v3[7] + 40 * result);
      uint64_t v8 = v3[2];
      BOOL v9 = __OFADD__(v8, 1LL);
      uint64_t v10 = v8 + 1;
      if (v9) {
        goto LABEL_10;
      }
      v3[2] = v10;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }

    __break(1u);
LABEL_10:
    __break(1u);
  }

  else
  {
    return MEMORY[0x18961AFF0];
  }

  return result;
}

void Publisher.delay<A>(for:tolerance:scheduler:options:)( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v46 = a4;
  uint64_t v49 = a7;
  uint64_t v51 = a3;
  uint64_t v37 = a2;
  uint64_t v44 = a1;
  uint64_t v47 = a9;
  swift_getAssociatedTypeWitness();
  uint64_t v43 = type metadata accessor for Optional();
  uint64_t v41 = *(void *)(v43 - 8);
  uint64_t v12 = MEMORY[0x1895F8858](v43);
  int64_t v42 = (char *)&v36 - v13;
  uint64_t v48 = a5;
  uint64_t v38 = *(void *)(a5 - 8);
  uint64_t v14 = MEMORY[0x1895F8858](v12);
  uint64_t v40 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = *(void *)(a6 - 8);
  uint64_t v17 = MEMORY[0x1895F8858](v14);
  uint64_t v39 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v17);
  uint64_t v20 = (char *)&v36 - v19;
  swift_getAssociatedTypeWitness();
  uint64_t v50 = a8;
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v22 = type metadata accessor for Optional();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = MEMORY[0x1895F8858](v22);
  __int128 v26 = (char *)&v36 - v25;
  uint64_t v27 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v28 = MEMORY[0x1895F8858](v24);
  unint64_t v36 = (char *)&v36 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v28);
  uint64_t v31 = (char *)&v36 - v30;
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v26, v37, v22);
  uint64_t v32 = v16;
  uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v33(v20, v51, a6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v26, 1LL, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(uint64_t))(v50 + 48))(a6);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v20, a6);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v26, v22);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v32 + 8))(v20, a6);
    (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v31, v26, AssociatedTypeWitness);
  }

  uint64_t v34 = (uint64_t)v40;
  uint64_t v35 = v48;
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v40, v45, v48);
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v36, v44, AssociatedTypeWitness);
  v33(v39, v51, a6);
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v42, v46, v43);
  Publishers.Delay.init(upstream:interval:tolerance:scheduler:options:)(v34, v35, v47);
}

  ;
}

void Publishers.Delay.init(upstream:interval:tolerance:scheduler:options:)( uint64_t a1@<X0>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
}

uint64_t sub_183B9751C(int *a1)
{
  uint64_t v6 = v2 + a1[13];
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32LL);
  v8(v6, v4, AssociatedTypeWitness);
  v8(v2 + a1[14], v3, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v1 - 8) + 32LL))(v2 + a1[15], v12, v1);
  uint64_t v9 = v2 + a1[16];
  swift_getAssociatedTypeWitness();
  uint64_t v10 = type metadata accessor for Optional();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))(v9, v13, v10);
}

void type metadata accessor for Publishers.Delay()
{
}

uint64_t Publishers.Delay.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 16LL))(a2, v2);
}

uint64_t Publishers.Delay.interval.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 52);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16LL))( a2,  v4,  AssociatedTypeWitness);
}

uint64_t Publishers.Delay.tolerance.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 56);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16LL))( a2,  v4,  AssociatedTypeWitness);
}

uint64_t Publishers.Delay.scheduler.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) - 8LL) + 16LL))( a2,  v2 + *(int *)(a1 + 60));
}

uint64_t Publishers.Delay.options.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 64);
  swift_getAssociatedTypeWitness();
  uint64_t v5 = type metadata accessor for Optional();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, v4, v5);
}

void Publishers.Delay.receive<A>(subscriber:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = a4;
  uint64_t v17 = a1;
  uint64_t v6 = a2[5];
  uint64_t v7 = a2[3];
  swift_getAssociatedTypeWitness();
  uint64_t v20 = type metadata accessor for Optional();
  uint64_t v19 = *(void *)(v20 - 8);
  uint64_t v8 = MEMORY[0x1895F8858](v20);
  uint64_t v18 = (char *)v15 - v9;
  void v15[3] = *(void *)(v7 - 8);
  MEMORY[0x1895F8858](v8);
  v15[2] = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v13 = MEMORY[0x1895F8858](v12);
  MEMORY[0x1895F8858](v13);
  uint64_t v14 = a2[2];
  v15[0] = a2[4];
  v15[1] = v14;
  uint64_t v21 = v14;
  uint64_t v22 = v7;
  uint64_t v23 = a3;
  uint64_t v24 = v15[0];
  uint64_t v25 = v6;
  uint64_t v26 = v16;
  type metadata accessor for Publishers.Delay.Inner();
}

uint64_t sub_183B97A18(uint64_t a1)
{
  uint64_t v12 = *(void *)(v10 - 144);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v13(v4, v12 + v2[13], v9);
  v13(v8, v12 + v2[14], v9);
  uint64_t v14 = *(void *)(v10 - 192);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 184) + 16LL))(v14, v12 + v2[15], v3);
  uint64_t v15 = *(void *)(v10 - 160);
  (*(void (**)(uint64_t, uint64_t, void))(*(void *)(v10 - 152) + 16LL))( v15,  v12 + v2[16],  *(void *)(v10 - 136));
  swift_allocObject();
  *(void *)(v10 - 128) = Publishers.Delay.Inner.init(_:interval:tolerance:scheduler:options:)(v6, v4, v8, v14, v15);
  uint64_t v16 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.Delay<A, B>.Inner<A1>, a1);
  Publisher.subscribe<A>(_:)(v10 - 128, *(void *)(v10 - 200), a1, *(void *)(v10 - 208), v16);
  return swift_release();
}

void type metadata accessor for Publishers.Delay.Inner()
{
}

char *Publishers.Delay.Inner.__allocating_init(_:interval:tolerance:scheduler:options:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return Publishers.Delay.Inner.init(_:interval:tolerance:scheduler:options:)(a1, a2, a3, a4, a5);
}

char *Publishers.Delay.Inner.init(_:interval:tolerance:scheduler:options:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *(void *)v5;
  uint64_t v11 = (_DWORD *)swift_slowAlloc();
  _DWORD *v11 = 0;
  *((void *)v5 + 2) = v11;
  uint64_t v12 = &v5[*(void *)(*(void *)v5 + 176LL)];
  *((void *)v12 + 4) = 0LL;
  *(_OWORD *)uint64_t v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  v12[40] = 2;
  uint64_t v13 = *(void *)(*(void *)v5 + 184LL);
  uint64_t v14 = (void *)swift_slowAlloc();
  void *v14 = 0LL;
  *(void *)&v5[v13] = v14;
  (*(void (**)(char *, uint64_t))(*(void *)(*(void *)(v10 + 96) - 8LL) + 32LL))( &v5[*(void *)(*(void *)v5 + 136LL)],  a1);
  uint64_t v15 = &v5[*(void *)(*(void *)v5 + 144LL)];
  uint64_t v16 = *(void *)(v10 + 88);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32LL);
  v18(v15, a2, AssociatedTypeWitness);
  v18(&v5[*(void *)(*(void *)v5 + 152LL)], a3, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32LL))( &v5[*(void *)(*(void *)v5 + 160LL)],  a4,  v16);
  uint64_t v19 = &v5[*(void *)(*(void *)v5 + 168LL)];
  swift_getAssociatedTypeWitness();
  uint64_t v20 = type metadata accessor for Optional();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32LL))(v19, a5, v20);
  return v5;
}

char *Publishers.Delay.Inner.deinit()
{
  uint64_t v1 = *(void *)v0;
  MEMORY[0x186E22A2C](*((void *)v0 + 2), -1LL, -1LL);
  MEMORY[0x186E22A2C](*(void *)&v0[*(void *)(*(void *)v0 + 184LL)], -1LL, -1LL);
  (*(void (**)(char *))(*(void *)(*(void *)(v1 + 96) - 8LL) + 8LL))(&v0[*(void *)(*(void *)v0 + 136LL)]);
  uint64_t v2 = &v0[*(void *)(*(void *)v0 + 144LL)];
  uint64_t v3 = *(void *)(v1 + 88);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8LL);
  v5(v2, AssociatedTypeWitness);
  v5(&v0[*(void *)(*(void *)v0 + 152LL)], AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8LL))(&v0[*(void *)(*(void *)v0 + 160LL)], v3);
  uint64_t v6 = &v0[*(void *)(*(void *)v0 + 168LL)];
  swift_getAssociatedTypeWitness();
  uint64_t v7 = type metadata accessor for Optional();
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8LL))(v6, v7);
  outlined destroy of SubscriptionStatus((uint64_t)&v0[*(void *)(*(void *)v0 + 176LL)]);
  return v0;
}

uint64_t Publishers.Delay.Inner.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t Publishers.Delay.Inner.schedule(immediate:work:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v6 = *v4;
  uint64_t v7 = *(void *)(*v4 + 112);
  uint64_t v8 = *(void *)(*v4 + 88);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v11);
  uint64_t v15 = (char *)&v18 - v14;
  if ((a1 & 1) != 0) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))( (uint64_t)v4 + *(void *)(v6 + 168),  v18,  v19,  v8,  v7);
  }
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v8, v7);
  swift_getAssociatedConformanceWitness();
  dispatch thunk of Strideable.advanced(by:)();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v17(v13, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 64))( v15,  (uint64_t)v4 + *(void *)(*v4 + 152),  (uint64_t)v4 + *(void *)(*v4 + 168),  v18,  v19,  v8,  v7);
  return ((uint64_t (*)(char *, uint64_t))v17)(v15, AssociatedTypeWitness);
}

void Publishers.Delay.Inner.request(_:)(uint64_t a1)
{
  uint64_t v3 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v3);
  uint64_t v4 = (uint64_t)v1 + *(void *)(*v1 + 176LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v4, (uint64_t)v7);
  if (v8)
  {
    outlined destroy of SubscriptionStatus((uint64_t)v7);
    os_unfair_lock_unlock(v3);
  }

  else
  {
    outlined init with take of Subscription(v7, (uint64_t)v9);
    os_unfair_lock_unlock(v3);
    uint64_t v5 = v10;
    uint64_t v6 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24))(a1, v5, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }

void Publishers.Delay.Inner.cancel()()
{
  uint64_t v1 = (os_unfair_lock_s *)v0[2];
  os_unfair_lock_lock(v1);
  uint64_t v2 = (uint64_t)v0 + *(void *)(*v0 + 176LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v2, (uint64_t)&v5);
  if (v8)
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v5);
    os_unfair_lock_unlock(v1);
  }

  else
  {
    outlined init with take of Subscription((__int128 *)&v5, (uint64_t)v9);
    uint64_t v5 = 1LL;
    __int128 v6 = 0u;
    __int128 v7 = 0u;
    char v8 = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v5, v2);
    swift_endAccess();
    os_unfair_lock_unlock(v1);
    uint64_t v3 = v10;
    uint64_t v4 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    (*(void (**)(uint64_t))(*(void *)(v4 + 8) + 8LL))(v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }

uint64_t Publishers.Delay.Inner.receive(subscription:)(void *a1)
{
  uint64_t v3 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v3);
  uint64_t v4 = (uint64_t)v1 + *(void *)(*v1 + 176);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v4, (uint64_t)&v9);
  if (v12 == 2
    && (int8x16_t v5 = vorrq_s8(v10, v11),
        !(*(void *)&vorr_s8(*(int8x8_t *)v5.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL)) | v9)))
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v9);
    outlined init with copy of Subscription((uint64_t)a1, (uint64_t)&v9);
    char v12 = 0;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v9, v4);
    swift_endAccess();
    os_unfair_lock_unlock(v3);
    os_unfair_recursive_lock_lock_with_options();
    closure #1 in Publishers.Delay.Inner.receive(subscription:)((uint64_t)v1 + *(void *)(*v1 + 136), v1);
    return os_unfair_recursive_lock_unlock();
  }

  else
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v9);
    os_unfair_lock_unlock(v3);
    uint64_t v6 = a1[3];
    uint64_t v7 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v6);
    return (*(uint64_t (**)(uint64_t))(*(void *)(v7 + 8) + 8LL))(v6);
  }

uint64_t closure #1 in Publishers.Delay.Inner.receive(subscription:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v7 = *a2;
  char v8 = &protocol witness table for Publishers.Delay<A, B>.Inner<A1>;
  v6[0] = a2;
  uint64_t v2 = *(void *)(v7 + 120);
  uint64_t v3 = *(void (**)(void *, uint64_t, uint64_t))(v2 + 40);
  uint64_t v4 = *(void *)(v7 + 96);
  swift_retain();
  v3(v6, v4, v2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

void Publishers.Delay.Inner.scheduledReceive(_:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v4);
  uint64_t v5 = (uint64_t)v1 + *(void *)(*v1 + 176LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v5, (uint64_t)v20);
  outlined init with copy of SubscriptionStatus((uint64_t)v20, (uint64_t)v18);
  unsigned int v6 = v19;
  outlined destroy of SubscriptionStatus((uint64_t)v18);
  outlined destroy of SubscriptionStatus((uint64_t)v20);
  os_unfair_lock_unlock(v4);
  if (v6 <= 1)
  {
    uint64_t v7 = *(void *)(v3 + 96);
    uint64_t v8 = *(void *)(v3 + 120);
    os_unfair_recursive_lock_lock_with_options();
    uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(a1, v7, v8);
    os_unfair_recursive_lock_unlock();
    if (v9 == 0x8000000000000000LL) {
      goto LABEL_5;
    }
    if (v9 < 0)
    {
      __break(1u);
      return;
    }

    if (v9)
    {
LABEL_5:
      os_unfair_lock_lock(v4);
      outlined init with copy of SubscriptionStatus(v5, (uint64_t)v20);
      outlined init with copy of SubscriptionStatus((uint64_t)v20, (uint64_t)v18);
      if (v19 != 1 && v19)
      {
        uint64_t v14 = 0LL;
        __int128 v12 = 0u;
        __int128 v13 = 0u;
        outlined destroy of SubscriptionStatus((uint64_t)v18);
      }

      else
      {
        outlined init with take of Subscription(v18, (uint64_t)&v12);
      }

      outlined destroy of SubscriptionStatus((uint64_t)v20);
      if (*((void *)&v13 + 1))
      {
        outlined init with take of Subscription(&v12, (uint64_t)v15);
        os_unfair_lock_unlock(v4);
        uint64_t v10 = v16;
        uint64_t v11 = v17;
        __swift_project_boxed_opaque_existential_1(v15, v16);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 24))(v9, v10, v11);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      }

      else
      {
        outlined destroy of Subscription?((uint64_t)&v12);
        os_unfair_lock_unlock(v4);
      }
    }
  }

uint64_t Publishers.Delay.Inner.receive(_:)(uint64_t a1)
{
  uint64_t v3 = (void *)*v1;
  uint64_t v4 = *(void *)(*v1 + 80LL);
  uint64_t v15 = *(void *)(*v1 + 104LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v8 = &v16[-v7 - 8];
  uint64_t v9 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v9);
  uint64_t v10 = (uint64_t)v1 + *(void *)(*v1 + 176LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v10, (uint64_t)v16);
  LODWORD(v10) = v16[40];
  outlined destroy of SubscriptionStatus((uint64_t)v16);
  os_unfair_lock_unlock(v9);
  if (!(_DWORD)v10)
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16))(v8, a1, AssociatedTypeWitness);
    unint64_t v11 = (*(unsigned __int8 *)(v6 + 80) + 72LL) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    __int128 v12 = (char *)swift_allocObject();
    *((void *)v12 + 2) = v4;
    *((void *)v12 + 3) = v3[11];
    uint64_t v13 = v15;
    *((void *)v12 + 4) = v3[12];
    *((void *)v12 + 5) = v13;
    *((void *)v12 + 6) = v3[14];
    *((void *)v12 + 7) = v3[15];
    *((void *)v12 + 8) = v1;
    (*(void (**)(char *, _BYTE *, uint64_t))(v6 + 32))(&v12[v11], v8, AssociatedTypeWitness);
    swift_retain();
    Publishers.Delay.Inner.schedule(immediate:work:)( 0,  (uint64_t)partial apply for closure #1 in Publishers.Delay.Inner.receive(_:),  (uint64_t)v12);
    swift_release();
  }

  return 0LL;
}

void Publishers.Delay.Inner.scheduledReceive(completion:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v4);
  uint64_t v5 = (uint64_t)v1 + *(void *)(*v1 + 176LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v5, (uint64_t)&v10);
  outlined init with copy of SubscriptionStatus((uint64_t)&v10, (uint64_t)v9);
  unsigned int v6 = v9[40];
  outlined destroy of SubscriptionStatus((uint64_t)v9);
  outlined destroy of SubscriptionStatus((uint64_t)&v10);
  if (v6 > 1)
  {
    os_unfair_lock_unlock(v4);
  }

  else
  {
    uint64_t v10 = 1LL;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    char v13 = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v10, v5);
    swift_endAccess();
    os_unfair_lock_unlock(v4);
    uint64_t v7 = *(void *)(v3 + 96);
    uint64_t v8 = *(void *)(v3 + 120);
    os_unfair_recursive_lock_lock_with_options();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 56))(a1, v7, v8);
    os_unfair_recursive_lock_unlock();
  }

void Publishers.Delay.Inner.receive(completion:)(uint64_t a1)
{
  uint64_t v17 = a1;
  uint64_t v2 = (void *)*v1;
  uint64_t v3 = *(void *)(*v1 + 104LL);
  uint64_t v4 = *(void *)(*v1 + 80LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v8 = type metadata accessor for Subscribers.Completion(0LL, AssociatedTypeWitness, AssociatedConformanceWitness, v7);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  __int128 v11 = (char *)v18 - v10 + 16;
  __int128 v12 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v12);
  uint64_t v13 = (uint64_t)v1 + *(void *)(*v1 + 176LL);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v13, (uint64_t)v18);
  if (v19)
  {
    outlined destroy of SubscriptionStatus((uint64_t)v18);
    os_unfair_lock_unlock(v12);
  }

  else
  {
    outlined init with take of Subscription(v18, (uint64_t)v20);
    outlined init with copy of Subscription((uint64_t)v20, (uint64_t)v18);
    char v19 = 1;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)v18, v13);
    swift_endAccess();
    os_unfair_lock_unlock(v12);
    uint64_t v14 = v8;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v17, v8);
    unint64_t v15 = (*(unsigned __int8 *)(v9 + 80) + 72LL) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v16 = (char *)swift_allocObject();
    *((void *)v16 + 2) = v4;
    *((void *)v16 + 3) = v2[11];
    *((void *)v16 + 4) = v2[12];
    *((void *)v16 + 5) = v3;
    *((void *)v16 + 6) = v2[14];
    *((void *)v16 + 7) = v2[15];
    *((void *)v16 + 8) = v1;
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v16[v15], v11, v14);
    swift_retain();
    Publishers.Delay.Inner.schedule(immediate:work:)( 0,  (uint64_t)partial apply for closure #1 in Publishers.Delay.Inner.receive(completion:),  (uint64_t)v16);
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  }

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.Delay<A, B>.Inner<A1>( void *a1)
{
  return Publishers.Delay.Inner.receive(subscription:)(a1);
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance Publishers.Delay<A, B>.Inner<A1>( uint64_t a1)
{
  return Publishers.Delay.Inner.receive(_:)(a1);
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.Delay<A, B>.Inner<A1>( uint64_t a1)
{
}

void protocol witness for Subscription.request(_:) in conformance Publishers.Delay<A, B>.Inner<A1>( uint64_t a1)
{
}

void protocol witness for Cancellable.cancel() in conformance Publishers.Delay<A, B>.Inner<A1>()
{
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Delay<A, B>( uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
}

uint64_t type metadata completion function for Publishers.Delay()
{
  uint64_t AssociatedTypeWitness = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      uint64_t AssociatedTypeWitness = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        swift_getAssociatedTypeWitness();
        uint64_t AssociatedTypeWitness = type metadata accessor for Optional();
        if (v4 <= 0x3F)
        {
          swift_initStructMetadata();
          return 0LL;
        }
      }
    }
  }

  return AssociatedTypeWitness;
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.Delay(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 24);
  uint64_t v45 = *(void *)(a3 + 16);
  uint64_t v46 = *(void *)(v45 - 8);
  uint64_t v4 = *(void *)(v46 + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  int v7 = *(_DWORD *)(v6 + 80);
  uint64_t v39 = v4 + v7;
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v40 = v8 + v7;
  uint64_t v9 = *(void *)(v3 - 8);
  int v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v10;
  uint64_t v41 = v8 + v10;
  unint64_t v12 = (v8 + v11 + ((v40 + (v39 & ~(unint64_t)v7)) & ~(unint64_t)v7)) & ~v11;
  uint64_t v42 = v9;
  uint64_t v43 = AssociatedTypeWitness;
  uint64_t v13 = *(void *)(v9 + 64);
  uint64_t v44 = swift_getAssociatedTypeWitness();
  uint64_t v14 = *(void *)(v44 - 8);
  int v15 = *(_DWORD *)(v14 + 80);
  uint64_t v16 = v15;
  uint64_t v17 = v13 + v15;
  if (*(_DWORD *)(v14 + 84)) {
    uint64_t v18 = *(void *)(v14 + 64);
  }
  else {
    uint64_t v18 = *(void *)(v14 + 64) + 1LL;
  }
  int v19 = v7 | *(_DWORD *)(v46 + 80) | v10 | v15;
  uint64_t v20 = (v7 | *(_BYTE *)(v46 + 80) | v10 | v15);
  int v21 = v19 & 0x100000;
  if (v20 > 7 || v21 != 0 || ((v13 + v16 + v12) & ~v16) + v18 > 0x18)
  {
    uint64_t v24 = *a2;
    *a1 = *a2;
    uint64_t v26 = (uint64_t *)(v24 + ((v20 + 16) & ~v20));
    swift_retain();
  }

  else
  {
    unint64_t v25 = ~(unint64_t)v7;
    size_t __n = v18;
    uint64_t v38 = ~v16;
    uint64_t v26 = a1;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v46 + 16))(a1, a2, v45);
    unint64_t v27 = ((unint64_t)a1 + v39) & v25;
    unint64_t v28 = ((unint64_t)a2 + v39) & v25;
    uint64_t v29 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16);
    v29(v27, v28, v43);
    unint64_t v30 = (v40 + v27) & v25;
    unint64_t v31 = (v40 + v28) & v25;
    v29(v30, v31, v43);
    unint64_t v32 = (v41 + v30) & ~v11;
    unint64_t v33 = (v41 + v31) & ~v11;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v42 + 16))(v32, v33, v3);
    uint64_t v34 = (void *)((v32 + v17) & v38);
    uint64_t v35 = (const void *)((v33 + v17) & v38);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48))(v35, 1LL, v44))
    {
      memcpy(v34, v35, __n);
    }

    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v14 + 16))(v34, v35, v44);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v34, 0LL, 1LL, v44);
    }
  }

  return v26;
}

uint64_t destroy for Publishers.Delay(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8LL);
  (*(void (**)(void))(v4 + 8))();
  uint64_t v5 = *(void *)(v4 + 64) + a1;
  uint64_t v6 = *(void *)(a2 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (v5 + v9) & ~v9;
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v11(v10, AssociatedTypeWitness);
  uint64_t v12 = *(void *)(v8 + 64);
  uint64_t v13 = (v12 + v9 + v10) & ~v9;
  v11(v13, AssociatedTypeWitness);
  uint64_t v14 = *(void *)(v6 - 8);
  unint64_t v15 = (v13 + v12 + *(unsigned __int8 *)(v14 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  (*(void (**)(unint64_t, uint64_t))(v14 + 8))(v15, v6);
  uint64_t v16 = *(void *)(v14 + 64);
  uint64_t v17 = swift_getAssociatedTypeWitness();
  uint64_t v18 = *(void *)(v17 - 8);
  unint64_t v19 = (v15 + v16 + *(unsigned __int8 *)(v18 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v18 + 48))(v19, 1LL, v17);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(unint64_t, uint64_t))(v18 + 8))(v19, v17);
  }
  return result;
}

uint64_t initializeWithCopy for Publishers.Delay(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v6 + 16))();
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = v7 + v11;
  uint64_t v13 = (v7 + v11 + a1) & ~v11;
  uint64_t v14 = (v12 + a2) & ~v11;
  unint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  v15(v13, v14, AssociatedTypeWitness);
  uint64_t v16 = *(void *)(v10 + 64);
  uint64_t v17 = (v16 + v11 + v13) & ~v11;
  uint64_t v18 = (v16 + v11 + v14) & ~v11;
  v15(v17, v18, AssociatedTypeWitness);
  uint64_t v19 = *(void *)(v8 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (v16 + v20 + v17) & ~v20;
  uint64_t v22 = (v16 + v20 + v18) & ~v20;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v21, v22, v8);
  uint64_t v23 = *(void *)(v19 + 64);
  uint64_t v24 = swift_getAssociatedTypeWitness();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(unsigned __int8 *)(v25 + 80);
  unint64_t v27 = (void *)((v23 + v26 + v21) & ~v26);
  unint64_t v28 = (const void *)((v23 + v26 + v22) & ~v26);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v25 + 48))(v28, 1LL, v24))
  {
    if (*(_DWORD *)(v25 + 84)) {
      size_t v29 = *(void *)(v25 + 64);
    }
    else {
      size_t v29 = *(void *)(v25 + 64) + 1LL;
    }
    memcpy(v27, v28, v29);
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v25 + 16))(v27, v28, v24);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v27, 0LL, 1LL, v24);
  }

  return a1;
}

uint64_t assignWithCopy for Publishers.Delay(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v6 + 24))();
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = v7 + v11;
  uint64_t v13 = (v7 + v11 + a1) & ~v11;
  uint64_t v14 = (v12 + a2) & ~v11;
  unint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24);
  v15(v13, v14, AssociatedTypeWitness);
  uint64_t v16 = *(void *)(v10 + 64);
  uint64_t v17 = (v16 + v11 + v13) & ~v11;
  uint64_t v18 = (v16 + v11 + v14) & ~v11;
  v15(v17, v18, AssociatedTypeWitness);
  uint64_t v19 = *(void *)(v8 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (v16 + v20 + v17) & ~v20;
  uint64_t v22 = (v16 + v20 + v18) & ~v20;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 24))(v21, v22, v8);
  uint64_t v23 = *(void *)(v19 + 64);
  uint64_t v24 = swift_getAssociatedTypeWitness();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(unsigned __int8 *)(v25 + 80);
  unint64_t v27 = (void *)((v23 + v26 + v21) & ~v26);
  unint64_t v28 = (void *)((v23 + v26 + v22) & ~v26);
  size_t v29 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v25 + 48);
  LODWORD(v22) = v29(v27, 1LL, v24);
  int v30 = v29(v28, 1LL, v24);
  if ((_DWORD)v22)
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v25 + 16))(v27, v28, v24);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v27, 0LL, 1LL, v24);
      return a1;
    }
  }

  else
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v25 + 24))(v27, v28, v24);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v25 + 8))(v27, v24);
  }

  if (*(_DWORD *)(v25 + 84)) {
    size_t v31 = *(void *)(v25 + 64);
  }
  else {
    size_t v31 = *(void *)(v25 + 64) + 1LL;
  }
  memcpy(v27, v28, v31);
  return a1;
}

uint64_t initializeWithTake for Publishers.Delay(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v6 + 32))();
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = v7 + v11;
  uint64_t v13 = (v7 + v11 + a1) & ~v11;
  uint64_t v14 = (v12 + a2) & ~v11;
  unint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32);
  v15(v13, v14, AssociatedTypeWitness);
  uint64_t v16 = *(void *)(v10 + 64);
  uint64_t v17 = (v16 + v11 + v13) & ~v11;
  uint64_t v18 = (v16 + v11 + v14) & ~v11;
  v15(v17, v18, AssociatedTypeWitness);
  uint64_t v19 = *(void *)(v8 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (v16 + v20 + v17) & ~v20;
  uint64_t v22 = (v16 + v20 + v18) & ~v20;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v21, v22, v8);
  uint64_t v23 = *(void *)(v19 + 64);
  uint64_t v24 = swift_getAssociatedTypeWitness();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(unsigned __int8 *)(v25 + 80);
  unint64_t v27 = (void *)((v23 + v26 + v21) & ~v26);
  unint64_t v28 = (const void *)((v23 + v26 + v22) & ~v26);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v25 + 48))(v28, 1LL, v24))
  {
    if (*(_DWORD *)(v25 + 84)) {
      size_t v29 = *(void *)(v25 + 64);
    }
    else {
      size_t v29 = *(void *)(v25 + 64) + 1LL;
    }
    memcpy(v27, v28, v29);
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v25 + 32))(v27, v28, v24);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v27, 0LL, 1LL, v24);
  }

  return a1;
}

uint64_t assignWithTake for Publishers.Delay(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8LL);
  (*(void (**)(void))(v6 + 40))();
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(void *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = v7 + v11;
  uint64_t v13 = (v7 + v11 + a1) & ~v11;
  uint64_t v14 = (v12 + a2) & ~v11;
  unint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 40);
  v15(v13, v14, AssociatedTypeWitness);
  uint64_t v16 = *(void *)(v10 + 64);
  uint64_t v17 = (v16 + v11 + v13) & ~v11;
  uint64_t v18 = (v16 + v11 + v14) & ~v11;
  v15(v17, v18, AssociatedTypeWitness);
  uint64_t v19 = *(void *)(v8 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (v16 + v20 + v17) & ~v20;
  uint64_t v22 = (v16 + v20 + v18) & ~v20;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 40))(v21, v22, v8);
  uint64_t v23 = *(void *)(v19 + 64);
  uint64_t v24 = swift_getAssociatedTypeWitness();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(unsigned __int8 *)(v25 + 80);
  unint64_t v27 = (void *)((v23 + v26 + v21) & ~v26);
  unint64_t v28 = (void *)((v23 + v26 + v22) & ~v26);
  size_t v29 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v25 + 48);
  LODWORD(v22) = v29(v27, 1LL, v24);
  int v30 = v29(v28, 1LL, v24);
  if ((_DWORD)v22)
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v25 + 32))(v27, v28, v24);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v27, 0LL, 1LL, v24);
      return a1;
    }
  }

  else
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v25 + 40))(v27, v28, v24);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v25 + 8))(v27, v24);
  }

  if (*(_DWORD *)(v25 + 84)) {
    size_t v31 = *(void *)(v25 + 64);
  }
  else {
    size_t v31 = *(void *)(v25 + 64) + 1LL;
  }
  memcpy(v27, v28, v31);
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.Delay(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v39 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v39 - 8);
  unsigned int v6 = *(_DWORD *)(v5 + 84);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  unsigned int v40 = v6;
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = *(void *)(v4 - 8);
  uint64_t v11 = *(unsigned int *)(v10 + 84);
  else {
    unsigned int v12 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v13 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  int v14 = *(_DWORD *)(v13 + 84);
  unsigned int v15 = v14 - 1;
  if (!v14) {
    unsigned int v15 = 0;
  }
  if (v15 <= v12) {
    unsigned int v15 = v12;
  }
  if (v14) {
    uint64_t v16 = *(void *)(v13 + 64);
  }
  else {
    uint64_t v16 = *(void *)(v13 + 64) + 1LL;
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v17 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v18 = *(void *)(v5 + 64) + v17;
  uint64_t v19 = *(void *)(v7 + 64);
  uint64_t v20 = v19 + v17;
  uint64_t v21 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v22 = v19 + v21;
  uint64_t v23 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v24 = *(void *)(v10 + 64) + v23;
  uint64_t v25 = a1;
  if (a2 <= v15) {
    goto LABEL_33;
  }
  uint64_t v26 = v16 + ((v24 + ((v22 + ((v20 + (v18 & ~v17)) & ~v17)) & ~v21)) & ~v23);
  char v27 = 8 * v26;
  unsigned int v29 = ((a2 - v15 + ~(-1 << v27)) >> v27) + 1;
  if (HIWORD(v29))
  {
    int v28 = *(_DWORD *)(a1 + v26);
    if (!v28) {
      goto LABEL_33;
    }
    goto LABEL_24;
  }

  if (v29 > 0xFF)
  {
    int v28 = *(unsigned __int16 *)(a1 + v26);
    if (!*(_WORD *)(a1 + v26)) {
      goto LABEL_33;
    }
    goto LABEL_24;
  }

  if (v29 >= 2)
  {
LABEL_17:
    int v28 = *(unsigned __int8 *)(a1 + v26);
    if (!*(_BYTE *)(a1 + v26)) {
      goto LABEL_33;
    }
LABEL_24:
    int v30 = (v28 - 1) << v27;
    if ((_DWORD)v26)
    {
      else {
        int v31 = 4;
      }
      __asm { BR              X12 }
    }

    return v15 + v30 + 1;
  }

void storeEnumTagSinglePayload for Publishers.Delay(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a4 + 24);
  uint64_t v5 = *(void *)(*(void *)(a4 + 16) - 8LL);
  unsigned int v6 = *(_DWORD *)(v5 + 84);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v7 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v7 + 84) <= v6) {
    unsigned int v8 = v6;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v9 = *(void *)(v4 - 8);
  if (*(_DWORD *)(v9 + 84) <= v8) {
    unsigned int v10 = v8;
  }
  else {
    unsigned int v10 = *(_DWORD *)(v9 + 84);
  }
  unsigned int v11 = 0u;
  uint64_t v12 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  int v13 = *(_DWORD *)(v12 + 84);
  unsigned int v14 = v13 - 1;
  if (!v13) {
    unsigned int v14 = 0;
  }
  if (v14 <= v10) {
    unsigned int v15 = v10;
  }
  else {
    unsigned int v15 = v14;
  }
  uint64_t v17 = *(void *)(v12 + 64);
  if (!v13) {
    ++v17;
  }
  uint64_t v16 = *(unsigned __int8 *)(v7 + 80);
  size_t v18 = ((*(void *)(v9 + 64)
        + *(unsigned __int8 *)(v12 + 80)
        + ((*(void *)(v7 + 64)
          + *(unsigned __int8 *)(v9 + 80)
  if (a3 > v15)
  {
    if (v18 <= 3)
    {
      unsigned int v19 = ((a3 - v15 + ~(-1 << (8 * v18))) >> (8 * v18)) + 1;
      if (HIWORD(v19))
      {
        unsigned int v11 = 4u;
      }

      else if (v19 >= 0x100)
      {
        unsigned int v11 = 2;
      }

      else
      {
        unsigned int v11 = v19 > 1;
      }
    }

    else
    {
      unsigned int v11 = 1u;
    }
  }

  if (v15 < a2)
  {
    unsigned int v20 = ~v15 + a2;
    if (v18 < 4)
    {
      if ((_DWORD)v18)
      {
        int v21 = v20 & ~(-1 << (8 * v18));
        bzero(a1, v18);
        if ((_DWORD)v18 == 3)
        {
          *(_WORD *)a1 = v21;
          a1[2] = BYTE2(v21);
        }

        else if ((_DWORD)v18 == 2)
        {
          *(_WORD *)a1 = v21;
        }

        else
        {
          *a1 = v21;
        }
      }
    }

    else
    {
      bzero(a1, v18);
      *(_DWORD *)a1 = v20;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X5 }

void sub_183B99FE8()
{
  *(_BYTE *)(v1 + (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v6, v2) = v0;
}

void sub_183B99FF0()
{
  *(_WORD *)(v1 + (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v6, v2) = v0;
}

void sub_183B9A080()
{
  *__int16 v0 = v1;
}

void sub_183B9A0B4()
{
  *__int16 v0 = v1;
}

void sub_183B9A0BC()
{
  *(_WORD *)uint64_t v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
}

void sub_183B9A0CC()
{
  *uint64_t v0 = v1;
}

uint64_t type metadata completion function for Publishers.Delay.Inner()
{
  uint64_t AssociatedTypeWitness = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      uint64_t AssociatedTypeWitness = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        swift_getAssociatedTypeWitness();
        uint64_t AssociatedTypeWitness = type metadata accessor for Optional();
        if (v4 <= 0x3F) {
          return swift_initClassMetadata2();
        }
      }
    }
  }

  return AssociatedTypeWitness;
}

uint64_t sub_183B9A268()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(type metadata accessor for Subscribers.Completion( 0LL,  AssociatedTypeWitness,  AssociatedConformanceWitness,  v3)
                                      - 8)
                          + 80LL);
  uint64_t v5 = (v4 + 72) & ~v4;
  swift_release();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  return swift_deallocObject();
}

void partial apply for closure #1 in Publishers.Delay.Inner.receive(completion:)()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(type metadata accessor for Subscribers.Completion( 0LL,  AssociatedTypeWitness,  AssociatedConformanceWitness,  v3)
                                      - 8)
                          + 80LL);
  Publishers.Delay.Inner.scheduledReceive(completion:)(v0 + ((v4 + 72) & ~v4));
}

uint64_t sub_183B9A3F0()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v2 = *(void *)(AssociatedTypeWitness - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 72LL) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, AssociatedTypeWitness);
  return swift_deallocObject();
}

void partial apply for closure #1 in Publishers.Delay.Inner.receive(_:)()
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 80LL);
  Publishers.Delay.Inner.scheduledReceive(_:)(v0 + ((v1 + 72) & ~v1));
}

uint64_t Publisher.dropFirst(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = *(void *)(a2 - 8);
  MEMORY[0x1895F8858](a1);
  unsigned int v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v4, a2);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a4, v11, a2);
  uint64_t result = type metadata accessor for Publishers.Drop(0LL, a2, a3, v12);
  *(void *)(a4 + *(int *)(result + 36)) = a1;
  return result;
}

uint64_t Publishers.Drop.init(upstream:count:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t result = type metadata accessor for Publishers.Drop(0LL, a3, a4, v9);
  *(void *)(a5 + *(int *)(result + 36)) = a2;
  return result;
}

uint64_t type metadata accessor for Publishers.Drop(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Drop);
}

uint64_t Publishers.Drop.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 16LL))(a2, v2);
}

uint64_t Publishers.Drop.count.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 36));
}

void Publishers.Drop.receive<A>(subscriber:)(uint64_t a1)
{
}

uint64_t sub_183B9A688(uint64_t a1)
{
  uint64_t v12 = *(void *)(v1 + *(int *)(v2 + 36));
  swift_allocObject();
  int v13 = Publishers.Drop.Inner.init(downstream:count:)(v8, v12);
  *(void *)(v10 - 96) = a1;
  *(void *)(v10 - 88) = &protocol witness table for Publishers.Drop<A>.Inner<A1>;
  *(void *)(v10 - 120) = v13;
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40);
  swift_retain();
  v14(v10 - 120, v6, v5);
  __swift_destroy_boxed_opaque_existential_1(v10 - 120);
  *(void *)(v10 - 120) = v13;
  uint64_t v15 = MEMORY[0x186E22960](&protocol conformance descriptor for Publishers.Drop<A>.Inner<A1>, a1);
  Publisher.subscribe<A>(_:)(v10 - 120, v4, a1, v3, v15);
  return swift_release();
}

void type metadata accessor for Publishers.Drop.Inner()
{
}

uint64_t *Publishers.Drop.Inner.__allocating_init(downstream:count:)(uint64_t a1, uint64_t a2)
{
  return Publishers.Drop.Inner.init(downstream:count:)(a1, a2);
}

void Publishers.Drop.Inner.playgroundDescription.getter(void *a1@<X8>)
{
  a1[3] = MEMORY[0x189617FA8];
  *a1 = 1886351940LL;
  a1[1] = 0xE400000000000000LL;
}

uint64_t *Publishers.Drop.Inner.init(downstream:count:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = *(void *)(*v2 + 120);
  uint64_t v7 = (_DWORD *)swift_slowAlloc();
  *(uint64_t *)((char *)v2 + (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v7, v6) = (uint64_t)v7;
  *uint64_t v7 = 0;
  uint64_t v8 = (uint64_t)v2 + *(void *)(*v2 + 128);
  *(void *)(v8 + 32) = 0LL;
  *(_OWORD *)uint64_t v8 = 0u;
  *(_OWORD *)(v8 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0u;
  *(uint64_t *)((char *)v2 + *(void *)(*v2 + 136)) = 0LL;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v5 + 88) - 8LL) + 32LL))( (uint64_t)v2 + *(void *)(*v2 + 112),  a1);
  *(uint64_t *)((char *)v2 + *(void *)(*v2 + 144)) = a2;
  return v2;
}

uint64_t *Publishers.Drop.Inner.deinit()
{
  uint64_t v1 = *v0;
  MEMORY[0x186E22A2C](*(uint64_t *)((char *)v0 + *(void *)(*v0 + 120)), -1LL, -1LL);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 88) - 8LL) + 8LL))((uint64_t)v0 + *(void *)(*v0 + 112));
  outlined destroy of Subscription?((uint64_t)v0 + *(void *)(*v0 + 128));
  return v0;
}

uint64_t Publishers.Drop.Inner.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void Publishers.Drop.Inner.receive(subscription:)(void *a1)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + *(void *)(*(void *)v1 + 120LL));
  os_unfair_lock_lock(v3);
  uint64_t v4 = v1 + *(void *)(*(void *)v1 + 128LL);
  swift_beginAccess();
  outlined init with copy of Subscription?(v4, (uint64_t)v13);
  uint64_t v5 = v14;
  outlined destroy of Subscription?((uint64_t)v13);
  if (v5)
  {
    os_unfair_lock_unlock(v3);
    uint64_t v7 = a1[3];
    uint64_t v6 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v7);
    (*(void (**)(uint64_t))(*(void *)(v6 + 8) + 8LL))(v7);
    return;
  }

  outlined init with copy of Subscription((uint64_t)a1, (uint64_t)v13);
  swift_beginAccess();
  outlined assign with take of Subscription?((uint64_t)v13, v4);
  swift_endAccess();
  uint64_t v8 = *(void *)(v1 + *(void *)(*(void *)v1 + 144LL));
  if (v8 < 0)
  {
    __break(1u);
    goto LABEL_14;
  }

  uint64_t v9 = *(void *)(v1 + *(void *)(*(void *)v1 + 136LL));
  if (v9 == 0x8000000000000000LL)
  {
LABEL_8:
    os_unfair_lock_unlock(v3);
    unint64_t v10 = 0x8000000000000000LL;
LABEL_9:
    uint64_t v11 = a1[3];
    uint64_t v12 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v11);
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v12 + 24))(v10, v11, v12);
    return;
  }

  if (v9 < 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  unint64_t v10 = v8 + v9;
  if (__OFADD__(v8, v9)) {
    goto LABEL_8;
  }
  if ((v10 & 0x8000000000000000LL) != 0)
  {
LABEL_15:
    __break(1u);
    return;
  }

  os_unfair_lock_unlock(v3);
  if (v10) {
    goto LABEL_9;
  }
}

uint64_t Publishers.Drop.Inner.receive(_:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 144LL);
  uint64_t v3 = *(void *)(v1 + v2);
  BOOL v4 = v3 < 1;
  uint64_t v5 = v3 - 1;
  if (v4) {
    return (*(uint64_t (**)(uint64_t, void))(*(void *)(*(void *)v1 + 104LL) + 48LL))( a1,  *(void *)(*(void *)v1 + 88LL));
  }
  *(void *)(v1 + (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v6, v2) = v5;
  return 0LL;
}

uint64_t Publishers.Drop.Inner.receive(completion:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  BOOL v4 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(*v1 + 120));
  os_unfair_lock_lock(v4);
  uint64_t v8 = 0LL;
  memset(v7, 0, sizeof(v7));
  uint64_t v5 = (uint64_t)v1 + *(void *)(*v1 + 128);
  swift_beginAccess();
  outlined assign with take of Subscription?((uint64_t)v7, v5);
  swift_endAccess();
  os_unfair_lock_unlock(v4);
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v3 + 104) + 56LL))(a1, *(void *)(v3 + 88));
}

uint64_t Publishers.Drop.Inner.cancel()()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + *(void *)(*(void *)v0 + 120LL));
  os_unfair_lock_lock(v1);
  uint64_t v2 = v0 + *(void *)(*(void *)v0 + 128LL);
  swift_beginAccess();
  outlined init with copy of Subscription?(v2, (uint64_t)v9);
  uint64_t v8 = 0LL;
  __int128 v6 = 0u;
  __int128 v7 = 0u;
  swift_beginAccess();
  outlined assign with take of Subscription?((uint64_t)&v6, v2);
  swift_endAccess();
  os_unfair_lock_unlock(v1);
  outlined init with copy of Subscription?((uint64_t)v9, (uint64_t)&v6);
  uint64_t v3 = *((void *)&v7 + 1);
  if (*((void *)&v7 + 1))
  {
    uint64_t v4 = v8;
    __swift_project_boxed_opaque_existential_1(&v6, *((uint64_t *)&v7 + 1));
    (*(void (**)(uint64_t))(*(void *)(v4 + 8) + 8LL))(v3);
    outlined destroy of Subscription?((uint64_t)v9);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v6);
  }

  else
  {
    outlined destroy of Subscription?((uint64_t)v9);
    return outlined destroy of Subscription?((uint64_t)&v6);
  }

void Publishers.Drop.Inner.request(_:)(uint64_t a1)
{
  if (a1 != 0x8000000000000000LL)
  {
    if (a1 < 0)
    {
      __break(1u);
    }

    else if (a1)
    {
      goto LABEL_4;
    }

    __break(1u);
    goto LABEL_18;
  }

void protocol witness for Subscriber.receive(subscription:) in conformance Publishers.Drop<A>.Inner<A1>( void *a1)
{
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance Publishers.Drop<A>.Inner<A1>(uint64_t a1)
{
  return Publishers.Drop.Inner.receive(_:)(a1);
}

uint64_t protocol witness for Subscriber.receive(completion:) in conformance Publishers.Drop<A>.Inner<A1>( uint64_t a1)
{
  return Publishers.Drop.Inner.receive(completion:)(a1);
}

void protocol witness for Subscription.request(_:) in conformance Publishers.Drop<A>.Inner<A1>(uint64_t a1)
{
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Drop<A>.Inner<A1>()
{
  return 1886351940LL;
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Drop<A>.Inner<A1>( void *a1@<X8>)
{
}

uint64_t protocol witness for Cancellable.cancel() in conformance Publishers.Drop<A>.Inner<A1>()
{
  return Publishers.Drop.Inner.cancel()();
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Drop<A>( uint64_t a1)
{
}

BOOL static Publishers.Drop<>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = type metadata accessor for Publishers.Drop(0LL, a3, a4, a4);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1895F8858](v6);
  __int128 v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v8);
  uint64_t v12 = (char *)&v20 - v11;
  char v13 = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v14(v12, a1, v6);
  v14(v10, a2, v6);
  if ((v13 & 1) != 0)
  {
    uint64_t v15 = *(void *)&v12[*(int *)(v6 + 36)];
    uint64_t v16 = *(void (**)(char *, uint64_t))(v7 + 8);
    v16(v12, v6);
    uint64_t v17 = *(void *)&v10[*(int *)(v6 + 36)];
    v16(v10, v6);
    return v15 == v17;
  }

  else
  {
    unsigned int v19 = *(void (**)(char *, uint64_t))(v7 + 8);
    v19(v10, v6);
    v19(v12, v6);
    return 0LL;
  }

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.Drop<A>( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static Publishers.Drop<>.== infix(_:_:)(a1, a2, *(void *)(a3 + 16), *(void *)(a3 + 24));
}

uint64_t getEnumTagSinglePayload for Publishers.Drop(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (v5 >= a2)
  {
    if (v5) {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
    return 0LL;
  }

  if (((((*(void *)(v4 + 64) + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + 8) & 0xFFFFFFF8) != 0) {
    unsigned int v6 = 2;
  }
  else {
    unsigned int v6 = a2 - v5 + 1;
  }
  if (v6 >= 0x10000) {
    unsigned int v7 = 4;
  }
  else {
    unsigned int v7 = 2;
  }
  if (v6 < 0x100) {
    unsigned int v7 = 1;
  }
  if (v6 >= 2) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0LL;
  }
  return ((uint64_t (*)(void))((char *)&loc_183B9B020 + 4 * byte_183BA7298[v8]))();
}

void storeEnumTagSinglePayload for Publishers.Drop( unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8LL);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 >= a3)
  {
    int v11 = 0u;
    if (a2 <= v7) {
      goto LABEL_14;
    }
  }

  else
  {
    unsigned int v8 = a3 - v7;
    if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v9 = v8 + 1;
    }
    else {
      unsigned int v9 = 2;
    }
    if (v9 >= 0x10000) {
      int v10 = 4;
    }
    else {
      int v10 = 2;
    }
    if (v9 < 0x100) {
      int v10 = 1;
    }
    if (v9 >= 2) {
      int v11 = v10;
    }
    else {
      int v11 = 0;
    }
    if (a2 <= v7) {
LABEL_14:
    }
      __asm { BR              X11 }
  }

  if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    unsigned int v12 = ~v7 + a2;
    bzero(a1, ((*(void *)(v6 + 64) + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + 8);
    *a1 = v12;
  }

  __asm { BR              X10 }

void sub_183B9B160()
{
  *(_BYTE *)(v0 + v1) = v2;
}

void sub_183B9B168(uint64_t a1, int a2)
{
  *(_DWORD *)(v2 + (*(void (**)(uint64_t, void, uint64_t))(v1 + 16))(v0, *(void *)(v9 - 144) + *(int *)(v6 + 52), v3) = 0;
  if (a2) {
    JUMPOUT(0x183B9B170LL);
  }
}

void sub_183B9B18C()
{
  *(_WORD *)(v0 + v1) = v2;
}

void sub_183B9B194()
{
  *(_DWORD *)(v0 + v1) = v2;
}

uint64_t sub_183B9B19C(uint64_t a1, int a2)
{
  *(_WORD *)(v4 + (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v7, v6, v5) = 0;
  if (!a2) {
    JUMPOUT(0x183B9B1A4LL);
  }
  return (*(uint64_t (**)(uint64_t))(v3 + 56))(v4);
}

uint64_t type metadata completion function for Publishers.Drop.Inner()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

void Future<>.value.getter()
{
  v1[2] = *(void *)(*(void *)v0 + 80LL);
  uint64_t v2 = MEMORY[0x18961A520];
  v1[3] = MEMORY[0x18961A520];
  v1[4] = v2;
  uint64_t v3 = MEMORY[0x18961A528];
  v1[5] = MEMORY[0x18961A528];
  v1[6] = v3;
  type metadata accessor for ContinuationSubscriber();
}

uint64_t sub_183B9B2A4()
{
  *(void *)(v3 + 56) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 64) = v4;
  uint64_t v5 = MEMORY[0x186E22960](&protocol conformance descriptor for Future<A, B>, v2);
  *uint64_t v4 = v3;
  v4[1] = Future<>.value.getter;
  return static ContinuationSubscriber.withUnsafeSubscription<A>(_:)(v0, v3 + 56, v2, v5);
}

uint64_t Future<>.value.getter()
{
  uint64_t v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void Future.value.getter()
{
  uint64_t v2 = *v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  uint64_t v4 = *(void *)(v2 + 96);
  *(_OWORD *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = *(_OWORD *)(v2 + 80);
  *(void *)(v1 + 32) = v3;
  *(void *)(v1 + 40) = v4;
  *(void *)(v1 + 48) = MEMORY[0x18961A3E8];
  type metadata accessor for ContinuationSubscriber();
}

uint64_t sub_183B9B3B0()
{
  *(void *)(v3 + 56) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 64) = v4;
  uint64_t v5 = MEMORY[0x186E22960](&protocol conformance descriptor for Future<A, B>, v2);
  *uint64_t v4 = v3;
  v4[1] = Future.value.getter;
  return static ContinuationSubscriber.withUnsafeThrowingSubscription<A>(_:)(v0, v3 + 56, v2, v5);
}

uint64_t Future.value.getter()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    return swift_task_switch();
  }
  else {
    return (*(uint64_t (**)(void))(v2 + 8))();
  }
}

{
  uint64_t v0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t Publisher.first()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v4 + 16))(v6);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(a2, v6, a1);
}

uint64_t Publishers.First.init(upstream:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 32LL))(a3, a1);
}

uint64_t Publisher.first(where:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return Publisher.drop(while:)( a1,  a2,  a3,  a4,  (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for Publishers.FirstWhere,  a5);
}

uint64_t Publishers.FirstWhere.init(upstream:predicate:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return Publishers.DropWhile.init(upstream:predicate:)( a1,  a2,  a3,  a4,  a5,  (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for Publishers.FirstWhere,  a6);
}

uint64_t type metadata accessor for Publishers.FirstWhere(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.FirstWhere);
}

uint64_t Publisher.tryFirst(where:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return Publisher.drop(while:)( a1,  a2,  a3,  a4,  (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for Publishers.TryFirstWhere,  a5);
}

uint64_t Publishers.TryFirstWhere.init(upstream:predicate:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return Publishers.DropWhile.init(upstream:predicate:)( a1,  a2,  a3,  a4,  a5,  (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for Publishers.TryFirstWhere,  a6);
}

uint64_t type metadata accessor for Publishers.TryFirstWhere(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for Publishers.TryFirstWhere);
}

void Publishers.First.receive<A>(subscriber:)()
{
  uint64_t v0 = type metadata accessor for Optional();
  MEMORY[0x1895F8858](v0);
  type metadata accessor for Publishers.First.Inner();
}

uint64_t sub_183B9B618(uint64_t a1)
{
  int v10 = specialized Publishers.Last.Inner.init(downstream:initial:reduce:)(v1, v6);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v5);
  *(void *)(v8 - 112) = v10;
  uint64_t v11 = MEMORY[0x186E22960](&protocol conformance descriptor for ReduceProducer<A, B, C, D, E>, a1);
  Publisher.subscribe<A>(_:)(v8 - 112, v3, a1, v2, v11);
  return swift_release();
}

void type metadata accessor for Publishers.First.Inner()
{
}

uint64_t Publishers.First.Inner.description.getter()
{
  return 0x7473726946LL;
}

uint64_t Publishers.First.Inner.receive(newValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = type metadata accessor for Optional();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1895F8858](v5);
  unsigned int v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v7);
  uint64_t v11 = (char *)&v17 - v10;
  uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v17 - v10, a1, AssociatedTypeWitness);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v11, 0LL, 1LL, AssociatedTypeWitness);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v11, v5);
  uint64_t v13 = v2 + *(void *)(*(void *)v2 + 136LL);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 40))(v13, v9, v5);
  swift_endAccess();
  uint64_t v14 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  type metadata accessor for PartialCompletion(0LL, MEMORY[0x18961AFC8] + 8LL, v14, AssociatedConformanceWitness);
  return swift_storeEnumTagMultiPayload();
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.First<A>()
{
}

uint64_t Publishers.FirstWhere.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 16LL))(a2, v2);
}

uint64_t Publishers.FirstWhere.receive<A>(subscriber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.LastWhere.receive<A>(subscriber:)( a1,  a2,  a3,  a4,  (uint64_t (*)(void, void *))type metadata accessor for Publishers.FirstWhere.Inner,  (uint64_t)&unk_189D2E4E0,  (uint64_t)_s6Output7Combine9PublisherPQzSbIegnd_AESbIegnr_AbCRzAB10SubscriberRd__7FailureQyd__AGRtzSb5InputRtd__r__lTRTA_0);
}

uint64_t Publishers.FirstWhere.Inner.description.getter()
{
  return 0x7473726946797254LL;
}

uint64_t Publishers.FirstWhere.Inner.receive(newValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v19 = a2;
  uint64_t v5 = *v2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = type metadata accessor for Optional();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1895F8858](v7);
  uint64_t v11 = (char *)&v20[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v9);
  uint64_t v13 = (char *)&v20[-1] - v12;
  (*(void (**)(uint64_t *__return_ptr, uint64_t))((char *)v3 + *(void *)(v5 + 152)))(v20, a1);
  if (LOBYTE(v20[0]) == 1)
  {
    uint64_t v14 = *(void *)(AssociatedTypeWitness - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v13, a1, AssociatedTypeWitness);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v13, 0LL, 1LL, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v13, v7);
    uint64_t v15 = (char *)v3 + *(void *)(*v3 + 136LL);
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v8 + 40))(v15, v11, v7);
    swift_endAccess();
  }

  uint64_t v16 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  type metadata accessor for PartialCompletion(0LL, MEMORY[0x18961AFC8] + 8LL, v16, AssociatedConformanceWitness);
  return swift_storeEnumTagMultiPayload();
}

uint64_t protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.FirstWhere<A>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.FirstWhere.receive<A>(subscriber:)(a1, a4, a2, a3);
}

uint64_t Publishers.TryFirstWhere.receive<A>(subscriber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.LastWhere.receive<A>(subscriber:)( a1,  a2,  a3,  a4,  (uint64_t (*)(void, void *))type metadata accessor for Publishers.TryFirstWhere.Inner,  (uint64_t)&unk_189D2E4B8,  (uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Publisher.Output) -> (@unowned Bool, @error @owned Error));
}

uint64_t Publishers.TryFirstWhere.Inner.description.getter()
{
  return 0x7473726946797254LL;
}

uint64_t Publishers.TryFirstWhere.Inner.receive(newValue:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = type metadata accessor for Optional();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1895F8858](v6);
  uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v8);
  uint64_t v12 = (char *)v16 - v11;
  (*(void (**)(void *__return_ptr, uint64_t))((char *)v2 + *(void *)(v4 + 152)))(v16, a1);
  if (LOBYTE(v16[0]) == 1)
  {
    uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v12, a1, AssociatedTypeWitness);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v12, 0LL, 1LL, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v12, v6);
    uint64_t v14 = (char *)v2 + *(void *)(*v2 + 136LL);
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v7 + 40))(v14, v10, v6);
    swift_endAccess();
  }

  return 0LL;
}

uint64_t vtable thunk for ReduceProducer.receive(newValue:) dispatching to Publishers.TryFirstWhere.Inner.receive(newValue:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = Publishers.TryFirstWhere.Inner.receive(newValue:)(a1);
  *(void *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4;
  return result;
}

uint64_t protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.TryFirstWhere<A>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.TryFirstWhere.receive<A>(subscriber:)(a1, a4, a2, a3);
}

uint64_t static Publishers.First<>.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)() & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.First<A>()
{
  return static Publishers.First<>.== infix(_:_:)();
}

void type metadata accessor for Publishers.FirstWhere.Inner()
{
}

void type metadata accessor for Publishers.TryFirstWhere.Inner()
{
}

uint64_t getEnumTagSinglePayload for Publishers.First(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)(v4 + 64);
  char v8 = 8 * v7;
  if (v7 <= 3)
  {
    unsigned int v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)(a1 + v7);
      if (!v9) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }

    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7)) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }

    if (v10 < 2)
    {
LABEL_18:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0LL;
    }
  }

  int v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7)) {
    goto LABEL_18;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (!(_DWORD)v7) {
    return v5 + v11 + 1;
  }
  return ((uint64_t (*)(void))((char *)&loc_183B9BEA4 + 4 * byte_183BA7430[(v7 - 1)]))();
}

void storeEnumTagSinglePayload for Publishers.First(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8LL);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        unsigned int v11 = 4u;
      }

      else if (v13 >= 0x100)
      {
        unsigned int v11 = 2;
      }

      else
      {
        unsigned int v11 = v13 > 1;
      }
    }

    else
    {
      unsigned int v11 = 1u;
    }
  }

  else
  {
    unsigned int v11 = 0u;
  }

  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        int v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }

        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }

        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }

    else
    {
      bzero(a1, *(void *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X11 }

uint64_t type metadata accessor for Publishers.First(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.First);
}

uint64_t getEnumTagSinglePayload for Publishers.FirstWhere(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v7 = *(void *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      unint64_t v12 = *(void *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8LL);
      if (v12 >= 0xFFFFFFFF) {
        LODWORD(v12) = -1;
      }
      return (v12 + 1);
    }

    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }

  else
  {
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 16) & 0xFFFFFFF8) != 0) {
      unsigned int v8 = 2;
    }
    else {
      unsigned int v8 = a2 - v6 + 1;
    }
    if (v8 >= 0x10000) {
      unsigned int v9 = 4;
    }
    else {
      unsigned int v9 = 2;
    }
    if (v8 < 0x100) {
      unsigned int v9 = 1;
    }
    if (v8 >= 2) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0LL;
    }
    return ((uint64_t (*)(void))((char *)&loc_183B9C134 + 4 * byte_183BA743E[v10]))();
  }

void storeEnumTagSinglePayload for Publishers.FirstWhere( unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 16) - 8LL);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v5 + 84);
  }
  if (v6 >= a3)
  {
    int v9 = 0u;
    if (a2 <= v6) {
      goto LABEL_17;
    }
  }

  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v7 = a3 - v6 + 1;
    }
    else {
      unsigned int v7 = 2;
    }
    if (v7 >= 0x10000) {
      int v8 = 4;
    }
    else {
      int v8 = 2;
    }
    if (v7 < 0x100) {
      int v8 = 1;
    }
    if (v7 >= 2) {
      int v9 = v8;
    }
    else {
      int v9 = 0;
    }
    if (a2 <= v6) {
LABEL_17:
    }
      __asm { BR              X12 }
  }

  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    unsigned int v10 = ~v6 + a2;
    bzero(a1, ((*(void *)(v5 + 64) + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + 16);
    *a1 = v10;
  }

  __asm { BR              X10 }

void sub_183B9C2AC()
{
  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x183B9C324LL);
}

void sub_183B9C2B4(uint64_t a1, int a2)
{
  *(_DWORD *)(v2 + (*(void (**)(uint64_t, void, uint64_t))(v1 + 16))(v0, *(void *)(v9 - 144) + *(int *)(v6 + 52), v3) = 0;
  if (a2) {
    JUMPOUT(0x183B9C2BCLL);
  }
  JUMPOUT(0x183B9C324LL);
}

void sub_183B9C2FC()
{
  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x183B9C324LL);
}

void sub_183B9C304()
{
  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x183B9C324LL);
}

uint64_t sub_183B9C30C(uint64_t a1, int a2, unsigned int a3)
{
  *(_WORD *)(v5 + (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v7, v6) = 0;
  if (!a2) {
    JUMPOUT(0x183B9C324LL);
  }
  if (a3 < 0x7FFFFFFF)
  {
    if ((a2 & 0x80000000) == 0) {
      JUMPOUT(0x183B9C320LL);
    }
    JUMPOUT(0x183B9C318LL);
  }

  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v5);
}

uint64_t sub_183B9C33C()
{
  return swift_deallocObject();
}

uint64_t ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)()
{
  return MEMORY[0x18961BB28]();
}

uint64_t ObservationRegistrar.access<A, B>(_:keyPath:)()
{
  return MEMORY[0x18961BB30]();
}

uint64_t ObservationRegistrar.init()()
{
  return MEMORY[0x18961BB48]();
}

uint64_t type metadata accessor for ObservationRegistrar()
{
  return MEMORY[0x18961BB50]();
}

uint64_t Dictionary.init()()
{
  return MEMORY[0x189617788]();
}

uint64_t Array.init()()
{
  return MEMORY[0x189617790]();
}

Swift::Void __swiftcall Dictionary.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
}

uint64_t type metadata accessor for Dictionary()
{
  return MEMORY[0x1896178E0]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x189617900]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x189617908]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x189617A00]();
}

uint64_t BidirectionalCollection.last(where:)()
{
  return MEMORY[0x189617AF0]();
}

uint64_t BidirectionalCollection.last.getter()
{
  return MEMORY[0x189617AF8]();
}

uint64_t dispatch thunk of static Comparable.> infix(_:_:)()
{
  return MEMORY[0x189617B38]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x189617B40]();
}

uint64_t dispatch thunk of static Comparable.>= infix(_:_:)()
{
  return MEMORY[0x189617B48]();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x189617B50]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x189617C20]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x189617E20]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init<A>(_:radix:uppercase:)()
{
  return MEMORY[0x189617FF8]();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x189618080]();
}

uint64_t dispatch thunk of Sequence.underestimatedCount.getter()
{
  return MEMORY[0x189618090]();
}

uint64_t Sequence.allSatisfy(_:)()
{
  return MEMORY[0x1896180C8]();
}

uint64_t Sequence.compactMap<A>(_:)()
{
  return MEMORY[0x1896180D0]();
}

uint64_t Sequence.enumerated()()
{
  return MEMORY[0x1896180D8]();
}

uint64_t Sequence.drop(while:)()
{
  return MEMORY[0x189618110]();
}

uint64_t Sequence.prefix(_:)()
{
  return MEMORY[0x189618138]();
}

uint64_t Sequence.reduce<A>(_:_:)()
{
  return MEMORY[0x189618148]();
}

uint64_t Sequence.forEach(_:)()
{
  return MEMORY[0x189618158]();
}

uint64_t Sequence.dropFirst(_:)()
{
  return MEMORY[0x189618170]();
}

uint64_t Sequence<>.contains(_:)()
{
  return MEMORY[0x189618198]();
}

uint64_t dispatch thunk of RangeExpression.relative<A>(to:)()
{
  return MEMORY[0x189618208]();
}

uint64_t RawRepresentable<>.hashValue.getter()
{
  return MEMORY[0x189618290]();
}

uint64_t RawRepresentable<>._rawHashValue(seed:)()
{
  return MEMORY[0x189618298]();
}

uint64_t RawRepresentable<>.hash(into:)()
{
  return MEMORY[0x1896182A0]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x189618318]();
}

uint64_t static Array._adoptStorage(_:count:)()
{
  return MEMORY[0x189618330]();
}

uint64_t Array._checkSubscript(_:wasNativeTypeChecked:)()
{
  return MEMORY[0x189618338]();
}

uint64_t static Array.+ infix(_:_:)()
{
  return MEMORY[0x189618368]();
}

Swift::Void __swiftcall Array._makeMutableAndUnique()()
{
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x189618378]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x189618390]();
}

Swift::Bool __swiftcall Array._hoistableIsNativeTypeChecked()()
{
  return MEMORY[0x1896183A0]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x1896183D8]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x1896183E8]();
}

uint64_t Array.endIndex.getter()
{
  return MEMORY[0x1896183F0]();
}

Swift::Void __swiftcall Array.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x189618410]();
}

uint64_t static Array<A>.== infix(_:_:)()
{
  return MEMORY[0x189618428]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x189618438]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x18961BC98]();
}

uint64_t _sScIsE4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKF()
{
  return MEMORY[0x18961BD08]();
}

uint64_t type metadata accessor for UnsafeContinuation()
{
  return MEMORY[0x18961BDF0]();
}

uint64_t Set.count.getter()
{
  return MEMORY[0x189618688]();
}

uint64_t Set.insert(_:)()
{
  return MEMORY[0x189618690]();
}

uint64_t Set.remove(_:)()
{
  return MEMORY[0x189618698]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x1896186A8]();
}

uint64_t type metadata accessor for Set()
{
  return MEMORY[0x1896186D0]();
}

uint64_t Set.init<A>(_:)()
{
  return MEMORY[0x1896186F0]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x189618828]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x189618848]();
}

uint64_t dispatch thunk of Collection.indices.getter()
{
  return MEMORY[0x189618870]();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return MEMORY[0x189618888]();
}

uint64_t Collection.first.getter()
{
  return MEMORY[0x1896188D0]();
}

uint64_t Collection.prefix(_:)()
{
  return MEMORY[0x1896188E8]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x1896188F8]();
}

uint64_t dispatch thunk of Collection.subscript.getter()
{
  return MEMORY[0x189618948]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x189618950]();
}

uint64_t dispatch thunk of RangeReplaceableCollection.append(_:)()
{
  return MEMORY[0x189618970]();
}

uint64_t RangeReplaceableCollection.removeFirst()()
{
  return MEMORY[0x189618978]();
}

Swift::Void __swiftcall RangeReplaceableCollection.removeFirst(_:)(Swift::Int a1)
{
}

uint64_t static RangeReplaceableCollection.+ infix<A>(_:_:)()
{
  return MEMORY[0x189618998]();
}

{
  return MEMORY[0x1896189A0]();
}

{
  return MEMORY[0x1896189A8]();
}

uint64_t Range.relative<A>(to:)()
{
  return MEMORY[0x189618A10]();
}

uint64_t type metadata accessor for Range()
{
  return MEMORY[0x189618A18]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x189618AC0]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x189618CB0]();
}

uint64_t dispatch thunk of Strideable.advanced(by:)()
{
  return MEMORY[0x189618D68]();
}

uint64_t dispatch thunk of Strideable.distance(to:)()
{
  return MEMORY[0x189618D70]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return MEMORY[0x189618E20]();
}

uint64_t dispatch thunk of BinaryInteger._lowWord.getter()
{
  return MEMORY[0x189618EA0]();
}

uint64_t dispatch thunk of BinaryInteger.bitWidth.getter()
{
  return MEMORY[0x189618EA8]();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return MEMORY[0x189618EB8]();
}

uint64_t dispatch thunk of AnyKeyPath._kvcKeyPathString.getter()
{
  return MEMORY[0x189618EF0]();
}

uint64_t type metadata accessor for ArraySlice()
{
  return MEMORY[0x189618F78]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x189619018]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x189619020]();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return MEMORY[0x189619030]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x189619058]();
}

uint64_t __CocoaSet.count.getter()
{
  return MEMORY[0x189619078]();
}

uint64_t __CocoaSet.member(for:)()
{
  return MEMORY[0x189619080]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x189619098]();
}

uint64_t __CocoaSet.contains(_:)()
{
  return MEMORY[0x1896190A0]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x189619188]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x189619190]();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return MEMORY[0x189619198]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1896192F8]();
}

uint64_t _forEachField(of:options:body:)()
{
  return MEMORY[0x189619450]();
}

uint64_t type metadata accessor for PrefixSequence()
{
  return MEMORY[0x189619470]();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t ContiguousArray.append(_:)()
{
  return MEMORY[0x189619510]();
}

uint64_t ContiguousArray.init()()
{
  return MEMORY[0x189619530]();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return MEMORY[0x189619538]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x189619660]();
}

uint64_t dispatch thunk of TextOutputStream.write(_:)()
{
  return MEMORY[0x1896196B8]();
}

uint64_t TextOutputStream._writeASCII(_:)()
{
  return MEMORY[0x1896196C0]();
}

Swift::Void __swiftcall TextOutputStream._lock()()
{
}

Swift::Void __swiftcall TextOutputStream._unlock()()
{
}

uint64_t dispatch thunk of CustomReflectable.customMirror.getter()
{
  return MEMORY[0x189619710]();
}

uint64_t type metadata accessor for DropFirstSequence()
{
  return MEMORY[0x189619718]();
}

uint64_t type metadata accessor for DropWhileSequence()
{
  return MEMORY[0x189619728]();
}

uint64_t static _EachFieldOptions.ignoreUnknown.getter()
{
  return MEMORY[0x1896197E8]();
}

uint64_t static _EachFieldOptions.classType.getter()
{
  return MEMORY[0x1896197F0]();
}

uint64_t type metadata accessor for _EachFieldOptions()
{
  return MEMORY[0x1896197F8]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1896198A8]();
}

uint64_t dispatch thunk of static AdditiveArithmetic.zero.getter()
{
  return MEMORY[0x1896198D8]();
}

uint64_t EnumeratedSequence.makeIterator()()
{
  return MEMORY[0x1896198E0]();
}

uint64_t EnumeratedSequence.Iterator.next()()
{
  return MEMORY[0x1896198E8]();
}

uint64_t type metadata accessor for EnumeratedSequence.Iterator()
{
  return MEMORY[0x1896198F0]();
}

uint64_t type metadata accessor for EnumeratedSequence()
{
  return MEMORY[0x189619900]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x189619948]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x189619950]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x189619960]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x189619A40](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x189619B00]();
}

{
  return MEMORY[0x189619B18]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x189619B28]();
}

uint64_t type metadata accessor for KeyedDecodingContainer()
{
  return MEMORY[0x189619B70]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x189619BF8]();
}

{
  return MEMORY[0x189619C10]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x189619C20]();
}

uint64_t type metadata accessor for KeyedEncodingContainer()
{
  return MEMORY[0x189619C70]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x189619CC8]();
}

uint64_t type metadata accessor for _ContiguousArrayStorage()
{
  return MEMORY[0x189619CD8]();
}

uint64_t type metadata accessor for ReferenceWritableKeyPath()
{
  return MEMORY[0x189619CE8]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x189619FC0]();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return MEMORY[0x18961A010]();
}

uint64_t _diagnoseUnexpectedEnumCase<A>(type:)()
{
  return MEMORY[0x18961A048]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x18961A050]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x18961A098]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x18961A0E8]();
}

uint64_t == infix<A>(_:_:)()
{
  return MEMORY[0x18961A128]();
}

uint64_t dispatch thunk of CustomPlaygroundDisplayConvertible.playgroundDescription.getter()
{
  return MEMORY[0x18961A308]();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return MEMORY[0x18961A310]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x18961A398]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x18961A3A0]();
}

uint64_t print<A>(_:separator:terminator:to:)()
{
  return MEMORY[0x18961A660]();
}

uint64_t print(_:separator:terminator:)()
{
  return MEMORY[0x18961A668]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x18961A678]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x18961A680]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x18961A6C0]();
}

uint64_t Mirror.init(reflecting:)()
{
  return MEMORY[0x18961A6F0]();
}

uint64_t type metadata accessor for Mirror.DisplayStyle()
{
  return MEMORY[0x18961A728]();
}

uint64_t type metadata accessor for Mirror.AncestorRepresentation()
{
  return MEMORY[0x18961A750]();
}

uint64_t Mirror.init<A, B>(_:unlabeledChildren:displayStyle:ancestorRepresentation:)()
{
  return MEMORY[0x18961A770]();
}

uint64_t Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)()
{
  return MEMORY[0x18961A780]();
}

uint64_t type metadata accessor for Result()
{
  return MEMORY[0x18961A788]();
}

uint64_t static Result<>.== infix(_:_:)()
{
  return MEMORY[0x18961A798]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x18961A940]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x18961A950]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x18961A968]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x18961A978]();
}

uint64_t type metadata accessor for KeyPath()
{
  return MEMORY[0x18961A998]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x18961AF60]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x18961AF68]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x18961AF88]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x18961B018]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x18961B058]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1895FB088]();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1895FC688]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1895FC6A0]();
}

int raise(int a1)
{
  return MEMORY[0x1895FCBE0](*(void *)&a1);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x18961B0B8]();
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x18961B0E8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x18961B0F0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x18961B0F8]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x18961B128]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x18961B140]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x18961BFB8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x18961BFC0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x18961BFC8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x18961BFD0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x18961BFD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x18961B150]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x18961B158]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x18961B180]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x18961B190]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x18961B1D8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x18961B1E8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x18961B1F0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x18961B218]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x18961B220]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x18961B228]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x18961B248]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x18961B250]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x18961B270]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x18961B280]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x18961B290]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x18961B2C0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x18961B2D0]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x18961B2D8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x18961B2E0]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x18961B2E8]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x18961B2F0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x18961B2F8]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x18961B300]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x18961B330]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x18961B338]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x18961B340]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x18961B358]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x18961B360]();
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

uint64_t swift_modifyAtReferenceWritableKeyPath()
{
  return MEMORY[0x18961B3B0]();
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

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x18961B3F8]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x18961B410]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x18961B418]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x18961B430]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x18961C008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x18961C018]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x18961C038]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x18961B458]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x18961B468]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x18961B478]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x18961B480]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x18961B488]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x18961B490]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x18961B498]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x18961B4A0]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x18961B4A8]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x18961B4B0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x18961B4D0]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x18961B4D8]();
}

uint64_t swift_weakCopyAssign()
{
  return MEMORY[0x18961B4E0]();
}

uint64_t swift_weakCopyInit()
{
  return MEMORY[0x18961B4E8]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x18961B4F0]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x18961B4F8]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x18961B500]();
}

uint64_t swift_weakTakeAssign()
{
  return MEMORY[0x18961B508]();
}

uint64_t swift_weakTakeInit()
{
  return MEMORY[0x18961B510]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x18961B518]();
}