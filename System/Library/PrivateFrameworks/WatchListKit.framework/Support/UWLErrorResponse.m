@interface UWLErrorResponse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)retryPeriodInSeconds;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRetryPeriodInSeconds:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation UWLErrorResponse

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UWLErrorResponse;
  id v3 = -[UWLErrorResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UWLErrorResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_retryPeriodInSeconds));
  [v3 setObject:v4 forKey:@"retry_period_in_seconds"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return UWLErrorResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_retryPeriodInSeconds;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_retryPeriodInSeconds;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return 2654435761LL * self->_retryPeriodInSeconds;
}

- (void)mergeFrom:(id)a3
{
  self->_retryPeriodInSeconds = *((_DWORD *)a3 + 2);
}

- (int)retryPeriodInSeconds
{
  return self->_retryPeriodInSeconds;
}

- (void)setRetryPeriodInSeconds:(int)a3
{
  self->_retryPeriodInSeconds = a3;
}

@end