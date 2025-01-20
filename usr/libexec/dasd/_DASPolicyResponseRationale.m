@interface _DASPolicyResponseRationale
- (NSMutableArray)reasons;
- (NSPredicate)condition;
- (NSString)policyName;
- (_DASPolicyResponseRationale)initWithPolicyName:(id)a3;
- (id)description;
- (int64_t)responseOptions;
- (void)addRationaleForCondition:(id)a3 withRequiredValue:(double)a4 withCurrentValue:(double)a5;
- (void)addRationaleWithCondition:(id)a3;
- (void)setCondition:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setReasons:(id)a3;
- (void)setResponseOptions:(int64_t)a3;
@end

@implementation _DASPolicyResponseRationale

- (id)description
{
  if (!-[NSMutableArray count](self->_reasons, "count") && !self->_condition) {
    return &stru_100118C98;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  [v3 appendString:@"["];
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v4 = self->_reasons;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v8) description]);
        [v3 appendFormat:@"{%@},", v9];

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v6);
  }

  condition = self->_condition;
  if (condition)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPredicate description](condition, "description"));
    [v3 appendFormat:@"{%@}", v11];
  }

  [v3 appendString:@"]"];
  return v3;
}

- (_DASPolicyResponseRationale)initWithPolicyName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____DASPolicyResponseRationale;
  id v6 = -[_DASPolicyResponseRationale init](&v11, "init");
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_policyName, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    reasons = v7->_reasons;
    v7->_reasons = (NSMutableArray *)v8;
  }

  return v7;
}

- (void)addRationaleForCondition:(id)a3 withRequiredValue:(double)a4 withCurrentValue:(double)a5
{
  id v8 = a3;
  v9 = -[_DASPolicyRequiredValueRationale initWithCondition:withRequiredValue:withCurrentValue:]( objc_alloc(&OBJC_CLASS____DASPolicyRequiredValueRationale),  "initWithCondition:withRequiredValue:withCurrentValue:",  v8,  a4,  a5);

  -[NSMutableArray addObject:](self->_reasons, "addObject:", v9);
}

- (void)addRationaleWithCondition:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  condition = self->_condition;
  p_condition = (id *)&self->_condition;
  uint64_t v7 = condition;
  if (condition)
  {
    v13[0] = v7;
    v13[1] = v5;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v10));
    id v12 = *p_condition;
    id *p_condition = (id)v11;
  }

  else
  {
    objc_storeStrong(p_condition, a3);
  }
}

- (int64_t)responseOptions
{
  return self->_responseOptions;
}

- (void)setResponseOptions:(int64_t)a3
{
  self->_responseOptions = a3;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
}

- (NSPredicate)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
}

- (NSMutableArray)reasons
{
  return self->_reasons;
}

- (void)setReasons:(id)a3
{
}

- (void).cxx_destruct
{
}

@end