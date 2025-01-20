@interface ICDAccountManagerStateChange
+ (id)stateChangeFromState:(id)a3 toState:(id)a4 computation:(int64_t)a5;
- (BOOL)activeConfigurationChanged;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportedConfigurationsChanged;
- (ICDAccountManagerState)finalState;
- (ICDAccountManagerState)initialState;
- (id)_initWithInitialState:(id)a3 finalState:(id)a4 computation:(int64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)computation;
@end

@implementation ICDAccountManagerStateChange

- (BOOL)activeConfigurationChanged
{
  unsigned __int8 v3 = -[ICDAccountManagerStateChange computation](self, "computation");
  v4 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0)
  {
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerStateChange initialState](self, "initialState"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeConfigurationDSID]);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerStateChange finalState](self, "finalState"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 activeConfigurationDSID]);
      int v15 = 134218498;
      v16 = self;
      __int16 v17 = 2112;
      v18 = v8;
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "ICDAccountManagerStateChange %p - Initial configuration [%@] -> Final configuration [%@]",  (uint8_t *)&v15,  0x20u);
    }

    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerStateChange initialState](self, "initialState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s activeConfigurationDSID](v4, "activeConfigurationDSID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerStateChange finalState](self, "finalState"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 activeConfigurationDSID]);
    if (v11 == v13) {
      LOBYTE(v6) = 0;
    }
    else {
      unsigned int v6 = [v11 isEqual:v13] ^ 1;
    }
  }

  else
  {
    if (v5)
    {
      int v15 = 134217984;
      v16 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "ICDAccountManagerStateChange %p - configurationChanged: NO [computation option driven]",  (uint8_t *)&v15,  0xCu);
    }

    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)supportedConfigurationsChanged
{
  unsigned __int8 v3 = -[ICDAccountManagerStateChange computation](self, "computation");
  v4 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 2) != 0)
  {
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerStateChange initialState](self, "initialState"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 supportedConfigurationsDSIDs]);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerStateChange finalState](self, "finalState"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 supportedConfigurationsDSIDs]);
      int v19 = 134218498;
      v20 = self;
      __int16 v21 = 2112;
      v22 = v8;
      __int16 v23 = 2112;
      v24 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "ICDAccountManagerStateChange %p - Initial configurations [%@] -> Final configurations [%@]",  (uint8_t *)&v19,  0x20u);
    }

    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerStateChange initialState](self, "initialState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s supportedConfigurationsDSIDs](v4, "supportedConfigurationsDSIDs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerStateChange finalState](self, "finalState"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 supportedConfigurationsDSIDs]);
    if (v11 == v13)
    {
      LOBYTE(v6) = 0;
    }

    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerStateChange initialState](self, "initialState"));
      int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 supportedConfigurationsDSIDs]);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerStateChange finalState](self, "finalState"));
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 supportedConfigurationsDSIDs]);
      unsigned int v6 = [v15 isEqualToSet:v17] ^ 1;
    }
  }

  else
  {
    if (v5)
    {
      int v19 = 134217984;
      v20 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "ICDAccountManagerStateChange %p - supportedConfigurationsChanged: NO [computation option driven]",  (uint8_t *)&v19,  0xCu);
    }

    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)description
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerStateChange initialState](self, "initialState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerStateChange finalState](self, "finalState"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ICDAccountManagerStateChange %p: %@ -> %@ - [active changed=%u] [supported changed=%u]",  self,  v3,  v4,  -[ICDAccountManagerStateChange activeConfigurationChanged](self, "activeConfigurationChanged"),  -[ICDAccountManagerStateChange supportedConfigurationsChanged]( self,  "supportedConfigurationsChanged")));

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v5 = (ICDAccountManagerStateChange *)a3;
  if (self == v5)
  {
    BOOL v13 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___ICDAccountManagerStateChange, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerStateChange initialState](v7, "initialState"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerStateChange initialState](self, "initialState"));
      if ([v8 isEqual:v9])
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerStateChange finalState](v7, "finalState"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerStateChange finalState](self, "finalState"));
        if ([v10 isEqual:v11])
        {
          id v12 = -[ICDAccountManagerStateChange computation](v7, "computation");
          BOOL v13 = v12 == (id)-[ICDAccountManagerStateChange computation](self, "computation");
        }

        else
        {
          BOOL v13 = 0;
        }
      }

      else
      {
        BOOL v13 = 0;
      }
    }

    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerStateChange initialState](self, "initialState"));
    id v7 = [v6 copyWithZone:a3];
    v8 = (void *)v5[1];
    v5[1] = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManagerStateChange finalState](self, "finalState"));
    id v10 = [v9 copyWithZone:a3];
    v11 = (void *)v5[2];
    v5[2] = v10;

    v5[3] = -[ICDAccountManagerStateChange computation](self, "computation");
  }

  return v5;
}

- (id)_initWithInitialState:(id)a3 finalState:(id)a4 computation:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ICDAccountManagerStateChange;
  id v10 = -[ICDAccountManagerStateChange init](&v16, "init");
  if (v10)
  {
    v11 = (ICDAccountManagerState *)[v8 copy];
    initialState = v10->_initialState;
    v10->_initialState = v11;

    BOOL v13 = (ICDAccountManagerState *)[v9 copy];
    finalState = v10->_finalState;
    v10->_finalState = v13;

    v10->_computation = a5;
  }

  return v10;
}

- (ICDAccountManagerState)initialState
{
  return self->_initialState;
}

- (ICDAccountManagerState)finalState
{
  return self->_finalState;
}

- (int64_t)computation
{
  return self->_computation;
}

- (void).cxx_destruct
{
}

+ (id)stateChangeFromState:(id)a3 toState:(id)a4 computation:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) _initWithInitialState:v9 finalState:v8 computation:a5];

  return v10;
}

@end