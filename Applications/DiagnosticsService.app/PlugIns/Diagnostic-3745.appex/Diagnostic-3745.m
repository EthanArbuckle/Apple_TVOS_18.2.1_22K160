LABEL_9:
  return v14;
}

    v16 = *(void *)(*(void *)(a1 + 64) + 8LL);
    v17 = *(void **)(v16 + 40);
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 date]);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[DABackupRestoreEvent date](v9, "date"));
      [v18 timeIntervalSinceDate:v19];
      v21 = v20;

      if (v21 >= 0.0)
      {
LABEL_13:

        goto LABEL_14;
      }

      v16 = *(void *)(*(void *)(a1 + 64) + 8LL);
    }

    objc_storeStrong((id *)(v16 + 40), v9);
    goto LABEL_13;
  }

id stringOrNull(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1) {
    id v3 = v1;
  }
  else {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v4 = v3;

  return v4;
}

id numberOrNull(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1) {
    id v3 = v1;
  }
  else {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v4 = v3;

  return v4;
}

id dictionaryOrNull(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1) {
    id v3 = v1;
  }
  else {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v4 = v3;

  return v4;
}

void sub_1000031FC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20, uint64_t a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

uint64_t sub_100003240(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100003250(uint64_t a1)
{
}

id sub_100003258(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) isCancelled];
  if ((v4 & 1) == 0)
  {
    v5 = -[DABackupRestoreLogLine initWithLogLine:]( objc_alloc(&OBJC_CLASS___DABackupRestoreLogLine),  "initWithLogLine:",  v3);
    if ((id)-[DABackupRestoreLogLine backupRestoreEventType](v5, "backupRestoreEventType") != (id)1001)
    {
LABEL_14:

      goto LABEL_15;
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    v6 = objc_alloc(&OBJC_CLASS___DABackupRestoreEvent);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DABackupRestoreLogLine date](v5, "date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DABackupRestoreLogLine eventSubType](v5, "eventSubType"));
    v9 = -[DABackupRestoreEvent initWithDate:eventSubType:successfulBackup:eventCode:]( v6,  "initWithDate:eventSubType:successfulBackup:eventCode:",  v7,  v8,  -[DABackupRestoreLogLine didSucceed](v5, "didSucceed"),  -[DABackupRestoreLogLine backupCode](v5, "backupCode"));

    if (-[DABackupRestoreEvent successfulBackup](v9, "successfulBackup"))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
      v11 = *(void **)(v10 + 40);
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 date]);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[DABackupRestoreEvent date](v9, "date"));
        [v12 timeIntervalSinceDate:v13];
        double v15 = v14;

        if (v15 >= 0.0) {
          goto LABEL_9;
        }
        uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
      }

      objc_storeStrong((id *)(v10 + 40), v9);
    }

    else
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    }

LABEL_15:
  return v4;
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}