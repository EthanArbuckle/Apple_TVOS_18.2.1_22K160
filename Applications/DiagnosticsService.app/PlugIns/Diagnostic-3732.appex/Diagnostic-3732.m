id stringOrNull(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  v1 = a1;
  v2 = v1;
  if (v1) {
    v3 = v1;
  }
  else {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v4 = v3;

  return v4;
}

void sub_100003560( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, char a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,char a51)
{
}

uint64_t sub_1000035B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000035C0(uint64_t a1)
{
}

id sub_1000035C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) isCancelled];
  if ((v4 & 1) == 0)
  {
    id v5 = [[DSUsageLogLine alloc] initWithLogLine:v3];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
    if (*(void *)(v6 + 40))
    {
      int v7 = [v5 usageTime];
      if (v7 <= (int)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) usageTime])
      {
LABEL_10:
        uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8LL);
        if (*(void *)(v8 + 40))
        {
          int v9 = [v5 standbyTime];
          uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8LL);
        }

        objc_storeStrong((id *)(v8 + 40), v5);
LABEL_14:
        v10 = (void *)objc_claimAutoreleasedReturnValue([v5 date]);
        [v10 timeIntervalSinceNow];
        double v12 = v11;

        if (v12 >= 300.0)
        {
          if ([v5 isReset])
          {
            uint64_t v13 = *(void *)(a1 + 64);
LABEL_19:
            objc_storeStrong((id *)(*(void *)(v13 + 8) + 40LL), v5);
            goto LABEL_20;
          }

          if ([v5 isOnPower])
          {
            uint64_t v13 = *(void *)(a1 + 72);
            goto LABEL_19;
          }
        }

LABEL_20:
        goto LABEL_21;
      }

      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
    }

    objc_storeStrong((id *)(v6 + 40), v5);
    goto LABEL_10;
  }

LABEL_21:
  return v4;
}

id objc_msgSend_usageTime(void *a1, const char *a2, ...)
{
  return [a1 usageTime];
}