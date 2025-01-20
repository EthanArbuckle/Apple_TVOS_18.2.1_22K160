@interface KTStateTransitionPathStep
+ (id)failure:(id)a3 pathFromDictionary:(id)a4;
+ (id)pathFromDictionary:(id)a3;
+ (id)success;
- (BOOL)successState;
- (KTStateTransitionPathStep)initWithExpectedFailure:(id)a3 withPath:(id)a4;
- (KTStateTransitionPathStep)initWithPath:(id)a3;
- (NSDictionary)followStates;
- (NSError)expectedFailure;
- (id)description;
- (id)initAsSuccess;
- (id)nextStep:(id)a3;
- (void)setSuccessState:(BOOL)a3;
@end

@implementation KTStateTransitionPathStep

- (id)initAsSuccess
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___KTStateTransitionPathStep;
  v2 = -[KTStateTransitionPathStep init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_successState = 1;
    followStates = v2->_followStates;
    v2->_followStates = (NSDictionary *)&__NSDictionary0__struct;

    expectedFailure = v3->_expectedFailure;
    v3->_expectedFailure = 0LL;
  }

  return v3;
}

- (KTStateTransitionPathStep)initWithPath:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___KTStateTransitionPathStep;
  v6 = -[KTStateTransitionPathStep init](&v10, "init");
  objc_super v7 = v6;
  if (v6)
  {
    v6->_successState = 0;
    objc_storeStrong((id *)&v6->_followStates, a3);
    expectedFailure = v7->_expectedFailure;
    v7->_expectedFailure = 0LL;
  }

  return v7;
}

- (KTStateTransitionPathStep)initWithExpectedFailure:(id)a3 withPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___KTStateTransitionPathStep;
  v9 = -[KTStateTransitionPathStep init](&v12, "init");
  objc_super v10 = v9;
  if (v9)
  {
    v9->_successState = 0;
    objc_storeStrong((id *)&v9->_followStates, a4);
    objc_storeStrong((id *)&v10->_expectedFailure, a3);
  }

  return v10;
}

- (id)nextStep:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionPathStep followStates](self, "followStates"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionPathStep followStates](self, "followStates"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<OSTPath(%@)>", v3));

  return v4;
}

+ (id)success
{
  return  -[KTStateTransitionPathStep initAsSuccess]( objc_alloc(&OBJC_CLASS___KTStateTransitionPathStep),  "initAsSuccess");
}

+ (id)pathFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    v9 = off_100275000;
    v24 = v5;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v11]);
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___KTStateTransitionPathStep, v13);
        if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0)
        {
          [v4 setObject:v12 forKeyedSubscript:v11];
        }

        else
        {
          uint64_t v16 = objc_opt_class(v9[47], v15);
          if ((objc_opt_isKindOfClass(v12, v16) & 1) != 0)
          {
            v17 = v9;
            v18 = (void *)objc_claimAutoreleasedReturnValue( +[KTStateTransitionPathStep pathFromDictionary:]( &OBJC_CLASS___KTStateTransitionPathStep,  "pathFromDictionary:",  v12));
            [v4 setObject:v18 forKeyedSubscript:v11];

            v9 = v17;
            id v5 = v24;
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v7);
  }

  id v19 = [v4 count];
  v20 = objc_alloc(&OBJC_CLASS___KTStateTransitionPathStep);
  if (v19) {
    v21 = -[KTStateTransitionPathStep initWithPath:](v20, "initWithPath:", v4);
  }
  else {
    v21 = -[KTStateTransitionPathStep initAsSuccess](v20, "initAsSuccess");
  }
  v22 = v21;

  return v22;
}

+ (id)failure:(id)a3 pathFromDictionary:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[KTStateTransitionPathStep pathFromDictionary:]( &OBJC_CLASS___KTStateTransitionPathStep,  "pathFromDictionary:",  a4));
  id v7 = (void *)v6[3];
  v6[3] = v5;

  return v6;
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

- (NSError)expectedFailure
{
  return (NSError *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end