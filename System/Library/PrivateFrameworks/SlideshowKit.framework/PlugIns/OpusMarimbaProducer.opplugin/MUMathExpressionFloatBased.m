@interface MUMathExpressionFloatBased
+ (float)evaluateString:(id)a3 error:(id *)a4;
+ (float)invalidResult;
- (BOOL)isConstant;
- (BOOL)isValueIllegal:(float)a3;
- (MUMathExpressionFloatBased)init;
- (MUMathExpressionFloatBased)initWithString:(id)a3 error:(id *)a4;
- (float)evaluate;
- (float)valueForVariable:(id)a3;
- (id)stringValue;
- (void)_resetVariableIndicies;
- (void)cleanup;
- (void)dealloc;
- (void)replaceVariable:(id)a3 withValue:(float)a4;
- (void)resetAllVariables;
- (void)setValue:(float)a3 forVariable:(id)a4;
- (void)setVariableValues:(id)a3;
@end

@implementation MUMathExpressionFloatBased

+ (float)evaluateString:(id)a3 error:(id *)a4
{
  float v6 = v5;
  v7 = (char *)[a3 UTF8String];
  if (v7)
  {
    v8 = v7;
    v9 = operator new(0x28uLL);
    sub_124440((int)v9, v8);
    int v10 = (*(uint64_t (**)(void *))(*(void *)v9 + 296LL))(v9);
    if (v10)
    {
      int v11 = v10;
      uint64_t v12 = 0LL;
      do
      {
        (*(void (**)(void *, uint64_t, float))(*(void *)v9 + 352LL))(v9, v12, 0.0);
        uint64_t v12 = (v12 + 1);
      }

      while (v11 != (_DWORD)v12);
    }

    float v6 = (**(float (***)(void *))v9)(v9);
    (*(void (**)(void *))(*(void *)v9 + 152LL))(v9);
  }

  return v6;
}

- (MUMathExpressionFloatBased)init
{
  return -[MUMathExpressionFloatBased initWithString:error:](self, "initWithString:error:", 0LL, 0LL);
}

- (MUMathExpressionFloatBased)initWithString:(id)a3 error:(id *)a4
{
  float v6 = (char *)[a3 UTF8String];
  if (v6)
  {
    v7 = v6;
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___MUMathExpressionFloatBased;
    v8 = -[MUMathExpressionBase init](&v11, "init");
    if (v8)
    {
      v9 = operator new(0x28uLL);
      sub_124440((int)v9, v7);
      v8->mInterpreter = v9;
      -[MUMathExpressionFloatBased _resetVariableIndicies](v8, "_resetVariableIndicies");
      -[MUMathExpressionFloatBased resetAllVariables](v8, "resetAllVariables");
    }
  }

  else
  {
    if (a4) {
      *a4 = 0LL;
    }

    return 0LL;
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MUMathExpressionFloatBased;
  -[MUMathExpressionBase dealloc](&v3, "dealloc");
}

- (void)cleanup
{
  mInterpreter = self->mInterpreter;
  if (mInterpreter) {
    (*(void (**)(void *))(*(void *)mInterpreter + 152LL))(mInterpreter);
  }
}

- (void)_resetVariableIndicies
{
  unsigned int v3 = (*(uint64_t (**)(void *))(*(void *)self->mInterpreter + 296LL))(self->mInterpreter);
  if (v3)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = v3;
    do
    {
      uint64_t v6 = (*(uint64_t (**)(void *, uint64_t))(*(void *)self->mInterpreter + 312LL))(self->mInterpreter, v4);
      if (v6) {
        -[NSMutableDictionary setObject:forKey:]( self->super._indicesForVariables,  "setObject:forKey:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4),  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6));
      }
      ++v4;
    }

    while (v5 != v4);
  }

- (void)setValue:(float)a3 forVariable:(id)a4
{
  id v6 = -[NSMutableDictionary objectForKey:](self->super._indicesForVariables, "objectForKey:", a4);
  if (v6) {
    (*(void (**)(void *, id, float))(*(void *)self->mInterpreter + 352))( self->mInterpreter,  [v6 unsignedIntValue],  a3);
  }
}

- (float)valueForVariable:(id)a3
{
  id v4 = -[NSMutableDictionary objectForKey:](self->super._indicesForVariables, "objectForKey:", a3);
  if (!v4) {
    return 0.0;
  }
  (*(void (**)(void *, id))(*(void *)self->mInterpreter + 320))( self->mInterpreter,  [v4 intValue]);
  return result;
}

- (void)setVariableValues:(id)a3
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  indicesForVariables = self->super._indicesForVariables;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( indicesForVariables,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(indicesForVariables);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v11 = [a3 objectForKey:v10];
        if (v11)
        {
          uint64_t v12 = v11;
          mInterpreter = self->mInterpreter;
          id v14 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->super._indicesForVariables, "objectForKey:", v10),  "intValue");
          [v12 floatValue];
          (*(void (**)(void *, id))(*(void *)mInterpreter + 352LL))(mInterpreter, v14);
        }
      }

      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( indicesForVariables,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v7);
  }

- (void)replaceVariable:(id)a3 withValue:(float)a4
{
  id v6 = -[NSMutableDictionary objectForKey:](self->super._indicesForVariables, "objectForKey:", a3);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = (float *)operator new(0x18uLL);
    sub_123F94(v8);
    *(void *)uint64_t v8 = off_24D3F8;
    v8[4] = a4;
    (*(void (**)(void *, id, float *))(*(void *)self->mInterpreter + 80))( self->mInterpreter,  [v7 intValue],  v8);
    (*(void (**)(float *))(*(void *)v8 + 152LL))(v8);
  }

  -[MUMathExpressionFloatBased _resetVariableIndicies](self, "_resetVariableIndicies");
}

- (void)resetAllVariables
{
  int v3 = (*(uint64_t (**)(void *, SEL))(*(void *)self->mInterpreter + 296LL))(self->mInterpreter, a2);
  if (v3)
  {
    int v4 = v3;
    uint64_t v5 = 0LL;
    do
    {
      (*(void (**)(void *, uint64_t, float))(*(void *)self->mInterpreter + 352LL))( self->mInterpreter,  v5,  0.0);
      uint64_t v5 = (v5 + 1);
    }

    while (v4 != (_DWORD)v5);
  }

- (float)evaluate
{
  return result;
}

- (id)stringValue
{
  int v3 = (void *)(*(uint64_t (**)(void *))(*(void *)self->mInterpreter + 104LL))(self->mInterpreter);
  int v4 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3);
  if (v3) {
    operator delete[](v3);
  }
  return v4;
}

- (BOOL)isConstant
{
  return (*(unsigned int (**)(void *, SEL))(*(void *)self->mInterpreter + 40LL))(self->mInterpreter, a2) != 0;
}

+ (float)invalidResult
{
  return 3.4028e38;
}

- (BOOL)isValueIllegal:(float)a3
{
  return v4 == a3;
}

@end