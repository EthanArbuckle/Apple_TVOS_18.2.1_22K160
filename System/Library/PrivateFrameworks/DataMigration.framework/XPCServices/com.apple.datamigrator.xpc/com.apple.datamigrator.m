id sub_10000397C(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) += (unint64_t)[*(id *)(a1 + 32) secondsBeforeNextStackshot]
                                            / 0x3C;
  [*(id *)(a1 + 32) _takeStackshot];
  objc_msgSend( *(id *)(a1 + 32),  "setSecondsBeforeNextStackshot:",  (char *)objc_msgSend(*(id *)(a1 + 32), "nextSecondsBeforeNextStackshotAdditionForUnitTesting")
  + (void)[*(id *)(a1 + 32) secondsBeforeNextStackshot]);
  objc_msgSend( *(id *)(a1 + 32),  "setSecondsBeforeNextStackshot:",  4 * (void)objc_msgSend(*(id *)(a1 + 32), "secondsBeforeNextStackshot"));
  return [*(id *)(a1 + 32) secondsBeforeNextStackshot];
}

void sub_1000046C4(_Unwind_Exception *a1)
{
}

void sub_100004968( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

LABEL_7:
}

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6));
  _DMLogFunc(v5, 6LL);

  v14 = 1;
LABEL_8:

  return v14;
}

void sub_100004E6C(id a1, NSError *a2)
{
}

void sub_100004F58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1000050A4(uint64_t a1)
{
  return _DMLogFunc(v1, 7LL);
}

Class sub_100005208(uint64_t a1)
{
  v3 = 0LL;
  if (!qword_10002CB78)
  {
    __int128 v4 = off_100020768;
    uint64_t v5 = 0LL;
    qword_10002CB78 = _sl_dlopen(&v4, &v3);
  }

  if (!qword_10002CB78) {
    sub_100012C04(&v3);
  }
  if (v3) {
    free(v3);
  }
  Class result = objc_getClass("OSASubmissionClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    sub_100012C80();
  }
  qword_10002CB70 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_1000055E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1000055F4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    __int128 v4 = WeakRetained;
    unsigned __int8 v3 = [WeakRetained canceled];
    uint64_t v2 = v4;
    if ((v3 & 1) == 0)
    {
      [v4 _timerFired];
      uint64_t v2 = v4;
    }
  }
}

void sub_1000058C4(uint64_t a1)
{
  uint64_t v2 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timer]);
  dispatch_source_cancel(v2);
}

LABEL_18:
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_fastPluginDuration));
  [v3 setObject:v12 forKey:@"fastPluginDuration"];

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }

  PBDataWriterWriteUint32Field(v7, self->_fastPluginDuration, 3LL);
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }

  *((_DWORD *)v4 + 7) = self->_fastPluginDuration;
  *((_WORD *)v4 + 24) |= 4u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }

  *((_DWORD *)v5 + 10) = self->_pluginWatchdogCount;
  *((_WORD *)v5 + 24) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 9) = self->_pluginReturnedFalseCount;
    *((_WORD *)v5 + 24) |= 0x10u;
  }

  self->_fastPluginDuration = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 4u;
  uint64_t v5 = *((_WORD *)v4 + 24);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }

LABEL_19:
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_pluginCrashCount));
  [v3 setObject:v13 forKey:@"pluginCrashCount"];

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  PBDataWriterWriteUint32Field(v7, self->_pluginCrashCount, 4LL);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  *((_DWORD *)v4 + _Block_object_dispose(va, 8) = self->_pluginCrashCount;
  *((_WORD *)v4 + 24) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  self->_pluginCrashCount = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 8u;
  uint64_t v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

LABEL_20:
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_pluginWatchdogCount));
  [v3 setObject:v14 forKey:@"pluginWatchdogCount"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_pluginReturnedFalseCount));
    [v3 setObject:v5 forKey:@"pluginReturnedFalseCount"];
  }

  PBDataWriterWriteUint32Field(v7, self->_pluginWatchdogCount, 5LL);
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_7:
  }
    PBDataWriterWriteUint32Field(v7, self->_pluginReturnedFalseCount, 6LL);
LABEL_8:
  buildMigratedFrom = self->_buildMigratedFrom;
  if (buildMigratedFrom) {
    PBDataWriterWriteStringField(v7, buildMigratedFrom, 7LL);
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField(v7, self->_migratedAfterUpgrade, 8LL);
    v6 = (__int16)self->_has;
    if ((v6 & 0x80) == 0)
    {
LABEL_12:
      if ((v6 & 0x100) == 0) {
        goto LABEL_13;
      }
LABEL_24:
      PBDataWriterWriteBOOLField(v7, self->_migratedFromBackupSourceDifferentDevice, 10LL);
      if ((*(_WORD *)&self->_has & 0x200) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }

  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_12;
  }

  PBDataWriterWriteBOOLField(v7, self->_migratedFromBackup, 9LL);
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) != 0) {
    goto LABEL_24;
  }
LABEL_13:
  if ((v6 & 0x200) != 0) {
LABEL_14:
  }
    PBDataWriterWriteBOOLField(v7, self->_migratedFromBackupSourceiCloud, 11LL);
LABEL_15:
}

  *((_DWORD *)v4 + 10) = self->_pluginWatchdogCount;
  *((_WORD *)v4 + 24) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 9) = self->_pluginReturnedFalseCount;
    *((_WORD *)v4 + 24) |= 0x10u;
  }

  self->_pluginWatchdogCount = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)v4 + 24) & 0x10) != 0)
  {
LABEL_7:
    self->_pluginReturnedFalseCount = *((_DWORD *)v4 + 9);
    *(_WORD *)&self->_has |= 0x10u;
  }

  pthread_mutex_unlock(p_recursiveMutex);
  return (NSString *)v5;
}

LABEL_8:
  buildMigratedFrom = self->_buildMigratedFrom;
  if (buildMigratedFrom) {
    [v3 setObject:buildMigratedFrom forKey:@"buildMigratedFrom"];
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x40) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_migratedAfterUpgrade));
    [v3 setObject:v15 forKey:@"migratedAfterUpgrade"];

    v7 = (__int16)self->_has;
    if ((v7 & 0x80) == 0)
    {
LABEL_12:
      if ((v7 & 0x100) == 0) {
        goto LABEL_13;
      }
LABEL_24:
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_migratedFromBackupSourceDifferentDevice));
      [v3 setObject:v17 forKey:@"migratedFromBackupSourceDifferentDevice"];

      if ((*(_WORD *)&self->_has & 0x200) == 0) {
        return v3;
      }
      goto LABEL_14;
    }
  }

  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_12;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_migratedFromBackup));
  [v3 setObject:v16 forKey:@"migratedFromBackup"];

  v7 = (__int16)self->_has;
  if ((v7 & 0x100) != 0) {
    goto LABEL_24;
  }
LABEL_13:
  if ((v7 & 0x200) != 0)
  {
LABEL_14:
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_migratedFromBackupSourceiCloud));
    [v3 setObject:v8 forKey:@"migratedFromBackupSourceiCloud"];
  }

  return v3;
}

  if (self->_buildMigratedFrom)
  {
    v7 = v4;
    objc_msgSend(v4, "setBuildMigratedFrom:");
    __int128 v4 = v7;
  }

  v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((_BYTE *)v4 + 44) = self->_migratedAfterUpgrade;
    *((_WORD *)v4 + 24) |= 0x40u;
    v6 = (__int16)self->_has;
    if ((v6 & 0x80) == 0)
    {
LABEL_12:
      if ((v6 & 0x100) == 0) {
        goto LABEL_13;
      }
LABEL_24:
      *((_BYTE *)v4 + 46) = self->_migratedFromBackupSourceDifferentDevice;
      *((_WORD *)v4 + 24) |= 0x100u;
      if ((*(_WORD *)&self->_has & 0x200) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }

  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_12;
  }

  *((_BYTE *)v4 + 45) = self->_migratedFromBackup;
  *((_WORD *)v4 + 24) |= 0x80u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) != 0) {
    goto LABEL_24;
  }
LABEL_13:
  if ((v6 & 0x200) != 0)
  {
LABEL_14:
    *((_BYTE *)v4 + 47) = self->_migratedFromBackupSourceiCloud;
    *((_WORD *)v4 + 24) |= 0x200u;
  }

  v8 = -[NSString copyWithZone:](self->_buildMigratedFrom, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  v10 = (__int16)self->_has;
  if ((v10 & 0x40) != 0)
  {
    *((_BYTE *)v6 + 44) = self->_migratedAfterUpgrade;
    *((_WORD *)v6 + 24) |= 0x40u;
    v10 = (__int16)self->_has;
    if ((v10 & 0x80) == 0)
    {
LABEL_10:
      if ((v10 & 0x100) == 0) {
        goto LABEL_11;
      }
LABEL_22:
      *((_BYTE *)v6 + 46) = self->_migratedFromBackupSourceDifferentDevice;
      *((_WORD *)v6 + 24) |= 0x100u;
      if ((*(_WORD *)&self->_has & 0x200) == 0) {
        return v6;
      }
      goto LABEL_12;
    }
  }

  else if ((v10 & 0x80) == 0)
  {
    goto LABEL_10;
  }

  *((_BYTE *)v6 + 45) = self->_migratedFromBackup;
  *((_WORD *)v6 + 24) |= 0x80u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x100) != 0) {
    goto LABEL_22;
  }
LABEL_11:
  if ((v10 & 0x200) != 0)
  {
LABEL_12:
    *((_BYTE *)v6 + 47) = self->_migratedFromBackupSourceiCloud;
    *((_WORD *)v6 + 24) |= 0x200u;
  }

  return v6;
}

  if (*((void *)v4 + 2))
  {
    v7 = v4;
    -[DMDataMigratorMigrationStatistics setBuildMigratedFrom:](self, "setBuildMigratedFrom:");
    __int128 v4 = v7;
  }

  v6 = *((_WORD *)v4 + 24);
  if ((v6 & 0x40) != 0)
  {
    self->_migratedAfterUpgrade = *((_BYTE *)v4 + 44);
    *(_WORD *)&self->_has |= 0x40u;
    v6 = *((_WORD *)v4 + 24);
    if ((v6 & 0x80) == 0)
    {
LABEL_12:
      if ((v6 & 0x100) == 0) {
        goto LABEL_13;
      }
LABEL_24:
      self->_migratedFromBackupSourceDifferentDevice = *((_BYTE *)v4 + 46);
      *(_WORD *)&self->_has |= 0x100u;
      if ((*((_WORD *)v4 + 24) & 0x200) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }

  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_12;
  }

  self->_migratedFromBackup = *((_BYTE *)v4 + 45);
  *(_WORD *)&self->_has |= 0x80u;
  v6 = *((_WORD *)v4 + 24);
  if ((v6 & 0x100) != 0) {
    goto LABEL_24;
  }
LABEL_13:
  if ((v6 & 0x200) != 0)
  {
LABEL_14:
    self->_migratedFromBackupSourceiCloud = *((_BYTE *)v4 + 47);
    *(_WORD *)&self->_has |= 0x200u;
  }

uint64_t DMDataMigratorMigrationStatisticsReadFrom(uint64_t a1, uint64_t a2)
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
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0LL;
        *(_WORD *)(a1 + 48) |= 1u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1LL || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_92;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            uint64_t v14 = 0LL;
            goto LABEL_94;
          }
        }

        *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_92:
        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0LL;
        }
LABEL_94:
        *(void *)(a1 + _Block_object_dispose(va, 8) = v14;
        continue;
      case 2u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0LL;
        *(_WORD *)(a1 + 48) |= 2u;
        while (2)
        {
          unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v21 == -1LL || v21 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v22 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
            v20 |= (unint64_t)(v22 & 0x7F) << v18;
            if (v22 < 0)
            {
              v18 += 7;
              BOOL v9 = v19++ >= 9;
              if (v9)
              {
                LODWORD(v20) = 0;
                goto LABEL_98;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_98:
        uint64_t v62 = 24LL;
        goto LABEL_115;
      case 3u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v20 = 0LL;
        *(_WORD *)(a1 + 48) |= 4u;
        while (2)
        {
          unint64_t v25 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v25 == -1LL || v25 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v26 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v25);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v25 + 1;
            v20 |= (unint64_t)(v26 & 0x7F) << v23;
            if (v26 < 0)
            {
              v23 += 7;
              BOOL v9 = v24++ >= 9;
              if (v9)
              {
                LODWORD(v20) = 0;
                goto LABEL_102;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_102:
        uint64_t v62 = 28LL;
        goto LABEL_115;
      case 4u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v20 = 0LL;
        *(_WORD *)(a1 + 48) |= 8u;
        while (2)
        {
          unint64_t v29 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v29 == -1LL || v29 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v30 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v29);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v29 + 1;
            v20 |= (unint64_t)(v30 & 0x7F) << v27;
            if (v30 < 0)
            {
              v27 += 7;
              BOOL v9 = v28++ >= 9;
              if (v9)
              {
                LODWORD(v20) = 0;
                goto LABEL_106;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_106:
        uint64_t v62 = 32LL;
        goto LABEL_115;
      case 5u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v20 = 0LL;
        *(_WORD *)(a1 + 48) |= 0x20u;
        while (2)
        {
          unint64_t v33 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v33 == -1LL || v33 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v34 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v33);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v33 + 1;
            v20 |= (unint64_t)(v34 & 0x7F) << v31;
            if (v34 < 0)
            {
              v31 += 7;
              BOOL v9 = v32++ >= 9;
              if (v9)
              {
                LODWORD(v20) = 0;
                goto LABEL_110;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_110:
        uint64_t v62 = 40LL;
        goto LABEL_115;
      case 6u:
        char v35 = 0;
        unsigned int v36 = 0;
        uint64_t v20 = 0LL;
        *(_WORD *)(a1 + 48) |= 0x10u;
        while (2)
        {
          unint64_t v37 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v37 == -1LL || v37 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v38 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v37);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v37 + 1;
            v20 |= (unint64_t)(v38 & 0x7F) << v35;
            if (v38 < 0)
            {
              v35 += 7;
              BOOL v9 = v36++ >= 9;
              if (v9)
              {
                LODWORD(v20) = 0;
                goto LABEL_114;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_114:
        uint64_t v62 = 36LL;
LABEL_115:
        *(_DWORD *)(a1 + v62) = v20;
        continue;
      case 7u:
        uint64_t String = PBReaderReadString(a2);
        uint64_t v40 = objc_claimAutoreleasedReturnValue(String);
        v41 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v40;

        continue;
      case 8u:
        char v42 = 0;
        unsigned int v43 = 0;
        uint64_t v44 = 0LL;
        *(_WORD *)(a1 + 48) |= 0x40u;
        while (2)
        {
          unint64_t v45 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v45 == -1LL || v45 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v46 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v45);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v45 + 1;
            v44 |= (unint64_t)(v46 & 0x7F) << v42;
            if (v46 < 0)
            {
              v42 += 7;
              BOOL v9 = v43++ >= 9;
              if (v9)
              {
                uint64_t v44 = 0LL;
                goto LABEL_119;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v44 = 0LL;
        }
LABEL_119:
        BOOL v63 = v44 != 0;
        uint64_t v64 = 44LL;
        goto LABEL_132;
      case 9u:
        char v47 = 0;
        unsigned int v48 = 0;
        uint64_t v49 = 0LL;
        *(_WORD *)(a1 + 48) |= 0x80u;
        while (2)
        {
          unint64_t v50 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v50 == -1LL || v50 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v51 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v50);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v50 + 1;
            v49 |= (unint64_t)(v51 & 0x7F) << v47;
            if (v51 < 0)
            {
              v47 += 7;
              BOOL v9 = v48++ >= 9;
              if (v9)
              {
                uint64_t v49 = 0LL;
                goto LABEL_123;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v49 = 0LL;
        }
LABEL_123:
        BOOL v63 = v49 != 0;
        uint64_t v64 = 45LL;
        goto LABEL_132;
      case 0xAu:
        char v52 = 0;
        unsigned int v53 = 0;
        uint64_t v54 = 0LL;
        *(_WORD *)(a1 + 48) |= 0x100u;
        while (2)
        {
          unint64_t v55 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v55 == -1LL || v55 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v56 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v55);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v55 + 1;
            v54 |= (unint64_t)(v56 & 0x7F) << v52;
            if (v56 < 0)
            {
              v52 += 7;
              BOOL v9 = v53++ >= 9;
              if (v9)
              {
                uint64_t v54 = 0LL;
                goto LABEL_127;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v54 = 0LL;
        }
LABEL_127:
        BOOL v63 = v54 != 0;
        uint64_t v64 = 46LL;
        goto LABEL_132;
      case 0xBu:
        char v57 = 0;
        unsigned int v58 = 0;
        uint64_t v59 = 0LL;
        *(_WORD *)(a1 + 48) |= 0x200u;
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
      unint64_t v60 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v60 == -1LL || v60 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v61 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v60);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v60 + 1;
      v59 |= (unint64_t)(v61 & 0x7F) << v57;
      if ((v61 & 0x80) == 0) {
        goto LABEL_129;
      }
      v57 += 7;
      BOOL v9 = v58++ >= 9;
      if (v9)
      {
        uint64_t v59 = 0LL;
        goto LABEL_131;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_129:
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v59 = 0LL;
    }
LABEL_131:
    BOOL v63 = v59 != 0;
    uint64_t v64 = 47LL;
LABEL_132:
    *(_BYTE *)(a1 + v64) = v63;
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

LABEL_15:
}
}

LABEL_16:
  *((_DWORD *)v5 + 7) = self->_fastPluginDuration;
  *((_WORD *)v5 + 24) |= 4u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }

LABEL_17:
  *((_DWORD *)v5 + _Block_object_dispose(va, 8) = self->_pluginCrashCount;
  *((_WORD *)v5 + 24) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

LABEL_62:
    int v10 = 0;
    goto LABEL_63;
  }

  int v10 = (v9 & 0x200) == 0;
LABEL_63:

  return v10;
}

LABEL_10:
  unint64_t v6 = 0LL;
  if ((has & 8) != 0)
  {
LABEL_5:
    unint64_t v7 = 2654435761LL * self->_pluginCrashCount;
    if ((has & 0x20) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    char v8 = 0LL;
    if ((has & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }

LABEL_11:
  unint64_t v7 = 0LL;
  if ((has & 0x20) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  char v8 = 2654435761LL * self->_pluginWatchdogCount;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    BOOL v9 = 2654435761LL * self->_pluginReturnedFalseCount;
    goto LABEL_14;
  }
}

LABEL_13:
  BOOL v9 = 0LL;
LABEL_14:
  int v10 = -[NSString hash](self->_buildMigratedFrom, "hash");
  v11 = (__int16)self->_has;
  if ((v11 & 0x40) != 0)
  {
    char v12 = 2654435761LL * self->_migratedAfterUpgrade;
    if ((v11 & 0x80) != 0)
    {
LABEL_16:
      unsigned int v13 = 2654435761LL * self->_migratedFromBackup;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_17;
      }
LABEL_21:
      uint64_t v14 = 0LL;
      if ((*(_WORD *)&self->_has & 0x200) != 0) {
        goto LABEL_18;
      }
LABEL_22:
      unint64_t v15 = 0LL;
      return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v12 ^ v13 ^ v14 ^ v15 ^ v10;
    }
  }

  else
  {
    char v12 = 0LL;
    if ((v11 & 0x80) != 0) {
      goto LABEL_16;
    }
  }

  unsigned int v13 = 0LL;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_21;
  }
LABEL_17:
  uint64_t v14 = 2654435761LL * self->_migratedFromBackupSourceDifferentDevice;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_22;
  }
LABEL_18:
  unint64_t v15 = 2654435761LL * self->_migratedFromBackupSourceiCloud;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v12 ^ v13 ^ v14 ^ v15 ^ v10;
}

void sub_1000075A0(id a1)
{
  uint64_t v1 = objc_alloc(&OBJC_CLASS___DMMigrationSentinelManager);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v5 = -[DMMigrationSentinelManager initWithFileManager:](v1, "initWithFileManager:", v2);

  unsigned __int8 v3 = -[DMMigrationState initWithMigrationSentinelManager:]( objc_alloc(&OBJC_CLASS___DMMigrationState),  "initWithMigrationSentinelManager:",  v5);
  char v4 = (void *)qword_10002CB88;
  qword_10002CB88 = (uint64_t)v3;
}
}

void sub_1000082A4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(a1 + 40) pid]));
  _DMLogFunc(v1, 6LL);

  unsigned int v5 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "resultsHandler", v3, v4));
  v5[2](v5, 2LL);
}

void sub_100008334(uint64_t a1)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) earlyResultsPluginIdentifier]);
  char v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(a1 + 32) pid]));
  _DMLogFunc(v1, 6LL);

  unsigned int v5 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "resultsHandler", v3, v4));
  v5[2](v5, 3LL);
}

uint64_t sub_1000083D8(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
  return _DMLogFunc(v1, 6LL, @"Did call migration starter");
}

id sub_100008430(uint64_t a1)
{
  return [*(id *)(a1 + 32) progressHostIsReady];
}

void sub_100008688(id a1)
{
}

void sub_100008FDC(uint64_t a1)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 104LL);
  char v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"kDMMigrationPluginResultsPhaseDescription"]);

  unsigned int v7 = [v6 isEqualToString:@"kDMMigrationPhaseDescriptionRunning"];
  char v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) rep]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 path]);
  int v10 = (void *)v9;
  if (v7)
  {
    uint64_t v20 = v9;
    _DMLogFunc(v1, 7LL);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date", v20));
    [v11 timeIntervalSinceDate:*(void *)(a1 + 48)];
    double v13 = v12;

    v21[0] = @"kDMMigrationPluginResultsBundlePathKey";
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) rep]);
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
    v22[0] = v15;
    v21[1] = @"kDMMigrationPluginResultsDuration";
    char v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13));
    v21[2] = @"kDMMigrationPluginResultsPhaseDescription";
    v22[1] = v16;
    v22[2] = @"kDMMigrationPhaseDescriptionRunning";
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  3LL));

    char v18 = *(void **)(*(void *)(a1 + 32) + 104LL);
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
    [v18 setObject:v17 forKey:v19];
  }

  else
  {
    _DMLogFunc(v1, 7LL);

    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 56));
  }

  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 8LL));
}

void sub_100009534(id a1)
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.migration");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue( @"DMSuppressMigrationFailureAlert",  @"com.apple.migration",  &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v2 = AppBooleanValue == 0;
  }
  else {
    BOOL v2 = 1;
  }
  char v3 = !v2;
  byte_10002CB98 = v3;
}

void sub_100009830(uint64_t a1, uint64_t a2)
{
  BOOL v2 = (a2 & 0xFFFFFFFFFFFFFFFELL) != 2;
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
  [v3 _userDidRespondToMigrationFailureNotificationToFileRadar:v2];
}

id sub_10000A39C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _telemetryDictionaryForPluginIdentifier:*(void *)(a1 + 40) duration:*(void *)(a1 + 48) incident:*(void *)(a1 + 72) countOfAttempts:*(void *)(a1 + 56) previousBuildVersion:*(unsigned int *)(a1 + 80) userDataDispos ition:*(unsigned int *)(a1 + 84) userCategory:*(double *)(a1 + 64)];
}

id sub_10000AA00(uint64_t a1)
{
  WORD2(v2) = *(_WORD *)(a1 + 80);
  LODWORD(v2) = *(_DWORD *)(a1 + 76);
  return objc_msgSend( *(id *)(a1 + 32),  "_telemetryDictionaryMigrationDidCompleteWithDuration:fastPluginDuration:pluginCrashCount:pluginWatchdogCount: pluginReturnedFalseCount:previousBuildVersion:userDataDisposition:pluginCategories:userCategory:inAppleStore:isFromFactory:",  *(unsigned int *)(a1 + 56),  *(unsigned int *)(a1 + 60),  *(unsigned int *)(a1 + 64),  *(void *)(a1 + 40),  *(unsigned int *)(a1 + 68),  *(unsigned int *)(a1 + 72),  *(double *)(a1 + 48),  *(double *)(*(void *)(a1 + 32) + 120),  v2);
}

void sub_10000BB3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, char a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

uint64_t sub_10000BBFC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000BC0C(uint64_t a1)
{
}

void sub_10000BC14(uint64_t a1)
{
  char v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", *(void *)(a1 + 56)));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 72)));
  _DMLogFunc(v1, 7LL);

  dispatch_time_t v3 = *(void *)(a1 + 64);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000BD10;
  block[3] = &unk_100020940;
  id v7 = *(id *)(a1 + 32);
  int v10 = *(_DWORD *)(a1 + 72);
  __int128 v8 = *(_OWORD *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 56);
  dispatch_after(v3, &_dispatch_main_q, block);
}

void sub_10000BD10(uint64_t a1)
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  uint64_t v17 = *(void *)(a1 + 32);
  char v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64)));
  _DMLogFunc(v1, 7LL);

  char v4 = *(void **)(a1 + 32);
  unsigned int v5 = *(_xpc_connection_s **)(*(void *)(a1 + 40) + OBJC_IVAR___DMXPCConnection__connection);
  barrier[0] = _NSConcreteStackBlock;
  barrier[1] = 3221225472LL;
  barrier[2] = sub_10000BE78;
  barrier[3] = &unk_100020918;
  id v6 = v4;
  int v24 = *(_DWORD *)(a1 + 64);
  id v22 = v6;
  dispatch_semaphore_t v23 = v3;
  id v7 = v3;
  xpc_connection_send_barrier(v5, barrier);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0LL;

  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  *(void *)(a1 + 56),  v17,  v18));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 64)));
  _DMLogFunc(v1, 7LL);

  xpc_transaction_exit_clean(v10, v11, v12, v13, v14, v15, v16);
}

uint64_t sub_10000BE78(uint64_t a1)
{
  char v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48)));
  _DMLogFunc(v1, 7LL);

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10000BEE4(uint64_t a1, int64_t a2)
{
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a2));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48)));
  _DMLogFunc(v2, 7LL);

  xpc_object_t message = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  xpc_dictionary_set_int64(message, "migrationResult", a2);
  xpc_connection_send_message( *(xpc_connection_t *)(*(void *)(a1 + 40) + OBJC_IVAR___DMXPCConnection__connection),  message);
}

void sub_10000BFB0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0LL;
}

int main(int argc, const char **argv, const char **envp)
{
}

void sub_10000C000(void *a1)
{
  id v1 = a1;
  uint64_t v2 = -[DMMigratorProxy initWithConnection:](objc_alloc(&OBJC_CLASS___DMMigratorProxy), "initWithConnection:", v1);
  if (qword_10002CBB8 != -1) {
    dispatch_once(&qword_10002CBB8, &stru_1000209B0);
  }
  [(id)qword_10002CBA8 lock];
  [(id)qword_10002CBB0 addObject:v2];
  [(id)qword_10002CBA8 unlock];
  objc_initWeak(&location, v2);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000C1D4;
  v5[3] = &unk_100020788;
  objc_copyWeak(&v6, &location);
  -[DMMigratorProxy setInvalidationHandler:](v2, "setInvalidationHandler:", v5);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000C294;
  v3[3] = &unk_100020788;
  objc_copyWeak(&v4, &location);
  -[DMMigratorProxy setInterruptionHandler:](v2, "setInterruptionHandler:", v3);
  -[DMMigratorProxy resume](v2, "resume");
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void sub_10000C158(_Unwind_Exception *a1)
{
}

void sub_10000C188(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___NSLock);
  uint64_t v2 = (void *)qword_10002CBA8;
  qword_10002CBA8 = (uint64_t)v1;

  uint64_t v3 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 1LL);
  id v4 = (void *)qword_10002CBB0;
  qword_10002CBB0 = (uint64_t)v3;
}

void sub_10000C1D4(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(v1);
    sub_10000C220(v3);

    id WeakRetained = v4;
  }
}

id sub_10000C220(void *a1)
{
  uint64_t v2 = (void *)qword_10002CBA8;
  id v3 = a1;
  [v2 lock];
  [(id)qword_10002CBB0 removeObject:v3];

  if (![(id)qword_10002CBB0 count]) {
    _DMLogFunc(v1, 7LL);
  }
  return [(id)qword_10002CBA8 unlock];
}

void sub_10000C294(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(v1);
    sub_10000C220(v3);

    id WeakRetained = v4;
  }
}

void sub_10000C320(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___DMAnalytics);
  uint64_t v2 = (void *)qword_10002CBC0;
  qword_10002CBC0 = (uint64_t)v1;
}

void sub_10000C430(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___DMDiagnostics);
  uint64_t v2 = (void *)qword_10002CBD0;
  qword_10002CBD0 = (uint64_t)v1;
}

void sub_10000C574(id a1)
{
  uint64_t v2 = dlopen( (const char *)[@"/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport" fileSystemRepresentation],  1);
  if (v2)
  {
    id v3 = v2;
    off_10002CBE0 = dlsym(v2, "WriteStackshotReportWithPID_async");
    off_10002CBE8 = dlsym(v3, "WriteStackshotReportWithPID");
  }

  else
  {
    _DMLogFunc(v1, 3LL);
  }

void sub_10000C854(id a1)
{
  uint64_t v1 = (void *)qword_10002CBF8;
  qword_10002CBF8 = (uint64_t)&off_100024CD8;
}

void sub_10000C8AC(id a1)
{
  uint64_t v1 = (void *)qword_10002CC08;
  qword_10002CC08 = (uint64_t)&off_100024CF0;
}

void sub_10000C904(id a1)
{
  uint64_t v1 = (void *)qword_10002CC18;
  qword_10002CC18 = (uint64_t)&off_100024D08;
}

void sub_10000CAF0(id a1)
{
}

void sub_10000CBF8(uint64_t a1, uint64_t a2)
{
  if ((+[DMUserDataDispositionManager dispositionFlagsFromDispositionDict:]( &OBJC_CLASS___DMUserDataDispositionManager,  "dispositionFlagsFromDispositionDict:",  a2) & 2) != 0)
  {
    sleep(5u);
    id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userManager]);
    +[DMUserVolumeMigrationTask _migrateSharedAndPrimaryUserVolumeWithUserManager:]( &OBJC_CLASS___DMUserVolumeMigrationTask,  "_migrateSharedAndPrimaryUserVolumeWithUserManager:",  v3);
  }

id _executePluginsSemaphore()
{
  if (qword_10002CC40 != -1) {
    dispatch_once(&qword_10002CC40, &stru_100020B00);
  }
  return (id)qword_10002CC38;
}

void sub_10000D9C8(id a1)
{
  dispatch_semaphore_t v1 = dispatch_semaphore_create(0LL);
  uint64_t v2 = (void *)qword_10002CC38;
  qword_10002CC38 = (uint64_t)v1;
}

void _excecutePluginsNotificationCallback()
{
  id v1 = _executePluginsSemaphore();
  uint64_t v2 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_semaphore_signal(v2);
}

void sub_10000DAA4(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  0LL,  (CFNotificationCallback)_excecutePluginsNotificationCallback,  @"com.apple.migration.executePlugins",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
}

void sub_10000E71C(_Unwind_Exception *a1)
{
}

void sub_10000E7BC(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 existsAndShouldRun])
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Running plugin %@",  v6));
    [v5 pluginWillRun:v4 migrationPhaseDescription:v7];

    [*(id *)(*(void *)(a1 + 32) + 8) lock];
    uint64_t v8 = objc_alloc(&OBJC_CLASS___DMProgressWorkItem);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    uint64_t v10 = -[DMProgressWorkItem initWithName:startTimestamp:]( v8,  "initWithName:startTimestamp:",  v9,  +[DMTimeManager currentTimestamp](&OBJC_CLASS___DMTimeManager, "currentTimestamp"));

    [*(id *)(*(void *)(a1 + 32) + 40) addObject:v10];
    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL)) {
      *(void *)(*(void *)(a1 + 32) + 24LL) = -[DMProgressWorkItem startTimestamp](v10, "startTimestamp");
    }
    unint64_t v11 = *(void *)(*(void *)(a1 + 32) + 24LL);
    id v12 = -[DMProgressWorkItem startTimestamp](v10, "startTimestamp");
    uint64_t v13 = *(void *)(a1 + 32);
    double v14 = *(float *)(v13 + 32);
    double v15 = *(float *)(v13 + 36);
    [v4 timeEstimate];
    double v44 = v16;
    _DMLogFunc(v2, 5LL);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "unlock", v12, *(void *)&v14, *(void *)&v15, *(void *)&v44);
    unint64_t v45 = +[DMTimeManager currentTimestamp](&OBJC_CLASS___DMTimeManager, "currentTimestamp");
    [v4 timeEstimate];
    double v43 = v17;
    _DMLogFunc(v2, 5LL);
    char v18 = objc_alloc(&OBJC_CLASS___DMMigrationWatchdog);
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description", v4, *(void *)&v43));
    uint64_t v20 = -[DMMigrationWatchdog initWithMigrationPluginDescription:userDataDisposition:migrationStartTime:]( v18,  "initWithMigrationPluginDescription:userDataDisposition:migrationStartTime:",  v19,  *(void *)(a1 + 40),  (double)v11);

    -[DMMigrationWatchdog resume](v20, "resume");
    [*(id *)(a1 + 32) _artificialHangTimeIntervalForPlugin:v4];
    double v22 = v21;
    [v4 appropriateTimeIntervalBeforeReboot];
    double v24 = v23;
    unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v4 rep]);
    char v26 = (void *)objc_claimAutoreleasedReturnValue([v25 path]);
    char v27 = (void *)objc_claimAutoreleasedReturnValue([v26 lastPathComponent]);
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
    unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[DMRebootTimer createRebootTimerIfAppropriateWithTimeIntervalBeforeReboot:pluginName:environment:]( &OBJC_CLASS___DMRebootTimer,  "createRebootTimerIfAppropriateWithTimeIntervalBeforeReboot:pluginName:environment:",  v27,  v28,  v24));

    [v29 resume];
    if (v22 > 0.0)
    {
      _DMLogFunc(v2, 7LL);
      sleep(v22);
    }

    char v30 = (void *)objc_claimAutoreleasedReturnValue( [v4 performMigrationWithParameters:*(void *)(a1 + 48) watchdogCoordinator:*(void *)(a1 + 56) countOfAttempts:&v47]);
    [v29 cancel];
    char v46 = v20;
    -[DMMigrationWatchdog cancel](v20, "cancel");
    [*(id *)(*(void *)(a1 + 32) + 8) lock];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) &= v30 == 0LL;
    [*(id *)(*(void *)(a1 + 32) + 8) unlock];
    +[DMTimeManager intervalSinceTimestamp:](&OBJC_CLASS___DMTimeManager, "intervalSinceTimestamp:", v45);
    double v32 = v31;
    if (v30)
    {
      unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v30 details]);
      char v34 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" %@",  v33));
    }

    else
    {
      char v34 = &stru_100021968;
    }

    _DMLogFunc(v2, 5LL);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "lock", v4, *(void *)&v32, v30 == 0, v34);
    [v4 timeEstimate];
    *(float *)(*(void *)(a1 + 32) + 32LL) = *(float *)(*(void *)(a1 + 32) + 32LL) - v35;
    [*(id *)(*(void *)(a1 + 32) + 40) removeObject:v10];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
    [*(id *)(*(void *)(a1 + 32) + 8) unlock];
    unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
    unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
    char v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Finished plugin %@",  v37));
    [v36 pluginDidFinish:v4 withSuccess:v30 == 0 duration:v30 incident:v38 migrationPhaseDescription:v32];

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    [v39 reportTelemetryForPluginIdentifier:v40 duration:v30 incident:v47 countOfAttempts:*(void *)(a1 + 40) userDataDisposition:*(unsigned int *)(a1 + 80) userCategory:v32];
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[DMMigrationState sharedInstance](&OBJC_CLASS___DMMigrationState, "sharedInstance"));
  char v42 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  [v41 sendMigrationResultsToClientInvocationsInterestedInEarlyResultsForPluginIdentifier:v42];
}

uint64_t sub_10000ECD8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_10000ECE8(id a1)
{
}

void sub_10000F260(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.datamigrator.userDataDispositionQueue", 0LL);
  uint64_t v2 = (void *)qword_10002CC58;
  qword_10002CC58 = (uint64_t)v1;
}

uint64_t sub_10000F28C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000F29C(uint64_t a1)
{
}

void sub_10000F2A4(void *a1)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 userDataDispositionPref]);
  uint64_t v5 = *(void *)(a1[6] + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = *(void **)(*(void *)(a1[6] + 8LL) + 40LL);
  if (!v7) {
    goto LABEL_5;
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"buildVersion"]);
  if ((+[DMEnvironment isBuildVersion:equalToBuildVersion:]( &OBJC_CLASS___DMEnvironment,  "isBuildVersion:equalToBuildVersion:",  v8,  a1[4]) & 1) == 0)
  {
    float v16 = v8;
    uint64_t v18 = a1[4];
    _DMLogFunc(v1, 7LL);
    uint64_t v9 = *(void *)(a1[6] + 8LL);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0LL;
  }

  if (!*(void *)(*(void *)(a1[6] + 8LL) + 40LL))
  {
LABEL_5:
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance", v16, v18));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 context]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[DMMigrator _dispositionDictFromContext:buildVersion:lastBuildVersion:]( &OBJC_CLASS___DMMigrator,  "_dispositionDictFromContext:buildVersion:lastBuildVersion:",  v12,  a1[4],  a1[5]));
    uint64_t v14 = *(void *)(a1[6] + 8LL);
    double v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    uint64_t v17 = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
    _DMLogFunc(v1, 7LL);
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance", v17));
    [v19 setUserDataDispositionPref:*(void *)(*(void *)(a1[6] + 8) + 40)];
  }

id sub_10000F7AC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _migrateWithTestMigrationInfrastructureOnly:*(unsigned __int8 *)(a1 + 48) buildVersion:*(void *)(a1 + 40) lastBuildVersion:a2];
}

void sub_10000FFF4(_Unwind_Exception *a1)
{
}

uint64_t sub_100010028(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _createProgressWindow]);
  [*(id *)(a1 + 32) setProgressWindow:v2];

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) progressWindow]);
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 errorDescription]);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) progressWindow]);
  [v7 setVisible:1];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) progressWindow]);
  LODWORD(v9) = 0;
  [v8 setProgressValue:v9];

  if (os_variant_has_internal_content("com.apple.migration", v10))
  {
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) progressWindow]);
    [v11 setStatusText:@" "];
  }

  return CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.001, 0);
}

id sub_100010114(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10001016C;
  v2[3] = &unk_100020C28;
  return [*(id *)(a1 + 32) currentProgressInfo:v2];
}

void sub_10001016C(uint64_t a1, void *a2, float a3)
{
  id v8 = a2;
  if (*(float *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) != a3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) progressWindow]);
    *(float *)&double v6 = a3;
    [v5 setProgressValue:v6];

    *(float *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a3;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) progressWindow]);
  [v7 setStatusText:v8];
}

uint64_t sub_100010200(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) progressWindow]);
  LODWORD(v2) = 1.0;
  [v1 setProgressValue:v2];

  return CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.001, 0);
}

BOOL sub_1000103E8(id a1, DataMigrationPlugin *a2, unint64_t a3, BOOL *a4)
{
  return -[DataMigrationPlugin existsAndShouldRun](a2, "existsAndShouldRun", a3, a4);
}

void sub_10001062C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

uint64_t sub_100010654(uint64_t a1)
{
  double v2 = objc_alloc(&OBJC_CLASS___PUIProgressWindow);
  LODWORD(v3) = 1161527296;
  uint64_t v4 = -[PUIProgressWindow initWithProgressBarVisibility:level:forceInverted:]( v2,  "initWithProgressBarVisibility:level:forceInverted:",  *(unsigned __int8 *)(a1 + 40),  *(unsigned __int8 *)(a1 + 41),  v3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  double v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setVisible:1];
  LODWORD(v7) = 0;
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setProgressValue:v7];
  return CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.001, 0);
}

void sub_1000106E4(id a1)
{
}

id sub_100010700(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setProgressValue:a2];
}

uint64_t sub_100010718(uint64_t a1, double a2)
{
  LODWORD(a2) = 1.0;
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setProgressValue:a2];
  return CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.001, 0);
}

void -[DMWrapperProcessWatchdogCoordinator _blockedByPendingWatchdogOfAnotherPluginOnQueue:]( DMWrapperProcessWatchdogCoordinator *self, SEL a2, id a3)
{
}

void sub_100010E30(_Unwind_Exception *a1)
{
}

uint64_t sub_100010E74(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = 0LL;
  return result;
}

void sub_100010E84(uint64_t a1)
{
}

void sub_100010E8C(uint64_t a1)
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  double v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pluginStates", 0));
  id v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    while (2)
    {
      double v6 = 0LL;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v18 + 1) + 8 * (void)v6) plugin]);
        unsigned __int8 v8 = [v7 isEqual:*(void *)(a1 + 40)];

        if ((v8 & 1) != 0)
        {
          uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"Plugin to run already exists in watchdog coordinator state",  0LL));
          uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8LL);
          uint64_t v17 = *(void **)(v16 + 40);
          *(void *)(v16 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = v15;

          goto LABEL_11;
        }

        double v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  double v9 = -[DMWrapperProcessWatchdogCoordinatorPluginState initWithPlugin:]( objc_alloc(&OBJC_CLASS___DMWrapperProcessWatchdogCoordinatorPluginState),  "initWithPlugin:",  *(void *)(a1 + 40));
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8LL);
  unint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = v9;

  id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pluginStates]);
  [v12 addObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

  uint64_t v13 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) queue]);
  uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8LL);
  double v2 = *(void **)(v14 + 40);
  *(void *)(v14 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = v13;
LABEL_11:
}

void sub_100011054(uint64_t a1)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_pluginStateThatBlocksNewRunEvents_onPropertyAccessQueue"));
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v9 = v3;
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v3 plugin]);
    _DMLogFunc(v1, 6LL);

    uint64_t v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "queue", v4, v8));
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
    double v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = v5;

    id v3 = v9;
  }
}

void sub_1000110E8(uint64_t a1)
{
  double v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) propertyAccessQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011194;
  block[3] = &unk_100020D48;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  uint64_t v8 = *(void *)(a1 + 56);
  dispatch_sync(v2, block);
}

id sub_100011194(uint64_t a1)
{
  uint64_t v5 = *(void *)(a1 + 32);
  _DMLogFunc(v1, 7LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "pluginStates", v5));
  [v3 removeObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  return objc_msgSend(*(id *)(a1 + 40), "_killIfAppropriate_onPropertyAccessQueue");
}

void sub_100011300( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100011318(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56)));
  _DMLogFunc(v1, 6LL);

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "pluginStates", v3, v18, 0));
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v20 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 plugin]);
      unsigned __int8 v11 = [v10 isEqual:*(void *)(a1 + 32)];

      if ((v11 & 1) != 0) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v12 = v9;

    if (!v12) {
      goto LABEL_13;
    }
    if ([v12 watchdogged])
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"Plugin to watchdog already scheduled for watchdog",  0LL));
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8LL);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = v13;
    }

    else
    {
      [v12 setWatchdogged:1];
      [v12 setPid:*(unsigned int *)(a1 + 56)];
      objc_msgSend(*(id *)(a1 + 40), "_killIfAppropriate_onPropertyAccessQueue");
    }
  }

  else
  {
LABEL_9:

LABEL_13:
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"Plugin to watchdog does not exist in watchdog coordinator state",  0LL));
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v12 = *(id *)(v17 + 40);
    *(void *)(v17 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = v16;
  }
}

void sub_1000118BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000118D4(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pluginStates]);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

LABEL_14:
  return v12;
}

void sub_10001213C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_100012160(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = 0LL;
  return result;
}

void sub_100012170(uint64_t a1)
{
}

void sub_100012178(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[DMMigrationPluginWrapperConnection connection]( &OBJC_CLASS___DMMigrationPluginWrapperConnection,  "connection"));
  [v2 resume];
  uint64_t v3 = dispatch_queue_create("com.apple.datamigrator.pluginCompletionSerialQueue", 0LL);
  uint64_t v4 = 0LL;
  if (*(double *)(a1 + 72) > 0.0)
  {
    uint64_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v3);
    dispatch_time_t v5 = dispatch_time(0LL, (uint64_t)(*(double *)(a1 + 72) * 1000000000.0));
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(*(double *)(a1 + 72) * 1000000000.0));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000124C8;
    handler[3] = &unk_100020DE8;
    uint64_t v55 = *(void *)(a1 + 56);
    id v6 = v2;
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(a1 + 40);
    id v51 = v6;
    uint64_t v52 = v7;
    uint64_t v57 = *(void *)(a1 + 72);
    uint64_t v56 = *(void *)(a1 + 64);
    id v53 = v8;
    id v54 = *(id *)(a1 + 48);
    dispatch_source_set_event_handler(v4, handler);
    dispatch_resume(v4);
  }

  uint64_t v44 = 0LL;
  unint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000LL;
  uint64_t v47 = sub_100012160;
  unsigned int v48 = sub_100012170;
  dispatch_source_t v49 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v3);
  id v9 = (dispatch_source_s *)v45[5];
  [*(id *)(a1 + 32) pidReceiptTimeout];
  dispatch_time_t v11 = dispatch_time(0LL, (uint64_t)(v10 * 1000000000.0));
  dispatch_source_set_timer(v9, v11, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
  id v12 = (dispatch_source_s *)v45[5];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100012700;
  v38[3] = &unk_100020E10;
  uint64_t v42 = *(void *)(a1 + 56);
  id v13 = v2;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void **)(a1 + 40);
  id v39 = v13;
  uint64_t v40 = v14;
  id v41 = v15;
  double v43 = &v44;
  dispatch_source_set_event_handler(v12, v38);
  dispatch_resume((dispatch_object_t)v45[5]);
  **(_BYTE **)(a1 + 8CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = 0;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) path]);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8LL);
  char v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472LL;
  unsigned int v28 = sub_10001288C;
  unint64_t v29 = &unk_100020E60;
  __int128 v19 = v3;
  char v30 = v19;
  __int128 v20 = v4;
  uint64_t v21 = *(void *)(a1 + 64);
  uint64_t v34 = *(void *)(a1 + 56);
  float v35 = &v44;
  uint64_t v22 = *(void *)(a1 + 32);
  double v23 = *(void **)(a1 + 40);
  double v31 = v20;
  uint64_t v32 = v22;
  uint64_t v36 = v21;
  id v24 = v23;
  uint64_t v25 = *(void *)(a1 + 80);
  id v33 = v24;
  uint64_t v37 = v25;
  [v13 runPluginAtPath:v16 withIdentifier:v18 parameters:v17 completion:&v26];

  objc_msgSend(v13, "invalidate", v26, v27, v28, v29);
  _Block_object_dispose(&v44, 8);
}

void sub_1000124B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30)
{
}

void sub_1000124C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 64) + 8LL);
  if (!*(_DWORD *)(v2 + 24))
  {
    *(_DWORD *)(v2 + 24) = 1;
    id v4 = [*(id *)(a1 + 32) pidForWatchdog];
    uint64_t v5 = *(void *)(a1 + 40);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 80)));
    uint64_t v17 = v5;
    _DMLogFunc(v1, 3LL);

    uint64_t v7 = *(void *)(a1 + 40);
    if ((_DWORD)v4)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4, v17, v19, v20));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 80)));
      id v21 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - Got Watchdogged, pid %@, after %@ seconds",  v7,  v8,  v9));

      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 16LL);
      dispatch_time_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) dispositionSupersetOfContext]);
      uint64_t v12 = objc_claimAutoreleasedReturnValue( +[DMIncident incidentWithKind:responsiblePluginRep:userDataDisposition:details:]( &OBJC_CLASS___DMIncident,  "incidentWithKind:responsiblePluginRep:userDataDisposition:details:",  3LL,  v10,  v11,  v21));
      uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8LL);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = v12;

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[DMDiagnostics sharedInstance](&OBJC_CLASS___DMDiagnostics, "sharedInstance"));
      [v15 captureDiagnosticsForIncident:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) async:0];
    }

    else
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(a1 + 80),  v17,  v19,  v20));
      id v21 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - Attempted watchdog failed (couldn't find the pid) after %@ seconds",  v7,  v16));

      id v18 = v21;
      _DMLogFunc(v1, 5LL);
    }

    objc_msgSend(*(id *)(a1 + 56), "watchdogPlugin:withPid:", *(void *)(a1 + 40), v4, v18);
  }

void sub_100012700(uint64_t a1)
{
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)
    && ([*(id *)(a1 + 32) didReceivePid] & 1) == 0)
  {
    [*(id *)(a1 + 40) pidReceiptTimeout];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    _DMLogFunc(v1, 3LL);

    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 16LL);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "dispositionSupersetOfContext", v13));
    uint64_t v5 = *(void **)(a1 + 40);
    [v5 pidReceiptTimeout];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - Did not receive pid after %@ seconds",  v5,  v6));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[DMIncident incidentWithKind:responsiblePluginRep:userDataDisposition:details:]( &OBJC_CLASS___DMIncident,  "incidentWithKind:responsiblePluginRep:userDataDisposition:details:",  4LL,  v3,  v4,  v7));

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMDiagnostics sharedInstance](&OBJC_CLASS___DMDiagnostics, "sharedInstance"));
    [v9 captureDiagnosticsForIncident:v8 async:0];
  }

  uint64_t v10 = *(dispatch_source_s **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  if (v10)
  {
    dispatch_source_cancel(v10);
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8LL);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = 0LL;
  }

void sub_10001288C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100012960;
  block[3] = &unk_100020E38;
  uint64_t v6 = *(dispatch_queue_s **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  char v18 = a2;
  uint64_t v8 = *(void *)(a1 + 48);
  id v12 = v7;
  uint64_t v13 = v8;
  id v14 = v5;
  __int128 v16 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 56);
  id v9 = v10[0];
  __int128 v15 = *(_OWORD *)v10;
  uint64_t v17 = *(void *)(a1 + 88);
  v10[0] = v5;
  dispatch_sync(v6, block);
}

void sub_100012960(uint64_t a1)
{
  uint64_t v3 = *(dispatch_source_s **)(a1 + 32);
  if (v3) {
    dispatch_source_cancel(v3);
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8LL);
  if (!*(_DWORD *)(v4 + 24)) {
    *(_DWORD *)(v4 + 24) = 2;
  }
  id v5 = *(dispatch_source_s **)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  if (v5)
  {
    dispatch_source_cancel(v5);
    uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8LL);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = 0LL;
  }

  if (!*(_BYTE *)(a1 + 96))
  {
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) == 1)
    {
      _DMLogFunc(v1, 3LL);
    }

    else if (*(void *)(a1 + 48))
    {
      _DMLogFunc(v1, 3LL);
      **(_BYTE **)(a1 + 8_Block_object_dispose((const void *)(v13 - 96), 8) = 1;
    }

    else
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 16LL);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) dispositionSupersetOfContext]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - Returned NO from -performMigration:",  *(void *)(a1 + 40)));
      uint64_t v11 = objc_claimAutoreleasedReturnValue( +[DMIncident incidentWithKind:responsiblePluginRep:userDataDisposition:details:]( &OBJC_CLASS___DMIncident,  "incidentWithKind:responsiblePluginRep:userDataDisposition:details:",  1LL,  v8,  v9,  v10));
      uint64_t v12 = *(void *)(*(void *)(a1 + 80) + 8LL);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 4CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0) = v11;

      id v14 = (id)objc_claimAutoreleasedReturnValue(+[DMDiagnostics sharedInstance](&OBJC_CLASS___DMDiagnostics, "sharedInstance"));
      [v14 captureDiagnosticsForIncident:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) async:1];
    }
  }

void sub_100012BDC()
{
  __assert_rtn("-[DMMigrationWatchdog resume]", "DMMigrationWatchdog.m", 54, "self.timer == nil");
}

void sub_100012C04(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *OSASubmissionClientLibrary(void)"));
  objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"DMRebootAnalyticsUploader.m",  17,  @"%s",  *a1);

  __break(1u);
}

void sub_100012C80()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getOSASubmissionClientClass(void)_block_invoke"));
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v1,  @"DMRebootAnalyticsUploader.m",  18,  @"Unable to find class %s",  "OSASubmissionClient");

  __break(1u);
  AnalyticsSendEventLazy(v2, v3);
}

id objc_msgSend__performMigrationWithPreliminaryTasks_pluginsProvider_pluginCategories_userCategory_buildVersion_lastBuildVersion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_performMigrationWithPreliminaryTasks:pluginsProvider:pluginCategories:userCategory:buildVersion:lastBuildVersion:");
}

id objc_msgSend__telemetryDictionaryMigrationDidCompleteWithDuration_fastPluginDuration_pluginCrashCount_pluginWatchdogCount_pluginReturnedFalseCount_previousBuildVersion_userDataDisposition_pluginCategories_userCategory_inAppleStore_isFromFactory_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_telemetryDictionaryMigrationDidCompleteWithDuration:fastPluginDuration:pluginCrashCount:pluginWatchdogCount: pluginReturnedFalseCount:previousBuildVersion:userDataDisposition:pluginCategories:userCategory:inAppleStore:isFromFactory:");
}

id objc_msgSend_createRebootTimerIfAppropriateWithTimeIntervalBeforeReboot_pluginName_environment_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createRebootTimerIfAppropriateWithTimeIntervalBeforeReboot:pluginName:environment:");
}

id objc_msgSend_initWithMigrationPluginDescription_userDataDisposition_migrationStartTime_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMigrationPluginDescription:userDataDisposition:migrationStartTime:");
}

id objc_msgSend_migrateCheckingNecessity_lastRelevantPlugin_testMigrationInfrastructureOnly_connection_migrationResultHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "migrateCheckingNecessity:lastRelevantPlugin:testMigrationInfrastructureOnly:connection:migrationResultHandler:");
}

id objc_msgSend_reportTelemetryForPluginIdentifier_duration_incident_countOfAttempts_userDataDisposition_userCategory_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "reportTelemetryForPluginIdentifier:duration:incident:countOfAttempts:userDataDisposition:userCategory:");
}

id objc_msgSend_reportTelemetryWithMigrationDuration_userDataDisposition_pluginCategories_userCategory_inAppleStore_isFromFactory_startInterval_firstPluginStartInterval_endInterval_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "reportTelemetryWithMigrationDuration:userDataDisposition:pluginCategories:userCategory:inAppleStore:isFromFac tory:startInterval:firstPluginStartInterval:endInterval:");
}

id objc_msgSend_sendMigrationResultsToClientInvocationsInterestedInEarlyResultsForPluginIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMigrationResultsToClientInvocationsInterestedInEarlyResultsForPluginIdentifier:");
}

id objc_msgSend_startMigrationAndOrBlockIfNecessaryWithClientInvocation_buildVersion_migrationStarterBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMigrationAndOrBlockIfNecessaryWithClientInvocation:buildVersion:migrationStarterBlock:");
}

id objc_msgSend_workBlock(void *a1, const char *a2, ...)
{
  return [a1 workBlock];
}