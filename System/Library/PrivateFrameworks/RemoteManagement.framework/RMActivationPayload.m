@interface RMActivationPayload
- (RMPredicateDescription)predicateDescription;
- (id)reportDetails;
- (void)setPredicateDescription:(id)a3;
@end

@implementation RMActivationPayload

- (RMPredicateDescription)predicateDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[RMActivationPayload primitiveValueForKey:]( self,  "primitiveValueForKey:",  @"predicateDescription"));
  -[RMActivationPayload didAccessValueForKey:](self, "didAccessValueForKey:", @"predicateDescription");
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMActivationPayload predicateDescription](self, "predicateDescription"));
    if (v4)
    {
      id v8 = 0LL;
      id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___RMPredicateDescription),  v4,  &v8);
      v3 = (void *)objc_claimAutoreleasedReturnValue(v5);
      id v6 = v8;
      if (v3)
      {
        -[RMActivationPayload setPrimitiveValue:forKey:]( self,  "setPrimitiveValue:forKey:",  v3,  @"predicateDescription");
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        sub_100012294((uint64_t)self);
      }
    }

    else
    {
      v3 = 0LL;
    }
  }

  return (RMPredicateDescription *)v3;
}

- (void)setPredicateDescription:(id)a3
{
  id v4 = a3;
  -[RMActivationPayload willChangeValueForKey:](self, "willChangeValueForKey:", @"predicateDescription");
  -[RMActivationPayload setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, @"predicateDescription");
  if (v4)
  {
    id v7 = 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v7));
    id v6 = v7;
    if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100012318((uint64_t)self);
    }
  }

  else
  {
    id v5 = 0LL;
  }

  -[RMActivationPayload setPredicateDescription_:](self, "setPredicateDescription_:", v5);
  -[RMActivationPayload didChangeValueForKey:](self, "didChangeValueForKey:", @"predicateDescription");
}

- (id)reportDetails
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___RMActivationPayload;
  id v3 = -[RMDeclarationPayload reportDetails](&v14, "reportDetails");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMActivationPayload configurationReferences](self, "configurationReferences"));
  if ([v6 count])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:@"configurationIdentifier"]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
  }

  else
  {
    v9 = &__NSArray0__struct;
  }

  [v5 setObject:v9 forKeyedSubscript:@"configurationReferences"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMActivationPayload predicateDescription](self, "predicateDescription"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);
  [v5 setObject:v11 forKeyedSubscript:@"predicateDescription"];

  id v12 = [v5 copy];
  return v12;
}

@end