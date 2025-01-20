@interface AccessoryPresenceInputs
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializePredicates:(id)a3;
- (NSArray)modelNumbers;
- (NSString)identifier;
- (unint64_t)timeout;
- (void)setIdentifier:(id)a3;
- (void)setModelNumbers:(id)a3;
- (void)setTimeout:(unint64_t)a3;
@end

@implementation AccessoryPresenceInputs

- (BOOL)validateAndInitializePredicates:(id)a3
{
  char v8 = 0;
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", @"USB", @"MiniJack", 0LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_stringFromRequiredKey:inSet:failed:", @"identifier", v5, &v8));

  -[AccessoryPresenceInputs setIdentifier:](self, "setIdentifier:", v6);
  return v8 == 0;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  char v10 = 0;
  id v4 = a3;
  v5 = +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", objc_opt_class(&OBJC_CLASS___NSString));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "dk_arrayFromKey:types:maxLength:defaultValue:failed:",  @"accessoryModelNumbers",  v6,  100,  &__NSArray0__struct,  &v10));
  -[AccessoryPresenceInputs setModelNumbers:](self, "setModelNumbers:", v7);

  char v8 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:",  @"timeOut",  &off_100004258,  &off_100004270,  &off_100004258,  &v10));
  -[AccessoryPresenceInputs setTimeout:](self, "setTimeout:", [v8 integerValue]);

  return v10 == 0;
}

- (NSArray)modelNumbers
{
  return self->_modelNumbers;
}

- (void)setModelNumbers:(id)a3
{
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end