void sub_100001F24(id a1)
{
  SpatialAudioDataFuzzer *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___SpatialAudioDataFuzzer);
  v2 = (void *)qword_100008B28;
  qword_100008B28 = (uint64_t)v1;
}

void sub_100002010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SpatialAudioDataFuzzerCPP::createNoisySoundProfile( SpatialAudioDataFuzzerCPP *this, const __CFData *a2)
{
  return IR::IRData::createNoisySoundProfilePack(a2, a2);
}

id sub_10000225C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _xpcConnectionInvalidated:*(void *)(a1 + 40)];
}

void sub_1000027E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t sub_10000281C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000282C(uint64_t a1)
{
}

uint64_t sub_100002834(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 40LL);
  if (v1)
  {
    uint64_t v2 = result;
    if (dword_1000089F8 > 90) {
      goto LABEL_6;
    }
    if (dword_1000089F8 == -1)
    {
      if (!_LogCategory_Initialize(&dword_1000089F8, 90LL))
      {
LABEL_6:
        result = *(void *)(v2 + 32);
        if (result) {
          return (*(uint64_t (**)(uint64_t, void, void))(result + 16))( result,  0LL,  *(void *)(*(void *)(*(void *)(v2 + 40) + 8LL) + 40LL));
        }
        return result;
      }

      uint64_t v1 = *(void *)(*(void *)(*(void *)(v2 + 40) + 8LL) + 40LL);
    }

    LogPrintF( &dword_1000089F8,  "-[SpatialAudioClientXPCConnection fetchSpatialSoundProfileRecordForClient:WithCompletion:]_block_invoke",  90LL,  "### Fetching spatial sound profile failed: %{error}",  v1);
    goto LABEL_6;
  }

  return result;
}

void sub_1000028F8(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (v5)
  {
    if (dword_1000089F8 <= 90
      && (dword_1000089F8 != -1 || _LogCategory_Initialize(&dword_1000089F8, 90LL)))
    {
      LogPrintF( &dword_1000089F8,  "-[SpatialAudioClientXPCConnection fetchSpatialSoundProfileRecordForClient:WithCompletion:]_block_invoke_2",  90LL,  "### Fetching spatial sound profile failed: %@",  v5);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    if (v12)
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___SpatialSoundProfileRecord);
      if (dword_1000089F8 <= 30
        && (dword_1000089F8 != -1 || _LogCategory_Initialize(&dword_1000089F8, 30LL)))
      {
        LogPrintF( &dword_1000089F8,  "-[SpatialAudioClientXPCConnection fetchSpatialSoundProfileRecordForClient:WithCompletion:]_block_invoke_2",  30LL,  "applying fuzzing to sound profile");
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[SpatialAudioDataFuzzer sharedInstance](&OBJC_CLASS___SpatialAudioDataFuzzer, "sharedInstance"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v12 soundProfileData]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v9 createNoiseSoundProfileFromData:v10]);

      [v6 setSoundProfileData:v11];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }

    else
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = NSErrorF(NSOSStatusErrorDomain, 4294960596LL, "No sound profile record found");
      id v6 = (id)objc_claimAutoreleasedReturnValue(v8);
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0LL, v6);
    }
  }
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_autoreleasePoolPush();
  v4 = objc_alloc_init(&OBJC_CLASS___SpatialAudioXPCService);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v5 setDelegate:v4];
  [v5 resume];

  objc_autoreleasePoolPop(v3);
  return 0;
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

id objc_msgSend_xpcConnectionInvalidated(void *a1, const char *a2, ...)
{
  return [a1 xpcConnectionInvalidated];
}