@interface KTStateTransitionPath
+ (id)pathFromDictionary:(id)a3;
- (KTStateString)initialState;
- (KTStateTransitionPath)initWithState:(id)a3 pathStep:(id)a4;
- (KTStateTransitionPathStep)pathStep;
- (id)asPathStep;
- (void)setInitialState:(id)a3;
- (void)setPathStep:(id)a3;
@end

@implementation KTStateTransitionPath

- (KTStateTransitionPath)initWithState:(id)a3 pathStep:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___KTStateTransitionPath;
  v9 = -[KTStateTransitionPath init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_initialState, a3);
    objc_storeStrong((id *)&v10->_pathStep, a4);
  }

  return v10;
}

- (id)asPathStep
{
  v3 = objc_alloc(&OBJC_CLASS___KTStateTransitionPathStep);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionPath initialState](self, "initialState"));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionPath pathStep](self, "pathStep"));
  v10 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  id v7 = -[KTStateTransitionPathStep initWithPath:](v3, "initWithPath:", v6);

  return v7;
}

+ (id)pathFromDictionary:(id)a3
{
  id v3 = a3;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys", 0));
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v5)
  {
    v15 = 0LL;
    goto LABEL_15;
  }

  id v6 = v5;
  uint64_t v7 = *(void *)v20;
  while (2)
  {
    for (i = 0LL; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v20 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v9]);
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___KTStateTransitionPathStep, v11);
      if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
      {
        v15 = -[KTStateTransitionPath initWithState:pathStep:]( objc_alloc(&OBJC_CLASS___KTStateTransitionPath),  "initWithState:pathStep:",  v9,  v10);
LABEL_14:

        goto LABEL_15;
      }

      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary, v13);
      if ((objc_opt_isKindOfClass(v10, v14) & 1) != 0)
      {
        v16 = objc_alloc(&OBJC_CLASS___KTStateTransitionPath);
        v17 = (void *)objc_claimAutoreleasedReturnValue( +[KTStateTransitionPathStep pathFromDictionary:]( &OBJC_CLASS___KTStateTransitionPathStep,  "pathFromDictionary:",  v10));
        v15 = -[KTStateTransitionPath initWithState:pathStep:](v16, "initWithState:pathStep:", v9, v17);

        goto LABEL_14;
      }
    }

    id v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    v15 = 0LL;
    if (v6) {
      continue;
    }
    break;
  }

- (KTStateString)initialState
{
  return (KTStateString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setInitialState:(id)a3
{
}

- (KTStateTransitionPathStep)pathStep
{
  return (KTStateTransitionPathStep *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPathStep:(id)a3
{
}

- (void).cxx_destruct
{
}

@end