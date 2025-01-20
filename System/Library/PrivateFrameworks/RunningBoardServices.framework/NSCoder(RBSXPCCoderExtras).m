@interface NSCoder(RBSXPCCoderExtras)
- (id)decodeCollectionOfClass:()RBSXPCCoderExtras containingClass:forKey:;
- (id)decodeStringForKey:()RBSXPCCoderExtras;
- (void)encodeCollection:()RBSXPCCoderExtras forKey:;
@end

@implementation NSCoder(RBSXPCCoderExtras)

- (void)encodeCollection:()RBSXPCCoderExtras forKey:
{
  id v6 = a4;
  [a3 objectEnumerator];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 allObjects];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [a1 encodeObject:v8 forKey:v6];
}

- (id)decodeCollectionOfClass:()RBSXPCCoderExtras containingClass:forKey:
{
  id v8 = (void *)MEMORY[0x189604010];
  id v9 = a5;
  objc_msgSend(v8, "setWithObjects:", objc_opt_class(), a4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 decodeObjectOfClasses:v10 forKey:v9];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0LL;
  return v12;
}

- (id)decodeStringForKey:()RBSXPCCoderExtras
{
  id v4 = a3;
  [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end