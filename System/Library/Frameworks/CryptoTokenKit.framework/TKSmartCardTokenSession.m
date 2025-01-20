@interface TKSmartCardTokenSession
- (TKSmartCard)smartCard;
- (TKSmartCardTokenSession)initWithToken:(id)a3;
- (id)name;
- (void)beginRequest;
- (void)endRequest;
@end

@implementation TKSmartCardTokenSession

- (TKSmartCardTokenSession)initWithToken:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TKSmartCardTokenSession;
  v3 = -[TKTokenSession initWithToken:](&v9, sel_initWithToken_, a3);
  v4 = v3;
  if (v3)
  {
    v5 = -[TKTokenSession token](v3, "token");
    uint64_t v6 = [v5 smartCard];
    smartCard = v4->_smartCard;
    v4->_smartCard = (TKSmartCard *)v6;
  }

  return v4;
}

- (void)beginRequest
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TKSmartCardTokenSession;
  -[TKTokenSession beginRequest](&v4, sel_beginRequest);
  errorCard = self->_errorCard;
  self->_errorCard = 0LL;
}

- (TKSmartCard)smartCard
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  errorCard = self->_errorCard;
  if (errorCard) {
    goto LABEL_14;
  }
  [v3 AID];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    BOOL hasSession = self->_hasSession;

    if (!hasSession)
    {
      smartCard = self->_smartCard;
      id v20 = 0LL;
      BOOL v8 = -[TKSmartCard beginSessionWithError:](smartCard, "beginSessionWithError:", &v20);
      id v9 = v20;
      v10 = v9;
      if (v8)
      {
        v11 = self->_smartCard;
        [v3 AID];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        id v19 = v10;
        BOOL v13 = -[TKSmartCard selectApplication:error:](v11, "selectApplication:error:", v12, &v19);
        id v14 = v19;

        if (v13)
        {
          self->_BOOL hasSession = 1;
LABEL_11:

          goto LABEL_12;
        }

        -[TKSmartCard endSession](self->_smartCard, "endSession");
        if (!v14) {
          goto LABEL_12;
        }
LABEL_10:
        v15 = -[TKSmartCardWithError initWithCard:error:]( objc_alloc(&OBJC_CLASS___TKSmartCardWithError),  "initWithCard:error:",  self->_smartCard,  v14);
        v16 = self->_errorCard;
        self->_errorCard = &v15->super;

        goto LABEL_11;
      }

      id v14 = v9;
      if (v9) {
        goto LABEL_10;
      }
    }
  }

- (void)endRequest
{
  if (self->_hasSession)
  {
    -[TKSmartCard endSession](self->_smartCard, "endSession");
    self->_BOOL hasSession = 0;
  }

  errorCard = self->_errorCard;
  self->_errorCard = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TKSmartCardTokenSession;
  -[TKTokenSession endRequest](&v4, sel_endRequest);
}

- (id)name
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 name];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
}

@end