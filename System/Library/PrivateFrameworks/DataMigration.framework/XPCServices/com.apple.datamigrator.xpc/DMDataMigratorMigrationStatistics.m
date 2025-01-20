@interface DMDataMigratorMigrationStatistics
- (BOOL)hasBuildMigratedFrom;
- (BOOL)hasDuration;
- (BOOL)hasFastPluginDuration;
- (BOOL)hasMigratedAfterUpgrade;
- (BOOL)hasMigratedFromBackup;
- (BOOL)hasMigratedFromBackupSourceDifferentDevice;
- (BOOL)hasMigratedFromBackupSourceiCloud;
- (BOOL)hasPluginCrashCount;
- (BOOL)hasPluginReturnedFalseCount;
- (BOOL)hasPluginWatchdogCount;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)migratedAfterUpgrade;
- (BOOL)migratedFromBackup;
- (BOOL)migratedFromBackupSourceDifferentDevice;
- (BOOL)migratedFromBackupSourceiCloud;
- (BOOL)readFrom:(id)a3;
- (NSString)buildMigratedFrom;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)duration;
- (unsigned)fastPluginDuration;
- (unsigned)pluginCrashCount;
- (unsigned)pluginReturnedFalseCount;
- (unsigned)pluginWatchdogCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuildMigratedFrom:(id)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setFastPluginDuration:(unsigned int)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasFastPluginDuration:(BOOL)a3;
- (void)setHasMigratedAfterUpgrade:(BOOL)a3;
- (void)setHasMigratedFromBackup:(BOOL)a3;
- (void)setHasMigratedFromBackupSourceDifferentDevice:(BOOL)a3;
- (void)setHasMigratedFromBackupSourceiCloud:(BOOL)a3;
- (void)setHasPluginCrashCount:(BOOL)a3;
- (void)setHasPluginReturnedFalseCount:(BOOL)a3;
- (void)setHasPluginWatchdogCount:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMigratedAfterUpgrade:(BOOL)a3;
- (void)setMigratedFromBackup:(BOOL)a3;
- (void)setMigratedFromBackupSourceDifferentDevice:(BOOL)a3;
- (void)setMigratedFromBackupSourceiCloud:(BOOL)a3;
- (void)setPluginCrashCount:(unsigned int)a3;
- (void)setPluginReturnedFalseCount:(unsigned int)a3;
- (void)setPluginWatchdogCount:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation DMDataMigratorMigrationStatistics

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setFastPluginDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_fastPluginDuration = a3;
}

- (void)setHasFastPluginDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasFastPluginDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setPluginCrashCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_pluginCrashCount = a3;
}

- (void)setHasPluginCrashCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPluginCrashCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setPluginWatchdogCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_pluginWatchdogCount = a3;
}

- (void)setHasPluginWatchdogCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPluginWatchdogCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPluginReturnedFalseCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_pluginReturnedFalseCount = a3;
}

- (void)setHasPluginReturnedFalseCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPluginReturnedFalseCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasBuildMigratedFrom
{
  return self->_buildMigratedFrom != 0LL;
}

- (void)setMigratedAfterUpgrade:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_migratedAfterUpgrade = a3;
}

- (void)setHasMigratedAfterUpgrade:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMigratedAfterUpgrade
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setMigratedFromBackup:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_migratedFromBackup = a3;
}

- (void)setHasMigratedFromBackup:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMigratedFromBackup
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setMigratedFromBackupSourceDifferentDevice:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_migratedFromBackupSourceDifferentDevice = a3;
}

- (void)setHasMigratedFromBackupSourceDifferentDevice:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMigratedFromBackupSourceDifferentDevice
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setMigratedFromBackupSourceiCloud:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_migratedFromBackupSourceiCloud = a3;
}

- (void)setHasMigratedFromBackupSourceiCloud:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasMigratedFromBackupSourceiCloud
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DMDataMigratorMigrationStatistics;
  id v3 = -[DMDataMigratorMigrationStatistics description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDataMigratorMigrationStatistics dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int16 has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_timestamp));
    [v3 setObject:v10 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }

  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_duration));
  [v3 setObject:v11 forKey:@"duration"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }

- (BOOL)readFrom:(id)a3
{
  return DMDataMigratorMigrationStatisticsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v7, self->_timestamp, 1LL);
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }

  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteUint32Field(v7, self->_duration, 2LL);
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 24) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }

  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)v4 + 6) = self->_duration;
  *((_WORD *)v4 + 24) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  __int16 v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 24) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }

  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }

  *((_DWORD *)v5 + 6) = self->_duration;
  *((_WORD *)v5 + 24) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 24);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_62;
    }
  }

  else if ((v7 & 1) != 0)
  {
    goto LABEL_62;
  }

  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_duration != *((_DWORD *)v4 + 6)) {
      goto LABEL_62;
    }
  }

  else if ((v7 & 2) != 0)
  {
    goto LABEL_62;
  }

  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_fastPluginDuration != *((_DWORD *)v4 + 7)) {
      goto LABEL_62;
    }
  }

  else if ((v7 & 4) != 0)
  {
    goto LABEL_62;
  }

  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_pluginCrashCount != *((_DWORD *)v4 + 8)) {
      goto LABEL_62;
    }
  }

  else if ((v7 & 8) != 0)
  {
    goto LABEL_62;
  }

  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_pluginWatchdogCount != *((_DWORD *)v4 + 10)) {
      goto LABEL_62;
    }
  }

  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_62;
  }

  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_pluginReturnedFalseCount != *((_DWORD *)v4 + 9)) {
      goto LABEL_62;
    }
  }

  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_62;
  }

  buildMigratedFrom = self->_buildMigratedFrom;
  if ((unint64_t)buildMigratedFrom | *((void *)v4 + 2))
  {
    __int16 has = (__int16)self->_has;
  }

  __int16 v9 = *((_WORD *)v4 + 24);
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0) {
      goto LABEL_62;
    }
    if (self->_migratedAfterUpgrade)
    {
      if (!*((_BYTE *)v4 + 44)) {
        goto LABEL_62;
      }
    }

    else if (*((_BYTE *)v4 + 44))
    {
      goto LABEL_62;
    }
  }

  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_62;
  }

  if ((has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0) {
      goto LABEL_62;
    }
    if (self->_migratedFromBackup)
    {
      if (!*((_BYTE *)v4 + 45)) {
        goto LABEL_62;
      }
    }

    else if (*((_BYTE *)v4 + 45))
    {
      goto LABEL_62;
    }
  }

  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_62;
  }

  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 24) & 0x100) == 0) {
      goto LABEL_62;
    }
    if (self->_migratedFromBackupSourceDifferentDevice)
    {
      if (!*((_BYTE *)v4 + 46)) {
        goto LABEL_62;
      }
    }

    else if (*((_BYTE *)v4 + 46))
    {
      goto LABEL_62;
    }
  }

  else if ((*((_WORD *)v4 + 24) & 0x100) != 0)
  {
    goto LABEL_62;
  }

  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 24) & 0x200) != 0)
    {
      if (self->_migratedFromBackupSourceiCloud)
      {
        if (!*((_BYTE *)v4 + 47)) {
          goto LABEL_62;
        }
      }

      else if (*((_BYTE *)v4 + 47))
      {
        goto LABEL_62;
      }

      BOOL v10 = 1;
      goto LABEL_63;
    }

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    unint64_t v4 = 2654435761u * self->_timestamp;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761LL * self->_duration;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  else
  {
    unint64_t v4 = 0LL;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }

  uint64_t v5 = 0LL;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761LL * self->_fastPluginDuration;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 24);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }

  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }

  self->_duration = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)duration
{
  return self->_duration;
}

- (unsigned)fastPluginDuration
{
  return self->_fastPluginDuration;
}

- (unsigned)pluginCrashCount
{
  return self->_pluginCrashCount;
}

- (unsigned)pluginWatchdogCount
{
  return self->_pluginWatchdogCount;
}

- (unsigned)pluginReturnedFalseCount
{
  return self->_pluginReturnedFalseCount;
}

- (NSString)buildMigratedFrom
{
  return self->_buildMigratedFrom;
}

- (void)setBuildMigratedFrom:(id)a3
{
}

- (BOOL)migratedAfterUpgrade
{
  return self->_migratedAfterUpgrade;
}

- (BOOL)migratedFromBackup
{
  return self->_migratedFromBackup;
}

- (BOOL)migratedFromBackupSourceDifferentDevice
{
  return self->_migratedFromBackupSourceDifferentDevice;
}

- (BOOL)migratedFromBackupSourceiCloud
{
  return self->_migratedFromBackupSourceiCloud;
}

- (void).cxx_destruct
{
}

@end