void sub_287C(int a1, void *a2, MIDIDeviceRef device, void *a4, uint64_t a5, char **a6)
{
  int NumberOfEntities;
  ItemCount v11;
  void *v12;
  void *v13;
  uint64_t Entity;
  uint64_t v15;
  OSStatus IntegerProperty;
  SInt32 v17;
  ItemCount i;
  uint64_t v19;
  MIDIEndpointRef Source;
  MIDIEndpointRef *v21;
  _DWORD *v22;
  MIDIEndpointRef *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  unint64_t v29;
  MIDIEndpointRef *v30;
  unint64_t v31;
  _DWORD *v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  int v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  int v51;
  __int16 v52;
  MIDIEndpointRef *v53;
  MIDIEndpointRef v54;
  unint64_t v55;
  unint64_t v56;
  char *v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  char *v65;
  char *v66;
  int v67;
  __int16 v68;
  MIDIEntityRef v69;
  ItemCount v70;
  int v71;
  int v72;
  ItemCount v73;
  MIDIEndpointRef Destination;
  void *v75;
  uint64_t v76;
  void *v77;
  int v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  ItemCount v86;
  SInt32 v87;
  ItemCount NumberOfSources;
  ItemCount NumberOfDestinations;
  uint64_t v90;
  SInt32 outValue;
  SInt32 v92;
  NumberOfEntities = MIDIDeviceGetNumberOfEntities(device);
  outValue = 0;
  if (NumberOfEntities >= 1)
  {
    v11 = 0LL;
    v87 = 0;
    v83 = (NumberOfEntities - 1);
    v12 = (void *)(a5 + 16);
    v90 = (uint64_t)(a6 + 2);
    if (a1) {
      v13 = a2;
    }
    else {
      v13 = 0LL;
    }
    v81 = NumberOfEntities;
    v78 = a1 ^ 1;
    v82 = a1;
    v79 = NumberOfEntities - 1LL;
    v80 = v13;
    do
    {
      Entity = MIDIDeviceGetEntity(device, v11);
      v15 = Entity;
      else {
        outValue = *(unsigned __int8 *)(*a4 + 8 * v11 + 5);
      }
      if (v83 == v11)
      {
        v92 = 0;
        IntegerProperty = MIDIObjectGetIntegerProperty(v15, kMIDIPropertyUMPCanTransmitGroupless, &v92);
        v17 = v92;
        if (IntegerProperty) {
          v17 = IntegerProperty;
        }
        v87 = v17;
      }

      v86 = v11;
      NumberOfSources = MIDIEntityGetNumberOfSources(v15);
      NumberOfDestinations = MIDIEntityGetNumberOfDestinations(v15);
      if (a1 && NumberOfSources)
      {
        for (i = 0LL; i != NumberOfSources; ++i)
        {
          v19 = v15;
          Source = MIDIEntityGetSource(v15, i);
          v21 = *(MIDIEndpointRef **)(a5 + 8);
          if (!v87)
          {
            v29 = i + outValue;
            while (1)
            {
              v30 = *(MIDIEndpointRef **)a5;
              v31 = ((uint64_t)v21 - *(void *)a5) >> 2;
              if (v31 >= v29) {
                break;
              }
              if ((unint64_t)v21 >= *v12)
              {
                v33 = v31 + 1;
                if ((v31 + 1) >> 62) {
                  goto LABEL_102;
                }
                v34 = *v12 - (void)v30;
                if (v34 >> 1 > v33) {
                  v33 = v34 >> 1;
                }
                else {
                  v35 = v33;
                }
                if (v35)
                {
                  v36 = (char *)sub_2E68(a5 + 16, v35);
                  v30 = *(MIDIEndpointRef **)a5;
                  v21 = *(MIDIEndpointRef **)(a5 + 8);
                }

                else
                {
                  v36 = 0LL;
                }

                v37 = &v36[4 * v31];
                *(_DWORD *)v37 = 0;
                v32 = v37 + 4;
                while (v21 != v30)
                {
                  v38 = *--v21;
                  *((_DWORD *)v37 - 1) = v38;
                  v37 -= 4;
                }

                *(void *)a5 = v37;
                *(void *)(a5 + 8) = v32;
                *(void *)(a5 + 16) = &v36[4 * v35];
                if (v30) {
                  operator delete(v30);
                }
              }

              else
              {
                *v21 = 0;
                v32 = v21 + 1;
              }

              *(void *)(a5 + 8) = v32;
              v40 = (unint64_t)a6[1];
              v39 = (unint64_t)a6[2];
              if (v40 >= v39)
              {
                v42 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v40 - (void)*a6) >> 1);
                v43 = v42 + 1;
                if (v42 + 1 > 0x2AAAAAAAAAAAAAAALL) {
                  goto LABEL_103;
                }
                v44 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v39 - (void)*a6) >> 1);
                if (2 * v44 > v43) {
                  v43 = 2 * v44;
                }
                if (v44 >= 0x1555555555555555LL) {
                  v45 = 0x2AAAAAAAAAAAAAAALL;
                }
                else {
                  v45 = v43;
                }
                if (v45) {
                  v46 = (char *)sub_2EC4(v90, v45);
                }
                else {
                  v46 = 0LL;
                }
                v47 = &v46[6 * v42];
                *((_WORD *)v47 + 2) = 0;
                *(_DWORD *)v47 = 0;
                v49 = *a6;
                v48 = a6[1];
                v50 = v47;
                if (v48 != *a6)
                {
                  do
                  {
                    v51 = *(_DWORD *)(v48 - 6);
                    v48 -= 6;
                    v52 = *((_WORD *)v48 + 2);
                    *(_DWORD *)(v50 - 6) = v51;
                    v50 -= 6;
                    *((_WORD *)v50 + 2) = v52;
                  }

                  while (v48 != v49);
                  v48 = *a6;
                }

                v41 = v47 + 6;
                *a6 = v50;
                a6[1] = v47 + 6;
                a6[2] = &v46[6 * v45];
                if (v48) {
                  operator delete(v48);
                }
              }

              else
              {
                *(_WORD *)(v40 + 4) = 0;
                *(_DWORD *)v40 = 0;
                v41 = (char *)(v40 + 6);
              }

              a6[1] = v41;
              v21 = *(MIDIEndpointRef **)(a5 + 8);
            }
          }

          if ((unint64_t)v21 >= *v12)
          {
            v23 = *(MIDIEndpointRef **)a5;
            v24 = ((uint64_t)v21 - *(void *)a5) >> 2;
            v25 = v24 + 1;
            if ((unint64_t)(v24 + 1) >> 62) {
LABEL_102:
            }
              sub_2DE0();
            v26 = *v12 - (void)v23;
            if (v26 >> 1 > v25) {
              v25 = v26 >> 1;
            }
            else {
              v27 = v25;
            }
            if (v27)
            {
              v28 = (char *)sub_2E68(a5 + 16, v27);
              v23 = *(MIDIEndpointRef **)a5;
              v21 = *(MIDIEndpointRef **)(a5 + 8);
            }

            else
            {
              v28 = 0LL;
            }

            v53 = (MIDIEndpointRef *)&v28[4 * v24];
            *v53 = Source;
            v22 = v53 + 1;
            while (v21 != v23)
            {
              v54 = *--v21;
              *--v53 = v54;
            }

            *(void *)a5 = v53;
            *(void *)(a5 + 8) = v22;
            *(void *)(a5 + 16) = &v28[4 * v27];
            if (v23) {
              operator delete(v23);
            }
          }

          else
          {
            *v21 = Source;
            v22 = v21 + 1;
          }

          *(void *)(a5 + 8) = v22;
          v56 = (unint64_t)a6[1];
          v55 = (unint64_t)a6[2];
          if (v56 >= v55)
          {
            v58 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v56 - (void)*a6) >> 1);
            v59 = v58 + 1;
            if (v58 + 1 > 0x2AAAAAAAAAAAAAAALL) {
LABEL_103:
            }
              sub_2DE0();
            v60 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v55 - (void)*a6) >> 1);
            if (2 * v60 > v59) {
              v59 = 2 * v60;
            }
            if (v60 >= 0x1555555555555555LL) {
              v61 = 0x2AAAAAAAAAAAAAAALL;
            }
            else {
              v61 = v59;
            }
            if (v61) {
              v62 = (char *)sub_2EC4(v90, v61);
            }
            else {
              v62 = 0LL;
            }
            v63 = &v62[6 * v58];
            *((_WORD *)v63 + 2) = 0;
            *(_DWORD *)v63 = 0;
            v65 = *a6;
            v64 = a6[1];
            v66 = v63;
            if (v64 != *a6)
            {
              do
              {
                v67 = *(_DWORD *)(v64 - 6);
                v64 -= 6;
                v68 = *((_WORD *)v64 + 2);
                *(_DWORD *)(v66 - 6) = v67;
                v66 -= 6;
                *((_WORD *)v66 + 2) = v68;
              }

              while (v64 != v65);
              v64 = *a6;
            }

            v57 = v63 + 6;
            *a6 = v66;
            a6[1] = v63 + 6;
            a6[2] = &v62[6 * v61];
            if (v64) {
              operator delete(v64);
            }
          }

          else
          {
            *(_WORD *)(v56 + 4) = 0;
            *(_DWORD *)v56 = 0;
            v57 = (char *)(v56 + 6);
          }

          a6[1] = v57;
          v15 = v19;
        }
      }

      if (NumberOfDestinations)
      {
        v69 = v15;
        v70 = 0LL;
        v71 = v78;
        if (!v87) {
          v71 = 1;
        }
        if (v79 == v86) {
          v72 = v71;
        }
        else {
          v72 = 1;
        }
        do
        {
          v73 = v70 + outValue;
          Destination = MIDIEntityGetDestination(v69, v70);
          if (v82) {
            v75 = (void *)v73;
          }
          else {
            v75 = 0LL;
          }
          v76 = 255LL;
          if (NumberOfDestinations - 1 != v70) {
            v76 = (uint64_t)v75;
          }
          if (v72) {
            v77 = v75;
          }
          else {
            v77 = (void *)v76;
          }
          MIDIEndpointSetRefCons(Destination, v80, v77);
          ++v70;
        }

        while (NumberOfDestinations != v70);
      }

      v11 = v86 + 1;
      a1 = v82;
    }

    while (v86 + 1 != v81);
  }
}

void sub_2DE0()
{
}

void sub_2DF4(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_2E44(exception, a1);
}

void sub_2E30(_Unwind_Exception *a1)
{
}

std::logic_error *sub_2E44(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_2E68(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_2E9C();
  }
  return operator new(4 * a2);
}

void sub_2E9C()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_2EC4(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAAABLL) {
    sub_2E9C();
  }
  return operator new(6 * a2);
}

void sub_2F0C(std::exception *a1)
{
}

const char *sub_2F20()
{
  return "CAException";
}

void *sub_2F2C()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_2C118);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_2C118))
  {
    sub_325C((uint64_t)&unk_2C0B0);
    __cxa_guard_release(&qword_2C118);
  }

  return &unk_2C0B0;
}

void sub_2F88(_Unwind_Exception *a1)
{
}

uint64_t sub_2FA0(const __CFString *a1, _BYTE *a2)
{
  int valuePtr = 0;
  *a2 = 0;
  if (a1)
  {
    CFTypeID v4 = CFGetTypeID(a1);
    if (v4 == CFBooleanGetTypeID())
    {
      int valuePtr = CFBooleanGetValue((CFBooleanRef)a1);
LABEL_6:
      *a2 = 1;
      return valuePtr;
    }

    if (v4 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)a1, kCFNumberIntType, &valuePtr);
      goto LABEL_6;
    }

    if (v4 == CFStringGetTypeID())
    {
      CFStringGetCString(a1, buffer, 64LL, 0x600u);
      if (sscanf(buffer, "%d", &valuePtr) == 1) {
        goto LABEL_6;
      }
    }
  }

  return valuePtr;
}

BOOL sub_3098(const __CFBoolean *a1, _BYTE *a2)
{
  int valuePtr = 0;
  *a2 = 0;
  if (a1)
  {
    v3 = a1;
    CFTypeID v4 = CFGetTypeID(a1);
    if (v4 == CFBooleanGetTypeID())
    {
      LODWORD(a1) = CFBooleanGetValue(v3);
LABEL_6:
      *a2 = 1;
      return (_DWORD)a1 != 0;
    }

    if (v4 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v3, kCFNumberIntType, &valuePtr);
      LODWORD(a1) = valuePtr != 0;
      goto LABEL_6;
    }

    if (v4 != CFStringGetTypeID())
    {
      LODWORD(a1) = 0;
      return (_DWORD)a1 != 0;
    }

    CFStringGetCString((CFStringRef)v3, buffer, 64LL, 0x600u);
    if (sscanf(buffer, "%d", &valuePtr) == 1)
    {
      *a2 = 1;
      LODWORD(a1) = valuePtr != 0;
      return (_DWORD)a1 != 0;
    }

    char v6 = buffer[0];
    if (buffer[0])
    {
      v7 = &buffer[1];
      do
      {
        *(v7 - 1) = __tolower(v6);
        int v8 = *v7++;
        char v6 = v8;
      }

      while (v8);
    }

    if (!(*(unsigned __int16 *)buffer ^ 0x6F6E | buffer[2])
      || (*(_DWORD *)buffer == 1936482662 ? (BOOL v9 = v12 == 101) : (BOOL v9 = 0), v9))
    {
      LODWORD(a1) = 0;
      goto LABEL_6;
    }

    if (*(_DWORD *)buffer == 7562617 || !(*(_DWORD *)buffer ^ 0x65757274 | v12))
    {
      LODWORD(a1) = 1;
      *a2 = 1;
    }

    else
    {
      LODWORD(a1) = valuePtr;
    }
  }

  return (_DWORD)a1 != 0;
}

uint64_t sub_325C(uint64_t a1)
{
  *(void *)a1 = 850045863LL;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(void *)(a1 + 56) = 0LL;
  *(void *)(a1 + 64) = CFSetCreateMutable(0LL, 0LL, &kCFTypeSetCallBacks);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 1uLL, 0LL, global_queue);
  *(void *)(a1 + 96) = v3;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000LL;
  handler[2] = sub_3344;
  handler[3] = &unk_285B0;
  handler[4] = a1;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_resume(*(dispatch_object_t *)(a1 + 96));
  return a1;
}

void sub_3330(_Unwind_Exception *a1)
{
}

void sub_3344(uint64_t a1)
{
}

void sub_334C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 80);
  while (v2 != v3)
  {
    sub_3514(v2);
    v2 += 48LL;
  }

  std::mutex::unlock((std::mutex *)a1);
}

void sub_33A8(_Unwind_Exception *a1)
{
}

uint64_t sub_33C0(uint64_t a1, CFTypeRef cf1, const void *a3)
{
  uint64_t v3 = *(CFTypeRef **)(a1 + 72);
  CFTypeID v4 = *(CFTypeRef **)(a1 + 80);
  if (v3 == v4) {
    return 0LL;
  }
  while (!CFEqual(cf1, *v3) || !CFEqual(a3, v3[1]))
  {
    v3 += 6;
    if (v3 == v4) {
      return 0LL;
    }
  }

  return 1LL;
}

void sub_342C(uint64_t a1, const void *a2, void *a3, uint64_t a4)
{
  value = a3;
  v11 = a2;
  std::mutex::lock((std::mutex *)a1);
  if ((sub_33C0(a1, a2, a3) & 1) == 0)
  {
    CFRetain(a2);
    CFRetain(a3);
    unint64_t v8 = *(void *)(a1 + 80);
    if (v8 >= *(void *)(a1 + 88))
    {
      uint64_t v9 = sub_3594((uint64_t *)(a1 + 72), (uint64_t *)&v11, (uint64_t *)&value, a4);
    }

    else
    {
      sub_36B0(*(void **)(a1 + 80), (uint64_t *)&v11, (uint64_t *)&value, a4);
      uint64_t v9 = v8 + 48;
      *(void *)(a1 + 80) = v8 + 48;
    }

    *(void *)(a1 + 80) = v9;
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 64), value);
    sub_3514(*(void *)(a1 + 80) - 48LL);
  }

  std::mutex::unlock((std::mutex *)a1);
}

void sub_34F4(_Unwind_Exception *a1)
{
  *(void *)(v1 + 80) = v2;
  std::mutex::unlock((std::mutex *)v1);
  _Unwind_Resume(a1);
}

CFPropertyListRef sub_3514(uint64_t a1)
{
  CFPropertyListRef result = CFPreferencesCopyAppValue(*(CFStringRef *)a1, *(CFStringRef *)(a1 + 8));
  if (result)
  {
    CFPropertyListRef v4 = result;
    uint64_t v3 = *(void *)(a1 + 40);
    if (!v3) {
      sub_3B48();
    }
    return (CFPropertyListRef)(*(uint64_t (**)(uint64_t, CFPropertyListRef *))(*(void *)v3 + 48LL))(v3, &v4);
  }

  return result;
}

uint64_t sub_3568(const __CFString *a1)
{
  return CFPreferencesSynchronize(a1, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
}

void sub_3584(void *a1)
{
}

uint64_t sub_3594(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v5 = *a1;
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v7 = v6 + 1;
  if (v6 + 1 > 0x555555555555555LL) {
    sub_2DE0();
  }
  uint64_t v11 = (uint64_t)(a1 + 2);
  unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v5) >> 4);
  if (2 * v12 > v7) {
    unint64_t v7 = 2 * v12;
  }
  if (v12 >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v13 = 0x555555555555555LL;
  }
  else {
    unint64_t v13 = v7;
  }
  v21 = a1 + 2;
  if (v13) {
    v14 = (char *)sub_38B8(v11, v13);
  }
  else {
    v14 = 0LL;
  }
  v17 = v14;
  v18 = &v14[48 * v6];
  v20 = &v14[48 * v13];
  sub_36B0(v18, a2, a3, a4);
  v19 = v18 + 48;
  sub_3844(a1, &v17);
  uint64_t v15 = a1[1];
  sub_3AA4(&v17);
  return v15;
}

void sub_369C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void *sub_36B0(void *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v5 = *a2;
  uint64_t v6 = *a3;
  sub_37E0((uint64_t)v10, a4);
  *a1 = v5;
  a1[1] = v6;
  if (v11)
  {
    if (v11 == v10)
    {
      a1[5] = a1 + 2;
      (*(void (**)(void *))(v10[0] + 24LL))(v10);
    }

    else
    {
      a1[5] = (*(uint64_t (**)(void))(*v11 + 16LL))();
    }

    unint64_t v7 = v11;
    if (v11 == v10)
    {
      uint64_t v8 = 4LL;
      unint64_t v7 = v10;
      goto LABEL_10;
    }

    if (v11)
    {
      uint64_t v8 = 5LL;
LABEL_10:
      (*(void (**)(void))(*v7 + 8 * v8))();
    }
  }

  else
  {
    a1[5] = 0LL;
  }

  return a1;
}

void sub_379C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  v14 = a13;
  if (a13 == &a10)
  {
    uint64_t v15 = 4LL;
    v14 = &a10;
  }

  else
  {
    if (!a13) {
      goto LABEL_6;
    }
    uint64_t v15 = 5LL;
  }

  (*(void (**)(void))(*(void *)v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t sub_37E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24LL))(*(void *)(a2 + 24), a1);
    }

    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16LL))(v3);
    }
  }

  else
  {
    *(void *)(a1 + 24) = 0LL;
  }

  return a1;
}

uint64_t sub_3844(uint64_t *a1, void *a2)
{
  uint64_t result = sub_38FC((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_38B8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556LL) {
    sub_2E9C();
  }
  return operator new(48 * a2);
}

uint64_t sub_38FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v15 = a6;
  *((void *)&v15 + 1) = a7;
  __int128 v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  char v13 = 0;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }

  else
  {
    do
    {
      uint64_t v9 = a3 - 48;
      *(_OWORD *)(v7 - 48) = *(_OWORD *)(a3 - 48);
      sub_39A8(v7 - 32, a3 - 32);
      uint64_t v7 = *((void *)&v15 + 1) - 48LL;
      *((void *)&v15 + 1) -= 48LL;
      a3 = v9;
    }

    while (v9 != a5);
    uint64_t v10 = v15;
  }

  char v13 = 1;
  sub_3A0C((uint64_t)v12);
  return v10;
}

uint64_t sub_39A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24LL))(*v3, a1);
      return a1;
    }

    *(void *)(a1 + 24) = v4;
  }

  else
  {
    uint64_t v3 = (void *)(a1 + 24);
  }

  void *v3 = 0LL;
  return a1;
}

uint64_t sub_3A0C(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_3A40((void *)a1);
  }
  return a1;
}

void *sub_3A40(void *result)
{
  uint64_t v1 = *(void *)(result[2] + 8LL);
  uint64_t v2 = *(void *)(result[1] + 8LL);
  while (v1 != v2)
  {
    uint64_t result = *(void **)(v1 + 40);
    if ((void *)(v1 + 16) == result)
    {
      uint64_t result = (void *)(v1 + 16);
      uint64_t v3 = 4LL;
    }

    else
    {
      if (!result) {
        goto LABEL_8;
      }
      uint64_t v3 = 5LL;
    }

    uint64_t result = (void *)(*(uint64_t (**)(void))(*result + 8 * v3))();
LABEL_8:
    v1 += 48LL;
  }

  return result;
}

void **sub_3AA4(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void *sub_3AD4(void *result)
{
  uint64_t v2 = result[1];
  uint64_t v1 = result[2];
  if (v1 != v2)
  {
    uint64_t v3 = result;
    do
    {
      v3[2] = v1 - 48;
      uint64_t result = *(void **)(v1 - 8);
      if (result == (void *)(v1 - 32))
      {
        uint64_t result = (void *)(v1 - 32);
        uint64_t v4 = 4LL;
      }

      else
      {
        if (!result)
        {
          v1 -= 48LL;
          continue;
        }

        uint64_t v4 = 5LL;
      }

      uint64_t result = (void *)(*(uint64_t (**)(void))(*result + 8 * v4))();
      uint64_t v1 = v3[2];
    }

    while (v1 != v2);
  }

  return result;
}

void sub_3B48()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_285F8;
}

void sub_3B80(std::exception *a1)
{
}

uint64_t sub_3B94(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_28620;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = 0LL;
  int v3 = pthread_mutex_init((pthread_mutex_t *)(a1 + 24), 0LL);
  if (v3)
  {
    int v5 = v3;
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6) {
      sub_2102C(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &off_28598;
    exception[2] = v5;
  }

  return a1;
}

uint64_t sub_3C24(uint64_t a1)
{
  *(void *)a1 = off_28620;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
  return a1;
}

void sub_3C58(char *a1)
{
  *(void *)a1 = off_28620;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
  operator delete(a1);
}

BOOL sub_3C8C(uint64_t a1)
{
  uint64_t v2 = pthread_self();
  int v3 = (_opaque_pthread_t *)atomic_load((unint64_t *)(a1 + 16));
  int v4 = pthread_equal(v2, v3);
  if (!v4)
  {
    int v5 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
    if (v5)
    {
      int v7 = v5;
      BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v8) {
        sub_21060(v8, v9, v10, v11, v12, v13, v14, v15);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &off_28598;
      exception[2] = v7;
    }

    atomic_store((unint64_t)v2, (unint64_t *)(a1 + 16));
  }

  return v4 == 0;
}

void sub_3D34(uint64_t a1)
{
  uint64_t v2 = pthread_self();
  int v3 = (_opaque_pthread_t *)atomic_load((unint64_t *)(a1 + 16));
  if (pthread_equal(v2, v3))
  {
    atomic_store(0LL, (unint64_t *)(a1 + 16));
    int v4 = pthread_mutex_unlock((pthread_mutex_t *)(a1 + 24));
    if (v4)
    {
      int v5 = v4;
      BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v6) {
        sub_21094(v6, v7, v8, v9, v10, v11, v12, v13);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &off_28598;
      exception[2] = v5;
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " CAMutex::Unlock: A thread is attempting to unlock a Mutex it doesn't own",  v15,  2u);
  }

uint64_t sub_3E08(uint64_t a1, char *a2)
{
  *a2 = 0;
  int v4 = pthread_self();
  int v5 = (_opaque_pthread_t *)atomic_load((unint64_t *)(a1 + 16));
  if (pthread_equal(v4, v5))
  {
    char v6 = 0;
  }

  else
  {
    int v7 = pthread_mutex_trylock((pthread_mutex_t *)(a1 + 24));
    if (v7 == 16)
    {
      char v6 = 0;
      uint64_t result = 0LL;
      goto LABEL_7;
    }

    if (v7)
    {
      v11[0] = HIBYTE(v7);
      v11[1] = BYTE2(v7);
      v11[2] = BYTE1(v7);
      int v9 = v7;
      v11[3] = v7;
      v11[4] = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_210C8((uint64_t)v11, v9);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &off_28598;
      exception[2] = v9;
    }

    atomic_store((unint64_t)v4, (unint64_t *)(a1 + 16));
    char v6 = 1;
  }

  uint64_t result = 1LL;
LABEL_7:
  *a2 = v6;
  return result;
}

BOOL sub_3F04(uint64_t a1)
{
  unint64_t v1 = atomic_load((unint64_t *)(a1 + 16));
  return v1 == 0;
}

BOOL sub_3F18(uint64_t a1)
{
  uint64_t v2 = pthread_self();
  int v3 = (_opaque_pthread_t *)atomic_load((unint64_t *)(a1 + 16));
  return pthread_equal(v2, v3) != 0;
}

void sub_3F4C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_3F64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = off_28690;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 24) = 0;
  char v6 = (mach_port_t *)(a1 + 24);
  *(void *)(a1 + 32) = 0LL;
  int v7 = (IONotificationPort **)(a1 + 32);
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 40) = 0LL;
  uint64_t v8 = (io_iterator_t *)(a1 + 40);
  *(_BYTE *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = a3;
  sub_43DC();
  int v9 = (os_log_s *)qword_2C120;
  if (os_log_type_enabled((os_log_t)qword_2C120, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 136316162;
    v27 = "IOServiceClient.cpp";
    __int16 v28 = 1024;
    int v29 = 37;
    __int16 v30 = 2048;
    uint64_t v31 = a1;
    __int16 v32 = 2048;
    uint64_t v33 = a2;
    __int16 v34 = 2048;
    uint64_t v35 = a3;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [+] IOServiceClient(%p)::IOServiceClient(notifyRunLoop %p, matchingDict %p",  (uint8_t *)&v26,  0x30u);
  }

  if (IOMainPort(0, v6)) {
    goto LABEL_21;
  }
  uint64_t v10 = *(const void **)(a1 + 8);
  if (!v10) {
    return a1;
  }
  CFRetain(v10);
  uint64_t v11 = IONotificationPortCreate(*v6);
  void *v7 = v11;
  if (!v11) {
    goto LABEL_21;
  }
  RunLoopSource = IONotificationPortGetRunLoopSource(v11);
  *(void *)(a1 + 16) = RunLoopSource;
  if (!RunLoopSource) {
    goto LABEL_21;
  }
  CFRunLoopAddSource(*(CFRunLoopRef *)(a1 + 8), RunLoopSource, kCFRunLoopDefaultMode);
  sub_43DC();
  uint64_t v13 = (os_log_s *)qword_2C120;
  if (os_log_type_enabled((os_log_t)qword_2C120, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *(void *)(a1 + 8);
    uint64_t v14 = *(void *)(a1 + 16);
    int v26 = 136315906;
    v27 = "IOServiceClient.cpp";
    __int16 v28 = 1024;
    int v29 = 50;
    __int16 v30 = 2048;
    uint64_t v31 = v14;
    __int16 v32 = 2048;
    uint64_t v33 = v15;
    _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      added runloop source %p to runloop %p",  (uint8_t *)&v26,  0x26u);
  }

  CFRetain(*(CFTypeRef *)(a1 + 56));
  sub_43DC();
  v16 = (os_log_s *)qword_2C120;
  if (os_log_type_enabled((os_log_t)qword_2C120, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = *(void *)(a1 + 56);
    int v26 = 136315650;
    v27 = "IOServiceClient.cpp";
    __int16 v28 = 1024;
    int v29 = 53;
    __int16 v30 = 2112;
    uint64_t v31 = v17;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d      mMatchingDict: %@", (uint8_t *)&v26, 0x1Cu);
  }

  if (IOServiceAddMatchingNotification( *(IONotificationPortRef *)(a1 + 32),  "IOServiceMatched",  *(CFDictionaryRef *)(a1 + 56),  (IOServiceMatchingCallback)sub_4438,  (void *)a1,  v8))
  {
    goto LABEL_21;
  }

  sub_43DC();
  v18 = (os_log_s *)qword_2C120;
  if (os_log_type_enabled((os_log_t)qword_2C120, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 136315394;
    v27 = "IOServiceClient.cpp";
    __int16 v28 = 1024;
    int v29 = 55;
    _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      signed up for matched notifications",  (uint8_t *)&v26,  0x12u);
  }

  CFRetain(*(CFTypeRef *)(a1 + 56));
  if (IOServiceAddMatchingNotification( *(IONotificationPortRef *)(a1 + 32),  "IOServiceTerminate",  *(CFDictionaryRef *)(a1 + 56),  (IOServiceMatchingCallback)sub_451C,  (void *)a1,  (io_iterator_t *)(a1 + 44)))
  {
LABEL_21:
    sub_43DC();
    uint64_t v25 = qword_2C120;
    if (!os_log_type_enabled((os_log_t)qword_2C120, OS_LOG_TYPE_ERROR)) {
      return a1;
    }
    int v26 = 136315650;
    v27 = "IOServiceClient.cpp";
    __int16 v28 = 1024;
    int v29 = 68;
    __int16 v30 = 2048;
    uint64_t v31 = a1;
    v21 = "%25s:%-5d [!] IOServiceClient(%p)::IOServiceClient() - failure";
    v22 = (os_log_s *)v25;
    os_log_type_t v23 = OS_LOG_TYPE_ERROR;
    goto LABEL_19;
  }

  sub_43DC();
  v19 = (os_log_s *)qword_2C120;
  if (os_log_type_enabled((os_log_t)qword_2C120, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 136315394;
    v27 = "IOServiceClient.cpp";
    __int16 v28 = 1024;
    int v29 = 59;
    _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      signed up for terminated notifications",  (uint8_t *)&v26,  0x12u);
  }

  *(_BYTE *)(a1 + 48) = 1;
  sub_43DC();
  uint64_t v20 = qword_2C120;
  if (os_log_type_enabled((os_log_t)qword_2C120, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 136315650;
    v27 = "IOServiceClient.cpp";
    __int16 v28 = 1024;
    int v29 = 63;
    __int16 v30 = 2048;
    uint64_t v31 = a1;
    v21 = "%25s:%-5d [-] IOServiceClient(%p)::IOServiceClient() - success";
    v22 = (os_log_s *)v20;
    os_log_type_t v23 = OS_LOG_TYPE_DEBUG;
LABEL_19:
    _os_log_impl(&dword_0, v22, v23, v21, (uint8_t *)&v26, 0x1Cu);
  }

  return a1;
}

void sub_43DC()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_2C128);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_2C128))
    {
      qword_2C120 = (uint64_t)os_log_create("com.apple.coremidi", "ioserv");
      __cxa_guard_release(&qword_2C128);
    }
  }

uint64_t sub_4438(uint64_t a1, io_iterator_t a2)
{
  int v4 = (os_log_s *)qword_2C120;
  if (os_log_type_enabled((os_log_t)qword_2C120, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315906;
    int v7 = "IOServiceClient.cpp";
    __int16 v8 = 1024;
    int v9 = 106;
    __int16 v10 = 2048;
    uint64_t v11 = a1;
    __int16 v12 = 1024;
    io_iterator_t v13 = a2;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] IOServiceClient::ServicePublishCallback(refcon %p, it %u)",  (uint8_t *)&v6,  0x22u);
  }

  return sub_4758(a1, a2);
}

uint64_t sub_451C(uint64_t a1, io_iterator_t a2)
{
  int v4 = (os_log_s *)qword_2C120;
  if (os_log_type_enabled((os_log_t)qword_2C120, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315906;
    int v7 = "IOServiceClient.cpp";
    __int16 v8 = 1024;
    int v9 = 115;
    __int16 v10 = 2048;
    uint64_t v11 = a1;
    __int16 v12 = 1024;
    io_iterator_t v13 = a2;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] IOServiceClient::ServiceTerminateCallback(refcon %p, it %u)",  (uint8_t *)&v6,  0x22u);
  }

  return sub_47BC(a1, a2);
}

uint64_t sub_4600(uint64_t a1)
{
  *(void *)a1 = off_28690;
  sub_43DC();
  uint64_t v2 = (os_log_s *)qword_2C120;
  if (os_log_type_enabled((os_log_t)qword_2C120, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315650;
    __int16 v12 = "IOServiceClient.cpp";
    __int16 v13 = 1024;
    int v14 = 76;
    __int16 v15 = 2048;
    uint64_t v16 = a1;
    _os_log_impl( &dword_0,  v2,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] IOServiceClient(%p)::~IOServiceClient()",  (uint8_t *)&v11,  0x1Cu);
  }

  int v3 = *(__CFRunLoop **)(a1 + 8);
  if (v3)
  {
    int v4 = *(__CFRunLoopSource **)(a1 + 16);
    if (v4)
    {
      CFRunLoopRemoveSource(v3, v4, kCFRunLoopDefaultMode);
      CFRelease(*(CFTypeRef *)(a1 + 8));
    }
  }

  int v5 = *(const void **)(a1 + 16);
  if (v5) {
    CFRelease(v5);
  }
  io_object_t v6 = *(_DWORD *)(a1 + 40);
  if (v6) {
    IOObjectRelease(v6);
  }
  io_object_t v7 = *(_DWORD *)(a1 + 44);
  if (v7) {
    IOObjectRelease(v7);
  }
  mach_port_name_t v8 = *(_DWORD *)(a1 + 24);
  if (v8) {
    mach_port_deallocate(mach_task_self_, v8);
  }
  int v9 = *(const void **)(a1 + 56);
  if (v9) {
    CFRelease(v9);
  }
  return a1;
}

void sub_4744(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_3584(a1);
}

uint64_t sub_4758(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    uint64_t v5 = result;
    do
    {
      (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 16LL))(a1, v5);
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
    }

    while ((_DWORD)result);
  }

  return result;
}

uint64_t sub_47BC(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    uint64_t v5 = result;
    do
    {
      (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 24LL))(a1, v5);
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
    }

    while ((_DWORD)result);
  }

  return result;
}

void sub_4820(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 24))
  {
    if (*(_BYTE *)(a1 + 48))
    {
      sub_43DC();
      uint64_t v2 = (os_log_s *)qword_2C120;
      if (os_log_type_enabled((os_log_t)qword_2C120, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        mach_port_name_t v8 = "IOServiceClient.cpp";
        __int16 v9 = 1024;
        int v10 = 130;
        __int16 v11 = 2048;
        uint64_t v12 = a1;
        _os_log_impl( &dword_0,  v2,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] IOServiceClient(%p)ScanServices() - emptying iterators ...",  buf,  0x1Cu);
      }

      *(_BYTE *)(a1 + 48) = 0;
      sub_4758(a1, *(_DWORD *)(a1 + 40));
      sub_47BC(a1, *(_DWORD *)(a1 + 44));
    }

    else
    {
      io_iterator_t existing = 0;
      CFRetain(*(CFTypeRef *)(a1 + 56));
      sub_43DC();
      int v4 = (os_log_s *)qword_2C120;
      if (os_log_type_enabled((os_log_t)qword_2C120, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v5 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 136315906;
        mach_port_name_t v8 = "IOServiceClient.cpp";
        __int16 v9 = 1024;
        int v10 = 140;
        __int16 v11 = 2048;
        uint64_t v12 = a1;
        __int16 v13 = 2112;
        uint64_t v14 = v5;
        _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] IOServiceClient(%p)ScanServices() - getting matching services for dictionary: %@",  buf,  0x26u);
      }

      if (!IOServiceGetMatchingServices(*(_DWORD *)(a1 + 24), *(CFDictionaryRef *)(a1 + 56), &existing)) {
        sub_4758(a1, existing);
      }
      if (existing) {
        IOObjectRelease(existing);
      }
    }
  }

  else
  {
    sub_43DC();
    int v3 = (os_log_s *)qword_2C120;
    if (os_log_type_enabled((os_log_t)qword_2C120, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      mach_port_name_t v8 = "IOServiceClient.cpp";
      __int16 v9 = 1024;
      int v10 = 125;
      __int16 v11 = 2048;
      uint64_t v12 = a1;
      _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] IOServiceClient(%p)::ScanServices() - mMainDevicePort == 0",  buf,  0x1Cu);
    }
  }

uint64_t sub_4A48(uint64_t a1, CFUUIDRef factoryID)
{
  *(_OWORD *)(a1 + 48) = 0u;
  int v3 = (void *)(a1 + 48);
  *(void *)(a1 + 72) = 0LL;
  int v4 = (void *)(a1 + 72);
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 80) = 0LL;
  *(void *)(a1 + 88) = 0LL;
  *(void *)a1 = off_286C0;
  *(void *)(a1 + 8) = &unk_2C000;
  *(void *)(a1 + 16) = factoryID;
  CFPlugInAddInstanceForFactory(factoryID);
  *(void *)(a1 + 24) = 1LL;
  __int16 v13 = off_28750;
  v14[0] = a1;
  uint64_t v5 = operator new(0x340uLL);
  *uint64_t v5 = off_28730;
  v5[1] = off_28750;
  v5[2] = a1;
  bzero(v5 + 8, 0x300uLL);
  int v10 = v5;
  sub_4C8C(v4, (uint64_t *)&v10);
  uint64_t v6 = (uint64_t)v10;
  int v10 = 0LL;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
  }
  ((void (*)(void *))v13[3])(v14);
  __int16 v11 = off_287B0;
  v12[0] = a1;
  io_object_t v7 = operator new(0x340uLL);
  void *v7 = off_28730;
  v7[1] = off_287B0;
  v7[2] = a1;
  bzero(v7 + 8, 0x300uLL);
  int v10 = v7;
  sub_4C8C(v3, (uint64_t *)&v10);
  uint64_t v8 = (uint64_t)v10;
  int v10 = 0LL;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8LL))(v8);
  }
  ((void (*)(void *))v11[3])(v12);
  return a1;
}

void sub_4BE4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  if (a2) {
    sub_3584(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void *sub_4C8C(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (*a2)
  {
    uint64_t v5 = operator new(0x20uLL);
    *uint64_t v5 = &off_28788;
    v5[1] = 0LL;
    v5[2] = 0LL;
    v5[3] = v4;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  *a2 = 0LL;
  uint64_t v6 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v5;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      unint64_t v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

  return a1;
}

void *sub_4D24(void *a1)
{
  *a1 = off_286C0;
  uint64_t v2 = (const __CFUUID *)a1[2];
  if (v2) {
    CFPlugInRemoveInstanceForFactory(v2);
  }
  sub_624C((uint64_t)(a1 + 9));
  sub_624C((uint64_t)(a1 + 6));
  return a1;
}

void sub_4D74(void *a1)
{
  unint64_t v1 = sub_4D24(a1);
  operator delete(v1);
}

uint64_t sub_4D88(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1[6];
  if (!v5) {
    return 7LL;
  }
  a1[4] = a3;
  a1[5] = a4;
  (*(void (**)(uint64_t))(*(void *)v5 + 16LL))(v5);
  return 0LL;
}

uint64_t sub_4DC0(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 72);
  if (!v4) {
    return 7LL;
  }
  *(_DWORD *)(a1 + 64) = a2;
  (*(void (**)(uint64_t, uint64_t))(*(void *)v4 + 16LL))(v4, a3);
  return 0LL;
}

uint64_t sub_4DFC()
{
  return 0LL;
}

uint64_t sub_4E04()
{
  return 0LL;
}

uint64_t sub_4E0C()
{
  return 0LL;
}

uint64_t sub_4E14()
{
  return 0LL;
}

uint64_t sub_4E1C()
{
  return 0LL;
}

uint64_t sub_4E24()
{
  return 0LL;
}

uint64_t sub_4E2C()
{
  return 0LL;
}

uint64_t sub_4E34()
{
  return 0LL;
}

uint64_t sub_4E3C(_DWORD *a1, CFUUIDBytes a2, void *a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0LL, a2);
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x2Fu,  0xD9u,  0x4Du,  0xFu,  0x8Cu,  0x2Au,  0x48u,  0x2Au,  0x8Au,  0xD8u,  0x7Du,  0x9Eu,  0xA3u,  0x81u,  0xC9u,  0xC1u);
  if (CFEqual(v5, v6))
  {
    (*(void (**)(_DWORD *))(*(void *)a1 + 16LL))(a1);
    *a3 = a1;
    CFRelease(v5);
    uint64_t result = 0LL;
    int v8 = 3;
LABEL_5:
    a1[5] = v8;
    return result;
  }

  CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x43u,  0xC9u,  0x8Cu,  0x3Cu,  0x30u,  0x6Cu,  0x11u,  0xD5u,  0xAFu,  0x73u,  0,  0x30u,  0x65u,  0xA8u,  0x30u,  0x1Eu);
  if (CFEqual(v5, v9))
  {
    (*(void (**)(_DWORD *))(*(void *)a1 + 16LL))(a1);
    *a3 = a1;
    CFRelease(v5);
    uint64_t result = 0LL;
    int v8 = 2;
    goto LABEL_5;
  }

  CFUUIDRef v10 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorSystemDefault,  0,  0,  0,  0,  0,  0,  0,  0,  0xC0u,  0,  0,  0,  0,  0,  0,  0x46u);
  if (CFEqual(v5, v10))
  {
    (*(void (**)(_DWORD *))(*(void *)a1 + 16LL))(a1);
    *a3 = a1;
    CFRelease(v5);
    return 0LL;
  }

  else
  {
    *a3 = 0LL;
    CFRelease(v5);
    return 2147483652LL;
  }

uint64_t sub_4FF0(uint64_t a1)
{
  uint64_t v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t sub_5004(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16);
  uint64_t v2 = (v1 - 1);
  *(_DWORD *)(a1 + 16) = v2;
  if (v1 == 1) {
    (*(void (**)(uint64_t))(*(void *)(a1 - 8) + 8LL))(a1 - 8);
  }
  return v2;
}

uint64_t sub_503C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 16LL))(a1 - 8);
}

uint64_t sub_5048(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 24LL))(a1 - 8);
}

uint64_t sub_5054(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 32LL))(a1 - 8);
}

uint64_t sub_5060(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 40LL))(a1 - 8);
}

uint64_t sub_506C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 48LL))(a1 - 8);
}

uint64_t sub_5078(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 56LL))(a1 - 8);
}

uint64_t sub_5084(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 64LL))(a1 - 8);
}

uint64_t sub_5090(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 72LL))(a1 - 8);
}

uint64_t sub_509C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 80LL))(a1 - 8);
}

uint64_t sub_50A8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 88LL))(a1 - 8);
}

void *sub_50B4(void *a1)
{
  *a1 = off_28730;
  (*(void (**)(void *))(a1[1] + 24LL))(a1 + 2);
  return a1;
}

void sub_50F8(void *a1)
{
  *a1 = off_28730;
  (*(void (**)(void *))(a1[1] + 24LL))(a1 + 2);
  operator delete(a1);
}

uint64_t sub_513C(uint64_t *a1, _DWORD *a2)
{
  uint64_t v7 = a1[1];
  (*(void (**)(void *, uint64_t *))(v7 + 8))(v8, a1 + 2);
  int v9 = 0;
  v8[6] = &v10;
  if (*a2 == 2)
  {
    v5[0] = a1;
    v5[1] = &v7;
    CFUUIDRef v6 = v5;
    sub_59C0((uint64_t)a2, (uint64_t **)&v6);
  }

  else
  {
    if (*a2 != 1) {
      std::terminate();
    }
    CFUUIDRef v6 = (uint64_t **)&v7;
    v5[0] = (uint64_t *)&v6;
    sub_526C((uint64_t)a2, v5);
  }

  return sub_61DC((uint64_t)&v7);
}

void sub_521C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

uint64_t sub_523C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  return (**(uint64_t (***)(uint64_t, uint64_t *))(a1 + 8))(a1 + 16, &v3);
}

uint64_t sub_526C(uint64_t result, uint64_t **a2)
{
  if (*(_DWORD *)(result + 4))
  {
    uint64_t v3 = result;
    unsigned int v4 = 0;
    uint64_t v5 = result + 8;
    do
    {
      uint64_t v6 = *(unsigned int *)(v5 + 8);
      v11[0] = v5 + 12;
      v11[1] = v6;
      v11[2] = *(void *)v5;
      v11[3] = 0LL;
      uint64_t v8 = 0LL;
      uint64_t v9 = 0LL;
      uint64_t result = sub_5338(v11, &v10, &v8);
      if ((_DWORD)result)
      {
        do
        {
          uint64_t v7 = *a2;
          uint64_t v13 = v10;
          v12[0] = *v7;
          v12[1] = (uint64_t)&v13;
          sub_53E4((unsigned __int16 *)&v8, v12);
          uint64_t v8 = 0LL;
          uint64_t v9 = 0LL;
          uint64_t result = sub_5338(v11, &v10, &v8);
        }

        while ((result & 1) != 0);
      }

      v5 += 4LL * *(unsigned int *)(v5 + 8) + 12;
      ++v4;
    }

    while (v4 < *(_DWORD *)(v3 + 4));
  }

  return result;
}

uint64_t sub_5338(uint64_t *a1, void *a2, _DWORD *a3)
{
  unint64_t v3 = a1[1];
  unint64_t v4 = a1[3];
  if (v4 >= v3) {
    return 0LL;
  }
  uint64_t v5 = *a1;
  uint64_t v6 = (unsigned int *)(*a1 + 4 * v4);
  unint64_t v7 = *v6;
  unint64_t v8 = v4 + byte_23208[v7 >> 28];
  if (v8 > v3) {
    return 0LL;
  }
  *a2 = a1[2];
  switch((uint64_t)(v5 + 4 * v8 - (void)v6) >> 2)
  {
    case 0LL:
      goto LABEL_9;
    case 1LL:
      goto LABEL_8;
    case 2LL:
      goto LABEL_7;
    case 3LL:
      goto LABEL_6;
    case 4LL:
      *a3++ = v7;
      unsigned int v10 = v6[1];
      ++v6;
      LODWORD(v7) = v10;
LABEL_6:
      *a3++ = v7;
      unsigned int v11 = v6[1];
      ++v6;
      LODWORD(v7) = v11;
LABEL_7:
      *a3++ = v7;
      LODWORD(v7) = v6[1];
LABEL_8:
      *a3 = v7;
LABEL_9:
      a1[3] = v8;
      uint64_t result = 1LL;
      break;
    default:
      std::terminate();
      return result;
  }

  return result;
}

unsigned __int16 *sub_53E4(unsigned __int16 *result, uint64_t *a2)
{
  unint64_t v3 = *(unsigned int *)result;
  unsigned int v4 = v3 >> 28;
  if (v3 >> 28 == 3)
  {
    size_t v13 = (v3 >> 16) & 0xF;
    unsigned int v14 = (v3 >> 20) + 3;
    unsigned int v15 = bswap32(*((_DWORD *)result + 1));
    v32[0] = bswap32(v3);
    v32[1] = v15;
    if ((v3 & 0x200000) != 0)
    {
      size_t v6 = 0LL;
      if (!(_DWORD)v13) {
        goto LABEL_39;
      }
    }

    else
    {
      unsigned __int8 __src = -16;
      size_t v6 = 1LL;
      if (!(_DWORD)v13)
      {
LABEL_39:
        if ((v14 & 2) != 0) {
          *(&__src + v6++) = -9;
        }
        uint64_t v7 = *a2;
        uint64_t v25 = *(void *)a2[1];
        unint64_t v9 = *(void *)(*a2 + 56);
        unint64_t v26 = v7 + 1088;
        int v27 = *(_DWORD *)(v7 + 64);
        if (v27)
        {
          uint64_t v28 = *(unsigned __int16 *)(v9 + 8);
          if (*(void *)v9 == v25 && *(unsigned __int8 *)(v28 + v9 + 9) != 247 && __src != 240)
          {
            if (v9 + v6 + v28 + 10 <= v26) {
              goto LABEL_54;
            }
            goto LABEL_52;
          }

          unint64_t v9 = (v9 + v28 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        }

        if (v9 + v6 + 10 <= v26)
        {
          LODWORD(v28) = 0;
          *(_DWORD *)(v7 + 64) = v27 + 1;
          *(void *)unint64_t v9 = v25;
          *(_WORD *)(v9 + 8) = 0;
LABEL_54:
          uint64_t result = (unsigned __int16 *)(v9 + v28 + 10);
          p_src = &__src;
          switch(v6)
          {
            case 0uLL:
              break;
            case 1uLL:
              goto LABEL_64;
            case 2uLL:
              goto LABEL_63;
            case 3uLL:
              goto LABEL_62;
            case 4uLL:
LABEL_61:
              p_src = (unsigned __int8 *)&v34;
              *(_BYTE *)uint64_t result = __src;
              uint64_t result = (unsigned __int16 *)((char *)result + 1);
LABEL_62:
              char v30 = *p_src++;
              *(_BYTE *)uint64_t result = v30;
              uint64_t result = (unsigned __int16 *)((char *)result + 1);
LABEL_63:
              char v31 = *p_src++;
              *(_BYTE *)uint64_t result = v31;
              uint64_t result = (unsigned __int16 *)((char *)result + 1);
LABEL_64:
              *(_BYTE *)uint64_t result = *p_src;
              break;
            default:
LABEL_68:
              uint64_t result = (unsigned __int16 *)memmove(result, &__src, v6);
              break;
          }

          *(_WORD *)(v9 + 8) += v6;
          goto LABEL_66;
        }

LABEL_52:
        uint64_t result = (unsigned __int16 *)sub_5820(v7, v25, (char *)&__src, v6);
LABEL_58:
        unint64_t v9 = (unint64_t)result;
LABEL_66:
        *(void *)(v7 + 56) = v9;
        return result;
      }
    }

    memcpy(&__src + v6, (char *)v32 + 2, v13);
    v6 += (v13 - 1) + 1LL;
    goto LABEL_39;
  }

  if (v4 == 2)
  {
    int v16 = v3 & 0xE00000;
    unsigned __int8 __src = BYTE2(*(_DWORD *)result);
    char v34 = BYTE1(v3) & 0x7F;
    if ((v3 & 0xE00000) == 0xC00000) {
      size_t v17 = 2LL;
    }
    else {
      size_t v17 = 3LL;
    }
    if (v16 != 12582912) {
      char v35 = v3 & 0x7F;
    }
    uint64_t v18 = *a2;
    uint64_t v19 = *(void *)a2[1];
    uint64_t result = *(unsigned __int16 **)(*a2 + 56);
    unint64_t v20 = *a2 + 1088;
    int v21 = *(_DWORD *)(*a2 + 64);
    if (v21)
    {
      uint64_t v22 = result[4];
      if (*(void *)result == v19 && BYTE2(v3) != 240 && *((unsigned __int8 *)result + v22 + 9) != 247)
      {
        goto LABEL_33;
      }

      uint64_t result = (unsigned __int16 *)(((unint64_t)result + v22 + 13) & 0xFFFFFFFFFFFFFFFCLL);
    }

    if ((unint64_t)result + v17 + 10 <= v20)
    {
      LODWORD(v22) = 0;
      *(_DWORD *)(v18 + 64) = v21 + 1;
      *(void *)uint64_t result = v19;
      result[4] = 0;
LABEL_35:
      os_log_type_t v23 = (unsigned __int8 *)result + v22 + 10;
      if (v16 == 12582912)
      {
        v24 = &__src;
      }

      else
      {
        v24 = (unsigned __int8 *)&v34;
        *os_log_type_t v23 = __src;
        os_log_type_t v23 = (unsigned __int8 *)result + v22 + 11;
      }

      *os_log_type_t v23 = *v24;
      v23[1] = v24[1];
      result[4] += v17;
      goto LABEL_49;
    }

        uint64_t result = (unsigned __int16 *)sub_5820(v7, v25, (char *)&__src, v6);
LABEL_58:
        unint64_t v9 = (unint64_t)result;
LABEL_66:
        *(void *)(v7 + 56) = v9;
        return result;
      }
    }

    memcpy(&__src + v6, (char *)v32 + 2, v13);
    v6 += (v13 - 1) + 1LL;
    goto LABEL_39;
  }

  if (v4 == 2)
  {
    int v16 = v3 & 0xE00000;
    unsigned __int8 __src = BYTE2(*(_DWORD *)result);
    char v34 = BYTE1(v3) & 0x7F;
    if ((v3 & 0xE00000) == 0xC00000) {
      size_t v17 = 2LL;
    }
    else {
      size_t v17 = 3LL;
    }
    if (v16 != 12582912) {
      char v35 = v3 & 0x7F;
    }
    uint64_t v18 = *a2;
    uint64_t v19 = *(void *)a2[1];
    uint64_t result = *(unsigned __int16 **)(*a2 + 56);
    unint64_t v20 = *a2 + 1088;
    int v21 = *(_DWORD *)(*a2 + 64);
    if (v21)
    {
      uint64_t v22 = result[4];
      if (*(void *)result == v19 && BYTE2(v3) != 240 && *((unsigned __int8 *)result + v22 + 9) != 247)
      {
        goto LABEL_33;
      }

      uint64_t result = (unsigned __int16 *)(((unint64_t)result + v22 + 13) & 0xFFFFFFFFFFFFFFFCLL);
    }

    if ((unint64_t)result + v17 + 10 <= v20)
    {
      LODWORD(v22) = 0;
      *(_DWORD *)(v18 + 64) = v21 + 1;
      *(void *)uint64_t result = v19;
      result[4] = 0;
LABEL_35:
      os_log_type_t v23 = (unsigned __int8 *)result + v22 + 10;
      if (v16 == 12582912)
      {
        v24 = &__src;
      }

      else
      {
        v24 = (unsigned __int8 *)&v34;
        *os_log_type_t v23 = __src;
        os_log_type_t v23 = (unsigned __int8 *)result + v22 + 11;
      }

      *os_log_type_t v23 = *v24;
      v23[1] = v24[1];
      result[4] += v17;
      goto LABEL_49;
    }

LABEL_33:
    uint64_t result = (unsigned __int16 *)sub_5820(*a2, v19, (char *)&__src, v17);
LABEL_49:
    *(void *)(v18 + 56) = result;
    return result;
  }

  if (v4 == 1)
  {
    int v5 = BYTE2(v3) - 240;
    if (BYTE2(v3) >= 0xF0u)
    {
      size_t v6 = byte_2C070[v5];
      if (byte_2C070[v5])
      {
        unsigned __int8 __src = BYTE2(*(_DWORD *)result);
        if ((_DWORD)v6 != 1)
        {
          char v34 = BYTE1(v3) & 0x7F;
        }

        uint64_t v7 = *a2;
        uint64_t v8 = *(void *)a2[1];
        unint64_t v9 = *(void *)(*a2 + 56);
        unint64_t v10 = v7 + 1088;
        int v11 = *(_DWORD *)(v7 + 64);
        if (v11)
        {
          uint64_t v12 = *(unsigned __int16 *)(v9 + 8);
          if (*(void *)v9 == v8 && BYTE2(v3) != 240 && *(unsigned __int8 *)(v12 + v9 + 9) != 247)
          {
            if (v9 + v12 + v6 + 10 <= v10) {
              goto LABEL_60;
            }
LABEL_57:
            uint64_t result = (unsigned __int16 *)sub_5820(v7, v8, (char *)&__src, v6);
            goto LABEL_58;
          }

          unint64_t v9 = (v9 + v12 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        }

        if (v9 + v6 + 10 <= v10)
        {
          LODWORD(v12) = 0;
          *(_DWORD *)(v7 + 64) = v11 + 1;
          *(void *)unint64_t v9 = v8;
          *(_WORD *)(v9 + 8) = 0;
LABEL_60:
          uint64_t result = (unsigned __int16 *)(v9 + v12 + 10);
          p_src = &__src;
          switch((int)v6)
          {
            case 1:
              goto LABEL_64;
            case 2:
              goto LABEL_63;
            case 3:
              goto LABEL_62;
            case 4:
              goto LABEL_61;
            default:
              goto LABEL_68;
          }
        }

        goto LABEL_57;
      }
    }
  }

  return result;
}

    uint64_t result = (unsigned __int16 *)sub_5820(*a2, v19, (char *)&__src, v17);
LABEL_49:
    *(void *)(v18 + 56) = result;
    return result;
  }

  if (v4 == 1)
  {
    int v5 = BYTE2(v3) - 240;
    if (BYTE2(v3) >= 0xF0u)
    {
      size_t v6 = byte_2C070[v5];
      if (byte_2C070[v5])
      {
        unsigned __int8 __src = BYTE2(*(_DWORD *)result);
        if ((_DWORD)v6 != 1)
        {
          char v34 = BYTE1(v3) & 0x7F;
        }

        uint64_t v7 = *a2;
        uint64_t v8 = *(void *)a2[1];
        unint64_t v9 = *(void *)(*a2 + 56);
        unint64_t v10 = v7 + 1088;
        int v11 = *(_DWORD *)(v7 + 64);
        if (v11)
        {
          uint64_t v12 = *(unsigned __int16 *)(v9 + 8);
          if (*(void *)v9 == v8 && BYTE2(v3) != 240 && *(unsigned __int8 *)(v12 + v9 + 9) != 247)
          {
            if (v9 + v12 + v6 + 10 <= v10) {
              goto LABEL_60;
            }
LABEL_57:
            uint64_t result = (unsigned __int16 *)sub_5820(v7, v8, (char *)&__src, v6);
            goto LABEL_58;
          }

          unint64_t v9 = (v9 + v12 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        }

        if (v9 + v6 + 10 <= v10)
        {
          LODWORD(v12) = 0;
          *(_DWORD *)(v7 + 64) = v11 + 1;
          *(void *)unint64_t v9 = v8;
          *(_WORD *)(v9 + 8) = 0;
LABEL_60:
          uint64_t result = (unsigned __int16 *)(v9 + v12 + 10);
          p_src = &__src;
          switch((int)v6)
          {
            case 1:
              goto LABEL_64;
            case 2:
              goto LABEL_63;
            case 3:
              goto LABEL_62;
            case 4:
              goto LABEL_61;
            default:
              goto LABEL_68;
          }
        }

        goto LABEL_57;
      }
    }
  }

  return result;
}

            uint64_t result = *(__n128 *)v9;
            *((_OWORD *)v1 + 1) = *(_OWORD *)v9;
            return result;
        }
      }
    }

    else if (v3 == 11)
    {
      int v5 = (__n128 *)a1[2];
      if ((v5->n128_u32[0] & 0xF00000) == 0xB00000)
      {
        size_t v6 = BYTE1(v5->n128_u32[0]);
        if ((v6 - 98) < 4 || (v6 != 32 ? (uint64_t v7 = v6 == 0) : (uint64_t v7 = 1), v7))
        {
          uint64_t result = *v5;
          *(__n128 *)int v1 = *v5;
        }
      }
    }
  }

  return result;
}

            uint64_t result = *(__n128 *)v9;
            *((_OWORD *)v1 + 1) = *(_OWORD *)v9;
            return result;
        }
      }
    }

    else if (v3 == 11)
    {
      int v5 = (__n128 *)a1[2];
      if ((v5->n128_u32[0] & 0xF00000) == 0xB00000)
      {
        size_t v6 = BYTE1(v5->n128_u32[0]);
        if ((v6 - 98) < 4 || (v6 != 32 ? (uint64_t v7 = v6 == 0) : (uint64_t v7 = 1), v7))
        {
          uint64_t result = *v5;
          *(__n128 *)int v1 = *v5;
        }
      }
    }
  }

  return result;
}

uint64_t sub_5820(uint64_t a1, uint64_t a2, char *a3, size_t a4)
{
  if (*(_DWORD *)(a1 + 64)
    && (uint64_t v16 = a1 + 64,
        (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v16),
        *(_DWORD *)(a1 + 64) = 0,
        uint64_t v8 = a1 + 68,
        a1 + 68 + a4 + 10 <= a1 + 1088))
  {
    *(_DWORD *)(a1 + 64) = 1;
    *(void *)(a1 + 68) = a2;
    *(_WORD *)(a1 + 76) = 0;
    unint64_t v9 = (char *)(a1 + 78);
    __int16 v10 = 0;
    switch(a4)
    {
      case 0uLL:
        break;
      case 1uLL:
        goto LABEL_8;
      case 2uLL:
        goto LABEL_7;
      case 3uLL:
        goto LABEL_6;
      case 4uLL:
        char v11 = *a3++;
        unint64_t v9 = (char *)(a1 + 79);
        *(_BYTE *)(a1 + 78) = v11;
LABEL_6:
        char v12 = *a3++;
        *v9++ = v12;
LABEL_7:
        char v13 = *a3++;
        *v9++ = v13;
LABEL_8:
        *unint64_t v9 = *a3;
        __int16 v10 = *(_WORD *)(a1 + 76);
        break;
      default:
        if (a4) {
          memmove(v9, a3, a4);
        }
        __int16 v10 = 0;
        break;
    }

    *(_WORD *)(a1 + 76) = v10 + a4;
  }

  else
  {
    MIDI::LegacyPacketList::create(&v15, 1LL, a2, a3, a4);
    uint64_t v16 = v15;
    (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v16);
    sub_5998(&v15, 0LL);
    uint64_t v8 = a1 + 68;
    *(void *)(a1 + 56) = a1 + 68;
    *(_DWORD *)(a1 + 64) = 0;
    sub_5998(&v15, 0LL);
  }

  return v8;
}

void sub_5980( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t *sub_5998(uint64_t *result, uint64_t a2)
{
  uint64_t v3 = *result;
  std::logic_error *result = a2;
  if (v3) {
    return (uint64_t *)MIDI::LegacyPacketListDeleter::operator()();
  }
  return result;
}

uint64_t sub_59C0(uint64_t result, uint64_t **a2)
{
  if (*(_DWORD *)(result + 4))
  {
    uint64_t v3 = result;
    unsigned int v4 = 0;
    uint64_t v5 = result + 8;
    do
    {
      uint64_t v6 = *(unsigned int *)(v5 + 8);
      v12[0] = v5 + 12;
      v12[1] = v6;
      uint64_t v12[2] = *(void *)v5;
      void v12[3] = 0LL;
      uint64_t v9 = 0LL;
      uint64_t v10 = 0LL;
      uint64_t result = sub_5338(v12, &v11, &v9);
      if ((_DWORD)result)
      {
        do
        {
          uint64_t v7 = *a2;
          uint64_t v14 = v11;
          uint64_t v8 = *v7;
          *(void *)&__int128 v13 = v7[1];
          *((void *)&v13 + 1) = &v14;
          sub_5A90((unsigned __int16 *)(v8 + 64), (unsigned __int16 *)&v9, &v13);
          uint64_t v9 = 0LL;
          uint64_t v10 = 0LL;
          uint64_t result = sub_5338(v12, &v11, &v9);
        }

        while ((result & 1) != 0);
      }

      v5 += 4LL * *(unsigned int *)(v5 + 8) + 12;
      ++v4;
    }

    while (v4 < *(_DWORD *)(v3 + 4));
  }

  return result;
}

unsigned __int16 *sub_5A90(unsigned __int16 *result, unsigned __int16 *a2, __int128 *a3)
{
  unint64_t v3 = *(unsigned int *)a2;
  if (((1 << (v3 >> 28)) & 0xA02F) != 0)
  {
    __int128 v29 = *a3;
    uint64_t v5 = a2;
    return sub_5DA0(v5, (uint64_t *)&v29);
  }

  else if (v3 >> 28 == 4)
  {
    unsigned int v6 = BYTE3(v3) & 0xF | 0x20;
    unsigned int v7 = *((_DWORD *)a2 + 1);
    switch(BYTE2(v3) >> 4)
    {
      case 2:
      case 3:
        uint64_t v10 = &result[24 * (BYTE3(v3) & 0xF)];
        uint64_t v11 = (v3 >> 16) & 0xF;
        char v12 = (unsigned __int8 *)v10 + 3 * v11;
        unsigned int v13 = (v3 >> 8) & 0x7F;
        int v14 = *(_DWORD *)a2 & 0x7F;
        int v15 = (v7 >> 18) & 0x7F;
        if ((v3 & 0x100000) != 0) {
          int v16 = 2;
        }
        else {
          int v16 = 1;
        }
        if (v16 == *v12 && v13 == v12[1])
        {
          int v17 = v11 | 0xB0;
          if (v14 == *((unsigned __int8 *)v10 + 3 * v11 + 2))
          {
            int v18 = (v6 << 24) | (v17 << 16);
            goto LABEL_22;
          }
        }

        else
        {
          int v17 = v11 | 0xB0;
        }

        if ((v3 & 0x100000) != 0) {
          int v19 = 25344;
        }
        else {
          int v19 = 25856;
        }
        int v28 = 0;
        *(_DWORD *)&v27[8] = 0;
        int v18 = (v6 << 24) | (v17 << 16);
        int v20 = v18 | v19;
        char v26 = v13;
        *(void *)int v27 = v18 | v19 | v13;
        __int128 v29 = *a3;
        sub_5DA0((unsigned __int16 *)v27, (uint64_t *)&v29);
        int v28 = 0;
        *(_DWORD *)&v27[8] = 0;
        *(void *)int v27 = (v20 | v14) - 256;
        __int128 v29 = *a3;
        sub_5DA0((unsigned __int16 *)v27, (uint64_t *)&v29);
        *char v12 = v16;
        int v21 = (char *)v10 + 3 * v11;
        v21[1] = v26;
        v21[2] = v14;
LABEL_22:
        int v28 = 0;
        *(_DWORD *)&v27[8] = 0;
        *(void *)int v27 = v18 | (v7 >> 25) | 0x600;
        __int128 v29 = *a3;
        uint64_t result = sub_5DA0((unsigned __int16 *)v27, (uint64_t *)&v29);
        if (v15)
        {
          int v28 = 0;
          *(void *)&v27[4] = 0LL;
          int v8 = v15 | v18;
          int v9 = 9728;
          goto LABEL_24;
        }

        break;
      case 8:
      case 9:
      case 10:
      case 11:
        int v8 = v7 >> 25;
        if (!(v7 >> 25)) {
          int v8 = BYTE2(v3) >> 4 == 9;
        }
        int v28 = 0;
        *(void *)&v27[4] = 0LL;
        int v9 = (BYTE2(v3) << 16) | (v6 << 24) | v3 & 0x7F00;
LABEL_24:
        int v22 = v8 | v9;
        goto LABEL_25;
      case 12:
        if ((v3 & 1) != 0)
        {
          int v28 = 0;
          *(_DWORD *)&v27[8] = 0;
          unsigned int v23 = v6 << 24;
          int v24 = BYTE2(v3) << 16;
          int v25 = (v24 - 0x100000) | (v6 << 24);
          *(void *)int v27 = (v24 - 0x100000) & 0xFFFFFF80 | (v6 << 24) | (v7 >> 8) & 0x7F;
          __int128 v29 = *a3;
          sub_5DA0((unsigned __int16 *)v27, (uint64_t *)&v29);
          int v28 = 0;
          *(_DWORD *)&v27[8] = 0;
          *(void *)int v27 = v25 & 0xFFFFFF80 | v7 & 0x7F | 0x2000;
          __int128 v29 = *a3;
          sub_5DA0((unsigned __int16 *)v27, (uint64_t *)&v29);
        }

        else
        {
          unsigned int v23 = v6 << 24;
          int v24 = BYTE2(v3) << 16;
        }

        int v28 = 0;
        *(void *)&v27[4] = 0LL;
        int v22 = HIWORD(v7) & 0x7F00 | v23 | v24;
        goto LABEL_25;
      case 13:
        int v28 = 0;
        *(void *)&v27[4] = 0LL;
        int v22 = (BYTE2(v3) << 16) | (v6 << 24) | (v7 >> 25 << 8);
        goto LABEL_25;
      case 14:
        int v28 = 0;
        *(void *)&v27[4] = 0LL;
        int v22 = (v7 >> 10) & 0x7F00 | (BYTE2(v3) << 16) | (v6 << 24) | (v7 >> 25);
LABEL_25:
        *(_DWORD *)int v27 = v22;
        __int128 v29 = *a3;
        uint64_t v5 = (unsigned __int16 *)v27;
        return sub_5DA0(v5, (uint64_t *)&v29);
      default:
        return result;
    }
  }

  return result;
}

unsigned __int16 *sub_5DA0(unsigned __int16 *result, uint64_t *a2)
{
  unint64_t v3 = *(unsigned int *)result;
  unsigned int v4 = v3 >> 28;
  if (v3 >> 28 == 3)
  {
    size_t v13 = (v3 >> 16) & 0xF;
    unsigned int v14 = (v3 >> 20) + 3;
    unsigned int v15 = bswap32(*((_DWORD *)result + 1));
    v32[0] = bswap32(v3);
    v32[1] = v15;
    if ((v3 & 0x200000) != 0)
    {
      size_t v6 = 0LL;
      if (!(_DWORD)v13) {
        goto LABEL_39;
      }
    }

    else
    {
      unsigned __int8 __src = -16;
      size_t v6 = 1LL;
      if (!(_DWORD)v13)
      {
LABEL_39:
        if ((v14 & 2) != 0) {
          *(&__src + v6++) = -9;
        }
        uint64_t v7 = *a2;
        uint64_t v25 = *(void *)a2[1];
        unint64_t v9 = *(void *)(*a2 + 56);
        unint64_t v26 = v7 + 1088;
        int v27 = *(_DWORD *)(v7 + 64);
        if (v27)
        {
          uint64_t v28 = *(unsigned __int16 *)(v9 + 8);
          if (*(void *)v9 == v25 && *(unsigned __int8 *)(v28 + v9 + 9) != 247 && __src != 240)
          {
            if (v9 + v6 + v28 + 10 <= v26) {
              goto LABEL_54;
            }
            goto LABEL_52;
          }

          unint64_t v9 = (v9 + v28 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        }

        if (v9 + v6 + 10 <= v26)
        {
          LODWORD(v28) = 0;
          *(_DWORD *)(v7 + 64) = v27 + 1;
          *(void *)unint64_t v9 = v25;
          *(_WORD *)(v9 + 8) = 0;
LABEL_54:
          uint64_t result = (unsigned __int16 *)(v9 + v28 + 10);
          p_src = &__src;
          switch(v6)
          {
            case 0uLL:
              break;
            case 1uLL:
              goto LABEL_64;
            case 2uLL:
              goto LABEL_63;
            case 3uLL:
              goto LABEL_62;
            case 4uLL:
LABEL_61:
              p_src = (unsigned __int8 *)&v34;
              *(_BYTE *)uint64_t result = __src;
              uint64_t result = (unsigned __int16 *)((char *)result + 1);
LABEL_62:
              char v30 = *p_src++;
              *(_BYTE *)uint64_t result = v30;
              uint64_t result = (unsigned __int16 *)((char *)result + 1);
LABEL_63:
              char v31 = *p_src++;
              *(_BYTE *)uint64_t result = v31;
              uint64_t result = (unsigned __int16 *)((char *)result + 1);
LABEL_64:
              *(_BYTE *)uint64_t result = *p_src;
              break;
            default:
LABEL_68:
              uint64_t result = (unsigned __int16 *)memmove(result, &__src, v6);
              break;
          }

          *(_WORD *)(v9 + 8) += v6;
          goto LABEL_66;
        }

uint64_t sub_61DC(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 64))
  {
    uint64_t v3 = a1 + 64;
    (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v3);
  }

  *(_DWORD *)(a1 + 64) = 0;
  *(void *)(a1 + 56) = a1 + 68;
  (*(void (**)(uint64_t))(*(void *)a1 + 24LL))(a1 + 8);
  return a1;
}

uint64_t sub_624C(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      unint64_t v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }

  return a1;
}

uint64_t sub_62A4(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)*a1 + 72LL))( *a1,  *(unsigned int *)(*a1 + 64LL),  *a2);
}

void *sub_62BC(void *result, void *a2)
{
  std::logic_error *result = *a2;
  return result;
}

void *sub_62C8(void *result, void *a2)
{
  std::logic_error *result = *a2;
  return result;
}

void sub_62DC(std::__shared_weak_count *a1)
{
}

uint64_t sub_62F0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
  }
  return result;
}

uint64_t sub_630C(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)*a1 + 48LL))( *a1,  *a2,  *(void *)(*a1 + 32LL),  *(void *)(*a1 + 40LL));
}

void *sub_6324(void *result, void *a2)
{
  std::logic_error *result = *a2;
  return result;
}

void *sub_6330(void *result, void *a2)
{
  std::logic_error *result = *a2;
  return result;
}

double sub_6340(uint64_t a1, int a2)
{
  *(void *)a1 = off_287E8;
  *(_DWORD *)(a1 + 8) = a2;
  double result = 0.0;
  *(_OWORD *)(a1 + 12) = 0u;
  *(_OWORD *)(a1 + 28) = 0u;
  *(_OWORD *)(a1 + 44) = 0u;
  *(_DWORD *)(a1 + 60) = 0;
  return result;
}

void *sub_6368(void *a1)
{
  *a1 = off_287E8;
  uint64_t v2 = (void *)a1[5];
  if (v2)
  {
    a1[6] = v2;
    operator delete(v2);
  }

  uint64_t v3 = (void *)a1[2];
  if (v3)
  {
    a1[3] = v3;
    operator delete(v3);
  }

  return a1;
}

void sub_63BC(uint64_t a1, int a2)
{
  int NumberOfEntities = MIDIDeviceGetNumberOfEntities(*(_DWORD *)(a1 + 8));
  *(_DWORD *)(a1 + 12) = NumberOfEntities;
  int v5 = (void **)(a1 + 16);
  sub_665C((void **)(a1 + 16), NumberOfEntities);
  size_t v6 = (void *)(a1 + 40);
  sub_66F0((char **)(a1 + 40), *(int *)(a1 + 12));
  if (*(_DWORD *)(a1 + 12))
  {
    for (i = 0LL; (unint64_t)i < *(int *)(a1 + 12); ++i)
    {
      MIDIEntityRef Entity = MIDIDeviceGetEntity(*(_DWORD *)(a1 + 8), (ItemCount)i);
      if (MIDIEntityGetNumberOfDestinations(Entity))
      {
        MIDIEndpointRef Destination = MIDIEntityGetDestination(Entity, 0LL);
        if (a2)
        {
          MIDIEndpointSetRefCons(Destination, (void *)a1, i);
LABEL_7:
          if (MIDIEntityGetNumberOfSources(Entity)) {
            MIDIEndpointRef Source = MIDIEntityGetSource(Entity, 0LL);
          }
          else {
            MIDIEndpointRef Source = 0;
          }
          uint64_t v12 = *(char **)(a1 + 24);
          unint64_t v11 = *(void *)(a1 + 32);
          if ((unint64_t)v12 >= v11)
          {
            unsigned int v14 = (char *)*v5;
            uint64_t v15 = (v12 - (_BYTE *)*v5) >> 2;
            unint64_t v16 = v15 + 1;
            uint64_t v17 = v11 - (void)v14;
            if (v17 >> 1 > v16) {
              unint64_t v16 = v17 >> 1;
            }
            else {
              unint64_t v18 = v16;
            }
            if (v18)
            {
              uint64_t v19 = (char *)sub_2E68(a1 + 32, v18);
              unsigned int v14 = *(char **)(a1 + 16);
              uint64_t v12 = *(char **)(a1 + 24);
            }

            else
            {
              uint64_t v19 = 0LL;
            }

            unint64_t v20 = (MIDIEndpointRef *)&v19[4 * v15];
            MIDIEndpointRef *v20 = Source;
            size_t v13 = v20 + 1;
            while (v12 != v14)
            {
              MIDIEndpointRef v21 = *((_DWORD *)v12 - 1);
              v12 -= 4;
              *--unint64_t v20 = v21;
            }

            *(void *)(a1 + 16) = v20;
            *(void *)(a1 + 24) = v13;
            *(void *)(a1 + 32) = &v19[4 * v18];
            if (v14) {
              operator delete(v14);
            }
          }

          else
          {
            *(_DWORD *)uint64_t v12 = Source;
            size_t v13 = v12 + 4;
          }

          *(void *)(a1 + 24) = v13;
          unint64_t v23 = *(void *)(a1 + 48);
          unint64_t v22 = *(void *)(a1 + 56);
          if (v23 >= v22)
          {
            unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v23 - *v6) >> 1);
            unint64_t v26 = v25 + 1;
            if (v25 + 1 > 0x2AAAAAAAAAAAAAAALL) {
              sub_2DE0();
            }
            unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v22 - *v6) >> 1);
            if (2 * v27 > v26) {
              unint64_t v26 = 2 * v27;
            }
            if (v27 >= 0x1555555555555555LL) {
              unint64_t v28 = 0x2AAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v28 = v26;
            }
            if (v28) {
              __int128 v29 = (char *)sub_2EC4(a1 + 56, v28);
            }
            else {
              __int128 v29 = 0LL;
            }
            char v30 = &v29[6 * v25];
            *((_WORD *)v30 + 2) = 0;
            *(_DWORD *)char v30 = 0;
            __int16 v32 = *(_WORD **)(a1 + 40);
            char v31 = *(_WORD **)(a1 + 48);
            uint64_t v33 = v30;
            if (v31 != v32)
            {
              do
              {
                int v34 = *(_DWORD *)(v31 - 3);
                v31 -= 3;
                __int16 v35 = v31[2];
                *(_DWORD *)(v33 - 6) = v34;
                v33 -= 6;
                *((_WORD *)v33 + 2) = v35;
              }

              while (v31 != v32);
              char v31 = (_WORD *)*v6;
            }

            int v24 = v30 + 6;
            *(void *)(a1 + 40) = v33;
            *(void *)(a1 + 48) = v30 + 6;
            *(void *)(a1 + 56) = &v29[6 * v28];
            if (v31) {
              operator delete(v31);
            }
          }

          else
          {
            *(_WORD *)(v23 + 4) = 0;
            *(_DWORD *)unint64_t v23 = 0;
            int v24 = (char *)(v23 + 6);
          }

          *(void *)(a1 + 48) = v24;
          continue;
        }

        MIDIEndpointSetRefCons(Destination, 0LL, 0LL);
      }

      else if (a2)
      {
        goto LABEL_7;
      }
    }
  }

void sub_665C(void **a1, unint64_t a2)
{
  unint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 2)
  {
    if (a2 >> 62) {
      sub_2DE0();
    }
    int64_t v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    size_t v6 = (char *)sub_2E68(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    unint64_t v9 = &v6[4 * v8];
    unint64_t v10 = (char *)*a1;
    unint64_t v11 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v11 != *a1)
    {
      uint64_t v12 = v7;
      do
      {
        int v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }

      while (v11 != v10);
    }

    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10) {
      operator delete(v10);
    }
  }

void sub_66F0(char **a1, unint64_t a2)
{
  unint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 1) < a2)
  {
    if (a2 >= 0x2AAAAAAAAAAAAAABLL) {
      sub_2DE0();
    }
    uint64_t v5 = (a1[1] - *a1) / 6;
    size_t v6 = (char *)sub_2EC4(v3, a2);
    uint64_t v7 = &v6[6 * v5];
    unint64_t v9 = &v6[6 * v8];
    unint64_t v11 = *a1;
    unint64_t v10 = a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        int v13 = *(_DWORD *)(v10 - 6);
        v10 -= 6;
        __int16 v14 = *((_WORD *)v10 + 2);
        *(_DWORD *)(v12 - 6) = v13;
        v12 -= 6;
        *((_WORD *)v12 + 2) = v14;
      }

      while (v10 != v11);
      unint64_t v10 = *a1;
    }

    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10) {
      operator delete(v10);
    }
  }

void *sub_67B0(void *result)
{
  std::logic_error *result = 0LL;
  result[1] = 0LL;
  *(void *)((char *)result + 21) = 0LL;
  result[2] = 0LL;
  return result;
}

uint64_t sub_67C0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2) {
    operator delete[](v2);
  }
  return a1;
}

void *sub_67EC(uint64_t a1, uint64_t a2, size_t __sz)
{
  int v3 = __sz;
  *(void *)a1 = a2;
  double result = operator new[](__sz);
  *(void *)(a1 + 8) = result;
  *(void *)(a1 + 16) = result;
  *(_DWORD *)(a1 + 24) = v3;
  return result;
}

uint64_t sub_6820(uint64_t a1, io_object_t object)
{
  *(_DWORD *)a1 = object;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 14) = 0LL;
  *(_DWORD *)(a1 + 22) = 1033;
  *(void *)(a1 + 32) = 0LL;
  IOObjectRetain(object);
  return a1;
}

uint64_t sub_6860(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 20)) {
    (*(void (**)(void))(**(void **)(a1 + 8) + 72LL))(*(void *)(a1 + 8));
  }
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24LL))(v2);
  }
  IOObjectRelease(*(_DWORD *)a1);
  int v3 = *(void **)(a1 + 32);
  if (v3) {
    operator delete[](v3);
  }
  return a1;
}

uint64_t sub_68C8(uint64_t a1)
{
  uint64_t v3 = a1 + 8;
  uint64_t result = *(void *)(a1 + 8);
  if (!result)
  {
    io_service_t v4 = *(_DWORD *)a1;
    uint64_t v5 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x9Du,  0xC7u,  0xB7u,  0x80u,  0x9Eu,  0xC0u,  0x11u,  0xD4u,  0xA5u,  0x4Fu,  0,  0xAu,  0x27u,  5u,  0x28u,  0x61u);
    size_t v6 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu);
    if (!IOCreatePlugInInterfaceForService(v4, v5, v6, &theInterface, &theScore)
      || (usleep(0x186A0u),
          io_service_t v7 = *(_DWORD *)a1,
          uint64_t v8 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x9Du,  0xC7u,  0xB7u,  0x80u,  0x9Eu,  0xC0u,  0x11u,  0xD4u,  0xA5u,  0x4Fu,  0,  0xAu,  0x27u,  5u,  0x28u,  0x61u),  v9 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu),  !IOCreatePlugInInterfaceForService(v7, v8, v9, &theInterface, &theScore)))
    {
      unint64_t v10 = theInterface;
      QueryInterface = (*theInterface)->QueryInterface;
      uint64_t v12 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xFEu,  0x2Fu,  0xD5u,  0x2Fu,  0x3Bu,  0x5Au,  0x47u,  0x3Bu,  0x97u,  0x7Bu,  0xADu,  0x99u,  0,  0x1Eu,  0xB3u,  0xEDu);
      CFUUIDBytes v13 = CFUUIDGetUUIDBytes(v12);
      int v14 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t))QueryInterface)( v10,  *(void *)&v13.byte0,  *(void *)&v13.byte8,  v3);
      uint64_t v15 = theInterface;
      unint64_t v16 = *theInterface;
      if (v14)
      {
        uint64_t v17 = v16->QueryInterface;
        unint64_t v18 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC8u,  9u,  0xB8u,  0xD8u,  8u,  0x84u,  0x11u,  0xD7u,  0xBBu,  0x96u,  0,  3u,  0x93u,  0x3Eu,  0x3Eu,  0x3Eu);
        CFUUIDBytes v19 = CFUUIDGetUUIDBytes(v18);
        int v20 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t))v17)( v15,  *(void *)&v19.byte0,  *(void *)&v19.byte8,  v3);
        ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
        theInterface = 0LL;
        if (v20)
        {
          sub_6BF4();
          MIDIEndpointRef v21 = (os_log_s *)qword_2C130;
          if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            unint64_t v25 = "USBDevice.cpp";
            __int16 v26 = 1024;
            int v27 = 123;
            _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d QueryInterface failed", buf, 0x12u);
          }

          *(void *)uint64_t v3 = 0LL;
          return *(void *)v3;
        }
      }

      else
      {
        ((void (*)(IOCFPlugInInterface **))v16->Release)(theInterface);
        theInterface = 0LL;
      }

      (*(void (**)(void, uint64_t))(**(void **)(a1 + 8) + 160LL))(*(void *)(a1 + 8), a1 + 16);
    }

    return *(void *)v3;
  }

  return result;
}

void sub_6BF4()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_2C138);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_2C138))
    {
      qword_2C130 = (uint64_t)os_log_create("com.apple.coremidi", "usbdev");
      __cxa_guard_release(&qword_2C138);
    }
  }

_BYTE *sub_6C50(_BYTE *result)
{
  if (!result[21])
  {
    int v1 = result;
    result[21] = 1;
    uint64_t result = (_BYTE *)sub_6D3C((uint64_t)result, 3, 0, 0, v8, 256);
    if ((int)result >= 3)
    {
      int v2 = v8[0];
      signed int v3 = v8[0] - 2 + (((v8[0] - 2) & 0x8000u) >> 15);
      int v4 = v3 >> 1;
      *((_WORD *)v1 + 12) = v3 >> 1;
      uint64_t result = operator new[](v3 & 0x1FFFE);
      *((void *)v1 + 4) = result;
      if ((v2 - 1) >= 3)
      {
        size_t v6 = (__int16 *)result;
        unsigned int v7 = (unsigned __int16)v4;
        if ((v4 & 0xFFFE) == 0) {
          unsigned int v7 = 1;
        }
        uint64_t result = memcpy(result, v9, 2LL * v7);
        __int16 v5 = *v6;
      }

      *((_WORD *)v1 + 11) = v5;
    }
  }

  return result;
}

uint64_t sub_6D3C(uint64_t a1, int a2, __int16 a3, __int16 a4, _BYTE *a5, __int16 a6)
{
  uint64_t v12 = sub_68C8(a1);
  if (v12)
  {
    uint64_t v13 = v12;
    __int16 v24 = 1664;
    __int16 v14 = a3 | ((_WORD)a2 << 8);
    __int16 v25 = v14;
    __int16 v26 = a4;
    unint64_t v28 = a5;
    if (a2 == 3) {
      __int16 v15 = 2;
    }
    else {
      __int16 v15 = a6;
    }
    __int16 v27 = v15;
    unsigned int v16 = 0;
    do
    {
      usleep(0x1388u);
      int v17 = (*(uint64_t (**)(void))(*(void *)v13 + 64LL))(*(void *)(a1 + 8));
      int v18 = v17;
      if (v16 > 0x12) {
        break;
      }
      ++v16;
    }

    while (v17);
    if (!v17)
    {
LABEL_12:
      int v20 = (*(uint64_t (**)(uint64_t, __int16 *))(*(void *)v13 + 208LL))(v13, &v24);
      if (a2 == 3)
      {
        if (v20) {
          BOOL v21 = v20 == -536870168;
        }
        else {
          BOOL v21 = 1;
        }
        if (!v21) {
          return 0xFFFFFFFFLL;
        }
        __int16 v22 = *a5;
        if (!*a5) {
          return 0LL;
        }
        __int16 v24 = 1664;
        __int16 v25 = v14;
        __int16 v26 = a4;
        __int16 v27 = v22;
        unint64_t v28 = a5;
        int v20 = (*(uint64_t (**)(uint64_t, __int16 *))(*(void *)v13 + 208LL))(v13, &v24);
      }

      if (!v20) {
        return v29;
      }
      return 0xFFFFFFFFLL;
    }

    sub_6BF4();
    CFUUIDBytes v19 = (os_log_s *)qword_2C130;
    if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      char v31 = "USBDevice.cpp";
      __int16 v32 = 1024;
      int v33 = 264;
      __int16 v34 = 1024;
      int v35 = v18;
      _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d USBDevice::LoadDescriptor - Could not open device due to error 0x%x",  buf,  0x18u);
    }
  }

  return 0xFFFFFFFFLL;
}

BOOL sub_6F24(uint64_t a1, uint64_t a2)
{
  int v4 = (os_log_s *)qword_2C130;
  if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "USBDevice.cpp";
    __int16 v11 = 1024;
    int v12 = 166;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d -> USBDevice::OpenAndConfigure", buf, 0x12u);
  }

  if (!sub_68C8(a1)
    || !*(_BYTE *)(a1 + 20)
    && ((uint64_t v5 = sub_68C8(a1), (*(unsigned int (**)(void))(*(void *)v5 + 64LL))(*(void *)(a1 + 8)))
     || (*(_BYTE *)(a1 + 20) = 1,
         (*(unsigned int (**)(void, char *))(**(void **)(a1 + 8) + 176LL))(*(void *)(a1 + 8), &v9))
     || !v9
     && ((*(unsigned int (**)(void, uint64_t, _BYTE *))(**(void **)(a1 + 8) + 168LL))( *(void *)(a1 + 8),  a2,  buf)
      || (*(unsigned int (**)(void, void))(**(void **)(a1 + 8) + 184LL))( *(void *)(a1 + 8),  *(unsigned __int8 *)(*(void *)buf + 5LL)))))
  {
    sub_6BF4();
    uint64_t v8 = (os_log_s *)qword_2C130;
    BOOL result = os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_DEBUG);
    if (result)
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "USBDevice.cpp";
      __int16 v11 = 1024;
      int v12 = 193;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d <- USBDevice::OpenAndConfigure returning false",  buf,  0x12u);
      return 0LL;
    }
  }

  else
  {
    sub_6BF4();
    size_t v6 = (os_log_s *)qword_2C130;
    if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "USBDevice.cpp";
      __int16 v11 = 1024;
      int v12 = 190;
      _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d <- USBDevice::OpenAndConfigure returning true",  buf,  0x12u);
    }

    return 1LL;
  }

  return result;
}

CFStringRef sub_714C(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  __int16 v2 = a2;
  sub_6C50((_BYTE *)a1);
  int v4 = sub_6D3C(a1, 3, v2, *(_WORD *)(a1 + 22), v6, 256);
  if (v4 >= 3) {
    return CFStringCreateWithCharacters(0LL, v7, (v4 - 2) >> 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_71D0(uint64_t a1, int a2, int a3, uint64_t a4, int a5, _DWORD *a6)
{
  int v12 = (os_log_s *)qword_2C130;
  if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316418;
    v47 = "USBDevice.cpp";
    __int16 v48 = 1024;
    int v49 = 309;
    __int16 v50 = 1024;
    *(_DWORD *)v51 = a2;
    *(_WORD *)&v51[4] = 1024;
    *(_DWORD *)&v51[6] = a3;
    __int16 v52 = 2048;
    uint64_t v53 = a4;
    __int16 v54 = 1024;
    int v55 = a5;
    _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "%25s:%-5d [+] USBDevice::LoadGroupTerminalDescriptors(interface: %d, altSettingNumber: %d, buf:%p, len:%d)",  buf,  0x2Eu);
  }

  *a6 = 0;
  uint64_t v13 = sub_68C8(a1);
  if (v13)
  {
    uint64_t v14 = v13;
    int v15 = (*(uint64_t (**)(void))(*(void *)v13 + 64LL))(*(void *)(a1 + 8));
    if (!v15) {
      goto LABEL_13;
    }
    int v16 = v15;
    sub_6BF4();
    int v17 = (os_log_s *)qword_2C130;
    if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v47 = "USBDevice.cpp";
      __int16 v48 = 1024;
      int v49 = 320;
      __int16 v50 = 1024;
      *(_DWORD *)v51 = v16;
      _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_INFO,  "%25s:%-5d      USBDeviceOpen failed with error 0x%x. Will retrying ...",  buf,  0x18u);
    }

    unsigned int v18 = 0;
    do
    {
      usleep(0x1388u);
      uint64_t v19 = (*(uint64_t (**)(void))(*(void *)v14 + 64LL))(*(void *)(a1 + 8));
      uint64_t v20 = v19;
      if (v18 > 3) {
        break;
      }
      ++v18;
    }

    while ((_DWORD)v19);
    if ((_DWORD)v19)
    {
      sub_6BF4();
      uint64_t v21 = qword_2C130;
      if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 326;
        __int16 v50 = 1024;
        *(_DWORD *)v51 = v20;
        __int16 v22 = "%25s:%-5d [-] USBDevice::LoadGroupTerminalDescriptors() - Could not open device due to error 0x%x";
        unint64_t v23 = (os_log_s *)v21;
        os_log_type_t v24 = OS_LOG_TYPE_ERROR;
        uint32_t v25 = 24;
LABEL_44:
        _os_log_impl(&dword_0, v23, v24, v22, buf, v25);
      }
    }

    else
    {
LABEL_13:
      __int16 v40 = 1665;
      unsigned __int16 v41 = a3 | 0x2600;
      unsigned __int16 v42 = a2;
      uint64_t v44 = a4;
      uint64_t v45 = 0LL;
      unsigned __int16 v43 = a5;
      uint64_t v20 = (*(uint64_t (**)(uint64_t, __int16 *))(*(void *)v14 + 208LL))(v14, &v40);
      sub_6BF4();
      __int16 v26 = (os_log_s *)qword_2C130;
      if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 23;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEBUG, "%25s:%-5d [+] LogDeviceRequest()", buf, 0x12u);
      }

      sub_6BF4();
      __int16 v27 = (os_log_s *)qword_2C130;
      if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 24;
        __int16 v50 = 1024;
        *(_DWORD *)v51 = v40;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEBUG, "%25s:%-5d      bmRequestType: 0x%00x", buf, 0x18u);
      }

      sub_6BF4();
      unint64_t v28 = (os_log_s *)qword_2C130;
      if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 25;
        __int16 v50 = 1024;
        *(_DWORD *)v51 = HIBYTE(v40);
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEBUG, "%25s:%-5d      bRequest:      0x%00x", buf, 0x18u);
      }

      sub_6BF4();
      unsigned int v29 = (os_log_s *)qword_2C130;
      if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 26;
        __int16 v50 = 1024;
        *(_DWORD *)v51 = v41;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEBUG, "%25s:%-5d      wValue:        0x%0000x", buf, 0x18u);
      }

      sub_6BF4();
      char v30 = (os_log_s *)qword_2C130;
      if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 27;
        __int16 v50 = 1024;
        *(_DWORD *)v51 = v42;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEBUG, "%25s:%-5d      wIndex:        0x%0000x", buf, 0x18u);
      }

      sub_6BF4();
      char v31 = (os_log_s *)qword_2C130;
      if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 28;
        __int16 v50 = 1024;
        *(_DWORD *)v51 = v43;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEBUG, "%25s:%-5d      wLength:       %u", buf, 0x18u);
      }

      sub_6BF4();
      __int16 v32 = (os_log_s *)qword_2C130;
      if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 29;
        __int16 v50 = 2048;
        *(void *)v51 = v44;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEBUG, "%25s:%-5d      pData:         %p", buf, 0x1Cu);
      }

      sub_6BF4();
      int v33 = (os_log_s *)qword_2C130;
      if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 30;
        __int16 v50 = 1024;
        *(_DWORD *)v51 = v45;
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEBUG, "%25s:%-5d      wLenDone:      %u", buf, 0x18u);
      }

      sub_6BF4();
      __int16 v34 = (os_log_s *)qword_2C130;
      if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 31;
        _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEBUG, "%25s:%-5d [-] LogDeviceRequest()", buf, 0x12u);
      }

      if ((_DWORD)v20 == -536854449)
      {
        sub_6BF4();
        int v35 = (os_log_s *)qword_2C130;
        if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v47 = "USBDevice.cpp";
          __int16 v48 = 1024;
          int v49 = 342;
          _os_log_impl( &dword_0,  v35,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Pipe stall on DeviceRequest(). Will retry once only.",  buf,  0x12u);
        }

        uint64_t v20 = (*(uint64_t (**)(uint64_t, __int16 *))(*(void *)v14 + 208LL))(v14, &v40);
      }

      if ((_DWORD)v20)
      {
        sub_6BF4();
        v36 = (os_log_s *)qword_2C130;
        if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v47 = "USBDevice.cpp";
          __int16 v48 = 1024;
          int v49 = 346;
          __int16 v50 = 1024;
          *(_DWORD *)v51 = v20;
          _os_log_impl( &dword_0,  v36,  OS_LOG_TYPE_ERROR,  "%25s:%-5d      DeviceRequest() returned error 0x%x",  buf,  0x18u);
        }
      }

      else
      {
        *a6 = v45;
      }

      sub_6BF4();
      uint64_t v38 = qword_2C130;
      if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 350;
        __int16 v50 = 1024;
        *(_DWORD *)v51 = v45;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = v20;
        __int16 v22 = "%25s:%-5d [-] USBDevice::LoadGroupTerminalDescriptors(outLength: %u) = %d";
        unint64_t v23 = (os_log_s *)v38;
        os_log_type_t v24 = OS_LOG_TYPE_INFO;
        uint32_t v25 = 30;
        goto LABEL_44;
      }
    }
  }

  else
  {
    sub_6BF4();
    v37 = (os_log_s *)qword_2C130;
    if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v47 = "USBDevice.cpp";
      __int16 v48 = 1024;
      int v49 = 313;
      _os_log_impl( &dword_0,  v37,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [-] USBDevice::LoadGroupTerminalDescriptors() - Could not get plugin interface!",  buf,  0x12u);
    }

    return 4294956451LL;
  }

  return v20;
}

uint64_t sub_7A20(uint64_t a1)
{
  uint64_t v3 = a1 + 16;
  uint64_t result = *(void *)(a1 + 16);
  if (!result)
  {
    io_service_t v4 = *(_DWORD *)(a1 + 8);
    uint64_t v5 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x2Du,  0x97u,  0x86u,  0xC6u,  0x9Eu,  0xF3u,  0x11u,  0xD4u,  0xADu,  0x51u,  0,  0xAu,  0x27u,  5u,  0x28u,  0x61u);
    size_t v6 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu);
    if (!IOCreatePlugInInterfaceForService(v4, v5, v6, &theInterface, &theScore))
    {
      unsigned int v7 = theInterface;
      QueryInterface = (*theInterface)->QueryInterface;
      char v9 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x64u,  0xBAu,  0xBDu,  0xD2u,  0xFu,  0x6Bu,  0x4Bu,  0x4Fu,  0x8Eu,  0x3Eu,  0xDCu,  0x36u,  4u,  0x69u,  0x87u,  0xADu);
      CFUUIDBytes v10 = CFUUIDGetUUIDBytes(v9);
      int v11 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t))QueryInterface)( v7,  *(void *)&v10.byte0,  *(void *)&v10.byte8,  v3);
      int v12 = theInterface;
      uint64_t v13 = *theInterface;
      if (v11)
      {
        uint64_t v14 = v13->QueryInterface;
        int v15 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x8Fu,  0xDBu,  0x84u,  0x55u,  0x74u,  0xA6u,  0x11u,  0xD6u,  0x97u,  0xB1u,  0,  0x30u,  0x65u,  0xD3u,  0x60u,  0x8Eu);
        CFUUIDBytes v16 = CFUUIDGetUUIDBytes(v15);
        int v17 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t))v14)( v12,  *(void *)&v16.byte0,  *(void *)&v16.byte8,  v3);
        ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
        theInterface = 0LL;
        if (v17)
        {
          sub_6BF4();
          unsigned int v18 = (os_log_s *)qword_2C130;
          if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v22 = "USBDevice.cpp";
            __int16 v23 = 1024;
            int v24 = 513;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d QueryInterface failed", buf, 0x12u);
          }

          *(void *)uint64_t v3 = 0LL;
        }
      }

      else
      {
        ((void (*)(IOCFPlugInInterface **))v13->Release)(theInterface);
      }
    }

    return *(void *)v3;
  }

  return result;
}

uint64_t sub_7CA0(uint64_t a1, char *a2, io_object_t object)
{
  *(void *)a1 = 0LL;
  *(_DWORD *)(a1 + 8) = object;
  *(void *)(a1 + 16) = 0LL;
  *(_WORD *)(a1 + 24) = 0;
  IOObjectRetain(object);
  uint64_t v5 = sub_7A20(a1);
  if (v5 || (usleep(0x186A0u), (uint64_t v5 = sub_7A20(a1)) != 0))
  {
    if (a2)
    {
LABEL_6:
      *(void *)a1 = a2;
      return a1;
    }

    if (!(*(unsigned int (**)(uint64_t, io_object_t *))(*(void *)v5 + 168LL))(v5, &objecta))
    {
      a2 = (char *)operator new(0x28uLL);
      io_object_t v6 = objecta;
      *(_DWORD *)a2 = objecta;
      *((void *)a2 + 1) = 0LL;
      *(void *)(a2 + 14) = 0LL;
      *(_DWORD *)(a2 + 22) = 1033;
      *((void *)a2 + 4) = 0LL;
      IOObjectRetain(v6);
      *(_BYTE *)(a1 + 24) = 1;
      goto LABEL_6;
    }
  }

  return a1;
}

void sub_7D58(_Unwind_Exception *a1)
{
}

uint64_t sub_7D6C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 25)) {
    (*(void (**)(void))(**(void **)(a1 + 16) + 72LL))(*(void *)(a1 + 16));
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24LL))(v2);
  }
  IOObjectRelease(*(_DWORD *)(a1 + 8));
  if (*(_BYTE *)(a1 + 24) && *(void *)a1)
  {
    uint64_t v3 = (void *)sub_6860(*(void *)a1);
    operator delete(v3);
  }

  return a1;
}

uint64_t sub_7DDC(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 25)) {
    return 1LL;
  }
  uint64_t v4 = sub_7A20(a1);
  if (!v4) {
    return 0LL;
  }
  int v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 64LL))(v4);
  if (v5)
  {
    int v7 = v5;
    sub_6BF4();
    uint64_t v8 = (os_log_s *)qword_2C130;
    if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315650;
      CFUUIDBytes v10 = "USBDevice.cpp";
      __int16 v11 = 1024;
      int v12 = 487;
      __int16 v13 = 1024;
      LODWORD(v14) = v7;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] USBInterface::Open() - err = 0x%x",  (uint8_t *)&v9,  0x18u);
    }

    return 0LL;
  }

  uint64_t v1 = 1LL;
  *(_BYTE *)(a1 + 25) = 1;
  sub_6BF4();
  io_object_t v6 = (os_log_s *)qword_2C130;
  if (os_log_type_enabled((os_log_t)qword_2C130, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315650;
    CFUUIDBytes v10 = "USBDevice.cpp";
    __int16 v11 = 1024;
    int v12 = 482;
    __int16 v13 = 2048;
    uint64_t v14 = a1;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [?] USBInterface(%p)::Open() - success",  (uint8_t *)&v9,  0x1Cu);
  }

  return v1;
}

uint64_t sub_7F58(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  *(_BYTE *)(a3 + 6) = a2;
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)(a1 + 16)
                                                                                                + 208LL))( *(void *)(a1 + 16),  a2,  a3 + 1,  a3,  a3 + 2,  a3 + 4,  a3 + 3);
}

void *sub_7F84(void *a1, uint64_t a2)
{
  CFMutableDictionaryRef v4 = IOServiceMatching("IOUSBDevice");
  sub_3F64((uint64_t)a1, a2, (uint64_t)v4);
  *a1 = off_28818;
  sub_8088();
  int v5 = (os_log_s *)qword_2C140;
  if (os_log_type_enabled((os_log_t)qword_2C140, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315906;
    uint64_t v8 = "USBDeviceManager.cpp";
    __int16 v9 = 1024;
    int v10 = 23;
    __int16 v11 = 2048;
    int v12 = a1;
    __int16 v13 = 2048;
    uint64_t v14 = a2;
    _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] USBDeviceManager(%p)::USBDeviceManager(notifyRunloop %p)",  (uint8_t *)&v7,  0x26u);
  }

  return a1;
}

void sub_8088()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_2C148);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_2C148))
    {
      qword_2C140 = (uint64_t)os_log_create("com.apple.coremidi", "usbdvm");
      __cxa_guard_release(&qword_2C148);
    }
  }

void sub_80E4(uint64_t a1, io_object_t a2)
{
  CFMutableDictionaryRef v4 = operator new(0x28uLL);
  sub_6820((uint64_t)v4, a2);
  if (sub_6F24((uint64_t)v4, 0LL))
  {
    int v5 = (*(uint64_t (**)(uint64_t, void *))(*(void *)a1 + 40LL))(a1, v4);
    if (!v5) {
      return;
    }
    int v6 = v5;
    sub_8088();
    uint64_t v7 = qword_2C140;
    if (os_log_type_enabled((os_log_t)qword_2C140, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315906;
      uint64_t v14 = "USBDeviceManager.cpp";
      __int16 v15 = 1024;
      int v16 = 41;
      __int16 v17 = 2048;
      uint64_t v18 = a1;
      __int16 v19 = 1024;
      int v20 = v6;
      uint64_t v8 = "%25s:%-5d [!] USBDeviceManager(%p)::ServicePublished() - UseDevice failed with error 0x%x";
      __int16 v9 = (os_log_s *)v7;
      uint32_t v10 = 34;
LABEL_9:
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&v13, v10);
    }
  }

  else
  {
    sub_8088();
    uint64_t v11 = qword_2C140;
    if (os_log_type_enabled((os_log_t)qword_2C140, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315650;
      uint64_t v14 = "USBDeviceManager.cpp";
      __int16 v15 = 1024;
      int v16 = 43;
      __int16 v17 = 2048;
      uint64_t v18 = a1;
      uint64_t v8 = "%25s:%-5d [!] USBDeviceManager(%p)::ServicePublished() - OpenAndConfigure failed";
      __int16 v9 = (os_log_s *)v11;
      uint32_t v10 = 28;
      goto LABEL_9;
    }
  }

LABEL_10:
  int v12 = (void *)sub_68C4((uint64_t)v4);
  operator delete(v12);
}

    uint64_t v8 = (void *)sub_7C9C((uint64_t)v4);
    operator delete(v8);
    return;
  }

  if (os_log_type_enabled((os_log_t)qword_2C150, OS_LOG_TYPE_DEBUG))
  {
    __int16 v9 = 136315650;
    uint32_t v10 = "USBInterfaceManager.cpp";
    uint64_t v11 = 1024;
    int v12 = 56;
    int v13 = 1024;
    uint64_t v14 = a2;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [-] USBInterfaceManager::ServicePublished(0x%x)",  (uint8_t *)&v9,  0x18u);
  }

void sub_82A0(_Unwind_Exception *a1)
{
}

uint64_t sub_82B4(void *a1, uint64_t a2)
{
  CFMutableDictionaryRef v4 = IOServiceMatching("IOUSBInterface");
  uint64_t result = sub_3F64((uint64_t)a1, a2, (uint64_t)v4);
  *a1 = off_28858;
  return result;
}

void sub_82FC()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_2C158);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_2C158))
    {
      qword_2C150 = (uint64_t)os_log_create("com.apple.coremidi", "intmgr");
      __cxa_guard_release(&qword_2C158);
    }
  }

void sub_8358(uint64_t a1, io_object_t a2)
{
  CFMutableDictionaryRef v4 = (uint64_t *)operator new(0x20uLL);
  sub_7A1C((int)v4, 0, a2);
  if (!*v4
    || !sub_68C8(*v4)
    || !sub_7A20((uint64_t)v4)
    || !(*(unsigned int (**)(uint64_t, uint64_t *))(*(void *)a1 + 32LL))(a1, v4))
  {
    goto LABEL_10;
  }

  sub_82FC();
  int v5 = (os_log_s *)qword_2C150;
  if (os_log_type_enabled((os_log_t)qword_2C150, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315650;
    uint32_t v10 = "USBInterfaceManager.cpp";
    __int16 v11 = 1024;
    int v12 = 52;
    __int16 v13 = 1024;
    io_object_t v14 = a2;
    _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [+] USBInterfaceManager::ServicePublished(0x%x) -- matched MIDI streaming interface",  (uint8_t *)&v9,  0x18u);
  }

  int v6 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)a1 + 40LL))(a1, v4);
  sub_82FC();
  uint64_t v7 = (os_log_s *)qword_2C150;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)qword_2C150, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136316162;
      uint32_t v10 = "USBInterfaceManager.cpp";
      __int16 v11 = 1024;
      int v12 = 61;
      __int16 v13 = 1024;
      io_object_t v14 = a2;
      __int16 v15 = 1024;
      int v16 = v6;
      __int16 v17 = 1024;
      int v18 = v6;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] USBInterfaceManager::ServicePublished(0x%x) - failed with error 0x%x (%d)",  (uint8_t *)&v9,  0x24u);
    }

void sub_8580(_Unwind_Exception *exception_object)
{
}

double sub_859C(uint64_t a1)
{
  *(_BYTE *)(a1 + 161) = 17;
  *(_DWORD *)(a1 + 164) = 2139062143;
  *(void *)&double result = 0x100000001LL;
  *(_DWORD *)(a1 + 168) = 1;
  return result;
}

uint64_t sub_85B8( uint64_t a1, int a2, unsigned int a3, unsigned int a4, unsigned int a5, char *a6, uint64_t a7)
{
  unsigned int v13 = 0xFFFFFFF;
  if (a5 != 36 && a5 != 112 && a5 != 126)
  {
    if (a5 == 37) {
      unsigned int v13 = 0xFFFFFFF;
    }
    else {
      unsigned int v13 = a4;
    }
  }

  if (*(void *)(a1 + 16) == *(void *)(a1 + 8))
  {
    if ((a5 & 0xFE) == 0x70) {
      char v18 = 127;
    }
    else {
      char v18 = a2;
    }
    *(_BYTE *)(a1 + 185) = v18;
    *(_DWORD *)(a1 + 176) = a3;
    *(_DWORD *)(a1 + 180) = v13;
    *(_BYTE *)(a1 + 184) = a5;
    __int16 __src = 32496;
    char v54 = a2;
    char v55 = 13;
    char v56 = a5;
    char v57 = 1;
    uint64_t v58 = 0LL;
    if (!(a3 >> 28))
    {
      int16x8_t v19 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(a3), (uint32x4_t)xmmword_22FC0);
      *(int16x4_t *)v19.i8 = vrev64_s16((int16x4_t)vand_s8( (int8x8_t)vmovn_s32((int32x4_t)v19),  (int8x8_t)0x7F007F007F007FLL));
      LODWORD(v58) = vmovn_s16(v19).u32[0];
    }

    if (!(v13 >> 28))
    {
      int16x8_t v20 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v13), (uint32x4_t)xmmword_22FC0);
      *(int16x4_t *)v20.i8 = vrev64_s16((int16x4_t)vand_s8( (int8x8_t)vmovn_s32((int32x4_t)v20),  (int8x8_t)0x7F007F007F007FLL));
      HIDWORD(v58) = vmovn_s16(v20).u32[0];
    }

    sub_8B5C();
    uint64_t v21 = (os_log_s *)qword_2C160;
    if (os_log_type_enabled((os_log_t)qword_2C160, OS_LOG_TYPE_DEBUG))
    {
      sub_92B4(__p, 0x2AuLL, 0);
      uint64_t v22 = 0LL;
      if (v34 >= 0) {
        __int16 v23 = __p;
      }
      else {
        __int16 v23 = (void **)__p[0];
      }
      do
      {
        unint64_t v24 = *((unsigned __int8 *)&__src + v22);
        *(_BYTE *)__int16 v23 = a0123456789abcd[v24 >> 4];
        *((_BYTE *)v23 + 1) = a0123456789abcd[v24 & 0xF];
        *((_BYTE *)v23 + 2) = 32;
        __int16 v23 = (void **)((char *)v23 + 3);
        ++v22;
      }

      while (v22 != 14);
      uint32_t v25 = __p;
      if (v34 < 0) {
        uint32_t v25 = (void **)__p[0];
      }
      *(_DWORD *)buf = 136315650;
      v36 = "MIDICIMessageEmitter.cpp";
      __int16 v37 = 1024;
      int v38 = 46;
      __int16 v39 = 2080;
      *(void *)__int16 v40 = v25;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d      new message hdr: %s ...", buf, 0x1Cu);
      if (v34 < 0) {
        operator delete(__p[0]);
      }
    }

    sub_935C(a1 + 8, *(char **)(a1 + 16), (char *)&__src, (char *)&v59, 14LL);
  }

  else
  {
    sub_8B5C();
    io_object_t v14 = (os_log_s *)qword_2C160;
    if (os_log_type_enabled((os_log_t)qword_2C160, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = *(void *)(a1 + 16) - *(void *)(a1 + 8);
      *(_DWORD *)buf = 136315650;
      v36 = "MIDICIMessageEmitter.cpp";
      __int16 v37 = 1024;
      int v38 = 49;
      __int16 v39 = 2048;
      *(void *)__int16 v40 = v15;
      _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      Message already has %lu bytes. Checking continuation ...",  buf,  0x1Cu);
    }

    if (*(_DWORD *)(a1 + 176) != a3 || *(_DWORD *)(a1 + 180) != a4 || *(unsigned __int8 *)(a1 + 184) != a5)
    {
      sub_8B5C();
      int v16 = (os_log_s *)qword_2C160;
      if (os_log_type_enabled((os_log_t)qword_2C160, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "MIDICIMessageEmitter.cpp";
        __int16 v37 = 1024;
        int v38 = 52;
        _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] MIDICIMessageEmitter::CreateCIMessage() can't continue message (kMIDINotPermitted)",  buf,  0x12u);
      }

      uint64_t v17 = 4294956452LL;
LABEL_47:
      *(void *)(a1 + 16) = *(void *)(a1 + 8);
      return v17;
    }
  }

  switch(a5 >> 4)
  {
    case 1u:
      uint64_t v26 = sub_8BB8(a1, a6, a7);
      goto LABEL_41;
    case 2u:
      uint64_t v26 = sub_8D0C(a1, a6, a7);
      goto LABEL_41;
    case 3u:
      uint64_t v26 = sub_8E7C(a1, a6, a7);
      goto LABEL_41;
    case 7u:
      uint64_t v26 = sub_8F78(a1, (uint64_t)a6, a7);
LABEL_41:
      uint64_t v17 = v26;
      break;
    default:
      sub_8B5C();
      __int16 v27 = (os_log_s *)qword_2C160;
      if (os_log_type_enabled((os_log_t)qword_2C160, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v36 = "MIDICIMessageEmitter.cpp";
        __int16 v37 = 1024;
        int v38 = 76;
        __int16 v39 = 1024;
        *(_DWORD *)__int16 v40 = a5 >> 4;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d      Unhandled message type: 0x%x", buf, 0x18u);
      }

      uint64_t v17 = 4294956452LL;
      break;
  }

  sub_8B5C();
  unint64_t v28 = (os_log_s *)qword_2C160;
  if (os_log_type_enabled((os_log_t)qword_2C160, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v29 = sub_17F30(a5);
    *(_DWORD *)buf = 136317442;
    v36 = "MIDICIMessageEmitter.cpp";
    __int16 v37 = 1024;
    int v38 = 80;
    __int16 v39 = 1024;
    *(_DWORD *)__int16 v40 = a2;
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)&v40[6] = a3;
    __int16 v41 = 1024;
    unsigned int v42 = a4;
    __int16 v43 = 1024;
    unsigned int v44 = a5;
    __int16 v45 = 2080;
    v46 = v29;
    __int16 v47 = 2048;
    __int16 v48 = a6;
    __int16 v49 = 2048;
    uint64_t v50 = a7;
    __int16 v51 = 1024;
    int v52 = v17;
    _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] MIDICIMessageEmitter::CreateCIMessage(channel:0x%x, sourceMUID:0x%08x, destMUID:0x%08x, msgIndex:0x% x (%s), data:%p, length:%lu) = %d",  buf,  0x4Eu);
  }

  if ((_DWORD)v17)
  {
    sub_8B5C();
    char v30 = (os_log_s *)qword_2C160;
    if (os_log_type_enabled((os_log_t)qword_2C160, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v36 = "MIDICIMessageEmitter.cpp";
      __int16 v37 = 1024;
      int v38 = 83;
      __int16 v39 = 1024;
      *(_DWORD *)__int16 v40 = v17;
      _os_log_impl( &dword_0,  v30,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] MIDICIMessageEmitter::CreateCIMessage() failed with error %d (message will not be sent)",  buf,  0x18u);
    }

    goto LABEL_47;
  }

  return v17;
}

void sub_8B5C()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_2C168);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_2C168))
    {
      qword_2C160 = (uint64_t)os_log_create("com.apple.coremidi", "ciemit");
      __cxa_guard_release(&qword_2C168);
    }
  }

uint64_t sub_8BB8(uint64_t a1, char *a2, unsigned int a3)
{
  char __src = 99;
  char v15 = 0;
  uint64_t v6 = a1 + 8;
  sub_935C(a1 + 8, *(char **)(a1 + 16), &__src, &v17, 1LL);
  int v7 = *(unsigned __int8 *)(a1 + 184);
  if ((v7 - 16) < 2)
  {
    if (a3 != 5 * (a3 / 5)) {
      goto LABEL_14;
    }
    char v15 = a3 / 5;
    sub_935C(v6, *(char **)(a1 + 16), &v15, &__src, 1LL);
    uint64_t v8 = 0LL;
    if (a2)
    {
      int64_t v9 = (unsigned __int16)a3;
      if ((_WORD)a3)
      {
        uint32_t v10 = *(char **)(a1 + 16);
        __int16 v11 = &a2[(unsigned __int16)a3];
        uint64_t v12 = v6;
        unsigned int v13 = a2;
        goto LABEL_12;
      }
    }
  }

  else
  {
    if ((v7 - 19) < 2)
    {
      sub_9104(a1);
LABEL_13:
      uint64_t v8 = 0LL;
      goto LABEL_15;
    }

    uint64_t v8 = 0LL;
    if (v7 == 18)
    {
      if (a3 == 5)
      {
        if (!a2) {
          goto LABEL_13;
        }
        uint32_t v10 = *(char **)(a1 + 16);
        __int16 v11 = a2 + 5;
        uint64_t v12 = v6;
        unsigned int v13 = a2;
        int64_t v9 = 5LL;
LABEL_12:
        sub_935C(v12, v10, v13, v11, v9);
        goto LABEL_13;
      }

LABEL_14:
      uint64_t v8 = 4294956452LL;
    }
  }

LABEL_15:
  char v17 = -9;
  sub_935C(v6, *(char **)(a1 + 16), &v17, (char *)&v18, 1LL);
  return v8;
}

uint64_t sub_8D0C(uint64_t a1, char *__src, unsigned int a3)
{
  unsigned __int32 v15 = 0;
  uint64_t v6 = 0LL;
  switch(*(_BYTE *)(a1 + 184))
  {
    case ' ':
      break;
    case '!':
      uint64_t v6 = sub_9188(a1, (unsigned __int16 *)__src, a3);
      break;
    case '""':
    case '#':
    case '$':
    case '%':
      if (a3 == 5)
      {
        if (!__src) {
          goto LABEL_6;
        }
        uint64_t v7 = a1 + 8;
        uint64_t v8 = *(char **)(a1 + 16);
        int64_t v9 = __src + 5;
        uint32_t v10 = __src;
        int64_t v11 = 5LL;
        goto LABEL_5;
      }

      uint64_t v6 = 4294956460LL;
      break;
    case '&':
      if (a3 < 6) {
        goto LABEL_10;
      }
      if (__src) {
        sub_935C(a1 + 8, *(char **)(a1 + 16), __src, __src + 5, 5LL);
      }
      unsigned int v13 = a3 - 5;
      if (!(v13 >> 28))
      {
        int16x8_t v14 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v13), (uint32x4_t)xmmword_22FC0);
        *(int16x4_t *)v14.i8 = vrev64_s16((int16x4_t)vand_s8( (int8x8_t)vmovn_s32((int32x4_t)v14),  (int8x8_t)0x7F007F007F007FLL));
        unsigned __int32 v15 = vmovn_s16(v14).u32[0];
      }

      sub_935C(a1 + 8, *(char **)(a1 + 16), (char *)&v15, v16, 4LL);
      int64_t v11 = (unsigned __int16)v13;
      if ((_WORD)v13)
      {
        uint32_t v10 = __src + 5;
        uint64_t v8 = *(char **)(a1 + 16);
        int64_t v9 = &__src[(unsigned __int16)v13 + 5];
        uint64_t v7 = a1 + 8;
LABEL_5:
        sub_935C(v7, v8, v10, v9, v11);
      }

LABEL_6:
      uint64_t v6 = 0LL;
      break;
    default:
LABEL_10:
      uint64_t v6 = 4294956452LL;
      break;
  }

  char __srca = -9;
  sub_935C(a1 + 8, *(char **)(a1 + 16), &__srca, (char *)&v18, 1LL);
  return v6;
}

uint64_t sub_8E7C(uint64_t a1, char *__src, unsigned __int16 a3)
{
  int v4 = *(unsigned __int8 *)(a1 + 184);
  if ((v4 - 50) >= 8)
  {
    if ((v4 - 48) < 2)
    {
      if (__src) {
        sub_935C(a1 + 8, *(char **)(a1 + 16), __src, __src + 1, 1LL);
      }
      char v10 = -9;
      uint64_t v5 = a1 + 8;
      uint64_t v6 = *(char **)(a1 + 16);
      p_srca = &__srca;
      uint64_t v8 = &v10;
      goto LABEL_6;
    }

    if (v4 != 63)
    {
      char v12 = -9;
      sub_935C(a1 + 8, *(char **)(a1 + 16), &v12, (char *)&v13, 1LL);
      return 4294956452LL;
    }
  }

  if (__src)
  {
    if (a3) {
      sub_935C(a1 + 8, *(char **)(a1 + 16), __src, &__src[a3], a3);
    }
  }

  char __srca = -9;
  uint64_t v5 = a1 + 8;
  uint64_t v6 = *(char **)(a1 + 16);
  p_srca = &v12;
  uint64_t v8 = &__srca;
LABEL_6:
  sub_935C(v5, v6, v8, p_srca, 1LL);
  return 0LL;
}

uint64_t sub_8F78(uint64_t a1, uint64_t a2, int a3)
{
  if (a3) {
    BOOL v6 = a2 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = *(unsigned __int8 *)(a1 + 184);
  if (v6 && (v7 & 0xFE) == 0x70) {
    return 4294956452LL;
  }
  char __src = 0;
  unsigned __int32 v15 = 0;
  if ((v7 - 112) < 2)
  {
    int64_t v9 = (char **)(a1 + 16);
    uint64_t v10 = a1 + 8;
    sub_935C(a1 + 8, *(char **)(a1 + 16), (char *)(a1 + 161), (char *)(a1 + 172), 11LL);
    if (a3 != 5) {
      return 4294956452LL;
    }
    char __src = *(_BYTE *)a2;
    unsigned int v11 = *(_DWORD *)(a2 + 1);
    if (!(v11 >> 28))
    {
      int16x8_t v12 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v11), (uint32x4_t)xmmword_22FC0);
      *(int16x4_t *)v12.i8 = vrev64_s16((int16x4_t)vand_s8( (int8x8_t)vmovn_s32((int32x4_t)v12),  (int8x8_t)0x7F007F007F007FLL));
      unsigned __int32 v15 = vmovn_s16(v12).u32[0];
    }

    sub_935C(a1 + 8, *v9, &__src, &v18, 1LL);
    goto LABEL_19;
  }

  if (v7 == 126)
  {
    unsigned int v13 = *(_DWORD *)(a1 + 176);
    if (!(v13 >> 28))
    {
      int16x8_t v14 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v13), (uint32x4_t)xmmword_22FC0);
      *(int16x4_t *)v14.i8 = vrev64_s16((int16x4_t)vand_s8( (int8x8_t)vmovn_s32((int32x4_t)v14),  (int8x8_t)0x7F007F007F007FLL));
      unsigned __int32 v15 = vmovn_s16(v14).u32[0];
    }

    uint64_t v10 = a1 + 8;
    int64_t v9 = (char **)(a1 + 16);
LABEL_19:
    sub_935C(v10, *v9, (char *)&v15, v16, 4LL);
    goto LABEL_20;
  }

  if (v7 != 127) {
    return 4294956452LL;
  }
LABEL_20:
  char v18 = -9;
  sub_935C(a1 + 8, *(char **)(a1 + 16), &v18, (char *)&v19, 1LL);
  return 0LL;
}

char *sub_9104(uint64_t a1)
{
  v2[0] = xmmword_22FD0;
  v2[1] = xmmword_22FE0;
  v2[2] = xmmword_22FF0;
  return sub_935C(a1 + 8, *(char **)(a1 + 16), (char *)v2, v3, 48LL);
}

uint64_t sub_9188(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  uint64_t result = 4294956452LL;
  if (a2 && a3)
  {
    uint64_t v6 = *a2;
    __src[0] = v6 & 0x7F;
    __src[1] = (v6 >> 7) & 0x7F;
    sub_935C(a1 + 8, *(char **)(a1 + 16), __src, (char *)&v15, 2LL);
    if (v6)
    {
      int v7 = (char *)a2 + 7;
      uint64_t v8 = v6;
      do
      {
        sub_935C(a1 + 8, *(char **)(a1 + 16), v7 - 5, v7, 5LL);
        v7 += 5;
        --v8;
      }

      while (v8);
    }

    __int16 v9 = 5 * v6;
    uint64_t v10 = *(unsigned __int16 *)((char *)a2 + (unsigned __int16)(v9 + 2));
    v13[0] = v10 & 0x7F;
    v13[1] = (v10 >> 7) & 0x7F;
    sub_935C(a1 + 8, *(char **)(a1 + 16), v13, __src, 2LL);
    if ((_DWORD)v10)
    {
      unsigned int v11 = (char *)a2 + (unsigned __int16)(v9 + 4);
      do
      {
        int16x8_t v12 = v11 + 5;
        sub_935C(a1 + 8, *(char **)(a1 + 16), v11, v11 + 5, 5LL);
        unsigned int v11 = v12;
        --v10;
      }

      while (v10);
    }

    return 0LL;
  }

  return result;
}

void sub_92A0()
{
}

void *sub_92B4(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_92A0();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000LL;
    *__b = v6;
  }

  else
  {
    *((_BYTE *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }

  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

char *sub_935C(uint64_t a1, char *__dst, char *__src, char *a4, int64_t a5)
{
  uint64_t v5 = __dst;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v10 = *(char **)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    unsigned int v11 = *(char **)a1;
    uint64_t v12 = (uint64_t)&v10[a5 - *(void *)a1];
    if (v12 < 0) {
      sub_2DE0();
    }
    unsigned int v13 = (char *)(__dst - v11);
    unint64_t v14 = v9 - (void)v11;
    if (2 * v14 > v12) {
      uint64_t v12 = 2 * v14;
    }
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v15 = v12;
    }
    if (v15)
    {
      size_t v16 = v15;
      char v17 = (char *)operator new(v15);
    }

    else
    {
      size_t v16 = 0LL;
      char v17 = 0LL;
    }

    __int16 v27 = &v13[(void)v17];
    memcpy(&v13[(void)v17], __src, a5);
    unint64_t v28 = &v13[(void)v17];
    size_t v29 = v16;
    if (v11 != v5)
    {
      do
      {
        v13[(void)v17 - 1] = v13[(void)(v11 - 1)];
        --v13;
      }

      while (v13);
      uint64_t v10 = *(char **)(a1 + 8);
      unint64_t v28 = v17;
    }

    char v30 = &v27[a5];
    char v31 = &v17[v29];
    if (v10 != v5) {
      memmove(v30, v5, v10 - v5);
    }
    __int16 v32 = *(char **)a1;
    *(void *)a1 = v28;
    *(void *)(a1 + 8) = &v30[v10 - v5];
    *(void *)(a1 + 16) = v31;
    if (v32) {
      operator delete(v32);
    }
    return v27;
  }

  uint64_t v18 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    uint64_t v19 = &__src[a5];
    uint64_t v21 = *(char **)(a1 + 8);
LABEL_17:
    uint64_t v22 = &v5[a5];
    __int16 v23 = &v21[-a5];
    unint64_t v24 = v21;
    if (&v21[-a5] < v10)
    {
      int64_t v25 = &v10[a5] - v21;
      unint64_t v24 = v21;
      do
      {
        char v26 = *v23++;
        *v24++ = v26;
        --v25;
      }

      while (v25);
    }

    *(void *)(a1 + 8) = v24;
    if (v21 != v22) {
      memmove(&v5[a5], v5, v21 - v22);
    }
    if (v19 != __src) {
      memmove(v5, __src, v19 - __src);
    }
    return v5;
  }

  uint64_t v19 = &__src[v18];
  int64_t v20 = a4 - &__src[v18];
  if (a4 != &__src[v18]) {
    memmove(*(void **)(a1 + 8), &__src[v18], a4 - &__src[v18]);
  }
  uint64_t v21 = &v10[v20];
  *(void *)(a1 + 8) = &v10[v20];
  if (v18 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

uint64_t sub_9544(uint64_t a1, uint64_t *a2, unsigned __int8 *a3, uint64_t *a4)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = *a2;
  uint64_t v8 = a2[1];
  *(void *)(a1 + 32) = v8;
  if (v8)
  {
    uint64_t v9 = (unint64_t *)(v8 + 8);
    do
      unint64_t v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }

  *(void *)(a1 + 40) = *(void *)a3;
  uint64_t v11 = *a4;
  *(_OWORD *)(a1 + 224) = 0u;
  *(void *)(a1 + 48) = v11;
  *(_BYTE *)(a1 + 56) = -1;
  *(void *)(a1 + 64) = 850045863LL;
  *(_OWORD *)(a1 + 136) = 0u;
  *(void *)(a1 + 192) = 0LL;
  *(void *)(a1 + 212) = 0LL;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(void *)(a1 + 152) = 0LL;
  *(void *)(a1 + 200) = 0LL;
  *(_BYTE *)(a1 + 208) = 0;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(void *)(a1 + 320) = 0LL;
  *(_DWORD *)(a1 + 328) = -1;
  *(_BYTE *)(a1 + 332) = 0;
  sub_9944((void *)(a1 + 224));
  sub_9944((void *)(a1 + 192));
  *(_DWORD *)(a1 + 320) = MIDICapabilityGetDiscoveryMUID();
  sub_99A0();
  uint64_t v12 = (os_log_s *)qword_2C170;
  if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_INFO))
  {
    if (a3[1]) {
      unsigned __int8 v13 = *a3 | 0x80;
    }
    else {
      unsigned __int8 v13 = *a3;
    }
    int v14 = a3[6];
    int v15 = *((unsigned __int16 *)a3 + 2);
    if (*((_BYTE *)a4 + 1)) {
      unsigned __int8 v16 = *(_BYTE *)a4 | 0x80;
    }
    else {
      unsigned __int8 v16 = *(_BYTE *)a4;
    }
    int v17 = *((unsigned __int8 *)a4 + 6);
    int v18 = *((unsigned __int16 *)a4 + 2);
    int v19 = *(_DWORD *)(a1 + 320);
    *(_DWORD *)buf = 136317186;
    *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 141;
    __int16 v28 = 1024;
    int v29 = v13;
    __int16 v30 = 1024;
    int v31 = v14;
    __int16 v32 = 1024;
    int v33 = v15;
    __int16 v34 = 1024;
    int v35 = v16;
    __int16 v36 = 1024;
    int v37 = v17;
    __int16 v38 = 1024;
    int v39 = v18;
    __int16 v40 = 1024;
    int v41 = v19;
    _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "%25s:%-5d [*] MIDIProtocolNegotiatior(inEP: 0x%x (pipeIndex %u, mps %u), outEP: 0x%x (pipeIndex %u, mps %u) - Nego tiating with MUID 0x%x",  buf,  0x3Cu);
  }

  for (int i = 0; i != 4; ++i)
  {
    unsigned int v42 = (uint64_t (**)())a1;
    sub_BE6C((uint64_t *)&v42, a2, (unsigned __int16 *)(a1 + 52), buf);
    *(_BYTE *)(*(void *)buf + 64LL) = *(_BYTE *)(a1 + 54);
    sub_99FC((char **)(a1 + 136), (__int128 *)buf);
    uint64_t v21 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      uint64_t v22 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
  }

  sub_9B3C((void *)(a1 + 192), (uint64_t *)(*(void *)(a1 + 136) + 16LL * *(unsigned int *)(a1 + 212)));
  unint64_t v24 = operator new(0xC0uLL);
  *(void *)buf = off_28900;
  *(void *)&buf[8] = a1;
  unsigned int v42 = off_28900;
  v43[0] = a1;
  sub_C860((uint64_t)v24, (uint64_t *)buf, (uint64_t *)&v42);
  ((void (*)(uint64_t *))v42[3])(v43);
  (*(void (**)(_BYTE *))(*(void *)buf + 24LL))(&buf[8]);
  uint64_t v25 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v24;
  if (v25)
  {
    (*(void (**)(uint64_t))(*(void *)v25 + 8LL))(v25);
    unint64_t v24 = *(_DWORD **)(a1 + 16);
  }

  v24[18] = 1;
  return a1;
}

void sub_9884( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  if (a2) {
    sub_3584(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_9944(void *a1)
{
  uint64_t v1 = (std::__shared_weak_count *)a1[1];
  *a1 = 0LL;
  a1[1] = 0LL;
  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      unint64_t v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }

void sub_99A0()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_2C178);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_2C178))
    {
      qword_2C170 = (uint64_t)os_log_create("com.apple.coremidi", "proton");
      __cxa_guard_release(&qword_2C178);
    }
  }

uint64_t sub_99FC(char **a1, __int128 *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  size_t v7 = *(char **)(result - 8);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v12 = (v7 - *a1) >> 4;
    unint64_t v13 = v12 + 1;
    uint64_t v14 = v5 - (void)*a1;
    if (v14 >> 3 > v13) {
      unint64_t v13 = v14 >> 3;
    }
    else {
      unint64_t v15 = v13;
    }
    uint64_t v31 = result;
    unsigned __int8 v16 = (char *)sub_BB38(result, v15);
    int v18 = &v16[16 * v12];
    __int128 v19 = *a2;
    *(_OWORD *)int v18 = *a2;
    if (*((void *)&v19 + 1))
    {
      int64_t v20 = (unint64_t *)(*((void *)&v19 + 1) + 8LL);
      do
        unint64_t v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }

    unint64_t v23 = *a1;
    uint64_t v22 = a1[1];
    if (v22 == *a1)
    {
      int64x2_t v26 = vdupq_n_s64((unint64_t)v22);
      unint64_t v24 = &v16[16 * v12];
    }

    else
    {
      unint64_t v24 = &v16[16 * v12];
      do
      {
        __int128 v25 = *((_OWORD *)v22 - 1);
        v22 -= 16;
        *((_OWORD *)v24 - 1) = v25;
        v24 -= 16;
        *(void *)uint64_t v22 = 0LL;
        *((void *)v22 + 1) = 0LL;
      }

      while (v22 != v23);
      int64x2_t v26 = *(int64x2_t *)a1;
    }

    uint64_t v11 = v18 + 16;
    *a1 = v24;
    a1[1] = v18 + 16;
    int64x2_t v29 = v26;
    __int16 v27 = a1[2];
    a1[2] = &v16[16 * v17];
    __int16 v30 = v27;
    uint64_t v28 = v26.i64[0];
    uint64_t result = sub_BB6C((uint64_t)&v28);
  }

  else
  {
    *(void *)size_t v7 = *(void *)a2;
    uint64_t v8 = *((void *)a2 + 1);
    *((void *)v7 + 1) = v8;
    if (v8)
    {
      uint64_t v9 = (unint64_t *)(v8 + 8);
      do
        unint64_t v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }

    uint64_t v11 = v7 + 16;
  }

  a1[1] = v11;
  return result;
}

void *sub_9B3C(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v3 = a2[1];
  if (v3)
  {
    unint64_t v5 = (unint64_t *)(v3 + 8);
    do
      unint64_t v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }

  size_t v7 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  return a1;
}

uint64_t sub_9BB8(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_2C170;
  if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)size_t v7 = 136315394;
    *(void *)&v7[4] = "MIDIProtocolNegotiator.cpp";
    __int16 v8 = 1024;
    int v9 = 193;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d [+] ~MIDIProtocolNegotiatior()", v7, 0x12u);
  }

  if (*(void *)(a1 + 128))
  {
    MIDITimerTaskDispose();
    *(void *)(a1 + 128) = 0LL;
  }

  *(_BYTE *)(a1 + 332) = 1;
  sub_99A0();
  uint64_t v3 = (os_log_s *)qword_2C170;
  if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)size_t v7 = 136315394;
    *(void *)&v7[4] = "MIDIProtocolNegotiator.cpp";
    __int16 v8 = 1024;
    int v9 = 196;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d [-] ~MIDIProtocolNegotiatior()", v7, 0x12u);
  }

  sub_624C(a1 + 224);
  sub_624C(a1 + 192);
  *(void *)size_t v7 = a1 + 136;
  sub_BBB8((void ***)v7);
  std::mutex::~mutex((std::mutex *)(a1 + 64));
  sub_624C(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = 0LL;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8LL))(v4);
  }
  unint64_t v5 = *(std::__shared_weak_count **)(a1 + 8);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  return a1;
}

void sub_9D4C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_3584(a1);
}

void sub_9D5C(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_2C170;
  if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v8 = "MIDIProtocolNegotiator.cpp";
    __int16 v9 = 1024;
    int v10 = 201;
    _os_log_impl( &dword_0,  v2,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [+] MIDIProtocolNegotiatior::negotiateProtocol()",  buf,  0x12u);
  }

  char v5 = 2;
  int v6 = 512;
  sub_85B8(*(void *)(a1 + 16), 127, *(_DWORD *)(a1 + 320), 0xFFFFFFFu, 0x70u, &v5, 5LL);
  sub_99A0();
  uint64_t v3 = (os_log_s *)qword_2C170;
  if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v8 = "MIDIProtocolNegotiator.cpp";
    __int16 v9 = 1024;
    int v10 = 209;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d [Negotiating] Send Discovery message", buf, 0x12u);
  }

  *(_DWORD *)(a1 + 328) = 1;
  else {
    sub_9F4C(a1);
  }
  sub_99A0();
  uint64_t v4 = (os_log_s *)qword_2C170;
  if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v8 = "MIDIProtocolNegotiator.cpp";
    __int16 v9 = 1024;
    int v10 = 220;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [-] MIDIProtocolNegotiatior::negotiateProtocol()",  buf,  0x12u);
  }

void sub_9F4C(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 332))
  {
    sub_99A0();
    uint64_t v2 = (os_log_s *)qword_2C170;
    if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_INFO))
    {
      int v3 = 136315394;
      uint64_t v4 = "MIDIProtocolNegotiator.cpp";
      __int16 v5 = 1024;
      int v6 = 460;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%25s:%-5d [timeout]", (uint8_t *)&v3, 0x12u);
    }

    if (*(void *)(a1 + 128))
    {
      MIDITimerTaskDispose();
      *(void *)(a1 + 128) = 0LL;
    }

    *(_BYTE *)(a1 + 332) = 1;
    sub_B51C(a1, 0);
  }

uint64_t sub_A030(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v3 = 3758096385LL;
  if (a2 <= 3)
  {
    uint64_t v6 = *(void *)(a1 + 8LL * a2 + 160);
    if (v6)
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 136) + 16LL * a2);
      int v8 = *(unsigned __int8 *)(a1 + 208);
      if (*(_BYTE *)(v7 + 44))
      {
        if (!*(_BYTE *)(a1 + 208))
        {
          uint64_t v3 = 3758097109LL;
          sub_99A0();
          unint64_t v23 = (os_log_s *)qword_2C170;
          if (!os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG)) {
            return v3;
          }
          *(_DWORD *)buf = 136315650;
          int64x2_t v29 = "MIDIProtocolNegotiator.cpp";
          __int16 v30 = 1024;
          int v31 = 229;
          __int16 v32 = 1024;
          LODWORD(v33) = a2;
          unint64_t v24 = "%25s:%-5d [!] I/O pending on buffer %u";
LABEL_30:
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEBUG, v24, buf, 0x18u);
          return v3;
        }

        int v8 = 1;
      }

      *(_BYTE *)(v7 + 44) = 1;
      if (v8 && !a3) {
        return 0LL;
      }
      *(_BYTE *)(a1 + 208) = 1;
      uint64_t v9 = *(void *)(a1 + 24);
      sub_99A0();
      int v10 = (os_log_s *)qword_2C170;
      if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = *(unsigned __int8 **)(v7 + 24);
        sub_92B4(__p, 3 * v6, 0);
        if (v27 >= 0) {
          uint64_t v12 = __p;
        }
        else {
          uint64_t v12 = (void **)__p[0];
        }
        uint64_t v13 = v6;
        do
        {
          unsigned int v14 = *v11++;
          *(_BYTE *)uint64_t v12 = a0123456789abcd_0[(unint64_t)v14 >> 4];
          *((_BYTE *)v12 + 1) = a0123456789abcd_0[v14 & 0xF];
          *((_BYTE *)v12 + 2) = 32;
          uint64_t v12 = (void **)((char *)v12 + 3);
          --v13;
        }

        while (v13);
        unint64_t v15 = __p;
        if (v27 < 0) {
          unint64_t v15 = (void **)__p[0];
        }
        *(_DWORD *)buf = 136315650;
        int64x2_t v29 = "MIDIProtocolNegotiator.cpp";
        __int16 v30 = 1024;
        int v31 = 21;
        __int16 v32 = 2080;
        int v33 = v15;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d [+] writeAsyncWithBuffer: %s", buf, 0x1Cu);
        if (v27 < 0) {
          operator delete(__p[0]);
        }
      }

      unsigned __int8 v16 = *(void ***)(v9 + 104);
      uint64_t v17 = (unsigned int *)(v7 + 8);
      do
        unsigned int v18 = __ldaxr(v17);
      while (__stlxr(v18 + 1, v17));
      int v19 = (*((uint64_t (**)(void **, void, void, uint64_t, void (*)(void *, int), uint64_t))*v16
             + 34))( v16,  *(unsigned __int8 *)(v7 + 64),  *(void *)(v7 + 24),  v6,  sub_B648,  a1);
      if (v19)
      {
        sub_99A0();
        int64_t v20 = (os_log_s *)qword_2C170;
        if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_ERROR))
        {
          int v21 = *(unsigned __int8 *)(v7 + 64);
          uint64_t v22 = *(void *)(v7 + 24);
          *(_DWORD *)buf = 136316674;
          int64x2_t v29 = "MIDIProtocolNegotiator.cpp";
          __int16 v30 = 1024;
          int v31 = 26;
          __int16 v32 = 2048;
          int v33 = v16;
          __int16 v34 = 1024;
          int v35 = v21;
          __int16 v36 = 2048;
          uint64_t v37 = v22;
          __int16 v38 = 2048;
          uint64_t v39 = v6;
          __int16 v40 = 1024;
          int v41 = v19;
          _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] writePipeAsync(%p, %u, %p, %lu, ...) = 0x%x",  buf,  0x3Cu);
        }

        uint64_t v3 = (*((uint64_t (**)(void **, void, void, uint64_t, void (*)(void *, int), uint64_t))*v16
              + 34))( v16,  *(unsigned __int8 *)(v7 + 64),  *(void *)(v7 + 24),  v6,  sub_B648,  a1);
      }

      else
      {
        uint64_t v3 = 0LL;
      }

      sub_99A0();
      unint64_t v23 = (os_log_s *)qword_2C170;
      if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        int64x2_t v29 = "MIDIProtocolNegotiator.cpp";
        __int16 v30 = 1024;
        int v31 = 31;
        __int16 v32 = 1024;
        LODWORD(v33) = v3;
        unint64_t v24 = "%25s:%-5d [-] writeAsyncWithBuffer() = 0x%x";
        goto LABEL_30;
      }
    }
  }

  return v3;
}

void sub_A3E4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (*(_BYTE *)(a1 + 332)) {
    return;
  }
  __int16 v5 = *(std::__shared_weak_count **)(a2 + 56);
  if (!v5)
  {
    uint64_t v7 = 0LL;
LABEL_16:
    sub_99A0();
    uint64_t v15 = qword_2C170;
    if (!os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 255;
    unsigned __int8 v16 = "%25s:%-5d [readCallback: owning USBMIDIDevice destroyed]";
    uint64_t v17 = (os_log_s *)v15;
    os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
    uint32_t v19 = 18;
LABEL_23:
    _os_log_impl(&dword_0, v17, v18, v16, buf, v19);
    goto LABEL_24;
  }

  uint64_t v7 = std::__shared_weak_count::lock(v5);
  if (!v7 || !*(void *)(a2 + 48)) {
    goto LABEL_16;
  }
  *(_BYTE *)(a2 + 44) = 0;
  if (a3 < 5)
  {
    int v11 = 0;
LABEL_21:
    sub_99A0();
    uint64_t v20 = qword_2C170;
    if (!os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_INFO)) {
      goto LABEL_24;
    }
    uint64_t v21 = *(void *)(a1 + 312);
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 269;
    __int16 v25 = 1024;
    int v26 = v11;
    __int16 v27 = 1024;
    int v28 = v21;
    unsigned __int8 v16 = "%25s:%-5d [Negotiating] Read %u bytes (%u total), reading more ...";
    uint64_t v17 = (os_log_s *)v20;
    os_log_type_t v18 = OS_LOG_TYPE_INFO;
    uint32_t v19 = 30;
    goto LABEL_23;
  }

  sub_99A0();
  int v8 = (os_log_s *)qword_2C170;
  if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 261;
    __int16 v25 = 1024;
    int v26 = a3;
    _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] MIDIProtocolNegotiatior::handleCIInput() - %u bytes received",  buf,  0x18u);
  }

  *(void *)buf = *(void *)(a2 + 24);
  *(void *)&buf[8] = a3 >> 2;
  uint64_t v9 = a1 + 248;
  uint64_t v10 = sub_A6BC((uint64_t *)buf, a1 + 248 + *(void *)(a1 + 312), a1 + 312);
  int v11 = v10;
  uint64_t v12 = (unsigned __int8 *)(*(void *)(a1 + 312) + v10);
  *(void *)(a1 + 312) = v12;
  if (!v10) {
    goto LABEL_21;
  }
  if (v12)
  {
    uint64_t v13 = v12;
    unsigned int v14 = (unsigned __int8 *)(a1 + 248);
    while (*v14 != 247)
    {
      ++v14;
      if (!--v13)
      {
        unsigned int v14 = &v12[v9];
        break;
      }
    }
  }

  else
  {
    unsigned int v14 = (unsigned __int8 *)(a1 + 248);
  }

  if (v12 == &v14[-v9]) {
    goto LABEL_21;
  }
  sub_AB5C(a1);
LABEL_24:
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v23 = __ldaxr(p_shared_owners);
    while (__stlxr(v23 - 1, p_shared_owners));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

void sub_A6A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_A6BC(uint64_t *a1, unint64_t a2, unint64_t a3)
{
  if (a2 >= a3) {
    return 0LL;
  }
  int v3 = a3;
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  sub_99A0();
  uint64_t v7 = (os_log_s *)qword_2C170;
  if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v43 = "MIDIProtocolNegotiator.cpp";
    __int16 v44 = 1024;
    int v45 = 45;
    __int16 v46 = 1024;
    int v47 = v6;
    __int16 v48 = 1024;
    unsigned int v49 = v3 - a2;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] appendSysExToBuffer() - wordCount %u, %u bytes available",  buf,  0x1Eu);
  }

  if (v6)
  {
    unint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    unint64_t v10 = v5 + 4 * v6;
    unint64_t v40 = v6;
    while (1)
    {
      int v11 = (unsigned int *)(*a1 + 4 * v8);
      unsigned int v12 = *v11;
      unsigned int v13 = *v11 >> 28;
      if (v13 == 1)
      {
        sub_99A0();
        uint64_t v19 = qword_2C170;
        if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG))
        {
          int v20 = *v11;
          *(_DWORD *)buf = 136315650;
          __int16 v43 = "MIDIProtocolNegotiator.cpp";
          __int16 v44 = 1024;
          int v45 = 54;
          __int16 v46 = 1024;
          int v47 = v20;
          uint64_t v21 = (os_log_s *)v19;
          os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
          unint64_t v23 = "%25s:%-5d      skipping msg: 0x%08x";
LABEL_19:
          _os_log_impl(&dword_0, v21, v22, v23, buf, 0x18u);
        }
      }

      else
      {
        if (v13 == 3)
        {
          uint64_t __src = 0LL;
          unsigned int v14 = (v12 >> 20) & 0xF;
          BOOL v15 = v14 == 0;
          BOOL v16 = v14 == 3;
          if (v14 == 3) {
            BOOL v15 = 1;
          }
          int v17 = HIWORD(v12) & 0xF;
          if (v14 < 2) {
            ++v17;
          }
          unsigned int v18 = v17 + v15;
          if ((v17 + v15) <= 8)
          {
            BOOL v26 = v14 == 3 || v14 == 0;
            LODWORD(v27) = v17 + v15;
            if (v26)
            {
              uint64_t v27 = (int)v18 - 1LL;
              *((_BYTE *)&__src + v27) = -9;
            }

            if (v14 > 1)
            {
              p_src = (char *)&__src;
            }

            else
            {
              LOBYTE(__src) = -16;
              LODWORD(v27) = v27 - 1;
              p_src = (char *)&__src + 1;
            }

            if ((int)v27 >= 1)
            {
              char v29 = 0;
              uint64_t v30 = 0LL;
              do
              {
                if (v30 <= 5)
                {
                  else {
                    char v32 = 8;
                  }
                  char v31 = v11[v30 > 1] >> (v32 + v29);
                }

                else
                {
                  char v31 = 0;
                }

                p_src[v30] = v31;
                v29 -= 8;
                ++v30;
              }

              while (v27 != v30);
            }
          }

          else
          {
            unsigned int v18 = 0;
          }

          sub_99A0();
          int v33 = (os_log_s *)qword_2C170;
          if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG))
          {
            int v34 = *v11;
            unsigned int v35 = v11[1];
            __int16 v36 = "";
            if (v14 == 3) {
              __int16 v36 = "[END]";
            }
            *(_DWORD *)buf = 136316418;
            __int16 v43 = "MIDIProtocolNegotiator.cpp";
            __int16 v44 = 1024;
            int v45 = 60;
            __int16 v46 = 1024;
            int v47 = v34;
            __int16 v48 = 1024;
            unsigned int v49 = v35;
            __int16 v50 = 1024;
            unsigned int v51 = v18;
            __int16 v52 = 2080;
            uint64_t v53 = v36;
            _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      sysex 0x%08x 0x%08x (%u bytes converted) %s",  buf,  0x2Eu);
          }

          memcpy((void *)(a2 + v9), &__src, v18);
          v9 += v18;
          unint64_t v6 = v40;
          goto LABEL_44;
        }

        sub_99A0();
        uint64_t v24 = qword_2C170;
        if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_ERROR))
        {
          int v25 = *v11;
          *(_DWORD *)buf = 136315650;
          __int16 v43 = "MIDIProtocolNegotiator.cpp";
          __int16 v44 = 1024;
          int v45 = 51;
          __int16 v46 = 1024;
          int v47 = v25;
          uint64_t v21 = (os_log_s *)v24;
          os_log_type_t v22 = OS_LOG_TYPE_ERROR;
          unint64_t v23 = "%25s:%-5d [!] appendSysExToBuffer() - sysex message cannot be interrupted with message with first word 0x%x";
          goto LABEL_19;
        }
      }

      BOOL v16 = 0;
LABEL_44:
      unint64_t v8 = v8 + byte_23208[(unint64_t)*v11 >> 28];
      if (v8 >= v6 || v16) {
        goto LABEL_51;
      }
    }
  }

  uint64_t v9 = 0LL;
LABEL_51:
  sub_99A0();
  __int16 v38 = (os_log_s *)qword_2C170;
  if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v43 = "MIDIProtocolNegotiator.cpp";
    __int16 v44 = 1024;
    int v45 = 66;
    __int16 v46 = 1024;
    int v47 = v9;
    _os_log_impl( &dword_0,  v38,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] appendSysExToBuffer() - %u total bytes copied",  buf,  0x18u);
  }

  return v9;
}

void sub_AB5C(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_2C170;
  if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 312);
    if (v3)
    {
      sub_92B4(__p, 3 * v3, 0);
      uint64_t v4 = (unsigned __int8 *)(a1 + 248);
      if (v55 >= 0) {
        uint64_t v5 = __p;
      }
      else {
        uint64_t v5 = (void **)__p[0];
      }
      do
      {
        unsigned int v6 = *v4++;
        *(_BYTE *)uint64_t v5 = a0123456789abcd_0[(unint64_t)v6 >> 4];
        *((_BYTE *)v5 + 1) = a0123456789abcd_0[v6 & 0xF];
        *((_BYTE *)v5 + 2) = 32;
        uint64_t v5 = (void **)((char *)v5 + 3);
        --v3;
      }

      while (v3);
    }

    else
    {
      sub_BC28(__p, "");
    }

    uint64_t v7 = __p;
    if (v55 < 0) {
      uint64_t v7 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
    __int16 v57 = 1024;
    int v58 = 278;
    __int16 v59 = 2080;
    *(void *)v60 = v7;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d [handleMessage] RCV: %s", buf, 0x1Cu);
    if (v55 < 0) {
      operator delete(__p[0]);
    }
  }

  int v8 = *(_DWORD *)(a1 + 328);
  if (v8 == 1)
  {
    if (sub_BCD8(a1 + 248, *(void *)(a1 + 312), 113, 31LL))
    {
      uint64_t v11 = *(void *)(a1 + 128);
      if (v11)
      {
        MIDITimerTaskDispose(v11, v9, v10);
        *(void *)(a1 + 128) = 0LL;
      }

      *(_DWORD *)(a1 + 324) = *(_BYTE *)(a1 + 254) & 0x7F | ((*(_BYTE *)(a1 + 255) & 0x7F) << 7) & 0x3FFF | ((*(_BYTE *)(a1 + 256) & 0x7F) << 14) & 0xF01FFFFF | ((*(_BYTE *)(a1 + 257) & 0x7F) << 21);
      sub_99A0();
      unsigned int v12 = (os_log_s *)qword_2C170;
      if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_INFO))
      {
        int v13 = *(_DWORD *)(a1 + 324);
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
        __int16 v57 = 1024;
        int v58 = 283;
        __int16 v59 = 1024;
        *(_DWORD *)v60 = v13;
        *(_WORD *)&v60[4] = 1024;
        *(_DWORD *)&v60[6] = v13;
        _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "%25s:%-5d [handleMessage: Discovery Reply] Discovered MUID 0x%x (%u)",  buf,  0x1Eu);
      }

      *(_WORD *)&buf[8] = 0;
      *(void *)buf = 0x20000000001LL;
      sub_85B8(*(void *)(a1 + 16), 127, *(_DWORD *)(a1 + 320), *(_DWORD *)(a1 + 324), 0x10u, buf, 10LL);
      *(_DWORD *)(a1 + 328) = 2;
      if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 24LL))(*(void *)(a1 + 16)))
      {
        sub_BA0C(a1, dbl_23030[*(_DWORD *)(a1 + 328) == 1]);
LABEL_86:
        bzero((void *)(a1 + 248), 0x40uLL);
        *(void *)(a1 + 312) = 0LL;
        return;
      }

      int v50 = -536870163;
      goto LABEL_83;
    }

    int v8 = *(_DWORD *)(a1 + 328);
  }

  if (v8 != 2)
  {
LABEL_43:
    if (v8 == 4 && sub_BCD8(a1 + 248, *(void *)(a1 + 312), 20, 64LL))
    {
      uint64_t v32 = 0LL;
      while (v32 == *(unsigned __int8 *)(a1 + v32 + 263))
      {
        if (++v32 == 48)
        {
          uint64_t v33 = *(void *)(a1 + 128);
          if (v33)
          {
            MIDITimerTaskDispose(v33, v30, v31);
            *(void *)(a1 + 128) = 0LL;
          }

          sub_99A0();
          int v34 = (os_log_s *)qword_2C170;
          if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
            __int16 v57 = 1024;
            int v58 = 343;
            _os_log_impl( &dword_0,  v34,  OS_LOG_TYPE_INFO,  "%25s:%-5d [Negotiating] Protocol Test: confirming new protocol established...",  buf,  0x12u);
          }

          sub_85B8(*(void *)(a1 + 16), 127, *(_DWORD *)(a1 + 320), *(_DWORD *)(a1 + 324), 0x15u, 0LL, 0LL);
          if (!(*(unsigned int (**)(void))(**(void **)(a1 + 16) + 24LL))(*(void *)(a1 + 16)))
          {
            int v50 = -536870163;
            goto LABEL_83;
          }

          sub_99A0();
          unsigned int v35 = (os_log_s *)qword_2C170;
          if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
            __int16 v57 = 1024;
            int v58 = 349;
            _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "%25s:%-5d [Negotiating] Done with negotiation.", buf, 0x12u);
          }

          sub_B51C(a1, 8);
          goto LABEL_86;
        }
      }
    }

    if (*(void *)(a1 + 312) >= 5uLL && *(_BYTE *)(a1 + 252) == 127)
    {
      sub_99A0();
      uint64_t v36 = qword_2C170;
      if (!os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_ERROR)) {
        goto LABEL_86;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
      __int16 v57 = 1024;
      int v58 = 353;
      uint64_t v37 = "%25s:%-5d [Negotiating] NAK received";
      __int16 v38 = (os_log_s *)v36;
      uint32_t v39 = 18;
    }

    else
    {
      sub_99A0();
      uint64_t v40 = qword_2C170;
      if (!os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_ERROR)) {
        goto LABEL_86;
      }
      int v41 = *(unsigned __int8 *)(a1 + 248);
      int v42 = *(_DWORD *)(a1 + 328);
      uint64_t v43 = *(void *)(a1 + 312);
      uint64_t v44 = v43 - 1;
      if (!v43) {
        uint64_t v44 = 0LL;
      }
      int v45 = *(unsigned __int8 *)(a1 + 248 + v44);
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
      __int16 v57 = 1024;
      int v58 = 355;
      __int16 v59 = 1024;
      *(_DWORD *)v60 = v42;
      *(_WORD *)&v60[4] = 1024;
      *(_DWORD *)&v60[6] = v43;
      __int16 v61 = 1024;
      int v62 = v41;
      __int16 v63 = 1024;
      int v64 = v45;
      uint64_t v37 = "%25s:%-5d [!]  status = %d, msgSize = %u (%02x ... %02x)";
      __int16 v38 = (os_log_s *)v40;
      uint32_t v39 = 42;
    }

LABEL_85:
    _os_log_impl(&dword_0, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);
    goto LABEL_86;
  }

  unint64_t v14 = *(void *)(a1 + 312);
  BOOL v15 = sub_BCD8(a1 + 248, v14, 17, v14);
  if (v14 <= 0x11 || !v15)
  {
    int v8 = *(_DWORD *)(a1 + 328);
    goto LABEL_43;
  }

  uint64_t v19 = *(void *)(a1 + 128);
  if (v19)
  {
    MIDITimerTaskDispose(v19, v16, v17);
    *(void *)(a1 + 128) = 0LL;
  }

  sub_99A0();
  int v20 = (os_log_s *)qword_2C170;
  if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
    __int16 v57 = 1024;
    int v58 = 296;
    _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [Negotiating: Protocol Discovery] Examining protocols ...",  buf,  0x12u);
  }

  unsigned int v21 = *(unsigned __int8 *)(a1 + 263);
  if (*(_BYTE *)(a1 + 263))
  {
    int v22 = 0;
    char v23 = 0;
    unsigned int v24 = 0;
    int v25 = (unsigned __int8 *)(a1 + 264);
    do
    {
      int v26 = *v25;
      int v27 = v25[2];
      sub_99A0();
      int v28 = (os_log_s *)qword_2C170;
      if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
        __int16 v57 = 1024;
        int v58 = 309;
        __int16 v59 = 1024;
        *(_DWORD *)v60 = v26;
        *(_WORD *)&v60[4] = 1024;
        *(_DWORD *)&v60[6] = v27;
        _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [Negotiating: Protocol Discovery] Found protocol: 0x%x, extension bitmap 0x%x",  buf,  0x1Eu);
      }

      int v29 = ((v27 & 3) == 0) | v22;
      if (v26 != 1) {
        int v29 = v22;
      }
      if (v26 == 2) {
        v23 |= (v27 & 1) == 0;
      }
      else {
        int v22 = v29;
      }
      v25 += 5;
      ++v24;
    }

    while (v24 < v21);
  }

  else
  {
    char v23 = 0;
    LOBYTE(v22) = 0;
  }

  sub_99A0();
  __int16 v46 = (os_log_s *)qword_2C170;
  if ((v22 & 1) != 0 || (v23 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_INFO))
    {
      int v47 = "MIDI-1UP";
      *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
      *(_DWORD *)buf = 136315650;
      if ((v23 & 1) != 0) {
        int v47 = "MIDI 2.0";
      }
      __int16 v57 = 1024;
      int v58 = 324;
      __int16 v59 = 2080;
      *(void *)v60 = v47;
      _os_log_impl( &dword_0,  v46,  OS_LOG_TYPE_INFO,  "%25s:%-5d [Negotiating: Protocol Discovery] Setting %s protocol...",  buf,  0x1Cu);
    }

    if ((v23 & 1) != 0) {
      char v48 = 2;
    }
    else {
      char v48 = 1;
    }
    LOBYTE(__p[0]) = v48;
    uint64_t v49 = *(void *)(a1 + 16);
    *(_DWORD *)((char *)__p + 1) = 0;
    sub_85B8(v49, 127, *(_DWORD *)(a1 + 320), *(_DWORD *)(a1 + 324), 0x12u, (char *)__p, 5LL);
    *(_DWORD *)(a1 + 328) = 3;
    int v50 = -536870163;
    if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 24LL))(*(void *)(a1 + 16)))
    {
      sub_99A0();
      unsigned int v51 = (os_log_s *)qword_2C170;
      if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
        __int16 v57 = 1024;
        int v58 = 332;
        _os_log_impl( &dword_0,  v51,  OS_LOG_TYPE_INFO,  "%25s:%-5d [Negotiating: Test Protocol] Sending protocol test data ...",  buf,  0x12u);
      }

      uint64_t v52 = *(void *)(a1 + 16);
      *(_DWORD *)(a1 + 328) = 4;
      sub_85B8(v52, 127, *(_DWORD *)(a1 + 320), *(_DWORD *)(a1 + 324), 0x13u, 0LL, 0LL);
      if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 24LL))(*(void *)(a1 + 16)))
      {
        sub_BA0C(a1, dbl_23030[*(_DWORD *)(a1 + 328) == 1]);
        int v50 = 0;
        *(_BYTE *)(a1 + 56) = v48;
      }
    }

    if (!v50) {
      goto LABEL_86;
    }
LABEL_83:
    sub_99A0();
    uint64_t v53 = qword_2C170;
    if (!os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_ERROR)) {
      goto LABEL_86;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
    __int16 v57 = 1024;
    int v58 = 360;
    __int16 v59 = 1024;
    *(_DWORD *)v60 = v50;
    uint64_t v37 = "%25s:%-5d [!] handleMessage failed with 0x%x";
    __int16 v38 = (os_log_s *)v53;
    uint32_t v39 = 24;
    goto LABEL_85;
  }

  if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
    __int16 v57 = 1024;
    int v58 = 317;
    _os_log_impl( &dword_0,  v46,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [Negotiation Failure] No usable protocols discovered",  buf,  0x12u);
  }

  sub_9F4C(a1);
}

void sub_B51C(uint64_t a1, int a2)
{
  uint64_t v4 = (os_log_s *)qword_2C170;
  if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = "success";
    uint64_t v9 = "MIDIProtocolNegotiator.cpp";
    int v8 = 136315650;
    if (!a2) {
      uint64_t v5 = "failure";
    }
    __int16 v10 = 1024;
    int v11 = 433;
    __int16 v12 = 2080;
    int v13 = v5;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_INFO,  "%25s:%-5d [*] MIDIProtocolNegotiator::finished(%s)",  (uint8_t *)&v8,  0x1Cu);
  }

  *(_BYTE *)(a1 + 332) = 1;
  *(_DWORD *)(a1 + 328) = a2;
  uint64_t v6 = *(void *)(a1 + 24);
  if (v6 && !*(_BYTE *)(v6 + 184))
  {
    else {
      char v7 = 0x2010201u >> (8 * (a2 - 5));
    }
    *(_BYTE *)(a1 + 56) = v7;
    sub_B8C0(a1);
  }

void sub_B648(void *a1, int a2)
{
  if (a2 == -536870165)
  {
    sub_99A0();
    uint64_t v2 = (os_log_s *)qword_2C170;
    if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = 367;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d [write aborted]", buf, 0x12u);
    }
  }

  else if (a1)
  {
    sub_CD7C(buf, a1);
    if (*(void *)buf && !*(_BYTE *)(*(void *)buf + 332LL))
    {
      uint64_t v3 = (std::mutex *)(*(void *)buf + 64LL);
      std::mutex::lock((std::mutex *)(*(void *)buf + 64LL));
      uint64_t v4 = *(void *)buf;
      uint64_t v5 = (void *)(*(void *)buf + 224LL);
      uint64_t v6 = *(void *)(*(void *)buf + 224LL);
      uint64_t v16 = (unsigned int *)v6;
      if (v6)
      {
        *(_BYTE *)(v6 + 44) = 0;
        int v7 = *(_DWORD *)(v4 + 216);
        *(_DWORD *)(v4 + 216) = v7 + 1;
        if (v7 == 3) {
          unsigned int v8 = 0;
        }
        else {
          unsigned int v8 = v7 + 1;
        }
        uint64_t v9 = (uint64_t *)(*(void *)(v4 + 136) + 16LL * v8);
        if (*(_BYTE *)(*v9 + 44))
        {
          *(_DWORD *)(v4 + 216) = v8;
          sub_9B3C(v5, v9);
        }

        else
        {
          sub_9944(v5);
        }

        if (*(void *)(*(void *)buf + 24LL))
        {
          if (*(void *)(*(void *)buf + 224LL)) {
            sub_A030(*(void *)buf, *(unsigned int *)(*(void *)buf + 216LL), 1LL);
          }
          else {
            *(_BYTE *)(*(void *)buf + 208LL) = 0;
          }
        }

        __int16 v10 = v16 + 2;
        do
        {
          unsigned int v11 = __ldaxr(v10);
          unsigned int v12 = v11 - 1;
        }

        while (__stlxr(v12, v10));
        if (!v12) {
          (*(void (**)(unsigned int *))(*(void *)v16 + 16LL))(v16);
        }
      }

      std::mutex::unlock(v3);
    }

    int v13 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      unint64_t v14 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }

void sub_B828( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int **a9, uint64_t a10, char a11)
{
}

unsigned int ***sub_B86C(unsigned int ***a1)
{
  uint64_t v2 = **a1;
  uint64_t v3 = v2 + 2;
  do
  {
    unsigned int v4 = __ldaxr(v3);
    unsigned int v5 = v4 - 1;
  }

  while (__stlxr(v5, v3));
  if (!v5) {
    (*(void (**)(unsigned int *))(*(void *)v2 + 16LL))(v2);
  }
  return a1;
}

void sub_B8C0(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_2C170;
  if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG))
  {
    int v3 = *(unsigned __int8 *)(a1 + 56);
    if (*(_BYTE *)(a1 + 41)) {
      unsigned __int8 v4 = *(_BYTE *)(a1 + 40) | 0x80;
    }
    else {
      unsigned __int8 v4 = *(_BYTE *)(a1 + 40);
    }
    if (*(_BYTE *)(a1 + 49)) {
      unsigned __int8 v5 = *(_BYTE *)(a1 + 48) | 0x80;
    }
    else {
      unsigned __int8 v5 = *(_BYTE *)(a1 + 48);
    }
    int v9 = 136316162;
    __int16 v10 = "MIDIProtocolNegotiator.cpp";
    __int16 v11 = 1024;
    int v12 = 424;
    __int16 v13 = 1024;
    int v14 = v3;
    __int16 v15 = 1024;
    int v16 = v4;
    __int16 v17 = 1024;
    int v18 = v5;
    _os_log_impl( &dword_0,  v2,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] MIDIProtocolNegotiator::completeNegotiation(selectedProtocol:%x) - inEP: 0x%x, outEP: 0x%x",  (uint8_t *)&v9,  0x24u);
  }

  uint64_t v6 = *(void *)(a1 + 24);
  if (v6 && !*(_BYTE *)(v6 + 184))
  {
    if (*(_BYTE *)(a1 + 41)) {
      unsigned __int8 v7 = *(_BYTE *)(a1 + 40) | 0x80;
    }
    else {
      unsigned __int8 v7 = *(_BYTE *)(a1 + 40);
    }
    if (*(_BYTE *)(a1 + 49)) {
      unsigned __int8 v8 = *(_BYTE *)(a1 + 48) | 0x80;
    }
    else {
      unsigned __int8 v8 = *(_BYTE *)(a1 + 48);
    }
    sub_E988(v6, v7, v8, *(unsigned __int8 *)(a1 + 56));
  }

void sub_BA0C(uint64_t a1, double a2)
{
  uint64_t v3 = *(void *)(a1 + 128);
  if (!v3)
  {
    uint64_t v3 = MIDITimerTaskCreate(sub_B8BC, a1);
    *(void *)(a1 + 128) = v3;
  }

  uint64_t v5 = mach_absolute_time();
  uint64_t v6 = __udivti3( 3 * (unint64_t)(a2 * 1000000.0),  ((unint64_t)(a2 * 1000000.0) * (unsigned __int128)3uLL) >> 64,  125LL,  0LL);
  MIDITimerTaskSetNextWakeTime(v3, v5 + v6);
  sub_99A0();
  unsigned __int8 v7 = (os_log_s *)qword_2C170;
  if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315650;
    int v9 = "MIDIProtocolNegotiator.cpp";
    __int16 v10 = 1024;
    int v11 = 473;
    __int16 v12 = 2048;
    double v13 = a2;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [Negotiating] Timeout %f ms from now",  (uint8_t *)&v8,  0x1Cu);
  }

void *sub_BB38(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_2E9C();
  }
  return operator new(16 * a2);
}

uint64_t sub_BB6C(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 16;
    sub_624C(i - 16);
  }

  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_BBB8(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        uint64_t v4 = sub_624C(v4 - 16);
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void *sub_BC28(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_92A0();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

BOOL sub_BCD8(uint64_t a1, unint64_t a2, int a3, uint64_t a4)
{
  if (a2 < 5) {
    return 0LL;
  }
  int v9 = *(unsigned __int8 *)(a1 + 4);
  if (a2 != a4)
  {
    sub_99A0();
    __int16 v10 = (os_log_s *)qword_2C170;
    if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315906;
      __int16 v15 = "MIDIProtocolNegotiator.cpp";
      __int16 v16 = 1024;
      int v17 = 75;
      __int16 v18 = 1024;
      int v19 = a2;
      __int16 v20 = 1024;
      int v21 = a4;
      _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] spanMatchesTypeAndLength() - msgSize %u does not match supplied length %u",  (uint8_t *)&v14,  0x1Eu);
    }
  }

  if (v9 != a3)
  {
    sub_99A0();
    int v11 = (os_log_s *)qword_2C170;
    if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG))
    {
      int v12 = *(unsigned __int8 *)(a1 + 4);
      int v14 = 136315906;
      __int16 v15 = "MIDIProtocolNegotiator.cpp";
      __int16 v16 = 1024;
      int v17 = 77;
      __int16 v18 = 1024;
      int v19 = v12;
      __int16 v20 = 1024;
      int v21 = a3;
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] spanMatchesTypeAndLength() - subID2 %u does not match supplied type %u",  (uint8_t *)&v14,  0x1Eu);
    }
  }

  return a2 == a4 && v9 == a3;
}

void *sub_BE6C@<X0>(uint64_t *a1@<X1>, uint64_t *a2@<X2>, unsigned __int16 *a3@<X3>, void *a4@<X8>)
{
  uint64_t v8 = operator new(0x60uLL);
  uint64_t result = sub_BEDC(v8, a1, a2, a3);
  *a4 = v8 + 3;
  a4[1] = v8;
  return result;
}

void sub_BEC8(_Unwind_Exception *a1)
{
}

void *sub_BEDC(void *a1, uint64_t *a2, uint64_t *a3, unsigned __int16 *a4)
{
  a1[2] = 0LL;
  *a1 = off_288B0;
  a1[1] = 0LL;
  sub_BF70((uint64_t)(a1 + 3), a2, a3, a4);
  return a1;
}

void sub_BF14(_Unwind_Exception *a1)
{
}

void sub_BF28(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_288B0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_BF3C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_288B0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_BF60(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

uint64_t sub_BF70(uint64_t a1, uint64_t *a2, uint64_t *a3, unsigned __int16 *a4)
{
  uint64_t v5 = *a2;
  uint64_t v6 = (std::__shared_weak_count *)a3[1];
  uint64_t v10 = *a3;
  int v11 = v6;
  if (v6)
  {
    p_shared_weak_owners = (unint64_t *)&v6->__shared_weak_owners_;
    do
      unint64_t v8 = __ldxr(p_shared_weak_owners);
    while (__stxr(v8 + 1, p_shared_weak_owners));
  }

  sub_BFF0(a1, v5, &v10, *a4);
  if (v11) {
    std::__shared_weak_count::__release_weak(v11);
  }
  return a1;
}

void sub_BFD8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_weak(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_BFF0(uint64_t a1, uint64_t a2, void *a3, size_t a4)
{
  uint64_t v8 = a1 + 16;
  sub_67B0((void *)(a1 + 16));
  *(_DWORD *)(a1 + 8) = 1;
  *(void *)a1 = off_288E8;
  uint64_t v9 = a3[1];
  *(void *)(a1 + 48) = *a3;
  *(void *)(a1 + 56) = v9;
  if (v9)
  {
    uint64_t v10 = (unint64_t *)(v9 + 16);
    do
      unint64_t v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }

  sub_67EC(v8, a2, a4);
  return a1;
}

void sub_C080(_Unwind_Exception *a1)
{
  size_t v4 = *(std::__shared_weak_count **)(v2 + 56);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  sub_67C0(v1);
  _Unwind_Resume(a1);
}

void *sub_C0A0(void *a1)
{
  *a1 = off_288E8;
  uint64_t v2 = (std::__shared_weak_count *)a1[7];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  sub_67C0((uint64_t)(a1 + 2));
  return a1;
}

void sub_C0E4(void *a1)
{
  *a1 = off_288E8;
  uint64_t v2 = (std::__shared_weak_count *)a1[7];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  sub_67C0((uint64_t)(a1 + 2));
  operator delete(a1);
}

uint64_t sub_C128(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
  }
  return result;
}

void sub_C13C(uint64_t *a1, unsigned __int8 **a2)
{
  uint64_t v3 = *a1;
  v65 = (std::mutex *)(*a1 + 64);
  std::mutex::lock(v65);
  sub_99A0();
  size_t v4 = (os_log_s *)qword_2C170;
  if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *a2;
    uint64_t v5 = a2[1];
    int64_t v7 = v5 - *a2;
    if (v5 == *a2)
    {
      sub_BC28(__p, "");
    }

    else
    {
      sub_92B4(__p, 3 * v7, 0);
      if (v70 >= 0) {
        uint64_t v8 = __p;
      }
      else {
        uint64_t v8 = (void **)__p[0];
      }
      int64_t v9 = v7;
      do
      {
        unsigned int v10 = *v6++;
        *(_BYTE *)uint64_t v8 = a0123456789abcd_0[(unint64_t)v10 >> 4];
        *((_BYTE *)v8 + 1) = a0123456789abcd_0[v10 & 0xF];
        *((_BYTE *)v8 + 2) = 32;
        uint64_t v8 = (void **)((char *)v8 + 3);
        --v9;
      }

      while (v9);
    }

    unint64_t v11 = __p;
    if (v70 < 0) {
      unint64_t v11 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136315906;
    v72 = "MIDIProtocolNegotiator.cpp";
    __int16 v73 = 1024;
    int v74 = 154;
    __int16 v75 = 1024;
    int v76 = v7;
    __int16 v77 = 2080;
    v78 = v11;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d [+] MIDICIMessageEmitter %u bytes: %s", buf, 0x22u);
    if (v70 < 0) {
      operator delete(__p[0]);
    }
  }

  if (!*(void *)(v3 + 24)) {
    goto LABEL_105;
  }
  int64_t v12 = a2[1] - *a2;
  if (*((_DWORD *)a2 + 2) == *(_DWORD *)a2) {
    goto LABEL_105;
  }
  unsigned int v13 = v12 - (**a2 == 240) - ((*a2)[*((_DWORD *)a2 + 2) - *(_DWORD *)a2 - 1] == 247);
  if (v13)
  {
    if (v13 % 6) {
      unsigned int v14 = v13 / 6 + 1;
    }
    else {
      unsigned int v14 = v13 / 6;
    }
    int v15 = 8 * v14;
  }

  else
  {
    int v15 = 8;
  }

  unsigned int v66 = v15;
  unsigned int v16 = 0;
  if (!(_DWORD)v12 || !v15)
  {
LABEL_96:
    if (v66 != v16)
    {
      sub_99A0();
      __int16 v57 = (os_log_s *)qword_2C170;
      if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v72 = "MIDIProtocolNegotiator.cpp";
        __int16 v73 = 1024;
        int v74 = 184;
        __int16 v75 = 1024;
        int v76 = v16;
        _os_log_impl( &dword_0,  v57,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] MIDICIMessageEmitter did not copy %u bytes",  buf,  0x18u);
      }
    }

    goto LABEL_105;
  }

  unsigned int v16 = 0;
  unsigned int v17 = 0;
  __int16 v18 = (uint64_t *)(v3 + 192);
  int v19 = (void *)(v3 + 224);
  __int16 v63 = a2;
  uint64_t v64 = v3;
  v68 = (uint64_t *)(v3 + 192);
  while (1)
  {
    unsigned int v67 = v16;
    uint64_t v20 = *v18;
    int v21 = *a2;
    uint64_t v22 = *(unsigned int *)(v20 + 40);
    if ((_DWORD)v22)
    {
      uint64_t v23 = 0LL;
      unsigned int v24 = 0LL;
      LODWORD(v25) = 0;
      int v26 = &v21[v17];
      uint64_t v27 = *(void *)(v20 + 24);
      unint64_t v28 = v27 + v22;
      while (1)
      {
        if ((_DWORD)v25)
        {
          int v29 = 2;
        }

        else
        {
          LODWORD(v25) = v26[v23] == 240;
          if (v26[v23] == 240) {
            int v29 = 1;
          }
          else {
            int v29 = 2;
          }
        }

        unsigned int v30 = (unsigned __int16)(v12 - v25);
        uint64_t v31 = (char *)&v26[v25];
        if (v30 >= 6) {
          uint64_t v32 = 6LL;
        }
        else {
          uint64_t v32 = (unsigned __int16)(v12 - v25);
        }
        uint64_t v33 = (char *)&v26[v25];
        if ((_DWORD)v32)
        {
          uint64_t v34 = v32;
          uint64_t v33 = (char *)&v26[v25];
          while (*v33 != 247)
          {
            ++v33;
            if (!--v34)
            {
              uint64_t v33 = &v31[v32];
              break;
            }
          }
        }

        uint64_t v35 = v33 - v31;
        BOOL v36 = v30 == 7;
        if (v30 == 7) {
          int v37 = v25 + 7;
        }
        else {
          int v37 = v25;
        }
        if (v36) {
          int v38 = 3;
        }
        else {
          int v38 = v29;
        }
        if (v35 == v32) {
          LODWORD(v25) = v37;
        }
        else {
          LODWORD(v25) = v25 + v32;
        }
        if (v35 == v32) {
          uint64_t v39 = v32;
        }
        else {
          uint64_t v39 = (v32 - 1);
        }
        if (v35 == v32) {
          int v40 = v38;
        }
        else {
          int v40 = 3;
        }
        unint64_t v41 = 6LL;
        if (v39 < 6) {
          unint64_t v41 = v39;
        }
        if (!v41) {
          break;
        }
        char v42 = *v31;
        if (v41 == 1)
        {
          char v43 = 0;
          char v44 = 0;
LABEL_61:
          char v45 = 0;
LABEL_62:
          char v46 = 0;
LABEL_63:
          char v47 = 0;
          goto LABEL_64;
        }

        char v45 = v31[1];
        if (v41 < 3)
        {
          char v43 = 0;
          char v44 = 0;
          goto LABEL_62;
        }

        char v44 = v31[2];
        if (v41 == 3)
        {
          char v43 = 0;
          goto LABEL_62;
        }

        char v46 = v31[3];
        if (v41 < 5)
        {
          char v43 = 0;
          goto LABEL_63;
        }

        char v43 = v31[4];
        if (v41 == 5) {
          goto LABEL_63;
        }
        char v47 = v31[5];
LABEL_64:
        if ((unint64_t)v24 + v27 + 8 <= v28)
        {
          *(void **)((char *)v24 + v27) = (void *)((v40 << 20) | (v41 << 16) | ((unint64_t)(v42 & 0x7F) << 8) | v45 & 0x7F | ((unint64_t)(((v44 & 0x7F) << 24) | ((v46 & 0x7F) << 16) | ((v43 & 0x7F) << 8) | v47 & 0x7Fu) << 32) | 0x30000000);
          if (v40 == 3) {
            int v48 = 0;
          }
          else {
            int v48 = v39;
          }
          unsigned __int8 v49 = atomic_load((unsigned __int8 *)&qword_2C188);
          if ((v49 & 1) == 0 && __cxa_guard_acquire(&qword_2C188))
          {
            qword_2C180 = (uint64_t)os_log_create("com.apple.coremidi", "umptrs");
            __cxa_guard_release(&qword_2C188);
          }

          ++v24;
          uint64_t v25 = (v48 + v25);
          int v50 = (os_log_s *)qword_2C180;
          if (os_log_type_enabled((os_log_t)qword_2C180, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136316162;
            v72 = "USBMIDIUMPTranslation.h";
            __int16 v73 = 1024;
            int v74 = 450;
            __int16 v75 = 1024;
            int v76 = v25;
            __int16 v77 = 2048;
            v78 = v24;
            __int16 v79 = 1024;
            int v80 = v12 - v25;
            _os_log_impl( &dword_0,  v50,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] MIDI1SysExToUMPSysEx() - @ index %u: %lu UMP bytes written so far, %u legacy MIDI bytes remain",  buf,  0x28u);
          }

          if (v40 != 3)
          {
            uint64_t v23 = v25;
          }
        }

        LODWORD(v12) = v12 - v25;
        a2 = v63;
        uint64_t v3 = v64;
        int v21 = *v63;
        goto LABEL_86;
      }

      char v43 = 0;
      char v44 = 0;
      char v42 = 0;
      goto LABEL_61;
    }

    LODWORD(v12) = 0;
    LODWORD(v24) = 0;
LABEL_86:
    uint64_t v51 = *(unsigned int *)(v3 + 212);
    *(void *)(v3 + 8 * v51 + 160) = v24;
    if (!(_DWORD)v24) {
      break;
    }
    uint64_t v52 = a2[1];
    int v53 = sub_A030(v3, v51, 0);
    if (v53)
    {
      sub_99A0();
      uint64_t v62 = qword_2C170;
      if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v72 = "MIDIProtocolNegotiator.cpp";
        __int16 v73 = 1024;
        int v74 = 174;
        __int16 v75 = 1024;
        int v76 = v53;
        __int16 v59 = "%25s:%-5d [!] copyEmitter: write failed with err 0x%x";
        v60 = (os_log_s *)v62;
        uint32_t v61 = 24;
LABEL_103:
        _os_log_impl(&dword_0, v60, OS_LOG_TYPE_ERROR, v59, buf, v61);
      }

      goto LABEL_104;
    }

    if (*v19)
    {
      int v54 = *(_DWORD *)(v3 + 212);
      char v55 = v68;
    }

    else
    {
      char v55 = v68;
      sub_9B3C(v19, v68);
      int v54 = *(_DWORD *)(v3 + 212);
      *(_DWORD *)(v3 + 216) = v54;
    }

    unsigned int v16 = (_DWORD)v24 + v67;
    if (v54 == 3) {
      unsigned int v56 = 0;
    }
    else {
      unsigned int v56 = v54 + 1;
    }
    *(_DWORD *)(v3 + 212) = v56;
    sub_9B3C(v55, (uint64_t *)(*(void *)(v3 + 136) + 16LL * v56));
    if (v16 < v66)
    {
      unsigned int v17 = (_DWORD)v52 - ((_DWORD)v21 + v12);
      __int16 v18 = v68;
      if ((_DWORD)v12) {
        continue;
      }
    }

    goto LABEL_96;
  }

  sub_99A0();
  uint64_t v58 = qword_2C170;
  if (os_log_type_enabled((os_log_t)qword_2C170, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v72 = "MIDIProtocolNegotiator.cpp";
    __int16 v73 = 1024;
    int v74 = 169;
    __int16 v59 = "%25s:%-5d [!] copyEmitter: no bytes copied";
    v60 = (os_log_s *)v58;
    uint32_t v61 = 18;
    goto LABEL_103;
  }

LABEL_104:
  sub_9F4C(v3);
LABEL_105:
  std::mutex::unlock(v65);
}

void sub_C828( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::mutex *a12)
{
}

void *sub_C844(void *result, void *a2)
{
  void *result = *a2;
  return result;
}

void *sub_C850(void *result, void *a2)
{
  void *result = *a2;
  return result;
}

uint64_t sub_C860(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = sub_CAD8((void *)a1, 0x200uLL);
  *uint64_t v6 = off_28938;
  *((_DWORD *)v6 + 18) = 0;
  uint64_t v7 = *a2;
  v6[10] = *a2;
  (*(void (**)(void *, uint64_t *))(v7 + 8))(v6 + 11, a2 + 1);
  uint64_t v8 = *a3;
  *(void *)(a1 + 120) = *a3;
  (*(void (**)(uint64_t, uint64_t *))(v8 + 8))(a1 + 128, a3 + 1);
  *(void *)(a1 + 165) = 0LL;
  *(void *)(a1 + 160) = 0LL;
  *(void *)(a1 + 176) = 0LL;
  *(_BYTE *)(a1 + 184) = 0;
  sub_859C(a1);
  return a1;
}

void sub_C8FC(_Unwind_Exception *a1)
{
}

void *sub_C948(void *a1)
{
  *a1 = off_28968;
  sub_CC24((uint64_t)a1);
  (*(void (**)(void *))(a1[4] + 24LL))(a1 + 5);
  uint64_t v2 = (void *)a1[1];
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }

  return a1;
}

void sub_C9A8(void *a1)
{
  uint64_t v1 = sub_CD1C(a1);
  operator delete(v1);
}

uint64_t sub_C9BC(void *a1, uint64_t a2)
{
  uint64_t v3 = a1 + 1;
  if (a1[2] == a1[1]) {
    return 0LL;
  }
  if (*(_BYTE *)(*(void *)a2 + 32LL))
  {
    (**(void (***)(uint64_t, void *))a2)(a2 + 8, v3);
  }

  else
  {
    uint64_t v6 = a1[4];
    if (*(_BYTE *)(v6 + 32)) {
      (*(void (**)(void *, void *))v6)(a1 + 5, v3);
    }
  }

  uint64_t v7 = a1[1];
  uint64_t result = (*((_DWORD *)a1 + 4) - v7);
  a1[2] = v7;
  return result;
}

uint64_t sub_CA38(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v1 = a1 + 8;
  if (v2 == v3) {
    return 0LL;
  }
  uint64_t v5 = v3 - v2;
  int v6 = *(_DWORD *)(a1 + 72);
  if (v6 == 2)
  {
    uint64_t v8 = *(void *)(a1 + 120);
    if (*(_BYTE *)(v8 + 32)) {
      (*(void (**)(uint64_t, uint64_t))v8)(a1 + 128, v1);
    }
  }

  else if (v6 == 1)
  {
    uint64_t v7 = *(void *)(a1 + 80);
    if (*(_BYTE *)(v7 + 32)) {
      (*(void (**)(uint64_t, uint64_t))v7)(a1 + 88, v1);
    }
  }

  if (*(_BYTE *)(a1 + 160))
  {
    *(_BYTE *)(a1 + 160) = 0;
  }

  else
  {
    *(void *)(a1 + 16) = *(void *)(a1 + 8);
    *(void *)(a1 + 176) = 0LL;
    *(_BYTE *)(a1 + 184) = 0;
  }

  return v5;
}

void *sub_CAD8(void *a1, size_t __sz)
{
  *a1 = off_28968;
  a1[1] = 0LL;
  a1[2] = 0LL;
  a1[3] = 0LL;
  a1[4] = &off_28988;
  sub_CB64(a1 + 1, __sz);
  return a1;
}

void sub_CB34(_Unwind_Exception *a1)
{
  size_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 16) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(a1);
}

void sub_CB64(unint64_t *a1, size_t __sz)
{
  unint64_t v2 = *a1;
  if (a1[2] - *a1 < __sz)
  {
    if ((__sz & 0x8000000000000000LL) != 0) {
      sub_2DE0();
    }
    uint64_t v5 = (char *)a1[1];
    int v6 = operator new(__sz);
    uint64_t v7 = &v5[(void)v6 - v2];
    uint64_t v8 = v7;
    if (v5 != (char *)v2)
    {
      int64_t v9 = &v5[~v2];
      do
      {
        char v10 = *--v5;
        (v9--)[(void)v6] = v10;
      }

      while (v5 != (char *)v2);
      uint64_t v8 = v6;
    }

    *a1 = (unint64_t)v8;
    a1[1] = (unint64_t)v7;
    a1[2] = (unint64_t)&v6[__sz];
    if (v2) {
      operator delete((void *)v2);
    }
  }

void sub_CC10(void *a1)
{
  uint64_t v1 = sub_C948(a1);
  operator delete(v1);
}

uint64_t sub_CC24(uint64_t a1)
{
  uint64_t v3 = &off_28988;
  uint64_t v1 = (*(uint64_t (**)(uint64_t, void (***)()))(*(void *)a1 + 16LL))(a1, &v3);
  ((void (*)(uint64_t *))v3[3])(&v4);
  return v1;
}

void sub_CCA8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_3584(exception_object);
}

void sub_CCDC()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_285F8;
}

void *sub_CD1C(void *a1)
{
  *a1 = off_28938;
  sub_CA38((uint64_t)a1);
  (*(void (**)(void *))(a1[15] + 24LL))(a1 + 16);
  (*(void (**)(void *))(a1[10] + 24LL))(a1 + 11);
  return sub_C948(a1);
}

void *sub_CD7C(void *a1, void *a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a2[1];
  *a1 = *a2;
  if (!v3)
  {
    a1[1] = 0LL;
LABEL_5:
    sub_CDBC();
  }

  uint64_t v4 = std::__shared_weak_count::lock(v3);
  a1[1] = v4;
  if (!v4) {
    goto LABEL_5;
  }
  return a1;
}

void sub_CDBC()
{
  exception = __cxa_allocate_exception(8uLL);
}

uint64_t sub_CDF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(void *)(v10 + 64) = 0LL;
  *(void *)(v10 + 72) = 0LL;
  *(void *)uint64_t v10 = off_289D8;
  *(void *)(v10 + 80) = a2;
  *(void *)(v10 + 88) = a3;
  *(void *)(v10 + 96) = a4;
  *(_OWORD *)(v10 + 104) = 0u;
  *(_OWORD *)(v10 + 120) = 0u;
  *(_OWORD *)(v10 + 136) = 0u;
  *(_OWORD *)(v10 + 152) = 0u;
  *(_OWORD *)(v10 + 168) = 0u;
  *(_DWORD *)(v10 + 183) = 0;
  *(_WORD *)(v10 + 187) = 1;
  *(_BYTE *)(v10 + 189) = 0;
  *(void *)(v10 + 200) = 0LL;
  *(void *)(v10 + 208) = 0LL;
  *(void *)(v10 + 192) = 0LL;
  *(_OWORD *)(v10 + 2(*(void (**)(uint64_t))(*(void *)(v1 + 32) + 24LL))(v1 + 40) = 0u;
  unint64_t v11 = (void *)(v10 + 240);
  *(_DWORD *)(v10 + 216) = 1;
  *(_OWORD *)(v10 + 224) = 0u;
  int64_t v12 = (void *)(v10 + 224);
  unsigned int v13 = (void *)(v10 + 256);
  *(_OWORD *)(v10 + 256) = 0u;
  *(_OWORD *)(v10 + 272) = 0u;
  *(_OWORD *)(v10 + 288) = 0u;
  *(_OWORD *)(v10 + 304) = 0u;
  *(_OWORD *)(v10 + 320) = 0u;
  *(void *)(v10 + 336) = 0LL;
  sub_3C20(v10 + 344, (uint64_t)"USBMIDIDevice.mWriteQueueMutex");
  *(void *)(a1 + 432) = a1 + 432;
  *(void *)(a1 + 4(*(void (**)(uint64_t))(*(void *)(v1 + 32) + 24LL))(v1 + 40) = a1 + 432;
  *(_OWORD *)(a1 + 448) = 0u;
  *(_OWORD *)(a1 + 464) = 0u;
  *(_OWORD *)(a1 + 478) = 0u;
  v60[0] = &off_28BB8;
  uint32_t v61 = v60;
  sub_D510(@"usbioresults", @"com.apple.coremidi", (uint64_t)sub_2FA0, (uint64_t)v60);
  unsigned int v14 = v61;
  if (v61 == v60)
  {
    uint64_t v15 = 4LL;
    unsigned int v14 = v60;
  }

  else
  {
    if (!v61) {
      goto LABEL_6;
    }
    uint64_t v15 = 5LL;
  }

  (*(void (**)(void *))(*v14 + 8 * v15))(v14);
LABEL_6:
  v58[0] = &off_28C00;
  v58[1] = a1;
  __int16 v59 = v58;
  sub_D6B4(@"usbmidi2", @"com.apple.coremidi", (uint64_t)sub_3098, (uint64_t)v58);
  unsigned int v16 = v59;
  if (v59 == v58)
  {
    uint64_t v17 = 4LL;
    unsigned int v16 = v58;
  }

  else
  {
    if (!v59) {
      goto LABEL_11;
    }
    uint64_t v17 = 5LL;
  }

  (*(void (**)(void *))(*v16 + 8 * v17))(v16);
LABEL_11:
  v56[0] = &off_28C48;
  v56[1] = a1;
  __int16 v57 = v56;
  sub_D6B4(@"umpoutput", @"com.apple.coremidi", (uint64_t)sub_3098, (uint64_t)v56);
  __int16 v18 = v57;
  if (v57 == v56)
  {
    uint64_t v19 = 4LL;
    __int16 v18 = v56;
  }

  else
  {
    if (!v57) {
      goto LABEL_16;
    }
    uint64_t v19 = 5LL;
  }

  (*(void (**)(void *))(*v18 + 8 * v19))(v18);
LABEL_16:
  v54[0] = &off_28C90;
  v54[1] = a1;
  char v55 = v54;
  sub_D6B4(@"umpinput", @"com.apple.coremidi", (uint64_t)sub_3098, (uint64_t)v54);
  uint64_t v20 = v55;
  if (v55 == v54)
  {
    uint64_t v21 = 4LL;
    uint64_t v20 = v54;
  }

  else
  {
    if (!v55) {
      goto LABEL_21;
    }
    uint64_t v21 = 5LL;
  }

  (*(void (**)(void *))(*v20 + 8 * v21))(v20);
LABEL_21:
  sub_D858();
  uint64_t v22 = (os_log_s *)qword_2C190;
  if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
  {
    uint64_t v23 = "(MIDI 2.0 enabled)";
    int v24 = *(unsigned __int8 *)(a1 + 490);
    int v25 = *(unsigned __int8 *)(a1 + 489);
    BOOL v26 = *(_BYTE *)(a1 + 187) == 0;
    *(_DWORD *)buf = 136316674;
    if (v26) {
      uint64_t v23 = "(Legacy MIDI 1.0 re-enabled by defaults)";
    }
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    uint64_t v27 = "UMP for Legacy Input";
    int v43 = 119;
    __int16 v44 = 2048;
    __int16 v42 = 1024;
    if (!v24) {
      uint64_t v27 = "Legacy Input Passthrough";
    }
    uint64_t v45 = a1;
    __int16 v46 = 1024;
    unint64_t v28 = "Legacy Output Passthrough";
    int v47 = a5;
    __int16 v48 = 2080;
    if (v25) {
      unint64_t v28 = "UMP for Legacy Output";
    }
    unsigned __int8 v49 = v23;
    __int16 v50 = 2080;
    uint64_t v51 = v27;
    __int16 v52 = 2080;
    int v53 = v28;
    _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_INFO,  "%25s:%-5d [*] USBMIDIDevice(%p)::USBMIDIDevice() with MIDIDeviceRef %u %s (%s / %s)",  buf,  0x40u);
  }

  uint64_t v39 = off_28CC8;
  v40[0] = a1;
  int v29 = operator new(0x340uLL);
  *int v29 = off_28730;
  v29[1] = off_28CC8;
  v29[2] = a1;
  bzero(v29 + 8, 0x300uLL);
  *(void *)buf = v29;
  sub_4C8C(v12, (uint64_t *)buf);
  uint64_t v30 = *(void *)buf;
  *(void *)buf = 0LL;
  if (v30) {
    (*(void (**)(uint64_t))(*(void *)v30 + 8LL))(v30);
  }
  ((void (*)(uint64_t *))v39[3])(v40);
  int v37 = off_28CF0;
  v38[0] = a1;
  uint64_t v31 = operator new(0x340uLL);
  *uint64_t v31 = off_28A68;
  v31[1] = off_28CF0;
  v31[2] = a1;
  bzero(v31 + 8, 0x300uLL);
  *(void *)buf = v31;
  sub_4C8C(v11, (uint64_t *)buf);
  uint64_t v32 = *(void *)buf;
  *(void *)buf = 0LL;
  if (v32) {
    (*(void (**)(uint64_t))(*(void *)v32 + 8LL))(v32);
  }
  ((void (*)(uint64_t *))v37[3])(v38);
  v36[0] = a1;
  uint64_t v33 = operator new(0x868uLL);
  *uint64_t v33 = off_28A98;
  v33[1] = off_28CF0;
  v33[2] = a1;
  bzero(v33 + 8, 0x821uLL);
  *(void *)buf = v33;
  sub_4C8C(v13, (uint64_t *)buf);
  uint64_t v34 = *(void *)buf;
  *(void *)buf = 0LL;
  if (v34) {
    (*(void (**)(uint64_t))(*(void *)v34 + 8LL))(v34);
  }
  ((void (*)(uint64_t *))nullsub_17)(v36);
  if (a4) {
    *(_BYTE *)(a4 + 24) = 0;
  }
  return a1;
}

void sub_D2F4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31)
{
  if (a2) {
    sub_3584(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_D508()
{
}

void *sub_D510(const void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_2F2C();
  uint64_t v14 = a3;
  int64_t v9 = v15;
  sub_37E0((uint64_t)v15, a4);
  __int16 v18 = 0LL;
  uint64_t v10 = operator new(0x30uLL);
  *uint64_t v10 = &off_28B28;
  v10[1] = v14;
  sub_1496C((uint64_t)(v10 + 2), (uint64_t)v15);
  __int16 v18 = v10;
  sub_342C((uint64_t)v8, a1, a2, (uint64_t)v17);
  uint64_t result = v18;
  if (v18 == v17)
  {
    uint64_t v12 = 4LL;
    uint64_t result = v17;
  }

  else
  {
    if (!v18) {
      goto LABEL_6;
    }
    uint64_t v12 = 5LL;
  }

  uint64_t result = (void *)(*(uint64_t (**)(void))(*result + 8 * v12))();
LABEL_6:
  if (v16 == v15)
  {
    uint64_t v13 = 4LL;
  }

  else
  {
    if (!v16) {
      return result;
    }
    uint64_t v13 = 5LL;
    int64_t v9 = v16;
  }

  return (void *)(*(uint64_t (**)(void *))(*v9 + 8 * v13))(v9);
}

void sub_D63C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  uint64_t v20 = a17;
  if (a17 == v18)
  {
    uint64_t v21 = 4LL;
    uint64_t v20 = &a14;
  }

  else
  {
    if (!a17) {
      goto LABEL_6;
    }
    uint64_t v21 = 5LL;
  }

  (*(void (**)(void))(*(void *)v20 + 8 * v21))();
LABEL_6:
  if (a13 == v17)
  {
    uint64_t v22 = 4LL;
  }

  else
  {
    if (!a13) {
      goto LABEL_11;
    }
    uint64_t v22 = 5LL;
    uint64_t v17 = a13;
  }

  (*(void (**)(void *))(*v17 + 8 * v22))(v17);
LABEL_11:
  _Unwind_Resume(exception_object);
}

void *sub_D6B4(const void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_2F2C();
  uint64_t v14 = a3;
  int64_t v9 = v15;
  sub_37E0((uint64_t)v15, a4);
  __int16 v18 = 0LL;
  uint64_t v10 = operator new(0x30uLL);
  *uint64_t v10 = &off_28B70;
  v10[1] = v14;
  sub_14BFC((uint64_t)(v10 + 2), (uint64_t)v15);
  __int16 v18 = v10;
  sub_342C((uint64_t)v8, a1, a2, (uint64_t)v17);
  uint64_t result = v18;
  if (v18 == v17)
  {
    uint64_t v12 = 4LL;
    uint64_t result = v17;
  }

  else
  {
    if (!v18) {
      goto LABEL_6;
    }
    uint64_t v12 = 5LL;
  }

  uint64_t result = (void *)(*(uint64_t (**)(void))(*result + 8 * v12))();
LABEL_6:
  if (v16 == v15)
  {
    uint64_t v13 = 4LL;
  }

  else
  {
    if (!v16) {
      return result;
    }
    uint64_t v13 = 5LL;
    int64_t v9 = v16;
  }

  return (void *)(*(uint64_t (**)(void *))(*v9 + 8 * v13))(v9);
}

void sub_D7E0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  uint64_t v20 = a17;
  if (a17 == v18)
  {
    uint64_t v21 = 4LL;
    uint64_t v20 = &a14;
  }

  else
  {
    if (!a17) {
      goto LABEL_6;
    }
    uint64_t v21 = 5LL;
  }

  (*(void (**)(void))(*(void *)v20 + 8 * v21))();
LABEL_6:
  if (a13 == v17)
  {
    uint64_t v22 = 4LL;
  }

  else
  {
    if (!a13) {
      goto LABEL_11;
    }
    uint64_t v22 = 5LL;
    uint64_t v17 = a13;
  }

  (*(void (**)(void *))(*v17 + 8 * v22))(v17);
LABEL_11:
  _Unwind_Resume(exception_object);
}

void sub_D858()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_2C198);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_2C198))
    {
      qword_2C190 = (uint64_t)os_log_create("com.apple.coremidi", "usbmio");
      __cxa_guard_release(&qword_2C198);
    }
  }

uint64_t sub_D8B8(void *a1)
{
  unint64_t v2 = (os_log_s *)qword_2C190;
  if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 136;
    *(_WORD *)&_BYTE buf[18] = 2048;
    *(void *)&buf[20] = a1;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%25s:%-5d [+] USBMIDIDevice(%p)::Initialize()", buf, 0x1Cu);
  }

  uint64_t v3 = (*(uint64_t (**)(void, void *))(*(void *)a1[10] + 144LL))(a1[10], a1);
  a1[12] = v3;
  if (!v3 || (sub_7DDC(v3) & 1) == 0)
  {
    sub_D858();
    uint64_t v80 = qword_2C190;
    if (!os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    uint64_t v81 = a1[12];
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    *(_DWORD *)buf = 136315906;
    *(_WORD *)&_BYTE buf[12] = 1024;
    if (v81) {
      v82 = "mUSBInterface->Open() failed";
    }
    else {
      v82 = "mUSBInterface = NULL";
    }
    *(_DWORD *)&buf[14] = 139;
    *(_WORD *)&_BYTE buf[18] = 2048;
    *(void *)&buf[20] = a1;
    *(_WORD *)&buf[28] = 2080;
    *(void *)&buf[30] = v82;
    v83 = "%25s:%-5d [-] USBMIDIDevice(%p)::Initialize() - Failed: %s";
    v84 = (os_log_s *)v80;
    uint32_t v85 = 38;
LABEL_104:
    _os_log_impl(&dword_0, v84, OS_LOG_TYPE_ERROR, v83, buf, v85);
    return 0LL;
  }

  uint64_t v4 = sub_7A20(a1[12]);
  a1[13] = v4;
  if (!v4)
  {
    sub_D858();
    uint64_t v88 = qword_2C190;
    if (!os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 144;
    *(_WORD *)&_BYTE buf[18] = 2048;
    *(void *)&buf[20] = a1;
    v83 = "%25s:%-5d [-] USBMIDIDevice(%p)::Initialize() - Failed: GetPluginInterface() failed";
    goto LABEL_109;
  }

  *(_WORD *)((char *)a1 + 185) = 0;
  int v5 = sub_E90C((uint64_t)a1);
  *((_BYTE *)a1 + 189) = v5;
  if (v5)
  {
    sub_D858();
    int v6 = (os_log_s *)qword_2C190;
    if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = 152;
      _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_INFO,  "%25s:%-5d      phantom entity detected and will be excluded from portmap list",  buf,  0x12u);
    }
  }

  (*(void (**)(void *, void))(*a1 + 120LL))(a1, *((unsigned __int8 *)a1 + 491));
  (*(void (**)(void *))(*a1 + 56LL))(a1);
  if (((*(uint64_t (**)(void *))(*a1 + 112LL))(a1) & 1) == 0
    && !(*(unsigned int (**)(void *))(*a1 + 104LL))(a1))
  {
    sub_D858();
    uint64_t v88 = qword_2C190;
    if (!os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 240;
    *(_WORD *)&_BYTE buf[18] = 2048;
    *(void *)&buf[20] = a1;
    v83 = "%25s:%-5d [-] USBMIDIDevice(%p)::Initialize() encountered an error and is exiting prematurely.";
LABEL_109:
    v84 = (os_log_s *)v88;
    uint32_t v85 = 28;
    goto LABEL_104;
  }

  if (*(_DWORD *)(a1[10] + 28LL) == 3)
  {
    sub_D858();
    uint64_t v7 = (os_log_s *)qword_2C190;
    if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = 159;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%25s:%-5d      Using USB MIDI Driver v3.", buf, 0x12u);
    }
  }

  (*(void (**)(void *))(*a1 + 32LL))(a1);
  uint64_t v8 = a1[17];
  uint64_t v131 = a1[18];
  if (v8 != v131)
  {
    int64_t v9 = (int64x2_t *)(a1 + 34);
    do
    {
      uint64_t v132 = v8;
      uint64_t v10 = (unsigned __int16 *)(v8 + 4);
      char v11 = 1;
      do
      {
        char v12 = v11;
        sub_CD7C(buf, a1 + 8);
        uint64_t v13 = *(std::__shared_weak_count **)&buf[8];
        *(void *)v134 = *(void *)buf;
        *(void *)&v134[8] = *(void *)&buf[8];
        if (*(void *)&buf[8])
        {
          uint64_t v14 = (unint64_t *)(*(void *)&buf[8] + 16LL);
          do
            unint64_t v15 = __ldxr(v14);
          while (__stxr(v15 + 1, v14));
          p_shared_owners = (unint64_t *)&v13->__shared_owners_;
          do
            unint64_t v17 = __ldaxr(p_shared_owners);
          while (__stlxr(v17 - 1, p_shared_owners));
          if (!v17)
          {
            ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
            std::__shared_weak_count::__release_weak(v13);
          }
        }

        *(void *)buf = a1;
        sub_14F7C((uint64_t *)buf, (uint64_t *)v134, v10, &v133);
        uint64_t v19 = (_OWORD *)a1[35];
        unint64_t v18 = a1[36];
        if ((unint64_t)v19 >= v18)
        {
          uint64_t v20 = ((uint64_t)v19 - v9->i64[0]) >> 4;
          unint64_t v21 = v20 + 1;
          uint64_t v22 = v18 - v9->i64[0];
          if (v22 >> 3 > v21) {
            unint64_t v21 = v22 >> 3;
          }
          else {
            unint64_t v23 = v21;
          }
          *(void *)&buf[32] = a1 + 36;
          int v24 = (char *)sub_BB38((uint64_t)(a1 + 36), v23);
          BOOL v26 = &v24[16 * v20];
          *(_OWORD *)BOOL v26 = v133;
          __int128 v133 = 0uLL;
          unint64_t v28 = (void *)a1[34];
          uint64_t v27 = (void *)a1[35];
          if (v27 == v28)
          {
            int64x2_t v31 = vdupq_n_s64((unint64_t)v27);
            int v29 = &v24[16 * v20];
          }

          else
          {
            int v29 = &v24[16 * v20];
            do
            {
              __int128 v30 = *((_OWORD *)v27 - 1);
              v27 -= 2;
              *((_OWORD *)v29 - 1) = v30;
              v29 -= 16;
              void *v27 = 0LL;
              v27[1] = 0LL;
            }

            while (v27 != v28);
            int64x2_t v31 = *v9;
          }

          uint64_t v32 = v26 + 16;
          a1[34] = v29;
          a1[35] = v26 + 16;
          *(int64x2_t *)&buf[8] = v31;
          uint64_t v33 = a1[36];
          a1[36] = &v24[16 * v25];
          *(void *)&buf[24] = v33;
          *(void *)buf = v31.i64[0];
          sub_BB6C((uint64_t)buf);
          uint64_t v34 = (std::__shared_weak_count *)*((void *)&v133 + 1);
          a1[35] = v32;
          if (v34)
          {
            uint64_t v35 = (unint64_t *)&v34->__shared_owners_;
            do
              unint64_t v36 = __ldaxr(v35);
            while (__stlxr(v36 - 1, v35));
            if (!v36)
            {
              ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
              std::__shared_weak_count::__release_weak(v34);
            }
          }
        }

        else
        {
          _OWORD *v19 = v133;
          a1[35] = v19 + 1;
        }

        if (*(void *)&v134[8]) {
          std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v134[8]);
        }
        char v11 = 0;
      }

      while ((v12 & 1) != 0);
      uint64_t v8 = v132 + 8;
    }

    while (v132 + 8 != v131);
  }

  uint64_t v37 = a1[20];
  uint64_t v38 = a1[21];
  if (v37 != v38)
  {
    uint64_t v39 = (int64x2_t *)(a1 + 37);
    do
    {
      sub_CD7C(buf, a1 + 8);
      int v40 = *(std::__shared_weak_count **)&buf[8];
      *(void *)v134 = *(void *)buf;
      *(void *)&v134[8] = *(void *)&buf[8];
      if (*(void *)&buf[8])
      {
        unint64_t v41 = (unint64_t *)(*(void *)&buf[8] + 16LL);
        do
          unint64_t v42 = __ldxr(v41);
        while (__stxr(v42 + 1, v41));
        int v43 = (unint64_t *)&v40->__shared_owners_;
        do
          unint64_t v44 = __ldaxr(v43);
        while (__stlxr(v44 - 1, v43));
        if (!v44)
        {
          ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
          std::__shared_weak_count::__release_weak(v40);
        }
      }

      *(void *)buf = a1;
      sub_14F7C((uint64_t *)buf, (uint64_t *)v134, (unsigned __int16 *)(v37 + 4), &v133);
      uint64_t v45 = v133;
      *(_BYTE *)(v133 + 64) = *(_BYTE *)(v37 + 6);
      __int16 v46 = (void *)a1[38];
      unint64_t v47 = a1[39];
      if ((unint64_t)v46 >= v47)
      {
        uint64_t v49 = ((uint64_t)v46 - v39->i64[0]) >> 4;
        unint64_t v50 = v49 + 1;
        uint64_t v51 = v47 - v39->i64[0];
        if (v51 >> 3 > v50) {
          unint64_t v50 = v51 >> 3;
        }
        else {
          unint64_t v52 = v50;
        }
        *(void *)&buf[32] = a1 + 39;
        int v53 = (char *)sub_BB38((uint64_t)(a1 + 39), v52);
        char v55 = &v53[16 * v49];
        *(_OWORD *)char v55 = v133;
        __int128 v133 = 0uLL;
        __int16 v57 = (void *)a1[37];
        unsigned int v56 = (void *)a1[38];
        if (v56 == v57)
        {
          int64x2_t v60 = vdupq_n_s64((unint64_t)v56);
          uint64_t v58 = &v53[16 * v49];
        }

        else
        {
          uint64_t v58 = &v53[16 * v49];
          do
          {
            __int128 v59 = *((_OWORD *)v56 - 1);
            v56 -= 2;
            *((_OWORD *)v58 - 1) = v59;
            v58 -= 16;
            *unsigned int v56 = 0LL;
            v56[1] = 0LL;
          }

          while (v56 != v57);
          int64x2_t v60 = *v39;
        }

        __int16 v48 = (__int128 *)(v55 + 16);
        a1[37] = v58;
        a1[38] = v55 + 16;
        *(int64x2_t *)&buf[8] = v60;
        uint64_t v61 = a1[39];
        a1[39] = &v53[16 * v54];
        *(void *)&buf[24] = v61;
        *(void *)buf = v60.i64[0];
        sub_BB6C((uint64_t)buf);
      }

      else
      {
        void *v46 = v45;
        v46[1] = *((void *)&v133 + 1);
        __int128 v133 = 0uLL;
        __int16 v48 = (__int128 *)(v46 + 2);
      }

      a1[38] = v48;
      sub_99FC((char **)a1 + 40, v48 - 1);
      uint64_t v62 = (std::__shared_weak_count *)*((void *)&v133 + 1);
      if (*((void *)&v133 + 1))
      {
        __int16 v63 = (unint64_t *)(*((void *)&v133 + 1) + 8LL);
        do
          unint64_t v64 = __ldaxr(v63);
        while (__stlxr(v64 - 1, v63));
        if (!v64)
        {
          ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
          std::__shared_weak_count::__release_weak(v62);
        }
      }

      if (*(void *)&v134[8]) {
        std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v134[8]);
      }
      v37 += 8LL;
    }

    while (v37 != v38);
  }

  v65 = (unsigned __int8 *)a1[17];
  for (uint64_t i = (unsigned __int8 *)a1[18]; v65 != i; v65 += 8)
  {
    sub_D858();
    unsigned int v67 = (os_log_s *)qword_2C190;
    if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
    {
      if (v65[1]) {
        unsigned __int8 v68 = *v65 | 0x80;
      }
      else {
        unsigned __int8 v68 = *v65;
      }
      int v69 = v65[6];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = 184;
      *(_WORD *)&_BYTE buf[18] = 1024;
      *(_DWORD *)&buf[20] = v68;
      *(_WORD *)&buf[24] = 1024;
      *(_DWORD *)&buf[26] = v69;
      _os_log_impl( &dword_0,  v67,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Configuring USB In Endpoint: 0x%0x, pipeIndex:%d",  buf,  0x1Eu);
    }
  }

  char v70 = (unsigned __int8 *)a1[20];
  for (j = (unsigned __int8 *)a1[21]; v70 != j; v70 += 8)
  {
    sub_D858();
    v72 = (os_log_s *)qword_2C190;
    if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
    {
      if (v70[1]) {
        unsigned __int8 v73 = *v70 | 0x80;
      }
      else {
        unsigned __int8 v73 = *v70;
      }
      int v74 = v70[6];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = 187;
      *(_WORD *)&_BYTE buf[18] = 1024;
      *(_DWORD *)&buf[20] = v73;
      *(_WORD *)&buf[24] = 1024;
      *(_DWORD *)&buf[26] = v74;
      _os_log_impl( &dword_0,  v72,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Configuring USB Out Endpoint: 0x%0x, pipeIndex:%d",  buf,  0x1Eu);
    }
  }

  uint64_t v75 = a1[17];
  uint64_t v76 = a1[18];
  if (v75 == v76)
  {
    BOOL v78 = 0;
  }

  else
  {
    uint64_t v77 = v75 + 8;
    do
    {
      BOOL v78 = *(unsigned __int8 *)(v77 - 1) == 255;
      BOOL v79 = *(unsigned __int8 *)(v77 - 1) == 255 || v77 == v76;
      v77 += 8LL;
    }

    while (!v79);
  }

  for (uint64_t k = a1[20]; k != a1[21]; k += 8LL)
  {
  }

  if (!v78) {
    goto LABEL_164;
  }
LABEL_116:
  sub_D858();
  v90 = (os_log_s *)qword_2C190;
  if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 191;
    _os_log_impl( &dword_0,  v90,  OS_LOG_TYPE_INFO,  "%25s:%-5d      MIDI-CI negotiation is necessary to determine initial protocol(s).",  buf,  0x12u);
  }

  *((_BYTE *)a1 + 188) = 1;
  memset(buf, 0, 24);
  sub_13E34((char *)buf, (uint64_t *)a1[20], (uint64_t *)a1[21], (uint64_t)(a1[21] - a1[20]) >> 3);
  v91 = *(unsigned __int8 **)buf;
  if (*(void *)buf != *(void *)&buf[8])
  {
    while (v91[7] == 255)
    {
      v91 += 8;
    }
  }

  if (v91 != *(unsigned __int8 **)&buf[8])
  {
    sub_D858();
    v92 = (os_log_s *)qword_2C190;
    if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v134 = 136315394;
      *(void *)&v134[4] = "USBMIDIDevice.cpp";
      *(_WORD *)&v134[12] = 1024;
      *(_DWORD *)&v134[14] = 197;
      _os_log_impl( &dword_0,  v92,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Culling endpoints with known protocols.",  v134,  0x12u);
    }

    if (v91 + 8 != *(unsigned __int8 **)&buf[8])
    {
      uint64_t v93 = *(void *)buf;
      v94 = &v91[-*(void *)buf];
      unint64_t v95 = (*(void *)&buf[8] - (void)v91) & 0xFFFFFFFFFFFFFFF8LL;
      memmove(v91, v91 + 8, v95 - 8);
      v91 = &v94[v93 - 8 + v95];
    }

    *(void *)&buf[8] = v91;
  }

LABEL_128:
  sub_D858();
  v96 = (os_log_s *)qword_2C190;
  if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v134 = 136315650;
    *(void *)&v134[4] = "USBMIDIDevice.cpp";
    *(_WORD *)&v134[12] = 1024;
    *(_DWORD *)&v134[14] = 202;
    __int16 v135 = 1024;
    int v136 = (*(void *)&buf[8] - *(void *)buf) >> 3;
    _os_log_impl( &dword_0,  v96,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Negotiating protocol for %u endpoint(s)...",  v134,  0x18u);
  }

  v98 = *(unsigned __int8 **)buf;
  v97 = *(unsigned __int8 **)&buf[8];
  if (*(void *)buf != *(void *)&buf[8])
  {
    do
    {
      uint64_t v99 = a1[24];
      uint64_t v100 = a1[25];
      if (v99 != v100)
      {
        if (v98[1]) {
          unsigned __int8 v101 = *v98 | 0x80;
        }
        else {
          unsigned __int8 v101 = *v98;
        }
        while (*(unsigned __int8 *)(v99 + 3) != v101)
        {
          v99 += 8LL;
          if (v99 == v100) {
            goto LABEL_140;
          }
        }
      }

      if (v99 == v100) {
LABEL_140:
      }
        int v102 = 0;
      else {
        int v102 = *(unsigned __int8 *)(v99 + 2);
      }
      v103 = (_BYTE *)a1[17];
      v104 = (_BYTE *)a1[18];
      if (v103 != v104)
      {
        while (1)
        {
          unsigned __int8 v105 = v103[1] ? *v103 | 0x80 : *v103;
          if (v102 == v105) {
            break;
          }
          v103 += 8;
          if (v103 == v104) {
            goto LABEL_160;
          }
        }
      }

      if (v103 != v104 && (~*(void *)v103 & 0xFF000000000000LL) != 0)
      {
        sub_CD7C(&v133, a1 + 8);
        sub_150B8(&v133, v134);
        v106 = (std::__shared_weak_count *)*((void *)&v133 + 1);
        if (*((void *)&v133 + 1))
        {
          v107 = (unint64_t *)(*((void *)&v133 + 1) + 8LL);
          do
            unint64_t v108 = __ldaxr(v107);
          while (__stlxr(v108 - 1, v107));
          if (!v108)
          {
            ((void (*)(std::__shared_weak_count *))v106->__on_zero_shared)(v106);
            std::__shared_weak_count::__release_weak(v106);
          }
        }

        sub_99FC((char **)a1 + 14, (__int128 *)v134);
        v109 = *(std::__shared_weak_count **)&v134[8];
        if (*(void *)&v134[8])
        {
          v110 = (unint64_t *)(*(void *)&v134[8] + 8LL);
          do
            unint64_t v111 = __ldaxr(v110);
          while (__stlxr(v111 - 1, v110));
          if (!v111)
          {
            ((void (*)(std::__shared_weak_count *))v109->__on_zero_shared)(v109);
            std::__shared_weak_count::__release_weak(v109);
          }
        }
      }

LABEL_160:
      v98 += 8;
    }

    while (v98 != v97);
    v98 = *(unsigned __int8 **)buf;
  }

  if (v98)
  {
    *(void *)&buf[8] = v98;
    operator delete(v98);
  }

LABEL_164:
  sub_D858();
  v112 = (os_log_s *)qword_2C190;
  if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
  {
    uint64_t v113 = (a1[18] - a1[17]) >> 3;
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 213;
    *(_WORD *)&_BYTE buf[18] = 1024;
    *(_DWORD *)&buf[20] = v113;
    _os_log_impl(&dword_0, v112, OS_LOG_TYPE_INFO, "%25s:%-5d      Priming %d input pipe(s)", buf, 0x18u);
  }

  if (a1[18] != a1[17])
  {
    unint64_t v114 = 0LL;
    do
    {
      uint64_t v115 = 0LL;
      char v116 = 1;
      do
      {
        char v117 = v116;
        unint64_t v118 = v115 | (2 * v114);
        uint64_t v119 = a1[34];
        if (v118 >= (a1[35] - v119) >> 4) {
          sub_13F18();
        }
        uint64_t v120 = a1[17];
        if (v114 >= (a1[18] - v120) >> 3) {
          sub_13F18();
        }
        *(_BYTE *)(*(void *)(v119 + 16 * v118) + 64LL) = *(_BYTE *)(v120 + 8 * v114 + 6);
        (*(void (**)(void *))(*a1 + 64LL))(a1);
        char v116 = 0;
        uint64_t v115 = 1LL;
      }

      while ((v117 & 1) != 0);
      ++v114;
    }

    while (v114 < (uint64_t)(a1[18] - a1[17]) >> 3);
  }

  (*(void (**)(void, void *))(*(void *)a1[10] + 152LL))(a1[10], a1);
  v121 = (uint64_t *)a1[14];
  v122 = (uint64_t *)a1[15];
  if (v121 == v122) {
    goto LABEL_191;
  }
  do
  {
    if (*((_BYTE *)a1 + 492) || *((_BYTE *)a1 + 493))
    {
      sub_D858();
      v123 = (os_log_s *)qword_2C190;
      if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
      {
        v124 = "forcemidi1fallback";
        if (!*((_BYTE *)a1 + 492)) {
          v124 = "forcemidi1upfallback";
        }
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
        *(_WORD *)&_BYTE buf[12] = 1024;
        *(_DWORD *)&buf[14] = 226;
        *(_WORD *)&_BYTE buf[18] = 2080;
        *(void *)&buf[20] = v124;
        _os_log_impl( &dword_0,  v123,  OS_LOG_TYPE_INFO,  "%25s:%-5d [AQAMIDI] %s is set in defaults, so negotiation will be skipped.",  buf,  0x1Cu);
      }

      uint64_t v125 = *v121;
      if (*(_BYTE *)(*v121 + 41)) {
        unsigned __int8 v126 = *(_BYTE *)(*v121 + 40) | 0x80;
      }
      else {
        unsigned __int8 v126 = *(_BYTE *)(*v121 + 40);
      }
      int v127 = *(unsigned __int8 *)(v125 + 49);
      unsigned __int8 v128 = *(_BYTE *)(v125 + 48);
      if (v127) {
        v128 |= 0x80u;
      }
      sub_E988((uint64_t)a1, v126, v128, 255);
    }

    else
    {
      sub_9D5C(*v121);
    }

    v121 += 2;
  }

  while (v121 != v122);
  if (a1[14] != a1[15]) {
    return 1LL;
  }
LABEL_191:
  uint64_t v86 = (*(uint64_t (**)(void *))(*a1 + 48LL))(a1);
  sub_D858();
  v129 = (os_log_s *)qword_2C190;
  if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
  {
    v130 = "false";
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 236;
    *(_DWORD *)buf = 136315906;
    if ((_DWORD)v86) {
      v130 = "true";
    }
    *(_WORD *)&_BYTE buf[18] = 2048;
    *(void *)&buf[20] = a1;
    *(_WORD *)&buf[28] = 2080;
    *(void *)&buf[30] = v130;
    _os_log_impl(&dword_0, v129, OS_LOG_TYPE_INFO, "%25s:%-5d [-] USBMIDIDevice(%p)::Initialize() = %s", buf, 0x26u);
  }

  return v86;
}

void sub_E894( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, std::__shared_weak_count *a20, uint64_t a21, uint64_t a22, void *__p, uint64_t a24)
{
  if (__p)
  {
    a24 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

ItemCount sub_E90C(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 491)) {
    return 0LL;
  }
  ItemCount result = MIDIDeviceGetNumberOfEntities(*(_DWORD *)(a1 + 8));
  if ((_DWORD)result)
  {
    SInt32 outValue = 0;
    ItemCount result = MIDIDeviceGetEntity(*(_DWORD *)(a1 + 8), (int)result - 1);
    if ((_DWORD)result)
    {
      MIDIObjectGetIntegerProperty(result, kMIDIPropertyUMPCanTransmitGroupless, &outValue);
      return outValue != 0;
    }
  }

  return result;
}

void sub_E988(uint64_t a1, int a2, int a3, int a4)
{
  if (*(_BYTE *)(a1 + 492))
  {
    *(_BYTE *)(a1 + 188) = 0;
    sub_D858();
    uint64_t v7 = (os_log_s *)qword_2C190;
    if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = "[AQAMIDI] defaults value midi1fallback is set";
      int v9 = *(unsigned __int8 *)(a1 + 492);
      uint64_t v38 = "USBMIDIDevice.cpp";
      int v37 = 136316162;
      __int16 v39 = 1024;
      if (!v9) {
        uint64_t v8 = "";
      }
      int v40 = 989;
      __int16 v41 = 1024;
      *(_DWORD *)unint64_t v42 = a2;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = a3;
      __int16 v43 = 2080;
      unint64_t v44 = v8;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] USBMIDIDevice::NegotiationCompleteForEndpoint(inEP: 0x%x, outEP: 0x%x) failed %s",  (uint8_t *)&v37,  0x28u);
    }

    int v10 = sub_EF84(a1);
    sub_D858();
    uint64_t v11 = qword_2C190;
    BOOL v12 = os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (!v12) {
        return;
      }
      int v37 = 136315906;
      uint64_t v38 = "USBMIDIDevice.cpp";
      __int16 v39 = 1024;
      int v40 = 991;
      __int16 v41 = 1024;
      *(_DWORD *)unint64_t v42 = a2;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = a3;
      uint64_t v13 = "%25s:%-5d [-] USBMIDIDevice::NegotiationCompleteForEndpoints(inEP: 0x%x, outEP: 0x%x) - Successfully fell ba"
            "ck to MIDI 1.0 after failure.";
    }

    else
    {
      if (!v12) {
        return;
      }
      int v37 = 136315906;
      uint64_t v38 = "USBMIDIDevice.cpp";
      __int16 v39 = 1024;
      int v40 = 993;
      __int16 v41 = 1024;
      *(_DWORD *)unint64_t v42 = a2;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = a3;
      uint64_t v13 = "%25s:%-5d [!] USBMIDIDevice::NegotiationCompleteForEndpoints(inEP: 0x%x, outEP: 0x%x) - MIDI 1.0 fallback failed.";
    }

    unint64_t v17 = (os_log_s *)v11;
    os_log_type_t v18 = OS_LOG_TYPE_INFO;
    uint32_t v19 = 30;
    goto LABEL_16;
  }

  int v14 = a4;
  if (a4 == 255)
  {
    int v15 = *(unsigned __int8 *)(a1 + 493);
    sub_D858();
    unsigned int v16 = (os_log_s *)qword_2C190;
    if (v15)
    {
      int v14 = 1;
      if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
      {
        int v37 = 136315394;
        uint64_t v38 = "USBMIDIDevice.cpp";
        __int16 v39 = 1024;
        int v40 = 999;
        _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "%25s:%-5d * * * [AQAMIDI] Protocol negotiation skipped because of defaults. Forcing MIDI-1UP as default protocol. * * *",  (uint8_t *)&v37,  0x12u);
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_ERROR))
      {
        int v37 = 136315394;
        uint64_t v38 = "USBMIDIDevice.cpp";
        __int16 v39 = 1024;
        int v40 = 1001;
        _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_ERROR,  "%25s:%-5d * * * [AQAMIDI] Protocol negotiation timed out. Using MIDI-1UP as default protocol. * * *",  (uint8_t *)&v37,  0x12u);
      }

      int v14 = 1;
    }
  }

  sub_D858();
  uint64_t v20 = (os_log_s *)qword_2C190;
  if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
  {
    int v37 = 136315906;
    uint64_t v38 = "USBMIDIDevice.cpp";
    __int16 v39 = 1024;
    int v40 = 1004;
    __int16 v41 = 1024;
    *(_DWORD *)unint64_t v42 = a2;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = a3;
    _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "%25s:%-5d [*] USBMIDIDevice::NegotiationCompleteForEndpoints(inEP: 0x%x, outEP: 0x%x)",  (uint8_t *)&v37,  0x1Eu);
  }

  unint64_t v21 = *(_BYTE **)(a1 + 136);
  uint64_t v22 = *(_BYTE **)(a1 + 144);
  unint64_t v23 = v21;
  if (v21 != v22)
  {
    unint64_t v23 = *(_BYTE **)(a1 + 136);
    while (1)
    {
      unsigned __int8 v24 = v23[1] ? *v23 | 0x80 : *v23;
      if (a2 == v24) {
        break;
      }
      v23 += 8;
      if (v23 == v22) {
        goto LABEL_54;
      }
    }
  }

  if (v22 != v23)
  {
    v23[7] = v14;
    BOOL v26 = *(_BYTE **)(a1 + 160);
    uint64_t v25 = *(_BYTE **)(a1 + 168);
    uint64_t v27 = v26;
    if (v26 != v25)
    {
      while (1)
      {
        unsigned __int8 v28 = v27[1] ? *v27 | 0x80 : *v27;
        if (a3 == v28) {
          break;
        }
        v27 += 8;
        if (v27 == v25) {
          goto LABEL_54;
        }
      }
    }

    if (v25 != v27)
    {
      v27[7] = v14;
      while (v21 != v22)
      {
        if (v21[7] == 255)
        {
          BOOL v30 = 1;
          goto LABEL_53;
        }

        v21 += 8;
      }

      if (v26 == v25)
      {
        BOOL v30 = 0;
      }

      else
      {
        int v29 = v26 + 8;
        do
        {
          BOOL v30 = *(v29 - 1) == 255;
          BOOL v31 = *(v29 - 1) == 255 || v29 == v25;
          v29 += 8;
        }

        while (!v31);
      }

LABEL_53:
      *(_BYTE *)(a1 + 188) = v30;
    }
  }

LABEL_54:
  if (!*(_BYTE *)(a1 + 188))
  {
    sub_D858();
    uint64_t v32 = (os_log_s *)qword_2C190;
    if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
    {
      int v37 = 136315394;
      uint64_t v38 = "USBMIDIDevice.cpp";
      __int16 v39 = 1024;
      int v40 = 1019;
      _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_INFO,  "%25s:%-5d ============================================",  (uint8_t *)&v37,  0x12u);
    }

    sub_D858();
    uint64_t v33 = (os_log_s *)qword_2C190;
    if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = "MIDI-1UP";
      uint64_t v38 = "USBMIDIDevice.cpp";
      int v37 = 136315650;
      if (v14 == 2) {
        uint64_t v34 = "MIDI 2.0";
      }
      __int16 v39 = 1024;
      int v40 = 1020;
      __int16 v41 = 2080;
      *(void *)unint64_t v42 = v34;
      _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_INFO,  "%25s:%-5d == [AQAMIDI] Protocol changed to %s ==",  (uint8_t *)&v37,  0x1Cu);
    }

    sub_D858();
    uint64_t v35 = (os_log_s *)qword_2C190;
    if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
    {
      int v37 = 136315394;
      uint64_t v38 = "USBMIDIDevice.cpp";
      __int16 v39 = 1024;
      int v40 = 1021;
      _os_log_impl( &dword_0,  v35,  OS_LOG_TYPE_INFO,  "%25s:%-5d ============================================",  (uint8_t *)&v37,  0x12u);
    }

    if (((*(uint64_t (**)(uint64_t))(*(void *)a1 + 48LL))(a1) & 1) == 0)
    {
      sub_D858();
      uint64_t v36 = qword_2C190;
      if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_ERROR))
      {
        int v37 = 136315394;
        uint64_t v38 = "USBMIDIDevice.cpp";
        __int16 v39 = 1024;
        int v40 = 1024;
        uint64_t v13 = "%25s:%-5d [!] USBMIDIDevice::NegotiationCompleteForEndpoint() - unable to start I/O";
        unint64_t v17 = (os_log_s *)v36;
        os_log_type_t v18 = OS_LOG_TYPE_ERROR;
        uint32_t v19 = 18;
LABEL_16:
        _os_log_impl(&dword_0, v17, v18, v13, (uint8_t *)&v37, v19);
      }
    }
  }

uint64_t sub_EF84(uint64_t a1)
{
  *(_BYTE *)(a1 + 491) = 0;
  sub_D858();
  unint64_t v2 = (os_log_s *)qword_2C190;
  if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    __int16 v38 = 1024;
    int v39 = 248;
    _os_log_impl( &dword_0,  v2,  OS_LOG_TYPE_INFO,  "%25s:%-5d * * * [AQAMIDI] MIDI protocol negotiation failed. Falling back to USB MIDI 1.0 configuration * * *",  buf,  0x12u);
  }

  int NumberOfEntities = MIDIDeviceGetNumberOfEntities(*(_DWORD *)(a1 + 8));
  ItemCount v4 = (NumberOfEntities - 1);
  if (NumberOfEntities - 1 >= 0)
  {
    do
    {
      MIDIEntityRef Entity = MIDIDeviceGetEntity(*(_DWORD *)(a1 + 8), v4);
      MIDIDeviceRemoveEntity(*(_DWORD *)(a1 + 8), Entity);
      --v4;
      --NumberOfEntities;
    }

    while (NumberOfEntities);
  }

  sub_D858();
  int v6 = (os_log_s *)qword_2C190;
  if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    __int16 v38 = 1024;
    int v39 = 256;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_INFO,  "%25s:%-5d [+] USBMIDIDevice::InitializeFallback() - probing device",  buf,  0x12u);
  }

  sub_1C420(*(void *)(a1 + 88), *(void *)(a1 + 96), (uint64_t)buf);
  if (*(void *)buf)
  {
    sub_D858();
    uint64_t v7 = (os_log_s *)qword_2C190;
    if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v36 = 136315394;
      *(void *)&v36[4] = "USBMIDIDevice.cpp";
      *(_WORD *)&v36[12] = 1024;
      *(_DWORD *)&v36[14] = 260;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%25s:%-5d      Creating fallback port map list", v36, 0x12u);
    }

    sub_1C770(1, (uint64_t)buf, (uint64_t *)v36);
    sub_D858();
    uint64_t v8 = (os_log_s *)qword_2C190;
    if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)BOOL v30 = 136315394;
      BOOL v31 = "USBMIDIDevice.cpp";
      __int16 v32 = 1024;
      int v33 = 264;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%25s:%-5d      Setting alternate interface to 0", v30, 0x12u);
    }

    (*(void (**)(void, void))(**(void **)(a1 + 104) + 176LL))(*(void *)(a1 + 104), 0LL);
    uint64_t v9 = *(void *)(a1 + 160);
    uint64_t v10 = *(void *)(a1 + 168);
    while (v9 != v10)
    {
      *(_BYTE *)(v9 + 7) = 0;
      (*(void (**)(void, void))(**(void **)(a1 + 104) + 224LL))( *(void *)(a1 + 104),  *(unsigned __int8 *)(v9 + 6));
      v9 += 8LL;
    }

    sub_D858();
    uint64_t v11 = (os_log_s *)qword_2C190;
    if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = (*(void *)(a1 + 144) - *(void *)(a1 + 136)) >> 3;
      *(_DWORD *)BOOL v30 = 136315650;
      BOOL v31 = "USBMIDIDevice.cpp";
      __int16 v32 = 1024;
      int v33 = 271;
      __int16 v34 = 1024;
      int v35 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%25s:%-5d      Priming %d input pipe(s)", v30, 0x18u);
    }

    uint64_t v13 = *(void *)(a1 + 136);
    uint64_t v14 = *(void *)(a1 + 144);
    if (v13 != v14)
    {
      uint64_t v15 = 0LL;
      do
      {
        uint64_t v16 = 0LL;
        *(_BYTE *)(v13 + 7) = 0;
        char v17 = 1;
        do
        {
          char v18 = v17;
          unint64_t v19 = v16 | (2 * v15);
          uint64_t v20 = *(void *)(a1 + 272);
          if (v19 >= (*(void *)(a1 + 280) - v20) >> 4) {
            sub_13F18();
          }
          uint64_t v21 = *(void *)(v20 + 16 * v19);
          *(_BYTE *)(v21 + 64) = *(_BYTE *)(v13 + 6);
          (*(void (**)(void))(**(void **)(a1 + 104) + 224LL))(*(void *)(a1 + 104));
          (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 64LL))(a1, v21);
          char v17 = 0;
          uint64_t v16 = 1LL;
        }

        while ((v18 & 1) != 0);
        ++v15;
        v13 += 8LL;
      }

      while (v13 != v14);
    }

    uint64_t v23 = *(void *)(a1 + 88);
    uint64_t v22 = *(void *)(a1 + 96);
    unsigned __int8 v24 = (const __CFString *)(*(uint64_t (**)(void))(**(void **)(a1 + 80) + 112LL))(*(void *)(a1 + 80));
    uint64_t v25 = (const __CFString *)(*(uint64_t (**)(void))(**(void **)(a1 + 80) + 96LL))(*(void *)(a1 + 80));
    BOOL v26 = (const __CFString *)(*(uint64_t (**)(void))(**(void **)(a1 + 80) + 104LL))(*(void *)(a1 + 80));
    LODWORD(v23) = sub_1C650(v23, v22, v24, v25, v26, *(_DWORD *)(a1 + 8), (uint64_t *)v36, (uint64_t *)v40, v41, v42);
    sub_D858();
    uint64_t v27 = (os_log_s *)qword_2C190;
    if ((_DWORD)v23)
    {
      if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)BOOL v30 = 136315394;
        BOOL v31 = "USBMIDIDevice.cpp";
        __int16 v32 = 1024;
        int v33 = 287;
        _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_INFO,  "%25s:%-5d [-] USBMIDIDevice::InitializeFallback() - device configured. Starting I/O.",  v30,  0x12u);
      }

      uint64_t v28 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 48LL))(a1);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)BOOL v30 = 136315394;
        BOOL v31 = "USBMIDIDevice.cpp";
        __int16 v32 = 1024;
        int v33 = 290;
        _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] USBMIDIDevice::InitializeFallback() - could not configure device",  v30,  0x12u);
      }

      uint64_t v28 = 0LL;
    }

    if (*(void *)v36)
    {
      *(void *)&v36[8] = *(void *)v36;
      operator delete(*(void **)v36);
    }
  }

  else
  {
    uint64_t v28 = 0LL;
  }

  if (__p)
  {
    unint64_t v44 = __p;
    operator delete(__p);
  }

  if (v42[0])
  {
    v42[1] = v42[0];
    operator delete(v42[0]);
  }

  if (v41[0])
  {
    v41[1] = v41[0];
    operator delete(v41[0]);
  }

  if (v40[0])
  {
    v40[1] = v40[0];
    operator delete(v40[0]);
  }

  return v28;
}

void sub_F4E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  if (__p) {
    operator delete(__p);
  }
  sub_F52C(&a19);
  _Unwind_Resume(a1);
}

void *sub_F52C(void *a1)
{
  unint64_t v2 = (void *)a1[12];
  if (v2)
  {
    a1[13] = v2;
    operator delete(v2);
  }

  uint64_t v3 = (void *)a1[9];
  if (v3)
  {
    a1[10] = v3;
    operator delete(v3);
  }

  ItemCount v4 = (void *)a1[6];
  if (v4)
  {
    a1[7] = v4;
    operator delete(v4);
  }

  int v5 = (void *)a1[3];
  if (v5)
  {
    a1[4] = v5;
    operator delete(v5);
  }

  return a1;
}

void sub_F58C(uint64_t a1)
{
  CFRunLoopRef v2 = MIDIGetDriverIORunLoop();
  if (!v2) {
    goto LABEL_11;
  }
  uint64_t v3 = v2;
  ItemCount v4 = (__CFRunLoopSource *)(*(uint64_t (**)(void))(**(void **)(a1 + 104) + 40LL))(*(void *)(a1 + 104));
  CFRunLoopSourceRef source = v4;
  BOOL v5 = v4 == 0LL;
  if (!v4)
  {
    if ((*(unsigned int (**)(void, CFRunLoopSourceRef *))(**(void **)(a1 + 104) + 32LL))( *(void *)(a1 + 104),  &source))
    {
      BOOL v6 = 1;
    }

    else
    {
      BOOL v6 = source == 0LL;
    }

    if (!v6)
    {
      sub_D858();
      uint64_t v7 = (os_log_s *)qword_2C190;
      BOOL v8 = os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_DEBUG);
      ItemCount v4 = source;
      if (v8)
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v13 = "USBMIDIDevice.cpp";
        __int16 v14 = 1024;
        int v15 = 307;
        __int16 v16 = 2048;
        uint64_t v17 = a1;
        __int16 v18 = 2048;
        CFRunLoopSourceRef v19 = source;
        _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] USBMIDIDevice(%p)::RegisterAsyncSource() created CFRunLoopSource %p",  buf,  0x26u);
        ItemCount v4 = source;
      }

      goto LABEL_9;
    }

LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }

  v12.location = Length;
  v12.length = v6 - Length;
  uint64_t v10 = CFStringCreateWithSubstring(0LL, v4, v12);
  CFRelease(v4);
  return v10;
}

LABEL_9:
  if (!CFRunLoopContainsSource(v3, v4, kCFRunLoopDefaultMode)) {
    CFRunLoopAddSource(v3, source, kCFRunLoopDefaultMode);
  }
LABEL_12:
  sub_D858();
  uint64_t v9 = (os_log_s *)qword_2C190;
  if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = "failure";
    uint64_t v13 = "USBMIDIDevice.cpp";
    __int16 v14 = 1024;
    int v15 = 313;
    *(_DWORD *)buf = 136315906;
    if (v5) {
      uint64_t v10 = "success";
    }
    __int16 v16 = 2048;
    uint64_t v17 = a1;
    __int16 v18 = 2080;
    CFRunLoopSourceRef v19 = (CFRunLoopSourceRef)v10;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_INFO,  "%25s:%-5d [*] USBMIDIDevice(%p)::RegisterAsyncSource() = %s",  buf,  0x26u);
  }

      a2 += 13LL;
    }

    while (a2 < v5);
  }

  return result;
}

void sub_F78C(uint64_t a1)
{
  CFRunLoopRef v2 = MIDIGetDriverIORunLoop();
  uint64_t v3 = *(void *)(a1 + 104);
  if (v3) {
    BOOL v4 = v2 == 0LL;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    BOOL v5 = (__CFRunLoopSource *)(*(uint64_t (**)(uint64_t))(*(void *)v3 + 40LL))(v3);
    if (v5)
    {
      BOOL v6 = v5;
      if (CFRunLoopContainsSource(v2, v5, kCFRunLoopDefaultMode)) {
        CFRunLoopRemoveSource(v2, v6, kCFRunLoopDefaultMode);
      }
    }
  }

  sub_D858();
  uint64_t v7 = (os_log_s *)qword_2C190;
  if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    uint64_t v9 = "USBMIDIDevice.cpp";
    __int16 v10 = 1024;
    int v11 = 326;
    __int16 v12 = 2048;
    uint64_t v13 = a1;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_INFO,  "%25s:%-5d [*] USBMIDIDevice(%p)::UnregisterAsyncSource()",  (uint8_t *)&v8,  0x1Cu);
  }

uint64_t sub_F8B4(uint64_t a1)
{
  CFRunLoopRef v2 = (os_log_s *)qword_2C190;
  if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
  {
    v7.protocol = 136315650;
    *(void *)&v7.numPackets = "USBMIDIDevice.cpp";
    WORD2(v7.packet[0].timeStamp) = 1024;
    *(_DWORD *)((char *)&v7.packet[0].timeStamp + 6) = 331;
    HIWORD(v7.packet[0].wordCount) = 2048;
    *(void *)v7.packet[0].words = a1;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%25s:%-5d [+] USBMIDIDevice(%p)::StartIO()", (uint8_t *)&v7, 0x1Cu);
  }

  *(void *)(a1 + 480) = MIDITimerTaskCreate(sub_FAF4, a1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 24LL))(a1, 1LL);
  if (*(_BYTE *)(a1 + 491))
  {
    uint64_t v3 = MIDIEventListInit(&v7, kMIDIProtocol_2_0);
    v7.numPackets = 1;
    v3->timeStamp = 0LL;
    *(void *)&v3->wordCount = 0x3000000000000002LL;
    v3->words[1] = 0;
    (*(void (**)(uint64_t, MIDIEventList *, void))(*(void *)a1 + 96LL))(a1, &v7, 0LL);
  }

  else
  {
    v7.protocol = kMIDIProtocol_1_0;
    *(void *)&v7.numPackets = 0LL;
    HIDWORD(v7.packet[0].timeStamp) = -135266302;
    (*(void (**)(uint64_t, MIDIEventList *, void))(*(void *)a1 + 88LL))(a1, &v7, 0LL);
  }

  sub_D858();
  BOOL v4 = (os_log_s *)qword_2C190;
  if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
  {
    v7.protocol = 136315394;
    *(void *)&v7.numPackets = "USBMIDIDevice.cpp";
    WORD2(v7.packet[0].timeStamp) = 1024;
    *(_DWORD *)((char *)&v7.packet[0].timeStamp + 6) = 357;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_INFO,  "%25s:%-5d      bringing initialized device online...",  (uint8_t *)&v7,  0x12u);
  }

  MIDIObjectSetIntegerProperty(*(_DWORD *)(a1 + 8), kMIDIPropertyOffline, 0);
  sub_D858();
  BOOL v5 = (os_log_s *)qword_2C190;
  if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
  {
    v7.protocol = 136315650;
    *(void *)&v7.numPackets = "USBMIDIDevice.cpp";
    WORD2(v7.packet[0].timeStamp) = 1024;
    *(_DWORD *)((char *)&v7.packet[0].timeStamp + 6) = 360;
    HIWORD(v7.packet[0].wordCount) = 2048;
    *(void *)v7.packet[0].words = a1;
    _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_INFO,  "%25s:%-5d [-] USBMIDIDevice(%p)::StartIO() = true",  (uint8_t *)&v7,  0x1Cu);
  }

  return 1LL;
}

uint64_t sub_FAF4(uint64_t a1)
{
  uint64_t v2 = a1 + 344;
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 344) + 16LL))(a1 + 344);
  int v4 = result;
  *(_BYTE *)(a1 + 488) = 0;
  if (!*(_BYTE *)(a1 + 184)) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 72LL))(a1);
  }
  if (v4) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v2 + 24LL))(v2);
  }
  return result;
}

void sub_FB60(_Unwind_Exception *exception_object)
{
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24LL))(v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_FB88(void *a1)
{
  *a1 = off_289D8;
  if (!*((_BYTE *)a1 + 184))
  {
    sub_D858();
    int v2 = (os_log_s *)qword_2C190;
    if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
    {
      int v3 = *((unsigned __int8 *)a1 + 185);
      int v4 = "Input";
      *(void *)&v41[4] = "USBMIDIDevice.cpp";
      int v5 = *((unsigned __int8 *)a1 + 186);
      BOOL v16 = v3 == 0;
      __int16 v42 = 1024;
      int v43 = 369;
      BOOL v6 = "Output";
      if (v16) {
        int v4 = "N/A";
      }
      *(_DWORD *)__int16 v41 = 136316162;
      __int16 v44 = 2048;
      if (!v5) {
        BOOL v6 = "N/A";
      }
      uint64_t v45 = a1;
      __int16 v46 = 2080;
      unint64_t v47 = v4;
      __int16 v48 = 2080;
      uint64_t v49 = v6;
      _os_log_impl( &dword_0,  v2,  OS_LOG_TYPE_INFO,  "%25s:%-5d [+] USBMIDIDevice(%p)::~USBMIDIDevice() - Halting I/O chain for: %s and %s",  v41,  0x30u);
    }

    (*(void (**)(void *, void))(*a1 + 24LL))(a1, 0LL);
    if (((*(uint64_t (**)(void *))(*a1 + 112LL))(a1) & 1) != 0
      || (*(unsigned int (**)(void *))(*a1 + 104LL))(a1))
    {
      (*(void (**)(void, void *))(*(void *)a1[10] + 160LL))(a1[10], a1);
    }

    *((_BYTE *)a1 + 184) = 1;
    uint64_t v7 = a1[20];
    uint64_t v8 = a1[21];
    while (v7 != v8)
    {
      (*(void (**)(void, void))(*(void *)a1[13] + 224LL))(a1[13], *(unsigned __int8 *)(v7 + 6));
      v7 += 8LL;
    }

    uint64_t v9 = a1[17];
    uint64_t v10 = a1[18];
    while (v9 != v10)
    {
      (*(void (**)(void, void))(*(void *)a1[13] + 224LL))(a1[13], *(unsigned __int8 *)(v9 + 6));
      v9 += 8LL;
    }

    unsigned int v11 = 199;
    do
    {
      uint64_t v13 = a1[34];
      uint64_t v12 = a1[35];
      if (v13 == v12)
      {
        BOOL v15 = 0;
      }

      else
      {
        uint64_t v14 = v13 + 16;
        do
        {
          BOOL v15 = *(_BYTE *)(*(void *)(v14 - 16) + 44LL) != 0;
          if (*(_BYTE *)(*(void *)(v14 - 16) + 44LL)) {
            BOOL v16 = 1;
          }
          else {
            BOOL v16 = v14 == v12;
          }
          v14 += 16LL;
        }

        while (!v16);
      }

      for (uint64_t i = a1[37]; i != a1[38]; i += 16LL)
      {
        if (*(_BYTE *)(*(void *)i + 44LL))
        {
          int v18 = 1;
          goto LABEL_34;
        }
      }

      int v18 = 0;
      BOOL v19 = 0;
      if (!v15) {
        break;
      }
LABEL_34:
      usleep(0x2710u);
      BOOL v19 = v15;
    }

    while (v11-- >= 2);
    if ((v18 & 1) != 0 || v19)
    {
      sub_D858();
      uint64_t v21 = (os_log_s *)qword_2C190;
      if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = "complete";
        *(void *)&v41[4] = "USBMIDIDevice.cpp";
        __int16 v42 = 1024;
        int v43 = 407;
        __int16 v44 = 2048;
        if (v19) {
          uint64_t v23 = "pending";
        }
        else {
          uint64_t v23 = "complete";
        }
        *(_DWORD *)__int16 v41 = 136316162;
        uint64_t v45 = a1;
        if (v18) {
          uint64_t v22 = "pending";
        }
        __int16 v46 = 2080;
        unint64_t v47 = v23;
        __int16 v48 = 2080;
        uint64_t v49 = v22;
        _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] USBMIDIDevice(%p)::~USBMIDIDevice() Input:%s Output:%s",  v41,  0x30u);
      }
    }

    uint64_t v25 = a1[34];
    for (uint64_t j = a1[35]; j != v25; uint64_t j = sub_624C(j - 16))
      ;
    a1[35] = v25;
    uint64_t v27 = a1[37];
    for (uint64_t k = a1[38]; k != v27; uint64_t k = sub_624C(k - 16))
      ;
    a1[38] = v27;
    (*(void (**)(void *))(*a1 + 40LL))(a1);
    uint64_t v30 = a1[60];
    if (v30) {
      MIDITimerTaskDispose(v30, v28, v29);
    }
  }

  if (a1[13])
  {
    uint64_t v31 = a1[12];
    if (v31)
    {
      __int16 v32 = (void *)sub_7C9C(v31);
      operator delete(v32);
    }
  }

  uint64_t v33 = a1[11];
  if (v33)
  {
    __int16 v34 = (void *)sub_68C4(v33);
    operator delete(v34);
  }

  sub_D858();
  int v35 = (os_log_s *)qword_2C190;
  if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int16 v41 = 136315650;
    *(void *)&v41[4] = "USBMIDIDevice.cpp";
    __int16 v42 = 1024;
    int v43 = 431;
    __int16 v44 = 2048;
    uint64_t v45 = a1;
    _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "%25s:%-5d [-] USBMIDIDevice(%p)::~USBMIDIDevice()", v41, 0x1Cu);
  }

  *(void *)__int16 v41 = a1 + 57;
  sub_13CA8((void ***)v41);
  sub_13D88(a1 + 54);
  sub_3C24((uint64_t)(a1 + 43));
  *(void *)__int16 v41 = a1 + 40;
  sub_BBB8((void ***)v41);
  *(void *)__int16 v41 = a1 + 37;
  sub_BBB8((void ***)v41);
  *(void *)__int16 v41 = a1 + 34;
  sub_BBB8((void ***)v41);
  sub_624C((uint64_t)(a1 + 32));
  sub_624C((uint64_t)(a1 + 30));
  sub_624C((uint64_t)(a1 + 28));
  uint64_t v36 = (void *)a1[24];
  if (v36)
  {
    a1[25] = v36;
    operator delete(v36);
  }

  int v37 = (void *)a1[20];
  if (v37)
  {
    a1[21] = v37;
    operator delete(v37);
  }

  __int16 v38 = (void *)a1[17];
  if (v38)
  {
    a1[18] = v38;
    operator delete(v38);
  }

  *(void *)__int16 v41 = a1 + 14;
  sub_BBB8((void ***)v41);
  int v39 = (std::__shared_weak_count *)a1[9];
  if (v39) {
    std::__shared_weak_count::__release_weak(v39);
  }
  sub_6368(a1);
  return a1;
}

void sub_1003C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_3584(a1);
}

void sub_10060(void *a1)
{
  uint64_t v1 = sub_FB88(a1);
  operator delete(v1);
}

void sub_10074(uint64_t a1, int a2)
{
  if (*(_BYTE *)(a1 + 491))
  {
    *(_DWORD *)(a1 + 12) = MIDIDeviceGetNumberOfEntities(*(_DWORD *)(a1 + 8));
    sub_287C(a2, (void *)a1, *(_DWORD *)(a1 + 8), (void *)(a1 + 192), a1 + 16, (char **)(a1 + 40));
  }

  else
  {
    sub_63BC(a1, a2);
  }

void sub_100D4(uint64_t a1)
{
}

void sub_100EC(uint64_t a1, uint64_t a2, unsigned __int8 **a3, void **a4, void **a5)
{
  unsigned __int8 v57 = 0;
  if (a1 && a2)
  {
    int v9 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(void *)a2 + 152LL))(a2, &v57);
    sub_D858();
    uint64_t v10 = (os_log_s *)qword_2C190;
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        __int128 v59 = "USBMIDIDevice.cpp";
        __int16 v60 = 1024;
        int v61 = 496;
        __int16 v62 = 1024;
        int v63 = v9;
        _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] USBMIDIDevice::FindPipes: failed (0x%x)",  buf,  0x18u);
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        __int128 v59 = "USBMIDIDevice.cpp";
        __int16 v60 = 1024;
        int v61 = 464;
        __int16 v62 = 1024;
        int v63 = v57;
        _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_INFO,  "%25s:%-5d [*] USBMIDIDevice::FindPipes() -- interface has %d endpoints",  buf,  0x18u);
      }

      if (v57)
      {
        int v11 = 1;
        int v12 = 1;
        while (1)
        {
          WORD2(v56) = 0;
          BYTE6(v56) = -1;
          int v13 = sub_7F58(a1, v11, (uint64_t)&v56);
          sub_D858();
          uint64_t v14 = (os_log_s *)qword_2C190;
          BOOL v15 = os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO);
          if (v13) {
            break;
          }
          if (v15)
          {
            *(_DWORD *)buf = 136315906;
            __int128 v59 = "USBMIDIDevice.cpp";
            __int16 v60 = 1024;
            int v61 = 469;
            __int16 v62 = 1024;
            int v63 = v56;
            __int16 v64 = 1024;
            int v65 = BYTE1(v56);
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "%25s:%-5d      Got pipe 0x%x direction %d", buf, 0x1Eu);
          }

          unsigned __int8 v16 = v56;
          if (BYTE1(v56)) {
            unsigned __int8 v16 = v56 | 0x80;
          }
          for (uint64_t i = *a3; ; i += 8)
          {
            if (i == a3[1])
            {
              HIBYTE(v56) = 0;
              goto LABEL_19;
            }

            if (i[2] == v16 || i[3] == v16) {
              break;
            }
          }

          int v31 = i[4];
          HIBYTE(v56) = v31;
          if (v31 <= 1)
          {
            if (v31)
            {
              sub_D858();
              uint64_t v32 = qword_2C190;
              if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
              {
                if (BYTE1(v56)) {
                  int v33 = v56 | 0x80;
                }
                else {
                  int v33 = v56;
                }
                *(_DWORD *)buf = 136316162;
                __int128 v59 = "USBMIDIDevice.cpp";
                __int16 v60 = 1024;
                int v61 = 474;
                __int16 v62 = 1024;
                int v63 = v11;
                __int16 v64 = 1024;
                int v65 = v56;
                __int16 v66 = 1024;
                int v67 = v33;
                uint64_t v20 = (os_log_s *)v32;
                uint64_t v21 = "%25s:%-5d      Found pipeIndex %d, pipeNum %d [ep 0x%00x] (MIDI-1UP)";
LABEL_24:
                _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, v21, buf, 0x24u);
                goto LABEL_25;
              }

              goto LABEL_25;
            }

LABEL_19:
            sub_D858();
            uint64_t v18 = qword_2C190;
            if (!os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO)) {
              goto LABEL_25;
            }
            if (BYTE1(v56)) {
              int v19 = v56 | 0x80;
            }
            else {
              int v19 = v56;
            }
            *(_DWORD *)buf = 136316162;
            __int128 v59 = "USBMIDIDevice.cpp";
            __int16 v60 = 1024;
            int v61 = 472;
            __int16 v62 = 1024;
            int v63 = v11;
            __int16 v64 = 1024;
            int v65 = v56;
            __int16 v66 = 1024;
            int v67 = v19;
            uint64_t v20 = (os_log_s *)v18;
            uint64_t v21 = "%25s:%-5d      Found pipeIndex %d, pipeNum %d [ep 0x%00x] (legacy MIDI 1.0)";
            goto LABEL_24;
          }

          if (v31 == 2)
          {
            sub_D858();
            uint64_t v46 = qword_2C190;
            if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
            {
              if (BYTE1(v56)) {
                int v47 = v56 | 0x80;
              }
              else {
                int v47 = v56;
              }
              *(_DWORD *)buf = 136316162;
              __int128 v59 = "USBMIDIDevice.cpp";
              __int16 v60 = 1024;
              int v61 = 476;
              __int16 v62 = 1024;
              int v63 = v11;
              __int16 v64 = 1024;
              int v65 = v56;
              __int16 v66 = 1024;
              int v67 = v47;
              uint64_t v20 = (os_log_s *)v46;
              uint64_t v21 = "%25s:%-5d      Found pipeIndex %d, pipeNum %d [ep 0x%00x] (MIDI 2.0)";
              goto LABEL_24;
            }
          }

          else if (v31 == 255)
          {
            sub_D858();
            uint64_t v44 = qword_2C190;
            if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
            {
              if (BYTE1(v56)) {
                int v45 = v56 | 0x80;
              }
              else {
                int v45 = v56;
              }
              *(_DWORD *)buf = 136316162;
              __int128 v59 = "USBMIDIDevice.cpp";
              __int16 v60 = 1024;
              int v61 = 478;
              __int16 v62 = 1024;
              int v63 = v11;
              __int16 v64 = 1024;
              int v65 = v56;
              __int16 v66 = 1024;
              int v67 = v45;
              uint64_t v20 = (os_log_s *)v44;
              uint64_t v21 = "%25s:%-5d      Found pipeIndex %d, pipeNum %d [ep 0x%00x] (Use MIDI-CI to discover protocol)";
              goto LABEL_24;
            }
          }

LABEL_25:
          if (BYTE1(v56) == 1)
          {
            BOOL v26 = a4[1];
            unint64_t v25 = (unint64_t)a4[2];
            if ((unint64_t)v26 >= v25)
            {
              uint64_t v39 = ((char *)v26 - (_BYTE *)*a4) >> 3;
              uint64_t v40 = v25 - (void)*a4;
              uint64_t v41 = v40 >> 2;
              else {
                unint64_t v42 = v41;
              }
              if (v42) {
                int v43 = (char *)sub_13EE4((uint64_t)(a4 + 2), v42);
              }
              else {
                int v43 = 0LL;
              }
              unint64_t v52 = &v43[8 * v39];
              *(void *)unint64_t v52 = v56;
              uint64_t v27 = v52 + 8;
              uint64_t v54 = (char *)*a4;
              int v53 = (char *)a4[1];
              if (v53 != *a4)
              {
                do
                {
                  uint64_t v55 = *((void *)v53 - 1);
                  v53 -= 8;
                  *((void *)v52 - 1) = v55;
                  v52 -= 8;
                }

                while (v53 != v54);
                int v53 = (char *)*a4;
              }

              *a4 = v52;
              a4[1] = v27;
              a4[2] = &v43[8 * v42];
              if (v53) {
                operator delete(v53);
              }
            }

            else
            {
              *BOOL v26 = v56;
              uint64_t v27 = v26 + 1;
            }

            a4[1] = v27;
            goto LABEL_83;
          }

          if (!BYTE1(v56))
          {
            uint64_t v23 = a5[1];
            unint64_t v22 = (unint64_t)a5[2];
            if ((unint64_t)v23 >= v22)
            {
              uint64_t v34 = ((char *)v23 - (_BYTE *)*a5) >> 3;
              uint64_t v35 = v22 - (void)*a5;
              uint64_t v36 = v35 >> 2;
              else {
                unint64_t v37 = v36;
              }
              if (v37) {
                __int16 v38 = (char *)sub_13EE4((uint64_t)(a5 + 2), v37);
              }
              else {
                __int16 v38 = 0LL;
              }
              __int16 v48 = &v38[8 * v34];
              *(void *)__int16 v48 = v56;
              unsigned __int8 v24 = v48 + 8;
              unint64_t v50 = (char *)*a5;
              uint64_t v49 = (char *)a5[1];
              if (v49 != *a5)
              {
                do
                {
                  uint64_t v51 = *((void *)v49 - 1);
                  v49 -= 8;
                  *((void *)v48 - 1) = v51;
                  v48 -= 8;
                }

                while (v49 != v50);
                uint64_t v49 = (char *)*a5;
              }

              *a5 = v48;
              a5[1] = v24;
              a5[2] = &v38[8 * v37];
              if (v49) {
                operator delete(v49);
              }
            }

            else
            {
              *uint64_t v23 = v56;
              unsigned __int8 v24 = v23 + 1;
            }

            a5[1] = v24;
            goto LABEL_83;
          }

          sub_D858();
          uint64_t v28 = qword_2C190;
          if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315906;
            __int128 v59 = "USBMIDIDevice.cpp";
            __int16 v60 = 1024;
            int v61 = 487;
            __int16 v62 = 1024;
            int v63 = v11;
            __int16 v64 = 1024;
            int v65 = BYTE1(v56);
            uint64_t v29 = (os_log_s *)v28;
            uint64_t v30 = "%25s:%-5d [?]  Unknown direction for endpoint %d: %d";
LABEL_33:
            _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, v30, buf, 0x1Eu);
          }

LABEL_83:
          int v11 = ++v12;
        }

        if (!v15) {
          goto LABEL_83;
        }
        *(_DWORD *)buf = 136315906;
        __int128 v59 = "USBMIDIDevice.cpp";
        __int16 v60 = 1024;
        int v61 = 491;
        __int16 v62 = 1024;
        int v63 = v11;
        __int16 v64 = 1024;
        int v65 = v13;
        uint64_t v29 = v14;
        uint64_t v30 = "%25s:%-5d [?]  Couldn't get pipe for endpoint %d (0x%x)";
        goto LABEL_33;
      }
    }
  }

    sub_155E4();
    uint64_t v39 = (os_log_s *)qword_2C1A0;
    if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_INFO))
    {
      SInt32 outValue = 136315394;
      v92 = "USBMIDIDeviceManager.cpp";
      uint64_t v93 = 1024;
      v94 = 319;
      _os_log_impl( &dword_0,  v39,  OS_LOG_TYPE_INFO,  "%25s:%-5d      purging stale USB MIDI cache for device...",  (uint8_t *)&outValue,  0x12u);
    }

    MIDISetupRemoveDevice(v24);
    if (value)
    {
      MIDIObjectSetIntegerProperty(Device, kMIDIPropertyUniqueID, value);
      for (uint64_t k = 0LL; MIDIDeviceGetNumberOfEntities(Device) > k; ++k)
      {
        uint64_t v41 = MIDIDeviceGetEntity(Device, k);
        MIDIObjectSetIntegerProperty( v41,  kMIDIPropertyUniqueID,  *(_DWORD *)(*(void *)(*(void *)&buf[8] + (((unint64_t)v98.i64[0] >> 7) & 0x1FFFFFFFFFFFFF8LL))
                    + 4LL * (v98.i16[0] & 0x3FF)));
        v98 = vaddq_s64(v98, (int64x2_t)xmmword_230C0);
        if (v98.i64[0] >= 0x800uLL)
        {
          operator delete(**(void ***)&buf[8]);
          *(void *)&buf[8] += 8LL;
          v98.i64[0] -= 1024LL;
        }

        for (m = 0LL; MIDIEntityGetNumberOfSources(v41) > m; ++m)
        {
          int v43 = MIDIEntityGetSource(v41, m);
          MIDIObjectSetIntegerProperty( v43,  kMIDIPropertyUniqueID,  (*(_DWORD **)((char *)&str[1]->isa + (((unint64_t)v84.i64[0] >> 7) & 0x1FFFFFFFFFFFFF8LL)))[v84.i16[0] & 0x3FF]);
          v84 = vaddq_s64(v84, (int64x2_t)xmmword_230C0);
          if (v84.i64[0] >= 0x800uLL)
          {
            operator delete(str[1]->isa);
            str[1] = (CFStringRef)((char *)str[1] + 8);
            v84.i64[0] -= 1024LL;
          }
        }

        for (n = 0LL; MIDIEntityGetNumberOfDestinations(v41) > n; ++n)
        {
          int v45 = MIDIEntityGetDestination(v41, n);
          MIDIObjectSetIntegerProperty( v45,  kMIDIPropertyUniqueID,  *(_DWORD *)(*(void *)(*(void *)&v79[2] + (((unint64_t)v81.i64[0] >> 7) & 0x1FFFFFFFFFFFFF8LL))
                      + 4LL * (v81.i16[0] & 0x3FF)));
          uint64_t v81 = vaddq_s64(v81, (int64x2_t)xmmword_230C0);
          if (v81.i64[0] >= 0x800uLL)
          {
            operator delete(**(void ***)&v79[2]);
            *(void *)&v79[2] += 8LL;
            v81.i64[0] -= 1024LL;
          }
        }
      }
    }
  }

  uint64_t v7 = MIDISetupAddDevice(Device);
  if ((_DWORD)v7)
  {
    sub_176E0(v79);
    sub_176E0(str);
    sub_176E0(buf);
  }

  else
  {
    sub_155E4();
    uint64_t v46 = (os_log_s *)qword_2C1A0;
    if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_INFO))
    {
      SInt32 outValue = 136315650;
      v92 = "USBMIDIDeviceManager.cpp";
      uint64_t v93 = 1024;
      v94 = 341;
      unint64_t v95 = 2048;
      v96 = Device;
      _os_log_impl( &dword_0,  v46,  OS_LOG_TYPE_INFO,  "%25s:%-5d      device 0x%lx added to setup",  (uint8_t *)&outValue,  0x1Cu);
    }

    sub_176E0(v79);
    sub_176E0(str);
    sub_176E0(buf);
LABEL_105:
    MIDIObjectSetIntegerProperty(Device, @"USBVendorProduct", v12);
    MIDIObjectSetIntegerProperty(Device, @"USBLocationID", v87);
    if (cf2) {
      MIDIObjectSetStringProperty(Device, @"SerialNumber", cf2);
    }
    if ((v72 & 1) != 0)
    {
      sub_155E4();
      int v47 = (os_log_s *)qword_2C1A0;
      if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "USBMIDIDeviceManager.cpp";
        *(_WORD *)&_BYTE buf[12] = 1024;
        *(_DWORD *)&buf[14] = 358;
        _os_log_impl( &dword_0,  v47,  OS_LOG_TYPE_INFO,  "%25s:%-5d      setting kMIDIPropertyPluralSerialNumber property on new device",  buf,  0x12u);
      }

      MIDIObjectSetIntegerProperty(Device, @"pluralSerial", 1);
    }

    v79[0] = 0;
    MIDIObjectGetIntegerProperty(Device, @"UMP Enabled", v79);
    (*(void (**)(CFStringRef *__return_ptr, void, uint64_t, uint64_t, uint64_t))(**(void **)(a1 + 64) + 192LL))( str,  *(void *)(a1 + 64),  a2,  v74,  Device);
    if (str[0])
    {
      if (!v74 || !v79[0])
      {
        BYTE3(str[0][15].info) = 0;
        sub_155E4();
        uint64_t v51 = (os_log_s *)qword_2C1A0;
        uint64_t v7 = 0LL;
        if (!os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_INFO)) {
          goto LABEL_127;
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "USBMIDIDeviceManager.cpp";
        *(_WORD *)&_BYTE buf[12] = 1024;
        *(_DWORD *)&buf[14] = 388;
        unint64_t v52 = "%25s:%-5d      Default pipe protocol will be legacy MIDI 1.0.";
LABEL_125:
        _os_log_impl(&dword_0, v51, OS_LOG_TYPE_INFO, v52, buf, 0x12u);
LABEL_126:
        uint64_t v7 = 0LL;
        goto LABEL_127;
      }

      sub_155E4();
      __int16 v48 = (os_log_s *)qword_2C1A0;
      if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "USBMIDIDeviceManager.cpp";
        *(_WORD *)&_BYTE buf[12] = 1024;
        *(_DWORD *)&buf[14] = 370;
        _os_log_impl( &dword_0,  v48,  OS_LOG_TYPE_INFO,  "%25s:%-5d      UMP is selected on this midiDevice; default pipe protocol will be UMP.",
          buf,
          0x12u);
      }

      uint64_t v49 = str[0];
      BYTE3(str[0][15].info) = 1;
      if (*(_BYTE *)(a1 + 97)) {
        BYTE5(v49[15].info) = 1;
      }
      if (*(_BYTE *)(a1 + 96))
      {
        sub_155E4();
        unint64_t v50 = (os_log_s *)qword_2C1A0;
        if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "USBMIDIDeviceManager.cpp";
          *(_WORD *)&_BYTE buf[12] = 1024;
          *(_DWORD *)&buf[14] = 383;
          _os_log_impl( &dword_0,  v50,  OS_LOG_TYPE_INFO,  "%25s:%-5d      [AQAMIDI] forcemidi1fallback defaults is set. Not changing alt setting.",  buf,  0x12u);
        }

        uint64_t v7 = 0LL;
        BYTE4(str[0][15].info) = 1;
        goto LABEL_127;
      }

      __int16 v66 = sub_7A20(v74);
      if (v66)
      {
        uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v66 + 176LL))(v66, 1LL);
        if (!(_DWORD)v7)
        {
          sub_155E4();
          uint64_t v51 = (os_log_s *)qword_2C1A0;
          if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "USBMIDIDeviceManager.cpp";
            *(_WORD *)&_BYTE buf[12] = 1024;
            *(_DWORD *)&buf[14] = 378;
            unint64_t v52 = "%25s:%-5d      [AQAMIDI] MIDI 2.0 alt setting selected, so device will use Universal MIDI Packets (UMP"
                  ") rather than USB MIDI 1.0 from now.";
            goto LABEL_125;
          }

          goto LABEL_126;
        }
      }

      else
      {
        uint64_t v7 = 0LL;
      }

      sub_155E4();
      unsigned __int8 v68 = (os_log_s *)qword_2C1A0;
      if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "USBMIDIDeviceManager.cpp";
        *(_WORD *)&_BYTE buf[12] = 1024;
        *(_DWORD *)&buf[14] = 380;
        _os_log_impl(&dword_0, v68, OS_LOG_TYPE_ERROR, "%25s:%-5d      Unable to set MIDI 2.0 alt setting!", buf, 0x12u);
      }

uint64_t sub_1082C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = mach_absolute_time();
  uint64_t v7 = a1[10];
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = *(unsigned __int8 *)(a2 + 64);
  unsigned __int8 v10 = sub_108A4(a1, v9);
  return (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)v7 + 168LL))( v7,  a1,  v6,  v8,  a3,  v9,  v10);
}

uint64_t sub_108A4(void *a1, int a2)
{
  for (uint64_t i = (void *)a1[17]; i != (void *)a1[18]; ++i)
  {
  }

  for (uint64_t j = (void *)a1[20]; ; ++j)
  {
    if (j == (void *)a1[21]) {
      return 1LL;
    }
  }

  return HIBYTE(*j);
}

char *sub_10904(void *a1, int *a2, int a3)
{
  uint64_t result = (char *)(*(uint64_t (**)(void *))(*a1 + 112LL))(a1);
  if ((_DWORD)result)
  {
    uint64_t v29 = a1 + 43;
    int v30 = (*(uint64_t (**)(void))(a1[43] + 16LL))();
    uint64_t result = (char *)sub_10BE0(a1, a3);
    uint64_t v7 = result;
    uint64_t v8 = a1[24];
    int v9 = a3;
    if (*a2 >= 1)
    {
      unint64_t v10 = (unint64_t)(a2 + 1);
      unsigned int v11 = *a2 + 1;
      do
      {
        uint64_t v36 = 0LL;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 __dst = 0u;
        uint64_t v12 = *(void *)v10;
        size_t v13 = *(unsigned __int16 *)(v10 + 8);
        if (v13 > 0x40)
        {
          uint64_t v14 = malloc(*(unsigned __int16 *)(v10 + 8));
          memcpy(v14, (const void *)(v10 + 10), v13);
        }

        else
        {
          memcpy(&__dst, (const void *)(v10 + 10), *(unsigned __int16 *)(v10 + 8));
          uint64_t v14 = 0LL;
        }

        __int128 v35 = __PAIR64__(v9, a3);
        LOBYTE(v36) = v7[6];
        uint64_t result = (char *)operator new(0x80uLL);
        *(_OWORD *)(result + 104) = v35;
        __int128 v15 = v33;
        *(_OWORD *)(result + 88) = v34;
        *(_OWORD *)(result + 72) = v15;
        __int128 v16 = v32;
        *(_OWORD *)(result + (*(void (**)(uint64_t))(*(void *)(v1 + 32) + 24LL))(v1 + 40) = __dst;
        *((void *)result + 1) = a1 + 54;
        *((void *)result + 2) = v12;
        *((_DWORD *)result + 6) = v13;
        *((_DWORD *)result + 7) = 0;
        *((void *)result + 4) = v14;
        *((void *)result + 15) = v36;
        *(_OWORD *)(result + 56) = v16;
        uint64_t v17 = a1[54];
        *(void *)uint64_t result = v17;
        *(void *)(v17 + 8) = result;
        a1[54] = result;
        ++a1[56];
        unint64_t v10 = (v10 + *(unsigned __int16 *)(v10 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
        --v11;
      }

      while (v11 > 1);
    }

    uint64_t v19 = a1[20];
    uint64_t v18 = a1[21];
    uint64_t v20 = v18 - v19;
    if (v18 == v19) {
      goto LABEL_16;
    }
    uint64_t v21 = 0LL;
    unint64_t v22 = v20 >> 3;
    if (v22 <= 1) {
      unint64_t v22 = 1LL;
    }
    uint64_t v23 = (unsigned __int8 *)(v19 + 6);
    while (1)
    {
      int v24 = *v23;
      v23 += 8;
      if (v22 == ++v21) {
        goto LABEL_16;
      }
    }

    if ((v21 & 0x80000000) != 0) {
LABEL_16:
    }
      __assert_rtn("Send", "USBMIDIDevice.cpp", 555, "currentBufferIndex >= 0");
    uint64_t v25 = a1[40];
    uint64_t v26 = *(void *)(v25 + 16LL * v21);
    if (v26 && !*(_BYTE *)(v26 + 44) && !*((_BYTE *)a1 + 488))
    {
      *((_BYTE *)a1 + 488) = 1;
      uint64_t v27 = a1[60];
      uint64_t v28 = mach_absolute_time();
      uint64_t result = (char *)MIDITimerTaskSetNextWakeTime(v27, v28 + 7200);
    }

    if (v30) {
      return (char *)(*(uint64_t (**)(void *))(*v29 + 24LL))(v29);
    }
  }

  return result;
}

void sub_10B9C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_3584(exception_object);
}

unsigned __int8 *sub_10BE0(void *a1, int a2)
{
  uint64_t v2 = a1[24];
  if ((int)((unint64_t)(a1[25] - v2) >> 3) > a2
    && (v3 = v2 + 8LL * a2, int v4 = *(unsigned __int8 *)(v3 + 3), *(_BYTE *)(v3 + 3))
    && (v5 = (unsigned __int8 *)a1[20], (uint64_t v6 = a1[21] - (void)v5) != 0))
  {
    unint64_t v7 = v6 >> 3;
    if (v7 <= 1) {
      unint64_t v7 = 1LL;
    }
    while (*v5 != v4)
    {
      v5 += 8;
      if (!--v7) {
        goto LABEL_8;
      }
    }
  }

  else
  {
LABEL_8:
    int v5 = (unsigned __int8 *)a1[20];
  }

  return v5;
}

void sub_10C54(uint64_t a1, int *a2, int a3)
{
  uint64_t v6 = sub_10BE0((void *)a1, a3);
  int v7 = v6[7];
  if (!v6[7])
  {
    if (a3 == 255) {
      return;
    }
    uint64_t v41 = *(void *)(a1 + 224);
    if (!v41) {
      return;
    }
LABEL_48:
    *(_DWORD *)(a1 + 220) = a3;
    (*(void (**)(uint64_t, int *))(*(void *)v41 + 16LL))(v41, a2);
    return;
  }

  int v8 = *a2;
  if (v7 != 2 && v8 == 2)
  {
    uint64_t v41 = *(void *)(a1 + 240);
    if (!v41) {
      return;
    }
    goto LABEL_48;
  }

  if (v7 == 2 && v8 == 1)
  {
    uint64_t v41 = *(void *)(a1 + 256);
    if (!v41) {
      return;
    }
    goto LABEL_48;
  }

  unsigned int v11 = v6;
  if (a3 != 255)
  {
    int v12 = a2[1];
    if (v12)
    {
      size_t v13 = a2 + 2;
      do
      {
        uint64_t v14 = v13[2];
        if ((_DWORD)v14)
        {
          __int128 v15 = v13 + 3;
          uint64_t v16 = (uint64_t)&v13[v14 + 3];
          do
          {
            unint64_t v17 = *v15;
            unint64_t v18 = v17 >> 28;
            if (*v15 >> 28) {
              BOOL v19 = (_DWORD)v18 == 15;
            }
            else {
              BOOL v19 = 1;
            }
            if (!v19) {
              *__int128 v15 = v17 & 0xF0FFFFFF | ((a3 & 0xF) << 24);
            }
            v15 += byte_230A4[v18];
          }

          while (v15 != (_DWORD *)v16);
          uint64_t v20 = v13[2];
        }

        else
        {
          uint64_t v20 = 0LL;
        }

        v13 += v20 + 3;
        --v12;
      }

      while (v12);
    }
  }

  uint64_t v21 = a1 + 344;
  int v22 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 344) + 16LL))(a1 + 344);
  int v23 = v22;
  uint64_t v24 = *(void *)(a1 + 192);
  int v25 = a3;
  int v26 = v11[6];
  int v27 = a2[1];
  if (v27)
  {
    int v28 = v22;
    uint64_t v29 = (unsigned int *)(a2 + 2);
    do
    {
      if (!v29[2]) {
        break;
      }
      sub_13FA0((uint64_t)buf, v29, a3, v25, v26);
      unint64_t v30 = *(void *)(a1 + 464);
      if (v30 >= *(void *)(a1 + 472))
      {
        uint64_t v33 = sub_14204((uint64_t *)(a1 + 456), (uint64_t)buf);
      }

      else
      {
        uint64_t v31 = sub_14334(v30, (unsigned int *)buf);
        uint64_t v32 = v51[0];
        *(void *)(v31 + 285) = *(void *)((char *)v51 + 5);
        *(void *)(v31 + 280) = v32;
        uint64_t v33 = v31 + 296;
      }

      *(void *)(a1 + 464) = v33;
      sub_1456C(v33 - 296);
      sub_13D18((uint64_t)buf);
      v29 += v29[2] + 3;
      --v27;
    }

    while (v27);
    int v26 = v11[6];
    int v23 = v28;
    uint64_t v21 = a1 + 344;
  }

  uint64_t v35 = *(void *)(a1 + 160);
  uint64_t v34 = *(void *)(a1 + 168);
  uint64_t v36 = v34 - v35;
  if (v34 == v35) {
    goto LABEL_41;
  }
  uint64_t v37 = 0LL;
  unint64_t v38 = v36 >> 3;
  if (v38 <= 1) {
    unint64_t v38 = 1LL;
  }
  uint64_t v39 = (unsigned __int8 *)(v35 + 6);
  while (1)
  {
    int v40 = *v39;
    v39 += 8;
    if (v40 == v26) {
      break;
    }
    if (v38 == ++v37) {
      goto LABEL_41;
    }
  }

  if ((v37 & 0x80000000) != 0) {
LABEL_41:
  }
    __assert_rtn("SendPackets", "USBMIDIDevice.cpp", 626, "currentBufferIndex >= 0");
  uint64_t v42 = *(void *)(a1 + 320);
  uint64_t v43 = *(void *)(v42 + 16LL * v37);
  if (v43)
  {
    if (!*(_BYTE *)(v43 + 44) && !*(_BYTE *)(a1 + 488))
    {
      *(_BYTE *)(a1 + 488) = 1;
      uint64_t v44 = *(void *)(a1 + 480);
      uint64_t v45 = mach_absolute_time();
      MIDITimerTaskSetNextWakeTime(v44, v45 + 7200);
    }
  }

  else
  {
    sub_D858();
    uint64_t v46 = (os_log_s *)qword_2C190;
    if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v48 = "USBMIDIDevice.cpp";
      __int16 v49 = 1024;
      int v50 = 629;
      _os_log_impl( &dword_0,  v46,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] USBMIDIDevice::SendPackets() - buffer not found",  buf,  0x12u);
    }
  }

  if (v23) {
    (*(void (**)(uint64_t))(*(void *)v21 + 24LL))(v21);
  }
}

void sub_11024( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_3584(exception_object);
}

uint64_t sub_11078(uint64_t a1, uint64_t a2)
{
  int v4 = (unsigned int *)(a2 + 8);
  do
    unsigned int v5 = __ldaxr(v4);
  while (__stlxr(v5 + 1, v4));
  *(_BYTE *)(a2 + 44) = 1;
  uint64_t v6 = *(unsigned __int8 *)(a2 + 64);
  uint64_t result = (*(uint64_t (**)(void, uint64_t, void, void, void (*)(uint64_t, int, unint64_t), uint64_t))(**(void **)(a1 + 104) + 264LL))( *(void *)(a1 + 104),  v6,  *(void *)(a2 + 24),  *(unsigned int *)(a2 + 40),  sub_11138,  a2);
  if ((_DWORD)result == -536854449 || (_DWORD)result == -536870163) {
    return (*(uint64_t (**)(void, uint64_t, void, void, void (*)(uint64_t, int, unint64_t), uint64_t))(**(void **)(a1 + 104) + 264LL))( *(void *)(a1 + 104),  v6,  *(void *)(a2 + 24),  *(unsigned int *)(a2 + 40),  sub_11138,  a2);
  }
  return result;
}

void sub_11138(uint64_t a1, int a2, unint64_t a3)
{
  *(_BYTE *)(a1 + 44) = 0;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
  unint64_t v18 = 0LL;
  unsigned int v5 = *(std::__shared_weak_count **)(a1 + 56);
  if (!v5) {
    goto LABEL_23;
  }
  unint64_t v18 = std::__shared_weak_count::lock(v5);
  if (!v18) {
    goto LABEL_23;
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (!v8 || a2 == -536870165 || *(_BYTE *)(v8 + 184)) {
    goto LABEL_23;
  }
  if (!a2)
  {
    *(_BYTE *)(v8 + 185) = 1;
    if (a3 < 5)
    {
      if (*(_BYTE *)(v8 + 188))
      {
LABEL_22:
        (*(void (**)(uint64_t, uint64_t))(*(void *)v8 + 64LL))(v8, a1);
        goto LABEL_23;
      }
    }

    else if (*(_BYTE *)(v8 + 188))
    {
      int v9 = *(unsigned __int8 *)(a1 + 64);
      unint64_t v10 = *(uint64_t **)(v8 + 112);
      unsigned int v11 = *(uint64_t **)(v8 + 120);
      if (v10 != v11)
      {
        while (*(unsigned __int8 *)(*v10 + 46) != v9)
        {
          v10 += 2;
          if (v10 == v11) {
            goto LABEL_20;
          }
        }
      }

      if (v11 == v10)
      {
LABEL_20:
        sub_D858();
        int v12 = (os_log_s *)qword_2C190;
        if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v20 = "USBMIDIDevice.cpp";
          __int16 v21 = 1024;
          int v22 = 694;
          __int16 v23 = 1024;
          int v24 = v9;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d [!] No negotiator for pipeIndex %d", buf, 0x18u);
        }
      }

      else
      {
        sub_A3E4(*v10, a1, a3);
      }

      goto LABEL_22;
    }

    (*(void (**)(uint64_t, uint64_t, unint64_t))(*(void *)v8 + 80LL))(v8, a1, a3);
    goto LABEL_22;
  }

  if (a2 == -536870163
    && !(*(unsigned int (**)(void, uint64_t))(**(void **)(v8 + 104) + 224LL))(*(void *)(v8 + 104), v4))
  {
    goto LABEL_22;
  }

LABEL_23:
  size_t v13 = (unsigned int *)(a1 + 8);
  do
  {
    unsigned int v14 = __ldaxr(v13);
    unsigned int v15 = v14 - 1;
  }

  while (__stlxr(v15, v13));
  if (!v15) {
    (*(void (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
  }
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      unint64_t v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }

void sub_1137C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned int v11 = v9 + 2;
  do
  {
    unsigned int v12 = __ldaxr(v11);
    unsigned int v13 = v12 - 1;
  }

  while (__stlxr(v13, v11));
  if (!v13) {
    (*(void (**)(unsigned int *))(*(void *)v9 + 16LL))(v9);
  }
  sub_624C((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_113D4(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 491) || (uint64_t v2 = *(void *)(a1 + 456), v2 == *(void *)(a1 + 464)))
  {
    if (!*(void *)(a1 + 448)) {
      return;
    }
    int v4 = 0;
    uint64_t v3 = (unsigned __int8 *)(*(void *)(a1 + 440) + 120LL);
  }

  else
  {
    uint64_t v3 = (unsigned __int8 *)(v2 + 292);
    int v4 = 1;
  }

  uint64_t v5 = *v3;
  unsigned __int8 v6 = sub_108A4((void *)a1, *v3);
  uint64_t v8 = *(void *)(a1 + 160);
  uint64_t v7 = *(void *)(a1 + 168);
  uint64_t v9 = v7 - v8;
  if (v7 == v8) {
    goto LABEL_12;
  }
  uint64_t v10 = 0LL;
  unint64_t v11 = v9 >> 3;
  if (v11 <= 1) {
    unint64_t v11 = 1LL;
  }
  unsigned int v12 = (unsigned __int8 *)(v8 + 6);
  while (1)
  {
    int v13 = *v12;
    v12 += 8;
    if (v13 == (_DWORD)v5) {
      break;
    }
    if (v11 == ++v10) {
      goto LABEL_12;
    }
  }

  if ((v10 & 0x80000000) != 0) {
LABEL_12:
  }
    sub_21160();
  uint64_t v14 = *(void *)(a1 + 320);
  uint64_t v15 = *(void *)(v14 + 16LL * v10);
  if (!v15)
  {
    sub_D858();
    uint64_t v22 = qword_2C190;
    if (!os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v31 = 136315650;
    uint64_t v32 = "USBMIDIDevice.cpp";
    __int16 v33 = 1024;
    int v34 = 723;
    __int16 v35 = 1024;
    int v36 = v5;
    __int16 v23 = "%25s:%-5d [!] USBMIDIDevice::DoWrite() - Buffer not found for pipeIndex = %d";
    int v24 = (os_log_s *)v22;
    uint32_t v25 = 24;
    goto LABEL_37;
  }

  uint64_t v16 = 176LL;
  if (v4)
  {
    uint64_t v16 = 184LL;
    uint64_t v17 = a1 + 456;
  }

  else
  {
    uint64_t v17 = a1 + 432;
  }

  uint64_t v18 = (*(uint64_t (**)(void, uint64_t, uint64_t, void, void, void))(**(void **)(a1 + 80) + v16))( *(void *)(a1 + 80),  a1,  v17,  *(void *)(v15 + 24),  *(unsigned int *)(v15 + 40),  v6);
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)(a1 + 160);
    uint64_t v21 = *(void *)(a1 + 168);
    if (v20 != v21)
    {
      while (*(unsigned __int8 *)(v20 + 6) != (_DWORD)v5)
      {
        v20 += 8LL;
        if (v20 == v21) {
          goto LABEL_35;
        }
      }
    }

    if (v20 != v21)
    {
      int v26 = (unsigned int *)(v15 + 8);
      do
        unsigned int v27 = __ldaxr(v26);
      while (__stlxr(v27 + 1, v26));
      *(_BYTE *)(v15 + 44) = 1;
      int v28 = (*(uint64_t (**)(void, uint64_t, void, uint64_t, void (*)(uint64_t, int), uint64_t))(**(void **)(a1 + 104) + 272LL))( *(void *)(a1 + 104),  v5,  *(void *)(v15 + 24),  v18,  sub_116D8,  v15);
      if (v28 == -536854449 || v28 == -536870163) {
        (*(void (**)(void, uint64_t, void, uint64_t, void (*)(uint64_t, int), uint64_t))(**(void **)(a1 + 104) + 272LL))( *(void *)(a1 + 104),  v5,  *(void *)(v15 + 24),  v19,  sub_116D8,  v15);
      }
      return;
    }

LABEL_35:
    sub_D858();
    uint64_t v30 = qword_2C190;
    if (!os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v31 = 136315394;
    uint64_t v32 = "USBMIDIDevice.cpp";
    __int16 v33 = 1024;
    int v34 = 758;
    __int16 v23 = "%25s:%-5d [!] USBMIDIDevice::DoWrite() - Missing pipe for queued element";
    int v24 = (os_log_s *)v30;
    uint32_t v25 = 18;
LABEL_37:
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v31, v25);
  }

void sub_116D8(uint64_t a1, int a2)
{
  uint64_t v15 = 0LL;
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 56);
  if (v3 && (uint64_t v15 = std::__shared_weak_count::lock(v3)) != 0LL)
  {
    uint64_t v14 = *(void *)(a1 + 48);
    *(_BYTE *)(a1 + 44) = 0;
    if (v14)
    {
      int v5 = (*(uint64_t (**)(uint64_t))(*(void *)(v14 + 344) + 16LL))(v14 + 344);
      if (a2) {
        (*(void (**)(void, void))(**(void **)(v14 + 104) + 360LL))( *(void *)(v14 + 104),  *(unsigned __int8 *)(a1 + 64));
      }
      else {
        *(_BYTE *)(v14 + 186) = 1;
      }
      uint64_t v9 = (unsigned int *)(a1 + 8);
      do
      {
        unsigned int v10 = __ldaxr(v9);
        unsigned int v11 = v10 - 1;
      }

      while (__stlxr(v11, v9));
      if (!v11) {
        (*(void (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
      }
      if (!a2 && !*(_BYTE *)(v14 + 184)) {
        (*(void (**)(uint64_t))(*(void *)v14 + 72LL))(v14);
      }
      if (v5) {
        (*(void (**)(uint64_t))(*(void *)(v14 + 344) + 24LL))(v14 + 344);
      }
      goto LABEL_21;
    }
  }

  else
  {
    *(_BYTE *)(a1 + 44) = 0;
  }

  unsigned __int8 v6 = (unsigned int *)(a1 + 8);
  do
  {
    unsigned int v7 = __ldaxr(v6);
    unsigned int v8 = v7 - 1;
  }

  while (__stlxr(v8, v6));
  if (!v8) {
    (*(void (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
  }
LABEL_21:
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      unint64_t v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }

void sub_11848( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_11880(uint64_t a1, int a2)
{
  uint64_t v3 = (os_log_s *)qword_2C190;
  if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_DEBUG))
  {
    int v4 = "false";
    *(_DWORD *)buf = 136315650;
    int v24 = "USBMIDIDevice.cpp";
    if (a2) {
      int v4 = "true";
    }
    __int16 v25 = 1024;
    int v26 = 897;
    __int16 v27 = 2080;
    *(void *)int v28 = v4;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [+] USBMIDIDevice::ReconstructPortMapList(forUMP = %s)",  buf,  0x1Cu);
  }

  *(void *)(a1 + 200) = *(void *)(a1 + 192);
  int v5 = MIDIDeviceGetNumberOfEntities(*(_DWORD *)(a1 + 8)) - *(unsigned __int8 *)(a1 + 189);
  if (v5 >= 1)
  {
    ItemCount v6 = 0LL;
    uint64_t v20 = v5;
    do
    {
      SInt32 outValue = 0;
      MIDIEntityRef Entity = MIDIDeviceGetEntity(*(_DWORD *)(a1 + 8), v6);
      if (MIDIObjectGetIntegerProperty(Entity, @"Cable", &outValue)) {
        uint8_t v8 = v6;
      }
      else {
        uint8_t v8 = outValue;
      }
      else {
        uint8_t v9 = outValue;
      }
      else {
        uint8_t v10 = outValue;
      }
      else {
        unsigned __int8 v11 = 0;
      }
      if (MIDIObjectGetIntegerProperty(Entity, @"Group Terminal Block ID", &outValue)) {
        unsigned __int8 v12 = 0;
      }
      else {
        unsigned __int8 v12 = outValue;
      }
      if (MIDIObjectGetIntegerProperty(Entity, @"First Group", &outValue)) {
        char v13 = 0;
      }
      else {
        char v13 = outValue;
      }
      if (MIDIObjectGetIntegerProperty(Entity, @"Number of Groups", &outValue)) {
        unsigned __int8 v14 = 0;
      }
      else {
        unsigned __int8 v14 = outValue;
      }
      sub_D858();
      uint64_t v15 = (os_log_s *)qword_2C190;
      if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136317186;
        int v24 = "USBMIDIDevice.cpp";
        __int16 v25 = 1024;
        int v26 = 923;
        __int16 v27 = 1024;
        *(_DWORD *)int v28 = v6;
        *(_WORD *)&v28[4] = 1024;
        *(_DWORD *)&v28[6] = v8;
        __int16 v29 = 1024;
        int v30 = v9;
        __int16 v31 = 1024;
        int v32 = v10;
        __int16 v33 = 1024;
        int v34 = v11;
        __int16 v35 = 1024;
        int v36 = v12;
        __int16 v37 = 1024;
        int v38 = v14;
        _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      MIDIPortMap(entity %d, cable %d, inEP 0x%x, outEP 0x%x, protocol %d, gtbID %d, numGroups %d => mMapList",  buf,  0x3Cu);
      }

      buf[0] = v6;
      buf[1] = v8;
      buf[2] = v9;
      buf[3] = v10;
      LOBYTE(v24) = v11;
      BYTE1(v24) = v13;
      BYTE2(v24) = v14;
      BYTE3(v24) = v12;
      uint64_t v16 = *(_BYTE **)(a1 + 200);
      if ((unint64_t)v16 >= *(void *)(a1 + 208))
      {
        uint64_t v17 = sub_145FC((uint64_t *)(a1 + 192), buf);
      }

      else
      {
        _BYTE *v16 = v6;
        v16[1] = v8;
        char v16[2] = v9;
        char v16[3] = v10;
        v16[4] = v11;
        v16[5] = v13;
        v16[6] = v14;
        uint64_t v17 = (uint64_t)(v16 + 8);
        v16[7] = v12;
      }

      *(void *)(a1 + 200) = v17;
      ++v6;
    }

    while (v20 != v6);
  }

  sub_D858();
  uint64_t v18 = (os_log_s *)qword_2C190;
  if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = (uint64_t)(*(void *)(a1 + 200) - *(void *)(a1 + 192)) >> 3;
    *(_DWORD *)buf = 136315650;
    int v24 = "USBMIDIDevice.cpp";
    __int16 v25 = 1024;
    int v26 = 926;
    __int16 v27 = 2048;
    *(void *)int v28 = v19;
    _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [-] USBMIDIDevice::ReconstructPortMapList() - %lu port map(s) created",  buf,  0x1Cu);
  }

BOOL sub_11C6C(uint64_t a1)
{
  return *(void *)(a1 + 136) != *(void *)(a1 + 144);
}

BOOL sub_11C7C(uint64_t a1)
{
  return *(void *)(a1 + 160) != *(void *)(a1 + 168);
}

void *sub_11C8C(void *a1)
{
  *a1 = off_28A68;
  (*(void (**)(void *))(a1[1] + 24LL))(a1 + 2);
  return a1;
}

void sub_11CD0(void *a1)
{
  *a1 = off_28A68;
  (*(void (**)(void *))(a1[1] + 24LL))(a1 + 2);
  operator delete(a1);
}

uint64_t sub_11D14(uint64_t a1, _DWORD *a2)
{
  if (*a2 == 2)
  {
    unsigned int v7 = *(_DWORD **)(a1 + 8);
    (*((void (**)(void *, uint64_t))v7 + 1))(v8, a1 + 16);
    void v8[7] = 1LL;
    v8[6] = &v9;
    v5[0] = a1;
    v5[1] = &v7;
    ItemCount v6 = v5;
    sub_11F28((uint64_t)a2, &v6);
    return sub_12688((uint64_t)&v7);
  }

  else
  {
    if (*a2 != 1) {
      std::terminate();
    }
    unsigned int v7 = a2;
    return (**(uint64_t (***)(uint64_t, _DWORD **))(a1 + 8))(a1 + 16, &v7);
  }

void sub_11DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

uint64_t sub_11E10(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 + 8);
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v6, a1 + 16);
  uint64_t v7 = v5;
  (*(void (**)(void *, _BYTE *))(v5 + 8))(v8, v6);
  void v8[7] = 1LL;
  v8[6] = &v9;
  int v4 = (unsigned int *)&v7;
  sub_126F8(a2, &v4);
  sub_12688((uint64_t)&v7);
  return (*(uint64_t (**)(_BYTE *))(v5 + 24))(v6);
}

void sub_11EE0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (a2) {
    sub_3584(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_11F28(uint64_t result, uint64_t **a2)
{
  if (*(_DWORD *)(result + 4))
  {
    uint64_t v3 = result;
    unsigned int v4 = 0;
    uint64_t v5 = result + 8;
    do
    {
      uint64_t v6 = *(unsigned int *)(v5 + 8);
      v12[0] = v5 + 12;
      v12[1] = v6;
      uint64_t v12[2] = *(void *)v5;
      void v12[3] = 0LL;
      uint64_t v9 = 0LL;
      uint64_t v10 = 0LL;
      uint64_t result = sub_5338(v12, &v11, &v9);
      if ((_DWORD)result)
      {
        do
        {
          uint64_t v7 = *a2;
          uint64_t v14 = v11;
          uint64_t v8 = *v7;
          v13[0] = v7[1];
          v13[1] = &v14;
          sub_11FF8((unsigned int *)(v8 + 64), (int *)&v9, (uint64_t)v13);
          uint64_t v9 = 0LL;
          uint64_t v10 = 0LL;
          uint64_t result = sub_5338(v12, &v11, &v9);
        }

        while ((result & 1) != 0);
      }

      v5 += 4LL * *(unsigned int *)(v5 + 8) + 12;
      ++v4;
    }

    while (v4 < *(_DWORD *)(v3 + 4));
  }

  return result;
}

unsigned int *sub_11FF8(unsigned int *result, int *__src, uint64_t a3)
{
  unint64_t v3 = *__src;
  if (v3 >> 28 == 4)
  {
    unsigned int v5 = BYTE3(v3) & 0xF | 0x20;
    unsigned int v6 = __src[1];
    switch(BYTE2(v3) >> 4)
    {
      case 2:
      case 3:
        uint64_t v9 = &result[12 * (BYTE3(v3) & 0xF)];
        uint64_t v10 = (v3 >> 16) & 0xF;
        uint64_t v11 = (unsigned __int8 *)v9 + 3 * v10;
        unsigned int v12 = (v3 >> 8) & 0x7F;
        int v13 = *__src & 0x7F;
        int v14 = (v6 >> 18) & 0x7F;
        if ((v3 & 0x100000) != 0) {
          int v15 = 2;
        }
        else {
          int v15 = 1;
        }
        if (v15 == *v11 && v12 == v11[1])
        {
          int v16 = v10 | 0xB0;
          if (v13 == *((unsigned __int8 *)v9 + 3 * v10 + 2))
          {
            int v17 = (v5 << 24) | (v16 << 16);
            goto LABEL_20;
          }
        }

        else
        {
          int v16 = v10 | 0xB0;
        }

        if ((v3 & 0x100000) != 0) {
          int v18 = 25344;
        }
        else {
          int v18 = 25856;
        }
        int v26 = 0;
        *(_DWORD *)&__srca[8] = 0;
        int v17 = (v5 << 24) | (v16 << 16);
        int v19 = v17 | v18;
        char v24 = v12;
        *(void *)char __srca = v17 | v18 | v12;
        sub_12308(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__srca);
        int v26 = 0;
        *(_DWORD *)&__srca[8] = 0;
        *(void *)char __srca = (v19 | v13) - 256;
        sub_12308(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__srca);
        unsigned __int8 *v11 = v15;
        uint64_t v20 = (char *)v9 + 3 * v10;
        v20[1] = v24;
        v20[2] = v13;
LABEL_20:
        int v26 = 0;
        *(_DWORD *)&__srca[8] = 0;
        *(void *)char __srca = v17 | (v6 >> 25) | 0x600;
        uint64_t result = sub_12308(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__srca);
        if (v14)
        {
          int v26 = 0;
          *(void *)&__srca[4] = 0LL;
          int v8 = v14 | v17 | 0x2600;
          goto LABEL_28;
        }

        break;
      case 8:
      case 9:
      case 10:
      case 11:
        unsigned int v7 = BYTE2(v3) >> 4 == 9;
        if (v6 >> 25) {
          unsigned int v7 = v6 >> 25;
        }
        int v26 = 0;
        *(void *)&__srca[4] = 0LL;
        int v8 = v7 | (BYTE2(v3) << 16) | (v5 << 24) | v3 & 0x7F00;
        goto LABEL_28;
      case 12:
        if ((v3 & 1) != 0)
        {
          int v26 = 0;
          *(_DWORD *)&__srca[8] = 0;
          unsigned int v21 = v5 << 24;
          int v22 = BYTE2(v3) << 16;
          int v23 = (v22 - 0x100000) | (v5 << 24);
          *(void *)char __srca = (v22 - 0x100000) & 0xFFFFFF80 | (v5 << 24) | (v6 >> 8) & 0x7F;
          sub_12308(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__srca);
          int v26 = 0;
          *(_DWORD *)&__srca[8] = 0;
          *(void *)char __srca = v23 & 0xFFFFFF80 | v6 & 0x7F | 0x2000;
          sub_12308(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__srca);
        }

        else
        {
          unsigned int v21 = v5 << 24;
          int v22 = BYTE2(v3) << 16;
        }

        int v26 = 0;
        *(void *)&__srca[4] = 0LL;
        int v8 = HIWORD(v6) & 0x7F00 | v21 | v22;
        goto LABEL_28;
      case 13:
        int v26 = 0;
        *(void *)&__srca[4] = 0LL;
        int v8 = (BYTE2(v3) << 16) | (v5 << 24) | (v6 >> 25 << 8);
        goto LABEL_28;
      case 14:
        int v26 = 0;
        *(void *)&__srca[4] = 0LL;
        int v8 = (v6 >> 10) & 0x7F00 | (BYTE2(v3) << 16) | (v5 << 24) | (v6 >> 25);
LABEL_28:
        *(_DWORD *)char __srca = v8;
        return sub_12308(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__srca);
      default:
        return result;
    }
  }

  return result;
}

unsigned int *sub_12308(unsigned int *result, uint64_t a2, int *__src)
{
  unint64_t v3 = result;
  unint64_t v4 = *__src;
  uint64_t v5 = byte_23208[v4 >> 28];
  unsigned int v6 = (unsigned int *)*((void *)result + 7);
  if (!byte_23208[v4 >> 28])
  {
    if (v6) {
      goto LABEL_47;
    }
    goto LABEL_38;
  }

  unint64_t v7 = (unint64_t)(result + 272);
  int v8 = v4 & 0xF0000000;
  unsigned int v9 = result[17];
  if (v6) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    unsigned int v11 = v6[2];
    BOOL v12 = v11 >= 2;
    unsigned int v13 = v11 - 2;
    if (v12 && v6[3] >> 28 == 3)
    {
      unsigned int v14 = v6[v13 + 3];
      if (v14 >> 28 == 3) {
        int v15 = (v14 >> 20) & 0xF;
      }
      else {
        int v15 = 255;
      }
      if (v15) {
        BOOL v16 = v15 == 3;
      }
      else {
        BOOL v16 = 1;
      }
      char v17 = v16;
      int v18 = 1;
LABEL_27:
      if ((v4 & 0xF0E00000) != 0x30000000)
      {
        BOOL v19 = (v8 != 805306368) != v18 && *(void *)v6 == a2;
        if (v19 && (v17 & 1) == 0)
        {
LABEL_34:
          uint64_t v20 = v6[2];
LABEL_38:
          uint64_t result = (unsigned int *)sub_124D8((uint64_t)result, a2, __src, v5);
          unsigned int v6 = result;
          goto LABEL_47;
        }
      }

      goto LABEL_36;
    }

LABEL_26:
    int v18 = 0;
    char v17 = 0;
    goto LABEL_27;
  }

  if (!v9) {
    goto LABEL_37;
  }
  if (v6) {
    goto LABEL_26;
  }
  if (v8 != 805306368) {
    goto LABEL_34;
  }
LABEL_36:
  v6 += v6[2] + 3;
LABEL_37:
  LODWORD(v20) = 0;
  result[17] = v9 + 1;
  *(void *)unsigned int v6 = a2;
  _BYTE v6[2] = 0;
LABEL_40:
  uint64_t result = &v6[v20 + 3];
  switch((int)v5)
  {
    case 1:
      goto LABEL_44;
    case 2:
      goto LABEL_43;
    case 3:
      goto LABEL_42;
    case 4:
      int v21 = *__src++;
      char *result = v21;
      uint64_t result = &v6[v20 + 4];
LABEL_42:
      int v22 = *__src++;
      *result++ = v22;
LABEL_43:
      int v23 = *__src++;
      *result++ = v23;
LABEL_44:
      char *result = *__src;
      break;
    default:
      uint64_t result = (unsigned int *)memmove(result, __src, 4 * v5);
      break;
  }

  v6[2] += v5;
LABEL_47:
  *((void *)v3 + 7) = v6;
  return result;
}

uint64_t sub_124D8(uint64_t a1, uint64_t a2, int *a3, uint64_t a4)
{
  if (!*(_DWORD *)(a1 + 68)) {
    goto LABEL_4;
  }
  uint64_t v17 = a1 + 64;
  (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v17);
  *(_DWORD *)(a1 + 68) = 0;
  uint64_t v8 = a1 + 72;
  if (!a4) {
    return v8;
  }
  if (v8 + 4 * a4 + 12 <= (unint64_t)(a1 + 1088))
  {
    *(_DWORD *)(a1 + 68) = 1;
    *(void *)(a1 + 72) = a2;
    *(_DWORD *)(a1 + 80) = 0;
    unsigned int v11 = (int *)(a1 + 84);
    int v12 = 0;
    switch((4 * a4) >> 2)
    {
      case 0LL:
        break;
      case 1LL:
        goto LABEL_12;
      case 2LL:
        goto LABEL_11;
      case 3LL:
        goto LABEL_10;
      case 4LL:
        int v13 = *a3++;
        unsigned int v11 = (int *)(a1 + 88);
        *(_DWORD *)(a1 + 84) = v13;
LABEL_10:
        int v14 = *a3++;
        *v11++ = v14;
LABEL_11:
        int v15 = *a3++;
        *v11++ = v15;
LABEL_12:
        int *v11 = *a3;
        int v12 = *(_DWORD *)(a1 + 80);
        break;
      default:
        memmove(v11, a3, 4 * a4);
        int v12 = 0;
        break;
    }

    *(_DWORD *)(a1 + 80) = v12 + a4;
  }

  else
  {
LABEL_4:
    MIDI::EventList::create(&v17, *(unsigned int *)(a1 + 64), a2, a3, a4);
    uint64_t v19 = v17;
    (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v19);
    uint64_t v9 = v17;
    uint64_t v17 = 0LL;
    if (v9)
    {
      v18();
      uint64_t v10 = v17;
      uint64_t v8 = a1 + 72;
      *(void *)(a1 + 56) = a1 + 72;
      *(_DWORD *)(a1 + 68) = 0;
      uint64_t v17 = 0LL;
      if (v10) {
        v18();
      }
    }

    else
    {
      uint64_t v8 = a1 + 72;
      *(void *)(a1 + 56) = a1 + 72;
      *(_DWORD *)(a1 + 68) = 0;
    }
  }

  return v8;
}

void sub_12664( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void (*a11)(void))
{
  if (a10) {
    a11();
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_12688(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 68))
  {
    uint64_t v3 = a1 + 64;
    (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v3);
  }

  *(_DWORD *)(a1 + 68) = 0;
  *(void *)(a1 + 56) = a1 + 72;
  (*(void (**)(uint64_t))(*(void *)a1 + 24LL))(a1 + 8);
  return a1;
}

uint64_t sub_126F8(uint64_t result, unsigned int **a2)
{
  if (*(_DWORD *)result)
  {
    uint64_t v3 = (unsigned int *)result;
    unsigned int v4 = 0;
    unint64_t v5 = result + 4;
    do
    {
      uint64_t v6 = *(unsigned __int16 *)(v5 + 8);
      v10[0] = v5 + 10;
      v10[1] = v6;
      v10[2] = *(void *)v5;
      void v10[3] = 0LL;
      uint64_t __src = 0LL;
      uint64_t v8 = 0LL;
      uint64_t result = sub_127AC(v10, v9, &__src);
      if ((_DWORD)result)
      {
        do
        {
          sub_12308(*a2, *(uint64_t *)v9, (int *)&__src);
          uint64_t __src = 0LL;
          uint64_t v8 = 0LL;
          uint64_t result = sub_127AC(v10, v9, &__src);
        }

        while ((result & 1) != 0);
      }

      unint64_t v5 = (v5 + *(unsigned __int16 *)(v5 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
      ++v4;
    }

    while (v4 < *v3);
  }

  return result;
}

uint64_t sub_127AC(uint64_t *a1, void *a2, _DWORD *a3)
{
  unint64_t v3 = a1[1];
  unint64_t v4 = a1[3];
  if (v4 >= v3) {
    return 0LL;
  }
  uint64_t v5 = *a1;
  unsigned int v6 = *(unsigned __int8 *)(*a1 + v4);
  if (*(char *)(*a1 + v4) < -16)
  {
LABEL_3:
    uint64_t v7 = 2LL;
    if ((v6 & 0xE0) != 0xC0) {
      uint64_t v7 = 3LL;
    }
    unint64_t v8 = v7 + v4;
    BOOL v9 = v7 + v4 > v3;
    BOOL v10 = v7 + v4 <= v3;
    if (!v9)
    {
      uint64_t v11 = v4 + v5;
      int v12 = *(_BYTE *)(v4 + v5 + 1) & 0x7F;
      if ((v6 & 0xE0) == 0xC0) {
        int v13 = 0;
      }
      else {
        int v13 = *(_BYTE *)(v11 + 2) & 0x7F;
      }
      *a3 = v13 | (v6 << 16) | (v12 << 8) | 0x20000000;
      *a2 = a1[2];
      unint64_t v3 = v8;
    }

    goto LABEL_19;
  }

LABEL_8:
  if (v6 < 0xF1)
  {
    if (v6 == 240) {
      int v18 = 1;
    }
    else {
      int v18 = 2;
    }
    if (v6 == 240) {
      a1[3] = ++v4;
    }
    unint64_t v19 = 0LL;
    int v20 = 0;
    int v21 = 0;
    while (1)
    {
      int v22 = (v4 < v3) | v20;
      if (v4 < v3 && (v20 & 1) == 0)
      {
        int v23 = *(char *)(v5 + v4);
        if ((v23 & 0x80000000) == 0)
        {
          if (v19 > 5)
          {
            int v22 = 0;
            goto LABEL_42;
          }

          int v22 = 0;
          a1[3] = ++v4;
          ++v21;
          goto LABEL_40;
        }

        if (v23 == -9) {
          a1[3] = ++v4;
        }
        if (v18 == 1) {
          int v18 = 0;
        }
        else {
          int v18 = 3;
        }
        int v22 = 1;
      }

      if (v19 <= 5)
      {
        LOBYTE(v23) = 0;
LABEL_40:
        v29[v19] = v23;
      }

LABEL_42:
      ++v19;
      int v20 = v22;
      if (v19 == 7)
      {
        unsigned int v24 = bswap32(v30);
        *a3 = (v18 << 20) | (v21 << 16) | (v29[0] << 8) | v29[1] | 0x30000000;
        a3[1] = v24;
        *a2 = a1[2];
        return 1LL;
      }
    }
  }

  if (v6 == 247)
  {
    *(void *)a3 = 808452096LL;
    *a2 = a1[2];
    unint64_t v25 = v4 + 1;
    goto LABEL_53;
  }

  uint64_t v14 = byte_2C070[v6 - 240];
  if (!byte_2C070[v6 - 240])
  {
    unint64_t v15 = v4;
    while (1)
    {
      unint64_t v4 = v15 + 1;
      a1[3] = v15 + 1;
      if (v15 + 1 >= v3) {
        return 0LL;
      }
      int v16 = *(char *)(v5 + v15++ + 1);
      if (v16 < 0)
      {
        unsigned int v6 = *(unsigned __int8 *)(v5 + v4);
        goto LABEL_3;
      }
    }
  }

  unint64_t v25 = v4 + v14;
  if (v4 + v14 > v3)
  {
    BOOL v10 = 0LL;
LABEL_19:
    a1[3] = v3;
    return v10;
  }

  if (v14 < 2)
  {
    int v27 = 0;
    goto LABEL_51;
  }

  uint64_t v26 = v4 + v5;
  int v27 = *(_BYTE *)(v4 + v5 + 1) & 0x7F;
  if ((_DWORD)v14 == 2)
  {
LABEL_51:
    int v28 = 0;
    goto LABEL_52;
  }

  int v28 = *(_BYTE *)(v26 + 2) & 0x7F;
LABEL_52:
  *a3 = (v6 << 16) | (v27 << 8) | v28 | 0x10000000;
  *a2 = a1[2];
LABEL_53:
  a1[3] = v25;
  return 1LL;
}

          int v40 = qword_23188[(v21 >> 24) & 0xF] - 1LL;
          uint64_t v41 = v21 & 0x7F;
          uint64_t v42 = ((_DWORD)v40 << 16) & 0xEF0000LL;
          uint64_t v43 = v21 & 0x7F00;
          if (!v40) {
            uint64_t v43 = 0LL;
          }
          if (v40 >= 2) {
            uint64_t v44 = v41;
          }
          else {
            uint64_t v44 = 0LL;
          }
          int v27 = v42 | ((_DWORD)v19 << 24) | 0x30100000u | v43 | v44;
LABEL_48:
          *(void *)words = v27;
          goto LABEL_79;
        }
      }

      else if (BYTE2(v21) == 240)
      {
        goto LABEL_42;
      }

      if ((~(_DWORD)v21 & 0xF000000) == 0 && ((~(_DWORD)v21 & 0xF80000) != 0 || (v21 & 0xFB0000) == 0xF90000))
      {
        unsigned __int8 v57 = *v20;
        char *v20 = v57 + 1;
        *((_BYTE *)v18 + v57) = v24;
        uint64_t v58 = sub_1F0B4((unsigned __int8 *)v18);
        if (!v58) {
          goto LABEL_81;
        }
        if (v58 == 4)
        {
          *(void *)words = ((unint64_t)*(unsigned int *)v16 >> 4) & 0xF000000 | ((unint64_t)(*(_BYTE *)v18 & 0x7F) << 8) | *((_BYTE *)v18 + 1) & 0x7F | 0x30220000;
          __int128 v59 = v17;
          __int16 v60 = a2;
          int v61 = 2LL;
          goto LABEL_95;
        }

        int v65 = *(unsigned __int8 *)v18;
        int v67 = (v65 + 15) < 8u && ((0xA7u >> (v65 + 15)) & 1) != 0 || v65 > 0xF9 && v65 != 253;
        __int16 v64 = 0LL;
        unsigned __int8 v68 = 1 << (v58 & 0xF);
        if ((v68 & 0x7F00) == 0 && (v68 & 0xC) == 0)
        {
          if ((v68 & 0x8020) == 0) {
            goto LABEL_94;
          }
          if (!v67)
          {
            __int16 v64 = 0LL;
            goto LABEL_94;
          }
        }

        __int16 v64 = (unint64_t)(v18[1] & 0x7F) << 24;
        goto LABEL_94;
      }

      uint64_t v46 = (BYTE2(v21) + 15) < 8u && ((0xA7u >> (BYTE2(v21) + 15)) & 1) != 0
         || BYTE2(v21) > 0xF9u && BYTE2(v21) != 253;
      __int16 v62 = 0;
      int v63 = 1 << v23;
      if ((v63 & 0x7F00) == 0 && (v63 & 0xC) == 0)
      {
        if ((v63 & 0x8020) == 0)
        {
LABEL_93:
          __int16 v64 = v62;
LABEL_94:
          *(void *)words = v64;
          uint64_t v93 = 0LL;
          int v61 = byte_23208[v64 >> 28];
          __int128 v59 = v17;
          __int16 v60 = a2;
LABEL_95:
          uint64_t v17 = MIDIEventListAdd((MIDIEventList *)evtlist, 0x200uLL, v59, v60, v61, words);
          if (!v17) {
            goto LABEL_113;
          }
          goto LABEL_81;
        }

        if (!v46)
        {
          __int16 v62 = 0;
          goto LABEL_93;
        }
      }

      __int16 v62 = (*(_DWORD *)v16 & 0x7F) << 24;
      goto LABEL_93;
    }
  }

  else
  {
    v72 = MIDIPacketListInit((MIDIPacketList *)evtlist);
    if (a4 >= 1)
    {
      unsigned __int8 v73 = v72;
      int v74 = 0LL;
      uint64_t v75 = 0;
      v91 = 0;
      do
      {
        uint64_t v76 = (unint64_t)v10;
        uint64_t v77 = *v7;
        BOOL v78 = v77 & 0xF;
        if (v78 < 2)
        {
LABEL_151:
          v83 = v74;
        }

        else
        {
          BOOL v79 = *(_DWORD *)(a1 + 12);
          else {
            uint64_t v80 = v77 >> 4;
          }
          if (v75 && v80 != v91)
          {
            MIDIReceived(*(_DWORD *)(*(void *)(a1 + 16) + 4LL * (int)v91), (const MIDIPacketList *)evtlist);
            unsigned __int8 v73 = MIDIPacketListInit((MIDIPacketList *)evtlist);
            int v74 = 0LL;
          }

          if ((v80 & 0x80000000) == 0)
          {
            uint64_t v81 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 2 <= (unint64_t)v80 ? v91 : v80;
            v91 = v81;
          }

          v82 = 1;
          switch(v78)
          {
            case 2u:
            case 0xCu:
            case 0xDu:
              v82 = 2;
              goto LABEL_149;
            case 3u:
            case 8u:
            case 9u:
            case 0xAu:
            case 0xBu:
            case 0xEu:
              goto LABEL_138;
            case 4u:
              v83 = 1LL;
              if ((v74 & 1) != 0)
              {
                v82 = 3;
LABEL_144:
                v84 = &v73->data[v73->length];
                if (&v84[v82] <= (Byte *)&v111)
                {
                  memcpy(v84, v7 + 1, v82);
                  v73->length += v82;
                  break;
                }

                if (v75) {
                  MIDIReceived(*(_DWORD *)(*(void *)(a1 + 16) + 4LL * (int)v91), (const MIDIPacketList *)evtlist);
                }
                unsigned __int8 v73 = MIDIPacketListInit((MIDIPacketList *)evtlist);
                int v74 = 0LL;
              }

              else
              {
                int v74 = 1LL;
LABEL_138:
                v82 = 3;
              }

void *sub_12A10(void *a1)
{
  *a1 = off_28A98;
  (*(void (**)(void *))(a1[1] + 24LL))(a1 + 2);
  return a1;
}

void sub_12A54(void *a1)
{
  *a1 = off_28A98;
  (*(void (**)(void *))(a1[1] + 24LL))(a1 + 2);
  operator delete(a1);
}

uint64_t sub_12A98(uint64_t a1, _DWORD *a2)
{
  if (*a2 == 2)
  {
    BOOL v10 = a2;
    return (**(uint64_t (***)(uint64_t, _DWORD **))(a1 + 8))(a1 + 16, &v10);
  }

  else
  {
    if (*a2 != 1) {
      std::terminate();
    }
    uint64_t v8 = 0LL;
    BOOL v10 = *(_DWORD **)(a1 + 8);
    (*((void (**)(void *, uint64_t))v10 + 1))(v11, a1 + 16);
    v11[7] = 2LL;
    v11[6] = &v12;
    uint64_t v5 = &v8;
    unsigned int v6 = (uint64_t *)a1;
    uint64_t v7 = &v10;
    BOOL v9 = &v5;
    sub_12E04((uint64_t)a2, &v9);
    uint64_t v5 = (uint64_t *)&v10;
    unsigned int v6 = &v8;
    sub_12C88((unsigned int *)(a1 + 64), (uint64_t)&v5);
    return sub_12688((uint64_t)&v10);
  }

void sub_12BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

uint64_t sub_12BC0(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *(void *)(a1 + 8);
  (*(void (**)(void *, uint64_t))(v7 + 8))(v8, a1 + 16);
  void v8[7] = 2LL;
  v8[6] = &v9;
  v5[0] = a1;
  v5[1] = &v7;
  unsigned int v6 = v5;
  sub_13550(a2, &v6);
  return sub_12688((uint64_t)&v7);
}

void sub_12C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

unsigned int *sub_12C88(unsigned int *result, uint64_t a2)
{
  unint64_t v3 = result;
  unint64_t v4 = *result;
  unsigned int v5 = v4 >> 28;
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = v6 || (v4 & 0xFF0000) == 0;
  if (!v7 && (BYTE1(v4) | 0x20) == 0x26)
  {
    LODWORD(v20) = BYTE3(v4) & 0xF;
    if (v5 == 15) {
      uint64_t v20 = 255LL;
    }
    else {
      uint64_t v20 = v20;
    }
    *(void *)((char *)&result[32 * v20 + 8 + 2 * ((v4 >> 16) & 0xF)] + 1) = 0LL;
    *((_BYTE *)result + 32) = 1;
  }

  if (BYTE2(v4))
  {
    uint64_t v23 = 0LL;
    if (v5) {
      BOOL v8 = v5 == 15;
    }
    else {
      BOOL v8 = 1;
    }
    int v9 = v4 & 0xF000000 | 0x40000000;
    if (v8) {
      int v9 = -16777216;
    }
    int v21 = v9 | v4 & 0xFF00 | (BYTE2(v4) << 16);
    unsigned int v10 = v4;
    unsigned int v11 = (_DWORD)v4 << 25;
    if (v10 >= 0x41)
    {
      unsigned int v12 = (v10 & 0x3F) << 19;
      if (v12)
      {
        do
        {
          v11 |= v12;
          BOOL v13 = v12 > 0x3F;
          v12 >>= 6;
        }

        while (v13);
      }
    }

    unsigned int v22 = v11;
    uint64_t result = sub_12308(*(unsigned int **)a2, **(void **)(a2 + 8), &v21);
    unsigned int *v3 = 0;
  }

  unsigned int v14 = v3[4];
  if (BYTE2(v14))
  {
    uint64_t v23 = 0LL;
    if (v14 >> 28) {
      BOOL v15 = v14 >> 28 == 15;
    }
    else {
      BOOL v15 = 1;
    }
    int v16 = v14 & 0xF000000 | 0x40000000;
    if (v15) {
      int v16 = -16777216;
    }
    int v21 = v16 | v14 & 0xFF00 | (BYTE2(v14) << 16);
    unsigned int v17 = v14;
    unsigned int v18 = v14 << 25;
    if (v17 >= 0x41)
    {
      unsigned int v19 = (v17 & 0x3F) << 19;
      if (v19)
      {
        do
        {
          v18 |= v19;
          BOOL v13 = v19 > 0x3F;
          v19 >>= 6;
        }

        while (v13);
      }
    }

    unsigned int v22 = v18;
    uint64_t result = sub_12308(*(unsigned int **)a2, **(void **)(a2 + 8), &v21);
    v3[4] = 0;
  }

  return result;
}

uint64_t sub_12E04(uint64_t result, void **a2)
{
  if (*(_DWORD *)(result + 4))
  {
    uint64_t v3 = result;
    unsigned int v4 = 0;
    uint64_t v5 = result + 8;
    do
    {
      uint64_t v6 = *(unsigned int *)(v5 + 8);
      v13[0] = v5 + 12;
      v13[1] = v6;
      void v13[2] = *(void *)v5;
      v13[3] = 0LL;
      uint64_t __src = 0LL;
      uint64_t v11 = 0LL;
      uint64_t result = sub_5338(v13, &v12, &__src);
      if ((_DWORD)result)
      {
        do
        {
          BOOL v7 = (void **)*a2;
          int v9 = (void *)**a2;
          uint64_t v8 = (*a2)[1];
          *int v9 = v12;
          v14[0] = v7[2];
          v14[1] = v9;
          sub_12ECC(v8 + 64, (unsigned int *)&__src, (uint64_t)v14);
          uint64_t __src = 0LL;
          uint64_t v11 = 0LL;
          uint64_t result = sub_5338(v13, &v12, &__src);
        }

        while ((result & 1) != 0);
      }

      v5 += 4LL * *(unsigned int *)(v5 + 8) + 12;
      ++v4;
    }

    while (v4 < *(_DWORD *)(v3 + 4));
  }

  return result;
}

void sub_12ECC(uint64_t a1, unsigned int *__src, uint64_t a3)
{
  unsigned int v4 = *__src;
  if (*__src >> 28 == 2)
  {
    int v55 = 0;
    uint64_t v56 = 0LL;
    uint64_t v54 = BYTE2(v4);
    v51[0] = (unsigned int *)a1;
    v51[1] = (unsigned int *)&v54;
    v51[2] = __src;
    void v51[3] = (unsigned int *)&v53;
    v51[4] = (unsigned int *)&v52;
    int v6 = *(unsigned __int8 *)(a1 + 32);
    if (!v6) {
      sub_13394(v51);
    }
    uint64_t v7 = HIBYTE(v4) & 0xF;
    int v8 = HIBYTE(v4) & 0xF | 0x40;
    unsigned int v9 = *(_DWORD *)a1;
    int v10 = BYTE2(*(_DWORD *)a1);
    if (BYTE2(*(_DWORD *)a1) && v6)
    {
      *(_BYTE *)(a1 + 32) = 1;
      uint64_t v59 = 0LL;
      unsigned int __srca = v9 & 0xFF00 | (v10 << 16) & 0x80FFFFFF | ((HIBYTE(v4) & 0xF | 0x40) << 24);
      unsigned int v11 = v9;
      unsigned int v12 = v9 << 25;
      if (v11 >= 0x41)
      {
        unsigned int v13 = (v11 & 0x3F) << 19;
        if (v13)
        {
          do
          {
            v12 |= v13;
            BOOL v14 = v13 > 0x3F;
            v13 >>= 6;
          }

          while (v14);
        }
      }

      unsigned int v58 = v12;
      sub_12308(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)&__srca);
      *(_DWORD *)a1 = 0;
      uint64_t v59 = 0LL;
      int v15 = *(_DWORD *)(a1 + 16);
      if (BYTE2(v15))
      {
        unsigned int __srca = *(_DWORD *)(a1 + 16) & 0xFF00 | (BYTE2(*(_DWORD *)(a1 + 16)) << 16) | (v8 << 24);
        unsigned int v16 = v15;
        unsigned int v17 = v15 << 25;
        BOOL v18 = v16 >= 0x41;
        unsigned int v19 = (v16 & 0x3F) << 19;
        if (v18 && v19 != 0)
        {
          do
          {
            v17 |= v19;
            BOOL v14 = v19 > 0x3F;
            v19 >>= 6;
          }

          while (v14);
        }

        unsigned int v58 = v17;
        sub_12308(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)&__srca);
        *(_DWORD *)(a1 + 16) = 0;
      }

      unsigned int v21 = v54;
      *(void *)(a1 + (v7 << 7) + 8 * (v54 & 0xF) + 33) = 0LL;
    }

    else
    {
      unsigned int v21 = v54;
    }

    unsigned int v22 = (v4 >> 8) & 0x7F;
    unsigned int v23 = v4 & 0x7F;
    switch(v21 >> 4)
    {
      case 8u:
        goto LABEL_22;
      case 9u:
        if ((v4 & 0x7F) == 0)
        {
          v21 -= 16;
          LODWORD(v54) = v21;
          unsigned int v23 = 64;
        }

LABEL_22:
        HIDWORD(v54) = (v8 << 24) | (v21 << 16) | (v22 << 8);
        unsigned int v24 = v23 << 9;
        if (v23 >= 0x41)
        {
          unsigned int v25 = 8 * (v23 & 0x3F);
          if (v25)
          {
            do
            {
              v24 |= v25;
              BOOL v14 = v25 > 0x3F;
              v25 >>= 6;
            }

            while (v14);
          }
        }

        unsigned int v26 = v24 << 16;
        goto LABEL_72;
      case 0xAu:
        HIDWORD(v54) = (v8 << 24) | (v21 << 16) | (v22 << 8);
        unsigned int v26 = v4 << 25;
        if (v23 >= 0x41)
        {
          unsigned int v27 = (v4 & 0x3F) << 19;
          if (v27)
          {
            do
            {
              v26 |= v27;
              BOOL v14 = v27 > 0x3F;
              v27 >>= 6;
            }

            while (v14);
          }
        }

        goto LABEL_72;
      case 0xBu:
        uint64_t v28 = a1 + (v7 << 7) + 33;
        uint64_t v29 = v21 & 0xF;
        if (((v4 >> 8) & 0x7F) > 0x25)
        {
          switch(v22)
          {
            case 'b':
              uint64_t v38 = v28 + 8 * v29;
              char v39 = 2;
              goto LABEL_65;
            case 'c':
              uint64_t v48 = v28 + 8 * v29;
              char v49 = 2;
              goto LABEL_67;
            case 'd':
              uint64_t v38 = v28 + 8 * v29;
              char v39 = 1;
LABEL_65:
              *(_BYTE *)(v38 + 1) = v39;
              *(_BYTE *)(v38 + 5) = v23;
              break;
            case 'e':
              uint64_t v48 = v28 + 8 * v29;
              char v49 = 1;
LABEL_67:
              *(_BYTE *)(v48 + 1) = v49;
              *(_BYTE *)(v48 + 4) = v23;
              break;
            default:
              if (v22 != 38) {
                goto LABEL_69;
              }
              char v40 = v4 & 0x7F;
              int v41 = v4 & 0x7F;
              goto LABEL_54;
          }

        HIDWORD(v54) = (v8 << 24) | (v21 << 16) | (v22 << 8);
        unsigned int v24 = v23 << 9;
        if (v23 >= 0x41)
        {
          unsigned int v25 = 8 * (v23 & 0x3F);
          if (v25)
          {
            do
            {
              v24 |= v25;
              BOOL v14 = v25 > 0x3F;
              v25 >>= 6;
            }

            while (v14);
          }
        }

        unsigned int v26 = v24 << 16;
        goto LABEL_72;
      case 0xAu:
        HIDWORD(v54) = (v8 << 24) | (v21 << 16) | (v22 << 8);
        unsigned int v26 = v4 << 25;
        if (v23 >= 0x41)
        {
          unsigned int v27 = (v4 & 0x3F) << 19;
          if (v27)
          {
            do
            {
              v26 |= v27;
              BOOL v14 = v27 > 0x3F;
              v27 >>= 6;
            }

            while (v14);
          }
        }

        goto LABEL_72;
      case 0xBu:
        uint64_t v28 = a1 + (v7 << 7) + 33;
        uint64_t v29 = v21 & 0xF;
        if (((v4 >> 8) & 0x7F) > 0x25)
        {
          switch(v22)
          {
            case 'b':
              uint64_t v38 = v28 + 8 * v29;
              char v39 = 2;
              goto LABEL_65;
            case 'c':
              uint64_t v48 = v28 + 8 * v29;
              char v49 = 2;
              goto LABEL_67;
            case 'd':
              uint64_t v38 = v28 + 8 * v29;
              char v39 = 1;
LABEL_65:
              *(_BYTE *)(v38 + 1) = v39;
              *(_BYTE *)(v38 + 5) = v23;
              break;
            case 'e':
              uint64_t v48 = v28 + 8 * v29;
              char v49 = 1;
LABEL_67:
              *(_BYTE *)(v48 + 1) = v49;
              *(_BYTE *)(v48 + 4) = v23;
              break;
            default:
              if (v22 != 38) {
                goto LABEL_69;
              }
              char v40 = v4 & 0x7F;
              int v41 = v4 & 0x7F;
              goto LABEL_54;
          }

        int v8 = v21;
        if (v21 < v23)
        {
          unsigned int v27 = v23;
          do
          {
            v121 = *(_DWORD *)(v8 + 8);
            v112 = *(void *)v8;
            uint64_t v28 = *(void *)v27;
            *(_DWORD *)(v8 + 8) = *(_DWORD *)(v27 + 8);
            *(void *)int v8 = v28;
            *(_DWORD *)(v27 + 8) = v121;
            *(void *)unsigned int v27 = v112;
            do
            {
              uint64_t v29 = *(unsigned __int8 *)(v8 + 14);
              v8 += 12LL;
            }

            while (v29 < v17);
            do
            {
              uint64_t v30 = *(unsigned __int8 *)(v27 - 10);
              v27 -= 12LL;
            }

            while (v30 >= v17);
          }

          while (v8 < v27);
        }

        if (v8 - 12 != v7)
        {
          int v31 = *(void *)(v8 - 12);
          *(_DWORD *)(v7 + 8) = *(_DWORD *)(v8 - 4);
          *(void *)uint64_t v7 = v31;
        }

        *(_WORD *)(v8 - 12) = v19;
        *(_BYTE *)(v8 - 10) = v17;
        *(_BYTE *)(v8 - 1) = v108;
        *(void *)(v8 - 9) = v105;
        if (v21 < v23)
        {
LABEL_33:
          uint64_t result = sub_1DF68(v7, v8 - 12, a3, a4 & 1);
          a4 = 0;
          continue;
        }

        uint64_t v32 = sub_1EA04(v7, v8 - 12);
        uint64_t result = sub_1EA04(v8, a2);
        if (!(_DWORD)result)
        {
          if (v32) {
            continue;
          }
          goto LABEL_33;
        }

        a2 = v8 - 12;
        if (!v32) {
          goto LABEL_2;
        }
        return result;
    }
  }

LABEL_68:
          if (!*(_BYTE *)(a1 + 32)) {
            return;
          }
          goto LABEL_69;
        }

        if (!v22)
        {
          *(_BYTE *)(v28 + 8 * v29 + 2) = v23;
          goto LABEL_50;
        }

        if (v22 != 6)
        {
          if (v22 == 32)
          {
            *(_BYTE *)(v28 + 8 * v29 + 3) = v23;
LABEL_50:
            *(_BYTE *)(v28 + 8LL * (v21 & 0xF)) = 1;
            goto LABEL_68;
          }

          if (!*(_BYTE *)(a1 + 32)) {
            return;
          }
          goto LABEL_69;
        }

        if (!v22)
        {
          *(_BYTE *)(v28 + 8 * v29 + 2) = v23;
          goto LABEL_50;
        }

        if (v22 != 6)
        {
          if (v22 == 32)
          {
            *(_BYTE *)(v28 + 8 * v29 + 3) = v23;
LABEL_50:
            *(_BYTE *)(v28 + 8LL * (v21 & 0xF)) = 1;
            goto LABEL_68;
          }

LABEL_69:
          HIDWORD(v54) = (v8 << 24) | (v21 << 16) | (v22 << 8);
          unsigned int v26 = v4 << 25;
          if (v23 >= 0x41)
          {
            unsigned int v50 = (v4 & 0x3F) << 19;
            if (v50)
            {
              do
              {
                v26 |= v50;
                BOOL v14 = v50 > 0x3F;
                v50 >>= 6;
              }

              while (v14);
            }
          }

          HIDWORD(v54) = (v8 << 24) | (v21 << 16) | (v22 << 8);
          unsigned int v26 = v4 << 25;
          if (v23 >= 0x41)
          {
            unsigned int v50 = (v4 & 0x3F) << 19;
            if (v50)
            {
              do
              {
                v26 |= v50;
                BOOL v14 = v50 > 0x3F;
                v50 >>= 6;
              }

              while (v14);
            }
          }

LABEL_72:
          int v55 = v26;
          goto LABEL_73;
        }

        char v40 = 0;
        int v41 = 0;
        *(_BYTE *)(v28 + 8 * v29 + 6) = v23;
LABEL_54:
        uint64_t v42 = v28 + 8 * v29;
        *(_BYTE *)(v42 + 7) = v40;
        if (*(_BYTE *)(a1 + 32) || !*(_BYTE *)(v42 + 1)) {
          goto LABEL_69;
        }
        if (*(_BYTE *)(v42 + 1) == 1) {
          int v43 = 32;
        }
        else {
          int v43 = 48;
        }
        uint64_t v44 = (unsigned __int8 *)(v28 + 8 * v29);
        HIDWORD(v54) = (v8 << 24) | ((v43 | v29) << 16) | (v44[4] << 8) | v44[5];
        unsigned int v45 = v41 | (v44[6] << 7);
        unsigned int v46 = v45 << 18;
        if (v45 > 0x2000)
        {
          for (unsigned int i = 32 * (v45 & 0x1FFF); i; i >>= 13)
            v46 |= i;
        }

        int v55 = v46;
LABEL_38:
        *(void *)a1 = 0LL;
        *(void *)(a1 + 8) = 0LL;
        *(void *)(a1 + 16) = 0LL;
        *(void *)(a1 + 24) = 0LL;
LABEL_73:
        sub_12308(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)&v54 + 1);
        break;
      case 0xCu:
        uint64_t v30 = a1 + (v7 << 7) + 33;
        int v31 = *(unsigned __int8 *)(v30 + 8LL * (v21 & 0xF));
        if (*(_BYTE *)(v30 + 8LL * (v21 & 0xF))) {
          int v31 = *(unsigned __int8 *)(a1 + 32) ^ 1;
        }
        uint64_t v32 = v30 + 8LL * (v21 & 0xF);
        int v33 = (v22 << 24) | (*(unsigned __int8 *)(v32 + 2) << 8) | *(unsigned __int8 *)(v32 + 3);
        HIDWORD(v54) = (v21 << 16) | (v8 << 24) | v31;
        int v55 = v33;
        *(void *)uint64_t v32 = 0LL;
        goto LABEL_38;
      case 0xDu:
        HIDWORD(v54) = (v21 << 16) | (v8 << 24);
        unsigned int v34 = v4 >> 8 << 25;
        if (v22 >= 0x41)
        {
          unsigned int v35 = ((v4 >> 8) & 0x3F) << 19;
          if (v35)
          {
            do
            {
              v34 |= v35;
              BOOL v14 = v35 > 0x3F;
              v35 >>= 6;
            }

            while (v14);
          }
        }

        int v55 = v34;
        goto LABEL_73;
      case 0xEu:
        HIDWORD(v54) = (v21 << 16) | (v8 << 24);
        unsigned int v36 = v22 | (v23 << 7);
        unsigned int v26 = v36 << 18;
        if (v36 > 0x2000)
        {
          for (unsigned int j = 32 * (v36 & 0x1FFF); j; j >>= 13)
            v26 |= j;
        }

        goto LABEL_72;
      default:
        goto LABEL_73;
    }
  }

  else
  {
    sub_12308(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__src);
  }

          int v55 = v26;
          goto LABEL_73;
        }

        char v40 = 0;
        int v41 = 0;
        *(_BYTE *)(v28 + 8 * v29 + 6) = v23;
LABEL_54:
        uint64_t v42 = v28 + 8 * v29;
        *(_BYTE *)(v42 + 7) = v40;
        if (*(_BYTE *)(a1 + 32) || !*(_BYTE *)(v42 + 1)) {
          goto LABEL_69;
        }
        if (*(_BYTE *)(v42 + 1) == 1) {
          int v43 = 32;
        }
        else {
          int v43 = 48;
        }
        uint64_t v44 = (unsigned __int8 *)(v28 + 8 * v29);
        HIDWORD(v54) = (v8 << 24) | ((v43 | v29) << 16) | (v44[4] << 8) | v44[5];
        unsigned int v45 = v41 | (v44[6] << 7);
        unsigned int v46 = v45 << 18;
        if (v45 > 0x2000)
        {
          for (unsigned int i = 32 * (v45 & 0x1FFF); i; i >>= 13)
            v46 |= i;
        }

        int v55 = v46;
LABEL_38:
        *(void *)a1 = 0LL;
        *(void *)(a1 + 8) = 0LL;
        *(void *)(a1 + 16) = 0LL;
        *(void *)(a1 + 24) = 0LL;
LABEL_73:
        sub_12308(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)&v54 + 1);
        break;
      case 0xCu:
        uint64_t v30 = a1 + (v7 << 7) + 33;
        int v31 = *(unsigned __int8 *)(v30 + 8LL * (v21 & 0xF));
        if (*(_BYTE *)(v30 + 8LL * (v21 & 0xF))) {
          int v31 = *(unsigned __int8 *)(a1 + 32) ^ 1;
        }
        uint64_t v32 = v30 + 8LL * (v21 & 0xF);
        int v33 = (v22 << 24) | (*(unsigned __int8 *)(v32 + 2) << 8) | *(unsigned __int8 *)(v32 + 3);
        HIDWORD(v54) = (v21 << 16) | (v8 << 24) | v31;
        int v55 = v33;
        *(void *)uint64_t v32 = 0LL;
        goto LABEL_38;
      case 0xDu:
        HIDWORD(v54) = (v21 << 16) | (v8 << 24);
        unsigned int v34 = v4 >> 8 << 25;
        if (v22 >= 0x41)
        {
          unsigned int v35 = ((v4 >> 8) & 0x3F) << 19;
          if (v35)
          {
            do
            {
              v34 |= v35;
              BOOL v14 = v35 > 0x3F;
              v35 >>= 6;
            }

            while (v14);
          }
        }

        int v55 = v34;
        goto LABEL_73;
      case 0xEu:
        HIDWORD(v54) = (v21 << 16) | (v8 << 24);
        unsigned int v36 = v22 | (v23 << 7);
        unsigned int v26 = v36 << 18;
        if (v36 > 0x2000)
        {
          for (unsigned int j = 32 * (v36 & 0x1FFF); j; j >>= 13)
            v26 |= j;
        }

        goto LABEL_72;
      default:
        goto LABEL_73;
    }
  }

  else
  {
    sub_12308(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__src);
  }

__n128 sub_13394(unsigned int **a1)
{
  uint64_t v1 = *a1;
  if (!*((_BYTE *)*a1 + 32))
  {
    unsigned int v2 = *a1[1];
    unsigned int v3 = v2 >> 4;
    unsigned int v4 = *v1;
    if ((*v1 & 0xFF0000) != 0)
    {
      if (((v2 ^ HIWORD(v4)) & 0xF) != 0)
      {
        *((_BYTE *)v1 + 32) = 1;
        return result;
      }

      if (v3 == 11)
      {
        switch(BYTE1(v4))
        {
          case 'b':
            unsigned int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25344;
            goto LABEL_28;
          case 'c':
            unsigned int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25088;
            goto LABEL_28;
          case 'd':
            unsigned int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25856;
            goto LABEL_28;
          case 'e':
            unsigned int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25600;
LABEL_28:
            if (v10 != v12 && v11 != 11535872) {
              return result;
            }
            goto LABEL_33;
          default:
            if (BYTE1(v4) == 32)
            {
              unsigned int v9 = a1[2];
              if (*((_BYTE *)v9 + 1)) {
                return result;
              }
            }

            else
            {
              if (BYTE1(v4)) {
                return result;
              }
              unsigned int v9 = a1[2];
            }

uint64_t sub_13550(uint64_t result, uint64_t **a2)
{
  if (*(_DWORD *)result)
  {
    unsigned int v3 = (unsigned int *)result;
    unsigned int v4 = 0;
    unint64_t v5 = result + 4;
    do
    {
      uint64_t v6 = *(unsigned __int16 *)(v5 + 8);
      v12[0] = v5 + 10;
      v12[1] = v6;
      uint64_t v12[2] = *(void *)v5;
      void v12[3] = 0LL;
      uint64_t v9 = 0LL;
      uint64_t v10 = 0LL;
      __n128 result = sub_127AC(v12, &v11, &v9);
      if ((_DWORD)result)
      {
        do
        {
          BOOL v7 = *a2;
          uint64_t v14 = v11;
          uint64_t v8 = *v7;
          v13[0] = v7[1];
          v13[1] = &v14;
          sub_13624(v8 + 64, (unsigned int *)&v9, (uint64_t)v13);
          uint64_t v9 = 0LL;
          uint64_t v10 = 0LL;
          __n128 result = sub_127AC(v12, &v11, &v9);
        }

        while ((result & 1) != 0);
      }

      unint64_t v5 = (v5 + *(unsigned __int16 *)(v5 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
      ++v4;
    }

    while (v4 < *v3);
  }

  return result;
}

void sub_13624(uint64_t a1, unsigned int *__src, uint64_t a3)
{
  unsigned int v4 = *__src;
  if (*__src >> 28 == 2)
  {
    int v55 = 0;
    uint64_t v56 = 0LL;
    uint64_t v54 = BYTE2(v4);
    v51[0] = (unsigned int *)a1;
    v51[1] = (unsigned int *)&v54;
    v51[2] = __src;
    void v51[3] = (unsigned int *)&v53;
    v51[4] = (unsigned int *)&v52;
    int v6 = *(unsigned __int8 *)(a1 + 32);
    if (!v6) {
      sub_13AEC(v51);
    }
    uint64_t v7 = HIBYTE(v4) & 0xF;
    int v8 = HIBYTE(v4) & 0xF | 0x40;
    unsigned int v9 = *(_DWORD *)a1;
    int v10 = BYTE2(*(_DWORD *)a1);
    if (BYTE2(*(_DWORD *)a1) && v6)
    {
      *(_BYTE *)(a1 + 32) = 1;
      uint64_t v59 = 0LL;
      unsigned int __srca = v9 & 0xFF00 | (v10 << 16) & 0x80FFFFFF | ((HIBYTE(v4) & 0xF | 0x40) << 24);
      unsigned int v11 = v9;
      unsigned int v12 = v9 << 25;
      if (v11 >= 0x41)
      {
        unsigned int v13 = (v11 & 0x3F) << 19;
        if (v13)
        {
          do
          {
            v12 |= v13;
            BOOL v14 = v13 > 0x3F;
            v13 >>= 6;
          }

          while (v14);
        }
      }

      unsigned int v58 = v12;
      sub_12308(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)&__srca);
      *(_DWORD *)a1 = 0;
      uint64_t v59 = 0LL;
      int v15 = *(_DWORD *)(a1 + 16);
      if (BYTE2(v15))
      {
        unsigned int __srca = *(_DWORD *)(a1 + 16) & 0xFF00 | (BYTE2(*(_DWORD *)(a1 + 16)) << 16) | (v8 << 24);
        unsigned int v16 = v15;
        unsigned int v17 = v15 << 25;
        BOOL v18 = v16 >= 0x41;
        unsigned int v19 = (v16 & 0x3F) << 19;
        if (v18 && v19 != 0)
        {
          do
          {
            v17 |= v19;
            BOOL v14 = v19 > 0x3F;
            v19 >>= 6;
          }

          while (v14);
        }

        unsigned int v58 = v17;
        sub_12308(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)&__srca);
        *(_DWORD *)(a1 + 16) = 0;
      }

      unsigned int v21 = v54;
      *(void *)(a1 + (v7 << 7) + 8 * (v54 & 0xF) + 33) = 0LL;
    }

    else
    {
      unsigned int v21 = v54;
    }

    unsigned int v22 = (v4 >> 8) & 0x7F;
    unsigned int v23 = v4 & 0x7F;
    switch(v21 >> 4)
    {
      case 8u:
        goto LABEL_22;
      case 9u:
        if ((v4 & 0x7F) == 0)
        {
          v21 -= 16;
          LODWORD(v54) = v21;
          unsigned int v23 = 64;
        }

__n128 sub_13AEC(unsigned int **a1)
{
  uint64_t v1 = *a1;
  if (!*((_BYTE *)*a1 + 32))
  {
    unsigned int v2 = *a1[1];
    unsigned int v3 = v2 >> 4;
    unsigned int v4 = *v1;
    if ((*v1 & 0xFF0000) != 0)
    {
      if (((v2 ^ HIWORD(v4)) & 0xF) != 0)
      {
        *((_BYTE *)v1 + 32) = 1;
        return result;
      }

      if (v3 == 11)
      {
        switch(BYTE1(v4))
        {
          case 'b':
            unsigned int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25344;
            goto LABEL_28;
          case 'c':
            unsigned int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25088;
            goto LABEL_28;
          case 'd':
            unsigned int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25856;
            goto LABEL_28;
          case 'e':
            unsigned int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25600;
LABEL_28:
            if (v10 != v12 && v11 != 11535872) {
              return result;
            }
            goto LABEL_33;
          default:
            if (BYTE1(v4) == 32)
            {
              unsigned int v9 = a1[2];
              if (*((_BYTE *)v9 + 1)) {
                return result;
              }
            }

            else
            {
              if (BYTE1(v4)) {
                return result;
              }
              unsigned int v9 = a1[2];
            }

void sub_13CA8(void ***a1)
{
  uint64_t v1 = *a1;
  unsigned int v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unint64_t v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        uint64_t v4 = sub_13D18(v4 - 296);
      while ((void *)v4 != v2);
      unint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

uint64_t sub_13D18(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 272);
  if ((_DWORD)v2 != -1) {
    ((void (*)(char *, uint64_t))off_28AB8[v2])(&v4, a1);
  }
  *(_DWORD *)(a1 + 272) = -1;
  return a1;
}

void sub_13D74(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a2;
  if (*(void *)a2)
  {
    *(void *)(a2 + 8) = v2;
    operator delete(v2);
  }

void *sub_13D88(void *a1)
{
  for (unsigned int i = (void *)a1[1]; i != a1; unsigned int i = (void *)i[1])
  {
    unsigned int v3 = (void *)i[4];
    if (v3) {
      free(v3);
    }
  }

  sub_13DD4(a1);
  return a1;
}

void *sub_13DD4(void *result)
{
  if (result[2])
  {
    uint64_t v1 = result;
    __n128 result = (void *)result[1];
    uint64_t v2 = *v1;
    uint64_t v3 = *result;
    *(void *)(v3 + 8) = *(void *)(*v1 + 8LL);
    **(void **)(v2 + 8) = v3;
    v1[2] = 0LL;
    if (result != v1)
    {
      do
      {
        char v4 = (void *)result[1];
        operator delete(result);
        __n128 result = v4;
      }

      while (v4 != v1);
    }
  }

  return result;
}

char *sub_13E34(char *result, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  if (a4)
  {
    int v6 = result;
    __n128 result = sub_13EA4(result, a4);
    BOOL v7 = (void *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      uint64_t v8 = *a2++;
      *v7++ = v8;
    }

    *((void *)v6 + 1) = v7;
  }

  return result;
}

void sub_13E88(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_13EA4(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_2DE0();
  }
  __n128 result = (char *)sub_13EE4((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *sub_13EE4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_2E9C();
  }
  return operator new(8 * a2);
}

void sub_13F18()
{
}

void sub_13F2C(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_13F7C(exception, a1);
}

void sub_13F68(_Unwind_Exception *a1)
{
}

std::logic_error *sub_13F7C(std::logic_error *a1, const char *a2)
{
  __n128 result = std::logic_error::logic_error(a1, a2);
  return result;
}

uint64_t sub_13FA0(uint64_t a1, unsigned int *a2, int a3, int a4, char a5)
{
  *(_OWORD *)(a1 + 252) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 2(*(void (**)(uint64_t))(*(void *)(v1 + 32) + 24LL))(v1 + 40) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 272) = 0;
  *(_DWORD *)(a1 + 280) = a3;
  *(_DWORD *)(a1 + 284) = a4;
  *(_DWORD *)(a1 + 288) = 0;
  *(_BYTE *)(a1 + 292) = a5;
  uint64_t v7 = a2[2];
  size_t v8 = 4 * v7 + 12;
  size_t v12 = v8;
  if (v7 <= 0x40)
  {
    unsigned int v9 = (void *)sub_1406C(a1);
LABEL_5:
    memmove(v9, a2, v8);
    return a1;
  }

  int v10 = (void **)sub_140E8(a1, &v12);
  size_t v8 = v12;
  if (v12)
  {
    unsigned int v9 = *v10;
    goto LABEL_5;
  }

  return a1;
}

void sub_14058(_Unwind_Exception *a1)
{
}

uint64_t sub_1406C(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 272);
  if ((_DWORD)v2 != -1) {
    ((void (*)(char *, uint64_t))off_28AB8[v2])(&v4, a1);
  }
  *(_OWORD *)(a1 + 252) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 2(*(void (**)(uint64_t))(*(void *)(v1 + 32) + 24LL))(v1 + 40) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 272) = 0;
  return a1;
}

void *sub_140E8(uint64_t a1, size_t *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 272);
  if ((_DWORD)v4 != -1) {
    ((void (*)(char *, uint64_t))off_28AB8[v4])(&v6, a1);
  }
  *(_DWORD *)(a1 + 272) = -1;
  __n128 result = sub_14154((void *)a1, *a2);
  *(_DWORD *)(a1 + 272) = 1;
  return result;
}

void *sub_14154(void *a1, size_t a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    sub_141C4(a1, a2);
    uint64_t v4 = (char *)a1[1];
    unint64_t v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }

  return a1;
}

void sub_141A8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_141C4(void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000LL) != 0) {
    sub_2DE0();
  }
  __n128 result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

uint64_t sub_14204(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = 0x14C1BACF914C1BADLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0x14C1BACF914C1BADLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x6EB3E45306EB3ELL) {
    unint64_t v9 = 0xDD67C8A60DD67CLL;
  }
  else {
    unint64_t v9 = v5;
  }
  v15[4] = a1 + 2;
  if (v9) {
    int v10 = (char *)sub_144D8(v7, v9);
  }
  else {
    int v10 = 0LL;
  }
  uint64_t v11 = (uint64_t)&v10[296 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v15[3] = &v10[296 * v9];
  sub_14334(v11, (unsigned int *)a2);
  uint64_t v12 = *(void *)(a2 + 280);
  *(void *)(v11 + 285) = *(void *)(a2 + 285);
  *(void *)(v11 + 280) = v12;
  v15[2] = v11 + 296;
  sub_14428(a1, v15);
  uint64_t v13 = a1[1];
  sub_14520((uint64_t)v15);
  return v13;
}

void sub_14320(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_14334(uint64_t a1, unsigned int *a2)
{
  *(_BYTE *)a1 = 0;
  *(_DWORD *)(a1 + 272) = -1;
  sub_14368(a1, a2);
  return a1;
}

uint64_t sub_14368(uint64_t result, unsigned int *a2)
{
  uint64_t v3 = (_DWORD *)result;
  uint64_t v4 = *(unsigned int *)(result + 272);
  if ((_DWORD)v4 != -1) {
    __n128 result = ((uint64_t (*)(char *, uint64_t))off_28AB8[v4])(&v7, result);
  }
  v3[68] = -1;
  uint64_t v5 = a2[68];
  if ((_DWORD)v5 != -1)
  {
    __n128 result = (*(&off_28AE0 + v5))((int)&v6, v3, a2);
    v3[68] = v5;
  }

  return result;
}

void *sub_143F4(int a1, void *__dst, void *__src)
{
  return memcpy(__dst, __src, 0x10CuLL);
}

__n128 sub_14404(uint64_t a1, __n128 *a2, __n128 *a3)
{
  a2->n128_u64[0] = 0LL;
  a2->n128_u64[1] = 0LL;
  a2[1].n128_u64[0] = 0LL;
  __n128 result = *a3;
  *a2 = *a3;
  a2[1].n128_u64[0] = a3[1].n128_u64[0];
  a3->n128_u64[0] = 0LL;
  a3->n128_u64[1] = 0LL;
  a3[1].n128_u64[0] = 0LL;
  return result;
}

uint64_t sub_14428(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = a2[1];
  if (v5 == *a1)
  {
    uint64_t result = a2[1];
  }

  else
  {
    do
    {
      uint64_t result = sub_14334(v6 - 296, (unsigned int *)(v5 - 296));
      uint64_t v8 = *(void *)(v5 - 16);
      *(void *)(v6 - 11) = *(void *)(v5 - 11);
      *(void *)(v6 - 16) = v8;
      v5 -= 296LL;
      uint64_t v6 = result;
    }

    while (v5 != v4);
  }

  a2[1] = result;
  uint64_t v9 = *a1;
  *a1 = result;
  a2[1] = v9;
  uint64_t v10 = a1[1];
  a1[1] = a2[2];
  a2[2] = v10;
  uint64_t v11 = a1[2];
  a1[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return result;
}

void *sub_144D8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xDD67C8A60DD67DLL) {
    sub_2E9C();
  }
  return operator new(296 * a2);
}

uint64_t sub_14520(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 296;
    sub_13D18(i - 296);
  }

  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_1456C(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 272);
  if ((_DWORD)v1 == -1) {
    sub_145B4();
  }
  uint64_t v4 = &v3;
  return ((uint64_t (*)(char **, uint64_t))off_28B08[v1])(&v4, a1);
}

void sub_145B4()
{
  exception = __cxa_allocate_exception(8uLL);
}

uint64_t sub_145EC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_145F4(uint64_t a1, uint64_t a2)
{
  return *(void *)a2;
}

uint64_t sub_145FC(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 3;
  unint64_t v5 = v4 + 1;
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 2 > v5) {
    unint64_t v5 = v8 >> 2;
  }
  else {
    unint64_t v9 = v5;
  }
  unsigned int v19 = a1 + 2;
  uint64_t v10 = (char *)sub_13EE4(v7, v9);
  uint64_t v11 = &v10[8 * v4];
  __p = v10;
  unsigned int v16 = v11;
  BOOL v18 = &v10[8 * v12];
  *(void *)uint64_t v11 = *a2;
  unsigned int v17 = v11 + 8;
  sub_14710(a1, &__p);
  uint64_t v13 = a1[1];
  if (v17 != v16) {
    v17 += (v16 - v17 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  }
  if (__p) {
    operator delete(__p);
  }
  return v13;
}

void sub_146D8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_14710(uint64_t *a1, void *a2)
{
  a2[1] = v4;
  uint64_t v5 = *a1;
  *a1 = v4;
  a2[1] = v5;
  uint64_t v6 = a1[1];
  a1[1] = a2[2];
  a2[2] = v6;
  uint64_t v7 = a1[2];
  a1[2] = a2[3];
  a2[3] = v7;
  *a2 = a2[1];
}

double sub_14784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  if (a3 != a5)
  {
    uint64_t v8 = (double *)(a7 - 8);
    do
    {
      double v9 = *(double *)(a3 - 8);
      a3 -= 8LL;
      double result = v9;
      *v8-- = v9;
      v7 -= 8LL;
    }

    while (a3 != a5);
  }

  return result;
}

void *sub_147B0(void *a1)
{
  *a1 = &off_28B28;
  uint64_t v2 = a1 + 2;
  uint64_t v3 = (void *)a1[5];
  if (v3 == v2)
  {
    uint64_t v4 = 4LL;
    uint64_t v3 = v2;
    goto LABEL_5;
  }

  if (v3)
  {
    uint64_t v4 = 5LL;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }

  return a1;
}

void sub_1480C(char *__p)
{
  *(void *)__p = &off_28B28;
  uint64_t v2 = __p + 16;
  uint64_t v3 = (char *)*((void *)__p + 5);
  if (v3 == v2)
  {
    uint64_t v4 = 4LL;
    uint64_t v3 = v2;
    goto LABEL_5;
  }

  if (v3)
  {
    uint64_t v4 = 5LL;
LABEL_5:
    (*(void (**)(void))(*(void *)v3 + 8 * v4))();
  }

  operator delete(__p);
}

void *sub_14868(uint64_t a1)
{
  uint64_t v2 = operator new(0x30uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t v2 = &off_28B28;
  v2[1] = v3;
  sub_37E0((uint64_t)(v2 + 2), a1 + 16);
  return v2;
}

void sub_148AC(_Unwind_Exception *a1)
{
}

uint64_t sub_148C0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  *a2 = &off_28B28;
  a2[1] = v2;
  return sub_37E0((uint64_t)(a2 + 2), a1 + 16);
}

void *sub_148E0(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 16);
  double result = *(void **)(a1 + 40);
  if (result == v1)
  {
    uint64_t v3 = 4LL;
    double result = v1;
  }

  else
  {
    if (!result) {
      return result;
    }
    uint64_t v3 = 5LL;
  }

  return (void *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void sub_14914(char *__p)
{
  uint64_t v2 = __p + 16;
  uint64_t v3 = (char *)*((void *)__p + 5);
  if (v3 == v2)
  {
    uint64_t v4 = 4LL;
    uint64_t v3 = v2;
    goto LABEL_5;
  }

  if (v3)
  {
    uint64_t v4 = 5LL;
LABEL_5:
    (*(void (**)(void))(*(void *)v3 + 8 * v4))();
  }

  operator delete(__p);
}

BOOL sub_14964(uint64_t a1, void *a2)
{
  return sub_149D0(a1 + 8, a2);
}

uint64_t sub_1496C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24LL))(*v3, a1);
      return a1;
    }

    *(void *)(a1 + 24) = v4;
  }

  else
  {
    uint64_t v3 = (void *)(a1 + 24);
  }

  void *v3 = 0LL;
  return a1;
}

BOOL sub_149D0(uint64_t a1, void *a2)
{
  uint64_t v3 = (*(uint64_t (**)(void, char *))a1)(*a2, &v6);
  if (!v6) {
    return 0LL;
  }
  uint64_t v7 = v3;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4) {
    sub_3B48();
  }
  (*(void (**)(uint64_t, uint64_t *))(*(void *)v4 + 48LL))(v4, &v7);
  return v6 != 0;
}

void *sub_14A40(void *a1)
{
  *a1 = &off_28B70;
  uint64_t v2 = a1 + 2;
  uint64_t v3 = (void *)a1[5];
  if (v3 == v2)
  {
    uint64_t v4 = 4LL;
    uint64_t v3 = v2;
    goto LABEL_5;
  }

  if (v3)
  {
    uint64_t v4 = 5LL;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }

  return a1;
}

void sub_14A9C(char *__p)
{
  *(void *)__p = &off_28B70;
  uint64_t v2 = __p + 16;
  uint64_t v3 = (char *)*((void *)__p + 5);
  if (v3 == v2)
  {
    uint64_t v4 = 4LL;
    uint64_t v3 = v2;
    goto LABEL_5;
  }

  if (v3)
  {
    uint64_t v4 = 5LL;
LABEL_5:
    (*(void (**)(void))(*(void *)v3 + 8 * v4))();
  }

  operator delete(__p);
}

void *sub_14AF8(uint64_t a1)
{
  uint64_t v2 = operator new(0x30uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t v2 = &off_28B70;
  v2[1] = v3;
  sub_37E0((uint64_t)(v2 + 2), a1 + 16);
  return v2;
}

void sub_14B3C(_Unwind_Exception *a1)
{
}

uint64_t sub_14B50(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  *a2 = &off_28B70;
  a2[1] = v2;
  return sub_37E0((uint64_t)(a2 + 2), a1 + 16);
}

void *sub_14B70(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 16);
  double result = *(void **)(a1 + 40);
  if (result == v1)
  {
    uint64_t v3 = 4LL;
    double result = v1;
  }

  else
  {
    if (!result) {
      return result;
    }
    uint64_t v3 = 5LL;
  }

  return (void *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void sub_14BA4(char *__p)
{
  uint64_t v2 = __p + 16;
  uint64_t v3 = (char *)*((void *)__p + 5);
  if (v3 == v2)
  {
    uint64_t v4 = 4LL;
    uint64_t v3 = v2;
    goto LABEL_5;
  }

  if (v3)
  {
    uint64_t v4 = 5LL;
LABEL_5:
    (*(void (**)(void))(*(void *)v3 + 8 * v4))();
  }

  operator delete(__p);
}

BOOL sub_14BF4(uint64_t a1, void *a2)
{
  return sub_14C60(a1 + 8, a2);
}

uint64_t sub_14BFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24LL))(*v3, a1);
      return a1;
    }

    *(void *)(a1 + 24) = v4;
  }

  else
  {
    uint64_t v3 = (void *)(a1 + 24);
  }

  void *v3 = 0LL;
  return a1;
}

BOOL sub_14C60(uint64_t a1, void *a2)
{
  char v3 = (*(uint64_t (**)(void, char *))a1)(*a2, &v6);
  if (!v6) {
    return 0LL;
  }
  char v7 = v3;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4) {
    sub_3B48();
  }
  (*(void (**)(uint64_t, char *))(*(void *)v4 + 48LL))(v4, &v7);
  return v6 != 0;
}

void *sub_14CD8()
{
  double result = operator new(0x10uLL);
  void *result = &off_28BB8;
  return result;
}

void sub_14CFC(uint64_t a1, void *a2)
{
  *a2 = &off_28BB8;
}

void sub_14D14(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  sub_D858();
  if (v2)
  {
    sub_D858();
    char v3 = (os_log_s *)qword_2C190;
    if (os_log_type_enabled((os_log_t)qword_2C190, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 136315650;
      uint64_t v5 = "USBMIDIDevice.cpp";
      __int16 v6 = 1024;
      int v7 = 100;
      __int16 v8 = 1024;
      int v9 = v2;
      _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d =====> NOTICE: USB I/O destructive tracing at level %d <=====",  (uint8_t *)&v4,  0x18u);
    }
  }

void *sub_14DE4(uint64_t a1)
{
  double result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &off_28C00;
  result[1] = v3;
  return result;
}

uint64_t sub_14E18(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &off_28C00;
  a2[1] = v2;
  return result;
}

uint64_t sub_14E34(uint64_t result, _BYTE *a2)
{
  *(_BYTE *)(*(void *)(result + 8) + 187LL) = *a2;
  return result;
}

void *sub_14E4C(uint64_t a1)
{
  double result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &off_28C48;
  result[1] = v3;
  return result;
}

uint64_t sub_14E80(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &off_28C48;
  a2[1] = v2;
  return result;
}

uint64_t sub_14E9C(uint64_t result, _BYTE *a2)
{
  *(_BYTE *)(*(void *)(result + 8) + 489LL) = *a2;
  return result;
}

void *sub_14EB4(uint64_t a1)
{
  double result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &off_28C90;
  result[1] = v3;
  return result;
}

uint64_t sub_14EE8(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &off_28C90;
  a2[1] = v2;
  return result;
}

uint64_t sub_14F04(uint64_t result, _BYTE *a2)
{
  *(_BYTE *)(*(void *)(result + 8) + 49sub_5998(&a9, 0LL) = *a2;
  return result;
}

uint64_t sub_14F14(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)*a1 + 88LL))( *a1,  *a2,  *(unsigned int *)(*a1 + 220LL));
}

void *sub_14F2C(void *result, void *a2)
{
  void *result = *a2;
  return result;
}

void *sub_14F38(void *result, void *a2)
{
  void *result = *a2;
  return result;
}

uint64_t sub_14F48(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)*a1 + 96LL))( *a1,  *a2,  *(unsigned int *)(*a1 + 220LL));
}

void *sub_14F60(void *result, void *a2)
{
  void *result = *a2;
  return result;
}

void *sub_14F6C(void *result, void *a2)
{
  void *result = *a2;
  return result;
}

void *sub_14F7C@<X0>(uint64_t *a1@<X1>, uint64_t *a2@<X2>, unsigned __int16 *a3@<X3>, void *a4@<X8>)
{
  __int16 v8 = operator new(0x60uLL);
  double result = sub_14FEC(v8, a1, a2, a3);
  *a4 = v8 + 3;
  a4[1] = v8;
  return result;
}

void sub_14FD8(_Unwind_Exception *a1)
{
}

void *sub_14FEC(void *a1, uint64_t *a2, uint64_t *a3, unsigned __int16 *a4)
{
  a1[2] = 0LL;
  *a1 = off_288B0;
  a1[1] = 0LL;
  sub_15038((uint64_t)(a1 + 3), a2, a3, a4);
  return a1;
}

void sub_15024(_Unwind_Exception *a1)
{
}

uint64_t sub_15038(uint64_t a1, uint64_t *a2, uint64_t *a3, unsigned __int16 *a4)
{
  uint64_t v5 = *a2;
  __int16 v6 = (std::__shared_weak_count *)a3[1];
  uint64_t v10 = *a3;
  uint64_t v11 = v6;
  if (v6)
  {
    p_shared_weak_owners = (unint64_t *)&v6->__shared_weak_owners_;
    do
      unint64_t v8 = __ldxr(p_shared_weak_owners);
    while (__stxr(v8 + 1, p_shared_weak_owners));
  }

  sub_BFF0(a1, v5, &v10, *a4);
  if (v11) {
    std::__shared_weak_count::__release_weak(v11);
  }
  return a1;
}

void sub_150A0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_weak(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_150B8(__int128 *a1@<X1>, void *a2@<X8>)
{
  int v4 = operator new(0x168uLL);
  sub_15130(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  sub_15248((uint64_t)a2, v4 + 3, (uint64_t)(v4 + 3));
}

void sub_1511C(_Unwind_Exception *a1)
{
}

void *sub_15130(void *a1, __int128 *a2)
{
  a1[2] = 0LL;
  *a1 = off_28D28;
  a1[1] = 0LL;
  sub_151C0((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_15168(_Unwind_Exception *a1)
{
}

void sub_1517C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_28D28;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_15190(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_28D28;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_151B4(uint64_t a1)
{
  return sub_9D58(a1 + 24);
}

uint64_t sub_151C0(uint64_t a1, __int128 *a2)
{
  __int128 v7 = *a2;
  *(void *)a2 = 0LL;
  *((void *)a2 + 1) = 0LL;
  sub_9BB4(a1, &v7);
  uint64_t v3 = (std::__shared_weak_count *)*((void *)&v7 + 1);
  if (*((void *)&v7 + 1))
  {
    int v4 = (unint64_t *)(*((void *)&v7 + 1) + 8LL);
    do
      unint64_t v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }

  return a1;
}

void sub_15234( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_15248(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    int v4 = (std::__shared_weak_count *)a2[1];
    if (!v4 || v4->__shared_owners_ == -1)
    {
      unint64_t v5 = *(std::__shared_weak_count **)(a1 + 8);
      if (v5)
      {
        p_shared_owners = (unint64_t *)&v5->__shared_owners_;
        do
          unint64_t v7 = __ldxr(p_shared_owners);
        while (__stxr(v7 + 1, p_shared_owners));
        p_shared_weak_owners = (unint64_t *)&v5->__shared_weak_owners_;
        do
          unint64_t v9 = __ldxr(p_shared_weak_owners);
        while (__stxr(v9 + 1, p_shared_weak_owners));
        int v4 = (std::__shared_weak_count *)a2[1];
      }

      *a2 = a3;
      a2[1] = v5;
      if (v4) {
        std::__shared_weak_count::__release_weak(v4);
      }
      if (v5)
      {
        uint64_t v10 = (unint64_t *)&v5->__shared_owners_;
        do
          unint64_t v11 = __ldaxr(v10);
        while (__stlxr(v11 - 1, v10));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
      }
    }
  }

uint64_t sub_152F8(uint64_t a1, uint64_t a2, MIDIDeviceListRef a3, uint64_t a4)
{
  unint64_t v7 = sub_7F84((void *)a1, a4);
  void *v7 = off_28D60;
  v7[8] = a2;
  v7[9] = 0LL;
  v7[10] = 0LL;
  v7[11] = 0LL;
  *((_WORD *)v7 + 48) = 0;
  v37[0] = &off_28DA0;
  v37[1] = v7;
  uint64_t v38 = v37;
  sub_D6B4(@"forcemidi1fallback", @"com.apple.coremidi", (uint64_t)sub_3098, (uint64_t)v37);
  unint64_t v8 = v38;
  if (v38 == v37)
  {
    uint64_t v9 = 4LL;
    unint64_t v8 = v37;
  }

  else
  {
    if (!v38) {
      goto LABEL_6;
    }
    uint64_t v9 = 5LL;
  }

  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_6:
  v35[0] = &off_28DE8;
  v35[1] = a1;
  unsigned int v36 = v35;
  sub_D6B4(@"forcemidi1upfallback", @"com.apple.coremidi", (uint64_t)sub_3098, (uint64_t)v35);
  uint64_t v10 = v36;
  if (v36 == v35)
  {
    uint64_t v11 = 4LL;
    uint64_t v10 = v35;
  }

  else
  {
    if (!v36) {
      goto LABEL_11;
    }
    uint64_t v11 = 5LL;
  }

  (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_11:
  sub_155E4();
  uint64_t v12 = (os_log_s *)qword_2C1A0;
  if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = "";
    int v14 = *(unsigned __int8 *)(a1 + 97);
    if (*(_BYTE *)(a1 + 96)) {
      int v15 = "[AQAMIDI] Forcing USB MIDI 1.0 fallback for all USB MIDI 2.0 devices";
    }
    else {
      int v15 = "";
    }
    int v21 = 136316674;
    unsigned int v22 = "USBMIDIDeviceManager.cpp";
    __int16 v23 = 1024;
    int v24 = 43;
    if (v14) {
      uint64_t v13 = "[AQAMIDI] Selecting MIDI-1UP for all UMP-capable devices";
    }
    __int16 v25 = 2048;
    uint64_t v26 = a1;
    __int16 v27 = 2048;
    uint64_t v28 = a2;
    __int16 v29 = 1024;
    MIDIDeviceListRef v30 = a3;
    __int16 v31 = 2080;
    uint64_t v32 = v15;
    __int16 v33 = 2080;
    unsigned int v34 = v13;
    _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "%25s:%-5d [*] USBMIDIDeviceManager(%p)::USBMIDIDeviceManager(driver %p, devList %u) %s %s",  (uint8_t *)&v21,  0x40u);
  }

  int NumberOfDevices = MIDIDeviceListGetNumberOfDevices(a3);
  if (*(int *)(a2 + 28) >= 2 && NumberOfDevices >= 1)
  {
    ItemCount v17 = 0LL;
    uint64_t v18 = NumberOfDevices;
    do
    {
      MIDIObjectRef Device = MIDIDeviceListGetDevice(a3, v17);
      MIDIObjectSetIntegerProperty(Device, kMIDIPropertyOffline, 1);
      ++v17;
    }

    while (v18 != v17);
  }

  sub_4820(a1);
  return a1;
}

void sub_15570( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20, char *a21)
{
  int v24 = a21;
  if (a21 == v22)
  {
    uint64_t v25 = 4LL;
    int v24 = &a18;
  }

  else
  {
    if (!a21) {
      goto LABEL_6;
    }
    uint64_t v25 = 5LL;
  }

  (*(void (**)(void))(*(void *)v24 + 8 * v25))();
LABEL_6:
  sub_BBB8(&a9);
  sub_4600(v21);
  _Unwind_Resume(a1);
}

void sub_155E4()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_2C1A8);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_2C1A8))
    {
      qword_2C1A0 = (uint64_t)os_log_create("com.apple.coremidi", "usbmdm");
      __cxa_guard_release(&qword_2C1A8);
    }
  }

void *sub_15644(void *a1)
{
  *a1 = off_28D60;
  sub_155E4();
  uint64_t v2 = (os_log_s *)qword_2C1A0;
  if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)int v4 = 136315650;
    *(void *)&v4[4] = "USBMIDIDeviceManager.cpp";
    __int16 v5 = 1024;
    int v6 = 63;
    __int16 v7 = 2048;
    unint64_t v8 = a1;
    _os_log_impl( &dword_0,  v2,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] USBMIDIDeviceManager(%p)::~USBMIDIDeviceManager()",  v4,  0x1Cu);
  }

  *(void *)int v4 = a1 + 9;
  sub_BBB8((void ***)v4);
  sub_4600((uint64_t)a1);
  return a1;
}

void sub_15734(void *a1)
{
  uint64_t v1 = sub_15644(a1);
  operator delete(v1);
}

uint64_t sub_15748(uint64_t a1, uint64_t a2)
{
  int v4 = (os_log_s *)qword_2C1A0;
  if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315906;
    __int16 v7 = "USBMIDIDeviceManager.cpp";
    __int16 v8 = 1024;
    int v9 = 72;
    __int16 v10 = 2048;
    uint64_t v11 = a1;
    __int16 v12 = 2048;
    uint64_t v13 = a2;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] USBMIDIDeviceManager(%p)::MatchDevice(%p)",  (uint8_t *)&v6,  0x26u);
  }

  return (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 64) + 120LL))(*(void *)(a1 + 64), a2);
}

uint64_t sub_15834(uint64_t a1, uint64_t a2)
{
  int v4 = (os_log_s *)qword_2C1A0;
  if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315906;
    __int16 v7 = "USBMIDIDeviceManager.cpp";
    __int16 v8 = 1024;
    int v9 = 84;
    __int16 v10 = 2048;
    uint64_t v11 = a1;
    __int16 v12 = 2048;
    uint64_t v13 = a2;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] USBMIDIDeviceManager(%p)::UseDevice(%p)",  (uint8_t *)&v6,  0x26u);
  }

  return sub_1591C(a1, a2, 0LL);
}

uint64_t sub_1591C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_68C8(a2);
  uint64_t v74 = a3;
  if (a3 && (uint64_t v5 = sub_7A20(a3)) != 0)
  {
    uint64_t v6 = v5;
    if (sub_7DDC(a3)
      && !(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)v6 + 176LL))(v6, 1LL))
    {
      sub_155E4();
      unsigned int v22 = (os_log_s *)qword_2C1A0;
      if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "USBMIDIDeviceManager.cpp";
        *(_WORD *)&_BYTE buf[12] = 1024;
        *(_DWORD *)&buf[14] = 152;
        int v71 = 1;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "%25s:%-5d      Using MIDI 2.0 alt setting...", buf, 0x12u);
      }

      else
      {
        int v71 = 1;
      }

      char v70 = 0;
    }

    else
    {
      char v70 = 0;
      int v71 = 0;
    }
  }

  else
  {
    char v70 = 1;
    int v71 = 0;
  }

  uint64_t v7 = (*(uint64_t (**)(uint64_t, unsigned __int16 *))(*(void *)v4 + 104LL))(v4, &v89);
  if ((_DWORD)v7) {
    goto LABEL_147;
  }
  uint64_t v7 = (*(uint64_t (**)(uint64_t, unsigned __int16 *))(*(void *)v4 + 112LL))(v4, &v88);
  if ((_DWORD)v7) {
    goto LABEL_147;
  }
  sub_155E4();
  __int16 v8 = (os_log_s *)qword_2C1A0;
  if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = "USBMIDIDeviceManager.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 160;
    *(_WORD *)&_BYTE buf[18] = 1024;
    *(_DWORD *)&buf[20] = v89;
    *(_WORD *)&buf[24] = 1024;
    *(_DWORD *)&buf[26] = v88;
    *(_WORD *)&buf[30] = 1024;
    v98.i32[0] = v89;
    v98.i16[2] = 1024;
    *(__int32 *)((char *)&v98.i32[1] + 2) = v88;
    _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_INFO,  "%25s:%-5d [+] USBMIDIDeviceManager::UseDeviceAndInterface() vendor/product %d %d / 0x%04x 0x%04x",  buf,  0x2Au);
  }

  int v9 = v89;
  int v10 = v88;
  else {
    CFStringRef cf2 = sub_714C(a2, v90);
  }
  uint64_t v7 = (*(uint64_t (**)(uint64_t, SInt32 *))(*(void *)v4 + 160LL))(v4, &v87);
  if ((_DWORD)v7) {
    goto LABEL_145;
  }
  MIDIDeviceListRef v11 = MIDIGetDriverDeviceList((MIDIDriverRef)(*(void *)(a1 + 64) + 8LL));
  int NumberOfDevices = MIDIDeviceListGetNumberOfDevices(v11);
  char v72 = 0;
  SInt32 v12 = v10 | (v9 << 16);
  if (cf2) {
    int v13 = 1;
  }
  else {
    int v13 = 3;
  }
  if (cf2) {
    int v14 = 1;
  }
  else {
    int v14 = 2;
  }
  while (NumberOfDevices < 1)
  {
LABEL_52:
    if (v14++ >= v13)
    {
      MIDIDeviceListDispose(v11);
      goto LABEL_63;
    }
  }

  ItemCount v15 = 0LL;
  while (1)
  {
    uint64_t Device = MIDIDeviceListGetDevice(v11, v15);
    if (MIDIObjectGetIntegerProperty(Device, @"USBVendorProduct", &outValue) || outValue != v12) {
      goto LABEL_51;
    }
    if (v14 != 3) {
      break;
    }
    if (!MIDIObjectGetIntegerProperty(Device, kMIDIPropertyOffline, &value) && value) {
      goto LABEL_58;
    }
LABEL_51:
    if (NumberOfDevices == ++v15) {
      goto LABEL_52;
    }
  }

  if (v14 == 2)
  {
    if (!MIDIObjectGetIntegerProperty(Device, @"USBLocationID", v79) && v79[0] == v87) {
      goto LABEL_58;
    }
    goto LABEL_51;
  }

  if (v14 != 1) {
    goto LABEL_51;
  }
  if (MIDIObjectGetStringProperty(Device, @"SerialNumber", str))
  {
    *(void *)buf = 0LL;
    if (!MIDIObjectGetStringProperty(Device, kMIDIPropertyName, (CFStringRef *)buf))
    {
      BOOL v17 = CFEqual(*(CFTypeRef *)buf, @"USB MIDI Device") == 0;
      CFRelease(*(CFTypeRef *)buf);
      if (!v17) {
        goto LABEL_58;
      }
    }

    goto LABEL_51;
  }

  if (!CFEqual(str[0], cf2))
  {
    CFRelease(str[0]);
    goto LABEL_51;
  }

  if (!MIDIObjectGetIntegerProperty(Device, @"pluralSerial", &v85) && v85)
  {
    sub_155E4();
    uint64_t v18 = (os_log_s *)qword_2C1A0;
    if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "USBMIDIDeviceManager.cpp";
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = 202;
      _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_INFO,  "%25s:%-5d Device is known to have a plural serial number.",  buf,  0x12u);
    }

    goto LABEL_50;
  }

  OSStatus IntegerProperty = MIDIObjectGetIntegerProperty(Device, kMIDIPropertyOffline, &value);
  if (!(IntegerProperty | value))
  {
    sub_155E4();
    uint64_t v20 = (os_log_s *)qword_2C1A0;
    if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "USBMIDIDeviceManager.cpp";
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = 211;
      _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "%25s:%-5d WARNING - device has a plural serial number.",  buf,  0x12u);
    }

    MIDIObjectSetIntegerProperty(Device, @"pluralSerial", 1);
    char v72 = 1;
    goto LABEL_50;
  }

  if (v13 == 3)
  {
LABEL_50:
    CFRelease(str[0]);
    int v13 = 3;
    goto LABEL_51;
  }

  CFRelease(str[0]);
LABEL_58:
  MIDIDeviceListDispose(v11);
  MIDIEntityRef Entity = MIDIDeviceGetEntity(Device, 0LL);
  if (((v71 ^ (MIDIObjectGetIntegerProperty(Entity, kMIDIPropertyUMPActiveGroupBitmap, (SInt32 *)buf) != 0)) & 1) != 0)
  {
    if (!v89 || v89 == 6666)
    {
      MIDIObjectRef v24 = Device;
      goto LABEL_64;
    }

    if ((v71 & 1) != 0) {
      sub_16CB0(Device);
    }
    else {
      sub_16B34(Device);
    }
    sub_155E4();
    int v67 = (os_log_s *)qword_2C1A0;
    if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "USBMIDIDeviceManager.cpp";
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = 343;
      _os_log_impl(&dword_0, v67, OS_LOG_TYPE_INFO, "%25s:%-5d      existing device found", buf, 0x12u);
    }

    if ((v70 & 1) != 0 || (sub_7DDC(v74) & 1) != 0)
    {
      (*(void (**)(void, uint64_t, uint64_t, uint64_t))(**(void **)(a1 + 64) + 136LL))( *(void *)(a1 + 64),  Device,  a2,  v74);
      goto LABEL_105;
    }

    uint64_t v7 = 3758097101LL;
    sub_155E4();
    uint64_t v69 = qword_2C1A0;
    if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "USBMIDIDeviceManager.cpp";
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = 345;
      __int16 v62 = "%25s:%-5d      interface could not be opened (already in use by another driver?)";
      int v63 = (os_log_s *)v69;
      uint32_t v64 = 18;
LABEL_149:
      _os_log_impl(&dword_0, v63, OS_LOG_TYPE_INFO, v62, buf, v64);
    }

    return v7;
  }

  MIDISetupRemoveDevice(Device);
LABEL_63:
  MIDIObjectRef v24 = 0;
LABEL_64:
  sub_155E4();
  uint64_t v25 = (os_log_s *)qword_2C1A0;
  if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "USBMIDIDeviceManager.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 282;
    _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "%25s:%-5d      creating new device", buf, 0x12u);
  }

  uint64_t Device = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 64) + 128LL))( *(void *)(a1 + 64),  a2,  v74);
  unsigned int NumberOfEntities = MIDIDeviceGetNumberOfEntities(Device);
  int64x2_t v98 = 0u;
  memset(buf, 0, sizeof(buf));
  __int128 v83 = 0u;
  int64x2_t v84 = 0u;
  int64x2_t v81 = 0u;
  *(_OWORD *)str = 0u;
  *(_OWORD *)BOOL v79 = 0u;
  __int128 v80 = 0u;
  SInt32 value = 0;
  if (v24)
  {
    unsigned int v27 = NumberOfEntities;
    MIDIObjectGetIntegerProperty(v24, kMIDIPropertyUniqueID, &value);
    if (MIDIDeviceGetNumberOfEntities(v24) == v27)
    {
      SInt32 outValue = 0;
      if (v27)
      {
        ItemCount v28 = 0LL;
        uint64_t propertyID = v27;
        while (1)
        {
          MIDIEntityRef v29 = MIDIDeviceGetEntity(v24, v28);
          MIDIEntityRef v30 = MIDIDeviceGetEntity(Device, v28);
          MIDIObjectGetIntegerProperty(v29, kMIDIPropertyUniqueID, &outValue);
          sub_16E34(buf, &outValue);
          int NumberOfSources = MIDIEntityGetNumberOfSources(v29);
          int NumberOfDestinations = MIDIEntityGetNumberOfDestinations(v29);
          int v33 = MIDIEntityGetNumberOfSources(v30);
          int v34 = MIDIEntityGetNumberOfDestinations(v30);
          if (NumberOfSources != v33 || NumberOfDestinations != v34) {
            break;
          }
          if (NumberOfSources)
          {
            for (ItemCount i = 0LL; i != NumberOfSources; ++i)
            {
              MIDIObjectRef Source = MIDIEntityGetSource(v29, i);
              MIDIObjectGetIntegerProperty(Source, kMIDIPropertyUniqueID, &outValue);
              sub_16E34(str, &outValue);
            }
          }

          if (NumberOfDestinations)
          {
            for (ItemCount j = 0LL; j != NumberOfDestinations; ++j)
            {
              MIDIObjectRef Destination = MIDIEntityGetDestination(v29, j);
              MIDIObjectGetIntegerProperty(Destination, kMIDIPropertyUniqueID, &outValue);
              sub_16E34(v79, &outValue);
            }
          }

          if (++v28 == propertyID) {
            goto LABEL_83;
          }
        }

        SInt32 value = 0;
      }
    }

LABEL_127:
      sub_155E4();
      char v53 = (os_log_s *)qword_2C1A0;
      if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "USBMIDIDeviceManager.cpp";
        *(_WORD *)&_BYTE buf[12] = 1024;
        *(_DWORD *)&buf[14] = 390;
        *(_WORD *)&_BYTE buf[18] = 2048;
        *(CFStringRef *)&buf[20] = str[0];
        _os_log_impl(&dword_0, v53, OS_LOG_TYPE_INFO, "%25s:%-5d      initializing USB MIDI device %p", buf, 0x1Cu);
      }

      if (((*((uint64_t (**)(CFStringRef))str[0]->isa + 2))(str[0]) & 1) != 0)
      {
        if (*(void *)(a1 + 80) == *(void *)(a1 + 72)) {
          sub_16F1C((char **)(a1 + 72), 4uLL);
        }
        sub_99FC((char **)(a1 + 72), (__int128 *)str);
      }

      else
      {
        uint64_t v54 = (std::__shared_weak_count *)str[1];
        str[0] = 0LL;
        str[1] = 0LL;
        if (v54)
        {
          p_shared_owners = (unint64_t *)&v54->__shared_owners_;
          do
            unint64_t v56 = __ldaxr(p_shared_owners);
          while (__stlxr(v56 - 1, p_shared_owners));
          if (!v56)
          {
            ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
            std::__shared_weak_count::__release_weak(v54);
          }
        }

        sub_155E4();
        unsigned __int8 v57 = (os_log_s *)qword_2C1A0;
        if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "USBMIDIDeviceManager.cpp";
          *(_WORD *)&_BYTE buf[12] = 1024;
          *(_DWORD *)&buf[14] = 393;
          _os_log_impl( &dword_0,  v57,  OS_LOG_TYPE_ERROR,  "%25s:%-5d      [AQAMIDI] USB MIDI device initialization failed.",  buf,  0x12u);
        }
      }
    }

    else
    {
      uint64_t v7 = 4294956451LL;
    }

    unsigned int v58 = (std::__shared_weak_count *)str[1];
    if (str[1])
    {
      p_info = &str[1]->info;
      do
        unint64_t v60 = __ldaxr((unint64_t *)p_info);
      while (__stlxr(v60 - 1, (unint64_t *)p_info));
      if (!v60)
      {
        ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
        std::__shared_weak_count::__release_weak(v58);
      }
    }
  }

LABEL_145:
  if (cf2) {
    CFRelease(cf2);
  }
LABEL_147:
  sub_155E4();
  uint64_t v61 = qword_2C1A0;
  if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "USBMIDIDeviceManager.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 403;
    *(_WORD *)&_BYTE buf[18] = 1024;
    *(_DWORD *)&buf[20] = v7;
    __int16 v62 = "%25s:%-5d [-] USBMIDIDeviceManager::UseDeviceAndInterface() = 0x%x";
    int v63 = (os_log_s *)v61;
    uint32_t v64 = 24;
    goto LABEL_149;
  }

  return v7;
}

void sub_16AB8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

ItemCount sub_16B34(MIDIDeviceRef a1)
{
  ItemCount result = MIDIDeviceGetNumberOfEntities(a1);
  if (result)
  {
    for (ItemCount i = 0LL; i < result; ++i)
    {
      MIDIEntityRef Entity = MIDIDeviceGetEntity(a1, i);
      ItemCount NumberOfSources = MIDIEntityGetNumberOfSources(Entity);
      if (NumberOfSources < MIDIEntityGetNumberOfDestinations(Entity))
      {
        SInt32 outValue = 0;
        MIDIObjectGetIntegerProperty(Entity, @"Cable", &outValue);
        if (i != outValue)
        {
          sub_155E4();
          uint64_t v6 = (os_log_s *)qword_2C1A0;
          if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315906;
            int v9 = "USBMIDIDeviceManager.cpp";
            __int16 v10 = 1024;
            int v11 = 100;
            __int16 v12 = 1024;
            SInt32 v13 = outValue;
            __int16 v14 = 1024;
            int v15 = i;
            _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_INFO,  "%25s:%-5d replacing bad cable number %d with entity (cable) number %d",  buf,  0x1Eu);
          }

          MIDIObjectSetIntegerProperty(Entity, @"Cable", i);
        }
      }

      ItemCount result = MIDIDeviceGetNumberOfEntities(a1);
    }
  }

  return result;
}

unint64_t sub_16CB0(MIDIDeviceRef a1)
{
  unint64_t result = sub_17560(a1);
  if (v3)
  {
    unint64_t v4 = result;
    SInt32 value = 0;
    uint64_t v5 = (const __CFString *)kMIDIPropertyAssociatedEndpoint;
    unint64_t result = MIDIObjectGetIntegerProperty(result, kMIDIPropertyAssociatedEndpoint, &value);
    if ((_DWORD)result)
    {
      sub_155E4();
      uint64_t v6 = (os_log_s *)qword_2C1A0;
      if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_INFO))
      {
        SInt32 value = 136315394;
        __int16 v10 = "USBMIDIDeviceManager.cpp";
        __int16 v11 = 1024;
        int v12 = 117;
        _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_INFO,  "%25s:%-5d      updating cached UMP Endpoint properties",  (uint8_t *)&value,  0x12u);
      }

      SInt32 value = 0;
      if (!MIDIObjectGetIntegerProperty(v4, kMIDIPropertyUniqueID, &value)) {
        MIDIObjectSetIntegerProperty(HIDWORD(v4), v5, value);
      }
      SInt32 value = 0;
      if (!MIDIObjectGetIntegerProperty(HIDWORD(v4), kMIDIPropertyUniqueID, &value)) {
        MIDIObjectSetIntegerProperty(v4, v5, value);
      }
      ItemCount NumberOfEntities = MIDIDeviceGetNumberOfEntities(a1);
      MIDIEntityRef Entity = MIDIDeviceGetEntity(a1, NumberOfEntities - 1);
      return MIDIObjectSetIntegerProperty(Entity, kMIDIPropertyUMPActiveGroupBitmap, 15);
    }
  }

  return result;
}

void sub_16E34(void *a1, _DWORD *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  if (v4 == v5) {
    uint64_t v6 = 0LL;
  }
  else {
    uint64_t v6 = ((v4 - v5) << 7) - 1;
  }
  uint64_t v7 = a1[5];
  unint64_t v8 = v7 + a1[4];
  if (v6 == v8)
  {
    sub_177C0(a1);
    uint64_t v5 = a1[1];
    uint64_t v7 = a1[5];
    unint64_t v8 = a1[4] + v7;
  }

  *(_DWORD *)(*(void *)(v5 + ((v8 >> 7) & 0x1FFFFFFFFFFFFF8LL)) + 4 * (v8 & 0x3FF)) = *a2;
  a1[5] = v7 + 1;
}

uint64_t sub_16EB8(uint64_t a1, __int128 *a2)
{
  __int128 v3 = *a2;
  *(void *)a2 = 0LL;
  *((void *)a2 + 1) = 0LL;
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      unint64_t v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }

  return a1;
}

uint64_t sub_16F1C(char **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 4)
  {
    if (a2 >> 60) {
      sub_2DE0();
    }
    uint64_t v5 = a1[1] - *a1;
    uint64_t v17 = result;
    unint64_t v6 = (char *)sub_BB38(result, a2);
    int v9 = *a1;
    unint64_t v8 = a1[1];
    if (v8 == *a1)
    {
      int64x2_t v12 = vdupq_n_s64((unint64_t)v8);
      __int16 v10 = &v6[v5];
    }

    else
    {
      __int16 v10 = &v6[v5];
      do
      {
        __int128 v11 = *((_OWORD *)v8 - 1);
        v8 -= 16;
        *((_OWORD *)v10 - 1) = v11;
        v10 -= 16;
        *(void *)unint64_t v8 = 0LL;
        *((void *)v8 + 1) = 0LL;
      }

      while (v8 != v9);
      int64x2_t v12 = *(int64x2_t *)a1;
    }

    *a1 = v10;
    a1[1] = &v6[v5];
    int64x2_t v15 = v12;
    SInt32 v13 = a1[2];
    a1[2] = &v6[16 * v7];
    unsigned int v16 = v13;
    uint64_t v14 = v12.i64[0];
    return sub_BB6C((uint64_t)&v14);
  }

  return result;
}

void sub_16FD0(uint64_t a1, io_registry_entry_t entry)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(entry, @"locationID", kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    uint64_t v5 = CFProperty;
    CFTypeID v6 = CFGetTypeID(CFProperty);
    if (v6 != CFNumberGetTypeID())
    {
      CFRelease(v5);
      return;
    }

    BOOL v7 = CFNumberGetValue((CFNumberRef)v5, kCFNumberSInt32Type, &valuePtr) == 0;
    CFRelease(v5);
    if (v7) {
      return;
    }
    sub_155E4();
    unint64_t v8 = (os_log_s *)qword_2C1A0;
    if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      unsigned int v35 = "USBMIDIDeviceManager.cpp";
      __int16 v36 = 1024;
      int v37 = 438;
      __int16 v38 = 1024;
      io_registry_entry_t v39 = entry;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [+] USBMIDIDeviceManager::ServiceTerminated(0x%x)",  buf,  0x18u);
    }

    uint64_t v9 = *(void *)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 80);
    if (v9 == v10) {
      goto LABEL_43;
    }
    uint64_t v11 = *(void *)(a1 + 80);
    int v12 = valuePtr;
    while (1)
    {
      uint64_t v13 = *(void *)v9;
      uint64_t v14 = *(std::__shared_weak_count **)(v9 + 8);
      uint64_t v32 = *(void *)v9;
      int v33 = v14;
      if (v14)
      {
        p_shared_owners = (unint64_t *)&v14->__shared_owners_;
        do
          unint64_t v16 = __ldxr(p_shared_owners);
        while (__stxr(v16 + 1, p_shared_owners));
      }

      int v17 = *(_DWORD *)(*(void *)(v13 + 88) + 16LL);
      if (v17 == v12)
      {
        sub_155E4();
        uint64_t v18 = (os_log_s *)qword_2C1A0;
        if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          unsigned int v35 = "USBMIDIDeviceManager.cpp";
          __int16 v36 = 1024;
          int v37 = 442;
          __int16 v38 = 1024;
          io_registry_entry_t v39 = entry;
          _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      shutting down removed device 0x%X\n",  buf,  0x18u);
        }

        MIDIObjectSetIntegerProperty(*(_DWORD *)(v13 + 8), kMIDIPropertyOffline, 1);
      }

      if (v14)
      {
        unsigned int v19 = (unint64_t *)&v14->__shared_owners_;
        do
          unint64_t v20 = __ldaxr(v19);
        while (__stlxr(v20 - 1, v19));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }

      if (v17 == v12) {
        break;
      }
      v9 += 16LL;
      if (v9 == v10) {
        goto LABEL_44;
      }
    }

    if (v9 == v10) {
      goto LABEL_44;
    }
    uint64_t v21 = v9 + 16;
    if (v9 + 16 == v10)
    {
LABEL_43:
      uint64_t v11 = v9;
    }

    else
    {
      uint64_t v11 = v9;
      do
      {
        uint64_t v22 = *(void *)(v9 + 16);
        __int16 v23 = *(std::__shared_weak_count **)(v9 + 24);
        uint64_t v9 = v21;
        uint64_t v32 = v22;
        int v33 = v23;
        if (v23)
        {
          MIDIObjectRef v24 = (unint64_t *)&v23->__shared_owners_;
          do
            unint64_t v25 = __ldxr(v24);
          while (__stxr(v25 + 1, v24));
        }

        int v26 = *(_DWORD *)(*(void *)(v22 + 88) + 16LL);
        if (v26 == v12)
        {
          sub_155E4();
          unsigned int v27 = (os_log_s *)qword_2C1A0;
          if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            unsigned int v35 = "USBMIDIDeviceManager.cpp";
            __int16 v36 = 1024;
            int v37 = 442;
            __int16 v38 = 1024;
            io_registry_entry_t v39 = entry;
            _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      shutting down removed device 0x%X\n",  buf,  0x18u);
          }

          MIDIObjectSetIntegerProperty(*(_DWORD *)(v22 + 8), kMIDIPropertyOffline, 1);
        }

        if (v23)
        {
          ItemCount v28 = (unint64_t *)&v23->__shared_owners_;
          do
            unint64_t v29 = __ldaxr(v28);
          while (__stlxr(v29 - 1, v28));
          if (!v29)
          {
            ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
            std::__shared_weak_count::__release_weak(v23);
          }
        }

        if (v26 != v12)
        {
          sub_16EB8(v11, (__int128 *)v9);
          v11 += 16LL;
        }

        uint64_t v21 = v9 + 16;
      }

      while (v9 + 16 != v10);
    }

LABEL_44:
    sub_17448(a1 + 72, v11, *(void *)(a1 + 80));
    sub_155E4();
    MIDIEntityRef v30 = (os_log_s *)qword_2C1A0;
    if (os_log_type_enabled((os_log_t)qword_2C1A0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      unsigned int v35 = "USBMIDIDeviceManager.cpp";
      __int16 v36 = 1024;
      int v37 = 447;
      __int16 v38 = 1024;
      io_registry_entry_t v39 = entry;
      _os_log_impl( &dword_0,  v30,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [-] USBMIDIDeviceManager::ServiceTerminated(0x%x)",  buf,  0x18u);
    }
  }

void sub_17428( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_17448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 != a3)
  {
    uint64_t v5 = a3;
    uint64_t v6 = *(void *)(a1 + 8);
    if (a3 == v6)
    {
      uint64_t v8 = a2;
    }

    else
    {
      uint64_t v7 = 16 * ((a3 - a2) >> 4);
      uint64_t v8 = a2;
      do
      {
        sub_16EB8(v8, (__int128 *)(v8 + v7));
        v8 += 16LL;
      }

      while (v8 + v7 != v6);
      uint64_t v5 = *(void *)(a1 + 8);
    }

    while (v5 != v8)
      uint64_t v5 = sub_624C(v5 - 16);
    *(void *)(a1 + 8) = v8;
  }

  return a2;
}

BOOL sub_174E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v2 = *(void *)(a1 + 80);
  if (v3 == v2) {
    return 0LL;
  }
  int v4 = *(_DWORD *)(a2 + 16);
  uint64_t v5 = v3 + 16;
  do
  {
    int v6 = *(_DWORD *)(*(void *)(*(void *)(v5 - 16) + 88LL) + 16LL);
    BOOL result = v6 == v4;
    BOOL v8 = v6 == v4 || v5 == v2;
    v5 += 16LL;
  }

  while (!v8);
  return result;
}

BOOL sub_17524(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v2 = *(void *)(a1 + 80);
  if (v3 == v2) {
    return 0LL;
  }
  uint64_t v4 = v3 + 16;
  do
  {
    int v5 = *(_DWORD *)(*(void *)(*(void *)(v4 - 16) + 96LL) + 8LL);
    BOOL result = v5 == a2;
    BOOL v7 = v5 == a2 || v4 == v2;
    v4 += 16LL;
  }

  while (!v7);
  return result;
}

unint64_t sub_17560(MIDIDeviceRef a1)
{
  if (MIDIDeviceGetNumberOfEntities(a1))
  {
    ItemCount NumberOfEntities = MIDIDeviceGetNumberOfEntities(a1);
    MIDIEntityRef Entity = MIDIDeviceGetEntity(a1, NumberOfEntities - 1);
    ItemCount NumberOfSources = MIDIEntityGetNumberOfSources(Entity);
    ItemCount NumberOfDestinations = MIDIEntityGetNumberOfDestinations(Entity);
    uint64_t v6 = 0LL;
    unint64_t v7 = 0LL;
    if (NumberOfSources && NumberOfDestinations)
    {
      MIDIEntityGetNumberOfSources(Entity);
      MIDIEndpointRef Source = MIDIEntityGetSource(Entity, 0LL);
      MIDIEntityGetNumberOfDestinations(Entity);
      unint64_t v7 = Source & 0xFFFFFF00 | ((unint64_t)MIDIEntityGetDestination(Entity, 0LL) << 32);
      uint64_t v6 = Source;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
    unint64_t v7 = 0LL;
  }

  return v7 | v6;
}

void *sub_17618(uint64_t a1)
{
  BOOL result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &off_28DA0;
  result[1] = v3;
  return result;
}

uint64_t sub_1764C(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &off_28DA0;
  a2[1] = v2;
  return result;
}

uint64_t sub_17668(uint64_t result, _BYTE *a2)
{
  *(_BYTE *)(*(void *)(result + 8) + 96LL) = *a2;
  return result;
}

void *sub_17680(uint64_t a1)
{
  BOOL result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &off_28DE8;
  result[1] = v3;
  return result;
}

uint64_t sub_176B4(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &off_28DE8;
  a2[1] = v2;
  return result;
}

uint64_t sub_176D0(uint64_t result, _BYTE *a2)
{
  *(_BYTE *)(*(void *)(result + 8) + 97LL) = *a2;
  return result;
}

uint64_t sub_176E0(void *a1)
{
  uint64_t v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  a1[5] = 0LL;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = (void **)a1[2];
      uint64_t v2 = (void **)(a1[1] + 8LL);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }

    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }

  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 512LL;
  }

  else
  {
    if (v5 != 2) {
      goto LABEL_9;
    }
    uint64_t v6 = 1024LL;
  }

  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    unint64_t v7 = *v2++;
    operator delete(v7);
  }

  return sub_17774((uint64_t)a1);
}

uint64_t sub_17774(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8LL);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

void sub_177C0(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x400;
  unint64_t v4 = v2 - 1024;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    unint64_t v7 = (void *)a1[1];
    BOOL v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)BOOL v8 = v10;
      a1[2] += 8LL;
      return;
    }

    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      int v34 = (char *)sub_13EE4(v5, v33);
      unsigned int v35 = &v34[8 * (v33 >> 2)];
      int v37 = &v34[8 * v36];
      __int16 v38 = (uint64_t *)a1[1];
      BOOL v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        BOOL v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v40 = 8 * (v39 >> 3);
        MIDIEntityRef v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)MIDIEntityRef v41 = v42;
          v41 += 8;
          v40 -= 8LL;
        }

        while (v40);
      }

      goto LABEL_30;
    }

LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    unsigned int v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      uint64_t v9 = (char *)a1[1];
    }

    BOOL v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }

  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&__int128 v54 = operator new(0x1000uLL);
      sub_17AD4(a1, &v54);
      return;
    }

    *(void *)&__int128 v54 = operator new(0x1000uLL);
    sub_17BE8((uint64_t)a1, &v54);
    uint64_t v44 = (void *)a1[1];
    BOOL v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    uint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      int v34 = (char *)sub_13EE4((uint64_t)(a1 + 3), v46);
      unsigned int v35 = &v34[8 * (v46 >> 2)];
      int v37 = &v34[8 * v47];
      uint64_t v48 = (uint64_t *)a1[1];
      BOOL v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        BOOL v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v50 = 8 * (v49 >> 3);
        uint64_t v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)uint64_t v51 = v52;
          v51 += 8;
          v50 -= 8LL;
        }

        while (v50);
      }

LABEL_30:
      MIDIObjectRef v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        BOOL v8 = (char *)a1[2];
      }

      goto LABEL_33;
    }

    goto LABEL_5;
  }

  if (v23 == *a1) {
    unint64_t v25 = 1LL;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  unint64_t v56 = a1 + 3;
  *(void *)&__int128 v54 = sub_13EE4((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&__int128 v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  char v53 = operator new(0x1000uLL);
  sub_17D04(&v54, &v53);
  unsigned int v27 = (void *)a1[2];
  uint64_t v28 = -7LL - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8LL;
    sub_17E18((uint64_t)&v54, v27);
  }

  unint64_t v29 = (char *)*a1;
  __int128 v30 = v54;
  __int128 v31 = v55;
  *(void *)&__int128 v54 = *a1;
  *((void *)&v54 + 1) = v27;
  __int128 v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  __int128 v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&__int128 v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8LL);
  }
  if (v29) {
    operator delete(v29);
  }
}

        uint64_t v28 = v25 - 1;
        unint64_t v29 = *v20;
        if (!*v20 || *(_BYTE *)v18)
        {
          uint64_t v47 = WORD1(v21);
          uint64_t v48 = BYTE1(*(_DWORD *)v16);
          if (v28 == 1) {
            uint64_t v48 = 0;
          }
          else {
            uint64_t v24 = v47;
          }
          if (!v28)
          {
            uint64_t v24 = 0;
            uint64_t v48 = 0;
          }

          uint64_t v49 = ((_DWORD)v28 << 16) & 0xFF0000 | ((unint64_t)(v24 & 0x7F) << 8) | v48 & 0x7F | v90 | 0x300000;
        }

        else
        {
          __int16 v95 = 0;
          int v94 = 0;
          __int128 v30 = v28 + v29;
          if (v30)
          {
            __int128 v31 = 0LL;
            __int128 v32 = 0;
            unint64_t v33 = v21 >> 8;
            do
            {
              if ((int)v29 <= v32)
              {
                if (v30 - v31 == 2) {
                  int v34 = v24;
                }
                else {
                  int v34 = v33;
                }
              }

              else
              {
                int v34 = *((_BYTE *)v18 + v31);
              }

              *((_BYTE *)&v94 + v31) = v34;
              __int128 v31 = ++v32;
            }

            while (v30 > v32);
            unsigned int v35 = v94;
            uint64_t v36 = BYTE1(v94);
            int v37 = BYTE2(v94);
            __int16 v38 = HIBYTE(v94);
            uint64_t v39 = v95;
          }

          else
          {
            uint64_t v39 = 0;
            __int16 v38 = 0;
            int v37 = 0;
            uint64_t v36 = 0;
            unsigned int v35 = 0;
          }

          uint64_t v50 = v37 & 0x7F;
          uint64_t v51 = (unint64_t)(v35 & 0x7F) << 8;
          if (!v30) {
            uint64_t v51 = 0LL;
          }
          uint64_t v52 = v36 & 0x7F;
          if (v30 <= 1) {
            uint64_t v52 = 0LL;
          }
          char v53 = v50 << 56;
          if (v30 <= 2) {
            char v53 = 0LL;
          }
          __int128 v54 = (unint64_t)(v38 & 0x7F) << 48;
          if (v30 <= 3) {
            __int128 v54 = 0LL;
          }
          __int128 v55 = (unint64_t)(v39 & 0x7F) << 40;
          if (v30 <= 4) {
            __int128 v55 = 0LL;
          }
          uint64_t v49 = ((_DWORD)v30 << 16) & 0xCF0000LL | ((_DWORD)v19 << 24) | 0x30300000u | v55 | v54 | v52 | v53 | v51;
        }

        *(void *)words = v49;
        bzero(v18, 4uLL);
        os_log_s *v20 = 0;
LABEL_79:
        unint64_t v56 = MIDIEventListAdd((MIDIEventList *)evtlist, 0x200uLL, v17, a2, 2uLL, words);
        if (!v56) {
          goto LABEL_113;
        }
        uint64_t v17 = v56;
        bzero(v18, 4uLL);
        os_log_s *v20 = 0;
        goto LABEL_81;
      }

      if (v23 == 5)
      {
        if (BYTE2(v21) == 240 || BYTE2(v21) == 247)
        {
          if (BYTE2(v21) == 247)
          {
            unint64_t v25 = qword_23188[(v21 >> 24) & 0xF];
            goto LABEL_30;
          }

void sub_17A88( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_17AD4(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    unint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      unsigned int v19 = (char *)sub_13EE4(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8LL;
        }

        while (v24);
      }

      unsigned int v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }

    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }

      uint64_t v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }

  *(void *)uint64_t v6 = *a2;
  a1[2] += 8LL;
}

void sub_17BE8(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    unint64_t v7 = *(_BYTE **)(a1 + 24);
    uint64_t v8 = *(_BYTE **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1LL;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)sub_13EE4(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8LL];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8LL;
        }

        while (v19);
      }

      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }

    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }

      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }

  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }

  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8LL;
}

void sub_17D04(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      else {
        unint64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)sub_13EE4(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8LL;
        }

        while (v22);
      }

      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }

    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }

      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }

  *(void *)uint64_t v4 = *a2;
  a1[2] += 8LL;
}

void sub_17E18(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(_BYTE **)(a1 + 16);
    uint64_t v7 = *(_BYTE **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        unint64_t v11 = 1LL;
      }
      else {
        unint64_t v11 = (v7 - v4) >> 2;
      }
      uint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)sub_13EE4(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8LL];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      unint64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        unint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8LL;
        }

        while (v18);
      }

      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }

    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }

      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }

  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }

  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8LL;
}

const char *sub_17F30(int a1)
{
  if (a1 > 111)
  {
    if (a1 > 125)
    {
      if (a1 == 126) {
        return "Invalidate MUID";
      }
      if (a1 == 127) {
        return "NAK";
      }
    }

    else
    {
      if (a1 == 112) {
        return "Discovery";
      }
      if (a1 == 113) {
        return "DiscoveryReply";
      }
    }

    return "Unknown Message Type";
  }

  else
  {
    int v1 = a1 - 16;
    BOOL result = "Protocol Negotiation Inquiry";
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        BOOL result = "Protocol Negotiation Inquiry Response";
        break;
      case 2:
        BOOL result = "Protocol Negotiation Set";
        break;
      case 3:
        BOOL result = "Protocol Negotiation Test";
        break;
      case 4:
        BOOL result = "Protocol Negotiation Test Response";
        break;
      case 5:
        BOOL result = "Protocol Negotiation Confirmation";
        break;
      case 16:
        BOOL result = "Profile Inquiry";
        break;
      case 17:
        BOOL result = "Profile Inquiry Reply";
        break;
      case 18:
        BOOL result = "Set Profile On";
        break;
      case 19:
        BOOL result = "Set Profile Off";
        break;
      case 20:
        BOOL result = "Profile Enabled";
        break;
      case 21:
        BOOL result = "Profile Disabled";
        break;
      case 22:
        BOOL result = "Profile-Specific Data";
        break;
      case 32:
        BOOL result = "Property Inquiry";
        break;
      case 33:
        BOOL result = "Property Inquiry Reply";
        break;
      case 34:
        BOOL result = "Has Property";
        break;
      case 35:
        BOOL result = "Has Property Reply";
        break;
      case 36:
        BOOL result = "Get Property";
        break;
      case 37:
        BOOL result = "Get Property Reply";
        break;
      case 38:
        BOOL result = "Set Property";
        break;
      case 39:
        BOOL result = "Set Property Reply";
        break;
      case 40:
        BOOL result = "Property Subscription";
        break;
      case 41:
        BOOL result = "Property Subscription Reply";
        break;
      case 47:
        BOOL result = "Property Notify";
        break;
      default:
        return "Unknown Message Type";
    }
  }

  return result;
}

uint64_t sub_180DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_68C8(a1);
  sub_7A20(a2);
  return v3;
}

CFStringRef sub_18110(uint64_t a1, const __CFString *a2)
{
  uint64_t v4 = sub_68C8(a1);
  CFStringRef v5 = a2;
  if (v4)
  {
    int v6 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(void *)v4 + 272LL))(v4, &v14);
    if (v6)
    {
      int v7 = v6;
      sub_182F4();
      uint64_t v8 = (os_log_s *)qword_2C1B0;
      CFStringRef v5 = a2;
      if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        unint64_t v16 = "USBMIDIDriverBase.cpp";
        __int16 v17 = 1024;
        int v18 = 79;
        __int16 v19 = 1024;
        int v20 = v7;
        _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!]  USBGetManufacturerStringIndex() returned error 0x%x",  buf,  0x18u);
        CFStringRef v5 = a2;
      }
    }

    else
    {
      CFStringRef v5 = sub_714C(a1, v14);
    }

    int v9 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(void *)v4 + 280LL))(v4, &v14);
    if (v9)
    {
      int v10 = v9;
      sub_182F4();
      unint64_t v11 = (os_log_s *)qword_2C1B0;
      if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        unint64_t v16 = "USBMIDIDriverBase.cpp";
        __int16 v17 = 1024;
        int v18 = 84;
        __int16 v19 = 1024;
        int v20 = v10;
        _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!]  USBGetProductStringIndex() returned error 0x%x",  buf,  0x18u);
      }
    }

    else
    {
      sub_714C(a1, v14);
    }
  }

  if (v5) {
    return v5;
  }
  else {
    return a2;
  }
}

void sub_182F4()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_2C1B8);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_2C1B8))
    {
      qword_2C1B0 = (uint64_t)os_log_create("com.apple.coremidi", "usbmba");
      __cxa_guard_release(&qword_2C1B8);
    }
  }

double sub_18350@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = (unsigned __int8 *)(*(uint64_t (**)(uint64_t, void, void))(*(void *)a1 + 448LL))(a1, 0LL, 0LL);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *v3;
    if (*v3)
    {
      sub_92B4(v11, 3 * v5, 0);
      if (v11[23] >= 0) {
        int v6 = v11;
      }
      else {
        int v6 = *(_BYTE **)v11;
      }
      int v7 = v4;
      do
      {
        unsigned int v8 = *v7++;
        *int v6 = a0123456789abcd_1[(unint64_t)v8 >> 4];
        v6[1] = a0123456789abcd_1[v8 & 0xF];
        _BYTE v6[2] = 32;
        v6 += 3;
        --v5;
      }

      while (v5);
    }

    else
    {
      sub_BC28(v11, "");
    }

    *(void *)a2 = v4;
    double result = *(double *)v11;
    *(_OWORD *)(a2 + 8) = *(_OWORD *)v11;
    *(void *)(a2 + 24) = *(void *)&v11[16];
  }

  else
  {
    sub_182F4();
    int v9 = (os_log_s *)qword_2C1B0;
    if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)unint64_t v11 = 136315394;
      *(void *)&uint64_t v11[4] = "USBMIDIDriverBase.cpp";
      *(_WORD *)&v11[12] = 1024;
      *(_DWORD *)&v11[14] = 99;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] findDescriptors() - no interface descriptor found",  v11,  0x12u);
    }

    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }

  return result;
}

__n128 sub_184CC(uint64_t a1, unsigned __int8 *a2, void *a3, char **a4, char **a5, unsigned __int8 **a6)
{
  if (!a1) {
    return result;
  }
  int v6 = a2;
  if (!a2) {
    return result;
  }
  uint64_t v10 = a1;
  sub_182F4();
  unint64_t v11 = (os_log_s *)qword_2C1B0;
  if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v175 = "USBMIDIDriverBase.cpp";
    __int16 v176 = 1024;
    int v177 = 108;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%25s:%-5d [+] USBMIDIDriverBase::ParseDescriptors()", buf, 0x12u);
  }

  unsigned __int8 v166 = 0;
  int v173 = 0;
  v165 = a5;
  uint64_t v159 = (uint64_t)(a5 + 2);
  uint64_t v158 = (uint64_t)(a3 + 2);
  int v167 = -1;
  v168 = a3;
  uint64_t v160 = v10;
  do
  {
    uint64_t v12 = *v6;
    if (*v6)
    {
      sub_92B4(__p, 3 * v12, 0);
      uint64_t v13 = (void **)__p[0];
      if (v170 >= 0) {
        uint64_t v13 = __p;
      }
      unsigned __int8 v14 = v6;
      do
      {
        unsigned int v15 = *v14++;
        *(_BYTE *)uint64_t v13 = a0123456789abcd_1[(unint64_t)v15 >> 4];
        *((_BYTE *)v13 + 1) = a0123456789abcd_1[v15 & 0xF];
        *((_BYTE *)v13 + 2) = 32;
        uint64_t v13 = (void **)((char *)v13 + 3);
        --v12;
      }

      while (v12);
    }

    else
    {
      sub_BC28(__p, "");
    }

    int v16 = v6[1];
    int v17 = v6[2];
    sub_182F4();
    int v18 = (os_log_s *)qword_2C1B0;
    if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_DEBUG))
    {
      __int16 v19 = __p;
      if (v170 < 0) {
        __int16 v19 = (void **)__p[0];
      }
      *(_DWORD *)buf = 136315650;
      v175 = "USBMIDIDriverBase.cpp";
      __int16 v176 = 1024;
      int v177 = 139;
      __int16 v178 = 2080;
      *(void *)&__int128 v179 = v19;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d      Now @: %s", buf, 0x1Cu);
    }

    LOBYTE(v20) = 0;
    if (v16 > 35)
    {
      if (v16 != 36)
      {
        if (v16 != 37) {
          goto LABEL_198;
        }
        if (v17 == 1 && (v167 & 0x80000000) == 0)
        {
          sub_182F4();
          uint64_t v28 = (os_log_s *)qword_2C1B0;
          if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v175 = "USBMIDIDriverBase.cpp";
            __int16 v176 = 1024;
            int v177 = 197;
            _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_INFO,  "%25s:%-5d      USB MIDI 1.0 CS endpoint descriptor",  buf,  0x12u);
          }

          uint64_t v29 = v6[3];
          sub_182F4();
          __int128 v30 = (os_log_s *)qword_2C1B0;
          if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
          {
            unint64_t v31 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v168[1] - *v168) >> 1);
            *(_DWORD *)buf = 136315906;
            v175 = "USBMIDIDriverBase.cpp";
            __int16 v176 = 1024;
            int v177 = 200;
            __int16 v178 = 1024;
            LODWORD(v179) = v29;
            WORD2(v179) = 2048;
            *(void *)((char *)&v179 + 6) = v31;
            _os_log_impl( &dword_0,  v30,  OS_LOG_TYPE_INFO,  "%25s:%-5d      %d embedded MIDI jack(s), searching %lu jack(s) for a match",  buf,  0x22u);
          }

          if ((_DWORD)v29)
          {
            for (uint64_t i = 0LL; i != v29; ++i)
            {
              int v34 = (char *)*v168;
              unint64_t v33 = (char *)v168[1];
              if ((char *)*v168 != v33)
              {
                while (v34[2] != v6[i + 4])
                {
                  v34 += 6;
                  if (v34 == v33) {
                    goto LABEL_45;
                  }
                }
              }

              if (v34 == v33 || v34 == 0LL)
              {
LABEL_45:
                sub_182F4();
                uint64_t v36 = (os_log_s *)qword_2C1B0;
                if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315650;
                  v175 = "USBMIDIDriverBase.cpp";
                  __int16 v176 = 1024;
                  int v177 = 206;
                  __int16 v178 = 1024;
                  LODWORD(v179) = v166;
                  _os_log_impl( &dword_0,  v36,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Jack not found for endpoint 0x%x",  buf,  0x18u);
                }
              }

              else
              {
                sub_182F4();
                int v37 = (os_log_s *)qword_2C1B0;
                if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
                {
                  int v39 = v34[2];
                  *(_DWORD *)buf = 136315906;
                  v175 = "USBMIDIDriverBase.cpp";
                  __int16 v176 = 1024;
                  int v177 = 204;
                  __int16 v178 = 1024;
                  LODWORD(v179) = v39;
                  WORD2(v179) = 1024;
                  *(_DWORD *)((char *)&v179 + 6) = v166;
                  _os_log_impl( &dword_0,  v37,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Found jack %d for endpoint 0x%x",  buf,  0x1Eu);
                }

                v34[5] = v166;
                if (v167)
                {
                  unint64_t v40 = (unint64_t)a4[1];
                  unint64_t v41 = (unint64_t)a4[2];
                  if (v40 >= v41)
                  {
                    unint64_t v48 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v40 - (void)*a4) >> 1);
                    unint64_t v49 = v48 + 1;
                    if (v48 + 1 > 0x2AAAAAAAAAAAAAAALL) {
                      goto LABEL_221;
                    }
                    unint64_t v50 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v41 - (void)*a4) >> 1);
                    if (2 * v50 > v49) {
                      unint64_t v49 = 2 * v50;
                    }
                    if (v50 >= 0x1555555555555555LL) {
                      unint64_t v51 = 0x2AAAAAAAAAAAAAAALL;
                    }
                    else {
                      unint64_t v51 = v49;
                    }
                    if (v51) {
                      uint64_t v52 = (char *)sub_2EC4((uint64_t)(a4 + 2), v51);
                    }
                    else {
                      uint64_t v52 = 0LL;
                    }
                    unsigned int v58 = &v52[6 * v48];
                    int v59 = *(_DWORD *)v34;
                    *((_WORD *)v58 + 2) = *((_WORD *)v34 + 2);
                    *(_DWORD *)unsigned int v58 = v59;
                    uint64_t v61 = *a4;
                    unint64_t v60 = a4[1];
                    __int16 v62 = v58;
                    if (v60 != *a4)
                    {
                      do
                      {
                        int v63 = *(_DWORD *)(v60 - 6);
                        v60 -= 6;
                        __int16 v64 = *((_WORD *)v60 + 2);
                        *(_DWORD *)(v62 - 6) = v63;
                        v62 -= 6;
                        *((_WORD *)v62 + 2) = v64;
                      }

                      while (v60 != v61);
                      unint64_t v60 = *a4;
                    }

                    MIDIObjectRef v43 = v58 + 6;
                    *a4 = v62;
                    a4[1] = v58 + 6;
                    a4[2] = &v52[6 * v51];
                    if (v60) {
                      operator delete(v60);
                    }
                  }

                  else
                  {
                    int v42 = *(_DWORD *)v34;
                    *(_WORD *)(v40 + 4) = *((_WORD *)v34 + 2);
                    *(_DWORD *)unint64_t v40 = v42;
                    MIDIObjectRef v43 = (char *)(v40 + 6);
                  }

                  a4[1] = v43;
                }

                else
                {
                  unint64_t v44 = (unint64_t)v165[1];
                  unint64_t v45 = (unint64_t)v165[2];
                  if (v44 >= v45)
                  {
                    unint64_t v53 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v44 - (void)*v165) >> 1);
                    unint64_t v54 = v53 + 1;
                    if (v53 + 1 > 0x2AAAAAAAAAAAAAAALL) {
LABEL_221:
                    }
                      sub_2DE0();
                    unint64_t v55 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v45 - (void)*v165) >> 1);
                    if (2 * v55 > v54) {
                      unint64_t v54 = 2 * v55;
                    }
                    if (v55 >= 0x1555555555555555LL) {
                      unint64_t v56 = 0x2AAAAAAAAAAAAAAALL;
                    }
                    else {
                      unint64_t v56 = v54;
                    }
                    if (v56) {
                      unsigned __int8 v57 = (char *)sub_2EC4(v159, v56);
                    }
                    else {
                      unsigned __int8 v57 = 0LL;
                    }
                    int v65 = &v57[6 * v53];
                    int v66 = *(_DWORD *)v34;
                    *((_WORD *)v65 + 2) = *((_WORD *)v34 + 2);
                    *(_DWORD *)int v65 = v66;
                    unsigned __int8 v68 = *v165;
                    int v67 = v165[1];
                    uint64_t v69 = v65;
                    if (v67 == *v165)
                    {
                      char v72 = v165;
                    }

                    else
                    {
                      do
                      {
                        int v70 = *(_DWORD *)(v67 - 6);
                        v67 -= 6;
                        __int16 v71 = *((_WORD *)v67 + 2);
                        *(_DWORD *)(v69 - 6) = v70;
                        v69 -= 6;
                        *((_WORD *)v69 + 2) = v71;
                      }

                      while (v67 != v68);
                      char v72 = v165;
                      int v67 = *v165;
                    }

                    uint64_t v47 = v65 + 6;
                    os_log_s *v72 = v69;
                    v72[1] = v65 + 6;
                    v72[2] = &v57[6 * v56];
                    if (v67) {
                      operator delete(v67);
                    }
                  }

                  else
                  {
                    int v46 = *(_DWORD *)v34;
                    *(_WORD *)(v44 + 4) = *((_WORD *)v34 + 2);
                    *(_DWORD *)unint64_t v44 = v46;
                    uint64_t v47 = (char *)(v44 + 6);
                  }

                  v165[1] = v47;
                }
              }
            }
          }

          goto LABEL_86;
        }

        sub_182F4();
        __int128 v83 = (os_log_s *)qword_2C1B0;
        if (v17 == 2)
        {
          if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v175 = "USBMIDIDriverBase.cpp";
            __int16 v176 = 1024;
            int v177 = 216;
            _os_log_impl( &dword_0,  v83,  OS_LOG_TYPE_INFO,  "%25s:%-5d             (USB MIDI 2.0 CS endpoint descriptor)",  buf,  0x12u);
          }

          uint64_t v20 = v6[3];
          if (v6[3])
          {
            uint64_t v84 = 0LL;
            unsigned __int8 v85 = v166;
            if (v167) {
              unsigned __int8 v86 = v166;
            }
            else {
              unsigned __int8 v86 = 0;
            }
            char v163 = v86;
            if (v167) {
              unsigned __int8 v85 = 0;
            }
            char v162 = v85;
            do
            {
              int v87 = v6[v84 + 4];
              for (ItemCount j = *a6; j != a6[1]; j += 12)
              {
                if (*j == v87)
                {
                  sub_182F4();
                  int64x2_t v98 = (os_log_s *)qword_2C1B0;
                  if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
                  {
                    int v99 = *j;
                    *(_DWORD *)buf = 136315906;
                    v175 = "USBMIDIDriverBase.cpp";
                    __int16 v176 = 1024;
                    int v177 = 233;
                    __int16 v178 = 1024;
                    LODWORD(v179) = v99;
                    WORD2(v179) = 1024;
                    *(_DWORD *)((char *)&v179 + 6) = v166;
                    _os_log_impl( &dword_0,  v98,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Reusing group terminal blockID %d for endpoint 0x%x",  buf,  0x1Eu);
                  }

                  if (v167) {
                    j[6] = v166;
                  }
                  else {
                    j[7] = v166;
                  }
                  goto LABEL_144;
                }
              }

              sub_182F4();
              unsigned __int16 v89 = (os_log_s *)qword_2C1B0;
              if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315906;
                v175 = "USBMIDIDriverBase.cpp";
                __int16 v176 = 1024;
                int v177 = 226;
                __int16 v178 = 1024;
                LODWORD(v179) = v87;
                WORD2(v179) = 1024;
                *(_DWORD *)((char *)&v179 + 6) = v166;
                _os_log_impl( &dword_0,  v89,  OS_LOG_TYPE_INFO,  "%25s:%-5d      New group terminal blockID %d for endpoint 0x%x",  buf,  0x1Eu);
              }

              unsigned __int8 v90 = a6[1];
              v91 = a6[2];
              if (v90 >= v91)
              {
                unint64_t v93 = 0xAAAAAAAAAAAAAAABLL * ((v90 - *a6) >> 2);
                unint64_t v94 = v93 + 1;
                if (v93 + 1 > 0x1555555555555555LL) {
                  sub_2DE0();
                }
                unint64_t v95 = 0xAAAAAAAAAAAAAAABLL * ((v91 - *a6) >> 2);
                if (2 * v95 > v94) {
                  unint64_t v94 = 2 * v95;
                }
                if (v95 >= 0xAAAAAAAAAAAAAAALL) {
                  unint64_t v96 = 0x1555555555555555LL;
                }
                else {
                  unint64_t v96 = v94;
                }
                if (v96) {
                  v97 = (char *)sub_1DF24((uint64_t)(a6 + 2), v96);
                }
                else {
                  v97 = 0LL;
                }
                uint64_t v100 = &v97[12 * v93];
                *uint64_t v100 = v87;
                *(_DWORD *)(v100 + 1) = 0;
                v100[5] = 0;
                v100[6] = v163;
                v100[7] = v162;
                *((_DWORD *)v100 + 2) = 0;
                int v102 = *a6;
                unsigned __int8 v101 = a6[1];
                v103 = v100;
                if (v101 != *a6)
                {
                  do
                  {
                    uint64_t v104 = *(void *)(v101 - 12);
                    v101 -= 12;
                    int v105 = *((_DWORD *)v101 + 2);
                    *(void *)(v103 - 12) = v104;
                    v103 -= 12;
                    *((_DWORD *)v103 + 2) = v105;
                  }

                  while (v101 != v102);
                  unsigned __int8 v101 = *a6;
                }

                v92 = (unsigned __int8 *)(v100 + 12);
                *a6 = (unsigned __int8 *)v103;
                a6[1] = (unsigned __int8 *)(v100 + 12);
                a6[2] = (unsigned __int8 *)&v97[12 * v96];
                if (v101) {
                  operator delete(v101);
                }
              }

              else
              {
                unsigned __int8 *v90 = v87;
                *(_DWORD *)(v90 + 1) = 0;
                v90[5] = 0;
                v90[6] = v163;
                v90[7] = v162;
                v92 = v90 + 12;
                *((_DWORD *)v90 + 2) = 0;
              }

              a6[1] = v92;
LABEL_144:
              ++v84;
            }

            while (v84 != v20);
LABEL_86:
            LOBYTE(v20) = 0;
          }

          uint64_t v10 = v160;
          goto LABEL_198;
        }

        if (!os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_ERROR)) {
          goto LABEL_197;
        }
        *(_DWORD *)buf = 136315906;
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 241;
        __int16 v178 = 1024;
        LODWORD(v179) = 37;
        WORD2(v179) = 1024;
        *(_DWORD *)((char *)&v179 + 6) = v17;
        uint64_t v24 = v83;
        os_log_type_t v25 = OS_LOG_TYPE_ERROR;
        uint64_t v26 = "%25s:%-5d      Unrecognized type/subtype: 0x%x / 0x%x";
        uint32_t v27 = 30;
        goto LABEL_25;
      }

      if (v17 == 3)
      {
        int v112 = v6[6];
        int v113 = v6[3];
        int v114 = v6[4];
        unsigned __int8 v115 = v6[2 * v6[5] + 6];
        char v116 = (_BYTE *)v168[1];
        unint64_t v117 = v168[2];
        if ((unint64_t)v116 >= v117)
        {
          int v164 = v6[3];
          int v125 = v6[6];
          unint64_t v126 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v116[-*v168] >> 1);
          unint64_t v127 = v126 + 1;
          if (v126 + 1 > 0x2AAAAAAAAAAAAAAALL) {
            sub_2DE0();
          }
          unint64_t v128 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v117 - *v168) >> 1);
          if (2 * v128 > v127) {
            unint64_t v127 = 2 * v128;
          }
          if (v128 >= 0x1555555555555555LL) {
            unint64_t v129 = 0x2AAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v129 = v127;
          }
          if (v129) {
            v130 = (char *)sub_2EC4(v158, v129);
          }
          else {
            v130 = 0LL;
          }
          v138 = &v130[6 * v126];
          char *v138 = 3;
          v138[1] = v164;
          v138[2] = v114;
          int v112 = v125;
          v138[3] = v125;
          v138[4] = v115;
          v140 = (char *)*v168;
          v139 = (char *)v168[1];
          v141 = v138;
          if (v139 != (char *)*v168)
          {
            do
            {
              int v142 = *(_DWORD *)(v139 - 6);
              v139 -= 6;
              __int16 v143 = *((_WORD *)v139 + 2);
              *(_DWORD *)(v141 - 6) = v142;
              v141 -= 6;
              *((_WORD *)v141 + 2) = v143;
            }

            while (v139 != v140);
            v139 = (char *)*v168;
          }

          int v113 = v164;
          unint64_t v118 = v138 + 6;
          void *v168 = v141;
          v168[1] = v138 + 6;
          v168[2] = &v130[6 * v129];
          if (v139) {
            operator delete(v139);
          }
        }

        else
        {
          *char v116 = 3;
          v116[1] = v113;
          v116[2] = v114;
          v116[3] = v112;
          unint64_t v118 = v116 + 6;
          v116[4] = v115;
        }

        v168[1] = v118;
        sub_182F4();
        uint64_t v144 = qword_2C1B0;
        if (!os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO)) {
          goto LABEL_197;
        }
        int v145 = v6[5];
        v146 = "external";
        if (v113 == 1) {
          v146 = "embedded";
        }
        *(_DWORD *)buf = 136316418;
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 184;
        __int16 v178 = 2080;
        *(void *)&__int128 v179 = v146;
        WORD4(v179) = 1024;
        *(_DWORD *)((char *)&v179 + 10) = v114;
        HIWORD(v179) = 1024;
        *(_DWORD *)v180 = v112;
        *(_WORD *)&v180[4] = 1024;
        int v181 = v145;
        uint64_t v24 = (os_log_s *)v144;
        os_log_type_t v25 = OS_LOG_TYPE_INFO;
        uint64_t v26 = "%25s:%-5d      Added %s MIDI output jack %d: source jack %d, %d input pin(s)";
        uint32_t v27 = 46;
        goto LABEL_25;
      }

      if (v17 == 2)
      {
        int v106 = v6[3];
        int v107 = v6[4];
        unsigned __int8 v108 = v6[5];
        v109 = (_BYTE *)v168[1];
        unint64_t v110 = v168[2];
        if ((unint64_t)v109 >= v110)
        {
          unint64_t v120 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v109[-*v168] >> 1);
          unint64_t v121 = v120 + 1;
          if (v120 + 1 > 0x2AAAAAAAAAAAAAAALL) {
            sub_2DE0();
          }
          unint64_t v122 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v110 - *v168) >> 1);
          if (2 * v122 > v121) {
            unint64_t v121 = 2 * v122;
          }
          if (v122 >= 0x1555555555555555LL) {
            unint64_t v123 = 0x2AAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v123 = v121;
          }
          if (v123) {
            v124 = (char *)sub_2EC4(v158, v123);
          }
          else {
            v124 = 0LL;
          }
          uint64_t v131 = &v124[6 * v120];
          *uint64_t v131 = 2;
          v131[1] = v106;
          v131[2] = v107;
          v131[3] = 0;
          v131[4] = v108;
          __int128 v133 = (char *)*v168;
          uint64_t v132 = (char *)v168[1];
          v134 = v131;
          if (v132 == (char *)*v168)
          {
            v137 = (char **)v168;
          }

          else
          {
            do
            {
              int v135 = *(_DWORD *)(v132 - 6);
              v132 -= 6;
              __int16 v136 = *((_WORD *)v132 + 2);
              *(_DWORD *)(v134 - 6) = v135;
              v134 -= 6;
              *((_WORD *)v134 + 2) = v136;
            }

            while (v132 != v133);
            v137 = (char **)v168;
            uint64_t v132 = (char *)*v168;
          }

          unint64_t v111 = v131 + 6;
          *v137 = v134;
          v137[1] = v131 + 6;
          v137[2] = &v124[6 * v123];
          if (v132) {
            operator delete(v132);
          }
        }

        else
        {
          _BYTE *v109 = 2;
          v109[1] = v106;
          v109[2] = v107;
          v109[3] = 0;
          unint64_t v111 = v109 + 6;
          v109[4] = v108;
        }

        v168[1] = v111;
        sub_182F4();
        uint64_t v147 = qword_2C1B0;
        if (!os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO)) {
          goto LABEL_197;
        }
        *(_DWORD *)buf = 136315906;
        v148 = "external";
        if (v106 == 1) {
          v148 = "embedded";
        }
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 173;
        __int16 v178 = 2080;
        *(void *)&__int128 v179 = v148;
        WORD4(v179) = 1024;
        *(_DWORD *)((char *)&v179 + 10) = v107;
        uint64_t v24 = (os_log_s *)v147;
        os_log_type_t v25 = OS_LOG_TYPE_INFO;
        uint64_t v26 = "%25s:%-5d      Added %s MIDI input jack %d";
LABEL_24:
        uint32_t v27 = 34;
LABEL_25:
        _os_log_impl(&dword_0, v24, v25, v26, buf, v27);
        goto LABEL_197;
      }

      if (v17 != 1)
      {
        sub_182F4();
        uint64_t v119 = qword_2C1B0;
        if (!os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO)) {
          goto LABEL_197;
        }
        *(_DWORD *)buf = 136315650;
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 186;
        __int16 v178 = 1024;
        LODWORD(v179) = v17;
        uint64_t v24 = (os_log_s *)v119;
        os_log_type_t v25 = OS_LOG_TYPE_INFO;
        uint64_t v26 = "%25s:%-5d      Skipping unrecognized CS interface subtype %d...";
        uint32_t v27 = 24;
        goto LABEL_25;
      }

      sub_182F4();
      uint64_t v76 = (os_log_s *)qword_2C1B0;
      if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v77 = __p;
        if (v170 < 0) {
          uint64_t v77 = (void **)__p[0];
        }
        *(_DWORD *)buf = 136315650;
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 151;
        __int16 v178 = 2080;
        *(void *)&__int128 v179 = v77;
        _os_log_impl(&dword_0, v76, OS_LOG_TYPE_DEBUG, "%25s:%-5d      Found CS descriptor: %s", buf, 0x1Cu);
      }

      int v78 = *(unsigned __int16 *)(v6 + 3);
      sub_182F4();
      BOOL v79 = (os_log_s *)qword_2C1B0;
      BOOL v80 = os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO);
      if (v78 != 512)
      {
        if (v80)
        {
          *(_DWORD *)buf = 136315394;
          v175 = "USBMIDIDriverBase.cpp";
          __int16 v176 = 1024;
          int v177 = 163;
          uint64_t v24 = v79;
          os_log_type_t v25 = OS_LOG_TYPE_INFO;
          uint64_t v26 = "%25s:%-5d      Skipping CS interface descriptor";
          goto LABEL_189;
        }

LABEL_197:
        LOBYTE(v20) = 0;
        goto LABEL_198;
      }

      if (v80)
      {
        *(_DWORD *)buf = 136315394;
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 155;
        _os_log_impl( &dword_0,  v79,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Found a USB MIDI 2.0 alternate setting",  buf,  0x12u);
      }

      int v81 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v10 + 176LL))(v10, 1LL);
      sub_182F4();
      v82 = (os_log_s *)qword_2C1B0;
      if (!v81)
      {
        if (!os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO)) {
          goto LABEL_197;
        }
        *(_DWORD *)buf = 136315394;
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 160;
        uint64_t v24 = v82;
        os_log_type_t v25 = OS_LOG_TYPE_INFO;
        uint64_t v26 = "%25s:%-5d      Alternate interface now set for MIDI 2.0";
LABEL_189:
        uint32_t v27 = 18;
        goto LABEL_25;
      }

      if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 157;
        _os_log_impl(&dword_0, v82, OS_LOG_TYPE_ERROR, "%25s:%-5d      Unable to set MIDI 2.0 alt setting!", buf, 0x12u);
      }

      LOBYTE(v20) = 1;
    }

    else
    {
      if (v16 != 4)
      {
        if (v16 != 5) {
          goto LABEL_198;
        }
        unsigned int v21 = v6[2];
        int v167 = v21 >> 7;
        sub_182F4();
        uint64_t v22 = qword_2C1B0;
        unsigned __int8 v166 = v21;
        if (!os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO)) {
          goto LABEL_197;
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v23 = "output";
        if ((v21 & 0x80u) != 0) {
          uint64_t v23 = "input";
        }
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 192;
        __int16 v178 = 1024;
        LODWORD(v179) = v21;
        WORD2(v179) = 2080;
        *(void *)((char *)&v179 + 6) = v23;
        uint64_t v24 = (os_log_s *)v22;
        os_log_type_t v25 = OS_LOG_TYPE_INFO;
        uint64_t v26 = "%25s:%-5d      Examining endpoint 0x%x (%s)";
        goto LABEL_24;
      }

      unsigned int v73 = v6[3];
      sub_182F4();
      uint64_t v74 = (os_log_s *)qword_2C1B0;
      if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 143;
        __int16 v178 = 1024;
        LODWORD(v179) = v73;
        _os_log_impl(&dword_0, v74, OS_LOG_TYPE_INFO, "%25s:%-5d      Examining alt setting %d...", buf, 0x18u);
      }

      if (v73 < 2) {
        goto LABEL_197;
      }
      sub_182F4();
      uint64_t v75 = (os_log_s *)qword_2C1B0;
      LOBYTE(v20) = 1;
      if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 146;
        _os_log_impl(&dword_0, v75, OS_LOG_TYPE_INFO, "%25s:%-5d      Done examining descriptors; halting", buf, 0x12u);
      }
    }

LABEL_198:
    uint64_t v149 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, void))(*(void *)v10 + 448LL))(v10, v6, 0LL);
    if (!v149)
    {
      sub_182F4();
      v150 = (os_log_s *)qword_2C1B0;
      if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 248;
        _os_log_impl( &dword_0,  v150,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      FindNextAssociatedDescriptor() returned nullptr for kUSBAnyDesc",  buf,  0x12u);
      }

      uint64_t v149 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, uint64_t))(*(void *)v10 + 448LL))(v10, v6, 4LL);
      if (!v149)
      {
        sub_182F4();
        v151 = (os_log_s *)qword_2C1B0;
        if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v175 = "USBMIDIDriverBase.cpp";
          __int16 v176 = 1024;
          int v177 = 252;
          _os_log_impl( &dword_0,  v151,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      FindNextAssociatedDescriptor() returned nullptr for kUSBInterfaceDesc; done",
            buf,
            0x12u);
        }

        uint64_t v149 = 0LL;
      }
    }

    if (v170 < 0) {
      operator delete(__p[0]);
    }
    if (v149) {
      char v152 = v20;
    }
    else {
      char v152 = 1;
    }
    int v6 = (unsigned __int8 *)v149;
  }

  while ((v152 & 1) == 0);
  sub_182F4();
  v153 = (os_log_s *)qword_2C1B0;
  if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v175 = "USBMIDIDriverBase.cpp";
    __int16 v176 = 1024;
    int v177 = 118;
    _os_log_impl(&dword_0, v153, OS_LOG_TYPE_DEBUG, "%25s:%-5d      Bailing out of loop...", buf, 0x12u);
  }

  LOBYTE(__p[0]) = 0;
  __int16 v172 = 0;
  __int16 v171 = 0;
  (*(void (**)(uint64_t, void **))(*(void *)v10 + 80LL))(v10, __p);
  (*(void (**)(uint64_t, char *))(*(void *)v10 + 88LL))(v10, (char *)&v172 + 1);
  (*(void (**)(uint64_t, char *))(*(void *)v10 + 104LL))(v10, (char *)&v173 + 2);
  (*(void (**)(uint64_t, int *))(*(void *)v10 + 112LL))(v10, &v173);
  (*(void (**)(uint64_t, __int16 *))(*(void *)v10 + 136LL))(v10, &v172);
  (*(void (**)(uint64_t, char *))(*(void *)v10 + 144LL))(v10, (char *)&v171 + 1);
  (*(void (**)(uint64_t, __int16 *))(*(void *)v10 + 152LL))(v10, &v171);
  sub_182F4();
  v154 = (os_log_s *)qword_2C1B0;
  if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316418;
    v175 = "USBMIDIDriverBase.cpp";
    __int16 v176 = 1024;
    int v177 = 127;
    __int16 v178 = 1024;
    LODWORD(v179) = LOBYTE(__p[0]);
    WORD2(v179) = 1024;
    *(_DWORD *)((char *)&v179 + 6) = HIBYTE(v172);
    WORD5(v179) = 1024;
    HIDWORD(v179) = HIWORD(v173);
    *(_WORD *)v180 = 1024;
    *(_DWORD *)&v180[2] = (unsigned __int16)v173;
    _os_log_impl( &dword_0,  v154,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Interface class %d, subclass %d, for device 0x%04x /0x%04x",  buf,  0x2Au);
  }

  sub_182F4();
  v155 = (os_log_s *)qword_2C1B0;
  if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v175 = "USBMIDIDriverBase.cpp";
    __int16 v176 = 1024;
    int v177 = 128;
    __int16 v178 = 1024;
    LODWORD(v179) = v172;
    WORD2(v179) = 1024;
    *(_DWORD *)((char *)&v179 + 6) = HIBYTE(v171);
    WORD5(v179) = 1024;
    HIDWORD(v179) = v171;
    _os_log_impl( &dword_0,  v155,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Interface %d alternate setting %d : %d endpoints",  buf,  0x24u);
  }

  sub_182F4();
  v156 = (os_log_s *)qword_2C1B0;
  if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v175 = "USBMIDIDriverBase.cpp";
    __int16 v176 = 1024;
    int v177 = 255;
    _os_log_impl(&dword_0, v156, OS_LOG_TYPE_INFO, "%25s:%-5d [-] USBMIDIDriverBase::ParseDescriptors()", buf, 0x12u);
  }

  return result;
}

void sub_19AD8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, void *__p, uint64_t a32, int a33, __int16 a34, char a35, char a36)
{
  if (a36 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_19B20(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  int v7 = (os_log_s *)qword_2C1B0;
  if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 2);
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 260;
    *(_WORD *)&_BYTE buf[18] = 2048;
    *(void *)&buf[20] = a1;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = a2;
    *(_WORD *)&buf[34] = 2048;
    *(void *)&buf[36] = v8;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_INFO,  "%25s:%-5d [+] USBMIDIDriverBase::CreatePortMapList(inUSBDevice:%p, interfaceNum:%d) - Constructing a USB MIDI 2.0 port map list for %lu group terminal block(s)",  buf,  0x2Cu);
  }

  *a4 = 0LL;
  a4[1] = 0LL;
  a4[2] = 0LL;
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v106 = 0u;
  __int128 v107 = 0u;
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v97 = 0u;
  memset(buf, 0, sizeof(buf));
  sub_182F4();
  int v9 = (os_log_s *)qword_2C1B0;
  if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__b = 136315394;
    *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&__b[12] = 1024;
    *(_DWORD *)&__b[14] = 265;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Issuing device request to load group terminal block descriptors...",  __b,  0x12u);
  }

  int v87 = 0;
  sub_71D0(a1, a2, 1, (uint64_t)buf, 5, &v87);
  if (v87 != 5)
  {
    sub_182F4();
    unsigned __int8 v14 = (os_log_s *)qword_2C1B0;
    if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__b = 136316418;
      *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
      *(_WORD *)&__b[12] = 1024;
      *(_DWORD *)&__b[14] = 341;
      *(_WORD *)&__b[18] = 1024;
      *(_DWORD *)&__b[20] = a2;
      *(_WORD *)&__b[24] = 1024;
      *(_DWORD *)&__b[26] = 1;
      *(_WORD *)&__b[30] = 1024;
      *(_DWORD *)&__b[32] = 5;
      *(_WORD *)unsigned __int16 v89 = 1024;
      *(_DWORD *)&v89[2] = v87;
      _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!]  FATAL: Could not retrieve Group Terminal Descriptors for USB MIDI interface %d alternate setting %d. Expected header length %u but got %u",  __b,  0x2Au);
    }

    goto LABEL_99;
  }

  uint64_t v10 = buf[0];
  if (buf[0])
  {
    sub_92B4(__p, 3LL * buf[0], 0);
    if (v86 >= 0) {
      unint64_t v11 = __p;
    }
    else {
      unint64_t v11 = (void **)__p[0];
    }
    uint64_t v12 = buf;
    do
    {
      unsigned int v13 = *v12++;
      *(_BYTE *)unint64_t v11 = a0123456789abcd_1[(unint64_t)v13 >> 4];
      *((_BYTE *)v11 + 1) = a0123456789abcd_1[v13 & 0xF];
      *((_BYTE *)v11 + 2) = 32;
      unint64_t v11 = (void **)((char *)v11 + 3);
      --v10;
    }

    while (v10);
  }

  else
  {
    sub_BC28(__p, "");
  }

  int v15 = *(unsigned __int16 *)&buf[3];
  unsigned int v84 = 0;
  sub_182F4();
  int v16 = (os_log_s *)qword_2C1B0;
  if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
  {
    int v17 = __p;
    if (v86 < 0) {
      int v17 = (void **)__p[0];
    }
    *(_DWORD *)__b = 136315906;
    *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&__b[12] = 1024;
    *(_DWORD *)&__b[14] = 276;
    *(_WORD *)&__b[18] = 1024;
    *(_DWORD *)&__b[20] = v15;
    *(_WORD *)&__b[24] = 2080;
    *(void *)&__b[26] = v17;
    _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Got group terminal block descriptor header (totalLength = %d): %s",  __b,  0x22u);
  }

  sub_71D0(a1, a2, 1, (uint64_t)buf, v15, &v84);
  unsigned int v18 = v84;
  if (-991146299 * (v84 - v87) >= 0x13B13B14)
  {
    sub_182F4();
    __int16 v19 = (os_log_s *)qword_2C1B0;
    BOOL v20 = os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_ERROR);
    unsigned int v18 = v84;
    if (v20)
    {
      *(_DWORD *)__b = 136315650;
      *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
      *(_WORD *)&__b[12] = 1024;
      *(_DWORD *)&__b[14] = 279;
      *(_WORD *)&__b[18] = 1024;
      *(_DWORD *)&__b[20] = v84;
      _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_ERROR,  "%25s:%-5d      Unexpected group terminal descriptor length: %u",  __b,  0x18u);
      unsigned int v18 = v84;
    }
  }

  unsigned int v21 = v18 - v87;
  unsigned int v22 = (v18 - v87) / 0xD;
  if ((v18 - v87) % 0xD)
  {
    sub_182F4();
    uint64_t v23 = qword_2C1B0;
    if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__b = 136315650;
      *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
      *(_WORD *)&__b[12] = 1024;
      *(_DWORD *)&__b[14] = 283;
      *(_WORD *)&__b[18] = 1024;
      *(_DWORD *)&__b[20] = v84;
      uint64_t v24 = "%25s:%-5d      Unexpected total descriptor length: %u";
      os_log_type_t v25 = (os_log_s *)v23;
      os_log_type_t v26 = OS_LOG_TYPE_ERROR;
      uint32_t v27 = 24;
LABEL_33:
      _os_log_impl(&dword_0, v25, v26, v24, __b, v27);
    }
  }

  else
  {
    unint64_t v28 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 2);
    sub_182F4();
    uint64_t v29 = qword_2C1B0;
    if (v28 == v22)
    {
      if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
      {
        *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
        __int128 v30 = "s";
        *(_DWORD *)&__b[14] = 287;
        *(_DWORD *)__b = 136316162;
        *(_WORD *)&__b[12] = 1024;
        if (v21 - 13 < 0xD) {
          __int128 v30 = "";
        }
        *(_WORD *)&__b[18] = 1024;
        *(_DWORD *)&__b[20] = v22;
        *(_WORD *)&__b[24] = 2080;
        *(void *)&__b[26] = v30;
        *(_WORD *)&__b[34] = 1024;
        *(_DWORD *)unsigned __int16 v89 = v84;
        uint64_t v24 = "%25s:%-5d      Got %d group terminal block descriptor%s (receivedLength = %u). ";
        os_log_type_t v25 = (os_log_s *)v29;
        os_log_type_t v26 = OS_LOG_TYPE_INFO;
        uint32_t v27 = 40;
        goto LABEL_33;
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_ERROR))
    {
      int v31 = -1431655765 * ((*(void *)(a3 + 8) - *(void *)a3) >> 2);
      *(_DWORD *)__b = 136315906;
      *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
      *(_WORD *)&__b[12] = 1024;
      *(_DWORD *)&__b[14] = 285;
      *(_WORD *)&__b[18] = 1024;
      *(_DWORD *)&__b[20] = v31;
      *(_WORD *)&__b[24] = 1024;
      *(_DWORD *)&__b[26] = v22;
      uint64_t v24 = "%25s:%-5d      Expected %d descriptors, not %d";
      os_log_type_t v25 = (os_log_s *)v29;
      os_log_type_t v26 = OS_LOG_TYPE_ERROR;
      uint32_t v27 = 30;
      goto LABEL_33;
    }
  }

  unsigned int v82 = v21 - 13;
  if (v21 >= 0xD)
  {
    int v32 = 0;
    int v33 = 0;
    do
    {
      int v34 = &buf[13 * v32 + v87];
      uint64_t v35 = *v34;
      if (*v34)
      {
        sub_92B4(__b, 3 * v35, 0);
        uint64_t v36 = __b;
        if (__b[23] < 0) {
          uint64_t v36 = *(_BYTE **)__b;
        }
        do
        {
          unsigned int v37 = *v34++;
          _BYTE *v36 = a0123456789abcd_1[(unint64_t)v37 >> 4];
          v36[1] = a0123456789abcd_1[v37 & 0xF];
          v36[2] = 32;
          v36 += 3;
          --v35;
        }

        while (v35);
      }

      else
      {
        sub_BC28(__b, "");
      }

      if (SHIBYTE(v86) < 0) {
        operator delete(__p[0]);
      }
      *(_OWORD *)__p = *(_OWORD *)__b;
      uint64_t v86 = *(void *)&__b[16];
      sub_182F4();
      __int16 v38 = (os_log_s *)qword_2C1B0;
      if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
      {
        int v39 = __p;
        if (v86 < 0) {
          int v39 = (void **)__p[0];
        }
        *(_DWORD *)__b = 136315906;
        *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
        *(_WORD *)&__b[12] = 1024;
        *(_DWORD *)&__b[14] = 294;
        *(_WORD *)&__b[18] = 1024;
        *(_DWORD *)&__b[20] = v32;
        *(_WORD *)&__b[24] = 2080;
        *(void *)&__b[26] = v39;
        _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "%25s:%-5d      %00d: %s ", __b, 0x22u);
      }

      int v32 = ++v33;
    }

    while (v22 > v33);
  }

  sub_182F4();
  unint64_t v40 = (os_log_s *)qword_2C1B0;
  if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
  {
    MIDIObjectRef v43 = "s";
    *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
    *(_DWORD *)__b = 136315650;
    if (v82 < 0xD) {
      MIDIObjectRef v43 = "";
    }
    *(_WORD *)&__b[12] = 1024;
    *(_DWORD *)&__b[14] = 296;
    *(_WORD *)&__b[18] = 2080;
    *(void *)&__b[20] = v43;
    _os_log_impl( &dword_0,  v40,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Parsing group terminal block descriptor%s ...",  __b,  0x1Cu);
  }

  sub_1A808((unsigned __int8 **)a3, (unint64_t)&buf[5], v84, v41, v42);
  unint64_t v44 = *(void *)(a3 + 8);
  unint64_t v45 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v44 - *(void *)a3) >> 2));
  if (v44 == *(void *)a3) {
    uint64_t v46 = 0LL;
  }
  else {
    uint64_t v46 = v45;
  }
  sub_1DF68(*(void *)a3, v44, v46, 1);
  unint64_t v48 = *(unsigned __int8 **)a3;
  uint64_t v47 = *(unsigned __int8 **)(a3 + 8);
  if (*(unsigned __int8 **)a3 != v47)
  {
    char v49 = 0;
    unsigned __int8 v50 = 0;
    do
    {
      sub_182F4();
      unint64_t v51 = (os_log_s *)qword_2C1B0;
      if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
      {
        int v52 = *v48;
        int v53 = v48[1];
        int v54 = v48[2];
        int v55 = v48[3];
        int v56 = v48[6];
        int v57 = v48[7];
        int v58 = v48[4];
        *(_DWORD *)__b = 136317186;
        *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
        *(_WORD *)&__b[12] = 1024;
        *(_DWORD *)&__b[14] = 306;
        *(_WORD *)&__b[18] = 1024;
        *(_DWORD *)&__b[20] = v52;
        *(_WORD *)&__b[24] = 1024;
        *(_DWORD *)&__b[26] = v53;
        *(_WORD *)&__b[30] = 1024;
        *(_DWORD *)&__b[32] = v54;
        *(_WORD *)unsigned __int16 v89 = 1024;
        *(_DWORD *)&v89[2] = v55;
        __int16 v90 = 1024;
        int v91 = v56;
        __int16 v92 = 1024;
        int v93 = v57;
        __int16 v94 = 1024;
        int v95 = v58;
        _os_log_impl( &dword_0,  v51,  OS_LOG_TYPE_INFO,  "%25s:%-5d      blockID 0x%x blockType 0x%x first gt %u (%u total) inEP 0x%x outEP 0x%x gtb.midiProtocol 0x%x",  __b,  0x3Cu);
      }

      if (!v48[4])
      {
        int v61 = v48[6];
        int v62 = v48[7];
        sub_182F4();
        int v63 = (os_log_s *)qword_2C1B0;
        if (!v61 || !v62)
        {
          if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_ERROR))
          {
            int v78 = *v48;
            *(_DWORD *)__b = 136315650;
            *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
            *(_WORD *)&__b[12] = 1024;
            *(_DWORD *)&__b[14] = 319;
            *(_WORD *)&__b[18] = 1024;
            *(_DWORD *)&__b[20] = v78;
            _os_log_impl( &dword_0,  v63,  OS_LOG_TYPE_ERROR,  "%25s:%-5d      blockID 0x%x cannot use MIDI-CI without both a valid input and output endpoint. Skipping ...",  __b,  0x18u);
          }

          goto LABEL_91;
        }

        if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__b = 136315394;
          *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
          *(_WORD *)&__b[12] = 1024;
          *(_DWORD *)&__b[14] = 315;
          _os_log_impl( &dword_0,  v63,  OS_LOG_TYPE_INFO,  "%25s:%-5d           (MIDI-CI protocol negotiation will occur before going online)",  __b,  0x12u);
        }
      }

      unsigned int v59 = v48[1];
      if ((v59 | 2) == 2) {
        int v60 = v48[6];
      }
      else {
        int v60 = 0;
      }
      if (v59 >= 2) {
        unsigned __int8 v64 = 0;
      }
      else {
        unsigned __int8 v64 = v48[7];
      }
      if (v60 || v64)
      {
        unint64_t v65 = *a4;
        unsigned int v66 = v48[2];
        if (v48[4] < 5u) {
          char v67 = 1;
        }
        else {
          char v67 = 2;
        }
        if (v48[4]) {
          char v68 = v67;
        }
        else {
          char v68 = -1;
        }
        unsigned __int8 v69 = v48[3];
        unsigned __int8 v70 = *v48;
        __b[0] = v49;
        __b[1] = v50;
        __b[2] = v60;
        __b[3] = v64;
        __b[4] = v68;
        __b[5] = v66;
        __b[6] = v69;
        __b[7] = v70;
        sub_1A880(a4, v65, (double *)__b);
        sub_182F4();
        __int16 v71 = (os_log_s *)qword_2C1B0;
        if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
        {
          int v72 = *v48;
          unsigned int v73 = v48[4];
          if (v73 < 5) {
            int v74 = 1;
          }
          else {
            int v74 = 2;
          }
          BOOL v75 = v73 == 0;
          int v76 = v48[2];
          if (v75) {
            int v74 = 255;
          }
          int v77 = v48[3];
          *(_DWORD *)__b = 136317186;
          *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
          *(_WORD *)&__b[12] = 1024;
          *(_DWORD *)&__b[14] = 332;
          *(_WORD *)&__b[18] = 1024;
          *(_DWORD *)&__b[20] = v72;
          *(_WORD *)&__b[24] = 1024;
          *(_DWORD *)&__b[26] = v50;
          *(_WORD *)&__b[30] = 1024;
          *(_DWORD *)&__b[32] = v60;
          *(_WORD *)unsigned __int16 v89 = 1024;
          *(_DWORD *)&v89[2] = v64;
          __int16 v90 = 1024;
          int v91 = v74;
          __int16 v92 = 1024;
          int v93 = v76;
          __int16 v94 = 1024;
          int v95 = v77;
          _os_log_impl( &dword_0,  v71,  OS_LOG_TYPE_INFO,  "%25s:%-5d      blockID 0x%x cable 0x%x, inEP 0x%x, outEP 0x%x, usbpipeprotocol 0x%00x, firstGroupTerminal %d , numGroups %d -> maplist",  __b,  0x3Cu);
        }

        ++v49;
        v50 += v48[3];
      }

LABEL_91:
      v48 += 12;
    }

    while (v48 != v47);
  }

  sub_182F4();
  BOOL v79 = (os_log_s *)qword_2C1B0;
  if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
  {
    uint64_t v80 = (a4[1] - *a4) >> 3;
    *(_DWORD *)__b = 136315650;
    *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&__b[12] = 1024;
    *(_DWORD *)&__b[14] = 337;
    *(_WORD *)&__b[18] = 2048;
    *(void *)&__b[20] = v80;
    _os_log_impl( &dword_0,  v79,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Maplist constructed with %lu group terminal block(s).",  __b,  0x1Cu);
  }

  if (SHIBYTE(v86) < 0) {
    operator delete(__p[0]);
  }
LABEL_99:
  sub_182F4();
  int v81 = (os_log_s *)qword_2C1B0;
  if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__b = 136315394;
    *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&__b[12] = 1024;
    *(_DWORD *)&__b[14] = 343;
    _os_log_impl(&dword_0, v81, OS_LOG_TYPE_INFO, "%25s:%-5d [-] USBMIDIDriverBase::CreatePortMapList()", __b, 0x12u);
  }

void sub_1A7C0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20, char a21, char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  uint64_t v23 = *(void **)a15;
  if (*(void *)a15)
  {
    *(void *)(a15 + 8) = v23;
    operator delete(v23);
  }

  _Unwind_Resume(exception_object);
}

unsigned __int8 **sub_1A808( unsigned __int8 **result, unint64_t a2, unsigned int a3, uint8x8_t a4, int16x8_t a5)
{
  if (a3)
  {
    unint64_t v5 = a2 + a3;
    int v6 = *result;
    int v7 = result[1];
    do
    {
      if (v6 != v7)
      {
        unint64_t v8 = v6;
        while (*v8 != *(unsigned __int8 *)(a2 + 3))
        {
          v8 += 12;
          if (v8 == v7) {
            goto LABEL_9;
          }
        }

        v8[1] = *(_BYTE *)(a2 + 4);
        a4.i32[0] = *(_DWORD *)(a2 + 5);
        int16x4_t v9 = (int16x4_t)vmovl_u8(a4).u64[0];
        *(int16x4_t *)a5.i8 = vrev32_s16(v9);
        a5.i32[0] = v9.i32[0];
        a4 = (uint8x8_t)vmovn_s16(a5);
        *(_DWORD *)(v8 + 2) = a4.i32[0];
        *((_WORD *)v8 + 4) = *(_WORD *)(a2 + 9);
        *((_WORD *)v8 + 5) = *(_WORD *)(a2 + 11);
      }

uint64_t *sub_1A880(uint64_t *a1, uint64_t a2, double *a3)
{
  uint64_t v4 = (uint64_t *)a2;
  unint64_t v6 = a1[1];
  unint64_t v9 = a1[2];
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = v9;
  if (v6 >= v9)
  {
    uint64_t v10 = *a1;
    unint64_t v11 = ((uint64_t)(v6 - *a1) >> 3) + 1;
    if (v11 >> 61) {
      sub_2DE0();
    }
    uint64_t v12 = (a2 - v10) >> 3;
    uint64_t v13 = v8 - v10;
    uint64_t v14 = v13 >> 2;
    if (v13 >> 2 <= v11) {
      uint64_t v14 = ((uint64_t)(v6 - *a1) >> 3) + 1;
    }
    else {
      unint64_t v15 = v14;
    }
    uint64_t v22 = v7;
    if (v15) {
      int v16 = (char *)sub_13EE4(v7, v15);
    }
    else {
      int v16 = 0LL;
    }
    __p = v16;
    __int16 v19 = &v16[8 * v12];
    BOOL v20 = v19;
    unsigned int v21 = &v16[8 * v15];
    sub_1EDE0((uint64_t)&__p, a3);
    uint64_t v4 = (uint64_t *)sub_1EF50((uint64_t)a1, &__p, v4);
    if (v20 != v19) {
      v20 += (v19 - v20 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    }
    if (__p) {
      operator delete(__p);
    }
  }

  else if (a2 == v6)
  {
    *(double *)a2 = *a3;
    a1[1] = a2 + 8;
  }

  else
  {
    sub_1ED8C((uint64_t)a1, a2, v6, (char *)(a2 + 8));
    *uint64_t v4 = *(void *)a3;
  }

  return v4;
}

void sub_1A9B8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A9F0(uint64_t a1@<X0>, int a2@<W1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t *a5@<X8>)
{
  *a5 = 0LL;
  a5[1] = 0LL;
  a5[2] = 0LL;
  sub_182F4();
  uint64_t v10 = (os_log_s *)qword_2C1B0;
  if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((a3[1] - *a3) >> 1);
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 1);
    *(_DWORD *)uint8x8_t v41 = 136316418;
    *(void *)&v41[4] = "USBMIDIDriverBase.cpp";
    __int16 v42 = 1024;
    int v43 = 349;
    __int16 v44 = 2048;
    uint64_t v45 = a1;
    __int16 v46 = 1024;
    int v47 = a2;
    __int16 v48 = 2048;
    unint64_t v49 = v11;
    __int16 v50 = 2048;
    unint64_t v51 = v12;
    _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_INFO,  "%25s:%-5d [+] USBMIDIDriverBase::CreatePortMapList(inUSBDevice:%p, interfaceNum:%d) - Constructing a USB MIDI 1.0 port map list for %lu inputs and %lu outputs...",  v41,  0x36u);
  }

  uint64_t v14 = *a3;
  uint64_t v13 = a3[1];
  if (v13 == *a3)
  {
    unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((v13 - *a3) >> 1);
  }

  else
  {
    unint64_t v15 = 0LL;
    unint64_t v16 = a5[1];
    do
    {
      int v17 = *(unsigned __int8 *)(v14 + 6 * v15 + 5);
      uint64_t v18 = *a5;
      if (*a5 == v16)
      {
        char v19 = 0;
      }

      else
      {
        char v19 = 0;
        do
        {
          char v20 = (v17 & 0x80) != 0 && *(unsigned __int8 *)(v18 + 2) == v17
             || (v17 & 0x80u) == 0 && *(unsigned __int8 *)(v18 + 3) == v17;
          v19 += v20;
          v18 += 8LL;
        }

        while (v18 != v16);
      }

      v41[0] = v15;
      v41[1] = v19;
      v41[2] = v17;
      *(_DWORD *)&v41[3] = 0;
      v41[7] = 0;
      if (v16 >= a5[2])
      {
        unint64_t v16 = sub_145FC(a5, v41);
        uint64_t v14 = *a3;
        uint64_t v13 = a3[1];
      }

      else
      {
        *(_BYTE *)unint64_t v16 = v15;
        *(_BYTE *)(v16 + 1) = v19;
        *(_BYTE *)(v16 + 2) = v17;
        *(_DWORD *)(v16 + 3) = 0;
        *(_BYTE *)(v16 + 7) = 0;
        v16 += 8LL;
      }

      a5[1] = v16;
      ++v15;
      unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((v13 - v14) >> 1);
    }

    while (v22 > v15);
  }

  uint64_t v24 = *a4;
  uint64_t v23 = a4[1];
  unint64_t v25 = (v23 - *a4) / 6;
  if (v25 >= v22) {
    LODWORD(v26) = v22;
  }
  else {
    uint64_t v26 = (v23 - *a4) / 6;
  }
  if ((int)v26 <= 0)
  {
    unint64_t v28 = a5[1];
  }

  else
  {
    uint64_t v27 = 0LL;
    uint64_t v29 = *a5;
    unint64_t v28 = a5[1];
    do
    {
      if (v27 == v25) {
        sub_13F18();
      }
      if (v29 != v28)
      {
        int v30 = *(unsigned __int8 *)(v24 + 6 * v27 + 5);
        uint64_t v31 = v29;
        while (1)
        {
          int v32 = *(unsigned __int8 *)(v31 + 3);
          if ((v30 & 0x80) == 0 && v32 == v30)
          {
            int v32 = *(unsigned __int8 *)(v31 + 2);
            break;
          }

          v31 += 8LL;
          if (v31 == v28) {
            goto LABEL_45;
          }
        }

        uint64_t v33 = v29;
        if (v32)
        {
          while (*(unsigned __int8 *)(v33 + 2) != v32 || *(_BYTE *)(v33 + 3))
          {
            v33 += 8LL;
            if (v33 == v28) {
              goto LABEL_51;
            }
          }

          goto LABEL_50;
        }

LABEL_45:
        if (v29 == v28) {
          goto LABEL_51;
        }
        uint64_t v33 = v29;
        while (*(_BYTE *)(v33 + 3))
        {
          v33 += 8LL;
          if (v33 == v28) {
            goto LABEL_51;
          }
        }

LABEL_50:
        *(_BYTE *)(v33 + 3) = v30;
      }

LABEL_51:
      ++v27;
    }

    while (v27 != v26);
  }

  uint64_t v34 = v28 - *a5;
  if (v25 > v34 >> 3)
  {
    unint64_t v35 = v34 >> 3;
    unint64_t v36 = (unint64_t)v34 >> 3;
    int v37 = *(unsigned __int8 *)(v24 + 6 * v35 + 5);
    do
    {
      int v38 = v37;
      int v37 = *(unsigned __int8 *)(v24 + 6 * v35 + 5);
      if (v38 == v37) {
        int v39 = v36;
      }
      else {
        int v39 = 0;
      }
      v41[0] = v35;
      *(_WORD *)&v41[1] = v39;
      v41[3] = v37;
      *(_DWORD *)&v41[4] = 1;
      if (v28 >= a5[2])
      {
        unint64_t v28 = sub_145FC(a5, v41);
        uint64_t v24 = *a4;
        uint64_t v23 = a4[1];
      }

      else
      {
        *(_BYTE *)unint64_t v28 = v35;
        *(_BYTE *)(v28 + 1) = v39;
        *(_BYTE *)(v28 + 2) = 0;
        *(_BYTE *)(v28 + 3) = v37;
        *(_DWORD *)(v28 + 4) = 1;
        v28 += 8LL;
      }

      LODWORD(v36) = v39 + 1;
      a5[1] = v28;
      unint64_t v35 = (uint64_t)(v28 - *a5) >> 3;
    }

    while (v35 < 0xAAAAAAAAAAAAAAABLL * ((v23 - v24) >> 1));
  }

  sub_182F4();
  unint64_t v40 = (os_log_s *)qword_2C1B0;
  if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint8x8_t v41 = 136315394;
    *(void *)&v41[4] = "USBMIDIDriverBase.cpp";
    __int16 v42 = 1024;
    int v43 = 398;
    _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "%25s:%-5d [-] USBMIDIDriverBase::CreatePortMapList()", v41, 0x12u);
  }

void sub_1AE38(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

CFStringRef sub_1AE5C(uint64_t a1, int a2, const __CFString *a3)
{
  uint64_t v4 = sub_714C(a1, a2);
  if (!v4) {
    return v4;
  }
  int Length = CFStringGetLength(a3);
  int v6 = CFStringGetLength(v4);
  if (v6 < Length) {
    return v4;
  }
  CFIndex v7 = Length;
  v11.locatioItemCount n = 0LL;
  v11.length = Length;
  if (CFStringCompareWithOptions(v4, a3, v11, 1uLL)) {
    return v4;
  }
  if (Length < v6)
  {
    while (1)
    {
      int CharacterAtIndex = CFStringGetCharacterAtIndex(v4, v7);
      if (CharacterAtIndex != 95 && CharacterAtIndex != 32) {
        break;
      }
      if (v6 == (_DWORD)++v7)
      {
        int Length = v6;
        goto LABEL_11;
      }
    }

    int Length = v7;
  }

BOOL sub_1AF44( uint64_t a1, MIDIDeviceRef a2, void *a3, uint64_t *a4, const __CFString *a5, const __CFString *a6, const __CFString *a7)
{
  unint64_t v8 = a3[1] - *a3;
  newMIDIEntityRef Entity = 0;
  sub_182F4();
  unint64_t v9 = (os_log_s *)qword_2C1B0;
  if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)__int128 v106 = "USBMIDIDriverBase.cpp";
    *(_WORD *)&v106[8] = 1024;
    *(_DWORD *)&v106[10] = 435;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_INFO,  "%25s:%-5d [+] configureDeviceUsingPortMap(using groupTerminalBlocks)",  buf,  0x12u);
  }

  sub_182F4();
  CFStringRef v10 = (os_log_s *)qword_2C1B0;
  if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)__int128 v106 = "USBMIDIDriverBase.cpp";
    *(_WORD *)&v106[8] = 1024;
    *(_DWORD *)&v106[10] = 436;
    __int16 v107 = 1024;
    *(_DWORD *)__int128 v108 = v8 >> 3;
    _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Constructing %d + 1 (phantom) UMP entities...",  buf,  0x18u);
  }

  if ((int)(v8 >> 3) < 1)
  {
    uint64_t v95 = 0LL;
    MIDIProtocolID protocol = kMIDIProtocol_1_0;
    BOOL v12 = 1;
    uint64_t v13 = a3;
LABEL_87:
    __int16 v71 = (_BYTE *)*v13;
    unsigned __int8 v70 = (_BYTE *)v13[1];
    if ((_BYTE *)*v13 == v70)
    {
      MIDIDeviceNewEntity(a2, a6, protocol, 0, 0LL, 0LL, &newEntity);
    }

    else
    {
      int v72 = v71 + 8;
      do
      {
        if (*(v72 - 6)) {
          BOOL v73 = *(v72 - 2) == 0;
        }
        else {
          BOOL v73 = 1;
        }
        ItemCount v74 = !v73;
        if (!v73) {
          break;
        }
        BOOL v38 = v72 == v70;
        v72 += 8;
      }

      while (!v38);
      BOOL v75 = v71 + 8;
      do
      {
        if (*(v75 - 5)) {
          BOOL v76 = *(v75 - 2) == 0;
        }
        else {
          BOOL v76 = 1;
        }
        ItemCount v77 = !v76;
        if (!v76) {
          break;
        }
        BOOL v38 = v75 == v70;
        v75 += 8;
      }

      while (!v38);
      MIDIDeviceNewEntity(a2, a6, protocol, 0, v74, v77, &newEntity);
      if ((_DWORD)v74)
      {
        MIDIObjectRef Source = MIDIEntityGetSource(newEntity, 0LL);
        if (Source)
        {
          if (HIDWORD(v95)) {
            SInt32 v79 = HIDWORD(v95);
          }
          else {
            SInt32 v79 = 3125;
          }
          MIDIObjectSetIntegerProperty(Source, kMIDIPropertyMaxSysExSpeed, v79);
          if ((v77 & 1) == 0) {
            goto LABEL_124;
          }
LABEL_118:
          MIDIObjectRef Destination = MIDIEntityGetDestination(newEntity, 0LL);
          if (Destination)
          {
            if ((_DWORD)v95) {
              SInt32 v81 = v95;
            }
            else {
              SInt32 v81 = 3125;
            }
            MIDIObjectSetIntegerProperty(Destination, kMIDIPropertyMaxSysExSpeed, v81);
          }

          goto LABEL_124;
        }
      }

      if ((_DWORD)v77) {
        goto LABEL_118;
      }
    }

LABEL_124:
    MIDIObjectSetIntegerProperty(newEntity, kMIDIPropertyUMPActiveGroupBitmap, 15);
    MIDIObjectSetIntegerProperty(newEntity, kMIDIPropertyUMPCanTransmitGroupless, 1);
    unint64_t v82 = sub_17560(a2);
    if (v83)
    {
      unint64_t v84 = v82;
      *(_DWORD *)buf = 0;
      if (!MIDIObjectGetIntegerProperty(v82, kMIDIPropertyUniqueID, (SInt32 *)buf)) {
        MIDIObjectSetIntegerProperty(HIDWORD(v84), kMIDIPropertyAssociatedEndpoint, *(SInt32 *)buf);
      }
      *(_DWORD *)buf = 0;
      if (!MIDIObjectGetIntegerProperty(HIDWORD(v84), kMIDIPropertyUniqueID, (SInt32 *)buf)) {
        MIDIObjectSetIntegerProperty(v84, kMIDIPropertyAssociatedEndpoint, *(SInt32 *)buf);
      }
    }

    sub_182F4();
    unsigned __int8 v85 = (os_log_s *)qword_2C1B0;
    if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)__int128 v106 = "USBMIDIDriverBase.cpp";
      *(_WORD *)&v106[8] = 1024;
      *(_DWORD *)&v106[10] = 549;
      _os_log_impl(&dword_0, v85, OS_LOG_TYPE_INFO, "%25s:%-5d      setting UMP enabled on device", buf, 0x12u);
    }

    MIDIObjectSetIntegerProperty(a2, @"UMP Enabled", 1);
    sub_182F4();
    uint64_t v86 = (os_log_s *)qword_2C1B0;
    if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)__int128 v106 = "USBMIDIDriverBase.cpp";
      *(_WORD *)&v106[8] = 1024;
      *(_DWORD *)&v106[10] = 551;
      _os_log_impl( &dword_0,  v86,  OS_LOG_TYPE_INFO,  "%25s:%-5d [-] configureDeviceUsingPortMap(using groupTerminalBlocks)",  buf,  0x12u);
    }

    return v12;
  }

  uint64_t v11 = 0LL;
  BOOL v12 = 0;
  uint64_t v95 = 0LL;
  uint64_t v90 = (v8 >> 3);
  uint64_t v91 = (int)((uint64_t)v8 >> 3);
  MIDIProtocolID protocol = kMIDIProtocol_1_0;
  uint64_t v13 = a3;
  MIDIDeviceRef v92 = a2;
  while (1)
  {
    uint64_t v14 = *a4;
    unint64_t v15 = (unsigned __int8 *)(*a4 + 12 * v11);
    int v17 = (_BYTE *)*v13;
    unint64_t v16 = (_BYTE *)v13[1];
    if ((_BYTE *)*v13 != v16)
    {
      while (v17[7] != *v15)
      {
        v17 += 8;
        if (v17 == v16) {
          return v12;
        }
      }
    }

    if (v16 == v17) {
      return v12;
    }
    __int128 v102 = &off_28F30;
    CFTypeRef cf = 0LL;
    uint64_t v101 = v14;
    uint64_t v18 = v14 + 12 * v11;
    int v20 = *(unsigned __int8 *)(v18 + 5);
    char v19 = (unsigned __int8 *)(v18 + 5);
    unsigned int v21 = sub_1AE5C(a1, v20, a7);
    CFTypeRef v22 = cf;
    CFTypeRef cf = v21;
    MIDIProtocolID v23 = protocol;
    if (v22)
    {
      CFRelease(v22);
      unsigned int v21 = (const __CFString *)cf;
    }

    if (v17[2]) {
      ItemCount v24 = v17[6];
    }
    else {
      ItemCount v24 = 0LL;
    }
    if (v17[3]) {
      ItemCount v25 = v17[6];
    }
    else {
      ItemCount v25 = 0LL;
    }
    ItemCount v100 = v25;
    if (v21 && CFStringCompare(&stru_29400, v21, 0LL))
    {
      sub_182F4();
      uint64_t v26 = (os_log_s *)qword_2C1B0;
      if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_DEBUG))
      {
        int v27 = *v19;
        *(_DWORD *)buf = 136315906;
        *(void *)__int128 v106 = "USBMIDIDriverBase.cpp";
        *(_WORD *)&v106[8] = 1024;
        *(_DWORD *)&v106[10] = 454;
        __int16 v107 = 1024;
        *(_DWORD *)__int128 v108 = v27;
        *(_WORD *)&v108[4] = 2112;
        *(void *)&v108[6] = cf;
        _os_log_impl( &dword_0,  v26,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      Using GTB name string at string index %d: %@",  buf,  0x22u);
      }
    }

    else
    {
      unint64_t v28 = sub_1F5D4(buf, a5, *v15);
      CFTypeRef v29 = cf;
      CFTypeRef cf = *(CFTypeRef *)&v106[4];
      *(void *)&v106[4] = v29;
      sub_1F048(v28);
    }

    sub_182F4();
    int v30 = (os_log_s *)qword_2C1B0;
    if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_DEBUG))
    {
      int v31 = *(unsigned __int8 *)(v101 + 12 * v11 + 1);
      int v32 = v17[5];
      int v33 = v17[6];
      *(_DWORD *)buf = 136316674;
      *(void *)__int128 v106 = "USBMIDIDriverBase.cpp";
      *(_WORD *)&v106[8] = 1024;
      *(_DWORD *)&v106[10] = 455;
      __int16 v107 = 2112;
      *(void *)__int128 v108 = cf;
      *(_WORD *)&v108[8] = 1024;
      *(_DWORD *)&v108[10] = v11;
      __int16 v109 = 1024;
      int v110 = v31;
      __int16 v111 = 1024;
      int v112 = v32;
      __int16 v113 = 1024;
      LODWORD(v114) = v33;
      _os_log_impl( &dword_0,  v30,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      Found port map for GTB %@ (index:%d blockType:%d): firstGroup %d numGroups %d",  buf,  0x34u);
    }

    uint64_t v98 = v11;
    uint64_t v34 = v101 + 12 * v11;
    int v37 = *(unsigned __int8 *)(v34 + 4);
    unint64_t v36 = (unsigned __int8 *)(v34 + 4);
    int v35 = v37;
    BOOL v38 = (v37 & 1) != 0 || v35 == 0;
    int v39 = !v38;
    MIDIDeviceNewEntity(a2, (CFStringRef)cf, v23, 0, v24, v100, &newEntity);
    sub_182F4();
    unint64_t v40 = (os_log_s *)qword_2C1B0;
    if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
    {
      int v41 = *v36;
      __int16 v42 = "MIDI 2.0";
      if (v23 == kMIDIProtocol_1_0) {
        __int16 v42 = "MIDI 1-UP";
      }
      *(_DWORD *)buf = 136316674;
      int v43 = "";
      if (v39) {
        int v43 = " (jitter reduction requested)";
      }
      *(void *)__int128 v106 = "USBMIDIDriverBase.cpp";
      *(_WORD *)&v106[8] = 1024;
      *(_DWORD *)&v106[10] = 461;
      __int16 v107 = 2080;
      *(void *)__int128 v108 = v42;
      *(_WORD *)&v108[8] = 1024;
      *(_DWORD *)&v108[10] = v24;
      __int16 v109 = 1024;
      int v110 = v100;
      __int16 v111 = 1024;
      int v112 = v41;
      __int16 v113 = 2080;
      int v114 = v43;
      _os_log_impl( &dword_0,  v40,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Created a %s entity with %d inputs and %d outputs, midiProtocol = %d%s",  buf,  0x38u);
    }

    MIDIProtocolID protocol = v23;
    uint64_t v44 = v101 + 12 * v98;
    int v46 = *(unsigned __int8 *)(v44 + 3);
    uint64_t v45 = (unsigned __int8 *)(v44 + 3);
    if (v46)
    {
      ItemCount v47 = 0LL;
      SInt32 v48 = 0;
      uint64_t v49 = v101 + 12 * v98;
      __int16 v50 = (char *)(v49 + 2);
      unint64_t v51 = (unsigned __int8 *)(v49 + 1);
      do
      {
        char v52 = *v50;
        unsigned int v53 = *v51;
        if ((v53 | 2) == 2)
        {
          MIDIObjectRef v54 = MIDIEntityGetSource(newEntity, v47);
          unsigned int v53 = *v51;
        }

        else
        {
          MIDIObjectRef v54 = 0;
        }

        if (v53 > 1) {
          MIDIObjectRef v55 = 0;
        }
        else {
          MIDIObjectRef v55 = MIDIEntityGetDestination(newEntity, v47);
        }
        int v56 = 1 << (v52 + v47);
        if (v54) {
          MIDIObjectSetIntegerProperty(v54, kMIDIPropertyUMPActiveGroupBitmap, (unsigned __int16)v56);
        }
        if (v55) {
          MIDIObjectSetIntegerProperty(v55, kMIDIPropertyUMPActiveGroupBitmap, (unsigned __int16)v56);
        }
        v48 |= (unsigned __int16)v56;
        ++v47;
      }

      while (v47 < *v45);
    }

    else
    {
      SInt32 v48 = 0;
    }

    MIDIObjectSetIntegerProperty(newEntity, kMIDIPropertyUMPActiveGroupBitmap, v48);
    a2 = v92;
    uint64_t v13 = a3;
    uint64_t v57 = v101;
    unsigned int v58 = *(unsigned __int16 *)(v101 + 12 * v98 + 10);
    if (v58 >= 2)
    {
      SInt32 v59 = v58 << 12;
      sub_182F4();
      int v60 = (os_log_s *)qword_2C1B0;
      if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)__int128 v106 = "USBMIDIDriverBase.cpp";
        *(_WORD *)&v106[8] = 1024;
        *(_DWORD *)&v106[10] = 480;
        __int16 v107 = 1024;
        *(_DWORD *)__int128 v108 = v59;
        _os_log_impl(&dword_0, v60, OS_LOG_TYPE_INFO, "%25s:%-5d      setting maxOutputBandwidth to %u", buf, 0x18u);
      }

      if ((_DWORD)v24)
      {
        for (ItemCount i = 0LL; i != v24; ++i)
        {
          MIDIObjectRef v62 = MIDIEntityGetSource(newEntity, i);
          if (v62) {
            MIDIObjectSetIntegerProperty(v62, kMIDIPropertyMaxSysExSpeed, v59);
          }
        }
      }

      if (v59 >= SHIDWORD(v95)) {
        SInt32 v63 = HIDWORD(v95);
      }
      else {
        SInt32 v63 = v59;
      }
      if (!HIDWORD(v95)) {
        SInt32 v63 = v59;
      }
      HIDWORD(v95) = v63;
      uint64_t v57 = v101;
    }

    unsigned int v64 = *(unsigned __int16 *)(v57 + 12 * v98 + 8);
    if (v64 >= 2)
    {
      SInt32 v65 = v64 << 12;
      sub_182F4();
      unsigned int v66 = (os_log_s *)qword_2C1B0;
      if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)__int128 v106 = "USBMIDIDriverBase.cpp";
        *(_WORD *)&v106[8] = 1024;
        *(_DWORD *)&v106[10] = 493;
        __int16 v107 = 1024;
        *(_DWORD *)__int128 v108 = v65;
        _os_log_impl(&dword_0, v66, OS_LOG_TYPE_INFO, "%25s:%-5d      setting maxInputBandwidth to %u", buf, 0x18u);
      }

      if ((_DWORD)v100)
      {
        for (ItemCount j = 0LL; j != v100; ++j)
        {
          MIDIObjectRef v68 = MIDIEntityGetDestination(newEntity, j);
          if (v68) {
            MIDIObjectSetIntegerProperty(v68, kMIDIPropertyMaxSysExSpeed, v65);
          }
        }
      }

      else {
        SInt32 v69 = v65;
      }
      if (!(_DWORD)v95) {
        SInt32 v69 = v65;
      }
      LODWORD(v95) = v69;
    }

    MIDIObjectSetIntegerProperty(newEntity, @"In Endpoint", *(unsigned __int8 *)(*a3 + 8 * v98 + 2));
    MIDIObjectSetIntegerProperty(newEntity, @"Out Endpoint", *(unsigned __int8 *)(*a3 + 8 * v98 + 3));
    MIDIObjectSetIntegerProperty(newEntity, @"Cable", *(unsigned __int8 *)(*a3 + 8 * v98 + 1));
    MIDIObjectSetIntegerProperty(newEntity, @"Default Protocol", *(unsigned __int8 *)(*a3 + 8 * v98 + 4));
    MIDIObjectSetIntegerProperty(newEntity, @"Group Terminal Block ID", *(unsigned __int8 *)(*a3 + 8 * v98 + 7));
    MIDIObjectSetIntegerProperty(newEntity, @"First Group", *(unsigned __int8 *)(*a3 + 8 * v98 + 5));
    MIDIObjectSetIntegerProperty(newEntity, @"Number of Groups", *(unsigned __int8 *)(*a3 + 8 * v98 + 6));
    sub_1F048(&v102);
    uint64_t v11 = v98 + 1;
    BOOL v12 = v98 + 1 >= v91;
    if (v98 + 1 == v90) {
      goto LABEL_87;
    }
  }

void sub_1BA50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32)
{
}

BOOL sub_1BAA0( uint64_t a1, const __CFString *a2, MIDIDeviceRef a3, uint64_t *a4, uint64_t *a5, void *a6, void *a7, const __CFString *a8, char a9)
{
  newMIDIEntityRef Entity = 0;
  uint64_t v13 = a4[1];
  uint64_t v49 = *a4;
  sub_182F4();
  uint64_t v14 = (os_log_s *)qword_2C1B0;
  if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 559;
    _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_INFO,  "%25s:%-5d [+] configureDeviceUsingPortMap(using JackLists)",  buf,  0x12u);
  }

  sub_182F4();
  unint64_t v15 = (os_log_s *)qword_2C1B0;
  if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 560;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "%25s:%-5d      Constructing USB MIDI 1.0 entities...", buf, 0x12u);
  }

  uint64_t v48 = v13;
  if (v13 != v49)
  {
    unint64_t v16 = 0LL;
    unint64_t v17 = (v48 - v49) >> 3;
    if (v17 <= 1) {
      unint64_t v17 = 1LL;
    }
    unint64_t v51 = v17;
    char v52 = a8;
    do
    {
      int v56 = &off_28F30;
      CFTypeRef cf = 0LL;
      if (v16 >= (a4[1] - *a4) >> 3) {
        sub_13F18();
      }
      uint64_t v18 = *a4 + 8 * v16;
      int v19 = *(unsigned __int8 *)(v18 + 2);
      int v20 = *(unsigned __int8 *)(v18 + 3);
      if (*(_BYTE *)(v18 + 2))
      {
        CFStringRef v21 = sub_1AE5C(a1, *(unsigned __int8 *)(*a6 + 6 * v16 + 4), a8);
        uint64_t v22 = *a6;
        uint64_t v23 = *a5;
        uint64_t v24 = a5[1];
        if (*a5 != v24)
        {
          while (*(unsigned __int8 *)(v23 + 2) != *(unsigned __int8 *)(v22 + 6 * v16 + 3))
          {
            v23 += 6LL;
            if (v23 == v24) {
              goto LABEL_21;
            }
          }
        }

        if (v23 != v24)
        {
          if (v23)
          {
            int v25 = *(unsigned __int8 *)(v23 + 1);
            *(_BYTE *)(v22 + 6 * v16 + 1) = v25;
            if (v25 == 1)
            {
              sub_182F4();
              uint64_t v26 = (os_log_s *)qword_2C1B0;
              if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
              {
                int v27 = *(unsigned __int8 *)(*a6 + 6 * v16 + 2);
                *(_DWORD *)buf = 136315650;
                *(void *)&uint8_t buf[4] = "USBMIDIDriverBase.cpp";
                *(_WORD *)&_BYTE buf[12] = 1024;
                *(_DWORD *)&buf[14] = 576;
                __int16 v60 = 1024;
                LODWORD(v61) = v27;
                _os_log_impl( &dword_0,  v26,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Found an embedded input at jack ID %d.",  buf,  0x18u);
              }
            }
          }
        }
      }

      else
      {
        CFStringRef v21 = 0LL;
      }

LABEL_21:
      if (v20)
      {
        CFStringRef v28 = sub_1AE5C(a1, *(unsigned __int8 *)(*a7 + 6 * v16 + 4), a8);
        uint64_t v29 = *a7;
        uint64_t v30 = *a5;
        uint64_t v31 = a5[1];
        if (*a5 != v31)
        {
          while (*(unsigned __int8 *)(v30 + 3) != *(unsigned __int8 *)(v29 + 6 * v16 + 2))
          {
            v30 += 6LL;
            if (v30 == v31) {
              goto LABEL_31;
            }
          }
        }

        if (v30 != v31)
        {
          if (v30)
          {
            int v32 = *(unsigned __int8 *)(v30 + 1);
            *(_BYTE *)(v29 + 6 * v16 + 1) = v32;
            if (v32 == 1)
            {
              sub_182F4();
              int v33 = (os_log_s *)qword_2C1B0;
              if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
              {
                int v34 = *(unsigned __int8 *)(*a7 + 6 * v16 + 2);
                *(_DWORD *)buf = 136315650;
                *(void *)&uint8_t buf[4] = "USBMIDIDriverBase.cpp";
                *(_WORD *)&_BYTE buf[12] = 1024;
                *(_DWORD *)&buf[14] = 586;
                __int16 v60 = 1024;
                LODWORD(v61) = v34;
                _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Found an embedded output at jack ID %d.",  buf,  0x18u);
              }
            }
          }
        }

LABEL_31:
        if (v21 && v28 && CFEqual(v21, v28))
        {
          CFRetain(v21);
          CFTypeRef v35 = cf;
          CFTypeRef cf = v21;
          if (v35) {
            CFRelease(v35);
          }
          CFRelease(v21);
          CFRelease(v28);
          CFStringRef v28 = 0LL;
          CFStringRef v21 = 0LL;
          goto LABEL_40;
        }
      }

      else
      {
        CFStringRef v28 = 0LL;
      }

      if ((unint64_t)(v48 - v49) >= 9)
      {
        CFStringRef v36 = CFStringCreateWithFormat(0LL, 0LL, a2, (v16 + 1));
        CFTypeRef v37 = cf;
        CFTypeRef cf = v36;
        *(void *)buf = &off_28F30;
        *(void *)&buf[8] = v37;
        sub_1F048(buf);
      }

LABEL_40:
      if (!cf)
      {
        if (a8)
        {
          CFRetain(a8);
          CFTypeRef v41 = cf;
          CFTypeRef cf = a8;
          if (v41) {
            CFRelease(v41);
          }
        }

        else
        {
          CFTypeRef cf = 0LL;
        }
      }

      if (a9)
      {
        if (v19
          && v20
          && (int v38 = *(unsigned __int8 *)(*a6 + 6 * v16 + 1), v38 == *(unsigned __int8 *)(*a7 + 6 * v16 + 1)))
        {
          if (v38 == 1)
          {
            sub_182F4();
            int v39 = (os_log_s *)qword_2C1B0;
            Boolean v40 = 1;
            if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&uint8_t buf[4] = "USBMIDIDriverBase.cpp";
              *(_WORD *)&_BYTE buf[12] = 1024;
              *(_DWORD *)&buf[14] = 611;
              _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "%25s:%-5d      Creating an embedded entity.", buf, 0x12u);
            }

            goto LABEL_56;
          }
        }

        else if ((v19 != 0) != (v20 != 0))
        {
          __int16 v42 = a7;
          if (v19) {
            __int16 v42 = a6;
          }
          Boolean v40 = *(_BYTE *)(*v42 + 6 * v16 + 1) == 1;
          goto LABEL_56;
        }
      }

      Boolean v40 = 0;
LABEL_56:
      MIDIDeviceAddEntity(a3, (CFStringRef)cf, v40, v19 != 0, v20 != 0, &newEntity);
      if (v21)
      {
        MIDIObjectRef Source = MIDIEntityGetSource(newEntity, 0LL);
        MIDIObjectSetStringProperty(Source, kMIDIPropertyName, v21);
      }

      if (v28)
      {
        MIDIObjectRef Destination = MIDIEntityGetDestination(newEntity, 0LL);
        MIDIObjectSetStringProperty(Destination, kMIDIPropertyName, v28);
      }

      if (v16 >= (a4[1] - *a4) >> 3
        || (MIDIObjectSetIntegerProperty(newEntity, @"In Endpoint", *(unsigned __int8 *)(*a4 + 8 * v16 + 2)),
            v16 >= (a4[1] - *a4) >> 3)
        || (MIDIObjectSetIntegerProperty(newEntity, @"Out Endpoint", *(unsigned __int8 *)(*a4 + 8 * v16 + 3)),
            v16 >= (a4[1] - *a4) >> 3))
      {
        sub_13F18();
      }

      MIDIObjectSetIntegerProperty(newEntity, @"Cable", *(unsigned __int8 *)(*a4 + 8 * v16 + 1));
      if (v21) {
        CFRelease(v21);
      }
      if (v28) {
        CFRelease(v28);
      }
      MIDIObjectSetIntegerProperty(a3, @"UMP Enabled", 0);
      sub_1F048(&v56);
      ++v16;
      a8 = v52;
    }

    while (v16 != v51);
  }

  sub_182F4();
  uint64_t v45 = (os_log_s *)qword_2C1B0;
  if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
  {
    int v46 = "false";
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "USBMIDIDriverBase.cpp";
    if (v48 != v49) {
      int v46 = "true";
    }
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 637;
    __int16 v60 = 2080;
    int v61 = v46;
    _os_log_impl( &dword_0,  v45,  OS_LOG_TYPE_INFO,  "%25s:%-5d [+] configureDeviceUsingPortMap(using JackLists) = %s",  buf,  0x1Cu);
  }

  return v48 != v49;
}

void sub_1C230( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28)
{
  if (a2) {
    sub_3584(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1C270(uint64_t a1, const __CFUUID *a2)
{
  *(void *)sub_4A48(a1, a2) = off_28E30;
  v6[0] = &off_28F70;
  CFIndex v7 = v6;
  sub_D510(@"usbmidiverbose", @"com.apple.coremidi", (uint64_t)sub_2FA0, (uint64_t)v6);
  uint64_t v3 = v7;
  if (v7 == v6)
  {
    uint64_t v4 = 4LL;
    uint64_t v3 = v6;
    goto LABEL_5;
  }

  if (v7)
  {
    uint64_t v4 = 5LL;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }

  return a1;
}

void sub_1C334( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  unint64_t v15 = a13;
  if (a13 == &a10)
  {
    uint64_t v16 = 4LL;
    unint64_t v15 = &a10;
  }

  else
  {
    if (!a13) {
      goto LABEL_6;
    }
    uint64_t v16 = 5LL;
  }

  (*(void (**)(void))(*(void *)v15 + 8 * v16))();
LABEL_6:
  sub_4D24(v13);
  _Unwind_Resume(a1);
}

void sub_1C378(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned int a4@<W3>, void *a5@<X8>)
{
  uint64_t v8 = a2;
  uint64_t v7 = a3;
  unsigned int v6 = a4;
  uint64_t v5 = a1;
  sub_1F7FC(&v5, &v8, &v7, &v6, a5);
}

uint64_t sub_1C3B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return 4294956462LL;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a3 + 88LL))(a3, a2, a4);
  return 0LL;
}

uint64_t sub_1C3EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return 4294956462LL;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a3 + 96LL))(a3, a2, a4);
  return 0LL;
}

void sub_1C420(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_BYTE *)(a3 + 16) = 0;
  unsigned int v6 = (unsigned __int8 *)(a3 + 16);
  *(_OWORD *)(a3 + 24) = 0u;
  *(_OWORD *)(a3 + 72) = 0u;
  *(void *)a3 = 0LL;
  *(void *)(a3 + 8) = 0LL;
  *(_OWORD *)(a3 + (*(void (**)(uint64_t))(*(void *)(v1 + 32) + 24LL))(v1 + 40) = 0u;
  *(_OWORD *)(a3 + 56) = 0u;
  *(_OWORD *)(a3 + 88) = 0u;
  *(_OWORD *)(a3 + 104) = 0u;
  uint64_t v7 = sub_68C8(a1);
  uint64_t v8 = sub_7A20(a2);
  if (!v7) {
    return;
  }
  uint64_t v9 = v8;
  if (!v8 || (sub_7DDC(a2) & 1) == 0) {
    return;
  }
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v9 + 136LL))(v9, a3 + 16);
  sub_182F4();
  uint64_t v11 = qword_2C1B0;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v16 = 136315650;
      *(void *)&v16[4] = "USBMIDIDriverBase.cpp";
      *(_WORD *)&v16[12] = 1024;
      *(_DWORD *)&v16[14] = 714;
      __int16 v17 = 1024;
      int v18 = v10;
      BOOL v12 = "%25s:%-5d [!] USBMIDIClassDriver::ProbeDevice() - GetInterfaceNumber() returned error 0x%x";
      uint64_t v13 = (os_log_s *)v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
LABEL_9:
      _os_log_impl(&dword_0, v13, v14, v12, v16, 0x18u);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_INFO))
  {
    int v15 = *v6;
    *(_DWORD *)uint64_t v16 = 136315650;
    *(void *)&v16[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&v16[12] = 1024;
    *(_DWORD *)&v16[14] = 716;
    __int16 v17 = 1024;
    int v18 = v15;
    BOOL v12 = "%25s:%-5d [*] USBMIDIClassDriver::ProbeDevice() - inUSBInterface has interface number %d";
    uint64_t v13 = (os_log_s *)v11;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    goto LABEL_9;
  }

  sub_18350(v9, (uint64_t)v16);
  if (*(void *)v16)
  {
    sub_184CC( v9,  *(unsigned __int8 **)v16,  (void *)(a3 + 24),  (char **)(a3 + 48),  (char **)(a3 + 72),  (unsigned __int8 **)(a3 + 96));
    *(void *)a3 = a1;
    *(void *)(a3 + 8) = a2;
  }

  if (v19 < 0) {
    operator delete(*(void **)&v16[8]);
  }
}

void sub_1C61C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  sub_F52C(v15);
  _Unwind_Resume(a1);
}

BOOL sub_1C650( uint64_t a1, uint64_t a2, const __CFString *a3, const __CFString *a4, const __CFString *a5, MIDIDeviceRef a6, uint64_t *a7, uint64_t *a8, void *a9, void *a10)
{
  uint64_t v16 = sub_7A20(a2);
  CFStringRef v17 = sub_18110(a1, a4);
  char v19 = v18;
  __int16 v24 = 0;
  (*(void (**)(uint64_t, __int16 *))(*(void *)v16 + 104LL))(v16, &v24);
  BOOL v20 = sub_1BAA0(a1, a3, a6, a7, a8, a9, a10, v19, v24 == 1452);
  if (a4 && v17 && CFStringCompare(v17, a4, 0LL)) {
    CFRelease(v17);
  }
  if (a5 && v19 && CFStringCompare(v19, a5, 0LL)) {
    CFRelease(v19);
  }
  return v20;
}

void sub_1C770(int a1@<W0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = *(void *)a2;
  int v6 = *(unsigned __int8 *)(a2 + 16);
  if (a1) {
    sub_1A9F0(v5, v6, (uint64_t *)(a2 + 48), (uint64_t *)(a2 + 72), a3);
  }
  else {
    sub_19B20(v5, v6, a2 + 96, a3);
  }
}

void sub_1C798(uint64_t a1, MIDITimeStamp a2, char *a3, int64_t a4, uint64_t a5, MIDIProtocolID a6)
{
  uint64_t v7 = a3;
  if (a6)
  {
    if (*(_BYTE *)(a1 + 187))
    {
      sub_1D108(a1, a2, a3, a4, 0, a6);
    }

    else
    {
      sub_182F4();
      __int16 v71 = (os_log_s *)qword_2C1B0;
      if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)evtlist = 136315394;
        *(void *)&evtlist[4] = "USBMIDIDriverBase.cpp";
        *(_WORD *)&evtlist[12] = 1024;
        *(_DWORD *)&evtlist[14] = 766;
        _os_log_impl( &dword_0,  v71,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] USBMIDIDriverBase::USBMIDIHandleInput() - protocols newer than USB MIDI 1.0 need USB MIDI 2.0 dr iver support, which is disabled",  evtlist,  0x12u);
      }
    }

    return;
  }

  __int128 v109 = 0u;
  __int128 v110 = 0u;
  int v10 = &a3[a4];
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  memset(evtlist, 0, sizeof(evtlist));
  if (*(_BYTE *)(a1 + 187) && *(_BYTE *)(a1 + 490))
  {
    if (a4 < 1)
    {
      MIDIEventListInit((MIDIEventList *)evtlist, kMIDIProtocol_1_0);
      return;
    }

    unint64_t v11 = (unint64_t)a4 >> 2;
    BOOL v12 = (unsigned int *)a3;
    do
    {
      *BOOL v12 = bswap32(*v12);
      ++v12;
    }

    while (v12 < (unsigned int *)v10);
    MIDIEventListInit((MIDIEventList *)evtlist, kMIDIProtocol_1_0);
    if ((_DWORD)v11 && a4 >= 1)
    {
      unsigned __int8 v13 = 0;
      while (1)
      {
        if (!v7) {
          return;
        }
        int v89 = v11;
        uint64_t v14 = *(void *)(a1 + 40);
        int v15 = MIDIEventListInit((MIDIEventList *)evtlist, kMIDIProtocol_1_0);
        uint64_t v16 = v7;
        if (v15) {
          break;
        }
LABEL_113:
        unint64_t v69 = v16 - v7;
        if ((v69 >> 2))
        {
          LODWORD(v11) = v89 - (v69 >> 2);
          signed int v70 = *(_DWORD *)(a1 + 12);
          unsigned __int8 v13 = *(_DWORD *)v7 >> 28 >= v70 ? v70 - 1 : *(_DWORD *)v7 >> 28;
          MIDIReceivedEventList(*(_DWORD *)(*(void *)(a1 + 16) + 4LL * v13), (const MIDIEventList *)evtlist);
          if ((_DWORD)v11)
          {
            v7 += v69 & 0x3FFFFFFFCLL;
            if (v7 < v10) {
              continue;
            }
          }
        }

        return;
      }

      CFStringRef v17 = v15;
      int v18 = (__int16 *)(v14 + 6LL * v13);
      unint64_t v19 = (unint64_t)*(unsigned int *)v7 >> 28;
      BOOL v20 = v18 + 2;
      unint64_t v90 = ((unint64_t)(HIBYTE(*(_DWORD *)v7) >> 4) << 24) | 0x30000000;
      uint64_t v16 = v7;
      while (1)
      {
        unint64_t v21 = *(unsigned int *)v16;
        unsigned int v23 = BYTE3(v21) & 0xF;
        if (v23 >= 2) {
          break;
        }
LABEL_81:
        v16 += 4;
        if (v16 >= v10) {
          goto LABEL_113;
        }
      }

      char v24 = BYTE2(*(_DWORD *)v16);
      if (v23 - 6 < 2)
      {
        uint64_t v25 = qword_23188[(v21 >> 24) & 0xF];
        if (BYTE2(v21) == 240)
        {
          uint64_t v26 = v21 & 0x7F00;
          if (v25 == 2) {
            uint64_t v26 = 0LL;
          }
          unint64_t v27 = v26 & 0xFFFFFFFFFF00FFFFLL | ((unint64_t)(v25 - 2) << 16) | v90;
          goto LABEL_48;
        }

LABEL_149:
              unsigned __int8 v85 = MIDIPacketListAdd((MIDIPacketList *)evtlist, 0x200uLL, v73, a2, v82, (const Byte *)v7 + 1);
              if (v85)
              {
                BOOL v73 = v85;
                goto LABEL_151;
              }

              do
              {
                if (v75) {
                  MIDIReceived(*(_DWORD *)(*(void *)(a1 + 16) + 4LL * (int)v91), (const MIDIPacketList *)evtlist);
                }
                uint64_t v86 = MIDIPacketListInit((MIDIPacketList *)evtlist);
                int v87 = MIDIPacketListAdd((MIDIPacketList *)evtlist, 0x200uLL, v86, a2, v82, (const Byte *)v7 + 1);
              }

              while (!v87);
              BOOL v73 = v87;
              uint64_t v83 = 0LL;
              break;
            case 5u:
              goto LABEL_149;
            case 6u:
            case 7u:
LABEL_143:
              uint64_t v83 = 0LL;
              unsigned int v82 = v78 - 4;
              if ((v74 & 1) != 0) {
                goto LABEL_144;
              }
              uint64_t v74 = 0LL;
              goto LABEL_149;
            case 0xFu:
              goto LABEL_149;
            default:
              goto LABEL_151;
          }
        }

        v7 += 4;
        uint64_t v74 = v83;
        int v10 = (char *)v76;
      }

      while ((unint64_t)v7 < v76);
      if (*(_DWORD *)evtlist) {
        BOOL v88 = v75 == 0;
      }
      else {
        BOOL v88 = 1;
      }
      if (!v88) {
        MIDIReceived(*(_DWORD *)(*(void *)(a1 + 16) + 4LL * (int)v91), (const MIDIPacketList *)evtlist);
      }
    }
  }

uint64_t sub_1D108( uint64_t result, MIDITimeStamp a2, char *a3, unint64_t a4, int a5, MIDIProtocolID a6)
{
  if (a6 <= kMIDIProtocol_2_0)
  {
    v22[10] = v6;
    v22[11] = v7;
    unint64_t v8 = a4 >> 2;
    memset(v21, 0, sizeof(v21));
    if ((a4 >> 2))
    {
      int v10 = a3;
      uint64_t v12 = result;
      unsigned __int8 v13 = &a3[a4];
      do
      {
        if (!v10) {
          break;
        }
        if (v13 <= v10) {
          break;
        }
        __n128 result = sub_1F1A8(a6, a2, v10, (v13 - v10) >> 2, (MIDIEventList *)v21, (unint64_t)v22);
        if (!(_DWORD)result) {
          break;
        }
        unsigned int v14 = result;
        int v15 = *(_DWORD *)v10 >> 28;
        int v16 = HIBYTE(*(_DWORD *)v10) & 0xF;
        if (v15 == 15) {
          int v16 = 255;
        }
        if (v15) {
          unsigned int v17 = v16;
        }
        else {
          unsigned int v17 = 255;
        }
        int v18 = *(unsigned __int8 *)(v12 + 189);
        unsigned int v19 = *(_DWORD *)(v12 + 12) - v18;
        if (v19 <= v17) {
          unsigned int v20 = v19 - 1;
        }
        else {
          unsigned int v20 = v17;
        }
        if (v17 != 255 && v20 != 255)
        {
          __n128 result = MIDIReceivedEventList(*(_DWORD *)(*(void *)(v12 + 16) + 4LL * v20), (const MIDIEventList *)v21);
          int v18 = *(unsigned __int8 *)(v12 + 189);
        }

        if (v18) {
          __n128 result = MIDIReceivedEventList(*(_DWORD *)(*(void *)(v12 + 24) - 4LL), (const MIDIEventList *)v21);
        }
        if (&v10[4 * v14] <= v13) {
          v10 += 4 * v14;
        }
        else {
          int v10 = v13;
        }
        LODWORD(v8) = v8 - v14;
      }

      while ((_DWORD)v8);
    }
  }

  return result;
}

uint64_t sub_1D26C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (*(void *)(a2 + 16)) {
    int v4 = *(unsigned __int8 *)(*(void *)(a2 + 8) + 120LL);
  }
  else {
    int v4 = 0;
  }
  unint64_t v5 = a3 + a4 - 4;
LABEL_5:
  if (*(void *)(a2 + 16))
  {
    uint64_t v6 = a2;
    while (1)
    {
      uint64_t v6 = *(void *)(v6 + 8);
      if (v6 == a2) {
        break;
      }
      if (*(unsigned __int8 *)(v6 + 120) == v4)
      {
        if (*(void *)(v6 + 32)) {
          uint64_t v7 = *(void *)(v6 + 32);
        }
        else {
          uint64_t v7 = v6 + 40;
        }
        if (*(_DWORD *)(v6 + 24) - *(_DWORD *)(v6 + 112) >= 1 && a3 <= v5) {
          __asm { BR              X12 }
        }

        if (a3 <= v5) {
          goto LABEL_5;
        }
        return 0LL;
      }
    }
  }

  return 0LL;
}

_BYTE *sub_1D544(uint64_t a1, uint64_t *a2, _BYTE *a3, uint64_t a4, int a5)
{
  int v5 = a5;
  uint64_t v6 = a3;
  uint64_t v7 = a2;
  uint64_t v8 = *a2;
  if (*a2 == a2[1]) {
    int v9 = 0;
  }
  else {
    int v9 = *(unsigned __int8 *)(v8 + 292);
  }
  unint64_t v10 = (unint64_t)&a3[a4];
  int v79 = v9;
  unint64_t v87 = (unint64_t)&a3[a4];
  do
  {
    while (1)
    {
      if (v8 == v7[1]) {
        return (_BYTE *)(v6 - a3);
      }
      uint64_t v11 = sub_1456C(v8);
      uint64_t v12 = *(int *)(v8 + 288);
      int v13 = *(_DWORD *)(sub_1456C(v8) + 8);
      int v14 = *(_DWORD *)(v8 + 288);
      unsigned int v15 = v13 - v14;
      if (v13 == v14) {
        break;
      }
      unsigned int v16 = 0;
      uint64_t v17 = v11 + 4 * v12 + 12;
      unint64_t v18 = v17 + 4LL * v15;
      uint64_t v83 = v8;
      unsigned int v82 = v13 - v14;
      unint64_t v80 = v18;
      uint64_t v81 = v17;
      while (1)
      {
        unsigned int v19 = (unsigned int *)(v17 + 4LL * v16);
        if (v5) {
          break;
        }
        if (((v18 - (void)v19) & 0x3FFFFFFFCLL) == 0)
        {
          LODWORD(v26) = 0;
          goto LABEL_143;
        }

        LODWORD(v26) = 0;
        if (v6 && (unint64_t)v6 < v10)
        {
          unsigned int v85 = v16;
          unsigned int v27 = 0;
          int v28 = 0;
          uint64_t v29 = (char *)v19 + ((v18 - (void)v19) & 0x3FFFFFFFCLL);
          unint64_t v84 = (char *)(v17 + 4LL * v16);
          uint64_t v86 = v29;
          while (1)
          {
            if ((int)((unint64_t)(v29 - (char *)v19) >> 2) < 1)
            {
LABEL_141:
              unint64_t v67 = (char *)v19 - v84;
              unsigned int v19 = (unsigned int *)v84;
              unint64_t v26 = v67 >> 2;
              goto LABEL_142;
            }

            unsigned int v30 = *v19;
            unsigned int v31 = *v19 >> 28;
            switch(v31)
            {
              case 1u:
                if (BYTE2(v30) - 241 <= 0xE)
                {
                  if (((1 << (BYTE2(v30) + 15)) & 0x6EA0) != 0)
                  {
                    int v34 = (v30 >> 20) & 0xF0;
                    int v28 = v34 | 5;
                    *uint64_t v6 = v34 | 5;
                    v6[1] = *((_WORD *)v19 + 1);
                    unsigned int v27 = 1;
LABEL_48:
                    _BYTE v6[2] = 0;
                    goto LABEL_125;
                  }

                  if (((1 << (BYTE2(v30) + 15)) & 5) != 0)
                  {
                    unsigned int v27 = 2;
LABEL_122:
                    int v28 = v27 | (v30 >> 20) & 0xF0;
                    *uint64_t v6 = v27 | (v30 >> 20) & 0xF0;
                    v6[1] = *((_WORD *)v19 + 1);
                    goto LABEL_123;
                  }

                  if (BYTE2(v30) == 242)
                  {
                    unsigned int v27 = 3;
                    goto LABEL_122;
                  }
                }

                break;
              case 2u:
                int v35 = (v30 >> 20) & 0xF;
                int v28 = (v30 >> 20);
                if (v35 != 15)
                {
                  if (((1 << v35) & 0x3000) != 0) {
                    unsigned int v27 = 2;
                  }
                  if (((1 << v35) & 0x4F00) != 0) {
                    unsigned int v27 = 3;
                  }
                }

                break;
              case 3u:
                unsigned int v32 = (v30 >> 20) & 0xF;
                uint64_t v88 = 0LL;
                unsigned int v27 = HIWORD(v30) & 0xF;
                if (v32 < 2) {
                  ++v27;
                }
                if (v32) {
                  BOOL v33 = v32 == 3;
                }
                else {
                  BOOL v33 = 1;
                }
                if (v33) {
                  ++v27;
                }
                if (v27 > 8)
                {
                  unsigned int v27 = 0;
                  goto LABEL_73;
                }

                if (v32 == 3 || (LODWORD(v36) = v27, !v32))
                {
                  uint64_t v36 = (int)v27 - 1LL;
                  *((_BYTE *)&v88 + v36) = -9;
                }

                if (v32 > 1)
                {
                  char v37 = (char *)&v88;
                }

                else
                {
                  LOBYTE(v88) = -16;
                  LODWORD(v36) = v36 - 1;
                  char v37 = (char *)&v88 + 1;
                }

                if ((int)v36 >= 1)
                {
                  char v38 = 0;
                  uint64_t v39 = 0LL;
                  do
                  {
                    if (v39 <= 5)
                    {
                      else {
                        uint64_t v41 = v19;
                      }
                      else {
                        char v42 = 8;
                      }
                      char v40 = *v41 >> (v42 + v38);
                    }

                    else
                    {
                      char v40 = 0;
                    }

                    v37[v39] = v40;
                    v38 -= 8;
                    ++v39;
                  }

                  while (v36 != v39);
                }

                if (v27)
                {
                  if (*((unsigned __int8 *)&v88 + v27 - 1) == 247)
                  {
                    if (v27 >= 4)
                    {
                      unsigned int v43 = v27 / 3;
                      if (-1431655765 * v27 > 0x55555555) {
                        ++v43;
                      }
                    }

                    else
                    {
                      unsigned int v43 = 1;
                    }
                  }

                  else if (v27 >= 3)
                  {
                    unsigned int v43 = v27 / 3 + v27 % 3;
                  }

                  else
                  {
                    unsigned int v43 = v27;
                  }
                }

                else
                {
LABEL_73:
                  unsigned int v43 = 0;
                }

                if (v43 <= (v87 - (unint64_t)v6) >> 2)
                {
                  int v44 = 0;
                  while (v27 != 1)
                  {
                    if (!v27)
                    {
                      uint64_t v64 = byte_23208[(unint64_t)*v19 >> 28];
                      uint64_t v29 = v86;
                      goto LABEL_129;
                    }

                    BOOL v45 = v32 != 1;
                    unsigned int v46 = v27 - 3;
                    if (v27 != 3) {
                      BOOL v45 = 1;
                    }
                    if (v27 <= 3 && v45)
                    {
LABEL_95:
                      if (v32 && v32 != 3)
                      {
                        unsigned int v52 = *v19;
                        unsigned int v46 = v27;
                        goto LABEL_110;
                      }

                      unsigned int v46 = v27;
                      unint64_t v51 = v6;
LABEL_98:
                      unsigned int v54 = *v19 >> 28;
                      if (v54) {
                        BOOL v55 = v54 == 15;
                      }
                      else {
                        BOOL v55 = 1;
                      }
                      int v56 = HIBYTE(*v19) & 0xF;
                      if (v55) {
                        LOBYTE(v56) = -1;
                      }
                      int v57 = 16 * (v56 & 0xF);
                      int v28 = v57 | (v46 + 4);
                      *unint64_t v51 = v57 | (v46 + 4);
                      uint64_t v58 = v46;
                      memcpy(v51 + 1, (char *)&v88 + v44, v46);
                      unsigned int v27 = 0;
                      uint64_t v6 = &v51[v46 + 1];
                      if (v46 <= 2)
                      {
                        else {
                          int v59 = 3 - v46;
                        }
                        uint64_t v60 = 3 - v46 - v59;
                        bzero(v6, v60 + 1);
                        unsigned int v27 = 0;
                        uint64_t v6 = &v51[v58 + 2 + v60];
                      }
                    }

                    else
                    {
                      unsigned int v47 = *v19 >> 28;
                      if (v47) {
                        BOOL v48 = v47 == 15;
                      }
                      else {
                        BOOL v48 = 1;
                      }
                      int v49 = HIBYTE(*v19) & 0xF;
                      if (v48) {
                        LOBYTE(v49) = -1;
                      }
                      int v28 = (16 * (v49 & 0xF)) | 4;
                      *uint64_t v6 = (16 * (v49 & 0xF)) | 4;
                      uint64_t v50 = (char *)&v88 + v44;
                      v6[1] = *v50;
                      _BYTE v6[2] = v50[1];
                      v44 += 3;
                      unint64_t v51 = v6 + 4;
                      void v6[3] = v50[2];
                      LODWORD(v50) = v27 - 4;
                      v27 -= 3;
                      v6 += 4;
                      if (v50 <= 2)
                      {
                        unsigned int v52 = *v19;
                        if (*v19 >> 28 == 3) {
                          int v53 = (*v19 >> 20) & 0xF;
                        }
                        else {
                          int v53 = -1;
                        }
LABEL_111:
                        if (v52 >> 28) {
                          BOOL v61 = v52 >> 28 == 15;
                        }
                        else {
                          BOOL v61 = 1;
                        }
                        int v62 = HIBYTE(v52) & 0xF;
                        if (v61) {
                          LOBYTE(v62) = -1;
                        }
                        int v28 = (16 * (v62 & 0xF)) | 0xF;
                        *unint64_t v51 = (16 * (v62 & 0xF)) | 0xF;
                        char v63 = *((_BYTE *)&v88 + v44++);
                        v51[1] = v63;
                        *((_WORD *)v51 + 1) = 0;
                        uint64_t v6 = v51 + 4;
                        unsigned int v27 = v46 - 1;
                      }
                    }
                  }

                  unsigned int v52 = *v19;
                  if ((*v19 & 0xF0F00000) != 0x30300000)
                  {
                    unsigned int v46 = 1;
LABEL_110:
                    unint64_t v51 = v6;
                    goto LABEL_111;
                  }

                  goto LABEL_95;
                }

                unint64_t v69 = (char *)v19 - v84;
                unsigned int v19 = (unsigned int *)v84;
                unint64_t v26 = v69 >> 2;
LABEL_142:
                int v5 = a5;
                int v9 = v79;
                uint64_t v7 = a2;
                uint64_t v8 = v83;
                unint64_t v10 = v87;
                unsigned int v16 = v85;
                unsigned int v15 = v82;
                unint64_t v18 = v80;
                uint64_t v17 = v81;
                goto LABEL_143;
            }

            if (!v28) {
              goto LABEL_128;
            }
            *uint64_t v6 = v28;
            v6[1] = *((_WORD *)v19 + 1);
            if (v27 <= 1) {
              goto LABEL_48;
            }
LABEL_123:
            _BYTE v6[2] = BYTE1(*v19);
            if (v27 > 2)
            {
              void v6[3] = *v19;
              goto LABEL_127;
            }

            unsigned int v27 = 2;
LABEL_125:
            void v6[3] = 0;
LABEL_127:
            v6 += 4;
LABEL_128:
            uint64_t v64 = byte_23208[(unint64_t)*v19 >> 28];
LABEL_129:
            v19 += v64;
          }
        }

LABEL_143:
        int v68 = &v19[v26];
        v16 += v26;
        if (v10 - (unint64_t)v6 < 4 {
LABEL_145:
        }
        if (v16 >= v15) {
          goto LABEL_9;
        }
      }

      if (v10 <= (unint64_t)v6)
      {
        LODWORD(v65) = 0;
      }

      else
      {
        unint64_t v20 = (v18 - (unint64_t)v19) >> 2;
        unint64_t v21 = (unsigned int *)(v17 + 4LL * v16);
        uint64_t v22 = v6;
        while ((int)v20 >= 1)
        {
          unint64_t v23 = byte_23208[(unint64_t)*v21 >> 28];
          if (byte_23208[(unint64_t)*v21 >> 28])
          {
            char v24 = &v21[v23];
            do
            {
              int v25 = *v21++;
              *(_DWORD *)uint64_t v22 = v25;
              v22 += 4;
            }

            while (v21 < v24);
          }

          unint64_t v20 = (v18 - (unint64_t)v21) >> 2;
        }

        unint64_t v65 = (unint64_t)(v22 - v6) >> 2;
      }

      unsigned int v66 = &v19[(int)v65];
      v6 += 4 * (int)v65;
      if ((unint64_t)v66 < v18)
      {
        v16 += v65;
        goto LABEL_145;
      }

LABEL_148:
      sub_1F344((uint64_t)&v88, v8 + 296, v7[1], v8);
      uint64_t v71 = v70;
      for (uint64_t i = v7[1]; i != v71; uint64_t i = sub_13D18(i - 296))
        ;
      v7[1] = v71;
    }

    unsigned int v16 = 0;
LABEL_9:
    v8 += 296LL;
  }

  while (!v16);
  uint64_t v73 = *v7;
  uint64_t v74 = v7[1];
  while (v73 != v74)
  {
    if (*(unsigned __int8 *)(v73 + 292) == v9)
    {
      if (v73 != v74) {
        *(_DWORD *)(v73 + 288) += v16;
      }
      return (_BYTE *)(v6 - a3);
    }

    v73 += 296LL;
  }

  return (_BYTE *)(v6 - a3);
}

uint64_t sub_1DCDC(int a1, MIDIObjectRef obj)
{
  CFStringRef v6 = 0LL;
  CFStringRef str = 0LL;
  CFStringRef v5 = 0LL;
  if (!obj) {
    return 0LL;
  }
  MIDIObjectGetStringProperty(obj, kMIDIPropertyName, &str);
  if (str) {
    uint64_t v3 = CFEqual(str, @"USB MIDI Device") != 0;
  }
  else {
    uint64_t v3 = 0LL;
  }
  MIDIObjectGetStringProperty(obj, kMIDIPropertyModel, &v6);
  if (v6)
  {
    if (CFEqual(v6, @"USB MIDI Device")) {
      uint64_t v3 = 1LL;
    }
    else {
      uint64_t v3 = v3;
    }
  }

  MIDIObjectGetStringProperty(obj, kMIDIPropertyManufacturer, &v5);
  if (v5)
  {
    if (CFEqual(v5, @"Generic")) {
      uint64_t v3 = 1LL;
    }
    else {
      uint64_t v3 = v3;
    }
  }

  if (str) {
    CFRelease(str);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v5) {
    CFRelease(v5);
  }
  return v3;
}

BOOL sub_1DDE0(int a1, MIDIDeviceRef device)
{
  CFStringRef str = 0LL;
  ItemCount NumberOfEntities = MIDIDeviceGetNumberOfEntities(device);
  if (NumberOfEntities)
  {
    ItemCount v4 = NumberOfEntities;
    ItemCount v5 = 0LL;
    BOOL v6 = 1;
    do
    {
      MIDIEntityRef Entity = MIDIDeviceGetEntity(device, v5);
      if (Entity)
      {
        MIDIObjectGetStringProperty(Entity, kMIDIPropertyName, &str);
        if (str)
        {
          int v8 = CFEqual(str, @"USB MIDI Device");
          CFStringRef v9 = str;
          if (v8) {
            goto LABEL_10;
          }
          if (str)
          {
            CFRelease(str);
            CFStringRef str = 0LL;
          }
        }
      }

      BOOL v6 = ++v5 < v4;
    }

    while (v4 != v5);
    BOOL v6 = 0;
    CFStringRef v9 = str;
LABEL_10:
    if (v9) {
      CFRelease(v9);
    }
  }

  else
  {
    return 0;
  }

  return v6;
}

uint64_t sub_1DEB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v8 = sub_1DCDC(a1, a2);
  if ((v8 & 1) != 0) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 200LL))(a1, a3, a4, a2);
  }
  uint64_t result = sub_1DDE0(v8, a2);
  if ((_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 200LL))(a1, a3, a4, a2);
  }
  return result;
}

void *sub_1DF24(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556LL) {
    sub_2E9C();
  }
  return operator new(12 * a2);
}

uint64_t sub_1DF68(uint64_t result, unint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7 = result;
LABEL_2:
  unint64_t v8 = v7;
  while (2)
  {
    uint64_t v7 = v8;
    uint64_t v9 = a2 - v8;
    uint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2 - v8) >> 2);
    switch(v10)
    {
      case 0LL:
      case 1LL:
        return result;
      case 2LL:
        if (*(unsigned __int8 *)(a2 - 10) < *(unsigned __int8 *)(v8 + 2))
        {
          int v123 = *(_DWORD *)(v8 + 8);
          uint64_t v114 = *(void *)v8;
          uint64_t v45 = *(void *)(a2 - 12);
          *(_DWORD *)(v8 + 8) = *(_DWORD *)(a2 - 4);
          *(void *)unint64_t v8 = v45;
          *(_DWORD *)(a2 - 4) = v123;
          *(void *)(a2 - 12) = v114;
        }

        return result;
      case 3LL:
        return (uint64_t)sub_1E914((uint64_t *)v8, (uint64_t *)(v8 + 12), (uint64_t *)(a2 - 12));
      case 4LL:
        return (uint64_t)sub_1ECC0(v8, v8 + 12, v8 + 24, a2 - 12);
      case 5LL:
        unsigned int v46 = (uint64_t *)(v8 + 12);
        unsigned int v47 = (uint64_t *)(v8 + 24);
        BOOL v48 = (uint64_t *)(v8 + 36);
        uint64_t result = (uint64_t)sub_1ECC0(v8, v8 + 12, v8 + 24, v8 + 36);
        if (*(unsigned __int8 *)(a2 - 10) < *(unsigned __int8 *)(v8 + 38))
        {
          uint64_t v49 = *v48;
          int v50 = *(_DWORD *)(v8 + 44);
          int v51 = *(_DWORD *)(a2 - 4);
          *BOOL v48 = *(void *)(a2 - 12);
          *(_DWORD *)(v8 + 44) = v51;
          *(_DWORD *)(a2 - 4) = v50;
          *(void *)(a2 - 12) = v49;
          if (*(unsigned __int8 *)(v8 + 38) < *(unsigned __int8 *)(v8 + 26))
          {
            int v52 = *(_DWORD *)(v8 + 32);
            uint64_t v53 = *v47;
            uint64_t *v47 = *v48;
            *(_DWORD *)(v8 + 32) = *(_DWORD *)(v8 + 44);
            *BOOL v48 = v53;
            *(_DWORD *)(v8 + 44) = v52;
            if (*(unsigned __int8 *)(v8 + 26) < *(unsigned __int8 *)(v8 + 14))
            {
              int v54 = *(_DWORD *)(v8 + 20);
              uint64_t v55 = *v46;
              uint64_t *v46 = *v47;
              *(_DWORD *)(v8 + 20) = *(_DWORD *)(v8 + 32);
              uint64_t *v47 = v55;
              *(_DWORD *)(v8 + 32) = v54;
              if (*(unsigned __int8 *)(v8 + 14) < *(unsigned __int8 *)(v8 + 2))
              {
                int v124 = *(_DWORD *)(v8 + 8);
                uint64_t v115 = *(void *)v8;
                *(void *)unint64_t v8 = *v46;
                *(_DWORD *)(v8 + 8) = *(_DWORD *)(v8 + 20);
                uint64_t *v46 = v115;
                *(_DWORD *)(v8 + 20) = v124;
              }
            }
          }
        }

        return result;
      default:
        if (v9 <= 287)
        {
          int v56 = (_WORD *)(v8 + 12);
          BOOL v58 = v8 == a2 || v56 == (_WORD *)a2;
          if ((a4 & 1) != 0)
          {
            if (!v58)
            {
              uint64_t v59 = 0LL;
              uint64_t v60 = (_WORD *)v8;
              do
              {
                BOOL v61 = v56;
                unsigned int v62 = *((unsigned __int8 *)v60 + 14);
                if (v62 < *((unsigned __int8 *)v60 + 2))
                {
                  __int16 v63 = *v61;
                  uint64_t v116 = *(void *)((char *)v60 + 15);
                  char v125 = *((_BYTE *)v60 + 23);
                  uint64_t v64 = v59;
                  while (1)
                  {
                    uint64_t v65 = v8 + v64;
                    *(void *)(v65 + 12) = *(void *)(v8 + v64);
                    *(_DWORD *)(v65 + 20) = *(_DWORD *)(v8 + v64 + 8);
                    if (!v64) {
                      break;
                    }
                    v64 -= 12LL;
                    if (v62 >= *(unsigned __int8 *)(v65 - 10))
                    {
                      uint64_t v66 = v8 + v64 + 12;
                      goto LABEL_79;
                    }
                  }

                  uint64_t v66 = v8;
LABEL_79:
                  *(_WORD *)uint64_t v66 = v63;
                  *(_BYTE *)(v66 + 2) = v62;
                  *(_BYTE *)(v66 + 11) = v125;
                  *(void *)(v66 + 3) = v116;
                }

                int v56 = v61 + 6;
                v59 += 12LL;
                uint64_t v60 = v61;
              }

              while (v61 + 6 != (_WORD *)a2);
            }
          }

          else if (!v58)
          {
            do
            {
              __int128 v99 = v56;
              unsigned int v100 = *(unsigned __int8 *)(v7 + 14);
              if (v100 < *(unsigned __int8 *)(v7 + 2))
              {
                __int16 v101 = *v56;
                uint64_t v119 = *(void *)(v7 + 15);
                char v128 = *(_BYTE *)(v7 + 23);
                __int128 v102 = v99;
                do
                {
                  __int128 v103 = v102;
                  uint64_t v104 = *(void *)(v102 - 6);
                  v102 -= 6;
                  *(void *)__int128 v103 = v104;
                  *((_DWORD *)v103 + 2) = *((_DWORD *)v103 - 1);
                }

                while (v100 < *((unsigned __int8 *)v103 - 22));
                *__int128 v102 = v101;
                *((_BYTE *)v102 + 2) = v100;
                *((_BYTE *)v102 + 11) = v128;
                *(void *)((char *)v102 + 3) = v119;
              }

              int v56 = v99 + 6;
              uint64_t v7 = (uint64_t)v99;
            }

            while (v99 + 6 != (_WORD *)a2);
          }

          return result;
        }

        if (!a3)
        {
          if (v8 != a2)
          {
            int64_t v67 = (unint64_t)(v10 - 2) >> 1;
            int64_t v68 = v67;
            do
            {
              int64_t v69 = v68;
              if (v67 >= v68)
              {
                uint64_t v70 = (2 * v68) | 1;
                unint64_t v71 = v8 + 12 * v70;
                if (2 * v69 + 2 < v10)
                {
                  unsigned int v72 = *(unsigned __int8 *)(v8 + 12 * v70 + 2);
                  unsigned int v73 = *(unsigned __int8 *)(v71 + 14);
                  v71 += 12LL * (v72 < v73);
                  if (v72 < v73) {
                    uint64_t v70 = 2 * v69 + 2;
                  }
                }

                unsigned int v74 = *(unsigned __int8 *)(v8 + 12 * v69 + 2);
                if (*(unsigned __int8 *)(v71 + 2) >= v74)
                {
                  uint64_t v75 = v8 + 12 * v69;
                  __int16 v76 = *(_WORD *)v75;
                  char v126 = *(_BYTE *)(v75 + 11);
                  uint64_t v117 = *(void *)(v75 + 3);
                  do
                  {
                    uint64_t result = v75;
                    uint64_t v75 = v71;
                    uint64_t v77 = *(void *)v71;
                    *(_DWORD *)(result + 8) = *(_DWORD *)(v75 + 8);
                    *(void *)uint64_t result = v77;
                    if (v67 < v70) {
                      break;
                    }
                    uint64_t result = (2 * v70) | 1;
                    unint64_t v71 = v8 + 12 * result;
                    uint64_t v78 = 2 * v70 + 2;
                    if (v78 < v10)
                    {
                      unsigned int v79 = *(unsigned __int8 *)(v8 + 12 * result + 2);
                      unsigned int v80 = *(unsigned __int8 *)(v71 + 14);
                      v71 += 12LL * (v79 < v80);
                      if (v79 < v80) {
                        uint64_t result = v78;
                      }
                    }

                    uint64_t v70 = result;
                  }

                  while (*(unsigned __int8 *)(v71 + 2) >= v74);
                  *(_WORD *)uint64_t v75 = v76;
                  *(_BYTE *)(v75 + 2) = v74;
                  *(_BYTE *)(v75 + 11) = v126;
                  *(void *)(v75 + 3) = v117;
                }
              }

              int64_t v68 = v69 - 1;
            }

            while (v69);
            int64_t v81 = v9 / 0xCuLL;
            do
            {
              uint64_t v82 = 0LL;
              int v127 = *(_DWORD *)(v8 + 8);
              uint64_t v118 = *(void *)v8;
              unint64_t v83 = v8;
              do
              {
                uint64_t v84 = v82 + 1;
                unint64_t v85 = v83 + 12 * (v82 + 1);
                uint64_t v86 = (2 * v82) | 1;
                uint64_t v87 = 2 * v82 + 2;
                if (v87 < v81)
                {
                  unsigned int v88 = *(unsigned __int8 *)(v83 + 12 * v84 + 2);
                  unsigned int v89 = *(unsigned __int8 *)(v85 + 14);
                  v85 += 12LL * (v88 < v89);
                  if (v88 < v89) {
                    uint64_t v86 = v87;
                  }
                }

                uint64_t v90 = *(void *)v85;
                *(_DWORD *)(v83 + 8) = *(_DWORD *)(v85 + 8);
                *(void *)unint64_t v83 = v90;
                unint64_t v83 = v85;
                uint64_t v82 = v86;
              }

              while (v86 <= (uint64_t)((unint64_t)(v81 - 2) >> 1));
              a2 -= 12LL;
              if (v85 == a2)
              {
                *(_DWORD *)(v85 + 8) = v127;
                *(void *)unint64_t v85 = v118;
              }

              else
              {
                uint64_t v91 = *(void *)a2;
                *(_DWORD *)(v85 + 8) = *(_DWORD *)(a2 + 8);
                *(void *)unint64_t v85 = v91;
                *(_DWORD *)(a2 + 8) = v127;
                *(void *)a2 = v118;
                uint64_t v92 = v85 - v8 + 12;
                if (v92 >= 13)
                {
                  unint64_t v93 = (v92 / 0xCuLL - 2) >> 1;
                  unsigned int v94 = *(unsigned __int8 *)(v85 + 2);
                  if (*(unsigned __int8 *)(v8 + 12 * v93 + 2) < v94)
                  {
                    __int16 v95 = *(_WORD *)v85;
                    char v110 = *(_BYTE *)(v85 + 11);
                    uint64_t v107 = *(void *)(v85 + 3);
                    do
                    {
                      unint64_t v96 = v85;
                      unint64_t v85 = v8 + 12 * v93;
                      uint64_t v97 = *(void *)v85;
                      *(_DWORD *)(v96 + 8) = *(_DWORD *)(v85 + 8);
                      *(void *)unint64_t v96 = v97;
                      if (!v93) {
                        break;
                      }
                      unint64_t v93 = (v93 - 1) >> 1;
                    }

                    while (*(unsigned __int8 *)(v8 + 12 * v93 + 2) < v94);
                    *(_WORD *)unint64_t v85 = v95;
                    *(_BYTE *)(v85 + 2) = v94;
                    *(_BYTE *)(v85 + 11) = v110;
                    *(void *)(v85 + 3) = v107;
                  }
                }
              }
            }

            while (v81-- > 2);
          }

          return result;
        }

        unint64_t v11 = (unint64_t)v10 >> 1;
        unint64_t v12 = v8 + 12 * ((unint64_t)v10 >> 1);
        if ((unint64_t)v9 < 0x601)
        {
          uint64_t result = (uint64_t)sub_1E914((uint64_t *)(v7 + 12 * v11), (uint64_t *)v7, (uint64_t *)(a2 - 12));
        }

        else
        {
          sub_1E914((uint64_t *)v7, (uint64_t *)(v7 + 12 * v11), (uint64_t *)(a2 - 12));
          uint64_t v13 = 3 * v11;
          int v14 = (uint64_t *)(v7 + 12 * v11 - 12);
          sub_1E914((uint64_t *)(v7 + 12), v14, (uint64_t *)(a2 - 24));
          unsigned int v15 = (uint64_t *)(v7 + 12 + 4 * v13);
          sub_1E914((uint64_t *)(v7 + 24), v15, (uint64_t *)(a2 - 36));
          uint64_t result = (uint64_t)sub_1E914(v14, (uint64_t *)v12, v15);
          int v120 = *(_DWORD *)(v7 + 8);
          uint64_t v111 = *(void *)v7;
          int v16 = *(_DWORD *)(v12 + 8);
          *(void *)uint64_t v7 = *(void *)v12;
          *(_DWORD *)(v7 + 8) = v16;
          *(_DWORD *)(v12 + 8) = v120;
          *(void *)unint64_t v12 = v111;
        }

        --a3;
        if ((a4 & 1) == 0)
        {
          unsigned int v17 = *(unsigned __int8 *)(v7 + 2);
          __int16 v33 = *(_WORD *)v7;
          uint64_t v106 = *(void *)(v7 + 3);
          char v109 = *(_BYTE *)(v7 + 11);
          if (v17 >= *(unsigned __int8 *)(a2 - 10))
          {
            unint64_t v36 = v7 + 12;
            do
            {
              unint64_t v8 = v36;
              if (v36 >= a2) {
                break;
              }
              unsigned int v37 = *(unsigned __int8 *)(v36 + 2);
              v36 += 12LL;
            }

            while (v17 >= v37);
          }

          else
          {
            uint64_t v34 = v7;
            do
            {
              unint64_t v8 = v34 + 12;
              unsigned int v35 = *(unsigned __int8 *)(v34 + 14);
              v34 += 12LL;
            }

            while (v17 >= v35);
          }

          unint64_t v38 = a2;
          if (v8 < a2)
          {
            unint64_t v39 = a2;
            do
            {
              unint64_t v38 = v39 - 12;
              unsigned int v40 = *(unsigned __int8 *)(v39 - 10);
              v39 -= 12LL;
            }

            while (v17 < v40);
          }

          while (v8 < v38)
          {
            int v122 = *(_DWORD *)(v8 + 8);
            uint64_t v113 = *(void *)v8;
            uint64_t v41 = *(void *)v38;
            *(_DWORD *)(v8 + 8) = *(_DWORD *)(v38 + 8);
            *(void *)unint64_t v8 = v41;
            *(_DWORD *)(v38 + 8) = v122;
            *(void *)unint64_t v38 = v113;
            do
            {
              unsigned int v42 = *(unsigned __int8 *)(v8 + 14);
              v8 += 12LL;
            }

            while (v17 >= v42);
            do
            {
              unsigned int v43 = *(unsigned __int8 *)(v38 - 10);
              v38 -= 12LL;
            }

            while (v17 < v43);
          }

          if (v8 - 12 != v7)
          {
            uint64_t v44 = *(void *)(v8 - 12);
            *(_DWORD *)(v7 + 8) = *(_DWORD *)(v8 - 4);
            *(void *)uint64_t v7 = v44;
          }

          a4 = 0;
          *(_WORD *)(v8 - 12) = v33;
          *(_BYTE *)(v8 - 10) = v17;
          *(_BYTE *)(v8 - 1) = v109;
          *(void *)(v8 - 9) = v106;
          continue;
        }

        unsigned int v17 = *(unsigned __int8 *)(v7 + 2);
LABEL_12:
        uint64_t v18 = 0LL;
        __int16 v19 = *(_WORD *)v7;
        uint64_t v105 = *(void *)(v7 + 3);
        char v108 = *(_BYTE *)(v7 + 11);
        do
        {
          unsigned int v20 = *(unsigned __int8 *)(v7 + v18 + 14);
          v18 += 12LL;
        }

        while (v20 < v17);
        unint64_t v21 = v7 + v18;
        unint64_t v22 = a2;
        if (v18 == 12)
        {
          unint64_t v25 = a2;
          while (v21 < v25)
          {
            unint64_t v23 = v25 - 12;
            unsigned int v26 = *(unsigned __int8 *)(v25 - 10);
            v25 -= 12LL;
            if (v26 < v17) {
              goto LABEL_22;
            }
          }

          unint64_t v23 = v25;
        }

        else
        {
          do
          {
            unint64_t v23 = v22 - 12;
            unsigned int v24 = *(unsigned __int8 *)(v22 - 10);
            v22 -= 12LL;
          }

          while (v24 >= v17);
        }

uint64_t *sub_1E914(uint64_t *result, uint64_t *a2, uint64_t *a3)
{
  unsigned int v3 = *((unsigned __int8 *)a2 + 2);
  unsigned int v4 = *((unsigned __int8 *)a3 + 2);
  if (v3 >= *((unsigned __int8 *)result + 2))
  {
    if (v4 < v3)
    {
      int v8 = *((_DWORD *)a2 + 2);
      uint64_t v9 = *a2;
      int v10 = *((_DWORD *)a3 + 2);
      *a2 = *a3;
      *((_DWORD *)a2 + 2) = v10;
      *a3 = v9;
      *((_DWORD *)a3 + 2) = v8;
      if (*((unsigned __int8 *)a2 + 2) < *((unsigned __int8 *)result + 2))
      {
        int v11 = *((_DWORD *)result + 2);
        uint64_t v12 = *result;
        int v13 = *((_DWORD *)a2 + 2);
        const char *result = *a2;
        *((_DWORD *)result + 2) = v13;
        *a2 = v12;
        *((_DWORD *)a2 + 2) = v11;
      }
    }
  }

  else
  {
    if (v4 >= v3)
    {
      int v14 = *((_DWORD *)result + 2);
      uint64_t v15 = *result;
      int v16 = *((_DWORD *)a2 + 2);
      const char *result = *a2;
      *((_DWORD *)result + 2) = v16;
      *a2 = v15;
      *((_DWORD *)a2 + 2) = v14;
      int v5 = *((_DWORD *)a2 + 2);
      uint64_t v6 = *a2;
      int v17 = *((_DWORD *)a3 + 2);
      *a2 = *a3;
      *((_DWORD *)a2 + 2) = v17;
    }

    else
    {
      int v5 = *((_DWORD *)result + 2);
      uint64_t v6 = *result;
      int v7 = *((_DWORD *)a3 + 2);
      const char *result = *a3;
      *((_DWORD *)result + 2) = v7;
    }

    *a3 = v6;
    *((_DWORD *)a3 + 2) = v5;
  }

  return result;
}

BOOL sub_1EA04(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 2);
  BOOL result = 1LL;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      if (*(unsigned __int8 *)(a2 - 10) < *(unsigned __int8 *)(a1 + 2))
      {
        int v6 = *(_DWORD *)(a1 + 8);
        uint64_t v7 = *(void *)a1;
        int v8 = *(_DWORD *)(a2 - 4);
        *(void *)a1 = *(void *)(a2 - 12);
        *(_DWORD *)(a1 + 8) = v8;
        *(void *)(a2 - 12) = v7;
        *(_DWORD *)(a2 - 4) = v6;
      }

      return result;
    case 3uLL:
      sub_1E914((uint64_t *)a1, (uint64_t *)(a1 + 12), (uint64_t *)(a2 - 12));
      return 1LL;
    case 4uLL:
      sub_1ECC0(a1, a1 + 12, a1 + 24, a2 - 12);
      return 1LL;
    case 5uLL:
      uint64_t v18 = (uint64_t *)(a1 + 12);
      __int16 v19 = (uint64_t *)(a1 + 24);
      unsigned int v20 = (uint64_t *)(a1 + 36);
      sub_1ECC0(a1, a1 + 12, a1 + 24, a1 + 36);
      if (*(unsigned __int8 *)(a2 - 10) < *(unsigned __int8 *)(a1 + 38))
      {
        int v21 = *(_DWORD *)(a1 + 44);
        uint64_t v22 = *v20;
        int v23 = *(_DWORD *)(a2 - 4);
        uint64_t *v20 = *(void *)(a2 - 12);
        *(_DWORD *)(a1 + 44) = v23;
        *(void *)(a2 - 12) = v22;
        *(_DWORD *)(a2 - 4) = v21;
        if (*(unsigned __int8 *)(a1 + 38) < *(unsigned __int8 *)(a1 + 26))
        {
          int v24 = *(_DWORD *)(a1 + 32);
          uint64_t v25 = *v19;
          uint64_t *v19 = *v20;
          *(_DWORD *)(a1 + 32) = *(_DWORD *)(a1 + 44);
          uint64_t *v20 = v25;
          *(_DWORD *)(a1 + 44) = v24;
          if (*(unsigned __int8 *)(a1 + 26) < *(unsigned __int8 *)(a1 + 14))
          {
            int v26 = *(_DWORD *)(a1 + 20);
            uint64_t v27 = *v18;
            uint64_t *v18 = *v19;
            *(_DWORD *)(a1 + 20) = *(_DWORD *)(a1 + 32);
            uint64_t *v19 = v27;
            *(_DWORD *)(a1 + 32) = v26;
            if (*(unsigned __int8 *)(a1 + 14) < *(unsigned __int8 *)(a1 + 2))
            {
              int v28 = *(_DWORD *)(a1 + 8);
              uint64_t v29 = *(void *)a1;
              *(void *)a1 = *v18;
              *(_DWORD *)(a1 + 8) = *(_DWORD *)(a1 + 20);
              uint64_t *v18 = v29;
              *(_DWORD *)(a1 + 20) = v28;
            }
          }
        }
      }

      return 1LL;
    default:
      uint64_t v9 = a1 + 24;
      sub_1E914((uint64_t *)a1, (uint64_t *)(a1 + 12), (uint64_t *)(a1 + 24));
      uint64_t v10 = a1 + 36;
      if (a1 + 36 == a2) {
        return 1LL;
      }
      uint64_t v11 = 0LL;
      int v12 = 0;
      break;
  }

  while (1)
  {
    unsigned int v13 = *(unsigned __int8 *)(v10 + 2);
    if (v13 < *(unsigned __int8 *)(v9 + 2))
    {
      __int16 v14 = *(_WORD *)v10;
      uint64_t v30 = *(void *)(v10 + 3);
      char v31 = *(_BYTE *)(v10 + 11);
      uint64_t v15 = v11;
      while (1)
      {
        uint64_t v16 = a1 + v15;
        *(void *)(v16 + 36) = *(void *)(a1 + v15 + 24);
        *(_DWORD *)(v16 + 44) = *(_DWORD *)(a1 + v15 + 32);
        if (v15 == -24) {
          break;
        }
        v15 -= 12LL;
        if (v13 >= *(unsigned __int8 *)(v16 + 14))
        {
          uint64_t v17 = a1 + v15 + 36;
          goto LABEL_12;
        }
      }

      uint64_t v17 = a1;
LABEL_12:
      *(_WORD *)uint64_t v17 = v14;
      *(_BYTE *)(v17 + 2) = v13;
      *(void *)(v17 + 3) = v30;
      *(_BYTE *)(v17 + 11) = v31;
      if (++v12 == 8) {
        return v10 + 12 == a2;
      }
    }

    uint64_t v9 = v10;
    v11 += 12LL;
    v10 += 12LL;
    if (v10 == a2) {
      return 1LL;
    }
  }

uint64_t *sub_1ECC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL result = sub_1E914((uint64_t *)a1, (uint64_t *)a2, (uint64_t *)a3);
  if (*(unsigned __int8 *)(a4 + 2) < *(unsigned __int8 *)(a3 + 2))
  {
    int v9 = *(_DWORD *)(a3 + 8);
    uint64_t v10 = *(void *)a3;
    int v11 = *(_DWORD *)(a4 + 8);
    *(void *)a3 = *(void *)a4;
    *(_DWORD *)(a3 + 8) = v11;
    *(void *)a4 = v10;
    *(_DWORD *)(a4 + 8) = v9;
    if (*(unsigned __int8 *)(a3 + 2) < *(unsigned __int8 *)(a2 + 2))
    {
      int v12 = *(_DWORD *)(a2 + 8);
      uint64_t v13 = *(void *)a2;
      int v14 = *(_DWORD *)(a3 + 8);
      *(void *)a2 = *(void *)a3;
      *(_DWORD *)(a2 + 8) = v14;
      *(void *)a3 = v13;
      *(_DWORD *)(a3 + 8) = v12;
      if (*(unsigned __int8 *)(a2 + 2) < *(unsigned __int8 *)(a1 + 2))
      {
        int v15 = *(_DWORD *)(a1 + 8);
        uint64_t v16 = *(void *)a1;
        int v17 = *(_DWORD *)(a2 + 8);
        *(void *)a1 = *(void *)a2;
        *(_DWORD *)(a1 + 8) = v17;
        *(void *)a2 = v16;
        *(_DWORD *)(a2 + 8) = v15;
      }
    }
  }

  return result;
}

uint64_t sub_1ED8C(uint64_t result, uint64_t a2, unint64_t a3, char *a4)
{
  unint64_t v4 = *(char **)(result + 8);
  uint64_t v5 = v4 - a4;
  int v6 = (uint64_t *)(a2 + v4 - a4);
  uint64_t v7 = v4;
  while ((unint64_t)v6 < a3)
  {
    uint64_t v8 = *v6++;
    *(void *)uint64_t v7 = v8;
    v7 += 8;
  }

  *(void *)(result + 8) = v7;
  if (v4 != a4)
  {
    int v9 = v4 - 8;
    uint64_t v10 = 8 * (v5 >> 3);
    do
    {
      *(void *)int v9 = *(void *)(a2 - 8 + v10);
      v9 -= 8;
      v10 -= 8LL;
    }

    while (v10);
  }

  return result;
}

double sub_1EDE0(uint64_t a1, double *a2)
{
  unint64_t v4 = *(void **)(a1 + 16);
  if (v4 == *(void **)(a1 + 24))
  {
    uint64_t v5 = *(void **)(a1 + 8);
    uint64_t v6 = (uint64_t)v5 - *(void *)a1;
    if ((unint64_t)v5 <= *(void *)a1)
    {
      uint64_t v12 = (uint64_t)v4 - *(void *)a1;
      BOOL v11 = v12 == 0;
      uint64_t v13 = v12 >> 2;
      if (v11) {
        unint64_t v14 = 1LL;
      }
      else {
        unint64_t v14 = v13;
      }
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v25 = *(void *)(a1 + 32);
      *(void *)&__int128 v23 = sub_13EE4(v15, v14);
      *((void *)&v23 + 1) = v23 + 8 * (v14 >> 2);
      *(void *)&__int128 v24 = *((void *)&v23 + 1);
      *((void *)&v24 + 1) = v23 + 8 * v16;
      sub_1F000((uint64_t)&v23, *(uint64_t **)(a1 + 8), (uint64_t)(*(void *)(a1 + 16) - *(void *)(a1 + 8)) >> 3);
      int v17 = *(void **)a1;
      uint64_t v18 = *(void *)(a1 + 8);
      __int128 v20 = v23;
      __int128 v19 = v24;
      *(void *)&__int128 v23 = *(void *)a1;
      *((void *)&v23 + 1) = v18;
      __int128 v21 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)a1 = v20;
      *(_OWORD *)(a1 + 16) = v19;
      __int128 v24 = v21;
      if ((void)v21 != v18) {
        *(void *)&__int128 v24 = v21 + ((v18 - v21 + 7) & 0xFFFFFFFFFFFFFFF8LL);
      }
      if (v17)
      {
        operator delete(v17);
        unint64_t v4 = *(void **)(a1 + 16);
      }

      else
      {
        unint64_t v4 = (void *)v19;
      }
    }

    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (!v8) {
        uint64_t v9 = v7 + 1;
      }
      if (v5 == v4)
      {
        uint64_t v10 = &v5[-(v9 >> 1)];
      }

      else
      {
        do
        {
          v5[-(v9 >> 1)] = *v5;
          ++v5;
        }

        while (v5 != v4);
        unint64_t v4 = *(void **)(a1 + 8);
        uint64_t v10 = &v5[-(v9 >> 1)];
      }

      *(void *)(a1 + 8) = &v4[-(v9 >> 1)];
      *(void *)(a1 + 16) = v10;
      unint64_t v4 = v10;
    }
  }

  double result = *a2;
  *unint64_t v4 = *(void *)a2;
  *(void *)(a1 + 16) = v4 + 1;
  return result;
}

void sub_1EF18( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1EF50(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = a1 + 16;
  sub_14784(a1 + 16, (uint64_t)a3, (uint64_t)a3, *(void *)a1, *(void *)a1, v6, v6);
  a2[1] = v8;
  a2[2] = sub_1F02C(v7, a3, *(uint64_t **)(a1 + 8), (void *)a2[2]);
  uint64_t v9 = *(void *)a1;
  *(void *)a1 = a2[1];
  a2[1] = v9;
  uint64_t v10 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = a2[2];
  a2[2] = v10;
  uint64_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return v6;
}

uint64_t sub_1F000(uint64_t result, uint64_t *a2, uint64_t a3)
{
  unsigned int v3 = *(void **)(result + 16);
  if (a3)
  {
    uint64_t v4 = 8 * a3;
    uint64_t v5 = &v3[a3];
    do
    {
      uint64_t v6 = *a2++;
      *v3++ = v6;
      v4 -= 8LL;
    }

    while (v4);
    unsigned int v3 = v5;
  }

  *(void *)(result + 16) = v3;
  return result;
}

void *sub_1F02C(uint64_t a1, uint64_t *a2, uint64_t *a3, void *a4)
{
  double result = a4;
  while (a2 != a3)
  {
    uint64_t v5 = *a2++;
    *result++ = v5;
  }

  return result;
}

void *sub_1F048(void *a1)
{
  *a1 = off_28F10;
  unint64_t v2 = (const void *)a1[1];
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_1F08C(void *a1)
{
  uint64_t v1 = sub_1F048(a1);
  operator delete(v1);
}

void sub_1F0A0(void *a1)
{
  uint64_t v1 = sub_1F048(a1);
  operator delete(v1);
}

uint64_t sub_1F0B4(unsigned __int8 *a1)
{
  uint64_t result = sub_1F12C(a1);
  if ((_DWORD)result)
  {
    unsigned int v3 = *a1;
    if (v3 >= 0x10)
    {
      uint64_t result = v3 >> 4;
      if ((result - 8) >= 7)
      {
        if ((_DWORD)result == 15 && v3 > 0xF0) {
          return byte_23233[(char)(v3 + 15)];
        }
        else {
          return 0LL;
        }
      }
    }

    else
    {
      return 4LL;
    }
  }

  return result;
}

uint64_t sub_1F12C(unsigned __int8 *a1)
{
  int v1 = *((unsigned __int16 *)a1 + 2);
  if (!*((_WORD *)a1 + 2)) {
    return 0LL;
  }
  unsigned int v3 = *a1;
  if ((v3 >> 4) - 12 < 2) {
    return (__int16)v1 == 2;
  }
  if (v3 >> 4 != 15) {
    return 0LL;
  }
  if (v3 == 241) {
    return (__int16)v1 == 2;
  }
  if (v3 != 246)
  {
    if (v3 != 243) {
      return 0LL;
    }
    return (__int16)v1 == 2;
  }

  return (__int16)v1 == 1;
}

uint64_t sub_1F1A8( MIDIProtocolID a1, MIDITimeStamp a2, char *a3, uint64_t a4, MIDIEventList *a5, unint64_t a6)
{
  uint64_t result = 0LL;
  ByteCount v8 = a6 - (void)a5;
  bzero(a5, a6 - (void)a5);
  unint64_t v14 = MIDIEventListInit(a5, a1);
  if (a4 < 1)
  {
    uint64_t v16 = a3;
    return (unint64_t)(v16 - a3) >> 2;
  }

  int64_t v15 = byte_23208[(unint64_t)*(unsigned int *)a3 >> 28];
  uint64_t v16 = a3;
  if (a4 < v15) {
    return (unint64_t)(v16 - a3) >> 2;
  }
  int v17 = v14;
  char v18 = 0;
  int v19 = -1;
  __int128 v20 = (const UInt32 *)a3;
  __int128 v21 = (unsigned int *)&a3[4 * a4];
  uint64_t v22 = (unsigned int *)&a3[4 * v15];
  while (1)
  {
    uint64_t v16 = (char *)v22;
    unsigned int v23 = *v20 >> 28;
    BOOL v24 = !v23 || v23 == 15;
    int v25 = v24 ? 255 : HIBYTE(*v20) & 0xF;
    if (v19 != -1 && v19 != v25) {
      break;
    }
    if (v23 >= 2)
    {
      if (v23 == 5 || v23 == 3)
      {
        char v18 = 1;
      }

      else
      {
        if ((v18 & 1) != 0) {
          return (unint64_t)((char *)v20 - a3) >> 2;
        }
        char v18 = 0;
      }
    }

    uint64_t v27 = MIDIEventListAdd(a5, v8, v17, a2, v15, v20);
    if (!v27) {
      return (unint64_t)((char *)v20 - a3) >> 2;
    }
    if (v16 < (char *)v21)
    {
      int v17 = v27;
      int64_t v15 = byte_23208[(unint64_t)*(unsigned int *)v16 >> 28];
      uint64_t v22 = (unsigned int *)&v16[4 * v15];
      __int128 v20 = (const UInt32 *)v16;
      int v19 = v25;
      if (v22 <= v21) {
        continue;
      }
    }

    return (unint64_t)(v16 - a3) >> 2;
  }

  return (unint64_t)((char *)v20 - a3) >> 2;
}

uint64_t sub_1F344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  if (a2 == a3) {
    return a2;
  }
  uint64_t v6 = a3;
  do
  {
    sub_1F3C0((unsigned int *)a4, (unsigned int *)v5);
    uint64_t v7 = *(void *)(v5 + 280);
    *(void *)(a4 + 285) = *(void *)(v5 + 285);
    *(void *)(a4 + 280) = v7;
    a4 += 296LL;
    v5 += 296LL;
  }

  while (v5 != v6);
  return v6;
}

unsigned int *sub_1F3C0(unsigned int *result, unsigned int *a2)
{
  unint64_t v2 = result;
  uint64_t v3 = result[68];
  uint64_t v4 = a2[68];
  if ((_DWORD)v3 == -1)
  {
    if ((_DWORD)v4 == -1) {
      return result;
    }
  }

  else if ((_DWORD)v4 == -1)
  {
    uint64_t result = (unsigned int *)((uint64_t (*)(char *, unsigned int *, unsigned int *))off_28F40[v3])( &v6,  result,  a2);
    v2[68] = -1;
    return result;
  }

  uint64_t v5 = result;
  return (unsigned int *)(*(&off_28F50 + v4))((int)&v5, result, a2);
}

_DWORD *sub_1F44C(_DWORD **a1, void *__dst, void *__src)
{
  uint64_t v3 = *a1;
  if (v3[68]) {
    return sub_1F478(v3, __src);
  }
  else {
    return memcpy(__dst, __src, 0x10CuLL);
  }
}

void sub_1F470(uint64_t *a1, uint64_t a2, __n128 *a3)
{
}

_DWORD *sub_1F478(_DWORD *__dst, void *__src)
{
  uint64_t v4 = __dst[68];
  if ((_DWORD)v4 != -1) {
    ((void (*)(char *, _DWORD *))off_28F40[v4])(&v6, __dst);
  }
  __dst[68] = -1;
  memcpy(__dst, __src, 0x10CuLL);
  __dst[68] = 0;
  return __dst;
}

void sub_1F4E8(uint64_t a1, uint64_t a2, __n128 *a3)
{
  if (*(_DWORD *)(a1 + 272) == 1) {
    sub_1F508(a2, a3);
  }
  else {
    sub_1F558(a1, (uint64_t)a3);
  }
}

__n128 sub_1F508(uint64_t a1, __n128 *a2)
{
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    *(void *)(a1 + 8) = v4;
    operator delete(v4);
    *(void *)a1 = 0LL;
    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
  }

  __n128 result = *a2;
  *(__n128 *)a1 = *a2;
  *(void *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0LL;
  a2->n128_u64[1] = 0LL;
  a2[1].n128_u64[0] = 0LL;
  return result;
}

uint64_t sub_1F558(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 272);
  if ((_DWORD)v4 != -1) {
    ((void (*)(char *, uint64_t))off_28F40[v4])(&v6, a1);
  }
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)a2 = 0LL;
  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(_DWORD *)(a1 + 272) = 1;
  return a1;
}

void *sub_1F5D4(void *a1, CFStringRef format, unsigned int a3)
{
  CFStringRef v4 = CFStringCreateWithFormat(0LL, 0LL, format, a3);
  *a1 = &off_28F30;
  a1[1] = v4;
  return a1;
}

void *sub_1F634()
{
  __n128 result = operator new(0x10uLL);
  void *result = &off_28F70;
  return result;
}

void sub_1F658(uint64_t a1, void *a2)
{
  *a2 = &off_28F70;
}

void sub_1F670(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  sub_182F4();
  if (v2)
  {
    sub_182F4();
    uint64_t v3 = (os_log_s *)qword_2C1B0;
    if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315394;
      uint64_t v7 = "USBMIDIDriverBase.cpp";
      __int16 v8 = 1024;
      int v9 = 654;
      _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d ==========================================================================================================",  (uint8_t *)&v6,  0x12u);
    }

    sub_182F4();
    CFStringRef v4 = (os_log_s *)qword_2C1B0;
    if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315650;
      uint64_t v7 = "USBMIDIDriverBase.cpp";
      __int16 v8 = 1024;
      int v9 = 655;
      __int16 v10 = 1024;
      int v11 = v2;
      _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d NOTICE: USB MIDI Driver destructive tracing at level %d",  (uint8_t *)&v6,  0x18u);
    }

    sub_182F4();
    uint64_t v5 = (os_log_s *)qword_2C1B0;
    if (os_log_type_enabled((os_log_t)qword_2C1B0, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315394;
      uint64_t v7 = "USBMIDIDriverBase.cpp";
      __int16 v8 = 1024;
      int v9 = 656;
      _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d ==========================================================================================================",  (uint8_t *)&v6,  0x12u);
    }
  }

void sub_1F7FC(void *a1@<X1>, void *a2@<X2>, void *a3@<X3>, unsigned int *a4@<X4>, void *a5@<X8>)
{
  __int16 v10 = operator new(0x208uLL);
  sub_1F87C(v10, a1, a2, a3, a4);
  *a5 = v10 + 3;
  a5[1] = v10;
  sub_15248((uint64_t)a5, v10 + 11, (uint64_t)(v10 + 3));
}

void sub_1F868(_Unwind_Exception *a1)
{
}

void *sub_1F87C(void *a1, void *a2, void *a3, void *a4, unsigned int *a5)
{
  a1[2] = 0LL;
  *a1 = off_28FB8;
  a1[1] = 0LL;
  sub_D8B4(a1 + 3, *a2, *a3, *a4, *a5);
  return a1;
}

void sub_1F8C4(_Unwind_Exception *a1)
{
}

void sub_1F8D8(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_28FB8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1F8EC(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_28FB8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_1F910(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

char *NewUSBMIDIClassDriver(uint64_t a1, const void *a2)
{
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xECu,  0xDEu,  0x95u,  0x74u,  0xFu,  0xE4u,  0x11u,  0xD4u,  0xBBu,  0x1Au,  0,  0x50u,  0xE4u,  0xCEu,  0xA5u,  0x26u);
  if (!CFEqual(a2, v3)) {
    return 0LL;
  }
  CFStringRef v4 = (char *)operator new(0x78uLL);
  sub_1F9C4((uint64_t)v4);
  return v4 + 8;
}

void sub_1F9B0(_Unwind_Exception *a1)
{
}

uint64_t sub_1F9C4(uint64_t a1)
{
  uint64_t v2 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0,  3u,  0xB0u,  0xFAu,  0xBAu,  0xD9u,  0x11u,  0xD5u,  0xB1u,  0x3Au,  0,  3u,  0x93u,  1u,  0xA6u,  0xE6u);
  sub_1C270(a1, v2);
  *(void *)a1 = off_28FF0;
  *(void *)(a1 + 96) = 0LL;
  *(void *)(a1 + 104) = 0LL;
  *(_BYTE *)(a1 + 112) = 1;
  if ((byte_2C1C0 & 1) == 0) {
    sub_1FB38();
  }
  v6[0] = &off_290D0;
  v6[1] = a1;
  uint64_t v7 = v6;
  sub_D6B4(@"usbmidi2discovery", @"com.apple.coremidi", (uint64_t)sub_3098, (uint64_t)v6);
  CFUUIDRef v3 = v7;
  if (v7 == v6)
  {
    uint64_t v4 = 4LL;
    CFUUIDRef v3 = v6;
    goto LABEL_7;
  }

  if (v7)
  {
    uint64_t v4 = 5LL;
LABEL_7:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }

  return a1;
}

void sub_1FAEC(_Unwind_Exception *a1)
{
}

void sub_1FB38()
{
  if ((byte_2C1C0 & 1) == 0)
  {
    CFBundleRef BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.AppleMIDIUSBDriver");
    if (BundleWithIdentifier)
    {
      int v1 = BundleWithIdentifier;
      CFRetain(BundleWithIdentifier);
      off_2C080 = (__CFString *)CFBundleCopyLocalizedString(v1, off_2C080, off_2C080, @"USBMIDILocalizable");
      off_2C088 = (__CFString *)CFBundleCopyLocalizedString(v1, off_2C088, off_2C088, @"USBMIDILocalizable");
      off_2C090 = (__CFString *)CFBundleCopyLocalizedString(v1, off_2C090, off_2C090, @"USBMIDILocalizable");
      off_2C098 = (__CFString *)CFBundleCopyLocalizedString(v1, off_2C098, off_2C098, @"USBMIDILocalizable");
      off_2C0A8 = (__CFString *)CFBundleCopyLocalizedString(v1, off_2C0A8, off_2C0A8, @"USBMIDILocalizable");
      off_2C0A0 = (__CFString *)CFBundleCopyLocalizedString(v1, off_2C0A0, off_2C0A0, @"USBMIDILocalizable");
      CFRelease(v1);
      byte_2C1C0 = 1;
    }
  }

void *sub_1FC3C(void *a1)
{
  *a1 = off_28FF0;
  uint64_t v2 = (const void *)a1[11];
  if (v2) {
    CFRelease(v2);
  }
  return sub_4D24(a1);
}

void sub_1FC7C(void *a1)
{
  int v1 = sub_1FC3C(a1);
  operator delete(v1);
}

uint64_t sub_1FC90(uint64_t *a1, MIDIDeviceListRef a2)
{
  if (!a1[11])
  {
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    a1[11] = (uint64_t)Current;
    CFRetain(Current);
  }

  uint64_t v5 = operator new(0x68uLL);
  sub_15640((uint64_t)v5, (uint64_t)a1, a2, a1[11]);
  a1[12] = (uint64_t)v5;
  int v6 = operator new(0x48uLL);
  sub_20CD4(v6, v5);
  a1[13] = (uint64_t)v6;
  sub_1FDDC();
  uint64_t v7 = (os_log_s *)qword_2C1C8;
  if (os_log_type_enabled((os_log_t)qword_2C1C8, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = a1[12];
    uint64_t v9 = a1[13];
    int v11 = 136315906;
    uint64_t v12 = "USBMIDIClassDriver.cpp";
    __int16 v13 = 1024;
    int v14 = 113;
    __int16 v15 = 2048;
    uint64_t v16 = v8;
    __int16 v17 = 2048;
    uint64_t v18 = v9;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_INFO,  "%25s:%-5d [*] USBMIDIClassDriver::Start() mDeviceManager = 0x%p, mInterfaceManager = 0x%p",  (uint8_t *)&v11,  0x26u);
  }

  return 0LL;
}

void sub_1FDBC(_Unwind_Exception *a1)
{
}

void sub_1FDDC()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_2C1D0);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_2C1D0))
    {
      qword_2C1C8 = (uint64_t)os_log_create("com.apple.coremidi", "usbdrv");
      __cxa_guard_release(&qword_2C1D0);
    }
  }

uint64_t sub_1FE38(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_2C1C8;
  if (os_log_type_enabled((os_log_t)qword_2C1C8, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    uint64_t v7 = "USBMIDIClassDriver.cpp";
    __int16 v8 = 1024;
    int v9 = 122;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%25s:%-5d [*] USBMIDIClassDriver::Stop()", (uint8_t *)&v6, 0x12u);
  }

  uint64_t v3 = *(void *)(a1 + 104);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  *(void *)(a1 + 104) = 0LL;
  uint64_t v4 = *(void *)(a1 + 96);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8LL))(v4);
  }
  *(void *)(a1 + 96) = 0LL;
  return 0LL;
}

__CFString *sub_1FF24()
{
  return off_2C080;
}

__CFString *sub_1FF30()
{
  return off_2C088;
}

__CFString *sub_1FF3C()
{
  return off_2C090;
}

uint64_t sub_1FF48()
{
  return 0LL;
}

uint64_t sub_1FF50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = (os_log_s *)qword_2C1C8;
  if (os_log_type_enabled((os_log_t)qword_2C1C8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "USBMIDIClassDriver.cpp";
    __int16 v30 = 1024;
    int v31 = 221;
    __int16 v32 = 2048;
    *(void *)__int16 v33 = a2;
    *(_WORD *)&v33[8] = 2048;
    *(void *)&v33[10] = a3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%25s:%-5d [+] USBMIDIClassDriver::CreateDevice(%p, %p)", buf, 0x26u);
  }

  sub_1C420(a2, a3, (uint64_t)buf);
  if (!*(void *)buf)
  {
    uint64_t v17 = 0LL;
    goto LABEL_39;
  }

  sub_180DC(a2, a3);
  uint64_t v8 = v7;
  v25[0] = 0LL;
  v25[1] = 0LL;
  uint64_t v26 = 0LL;
  __p = 0LL;
  __int128 v24 = 0uLL;
  if (!*(_BYTE *)(a1 + 112) || v36 == v37)
  {
    sub_1A9F0(a2, BYTE2(v31), (uint64_t *)v34, (uint64_t *)v35, (uint64_t *)v28);
    *(_OWORD *)int v25 = *(_OWORD *)v28;
    uint64_t v26 = *(void *)&v28[16];
  }

  else
  {
    sub_19B20(a2, BYTE2(v31), (uint64_t)&v36, (uint64_t *)v28);
    int v9 = *(void **)v28;
    __p = *(void **)v28;
    __int128 v24 = *(_OWORD *)&v28[8];
    __int16 v10 = *(void **)&v28[8];
    if (*(void *)v28 != *(void *)&v28[8])
    {
      int v11 = 1;
      goto LABEL_10;
    }

    sub_1FDDC();
    __int128 v21 = (os_log_s *)qword_2C1C8;
    if (os_log_type_enabled((os_log_t)qword_2C1C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int v28 = 136315394;
      *(void *)&v28[4] = "USBMIDIClassDriver.cpp";
      *(_WORD *)&v28[12] = 1024;
      *(_DWORD *)&v28[14] = 236;
      _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_ERROR,  "%25s:%-5d      Unable to create USB MIDI 2.0 maplist. Falling back to USB MIDI 1.0.",  v28,  0x12u);
    }
  }

  int v11 = 0;
  int v9 = v25[0];
  __int16 v10 = v25[1];
LABEL_10:
  if (v9 == v10)
  {
    sub_1FDDC();
    uint64_t v18 = (os_log_s *)qword_2C1C8;
    if (os_log_type_enabled((os_log_t)qword_2C1C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int v28 = 136315394;
      *(void *)&v28[4] = "USBMIDIClassDriver.cpp";
      *(_WORD *)&v28[12] = 1024;
      *(_DWORD *)&v28[14] = 245;
      _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [-] USBMIDIClassDriver::CreateDevice() - Fatal error: mapList is empty, so entities cannot be constructed.",  v28,  0x12u);
    }
  }

  else
  {
    uint64_t v12 = sub_18110(a2, off_2C080);
    int v14 = v13;
    MIDIDeviceCreate((MIDIDriverRef)(a1 + 8), v13, v12, v13, &outDevice);
    if (v12 && off_2C080 && CFStringCompare(v12, off_2C080, 0LL)) {
      CFRelease(v12);
    }
    unsigned __int16 v22 = 0;
    (*(void (**)(uint64_t, unsigned __int16 *))(*(void *)v8 + 104LL))(v8, &v22);
    int v15 = v22;
    if (v11 && sub_1AF44(a2, outDevice, &__p, (uint64_t *)&v36, off_2C098, off_2C0A0, v14)
      || sub_1BAA0(a2, off_2C090, outDevice, (uint64_t *)v25, (uint64_t *)&v33[4], v34, v35, v14, v15 == 1452))
    {
      if (v14 && off_2C088 && CFStringCompare(v14, off_2C088, 0LL)) {
        CFRelease(v14);
      }
      sub_1FDDC();
      uint64_t v16 = (os_log_s *)qword_2C1C8;
      if (os_log_type_enabled((os_log_t)qword_2C1C8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int v28 = 136315650;
        *(void *)&v28[4] = "USBMIDIClassDriver.cpp";
        *(_WORD *)&v28[12] = 1024;
        *(_DWORD *)&v28[14] = 271;
        *(_WORD *)&v28[18] = 1024;
        *(_DWORD *)&v28[20] = outDevice;
        _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "%25s:%-5d [-] USBMIDIClassDriver::CreateDevice() returning 0x%x",  v28,  0x18u);
      }

      uint64_t v17 = outDevice;
      goto LABEL_35;
    }

    sub_1FDDC();
    int v19 = (os_log_s *)qword_2C1C8;
    if (os_log_type_enabled((os_log_t)qword_2C1C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int v28 = 136315394;
      *(void *)&v28[4] = "USBMIDIClassDriver.cpp";
      *(_WORD *)&v28[12] = 1024;
      *(_DWORD *)&v28[14] = 265;
      _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [-] USBMIDIClassDriver::CreateDevice() - Fatal error: unable to construct entities with the suppplied port map. The device will not be added to the setup.",  v28,  0x12u);
    }

    uint64_t v17 = 0LL;
    if (!v14 || !off_2C088) {
      goto LABEL_35;
    }
    if (CFStringCompare(v14, off_2C088, 0LL)) {
      CFRelease(v14);
    }
  }

  uint64_t v17 = 0LL;
LABEL_35:
  if (__p)
  {
    *(void *)&__int128 v24 = __p;
    operator delete(__p);
  }

  if (v25[0])
  {
    v25[1] = v25[0];
    operator delete(v25[0]);
  }

LABEL_39:
  if (v36)
  {
    unsigned int v37 = v36;
    operator delete(v36);
  }

  if (v35[0])
  {
    v35[1] = v35[0];
    operator delete(v35[0]);
  }

  if (v34[0])
  {
    v34[1] = v34[0];
    operator delete(v34[0]);
  }

  if (*(void *)&v33[4])
  {
    *(void *)&v33[12] = *(void *)&v33[4];
    operator delete(*(void **)&v33[4]);
  }

  return v17;
}

void sub_20478( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21)
{
  if (__p) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }
  sub_F52C(&a21);
  _Unwind_Resume(a1);
}

uint64_t sub_204D0(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 96);
}

void sub_204E0( int a1, uint64_t a2, MIDITimeStamp a3, char *a4, int64_t a5, uint64_t a6, MIDIProtocolID a7)
{
}

uint64_t sub_204FC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return sub_1D26C(a2, a3, a4, a5);
}

_BYTE *sub_20514(uint64_t a1, uint64_t a2, uint64_t *a3, _BYTE *a4, uint64_t a5, int a6)
{
  return sub_1D544(a2, a3, a4, a5, a6);
}

void sub_2052C(int a1, uint64_t a2, uint64_t a3, MIDIObjectRef a4)
{
  uint64_t v7 = sub_180DC(a2, a3);
  if (a4)
  {
    if (v7)
    {
      uint64_t v9 = v8;
      if (v8)
      {
        CFStringRef str = sub_18110(a2, off_2C080);
        CFStringRef theString1 = v10;
        if (sub_1DCDC(a1, a4))
        {
          sub_1FDDC();
          int v11 = (os_log_s *)qword_2C1C8;
          if (os_log_type_enabled((os_log_t)qword_2C1C8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "USBMIDIClassDriver.cpp";
            *(_WORD *)&_BYTE buf[12] = 1024;
            *(_DWORD *)&buf[14] = 342;
            _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "%25s:%-5d Manufacturer, model, or name is generic.",  buf,  0x12u);
          }

          *(void *)buf = 0LL;
          CFStringRef v47 = 0LL;
          CFStringRef v44 = 0LL;
          if (MIDIObjectGetStringProperty(a4, kMIDIPropertyManufacturer, (CFStringRef *)buf))
          {
            int v12 = 0;
          }

          else
          {
            if (CFEqual(*(CFTypeRef *)buf, off_2C080) && str)
            {
              MIDIObjectSetStringProperty(a4, kMIDIPropertyManufacturer, str);
              int v12 = 1;
            }

            else
            {
              int v12 = 0;
            }

            CFRelease(*(CFTypeRef *)buf);
            *(void *)buf = 0LL;
          }

          if (!MIDIObjectGetStringProperty(a4, kMIDIPropertyModel, &v47))
          {
            if (CFEqual(v47, off_2C088) && theString1)
            {
              MIDIObjectSetStringProperty(a4, kMIDIPropertyModel, theString1);
              MIDIObjectSetStringProperty(a4, kMIDIPropertyName, theString1);
              int v12 = 1;
            }

            CFRelease(v47);
            CFStringRef v47 = 0LL;
          }

          if (!MIDIObjectGetStringProperty(a4, kMIDIPropertyName, &v44))
          {
            if (CFEqual(v44, off_2C088) && theString1)
            {
              MIDIObjectSetStringProperty(a4, kMIDIPropertyModel, theString1);
              MIDIObjectSetStringProperty(a4, kMIDIPropertyName, theString1);
              int v12 = 1;
            }

            CFRelease(v44);
            CFStringRef v44 = 0LL;
          }

          CFStringRef v13 = str;
          if (str && off_2C080 && CFStringCompare(str, off_2C080, 0LL)) {
            CFRelease(v13);
          }
          CFStringRef str = 0LL;
          CFStringRef v14 = theString1;
          if (theString1 && off_2C088 && CFStringCompare(theString1, off_2C088, 0LL)) {
            CFRelease(v14);
          }
          CFStringRef theString1 = 0LL;
          if (v12) {
            goto LABEL_86;
          }
        }

        if (sub_1DDE0(a1, a4))
        {
LABEL_86:
          if (sub_1DDE0(a1, a4))
          {
            sub_1FDDC();
            int v15 = (os_log_s *)qword_2C1C8;
            if (os_log_type_enabled((os_log_t)qword_2C1C8, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&uint8_t buf[4] = "USBMIDIClassDriver.cpp";
              *(_WORD *)&_BYTE buf[12] = 1024;
              *(_DWORD *)&buf[14] = 400;
              _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "%25s:%-5d Entity name is generic.", buf, 0x12u);
            }
          }

          CFStringRef v47 = 0LL;
          CFStringRef v48 = 0LL;
          uint64_t v49 = 0LL;
          CFStringRef v44 = 0LL;
          CFStringRef v45 = 0LL;
          uint64_t v46 = 0LL;
          uint64_t v41 = 0LL;
          unsigned int v42 = 0LL;
          uint64_t v43 = 0LL;
          __p = 0LL;
          unint64_t v39 = 0LL;
          uint64_t v40 = 0LL;
          sub_18350(v9, (uint64_t)buf);
          sub_7DDC(a3);
          sub_184CC(v9, *(unsigned __int8 **)buf, &v47, (char **)&v44, (char **)&v41, (unsigned __int8 **)&__p);
          unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * (((char *)v45 - (char *)v44) >> 1);
          int v17 = -1431655765 * ((v42 - (_BYTE *)v41) >> 1);
          else {
            uint64_t v18 = v16;
          }
          if ((_DWORD)v18 == MIDIDeviceGetNumberOfEntities(a4)
            && !MIDIObjectGetStringProperty(a4, kMIDIPropertyModel, &theString1))
          {
            if ((int)v18 >= 1)
            {
              int64_t v19 = 0LL;
              int64_t v20 = (int)v16;
              int64_t v33 = v17;
              uint64_t v21 = 4LL;
              while (1)
              {
                unint64_t v36 = &off_28F30;
                CFTypeRef cf = 0LL;
                MIDIEntityRef Entity = MIDIDeviceGetEntity(a4, v19);
                if (!Entity)
                {
                  sub_1F048(&v36);
                  goto LABEL_74;
                }

                CFStringRef v23 = v19 >= v20 ? 0LL : sub_1AE5C(a2, *((unsigned __int8 *)&v44->isa + v21), theString1);
                if (v19 >= v33) {
                  break;
                }
                CFStringRef v24 = sub_1AE5C(a2, *((unsigned __int8 *)v41 + v21), theString1);
                int v25 = v24;
                if (!v23 || !v24 || !CFEqual(v23, v24)) {
                  goto LABEL_56;
                }
                CFRetain(v23);
                CFTypeRef v26 = cf;
                CFTypeRef cf = v23;
                if (v26) {
                  CFRelease(v26);
                }
                CFRelease(v23);
                CFRelease(v25);
                CFStringRef v23 = 0LL;
                int v25 = 0LL;
LABEL_62:
                MIDIObjectSetStringProperty(Entity, kMIDIPropertyName, (CFStringRef)cf);
                if (v23)
                {
                  MIDIObjectRef Source = MIDIEntityGetSource(Entity, 0LL);
                  MIDIObjectSetStringProperty(Source, kMIDIPropertyName, v23);
                }

                if (v25)
                {
                  MIDIObjectRef Destination = MIDIEntityGetDestination(Entity, 0LL);
                  MIDIObjectSetStringProperty(Destination, kMIDIPropertyName, v25);
                }

                if (v23) {
                  CFRelease(v23);
                }
                if (v25) {
                  CFRelease(v25);
                }
                sub_1F048(&v36);
                ++v19;
                v21 += 6LL;
                if (v18 == v19) {
                  goto LABEL_71;
                }
              }

              int v25 = 0LL;
LABEL_56:
              if ((_DWORD)v18 == 1)
              {
                CFStringRef v27 = theString1;
                if (theString1) {
                  CFRetain(theString1);
                }
                CFTypeRef v28 = cf;
                CFTypeRef cf = v27;
                if (v28) {
                  CFRelease(v28);
                }
              }

              else
              {
                CFStringRef v29 = CFStringCreateWithFormat(0LL, 0LL, off_2C090, v19 + 1);
                CFTypeRef v30 = cf;
                CFTypeRef cf = v29;
                v35[0] = &off_28F30;
                v35[1] = v30;
                sub_1F048(v35);
              }

              goto LABEL_62;
            }

LABEL_71:
            if (theString1) {
              CFRelease(theString1);
            }
          }

LABEL_74:
          if (v53 < 0) {
            operator delete(*(void **)&buf[8]);
          }
          if (__p)
          {
            unint64_t v39 = __p;
            operator delete(__p);
          }

          if (v41)
          {
            unsigned int v42 = v41;
            operator delete(v41);
          }

          if (v44)
          {
            CFStringRef v45 = v44;
            operator delete((void *)v44);
          }

          if (v47)
          {
            CFStringRef v48 = v47;
            operator delete((void *)v47);
          }
        }
      }
    }
  }

void sub_20B6C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, void *a20, uint64_t a21, uint64_t a22, void *a23, uint64_t a24, uint64_t a25, void *a26, uint64_t a27)
{
  if (a2) {
    sub_3584(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void *sub_20C18(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &off_290D0;
  result[1] = v3;
  return result;
}

uint64_t sub_20C4C(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &off_290D0;
  a2[1] = v2;
  return result;
}

uint64_t sub_20C68(uint64_t result, _BYTE *a2)
{
  if (*a2) {
    *(_BYTE *)(*(void *)(result + 8) + 112LL) = 1;
  }
  return result;
}

void *sub_20C80(void *a1, uint64_t a2)
{
  uint64_t v4 = (void *)sub_82B4(a1, *(void *)(a2 + 8));
  *uint64_t v4 = &off_29118;
  v4[8] = a2;
  sub_4820((uint64_t)v4);
  return a1;
}

void sub_20CC0(_Unwind_Exception *a1)
{
}

BOOL sub_20CDC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 56LL))(a1))
  {
    sub_20EA8();
    uint64_t v3 = (os_log_s *)qword_2C1D8;
    BOOL result = os_log_type_enabled((os_log_t)qword_2C1D8, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136315650;
    int v12 = "USBMIDIInterfaceManager.cpp";
    __int16 v13 = 1024;
    int v14 = 34;
    __int16 v15 = 2048;
    uint64_t v16 = a2;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_INFO,  "%25s:%-5d [*] USBMIDIInterfaceManager::MatchInterface(%p) - already using interface; failing match",
      buf,
      0x1Cu);
    return 0LL;
  }

  uint64_t v5 = sub_7A20(a2);
  else {
    BOOL v6 = v10 == 1;
  }
  sub_20EA8();
  uint64_t v7 = (os_log_s *)qword_2C1D8;
  if (os_log_type_enabled((os_log_t)qword_2C1D8, OS_LOG_TYPE_INFO))
  {
    int v12 = "USBMIDIInterfaceManager.cpp";
    *(_DWORD *)buf = 136315906;
    __int16 v13 = 1024;
    if (v9 == 3) {
      uint64_t v8 = "true";
    }
    else {
      uint64_t v8 = "false";
    }
    int v14 = 45;
    __int16 v15 = 2048;
    uint64_t v16 = a2;
    __int16 v17 = 2080;
    uint64_t v18 = v8;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_INFO,  "%25s:%-5d [*] USBMIDIInterfaceManager::MatchInterface(%p) - returning %s",  buf,  0x26u);
  }

  return v9 == 3;
}

void sub_20EA8()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_2C1E0);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_2C1E0))
    {
      qword_2C1D8 = (uint64_t)os_log_create("com.apple.coremidi", "usbinf");
      __cxa_guard_release(&qword_2C1E0);
    }
  }

uint64_t sub_20F04(uint64_t a1, uint64_t *a2)
{
  return sub_1591C(*(void *)(a1 + 64), *a2, (uint64_t)a2);
}

BOOL sub_20F14(uint64_t a1, int a2)
{
  return sub_17524(*(void *)(a1 + 64), a2);
}

BOOL sub_20F1C(uint64_t a1, uint64_t *a2)
{
  return a2 && sub_174E4(*(void *)(a1 + 64), *a2);
}

uint64_t sub_20F34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (os_log_s *)qword_2C1D8;
  if (os_log_type_enabled((os_log_t)qword_2C1D8, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    uint64_t v7 = "USBMIDIInterfaceManager.cpp";
    __int16 v8 = 1024;
    int v9 = 70;
    __int16 v10 = 1024;
    int v11 = a2;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_INFO,  "%25s:%-5d [*] USBMIDIInterfaceMangaer::RequestTerminateService(%u) -- The interface will now be closed to allow ot her drivers to match in response to an interface seize attempt.",  (uint8_t *)&v6,  0x18u);
  }

  return (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 64) + 24LL))(*(void *)(a1 + 64), a2);
}

void sub_21018(uint64_t a1)
{
  uint64_t v1 = (void *)sub_4600(a1);
  operator delete(v1);
}

void sub_2102C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21060( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21094( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_210C8(uint64_t a1, int a2)
{
  v2[0] = 67109378;
  v2[1] = a2;
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " CAMutex::Try: call to pthread_mutex_trylock failed, Error: %d (%s)",  (uint8_t *)v2,  0x12u);
}

void sub_21160()
{
  __assert_rtn("DoWrite", "USBMIDIDevice.cpp", 720, "currentBufferIndex >= 0");
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}