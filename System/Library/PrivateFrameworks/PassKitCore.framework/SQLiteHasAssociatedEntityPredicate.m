@interface SQLiteHasAssociatedEntityPredicate
+ (id)predicateWithAssociatedEntityClass:(Class)a3;
- (id)SQLForEntityClass:(Class)a3;
- (id)description;
@end

@implementation SQLiteHasAssociatedEntityPredicate

+ (id)predicateWithAssociatedEntityClass:(Class)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class(a1, a2));
  v4[1] = a3;
  return v4;
}

- (id)SQLForEntityClass:(Class)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class associationPropertyForEntityClass:]( a3,  "associationPropertyForEntityClass:",  self->_associatedEntityClass));
  uint64_t v6 = objc_claimAutoreleasedReturnValue( -[objc_class associationPropertyForEntityClass:]( self->_associatedEntityClass,  "associationPropertyForEntityClass:",  a3));
  v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](&OBJC_CLASS___NSMutableString, "stringWithFormat:", @"0"));
  }

  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class disambiguatedSQLForProperty:](a3, "disambiguatedSQLForProperty:", v5));
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class disambiguatedSQLForProperty:]( self->_associatedEntityClass,  "disambiguatedSQLForProperty:",  v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class databaseTable](self->_associatedEntityClass, "databaseTable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"((SELECT 1 FROM %@"),  v10);

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    -[objc_class addJoinClausesForProperty:toJoins:]( self->_associatedEntityClass,  "addJoinClausesForProperty:toJoins:",  v9,  v12);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    v13 = v12;
    id v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        v17 = 0LL;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v17);
          [v11 appendString:@" "];
          [v11 appendString:v18];
          v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
      }

      while (v15);
    }

    [v11 appendFormat:@" WHERE %@ = %@ LIMIT 1 IS NOT NULL]"), v21, v9);
  }

  id v19 = [v11 copy];

  return v19;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
         objc_opt_class(self, a2),
         self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v4 appendFormat:@"associatedEntityClass: %@; ", self->_associatedEntityClass];
  [v4 appendFormat:@">"];
  return v4;
}

- (void).cxx_destruct
{
}

@end