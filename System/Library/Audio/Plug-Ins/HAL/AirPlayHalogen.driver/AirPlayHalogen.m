uint64_t sub_1888(const __CFAllocator *a1, uint64_t a2, uint64_t a3, CFTypeRef *a4)
{
  uint64_t ClassID;
  uint64_t v9;
  uint64_t DerivedStorage;
  uint64_t Instance;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  CFTypeRef cf;
  int v18;
  CFTypeRef v19;
  CFTypeRef v20;
  v19 = 0LL;
  v18 = 0;
  cf = 0LL;
  ClassID = FigHALAudioDeviceGetClassID();
  v9 = CMDerivedObjectCreate(a1, &unk_105F8, ClassID, &v19);
  if ((_DWORD)v9)
  {
    v14 = v9;
    v16 = 1111LL;
  }

  else
  {
    v9 = FigHALAudioObjectMapperAddMapping(a2, v19, &v18);
    if ((_DWORD)v9)
    {
      v14 = v9;
      v16 = 1114LL;
    }

    else
    {
      DerivedStorage = CMBaseObjectGetDerivedStorage(v19);
      *(void *)(DerivedStorage + 8) = a3;
      *(void *)(DerivedStorage + 16) = a2;
      *(_DWORD *)DerivedStorage = v18;
      *(_DWORD *)(DerivedStorage + 40) = 1634300528;
      if (qword_14238 != -1) {
        dispatch_once(&qword_14238, &stru_10720);
      }
      Instance = _CFRuntimeCreateInstance(kCFAllocatorDefault, qword_14240, 192LL, 0LL);
      if (Instance)
      {
        *(void *)(DerivedStorage + 48) = Instance;
      }

      else
      {
        APSLogErrorAt(0LL, "SetupSharedState", 176LL, 0LL);
        v9 = FigSignalErrorAt(4294954510LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
        if ((_DWORD)v9)
        {
          v14 = v9;
          v16 = 1124LL;
          goto LABEL_33;
        }
      }

      *(void *)(DerivedStorage + 24) = CFRetain(@"ap:ha:nd:of:fd:ev-screen");
      *(_DWORD *)(DerivedStorage + 44) = 1885433953;
      *(void *)(DerivedStorage + 32) = CFRetain(@"AirPlayHandoffDevice");
      v12 = *(void *)(DerivedStorage + 48);
      v20 = 0LL;
      v13 = APAudioFormatCreateDescriptionArray(2048LL, 1634955876LL, 1LL, kCFAllocatorDefault, &v20);
      if ((_DWORD)v13)
      {
        v14 = v13;
        APSLogErrorAt(v13, "CreateSupportedPCMFormatArray", 111LL, 0LL);
        if (v20) {
          CFRelease(v20);
        }
        v9 = v14;
        v16 = 1131LL;
      }

      else
      {
        *(void *)(v12 + 56) = v20;
        if (dword_14000 <= 50 && (dword_14000 != -1 || _LogCategory_Initialize(&dword_14000, 33554482LL))) {
          LogPrintF( &dword_14000,  "OSStatus APHALHandoffAudioDeviceCreate(CFAllocatorRef, FigHALAudioObjectMapper, AudioServerPlugInHostRef, Fi gHALAudioDeviceRef *)",  33554482LL,  "[%s] handoffDevice = %p (objectID = %d, deviceObjectID = %d)\n",  "APHALHandoffAudioDeviceCreate",  v19,  *(_DWORD *)DerivedStorage,  v18);
        }
        v9 = sub_345C( (uint64_t)a1,  a2,  v18,  a3,  *(const void **)(DerivedStorage + 48),  (CFTypeRef *)(DerivedStorage + 56));
        if ((_DWORD)v9)
        {
          v14 = v9;
          v16 = 1137LL;
        }

        else
        {
          v9 = sub_C09C(a1, (CFDataRef *)&cf);
          if ((_DWORD)v9)
          {
            v14 = v9;
            v16 = 1140LL;
          }

          else
          {
            v9 = sub_C124((uint64_t)a1, a2, a3, v18, cf, (CFTypeRef *)(DerivedStorage + 64));
            if ((_DWORD)v9)
            {
              v14 = v9;
              v16 = 1143LL;
            }

            else
            {
              v9 = sub_C224((uint64_t)a1, a2, a3, v18, cf, (CFTypeRef *)(DerivedStorage + 72));
              v14 = v9;
              if (!(_DWORD)v9)
              {
                *a4 = v19;
                v19 = 0LL;
                goto LABEL_17;
              }

              v16 = 1146LL;
            }
          }
        }
      }
    }
  }

LABEL_33:
  APSLogErrorAt(v9, "APHALHandoffAudioDeviceCreate", v16, 0LL);
LABEL_17:
  if (cf) {
    CFRelease(cf);
  }
  if (v19) {
    CFRelease(v19);
  }
  return v14;
}

  if (cf1) {
    CFRelease(cf1);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v10;
}

void sub_1BFC()
{
  DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  v1 = (const void *)DerivedStorage[3];
  if (v1)
  {
    CFRelease(v1);
    DerivedStorage[3] = 0LL;
  }

  v2 = (const void *)DerivedStorage[4];
  if (v2)
  {
    CFRelease(v2);
    DerivedStorage[4] = 0LL;
  }

  v3 = (const void *)DerivedStorage[7];
  if (v3)
  {
    CFRelease(v3);
    DerivedStorage[7] = 0LL;
  }

  v4 = (const void *)DerivedStorage[6];
  if (v4)
  {
    CFRelease(v4);
    DerivedStorage[6] = 0LL;
  }

  v5 = (const void *)DerivedStorage[8];
  if (v5)
  {
    CFRelease(v5);
    DerivedStorage[8] = 0LL;
  }

  v6 = (const void *)DerivedStorage[9];
  if (v6)
  {
    CFRelease(v6);
    DerivedStorage[9] = 0LL;
  }
}

CFStringRef sub_1C7C()
{
  DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage();
  return CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"APHALHandoffAudioDevice ID %d UID %@",  *DerivedStorage,  *((void *)DerivedStorage + 3));
}

uint64_t sub_1CC4()
{
  return *(unsigned int *)CMBaseObjectGetDerivedStorage();
}

BOOL sub_1CDC(uint64_t a1, int *a2)
{
  BOOL result = 0LL;
  int v3 = *a2;
  if (*a2 <= 1819173228)
  {
    if (v3 <= 1668641651)
    {
      if (v3 > 1668047218)
      {
        BOOL v5 = v3 == 1668047219 || v3 == 1668049764;
        int v6 = 1668575852;
      }

      else
      {
        BOOL v5 = v3 == 1634429294 || v3 == 1634758772;
        int v6 = 1650682995;
      }

      if (v5 || v3 == v6) {
        return 1LL;
      }
    }

    else
    {
      if (v3 > 1735354733)
      {
        if (v3 > 1818850925)
        {
          if (v3 == 1818850926) {
            return 1LL;
          }
          int v4 = 1819107691;
        }

        else
        {
          if (v3 == 1735354734) {
            return 1LL;
          }
          int v4 = 1751737454;
        }

        goto LABEL_57;
      }

      if (v3 == 1668641652) {
        return 1LL;
      }
      if (v3 == 1684236338 || v3 == 1684434036) {
        goto LABEL_36;
      }
    }
  }

  else
  {
    if (v3 <= 1935763059)
    {
      if (v3 > 1853059618)
      {
        if (v3 <= 1870098019)
        {
          if (v3 != 1853059619)
          {
            int v4 = 1853059700;
            goto LABEL_57;
          }

          return 1LL;
        }

        if (v3 == 1870098020) {
          return 1LL;
        }
        int v4 = 1919512167;
LABEL_57:
        if (v3 != v4) {
          return result;
        }
        return 1LL;
      }

      if (v3 == 1819173229) {
        return 1LL;
      }
      if (v3 != 1819569763)
      {
        int v4 = 1836411236;
        goto LABEL_57;
      }

      goto LABEL_36;
    }

    if (v3 > 1937007733)
    {
      if (v3 > 1953653101)
      {
        if (v3 == 1969841184) {
          return 1LL;
        }
        int v4 = 1953653102;
      }

      else
      {
        if (v3 == 1937007734) {
          return 1LL;
        }
        int v4 = 1937009955;
      }

      goto LABEL_57;
    }

    if (v3 == 1935763060 || v3 == 1936092276 || v3 == 1936879204)
    {
LABEL_36:
      int v9 = a2[1];
      return v9 == 1768845428 || v9 == 1869968496;
    }
  }

  return result;
}

BOOL sub_1F34(uint64_t a1, _DWORD *a2)
{
  return *a2 == 1853059700;
}

uint64_t sub_1F4C(uint64_t a1, int *a2)
{
  DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  uint64_t result = 0LL;
  int v5 = *a2;
  if (*a2 <= 1819173228)
  {
    if (v5 > 1668641651)
    {
      if (v5 == 1819107691) {
        int v9 = 8;
      }
      else {
        int v9 = 0;
      }
      if (v5 == 1818850926) {
        int v10 = 4;
      }
      else {
        int v10 = v9;
      }
      if (v5 == 1751737454) {
        int v11 = 4;
      }
      else {
        int v11 = 0;
      }
      if (v5 == 1735354734) {
        int v12 = 4;
      }
      else {
        int v12 = v11;
      }
      if (v5 <= 1818850925) {
        unsigned int v13 = v12;
      }
      else {
        unsigned int v13 = v10;
      }
      if (v5 == 1684434036) {
        int v14 = 4;
      }
      else {
        int v14 = 0;
      }
      if (v5 == 1684236338) {
        int v15 = 8;
      }
      else {
        int v15 = v14;
      }
      if (v5 == 1668641652) {
        unsigned int v16 = 12;
      }
      else {
        unsigned int v16 = v15;
      }
      if (v5 <= 1735354733) {
        return v16;
      }
      else {
        return v13;
      }
    }

    if (v5 > 1668047218)
    {
      if (v5 != 1668047219 && v5 != 1668049764)
      {
        if (v5 == 1668575852)
        {
          if (DerivedStorage[9]) {
            int v21 = (DerivedStorage[8] != 0LL) + 1;
          }
          else {
            int v21 = DerivedStorage[8] != 0LL;
          }
          return (4 * v21);
        }

        return result;
      }
    }

    else if (v5 != 1634429294 && v5 != 1634758772 && v5 != 1650682995)
    {
      return result;
    }

    return 4LL;
  }

  if (v5 > 1935763059)
  {
    if (v5 <= 1937007733)
    {
      if (v5 != 1935763060 && v5 != 1936092276)
      {
        if (v5 == 1936879204) {
          return (20 * *(_DWORD *)(DerivedStorage[6] + 44LL) + 12);
        }
        return result;
      }
    }

    else
    {
      if (v5 > 1953653101)
      {
        int v6 = 1953653102;
        unsigned int v7 = 4;
        int v8 = 1969841184;
LABEL_70:
        if (v5 == v8) {
          unsigned int v20 = 8;
        }
        else {
          unsigned int v20 = 0;
        }
LABEL_73:
        if (v5 == v6) {
          return v7;
        }
        else {
          return v20;
        }
      }

      if (v5 != 1937007734)
      {
        if (v5 != 1937009955) {
          return result;
        }
        int v17 = a2[1];
        BOOL v18 = v17 == 1869968496 || v17 == 1735159650;
        goto LABEL_66;
      }
    }

    return 4LL;
  }

  if (v5 <= 1853059618)
  {
    int v6 = 1819173229;
    unsigned int v7 = 8;
    if (v5 == 1836411236) {
      int v19 = 8;
    }
    else {
      int v19 = 0;
    }
    if (v5 == 1819569763) {
      unsigned int v20 = 4;
    }
    else {
      unsigned int v20 = v19;
    }
    goto LABEL_73;
  }

  if (v5 <= 1870098019)
  {
    int v6 = 1853059619;
    unsigned int v7 = 32;
    int v8 = 1853059700;
    goto LABEL_70;
  }

  if (v5 != 1870098020)
  {
    BOOL v18 = v5 == 1919512167;
LABEL_66:
    if (v18) {
      return 4LL;
    }
    else {
      return 0LL;
    }
  }

  int v22 = a2[1];
  if (v22 != 1869968496 && v22 != 1735159650) {
    return 0LL;
  }
  if (DerivedStorage[9]) {
    int v23 = (DerivedStorage[8] != 0LL) + 1;
  }
  else {
    int v23 = DerivedStorage[8] != 0LL;
  }
  return (4 * v23 + 4);
}

uint64_t sub_22A4(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6, int *a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v14 = DerivedStorage;
  int v15 = *a2;
  uint64_t v16 = 2003332927LL;
  if (*a2 <= 1819173228)
  {
    if (v15 > 1668641651)
    {
      if (v15 <= 1735354733)
      {
        if (v15 == 1668641652)
        {
          *a6 = 12;
          if (a5 > 0xB)
          {
            uint64_t v16 = 0LL;
            a7[2] = 0;
            *(void *)a7 = *(void *)"tppawwar";
            return v16;
          }

          uint64_t v16 = 561211770LL;
          uint64_t v69 = 761LL;
          goto LABEL_191;
        }

        if (v15 == 1684236338)
        {
          if (a5 > 7)
          {
            uint64_t v16 = 0LL;
            *(void *)a7 = 0x200000001LL;
            int v41 = 8;
LABEL_186:
            *a6 = v41;
            return v16;
          }

          uint64_t v16 = 561211770LL;
          uint64_t v69 = 729LL;
LABEL_191:
          APSLogErrorAt(0LL, "handoffDevice_GetPropertyData", v69, 0LL);
          return v16;
        }

        int v17 = 1684434036;
      }

      else
      {
        if (v15 > 1818850925)
        {
          if (v15 == 1818850926)
          {
            *a6 = 4;
            uint64_t v16 = 0LL;
            int v23 = *(_BYTE *)(DerivedStorage + 84) == 0;
            goto LABEL_117;
          }

          if (v15 != 1819107691) {
            return v16;
          }
          *a6 = 8;
          v35 = @"Apple, Inc.";
          goto LABEL_75;
        }

        if (v15 == 1735354734)
        {
          *a6 = 4;
          uint64_t v16 = 0LL;
          int v23 = *(_DWORD *)(DerivedStorage + 80) > 0;
          goto LABEL_117;
        }

        int v17 = 1751737454;
      }

      if (v15 != v17) {
        return v16;
      }
LABEL_60:
      *a6 = 4;
      if (a5 >= 4)
      {
        uint64_t v16 = 0LL;
        *a7 = 0;
        return v16;
      }

      return 561211770LL;
    }

    if (v15 <= 1668047218)
    {
      switch(v15)
      {
        case 1634429294:
          *a6 = 4;
          uint64_t v16 = 0LL;
          int v23 = *(_DWORD *)DerivedStorage;
          break;
        case 1634758772:
          *a6 = 4;
          uint64_t v16 = 0LL;
          int v23 = *(_DWORD *)(DerivedStorage + 44);
          break;
        case 1650682995:
          *a6 = 4;
          uint64_t v16 = 0LL;
          int v23 = 1634689642;
          break;
        default:
          return v16;
      }

LABEL_117:
      *a7 = v23;
      return v16;
    }

    if (v15 == 1668047219)
    {
      *a6 = 4;
      uint64_t v16 = 0LL;
      int v23 = 1633969526;
      goto LABEL_117;
    }

    if (v15 == 1668049764) {
      goto LABEL_60;
    }
    if (v15 != 1668575852) {
      return v16;
    }
    unsigned int v28 = a5 >> 2;
    int v29 = a2[1];
    switch(v29)
    {
      case 1869968496:
        goto LABEL_56;
      case 1768845428:
        break;
      case 1735159650:
LABEL_56:
        uint64_t v31 = *(void *)(DerivedStorage + 64);
        uint64_t v30 = *(void *)(DerivedStorage + 72);
        unsigned int v32 = v31 != 0;
        if (v30) {
          ++v32;
        }
        if (v28 >= v32) {
          unsigned int v28 = v32;
        }
        if (v28)
        {
          if (!v31)
          {
            uint64_t v53 = 0LL;
            goto LABEL_150;
          }

          v33 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(*(void *)(DerivedStorage + 64))
                                                              + 16)
                                                  + 8LL);
          if (v33) {
            int v34 = v33(v31);
          }
          else {
            int v34 = 0;
          }
          *a7 = v34;
          if (v28 >= 2)
          {
            uint64_t v30 = *(void *)(v14 + 72);
            uint64_t v53 = 1LL;
LABEL_150:
            if (v30)
            {
              v54 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v30) + 16) + 8LL);
              if (v54) {
                int v55 = v54(v30);
              }
              else {
                int v55 = 0;
              }
              a7[v53] = v55;
            }

            break;
          }

          unsigned int v28 = 1;
        }

        break;
    }

    uint64_t v16 = 0LL;
    int v41 = 4 * v28;
    goto LABEL_186;
  }

  if (v15 > 1935763059)
  {
    if (v15 > 1937007733)
    {
      if (v15 > 1953653101)
      {
        if (v15 == 1953653102)
        {
          *a6 = 4;
          uint64_t v16 = 0LL;
          int v23 = *(_DWORD *)(DerivedStorage + 40);
          goto LABEL_117;
        }

        int v24 = 1969841184;
LABEL_72:
        if (v15 != v24) {
          return v16;
        }
        *a6 = 8;
        v35 = *(const __CFString **)(DerivedStorage + 24);
        if (!v35)
        {
LABEL_76:
          uint64_t v16 = 0LL;
          *(void *)a7 = v35;
          return v16;
        }

LABEL_75:
        v35 = (const __CFString *)CFRetain(v35);
        goto LABEL_76;
      }

      if (v15 == 1937007734)
      {
        *a6 = 4;
        uint64_t v16 = 0LL;
        int v23 = 1;
        goto LABEL_117;
      }

      if (v15 != 1937009955) {
        return v16;
      }
      int v18 = a2[1];
      if (v18 == 1869968496) {
        goto LABEL_21;
      }
      unsigned int v19 = a5 >> 2;
      if (v18 == 1768845428)
      {
        goto LABEL_146;
      }

      if (v18 == 1735159650)
      {
LABEL_21:
        if (a5 < 4)
        {
          unsigned int v19 = 0;
        }

        else
        {
          uint64_t v20 = *(void *)(DerivedStorage + 56);
          int v21 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v20) + 16) + 8LL);
          if (v21) {
            int v22 = v21(v20);
          }
          else {
            int v22 = 0;
          }
          *a7 = v22;
          unsigned int v19 = 1;
        }
      }

LABEL_146:
      uint64_t v16 = 0LL;
      int v41 = 4 * v19;
      goto LABEL_186;
    }

    if (v15 != 1935763060 && v15 != 1936092276)
    {
      if (v15 != 1936879204) {
        return v16;
      }
      int v25 = *(_DWORD *)(*(void *)(DerivedStorage + 48) + 44LL);
      unsigned int v26 = 20 * v25 + 12;
      if (v26 <= a5)
      {
        bzero(a7, (20 * v25 + 12));
        uint64_t v16 = 0LL;
        if (v25 == 1) {
          int v27 = 6553601;
        }
        else {
          int v27 = 6619138;
        }
        *a7 = v27;
        *a6 = v26;
        return v16;
      }

      uint64_t v16 = 561211770LL;
      uint64_t v69 = 745LL;
      goto LABEL_191;
    }

    goto LABEL_60;
  }

  if (v15 <= 1853059618)
  {
    if (v15 == 1819173229)
    {
      v36 = *(const void **)(DerivedStorage + 32);
      if (!v36 || (CFTypeRef v37 = CFRetain(v36)) == 0LL) {
        CFTypeRef v37 = CFRetain(@"No Name Endpoint");
      }
      *a6 = 8;
      if (a5 < 8)
      {
        uint64_t v16 = 561211770LL;
      }

      else
      {
        uint64_t v16 = 0LL;
        *(void *)a7 = CFRetain(v37);
      }

      if (v37) {
        CFRelease(v37);
      }
      return v16;
    }

    if (v15 == 1819569763)
    {
      uint64_t v38 = *(void *)(DerivedStorage + 56);
      if (v39) {
        return v39(v38, a2, a3, a4, a5, a6, a7);
      }
      return 4294954514LL;
    }

    int v24 = 1836411236;
    goto LABEL_72;
  }

  if (v15 > 1870098019)
  {
    if (v15 != 1870098020)
    {
      if (v15 != 1919512167) {
        return v16;
      }
      *a6 = 4;
      uint64_t v16 = 0LL;
      int v23 = 11025;
      goto LABEL_117;
    }

    LODWORD(v42) = a5 >> 2;
    int v43 = a2[1];
    switch(v43)
    {
      case 1869968496:
        if (*(void *)(DerivedStorage + 64)) {
          unsigned int v49 = 2;
        }
        else {
          unsigned int v49 = 1;
        }
        if (*(void *)(DerivedStorage + 72)) {
          ++v49;
        }
        else {
          unsigned int v45 = a5 >> 2;
        }
        if (v45)
        {
          uint64_t v50 = *(void *)(DerivedStorage + 56);
          v51 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v50) + 16) + 8LL);
          if (v51) {
            int v52 = v51(v50);
          }
          else {
            int v52 = 0;
          }
          *a7 = v52;
          if (v45 >= 2)
          {
            uint64_t v59 = *(void *)(v14 + 64);
            if (v59)
            {
              if (v60) {
                int v61 = v60(v59);
              }
              else {
                int v61 = 0;
              }
              a7[1] = v61;
              uint64_t v62 = 2LL;
              LODWORD(v42) = 2;
              if (v45 < 3) {
                goto LABEL_185;
              }
            }

            else
            {
              uint64_t v62 = 1LL;
            }

            uint64_t v66 = *(void *)(v14 + 72);
            if (v66)
            {
              v67 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v66) + 16) + 8LL);
              if (v67) {
                int v68 = v67(v66);
              }
              else {
                int v68 = 0;
              }
              a7[v62] = v68;
            }

LABEL_184:
            LODWORD(v42) = v45;
            goto LABEL_185;
          }

          goto LABEL_164;
        }

        break;
      case 1768845428:
        goto LABEL_185;
      case 1735159650:
        if (*(void *)(DerivedStorage + 64)) {
          unsigned int v44 = 2;
        }
        else {
          unsigned int v44 = 1;
        }
        if (*(void *)(DerivedStorage + 72)) {
          ++v44;
        }
        else {
          unsigned int v45 = a5 >> 2;
        }
        if (v45)
        {
          uint64_t v46 = *(void *)(DerivedStorage + 56);
          v47 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v46) + 16) + 8LL);
          if (v47) {
            int v48 = v47(v46);
          }
          else {
            int v48 = 0;
          }
          *a7 = v48;
          if (v45 >= 2)
          {
            uint64_t v56 = *(void *)(v14 + 64);
            if (v56)
            {
              if (v57) {
                int v58 = v57(v56);
              }
              else {
                int v58 = 0;
              }
              a7[1] = v58;
              uint64_t v42 = 2LL;
              if (v45 < 3) {
                goto LABEL_185;
              }
            }

            else
            {
              uint64_t v42 = 1LL;
            }

            uint64_t v63 = *(void *)(v14 + 72);
            if (v63)
            {
              v64 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v63) + 16) + 8LL);
              if (v64) {
                int v65 = v64(v63);
              }
              else {
                int v65 = 0;
              }
              a7[v42] = v65;
            }

            goto LABEL_184;
          }

LABEL_164:
          LODWORD(v42) = 1;
          goto LABEL_185;
        }

        break;
      default:
LABEL_185:
        uint64_t v16 = 0LL;
        int v41 = 4 * v42;
        goto LABEL_186;
    }

    LODWORD(v42) = 0;
    goto LABEL_185;
  }

  if (v15 == 1853059619)
  {
    uint64_t v16 = 0LL;
    *a6 = 0;
    return v16;
  }

  if (v15 == 1853059700)
  {
    *a6 = 8;
    if (a5 >= 8)
    {
      uint64_t v16 = 0LL;
      *(void *)a7 = *(void *)(*(void *)(DerivedStorage + 48) + 16LL);
      return v16;
    }

    return 561211770LL;
  }

  return v16;
}

uint64_t sub_2C34(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, int a5, double *a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CFDataRef v39 = 0LL;
  uint64_t v40 = 0LL;
  if (*a2 != 1853059700)
  {
    uint64_t v26 = 0LL;
    uint64_t v27 = 2003332927LL;
    goto LABEL_26;
  }

  int v10 = (unsigned int *)DerivedStorage;
  memset(__s2, 0, 40);
  uint64_t v11 = *(void *)(DerivedStorage + 48);
  __int128 v12 = *(_OWORD *)(v11 + 32);
  __int128 v35 = *(_OWORD *)(v11 + 16);
  __int128 v36 = v12;
  uint64_t v37 = *(void *)(v11 + 48);
  if (a5 != 8)
  {
    uint64_t v27 = 561211770LL;
    uint64_t v28 = 561211770LL;
    uint64_t v29 = 836LL;
LABEL_19:
    APSLogErrorAt(v28, "handoffDevice_SetPropertyData", v29, 0LL);
    uint64_t v26 = 0LL;
    goto LABEL_26;
  }

  double v13 = *a6;
  if (*a6 == *(double *)&v35)
  {
LABEL_20:
    uint64_t v26 = 0LL;
    uint64_t v27 = 0LL;
    goto LABEL_26;
  }

  uint64_t CMBaseObject = FigHALAudioStreamGetCMBaseObject(*(void *)(DerivedStorage + 56));
  int v15 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, CFDataRef *))(*(void *)(CMBaseObjectGetVTable(CMBaseObject)
                                                                                                 + 8)
                                                                                     + 48LL);
  if (!v15)
  {
    uint64_t v27 = 4294954514LL;
LABEL_22:
    uint64_t v28 = v27;
    uint64_t v29 = 845LL;
    goto LABEL_19;
  }

  uint64_t v16 = v15(CMBaseObject, kFigHALAudioStreamProperty_SupportedPCMFormats, kCFAllocatorDefault, &v39);
  if ((_DWORD)v16)
  {
    uint64_t v27 = v16;
    goto LABEL_22;
  }

  int v17 = v39;
  unint64_t Length = CFDataGetLength(v39);
  if (Length < 0x70)
  {
    uint64_t v27 = 4294967246LL;
    uint64_t v34 = 792LL;
LABEL_32:
    APSLogErrorAt(0LL, "GetBestSupportedPCMASBDForSampleRate", v34, 0LL);
    uint64_t v28 = v27;
    uint64_t v29 = 848LL;
    goto LABEL_19;
  }

  unint64_t v19 = Length / 0x38;
  BytePtr = CFDataGetBytePtr(v17);
  int v21 = 0LL;
  do
  {
    if (*((double *)BytePtr + 5) <= v13 && *((double *)BytePtr + 6) >= v13)
    {
      int v21 = BytePtr;
      if (*((_DWORD *)BytePtr + 7) == HIDWORD(v36))
      {
        int v21 = BytePtr;
        if (*((_DWORD *)BytePtr + 8) >= v37)
        {
          int v21 = BytePtr;
          goto LABEL_14;
        }
      }
    }

    BytePtr += 56;
    --v19;
  }

  while (v19);
  if (!v21)
  {
    uint64_t v27 = 1970171760LL;
    uint64_t v34 = 807LL;
    goto LABEL_32;
  }

LABEL_14:
  *(double *)__s2 = v13;
  __int128 v22 = *(_OWORD *)(v21 + 24);
  *(_OWORD *)((char *)__s2 + 8) = *(_OWORD *)(v21 + 8);
  *(_OWORD *)((char *)&__s2[1] + 8) = v22;
  if (!memcmp(&v35, __s2, 0x28uLL)) {
    goto LABEL_20;
  }
  uint64_t v23 = *((void *)v10 + 7);
  int v24 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v23) + 16) + 8LL);
  if (v24) {
    uint64_t v25 = v24(v23);
  }
  else {
    uint64_t v25 = 0LL;
  }
  uint64_t v30 = FigHALAudioConfigChangeCreateRecord(v25, a2, &v40);
  uint64_t v27 = v30;
  if ((_DWORD)v30)
  {
    APSLogErrorAt(v30, "handoffDevice_SetPropertyData", 854LL, 0LL);
    uint64_t v26 = v40;
  }

  else
  {
    uint64_t v31 = v40;
    __int128 v32 = __s2[1];
    *(_OWORD *)(v40 + 16) = __s2[0];
    *(_OWORD *)(v31 + 32) = v32;
    *(void *)(v31 + 48) = *(void *)&__s2[2];
    FigHALAudioConfigChangeSendRequest(*((void *)v10 + 1), *v10, 1718579821LL);
    uint64_t v26 = 0LL;
    uint64_t v40 = 0LL;
  }

LABEL_26:
  FigHALAudioConfigChangeDisposeRecord(v26);
  if (v39) {
    CFRelease(v39);
  }
  return v27;
}

CFTypeRef sub_2F10()
{
  CFTypeRef result = *(CFTypeRef *)(CMBaseObjectGetDerivedStorage() + 24);
  if (result) {
    return CFRetain(result);
  }
  return result;
}

uint64_t sub_2F34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2 == 1718579821)
  {
    int v6 = (unsigned int *)DerivedStorage;
    uint64_t v7 = *(void *)(DerivedStorage + 56);
    int v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(CMBaseObjectGetVTable(v7) + 24) + 16LL);
    if (v8)
    {
      uint64_t v9 = v8(v7, 1718579821LL, a3);
      if (!(_DWORD)v9)
      {
        FigHALAudioPropertySendChanges(*((void *)v6 + 1), *v6, 1LL, 4LL);
LABEL_8:
        a3 = 0LL;
        goto LABEL_9;
      }
    }

    else
    {
      uint64_t v9 = 4294954514LL;
    }

    APSLogErrorAt(v9, "handoffDevice_PerformConfigChange", 892LL, 0LL);
    goto LABEL_8;
  }

  uint64_t v9 = FigSignalErrorAt(1852797029LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
LABEL_9:
  FigHALAudioConfigChangeDisposeRecord(a3);
  return v9;
}

uint64_t sub_301C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 0LL;
}

uint64_t sub_3038()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v1 = DerivedStorage;
  if (*(_BYTE *)(DerivedStorage + 84))
  {
    APSLogErrorAt(0LL, "handoffDevice_StartIO", 919LL, 0LL);
    uint64_t v2 = FigSignalErrorAt(560227702LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    if (!(_DWORD)v2) {
      return v2;
    }
  }

  else
  {
    if (*(_DWORD *)(DerivedStorage + 80)) {
      return 0LL;
    }
    uint64_t v3 = *(void *)(DerivedStorage + 48);
    __int128 v4 = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(v3 + 88) = *(_OWORD *)(v3 + 16);
    *(_OWORD *)(v3 + 104) = v4;
    *(void *)(v3 + 120) = *(void *)(v3 + 48);
    uint64_t v5 = *(void *)(DerivedStorage + 48);
    uint64_t v6 = *(void *)(DerivedStorage + 56);
    unsigned int v7 = *(double *)(v5 + 88);
    *(_DWORD *)(v5 + 160) = *(_DWORD *)(v5 + 112);
    *(_DWORD *)(v5 + 164) = v7;
    *(_DWORD *)(v5 + 156) = 0;
    *(void *)(v5 + 176) = 0LL;
    int v8 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v6) + 24) + 32LL);
    if (v8)
    {
      uint64_t v2 = v8(v6);
      if (!(_DWORD)v2)
      {
        *(_BYTE *)(*(void *)(v1 + 48) + 200LL) = 1;
        *(_DWORD *)(v1 + 80) = 1;
        return v2;
      }
    }

    else
    {
      uint64_t v2 = 4294954514LL;
    }

    APSLogErrorAt(v2, "handoffDevice_StartIO", 929LL, 0LL);
  }

  uint64_t v9 = *(void *)(v1 + 56);
  int v10 = *(void (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v9) + 24) + 40LL);
  if (v10) {
    v10(v9);
  }
  return v2;
}

uint64_t sub_3168()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(int *)(DerivedStorage + 80) >= 1)
  {
    uint64_t v1 = DerivedStorage;
    *(_DWORD *)(DerivedStorage + 80) = 0;
    uint64_t v2 = *(void *)(DerivedStorage + 56);
    uint64_t v3 = *(void (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v2) + 24) + 40LL);
    if (v3) {
      v3(v2);
    }
    *(_BYTE *)(*(void *)(v1 + 48) + 200LL) = 0;
  }

  return 0LL;
}

uint64_t sub_31C4(uint64_t a1, double *a2, uint64_t *a3, void *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_BYTE *)(*(void *)(DerivedStorage + 48) + 200LL))
  {
    uint64_t v8 = DerivedStorage;
    uint64_t v9 = mach_absolute_time();
    uint64_t v10 = *(void *)(v8 + 48);
    int v11 = *(_DWORD *)(v10 + 164);
    if (*(_DWORD *)(v10 + 156) != v11)
    {
      *(_DWORD *)(v10 + 156) = v11;
      uint64_t v12 = UpTicksPerSecond();
      uint64_t v10 = *(void *)(v8 + 48);
      *(void *)(v10 + 168) = (11025 * v12 / (unint64_t)*(unsigned int *)(v10 + 156));
    }

    uint64_t v13 = *(void *)(v10 + 176);
    if (!v13)
    {
      uint64_t v13 = *(void *)(v10 + 168) + v9;
      *(void *)(v10 + 176) = v13;
      *(void *)(v10 + 184) = v9;
      *(void *)(v10 + 192) = 0LL;
    }

    if (v9 >= v13)
    {
      *(void *)(v10 + 176) = *(void *)(v10 + 168) + v13;
      *(void *)(v10 + 184) = v13;
      double v14 = *(double *)(v10 + 192) + 11025.0;
      *(double *)(v10 + 192) = v14;
    }

    else
    {
      double v14 = *(double *)(v10 + 192);
      uint64_t v13 = *(void *)(v10 + 184);
    }

    uint64_t result = 0LL;
    *a2 = v14;
    *a3 = v13;
    *a4 = 0LL;
  }

  else
  {
    APSLogErrorAt(0LL, "handoffDevice_GetZeroTimeStamp", 971LL, 0LL);
    return 1937010544LL;
  }

  return result;
}

uint64_t sub_32CC(uint64_t a1, int a2, BOOL *a3, BOOL *a4)
{
  if (*(_BYTE *)(*(void *)(CMBaseObjectGetDerivedStorage() + 48) + 200LL))
  {
    uint64_t result = 0LL;
    *a3 = a2 == 1919513701;
    *a4 = a2 == 1919513701;
  }

  else
  {
    APSLogErrorAt(0LL, "handoffDevice_WillDoIOOperation", 1009LL, 0LL);
    return 1937010544LL;
  }

  return result;
}

uint64_t sub_3348()
{
  if (*(_BYTE *)(*(void *)(CMBaseObjectGetDerivedStorage() + 48) + 200LL)) {
    return 0LL;
  }
  APSLogErrorAt(0LL, "handoffDevice_BeginIOOperation", 1034LL, 0LL);
  return 1937010544LL;
}

uint64_t sub_3390()
{
  if (*(_BYTE *)(*(void *)(CMBaseObjectGetDerivedStorage() + 48) + 200LL)) {
    return 0LL;
  }
  APSLogErrorAt(0LL, "handoffDevice_EndIOOperation", 1045LL, 0LL);
  return 1937010544LL;
}

void sub_33D8(id a1)
{
  qword_14248 = 0LL;
  unk_14250 = "APHALHandoffAudioSharedState";
  qword_14258 = (uint64_t)sub_342C;
  unk_14260 = 0LL;
  qword_14268 = (uint64_t)sub_344C;
  unk_14270 = 0u;
  unk_14280 = 0u;
  qword_14240 = _CFRuntimeRegisterClass();
}

double sub_342C(_OWORD *a1)
{
  double result = 0.0;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  return result;
}

void sub_344C(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 56);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_345C(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, const void *a5, CFTypeRef *a6)
{
  CFTypeRef cf = 0LL;
  unsigned int v24 = 0;
  uint64_t ClassID = FigHALAudioStreamGetClassID();
  uint64_t v13 = CMDerivedObjectCreate(a1, &unk_10740, ClassID, &cf);
  if ((_DWORD)v13)
  {
    uint64_t v21 = v13;
    uint64_t v23 = 495LL;
  }

  else
  {
    uint64_t v13 = FigHALAudioObjectMapperAddMapping(a2, cf, &v24);
    if ((_DWORD)v13)
    {
      uint64_t v21 = v13;
      uint64_t v23 = 498LL;
    }

    else
    {
      uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage(cf);
      unsigned int *DerivedStorage = v24;
      *((void *)DerivedStorage + 1) = a4;
      DerivedStorage[4] = a3;
      DerivedStorage[5] = 50;
      int v15 = (CFDataRef *)CFRetain(a5);
      *((void *)DerivedStorage + 4) = v15;
      *((_BYTE *)DerivedStorage + 24) = 1;
      if ((unint64_t)CFDataGetLength(v15[7]) >= 0x38)
      {
        BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*((void *)DerivedStorage + 4) + 56LL));
        uint64_t v17 = *((void *)DerivedStorage + 4);
        __int128 v18 = *(_OWORD *)BytePtr;
        __int128 v19 = *((_OWORD *)BytePtr + 1);
        *(void *)(v17 + 48) = *((void *)BytePtr + 4);
        *(_OWORD *)(v17 + 16) = v18;
        *(_OWORD *)(v17 + 32) = v19;
        *(void *)(*((void *)DerivedStorage + 4) + 16LL) = *((void *)BytePtr + 5);
        goto LABEL_5;
      }

      APSLogErrorAt(0LL, "InitializeDefaultOutputFormat", 469LL, 0LL);
      uint64_t v13 = FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
      if (!(_DWORD)v13)
      {
LABEL_5:
        CFTypeRef v20 = cf;
        *a6 = cf;
        CFTypeRef cf = 0LL;
        if (dword_14070 > 50) {
          return 0LL;
        }
        if (dword_14070 == -1)
        {
          CFTypeRef v20 = *a6;
        }

        LogPrintF( &dword_14070,  "OSStatus APHALHandoffAudioStreamCreate(CFAllocatorRef, FigHALAudioObjectMapper, AudioObjectID, AudioServerPlug InHostRef, APHALHandoffAudioSharedStateRef, FigHALAudioStreamRef *)",  33554482LL,  "inStream %{ptr} APHALHandoffAudioStreamCreate, [streamObjectID %d, ownerDeviceID %d]",  v20,  *DerivedStorage,  DerivedStorage[4]);
LABEL_10:
        uint64_t v21 = 0LL;
        goto LABEL_11;
      }

      uint64_t v21 = v13;
      uint64_t v23 = 510LL;
    }
  }

  APSLogErrorAt(v13, "APHALHandoffAudioStreamCreate", v23, 0LL);
LABEL_11:
  if (cf) {
    CFRelease(cf);
  }
  return v21;
}

void sub_366C(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v2 = *(const void **)(DerivedStorage + 32);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(DerivedStorage + 32) = 0LL;
  }

CFStringRef sub_369C(uint64_t a1)
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage(a1);
  return CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"APHALHandoffAudioStream ID %d Owner %d",  *DerivedStorage,  DerivedStorage[4]);
}

uint64_t sub_36E4(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (a4)
  {
    uint64_t v7 = DerivedStorage;
    if (CFEqual(a2, kFigHALAudioStreamProperty_SupportedPCMFormats))
    {
      uint64_t v8 = *(const void **)(*(void *)(v7 + 32) + 56LL);
      if (v8) {
        CFTypeRef v9 = CFRetain(v8);
      }
      else {
        CFTypeRef v9 = 0LL;
      }
      uint64_t result = 0LL;
      *a4 = v9;
    }

    else
    {
      return 4294954509LL;
    }
  }

  else
  {
    APSLogErrorAt(0LL, "handoffStream_CopyProperty", 87LL, 0LL);
    return 4294954516LL;
  }

  return result;
}

uint64_t sub_377C(uint64_t a1)
{
  return *(unsigned int *)CMBaseObjectGetDerivedStorage(a1);
}

uint64_t sub_3794(uint64_t a1, int *a2)
{
  uint64_t result = 0LL;
  int v3 = *a2;
  if (*a2 <= 1935762291)
  {
    if (v3 > 1870098019)
    {
      BOOL v4 = v3 == 1870098020 || v3 == 1885762592;
      int v5 = 1885762657;
    }

    else
    {
      BOOL v4 = v3 == 1650682995 || v3 == 1668047219;
      int v5 = 1819569763;
    }
  }

  else if (v3 <= 1936092512)
  {
    BOOL v4 = v3 == 1935762292 || v3 == 1935894638;
    int v5 = 1935960434;
  }

  else if (v3 > 1937007733)
  {
    BOOL v4 = v3 == 1952805485;
    int v5 = 1937007734;
  }

  else
  {
    BOOL v4 = v3 == 1936092513;
    int v5 = 1936092532;
  }

  if (v4 || v3 == v5) {
    return 1LL;
  }
  return result;
}

BOOL sub_3884(uint64_t a1, int *a2)
{
  int v2 = *a2;
  return *a2 == 1885762592 || v2 == 1936092532 || v2 == 1935762292;
}

uint64_t sub_38B8(uint64_t a1, int *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t result = 0LL;
  int v5 = *a2;
  if (*a2 > 1935894637)
  {
    if (v5 <= 1936092531)
    {
      if (v5 == 1935894638 || v5 == 1935960434) {
        return 4LL;
      }
      if (v5 != 1936092513) {
        return result;
      }
      return 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 32) + 56LL)) / 0x38uLL);
    }

    if (v5 != 1936092532)
    {
      if (v5 == 1937007734) {
        return 4LL;
      }
      int v7 = 1952805485;
LABEL_21:
      if (v5 != v7) {
        return result;
      }
      return 4LL;
    }

    return 40LL;
  }

  if (v5 > 1885762591)
  {
    if (v5 != 1885762592)
    {
      if (v5 != 1885762657)
      {
        int v7 = 1935762292;
        goto LABEL_21;
      }

      return 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 32) + 56LL)) / 0x38uLL);
    }

    return 40LL;
  }

  if (v5 != 1650682995 && v5 != 1668047219)
  {
    int v7 = 1819569763;
    goto LABEL_21;
  }

  return 4LL;
}

uint64_t sub_3A04(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, int *a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  int v12 = *a2;
  uint64_t result = 2003332927LL;
  if (*a2 <= 1935894637)
  {
    if (v12 <= 1885762591)
    {
      switch(v12)
      {
        case 1650682995:
          *a6 = 4;
          if (a5 >= 4)
          {
            uint64_t result = 0LL;
            int v14 = 1634689642;
            goto LABEL_37;
          }

          break;
        case 1668047219:
          *a6 = 4;
          if (a5 >= 4)
          {
            uint64_t result = 0LL;
            int v14 = 1634956402;
            goto LABEL_37;
          }

          break;
        case 1819569763:
          int v14 = *(_DWORD *)(DerivedStorage + 20);
          *a6 = 4;
          if (a5 >= 4)
          {
            uint64_t result = 0LL;
LABEL_37:
            *a7 = v14;
            return result;
          }

          break;
        default:
          return result;
      }

      return 561211770LL;
    }

    if (v12 != 1885762592)
    {
      if (v12 != 1885762657)
      {
        if (v12 != 1935762292) {
          return result;
        }
        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t result = 0LL;
          int v14 = *(unsigned __int8 *)(DerivedStorage + 24);
          goto LABEL_37;
        }

        return 561211770LL;
      }

LABEL_23:
      size_t v15 = 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 32) + 56LL)) / 0x38uLL);
      *a6 = v15;
      if (v15 <= a5)
      {
        BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(void *)(DerivedStorage + 32) + 56LL));
        memcpy(a7, BytePtr, v15);
        return 0LL;
      }

      return 561211770LL;
    }

  FigHALAudioConfigChangeDisposeRecord(v17);
  return v14;
}

      uint64_t v17 = 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 64) + 56LL)) / 0x38uLL);
      *a6 = v17;
      if (v17 <= a5)
      {
        BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(void *)(DerivedStorage + 64) + 56LL));
        memcpy(a7, BytePtr, v17);
        return 0LL;
      }

      return 561211770LL;
    }

LABEL_25:
    *a6 = 40;
    if (a5 >= 0x28)
    {
      uint64_t result = 0LL;
      uint64_t v17 = *(void *)(DerivedStorage + 32);
      __int128 v18 = *(_OWORD *)(v17 + 16);
      __int128 v19 = *(_OWORD *)(v17 + 32);
      *((void *)a7 + 4) = *(void *)(v17 + 48);
      *(_OWORD *)a7 = v18;
      *((_OWORD *)a7 + 1) = v19;
      return result;
    }

    return 561211770LL;
  }

  if (v12 > 1936092531)
  {
    if (v12 != 1936092532)
    {
      if (v12 == 1937007734)
      {
        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t result = 0LL;
          int v14 = *(_DWORD *)(DerivedStorage + 16);
          goto LABEL_37;
        }
      }

      else
      {
        if (v12 != 1952805485) {
          return result;
        }
        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t result = 0LL;
          int v14 = 1936747378;
          goto LABEL_37;
        }
      }

      return 561211770LL;
    }

    goto LABEL_25;
  }

  switch(v12)
  {
    case 1935894638:
      *a6 = 4;
      if (a5 >= 4)
      {
        uint64_t result = 0LL;
        int v14 = 1;
        goto LABEL_37;
      }

      return 561211770LL;
    case 1935960434:
      *a6 = 4;
      if (a5 >= 4)
      {
        uint64_t result = 0LL;
        *a7 = 0;
        return result;
      }

      return 561211770LL;
    case 1936092513:
      goto LABEL_23;
  }

  return result;
}

    *a6 = 40;
    if (a5 >= 0x28)
    {
      uint64_t result = 0LL;
      __int128 v19 = *(void *)(DerivedStorage + 64);
      CFTypeRef v20 = *(_OWORD *)(v19 + 16);
      uint64_t v21 = *(_OWORD *)(v19 + 32);
      *((void *)a7 + 4) = *(void *)(v19 + 48);
      *(_OWORD *)a7 = v20;
      *((_OWORD *)a7 + 1) = v21;
      return result;
    }

    return 561211770LL;
  }

  if (v12 > 1936092531)
  {
    if (v12 != 1936092532)
    {
      if (v12 == 1937007734)
      {
        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t result = 0LL;
          uint64_t v16 = *(_DWORD *)(DerivedStorage + 16);
          goto LABEL_37;
        }

        return 561211770LL;
      }

      if (v12 != 1952805485) {
        return result;
      }
      *a6 = 4;
      if (a5 < 4) {
        return 561211770LL;
      }
      uint64_t result = 0LL;
      uint64_t v16 = 1936747378;
      goto LABEL_37;
    }

    goto LABEL_25;
  }

  switch(v12)
  {
    case 1935894638:
      *a6 = 4;
      if (a5 >= 4)
      {
        uint64_t result = 0LL;
        uint64_t v16 = 1;
        goto LABEL_37;
      }

      return 561211770LL;
    case 1935960434:
      *a6 = 4;
      if (a5 >= 4)
      {
        uint64_t result = 0LL;
        *a7 = 0;
        return result;
      }

      return 561211770LL;
    case 1936092513:
      goto LABEL_23;
  }

  return result;
}

uint64_t sub_3CC4(uint64_t a1, unsigned int *a2, uint64_t a3, uint64_t a4, int a5, __int128 *a6)
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage(a1);
  uint64_t v24 = 0LL;
  if (dword_14070 <= 40 && (dword_14070 != -1 || _LogCategory_Initialize(&dword_14070, 33554472LL))) {
    LogPrintF( &dword_14070,  "OSStatus handoffStream_SetPropertyData(FigHALAudioObjectRef, const AudioObjectPropertyAddress *, UInt32, const voi d *, UInt32, const void *)",  33554472LL,  "[%s] mSelector = %C\n",  "handoffStream_SetPropertyData",  *a2);
  }
  unsigned int v10 = *a2;
  if (*a2 != 1885762592 && v10 != 1936092532)
  {
    if (v10 != 1935762292)
    {
      uint64_t v17 = 0LL;
      uint64_t v14 = 2003332927LL;
      goto LABEL_23;
    }

    if (a5 == 4)
    {
      int v18 = *(_DWORD *)a6 != 0;
      if (*((unsigned __int8 *)DerivedStorage + 24) != v18)
      {
        *((_BYTE *)DerivedStorage + 24) = v18;
        FigHALAudioPropertySendChanges(*((void *)DerivedStorage + 1), *DerivedStorage, 1LL, a2);
      }

      goto LABEL_18;
    }

    uint64_t v14 = 561211770LL;
    uint64_t v19 = 284LL;
LABEL_22:
    APSLogErrorAt(561211770LL, "handoffStream_SetPropertyData", v19, 0LL);
    uint64_t v17 = 0LL;
    goto LABEL_23;
  }

  if (a5 != 40)
  {
    uint64_t v14 = 561211770LL;
    uint64_t v19 = 305LL;
    goto LABEL_22;
  }

  __int128 v12 = a6[1];
  __int128 __s1 = *a6;
  __int128 v22 = v12;
  uint64_t v23 = *((void *)a6 + 4);
  if (!memcmp(&__s1, (const void *)(*((void *)DerivedStorage + 4) + 16LL), 0x28uLL))
  {
LABEL_18:
    uint64_t v17 = 0LL;
    uint64_t v14 = 0LL;
    goto LABEL_23;
  }

  uint64_t v13 = FigHALAudioConfigChangeCreateRecord(*DerivedStorage, a2, &v24);
  uint64_t v14 = v13;
  if ((_DWORD)v13)
  {
    APSLogErrorAt(v13, "handoffStream_SetPropertyData", 309LL, 0LL);
    uint64_t v17 = v24;
  }

  else
  {
    uint64_t v15 = v24;
    __int128 v16 = v22;
    *(_OWORD *)(v24 + 16) = __s1;
    *(_OWORD *)(v15 + 32) = v16;
    *(void *)(v15 + 48) = v23;
    FigHALAudioConfigChangeSendRequest(*((void *)DerivedStorage + 1), DerivedStorage[4], 1718579821LL);
    uint64_t v17 = 0LL;
    uint64_t v24 = 0LL;
  }

uint64_t sub_3EDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (a2 == 1718579821)
  {
    uint64_t v6 = (unsigned int *)DerivedStorage;
    uint64_t v7 = *(void *)(DerivedStorage + 32);
    __int128 v8 = *(_OWORD *)(a3 + 16);
    __int128 v9 = *(_OWORD *)(a3 + 32);
    *(void *)(v7 + 48) = *(void *)(a3 + 48);
    *(_OWORD *)(v7 + 16) = v8;
    *(_OWORD *)(v7 + 32) = v9;
    if (dword_14070 <= 40 && (dword_14070 != -1 || _LogCategory_Initialize(&dword_14070, 33554472LL))) {
      LogPrintF( &dword_14070,  "OSStatus handoffStream_PerformConfigChange(FigHALAudioDeviceRef, UInt64, void *)",  33554472LL,  "[%s] mSampleRate = %f, mFormatID = %C\n",  "handoffStream_PerformConfigChange",  *(double *)(*((void *)v6 + 4) + 16LL),  *(unsigned int *)(*((void *)v6 + 4) + 24LL));
    }
    FigHALAudioPropertySendChanges(*((void *)v6 + 1), *v6, 1LL, a3 + 4);
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v10 = FigSignalErrorAt(1852797029LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  FigHALAudioConfigChangeDisposeRecord(a3);
  return v10;
}

uint64_t sub_4004(uint64_t a1)
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage(a1);
  if (dword_14070 <= 40 && (dword_14070 != -1 || _LogCategory_Initialize(&dword_14070, 33554472LL))) {
    LogPrintF( &dword_14070,  "OSStatus handoffStream_StartIO(FigHALAudioStreamRef)",  33554472LL,  "inStream %{ptr} [objectID %d], storage->isActive %d",  a1,  *DerivedStorage,  *((unsigned __int8 *)DerivedStorage + 24));
  }
  if (*((_BYTE *)DerivedStorage + 24)) {
    *(void *)(*((void *)DerivedStorage + 4) + 136LL) = 0LL;
  }
  return 0LL;
}

uint64_t sub_40AC(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (dword_14070 <= 40)
  {
    int v3 = (unsigned int *)DerivedStorage;
    if (dword_14070 != -1 || _LogCategory_Initialize(&dword_14070, 33554472LL)) {
      LogPrintF( &dword_14070,  "OSStatus handoffStream_StopIO(FigHALAudioStreamRef)",  33554472LL,  "inStream %{ptr} [objectID %d], storage->isActive %d",  a1,  *v3,  *((unsigned __int8 *)v3 + 24));
    }
  }

  return 0LL;
}

uint64_t sub_4144(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage(a1);
  if (dword_14070 <= 40 && (dword_14070 != -1 || _LogCategory_Initialize(&dword_14070, 33554472LL))) {
    LogPrintF( &dword_14070,  "OSStatus handoffStream_DoIOOperation(FigHALAudioStreamRef, UInt32, UInt32, const AudioServerPlugInIOCycleInfo *, void *, void *)",  33554472LL,  "inStream %{ptr} [objectID %d], storage->isActive %d",  a1,  *DerivedStorage,  *((unsigned __int8 *)DerivedStorage + 24));
  }
  uint64_t v9 = *((void *)DerivedStorage + 4);
  if (*(_BYTE *)(v9 + 200))
  {
    if (a2 == 1919513701)
    {
      uint64_t result = 0LL;
      *(double *)(v9 + 136) = *(double *)(a4 + 144) + (double)a3;
    }

    else
    {
      APSLogErrorAt(0LL, "handoffStream_DoIOOperation", 380LL, 0LL);
      return FigSignalErrorAt(1970171760LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    }
  }

  else
  {
    APSLogErrorAt(0LL, "handoffStream_DoIOOperation", 379LL, 0LL);
    return 1937010544LL;
  }

  return result;
}

uint64_t sub_429C(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v4 = DerivedStorage;
  if (a2)
  {
    uint64_t v5 = *(void *)(DerivedStorage + 32);
    __int128 v6 = *(_OWORD *)(v5 + 16);
    __int128 v7 = *(_OWORD *)(v5 + 32);
    *(void *)(a2 + 32) = *(void *)(v5 + 48);
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v7;
  }

  if (dword_14070 <= 40 && (dword_14070 != -1 || _LogCategory_Initialize(&dword_14070, 33554472LL))) {
    LogPrintF( &dword_14070,  "OSStatus handoffStream_GetCurrentFormat(FigHALAudioStreamRef, AudioStreamBasicDescription *)",  33554472LL,  "[%s] mSampleRate = %f, mFormatID = %C\n",  "handoffStream_GetCurrentFormat",  *(double *)(*(void *)(v4 + 32) + 16LL),  *(unsigned int *)(*(void *)(v4 + 32) + 24LL));
  }
  return 0LL;
}

uint64_t sub_435C(uint64_t a1, uint64_t a2, int a3, const void *a4, uint64_t a5, const void *a6, CFTypeRef *a7)
{
  CFTypeRef cf = 0LL;
  int v38 = 0;
  uint64_t v14 = kdebug_trace(722863680LL, 0LL, 0LL, 0LL, 0LL);
  uint64_t ClassID = FigHALAudioStreamGetClassID(v14);
  uint64_t v16 = CMDerivedObjectCreate(a1, &unk_10868, ClassID, &cf);
  if ((_DWORD)v16)
  {
    uint64_t v32 = v16;
    uint64_t v35 = 1007LL;
    goto LABEL_39;
  }

  uint64_t v16 = FigHALAudioObjectMapperAddMapping(a2, cf, &v38);
  if ((_DWORD)v16)
  {
    uint64_t v32 = v16;
    uint64_t v35 = 1010LL;
    goto LABEL_39;
  }

  if (a4)
  {
    uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListeners(DefaultLocalCenter, cf, &off_10890, 1LL, a4, 0LL, 0LL);
  }

  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(cf);
  uint64_t v19 = DerivedStorage;
  *(_DWORD *)uint64_t DerivedStorage = v38;
  *(_DWORD *)(DerivedStorage + 16) = a3;
  *(void *)(DerivedStorage + 8) = a5;
  if (a4)
  {
    CFTypeRef v20 = CFRetain(a4);
    *(void *)(v19 + 24) = v20;
    uint64_t v21 = v19 + 32;
    if (v20)
    {
      APSGetFBOPropertyCMTime(&v36, v20, kAPEndpointStreamAudioEngineProperty_OutputLatency, 0LL);
      *(_OWORD *)uint64_t v21 = v36;
      CMTimeEpoch epoch = v37;
      goto LABEL_10;
    }
  }

  else
  {
    *(void *)(DerivedStorage + 24) = 0LL;
    uint64_t v21 = DerivedStorage + 32;
  }

  *(_OWORD *)uint64_t v21 = *(_OWORD *)&kCMTimeInvalid.value;
  CMTimeEpoch epoch = kCMTimeInvalid.epoch;
LABEL_10:
  *(void *)(v21 + 16) = epoch;
  *(void *)(v19 + 64) = CFRetain(a6);
  *(_BYTE *)(v19 + 56) = 1;
  DefaultAirPlayMallocZoneCFAllocator = (const __CFAllocator *)APSAllocatorGetDefaultAirPlayMallocZoneCFAllocator();
  uint64_t v24 = CFAllocatorAllocate(DefaultAirPlayMallocZoneCFAllocator, 2048LL, 0LL);
  *(void *)(v19 + 96) = v24;
  if (!v24)
  {
    APSLogErrorAt(0LL, "APHALAudioStreamCreate", 1027LL, 0LL);
    uint64_t v32 = 4294954510LL;
    goto LABEL_30;
  }

  bzero(v24, 0x800uLL);
  unsigned __int8 IntWithDefault = APSSettingsGetIntWithDefault(@"enableNonZeroPCMSampleDetection", 0LL);
  *(_WORD *)(v19 + 80) = IntWithDefault;
  if (IntWithDefault)
  {
    uint64_t v16 = CM8021ASClockCreate(kCFAllocatorDefault, v19 + 88);
    if ((_DWORD)v16)
    {
      uint64_t v32 = v16;
      uint64_t v35 = 1037LL;
      goto LABEL_39;
    }
  }

  if ((unint64_t)CFDataGetLength(*(CFDataRef *)(*(void *)(v19 + 64) + 56LL)) < 0x38)
  {
    APSLogErrorAt(0LL, "InitializeDefaultOutputFormat", 978LL, 0LL);
    uint64_t v16 = FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    if (!(_DWORD)v16) {
      goto LABEL_18;
    }
    uint64_t v32 = v16;
    uint64_t v35 = 1042LL;
LABEL_39:
    APSLogErrorAt(v16, "APHALAudioStreamCreate", v35, 0LL);
    goto LABEL_30;
  }

  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(void *)(v19 + 64) + 56LL));
  uint64_t v27 = *(void *)(v19 + 64);
  __int128 v28 = *(_OWORD *)BytePtr;
  __int128 v29 = *((_OWORD *)BytePtr + 1);
  *(void *)(v27 + 48) = *((void *)BytePtr + 4);
  *(_OWORD *)(v27 + 16) = v28;
  *(_OWORD *)(v27 + 32) = v29;
  uint64_t v30 = *(void *)(v19 + 64);
  *(void *)(v30 + 16) = *((void *)BytePtr + 5);
  if (dword_140E0 > 50) {
    goto LABEL_18;
  }
  if (dword_140E0 != -1) {
    goto LABEL_16;
  }
  if (_LogCategory_Initialize(&dword_140E0, 33554482LL))
  {
    uint64_t v30 = *(void *)(v19 + 64);
LABEL_16:
    LogPrintF( &dword_140E0,  "OSStatus InitializeDefaultOutputFormat(APHALAudioStreamStorage *)",  33554482LL,  "Initialize default output format [%{asbd}]",  v30 + 16);
  }

LABEL_18:
  uint64_t v31 = APSSettingsGetIntWithDefault(@"HALStreamAudioTapEnabled", 0LL);
  if ((_DWORD)v31)
  {
    uint64_t v31 = IsAppleInternalBuild();
    *(_BYTE *)(v19 + 72) = (_DWORD)v31 != 0;
    if ((_DWORD)v31)
    {
      uint64_t v31 = APRealTimeAudioFileWriterCreate(0LL, *(void *)(v19 + 64) + 16LL, 0LL, *(void *)(v19 + 64) + 80LL);
      uint64_t v32 = v31;
      if (dword_140E0 <= 50)
      {
        if (dword_140E0 != -1 || (uint64_t v31 = _LogCategory_Initialize(&dword_140E0, 33554482LL), (_DWORD)v31)) {
          uint64_t v31 = LogPrintF( &dword_140E0,  "OSStatus APHALAudioStreamCreate(CFAllocatorRef, FigHALAudioObjectMapper, AudioObjectID, FigEndpointStr eamAudioEngineRef, AudioServerPlugInHostRef, APHALAudioSharedStateRef, FigHALAudioStreamRef *)",  33554482LL,  "File writer [%{ptr}] created with error:%#m for APHALAudioStream.",  *(void *)(*(void *)(v19 + 64) + 80LL),  v32);
        }
      }
    }

    else
    {
      uint64_t v32 = 0LL;
    }
  }

  else
  {
    uint64_t v32 = 0LL;
    *(_BYTE *)(v19 + 72) = 0;
  }

  APSAsyncLoggerGetSharedLogger(v31);
  CFTypeRef v33 = cf;
  *a7 = cf;
  CFTypeRef cf = 0LL;
  if (dword_140E0 <= 40)
  {
    if (dword_140E0 != -1)
    {
LABEL_28:
      LogPrintF( &dword_140E0,  "OSStatus APHALAudioStreamCreate(CFAllocatorRef, FigHALAudioObjectMapper, AudioObjectID, FigEndpointStreamAudioEn gineRef, AudioServerPlugInHostRef, APHALAudioSharedStateRef, FigHALAudioStreamRef *)",  33554472LL,  "APHALAudioStreamCreate - outstream %p, [streamObjectID %d, ownerDeviceID %d, audioEngine %p]",  v33,  *(_DWORD *)v19,  *(_DWORD *)(v19 + 16),  a4);
      goto LABEL_30;
    }

    if (_LogCategory_Initialize(&dword_140E0, 33554472LL))
    {
      CFTypeRef v33 = *a7;
      goto LABEL_28;
    }

LABEL_30:
    if (cf) {
      CFRelease(cf);
    }
  }

  return v32;
}

void sub_47B8(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v3 = kdebug_trace(722863684LL, 0LL, 0LL, 0LL, 0LL);
  if (*(void *)(DerivedStorage + 24))
  {
    uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(v3);
    FigNotificationCenterRemoveWeakListeners(DefaultLocalCenter, a1, &off_10890, 1LL, *(void *)(DerivedStorage + 24));
    uint64_t v5 = *(const void **)(DerivedStorage + 24);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(DerivedStorage + 24) = 0LL;
    }
  }

  __int128 v6 = *(CFTypeRef **)(DerivedStorage + 64);
  if (*(_BYTE *)(DerivedStorage + 72))
  {
    APRealTimeAudioFileWriterInvalidate(v6[10]);
    __int128 v6 = *(CFTypeRef **)(DerivedStorage + 64);
    if (v6[10])
    {
      CFRelease(v6[10]);
      __int128 v6 = *(CFTypeRef **)(DerivedStorage + 64);
      v6[10] = 0LL;
    }

    goto LABEL_8;
  }

  if (v6)
  {
LABEL_8:
    CFRelease(v6);
    *(void *)(DerivedStorage + 64) = 0LL;
  }

  if (*(_BYTE *)(DerivedStorage + 80))
  {
    __int128 v7 = *(const void **)(DerivedStorage + 88);
    if (v7)
    {
      CFRelease(v7);
      *(void *)(DerivedStorage + 88) = 0LL;
    }
  }

  *(_WORD *)(DerivedStorage + 80) = 0;
  if (*(void *)(DerivedStorage + 96))
  {
    DefaultAirPlayMallocZoneCFAllocator = (const __CFAllocator *)APSAllocatorGetDefaultAirPlayMallocZoneCFAllocator();
    CFAllocatorDeallocate(DefaultAirPlayMallocZoneCFAllocator, *(void **)(DerivedStorage + 96));
  }

  if (*(void *)(DerivedStorage + 104))
  {
    APSAudioStats_TerminateSession();
    if (dword_140E0 <= 50 && (dword_140E0 != -1 || _LogCategory_Initialize(&dword_140E0, 33554482LL))) {
      LogPrintF( &dword_140E0,  "void stream_Finalize(CMBaseObjectRef)",  33554482LL,  "Stats: %@",  *(void *)(DerivedStorage + 104));
    }
    uint64_t v9 = *(const void **)(DerivedStorage + 104);
    if (v9)
    {
      CFRelease(v9);
      *(void *)(DerivedStorage + 104) = 0LL;
    }
  }

CFStringRef sub_4920(uint64_t a1)
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage(a1);
  return CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"APHALAudioStream ID %d Owner %d AudioEngine %p AudioSource %p",  *DerivedStorage,  DerivedStorage[4],  *((void *)DerivedStorage + 3),  *(void *)(*((void *)DerivedStorage + 8) + 128LL));
}

uint64_t sub_4978(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (a4)
  {
    uint64_t v7 = DerivedStorage;
    if (CFEqual(a2, kFigHALAudioStreamProperty_SupportedPCMFormats))
    {
      __int128 v8 = *(const void **)(*(void *)(v7 + 64) + 56LL);
      if (v8) {
        CFTypeRef v9 = CFRetain(v8);
      }
      else {
        CFTypeRef v9 = 0LL;
      }
      uint64_t result = 0LL;
      *a4 = v9;
    }

    else
    {
      return 4294954509LL;
    }
  }

  else
  {
    APSLogErrorAt(0LL, "stream_CopyProperty", 163LL, 0LL);
    return 4294954516LL;
  }

  return result;
}

uint64_t sub_4A10(uint64_t a1)
{
  return *(unsigned int *)CMBaseObjectGetDerivedStorage(a1);
}

uint64_t sub_4A28(uint64_t a1, int *a2)
{
  uint64_t result = 0LL;
  int v3 = *a2;
  if (*a2 <= 1935762291)
  {
    if (v3 > 1870098019)
    {
      BOOL v4 = v3 == 1870098020 || v3 == 1885762592;
      int v5 = 1885762657;
    }

    else
    {
      BOOL v4 = v3 == 1650682995 || v3 == 1668047219;
      int v5 = 1819569763;
    }
  }

  else if (v3 <= 1936092512)
  {
    BOOL v4 = v3 == 1935762292 || v3 == 1935894638;
    int v5 = 1935960434;
  }

  else if (v3 > 1937007733)
  {
    BOOL v4 = v3 == 1952805485;
    int v5 = 1937007734;
  }

  else
  {
    BOOL v4 = v3 == 1936092513;
    int v5 = 1936092532;
  }

  if (v4 || v3 == v5) {
    return 1LL;
  }
  return result;
}

BOOL sub_4B18(uint64_t a1, int *a2)
{
  int v2 = *a2;
  return *a2 == 1885762592 || v2 == 1936092532 || v2 == 1935762292;
}

uint64_t sub_4B4C(uint64_t a1, int *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t result = 0LL;
  int v5 = *a2;
  if (*a2 > 1935894637)
  {
    if (v5 <= 1936092531)
    {
      if (v5 == 1935894638 || v5 == 1935960434) {
        return 4LL;
      }
      if (v5 != 1936092513) {
        return result;
      }
      return 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 64) + 56LL)) / 0x38uLL);
    }

    if (v5 != 1936092532)
    {
      if (v5 == 1937007734) {
        return 4LL;
      }
      int v7 = 1952805485;
LABEL_21:
      if (v5 != v7) {
        return result;
      }
      return 4LL;
    }

    return 40LL;
  }

  if (v5 > 1885762591)
  {
    if (v5 != 1885762592)
    {
      if (v5 != 1885762657)
      {
        int v7 = 1935762292;
        goto LABEL_21;
      }

      return 56 * (CFDataGetLength(*(CFDataRef *)(*(void *)(DerivedStorage + 64) + 56LL)) / 0x38uLL);
    }

    return 40LL;
  }

  if (v5 != 1650682995 && v5 != 1668047219)
  {
    int v7 = 1819569763;
    goto LABEL_21;
  }

  return 4LL;
}

uint64_t sub_4C98(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, int *a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  int v12 = *a2;
  uint64_t result = 2003332927LL;
  if (*a2 <= 1935894637)
  {
    if (v12 <= 1885762591)
    {
      if (v12 != 1650682995)
      {
        if (v12 != 1668047219)
        {
          if (v12 != 1819569763) {
            return result;
          }
          int32_t v14 = (int)*(double *)(*(void *)(DerivedStorage + 64) + 16LL);
          CMTime v22 = *(CMTime *)(DerivedStorage + 32);
          CMTimeConvertScale(&v23, &v22, v14, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          if ((v23.flags & 0x1D) == 1)
          {
            int value = v23.value;
          }

          else
          {
            if (dword_140E0 <= 50
              && (dword_140E0 != -1 || _LogCategory_Initialize(&dword_140E0, 33554482LL)))
            {
              LogPrintF( &dword_140E0,  "OSStatus stream_GetPropertyData(FigHALAudioObjectRef, const AudioObjectPropertyAddress *, UInt32, const void *, UInt32, UInt32 *, void *)",  33554482LL,  "Failed converting output latency. Using 0");
            }

            int value = kCMTimeZero.value;
          }

          *a6 = 4;
          if (a5 >= 4)
          {
            uint64_t result = 0LL;
            *a7 = value;
            return result;
          }

          return 561211770LL;
        }

        *a6 = 4;
        if (a5 >= 4)
        {
          uint64_t result = 0LL;
          int v16 = 1634956402;
          goto LABEL_37;
        }

        return 561211770LL;
      }

      *a6 = 4;
      if (a5 < 4) {
        return 561211770LL;
      }
      uint64_t result = 0LL;
      int v16 = 1634689642;
LABEL_37:
      *a7 = v16;
      return result;
    }

    if (v12 != 1885762592)
    {
      if (v12 != 1885762657)
      {
        if (v12 != 1935762292) {
          return result;
        }
        *a6 = 4;
        if (a5 < 4) {
          return 561211770LL;
        }
        uint64_t result = 0LL;
        int v16 = *(unsigned __int8 *)(DerivedStorage + 56);
        goto LABEL_37;
      }

uint64_t sub_500C(uint64_t a1, unsigned int *a2, uint64_t a3, uint64_t a4, int a5, __int128 *a6)
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage(a1);
  uint64_t v26 = 0LL;
  if (dword_140E0 <= 40 && (dword_140E0 != -1 || _LogCategory_Initialize(&dword_140E0, 33554472LL))) {
    LogPrintF( &dword_140E0,  "OSStatus stream_SetPropertyData(FigHALAudioObjectRef, const AudioObjectPropertyAddress *, UInt32, const void *, UI nt32, const void *)",  33554472LL,  "[%s] mSelector = %C\n",  "stream_SetPropertyData",  *a2);
  }
  unsigned int v10 = *a2;
  if (*a2 != 1885762592 && v10 != 1936092532)
  {
    if (v10 != 1935762292)
    {
      uint64_t v18 = 0LL;
      uint64_t v19 = 2003332927LL;
      goto LABEL_27;
    }

    if (a5 == 4)
    {
      int v17 = *(_DWORD *)a6 != 0;
      if (*((unsigned __int8 *)DerivedStorage + 56) != v17)
      {
        *((_BYTE *)DerivedStorage + 56) = v17;
        FigHALAudioPropertySendChanges(*((void *)DerivedStorage + 1), *DerivedStorage, 1LL, a2);
      }

      goto LABEL_20;
    }

    uint64_t v19 = 561211770LL;
    uint64_t v20 = 368LL;
LABEL_24:
    APSLogErrorAt(561211770LL, "stream_SetPropertyData", v20, 0LL);
    uint64_t v18 = 0LL;
    goto LABEL_27;
  }

  if (a5 != 40)
  {
    uint64_t v19 = 561211770LL;
    uint64_t v20 = 389LL;
    goto LABEL_24;
  }

  __int128 v12 = a6[1];
  __int128 __s1 = *a6;
  __int128 v24 = v12;
  uint64_t v25 = *((void *)a6 + 4);
  if (!memcmp(&__s1, (const void *)(*((void *)DerivedStorage + 8) + 16LL), 0x28uLL))
  {
LABEL_20:
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
    goto LABEL_27;
  }

  uint64_t v13 = FigHALAudioConfigChangeCreateRecord(*DerivedStorage, a2, &v26);
  if ((_DWORD)v13)
  {
    uint64_t v19 = v13;
    APSLogErrorAt(v13, "stream_SetPropertyData", 393LL, 0LL);
    uint64_t v18 = v26;
  }

  else
  {
    uint64_t v15 = v25;
    uint64_t v14 = v26;
    __int128 v16 = v24;
    *(_OWORD *)(v26 + 16) = __s1;
    *(_OWORD *)(v14 + 32) = v16;
    *(void *)(v14 + 48) = v15;
    if (dword_140E0 <= 50)
    {
      if (dword_140E0 != -1 || (v21 = _LogCategory_Initialize(&dword_140E0, 33554482LL), uint64_t v14 = v26, v21)) {
        LogPrintF( &dword_140E0,  "OSStatus stream_SetPropertyData(FigHALAudioObjectRef, const AudioObjectPropertyAddress *, UInt32, const void * , UInt32, const void *)",  33554482LL,  "[%s] newASBD: [%{asbd}] \n",  "stream_SetPropertyData",  v14 + 16);
      }
    }

    FigHALAudioConfigChangeSendRequest(*((void *)DerivedStorage + 1), DerivedStorage[4], 1718579821LL);
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
    uint64_t v26 = 0LL;
  }

LABEL_27:
  FigHALAudioConfigChangeDisposeRecord(v18);
  return v19;
}

uint64_t sub_5294(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage(a1);
  uint64_t v7 = *((void *)DerivedStorage + 3);
  if (!v7)
  {
    APSLogErrorAt(0LL, "stream_PerformConfigChange", 447LL, 0LL);
    uint64_t v13 = 1970171760LL;
    goto LABEL_11;
  }

  if (a2 == 1818326115)
  {
    APSGetFBOPropertyCMTime(&v19, v7, kAPEndpointStreamAudioEngineProperty_OutputLatency, 0LL);
    if (dword_140E0 <= 50 && (dword_140E0 != -1 || _LogCategory_Initialize(&dword_140E0, 33554482LL)))
    {
      CMTime time = *(CMTime *)(DerivedStorage + 8);
      Float64 Seconds = CMTimeGetSeconds(&time);
      CMTime time = v19;
      Float64 v12 = CMTimeGetSeconds(&time);
      LogPrintF( &dword_140E0,  "OSStatus stream_PerformConfigChange(FigHALAudioDeviceRef, UInt64, void *)",  33554482LL,  "[%{ptr}] latency changed from %1.3f to %1.3f\n",  a1,  *(void *)&Seconds,  *(void *)&v12);
    }

    *(CMTime *)(DerivedStorage + 8) = v19;
    FigHALAudioPropertySendChanges(*((void *)DerivedStorage + 1), *DerivedStorage, 1LL, a3 + 4);
    goto LABEL_21;
  }

  if (a2 != 1718579821)
  {
    uint64_t v13 = 1852797029LL;
LABEL_11:
    uint64_t v14 = FigSignalErrorAt(v13, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    goto LABEL_22;
  }

  uint64_t v8 = *((void *)DerivedStorage + 8);
  __int128 v9 = *(_OWORD *)(a3 + 16);
  __int128 v10 = *(_OWORD *)(a3 + 32);
  *(void *)(v8 + 48) = *(void *)(a3 + 48);
  *(_OWORD *)(v8 + 16) = v9;
  *(_OWORD *)(v8 + 32) = v10;
  if (dword_140E0 <= 50 && (dword_140E0 != -1 || _LogCategory_Initialize(&dword_140E0, 33554482LL))) {
    LogPrintF( &dword_140E0,  "OSStatus stream_PerformConfigChange(FigHALAudioDeviceRef, UInt64, void *)",  33554482LL,  "[%s] mSampleRate = %f. mFormatID = %C. prevailingASBD: [%{asbd}]\n",  "stream_PerformConfigChange",  *(void *)(*((void *)DerivedStorage + 8) + 16LL),  *(unsigned int *)(*((void *)DerivedStorage + 8) + 24LL),  *((void *)DerivedStorage + 8) + 16LL);
  }
  FigHALAudioPropertySendChanges(*((void *)DerivedStorage + 1), *DerivedStorage, 1LL, a3 + 4);
  if (!*((_BYTE *)DerivedStorage + 72))
  {
LABEL_21:
    uint64_t v14 = 0LL;
    goto LABEL_22;
  }

  APRealTimeAudioFileWriterInvalidate(*(void *)(*((void *)DerivedStorage + 8) + 80LL));
  uint64_t v15 = *((void *)DerivedStorage + 8);
  __int128 v16 = *(const void **)(v15 + 80);
  if (v16)
  {
    CFRelease(v16);
    uint64_t v15 = *((void *)DerivedStorage + 8);
    *(void *)(v15 + 80) = 0LL;
  }

  uint64_t v14 = APRealTimeAudioFileWriterCreate(0LL, v15 + 16, 0LL, v15 + 80);
  if (dword_140E0 <= 50 && (dword_140E0 != -1 || _LogCategory_Initialize(&dword_140E0, 33554482LL))) {
    LogPrintF( &dword_140E0,  "OSStatus stream_PerformConfigChange(FigHALAudioDeviceRef, UInt64, void *)",  33554482LL,  "File writer [%{ptr}] created with error:%#m for APHALAudioStream.",  *(void *)(*((void *)DerivedStorage + 8) + 80LL),  v14);
  }
LABEL_22:
  FigHALAudioConfigChangeDisposeRecord(a3);
  return v14;
}

uint64_t sub_5578(uint64_t a1)
{
  unsigned int v7 = 0;
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage(a1);
  uint64_t v3 = kdebug_trace(722863688LL, 0LL, 0LL, 0LL, 0LL);
  if (*((void *)DerivedStorage + 3))
  {
    if (dword_140E0 <= 40)
    {
      if (dword_140E0 != -1 || (uint64_t v3 = _LogCategory_Initialize(&dword_140E0, 33554472LL), (_DWORD)v3)) {
        uint64_t v3 = LogPrintF( &dword_140E0,  "OSStatus stream_StartIO(FigHALAudioStreamRef)",  33554472LL,  "inStream %{ptr} [objectID %d], storage->isActive %d",  a1,  *DerivedStorage,  *((unsigned __int8 *)DerivedStorage + 56));
      }
    }

    if (*((_BYTE *)DerivedStorage + 56))
    {
      *(void *)(*((void *)DerivedStorage + 8) + 136LL) = 0LL;
      if (IsAppleInternalBuild(v3))
      {
        if (FigGetCFPreferenceNumberWithDefault( @"enableSilenceDetection",  @"com.apple.airplay",  1LL))
        {
          BOOL v4 = (const void *)CFStringCreateF(&v7, "APHALAudioStream-%{ptr}", a1);
          uint64_t v5 = APSAudioStatsCreate(v4, *((void *)DerivedStorage + 8) + 88LL, 0LL, 1LL, 3LL, DerivedStorage + 26);
          unsigned int v7 = v5;
          if ((_DWORD)v5) {
            APSLogErrorAt(v5, "stream_StartIO", 505LL, 0LL);
          }
          else {
            CFRelease(v4);
          }
        }
      }
    }
  }

  else
  {
    APSLogErrorAt(0LL, "stream_StartIO", 493LL, 0LL);
    unsigned int v7 = FigSignalErrorAt(1970171760LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  kdebug_trace(722863692LL, 0LL, 0LL, 0LL, 0LL);
  return v7;
}

uint64_t sub_5738(uint64_t a1)
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage(a1);
  kdebug_trace(722863712LL, 0LL, 0LL, 0LL, 0LL);
  if (dword_140E0 <= 40 && (dword_140E0 != -1 || _LogCategory_Initialize(&dword_140E0, 33554472LL))) {
    LogPrintF( &dword_140E0,  "OSStatus stream_StopIO(FigHALAudioStreamRef)",  33554472LL,  "inStream %{ptr} [objectID %d], storage->isActive %d",  a1,  *DerivedStorage,  *((unsigned __int8 *)DerivedStorage + 56));
  }
  if (*((void *)DerivedStorage + 13))
  {
    APSAudioStats_TerminateSession();
    if (dword_140E0 <= 50 && (dword_140E0 != -1 || _LogCategory_Initialize(&dword_140E0, 33554482LL))) {
      LogPrintF( &dword_140E0,  "OSStatus stream_StopIO(FigHALAudioStreamRef)",  33554482LL,  "Stats: %@",  *((void *)DerivedStorage + 13));
    }
    uint64_t v3 = (const void *)*((void *)DerivedStorage + 13);
    if (v3)
    {
      CFRelease(v3);
      *((void *)DerivedStorage + 13) = 0LL;
    }
  }

  kdebug_trace(722863716LL, 0LL, 0LL, 0LL, 0LL);
  return 0LL;
}

uint64_t sub_588C(CMTimeValue a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage(a1);
  __int128 v87 = *(_OWORD *)&kCMTimeInvalid.value;
  *(_OWORD *)&v88.int value = *(_OWORD *)&kCMTimeInvalid.value;
  CMTimeEpoch epoch = kCMTimeInvalid.epoch;
  v88.CMTimeEpoch epoch = epoch;
  kdebug_trace(722863696LL, 0LL, 0LL, 0LL, 0LL);
  if (dword_140E0 <= 40 && (dword_140E0 != -1 || _LogCategory_Initialize(&dword_140E0, 33554472LL))) {
    LogPrintF( &dword_140E0,  "OSStatus stream_DoIOOperation(FigHALAudioStreamRef, UInt32, UInt32, const AudioServerPlugInIOCycleInfo *, void *, void *)",  33554472LL,  "inStream %{ptr} [objectID %d], storage->isActive %d",  a1,  *DerivedStorage,  *((unsigned __int8 *)DerivedStorage + 56));
  }
  uint64_t v11 = *((void *)DerivedStorage + 8);
  if (!*(_BYTE *)(v11 + 200))
  {
    APSLogErrorAt(0LL, "stream_DoIOOperation", 803LL, 0LL);
    uint64_t v42 = 1937010544LL;
    goto LABEL_47;
  }

  if (a2 != 1919513701)
  {
    uint64_t v83 = 804LL;
LABEL_88:
    APSLogErrorAt(0LL, "stream_DoIOOperation", v83, 0LL);
    uint64_t v42 = FigSignalErrorAt(1970171760LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    goto LABEL_47;
  }

  if (!*((void *)DerivedStorage + 3))
  {
    uint64_t v83 = 805LL;
    goto LABEL_88;
  }

  if (!*((_BYTE *)DerivedStorage + 56))
  {
    uint64_t v42 = 0LL;
LABEL_47:
    kdebug_trace(722863700LL, 0LL, 0LL, 0LL, 0LL);
    return v42;
  }

  uint64_t v12 = *((void *)DerivedStorage + 13);
  if (v12)
  {
    uint64_t v12 = APSAudioStats_ProcessAudioBuffer(v12, a5, (*(_DWORD *)(v11 + 160) * a3));
    uint64_t v11 = *((void *)DerivedStorage + 8);
  }

  if (*(void *)(v11 + 80))
  {
    v91.int value = a1;
    v91.timescale = *(_DWORD *)(v11 + 160) * a3;
    v91.CMTimeEpoch epoch = *(void *)(a4 + 144);
    uint64_t SharedLogger = APSAsyncLoggerGetSharedLogger(v12);
    APSAsyncLoggerLogMessage(SharedLogger, sub_6260, &v91);
    APRealTimeAudioFileWriterWriteAudioBytes( *(void *)(*((void *)DerivedStorage + 8) + 80LL),  a5,  (*(_DWORD *)(*((void *)DerivedStorage + 8) + 160LL) * a3),  (unint64_t)*(double *)(a4 + 144));
  }

  uint64_t v14 = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v15 = v14;
  double v16 = *(double *)(a4 + 144);
  uint64_t v17 = CMBaseObjectGetDerivedStorage(a1);
  memset(&v93, 0, sizeof(v93));
  memset(time, 0, sizeof(time));
  uint64_t v18 = *(void *)(v17 + 64);
  double v19 = v16 - *(double *)(v18 + 136);
  if (v19 == 0.0) {
    goto LABEL_42;
  }
  uint64_t v20 = v17;
  int v21 = (unint64_t *)(v18 + 144);
  do
    unint64_t v22 = __ldxr(v21);
  while (__stxr(v22 + 1, v21));
  v91.int value = a1;
  uint64_t v23 = *(void *)(v17 + 64);
  *(double *)&v91.timescale = v19 / *(double *)(v23 + 16) * 1000.0;
  *(double *)&v91.CMTimeEpoch epoch = v16;
  double v92 = *(double *)(v23 + 136);
  uint64_t v24 = APSAsyncLoggerGetSharedLogger(v17);
  APSAsyncLoggerLogMessage(v24, sub_62FC, &v91);
  if (*(void *)(*(void *)(v20 + 64) + 72LL))
  {
    if ((unint64_t)((uint64_t (*)(void))APSRingBufferGetBytesUsed)() >= 0x121)
    {
      uint64_t v25 = *(void *)(*(void *)(v20 + 64) + 72LL);
      uint64_t BytesUsed = APSRingBufferGetBytesUsed(v25);
    }

    uint64_t v27 = 12LL;
    do
    {
      uint64_t v28 = APSRingBufferDequeueBytes(*(void *)(*(void *)(v20 + 64) + 72LL), 24LL, &v93);
      if ((_DWORD)v28) {
        goto LABEL_25;
      }
      *(void *)CMTime time = a1;
      *(CMTime *)&time[8] = v93;
      uint64_t v29 = APSAsyncLoggerGetSharedLogger(v28);
      APSAsyncLoggerLogMessage(v29, sub_639C, time);
      --v27;
    }

    while (v27);
  }

  kdebug_trace( 722863720LL,  (uint64_t)*(double *)&v91.timescale,  (unint64_t)*(double *)&v91.epoch,  (unint64_t)v92,  0LL);
LABEL_25:
  uint64_t v30 = *(void *)(v15 + 64);
  if (*(void *)(v30 + 64)) {
    goto LABEL_42;
  }
  double v31 = v19 / *(double *)(v30 + 16);
  if (v31 <= 0.0 || v31 >= 3.94)
  {
    if (v19 >= 0.0 || -v19 >= (double)a3)
    {
      unint64_t v41 = 0LL;
      *(_BYTE *)(v30 + 152) = 1;
    }

    else
    {
      unint64_t v41 = (unint64_t)-v19;
    }

    goto LABEL_45;
  }

  unsigned int v32 = v19;
  if (!v19)
  {
LABEL_42:
    unint64_t v41 = 0LL;
    goto LABEL_45;
  }

  uint64_t v84 = a4;
  unsigned int v85 = a3;
  unint64_t v33 = (unint64_t)*(double *)(v30 + 136);
  while (1)
  {
    uint64_t v34 = *(void *)(v15 + 64);
    unsigned int v35 = *(_DWORD *)(v34 + 160);
    unsigned int v36 = v32 >= 0x800 / v35 ? 0x800 / v35 : v32;
    uint64_t v37 = *(void *)(v34 + 128);
    uint64_t v38 = *(void *)(v15 + 96);
    CFDataRef v39 = *(uint64_t (**)(uint64_t, uint64_t, void, unint64_t))(*(void *)(CMBaseObjectGetVTable(v37)
                                                                                           + 16)
                                                                               + 64LL);
    if (!v39) {
      break;
    }
    uint64_t v40 = v39(v37, v38, v36 * v35, v33);
    if ((_DWORD)v40) {
      goto LABEL_44;
    }
    v33 += v36;
    v32 -= v36;
    if (!v32)
    {
      unint64_t v41 = 0LL;
      a3 = v85;
      a4 = v84;
      goto LABEL_45;
    }
  }

  uint64_t v40 = 4294954514LL;
LABEL_44:
  a4 = v84;
  APSLogErrorAt(v40, "stream_handleDoIODiscontinuity", 702LL, 0LL);
  unint64_t v41 = 0LL;
  *(_BYTE *)(*(void *)(v15 + 64) + 152LL) = 1;
  a3 = v85;
LABEL_45:
  uint64_t v43 = *((void *)DerivedStorage + 8);
  uint64_t v44 = *(void *)(v43 + 64);
  if (v44)
  {
    FigHALAudioConduitDeviceHALSendAudio(v44, a5, (*(_DWORD *)(v43 + 160) * a3), a4 + 144, a3);
    uint64_t v42 = 0LL;
    *(double *)(*((void *)DerivedStorage + 8) + 136LL) = *(double *)(a4 + 144) + (double)a3;
    goto LABEL_47;
  }

  uint64_t v46 = CMBaseObjectGetDerivedStorage(a1);
  *(_OWORD *)&v91.int value = v87;
  v91.CMTimeEpoch epoch = epoch;
  v47 = (unsigned __int8 *)(*(void *)(v46 + 64) + 152LL);
  do
    unsigned __int8 v48 = __ldxr(v47);
  while (__stxr(0, v47));
  if ((v48 & 1) != 0)
  {
    unsigned int v49 = (const __CFAllocator *)((uint64_t (*)(void))APSRealTimeAllocatorGetDefault)();
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v49, 2LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      v51 = Mutable;
      int v52 = CMTimeMake(&v91, (uint64_t)*(double *)(a4 + 144), *(_DWORD *)(*(void *)(v46 + 64) + 164LL));
      Default = (const __CFAllocator *)APSRealTimeAllocatorGetDefault(v52);
      *(CMTime *)CMTime time = v91;
      CFDictionaryRef v54 = CMTimeCopyAsDictionary((CMTime *)time, Default);
      if (v54)
      {
        CFDictionaryRef v55 = v54;
        CFDictionarySetValue(v51, kFigEndpointStreamAudioEngineFlushOption_AnchorTime, v54);
        CFDictionarySetValue(v51, kFigEndpointStreamAudioEngineFlushOption_TimelineReset, kCFBooleanTrue);
        uint64_t v56 = *(void *)(*(void *)(v46 + 64) + 128LL);
        v57 = *(void (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v56) + 16) + 128LL);
        if (v57) {
          v57(v56);
        }
        uint64_t v58 = *(void *)(v46 + 24);
        uint64_t v59 = *(void (**)(uint64_t, __CFDictionary *))(*(void *)(CMBaseObjectGetVTable(v58) + 16) + 32LL);
        if (v59) {
          v59(v58, v51);
        }
        CFRelease(v51);
        CFRelease(v55);
        unint64_t v41 = 0LL;
      }

      else
      {
        APSLogErrorAt(0LL, "stream_handleDoIOFlush", 746LL, 0LL);
        CFRelease(v51);
      }
    }

    else
    {
      APSLogErrorAt(0LL, "stream_handleDoIOFlush", 741LL, 0LL);
    }
  }

  uint64_t v60 = *((void *)DerivedStorage + 8);
  if (*(double *)(v60 + 136) == 0.0)
  {
    int v61 = CMTimeMake(&v88, (uint64_t)*(double *)(a4 + 144), *(_DWORD *)(v60 + 164));
    uint64_t v62 = (const __CFAllocator *)APSRealTimeAllocatorGetDefault(v61);
    CMTime v91 = v88;
    CFDictionaryRef v63 = CMTimeCopyAsDictionary(&v91, v62);
    if (!v63)
    {
      APSLogErrorAt(0LL, "stream_DoIOOperation", 863LL, 0LL);
      uint64_t v42 = 4294954510LL;
      goto LABEL_47;
    }

    CFDictionaryRef v64 = v63;
    uint64_t CMBaseObject = FigEndpointStreamAudioEngineGetCMBaseObject(*((void *)DerivedStorage + 3));
    uint64_t v66 = *(uint64_t (**)(uint64_t, void, CFDictionaryRef))(*(void *)(CMBaseObjectGetVTable(CMBaseObject)
                                                                                 + 8)
                                                                     + 56LL);
    if (v66)
    {
      uint64_t v67 = v66(CMBaseObject, kAPAudioEngineProperty_AudioSourceFirstFrameAnchorTime, v64);
      if (!(_DWORD)v67)
      {
        uint64_t v60 = *((void *)DerivedStorage + 8);
        goto LABEL_65;
      }

      uint64_t v42 = v67;
    }

    else
    {
      uint64_t v42 = 4294954514LL;
    }

    APSLogErrorAt(v42, "stream_DoIOOperation", 866LL, 0LL);
    kdebug_trace(722863700LL, 0LL, 0LL, 0LL, 0LL);
LABEL_84:
    CFRelease(v64);
    return v42;
  }

  CFDictionaryRef v64 = 0LL;
LABEL_65:
  double v68 = *(double *)(a4 + 144);
  *(double *)(v60 + 136) = v68 + (double)a3;
  unsigned int v69 = *(_DWORD *)(v60 + 160);
  unint64_t v70 = v69 * a3;
  if (*((_BYTE *)DerivedStorage + 80))
  {
    uint64_t v71 = CMBaseObjectGetDerivedStorage(a1);
    v94[0] = 0.0;
    *(_OWORD *)CMTime time = *(_OWORD *)&kCMTimeZero.value;
    *(void *)&time[16] = kCMTimeZero.epoch;
    CMTime v93 = *(CMTime *)time;
    if (v70 >= 8 && *(_BYTE *)(v71 + 81) == 0)
    {
      uint64_t v73 = v71;
      unint64_t v74 = v70 >> 3;
      v75 = a5;
      while (!*v75)
      {
        ++v75;
        if (!--v74) {
          goto LABEL_78;
        }
      }

      *(_BYTE *)(v71 + 81) = 1;
      HostTimeClock = CMClockGetHostTimeClock();
      CMClockGetTime((CMTime *)time, HostTimeClock);
      uint64_t v77 = *(void *)(v73 + 88);
      CMTime v91 = *(CMTime *)time;
      CM8021ASClockGetClockTimeForHostTime(&v93, v77, &v91, v94);
      v91.int value = *(void *)(v73 + 88);
      CMTime v90 = *(CMTime *)time;
      *(void *)&v91.timescale = CMTimeGetSeconds(&v90);
      CMTime v90 = v93;
      v91.CMTimeEpoch epoch = CMTimeGetSeconds(&v90);
      double v92 = v94[0];
      uint64_t v79 = APSAsyncLoggerGetSharedLogger(v78);
      APSAsyncLoggerLogMessage(v79, sub_6440, &v91);
    }

LABEL_78:
    uint64_t v60 = *((void *)DerivedStorage + 8);
    unsigned int v69 = *(_DWORD *)(v60 + 160);
  }

  unint64_t v80 = v41 * v69;
  if (v70 < v80)
  {
    APSLogErrorAt(0LL, "stream_DoIOOperation", 882LL, 0LL);
    uint64_t v42 = 4294960587LL;
  }

  else
  {
    uint64_t v81 = *(void *)(v60 + 128);
    if (v82) {
      uint64_t v42 = v82(v81, (char *)a5 + v80, v70 - v80, v41 + (unint64_t)v68);
    }
    else {
      uint64_t v42 = 4294954514LL;
    }
  }

  kdebug_trace(722863700LL, 0LL, 0LL, 0LL, 0LL);
  if (v64) {
    goto LABEL_84;
  }
  return v42;
}

      *a6 = 8;
      if (a5 >= 8)
      {
        uint64_t v20 = (const __CFString *)v13[3];
        if (!v20) {
          goto LABEL_84;
        }
        goto LABEL_83;
      }

      return 561211770LL;
    }

uint64_t sub_61A0(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v4 = DerivedStorage;
  if (a2)
  {
    uint64_t v5 = *(void *)(DerivedStorage + 64);
    __int128 v6 = *(_OWORD *)(v5 + 16);
    __int128 v7 = *(_OWORD *)(v5 + 32);
    *(void *)(a2 + 32) = *(void *)(v5 + 48);
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v7;
  }

  if (dword_140E0 <= 40 && (dword_140E0 != -1 || _LogCategory_Initialize(&dword_140E0, 33554472LL))) {
    LogPrintF( &dword_140E0,  "OSStatus stream_GetCurrentFormat(FigHALAudioStreamRef, AudioStreamBasicDescription *)",  33554472LL,  "[%s] mSampleRate = %f, mFormatID = %C\n",  "stream_GetCurrentFormat",  *(double *)(*(void *)(v4 + 64) + 16LL),  *(unsigned int *)(*(void *)(v4 + 64) + 24LL));
  }
  return 0LL;
}

uint64_t sub_6260(uint64_t result, double a2)
{
  if (dword_140E0 <= 40)
  {
    uint64_t v3 = result;
    if (dword_140E0 != -1) {
      return LogPrintF( &dword_140E0,  "void stream_recordIOToFileLogger(const APSAsyncLoggerParameters *, Float64)",  33554472LL,  "[%{ptr}] Recording frames to file. frames: %d; sampleTime: %1.3f; (log latency: %1.3f ms)\n",
    }
               *(void *)v3,
               *(unsigned int *)(v3 + 8),
               *(void *)(v3 + 16),
               *(void *)&a2);
    uint64_t result = _LogCategory_Initialize(&dword_140E0, 33554472LL);
    if ((_DWORD)result) {
      return LogPrintF( &dword_140E0,  "void stream_recordIOToFileLogger(const APSAsyncLoggerParameters *, Float64)",  33554472LL,  "[%{ptr}] Recording frames to file. frames: %d; sampleTime: %1.3f; (log latency: %1.3f ms)\n",
    }
               *(void *)v3,
               *(unsigned int *)(v3 + 8),
               *(void *)(v3 + 16),
               *(void *)&a2);
  }

  return result;
}

uint64_t sub_62FC(uint64_t result, double a2)
{
  if (dword_140E0 <= 50)
  {
    uint64_t v3 = (void *)result;
    if (dword_140E0 != -1) {
      return LogPrintF( &dword_140E0,  "void stream_discontinuityLogger(const APSAsyncLoggerParameters *, Float64)",  33554482LL,  "[%{ptr}] IODiscontinuity: %1.3f ms. Frame expected: %1.3f; got: %1.3f. (log latency: %1.3f ms)\n",
    }
               *v3,
               v3[1],
               v3[2],
               v3[3],
               *(void *)&a2);
    uint64_t result = _LogCategory_Initialize(&dword_140E0, 33554482LL);
    if ((_DWORD)result) {
      return LogPrintF( &dword_140E0,  "void stream_discontinuityLogger(const APSAsyncLoggerParameters *, Float64)",  33554482LL,  "[%{ptr}] IODiscontinuity: %1.3f ms. Frame expected: %1.3f; got: %1.3f. (log latency: %1.3f ms)\n",
    }
               *v3,
               v3[1],
               v3[2],
               v3[3],
               *(void *)&a2);
  }

  return result;
}

uint64_t sub_639C(uint64_t result, double a2)
{
  if (dword_140E0 <= 50)
  {
    uint64_t v3 = (void *)result;
    if (dword_140E0 != -1) {
      return LogPrintF( &dword_140E0,  "void stream_zeroTimeStampLogger(const APSAsyncLoggerParameters *, Float64)",  33554482LL,  "[%{ptr}] ZTS Info. NowTicks: %lu SampleTime: %1.3f HostTime: %lu (log latency: %1.3f ms)",  *v3,  v3[1],  v3[2],  v3[3],  *(void *)&a2);
    }
    uint64_t result = _LogCategory_Initialize(&dword_140E0, 33554482LL);
    if ((_DWORD)result) {
      return LogPrintF( &dword_140E0,  "void stream_zeroTimeStampLogger(const APSAsyncLoggerParameters *, Float64)",  33554482LL,  "[%{ptr}] ZTS Info. NowTicks: %lu SampleTime: %1.3f HostTime: %lu (log latency: %1.3f ms)",  *v3,  v3[1],  v3[2],  v3[3],  *(void *)&a2);
    }
  }

  return result;
}

uint64_t sub_6440(uint64_t result, double a2)
{
  if (dword_140E0 <= 50)
  {
    uint64_t v3 = result;
    if (dword_140E0 != -1) {
      return LogPrintF( &dword_140E0,  "void stream_logger(const APSAsyncLoggerParameters *, Float64)",  33554482LL,  "Event: 'Detected non-zero PCM sample'. clock <%p> converted HostTime %f to NetworkTime %f using GM 0x%016 llx. (log latency: %1.3f ms)\n",  *(const void **)v3,  *(double *)(v3 + 8),  *(double *)(v3 + 16),  *(void *)(v3 + 24),  a2);
    }
    uint64_t result = _LogCategory_Initialize(&dword_140E0, 33554482LL);
    if ((_DWORD)result) {
      return LogPrintF( &dword_140E0,  "void stream_logger(const APSAsyncLoggerParameters *, Float64)",  33554482LL,  "Event: 'Detected non-zero PCM sample'. clock <%p> converted HostTime %f to NetworkTime %f using GM 0x%016 llx. (log latency: %1.3f ms)\n",  *(const void **)v3,  *(double *)(v3 + 8),  *(double *)(v3 + 16),  *(void *)(v3 + 24),  a2);
    }
  }

  return result;
}

uint64_t sub_64E4(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage(a2);
  uint64_t v9 = 0LL;
  if (dword_140E0 <= 50 && (dword_140E0 != -1 || _LogCategory_Initialize(&dword_140E0, 33554482LL))) {
    LogPrintF( &dword_140E0,  "void stream_AudioEngineOutputLatencyChanged(CMNotificationCenterRef, const void *, CFStringRef, const void *, CFTypeRef)",  33554482LL,  "[%{ptr}] received LatencyChanged notification from AudioEngine [%{ptr}], reconfiguring...\n",  a2,  *((void *)DerivedStorage + 3));
  }
  uint64_t v4 = *DerivedStorage;
  uint64_t v7 = 0x676C6F626C746E63LL;
  int v8 = 0;
  uint64_t v5 = FigHALAudioConfigChangeCreateRecord(v4, &v7, &v9);
  if ((_DWORD)v5) {
    return APSLogErrorAt(v5, "stream_AudioEngineOutputLatencyChanged", 432LL, 0LL);
  }
  else {
    return FigHALAudioConfigChangeSendRequest(*((void *)DerivedStorage + 1), DerivedStorage[4], 1818326115LL);
  }
}

uint64_t *APHALPlugin_Create(uint64_t a1, const void *a2)
{
  if (APSIsRemoteHALPluginLoadingEnabled())
  {
    off_14150 = 0LL;
  }

  CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x44u,  0x3Au,  0xBAu,  0xB8u,  0xE7u,  0xB3u,  0x49u,  0x1Au,  0xB9u,  0x85u,  0xBEu,  0xB9u,  0x18u,  0x70u,  0x30u,  0xDBu);
  if (!CFEqual(a2, v4)) {
    return 0LL;
  }
  uint64_t v5 = &qword_142A8;
  qword_142A8 = FigHALPluginDriverGetInterface();
  uint64_t BrokeredPluginObjectWithSpecialInstantiator = FigHALAudioObjectMapperCreate(&qword_142B4);
  if ((_DWORD)BrokeredPluginObjectWithSpecialInstantiator)
  {
    uint64_t v8 = 106LL;
LABEL_11:
    APSLogErrorAt(BrokeredPluginObjectWithSpecialInstantiator, "APHALPlugin_Create", v8, 0LL);
    return 0LL;
  }

  uint64_t BrokeredPluginObjectWithSpecialInstantiator = FigHALAudioCreateBrokeredPluginObjectWithSpecialInstantiator( a1,  kFigHALAudioDeviceBrokerType_AirPlay,  qword_142B4,  off_14150,  sub_7FE0,  sub_1888,  &unk_142BC);
  if ((_DWORD)BrokeredPluginObjectWithSpecialInstantiator)
  {
    uint64_t v8 = 113LL;
    goto LABEL_11;
  }

  FigAtomicIncrement32(&unk_142B0);
  return v5;
}

uint64_t sub_66F4(uint64_t a1, CFTypeRef *a2)
{
  CFTypeRef cf = 0LL;
  uint64_t v3 = LogSetAppID(@"com.apple.airplay");
  sub_CDD8(v3);
  uint64_t v4 = APGetEndpointManager(&cf);
  if (cf) {
    CFRetain(cf);
  }
  if ((_DWORD)v4)
  {
    APSLogErrorAt(v4, "apPlugin_InstantiateAirPlayEndpointManager", 69LL, 0LL);
    if (cf) {
      CFRelease(cf);
    }
  }

  else
  {
    *a2 = cf;
  }

  return v4;
}

uint64_t sub_677C(const __CFAllocator *a1, float a2, uint64_t a3, CFDataRef *a4)
{
  *(float *)bytes = a2;
  BOOL v9 = a2 <= -144.0;
  CFDataRef v5 = CFDataCreate(a1, bytes, 8LL);
  if (v5)
  {
    CFDataRef v6 = v5;
    uint64_t result = 0LL;
    *a4 = v6;
  }

  else
  {
    APSLogErrorAt(0LL, "APHALAudioControlCreateVolumeContext", 77LL, 0LL);
    return FigSignalErrorAt(4294954510LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  return result;
}

uint64_t sub_6810(uint64_t a1, uint64_t a2, uint64_t a3, int a4, const void *a5, const void *a6, CFTypeRef *a7)
{
  CFTypeRef cf = 0LL;
  int v23 = 0;
  uint64_t ClassID = FigHALAudioObjectGetClassID();
  uint64_t v15 = CMDerivedObjectCreate(a1, &unk_109A0, ClassID, &cf);
  if ((_DWORD)v15)
  {
    uint64_t v20 = v15;
    uint64_t v22 = 426LL;
  }

  else
  {
    uint64_t v15 = FigHALAudioObjectMapperAddMapping(a2, cf, &v23);
    if (!(_DWORD)v15)
    {
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(cf);
      *(void *)uint64_t DerivedStorage = a3;
      *(_DWORD *)(DerivedStorage + 8) = v23;
      *(_DWORD *)(DerivedStorage + 12) = a4;
      if (a5) {
        CFTypeRef v17 = CFRetain(a5);
      }
      else {
        CFTypeRef v17 = 0LL;
      }
      *(void *)(DerivedStorage + 24) = v17;
      if (a6) {
        CFTypeRef v18 = CFRetain(a6);
      }
      else {
        CFTypeRef v18 = 0LL;
      }
      *(void *)(DerivedStorage + 16) = v18;
      uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(v18);
      CMNotificationCenterAddListener( DefaultLocalCenter,  cf,  sub_69BC,  kFigEndpointNotification_VolumeDidChange,  a5,  0LL);
      if (dword_14158 <= 50 && (dword_14158 != -1 || _LogCategory_Initialize(&dword_14158, 33554482LL))) {
        LogPrintF( &dword_14158,  "OSStatus APHALAudioVolumeControlCreate(CFAllocatorRef, FigHALAudioObjectMapper, AudioServerPlugInHostRef, Audi oObjectID, FigEndpointRef, CFDataRef, FigHALAudioObjectRef *)",  33554482LL,  "[%{ptr}] HAL volumeControl object created for endpoint [%{ptr}]\n",  cf,  a5);
      }
      uint64_t v20 = 0LL;
      *a7 = cf;
      return v20;
    }

    uint64_t v20 = v15;
    uint64_t v22 = 429LL;
  }

  APSLogErrorAt(v15, "APHALAudioVolumeControlCreate", v22, 0LL);
  if (cf) {
    CFRelease(cf);
  }
  return v20;
}

void sub_69BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a2);
  BytePtr = (UInt8 *)CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  __int128 v15 = *(_OWORD *)"vdclbolg";
  uint64_t v16 = 1735159650LL;
  float v8 = APSGetFBOPropertyDouble(a4, kFigEndpointProperty_VolumeDB, 0LL);
  if (dword_14158 <= 40 && (dword_14158 != -1 || _LogCategory_Initialize(&dword_14158, 33554472LL)))
  {
    if (*((_DWORD *)BytePtr + 1)) {
      BOOL v9 = "YES";
    }
    else {
      BOOL v9 = "NO";
    }
    LogPrintF( &dword_14158,  "void volumeControl_DACPDeviceVolumeNotificationCallback(CMNotificationCenterRef, const void *, CFStringRef, const void *, CFTypeRef)",  33554472LL,  "isMuted = %s, newVolume = %f",  v9,  v8);
  }

  int v10 = *((_DWORD *)BytePtr + 1);
  if (v10) {
    BOOL v11 = v8 == -144.0;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    if (dword_14158 <= 50)
    {
      if (dword_14158 != -1)
      {
LABEL_14:
        if (v10) {
          uint64_t v12 = "yes";
        }
        else {
          uint64_t v12 = "no";
        }
        LogPrintF( &dword_14158,  "void volumeControl_DACPDeviceVolumeNotificationCallback(CMNotificationCenterRef, const void *, CFStringRef, co nst void *, CFTypeRef)",  33554482LL,  "[%{ptr}] volumeControl DACP callback: muted = %s; volume %.3f -> %.3f",
          a2,
          v12,
          *(float *)BytePtr,
          v8);
        goto LABEL_22;
      }

      if (_LogCategory_Initialize(&dword_14158, 33554482LL))
      {
        int v10 = *((_DWORD *)BytePtr + 1);
        goto LABEL_14;
      }
    }

LABEL_22:
    *(float *)BytePtr = v8;
    uint64_t v13 = FigHALAudioPropertySendChanges(*(void *)DerivedStorage, *(unsigned int *)(DerivedStorage + 8), 2LL, &v15);
    uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(v13);
    CMNotificationCenterPostNotification( DefaultLocalCenter,  @"VolumeChanged",  *(void *)(DerivedStorage + 16),  0LL,  0LL);
    return;
  }

  if (dword_14158 <= 50 && (dword_14158 != -1 || _LogCategory_Initialize(&dword_14158, 33554482LL))) {
    LogPrintF( &dword_14158,  "void volumeControl_DACPDeviceVolumeNotificationCallback(CMNotificationCenterRef, const void *, CFStringRef, const void *, CFTypeRef)",  33554482LL,  "[%{ptr}] We must have set mute on endpoint just now; Ignoring the resulting volume change notification.\n",
  }
      a2);
}

uint64_t sub_6C24(uint64_t a1, uint64_t a2, uint64_t a3, int a4, const void *a5, const void *a6, CFTypeRef *a7)
{
  CFTypeRef cf = 0LL;
  int v25 = 0;
  uint64_t ClassID = FigHALAudioObjectGetClassID();
  uint64_t v15 = CMDerivedObjectCreate(a1, &unk_109B8, ClassID, &cf);
  if ((_DWORD)v15)
  {
    uint64_t v22 = v15;
    uint64_t v24 = 713LL;
  }

  else
  {
    uint64_t v15 = FigHALAudioObjectMapperAddMapping(a2, cf, &v25);
    if (!(_DWORD)v15)
    {
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(cf);
      *(void *)uint64_t DerivedStorage = a3;
      *(_DWORD *)(DerivedStorage + 8) = v25;
      *(_DWORD *)(DerivedStorage + 12) = a4;
      if (a5) {
        CFTypeRef v17 = CFRetain(a5);
      }
      else {
        CFTypeRef v17 = 0LL;
      }
      *(void *)(DerivedStorage + 24) = v17;
      if (a6) {
        CFTypeRef v18 = CFRetain(a6);
      }
      else {
        CFTypeRef v18 = 0LL;
      }
      *(void *)(DerivedStorage + 16) = v18;
      uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(v18);
      uint64_t v20 = CMNotificationCenterAddListener( DefaultLocalCenter,  cf,  sub_6DF8,  @"VolumeChanged",  *(void *)(DerivedStorage + 16),  0LL);
      uint64_t v21 = CMNotificationCenterGetDefaultLocalCenter(v20);
      CMNotificationCenterAddListener( v21,  cf,  sub_6EF0,  kFigEndpointNotification_IsMutedByUserDidChange,  *(void *)(DerivedStorage + 24),  0LL);
      if (dword_14158 <= 50 && (dword_14158 != -1 || _LogCategory_Initialize(&dword_14158, 33554482LL))) {
        LogPrintF( &dword_14158,  "OSStatus APHALAudioMuteControlCreate(CFAllocatorRef, FigHALAudioObjectMapper, AudioServerPlugInHostRef, AudioO bjectID, FigEndpointRef, CFDataRef, FigHALAudioObjectRef *)",  33554482LL,  "[%{ptr}] HAL muteControl object created for endpoint [%{ptr}]\n",  cf,  *(void *)(DerivedStorage + 24));
      }
      uint64_t v22 = 0LL;
      *a7 = cf;
      return v22;
    }

    uint64_t v22 = v15;
    uint64_t v24 = 716LL;
  }

  APSLogErrorAt(v15, "APHALAudioMuteControlCreate", v24, 0LL);
  if (cf) {
    CFRelease(cf);
  }
  return v22;
}

const UInt8 *sub_6DF8(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a2);
  uint64_t result = CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  CFDataRef v5 = result;
  if (dword_14158 <= 50)
  {
    if (dword_14158 != -1
      || (uint64_t result = (const UInt8 *)_LogCategory_Initialize(&dword_14158, 33554482LL), (_DWORD)result))
    {
      if (*((_DWORD *)v5 + 1)) {
        CFDataRef v6 = "yes";
      }
      else {
        CFDataRef v6 = "no";
      }
      uint64_t result = (const UInt8 *)LogPrintF( &dword_14158,  "void muteControl_handleVolumeChanged(CMNotificationCenterRef, const void *, CFStringRef, const void *, CFTypeRef)",  33554482LL,  "[%{ptr}] muteControl: Volume changed: mute = %s; current volume is %.3f dB\n",
                                a2,
                                v6,
                                *(float *)v5);
    }
  }

  if (*((_DWORD *)v5 + 1))
  {
  }

  return result;
}

const UInt8 *sub_6EF0(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a2);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  uint64_t v5 = APSGetFBOPropertyInt64(*(void *)(DerivedStorage + 24), kAPEndpointProperty_IsHALMuted, 0LL);
  if (dword_14158 <= 50 && (dword_14158 != -1 || _LogCategory_Initialize(&dword_14158, 33554482LL)))
  {
    CFDataRef v6 = "yes";
    if (*((_DWORD *)BytePtr + 1)) {
      uint64_t v7 = "yes";
    }
    else {
      uint64_t v7 = "no";
    }
    if (!v5) {
      CFDataRef v6 = "no";
    }
    LogPrintF( &dword_14158,  "void muteControl_handleIsMutedChanged(CMNotificationCenterRef, const void *, CFStringRef, const void *, CFTypeRef)",  33554482LL,  "[%{ptr}] muteControl: endpoint IsMuted changed: %s -> %s; current volume is %.3f dB\n",
      a2,
      v7,
      v6,
      *(float *)BytePtr);
  }

  return sub_7EC8(a2, v5 != 0, 1735159650LL, 0LL);
}

void sub_6FF8(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v3 = DerivedStorage;
  if (*(void *)(DerivedStorage + 24))
  {
    uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(DerivedStorage);
    CMNotificationCenterRemoveListener( DefaultLocalCenter,  a1,  sub_69BC,  kFigEndpointNotification_VolumeDidChange,  *(void *)(v3 + 24));
    uint64_t CMBaseObject = FigEndpointGetCMBaseObject(*(void *)(v3 + 24));
    CFDataRef v6 = *(void **)(CMBaseObjectGetVTable(CMBaseObject) + 8);
    if (*v6 >= 2uLL)
    {
      uint64_t v7 = (void (*)(uint64_t))v6[8];
      if (v7) {
        v7(CMBaseObject);
      }
    }
  }

  float v8 = *(const void **)(v3 + 16);
  if (v8)
  {
    CFRelease(v8);
    *(void *)(v3 + 16) = 0LL;
  }

  BOOL v9 = *(const void **)(v3 + 24);
  if (v9)
  {
    CFRelease(v9);
    *(void *)(v3 + 24) = 0LL;
  }

CFStringRef sub_7098(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  if (*((_DWORD *)BytePtr + 1)) {
    uint64_t v3 = " MUTED";
  }
  else {
    uint64_t v3 = (const char *)&unk_EA29;
  }
  return CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"APAudioVolumeControl ID %d Owner %d VolumeDB %f%s",  *(unsigned int *)(DerivedStorage + 8),  *(unsigned int *)(DerivedStorage + 12),  *(float *)BytePtr,  v3);
}

uint64_t sub_711C(uint64_t a1)
{
  return *(unsigned int *)(CMBaseObjectGetDerivedStorage(a1) + 8);
}

uint64_t sub_7134(uint64_t a1, int *a2)
{
  uint64_t result = 0LL;
  int v3 = *a2;
  if (*a2 <= 1818453105)
  {
    if (v3 > 1668047218)
    {
      BOOL v8 = v3 == 1668047219;
      int v9 = 1668506480;
    }

    else
    {
      BOOL v8 = v3 == 1650682995;
      int v9 = 1667591277;
    }

    goto LABEL_16;
  }

  if (v3 > 1818456931)
  {
    BOOL v8 = v3 == 1818456932 || v3 == 1937007734;
    int v9 = 1818456950;
LABEL_16:
    if (v8 || v3 == v9) {
      return 1LL;
    }
    return result;
  }

  unsigned int v4 = v3 - 1818453106;
  BOOL v5 = v4 > 4;
  int v6 = (1 << v4) & 0x13;
  if (!v5 && v6 != 0) {
    return 1LL;
  }
  return result;
}

BOOL sub_71F8(uint64_t a1, _DWORD *a2)
{
  return *a2 == 1818456950 || *a2 == 1818453110;
}

uint64_t sub_7218(uint64_t a1, int *a2)
{
  int v2 = *a2;
  if (*a2 > 1818453106)
  {
    if (v2 <= 1818456931)
    {
      if (v2 != 1818453107 && v2 != 1818453110) {
        return 0LL;
      }
      return 4LL;
    }

    if (v2 == 1818456932 || v2 == 1818456950) {
      return 4LL;
    }
    int v6 = 1937007734;
LABEL_18:
    if (v2 == v6) {
      return 4LL;
    }
    else {
      return 0LL;
    }
  }

  if (v2 <= 1668047218)
  {
    if (v2 == 1650682995) {
      return 4LL;
    }
    int v6 = 1667591277;
    goto LABEL_18;
  }

  if (v2 == 1668047219) {
    return 4LL;
  }
  if (v2 == 1818453106) {
    unsigned int v3 = 16;
  }
  else {
    unsigned int v3 = 0;
  }
  if (v2 == 1668506480) {
    return 4LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_7304(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, int *a7)
{
  unsigned int v26 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  int v13 = *a2;
  if (*a2 <= 1818453106)
  {
    if (v13 <= 1668047218)
    {
      if (v13 != 1650682995)
      {
        if (v13 == 1667591277)
        {
          *a6 = 4;
          if (a5 >= 4)
          {
            unsigned int v14 = 0;
            *a7 = 0;
            return v14;
          }

          return 561211770;
        }

        return 2003332927;
      }

      *a6 = 4;
      if (a5 < 4) {
        return 561211770;
      }
      unsigned int v14 = 0;
      int v15 = 1818588780;
    }

    else
    {
      switch(v13)
      {
        case 1668047219:
          *a6 = 4;
          if (a5 < 4) {
            return 561211770;
          }
          unsigned int v14 = 0;
          int v15 = 1986817381;
          break;
        case 1668506480:
          *a6 = 4;
          if (a5 < 4) {
            return 561211770;
          }
          unsigned int v14 = 0;
          int v15 = 1869968496;
          break;
        case 1818453106:
          *a6 = 16;
          if (a5 >= 0x10)
          {
            unsigned int v14 = 0;
            *(_OWORD *)a7 = xmmword_D4F0;
            return v14;
          }

          return 561211770;
        default:
          return 2003332927;
      }
    }

LABEL_35:
    *a7 = v15;
    return v14;
  }

  if (v13 <= 1818456931)
  {
    if (v13 != 1818453107)
    {
      if (v13 != 1818453110) {
        return 2003332927;
      }
      if (*((_DWORD *)BytePtr + 1))
      {
        float v16 = -144.0;
      }

      else
      {
        double v24 = APSGetFBOPropertyDouble(*(void *)(DerivedStorage + 24), kFigEndpointProperty_VolumeDB, &v26);
        uint64_t v20 = v26;
        if (v26)
        {
          uint64_t v22 = 290LL;
          goto LABEL_49;
        }

        float v16 = v24;
      }

      *a6 = 4;
      if (a5 < 4)
      {
        unsigned int v26 = 561211770;
        uint64_t v20 = 561211770LL;
        uint64_t v22 = 294LL;
        goto LABEL_49;
      }

      goto LABEL_47;
    }

    if (a5 != 4)
    {
      unsigned int v26 = 561211770;
      uint64_t v20 = 561211770LL;
      uint64_t v22 = 314LL;
      goto LABEL_49;
    }

    float v23 = *(float *)a7;
    unsigned int v26 = 0;
    float v18 = APSVolumeConvertDBToSliderValue(BytePtr, v23);
  }

  else
  {
    if (v13 != 1818456932)
    {
      if (v13 != 1818456950)
      {
        if (v13 != 1937007734) {
          return 2003332927;
        }
        *a6 = 4;
        if (a5 < 4) {
          return 561211770;
        }
        unsigned int v14 = 0;
        int v15 = *(_DWORD *)(DerivedStorage + 12);
        goto LABEL_35;
      }

      float v16 = 0.0;
      if (!*((_DWORD *)BytePtr + 1))
      {
        double v19 = APSGetFBOPropertyDouble(*(void *)(DerivedStorage + 24), kFigEndpointProperty_VolumeDB, &v26);
        uint64_t v20 = v26;
        if (v26)
        {
          uint64_t v22 = 276LL;
          goto LABEL_49;
        }

        float v21 = v19;
        float v16 = APSVolumeConvertDBToSliderValue(0LL, v21);
      }

      *a6 = 4;
      if (a5 < 4)
      {
        unsigned int v26 = 561211770;
        uint64_t v20 = 561211770LL;
        uint64_t v22 = 282LL;
LABEL_49:
        APSLogErrorAt(v20, "volumeControl_GetPropertyData", v22, 0LL);
        return v26;
      }

LABEL_47:
      *(float *)a7 = v16;
      return 0;
    }

    if (a5 != 4)
    {
      unsigned int v26 = 561211770;
      uint64_t v20 = 561211770LL;
      uint64_t v22 = 307LL;
      goto LABEL_49;
    }

    float v17 = *(float *)a7;
    unsigned int v26 = 0;
    APSVolumeConvertSliderValueToDB(BytePtr, v17);
  }

  *a6 = 4;
  *(float *)a7 = v18;
  return v26;
}

uint64_t sub_7698(uint64_t a1, unsigned int *a2, uint64_t a3, uint64_t a4, int a5, float *a6)
{
  uint64_t v10 = 1818453110LL;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  BytePtr = (UInt8 *)CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  int v13 = BytePtr;
  unsigned int v14 = *a2;
  unsigned int v15 = a2[1];
  LODWORD(v22) = 1818453110;
  HIDWORD(v22) = v15;
  unsigned int v23 = a2[2];
  int v24 = 1818456950;
  unint64_t v25 = __PAIR64__(v23, v15);
  if (v14 == 1818453110)
  {
    if (a5 == 4)
    {
      float v18 = *a6;
      *(float *)BytePtr = *a6;
      if (dword_14158 <= 50)
      {
        if (dword_14158 == -1)
        {
          uint64_t v10 = *a2;
          float v18 = *(float *)v13;
        }

        LogPrintF( &dword_14158,  "OSStatus volumeControl_SetPropertyData(FigHALAudioObjectRef, const AudioObjectPropertyAddress *, UInt32, const void *, UInt32, const void *)",  33554482LL,  "[%{ptr}] [AirPlayVolume] selector = '%C', volumeDB = %.3f",  a1,  v10,  v18);
        goto LABEL_19;
      }

      goto LABEL_19;
    }

    uint64_t v19 = 561211770LL;
    uint64_t v20 = 359LL;
LABEL_15:
    APSLogErrorAt(561211770LL, "volumeControl_SetPropertyData", v20, 0LL);
    return v19;
  }

  if (v14 != 1818456950) {
    return 2003332927LL;
  }
  if (a5 != 4)
  {
    uint64_t v19 = 561211770LL;
    uint64_t v20 = 343LL;
    goto LABEL_15;
  }

  float v16 = *a6;
  APSVolumeConvertSliderValueToDB(BytePtr, *a6);
  *(float *)int v13 = v17;
  if (dword_14158 <= 50)
  {
    if (dword_14158 == -1)
    {
      float v17 = *(float *)v13;
    }

    LogPrintF( &dword_14158,  "OSStatus volumeControl_SetPropertyData(FigHALAudioObjectRef, const AudioObjectPropertyAddress *, UInt32, const voi d *, UInt32, const void *)",  33554482LL,  "[%{ptr}] [AirPlayVolume] selector = '%C', volumeDB = %.3f, volumeSliderValue = %.3f",  a1,  *a2,  v17,  v16,  v22);
  }

LABEL_19:
  if (*((_DWORD *)v13 + 1)) {
    uint64_t v19 = 0LL;
  }
  else {
    uint64_t v19 = APSSetFBOPropertyDouble(*(void *)(DerivedStorage + 24), kFigEndpointProperty_VolumeDB, *(float *)v13);
  }
  FigHALAudioPropertySendChanges(*(void *)DerivedStorage, *(unsigned int *)(DerivedStorage + 8), 2LL, &v22);
  return v19;
}

void sub_78FC(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v3 = DerivedStorage;
  if (dword_14158 <= 50)
  {
    if (dword_14158 != -1
      || (uint64_t DerivedStorage = _LogCategory_Initialize(&dword_14158, 33554482LL), (_DWORD)DerivedStorage))
    {
      uint64_t DerivedStorage = LogPrintF( &dword_14158,  "void muteControl_Finalize(CMBaseObjectRef)",  33554482LL,  "[%{ptr}] muteControl: finalizing\n",  a1);
    }
  }

  if (*(void *)(v3 + 16))
  {
    uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(DerivedStorage);
    uint64_t v5 = CMNotificationCenterRemoveListener( DefaultLocalCenter,  a1,  sub_6DF8,  @"VolumeChanged",  *(void *)(v3 + 16));
    uint64_t v6 = CMNotificationCenterGetDefaultLocalCenter(v5);
    CMNotificationCenterRemoveListener( v6,  a1,  sub_6EF0,  kFigEndpointNotification_IsMutedByUserDidChange,  *(void *)(v3 + 24));
    uint64_t CMBaseObject = FigEndpointGetCMBaseObject(*(void *)(v3 + 24));
    BOOL v8 = *(void **)(CMBaseObjectGetVTable(CMBaseObject) + 8);
    if (*v8 >= 2uLL)
    {
      int v9 = (void (*)(uint64_t))v8[8];
      if (v9) {
        v9(CMBaseObject);
      }
    }

    uint64_t v10 = *(const void **)(v3 + 16);
    if (v10)
    {
      CFRelease(v10);
      *(void *)(v3 + 16) = 0LL;
    }
  }

  BOOL v11 = *(const void **)(v3 + 24);
  if (v11)
  {
    CFRelease(v11);
    *(void *)(v3 + 24) = 0LL;
  }

CFStringRef sub_7A20(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (*((_DWORD *)CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16)) + 1)) {
    int v2 = (const char *)&unk_EA29;
  }
  else {
    int v2 = "Not ";
  }
  return CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"APAudioMuteControl ID %d Owner %d %sMuted",  *(unsigned int *)(DerivedStorage + 8),  *(unsigned int *)(DerivedStorage + 12),  v2);
}

uint64_t sub_7A98(uint64_t a1, int *a2)
{
  uint64_t result = 0LL;
  int v3 = *a2;
  if (*a2 > 1668047218)
  {
    BOOL v4 = v3 == 1668047219 || v3 == 1937007734;
    int v5 = 1668506480;
  }

  else
  {
    BOOL v4 = v3 == 1650682995 || v3 == 1650685548;
    int v5 = 1667591277;
  }

  if (v4 || v3 == v5) {
    return 1LL;
  }
  return result;
}

BOOL sub_7B04(uint64_t a1, _DWORD *a2)
{
  return *a2 == 1650685548;
}

uint64_t sub_7B1C(uint64_t a1, int *a2)
{
  int v2 = *a2;
  if (*a2 > 1668047218)
  {
    if (v2 != 1937007734 && v2 != 1668506480 && v2 != 1668047219) {
      return 0LL;
    }
    return 4LL;
  }

  if (v2 == 1650682995) {
    return 4LL;
  }
  if (v2 == 1667591277) {
    unsigned int v3 = 4;
  }
  else {
    unsigned int v3 = 0;
  }
  if (v2 == 1650685548) {
    return 4LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_7BAC(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, int *a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  int v12 = *a2;
  uint64_t result = 2003332927LL;
  if (*a2 > 1668047218)
  {
    if (v12 == 1668047219)
    {
      *a6 = 4;
      if (a5 > 3)
      {
        int v14 = 1836414053;
        goto LABEL_21;
      }

      return 561211770LL;
    }

    if (v12 == 1668506480)
    {
      *a6 = 4;
      if (a5 > 3)
      {
        int v14 = 1869968496;
        goto LABEL_21;
      }

      return 561211770LL;
    }

    if (v12 != 1937007734) {
      return result;
    }
    *a6 = 4;
    if (a5 < 4) {
      return 561211770LL;
    }
    unsigned int v15 = (const UInt8 *)(DerivedStorage + 12);
    goto LABEL_18;
  }

  if (v12 != 1650682995)
  {
    if (v12 != 1650685548)
    {
      if (v12 != 1667591277) {
        return result;
      }
      *a6 = 4;
      if (a5 > 3)
      {
        int v14 = 0;
LABEL_21:
        uint64_t result = 0LL;
        *a7 = v14;
        return result;
      }

      return 561211770LL;
    }

    *a6 = 4;
    if (a5 < 4) {
      return 561211770LL;
    }
    unsigned int v15 = CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16)) + 4;
LABEL_18:
    int v14 = *(_DWORD *)v15;
    goto LABEL_21;
  }

  *a6 = 4;
  if (a5 > 3)
  {
    int v14 = 1953458028;
    goto LABEL_21;
  }

  return 561211770LL;
}

uint64_t sub_7D18(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, int a5, int *a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  if (*a2 != 1650685548) {
    return 2003332927LL;
  }
  if (a5 == 4)
  {
    int v12 = *a6;
    if (v12 == *((_DWORD *)BytePtr + 1))
    {
LABEL_18:
      sub_7EC8(a1, v12, a2[1], a2[2]);
      return 0LL;
    }

    if (dword_14158 <= 50 && (dword_14158 != -1 || _LogCategory_Initialize(&dword_14158, 33554482LL)))
    {
      int v13 = "yes";
      if (!v12) {
        int v13 = "no";
      }
      LogPrintF( &dword_14158,  "OSStatus muteControl_SetPropertyData(FigHALAudioObjectRef, const AudioObjectPropertyAddress *, UInt32, const voi d *, UInt32, const void *)",  33554482LL,  "[%{ptr}] muteControl changing mute state to %s; setting IsHALMuted to %s.\n",
        a1,
        v13,
        v13);
    }

    uint64_t v17 = *(void *)(DerivedStorage + 24);
    float v18 = *(uint64_t (**)(uint64_t, void, CFBooleanRef))(*(void *)(CMBaseObjectGetVTable(v17) + 8) + 56LL);
    if (v18)
    {
      if (v12) {
        CFBooleanRef v19 = kCFBooleanTrue;
      }
      else {
        CFBooleanRef v19 = kCFBooleanFalse;
      }
      uint64_t v20 = v18(v17, kAPEndpointProperty_IsHALMuted, v19);
      if (!(_DWORD)v20) {
        goto LABEL_18;
      }
      uint64_t v14 = v20;
    }

    else
    {
      uint64_t v14 = 4294954514LL;
    }

    uint64_t v15 = v14;
    uint64_t v16 = 651LL;
  }

  else
  {
    uint64_t v14 = 561211770LL;
    uint64_t v15 = 561211770LL;
    uint64_t v16 = 646LL;
  }

  APSLogErrorAt(v15, "muteControl_SetPropertyData", v16, 0LL);
  return v14;
}

const UInt8 *sub_7EC8(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t result = CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  uint64_t v10 = result;
  if (dword_14158 <= 50)
  {
    if (dword_14158 != -1
      || (uint64_t result = (const UInt8 *)_LogCategory_Initialize(&dword_14158, 33554482LL), (_DWORD)result))
    {
      BOOL v11 = "YES";
      if (*((_DWORD *)v10 + 1)) {
        int v12 = "YES";
      }
      else {
        int v12 = "NO";
      }
      if (!a2) {
        BOOL v11 = "NO";
      }
      uint64_t result = (const UInt8 *)LogPrintF( &dword_14158,  "OSStatus muteControl_setMuteState(FigHALAudioObjectRef, Boolean, AudioObjectPropertyScop e, AudioObjectPropertyElement)",  33554482LL,  "[%{ptr}] muteControl: currentMuteState = %s, newMuteState = %s",  a1,  v12,  v11);
    }
  }

  if (*((_DWORD *)v10 + 1) != a2)
  {
    *((_DWORD *)v10 + 1) = a2;
    return (const UInt8 *)FigHALAudioPropertySendOneChange( *(void *)DerivedStorage,  *(unsigned int *)(DerivedStorage + 8),  1650685548LL,  a3,  a4);
  }

  return result;
}

uint64_t sub_7FE0( const __CFAllocator *a1, uint64_t a2, uint64_t a3, const void *a4, const void *a5, CFDictionaryRef theDict, CFTypeRef *a7)
{
  CFTypeRef v72 = 0LL;
  int v71 = 0;
  CFTypeRef v70 = 0LL;
  __int16 v69 = 0;
  int v67 = 0;
  float v68 = -999.0;
  if (!theDict)
  {
    APSLogErrorAt(0LL, "APHALAudioDeviceCreateForEndpointStream", 1894LL, 0LL);
    uint64_t v21 = 4294950576LL;
    goto LABEL_120;
  }

  cf[0] = 0LL;
  uint64_t v13 = kAPHALAudioDeviceCreationOptionDeviceType_AVConference;
  CFTypeRef v74 = 0LL;
  CFTypeRef v75 = 0LL;
  CFTypeRef v73 = 0LL;
  uint64_t v14 = (const void *)kFigHALAudioConduitDeviceBrokeredDeviceCreationOption_Conduit;
  Value = CFDictionaryGetValue(theDict, kFigHALAudioConduitDeviceBrokeredDeviceCreationOption_Conduit);
  uint64_t v65 = v13;
  if (!Value)
  {
    if (a5)
    {
      CFTypeRef v18 = CFRetain(a5);
      if (a4)
      {
LABEL_11:
        CFTypeRef v19 = CFRetain(a4);
LABEL_14:
        uint64_t v20 = (const __CFDictionary *)CFRetain(theDict);
        uint64_t v21 = 0LL;
        goto LABEL_15;
      }
    }

    else
    {
      CFTypeRef v18 = 0LL;
      if (a4) {
        goto LABEL_11;
      }
    }

    CFTypeRef v19 = 0LL;
    goto LABEL_14;
  }

  uint64_t v16 = (uint64_t)Value;
  uint64_t v17 = sub_8DCC( (uint64_t)Value,  kFigHALAudioConduitDeviceProperty_DeviceUID,  (uint64_t)"Default DeviceUID",  (const __CFString **)&v74);
  if ((_DWORD)v17)
  {
    uint64_t v21 = v17;
    uint64_t v59 = 262LL;
LABEL_136:
    APSLogErrorAt(v17, "device_copyEndpointAndEndpointStreamFromCreationParameters", v59, 0LL);
    CFTypeRef v19 = 0LL;
    CFTypeRef v18 = 0LL;
    uint64_t v20 = 0LL;
    goto LABEL_15;
  }

  uint64_t v17 = sub_8DCC( v16,  kFigHALAudioConduitDeviceProperty_ModelUID,  (uint64_t)"Default ModelUID",  (const __CFString **)&v73);
  if ((_DWORD)v17)
  {
    uint64_t v21 = v17;
    uint64_t v59 = 265LL;
    goto LABEL_136;
  }

  uint64_t v17 = sub_8DCC( v16,  kFigHALAudioConduitDeviceProperty_DeviceName,  (uint64_t)"Default DeviceName",  (const __CFString **)&v75);
  if ((_DWORD)v17)
  {
    uint64_t v21 = v17;
    uint64_t v59 = 268LL;
    goto LABEL_136;
  }

  if (dword_141C8 <= 50 && (dword_141C8 != -1 || _LogCategory_Initialize(&dword_141C8, 33554482LL))) {
    LogPrintF( &dword_141C8,  "OSStatus device_copyEndpointAndEndpointStreamFromCreationParameters(CFAllocatorRef, FigEndpointRef, FigEndpointStr eamRef, CFDictionaryRef, FigEndpointRef *, FigEndpointStreamRef *, CFDictionaryRef *)",  33554482LL,  "Conduit [%{ptr}] properties: deviceName=%@ deviceUID=%@ modelUID=%@",  v16,  v75,  v74,  v73);
  }
  uint64_t v17 = APEndpointStreamAudioAVCCreate(a1, v16, v74, 0LL, cf);
  if ((_DWORD)v17)
  {
    uint64_t v21 = v17;
    uint64_t v59 = 273LL;
    goto LABEL_136;
  }

  uint64_t MutableCopy = FigCFDictionaryCreateMutableCopy(kCFAllocatorDefault, theDict);
  uint64_t v20 = (const __CFDictionary *)MutableCopy;
  if (MutableCopy)
  {
    FigCFDictionarySetValue(MutableCopy, kAPHALAudioDeviceCreationOption_AudioDeviceType, v13);
    FigCFDictionarySetValue(v20, kAPHALAudioDeviceCreationOption_EndpointName, v75);
    FigCFDictionarySetValue(v20, kAPHALAudioDeviceCreationOption_ModelUID, v73);
    CFTypeRef v19 = 0LL;
    uint64_t v21 = 0LL;
    CFTypeRef v18 = cf[0];
    cf[0] = 0LL;
    goto LABEL_21;
  }

  APSLogErrorAt(0LL, "device_copyEndpointAndEndpointStreamFromCreationParameters", 276LL, 0LL);
  CFTypeRef v19 = 0LL;
  CFTypeRef v18 = 0LL;
  uint64_t v21 = 4294960568LL;
LABEL_15:
  if (cf[0]) {
    CFRelease(cf[0]);
  }
LABEL_21:
  if (v74) {
    CFRelease(v74);
  }
  if (v73) {
    CFRelease(v73);
  }
  if (v75) {
    CFRelease(v75);
  }
  if ((_DWORD)v21)
  {
    uint64_t v24 = v21;
    uint64_t v40 = 1897LL;
    goto LABEL_54;
  }

  uint64_t ClassID = FigHALAudioDeviceGetClassID();
  uint64_t v24 = CMDerivedObjectCreate(a1, &unk_10B00, ClassID, &v72);
  if ((_DWORD)v24)
  {
    uint64_t v21 = v24;
    uint64_t v40 = 1900LL;
    goto LABEL_54;
  }

  uint64_t v24 = FigHALAudioObjectMapperAddMapping(a2, v72, &v71);
  if ((_DWORD)v24)
  {
    uint64_t v21 = v24;
    uint64_t v40 = 1903LL;
    goto LABEL_54;
  }

  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(v72);
  uint64_t v26 = a2;
  uint64_t v27 = DerivedStorage;
  *(void *)(DerivedStorage + 8) = a3;
  *(void *)(DerivedStorage + 16) = v26;
  uint64_t v63 = v26;
  *(_DWORD *)uint64_t DerivedStorage = v71;
  if (v19) {
    CFTypeRef v28 = CFRetain(v19);
  }
  else {
    CFTypeRef v28 = 0LL;
  }
  *(void *)(v27 + 96) = v28;
  if (v18) {
    CFTypeRef v29 = CFRetain(v18);
  }
  else {
    CFTypeRef v29 = 0LL;
  }
  *(void *)(v27 + 104) = v29;
  *(_BYTE *)(v27 + 88) = 0;
  if (qword_142C8 != -1) {
    dispatch_once(&qword_142C8, &stru_10C28);
  }
  uint64_t Instance = _CFRuntimeCreateInstance(kCFAllocatorDefault, qword_142D0, 192LL, 0LL);
  if (Instance)
  {
    *(void *)(Instance + 144) = 0LL;
    *(_BYTE *)(Instance + 152) = 0;
    *(void *)(v27 + 120) = Instance;
  }

  else
  {
    APSLogErrorAt(0LL, "SetupSharedState", 439LL, 0LL);
    uint64_t v24 = FigSignalErrorAt(4294954510LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    if ((_DWORD)v24)
    {
      uint64_t v21 = v24;
      uint64_t v40 = 1915LL;
      goto LABEL_54;
    }
  }

  SNPrintF(cf, 64LL, "APHALAudioDevice.%{ptr}.notification", v72);
  dispatch_queue_t v31 = dispatch_queue_create((const char *)cf, 0LL);
  *(void *)(v27 + 160) = v31;
  if (!v31)
  {
    APSLogErrorAt(0LL, "APHALAudioDeviceCreateForEndpointStream", 1919LL, 0LL);
    uint64_t v21 = FigSignalErrorAt(4294954510LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    goto LABEL_55;
  }

  uint64_t v62 = a3;
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject(v18);
  if (!v33)
  {
    uint64_t v21 = 4294954514LL;
LABEL_53:
    uint64_t v24 = v21;
    uint64_t v40 = 1922LL;
LABEL_54:
    APSLogErrorAt(v24, "APHALAudioDeviceCreateForEndpointStream", v40, 0LL);
LABEL_55:
    unint64_t v41 = 0LL;
    goto LABEL_112;
  }

  int v61 = a7;
  CFTypeRef v64 = v19;
  uint64_t v34 = v33(CMBaseObject, kFigEndpointStreamProperty_ID, kCFAllocatorDefault, v27 + 24);
  if ((_DWORD)v34)
  {
    uint64_t v21 = v34;
    goto LABEL_53;
  }

  if (!*(void *)(v27 + 24))
  {
    APSLogErrorAt(0LL, "APHALAudioDeviceCreateForEndpointStream", 1923LL, 0LL);
    uint64_t v21 = FigSignalErrorAt(4294950536LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    goto LABEL_58;
  }

  uint64_t v35 = *(void *)(v27 + 120);
  uint64_t v36 = FigEndpointStreamGetCMBaseObject(*(void *)(v27 + 104));
  uint64_t v37 = *(uint64_t (**)(void, void, void, void))(*(void *)(CMBaseObjectGetVTable(v36) + 8) + 48LL);
  if (!v37)
  {
    uint64_t v21 = 4294954514LL;
LABEL_57:
    APSLogErrorAt(v21, "APHALAudioDeviceCreateForEndpointStream", 1926LL, 0LL);
LABEL_58:
    unint64_t v41 = 0LL;
    CFTypeRef v19 = v64;
    goto LABEL_112;
  }

  uint64_t v38 = v37(v36, kFigEndpointStreamProperty_SupportedPCMFormats, kCFAllocatorDefault, v35 + 56);
  if ((_DWORD)v38)
  {
    uint64_t v21 = v38;
    goto LABEL_57;
  }

  CFDataRef v39 = CFDictionaryGetValue(theDict, v14);
  *(void *)(*(void *)(v27 + 120) + 64LL) = v39;
  CFTypeRef v19 = v64;
  if (v39) {
    CFRetain(v39);
  }
  uint64_t v24 = sub_8C54((uint64_t)v18, kFigEndpointStreamProperty_AudioEngineClone, (uint64_t)kCFAllocatorDefault, v27 + 112);
  if ((_DWORD)v24)
  {
    uint64_t v21 = v24;
    uint64_t v40 = 1941LL;
    goto LABEL_54;
  }

  if (dword_141C8 <= 50 && (dword_141C8 != -1 || _LogCategory_Initialize(&dword_141C8, 33554482LL))) {
    LogPrintF( &dword_141C8,  "OSStatus APHALAudioDeviceCreateForEndpointStream(CFAllocatorRef, FigHALAudioObjectMapper, AudioServerPlugInHostRef , FigEndpointRef, FigEndpointStreamRef, CFDictionaryRef, FigHALAudioDeviceRef *)",  33554482LL,  "[%{ptr}] using AudioEngine [%{ptr}]",  v72,  *(void *)(v27 + 112));
  }
  uint64_t v24 = APSRealTimeWritableCreate(0LL, 24LL, v27 + 128);
  if ((_DWORD)v24)
  {
    uint64_t v21 = v24;
    uint64_t v40 = 1947LL;
    goto LABEL_54;
  }

  uint64_t v42 = CFDictionaryGetValue(v20, kAPHALAudioDeviceCreationOption_AudioDeviceType);
  if (!v42 || (CFTypeRef v43 = CFRetain(v42)) == 0LL)
  {
    APSLogErrorAt(0LL, "APHALAudioDeviceCreateForEndpointStream", 1951LL, 0LL);
    unint64_t v41 = 0LL;
    uint64_t v21 = 4294950576LL;
    goto LABEL_112;
  }

  unint64_t v41 = v43;
  uint64_t v44 = CFDictionaryGetValue(v20, kAPHALAudioDeviceCreationOption_NetworkClockType);
  if (v44) {
    uint64_t v44 = CFRetain(v44);
  }
  *(void *)(v27 + 72) = v44;
  unsigned int v45 = CFDictionaryGetValue(v20, kAPHALAudioDeviceCreationOption_EndpointName);
  if (v45) {
    unsigned int v45 = CFRetain(v45);
  }
  *(void *)(v27 + 32) = v45;
  uint64_t v46 = CFDictionaryGetValue(v20, kAPHALAudioDeviceCreationOption_ModelUID);
  if (v46) {
    uint64_t v46 = CFRetain(v46);
  }
  *(void *)(v27 + 40) = v46;
  FigCFDictionaryGetBooleanIfPresent(v20, kAPHALAudioDeviceCreationOption_VolumeCtrlSupported, (char *)&v69 + 1);
  FigCFDictionaryGetBooleanIfPresent(v20, kAPHALAudioDeviceCreationOption_MuteCtrlSupported, &v69);
  FigCFDictionaryGetFloatIfPresent(v20, kAPHALAudioDeviceCreationOption_InitialVolumeDB, &v68);
  if ((int)v68 == -999)
  {
    if (dword_141C8 <= 60 && (dword_141C8 != -1 || _LogCategory_Initialize(&dword_141C8, 33554492LL))) {
      LogPrintF( &dword_141C8,  "OSStatus APHALAudioDeviceCreateForEndpointStream(CFAllocatorRef, FigHALAudioObjectMapper, AudioServerPlugInHostR ef, FigEndpointRef, FigEndpointStreamRef, CFDictionaryRef, FigHALAudioDeviceRef *)",  33554492LL,  "[%{ptr}] [AirPlayVolume] HAL Audio Device created with invalid InitialVolume; using -20.0f hard-coded value",
    }
        v72);
    float v68 = -20.0;
  }

  v47 = *(const __CFData **)(*(void *)(v27 + 120) + 56LL);
  if (v47)
  {
    unint64_t Length = CFDataGetLength(v47);
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(void *)(v27 + 120) + 56LL));
    if (Length >= 0x38)
    {
      uint64_t v50 = BytePtr;
      uint64_t v51 = 0LL;
      do
      {
        if (dword_141C8 <= 50 && (dword_141C8 != -1 || _LogCategory_Initialize(&dword_141C8, 33554482LL))) {
          LogPrintF( &dword_141C8,  "OSStatus APHALAudioDeviceCreateForEndpointStream(CFAllocatorRef, FigHALAudioObjectMapper, AudioServerPlugInH ostRef, FigEndpointRef, FigEndpointStreamRef, CFDictionaryRef, FigHALAudioDeviceRef *)",  33554482LL,  "[%{ptr}] AudioDeviceType [%@]. SupportedPCMFormat[%d]: [%{asbd}]\n",  v72,  v41,  v51,  v50);
        }
        ++v51;
        v50 += 56;
      }

      while (Length / 0x38 != v51);
    }
  }

  int v52 = 1885433953;
  else {
    int v53 = 1634300528;
  }
  *(_DWORD *)(v27 + 80) = v53;
  if (FigCFEqual(v41, kAPHALAudioDeviceCreationOptionDeviceType_AggrAudio))
  {
    int v52 = 1885433975;
    CFTypeRef v19 = v64;
    CFDictionaryRef v54 = v61;
    uint64_t v55 = v62;
LABEL_98:
    *(_DWORD *)(v27 + 84) = v52;
    goto LABEL_99;
  }

  CFTypeRef v19 = v64;
  CFDictionaryRef v54 = v61;
  uint64_t v55 = v62;
  if (FigCFEqual(v41, kAPHALAudioDeviceCreationOptionDeviceType_Screen))
  {
    int v52 = 1885433971;
    goto LABEL_98;
  }

  if (FigCFEqual(v41, kAPHALAudioDeviceCreationOptionDeviceType_LowLatencyAudio))
  {
    int v52 = 1885433964;
    goto LABEL_98;
  }

  if (FigCFEqual(v41, v65))
  {
    int v52 = 1885565807;
    goto LABEL_98;
  }

LABEL_99:
  uint64_t v56 = FigSimpleMutexCreate();
  *(void *)(v27 + 64) = v56;
  if (v56)
  {
    uint64_t v57 = sub_435C( (uint64_t)a1,  v63,  v71,  *(const void **)(v27 + 112),  v55,  *(const void **)(v27 + 120),  (CFTypeRef *)(v27 + 136));
    if ((_DWORD)v57)
    {
      uint64_t v21 = v57;
      uint64_t v60 = 2015LL;
    }

    else
    {
      if (!HIBYTE(v69))
      {
LABEL_106:
        uint64_t v57 = sub_8CBC((uint64_t)v72);
        if (!(_DWORD)v57)
        {
          if (dword_141C8 <= 50
            && (dword_141C8 != -1 || _LogCategory_Initialize(&dword_141C8, 33554482LL)))
          {
            LogPrintF( &dword_141C8,  "OSStatus APHALAudioDeviceCreateForEndpointStream(CFAllocatorRef, FigHALAudioObjectMapper, AudioServerPlugI nHostRef, FigEndpointRef, FigEndpointStreamRef, CFDictionaryRef, FigHALAudioDeviceRef *)",  33554482LL,  "Created APHALAudioDevice [%{ptr}]",  v72);
          }

          uint64_t v21 = 0LL;
          *CFDictionaryRef v54 = v72;
          CFTypeRef v72 = 0LL;
          goto LABEL_112;
        }

        uint64_t v21 = v57;
        uint64_t v60 = 2031LL;
        goto LABEL_147;
      }

      uint64_t v57 = sub_677C(a1, v68, (uint64_t)v19, (CFDataRef *)&v70);
      if ((_DWORD)v57)
      {
        uint64_t v21 = v57;
        uint64_t v60 = 2019LL;
      }

      else
      {
        uint64_t v57 = sub_6810((uint64_t)a1, v63, v55, v71, v19, v70, (CFTypeRef *)(v27 + 144));
        if ((_DWORD)v57)
        {
          uint64_t v21 = v57;
          uint64_t v60 = 2022LL;
        }

        else
        {
          if (!(_BYTE)v69) {
            goto LABEL_106;
          }
          uint64_t v57 = sub_6C24((uint64_t)a1, v63, v55, v71, v19, v70, (CFTypeRef *)(v27 + 152));
          if (!(_DWORD)v57) {
            goto LABEL_106;
          }
          uint64_t v21 = v57;
          uint64_t v60 = 2026LL;
        }
      }
    }

LABEL_147:
    APSLogErrorAt(v57, "APHALAudioDeviceCreateForEndpointStream", v60, 0LL);
    goto LABEL_112;
  }

  APSLogErrorAt(0LL, "APHALAudioDeviceCreateForEndpointStream", 2012LL, 0LL);
  uint64_t v21 = 4294960568LL;
LABEL_112:
  if (v20) {
    CFRelease(v20);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v18) {
    CFRelease(v18);
  }
  if (v41) {
    CFRelease(v41);
  }
LABEL_120:
  if (v70) {
    CFRelease(v70);
  }
  if (v72) {
    CFRelease(v72);
  }
  return v21;
}

uint64_t sub_8C54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
  if (v8) {
    return v8(CMBaseObject, a2, a3, a4);
  }
  else {
    return 4294954514LL;
  }
}

uint64_t sub_8CBC(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(DerivedStorage);
  uint64_t v4 = FigNotificationCenterAddWeakListener( DefaultLocalCenter,  a1,  sub_9400,  kFigEndpointStreamNotification_Dissociated,  *(void *)(DerivedStorage + 104),  0LL,  0LL);
  if ((_DWORD)v4)
  {
    uint64_t v6 = v4;
    uint64_t v10 = 375LL;
LABEL_8:
    APSLogErrorAt(v4, "SetupEndpointStreamMonitoring", v10, 0LL);
    return v6;
  }

  uint64_t v5 = CMNotificationCenterGetDefaultLocalCenter(v4);
  uint64_t v4 = FigNotificationCenterAddWeakListener( v5,  a1,  sub_9400,  @"EndpointStream_ServerConnectionDied",  *(void *)(DerivedStorage + 104),  0LL,  0LL);
  uint64_t v6 = v4;
  if ((_DWORD)v4)
  {
    uint64_t v10 = 378LL;
    goto LABEL_8;
  }

  uint64_t v7 = CMNotificationCenterGetDefaultLocalCenter(v4);
  uint64_t v8 = FigNotificationCenterAddWeakListener( v7,  a1,  sub_94A8,  kAPEndpointStreamNotification_DynamicLatencyOffsetDidChange,  *(void *)(DerivedStorage + 104),  0LL,  0LL);
  if ((_DWORD)v8)
  {
    uint64_t v11 = v8;
    APSLogErrorAt(v8, "SetupEndpointStreamMonitoring", 381LL, 0LL);
    return v11;
  }

  return v6;
}

uint64_t sub_8DCC(uint64_t a1, uint64_t a2, uint64_t a3, const __CFString **a4)
{
  CFStringRef theString = 0LL;
  uint64_t v8 = FigHALAudioConduitDeviceCopyProperty(a1, a2, kCFAllocatorDefault, &theString);
  unsigned int v14 = v8;
  if ((_DWORD)v8)
  {
    uint64_t v12 = v8;
    APSLogErrorAt(v8, "device_copyPropertyFromConduitDevice", 214LL, 0LL);
    if (dword_141C8 <= 90 && (dword_141C8 != -1 || _LogCategory_Initialize(&dword_141C8, 33554522LL))) {
      LogPrintF( &dword_141C8,  "OSStatus device_copyPropertyFromConduitDevice(FigHALAudioConduitDeviceRef, const CFStringRef, const char *, CFStringRef *)",  33554522LL,  "Copy property %@ from conduit [%{ptr}] failed with error=%d",  a2,  a1,  v12);
    }
  }

  else
  {
    if (theString && CFStringGetLength(theString))
    {
      int v9 = theString;
LABEL_15:
      *a4 = v9;
      return v14;
    }

    if (dword_141C8 <= 50 && (dword_141C8 != -1 || _LogCategory_Initialize(&dword_141C8, 33554482LL)))
    {
      if (theString) {
        uint64_t v10 = "empty string";
      }
      else {
        uint64_t v10 = "null";
      }
      LogPrintF( &dword_141C8,  "OSStatus device_copyPropertyFromConduitDevice(FigHALAudioConduitDeviceRef, const CFStringRef, const char *, CFStringRef *)",  33554482LL,  "Conduit [%{ptr}] property: %@ is %s. A default value will be used.",  a1,  a2,  v10);
    }

    if (theString) {
      CFRelease(theString);
    }
    int v9 = (const __CFString *)CFStringCreateF(&v14, "%s:%{ptr}", a3, a1);
    CFStringRef theString = v9;
    if (!v14) {
      goto LABEL_15;
    }
    APSLogErrorAt(v14, "device_copyPropertyFromConduitDevice", 221LL, 0LL);
  }

  if (theString) {
    CFRelease(theString);
  }
  return v14;
}

void sub_8F98(uint64_t a1)
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage(a1);
  uint64_t v3 = CMBaseObjectGetDerivedStorage(a1);
  if (*(void *)(v3 + 104))
  {
    uint64_t v4 = v3;
    uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(v3);
    uint64_t v6 = FigNotificationCenterRemoveWeakListener( DefaultLocalCenter,  a1,  sub_9400,  kFigEndpointStreamNotification_Dissociated,  *(void *)(v4 + 104));
    uint64_t v7 = CMNotificationCenterGetDefaultLocalCenter(v6);
    uint64_t v8 = FigNotificationCenterRemoveWeakListener( v7,  a1,  sub_9400,  @"EndpointStream_ServerConnectionDied",  *(void *)(v4 + 104));
    uint64_t v9 = CMNotificationCenterGetDefaultLocalCenter(v8);
    FigNotificationCenterRemoveWeakListener( v9,  a1,  sub_94A8,  kAPEndpointStreamNotification_DynamicLatencyOffsetDidChange,  *(void *)(v4 + 104));
  }

  sub_91A8(a1);
  uint64_t v10 = (const void *)DerivedStorage[3];
  if (v10)
  {
    CFRelease(v10);
    DerivedStorage[3] = 0LL;
  }

  uint64_t v11 = (const void *)DerivedStorage[5];
  if (v11)
  {
    CFRelease(v11);
    DerivedStorage[5] = 0LL;
  }

  uint64_t v12 = (const void *)DerivedStorage[4];
  if (v12)
  {
    CFRelease(v12);
    DerivedStorage[4] = 0LL;
  }

  uint64_t v13 = (const void *)DerivedStorage[7];
  if (v13)
  {
    CFRelease(v13);
    DerivedStorage[7] = 0LL;
  }

  unsigned int v14 = (const void *)DerivedStorage[12];
  if (v14)
  {
    CFRelease(v14);
    DerivedStorage[12] = 0LL;
  }

  uint64_t v15 = (const void *)DerivedStorage[13];
  if (v15)
  {
    CFRelease(v15);
    DerivedStorage[13] = 0LL;
  }

  uint64_t v16 = (const void *)DerivedStorage[14];
  if (v16)
  {
    CFRelease(v16);
    DerivedStorage[14] = 0LL;
  }

  uint64_t v17 = (const void *)DerivedStorage[17];
  if (v17)
  {
    CFRelease(v17);
    DerivedStorage[17] = 0LL;
  }

  CFTypeRef v18 = (const void *)DerivedStorage[18];
  if (v18)
  {
    CFRelease(v18);
    DerivedStorage[18] = 0LL;
  }

  CFTypeRef v19 = (const void *)DerivedStorage[19];
  if (v19)
  {
    CFRelease(v19);
    DerivedStorage[19] = 0LL;
  }

  uint64_t v20 = (const void *)DerivedStorage[22];
  if (v20)
  {
    CFRelease(v20);
    DerivedStorage[22] = 0LL;
  }

  uint64_t v21 = (const void *)DerivedStorage[9];
  if (v21)
  {
    CFRelease(v21);
    DerivedStorage[9] = 0LL;
  }

  uint64_t v22 = (const void *)DerivedStorage[16];
  if (v22)
  {
    CFRelease(v22);
    DerivedStorage[16] = 0LL;
  }

  FigSimpleMutexDestroy(DerivedStorage[8]);
  unsigned int v23 = (dispatch_object_s *)DerivedStorage[20];
  if (v23)
  {
    dispatch_release(v23);
    DerivedStorage[20] = 0LL;
  }

  uint64_t v24 = (CFTypeRef *)DerivedStorage[15];
  if (v24)
  {
    if (v24[8])
    {
      CFRelease(v24[8]);
      uint64_t v24 = (CFTypeRef *)DerivedStorage[15];
      v24[8] = 0LL;
    }

    CFRelease(v24);
    DerivedStorage[15] = 0LL;
  }

CFStringRef sub_9158(uint64_t a1)
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage(a1);
  return CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"APHALAudioDevice ID %d UID %@ Endpoint %p EndpointStream %p",  *DerivedStorage,  *((void *)DerivedStorage + 3),  *((void *)DerivedStorage + 12),  *((void *)DerivedStorage + 13));
}

uint64_t sub_91A8(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v3 = (void *)DerivedStorage;
  *(_DWORD *)(DerivedStorage + 168) = 0;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v5 = Mutable;
  if (Mutable) {
    CFDictionarySetInt64(Mutable, kAPAudioEngineSuspendOption_IODiscontinuityCount, *(void *)(v3[15] + 144LL));
  }
  uint64_t v6 = FigEndpointStreamAudioEngineSuspendSync(v3[14], v5, 3000LL);
  uint64_t v7 = v6;
  if ((_DWORD)v6)
  {
    if ((_DWORD)v6 == -15486)
    {
      if (dword_141C8 <= 90 && (dword_141C8 != -1 || _LogCategory_Initialize(&dword_141C8, 33554522LL))) {
        LogPrintF( &dword_141C8,  "OSStatus device_StopIO(FigHALAudioDeviceRef)",  33554522LL,  "### [%{ptr}] ESAE suspend timed out. Continuing Async.\n",  a1);
      }
      uint64_t v7 = 0LL;
    }

    else if (dword_141C8 <= 90 {
           && (dword_141C8 != -1 || _LogCategory_Initialize(&dword_141C8, 33554522LL)))
    }
    {
      LogPrintF( &dword_141C8,  "OSStatus device_StopIO(FigHALAudioDeviceRef)",  33554522LL,  "### [%{ptr}] ESAE suspend failed err=%#m\n",  a1,  v7);
    }
  }

  uint64_t v8 = v3[17];
  uint64_t v9 = *(void (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v8) + 24) + 40LL);
  if (v9) {
    v9(v8);
  }
  uint64_t v10 = *(const void **)(v3[15] + 128LL);
  if (v10)
  {
    CFRelease(v10);
    *(void *)(v3[15] + 128LL) = 0LL;
  }

  uint64_t v11 = (const void *)v3[22];
  if (v11)
  {
    CFRelease(v11);
    v3[22] = 0LL;
  }

  uint64_t v12 = (const void *)v3[7];
  if (v12)
  {
    CFRelease(v12);
    v3[7] = 0LL;
  }

  uint64_t v13 = v3[15];
  unsigned int v14 = *(const void **)(v13 + 72);
  if (v14)
  {
    CFRelease(v14);
    uint64_t v13 = v3[15];
    *(void *)(v13 + 72) = 0LL;
  }

  *(_BYTE *)(v13 + 200) = 0;
  if (v5) {
    CFRelease(v5);
  }
  return v7;
}

uint64_t sub_9400(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage = (unsigned int *)CMBaseObjectGetDerivedStorage(a2);
  uint64_t v4 = *((void *)DerivedStorage + 20);
  uint64_t DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter(DerivedStorage);
  FigDispatchAsyncPostNotification(v4, DefaultLocalCenter, kFigHALAudioDeviceNotification_Unplugged, a2, 0LL, 0LL);
  *((_BYTE *)DerivedStorage + 172) = 1;
  uint64_t v6 = *((void *)DerivedStorage + 17);
  if (v6)
  {
    uint64_t v7 = *((void *)DerivedStorage + 2);
    if (v8) {
      uint64_t v9 = v8(v6);
    }
    else {
      uint64_t v9 = 0LL;
    }
    FigHALAudioObjectMapperRemoveMapping(v7, v9);
  }

  return FigHALAudioObjectMapperRemoveMapping(*((void *)DerivedStorage + 2), *DerivedStorage);
}

uint64_t sub_94A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a2);
  int valuePtr = 0;
  if (!a5)
  {
    uint64_t v10 = 338LL;
    return APSLogErrorAt(0LL, "EndpointStreamDynamicLatencyOffsetDidChangeCallback", v10, 0LL);
  }

  uint64_t v7 = DerivedStorage;
  Value = (const __CFNumber *)CFDictionaryGetValue(a5, kAPEndpointStreamNotificationPayloadKey_DynamicLatencyOffsetMs);
  if (!Value)
  {
    uint64_t v10 = 341LL;
    return APSLogErrorAt(0LL, "EndpointStreamDynamicLatencyOffsetDidChangeCallback", v10, 0LL);
  }

  CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
  FigSimpleMutexLock(*(void *)(v7 + 64));
  if (*(void *)(v7 + 56)) {
    APSLatencyOffsetStepperSetTargetLatencyOffset((float)valuePtr);
  }
  return FigSimpleMutexUnlock(*(void *)(v7 + 64));
}

uint64_t sub_955C(uint64_t a1)
{
  return *(unsigned int *)CMBaseObjectGetDerivedStorage(a1);
}

BOOL sub_9574(uint64_t a1, int *a2)
{
  BOOL result = 0LL;
  int v4 = *a2;
  if (*a2 > 1819107690)
  {
    if (v4 <= 1935763059)
    {
      if (v4 <= 1853059618)
      {
        if (v4 <= 1819569762)
        {
          if (v4 != 1819107691)
          {
            int v5 = 1819173229;
            goto LABEL_60;
          }

          return 1LL;
        }

        if (v4 != 1819569763)
        {
          int v5 = 1836411236;
          goto LABEL_60;
        }

        goto LABEL_46;
      }

      if (v4 > 1870098019)
      {
        if (v4 == 1870098020) {
          return 1LL;
        }
        int v5 = 1919512167;
      }

      else
      {
        if (v4 == 1853059619) {
          return 1LL;
        }
        int v5 = 1853059700;
      }

LABEL_60:
      if (v4 != v5) {
        return result;
      }
      return 1LL;
    }

    if (v4 > 1937009954)
    {
      if (v4 > 1969841183)
      {
        if (v4 == 1987012963) {
          return sub_ACBC(a1);
        }
        int v5 = 1969841184;
      }

      else
      {
        if (v4 == 1937009955) {
          return 1LL;
        }
        int v5 = 1953653102;
      }

      goto LABEL_60;
    }

    if (v4 > 1936879203)
    {
      if (v4 != 1936879204)
      {
        int v5 = 1937007734;
        goto LABEL_60;
      }
    }

    else if (v4 != 1935763060)
    {
      int v6 = 1936092276;
      goto LABEL_42;
    }

    goto LABEL_46;
  }

  if (v4 > 1668575851)
  {
    if (v4 > 1718383986)
    {
      if (v4 > 1751737453)
      {
        if (v4 == 1751737454) {
          return 1LL;
        }
        int v5 = 1818850926;
      }

      else
      {
        if (v4 == 1718383987) {
          return sub_AC04(a1);
        }
        int v5 = 1735354734;
      }

      goto LABEL_60;
    }

    if (v4 <= 1684236337)
    {
      if (v4 == 1668575852) {
        return 1LL;
      }
      int v5 = 1668641652;
      goto LABEL_60;
    }

    if (v4 != 1684236338)
    {
      int v6 = 1684434036;
LABEL_42:
      if (v4 != v6) {
        return result;
      }
    }

LABEL_46:
    int v9 = a2[1];
    return v9 == 1768845428 || v9 == 1869968496;
  }

  if (v4 <= 1650682994)
  {
    if (v4 == 1634429294 || v4 == 1634758772 || v4 == 1634759532) {
      return 1LL;
    }
  }

  else
  {
    if (v4 > 1668047218)
    {
      if (v4 == 1668047219) {
        return 1LL;
      }
      int v5 = 1668049764;
      goto LABEL_60;
    }

    if (v4 == 1650682995) {
      return 1LL;
    }
    if (v4 == 1667658618) {
      return sub_AD88(a1) != 0;
    }
  }

  return result;
}

BOOL sub_9888(uint64_t a1, int *a2)
{
  int v2 = *a2;
  return *a2 == 1718383987 || v2 == 1987012963 || v2 == 1853059700;
}

uint64_t sub_98CC(uint64_t a1, int *a2)
{
  uint64_t DerivedStorage = (void *)CMBaseObjectGetDerivedStorage(a1);
  int v4 = *a2;
  if (*a2 <= 1819107690)
  {
    if (v4 > 1668575851)
    {
      if (v4 > 1718383986)
      {
        int v5 = 1751737453;
        if (v4 == 1818850926) {
          int v19 = 4;
        }
        else {
          int v19 = 0;
        }
        if (v4 == 1751737454) {
          unsigned int v7 = 4;
        }
        else {
          unsigned int v7 = v19;
        }
        int v8 = 1718383987;
        BOOL v9 = v4 == 1735354734;
        int v10 = 4;
        goto LABEL_32;
      }

      if (v4 <= 1684236337)
      {
        if (v4 != 1668575852)
        {
          BOOL v11 = v4 == 1668641652;
          unsigned int v12 = 48;
          goto LABEL_58;
        }

        int v23 = DerivedStorage[18] != 0LL;
        if (DerivedStorage[19]) {
          ++v23;
        }
        return (4 * v23);
      }

      int v13 = 1684236338;
      unsigned int v14 = 8;
      int v15 = 1684434036;
LABEL_62:
      BOOL v17 = v4 == v15;
      unsigned int v18 = 4;
LABEL_63:
      if (!v17) {
        unsigned int v18 = 0;
      }
      goto LABEL_65;
    }

    if (v4 <= 1650682994)
    {
      int v13 = 1634429294;
      unsigned int v14 = 4;
      if (v4 == 1634759532) {
        int v22 = 4;
      }
      else {
        int v22 = 0;
      }
      if (v4 == 1634758772) {
        unsigned int v18 = 4;
      }
      else {
        unsigned int v18 = v22;
      }
LABEL_65:
      if (v4 == v13) {
        return v14;
      }
      else {
        return v18;
      }
    }

    if (v4 > 1668047218)
    {
      if (v4 != 1668047219)
      {
        int v16 = 1668049764;
        goto LABEL_56;
      }
    }

    else if (v4 != 1650682995)
    {
      int v16 = 1667658618;
      goto LABEL_56;
    }

    return 4LL;
  }

  if (v4 > 1935763059)
  {
    if (v4 <= 1937009954)
    {
      if (v4 > 1936879203)
      {
        if (v4 == 1936879204) {
          return (20 * *(_DWORD *)(DerivedStorage[15] + 44LL) + 12);
        }
        int v16 = 1937007734;
        goto LABEL_56;
      }

      int v13 = 1935763060;
      unsigned int v14 = 4;
      int v15 = 1936092276;
      goto LABEL_62;
    }

    if (v4 > 1969841183)
    {
      int v13 = 1969841184;
      unsigned int v14 = 8;
      int v15 = 1987012963;
      goto LABEL_62;
    }

    if (v4 == 1937009955)
    {
      int v24 = a2[1];
      BOOL v11 = v24 == 1869968496 || v24 == 1735159650;
      goto LABEL_57;
    }

    int v16 = 1953653102;
LABEL_56:
    BOOL v11 = v4 == v16;
LABEL_57:
    unsigned int v12 = 4;
LABEL_58:
    if (v11) {
      return v12;
    }
    else {
      return 0LL;
    }
  }

  if (v4 <= 1853059618)
  {
    int v5 = 1819569762;
    if (v4 == 1836411236) {
      int v6 = 8;
    }
    else {
      int v6 = 0;
    }
    if (v4 == 1819569763) {
      unsigned int v7 = 4;
    }
    else {
      unsigned int v7 = v6;
    }
    int v8 = 1819107691;
    BOOL v9 = v4 == 1819173229;
    int v10 = 8;
LABEL_32:
    if (!v9) {
      int v10 = 0;
    }
    if (v4 == v8) {
      unsigned int v20 = 8;
    }
    else {
      unsigned int v20 = v10;
    }
    if (v4 <= v5) {
      return v20;
    }
    else {
      return v7;
    }
  }

  if (v4 <= 1870098019)
  {
    int v13 = 1853059619;
    unsigned int v14 = 32;
    BOOL v17 = v4 == 1853059700;
    unsigned int v18 = 8;
    goto LABEL_63;
  }

  if (v4 != 1870098020)
  {
    int v16 = 1919512167;
    goto LABEL_56;
  }

  int v25 = a2[1];
  if (v25 != 1869968496 && v25 != 1735159650) {
    return 0LL;
  }
  int v26 = DerivedStorage[18] != 0LL;
  if (DerivedStorage[19]) {
    ++v26;
  }
  return (4 * v26 + 4);
}

uint64_t sub_9C78(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, uint64_t a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  int v13 = (void *)DerivedStorage;
  int v14 = *a2;
  if (*a2 <= 1819107690)
  {
    if (v14 <= 1668575851)
    {
      if (v14 <= 1650682994)
      {
        switch(v14)
        {
          case 1634429294:
            *a6 = 4;
            if (a5 < 4) {
              return 0LL;
            }
            uint64_t v17 = 0LL;
            int v19 = *(_DWORD *)DerivedStorage;
            break;
          case 1634758772:
            *a6 = 4;
            if (a5 < 4) {
              return 561211770LL;
            }
            uint64_t v17 = 0LL;
            int v19 = *(_DWORD *)(DerivedStorage + 84);
            break;
          case 1634759532:
            *a6 = 4;
            if (a5 < 4) {
              return 561211770LL;
            }
            uint64_t v17 = 0LL;
            int v19 = *(_DWORD *)(DerivedStorage + 48);
            break;
          default:
            return 2003332927LL;
        }
      }

      else
      {
        if (v14 > 1668047218)
        {
          if (v14 == 1668047219)
          {
            *a6 = 4;
            if (a5 < 4) {
              return 561211770LL;
            }
            uint64_t v17 = 0LL;
            int v19 = 1633969526;
            goto LABEL_118;
          }

          int v18 = 1668049764;
LABEL_62:
          if (v14 != v18) {
            return 2003332927LL;
          }
          goto LABEL_72;
        }

        if (v14 != 1650682995)
        {
          if (v14 != 1667658618) {
            return 2003332927LL;
          }
          *a6 = 4;
          if (a5 >= 4)
          {
            uint64_t v17 = 0LL;
            *(_DWORD *)a7 = sub_AD88(a1);
            return v17;
          }

          return 561211770LL;
        }

        *a6 = 4;
        if (a5 < 4) {
          return 561211770LL;
        }
        uint64_t v17 = 0LL;
        int v19 = 1634689642;
      }

      goto LABEL_118;
    }

    if (v14 > 1718383986)
    {
      if (v14 > 1751737453)
      {
        if (v14 == 1751737454) {
          goto LABEL_72;
        }
        if (v14 != 1818850926) {
          return 2003332927LL;
        }
        *a6 = 4;
        if (a5 < 4) {
          return 561211770LL;
        }
        uint64_t v17 = 0LL;
        int v19 = *(_BYTE *)(DerivedStorage + 172) == 0;
      }

      else
      {
        if (v14 == 1718383987) {
          return 1970171760LL;
        }
        if (v14 != 1735354734) {
          return 2003332927LL;
        }
        *a6 = 4;
        if (a5 < 4) {
          return 561211770LL;
        }
        uint64_t v17 = 0LL;
        int v19 = *(_DWORD *)(DerivedStorage + 168) > 0;
      }

      goto LABEL_118;
    }

    if (v14 > 1684236337)
    {
      if (v14 != 1684236338)
      {
        int v18 = 1684434036;
        goto LABEL_62;
      }

      if (a5 <= 7)
      {
        uint64_t v17 = 561211770LL;
        uint64_t v65 = 1170LL;
        goto LABEL_210;
      }

      uint64_t v17 = 0LL;
      *(void *)a7 = 0x200000001LL;
      int v33 = 8;
LABEL_205:
      *a6 = v33;
      return v17;
    }

    if (v14 != 1668575852)
    {
      if (v14 != 1668641652) {
        return 2003332927LL;
      }
      *a6 = 48;
      if (a5 > 0x2F)
      {
        uint64_t v17 = 0LL;
        *(_OWORD *)a7 = *(_OWORD *)"tppawwar";
        *(_OWORD *)(a7 + 16) = *(_OWORD *)"wwar";
        *(_OWORD *)(a7 + 32) = xmmword_D54C;
        return v17;
      }

      uint64_t v17 = 561211770LL;
      uint64_t v65 = 1227LL;
      goto LABEL_210;
    }

    unsigned int v21 = a5 >> 2;
    int v22 = a2[1];
    switch(v22)
    {
      case 1869968496:
        goto LABEL_92;
      case 1768845428:
        if (a5 >= 4) {
          unsigned int v21 = 0;
        }
        break;
      case 1735159650:
LABEL_92:
        uint64_t v24 = *(void *)(DerivedStorage + 144);
        uint64_t v23 = *(void *)(DerivedStorage + 152);
        unsigned int v25 = v24 != 0;
        if (v23) {
          ++v25;
        }
        if (v21 >= v25) {
          unsigned int v21 = v25;
        }
        if (v21)
        {
          if (!v24)
          {
            uint64_t v48 = 0LL;
            goto LABEL_169;
          }

          int v26 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(*(void *)(DerivedStorage + 144))
                                                              + 16)
                                                  + 8LL);
          if (v26) {
            int v27 = v26(v24);
          }
          else {
            int v27 = 0;
          }
          *(_DWORD *)a7 = v27;
          if (v21 >= 2)
          {
            uint64_t v23 = v13[19];
            uint64_t v48 = 1LL;
LABEL_169:
            if (v23)
            {
              unsigned int v49 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v23) + 16) + 8LL);
              if (v49) {
                int v50 = v49(v23);
              }
              else {
                int v50 = 0;
              }
              *(_DWORD *)(a7 + 4 * v48) = v50;
            }

            break;
          }

          unsigned int v21 = 1;
        }

        break;
    }

    uint64_t v17 = 0LL;
    int v33 = 4 * v21;
    goto LABEL_205;
  }

  if (v14 > 1935763059)
  {
    if (v14 <= 1937009954)
    {
      if (v14 <= 1936879203)
      {
        if (v14 == 1935763060) {
          goto LABEL_72;
        }
        int v18 = 1936092276;
        goto LABEL_62;
      }

      if (v14 != 1936879204)
      {
        if (v14 != 1937007734) {
          return 2003332927LL;
        }
        *a6 = 4;
        if (a5 < 4) {
          return 561211770LL;
        }
        uint64_t v17 = 0LL;
        int v19 = 1;
        goto LABEL_118;
      }

      int v34 = *(_DWORD *)(*(void *)(DerivedStorage + 120) + 44LL);
      unsigned int v35 = 20 * v34 + 12;
      if (v35 <= a5)
      {
        bzero((void *)a7, (20 * v34 + 12));
        if (v34 == 8)
        {
          *(void *)(a7 + 8) = 0x100000008LL;
          *(_DWORD *)(a7 + 32) = 2;
          *(_DWORD *)(a7 + 52) = 3;
          *(_DWORD *)(a7 + 72) = 4;
          *(_DWORD *)(a7 + 92) = 5;
          *(_DWORD *)(a7 + 112) = 6;
          *(_DWORD *)(a7 + 132) = 49;
          *(_DWORD *)(a7 + 152) = 51;
        }

        else
        {
          if (v34 == 1) {
            int v36 = 6553601;
          }
          else {
            int v36 = 6619138;
          }
          *(_DWORD *)a7 = v36;
        }

        uint64_t v17 = 0LL;
        *a6 = v35;
        return v17;
      }

      uint64_t v17 = 561211770LL;
      uint64_t v65 = 1185LL;
LABEL_210:
      APSLogErrorAt(0LL, "device_GetPropertyData", v65, 0LL);
      return v17;
    }

    if (v14 <= 1969841183)
    {
      if (v14 != 1937009955)
      {
        if (v14 != 1953653102) {
          return 2003332927LL;
        }
        *a6 = 4;
        if (a5 < 4) {
          return 561211770LL;
        }
        uint64_t v17 = 0LL;
        int v19 = *(_DWORD *)(DerivedStorage + 80);
        goto LABEL_118;
      }

      int v28 = a2[1];
      if (v28 == 1869968496) {
        goto LABEL_103;
      }
      int v29 = a5 >> 2;
      if (v28 == 1768845428)
      {
        if (a5 >= 4) {
          int v29 = 0;
        }
        goto LABEL_165;
      }

      if (v28 == 1735159650)
      {
LABEL_103:
        if (a5 < 4)
        {
          int v29 = 0;
        }

        else
        {
          uint64_t v30 = *(void *)(DerivedStorage + 136);
          dispatch_queue_t v31 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v30) + 16) + 8LL);
          if (v31) {
            int v32 = v31(v30);
          }
          else {
            int v32 = 0;
          }
          *(_DWORD *)a7 = v32;
          int v29 = 1;
        }
      }

LABEL_165:
      uint64_t v17 = 0LL;
      int v33 = 4 * v29;
      goto LABEL_205;
    }

    if (v14 == 1969841184) {
      goto LABEL_78;
    }
    if (v14 != 1987012963) {
      return 2003332927LL;
    }
    *a6 = 4;
    if (a5 < 4) {
      return 561211770LL;
    }
    uint64_t v17 = 0LL;
    int v19 = *(unsigned __int8 *)(DerivedStorage + 88);
LABEL_118:
    *(_DWORD *)a7 = v19;
    return v17;
  }

  if (v14 > 1853059618)
  {
    if (v14 <= 1870098019)
    {
      if (v14 == 1853059619)
      {
        uint64_t v17 = 0LL;
        *a6 = 0;
        return v17;
      }

      if (v14 == 1853059700)
      {
        *a6 = 8;
        if (a5 >= 8)
        {
          uint64_t v17 = 0LL;
          *(void *)a7 = *(void *)(*(void *)(DerivedStorage + 120) + 16LL);
          return v17;
        }

        return 561211770LL;
      }

      return 2003332927LL;
    }

    if (v14 != 1870098020)
    {
      if (v14 != 1919512167) {
        return 2003332927LL;
      }
      *a6 = 4;
      if (a5 < 4) {
        return 561211770LL;
      }
      uint64_t v17 = 0LL;
      int v19 = 11025;
      goto LABEL_118;
    }

    LODWORD(v37) = a5 >> 2;
    int v38 = a2[1];
    switch(v38)
    {
      case 1869968496:
        if (*(void *)(DerivedStorage + 144)) {
          unsigned int v44 = 2;
        }
        else {
          unsigned int v44 = 1;
        }
        if (*(void *)(DerivedStorage + 152)) {
          ++v44;
        }
        else {
          unsigned int v40 = a5 >> 2;
        }
        if (v40)
        {
          uint64_t v45 = *(void *)(DerivedStorage + 136);
          uint64_t v46 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v45) + 16) + 8LL);
          if (v46) {
            int v47 = v46(v45);
          }
          else {
            int v47 = 0;
          }
          *(_DWORD *)a7 = v47;
          if (v40 >= 2)
          {
            uint64_t v54 = v13[18];
            if (v54)
            {
              uint64_t v55 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v13[18]) + 16) + 8LL);
              if (v55) {
                int v56 = v55(v54);
              }
              else {
                int v56 = 0;
              }
              *(_DWORD *)(a7 + 4) = v56;
              uint64_t v57 = 2LL;
              LODWORD(v37) = 2;
              if (v40 < 3) {
                goto LABEL_204;
              }
            }

            else
            {
              uint64_t v57 = 1LL;
            }

            uint64_t v61 = v13[19];
            if (v61)
            {
              uint64_t v62 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v61) + 16) + 8LL);
              if (v62) {
                int v63 = v62(v61);
              }
              else {
                int v63 = 0;
              }
              *(_DWORD *)(a7 + 4 * v57) = v63;
            }

LABEL_203:
            LODWORD(v37) = v40;
            goto LABEL_204;
          }

          goto LABEL_183;
        }

        break;
      case 1768845428:
        if (a5 >= 4) {
          LODWORD(v37) = 0;
        }
        goto LABEL_204;
      case 1735159650:
        if (*(void *)(DerivedStorage + 144)) {
          unsigned int v39 = 2;
        }
        else {
          unsigned int v39 = 1;
        }
        if (*(void *)(DerivedStorage + 152)) {
          ++v39;
        }
        else {
          unsigned int v40 = a5 >> 2;
        }
        if (v40)
        {
          uint64_t v41 = *(void *)(DerivedStorage + 136);
          uint64_t v42 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v41) + 16) + 8LL);
          if (v42) {
            int v43 = v42(v41);
          }
          else {
            int v43 = 0;
          }
          *(_DWORD *)a7 = v43;
          if (v40 >= 2)
          {
            uint64_t v51 = v13[18];
            if (v51)
            {
              int v52 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v13[18]) + 16) + 8LL);
              if (v52) {
                int v53 = v52(v51);
              }
              else {
                int v53 = 0;
              }
              *(_DWORD *)(a7 + 4) = v53;
              uint64_t v37 = 2LL;
              if (v40 < 3) {
                goto LABEL_204;
              }
            }

            else
            {
              uint64_t v37 = 1LL;
            }

            uint64_t v58 = v13[19];
            if (v58)
            {
              uint64_t v59 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v58) + 16) + 8LL);
              if (v59) {
                int v60 = v59(v58);
              }
              else {
                int v60 = 0;
              }
              *(_DWORD *)(a7 + 4 * v37) = v60;
            }

            goto LABEL_203;
          }

LABEL_183:
          LODWORD(v37) = 1;
          goto LABEL_204;
        }

        break;
      default:
LABEL_204:
        uint64_t v17 = 0LL;
        int v33 = 4 * v37;
        goto LABEL_205;
    }

    LODWORD(v37) = 0;
    goto LABEL_204;
  }

  if (v14 > 1819569762)
  {
    if (v14 != 1819569763)
    {
      if (v14 != 1836411236) {
        return 2003332927LL;
      }
      unsigned int v20 = *(const __CFString **)(DerivedStorage + 40);
      if (v20)
      {
        *a6 = 8;
        if (a5 >= 8)
        {
LABEL_83:
          unsigned int v20 = (const __CFString *)CFRetain(v20);
LABEL_84:
          uint64_t v17 = 0LL;
          *(void *)a7 = v20;
          return v17;
        }

        return 561211770LL;
      }

LABEL_72:
    *a6 = 4;
    if (a5 >= 4)
    {
      uint64_t v17 = 0LL;
      *(_DWORD *)a7 = 0;
      return v17;
    }

    return 561211770LL;
  }

  if (v14 == 1819107691)
  {
    *a6 = 8;
    if (a5 >= 8)
    {
      unsigned int v20 = @"Apple, Inc.";
      goto LABEL_83;
    }

    return 561211770LL;
  }

  if (v14 != 1819173229) {
    return 2003332927LL;
  }
  int v15 = *(const void **)(DerivedStorage + 32);
  if (!v15 || (CFTypeRef v16 = CFRetain(v15)) == 0LL) {
    CFTypeRef v16 = CFRetain(@"No Name Endpoint");
  }
  *a6 = 8;
  if (a5 < 8)
  {
    uint64_t v17 = 561211770LL;
  }

  else
  {
    uint64_t v17 = 0LL;
    *(void *)a7 = CFRetain(v16);
  }

  if (v16) {
    CFRelease(v16);
  }
  return v17;
}

uint64_t sub_A710(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, int a5, double *a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  BOOL v11 = (unsigned int *)DerivedStorage;
  CFDataRef v50 = 0LL;
  uint64_t v51 = 0LL;
  int v12 = *a2;
  if (*a2 == 1718383987)
  {
    uint64_t v28 = sub_AC04(a1);
    if ((_DWORD)v28)
    {
      uint64_t v37 = 0LL;
      uint64_t v38 = 0LL;
      *(_BYTE *)(*((void *)v11 + 15) + 152LL) = 1;
      goto LABEL_48;
    }

    uint64_t v38 = 1970171760LL;
    uint64_t v39 = 1363LL;
    goto LABEL_37;
  }

  if (v12 == 1987012963)
  {
    uint64_t v28 = sub_ACBC(a1);
    if (!(_DWORD)v28)
    {
      uint64_t v38 = 1970171760LL;
      uint64_t v39 = 1374LL;
      goto LABEL_37;
    }

    if (a5 != 4)
    {
      uint64_t v38 = 561211770LL;
      uint64_t v28 = 561211770LL;
      uint64_t v39 = 1377LL;
      goto LABEL_37;
    }

    int v29 = *(_DWORD *)a6;
    *((_BYTE *)v11 + 88) = *(_DWORD *)a6;
    uint64_t v30 = CMBaseObjectGetDerivedStorage(a1);
    uint64_t v31 = v30;
    *(void *)&__s2[0] = 0LL;
    if ((_BYTE)v29) {
      int v32 = &kCFBooleanTrue;
    }
    else {
      int v32 = &kCFBooleanFalse;
    }
    uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject(*(void *)(v30 + 104));
    int v34 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, _OWORD *))(*(void *)(CMBaseObjectGetVTable(CMBaseObject)
                                                                                                + 8)
                                                                                    + 48LL);
    if (v34)
    {
      uint64_t v35 = v34(CMBaseObject, kFigEndpointStreamProperty_Type, kCFAllocatorDefault, __s2);
      if (!(_DWORD)v35)
      {
        if (FigCFEqual(*(void *)&__s2[0], kFigEndpointStreamType_LowLatencyAudio))
        {
          if (dword_141C8 <= 50
            && (dword_141C8 != -1 || _LogCategory_Initialize(&dword_141C8, 33554482LL)))
          {
            int v36 = "true";
            if (!(_BYTE)v29) {
              int v36 = "false";
            }
            LogPrintF( &dword_141C8,  "void device_setHTFTIsActive(FigHALAudioObjectRef, Boolean)",  33554482LL,  "[%{ptr}] Updating 'usingVoice' property with value: %s; endpoint stream [%{ptr}].\n",
              a1,
              v36,
              *(void *)(v31 + 104));
          }

          uint64_t v40 = FigEndpointStreamGetCMBaseObject(*(void *)(v31 + 104));
          if (v41) {
            v41(v40, kAPEndpointStreamProperty_IsHomeTheaterFaceTime, *v32);
          }
        }

        goto LABEL_45;
      }
    }

    else
    {
      uint64_t v35 = 4294954514LL;
    }

    APSLogErrorAt(v35, "device_setHTFTIsActive", 506LL, 0LL);
LABEL_45:
    if (*(void *)&__s2[0]) {
      CFRelease(*(CFTypeRef *)&__s2[0]);
    }
    goto LABEL_47;
  }

  if (v12 != 1853059700)
  {
    uint64_t v37 = 0LL;
    uint64_t v38 = 2003332927LL;
    goto LABEL_48;
  }

  memset(__s2, 0, 40);
  uint64_t v13 = *(void *)(DerivedStorage + 120);
  __int128 v14 = *(_OWORD *)(v13 + 32);
  __int128 __s1 = *(_OWORD *)(v13 + 16);
  __int128 v47 = v14;
  uint64_t v48 = *(void *)(v13 + 48);
  if (a5 != 8)
  {
    uint64_t v38 = 561211770LL;
    uint64_t v28 = 561211770LL;
    uint64_t v39 = 1330LL;
LABEL_37:
    APSLogErrorAt(v28, "device_SetPropertyData", v39, 0LL);
    uint64_t v37 = 0LL;
    goto LABEL_48;
  }

  double v15 = *a6;
  if (*a6 == *(double *)&__s1)
  {
LABEL_47:
    uint64_t v37 = 0LL;
    uint64_t v38 = 0LL;
    goto LABEL_48;
  }

  uint64_t v16 = FigHALAudioStreamGetCMBaseObject(*(void *)(DerivedStorage + 136));
  uint64_t v17 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, CFDataRef *))(*(void *)(CMBaseObjectGetVTable(v16)
                                                                                                 + 8)
                                                                                     + 48LL);
  if (!v17)
  {
    uint64_t v38 = 4294954514LL;
LABEL_41:
    uint64_t v28 = v38;
    uint64_t v39 = 1339LL;
    goto LABEL_37;
  }

  uint64_t v18 = v17(v16, kFigHALAudioStreamProperty_SupportedPCMFormats, kCFAllocatorDefault, &v50);
  if ((_DWORD)v18)
  {
    uint64_t v38 = v18;
    goto LABEL_41;
  }

  int v19 = v50;
  unint64_t Length = CFDataGetLength(v50);
  if (Length < 0x70)
  {
    uint64_t v38 = 4294967246LL;
    uint64_t v45 = 1284LL;
LABEL_59:
    APSLogErrorAt(0LL, "GetBestSupportedPCMASBDForSampleRate", v45, 0LL);
    uint64_t v28 = v38;
    uint64_t v39 = 1342LL;
    goto LABEL_37;
  }

  unint64_t v21 = Length / 0x38;
  BytePtr = CFDataGetBytePtr(v19);
  uint64_t v23 = 0LL;
  do
  {
    if (*((double *)BytePtr + 5) <= v15 && *((double *)BytePtr + 6) >= v15)
    {
      uint64_t v23 = BytePtr;
      if (*((_DWORD *)BytePtr + 7) == HIDWORD(v47))
      {
        uint64_t v23 = BytePtr;
        if (*((_DWORD *)BytePtr + 8) >= v48)
        {
          uint64_t v23 = BytePtr;
          goto LABEL_16;
        }
      }
    }

    BytePtr += 56;
    --v21;
  }

  while (v21);
  if (!v23)
  {
    uint64_t v38 = 1970171760LL;
    uint64_t v45 = 1301LL;
    goto LABEL_59;
  }

LABEL_16:
  *(double *)__s2 = v15;
  __int128 v24 = *(_OWORD *)(v23 + 24);
  *(_OWORD *)((char *)__s2 + 8) = *(_OWORD *)(v23 + 8);
  *(_OWORD *)((char *)&__s2[1] + 8) = v24;
  if (!memcmp(&__s1, __s2, 0x28uLL)) {
    goto LABEL_47;
  }
  uint64_t v25 = *((void *)v11 + 17);
  int v26 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v25) + 16) + 8LL);
  if (v26) {
    uint64_t v27 = v26(v25);
  }
  else {
    uint64_t v27 = 0LL;
  }
  uint64_t v43 = FigHALAudioConfigChangeCreateRecord(v27, a2, &v51);
  uint64_t v38 = v43;
  if ((_DWORD)v43)
  {
    APSLogErrorAt(v43, "device_SetPropertyData", 1348LL, 0LL);
    uint64_t v37 = v51;
  }

  else
  {
    uint64_t v44 = v51;
    *(_OWORD *)(v51 + 16) = __s2[0];
    *(_OWORD *)(v44 + 32) = __s2[1];
    *(void *)(v44 + 48) = *(void *)&__s2[2];
    FigHALAudioConfigChangeSendRequest(*((void *)v11 + 1), *v11, 1718579821LL);
    uint64_t v37 = 0LL;
    uint64_t v51 = 0LL;
  }

LABEL_48:
  FigHALAudioConfigChangeDisposeRecord(v37);
  if (v50) {
    CFRelease(v50);
  }
  return v38;
}

BOOL sub_AC04(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CFTypeRef cf1 = 0LL;
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject(*(void *)(DerivedStorage + 104));
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, CFTypeRef *))(*(void *)(CMBaseObjectGetVTable(CMBaseObject)
                                                                                                + 8)
                                                                                    + 48LL);
  if (v3)
  {
    uint64_t v4 = v3(CMBaseObject, kFigEndpointStreamProperty_Type, kCFAllocatorDefault, &cf1);
    if (!(_DWORD)v4)
    {
      BOOL v5 = CFEqual(cf1, kFigEndpointStreamType_LowLatencyAudio) == 0;
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v4 = 4294954514LL;
  }

  APSLogErrorAt(v4, "device_doesSupportFlush", 600LL, 0LL);
  BOOL v5 = 1LL;
LABEL_6:
  if (cf1) {
    CFRelease(cf1);
  }
  return v5;
}

BOOL sub_ACBC(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CFTypeRef cf1 = 0LL;
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject(*(void *)(DerivedStorage + 104));
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, CFTypeRef *))(*(void *)(CMBaseObjectGetVTable(CMBaseObject)
                                                                                                + 8)
                                                                                    + 48LL);
  if (!v3)
  {
    uint64_t v4 = 4294954514LL;
    goto LABEL_6;
  }

  uint64_t v4 = v3(CMBaseObject, kFigEndpointStreamProperty_Type, kCFAllocatorDefault, &cf1);
  if ((_DWORD)v4)
  {
LABEL_6:
    uint64_t v6 = 579LL;
    goto LABEL_7;
  }

  uint64_t v4 = (uint64_t)cf1;
  if (cf1)
  {
    BOOL v5 = CFEqual(cf1, kFigEndpointStreamType_LowLatencyAudio) != 0;
    goto LABEL_8;
  }

  uint64_t v6 = 580LL;
LABEL_7:
  APSLogErrorAt(v4, "device_doesSupportUsingVoiceProperty", v6, 0LL);
  BOOL v5 = 0LL;
LABEL_8:
  if (cf1) {
    CFRelease(cf1);
  }
  return v5;
}

uint64_t sub_AD88(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CFTypeRef cf = 0LL;
  CFTypeRef cf1 = 0LL;
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject(*(void *)(DerivedStorage + 104));
  uint64_t v4 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, CFTypeRef *))(*(void *)(CMBaseObjectGetVTable(CMBaseObject)
                                                                                                + 8)
                                                                                    + 48LL);
  if (!v4)
  {
    uint64_t v5 = 4294954514LL;
    goto LABEL_11;
  }

  uint64_t v5 = v4(CMBaseObject, kFigEndpointStreamProperty_Type, kCFAllocatorDefault, &cf1);
  if ((_DWORD)v5)
  {
LABEL_11:
    APSLogErrorAt(v5, "device_getCalculatedBufferFrameSize", 528LL, 0LL);
    uint64_t v10 = 0LL;
    goto LABEL_33;
  }

  if (CFEqual(cf1, kFigEndpointStreamType_LowLatencyAudio) && !*(_BYTE *)(DerivedStorage + 88))
  {
    uint64_t UInt32 = 128LL;
  }

  else
  {
    uint64_t v6 = *(void *)(*(void *)(DerivedStorage + 120) + 64LL);
    if (v6)
    {
      uint64_t v7 = FigHALAudioConduitDeviceCopyProperty( v6,  kFigHALAudioConduitDeviceProperty_HALSendDesiredNumberPackets,  kCFAllocatorDefault,  &cf);
      if ((_DWORD)v7)
      {
        if (dword_141C8 <= 90
          && ((uint64_t v8 = v7, dword_141C8 != -1) || _LogCategory_Initialize(&dword_141C8, 33554522LL)))
        {
          LogPrintF( &dword_141C8,  "UInt32 device_getCalculatedBufferFrameSize(FigHALAudioObjectRef)",  33554522LL,  "[%{ptr}] Conduit device %{ptr} returned %d for DesiredNumberPackets; using %u for BufferFrameSize\n",
            a1,
            *(void *)(*(void *)(DerivedStorage + 120) + 64LL),
            v8,
            480LL);
          uint64_t UInt32 = 480LL;
        }

        else
        {
          uint64_t UInt32 = 480LL;
        }
      }

      else
      {
        uint64_t UInt32 = FigCFNumberGetUInt32(cf);
        if (dword_141C8 <= 50 && (dword_141C8 != -1 || _LogCategory_Initialize(&dword_141C8, 33554482LL))) {
          LogPrintF( &dword_141C8,  "UInt32 device_getCalculatedBufferFrameSize(FigHALAudioObjectRef)",  33554482LL,  "[%{ptr}] Conduit device %{ptr} DesiredNumberPackets for BufferFrameSize: %u\n",  a1,  *(void *)(*(void *)(DerivedStorage + 120) + 64LL),  UInt32);
        }
      }
    }

    else
    {
      uint64_t UInt32 = 0LL;
    }
  }

  uint64_t IntWithDefault = APSSettingsGetIntWithDefault(@"fixedIOFrameSize", 0LL);
  if ((_DWORD)IntWithDefault)
  {
    uint64_t v10 = IntWithDefault;
    if (dword_141C8 <= 50 && (dword_141C8 != -1 || _LogCategory_Initialize(&dword_141C8, 33554482LL))) {
      LogPrintF( &dword_141C8,  "UInt32 device_getCalculatedBufferFrameSize(FigHALAudioObjectRef)",  33554482LL,  "[%{ptr}] Using forced BufferFrameSize %u instead of %u for stream type %@.\n",  a1,  v10,  UInt32,  cf1);
    }
  }

  else
  {
    if (dword_141C8 <= 50 && (dword_141C8 != -1 || _LogCategory_Initialize(&dword_141C8, 33554482LL)))
    {
      if (*(_BYTE *)(DerivedStorage + 88)) {
        int v12 = "true";
      }
      else {
        int v12 = "false";
      }
      LogPrintF( &dword_141C8,  "UInt32 device_getCalculatedBufferFrameSize(FigHALAudioObjectRef)",  33554482LL,  "[%{ptr}] BufferFrameSize set to %u; and 'usingVoice' property is %s.\n",
        a1,
        UInt32,
        v12);
    }

    uint64_t v10 = UInt32;
  }

uint64_t sub_B088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject(a1);
  uint64_t result = CMBaseObjectGetVTable(CMBaseObject);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(result + 8) + 56LL);
  if (v7) {
    return v7(CMBaseObject, a2, a3);
  }
  return result;
}

CFTypeRef sub_B0E4(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(CMBaseObjectGetDerivedStorage(a1) + 24);
  if (result) {
    return CFRetain(result);
  }
  return result;
}

uint64_t sub_B108(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v6 = (unsigned int *)DerivedStorage;
  int v13 = 0;
  uint64_t v12 = 0LL;
  if (a2 == 1818326115 || a2 == 1718579821)
  {
    if (a3)
    {
      uint64_t v12 = *(void *)(a3 + 4);
      int v13 = *(_DWORD *)(a3 + 12);
      uint64_t v7 = *(void *)(DerivedStorage + 136);
      uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(CMBaseObjectGetVTable(v7) + 24) + 16LL);
      if (v8)
      {
        uint64_t v9 = v8(v7, a2, a3);
        if (!(_DWORD)v9)
        {
          FigHALAudioPropertySendChanges(*((void *)v6 + 1), *v6, 1LL, &v12);
LABEL_11:
          a3 = 0LL;
          goto LABEL_12;
        }
      }

      else
      {
        uint64_t v9 = 4294954514LL;
      }

      APSLogErrorAt(v9, "device_PerformConfigChange", 1418LL, 0LL);
      goto LABEL_11;
    }

    APSLogErrorAt(0LL, "device_PerformConfigChange", 1413LL, 0LL);
    uint64_t v10 = 560947818LL;
  }

  else
  {
    uint64_t v10 = 1852797029LL;
  }

  uint64_t v9 = FigSignalErrorAt(v10, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
LABEL_12:
  FigHALAudioConfigChangeDisposeRecord(a3);
  return v9;
}

uint64_t sub_B244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 0LL;
}

uint64_t sub_B260(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CFNumberRef v58 = 0LL;
  v59[0] = 0LL;
  CMTime v57 = kCMTimeInvalid;
  CMTime v56 = v57;
  uint64_t v55 = 0LL;
  uint64_t v3 = mach_absolute_time();
  uint64_t v52 = v3;
  if (!*(void *)(DerivedStorage + 112))
  {
    uint64_t v48 = 1970171760LL;
    uint64_t v49 = 1463LL;
    goto LABEL_90;
  }

  if (*(_BYTE *)(DerivedStorage + 172))
  {
    uint64_t v48 = 560227702LL;
    uint64_t v49 = 1464LL;
LABEL_90:
    APSLogErrorAt(0LL, "device_StartIO", v49, 0LL);
    uint64_t v4 = FigSignalErrorAt(v48, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    CFDataRef v8 = 0LL;
    char v9 = 1;
    uint64_t v51 = 0LL;
    uint64_t v5 = 0LL;
    CFMutableDictionaryRef v6 = 0LL;
    SInt32 = 0LL;
    if (!(_DWORD)v4) {
      goto LABEL_67;
    }
    goto LABEL_34;
  }

  APSRealTimeAllocatorGetDefault(v3);
  if (*(_DWORD *)(DerivedStorage + 168))
  {
    uint64_t v4 = 0LL;
    uint64_t v51 = 0LL;
    uint64_t v5 = 0LL;
    CFMutableDictionaryRef v6 = 0LL;
    SInt32 = 0LL;
    CFDataRef v8 = 0LL;
    char v9 = 1;
    goto LABEL_67;
  }

  uint64_t v10 = *(void *)(DerivedStorage + 120);
  __int128 v11 = *(_OWORD *)(v10 + 32);
  *(_OWORD *)(v10 + 88) = *(_OWORD *)(v10 + 16);
  *(_OWORD *)(v10 + 104) = v11;
  *(void *)(v10 + 120) = *(void *)(v10 + 48);
  uint64_t v12 = *(void *)(DerivedStorage + 120);
  int v13 = *(_DWORD *)(v12 + 112);
  *(_DWORD *)(v12 + 156) = 0;
  *(_DWORD *)(v12 + 160) = v13;
  *(_DWORD *)(v12 + 164) = *(double *)(v12 + 88);
  *(void *)(v12 + 176) = 0LL;
  *(_BYTE *)(v12 + 152) = 0;
  *(void *)(*(void *)(DerivedStorage + 120) + 144LL) = 0LL;
  double v15 = (OpaqueCMTimebase **)(DerivedStorage + 176);
  __int128 v14 = *(const void **)(DerivedStorage + 176);
  if (v14)
  {
    CFRelease(v14);
    *double v15 = 0LL;
  }

  if (FigCFEqual(*(void *)(DerivedStorage + 72), kAPSNetworkClockType_PTP))
  {
    uint64_t v16 = kCFAllocatorDefault;
    uint64_t v17 = CMTimeSyncClockCreateForSystemDomainClockIdentifier(kCFAllocatorDefault, v59);
    if ((_DWORD)v17)
    {
      uint64_t v4 = v17;
      uint64_t v32 = 1483LL;
      goto LABEL_31;
    }

    uint64_t v18 = (OpaqueCMClock *)v59[0];
  }

  else
  {
    CMClockRef HostTimeClock = CMClockGetHostTimeClock();
    if (HostTimeClock) {
      uint64_t v18 = (OpaqueCMClock *)CFRetain(HostTimeClock);
    }
    else {
      uint64_t v18 = 0LL;
    }
    v59[0] = v18;
    uint64_t v16 = kCFAllocatorDefault;
  }

  uint64_t v17 = CMTimebaseCreateWithSourceClock(v16, v18, (CMTimebaseRef *)(DerivedStorage + 176));
  if ((_DWORD)v17)
  {
    uint64_t v4 = v17;
    uint64_t v32 = 1492LL;
    goto LABEL_31;
  }

  CMClockGetTime(&v57, (CMClockRef)v59[0]);
  unsigned int v20 = (OpaqueCMClock *)v59[0];
  CMClockRef v21 = CMClockGetHostTimeClock();
  CMTime time = v57;
  CMSyncConvertTime(&v56, &time, v20, v21);
  int v22 = *v15;
  CMTime time = kCMTimeZero;
  CMTime immediateMasterTime = v57;
  uint64_t v17 = CMTimebaseSetRateAndAnchorTime(v22, 1.0, &time, &immediateMasterTime);
  if ((_DWORD)v17)
  {
    uint64_t v4 = v17;
    uint64_t v32 = 1498LL;
    goto LABEL_31;
  }

  FigSimpleMutexLock(*(void *)(DerivedStorage + 64));
  uint64_t v23 = (OpaqueCMClock *)v59[0];
  float CFPreferenceDoubleWithDefault = FigGetCFPreferenceDoubleWithDefault( @"latencyOffsetUpdateMaxRate",  @"com.apple.airplay",  1.0);
  uint64_t v25 = APSLatencyOffsetStepperCreate(v16, v23, DerivedStorage + 56, CFPreferenceDoubleWithDefault);
  if ((_DWORD)v25)
  {
    uint64_t v4 = v25;
    APSLogErrorAt(v25, "device_StartIO", 1505LL, 0LL);
    uint64_t v51 = 0LL;
    uint64_t v5 = 0LL;
    CFMutableDictionaryRef v6 = 0LL;
    char v9 = 0;
    SInt32 = 0LL;
    CFDataRef v8 = 0LL;
    goto LABEL_34;
  }

  FigSimpleMutexUnlock(*(void *)(DerivedStorage + 64));
  uint64_t v17 = APAudioSourceConduitCreate( v16,  *(void *)(DerivedStorage + 120) + 88LL,  *(void *)(DerivedStorage + 120) + 128LL,  5.94);
  if ((_DWORD)v17)
  {
    uint64_t v4 = v17;
    uint64_t v32 = 1521LL;
    goto LABEL_31;
  }

  uint64_t v26 = *(void *)(DerivedStorage + 136);
  uint64_t v27 = *(uint64_t (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v26) + 24) + 32LL);
  if (!v27)
  {
    uint64_t v4 = 4294954514LL;
LABEL_30:
    uint64_t v17 = v4;
    uint64_t v32 = 1530LL;
LABEL_31:
    APSLogErrorAt(v17, "device_StartIO", v32, 0LL);
    uint64_t v51 = 0LL;
    uint64_t v5 = 0LL;
    CFMutableDictionaryRef v6 = 0LL;
    goto LABEL_32;
  }

  uint64_t v28 = v27(v26);
  if ((_DWORD)v28)
  {
    uint64_t v4 = v28;
    goto LABEL_30;
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v16, 1LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v6 = Mutable;
  if (!Mutable)
  {
    APSLogErrorAt(0LL, "device_StartIO", 1533LL, 0LL);
    uint64_t v51 = 0LL;
    uint64_t v5 = 0LL;
    SInt32 = 0LL;
    CFDataRef v8 = 0LL;
    goto LABEL_105;
  }

  CMTime time = v56;
  uint64_t v30 = FigCFDictionarySetCMTime(Mutable, kAPAudioEngineResumeOption_AudioDeviceHostAnchorTime, &time);
  if ((_DWORD)v30)
  {
    uint64_t v4 = v30;
    uint64_t v50 = 1536LL;
  }

  else
  {
    FigCFDictionarySetValue( v6,  kFigEndpointStreamAudioEngineResumeOption_AudioSource,  *(void *)(*(void *)(DerivedStorage + 120) + 128LL));
    if (*(_DWORD *)(DerivedStorage + 84) != 1885433964)
    {
      CFDataRef v8 = 0LL;
LABEL_46:
      uint64_t v40 = FigEndpointStreamAudioEngineResumeSync(*(void *)(DerivedStorage + 112), v6, 4000LL);
      if ((_DWORD)v40)
      {
        uint64_t v4 = v40;
        APSLogErrorAt(v40, "device_StartIO", 1556LL, 0LL);
        uint64_t v51 = 0LL;
        uint64_t v5 = 0LL;
        SInt32 = 0LL;
      }

      else
      {
        uint64_t v51 = mach_absolute_time();
        SInt32 = (const void *)FigCFNumberCreateSInt32(v16, 3500LL);
        sub_B088( *(void *)(DerivedStorage + 104),  kFigEndpointStreamProperty_SubStreamResumptionTimeOutMs,  (uint64_t)SInt32);
        uint64_t v41 = FigEndpointStreamAudioEngineSetEndpointStreamSync( *(void *)(DerivedStorage + 112),  *(void *)(DerivedStorage + 104),  4000LL);
        uint64_t v4 = v41;
        if ((int)v41 <= 200400)
        {
          if ((_DWORD)v41 == -15486)
          {
            if (dword_141C8 <= 90
              && (dword_141C8 != -1 || _LogCategory_Initialize(&dword_141C8, 33554522LL)))
            {
              LogPrintF( &dword_141C8,  "OSStatus device_StartIO(FigHALAudioDeviceRef)",  33554522LL,  "### [%{ptr}] ESAE resume timed out. Continuing Async.\n",  a1);
            }

            goto LABEL_64;
          }

          if (!(_DWORD)v41)
          {
LABEL_64:
            uint64_t v5 = mach_absolute_time();
            FigSimpleMutexLock(*(void *)(DerivedStorage + 64));
            sub_8C54( *(void *)(DerivedStorage + 104),  kAPEndpointStreamProperty_DynamicLatencyOffsetMs,  (uint64_t)v16,  (uint64_t)&v58);
            if (!v58
              || (CFNumberGetValue(v58, kCFNumberSInt32Type, &immediateMasterTime),
                  uint64_t v42 = APSLatencyOffsetStepperSetTargetLatencyOffset((float)SLODWORD(immediateMasterTime.value)),
                  !(_DWORD)v42))
            {
              FigSimpleMutexUnlock(*(void *)(DerivedStorage + 64));
              uint64_t v4 = 0LL;
              char v9 = 1;
              *(_BYTE *)(*(void *)(DerivedStorage + 120) + 200LL) = 1;
              *(_DWORD *)(DerivedStorage + 168) = 1;
              goto LABEL_67;
            }

            uint64_t v4 = v42;
            APSLogErrorAt(v42, "device_StartIO", 1584LL, 0LL);
            char v9 = 0;
            goto LABEL_34;
          }
        }

        else if ((_DWORD)v41 == 200401 || (_DWORD)v41 == 200470)
        {
          if (dword_141C8 <= 90
            && (dword_141C8 != -1 || _LogCategory_Initialize(&dword_141C8, 33554522LL)))
          {
            LogPrintF( &dword_141C8,  "OSStatus device_StartIO(FigHALAudioDeviceRef)",  33554522LL,  "### [%{ptr}] ESAE resume failed for auth. Continuing.\n",  a1);
          }

          goto LABEL_64;
        }

        APSLogErrorAt(v41, "device_StartIO", 1572LL, 0LL);
        if (dword_141C8 <= 90 && (dword_141C8 != -1 || _LogCategory_Initialize(&dword_141C8, 33554522LL))) {
          LogPrintF( &dword_141C8,  "OSStatus device_StartIO(FigHALAudioDeviceRef)",  33554522LL,  "### [%{ptr}] ESAE resume failed err=%#m\n",  a1,  v4);
        }
        uint64_t v5 = 0LL;
      }

      goto LABEL_33;
    }

    uint64_t v30 = ASBDToAPAudioFormat(*(void *)(DerivedStorage + 120) + 88LL, &v55);
    if ((_DWORD)v30)
    {
      uint64_t v4 = v30;
      uint64_t v50 = 1543LL;
    }

    else
    {
      uint64_t TransportAudioFormatForPCMFormatLowLatencySender = APAudioFormatGetTransportAudioFormatForPCMFormatLowLatencySender(v55);
      uint64_t v30 = APAudioFormatToASBD(TransportAudioFormatForPCMFormatLowLatencySender, &time, 0LL);
      if (!(_DWORD)v30)
      {
        CFDataRef v8 = CFDataCreate(v16, (const UInt8 *)&time, 40LL);
        if (v8)
        {
          FigCFDictionarySetValue(v6, kFigEndpointStreamAudioEngineResumeOption_SupportedAudioFormats, v8);
          goto LABEL_46;
        }

        APSLogErrorAt(0LL, "device_StartIO", 1550LL, 0LL);
        uint64_t v51 = 0LL;
        uint64_t v5 = 0LL;
        SInt32 = 0LL;
LABEL_105:
        char v9 = 1;
        uint64_t v4 = 4294954510LL;
        goto LABEL_34;
      }

      uint64_t v4 = v30;
      uint64_t v50 = 1547LL;
    }
  }

  APSLogErrorAt(v30, "device_StartIO", v50, 0LL);
  uint64_t v51 = 0LL;
  uint64_t v5 = 0LL;
LABEL_32:
  SInt32 = 0LL;
  CFDataRef v8 = 0LL;
LABEL_33:
  char v9 = 1;
LABEL_34:
  uint64_t v33 = *(void *)(DerivedStorage + 136);
  int v34 = *(void (**)(uint64_t))(*(void *)(CMBaseObjectGetVTable(v33) + 24) + 40LL);
  if (v34) {
    v34(v33);
  }
  uint64_t v35 = *(const void **)(*(void *)(DerivedStorage + 120) + 128LL);
  if (v35)
  {
    CFRelease(v35);
    *(void *)(*(void *)(DerivedStorage + 120) + 128LL) = 0LL;
  }

  int v36 = *(const void **)(DerivedStorage + 176);
  if (v36)
  {
    CFRelease(v36);
    *(void *)(DerivedStorage + 176) = 0LL;
  }

  uint64_t v37 = *(const void **)(DerivedStorage + 56);
  if (v37)
  {
    CFRelease(v37);
    *(void *)(DerivedStorage + 56) = 0LL;
  }

  uint64_t v38 = *(void *)(DerivedStorage + 112);
  if (v38)
  {
    uint64_t v39 = *(void (**)(uint64_t, void, void, void))(*(void *)(CMBaseObjectGetVTable(*(void *)(DerivedStorage + 112))
                                                                             + 16)
                                                                 + 16LL);
    if (v39) {
      v39(v38, 0LL, 0LL, 0LL);
    }
  }

LABEL_67:
  if (v59[0]) {
    CFRelease(v59[0]);
  }
  if (v58) {
    CFRelease(v58);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (SInt32) {
    CFRelease(SInt32);
  }
  if (v8) {
    CFRelease(v8);
  }
  if ((v9 & 1) == 0) {
    FigSimpleMutexUnlock(*(void *)(DerivedStorage + 64));
  }
  uint64_t v43 = mach_absolute_time();
  if (dword_141C8 <= 50)
  {
    uint64_t v44 = v43;
    if (dword_141C8 != -1 || _LogCategory_Initialize(&dword_141C8, 33554482LL))
    {
      unint64_t v45 = UpTicksPerSecond();
      LogPrintF( &dword_141C8,  "OSStatus device_StartIO(FigHALAudioDeviceRef)",  33554482LL,  "[%{ptr}] StartIO total: %1.3f ms\n",  a1,  (float)((float)((float)(v44 - v52) / (float)v45) * 1000.0));
    }

    if (dword_141C8 <= 50 && (dword_141C8 != -1 || _LogCategory_Initialize(&dword_141C8, 33554482LL)))
    {
      unint64_t v46 = UpTicksPerSecond();
      LogPrintF( &dword_141C8,  "OSStatus device_StartIO(FigHALAudioDeviceRef)",  33554482LL,  "[%{ptr}] StartIO setEndpointStream: %1.3f ms\n",  a1,  (float)((float)((float)(v5 - v51) / (float)v46) * 1000.0));
    }
  }

  return v4;
}

uint64_t sub_BBFC(uint64_t a1, double *a2, void *a3, void *a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  uint64_t v40 = 0LL;
  double v41 = 0.0;
  uint64_t v42 = 0LL;
  if (!*(_BYTE *)(*(void *)(DerivedStorage + 120) + 200LL))
  {
    APSLogErrorAt(0LL, "device_GetZeroTimeStampWithSkewOffset", 1678LL, 0LL);
    return 1937010544LL;
  }

  uint64_t v8 = DerivedStorage;
  if (!*(void *)(DerivedStorage + 176))
  {
    APSLogErrorAt(0LL, "device_GetZeroTimeStampWithSkewOffset", 1679LL, 0LL);
    return 1852797029LL;
  }

  uint64_t v9 = mach_absolute_time();
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(v8 + 120);
  unsigned int v12 = *(_DWORD *)(v11 + 164);
  if (*(_DWORD *)(v11 + 156) != v12) {
    *(_DWORD *)(v11 + 156) = v12;
  }
  uint64_t v13 = *(void *)(v11 + 176);
  if (!v13)
  {
    CMTimebaseGetTimeWithTimeScale(&v39, *(CMTimebaseRef *)(v8 + 176), v12, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    int v19 = *(const void **)(v8 + 176);
    CMClockRef HostTimeClock = CMClockGetHostTimeClock();
    CMTime v37 = v39;
    CMSyncConvertTime(&v38, &v37, v19, HostTimeClock);
    *(double *)(*(void *)(v8 + 120) + 192LL) = (double)v39.value;
    CMTime v37 = v38;
    uint64_t v21 = CMClockConvertHostTimeToSystemUnits(&v37);
    uint64_t v18 = *(void *)(v8 + 120);
    *(void *)(v18 + 184) = v21;
    goto LABEL_9;
  }

  if (v9 >= v13)
  {
    CMTimeMake(&v39, (uint64_t)(*(double *)(v11 + 192) + 11025.0), v12);
    __int128 v14 = *(const void **)(v8 + 176);
    CMClockRef v15 = CMClockGetHostTimeClock();
    CMTime v37 = v39;
    CMSyncConvertTime(&v38, &v37, v14, v15);
    *(double *)(*(void *)(v8 + 120) + 192LL) = (double)v39.value;
    CMTime v37 = v38;
    uint64_t v16 = CMClockConvertHostTimeToSystemUnits(&v37);
    uint64_t v17 = *(void *)(v8 + 120);
    *(void *)(v17 + 184) = v16;
    APSLatencyOffsetStepperStepForInterval( *(void *)(v8 + 56),  (float)(11025.0 / (float)*(unsigned int *)(v17 + 164)) * 1000.0);
    uint64_t v18 = *(void *)(v8 + 120);
LABEL_9:
    CMTimeMake(&v39, (uint64_t)(*(double *)(v18 + 192) + 11025.0), *(_DWORD *)(v18 + 164));
    int v22 = *(const void **)(v8 + 176);
    CMClockRef v23 = CMClockGetHostTimeClock();
    CMTime v37 = v39;
    CMSyncConvertTime(&v38, &v37, v22, v23);
    CMTime v37 = v38;
    uint64_t v24 = CMClockConvertHostTimeToSystemUnits(&v37);
    uint64_t v25 = *(void *)(v8 + 120);
    *(void *)(v25 + 176) = v24;
    double v26 = *(double *)(v25 + 192);
    LODWORD(v27) = *(_DWORD *)(v25 + 164);
    double OffsetSamples = APSLatencyOffsetStepperGetOffsetSamples(*(void *)(v8 + 56), (double)v27);
    uint64_t v30 = *(void *)(v8 + 120);
    uint64_t v29 = *(void *)(v8 + 128);
    v37.CMTimeEpoch epoch = *(void *)(v30 + 184);
    uint64_t v31 = *(void *)(v30 + 192);
    *(double *)&v37.int value = v26 + OffsetSamples;
    *(void *)&v37.timescale = v31;
    APSRealTimeWritableWrite(v29, &v37);
    uint64_t v11 = *(void *)(v8 + 120);
    unsigned int v12 = *(_DWORD *)(v11 + 164);
  }

  double v32 = *(double *)(v11 + 192);
  double v33 = v32 + APSLatencyOffsetStepperGetOffsetSamples(*(void *)(v8 + 56), (double)v12);
  *a2 = v33;
  uint64_t v34 = *(void *)(v8 + 120);
  *a3 = *(void *)(v34 + 184);
  *a4 = 0LL;
  uint64_t v35 = *(void *)(v34 + 72);
  if (v35)
  {
    uint64_t v40 = v10;
    double v41 = v33;
    uint64_t v42 = *a3;
    APSRingBufferEnqueueBytes(v35, 24LL, &v40);
    double v33 = *a2;
  }

  kdebug_trace(722863640LL, (unint64_t)v33, *a3, 0LL, 0LL);
  return 0LL;
}

uint64_t sub_BF0C(uint64_t a1, int a2, BOOL *a3, BOOL *a4)
{
  if (*(_BYTE *)(*(void *)(CMBaseObjectGetDerivedStorage(a1) + 120) + 200LL))
  {
    uint64_t result = 0LL;
    *a3 = a2 == 1919513701;
    *a4 = a2 == 1919513701;
  }

  else
  {
    APSLogErrorAt(0LL, "device_WillDoIOOperation", 1778LL, 0LL);
    return 1937010544LL;
  }

  return result;
}

uint64_t sub_BF88(uint64_t a1)
{
  if (*(_BYTE *)(*(void *)(CMBaseObjectGetDerivedStorage(a1) + 120) + 200LL)) {
    return 0LL;
  }
  APSLogErrorAt(0LL, "device_BeginIOOperation", 1803LL, 0LL);
  return 1937010544LL;
}

uint64_t sub_BFD0(uint64_t a1)
{
  if (*(_BYTE *)(*(void *)(CMBaseObjectGetDerivedStorage(a1) + 120) + 200LL)) {
    return 0LL;
  }
  APSLogErrorAt(0LL, "device_EndIOOperation", 1814LL, 0LL);
  return 1937010544LL;
}

void sub_C018(id a1)
{
  qword_142D8 = 0LL;
  unk_142E0 = "APHALAudioSharedState";
  qword_142E8 = (uint64_t)sub_C06C;
  unk_142F0 = 0LL;
  qword_142F8 = (uint64_t)sub_C08C;
  unk_14300 = 0u;
  unk_14310 = 0u;
  qword_142D0 = _CFRuntimeRegisterClass();
}

double sub_C06C(_OWORD *a1)
{
  double result = 0.0;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  return result;
}

void sub_C08C(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 56);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t sub_C09C(const __CFAllocator *a1, CFDataRef *a2)
{
  *(void *)bytes = 3240582185LL;
  CFDataRef v3 = CFDataCreate(a1, bytes, 8LL);
  if (v3)
  {
    CFDataRef v4 = v3;
    uint64_t result = 0LL;
    *a2 = v4;
  }

  else
  {
    APSLogErrorAt(0LL, "APHALHandoffAudioControlCreateVolumeContext", 73LL, 0LL);
    return FigSignalErrorAt(4294954510LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  return result;
}

uint64_t sub_C124(uint64_t a1, uint64_t a2, uint64_t a3, int a4, const void *a5, CFTypeRef *a6)
{
  CFTypeRef cf = 0LL;
  int v19 = 0;
  uint64_t ClassID = FigHALAudioObjectGetClassID();
  uint64_t v13 = CMDerivedObjectCreate(a1, &unk_10C48, ClassID, &cf);
  if ((_DWORD)v13)
  {
    uint64_t v16 = v13;
    uint64_t v18 = 355LL;
  }

  else
  {
    uint64_t v13 = FigHALAudioObjectMapperAddMapping(a2, cf, &v19);
    if (!(_DWORD)v13)
    {
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(cf);
      *(void *)uint64_t DerivedStorage = a3;
      *(_DWORD *)(DerivedStorage + 8) = v19;
      *(_DWORD *)(DerivedStorage + 12) = a4;
      if (a5) {
        CFTypeRef v15 = CFRetain(a5);
      }
      else {
        CFTypeRef v15 = 0LL;
      }
      uint64_t v16 = 0LL;
      *(void *)(DerivedStorage + 16) = v15;
      *a6 = cf;
      return v16;
    }

    uint64_t v16 = v13;
    uint64_t v18 = 358LL;
  }

  APSLogErrorAt(v13, "APHALHandoffAudioVolumeControlCreate", v18, 0LL);
  if (cf) {
    CFRelease(cf);
  }
  return v16;
}

uint64_t sub_C224(uint64_t a1, uint64_t a2, uint64_t a3, int a4, const void *a5, CFTypeRef *a6)
{
  CFTypeRef cf = 0LL;
  int v19 = 0;
  uint64_t ClassID = FigHALAudioObjectGetClassID();
  uint64_t v13 = CMDerivedObjectCreate(a1, &unk_10C60, ClassID, &cf);
  if ((_DWORD)v13)
  {
    uint64_t v16 = v13;
    uint64_t v18 = 578LL;
  }

  else
  {
    uint64_t v13 = FigHALAudioObjectMapperAddMapping(a2, cf, &v19);
    if (!(_DWORD)v13)
    {
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(cf);
      *(void *)uint64_t DerivedStorage = a3;
      *(_DWORD *)(DerivedStorage + 8) = v19;
      *(_DWORD *)(DerivedStorage + 12) = a4;
      if (a5) {
        CFTypeRef v15 = CFRetain(a5);
      }
      else {
        CFTypeRef v15 = 0LL;
      }
      uint64_t v16 = 0LL;
      *(void *)(DerivedStorage + 16) = v15;
      *a6 = cf;
      return v16;
    }

    uint64_t v16 = v13;
    uint64_t v18 = 581LL;
  }

  APSLogErrorAt(v13, "APHALHandoffAudioMuteControlCreate", v18, 0LL);
  if (cf) {
    CFRelease(cf);
  }
  return v16;
}

void sub_C324(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  int v2 = *(const void **)(DerivedStorage + 16);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(DerivedStorage + 16) = 0LL;
  }

CFStringRef sub_C354(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  if (*((_DWORD *)BytePtr + 1)) {
    CFDataRef v3 = " MUTED";
  }
  else {
    CFDataRef v3 = (const char *)&unk_EA29;
  }
  return CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"APAudioVolumeControl ID %d Owner %d VolumeDB %f%s",  *(unsigned int *)(DerivedStorage + 8),  *(unsigned int *)(DerivedStorage + 12),  *(float *)BytePtr,  v3);
}

uint64_t sub_C3D8(uint64_t a1)
{
  return *(unsigned int *)(CMBaseObjectGetDerivedStorage(a1) + 8);
}

uint64_t sub_C3F0(uint64_t a1, int *a2)
{
  uint64_t result = 0LL;
  int v3 = *a2;
  if (*a2 <= 1818453105)
  {
    if (v3 > 1668047218)
    {
      BOOL v8 = v3 == 1668047219;
      int v9 = 1668506480;
    }

    else
    {
      BOOL v8 = v3 == 1650682995;
      int v9 = 1667591277;
    }

    goto LABEL_16;
  }

  if (v3 > 1818456931)
  {
    BOOL v8 = v3 == 1818456932 || v3 == 1937007734;
    int v9 = 1818456950;
LABEL_16:
    if (v8 || v3 == v9) {
      return 1LL;
    }
    return result;
  }

  unsigned int v4 = v3 - 1818453106;
  BOOL v5 = v4 > 4;
  int v6 = (1 << v4) & 0x13;
  if (!v5 && v6 != 0) {
    return 1LL;
  }
  return result;
}

BOOL sub_C4B4(uint64_t a1, _DWORD *a2)
{
  return *a2 == 1818456950 || *a2 == 1818453110;
}

uint64_t sub_C4D4(uint64_t a1, int *a2)
{
  int v2 = *a2;
  if (*a2 > 1818453106)
  {
    if (v2 <= 1818456931)
    {
      if (v2 != 1818453107 && v2 != 1818453110) {
        return 0LL;
      }
      return 4LL;
    }

    if (v2 == 1818456932 || v2 == 1818456950) {
      return 4LL;
    }
    int v6 = 1937007734;
LABEL_18:
    if (v2 == v6) {
      return 4LL;
    }
    else {
      return 0LL;
    }
  }

  if (v2 <= 1668047218)
  {
    if (v2 == 1650682995) {
      return 4LL;
    }
    int v6 = 1667591277;
    goto LABEL_18;
  }

  if (v2 == 1668047219) {
    return 4LL;
  }
  if (v2 == 1818453106) {
    unsigned int v3 = 16;
  }
  else {
    unsigned int v3 = 0;
  }
  if (v2 == 1668506480) {
    return 4LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_C5C0(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, float *a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  int v13 = *a2;
  uint64_t v14 = 2003332927LL;
  if (v13 > 1818453106)
  {
    if (v13 <= 1818456931)
    {
      if (v13 != 1818453107)
      {
        if (v13 != 1818453110) {
          return v14;
        }
        if (*((_DWORD *)BytePtr + 1)) {
          float v16 = -144.0;
        }
        else {
          float v16 = *(float *)BytePtr;
        }
        *a6 = 4;
        if (a5 < 4)
        {
          uint64_t v14 = 561211770LL;
          uint64_t v17 = 237LL;
          goto LABEL_46;
        }

LABEL_43:
        uint64_t v14 = 0LL;
        goto LABEL_44;
      }

      if (a5 != 4)
      {
        uint64_t v14 = 561211770LL;
        uint64_t v17 = 257LL;
        goto LABEL_46;
      }

      float v16 = APSVolumeConvertDBToSliderValue(BytePtr, *a7);
    }

    else
    {
      if (v13 != 1818456932)
      {
        if (v13 != 1818456950)
        {
          if (v13 != 1937007734) {
            return v14;
          }
          *a6 = 4;
          if (a5 < 4) {
            return 561211770LL;
          }
          uint64_t v14 = 0LL;
          int v15 = *(_DWORD *)(DerivedStorage + 12);
LABEL_34:
          *(_DWORD *)a7 = v15;
          return v14;
        }

        float v16 = 0.0;
        if (!*((_DWORD *)BytePtr + 1)) {
          float v16 = APSVolumeConvertDBToSliderValue(BytePtr, *(float *)BytePtr);
        }
        *a6 = 4;
        if (a5 < 4)
        {
          uint64_t v14 = 561211770LL;
          uint64_t v17 = 226LL;
LABEL_46:
          APSLogErrorAt(561211770LL, "volumeControl_GetPropertyData", v17, 0LL);
          return v14;
        }

        goto LABEL_43;
      }

      if (a5 != 4)
      {
        uint64_t v14 = 561211770LL;
        uint64_t v17 = 250LL;
        goto LABEL_46;
      }

      APSVolumeConvertSliderValueToDB(BytePtr, *a7);
    }

    uint64_t v14 = 0LL;
    *a6 = 4;
LABEL_44:
    *a7 = v16;
    return v14;
  }

  if (v13 <= 1668047218)
  {
    if (v13 != 1650682995)
    {
      if (v13 != 1667591277) {
        return v14;
      }
      *a6 = 4;
      if (a5 >= 4)
      {
        uint64_t v14 = 0LL;
        *a7 = 0.0;
        return v14;
      }

      return 561211770LL;
    }

    *a6 = 4;
    if (a5 < 4) {
      return 561211770LL;
    }
    uint64_t v14 = 0LL;
    int v15 = 1818588780;
    goto LABEL_34;
  }

  switch(v13)
  {
    case 1668047219:
      *a6 = 4;
      if (a5 < 4) {
        return 561211770LL;
      }
      uint64_t v14 = 0LL;
      int v15 = 1986817381;
      goto LABEL_34;
    case 1668506480:
      *a6 = 4;
      if (a5 < 4) {
        return 561211770LL;
      }
      uint64_t v14 = 0LL;
      int v15 = 1869968496;
      goto LABEL_34;
    case 1818453106:
      *a6 = 16;
      if (a5 >= 0x10)
      {
        uint64_t v14 = 0LL;
        *(_OWORD *)a7 = xmmword_D4F0;
        return v14;
      }

      return 561211770LL;
  }

  return v14;
}

uint64_t sub_C8C8(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, int a5, float *a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
  uint64_t v11 = (UInt8 *)BytePtr;
  int v12 = *a2;
  unsigned int v13 = a2[1];
  v18[0] = 1818453110;
  v18[1] = v13;
  unsigned int v19 = a2[2];
  int v20 = 1818456950;
  unint64_t v21 = __PAIR64__(v19, v13);
  if (v12 == 1818453110)
  {
    if (a5 == 4)
    {
      float v14 = *a6;
      goto LABEL_7;
    }

    uint64_t v15 = 561211770LL;
    uint64_t v16 = 295LL;
LABEL_11:
    APSLogErrorAt(561211770LL, "volumeControl_SetPropertyData", v16, 0LL);
    return v15;
  }

  if (v12 != 1818456950) {
    return 2003332927LL;
  }
  if (a5 != 4)
  {
    uint64_t v15 = 561211770LL;
    uint64_t v16 = 285LL;
    goto LABEL_11;
  }

  APSVolumeConvertSliderValueToDB(BytePtr, *a6);
LABEL_7:
  *(float *)uint64_t v11 = v14;
  FigHALAudioPropertySendChanges(*(void *)DerivedStorage, *(unsigned int *)(DerivedStorage + 8), 2LL, v18);
  return 0LL;
}

CFStringRef sub_CA10(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (*((_DWORD *)CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16)) + 1)) {
    int v2 = (const char *)&unk_EA29;
  }
  else {
    int v2 = "Not ";
  }
  return CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"APAudioMuteControl ID %d Owner %d %sMuted",  *(unsigned int *)(DerivedStorage + 8),  *(unsigned int *)(DerivedStorage + 12),  v2);
}

uint64_t sub_CA88(uint64_t a1, int *a2)
{
  uint64_t result = 0LL;
  int v3 = *a2;
  if (*a2 > 1668047218)
  {
    BOOL v4 = v3 == 1668047219 || v3 == 1937007734;
    int v5 = 1668506480;
  }

  else
  {
    BOOL v4 = v3 == 1650682995 || v3 == 1650685548;
    int v5 = 1667591277;
  }

  if (v4 || v3 == v5) {
    return 1LL;
  }
  return result;
}

BOOL sub_CAF4(uint64_t a1, _DWORD *a2)
{
  return *a2 == 1650685548;
}

uint64_t sub_CB0C(uint64_t a1, int *a2)
{
  int v2 = *a2;
  if (*a2 > 1668047218)
  {
    if (v2 != 1937007734 && v2 != 1668506480 && v2 != 1668047219) {
      return 0LL;
    }
    return 4LL;
  }

  if (v2 == 1650682995) {
    return 4LL;
  }
  if (v2 == 1667591277) {
    unsigned int v3 = 4;
  }
  else {
    unsigned int v3 = 0;
  }
  if (v2 == 1650685548) {
    return 4LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_CB9C(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, int *a7)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  int v12 = *a2;
  uint64_t result = 2003332927LL;
  if (*a2 > 1668047218)
  {
    if (v12 == 1668047219)
    {
      *a6 = 4;
      if (a5 > 3)
      {
        int v14 = 1836414053;
        goto LABEL_21;
      }

      return 561211770LL;
    }

    if (v12 == 1668506480)
    {
      *a6 = 4;
      if (a5 > 3)
      {
        int v14 = 1869968496;
        goto LABEL_21;
      }

      return 561211770LL;
    }

    if (v12 != 1937007734) {
      return result;
    }
    *a6 = 4;
    if (a5 < 4) {
      return 561211770LL;
    }
    uint64_t v15 = (const UInt8 *)(DerivedStorage + 12);
    goto LABEL_18;
  }

  if (v12 != 1650682995)
  {
    if (v12 != 1650685548)
    {
      if (v12 != 1667591277) {
        return result;
      }
      *a6 = 4;
      if (a5 > 3)
      {
        int v14 = 0;
LABEL_21:
        uint64_t result = 0LL;
        *a7 = v14;
        return result;
      }

      return 561211770LL;
    }

    *a6 = 4;
    if (a5 < 4) {
      return 561211770LL;
    }
    uint64_t v15 = CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16)) + 4;
LABEL_18:
    int v14 = *(_DWORD *)v15;
    goto LABEL_21;
  }

  *a6 = 4;
  if (a5 > 3)
  {
    int v14 = 1953458028;
    goto LABEL_21;
  }

  return 561211770LL;
}

uint64_t sub_CD08(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, int a5, int *a6)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (*a2 != 1650685548) {
    return 2003332927LL;
  }
  if (a5 == 4)
  {
    uint64_t v10 = DerivedStorage;
    int v11 = *a6;
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(DerivedStorage + 16));
    if (v11 != *((_DWORD *)BytePtr + 1))
    {
      *((_DWORD *)BytePtr + 1) = v11 != 0;
      FigHALAudioPropertySendOneChange( *(void *)v10,  *(unsigned int *)(v10 + 8),  1650685548LL,  a2[1],  a2[2]);
    }

    return 0LL;
  }

  else
  {
    uint64_t v13 = 561211770LL;
    APSLogErrorAt(561211770LL, "muteControl_SetPropertyData", 512LL, 0LL);
  }

  return v13;
}

uint64_t sub_CDD8(uint64_t a1)
{
  if (IsAppleInternalBuild(a1))
  {
    LogControl( "?AirPlayClientCore:level=info,AirPlayEndpointCore:level=info,AirPlayHALPluginCore:level=info,AirPlayHIDCore:level= info,APAudioEngine:level=info,APBrowser:level=verbose,APBrowserBTLEManager:level=info,APBonjourBrowser:level=info, APBrowserController:level=info,APEndpoint:level=info,APEndpointManager:level=info,APEndpointStreamAudio:level=info ,APEndpointStreamPlayback:level=info,APEndpointStreamScreen:level=info,APSenderSessionSDP:level=info,APSenderSessi onAirPlay:level=info,AirPlayPairing:level=info");
  }

  else
  {
    LogControl("?.*:output2=");
    uint64_t v1 = (void (*)(const char *))dlsym((void *)0xFFFFFFFFFFFFFFFFLL, "MediaControlSenderLogControl");
    if (v1) {
      v1("?.*:output2=");
    }
  }

  return LogControl(".*:flags=public;time");
}