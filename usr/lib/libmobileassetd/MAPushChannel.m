@interface MAPushChannel
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPushChannelId:(id)a3;
- (MAPushChannel)initWithIdentifier:(id)a3;
- (MAPushChannel)initWithPopulationType:(int64_t)a3;
- (NSString)base64ChannelId;
- (NSString)identifier;
- (id)channelIDForPopulationType;
- (id)description;
- (id)humanReadableChannelName;
- (int64_t)populationType;
- (unint64_t)hash;
@end

@implementation MAPushChannel

- (MAPushChannel)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MAPushChannel;
  v6 = -[MAPushChannel init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_populationType = 0LL;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 base64String]);
    objc_storeStrong((id *)&v7->_base64ChannelId, a3);
    if (!v8)
    {
      _MobileAssetLog( 0LL,  4,  (uint64_t)"-[MAPushChannel initWithIdentifier:]",  @"Channel ID is nil for identifier %@",  v9,  v10,  v11,  v12,  (uint64_t)v5);
      v13 = 0LL;
      goto LABEL_6;
    }
  }

  v13 = v7;
LABEL_6:

  return v13;
}

- (MAPushChannel)initWithPopulationType:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MAPushChannel;
  v4 = -[MAPushChannel init](&v14, "init");
  p_isa = (id *)&v4->super.isa;
  if (v4)
  {
    v4->_populationType = a3;
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[MAPushChannel channelIDForPopulationType](v4, "channelIDForPopulationType"));
    id v7 = p_isa[1];
    p_isa[1] = (id)v6;

    uint64_t v12 = (MAPushChannel *)objc_claimAutoreleasedReturnValue([p_isa[1] base64String]);
    if (!v12)
    {
      _MobileAssetLog( 0LL,  4,  (uint64_t)"-[MAPushChannel initWithPopulationType:]",  @"Channel ID is nil for identifier %@",  v8,  v9,  v10,  v11,  (uint64_t)p_isa[1]);
      goto LABEL_6;
    }

    objc_storeStrong(p_isa + 3, p_isa[1]);
  }

  uint64_t v12 = p_isa;
LABEL_6:

  return v12;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushChannel identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushChannel base64ChannelId](self, "base64ChannelId"));
  int64_t v5 = -[MAPushChannel populationType](self, "populationType");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushChannel humanReadableChannelName](self, "humanReadableChannelName"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<MAPushChannelId | identifier:%@ base64String:%@ populationType:%li name: %@>",  v3,  v4,  v5,  v6));

  return v7;
}

- (id)humanReadableChannelName
{
  int64_t v2 = -[MAPushChannel populationType](self, "populationType");
  else {
    return off_34E970[v2 - 1];
  }
}

- (id)channelIDForPopulationType
{
  uint64_t v3 = -[MAPushChannel populationType](self, "populationType");
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAPushChannel channelIDForPopulationType]",  @"Channel population type: %li",  v4,  v5,  v6,  v7,  v3);
  unint64_t v12 = (unint64_t)-[MAPushChannel populationType](self, "populationType") - 1;
  if (v12 >= 5)
  {
    _MobileAssetLog( 0LL,  4,  (uint64_t)"-[MAPushChannel channelIDForPopulationType]",  @"No population type ID for device!",  v8,  v9,  v10,  v11,  v15);
    return 0LL;
  }

  else
  {
    v13 = off_34E998[v12];
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAPushChannel channelIDForPopulationType]",  @"Channel Population ID: %@",  v8,  v9,  v10,  v11,  (uint64_t)v13);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MAPushChannel *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }

  else if (v4 && (uint64_t v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    BOOL v7 = -[MAPushChannel isEqualToPushChannelId:](self, "isEqualToPushChannelId:", v5);
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToPushChannelId:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 base64ChannelId]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushChannel base64ChannelId](self, "base64ChannelId"));
  unsigned __int8 v6 = [v4 isEqual:v5];

  return v6;
}

- (unint64_t)hash
{
  int64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushChannel base64ChannelId](self, "base64ChannelId"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)populationType
{
  return self->_populationType;
}

- (NSString)base64ChannelId
{
  return self->_base64ChannelId;
}

- (void).cxx_destruct
{
}

@end