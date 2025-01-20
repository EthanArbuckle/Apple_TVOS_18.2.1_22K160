@interface TFUploadFeedbackRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation TFUploadFeedbackRequest

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TFUploadFeedbackRequest;
  id v3 = -[TFUploadFeedbackRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TFUploadFeedbackRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_dsid));
    [v3 setObject:v4 forKey:@"dsid"];
  }

  feedback = self->_feedback;
  if (feedback)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TFFeedback dictionaryRepresentation](feedback, "dictionaryRepresentation"));
    [v3 setObject:v6 forKey:@"feedback"];
  }

  application = self->_application;
  if (application)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[TFApplication dictionaryRepresentation](application, "dictionaryRepresentation"));
    [v3 setObject:v8 forKey:@"application"];
  }

  device = self->_device;
  if (device)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TFDevice dictionaryRepresentation](device, "dictionaryRepresentation"));
    [v3 setObject:v10 forKey:@"device"];
  }

  appleWatch = self->_appleWatch;
  if (appleWatch)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TFAppleWatch dictionaryRepresentation](appleWatch, "dictionaryRepresentation"));
    [v3 setObject:v12 forKey:@"appleWatch"];
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_posixTimestampMillis));
    [v3 setObject:v14 forKey:@"posixTimestampMillis"];

    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_desiredTTLMillis));
    [v3 setObject:v15 forKey:@"desiredTTLMillis"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (!*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
    {
      char v5 = 0;
      unsigned int v6 = 0;
      unint64_t v7 = 0LL;
      while (1)
      {
        unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        char v9 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
        v7 |= (unint64_t)(v9 & 0x7F) << v5;
        if ((v9 & 0x80) == 0) {
          goto LABEL_11;
        }
        v5 += 7;
        BOOL v10 = v6++ >= 9;
        if (v10)
        {
          unint64_t v7 = 0LL;
          int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }

      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v7 = 0LL;
      }
LABEL_13:
      if (v11 || (v7 & 7) == 4) {
        break;
      }
      switch((v7 >> 3))
      {
        case 1u:
          char v13 = 0;
          unsigned int v14 = 0;
          uint64_t v15 = 0LL;
          *(_BYTE *)&self->_has |= 2u;
          while (1)
          {
            unint64_t v16 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            char v17 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v16);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
            v15 |= (unint64_t)(v17 & 0x7F) << v13;
            if ((v17 & 0x80) == 0) {
              goto LABEL_54;
            }
            v13 += 7;
            BOOL v10 = v14++ >= 9;
            if (v10)
            {
              uint64_t v15 = 0LL;
              goto LABEL_56;
            }
          }

          *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_54:
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v15 = 0LL;
          }
LABEL_56:
          uint64_t v28 = 16LL;
          goto LABEL_65;
        case 2u:
          v19 = objc_alloc_init(&OBJC_CLASS___TFFeedback);
          objc_storeStrong((id *)&self->_feedback, v19);
          goto LABEL_38;
        case 3u:
          v19 = objc_alloc_init(&OBJC_CLASS___TFApplication);
          objc_storeStrong((id *)&self->_application, v19);
          goto LABEL_38;
        case 4u:
          v19 = objc_alloc_init(&OBJC_CLASS___TFDevice);
          objc_storeStrong((id *)&self->_device, v19);
          goto LABEL_38;
        case 5u:
          v19 = objc_alloc_init(&OBJC_CLASS___TFAppleWatch);
          objc_storeStrong((id *)&self->_appleWatch, v19);
          if (!PBReaderPlaceMark(a3, v30) || !sub_1002A1E38((uint64_t)v19, (uint64_t)a3))
          {
LABEL_68:

            LOBYTE(v18) = 0;
            return v18;
          }

- (void)writeTo:(id)a3
{
  id v9 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field(v9, self->_dsid, 1LL);
  }
  feedback = self->_feedback;
  if (feedback) {
    PBDataWriterWriteSubmessage(v9, feedback, 2LL);
  }
  application = self->_application;
  if (application) {
    PBDataWriterWriteSubmessage(v9, application, 3LL);
  }
  device = self->_device;
  if (device) {
    PBDataWriterWriteSubmessage(v9, device, 4LL);
  }
  appleWatch = self->_appleWatch;
  if (appleWatch) {
    PBDataWriterWriteSubmessage(v9, appleWatch, 5LL);
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field(v9, self->_posixTimestampMillis, 6LL);
    char has = (char)self->_has;
  }

  if ((has & 1) != 0) {
    PBDataWriterWriteUint64Field(v9, self->_desiredTTLMillis, 7LL);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  unsigned int v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5[2] = self->_dsid;
    *((_BYTE *)v5 + 64) |= 2u;
  }

  id v7 = -[TFFeedback copyWithZone:](self->_feedback, "copyWithZone:", a3);
  unint64_t v8 = (void *)v6[7];
  v6[7] = v7;

  id v9 = -[TFApplication copyWithZone:](self->_application, "copyWithZone:", a3);
  BOOL v10 = (void *)v6[5];
  v6[5] = v9;

  id v11 = -[TFDevice copyWithZone:](self->_device, "copyWithZone:", a3);
  v12 = (void *)v6[6];
  v6[6] = v11;

  id v13 = -[TFAppleWatch copyWithZone:](self->_appleWatch, "copyWithZone:", a3);
  unsigned int v14 = (void *)v6[4];
  v6[4] = v13;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v6[3] = self->_posixTimestampMillis;
    *((_BYTE *)v6 + 64) |= 4u;
    char has = (char)self->_has;
  }

  if ((has & 1) != 0)
  {
    v6[1] = self->_desiredTTLMillis;
    *((_BYTE *)v6 + 64) |= 1u;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_dsid != *((void *)v4 + 2)) {
      goto LABEL_24;
    }
  }

  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
LABEL_24:
    BOOL v10 = 0;
    goto LABEL_25;
  }

  feedback = self->_feedback;
  application = self->_application;
  if ((unint64_t)application | *((void *)v4 + 5))
  {
    if (!-[TFApplication isEqual:](application, "isEqual:")) {
      goto LABEL_24;
    }
  }

  device = self->_device;
  if ((unint64_t)device | *((void *)v4 + 6))
  {
    if (!-[TFDevice isEqual:](device, "isEqual:")) {
      goto LABEL_24;
    }
  }

  appleWatch = self->_appleWatch;
  if ((unint64_t)appleWatch | *((void *)v4 + 4))
  {
    if (!-[TFAppleWatch isEqual:](appleWatch, "isEqual:")) {
      goto LABEL_24;
    }
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_posixTimestampMillis != *((void *)v4 + 3)) {
      goto LABEL_24;
    }
  }

  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_24;
  }

  BOOL v10 = (*((_BYTE *)v4 + 64) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_desiredTTLMillis != *((void *)v4 + 1)) {
      goto LABEL_24;
    }
    BOOL v10 = 1;
  }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 2) != 0) {
    unint64_t v3 = 2654435761u * self->_dsid;
  }
  else {
    unint64_t v3 = 0LL;
  }
  unint64_t v4 = -[TFFeedback hash](self->_feedback, "hash");
  unint64_t v5 = -[TFApplication hash](self->_application, "hash");
  unint64_t v6 = -[TFDevice hash](self->_device, "hash");
  unint64_t v7 = -[TFAppleWatch hash](self->_appleWatch, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    unint64_t v8 = 2654435761u * self->_posixTimestampMillis;
    if ((*(_BYTE *)&self->_has & 1) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v9 = 0LL;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }

  unint64_t v8 = 0LL;
  if ((*(_BYTE *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v9 = 2654435761u * self->_desiredTTLMillis;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void).cxx_destruct
{
}

@end