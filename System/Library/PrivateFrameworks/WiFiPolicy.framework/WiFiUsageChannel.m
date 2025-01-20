@interface WiFiUsageChannel
+ (id)channelWithBssDetails:(id)a3;
+ (id)channelWithChannelInfo:(id)a3;
+ (id)channelWithScanChannel:(id)a3;
- (BOOL)isDFSChannel;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToChannel:(id)a3;
- (WiFiUsageChannel)initWithChannel:(unint64_t)a3 flags:(unint64_t)a4;
- (WiFiUsageChannel)initWithChannel:(unint64_t)a3 flags:(unint64_t)a4 band:(int)a5 width:(unint64_t)a6 isDFS:(BOOL)a7;
- (WiFiUsageChannel)initWithChannel:(unint64_t)a3 flags:(unint64_t)a4 isDFS:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)band;
- (unint64_t)channel;
- (unint64_t)channelFlags;
- (unint64_t)channelWidth;
- (unint64_t)hash;
- (void)setBand:(int)a3;
- (void)setChannel:(unint64_t)a3;
- (void)setChannelFlags:(unint64_t)a3;
- (void)setChannelWidth:(unint64_t)a3;
- (void)setIsDFSChannel:(BOOL)a3;
- (void)updateDFSInfoFromSupportedChannels:(id)a3;
@end

@implementation WiFiUsageChannel

- (WiFiUsageChannel)initWithChannel:(unint64_t)a3 flags:(unint64_t)a4 band:(int)a5 width:(unint64_t)a6 isDFS:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v9 = *(void *)&a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___WiFiUsageChannel;
  v12 = -[WiFiUsageChannel init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[WiFiUsageChannel setChannel:](v12, "setChannel:", a3);
    -[WiFiUsageChannel setChannelFlags:](v13, "setChannelFlags:", a4);
    -[WiFiUsageChannel setBand:](v13, "setBand:", v9);
    -[WiFiUsageChannel setChannelWidth:](v13, "setChannelWidth:", a6);
    -[WiFiUsageChannel setIsDFSChannel:](v13, "setIsDFSChannel:", v7);
  }

  return v13;
}

- (WiFiUsageChannel)initWithChannel:(unint64_t)a3 flags:(unint64_t)a4 isDFS:(BOOL)a5
{
  BOOL v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___WiFiUsageChannel;
  v8 = -[WiFiUsageChannel init](&v11, sel_init);
  uint64_t v9 = v8;
  if (v8)
  {
    -[WiFiUsageChannel setChannel:](v8, "setChannel:", a3);
    -[WiFiUsageChannel setChannelFlags:](v9, "setChannelFlags:", a4);
    -[WiFiUsageChannel setBand:]( v9,  "setBand:",  +[WiFiUsagePrivacyFilter bandFromFlags:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "bandFromFlags:", a4));
    -[WiFiUsageChannel setChannelWidth:]( v9,  "setChannelWidth:",  +[WiFiUsagePrivacyFilter channelWidthFromFlags:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "channelWidthFromFlags:",  a4));
    -[WiFiUsageChannel setIsDFSChannel:](v9, "setIsDFSChannel:", v5);
  }

  return v9;
}

- (WiFiUsageChannel)initWithChannel:(unint64_t)a3 flags:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___WiFiUsageChannel;
  v6 = -[WiFiUsageChannel init](&v9, sel_init);
  BOOL v7 = v6;
  if (v6)
  {
    -[WiFiUsageChannel setChannel:](v6, "setChannel:", a3);
    -[WiFiUsageChannel setChannelFlags:](v7, "setChannelFlags:", a4);
    -[WiFiUsageChannel setBand:]( v7,  "setBand:",  +[WiFiUsagePrivacyFilter bandFromFlags:](&OBJC_CLASS___WiFiUsagePrivacyFilter, "bandFromFlags:", a4));
    -[WiFiUsageChannel setChannelWidth:]( v7,  "setChannelWidth:",  +[WiFiUsagePrivacyFilter channelWidthFromFlags:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "channelWidthFromFlags:",  a4));
  }

  return v7;
}

+ (id)channelWithBssDetails:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  uint64_t v6 = [v4 channel];
  uint64_t v7 = [v4 channelFlags];
  uint64_t v8 = [v4 band];
  uint64_t v9 = [v4 channelWidth];

  return (id)[v5 initWithChannel:v6 flags:v7 band:v8 width:v9 isDFS:0];
}

+ (id)channelWithChannelInfo:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"CHANNELINFO_CH_NUM"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v4 objectForKeyedSubscript:@"CHANNELINFO_DFS"];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      uint64_t v7 = (void *)objc_msgSend( objc_alloc((Class)a1),  "initWithChannel:flags:band:width:isDFS:",  objc_msgSend(v5, "integerValue"),  0,  +[WiFiUsagePrivacyFilter bandFromChanInfo:]( WiFiUsagePrivacyFilter,  "bandFromChanInfo:",  v4),  0,  objc_msgSend(v6, "BOOLValue"));
    }
    else {
      uint64_t v7 = 0LL;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

+ (id)channelWithScanChannel:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"CHANNEL"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v4 objectForKeyedSubscript:@"CHANNEL_FLAGS"];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      uint64_t v7 = (void *)objc_msgSend( objc_alloc((Class)a1),  "initWithChannel:flags:",  objc_msgSend(v5, "integerValue"),  objc_msgSend(v6, "integerValue"));
    }
    else {
      uint64_t v7 = 0LL;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

- (void)updateDFSInfoFromSupportedChannels:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    id v5 = v4;
    -[WiFiUsageChannel setIsDFSChannel:](self, "setIsDFSChannel:", [v4 isDFSChannel]);
    id v4 = v5;
  }
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[WiFiUsageChannel isEqualToChannel:](self, "isEqualToChannel:", v4);

  return v5;
}

- (BOOL)isEqualToChannel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 channel];
  if (v5 == -[WiFiUsageChannel channel](self, "channel"))
  {
    int v6 = [v4 band];
    BOOL v7 = v6 == -[WiFiUsageChannel band](self, "band");
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  *((void *)result + 2) = self->_channel;
  *((void *)result + 3) = self->_channelFlags;
  *((_DWORD *)result + 3) = self->_band;
  *((void *)result + 4) = self->_channelWidth;
  *((_BYTE *)result + 8) = self->_isDFSChannel;
  return result;
}

- (id)description
{
  unint64_t v3 = (void *)NSString;
  +[WiFiUsagePrivacyFilter bandAsString:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "bandAsString:",  -[WiFiUsageChannel band](self, "band"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = -[WiFiUsageChannel channel](self, "channel");
  BOOL v6 = -[WiFiUsageChannel isDFSChannel](self, "isDFSChannel");
  BOOL v7 = @"NO";
  if (v6) {
    BOOL v7 = @"YES";
  }
  [v3 stringWithFormat:@"{band:%@ channel:%lu isDFS:%@}", v4, v5, v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(unint64_t)a3
{
  self->_channel = a3;
}

- (int)band
{
  return self->_band;
}

- (void)setBand:(int)a3
{
  self->_band = a3;
}

- (BOOL)isDFSChannel
{
  return self->_isDFSChannel;
}

- (void)setIsDFSChannel:(BOOL)a3
{
  self->_isDFSChannel = a3;
}

- (unint64_t)channelFlags
{
  return self->_channelFlags;
}

- (void)setChannelFlags:(unint64_t)a3
{
  self->_channelFlags = a3;
}

- (unint64_t)channelWidth
{
  return self->_channelWidth;
}

- (void)setChannelWidth:(unint64_t)a3
{
  self->_channelWidth = a3;
}

@end