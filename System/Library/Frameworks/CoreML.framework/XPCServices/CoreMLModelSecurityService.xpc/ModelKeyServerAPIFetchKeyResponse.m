@interface ModelKeyServerAPIFetchKeyResponse
- (BOOL)hasError;
- (BOOL)hasResult;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ModelKeyServerAPIFetchKeyResult)success;
- (ModelKeyServerAPIResultError)error;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)resultAsString:(int)a3;
- (int)StringAsResult:(id)a3;
- (int)result;
- (unint64_t)hash;
- (void)clearOneofValuesForResult;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setError:(id)a3;
- (void)setHasResult:(BOOL)a3;
- (void)setResult:(int)a3;
- (void)setSuccess:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ModelKeyServerAPIFetchKeyResponse

- (BOOL)hasSuccess
{
  return self->_success != 0LL;
}

- (void)setSuccess:(id)a3
{
  v4 = (ModelKeyServerAPIFetchKeyResult *)a3;
  -[ModelKeyServerAPIFetchKeyResponse clearOneofValuesForResult](self, "clearOneofValuesForResult");
  *(_BYTE *)&self->_has |= 1u;
  self->_result = 1;
  success = self->_success;
  self->_success = v4;
}

- (BOOL)hasError
{
  return self->_error != 0LL;
}

- (void)setError:(id)a3
{
  v4 = (ModelKeyServerAPIResultError *)a3;
  -[ModelKeyServerAPIFetchKeyResponse clearOneofValuesForResult](self, "clearOneofValuesForResult");
  *(_BYTE *)&self->_has |= 1u;
  self->_result = 2;
  error = self->_error;
  self->_error = v4;
}

- (int)result
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_result;
  }
  else {
    return 0;
  }
}

- (void)setResult:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResult
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)resultAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return off_10000C360[a3];
  }
}

- (int)StringAsResult:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"success"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"error"])
  {
    int v4 = 2;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForResult
{
  *(_BYTE *)&self->_has &= ~1u;
  self->_result = 0;
  success = self->_success;
  self->_success = 0LL;

  error = self->_error;
  self->_error = 0LL;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ModelKeyServerAPIFetchKeyResponse;
  id v3 = -[ModelKeyServerAPIFetchKeyResponse description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ModelKeyServerAPIFetchKeyResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  success = self->_success;
  if (success)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ModelKeyServerAPIFetchKeyResult dictionaryRepresentation](success, "dictionaryRepresentation"));
    [v3 setObject:v5 forKey:@"success"];
  }

  error = self->_error;
  if (error)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ModelKeyServerAPIResultError dictionaryRepresentation](error, "dictionaryRepresentation"));
    [v3 setObject:v7 forKey:@"error"];
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t v8 = self->_result;
    if (v8 >= 3) {
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_result));
    }
    else {
      v9 = off_10000C360[v8];
    }
    [v3 setObject:v9 forKey:@"Result"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ModelKeyServerAPIFetchKeyResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  success = self->_success;
  id v7 = v4;
  if (success)
  {
    PBDataWriterWriteSubmessage(v4, success, 1LL);
    id v4 = v7;
  }

  error = self->_error;
  if (error)
  {
    PBDataWriterWriteSubmessage(v7, error, 2LL);
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_result;
    *((_BYTE *)v4 + 32) |= 1u;
  }

  v5 = v4;
  if (self->_success)
  {
    objc_msgSend(v4, "setSuccess:");
    id v4 = v5;
  }

  if (self->_error)
  {
    objc_msgSend(v5, "setError:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_result;
    *((_BYTE *)v5 + 32) |= 1u;
  }

  id v7 = -[ModelKeyServerAPIFetchKeyResult copyWithZone:](self->_success, "copyWithZone:", a3);
  uint64_t v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = -[ModelKeyServerAPIResultError copyWithZone:](self->_error, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_result != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }

  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    unsigned __int8 v8 = 0;
    goto LABEL_12;
  }

  success = self->_success;
  if ((unint64_t)success | *((void *)v4 + 3)
    && !-[ModelKeyServerAPIFetchKeyResult isEqual:](success, "isEqual:"))
  {
    goto LABEL_11;
  }

  error = self->_error;
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_12:

  return v8;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v3 = 2654435761LL * self->_result;
  }
  else {
    uint64_t v3 = 0LL;
  }
  unint64_t v4 = -[ModelKeyServerAPIFetchKeyResult hash](self->_success, "hash") ^ v3;
  return v4 ^ -[ModelKeyServerAPIResultError hash](self->_error, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_result = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

  success = self->_success;
  uint64_t v7 = v5[3];
  v10 = v5;
  if (success)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[ModelKeyServerAPIFetchKeyResult mergeFrom:](success, "mergeFrom:");
  }

  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[ModelKeyServerAPIFetchKeyResponse setSuccess:](self, "setSuccess:");
  }

  uint64_t v5 = v10;
LABEL_9:
  error = self->_error;
  uint64_t v9 = v5[1];
  if (error)
  {
    if (v9)
    {
      -[ModelKeyServerAPIResultError mergeFrom:](error, "mergeFrom:");
LABEL_14:
      uint64_t v5 = v10;
    }
  }

  else if (v9)
  {
    -[ModelKeyServerAPIFetchKeyResponse setError:](self, "setError:");
    goto LABEL_14;
  }
}

- (ModelKeyServerAPIFetchKeyResult)success
{
  return self->_success;
}

- (ModelKeyServerAPIResultError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end