@interface GKResourceIdentifier
+ (id)resourceIdentifierForKeys:(id)a3;
+ (id)resourceIdentifiersForBagKeys:(id)a3;
- (BOOL)isEqual:(id)a3;
- (GKResourceIdentifier)initWithKeys:(id)a3;
- (NSArray)keys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setKeys:(id)a3;
@end

@implementation GKResourceIdentifier

- (id)copyWithZone:(_NSZone *)a3
{
  return -[GKResourceIdentifier initWithKeys:]( +[GKResourceIdentifier allocWithZone:](&OBJC_CLASS___GKResourceIdentifier, "allocWithZone:", a3),  "initWithKeys:",  self->_keys);
}

- (GKResourceIdentifier)initWithKeys:(id)a3
{
  id v4 = a3;
  if (![v4 count])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"A GKResourceIdentifier must have at least one key"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKResourceManager.m"));
    id v7 = objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (0 < [keys count])\n[%s (%s:%d)]",  v5,  "-[GKResourceIdentifier initWithKeys:]",  [v7 UTF8String],  35));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v8);
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___GKResourceIdentifier;
  v9 = -[GKResourceIdentifier init](&v18, "init");
  if (v9)
  {
    v10 = (NSArray *)[v4 copy];
    keys = v9->_keys;
    v9->_keys = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"com.apple.gamed.resourceQueue"));
    v13 = v9->_keys;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000971A8;
    v16[3] = &unk_100270060;
    id v17 = v12;
    id v14 = v12;
    -[NSArray enumerateObjectsUsingBlock:](v13, "enumerateObjectsUsingBlock:", v16);
  }

  return v9;
}

+ (id)resourceIdentifiersForBagKeys:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100097230;
  v4[3] = &unk_100270080;
  v4[4] = a1;
  return (id)objc_claimAutoreleasedReturnValue([a3 _gkMapWithBlock:v4]);
}

+ (id)resourceIdentifierForKeys:(id)a3
{
  id v3 = a3;
  id v4 = -[GKResourceIdentifier initWithKeys:](objc_alloc(&OBJC_CLASS___GKResourceIdentifier), "initWithKeys:", v3);

  return v4;
}

- (unint64_t)hash
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  id v10 = -[NSArray hash](self->_keys, "hash");
  keys = self->_keys;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000973C8;
  v6[3] = &unk_10026DF90;
  v6[4] = &v7;
  -[NSArray enumerateObjectsUsingBlock:](keys, "enumerateObjectsUsingBlock:", v6);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  keys = self->_keys;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 keys]);
  LOBYTE(keys) = -[NSArray isEqual:](keys, "isEqual:", v4);

  return (char)keys;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GKResourceIdentifier;
  id v3 = -[GKResourceIdentifier description](&v7, "description");
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ keys: %@",  v4,  self->_keys));

  return v5;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end