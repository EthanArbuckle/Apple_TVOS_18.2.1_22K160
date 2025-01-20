@interface _ADPBDeviceOutputVoiceInfo
- (AFVoiceInfo)_ad_voiceInfo;
- (BOOL)hasGender;
- (BOOL)hasLanguageCode;
- (BOOL)hasVoiceName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)languageCode;
- (NSString)voiceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)genderAsString:(int)a3;
- (int)StringAsGender:(id)a3;
- (int)gender;
- (unint64_t)hash;
- (void)_ad_setVoiceInfo:(id)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGender:(int)a3;
- (void)setHasGender:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setVoiceName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _ADPBDeviceOutputVoiceInfo

- (BOOL)hasLanguageCode
{
  return self->_languageCode != 0LL;
}

- (int)gender
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_gender;
  }
  else {
    return 0;
  }
}

- (void)setGender:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_gender = a3;
}

- (void)setHasGender:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGender
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)genderAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return *(&off_1004F2158 + a3);
  }
}

- (int)StringAsGender:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"MALE"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"FEMALE"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"NEUTRAL"])
  {
    int v4 = 3;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasVoiceName
{
  return self->_voiceName != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____ADPBDeviceOutputVoiceInfo;
  id v3 = -[_ADPBDeviceOutputVoiceInfo description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceOutputVoiceInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v4 = v3;
  languageCode = self->_languageCode;
  if (languageCode) {
    [v3 setObject:languageCode forKey:@"language_code"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t gender = self->_gender;
    if (gender >= 4) {
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_gender));
    }
    else {
      v7 = *(&off_1004F2158 + gender);
    }
    [v4 setObject:v7 forKey:@"gender"];
  }

  voiceName = self->_voiceName;
  if (voiceName) {
    [v4 setObject:voiceName forKey:@"voice_name"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100121C3C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  languageCode = self->_languageCode;
  id v7 = v4;
  if (languageCode)
  {
    PBDataWriterWriteStringField(v4, languageCode, 1LL);
    id v4 = v7;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v7, self->_gender, 2LL);
    id v4 = v7;
  }

  voiceName = self->_voiceName;
  if (voiceName)
  {
    PBDataWriterWriteStringField(v7, voiceName, 3LL);
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_languageCode)
  {
    objc_msgSend(v4, "setLanguageCode:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_gender;
    *((_BYTE *)v4 + 32) |= 1u;
  }

  if (self->_voiceName)
  {
    objc_msgSend(v5, "setVoiceName:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_languageCode, "copyWithZone:", a3);
  id v7 = (void *)v5[2];
  v5[2] = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_gender;
    *((_BYTE *)v5 + 32) |= 1u;
  }

  id v8 = -[NSString copyWithZone:](self->_voiceName, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  languageCode = self->_languageCode;
  if ((unint64_t)languageCode | *((void *)v4 + 2))
  {
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_gender != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    unsigned __int8 v7 = 0;
    goto LABEL_12;
  }

  voiceName = self->_voiceName;
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_languageCode, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v4 = 2654435761LL * self->_gender;
  }
  else {
    uint64_t v4 = 0LL;
  }
  return v4 ^ v3 ^ -[NSString hash](self->_voiceName, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  id v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[_ADPBDeviceOutputVoiceInfo setLanguageCode:](self, "setLanguageCode:");
    uint64_t v4 = v5;
  }

  if ((v4[8] & 1) != 0)
  {
    self->_uint64_t gender = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 3))
  {
    -[_ADPBDeviceOutputVoiceInfo setVoiceName:](self, "setVoiceName:");
    uint64_t v4 = v5;
  }
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (void)setVoiceName:(id)a3
{
}

- (void).cxx_destruct
{
}

- (AFVoiceInfo)_ad_voiceInfo
{
  NSUInteger v3 = objc_alloc(&OBJC_CLASS___AFVoiceInfo);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceOutputVoiceInfo languageCode](self, "languageCode"));
  uint64_t v5 = -[_ADPBDeviceOutputVoiceInfo gender](self, "gender") - 1;
  else {
    uint64_t v6 = 0LL;
  }
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceOutputVoiceInfo voiceName](self, "voiceName"));
  id v8 = -[AFVoiceInfo initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:]( v3,  "initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:",  v4,  v6,  1LL,  v7,  0LL,  0LL,  0LL);

  return v8;
}

- (void)_ad_setVoiceInfo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v8 languageCode]);
  -[_ADPBDeviceOutputVoiceInfo setLanguageCode:](self, "setLanguageCode:", v4);

  uint64_t v5 = (char *)[v8 gender] - 1;
  else {
    uint64_t v6 = 0LL;
  }
  -[_ADPBDeviceOutputVoiceInfo setGender:](self, "setGender:", v6);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
  -[_ADPBDeviceOutputVoiceInfo setVoiceName:](self, "setVoiceName:", v7);
}

@end