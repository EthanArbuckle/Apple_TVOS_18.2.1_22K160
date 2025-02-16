@interface TBFetchedTile
+ (id)fetchedTileWithKey:(unint64_t)a3 etag:(id)a4 created:(id)a5;
- (BOOL)_isEqualToFetchedTile:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)created;
- (NSString)description;
- (NSString)etag;
- (TBFetchedTile)initWithKey:(unint64_t)a3 etag:(id)a4 created:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)key;
- (void)setCreated:(id)a3;
- (void)setEtag:(id)a3;
- (void)setKey:(unint64_t)a3;
@end

@implementation TBFetchedTile

+ (id)fetchedTileWithKey:(unint64_t)a3 etag:(id)a4 created:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = (void *)[objc_alloc((Class)a1) initWithKey:a3 etag:v9 created:v8];

  return v10;
}

- (TBFetchedTile)initWithKey:(unint64_t)a3 etag:(id)a4 created:(id)a5
{
  id v8 = (NSString *)a4;
  id v9 = (NSDate *)a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TBFetchedTile;
  v10 = -[TBFetchedTile init](&v15, sel_init);
  etag = v10->_etag;
  v10->_key = a3;
  v10->_etag = v8;
  v12 = v8;

  created = v10->_created;
  v10->_created = v9;

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setKey:", -[TBFetchedTile key](self, "key"));
  v5 = -[TBFetchedTile etag](self, "etag");
  [v4 setEtag:v5];
  v6 = -[TBFetchedTile created](self, "created");
  [v4 setCreated:v6];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TBFetchedTile _isEqualToFetchedTile:](self, "_isEqualToFetchedTile:", v4);

  return v5;
}

- (BOOL)_isEqualToFetchedTile:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[TBFetchedTile key](self, "key");
  uint64_t v6 = [v4 key];

  return v5 == v6;
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x189607940];
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ : %p ", v5, self];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", @"key: %llu", -[TBFetchedTile key](self, "key"));
  [v6 appendString:@">"];
  return (NSString *)v6;
}

- (unint64_t)key
{
  return self->_key;
}

- (void)setKey:(unint64_t)a3
{
  self->_key = a3;
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (NSDate)created
{
  return self->_created;
}

- (void)setCreated:(id)a3
{
}

- (void).cxx_destruct
{
}

@end