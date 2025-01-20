@interface PPSPBMetric
- (BOOL)dmaCompliant;
- (BOOL)filterEntryLogging;
- (BOOL)hasAuxiliaryType;
- (BOOL)hasBuild;
- (BOOL)hasCadence;
- (BOOL)hasCategory;
- (BOOL)hasDatatype;
- (BOOL)hasDeviceCapability;
- (BOOL)hasDirectionality;
- (BOOL)hasDmaCompliant;
- (BOOL)hasEnabledPopulation;
- (BOOL)hasEnumMapping;
- (BOOL)hasExampleValue;
- (BOOL)hasFilterEntryLogging;
- (BOOL)hasFixedArraySize;
- (BOOL)hasGroupBy;
- (BOOL)hasMetricDescription;
- (BOOL)hasMetricType;
- (BOOL)hasMode;
- (BOOL)hasName;
- (BOOL)hasObfuscation;
- (BOOL)hasPrivacyClassification;
- (BOOL)hasRounding;
- (BOOL)hasSource;
- (BOOL)hasStorage;
- (BOOL)hasSubsystem;
- (BOOL)hasTimeToLive;
- (BOOL)hasUnit;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)build;
- (NSString)category;
- (NSString)exampleValue;
- (NSString)metricDescription;
- (NSString)name;
- (NSString)subsystem;
- (PPSPBCadence)cadence;
- (PPSPBEnumMapping)enumMapping;
- (PPSPBGroupingDimensions)groupBy;
- (PPSPBMetricType)metricType;
- (PPSPBRounding)rounding;
- (PPSPBSource)source;
- (PPSPBUnit)unit;
- (double)version;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)auxiliaryType;
- (int)datatype;
- (int)deviceCapability;
- (int)directionality;
- (int)enabledPopulation;
- (int)mode;
- (int)obfuscation;
- (int)privacyClassification;
- (int)storage;
- (unint64_t)hash;
- (unsigned)fixedArraySize;
- (unsigned)timeToLive;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuxiliaryType:(int)a3;
- (void)setBuild:(id)a3;
- (void)setCadence:(id)a3;
- (void)setCategory:(id)a3;
- (void)setDatatype:(int)a3;
- (void)setDeviceCapability:(int)a3;
- (void)setDirectionality:(int)a3;
- (void)setDmaCompliant:(BOOL)a3;
- (void)setEnabledPopulation:(int)a3;
- (void)setEnumMapping:(id)a3;
- (void)setExampleValue:(id)a3;
- (void)setFilterEntryLogging:(BOOL)a3;
- (void)setFixedArraySize:(unsigned int)a3;
- (void)setGroupBy:(id)a3;
- (void)setHasAuxiliaryType:(BOOL)a3;
- (void)setHasDatatype:(BOOL)a3;
- (void)setHasDeviceCapability:(BOOL)a3;
- (void)setHasDirectionality:(BOOL)a3;
- (void)setHasDmaCompliant:(BOOL)a3;
- (void)setHasEnabledPopulation:(BOOL)a3;
- (void)setHasFilterEntryLogging:(BOOL)a3;
- (void)setHasFixedArraySize:(BOOL)a3;
- (void)setHasMode:(BOOL)a3;
- (void)setHasObfuscation:(BOOL)a3;
- (void)setHasPrivacyClassification:(BOOL)a3;
- (void)setHasStorage:(BOOL)a3;
- (void)setHasTimeToLive:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setMetricDescription:(id)a3;
- (void)setMetricType:(id)a3;
- (void)setMode:(int)a3;
- (void)setName:(id)a3;
- (void)setObfuscation:(int)a3;
- (void)setPrivacyClassification:(int)a3;
- (void)setRounding:(id)a3;
- (void)setSource:(id)a3;
- (void)setStorage:(int)a3;
- (void)setSubsystem:(id)a3;
- (void)setTimeToLive:(unsigned int)a3;
- (void)setUnit:(id)a3;
- (void)setVersion:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPSPBMetric

- (BOOL)hasName
{
  return self->_name != 0LL;
}

- (BOOL)hasSubsystem
{
  return self->_subsystem != 0LL;
}

- (BOOL)hasCategory
{
  return self->_category != 0LL;
}

- (void)setVersion:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasVersion
{
  return *(_WORD *)&self->_has & 1;
}

- (int)datatype
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_datatype;
  }
  else {
    return 0;
  }
}

- (void)setDatatype:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_datatype = a3;
}

- (void)setHasDatatype:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDatatype
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasUnit
{
  return self->_unit != 0LL;
}

- (BOOL)hasCadence
{
  return self->_cadence != 0LL;
}

- (int)directionality
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_directionality;
  }
  else {
    return 0;
  }
}

- (void)setDirectionality:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_directionality = a3;
}

- (void)setHasDirectionality:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDirectionality
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (int)storage
{
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    return self->_storage;
  }
  else {
    return 0;
  }
}

- (void)setStorage:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_storage = a3;
}

- (void)setHasStorage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasStorage
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setTimeToLive:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_timeToLive = a3;
}

- (void)setHasTimeToLive:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTimeToLive
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (int)mode
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_mode;
  }
  else {
    return 4;
  }
}

- (void)setMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_mode = a3;
}

- (void)setHasMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMode
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasSource
{
  return self->_source != 0LL;
}

- (int)deviceCapability
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_deviceCapability;
  }
  else {
    return 0;
  }
}

- (void)setDeviceCapability:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_deviceCapability = a3;
}

- (void)setHasDeviceCapability:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDeviceCapability
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)enabledPopulation
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_enabledPopulation;
  }
  else {
    return 0;
  }
}

- (void)setEnabledPopulation:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_enabledPopulation = a3;
}

- (void)setHasEnabledPopulation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasEnabledPopulation
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasRounding
{
  return self->_rounding != 0LL;
}

- (int)obfuscation
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_obfuscation;
  }
  else {
    return 0;
  }
}

- (void)setObfuscation:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_obfuscation = a3;
}

- (void)setHasObfuscation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasObfuscation
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasMetricDescription
{
  return self->_metricDescription != 0LL;
}

- (BOOL)hasExampleValue
{
  return self->_exampleValue != 0LL;
}

- (BOOL)hasBuild
{
  return self->_build != 0LL;
}

- (int)privacyClassification
{
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    return self->_privacyClassification;
  }
  else {
    return 0;
  }
}

- (void)setPrivacyClassification:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_privacyClassification = a3;
}

- (void)setHasPrivacyClassification:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPrivacyClassification
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (BOOL)hasEnumMapping
{
  return self->_enumMapping != 0LL;
}

- (BOOL)hasGroupBy
{
  return self->_groupBy != 0LL;
}

- (BOOL)hasMetricType
{
  return self->_metricType != 0LL;
}

- (int)auxiliaryType
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_auxiliaryType;
  }
  else {
    return 0;
  }
}

- (void)setAuxiliaryType:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_auxiliaryType = a3;
}

- (void)setHasAuxiliaryType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAuxiliaryType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setFilterEntryLogging:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_filterEntryLogging = a3;
}

- (void)setHasFilterEntryLogging:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasFilterEntryLogging
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setDmaCompliant:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_dmaCompliant = a3;
}

- (void)setHasDmaCompliant:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasDmaCompliant
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setFixedArraySize:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_fixedArraySize = a3;
}

- (void)setHasFixedArraySize:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFixedArraySize
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  __int16 v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PPSPBMetric;
  v4 = -[PPSPBMetric description](&v8, sel_description);
  v5 = -[PPSPBMetric dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  subsystem = self->_subsystem;
  if (subsystem) {
    [v4 setObject:subsystem forKey:@"subsystem"];
  }
  category = self->_category;
  if (category) {
    [v4 setObject:category forKey:@"category"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithDouble:self->_version];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v9 forKey:@"version"];

    __int16 has = (__int16)self->_has;
  }

  if ((has & 4) != 0)
  {
    [MEMORY[0x189607968] numberWithInt:self->_datatype];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v10 forKey:@"datatype"];
  }

  unit = self->_unit;
  if (unit)
  {
    v12 = -[PPSPBUnit dictionaryRepresentation](unit, "dictionaryRepresentation");
    [v4 setObject:v12 forKey:@"unit"];
  }

  cadence = self->_cadence;
  if (cadence)
  {
    v14 = -[PPSPBCadence dictionaryRepresentation](cadence, "dictionaryRepresentation");
    [v4 setObject:v14 forKey:@"cadence"];
  }

  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x10) != 0)
  {
    [MEMORY[0x189607968] numberWithInt:self->_directionality];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v38 forKey:@"directionality"];

    __int16 v15 = (__int16)self->_has;
    if ((v15 & 0x400) == 0)
    {
LABEL_17:
      if ((v15 & 0x800) == 0) {
        goto LABEL_18;
      }
      goto LABEL_52;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_17;
  }

  [MEMORY[0x189607968] numberWithInt:self->_storage];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v39 forKey:@"storage"];

  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x800) == 0)
  {
LABEL_18:
    if ((v15 & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

- (BOOL)readFrom:(id)a3
{
  return PPSPBMetricReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }

  if (self->_subsystem)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }

  if (self->_category)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }

  __int16 has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v9;
    __int16 has = (__int16)self->_has;
  }

  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
  }

  if (self->_unit)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v9;
  }

  if (self->_cadence)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v9;
  }

  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x400) == 0)
    {
LABEL_17:
      if ((v6 & 0x800) == 0) {
        goto LABEL_18;
      }
      goto LABEL_52;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_17;
  }

  PBDataWriterWriteInt32Field();
  id v4 = v9;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
LABEL_18:
    if ((v6 & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v9;
  }

  if (self->_subsystem)
  {
    objc_msgSend(v9, "setSubsystem:");
    id v4 = v9;
  }

  if (self->_category)
  {
    objc_msgSend(v9, "setCategory:");
    id v4 = v9;
  }

  __int16 has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((void *)v4 + 1) = *(void *)&self->_version;
    *((_WORD *)v4 + 94) |= 1u;
    __int16 has = (__int16)self->_has;
  }

  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_datatype;
    *((_WORD *)v4 + 94) |= 4u;
  }

  if (self->_unit)
  {
    objc_msgSend(v9, "setUnit:");
    id v4 = v9;
  }

  if (self->_cadence)
  {
    objc_msgSend(v9, "setCadence:");
    id v4 = v9;
  }

  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_directionality;
    *((_WORD *)v4 + 94) |= 0x10u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x400) == 0)
    {
LABEL_17:
      if ((v6 & 0x800) == 0) {
        goto LABEL_18;
      }
      goto LABEL_52;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_17;
  }

  *((_DWORD *)v4 + 38) = self->_storage;
  *((_WORD *)v4 + 94) |= 0x400u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
LABEL_18:
    if ((v6 & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  __int16 v7 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v6;

  uint64_t v8 = -[NSString copyWithZone:](self->_subsystem, "copyWithZone:", a3);
  id v9 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v8;

  uint64_t v10 = -[NSString copyWithZone:](self->_category, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  __int16 has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_version;
    *(_WORD *)(v5 + 188) |= 1u;
    __int16 has = (__int16)self->_has;
  }

  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_datatype;
    *(_WORD *)(v5 + 188) |= 4u;
  }

  id v13 = -[PPSPBUnit copyWithZone:](self->_unit, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v13;

  id v15 = -[PPSPBCadence copyWithZone:](self->_cadence, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v15;

  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_directionality;
    *(_WORD *)(v5 + 188) |= 0x10u;
    __int16 v17 = (__int16)self->_has;
    if ((v17 & 0x400) == 0)
    {
LABEL_7:
      if ((v17 & 0x800) == 0) {
        goto LABEL_8;
      }
      goto LABEL_26;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_7;
  }

  *(_DWORD *)(v5 + 152) = self->_storage;
  *(_WORD *)(v5 + 188) |= 0x400u;
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x800) == 0)
  {
LABEL_8:
    if ((v17 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 15))
  {
  }

  subsystem = self->_subsystem;
  if ((unint64_t)subsystem | *((void *)v4 + 20))
  {
  }

  category = self->_category;
  if ((unint64_t)category | *((void *)v4 + 5))
  {
  }

  __int16 has = (__int16)self->_has;
  __int16 v9 = *((_WORD *)v4 + 94);
  if ((has & 1) != 0)
  {
  }

  else if ((v9 & 1) != 0)
  {
    goto LABEL_106;
  }

  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_datatype != *((_DWORD *)v4 + 12)) {
      goto LABEL_106;
    }
  }

  else if ((v9 & 4) != 0)
  {
    goto LABEL_106;
  }

  unit = self->_unit;
  cadence = self->_cadence;
  if ((unint64_t)cadence | *((void *)v4 + 4))
  {
    if (!-[PPSPBCadence isEqual:](cadence, "isEqual:")) {
      goto LABEL_106;
    }
  }

  __int16 v12 = (__int16)self->_has;
  __int16 v13 = *((_WORD *)v4 + 94);
  if ((v12 & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_directionality != *((_DWORD *)v4 + 14)) {
      goto LABEL_106;
    }
  }

  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_106;
  }

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x400) == 0 || self->_storage != *((_DWORD *)v4 + 38)) {
      goto LABEL_106;
    }
  }

  else if ((*((_WORD *)v4 + 94) & 0x400) != 0)
  {
    goto LABEL_106;
  }

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x800) == 0 || self->_timeToLive != *((_DWORD *)v4 + 42)) {
      goto LABEL_106;
    }
  }

  else if ((*((_WORD *)v4 + 94) & 0x800) != 0)
  {
    goto LABEL_106;
  }

  if ((v12 & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_mode != *((_DWORD *)v4 + 28)) {
      goto LABEL_106;
    }
  }

  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_106;
  }

  source = self->_source;
  if ((unint64_t)source | *((void *)v4 + 18))
  {
    if (!-[PPSPBSource isEqual:](source, "isEqual:")) {
      goto LABEL_106;
    }
    __int16 v12 = (__int16)self->_has;
  }

  __int16 v15 = *((_WORD *)v4 + 94);
  if ((v12 & 8) != 0)
  {
    if ((v15 & 8) == 0 || self->_deviceCapability != *((_DWORD *)v4 + 13)) {
      goto LABEL_106;
    }
  }

  else if ((v15 & 8) != 0)
  {
    goto LABEL_106;
  }

  if ((v12 & 0x20) != 0)
  {
    if ((v15 & 0x20) == 0 || self->_enabledPopulation != *((_DWORD *)v4 + 15)) {
      goto LABEL_106;
    }
  }

  else if ((v15 & 0x20) != 0)
  {
    goto LABEL_106;
  }

  rounding = self->_rounding;
  if ((unint64_t)rounding | *((void *)v4 + 17))
  {
    if (!-[PPSPBRounding isEqual:](rounding, "isEqual:")) {
      goto LABEL_106;
    }
    __int16 v12 = (__int16)self->_has;
  }

  if ((v12 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x100) == 0 || self->_obfuscation != *((_DWORD *)v4 + 32)) {
      goto LABEL_106;
    }
  }

  else if ((*((_WORD *)v4 + 94) & 0x100) != 0)
  {
    goto LABEL_106;
  }

  metricDescription = self->_metricDescription;
  if ((unint64_t)metricDescription | *((void *)v4 + 12)
    && !-[NSString isEqual:](metricDescription, "isEqual:"))
  {
    goto LABEL_106;
  }

  exampleValue = self->_exampleValue;
  if ((unint64_t)exampleValue | *((void *)v4 + 9))
  {
  }

  build = self->_build;
  if ((unint64_t)build | *((void *)v4 + 3))
  {
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x200) == 0 || self->_privacyClassification != *((_DWORD *)v4 + 33)) {
      goto LABEL_106;
    }
  }

  else if ((*((_WORD *)v4 + 94) & 0x200) != 0)
  {
    goto LABEL_106;
  }

  enumMapping = self->_enumMapping;
  groupBy = self->_groupBy;
  if ((unint64_t)groupBy | *((void *)v4 + 11))
  {
    if (!-[PPSPBGroupingDimensions isEqual:](groupBy, "isEqual:")) {
      goto LABEL_106;
    }
  }

  metricType = self->_metricType;
  if ((unint64_t)metricType | *((void *)v4 + 13))
  {
    if (!-[PPSPBMetricType isEqual:](metricType, "isEqual:")) {
      goto LABEL_106;
    }
  }

  __int16 v23 = (__int16)self->_has;
  __int16 v24 = *((_WORD *)v4 + 94);
  if ((v23 & 2) != 0)
  {
    if ((v24 & 2) == 0 || self->_auxiliaryType != *((_DWORD *)v4 + 4)) {
      goto LABEL_106;
    }
  }

  else if ((v24 & 2) != 0)
  {
    goto LABEL_106;
  }

  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x2000) == 0) {
      goto LABEL_106;
    }
    if (self->_filterEntryLogging)
    {
      if (!*((_BYTE *)v4 + 185)) {
        goto LABEL_106;
      }
    }

    else if (*((_BYTE *)v4 + 185))
    {
      goto LABEL_106;
    }
  }

  else if ((*((_WORD *)v4 + 94) & 0x2000) != 0)
  {
    goto LABEL_106;
  }

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x1000) != 0)
    {
      if (self->_dmaCompliant)
      {
        if (!*((_BYTE *)v4 + 184)) {
          goto LABEL_106;
        }
        goto LABEL_101;
      }

      if (!*((_BYTE *)v4 + 184)) {
        goto LABEL_101;
      }
    }

- (unint64_t)hash
{
  NSUInteger v39 = -[NSString hash](self->_name, "hash");
  NSUInteger v38 = -[NSString hash](self->_subsystem, "hash");
  NSUInteger v37 = -[NSString hash](self->_category, "hash");
  __int16 has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    double version = self->_version;
    double v6 = -version;
    if (version >= 0.0) {
      double v6 = self->_version;
    }
    double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }

    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  unint64_t v36 = v4;
  if ((has & 4) != 0) {
    uint64_t v35 = 2654435761LL * self->_datatype;
  }
  else {
    uint64_t v35 = 0LL;
  }
  unint64_t v34 = -[PPSPBUnit hash](self->_unit, "hash");
  unint64_t v33 = -[PPSPBCadence hash](self->_cadence, "hash");
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x10) != 0)
  {
    uint64_t v32 = 2654435761LL * self->_directionality;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_14:
      uint64_t v31 = 2654435761LL * self->_storage;
      if ((*(_WORD *)&self->_has & 0x800) != 0) {
        goto LABEL_15;
      }
LABEL_19:
      uint64_t v30 = 0LL;
      if ((v9 & 0x80) != 0) {
        goto LABEL_16;
      }
      goto LABEL_20;
    }
  }

  else
  {
    uint64_t v32 = 0LL;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_14;
    }
  }

  uint64_t v31 = 0LL;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_19;
  }
LABEL_15:
  uint64_t v30 = 2654435761LL * self->_timeToLive;
  if ((v9 & 0x80) != 0)
  {
LABEL_16:
    uint64_t v29 = 2654435761LL * self->_mode;
    goto LABEL_21;
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v23 = v4;
  if (*((void *)v4 + 15))
  {
    -[PPSPBMetric setName:](self, "setName:");
    id v4 = v23;
  }

  if (*((void *)v4 + 20))
  {
    -[PPSPBMetric setSubsystem:](self, "setSubsystem:");
    id v4 = v23;
  }

  if (*((void *)v4 + 5))
  {
    -[PPSPBMetric setCategory:](self, "setCategory:");
    id v4 = v23;
  }

  __int16 v5 = *((_WORD *)v4 + 94);
  if ((v5 & 1) != 0)
  {
    self->_double version = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 94);
  }

  if ((v5 & 4) != 0)
  {
    self->_datatype = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 4u;
  }

  unit = self->_unit;
  uint64_t v7 = *((void *)v4 + 22);
  if (unit)
  {
    if (!v7) {
      goto LABEL_17;
    }
    -[PPSPBUnit mergeFrom:](unit, "mergeFrom:");
  }

  else
  {
    if (!v7) {
      goto LABEL_17;
    }
    -[PPSPBMetric setUnit:](self, "setUnit:");
  }

  id v4 = v23;
LABEL_17:
  cadence = self->_cadence;
  uint64_t v9 = *((void *)v4 + 4);
  if (cadence)
  {
    if (!v9) {
      goto LABEL_23;
    }
    -[PPSPBCadence mergeFrom:](cadence, "mergeFrom:");
  }

  else
  {
    if (!v9) {
      goto LABEL_23;
    }
    -[PPSPBMetric setCadence:](self, "setCadence:");
  }

  id v4 = v23;
LABEL_23:
  __int16 v10 = *((_WORD *)v4 + 94);
  if ((v10 & 0x10) != 0)
  {
    self->_directionality = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v10 = *((_WORD *)v4 + 94);
    if ((v10 & 0x400) == 0)
    {
LABEL_25:
      if ((v10 & 0x800) == 0) {
        goto LABEL_26;
      }
      goto LABEL_33;
    }
  }

  else if ((*((_WORD *)v4 + 94) & 0x400) == 0)
  {
    goto LABEL_25;
  }

  self->_storage = *((_DWORD *)v4 + 38);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v10 = *((_WORD *)v4 + 94);
  if ((v10 & 0x800) == 0)
  {
LABEL_26:
    if ((v10 & 0x80) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (void)setSubsystem:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (double)version
{
  return self->_version;
}

- (PPSPBUnit)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
}

- (PPSPBCadence)cadence
{
  return self->_cadence;
}

- (void)setCadence:(id)a3
{
}

- (unsigned)timeToLive
{
  return self->_timeToLive;
}

- (PPSPBSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (PPSPBRounding)rounding
{
  return self->_rounding;
}

- (void)setRounding:(id)a3
{
}

- (NSString)metricDescription
{
  return self->_metricDescription;
}

- (void)setMetricDescription:(id)a3
{
}

- (NSString)exampleValue
{
  return self->_exampleValue;
}

- (void)setExampleValue:(id)a3
{
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
}

- (PPSPBEnumMapping)enumMapping
{
  return self->_enumMapping;
}

- (void)setEnumMapping:(id)a3
{
}

- (PPSPBGroupingDimensions)groupBy
{
  return self->_groupBy;
}

- (void)setGroupBy:(id)a3
{
}

- (PPSPBMetricType)metricType
{
  return self->_metricType;
}

- (void)setMetricType:(id)a3
{
}

- (BOOL)filterEntryLogging
{
  return self->_filterEntryLogging;
}

- (BOOL)dmaCompliant
{
  return self->_dmaCompliant;
}

- (unsigned)fixedArraySize
{
  return self->_fixedArraySize;
}

- (void).cxx_destruct
{
}

@end