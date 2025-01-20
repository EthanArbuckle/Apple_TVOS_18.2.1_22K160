@interface TVRDMediaRemoteCommandCenter
- (TVRDMediaRemoteCommandCenter)init;
- (void)enableLanguageOption:(id)a3;
@end

@implementation TVRDMediaRemoteCommandCenter

- (void)enableLanguageOption:(id)a3
{
  id v4 = a3;
  v5 = self;
  specialized MediaRemoteCommandCenter.enableLanguageOption(_:)(v4);
}

- (TVRDMediaRemoteCommandCenter)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MediaRemoteCommandCenter();
  return -[TVRDMediaRemoteCommandCenter init](&v3, "init");
}

@end