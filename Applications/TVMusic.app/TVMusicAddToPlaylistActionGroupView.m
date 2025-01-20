@interface TVMusicAddToPlaylistActionGroupView
- (CGSize)intrinsicContentSize;
- (NSMutableArray)actions;
- (TVMusicAddToPlaylistActionGroupView)initWithFrame:(CGRect)a3;
- (void)addActionWithText:(id)a3 isFolder:(BOOL)a4 handler:(id)a5;
- (void)layoutSubviews;
@end

@implementation TVMusicAddToPlaylistActionGroupView

- (TVMusicAddToPlaylistActionGroupView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVMusicAddToPlaylistActionGroupView;
  v3 = -[TVMusicAddToPlaylistActionGroupView initWithFrame:]( &v7,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    actions = v3->_actions;
    v3->_actions = (NSMutableArray *)v4;
  }

  return v3;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicAddToPlaylistActionGroupView;
  -[TVMusicAddToPlaylistActionGroupView layoutSubviews](&v5, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistActionGroupView actions](self, "actions"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000852F4;
  v4[3] = &unk_10026BE98;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

- (CGSize)intrinsicContentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)addActionWithText:(id)a3 isFolder:(BOOL)a4 handler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v13 = -[_TVMusicAddToPlaylistActionView initWithText:isFolder:handler:]( objc_alloc(&OBJC_CLASS____TVMusicAddToPlaylistActionView),  "initWithText:isFolder:handler:",  v9,  v5,  v8);

  -[_TVMusicAddToPlaylistActionView setTranslatesAutoresizingMaskIntoConstraints:]( v13,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[TVMusicAddToPlaylistActionGroupView addSubview:](self, "addSubview:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAddToPlaylistActionGroupView actions](self, "actions"));
  [v10 addObject:v13];

  -[_TVMusicAddToPlaylistActionView intrinsicContentSize](v13, "intrinsicContentSize");
  double height = self->_contentSize.height;
  if (width < self->_contentSize.width) {
    double width = self->_contentSize.width;
  }
  self->_contentSize.double width = width;
  self->_contentSize.double height = height + 80.0;
}

- (NSMutableArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
}

@end