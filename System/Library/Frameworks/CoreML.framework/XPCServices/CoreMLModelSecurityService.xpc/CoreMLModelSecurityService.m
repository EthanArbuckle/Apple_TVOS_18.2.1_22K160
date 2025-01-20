void sub_100001364(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000013B0(id a1, NSError *a2)
{
  v2 = a2;
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100007128((uint64_t)v2, v3);
  }
}

void sub_100001408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_100001478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ModelKeyServerAPIFetchKeyResultReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0LL;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0LL;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 0u:
        unsigned int v12 = 0;
        do
        {
          unint64_t v13 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v13 == -1LL || v13 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            goto LABEL_38;
          }

          unint64_t v14 = v13 + 1;
          int v15 = *(char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v13);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v14;
          if ((v15 & 0x80000000) == 0) {
            break;
          }
        }

        while (v12++ <= 8);
        goto LABEL_38;
      case 1u:
        uint64_t String = PBReaderReadString(a2);
        uint64_t v19 = objc_claimAutoreleasedReturnValue(String);
        uint64_t v20 = 16LL;
        goto LABEL_30;
      case 2u:
        uint64_t v21 = PBReaderReadString(a2);
        uint64_t v19 = objc_claimAutoreleasedReturnValue(v21);
        uint64_t v20 = 24LL;
        goto LABEL_30;
      case 3u:
        uint64_t v22 = PBReaderReadString(a2);
        uint64_t v19 = objc_claimAutoreleasedReturnValue(v22);
        uint64_t v20 = 48LL;
LABEL_30:
        v23 = *(void **)(a1 + v20);
        *(void *)(a1 + v20) = v19;

        goto LABEL_38;
      case 4u:
        [(id)a1 clearOneofValuesForKey];
        *(_BYTE *)(a1 + 56) |= 1u;
        *(_DWORD *)(a1 + 8) = 1;
        v24 = objc_alloc_init(&OBJC_CLASS___ModelKeyServerAPISignedKey);
        objc_storeStrong((id *)(a1 + 40), v24);
        if (!PBReaderPlaceMark(a2, v25)
          || (ModelKeyServerAPISignedKeyReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
          goto LABEL_40;
        }

        goto LABEL_36;
      case 5u:
        [(id)a1 clearOneofValuesForKey];
        *(_BYTE *)(a1 + 56) |= 1u;
        *(_DWORD *)(a1 + 8) = 2;
        v24 = objc_alloc_init(&OBJC_CLASS___ModelKeyServerAPIRawKey);
        objc_storeStrong((id *)(a1 + 32), v24);
        if (PBReaderPlaceMark(a2, v25) && ModelKeyServerAPIRawKeyReadFrom((uint64_t)v24, a2))
        {
LABEL_36:
          PBReaderRecallMark(a2, v25);

LABEL_38:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }

LABEL_40:
        return 0LL;
      default:
        uint64_t result = PBReaderSkipValueWithTag(a2);
        if (!(_DWORD)result) {
          return result;
        }
        goto LABEL_38;
    }
  }
}

uint64_t ModelKeyServerAPIFetchKeyResponseReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0LL;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0LL;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    unint64_t v12 = v6 >> 3;
    if ((v6 >> 3) == 2)
    {
      [(id)a1 clearOneofValuesForResult];
      *(_BYTE *)(a1 + 32) |= 1u;
      *(_DWORD *)(a1 + 16) = 2;
      v18 = objc_alloc_init(&OBJC_CLASS___ModelKeyServerAPIResultError);
      objc_storeStrong((id *)(a1 + 8), v18);
      if (!PBReaderPlaceMark(a2, v20)
        || (ModelKeyServerAPIResultErrorReadFrom((uint64_t)v18, a2) & 1) == 0)
      {
LABEL_38:

        return 0LL;
      }
    }

    else
    {
      if ((_DWORD)v12 != 1)
      {
        if ((_DWORD)v12)
        {
          uint64_t result = PBReaderSkipValueWithTag(a2);
          if (!(_DWORD)result) {
            return result;
          }
        }

        else
        {
          unsigned int v13 = 0;
          while (1)
          {
            unint64_t v14 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
            if (v14 == -1LL || v14 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
              break;
            }
            unint64_t v15 = v14 + 1;
            int v16 = *(char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v14);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15;
            if (v16 < 0 && v13++ <= 8) {
              continue;
            }
            goto LABEL_36;
          }

          *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
        }

        continue;
      }

      [(id)a1 clearOneofValuesForResult];
      *(_BYTE *)(a1 + 32) |= 1u;
      *(_DWORD *)(a1 + 16) = 1;
      v18 = objc_alloc_init(&OBJC_CLASS___ModelKeyServerAPIFetchKeyResult);
      objc_storeStrong((id *)(a1 + 24), v18);
      if (!PBReaderPlaceMark(a2, v20)
        || (ModelKeyServerAPIFetchKeyResultReadFrom((uint64_t)v18, a2) & 1) == 0)
      {
        goto LABEL_38;
      }
    }

    PBReaderRecallMark(a2, v20);

LABEL_36:
    ;
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t ModelKeyServerAPIFetchKeyRequestReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0LL;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0LL;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t String = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(String);
        uint64_t v14 = 8LL;
        goto LABEL_23;
      case 2u:
        uint64_t v16 = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v16);
        uint64_t v14 = 24LL;
        goto LABEL_23;
      case 3u:
        uint64_t Data = PBReaderReadData(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(Data);
        uint64_t v14 = 16LL;
LABEL_23:
        v18 = *(void **)(a1 + v14);
        *(void *)(a1 + v14) = v13;

        continue;
      case 4u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0LL;
        *(_BYTE *)(a1 + 36) |= 1u;
        break;
      default:
        uint64_t result = PBReaderSkipValueWithTag(a2);
        if (!(_DWORD)result) {
          return result;
        }
        continue;
    }

    while (1)
    {
      unint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v22 == -1LL || v22 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v23 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
      v21 |= (unint64_t)(v23 & 0x7F) << v19;
      if ((v23 & 0x80) == 0) {
        goto LABEL_32;
      }
      v19 += 7;
      BOOL v9 = v20++ >= 9;
      if (v9)
      {
        uint64_t v21 = 0LL;
        goto LABEL_34;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v21 = 0LL;
    }
LABEL_34:
    *(_BYTE *)(a1 + 32) = v21 != 0;
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

LABEL_11:
  return v9;
}

BOOL ModelKeyServerAPIRawKeyReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0LL;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0LL;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }

      *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0LL;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v6 >> 3) == 1)
      {
        uint64_t Data = PBReaderReadData(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(Data);
        uint64_t v14 = 16LL;
LABEL_21:
        uint64_t v16 = *(void **)(a1 + v14);
        *(void *)(a1 + v14) = v13;

        goto LABEL_23;
      }

      if ((PBReaderSkipValueWithTag(a2) & 1) == 0) {
        return 0LL;
      }
LABEL_23:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }

    uint64_t v15 = PBReaderReadData(a2);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v15);
    uint64_t v14 = 8LL;
    goto LABEL_21;
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t ModelKeyServerAPISignedKeyReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0LL;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0LL;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      uint64_t Data = PBReaderReadData(a2);
      uint64_t v13 = objc_claimAutoreleasedReturnValue(Data);
      uint64_t v14 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v13;
    }

    else
    {
      uint64_t result = PBReaderSkipValueWithTag(a2);
      if (!(_DWORD)result) {
        return result;
      }
    }
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100004344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004624( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, id a28)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_1000046C4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000046D4(uint64_t a1)
{
}

void sub_1000046DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "CoreMLModelSecurity function fetchKey completed",  buf,  2u);
  }

  if (v6)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[MLModelErrorUtils modelDecryptionKeyFetchErrorWithUnderlyingError:format:]( &OBJC_CLASS___MLModelErrorUtils,  "modelDecryptionKeyFetchErrorWithUnderlyingError:format:",  v6,  @"Fetching decryption key from server failed."));
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
    int v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [v6 code];
      id v13 = objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
      id v14 = [v13 UTF8String];
      *(_DWORD *)buf = 134218242;
      id v50 = v12;
      __int16 v51 = 2080;
      id v52 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Fetching decryption key from server failed. Operation failed with error code %ld (%s)",  buf,  0x16u);
    }
  }

  else if ([v5 hasError])
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
    id v16 = objc_claimAutoreleasedReturnValue([v15 message]);
    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[MLModelErrorUtils modelDecryptionKeyFetchErrorWithUnderlyingError:format:]( MLModelErrorUtils,  "modelDecryptionKeyFetchErrorWithUnderlyingError:format:",  0,  @"Fetching decryption key from server failed: %s. Make sure the encryption key was generated with correct team ID.",  [v16 UTF8String]));
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8LL);
    char v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
      id v21 = objc_claimAutoreleasedReturnValue([v20 message]);
      id v22 = [v21 UTF8String];
      *(_DWORD *)buf = 136315138;
      id v50 = v22;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Fetching decryption key from server failed. Key server responded back with error: %s",  buf,  0xCu);
    }
  }

  else if ([v5 hasSuccess])
  {
    char v23 = (void *)objc_claimAutoreleasedReturnValue([v5 success]);
    unsigned __int8 v24 = [v23 hasSignedKey];

    if ((v24 & 1) != 0)
    {
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 success]);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s signedKey](v11, "signedKey"));
      uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 data]);
      uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8LL);
      v28 = *(void **)(v27 + 40);
      *(void *)(v27 + 40) = v26;
    }

    else
    {
      uint64_t v39 = objc_claimAutoreleasedReturnValue( +[MLModelErrorUtils modelDecryptionKeyFetchErrorWithUnderlyingError:format:]( &OBJC_CLASS___MLModelErrorUtils,  "modelDecryptionKeyFetchErrorWithUnderlyingError:format:",  0LL,  @"Fetching decryption key from server failed."));
      uint64_t v40 = *(void *)(*(void *)(a1 + 40) + 8LL);
      v41 = *(void **)(v40 + 40);
      *(void *)(v40 + 40) = v39;

      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000071E0(v11, v42, v43, v44, v45, v46, v47, v48);
      }
    }
  }

  else
  {
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_100007210(v29, v30, v31, v32, v33, v34, v35, v36);
    }

    uint64_t v37 = objc_claimAutoreleasedReturnValue( +[MLModelErrorUtils modelDecryptionKeyFetchErrorWithUnderlyingError:format:]( &OBJC_CLASS___MLModelErrorUtils,  "modelDecryptionKeyFetchErrorWithUnderlyingError:format:",  0LL,  @"Fetching decryption key from server failed: response with neither hasError nor hasSuccess."));
    uint64_t v38 = *(void *)(*(void *)(a1 + 40) + 8LL);
    v11 = *(os_log_s **)(v38 + 40);
    *(void *)(v38 + 40) = v37;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100004A7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004B90( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t ModelKeyServerAPIResultErrorReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0LL;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0LL;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      uint64_t String = PBReaderReadString(a2);
      uint64_t v13 = objc_claimAutoreleasedReturnValue(String);
      id v14 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v13;
    }

    else
    {
      uint64_t result = PBReaderSkipValueWithTag(a2);
      if (!(_DWORD)result) {
        return result;
      }
    }
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10000505C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000516C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000051A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000051B4(uint64_t a1)
{
}

void sub_1000051BC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    unint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100007240((uint64_t)v6, v7);
    }
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

void sub_100005244(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000053CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_100005440(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    unint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000072B4(a1, (uint64_t)v6, v7);
    }
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

void sub_1000054CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005860( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_100005A50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005DB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_100005F3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005FE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006038( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  int v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)&OBJC_CLASS___CoreMLModelSecurity;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_100006068(void *a1)
{
}

void sub_1000060E4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100006174( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000644C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_1000064C4()
{
}

id sub_1000064CC(int a1, void *a2)
{
  if (a1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[CoreMLModelSecurity codeSigningIdentifierFromXPCConnection]( &OBJC_CLASS___CoreMLModelSecurity,  "codeSigningIdentifierFromXPCConnection"));
    if (!v3)
    {
      *a2 = (id)objc_claimAutoreleasedReturnValue( +[MLModelErrorUtils modelDecryptionKeyFetchErrorWithUnderlyingError:format:]( &OBJC_CLASS___MLModelErrorUtils,  "modelDecryptionKeyFetchErrorWithUnderlyingError:format:",  0LL,  @"Failed to extract signingIdentifier for the first party app. Make sure the app is signed."));
      char v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_100007518(v4, v5, v6, v7, v8, v9, v10, v11);
      }
LABEL_8:

      v3 = 0LL;
    }
  }

  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[CoreMLModelSecurity teamIdentifierFromXPCConnection]( &OBJC_CLASS___CoreMLModelSecurity,  "teamIdentifierFromXPCConnection"));
    if (!v3)
    {
      *a2 = (id)objc_claimAutoreleasedReturnValue( +[MLModelErrorUtils modelDecryptionKeyFetchErrorWithUnderlyingError:format:]( &OBJC_CLASS___MLModelErrorUtils,  "modelDecryptionKeyFetchErrorWithUnderlyingError:format:",  0LL,  @"Failed to extract team identifier for the app. Make sure the app is signed."));
      char v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MLLogging coreChannel](&OBJC_CLASS___MLLogging, "coreChannel"));
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_10000754C(v4, v12, v13, v14, v15, v16, v17, v18);
      }
      goto LABEL_8;
    }
  }

  return v3;
}

void sub_1000066D4(_Unwind_Exception *a1)
{
  uint64_t v7 = v6;

  _Unwind_Resume(a1);
}

void sub_1000067C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000683C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100006A1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006C1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006DFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006FCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000070A4(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, os_log_s *a4@<X8>)
{
}

uint64_t sub_1000070B4(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  return result;
}

void sub_1000070CC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

  ;
}

void sub_100007110(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_100007128(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412546;
  v3 = @"client callback";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Could not create connection to %@ : error=%@",  (uint8_t *)&v2,  0x16u);
}

void sub_1000071B0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000071E0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100007210( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100007240(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Could not obtain feature names via XPC: error=%@",  (uint8_t *)&v2,  0xCu);
}

void sub_1000072B4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Could not obtain feature value %@ via XPC: error=%@",  (uint8_t *)&v4,  0x16u);
}

void sub_10000733C(uint64_t a1, int *a2, uint64_t a3, os_log_s *a4)
{
  int v4 = *a2;
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = v4;
  sub_1000070A4((void *)&_mh_execute_header, "Sandbox extension(%@) release failed (%d)", (uint8_t *)a3, a4);
}

void sub_100007388(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Sandbox extension(%@) consumed",  (uint8_t *)&v2,  0xCu);
  sub_100007120();
}

void sub_1000073F8()
{
}

void sub_100007458()
{
}

void sub_1000074B8()
{
}

void sub_100007518( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000754C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100007580()
{
  sub_100007108();
}

void sub_1000075BC()
{
  sub_100007108();
}

void sub_1000075F8()
{
  sub_100007108();
}

void sub_100007634(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_100007110((void *)&_mh_execute_header, a2, a3, "%@: nil currentConnection", (uint8_t *)a2);

  sub_100007108();
}

id objc_msgSend_uniqueKeyForProvider(void *a1, const char *a2, ...)
{
  return [a1 uniqueKeyForProvider];
}