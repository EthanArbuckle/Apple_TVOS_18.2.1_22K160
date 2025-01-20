@interface PDPassLiveRenderManager
- (PDPassLiveRenderManager)init;
- (PDPassLiveRenderManager)initWithDatabaseManager:(id)a3 dynamicStateManager:(id)a4;
- (id)liveRenderForPassUniqueID:(id)a3;
- (unint64_t)updateLiveRenderingEnabled:(BOOL)a3 forPassUniqueID:(id)a4;
@end

@implementation PDPassLiveRenderManager

- (PDPassLiveRenderManager)init
{
  return 0LL;
}

- (PDPassLiveRenderManager)initWithDatabaseManager:(id)a3 dynamicStateManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PDPassLiveRenderManager;
  v9 = -[PDPassLiveRenderManager init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_databaseManager, a3);
    objc_storeStrong((id *)&v10->_dynamicStateManager, a4);
  }

  return v10;
}

- (id)liveRenderForPassUniqueID:(id)a3
{
  id result = a3;
  if (result)
  {
    id v5 = result;
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager passLiveRenderForPassUniqueIdentifier:]( self->_databaseManager,  "passLiveRenderForPassUniqueIdentifier:",  result));

    return v6;
  }

  else
  {
    __break(1u);
  }

  return result;
}

- (unint64_t)updateLiveRenderingEnabled:(BOOL)a3 forPassUniqueID:(id)a4
{
  BOOL v4 = a3;
  unint64_t result = (unint64_t)a4;
  if (result)
  {
    id v7 = (void *)result;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager insertOrUpdateLiveRenderEnabled:forPassWithUniqueIdentifier:]( self->_databaseManager,  "insertOrUpdateLiveRenderEnabled:forPassWithUniqueIdentifier:",  v4,  result));
    if (v8)
    {
      -[PDPassDynamicStateManager setDidUpdateDynamicStateForPassUniqueID:]( self->_dynamicStateManager,  "setDidUpdateDynamicStateForPassUniqueID:",  v7);
      unint64_t v9 = 2LL;
    }

    else
    {
      unint64_t v9 = 1LL;
    }

    return v9;
  }

  else
  {
    __break(1u);
  }

  return result;
}

- (void).cxx_destruct
{
}

@end