@interface TransportManager
- (NSMutableDictionary)transportDictionary;
- (TransportManager)init;
- (id)getTransportForPortWithNumber:(unint64_t)a3 ManagerNumber:(unint64_t)a4 Type:(unint64_t)a5 ID:(unint64_t)a6 andXPCConnection:(id)a7;
- (id)getTransportFromID:(unint64_t)a3;
- (void)setTransportDictionary:(id)a3;
@end

@implementation TransportManager

- (TransportManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TransportManager;
  v2 = -[TransportManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    transportDictionary = v2->_transportDictionary;
    v2->_transportDictionary = v3;
  }

  return v2;
}

- (id)getTransportForPortWithNumber:(unint64_t)a3 ManagerNumber:(unint64_t)a4 Type:(unint64_t)a5 ID:(unint64_t)a6 andXPCConnection:(id)a7
{
  id v10 = a7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransportManager transportDictionary](self, "transportDictionary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a6));
  v13 = (Transport *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v12]);

  if (!v13)
  {
    v13 = -[Transport initWithXPCConnection:](objc_alloc(&OBJC_CLASS___Transport), "initWithXPCConnection:", v10);
    -[Transport setPortNumber:](v13, "setPortNumber:", a3);
    -[Transport setPortID:](v13, "setPortID:", a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransportManager transportDictionary](self, "transportDictionary"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a6));
    [v14 setObject:v13 forKey:v15];
  }

  return v13;
}

- (id)getTransportFromID:(unint64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransportManager transportDictionary](self, "transportDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v5]);

  return v6;
}

- (NSMutableDictionary)transportDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setTransportDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end