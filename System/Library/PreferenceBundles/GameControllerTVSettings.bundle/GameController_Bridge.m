@interface GameController_Bridge
+ (BOOL)gcControllerElement_remappable:(id)a3;
+ (id)gcControllerElement_primaryAlias:(id)a3;
+ (id)gcController_persistentIdentifier:(id)a3;
+ (id)gcsController_initWithController:(id)a3;
+ (id)gcsElement_initWithControllerEmenet:(id)a3;
+ (int)gcControllerElement_remappingKey:(id)a3;
@end

@implementation GameController_Bridge

+ (BOOL)gcControllerElement_remappable:(id)a3
{
  return [a3 remappable];
}

+ (int)gcControllerElement_remappingKey:(id)a3
{
  return [a3 remappingKey];
}

+ (id)gcControllerElement_primaryAlias:(id)a3
{
  return [a3 primaryAlias];
}

+ (id)gcController_persistentIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0) {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  }
  else {
    v7 = 0LL;
  }

  return v7;
}

+ (id)gcsController_initWithController:(id)a3
{
  id v3 = a3;
  v4 = -[GCSController initWithController:](objc_alloc(&OBJC_CLASS___GCSController), "initWithController:", v3);

  return v4;
}

+ (id)gcsElement_initWithControllerEmenet:(id)a3
{
  id v3 = a3;
  v4 = -[GCSElement initWithElement:](objc_alloc(&OBJC_CLASS___GCSElement), "initWithElement:", v3);

  return v4;
}

@end