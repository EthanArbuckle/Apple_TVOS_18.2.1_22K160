@interface CLBarometerCalibrationSourceAggregator
+ (uint64_t)isLocationUsefulForCalibration:(uint64_t)a3;
- (BOOL)goodSurfaceCalibration:(float)a3;
- (BOOL)isInOutdoorWorkout;
- (CLBarometerCalibrationAggregatorClient)delegate;
- (CLBarometerCalibrationSourceAggregator)initWithUniverse:(id)a3 buffers:(void *)a4;
- (array<std::deque<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>,)copyDataBuffersForTrack:(CLBarometerCalibrationSourceAggregator *)self;
- (double)getLastAltitude;
- (double)getLastAltitudeAccuracy;
- (double)getLastAltitudeTime;
- (id).cxx_construct;
- (void)dealloc;
- (void)didUpdateSource:(unint64_t)a3 withData:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>)a4;
- (void)disableSources:(id)a3 forContext:(id)a4;
- (void)enableSources:(id)a3 forContext:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setInOutdoorWorkout:(BOOL)a3;
- (void)setLastAltitude:(double)a3;
- (void)setLastAltitudeAccuracy:(double)a3;
- (void)setLastAltitudeTime:(double)a3;
- (void)wetStateUpdated:(unint64_t)a3;
@end

@implementation CLBarometerCalibrationSourceAggregator

- (CLBarometerCalibrationSourceAggregator)initWithUniverse:(id)a3 buffers:(void *)a4
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CLBarometerCalibrationSourceAggregator;
  v6 = -[CLBarometerCalibrationSourceAggregator init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    v6->_universe = (CLIntersiloUniverse *)a3;
    v6->_dataBuffers = a4;
    for (uint64_t i = 6LL; i != 16; ++i)
      (&v7->super.isa)[i] = (Class)objc_opt_new(&OBJC_CLASS___NSMutableSet);
    v7->_lastTimestampPressureBuffer = 1.79769313e308;
    v7->_currentWetState = 0;
    v9 = -[CLBarometerCalibrationSourceWifi initWithUniverse:delegate:]( objc_alloc(&OBJC_CLASS___CLBarometerCalibrationSourceWifi),  "initWithUniverse:delegate:",  a3,  v7);
    unsigned int v18 = 2;
    v20 = &v18;
    sub_10044BD34((uint64_t **)&v7->_sources, &v18, (uint64_t)&unk_1012CF090, &v20)[5] = (uint64_t *)v9;
    v10 = -[CLBarometerCalibrationSourcePressure initWithUniverse:delegate:]( objc_alloc(&OBJC_CLASS___CLBarometerCalibrationSourcePressure),  "initWithUniverse:delegate:",  a3,  v7);
    unsigned int v18 = 1;
    v20 = &v18;
    sub_10044BD34((uint64_t **)&v7->_sources, &v18, (uint64_t)&unk_1012CF090, &v20)[5] = (uint64_t *)v10;
    v11 = -[CLBarometerCalibrationSourceLocation initWithUniverse:delegate:]( objc_alloc(&OBJC_CLASS___CLBarometerCalibrationSourceLocation),  "initWithUniverse:delegate:",  a3,  v7);
    unsigned int v18 = 0;
    v20 = &v18;
    sub_10044BD34((uint64_t **)&v7->_sources, &v18, (uint64_t)&unk_1012CF090, &v20)[5] = (uint64_t *)v11;
    v12 = -[CLBarometerCalibrationSourceCompanion initWithUniverse:delegate:]( objc_alloc(&OBJC_CLASS___CLBarometerCalibrationSourceCompanion),  "initWithUniverse:delegate:",  a3,  v7);
    unsigned int v18 = 4;
    v20 = &v18;
    sub_10044BD34((uint64_t **)&v7->_sources, &v18, (uint64_t)&unk_1012CF090, &v20)[5] = (uint64_t *)v12;
    v13 = -[CLBarometerCalibrationSourceSurfaceCalibration initWithUniverse:delegate:]( objc_alloc(&OBJC_CLASS___CLBarometerCalibrationSourceSurfaceCalibration),  "initWithUniverse:delegate:",  a3,  v7);
    unsigned int v18 = 7;
    v20 = &v18;
    sub_10044BD34((uint64_t **)&v7->_sources, &v18, (uint64_t)&unk_1012CF090, &v20)[5] = (uint64_t *)v13;
    v14 = -[CLBarometerCalibrationSourceSubmersionState initWithUniverse:delegate:]( objc_alloc(&OBJC_CLASS___CLBarometerCalibrationSourceSubmersionState),  "initWithUniverse:delegate:",  a3,  v7);
    unsigned int v18 = 8;
    v20 = &v18;
    v15 = sub_10044BD34((uint64_t **)&v7->_sources, &v18, (uint64_t)&unk_1012CF090, &v20);
    int64x2_t v16 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v15[5] = (uint64_t *)v14;
    *(int64x2_t *)&v7->_prevSurfCalLocation.fTimestamp = v16;
    v7->_prevSurfCalLocation.fCalibrationSource = 3;
    *(int64x2_t *)&v7->_prevSurfCalMotion.fTimestamp = v16;
    v7->_prevSurfCalMotion.fCalibrationSource = 3;
  }

  return v7;
}

- (void)dealloc
{
  self->_universe = 0LL;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, CLBarometerCalibrationSource *>, void *>>> *)self->_sources.__tree_.__begin_node_;
  p_pair1 = &self->_sources.__tree_.__pair1_;
  if (begin_node != &self->_sources.__tree_.__pair1_)
  {
    do
    {

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, CLBarometerCalibrationSource *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v6 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, CLBarometerCalibrationSource *>, void *>>> *)left->__value_.__left_;
        }

        while (left);
      }

      else
      {
        do
        {
          v6 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, CLBarometerCalibrationSource *>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v7 = v6->__value_.__left_ == begin_node;
          begin_node = v6;
        }

        while (!v7);
      }

      begin_node = v6;
    }

    while (v6 != p_pair1);
  }

  for (uint64_t i = 6LL; i != 16; ++i)

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CLBarometerCalibrationSourceAggregator;
  -[CLBarometerCalibrationSourceAggregator dealloc](&v9, "dealloc");
}

- (void)enableSources:(id)a3 forContext:(id)a4
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    clientsForSource = self->_clientsForSource;
    p_sources = (uint64_t **)&self->_sources;
    do
    {
      for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(a3);
        }
        id v13 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)i) integerValue];
        unsigned int v14 = v13;
        v15 = clientsForSource[(void)v13];
        -[NSMutableSet addObject:](v15, "addObject:", a4);
        if (-[NSMutableSet count](v15, "count"))
        {
          unsigned int v16 = v14;
          v21 = &v16;
          objc_msgSend(sub_10044BD34(p_sources, &v16, (uint64_t)&unk_1012CF090, &v21)[5], "enableSource");
        }
      }

      id v8 = [a3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }

    while (v8);
  }

- (void)disableSources:(id)a3 forContext:(id)a4
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    clientsForSource = self->_clientsForSource;
    p_sources = (uint64_t **)&self->_sources;
    do
    {
      for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(a3);
        }
        id v13 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)i) integerValue];
        unsigned int v14 = v13;
        v15 = clientsForSource[(void)v13];
        -[NSMutableSet removeObject:](v15, "removeObject:", a4);
        if (!-[NSMutableSet count](v15, "count"))
        {
          unsigned int v16 = v14;
          v21 = &v16;
          objc_msgSend(sub_10044BD34(p_sources, &v16, (uint64_t)&unk_1012CF090, &v21)[5], "disableSource");
        }
      }

      id v8 = [a3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }

    while (v8);
  }

- (void)didUpdateSource:(unint64_t)a3 withData:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>)a4
{
  var0 = a4.var0;
  switch(a3)
  {
    case 0uLL:
      dataBuffers = (int64x2_t *)self->_dataBuffers;
      if (dataBuffers[2].i64[1] >= 0x258uLL) {
        sub_100D031AC(dataBuffers);
      }
      std::string::size_type v8 = *(void *)var0;
      std::string::size_type v7 = *((void *)var0 + 1);
      __p.__r_.__value_.__r.__words[0] = *(void *)var0;
      __p.__r_.__value_.__l.__size_ = v7;
      if (v7)
      {
        uint64_t v9 = (unint64_t *)(v7 + 8);
        do
          unint64_t v10 = __ldxr(v9);
        while (__stxr(v10 + 1, v9));
      }

      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10187F510);
      }
      v11 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = *(void *)v8;
        uint64_t v13 = *(void *)(v8 + 8);
        uint64_t v15 = *(void *)(v8 + 16);
        uint64_t v14 = *(void *)(v8 + 24);
        int v16 = *(unsigned __int8 *)(v8 + 128);
        uint64_t v17 = *(void *)(v8 + 112);
        uint64_t v18 = *(void *)(v8 + 120);
        uint64_t v19 = *(void *)(v8 + 32);
        uint64_t v20 = *(void *)(v8 + 40);
        uint64_t v21 = *(void *)(v8 + 48);
        uint64_t v22 = *(void *)(v8 + 56);
        int v23 = *(_DWORD *)(v8 + 96);
        int v24 = *(_DWORD *)(v8 + 100);
        uint64_t v25 = *(void *)(v8 + 64);
        uint64_t v26 = *(void *)(v8 + 72);
        uint64_t v27 = *(void *)(v8 + 80);
        uint64_t v28 = *(void *)(v8 + 88);
        int v29 = *(_DWORD *)(v8 + 104);
        int v30 = *(unsigned __int16 *)(v8 + 130);
        *(_DWORD *)buf = 68294147;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2049;
        *(void *)&buf[20] = v14;
        *(_WORD *)&buf[28] = 2049;
        *(void *)&buf[30] = v12;
        *(_WORD *)&buf[38] = 2049;
        *(void *)&buf[40] = v13;
        *(_WORD *)&buf[48] = 2049;
        *(void *)&buf[50] = v15;
        *(_WORD *)&buf[58] = 1025;
        *(_DWORD *)&buf[60] = v24;
        LOWORD(v230) = 1025;
        *(_DWORD *)((char *)&v230 + 2) = v16;
        HIWORD(v230) = 2049;
        *(void *)v231 = v17;
        *(_WORD *)&v231[8] = 2049;
        uint64_t v232 = v18;
        __int16 v233 = 2049;
        uint64_t v234 = v21;
        __int16 v235 = 2049;
        uint64_t v236 = v19;
        __int16 v237 = 2049;
        uint64_t v238 = v20;
        __int16 v239 = 2049;
        uint64_t v240 = v22;
        __int16 v241 = 1025;
        int v242 = v23;
        __int16 v243 = 2049;
        uint64_t v244 = v25;
        __int16 v245 = 2049;
        uint64_t v246 = v26;
        __int16 v247 = 2049;
        uint64_t v248 = v27;
        __int16 v249 = 2049;
        uint64_t v250 = v28;
        __int16 v251 = 1025;
        int v252 = v29;
        __int16 v253 = 1025;
        int v254 = v30;
        __int16 v255 = 1025;
        int v256 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:location source updated with, altitude:%{private}f, time_s:%{private}.0 9f, lat:%{private}f, long:%{private}f, type:%{private}d, isPrefilteredLocation:%{pri vate}d, rawAltitude:%{private}f, rawVerticalAccuracy:%{private}f, DEM:%{private}f, h orizontalAccuracy:%{private}f, verticalAccuracy:%{private}f, DEMUncertainty:%{private}f, Environment:%{private}d, Slope:%{private}f, MaxAbsSlope:%{private}f, Speed:%{privat e}f, SpeedAccuracy:%{private}f, MatchQuality:%{private}d, AltitudeState:%{private}d, RefPr ovider:%{private}d}",  buf,  0xC2u);
      }

      sub_100D03200((void *)self->_dataBuffers, (__int128 *)var0);
      if ((objc_opt_respondsToSelector( -[CLBarometerCalibrationSourceAggregator delegate](self, "delegate"),  "didUpdateDataBuffer:") & 1) != 0) {
        -[CLBarometerCalibrationAggregatorClient didUpdateDataBuffer:]( -[CLBarometerCalibrationSourceAggregator delegate](self, "delegate"),  "didUpdateDataBuffer:",  0LL);
      }
      if (__p.__r_.__value_.__l.__size_)
      {
        v31 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
        do
          unint64_t v32 = __ldaxr(v31);
        while (__stlxr(v32 - 1, v31));
        if (!v32)
        {
          (*(void (**)(std::string::size_type))(*(void *)__p.__r_.__value_.__l.__size_ + 16LL))(__p.__r_.__value_.__l.__size_);
          size = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
          goto LABEL_229;
        }
      }

      break;
    case 1uLL:
      v104 = (int64x2_t *)self->_dataBuffers;
      if (v104[5].i64[1] >= 0x258uLL) {
        sub_100D031AC(v104 + 3);
      }
      v105 = *(uint64_t **)var0;
      v35 = (std::__shared_weak_count *)*((void *)var0 + 1);
      __p.__r_.__value_.__r.__words[0] = *(void *)var0;
      __p.__r_.__value_.__l.__size_ = (std::string::size_type)v35;
      if (v35)
      {
        p_shared_owners = (unint64_t *)&v35->__shared_owners_;
        do
          unint64_t v107 = __ldxr(p_shared_owners);
        while (__stxr(v107 + 1, p_shared_owners));
      }

      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10187F510);
      }
      v108 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v109 = *v105;
        uint64_t v110 = v105[1];
        uint64_t v111 = v105[2];
        *(_DWORD *)buf = 68289795;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(void *)&buf[20] = v109;
        *(_WORD *)&buf[28] = 2049;
        *(void *)&buf[30] = v110;
        *(_WORD *)&buf[38] = 2049;
        *(void *)&buf[40] = v111;
        _os_log_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:pressure source updated with, time_s:%{public}.09f, pressure:%{private} f, temperature:%{private}f}",  buf,  0x30u);
      }

      sub_100D03200((void *)self->_dataBuffers + 6, (__int128 *)var0);
      if ((objc_opt_respondsToSelector(self->_delegate, "didUpdateDataBuffer:") & 1) != 0) {
        -[CLBarometerCalibrationAggregatorClient didUpdateDataBuffer:](self->_delegate, "didUpdateDataBuffer:", 1LL);
      }
      if (v35)
      {
        v112 = (unint64_t *)&v35->__shared_owners_;
        do
          unint64_t v48 = __ldaxr(v112);
        while (__stlxr(v48 - 1, v112));
        goto LABEL_227;
      }

      break;
    case 2uLL:
      v58 = (int64x2_t *)self->_dataBuffers;
      if (v58[8].i64[1] >= 0x4B0uLL) {
        sub_100D031AC(v58 + 6);
      }
      std::string::size_type v59 = *(void *)var0;
      v35 = (std::__shared_weak_count *)*((void *)var0 + 1);
      v215[0] = *(void **)var0;
      v215[1] = v35;
      if (v35)
      {
        v60 = (unint64_t *)&v35->__shared_owners_;
        do
          unint64_t v61 = __ldxr(v60);
        while (__stxr(v61 + 1, v60));
      }

      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10187F510);
      }
      v62 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v63 = *(void *)v59;
        sub_1007EC454(&__p);
        v64 = (__p.__r_.__value_.__s.__size_ & 0x80u) == 0 ? &__p : (std::string *)__p.__r_.__value_.__r.__words[0];
        int v65 = *(_DWORD *)(v59 + 16);
        int v66 = *(_DWORD *)(v59 + 24);
        int v67 = *(unsigned __int8 *)(v59 + 20);
        *(_DWORD *)buf = 68290307;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2049;
        *(void *)&buf[20] = v63;
        *(_WORD *)&buf[28] = 2081;
        *(void *)&buf[30] = v64;
        *(_WORD *)&buf[38] = 1025;
        *(_DWORD *)&buf[40] = v65;
        *(_WORD *)&buf[44] = 1025;
        *(_DWORD *)&buf[46] = v66;
        *(_WORD *)&buf[50] = 1025;
        *(_DWORD *)&buf[52] = v67;
        _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:wifi source updated with, scanTimestamp_s:%{private}.09f, mac:%{private, location:escape_only}s, channel:%{private}d, rssi:%{private}d, hidden:%{private}hhd}",  buf,  0x38u);
      }

      sub_100D03200((void *)self->_dataBuffers + 12, (__int128 *)var0);
      if ((objc_opt_respondsToSelector(self->_delegate, "didUpdateDataBuffer:") & 1) != 0) {
        -[CLBarometerCalibrationAggregatorClient didUpdateDataBuffer:](self->_delegate, "didUpdateDataBuffer:", 2LL);
      }
      if (v35)
      {
        v68 = (unint64_t *)&v35->__shared_owners_;
        do
          unint64_t v48 = __ldaxr(v68);
        while (__stlxr(v48 - 1, v68));
        goto LABEL_227;
      }

      break;
    case 3uLL:
      v69 = (int64x2_t *)self->_dataBuffers;
      if (v69[11].i64[1] >= 0x258uLL) {
        sub_100D031AC(v69 + 9);
      }
      std::string::size_type v70 = *(void *)var0;
      v35 = (std::__shared_weak_count *)*((void *)var0 + 1);
      __p.__r_.__value_.__r.__words[0] = *(void *)var0;
      __p.__r_.__value_.__l.__size_ = (std::string::size_type)v35;
      if (v35)
      {
        v71 = (unint64_t *)&v35->__shared_owners_;
        do
          unint64_t v72 = __ldxr(v71);
        while (__stxr(v72 + 1, v71));
      }

      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10187F510);
      }
      v73 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v74 = *(void *)v70;
        int v75 = *(_DWORD *)(v70 + 8);
        *(_DWORD *)buf = 68289539;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2049;
        *(void *)&buf[20] = v74;
        *(_WORD *)&buf[28] = 1025;
        *(_DWORD *)&buf[30] = v75;
        _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:elevation source updated with, timestamp_s:%{private}.09f, elevation:%{private}d}",  buf,  0x22u);
      }

      sub_100D03200((void *)self->_dataBuffers + 18, (__int128 *)var0);
      if ((objc_opt_respondsToSelector(self->_delegate, "didUpdateDataBuffer:") & 1) != 0) {
        -[CLBarometerCalibrationAggregatorClient didUpdateDataBuffer:](self->_delegate, "didUpdateDataBuffer:", 3LL);
      }
      if (v35)
      {
        v76 = (unint64_t *)&v35->__shared_owners_;
        do
          unint64_t v48 = __ldaxr(v76);
        while (__stlxr(v48 - 1, v76));
        goto LABEL_227;
      }

      break;
    case 4uLL:
      v34 = (int64x2_t *)self->_dataBuffers;
      if (v34[14].i64[1] >= 0x258uLL) {
        sub_100D031AC(v34 + 12);
      }
      v36 = *(std::string::size_type **)var0;
      v35 = (std::__shared_weak_count *)*((void *)var0 + 1);
      v215[0] = *(void **)var0;
      v215[1] = v35;
      if (v35)
      {
        v37 = (unint64_t *)&v35->__shared_owners_;
        do
          unint64_t v38 = __ldxr(v37);
        while (__stxr(v38 + 1, v37));
      }

      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10187F510);
      }
      v39 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        std::string::size_type v40 = *v36;
        std::string::size_type v41 = v36[1];
        std::string::size_type v42 = v36[2];
        *(_DWORD *)buf = 68289795;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2049;
        *(void *)&buf[20] = v40;
        *(_WORD *)&buf[28] = 2049;
        *(void *)&buf[30] = v41;
        *(_WORD *)&buf[38] = 2049;
        *(void *)&buf[40] = v42;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:companion source updated with, timestamp_s:%{private}.09f, biasInMeters: %{private}f, uncertaintyInMeters:%{private}f}",  buf,  0x30u);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10187F510);
        }
      }

      v43 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        std::string::size_type v44 = *v36;
        std::string::size_type v45 = v36[1];
        std::string::size_type v46 = v36[2];
        *(_DWORD *)buf = 134218496;
        *(void *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v45;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = v46;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "companion source updated with timestamp %f, altitude %f, uncertainty %f",  buf,  0x20u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10187F510);
        }
        std::string::size_type v159 = *v36;
        std::string::size_type v160 = v36[1];
        std::string::size_type v161 = v36[2];
        LODWORD(__p.__r_.__value_.__l.__data_) = 134218496;
        *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = v159;
        WORD2(__p.__r_.__value_.__r.__words[1]) = 2048;
        *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = v160;
        HIWORD(__p.__r_.__value_.__r.__words[2]) = 2048;
        *(void *)v220 = v161;
        LODWORD(v178) = 32;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "companion source updated with timestamp %f, altitude %f, uncertainty %f",  COERCE_DOUBLE(&__p),  v178,  v180);
        v163 = (char *)v162;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationSourceAggregator didUpdateSource:withData:]",  "%s\n",  v162);
        if (v163 != buf) {
          free(v163);
        }
      }

      sub_100D03200((void *)self->_dataBuffers + 24, (__int128 *)var0);
      if ((objc_opt_respondsToSelector(self->_delegate, "didUpdateDataBuffer:") & 1) != 0) {
        -[CLBarometerCalibrationAggregatorClient didUpdateDataBuffer:](self->_delegate, "didUpdateDataBuffer:", 4LL);
      }
      if (v35)
      {
        v47 = (unint64_t *)&v35->__shared_owners_;
        do
          unint64_t v48 = __ldaxr(v47);
        while (__stlxr(v48 - 1, v47));
        goto LABEL_227;
      }

      break;
    case 5uLL:
      v113 = (int64x2_t *)self->_dataBuffers;
      if (v113[17].i64[1] >= 9uLL) {
        sub_100D031AC(v113 + 15);
      }
      v114 = *(uint64_t **)var0;
      v35 = (std::__shared_weak_count *)*((void *)var0 + 1);
      __p.__r_.__value_.__r.__words[0] = *(void *)var0;
      __p.__r_.__value_.__l.__size_ = (std::string::size_type)v35;
      if (v35)
      {
        v115 = (unint64_t *)&v35->__shared_owners_;
        do
          unint64_t v116 = __ldxr(v115);
        while (__stxr(v116 + 1, v115));
      }

      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10187F510);
      }
      v117 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v118 = *v114;
        uint64_t v119 = v114[1];
        uint64_t v120 = v114[2];
        uint64_t v121 = v114[3];
        *(_DWORD *)buf = 68290051;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2049;
        *(void *)&buf[20] = v118;
        *(_WORD *)&buf[28] = 2049;
        *(void *)&buf[30] = v120;
        *(_WORD *)&buf[38] = 2049;
        *(void *)&buf[40] = v119;
        *(_WORD *)&buf[48] = 2049;
        *(void *)&buf[50] = v121;
        _os_log_impl( (void *)&_mh_execute_header,  v117,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:kfPressure source updated with, timestamp_s:%{private}.09f, kfPressure: %{private}f, kfElevation:%{private}f, absAltUncertainty:%{private}f}",  buf,  0x3Au);
      }

      sub_100D03200((void *)self->_dataBuffers + 30, (__int128 *)var0);
      if ((objc_opt_respondsToSelector(self->_delegate, "didUpdateDataBuffer:") & 1) != 0) {
        -[CLBarometerCalibrationAggregatorClient didUpdateDataBuffer:](self->_delegate, "didUpdateDataBuffer:", 5LL);
      }
      if (v35)
      {
        v122 = (unint64_t *)&v35->__shared_owners_;
        do
          unint64_t v48 = __ldaxr(v122);
        while (__stlxr(v48 - 1, v122));
        goto LABEL_227;
      }

      break;
    case 6uLL:
      v123 = (int64x2_t *)self->_dataBuffers;
      if (v123[20].i64[1] >= 0x258uLL) {
        sub_100D031AC(v123 + 18);
      }
      std::string::size_type v124 = *(void *)var0;
      v35 = (std::__shared_weak_count *)*((void *)var0 + 1);
      __p.__r_.__value_.__r.__words[0] = *(void *)var0;
      __p.__r_.__value_.__l.__size_ = (std::string::size_type)v35;
      if (v35)
      {
        v125 = (unint64_t *)&v35->__shared_owners_;
        do
          unint64_t v126 = __ldxr(v125);
        while (__stxr(v126 + 1, v125));
      }

      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10187F510);
      }
      v127 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v128 = *(void *)v124;
        uint64_t v129 = *(void *)(v124 + 8);
        uint64_t v131 = *(void *)(v124 + 16);
        uint64_t v130 = *(void *)(v124 + 24);
        int v132 = *(_DWORD *)(v124 + 100);
        int v133 = *(unsigned __int8 *)(v124 + 128);
        uint64_t v134 = *(void *)(v124 + 112);
        uint64_t v135 = *(void *)(v124 + 120);
        uint64_t v136 = *(void *)(v124 + 48);
        *(_DWORD *)buf = 68291331;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2049;
        *(void *)&buf[20] = v130;
        *(_WORD *)&buf[28] = 2049;
        *(void *)&buf[30] = v128;
        *(_WORD *)&buf[38] = 2049;
        *(void *)&buf[40] = v129;
        *(_WORD *)&buf[48] = 2049;
        *(void *)&buf[50] = v131;
        *(_WORD *)&buf[58] = 1025;
        *(_DWORD *)&buf[60] = v132;
        LOWORD(v230) = 1025;
        *(_DWORD *)((char *)&v230 + 2) = v133;
        HIWORD(v230) = 2049;
        *(void *)v231 = v134;
        *(_WORD *)&v231[8] = 2049;
        uint64_t v232 = v135;
        __int16 v233 = 2049;
        uint64_t v234 = v136;
        _os_log_impl( (void *)&_mh_execute_header,  v127,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:prefiltered location source updated with, altitude:%{private}f, time_s: %{private}.09f, lat:%{private}f, long:%{private}f, type:%{private}d, isPrefilteredLoca tion:%{private}d, rawAltitude:%{private}f, rawVerticalAccuracy:%{private}f, DEM:%{private}f}",  buf,  0x64u);
      }

      sub_100D03200((void *)self->_dataBuffers + 36, (__int128 *)var0);
      if ((objc_opt_respondsToSelector( -[CLBarometerCalibrationSourceAggregator delegate](self, "delegate"),  "didUpdateDataBuffer:") & 1) != 0) {
        -[CLBarometerCalibrationAggregatorClient didUpdateDataBuffer:]( -[CLBarometerCalibrationSourceAggregator delegate](self, "delegate"),  "didUpdateDataBuffer:",  6LL);
      }
      if (v35)
      {
        v137 = (unint64_t *)&v35->__shared_owners_;
        do
          unint64_t v48 = __ldaxr(v137);
        while (__stlxr(v48 - 1, v137));
        goto LABEL_227;
      }

      break;
    case 7uLL:
      uint64_t v77 = *(void *)a4.var0;
      v35 = (std::__shared_weak_count *)*((void *)a4.var0 + 1);
      uint64_t v217 = *(void *)a4.var0;
      v218 = v35;
      if (v35)
      {
        v78 = (unint64_t *)&v35->__shared_owners_;
        do
          unint64_t v79 = __ldxr(v78);
        while (__stxr(v79 + 1, v78));
      }

      double v80 = *(double *)(v77 + 8);
      *(float *)&double v80 = v80;
      if (-[CLBarometerCalibrationSourceAggregator goodSurfaceCalibration:](self, "goodSurfaceCalibration:", v80))
      {
        sub_1010DDBC0(v215, "NULL");
        sub_1010DDBC0(v213, "NULL");
        sub_1010DDBC0(v211, "NULL");
        sub_1010DDBC0(v209, "NULL");
        HIDWORD(v179) = *(_DWORD *)(v77 + 16);
        p_double fSurfacePressure = &self->_prevSurfCalLocation.fSurfacePressure;
        double fSurfacePressure = self->_prevSurfCalLocation.fSurfacePressure;
        if (fSurfacePressure != 1.79769313e308)
        {
          double v83 = *(double *)(v77 + 8);
          v206 = 0LL;
          v207 = 0LL;
          uint64_t v208 = 0LL;
          sub_10001B72C(&v206, (const void *)qword_10199DCA8, qword_10199DCB0, (qword_10199DCB0 - qword_10199DCA8) >> 2);
          float v84 = v83 - fSurfacePressure;
          sub_1001B4760((uint64_t)&v206, buf, v84);
          if (SHIBYTE(v216) < 0) {
            operator delete(v215[0]);
          }
          *(_OWORD *)v215 = *(_OWORD *)buf;
          uint64_t v216 = *(void *)&buf[16];
          buf[23] = 0;
          buf[0] = 0;
          if (v206)
          {
            v207 = v206;
            operator delete(v206);
          }

          double v85 = *(double *)v77;
          double fTimestamp = self->_prevSurfCalLocation.fTimestamp;
          v204 = 0LL;
          uint64_t v205 = 0LL;
          v203 = 0LL;
          sub_10001B72C(&v203, (const void *)qword_10199DCC0, qword_10199DCC8, (qword_10199DCC8 - qword_10199DCC0) >> 2);
          float v87 = v85 - fTimestamp;
          sub_1001B4760((uint64_t)&v203, buf, v87);
          if (SHIBYTE(v214) < 0) {
            operator delete(v213[0]);
          }
          *(_OWORD *)v213 = *(_OWORD *)buf;
          uint64_t v214 = *(void *)&buf[16];
          buf[23] = 0;
          buf[0] = 0;
          if (v203)
          {
            v204 = v203;
            operator delete(v203);
          }
        }

        p_prevSurfCalLocation = &self->_prevSurfCalLocation;
        v88 = &self->_prevSurfCalMotion.fSurfacePressure;
        double v89 = self->_prevSurfCalMotion.fSurfacePressure;
        p_prevSurfCalMotion = &self->_prevSurfCalMotion;
        if (v89 != 1.79769313e308)
        {
          double v90 = *(double *)(v77 + 8);
          v200 = 0LL;
          v201 = 0LL;
          uint64_t v202 = 0LL;
          sub_10001B72C(&v200, (const void *)qword_10199DCA8, qword_10199DCB0, (qword_10199DCB0 - qword_10199DCA8) >> 2);
          float v91 = v90 - v89;
          sub_1001B4760((uint64_t)&v200, buf, v91);
          if (SHIBYTE(v212) < 0) {
            operator delete(v211[0]);
          }
          *(_OWORD *)v211 = *(_OWORD *)buf;
          uint64_t v212 = *(void *)&buf[16];
          buf[23] = 0;
          buf[0] = 0;
          if (v200)
          {
            v201 = v200;
            operator delete(v200);
          }

          double v92 = *(double *)v77;
          double v93 = p_prevSurfCalMotion->fTimestamp;
          v198 = 0LL;
          uint64_t v199 = 0LL;
          v197 = 0LL;
          sub_10001B72C(&v197, (const void *)qword_10199DCC0, qword_10199DCC8, (qword_10199DCC8 - qword_10199DCC0) >> 2);
          float v94 = v92 - v93;
          sub_1001B4760((uint64_t)&v197, buf, v94);
          if (SHIBYTE(v210) < 0) {
            operator delete(v209[0]);
          }
          *(_OWORD *)v209 = *(_OWORD *)buf;
          uint64_t v210 = *(void *)&buf[16];
          buf[23] = 0;
          buf[0] = 0;
          if (v197)
          {
            v198 = v197;
            operator delete(v197);
          }
        }

        p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10187F510);
        }
        v96 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
        {
          double v97 = p_prevSurfCalLocation->fTimestamp;
          double v98 = *v88;
          double v99 = p_prevSurfCalMotion->fTimestamp;
          double v101 = *(double *)v77;
          double v100 = *(double *)(v77 + 8);
          *(double *)&buf[4] = *p_fSurfacePressure;
          *(double *)&buf[14] = v97;
          *(double *)&buf[24] = v98;
          *(double *)&buf[34] = v99;
          *(_DWORD *)buf = 134219776;
          *(_WORD *)&buf[12] = 2048;
          *(_WORD *)&buf[22] = 2048;
          *(_WORD *)&buf[32] = 2048;
          *(_WORD *)&buf[42] = 2048;
          *(double *)&buf[44] = v100 - *(double *)&buf[4];
          *(_WORD *)&buf[52] = 2048;
          *(double *)&buf[54] = v101 - v97;
          *(_WORD *)&buf[62] = 2048;
          double v230 = v100 - v98;
          *(_WORD *)v231 = 2048;
          *(double *)&v231[2] = v101 - v99;
          _os_log_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_DEFAULT,  "prevLocationPressure,%f,prevLocationTimestamp,%f,prevMotionPressure,%f,prevMotionTimestamp,%f,pressureDiffLa stLocation,%f,timeDiffLastLocation,%f,pressureDiffLastMotion,%f,timeDiffLastMotion,%f",  buf,  0x52u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10187F510);
          }
          double v164 = p_prevSurfCalLocation->fTimestamp;
          double v165 = *v88;
          double v166 = p_prevSurfCalMotion->fTimestamp;
          double v168 = *(double *)v77;
          double v167 = *(double *)(v77 + 8);
          *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = *(std::string::size_type *)p_fSurfacePressure;
          *(double *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = v164;
          *(double *)v220 = v165;
          *(double *)&v220[10] = v166;
          LODWORD(__p.__r_.__value_.__l.__data_) = 134219776;
          WORD2(__p.__r_.__value_.__r.__words[1]) = 2048;
          HIWORD(__p.__r_.__value_.__r.__words[2]) = 2048;
          *(_WORD *)&v220[8] = 2048;
          __int16 v221 = 2048;
          double v222 = v167 - *(double *)((char *)__p.__r_.__value_.__r.__words + 4);
          __int16 v223 = 2048;
          double v224 = v168 - v164;
          __int16 v225 = 2048;
          double v226 = v167 - v165;
          __int16 v227 = 2048;
          double v228 = v168 - v166;
          LODWORD(v179) = 82;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "prevLocationPressure,%f,prevLocationTimestamp,%f,prevMotionPressure,%f,prevMotionTimestamp,%f,pressureDiffLa stLocation,%f,timeDiffLastLocation,%f,pressureDiffLastMotion,%f,timeDiffLastMotion,%f",  COERCE_DOUBLE(&__p),  v179,  *(double *)&p_prevSurfCalMotion,  *(double *)&p_prevSurfCalLocation,  *(double *)&v183,  *(double *)&v184,  *(double *)&v185,  *(double *)&v186);
          v170 = (char *)v169;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationSourceAggregator didUpdateSource:withData:]",  "%s\n",  v169);
          if (v170 != buf) {
            free(v170);
          }
          p_vtable = (void **)(&OBJC_METACLASS___CLPrivacyManager + 24);
        }

        if ((HIDWORD(v179) | 2) != 2)
        {
          p_prevSurfCalLocation = p_prevSurfCalMotion;
          p_double fSurfacePressure = &self->_prevSurfCalMotion.fSurfacePressure;
        }

        p_prevSurfCalLocation->double fTimestamp = *(double *)v77;
        double *p_fSurfacePressure = *(double *)(v77 + 8);
        v183 = _NSConcreteStackBlock;
        uint64_t v184 = 3321888768LL;
        v185 = sub_100D032A4;
        v186 = &unk_10187F4E0;
        uint64_t v187 = v77;
        v188 = v35;
        if (v35)
        {
          v102 = (unint64_t *)&v35->__shared_owners_;
          do
            unint64_t v103 = __ldxr(v102);
          while (__stxr(v103 + 1, v102));
        }

        if (SHIBYTE(v216) < 0)
        {
          sub_1010DD48C(&v189, v215[0], (unint64_t)v215[1]);
        }

        else
        {
          __int128 v189 = *(_OWORD *)v215;
          uint64_t v190 = v216;
        }

        if (SHIBYTE(v214) < 0)
        {
          sub_1010DD48C(&v191, v213[0], (unint64_t)v213[1]);
        }

        else
        {
          __int128 v191 = *(_OWORD *)v213;
          uint64_t v192 = v214;
        }

        if (SHIBYTE(v212) < 0)
        {
          sub_1010DD48C(&v193, v211[0], (unint64_t)v211[1]);
        }

        else
        {
          __int128 v193 = *(_OWORD *)v211;
          uint64_t v194 = v212;
        }

        if (SHIBYTE(v210) < 0)
        {
          sub_1010DD48C(&v195, v209[0], (unint64_t)v209[1]);
        }

        else
        {
          __int128 v195 = *(_OWORD *)v209;
          uint64_t v196 = v210;
        }

        AnalyticsSendEventLazy(@"com.apple.Motion.Charon.SurfacePressure", &v183);
        v146 = (int64x2_t *)self->_dataBuffers;
        if (v146[23].i64[1] >= 0x64uLL) {
          sub_100D031AC(v146 + 21);
        }
        v147 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
        {
          double v148 = *(double *)v77;
          uint64_t v149 = *(void *)(v77 + 8);
          *(_DWORD *)buf = 68289539;
          *(_DWORD *)&buf[4] = 0;
          *(_WORD *)&buf[8] = 2082;
          *(void *)&buf[10] = "";
          *(_WORD *)&buf[18] = 2050;
          *(double *)&buf[20] = v148;
          *(_WORD *)&buf[28] = 2049;
          *(void *)&buf[30] = v149;
          _os_log_impl( (void *)&_mh_execute_header,  v147,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:surface calibration pressure source updated with, time_s:%{public}.09f, p ressure:%{private}f}",  buf,  0x26u);
        }

        v150 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
        {
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          int v152 = *(_DWORD *)(v77 + 16);
          double v154 = *(double *)v77;
          uint64_t v153 = *(void *)(v77 + 8);
          *(_DWORD *)buf = 134218752;
          *(CFAbsoluteTime *)&buf[4] = Current;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v153;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = v152;
          *(_WORD *)&buf[28] = 2048;
          *(double *)&buf[30] = v154;
          _os_log_impl( (void *)&_mh_execute_header,  v150,  OS_LOG_TYPE_DEFAULT,  "surface pressure calibration,timestamp,%f,pressure,%f,type,%d,pressureTimestamp,%f",  buf,  0x26u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          uint64_t v171 = qword_1019346A8;
          CFAbsoluteTime v172 = CFAbsoluteTimeGetCurrent();
          int v173 = *(_DWORD *)(v77 + 16);
          double v175 = *(double *)v77;
          std::string::size_type v174 = *(void *)(v77 + 8);
          LODWORD(__p.__r_.__value_.__l.__data_) = 134218752;
          *(CFAbsoluteTime *)((char *)__p.__r_.__value_.__r.__words + 4) = v172;
          WORD2(__p.__r_.__value_.__r.__words[1]) = 2048;
          *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = v174;
          HIWORD(__p.__r_.__value_.__r.__words[2]) = 1024;
          *(_DWORD *)v220 = v173;
          *(_WORD *)&v220[4] = 2048;
          *(double *)&v220[6] = v175;
          LODWORD(v179) = 38;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v171,  0LL,  "surface pressure calibration,timestamp,%f,pressure,%f,type,%d,pressureTimestamp,%f",  COERCE_DOUBLE(&__p),  v179,  (_DWORD)p_prevSurfCalMotion,  *(double *)&p_prevSurfCalLocation);
          v177 = (char *)v176;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationSourceAggregator didUpdateSource:withData:]",  "%s\n",  v176);
          if (v177 != buf) {
            free(v177);
          }
        }

        sub_100D03200((void *)self->_dataBuffers + 42, (__int128 *)var0);
        if ((objc_opt_respondsToSelector(self->_delegate, "didUpdateDataBuffer:") & 1) != 0) {
          -[CLBarometerCalibrationAggregatorClient didUpdateDataBuffer:](self->_delegate, "didUpdateDataBuffer:", 7LL);
        }
        if (SHIBYTE(v196) < 0) {
          operator delete((void *)v195);
        }
        if (SHIBYTE(v194) < 0) {
          operator delete((void *)v193);
        }
        if (SHIBYTE(v192) < 0) {
          operator delete((void *)v191);
        }
        if (SHIBYTE(v190) < 0) {
          operator delete((void *)v189);
        }
        v155 = v188;
        if (v188)
        {
          v156 = (unint64_t *)&v188->__shared_owners_;
          do
            unint64_t v157 = __ldaxr(v156);
          while (__stlxr(v157 - 1, v156));
          if (!v157)
          {
            ((void (*)(std::__shared_weak_count *))v155->__on_zero_shared)(v155);
            std::__shared_weak_count::__release_weak(v155);
          }
        }

        if (SHIBYTE(v210) < 0) {
          operator delete(v209[0]);
        }
        if (SHIBYTE(v212) < 0) {
          operator delete(v211[0]);
        }
        if (SHIBYTE(v214) < 0) {
          operator delete(v213[0]);
        }
        if (SHIBYTE(v216) < 0) {
          operator delete(v215[0]);
        }
        v35 = v218;
      }

      if (v35)
      {
        v158 = (unint64_t *)&v35->__shared_owners_;
        do
          unint64_t v48 = __ldaxr(v158);
        while (__stlxr(v48 - 1, v158));
        goto LABEL_227;
      }

      break;
    case 8uLL:
      v138 = (int64x2_t *)self->_dataBuffers;
      if (v138[26].i64[1] >= 5uLL) {
        sub_100D031AC(v138 + 24);
      }
      std::string::size_type v139 = *(void *)var0;
      v35 = (std::__shared_weak_count *)*((void *)var0 + 1);
      __p.__r_.__value_.__r.__words[0] = *(void *)var0;
      __p.__r_.__value_.__l.__size_ = (std::string::size_type)v35;
      if (v35)
      {
        v140 = (unint64_t *)&v35->__shared_owners_;
        do
          unint64_t v141 = __ldxr(v140);
        while (__stxr(v141 + 1, v140));
      }

      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10187F510);
      }
      v142 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v143 = *(void *)v139;
        uint64_t v144 = *(unsigned __int8 *)(v139 + 8);
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(void *)&buf[20] = v143;
        *(_WORD *)&buf[28] = 2050;
        *(void *)&buf[30] = v144;
        _os_log_impl( (void *)&_mh_execute_header,  v142,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:water submersion source updated with, time_s:%{public}.09f, water submersio n state:%{public, location:CMSubmersion_Types::CMSubmersionStates}lld}",  buf,  0x26u);
      }

      sub_100D03200((void *)self->_dataBuffers + 48, (__int128 *)var0);
      if ((objc_opt_respondsToSelector(self->_delegate, "didUpdateDataBuffer:") & 1) != 0) {
        -[CLBarometerCalibrationAggregatorClient didUpdateDataBuffer:](self->_delegate, "didUpdateDataBuffer:", 8LL);
      }
      if (v35)
      {
        v145 = (unint64_t *)&v35->__shared_owners_;
        do
          unint64_t v48 = __ldaxr(v145);
        while (__stlxr(v48 - 1, v145));
        goto LABEL_227;
      }

      break;
    case 9uLL:
      v49 = (int64x2_t *)self->_dataBuffers;
      if (v49[29].i64[1] >= 0x258uLL) {
        sub_100D031AC(v49 + 27);
      }
      v50 = *(uint64_t **)var0;
      v35 = (std::__shared_weak_count *)*((void *)var0 + 1);
      __p.__r_.__value_.__r.__words[0] = *(void *)var0;
      __p.__r_.__value_.__l.__size_ = (std::string::size_type)v35;
      if (v35)
      {
        v51 = (unint64_t *)&v35->__shared_owners_;
        do
          unint64_t v52 = __ldxr(v51);
        while (__stxr(v52 + 1, v51));
      }

      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10187F510);
      }
      v53 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v54 = *v50;
        uint64_t v55 = v50[1];
        uint64_t v56 = v50[2];
        *(_DWORD *)buf = 68289794;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(void *)&buf[20] = v54;
        *(_WORD *)&buf[28] = 2050;
        *(void *)&buf[30] = v55;
        *(_WORD *)&buf[38] = 2050;
        *(void *)&buf[40] = v56;
        _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:companion pressure source updated with, time_s:%{public}.09f, pressure (pas cals):%{public}f, uncertainty (pascals):%{public}f}",  buf,  0x30u);
      }

      sub_100D03200((void *)self->_dataBuffers + 54, (__int128 *)var0);
      if ((objc_opt_respondsToSelector(self->_delegate, "didUpdateDataBuffer:") & 1) != 0) {
        -[CLBarometerCalibrationAggregatorClient didUpdateDataBuffer:](self->_delegate, "didUpdateDataBuffer:", 9LL);
      }
      if (v35)
      {
        v57 = (unint64_t *)&v35->__shared_owners_;
        do
          unint64_t v48 = __ldaxr(v57);
        while (__stlxr(v48 - 1, v57));
LABEL_227:
        if (!v48)
        {
          ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
          size = v35;
LABEL_229:
          std::__shared_weak_count::__release_weak(size);
        }
      }

      break;
    default:
      return;
  }

- (array<std::deque<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>,)copyDataBuffersForTrack:(CLBarometerCalibrationSourceAggregator *)self
{
  uint64_t v6 = 0LL;
  dataBuffers = (char *)self->_dataBuffers;
  do
  {
    result = (array<std::deque<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>, 10UL> *)sub_1004908E0((uint64_t)retstr + v6, &dataBuffers[v6]);
    v6 += 48LL;
  }

  while (v6 != 480);
  if (a4 == 3)
  {
    unint64_t start = retstr->__elems_[2].__start_;
    begin = retstr->__elems_[2].__map_.__begin_;
    v11 = (char *)&begin[start >> 8];
    if (retstr->__elems_[2].__map_.__end_ == begin)
    {
      uint64_t v12 = 0LL;
      uint64_t v15 = 0LL;
      uint64_t v14 = (char *)&begin[(retstr->__elems_[2].__size_.__value_ + start) >> 8];
    }

    else
    {
      uint64_t v12 = (double **)(*(void *)v11 + 16LL * start);
      unint64_t v13 = retstr->__elems_[2].__size_.__value_ + start;
      uint64_t v14 = (char *)&begin[v13 >> 8];
      uint64_t v15 = (double **)(*(void *)v14 + 16LL * v13);
    }

    if (v15 == v12
      || (uint64_t v16 = (((uint64_t)v15 - *(void *)v14) >> 4) + 32 * (v14 - v11),
          uint64_t v17 = (uint64_t)v12 - *(void *)v11,
          v16 == v17 >> 4))
    {
      unint64_t v18 = 0LL;
    }

    else
    {
      unint64_t v18 = 63 - __clz(v16 - (v17 >> 4));
    }

    sub_100D03EA8(v11, v12, v14, v15, 2 * v18, 1);
  }

  return result;
}

+ (uint64_t)isLocationUsefulForCalibration:(uint64_t)a3
{
  return (*(_DWORD *)(a3 + 96) < 0xCu) & (0xC12u >> *(_DWORD *)(a3 + 96));
}

- (BOOL)isInOutdoorWorkout
{
  BOOL result = -[CLBarometerCalibrationAggregatorClient isInOutdoorWorkout]( -[CLBarometerCalibrationSourceAggregator delegate](self, "delegate"),  "isInOutdoorWorkout");
  self->_inOutdoorWorkout = result;
  return result;
}

- (double)getLastAltitude
{
  self->_lastAltitude = result;
  return result;
}

- (double)getLastAltitudeTime
{
  self->_lastAltitudeTime = result;
  return result;
}

- (double)getLastAltitudeAccuracy
{
  self->_lastAltitudeAccuracy = result;
  return result;
}

- (void)wetStateUpdated:(unint64_t)a3
{
  if (self->_currentWetState != a3) {
    self->_currentWetState = a3 != 0;
  }
}

- (BOOL)goodSurfaceCalibration:(float)a3
{
  if (v30)
  {
    uint64_t v6 = *v5;
    std::string::size_type v7 = (std::__shared_weak_count *)v5[1];
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        unint64_t v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }

    float v10 = a3 - *(double *)(v6 + 8);
    float v11 = fabsf(v10);
    if (v7)
    {
      uint64_t v12 = (unint64_t *)&v7->__shared_owners_;
      do
        unint64_t v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }

    double v14 = v11;
    BOOL v15 = v11 > 3.0 || !self->_currentWetState;
  }

  else
  {
    BOOL v15 = 1;
    double v14 = -1.0;
  }

  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10187F510);
  }
  uint64_t v16 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    BOOL currentWetState = self->_currentWetState;
    *(_DWORD *)buf = 134219008;
    CFAbsoluteTime v42 = Current;
    __int16 v43 = 2048;
    double v44 = a3;
    __int16 v45 = 2048;
    double v46 = v14;
    __int16 v47 = 1024;
    BOOL v48 = currentWetState;
    __int16 v49 = 1024;
    BOOL v50 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "surface cal check,timestamp,%f,pressure,%f,lastCalDiff,%f,wetState,%d,pass,%d",  buf,  0x2Cu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10187F510);
    }
    uint64_t v20 = qword_1019346A8;
    CFAbsoluteTime v21 = CFAbsoluteTimeGetCurrent();
    BOOL v22 = self->_currentWetState;
    int v31 = 134219008;
    CFAbsoluteTime v32 = v21;
    __int16 v33 = 2048;
    double v34 = a3;
    __int16 v35 = 2048;
    double v36 = v14;
    __int16 v37 = 1024;
    BOOL v38 = v22;
    __int16 v39 = 1024;
    BOOL v40 = v15;
    LODWORD(v25) = 44;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v20,  0LL,  "surface cal check,timestamp,%f,pressure,%f,lastCalDiff,%f,wetState,%d,pass,%d",  COERCE_DOUBLE(&v31),  v25,  v26,  v27,  v28);
    int v24 = (uint8_t *)v23;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationSourceAggregator goodSurfaceCalibration:]",  "%s\n",  v23);
    if (v24 != buf) {
      free(v24);
    }
  }

  sub_10049108C(&v26);
  return v15;
}

- (void)setInOutdoorWorkout:(BOOL)a3
{
  self->_inOutdoorWorkout = a3;
}

- (void)setLastAltitude:(double)a3
{
  self->_lastAltitude = a3;
}

- (void)setLastAltitudeTime:(double)a3
{
  self->_lastAltitudeTime = a3;
}

- (void)setLastAltitudeAccuracy:(double)a3
{
  self->_lastAltitudeAccuracy = a3;
}

- (CLBarometerCalibrationAggregatorClient)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLBarometerCalibrationAggregatorClient *)a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0LL;
  *((void *)self + 4) = 0LL;
  *((void *)self + 3) = (char *)self + 32;
  int64x2_t v2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *((int64x2_t *)self + 9) = v2;
  *((_DWORD *)self + 40) = 3;
  *(int64x2_t *)((char *)self + 168) = v2;
  *((_DWORD *)self + 46) = 3;
  return self;
}

@end