@interface MediaLibraryCache
- (MediaLibraryCache)init;
- (id)collectionsForProperty:(id)a3;
- (id)collectionsForPropertyNoQ:(id)a3;
- (id)description;
- (id)globalItemCountForProperty:(id)a3;
- (id)globalItemCountForPropertyNoQ:(id)a3;
- (id)itemCountForProperty:(id)a3;
- (id)itemCountForPropertyNoQ:(id)a3;
- (id)itemNamesForRange:(_NSRange)a3 forProperty:(id)a4;
- (id)itemNamesForRangeNoQ:(_NSRange)a3 forProperty:(id)a4;
- (void)dealloc;
- (void)invalidateMediaItem:(id)a3;
- (void)performOnQueue:(id)a3;
- (void)reset;
- (void)setCollections:(id)a3 forProperty:(id)a4;
- (void)setCollectionsNoQ:(id)a3 forProperty:(id)a4;
- (void)setGlobalItemCount:(unsigned int)a3 ForProperty:(id)a4;
- (void)setGlobalItemCountNoQ:(unsigned int)a3 ForProperty:(id)a4;
- (void)setItemCount:(unsigned int)a3 forProperty:(id)a4;
- (void)setItemCountNoQ:(unsigned int)a3 forProperty:(id)a4;
- (void)setItemNames:(id)a3 forRange:(_NSRange)a4 forProperty:(id)a5;
- (void)setItemNamesNoQ:(id)a3 forRange:(_NSRange)a4 forProperty:(id)a5;
@end

@implementation MediaLibraryCache

- (MediaLibraryCache)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MediaLibraryCache;
  result = -[MediaLibraryCache init](&v4, "init");
  v3 = result;
  if (!result) {
    return v3;
  }
  if ((((_BYTE)result + 8) & 7) == 0)
  {
    result->_itemCaches = 0LL;
    result = (MediaLibraryCache *)dispatch_queue_create("com.apple.iapd.mediaLibraryCacheQ", 0LL);
    if (((unint64_t)&v3->_mediaLibraryCacheQ & 7) == 0)
    {
      v3->_mediaLibraryCacheQ = (OS_dispatch_queue *)result;
      return v3;
    }
  }

  __break(0x5516u);
  return result;
}

- (void)dealloc
{
  if ((((_BYTE)self + 8) & 7) != 0
    || (self->_itemCaches,
        self->_itemCaches = 0LL,
        p_mediaLibraryCacheQ = &self->_mediaLibraryCacheQ,
        ((unint64_t)&self->_mediaLibraryCacheQ & 7) != 0))
  {
    __break(0x5516u);
  }

  else if (*p_mediaLibraryCacheQ)
  {
    dispatch_release((dispatch_object_t)*p_mediaLibraryCacheQ);
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___MediaLibraryCache;
    -[MediaLibraryCache dealloc](&v4, "dealloc");
    return;
  }

  __break(0x5510u);
}

- (id)description
{
  if ((((_BYTE)self + 8) & 7) == 0) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<MediaLibraryCache %hhx> _itemCaches=%@",  self,  *((void *)self + 1),  v2,  v3);
  }
  __break(0x5516u);
  return self;
}

- (void)reset
{
  if (((unint64_t)&self->_mediaLibraryCacheQ & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    mediaLibraryCacheQ = (dispatch_queue_s *)self->_mediaLibraryCacheQ;
    if (mediaLibraryCacheQ)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100035F3C;
      block[3] = &unk_100101C70;
      block[4] = self;
      dispatch_sync(mediaLibraryCacheQ, block);
      return;
    }
  }

  __break(0x5510u);
}

- (void)setGlobalItemCount:(unsigned int)a3 ForProperty:(id)a4
{
  if (((unint64_t)&self->_mediaLibraryCacheQ & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    mediaLibraryCacheQ = (dispatch_queue_s *)self->_mediaLibraryCacheQ;
    if (mediaLibraryCacheQ)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000360D8;
      block[3] = &unk_100104470;
      unsigned int v6 = a3;
      block[4] = self;
      void block[5] = a4;
      dispatch_sync(mediaLibraryCacheQ, block);
      return;
    }
  }

  __break(0x5510u);
}

- (id)globalItemCountForProperty:(id)a3
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_1000361B0;
  v10 = sub_1000361C0;
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  if ((((unint64_t)self + 16) & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    uint64_t v3 = (dispatch_queue_s *)*((void *)self + 2);
    if (v3)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000361CC;
      block[3] = &unk_100104498;
      void block[5] = a3;
      void block[6] = &v6;
      block[4] = self;
      dispatch_sync(v3, block);
      objc_super v4 = (void *)v7[5];
      _Block_object_dispose(&v6, 8);
      return v4;
    }
  }

  __break(0x5510u);
  return self;
}

- (void)setGlobalItemCountNoQ:(unsigned int)a3 ForProperty:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = sub_100036244(a4, (id *)&self->_itemCaches);
  objc_msgSend( v5,  "setGlobalCount:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4));
}

- (id)globalItemCountForPropertyNoQ:(id)a3
{
  id v3 = sub_100036244(a3, (id *)&self->_itemCaches);
  return [v3 globalCount];
}

- (void)setItemCount:(unsigned int)a3 forProperty:(id)a4
{
  if (((unint64_t)&self->_mediaLibraryCacheQ & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    mediaLibraryCacheQ = (dispatch_queue_s *)self->_mediaLibraryCacheQ;
    if (mediaLibraryCacheQ)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100036364;
      block[3] = &unk_100104470;
      unsigned int v6 = a3;
      block[4] = self;
      void block[5] = a4;
      dispatch_sync(mediaLibraryCacheQ, block);
      return;
    }
  }

  __break(0x5510u);
}

- (void)setItemNames:(id)a3 forRange:(_NSRange)a4 forProperty:(id)a5
{
  p_mediaLibraryCacheQ = &self->_mediaLibraryCacheQ;
  if (((unint64_t)&self->_mediaLibraryCacheQ & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    v7 = (dispatch_queue_s *)*p_mediaLibraryCacheQ;
    if (*p_mediaLibraryCacheQ)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000363EC;
      block[3] = &unk_1001044C0;
      block[4] = self;
      void block[5] = a3;
      _NSRange v9 = a4;
      void block[6] = a5;
      dispatch_sync(v7, block);
      return;
    }
  }

  __break(0x5510u);
}

- (void)setItemCountNoQ:(unsigned int)a3 forProperty:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = sub_100036244(a4, (id *)&self->_itemCaches);
  objc_msgSend( v5,  "setItemCount:",  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4));
}

- (void)setItemNamesNoQ:(id)a3 forRange:(_NSRange)a4 forProperty:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = sub_100036244(a5, (id *)&self->_itemCaches);
  objc_msgSend(v8, "setItemNames:forRange:", a3, location, length);
}

- (id)itemCountForProperty:(id)a3
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  _NSRange v9 = sub_1000361B0;
  v10 = sub_1000361C0;
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  if ((((unint64_t)self + 16) & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    id v3 = (dispatch_queue_s *)*((void *)self + 2);
    if (v3)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100036550;
      block[3] = &unk_100104498;
      void block[5] = a3;
      void block[6] = &v6;
      block[4] = self;
      dispatch_sync(v3, block);
      uint64_t v4 = (void *)v7[5];
      _Block_object_dispose(&v6, 8);
      return v4;
    }
  }

  __break(0x5510u);
  return self;
}

- (id)itemNamesForRange:(_NSRange)a3 forProperty:(id)a4
{
  uint64_t v8 = 0LL;
  _NSRange v9 = &v8;
  uint64_t v10 = 0x3052000000LL;
  unint64_t v11 = sub_1000361B0;
  v12 = sub_1000361C0;
  uint64_t v13 = 0LL;
  if ((((unint64_t)self + 16) & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    uint64_t v4 = (dispatch_queue_s *)*((void *)self + 2);
    if (v4)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10003664C;
      block[3] = &unk_1001044E8;
      void block[6] = &v8;
      _NSRange v7 = a3;
      block[4] = self;
      void block[5] = a4;
      dispatch_sync(v4, block);
      id v5 = (void *)v9[5];
      _Block_object_dispose(&v8, 8);
      return v5;
    }
  }

  __break(0x5510u);
  return self;
}

- (id)itemCountForPropertyNoQ:(id)a3
{
  if (((unint64_t)&self->_itemCaches & 7) == 0) {
    return objc_msgSend( -[NSMutableDictionary objectForKey:](self->_itemCaches, "objectForKey:", a3, v3, v4),  "itemCount");
  }
  __break(0x5516u);
  return -[MediaLibraryCache itemCount](self, "itemCount");
}

- (id)itemNamesForRangeNoQ:(_NSRange)a3 forProperty:(id)a4
{
  if (((unint64_t)&self->_itemCaches & 7) == 0) {
    return objc_msgSend( -[NSMutableDictionary objectForKey:](self->_itemCaches, "objectForKey:", a4),  "itemNamesForRange:",  a3.location,  a3.length);
  }
  __break(0x5516u);
  return -[MediaLibraryCache itemNamesForRange:](self, "itemNamesForRange:", a3.location, a3.length);
}

- (void)setCollections:(id)a3 forProperty:(id)a4
{
  if (((unint64_t)&self->_mediaLibraryCacheQ & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    mediaLibraryCacheQ = (dispatch_queue_s *)self->_mediaLibraryCacheQ;
    if (mediaLibraryCacheQ)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100036764;
      block[3] = &unk_100104510;
      block[4] = self;
      void block[5] = a3;
      void block[6] = a4;
      dispatch_sync(mediaLibraryCacheQ, block);
      return;
    }
  }

  __break(0x5510u);
}

- (void)setCollectionsNoQ:(id)a3 forProperty:(id)a4
{
  id v5 = sub_100036244(a4, (id *)&self->_itemCaches);
  [v5 setCollections:a3];
}

- (id)collectionsForProperty:(id)a3
{
  uint64_t v6 = 0LL;
  _NSRange v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  _NSRange v9 = sub_1000361B0;
  uint64_t v10 = sub_1000361C0;
  uint64_t v11 = 0LL;
  if ((((unint64_t)self + 16) & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    uint64_t v3 = (dispatch_queue_s *)*((void *)self + 2);
    if (v3)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100036864;
      block[3] = &unk_100104498;
      void block[5] = a3;
      void block[6] = &v6;
      block[4] = self;
      dispatch_sync(v3, block);
      uint64_t v4 = (void *)v7[5];
      _Block_object_dispose(&v6, 8);
      return v4;
    }
  }

  __break(0x5510u);
  return self;
}

- (id)collectionsForPropertyNoQ:(id)a3
{
  return self;
}

- (void)invalidateMediaItem:(id)a3
{
  if (((unint64_t)&self->_mediaLibraryCacheQ & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    mediaLibraryCacheQ = (dispatch_queue_s *)self->_mediaLibraryCacheQ;
    if (mediaLibraryCacheQ)
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472LL;
      v4[2] = sub_100036930;
      v4[3] = &unk_100104538;
      v4[4] = a3;
      v4[5] = self;
      dispatch_sync(mediaLibraryCacheQ, v4);
      return;
    }
  }

  __break(0x5510u);
}

- (void)performOnQueue:(id)a3
{
  p_mediaLibraryCacheQ = &self->_mediaLibraryCacheQ;
  if (((unint64_t)&self->_mediaLibraryCacheQ & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    uint64_t v4 = (dispatch_queue_s *)*p_mediaLibraryCacheQ;
    if (*p_mediaLibraryCacheQ)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100036AE8;
      block[3] = &unk_1001038A8;
      block[4] = a3;
      dispatch_sync(v4, block);
      return;
    }
  }

  __break(0x5510u);
}

@end