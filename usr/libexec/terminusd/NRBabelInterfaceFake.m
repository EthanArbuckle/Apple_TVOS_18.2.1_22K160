@interface NRBabelInterfaceFake
- (NRBabelInterfaceFake)initWithInstance:(id)a3 link:(id)a4;
- (NRBabelLinkFake)link;
- (id)description;
- (void)sendPacket:(iovec *)a3 iovLen:(unsigned int)a4 toAddr:(const in6_addr *)a5;
- (void)setLink:(id)a3;
@end

@implementation NRBabelInterfaceFake

- (NRBabelInterfaceFake)initWithInstance:(id)a3 link:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___NRBabelInterfaceFake;
  v8 = -[NRBabelInterface initWithInstance:](&v26, "initWithInstance:", v6);
  v9 = v8;
  if (v8)
  {
    -[NRBabelInterface setInstance:](v8, "setInstance:", v6);
    objc_storeStrong((id *)&v9->_link, a4);
    uint64_t v22 = 33022LL;
    int v23 = 0;
    __int16 v24 = __rev16([v7 fakeLinkIndex]);
    __int16 v25 = (unint64_t)[v6 routerID] >> 48;
    -[NRBabelInterface setLocalAddress:](v9, "setLocalAddress:", &v22);
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      id v10 = (id)qword_1001DC8A8;
      v12 = (void *)createIPv6AddrString(&v22, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
      _NRLogWithArgs( v10,  1LL,  "%s%.30s:%-4d %@attached via %@ to [%@]",  ",  "-[NRBabelInterfaceFake initWithInstance:link:]"",  3909LL,  v6,  v12,  v13);
    }

    v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 queue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C05AC;
    block[3] = &unk_1001B0748;
    id v19 = v6;
    v15 = v9;
    v20 = v15;
    id v21 = v7;
    dispatch_async(v14, block);

    v16 = v15;
  }

  else
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 17LL))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      _NRLogWithArgs(qword_1001DC8A8, 17LL, "[super initWithInstance:] failed");
    }
  }

  return v9;
}

- (void)sendPacket:(iovec *)a3 iovLen:(unsigned int)a4 toAddr:(const in6_addr *)a5
{
  if (a4)
  {
    uint64_t v8 = a4;
    if (a4 > 8)
    {
      uint64_t v11 = a4 & 7;
      if (!v11) {
        uint64_t v11 = 8LL;
      }
      uint64_t v9 = a4 - v11;
      p_iov_len = (const double *)&a3[4].iov_len;
      int32x4_t v13 = 0uLL;
      uint64_t v14 = v9;
      int32x4_t v15 = 0uLL;
      do
      {
        v16 = p_iov_len - 8;
        unsigned __int128 v17 = (unsigned __int128)vld2q_f64(v16);
        v18 = p_iov_len - 4;
        unsigned __int128 v19 = (unsigned __int128)vld2q_f64(v18);
        v20 = p_iov_len + 16;
        unsigned __int128 v22 = (unsigned __int128)vld2q_f64(p_iov_len);
        id v21 = p_iov_len + 4;
        unsigned __int128 v23 = (unsigned __int128)vld2q_f64(v21);
        int32x4_t v13 = vaddq_s32(v13, vuzp1q_s32((int32x4_t)v17, (int32x4_t)v19));
        int32x4_t v15 = vaddq_s32(v15, vuzp1q_s32((int32x4_t)v22, (int32x4_t)v23));
        p_iov_len = v20;
        v14 -= 8LL;
      }

      while (v14);
      LODWORD(v10) = vaddvq_s32(vaddq_s32(v15, v13));
    }

    else
    {
      uint64_t v9 = 0LL;
      LODWORD(v10) = 0;
    }

    uint64_t v24 = a4 - v9;
    __int16 v25 = &a3[v9].iov_len;
    do
    {
      int v26 = *(_DWORD *)v25;
      v25 += 2;
      size_t v10 = (v10 + v26);
      --v24;
    }

    while (v24);
    if ((_DWORD)v10)
    {
      v27 = (char *)malloc(v10);
      if (v27)
      {
        v28 = v27;
        v61 = self;
        int v29 = 0;
        v30 = &a3->iov_len;
        do
        {
          int v31 = v29;
          size_t v32 = *v30;
          memcpy(&v28[v29], (const void *)*(v30 - 1), *v30);
          int v29 = v32 + v31;
          v30 += 2;
          --v8;
        }

        while (v8);
        unint64_t v33 = bswap64(*(void *)a5->__u6_addr8);
        unint64_t v34 = 0xFF02000000000000LL;
        if (v33 == 0xFF02000000000000LL)
        {
          unint64_t v34 = 65542LL;
          unint64_t v33 = bswap64(*(void *)&a5->__u6_addr32[2]);
          v35 = v61;
          if (v33 == 65542)
          {
            int v36 = 0;
LABEL_27:
            v60 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:freeWhenDone:",  v28,  v10,  1LL);
            __int128 v71 = 0u;
            __int128 v72 = 0u;
            __int128 v73 = 0u;
            __int128 v74 = 0u;
            id v38 = (id)objc_claimAutoreleasedReturnValue(-[NRBabelLinkFake fakeInterfaces](v35->_link, "fakeInterfaces"));
            id v39 = [v38 countByEnumeratingWithState:&v71 objects:v75 count:16];
            if (v39)
            {
              id v40 = v39;
              uint64_t v41 = *(void *)v72;
              if (v36)
              {
                do
                {
                  for (i = 0LL; i != v40; i = (char *)i + 1)
                  {
                    if (*(void *)v72 != v41) {
                      objc_enumerationMutation(v38);
                    }
                    v43 = *(NRBabelInterfaceFake **)(*((void *)&v71 + 1) + 8LL * (void)i);
                    v44 = -[NRBabelInterface localAddress](v43, "localAddress");
                    if (*(void *)v44->__u6_addr8 == *(void *)a5->__u6_addr8
                      && *(void *)&v44->__u6_addr32[2] == *(void *)&a5->__u6_addr32[2])
                    {
                      v46 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInterface instance](v43, "instance"));
                      v47 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v46 queue]);
                      v62 = _NSConcreteStackBlock;
                      uint64_t v63 = 3221225472LL;
                      v64 = sub_1000C0510;
                      v65 = &unk_1001AF180;
                      v66 = v60;
                      v67 = v61;
                      int v70 = v10;
                      v68 = v43;
                      v69 = a5;
                      dispatch_async(v47, &v62);
                    }
                  }

                  id v40 = [v38 countByEnumeratingWithState:&v71 objects:v75 count:16];
                }

                while (v40);
              }

              else
              {
                id v59 = v38;
                do
                {
                  for (j = 0LL; j != v40; j = (char *)j + 1)
                  {
                    if (*(void *)v72 != v41) {
                      objc_enumerationMutation(v59);
                    }
                    v49 = *(NRBabelInterfaceFake **)(*((void *)&v71 + 1) + 8LL * (void)j);
                    if (v49 != v61)
                    {
                      v51 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v50 queue]);
                      v62 = _NSConcreteStackBlock;
                      uint64_t v63 = 3221225472LL;
                      v64 = sub_1000C0510;
                      v65 = &unk_1001AF180;
                      v66 = v60;
                      v67 = v61;
                      int v70 = v10;
                      v68 = v49;
                      v69 = a5;
                      dispatch_async(v51, &v62);
                    }
                  }

                  id v40 = [v59 countByEnumeratingWithState:&v71 objects:v75 count:16];
                  id v38 = v59;
                }

                while (v40);
              }
            }

            return;
          }
        }

        else
        {
          v35 = v61;
        }

        if (v34 < v33) {
          int v36 = -1;
        }
        else {
          int v36 = 1;
        }
        goto LABEL_27;
      }

      id v52 = sub_1000B07C8();
      int IsLevelEnabled = _NRLogIsLevelEnabled(v52, 16LL);

      if (IsLevelEnabled)
      {
        id v54 = sub_1000B07C8();
        _NRLogWithArgs(v54, 16LL, "%s%.30s:%-4d ABORTING: strict_malloc(%zu) failed", ", "strict_malloc"", 79, v10);
      }

      p_class_meths = (__objc2_meth_list **)_os_log_pack_size(22LL);
      v55 = (char *)&v59 - ((__chkstk_darwin(p_class_meths) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      v56 = __error();
      uint64_t v57 = _os_log_pack_fill( v55,  p_class_meths,  *v56,  &_mh_execute_header,  "%{public}s strict_malloc(%zu) failed");
      *(_DWORD *)uint64_t v57 = 136446466;
      *(void *)(v57 + 4) = "strict_malloc";
      *(_WORD *)(v57 + 12) = 2048;
      *(void *)(v57 + 14) = v10;
      id v58 = sub_1000B07C8();
      _NRLogAbortWithPack(v58, v55);
      goto LABEL_52;
    }
  }

  if (qword_1001DC8B0 != -1) {
    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
  }
  p_class_meths = &OBJC_PROTOCOL___NRBTLinkPreferencesAgentDelegate.class_meths;
  if (_NRLogIsLevelEnabled(qword_1001DC8A8, 17LL))
  {
    if (qword_1001DC8B0 == -1)
    {
LABEL_22:
      _NRLogWithArgs(p_class_meths[277], 17LL, "fullLen is 0");
      return;
    }

- (id)description
{
  return -[NRBabelLinkFake name](self->_link, "name");
}

- (NRBabelLinkFake)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
}

- (void).cxx_destruct
{
}

@end