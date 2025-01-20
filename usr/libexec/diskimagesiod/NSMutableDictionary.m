@interface NSMutableDictionary
- (BOOL)validateAndPopObjectForKey:(id)a3 className:(Class)a4 isOptional:(BOOL)a5 error:(id *)a6;
- (BOOL)validateObjWithKey:(id)a3 className:(Class)a4 isOptional:(BOOL)isKindOfClass error:(id *)a6;
- (id)popObjectForKey:(id)a3;
@end

@implementation NSMutableDictionary

- (id)popObjectForKey:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self, "objectForKey:", v4));
  -[NSMutableDictionary removeObjectForKey:](self, "removeObjectForKey:", v4);

  return v5;
}

- (BOOL)validateAndPopObjectForKey:(id)a3 className:(Class)a4 isOptional:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  LOBYTE(a6) = -[NSMutableDictionary validateObjWithKey:className:isOptional:error:]( self,  "validateObjWithKey:className:isOptional:error:",  v10,  a4,  v7,  a6);
  id v11 = -[NSMutableDictionary popObjectForKey:](self, "popObjectForKey:", v10);

  return (char)a6;
}

- (BOOL)validateObjWithKey:(id)a3 className:(Class)a4 isOptional:(BOOL)isKindOfClass error:(id *)a6
{
  id v10 = a3;
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self, "objectForKey:", v10));
  v12 = (void *)v11;
  if (v11) {
    isKindOfClass = objc_opt_isKindOfClass(v11, a4);
  }
  if (a6 && !isKindOfClass)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Validation failed for dictionary key %@.",  v10));
    *a6 = (id)objc_claimAutoreleasedReturnValue( +[DIError errorWithPOSIXCode:verboseInfo:]( &OBJC_CLASS___DIError,  "errorWithPOSIXCode:verboseInfo:",  22LL,  v13));
  }

  return isKindOfClass;
}

@end