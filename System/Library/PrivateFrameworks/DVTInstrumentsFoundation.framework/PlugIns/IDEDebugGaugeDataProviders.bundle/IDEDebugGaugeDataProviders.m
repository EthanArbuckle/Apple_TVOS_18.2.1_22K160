void sub_13A0(id a1)
{
  IDEDataProvider_SpriteKit *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___IDEDataProvider_SpriteKit);
  v2 = (void *)qword_11388;
  qword_11388 = (uint64_t)v1;
}

void sub_145C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_14AC(id a1)
{
  v4[0] = @"spritekit.fps";
  v4[1] = @"spritekit.traversals";
  v4[2] = @"spritekit.frametime";
  v4[3] = @"spritekit.clienttime";
  v4[4] = @"spritekit.physictime";
  v4[5] = @"spritekit.consttime";
  v4[6] = @"spritekit.actiontime";
  v4[7] = @"spritekit.emittertime";
  v4[8] = @"spritekit.rendertime";
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, 9LL));
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v1));
  v3 = (void *)qword_11398;
  qword_11398 = v2;
}

void sub_159C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_172C(uint64_t a1)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    do
    {
      v5 = 0LL;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v8 + 1) + 8LL * (void)v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary", (void)v8));
        if ([*(id *)(a1 + 40) captureAttributes:*(void *)(a1 + 48) toDictionary:v7 forPID:v6]) {
          [*(id *)(a1 + 56) setObject:v7 forKeyedSubscript:v6];
        }

        v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v3);
  }
}

void sub_1860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1910(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___IDEDataProvider_NetworkStatistics);
  id v2 = (void *)qword_113A8;
  qword_113A8 = (uint64_t)v1;
}

void sub_1A08(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_D828));
  id v2 = (void *)qword_113B8;
  qword_113B8 = v1;
}

LABEL_39:
  ++self->_processInfoByPID.__table_.__p2_.__value_;
LABEL_40:
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", i[17]));
  [v9 setObject:v29 forKeyedSubscript:@"net.rx.bytes"];

  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  i[17] - i[4]));
  [v9 setObject:v30 forKeyedSubscript:@"net.rx.bytes.delta"];

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", i[19]));
  [v9 setObject:v31 forKeyedSubscript:@"net.tx.bytes"];

  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  i[19] - i[6]));
  [v9 setObject:v32 forKeyedSubscript:@"net.tx.bytes.delta"];

  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  i[19] + i[17]));
  [v9 setObject:v33 forKeyedSubscript:@"net.bytes"];

  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  i[19] + i[17] - (i[4] + i[6])));
  [v9 setObject:v34 forKeyedSubscript:@"net.bytes.delta"];

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", i[16]));
  [v9 setObject:v35 forKeyedSubscript:@"net.rx.packets"];

  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  i[16] - i[3]));
  [v9 setObject:v36 forKeyedSubscript:@"net.rx.packets.delta"];

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", i[18]));
  [v9 setObject:v37 forKeyedSubscript:@"net.tx.packets"];

  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  i[18] - i[5]));
  [v9 setObject:v38 forKeyedSubscript:@"net.tx.packets.delta"];

  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  i[18] + i[16]));
  [v9 setObject:v39 forKeyedSubscript:@"net.packets"];

  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  i[18] + i[16] - (i[3] + i[5])));
  [v9 setObject:v40 forKeyedSubscript:@"net.packets.delta"];

  if ([v63 containsObject:@"net.connections[]"])
  {
    v41 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    for (j = self->_sourceInfosBySrcRef.__table_.__p1_.__value_.__next_; j; j = *(id *)j)
    {
      v43 = [*((id *)j + 3) intValue];
      if (v43 == [v10 intValue])
      {
        v44 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        v45 = v44;
        if (*((void *)j + 44)) {
          v46 = (const __CFString *)*((void *)j + 44);
        }
        else {
          v46 = &stru_CA30;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v44,  "setObject:forKeyedSubscript:",  v46,  @"interface");
        if (*((void *)j + 45)) {
          v47 = (const __CFString *)*((void *)j + 45);
        }
        else {
          v47 = &stru_CA30;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v45, "setObject:forKeyedSubscript:", v47, @"protocol");
        if (*((void *)j + 46)) {
          v48 = (const __CFString *)*((void *)j + 46);
        }
        else {
          v48 = &stru_CA30;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v45, "setObject:forKeyedSubscript:", v48, @"state");
        if (*((void *)j + 8)) {
          v49 = (const __CFString *)*((void *)j + 8);
        }
        else {
          v49 = &stru_CA30;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v45,  "setObject:forKeyedSubscript:",  v49,  @"localAddr");
        if (*((void *)j + 9)) {
          v50 = (const __CFString *)*((void *)j + 9);
        }
        else {
          v50 = &stru_CA30;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v45,  "setObject:forKeyedSubscript:",  v50,  @"localPort");
        if (*((void *)j + 15)) {
          v51 = (const __CFString *)*((void *)j + 15);
        }
        else {
          v51 = &stru_CA30;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v45,  "setObject:forKeyedSubscript:",  v51,  @"remoteAddr");
        if (*((void *)j + 16)) {
          v52 = (const __CFString *)*((void *)j + 16);
        }
        else {
          v52 = &stru_CA30;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v45,  "setObject:forKeyedSubscript:",  v52,  @"remotePort");
        v53 = *((void *)j + 48);
        if (v53) {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v45,  "setObject:forKeyedSubscript:",  v53,  @"connectionDescription");
        }
        v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)j + 32)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v45, "setObject:forKeyedSubscript:", v54, @"rxBytes");

        v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)j + 32) - *((void *)j + 19)));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v45,  "setObject:forKeyedSubscript:",  v55,  @"rxBytesDelta");

        v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)j + 34)));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v45, "setObject:forKeyedSubscript:", v56, @"txBytes");

        v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)j + 34) - *((void *)j + 21)));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v45,  "setObject:forKeyedSubscript:",  v57,  @"txBytesDelta");

        v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)j + 31)));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v45,  "setObject:forKeyedSubscript:",  v58,  @"rxPackets");

        v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)j + 31) - *((void *)j + 18)));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v45,  "setObject:forKeyedSubscript:",  v59,  @"rxPacketsDelta");

        v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)j + 33)));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v45,  "setObject:forKeyedSubscript:",  v60,  @"txPackets");

        v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)j + 33) - *((void *)j + 20)));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v45,  "setObject:forKeyedSubscript:",  v61,  @"txPacketsDelta");

        -[NSMutableArray addObject:](v41, "addObject:", v45);
      }
    }

    [v9 setObject:v41 forKeyedSubscript:@"net.connections[]"];
  }

  return 1;
}

  ++*(void *)(v16 + 24);
LABEL_40:
  v32 = *((int64x2_t *)v21 + 9);
  *((int64x2_t *)v21 + 8) = vaddq_s64( vsubq_s64(*((int64x2_t *)v6 + 14), *(int64x2_t *)(v6 + 15)),  *((int64x2_t *)v21 + 8));
  *((int64x2_t *)v21 + 9) = vaddq_s64(vsubq_s64(*((int64x2_t *)v6 + 15), *(int64x2_t *)(v6 + 17)), v32);
  v33 = *((int64x2_t *)v21 + 11);
  *((int64x2_t *)v21 + 10) = vaddq_s64( vsubq_s64(*((int64x2_t *)v6 + 16), *(int64x2_t *)(v6 + 19)),  *((int64x2_t *)v21 + 10));
  *((int64x2_t *)v21 + 11) = vaddq_s64(vsubq_s64(*((int64x2_t *)v6 + 17), *(int64x2_t *)(v6 + 21)), v33);
  v34 = *((int64x2_t *)v21 + 13);
  *((int64x2_t *)v21 + 12) = vaddq_s64( vsubq_s64(*((int64x2_t *)v6 + 18), *(int64x2_t *)(v6 + 23)),  *((int64x2_t *)v21 + 12));
  *((int64x2_t *)v21 + 13) = vaddq_s64(vsubq_s64(*((int64x2_t *)v6 + 19), *(int64x2_t *)(v6 + 25)), v34);
  *((void *)v21 + 28) += v6[40] - v6[27];
}

void sub_2244( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_23A4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)&OBJC_CLASS___IDEDataProvider_NetworkStatistics;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_23D0(void *a1)
{
}

void sub_252C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 40))
  {
    dispatch_queue_t v3 = dispatch_queue_create("NStatManager queue", 0LL);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(v6 + 48);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_2708;
    v19[3] = &unk_C538;
    v19[4] = v6;
    *(void *)(*(void *)(a1 + 32) + 40LL) = NStatManagerCreate(kCFAllocatorDefault, v7, v19);
    NStatManagerAddAllUDP(*(void *)(*(void *)(a1 + 32) + 40LL));
    NStatManagerAddAllTCP(*(void *)(*(void *)(a1 + 32) + 40LL));
    uint64_t v2 = *(void *)(a1 + 32);
  }

  __int128 v8 = *(dispatch_queue_s **)(v2 + 48);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_395C;
  block[3] = &unk_C560;
  block[4] = v2;
  dispatch_sync(v8, block);
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v10 = *(void *)(a1 + 32);
  __int128 v11 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(v10 + 40);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_39AC;
  v14[3] = &unk_C480;
  v14[4] = v10;
  id v15 = v11;
  id v16 = v9;
  id v17 = *(id *)(a1 + 48);
  id v13 = v9;
  NStatManagerQueryAllSourcesUpdate(v12, v14);
}

void sub_26D0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
}

uint64_t sub_2708(uint64_t a1, const void *a2)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_2800;
  v7[3] = &unk_C4E8;
  v7[4] = *(void *)(a1 + 32);
  v7[5] = a2;
  NStatSourceSetDescriptionBlock(a2, v7);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_3294;
  v6[3] = &unk_C4E8;
  v6[4] = *(void *)(a1 + 32);
  v6[5] = a2;
  NStatSourceSetCountsBlock(a2, v6);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_3668;
  v5[3] = &unk_C510;
  v5[4] = *(void *)(a1 + 32);
  v5[5] = a2;
  return NStatSourceSetRemovedBlock(a2, v5);
}

void sub_2800(uint64_t a1, void *a2)
{
  id v4 = a2;
  v5 = sub_2D7C(*(void *)(a1 + 32) + 96LL, (uint64_t *)(a1 + 40));
  id v6 = v4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kNStatSrcKeyPID]);
  id v8 = [v7 copy];
  __int128 v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)*v5;
  }
  objc_storeStrong((id *)v5, v10);

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kNStatSrcKeyInterface]);
  id v12 = [v11 integerValue];
  if (qword_113D0 != -1) {
    dispatch_once(&qword_113D0, &stru_C5D0);
  }
  id v13 = (void *)qword_113C8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v12));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v14]);

  id v16 = v15;
  if (!v15)
  {
    __int128 v43 = xmmword_8A10;
    int v44 = (int)v12;
    int v45 = 1;
    size_t v41 = 180LL;
    if (sysctl((int *)&v43, 6u, uu, &v41, 0LL, 0LL)
      || (id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", uu))) == 0LL)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%i", v12));
    }

    id v17 = (void *)qword_113C8;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v12));
    [v17 setObject:v15 forKey:v18];

    id v16 = v15;
    if (!v15) {
      id v16 = (void *)v5[41];
    }
  }

  objc_storeStrong((id *)v5 + 41, v16);

  v19 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kNStatSrcKeyProvider]);
  id v20 = [v19 copy];
  v21 = v20;
  v22 = (void **)(v5 + 42);
  if (v20) {
    v23 = v20;
  }
  else {
    v23 = (void *)v5[42];
  }
  objc_storeStrong((id *)v5 + 42, v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kNStatSrcKeyTCPState]);
  id v25 = [v24 copy];
  if (v25) {
    v26 = v25;
  }
  else {
    v26 = (void *)v5[43];
  }
  objc_storeStrong((id *)v5 + 43, v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kNStatSrcKeyLocal]);
  v28 = v27;
  if (v27)
  {
    id v29 = v27;
    sub_3D8C( (unsigned __int8 *)v5 + 8,  (unsigned __int8 *)[v29 bytes],  (size_t)objc_msgSend(v29, "length"));
    sub_3E20((const sockaddr *)(v5 + 1), *v22);
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kNStatSrcKeyRemote]);
  v31 = v30;
  if (v30)
  {
    id v32 = v30;
    sub_3D8C( (unsigned __int8 *)v5 + 64,  (unsigned __int8 *)[v32 bytes],  (size_t)objc_msgSend(v32, "length"));
    sub_3E20((const sockaddr *)v5 + 4, *v22);
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"fuuid"]);
  if ([v33 length])
  {
    v34 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v33);
    -[NSUUID getUUIDBytes:](v34, "getUUIDBytes:", uu);
    if (v34 && !uuid_is_null(uu))
    {
      while (1)
      {
        v38 = (nw_path *)nw_path_copy_path_for_client(uu);
        v39 = v38;
        if (!v38 || nw_path_get_status(v38) == nw_path_status_invalid)
        {
          uint64_t v35 = 0LL;
          goto LABEL_35;
        }

        v36 = (void *)nw_path_copy_parameters(v39);
        uint64_t account_id = nw_parameters_get_account_id();
        if (account_id)
        {
          uint64_t v35 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", account_id));
          goto LABEL_34;
        }

        nw_parameters_get_parent_id(v36, &v43);
        *(_OWORD *)uu = v43;
      }

      uint64_t v35 = 0LL;
LABEL_34:

LABEL_35:
    }

    else
    {
      uint64_t v35 = 0LL;
    }

    v40 = (void *)v5[45];
    v5[45] = v35;
  }
}

void sub_2C98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_2D7C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = 0x9DDFEA08EB382D69LL * ((8 * *a2 + 8LL) ^ HIDWORD(*a2));
  unint64_t v6 = 0x9DDFEA08EB382D69LL * (HIDWORD(*a2) ^ (v5 >> 47) ^ v5);
  unint64_t v7 = 0x9DDFEA08EB382D69LL * (v6 ^ (v6 >> 47));
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v2 = 0x9DDFEA08EB382D69LL * (v6 ^ (v6 >> 47));
      if (v7 >= v8) {
        unint64_t v2 = v7 % v8;
      }
    }

    else
    {
      unint64_t v2 = v7 & (v8 - 1);
    }

    id v10 = *(void **)(*(void *)a1 + 8 * v2);
    if (v10)
    {
      __int128 v11 = (void *)*v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v4) {
              return v11 + 3;
            }
          }

          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }

            else
            {
              v12 &= v8 - 1;
            }

            if (v12 != v2) {
              break;
            }
          }

          __int128 v11 = (void *)*v11;
        }

        while (v11);
      }
    }
  }

  id v13 = (void *)(a1 + 16);
  v14 = (char *)operator new(0x188uLL);
  v36[0] = v14;
  v36[1] = a1 + 16;
  *(void *)v14 = 0LL;
  *((void *)v14 + 1) = v7;
  *((void *)v14 + 2) = v4;
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 56) = 0u;
  *(_OWORD *)(v14 + 72) = 0u;
  *(_OWORD *)(v14 + 88) = 0u;
  *(_OWORD *)(v14 + 104) = 0u;
  *(_OWORD *)(v14 + 120) = 0u;
  *(_OWORD *)(v14 + 136) = 0u;
  *(_OWORD *)(v14 + 152) = 0u;
  *(_OWORD *)(v14 + 168) = 0u;
  *(_OWORD *)(v14 + 184) = 0u;
  *(_OWORD *)(v14 + 200) = 0u;
  *(_OWORD *)(v14 + 216) = 0u;
  *(_OWORD *)(v14 + 232) = 0u;
  *(_OWORD *)(v14 + 248) = 0u;
  *(_OWORD *)(v14 + 264) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  *(_OWORD *)(v14 + 280) = 0u;
  *(_OWORD *)(v14 + 296) = 0u;
  *(_OWORD *)(v14 + 312) = 0u;
  *(_OWORD *)(v14 + 328) = 0u;
  *(_OWORD *)(v14 + 344) = 0u;
  *(_OWORD *)(v14 + 360) = 0u;
  *(_OWORD *)(v14 + 376) = 0u;
  sub_3FC4((void *)v14 + 18, 0LL);
  sub_3FC4((void *)v14 + 31, 0LL);
  *((void *)v14 + 48) = 0LL;
  *((_OWORD *)v14 + 22) = 0u;
  *((_OWORD *)v14 + 23) = 0u;
  char v37 = 1;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = (v8 & (v8 - 1)) == 0;
    if (v8 < 3) {
      BOOL v17 = 0;
    }
    unint64_t v18 = (2 * v8) | !v17;
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      int8x8_t prime = (int8x8_t)v19;
    }
    else {
      int8x8_t prime = (int8x8_t)v18;
    }
    if (*(void *)&prime == 1LL)
    {
      int8x8_t prime = (int8x8_t)2LL;
    }

    else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }

    unint64_t v8 = *(void *)(a1 + 8);
    if (*(void *)&prime > v8) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v8)
    {
      unint64_t v27 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v8 < 3 || (uint8x8_t v28 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
      {
        unint64_t v27 = std::__next_prime(v27);
      }

      else
      {
        uint64_t v29 = 1LL << -(char)__clz(v27 - 1);
        if (v27 >= 2) {
          unint64_t v27 = v29;
        }
      }

      if (*(void *)&prime <= v27) {
        int8x8_t prime = (int8x8_t)v27;
      }
      if (*(void *)&prime >= v8)
      {
        unint64_t v8 = *(void *)(a1 + 8);
      }

      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            sub_446C();
          }
          v21 = operator new(8LL * *(void *)&prime);
          v22 = *(void **)a1;
          *(void *)a1 = v21;
          if (v22) {
            operator delete(v22);
          }
          uint64_t v23 = 0LL;
          *(int8x8_t *)(a1 + 8) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v23++) = 0LL;
          while (*(void *)&prime != v23);
          v24 = (void *)*v13;
          if (*v13)
          {
            unint64_t v25 = v24[1];
            uint8x8_t v26 = (uint8x8_t)vcnt_s8(prime);
            v26.i16[0] = vaddlv_u8(v26);
            if (v26.u32[0] > 1uLL)
            {
              if (v25 >= *(void *)&prime) {
                v25 %= *(void *)&prime;
              }
            }

            else
            {
              v25 &= *(void *)&prime - 1LL;
            }

            *(void *)(*(void *)a1 + 8 * v25) = v13;
            v30 = (void *)*v24;
            if (*v24)
            {
              do
              {
                unint64_t v31 = v30[1];
                if (v26.u32[0] > 1uLL)
                {
                  if (v31 >= *(void *)&prime) {
                    v31 %= *(void *)&prime;
                  }
                }

                else
                {
                  v31 &= *(void *)&prime - 1LL;
                }

                if (v31 != v25)
                {
                  if (!*(void *)(*(void *)a1 + 8 * v31))
                  {
                    *(void *)(*(void *)a1 + 8 * v31) = v24;
                    goto LABEL_55;
                  }

                  void *v24 = *v30;
                  void *v30 = **(void **)(*(void *)a1 + 8 * v31);
                  **(void **)(*(void *)a1 + 8 * v31) = v30;
                  v30 = v24;
                }

                unint64_t v31 = v25;
LABEL_55:
                v24 = v30;
                v30 = (void *)*v30;
                unint64_t v25 = v31;
              }

              while (v30);
            }
          }

          unint64_t v8 = (unint64_t)prime;
          goto LABEL_59;
        }

        uint64_t v35 = *(void **)a1;
        *(void *)a1 = 0LL;
        if (v35) {
          operator delete(v35);
        }
        unint64_t v8 = 0LL;
        *(void *)(a1 + 8) = 0LL;
      }
    }

LABEL_59:
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v2 = v7 % v8;
      }
      else {
        unint64_t v2 = v7;
      }
    }

    else
    {
      unint64_t v2 = (v8 - 1) & v7;
    }
  }

  id v32 = *(void **)(*(void *)a1 + 8 * v2);
  if (v32)
  {
    *(void *)v36[0] = *v32;
    *id v32 = v36[0];
  }

  else
  {
    *(void *)v36[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v36[0];
    *(void *)(*(void *)a1 + 8 * v2) = v13;
    if (*(void *)v36[0])
    {
      unint64_t v33 = *(void *)(*(void *)v36[0] + 8LL);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v33 >= v8) {
          v33 %= v8;
        }
      }

      else
      {
        v33 &= v8 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v33) = v36[0];
    }
  }

  __int128 v11 = (void *)v36[0];
  v36[0] = 0LL;
  ++*(void *)(a1 + 24);
  sub_4494((uint64_t)v36);
  return v11 + 3;
}

    if ((value & (value - 1)) != 0)
    {
      if (value <= v15) {
        unint64_t v5 = v15 % value;
      }
      else {
        unint64_t v5 = v15;
      }
    }

    else
    {
      unint64_t v5 = (value - 1) & v15;
    }
  }

  v38 = p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_;
  v39 = (void **)p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v5];
  if (v39)
  {
    *(void *)unint64_t v19 = *v39;
  }

  else
  {
    *(void *)unint64_t v19 = p_processInfoByPID->__table_.__p1_.__value_.__next_;
    p_processInfoByPID->__table_.__p1_.__value_.__next_ = v19;
    v38[v5] = &p_processInfoByPID->__table_.__p1_;
    if (!*(void *)v19) {
      goto LABEL_73;
    }
    v40 = *(void *)(*(void *)v19 + 8LL);
    if ((value & (value - 1)) != 0)
    {
      if (v40 >= value) {
        v40 %= value;
      }
    }

    else
    {
      v40 &= value - 1;
    }

    v39 = &p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v40];
  }

  nw_path *v39 = v19;
LABEL_73:
  ++p_processInfoByPID->__table_.__p2_.__value_;
LABEL_74:
  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  v123 = 0u;
  memset(buffer, 0, sizeof(buffer));
  size_t v41 = proc_pid_rusage((int)[v11 intValue], 2, (rusage_info_t *)buffer);
  if (v41 != 3)
  {
    if (v41
      || proc_pidinfo((int)[v11 intValue], 20, 1uLL, v111, 40) <= 0
      || coalition_info_resource_usage(v111[0], v112, 352LL))
    {
      v42 = [v11 intValue];
      __int128 v43 = __error();
      int v44 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"couldn't get info for process %i: %s",  v42,  strerror(*v43));
      int v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
      [v10 setObject:v45 forKeyedSubscript:@"error"];
    }

    else
    {
      v58 = v117 + v116 + v119 - v118;
      v59 = *((void *)v19 + 3);
      if (!v59)
      {
        *((void *)v19 + 3) = v58;
        v59 = v58;
      }

      *((_OWORD *)v19 + 2) = *((_OWORD *)v19 + 3);
      *((void *)v19 + 6) = v127;
      *((void *)v19 + 7) = v58 - v59;
      v60 = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (double)(mach_absolute_time() - (unint64_t)v123) / 1000000000.0);
      v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
      [v10 setObject:v61 forKeyedSubscript:@"process.age"];

      v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)v19 + 6)));
      [v10 setObject:v62 forKeyedSubscript:@"disk.rd.bytes"];

      v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)v19 + 6) - *((void *)v19 + 4)));
      [v10 setObject:v63 forKeyedSubscript:@"disk.rd.bytes.delta"];

      v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)v19 + 7)));
      [v10 setObject:v64 forKeyedSubscript:@"disk.wr.bytes"];

      v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)v19 + 7) - *((void *)v19 + 5)));
      [v10 setObject:v65 forKeyedSubscript:@"disk.wr.bytes.delta"];

      v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)v19 + 7) + *((void *)v19 + 6)));
      [v10 setObject:v66 forKeyedSubscript:@"disk.bytes"];

      v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)v19 + 7) + *((void *)v19 + 6) - (*((void *)v19 + 4) + *((void *)v19 + 5))));
      [v10 setObject:v67 forKeyedSubscript:@"disk.bytes.delta"];

      if ([v9 containsObject:@"disk.openfiles[]"])
      {
        v68 = proc_pidinfo((int)[v11 intValue], 1, 0, 0, 0);
        v69 = v68;
        if ((v68 & 0x80000000) != 0)
        {
          v96 = [v11 intValue];
          v97 = __error();
          v98 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"couldn't determine number of file descriptors of process %i: %s",  v96,  strerror(*v97));
          v99 = (void *)objc_claimAutoreleasedReturnValue(v98);
          [v10 setObject:v99 forKeyedSubscript:@"error"];
        }

        else
        {
          v70 = malloc(v68);
          v71 = proc_pidinfo((int)[v11 intValue], 1, 0, v70, v69);
          v109 = v70;
          if (v71 < 0)
          {
            v103 = [v11 intValue];
            v104 = __error();
            v105 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"couldn't get list of file descriptors of process %i: %s",  v103,  strerror(*v104));
            v93 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v105);
            [v10 setObject:v93 forKeyedSubscript:@"error"];
          }

          else
          {
            v110 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
            if (v71 >= 8)
            {
              else {
                v72 = (unint64_t)v71 >> 3;
              }
              v73 = v70 + 1;
              do
              {
                if (*v73 == 1)
                {
                  v74 = *(v73 - 1);
                  v75 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
                  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v74));
                  -[NSMutableDictionary setObject:forKeyedSubscript:]( v75,  "setObject:forKeyedSubscript:",  v76,  @"fd");

                  if (proc_pidfdinfo((int)[v11 intValue], v74, 2, v112, 1200) < 0)
                  {
                    v82 = [v11 intValue];
                    v83 = __error();
                    v84 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"couldn't get info for file descriptor %i of process %i: %s",  v74,  v82,  strerror(*v83));
                    v81 = (void *)objc_claimAutoreleasedReturnValue(v84);
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v75,  "setObject:forKeyedSubscript:",  v81,  @"error");
                  }

                  else
                  {
                    v77 = (v112[0] & 3) - 1LL;
                    v78 = &stru_CA30;
                    v79 = v114 & 0xF000;
                    if (v79 - 4096 < 0xA000 && (v80 = (v79 - 4096) >> 12, ((0x2ABu >> v80) & 1) != 0)) {
                      v81 = *(&off_C6F0 + v80);
                    }
                    else {
                      v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%04o",  v79 >> 12));
                    }
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v75,  "setObject:forKeyedSubscript:",  v81,  @"type");
                    v85 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v112[0]));
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v75,  "setObject:forKeyedSubscript:",  v85,  @"openflags");

                    v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v112[1]));
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v75,  "setObject:forKeyedSubscript:",  v86,  @"status");

                    v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v118));
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v75,  "setObject:forKeyedSubscript:",  v87,  @"filesize");

                    v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%i%@",  v74,  v78));
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v75,  "setObject:forKeyedSubscript:",  v88,  @"fddesc");

                    v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v120));
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v75,  "setObject:forKeyedSubscript:",  v89,  @"device");

                    v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v113));
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v75,  "setObject:forKeyedSubscript:",  v90,  @"offset");

                    v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v115));
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v75,  "setObject:forKeyedSubscript:",  v91,  @"inode");

                    v92 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  &v121));
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v75,  "setObject:forKeyedSubscript:",  v92,  @"path");
                  }

                  -[NSMutableArray addObject:](v110, "addObject:", v75);
                }

                v73 += 2;
                --v72;
              }

              while (v72);
            }

            v93 = v110;
            [v10 setObject:v110 forKeyedSubscript:@"disk.openfiles[]"];
          }

          free(v109);
        }
      }
    }

    v46 = 1;
    goto LABEL_162;
  }

  v47 = [v11 intValue];
  v48 = p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (!v48) {
    goto LABEL_161;
  }
  v49 = v47;
  v50 = v47;
  v51 = (uint8x8_t)vcnt_s8((int8x8_t)v48);
  v51.i16[0] = vaddlv_u8(v51);
  if (v51.u32[0] > 1uLL)
  {
    v52 = v47;
    if (v48 <= v47) {
      v52 = v47 % v48;
    }
  }

  else
  {
    v52 = (v48 - 1) & v47;
  }

  v53 = p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_;
  v54 = (void **)p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v52];
  if (!v54) {
    goto LABEL_161;
  }
  v55 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<int, (anonymous namespace)::ProcessInfo>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<int, (anonymous namespace)::ProcessInfo>, void *>>> *)*v54;
  if (!*v54) {
    goto LABEL_161;
  }
  v56 = v48 - 1;
  while (1)
  {
    v57 = (unint64_t)v55[1].__value_.__next_;
    if (v57 == v50) {
      break;
    }
    if (v51.u32[0] > 1uLL)
    {
      if (v57 >= v48) {
        v57 %= v48;
      }
    }

    else
    {
      v57 &= v56;
    }

    if (v57 != v52) {
      goto LABEL_161;
    }
LABEL_96:
    v55 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<int, (anonymous namespace)::ProcessInfo>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<int, (anonymous namespace)::ProcessInfo>, void *>>> *)v55->__value_.__next_;
    if (!v55) {
      goto LABEL_161;
    }
  }

  if (LODWORD(v55[2].__value_.__next_) != v49) {
    goto LABEL_96;
  }
  v95 = (unint64_t *)v55->__value_.__next_;
  if (v51.u32[0] > 1uLL)
  {
    if (v48 <= v50) {
      v50 %= v48;
    }
  }

  else
  {
    v50 &= v56;
  }

  v100 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<int, (anonymous namespace)::ProcessInfo>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<int, (anonymous namespace)::ProcessInfo>, void *>>> *)v53[v50];
  do
  {
    v101 = v100;
    v100 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<int, (anonymous namespace)::ProcessInfo>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<int, (anonymous namespace)::ProcessInfo>, void *>>> *)v100->__value_.__next_;
  }

  while (v100 != v55);
  if (v101 == &p_processInfoByPID->__table_.__p1_) {
    goto LABEL_150;
  }
  v102 = (unint64_t)v101[1].__value_.__next_;
  if (v51.u32[0] > 1uLL)
  {
    if (v102 >= v48) {
      v102 %= v48;
    }
  }

  else
  {
    v102 &= v56;
  }

  if (v102 == v50)
  {
LABEL_152:
    if (v95)
    {
      v106 = v95[1];
      goto LABEL_154;
    }
  }

  else
  {
LABEL_150:
    if (!v95) {
      goto LABEL_151;
    }
    v106 = v95[1];
    if (v51.u32[0] > 1uLL)
    {
      v107 = v95[1];
      if (v106 >= v48) {
        v107 = v106 % v48;
      }
    }

    else
    {
      v107 = v106 & v56;
    }

    if (v107 != v50)
    {
LABEL_151:
      v53[v50] = 0LL;
      v95 = (unint64_t *)v55->__value_.__next_;
      goto LABEL_152;
    }

void sub_3240(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_3294(uint64_t a1, void *a2)
{
  id v5 = a2;
  unint64_t v6 = sub_2D7C(*(void *)(a1 + 32) + 96LL, (uint64_t *)(a1 + 40));
  __int128 v7 = *((_OWORD *)v6 + 16);
  *(_OWORD *)(v6 + 21) = *((_OWORD *)v6 + 17);
  __int128 v8 = *((_OWORD *)v6 + 19);
  *(_OWORD *)(v6 + 23) = *((_OWORD *)v6 + 18);
  *(_OWORD *)(v6 + 25) = v8;
  v6[27] = v6[40];
  __int128 v9 = *((_OWORD *)v6 + 15);
  *(_OWORD *)(v6 + 15) = *((_OWORD *)v6 + 14);
  *(_OWORD *)(v6 + 17) = v9;
  *(_OWORD *)(v6 + 19) = v7;
  sub_3FC4(v35, v5);
  __int128 v10 = v35[5];
  *((_OWORD *)v6 + 18) = v35[4];
  *((_OWORD *)v6 + 19) = v10;
  v6[40] = v36;
  __int128 v11 = v35[1];
  *((_OWORD *)v6 + 14) = v35[0];
  *((_OWORD *)v6 + 15) = v11;
  __int128 v12 = v35[3];
  *((_OWORD *)v6 + 16) = v35[2];
  *((_OWORD *)v6 + 17) = v12;
  signed int v13 = [(id)*v6 intValue];
  signed int v14 = v13;
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = v15 + 56;
  unint64_t v17 = v13;
  unint64_t v18 = *(void *)(v15 + 64);
  if (v18)
  {
    uint8x8_t v19 = (uint8x8_t)vcnt_s8((int8x8_t)v18);
    v19.i16[0] = vaddlv_u8(v19);
    if (v19.u32[0] > 1uLL)
    {
      unint64_t v2 = v13;
      if (v18 <= v13) {
        unint64_t v2 = v13 % v18;
      }
    }

    else
    {
      unint64_t v2 = (v18 - 1) & v13;
    }

    id v20 = *(void ***)(*(void *)v16 + 8 * v2);
    if (v20)
    {
      v21 = (char *)*v20;
      if (*v20)
      {
        do
        {
          unint64_t v22 = *((void *)v21 + 1);
          if (v22 == v13)
          {
            if (*((_DWORD *)v21 + 4) == v13) {
              goto LABEL_40;
            }
          }

          else
          {
            if (v19.u32[0] > 1uLL)
            {
              if (v22 >= v18) {
                v22 %= v18;
              }
            }

            else
            {
              v22 &= v18 - 1;
            }

            if (v22 != v2) {
              break;
            }
          }

          v21 = *(char **)v21;
        }

        while (v21);
      }
    }
  }

  v21 = (char *)operator new(0xE8uLL);
  *(void *)v21 = 0LL;
  *((void *)v21 + 1) = v17;
  *((_DWORD *)v21 + 4) = v14;
  *(_OWORD *)(v21 + 40) = 0u;
  *(_OWORD *)(v21 + 56) = 0u;
  *(_OWORD *)(v21 + 72) = 0u;
  *(_OWORD *)(v21 + 88) = 0u;
  *(_OWORD *)(v21 + 104) = 0u;
  *(_OWORD *)(v21 + 120) = 0u;
  *(_OWORD *)(v21 + 136) = 0u;
  *(_OWORD *)(v21 + 152) = 0u;
  *(_OWORD *)(v21 + 168) = 0u;
  *(_OWORD *)(v21 + 184) = 0u;
  *(_OWORD *)(v21 + 200) = 0u;
  *(_OWORD *)(v21 + 216) = 0u;
  *(_OWORD *)(v21 + 24) = 0u;
  sub_3FC4((void *)v21 + 3, 0LL);
  sub_3FC4((void *)v21 + 16, 0LL);
  float v23 = (float)(unint64_t)(*(void *)(v16 + 24) + 1LL);
  float v24 = *(float *)(v16 + 32);
  if (!v18 || (float)(v24 * (float)v18) < v23)
  {
    BOOL v25 = 1LL;
    if (v18 >= 3) {
      BOOL v25 = (v18 & (v18 - 1)) != 0;
    }
    unint64_t v26 = v25 | (2 * v18);
    unint64_t v27 = vcvtps_u32_f32(v23 / v24);
    if (v26 <= v27) {
      size_t v28 = v27;
    }
    else {
      size_t v28 = v26;
    }
    sub_4274(v16, v28);
    unint64_t v18 = *(void *)(v16 + 8);
    if ((v18 & (v18 - 1)) != 0)
    {
      if (v18 <= v17) {
        unint64_t v2 = v17 % v18;
      }
      else {
        unint64_t v2 = v17;
      }
    }

    else
    {
      unint64_t v2 = (v18 - 1) & v17;
    }
  }

  uint64_t v29 = *(void *)v16;
  v30 = *(void **)(*(void *)v16 + 8 * v2);
  if (v30)
  {
    *(void *)v21 = *v30;
LABEL_38:
    void *v30 = v21;
    goto LABEL_39;
  }

  *(void *)v21 = *(void *)(v16 + 16);
  *(void *)(v16 + 16) = v21;
  *(void *)(v29 + 8 * v2) = v16 + 16;
  if (*(void *)v21)
  {
    unint64_t v31 = *(void *)(*(void *)v21 + 8LL);
    if ((v18 & (v18 - 1)) != 0)
    {
      if (v31 >= v18) {
        v31 %= v18;
      }
    }

    else
    {
      v31 &= v18 - 1;
    }

    v30 = (void *)(*(void *)v16 + 8 * v31);
    goto LABEL_38;
  }

void sub_363C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3668(uint64_t a1)
{
  unint64_t v2 = (void *)NStatSourceCopyCounts(*(void *)(a1 + 40));
  dispatch_queue_t v3 = sub_2D7C(*(void *)(a1 + 32) + 96LL, (uint64_t *)(a1 + 40));
  if (v2)
  {
    uint64_t v4 = v3;
    __int128 v5 = *((_OWORD *)v3 + 16);
    *(_OWORD *)(v3 + 21) = *((_OWORD *)v3 + 17);
    __int128 v6 = *((_OWORD *)v3 + 19);
    *(_OWORD *)(v3 + 23) = *((_OWORD *)v3 + 18);
    *(_OWORD *)(v3 + 25) = v6;
    v3[27] = v3[40];
    __int128 v7 = *((_OWORD *)v3 + 15);
    *(_OWORD *)(v3 + 15) = *((_OWORD *)v3 + 14);
    *(_OWORD *)(v3 + 17) = v7;
    *(_OWORD *)(v3 + 19) = v5;
    sub_3FC4(&v30, v2);
    __int128 v8 = v35;
    *((_OWORD *)v4 + 18) = v34;
    *((_OWORD *)v4 + 19) = v8;
    v4[40] = v36;
    __int128 v9 = v31;
    *((_OWORD *)v4 + 14) = v30;
    *((_OWORD *)v4 + 15) = v9;
    __int128 v10 = v33;
    *((_OWORD *)v4 + 16) = v32;
    *((_OWORD *)v4 + 17) = v10;
  }

  unint64_t v11 = *(void *)(a1 + 40);
  __int128 v12 = (uint64_t *)(*(void *)(a1 + 32) + 96LL);
  int8x8_t v13 = *(int8x8_t *)(*(void *)(a1 + 32) + 104LL);
  if (!*(void *)&v13) {
    goto LABEL_49;
  }
  unint64_t v14 = 0x9DDFEA08EB382D69LL * (((8 * v11) + 8LL) ^ HIDWORD(v11));
  unint64_t v15 = 0x9DDFEA08EB382D69LL * (HIDWORD(v11) ^ (v14 >> 47) ^ v14);
  unint64_t v16 = 0x9DDFEA08EB382D69LL * (v15 ^ (v15 >> 47));
  uint8x8_t v17 = (uint8x8_t)vcnt_s8(v13);
  v17.i16[0] = vaddlv_u8(v17);
  if (v17.u32[0] > 1uLL)
  {
    unint64_t v18 = v16;
    if (v16 >= *(void *)&v13) {
      unint64_t v18 = v16 % *(void *)&v13;
    }
  }

  else
  {
    unint64_t v18 = v16 & (*(void *)&v13 - 1LL);
  }

  uint64_t v19 = *v12;
  id v20 = *(void **)(*v12 + 8 * v18);
  if (!v20) {
    goto LABEL_49;
  }
  v21 = (void *)*v20;
  if (!v21) {
    goto LABEL_49;
  }
  uint64_t v22 = *(void *)&v13 - 1LL;
  while (1)
  {
    unint64_t v23 = v21[1];
    if (v23 == v16) {
      break;
    }
    if (v17.u32[0] > 1uLL)
    {
      if (v23 >= *(void *)&v13) {
        v23 %= *(void *)&v13;
      }
    }

    else
    {
      v23 &= v22;
    }

    if (v23 != v18) {
      goto LABEL_49;
    }
LABEL_19:
    v21 = (void *)*v21;
    if (!v21) {
      goto LABEL_49;
    }
  }

  if (v21[2] != v11) {
    goto LABEL_19;
  }
  float v24 = (void *)*v21;
  if (v17.u32[0] > 1uLL)
  {
    if (v16 >= *(void *)&v13) {
      v16 %= *(void *)&v13;
    }
  }

  else
  {
    v16 &= v22;
  }

  BOOL v25 = *(void **)(v19 + 8 * v16);
  do
  {
    unint64_t v26 = v25;
    BOOL v25 = (void *)*v25;
  }

  while (v25 != v21);
  if (v26 == (void *)(*(void *)(a1 + 32) + 112LL)) {
    goto LABEL_38;
  }
  unint64_t v27 = v26[1];
  if (v17.u32[0] > 1uLL)
  {
    if (v27 >= *(void *)&v13) {
      v27 %= *(void *)&v13;
    }
  }

  else
  {
    v27 &= v22;
  }

  if (v27 == v16)
  {
LABEL_40:
    if (v24)
    {
      unint64_t v28 = v24[1];
      goto LABEL_42;
    }
  }

  else
  {
LABEL_38:
    if (!v24) {
      goto LABEL_39;
    }
    unint64_t v28 = v24[1];
    if (v17.u32[0] > 1uLL)
    {
      unint64_t v29 = v24[1];
      if (v28 >= *(void *)&v13) {
        unint64_t v29 = v28 % *(void *)&v13;
      }
    }

    else
    {
      unint64_t v29 = v28 & v22;
    }

    if (v29 != v16)
    {
LABEL_39:
      *(void *)(v19 + 8 * v16) = 0LL;
      float v24 = (void *)*v21;
      goto LABEL_40;
    }

LABEL_42:
    if (v17.u32[0] > 1uLL)
    {
      if (v28 >= *(void *)&v13) {
        v28 %= *(void *)&v13;
      }
    }

    else
    {
      v28 &= v22;
    }

    if (v28 != v16)
    {
      *(void *)(*v12 + 8 * v28) = v26;
      float v24 = (void *)*v21;
    }
  }

  void *v26 = v24;
  void *v21 = 0LL;
  --v12[3];
  *(void *)&__int128 v30 = v21;
  *((void *)&v30 + 1) = v12 + 2;
  LOBYTE(v31) = 1;
  sub_4494((uint64_t)&v30);
  unint64_t v11 = *(void *)(a1 + 40);
LABEL_49:
  CFRelease((CFTypeRef)v11);
}

void sub_394C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 sub_395C(uint64_t a1)
{
  for (i = *(uint64_t **)(*(void *)(a1 + 32) + 72LL); i; i = (uint64_t *)*i)
  {
    __int128 v2 = *((_OWORD *)i + 10);
    *(_OWORD *)(i + 9) = *((_OWORD *)i + 11);
    __int128 v3 = *((_OWORD *)i + 13);
    *(_OWORD *)(i + 11) = *((_OWORD *)i + 12);
    *(_OWORD *)(i + 13) = v3;
    __n128 result = *((__n128 *)i + 8);
    __int128 v5 = *((_OWORD *)i + 9);
    *(__n128 *)(i + 3) = result;
    *(_OWORD *)(i + 5) = v5;
    i[15] = i[28];
    *(_OWORD *)(i + 7) = v2;
  }

  return result;
}

void sub_39AC(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[2] = sub_3A54;
  v5[3] = &unk_C480;
  uint64_t v2 = *(void *)(a1 + 32);
  __int128 v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(dispatch_queue_s **)(v2 + 24);
  v5[1] = 3221225472LL;
  v5[4] = v2;
  id v6 = v3;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  dispatch_sync(v4, v5);
}

void sub_3A54(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = *(id *)(a1 + 40);
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)v8);
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  32LL,  (void)v11));
        [v10 setObject:v9 forKeyedSubscript:@"pid"];
        [v10 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"time"];
        if ([*(id *)(a1 + 32) captureAttributes:*(void *)(a1 + 56) toDictionary:v10 forPID:v9]) {
          [*(id *)(*(void *)(a1 + 32) + 32) setObject:v10 forKeyedSubscript:v9];
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }
}

void sub_3BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_3C1C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_3C2C(uint64_t a1)
{
}

void sub_3C34(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_3D8C(unsigned __int8 *__dst, unsigned __int8 *__src, size_t __n)
{
  if (__n - 29 >= 0xFFFFFFFFFFFFFFE4LL)
  {
    size_t v5 = *__src;
    if (v5 <= __n && ((_DWORD)v5 != *__dst || memcmp(__src, __dst, v5)))
    {
      memcpy(__dst, __src, __n);
      uint64_t v7 = (void *)*((void *)__dst + 4);
      *((void *)__dst + 4) = 0LL;

      id v8 = (void *)*((void *)__dst + 5);
      *((void *)__dst + 5) = 0LL;
    }
  }
}

void sub_3E20(const sockaddr *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!*(void *)&a1[2].sa_len || !*(void *)&a1[2].sa_data[6])
  {
    if (v3)
    {
      else {
        int v5 = 10;
      }
    }

    else
    {
      int v5 = 10;
    }

    int v6 = getnameinfo(a1, a1->sa_len, v17, 0x401u, v16, 0x20u, v5);
    if (v6)
    {
      uint64_t v7 = *(void **)&a1[2].sa_len;
      *(void *)&a1[2].sa_len = @"?";

      id v8 = *(void **)&a1[2].sa_data[6];
      *(void *)&a1[2].sa_data[6] = @"?";

      uint64_t v9 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", gai_strerror(v6));
      uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
      __int128 v11 = *(void **)&a1[3].sa_len;
      *(void *)&a1[3].sa_len = v10;
    }

    else
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v17));
      __int128 v13 = *(void **)&a1[2].sa_len;
      *(void *)&a1[2].sa_len = v12;

      uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v16));
      unint64_t v15 = *(void **)&a1[2].sa_data[6];
      *(void *)&a1[2].sa_data[6] = v14;

      __int128 v11 = *(void **)&a1[3].sa_len;
      *(void *)&a1[3].sa_len = 0LL;
    }
  }
}

void sub_3F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3F9C(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NSCache);
  id v2 = (void *)qword_113C8;
  qword_113C8 = (uint64_t)v1;
}

void *sub_3FC4(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kNStatSrcKeyRxPackets]);
    *a1 = [v5 integerValue];

    int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kNStatSrcKeyRxBytes]);
    a1[1] = [v6 integerValue];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kNStatSrcKeyTxPackets]);
    a1[2] = [v7 integerValue];

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kNStatSrcKeyTxBytes]);
    a1[3] = [v8 integerValue];

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kNStatSrcKeyRxDupeBytes]);
    a1[4] = [v9 integerValue];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kNStatSrcKeyRxOOOBytes]);
    a1[5] = [v10 integerValue];

    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kNStatSrcKeyTxReTx]);
    a1[6] = [v11 integerValue];

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kNStatSrcKeyConnectAttempt]);
    a1[7] = [v12 integerValue];

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kNStatSrcKeyConnectSuccess]);
    a1[8] = [v13 integerValue];

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kNStatSrcKeyRxCellularBytes]);
    a1[9] = [v14 integerValue];

    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kNStatSrcKeyTxCellularBytes]);
    a1[10] = [v15 integerValue];

    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kNStatSrcKeyRxWiFiBytes]);
    a1[11] = [v16 integerValue];

    uint8x8_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kNStatSrcKeyTxWiFiBytes]);
    a1[12] = [v17 integerValue];
  }

  else
  {
    a1[12] = 0LL;
    *((_OWORD *)a1 + 4) = 0u;
    *((_OWORD *)a1 + 5) = 0u;
    *((_OWORD *)a1 + 2) = 0u;
    *((_OWORD *)a1 + 3) = 0u;
    *(_OWORD *)a1 = 0u;
    *((_OWORD *)a1 + 1) = 0u;
  }

  return a1;
}

void sub_4224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4274(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2LL;
  }

  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }

  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }

    else
    {
      uint64_t v13 = 1LL << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }

    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      unint64_t v16 = *(void **)a1;
      *(void *)a1 = 0LL;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + 8) = 0LL;
      return;
    }
  }

  if (prime >> 61) {
    sub_446C();
  }
  int v5 = operator new(8 * prime);
  int v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0LL;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0LL;
  while (prime != v7);
  id v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }

    else
    {
      v9 &= prime - 1;
    }

    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    uint64_t v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }

        else
        {
          v15 &= prime - 1;
        }

        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }

          *id v8 = *v14;
          void *v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          uint64_t v14 = v8;
        }

        size_t v15 = v9;
LABEL_31:
        id v8 = v14;
        uint64_t v14 = (void *)*v14;
        size_t v9 = v15;
      }

      while (v14);
    }
  }

void sub_446C()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t sub_4494(uint64_t a1)
{
  id v2 = *(id **)a1;
  *(void *)a1 = 0LL;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16)) {
      sub_44D8(v2 + 2);
    }
    operator delete(v2);
  }

  return a1;
}

void sub_44D8(id *a1)
{
}

void sub_4694(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___IDEDataProvider_Energy);
  id v2 = (void *)qword_113D8;
  qword_113D8 = (uint64_t)v1;
}

void sub_472C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_477C(id a1)
{
  v4[0] = @"energy.cost";
  v4[1] = @"energy.overhead";
  v4[2] = @"energy.version";
  v4[3] = @"energy.cpu.cost";
  v4[4] = @"energy.cpu.overhead";
  v4[5] = @"energy.networking.cost";
  v4[6] = @"energy.networkning.overhead";
  v4[7] = @"energy.location.cost";
  v4[8] = @"energy.location.overhead";
  void v4[9] = @"energy.gpu.cost";
  v4[10] = @"energy.gpu.overhead";
  v4[11] = @"energy.display.cost";
  v4[12] = @"energy.display.overhead";
  v4[13] = @"energy.appstate.cost";
  v4[14] = @"energy.appstate.overhead";
  v4[15] = @"energy.thermalstate.cost";
  v4[16] = @"energy.inducedthermalstate.cost";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, 17LL));
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v1));
  id v3 = (void *)qword_113E8;
  qword_113E8 = v2;
}

void sub_48BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4A70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_510C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_5200(void *a1)
{
  id v1 = a1;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v2, v3, v4);
  if ((objc_opt_isKindOfClass(v1, v5) & 1) != 0)
  {
    int v6 = (int *)[v1 longValue];
    uint64_t v7 = -1LL;
    uint64_t v8 = 2LL;
    uint64_t v9 = 3LL;
    if (v6 != &dword_14) {
      uint64_t v8 = v9;
    }
    if (!v6) {
      uint64_t v7 = 0LL;
    }
    else {
      uint64_t v10 = v8;
    }
  }

  else
  {
    uint64_t v10 = -1LL;
  }

  return v10;
}

void sub_528C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5418( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_55F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_5804(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___IDEDataProvider_SceneKit);
  uint64_t v2 = (void *)qword_113F8;
  qword_113F8 = (uint64_t)v1;
}

void sub_58C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5910(id a1)
{
  v4[0] = @"scenekit.fps";
  v4[1] = @"scenekit.primcnt";
  v4[2] = @"scenekit.frmtime";
  v4[3] = @"scenekit.phytime";
  v4[4] = @"scenekit.prttime";
  v4[5] = @"scenekit.animtime";
  v4[6] = @"scenekit.clientTime";
  v4[7] = @"scenekit.rendertime";
  v4[8] = @"scenekit.consttime";
  void v4[9] = @"scenekit.cpuidletime";
  v4[10] = @"scenekit.cawaittime";
  v4[11] = @"scenekit.shaderGenerationCount";
  v4[12] = @"scenekit.shaderCompilationTime";
  v4[13] = @"scenekit.deviceutil";
  v4[14] = @"scenekit.rendererutil";
  v4[15] = @"scenekit.tilerutil";
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, 16LL));
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v1));
  uint64_t v3 = (void *)qword_11408;
  qword_11408 = v2;
}

void sub_5A44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5B34(uint64_t a1)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        int v6 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "objectForKey:", v6, (void)v8));
        if ([v7 BOOLValue])
        {
          [*(id *)(a1 + 48) addObject:v6];
        }

        else if (_SCNStartCollectingPerformanceStatisticsForPid([v6 intValue]))
        {

          [*(id *)(*(void *)(a1 + 40) + 24) setObject:&__kCFBooleanTrue forKey:v6];
          uint64_t v7 = &__kCFBooleanTrue;
          [*(id *)(a1 + 48) addObject:v6];
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v3);
  }
}

void sub_5CAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5EC4()
{
}

void sub_5F78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6044(uint64_t a1)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        int v6 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "objectForKey:", v6, (void)v8));
        if ([v7 BOOLValue])
        {
          _SCNStopCollectingPerformanceStatisticsForPid([v6 intValue]);
          [*(id *)(*(void *)(a1 + 40) + 24) removeObjectForKey:v6];
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v3);
  }
}

void sub_6184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_62A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_62B4(uint64_t a1)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v10 + 1) + 8LL * (void)v5);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary", (void)v10));
        unsigned int v8 = [*(id *)(a1 + 40) containsObject:@"shaders"];
        __int128 v9 = *(void **)(a1 + 48);
        if (!v8)
        {
LABEL_10:
          [*(id *)(a1 + 56) setObject:v7 forKeyedSubscript:v6];
          goto LABEL_11;
        }

LABEL_11:
        uint64_t v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v3);
  }
}

void sub_641C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_67E0(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___IDEDataProvider_procinfo);
  id v2 = (void *)qword_11418;
  qword_11418 = (uint64_t)v1;
}

void sub_68B4(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_D840));
  id v2 = (void *)qword_11428;
  qword_11428 = v1;
}

LABEL_154:
    if (v51.u32[0] > 1uLL)
    {
      if (v106 >= v48) {
        v106 %= v48;
      }
    }

    else
    {
      v106 &= v56;
    }

    if (v106 != v50)
    {
      p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v106] = v101;
      v95 = (unint64_t *)v55->__value_.__next_;
    }
  }

  v101->__value_.__next_ = v95;
  v55->__value_.__next_ = 0LL;
  --p_processInfoByPID->__table_.__p2_.__value_;
  operator delete(v55);
LABEL_161:
  v46 = 0;
LABEL_162:

  return v46;
}

void sub_7628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7880(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7894(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id obj = *(id *)(a1 + 32);
  id v3 = [obj countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8LL * (void)v5);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  32LL));
        [v7 setObject:v6 forKeyedSubscript:@"pid"];
        [v7 setObject:v2 forKeyedSubscript:@"time"];
        if ([*(id *)(a1 + 40) captureAttributes:*(void *)(a1 + 48) toDictionary:v7 forPID:v6]) {
          [*(id *)(a1 + 56) setObject:v7 forKeyedSubscript:v6];
        }

        uint64_t v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v3);
  }
}

void sub_7A18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}