CFTypeRef sub_100001F44()
{
  uint64_t ClassID;
  uint64_t v1;
  uint64_t DerivedStorage;
  dispatch_queue_s *v3;
  dispatch_source_s *v4;
  uint64_t v6;
  void handler[5];
  CFTypeRef v8;
  v8 = 0LL;
  ClassID = FigVirtualDisplaySourceGetClassID();
  v1 = CMDerivedObjectCreate(kCFAllocatorDefault, &unk_10000C720, ClassID, &v8);
  if ((_DWORD)v1)
  {
    v6 = 429LL;
  }

  else
  {
    DerivedStorage = CMBaseObjectGetDerivedStorage(v8);
    *(_DWORD *)(DerivedStorage + 112) = 0;
    *(void *)(DerivedStorage + 16) = CFStringCreateF(0LL, "[%{ptr}]", v8);
    v3 = dispatch_queue_create("APMediaSenderFVDSourceQueue", 0LL);
    *(void *)(DerivedStorage + 8) = v3;
    v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 1uLL, v3);
    *(void *)(DerivedStorage + 80) = v4;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000LL;
    handler[2] = sub_100002100;
    handler[3] = &unk_10000C738;
    handler[4] = DerivedStorage;
    dispatch_source_set_event_handler(v4, handler);
    dispatch_source_set_timer(*(dispatch_source_t *)(DerivedStorage + 80), 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
    dispatch_resume(*(dispatch_object_t *)(DerivedStorage + 80));
    *(_BYTE *)(DerivedStorage + 116) = 1;
    v1 = VTPixelTransferSessionCreate(kCFAllocatorDefault, (VTPixelTransferSessionRef *)(DerivedStorage + 24));
    if (!(_DWORD)v1)
    {
      if (dword_100010248 <= 50
        && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
      {
        LogPrintF( &dword_100010248,  "FigVirtualDisplaySourceRef APMediaSenderFVDSourceCreate(void)",  33554482LL,  "%@ created media sender FVD source",  *(void *)(DerivedStorage + 16));
      }

      return v8;
    }

    v6 = 443LL;
  }

  APSLogErrorAt(v1, "APMediaSenderFVDSourceCreate", v6, 0LL);
  if (v8)
  {
    CFRelease(v8);
    return 0LL;
  }

  return v8;
}

uint64_t sub_100002100(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 88)) {
    return APSLogErrorAt(0LL, "fvdsrc_retryTimerFired", 147LL, 0LL);
  }
  if (dword_100010248 <= 50
    && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
  {
    LogPrintF( &dword_100010248,  "void fvdsrc_retryTimerFired(FVDSourceStorage *)",  33554482LL,  "%@ FVD source: resubmitting last frame",  *(void *)(v1 + 16));
  }

  return sub_100002544(v1, *(CVPixelBufferRef *)(v1 + 96), *(void *)(v1 + 104));
}

uint64_t sub_1000021B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (a2 && a3)
  {
    v6 = *(dispatch_queue_s **)(DerivedStorage + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_100002254;
    block[3] = &unk_10000C760;
    block[4] = a3;
    block[5] = DerivedStorage;
    block[6] = a2;
    dispatch_sync(v6, block);
    return 0LL;
  }

  else
  {
    APSLogErrorAt(0LL, "APMediaSenderFDVSourceSetDisplayInfoBlock", 461LL, 0LL);
    return 4294955226LL;
  }
}

void sub_100002254(void *a1)
{
  v2 = (const void *)a1[4];
  if (v2) {
    v3 = _Block_copy(v2);
  }
  else {
    v3 = 0LL;
  }
  uint64_t v4 = a1[5];
  v5 = *(const void **)(v4 + 32);
  if (v5)
  {
    _Block_release(v5);
    uint64_t v4 = a1[5];
  }

  *(void *)(v4 + 32) = v3;
  if (a1[6]) {
    v6 = (dispatch_queue_s *)a1[6];
  }
  else {
    v6 = &_dispatch_main_q;
  }
  dispatch_retain(v6);
  uint64_t v7 = a1[5];
  v8 = *(dispatch_object_s **)(v7 + 40);
  if (v8)
  {
    dispatch_release(v8);
    uint64_t v7 = a1[5];
  }

  *(void *)(v7 + 40) = v6;
}

uint64_t sub_1000022D4(uint64_t a1, char a2)
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  int v13 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v4 = *(dispatch_queue_s **)(DerivedStorage + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100002398;
  block[3] = &unk_10000C788;
  char v9 = a2;
  block[4] = &v10;
  block[5] = DerivedStorage;
  dispatch_sync(v4, block);
  uint64_t v5 = 0LL;
  uint64_t v6 = *((unsigned int *)v11 + 6);
  if ((_DWORD)v6)
  {
    APSLogErrorAt(v6, "APMediaSenderFDVSourceSetWritebackMode", 491LL, 0LL);
    uint64_t v5 = *((unsigned int *)v11 + 6);
  }

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t sub_100002398(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 40);
  if (*(_DWORD *)(v2 + 112))
  {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = -12070;
    return result;
  }

  int v3 = *(unsigned __int8 *)(result + 48);
  *(_BYTE *)(v2 + 116) = v3;
  if (dword_100010248 <= 50)
  {
    if (dword_100010248 == -1)
    {
      result = _LogCategory_Initialize(&dword_100010248, 33554482LL);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v2 = *(void *)(v1 + 40);
      int v3 = *(unsigned __int8 *)(v2 + 116);
    }

    uint64_t v4 = *(void *)(v2 + 16);
    if (v3) {
      uint64_t v5 = "";
    }
    else {
      uint64_t v5 = "not ";
    }
    return LogPrintF( &dword_100010248,  "OSStatus APMediaSenderFDVSourceSetWritebackMode(FigVirtualDisplaySourceRef, Boolean)_block_invoke",  33554482LL,  "%@ FVD source: will %suse writeback mode",  v4,  v5);
  }

  return result;
}

uint64_t sub_100002468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  int v13 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v6 = *(dispatch_queue_s **)(DerivedStorage + 8);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 0x40000000LL;
  v9[2] = sub_100002510;
  v9[3] = &unk_10000C7B0;
  v9[4] = &v10;
  v9[5] = DerivedStorage;
  v9[6] = a2;
  v9[7] = a3;
  dispatch_sync(v6, v9);
  uint64_t v7 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t sub_100002510(uint64_t a1)
{
  uint64_t result = sub_100002544(*(void *)(a1 + 40), *(CVPixelBufferRef *)(a1 + 48), *(void *)(a1 + 56));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_100002544(uint64_t a1, CVPixelBufferRef pixelBuffer, uint64_t a3)
{
  CVPixelBufferRef destinationBuffer = 0LL;
  int v6 = *(_DWORD *)(a1 + 112);
  if (v6 == 2)
  {
    if (!pixelBuffer)
    {
      double x = CGRectZero.origin.x;
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
      if (dword_100010248 <= 50
        && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
      {
        LogPrintF( &dword_100010248,  "OSStatus fvdsrc_submitPixelBufferInternal(FVDSourceStorage *, CVPixelBufferRef, int64_t)",  33554482LL,  "%@ FVD source received 'clear screen' request",  *(void *)(a1 + 16));
      }

      CVPixelBufferRef v26 = 0LL;
      double v25 = CGRectZero.origin.x;
      double v27 = y;
      double v18 = width;
      double v20 = height;
      goto LABEL_19;
    }

    if (!*(_BYTE *)(a1 + 116))
    {
      int v13 = (__CVBuffer *)CFRetain(pixelBuffer);
      CVPixelBufferRef destinationBuffer = v13;
      goto LABEL_12;
    }

    uint64_t v7 = *(void *)a1;
    size_t v8 = CVPixelBufferGetWidth(pixelBuffer);
    size_t v9 = CVPixelBufferGetHeight(pixelBuffer);
    if (v10)
    {
      uint64_t v11 = v10(v7, 0LL, 1LL, &destinationBuffer, (double)v8, (double)v9);
      if (!(_DWORD)v11)
      {
        uint64_t v12 = VTPixelTransferSessionTransferImage( *(VTPixelTransferSessionRef *)(a1 + 24),  pixelBuffer,  destinationBuffer);
        if (!(_DWORD)v12)
        {
          int v13 = destinationBuffer;
LABEL_12:
          double v18 = (double)CVPixelBufferGetWidth(v13);
          size_t v19 = CVPixelBufferGetHeight(destinationBuffer);
          double v20 = (double)v19;
          double v21 = *(double *)(a1 + 48);
          double v22 = *(double *)(a1 + 56);
          double v23 = v21 / v18;
          double v24 = (1.0 - *(double *)(a1 + 64)) * v23;
          double width = v24 * v18;
          double height = v24 * v20;
          double x = (v21 - v24 * v18) * 0.5;
          double y = (v22 - v24 * v20) * 0.5;
          double v25 = 0.0;
          CVPixelBufferRef v26 = destinationBuffer;
          double v27 = 0.0;
LABEL_19:
          uint64_t v30 = *(void *)a1;
          v31 = *(uint64_t (**)(uint64_t, CVPixelBufferRef, uint64_t, void, void, double, double, double, double, double, double, double, double))(*(void *)(CMBaseObjectGetVTable(*(void *)a1) + 16) + 80LL);
          if (v31)
          {
            uint64_t v32 = v31(v30, v26, a3, 0LL, 0LL, v25, v27, v18, v20, x, y, width, height);
            if (!(_DWORD)v32)
            {
LABEL_21:
              sub_100003348(a1);
              uint64_t v33 = 0LL;
              goto LABEL_36;
            }

            uint64_t v28 = v32;
          }

          else
          {
            uint64_t v28 = 4294954514LL;
          }

          uint64_t v12 = v28;
          uint64_t v29 = 123LL;
          goto LABEL_24;
        }

        uint64_t v28 = v12;
        uint64_t v29 = 100LL;
LABEL_24:
        uint64_t v34 = 0LL;
        goto LABEL_25;
      }

      uint64_t v28 = v11;
    }

    else
    {
      uint64_t v28 = 4294954514LL;
    }

    uint64_t v12 = v28;
    uint64_t v29 = 97LL;
    goto LABEL_24;
  }

  if (!v6)
  {
    APSLogErrorAt(0LL, "fvdsrc_submitPixelBufferInternal", 86LL, 0LL);
    goto LABEL_21;
  }

  uint64_t v28 = 4294955224LL;
  uint64_t v12 = 4294955224LL;
  uint64_t v29 = 87LL;
  uint64_t v34 = 1LL;
LABEL_25:
  APSLogErrorAt(v12, "fvdsrc_submitPixelBufferInternal", v29, v34);
  v35 = *(dispatch_source_s **)(a1 + 80);
  dispatch_time_t v36 = dispatch_time(0LL, 50000000LL);
  dispatch_source_set_timer(v35, v36, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
  v37 = *(const void **)(a1 + 96);
  *(void *)(a1 + 96) = pixelBuffer;
  if (pixelBuffer) {
    CFRetain(pixelBuffer);
  }
  if (v37) {
    CFRelease(v37);
  }
  *(void *)(a1 + 104) = a3;
  *(_BYTE *)(a1 + 88) = 1;
  if (dword_100010248 <= 50
    && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
  {
    LogPrintF( &dword_100010248,  "OSStatus fvdsrc_submitPixelBufferInternal(FVDSourceStorage *, CVPixelBufferRef, int64_t)",  33554482LL,  "%@ FVD source: got error %d, will retry",  *(void *)(a1 + 16),  v28);
  }

  if ((_DWORD)v28 == -12073) {
    uint64_t v33 = 0LL;
  }
  else {
    uint64_t v33 = v28;
  }
LABEL_36:
  if (destinationBuffer) {
    CFRelease(destinationBuffer);
  }
  return v33;
}

void sub_1000028E0()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_DWORD *)(DerivedStorage + 112))
  {
    int v2 = dword_100010248;
    if (dword_100010248 <= 100) {
      sub_10000918C(dword_100010248, DerivedStorage, v0);
    }
    goto LABEL_24;
  }

  int v2 = dword_100010248;
  if (*(void *)DerivedStorage)
  {
    while (v2 > 100)
LABEL_24:
      __break(1u);
    sub_100009130(v2, DerivedStorage, v0);
    __break(1u);
  }

  else
  {
    if (dword_100010248 <= 50
      && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
    {
      LogPrintF( &dword_100010248,  "void fvdsrc_finalize(CMBaseObjectRef)",  33554482LL,  "%@ FVD source finalized",  *(void *)(DerivedStorage + 16));
    }

    int v3 = *(dispatch_source_s **)(DerivedStorage + 80);
    if (v3)
    {
      dispatch_source_cancel(v3);
      dispatch_release(*(dispatch_object_t *)(DerivedStorage + 80));
      *(void *)(DerivedStorage + 80) = 0LL;
    }

    uint64_t v4 = *(const void **)(DerivedStorage + 32);
    if (v4)
    {
      _Block_release(v4);
      *(void *)(DerivedStorage + 32) = 0LL;
    }

    uint64_t v5 = *(const void **)(DerivedStorage + 96);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(DerivedStorage + 96) = 0LL;
    }

    int v6 = *(const void **)(DerivedStorage + 24);
    if (v6)
    {
      CFRelease(v6);
      *(void *)(DerivedStorage + 24) = 0LL;
    }

    uint64_t v7 = *(const void **)(DerivedStorage + 16);
    if (v7)
    {
      CFRelease(v7);
      *(void *)(DerivedStorage + 16) = 0LL;
    }

    size_t v8 = *(dispatch_object_s **)(DerivedStorage + 40);
    if (v8)
    {
      dispatch_release(v8);
      *(void *)(DerivedStorage + 40) = 0LL;
    }

    size_t v9 = *(dispatch_object_s **)(DerivedStorage + 8);
    if (v9)
    {
      dispatch_release(v9);
      *(void *)(DerivedStorage + 8) = 0LL;
    }
  }

uint64_t sub_100002A20(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  if (!CFEqual(kFigVirtualDisplaySourceProperty_Type, a2)) {
    return 4294954512LL;
  }
  CFTypeRef v5 = CFRetain(@"APMediaSenderFVDSource");
  uint64_t result = 0LL;
  *a4 = v5;
  return result;
}

uint64_t sub_100002A70()
{
  return 4294954512LL;
}

uint64_t sub_100002A78(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  int v12 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2)
  {
    uint64_t v4 = *(dispatch_queue_s **)(DerivedStorage + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_100002EA4;
    block[3] = &unk_10000C870;
    block[5] = DerivedStorage;
    void block[6] = a2;
    block[4] = &v9;
    dispatch_sync(v4, block);
    uint64_t v5 = *((unsigned int *)v10 + 6);
    if ((_DWORD)v5)
    {
      APSLogErrorAt(v5, "fvdsrc_plugProcessor", 285LL, 0LL);
      uint64_t v6 = *((unsigned int *)v10 + 6);
    }

    else
    {
      uint64_t v6 = 0LL;
    }
  }

  else
  {
    APSLogErrorAt(0LL, "fvdsrc_plugProcessor", 274LL, 0LL);
    uint64_t v6 = 4294955226LL;
    *((_DWORD *)v10 + 6) = -12070;
  }

  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t sub_100002B68(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  int v12 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2)
  {
    uint64_t v4 = *(dispatch_queue_s **)(DerivedStorage + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_100002EF8;
    block[3] = &unk_10000C898;
    block[5] = DerivedStorage;
    void block[6] = a2;
    block[4] = &v9;
    dispatch_sync(v4, block);
    uint64_t v5 = *((unsigned int *)v10 + 6);
    if ((_DWORD)v5)
    {
      APSLogErrorAt(v5, "fvdsrc_unplugProcessor", 305LL, 0LL);
      uint64_t v6 = *((unsigned int *)v10 + 6);
    }

    else
    {
      uint64_t v6 = 0LL;
    }
  }

  else
  {
    APSLogErrorAt(0LL, "fvdsrc_unplugProcessor", 296LL, 0LL);
    uint64_t v6 = 4294955226LL;
    *((_DWORD *)v10 + 6) = -12070;
  }

  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t sub_100002C58(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  int v12 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v4 = *(dispatch_queue_s **)(DerivedStorage + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100002F54;
  block[3] = &unk_10000C8C0;
  block[4] = &v9;
  block[5] = DerivedStorage;
  void block[6] = a2;
  dispatch_sync(v4, block);
  uint64_t v5 = 0LL;
  uint64_t v6 = *((unsigned int *)v10 + 6);
  if ((_DWORD)v6)
  {
    APSLogErrorAt(v6, "fvdsrc_start", 330LL, 0LL);
    uint64_t v5 = *((unsigned int *)v10 + 6);
  }

  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t sub_100002D1C()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = *(dispatch_queue_s **)(DerivedStorage + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_1000032A4;
  block[3] = &unk_10000C908;
  block[4] = DerivedStorage;
  dispatch_sync(v1, block);
  return 0LL;
}

uint64_t sub_100002D7C()
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000LL;
  int v8 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = *(dispatch_queue_s **)(DerivedStorage + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000LL;
  v4[2] = sub_100003398;
  v4[3] = &unk_10000C930;
  v4[4] = &v5;
  v4[5] = DerivedStorage;
  dispatch_sync(v1, v4);
  uint64_t v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_100002E10()
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000LL;
  int v8 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = *(dispatch_queue_s **)(DerivedStorage + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000LL;
  v4[2] = sub_1000034B8;
  v4[3] = &unk_10000C958;
  v4[4] = &v5;
  v4[5] = DerivedStorage;
  dispatch_sync(v1, v4);
  uint64_t v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

CFTypeRef *sub_100002EA4(CFTypeRef *result)
{
  uint64_t v1 = result;
  uint64_t v2 = result[5];
  if (v2[28] || *(void *)v2)
  {
    *(_DWORD *)(*((void *)result[4] + 1) + 24LL) = -12073;
  }

  else
  {
    uint64_t result = (CFTypeRef *)CFRetain(result[6]);
    *(void *)v1[5] = v1[6];
  }

  return result;
}

void sub_100002EF8(void *a1)
{
  uint64_t v2 = a1[5];
  if (!*(_DWORD *)(v2 + 112) && (int v3 = *(const void **)v2, *(void *)v2 == a1[6]))
  {
    if (v3)
    {
      CFRelease(v3);
      *(void *)a1[5] = 0LL;
    }
  }

  else
  {
    *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL) = -12070;
  }

void sub_100002F54(void *a1)
{
  uint64_t v2 = (uint64_t *)a1[5];
  if (*((_DWORD *)v2 + 28) || (uint64_t v3 = *v2) == 0)
  {
    *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL) = -12070;
    return;
  }

  CFTypeRef v25 = 0LL;
  CFTypeRef v26 = 0LL;
  __int128 v23 = xmmword_100009DD0;
  unsigned int v22 = 60;
  unsigned __int8 v21 = 0;
  uint64_t v4 = *(uint64_t (**)(uint64_t, CFTypeRef *, CFTypeRef *))(*(void *)(CMBaseObjectGetVTable(v3) + 16) + 56LL);
  if (!v4)
  {
    uint64_t v14 = 4294954514LL;
LABEL_17:
    uint64_t v6 = v14;
    uint64_t v15 = 167LL;
LABEL_20:
    APSLogErrorAt(v6, "fvdsrc_init", v15, 0LL);
    goto LABEL_23;
  }

  uint64_t v5 = v4(v3, &v26, &v25);
  if ((_DWORD)v5)
  {
    uint64_t v14 = v5;
    goto LABEL_17;
  }

  uint64_t v6 = FigDisplayModes_LookupTimingModeIDByIndex(v25, 0LL, &v24);
  if ((_DWORD)v6)
  {
    LODWORD(v14) = v6;
    uint64_t v15 = 171LL;
    goto LABEL_20;
  }

  uint64_t v7 = v24;
  uint64_t v8 = *v2;
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(CMBaseObjectGetVTable(*v2) + 16) + 64LL);
  if (!v9)
  {
    uint64_t v14 = 4294954514LL;
LABEL_19:
    uint64_t v6 = v14;
    uint64_t v15 = 176LL;
    goto LABEL_20;
  }

  uint64_t v10 = v9(v8, v7, v7);
  if ((_DWORD)v10)
  {
    uint64_t v14 = v10;
    goto LABEL_19;
  }

  uint64_t v6 = FigDisplayModes_ExtractDimensionsFromTimingMode(v25, v24, &v23);
  if ((_DWORD)v6)
  {
    LODWORD(v14) = v6;
    uint64_t v15 = 179LL;
    goto LABEL_20;
  }

  FigDisplayModes_ExtractOverscanInfoFromTimingMode(v25, v24, &v21);
  FigDisplayModes_ExtractVSyncRateFromTimingMode(v25, v24, &v22);
  *((_OWORD *)v2 + 3) = v23;
  unsigned int v11 = v22;
  *((_DWORD *)v2 + 18) = v22;
  v2[8] = 0LL;
  uint64_t v12 = v2[4];
  if (v12)
  {
    int v13 = (dispatch_queue_s *)v2[5];
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_100003284;
    block[3] = &unk_10000C8E8;
    block[4] = v12;
    __int128 v19 = v23;
    unsigned int v20 = v11;
    dispatch_async(v13, block);
  }

  if (dword_100010248 <= 50
    && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
  {
    LogPrintF( &dword_100010248,  "OSStatus fvdsrc_init(FVDSourceStorage *)",  33554482LL,  "%@ FVD source: using display size: %d x %d, refresh rate: %d Hz, overscanned: %d",  v2[2],  (int)*(double *)&v23,  (int)*((double *)&v23 + 1),  v22,  v21);
  }

  LODWORD(v14) = 0;
LABEL_23:
  if (v26) {
    CFRelease(v26);
  }
  if (v25) {
    CFRelease(v25);
  }
  *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL) = v14;
  if (!*(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    LOBYTE(block[0]) = 0;
    FigCFDictionaryGetBooleanIfPresent(a1[6], kFigVirtualDisplayOption_SuspendOnActivate, block);
    int v16 = LOBYTE(block[0]) ? 1 : 2;
    uint64_t v17 = a1[5];
    *(_DWORD *)(v17 + 112) = v16;
    if (dword_100010248 <= 50)
    {
      if (dword_100010248 != -1)
      {
LABEL_33:
        LogPrintF( &dword_100010248,  "OSStatus fvdsrc_start(FigVirtualDisplaySourceRef, CFDictionaryRef)_block_invoke",  33554482LL,  "%@ FVD source started",  *(void *)(v17 + 16));
        return;
      }

      if (_LogCategory_Initialize(&dword_100010248, 33554482LL))
      {
        uint64_t v17 = a1[5];
        goto LABEL_33;
      }
    }
  }

uint64_t sub_100003284(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  (int)*(double *)(a1 + 40),  (int)*(double *)(a1 + 48),  *(unsigned int *)(a1 + 56));
}

void sub_1000032A4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 112))
  {
    sub_100003348(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)(v3 + 112) = 0;
    if (dword_100010248 <= 50)
    {
      if (dword_100010248 != -1)
      {
LABEL_4:
        LogPrintF( &dword_100010248,  "OSStatus fvdsrc_stop(FigVirtualDisplaySourceRef)_block_invoke",  33554482LL,  "%@ FVD source stopped",  *(void *)(v3 + 16));
        return;
      }

      if (_LogCategory_Initialize(&dword_100010248, 33554482LL))
      {
        uint64_t v3 = *(void *)(a1 + 32);
        goto LABEL_4;
      }
    }
  }

void sub_100003348(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 88))
  {
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 80), 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
    uint64_t v2 = *(const void **)(a1 + 96);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 96) = 0LL;
    }

    *(void *)(a1 + 104) = 0LL;
    *(_BYTE *)(a1 + 88) = 0;
  }

uint64_t sub_100003398(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 40);
  if (!*(_DWORD *)(v2 + 112))
  {
    if (dword_100010248 <= 90)
    {
      if (dword_100010248 == -1)
      {
        uint64_t result = _LogCategory_Initialize(&dword_100010248, 33554522LL);
        if (!(_DWORD)result) {
          goto LABEL_12;
        }
        uint64_t v2 = *(void *)(v1 + 40);
        uint64_t v3 = *(unsigned int *)(v2 + 112);
      }

      else
      {
        uint64_t v3 = 0LL;
      }

      uint64_t result = LogPrintF( &dword_100010248,  "OSStatus fvdsrc_suspend(FigVirtualDisplaySourceRef)_block_invoke",  33554522LL,  "%@ FVD source: can't suspend from state '%d'",  *(void *)(v2 + 16),  v3);
    }

LABEL_12:
    *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8LL) + 24LL) = -12070;
    return result;
  }

  *(_DWORD *)(v2 + 112) = 1;
  if (dword_100010248 <= 50)
  {
    if (dword_100010248 != -1) {
      return LogPrintF( &dword_100010248,  "OSStatus fvdsrc_suspend(FigVirtualDisplaySourceRef)_block_invoke",  33554482LL,  "%@ FVD source suspended",  *(void *)(v2 + 16));
    }
    uint64_t result = _LogCategory_Initialize(&dword_100010248, 33554482LL);
    if ((_DWORD)result)
    {
      uint64_t v2 = *(void *)(v1 + 40);
      return LogPrintF( &dword_100010248,  "OSStatus fvdsrc_suspend(FigVirtualDisplaySourceRef)_block_invoke",  33554482LL,  "%@ FVD source suspended",  *(void *)(v2 + 16));
    }
  }

  return result;
}

uint64_t sub_1000034B8(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 40);
  uint64_t v3 = *(unsigned int *)(v2 + 112);
  if ((_DWORD)v3 != 1)
  {
    if (dword_100010248 <= 90)
    {
      if (dword_100010248 == -1)
      {
        uint64_t result = _LogCategory_Initialize(&dword_100010248, 33554522LL);
        if (!(_DWORD)result) {
          goto LABEL_11;
        }
        uint64_t v2 = *(void *)(v1 + 40);
        uint64_t v3 = *(unsigned int *)(v2 + 112);
      }

      uint64_t result = LogPrintF( &dword_100010248,  "OSStatus fvdsrc_resume(FigVirtualDisplaySourceRef)_block_invoke",  33554522LL,  "%@ FVD source: can't resume from state '%d'",  *(void *)(v2 + 16),  v3);
    }

LABEL_11:
    *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8LL) + 24LL) = -12070;
    return result;
  }

  *(_DWORD *)(v2 + 112) = 2;
  if (dword_100010248 <= 50)
  {
    if (dword_100010248 != -1) {
      return LogPrintF( &dword_100010248,  "OSStatus fvdsrc_resume(FigVirtualDisplaySourceRef)_block_invoke",  33554482LL,  "%@ FVD source resumed",  *(void *)(v2 + 16));
    }
    uint64_t result = _LogCategory_Initialize(&dword_100010248, 33554482LL);
    if ((_DWORD)result)
    {
      uint64_t v2 = *(void *)(v1 + 40);
      return LogPrintF( &dword_100010248,  "OSStatus fvdsrc_resume(FigVirtualDisplaySourceRef)_block_invoke",  33554482LL,  "%@ FVD source resumed",  *(void *)(v2 + 16));
    }
  }

  return result;
}

uint64_t sub_1000035D8(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4)
{
  return LogPrintF(a1, a2, 33554532LL, a4);
}

uint64_t sub_1000035E4(uint64_t a1)
{
  return _LogCategory_Initialize(a1, 33554532LL);
}

  ;
}

LABEL_47:
  if (dword_100010248 <= 90
    && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554522LL)))
  {
    LogPrintF( &dword_100010248,  "-[APSKServerSession startWithXPCParams:]",  33554522LL,  "[%{ptr}] remote session start failed, error: %#m",  self,  v12);
  }

  v31 = self->_sender;
  if (v31)
  {
    CFRelease(v31);
    self->_sender = 0LL;
  }

LABEL_27:
  if (v47) {
    CFRelease(v47);
  }
  if (v48[0]) {
    CFRelease(v48[0]);
  }

  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);

  objc_destroyWeak(&v45);
  objc_destroyWeak(&location);

  return v12;
}

void sub_100003E9C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, id *a13, id *a14, id *a15)
{
}

void sub_100003F00(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleAuthRequired:a2];
}

void sub_100003F3C(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleStartCompletion:a2];
}

void sub_100003F78(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleFailure:a2];
}

void sub_100003FB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleUpdatedDisplayWidth:a2 height:a3 refreshRate:a4];
}

void sub_100004008(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"APMediaSender_Status"]);
  id v6 = [v5 intValue];

  [WeakRetained handleVideoStreamErrorNotification:v6];
}

LABEL_5:
  if (cf) {
    CFRelease(cf);
  }

  return v10;
}

uint64_t sub_100004A30(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = objc_autoreleasePoolPush();
  int v20 = 0;
  uint64_t value = 0LL;
  uint64_t OpCode = FigXPCMessageGetOpCode(v6, &v20);
  if ((_DWORD)OpCode)
  {
    uint64_t v12 = OpCode;
    APSLogErrorAt(OpCode, "APSKServerSessionHandleClientMessage", 369LL, 0LL);
    goto LABEL_24;
  }

  if (v20 == 1768843636)
  {
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___APSKServerSession);
    uint64_t v11 = FigXPCServerAssociateObjectWithConnection(v5, v10, 0LL, 0LL, 0LL, &value);
    uint64_t v12 = v11;
    if ((_DWORD)v11)
    {
      APSLogErrorAt(v11, "APSKServerSessionHandleClientMessage", 375LL, 0LL);
    }

    else
    {
      -[APSKServerSession setObjectID:andConnection:](v10, "setObjectID:andConnection:", value, v5);
      xpc_dictionary_set_uint64(v7, kFigCommonXPCMsgParam_ObjectID, value);
    }

    goto LABEL_23;
  }

  double v18 = 0LL;
  uint64_t uint64 = xpc_dictionary_get_uint64(v6, kFigCommonXPCMsgParam_ObjectID);
  uint64_t value = uint64;
  uint64_t v14 = FigXPCServerLookupAndRetainAssociatedObject(v5, uint64, &v18, 0LL);
  if ((_DWORD)v14)
  {
    uint64_t v12 = v14;
    APSLogErrorAt(v14, "APSKServerSessionHandleClientMessage", 383LL, 0LL);
    uint64_t v10 = 0LL;
    goto LABEL_23;
  }

  uint64_t v10 = v18;
  uint64_t v15 = v20;
  if (v20 <= 1936750435)
  {
    if (v20 == 1635083364)
    {
      uint64_t v16 = -[APSKServerSession sendAudioDataFromXPCParams:](v18, "sendAudioDataFromXPCParams:", v6);
      goto LABEL_17;
    }

    if (v20 == 1718772077)
    {
      uint64_t v16 = -[APSKServerSession sendFrameFromXPCParams:](v18, "sendFrameFromXPCParams:", v6);
      goto LABEL_17;
    }

LABEL_18:
    if (dword_100010248 <= 90)
    {
      if (dword_100010248 == -1)
      {
        uint64_t v15 = v20;
      }

      LogPrintF( &dword_100010248,  "OSStatus APSKServerSessionHandleClientMessage(__strong xpc_connection_t, __strong xpc_object_t, __strong xpc_object_t)",  33554522LL,  "[%{ptr}] server session: unknown opCode: '%C'",  v10,  v15);
    }

LABEL_22:
    uint64_t v12 = 4294960591LL;
    goto LABEL_23;
  }

  if (v20 == 1936750436)
  {
    uint64_t v16 = -[APSKServerSession setAuthStringFromXPCParams:](v18, "setAuthStringFromXPCParams:", v6);
    goto LABEL_17;
  }

  if (v20 != 1937010544)
  {
    if (v20 == 1937011316)
    {
      uint64_t v16 = -[APSKServerSession startWithXPCParams:](v18, "startWithXPCParams:", v6);
LABEL_17:
      uint64_t v12 = v16;
      goto LABEL_23;
    }

    goto LABEL_18;
  }

  -[APSKServerSession stop](v18, "stop");
  FigXPCServerDisassociateObjectWithConnection(v5, uint64);
  uint64_t v12 = 0LL;
LABEL_23:

LABEL_24:
  objc_autoreleasePoolPop(v8);

  return v12;
}

uint64_t sub_100004CF8()
{
  if (qword_1000103C0 != -1) {
    dispatch_once(&qword_1000103C0, &stru_10000CA20);
  }
  return qword_1000103B8;
}

void sub_100004D38(id a1)
{
  qword_100010358 = 0LL;
  unk_100010360 = "APMediaSender";
  qword_100010368 = 0LL;
  unk_100010370 = 0LL;
  qword_100010378 = (uint64_t)sub_100004D88;
  unk_100010380 = 0LL;
  qword_100010388 = 0LL;
  unk_100010390 = 0LL;
  qword_100010398 = (uint64_t)sub_100004EF8;
  qword_1000103B8 = _CFRuntimeRegisterClass(&qword_100010358);
}

void sub_100004D88(uint64_t a1)
{
  if (dword_100010248 <= 50
    && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
  {
    LogPrintF(&dword_100010248, "void sender_finalize(CFTypeRef)", 33554482LL, "[%{ptr}] finalizing media sender", a1);
  }

  if (*(_BYTE *)(a1 + 182))
  {
    if (dword_100010248 <= 100) {
      sub_1000091E8(dword_100010248, a1);
    }
    __break(1u);
  }

  else
  {
    uint64_t v2 = *(const void **)(a1 + 120);
    if (v2)
    {
      _Block_release(v2);
      *(void *)(a1 + 120) = 0LL;
    }

    id v3 = *(const void **)(a1 + 128);
    if (v3)
    {
      _Block_release(v3);
      *(void *)(a1 + 128) = 0LL;
    }

    uint64_t v4 = *(void *)(a1 + 136);
    if (v4)
    {
      FigSimpleMutexDestroy(v4);
      *(void *)(a1 + 136) = 0LL;
    }

    id v5 = *(const void **)(a1 + 40);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(a1 + 40) = 0LL;
    }

    id v6 = *(const void **)(a1 + 32);
    if (v6)
    {
      CFRelease(v6);
      *(void *)(a1 + 32) = 0LL;
    }

    id v7 = *(const void **)(a1 + 48);
    if (v7)
    {
      CFRelease(v7);
      *(void *)(a1 + 48) = 0LL;
    }

    uint64_t v8 = *(const void **)(a1 + 56);
    if (v8)
    {
      CFRelease(v8);
      *(void *)(a1 + 56) = 0LL;
    }

    uint64_t v9 = *(const void **)(a1 + 104);
    if (v9)
    {
      CFRelease(v9);
      *(void *)(a1 + 104) = 0LL;
    }

    uint64_t v10 = *(const void **)(a1 + 112);
    if (v10)
    {
      CFRelease(v10);
      *(void *)(a1 + 112) = 0LL;
    }

    uint64_t v11 = *(dispatch_object_s **)(a1 + 152);
    if (v11)
    {
      dispatch_release(v11);
      *(void *)(a1 + 152) = 0LL;
    }

    uint64_t v12 = *(dispatch_object_s **)(a1 + 144);
    if (v12)
    {
      dispatch_release(v12);
      *(void *)(a1 + 144) = 0LL;
    }

    int v13 = *(dispatch_object_s **)(a1 + 24);
    if (v13)
    {
      dispatch_release(v13);
      *(void *)(a1 + 24) = 0LL;
    }

    uint64_t v14 = *(dispatch_object_s **)(a1 + 16);
    if (v14)
    {
      dispatch_release(v14);
      *(void *)(a1 + 16) = 0LL;
    }
  }

CFStringRef sub_100004EF8(uint64_t a1)
{
  id v6 = 0LL;
  ASPrintF(&v6, "%{ptr}", a1);
  uint64_t v2 = CFGetAllocator((CFTypeRef)a1);
  id v3 = "yes";
  if (!*(_BYTE *)(a1 + 182)) {
    id v3 = "no";
  }
  CFStringRef v4 = CFStringCreateWithFormat( v2,  0LL,  @"<APMediaSender %p %s>{ active: %s, usage modes: 0x%x }",  a1,  v6,  v3,  *(unsigned int *)(a1 + 168));
  free(v6);
  return v4;
}

void *sub_100004F88()
{
  if (qword_1000103C0 != -1) {
    dispatch_once(&qword_1000103C0, &stru_10000CA20);
  }
  uint64_t Instance = _CFRuntimeCreateInstance(kCFAllocatorDefault, qword_1000103B8, 168LL, 0LL);
  uint64_t v1 = (void *)Instance;
  if (!Instance)
  {
    APSLogErrorAt(0LL, "APMediaSenderCreate", 259LL, 0LL);
    uint64_t v5 = 4294960568LL;
    goto LABEL_15;
  }

  *(_OWORD *)(Instance + 32) = 0u;
  *(void *)(Instance + 176) = 0LL;
  *(_OWORD *)(Instance + 144) = 0u;
  *(_OWORD *)(Instance + 160) = 0u;
  *(_OWORD *)(Instance + 112) = 0u;
  *(_OWORD *)(Instance + 128) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(_OWORD *)(Instance + 96) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 16) = 0u;
  *(void *)(Instance + 16) = dispatch_queue_create("APMediaSenderQueue", 0LL);
  v1[3] = dispatch_queue_create("APMediaSenderCallbackQueue", 0LL);
  v1[19] = dispatch_semaphore_create(0LL);
  v1[17] = FigSimpleMutexCreate();
  uint64_t v2 = APEndpointManagerCreate(v1 + 4);
  if ((_DWORD)v2)
  {
    uint64_t v5 = v2;
    uint64_t v6 = 268LL;
    uint64_t v7 = 0LL;
LABEL_14:
    APSLogErrorAt(v2, "APMediaSenderCreate", v6, v7);
LABEL_15:
    if (dword_100010248 <= 90
      && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554522LL)))
    {
      LogPrintF( &dword_100010248,  "APMediaSenderRef APMediaSenderCreate(void)",  33554522LL,  "### APMediaSenderCreate failed, error: %#m\n",  v5);
    }

    if (v1)
    {
      CFRelease(v1);
      return 0LL;
    }

    return v1;
  }

  CFTypeRef v3 = sub_100001F44();
  v1[6] = v3;
  if (!v3)
  {
    uint64_t v5 = 4294960534LL;
    uint64_t v2 = 4294960534LL;
    uint64_t v6 = 271LL;
    uint64_t v7 = 1LL;
    goto LABEL_14;
  }

  if (dword_100010248 <= 50)
  {
    if (dword_100010248 == -1)
    {
      CFTypeRef v3 = (CFTypeRef)v1[6];
    }

    LogPrintF( &dword_100010248,  "APMediaSenderRef APMediaSenderCreate(void)",  33554482LL,  "[%{ptr}] created media sender with FVD source %{ptr}",  v1,  v3);
  }

  return v1;
}

uint64_t sub_1000051A4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  int v9 = 0;
  uint64_t v2 = *(dispatch_queue_s **)(a1 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100005238;
  block[3] = &unk_10000CA48;
  void block[5] = &v6;
  void block[6] = a1;
  block[4] = a2;
  dispatch_sync(v2, block);
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_100005238(void *a1)
{
  uint64_t v2 = a1[6];
  if (*(_BYTE *)(v2 + 182))
  {
    *(_DWORD *)(*(void *)(a1[5] + 8LL) + 24LL) = -6709;
    APSLogErrorAt( *(unsigned int *)(*(void *)(a1[5] + 8LL) + 24LL),  "APMediaSenderSetAuthBlock_block_invoke",  288LL,  1LL);
  }

  else
  {
    uint64_t v3 = (const void *)a1[4];
    if (v3)
    {
      CFStringRef v4 = _Block_copy(v3);
      uint64_t v2 = a1[6];
    }

    else
    {
      CFStringRef v4 = 0LL;
    }

    uint64_t v5 = *(const void **)(v2 + 120);
    if (v5)
    {
      _Block_release(v5);
      uint64_t v2 = a1[6];
    }

    *(void *)(v2 + 120) = v4;
  }

uint64_t sub_1000052C8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  int v9 = 0;
  uint64_t v2 = *(dispatch_queue_s **)(a1 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10000535C;
  block[3] = &unk_10000CA70;
  void block[5] = &v6;
  void block[6] = a1;
  block[4] = a2;
  dispatch_sync(v2, block);
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_10000535C(void *a1)
{
  uint64_t v2 = a1[6];
  if (*(_BYTE *)(v2 + 182))
  {
    *(_DWORD *)(*(void *)(a1[5] + 8LL) + 24LL) = -6709;
    APSLogErrorAt( *(unsigned int *)(*(void *)(a1[5] + 8LL) + 24LL),  "APMediaSenderSetFailureBlock_block_invoke",  302LL,  1LL);
  }

  else
  {
    uint64_t v3 = (const void *)a1[4];
    if (v3)
    {
      CFStringRef v4 = _Block_copy(v3);
      uint64_t v2 = a1[6];
    }

    else
    {
      CFStringRef v4 = 0LL;
    }

    uint64_t v5 = *(const void **)(v2 + 128);
    if (v5)
    {
      _Block_release(v5);
      uint64_t v2 = a1[6];
    }

    *(void *)(v2 + 128) = v4;
  }

uint64_t sub_1000053EC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  int v9 = 0;
  uint64_t v2 = *(dispatch_queue_s **)(a1 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100005480;
  block[3] = &unk_10000CA98;
  void block[5] = &v6;
  void block[6] = a1;
  block[4] = a2;
  dispatch_sync(v2, block);
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t sub_100005480(uint64_t *a1)
{
  uint64_t v2 = a1[6];
  if (*(_BYTE *)(v2 + 182))
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24LL) = -6709;
    uint64_t result = *(unsigned int *)(*(void *)(a1[5] + 8) + 24LL);
    uint64_t v4 = 317LL;
    uint64_t v5 = 1LL;
    return APSLogErrorAt(result, "APMediaSenderSetDisplayInfoUpdateBlock_block_invoke", v4, v5);
  }

  *(_DWORD *)(*(void *)(a1[5] + 8) + 24LL) = sub_1000021B8(*(void *)(v2 + 48), *(void *)(v2 + 24), a1[4]);
  uint64_t result = *(unsigned int *)(*(void *)(a1[5] + 8) + 24LL);
  if ((_DWORD)result)
  {
    uint64_t v4 = 319LL;
    uint64_t v5 = 0LL;
    return APSLogErrorAt(result, "APMediaSenderSetDisplayInfoUpdateBlock_block_invoke", v4, v5);
  }

  return result;
}

uint64_t sub_100005520(uint64_t a1)
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000LL;
  int v8 = 0;
  uint64_t v1 = *(dispatch_queue_s **)(a1 + 16);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000LL;
  v4[2] = sub_1000055B0;
  v4[3] = &unk_10000CAC0;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync(v1, v4);
  uint64_t v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_1000055B0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(_BYTE *)(v2 + 182))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = -6709;
    uint64_t result = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    uint64_t v4 = 332LL;
    uint64_t v5 = 1LL;
    return APSLogErrorAt(result, "APMediaSenderSetVideoPassthroughMode_block_invoke", v4, v5);
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = sub_1000022D4(*(void *)(v2 + 48), 0);
  uint64_t result = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if ((_DWORD)result)
  {
    uint64_t v4 = 334LL;
    uint64_t v5 = 0LL;
    return APSLogErrorAt(result, "APMediaSenderSetVideoPassthroughMode_block_invoke", v4, v5);
  }

  if (dword_100010248 <= 50)
  {
    if (dword_100010248 != -1) {
      return LogPrintF( &dword_100010248,  "OSStatus APMediaSenderSetVideoPassthroughMode(APMediaSenderRef)_block_invoke",  33554482LL,  "[%{ptr}] media sender: set video passthrough mode",  *(void *)(a1 + 40));
    }
    uint64_t result = _LogCategory_Initialize(&dword_100010248, 33554482LL);
    if ((_DWORD)result) {
      return LogPrintF( &dword_100010248,  "OSStatus APMediaSenderSetVideoPassthroughMode(APMediaSenderRef)_block_invoke",  33554482LL,  "[%{ptr}] media sender: set video passthrough mode",  *(void *)(a1 + 40));
    }
  }

  return result;
}

uint64_t sub_1000056B8(uint64_t a1, CFTypeRef cf)
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  int v12 = 0;
  if (cf)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 == CFDictionaryGetTypeID())
    {
      if (IsAppleInternalBuild())
      {
        uint64_t v5 = *(dispatch_queue_s **)(a1 + 16);
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000LL;
        block[2] = sub_100005780;
        block[3] = &unk_10000CAE8;
        block[4] = &v9;
        void block[5] = a1;
        void block[6] = cf;
        dispatch_sync(v5, block);
      }
    }
  }

  uint64_t v6 = *((unsigned int *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void sub_100005780(void *a1)
{
  uint64_t v2 = a1[5];
  if (*(_BYTE *)(v2 + 182))
  {
    *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL) = -6709;
    APSLogErrorAt( *(unsigned int *)(*(void *)(a1[4] + 8LL) + 24LL),  "APMediaSenderSetVideoOverrides_block_invoke",  349LL,  1LL);
  }

  else
  {
    uint64_t v3 = *(const void **)(v2 + 104);
    CFTypeID v4 = (const void *)a1[6];
    *(void *)(v2 + 104) = v4;
    if (v4) {
      CFRetain(v4);
    }
    if (v3) {
      CFRelease(v3);
    }
    if (dword_100010248 <= 50
      && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
    {
      LogPrintF( &dword_100010248,  "OSStatus APMediaSenderSetVideoOverrides(APMediaSenderRef, CFDictionaryRef)_block_invoke",  33554482LL,  "[%{ptr}] media sender: set video overrides: %@",  a1[5],  a1[6]);
    }
  }

uint64_t sub_10000586C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  int v11 = 0;
  if (a2)
  {
    uint64_t v3 = *(dispatch_queue_s **)(a1 + 16);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 0x40000000LL;
    v6[2] = sub_100005910;
    v6[3] = &unk_10000CB10;
    v6[4] = &v8;
    v6[5] = a1;
    v6[6] = a2;
    char v7 = a3;
    dispatch_sync(v3, v6);
    uint64_t v4 = *((unsigned int *)v9 + 6);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t sub_100005910(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 40);
  if (*(_BYTE *)(v2 + 182))
  {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = -6709;
    return APSLogErrorAt( *(unsigned int *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL),  "APMediaSenderSetAudioDescription_block_invoke",  367LL,  1LL);
  }

  else
  {
    uint64_t v3 = *(__int128 **)(result + 48);
    __int128 v4 = *v3;
    __int128 v5 = v3[1];
    *(void *)(v2 + 96) = *((void *)v3 + 4);
    *(_OWORD *)(v2 + 64) = v4;
    *(_OWORD *)(v2 + 80) = v5;
    uint64_t v6 = *(void *)(result + 40);
    *(_BYTE *)(v6 + 180) = *(_BYTE *)(result + 56);
    if (dword_100010248 <= 50)
    {
      if (dword_100010248 != -1) {
        return LogPrintF( &dword_100010248,  "OSStatus APMediaSenderSetAudioDescription(APMediaSenderRef, const AudioStreamBasicDescription *, Boolean)_block_invoke",  33554482LL,  "[%{ptr}] media sender: set audio description to [%{asbd}]",  v6,  *(void *)(v1 + 48));
      }
      uint64_t result = _LogCategory_Initialize(&dword_100010248, 33554482LL);
      if ((_DWORD)result)
      {
        uint64_t v6 = *(void *)(v1 + 40);
        return LogPrintF( &dword_100010248,  "OSStatus APMediaSenderSetAudioDescription(APMediaSenderRef, const AudioStreamBasicDescription *, Boolean)_block_invoke",  33554482LL,  "[%{ptr}] media sender: set audio description to [%{asbd}]",  v6,  *(void *)(v1 + 48));
      }
    }
  }

  return result;
}

uint64_t sub_100005A04(uint64_t a1, const void *a2)
{
  uint64_t v11 = 0LL;
  int v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  int v14 = 0;
  FigSimpleMutexLock(*(void *)(a1 + 136));
  __int128 v4 = *(dispatch_semaphore_s **)(a1 + 144);
  if (v4)
  {
    dispatch_retain(*(dispatch_object_t *)(a1 + 144));
    __int128 v5 = *(const void **)(a1 + 112);
    *(void *)(a1 + 112) = a2;
    if (a2) {
      CFRetain(a2);
    }
    if (v5) {
      CFRelease(v5);
    }
    FigSimpleMutexUnlock(*(void *)(a1 + 136));
    dispatch_semaphore_signal(v4);
    dispatch_release(v4);
  }

  else
  {
    FigSimpleMutexUnlock(*(void *)(a1 + 136));
    uint64_t v6 = *(dispatch_queue_s **)(a1 + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_100005B28;
    block[3] = &unk_10000CB38;
    block[4] = &v11;
    void block[5] = a1;
    void block[6] = a2;
    dispatch_sync(v6, block);
  }

  uint64_t v7 = *((unsigned int *)v12 + 6);
  if ((_DWORD)v7)
  {
    APSLogErrorAt(v7, "APMediaSenderSetAuthString", 406LL, 0LL);
    uint64_t v8 = *((unsigned int *)v12 + 6);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  _Block_object_dispose(&v11, 8);
  return v8;
}

void sub_100005B28(void *a1)
{
  uint64_t v1 = a1[5];
  if (*(_BYTE *)(v1 + 182))
  {
    *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL) = -6709;
  }

  else
  {
    uint64_t v2 = *(const void **)(v1 + 112);
    uint64_t v3 = (const void *)a1[6];
    *(void *)(v1 + 112) = v3;
    if (v3) {
      CFRetain(v3);
    }
    if (v2) {
      CFRelease(v2);
    }
  }

void sub_100005B84(uint64_t a1, CFTypeRef cf, int a3, int a4, int a5, uint64_t a6)
{
  if (dword_100010248 <= 50
    && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
  {
    LogPrintF( &dword_100010248,  "void APMediaSenderStart(APMediaSenderRef, CFTypeRef, APMediaSenderDestinationType, uint32_t, int, void (^)(OSStatus))",  33554482LL,  "[%{ptr}] starting media sender",  a1);
  }

  if (cf) {
    CFRetain(cf);
  }
  int v12 = *(dispatch_queue_s **)(a1 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100005C7C;
  block[3] = &unk_10000CB88;
  int v14 = a4;
  int v15 = a5;
  void block[5] = a1;
  void block[6] = cf;
  int v16 = a3;
  block[4] = a6;
  dispatch_async(v12, block);
}

void sub_100005C7C(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 40);
  *(_DWORD *)(v3 + 168) = v2;
  if (*(_DWORD *)(a1 + 60)) {
    int v4 = *(_DWORD *)(a1 + 60);
  }
  else {
    int v4 = 30;
  }
  *(_DWORD *)(v3 + 172) = v4;
  CFMutableDictionaryRef v5 = *(CFMutableDictionaryRef *)(a1 + 48);
  int v6 = *(_DWORD *)(a1 + 64);
  CFTypeRef v85 = 0LL;
  CFTypeRef cf = 0LL;
  if (v4 >= 0) {
    int v7 = 1000 * v4;
  }
  else {
    int v7 = 0;
  }
  if (!v5)
  {
    uint64_t v16 = 4294960591LL;
    uint64_t v66 = 4294960591LL;
    uint64_t v69 = 678LL;
    goto LABEL_172;
  }

  if (*(_BYTE *)(v3 + 182))
  {
    uint64_t v16 = 4294960587LL;
    uint64_t v43 = 4294960587LL;
    uint64_t v44 = 679LL;
LABEL_168:
    uint64_t v45 = 1LL;
    goto LABEL_70;
  }

  if ((v2 & 3) == 0)
  {
    uint64_t v16 = 4294960591LL;
    uint64_t v43 = 4294960591LL;
    uint64_t v44 = 682LL;
    goto LABEL_168;
  }

  uint64_t v8 = (void *)(v3 + 40);
  unsigned int v78 = v7;
  switch(v6)
  {
    case 0:
      CFTypeID v9 = CFGetTypeID(v5);
      CFTypeID TypeID = CFStringGetTypeID();
      if (v9 != TypeID)
      {
        uint64_t v16 = 4294960591LL;
        uint64_t v17 = 4294960591LL;
        uint64_t v18 = 582LL;
        goto LABEL_181;
      }

      if (dword_100010248 <= 50)
      {
        if (dword_100010248 != -1 || (CFTypeID TypeID = _LogCategory_Initialize(&dword_100010248, 33554482LL), (_DWORD)TypeID)) {
          CFTypeID TypeID = LogPrintF( &dword_100010248,  "OSStatus sender_discoverAndCopyEndpoint(APMediaSenderRef, CFTypeRef, APMediaSenderDestinationType, FigEndpointRef *)",  33554482LL,  "[%{ptr}] media sender: using endpoint address '%@'",  v3,  v5);
        }
      }

      uint64_t v91 = 0LL;
      v92 = &v91;
      uint64_t v93 = 0x2000000000LL;
      int v94 = 0;
      CFTypeRef v89 = 0LL;
      v90 = 0LL;
      CFTypeRef v88 = 0LL;
      TestInfoDictionardouble y = (__CFDictionary *)APAdvertiserInfoCreateTestInfoDictionary(TypeID);
      CFDictionarySetValue(TestInfoDictionary, kAPAdvertiserInfoProperty_DeviceName, v5);
      int v20 = (void *)CFDictionaryCopyCString(TestInfoDictionary, kAPAdvertiserInfoProperty_DeviceID, v92 + 3);
      uint64_t v21 = *((unsigned int *)v92 + 6);
      if ((_DWORD)v21)
      {
        APSLogErrorAt(v21, "createEndpointForNetworkAddress", 136LL, 0LL);
        CFMutableDictionaryRef v26 = 0LL;
        Mutable = 0LL;
      }

      else
      {
        uint64_t v22 = TextToHardwareAddressScalar(v20, -1LL, 6LL);
        uint64_t v23 = APAdvertiserInfoCreate(kCFAllocatorDefault, &v90);
        *((_DWORD *)v92 + 6) = v23;
        if ((_DWORD)v23)
        {
          APSLogErrorAt(v23, "createEndpointForNetworkAddress", 140LL, 0LL);
          CFMutableDictionaryRef v26 = 0LL;
          Mutable = 0LL;
        }

        else
        {
          theArray[0] = (CFArrayRef)_NSConcreteStackBlock;
          theArray[1] = (CFArrayRef)0x40000000;
          theArray[2] = (CFArrayRef)sub_100007964;
          theArray[3] = (CFArrayRef)&unk_10000CC48;
          theArray[4] = (CFArrayRef)&v91;
          theArray[5] = v90;
          CFDictionaryApplyBlock(TestInfoDictionary, theArray);
          Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          CFDictionarySetInt64(Mutable, kAPBrowserEventInfoKey_DeviceID, v22);
          CFDictionarySetValue(Mutable, kAPBrowserEventInfoKey_DeviceInfo, v90);
          CFDictionarySetValue(Mutable, kAPBrowserEventInfoKey_IsLegacyPresent, kCFBooleanTrue);
          CFDictionarySetValue(Mutable, kAPBrowserEventInfoKey_IsModernPresent, kCFBooleanTrue);
          uint64_t v25 = APSNetworkAddressCreateWithString(kCFAllocatorDefault, v5, &v88);
          *((_DWORD *)v92 + 6) = v25;
          if ((_DWORD)v25)
          {
            uint64_t v76 = 153LL;
          }

          else
          {
            uint64_t v25 = APTransportDeviceCreateWithNetworkAddress(kCFAllocatorDefault, v88, 0LL, Mutable, &v89);
            *((_DWORD *)v92 + 6) = v25;
            if (!(_DWORD)v25)
            {
              CFMutableDictionaryRef v26 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
              uint64_t v8 = (void *)(v3 + 40);
              uint64_t v27 = APEndpointCreateWithTransportDevice(kCFAllocatorDefault, v89, 0LL, 0LL, v26, v3 + 40);
              *((_DWORD *)v92 + 6) = v27;
              if ((_DWORD)v27)
              {
                APSLogErrorAt(v27, "createEndpointForNetworkAddress", 160LL, 0LL);
              }

              else if (dword_100010248 <= 50 {
                     && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
              }
              {
                LogPrintF( &dword_100010248,  "OSStatus createEndpointForNetworkAddress(CFStringRef, FigEndpointRef *)",  33554482LL,  "Using endpoint info: %@\n",  TestInfoDictionary);
              }

              goto LABEL_74;
            }

            uint64_t v76 = 156LL;
          }

          APSLogErrorAt(v25, "createEndpointForNetworkAddress", v76, 0LL);
          CFMutableDictionaryRef v26 = 0LL;
        }

        uint64_t v8 = (void *)(v3 + 40);
      }

LABEL_74:
      free(v20);
      if (TestInfoDictionary) {
        CFRelease(TestInfoDictionary);
      }
      if (Mutable) {
        CFRelease(Mutable);
      }
      if (v26) {
        CFRelease(v26);
      }
      if (v90) {
        CFRelease(v90);
      }
      if (v89) {
        CFRelease(v89);
      }
      if (v88) {
        CFRelease(v88);
      }
      uint64_t v16 = *((unsigned int *)v92 + 6);
      _Block_object_dispose(&v91, 8);
      if (!(_DWORD)v16)
      {
        v46 = kCFAllocatorDefault;
        goto LABEL_111;
      }

      uint64_t v17 = v16;
      uint64_t v18 = 585LL;
      goto LABEL_68;
    case 1:
      CFTypeID v15 = CFGetTypeID(v5);
      if (v15 == CFStringGetTypeID())
      {
        if (dword_100010248 > 50)
        {
          CFMutableDictionaryRef v12 = 0LL;
          uint64_t v13 = (unsigned int (*)(const void *, const void *))sub_10000771C;
        }

        else
        {
          if (dword_100010248 != -1)
          {
            CFMutableDictionaryRef v12 = 0LL;
            uint64_t v13 = (unsigned int (*)(const void *, const void *))sub_10000771C;
LABEL_28:
            LogPrintF( &dword_100010248,  "OSStatus sender_discoverAndCopyEndpoint(APMediaSenderRef, CFTypeRef, APMediaSenderDestinationType, FigEndpointRef *)",  33554482LL,  "[%{ptr}] media sender: using endpoint name '%@'",  v3,  v5);
            goto LABEL_47;
          }

          CFMutableDictionaryRef v12 = 0LL;
          uint64_t v13 = (unsigned int (*)(const void *, const void *))sub_10000771C;
        }

        goto LABEL_47;
      }

      uint64_t v16 = 4294960591LL;
      uint64_t v17 = 4294960591LL;
      uint64_t v18 = 593LL;
      goto LABEL_181;
    case 2:
      CFTypeID v11 = CFGetTypeID(v5);
      if (v11 != CFStringGetTypeID())
      {
        uint64_t v16 = 4294960591LL;
        uint64_t v17 = 4294960591LL;
        uint64_t v18 = 598LL;
LABEL_181:
        uint64_t v42 = 1LL;
LABEL_69:
        APSLogErrorAt(v17, "sender_discoverAndCopyEndpoint", v18, v42);
        uint64_t v43 = v16;
        uint64_t v44 = 686LL;
        uint64_t v45 = 0LL;
LABEL_70:
        APSLogErrorAt(v43, "sender_startInternal", v44, v45);
        CFMutableDictionaryRef v5 = 0LL;
        goto LABEL_137;
      }

      if (dword_100010248 <= 50)
      {
        if (dword_100010248 == -1)
        {
          CFMutableDictionaryRef v12 = 0LL;
          uint64_t v13 = (unsigned int (*)(const void *, const void *))sub_1000077E0;
        }

        else
        {
          CFMutableDictionaryRef v12 = 0LL;
          uint64_t v13 = (unsigned int (*)(const void *, const void *))sub_1000077E0;
        }

        LogPrintF( &dword_100010248,  "OSStatus sender_discoverAndCopyEndpoint(APMediaSenderRef, CFTypeRef, APMediaSenderDestinationType, FigEndpointRef *)",  33554482LL,  "[%{ptr}] media sender: using endpoint ID '%@'",  v3,  v5);
        goto LABEL_47;
      }

      CFMutableDictionaryRef v12 = 0LL;
      uint64_t v13 = (unsigned int (*)(const void *, const void *))sub_1000077E0;
LABEL_47:
      if (qword_1000103D0 != -1) {
        dispatch_once(&qword_1000103D0, &stru_10000CC88);
      }
      unsigned int v28 = *(_DWORD *)(v3 + 172);
      if ((v28 & 0x80000000) != 0) {
        dispatch_time_t v29 = -1LL;
      }
      else {
        dispatch_time_t v29 = dispatch_time(0LL, 1000000000LL * v28);
      }
      while (1)
      {
        uint64_t v30 = (dispatch_semaphore_s *)qword_1000103C8;
        dispatch_time_t v31 = dispatch_time(0LL, 1000000000LL);
        if (!dispatch_semaphore_wait(v30, v31)) {
          break;
        }
        if (v29 <= dispatch_time(0LL, 0LL))
        {
          uint64_t v16 = 4294960574LL;
          uint64_t v32 = 4294960574LL;
          uint64_t v33 = 490LL;
LABEL_160:
          uint64_t v41 = 1LL;
LABEL_67:
          APSLogErrorAt(v32, "sender_startDiscovery", v33, v41);
          uint64_t v17 = v16;
          uint64_t v18 = 615LL;
LABEL_68:
          uint64_t v42 = 0LL;
          goto LABEL_69;
        }

        if (*(_BYTE *)(v3 + 181))
        {
          uint64_t v16 = 4294960573LL;
          uint64_t v32 = 4294960573LL;
          uint64_t v33 = 491LL;
          goto LABEL_160;
        }
      }

      *(void *)(v3 + 160) = qword_1000103C8;
      uint64_t v34 = ((uint64_t (*)(void))CMNotificationCenterGetDefaultLocalCenter)();
      uint64_t v35 = kFigEndpointManagerNotification_AvailableEndpointsChanged;
      uint64_t v36 = CMNotificationCenterAddListener( v34,  v3,  sub_100007A4C,  kFigEndpointManagerNotification_AvailableEndpointsChanged,  *(void *)(v3 + 32),  0LL);
      if (!v12)
      {
        uint64_t v38 = *(void *)(v3 + 32);
        v39 = *(uint64_t (**)(uint64_t, void, void))(*(void *)(CMBaseObjectGetVTable(v38) + 16) + 8LL);
        if (v39)
        {
          uint64_t v40 = v39(v38, kFigEndpointManagerDiscoveryMode_DetailedDiscovery, 0LL);
          if (!(_DWORD)v40)
          {
            if (dword_100010248 <= 50
              && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
            {
              LogPrintF( &dword_100010248,  "OSStatus sender_startDiscovery(APMediaSenderRef, CFDictionaryRef)",  33554482LL,  "[%{ptr}] media sender: started detailed discovery",  v3);
            }

            goto LABEL_89;
          }

          uint64_t v16 = v40;
        }

        else
        {
          uint64_t v16 = 4294954514LL;
        }

        uint64_t v32 = v16;
        uint64_t v33 = 510LL;
        uint64_t v41 = 0LL;
        goto LABEL_67;
      }

      uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(v36);
      CMNotificationCenterPostNotification(DefaultLocalCenter, @"CreateEndpointWithEndpointInfo", v3, v12, 0LL);
      if (dword_100010248 <= 50
        && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
      {
        LogPrintF( &dword_100010248,  "OSStatus sender_startDiscovery(APMediaSenderRef, CFDictionaryRef)",  33554482LL,  "[%{ptr}] media sender: requested to create endpoint with assisted info",  v3);
      }

LABEL_89:
      theArray[0] = 0LL;
      unsigned int v47 = *(_DWORD *)(v3 + 172);
      uint64_t v77 = v35;
      if ((v47 & 0x80000000) != 0) {
        dispatch_time_t v48 = -1LL;
      }
      else {
        dispatch_time_t v48 = dispatch_time(0LL, 1000000000LL * v47);
      }
      v46 = kCFAllocatorDefault;
      uint64_t v49 = kFigEndpointType_AirPlay;
      while (1)
      {
        if (v48 <= dispatch_time(0LL, 0LL))
        {
          uint64_t v16 = 4294960574LL;
          uint64_t v74 = 4294960574LL;
          uint64_t v75 = 547LL;
          goto LABEL_164;
        }

        if (dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v3 + 152), v48))
        {
          uint64_t v16 = 4294960574LL;
          uint64_t v74 = 4294960574LL;
          uint64_t v75 = 548LL;
          goto LABEL_164;
        }

        if (*(_BYTE *)(v3 + 181)) {
          break;
        }
        FigEndpointManagerCopyEndpointsForType(*(void *)(v3 + 32), kCFAllocatorDefault, v49, theArray);
        CFArrayRef v50 = theArray[0];
        if (theArray[0])
        {
          CFIndex Count = CFArrayGetCount(theArray[0]);
          if (Count < 1)
          {
LABEL_101:
            CFTypeRef v55 = 0LL;
          }

          else
          {
            CFIndex v52 = Count;
            CFIndex v53 = 0LL;
            while (1)
            {
              ValueAtIndedouble x = CFArrayGetValueAtIndex(theArray[0], v53);
              if (v13(ValueAtIndex, v5)) {
                break;
              }
              if (v52 == ++v53) {
                goto LABEL_101;
              }
            }

            CFTypeRef v55 = CFRetain(ValueAtIndex);
          }

          CFArrayRef v50 = theArray[0];
          if (theArray[0])
          {
            CFRelease(theArray[0]);
            theArray[0] = 0LL;
          }
        }

        else
        {
          CFTypeRef v55 = 0LL;
        }

        if (v55)
        {
          uint64_t v16 = 0LL;
          uint64_t v8 = (void *)(v3 + 40);
          *(void *)(v3 + 40) = v55;
          char v56 = 1;
          goto LABEL_108;
        }
      }

      uint64_t v16 = 4294960573LL;
      uint64_t v74 = 4294960573LL;
      uint64_t v75 = 549LL;
LABEL_164:
      CFArrayRef v50 = (CFArrayRef)APSLogErrorAt(v74, "sender_copyMatchingEndpoint", v75, 1LL);
      char v56 = 0;
      uint64_t v8 = (void *)(v3 + 40);
LABEL_108:
      uint64_t v57 = CMNotificationCenterGetDefaultLocalCenter(v50);
      CMNotificationCenterRemoveListener(v57, v3, 0LL, v77, 0LL);
      if (theArray[0]) {
        CFRelease(theArray[0]);
      }
      if ((v56 & 1) == 0)
      {
        uint64_t v17 = v16;
        uint64_t v18 = 618LL;
        goto LABEL_68;
      }

LABEL_111:
      CFMutableDictionaryRef v5 = CFDictionaryCreateMutable(v46, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v5, kAPEndpointActivationOptionKey_SkipAudioHALDeviceCreation, kCFBooleanTrue);
      uint64_t v58 = 0LL;
      if ((*(_BYTE *)(v3 + 168) & 1) != 0)
      {
        CFDictionarySetValue(v5, kAPEndpointActivationOptionKey_ForceTCPScreenMirroring, kCFBooleanTrue);
        CFDictionarySetValue(v5, kFigEndpointActivateOptionKey_PrimaryUsage, kFigEndpointPrimaryUsage_Screen);
        CFDictionarySetValue(v5, kAPEndpointActivationOptionKey_ScreenSource, *(const void **)(v3 + 48));
        v59 = *(const void **)(v3 + 104);
        if (v59) {
          CFDictionarySetValue(v5, kAPEndpointActivationOptionKey_ScreenOverrides, v59);
        }
        uint64_t v58 = 1LL;
      }

      if ((*(_BYTE *)(v3 + 168) & 2) != 0)
      {
        if (*(_DWORD *)(v3 + 72))
        {
          v58 |= 2uLL;
          if (*(_BYTE *)(v3 + 180)) {
            CFDictionarySetValue(v5, kFigEndpointActivateOptionKey_PrimaryUsage, kFigEndpointPrimaryUsage_Screen);
          }
          goto LABEL_119;
        }

        uint64_t v16 = 4294960591LL;
        uint64_t v66 = 4294960591LL;
        uint64_t v69 = 701LL;
LABEL_172:
        uint64_t v70 = 1LL;
        goto LABEL_136;
      }

LABEL_119:
      uint64_t v60 = *(void *)(v3 + 112);
      if (!v60) {
        goto LABEL_122;
      }
      uint64_t CMBaseObject = FigEndpointGetCMBaseObject(*v8);
      if (!v62)
      {
        uint64_t v16 = 4294954514LL;
LABEL_134:
        uint64_t v66 = v16;
        uint64_t v69 = 709LL;
        goto LABEL_135;
      }

      uint64_t v63 = v62(CMBaseObject, kFigEndpointProperty_Password, v60);
      if ((_DWORD)v63)
      {
        uint64_t v16 = v63;
        goto LABEL_134;
      }

LABEL_122:
      uint64_t v84 = 0LL;
      __int128 v83 = 0u;
      __int128 v82 = 0u;
      v81[0] = v3;
      v81[1] = sub_100007270;
      v81[2] = sub_1000073BC;
      uint64_t v64 = *(void *)(v3 + 40);
      v65 = *(void (**)(uint64_t, void *))(*(void *)(CMBaseObjectGetVTable(v64) + 16) + 40LL);
      if (v65) {
        v65(v64, v81);
      }
      uint64_t v66 = FigEndpointActivateSync(*v8, v58, v5, v78);
      if ((_DWORD)v66)
      {
        uint64_t v16 = v66;
        uint64_t v69 = 721LL;
      }

      else
      {
        int v67 = *(_DWORD *)(v3 + 168);
        if ((v67 & 1) == 0)
        {
LABEL_129:
          if ((v67 & 2) == 0)
          {
LABEL_132:
            uint64_t v16 = 0LL;
            *(_BYTE *)(v3 + 182) = 1;
            goto LABEL_137;
          }

          uint64_t v66 = FigEndpointCopyFirstStreamOfType(*v8, v46, kFigEndpointStreamType_Audio, &v85);
          if ((_DWORD)v66)
          {
            uint64_t v16 = v66;
            uint64_t v69 = 735LL;
          }

          else
          {
            uint64_t v66 = sub_100007E20((uint64_t)v85, v3 + 64, 0, (uint64_t *)(v3 + 56));
            if (!(_DWORD)v66) {
              goto LABEL_132;
            }
            uint64_t v16 = v66;
            uint64_t v69 = 738LL;
          }

          goto LABEL_135;
        }

        uint64_t v66 = FigEndpointCopyFirstStreamOfType(*v8, v46, kFigEndpointStreamType_Screen, &cf);
        if ((_DWORD)v66)
        {
          uint64_t v16 = v66;
          uint64_t v69 = 725LL;
        }

        else
        {
          uint64_t v68 = CMNotificationCenterGetDefaultLocalCenter(v66);
          CMNotificationCenterAddListener(v68, v3, sub_1000074B0, kFigEndpointStreamNotification_Failed, cf, 0LL);
          uint64_t v66 = FigEndpointStreamResume(cf, 0LL);
          if (!(_DWORD)v66)
          {
            int v67 = *(_DWORD *)(v3 + 168);
            goto LABEL_129;
          }

          uint64_t v16 = v66;
          uint64_t v69 = 731LL;
        }
      }

LABEL_135:
      uint64_t v70 = 0LL;
LABEL_136:
      APSLogErrorAt(v66, "sender_startInternal", v69, v70);
LABEL_137:
      sub_100007620(v3);
      if (cf) {
        CFRelease(cf);
      }
      if (v85) {
        CFRelease(v85);
      }
      if (v5) {
        CFRelease(v5);
      }
      if ((_DWORD)v16)
      {
        if (dword_100010248 <= 90
          && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554522LL)))
        {
          LogPrintF( &dword_100010248,  "OSStatus sender_startInternal(APMediaSenderRef, CFTypeRef, APMediaSenderDestinationType)",  33554522LL,  "### [%{ptr}] APMediaSenderStart failed, error: %#m\n",  v3,  v16);
        }

        sub_100006D04(v3, 0);
        APSLogErrorAt(v16, "APMediaSenderStart_block_invoke", 771LL, 0LL);
      }

      else if (dword_100010248 <= 50 {
             && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
      }
      {
        LogPrintF( &dword_100010248,  "void APMediaSenderStart(APMediaSenderRef, CFTypeRef, APMediaSenderDestinationType, uint32_t, int, void (^)(OSS tatus))_block_invoke",  33554482LL,  "[%{ptr}] media sender started",  *(void *)(a1 + 40));
      }

      *(_DWORD *)(*(void *)(a1 + 40) + 176LL) = v16;
      v71 = *(const void **)(a1 + 48);
      if (v71) {
        CFRelease(v71);
      }
      uint64_t v72 = *(void *)(a1 + 32);
      if (v72)
      {
        v73 = *(dispatch_queue_s **)(*(void *)(a1 + 40) + 24LL);
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000LL;
        block[2] = sub_100006BE4;
        block[3] = &unk_10000CB60;
        block[4] = v72;
        int v80 = v16;
        dispatch_async(v73, block);
      }

      return;
    case 3:
      CFTypeID v14 = CFGetTypeID(v5);
      if (v14 == CFDictionaryGetTypeID())
      {
        if (dword_100010248 > 50)
        {
          uint64_t v13 = (unsigned int (*)(const void *, const void *))sub_1000078AC;
        }

        else
        {
          if (dword_100010248 != -1)
          {
            uint64_t v13 = (unsigned int (*)(const void *, const void *))sub_1000078AC;
            CFMutableDictionaryRef v12 = v5;
            LogPrintF( &dword_100010248,  "OSStatus sender_discoverAndCopyEndpoint(APMediaSenderRef, CFTypeRef, APMediaSenderDestinationType, FigEndpointRef *)",  33554482LL,  "[%{ptr}] media sender: using assisted discovery info: %@",  v3,  v5);
            goto LABEL_47;
          }

          uint64_t v13 = (unsigned int (*)(const void *, const void *))sub_1000078AC;
          if (_LogCategory_Initialize(&dword_100010248, 33554482LL))
          {
            CFMutableDictionaryRef v12 = v5;
            LogPrintF( &dword_100010248,  "OSStatus sender_discoverAndCopyEndpoint(APMediaSenderRef, CFTypeRef, APMediaSenderDestinationType, FigEndpointRef *)",  33554482LL,  "[%{ptr}] media sender: using assisted discovery info: %@",  v3,  v5);
            goto LABEL_47;
          }
        }

        CFMutableDictionaryRef v12 = v5;
        goto LABEL_47;
      }

      uint64_t v16 = 4294960591LL;
      uint64_t v17 = 4294960591LL;
      uint64_t v18 = 603LL;
      goto LABEL_181;
    default:
      uint64_t v16 = 4294960591LL;
      uint64_t v17 = 4294960591LL;
      uint64_t v18 = 610LL;
      goto LABEL_68;
  }

uint64_t sub_100006BE4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned int *)(a1 + 40));
}

void sub_100006BF8(uint64_t a1)
{
  if (dword_100010248 <= 50
    && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
  {
    LogPrintF( &dword_100010248,  "void APMediaSenderStop(APMediaSenderRef)",  33554482LL,  "[%{ptr}] stopping media sender",  a1);
  }

  *(_BYTE *)(a1 + 181) = 1;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 152));
  FigSimpleMutexLock(*(void *)(a1 + 136));
  int v2 = *(dispatch_semaphore_s **)(a1 + 144);
  if (v2)
  {
    if (*(void *)(a1 + 112))
    {
      CFRelease(*(CFTypeRef *)(a1 + 112));
      *(void *)(a1 + 112) = 0LL;
      int v2 = *(dispatch_semaphore_s **)(a1 + 144);
    }

    dispatch_semaphore_signal(v2);
  }

  FigSimpleMutexUnlock(*(void *)(a1 + 136));
  uint64_t v3 = *(dispatch_queue_s **)(a1 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100006CF8;
  block[3] = &unk_10000CBA8;
  block[4] = a1;
  dispatch_sync(v3, block);
}

void sub_100006CF8(uint64_t a1)
{
}

void sub_100006D04(uint64_t a1, int a2)
{
  uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener(DefaultLocalCenter, a1, 0LL, 0LL, 0LL);
  sub_100007620(a1);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    FigEndpointDeactivate(v5, 0LL);
    int v6 = *(const void **)(a1 + 40);
    if (v6)
    {
      CFRelease(v6);
      *(void *)(a1 + 40) = 0LL;
    }
  }

  int v7 = *(const void **)(a1 + 56);
  if (v7)
  {
    CFRelease(v7);
    *(void *)(a1 + 56) = 0LL;
  }

  if (a2)
  {
    *(_WORD *)(a1 + 181) = 0;
    *(_DWORD *)(a1 + 176) = 0;
  }

uint64_t sub_100006D80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  int v10 = 0;
  uint64_t v3 = *(dispatch_queue_s **)(a1 + 16);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 0x40000000LL;
  v6[2] = sub_100006E14;
  v6[3] = &unk_10000CBD0;
  v6[4] = &v7;
  v6[5] = a1;
  v6[6] = a2;
  void v6[7] = a3;
  dispatch_sync(v3, v6);
  uint64_t v4 = *((unsigned int *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t sub_100006E14(void *a1)
{
  uint64_t v2 = a1[5];
  if (!*(_BYTE *)(v2 + 182))
  {
    *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL) = -6709;
    uint64_t result = *(unsigned int *)(*(void *)(a1[4] + 8LL) + 24LL);
    uint64_t v5 = 812LL;
LABEL_9:
    uint64_t v6 = 1LL;
    return APSLogErrorAt(result, "APMediaSenderSubmitPixelBuffer_block_invoke", v5, v6);
  }

  if ((*(_BYTE *)(v2 + 168) & 1) == 0)
  {
    *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL) = -6705;
    uint64_t result = *(unsigned int *)(*(void *)(a1[4] + 8LL) + 24LL);
    uint64_t v5 = 813LL;
    goto LABEL_9;
  }

  int v3 = *(_DWORD *)(v2 + 176);
  if (v3)
  {
    *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL) = v3;
    uint64_t result = *(unsigned int *)(*(void *)(a1[4] + 8LL) + 24LL);
    uint64_t v5 = 814LL;
    goto LABEL_9;
  }

  *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL) = sub_100002468(*(void *)(v2 + 48), a1[6], a1[7]);
  uint64_t result = *(unsigned int *)(*(void *)(a1[4] + 8LL) + 24LL);
  if ((_DWORD)result)
  {
    uint64_t v5 = 817LL;
    uint64_t v6 = 0LL;
    return APSLogErrorAt(result, "APMediaSenderSubmitPixelBuffer_block_invoke", v5, v6);
  }

  return result;
}

uint64_t sub_100006F14(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  int v9 = 0;
  uint64_t v2 = *(dispatch_queue_s **)(a1 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100006FA8;
  block[3] = &unk_10000CBF8;
  block[4] = &v6;
  void block[5] = a1;
  void block[6] = a2;
  dispatch_sync(v2, block);
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t sub_100006FA8(void *a1)
{
  uint64_t v2 = a1[5];
  if (!*(_BYTE *)(v2 + 182))
  {
    *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL) = -6709;
    uint64_t result = *(unsigned int *)(*(void *)(a1[4] + 8LL) + 24LL);
    uint64_t v6 = 831LL;
LABEL_9:
    uint64_t v7 = 1LL;
    return APSLogErrorAt(result, "APMediaSenderEnqueueAudioData_block_invoke", v6, v7);
  }

  uint64_t v3 = *(void *)(v2 + 56);
  if (!v3)
  {
    *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL) = -6705;
    uint64_t result = *(unsigned int *)(*(void *)(a1[4] + 8LL) + 24LL);
    uint64_t v6 = 832LL;
    goto LABEL_9;
  }

  int v4 = *(_DWORD *)(v2 + 176);
  if (v4)
  {
    *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL) = v4;
    uint64_t result = *(unsigned int *)(*(void *)(a1[4] + 8LL) + 24LL);
    uint64_t v6 = 833LL;
    goto LABEL_9;
  }

  *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL) = sub_1000081A8(v3, a1[6]);
  uint64_t result = *(unsigned int *)(*(void *)(a1[4] + 8LL) + 24LL);
  if ((_DWORD)result)
  {
    uint64_t v6 = 836LL;
    uint64_t v7 = 0LL;
    return APSLogErrorAt(result, "APMediaSenderEnqueueAudioData_block_invoke", v6, v7);
  }

  return result;
}

uint64_t sub_1000070A4(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, char a5)
{
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  int v15 = 0;
  uint64_t v5 = *(dispatch_queue_s **)(a1 + 16);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000LL;
  v8[2] = sub_10000714C;
  v8[3] = &unk_10000CC20;
  v8[4] = &v12;
  v8[5] = a1;
  __int128 v9 = *a3;
  uint64_t v10 = *((void *)a3 + 2);
  v8[6] = a2;
  v8[7] = a4;
  char v11 = a5;
  dispatch_sync(v5, v8);
  uint64_t v6 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v6;
}

uint64_t sub_10000714C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (!*(_BYTE *)(v2 + 182))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = -6709;
    uint64_t v9 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    uint64_t v10 = 850LL;
    return APSLogErrorAt(v9, "APMediaSenderEnqueueAudioDataWithTimestamps_block_invoke", v10, 1LL);
  }

  uint64_t v3 = *(void *)(v2 + 56);
  if (!v3)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = -6705;
    uint64_t v9 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    uint64_t v10 = 851LL;
    return APSLogErrorAt(v9, "APMediaSenderEnqueueAudioDataWithTimestamps_block_invoke", v10, 1LL);
  }

  int v4 = *(_DWORD *)(v2 + 176);
  if (v4)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v4;
    uint64_t v9 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    uint64_t v10 = 852LL;
    return APSLogErrorAt(v9, "APMediaSenderEnqueueAudioDataWithTimestamps_block_invoke", v10, 1LL);
  }

  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  char v7 = *(_BYTE *)(a1 + 88);
  __int128 v11 = *(_OWORD *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 80);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = sub_100008600(v3, v5, &v11, v6, v7);
  uint64_t result = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if ((_DWORD)result) {
    return APSLogErrorAt(result, "APMediaSenderEnqueueAudioDataWithTimestamps_block_invoke", 855LL, 0LL);
  }
  return result;
}

void sub_100007270( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, CFTypeRef, uint64_t, uint64_t), uint64_t a7)
{
  if (!*(void *)(a4 + 120))
  {
    CFTypeRef v15 = 0LL;
    if (!a6) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }

  FigSimpleMutexLock(*(void *)(a4 + 136));
  *(void *)(a4 + 144) = dispatch_semaphore_create(0LL);
  __int128 v11 = *(const void **)(a4 + 112);
  if (v11)
  {
    CFRelease(v11);
    *(void *)(a4 + 112) = 0LL;
  }

  FigSimpleMutexUnlock(*(void *)(a4 + 136));
  (*(void (**)(void))(*(void *)(a4 + 120) + 16LL))();
  uint64_t v12 = *(dispatch_semaphore_s **)(a4 + 144);
  unsigned int v13 = *(_DWORD *)(a4 + 172);
  if ((v13 & 0x80000000) != 0) {
    dispatch_time_t v14 = -1LL;
  }
  else {
    dispatch_time_t v14 = dispatch_time(0LL, 1000000000LL * v13);
  }
  dispatch_semaphore_wait(v12, v14);
  FigSimpleMutexLock(*(void *)(a4 + 136));
  uint64_t v16 = *(dispatch_object_s **)(a4 + 144);
  if (v16)
  {
    dispatch_release(v16);
    *(void *)(a4 + 144) = 0LL;
  }

  uint64_t v17 = *(const void **)(a4 + 112);
  if (v17) {
    CFTypeRef v15 = CFRetain(v17);
  }
  else {
    CFTypeRef v15 = 0LL;
  }
  FigSimpleMutexUnlock(*(void *)(a4 + 136));
  if (a6)
  {
LABEL_15:
    if (v15) {
      uint64_t v18 = 0LL;
    }
    else {
      uint64_t v18 = 4294950568LL;
    }
    a6(a1, v15, v18, a7);
  }

LABEL_19:
  if (v15) {
    CFRelease(v15);
  }
}

void sub_1000073BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int Int64 = CFDictionaryGetInt64(a3, kFigEndpointKey_Status, 0LL);
  if (dword_100010248 <= 100
    && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554532LL)))
  {
    LogPrintF( &dword_100010248,  "void sender_handleEndpointFailure(FigEndpointRef, uint64_t, CFDictionaryRef, CFTypeRef)",  33554532LL,  "### [%{ptr}] media sender: endpoint failure: %@",  a4,  a3);
  }

  if (Int64) {
    int v7 = Int64;
  }
  else {
    int v7 = -6762;
  }
  uint64_t v8 = *(dispatch_queue_s **)(a4 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100007A54;
  block[3] = &unk_10000CCD0;
  block[4] = a4;
  int v10 = v7;
  dispatch_sync(v8, block);
}

void sub_1000074B0(int a1, const void *a2, int a3, int a4, const __CFDictionary *cf)
{
  Mutable = cf;
  if (!cf) {
    goto LABEL_5;
  }
  CFTypeID v7 = CFGetTypeID(cf);
  if (v7 != CFDictionaryGetTypeID())
  {
    Mutable = 0LL;
LABEL_5:
    Value = 0LL;
    uint64_t Int64 = 0LL;
    goto LABEL_6;
  }

  uint64_t Int64 = CFDictionaryGetInt64(Mutable, kFigEndpointStreamNotificationKey_Status, 0LL);
  Value = (const __CFString *)CFDictionaryGetValue(Mutable, kFigEndpointStreamNotificationKey_Reason);
  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  FigCFDictionarySetInt32(Mutable, @"APMediaSender_Status", Int64);
LABEL_6:
  if (dword_100010248 <= 90
    && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554522LL)))
  {
    int v10 = &stru_10000CEB0;
    if (Value) {
      int v10 = Value;
    }
    LogPrintF( &dword_100010248,  "void sender_handleEndpointStreamFailure(CMNotificationCenterRef, const void *, CFStringRef, const void *, CFTypeRef)",  33554522LL,  "### [%{ptr}] APMediaSender got endpoint stream failure, error: %#m (%@)\n",  a2,  Int64,  v10);
  }

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, @"APMediaSender_VideoStreamFailed", a2, Mutable, 1u);
  if (Mutable) {
    CFRelease(Mutable);
  }
}

uint64_t sub_100007620(uint64_t result)
{
  uint64_t v1 = *(dispatch_semaphore_s **)(result + 160);
  if (v1)
  {
    uint64_t v2 = result;
    uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener( DefaultLocalCenter,  v2,  0LL,  kFigEndpointManagerNotification_AvailableEndpointsChanged,  0LL);
    uint64_t v4 = *(void *)(v2 + 32);
    uint64_t v5 = *(void (**)(uint64_t, void, void))(*(void *)(CMBaseObjectGetVTable(v4) + 16) + 8LL);
    if (v5) {
      v5(v4, kFigEndpointManagerDiscoveryMode_None, 0LL);
    }
    if (dword_100010248 <= 50
      && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
    {
      LogPrintF( &dword_100010248,  "void sender_stopDiscovery(APMediaSenderRef)",  33554482LL,  "[%{ptr}] media sender: stopped detailed discovery",  v2);
    }

    *(void *)(v2 + 160) = 0LL;
    return dispatch_semaphore_signal(v1);
  }

  return result;
}

uint64_t sub_10000771C(const void *a1, const void *a2)
{
  CFTypeRef cf1 = 0LL;
  CFAllocatorRef v4 = CFGetAllocator(a1);
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject(a1);
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, CFAllocatorRef, CFTypeRef *))(*(void *)(CMBaseObjectGetVTable(CMBaseObject)
                                                                                          + 8)
                                                                              + 48LL);
  if (!v6)
  {
    uint64_t v7 = 4294954514LL;
    goto LABEL_6;
  }

  uint64_t v7 = v6(CMBaseObject, kFigEndpointProperty_Name, v4, &cf1);
  if ((_DWORD)v7)
  {
LABEL_6:
    APSLogErrorAt(v7, "endpointMatchByName", 77LL, 0LL);
    uint64_t v8 = 0LL;
    goto LABEL_7;
  }

  if (!cf1) {
    return 0LL;
  }
  uint64_t v8 = CFEqual(cf1, a2);
LABEL_7:
  if (cf1) {
    CFRelease(cf1);
  }
  return v8;
}

BOOL sub_1000077E0(const void *a1, const __CFString *a2)
{
  CFStringRef theString1 = 0LL;
  CFAllocatorRef v4 = CFGetAllocator(a1);
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject(a1);
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, CFAllocatorRef, CFStringRef *))(*(void *)(CMBaseObjectGetVTable(CMBaseObject)
                                                                                            + 8)
                                                                                + 48LL);
  if (!v6)
  {
    uint64_t v7 = 4294954514LL;
    goto LABEL_6;
  }

  uint64_t v7 = v6(CMBaseObject, kFigEndpointProperty_ID, v4, &theString1);
  if ((_DWORD)v7)
  {
LABEL_6:
    APSLogErrorAt(v7, "endpointMatchByID", 94LL, 0LL);
    BOOL v8 = 0LL;
    goto LABEL_7;
  }

  if (!theString1) {
    return 0LL;
  }
  BOOL v8 = CFStringCompare(theString1, a2, 1uLL) == kCFCompareEqualTo;
LABEL_7:
  if (theString1) {
    CFRelease(theString1);
  }
  return v8;
}

BOOL sub_1000078AC(const void *a1)
{
  CFTypeRef cf = 0LL;
  CFAllocatorRef v2 = CFGetAllocator(a1);
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject(a1);
  CFAllocatorRef v4 = *(uint64_t (**)(uint64_t, void, CFAllocatorRef, CFTypeRef *))(*(void *)(CMBaseObjectGetVTable(CMBaseObject)
                                                                                          + 8)
                                                                              + 48LL);
  if (!v4)
  {
    uint64_t v5 = 4294954514LL;
LABEL_7:
    APSLogErrorAt(v5, "endpointMatchAssisted", 111LL, 0LL);
    BOOL v7 = 0LL;
    CFTypeRef v6 = cf;
    if (!cf) {
      return v7;
    }
    goto LABEL_4;
  }

  uint64_t v5 = v4(CMBaseObject, kFigEndpointProperty_AutoconnectEnabled, v2, &cf);
  if ((_DWORD)v5) {
    goto LABEL_7;
  }
  CFTypeRef v6 = cf;
  BOOL v7 = cf == kCFBooleanTrue;
  if (cf) {
LABEL_4:
  }
    CFRelease(v6);
  return v7;
}

uint64_t sub_100007964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = APAdvertiserInfoSetProperty(*(void *)(a1 + 40), 0LL, a2, 0LL, a3);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  uint64_t v6 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if ((_DWORD)v6 && dword_100010248 <= 90)
  {
    if (dword_100010248 != -1) {
      return LogPrintF( &dword_100010248,  "OSStatus createEndpointForNetworkAddress(CFStringRef, FigEndpointRef *)_block_invoke",  33554522LL,  "### APAdvertiserInfoSetProperty failed for key %@, error: %#m\n",  a2,  v6);
    }
    uint64_t result = _LogCategory_Initialize(&dword_100010248, 33554522LL);
    if ((_DWORD)result)
    {
      uint64_t v6 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
      return LogPrintF( &dword_100010248,  "OSStatus createEndpointForNetworkAddress(CFStringRef, FigEndpointRef *)_block_invoke",  33554522LL,  "### APAdvertiserInfoSetProperty failed for key %@, error: %#m\n",  a2,  v6);
    }
  }

  return result;
}

void sub_100007A2C(id a1)
{
  qword_1000103C8 = (uint64_t)dispatch_semaphore_create(1LL);
}

uint64_t sub_100007A4C(uint64_t a1, uint64_t a2)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a2 + 152));
}

void sub_100007A54(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 128);
  if (*(_DWORD *)(v2 + 176)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3 == 0;
  }
  if (!v4)
  {
    uint64_t v5 = *(dispatch_queue_s **)(v2 + 24);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 0x40000000LL;
    v6[2] = sub_100007AE0;
    v6[3] = &unk_10000CCB0;
    v6[4] = v3;
    int v7 = *(_DWORD *)(a1 + 40);
    dispatch_async(v5, v6);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  *(_DWORD *)(v2 + 176) = *(_DWORD *)(a1 + 40);
}

uint64_t sub_100007AE0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned int *)(a1 + 40));
}

int main(int argc, const char **argv, const char **envp)
{
}

size_t sub_100007B0C()
{
  size_t result = confstr(65537, v2, 0x400uLL);
  if (result)
  {
    if (dword_100010248 <= 50)
    {
      if (dword_100010248 != -1) {
        return LogPrintF( &dword_100010248,  "void serviceSetupTempDirectory(void)",  33554482LL,  "XPC service: will use temp directory '%s'");
      }
      size_t result = _LogCategory_Initialize(&dword_100010248, 33554482LL);
      if ((_DWORD)result) {
        return LogPrintF( &dword_100010248,  "void serviceSetupTempDirectory(void)",  33554482LL,  "XPC service: will use temp directory '%s'");
      }
    }
  }

  else if (dword_100010248 <= 90)
  {
    if (dword_100010248 != -1 || (size_t result = _LogCategory_Initialize(&dword_100010248, 33554522LL), (_DWORD)result))
    {
      uint64_t v1 = __error();
      strerror(*v1);
      return LogPrintF( &dword_100010248,  "void serviceSetupTempDirectory(void)",  33554522LL,  "XPC service: failed to initialize temp directory: %s");
    }
  }

  return result;
}

void sub_100007C44(_xpc_connection_s *a1)
{
  if (qword_1000103D8)
  {
    int v4 = -6709;
    uint64_t v2 = 4294960587LL;
    uint64_t v5 = 35LL;
    uint64_t v6 = 1LL;
  }

  else
  {
    uint64_t v2 = FigXPCServerStartWithClientXPCConnection(a1, off_1000102B8, &unk_10000CCF0, 0LL, &qword_1000103D8);
    if (!(_DWORD)v2)
    {
      if (dword_100010248 <= 50
        && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
      {
        pid_t pid = xpc_connection_get_pid(a1);
        LogPrintF( &dword_100010248,  "void serviceConnectionHandler(xpc_connection_t)",  33554482LL,  "XPC service: will handle XPC connection from client [%d]",  pid);
      }

      return;
    }

    int v4 = v2;
    uint64_t v5 = 38LL;
    uint64_t v6 = 0LL;
  }

  APSLogErrorAt(v2, "serviceConnectionHandler", v5, v6);
  if (dword_100010248 <= 100
    && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554532LL)))
  {
    LogPrintF( &dword_100010248,  "void serviceConnectionHandler(xpc_connection_t)",  33554532LL,  "XPC service: connection setup failed, error: %d",  v4);
  }

  xpc_connection_cancel(a1);
}

uint64_t sub_100007DB0()
{
  return 1LL;
}

uint64_t sub_100007DB8()
{
  if (qword_1000103E0 != -1) {
    dispatch_once_f(&qword_1000103E0, 0LL, (dispatch_function_t)sub_100007DFC);
  }
  return qword_1000103E8;
}

uint64_t sub_100007DFC()
{
  uint64_t result = _CFRuntimeRegisterClass(&unk_10000CD70);
  qword_1000103E8 = result;
  return result;
}

uint64_t sub_100007E20(uint64_t a1, uint64_t a2, int a3, uint64_t *a4)
{
  if (qword_1000103E0 != -1) {
    dispatch_once_f(&qword_1000103E0, 0LL, (dispatch_function_t)sub_100007DFC);
  }
  uint64_t Instance = _CFRuntimeCreateInstance(0LL, qword_1000103E8, 144LL, 0LL);
  if (!Instance)
  {
    APSLogErrorAt(0LL, "AudioSBufSourceCreate", 205LL, 0LL);
    return 4294960568LL;
  }

  uint64_t v9 = Instance;
  *(_OWORD *)(Instance + 128) = 0u;
  *(_OWORD *)(Instance + 144) = 0u;
  *(_OWORD *)(Instance + 96) = 0u;
  *(_OWORD *)(Instance + 112) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_OWORD *)(Instance + 16) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  int v10 = (AudioStreamBasicDescription *)(Instance + 32);
  *(void *)(Instance + 24) = CFStringCreateF(0LL, "[%{ptr}]", Instance);
  SNPrintF(label, 64LL, "APMediaSenderAudioSBufSourceQueue.%{ptr}", v9);
  *(void *)(v9 + 16) = dispatch_queue_create(label, 0LL);
  SNPrintF(label, 64LL, "APMediaSenderAudioSBufSourceResumeQueue.%{ptr}", v9);
  dispatch_queue_t v11 = dispatch_queue_create(label, 0LL);
  *(_OWORD *)(v9 + 112) = *(_OWORD *)&kCMTimeZero.value;
  *(void *)(v9 + 128) = kCMTimeZero.epoch;
  *(void *)(v9 + 136) = v11;
  uint64_t v12 = *(void *)(a2 + 32);
  __int128 v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v10->mSampleRate = *(_OWORD *)a2;
  *(_OWORD *)(v9 + 48) = v13;
  *(void *)(v9 + 64) = v12;
  *(void *)(v9 + 80) = FigCFWeakReferenceHolderCreateWithReferencedObject(a1);
  if (a3 <= 0) {
    int v14 = 5;
  }
  else {
    int v14 = a3;
  }
  *(_DWORD *)(v9 + 148) = v14;
  uint64_t v15 = CMAudioFormatDescriptionCreate( kCFAllocatorDefault,  v10,  0LL,  0LL,  0LL,  0LL,  0LL,  (CMAudioFormatDescriptionRef *)(v9 + 72));
  if ((_DWORD)v15)
  {
    uint64_t v19 = v15;
    uint64_t v20 = 219LL;
    goto LABEL_17;
  }

  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject(a1);
  uint64_t v17 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, uint64_t))(*(void *)(CMBaseObjectGetVTable(CMBaseObject)
                                                                                             + 8)
                                                                                 + 48LL);
  if (!v17)
  {
    uint64_t v19 = 4294954514LL;
LABEL_16:
    uint64_t v15 = v19;
    uint64_t v20 = 222LL;
LABEL_17:
    APSLogErrorAt(v15, "AudioSBufSourceCreate", v20, 0LL);
    CFRelease((CFTypeRef)v9);
    return v19;
  }

  uint64_t v18 = v17(CMBaseObject, kFigEndpointStreamProperty_AudioEngineClone, kCFAllocatorDefault, v9 + 88);
  if ((_DWORD)v18)
  {
    uint64_t v19 = v18;
    goto LABEL_16;
  }

  uint64_t v15 = FigEndpointAudioSourceBufferQueueCreate(kCFAllocatorDefault, v10, 0LL, v9 + 96);
  if ((_DWORD)v15)
  {
    uint64_t v19 = v15;
    uint64_t v20 = 225LL;
    goto LABEL_17;
  }

  uint64_t v15 = sub_100008140( *(void *)(v9 + 96),  kFigEndpointAudioSourceBufferQueueProperty_BufferQueue,  (uint64_t)kCFAllocatorDefault,  v9 + 104);
  if ((_DWORD)v15)
  {
    uint64_t v19 = v15;
    uint64_t v20 = 228LL;
    goto LABEL_17;
  }

  if (dword_100010248 <= 50
    && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
  {
    LogPrintF( &dword_100010248,  "OSStatus AudioSBufSourceCreate(FigEndpointStreamRef, AudioStreamBasicDescription *, int, AudioSBufSourceRef *)",  33554482LL,  "%@ created media sender audio source for [%{asbd}]",  *(void *)(v9 + 24),  v10);
  }

  uint64_t v19 = 0LL;
  *a4 = v9;
  return v19;
}

uint64_t sub_100008140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t CMBaseObject = FigEndpointAudioSourceGetCMBaseObject();
  if (v8) {
    return v8(CMBaseObject, a2, a3, a4);
  }
  else {
    return 4294954514LL;
  }
}

uint64_t sub_1000081A8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0LL;
  int v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  int v9 = 0;
  uint64_t v2 = *(dispatch_queue_s **)(a1 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10000823C;
  block[3] = &unk_10000CD28;
  void block[5] = a2;
  void block[6] = a1;
  block[4] = &v6;
  dispatch_sync(v2, block);
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t sub_10000823C(uint64_t a1)
{
  CFIndex Length = CFDataGetLength(*(CFDataRef *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 48);
  CMTimeMake(&rhs, Length / *(unsigned int *)(v3 + 48), (int)*(double *)(v3 + 32));
  CMTime lhs = *(CMTime *)(v3 + 112);
  CMTimeAdd(&v11, &lhs, &rhs);
  *(CMTime *)(v3 + 112) = v11;
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v11, HostTimeClock);
  uint64_t v6 = *(const __CFData **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  CMTime lhs = v11;
  CMTime v8 = *(CMTime *)(v5 + 112);
  uint64_t result = sub_1000082FC(v5, v6, (__int128 *)&lhs.value, &v8);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_1000082FC(uint64_t a1, CFDataRef theData, __int128 *a3, CMTime *a4)
{
  if (*(_DWORD *)(a1 + 40) != 1819304813)
  {
    uint64_t v6 = 4294960591LL;
    uint64_t v20 = 4294960591LL;
    uint64_t v21 = 152LL;
    uint64_t v22 = 1LL;
LABEL_23:
    APSLogErrorAt(v20, "ausrc_enqueueAudioDataInternal", v21, v22);
    return v6;
  }

  if (!theData)
  {
    if (!*(_BYTE *)(a1 + 152)) {
      return 0LL;
    }
    *(_BYTE *)(a1 + 152) = 0;
    *(_OWORD *)(a1 + 112) = *(_OWORD *)&kCMTimeZero.value;
    *(void *)(a1 + 128) = kCMTimeZero.epoch;
    uint64_t v17 = *(dispatch_queue_s **)(a1 + 136);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 0x40000000LL;
    v26[2] = sub_100008AAC;
    v26[3] = &unk_10000CDF0;
    v26[4] = a1;
    dispatch_sync(v17, v26);
    CMBufferQueueReset(*(CMBufferQueueRef *)(a1 + 104));
    uint64_t v6 = 0LL;
    uint64_t v18 = atomic_load((unsigned int *)(a1 + 144));
    if ((_DWORD)v18)
    {
      APSLogErrorAt(v18, "ausrc_enqueueAudioDataInternal", 189LL, 0LL);
      return v18;
    }

    return v6;
  }

  uint64_t v6 = atomic_load((unsigned int *)(a1 + 144));
  if ((_DWORD)v6)
  {
    uint64_t v20 = v6;
    uint64_t v21 = 156LL;
    uint64_t v22 = 0LL;
    goto LABEL_23;
  }

  CMTime v30 = *a4;
  uint64_t v32 = 0LL;
  CMSampleBufferRef sampleBufferOut = 0LL;
  unint64_t Length = CFDataGetLength(theData);
  unint64_t v9 = *(unsigned int *)(a1 + 48);
  CMItemCount v10 = Length / v9;
  if (Length % v9)
  {
    uint64_t v6 = 4294960591LL;
    uint64_t v11 = 4294960591LL;
    uint64_t v23 = 128LL;
    uint64_t v24 = 1LL;
LABEL_26:
    APSLogErrorAt(v11, "ausrc_createAudioSampleBuffer", v23, v24);
    goto LABEL_29;
  }

  uint64_t v11 = FigCreateBlockBufferWithCFDataNoCopy(kCFAllocatorDefault, theData, 0LL, Length, &v32);
  if ((_DWORD)v11)
  {
    uint64_t v6 = v11;
    uint64_t v23 = 131LL;
    uint64_t v24 = 0LL;
    goto LABEL_26;
  }

  uint64_t v12 = *(const opaqueCMFormatDescription **)(a1 + 72);
  CMTime presentationTimeStamp = v30;
  uint64_t v13 = CMAudioSampleBufferCreateReadyWithPacketDescriptions( kCFAllocatorDefault,  v32,  v12,  v10,  &presentationTimeStamp,  0LL,  &sampleBufferOut);
  uint64_t v6 = v13;
  if (!(_DWORD)v13)
  {
    CMSampleBufferRef v14 = sampleBufferOut;
    CMSampleBufferRef sampleBufferOut = 0LL;
    goto LABEL_8;
  }

  APSLogErrorAt(v13, "ausrc_createAudioSampleBuffer", 135LL, 0LL);
  if (sampleBufferOut) {
    CFRelease(sampleBufferOut);
  }
LABEL_29:
  CMSampleBufferRef v14 = 0LL;
LABEL_8:
  if (v32) {
    CFRelease(v32);
  }
  if ((_DWORD)v6)
  {
    uint64_t v15 = v6;
    uint64_t v25 = 163LL;
    goto LABEL_32;
  }

  uint64_t v15 = CMBufferQueueEnqueue(*(CMBufferQueueRef *)(a1 + 104), v14);
  if ((_DWORD)v15)
  {
    uint64_t v6 = v15;
    uint64_t v25 = 166LL;
LABEL_32:
    APSLogErrorAt(v15, "ausrc_enqueueAudioDataInternal", v25, 0LL);
    if (!v14) {
      return v6;
    }
    goto LABEL_15;
  }

  if (!*(_BYTE *)(a1 + 152))
  {
    *(_BYTE *)(a1 + 152) = 1;
    CFRetain((CFTypeRef)a1);
    uint64_t v16 = *(dispatch_queue_s **)(a1 + 136);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_1000087CC;
    block[3] = &unk_10000CDD0;
    block[4] = a1;
    __int128 v28 = *a3;
    uint64_t v29 = *((void *)a3 + 2);
    dispatch_async(v16, block);
  }

  uint64_t v6 = 0LL;
  if (v14) {
LABEL_15:
  }
    CFRelease(v14);
  return v6;
}

uint64_t sub_100008600(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, char a5)
{
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  int v15 = 0;
  uint64_t v5 = *(dispatch_queue_s **)(a1 + 16);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000LL;
  v8[2] = sub_1000086A8;
  v8[3] = &unk_10000CD50;
  v8[4] = &v12;
  v8[5] = a1;
  v8[6] = a4;
  v8[7] = a2;
  __int128 v9 = *a3;
  uint64_t v10 = *((void *)a3 + 2);
  char v11 = a5;
  dispatch_sync(v5, v8);
  uint64_t v6 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v6;
}

uint64_t sub_1000086A8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  CMTimeMake(&v7, *(void *)(a1 + 48), (int)*(double *)(v2 + 32));
  *(CMTime *)(v2 + 112) = v7;
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = *(const __CFData **)(a1 + 56);
  CMTime v7 = *(CMTime *)(a1 + 64);
  CMTime v6 = *(CMTime *)(v3 + 112);
  uint64_t result = sub_1000082FC(v3, v4, (__int128 *)&v7.value, &v6);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

void sub_100008730(void *a1)
{
  uint64_t v2 = (const void *)a1[3];
  if (v2)
  {
    CFRelease(v2);
    a1[3] = 0LL;
  }

  uint64_t v3 = (const void *)a1[9];
  if (v3)
  {
    CFRelease(v3);
    a1[9] = 0LL;
  }

  int v4 = (const void *)a1[10];
  if (v4)
  {
    CFRelease(v4);
    a1[10] = 0LL;
  }

  uint64_t v5 = (const void *)a1[11];
  if (v5)
  {
    CFRelease(v5);
    a1[11] = 0LL;
  }

  CMTime v6 = (const void *)a1[12];
  if (v6)
  {
    CFRelease(v6);
    a1[12] = 0LL;
  }

  CMTime v7 = (const void *)a1[13];
  if (v7)
  {
    CFRelease(v7);
    a1[13] = 0LL;
  }

  CMTime v8 = (dispatch_object_s *)a1[17];
  if (v8)
  {
    dispatch_release(v8);
    a1[17] = 0LL;
  }

  __int128 v9 = (dispatch_object_s *)a1[2];
  if (v9)
  {
    dispatch_release(v9);
    a1[2] = 0LL;
  }

void sub_1000087CC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  *(_OWORD *)&v12.uint64_t value = *(_OWORD *)(a1 + 40);
  v12.epoch = *(void *)(a1 + 56);
  uint64_t v3 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject(*(void *)(v2 + 80));
  if (dword_100010248 <= 50
    && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
  {
    LogPrintF( &dword_100010248,  "void ausrc_resume(AudioSBufSourceRef, CMTime)",  33554482LL,  "%@ audio source: resuming",  *(void *)(v2 + 24));
  }

  if (!v3)
  {
    LODWORD(v10) = -6709;
    APSLogErrorAt(4294960587LL, "ausrc_resume", 75LL, 1LL);
    goto LABEL_22;
  }

  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(Mutable, kFigEndpointStreamAudioEngineResumeOption_AudioSource, *(const void **)(v2 + 96));
  CMTime time = v12;
  uint64_t v5 = FigCFDictionarySetCMTime(Mutable, kAPAudioEngineResumeOption_AudioDeviceHostAnchorTime, &time);
  if ((_DWORD)v5)
  {
    LODWORD(v10) = v5;
    uint64_t v11 = 81LL;
LABEL_27:
    APSLogErrorAt(v5, "ausrc_resume", v11, 0LL);
    CFDictionaryRef v6 = 0LL;
    goto LABEL_18;
  }

  uint64_t v5 = FigEndpointStreamAudioEngineResumeSync( *(void *)(v2 + 88),  Mutable,  (1000 * *(_DWORD *)(v2 + 148)));
  if ((_DWORD)v5)
  {
    LODWORD(v10) = v5;
    uint64_t v11 = 84LL;
    goto LABEL_27;
  }

  uint64_t v5 = FigEndpointStreamAudioEngineSetEndpointStreamSync( *(void *)(v2 + 88),  v3,  (1000 * *(_DWORD *)(v2 + 148)));
  if ((_DWORD)v5)
  {
    LODWORD(v10) = v5;
    uint64_t v11 = 87LL;
    goto LABEL_27;
  }

  CMTime time = kCMTimeZero;
  CFDictionaryRef v6 = CMTimeCopyAsDictionary(&time, kCFAllocatorDefault);
  uint64_t CMBaseObject = FigEndpointStreamAudioEngineGetCMBaseObject(*(void *)(v2 + 88));
  if (v8)
  {
    uint64_t v9 = v8(CMBaseObject, kAPAudioEngineProperty_AudioSourceFirstFrameAnchorTime, v6);
    if (!(_DWORD)v9)
    {
      if (dword_100010248 <= 50
        && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
      {
        LogPrintF( &dword_100010248,  "void ausrc_resume(AudioSBufSourceRef, CMTime)",  33554482LL,  "%@ audio source resumed",  *(void *)(v2 + 24));
      }

      LODWORD(v10) = 0;
      goto LABEL_18;
    }

    uint64_t v10 = v9;
  }

  else
  {
    uint64_t v10 = 4294954514LL;
  }

  APSLogErrorAt(v10, "ausrc_resume", 91LL, 0LL);
LABEL_18:
  CFRelease(v3);
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v6) {
    CFRelease(v6);
  }
LABEL_22:
  atomic_store(v10, (unsigned int *)(v2 + 144));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t sub_100008AAC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (dword_100010248 <= 50
    && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
  {
    LogPrintF( &dword_100010248,  "void ausrc_suspend(AudioSBufSourceRef)",  33554482LL,  "%@ audio source: suspending",  *(void *)(v1 + 24));
  }

  uint64_t result = FigEndpointStreamAudioEngineSuspendSync( *(void *)(v1 + 88),  0LL,  (1000 * *(_DWORD *)(v1 + 148)));
  unsigned int v3 = result;
  if ((_DWORD)result)
  {
    uint64_t result = APSLogErrorAt(result, "ausrc_suspend", 111LL, 0LL);
  }

  else if (dword_100010248 <= 50)
  {
    if (dword_100010248 != -1 || (uint64_t result = _LogCategory_Initialize(&dword_100010248, 33554482LL), (_DWORD)result)) {
      uint64_t result = LogPrintF( &dword_100010248,  "void ausrc_suspend(AudioSBufSourceRef)",  33554482LL,  "%@ audio source suspended",  *(void *)(v1 + 24));
    }
  }

  atomic_store(v3, (unsigned int *)(v1 + 144));
  return result;
}

uint64_t sub_100008BD8(__CVBuffer *a1, uint64_t a2, void *a3)
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  emptdouble y = xpc_dictionary_create_empty();
  CMTime v7 = empty;
  uint64_t bytes = a2;
  if (!a1)
  {
    xpc_dictionary_set_data(empty, "data", &bytes, 0x28uLL);
    xpc_object_t v10 = 0LL;
    goto LABEL_9;
  }

  IOSurface = CVPixelBufferGetIOSurface(a1);
  if (IOSurface)
  {
    xpc_object_t XPCObject = IOSurfaceCreateXPCObject(IOSurface);
    if (XPCObject)
    {
      xpc_object_t v10 = XPCObject;
      xpc_dictionary_set_value(v7, "surface", XPCObject);
      CVPixelBufferGetExtendedPixels(a1, (size_t *)&v16, (size_t *)&v16 + 1, (size_t *)&v17, (size_t *)&v17 + 1);
      CFDictionaryRef v11 = CVBufferCopyAttachments(a1, kCVAttachmentMode_ShouldPropagate);
      xpc_dictionary_set_data(v7, "data", &bytes, 0x28uLL);
      if (v11)
      {
        uint64_t v12 = FigXPCMessageSetCFDictionary(v7, "attachments", v11);
        uint64_t v13 = v12;
        if ((_DWORD)v12)
        {
          APSLogErrorAt(v12, "APSKServiceSerializeFrame", 79LL, 0LL);
        }

        else
        {
          *a3 = v7;
          CMTime v7 = 0LL;
        }

        CFRelease(v11);
        goto LABEL_10;
      }

LABEL_9:
      uint64_t v13 = 0LL;
      *a3 = v7;
      CMTime v7 = 0LL;
      goto LABEL_10;
    }

    if (dword_100010248 <= 90
      && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554522LL)))
    {
      LogPrintF( &dword_100010248,  "OSStatus APSKServiceSerializeFrame(CVPixelBufferRef, int64_t, xpc_object_t *)",  33554522LL,  "can't create XPC object from surface");
    }

    xpc_object_t v10 = 0LL;
    uint64_t v13 = 4294960534LL;
  }

  else
  {
    if (dword_100010248 <= 90
      && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554522LL)))
    {
      LogPrintF( &dword_100010248,  "OSStatus APSKServiceSerializeFrame(CVPixelBufferRef, int64_t, xpc_object_t *)",  33554522LL,  "not surface-backed pixel buffer");
    }

    xpc_object_t v10 = 0LL;
    uint64_t v13 = 4294960591LL;
  }

LABEL_10:
  FigXPCRelease(v10);
  FigXPCRelease(v7);
  return v13;
}

uint64_t sub_100008DF0(void *a1, CVPixelBufferRef *a2, void *a3)
{
  size_t length = 0LL;
  CVPixelBufferRef pixelBufferOut = 0LL;
  CFDictionaryRef theAttachments = 0LL;
  data = xpc_dictionary_get_data(a1, "data", &length);
  if (!data)
  {
    if (dword_100010248 <= 90
      && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554522LL)))
    {
      LogPrintF( &dword_100010248,  "OSStatus APSKServiceDeserializeFrame(xpc_object_t, CVPixelBufferRef *, int64_t *)",  33554522LL,  "no frame data");
    }

    goto LABEL_40;
  }

  if (length != 40)
  {
    if (dword_100010248 <= 90
      && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554522LL)))
    {
      LogPrintF( &dword_100010248,  "OSStatus APSKServiceDeserializeFrame(xpc_object_t, CVPixelBufferRef *, int64_t *)",  33554522LL,  "invalid frame data size");
    }

    goto LABEL_40;
  }

  CMTime v7 = data;
  xpc_object_t value = xpc_dictionary_get_value(a1, "surface");
  if (!value)
  {
    uint64_t v14 = 0LL;
    uint64_t v16 = 0LL;
    *a3 = *v7;
    *a2 = 0LL;
    CVPixelBufferRef pixelBufferOut = 0LL;
    goto LABEL_25;
  }

  IOSurfaceRef v9 = IOSurfaceLookupFromXPCObject(value);
  if (!v9)
  {
    if (dword_100010248 <= 90
      && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554522LL)))
    {
      LogPrintF( &dword_100010248,  "OSStatus APSKServiceDeserializeFrame(xpc_object_t, CVPixelBufferRef *, int64_t *)",  33554522LL,  "can't lookup surface");
    }

LABEL_40:
    uint64_t v14 = 0LL;
    uint64_t v16 = 4294960591LL;
    goto LABEL_25;
  }

  xpc_object_t v10 = v9;
  uint64_t v11 = FigXPCMessageCopyCFDictionary(a1, "attachments", &theAttachments);
  if ((_DWORD)v11)
  {
    uint64_t v16 = v11;
    APSLogErrorAt(v11, "APSKServiceDeserializeFrame", 113LL, 0LL);
    uint64_t v14 = 0LL;
  }

  else
  {
    if (v7[1] || v7[2] || v7[3] || v7[4])
    {
      uint64_t v12 = kCFAllocatorDefault;
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      uint64_t v14 = Mutable;
      if (v7[1]) {
        FigCFDictionarySetInt64(Mutable, kCVPixelBufferExtendedPixelsLeftKey);
      }
      if (v7[2]) {
        FigCFDictionarySetInt64(v14, kCVPixelBufferExtendedPixelsRightKey);
      }
      if (v7[3]) {
        FigCFDictionarySetInt64(v14, kCVPixelBufferExtendedPixelsTopKey);
      }
      if (v7[4]) {
        FigCFDictionarySetInt64(v14, kCVPixelBufferExtendedPixelsBottomKey);
      }
    }

    else
    {
      uint64_t v14 = 0LL;
      uint64_t v12 = kCFAllocatorDefault;
    }

    uint64_t v15 = CVPixelBufferCreateWithIOSurface(v12, v10, v14, &pixelBufferOut);
    if ((_DWORD)v15)
    {
      uint64_t v16 = v15;
      APSLogErrorAt(v15, "APSKServiceDeserializeFrame", 133LL, 0LL);
    }

    else
    {
      if (theAttachments) {
        CVBufferSetAttachments(pixelBufferOut, theAttachments, kCVAttachmentMode_ShouldPropagate);
      }
      uint64_t v16 = 0LL;
      *a3 = *v7;
      *a2 = pixelBufferOut;
      CVPixelBufferRef pixelBufferOut = 0LL;
    }
  }

  CFRelease(v10);
  if (pixelBufferOut) {
    CFRelease(pixelBufferOut);
  }
LABEL_25:
  if (theAttachments) {
    CFRelease(theAttachments);
  }
  if (v14) {
    CFRelease(v14);
  }
  return v16;
}

void sub_100009130(int a1, uint64_t a2, uint64_t a3)
{
  if (a1 != -1 || sub_1000035E4((uint64_t)&dword_100010248)) {
    sub_1000035D8( (uint64_t)&dword_100010248,  (uint64_t)"void fvdsrc_finalize(CMBaseObjectRef)",  a3,  "### %@ FVD source wasn't unplugged!");
  }
  sub_1000035F0();
}

void sub_10000918C(int a1, uint64_t a2, uint64_t a3)
{
  if (a1 != -1 || sub_1000035E4((uint64_t)&dword_100010248)) {
    sub_1000035D8( (uint64_t)&dword_100010248,  (uint64_t)"void fvdsrc_finalize(CMBaseObjectRef)",  a3,  "### %@ FVD source wasn't properly stopped!");
  }
  sub_1000035F0();
}

uint64_t sub_1000091E8(int a1, uint64_t a2)
{
  if (a1 != -1) {
    return LogPrintF( &dword_100010248,  "void sender_finalize(CFTypeRef)",  33554532LL,  "### [%{ptr}] media sender wasn't properly stopped!",  a2);
  }
  uint64_t result = _LogCategory_Initialize(&dword_100010248, 33554532LL);
  if ((_DWORD)result) {
    return LogPrintF( &dword_100010248,  "void sender_finalize(CFTypeRef)",  33554532LL,  "### [%{ptr}] media sender wasn't properly stopped!",  a2);
  }
  return result;
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}