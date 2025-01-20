@interface OctagonStateTransitionPathStep
+ (id)pathFromDictionary:(id)a3;
+ (id)success;
- (BOOL)successState;
- (NSDictionary)followStates;
- (OctagonStateTransitionPathStep)initWithPath:(id)a3;
- (id)description;
- (id)initAsSuccess;
- (id)nextStep:(id)a3;
- (void)setSuccessState:(BOOL)a3;
@end

@implementation OctagonStateTransitionPathStep

- (id)initAsSuccess
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___OctagonStateTransitionPathStep;
  v2 = -[OctagonStateTransitionPathStep init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_successState = 1;
    followStates = v2->_followStates;
    v2->_followStates = (NSDictionary *)&__NSDictionary0__struct;
  }

  return v3;
}

- (OctagonStateTransitionPathStep)initWithPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___OctagonStateTransitionPathStep;
  objc_super v6 = -[OctagonStateTransitionPathStep init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_successState = 0;
    objc_storeStrong((id *)&v6->_followStates, a3);
  }

  return v7;
}

- (id)nextStep:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionPathStep followStates](self, "followStates"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionPathStep followStates](self, "followStates"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<OSTPath(%@)>", v3));

  return v4;
}

- (BOOL)successState
{
  return self->_successState;
}

- (void)setSuccessState:(BOOL)a3
{
  self->_successState = a3;
}

- (NSDictionary)followStates
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

+ (id)success
{
  return  -[OctagonStateTransitionPathStep initAsSuccess]( objc_alloc(&OBJC_CLASS___OctagonStateTransitionPathStep),  "initAsSuccess");
}

+ (id)pathFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    objc_super v9 = &AAAccountClassPrimary_ptr;
    v22 = v5;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v11]);
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___OctagonStateTransitionPathStep);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          [v4 setObject:v12 forKeyedSubscript:v11];
        }

        else
        {
          uint64_t v14 = objc_opt_class(v9[263]);
          if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0)
          {
            v15 = v9;
            v16 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPathStep pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPathStep,  "pathFromDictionary:",  v12));
            [v4 setObject:v16 forKeyedSubscript:v11];

            objc_super v9 = v15;
            id v5 = v22;
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v7);
  }

  id v17 = [v4 count];
  v18 = objc_alloc(&OBJC_CLASS___OctagonStateTransitionPathStep);
  if (v17) {
    v19 = -[OctagonStateTransitionPathStep initWithPath:](v18, "initWithPath:", v4);
  }
  else {
    v19 = -[OctagonStateTransitionPathStep initAsSuccess](v18, "initAsSuccess");
  }
  v20 = v19;

  return v20;
}

@end