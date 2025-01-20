@interface StoreItemSubGenre
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation StoreItemSubGenre

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = -[StoreItemSubGenre init]( +[StoreItemSubGenre allocWithZone:](&OBJC_CLASS___StoreItemSubGenre, "allocWithZone:"),  "init");
  v6 = (NSString *)-[NSString copyWithZone:](self->_genre, "copyWithZone:", a3);
  genre = v5->_genre;
  v5->_genre = v6;

  v8 = (NSNumber *)-[NSNumber copyWithZone:](self->_genreID, "copyWithZone:", a3);
  genreID = v5->_genreID;
  v5->_genreID = v8;

  return v5;
}

- (void).cxx_destruct
{
}

@end