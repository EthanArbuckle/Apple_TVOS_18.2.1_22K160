@interface AudioRouteMonitor
- (BOOL)monitoring;
- (__WiFiAudioRoute)audioRouteHandler;
- (void)audioRouteChange:(id)a3;
- (void)dealloc;
- (void)initializeWithHandler:(__WiFiAudioRoute *)a3;
- (void)setAudioRouteHandler:(__WiFiAudioRoute *)a3;
- (void)setMonitoring:(BOOL)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation AudioRouteMonitor

- (void)initializeWithHandler:(__WiFiAudioRoute *)a3
{
  v5 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"-[AudioRouteMonitor initializeWithHandler:] starting"];
  }
  objc_autoreleasePoolPop(v5);
  -[AudioRouteMonitor setAudioRouteHandler:](self, "setAudioRouteHandler:", a3);
  -[AudioRouteMonitor setMonitoring:](self, "setMonitoring:", 0LL);
}

- (void)dealloc
{
  if (-[AudioRouteMonitor monitoring](self, "monitoring")) {
    -[AudioRouteMonitor stopMonitoring](self, "stopMonitoring");
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AudioRouteMonitor;
  -[AudioRouteMonitor dealloc](&v3, "dealloc");
}

- (void)audioRouteChange:(id)a3
{
}

- (void)startMonitoring
{
  objc_super v3 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: adding observer",  "-[AudioRouteMonitor startMonitoring]");
  }
  objc_autoreleasePoolPop(v3);
  -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  self,  "audioRouteChange:",  AVAudioSessionRouteChangeNotification,  +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  -[AudioRouteMonitor setMonitoring:](self, "setMonitoring:", 1LL);
}

- (void)stopMonitoring
{
  objc_super v3 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"-[AudioRouteMonitor stopMonitoring] removing observer"];
  }
  objc_autoreleasePoolPop(v3);
  -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  self,  AVAudioSessionRouteChangeNotification,  +[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  -[AudioRouteMonitor setMonitoring:](self, "setMonitoring:", 0LL);
}

- (__WiFiAudioRoute)audioRouteHandler
{
  return self->_audioRouteHandler;
}

- (void)setAudioRouteHandler:(__WiFiAudioRoute *)a3
{
  self->_audioRouteHandler = a3;
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

@end