@interface PSSubscriptionUpdate
- (BOOL)hasSubscriptionsStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)subscriptionsStatusAsString:(int)a3;
- (int)StringAsSubscriptionsStatus:(id)a3;
- (int)subscriptionsStatus;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSubscriptionsStatus:(BOOL)a3;
- (void)setSubscriptionsStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PSSubscriptionUpdate

- (int)subscriptionsStatus
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_subscriptionsStatus;
  }
  else {
    return 0;
  }
}

- (void)setSubscriptionsStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_subscriptionsStatus = a3;
}

- (void)setHasSubscriptionsStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSubscriptionsStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)subscriptionsStatusAsString:(int)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return @"RESEND_SUBSCRIPTIONS";
  }
}

- (int)StringAsSubscriptionsStatus:(id)a3
{
  return 0;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PSSubscriptionUpdate;
  id v3 = -[PSSubscriptionUpdate description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PSSubscriptionUpdate dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if (self->_subscriptionsStatus) {
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_subscriptionsStatus));
    }
    else {
      v4 = @"RESEND_SUBSCRIPTIONS";
    }
    [v3 setObject:v4 forKey:@"subscriptions_status"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006E93C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteInt32Field(a3, self->_subscriptionsStatus, 1LL);
  }
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_subscriptionsStatus;
    *((_BYTE *)a3 + 12) |= 1u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_subscriptionsStatus;
    *((_BYTE *)result + 12) |= 1u;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = (*((_BYTE *)v4 + 12) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 12) & 1) != 0 && self->_subscriptionsStatus == *((_DWORD *)v4 + 2))
    {
      BOOL v6 = 1;
      goto LABEL_7;
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return 2654435761LL * self->_subscriptionsStatus;
  }
  else {
    return 0LL;
  }
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 12) & 1) != 0)
  {
    self->_subscriptionsStatus = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

@end