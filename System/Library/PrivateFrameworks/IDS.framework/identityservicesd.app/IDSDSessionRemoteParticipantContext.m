@interface IDSDSessionRemoteParticipantContext
- (IDSDSessionRemoteParticipantContext)initWithtimeStamp:(double)a3 updateType:(unint64_t)a4;
- (double)timeStamp;
- (id)IDSGroupSessionMessageParticipantUpdateTypeString:(unint64_t)a3;
- (id)description;
- (unint64_t)updateType;
@end

@implementation IDSDSessionRemoteParticipantContext

- (IDSDSessionRemoteParticipantContext)initWithtimeStamp:(double)a3 updateType:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSDSessionRemoteParticipantContext;
  result = -[IDSDSessionRemoteParticipantContext init](&v7, "init");
  if (result)
  {
    if (a3 != 0.0) {
      result->_timeStamp = a3;
    }
    if (a4) {
      result->_updateType = a4;
    }
  }

  return result;
}

- (id)description
{
  double timeStamp = self->_timeStamp;
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSessionRemoteParticipantContext IDSGroupSessionMessageParticipantUpdateTypeString:]( self,  "IDSGroupSessionMessageParticipantUpdateTypeString:",  self->_updateType));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%p> - timeStamp :%f, state: %@",  self,  *(void *)&timeStamp,  v4));

  return v5;
}

- (id)IDSGroupSessionMessageParticipantUpdateTypeString:(unint64_t)a3
{
  if (a3 > 4) {
    return 0LL;
  }
  else {
    return off_1008FB5E8[a3];
  }
}

- (double)timeStamp
{
  return self->_timeStamp;
}

- (unint64_t)updateType
{
  return self->_updateType;
}

@end