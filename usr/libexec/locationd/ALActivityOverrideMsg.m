@interface ALActivityOverrideMsg
- (ALCLMotionActivity)activity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)overrideActionAsString:(int)a3;
- (int)StringAsOverrideAction:(id)a3;
- (int)overrideAction;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActivity:(id)a3;
- (void)setOverrideAction:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALActivityOverrideMsg

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALActivityOverrideMsg;
  -[ALActivityOverrideMsg dealloc](&v3, "dealloc");
}

- (id)overrideActionAsString:(int)a3
{
  if ((a3 + 1) >= 3) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return *(&off_10182CB28 + a3 + 1);
  }
}

- (int)StringAsOverrideAction:(id)a3
{
  return -1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ALActivityOverrideMsg;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[ALActivityOverrideMsg description](&v3, "description"),  -[ALActivityOverrideMsg dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  int v4 = self->_overrideAction + 1;
  if (v4 >= 3) {
    v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_overrideAction);
  }
  else {
    v5 = (NSString *)*(&off_10182CB28 + v4);
  }
  [v3 setObject:v5 forKey:@"overrideAction"];
  activity = self->_activity;
  if (activity) {
    objc_msgSend( v3,  "setObject:forKey:",  -[ALCLMotionActivity dictionaryRepresentation](activity, "dictionaryRepresentation"),  @"activity");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100261E44((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  activity = self->_activity;
  if (!activity) {
    sub_1012320F8();
  }
  PBDataWriterWriteSubmessage(a3, activity, 2LL);
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_overrideAction;
  [a3 setActivity:self->_activity];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  *((_DWORD *)v5 + 4) = self->_overrideAction;

  *((void *)v5 + 1) = -[ALCLMotionActivity copyWithZone:](self->_activity, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class(self)];
  if (v5)
  {
    if (self->_overrideAction == *((_DWORD *)a3 + 4))
    {
      activity = self->_activity;
      else {
        LOBYTE(v5) = 1;
      }
    }

    else
    {
      LOBYTE(v5) = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761LL * self->_overrideAction;
  return -[ALCLMotionActivity hash](self->_activity, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_overrideAction = *((_DWORD *)a3 + 4);
  uint64_t v3 = *((void *)a3 + 1);
  if (self->_activity)
  {
    if (v3) {
      -[ALCLMotionActivity mergeFrom:](self->_activity, "mergeFrom:");
    }
  }

  else if (v3)
  {
    -[ALActivityOverrideMsg setActivity:](self, "setActivity:");
  }

- (int)overrideAction
{
  return self->_overrideAction;
}

- (void)setOverrideAction:(int)a3
{
  self->_overrideAction = a3;
}

- (ALCLMotionActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

@end