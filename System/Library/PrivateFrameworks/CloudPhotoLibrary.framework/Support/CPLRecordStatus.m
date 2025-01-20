@interface CPLRecordStatus
- (id)initFromPQLResultSet:(id)a3 center:(id)a4 error:(id *)a5;
@end

@implementation CPLRecordStatus

- (id)initFromPQLResultSet:(id)a3 center:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 integerAtIndex:0];
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 stringAtIndex:1]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 scopedIdentifierForLocalIdentifier:v11 scopeIndex:v10]);

  if (v12)
  {
    v13 = (NSString *)objc_claimAutoreleasedReturnValue([v8 stringAtIndex:2]);
    id v14 = [v8 unsignedIntegerAtIndex:3];
    Class v15 = NSClassFromString(v13);
    if (-[objc_class isSubclassOfClass:]( v15,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___CPLRecordChange)))
    {
      id v16 = -[objc_class newRecordWithScopedIdentifier:](v15, "newRecordWithScopedIdentifier:", v12);
      self = -[CPLRecordStatus initWithRecord:generation:](self, "initWithRecord:generation:", v16, v14);

      v17 = self;
    }

    else
    {
      v17 = 0LL;
      if (a5) {
        *a5 = (id)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
      }
    }
  }

  else
  {
    v17 = 0LL;
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopeIndex:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopeIndex:",  v10));
    }
  }

  return v17;
}

@end