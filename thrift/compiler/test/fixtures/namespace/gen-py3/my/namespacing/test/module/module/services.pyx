#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from libcpp.memory cimport shared_ptr, make_shared, unique_ptr, make_unique
from libcpp.string cimport string
from libcpp cimport bool as cbool
from cpython cimport bool as pbool
from libc.stdint cimport int8_t, int16_t, int32_t, int64_t
from libcpp.vector cimport vector
from libcpp.set cimport set as cset
from libcpp.map cimport map as cmap
from cython.operator cimport dereference as deref
from cpython.ref cimport PyObject
from thrift.py3.exceptions cimport cTApplicationException
from thrift.py3.server cimport ServiceInterface
from folly cimport (
  cFollyPromise,
  cFollyUnit,
  c_unit
)
cimport my.namespacing.test.module.module.types
import my.namespacing.test.module.module.types

import asyncio
import functools
import sys
import traceback

from my.namespacing.test.module.module.services_wrapper cimport cTestServiceInterface


cdef extern from "<utility>" namespace "std":
    cdef cFollyPromise[unique_ptr[string]] move(cFollyPromise[unique_ptr[string]])
    cdef cFollyPromise[int64_t] move(
        cFollyPromise[int64_t])

cdef class Promise_i64:
    cdef cFollyPromise[int64_t] cPromise

    @staticmethod
    cdef create(cFollyPromise[int64_t] cPromise):
        inst = <Promise_i64>Promise_i64.__new__(Promise_i64)
        inst.cPromise = move(cPromise)
        return inst

cdef api void call_cy_TestService_init(
    object self,
    cFollyPromise[int64_t] cPromise,
    int64_t int1
) with gil:
    promise = Promise_i64.create(move(cPromise))
    arg_int1 = int1
    asyncio.run_coroutine_threadsafe(
        TestService_init_coro(
            self,
            promise,
            arg_int1),
        loop=self.loop)

async def TestService_init_coro(
    object self,
    Promise_i64 promise,
    int1
):
    try:
      result = await self.init(
          int1)
    except Exception as ex:
        print(
            "Unexpected error in service handler init:",
            file=sys.stderr)
        traceback.print_exc()
        promise.cPromise.setException(cTApplicationException(
            repr(ex).encode('UTF-8')
        ))
    else:
        promise.cPromise.setValue(<int64_t> result)


cdef class TestServiceInterface(
    ServiceInterface
):
    def __cinit__(self):
        self.interface_wrapper = cTestServiceInterface(<PyObject *> self)

    async def init(
            self,
            int1):
        raise NotImplementedError("async def init is not implemented")


