@interface MTPlaylistSettingsPodcastGroupCellTV
- (MTPlaylistSettingsPodcastGroupCellTV)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation MTPlaylistSettingsPodcastGroupCellTV

- (MTPlaylistSettingsPodcastGroupCellTV)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTPlaylistSettingsPodcastGroupCellTV;
  return -[MTTableViewCell initWithStyle:reuseIdentifier:](&v5, "initWithStyle:reuseIdentifier:", 0LL, a4);
}

@end