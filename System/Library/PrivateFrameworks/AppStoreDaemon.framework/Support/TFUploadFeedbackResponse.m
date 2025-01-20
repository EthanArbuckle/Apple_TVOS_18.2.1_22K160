@interface TFUploadFeedbackResponse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation TFUploadFeedbackResponse

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TFUploadFeedbackResponse;
  id v3 = -[TFUploadFeedbackResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TFUploadFeedbackResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  submissionId = self->_submissionId;
  if (submissionId) {
    [v3 setObject:submissionId forKey:@"submissionId"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
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
      if (v6++ >= 9)
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
    if ((v7 >> 3) == 1)
    {
      uint64_t Data = PBReaderReadData(a3);
      v14 = (NSData *)objc_claimAutoreleasedReturnValue(Data);
      submissionId = self->_submissionId;
      self->_submissionId = v14;
    }

    else
    {
      int v16 = PBReaderSkipValueWithTag(a3);
      if (!v16) {
        return v16;
      }
    }
  }

  LOBYTE(v16) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v16;
}

- (void)writeTo:(id)a3
{
  submissionId = self->_submissionId;
  if (submissionId) {
    PBDataWriterWriteDataField(a3, submissionId, 1LL);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSData copyWithZone:](self->_submissionId, "copyWithZone:", a3);
  unint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
  {
    submissionId = self->_submissionId;
    else {
      unsigned __int8 v7 = 1;
    }
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSData hash](self->_submissionId, "hash");
}

- (void).cxx_destruct
{
}

@end