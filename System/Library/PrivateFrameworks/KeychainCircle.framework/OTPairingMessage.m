@interface OTPairingMessage
- (BOOL)hasEpoch;
- (BOOL)hasPrepare;
- (BOOL)hasSupportsOctagon;
- (BOOL)hasSupportsSOS;
- (BOOL)hasVoucher;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (OTApplicantToSponsorRound2M1)prepare;
- (OTSponsorToApplicantRound1M2)epoch;
- (OTSponsorToApplicantRound2M2)voucher;
- (OTSupportOctagonMessage)supportsOctagon;
- (OTSupportSOSMessage)supportsSOS;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEpoch:(id)a3;
- (void)setPrepare:(id)a3;
- (void)setSupportsOctagon:(id)a3;
- (void)setSupportsSOS:(id)a3;
- (void)setVoucher:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTPairingMessage

- (BOOL)hasEpoch
{
  return self->_epoch != 0LL;
}

- (BOOL)hasPrepare
{
  return self->_prepare != 0LL;
}

- (BOOL)hasVoucher
{
  return self->_voucher != 0LL;
}

- (BOOL)hasSupportsOctagon
{
  return self->_supportsOctagon != 0LL;
}

- (BOOL)hasSupportsSOS
{
  return self->_supportsSOS != 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTPairingMessage;
  v4 = -[OTPairingMessage description](&v8, sel_description);
  v5 = -[OTPairingMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  epoch = self->_epoch;
  if (epoch)
  {
    v5 = -[OTSponsorToApplicantRound1M2 dictionaryRepresentation](epoch, "dictionaryRepresentation");
    [v3 setObject:v5 forKey:@"epoch"];
  }

  prepare = self->_prepare;
  if (prepare)
  {
    v7 = -[OTApplicantToSponsorRound2M1 dictionaryRepresentation](prepare, "dictionaryRepresentation");
    [v3 setObject:v7 forKey:@"prepare"];
  }

  voucher = self->_voucher;
  if (voucher)
  {
    v9 = -[OTSponsorToApplicantRound2M2 dictionaryRepresentation](voucher, "dictionaryRepresentation");
    [v3 setObject:v9 forKey:@"voucher"];
  }

  supportsOctagon = self->_supportsOctagon;
  if (supportsOctagon)
  {
    v11 = -[OTSupportOctagonMessage dictionaryRepresentation](supportsOctagon, "dictionaryRepresentation");
    [v3 setObject:v11 forKey:@"supportsOctagon"];
  }

  supportsSOS = self->_supportsSOS;
  if (supportsSOS)
  {
    v13 = -[OTSupportSOSMessage dictionaryRepresentation](supportsSOS, "dictionaryRepresentation");
    [v3 setObject:v13 forKey:@"supportsSOS"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x189611CF0];
  v5 = (int *)MEMORY[0x189611CE8];
  v6 = (int *)MEMORY[0x189611CE0];
  objc_super v8 = (int *)MEMORY[0x189611CD8];
  while (2)
  {
    if (*((_BYTE *)a3 + *v6)) {
      return *((_BYTE *)a3 + *v6) == 0;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0LL;
    while (1)
    {
      uint64_t v12 = *v4;
      unint64_t v13 = *(void *)((char *)a3 + v12);
      char v14 = *(_BYTE *)(*(void *)((char *)a3 + *v8) + v13);
      *(void *)((char *)a3 + v12) = v13 + 1;
      v11 |= (unint64_t)(v14 & 0x7F) << v9;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v9 += 7;
      if (v10++ >= 9)
      {
        unint64_t v11 = 0LL;
        int v16 = *((unsigned __int8 *)a3 + *v6);
        goto LABEL_14;
      }
    }

    *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
    int v16 = *((unsigned __int8 *)a3 + *v6);
    if (*((_BYTE *)a3 + *v6)) {
      unint64_t v11 = 0LL;
    }
LABEL_14:
    if (v16 || (v11 & 7) == 4) {
      return *((_BYTE *)a3 + *v6) == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        v18 = objc_alloc_init(&OBJC_CLASS___OTSponsorToApplicantRound1M2);
        objc_storeStrong((id *)&self->_epoch, v18);
        if (PBReaderPlaceMark()
          && (OTSponsorToApplicantRound1M2ReadFrom((uint64_t)v18, (uint64_t)a3) & 1) != 0)
        {
          goto LABEL_35;
        }

        goto LABEL_39;
      case 2u:
        v18 = objc_alloc_init(&OBJC_CLASS___OTApplicantToSponsorRound2M1);
        objc_storeStrong((id *)&self->_prepare, v18);
        goto LABEL_35;
      case 3u:
        v18 = objc_alloc_init(&OBJC_CLASS___OTSponsorToApplicantRound2M2);
        objc_storeStrong((id *)&self->_voucher, v18);
        goto LABEL_35;
      case 5u:
        v18 = objc_alloc_init(&OBJC_CLASS___OTSupportOctagonMessage);
        objc_storeStrong((id *)&self->_supportsOctagon, v18);
        goto LABEL_35;
      case 6u:
        v18 = objc_alloc_init(&OBJC_CLASS___OTSupportSOSMessage);
        objc_storeStrong((id *)&self->_supportsSOS, v18);
        if (PBReaderPlaceMark() && (OTSupportSOSMessageReadFrom((uint64_t)v18, (uint64_t)a3) & 1) != 0)
        {
LABEL_35:
          PBReaderRecallMark();

LABEL_36:
          continue;
        }

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_epoch)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }

  if (self->_prepare)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }

  if (self->_voucher)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }

  if (self->_supportsOctagon)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }

  if (self->_supportsSOS)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_epoch)
  {
    objc_msgSend(v4, "setEpoch:");
    id v4 = v5;
  }

  if (self->_prepare)
  {
    objc_msgSend(v5, "setPrepare:");
    id v4 = v5;
  }

  if (self->_voucher)
  {
    objc_msgSend(v5, "setVoucher:");
    id v4 = v5;
  }

  if (self->_supportsOctagon)
  {
    objc_msgSend(v5, "setSupportsOctagon:");
    id v4 = v5;
  }

  if (self->_supportsSOS)
  {
    objc_msgSend(v5, "setSupportsSOS:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = -[OTSponsorToApplicantRound1M2 copyWithZone:](self->_epoch, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = -[OTApplicantToSponsorRound2M1 copyWithZone:](self->_prepare, "copyWithZone:", a3);
  char v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = -[OTSponsorToApplicantRound2M2 copyWithZone:](self->_voucher, "copyWithZone:", a3);
  unint64_t v11 = (void *)v5[5];
  v5[5] = v10;

  id v12 = -[OTSupportOctagonMessage copyWithZone:](self->_supportsOctagon, "copyWithZone:", a3);
  unint64_t v13 = (void *)v5[3];
  v5[3] = v12;

  id v14 = -[OTSupportSOSMessage copyWithZone:](self->_supportsSOS, "copyWithZone:", a3);
  v15 = (void *)v5[4];
  v5[4] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((epoch = self->_epoch, !((unint64_t)epoch | v4[1]))
     || -[OTSponsorToApplicantRound1M2 isEqual:](epoch, "isEqual:"))
    && ((prepare = self->_prepare, !((unint64_t)prepare | v4[2]))
     || -[OTApplicantToSponsorRound2M1 isEqual:](prepare, "isEqual:"))
    && ((voucher = self->_voucher, !((unint64_t)voucher | v4[5]))
     || -[OTSponsorToApplicantRound2M2 isEqual:](voucher, "isEqual:"))
    && ((supportsOctagon = self->_supportsOctagon, !((unint64_t)supportsOctagon | v4[3]))
     || -[OTSupportOctagonMessage isEqual:](supportsOctagon, "isEqual:")))
  {
    supportsSOS = self->_supportsSOS;
    else {
      char v10 = 1;
    }
  }

  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = -[OTSponsorToApplicantRound1M2 hash](self->_epoch, "hash");
  unint64_t v4 = -[OTApplicantToSponsorRound2M1 hash](self->_prepare, "hash") ^ v3;
  unint64_t v5 = -[OTSponsorToApplicantRound2M2 hash](self->_voucher, "hash");
  unint64_t v6 = v4 ^ v5 ^ -[OTSupportOctagonMessage hash](self->_supportsOctagon, "hash");
  return v6 ^ -[OTSupportSOSMessage hash](self->_supportsSOS, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  epoch = self->_epoch;
  v15 = v4;
  uint64_t v6 = v4[1];
  if (epoch)
  {
    if (v6) {
      -[OTSponsorToApplicantRound1M2 mergeFrom:](epoch, "mergeFrom:");
    }
  }

  else if (v6)
  {
    -[OTPairingMessage setEpoch:](self, "setEpoch:");
  }

  prepare = self->_prepare;
  uint64_t v8 = v15[2];
  if (prepare)
  {
    if (v8) {
      -[OTApplicantToSponsorRound2M1 mergeFrom:](prepare, "mergeFrom:");
    }
  }

  else if (v8)
  {
    -[OTPairingMessage setPrepare:](self, "setPrepare:");
  }

  voucher = self->_voucher;
  uint64_t v10 = v15[5];
  if (voucher)
  {
    if (v10) {
      -[OTSponsorToApplicantRound2M2 mergeFrom:](voucher, "mergeFrom:");
    }
  }

  else if (v10)
  {
    -[OTPairingMessage setVoucher:](self, "setVoucher:");
  }

  supportsOctagon = self->_supportsOctagon;
  uint64_t v12 = v15[3];
  if (supportsOctagon)
  {
    if (v12) {
      -[OTSupportOctagonMessage mergeFrom:](supportsOctagon, "mergeFrom:");
    }
  }

  else if (v12)
  {
    -[OTPairingMessage setSupportsOctagon:](self, "setSupportsOctagon:");
  }

  supportsSOS = self->_supportsSOS;
  uint64_t v14 = v15[4];
  if (supportsSOS)
  {
    if (v14) {
      -[OTSupportSOSMessage mergeFrom:](supportsSOS, "mergeFrom:");
    }
  }

  else if (v14)
  {
    -[OTPairingMessage setSupportsSOS:](self, "setSupportsSOS:");
  }
}

- (OTSponsorToApplicantRound1M2)epoch
{
  return self->_epoch;
}

- (void)setEpoch:(id)a3
{
}

- (OTApplicantToSponsorRound2M1)prepare
{
  return self->_prepare;
}

- (void)setPrepare:(id)a3
{
}

- (OTSponsorToApplicantRound2M2)voucher
{
  return self->_voucher;
}

- (void)setVoucher:(id)a3
{
}

- (OTSupportOctagonMessage)supportsOctagon
{
  return self->_supportsOctagon;
}

- (void)setSupportsOctagon:(id)a3
{
}

- (OTSupportSOSMessage)supportsSOS
{
  return self->_supportsSOS;
}

- (void)setSupportsSOS:(id)a3
{
}

- (void).cxx_destruct
{
}

@end