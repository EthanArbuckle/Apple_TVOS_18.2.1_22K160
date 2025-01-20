@interface TBGloriaTile
+ (id)gloriaTileWithLat:(double)a3 lng:(double)a4 zoom:(unsigned __int8)a5;
+ (unsigned)defaultZoomLevel;
- (NSString)WKTString;
- (TBGloriaTile)initWithEncodedKey:(unint64_t)a3 zoom:(unsigned __int8)a4;
- (TBGloriaTile)initWithLat:(double)a3 lng:(double)a4;
- (TBGloriaTile)initWithLat:(double)a3 lng:(double)a4 zoom:(unsigned __int8)a5;
- (double)east;
- (double)lat;
- (double)lng;
- (double)north;
- (double)south;
- (double)tileSize;
- (double)west;
- (id)adjacentTileKeysWithLevel:(unsigned int)a3;
- (id)neighborTileKeysWithRadius:(double)a3;
- (unint64_t)key;
- (unsigned)zoom;
- (void)setEast:(double)a3;
- (void)setKey:(unint64_t)a3;
- (void)setLat:(double)a3;
- (void)setLng:(double)a3;
- (void)setNorth:(double)a3;
- (void)setSouth:(double)a3;
- (void)setTileSize:(double)a3;
- (void)setWKTString:(id)a3;
- (void)setWest:(double)a3;
- (void)setZoom:(unsigned __int8)a3;
@end

@implementation TBGloriaTile

- (TBGloriaTile)initWithEncodedKey:(unint64_t)a3 zoom:(unsigned __int8)a4
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TBGloriaTile;
  v6 = -[TBGloriaTile init](&v20, sel_init);
  v6->_key = a3;
  v6->_zoom = a4;
  gloria::TileId::TileId((uint64_t)v19, a3);
  double v15 = gloria::TileId::ToBBOX((gloria::TileId *)v19);
  double v16 = v7;
  double v17 = v8;
  double v18 = v9;
  v6->_north = v15;
  v6->_south = v7;
  v6->_east = v8;
  v6->_west = v9;
  v6->_tileSize = gloria::TileId::TileSize((gloria::TileId *)v19);
  gloria::TileBoundingBox::ToWKT(&__p);
  if ((char)__p.__r_.__value_.__s.__size_ < 0)
  {
    if (!__p.__r_.__value_.__l.__size_) {
      goto LABEL_7;
    }
    p_p = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
  }

  else
  {
    if (!__p.__r_.__value_.__s.__size_) {
      goto LABEL_7;
    }
    p_p = &__p;
  }

  uint64_t v11 = [NSString stringWithUTF8String:p_p];
  WKTString = v6->_WKTString;
  v6->_WKTString = (NSString *)v11;

LABEL_7:
  return v6;
}

+ (id)gloriaTileWithLat:(double)a3 lng:(double)a4 zoom:(unsigned __int8)a5
{
  return (id)[objc_alloc((Class)a1) initWithLat:a5 lng:a3 zoom:a4];
}

- (TBGloriaTile)initWithLat:(double)a3 lng:(double)a4
{
  return -[TBGloriaTile initWithLat:lng:zoom:]( self,  "initWithLat:lng:zoom:",  +[TBGloriaTile defaultZoomLevel](&OBJC_CLASS___TBGloriaTile, "defaultZoomLevel"),  a3,  a4);
}

- (TBGloriaTile)initWithLat:(double)a3 lng:(double)a4 zoom:(unsigned __int8)a5
{
  double v17 = a3;
  double v16 = a4;
  char v15 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TBGloriaTile;
  double v8 = -[TBGloriaTile init](&v14, sel_init);
  v8->_lat = a3;
  v8->_lng = a4;
  v8->_zoom = a5;
  gloria::TileId::FromLatLng((gloria::TileId *)&v17, &v16, (const double *)&v15, (uint64_t)v13);
  v8->_key = gloria::TileId::GetEncodedTileId((gloria::TileId *)v13);
  v8->_tileSize = gloria::TileId::TileSize((gloria::TileId *)v13);
  v8->_north = _TBGloriaBoundingBoxFromLocation(v17, v16, v15);
  v8->_south = v9;
  v8->_east = v10;
  v8->_west = v11;
  return v8;
}

+ (unsigned)defaultZoomLevel
{
  return +[TBDefaults zoomLevel](&OBJC_CLASS___TBDefaults, "zoomLevel");
}

- (id)adjacentTileKeysWithLevel:(unsigned int)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  gloria::TileId::TileId((uint64_t)v14, -[TBGloriaTile key](self, "key"));
  gloria::TileId::Neighbors((gloria::TileId *)v14, a3, (uint64_t)&v12);
  v6 = v12;
  if (v12 != v13)
  {
    do
    {
      [MEMORY[0x189607968] numberWithUnsignedLongLong:gloria::TileId::GetEncodedTileId((gloria::TileId *)(v6 + 4))];
      double v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 addObject:v7];

      double v8 = (void *)v6[1];
      if (v8)
      {
        do
        {
          double v9 = (void **)v8;
          double v8 = (void *)*v8;
        }

        while (v8);
      }

      else
      {
        do
        {
          double v9 = (void **)v6[2];
          BOOL v10 = *v9 == v6;
          v6 = v9;
        }

        while (!v10);
      }

      v6 = v9;
    }

    while (v9 != v13);
  }

  std::__tree<gloria::TileId>::destroy((uint64_t)&v12, v13[0]);
  return v5;
}

- (id)neighborTileKeysWithRadius:(double)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  gloria::TileId::TileId((uint64_t)v14, -[TBGloriaTile key](self, "key"));
  gloria::TileId::NeighborsWithinRadius((gloria::TileId *)v14, a3, (uint64_t)&v12);
  v6 = v12;
  if (v12 != v13)
  {
    do
    {
      [MEMORY[0x189607968] numberWithUnsignedLongLong:gloria::TileId::GetEncodedTileId((gloria::TileId *)(v6 + 4))];
      double v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 addObject:v7];

      double v8 = (void *)v6[1];
      if (v8)
      {
        do
        {
          double v9 = (void **)v8;
          double v8 = (void *)*v8;
        }

        while (v8);
      }

      else
      {
        do
        {
          double v9 = (void **)v6[2];
          BOOL v10 = *v9 == v6;
          v6 = v9;
        }

        while (!v10);
      }

      v6 = v9;
    }

    while (v9 != v13);
  }

  std::__tree<gloria::TileId>::destroy((uint64_t)&v12, v13[0]);
  return v5;
}

- (unint64_t)key
{
  return self->_key;
}

- (void)setKey:(unint64_t)a3
{
  self->_key = a3;
}

- (double)lat
{
  return self->_lat;
}

- (void)setLat:(double)a3
{
  self->_lat = a3;
}

- (double)lng
{
  return self->_lng;
}

- (void)setLng:(double)a3
{
  self->_lng = a3;
}

- (unsigned)zoom
{
  return self->_zoom;
}

- (void)setZoom:(unsigned __int8)a3
{
  self->_zoom = a3;
}

- (NSString)WKTString
{
  return self->_WKTString;
}

- (void)setWKTString:(id)a3
{
}

- (double)tileSize
{
  return self->_tileSize;
}

- (void)setTileSize:(double)a3
{
  self->_tileSize = a3;
}

- (double)north
{
  return self->_north;
}

- (void)setNorth:(double)a3
{
  self->_north = a3;
}

- (double)south
{
  return self->_south;
}

- (void)setSouth:(double)a3
{
  self->_south = a3;
}

- (double)east
{
  return self->_east;
}

- (void)setEast:(double)a3
{
  self->_east = a3;
}

- (double)west
{
  return self->_west;
}

- (void)setWest:(double)a3
{
  self->_west = a3;
}

- (void).cxx_destruct
{
}

@end