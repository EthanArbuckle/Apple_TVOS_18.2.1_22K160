@interface PBSystemGestureRecipeEnumerator
- (NSEnumerator)enumerator;
- (PBSystemGestureRecipeEnumerator)initWithRecipeProvider:(id)a3 typeEnumerator:(id)a4;
- (id)nextObject;
- (id)recipeProvider;
@end

@implementation PBSystemGestureRecipeEnumerator

- (PBSystemGestureRecipeEnumerator)initWithRecipeProvider:(id)a3 typeEnumerator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBSystemGestureRecipeEnumerator;
  v8 = -[PBSystemGestureRecipeEnumerator init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_enumerator, a4);
    id v10 = [v6 copy];
    id recipeProvider = v9->_recipeProvider;
    v9->_id recipeProvider = v10;
  }

  return v9;
}

- (id)nextObject
{
  v3 = 0LL;
  while (1)
  {
    v4 = v3;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSEnumerator nextObject](self->_enumerator, "nextObject"));

    if (!v3) {
      break;
    }
    [v3 unsignedIntegerValue];
    uint64_t v5 = (*((uint64_t (**)(void))self->_recipeProvider + 2))();
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
    if (v6)
    {
      id v7 = (void *)v6;
      goto LABEL_6;
    }
  }

  id v7 = 0LL;
LABEL_6:

  return v7;
}

- (NSEnumerator)enumerator
{
  return self->_enumerator;
}

- (id)recipeProvider
{
  return self->_recipeProvider;
}

- (void).cxx_destruct
{
}

@end