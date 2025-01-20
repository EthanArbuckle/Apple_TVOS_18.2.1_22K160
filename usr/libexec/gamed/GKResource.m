@interface GKResource
+ (GKResource)resourceWithID:(id)a3;
+ (GKResource)resourceWithID:(id)a3 representedItem:(id)a4;
+ (GKResource)resourceWithID:(id)a3 representedItem:(id)a4 TTL:(double)a5;
+ (id)resourceForPlayer:(id)a3;
+ (id)resourceForPlayer:(id)a3 TTL:(double)a4;
+ (id)resourceForRemoveGames:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpired;
- (BOOL)isInvalid;
- (GKResource)init;
- (GKResource)initWithResourceID:(id)a3 representedItem:(id)a4 TTL:(double)a5;
- (NSMutableDictionary)metadataLookup;
- (NSObject)resourceID;
- (double)TTL;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (id)representedItem;
- (unint64_t)hash;
- (void)setInvalid:(BOOL)a3;
- (void)setMetadataLookup:(id)a3;
- (void)setRepresentedItem:(id)a3;
- (void)setResourceID:(id)a3;
- (void)setTTL:(double)a3;
@end

@implementation GKResource

+ (id)resourceForRemoveGames:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[GKResource resourceWithID:representedItem:]( &OBJC_CLASS___GKMutableResource,  "resourceWithID:representedItem:",  a3,  a3));
}

+ (GKResource)resourceWithID:(id)a3
{
  return (GKResource *)[a1 resourceWithID:a3 representedItem:0 TTL:0.0];
}

+ (GKResource)resourceWithID:(id)a3 representedItem:(id)a4
{
  return (GKResource *)[a1 resourceWithID:a3 representedItem:a4 TTL:0.0];
}

+ (GKResource)resourceWithID:(id)a3 representedItem:(id)a4 TTL:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  id v11 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v10)), "initWithResourceID:representedItem:TTL:", v9, v8, a5);

  return (GKResource *)v11;
}

- (GKResource)initWithResourceID:(id)a3 representedItem:(id)a4 TTL:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___GKResource;
  uint64_t v10 = -[GKResource init](&v16, "init");
  if (v10)
  {
    id v11 = [v8 copyWithZone:0];
    resourceID = v10->_resourceID;
    v10->_resourceID = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    metadataLookup = v10->_metadataLookup;
    v10->_metadataLookup = v13;

    v10->_TTL = a5;
    -[GKResource setRepresentedItem:](v10, "setRepresentedItem:", v9);
  }

  return v10;
}

- (GKResource)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSGenericException,  @"Can't use init on GKDataResource. Use resourceWithID: instead.",  0LL));
  objc_exception_throw(v2);
  return (GKResource *)-[GKResource copyWithZone:](v3, v4, v5);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  SEL v4 = -[GKResource initWithResourceID:representedItem:TTL:]( objc_alloc(&OBJC_CLASS___GKMutableResource),  "initWithResourceID:representedItem:TTL:",  self->_resourceID,  self->_representedItem,  self->_TTL);
  v5 = v4;
  if (v4)
  {
    v4->super._invalid = self->_invalid;
    id v6 = -[NSMutableDictionary copy](self->_metadataLookup, "copy");
    -[GKResource setMetadataLookup:](v5, "setMetadataLookup:", v6);
  }

  return v5;
}

- (id)description
{
  if (qword_1002BB578 != -1) {
    dispatch_once(&qword_1002BB578, &stru_100270C08);
  }
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GKResource;
  id v3 = -[GKResource description](&v11, "description");
  SEL v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  resourceID = self->_resourceID;
  id v6 = (void *)qword_1002BB570;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  self->_TTL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringFromDate:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ ID: %@ TTL: %@\nitem: %@",  v4,  resourceID,  v8,  self->_representedItem));

  return v9;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSObject hash](self->_resourceID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___GKResource, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    resourceID = self->_resourceID;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 resourceID]);
    unsigned __int8 v9 = -[NSObject isEqual:](resourceID, "isEqual:", v8);
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_metadataLookup, "objectForKeyedSubscript:", a3);
}

- (BOOL)isExpired
{
  if (-[GKResource isInvalid](self, "isInvalid")) {
    return 1;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  self->_TTL));
  [v4 timeIntervalSinceNow];
  BOOL v3 = v5 <= 0.0;

  return v3;
}

- (BOOL)isInvalid
{
  return !self->_representedItem || self->_invalid;
}

- (NSObject)resourceID
{
  return self->_resourceID;
}

- (void)setResourceID:(id)a3
{
}

- (id)representedItem
{
  return self->_representedItem;
}

- (void)setRepresentedItem:(id)a3
{
}

- (double)TTL
{
  return self->_TTL;
}

- (void)setTTL:(double)a3
{
  self->_TTL = a3;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (NSMutableDictionary)metadataLookup
{
  return self->_metadataLookup;
}

- (void)setMetadataLookup:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)resourceForPlayer:(id)a3
{
  return _[a1 resourceForPlayer:a3 TTL:0.0];
}

+ (id)resourceForPlayer:(id)a3 TTL:(double)a4
{
  id v6 = a3;
  id v8 = (void *)objc_opt_class(a1, v7);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 playerID]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 resourceWithID:v9 representedItem:v6 TTL:a4]);

  return v10;
}

@end