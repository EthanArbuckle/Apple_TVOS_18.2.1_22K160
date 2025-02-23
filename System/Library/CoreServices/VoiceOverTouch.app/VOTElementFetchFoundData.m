@interface VOTElementFetchFoundData
+ (id)fetchFoundData:(id)a3 forceUpdate:(BOOL)a4 direction:(int64_t)a5 generation:(unint64_t)a6 range:(_NSRange)a7 searchType:(int64_t)a8;
- (BOOL)needsForceCacheUpdate;
- (BOOL)searchEndedWithDifferentGroup;
- (NSUUID)searchUUID;
- (VOTElement)element;
- (_NSRange)range;
- (id)description;
- (int64_t)direction;
- (int64_t)searchType;
- (unint64_t)clientGeneration;
- (void)setClientGeneration:(unint64_t)a3;
- (void)setDirection:(int64_t)a3;
- (void)setElement:(id)a3;
- (void)setNeedsForceCacheUpdate:(BOOL)a3;
- (void)setRange:(_NSRange)a3;
- (void)setSearchEndedWithDifferentGroup:(BOOL)a3;
- (void)setSearchType:(int64_t)a3;
- (void)setSearchUUID:(id)a3;
@end

@implementation VOTElementFetchFoundData

+ (id)fetchFoundData:(id)a3 forceUpdate:(BOOL)a4 direction:(int64_t)a5 generation:(unint64_t)a6 range:(_NSRange)a7 searchType:(int64_t)a8
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  BOOL v12 = a4;
  id v13 = a3;
  v14 = objc_alloc_init(&OBJC_CLASS___VOTElementFetchFoundData);
  -[VOTElementFetchFoundData setElement:](v14, "setElement:", v13);

  -[VOTElementFetchFoundData setNeedsForceCacheUpdate:](v14, "setNeedsForceCacheUpdate:", v12);
  -[VOTElementFetchFoundData setDirection:](v14, "setDirection:", a5);
  -[VOTElementFetchFoundData setClientGeneration:](v14, "setClientGeneration:", a6);
  -[VOTElementFetchFoundData setRange:](v14, "setRange:", location, length);
  -[VOTElementFetchFoundData setSearchType:](v14, "setSearchType:", a8);
  return v14;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___VOTElementFetchFoundData;
  id v3 = -[VOTElementFetchFoundData description](&v10, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElementFetchFoundData element](self, "element"));
  v11.NSUInteger location = (NSUInteger)-[VOTElementFetchFoundData range](self, "range");
  v6 = NSStringFromRange(v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ element: %@, range: %@",  v4,  v5,  v7));

  return v8;
}

- (VOTElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
}

- (BOOL)needsForceCacheUpdate
{
  return self->_needsForceCacheUpdate;
}

- (void)setNeedsForceCacheUpdate:(BOOL)a3
{
  self->_needsForceCacheUpdate = a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (unint64_t)clientGeneration
{
  return self->_clientGeneration;
}

- (void)setClientGeneration:(unint64_t)a3
{
  self->_clientGeneration = a3;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (int64_t)searchType
{
  return self->_searchType;
}

- (void)setSearchType:(int64_t)a3
{
  self->_searchType = a3;
}

- (NSUUID)searchUUID
{
  return self->_searchUUID;
}

- (void)setSearchUUID:(id)a3
{
}

- (BOOL)searchEndedWithDifferentGroup
{
  return self->_searchEndedWithDifferentGroup;
}

- (void)setSearchEndedWithDifferentGroup:(BOOL)a3
{
  self->_searchEndedWithDifferentGroup = a3;
}

- (void).cxx_destruct
{
}

@end