NSXPCInterface *sub_3708()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceClientInterface);
}

NSXPCInterface *sub_371C()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceServerInterface);
}

NSXPCInterface *sub_3730()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCGameIntentServiceClientInterface);
}

NSXPCInterface *sub_3744()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCGameIntentServiceServerInterface);
}

uint64_t sub_3758()
{
  if (qword_16F70 != -1) {
    dispatch_once(&qword_16F70, &stru_103F0);
  }
  return byte_16F68;
}

void sub_3798(id a1)
{
  byte_16F68 = os_variant_has_internal_diagnostics("com.apple.gamecontroller");
}

id sub_37BC()
{
  if (qword_16F80 != -1) {
    dispatch_once(&qword_16F80, &stru_10410);
  }
  return (id)qword_16F78;
}

void sub_37FC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "default");
  v2 = (void *)qword_16F78;
  qword_16F78 = (uint64_t)v1;
}

id sub_382C()
{
  if (qword_16F90 != -1) {
    dispatch_once(&qword_16F90, &stru_10430);
  }
  return (id)qword_16F88;
}

void sub_386C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "monitor");
  v2 = (void *)qword_16F88;
  qword_16F88 = (uint64_t)v1;
}

id sub_389C()
{
  if (qword_16FA0 != -1) {
    dispatch_once(&qword_16FA0, &stru_10450);
  }
  return (id)qword_16F98;
}

void sub_38DC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "init");
  v2 = (void *)qword_16F98;
  qword_16F98 = (uint64_t)v1;
}

id sub_390C()
{
  if (qword_16FB0 != -1) {
    dispatch_once(&qword_16FB0, &stru_10470);
  }
  return (id)qword_16FA8;
}

void sub_394C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "analytics");
  v2 = (void *)qword_16FA8;
  qword_16FA8 = (uint64_t)v1;
}

id sub_397C()
{
  if (qword_16FC0 != -1) {
    dispatch_once(&qword_16FC0, &stru_10490);
  }
  return (id)qword_16FB8;
}

void sub_39BC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Daemon", "default");
  v2 = (void *)qword_16FB8;
  qword_16FB8 = (uint64_t)v1;
}

void sub_39EC(char *category)
{
  os_log_t v1 = os_log_create("com.apple.GameController.HID", category);
  v2 = (void *)qword_16FC8;
  qword_16FC8 = (uint64_t)v1;
}

id sub_3A18()
{
  if (qword_16FD0 != -1) {
    dispatch_once(&qword_16FD0, &stru_104B0);
  }
  return (id)qword_16FC8;
}

void sub_3A58(id a1)
{
  if (!qword_16FC8) {
    objc_storeStrong((id *)&qword_16FC8, &_os_log_default);
  }
}

id sub_3A7C()
{
  if (qword_16FE0 != -1) {
    dispatch_once(&qword_16FE0, &stru_104D0);
  }
  return (id)qword_16FD8;
}

void sub_3ABC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Settings", "default");
  v2 = (void *)qword_16FD8;
  qword_16FD8 = (uint64_t)v1;
}

id sub_3AEC()
{
  if (qword_16FF0 != -1) {
    dispatch_once(&qword_16FF0, &stru_104F0);
  }
  return (id)qword_16FE8;
}

void sub_3B2C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Haptics", "default");
  v2 = (void *)qword_16FE8;
  qword_16FE8 = (uint64_t)v1;
}

id sub_3B5C()
{
  if (qword_17000 != -1) {
    dispatch_once(&qword_17000, &stru_10510);
  }
  return (id)qword_16FF8;
}

void sub_3B9C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.gamecontroller", "Signposts");
  v2 = (void *)qword_16FF8;
  qword_16FF8 = (uint64_t)v1;
}

id sub_3BCC()
{
  if (qword_17010 != -1) {
    dispatch_once(&qword_17010, &stru_10530);
  }
  return (id)qword_17008;
}

void sub_3C0C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.runtime-issues", "GameController");
  v2 = (void *)qword_17008;
  qword_17008 = (uint64_t)v1;
}

id sub_3C3C()
{
  return +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &unk_F350, 37LL);
}

LABEL_13:
  return (pair<BOOL, float>)(v12 | v11);
}

void sub_3DAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3E44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

LABEL_14:
  return v6;
}

void sub_3FA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_407C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_41F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_42B0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_4738()
{
}

LABEL_17:
    v10 = 0;
    *a5 = 0LL;
    goto LABEL_18;
  }

  v10 = 0;
LABEL_18:

  return v10;
}

        return;
      }

      *(void *)v22 = 0LL;
      v15 = BTDeviceFromAddress(self->_session, v21, v22);
      if (v15)
      {
        v16 = v15;
        v17 = sub_3A18();
        v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 67109120;
        v26 = v16;
        v10 = "GCHIDLog::disconnect: unable to get BTDevice; error code = %d";
LABEL_15:
        v11 = buf;
        v12 = v9;
        v13 = 8;
        goto LABEL_16;
      }

      v18 = BTDeviceDisconnect(*(void *)v22);
      v19 = sub_3A18();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      v20 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (!v20) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 67109120;
        v26 = v18;
        v10 = "GCHIDLog::disconnect: error code = %d";
        goto LABEL_15;
      }

      if (!v20) {
        goto LABEL_17;
      }
      *(_WORD *)buf = 0;
      v10 = "GCHIDLog::disconnect: SUCCESS";
      v11 = buf;
    }

    else
    {
      v14 = sub_3A18();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      *(_WORD *)v22 = 0;
      v10 = "GCHIDLog::disconnect: unable to get BTDevice; no valid BTSession";
      v11 = v22;
    }

    v12 = v9;
    v13 = 2;
    goto LABEL_16;
  }
}

void sub_5000(_Unwind_Exception *a1)
{
}

void sub_5028(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v10 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v13 = sub_83B8((uint64_t)WeakRetained);
    kdebug_trace(835452996LL, v13, a3, a4, a5);
    switch(a5)
    {
      case 1LL:
        id v15 = v10;
        v16 = (unsigned __int8 *)[v15 bytes];
        v18.i64[1] = 0LL;
        float32x4_t v71 = 0u;
        if ((unint64_t)(*((void *)v12 + 88) - 1LL) <= 1)
        {
          v19 = (char *)[v15 length];
          uint64_t v20 = 19LL;
          if (v19 == &stru_20.segname[15]) {
            uint64_t v20 = 35LL;
          }
          int v21 = v16[v20] & 7;
          if (v21 != v12[712])
          {
            v12[712] = v21;
            id v22 = sub_3A18();
            v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              int v24 = v12[712];
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v24;
              _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "profile changed to %d", buf, 8u);
            }
          }

          if (*((void *)v12 + 88) == 1LL && !v12[712])
          {
            else {
              int8x8_t v25 = (int8x8_t)vtst_s16(vdup_n_s16(v16[33]), (int16x4_t)0x8000400020001LL);
            }
            float32x4_t v18 = vcvtq_f32_u32(vmovl_u16((uint16x4_t)vand_s8(v25, (int8x8_t)0x1000100010001LL)));
            float32x4_t v71 = v18;
          }
        }

        if (v12[698])
        {
          unsigned int v26 = v16[15];
          uint64_t v27 = (v26 >> 3) & 1;
          if (v12[700])
          {
            int v28 = v26 & 4;
            if (v12[701])
            {
              [v12 dispatchShareButtonEventWithValue:v16[16] & 1 timestamp:a3];
              unsigned int v26 = v16[15];
            }
          }

          else
          {
            int v28 = v16[16] & 1;
          }

          uint64_t v30 = v28 != 0;
          int v35 = (char)v16[14];
          int8x8_t v31 = (int8x8_t)vmovn_s32(vtstq_s32(vdupq_n_s32(v16[14]), (int32x4_t)xmmword_F420));
          unsigned int v32 = (v35 >> 6) & 1;
          unsigned int v33 = v35 < 0;
          int8x8_t v34 = (int8x8_t)vtst_s32(vdup_n_s32(v26), (int32x2_t)0x4000000020LL);
          [v12 dispatchHomeButtonEventWithValue:(v26 >> 4) & 1 timestamp:a3];
        }

        else
        {
          unsigned int v29 = v16[14];
          uint64_t v27 = (v29 & 0x80u) != 0;
          uint64_t v30 = (v29 >> 6) & 1;
          int8x8_t v31 = (int8x8_t)vtst_s16(vdup_n_s16(v29), (int16x4_t)0x8000400020001LL);
          unsigned int v32 = (v29 >> 4) & 1;
          unsigned int v33 = (v29 >> 5) & 1;
          *(int32x2_t *)v18.f32 = vdup_n_s32(v16[15]);
          int8x8_t v34 = (int8x8_t)vtst_s32(*(int32x2_t *)v18.f32, (int32x2_t)0x200000001LL);
        }

        v36 = v16 + 1;
        v37 = v16 + 2;
        v38 = v16 + 3;
        v39 = v16 + 4;
        v40 = v16 + 5;
        v41 = (__int8 *)(v16 + 6);
        v42 = v16 + 7;
        v43 = (__int8 *)(v16 + 8);
        float v70 = (float)*(unsigned __int16 *)(v16 + 9) / 1023.0;
        v18.f32[0] = (float)*(unsigned __int16 *)(v16 + 11);
        unsigned __int8 v44 = v16[13];
        unsigned int v45 = v44 & 0xF;
        if ((v44 & 0xD) == 4) {
          float v46 = 1.0;
        }
        else {
          float v46 = 0.0;
        }
        if (v45 == 5) {
          float v47 = 1.0;
        }
        else {
          float v47 = v46;
        }
        LOBYTE(v17) = *v38;
        BYTE4(v17) = *v36;
        __int128 v65 = v17;
        LOBYTE(v17) = *v39;
        BYTE4(v17) = *v37;
        __int128 v63 = v17;
        LOBYTE(v17) = *v42;
        BYTE4(v17) = *v40;
        float32x4_t v68 = vcvtq_f32_u32(vmovl_u16((uint16x4_t)vand_s8(v31, (int8x8_t)0x1000100010001LL)));
        int32x2_t v69 = (int32x2_t)v17;
        float32x2_t v48 = vcvt_f32_u32((uint32x2_t)vand_s8(v34, (int8x8_t)0x100000001LL));
        float v49 = v18.f32[0] / 1023.0;
        v18.i8[0] = *v43;
        v18.i8[4] = *v41;
        objc_msgSend(v12, "dispatchMenuButtonEventWithValue:timestamp:", v27, a3, v63, v65, *(_OWORD *)&v18);
        [v12 dispatchOptionsButtonEventWithValue:v30 timestamp:a3];
        int32x2_t v50 = vdup_n_s32(v45);
        int8x8_t v51 = (int8x8_t)vceq_s32(v50, (int32x2_t)0x400000008LL);
        int32x2_t v52 = vceq_s32(v50, (int32x2_t)0x200000006LL);
        float v53 = (float)(vorr_s8(v51, (int8x8_t)vdup_lane_s32(v52, 1)).u32[0] & 1);
        if (v45 == 1) {
          float v53 = 1.0;
        }
        *(void *)buf = 0LL;
        int8x8_t v54 = (int8x8_t)vcvt_f32_u32((uint32x2_t)vand_s8(vorr_s8((int8x8_t)v52, v51), (int8x8_t)0x100000001LL));
        __asm { FMOV            V2.2S, #1.0 }

        float v73 = v53;
        float v74 = v47;
        int8x8_t v75 = vbsl_s8((int8x8_t)vceq_s32(v50, (int32x2_t)0x300000007LL), _D2, v54);
        float32x4_t v76 = v68;
        float v77 = (float)v32;
        float v78 = (float)v33;
        float32x2_t v60 = (float32x2_t)vdup_n_s32(0x37800000u);
        float32x2_t v61 = vmul_f32( vadd_f32( vmul_f32(vcvt_f32_s32(vsli_n_s32(v66, (int32x2_t)vand_s8(v64, (int8x8_t)0xFF000000FFLL), 8uLL)), v60),  (float32x2_t)0xBF000000BF000000LL),  (float32x2_t)0x40000000C0000000LL);
        float v79 = fmaxf(v61.f32[0], 0.0);
        int8x8_t v80 = vand_s8((int8x8_t)vneg_f32(v61), (int8x8_t)vcltz_f32(v61));
        float32x2_t v62 = vmul_f32( vadd_f32( vmul_f32(vcvt_f32_s32(vsli_n_s32(v69, (int32x2_t)vand_s8(v67, (int8x8_t)0xFF000000FFLL), 8uLL)), v60),  (float32x2_t)0xBF000000BF000000LL),  (float32x2_t)0x40000000C0000000LL);
        float32x2_t v81 = vmaxnm_f32((float32x2_t)vzip1_s32(vdup_lane_s32((int32x2_t)v61, 1), (int32x2_t)v62), 0LL);
        int8x8_t v82 = vand_s8((int8x8_t)vneg_f32(v62), (int8x8_t)vcltz_f32(v62));
        float v83 = fmaxf(v62.f32[1], 0.0);
        float v84 = v70;
        float v85 = v49;
        float32x2_t v86 = v48;
        uint64_t v87 = 0LL;
        int v88 = 0;
        float32x4_t v89 = v71;
        __int128 v90 = 0u;
        __int128 v91 = 0u;
        __int128 v92 = 0u;
        memset(v93, 0, sizeof(v93));
        [v12 dispatchGameControllerExtendedEventWithState:buf timestamp:a3];
        break;
      case 2LL:
        objc_msgSend( v12, "dispatchAlternateHomeButtonEventWithValue:timestamp:", *((_BYTE *)objc_msgSend(v10, "bytes") + 1) & 1, a3);
        break;
      case 4LL:
        id v14 = v10;
        buf[0] = 0;
        __memcpy_chk(buf, (char *)[v14 bytes] + 1, objc_msgSend(v14, "length") != 0, 1);
        [v12 updateBatteryStats:buf[0]];
        break;
    }
  }
}

id sub_5AEC(uint64_t a1, int a2)
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 2 * a2));
  if (a2 >= 1)
  {
    unint64_t v5 = a2 + 1LL;
    do
    {
      if ((_DWORD)v5 == 2) {
        v6 = &stru_10A38;
      }
      else {
        v6 = @":";
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02x%@",  *(unsigned __int8 *)(a1 + (v5 - 2)),  v6));
      [v4 appendString:v7];

      --v5;
    }

    while (v5 > 1);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uppercaseString]);

  return v9;
}

uint64_t sub_5BE0()
{
  if (qword_17018 != -1) {
    dispatch_once(&qword_17018, &stru_10578);
  }
  return byte_17020;
}

void sub_5C20(id a1)
{
  os_log_t v1 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.GameController");
  byte_17020 = -[NSUserDefaults BOOLForKey:](v1, "BOOLForKey:", @"GCPartnersEnable");
  id v2 = sub_3A18();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = byte_17020;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Partners mode enabled? %d", (uint8_t *)v4, 8u);
  }
}

NSXPCInterface *sub_5CFC()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCAdaptiveTriggersServiceClientInterface);
}

NSXPCInterface *sub_5D10()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCAdaptiveTriggersServiceServerInterface);
}

id sub_5D24()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____GCDriverClientInterface));
  os_log_t v1 = sub_3708();
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  [v0 setInterface:v2 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v3 = sub_371C();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v0 setInterface:v4 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  unint64_t v5 = sub_6008();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v0 setInterface:v6 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v7 = sub_601C();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v0 setInterface:v8 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v9 = sub_5CFC();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v0 setInterface:v10 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v11 = sub_5D10();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v0 setInterface:v12 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  uint64_t v13 = sub_5FE0();
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v0 setInterface:v14 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  id v15 = sub_5FF4();
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  [v0 setInterface:v16 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  __int128 v17 = sub_9E68();
  float32x4_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v0 setInterface:v18 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v19 = sub_9E7C();
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  [v0 setInterface:v20 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  int v21 = sub_3730();
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  [v0 setInterface:v22 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v23 = sub_3744();
  int v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  [v0 setInterface:v24 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  uint64_t v25 = GCGenericDeviceDriverConfigurationServiceClientInterface();
  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  [v0 setInterface:v26 forSelector:"connectToGenericDeviceDriverConfigurationServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  uint64_t v27 = GCGenericDeviceDriverConfigurationServiceServerInterface();
  int v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  [v0 setInterface:v28 forSelector:"connectToGenericDeviceDriverConfigurationServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  return v0;
}

NSXPCInterface *sub_5FCC()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____GCDriverServerInterface);
}

NSXPCInterface *sub_5FE0()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCMotionServiceClientInterface);
}

NSXPCInterface *sub_5FF4()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCMotionServiceServerInterface);
}

NSXPCInterface *sub_6008()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCLightServiceClientInterface);
}

NSXPCInterface *sub_601C()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCLightServiceServerInterface);
}

dispatch_source_s *sub_6030(uint64_t a1, uint64_t a2, dispatch_queue_s *a3, void *a4)
{
  id v7 = a4;
  v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, a3);
  if (v8)
  {
    dispatch_time_t v9 = dispatch_walltime(0LL, 0LL);
    dispatch_source_set_timer(v8, v9, a1, a2);
    dispatch_source_set_event_handler(v8, v7);
    dispatch_resume(v8);
  }

  return v8;
}

void sub_626C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_629C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = sub_3A18();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "Connection to com.apple.GameController.gamecontrollerd.driver invalidated",  v4,  2u);
  }

  [WeakRetained setInterruptionHandler:0];
  [WeakRetained setInvalidationHandler:0];
  [WeakRetained invalidate];
}

void sub_6330(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = sub_3A18();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "Connection to com.apple.GameController.gamecontrollerd.driver interrupted.  Attempting to re-establish.",  v5,  2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteObjectProxy]);
  [v4 driverCheckIn];
}

void sub_6814(uint64_t a1, int a2, int a3, uint64_t a4)
{
  if (a3 | a2)
  {
    switch(a2)
    {
      case 3:
        id v11 = sub_3A18();
        v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 134217984;
          uint64_t v14 = a1;
          id v7 = "BTSessionEventCallback: failed session = %p";
LABEL_15:
          _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v13, 0xCu);
        }

        break;
      case 2:
        id v12 = sub_3A18();
        v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 134217984;
          uint64_t v14 = a1;
          id v7 = "BTSessionEventCallback: terminated session = %p";
          goto LABEL_15;
        }

        break;
      case 1:
        id v5 = sub_3A18();
        v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
          break;
        }
        int v13 = 134217984;
        uint64_t v14 = a1;
        id v7 = "BTSessionEventCallback: detached session = %p";
        goto LABEL_15;
      default:
        return;
    }

    return;
  }

  id v9 = sub_3A18();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    uint64_t v14 = a1;
    _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "BTSessionEventCallback: attached session = %p",  (uint8_t *)&v13,  0xCu);
  }

  if (!*(void *)(a4 + 40)) {
    *(void *)(a4 + 40) = a1;
  }
}

void sub_69B8(uint64_t a1, void *a2)
{
  id v3 = sub_3A18();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_9ED0(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  if (a2) {
    [a2 disconnect];
  }
}

void sub_6B90( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_6BA8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_6BB8(uint64_t a1)
{
}

void sub_6BC0(uint64_t a1)
{
  id v2 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 32)),  4LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = sub_3A18();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Freeing HIDDevice on %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0LL;
}

LABEL_18:
  return v9;
}

BOOL sub_6FA0(id a1, NSDictionary *a2, NSDictionary *a3)
{
  id v3 = a2;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"DeviceUsagePage"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"DeviceUsage"));
    char v8 = (![v6 isEqual:&off_10FC0]
       || ([v7 isEqual:&off_10FD8] & 1) == 0)
      && (![v6 isEqual:&off_10FC0]
       || ([v7 isEqual:&off_10FF0] & 1) == 0)
  }

  else
  {
    char v8 = 1;
  }

  return v8;
}

void sub_74E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_7504(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = sub_3A18();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "calling cancel handler", v5, 2u);
    }

    (*(void (**)(void))(WeakRetained[1] + 16LL))();
    uint64_t v4 = (void *)WeakRetained[1];
    WeakRetained[1] = 0LL;
  }
}

void sub_76D0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(dispatch_source_s **)(v2 + 32);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0LL;

    uint64_t v2 = *(void *)(a1 + 32);
  }

  uint64_t v6 = *(dispatch_source_s **)(v2 + 536);
  if (v6)
  {
    dispatch_source_cancel(v6);
    uint64_t v7 = *(void *)(a1 + 32);
    char v8 = *(void **)(v7 + 536);
    *(void *)(v7 + 536) = 0LL;
  }

void sub_8058(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(dispatch_queue_s **)(v2 + 560);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_80E4;
  v8[3] = &unk_10630;
  v8[4] = v2;
  uint64_t v4 = sub_6030(0x6FC23AC00uLL, 0x3B9ACA00uLL, v3, v8);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;
}

id sub_80E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateIdleState];
}

void sub_82C0(id a1)
{
}

void sub_831C(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (a1)
  {
    id v7 = v5;
    if (a3) {
      *(void *)(a1 + 664) = [v5 timestamp];
    }
    kdebug_trace( 835453000,  *(void *)(a1 + 656),  [v7 timestamp],  objc_msgSend(v7, "type"),  0);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 624));
    [WeakRetained dispatchEvent:v7];

    id v5 = v7;
  }
}

uint64_t sub_83B8(uint64_t result)
{
  if (result) {
    return *(void *)(result + 656);
  }
  return result;
}

id sub_84F0(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchEvent:*(void *)(a1 + 40)];
}

id sub_8610(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchIdleEvent:*(void *)(a1 + 40)];
}

void sub_96C0(uint64_t a1)
{
  os_log_t v1 = (id *)(a1 + 32);
  id WeakRetained = (timespec *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!LOBYTE(WeakRetained[30].tv_nsec))
    {
      LOBYTE(WeakRetained[30].tv_nsec) = 1;
      if (!WeakRetained[33].tv_nsec)
      {
        clock_gettime(_CLOCK_MONOTONIC_RAW, WeakRetained + 32);
        tv_sec = (dispatch_queue_s *)v3[35].tv_sec;
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472LL;
        v8[2] = sub_979C;
        v8[3] = &unk_105A0;
        objc_copyWeak(&v9, v1);
        id v5 = sub_6030(0xF4240uLL, 0x186A0uLL, tv_sec, v8);
        uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
        tv_nsec = (void *)v3[33].tv_nsec;
        v3[33].tv_nsec = v6;

        objc_destroyWeak(&v9);
      }
    }
  }
}

void sub_979C(uint64_t a1)
{
  id WeakRetained = (timespec *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    clock_gettime(_CLOCK_MONOTONIC_RAW, &v13);
    if ((double)(uint64_t)((double)v13.tv_nsec
                         + (double)v13.tv_sec * 1000000000.0
                         - ((double)WeakRetained[32].tv_nsec
                          + (double)WeakRetained[32].tv_sec * 1000000000.0))
       * 0.000000001 >= *(float *)&WeakRetained[31].tv_sec)
    {
      WeakRetained[32] = v13;
      unsigned __int8 v2 = -[timespec isAnyHapticMotorEnabled](WeakRetained, "isAnyHapticMotorEnabled");
      id v3 = sub_3A18();
      uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
      if ((v2 & 1) != 0)
      {
        if (v5) {
          sub_9F84(v4, v6, v7, v8, v9, v10, v11, v12);
        }

        HIDWORD(WeakRetained[30].tv_nsec) = 0;
        -[timespec dispatchHapticEvent](WeakRetained, "dispatchHapticEvent");
      }

      else
      {
        if (v5) {
          sub_9FB4(v4, v6, v7, v8, v9, v10, v11, v12);
        }

        -[timespec stopHaptics](WeakRetained, "stopHaptics");
      }
    }
  }
}

void sub_9E50( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

NSXPCInterface *sub_9E68()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCBatteryServiceClientInterface);
}

NSXPCInterface *sub_9E7C()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCBatteryServiceServerInterface);
}

void sub_9E90(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unable to send output report to Xbox One Controller.", v1, 2u);
}

void sub_9ED0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_9F00(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "setProperty: %@ forKey: %@", (uint8_t *)&v3, 0x16u);
}

void sub_9F84( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_9FB4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_valueForNoteParam_inParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForNoteParam:inParameters:");
}