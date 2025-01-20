@interface UMDVolumeHelper
- (BOOL)createVolumeWithSession:(id)a3 size:(int64_t)a4 userName:(id)a5 error:(int *)a6 forPersona:(BOOL)a7 userDataVolume:(BOOL)a8;
- (BOOL)deleteVolumeWithSession:(id)a3 error:(int *)a4;
- (BOOL)isVolumeMountedWithSession:(id)a3 fsid:(fsid *)a4;
- (BOOL)mountVolumeWithSession:(id)a3 mountPath:(id)a4 error:(int *)a5 forPersona:(BOOL)a6;
- (BOOL)splitUserVolumeEnabled;
- (BOOL)unmountVolumeWithSession:(id)a3 mountPath:(id)a4 error:(int *)a5;
- (BOOL)unmountVolumeWithSession:(id)a3 mountPath:(id)a4 error:(int *)a5 force:(BOOL)a6;
- (UMDSideEffects)se;
- (void)createVolumeMountsDir:(id)a3;
@end

@implementation UMDVolumeHelper

- (void)createVolumeMountsDir:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UMDVolumeHelper se](self, "se"));
  uint64_t v6 = sub_100019434((uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unsigned int v8 = [v7 fileExistsAtPath:v4 isDirectory:0];

  if (!v8)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UMDVolumeHelper se](self, "se"));
    uint64_t v14 = sub_100019434((uint64_t)v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    int v16 = [v15 makePath:v4 mode:511 error:0];

    if ((v16 & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UMDVolumeHelper se](self, "se"));
      uint64_t v18 = sub_100019434((uint64_t)v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      unsigned __int8 v20 = [v19 chmodPath:v4 withMode:511 error:0];

      if ((v20 & 1) != 0)
      {
        if (qword_1000DBC08 != -1) {
          dispatch_once(&qword_1000DBC08, &stru_1000CDBA8);
        }
        v9 = (os_log_s *)(id)qword_1000DBC00;
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_40;
        }
        uint64_t v28 = 0LL;
        unsigned int v21 = sub_100053B4C(0);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v22 = v21;
        }
        else {
          uint64_t v22 = v21 & 0xFFFFFFFE;
        }
        if (!(_DWORD)v22) {
          goto LABEL_38;
        }
        int v29 = 138543362;
        id v30 = v4;
        v12 = (const char *)_os_log_send_and_compose_impl( v22,  &v28,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "Created volume mounts directory %{public}@",  &v29,  12);
      }

      else
      {
        if (qword_1000DBC08 != -1) {
          dispatch_once(&qword_1000DBC08, &stru_1000CDBA8);
        }
        v9 = (os_log_s *)(id)qword_1000DBC00;
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          goto LABEL_40;
        }
        uint64_t v28 = 0LL;
        unsigned int v25 = sub_100053B4C(0);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          uint64_t v26 = v25;
        }
        else {
          uint64_t v26 = v25 & 0xFFFFFFFE;
        }
        if (!(_DWORD)v26) {
          goto LABEL_38;
        }
        int v29 = 138543362;
        id v30 = v4;
        v12 = (const char *)_os_log_send_and_compose_impl( v26,  &v28,  0LL,  0LL,  &_mh_execute_header,  v9,  16LL,  "Failed to set permissions on volume mounts directory %{public}@",  &v29,  12);
      }
    }

    else
    {
      if (qword_1000DBC08 != -1) {
        dispatch_once(&qword_1000DBC08, &stru_1000CDBA8);
      }
      v9 = (os_log_s *)(id)qword_1000DBC00;
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
      uint64_t v28 = 0LL;
      unsigned int v23 = sub_100053B4C(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        uint64_t v24 = v23;
      }
      else {
        uint64_t v24 = v23 & 0xFFFFFFFE;
      }
      if (!(_DWORD)v24) {
        goto LABEL_38;
      }
      int v29 = 138543362;
      id v30 = v4;
      v12 = (const char *)_os_log_send_and_compose_impl( v24,  &v28,  0LL,  0LL,  &_mh_execute_header,  v9,  16LL,  "Failed to create volume mounts directory %{public}@",  &v29,  12);
    }

- (BOOL)unmountVolumeWithSession:(id)a3 mountPath:(id)a4 error:(int *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v32 = 0;
  if (a5) {
    *a5 = 0;
  }
  id v10 = v9;
  uint64_t v11 = v10;
  if (!v10)
  {
    id v12 = sub_1000850A0(v8, (uint64_t)@"MKBUserSessionHomeDir");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v12);
  }

  if (-[UMDVolumeHelper unmountVolumeWithSession:mountPath:error:force:]( self,  "unmountVolumeWithSession:mountPath:error:force:",  v8,  v10,  &v32,  0LL))
  {
    goto LABEL_18;
  }

  if (qword_1000DBC08 != -1) {
    dispatch_once(&qword_1000DBC08, &stru_1000CDBA8);
  }
  v13 = (os_log_s *)(id)qword_1000DBC00;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = 0LL;
    unsigned int v14 = sub_100053B4C(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = v14 & 0xFFFFFFFE;
    }
    if ((_DWORD)v15)
    {
      int v33 = 138412546;
      v34 = v11;
      __int16 v35 = 1024;
      int v36 = v32;
      int v16 = (const char *)_os_log_send_and_compose_impl( v15,  &v31,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "Failed to unmount volume at %@ (%d), retrying with force unmount",  &v33,  18);
      v17 = (char *)v16;
      if (v16) {
        sub_100053B7C(v16);
      }
    }

    else
    {
      v17 = 0LL;
    }

    free(v17);
  }

  if (-[UMDVolumeHelper unmountVolumeWithSession:mountPath:error:force:]( self,  "unmountVolumeWithSession:mountPath:error:force:",  v8,  v10,  &v32,  1LL))
  {
LABEL_18:
    if (qword_1000DBC08 != -1) {
      dispatch_once(&qword_1000DBC08, &stru_1000CDBA8);
    }
    uint64_t v18 = (os_log_s *)(id)qword_1000DBC00;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = 0LL;
      unsigned int v19 = sub_100053B4C(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = v19 & 0xFFFFFFFE;
      }
      if ((_DWORD)v20)
      {
        int v33 = 138412290;
        v34 = v11;
        LODWORD(v30) = 12;
        unsigned int v21 = (const char *)_os_log_send_and_compose_impl( v20,  &v31,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "Unmounted volume at %@",  &v33,  v30);
        uint64_t v22 = (char *)v21;
        if (v21) {
          sub_100053B7C(v21);
        }
      }

      else
      {
        uint64_t v22 = 0LL;
      }

      free(v22);
    }

    BOOL v28 = 1;
  }

  else
  {
    if (qword_1000DBC08 != -1) {
      dispatch_once(&qword_1000DBC08, &stru_1000CDBA8);
    }
    unsigned int v23 = (os_log_s *)(id)qword_1000DBC00;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = 0LL;
      unsigned int v24 = sub_100053B4C(0);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v25 = v24;
      }
      else {
        uint64_t v25 = v24 & 0xFFFFFFFE;
      }
      if ((_DWORD)v25)
      {
        int v33 = 138412546;
        v34 = v11;
        __int16 v35 = 1024;
        int v36 = v32;
        LODWORD(v30) = 18;
        uint64_t v26 = (const char *)_os_log_send_and_compose_impl( v25,  &v31,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "Failed to force unmount volume at %@ (%d)",  &v33,  v30);
        v27 = (char *)v26;
        if (v26) {
          sub_100053B7C(v26);
        }
      }

      else
      {
        v27 = 0LL;
      }

      free(v27);
    }

    BOOL v28 = 0;
    if (a5) {
      *a5 = v32;
    }
  }

  return v28;
}

- (BOOL)createVolumeWithSession:(id)a3 size:(int64_t)a4 userName:(id)a5 error:(int *)a6 forPersona:(BOOL)a7 userDataVolume:(BOOL)a8
{
  id v9 = a3;
  id v10 = a5;
  BOOL result = _os_crash("This should never be called");
  __break(1u);
  return result;
}

- (BOOL)deleteVolumeWithSession:(id)a3 error:(int *)a4
{
  id v4 = a3;
  BOOL result = _os_crash("This should never be called");
  __break(1u);
  return result;
}

- (BOOL)mountVolumeWithSession:(id)a3 mountPath:(id)a4 error:(int *)a5 forPersona:(BOOL)a6
{
  id v7 = a3;
  id v8 = a4;
  BOOL result = _os_crash("This should never be called");
  __break(1u);
  return result;
}

- (BOOL)unmountVolumeWithSession:(id)a3 mountPath:(id)a4 error:(int *)a5 force:(BOOL)a6
{
  id v7 = a3;
  id v8 = a4;
  BOOL result = _os_crash("This should never be called");
  __break(1u);
  return result;
}

- (BOOL)isVolumeMountedWithSession:(id)a3 fsid:(fsid *)a4
{
  id v4 = a3;
  BOOL result = _os_crash("This should never be called");
  __break(1u);
  return result;
}

- (UMDSideEffects)se
{
  return self->_se;
}

- (BOOL)splitUserVolumeEnabled
{
  return self->_splitUserVolumeEnabled;
}

- (void).cxx_destruct
{
}

@end