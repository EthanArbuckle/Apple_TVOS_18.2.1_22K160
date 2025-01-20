@interface _TVMusicLibraryTableViewCell
- (UIColor)foregroundColor;
- (_TVMusicLibraryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation _TVMusicLibraryTableViewCell

- (_TVMusicLibraryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____TVMusicLibraryTableViewCell;
  v4 = -[TVTableViewCell initWithStyle:reuseIdentifier:](&v10, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager textOpacityDColor](&OBJC_CLASS___TVThemeManager, "textOpacityDColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicLibraryTableViewCell contentView](v4, "contentView"));
    [v6 setBackgroundColor:v5];

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicLibraryTableViewCell foregroundColor](v4, "foregroundColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicLibraryTableViewCell textLabel](v4, "textLabel"));
    [v8 setTextColor:v7];
  }

  return v4;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____TVMusicLibraryTableViewCell;
  -[TVTableViewCell prepareForReuse](&v5, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicLibraryTableViewCell foregroundColor](self, "foregroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicLibraryTableViewCell textLabel](self, "textLabel"));
  [v4 setTextColor:v3];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____TVMusicLibraryTableViewCell;
  -[TVTableViewCell layoutSubviews](&v5, "layoutSubviews");
  -[_TVMusicLibraryTableViewCell frame](self, "frame");
  -[_TVMusicLibraryTableViewCell setFrame:](self, "setFrame:");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicLibraryTableViewCell foregroundColor](self, "foregroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicLibraryTableViewCell textLabel](self, "textLabel"));
  [v4 setTextColor:v3];
}

- (UIColor)foregroundColor
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicLibraryTableViewCell traitCollection](self, "traitCollection"));
  id v4 = [v3 accessibilityContrast];

  if (v4 == (id)1)
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVThemeManager textOpacityAColorReversed]( &OBJC_CLASS___TVThemeManager,  "textOpacityAColorReversed"));
  }

  else if (-[_TVMusicLibraryTableViewCell isFocused](self, "isFocused"))
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  }

  else
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager textOpacityAColor](&OBJC_CLASS___TVThemeManager, "textOpacityAColor"));
  }

  return (UIColor *)v5;
}

@end