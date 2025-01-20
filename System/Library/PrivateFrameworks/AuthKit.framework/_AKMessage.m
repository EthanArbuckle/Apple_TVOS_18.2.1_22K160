@interface _AKMessage
+ (id)messageFromTransportRepresentation:(id)a3;
+ (unint64_t)typeForMessageWithTransportRepresentation:(id)a3;
- (NSString)identifier;
- (_AKMessage)init;
- (id)transportRepresentation;
- (unint64_t)type;
@end

@implementation _AKMessage

+ (unint64_t)typeForMessageWithTransportRepresentation:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"aktyp"]);
  id v4 = [v3 unsignedIntegerValue];

  return (unint64_t)v4;
}

+ (id)messageFromTransportRepresentation:(id)a3
{
  id v4 = a3;
  v6 = objc_alloc_init((Class)objc_opt_class(a1, v5));
  id v7 = [v4 mutableCopy];

  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (_AKMessage)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____AKMessage;
  v2 = -[_AKMessage init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    properties = v2->_properties;
    v2->_properties = v3;

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_properties,  "setObject:forKeyedSubscript:",  v6,  @"akid");
  }

  return v2;
}

- (NSString)identifier
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  @"akid");
}

- (unint64_t)type
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  @"aktyp"));
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (id)transportRepresentation
{
  return self->_properties;
}

- (void).cxx_destruct
{
}

@end