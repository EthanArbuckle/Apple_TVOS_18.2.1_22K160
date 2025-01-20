@interface TVSSAudioAnalyzer
+ (id)audioAnalyzerForPID:(int)a3;
- (BOOL)isRunning;
- (MPCProcessAudioTap)tap;
- (NSHashTable)observers;
- (NSString)description;
- (OS_dispatch_queue)tapQueue;
- (TVSSAudioAnalyzer)initWithPID:(int)a3;
- (TVSSWaveformData)waveformData;
- (TVSSWaveformSettings)settings;
- (float)sampleRate;
- (id)binSamples:(float *)a3 count:(int)a4;
- (int)pid;
- (int)refreshRate;
- (os_unfair_lock_s)lock;
- (void)addObserver:(id)a3;
- (void)computeFFTWithSamples:(float *)a3;
- (void)dealloc;
- (void)processAudioTapDidReceiveAudioSamples:(void *)a3 numberOfSamples:(unsigned int)a4;
- (void)processAudioTapDidStop;
- (void)removeObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setRefreshRate:(int)a3;
- (void)setSampleRate:(float)a3;
- (void)setSettings:(id)a3;
- (void)setTap:(id)a3;
- (void)setTapQueue:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation TVSSAudioAnalyzer

+ (id)audioAnalyzerForPID:(int)a3
{
  id v15 = a1;
  SEL v14 = a2;
  unsigned int v13 = a3;
  v10 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v10);

  v17 = (dispatch_once_t *)&unk_100221C60;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B7D00);
  if (*v17 != -1) {
    dispatch_once(v17, location);
  }
  objc_storeStrong(&location, 0LL);
  v8 = (void *)qword_100221C68;
  v9 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v13);
  v12 = (TVSSAudioAnalyzer *)objc_msgSend(v8, "objectForKey:");

  if (!v12)
  {
    v12 = -[TVSSAudioAnalyzer initWithPID:](objc_alloc(&OBJC_CLASS___TVSSAudioAnalyzer), "initWithPID:", v13);

    os_log_t oslog = (os_log_t)audioAnalyzerLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100052A10((uint64_t)v18, (uint64_t)v15, v13, (uint64_t)v12);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "%@ Created audio analyzer for PID: %u - %@",  v18,  0x1Cu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    v6 = (void *)qword_100221C68;
    v5 = v12;
    v7 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v13);
    objc_msgSend(v6, "setObject:forKey:", v5);
  }

  v4 = v12;
  objc_storeStrong((id *)&v12, 0LL);
  return v4;
}

- (TVSSAudioAnalyzer)initWithPID:(int)a3
{
  SEL v25 = a2;
  int v24 = a3;
  v26 = 0LL;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TVSSAudioAnalyzer;
  v26 = -[TVSSAudioAnalyzer init](&v23, "init");
  objc_storeStrong((id *)&v26, v26);
  if (v26)
  {
    v26->_pid = v24;
    v3 = +[TVSSWaveformSettings currentSettings](&OBJC_CLASS___TVSSWaveformSettings, "currentSettings");
    settings = v26->_settings;
    v26->_settings = v3;

    unsigned int v13 = +[TVSSWaveformSettings currentSettings](&OBJC_CLASS___TVSSWaveformSettings, "currentSettings");
    -[TVSSWaveformSettings samplingRefreshRate](v13, "samplingRefreshRate");
    v26->_refreshRate = (int)v5;

    v26->_sampleRate = 48000.0;
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.MediaControls.TVSSAudioAnalyzer-tapQueue", 0LL);
    tapQueue = v26->_tapQueue;
    v26->_tapQueue = (OS_dispatch_queue *)v6;

    int v22 = 0;
    v26->_lock._os_unfair_lock_opaque = 0;
    v8 = +[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable");
    observers = v26->_observers;
    v26->_observers = v8;

    queue = (dispatch_queue_s *)v26->_tapQueue;
    id v15 = _NSConcreteStackBlock;
    int v16 = -1073741824;
    int v17 = 0;
    v18 = sub_100052E38;
    v19 = &unk_1001B7D28;
    v20 = v26;
    int v21 = v24;
    dispatch_async(queue, &v15);
    v26->_frameCount = (int)vcvtpd_s64_f64((float)(v26->_sampleRate / (float)v26->_refreshRate)) / 2;
    double v10 = log2((double)v26->_frameCount);
    v26->_log2FrameCount = vcvtad_u64_f64(v10);
    v26->_bufferSizePowerOf2 = 1 << v26->_log2FrameCount;
    v26->_complexCount = v26->_bufferSizePowerOf2 / 2;
    v26->_normalizationFactor = 2.0 / (float)v26->_complexCount;
    v26->_realBuffer = (float *)calloc(v26->_complexCount, 4uLL);
    v26->_imagBuffer = (float *)calloc(v26->_complexCount, 4uLL);
    v26->_magnitudes = (float *)calloc(v26->_complexCount, 4uLL);
    v26->_transferBuffer = (float *)calloc(v26->_bufferSizePowerOf2, 4uLL);
    v26->_hannWindow = (float *)calloc(v26->_bufferSizePowerOf2, 4uLL);
    v26->_leftSamples = (float *)calloc(v26->_bufferSizePowerOf2, 4uLL);
    v26->_rightSamples = (float *)calloc(v26->_bufferSizePowerOf2, 4uLL);
    v26->_mixed = (float *)calloc(v26->_bufferSizePowerOf2, 4uLL);
    vDSP_hann_window(v26->_hannWindow, v26->_bufferSizePowerOf2, 2);
    v26->_fftSetup = vDSP_create_fftsetup(v26->_log2FrameCount, 0);
    objc_storeStrong((id *)&v20, 0LL);
  }

  v12 = v26;
  objc_storeStrong((id *)&v26, 0LL);
  return v12;
}

- (NSString)description
{
  uint64_t v2 = objc_opt_class(self);
  v3 = @"YES";
  if (!self->_isRunning) {
    v3 = @"NO";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p - PID=%u running=%@ observers=%lu>",  v2,  self,  self->_pid,  v3,  -[NSHashTable count](self->_observers, "count"));
}

- (void)dealloc
{
  float v5 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)audioAnalyzerLog();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    sub_10000D28C((uint64_t)v6, (uint64_t)v5);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog[0], type, "%@ Dealloc", v6, 0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  free(v5->_realBuffer);
  free(v5->_imagBuffer);
  free(v5->_transferBuffer);
  free(v5->_magnitudes);
  free(v5->_hannWindow);
  free(v5->_leftSamples);
  free(v5->_rightSamples);
  free(v5->_mixed);
  vDSP_destroy_fftsetup(v5->_fftSetup);
  v2.receiver = v5;
  v2.super_class = (Class)&OBJC_CLASS___TVSSAudioAnalyzer;
  -[TVSSAudioAnalyzer dealloc](&v2, "dealloc");
}

- (void)addObserver:(id)a3
{
  float v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  os_unfair_lock_lock(&v5->_lock);
  if (!-[NSHashTable containsObject:](v5->_observers, "containsObject:", location[0]))
  {
    -[NSHashTable addObject:](v5->_observers, "addObject:", location[0]);
    os_log_t oslog = (os_log_t)audioAnalyzerLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10000D540((uint64_t)v6, (uint64_t)v5, (uint64_t)location[0]);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%@ Registered observer: %@", v6, 0x16u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    -[TVSSAudioAnalyzer start](v5, "start");
  }

  os_unfair_lock_unlock(&v5->_lock);
  objc_storeStrong(location, 0LL);
}

- (void)removeObserver:(id)a3
{
  float v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  os_unfair_lock_lock(&v5->_lock);
  -[NSHashTable removeObject:](v5->_observers, "removeObject:", location[0]);
  os_log_t oslog = (os_log_t)audioAnalyzerLog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10000D540((uint64_t)v6, (uint64_t)v5, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%@ Unregistered observer: %@", v6, 0x16u);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  if (!-[NSHashTable count](v5->_observers, "count")) {
    -[TVSSAudioAnalyzer stop](v5, "stop");
  }
  os_unfair_lock_unlock(&v5->_lock);
  objc_storeStrong(location, 0LL);
}

- (void)start
{
  v11 = self;
  location[1] = (id)a2;
  if (!self->_isRunning)
  {
    v11->_isRunning = 1;
    location[0] = audioAnalyzerLog();
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_10000D28C((uint64_t)v12, (uint64_t)v11);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)location[0], v9, "%@ Starting audio analyzer", v12, 0xCu);
    }

    objc_storeStrong(location, 0LL);
    queue = (dispatch_queue_s *)v11->_tapQueue;
    v3 = _NSConcreteStackBlock;
    int v4 = -1073741824;
    int v5 = 0;
    dispatch_queue_t v6 = sub_100053510;
    v7 = &unk_1001B5A60;
    v8 = v11;
    dispatch_async(queue, &v3);
    objc_storeStrong((id *)&v8, 0LL);
  }

- (void)stop
{
  v11 = self;
  location[1] = (id)a2;
  if (self->_isRunning)
  {
    v11->_isRunning = 0;
    location[0] = audioAnalyzerLog();
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_10000D28C((uint64_t)v12, (uint64_t)v11);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)location[0], v9, "%@ Stopping audio analyzer", v12, 0xCu);
    }

    objc_storeStrong(location, 0LL);
    queue = (dispatch_queue_s *)v11->_tapQueue;
    v3 = _NSConcreteStackBlock;
    int v4 = -1073741824;
    int v5 = 0;
    dispatch_queue_t v6 = sub_1000536C4;
    v7 = &unk_1001B5A60;
    v8 = v11;
    dispatch_async(queue, &v3);
    objc_storeStrong((id *)&v8, 0LL);
  }

- (id)binSamples:(float *)a3 count:(int)a4
{
  int v4 = objc_alloc(&OBJC_CLASS___TVSSWaveformData);
  *(float *)&double v5 = self->_sampleRate;
  return  -[TVSSWaveformData initWithFFTSamples:count:sampleRate:settings:]( v4,  "initWithFFTSamples:count:sampleRate:settings:",  a3,  a4,  self->_settings,  v5);
}

- (void)processAudioTapDidReceiveAudioSamples:(void *)a3 numberOfSamples:(unsigned int)a4
{
  int v16 = self;
  SEL v15 = a2;
  SEL v14 = a3;
  unsigned int v13 = a4;
  -[TVSSAudioAnalyzer computeFFTWithSamples:](self, "computeFFTWithSamples:", a3);
  id v12 =  -[TVSSAudioAnalyzer binSamples:count:]( v16,  "binSamples:count:",  v16->_magnitudes,  v16->_complexCount);
  queue = &_dispatch_main_q;
  double v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  v8 = sub_10005388C;
  os_log_type_t v9 = &unk_1001B61C0;
  double v10 = v16;
  id v11 = v12;
  dispatch_async(queue, &v5);

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  objc_storeStrong(&v12, 0LL);
}

- (void)processAudioTapDidStop
{
  v3 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)audioAnalyzerLog();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_10000D28C((uint64_t)v4, (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "audio tap stopped: %@", v4, 0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
}

- (void)computeFFTWithSamples:(float *)a3
{
  int v6 = self;
  SEL v5 = a2;
  int v4 = a3;
  DSPSplitComplex v3 = *(DSPSplitComplex *)&self->_realBuffer;
  vDSP_vmul(a3, 1LL, v6->_hannWindow, 1LL, v6->_transferBuffer, 1LL, v6->_bufferSizePowerOf2);
  vDSP_ctoz((const DSPComplex *)v6->_transferBuffer, 2LL, &v3, 1LL, v6->_complexCount);
  vDSP_fft_zrip(v6->_fftSetup, &v3, 1LL, v6->_log2FrameCount, 1);
  vDSP_zvmags(&v3, 1LL, v6->_magnitudes, 1LL, v6->_complexCount);
  vvsqrtf(v6->_magnitudes, v6->_magnitudes, &v6->_complexCount);
  vDSP_vsmul(v6->_magnitudes, 1LL, &v6->_normalizationFactor, v6->_magnitudes, 1LL, v6->_complexCount);
}

- (int)pid
{
  return self->_pid;
}

- (TVSSWaveformData)waveformData
{
  return self->_waveformData;
}

- (int)refreshRate
{
  return self->_refreshRate;
}

- (void)setRefreshRate:(int)a3
{
  self->_refreshRate = a3;
}

- (float)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(float)a3
{
  self->_sampleRate = a3;
}

- (TVSSWaveformSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (MPCProcessAudioTap)tap
{
  return self->_tap;
}

- (void)setTap:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (OS_dispatch_queue)tapQueue
{
  return self->_tapQueue;
}

- (void)setTapQueue:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
}

@end