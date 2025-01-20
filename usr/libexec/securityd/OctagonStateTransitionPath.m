@interface OctagonStateTransitionPath
+ (id)pathFromDictionary:(id)a3;
- (OctagonStateString)initialState;
- (OctagonStateTransitionPath)initWithState:(id)a3 pathStep:(id)a4;
- (OctagonStateTransitionPathStep)pathStep;
- (id)asPathStep;
- (id)description;
- (void)setInitialState:(id)a3;
- (void)setPathStep:(id)a3;
@end

@implementation OctagonStateTransitionPath

- (OctagonStateTransitionPath)initWithState:(id)a3 pathStep:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___OctagonStateTransitionPath;
  v9 = -[OctagonStateTransitionPath init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_initialState, a3);
    objc_storeStrong((id *)&v10->_pathStep, a4);
  }

  return v10;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionPath initialState](self, "initialState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionPath pathStep](self, "pathStep"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<OctagonStateTransitionPath: %@ %@",  v3,  v4));

  return v5;
}

- (id)asPathStep
{
  v3 = objc_alloc(&OBJC_CLASS___OctagonStateTransitionPathStep);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionPath initialState](self, "initialState"));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionPath pathStep](self, "pathStep"));
  v10 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  id v7 = -[OctagonStateTransitionPathStep initWithPath:](v3, "initWithPath:", v6);

  return v7;
}

- (OctagonStateString)initialState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setInitialState:(id)a3
{
}

- (OctagonStateTransitionPathStep)pathStep
{
  return (OctagonStateTransitionPathStep *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPathStep:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)pathFromDictionary:(id)a3
{
  id v3 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys", 0));
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v5)
  {
    v13 = 0LL;
    goto LABEL_15;
  }

  id v6 = v5;
  uint64_t v7 = *(void *)v18;
  while (2)
  {
    for (i = 0LL; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v9]);
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___OctagonStateTransitionPathStep);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
      {
        v13 = -[OctagonStateTransitionPath initWithState:pathStep:]( objc_alloc(&OBJC_CLASS___OctagonStateTransitionPath),  "initWithState:pathStep:",  v9,  v10);
LABEL_14:

        goto LABEL_15;
      }

      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
      {
        v14 = objc_alloc(&OBJC_CLASS___OctagonStateTransitionPath);
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPathStep pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPathStep,  "pathFromDictionary:",  v10));
        v13 = -[OctagonStateTransitionPath initWithState:pathStep:](v14, "initWithState:pathStep:", v9, v15);

        goto LABEL_14;
      }
    }

    id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    v13 = 0LL;
    if (v6) {
      continue;
    }
    break;
  }

@end