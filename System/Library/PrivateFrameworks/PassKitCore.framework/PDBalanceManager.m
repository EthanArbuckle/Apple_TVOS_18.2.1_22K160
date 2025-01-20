@interface PDBalanceManager
- (BOOL)passTileManager:(id)a3 isRelevantForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6;
- (BOOL)passTileManager:(id)a3 wantsUpdateDescriptorStateForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6;
- (unint64_t)passTileManager:(id)a3 isTileSupportedForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6;
@end

@implementation PDBalanceManager

- (BOOL)passTileManager:(id)a3 isRelevantForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if ([a4 passType] == (id)1)
  {
    id v11 = sub_10033DFD8(self, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v12 title]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 valueTypeForeignReference]);
      if ([v15 foreignReferenceType] == (id)1)
      {
        BOOL v16 = 1;
      }

      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue([v13 body]);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 valueTypeForeignReference]);
        if ([v18 foreignReferenceType] == (id)1)
        {
          BOOL v16 = 1;
        }

        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue([v13 footer]);
          v20 = (void *)objc_claimAutoreleasedReturnValue([v19 valueTypeForeignReference]);
          BOOL v16 = [v20 foreignReferenceType] == (id)1;
        }
      }
    }

    else
    {
      BOOL v16 = 0;
    }
  }

  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (unint64_t)passTileManager:(id)a3 isTileSupportedForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!-[PDBalanceManager passTileManager:isRelevantForPass:tileDescriptor:descriptorState:]( self,  "passTileManager:isRelevantForPass:tileDescriptor:descriptorState:",  a3,  v10,  v11,  v12))
  {
    unint64_t v15 = 0LL;
    goto LABEL_16;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 secureElementPass]);
  id v14 = [v13 passActivationState];

  if (!v14)
  {
    databaseManager = self->_databaseManager;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
    v18 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager paymentBalancesForPassUniqueIdentifier:]( databaseManager,  "paymentBalancesForPassUniqueIdentifier:",  v17));

    id v19 = sub_10033DFD8(self, v11, v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 title]);
    uint64_t v22 = sub_10033E248((uint64_t)self, v21, v18);

    BOOL v23 = v22 == 1;
    if (v22 != 2)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v20 body]);
      unint64_t v15 = sub_10033E248((uint64_t)self, v24, v18);

      if (v15 == 1)
      {
        BOOL v23 = 1LL;
      }

      else if (v15 == 2)
      {
        goto LABEL_15;
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue([v20 footer]);
      unint64_t v15 = sub_10033E248((uint64_t)self, v25, v18);

      if (v15 == 1) {
        goto LABEL_14;
      }
      if (v15 == 2) {
        goto LABEL_15;
      }
      if (v23)
      {
LABEL_14:
        unint64_t v15 = 1LL;
        goto LABEL_15;
      }
    }

    unint64_t v15 = 2LL;
LABEL_15:

    goto LABEL_16;
  }

  unint64_t v15 = 2LL;
LABEL_16:

  return v15;
}

- (BOOL)passTileManager:(id)a3 wantsUpdateDescriptorStateForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6
{
  return 0;
}

- (void).cxx_destruct
{
}

@end