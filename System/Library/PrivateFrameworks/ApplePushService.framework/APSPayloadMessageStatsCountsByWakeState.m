@interface APSPayloadMessageStatsCountsByWakeState
- (APSPayloadMessageStatsCount)darkWake;
- (APSPayloadMessageStatsCount)fullWake;
- (APSPayloadMessageStatsCount)unknown;
- (APSPayloadMessageStatsCountsByWakeState)init;
- (void)countTopic:(id)a3 now:(double)a4;
- (void)moveUnknownToDestination:(id)a3;
- (void)setDarkWake:(id)a3;
- (void)setFullWake:(id)a3;
- (void)setUnknown:(id)a3;
@end

@implementation APSPayloadMessageStatsCountsByWakeState

- (APSPayloadMessageStatsCountsByWakeState)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___APSPayloadMessageStatsCountsByWakeState;
  v2 = -[APSPayloadMessageStatsCountsByWakeState init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___APSPayloadMessageStatsCount);
    darkWake = v2->_darkWake;
    v2->_darkWake = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___APSPayloadMessageStatsCount);
    fullWake = v2->_fullWake;
    v2->_fullWake = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___APSPayloadMessageStatsCount);
    unknown = v2->_unknown;
    v2->_unknown = v7;
  }

  return v2;
}

- (void)countTopic:(id)a3 now:(double)a4
{
  id v19 = a3;
  v6 = self->_unknown;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[APSWakeStateManager wakeStateManager](&OBJC_CLASS___APSWakeStateManager, "wakeStateManager"));
  unsigned __int8 v8 = [v7 inFullWake];

  if ((v8 & 1) == 0)
  {
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[APSWakeStateManager wakeStateManager](&OBJC_CLASS___APSWakeStateManager, "wakeStateManager"));
    unsigned __int8 v11 = [v10 inDarkWake];

    if ((v11 & 1) == 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[APSWakeStateManager wakeStateManager](&OBJC_CLASS___APSWakeStateManager, "wakeStateManager"));
      unsigned int v14 = [v13 isGoingToSleep];

      if (!v14) {
        goto LABEL_6;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[APSWakeStateManager wakeStateManager](&OBJC_CLASS___APSWakeStateManager, "wakeStateManager"));
      unsigned __int8 v16 = [v15 wasInFullWake];

      if ((v16 & 1) != 0) {
        goto LABEL_2;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[APSWakeStateManager wakeStateManager](&OBJC_CLASS___APSWakeStateManager, "wakeStateManager"));
      unsigned int v18 = [v17 wasInDarkWake];

      if (!v18) {
        goto LABEL_6;
      }
    }

    uint64_t v9 = 1LL;
    goto LABEL_5;
  }

- (void)moveUnknownToDestination:(id)a3
{
  id v8 = a3;
  if (-[APSPayloadMessageStatsCount count](self->_unknown, "count"))
  {
    objc_msgSend( v8,  "setCount:",  (char *)-[APSPayloadMessageStatsCount count](self->_unknown, "count") + (void)objc_msgSend(v8, "count"));
    -[APSPayloadMessageStatsCount lastMessageTime](self->_unknown, "lastMessageTime");
    double v5 = v4;
    [v8 lastMessageTime];
    if (v5 < v6)
    {
      [v8 lastMessageTime];
      -[APSPayloadMessageStatsCount setLastMessageTime:](self->_unknown, "setLastMessageTime:");
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSPayloadMessageStatsCount lastMessageTopic](self->_unknown, "lastMessageTopic"));
      [v8 setLastMessageTopic:v7];
    }

    -[APSPayloadMessageStatsCount setCount:](self->_unknown, "setCount:", 0LL);
    -[APSPayloadMessageStatsCount setLastMessageTime:](self->_unknown, "setLastMessageTime:", 0.0);
    -[APSPayloadMessageStatsCount setLastMessageTopic:](self->_unknown, "setLastMessageTopic:", 0LL);
  }
}

- (APSPayloadMessageStatsCount)darkWake
{
  return self->_darkWake;
}

- (void)setDarkWake:(id)a3
{
}

- (APSPayloadMessageStatsCount)fullWake
{
  return self->_fullWake;
}

- (void)setFullWake:(id)a3
{
}

- (APSPayloadMessageStatsCount)unknown
{
  return self->_unknown;
}

- (void)setUnknown:(id)a3
{
}

- (void).cxx_destruct
{
}

@end