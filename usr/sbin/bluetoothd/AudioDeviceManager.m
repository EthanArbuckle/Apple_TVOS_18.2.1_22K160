@interface AudioDeviceManager
+ (id)sharedManager;
- (AudioDeviceManager)init;
- (AudioSkywalkProvider)getAudioSkywalkProvider;
- (basic_string<char,)getClientBundleIDs;
- (dispatch_queue_s)getXpcQueue;
- (id).cxx_construct;
- (void)configureXPCListener;
- (void)dealloc;
- (void)forwardEvent:(void *)a3 forUid:()basic_string<char;
- (void)getDeviceForUID:()basic_string<char;
- (void)handleListenerEvent:(void *)a3;
- (void)publishAndRegisterDevice:(int)a3 withArgs:(void *)a4 uid:()basic_string<char device:()std:(std::allocator<char>> *)a5 :char_traits<char>;
- (void)removeXpcClient:(void *)a3;
- (void)republishAllAudioDevices;
- (void)sendMsg:(int)a3 withArgs:(void *)a4 uid:()basic_string<char;
@end

@implementation AudioDeviceManager

+ (id)sharedManager
{
  if (qword_1008EFE08 != -1) {
    dispatch_once(&qword_1008EFE08, &stru_1008905A0);
  }
  return (id)qword_1008EFE00;
}

- (AudioDeviceManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AudioDeviceManager;
  v2 = -[AudioDeviceManager init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, -1);
    v2->_queue = dispatch_queue_create("AudioDeviceManager", v4);
    -[AudioDeviceManager configureXPCListener](v2, "configureXPCListener");
  }

  return v2;
}

- (void)dealloc
{
  self->_audioSkywalkProvider = 0LL;
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___AudioDeviceManager;
  -[AudioDeviceManager dealloc](&v2, "dealloc");
}

- (void)configureXPCListener
{
  mach_service = xpc_connection_create_mach_service("com.apple.BTAudioHALPlugin.xpc", self->_queue, 1uLL);
  self->_listener = mach_service;
  if (mach_service)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1002ED340;
    handler[3] = &unk_1008905C8;
    handler[4] = self;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_resume(self->_listener);
  }

- (void)handleListenerEvent:(void *)a3
{
  xpc_type_t type = xpc_get_type(a3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    v14 = (os_log_s *)qword_1008F7570;
    if (os_log_type_enabled((os_log_t)qword_1008F7570, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 134217984;
      v39 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "AudioDeviceManager received new xpc connection from %p",  (uint8_t *)&v38,  0xCu);
    }

    v15 = (XpcAudioPluginClient *)operator new(0x20uLL);
    sub_1004C34C4((int)v15, (xpc_connection_t)a3);
    value = self->xpcClients.__end_cap_.__value_;
    end = self->xpcClients.__end_;
    if (end >= value)
    {
      begin = self->xpcClients.__begin_;
      uint64_t v28 = end - begin;
      uint64_t v29 = (char *)value - (char *)begin;
      uint64_t v30 = v29 >> 2;
      else {
        unint64_t v31 = v30;
      }
      if (v31) {
        v32 = (char *)sub_100008BA0((uint64_t)&self->xpcClients.__end_cap_, v31);
      }
      else {
        v32 = 0LL;
      }
      v33 = (XpcAudioPluginClient **)&v32[8 * v28];
      v34 = (XpcAudioPluginClient **)&v32[8 * v31];
      *v33 = v15;
      v18 = v33 + 1;
      v36 = self->xpcClients.__begin_;
      v35 = self->xpcClients.__end_;
      if (v35 != v36)
      {
        do
        {
          v37 = *--v35;
          *--v33 = v37;
        }

        while (v35 != v36);
        v35 = self->xpcClients.__begin_;
      }

      self->xpcClients.__begin_ = v33;
      self->xpcClients.__end_ = v18;
      self->xpcClients.__end_cap_.__value_ = v34;
      if (v35) {
        operator delete(v35);
      }
    }

    else
    {
      *end = v15;
      v18 = end + 1;
    }

    self->xpcClients.__end_ = v18;
  }

  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(a3, _xpc_error_key_description);
    v20 = (os_log_s *)qword_1008F7570;
    if (os_log_type_enabled((os_log_t)qword_1008F7570, OS_LOG_TYPE_ERROR)) {
      sub_10066AEC4((uint64_t)string, v20, v21, v22, v23, v24, v25, v26);
    }
  }

  else
  {
    objc_super v6 = xpc_copy_description(a3);
    v7 = (os_log_s *)qword_1008F7570;
    if (os_log_type_enabled((os_log_t)qword_1008F7570, OS_LOG_TYPE_ERROR)) {
      sub_10066AF28((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
    free(v6);
  }

- (void)publishAndRegisterDevice:(int)a3 withArgs:(void *)a4 uid:()basic_string<char device:()std:(std::allocator<char>> *)a5 :char_traits<char>
{
  uint64_t v6 = v5;
  uint64_t v9 = *(void *)&a3;
  else {
    unint64_t var1 = *((unsigned __int8 *)&a5->var0.var0.var0.var1 + 23);
  }
  uint64_t v12 = (os_log_s *)qword_1008F7570;
  if (!var1 && os_log_type_enabled((os_log_t)qword_1008F7570, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "[AudioDeviceManager publishAndRegisterDevice:] uid is empty",  buf,  2u);
    uint64_t v12 = (os_log_s *)qword_1008F7570;
    if (v6) {
      goto LABEL_9;
    }
  }

  else if (v6)
  {
    goto LABEL_9;
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "[AudioDeviceManager publishAndRegisterDevice:] device is nil",  buf,  2u);
    uint64_t v12 = (os_log_s *)qword_1008F7570;
  }

- (void)sendMsg:(int)a3 withArgs:(void *)a4 uid:()basic_string<char
{
  *(_OWORD *)keys = *(_OWORD *)off_1008905E8;
  v42 = "kBTAudioMsgArgs";
  xpc_object_t values = xpc_int64_create(a3);
  var0 = a5;
  xpc_object_t object = xpc_string_create((const char *)var0);
  v40 = a4;
  if (a4) {
    size_t v10 = 3LL;
  }
  else {
    size_t v10 = 2LL;
  }
  xpc_object_t v11 = xpc_dictionary_create((const char *const *)keys, &values, v10);
  uint64_t v12 = (os_log_s *)qword_1008F7570;
  if (os_log_type_enabled((os_log_t)qword_1008F7570, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v31 = a5;
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v35 = a3;
    *(_WORD *)&v35[4] = 2082;
    *(void *)&v35[6] = v31;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Sending XPC message %d for %{public}s",  buf,  0x12u);
  }

  if (a3 == 4)
  {
    if (*((char *)&a5->var0.var0.var0.var1 + 23) < 0)
    {
      if (!a5->var0.var0.var0.var1.var1) {
        goto LABEL_12;
      }
    }

    else if (!*((_BYTE *)&a5->var0.var0.var0.var1 + 23))
    {
LABEL_12:
      uint64_t v13 = (os_log_s *)qword_1008F7570;
      if (os_log_type_enabled((os_log_t)qword_1008F7570, OS_LOG_TYPE_FAULT)) {
        sub_10066AFC8(v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }

    v33[0] = 0LL;
    v33[1] = 0LL;
    sub_100242F28((uint64_t)v33, (uint64_t)&self->audioDeviceMapMutex);
    uint64_t v21 = (AudioDeviceManager *)sub_100024098((uint64_t)&self->audioDevices, (const void **)a5);
    if (&self->audioDevices.__tree_.__pair1_ != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *)v21)
    {
      left = v21->audioDevices.__tree_.__pair1_.__value_.__left_;
      uint64_t v23 = sub_1002EE40C((uint64_t **)&self->audioDevices, (const void **)a5);
      uint64_t v24 = (os_log_s *)qword_1008F7570;
      if (os_log_type_enabled((os_log_t)qword_1008F7570, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t value = self->audioDevices.__tree_.__pair3_.__value_;
        *(_DWORD *)buf = 134218498;
        *(void *)v35 = v23;
        *(_WORD *)&v35[8] = 2082;
        *(void *)&v35[10] = a5;
        __int16 v36 = 2048;
        unint64_t v37 = value;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Erased %lu audio device %{public}s from audio device map. Map now has %lu devices",  buf,  0x20u);
      }

      uint64_t v26 = (void *)[AudioDeviceManager sharedManager];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1002EDAE8;
      block[3] = &unk_10087EB20;
      block[4] = left;
      dispatch_async((dispatch_queue_t)[v26 getXpcQueue], block);
    }

    sub_100242F54((uint64_t)v33);
    sub_100242FAC((uint64_t)v33);
  }

  begin = (uint64_t *)self->xpcClients.__begin_;
  end = self->xpcClients.__end_;
  do
  {
    uint64_t v29 = (_xpc_connection_s *)sub_1001EC460(*begin);
    xpc_connection_send_message(v29, v11);
    ++begin;
  }

  while (begin != (uint64_t *)end);
  if (self->xpcClients.__end_ == self->xpcClients.__begin_)
  {
LABEL_24:
    uint64_t v30 = (os_log_s *)qword_1008F7570;
    if (os_log_type_enabled((os_log_t)qword_1008F7570, OS_LOG_TYPE_ERROR)) {
      sub_10066AF8C(v30);
    }
  }

  xpc_release(v11);
  xpc_release(object);
  xpc_release(values);
}

- (void)republishAllAudioDevices
{
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *)self->audioDevices.__tree_.__begin_node_;
  p_pair1 = &self->audioDevices.__tree_.__pair1_;
  if (begin_node != &self->audioDevices.__tree_.__pair1_)
  {
    do
    {
      v4 = (os_log_s *)qword_1008F7570;
      if (os_log_type_enabled((os_log_t)qword_1008F7570, OS_LOG_TYPE_DEFAULT))
      {
        left = begin_node + 4;
        if (SHIBYTE(begin_node[6].__value_.__left_) < 0) {
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *)left->__value_.__left_;
        }
        *(_DWORD *)buf = 136315138;
        size_t v10 = left;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Republishing %s", buf, 0xCu);
      }

      sub_100295780((uint64_t)begin_node[7].__value_.__left_);
      uint64_t v6 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *)begin_node[1].__value_.__left_;
      if (v6)
      {
        do
        {
          v7 = v6;
          uint64_t v6 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *)v6->__value_.__left_;
        }

        while (v6);
      }

      else
      {
        do
        {
          v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v8 = v7->__value_.__left_ == begin_node;
          begin_node = v7;
        }

        while (!v8);
      }

      begin_node = v7;
    }

    while (v7 != p_pair1);
  }

- (void)forwardEvent:(void *)a3 forUid:()basic_string<char
{
  var0 = a4;
  v7 = (char *)&a4->var0.var0.var0.var1 + 23;
  if (*((char *)&a4->var0.var0.var0.var1 + 23) < 0)
  {
    sub_100024238(__p, a4->var0.var0.var0.var1.var0, a4->var0.var0.var0.var1.var1);
  }

  else
  {
    *(_OWORD *)__p = *(_OWORD *)a4->var0.var0.var0.var0.var0;
    uint64_t v12 = *((void *)&a4->var0.var0.var0.var1 + 2);
  }

  BOOL v8 = -[AudioDeviceManager getDeviceForUID:](self, "getDeviceForUID:", __p);
  if (SHIBYTE(v12) < 0) {
    operator delete(__p[0]);
  }
  uint64_t v9 = (os_log_s *)qword_1008F7570;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F7570, OS_LOG_TYPE_DEBUG)) {
      sub_10066AFF8(v7, var0, v9);
    }
    sub_1002953C0((uint64_t)v8, a3);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7570, OS_LOG_TYPE_ERROR))
  {
    if (*v7 < 0) {
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)var0->var0.var0.var0.var1.var0;
    }
    int int64 = xpc_dictionary_get_int64(a3, "kBTAudioMsgId");
    *(_DWORD *)buf = 136446466;
    uint64_t v14 = var0;
    __int16 v15 = 1024;
    int v16 = int64;
    _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "No device found for uid %{public}s to send msg %u",  buf,  0x12u);
  }

- (void)getDeviceForUID:()basic_string<char
{
  v15[0] = 0LL;
  v15[1] = 0LL;
  sub_100242F28((uint64_t)v15, (uint64_t)&self->audioDeviceMapMutex);
  if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0)
  {
    if (a3->var0.var0.var0.var1.var1) {
      goto LABEL_7;
    }
  }

  else if (*((_BYTE *)&a3->var0.var0.var0.var1 + 23))
  {
    goto LABEL_7;
  }

  uint64_t v5 = (os_log_s *)qword_1008F7570;
  if (os_log_type_enabled((os_log_t)qword_1008F7570, OS_LOG_TYPE_FAULT)) {
    sub_10066B078(v5, v6, v7, v8, v9, v10, v11, v12);
  }
LABEL_7:
  else {
    uint64_t v13 = *(void **)sub_1002EDE6C((uint64_t)&self->audioDevices, (const void **)a3);
  }
  sub_100242FAC((uint64_t)v15);
  return v13;
}

- (AudioSkywalkProvider)getAudioSkywalkProvider
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002EDF20;
  block[3] = &unk_10087EA48;
  block[4] = self;
  if (qword_1008EFE10 != -1) {
    dispatch_once(&qword_1008EFE10, block);
  }
  return self->_audioSkywalkProvider;
}

- (basic_string<char,)getClientBundleIDs
{
  *(_OWORD *)retstr->var0.var0.var0.var0.var0 = 0uLL;
  *((void *)&retstr->var0.var0.var0.var1 + 2) = 0LL;
  objc_super v2 = (char **)result->var0.var1.var0[0];
  for (unint64_t i = result->var0.var1.var0[1]; v2 != (char **)i; ++v2)
  {
    sub_1004C3588(*v2, (uint64_t)&v9);
    uint64_t v5 = std::string::append(&v9, ",");
    __int128 v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
    int64_t cap = v5->__r_.__value_.__l.__cap_;
    *(_OWORD *)__p = v6;
    v5->__r_.__value_.__l.__size_ = 0LL;
    v5->__r_.__value_.__l.__cap_ = 0LL;
    v5->__r_.__value_.__r.__words[0] = 0LL;
    if (cap >= 0) {
      uint64_t v7 = __p;
    }
    else {
      uint64_t v7 = (void **)__p[0];
    }
    if (cap >= 0) {
      std::string::size_type v8 = HIBYTE(cap);
    }
    else {
      std::string::size_type v8 = (std::string::size_type)__p[1];
    }
    result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)std::string::append( (std::string *)retstr,  (const std::string::value_type *)v7,  v8);
    if (SHIBYTE(cap) < 0) {
      operator delete(__p[0]);
    }
  }

  return result;
}

- (void)removeXpcClient:(void *)a3
{
  std::string::size_type v8 = a3;
  uint64_t v5 = (os_log_s *)qword_1008F7570;
  if (os_log_type_enabled((os_log_t)qword_1008F7570, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v10 = sub_1001EC460((uint64_t)a3);
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "AudioDeviceManager removing xpc client for connection %p",  buf,  0xCu);
  }

  __int128 v6 = (XpcAudioPluginClient **)sub_1002EE1D4(self->xpcClients.__begin_, self->xpcClients.__end_, &v8);
  if (self->xpcClients.__end_ != v6) {
    self->xpcClients.__end_ = v6;
  }
  if (v8)
  {
    uint64_t v7 = (void *)sub_1004C351C();
    operator delete(v7);
  }

- (dispatch_queue_s)getXpcQueue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  begin = self->xpcClients.__begin_;
  if (begin)
  {
    self->xpcClients.__end_ = begin;
    operator delete(begin);
  }

- (id).cxx_construct
{
  self->xpcClients.__begin_ = 0LL;
  self->xpcClients.__end_ = 0LL;
  self->audioDevices.__tree_.__pair3_.__value_ = 0LL;
  self->audioDevices.__tree_.__pair1_.__value_.__left_ = 0LL;
  self->xpcClients.__end_cap_.__value_ = 0LL;
  self->audioDevices.__tree_.__begin_node_ = &self->audioDevices.__tree_.__pair1_;
  sub_100242DC4(&self->audioDeviceMapMutex);
  return self;
}

@end