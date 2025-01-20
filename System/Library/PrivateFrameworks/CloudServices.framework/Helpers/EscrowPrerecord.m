@interface EscrowPrerecord
+ (id)createPrerecordFromCandidate:(id)a3 storedCertificate:(id)a4 request:(id)a5 error:(id *)a6;
- (BOOL)hasBottleID;
- (BOOL)hasDsid;
- (BOOL)hasDuplicateEscrowBlob;
- (BOOL)hasEscrowBaseURL;
- (BOOL)hasEscrowBlob;
- (BOOL)hasEscrowedSPKI;
- (BOOL)hasICloudEnvironment;
- (BOOL)hasPasscodeGeneration;
- (BOOL)hasPassphraseType;
- (BOOL)hasSosBackupKeybagDigest;
- (BOOL)hasSosBackupKeybagPassword;
- (BOOL)hasSosPeerID;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (EscrowPrerecord)initWithCandidate:(id)a3 certificate:(id)a4 escrowBlob:(id)a5 passphraseType:(int)a6;
- (EscrowPrerecordPasscodeGeneration)passcodeGeneration;
- (NSData)duplicateEscrowBlob;
- (NSData)escrowBlob;
- (NSData)escrowedSPKI;
- (NSData)sosBackupKeybagDigest;
- (NSData)sosBackupKeybagPassword;
- (NSString)bottleID;
- (NSString)dsid;
- (NSString)escrowBaseURL;
- (NSString)iCloudEnvironment;
- (NSString)sosPeerID;
- (NSString)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)passphraseTypeAsString:(int)a3;
- (int)StringAsPassphraseType:(id)a3;
- (int)passphraseType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBottleID:(id)a3;
- (void)setDsid:(id)a3;
- (void)setDuplicateEscrowBlob:(id)a3;
- (void)setEscrowBaseURL:(id)a3;
- (void)setEscrowBlob:(id)a3;
- (void)setEscrowedSPKI:(id)a3;
- (void)setHasPassphraseType:(BOOL)a3;
- (void)setICloudEnvironment:(id)a3;
- (void)setPasscodeGeneration:(id)a3;
- (void)setPassphraseType:(int)a3;
- (void)setSosBackupKeybagDigest:(id)a3;
- (void)setSosBackupKeybagPassword:(id)a3;
- (void)setSosPeerID:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation EscrowPrerecord

- (BOOL)hasICloudEnvironment
{
  return self->_iCloudEnvironment != 0LL;
}

- (BOOL)hasEscrowBaseURL
{
  return self->_escrowBaseURL != 0LL;
}

- (BOOL)hasDsid
{
  return self->_dsid != 0LL;
}

- (BOOL)hasEscrowBlob
{
  return self->_escrowBlob != 0LL;
}

- (BOOL)hasSosPeerID
{
  return self->_sosPeerID != 0LL;
}

- (BOOL)hasSosBackupKeybagPassword
{
  return self->_sosBackupKeybagPassword != 0LL;
}

- (BOOL)hasSosBackupKeybagDigest
{
  return self->_sosBackupKeybagDigest != 0LL;
}

- (BOOL)hasTimestamp
{
  return self->_timestamp != 0LL;
}

- (BOOL)hasBottleID
{
  return self->_bottleID != 0LL;
}

- (BOOL)hasEscrowedSPKI
{
  return self->_escrowedSPKI != 0LL;
}

- (int)passphraseType
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_passphraseType;
  }
  else {
    return 0;
  }
}

- (void)setPassphraseType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_passphraseType = a3;
}

- (void)setHasPassphraseType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPassphraseType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)passphraseTypeAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return off_100069AE0[a3];
  }
}

- (int)StringAsPassphraseType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"FourDigitNumeric"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"SixDigitNumeric"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"Complex"])
  {
    int v4 = 3;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasDuplicateEscrowBlob
{
  return self->_duplicateEscrowBlob != 0LL;
}

- (BOOL)hasPasscodeGeneration
{
  return self->_passcodeGeneration != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___EscrowPrerecord;
  id v3 = -[EscrowPrerecord description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowPrerecord dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v4 = v3;
  iCloudEnvironment = self->_iCloudEnvironment;
  if (iCloudEnvironment) {
    [v3 setObject:iCloudEnvironment forKey:@"iCloudEnvironment"];
  }
  escrowBaseURL = self->_escrowBaseURL;
  if (escrowBaseURL) {
    [v4 setObject:escrowBaseURL forKey:@"escrowBaseURL"];
  }
  dsid = self->_dsid;
  if (dsid) {
    [v4 setObject:dsid forKey:@"dsid"];
  }
  escrowBlob = self->_escrowBlob;
  if (escrowBlob) {
    [v4 setObject:escrowBlob forKey:@"escrowBlob"];
  }
  sosPeerID = self->_sosPeerID;
  if (sosPeerID) {
    [v4 setObject:sosPeerID forKey:@"sosPeerID"];
  }
  sosBackupKeybagPassword = self->_sosBackupKeybagPassword;
  if (sosBackupKeybagPassword) {
    [v4 setObject:sosBackupKeybagPassword forKey:@"sosBackupKeybagPassword"];
  }
  sosBackupKeybagDigest = self->_sosBackupKeybagDigest;
  if (sosBackupKeybagDigest) {
    [v4 setObject:sosBackupKeybagDigest forKey:@"sosBackupKeybagDigest"];
  }
  timestamp = self->_timestamp;
  if (timestamp) {
    [v4 setObject:timestamp forKey:@"timestamp"];
  }
  bottleID = self->_bottleID;
  if (bottleID) {
    [v4 setObject:bottleID forKey:@"bottleID"];
  }
  escrowedSPKI = self->_escrowedSPKI;
  if (escrowedSPKI) {
    [v4 setObject:escrowedSPKI forKey:@"escrowedSPKI"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t passphraseType = self->_passphraseType;
    if (passphraseType >= 4) {
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_passphraseType));
    }
    else {
      v16 = off_100069AE0[passphraseType];
    }
    [v4 setObject:v16 forKey:@"passphraseType"];
  }

  duplicateEscrowBlob = self->_duplicateEscrowBlob;
  if (duplicateEscrowBlob) {
    [v4 setObject:duplicateEscrowBlob forKey:@"duplicateEscrowBlob"];
  }
  passcodeGeneration = self->_passcodeGeneration;
  if (passcodeGeneration)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( -[EscrowPrerecordPasscodeGeneration dictionaryRepresentation]( passcodeGeneration,  "dictionaryRepresentation"));
    [v4 setObject:v19 forKey:@"passcodeGeneration"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10003343C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  iCloudEnvironment = self->_iCloudEnvironment;
  id v17 = v4;
  if (iCloudEnvironment)
  {
    PBDataWriterWriteStringField(v4, iCloudEnvironment, 1LL);
    id v4 = v17;
  }

  escrowBaseURL = self->_escrowBaseURL;
  if (escrowBaseURL)
  {
    PBDataWriterWriteStringField(v17, escrowBaseURL, 2LL);
    id v4 = v17;
  }

  dsid = self->_dsid;
  if (dsid)
  {
    PBDataWriterWriteStringField(v17, dsid, 3LL);
    id v4 = v17;
  }

  escrowBlob = self->_escrowBlob;
  if (escrowBlob)
  {
    PBDataWriterWriteDataField(v17, escrowBlob, 4LL);
    id v4 = v17;
  }

  sosPeerID = self->_sosPeerID;
  if (sosPeerID)
  {
    PBDataWriterWriteStringField(v17, sosPeerID, 5LL);
    id v4 = v17;
  }

  sosBackupKeybagPassword = self->_sosBackupKeybagPassword;
  if (sosBackupKeybagPassword)
  {
    PBDataWriterWriteDataField(v17, sosBackupKeybagPassword, 6LL);
    id v4 = v17;
  }

  sosBackupKeybagDigest = self->_sosBackupKeybagDigest;
  if (sosBackupKeybagDigest)
  {
    PBDataWriterWriteDataField(v17, sosBackupKeybagDigest, 7LL);
    id v4 = v17;
  }

  timestamp = self->_timestamp;
  if (timestamp)
  {
    PBDataWriterWriteStringField(v17, timestamp, 8LL);
    id v4 = v17;
  }

  bottleID = self->_bottleID;
  if (bottleID)
  {
    PBDataWriterWriteStringField(v17, bottleID, 9LL);
    id v4 = v17;
  }

  escrowedSPKI = self->_escrowedSPKI;
  if (escrowedSPKI)
  {
    PBDataWriterWriteDataField(v17, escrowedSPKI, 10LL);
    id v4 = v17;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v17, self->_passphraseType, 11LL);
    id v4 = v17;
  }

  duplicateEscrowBlob = self->_duplicateEscrowBlob;
  if (duplicateEscrowBlob)
  {
    PBDataWriterWriteDataField(v17, duplicateEscrowBlob, 12LL);
    id v4 = v17;
  }

  passcodeGeneration = self->_passcodeGeneration;
  if (passcodeGeneration)
  {
    PBDataWriterWriteSubmessage(v17, passcodeGeneration, 13LL);
    id v4 = v17;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_iCloudEnvironment)
  {
    objc_msgSend(v4, "setICloudEnvironment:");
    id v4 = v5;
  }

  if (self->_escrowBaseURL)
  {
    objc_msgSend(v5, "setEscrowBaseURL:");
    id v4 = v5;
  }

  if (self->_dsid)
  {
    objc_msgSend(v5, "setDsid:");
    id v4 = v5;
  }

  if (self->_escrowBlob)
  {
    objc_msgSend(v5, "setEscrowBlob:");
    id v4 = v5;
  }

  if (self->_sosPeerID)
  {
    objc_msgSend(v5, "setSosPeerID:");
    id v4 = v5;
  }

  if (self->_sosBackupKeybagPassword)
  {
    objc_msgSend(v5, "setSosBackupKeybagPassword:");
    id v4 = v5;
  }

  if (self->_sosBackupKeybagDigest)
  {
    objc_msgSend(v5, "setSosBackupKeybagDigest:");
    id v4 = v5;
  }

  if (self->_timestamp)
  {
    objc_msgSend(v5, "setTimestamp:");
    id v4 = v5;
  }

  if (self->_bottleID)
  {
    objc_msgSend(v5, "setBottleID:");
    id v4 = v5;
  }

  if (self->_escrowedSPKI)
  {
    objc_msgSend(v5, "setEscrowedSPKI:");
    id v4 = v5;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_passphraseType;
    *((_BYTE *)v4 + 112) |= 1u;
  }

  if (self->_duplicateEscrowBlob)
  {
    objc_msgSend(v5, "setDuplicateEscrowBlob:");
    id v4 = v5;
  }

  if (self->_passcodeGeneration)
  {
    objc_msgSend(v5, "setPasscodeGeneration:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_iCloudEnvironment, "copyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  id v8 = -[NSString copyWithZone:](self->_escrowBaseURL, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = -[NSString copyWithZone:](self->_dsid, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  id v12 = -[NSData copyWithZone:](self->_escrowBlob, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  id v14 = -[NSString copyWithZone:](self->_sosPeerID, "copyWithZone:", a3);
  v15 = (void *)v5[12];
  v5[12] = v14;

  id v16 = -[NSData copyWithZone:](self->_sosBackupKeybagPassword, "copyWithZone:", a3);
  id v17 = (void *)v5[11];
  v5[11] = v16;

  id v18 = -[NSData copyWithZone:](self->_sosBackupKeybagDigest, "copyWithZone:", a3);
  v19 = (void *)v5[10];
  v5[10] = v18;

  id v20 = -[NSString copyWithZone:](self->_timestamp, "copyWithZone:", a3);
  v21 = (void *)v5[13];
  v5[13] = v20;

  id v22 = -[NSString copyWithZone:](self->_bottleID, "copyWithZone:", a3);
  v23 = (void *)v5[1];
  v5[1] = v22;

  id v24 = -[NSData copyWithZone:](self->_escrowedSPKI, "copyWithZone:", a3);
  v25 = (void *)v5[6];
  v5[6] = v24;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 18) = self->_passphraseType;
    *((_BYTE *)v5 + 112) |= 1u;
  }

  id v26 = -[NSData copyWithZone:](self->_duplicateEscrowBlob, "copyWithZone:", a3);
  v27 = (void *)v5[3];
  v5[3] = v26;

  id v28 = -[EscrowPrerecordPasscodeGeneration copyWithZone:](self->_passcodeGeneration, "copyWithZone:", a3);
  v29 = (void *)v5[8];
  v5[8] = v28;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  iCloudEnvironment = self->_iCloudEnvironment;
  if ((unint64_t)iCloudEnvironment | *((void *)v4 + 7))
  {
  }

  escrowBaseURL = self->_escrowBaseURL;
  if ((unint64_t)escrowBaseURL | *((void *)v4 + 4))
  {
  }

  dsid = self->_dsid;
  if ((unint64_t)dsid | *((void *)v4 + 2))
  {
  }

  escrowBlob = self->_escrowBlob;
  if ((unint64_t)escrowBlob | *((void *)v4 + 5))
  {
  }

  sosPeerID = self->_sosPeerID;
  if ((unint64_t)sosPeerID | *((void *)v4 + 12))
  {
  }

  sosBackupKeybagPassword = self->_sosBackupKeybagPassword;
  if ((unint64_t)sosBackupKeybagPassword | *((void *)v4 + 11))
  {
  }

  sosBackupKeybagDigest = self->_sosBackupKeybagDigest;
  if ((unint64_t)sosBackupKeybagDigest | *((void *)v4 + 10))
  {
  }

  timestamp = self->_timestamp;
  if ((unint64_t)timestamp | *((void *)v4 + 13))
  {
  }

  bottleID = self->_bottleID;
  if ((unint64_t)bottleID | *((void *)v4 + 1))
  {
  }

  escrowedSPKI = self->_escrowedSPKI;
  if ((unint64_t)escrowedSPKI | *((void *)v4 + 6))
  {
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 1) == 0 || self->_passphraseType != *((_DWORD *)v4 + 18)) {
      goto LABEL_31;
    }
  }

  else if ((*((_BYTE *)v4 + 112) & 1) != 0)
  {
LABEL_31:
    unsigned __int8 v18 = 0;
    goto LABEL_32;
  }

  duplicateEscrowBlob = self->_duplicateEscrowBlob;
  if ((unint64_t)duplicateEscrowBlob | *((void *)v4 + 3)
    && !-[NSData isEqual:](duplicateEscrowBlob, "isEqual:"))
  {
    goto LABEL_31;
  }

  passcodeGeneration = self->_passcodeGeneration;
  else {
    unsigned __int8 v18 = 1;
  }
LABEL_32:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_iCloudEnvironment, "hash");
  NSUInteger v4 = -[NSString hash](self->_escrowBaseURL, "hash");
  NSUInteger v5 = -[NSString hash](self->_dsid, "hash");
  unint64_t v6 = (unint64_t)-[NSData hash](self->_escrowBlob, "hash");
  NSUInteger v7 = -[NSString hash](self->_sosPeerID, "hash");
  unint64_t v8 = (unint64_t)-[NSData hash](self->_sosBackupKeybagPassword, "hash");
  unint64_t v9 = (unint64_t)-[NSData hash](self->_sosBackupKeybagDigest, "hash");
  NSUInteger v10 = -[NSString hash](self->_timestamp, "hash");
  NSUInteger v11 = -[NSString hash](self->_bottleID, "hash");
  unint64_t v12 = (unint64_t)-[NSData hash](self->_escrowedSPKI, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v13 = 2654435761LL * self->_passphraseType;
  }
  else {
    uint64_t v13 = 0LL;
  }
  NSUInteger v14 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  unint64_t v15 = (unint64_t)-[NSData hash](self->_duplicateEscrowBlob, "hash");
  return v14 ^ v15 ^ -[EscrowPrerecordPasscodeGeneration hash](self->_passcodeGeneration, "hash");
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int *)a3;
  NSUInteger v7 = v4;
  if (*((void *)v4 + 7))
  {
    -[EscrowPrerecord setICloudEnvironment:](self, "setICloudEnvironment:");
    NSUInteger v4 = v7;
  }

  if (*((void *)v4 + 4))
  {
    -[EscrowPrerecord setEscrowBaseURL:](self, "setEscrowBaseURL:");
    NSUInteger v4 = v7;
  }

  if (*((void *)v4 + 2))
  {
    -[EscrowPrerecord setDsid:](self, "setDsid:");
    NSUInteger v4 = v7;
  }

  if (*((void *)v4 + 5))
  {
    -[EscrowPrerecord setEscrowBlob:](self, "setEscrowBlob:");
    NSUInteger v4 = v7;
  }

  if (*((void *)v4 + 12))
  {
    -[EscrowPrerecord setSosPeerID:](self, "setSosPeerID:");
    NSUInteger v4 = v7;
  }

  if (*((void *)v4 + 11))
  {
    -[EscrowPrerecord setSosBackupKeybagPassword:](self, "setSosBackupKeybagPassword:");
    NSUInteger v4 = v7;
  }

  if (*((void *)v4 + 10))
  {
    -[EscrowPrerecord setSosBackupKeybagDigest:](self, "setSosBackupKeybagDigest:");
    NSUInteger v4 = v7;
  }

  if (*((void *)v4 + 13))
  {
    -[EscrowPrerecord setTimestamp:](self, "setTimestamp:");
    NSUInteger v4 = v7;
  }

  if (*((void *)v4 + 1))
  {
    -[EscrowPrerecord setBottleID:](self, "setBottleID:");
    NSUInteger v4 = v7;
  }

  if (*((void *)v4 + 6))
  {
    -[EscrowPrerecord setEscrowedSPKI:](self, "setEscrowedSPKI:");
    NSUInteger v4 = v7;
  }

  if ((v4[28] & 1) != 0)
  {
    self->_uint64_t passphraseType = v4[18];
    *(_BYTE *)&self->_has |= 1u;
  }

  if (*((void *)v4 + 3))
  {
    -[EscrowPrerecord setDuplicateEscrowBlob:](self, "setDuplicateEscrowBlob:");
    NSUInteger v4 = v7;
  }

  passcodeGeneration = self->_passcodeGeneration;
  uint64_t v6 = *((void *)v4 + 8);
  if (passcodeGeneration)
  {
    if (v6)
    {
      -[EscrowPrerecordPasscodeGeneration mergeFrom:](passcodeGeneration, "mergeFrom:");
LABEL_30:
      NSUInteger v4 = v7;
    }
  }

  else if (v6)
  {
    -[EscrowPrerecord setPasscodeGeneration:](self, "setPasscodeGeneration:");
    goto LABEL_30;
  }
}

- (NSString)iCloudEnvironment
{
  return self->_iCloudEnvironment;
}

- (void)setICloudEnvironment:(id)a3
{
}

- (NSString)escrowBaseURL
{
  return self->_escrowBaseURL;
}

- (void)setEscrowBaseURL:(id)a3
{
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSData)escrowBlob
{
  return self->_escrowBlob;
}

- (void)setEscrowBlob:(id)a3
{
}

- (NSString)sosPeerID
{
  return self->_sosPeerID;
}

- (void)setSosPeerID:(id)a3
{
}

- (NSData)sosBackupKeybagPassword
{
  return self->_sosBackupKeybagPassword;
}

- (void)setSosBackupKeybagPassword:(id)a3
{
}

- (NSData)sosBackupKeybagDigest
{
  return self->_sosBackupKeybagDigest;
}

- (void)setSosBackupKeybagDigest:(id)a3
{
}

- (NSString)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)bottleID
{
  return self->_bottleID;
}

- (void)setBottleID:(id)a3
{
}

- (NSData)escrowedSPKI
{
  return self->_escrowedSPKI;
}

- (void)setEscrowedSPKI:(id)a3
{
}

- (NSData)duplicateEscrowBlob
{
  return self->_duplicateEscrowBlob;
}

- (void)setDuplicateEscrowBlob:(id)a3
{
}

- (EscrowPrerecordPasscodeGeneration)passcodeGeneration
{
  return self->_passcodeGeneration;
}

- (void)setPasscodeGeneration:(id)a3
{
}

- (void).cxx_destruct
{
}

- (EscrowPrerecord)initWithCandidate:(id)a3 certificate:(id)a4 escrowBlob:(id)a5 passphraseType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___EscrowPrerecord;
  uint64_t v13 = -[EscrowPrerecord init](&v33, "init");
  if (v13)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v10 sosPeerID]);
    sosPeerID = v13->_sosPeerID;
    v13->_sosPeerID = (NSString *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v10 sosBackupKeybagPassword]);
    sosBackupKeybagPassword = v13->_sosBackupKeybagPassword;
    v13->_sosBackupKeybagPassword = (NSData *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v10 sosBackupKeybagDigest]);
    sosBackupKeybagDigest = v13->_sosBackupKeybagDigest;
    v13->_sosBackupKeybagDigest = (NSData *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue([v10 timestamp]);
    timestamp = v13->_timestamp;
    v13->_timestamp = (NSString *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue([v10 bottleID]);
    bottleID = v13->_bottleID;
    v13->_bottleID = (NSString *)v22;

    uint64_t v24 = objc_claimAutoreleasedReturnValue([v10 escrowedSPKI]);
    escrowedSPKI = v13->_escrowedSPKI;
    v13->_escrowedSPKI = (NSData *)v24;

    objc_storeStrong((id *)&v13->_escrowBlob, a5);
    uint64_t v26 = objc_claimAutoreleasedReturnValue([v11 dsid]);
    dsid = v13->_dsid;
    v13->_dsid = (NSString *)v26;

    uint64_t v28 = objc_claimAutoreleasedReturnValue([v11 iCloudEnvironment]);
    iCloudEnvironment = v13->_iCloudEnvironment;
    v13->_iCloudEnvironment = (NSString *)v28;

    uint64_t v30 = objc_claimAutoreleasedReturnValue([v11 escrowBaseURL]);
    escrowBaseURL = v13->_escrowBaseURL;
    v13->_escrowBaseURL = (NSString *)v30;

    -[EscrowPrerecord setPassphraseType:](v13, "setPassphraseType:", v6);
  }

  return v13;
}

+ (id)createPrerecordFromCandidate:(id)a3 storedCertificate:(id)a4 request:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 recordContents]);
  [v11 setEscrowRecord:v12];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 sosPeerID]);
  [v11 setRecordID:v13];

  uint64_t v14 = -[EscrowEnrollmentRequest initWithRequest:]( objc_alloc(&OBJC_CLASS___EscrowEnrollmentRequest),  "initWithRequest:",  v11);
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest recoveryPassphrase](v14, "recoveryPassphrase"));
  id v16 = [v15 length];

  if (v16)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 escrowCertificate]);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[EscrowService createEscrowBlobWithCertificate:escrowRequest:error:]( &OBJC_CLASS___EscrowService,  "createEscrowBlobWithCertificate:escrowRequest:error:",  v18,  v14,  a6));

    id v20 = [v11 requiresDoubleEnrollment];
    if ((_DWORD)v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v10 duplicateEscrowCertificate]);

      uint64_t v23 = CloudServicesLog(v22);
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
      if (v21)
      {
        if (v25)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "double enrollment: creating duplicate escrow blob for prerecord",  buf,  2u);
        }

        -[EscrowGenericRequest setDuplicate:](v14, "setDuplicate:", 1LL);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v10 duplicateEscrowCertificate]);
        id v52 = 0LL;
        v27 = (void *)objc_claimAutoreleasedReturnValue( +[EscrowService createEscrowBlobWithCertificate:escrowRequest:error:]( &OBJC_CLASS___EscrowService,  "createEscrowBlobWithCertificate:escrowRequest:error:",  v26,  v14,  &v52));
        uint64_t v24 = (os_log_s *)v52;

        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
        [v28 logResultForEvent:CloudServicesAnalyticsDoubleCreateBlob hardFailure:1 result:v24];

        if (!v27)
        {
          uint64_t v30 = CloudServicesLog(v29);
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v54[0] = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "double enrollment: failed to create duplicate escrow blob: %@",  buf,  0xCu);
          }
        }
      }

      else
      {
        if (v25)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "double enrollment: missing duplicate escrow certificate, not creating duplicate escrow blob for prerecord",  buf,  2u);
        }

        v27 = 0LL;
      }

      if (!v19) {
        goto LABEL_24;
      }
    }

    else
    {
      v27 = 0LL;
      if (!v19)
      {
LABEL_24:
        uint64_t v43 = CloudServicesLog(v20);
        v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          sub_100048190((const __CFString **)a6, v44);
        }

        v34 = 0LL;
LABEL_36:

        goto LABEL_37;
      }
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:kSecureBackupUsesNumericPassphraseKey]);
    unsigned int v37 = [v36 BOOLValue];

    if (v37)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
      v40 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:kSecureBackupNumericPassphraseLengthKey]);
      id v41 = [v40 unsignedIntegerValue];

      if (v41 == (id)4)
      {
        uint64_t v42 = 1LL;
        goto LABEL_32;
      }

      if (v41 == (id)6)
      {
        uint64_t v42 = 2LL;
LABEL_32:
        uint64_t v47 = CloudServicesLog(v38);
        v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
          *(_DWORD *)buf = 67109378;
          LODWORD(v54[0]) = v42;
          WORD2(v54[0]) = 2112;
          *(void *)((char *)v54 + 6) = v49;
          _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "createPrerecordFromCandidate: Successfully made an escrow blob: type: %d metadata: %@",  buf,  0x12u);
        }

        v50 = -[EscrowPrerecord initWithCandidate:certificate:escrowBlob:passphraseType:]( objc_alloc(&OBJC_CLASS___EscrowPrerecord),  "initWithCandidate:certificate:escrowBlob:passphraseType:",  v9,  v10,  v19,  v42);
        v34 = v50;
        if (v27) {
          -[EscrowPrerecord setDuplicateEscrowBlob:](v50, "setDuplicateEscrowBlob:", v27);
        }
        goto LABEL_36;
      }

      uint64_t v45 = CloudServicesLog(v38);
      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Unknown numeric length of passcode?",  buf,  2u);
      }
    }

    uint64_t v42 = 3LL;
    goto LABEL_32;
  }

  uint64_t v32 = CloudServicesLog(v17);
  objc_super v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    sub_100048150(v33);
  }

  v34 = 0LL;
  if (a6) {
    *a6 = (id)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  22LL,  0LL,  @"Missing required parameters"));
  }
LABEL_37:

  return v34;
}

@end