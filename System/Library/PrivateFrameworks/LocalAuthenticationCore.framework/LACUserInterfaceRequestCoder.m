@interface LACUserInterfaceRequestCoder
- (id)_deserialize:(id)a3;
- (id)_encodingKey;
- (id)_serialize:(id)a3;
- (id)decode:(id)a3;
- (id)encode:(id)a3;
@end

@implementation LACUserInterfaceRequestCoder

- (id)encode:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = -[LACUserInterfaceRequestCoder _encodingKey](self, "_encodingKey");
  v6 = -[LACUserInterfaceRequestCoder _serialize:](self, "_serialize:", v4);
  if (v6)
  {
    v9 = v5;
    v10[0] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v7 = (void *)MEMORY[0x189604A60];
  }

  return v7;
}

- (id)decode:(id)a3
{
  id v4 = a3;
  v5 = -[LACUserInterfaceRequestCoder _encodingKey](self, "_encodingKey");
  [v4 objectForKeyedSubscript:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = -[LACUserInterfaceRequestCoder _deserialize:](self, "_deserialize:", v6);
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (id)_serialize:(id)a3
{
  return (id)[MEMORY[0x1896078F8] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
}

- (id)_deserialize:(id)a3
{
  v3 = (void *)MEMORY[0x189607908];
  id v4 = a3;
  [v3 unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:0];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_encodingKey
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end